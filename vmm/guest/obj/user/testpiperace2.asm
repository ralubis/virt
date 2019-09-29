
vmm/guest/obj/user/testpiperace2:     file format elf64-x86-64


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
  80003c:	e8 e3 02 00 00       	callq  800324 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 30          	sub    $0x30,%rsp
  80004b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80004e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  800052:	48 bf 80 49 80 00 00 	movabs $0x804980,%rdi
  800059:	00 00 00 
  80005c:	b8 00 00 00 00       	mov    $0x0,%eax
  800061:	48 ba 06 06 80 00 00 	movabs $0x800606,%rdx
  800068:	00 00 00 
  80006b:	ff d2                	callq  *%rdx
  80006d:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800071:	48 89 c7             	mov    %rax,%rdi
  800074:	48 b8 1b 3d 80 00 00 	movabs $0x803d1b,%rax
  80007b:	00 00 00 
  80007e:	ff d0                	callq  *%rax
  800080:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800083:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800087:	79 30                	jns    8000b9 <umain+0x76>
  800089:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80008c:	89 c1                	mov    %eax,%ecx
  80008e:	48 ba a2 49 80 00 00 	movabs $0x8049a2,%rdx
  800095:	00 00 00 
  800098:	be 0e 00 00 00       	mov    $0xe,%esi
  80009d:	48 bf ab 49 80 00 00 	movabs $0x8049ab,%rdi
  8000a4:	00 00 00 
  8000a7:	b8 00 00 00 00       	mov    $0x0,%eax
  8000ac:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  8000b3:	00 00 00 
  8000b6:	41 ff d0             	callq  *%r8
  8000b9:	48 b8 63 22 80 00 00 	movabs $0x802263,%rax
  8000c0:	00 00 00 
  8000c3:	ff d0                	callq  *%rax
  8000c5:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8000c8:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000cc:	79 30                	jns    8000fe <umain+0xbb>
  8000ce:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000d1:	89 c1                	mov    %eax,%ecx
  8000d3:	48 ba c3 49 80 00 00 	movabs $0x8049c3,%rdx
  8000da:	00 00 00 
  8000dd:	be 10 00 00 00       	mov    $0x10,%esi
  8000e2:	48 bf ab 49 80 00 00 	movabs $0x8049ab,%rdi
  8000e9:	00 00 00 
  8000ec:	b8 00 00 00 00       	mov    $0x0,%eax
  8000f1:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  8000f8:	00 00 00 
  8000fb:	41 ff d0             	callq  *%r8
  8000fe:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800102:	0f 85 c0 00 00 00    	jne    8001c8 <umain+0x185>
  800108:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80010b:	89 c7                	mov    %eax,%edi
  80010d:	48 b8 d2 27 80 00 00 	movabs $0x8027d2,%rax
  800114:	00 00 00 
  800117:	ff d0                	callq  *%rax
  800119:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800120:	e9 8a 00 00 00       	jmpq   8001af <umain+0x16c>
  800125:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  800128:	ba 67 66 66 66       	mov    $0x66666667,%edx
  80012d:	89 c8                	mov    %ecx,%eax
  80012f:	f7 ea                	imul   %edx
  800131:	c1 fa 02             	sar    $0x2,%edx
  800134:	89 c8                	mov    %ecx,%eax
  800136:	c1 f8 1f             	sar    $0x1f,%eax
  800139:	29 c2                	sub    %eax,%edx
  80013b:	89 d0                	mov    %edx,%eax
  80013d:	c1 e0 02             	shl    $0x2,%eax
  800140:	01 d0                	add    %edx,%eax
  800142:	01 c0                	add    %eax,%eax
  800144:	29 c1                	sub    %eax,%ecx
  800146:	89 ca                	mov    %ecx,%edx
  800148:	85 d2                	test   %edx,%edx
  80014a:	75 20                	jne    80016c <umain+0x129>
  80014c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80014f:	89 c6                	mov    %eax,%esi
  800151:	48 bf cc 49 80 00 00 	movabs $0x8049cc,%rdi
  800158:	00 00 00 
  80015b:	b8 00 00 00 00       	mov    $0x0,%eax
  800160:	48 ba 06 06 80 00 00 	movabs $0x800606,%rdx
  800167:	00 00 00 
  80016a:	ff d2                	callq  *%rdx
  80016c:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80016f:	be 0a 00 00 00       	mov    $0xa,%esi
  800174:	89 c7                	mov    %eax,%edi
  800176:	48 b8 4c 28 80 00 00 	movabs $0x80284c,%rax
  80017d:	00 00 00 
  800180:	ff d0                	callq  *%rax
  800182:	48 b8 89 1a 80 00 00 	movabs $0x801a89,%rax
  800189:	00 00 00 
  80018c:	ff d0                	callq  *%rax
  80018e:	bf 0a 00 00 00       	mov    $0xa,%edi
  800193:	48 b8 d2 27 80 00 00 	movabs $0x8027d2,%rax
  80019a:	00 00 00 
  80019d:	ff d0                	callq  *%rax
  80019f:	48 b8 89 1a 80 00 00 	movabs $0x801a89,%rax
  8001a6:	00 00 00 
  8001a9:	ff d0                	callq  *%rax
  8001ab:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8001af:	81 7d fc c7 00 00 00 	cmpl   $0xc7,-0x4(%rbp)
  8001b6:	0f 8e 69 ff ff ff    	jle    800125 <umain+0xe2>
  8001bc:	48 b8 a8 03 80 00 00 	movabs $0x8003a8,%rax
  8001c3:	00 00 00 
  8001c6:	ff d0                	callq  *%rax
  8001c8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8001cb:	25 ff 03 00 00       	and    $0x3ff,%eax
  8001d0:	48 98                	cltq   
  8001d2:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8001d9:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8001e0:	00 00 00 
  8001e3:	48 01 d0             	add    %rdx,%rax
  8001e6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8001ea:	eb 4d                	jmp    800239 <umain+0x1f6>
  8001ec:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8001ef:	89 c7                	mov    %eax,%edi
  8001f1:	48 b8 df 3f 80 00 00 	movabs $0x803fdf,%rax
  8001f8:	00 00 00 
  8001fb:	ff d0                	callq  *%rax
  8001fd:	85 c0                	test   %eax,%eax
  8001ff:	74 38                	je     800239 <umain+0x1f6>
  800201:	48 bf d0 49 80 00 00 	movabs $0x8049d0,%rdi
  800208:	00 00 00 
  80020b:	b8 00 00 00 00       	mov    $0x0,%eax
  800210:	48 ba 06 06 80 00 00 	movabs $0x800606,%rdx
  800217:	00 00 00 
  80021a:	ff d2                	callq  *%rdx
  80021c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80021f:	89 c7                	mov    %eax,%edi
  800221:	48 b8 07 1a 80 00 00 	movabs $0x801a07,%rax
  800228:	00 00 00 
  80022b:	ff d0                	callq  *%rax
  80022d:	48 b8 a8 03 80 00 00 	movabs $0x8003a8,%rax
  800234:	00 00 00 
  800237:	ff d0                	callq  *%rax
  800239:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80023d:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  800243:	83 f8 02             	cmp    $0x2,%eax
  800246:	74 a4                	je     8001ec <umain+0x1a9>
  800248:	48 bf ec 49 80 00 00 	movabs $0x8049ec,%rdi
  80024f:	00 00 00 
  800252:	b8 00 00 00 00       	mov    $0x0,%eax
  800257:	48 ba 06 06 80 00 00 	movabs $0x800606,%rdx
  80025e:	00 00 00 
  800261:	ff d2                	callq  *%rdx
  800263:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800266:	89 c7                	mov    %eax,%edi
  800268:	48 b8 df 3f 80 00 00 	movabs $0x803fdf,%rax
  80026f:	00 00 00 
  800272:	ff d0                	callq  *%rax
  800274:	85 c0                	test   %eax,%eax
  800276:	74 2a                	je     8002a2 <umain+0x25f>
  800278:	48 ba 08 4a 80 00 00 	movabs $0x804a08,%rdx
  80027f:	00 00 00 
  800282:	be 41 00 00 00       	mov    $0x41,%esi
  800287:	48 bf ab 49 80 00 00 	movabs $0x8049ab,%rdi
  80028e:	00 00 00 
  800291:	b8 00 00 00 00       	mov    $0x0,%eax
  800296:	48 b9 cc 03 80 00 00 	movabs $0x8003cc,%rcx
  80029d:	00 00 00 
  8002a0:	ff d1                	callq  *%rcx
  8002a2:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8002a5:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
  8002a9:	48 89 d6             	mov    %rdx,%rsi
  8002ac:	89 c7                	mov    %eax,%edi
  8002ae:	48 b8 c0 25 80 00 00 	movabs $0x8025c0,%rax
  8002b5:	00 00 00 
  8002b8:	ff d0                	callq  *%rax
  8002ba:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8002bd:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8002c1:	79 30                	jns    8002f3 <umain+0x2b0>
  8002c3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8002c6:	89 c1                	mov    %eax,%ecx
  8002c8:	48 ba 32 4a 80 00 00 	movabs $0x804a32,%rdx
  8002cf:	00 00 00 
  8002d2:	be 43 00 00 00       	mov    $0x43,%esi
  8002d7:	48 bf ab 49 80 00 00 	movabs $0x8049ab,%rdi
  8002de:	00 00 00 
  8002e1:	b8 00 00 00 00       	mov    $0x0,%eax
  8002e6:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  8002ed:	00 00 00 
  8002f0:	41 ff d0             	callq  *%r8
  8002f3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8002f7:	48 89 c7             	mov    %rax,%rdi
  8002fa:	48 b8 fd 24 80 00 00 	movabs $0x8024fd,%rax
  800301:	00 00 00 
  800304:	ff d0                	callq  *%rax
  800306:	48 bf 4a 4a 80 00 00 	movabs $0x804a4a,%rdi
  80030d:	00 00 00 
  800310:	b8 00 00 00 00       	mov    $0x0,%eax
  800315:	48 ba 06 06 80 00 00 	movabs $0x800606,%rdx
  80031c:	00 00 00 
  80031f:	ff d2                	callq  *%rdx
  800321:	90                   	nop
  800322:	c9                   	leaveq 
  800323:	c3                   	retq   

0000000000800324 <libmain>:
  800324:	55                   	push   %rbp
  800325:	48 89 e5             	mov    %rsp,%rbp
  800328:	48 83 ec 10          	sub    $0x10,%rsp
  80032c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80032f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800333:	48 b8 4d 1a 80 00 00 	movabs $0x801a4d,%rax
  80033a:	00 00 00 
  80033d:	ff d0                	callq  *%rax
  80033f:	25 ff 03 00 00       	and    $0x3ff,%eax
  800344:	48 98                	cltq   
  800346:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80034d:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800354:	00 00 00 
  800357:	48 01 c2             	add    %rax,%rdx
  80035a:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800361:	00 00 00 
  800364:	48 89 10             	mov    %rdx,(%rax)
  800367:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80036b:	7e 14                	jle    800381 <libmain+0x5d>
  80036d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800371:	48 8b 10             	mov    (%rax),%rdx
  800374:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80037b:	00 00 00 
  80037e:	48 89 10             	mov    %rdx,(%rax)
  800381:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800385:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800388:	48 89 d6             	mov    %rdx,%rsi
  80038b:	89 c7                	mov    %eax,%edi
  80038d:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800394:	00 00 00 
  800397:	ff d0                	callq  *%rax
  800399:	48 b8 a8 03 80 00 00 	movabs $0x8003a8,%rax
  8003a0:	00 00 00 
  8003a3:	ff d0                	callq  *%rax
  8003a5:	90                   	nop
  8003a6:	c9                   	leaveq 
  8003a7:	c3                   	retq   

00000000008003a8 <exit>:
  8003a8:	55                   	push   %rbp
  8003a9:	48 89 e5             	mov    %rsp,%rbp
  8003ac:	48 b8 1d 28 80 00 00 	movabs $0x80281d,%rax
  8003b3:	00 00 00 
  8003b6:	ff d0                	callq  *%rax
  8003b8:	bf 00 00 00 00       	mov    $0x0,%edi
  8003bd:	48 b8 07 1a 80 00 00 	movabs $0x801a07,%rax
  8003c4:	00 00 00 
  8003c7:	ff d0                	callq  *%rax
  8003c9:	90                   	nop
  8003ca:	5d                   	pop    %rbp
  8003cb:	c3                   	retq   

00000000008003cc <_panic>:
  8003cc:	55                   	push   %rbp
  8003cd:	48 89 e5             	mov    %rsp,%rbp
  8003d0:	53                   	push   %rbx
  8003d1:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8003d8:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8003df:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8003e5:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8003ec:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  8003f3:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8003fa:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800401:	84 c0                	test   %al,%al
  800403:	74 23                	je     800428 <_panic+0x5c>
  800405:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  80040c:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800410:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800414:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800418:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  80041c:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800420:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800424:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800428:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  80042f:	00 00 00 
  800432:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800439:	00 00 00 
  80043c:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800440:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800447:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  80044e:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800455:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80045c:	00 00 00 
  80045f:	48 8b 18             	mov    (%rax),%rbx
  800462:	48 b8 4d 1a 80 00 00 	movabs $0x801a4d,%rax
  800469:	00 00 00 
  80046c:	ff d0                	callq  *%rax
  80046e:	89 c6                	mov    %eax,%esi
  800470:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  800476:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  80047d:	41 89 d0             	mov    %edx,%r8d
  800480:	48 89 c1             	mov    %rax,%rcx
  800483:	48 89 da             	mov    %rbx,%rdx
  800486:	48 bf 68 4a 80 00 00 	movabs $0x804a68,%rdi
  80048d:	00 00 00 
  800490:	b8 00 00 00 00       	mov    $0x0,%eax
  800495:	49 b9 06 06 80 00 00 	movabs $0x800606,%r9
  80049c:	00 00 00 
  80049f:	41 ff d1             	callq  *%r9
  8004a2:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8004a9:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8004b0:	48 89 d6             	mov    %rdx,%rsi
  8004b3:	48 89 c7             	mov    %rax,%rdi
  8004b6:	48 b8 5a 05 80 00 00 	movabs $0x80055a,%rax
  8004bd:	00 00 00 
  8004c0:	ff d0                	callq  *%rax
  8004c2:	48 bf 8b 4a 80 00 00 	movabs $0x804a8b,%rdi
  8004c9:	00 00 00 
  8004cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8004d1:	48 ba 06 06 80 00 00 	movabs $0x800606,%rdx
  8004d8:	00 00 00 
  8004db:	ff d2                	callq  *%rdx
  8004dd:	cc                   	int3   
  8004de:	eb fd                	jmp    8004dd <_panic+0x111>

00000000008004e0 <putch>:
  8004e0:	55                   	push   %rbp
  8004e1:	48 89 e5             	mov    %rsp,%rbp
  8004e4:	48 83 ec 10          	sub    $0x10,%rsp
  8004e8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8004eb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8004ef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004f3:	8b 00                	mov    (%rax),%eax
  8004f5:	8d 48 01             	lea    0x1(%rax),%ecx
  8004f8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8004fc:	89 0a                	mov    %ecx,(%rdx)
  8004fe:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800501:	89 d1                	mov    %edx,%ecx
  800503:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800507:	48 98                	cltq   
  800509:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80050d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800511:	8b 00                	mov    (%rax),%eax
  800513:	3d ff 00 00 00       	cmp    $0xff,%eax
  800518:	75 2c                	jne    800546 <putch+0x66>
  80051a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80051e:	8b 00                	mov    (%rax),%eax
  800520:	48 98                	cltq   
  800522:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800526:	48 83 c2 08          	add    $0x8,%rdx
  80052a:	48 89 c6             	mov    %rax,%rsi
  80052d:	48 89 d7             	mov    %rdx,%rdi
  800530:	48 b8 7e 19 80 00 00 	movabs $0x80197e,%rax
  800537:	00 00 00 
  80053a:	ff d0                	callq  *%rax
  80053c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800540:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800546:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80054a:	8b 40 04             	mov    0x4(%rax),%eax
  80054d:	8d 50 01             	lea    0x1(%rax),%edx
  800550:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800554:	89 50 04             	mov    %edx,0x4(%rax)
  800557:	90                   	nop
  800558:	c9                   	leaveq 
  800559:	c3                   	retq   

000000000080055a <vcprintf>:
  80055a:	55                   	push   %rbp
  80055b:	48 89 e5             	mov    %rsp,%rbp
  80055e:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800565:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  80056c:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800573:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  80057a:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800581:	48 8b 0a             	mov    (%rdx),%rcx
  800584:	48 89 08             	mov    %rcx,(%rax)
  800587:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80058b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80058f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800593:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800597:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  80059e:	00 00 00 
  8005a1:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8005a8:	00 00 00 
  8005ab:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8005b2:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8005b9:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8005c0:	48 89 c6             	mov    %rax,%rsi
  8005c3:	48 bf e0 04 80 00 00 	movabs $0x8004e0,%rdi
  8005ca:	00 00 00 
  8005cd:	48 b8 a4 09 80 00 00 	movabs $0x8009a4,%rax
  8005d4:	00 00 00 
  8005d7:	ff d0                	callq  *%rax
  8005d9:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8005df:	48 98                	cltq   
  8005e1:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8005e8:	48 83 c2 08          	add    $0x8,%rdx
  8005ec:	48 89 c6             	mov    %rax,%rsi
  8005ef:	48 89 d7             	mov    %rdx,%rdi
  8005f2:	48 b8 7e 19 80 00 00 	movabs $0x80197e,%rax
  8005f9:	00 00 00 
  8005fc:	ff d0                	callq  *%rax
  8005fe:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800604:	c9                   	leaveq 
  800605:	c3                   	retq   

0000000000800606 <cprintf>:
  800606:	55                   	push   %rbp
  800607:	48 89 e5             	mov    %rsp,%rbp
  80060a:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800611:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800618:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80061f:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800626:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80062d:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800634:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80063b:	84 c0                	test   %al,%al
  80063d:	74 20                	je     80065f <cprintf+0x59>
  80063f:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800643:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800647:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80064b:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80064f:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800653:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800657:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80065b:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80065f:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800666:	00 00 00 
  800669:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800670:	00 00 00 
  800673:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800677:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80067e:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800685:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80068c:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800693:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80069a:	48 8b 0a             	mov    (%rdx),%rcx
  80069d:	48 89 08             	mov    %rcx,(%rax)
  8006a0:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8006a4:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8006a8:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8006ac:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8006b0:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8006b7:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8006be:	48 89 d6             	mov    %rdx,%rsi
  8006c1:	48 89 c7             	mov    %rax,%rdi
  8006c4:	48 b8 5a 05 80 00 00 	movabs $0x80055a,%rax
  8006cb:	00 00 00 
  8006ce:	ff d0                	callq  *%rax
  8006d0:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8006d6:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8006dc:	c9                   	leaveq 
  8006dd:	c3                   	retq   

00000000008006de <printnum>:
  8006de:	55                   	push   %rbp
  8006df:	48 89 e5             	mov    %rsp,%rbp
  8006e2:	48 83 ec 30          	sub    $0x30,%rsp
  8006e6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8006ea:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8006ee:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8006f2:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  8006f5:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  8006f9:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  8006fd:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800700:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  800704:	77 54                	ja     80075a <printnum+0x7c>
  800706:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800709:	8d 78 ff             	lea    -0x1(%rax),%edi
  80070c:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  80070f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800713:	ba 00 00 00 00       	mov    $0x0,%edx
  800718:	48 f7 f6             	div    %rsi
  80071b:	49 89 c2             	mov    %rax,%r10
  80071e:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800721:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  800724:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  800728:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80072c:	41 89 c9             	mov    %ecx,%r9d
  80072f:	41 89 f8             	mov    %edi,%r8d
  800732:	89 d1                	mov    %edx,%ecx
  800734:	4c 89 d2             	mov    %r10,%rdx
  800737:	48 89 c7             	mov    %rax,%rdi
  80073a:	48 b8 de 06 80 00 00 	movabs $0x8006de,%rax
  800741:	00 00 00 
  800744:	ff d0                	callq  *%rax
  800746:	eb 1c                	jmp    800764 <printnum+0x86>
  800748:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80074c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80074f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800753:	48 89 ce             	mov    %rcx,%rsi
  800756:	89 d7                	mov    %edx,%edi
  800758:	ff d0                	callq  *%rax
  80075a:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  80075e:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  800762:	7f e4                	jg     800748 <printnum+0x6a>
  800764:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800767:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80076b:	ba 00 00 00 00       	mov    $0x0,%edx
  800770:	48 f7 f1             	div    %rcx
  800773:	48 b8 90 4c 80 00 00 	movabs $0x804c90,%rax
  80077a:	00 00 00 
  80077d:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  800781:	0f be d0             	movsbl %al,%edx
  800784:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800788:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80078c:	48 89 ce             	mov    %rcx,%rsi
  80078f:	89 d7                	mov    %edx,%edi
  800791:	ff d0                	callq  *%rax
  800793:	90                   	nop
  800794:	c9                   	leaveq 
  800795:	c3                   	retq   

0000000000800796 <getuint>:
  800796:	55                   	push   %rbp
  800797:	48 89 e5             	mov    %rsp,%rbp
  80079a:	48 83 ec 20          	sub    $0x20,%rsp
  80079e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8007a2:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8007a5:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8007a9:	7e 4f                	jle    8007fa <getuint+0x64>
  8007ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007af:	8b 00                	mov    (%rax),%eax
  8007b1:	83 f8 30             	cmp    $0x30,%eax
  8007b4:	73 24                	jae    8007da <getuint+0x44>
  8007b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ba:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007c2:	8b 00                	mov    (%rax),%eax
  8007c4:	89 c0                	mov    %eax,%eax
  8007c6:	48 01 d0             	add    %rdx,%rax
  8007c9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007cd:	8b 12                	mov    (%rdx),%edx
  8007cf:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007d2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007d6:	89 0a                	mov    %ecx,(%rdx)
  8007d8:	eb 14                	jmp    8007ee <getuint+0x58>
  8007da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007de:	48 8b 40 08          	mov    0x8(%rax),%rax
  8007e2:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8007e6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007ea:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007ee:	48 8b 00             	mov    (%rax),%rax
  8007f1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007f5:	e9 9d 00 00 00       	jmpq   800897 <getuint+0x101>
  8007fa:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8007fe:	74 4c                	je     80084c <getuint+0xb6>
  800800:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800804:	8b 00                	mov    (%rax),%eax
  800806:	83 f8 30             	cmp    $0x30,%eax
  800809:	73 24                	jae    80082f <getuint+0x99>
  80080b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80080f:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800813:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800817:	8b 00                	mov    (%rax),%eax
  800819:	89 c0                	mov    %eax,%eax
  80081b:	48 01 d0             	add    %rdx,%rax
  80081e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800822:	8b 12                	mov    (%rdx),%edx
  800824:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800827:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80082b:	89 0a                	mov    %ecx,(%rdx)
  80082d:	eb 14                	jmp    800843 <getuint+0xad>
  80082f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800833:	48 8b 40 08          	mov    0x8(%rax),%rax
  800837:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80083b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80083f:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800843:	48 8b 00             	mov    (%rax),%rax
  800846:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80084a:	eb 4b                	jmp    800897 <getuint+0x101>
  80084c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800850:	8b 00                	mov    (%rax),%eax
  800852:	83 f8 30             	cmp    $0x30,%eax
  800855:	73 24                	jae    80087b <getuint+0xe5>
  800857:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80085b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80085f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800863:	8b 00                	mov    (%rax),%eax
  800865:	89 c0                	mov    %eax,%eax
  800867:	48 01 d0             	add    %rdx,%rax
  80086a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80086e:	8b 12                	mov    (%rdx),%edx
  800870:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800873:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800877:	89 0a                	mov    %ecx,(%rdx)
  800879:	eb 14                	jmp    80088f <getuint+0xf9>
  80087b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80087f:	48 8b 40 08          	mov    0x8(%rax),%rax
  800883:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800887:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80088b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80088f:	8b 00                	mov    (%rax),%eax
  800891:	89 c0                	mov    %eax,%eax
  800893:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800897:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80089b:	c9                   	leaveq 
  80089c:	c3                   	retq   

000000000080089d <getint>:
  80089d:	55                   	push   %rbp
  80089e:	48 89 e5             	mov    %rsp,%rbp
  8008a1:	48 83 ec 20          	sub    $0x20,%rsp
  8008a5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8008a9:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8008ac:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8008b0:	7e 4f                	jle    800901 <getint+0x64>
  8008b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008b6:	8b 00                	mov    (%rax),%eax
  8008b8:	83 f8 30             	cmp    $0x30,%eax
  8008bb:	73 24                	jae    8008e1 <getint+0x44>
  8008bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008c1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008c9:	8b 00                	mov    (%rax),%eax
  8008cb:	89 c0                	mov    %eax,%eax
  8008cd:	48 01 d0             	add    %rdx,%rax
  8008d0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008d4:	8b 12                	mov    (%rdx),%edx
  8008d6:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008d9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008dd:	89 0a                	mov    %ecx,(%rdx)
  8008df:	eb 14                	jmp    8008f5 <getint+0x58>
  8008e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008e5:	48 8b 40 08          	mov    0x8(%rax),%rax
  8008e9:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8008ed:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008f1:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008f5:	48 8b 00             	mov    (%rax),%rax
  8008f8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008fc:	e9 9d 00 00 00       	jmpq   80099e <getint+0x101>
  800901:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800905:	74 4c                	je     800953 <getint+0xb6>
  800907:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80090b:	8b 00                	mov    (%rax),%eax
  80090d:	83 f8 30             	cmp    $0x30,%eax
  800910:	73 24                	jae    800936 <getint+0x99>
  800912:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800916:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80091a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80091e:	8b 00                	mov    (%rax),%eax
  800920:	89 c0                	mov    %eax,%eax
  800922:	48 01 d0             	add    %rdx,%rax
  800925:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800929:	8b 12                	mov    (%rdx),%edx
  80092b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80092e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800932:	89 0a                	mov    %ecx,(%rdx)
  800934:	eb 14                	jmp    80094a <getint+0xad>
  800936:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80093a:	48 8b 40 08          	mov    0x8(%rax),%rax
  80093e:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800942:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800946:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80094a:	48 8b 00             	mov    (%rax),%rax
  80094d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800951:	eb 4b                	jmp    80099e <getint+0x101>
  800953:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800957:	8b 00                	mov    (%rax),%eax
  800959:	83 f8 30             	cmp    $0x30,%eax
  80095c:	73 24                	jae    800982 <getint+0xe5>
  80095e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800962:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800966:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80096a:	8b 00                	mov    (%rax),%eax
  80096c:	89 c0                	mov    %eax,%eax
  80096e:	48 01 d0             	add    %rdx,%rax
  800971:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800975:	8b 12                	mov    (%rdx),%edx
  800977:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80097a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80097e:	89 0a                	mov    %ecx,(%rdx)
  800980:	eb 14                	jmp    800996 <getint+0xf9>
  800982:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800986:	48 8b 40 08          	mov    0x8(%rax),%rax
  80098a:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80098e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800992:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800996:	8b 00                	mov    (%rax),%eax
  800998:	48 98                	cltq   
  80099a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80099e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8009a2:	c9                   	leaveq 
  8009a3:	c3                   	retq   

00000000008009a4 <vprintfmt>:
  8009a4:	55                   	push   %rbp
  8009a5:	48 89 e5             	mov    %rsp,%rbp
  8009a8:	41 54                	push   %r12
  8009aa:	53                   	push   %rbx
  8009ab:	48 83 ec 60          	sub    $0x60,%rsp
  8009af:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8009b3:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8009b7:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8009bb:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8009bf:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8009c3:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8009c7:	48 8b 0a             	mov    (%rdx),%rcx
  8009ca:	48 89 08             	mov    %rcx,(%rax)
  8009cd:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8009d1:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8009d5:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8009d9:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8009dd:	eb 17                	jmp    8009f6 <vprintfmt+0x52>
  8009df:	85 db                	test   %ebx,%ebx
  8009e1:	0f 84 b9 04 00 00    	je     800ea0 <vprintfmt+0x4fc>
  8009e7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8009eb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8009ef:	48 89 d6             	mov    %rdx,%rsi
  8009f2:	89 df                	mov    %ebx,%edi
  8009f4:	ff d0                	callq  *%rax
  8009f6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8009fa:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8009fe:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a02:	0f b6 00             	movzbl (%rax),%eax
  800a05:	0f b6 d8             	movzbl %al,%ebx
  800a08:	83 fb 25             	cmp    $0x25,%ebx
  800a0b:	75 d2                	jne    8009df <vprintfmt+0x3b>
  800a0d:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800a11:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800a18:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a1f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800a26:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800a2d:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a31:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800a35:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a39:	0f b6 00             	movzbl (%rax),%eax
  800a3c:	0f b6 d8             	movzbl %al,%ebx
  800a3f:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800a42:	83 f8 55             	cmp    $0x55,%eax
  800a45:	0f 87 22 04 00 00    	ja     800e6d <vprintfmt+0x4c9>
  800a4b:	89 c0                	mov    %eax,%eax
  800a4d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800a54:	00 
  800a55:	48 b8 b8 4c 80 00 00 	movabs $0x804cb8,%rax
  800a5c:	00 00 00 
  800a5f:	48 01 d0             	add    %rdx,%rax
  800a62:	48 8b 00             	mov    (%rax),%rax
  800a65:	ff e0                	jmpq   *%rax
  800a67:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800a6b:	eb c0                	jmp    800a2d <vprintfmt+0x89>
  800a6d:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800a71:	eb ba                	jmp    800a2d <vprintfmt+0x89>
  800a73:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800a7a:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800a7d:	89 d0                	mov    %edx,%eax
  800a7f:	c1 e0 02             	shl    $0x2,%eax
  800a82:	01 d0                	add    %edx,%eax
  800a84:	01 c0                	add    %eax,%eax
  800a86:	01 d8                	add    %ebx,%eax
  800a88:	83 e8 30             	sub    $0x30,%eax
  800a8b:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800a8e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a92:	0f b6 00             	movzbl (%rax),%eax
  800a95:	0f be d8             	movsbl %al,%ebx
  800a98:	83 fb 2f             	cmp    $0x2f,%ebx
  800a9b:	7e 60                	jle    800afd <vprintfmt+0x159>
  800a9d:	83 fb 39             	cmp    $0x39,%ebx
  800aa0:	7f 5b                	jg     800afd <vprintfmt+0x159>
  800aa2:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800aa7:	eb d1                	jmp    800a7a <vprintfmt+0xd6>
  800aa9:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800aac:	83 f8 30             	cmp    $0x30,%eax
  800aaf:	73 17                	jae    800ac8 <vprintfmt+0x124>
  800ab1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ab5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ab8:	89 d2                	mov    %edx,%edx
  800aba:	48 01 d0             	add    %rdx,%rax
  800abd:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ac0:	83 c2 08             	add    $0x8,%edx
  800ac3:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ac6:	eb 0c                	jmp    800ad4 <vprintfmt+0x130>
  800ac8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800acc:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800ad0:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ad4:	8b 00                	mov    (%rax),%eax
  800ad6:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800ad9:	eb 23                	jmp    800afe <vprintfmt+0x15a>
  800adb:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800adf:	0f 89 48 ff ff ff    	jns    800a2d <vprintfmt+0x89>
  800ae5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800aec:	e9 3c ff ff ff       	jmpq   800a2d <vprintfmt+0x89>
  800af1:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800af8:	e9 30 ff ff ff       	jmpq   800a2d <vprintfmt+0x89>
  800afd:	90                   	nop
  800afe:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b02:	0f 89 25 ff ff ff    	jns    800a2d <vprintfmt+0x89>
  800b08:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b0b:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800b0e:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800b15:	e9 13 ff ff ff       	jmpq   800a2d <vprintfmt+0x89>
  800b1a:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800b1e:	e9 0a ff ff ff       	jmpq   800a2d <vprintfmt+0x89>
  800b23:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b26:	83 f8 30             	cmp    $0x30,%eax
  800b29:	73 17                	jae    800b42 <vprintfmt+0x19e>
  800b2b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800b2f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b32:	89 d2                	mov    %edx,%edx
  800b34:	48 01 d0             	add    %rdx,%rax
  800b37:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b3a:	83 c2 08             	add    $0x8,%edx
  800b3d:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b40:	eb 0c                	jmp    800b4e <vprintfmt+0x1aa>
  800b42:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800b46:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800b4a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b4e:	8b 10                	mov    (%rax),%edx
  800b50:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b54:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b58:	48 89 ce             	mov    %rcx,%rsi
  800b5b:	89 d7                	mov    %edx,%edi
  800b5d:	ff d0                	callq  *%rax
  800b5f:	e9 37 03 00 00       	jmpq   800e9b <vprintfmt+0x4f7>
  800b64:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b67:	83 f8 30             	cmp    $0x30,%eax
  800b6a:	73 17                	jae    800b83 <vprintfmt+0x1df>
  800b6c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800b70:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b73:	89 d2                	mov    %edx,%edx
  800b75:	48 01 d0             	add    %rdx,%rax
  800b78:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b7b:	83 c2 08             	add    $0x8,%edx
  800b7e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b81:	eb 0c                	jmp    800b8f <vprintfmt+0x1eb>
  800b83:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800b87:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800b8b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b8f:	8b 18                	mov    (%rax),%ebx
  800b91:	85 db                	test   %ebx,%ebx
  800b93:	79 02                	jns    800b97 <vprintfmt+0x1f3>
  800b95:	f7 db                	neg    %ebx
  800b97:	83 fb 15             	cmp    $0x15,%ebx
  800b9a:	7f 16                	jg     800bb2 <vprintfmt+0x20e>
  800b9c:	48 b8 e0 4b 80 00 00 	movabs $0x804be0,%rax
  800ba3:	00 00 00 
  800ba6:	48 63 d3             	movslq %ebx,%rdx
  800ba9:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800bad:	4d 85 e4             	test   %r12,%r12
  800bb0:	75 2e                	jne    800be0 <vprintfmt+0x23c>
  800bb2:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800bb6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bba:	89 d9                	mov    %ebx,%ecx
  800bbc:	48 ba a1 4c 80 00 00 	movabs $0x804ca1,%rdx
  800bc3:	00 00 00 
  800bc6:	48 89 c7             	mov    %rax,%rdi
  800bc9:	b8 00 00 00 00       	mov    $0x0,%eax
  800bce:	49 b8 aa 0e 80 00 00 	movabs $0x800eaa,%r8
  800bd5:	00 00 00 
  800bd8:	41 ff d0             	callq  *%r8
  800bdb:	e9 bb 02 00 00       	jmpq   800e9b <vprintfmt+0x4f7>
  800be0:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800be4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800be8:	4c 89 e1             	mov    %r12,%rcx
  800beb:	48 ba aa 4c 80 00 00 	movabs $0x804caa,%rdx
  800bf2:	00 00 00 
  800bf5:	48 89 c7             	mov    %rax,%rdi
  800bf8:	b8 00 00 00 00       	mov    $0x0,%eax
  800bfd:	49 b8 aa 0e 80 00 00 	movabs $0x800eaa,%r8
  800c04:	00 00 00 
  800c07:	41 ff d0             	callq  *%r8
  800c0a:	e9 8c 02 00 00       	jmpq   800e9b <vprintfmt+0x4f7>
  800c0f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c12:	83 f8 30             	cmp    $0x30,%eax
  800c15:	73 17                	jae    800c2e <vprintfmt+0x28a>
  800c17:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800c1b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c1e:	89 d2                	mov    %edx,%edx
  800c20:	48 01 d0             	add    %rdx,%rax
  800c23:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c26:	83 c2 08             	add    $0x8,%edx
  800c29:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c2c:	eb 0c                	jmp    800c3a <vprintfmt+0x296>
  800c2e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800c32:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800c36:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c3a:	4c 8b 20             	mov    (%rax),%r12
  800c3d:	4d 85 e4             	test   %r12,%r12
  800c40:	75 0a                	jne    800c4c <vprintfmt+0x2a8>
  800c42:	49 bc ad 4c 80 00 00 	movabs $0x804cad,%r12
  800c49:	00 00 00 
  800c4c:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c50:	7e 78                	jle    800cca <vprintfmt+0x326>
  800c52:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800c56:	74 72                	je     800cca <vprintfmt+0x326>
  800c58:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800c5b:	48 98                	cltq   
  800c5d:	48 89 c6             	mov    %rax,%rsi
  800c60:	4c 89 e7             	mov    %r12,%rdi
  800c63:	48 b8 58 11 80 00 00 	movabs $0x801158,%rax
  800c6a:	00 00 00 
  800c6d:	ff d0                	callq  *%rax
  800c6f:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800c72:	eb 17                	jmp    800c8b <vprintfmt+0x2e7>
  800c74:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800c78:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800c7c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c80:	48 89 ce             	mov    %rcx,%rsi
  800c83:	89 d7                	mov    %edx,%edi
  800c85:	ff d0                	callq  *%rax
  800c87:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c8b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c8f:	7f e3                	jg     800c74 <vprintfmt+0x2d0>
  800c91:	eb 37                	jmp    800cca <vprintfmt+0x326>
  800c93:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800c97:	74 1e                	je     800cb7 <vprintfmt+0x313>
  800c99:	83 fb 1f             	cmp    $0x1f,%ebx
  800c9c:	7e 05                	jle    800ca3 <vprintfmt+0x2ff>
  800c9e:	83 fb 7e             	cmp    $0x7e,%ebx
  800ca1:	7e 14                	jle    800cb7 <vprintfmt+0x313>
  800ca3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ca7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cab:	48 89 d6             	mov    %rdx,%rsi
  800cae:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800cb3:	ff d0                	callq  *%rax
  800cb5:	eb 0f                	jmp    800cc6 <vprintfmt+0x322>
  800cb7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cbb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cbf:	48 89 d6             	mov    %rdx,%rsi
  800cc2:	89 df                	mov    %ebx,%edi
  800cc4:	ff d0                	callq  *%rax
  800cc6:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800cca:	4c 89 e0             	mov    %r12,%rax
  800ccd:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800cd1:	0f b6 00             	movzbl (%rax),%eax
  800cd4:	0f be d8             	movsbl %al,%ebx
  800cd7:	85 db                	test   %ebx,%ebx
  800cd9:	74 28                	je     800d03 <vprintfmt+0x35f>
  800cdb:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800cdf:	78 b2                	js     800c93 <vprintfmt+0x2ef>
  800ce1:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800ce5:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800ce9:	79 a8                	jns    800c93 <vprintfmt+0x2ef>
  800ceb:	eb 16                	jmp    800d03 <vprintfmt+0x35f>
  800ced:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cf1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cf5:	48 89 d6             	mov    %rdx,%rsi
  800cf8:	bf 20 00 00 00       	mov    $0x20,%edi
  800cfd:	ff d0                	callq  *%rax
  800cff:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d03:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d07:	7f e4                	jg     800ced <vprintfmt+0x349>
  800d09:	e9 8d 01 00 00       	jmpq   800e9b <vprintfmt+0x4f7>
  800d0e:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d12:	be 03 00 00 00       	mov    $0x3,%esi
  800d17:	48 89 c7             	mov    %rax,%rdi
  800d1a:	48 b8 9d 08 80 00 00 	movabs $0x80089d,%rax
  800d21:	00 00 00 
  800d24:	ff d0                	callq  *%rax
  800d26:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d2a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d2e:	48 85 c0             	test   %rax,%rax
  800d31:	79 1d                	jns    800d50 <vprintfmt+0x3ac>
  800d33:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d37:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d3b:	48 89 d6             	mov    %rdx,%rsi
  800d3e:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800d43:	ff d0                	callq  *%rax
  800d45:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d49:	48 f7 d8             	neg    %rax
  800d4c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d50:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800d57:	e9 d2 00 00 00       	jmpq   800e2e <vprintfmt+0x48a>
  800d5c:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d60:	be 03 00 00 00       	mov    $0x3,%esi
  800d65:	48 89 c7             	mov    %rax,%rdi
  800d68:	48 b8 96 07 80 00 00 	movabs $0x800796,%rax
  800d6f:	00 00 00 
  800d72:	ff d0                	callq  *%rax
  800d74:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d78:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800d7f:	e9 aa 00 00 00       	jmpq   800e2e <vprintfmt+0x48a>
  800d84:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d88:	be 03 00 00 00       	mov    $0x3,%esi
  800d8d:	48 89 c7             	mov    %rax,%rdi
  800d90:	48 b8 96 07 80 00 00 	movabs $0x800796,%rax
  800d97:	00 00 00 
  800d9a:	ff d0                	callq  *%rax
  800d9c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800da0:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800da7:	e9 82 00 00 00       	jmpq   800e2e <vprintfmt+0x48a>
  800dac:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800db0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800db4:	48 89 d6             	mov    %rdx,%rsi
  800db7:	bf 30 00 00 00       	mov    $0x30,%edi
  800dbc:	ff d0                	callq  *%rax
  800dbe:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800dc2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dc6:	48 89 d6             	mov    %rdx,%rsi
  800dc9:	bf 78 00 00 00       	mov    $0x78,%edi
  800dce:	ff d0                	callq  *%rax
  800dd0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800dd3:	83 f8 30             	cmp    $0x30,%eax
  800dd6:	73 17                	jae    800def <vprintfmt+0x44b>
  800dd8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ddc:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ddf:	89 d2                	mov    %edx,%edx
  800de1:	48 01 d0             	add    %rdx,%rax
  800de4:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800de7:	83 c2 08             	add    $0x8,%edx
  800dea:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ded:	eb 0c                	jmp    800dfb <vprintfmt+0x457>
  800def:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800df3:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800df7:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800dfb:	48 8b 00             	mov    (%rax),%rax
  800dfe:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e02:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800e09:	eb 23                	jmp    800e2e <vprintfmt+0x48a>
  800e0b:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e0f:	be 03 00 00 00       	mov    $0x3,%esi
  800e14:	48 89 c7             	mov    %rax,%rdi
  800e17:	48 b8 96 07 80 00 00 	movabs $0x800796,%rax
  800e1e:	00 00 00 
  800e21:	ff d0                	callq  *%rax
  800e23:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e27:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800e2e:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800e33:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800e36:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800e39:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e3d:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800e41:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e45:	45 89 c1             	mov    %r8d,%r9d
  800e48:	41 89 f8             	mov    %edi,%r8d
  800e4b:	48 89 c7             	mov    %rax,%rdi
  800e4e:	48 b8 de 06 80 00 00 	movabs $0x8006de,%rax
  800e55:	00 00 00 
  800e58:	ff d0                	callq  *%rax
  800e5a:	eb 3f                	jmp    800e9b <vprintfmt+0x4f7>
  800e5c:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e60:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e64:	48 89 d6             	mov    %rdx,%rsi
  800e67:	89 df                	mov    %ebx,%edi
  800e69:	ff d0                	callq  *%rax
  800e6b:	eb 2e                	jmp    800e9b <vprintfmt+0x4f7>
  800e6d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e71:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e75:	48 89 d6             	mov    %rdx,%rsi
  800e78:	bf 25 00 00 00       	mov    $0x25,%edi
  800e7d:	ff d0                	callq  *%rax
  800e7f:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800e84:	eb 05                	jmp    800e8b <vprintfmt+0x4e7>
  800e86:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800e8b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800e8f:	48 83 e8 01          	sub    $0x1,%rax
  800e93:	0f b6 00             	movzbl (%rax),%eax
  800e96:	3c 25                	cmp    $0x25,%al
  800e98:	75 ec                	jne    800e86 <vprintfmt+0x4e2>
  800e9a:	90                   	nop
  800e9b:	e9 3d fb ff ff       	jmpq   8009dd <vprintfmt+0x39>
  800ea0:	90                   	nop
  800ea1:	48 83 c4 60          	add    $0x60,%rsp
  800ea5:	5b                   	pop    %rbx
  800ea6:	41 5c                	pop    %r12
  800ea8:	5d                   	pop    %rbp
  800ea9:	c3                   	retq   

0000000000800eaa <printfmt>:
  800eaa:	55                   	push   %rbp
  800eab:	48 89 e5             	mov    %rsp,%rbp
  800eae:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800eb5:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800ebc:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800ec3:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800eca:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800ed1:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800ed8:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800edf:	84 c0                	test   %al,%al
  800ee1:	74 20                	je     800f03 <printfmt+0x59>
  800ee3:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800ee7:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800eeb:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800eef:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800ef3:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800ef7:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800efb:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800eff:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f03:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800f0a:	00 00 00 
  800f0d:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800f14:	00 00 00 
  800f17:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800f1b:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800f22:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800f29:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800f30:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800f37:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800f3e:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800f45:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800f4c:	48 89 c7             	mov    %rax,%rdi
  800f4f:	48 b8 a4 09 80 00 00 	movabs $0x8009a4,%rax
  800f56:	00 00 00 
  800f59:	ff d0                	callq  *%rax
  800f5b:	90                   	nop
  800f5c:	c9                   	leaveq 
  800f5d:	c3                   	retq   

0000000000800f5e <sprintputch>:
  800f5e:	55                   	push   %rbp
  800f5f:	48 89 e5             	mov    %rsp,%rbp
  800f62:	48 83 ec 10          	sub    $0x10,%rsp
  800f66:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800f69:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800f6d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f71:	8b 40 10             	mov    0x10(%rax),%eax
  800f74:	8d 50 01             	lea    0x1(%rax),%edx
  800f77:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f7b:	89 50 10             	mov    %edx,0x10(%rax)
  800f7e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f82:	48 8b 10             	mov    (%rax),%rdx
  800f85:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f89:	48 8b 40 08          	mov    0x8(%rax),%rax
  800f8d:	48 39 c2             	cmp    %rax,%rdx
  800f90:	73 17                	jae    800fa9 <sprintputch+0x4b>
  800f92:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f96:	48 8b 00             	mov    (%rax),%rax
  800f99:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800f9d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800fa1:	48 89 0a             	mov    %rcx,(%rdx)
  800fa4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800fa7:	88 10                	mov    %dl,(%rax)
  800fa9:	90                   	nop
  800faa:	c9                   	leaveq 
  800fab:	c3                   	retq   

0000000000800fac <vsnprintf>:
  800fac:	55                   	push   %rbp
  800fad:	48 89 e5             	mov    %rsp,%rbp
  800fb0:	48 83 ec 50          	sub    $0x50,%rsp
  800fb4:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800fb8:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800fbb:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800fbf:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800fc3:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800fc7:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800fcb:	48 8b 0a             	mov    (%rdx),%rcx
  800fce:	48 89 08             	mov    %rcx,(%rax)
  800fd1:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800fd5:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800fd9:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800fdd:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800fe1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800fe5:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800fe9:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800fec:	48 98                	cltq   
  800fee:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800ff2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ff6:	48 01 d0             	add    %rdx,%rax
  800ff9:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800ffd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  801004:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  801009:	74 06                	je     801011 <vsnprintf+0x65>
  80100b:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  80100f:	7f 07                	jg     801018 <vsnprintf+0x6c>
  801011:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801016:	eb 2f                	jmp    801047 <vsnprintf+0x9b>
  801018:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  80101c:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801020:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  801024:	48 89 c6             	mov    %rax,%rsi
  801027:	48 bf 5e 0f 80 00 00 	movabs $0x800f5e,%rdi
  80102e:	00 00 00 
  801031:	48 b8 a4 09 80 00 00 	movabs $0x8009a4,%rax
  801038:	00 00 00 
  80103b:	ff d0                	callq  *%rax
  80103d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801041:	c6 00 00             	movb   $0x0,(%rax)
  801044:	8b 45 e0             	mov    -0x20(%rbp),%eax
  801047:	c9                   	leaveq 
  801048:	c3                   	retq   

0000000000801049 <snprintf>:
  801049:	55                   	push   %rbp
  80104a:	48 89 e5             	mov    %rsp,%rbp
  80104d:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  801054:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80105b:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801061:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  801068:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80106f:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801076:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80107d:	84 c0                	test   %al,%al
  80107f:	74 20                	je     8010a1 <snprintf+0x58>
  801081:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801085:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801089:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80108d:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801091:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801095:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801099:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80109d:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8010a1:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8010a8:	00 00 00 
  8010ab:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8010b2:	00 00 00 
  8010b5:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8010b9:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8010c0:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8010c7:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8010ce:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8010d5:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8010dc:	48 8b 0a             	mov    (%rdx),%rcx
  8010df:	48 89 08             	mov    %rcx,(%rax)
  8010e2:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8010e6:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8010ea:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8010ee:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8010f2:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  8010f9:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801100:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  801106:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80110d:	48 89 c7             	mov    %rax,%rdi
  801110:	48 b8 ac 0f 80 00 00 	movabs $0x800fac,%rax
  801117:	00 00 00 
  80111a:	ff d0                	callq  *%rax
  80111c:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801122:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801128:	c9                   	leaveq 
  801129:	c3                   	retq   

000000000080112a <strlen>:
  80112a:	55                   	push   %rbp
  80112b:	48 89 e5             	mov    %rsp,%rbp
  80112e:	48 83 ec 18          	sub    $0x18,%rsp
  801132:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801136:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80113d:	eb 09                	jmp    801148 <strlen+0x1e>
  80113f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801143:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801148:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80114c:	0f b6 00             	movzbl (%rax),%eax
  80114f:	84 c0                	test   %al,%al
  801151:	75 ec                	jne    80113f <strlen+0x15>
  801153:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801156:	c9                   	leaveq 
  801157:	c3                   	retq   

0000000000801158 <strnlen>:
  801158:	55                   	push   %rbp
  801159:	48 89 e5             	mov    %rsp,%rbp
  80115c:	48 83 ec 20          	sub    $0x20,%rsp
  801160:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801164:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801168:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80116f:	eb 0e                	jmp    80117f <strnlen+0x27>
  801171:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801175:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80117a:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  80117f:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801184:	74 0b                	je     801191 <strnlen+0x39>
  801186:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80118a:	0f b6 00             	movzbl (%rax),%eax
  80118d:	84 c0                	test   %al,%al
  80118f:	75 e0                	jne    801171 <strnlen+0x19>
  801191:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801194:	c9                   	leaveq 
  801195:	c3                   	retq   

0000000000801196 <strcpy>:
  801196:	55                   	push   %rbp
  801197:	48 89 e5             	mov    %rsp,%rbp
  80119a:	48 83 ec 20          	sub    $0x20,%rsp
  80119e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011a2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011aa:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011ae:	90                   	nop
  8011af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011b3:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8011b7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8011bb:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8011bf:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8011c3:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8011c7:	0f b6 12             	movzbl (%rdx),%edx
  8011ca:	88 10                	mov    %dl,(%rax)
  8011cc:	0f b6 00             	movzbl (%rax),%eax
  8011cf:	84 c0                	test   %al,%al
  8011d1:	75 dc                	jne    8011af <strcpy+0x19>
  8011d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011d7:	c9                   	leaveq 
  8011d8:	c3                   	retq   

00000000008011d9 <strcat>:
  8011d9:	55                   	push   %rbp
  8011da:	48 89 e5             	mov    %rsp,%rbp
  8011dd:	48 83 ec 20          	sub    $0x20,%rsp
  8011e1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011e5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011ed:	48 89 c7             	mov    %rax,%rdi
  8011f0:	48 b8 2a 11 80 00 00 	movabs $0x80112a,%rax
  8011f7:	00 00 00 
  8011fa:	ff d0                	callq  *%rax
  8011fc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8011ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801202:	48 63 d0             	movslq %eax,%rdx
  801205:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801209:	48 01 c2             	add    %rax,%rdx
  80120c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801210:	48 89 c6             	mov    %rax,%rsi
  801213:	48 89 d7             	mov    %rdx,%rdi
  801216:	48 b8 96 11 80 00 00 	movabs $0x801196,%rax
  80121d:	00 00 00 
  801220:	ff d0                	callq  *%rax
  801222:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801226:	c9                   	leaveq 
  801227:	c3                   	retq   

0000000000801228 <strncpy>:
  801228:	55                   	push   %rbp
  801229:	48 89 e5             	mov    %rsp,%rbp
  80122c:	48 83 ec 28          	sub    $0x28,%rsp
  801230:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801234:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801238:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80123c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801240:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801244:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80124b:	00 
  80124c:	eb 2a                	jmp    801278 <strncpy+0x50>
  80124e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801252:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801256:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80125a:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80125e:	0f b6 12             	movzbl (%rdx),%edx
  801261:	88 10                	mov    %dl,(%rax)
  801263:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801267:	0f b6 00             	movzbl (%rax),%eax
  80126a:	84 c0                	test   %al,%al
  80126c:	74 05                	je     801273 <strncpy+0x4b>
  80126e:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801273:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801278:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80127c:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801280:	72 cc                	jb     80124e <strncpy+0x26>
  801282:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801286:	c9                   	leaveq 
  801287:	c3                   	retq   

0000000000801288 <strlcpy>:
  801288:	55                   	push   %rbp
  801289:	48 89 e5             	mov    %rsp,%rbp
  80128c:	48 83 ec 28          	sub    $0x28,%rsp
  801290:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801294:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801298:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80129c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012a0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8012a4:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8012a9:	74 3d                	je     8012e8 <strlcpy+0x60>
  8012ab:	eb 1d                	jmp    8012ca <strlcpy+0x42>
  8012ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012b1:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8012b5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012b9:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8012bd:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8012c1:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8012c5:	0f b6 12             	movzbl (%rdx),%edx
  8012c8:	88 10                	mov    %dl,(%rax)
  8012ca:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8012cf:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8012d4:	74 0b                	je     8012e1 <strlcpy+0x59>
  8012d6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8012da:	0f b6 00             	movzbl (%rax),%eax
  8012dd:	84 c0                	test   %al,%al
  8012df:	75 cc                	jne    8012ad <strlcpy+0x25>
  8012e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012e5:	c6 00 00             	movb   $0x0,(%rax)
  8012e8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8012ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012f0:	48 29 c2             	sub    %rax,%rdx
  8012f3:	48 89 d0             	mov    %rdx,%rax
  8012f6:	c9                   	leaveq 
  8012f7:	c3                   	retq   

00000000008012f8 <strcmp>:
  8012f8:	55                   	push   %rbp
  8012f9:	48 89 e5             	mov    %rsp,%rbp
  8012fc:	48 83 ec 10          	sub    $0x10,%rsp
  801300:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801304:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801308:	eb 0a                	jmp    801314 <strcmp+0x1c>
  80130a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80130f:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801314:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801318:	0f b6 00             	movzbl (%rax),%eax
  80131b:	84 c0                	test   %al,%al
  80131d:	74 12                	je     801331 <strcmp+0x39>
  80131f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801323:	0f b6 10             	movzbl (%rax),%edx
  801326:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80132a:	0f b6 00             	movzbl (%rax),%eax
  80132d:	38 c2                	cmp    %al,%dl
  80132f:	74 d9                	je     80130a <strcmp+0x12>
  801331:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801335:	0f b6 00             	movzbl (%rax),%eax
  801338:	0f b6 d0             	movzbl %al,%edx
  80133b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80133f:	0f b6 00             	movzbl (%rax),%eax
  801342:	0f b6 c0             	movzbl %al,%eax
  801345:	29 c2                	sub    %eax,%edx
  801347:	89 d0                	mov    %edx,%eax
  801349:	c9                   	leaveq 
  80134a:	c3                   	retq   

000000000080134b <strncmp>:
  80134b:	55                   	push   %rbp
  80134c:	48 89 e5             	mov    %rsp,%rbp
  80134f:	48 83 ec 18          	sub    $0x18,%rsp
  801353:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801357:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80135b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80135f:	eb 0f                	jmp    801370 <strncmp+0x25>
  801361:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801366:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80136b:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801370:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801375:	74 1d                	je     801394 <strncmp+0x49>
  801377:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80137b:	0f b6 00             	movzbl (%rax),%eax
  80137e:	84 c0                	test   %al,%al
  801380:	74 12                	je     801394 <strncmp+0x49>
  801382:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801386:	0f b6 10             	movzbl (%rax),%edx
  801389:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80138d:	0f b6 00             	movzbl (%rax),%eax
  801390:	38 c2                	cmp    %al,%dl
  801392:	74 cd                	je     801361 <strncmp+0x16>
  801394:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801399:	75 07                	jne    8013a2 <strncmp+0x57>
  80139b:	b8 00 00 00 00       	mov    $0x0,%eax
  8013a0:	eb 18                	jmp    8013ba <strncmp+0x6f>
  8013a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013a6:	0f b6 00             	movzbl (%rax),%eax
  8013a9:	0f b6 d0             	movzbl %al,%edx
  8013ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013b0:	0f b6 00             	movzbl (%rax),%eax
  8013b3:	0f b6 c0             	movzbl %al,%eax
  8013b6:	29 c2                	sub    %eax,%edx
  8013b8:	89 d0                	mov    %edx,%eax
  8013ba:	c9                   	leaveq 
  8013bb:	c3                   	retq   

00000000008013bc <strchr>:
  8013bc:	55                   	push   %rbp
  8013bd:	48 89 e5             	mov    %rsp,%rbp
  8013c0:	48 83 ec 10          	sub    $0x10,%rsp
  8013c4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013c8:	89 f0                	mov    %esi,%eax
  8013ca:	88 45 f4             	mov    %al,-0xc(%rbp)
  8013cd:	eb 17                	jmp    8013e6 <strchr+0x2a>
  8013cf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013d3:	0f b6 00             	movzbl (%rax),%eax
  8013d6:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8013d9:	75 06                	jne    8013e1 <strchr+0x25>
  8013db:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013df:	eb 15                	jmp    8013f6 <strchr+0x3a>
  8013e1:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8013e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013ea:	0f b6 00             	movzbl (%rax),%eax
  8013ed:	84 c0                	test   %al,%al
  8013ef:	75 de                	jne    8013cf <strchr+0x13>
  8013f1:	b8 00 00 00 00       	mov    $0x0,%eax
  8013f6:	c9                   	leaveq 
  8013f7:	c3                   	retq   

00000000008013f8 <strfind>:
  8013f8:	55                   	push   %rbp
  8013f9:	48 89 e5             	mov    %rsp,%rbp
  8013fc:	48 83 ec 10          	sub    $0x10,%rsp
  801400:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801404:	89 f0                	mov    %esi,%eax
  801406:	88 45 f4             	mov    %al,-0xc(%rbp)
  801409:	eb 11                	jmp    80141c <strfind+0x24>
  80140b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80140f:	0f b6 00             	movzbl (%rax),%eax
  801412:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801415:	74 12                	je     801429 <strfind+0x31>
  801417:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80141c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801420:	0f b6 00             	movzbl (%rax),%eax
  801423:	84 c0                	test   %al,%al
  801425:	75 e4                	jne    80140b <strfind+0x13>
  801427:	eb 01                	jmp    80142a <strfind+0x32>
  801429:	90                   	nop
  80142a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80142e:	c9                   	leaveq 
  80142f:	c3                   	retq   

0000000000801430 <memset>:
  801430:	55                   	push   %rbp
  801431:	48 89 e5             	mov    %rsp,%rbp
  801434:	48 83 ec 18          	sub    $0x18,%rsp
  801438:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80143c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80143f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801443:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801448:	75 06                	jne    801450 <memset+0x20>
  80144a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80144e:	eb 69                	jmp    8014b9 <memset+0x89>
  801450:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801454:	83 e0 03             	and    $0x3,%eax
  801457:	48 85 c0             	test   %rax,%rax
  80145a:	75 48                	jne    8014a4 <memset+0x74>
  80145c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801460:	83 e0 03             	and    $0x3,%eax
  801463:	48 85 c0             	test   %rax,%rax
  801466:	75 3c                	jne    8014a4 <memset+0x74>
  801468:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  80146f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801472:	c1 e0 18             	shl    $0x18,%eax
  801475:	89 c2                	mov    %eax,%edx
  801477:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80147a:	c1 e0 10             	shl    $0x10,%eax
  80147d:	09 c2                	or     %eax,%edx
  80147f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801482:	c1 e0 08             	shl    $0x8,%eax
  801485:	09 d0                	or     %edx,%eax
  801487:	09 45 f4             	or     %eax,-0xc(%rbp)
  80148a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80148e:	48 c1 e8 02          	shr    $0x2,%rax
  801492:	48 89 c1             	mov    %rax,%rcx
  801495:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801499:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80149c:	48 89 d7             	mov    %rdx,%rdi
  80149f:	fc                   	cld    
  8014a0:	f3 ab                	rep stos %eax,%es:(%rdi)
  8014a2:	eb 11                	jmp    8014b5 <memset+0x85>
  8014a4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014a8:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014ab:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8014af:	48 89 d7             	mov    %rdx,%rdi
  8014b2:	fc                   	cld    
  8014b3:	f3 aa                	rep stos %al,%es:(%rdi)
  8014b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014b9:	c9                   	leaveq 
  8014ba:	c3                   	retq   

00000000008014bb <memmove>:
  8014bb:	55                   	push   %rbp
  8014bc:	48 89 e5             	mov    %rsp,%rbp
  8014bf:	48 83 ec 28          	sub    $0x28,%rsp
  8014c3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014c7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014cb:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014cf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014d3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8014d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014db:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8014df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014e3:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8014e7:	0f 83 88 00 00 00    	jae    801575 <memmove+0xba>
  8014ed:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014f1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014f5:	48 01 d0             	add    %rdx,%rax
  8014f8:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8014fc:	76 77                	jbe    801575 <memmove+0xba>
  8014fe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801502:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801506:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80150a:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  80150e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801512:	83 e0 03             	and    $0x3,%eax
  801515:	48 85 c0             	test   %rax,%rax
  801518:	75 3b                	jne    801555 <memmove+0x9a>
  80151a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80151e:	83 e0 03             	and    $0x3,%eax
  801521:	48 85 c0             	test   %rax,%rax
  801524:	75 2f                	jne    801555 <memmove+0x9a>
  801526:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80152a:	83 e0 03             	and    $0x3,%eax
  80152d:	48 85 c0             	test   %rax,%rax
  801530:	75 23                	jne    801555 <memmove+0x9a>
  801532:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801536:	48 83 e8 04          	sub    $0x4,%rax
  80153a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80153e:	48 83 ea 04          	sub    $0x4,%rdx
  801542:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801546:	48 c1 e9 02          	shr    $0x2,%rcx
  80154a:	48 89 c7             	mov    %rax,%rdi
  80154d:	48 89 d6             	mov    %rdx,%rsi
  801550:	fd                   	std    
  801551:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801553:	eb 1d                	jmp    801572 <memmove+0xb7>
  801555:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801559:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80155d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801561:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801565:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801569:	48 89 d7             	mov    %rdx,%rdi
  80156c:	48 89 c1             	mov    %rax,%rcx
  80156f:	fd                   	std    
  801570:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801572:	fc                   	cld    
  801573:	eb 57                	jmp    8015cc <memmove+0x111>
  801575:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801579:	83 e0 03             	and    $0x3,%eax
  80157c:	48 85 c0             	test   %rax,%rax
  80157f:	75 36                	jne    8015b7 <memmove+0xfc>
  801581:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801585:	83 e0 03             	and    $0x3,%eax
  801588:	48 85 c0             	test   %rax,%rax
  80158b:	75 2a                	jne    8015b7 <memmove+0xfc>
  80158d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801591:	83 e0 03             	and    $0x3,%eax
  801594:	48 85 c0             	test   %rax,%rax
  801597:	75 1e                	jne    8015b7 <memmove+0xfc>
  801599:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80159d:	48 c1 e8 02          	shr    $0x2,%rax
  8015a1:	48 89 c1             	mov    %rax,%rcx
  8015a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015a8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8015ac:	48 89 c7             	mov    %rax,%rdi
  8015af:	48 89 d6             	mov    %rdx,%rsi
  8015b2:	fc                   	cld    
  8015b3:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8015b5:	eb 15                	jmp    8015cc <memmove+0x111>
  8015b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015bb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8015bf:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8015c3:	48 89 c7             	mov    %rax,%rdi
  8015c6:	48 89 d6             	mov    %rdx,%rsi
  8015c9:	fc                   	cld    
  8015ca:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8015cc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015d0:	c9                   	leaveq 
  8015d1:	c3                   	retq   

00000000008015d2 <memcpy>:
  8015d2:	55                   	push   %rbp
  8015d3:	48 89 e5             	mov    %rsp,%rbp
  8015d6:	48 83 ec 18          	sub    $0x18,%rsp
  8015da:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015de:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8015e2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8015e6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8015ea:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8015ee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015f2:	48 89 ce             	mov    %rcx,%rsi
  8015f5:	48 89 c7             	mov    %rax,%rdi
  8015f8:	48 b8 bb 14 80 00 00 	movabs $0x8014bb,%rax
  8015ff:	00 00 00 
  801602:	ff d0                	callq  *%rax
  801604:	c9                   	leaveq 
  801605:	c3                   	retq   

0000000000801606 <memcmp>:
  801606:	55                   	push   %rbp
  801607:	48 89 e5             	mov    %rsp,%rbp
  80160a:	48 83 ec 28          	sub    $0x28,%rsp
  80160e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801612:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801616:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80161a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80161e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801622:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801626:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80162a:	eb 36                	jmp    801662 <memcmp+0x5c>
  80162c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801630:	0f b6 10             	movzbl (%rax),%edx
  801633:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801637:	0f b6 00             	movzbl (%rax),%eax
  80163a:	38 c2                	cmp    %al,%dl
  80163c:	74 1a                	je     801658 <memcmp+0x52>
  80163e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801642:	0f b6 00             	movzbl (%rax),%eax
  801645:	0f b6 d0             	movzbl %al,%edx
  801648:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80164c:	0f b6 00             	movzbl (%rax),%eax
  80164f:	0f b6 c0             	movzbl %al,%eax
  801652:	29 c2                	sub    %eax,%edx
  801654:	89 d0                	mov    %edx,%eax
  801656:	eb 20                	jmp    801678 <memcmp+0x72>
  801658:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80165d:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801662:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801666:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80166a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80166e:	48 85 c0             	test   %rax,%rax
  801671:	75 b9                	jne    80162c <memcmp+0x26>
  801673:	b8 00 00 00 00       	mov    $0x0,%eax
  801678:	c9                   	leaveq 
  801679:	c3                   	retq   

000000000080167a <memfind>:
  80167a:	55                   	push   %rbp
  80167b:	48 89 e5             	mov    %rsp,%rbp
  80167e:	48 83 ec 28          	sub    $0x28,%rsp
  801682:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801686:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801689:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80168d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801691:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801695:	48 01 d0             	add    %rdx,%rax
  801698:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80169c:	eb 13                	jmp    8016b1 <memfind+0x37>
  80169e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016a2:	0f b6 00             	movzbl (%rax),%eax
  8016a5:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8016a8:	38 d0                	cmp    %dl,%al
  8016aa:	74 11                	je     8016bd <memfind+0x43>
  8016ac:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8016b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016b5:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8016b9:	72 e3                	jb     80169e <memfind+0x24>
  8016bb:	eb 01                	jmp    8016be <memfind+0x44>
  8016bd:	90                   	nop
  8016be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016c2:	c9                   	leaveq 
  8016c3:	c3                   	retq   

00000000008016c4 <strtol>:
  8016c4:	55                   	push   %rbp
  8016c5:	48 89 e5             	mov    %rsp,%rbp
  8016c8:	48 83 ec 38          	sub    $0x38,%rsp
  8016cc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8016d0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8016d4:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8016d7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8016de:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8016e5:	00 
  8016e6:	eb 05                	jmp    8016ed <strtol+0x29>
  8016e8:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016f1:	0f b6 00             	movzbl (%rax),%eax
  8016f4:	3c 20                	cmp    $0x20,%al
  8016f6:	74 f0                	je     8016e8 <strtol+0x24>
  8016f8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016fc:	0f b6 00             	movzbl (%rax),%eax
  8016ff:	3c 09                	cmp    $0x9,%al
  801701:	74 e5                	je     8016e8 <strtol+0x24>
  801703:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801707:	0f b6 00             	movzbl (%rax),%eax
  80170a:	3c 2b                	cmp    $0x2b,%al
  80170c:	75 07                	jne    801715 <strtol+0x51>
  80170e:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801713:	eb 17                	jmp    80172c <strtol+0x68>
  801715:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801719:	0f b6 00             	movzbl (%rax),%eax
  80171c:	3c 2d                	cmp    $0x2d,%al
  80171e:	75 0c                	jne    80172c <strtol+0x68>
  801720:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801725:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  80172c:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801730:	74 06                	je     801738 <strtol+0x74>
  801732:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801736:	75 28                	jne    801760 <strtol+0x9c>
  801738:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80173c:	0f b6 00             	movzbl (%rax),%eax
  80173f:	3c 30                	cmp    $0x30,%al
  801741:	75 1d                	jne    801760 <strtol+0x9c>
  801743:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801747:	48 83 c0 01          	add    $0x1,%rax
  80174b:	0f b6 00             	movzbl (%rax),%eax
  80174e:	3c 78                	cmp    $0x78,%al
  801750:	75 0e                	jne    801760 <strtol+0x9c>
  801752:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801757:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  80175e:	eb 2c                	jmp    80178c <strtol+0xc8>
  801760:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801764:	75 19                	jne    80177f <strtol+0xbb>
  801766:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80176a:	0f b6 00             	movzbl (%rax),%eax
  80176d:	3c 30                	cmp    $0x30,%al
  80176f:	75 0e                	jne    80177f <strtol+0xbb>
  801771:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801776:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  80177d:	eb 0d                	jmp    80178c <strtol+0xc8>
  80177f:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801783:	75 07                	jne    80178c <strtol+0xc8>
  801785:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  80178c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801790:	0f b6 00             	movzbl (%rax),%eax
  801793:	3c 2f                	cmp    $0x2f,%al
  801795:	7e 1d                	jle    8017b4 <strtol+0xf0>
  801797:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80179b:	0f b6 00             	movzbl (%rax),%eax
  80179e:	3c 39                	cmp    $0x39,%al
  8017a0:	7f 12                	jg     8017b4 <strtol+0xf0>
  8017a2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a6:	0f b6 00             	movzbl (%rax),%eax
  8017a9:	0f be c0             	movsbl %al,%eax
  8017ac:	83 e8 30             	sub    $0x30,%eax
  8017af:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8017b2:	eb 4e                	jmp    801802 <strtol+0x13e>
  8017b4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017b8:	0f b6 00             	movzbl (%rax),%eax
  8017bb:	3c 60                	cmp    $0x60,%al
  8017bd:	7e 1d                	jle    8017dc <strtol+0x118>
  8017bf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017c3:	0f b6 00             	movzbl (%rax),%eax
  8017c6:	3c 7a                	cmp    $0x7a,%al
  8017c8:	7f 12                	jg     8017dc <strtol+0x118>
  8017ca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017ce:	0f b6 00             	movzbl (%rax),%eax
  8017d1:	0f be c0             	movsbl %al,%eax
  8017d4:	83 e8 57             	sub    $0x57,%eax
  8017d7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8017da:	eb 26                	jmp    801802 <strtol+0x13e>
  8017dc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017e0:	0f b6 00             	movzbl (%rax),%eax
  8017e3:	3c 40                	cmp    $0x40,%al
  8017e5:	7e 47                	jle    80182e <strtol+0x16a>
  8017e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017eb:	0f b6 00             	movzbl (%rax),%eax
  8017ee:	3c 5a                	cmp    $0x5a,%al
  8017f0:	7f 3c                	jg     80182e <strtol+0x16a>
  8017f2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017f6:	0f b6 00             	movzbl (%rax),%eax
  8017f9:	0f be c0             	movsbl %al,%eax
  8017fc:	83 e8 37             	sub    $0x37,%eax
  8017ff:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801802:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801805:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801808:	7d 23                	jge    80182d <strtol+0x169>
  80180a:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80180f:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801812:	48 98                	cltq   
  801814:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801819:	48 89 c2             	mov    %rax,%rdx
  80181c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80181f:	48 98                	cltq   
  801821:	48 01 d0             	add    %rdx,%rax
  801824:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801828:	e9 5f ff ff ff       	jmpq   80178c <strtol+0xc8>
  80182d:	90                   	nop
  80182e:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801833:	74 0b                	je     801840 <strtol+0x17c>
  801835:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801839:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80183d:	48 89 10             	mov    %rdx,(%rax)
  801840:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801844:	74 09                	je     80184f <strtol+0x18b>
  801846:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80184a:	48 f7 d8             	neg    %rax
  80184d:	eb 04                	jmp    801853 <strtol+0x18f>
  80184f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801853:	c9                   	leaveq 
  801854:	c3                   	retq   

0000000000801855 <strstr>:
  801855:	55                   	push   %rbp
  801856:	48 89 e5             	mov    %rsp,%rbp
  801859:	48 83 ec 30          	sub    $0x30,%rsp
  80185d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801861:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801865:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801869:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80186d:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801871:	0f b6 00             	movzbl (%rax),%eax
  801874:	88 45 ff             	mov    %al,-0x1(%rbp)
  801877:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  80187b:	75 06                	jne    801883 <strstr+0x2e>
  80187d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801881:	eb 6b                	jmp    8018ee <strstr+0x99>
  801883:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801887:	48 89 c7             	mov    %rax,%rdi
  80188a:	48 b8 2a 11 80 00 00 	movabs $0x80112a,%rax
  801891:	00 00 00 
  801894:	ff d0                	callq  *%rax
  801896:	48 98                	cltq   
  801898:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80189c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018a0:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8018a4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8018a8:	0f b6 00             	movzbl (%rax),%eax
  8018ab:	88 45 ef             	mov    %al,-0x11(%rbp)
  8018ae:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8018b2:	75 07                	jne    8018bb <strstr+0x66>
  8018b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8018b9:	eb 33                	jmp    8018ee <strstr+0x99>
  8018bb:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8018bf:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8018c2:	75 d8                	jne    80189c <strstr+0x47>
  8018c4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018c8:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8018cc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018d0:	48 89 ce             	mov    %rcx,%rsi
  8018d3:	48 89 c7             	mov    %rax,%rdi
  8018d6:	48 b8 4b 13 80 00 00 	movabs $0x80134b,%rax
  8018dd:	00 00 00 
  8018e0:	ff d0                	callq  *%rax
  8018e2:	85 c0                	test   %eax,%eax
  8018e4:	75 b6                	jne    80189c <strstr+0x47>
  8018e6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018ea:	48 83 e8 01          	sub    $0x1,%rax
  8018ee:	c9                   	leaveq 
  8018ef:	c3                   	retq   

00000000008018f0 <syscall>:
  8018f0:	55                   	push   %rbp
  8018f1:	48 89 e5             	mov    %rsp,%rbp
  8018f4:	53                   	push   %rbx
  8018f5:	48 83 ec 48          	sub    $0x48,%rsp
  8018f9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8018fc:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8018ff:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801903:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801907:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  80190b:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  80190f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801912:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801916:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  80191a:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  80191e:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801922:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801926:	4c 89 c3             	mov    %r8,%rbx
  801929:	cd 30                	int    $0x30
  80192b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80192f:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801933:	74 3e                	je     801973 <syscall+0x83>
  801935:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80193a:	7e 37                	jle    801973 <syscall+0x83>
  80193c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801940:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801943:	49 89 d0             	mov    %rdx,%r8
  801946:	89 c1                	mov    %eax,%ecx
  801948:	48 ba 68 4f 80 00 00 	movabs $0x804f68,%rdx
  80194f:	00 00 00 
  801952:	be 24 00 00 00       	mov    $0x24,%esi
  801957:	48 bf 85 4f 80 00 00 	movabs $0x804f85,%rdi
  80195e:	00 00 00 
  801961:	b8 00 00 00 00       	mov    $0x0,%eax
  801966:	49 b9 cc 03 80 00 00 	movabs $0x8003cc,%r9
  80196d:	00 00 00 
  801970:	41 ff d1             	callq  *%r9
  801973:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801977:	48 83 c4 48          	add    $0x48,%rsp
  80197b:	5b                   	pop    %rbx
  80197c:	5d                   	pop    %rbp
  80197d:	c3                   	retq   

000000000080197e <sys_cputs>:
  80197e:	55                   	push   %rbp
  80197f:	48 89 e5             	mov    %rsp,%rbp
  801982:	48 83 ec 10          	sub    $0x10,%rsp
  801986:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80198a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80198e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801992:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801996:	48 83 ec 08          	sub    $0x8,%rsp
  80199a:	6a 00                	pushq  $0x0
  80199c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019a2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019a8:	48 89 d1             	mov    %rdx,%rcx
  8019ab:	48 89 c2             	mov    %rax,%rdx
  8019ae:	be 00 00 00 00       	mov    $0x0,%esi
  8019b3:	bf 00 00 00 00       	mov    $0x0,%edi
  8019b8:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  8019bf:	00 00 00 
  8019c2:	ff d0                	callq  *%rax
  8019c4:	48 83 c4 10          	add    $0x10,%rsp
  8019c8:	90                   	nop
  8019c9:	c9                   	leaveq 
  8019ca:	c3                   	retq   

00000000008019cb <sys_cgetc>:
  8019cb:	55                   	push   %rbp
  8019cc:	48 89 e5             	mov    %rsp,%rbp
  8019cf:	48 83 ec 08          	sub    $0x8,%rsp
  8019d3:	6a 00                	pushq  $0x0
  8019d5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019db:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019e1:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019e6:	ba 00 00 00 00       	mov    $0x0,%edx
  8019eb:	be 00 00 00 00       	mov    $0x0,%esi
  8019f0:	bf 01 00 00 00       	mov    $0x1,%edi
  8019f5:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  8019fc:	00 00 00 
  8019ff:	ff d0                	callq  *%rax
  801a01:	48 83 c4 10          	add    $0x10,%rsp
  801a05:	c9                   	leaveq 
  801a06:	c3                   	retq   

0000000000801a07 <sys_env_destroy>:
  801a07:	55                   	push   %rbp
  801a08:	48 89 e5             	mov    %rsp,%rbp
  801a0b:	48 83 ec 10          	sub    $0x10,%rsp
  801a0f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a12:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a15:	48 98                	cltq   
  801a17:	48 83 ec 08          	sub    $0x8,%rsp
  801a1b:	6a 00                	pushq  $0x0
  801a1d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a23:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a29:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a2e:	48 89 c2             	mov    %rax,%rdx
  801a31:	be 01 00 00 00       	mov    $0x1,%esi
  801a36:	bf 03 00 00 00       	mov    $0x3,%edi
  801a3b:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  801a42:	00 00 00 
  801a45:	ff d0                	callq  *%rax
  801a47:	48 83 c4 10          	add    $0x10,%rsp
  801a4b:	c9                   	leaveq 
  801a4c:	c3                   	retq   

0000000000801a4d <sys_getenvid>:
  801a4d:	55                   	push   %rbp
  801a4e:	48 89 e5             	mov    %rsp,%rbp
  801a51:	48 83 ec 08          	sub    $0x8,%rsp
  801a55:	6a 00                	pushq  $0x0
  801a57:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a5d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a63:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a68:	ba 00 00 00 00       	mov    $0x0,%edx
  801a6d:	be 00 00 00 00       	mov    $0x0,%esi
  801a72:	bf 02 00 00 00       	mov    $0x2,%edi
  801a77:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  801a7e:	00 00 00 
  801a81:	ff d0                	callq  *%rax
  801a83:	48 83 c4 10          	add    $0x10,%rsp
  801a87:	c9                   	leaveq 
  801a88:	c3                   	retq   

0000000000801a89 <sys_yield>:
  801a89:	55                   	push   %rbp
  801a8a:	48 89 e5             	mov    %rsp,%rbp
  801a8d:	48 83 ec 08          	sub    $0x8,%rsp
  801a91:	6a 00                	pushq  $0x0
  801a93:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a99:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a9f:	b9 00 00 00 00       	mov    $0x0,%ecx
  801aa4:	ba 00 00 00 00       	mov    $0x0,%edx
  801aa9:	be 00 00 00 00       	mov    $0x0,%esi
  801aae:	bf 0b 00 00 00       	mov    $0xb,%edi
  801ab3:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  801aba:	00 00 00 
  801abd:	ff d0                	callq  *%rax
  801abf:	48 83 c4 10          	add    $0x10,%rsp
  801ac3:	90                   	nop
  801ac4:	c9                   	leaveq 
  801ac5:	c3                   	retq   

0000000000801ac6 <sys_page_alloc>:
  801ac6:	55                   	push   %rbp
  801ac7:	48 89 e5             	mov    %rsp,%rbp
  801aca:	48 83 ec 10          	sub    $0x10,%rsp
  801ace:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ad1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ad5:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801ad8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801adb:	48 63 c8             	movslq %eax,%rcx
  801ade:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ae2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ae5:	48 98                	cltq   
  801ae7:	48 83 ec 08          	sub    $0x8,%rsp
  801aeb:	6a 00                	pushq  $0x0
  801aed:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801af3:	49 89 c8             	mov    %rcx,%r8
  801af6:	48 89 d1             	mov    %rdx,%rcx
  801af9:	48 89 c2             	mov    %rax,%rdx
  801afc:	be 01 00 00 00       	mov    $0x1,%esi
  801b01:	bf 04 00 00 00       	mov    $0x4,%edi
  801b06:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  801b0d:	00 00 00 
  801b10:	ff d0                	callq  *%rax
  801b12:	48 83 c4 10          	add    $0x10,%rsp
  801b16:	c9                   	leaveq 
  801b17:	c3                   	retq   

0000000000801b18 <sys_page_map>:
  801b18:	55                   	push   %rbp
  801b19:	48 89 e5             	mov    %rsp,%rbp
  801b1c:	48 83 ec 20          	sub    $0x20,%rsp
  801b20:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b23:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b27:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801b2a:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801b2e:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801b32:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801b35:	48 63 c8             	movslq %eax,%rcx
  801b38:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801b3c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b3f:	48 63 f0             	movslq %eax,%rsi
  801b42:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b46:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b49:	48 98                	cltq   
  801b4b:	48 83 ec 08          	sub    $0x8,%rsp
  801b4f:	51                   	push   %rcx
  801b50:	49 89 f9             	mov    %rdi,%r9
  801b53:	49 89 f0             	mov    %rsi,%r8
  801b56:	48 89 d1             	mov    %rdx,%rcx
  801b59:	48 89 c2             	mov    %rax,%rdx
  801b5c:	be 01 00 00 00       	mov    $0x1,%esi
  801b61:	bf 05 00 00 00       	mov    $0x5,%edi
  801b66:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  801b6d:	00 00 00 
  801b70:	ff d0                	callq  *%rax
  801b72:	48 83 c4 10          	add    $0x10,%rsp
  801b76:	c9                   	leaveq 
  801b77:	c3                   	retq   

0000000000801b78 <sys_page_unmap>:
  801b78:	55                   	push   %rbp
  801b79:	48 89 e5             	mov    %rsp,%rbp
  801b7c:	48 83 ec 10          	sub    $0x10,%rsp
  801b80:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b83:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b87:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b8b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b8e:	48 98                	cltq   
  801b90:	48 83 ec 08          	sub    $0x8,%rsp
  801b94:	6a 00                	pushq  $0x0
  801b96:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b9c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ba2:	48 89 d1             	mov    %rdx,%rcx
  801ba5:	48 89 c2             	mov    %rax,%rdx
  801ba8:	be 01 00 00 00       	mov    $0x1,%esi
  801bad:	bf 06 00 00 00       	mov    $0x6,%edi
  801bb2:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  801bb9:	00 00 00 
  801bbc:	ff d0                	callq  *%rax
  801bbe:	48 83 c4 10          	add    $0x10,%rsp
  801bc2:	c9                   	leaveq 
  801bc3:	c3                   	retq   

0000000000801bc4 <sys_env_set_status>:
  801bc4:	55                   	push   %rbp
  801bc5:	48 89 e5             	mov    %rsp,%rbp
  801bc8:	48 83 ec 10          	sub    $0x10,%rsp
  801bcc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bcf:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801bd2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801bd5:	48 63 d0             	movslq %eax,%rdx
  801bd8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bdb:	48 98                	cltq   
  801bdd:	48 83 ec 08          	sub    $0x8,%rsp
  801be1:	6a 00                	pushq  $0x0
  801be3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801be9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bef:	48 89 d1             	mov    %rdx,%rcx
  801bf2:	48 89 c2             	mov    %rax,%rdx
  801bf5:	be 01 00 00 00       	mov    $0x1,%esi
  801bfa:	bf 08 00 00 00       	mov    $0x8,%edi
  801bff:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  801c06:	00 00 00 
  801c09:	ff d0                	callq  *%rax
  801c0b:	48 83 c4 10          	add    $0x10,%rsp
  801c0f:	c9                   	leaveq 
  801c10:	c3                   	retq   

0000000000801c11 <sys_env_set_trapframe>:
  801c11:	55                   	push   %rbp
  801c12:	48 89 e5             	mov    %rsp,%rbp
  801c15:	48 83 ec 10          	sub    $0x10,%rsp
  801c19:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c1c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c20:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c24:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c27:	48 98                	cltq   
  801c29:	48 83 ec 08          	sub    $0x8,%rsp
  801c2d:	6a 00                	pushq  $0x0
  801c2f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c35:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c3b:	48 89 d1             	mov    %rdx,%rcx
  801c3e:	48 89 c2             	mov    %rax,%rdx
  801c41:	be 01 00 00 00       	mov    $0x1,%esi
  801c46:	bf 09 00 00 00       	mov    $0x9,%edi
  801c4b:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  801c52:	00 00 00 
  801c55:	ff d0                	callq  *%rax
  801c57:	48 83 c4 10          	add    $0x10,%rsp
  801c5b:	c9                   	leaveq 
  801c5c:	c3                   	retq   

0000000000801c5d <sys_env_set_pgfault_upcall>:
  801c5d:	55                   	push   %rbp
  801c5e:	48 89 e5             	mov    %rsp,%rbp
  801c61:	48 83 ec 10          	sub    $0x10,%rsp
  801c65:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c68:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c6c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c70:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c73:	48 98                	cltq   
  801c75:	48 83 ec 08          	sub    $0x8,%rsp
  801c79:	6a 00                	pushq  $0x0
  801c7b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c81:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c87:	48 89 d1             	mov    %rdx,%rcx
  801c8a:	48 89 c2             	mov    %rax,%rdx
  801c8d:	be 01 00 00 00       	mov    $0x1,%esi
  801c92:	bf 0a 00 00 00       	mov    $0xa,%edi
  801c97:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  801c9e:	00 00 00 
  801ca1:	ff d0                	callq  *%rax
  801ca3:	48 83 c4 10          	add    $0x10,%rsp
  801ca7:	c9                   	leaveq 
  801ca8:	c3                   	retq   

0000000000801ca9 <sys_ipc_try_send>:
  801ca9:	55                   	push   %rbp
  801caa:	48 89 e5             	mov    %rsp,%rbp
  801cad:	48 83 ec 20          	sub    $0x20,%rsp
  801cb1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cb4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801cb8:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801cbc:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801cbf:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801cc2:	48 63 f0             	movslq %eax,%rsi
  801cc5:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801cc9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ccc:	48 98                	cltq   
  801cce:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801cd2:	48 83 ec 08          	sub    $0x8,%rsp
  801cd6:	6a 00                	pushq  $0x0
  801cd8:	49 89 f1             	mov    %rsi,%r9
  801cdb:	49 89 c8             	mov    %rcx,%r8
  801cde:	48 89 d1             	mov    %rdx,%rcx
  801ce1:	48 89 c2             	mov    %rax,%rdx
  801ce4:	be 00 00 00 00       	mov    $0x0,%esi
  801ce9:	bf 0c 00 00 00       	mov    $0xc,%edi
  801cee:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  801cf5:	00 00 00 
  801cf8:	ff d0                	callq  *%rax
  801cfa:	48 83 c4 10          	add    $0x10,%rsp
  801cfe:	c9                   	leaveq 
  801cff:	c3                   	retq   

0000000000801d00 <sys_ipc_recv>:
  801d00:	55                   	push   %rbp
  801d01:	48 89 e5             	mov    %rsp,%rbp
  801d04:	48 83 ec 10          	sub    $0x10,%rsp
  801d08:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d0c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d10:	48 83 ec 08          	sub    $0x8,%rsp
  801d14:	6a 00                	pushq  $0x0
  801d16:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d1c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d22:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d27:	48 89 c2             	mov    %rax,%rdx
  801d2a:	be 01 00 00 00       	mov    $0x1,%esi
  801d2f:	bf 0d 00 00 00       	mov    $0xd,%edi
  801d34:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  801d3b:	00 00 00 
  801d3e:	ff d0                	callq  *%rax
  801d40:	48 83 c4 10          	add    $0x10,%rsp
  801d44:	c9                   	leaveq 
  801d45:	c3                   	retq   

0000000000801d46 <sys_time_msec>:
  801d46:	55                   	push   %rbp
  801d47:	48 89 e5             	mov    %rsp,%rbp
  801d4a:	48 83 ec 08          	sub    $0x8,%rsp
  801d4e:	6a 00                	pushq  $0x0
  801d50:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d56:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d5c:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d61:	ba 00 00 00 00       	mov    $0x0,%edx
  801d66:	be 00 00 00 00       	mov    $0x0,%esi
  801d6b:	bf 0e 00 00 00       	mov    $0xe,%edi
  801d70:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  801d77:	00 00 00 
  801d7a:	ff d0                	callq  *%rax
  801d7c:	48 83 c4 10          	add    $0x10,%rsp
  801d80:	c9                   	leaveq 
  801d81:	c3                   	retq   

0000000000801d82 <sys_net_transmit>:
  801d82:	55                   	push   %rbp
  801d83:	48 89 e5             	mov    %rsp,%rbp
  801d86:	48 83 ec 10          	sub    $0x10,%rsp
  801d8a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d8e:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801d91:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801d94:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d98:	48 83 ec 08          	sub    $0x8,%rsp
  801d9c:	6a 00                	pushq  $0x0
  801d9e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801da4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801daa:	48 89 d1             	mov    %rdx,%rcx
  801dad:	48 89 c2             	mov    %rax,%rdx
  801db0:	be 00 00 00 00       	mov    $0x0,%esi
  801db5:	bf 0f 00 00 00       	mov    $0xf,%edi
  801dba:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  801dc1:	00 00 00 
  801dc4:	ff d0                	callq  *%rax
  801dc6:	48 83 c4 10          	add    $0x10,%rsp
  801dca:	c9                   	leaveq 
  801dcb:	c3                   	retq   

0000000000801dcc <sys_net_receive>:
  801dcc:	55                   	push   %rbp
  801dcd:	48 89 e5             	mov    %rsp,%rbp
  801dd0:	48 83 ec 10          	sub    $0x10,%rsp
  801dd4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801dd8:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801ddb:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801dde:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801de2:	48 83 ec 08          	sub    $0x8,%rsp
  801de6:	6a 00                	pushq  $0x0
  801de8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dee:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801df4:	48 89 d1             	mov    %rdx,%rcx
  801df7:	48 89 c2             	mov    %rax,%rdx
  801dfa:	be 00 00 00 00       	mov    $0x0,%esi
  801dff:	bf 10 00 00 00       	mov    $0x10,%edi
  801e04:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  801e0b:	00 00 00 
  801e0e:	ff d0                	callq  *%rax
  801e10:	48 83 c4 10          	add    $0x10,%rsp
  801e14:	c9                   	leaveq 
  801e15:	c3                   	retq   

0000000000801e16 <sys_ept_map>:
  801e16:	55                   	push   %rbp
  801e17:	48 89 e5             	mov    %rsp,%rbp
  801e1a:	48 83 ec 20          	sub    $0x20,%rsp
  801e1e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e21:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e25:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801e28:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801e2c:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801e30:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801e33:	48 63 c8             	movslq %eax,%rcx
  801e36:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801e3a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e3d:	48 63 f0             	movslq %eax,%rsi
  801e40:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e44:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e47:	48 98                	cltq   
  801e49:	48 83 ec 08          	sub    $0x8,%rsp
  801e4d:	51                   	push   %rcx
  801e4e:	49 89 f9             	mov    %rdi,%r9
  801e51:	49 89 f0             	mov    %rsi,%r8
  801e54:	48 89 d1             	mov    %rdx,%rcx
  801e57:	48 89 c2             	mov    %rax,%rdx
  801e5a:	be 00 00 00 00       	mov    $0x0,%esi
  801e5f:	bf 11 00 00 00       	mov    $0x11,%edi
  801e64:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  801e6b:	00 00 00 
  801e6e:	ff d0                	callq  *%rax
  801e70:	48 83 c4 10          	add    $0x10,%rsp
  801e74:	c9                   	leaveq 
  801e75:	c3                   	retq   

0000000000801e76 <sys_env_mkguest>:
  801e76:	55                   	push   %rbp
  801e77:	48 89 e5             	mov    %rsp,%rbp
  801e7a:	48 83 ec 10          	sub    $0x10,%rsp
  801e7e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e82:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e86:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e8a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e8e:	48 83 ec 08          	sub    $0x8,%rsp
  801e92:	6a 00                	pushq  $0x0
  801e94:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e9a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ea0:	48 89 d1             	mov    %rdx,%rcx
  801ea3:	48 89 c2             	mov    %rax,%rdx
  801ea6:	be 00 00 00 00       	mov    $0x0,%esi
  801eab:	bf 12 00 00 00       	mov    $0x12,%edi
  801eb0:	48 b8 f0 18 80 00 00 	movabs $0x8018f0,%rax
  801eb7:	00 00 00 
  801eba:	ff d0                	callq  *%rax
  801ebc:	48 83 c4 10          	add    $0x10,%rsp
  801ec0:	c9                   	leaveq 
  801ec1:	c3                   	retq   

0000000000801ec2 <pgfault>:
  801ec2:	55                   	push   %rbp
  801ec3:	48 89 e5             	mov    %rsp,%rbp
  801ec6:	48 83 ec 30          	sub    $0x30,%rsp
  801eca:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801ece:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ed2:	48 8b 00             	mov    (%rax),%rax
  801ed5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801ed9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801edd:	48 8b 40 08          	mov    0x8(%rax),%rax
  801ee1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801ee4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ee7:	83 e0 02             	and    $0x2,%eax
  801eea:	85 c0                	test   %eax,%eax
  801eec:	75 40                	jne    801f2e <pgfault+0x6c>
  801eee:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ef2:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  801ef9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801efd:	49 89 d0             	mov    %rdx,%r8
  801f00:	48 89 c1             	mov    %rax,%rcx
  801f03:	48 ba 98 4f 80 00 00 	movabs $0x804f98,%rdx
  801f0a:	00 00 00 
  801f0d:	be 1f 00 00 00       	mov    $0x1f,%esi
  801f12:	48 bf b1 4f 80 00 00 	movabs $0x804fb1,%rdi
  801f19:	00 00 00 
  801f1c:	b8 00 00 00 00       	mov    $0x0,%eax
  801f21:	49 b9 cc 03 80 00 00 	movabs $0x8003cc,%r9
  801f28:	00 00 00 
  801f2b:	41 ff d1             	callq  *%r9
  801f2e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f32:	48 c1 e8 0c          	shr    $0xc,%rax
  801f36:	48 89 c2             	mov    %rax,%rdx
  801f39:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f40:	01 00 00 
  801f43:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f47:	25 07 08 00 00       	and    $0x807,%eax
  801f4c:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  801f52:	74 4e                	je     801fa2 <pgfault+0xe0>
  801f54:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f58:	48 c1 e8 0c          	shr    $0xc,%rax
  801f5c:	48 89 c2             	mov    %rax,%rdx
  801f5f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f66:	01 00 00 
  801f69:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  801f6d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f71:	49 89 d0             	mov    %rdx,%r8
  801f74:	48 89 c1             	mov    %rax,%rcx
  801f77:	48 ba c0 4f 80 00 00 	movabs $0x804fc0,%rdx
  801f7e:	00 00 00 
  801f81:	be 22 00 00 00       	mov    $0x22,%esi
  801f86:	48 bf b1 4f 80 00 00 	movabs $0x804fb1,%rdi
  801f8d:	00 00 00 
  801f90:	b8 00 00 00 00       	mov    $0x0,%eax
  801f95:	49 b9 cc 03 80 00 00 	movabs $0x8003cc,%r9
  801f9c:	00 00 00 
  801f9f:	41 ff d1             	callq  *%r9
  801fa2:	ba 07 00 00 00       	mov    $0x7,%edx
  801fa7:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801fac:	bf 00 00 00 00       	mov    $0x0,%edi
  801fb1:	48 b8 c6 1a 80 00 00 	movabs $0x801ac6,%rax
  801fb8:	00 00 00 
  801fbb:	ff d0                	callq  *%rax
  801fbd:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801fc0:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801fc4:	79 30                	jns    801ff6 <pgfault+0x134>
  801fc6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801fc9:	89 c1                	mov    %eax,%ecx
  801fcb:	48 ba eb 4f 80 00 00 	movabs $0x804feb,%rdx
  801fd2:	00 00 00 
  801fd5:	be 30 00 00 00       	mov    $0x30,%esi
  801fda:	48 bf b1 4f 80 00 00 	movabs $0x804fb1,%rdi
  801fe1:	00 00 00 
  801fe4:	b8 00 00 00 00       	mov    $0x0,%eax
  801fe9:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  801ff0:	00 00 00 
  801ff3:	41 ff d0             	callq  *%r8
  801ff6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801ffa:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801ffe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802002:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802008:	ba 00 10 00 00       	mov    $0x1000,%edx
  80200d:	48 89 c6             	mov    %rax,%rsi
  802010:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  802015:	48 b8 bb 14 80 00 00 	movabs $0x8014bb,%rax
  80201c:	00 00 00 
  80201f:	ff d0                	callq  *%rax
  802021:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802025:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802029:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80202d:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802033:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  802039:	48 89 c1             	mov    %rax,%rcx
  80203c:	ba 00 00 00 00       	mov    $0x0,%edx
  802041:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802046:	bf 00 00 00 00       	mov    $0x0,%edi
  80204b:	48 b8 18 1b 80 00 00 	movabs $0x801b18,%rax
  802052:	00 00 00 
  802055:	ff d0                	callq  *%rax
  802057:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80205a:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80205e:	79 30                	jns    802090 <pgfault+0x1ce>
  802060:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802063:	89 c1                	mov    %eax,%ecx
  802065:	48 ba fe 4f 80 00 00 	movabs $0x804ffe,%rdx
  80206c:	00 00 00 
  80206f:	be 35 00 00 00       	mov    $0x35,%esi
  802074:	48 bf b1 4f 80 00 00 	movabs $0x804fb1,%rdi
  80207b:	00 00 00 
  80207e:	b8 00 00 00 00       	mov    $0x0,%eax
  802083:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  80208a:	00 00 00 
  80208d:	41 ff d0             	callq  *%r8
  802090:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802095:	bf 00 00 00 00       	mov    $0x0,%edi
  80209a:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  8020a1:	00 00 00 
  8020a4:	ff d0                	callq  *%rax
  8020a6:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8020a9:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8020ad:	79 30                	jns    8020df <pgfault+0x21d>
  8020af:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020b2:	89 c1                	mov    %eax,%ecx
  8020b4:	48 ba 0f 50 80 00 00 	movabs $0x80500f,%rdx
  8020bb:	00 00 00 
  8020be:	be 39 00 00 00       	mov    $0x39,%esi
  8020c3:	48 bf b1 4f 80 00 00 	movabs $0x804fb1,%rdi
  8020ca:	00 00 00 
  8020cd:	b8 00 00 00 00       	mov    $0x0,%eax
  8020d2:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  8020d9:	00 00 00 
  8020dc:	41 ff d0             	callq  *%r8
  8020df:	90                   	nop
  8020e0:	c9                   	leaveq 
  8020e1:	c3                   	retq   

00000000008020e2 <duppage>:
  8020e2:	55                   	push   %rbp
  8020e3:	48 89 e5             	mov    %rsp,%rbp
  8020e6:	48 83 ec 30          	sub    $0x30,%rsp
  8020ea:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8020ed:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8020f0:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8020f3:	c1 e0 0c             	shl    $0xc,%eax
  8020f6:	89 c0                	mov    %eax,%eax
  8020f8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8020fc:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802103:	01 00 00 
  802106:	8b 55 d8             	mov    -0x28(%rbp),%edx
  802109:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80210d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802111:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802115:	25 02 08 00 00       	and    $0x802,%eax
  80211a:	48 85 c0             	test   %rax,%rax
  80211d:	74 0e                	je     80212d <duppage+0x4b>
  80211f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802123:	25 00 04 00 00       	and    $0x400,%eax
  802128:	48 85 c0             	test   %rax,%rax
  80212b:	74 70                	je     80219d <duppage+0xbb>
  80212d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802131:	25 07 0e 00 00       	and    $0xe07,%eax
  802136:	89 c6                	mov    %eax,%esi
  802138:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  80213c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80213f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802143:	41 89 f0             	mov    %esi,%r8d
  802146:	48 89 c6             	mov    %rax,%rsi
  802149:	bf 00 00 00 00       	mov    $0x0,%edi
  80214e:	48 b8 18 1b 80 00 00 	movabs $0x801b18,%rax
  802155:	00 00 00 
  802158:	ff d0                	callq  *%rax
  80215a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80215d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802161:	79 30                	jns    802193 <duppage+0xb1>
  802163:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802166:	89 c1                	mov    %eax,%ecx
  802168:	48 ba fe 4f 80 00 00 	movabs $0x804ffe,%rdx
  80216f:	00 00 00 
  802172:	be 63 00 00 00       	mov    $0x63,%esi
  802177:	48 bf b1 4f 80 00 00 	movabs $0x804fb1,%rdi
  80217e:	00 00 00 
  802181:	b8 00 00 00 00       	mov    $0x0,%eax
  802186:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  80218d:	00 00 00 
  802190:	41 ff d0             	callq  *%r8
  802193:	b8 00 00 00 00       	mov    $0x0,%eax
  802198:	e9 c4 00 00 00       	jmpq   802261 <duppage+0x17f>
  80219d:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8021a1:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8021a4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8021a8:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8021ae:	48 89 c6             	mov    %rax,%rsi
  8021b1:	bf 00 00 00 00       	mov    $0x0,%edi
  8021b6:	48 b8 18 1b 80 00 00 	movabs $0x801b18,%rax
  8021bd:	00 00 00 
  8021c0:	ff d0                	callq  *%rax
  8021c2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8021c5:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8021c9:	79 30                	jns    8021fb <duppage+0x119>
  8021cb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8021ce:	89 c1                	mov    %eax,%ecx
  8021d0:	48 ba fe 4f 80 00 00 	movabs $0x804ffe,%rdx
  8021d7:	00 00 00 
  8021da:	be 7e 00 00 00       	mov    $0x7e,%esi
  8021df:	48 bf b1 4f 80 00 00 	movabs $0x804fb1,%rdi
  8021e6:	00 00 00 
  8021e9:	b8 00 00 00 00       	mov    $0x0,%eax
  8021ee:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  8021f5:	00 00 00 
  8021f8:	41 ff d0             	callq  *%r8
  8021fb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8021ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802203:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802209:	48 89 d1             	mov    %rdx,%rcx
  80220c:	ba 00 00 00 00       	mov    $0x0,%edx
  802211:	48 89 c6             	mov    %rax,%rsi
  802214:	bf 00 00 00 00       	mov    $0x0,%edi
  802219:	48 b8 18 1b 80 00 00 	movabs $0x801b18,%rax
  802220:	00 00 00 
  802223:	ff d0                	callq  *%rax
  802225:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802228:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80222c:	79 30                	jns    80225e <duppage+0x17c>
  80222e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802231:	89 c1                	mov    %eax,%ecx
  802233:	48 ba fe 4f 80 00 00 	movabs $0x804ffe,%rdx
  80223a:	00 00 00 
  80223d:	be 80 00 00 00       	mov    $0x80,%esi
  802242:	48 bf b1 4f 80 00 00 	movabs $0x804fb1,%rdi
  802249:	00 00 00 
  80224c:	b8 00 00 00 00       	mov    $0x0,%eax
  802251:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  802258:	00 00 00 
  80225b:	41 ff d0             	callq  *%r8
  80225e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802261:	c9                   	leaveq 
  802262:	c3                   	retq   

0000000000802263 <fork>:
  802263:	55                   	push   %rbp
  802264:	48 89 e5             	mov    %rsp,%rbp
  802267:	48 83 ec 20          	sub    $0x20,%rsp
  80226b:	48 bf c2 1e 80 00 00 	movabs $0x801ec2,%rdi
  802272:	00 00 00 
  802275:	48 b8 88 45 80 00 00 	movabs $0x804588,%rax
  80227c:	00 00 00 
  80227f:	ff d0                	callq  *%rax
  802281:	b8 07 00 00 00       	mov    $0x7,%eax
  802286:	cd 30                	int    $0x30
  802288:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80228b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80228e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802291:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802295:	79 08                	jns    80229f <fork+0x3c>
  802297:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80229a:	e9 0b 02 00 00       	jmpq   8024aa <fork+0x247>
  80229f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8022a3:	75 3e                	jne    8022e3 <fork+0x80>
  8022a5:	48 b8 4d 1a 80 00 00 	movabs $0x801a4d,%rax
  8022ac:	00 00 00 
  8022af:	ff d0                	callq  *%rax
  8022b1:	25 ff 03 00 00       	and    $0x3ff,%eax
  8022b6:	48 98                	cltq   
  8022b8:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8022bf:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8022c6:	00 00 00 
  8022c9:	48 01 c2             	add    %rax,%rdx
  8022cc:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8022d3:	00 00 00 
  8022d6:	48 89 10             	mov    %rdx,(%rax)
  8022d9:	b8 00 00 00 00       	mov    $0x0,%eax
  8022de:	e9 c7 01 00 00       	jmpq   8024aa <fork+0x247>
  8022e3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8022ea:	e9 a6 00 00 00       	jmpq   802395 <fork+0x132>
  8022ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022f2:	c1 f8 12             	sar    $0x12,%eax
  8022f5:	89 c2                	mov    %eax,%edx
  8022f7:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  8022fe:	01 00 00 
  802301:	48 63 d2             	movslq %edx,%rdx
  802304:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802308:	83 e0 01             	and    $0x1,%eax
  80230b:	48 85 c0             	test   %rax,%rax
  80230e:	74 21                	je     802331 <fork+0xce>
  802310:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802313:	c1 f8 09             	sar    $0x9,%eax
  802316:	89 c2                	mov    %eax,%edx
  802318:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80231f:	01 00 00 
  802322:	48 63 d2             	movslq %edx,%rdx
  802325:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802329:	83 e0 01             	and    $0x1,%eax
  80232c:	48 85 c0             	test   %rax,%rax
  80232f:	75 09                	jne    80233a <fork+0xd7>
  802331:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  802338:	eb 5b                	jmp    802395 <fork+0x132>
  80233a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80233d:	05 00 02 00 00       	add    $0x200,%eax
  802342:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802345:	eb 46                	jmp    80238d <fork+0x12a>
  802347:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80234e:	01 00 00 
  802351:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802354:	48 63 d2             	movslq %edx,%rdx
  802357:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80235b:	83 e0 05             	and    $0x5,%eax
  80235e:	48 83 f8 05          	cmp    $0x5,%rax
  802362:	75 21                	jne    802385 <fork+0x122>
  802364:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  80236b:	74 1b                	je     802388 <fork+0x125>
  80236d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802370:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802373:	89 d6                	mov    %edx,%esi
  802375:	89 c7                	mov    %eax,%edi
  802377:	48 b8 e2 20 80 00 00 	movabs $0x8020e2,%rax
  80237e:	00 00 00 
  802381:	ff d0                	callq  *%rax
  802383:	eb 04                	jmp    802389 <fork+0x126>
  802385:	90                   	nop
  802386:	eb 01                	jmp    802389 <fork+0x126>
  802388:	90                   	nop
  802389:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80238d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802390:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  802393:	7c b2                	jl     802347 <fork+0xe4>
  802395:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802398:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  80239d:	0f 86 4c ff ff ff    	jbe    8022ef <fork+0x8c>
  8023a3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023a6:	ba 07 00 00 00       	mov    $0x7,%edx
  8023ab:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8023b0:	89 c7                	mov    %eax,%edi
  8023b2:	48 b8 c6 1a 80 00 00 	movabs $0x801ac6,%rax
  8023b9:	00 00 00 
  8023bc:	ff d0                	callq  *%rax
  8023be:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8023c1:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8023c5:	79 30                	jns    8023f7 <fork+0x194>
  8023c7:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8023ca:	89 c1                	mov    %eax,%ecx
  8023cc:	48 ba 28 50 80 00 00 	movabs $0x805028,%rdx
  8023d3:	00 00 00 
  8023d6:	be bc 00 00 00       	mov    $0xbc,%esi
  8023db:	48 bf b1 4f 80 00 00 	movabs $0x804fb1,%rdi
  8023e2:	00 00 00 
  8023e5:	b8 00 00 00 00       	mov    $0x0,%eax
  8023ea:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  8023f1:	00 00 00 
  8023f4:	41 ff d0             	callq  *%r8
  8023f7:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8023fe:	00 00 00 
  802401:	48 8b 00             	mov    (%rax),%rax
  802404:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  80240b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80240e:	48 89 d6             	mov    %rdx,%rsi
  802411:	89 c7                	mov    %eax,%edi
  802413:	48 b8 5d 1c 80 00 00 	movabs $0x801c5d,%rax
  80241a:	00 00 00 
  80241d:	ff d0                	callq  *%rax
  80241f:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802422:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802426:	79 30                	jns    802458 <fork+0x1f5>
  802428:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80242b:	89 c1                	mov    %eax,%ecx
  80242d:	48 ba 48 50 80 00 00 	movabs $0x805048,%rdx
  802434:	00 00 00 
  802437:	be c0 00 00 00       	mov    $0xc0,%esi
  80243c:	48 bf b1 4f 80 00 00 	movabs $0x804fb1,%rdi
  802443:	00 00 00 
  802446:	b8 00 00 00 00       	mov    $0x0,%eax
  80244b:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  802452:	00 00 00 
  802455:	41 ff d0             	callq  *%r8
  802458:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80245b:	be 02 00 00 00       	mov    $0x2,%esi
  802460:	89 c7                	mov    %eax,%edi
  802462:	48 b8 c4 1b 80 00 00 	movabs $0x801bc4,%rax
  802469:	00 00 00 
  80246c:	ff d0                	callq  *%rax
  80246e:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802471:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802475:	79 30                	jns    8024a7 <fork+0x244>
  802477:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80247a:	89 c1                	mov    %eax,%ecx
  80247c:	48 ba 67 50 80 00 00 	movabs $0x805067,%rdx
  802483:	00 00 00 
  802486:	be c5 00 00 00       	mov    $0xc5,%esi
  80248b:	48 bf b1 4f 80 00 00 	movabs $0x804fb1,%rdi
  802492:	00 00 00 
  802495:	b8 00 00 00 00       	mov    $0x0,%eax
  80249a:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  8024a1:	00 00 00 
  8024a4:	41 ff d0             	callq  *%r8
  8024a7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024aa:	c9                   	leaveq 
  8024ab:	c3                   	retq   

00000000008024ac <sfork>:
  8024ac:	55                   	push   %rbp
  8024ad:	48 89 e5             	mov    %rsp,%rbp
  8024b0:	48 ba 7e 50 80 00 00 	movabs $0x80507e,%rdx
  8024b7:	00 00 00 
  8024ba:	be d2 00 00 00       	mov    $0xd2,%esi
  8024bf:	48 bf b1 4f 80 00 00 	movabs $0x804fb1,%rdi
  8024c6:	00 00 00 
  8024c9:	b8 00 00 00 00       	mov    $0x0,%eax
  8024ce:	48 b9 cc 03 80 00 00 	movabs $0x8003cc,%rcx
  8024d5:	00 00 00 
  8024d8:	ff d1                	callq  *%rcx

00000000008024da <fd2num>:
  8024da:	55                   	push   %rbp
  8024db:	48 89 e5             	mov    %rsp,%rbp
  8024de:	48 83 ec 08          	sub    $0x8,%rsp
  8024e2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8024e6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8024ea:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  8024f1:	ff ff ff 
  8024f4:	48 01 d0             	add    %rdx,%rax
  8024f7:	48 c1 e8 0c          	shr    $0xc,%rax
  8024fb:	c9                   	leaveq 
  8024fc:	c3                   	retq   

00000000008024fd <fd2data>:
  8024fd:	55                   	push   %rbp
  8024fe:	48 89 e5             	mov    %rsp,%rbp
  802501:	48 83 ec 08          	sub    $0x8,%rsp
  802505:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802509:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80250d:	48 89 c7             	mov    %rax,%rdi
  802510:	48 b8 da 24 80 00 00 	movabs $0x8024da,%rax
  802517:	00 00 00 
  80251a:	ff d0                	callq  *%rax
  80251c:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802522:	48 c1 e0 0c          	shl    $0xc,%rax
  802526:	c9                   	leaveq 
  802527:	c3                   	retq   

0000000000802528 <fd_alloc>:
  802528:	55                   	push   %rbp
  802529:	48 89 e5             	mov    %rsp,%rbp
  80252c:	48 83 ec 18          	sub    $0x18,%rsp
  802530:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802534:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80253b:	eb 6b                	jmp    8025a8 <fd_alloc+0x80>
  80253d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802540:	48 98                	cltq   
  802542:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802548:	48 c1 e0 0c          	shl    $0xc,%rax
  80254c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802550:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802554:	48 c1 e8 15          	shr    $0x15,%rax
  802558:	48 89 c2             	mov    %rax,%rdx
  80255b:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802562:	01 00 00 
  802565:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802569:	83 e0 01             	and    $0x1,%eax
  80256c:	48 85 c0             	test   %rax,%rax
  80256f:	74 21                	je     802592 <fd_alloc+0x6a>
  802571:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802575:	48 c1 e8 0c          	shr    $0xc,%rax
  802579:	48 89 c2             	mov    %rax,%rdx
  80257c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802583:	01 00 00 
  802586:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80258a:	83 e0 01             	and    $0x1,%eax
  80258d:	48 85 c0             	test   %rax,%rax
  802590:	75 12                	jne    8025a4 <fd_alloc+0x7c>
  802592:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802596:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80259a:	48 89 10             	mov    %rdx,(%rax)
  80259d:	b8 00 00 00 00       	mov    $0x0,%eax
  8025a2:	eb 1a                	jmp    8025be <fd_alloc+0x96>
  8025a4:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8025a8:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8025ac:	7e 8f                	jle    80253d <fd_alloc+0x15>
  8025ae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025b2:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8025b9:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8025be:	c9                   	leaveq 
  8025bf:	c3                   	retq   

00000000008025c0 <fd_lookup>:
  8025c0:	55                   	push   %rbp
  8025c1:	48 89 e5             	mov    %rsp,%rbp
  8025c4:	48 83 ec 20          	sub    $0x20,%rsp
  8025c8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8025cb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8025cf:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8025d3:	78 06                	js     8025db <fd_lookup+0x1b>
  8025d5:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8025d9:	7e 07                	jle    8025e2 <fd_lookup+0x22>
  8025db:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8025e0:	eb 6c                	jmp    80264e <fd_lookup+0x8e>
  8025e2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8025e5:	48 98                	cltq   
  8025e7:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8025ed:	48 c1 e0 0c          	shl    $0xc,%rax
  8025f1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8025f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8025f9:	48 c1 e8 15          	shr    $0x15,%rax
  8025fd:	48 89 c2             	mov    %rax,%rdx
  802600:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802607:	01 00 00 
  80260a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80260e:	83 e0 01             	and    $0x1,%eax
  802611:	48 85 c0             	test   %rax,%rax
  802614:	74 21                	je     802637 <fd_lookup+0x77>
  802616:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80261a:	48 c1 e8 0c          	shr    $0xc,%rax
  80261e:	48 89 c2             	mov    %rax,%rdx
  802621:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802628:	01 00 00 
  80262b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80262f:	83 e0 01             	and    $0x1,%eax
  802632:	48 85 c0             	test   %rax,%rax
  802635:	75 07                	jne    80263e <fd_lookup+0x7e>
  802637:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80263c:	eb 10                	jmp    80264e <fd_lookup+0x8e>
  80263e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802642:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802646:	48 89 10             	mov    %rdx,(%rax)
  802649:	b8 00 00 00 00       	mov    $0x0,%eax
  80264e:	c9                   	leaveq 
  80264f:	c3                   	retq   

0000000000802650 <fd_close>:
  802650:	55                   	push   %rbp
  802651:	48 89 e5             	mov    %rsp,%rbp
  802654:	48 83 ec 30          	sub    $0x30,%rsp
  802658:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80265c:	89 f0                	mov    %esi,%eax
  80265e:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802661:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802665:	48 89 c7             	mov    %rax,%rdi
  802668:	48 b8 da 24 80 00 00 	movabs $0x8024da,%rax
  80266f:	00 00 00 
  802672:	ff d0                	callq  *%rax
  802674:	89 c2                	mov    %eax,%edx
  802676:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80267a:	48 89 c6             	mov    %rax,%rsi
  80267d:	89 d7                	mov    %edx,%edi
  80267f:	48 b8 c0 25 80 00 00 	movabs $0x8025c0,%rax
  802686:	00 00 00 
  802689:	ff d0                	callq  *%rax
  80268b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80268e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802692:	78 0a                	js     80269e <fd_close+0x4e>
  802694:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802698:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  80269c:	74 12                	je     8026b0 <fd_close+0x60>
  80269e:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8026a2:	74 05                	je     8026a9 <fd_close+0x59>
  8026a4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026a7:	eb 70                	jmp    802719 <fd_close+0xc9>
  8026a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8026ae:	eb 69                	jmp    802719 <fd_close+0xc9>
  8026b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8026b4:	8b 00                	mov    (%rax),%eax
  8026b6:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8026ba:	48 89 d6             	mov    %rdx,%rsi
  8026bd:	89 c7                	mov    %eax,%edi
  8026bf:	48 b8 1b 27 80 00 00 	movabs $0x80271b,%rax
  8026c6:	00 00 00 
  8026c9:	ff d0                	callq  *%rax
  8026cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026ce:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026d2:	78 2a                	js     8026fe <fd_close+0xae>
  8026d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026d8:	48 8b 40 20          	mov    0x20(%rax),%rax
  8026dc:	48 85 c0             	test   %rax,%rax
  8026df:	74 16                	je     8026f7 <fd_close+0xa7>
  8026e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026e5:	48 8b 40 20          	mov    0x20(%rax),%rax
  8026e9:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8026ed:	48 89 d7             	mov    %rdx,%rdi
  8026f0:	ff d0                	callq  *%rax
  8026f2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026f5:	eb 07                	jmp    8026fe <fd_close+0xae>
  8026f7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8026fe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802702:	48 89 c6             	mov    %rax,%rsi
  802705:	bf 00 00 00 00       	mov    $0x0,%edi
  80270a:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  802711:	00 00 00 
  802714:	ff d0                	callq  *%rax
  802716:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802719:	c9                   	leaveq 
  80271a:	c3                   	retq   

000000000080271b <dev_lookup>:
  80271b:	55                   	push   %rbp
  80271c:	48 89 e5             	mov    %rsp,%rbp
  80271f:	48 83 ec 20          	sub    $0x20,%rsp
  802723:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802726:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80272a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802731:	eb 41                	jmp    802774 <dev_lookup+0x59>
  802733:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80273a:	00 00 00 
  80273d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802740:	48 63 d2             	movslq %edx,%rdx
  802743:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802747:	8b 00                	mov    (%rax),%eax
  802749:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80274c:	75 22                	jne    802770 <dev_lookup+0x55>
  80274e:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802755:	00 00 00 
  802758:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80275b:	48 63 d2             	movslq %edx,%rdx
  80275e:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802762:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802766:	48 89 10             	mov    %rdx,(%rax)
  802769:	b8 00 00 00 00       	mov    $0x0,%eax
  80276e:	eb 60                	jmp    8027d0 <dev_lookup+0xb5>
  802770:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802774:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80277b:	00 00 00 
  80277e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802781:	48 63 d2             	movslq %edx,%rdx
  802784:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802788:	48 85 c0             	test   %rax,%rax
  80278b:	75 a6                	jne    802733 <dev_lookup+0x18>
  80278d:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802794:	00 00 00 
  802797:	48 8b 00             	mov    (%rax),%rax
  80279a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8027a0:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8027a3:	89 c6                	mov    %eax,%esi
  8027a5:	48 bf 98 50 80 00 00 	movabs $0x805098,%rdi
  8027ac:	00 00 00 
  8027af:	b8 00 00 00 00       	mov    $0x0,%eax
  8027b4:	48 b9 06 06 80 00 00 	movabs $0x800606,%rcx
  8027bb:	00 00 00 
  8027be:	ff d1                	callq  *%rcx
  8027c0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8027c4:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8027cb:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8027d0:	c9                   	leaveq 
  8027d1:	c3                   	retq   

00000000008027d2 <close>:
  8027d2:	55                   	push   %rbp
  8027d3:	48 89 e5             	mov    %rsp,%rbp
  8027d6:	48 83 ec 20          	sub    $0x20,%rsp
  8027da:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8027dd:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8027e1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8027e4:	48 89 d6             	mov    %rdx,%rsi
  8027e7:	89 c7                	mov    %eax,%edi
  8027e9:	48 b8 c0 25 80 00 00 	movabs $0x8025c0,%rax
  8027f0:	00 00 00 
  8027f3:	ff d0                	callq  *%rax
  8027f5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027f8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027fc:	79 05                	jns    802803 <close+0x31>
  8027fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802801:	eb 18                	jmp    80281b <close+0x49>
  802803:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802807:	be 01 00 00 00       	mov    $0x1,%esi
  80280c:	48 89 c7             	mov    %rax,%rdi
  80280f:	48 b8 50 26 80 00 00 	movabs $0x802650,%rax
  802816:	00 00 00 
  802819:	ff d0                	callq  *%rax
  80281b:	c9                   	leaveq 
  80281c:	c3                   	retq   

000000000080281d <close_all>:
  80281d:	55                   	push   %rbp
  80281e:	48 89 e5             	mov    %rsp,%rbp
  802821:	48 83 ec 10          	sub    $0x10,%rsp
  802825:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80282c:	eb 15                	jmp    802843 <close_all+0x26>
  80282e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802831:	89 c7                	mov    %eax,%edi
  802833:	48 b8 d2 27 80 00 00 	movabs $0x8027d2,%rax
  80283a:	00 00 00 
  80283d:	ff d0                	callq  *%rax
  80283f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802843:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802847:	7e e5                	jle    80282e <close_all+0x11>
  802849:	90                   	nop
  80284a:	c9                   	leaveq 
  80284b:	c3                   	retq   

000000000080284c <dup>:
  80284c:	55                   	push   %rbp
  80284d:	48 89 e5             	mov    %rsp,%rbp
  802850:	48 83 ec 40          	sub    $0x40,%rsp
  802854:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802857:	89 75 c8             	mov    %esi,-0x38(%rbp)
  80285a:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  80285e:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802861:	48 89 d6             	mov    %rdx,%rsi
  802864:	89 c7                	mov    %eax,%edi
  802866:	48 b8 c0 25 80 00 00 	movabs $0x8025c0,%rax
  80286d:	00 00 00 
  802870:	ff d0                	callq  *%rax
  802872:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802875:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802879:	79 08                	jns    802883 <dup+0x37>
  80287b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80287e:	e9 70 01 00 00       	jmpq   8029f3 <dup+0x1a7>
  802883:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802886:	89 c7                	mov    %eax,%edi
  802888:	48 b8 d2 27 80 00 00 	movabs $0x8027d2,%rax
  80288f:	00 00 00 
  802892:	ff d0                	callq  *%rax
  802894:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802897:	48 98                	cltq   
  802899:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80289f:	48 c1 e0 0c          	shl    $0xc,%rax
  8028a3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8028a7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028ab:	48 89 c7             	mov    %rax,%rdi
  8028ae:	48 b8 fd 24 80 00 00 	movabs $0x8024fd,%rax
  8028b5:	00 00 00 
  8028b8:	ff d0                	callq  *%rax
  8028ba:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8028be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028c2:	48 89 c7             	mov    %rax,%rdi
  8028c5:	48 b8 fd 24 80 00 00 	movabs $0x8024fd,%rax
  8028cc:	00 00 00 
  8028cf:	ff d0                	callq  *%rax
  8028d1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8028d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028d9:	48 c1 e8 15          	shr    $0x15,%rax
  8028dd:	48 89 c2             	mov    %rax,%rdx
  8028e0:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8028e7:	01 00 00 
  8028ea:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8028ee:	83 e0 01             	and    $0x1,%eax
  8028f1:	48 85 c0             	test   %rax,%rax
  8028f4:	74 71                	je     802967 <dup+0x11b>
  8028f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028fa:	48 c1 e8 0c          	shr    $0xc,%rax
  8028fe:	48 89 c2             	mov    %rax,%rdx
  802901:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802908:	01 00 00 
  80290b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80290f:	83 e0 01             	and    $0x1,%eax
  802912:	48 85 c0             	test   %rax,%rax
  802915:	74 50                	je     802967 <dup+0x11b>
  802917:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80291b:	48 c1 e8 0c          	shr    $0xc,%rax
  80291f:	48 89 c2             	mov    %rax,%rdx
  802922:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802929:	01 00 00 
  80292c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802930:	25 07 0e 00 00       	and    $0xe07,%eax
  802935:	89 c1                	mov    %eax,%ecx
  802937:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80293b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80293f:	41 89 c8             	mov    %ecx,%r8d
  802942:	48 89 d1             	mov    %rdx,%rcx
  802945:	ba 00 00 00 00       	mov    $0x0,%edx
  80294a:	48 89 c6             	mov    %rax,%rsi
  80294d:	bf 00 00 00 00       	mov    $0x0,%edi
  802952:	48 b8 18 1b 80 00 00 	movabs $0x801b18,%rax
  802959:	00 00 00 
  80295c:	ff d0                	callq  *%rax
  80295e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802961:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802965:	78 55                	js     8029bc <dup+0x170>
  802967:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80296b:	48 c1 e8 0c          	shr    $0xc,%rax
  80296f:	48 89 c2             	mov    %rax,%rdx
  802972:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802979:	01 00 00 
  80297c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802980:	25 07 0e 00 00       	and    $0xe07,%eax
  802985:	89 c1                	mov    %eax,%ecx
  802987:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80298b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80298f:	41 89 c8             	mov    %ecx,%r8d
  802992:	48 89 d1             	mov    %rdx,%rcx
  802995:	ba 00 00 00 00       	mov    $0x0,%edx
  80299a:	48 89 c6             	mov    %rax,%rsi
  80299d:	bf 00 00 00 00       	mov    $0x0,%edi
  8029a2:	48 b8 18 1b 80 00 00 	movabs $0x801b18,%rax
  8029a9:	00 00 00 
  8029ac:	ff d0                	callq  *%rax
  8029ae:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029b1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029b5:	78 08                	js     8029bf <dup+0x173>
  8029b7:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8029ba:	eb 37                	jmp    8029f3 <dup+0x1a7>
  8029bc:	90                   	nop
  8029bd:	eb 01                	jmp    8029c0 <dup+0x174>
  8029bf:	90                   	nop
  8029c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029c4:	48 89 c6             	mov    %rax,%rsi
  8029c7:	bf 00 00 00 00       	mov    $0x0,%edi
  8029cc:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  8029d3:	00 00 00 
  8029d6:	ff d0                	callq  *%rax
  8029d8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029dc:	48 89 c6             	mov    %rax,%rsi
  8029df:	bf 00 00 00 00       	mov    $0x0,%edi
  8029e4:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  8029eb:	00 00 00 
  8029ee:	ff d0                	callq  *%rax
  8029f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029f3:	c9                   	leaveq 
  8029f4:	c3                   	retq   

00000000008029f5 <read>:
  8029f5:	55                   	push   %rbp
  8029f6:	48 89 e5             	mov    %rsp,%rbp
  8029f9:	48 83 ec 40          	sub    $0x40,%rsp
  8029fd:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802a00:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802a04:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802a08:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802a0c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802a0f:	48 89 d6             	mov    %rdx,%rsi
  802a12:	89 c7                	mov    %eax,%edi
  802a14:	48 b8 c0 25 80 00 00 	movabs $0x8025c0,%rax
  802a1b:	00 00 00 
  802a1e:	ff d0                	callq  *%rax
  802a20:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a23:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a27:	78 24                	js     802a4d <read+0x58>
  802a29:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a2d:	8b 00                	mov    (%rax),%eax
  802a2f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802a33:	48 89 d6             	mov    %rdx,%rsi
  802a36:	89 c7                	mov    %eax,%edi
  802a38:	48 b8 1b 27 80 00 00 	movabs $0x80271b,%rax
  802a3f:	00 00 00 
  802a42:	ff d0                	callq  *%rax
  802a44:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a47:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a4b:	79 05                	jns    802a52 <read+0x5d>
  802a4d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a50:	eb 76                	jmp    802ac8 <read+0xd3>
  802a52:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a56:	8b 40 08             	mov    0x8(%rax),%eax
  802a59:	83 e0 03             	and    $0x3,%eax
  802a5c:	83 f8 01             	cmp    $0x1,%eax
  802a5f:	75 3a                	jne    802a9b <read+0xa6>
  802a61:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802a68:	00 00 00 
  802a6b:	48 8b 00             	mov    (%rax),%rax
  802a6e:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802a74:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802a77:	89 c6                	mov    %eax,%esi
  802a79:	48 bf b7 50 80 00 00 	movabs $0x8050b7,%rdi
  802a80:	00 00 00 
  802a83:	b8 00 00 00 00       	mov    $0x0,%eax
  802a88:	48 b9 06 06 80 00 00 	movabs $0x800606,%rcx
  802a8f:	00 00 00 
  802a92:	ff d1                	callq  *%rcx
  802a94:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802a99:	eb 2d                	jmp    802ac8 <read+0xd3>
  802a9b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a9f:	48 8b 40 10          	mov    0x10(%rax),%rax
  802aa3:	48 85 c0             	test   %rax,%rax
  802aa6:	75 07                	jne    802aaf <read+0xba>
  802aa8:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802aad:	eb 19                	jmp    802ac8 <read+0xd3>
  802aaf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ab3:	48 8b 40 10          	mov    0x10(%rax),%rax
  802ab7:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802abb:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802abf:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802ac3:	48 89 cf             	mov    %rcx,%rdi
  802ac6:	ff d0                	callq  *%rax
  802ac8:	c9                   	leaveq 
  802ac9:	c3                   	retq   

0000000000802aca <readn>:
  802aca:	55                   	push   %rbp
  802acb:	48 89 e5             	mov    %rsp,%rbp
  802ace:	48 83 ec 30          	sub    $0x30,%rsp
  802ad2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ad5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ad9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802add:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802ae4:	eb 47                	jmp    802b2d <readn+0x63>
  802ae6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ae9:	48 98                	cltq   
  802aeb:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802aef:	48 29 c2             	sub    %rax,%rdx
  802af2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802af5:	48 63 c8             	movslq %eax,%rcx
  802af8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802afc:	48 01 c1             	add    %rax,%rcx
  802aff:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b02:	48 89 ce             	mov    %rcx,%rsi
  802b05:	89 c7                	mov    %eax,%edi
  802b07:	48 b8 f5 29 80 00 00 	movabs $0x8029f5,%rax
  802b0e:	00 00 00 
  802b11:	ff d0                	callq  *%rax
  802b13:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802b16:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802b1a:	79 05                	jns    802b21 <readn+0x57>
  802b1c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b1f:	eb 1d                	jmp    802b3e <readn+0x74>
  802b21:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802b25:	74 13                	je     802b3a <readn+0x70>
  802b27:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b2a:	01 45 fc             	add    %eax,-0x4(%rbp)
  802b2d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b30:	48 98                	cltq   
  802b32:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802b36:	72 ae                	jb     802ae6 <readn+0x1c>
  802b38:	eb 01                	jmp    802b3b <readn+0x71>
  802b3a:	90                   	nop
  802b3b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b3e:	c9                   	leaveq 
  802b3f:	c3                   	retq   

0000000000802b40 <write>:
  802b40:	55                   	push   %rbp
  802b41:	48 89 e5             	mov    %rsp,%rbp
  802b44:	48 83 ec 40          	sub    $0x40,%rsp
  802b48:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802b4b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802b4f:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802b53:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802b57:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802b5a:	48 89 d6             	mov    %rdx,%rsi
  802b5d:	89 c7                	mov    %eax,%edi
  802b5f:	48 b8 c0 25 80 00 00 	movabs $0x8025c0,%rax
  802b66:	00 00 00 
  802b69:	ff d0                	callq  *%rax
  802b6b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b6e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b72:	78 24                	js     802b98 <write+0x58>
  802b74:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b78:	8b 00                	mov    (%rax),%eax
  802b7a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802b7e:	48 89 d6             	mov    %rdx,%rsi
  802b81:	89 c7                	mov    %eax,%edi
  802b83:	48 b8 1b 27 80 00 00 	movabs $0x80271b,%rax
  802b8a:	00 00 00 
  802b8d:	ff d0                	callq  *%rax
  802b8f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b92:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b96:	79 05                	jns    802b9d <write+0x5d>
  802b98:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b9b:	eb 75                	jmp    802c12 <write+0xd2>
  802b9d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ba1:	8b 40 08             	mov    0x8(%rax),%eax
  802ba4:	83 e0 03             	and    $0x3,%eax
  802ba7:	85 c0                	test   %eax,%eax
  802ba9:	75 3a                	jne    802be5 <write+0xa5>
  802bab:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802bb2:	00 00 00 
  802bb5:	48 8b 00             	mov    (%rax),%rax
  802bb8:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802bbe:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802bc1:	89 c6                	mov    %eax,%esi
  802bc3:	48 bf d3 50 80 00 00 	movabs $0x8050d3,%rdi
  802bca:	00 00 00 
  802bcd:	b8 00 00 00 00       	mov    $0x0,%eax
  802bd2:	48 b9 06 06 80 00 00 	movabs $0x800606,%rcx
  802bd9:	00 00 00 
  802bdc:	ff d1                	callq  *%rcx
  802bde:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802be3:	eb 2d                	jmp    802c12 <write+0xd2>
  802be5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802be9:	48 8b 40 18          	mov    0x18(%rax),%rax
  802bed:	48 85 c0             	test   %rax,%rax
  802bf0:	75 07                	jne    802bf9 <write+0xb9>
  802bf2:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802bf7:	eb 19                	jmp    802c12 <write+0xd2>
  802bf9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bfd:	48 8b 40 18          	mov    0x18(%rax),%rax
  802c01:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802c05:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802c09:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802c0d:	48 89 cf             	mov    %rcx,%rdi
  802c10:	ff d0                	callq  *%rax
  802c12:	c9                   	leaveq 
  802c13:	c3                   	retq   

0000000000802c14 <seek>:
  802c14:	55                   	push   %rbp
  802c15:	48 89 e5             	mov    %rsp,%rbp
  802c18:	48 83 ec 18          	sub    $0x18,%rsp
  802c1c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802c1f:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802c22:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c26:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802c29:	48 89 d6             	mov    %rdx,%rsi
  802c2c:	89 c7                	mov    %eax,%edi
  802c2e:	48 b8 c0 25 80 00 00 	movabs $0x8025c0,%rax
  802c35:	00 00 00 
  802c38:	ff d0                	callq  *%rax
  802c3a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c3d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c41:	79 05                	jns    802c48 <seek+0x34>
  802c43:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c46:	eb 0f                	jmp    802c57 <seek+0x43>
  802c48:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c4c:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802c4f:	89 50 04             	mov    %edx,0x4(%rax)
  802c52:	b8 00 00 00 00       	mov    $0x0,%eax
  802c57:	c9                   	leaveq 
  802c58:	c3                   	retq   

0000000000802c59 <ftruncate>:
  802c59:	55                   	push   %rbp
  802c5a:	48 89 e5             	mov    %rsp,%rbp
  802c5d:	48 83 ec 30          	sub    $0x30,%rsp
  802c61:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802c64:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802c67:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802c6b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802c6e:	48 89 d6             	mov    %rdx,%rsi
  802c71:	89 c7                	mov    %eax,%edi
  802c73:	48 b8 c0 25 80 00 00 	movabs $0x8025c0,%rax
  802c7a:	00 00 00 
  802c7d:	ff d0                	callq  *%rax
  802c7f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c82:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c86:	78 24                	js     802cac <ftruncate+0x53>
  802c88:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c8c:	8b 00                	mov    (%rax),%eax
  802c8e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c92:	48 89 d6             	mov    %rdx,%rsi
  802c95:	89 c7                	mov    %eax,%edi
  802c97:	48 b8 1b 27 80 00 00 	movabs $0x80271b,%rax
  802c9e:	00 00 00 
  802ca1:	ff d0                	callq  *%rax
  802ca3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ca6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802caa:	79 05                	jns    802cb1 <ftruncate+0x58>
  802cac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802caf:	eb 72                	jmp    802d23 <ftruncate+0xca>
  802cb1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cb5:	8b 40 08             	mov    0x8(%rax),%eax
  802cb8:	83 e0 03             	and    $0x3,%eax
  802cbb:	85 c0                	test   %eax,%eax
  802cbd:	75 3a                	jne    802cf9 <ftruncate+0xa0>
  802cbf:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802cc6:	00 00 00 
  802cc9:	48 8b 00             	mov    (%rax),%rax
  802ccc:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802cd2:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802cd5:	89 c6                	mov    %eax,%esi
  802cd7:	48 bf f0 50 80 00 00 	movabs $0x8050f0,%rdi
  802cde:	00 00 00 
  802ce1:	b8 00 00 00 00       	mov    $0x0,%eax
  802ce6:	48 b9 06 06 80 00 00 	movabs $0x800606,%rcx
  802ced:	00 00 00 
  802cf0:	ff d1                	callq  *%rcx
  802cf2:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802cf7:	eb 2a                	jmp    802d23 <ftruncate+0xca>
  802cf9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cfd:	48 8b 40 30          	mov    0x30(%rax),%rax
  802d01:	48 85 c0             	test   %rax,%rax
  802d04:	75 07                	jne    802d0d <ftruncate+0xb4>
  802d06:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802d0b:	eb 16                	jmp    802d23 <ftruncate+0xca>
  802d0d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d11:	48 8b 40 30          	mov    0x30(%rax),%rax
  802d15:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802d19:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802d1c:	89 ce                	mov    %ecx,%esi
  802d1e:	48 89 d7             	mov    %rdx,%rdi
  802d21:	ff d0                	callq  *%rax
  802d23:	c9                   	leaveq 
  802d24:	c3                   	retq   

0000000000802d25 <fstat>:
  802d25:	55                   	push   %rbp
  802d26:	48 89 e5             	mov    %rsp,%rbp
  802d29:	48 83 ec 30          	sub    $0x30,%rsp
  802d2d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802d30:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802d34:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802d38:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802d3b:	48 89 d6             	mov    %rdx,%rsi
  802d3e:	89 c7                	mov    %eax,%edi
  802d40:	48 b8 c0 25 80 00 00 	movabs $0x8025c0,%rax
  802d47:	00 00 00 
  802d4a:	ff d0                	callq  *%rax
  802d4c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d4f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d53:	78 24                	js     802d79 <fstat+0x54>
  802d55:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d59:	8b 00                	mov    (%rax),%eax
  802d5b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d5f:	48 89 d6             	mov    %rdx,%rsi
  802d62:	89 c7                	mov    %eax,%edi
  802d64:	48 b8 1b 27 80 00 00 	movabs $0x80271b,%rax
  802d6b:	00 00 00 
  802d6e:	ff d0                	callq  *%rax
  802d70:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d73:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d77:	79 05                	jns    802d7e <fstat+0x59>
  802d79:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d7c:	eb 5e                	jmp    802ddc <fstat+0xb7>
  802d7e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d82:	48 8b 40 28          	mov    0x28(%rax),%rax
  802d86:	48 85 c0             	test   %rax,%rax
  802d89:	75 07                	jne    802d92 <fstat+0x6d>
  802d8b:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802d90:	eb 4a                	jmp    802ddc <fstat+0xb7>
  802d92:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802d96:	c6 00 00             	movb   $0x0,(%rax)
  802d99:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802d9d:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802da4:	00 00 00 
  802da7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802dab:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802db2:	00 00 00 
  802db5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802db9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802dbd:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802dc4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802dc8:	48 8b 40 28          	mov    0x28(%rax),%rax
  802dcc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802dd0:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802dd4:	48 89 ce             	mov    %rcx,%rsi
  802dd7:	48 89 d7             	mov    %rdx,%rdi
  802dda:	ff d0                	callq  *%rax
  802ddc:	c9                   	leaveq 
  802ddd:	c3                   	retq   

0000000000802dde <stat>:
  802dde:	55                   	push   %rbp
  802ddf:	48 89 e5             	mov    %rsp,%rbp
  802de2:	48 83 ec 20          	sub    $0x20,%rsp
  802de6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802dea:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802dee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802df2:	be 00 00 00 00       	mov    $0x0,%esi
  802df7:	48 89 c7             	mov    %rax,%rdi
  802dfa:	48 b8 ce 2e 80 00 00 	movabs $0x802ece,%rax
  802e01:	00 00 00 
  802e04:	ff d0                	callq  *%rax
  802e06:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e09:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e0d:	79 05                	jns    802e14 <stat+0x36>
  802e0f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e12:	eb 2f                	jmp    802e43 <stat+0x65>
  802e14:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802e18:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e1b:	48 89 d6             	mov    %rdx,%rsi
  802e1e:	89 c7                	mov    %eax,%edi
  802e20:	48 b8 25 2d 80 00 00 	movabs $0x802d25,%rax
  802e27:	00 00 00 
  802e2a:	ff d0                	callq  *%rax
  802e2c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802e2f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e32:	89 c7                	mov    %eax,%edi
  802e34:	48 b8 d2 27 80 00 00 	movabs $0x8027d2,%rax
  802e3b:	00 00 00 
  802e3e:	ff d0                	callq  *%rax
  802e40:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e43:	c9                   	leaveq 
  802e44:	c3                   	retq   

0000000000802e45 <fsipc>:
  802e45:	55                   	push   %rbp
  802e46:	48 89 e5             	mov    %rsp,%rbp
  802e49:	48 83 ec 10          	sub    $0x10,%rsp
  802e4d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802e50:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802e54:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802e5b:	00 00 00 
  802e5e:	8b 00                	mov    (%rax),%eax
  802e60:	85 c0                	test   %eax,%eax
  802e62:	75 1f                	jne    802e83 <fsipc+0x3e>
  802e64:	bf 01 00 00 00       	mov    $0x1,%edi
  802e69:	48 b8 7c 48 80 00 00 	movabs $0x80487c,%rax
  802e70:	00 00 00 
  802e73:	ff d0                	callq  *%rax
  802e75:	89 c2                	mov    %eax,%edx
  802e77:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802e7e:	00 00 00 
  802e81:	89 10                	mov    %edx,(%rax)
  802e83:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802e8a:	00 00 00 
  802e8d:	8b 00                	mov    (%rax),%eax
  802e8f:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802e92:	b9 07 00 00 00       	mov    $0x7,%ecx
  802e97:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  802e9e:	00 00 00 
  802ea1:	89 c7                	mov    %eax,%edi
  802ea3:	48 b8 72 47 80 00 00 	movabs $0x804772,%rax
  802eaa:	00 00 00 
  802ead:	ff d0                	callq  *%rax
  802eaf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802eb3:	ba 00 00 00 00       	mov    $0x0,%edx
  802eb8:	48 89 c6             	mov    %rax,%rsi
  802ebb:	bf 00 00 00 00       	mov    $0x0,%edi
  802ec0:	48 b8 b1 46 80 00 00 	movabs $0x8046b1,%rax
  802ec7:	00 00 00 
  802eca:	ff d0                	callq  *%rax
  802ecc:	c9                   	leaveq 
  802ecd:	c3                   	retq   

0000000000802ece <open>:
  802ece:	55                   	push   %rbp
  802ecf:	48 89 e5             	mov    %rsp,%rbp
  802ed2:	48 83 ec 20          	sub    $0x20,%rsp
  802ed6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802eda:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802edd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ee1:	48 89 c7             	mov    %rax,%rdi
  802ee4:	48 b8 2a 11 80 00 00 	movabs $0x80112a,%rax
  802eeb:	00 00 00 
  802eee:	ff d0                	callq  *%rax
  802ef0:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802ef5:	7e 0a                	jle    802f01 <open+0x33>
  802ef7:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802efc:	e9 a5 00 00 00       	jmpq   802fa6 <open+0xd8>
  802f01:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802f05:	48 89 c7             	mov    %rax,%rdi
  802f08:	48 b8 28 25 80 00 00 	movabs $0x802528,%rax
  802f0f:	00 00 00 
  802f12:	ff d0                	callq  *%rax
  802f14:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f17:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f1b:	79 08                	jns    802f25 <open+0x57>
  802f1d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f20:	e9 81 00 00 00       	jmpq   802fa6 <open+0xd8>
  802f25:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f29:	48 89 c6             	mov    %rax,%rsi
  802f2c:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  802f33:	00 00 00 
  802f36:	48 b8 96 11 80 00 00 	movabs $0x801196,%rax
  802f3d:	00 00 00 
  802f40:	ff d0                	callq  *%rax
  802f42:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802f49:	00 00 00 
  802f4c:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802f4f:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802f55:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f59:	48 89 c6             	mov    %rax,%rsi
  802f5c:	bf 01 00 00 00       	mov    $0x1,%edi
  802f61:	48 b8 45 2e 80 00 00 	movabs $0x802e45,%rax
  802f68:	00 00 00 
  802f6b:	ff d0                	callq  *%rax
  802f6d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f70:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f74:	79 1d                	jns    802f93 <open+0xc5>
  802f76:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f7a:	be 00 00 00 00       	mov    $0x0,%esi
  802f7f:	48 89 c7             	mov    %rax,%rdi
  802f82:	48 b8 50 26 80 00 00 	movabs $0x802650,%rax
  802f89:	00 00 00 
  802f8c:	ff d0                	callq  *%rax
  802f8e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f91:	eb 13                	jmp    802fa6 <open+0xd8>
  802f93:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f97:	48 89 c7             	mov    %rax,%rdi
  802f9a:	48 b8 da 24 80 00 00 	movabs $0x8024da,%rax
  802fa1:	00 00 00 
  802fa4:	ff d0                	callq  *%rax
  802fa6:	c9                   	leaveq 
  802fa7:	c3                   	retq   

0000000000802fa8 <devfile_flush>:
  802fa8:	55                   	push   %rbp
  802fa9:	48 89 e5             	mov    %rsp,%rbp
  802fac:	48 83 ec 10          	sub    $0x10,%rsp
  802fb0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802fb4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802fb8:	8b 50 0c             	mov    0xc(%rax),%edx
  802fbb:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802fc2:	00 00 00 
  802fc5:	89 10                	mov    %edx,(%rax)
  802fc7:	be 00 00 00 00       	mov    $0x0,%esi
  802fcc:	bf 06 00 00 00       	mov    $0x6,%edi
  802fd1:	48 b8 45 2e 80 00 00 	movabs $0x802e45,%rax
  802fd8:	00 00 00 
  802fdb:	ff d0                	callq  *%rax
  802fdd:	c9                   	leaveq 
  802fde:	c3                   	retq   

0000000000802fdf <devfile_read>:
  802fdf:	55                   	push   %rbp
  802fe0:	48 89 e5             	mov    %rsp,%rbp
  802fe3:	48 83 ec 30          	sub    $0x30,%rsp
  802fe7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802feb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802fef:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802ff3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ff7:	8b 50 0c             	mov    0xc(%rax),%edx
  802ffa:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803001:	00 00 00 
  803004:	89 10                	mov    %edx,(%rax)
  803006:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80300d:	00 00 00 
  803010:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803014:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803018:	be 00 00 00 00       	mov    $0x0,%esi
  80301d:	bf 03 00 00 00       	mov    $0x3,%edi
  803022:	48 b8 45 2e 80 00 00 	movabs $0x802e45,%rax
  803029:	00 00 00 
  80302c:	ff d0                	callq  *%rax
  80302e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803031:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803035:	79 08                	jns    80303f <devfile_read+0x60>
  803037:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80303a:	e9 a4 00 00 00       	jmpq   8030e3 <devfile_read+0x104>
  80303f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803042:	48 98                	cltq   
  803044:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803048:	76 35                	jbe    80307f <devfile_read+0xa0>
  80304a:	48 b9 16 51 80 00 00 	movabs $0x805116,%rcx
  803051:	00 00 00 
  803054:	48 ba 1d 51 80 00 00 	movabs $0x80511d,%rdx
  80305b:	00 00 00 
  80305e:	be 89 00 00 00       	mov    $0x89,%esi
  803063:	48 bf 32 51 80 00 00 	movabs $0x805132,%rdi
  80306a:	00 00 00 
  80306d:	b8 00 00 00 00       	mov    $0x0,%eax
  803072:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  803079:	00 00 00 
  80307c:	41 ff d0             	callq  *%r8
  80307f:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  803086:	7e 35                	jle    8030bd <devfile_read+0xde>
  803088:	48 b9 40 51 80 00 00 	movabs $0x805140,%rcx
  80308f:	00 00 00 
  803092:	48 ba 1d 51 80 00 00 	movabs $0x80511d,%rdx
  803099:	00 00 00 
  80309c:	be 8a 00 00 00       	mov    $0x8a,%esi
  8030a1:	48 bf 32 51 80 00 00 	movabs $0x805132,%rdi
  8030a8:	00 00 00 
  8030ab:	b8 00 00 00 00       	mov    $0x0,%eax
  8030b0:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  8030b7:	00 00 00 
  8030ba:	41 ff d0             	callq  *%r8
  8030bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030c0:	48 63 d0             	movslq %eax,%rdx
  8030c3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8030c7:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8030ce:	00 00 00 
  8030d1:	48 89 c7             	mov    %rax,%rdi
  8030d4:	48 b8 bb 14 80 00 00 	movabs $0x8014bb,%rax
  8030db:	00 00 00 
  8030de:	ff d0                	callq  *%rax
  8030e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030e3:	c9                   	leaveq 
  8030e4:	c3                   	retq   

00000000008030e5 <devfile_write>:
  8030e5:	55                   	push   %rbp
  8030e6:	48 89 e5             	mov    %rsp,%rbp
  8030e9:	48 83 ec 40          	sub    $0x40,%rsp
  8030ed:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8030f1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8030f5:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8030f9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8030fd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803101:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  803108:	00 
  803109:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80310d:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  803111:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  803116:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  80311a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80311e:	8b 50 0c             	mov    0xc(%rax),%edx
  803121:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803128:	00 00 00 
  80312b:	89 10                	mov    %edx,(%rax)
  80312d:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803134:	00 00 00 
  803137:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80313b:	48 89 50 08          	mov    %rdx,0x8(%rax)
  80313f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803143:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803147:	48 89 c6             	mov    %rax,%rsi
  80314a:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  803151:	00 00 00 
  803154:	48 b8 bb 14 80 00 00 	movabs $0x8014bb,%rax
  80315b:	00 00 00 
  80315e:	ff d0                	callq  *%rax
  803160:	be 00 00 00 00       	mov    $0x0,%esi
  803165:	bf 04 00 00 00       	mov    $0x4,%edi
  80316a:	48 b8 45 2e 80 00 00 	movabs $0x802e45,%rax
  803171:	00 00 00 
  803174:	ff d0                	callq  *%rax
  803176:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803179:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80317d:	79 05                	jns    803184 <devfile_write+0x9f>
  80317f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803182:	eb 43                	jmp    8031c7 <devfile_write+0xe2>
  803184:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803187:	48 98                	cltq   
  803189:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80318d:	76 35                	jbe    8031c4 <devfile_write+0xdf>
  80318f:	48 b9 16 51 80 00 00 	movabs $0x805116,%rcx
  803196:	00 00 00 
  803199:	48 ba 1d 51 80 00 00 	movabs $0x80511d,%rdx
  8031a0:	00 00 00 
  8031a3:	be a8 00 00 00       	mov    $0xa8,%esi
  8031a8:	48 bf 32 51 80 00 00 	movabs $0x805132,%rdi
  8031af:	00 00 00 
  8031b2:	b8 00 00 00 00       	mov    $0x0,%eax
  8031b7:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  8031be:	00 00 00 
  8031c1:	41 ff d0             	callq  *%r8
  8031c4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8031c7:	c9                   	leaveq 
  8031c8:	c3                   	retq   

00000000008031c9 <devfile_stat>:
  8031c9:	55                   	push   %rbp
  8031ca:	48 89 e5             	mov    %rsp,%rbp
  8031cd:	48 83 ec 20          	sub    $0x20,%rsp
  8031d1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8031d5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8031d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031dd:	8b 50 0c             	mov    0xc(%rax),%edx
  8031e0:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8031e7:	00 00 00 
  8031ea:	89 10                	mov    %edx,(%rax)
  8031ec:	be 00 00 00 00       	mov    $0x0,%esi
  8031f1:	bf 05 00 00 00       	mov    $0x5,%edi
  8031f6:	48 b8 45 2e 80 00 00 	movabs $0x802e45,%rax
  8031fd:	00 00 00 
  803200:	ff d0                	callq  *%rax
  803202:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803205:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803209:	79 05                	jns    803210 <devfile_stat+0x47>
  80320b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80320e:	eb 56                	jmp    803266 <devfile_stat+0x9d>
  803210:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803214:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  80321b:	00 00 00 
  80321e:	48 89 c7             	mov    %rax,%rdi
  803221:	48 b8 96 11 80 00 00 	movabs $0x801196,%rax
  803228:	00 00 00 
  80322b:	ff d0                	callq  *%rax
  80322d:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803234:	00 00 00 
  803237:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  80323d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803241:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803247:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80324e:	00 00 00 
  803251:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803257:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80325b:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803261:	b8 00 00 00 00       	mov    $0x0,%eax
  803266:	c9                   	leaveq 
  803267:	c3                   	retq   

0000000000803268 <devfile_trunc>:
  803268:	55                   	push   %rbp
  803269:	48 89 e5             	mov    %rsp,%rbp
  80326c:	48 83 ec 10          	sub    $0x10,%rsp
  803270:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803274:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803277:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80327b:	8b 50 0c             	mov    0xc(%rax),%edx
  80327e:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803285:	00 00 00 
  803288:	89 10                	mov    %edx,(%rax)
  80328a:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803291:	00 00 00 
  803294:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803297:	89 50 04             	mov    %edx,0x4(%rax)
  80329a:	be 00 00 00 00       	mov    $0x0,%esi
  80329f:	bf 02 00 00 00       	mov    $0x2,%edi
  8032a4:	48 b8 45 2e 80 00 00 	movabs $0x802e45,%rax
  8032ab:	00 00 00 
  8032ae:	ff d0                	callq  *%rax
  8032b0:	c9                   	leaveq 
  8032b1:	c3                   	retq   

00000000008032b2 <remove>:
  8032b2:	55                   	push   %rbp
  8032b3:	48 89 e5             	mov    %rsp,%rbp
  8032b6:	48 83 ec 10          	sub    $0x10,%rsp
  8032ba:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8032be:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8032c2:	48 89 c7             	mov    %rax,%rdi
  8032c5:	48 b8 2a 11 80 00 00 	movabs $0x80112a,%rax
  8032cc:	00 00 00 
  8032cf:	ff d0                	callq  *%rax
  8032d1:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8032d6:	7e 07                	jle    8032df <remove+0x2d>
  8032d8:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8032dd:	eb 33                	jmp    803312 <remove+0x60>
  8032df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8032e3:	48 89 c6             	mov    %rax,%rsi
  8032e6:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8032ed:	00 00 00 
  8032f0:	48 b8 96 11 80 00 00 	movabs $0x801196,%rax
  8032f7:	00 00 00 
  8032fa:	ff d0                	callq  *%rax
  8032fc:	be 00 00 00 00       	mov    $0x0,%esi
  803301:	bf 07 00 00 00       	mov    $0x7,%edi
  803306:	48 b8 45 2e 80 00 00 	movabs $0x802e45,%rax
  80330d:	00 00 00 
  803310:	ff d0                	callq  *%rax
  803312:	c9                   	leaveq 
  803313:	c3                   	retq   

0000000000803314 <sync>:
  803314:	55                   	push   %rbp
  803315:	48 89 e5             	mov    %rsp,%rbp
  803318:	be 00 00 00 00       	mov    $0x0,%esi
  80331d:	bf 08 00 00 00       	mov    $0x8,%edi
  803322:	48 b8 45 2e 80 00 00 	movabs $0x802e45,%rax
  803329:	00 00 00 
  80332c:	ff d0                	callq  *%rax
  80332e:	5d                   	pop    %rbp
  80332f:	c3                   	retq   

0000000000803330 <copy>:
  803330:	55                   	push   %rbp
  803331:	48 89 e5             	mov    %rsp,%rbp
  803334:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  80333b:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803342:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803349:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803350:	be 00 00 00 00       	mov    $0x0,%esi
  803355:	48 89 c7             	mov    %rax,%rdi
  803358:	48 b8 ce 2e 80 00 00 	movabs $0x802ece,%rax
  80335f:	00 00 00 
  803362:	ff d0                	callq  *%rax
  803364:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803367:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80336b:	79 28                	jns    803395 <copy+0x65>
  80336d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803370:	89 c6                	mov    %eax,%esi
  803372:	48 bf 4c 51 80 00 00 	movabs $0x80514c,%rdi
  803379:	00 00 00 
  80337c:	b8 00 00 00 00       	mov    $0x0,%eax
  803381:	48 ba 06 06 80 00 00 	movabs $0x800606,%rdx
  803388:	00 00 00 
  80338b:	ff d2                	callq  *%rdx
  80338d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803390:	e9 76 01 00 00       	jmpq   80350b <copy+0x1db>
  803395:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  80339c:	be 01 01 00 00       	mov    $0x101,%esi
  8033a1:	48 89 c7             	mov    %rax,%rdi
  8033a4:	48 b8 ce 2e 80 00 00 	movabs $0x802ece,%rax
  8033ab:	00 00 00 
  8033ae:	ff d0                	callq  *%rax
  8033b0:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8033b3:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8033b7:	0f 89 ad 00 00 00    	jns    80346a <copy+0x13a>
  8033bd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8033c0:	89 c6                	mov    %eax,%esi
  8033c2:	48 bf 62 51 80 00 00 	movabs $0x805162,%rdi
  8033c9:	00 00 00 
  8033cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8033d1:	48 ba 06 06 80 00 00 	movabs $0x800606,%rdx
  8033d8:	00 00 00 
  8033db:	ff d2                	callq  *%rdx
  8033dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033e0:	89 c7                	mov    %eax,%edi
  8033e2:	48 b8 d2 27 80 00 00 	movabs $0x8027d2,%rax
  8033e9:	00 00 00 
  8033ec:	ff d0                	callq  *%rax
  8033ee:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8033f1:	e9 15 01 00 00       	jmpq   80350b <copy+0x1db>
  8033f6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8033f9:	48 63 d0             	movslq %eax,%rdx
  8033fc:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803403:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803406:	48 89 ce             	mov    %rcx,%rsi
  803409:	89 c7                	mov    %eax,%edi
  80340b:	48 b8 40 2b 80 00 00 	movabs $0x802b40,%rax
  803412:	00 00 00 
  803415:	ff d0                	callq  *%rax
  803417:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80341a:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80341e:	79 4a                	jns    80346a <copy+0x13a>
  803420:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803423:	89 c6                	mov    %eax,%esi
  803425:	48 bf 7c 51 80 00 00 	movabs $0x80517c,%rdi
  80342c:	00 00 00 
  80342f:	b8 00 00 00 00       	mov    $0x0,%eax
  803434:	48 ba 06 06 80 00 00 	movabs $0x800606,%rdx
  80343b:	00 00 00 
  80343e:	ff d2                	callq  *%rdx
  803440:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803443:	89 c7                	mov    %eax,%edi
  803445:	48 b8 d2 27 80 00 00 	movabs $0x8027d2,%rax
  80344c:	00 00 00 
  80344f:	ff d0                	callq  *%rax
  803451:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803454:	89 c7                	mov    %eax,%edi
  803456:	48 b8 d2 27 80 00 00 	movabs $0x8027d2,%rax
  80345d:	00 00 00 
  803460:	ff d0                	callq  *%rax
  803462:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803465:	e9 a1 00 00 00       	jmpq   80350b <copy+0x1db>
  80346a:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803471:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803474:	ba 00 02 00 00       	mov    $0x200,%edx
  803479:	48 89 ce             	mov    %rcx,%rsi
  80347c:	89 c7                	mov    %eax,%edi
  80347e:	48 b8 f5 29 80 00 00 	movabs $0x8029f5,%rax
  803485:	00 00 00 
  803488:	ff d0                	callq  *%rax
  80348a:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80348d:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803491:	0f 8f 5f ff ff ff    	jg     8033f6 <copy+0xc6>
  803497:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80349b:	79 47                	jns    8034e4 <copy+0x1b4>
  80349d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8034a0:	89 c6                	mov    %eax,%esi
  8034a2:	48 bf 8f 51 80 00 00 	movabs $0x80518f,%rdi
  8034a9:	00 00 00 
  8034ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8034b1:	48 ba 06 06 80 00 00 	movabs $0x800606,%rdx
  8034b8:	00 00 00 
  8034bb:	ff d2                	callq  *%rdx
  8034bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034c0:	89 c7                	mov    %eax,%edi
  8034c2:	48 b8 d2 27 80 00 00 	movabs $0x8027d2,%rax
  8034c9:	00 00 00 
  8034cc:	ff d0                	callq  *%rax
  8034ce:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034d1:	89 c7                	mov    %eax,%edi
  8034d3:	48 b8 d2 27 80 00 00 	movabs $0x8027d2,%rax
  8034da:	00 00 00 
  8034dd:	ff d0                	callq  *%rax
  8034df:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8034e2:	eb 27                	jmp    80350b <copy+0x1db>
  8034e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034e7:	89 c7                	mov    %eax,%edi
  8034e9:	48 b8 d2 27 80 00 00 	movabs $0x8027d2,%rax
  8034f0:	00 00 00 
  8034f3:	ff d0                	callq  *%rax
  8034f5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034f8:	89 c7                	mov    %eax,%edi
  8034fa:	48 b8 d2 27 80 00 00 	movabs $0x8027d2,%rax
  803501:	00 00 00 
  803504:	ff d0                	callq  *%rax
  803506:	b8 00 00 00 00       	mov    $0x0,%eax
  80350b:	c9                   	leaveq 
  80350c:	c3                   	retq   

000000000080350d <fd2sockid>:
  80350d:	55                   	push   %rbp
  80350e:	48 89 e5             	mov    %rsp,%rbp
  803511:	48 83 ec 20          	sub    $0x20,%rsp
  803515:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803518:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80351c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80351f:	48 89 d6             	mov    %rdx,%rsi
  803522:	89 c7                	mov    %eax,%edi
  803524:	48 b8 c0 25 80 00 00 	movabs $0x8025c0,%rax
  80352b:	00 00 00 
  80352e:	ff d0                	callq  *%rax
  803530:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803533:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803537:	79 05                	jns    80353e <fd2sockid+0x31>
  803539:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80353c:	eb 24                	jmp    803562 <fd2sockid+0x55>
  80353e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803542:	8b 10                	mov    (%rax),%edx
  803544:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  80354b:	00 00 00 
  80354e:	8b 00                	mov    (%rax),%eax
  803550:	39 c2                	cmp    %eax,%edx
  803552:	74 07                	je     80355b <fd2sockid+0x4e>
  803554:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803559:	eb 07                	jmp    803562 <fd2sockid+0x55>
  80355b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80355f:	8b 40 0c             	mov    0xc(%rax),%eax
  803562:	c9                   	leaveq 
  803563:	c3                   	retq   

0000000000803564 <alloc_sockfd>:
  803564:	55                   	push   %rbp
  803565:	48 89 e5             	mov    %rsp,%rbp
  803568:	48 83 ec 20          	sub    $0x20,%rsp
  80356c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80356f:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803573:	48 89 c7             	mov    %rax,%rdi
  803576:	48 b8 28 25 80 00 00 	movabs $0x802528,%rax
  80357d:	00 00 00 
  803580:	ff d0                	callq  *%rax
  803582:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803585:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803589:	78 26                	js     8035b1 <alloc_sockfd+0x4d>
  80358b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80358f:	ba 07 04 00 00       	mov    $0x407,%edx
  803594:	48 89 c6             	mov    %rax,%rsi
  803597:	bf 00 00 00 00       	mov    $0x0,%edi
  80359c:	48 b8 c6 1a 80 00 00 	movabs $0x801ac6,%rax
  8035a3:	00 00 00 
  8035a6:	ff d0                	callq  *%rax
  8035a8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035ab:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035af:	79 16                	jns    8035c7 <alloc_sockfd+0x63>
  8035b1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8035b4:	89 c7                	mov    %eax,%edi
  8035b6:	48 b8 73 3a 80 00 00 	movabs $0x803a73,%rax
  8035bd:	00 00 00 
  8035c0:	ff d0                	callq  *%rax
  8035c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035c5:	eb 3a                	jmp    803601 <alloc_sockfd+0x9d>
  8035c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035cb:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  8035d2:	00 00 00 
  8035d5:	8b 12                	mov    (%rdx),%edx
  8035d7:	89 10                	mov    %edx,(%rax)
  8035d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035dd:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8035e4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035e8:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8035eb:	89 50 0c             	mov    %edx,0xc(%rax)
  8035ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035f2:	48 89 c7             	mov    %rax,%rdi
  8035f5:	48 b8 da 24 80 00 00 	movabs $0x8024da,%rax
  8035fc:	00 00 00 
  8035ff:	ff d0                	callq  *%rax
  803601:	c9                   	leaveq 
  803602:	c3                   	retq   

0000000000803603 <accept>:
  803603:	55                   	push   %rbp
  803604:	48 89 e5             	mov    %rsp,%rbp
  803607:	48 83 ec 30          	sub    $0x30,%rsp
  80360b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80360e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803612:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803616:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803619:	89 c7                	mov    %eax,%edi
  80361b:	48 b8 0d 35 80 00 00 	movabs $0x80350d,%rax
  803622:	00 00 00 
  803625:	ff d0                	callq  *%rax
  803627:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80362a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80362e:	79 05                	jns    803635 <accept+0x32>
  803630:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803633:	eb 3b                	jmp    803670 <accept+0x6d>
  803635:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803639:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80363d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803640:	48 89 ce             	mov    %rcx,%rsi
  803643:	89 c7                	mov    %eax,%edi
  803645:	48 b8 50 39 80 00 00 	movabs $0x803950,%rax
  80364c:	00 00 00 
  80364f:	ff d0                	callq  *%rax
  803651:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803654:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803658:	79 05                	jns    80365f <accept+0x5c>
  80365a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80365d:	eb 11                	jmp    803670 <accept+0x6d>
  80365f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803662:	89 c7                	mov    %eax,%edi
  803664:	48 b8 64 35 80 00 00 	movabs $0x803564,%rax
  80366b:	00 00 00 
  80366e:	ff d0                	callq  *%rax
  803670:	c9                   	leaveq 
  803671:	c3                   	retq   

0000000000803672 <bind>:
  803672:	55                   	push   %rbp
  803673:	48 89 e5             	mov    %rsp,%rbp
  803676:	48 83 ec 20          	sub    $0x20,%rsp
  80367a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80367d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803681:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803684:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803687:	89 c7                	mov    %eax,%edi
  803689:	48 b8 0d 35 80 00 00 	movabs $0x80350d,%rax
  803690:	00 00 00 
  803693:	ff d0                	callq  *%rax
  803695:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803698:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80369c:	79 05                	jns    8036a3 <bind+0x31>
  80369e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036a1:	eb 1b                	jmp    8036be <bind+0x4c>
  8036a3:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8036a6:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8036aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036ad:	48 89 ce             	mov    %rcx,%rsi
  8036b0:	89 c7                	mov    %eax,%edi
  8036b2:	48 b8 cf 39 80 00 00 	movabs $0x8039cf,%rax
  8036b9:	00 00 00 
  8036bc:	ff d0                	callq  *%rax
  8036be:	c9                   	leaveq 
  8036bf:	c3                   	retq   

00000000008036c0 <shutdown>:
  8036c0:	55                   	push   %rbp
  8036c1:	48 89 e5             	mov    %rsp,%rbp
  8036c4:	48 83 ec 20          	sub    $0x20,%rsp
  8036c8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8036cb:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8036ce:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036d1:	89 c7                	mov    %eax,%edi
  8036d3:	48 b8 0d 35 80 00 00 	movabs $0x80350d,%rax
  8036da:	00 00 00 
  8036dd:	ff d0                	callq  *%rax
  8036df:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036e2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036e6:	79 05                	jns    8036ed <shutdown+0x2d>
  8036e8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036eb:	eb 16                	jmp    803703 <shutdown+0x43>
  8036ed:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8036f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036f3:	89 d6                	mov    %edx,%esi
  8036f5:	89 c7                	mov    %eax,%edi
  8036f7:	48 b8 33 3a 80 00 00 	movabs $0x803a33,%rax
  8036fe:	00 00 00 
  803701:	ff d0                	callq  *%rax
  803703:	c9                   	leaveq 
  803704:	c3                   	retq   

0000000000803705 <devsock_close>:
  803705:	55                   	push   %rbp
  803706:	48 89 e5             	mov    %rsp,%rbp
  803709:	48 83 ec 10          	sub    $0x10,%rsp
  80370d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803711:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803715:	48 89 c7             	mov    %rax,%rdi
  803718:	48 b8 ed 48 80 00 00 	movabs $0x8048ed,%rax
  80371f:	00 00 00 
  803722:	ff d0                	callq  *%rax
  803724:	83 f8 01             	cmp    $0x1,%eax
  803727:	75 17                	jne    803740 <devsock_close+0x3b>
  803729:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80372d:	8b 40 0c             	mov    0xc(%rax),%eax
  803730:	89 c7                	mov    %eax,%edi
  803732:	48 b8 73 3a 80 00 00 	movabs $0x803a73,%rax
  803739:	00 00 00 
  80373c:	ff d0                	callq  *%rax
  80373e:	eb 05                	jmp    803745 <devsock_close+0x40>
  803740:	b8 00 00 00 00       	mov    $0x0,%eax
  803745:	c9                   	leaveq 
  803746:	c3                   	retq   

0000000000803747 <connect>:
  803747:	55                   	push   %rbp
  803748:	48 89 e5             	mov    %rsp,%rbp
  80374b:	48 83 ec 20          	sub    $0x20,%rsp
  80374f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803752:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803756:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803759:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80375c:	89 c7                	mov    %eax,%edi
  80375e:	48 b8 0d 35 80 00 00 	movabs $0x80350d,%rax
  803765:	00 00 00 
  803768:	ff d0                	callq  *%rax
  80376a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80376d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803771:	79 05                	jns    803778 <connect+0x31>
  803773:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803776:	eb 1b                	jmp    803793 <connect+0x4c>
  803778:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80377b:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80377f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803782:	48 89 ce             	mov    %rcx,%rsi
  803785:	89 c7                	mov    %eax,%edi
  803787:	48 b8 a0 3a 80 00 00 	movabs $0x803aa0,%rax
  80378e:	00 00 00 
  803791:	ff d0                	callq  *%rax
  803793:	c9                   	leaveq 
  803794:	c3                   	retq   

0000000000803795 <listen>:
  803795:	55                   	push   %rbp
  803796:	48 89 e5             	mov    %rsp,%rbp
  803799:	48 83 ec 20          	sub    $0x20,%rsp
  80379d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8037a0:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8037a3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037a6:	89 c7                	mov    %eax,%edi
  8037a8:	48 b8 0d 35 80 00 00 	movabs $0x80350d,%rax
  8037af:	00 00 00 
  8037b2:	ff d0                	callq  *%rax
  8037b4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037b7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037bb:	79 05                	jns    8037c2 <listen+0x2d>
  8037bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037c0:	eb 16                	jmp    8037d8 <listen+0x43>
  8037c2:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8037c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037c8:	89 d6                	mov    %edx,%esi
  8037ca:	89 c7                	mov    %eax,%edi
  8037cc:	48 b8 04 3b 80 00 00 	movabs $0x803b04,%rax
  8037d3:	00 00 00 
  8037d6:	ff d0                	callq  *%rax
  8037d8:	c9                   	leaveq 
  8037d9:	c3                   	retq   

00000000008037da <devsock_read>:
  8037da:	55                   	push   %rbp
  8037db:	48 89 e5             	mov    %rsp,%rbp
  8037de:	48 83 ec 20          	sub    $0x20,%rsp
  8037e2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8037e6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8037ea:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8037ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037f2:	89 c2                	mov    %eax,%edx
  8037f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037f8:	8b 40 0c             	mov    0xc(%rax),%eax
  8037fb:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8037ff:	b9 00 00 00 00       	mov    $0x0,%ecx
  803804:	89 c7                	mov    %eax,%edi
  803806:	48 b8 44 3b 80 00 00 	movabs $0x803b44,%rax
  80380d:	00 00 00 
  803810:	ff d0                	callq  *%rax
  803812:	c9                   	leaveq 
  803813:	c3                   	retq   

0000000000803814 <devsock_write>:
  803814:	55                   	push   %rbp
  803815:	48 89 e5             	mov    %rsp,%rbp
  803818:	48 83 ec 20          	sub    $0x20,%rsp
  80381c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803820:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803824:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803828:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80382c:	89 c2                	mov    %eax,%edx
  80382e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803832:	8b 40 0c             	mov    0xc(%rax),%eax
  803835:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803839:	b9 00 00 00 00       	mov    $0x0,%ecx
  80383e:	89 c7                	mov    %eax,%edi
  803840:	48 b8 10 3c 80 00 00 	movabs $0x803c10,%rax
  803847:	00 00 00 
  80384a:	ff d0                	callq  *%rax
  80384c:	c9                   	leaveq 
  80384d:	c3                   	retq   

000000000080384e <devsock_stat>:
  80384e:	55                   	push   %rbp
  80384f:	48 89 e5             	mov    %rsp,%rbp
  803852:	48 83 ec 10          	sub    $0x10,%rsp
  803856:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80385a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80385e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803862:	48 be aa 51 80 00 00 	movabs $0x8051aa,%rsi
  803869:	00 00 00 
  80386c:	48 89 c7             	mov    %rax,%rdi
  80386f:	48 b8 96 11 80 00 00 	movabs $0x801196,%rax
  803876:	00 00 00 
  803879:	ff d0                	callq  *%rax
  80387b:	b8 00 00 00 00       	mov    $0x0,%eax
  803880:	c9                   	leaveq 
  803881:	c3                   	retq   

0000000000803882 <socket>:
  803882:	55                   	push   %rbp
  803883:	48 89 e5             	mov    %rsp,%rbp
  803886:	48 83 ec 20          	sub    $0x20,%rsp
  80388a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80388d:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803890:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803893:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803896:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803899:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80389c:	89 ce                	mov    %ecx,%esi
  80389e:	89 c7                	mov    %eax,%edi
  8038a0:	48 b8 c8 3c 80 00 00 	movabs $0x803cc8,%rax
  8038a7:	00 00 00 
  8038aa:	ff d0                	callq  *%rax
  8038ac:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038af:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038b3:	79 05                	jns    8038ba <socket+0x38>
  8038b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038b8:	eb 11                	jmp    8038cb <socket+0x49>
  8038ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038bd:	89 c7                	mov    %eax,%edi
  8038bf:	48 b8 64 35 80 00 00 	movabs $0x803564,%rax
  8038c6:	00 00 00 
  8038c9:	ff d0                	callq  *%rax
  8038cb:	c9                   	leaveq 
  8038cc:	c3                   	retq   

00000000008038cd <nsipc>:
  8038cd:	55                   	push   %rbp
  8038ce:	48 89 e5             	mov    %rsp,%rbp
  8038d1:	48 83 ec 10          	sub    $0x10,%rsp
  8038d5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8038d8:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  8038df:	00 00 00 
  8038e2:	8b 00                	mov    (%rax),%eax
  8038e4:	85 c0                	test   %eax,%eax
  8038e6:	75 1f                	jne    803907 <nsipc+0x3a>
  8038e8:	bf 02 00 00 00       	mov    $0x2,%edi
  8038ed:	48 b8 7c 48 80 00 00 	movabs $0x80487c,%rax
  8038f4:	00 00 00 
  8038f7:	ff d0                	callq  *%rax
  8038f9:	89 c2                	mov    %eax,%edx
  8038fb:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803902:	00 00 00 
  803905:	89 10                	mov    %edx,(%rax)
  803907:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  80390e:	00 00 00 
  803911:	8b 00                	mov    (%rax),%eax
  803913:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803916:	b9 07 00 00 00       	mov    $0x7,%ecx
  80391b:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803922:	00 00 00 
  803925:	89 c7                	mov    %eax,%edi
  803927:	48 b8 72 47 80 00 00 	movabs $0x804772,%rax
  80392e:	00 00 00 
  803931:	ff d0                	callq  *%rax
  803933:	ba 00 00 00 00       	mov    $0x0,%edx
  803938:	be 00 00 00 00       	mov    $0x0,%esi
  80393d:	bf 00 00 00 00       	mov    $0x0,%edi
  803942:	48 b8 b1 46 80 00 00 	movabs $0x8046b1,%rax
  803949:	00 00 00 
  80394c:	ff d0                	callq  *%rax
  80394e:	c9                   	leaveq 
  80394f:	c3                   	retq   

0000000000803950 <nsipc_accept>:
  803950:	55                   	push   %rbp
  803951:	48 89 e5             	mov    %rsp,%rbp
  803954:	48 83 ec 30          	sub    $0x30,%rsp
  803958:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80395b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80395f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803963:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80396a:	00 00 00 
  80396d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803970:	89 10                	mov    %edx,(%rax)
  803972:	bf 01 00 00 00       	mov    $0x1,%edi
  803977:	48 b8 cd 38 80 00 00 	movabs $0x8038cd,%rax
  80397e:	00 00 00 
  803981:	ff d0                	callq  *%rax
  803983:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803986:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80398a:	78 3e                	js     8039ca <nsipc_accept+0x7a>
  80398c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803993:	00 00 00 
  803996:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80399a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80399e:	8b 40 10             	mov    0x10(%rax),%eax
  8039a1:	89 c2                	mov    %eax,%edx
  8039a3:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8039a7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8039ab:	48 89 ce             	mov    %rcx,%rsi
  8039ae:	48 89 c7             	mov    %rax,%rdi
  8039b1:	48 b8 bb 14 80 00 00 	movabs $0x8014bb,%rax
  8039b8:	00 00 00 
  8039bb:	ff d0                	callq  *%rax
  8039bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039c1:	8b 50 10             	mov    0x10(%rax),%edx
  8039c4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8039c8:	89 10                	mov    %edx,(%rax)
  8039ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039cd:	c9                   	leaveq 
  8039ce:	c3                   	retq   

00000000008039cf <nsipc_bind>:
  8039cf:	55                   	push   %rbp
  8039d0:	48 89 e5             	mov    %rsp,%rbp
  8039d3:	48 83 ec 10          	sub    $0x10,%rsp
  8039d7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8039da:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8039de:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8039e1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8039e8:	00 00 00 
  8039eb:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8039ee:	89 10                	mov    %edx,(%rax)
  8039f0:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8039f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039f7:	48 89 c6             	mov    %rax,%rsi
  8039fa:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803a01:	00 00 00 
  803a04:	48 b8 bb 14 80 00 00 	movabs $0x8014bb,%rax
  803a0b:	00 00 00 
  803a0e:	ff d0                	callq  *%rax
  803a10:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a17:	00 00 00 
  803a1a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803a1d:	89 50 14             	mov    %edx,0x14(%rax)
  803a20:	bf 02 00 00 00       	mov    $0x2,%edi
  803a25:	48 b8 cd 38 80 00 00 	movabs $0x8038cd,%rax
  803a2c:	00 00 00 
  803a2f:	ff d0                	callq  *%rax
  803a31:	c9                   	leaveq 
  803a32:	c3                   	retq   

0000000000803a33 <nsipc_shutdown>:
  803a33:	55                   	push   %rbp
  803a34:	48 89 e5             	mov    %rsp,%rbp
  803a37:	48 83 ec 10          	sub    $0x10,%rsp
  803a3b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803a3e:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803a41:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a48:	00 00 00 
  803a4b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803a4e:	89 10                	mov    %edx,(%rax)
  803a50:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a57:	00 00 00 
  803a5a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803a5d:	89 50 04             	mov    %edx,0x4(%rax)
  803a60:	bf 03 00 00 00       	mov    $0x3,%edi
  803a65:	48 b8 cd 38 80 00 00 	movabs $0x8038cd,%rax
  803a6c:	00 00 00 
  803a6f:	ff d0                	callq  *%rax
  803a71:	c9                   	leaveq 
  803a72:	c3                   	retq   

0000000000803a73 <nsipc_close>:
  803a73:	55                   	push   %rbp
  803a74:	48 89 e5             	mov    %rsp,%rbp
  803a77:	48 83 ec 10          	sub    $0x10,%rsp
  803a7b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803a7e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a85:	00 00 00 
  803a88:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803a8b:	89 10                	mov    %edx,(%rax)
  803a8d:	bf 04 00 00 00       	mov    $0x4,%edi
  803a92:	48 b8 cd 38 80 00 00 	movabs $0x8038cd,%rax
  803a99:	00 00 00 
  803a9c:	ff d0                	callq  *%rax
  803a9e:	c9                   	leaveq 
  803a9f:	c3                   	retq   

0000000000803aa0 <nsipc_connect>:
  803aa0:	55                   	push   %rbp
  803aa1:	48 89 e5             	mov    %rsp,%rbp
  803aa4:	48 83 ec 10          	sub    $0x10,%rsp
  803aa8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803aab:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803aaf:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803ab2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ab9:	00 00 00 
  803abc:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803abf:	89 10                	mov    %edx,(%rax)
  803ac1:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ac4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ac8:	48 89 c6             	mov    %rax,%rsi
  803acb:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803ad2:	00 00 00 
  803ad5:	48 b8 bb 14 80 00 00 	movabs $0x8014bb,%rax
  803adc:	00 00 00 
  803adf:	ff d0                	callq  *%rax
  803ae1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ae8:	00 00 00 
  803aeb:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803aee:	89 50 14             	mov    %edx,0x14(%rax)
  803af1:	bf 05 00 00 00       	mov    $0x5,%edi
  803af6:	48 b8 cd 38 80 00 00 	movabs $0x8038cd,%rax
  803afd:	00 00 00 
  803b00:	ff d0                	callq  *%rax
  803b02:	c9                   	leaveq 
  803b03:	c3                   	retq   

0000000000803b04 <nsipc_listen>:
  803b04:	55                   	push   %rbp
  803b05:	48 89 e5             	mov    %rsp,%rbp
  803b08:	48 83 ec 10          	sub    $0x10,%rsp
  803b0c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b0f:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803b12:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b19:	00 00 00 
  803b1c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803b1f:	89 10                	mov    %edx,(%rax)
  803b21:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b28:	00 00 00 
  803b2b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b2e:	89 50 04             	mov    %edx,0x4(%rax)
  803b31:	bf 06 00 00 00       	mov    $0x6,%edi
  803b36:	48 b8 cd 38 80 00 00 	movabs $0x8038cd,%rax
  803b3d:	00 00 00 
  803b40:	ff d0                	callq  *%rax
  803b42:	c9                   	leaveq 
  803b43:	c3                   	retq   

0000000000803b44 <nsipc_recv>:
  803b44:	55                   	push   %rbp
  803b45:	48 89 e5             	mov    %rsp,%rbp
  803b48:	48 83 ec 30          	sub    $0x30,%rsp
  803b4c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b4f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b53:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803b56:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803b59:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b60:	00 00 00 
  803b63:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803b66:	89 10                	mov    %edx,(%rax)
  803b68:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b6f:	00 00 00 
  803b72:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803b75:	89 50 04             	mov    %edx,0x4(%rax)
  803b78:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b7f:	00 00 00 
  803b82:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803b85:	89 50 08             	mov    %edx,0x8(%rax)
  803b88:	bf 07 00 00 00       	mov    $0x7,%edi
  803b8d:	48 b8 cd 38 80 00 00 	movabs $0x8038cd,%rax
  803b94:	00 00 00 
  803b97:	ff d0                	callq  *%rax
  803b99:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b9c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ba0:	78 69                	js     803c0b <nsipc_recv+0xc7>
  803ba2:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803ba9:	7f 08                	jg     803bb3 <nsipc_recv+0x6f>
  803bab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bae:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803bb1:	7e 35                	jle    803be8 <nsipc_recv+0xa4>
  803bb3:	48 b9 b1 51 80 00 00 	movabs $0x8051b1,%rcx
  803bba:	00 00 00 
  803bbd:	48 ba c6 51 80 00 00 	movabs $0x8051c6,%rdx
  803bc4:	00 00 00 
  803bc7:	be 62 00 00 00       	mov    $0x62,%esi
  803bcc:	48 bf db 51 80 00 00 	movabs $0x8051db,%rdi
  803bd3:	00 00 00 
  803bd6:	b8 00 00 00 00       	mov    $0x0,%eax
  803bdb:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  803be2:	00 00 00 
  803be5:	41 ff d0             	callq  *%r8
  803be8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803beb:	48 63 d0             	movslq %eax,%rdx
  803bee:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803bf2:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803bf9:	00 00 00 
  803bfc:	48 89 c7             	mov    %rax,%rdi
  803bff:	48 b8 bb 14 80 00 00 	movabs $0x8014bb,%rax
  803c06:	00 00 00 
  803c09:	ff d0                	callq  *%rax
  803c0b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c0e:	c9                   	leaveq 
  803c0f:	c3                   	retq   

0000000000803c10 <nsipc_send>:
  803c10:	55                   	push   %rbp
  803c11:	48 89 e5             	mov    %rsp,%rbp
  803c14:	48 83 ec 20          	sub    $0x20,%rsp
  803c18:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c1b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803c1f:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803c22:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803c25:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c2c:	00 00 00 
  803c2f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c32:	89 10                	mov    %edx,(%rax)
  803c34:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803c3b:	7e 35                	jle    803c72 <nsipc_send+0x62>
  803c3d:	48 b9 ea 51 80 00 00 	movabs $0x8051ea,%rcx
  803c44:	00 00 00 
  803c47:	48 ba c6 51 80 00 00 	movabs $0x8051c6,%rdx
  803c4e:	00 00 00 
  803c51:	be 6d 00 00 00       	mov    $0x6d,%esi
  803c56:	48 bf db 51 80 00 00 	movabs $0x8051db,%rdi
  803c5d:	00 00 00 
  803c60:	b8 00 00 00 00       	mov    $0x0,%eax
  803c65:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  803c6c:	00 00 00 
  803c6f:	41 ff d0             	callq  *%r8
  803c72:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803c75:	48 63 d0             	movslq %eax,%rdx
  803c78:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c7c:	48 89 c6             	mov    %rax,%rsi
  803c7f:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803c86:	00 00 00 
  803c89:	48 b8 bb 14 80 00 00 	movabs $0x8014bb,%rax
  803c90:	00 00 00 
  803c93:	ff d0                	callq  *%rax
  803c95:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c9c:	00 00 00 
  803c9f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ca2:	89 50 04             	mov    %edx,0x4(%rax)
  803ca5:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cac:	00 00 00 
  803caf:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803cb2:	89 50 08             	mov    %edx,0x8(%rax)
  803cb5:	bf 08 00 00 00       	mov    $0x8,%edi
  803cba:	48 b8 cd 38 80 00 00 	movabs $0x8038cd,%rax
  803cc1:	00 00 00 
  803cc4:	ff d0                	callq  *%rax
  803cc6:	c9                   	leaveq 
  803cc7:	c3                   	retq   

0000000000803cc8 <nsipc_socket>:
  803cc8:	55                   	push   %rbp
  803cc9:	48 89 e5             	mov    %rsp,%rbp
  803ccc:	48 83 ec 10          	sub    $0x10,%rsp
  803cd0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803cd3:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803cd6:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803cd9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ce0:	00 00 00 
  803ce3:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ce6:	89 10                	mov    %edx,(%rax)
  803ce8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cef:	00 00 00 
  803cf2:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803cf5:	89 50 04             	mov    %edx,0x4(%rax)
  803cf8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cff:	00 00 00 
  803d02:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803d05:	89 50 08             	mov    %edx,0x8(%rax)
  803d08:	bf 09 00 00 00       	mov    $0x9,%edi
  803d0d:	48 b8 cd 38 80 00 00 	movabs $0x8038cd,%rax
  803d14:	00 00 00 
  803d17:	ff d0                	callq  *%rax
  803d19:	c9                   	leaveq 
  803d1a:	c3                   	retq   

0000000000803d1b <pipe>:
  803d1b:	55                   	push   %rbp
  803d1c:	48 89 e5             	mov    %rsp,%rbp
  803d1f:	53                   	push   %rbx
  803d20:	48 83 ec 38          	sub    $0x38,%rsp
  803d24:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803d28:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803d2c:	48 89 c7             	mov    %rax,%rdi
  803d2f:	48 b8 28 25 80 00 00 	movabs $0x802528,%rax
  803d36:	00 00 00 
  803d39:	ff d0                	callq  *%rax
  803d3b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803d3e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803d42:	0f 88 bf 01 00 00    	js     803f07 <pipe+0x1ec>
  803d48:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d4c:	ba 07 04 00 00       	mov    $0x407,%edx
  803d51:	48 89 c6             	mov    %rax,%rsi
  803d54:	bf 00 00 00 00       	mov    $0x0,%edi
  803d59:	48 b8 c6 1a 80 00 00 	movabs $0x801ac6,%rax
  803d60:	00 00 00 
  803d63:	ff d0                	callq  *%rax
  803d65:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803d68:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803d6c:	0f 88 95 01 00 00    	js     803f07 <pipe+0x1ec>
  803d72:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803d76:	48 89 c7             	mov    %rax,%rdi
  803d79:	48 b8 28 25 80 00 00 	movabs $0x802528,%rax
  803d80:	00 00 00 
  803d83:	ff d0                	callq  *%rax
  803d85:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803d88:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803d8c:	0f 88 5d 01 00 00    	js     803eef <pipe+0x1d4>
  803d92:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d96:	ba 07 04 00 00       	mov    $0x407,%edx
  803d9b:	48 89 c6             	mov    %rax,%rsi
  803d9e:	bf 00 00 00 00       	mov    $0x0,%edi
  803da3:	48 b8 c6 1a 80 00 00 	movabs $0x801ac6,%rax
  803daa:	00 00 00 
  803dad:	ff d0                	callq  *%rax
  803daf:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803db2:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803db6:	0f 88 33 01 00 00    	js     803eef <pipe+0x1d4>
  803dbc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803dc0:	48 89 c7             	mov    %rax,%rdi
  803dc3:	48 b8 fd 24 80 00 00 	movabs $0x8024fd,%rax
  803dca:	00 00 00 
  803dcd:	ff d0                	callq  *%rax
  803dcf:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803dd3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803dd7:	ba 07 04 00 00       	mov    $0x407,%edx
  803ddc:	48 89 c6             	mov    %rax,%rsi
  803ddf:	bf 00 00 00 00       	mov    $0x0,%edi
  803de4:	48 b8 c6 1a 80 00 00 	movabs $0x801ac6,%rax
  803deb:	00 00 00 
  803dee:	ff d0                	callq  *%rax
  803df0:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803df3:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803df7:	0f 88 d9 00 00 00    	js     803ed6 <pipe+0x1bb>
  803dfd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e01:	48 89 c7             	mov    %rax,%rdi
  803e04:	48 b8 fd 24 80 00 00 	movabs $0x8024fd,%rax
  803e0b:	00 00 00 
  803e0e:	ff d0                	callq  *%rax
  803e10:	48 89 c2             	mov    %rax,%rdx
  803e13:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e17:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803e1d:	48 89 d1             	mov    %rdx,%rcx
  803e20:	ba 00 00 00 00       	mov    $0x0,%edx
  803e25:	48 89 c6             	mov    %rax,%rsi
  803e28:	bf 00 00 00 00       	mov    $0x0,%edi
  803e2d:	48 b8 18 1b 80 00 00 	movabs $0x801b18,%rax
  803e34:	00 00 00 
  803e37:	ff d0                	callq  *%rax
  803e39:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e3c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e40:	78 79                	js     803ebb <pipe+0x1a0>
  803e42:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e46:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803e4d:	00 00 00 
  803e50:	8b 12                	mov    (%rdx),%edx
  803e52:	89 10                	mov    %edx,(%rax)
  803e54:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e58:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803e5f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e63:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803e6a:	00 00 00 
  803e6d:	8b 12                	mov    (%rdx),%edx
  803e6f:	89 10                	mov    %edx,(%rax)
  803e71:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e75:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803e7c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e80:	48 89 c7             	mov    %rax,%rdi
  803e83:	48 b8 da 24 80 00 00 	movabs $0x8024da,%rax
  803e8a:	00 00 00 
  803e8d:	ff d0                	callq  *%rax
  803e8f:	89 c2                	mov    %eax,%edx
  803e91:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803e95:	89 10                	mov    %edx,(%rax)
  803e97:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803e9b:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803e9f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ea3:	48 89 c7             	mov    %rax,%rdi
  803ea6:	48 b8 da 24 80 00 00 	movabs $0x8024da,%rax
  803ead:	00 00 00 
  803eb0:	ff d0                	callq  *%rax
  803eb2:	89 03                	mov    %eax,(%rbx)
  803eb4:	b8 00 00 00 00       	mov    $0x0,%eax
  803eb9:	eb 4f                	jmp    803f0a <pipe+0x1ef>
  803ebb:	90                   	nop
  803ebc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ec0:	48 89 c6             	mov    %rax,%rsi
  803ec3:	bf 00 00 00 00       	mov    $0x0,%edi
  803ec8:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  803ecf:	00 00 00 
  803ed2:	ff d0                	callq  *%rax
  803ed4:	eb 01                	jmp    803ed7 <pipe+0x1bc>
  803ed6:	90                   	nop
  803ed7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803edb:	48 89 c6             	mov    %rax,%rsi
  803ede:	bf 00 00 00 00       	mov    $0x0,%edi
  803ee3:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  803eea:	00 00 00 
  803eed:	ff d0                	callq  *%rax
  803eef:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ef3:	48 89 c6             	mov    %rax,%rsi
  803ef6:	bf 00 00 00 00       	mov    $0x0,%edi
  803efb:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  803f02:	00 00 00 
  803f05:	ff d0                	callq  *%rax
  803f07:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f0a:	48 83 c4 38          	add    $0x38,%rsp
  803f0e:	5b                   	pop    %rbx
  803f0f:	5d                   	pop    %rbp
  803f10:	c3                   	retq   

0000000000803f11 <_pipeisclosed>:
  803f11:	55                   	push   %rbp
  803f12:	48 89 e5             	mov    %rsp,%rbp
  803f15:	53                   	push   %rbx
  803f16:	48 83 ec 28          	sub    $0x28,%rsp
  803f1a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803f1e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803f22:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803f29:	00 00 00 
  803f2c:	48 8b 00             	mov    (%rax),%rax
  803f2f:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803f35:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f38:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f3c:	48 89 c7             	mov    %rax,%rdi
  803f3f:	48 b8 ed 48 80 00 00 	movabs $0x8048ed,%rax
  803f46:	00 00 00 
  803f49:	ff d0                	callq  *%rax
  803f4b:	89 c3                	mov    %eax,%ebx
  803f4d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f51:	48 89 c7             	mov    %rax,%rdi
  803f54:	48 b8 ed 48 80 00 00 	movabs $0x8048ed,%rax
  803f5b:	00 00 00 
  803f5e:	ff d0                	callq  *%rax
  803f60:	39 c3                	cmp    %eax,%ebx
  803f62:	0f 94 c0             	sete   %al
  803f65:	0f b6 c0             	movzbl %al,%eax
  803f68:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803f6b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803f72:	00 00 00 
  803f75:	48 8b 00             	mov    (%rax),%rax
  803f78:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803f7e:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803f81:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f84:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803f87:	75 05                	jne    803f8e <_pipeisclosed+0x7d>
  803f89:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803f8c:	eb 4a                	jmp    803fd8 <_pipeisclosed+0xc7>
  803f8e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f91:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803f94:	74 8c                	je     803f22 <_pipeisclosed+0x11>
  803f96:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803f9a:	75 86                	jne    803f22 <_pipeisclosed+0x11>
  803f9c:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803fa3:	00 00 00 
  803fa6:	48 8b 00             	mov    (%rax),%rax
  803fa9:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803faf:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803fb2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803fb5:	89 c6                	mov    %eax,%esi
  803fb7:	48 bf fb 51 80 00 00 	movabs $0x8051fb,%rdi
  803fbe:	00 00 00 
  803fc1:	b8 00 00 00 00       	mov    $0x0,%eax
  803fc6:	49 b8 06 06 80 00 00 	movabs $0x800606,%r8
  803fcd:	00 00 00 
  803fd0:	41 ff d0             	callq  *%r8
  803fd3:	e9 4a ff ff ff       	jmpq   803f22 <_pipeisclosed+0x11>
  803fd8:	48 83 c4 28          	add    $0x28,%rsp
  803fdc:	5b                   	pop    %rbx
  803fdd:	5d                   	pop    %rbp
  803fde:	c3                   	retq   

0000000000803fdf <pipeisclosed>:
  803fdf:	55                   	push   %rbp
  803fe0:	48 89 e5             	mov    %rsp,%rbp
  803fe3:	48 83 ec 30          	sub    $0x30,%rsp
  803fe7:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803fea:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803fee:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803ff1:	48 89 d6             	mov    %rdx,%rsi
  803ff4:	89 c7                	mov    %eax,%edi
  803ff6:	48 b8 c0 25 80 00 00 	movabs $0x8025c0,%rax
  803ffd:	00 00 00 
  804000:	ff d0                	callq  *%rax
  804002:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804005:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804009:	79 05                	jns    804010 <pipeisclosed+0x31>
  80400b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80400e:	eb 31                	jmp    804041 <pipeisclosed+0x62>
  804010:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804014:	48 89 c7             	mov    %rax,%rdi
  804017:	48 b8 fd 24 80 00 00 	movabs $0x8024fd,%rax
  80401e:	00 00 00 
  804021:	ff d0                	callq  *%rax
  804023:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804027:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80402b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80402f:	48 89 d6             	mov    %rdx,%rsi
  804032:	48 89 c7             	mov    %rax,%rdi
  804035:	48 b8 11 3f 80 00 00 	movabs $0x803f11,%rax
  80403c:	00 00 00 
  80403f:	ff d0                	callq  *%rax
  804041:	c9                   	leaveq 
  804042:	c3                   	retq   

0000000000804043 <devpipe_read>:
  804043:	55                   	push   %rbp
  804044:	48 89 e5             	mov    %rsp,%rbp
  804047:	48 83 ec 40          	sub    $0x40,%rsp
  80404b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80404f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804053:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804057:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80405b:	48 89 c7             	mov    %rax,%rdi
  80405e:	48 b8 fd 24 80 00 00 	movabs $0x8024fd,%rax
  804065:	00 00 00 
  804068:	ff d0                	callq  *%rax
  80406a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80406e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804072:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804076:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80407d:	00 
  80407e:	e9 90 00 00 00       	jmpq   804113 <devpipe_read+0xd0>
  804083:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804088:	74 09                	je     804093 <devpipe_read+0x50>
  80408a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80408e:	e9 8e 00 00 00       	jmpq   804121 <devpipe_read+0xde>
  804093:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804097:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80409b:	48 89 d6             	mov    %rdx,%rsi
  80409e:	48 89 c7             	mov    %rax,%rdi
  8040a1:	48 b8 11 3f 80 00 00 	movabs $0x803f11,%rax
  8040a8:	00 00 00 
  8040ab:	ff d0                	callq  *%rax
  8040ad:	85 c0                	test   %eax,%eax
  8040af:	74 07                	je     8040b8 <devpipe_read+0x75>
  8040b1:	b8 00 00 00 00       	mov    $0x0,%eax
  8040b6:	eb 69                	jmp    804121 <devpipe_read+0xde>
  8040b8:	48 b8 89 1a 80 00 00 	movabs $0x801a89,%rax
  8040bf:	00 00 00 
  8040c2:	ff d0                	callq  *%rax
  8040c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040c8:	8b 10                	mov    (%rax),%edx
  8040ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040ce:	8b 40 04             	mov    0x4(%rax),%eax
  8040d1:	39 c2                	cmp    %eax,%edx
  8040d3:	74 ae                	je     804083 <devpipe_read+0x40>
  8040d5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8040d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040dd:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8040e1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040e5:	8b 00                	mov    (%rax),%eax
  8040e7:	99                   	cltd   
  8040e8:	c1 ea 1b             	shr    $0x1b,%edx
  8040eb:	01 d0                	add    %edx,%eax
  8040ed:	83 e0 1f             	and    $0x1f,%eax
  8040f0:	29 d0                	sub    %edx,%eax
  8040f2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8040f6:	48 98                	cltq   
  8040f8:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8040fd:	88 01                	mov    %al,(%rcx)
  8040ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804103:	8b 00                	mov    (%rax),%eax
  804105:	8d 50 01             	lea    0x1(%rax),%edx
  804108:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80410c:	89 10                	mov    %edx,(%rax)
  80410e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804113:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804117:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80411b:	72 a7                	jb     8040c4 <devpipe_read+0x81>
  80411d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804121:	c9                   	leaveq 
  804122:	c3                   	retq   

0000000000804123 <devpipe_write>:
  804123:	55                   	push   %rbp
  804124:	48 89 e5             	mov    %rsp,%rbp
  804127:	48 83 ec 40          	sub    $0x40,%rsp
  80412b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80412f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804133:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804137:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80413b:	48 89 c7             	mov    %rax,%rdi
  80413e:	48 b8 fd 24 80 00 00 	movabs $0x8024fd,%rax
  804145:	00 00 00 
  804148:	ff d0                	callq  *%rax
  80414a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80414e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804152:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804156:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80415d:	00 
  80415e:	e9 8f 00 00 00       	jmpq   8041f2 <devpipe_write+0xcf>
  804163:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804167:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80416b:	48 89 d6             	mov    %rdx,%rsi
  80416e:	48 89 c7             	mov    %rax,%rdi
  804171:	48 b8 11 3f 80 00 00 	movabs $0x803f11,%rax
  804178:	00 00 00 
  80417b:	ff d0                	callq  *%rax
  80417d:	85 c0                	test   %eax,%eax
  80417f:	74 07                	je     804188 <devpipe_write+0x65>
  804181:	b8 00 00 00 00       	mov    $0x0,%eax
  804186:	eb 78                	jmp    804200 <devpipe_write+0xdd>
  804188:	48 b8 89 1a 80 00 00 	movabs $0x801a89,%rax
  80418f:	00 00 00 
  804192:	ff d0                	callq  *%rax
  804194:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804198:	8b 40 04             	mov    0x4(%rax),%eax
  80419b:	48 63 d0             	movslq %eax,%rdx
  80419e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041a2:	8b 00                	mov    (%rax),%eax
  8041a4:	48 98                	cltq   
  8041a6:	48 83 c0 20          	add    $0x20,%rax
  8041aa:	48 39 c2             	cmp    %rax,%rdx
  8041ad:	73 b4                	jae    804163 <devpipe_write+0x40>
  8041af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041b3:	8b 40 04             	mov    0x4(%rax),%eax
  8041b6:	99                   	cltd   
  8041b7:	c1 ea 1b             	shr    $0x1b,%edx
  8041ba:	01 d0                	add    %edx,%eax
  8041bc:	83 e0 1f             	and    $0x1f,%eax
  8041bf:	29 d0                	sub    %edx,%eax
  8041c1:	89 c6                	mov    %eax,%esi
  8041c3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8041c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041cb:	48 01 d0             	add    %rdx,%rax
  8041ce:	0f b6 08             	movzbl (%rax),%ecx
  8041d1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8041d5:	48 63 c6             	movslq %esi,%rax
  8041d8:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8041dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041e0:	8b 40 04             	mov    0x4(%rax),%eax
  8041e3:	8d 50 01             	lea    0x1(%rax),%edx
  8041e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041ea:	89 50 04             	mov    %edx,0x4(%rax)
  8041ed:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8041f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041f6:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8041fa:	72 98                	jb     804194 <devpipe_write+0x71>
  8041fc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804200:	c9                   	leaveq 
  804201:	c3                   	retq   

0000000000804202 <devpipe_stat>:
  804202:	55                   	push   %rbp
  804203:	48 89 e5             	mov    %rsp,%rbp
  804206:	48 83 ec 20          	sub    $0x20,%rsp
  80420a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80420e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804212:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804216:	48 89 c7             	mov    %rax,%rdi
  804219:	48 b8 fd 24 80 00 00 	movabs $0x8024fd,%rax
  804220:	00 00 00 
  804223:	ff d0                	callq  *%rax
  804225:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804229:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80422d:	48 be 0e 52 80 00 00 	movabs $0x80520e,%rsi
  804234:	00 00 00 
  804237:	48 89 c7             	mov    %rax,%rdi
  80423a:	48 b8 96 11 80 00 00 	movabs $0x801196,%rax
  804241:	00 00 00 
  804244:	ff d0                	callq  *%rax
  804246:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80424a:	8b 50 04             	mov    0x4(%rax),%edx
  80424d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804251:	8b 00                	mov    (%rax),%eax
  804253:	29 c2                	sub    %eax,%edx
  804255:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804259:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80425f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804263:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80426a:	00 00 00 
  80426d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804271:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  804278:	00 00 00 
  80427b:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804282:	b8 00 00 00 00       	mov    $0x0,%eax
  804287:	c9                   	leaveq 
  804288:	c3                   	retq   

0000000000804289 <devpipe_close>:
  804289:	55                   	push   %rbp
  80428a:	48 89 e5             	mov    %rsp,%rbp
  80428d:	48 83 ec 10          	sub    $0x10,%rsp
  804291:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804295:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804299:	48 89 c6             	mov    %rax,%rsi
  80429c:	bf 00 00 00 00       	mov    $0x0,%edi
  8042a1:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  8042a8:	00 00 00 
  8042ab:	ff d0                	callq  *%rax
  8042ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042b1:	48 89 c7             	mov    %rax,%rdi
  8042b4:	48 b8 fd 24 80 00 00 	movabs $0x8024fd,%rax
  8042bb:	00 00 00 
  8042be:	ff d0                	callq  *%rax
  8042c0:	48 89 c6             	mov    %rax,%rsi
  8042c3:	bf 00 00 00 00       	mov    $0x0,%edi
  8042c8:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  8042cf:	00 00 00 
  8042d2:	ff d0                	callq  *%rax
  8042d4:	c9                   	leaveq 
  8042d5:	c3                   	retq   

00000000008042d6 <cputchar>:
  8042d6:	55                   	push   %rbp
  8042d7:	48 89 e5             	mov    %rsp,%rbp
  8042da:	48 83 ec 20          	sub    $0x20,%rsp
  8042de:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8042e1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8042e4:	88 45 ff             	mov    %al,-0x1(%rbp)
  8042e7:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  8042eb:	be 01 00 00 00       	mov    $0x1,%esi
  8042f0:	48 89 c7             	mov    %rax,%rdi
  8042f3:	48 b8 7e 19 80 00 00 	movabs $0x80197e,%rax
  8042fa:	00 00 00 
  8042fd:	ff d0                	callq  *%rax
  8042ff:	90                   	nop
  804300:	c9                   	leaveq 
  804301:	c3                   	retq   

0000000000804302 <getchar>:
  804302:	55                   	push   %rbp
  804303:	48 89 e5             	mov    %rsp,%rbp
  804306:	48 83 ec 10          	sub    $0x10,%rsp
  80430a:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  80430e:	ba 01 00 00 00       	mov    $0x1,%edx
  804313:	48 89 c6             	mov    %rax,%rsi
  804316:	bf 00 00 00 00       	mov    $0x0,%edi
  80431b:	48 b8 f5 29 80 00 00 	movabs $0x8029f5,%rax
  804322:	00 00 00 
  804325:	ff d0                	callq  *%rax
  804327:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80432a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80432e:	79 05                	jns    804335 <getchar+0x33>
  804330:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804333:	eb 14                	jmp    804349 <getchar+0x47>
  804335:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804339:	7f 07                	jg     804342 <getchar+0x40>
  80433b:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804340:	eb 07                	jmp    804349 <getchar+0x47>
  804342:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804346:	0f b6 c0             	movzbl %al,%eax
  804349:	c9                   	leaveq 
  80434a:	c3                   	retq   

000000000080434b <iscons>:
  80434b:	55                   	push   %rbp
  80434c:	48 89 e5             	mov    %rsp,%rbp
  80434f:	48 83 ec 20          	sub    $0x20,%rsp
  804353:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804356:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80435a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80435d:	48 89 d6             	mov    %rdx,%rsi
  804360:	89 c7                	mov    %eax,%edi
  804362:	48 b8 c0 25 80 00 00 	movabs $0x8025c0,%rax
  804369:	00 00 00 
  80436c:	ff d0                	callq  *%rax
  80436e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804371:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804375:	79 05                	jns    80437c <iscons+0x31>
  804377:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80437a:	eb 1a                	jmp    804396 <iscons+0x4b>
  80437c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804380:	8b 10                	mov    (%rax),%edx
  804382:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  804389:	00 00 00 
  80438c:	8b 00                	mov    (%rax),%eax
  80438e:	39 c2                	cmp    %eax,%edx
  804390:	0f 94 c0             	sete   %al
  804393:	0f b6 c0             	movzbl %al,%eax
  804396:	c9                   	leaveq 
  804397:	c3                   	retq   

0000000000804398 <opencons>:
  804398:	55                   	push   %rbp
  804399:	48 89 e5             	mov    %rsp,%rbp
  80439c:	48 83 ec 10          	sub    $0x10,%rsp
  8043a0:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8043a4:	48 89 c7             	mov    %rax,%rdi
  8043a7:	48 b8 28 25 80 00 00 	movabs $0x802528,%rax
  8043ae:	00 00 00 
  8043b1:	ff d0                	callq  *%rax
  8043b3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8043b6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8043ba:	79 05                	jns    8043c1 <opencons+0x29>
  8043bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043bf:	eb 5b                	jmp    80441c <opencons+0x84>
  8043c1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043c5:	ba 07 04 00 00       	mov    $0x407,%edx
  8043ca:	48 89 c6             	mov    %rax,%rsi
  8043cd:	bf 00 00 00 00       	mov    $0x0,%edi
  8043d2:	48 b8 c6 1a 80 00 00 	movabs $0x801ac6,%rax
  8043d9:	00 00 00 
  8043dc:	ff d0                	callq  *%rax
  8043de:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8043e1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8043e5:	79 05                	jns    8043ec <opencons+0x54>
  8043e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043ea:	eb 30                	jmp    80441c <opencons+0x84>
  8043ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043f0:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  8043f7:	00 00 00 
  8043fa:	8b 12                	mov    (%rdx),%edx
  8043fc:	89 10                	mov    %edx,(%rax)
  8043fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804402:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804409:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80440d:	48 89 c7             	mov    %rax,%rdi
  804410:	48 b8 da 24 80 00 00 	movabs $0x8024da,%rax
  804417:	00 00 00 
  80441a:	ff d0                	callq  *%rax
  80441c:	c9                   	leaveq 
  80441d:	c3                   	retq   

000000000080441e <devcons_read>:
  80441e:	55                   	push   %rbp
  80441f:	48 89 e5             	mov    %rsp,%rbp
  804422:	48 83 ec 30          	sub    $0x30,%rsp
  804426:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80442a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80442e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804432:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804437:	75 13                	jne    80444c <devcons_read+0x2e>
  804439:	b8 00 00 00 00       	mov    $0x0,%eax
  80443e:	eb 49                	jmp    804489 <devcons_read+0x6b>
  804440:	48 b8 89 1a 80 00 00 	movabs $0x801a89,%rax
  804447:	00 00 00 
  80444a:	ff d0                	callq  *%rax
  80444c:	48 b8 cb 19 80 00 00 	movabs $0x8019cb,%rax
  804453:	00 00 00 
  804456:	ff d0                	callq  *%rax
  804458:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80445b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80445f:	74 df                	je     804440 <devcons_read+0x22>
  804461:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804465:	79 05                	jns    80446c <devcons_read+0x4e>
  804467:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80446a:	eb 1d                	jmp    804489 <devcons_read+0x6b>
  80446c:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804470:	75 07                	jne    804479 <devcons_read+0x5b>
  804472:	b8 00 00 00 00       	mov    $0x0,%eax
  804477:	eb 10                	jmp    804489 <devcons_read+0x6b>
  804479:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80447c:	89 c2                	mov    %eax,%edx
  80447e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804482:	88 10                	mov    %dl,(%rax)
  804484:	b8 01 00 00 00       	mov    $0x1,%eax
  804489:	c9                   	leaveq 
  80448a:	c3                   	retq   

000000000080448b <devcons_write>:
  80448b:	55                   	push   %rbp
  80448c:	48 89 e5             	mov    %rsp,%rbp
  80448f:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  804496:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  80449d:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8044a4:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8044ab:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8044b2:	eb 76                	jmp    80452a <devcons_write+0x9f>
  8044b4:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8044bb:	89 c2                	mov    %eax,%edx
  8044bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044c0:	29 c2                	sub    %eax,%edx
  8044c2:	89 d0                	mov    %edx,%eax
  8044c4:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8044c7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8044ca:	83 f8 7f             	cmp    $0x7f,%eax
  8044cd:	76 07                	jbe    8044d6 <devcons_write+0x4b>
  8044cf:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8044d6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8044d9:	48 63 d0             	movslq %eax,%rdx
  8044dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044df:	48 63 c8             	movslq %eax,%rcx
  8044e2:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8044e9:	48 01 c1             	add    %rax,%rcx
  8044ec:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8044f3:	48 89 ce             	mov    %rcx,%rsi
  8044f6:	48 89 c7             	mov    %rax,%rdi
  8044f9:	48 b8 bb 14 80 00 00 	movabs $0x8014bb,%rax
  804500:	00 00 00 
  804503:	ff d0                	callq  *%rax
  804505:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804508:	48 63 d0             	movslq %eax,%rdx
  80450b:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804512:	48 89 d6             	mov    %rdx,%rsi
  804515:	48 89 c7             	mov    %rax,%rdi
  804518:	48 b8 7e 19 80 00 00 	movabs $0x80197e,%rax
  80451f:	00 00 00 
  804522:	ff d0                	callq  *%rax
  804524:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804527:	01 45 fc             	add    %eax,-0x4(%rbp)
  80452a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80452d:	48 98                	cltq   
  80452f:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804536:	0f 82 78 ff ff ff    	jb     8044b4 <devcons_write+0x29>
  80453c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80453f:	c9                   	leaveq 
  804540:	c3                   	retq   

0000000000804541 <devcons_close>:
  804541:	55                   	push   %rbp
  804542:	48 89 e5             	mov    %rsp,%rbp
  804545:	48 83 ec 08          	sub    $0x8,%rsp
  804549:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80454d:	b8 00 00 00 00       	mov    $0x0,%eax
  804552:	c9                   	leaveq 
  804553:	c3                   	retq   

0000000000804554 <devcons_stat>:
  804554:	55                   	push   %rbp
  804555:	48 89 e5             	mov    %rsp,%rbp
  804558:	48 83 ec 10          	sub    $0x10,%rsp
  80455c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804560:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804564:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804568:	48 be 1a 52 80 00 00 	movabs $0x80521a,%rsi
  80456f:	00 00 00 
  804572:	48 89 c7             	mov    %rax,%rdi
  804575:	48 b8 96 11 80 00 00 	movabs $0x801196,%rax
  80457c:	00 00 00 
  80457f:	ff d0                	callq  *%rax
  804581:	b8 00 00 00 00       	mov    $0x0,%eax
  804586:	c9                   	leaveq 
  804587:	c3                   	retq   

0000000000804588 <set_pgfault_handler>:
  804588:	55                   	push   %rbp
  804589:	48 89 e5             	mov    %rsp,%rbp
  80458c:	48 83 ec 20          	sub    $0x20,%rsp
  804590:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804594:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80459b:	00 00 00 
  80459e:	48 8b 00             	mov    (%rax),%rax
  8045a1:	48 85 c0             	test   %rax,%rax
  8045a4:	75 6f                	jne    804615 <set_pgfault_handler+0x8d>
  8045a6:	ba 07 00 00 00       	mov    $0x7,%edx
  8045ab:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8045b0:	bf 00 00 00 00       	mov    $0x0,%edi
  8045b5:	48 b8 c6 1a 80 00 00 	movabs $0x801ac6,%rax
  8045bc:	00 00 00 
  8045bf:	ff d0                	callq  *%rax
  8045c1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8045c4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8045c8:	79 30                	jns    8045fa <set_pgfault_handler+0x72>
  8045ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045cd:	89 c1                	mov    %eax,%ecx
  8045cf:	48 ba 28 52 80 00 00 	movabs $0x805228,%rdx
  8045d6:	00 00 00 
  8045d9:	be 22 00 00 00       	mov    $0x22,%esi
  8045de:	48 bf 47 52 80 00 00 	movabs $0x805247,%rdi
  8045e5:	00 00 00 
  8045e8:	b8 00 00 00 00       	mov    $0x0,%eax
  8045ed:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  8045f4:	00 00 00 
  8045f7:	41 ff d0             	callq  *%r8
  8045fa:	48 be 29 46 80 00 00 	movabs $0x804629,%rsi
  804601:	00 00 00 
  804604:	bf 00 00 00 00       	mov    $0x0,%edi
  804609:	48 b8 5d 1c 80 00 00 	movabs $0x801c5d,%rax
  804610:	00 00 00 
  804613:	ff d0                	callq  *%rax
  804615:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80461c:	00 00 00 
  80461f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804623:	48 89 10             	mov    %rdx,(%rax)
  804626:	90                   	nop
  804627:	c9                   	leaveq 
  804628:	c3                   	retq   

0000000000804629 <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  804629:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  80462c:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  804633:	00 00 00 
call *%rax
  804636:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  804638:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  80463f:	00 08 
    movq 152(%rsp), %rax
  804641:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  804648:	00 
    movq 136(%rsp), %rbx
  804649:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  804650:	00 
movq %rbx, (%rax)
  804651:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804654:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  804658:	4c 8b 3c 24          	mov    (%rsp),%r15
  80465c:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  804661:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  804666:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  80466b:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  804670:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  804675:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  80467a:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  80467f:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  804684:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  804689:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  80468e:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  804693:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  804698:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  80469d:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  8046a2:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  8046a6:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  8046aa:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  8046ab:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  8046b0:	c3                   	retq   

00000000008046b1 <ipc_recv>:
  8046b1:	55                   	push   %rbp
  8046b2:	48 89 e5             	mov    %rsp,%rbp
  8046b5:	48 83 ec 30          	sub    $0x30,%rsp
  8046b9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8046bd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8046c1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8046c5:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8046ca:	75 0e                	jne    8046da <ipc_recv+0x29>
  8046cc:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8046d3:	00 00 00 
  8046d6:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8046da:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046de:	48 89 c7             	mov    %rax,%rdi
  8046e1:	48 b8 00 1d 80 00 00 	movabs $0x801d00,%rax
  8046e8:	00 00 00 
  8046eb:	ff d0                	callq  *%rax
  8046ed:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046f0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046f4:	79 27                	jns    80471d <ipc_recv+0x6c>
  8046f6:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8046fb:	74 0a                	je     804707 <ipc_recv+0x56>
  8046fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804701:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804707:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80470c:	74 0a                	je     804718 <ipc_recv+0x67>
  80470e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804712:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804718:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80471b:	eb 53                	jmp    804770 <ipc_recv+0xbf>
  80471d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804722:	74 19                	je     80473d <ipc_recv+0x8c>
  804724:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80472b:	00 00 00 
  80472e:	48 8b 00             	mov    (%rax),%rax
  804731:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804737:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80473b:	89 10                	mov    %edx,(%rax)
  80473d:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804742:	74 19                	je     80475d <ipc_recv+0xac>
  804744:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80474b:	00 00 00 
  80474e:	48 8b 00             	mov    (%rax),%rax
  804751:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804757:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80475b:	89 10                	mov    %edx,(%rax)
  80475d:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804764:	00 00 00 
  804767:	48 8b 00             	mov    (%rax),%rax
  80476a:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804770:	c9                   	leaveq 
  804771:	c3                   	retq   

0000000000804772 <ipc_send>:
  804772:	55                   	push   %rbp
  804773:	48 89 e5             	mov    %rsp,%rbp
  804776:	48 83 ec 30          	sub    $0x30,%rsp
  80477a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80477d:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804780:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804784:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804787:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80478c:	75 1c                	jne    8047aa <ipc_send+0x38>
  80478e:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804795:	00 00 00 
  804798:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80479c:	eb 0c                	jmp    8047aa <ipc_send+0x38>
  80479e:	48 b8 89 1a 80 00 00 	movabs $0x801a89,%rax
  8047a5:	00 00 00 
  8047a8:	ff d0                	callq  *%rax
  8047aa:	8b 75 e8             	mov    -0x18(%rbp),%esi
  8047ad:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8047b0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8047b4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8047b7:	89 c7                	mov    %eax,%edi
  8047b9:	48 b8 a9 1c 80 00 00 	movabs $0x801ca9,%rax
  8047c0:	00 00 00 
  8047c3:	ff d0                	callq  *%rax
  8047c5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8047c8:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8047cc:	74 d0                	je     80479e <ipc_send+0x2c>
  8047ce:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8047d2:	79 30                	jns    804804 <ipc_send+0x92>
  8047d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047d7:	89 c1                	mov    %eax,%ecx
  8047d9:	48 ba 58 52 80 00 00 	movabs $0x805258,%rdx
  8047e0:	00 00 00 
  8047e3:	be 44 00 00 00       	mov    $0x44,%esi
  8047e8:	48 bf 6e 52 80 00 00 	movabs $0x80526e,%rdi
  8047ef:	00 00 00 
  8047f2:	b8 00 00 00 00       	mov    $0x0,%eax
  8047f7:	49 b8 cc 03 80 00 00 	movabs $0x8003cc,%r8
  8047fe:	00 00 00 
  804801:	41 ff d0             	callq  *%r8
  804804:	90                   	nop
  804805:	c9                   	leaveq 
  804806:	c3                   	retq   

0000000000804807 <ipc_host_recv>:
  804807:	55                   	push   %rbp
  804808:	48 89 e5             	mov    %rsp,%rbp
  80480b:	48 83 ec 10          	sub    $0x10,%rsp
  80480f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804813:	48 ba 80 52 80 00 00 	movabs $0x805280,%rdx
  80481a:	00 00 00 
  80481d:	be 4e 00 00 00       	mov    $0x4e,%esi
  804822:	48 bf 6e 52 80 00 00 	movabs $0x80526e,%rdi
  804829:	00 00 00 
  80482c:	b8 00 00 00 00       	mov    $0x0,%eax
  804831:	48 b9 cc 03 80 00 00 	movabs $0x8003cc,%rcx
  804838:	00 00 00 
  80483b:	ff d1                	callq  *%rcx

000000000080483d <ipc_host_send>:
  80483d:	55                   	push   %rbp
  80483e:	48 89 e5             	mov    %rsp,%rbp
  804841:	48 83 ec 20          	sub    $0x20,%rsp
  804845:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804848:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80484b:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  80484f:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804852:	48 ba a0 52 80 00 00 	movabs $0x8052a0,%rdx
  804859:	00 00 00 
  80485c:	be 58 00 00 00       	mov    $0x58,%esi
  804861:	48 bf 6e 52 80 00 00 	movabs $0x80526e,%rdi
  804868:	00 00 00 
  80486b:	b8 00 00 00 00       	mov    $0x0,%eax
  804870:	48 b9 cc 03 80 00 00 	movabs $0x8003cc,%rcx
  804877:	00 00 00 
  80487a:	ff d1                	callq  *%rcx

000000000080487c <ipc_find_env>:
  80487c:	55                   	push   %rbp
  80487d:	48 89 e5             	mov    %rsp,%rbp
  804880:	48 83 ec 18          	sub    $0x18,%rsp
  804884:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804887:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80488e:	eb 4d                	jmp    8048dd <ipc_find_env+0x61>
  804890:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804897:	00 00 00 
  80489a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80489d:	48 98                	cltq   
  80489f:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8048a6:	48 01 d0             	add    %rdx,%rax
  8048a9:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8048af:	8b 00                	mov    (%rax),%eax
  8048b1:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8048b4:	75 23                	jne    8048d9 <ipc_find_env+0x5d>
  8048b6:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8048bd:	00 00 00 
  8048c0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048c3:	48 98                	cltq   
  8048c5:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8048cc:	48 01 d0             	add    %rdx,%rax
  8048cf:	48 05 c8 00 00 00    	add    $0xc8,%rax
  8048d5:	8b 00                	mov    (%rax),%eax
  8048d7:	eb 12                	jmp    8048eb <ipc_find_env+0x6f>
  8048d9:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8048dd:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  8048e4:	7e aa                	jle    804890 <ipc_find_env+0x14>
  8048e6:	b8 00 00 00 00       	mov    $0x0,%eax
  8048eb:	c9                   	leaveq 
  8048ec:	c3                   	retq   

00000000008048ed <pageref>:
  8048ed:	55                   	push   %rbp
  8048ee:	48 89 e5             	mov    %rsp,%rbp
  8048f1:	48 83 ec 18          	sub    $0x18,%rsp
  8048f5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8048f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048fd:	48 c1 e8 15          	shr    $0x15,%rax
  804901:	48 89 c2             	mov    %rax,%rdx
  804904:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80490b:	01 00 00 
  80490e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804912:	83 e0 01             	and    $0x1,%eax
  804915:	48 85 c0             	test   %rax,%rax
  804918:	75 07                	jne    804921 <pageref+0x34>
  80491a:	b8 00 00 00 00       	mov    $0x0,%eax
  80491f:	eb 56                	jmp    804977 <pageref+0x8a>
  804921:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804925:	48 c1 e8 0c          	shr    $0xc,%rax
  804929:	48 89 c2             	mov    %rax,%rdx
  80492c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804933:	01 00 00 
  804936:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80493a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80493e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804942:	83 e0 01             	and    $0x1,%eax
  804945:	48 85 c0             	test   %rax,%rax
  804948:	75 07                	jne    804951 <pageref+0x64>
  80494a:	b8 00 00 00 00       	mov    $0x0,%eax
  80494f:	eb 26                	jmp    804977 <pageref+0x8a>
  804951:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804955:	48 c1 e8 0c          	shr    $0xc,%rax
  804959:	48 89 c2             	mov    %rax,%rdx
  80495c:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804963:	00 00 00 
  804966:	48 c1 e2 04          	shl    $0x4,%rdx
  80496a:	48 01 d0             	add    %rdx,%rax
  80496d:	48 83 c0 08          	add    $0x8,%rax
  804971:	0f b7 00             	movzwl (%rax),%eax
  804974:	0f b7 c0             	movzwl %ax,%eax
  804977:	c9                   	leaveq 
  804978:	c3                   	retq   
