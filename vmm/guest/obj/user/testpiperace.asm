
vmm/guest/obj/user/testpiperace:     file format elf64-x86-64


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
  80003c:	e8 45 03 00 00       	callq  800386 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 40          	sub    $0x40,%rsp
  80004b:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80004e:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  800052:	48 bf e0 49 80 00 00 	movabs $0x8049e0,%rdi
  800059:	00 00 00 
  80005c:	b8 00 00 00 00       	mov    $0x0,%eax
  800061:	48 ba 68 06 80 00 00 	movabs $0x800668,%rdx
  800068:	00 00 00 
  80006b:	ff d2                	callq  *%rdx
  80006d:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  800071:	48 89 c7             	mov    %rax,%rdi
  800074:	48 b8 45 40 80 00 00 	movabs $0x804045,%rax
  80007b:	00 00 00 
  80007e:	ff d0                	callq  *%rax
  800080:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800083:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800087:	79 30                	jns    8000b9 <umain+0x76>
  800089:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80008c:	89 c1                	mov    %eax,%ecx
  80008e:	48 ba f9 49 80 00 00 	movabs $0x8049f9,%rdx
  800095:	00 00 00 
  800098:	be 0e 00 00 00       	mov    $0xe,%esi
  80009d:	48 bf 02 4a 80 00 00 	movabs $0x804a02,%rdi
  8000a4:	00 00 00 
  8000a7:	b8 00 00 00 00       	mov    $0x0,%eax
  8000ac:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  8000b3:	00 00 00 
  8000b6:	41 ff d0             	callq  *%r8
  8000b9:	c7 45 f4 c8 00 00 00 	movl   $0xc8,-0xc(%rbp)
  8000c0:	48 b8 c5 22 80 00 00 	movabs $0x8022c5,%rax
  8000c7:	00 00 00 
  8000ca:	ff d0                	callq  *%rax
  8000cc:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8000cf:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000d3:	79 30                	jns    800105 <umain+0xc2>
  8000d5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000d8:	89 c1                	mov    %eax,%ecx
  8000da:	48 ba 19 4a 80 00 00 	movabs $0x804a19,%rdx
  8000e1:	00 00 00 
  8000e4:	be 11 00 00 00       	mov    $0x11,%esi
  8000e9:	48 bf 02 4a 80 00 00 	movabs $0x804a02,%rdi
  8000f0:	00 00 00 
  8000f3:	b8 00 00 00 00       	mov    $0x0,%eax
  8000f8:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  8000ff:	00 00 00 
  800102:	41 ff d0             	callq  *%r8
  800105:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800109:	0f 85 89 00 00 00    	jne    800198 <umain+0x155>
  80010f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800112:	89 c7                	mov    %eax,%edi
  800114:	48 b8 70 2a 80 00 00 	movabs $0x802a70,%rax
  80011b:	00 00 00 
  80011e:	ff d0                	callq  *%rax
  800120:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800127:	eb 4c                	jmp    800175 <umain+0x132>
  800129:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80012c:	89 c7                	mov    %eax,%edi
  80012e:	48 b8 09 43 80 00 00 	movabs $0x804309,%rax
  800135:	00 00 00 
  800138:	ff d0                	callq  *%rax
  80013a:	85 c0                	test   %eax,%eax
  80013c:	74 27                	je     800165 <umain+0x122>
  80013e:	48 bf 22 4a 80 00 00 	movabs $0x804a22,%rdi
  800145:	00 00 00 
  800148:	b8 00 00 00 00       	mov    $0x0,%eax
  80014d:	48 ba 68 06 80 00 00 	movabs $0x800668,%rdx
  800154:	00 00 00 
  800157:	ff d2                	callq  *%rdx
  800159:	48 b8 0a 04 80 00 00 	movabs $0x80040a,%rax
  800160:	00 00 00 
  800163:	ff d0                	callq  *%rax
  800165:	48 b8 eb 1a 80 00 00 	movabs $0x801aeb,%rax
  80016c:	00 00 00 
  80016f:	ff d0                	callq  *%rax
  800171:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800175:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800178:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  80017b:	7c ac                	jl     800129 <umain+0xe6>
  80017d:	ba 00 00 00 00       	mov    $0x0,%edx
  800182:	be 00 00 00 00       	mov    $0x0,%esi
  800187:	bf 00 00 00 00       	mov    $0x0,%edi
  80018c:	48 b8 3c 25 80 00 00 	movabs $0x80253c,%rax
  800193:	00 00 00 
  800196:	ff d0                	callq  *%rax
  800198:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80019b:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80019e:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8001a1:	89 c6                	mov    %eax,%esi
  8001a3:	48 bf 3d 4a 80 00 00 	movabs $0x804a3d,%rdi
  8001aa:	00 00 00 
  8001ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8001b2:	48 ba 68 06 80 00 00 	movabs $0x800668,%rdx
  8001b9:	00 00 00 
  8001bc:	ff d2                	callq  *%rdx
  8001be:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  8001c5:	00 
  8001c6:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8001c9:	25 ff 03 00 00       	and    $0x3ff,%eax
  8001ce:	48 98                	cltq   
  8001d0:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8001d7:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8001de:	00 00 00 
  8001e1:	48 01 d0             	add    %rdx,%rax
  8001e4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8001e8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8001ec:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8001f3:	00 00 00 
  8001f6:	48 29 c2             	sub    %rax,%rdx
  8001f9:	48 89 d0             	mov    %rdx,%rax
  8001fc:	48 c1 f8 03          	sar    $0x3,%rax
  800200:	48 89 c2             	mov    %rax,%rdx
  800203:	48 b8 a5 4f fa a4 4f 	movabs $0x4fa4fa4fa4fa4fa5,%rax
  80020a:	fa a4 4f 
  80020d:	48 0f af c2          	imul   %rdx,%rax
  800211:	48 89 c6             	mov    %rax,%rsi
  800214:	48 bf 48 4a 80 00 00 	movabs $0x804a48,%rdi
  80021b:	00 00 00 
  80021e:	b8 00 00 00 00       	mov    $0x0,%eax
  800223:	48 ba 68 06 80 00 00 	movabs $0x800668,%rdx
  80022a:	00 00 00 
  80022d:	ff d2                	callq  *%rdx
  80022f:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800232:	be 0a 00 00 00       	mov    $0xa,%esi
  800237:	89 c7                	mov    %eax,%edi
  800239:	48 b8 ea 2a 80 00 00 	movabs $0x802aea,%rax
  800240:	00 00 00 
  800243:	ff d0                	callq  *%rax
  800245:	eb 16                	jmp    80025d <umain+0x21a>
  800247:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80024a:	be 0a 00 00 00       	mov    $0xa,%esi
  80024f:	89 c7                	mov    %eax,%edi
  800251:	48 b8 ea 2a 80 00 00 	movabs $0x802aea,%rax
  800258:	00 00 00 
  80025b:	ff d0                	callq  *%rax
  80025d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800261:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  800267:	83 f8 02             	cmp    $0x2,%eax
  80026a:	74 db                	je     800247 <umain+0x204>
  80026c:	48 bf 53 4a 80 00 00 	movabs $0x804a53,%rdi
  800273:	00 00 00 
  800276:	b8 00 00 00 00       	mov    $0x0,%eax
  80027b:	48 ba 68 06 80 00 00 	movabs $0x800668,%rdx
  800282:	00 00 00 
  800285:	ff d2                	callq  *%rdx
  800287:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80028a:	89 c7                	mov    %eax,%edi
  80028c:	48 b8 09 43 80 00 00 	movabs $0x804309,%rax
  800293:	00 00 00 
  800296:	ff d0                	callq  *%rax
  800298:	85 c0                	test   %eax,%eax
  80029a:	74 2a                	je     8002c6 <umain+0x283>
  80029c:	48 ba 70 4a 80 00 00 	movabs $0x804a70,%rdx
  8002a3:	00 00 00 
  8002a6:	be 3b 00 00 00       	mov    $0x3b,%esi
  8002ab:	48 bf 02 4a 80 00 00 	movabs $0x804a02,%rdi
  8002b2:	00 00 00 
  8002b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8002ba:	48 b9 2e 04 80 00 00 	movabs $0x80042e,%rcx
  8002c1:	00 00 00 
  8002c4:	ff d1                	callq  *%rcx
  8002c6:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8002c9:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
  8002cd:	48 89 d6             	mov    %rdx,%rsi
  8002d0:	89 c7                	mov    %eax,%edi
  8002d2:	48 b8 5e 28 80 00 00 	movabs $0x80285e,%rax
  8002d9:	00 00 00 
  8002dc:	ff d0                	callq  *%rax
  8002de:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8002e1:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8002e5:	79 30                	jns    800317 <umain+0x2d4>
  8002e7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8002ea:	89 c1                	mov    %eax,%ecx
  8002ec:	48 ba 9a 4a 80 00 00 	movabs $0x804a9a,%rdx
  8002f3:	00 00 00 
  8002f6:	be 3d 00 00 00       	mov    $0x3d,%esi
  8002fb:	48 bf 02 4a 80 00 00 	movabs $0x804a02,%rdi
  800302:	00 00 00 
  800305:	b8 00 00 00 00       	mov    $0x0,%eax
  80030a:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  800311:	00 00 00 
  800314:	41 ff d0             	callq  *%r8
  800317:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80031b:	48 89 c7             	mov    %rax,%rdi
  80031e:	48 b8 9b 27 80 00 00 	movabs $0x80279b,%rax
  800325:	00 00 00 
  800328:	ff d0                	callq  *%rax
  80032a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80032e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800332:	48 89 c7             	mov    %rax,%rdi
  800335:	48 b8 ab 37 80 00 00 	movabs $0x8037ab,%rax
  80033c:	00 00 00 
  80033f:	ff d0                	callq  *%rax
  800341:	83 f8 04             	cmp    $0x4,%eax
  800344:	74 1d                	je     800363 <umain+0x320>
  800346:	48 bf b2 4a 80 00 00 	movabs $0x804ab2,%rdi
  80034d:	00 00 00 
  800350:	b8 00 00 00 00       	mov    $0x0,%eax
  800355:	48 ba 68 06 80 00 00 	movabs $0x800668,%rdx
  80035c:	00 00 00 
  80035f:	ff d2                	callq  *%rdx
  800361:	eb 20                	jmp    800383 <umain+0x340>
  800363:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800366:	89 c6                	mov    %eax,%esi
  800368:	48 bf c8 4a 80 00 00 	movabs $0x804ac8,%rdi
  80036f:	00 00 00 
  800372:	b8 00 00 00 00       	mov    $0x0,%eax
  800377:	48 ba 68 06 80 00 00 	movabs $0x800668,%rdx
  80037e:	00 00 00 
  800381:	ff d2                	callq  *%rdx
  800383:	90                   	nop
  800384:	c9                   	leaveq 
  800385:	c3                   	retq   

0000000000800386 <libmain>:
  800386:	55                   	push   %rbp
  800387:	48 89 e5             	mov    %rsp,%rbp
  80038a:	48 83 ec 10          	sub    $0x10,%rsp
  80038e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800391:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800395:	48 b8 af 1a 80 00 00 	movabs $0x801aaf,%rax
  80039c:	00 00 00 
  80039f:	ff d0                	callq  *%rax
  8003a1:	25 ff 03 00 00       	and    $0x3ff,%eax
  8003a6:	48 98                	cltq   
  8003a8:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8003af:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8003b6:	00 00 00 
  8003b9:	48 01 c2             	add    %rax,%rdx
  8003bc:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8003c3:	00 00 00 
  8003c6:	48 89 10             	mov    %rdx,(%rax)
  8003c9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8003cd:	7e 14                	jle    8003e3 <libmain+0x5d>
  8003cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003d3:	48 8b 10             	mov    (%rax),%rdx
  8003d6:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8003dd:	00 00 00 
  8003e0:	48 89 10             	mov    %rdx,(%rax)
  8003e3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003ea:	48 89 d6             	mov    %rdx,%rsi
  8003ed:	89 c7                	mov    %eax,%edi
  8003ef:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8003f6:	00 00 00 
  8003f9:	ff d0                	callq  *%rax
  8003fb:	48 b8 0a 04 80 00 00 	movabs $0x80040a,%rax
  800402:	00 00 00 
  800405:	ff d0                	callq  *%rax
  800407:	90                   	nop
  800408:	c9                   	leaveq 
  800409:	c3                   	retq   

000000000080040a <exit>:
  80040a:	55                   	push   %rbp
  80040b:	48 89 e5             	mov    %rsp,%rbp
  80040e:	48 b8 bb 2a 80 00 00 	movabs $0x802abb,%rax
  800415:	00 00 00 
  800418:	ff d0                	callq  *%rax
  80041a:	bf 00 00 00 00       	mov    $0x0,%edi
  80041f:	48 b8 69 1a 80 00 00 	movabs $0x801a69,%rax
  800426:	00 00 00 
  800429:	ff d0                	callq  *%rax
  80042b:	90                   	nop
  80042c:	5d                   	pop    %rbp
  80042d:	c3                   	retq   

000000000080042e <_panic>:
  80042e:	55                   	push   %rbp
  80042f:	48 89 e5             	mov    %rsp,%rbp
  800432:	53                   	push   %rbx
  800433:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80043a:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800441:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800447:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  80044e:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800455:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  80045c:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800463:	84 c0                	test   %al,%al
  800465:	74 23                	je     80048a <_panic+0x5c>
  800467:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  80046e:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800472:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800476:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80047a:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  80047e:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800482:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800486:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80048a:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800491:	00 00 00 
  800494:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80049b:	00 00 00 
  80049e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8004a2:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8004a9:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8004b0:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8004b7:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8004be:	00 00 00 
  8004c1:	48 8b 18             	mov    (%rax),%rbx
  8004c4:	48 b8 af 1a 80 00 00 	movabs $0x801aaf,%rax
  8004cb:	00 00 00 
  8004ce:	ff d0                	callq  *%rax
  8004d0:	89 c6                	mov    %eax,%esi
  8004d2:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  8004d8:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  8004df:	41 89 d0             	mov    %edx,%r8d
  8004e2:	48 89 c1             	mov    %rax,%rcx
  8004e5:	48 89 da             	mov    %rbx,%rdx
  8004e8:	48 bf e8 4a 80 00 00 	movabs $0x804ae8,%rdi
  8004ef:	00 00 00 
  8004f2:	b8 00 00 00 00       	mov    $0x0,%eax
  8004f7:	49 b9 68 06 80 00 00 	movabs $0x800668,%r9
  8004fe:	00 00 00 
  800501:	41 ff d1             	callq  *%r9
  800504:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  80050b:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800512:	48 89 d6             	mov    %rdx,%rsi
  800515:	48 89 c7             	mov    %rax,%rdi
  800518:	48 b8 bc 05 80 00 00 	movabs $0x8005bc,%rax
  80051f:	00 00 00 
  800522:	ff d0                	callq  *%rax
  800524:	48 bf 0b 4b 80 00 00 	movabs $0x804b0b,%rdi
  80052b:	00 00 00 
  80052e:	b8 00 00 00 00       	mov    $0x0,%eax
  800533:	48 ba 68 06 80 00 00 	movabs $0x800668,%rdx
  80053a:	00 00 00 
  80053d:	ff d2                	callq  *%rdx
  80053f:	cc                   	int3   
  800540:	eb fd                	jmp    80053f <_panic+0x111>

0000000000800542 <putch>:
  800542:	55                   	push   %rbp
  800543:	48 89 e5             	mov    %rsp,%rbp
  800546:	48 83 ec 10          	sub    $0x10,%rsp
  80054a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80054d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800551:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800555:	8b 00                	mov    (%rax),%eax
  800557:	8d 48 01             	lea    0x1(%rax),%ecx
  80055a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80055e:	89 0a                	mov    %ecx,(%rdx)
  800560:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800563:	89 d1                	mov    %edx,%ecx
  800565:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800569:	48 98                	cltq   
  80056b:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80056f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800573:	8b 00                	mov    (%rax),%eax
  800575:	3d ff 00 00 00       	cmp    $0xff,%eax
  80057a:	75 2c                	jne    8005a8 <putch+0x66>
  80057c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800580:	8b 00                	mov    (%rax),%eax
  800582:	48 98                	cltq   
  800584:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800588:	48 83 c2 08          	add    $0x8,%rdx
  80058c:	48 89 c6             	mov    %rax,%rsi
  80058f:	48 89 d7             	mov    %rdx,%rdi
  800592:	48 b8 e0 19 80 00 00 	movabs $0x8019e0,%rax
  800599:	00 00 00 
  80059c:	ff d0                	callq  *%rax
  80059e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005a2:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8005a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005ac:	8b 40 04             	mov    0x4(%rax),%eax
  8005af:	8d 50 01             	lea    0x1(%rax),%edx
  8005b2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005b6:	89 50 04             	mov    %edx,0x4(%rax)
  8005b9:	90                   	nop
  8005ba:	c9                   	leaveq 
  8005bb:	c3                   	retq   

00000000008005bc <vcprintf>:
  8005bc:	55                   	push   %rbp
  8005bd:	48 89 e5             	mov    %rsp,%rbp
  8005c0:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8005c7:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8005ce:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8005d5:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8005dc:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8005e3:	48 8b 0a             	mov    (%rdx),%rcx
  8005e6:	48 89 08             	mov    %rcx,(%rax)
  8005e9:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8005ed:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8005f1:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8005f5:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8005f9:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800600:	00 00 00 
  800603:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80060a:	00 00 00 
  80060d:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800614:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80061b:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800622:	48 89 c6             	mov    %rax,%rsi
  800625:	48 bf 42 05 80 00 00 	movabs $0x800542,%rdi
  80062c:	00 00 00 
  80062f:	48 b8 06 0a 80 00 00 	movabs $0x800a06,%rax
  800636:	00 00 00 
  800639:	ff d0                	callq  *%rax
  80063b:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800641:	48 98                	cltq   
  800643:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80064a:	48 83 c2 08          	add    $0x8,%rdx
  80064e:	48 89 c6             	mov    %rax,%rsi
  800651:	48 89 d7             	mov    %rdx,%rdi
  800654:	48 b8 e0 19 80 00 00 	movabs $0x8019e0,%rax
  80065b:	00 00 00 
  80065e:	ff d0                	callq  *%rax
  800660:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800666:	c9                   	leaveq 
  800667:	c3                   	retq   

0000000000800668 <cprintf>:
  800668:	55                   	push   %rbp
  800669:	48 89 e5             	mov    %rsp,%rbp
  80066c:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800673:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80067a:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800681:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800688:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80068f:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800696:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80069d:	84 c0                	test   %al,%al
  80069f:	74 20                	je     8006c1 <cprintf+0x59>
  8006a1:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8006a5:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8006a9:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8006ad:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8006b1:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8006b5:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8006b9:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8006bd:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8006c1:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8006c8:	00 00 00 
  8006cb:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8006d2:	00 00 00 
  8006d5:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8006d9:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8006e0:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8006e7:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8006ee:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8006f5:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8006fc:	48 8b 0a             	mov    (%rdx),%rcx
  8006ff:	48 89 08             	mov    %rcx,(%rax)
  800702:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800706:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80070a:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80070e:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800712:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800719:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800720:	48 89 d6             	mov    %rdx,%rsi
  800723:	48 89 c7             	mov    %rax,%rdi
  800726:	48 b8 bc 05 80 00 00 	movabs $0x8005bc,%rax
  80072d:	00 00 00 
  800730:	ff d0                	callq  *%rax
  800732:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800738:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80073e:	c9                   	leaveq 
  80073f:	c3                   	retq   

0000000000800740 <printnum>:
  800740:	55                   	push   %rbp
  800741:	48 89 e5             	mov    %rsp,%rbp
  800744:	48 83 ec 30          	sub    $0x30,%rsp
  800748:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80074c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800750:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800754:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  800757:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  80075b:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  80075f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800762:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  800766:	77 54                	ja     8007bc <printnum+0x7c>
  800768:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80076b:	8d 78 ff             	lea    -0x1(%rax),%edi
  80076e:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800771:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800775:	ba 00 00 00 00       	mov    $0x0,%edx
  80077a:	48 f7 f6             	div    %rsi
  80077d:	49 89 c2             	mov    %rax,%r10
  800780:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800783:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  800786:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80078a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80078e:	41 89 c9             	mov    %ecx,%r9d
  800791:	41 89 f8             	mov    %edi,%r8d
  800794:	89 d1                	mov    %edx,%ecx
  800796:	4c 89 d2             	mov    %r10,%rdx
  800799:	48 89 c7             	mov    %rax,%rdi
  80079c:	48 b8 40 07 80 00 00 	movabs $0x800740,%rax
  8007a3:	00 00 00 
  8007a6:	ff d0                	callq  *%rax
  8007a8:	eb 1c                	jmp    8007c6 <printnum+0x86>
  8007aa:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8007ae:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8007b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8007b5:	48 89 ce             	mov    %rcx,%rsi
  8007b8:	89 d7                	mov    %edx,%edi
  8007ba:	ff d0                	callq  *%rax
  8007bc:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  8007c0:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  8007c4:	7f e4                	jg     8007aa <printnum+0x6a>
  8007c6:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8007c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007cd:	ba 00 00 00 00       	mov    $0x0,%edx
  8007d2:	48 f7 f1             	div    %rcx
  8007d5:	48 b8 10 4d 80 00 00 	movabs $0x804d10,%rax
  8007dc:	00 00 00 
  8007df:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  8007e3:	0f be d0             	movsbl %al,%edx
  8007e6:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8007ea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8007ee:	48 89 ce             	mov    %rcx,%rsi
  8007f1:	89 d7                	mov    %edx,%edi
  8007f3:	ff d0                	callq  *%rax
  8007f5:	90                   	nop
  8007f6:	c9                   	leaveq 
  8007f7:	c3                   	retq   

00000000008007f8 <getuint>:
  8007f8:	55                   	push   %rbp
  8007f9:	48 89 e5             	mov    %rsp,%rbp
  8007fc:	48 83 ec 20          	sub    $0x20,%rsp
  800800:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800804:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800807:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80080b:	7e 4f                	jle    80085c <getuint+0x64>
  80080d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800811:	8b 00                	mov    (%rax),%eax
  800813:	83 f8 30             	cmp    $0x30,%eax
  800816:	73 24                	jae    80083c <getuint+0x44>
  800818:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80081c:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800820:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800824:	8b 00                	mov    (%rax),%eax
  800826:	89 c0                	mov    %eax,%eax
  800828:	48 01 d0             	add    %rdx,%rax
  80082b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80082f:	8b 12                	mov    (%rdx),%edx
  800831:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800834:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800838:	89 0a                	mov    %ecx,(%rdx)
  80083a:	eb 14                	jmp    800850 <getuint+0x58>
  80083c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800840:	48 8b 40 08          	mov    0x8(%rax),%rax
  800844:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800848:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80084c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800850:	48 8b 00             	mov    (%rax),%rax
  800853:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800857:	e9 9d 00 00 00       	jmpq   8008f9 <getuint+0x101>
  80085c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800860:	74 4c                	je     8008ae <getuint+0xb6>
  800862:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800866:	8b 00                	mov    (%rax),%eax
  800868:	83 f8 30             	cmp    $0x30,%eax
  80086b:	73 24                	jae    800891 <getuint+0x99>
  80086d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800871:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800875:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800879:	8b 00                	mov    (%rax),%eax
  80087b:	89 c0                	mov    %eax,%eax
  80087d:	48 01 d0             	add    %rdx,%rax
  800880:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800884:	8b 12                	mov    (%rdx),%edx
  800886:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800889:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80088d:	89 0a                	mov    %ecx,(%rdx)
  80088f:	eb 14                	jmp    8008a5 <getuint+0xad>
  800891:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800895:	48 8b 40 08          	mov    0x8(%rax),%rax
  800899:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80089d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008a1:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008a5:	48 8b 00             	mov    (%rax),%rax
  8008a8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008ac:	eb 4b                	jmp    8008f9 <getuint+0x101>
  8008ae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008b2:	8b 00                	mov    (%rax),%eax
  8008b4:	83 f8 30             	cmp    $0x30,%eax
  8008b7:	73 24                	jae    8008dd <getuint+0xe5>
  8008b9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008bd:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008c5:	8b 00                	mov    (%rax),%eax
  8008c7:	89 c0                	mov    %eax,%eax
  8008c9:	48 01 d0             	add    %rdx,%rax
  8008cc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008d0:	8b 12                	mov    (%rdx),%edx
  8008d2:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008d5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008d9:	89 0a                	mov    %ecx,(%rdx)
  8008db:	eb 14                	jmp    8008f1 <getuint+0xf9>
  8008dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008e1:	48 8b 40 08          	mov    0x8(%rax),%rax
  8008e5:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8008e9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008ed:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008f1:	8b 00                	mov    (%rax),%eax
  8008f3:	89 c0                	mov    %eax,%eax
  8008f5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008f9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8008fd:	c9                   	leaveq 
  8008fe:	c3                   	retq   

00000000008008ff <getint>:
  8008ff:	55                   	push   %rbp
  800900:	48 89 e5             	mov    %rsp,%rbp
  800903:	48 83 ec 20          	sub    $0x20,%rsp
  800907:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80090b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80090e:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800912:	7e 4f                	jle    800963 <getint+0x64>
  800914:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800918:	8b 00                	mov    (%rax),%eax
  80091a:	83 f8 30             	cmp    $0x30,%eax
  80091d:	73 24                	jae    800943 <getint+0x44>
  80091f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800923:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800927:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80092b:	8b 00                	mov    (%rax),%eax
  80092d:	89 c0                	mov    %eax,%eax
  80092f:	48 01 d0             	add    %rdx,%rax
  800932:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800936:	8b 12                	mov    (%rdx),%edx
  800938:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80093b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80093f:	89 0a                	mov    %ecx,(%rdx)
  800941:	eb 14                	jmp    800957 <getint+0x58>
  800943:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800947:	48 8b 40 08          	mov    0x8(%rax),%rax
  80094b:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80094f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800953:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800957:	48 8b 00             	mov    (%rax),%rax
  80095a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80095e:	e9 9d 00 00 00       	jmpq   800a00 <getint+0x101>
  800963:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800967:	74 4c                	je     8009b5 <getint+0xb6>
  800969:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80096d:	8b 00                	mov    (%rax),%eax
  80096f:	83 f8 30             	cmp    $0x30,%eax
  800972:	73 24                	jae    800998 <getint+0x99>
  800974:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800978:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80097c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800980:	8b 00                	mov    (%rax),%eax
  800982:	89 c0                	mov    %eax,%eax
  800984:	48 01 d0             	add    %rdx,%rax
  800987:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80098b:	8b 12                	mov    (%rdx),%edx
  80098d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800990:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800994:	89 0a                	mov    %ecx,(%rdx)
  800996:	eb 14                	jmp    8009ac <getint+0xad>
  800998:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80099c:	48 8b 40 08          	mov    0x8(%rax),%rax
  8009a0:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8009a4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009a8:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009ac:	48 8b 00             	mov    (%rax),%rax
  8009af:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8009b3:	eb 4b                	jmp    800a00 <getint+0x101>
  8009b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009b9:	8b 00                	mov    (%rax),%eax
  8009bb:	83 f8 30             	cmp    $0x30,%eax
  8009be:	73 24                	jae    8009e4 <getint+0xe5>
  8009c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009c4:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8009c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009cc:	8b 00                	mov    (%rax),%eax
  8009ce:	89 c0                	mov    %eax,%eax
  8009d0:	48 01 d0             	add    %rdx,%rax
  8009d3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009d7:	8b 12                	mov    (%rdx),%edx
  8009d9:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8009dc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009e0:	89 0a                	mov    %ecx,(%rdx)
  8009e2:	eb 14                	jmp    8009f8 <getint+0xf9>
  8009e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009e8:	48 8b 40 08          	mov    0x8(%rax),%rax
  8009ec:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8009f0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009f4:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009f8:	8b 00                	mov    (%rax),%eax
  8009fa:	48 98                	cltq   
  8009fc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a00:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800a04:	c9                   	leaveq 
  800a05:	c3                   	retq   

0000000000800a06 <vprintfmt>:
  800a06:	55                   	push   %rbp
  800a07:	48 89 e5             	mov    %rsp,%rbp
  800a0a:	41 54                	push   %r12
  800a0c:	53                   	push   %rbx
  800a0d:	48 83 ec 60          	sub    $0x60,%rsp
  800a11:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800a15:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800a19:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a1d:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800a21:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800a25:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800a29:	48 8b 0a             	mov    (%rdx),%rcx
  800a2c:	48 89 08             	mov    %rcx,(%rax)
  800a2f:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800a33:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800a37:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800a3b:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800a3f:	eb 17                	jmp    800a58 <vprintfmt+0x52>
  800a41:	85 db                	test   %ebx,%ebx
  800a43:	0f 84 b9 04 00 00    	je     800f02 <vprintfmt+0x4fc>
  800a49:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a4d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a51:	48 89 d6             	mov    %rdx,%rsi
  800a54:	89 df                	mov    %ebx,%edi
  800a56:	ff d0                	callq  *%rax
  800a58:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a5c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800a60:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a64:	0f b6 00             	movzbl (%rax),%eax
  800a67:	0f b6 d8             	movzbl %al,%ebx
  800a6a:	83 fb 25             	cmp    $0x25,%ebx
  800a6d:	75 d2                	jne    800a41 <vprintfmt+0x3b>
  800a6f:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800a73:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800a7a:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a81:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800a88:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800a8f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a93:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800a97:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a9b:	0f b6 00             	movzbl (%rax),%eax
  800a9e:	0f b6 d8             	movzbl %al,%ebx
  800aa1:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800aa4:	83 f8 55             	cmp    $0x55,%eax
  800aa7:	0f 87 22 04 00 00    	ja     800ecf <vprintfmt+0x4c9>
  800aad:	89 c0                	mov    %eax,%eax
  800aaf:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800ab6:	00 
  800ab7:	48 b8 38 4d 80 00 00 	movabs $0x804d38,%rax
  800abe:	00 00 00 
  800ac1:	48 01 d0             	add    %rdx,%rax
  800ac4:	48 8b 00             	mov    (%rax),%rax
  800ac7:	ff e0                	jmpq   *%rax
  800ac9:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800acd:	eb c0                	jmp    800a8f <vprintfmt+0x89>
  800acf:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800ad3:	eb ba                	jmp    800a8f <vprintfmt+0x89>
  800ad5:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800adc:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800adf:	89 d0                	mov    %edx,%eax
  800ae1:	c1 e0 02             	shl    $0x2,%eax
  800ae4:	01 d0                	add    %edx,%eax
  800ae6:	01 c0                	add    %eax,%eax
  800ae8:	01 d8                	add    %ebx,%eax
  800aea:	83 e8 30             	sub    $0x30,%eax
  800aed:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800af0:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800af4:	0f b6 00             	movzbl (%rax),%eax
  800af7:	0f be d8             	movsbl %al,%ebx
  800afa:	83 fb 2f             	cmp    $0x2f,%ebx
  800afd:	7e 60                	jle    800b5f <vprintfmt+0x159>
  800aff:	83 fb 39             	cmp    $0x39,%ebx
  800b02:	7f 5b                	jg     800b5f <vprintfmt+0x159>
  800b04:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800b09:	eb d1                	jmp    800adc <vprintfmt+0xd6>
  800b0b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b0e:	83 f8 30             	cmp    $0x30,%eax
  800b11:	73 17                	jae    800b2a <vprintfmt+0x124>
  800b13:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800b17:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b1a:	89 d2                	mov    %edx,%edx
  800b1c:	48 01 d0             	add    %rdx,%rax
  800b1f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b22:	83 c2 08             	add    $0x8,%edx
  800b25:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b28:	eb 0c                	jmp    800b36 <vprintfmt+0x130>
  800b2a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800b2e:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800b32:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b36:	8b 00                	mov    (%rax),%eax
  800b38:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800b3b:	eb 23                	jmp    800b60 <vprintfmt+0x15a>
  800b3d:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b41:	0f 89 48 ff ff ff    	jns    800a8f <vprintfmt+0x89>
  800b47:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800b4e:	e9 3c ff ff ff       	jmpq   800a8f <vprintfmt+0x89>
  800b53:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800b5a:	e9 30 ff ff ff       	jmpq   800a8f <vprintfmt+0x89>
  800b5f:	90                   	nop
  800b60:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b64:	0f 89 25 ff ff ff    	jns    800a8f <vprintfmt+0x89>
  800b6a:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b6d:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800b70:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800b77:	e9 13 ff ff ff       	jmpq   800a8f <vprintfmt+0x89>
  800b7c:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800b80:	e9 0a ff ff ff       	jmpq   800a8f <vprintfmt+0x89>
  800b85:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b88:	83 f8 30             	cmp    $0x30,%eax
  800b8b:	73 17                	jae    800ba4 <vprintfmt+0x19e>
  800b8d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800b91:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b94:	89 d2                	mov    %edx,%edx
  800b96:	48 01 d0             	add    %rdx,%rax
  800b99:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b9c:	83 c2 08             	add    $0x8,%edx
  800b9f:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ba2:	eb 0c                	jmp    800bb0 <vprintfmt+0x1aa>
  800ba4:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800ba8:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800bac:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800bb0:	8b 10                	mov    (%rax),%edx
  800bb2:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800bb6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bba:	48 89 ce             	mov    %rcx,%rsi
  800bbd:	89 d7                	mov    %edx,%edi
  800bbf:	ff d0                	callq  *%rax
  800bc1:	e9 37 03 00 00       	jmpq   800efd <vprintfmt+0x4f7>
  800bc6:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bc9:	83 f8 30             	cmp    $0x30,%eax
  800bcc:	73 17                	jae    800be5 <vprintfmt+0x1df>
  800bce:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800bd2:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bd5:	89 d2                	mov    %edx,%edx
  800bd7:	48 01 d0             	add    %rdx,%rax
  800bda:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bdd:	83 c2 08             	add    $0x8,%edx
  800be0:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800be3:	eb 0c                	jmp    800bf1 <vprintfmt+0x1eb>
  800be5:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800be9:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800bed:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800bf1:	8b 18                	mov    (%rax),%ebx
  800bf3:	85 db                	test   %ebx,%ebx
  800bf5:	79 02                	jns    800bf9 <vprintfmt+0x1f3>
  800bf7:	f7 db                	neg    %ebx
  800bf9:	83 fb 15             	cmp    $0x15,%ebx
  800bfc:	7f 16                	jg     800c14 <vprintfmt+0x20e>
  800bfe:	48 b8 60 4c 80 00 00 	movabs $0x804c60,%rax
  800c05:	00 00 00 
  800c08:	48 63 d3             	movslq %ebx,%rdx
  800c0b:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800c0f:	4d 85 e4             	test   %r12,%r12
  800c12:	75 2e                	jne    800c42 <vprintfmt+0x23c>
  800c14:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800c18:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c1c:	89 d9                	mov    %ebx,%ecx
  800c1e:	48 ba 21 4d 80 00 00 	movabs $0x804d21,%rdx
  800c25:	00 00 00 
  800c28:	48 89 c7             	mov    %rax,%rdi
  800c2b:	b8 00 00 00 00       	mov    $0x0,%eax
  800c30:	49 b8 0c 0f 80 00 00 	movabs $0x800f0c,%r8
  800c37:	00 00 00 
  800c3a:	41 ff d0             	callq  *%r8
  800c3d:	e9 bb 02 00 00       	jmpq   800efd <vprintfmt+0x4f7>
  800c42:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800c46:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c4a:	4c 89 e1             	mov    %r12,%rcx
  800c4d:	48 ba 2a 4d 80 00 00 	movabs $0x804d2a,%rdx
  800c54:	00 00 00 
  800c57:	48 89 c7             	mov    %rax,%rdi
  800c5a:	b8 00 00 00 00       	mov    $0x0,%eax
  800c5f:	49 b8 0c 0f 80 00 00 	movabs $0x800f0c,%r8
  800c66:	00 00 00 
  800c69:	41 ff d0             	callq  *%r8
  800c6c:	e9 8c 02 00 00       	jmpq   800efd <vprintfmt+0x4f7>
  800c71:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c74:	83 f8 30             	cmp    $0x30,%eax
  800c77:	73 17                	jae    800c90 <vprintfmt+0x28a>
  800c79:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800c7d:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c80:	89 d2                	mov    %edx,%edx
  800c82:	48 01 d0             	add    %rdx,%rax
  800c85:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c88:	83 c2 08             	add    $0x8,%edx
  800c8b:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c8e:	eb 0c                	jmp    800c9c <vprintfmt+0x296>
  800c90:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800c94:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800c98:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c9c:	4c 8b 20             	mov    (%rax),%r12
  800c9f:	4d 85 e4             	test   %r12,%r12
  800ca2:	75 0a                	jne    800cae <vprintfmt+0x2a8>
  800ca4:	49 bc 2d 4d 80 00 00 	movabs $0x804d2d,%r12
  800cab:	00 00 00 
  800cae:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800cb2:	7e 78                	jle    800d2c <vprintfmt+0x326>
  800cb4:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800cb8:	74 72                	je     800d2c <vprintfmt+0x326>
  800cba:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800cbd:	48 98                	cltq   
  800cbf:	48 89 c6             	mov    %rax,%rsi
  800cc2:	4c 89 e7             	mov    %r12,%rdi
  800cc5:	48 b8 ba 11 80 00 00 	movabs $0x8011ba,%rax
  800ccc:	00 00 00 
  800ccf:	ff d0                	callq  *%rax
  800cd1:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800cd4:	eb 17                	jmp    800ced <vprintfmt+0x2e7>
  800cd6:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800cda:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800cde:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ce2:	48 89 ce             	mov    %rcx,%rsi
  800ce5:	89 d7                	mov    %edx,%edi
  800ce7:	ff d0                	callq  *%rax
  800ce9:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800ced:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800cf1:	7f e3                	jg     800cd6 <vprintfmt+0x2d0>
  800cf3:	eb 37                	jmp    800d2c <vprintfmt+0x326>
  800cf5:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800cf9:	74 1e                	je     800d19 <vprintfmt+0x313>
  800cfb:	83 fb 1f             	cmp    $0x1f,%ebx
  800cfe:	7e 05                	jle    800d05 <vprintfmt+0x2ff>
  800d00:	83 fb 7e             	cmp    $0x7e,%ebx
  800d03:	7e 14                	jle    800d19 <vprintfmt+0x313>
  800d05:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d09:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d0d:	48 89 d6             	mov    %rdx,%rsi
  800d10:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800d15:	ff d0                	callq  *%rax
  800d17:	eb 0f                	jmp    800d28 <vprintfmt+0x322>
  800d19:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d1d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d21:	48 89 d6             	mov    %rdx,%rsi
  800d24:	89 df                	mov    %ebx,%edi
  800d26:	ff d0                	callq  *%rax
  800d28:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d2c:	4c 89 e0             	mov    %r12,%rax
  800d2f:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800d33:	0f b6 00             	movzbl (%rax),%eax
  800d36:	0f be d8             	movsbl %al,%ebx
  800d39:	85 db                	test   %ebx,%ebx
  800d3b:	74 28                	je     800d65 <vprintfmt+0x35f>
  800d3d:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800d41:	78 b2                	js     800cf5 <vprintfmt+0x2ef>
  800d43:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800d47:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800d4b:	79 a8                	jns    800cf5 <vprintfmt+0x2ef>
  800d4d:	eb 16                	jmp    800d65 <vprintfmt+0x35f>
  800d4f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d53:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d57:	48 89 d6             	mov    %rdx,%rsi
  800d5a:	bf 20 00 00 00       	mov    $0x20,%edi
  800d5f:	ff d0                	callq  *%rax
  800d61:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d65:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d69:	7f e4                	jg     800d4f <vprintfmt+0x349>
  800d6b:	e9 8d 01 00 00       	jmpq   800efd <vprintfmt+0x4f7>
  800d70:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d74:	be 03 00 00 00       	mov    $0x3,%esi
  800d79:	48 89 c7             	mov    %rax,%rdi
  800d7c:	48 b8 ff 08 80 00 00 	movabs $0x8008ff,%rax
  800d83:	00 00 00 
  800d86:	ff d0                	callq  *%rax
  800d88:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d8c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d90:	48 85 c0             	test   %rax,%rax
  800d93:	79 1d                	jns    800db2 <vprintfmt+0x3ac>
  800d95:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d99:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d9d:	48 89 d6             	mov    %rdx,%rsi
  800da0:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800da5:	ff d0                	callq  *%rax
  800da7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800dab:	48 f7 d8             	neg    %rax
  800dae:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800db2:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800db9:	e9 d2 00 00 00       	jmpq   800e90 <vprintfmt+0x48a>
  800dbe:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800dc2:	be 03 00 00 00       	mov    $0x3,%esi
  800dc7:	48 89 c7             	mov    %rax,%rdi
  800dca:	48 b8 f8 07 80 00 00 	movabs $0x8007f8,%rax
  800dd1:	00 00 00 
  800dd4:	ff d0                	callq  *%rax
  800dd6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dda:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800de1:	e9 aa 00 00 00       	jmpq   800e90 <vprintfmt+0x48a>
  800de6:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800dea:	be 03 00 00 00       	mov    $0x3,%esi
  800def:	48 89 c7             	mov    %rax,%rdi
  800df2:	48 b8 f8 07 80 00 00 	movabs $0x8007f8,%rax
  800df9:	00 00 00 
  800dfc:	ff d0                	callq  *%rax
  800dfe:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e02:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800e09:	e9 82 00 00 00       	jmpq   800e90 <vprintfmt+0x48a>
  800e0e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e12:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e16:	48 89 d6             	mov    %rdx,%rsi
  800e19:	bf 30 00 00 00       	mov    $0x30,%edi
  800e1e:	ff d0                	callq  *%rax
  800e20:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e24:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e28:	48 89 d6             	mov    %rdx,%rsi
  800e2b:	bf 78 00 00 00       	mov    $0x78,%edi
  800e30:	ff d0                	callq  *%rax
  800e32:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e35:	83 f8 30             	cmp    $0x30,%eax
  800e38:	73 17                	jae    800e51 <vprintfmt+0x44b>
  800e3a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800e3e:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e41:	89 d2                	mov    %edx,%edx
  800e43:	48 01 d0             	add    %rdx,%rax
  800e46:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e49:	83 c2 08             	add    $0x8,%edx
  800e4c:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800e4f:	eb 0c                	jmp    800e5d <vprintfmt+0x457>
  800e51:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800e55:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800e59:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e5d:	48 8b 00             	mov    (%rax),%rax
  800e60:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e64:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800e6b:	eb 23                	jmp    800e90 <vprintfmt+0x48a>
  800e6d:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e71:	be 03 00 00 00       	mov    $0x3,%esi
  800e76:	48 89 c7             	mov    %rax,%rdi
  800e79:	48 b8 f8 07 80 00 00 	movabs $0x8007f8,%rax
  800e80:	00 00 00 
  800e83:	ff d0                	callq  *%rax
  800e85:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e89:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800e90:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800e95:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800e98:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800e9b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e9f:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800ea3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ea7:	45 89 c1             	mov    %r8d,%r9d
  800eaa:	41 89 f8             	mov    %edi,%r8d
  800ead:	48 89 c7             	mov    %rax,%rdi
  800eb0:	48 b8 40 07 80 00 00 	movabs $0x800740,%rax
  800eb7:	00 00 00 
  800eba:	ff d0                	callq  *%rax
  800ebc:	eb 3f                	jmp    800efd <vprintfmt+0x4f7>
  800ebe:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ec2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ec6:	48 89 d6             	mov    %rdx,%rsi
  800ec9:	89 df                	mov    %ebx,%edi
  800ecb:	ff d0                	callq  *%rax
  800ecd:	eb 2e                	jmp    800efd <vprintfmt+0x4f7>
  800ecf:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ed3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ed7:	48 89 d6             	mov    %rdx,%rsi
  800eda:	bf 25 00 00 00       	mov    $0x25,%edi
  800edf:	ff d0                	callq  *%rax
  800ee1:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800ee6:	eb 05                	jmp    800eed <vprintfmt+0x4e7>
  800ee8:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800eed:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800ef1:	48 83 e8 01          	sub    $0x1,%rax
  800ef5:	0f b6 00             	movzbl (%rax),%eax
  800ef8:	3c 25                	cmp    $0x25,%al
  800efa:	75 ec                	jne    800ee8 <vprintfmt+0x4e2>
  800efc:	90                   	nop
  800efd:	e9 3d fb ff ff       	jmpq   800a3f <vprintfmt+0x39>
  800f02:	90                   	nop
  800f03:	48 83 c4 60          	add    $0x60,%rsp
  800f07:	5b                   	pop    %rbx
  800f08:	41 5c                	pop    %r12
  800f0a:	5d                   	pop    %rbp
  800f0b:	c3                   	retq   

0000000000800f0c <printfmt>:
  800f0c:	55                   	push   %rbp
  800f0d:	48 89 e5             	mov    %rsp,%rbp
  800f10:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800f17:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800f1e:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800f25:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800f2c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f33:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f3a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f41:	84 c0                	test   %al,%al
  800f43:	74 20                	je     800f65 <printfmt+0x59>
  800f45:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f49:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f4d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f51:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f55:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f59:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f5d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f61:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f65:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800f6c:	00 00 00 
  800f6f:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800f76:	00 00 00 
  800f79:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800f7d:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800f84:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800f8b:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800f92:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800f99:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800fa0:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800fa7:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800fae:	48 89 c7             	mov    %rax,%rdi
  800fb1:	48 b8 06 0a 80 00 00 	movabs $0x800a06,%rax
  800fb8:	00 00 00 
  800fbb:	ff d0                	callq  *%rax
  800fbd:	90                   	nop
  800fbe:	c9                   	leaveq 
  800fbf:	c3                   	retq   

0000000000800fc0 <sprintputch>:
  800fc0:	55                   	push   %rbp
  800fc1:	48 89 e5             	mov    %rsp,%rbp
  800fc4:	48 83 ec 10          	sub    $0x10,%rsp
  800fc8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800fcb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800fcf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fd3:	8b 40 10             	mov    0x10(%rax),%eax
  800fd6:	8d 50 01             	lea    0x1(%rax),%edx
  800fd9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fdd:	89 50 10             	mov    %edx,0x10(%rax)
  800fe0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fe4:	48 8b 10             	mov    (%rax),%rdx
  800fe7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800feb:	48 8b 40 08          	mov    0x8(%rax),%rax
  800fef:	48 39 c2             	cmp    %rax,%rdx
  800ff2:	73 17                	jae    80100b <sprintputch+0x4b>
  800ff4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ff8:	48 8b 00             	mov    (%rax),%rax
  800ffb:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800fff:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801003:	48 89 0a             	mov    %rcx,(%rdx)
  801006:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801009:	88 10                	mov    %dl,(%rax)
  80100b:	90                   	nop
  80100c:	c9                   	leaveq 
  80100d:	c3                   	retq   

000000000080100e <vsnprintf>:
  80100e:	55                   	push   %rbp
  80100f:	48 89 e5             	mov    %rsp,%rbp
  801012:	48 83 ec 50          	sub    $0x50,%rsp
  801016:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  80101a:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  80101d:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801021:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  801025:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  801029:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  80102d:	48 8b 0a             	mov    (%rdx),%rcx
  801030:	48 89 08             	mov    %rcx,(%rax)
  801033:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801037:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80103b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80103f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801043:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801047:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  80104b:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  80104e:	48 98                	cltq   
  801050:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801054:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801058:	48 01 d0             	add    %rdx,%rax
  80105b:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  80105f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  801066:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  80106b:	74 06                	je     801073 <vsnprintf+0x65>
  80106d:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801071:	7f 07                	jg     80107a <vsnprintf+0x6c>
  801073:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801078:	eb 2f                	jmp    8010a9 <vsnprintf+0x9b>
  80107a:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  80107e:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801082:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  801086:	48 89 c6             	mov    %rax,%rsi
  801089:	48 bf c0 0f 80 00 00 	movabs $0x800fc0,%rdi
  801090:	00 00 00 
  801093:	48 b8 06 0a 80 00 00 	movabs $0x800a06,%rax
  80109a:	00 00 00 
  80109d:	ff d0                	callq  *%rax
  80109f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8010a3:	c6 00 00             	movb   $0x0,(%rax)
  8010a6:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8010a9:	c9                   	leaveq 
  8010aa:	c3                   	retq   

00000000008010ab <snprintf>:
  8010ab:	55                   	push   %rbp
  8010ac:	48 89 e5             	mov    %rsp,%rbp
  8010af:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  8010b6:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8010bd:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  8010c3:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  8010ca:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8010d1:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8010d8:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8010df:	84 c0                	test   %al,%al
  8010e1:	74 20                	je     801103 <snprintf+0x58>
  8010e3:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8010e7:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8010eb:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8010ef:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8010f3:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8010f7:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8010fb:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8010ff:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801103:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  80110a:	00 00 00 
  80110d:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  801114:	00 00 00 
  801117:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80111b:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801122:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801129:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801130:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  801137:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80113e:	48 8b 0a             	mov    (%rdx),%rcx
  801141:	48 89 08             	mov    %rcx,(%rax)
  801144:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801148:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80114c:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801150:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801154:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80115b:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801162:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  801168:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80116f:	48 89 c7             	mov    %rax,%rdi
  801172:	48 b8 0e 10 80 00 00 	movabs $0x80100e,%rax
  801179:	00 00 00 
  80117c:	ff d0                	callq  *%rax
  80117e:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801184:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80118a:	c9                   	leaveq 
  80118b:	c3                   	retq   

000000000080118c <strlen>:
  80118c:	55                   	push   %rbp
  80118d:	48 89 e5             	mov    %rsp,%rbp
  801190:	48 83 ec 18          	sub    $0x18,%rsp
  801194:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801198:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80119f:	eb 09                	jmp    8011aa <strlen+0x1e>
  8011a1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8011a5:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8011aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011ae:	0f b6 00             	movzbl (%rax),%eax
  8011b1:	84 c0                	test   %al,%al
  8011b3:	75 ec                	jne    8011a1 <strlen+0x15>
  8011b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011b8:	c9                   	leaveq 
  8011b9:	c3                   	retq   

00000000008011ba <strnlen>:
  8011ba:	55                   	push   %rbp
  8011bb:	48 89 e5             	mov    %rsp,%rbp
  8011be:	48 83 ec 20          	sub    $0x20,%rsp
  8011c2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011c6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011ca:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8011d1:	eb 0e                	jmp    8011e1 <strnlen+0x27>
  8011d3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8011d7:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8011dc:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8011e1:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8011e6:	74 0b                	je     8011f3 <strnlen+0x39>
  8011e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011ec:	0f b6 00             	movzbl (%rax),%eax
  8011ef:	84 c0                	test   %al,%al
  8011f1:	75 e0                	jne    8011d3 <strnlen+0x19>
  8011f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011f6:	c9                   	leaveq 
  8011f7:	c3                   	retq   

00000000008011f8 <strcpy>:
  8011f8:	55                   	push   %rbp
  8011f9:	48 89 e5             	mov    %rsp,%rbp
  8011fc:	48 83 ec 20          	sub    $0x20,%rsp
  801200:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801204:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801208:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80120c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801210:	90                   	nop
  801211:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801215:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801219:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80121d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801221:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801225:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801229:	0f b6 12             	movzbl (%rdx),%edx
  80122c:	88 10                	mov    %dl,(%rax)
  80122e:	0f b6 00             	movzbl (%rax),%eax
  801231:	84 c0                	test   %al,%al
  801233:	75 dc                	jne    801211 <strcpy+0x19>
  801235:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801239:	c9                   	leaveq 
  80123a:	c3                   	retq   

000000000080123b <strcat>:
  80123b:	55                   	push   %rbp
  80123c:	48 89 e5             	mov    %rsp,%rbp
  80123f:	48 83 ec 20          	sub    $0x20,%rsp
  801243:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801247:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80124b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80124f:	48 89 c7             	mov    %rax,%rdi
  801252:	48 b8 8c 11 80 00 00 	movabs $0x80118c,%rax
  801259:	00 00 00 
  80125c:	ff d0                	callq  *%rax
  80125e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801261:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801264:	48 63 d0             	movslq %eax,%rdx
  801267:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80126b:	48 01 c2             	add    %rax,%rdx
  80126e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801272:	48 89 c6             	mov    %rax,%rsi
  801275:	48 89 d7             	mov    %rdx,%rdi
  801278:	48 b8 f8 11 80 00 00 	movabs $0x8011f8,%rax
  80127f:	00 00 00 
  801282:	ff d0                	callq  *%rax
  801284:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801288:	c9                   	leaveq 
  801289:	c3                   	retq   

000000000080128a <strncpy>:
  80128a:	55                   	push   %rbp
  80128b:	48 89 e5             	mov    %rsp,%rbp
  80128e:	48 83 ec 28          	sub    $0x28,%rsp
  801292:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801296:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80129a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80129e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012a2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8012a6:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8012ad:	00 
  8012ae:	eb 2a                	jmp    8012da <strncpy+0x50>
  8012b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012b4:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8012b8:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012bc:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8012c0:	0f b6 12             	movzbl (%rdx),%edx
  8012c3:	88 10                	mov    %dl,(%rax)
  8012c5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8012c9:	0f b6 00             	movzbl (%rax),%eax
  8012cc:	84 c0                	test   %al,%al
  8012ce:	74 05                	je     8012d5 <strncpy+0x4b>
  8012d0:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8012d5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012da:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012de:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8012e2:	72 cc                	jb     8012b0 <strncpy+0x26>
  8012e4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012e8:	c9                   	leaveq 
  8012e9:	c3                   	retq   

00000000008012ea <strlcpy>:
  8012ea:	55                   	push   %rbp
  8012eb:	48 89 e5             	mov    %rsp,%rbp
  8012ee:	48 83 ec 28          	sub    $0x28,%rsp
  8012f2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8012f6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8012fa:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8012fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801302:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801306:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80130b:	74 3d                	je     80134a <strlcpy+0x60>
  80130d:	eb 1d                	jmp    80132c <strlcpy+0x42>
  80130f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801313:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801317:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80131b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80131f:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801323:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801327:	0f b6 12             	movzbl (%rdx),%edx
  80132a:	88 10                	mov    %dl,(%rax)
  80132c:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801331:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801336:	74 0b                	je     801343 <strlcpy+0x59>
  801338:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80133c:	0f b6 00             	movzbl (%rax),%eax
  80133f:	84 c0                	test   %al,%al
  801341:	75 cc                	jne    80130f <strlcpy+0x25>
  801343:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801347:	c6 00 00             	movb   $0x0,(%rax)
  80134a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80134e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801352:	48 29 c2             	sub    %rax,%rdx
  801355:	48 89 d0             	mov    %rdx,%rax
  801358:	c9                   	leaveq 
  801359:	c3                   	retq   

000000000080135a <strcmp>:
  80135a:	55                   	push   %rbp
  80135b:	48 89 e5             	mov    %rsp,%rbp
  80135e:	48 83 ec 10          	sub    $0x10,%rsp
  801362:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801366:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80136a:	eb 0a                	jmp    801376 <strcmp+0x1c>
  80136c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801371:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801376:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80137a:	0f b6 00             	movzbl (%rax),%eax
  80137d:	84 c0                	test   %al,%al
  80137f:	74 12                	je     801393 <strcmp+0x39>
  801381:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801385:	0f b6 10             	movzbl (%rax),%edx
  801388:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80138c:	0f b6 00             	movzbl (%rax),%eax
  80138f:	38 c2                	cmp    %al,%dl
  801391:	74 d9                	je     80136c <strcmp+0x12>
  801393:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801397:	0f b6 00             	movzbl (%rax),%eax
  80139a:	0f b6 d0             	movzbl %al,%edx
  80139d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013a1:	0f b6 00             	movzbl (%rax),%eax
  8013a4:	0f b6 c0             	movzbl %al,%eax
  8013a7:	29 c2                	sub    %eax,%edx
  8013a9:	89 d0                	mov    %edx,%eax
  8013ab:	c9                   	leaveq 
  8013ac:	c3                   	retq   

00000000008013ad <strncmp>:
  8013ad:	55                   	push   %rbp
  8013ae:	48 89 e5             	mov    %rsp,%rbp
  8013b1:	48 83 ec 18          	sub    $0x18,%rsp
  8013b5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013b9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8013bd:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013c1:	eb 0f                	jmp    8013d2 <strncmp+0x25>
  8013c3:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8013c8:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8013cd:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8013d2:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8013d7:	74 1d                	je     8013f6 <strncmp+0x49>
  8013d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013dd:	0f b6 00             	movzbl (%rax),%eax
  8013e0:	84 c0                	test   %al,%al
  8013e2:	74 12                	je     8013f6 <strncmp+0x49>
  8013e4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013e8:	0f b6 10             	movzbl (%rax),%edx
  8013eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013ef:	0f b6 00             	movzbl (%rax),%eax
  8013f2:	38 c2                	cmp    %al,%dl
  8013f4:	74 cd                	je     8013c3 <strncmp+0x16>
  8013f6:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8013fb:	75 07                	jne    801404 <strncmp+0x57>
  8013fd:	b8 00 00 00 00       	mov    $0x0,%eax
  801402:	eb 18                	jmp    80141c <strncmp+0x6f>
  801404:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801408:	0f b6 00             	movzbl (%rax),%eax
  80140b:	0f b6 d0             	movzbl %al,%edx
  80140e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801412:	0f b6 00             	movzbl (%rax),%eax
  801415:	0f b6 c0             	movzbl %al,%eax
  801418:	29 c2                	sub    %eax,%edx
  80141a:	89 d0                	mov    %edx,%eax
  80141c:	c9                   	leaveq 
  80141d:	c3                   	retq   

000000000080141e <strchr>:
  80141e:	55                   	push   %rbp
  80141f:	48 89 e5             	mov    %rsp,%rbp
  801422:	48 83 ec 10          	sub    $0x10,%rsp
  801426:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80142a:	89 f0                	mov    %esi,%eax
  80142c:	88 45 f4             	mov    %al,-0xc(%rbp)
  80142f:	eb 17                	jmp    801448 <strchr+0x2a>
  801431:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801435:	0f b6 00             	movzbl (%rax),%eax
  801438:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80143b:	75 06                	jne    801443 <strchr+0x25>
  80143d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801441:	eb 15                	jmp    801458 <strchr+0x3a>
  801443:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801448:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80144c:	0f b6 00             	movzbl (%rax),%eax
  80144f:	84 c0                	test   %al,%al
  801451:	75 de                	jne    801431 <strchr+0x13>
  801453:	b8 00 00 00 00       	mov    $0x0,%eax
  801458:	c9                   	leaveq 
  801459:	c3                   	retq   

000000000080145a <strfind>:
  80145a:	55                   	push   %rbp
  80145b:	48 89 e5             	mov    %rsp,%rbp
  80145e:	48 83 ec 10          	sub    $0x10,%rsp
  801462:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801466:	89 f0                	mov    %esi,%eax
  801468:	88 45 f4             	mov    %al,-0xc(%rbp)
  80146b:	eb 11                	jmp    80147e <strfind+0x24>
  80146d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801471:	0f b6 00             	movzbl (%rax),%eax
  801474:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801477:	74 12                	je     80148b <strfind+0x31>
  801479:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80147e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801482:	0f b6 00             	movzbl (%rax),%eax
  801485:	84 c0                	test   %al,%al
  801487:	75 e4                	jne    80146d <strfind+0x13>
  801489:	eb 01                	jmp    80148c <strfind+0x32>
  80148b:	90                   	nop
  80148c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801490:	c9                   	leaveq 
  801491:	c3                   	retq   

0000000000801492 <memset>:
  801492:	55                   	push   %rbp
  801493:	48 89 e5             	mov    %rsp,%rbp
  801496:	48 83 ec 18          	sub    $0x18,%rsp
  80149a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80149e:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8014a1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014a5:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8014aa:	75 06                	jne    8014b2 <memset+0x20>
  8014ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014b0:	eb 69                	jmp    80151b <memset+0x89>
  8014b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014b6:	83 e0 03             	and    $0x3,%eax
  8014b9:	48 85 c0             	test   %rax,%rax
  8014bc:	75 48                	jne    801506 <memset+0x74>
  8014be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014c2:	83 e0 03             	and    $0x3,%eax
  8014c5:	48 85 c0             	test   %rax,%rax
  8014c8:	75 3c                	jne    801506 <memset+0x74>
  8014ca:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8014d1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014d4:	c1 e0 18             	shl    $0x18,%eax
  8014d7:	89 c2                	mov    %eax,%edx
  8014d9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014dc:	c1 e0 10             	shl    $0x10,%eax
  8014df:	09 c2                	or     %eax,%edx
  8014e1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014e4:	c1 e0 08             	shl    $0x8,%eax
  8014e7:	09 d0                	or     %edx,%eax
  8014e9:	09 45 f4             	or     %eax,-0xc(%rbp)
  8014ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014f0:	48 c1 e8 02          	shr    $0x2,%rax
  8014f4:	48 89 c1             	mov    %rax,%rcx
  8014f7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014fb:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014fe:	48 89 d7             	mov    %rdx,%rdi
  801501:	fc                   	cld    
  801502:	f3 ab                	rep stos %eax,%es:(%rdi)
  801504:	eb 11                	jmp    801517 <memset+0x85>
  801506:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80150a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80150d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801511:	48 89 d7             	mov    %rdx,%rdi
  801514:	fc                   	cld    
  801515:	f3 aa                	rep stos %al,%es:(%rdi)
  801517:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80151b:	c9                   	leaveq 
  80151c:	c3                   	retq   

000000000080151d <memmove>:
  80151d:	55                   	push   %rbp
  80151e:	48 89 e5             	mov    %rsp,%rbp
  801521:	48 83 ec 28          	sub    $0x28,%rsp
  801525:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801529:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80152d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801531:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801535:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801539:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80153d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801541:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801545:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801549:	0f 83 88 00 00 00    	jae    8015d7 <memmove+0xba>
  80154f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801553:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801557:	48 01 d0             	add    %rdx,%rax
  80155a:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80155e:	76 77                	jbe    8015d7 <memmove+0xba>
  801560:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801564:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801568:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80156c:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801570:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801574:	83 e0 03             	and    $0x3,%eax
  801577:	48 85 c0             	test   %rax,%rax
  80157a:	75 3b                	jne    8015b7 <memmove+0x9a>
  80157c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801580:	83 e0 03             	and    $0x3,%eax
  801583:	48 85 c0             	test   %rax,%rax
  801586:	75 2f                	jne    8015b7 <memmove+0x9a>
  801588:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80158c:	83 e0 03             	and    $0x3,%eax
  80158f:	48 85 c0             	test   %rax,%rax
  801592:	75 23                	jne    8015b7 <memmove+0x9a>
  801594:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801598:	48 83 e8 04          	sub    $0x4,%rax
  80159c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8015a0:	48 83 ea 04          	sub    $0x4,%rdx
  8015a4:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8015a8:	48 c1 e9 02          	shr    $0x2,%rcx
  8015ac:	48 89 c7             	mov    %rax,%rdi
  8015af:	48 89 d6             	mov    %rdx,%rsi
  8015b2:	fd                   	std    
  8015b3:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8015b5:	eb 1d                	jmp    8015d4 <memmove+0xb7>
  8015b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015bb:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8015bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015c3:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8015c7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015cb:	48 89 d7             	mov    %rdx,%rdi
  8015ce:	48 89 c1             	mov    %rax,%rcx
  8015d1:	fd                   	std    
  8015d2:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8015d4:	fc                   	cld    
  8015d5:	eb 57                	jmp    80162e <memmove+0x111>
  8015d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015db:	83 e0 03             	and    $0x3,%eax
  8015de:	48 85 c0             	test   %rax,%rax
  8015e1:	75 36                	jne    801619 <memmove+0xfc>
  8015e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015e7:	83 e0 03             	and    $0x3,%eax
  8015ea:	48 85 c0             	test   %rax,%rax
  8015ed:	75 2a                	jne    801619 <memmove+0xfc>
  8015ef:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015f3:	83 e0 03             	and    $0x3,%eax
  8015f6:	48 85 c0             	test   %rax,%rax
  8015f9:	75 1e                	jne    801619 <memmove+0xfc>
  8015fb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015ff:	48 c1 e8 02          	shr    $0x2,%rax
  801603:	48 89 c1             	mov    %rax,%rcx
  801606:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80160a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80160e:	48 89 c7             	mov    %rax,%rdi
  801611:	48 89 d6             	mov    %rdx,%rsi
  801614:	fc                   	cld    
  801615:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801617:	eb 15                	jmp    80162e <memmove+0x111>
  801619:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80161d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801621:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801625:	48 89 c7             	mov    %rax,%rdi
  801628:	48 89 d6             	mov    %rdx,%rsi
  80162b:	fc                   	cld    
  80162c:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80162e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801632:	c9                   	leaveq 
  801633:	c3                   	retq   

0000000000801634 <memcpy>:
  801634:	55                   	push   %rbp
  801635:	48 89 e5             	mov    %rsp,%rbp
  801638:	48 83 ec 18          	sub    $0x18,%rsp
  80163c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801640:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801644:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801648:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80164c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801650:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801654:	48 89 ce             	mov    %rcx,%rsi
  801657:	48 89 c7             	mov    %rax,%rdi
  80165a:	48 b8 1d 15 80 00 00 	movabs $0x80151d,%rax
  801661:	00 00 00 
  801664:	ff d0                	callq  *%rax
  801666:	c9                   	leaveq 
  801667:	c3                   	retq   

0000000000801668 <memcmp>:
  801668:	55                   	push   %rbp
  801669:	48 89 e5             	mov    %rsp,%rbp
  80166c:	48 83 ec 28          	sub    $0x28,%rsp
  801670:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801674:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801678:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80167c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801680:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801684:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801688:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80168c:	eb 36                	jmp    8016c4 <memcmp+0x5c>
  80168e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801692:	0f b6 10             	movzbl (%rax),%edx
  801695:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801699:	0f b6 00             	movzbl (%rax),%eax
  80169c:	38 c2                	cmp    %al,%dl
  80169e:	74 1a                	je     8016ba <memcmp+0x52>
  8016a0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016a4:	0f b6 00             	movzbl (%rax),%eax
  8016a7:	0f b6 d0             	movzbl %al,%edx
  8016aa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016ae:	0f b6 00             	movzbl (%rax),%eax
  8016b1:	0f b6 c0             	movzbl %al,%eax
  8016b4:	29 c2                	sub    %eax,%edx
  8016b6:	89 d0                	mov    %edx,%eax
  8016b8:	eb 20                	jmp    8016da <memcmp+0x72>
  8016ba:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8016bf:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8016c4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016c8:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8016cc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8016d0:	48 85 c0             	test   %rax,%rax
  8016d3:	75 b9                	jne    80168e <memcmp+0x26>
  8016d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8016da:	c9                   	leaveq 
  8016db:	c3                   	retq   

00000000008016dc <memfind>:
  8016dc:	55                   	push   %rbp
  8016dd:	48 89 e5             	mov    %rsp,%rbp
  8016e0:	48 83 ec 28          	sub    $0x28,%rsp
  8016e4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8016e8:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8016eb:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8016ef:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8016f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016f7:	48 01 d0             	add    %rdx,%rax
  8016fa:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8016fe:	eb 13                	jmp    801713 <memfind+0x37>
  801700:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801704:	0f b6 00             	movzbl (%rax),%eax
  801707:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80170a:	38 d0                	cmp    %dl,%al
  80170c:	74 11                	je     80171f <memfind+0x43>
  80170e:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801713:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801717:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80171b:	72 e3                	jb     801700 <memfind+0x24>
  80171d:	eb 01                	jmp    801720 <memfind+0x44>
  80171f:	90                   	nop
  801720:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801724:	c9                   	leaveq 
  801725:	c3                   	retq   

0000000000801726 <strtol>:
  801726:	55                   	push   %rbp
  801727:	48 89 e5             	mov    %rsp,%rbp
  80172a:	48 83 ec 38          	sub    $0x38,%rsp
  80172e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801732:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801736:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801739:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801740:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801747:	00 
  801748:	eb 05                	jmp    80174f <strtol+0x29>
  80174a:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80174f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801753:	0f b6 00             	movzbl (%rax),%eax
  801756:	3c 20                	cmp    $0x20,%al
  801758:	74 f0                	je     80174a <strtol+0x24>
  80175a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80175e:	0f b6 00             	movzbl (%rax),%eax
  801761:	3c 09                	cmp    $0x9,%al
  801763:	74 e5                	je     80174a <strtol+0x24>
  801765:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801769:	0f b6 00             	movzbl (%rax),%eax
  80176c:	3c 2b                	cmp    $0x2b,%al
  80176e:	75 07                	jne    801777 <strtol+0x51>
  801770:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801775:	eb 17                	jmp    80178e <strtol+0x68>
  801777:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80177b:	0f b6 00             	movzbl (%rax),%eax
  80177e:	3c 2d                	cmp    $0x2d,%al
  801780:	75 0c                	jne    80178e <strtol+0x68>
  801782:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801787:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  80178e:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801792:	74 06                	je     80179a <strtol+0x74>
  801794:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801798:	75 28                	jne    8017c2 <strtol+0x9c>
  80179a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80179e:	0f b6 00             	movzbl (%rax),%eax
  8017a1:	3c 30                	cmp    $0x30,%al
  8017a3:	75 1d                	jne    8017c2 <strtol+0x9c>
  8017a5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a9:	48 83 c0 01          	add    $0x1,%rax
  8017ad:	0f b6 00             	movzbl (%rax),%eax
  8017b0:	3c 78                	cmp    $0x78,%al
  8017b2:	75 0e                	jne    8017c2 <strtol+0x9c>
  8017b4:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8017b9:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8017c0:	eb 2c                	jmp    8017ee <strtol+0xc8>
  8017c2:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8017c6:	75 19                	jne    8017e1 <strtol+0xbb>
  8017c8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017cc:	0f b6 00             	movzbl (%rax),%eax
  8017cf:	3c 30                	cmp    $0x30,%al
  8017d1:	75 0e                	jne    8017e1 <strtol+0xbb>
  8017d3:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8017d8:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8017df:	eb 0d                	jmp    8017ee <strtol+0xc8>
  8017e1:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8017e5:	75 07                	jne    8017ee <strtol+0xc8>
  8017e7:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8017ee:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017f2:	0f b6 00             	movzbl (%rax),%eax
  8017f5:	3c 2f                	cmp    $0x2f,%al
  8017f7:	7e 1d                	jle    801816 <strtol+0xf0>
  8017f9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017fd:	0f b6 00             	movzbl (%rax),%eax
  801800:	3c 39                	cmp    $0x39,%al
  801802:	7f 12                	jg     801816 <strtol+0xf0>
  801804:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801808:	0f b6 00             	movzbl (%rax),%eax
  80180b:	0f be c0             	movsbl %al,%eax
  80180e:	83 e8 30             	sub    $0x30,%eax
  801811:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801814:	eb 4e                	jmp    801864 <strtol+0x13e>
  801816:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80181a:	0f b6 00             	movzbl (%rax),%eax
  80181d:	3c 60                	cmp    $0x60,%al
  80181f:	7e 1d                	jle    80183e <strtol+0x118>
  801821:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801825:	0f b6 00             	movzbl (%rax),%eax
  801828:	3c 7a                	cmp    $0x7a,%al
  80182a:	7f 12                	jg     80183e <strtol+0x118>
  80182c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801830:	0f b6 00             	movzbl (%rax),%eax
  801833:	0f be c0             	movsbl %al,%eax
  801836:	83 e8 57             	sub    $0x57,%eax
  801839:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80183c:	eb 26                	jmp    801864 <strtol+0x13e>
  80183e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801842:	0f b6 00             	movzbl (%rax),%eax
  801845:	3c 40                	cmp    $0x40,%al
  801847:	7e 47                	jle    801890 <strtol+0x16a>
  801849:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80184d:	0f b6 00             	movzbl (%rax),%eax
  801850:	3c 5a                	cmp    $0x5a,%al
  801852:	7f 3c                	jg     801890 <strtol+0x16a>
  801854:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801858:	0f b6 00             	movzbl (%rax),%eax
  80185b:	0f be c0             	movsbl %al,%eax
  80185e:	83 e8 37             	sub    $0x37,%eax
  801861:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801864:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801867:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80186a:	7d 23                	jge    80188f <strtol+0x169>
  80186c:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801871:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801874:	48 98                	cltq   
  801876:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80187b:	48 89 c2             	mov    %rax,%rdx
  80187e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801881:	48 98                	cltq   
  801883:	48 01 d0             	add    %rdx,%rax
  801886:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80188a:	e9 5f ff ff ff       	jmpq   8017ee <strtol+0xc8>
  80188f:	90                   	nop
  801890:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801895:	74 0b                	je     8018a2 <strtol+0x17c>
  801897:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80189b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80189f:	48 89 10             	mov    %rdx,(%rax)
  8018a2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8018a6:	74 09                	je     8018b1 <strtol+0x18b>
  8018a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018ac:	48 f7 d8             	neg    %rax
  8018af:	eb 04                	jmp    8018b5 <strtol+0x18f>
  8018b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018b5:	c9                   	leaveq 
  8018b6:	c3                   	retq   

00000000008018b7 <strstr>:
  8018b7:	55                   	push   %rbp
  8018b8:	48 89 e5             	mov    %rsp,%rbp
  8018bb:	48 83 ec 30          	sub    $0x30,%rsp
  8018bf:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8018c3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8018c7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8018cb:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8018cf:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8018d3:	0f b6 00             	movzbl (%rax),%eax
  8018d6:	88 45 ff             	mov    %al,-0x1(%rbp)
  8018d9:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8018dd:	75 06                	jne    8018e5 <strstr+0x2e>
  8018df:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018e3:	eb 6b                	jmp    801950 <strstr+0x99>
  8018e5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8018e9:	48 89 c7             	mov    %rax,%rdi
  8018ec:	48 b8 8c 11 80 00 00 	movabs $0x80118c,%rax
  8018f3:	00 00 00 
  8018f6:	ff d0                	callq  *%rax
  8018f8:	48 98                	cltq   
  8018fa:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8018fe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801902:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801906:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80190a:	0f b6 00             	movzbl (%rax),%eax
  80190d:	88 45 ef             	mov    %al,-0x11(%rbp)
  801910:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801914:	75 07                	jne    80191d <strstr+0x66>
  801916:	b8 00 00 00 00       	mov    $0x0,%eax
  80191b:	eb 33                	jmp    801950 <strstr+0x99>
  80191d:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801921:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801924:	75 d8                	jne    8018fe <strstr+0x47>
  801926:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80192a:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  80192e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801932:	48 89 ce             	mov    %rcx,%rsi
  801935:	48 89 c7             	mov    %rax,%rdi
  801938:	48 b8 ad 13 80 00 00 	movabs $0x8013ad,%rax
  80193f:	00 00 00 
  801942:	ff d0                	callq  *%rax
  801944:	85 c0                	test   %eax,%eax
  801946:	75 b6                	jne    8018fe <strstr+0x47>
  801948:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80194c:	48 83 e8 01          	sub    $0x1,%rax
  801950:	c9                   	leaveq 
  801951:	c3                   	retq   

0000000000801952 <syscall>:
  801952:	55                   	push   %rbp
  801953:	48 89 e5             	mov    %rsp,%rbp
  801956:	53                   	push   %rbx
  801957:	48 83 ec 48          	sub    $0x48,%rsp
  80195b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80195e:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801961:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801965:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801969:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  80196d:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801971:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801974:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801978:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  80197c:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801980:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801984:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801988:	4c 89 c3             	mov    %r8,%rbx
  80198b:	cd 30                	int    $0x30
  80198d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801991:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801995:	74 3e                	je     8019d5 <syscall+0x83>
  801997:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80199c:	7e 37                	jle    8019d5 <syscall+0x83>
  80199e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8019a2:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8019a5:	49 89 d0             	mov    %rdx,%r8
  8019a8:	89 c1                	mov    %eax,%ecx
  8019aa:	48 ba e8 4f 80 00 00 	movabs $0x804fe8,%rdx
  8019b1:	00 00 00 
  8019b4:	be 24 00 00 00       	mov    $0x24,%esi
  8019b9:	48 bf 05 50 80 00 00 	movabs $0x805005,%rdi
  8019c0:	00 00 00 
  8019c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8019c8:	49 b9 2e 04 80 00 00 	movabs $0x80042e,%r9
  8019cf:	00 00 00 
  8019d2:	41 ff d1             	callq  *%r9
  8019d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019d9:	48 83 c4 48          	add    $0x48,%rsp
  8019dd:	5b                   	pop    %rbx
  8019de:	5d                   	pop    %rbp
  8019df:	c3                   	retq   

00000000008019e0 <sys_cputs>:
  8019e0:	55                   	push   %rbp
  8019e1:	48 89 e5             	mov    %rsp,%rbp
  8019e4:	48 83 ec 10          	sub    $0x10,%rsp
  8019e8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8019ec:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8019f4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019f8:	48 83 ec 08          	sub    $0x8,%rsp
  8019fc:	6a 00                	pushq  $0x0
  8019fe:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a04:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a0a:	48 89 d1             	mov    %rdx,%rcx
  801a0d:	48 89 c2             	mov    %rax,%rdx
  801a10:	be 00 00 00 00       	mov    $0x0,%esi
  801a15:	bf 00 00 00 00       	mov    $0x0,%edi
  801a1a:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801a21:	00 00 00 
  801a24:	ff d0                	callq  *%rax
  801a26:	48 83 c4 10          	add    $0x10,%rsp
  801a2a:	90                   	nop
  801a2b:	c9                   	leaveq 
  801a2c:	c3                   	retq   

0000000000801a2d <sys_cgetc>:
  801a2d:	55                   	push   %rbp
  801a2e:	48 89 e5             	mov    %rsp,%rbp
  801a31:	48 83 ec 08          	sub    $0x8,%rsp
  801a35:	6a 00                	pushq  $0x0
  801a37:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a3d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a43:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a48:	ba 00 00 00 00       	mov    $0x0,%edx
  801a4d:	be 00 00 00 00       	mov    $0x0,%esi
  801a52:	bf 01 00 00 00       	mov    $0x1,%edi
  801a57:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801a5e:	00 00 00 
  801a61:	ff d0                	callq  *%rax
  801a63:	48 83 c4 10          	add    $0x10,%rsp
  801a67:	c9                   	leaveq 
  801a68:	c3                   	retq   

0000000000801a69 <sys_env_destroy>:
  801a69:	55                   	push   %rbp
  801a6a:	48 89 e5             	mov    %rsp,%rbp
  801a6d:	48 83 ec 10          	sub    $0x10,%rsp
  801a71:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a74:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a77:	48 98                	cltq   
  801a79:	48 83 ec 08          	sub    $0x8,%rsp
  801a7d:	6a 00                	pushq  $0x0
  801a7f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a85:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a8b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a90:	48 89 c2             	mov    %rax,%rdx
  801a93:	be 01 00 00 00       	mov    $0x1,%esi
  801a98:	bf 03 00 00 00       	mov    $0x3,%edi
  801a9d:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801aa4:	00 00 00 
  801aa7:	ff d0                	callq  *%rax
  801aa9:	48 83 c4 10          	add    $0x10,%rsp
  801aad:	c9                   	leaveq 
  801aae:	c3                   	retq   

0000000000801aaf <sys_getenvid>:
  801aaf:	55                   	push   %rbp
  801ab0:	48 89 e5             	mov    %rsp,%rbp
  801ab3:	48 83 ec 08          	sub    $0x8,%rsp
  801ab7:	6a 00                	pushq  $0x0
  801ab9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801abf:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ac5:	b9 00 00 00 00       	mov    $0x0,%ecx
  801aca:	ba 00 00 00 00       	mov    $0x0,%edx
  801acf:	be 00 00 00 00       	mov    $0x0,%esi
  801ad4:	bf 02 00 00 00       	mov    $0x2,%edi
  801ad9:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801ae0:	00 00 00 
  801ae3:	ff d0                	callq  *%rax
  801ae5:	48 83 c4 10          	add    $0x10,%rsp
  801ae9:	c9                   	leaveq 
  801aea:	c3                   	retq   

0000000000801aeb <sys_yield>:
  801aeb:	55                   	push   %rbp
  801aec:	48 89 e5             	mov    %rsp,%rbp
  801aef:	48 83 ec 08          	sub    $0x8,%rsp
  801af3:	6a 00                	pushq  $0x0
  801af5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801afb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b01:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b06:	ba 00 00 00 00       	mov    $0x0,%edx
  801b0b:	be 00 00 00 00       	mov    $0x0,%esi
  801b10:	bf 0b 00 00 00       	mov    $0xb,%edi
  801b15:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801b1c:	00 00 00 
  801b1f:	ff d0                	callq  *%rax
  801b21:	48 83 c4 10          	add    $0x10,%rsp
  801b25:	90                   	nop
  801b26:	c9                   	leaveq 
  801b27:	c3                   	retq   

0000000000801b28 <sys_page_alloc>:
  801b28:	55                   	push   %rbp
  801b29:	48 89 e5             	mov    %rsp,%rbp
  801b2c:	48 83 ec 10          	sub    $0x10,%rsp
  801b30:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b33:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b37:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801b3a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b3d:	48 63 c8             	movslq %eax,%rcx
  801b40:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b44:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b47:	48 98                	cltq   
  801b49:	48 83 ec 08          	sub    $0x8,%rsp
  801b4d:	6a 00                	pushq  $0x0
  801b4f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b55:	49 89 c8             	mov    %rcx,%r8
  801b58:	48 89 d1             	mov    %rdx,%rcx
  801b5b:	48 89 c2             	mov    %rax,%rdx
  801b5e:	be 01 00 00 00       	mov    $0x1,%esi
  801b63:	bf 04 00 00 00       	mov    $0x4,%edi
  801b68:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801b6f:	00 00 00 
  801b72:	ff d0                	callq  *%rax
  801b74:	48 83 c4 10          	add    $0x10,%rsp
  801b78:	c9                   	leaveq 
  801b79:	c3                   	retq   

0000000000801b7a <sys_page_map>:
  801b7a:	55                   	push   %rbp
  801b7b:	48 89 e5             	mov    %rsp,%rbp
  801b7e:	48 83 ec 20          	sub    $0x20,%rsp
  801b82:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b85:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b89:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801b8c:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801b90:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801b94:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801b97:	48 63 c8             	movslq %eax,%rcx
  801b9a:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801b9e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ba1:	48 63 f0             	movslq %eax,%rsi
  801ba4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ba8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bab:	48 98                	cltq   
  801bad:	48 83 ec 08          	sub    $0x8,%rsp
  801bb1:	51                   	push   %rcx
  801bb2:	49 89 f9             	mov    %rdi,%r9
  801bb5:	49 89 f0             	mov    %rsi,%r8
  801bb8:	48 89 d1             	mov    %rdx,%rcx
  801bbb:	48 89 c2             	mov    %rax,%rdx
  801bbe:	be 01 00 00 00       	mov    $0x1,%esi
  801bc3:	bf 05 00 00 00       	mov    $0x5,%edi
  801bc8:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801bcf:	00 00 00 
  801bd2:	ff d0                	callq  *%rax
  801bd4:	48 83 c4 10          	add    $0x10,%rsp
  801bd8:	c9                   	leaveq 
  801bd9:	c3                   	retq   

0000000000801bda <sys_page_unmap>:
  801bda:	55                   	push   %rbp
  801bdb:	48 89 e5             	mov    %rsp,%rbp
  801bde:	48 83 ec 10          	sub    $0x10,%rsp
  801be2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801be5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801be9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bf0:	48 98                	cltq   
  801bf2:	48 83 ec 08          	sub    $0x8,%rsp
  801bf6:	6a 00                	pushq  $0x0
  801bf8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bfe:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c04:	48 89 d1             	mov    %rdx,%rcx
  801c07:	48 89 c2             	mov    %rax,%rdx
  801c0a:	be 01 00 00 00       	mov    $0x1,%esi
  801c0f:	bf 06 00 00 00       	mov    $0x6,%edi
  801c14:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801c1b:	00 00 00 
  801c1e:	ff d0                	callq  *%rax
  801c20:	48 83 c4 10          	add    $0x10,%rsp
  801c24:	c9                   	leaveq 
  801c25:	c3                   	retq   

0000000000801c26 <sys_env_set_status>:
  801c26:	55                   	push   %rbp
  801c27:	48 89 e5             	mov    %rsp,%rbp
  801c2a:	48 83 ec 10          	sub    $0x10,%rsp
  801c2e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c31:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801c34:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c37:	48 63 d0             	movslq %eax,%rdx
  801c3a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c3d:	48 98                	cltq   
  801c3f:	48 83 ec 08          	sub    $0x8,%rsp
  801c43:	6a 00                	pushq  $0x0
  801c45:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c4b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c51:	48 89 d1             	mov    %rdx,%rcx
  801c54:	48 89 c2             	mov    %rax,%rdx
  801c57:	be 01 00 00 00       	mov    $0x1,%esi
  801c5c:	bf 08 00 00 00       	mov    $0x8,%edi
  801c61:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801c68:	00 00 00 
  801c6b:	ff d0                	callq  *%rax
  801c6d:	48 83 c4 10          	add    $0x10,%rsp
  801c71:	c9                   	leaveq 
  801c72:	c3                   	retq   

0000000000801c73 <sys_env_set_trapframe>:
  801c73:	55                   	push   %rbp
  801c74:	48 89 e5             	mov    %rsp,%rbp
  801c77:	48 83 ec 10          	sub    $0x10,%rsp
  801c7b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c7e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c82:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c86:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c89:	48 98                	cltq   
  801c8b:	48 83 ec 08          	sub    $0x8,%rsp
  801c8f:	6a 00                	pushq  $0x0
  801c91:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c97:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c9d:	48 89 d1             	mov    %rdx,%rcx
  801ca0:	48 89 c2             	mov    %rax,%rdx
  801ca3:	be 01 00 00 00       	mov    $0x1,%esi
  801ca8:	bf 09 00 00 00       	mov    $0x9,%edi
  801cad:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801cb4:	00 00 00 
  801cb7:	ff d0                	callq  *%rax
  801cb9:	48 83 c4 10          	add    $0x10,%rsp
  801cbd:	c9                   	leaveq 
  801cbe:	c3                   	retq   

0000000000801cbf <sys_env_set_pgfault_upcall>:
  801cbf:	55                   	push   %rbp
  801cc0:	48 89 e5             	mov    %rsp,%rbp
  801cc3:	48 83 ec 10          	sub    $0x10,%rsp
  801cc7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cca:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801cce:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801cd2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cd5:	48 98                	cltq   
  801cd7:	48 83 ec 08          	sub    $0x8,%rsp
  801cdb:	6a 00                	pushq  $0x0
  801cdd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ce3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ce9:	48 89 d1             	mov    %rdx,%rcx
  801cec:	48 89 c2             	mov    %rax,%rdx
  801cef:	be 01 00 00 00       	mov    $0x1,%esi
  801cf4:	bf 0a 00 00 00       	mov    $0xa,%edi
  801cf9:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801d00:	00 00 00 
  801d03:	ff d0                	callq  *%rax
  801d05:	48 83 c4 10          	add    $0x10,%rsp
  801d09:	c9                   	leaveq 
  801d0a:	c3                   	retq   

0000000000801d0b <sys_ipc_try_send>:
  801d0b:	55                   	push   %rbp
  801d0c:	48 89 e5             	mov    %rsp,%rbp
  801d0f:	48 83 ec 20          	sub    $0x20,%rsp
  801d13:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d16:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d1a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801d1e:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801d21:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d24:	48 63 f0             	movslq %eax,%rsi
  801d27:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801d2b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d2e:	48 98                	cltq   
  801d30:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d34:	48 83 ec 08          	sub    $0x8,%rsp
  801d38:	6a 00                	pushq  $0x0
  801d3a:	49 89 f1             	mov    %rsi,%r9
  801d3d:	49 89 c8             	mov    %rcx,%r8
  801d40:	48 89 d1             	mov    %rdx,%rcx
  801d43:	48 89 c2             	mov    %rax,%rdx
  801d46:	be 00 00 00 00       	mov    $0x0,%esi
  801d4b:	bf 0c 00 00 00       	mov    $0xc,%edi
  801d50:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801d57:	00 00 00 
  801d5a:	ff d0                	callq  *%rax
  801d5c:	48 83 c4 10          	add    $0x10,%rsp
  801d60:	c9                   	leaveq 
  801d61:	c3                   	retq   

0000000000801d62 <sys_ipc_recv>:
  801d62:	55                   	push   %rbp
  801d63:	48 89 e5             	mov    %rsp,%rbp
  801d66:	48 83 ec 10          	sub    $0x10,%rsp
  801d6a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d6e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d72:	48 83 ec 08          	sub    $0x8,%rsp
  801d76:	6a 00                	pushq  $0x0
  801d78:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d7e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d84:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d89:	48 89 c2             	mov    %rax,%rdx
  801d8c:	be 01 00 00 00       	mov    $0x1,%esi
  801d91:	bf 0d 00 00 00       	mov    $0xd,%edi
  801d96:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801d9d:	00 00 00 
  801da0:	ff d0                	callq  *%rax
  801da2:	48 83 c4 10          	add    $0x10,%rsp
  801da6:	c9                   	leaveq 
  801da7:	c3                   	retq   

0000000000801da8 <sys_time_msec>:
  801da8:	55                   	push   %rbp
  801da9:	48 89 e5             	mov    %rsp,%rbp
  801dac:	48 83 ec 08          	sub    $0x8,%rsp
  801db0:	6a 00                	pushq  $0x0
  801db2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801db8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dbe:	b9 00 00 00 00       	mov    $0x0,%ecx
  801dc3:	ba 00 00 00 00       	mov    $0x0,%edx
  801dc8:	be 00 00 00 00       	mov    $0x0,%esi
  801dcd:	bf 0e 00 00 00       	mov    $0xe,%edi
  801dd2:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801dd9:	00 00 00 
  801ddc:	ff d0                	callq  *%rax
  801dde:	48 83 c4 10          	add    $0x10,%rsp
  801de2:	c9                   	leaveq 
  801de3:	c3                   	retq   

0000000000801de4 <sys_net_transmit>:
  801de4:	55                   	push   %rbp
  801de5:	48 89 e5             	mov    %rsp,%rbp
  801de8:	48 83 ec 10          	sub    $0x10,%rsp
  801dec:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801df0:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801df3:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801df6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dfa:	48 83 ec 08          	sub    $0x8,%rsp
  801dfe:	6a 00                	pushq  $0x0
  801e00:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e06:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e0c:	48 89 d1             	mov    %rdx,%rcx
  801e0f:	48 89 c2             	mov    %rax,%rdx
  801e12:	be 00 00 00 00       	mov    $0x0,%esi
  801e17:	bf 0f 00 00 00       	mov    $0xf,%edi
  801e1c:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801e23:	00 00 00 
  801e26:	ff d0                	callq  *%rax
  801e28:	48 83 c4 10          	add    $0x10,%rsp
  801e2c:	c9                   	leaveq 
  801e2d:	c3                   	retq   

0000000000801e2e <sys_net_receive>:
  801e2e:	55                   	push   %rbp
  801e2f:	48 89 e5             	mov    %rsp,%rbp
  801e32:	48 83 ec 10          	sub    $0x10,%rsp
  801e36:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e3a:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801e3d:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801e40:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e44:	48 83 ec 08          	sub    $0x8,%rsp
  801e48:	6a 00                	pushq  $0x0
  801e4a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e50:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e56:	48 89 d1             	mov    %rdx,%rcx
  801e59:	48 89 c2             	mov    %rax,%rdx
  801e5c:	be 00 00 00 00       	mov    $0x0,%esi
  801e61:	bf 10 00 00 00       	mov    $0x10,%edi
  801e66:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801e6d:	00 00 00 
  801e70:	ff d0                	callq  *%rax
  801e72:	48 83 c4 10          	add    $0x10,%rsp
  801e76:	c9                   	leaveq 
  801e77:	c3                   	retq   

0000000000801e78 <sys_ept_map>:
  801e78:	55                   	push   %rbp
  801e79:	48 89 e5             	mov    %rsp,%rbp
  801e7c:	48 83 ec 20          	sub    $0x20,%rsp
  801e80:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e83:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e87:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801e8a:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801e8e:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801e92:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801e95:	48 63 c8             	movslq %eax,%rcx
  801e98:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801e9c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e9f:	48 63 f0             	movslq %eax,%rsi
  801ea2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ea6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ea9:	48 98                	cltq   
  801eab:	48 83 ec 08          	sub    $0x8,%rsp
  801eaf:	51                   	push   %rcx
  801eb0:	49 89 f9             	mov    %rdi,%r9
  801eb3:	49 89 f0             	mov    %rsi,%r8
  801eb6:	48 89 d1             	mov    %rdx,%rcx
  801eb9:	48 89 c2             	mov    %rax,%rdx
  801ebc:	be 00 00 00 00       	mov    $0x0,%esi
  801ec1:	bf 11 00 00 00       	mov    $0x11,%edi
  801ec6:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801ecd:	00 00 00 
  801ed0:	ff d0                	callq  *%rax
  801ed2:	48 83 c4 10          	add    $0x10,%rsp
  801ed6:	c9                   	leaveq 
  801ed7:	c3                   	retq   

0000000000801ed8 <sys_env_mkguest>:
  801ed8:	55                   	push   %rbp
  801ed9:	48 89 e5             	mov    %rsp,%rbp
  801edc:	48 83 ec 10          	sub    $0x10,%rsp
  801ee0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ee4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ee8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801eec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ef0:	48 83 ec 08          	sub    $0x8,%rsp
  801ef4:	6a 00                	pushq  $0x0
  801ef6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801efc:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f02:	48 89 d1             	mov    %rdx,%rcx
  801f05:	48 89 c2             	mov    %rax,%rdx
  801f08:	be 00 00 00 00       	mov    $0x0,%esi
  801f0d:	bf 12 00 00 00       	mov    $0x12,%edi
  801f12:	48 b8 52 19 80 00 00 	movabs $0x801952,%rax
  801f19:	00 00 00 
  801f1c:	ff d0                	callq  *%rax
  801f1e:	48 83 c4 10          	add    $0x10,%rsp
  801f22:	c9                   	leaveq 
  801f23:	c3                   	retq   

0000000000801f24 <pgfault>:
  801f24:	55                   	push   %rbp
  801f25:	48 89 e5             	mov    %rsp,%rbp
  801f28:	48 83 ec 30          	sub    $0x30,%rsp
  801f2c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801f30:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f34:	48 8b 00             	mov    (%rax),%rax
  801f37:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801f3b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f3f:	48 8b 40 08          	mov    0x8(%rax),%rax
  801f43:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801f46:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f49:	83 e0 02             	and    $0x2,%eax
  801f4c:	85 c0                	test   %eax,%eax
  801f4e:	75 40                	jne    801f90 <pgfault+0x6c>
  801f50:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f54:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  801f5b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f5f:	49 89 d0             	mov    %rdx,%r8
  801f62:	48 89 c1             	mov    %rax,%rcx
  801f65:	48 ba 18 50 80 00 00 	movabs $0x805018,%rdx
  801f6c:	00 00 00 
  801f6f:	be 1f 00 00 00       	mov    $0x1f,%esi
  801f74:	48 bf 31 50 80 00 00 	movabs $0x805031,%rdi
  801f7b:	00 00 00 
  801f7e:	b8 00 00 00 00       	mov    $0x0,%eax
  801f83:	49 b9 2e 04 80 00 00 	movabs $0x80042e,%r9
  801f8a:	00 00 00 
  801f8d:	41 ff d1             	callq  *%r9
  801f90:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f94:	48 c1 e8 0c          	shr    $0xc,%rax
  801f98:	48 89 c2             	mov    %rax,%rdx
  801f9b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801fa2:	01 00 00 
  801fa5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fa9:	25 07 08 00 00       	and    $0x807,%eax
  801fae:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  801fb4:	74 4e                	je     802004 <pgfault+0xe0>
  801fb6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801fba:	48 c1 e8 0c          	shr    $0xc,%rax
  801fbe:	48 89 c2             	mov    %rax,%rdx
  801fc1:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801fc8:	01 00 00 
  801fcb:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  801fcf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801fd3:	49 89 d0             	mov    %rdx,%r8
  801fd6:	48 89 c1             	mov    %rax,%rcx
  801fd9:	48 ba 40 50 80 00 00 	movabs $0x805040,%rdx
  801fe0:	00 00 00 
  801fe3:	be 22 00 00 00       	mov    $0x22,%esi
  801fe8:	48 bf 31 50 80 00 00 	movabs $0x805031,%rdi
  801fef:	00 00 00 
  801ff2:	b8 00 00 00 00       	mov    $0x0,%eax
  801ff7:	49 b9 2e 04 80 00 00 	movabs $0x80042e,%r9
  801ffe:	00 00 00 
  802001:	41 ff d1             	callq  *%r9
  802004:	ba 07 00 00 00       	mov    $0x7,%edx
  802009:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  80200e:	bf 00 00 00 00       	mov    $0x0,%edi
  802013:	48 b8 28 1b 80 00 00 	movabs $0x801b28,%rax
  80201a:	00 00 00 
  80201d:	ff d0                	callq  *%rax
  80201f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802022:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802026:	79 30                	jns    802058 <pgfault+0x134>
  802028:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80202b:	89 c1                	mov    %eax,%ecx
  80202d:	48 ba 6b 50 80 00 00 	movabs $0x80506b,%rdx
  802034:	00 00 00 
  802037:	be 30 00 00 00       	mov    $0x30,%esi
  80203c:	48 bf 31 50 80 00 00 	movabs $0x805031,%rdi
  802043:	00 00 00 
  802046:	b8 00 00 00 00       	mov    $0x0,%eax
  80204b:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  802052:	00 00 00 
  802055:	41 ff d0             	callq  *%r8
  802058:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80205c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802060:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802064:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  80206a:	ba 00 10 00 00       	mov    $0x1000,%edx
  80206f:	48 89 c6             	mov    %rax,%rsi
  802072:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  802077:	48 b8 1d 15 80 00 00 	movabs $0x80151d,%rax
  80207e:	00 00 00 
  802081:	ff d0                	callq  *%rax
  802083:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802087:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80208b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80208f:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802095:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  80209b:	48 89 c1             	mov    %rax,%rcx
  80209e:	ba 00 00 00 00       	mov    $0x0,%edx
  8020a3:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8020a8:	bf 00 00 00 00       	mov    $0x0,%edi
  8020ad:	48 b8 7a 1b 80 00 00 	movabs $0x801b7a,%rax
  8020b4:	00 00 00 
  8020b7:	ff d0                	callq  *%rax
  8020b9:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8020bc:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8020c0:	79 30                	jns    8020f2 <pgfault+0x1ce>
  8020c2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020c5:	89 c1                	mov    %eax,%ecx
  8020c7:	48 ba 7e 50 80 00 00 	movabs $0x80507e,%rdx
  8020ce:	00 00 00 
  8020d1:	be 35 00 00 00       	mov    $0x35,%esi
  8020d6:	48 bf 31 50 80 00 00 	movabs $0x805031,%rdi
  8020dd:	00 00 00 
  8020e0:	b8 00 00 00 00       	mov    $0x0,%eax
  8020e5:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  8020ec:	00 00 00 
  8020ef:	41 ff d0             	callq  *%r8
  8020f2:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8020f7:	bf 00 00 00 00       	mov    $0x0,%edi
  8020fc:	48 b8 da 1b 80 00 00 	movabs $0x801bda,%rax
  802103:	00 00 00 
  802106:	ff d0                	callq  *%rax
  802108:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80210b:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80210f:	79 30                	jns    802141 <pgfault+0x21d>
  802111:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802114:	89 c1                	mov    %eax,%ecx
  802116:	48 ba 8f 50 80 00 00 	movabs $0x80508f,%rdx
  80211d:	00 00 00 
  802120:	be 39 00 00 00       	mov    $0x39,%esi
  802125:	48 bf 31 50 80 00 00 	movabs $0x805031,%rdi
  80212c:	00 00 00 
  80212f:	b8 00 00 00 00       	mov    $0x0,%eax
  802134:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  80213b:	00 00 00 
  80213e:	41 ff d0             	callq  *%r8
  802141:	90                   	nop
  802142:	c9                   	leaveq 
  802143:	c3                   	retq   

0000000000802144 <duppage>:
  802144:	55                   	push   %rbp
  802145:	48 89 e5             	mov    %rsp,%rbp
  802148:	48 83 ec 30          	sub    $0x30,%rsp
  80214c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80214f:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802152:	8b 45 d8             	mov    -0x28(%rbp),%eax
  802155:	c1 e0 0c             	shl    $0xc,%eax
  802158:	89 c0                	mov    %eax,%eax
  80215a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80215e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802165:	01 00 00 
  802168:	8b 55 d8             	mov    -0x28(%rbp),%edx
  80216b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80216f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802173:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802177:	25 02 08 00 00       	and    $0x802,%eax
  80217c:	48 85 c0             	test   %rax,%rax
  80217f:	74 0e                	je     80218f <duppage+0x4b>
  802181:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802185:	25 00 04 00 00       	and    $0x400,%eax
  80218a:	48 85 c0             	test   %rax,%rax
  80218d:	74 70                	je     8021ff <duppage+0xbb>
  80218f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802193:	25 07 0e 00 00       	and    $0xe07,%eax
  802198:	89 c6                	mov    %eax,%esi
  80219a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  80219e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8021a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8021a5:	41 89 f0             	mov    %esi,%r8d
  8021a8:	48 89 c6             	mov    %rax,%rsi
  8021ab:	bf 00 00 00 00       	mov    $0x0,%edi
  8021b0:	48 b8 7a 1b 80 00 00 	movabs $0x801b7a,%rax
  8021b7:	00 00 00 
  8021ba:	ff d0                	callq  *%rax
  8021bc:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8021bf:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8021c3:	79 30                	jns    8021f5 <duppage+0xb1>
  8021c5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8021c8:	89 c1                	mov    %eax,%ecx
  8021ca:	48 ba 7e 50 80 00 00 	movabs $0x80507e,%rdx
  8021d1:	00 00 00 
  8021d4:	be 63 00 00 00       	mov    $0x63,%esi
  8021d9:	48 bf 31 50 80 00 00 	movabs $0x805031,%rdi
  8021e0:	00 00 00 
  8021e3:	b8 00 00 00 00       	mov    $0x0,%eax
  8021e8:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  8021ef:	00 00 00 
  8021f2:	41 ff d0             	callq  *%r8
  8021f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8021fa:	e9 c4 00 00 00       	jmpq   8022c3 <duppage+0x17f>
  8021ff:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802203:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802206:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80220a:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802210:	48 89 c6             	mov    %rax,%rsi
  802213:	bf 00 00 00 00       	mov    $0x0,%edi
  802218:	48 b8 7a 1b 80 00 00 	movabs $0x801b7a,%rax
  80221f:	00 00 00 
  802222:	ff d0                	callq  *%rax
  802224:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802227:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80222b:	79 30                	jns    80225d <duppage+0x119>
  80222d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802230:	89 c1                	mov    %eax,%ecx
  802232:	48 ba 7e 50 80 00 00 	movabs $0x80507e,%rdx
  802239:	00 00 00 
  80223c:	be 7e 00 00 00       	mov    $0x7e,%esi
  802241:	48 bf 31 50 80 00 00 	movabs $0x805031,%rdi
  802248:	00 00 00 
  80224b:	b8 00 00 00 00       	mov    $0x0,%eax
  802250:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  802257:	00 00 00 
  80225a:	41 ff d0             	callq  *%r8
  80225d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802261:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802265:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  80226b:	48 89 d1             	mov    %rdx,%rcx
  80226e:	ba 00 00 00 00       	mov    $0x0,%edx
  802273:	48 89 c6             	mov    %rax,%rsi
  802276:	bf 00 00 00 00       	mov    $0x0,%edi
  80227b:	48 b8 7a 1b 80 00 00 	movabs $0x801b7a,%rax
  802282:	00 00 00 
  802285:	ff d0                	callq  *%rax
  802287:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80228a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80228e:	79 30                	jns    8022c0 <duppage+0x17c>
  802290:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802293:	89 c1                	mov    %eax,%ecx
  802295:	48 ba 7e 50 80 00 00 	movabs $0x80507e,%rdx
  80229c:	00 00 00 
  80229f:	be 80 00 00 00       	mov    $0x80,%esi
  8022a4:	48 bf 31 50 80 00 00 	movabs $0x805031,%rdi
  8022ab:	00 00 00 
  8022ae:	b8 00 00 00 00       	mov    $0x0,%eax
  8022b3:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  8022ba:	00 00 00 
  8022bd:	41 ff d0             	callq  *%r8
  8022c0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8022c3:	c9                   	leaveq 
  8022c4:	c3                   	retq   

00000000008022c5 <fork>:
  8022c5:	55                   	push   %rbp
  8022c6:	48 89 e5             	mov    %rsp,%rbp
  8022c9:	48 83 ec 20          	sub    $0x20,%rsp
  8022cd:	48 bf 24 1f 80 00 00 	movabs $0x801f24,%rdi
  8022d4:	00 00 00 
  8022d7:	48 b8 b2 48 80 00 00 	movabs $0x8048b2,%rax
  8022de:	00 00 00 
  8022e1:	ff d0                	callq  *%rax
  8022e3:	b8 07 00 00 00       	mov    $0x7,%eax
  8022e8:	cd 30                	int    $0x30
  8022ea:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8022ed:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8022f0:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8022f3:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8022f7:	79 08                	jns    802301 <fork+0x3c>
  8022f9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8022fc:	e9 0b 02 00 00       	jmpq   80250c <fork+0x247>
  802301:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802305:	75 3e                	jne    802345 <fork+0x80>
  802307:	48 b8 af 1a 80 00 00 	movabs $0x801aaf,%rax
  80230e:	00 00 00 
  802311:	ff d0                	callq  *%rax
  802313:	25 ff 03 00 00       	and    $0x3ff,%eax
  802318:	48 98                	cltq   
  80231a:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  802321:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802328:	00 00 00 
  80232b:	48 01 c2             	add    %rax,%rdx
  80232e:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802335:	00 00 00 
  802338:	48 89 10             	mov    %rdx,(%rax)
  80233b:	b8 00 00 00 00       	mov    $0x0,%eax
  802340:	e9 c7 01 00 00       	jmpq   80250c <fork+0x247>
  802345:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80234c:	e9 a6 00 00 00       	jmpq   8023f7 <fork+0x132>
  802351:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802354:	c1 f8 12             	sar    $0x12,%eax
  802357:	89 c2                	mov    %eax,%edx
  802359:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  802360:	01 00 00 
  802363:	48 63 d2             	movslq %edx,%rdx
  802366:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80236a:	83 e0 01             	and    $0x1,%eax
  80236d:	48 85 c0             	test   %rax,%rax
  802370:	74 21                	je     802393 <fork+0xce>
  802372:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802375:	c1 f8 09             	sar    $0x9,%eax
  802378:	89 c2                	mov    %eax,%edx
  80237a:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802381:	01 00 00 
  802384:	48 63 d2             	movslq %edx,%rdx
  802387:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80238b:	83 e0 01             	and    $0x1,%eax
  80238e:	48 85 c0             	test   %rax,%rax
  802391:	75 09                	jne    80239c <fork+0xd7>
  802393:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  80239a:	eb 5b                	jmp    8023f7 <fork+0x132>
  80239c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80239f:	05 00 02 00 00       	add    $0x200,%eax
  8023a4:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8023a7:	eb 46                	jmp    8023ef <fork+0x12a>
  8023a9:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8023b0:	01 00 00 
  8023b3:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8023b6:	48 63 d2             	movslq %edx,%rdx
  8023b9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8023bd:	83 e0 05             	and    $0x5,%eax
  8023c0:	48 83 f8 05          	cmp    $0x5,%rax
  8023c4:	75 21                	jne    8023e7 <fork+0x122>
  8023c6:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  8023cd:	74 1b                	je     8023ea <fork+0x125>
  8023cf:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8023d2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023d5:	89 d6                	mov    %edx,%esi
  8023d7:	89 c7                	mov    %eax,%edi
  8023d9:	48 b8 44 21 80 00 00 	movabs $0x802144,%rax
  8023e0:	00 00 00 
  8023e3:	ff d0                	callq  *%rax
  8023e5:	eb 04                	jmp    8023eb <fork+0x126>
  8023e7:	90                   	nop
  8023e8:	eb 01                	jmp    8023eb <fork+0x126>
  8023ea:	90                   	nop
  8023eb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8023ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023f2:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8023f5:	7c b2                	jl     8023a9 <fork+0xe4>
  8023f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023fa:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  8023ff:	0f 86 4c ff ff ff    	jbe    802351 <fork+0x8c>
  802405:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802408:	ba 07 00 00 00       	mov    $0x7,%edx
  80240d:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  802412:	89 c7                	mov    %eax,%edi
  802414:	48 b8 28 1b 80 00 00 	movabs $0x801b28,%rax
  80241b:	00 00 00 
  80241e:	ff d0                	callq  *%rax
  802420:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802423:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802427:	79 30                	jns    802459 <fork+0x194>
  802429:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80242c:	89 c1                	mov    %eax,%ecx
  80242e:	48 ba a8 50 80 00 00 	movabs $0x8050a8,%rdx
  802435:	00 00 00 
  802438:	be bc 00 00 00       	mov    $0xbc,%esi
  80243d:	48 bf 31 50 80 00 00 	movabs $0x805031,%rdi
  802444:	00 00 00 
  802447:	b8 00 00 00 00       	mov    $0x0,%eax
  80244c:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  802453:	00 00 00 
  802456:	41 ff d0             	callq  *%r8
  802459:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802460:	00 00 00 
  802463:	48 8b 00             	mov    (%rax),%rax
  802466:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  80246d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802470:	48 89 d6             	mov    %rdx,%rsi
  802473:	89 c7                	mov    %eax,%edi
  802475:	48 b8 bf 1c 80 00 00 	movabs $0x801cbf,%rax
  80247c:	00 00 00 
  80247f:	ff d0                	callq  *%rax
  802481:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802484:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802488:	79 30                	jns    8024ba <fork+0x1f5>
  80248a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80248d:	89 c1                	mov    %eax,%ecx
  80248f:	48 ba c8 50 80 00 00 	movabs $0x8050c8,%rdx
  802496:	00 00 00 
  802499:	be c0 00 00 00       	mov    $0xc0,%esi
  80249e:	48 bf 31 50 80 00 00 	movabs $0x805031,%rdi
  8024a5:	00 00 00 
  8024a8:	b8 00 00 00 00       	mov    $0x0,%eax
  8024ad:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  8024b4:	00 00 00 
  8024b7:	41 ff d0             	callq  *%r8
  8024ba:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024bd:	be 02 00 00 00       	mov    $0x2,%esi
  8024c2:	89 c7                	mov    %eax,%edi
  8024c4:	48 b8 26 1c 80 00 00 	movabs $0x801c26,%rax
  8024cb:	00 00 00 
  8024ce:	ff d0                	callq  *%rax
  8024d0:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8024d3:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8024d7:	79 30                	jns    802509 <fork+0x244>
  8024d9:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8024dc:	89 c1                	mov    %eax,%ecx
  8024de:	48 ba e7 50 80 00 00 	movabs $0x8050e7,%rdx
  8024e5:	00 00 00 
  8024e8:	be c5 00 00 00       	mov    $0xc5,%esi
  8024ed:	48 bf 31 50 80 00 00 	movabs $0x805031,%rdi
  8024f4:	00 00 00 
  8024f7:	b8 00 00 00 00       	mov    $0x0,%eax
  8024fc:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  802503:	00 00 00 
  802506:	41 ff d0             	callq  *%r8
  802509:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80250c:	c9                   	leaveq 
  80250d:	c3                   	retq   

000000000080250e <sfork>:
  80250e:	55                   	push   %rbp
  80250f:	48 89 e5             	mov    %rsp,%rbp
  802512:	48 ba fe 50 80 00 00 	movabs $0x8050fe,%rdx
  802519:	00 00 00 
  80251c:	be d2 00 00 00       	mov    $0xd2,%esi
  802521:	48 bf 31 50 80 00 00 	movabs $0x805031,%rdi
  802528:	00 00 00 
  80252b:	b8 00 00 00 00       	mov    $0x0,%eax
  802530:	48 b9 2e 04 80 00 00 	movabs $0x80042e,%rcx
  802537:	00 00 00 
  80253a:	ff d1                	callq  *%rcx

000000000080253c <ipc_recv>:
  80253c:	55                   	push   %rbp
  80253d:	48 89 e5             	mov    %rsp,%rbp
  802540:	48 83 ec 30          	sub    $0x30,%rsp
  802544:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802548:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80254c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802550:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802555:	75 0e                	jne    802565 <ipc_recv+0x29>
  802557:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80255e:	00 00 00 
  802561:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802565:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802569:	48 89 c7             	mov    %rax,%rdi
  80256c:	48 b8 62 1d 80 00 00 	movabs $0x801d62,%rax
  802573:	00 00 00 
  802576:	ff d0                	callq  *%rax
  802578:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80257b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80257f:	79 27                	jns    8025a8 <ipc_recv+0x6c>
  802581:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802586:	74 0a                	je     802592 <ipc_recv+0x56>
  802588:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80258c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  802592:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802597:	74 0a                	je     8025a3 <ipc_recv+0x67>
  802599:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80259d:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8025a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025a6:	eb 53                	jmp    8025fb <ipc_recv+0xbf>
  8025a8:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8025ad:	74 19                	je     8025c8 <ipc_recv+0x8c>
  8025af:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8025b6:	00 00 00 
  8025b9:	48 8b 00             	mov    (%rax),%rax
  8025bc:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8025c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025c6:	89 10                	mov    %edx,(%rax)
  8025c8:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8025cd:	74 19                	je     8025e8 <ipc_recv+0xac>
  8025cf:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8025d6:	00 00 00 
  8025d9:	48 8b 00             	mov    (%rax),%rax
  8025dc:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8025e2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8025e6:	89 10                	mov    %edx,(%rax)
  8025e8:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8025ef:	00 00 00 
  8025f2:	48 8b 00             	mov    (%rax),%rax
  8025f5:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8025fb:	c9                   	leaveq 
  8025fc:	c3                   	retq   

00000000008025fd <ipc_send>:
  8025fd:	55                   	push   %rbp
  8025fe:	48 89 e5             	mov    %rsp,%rbp
  802601:	48 83 ec 30          	sub    $0x30,%rsp
  802605:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802608:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80260b:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  80260f:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  802612:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802617:	75 1c                	jne    802635 <ipc_send+0x38>
  802619:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802620:	00 00 00 
  802623:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802627:	eb 0c                	jmp    802635 <ipc_send+0x38>
  802629:	48 b8 eb 1a 80 00 00 	movabs $0x801aeb,%rax
  802630:	00 00 00 
  802633:	ff d0                	callq  *%rax
  802635:	8b 75 e8             	mov    -0x18(%rbp),%esi
  802638:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  80263b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80263f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802642:	89 c7                	mov    %eax,%edi
  802644:	48 b8 0b 1d 80 00 00 	movabs $0x801d0b,%rax
  80264b:	00 00 00 
  80264e:	ff d0                	callq  *%rax
  802650:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802653:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  802657:	74 d0                	je     802629 <ipc_send+0x2c>
  802659:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80265d:	79 30                	jns    80268f <ipc_send+0x92>
  80265f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802662:	89 c1                	mov    %eax,%ecx
  802664:	48 ba 18 51 80 00 00 	movabs $0x805118,%rdx
  80266b:	00 00 00 
  80266e:	be 44 00 00 00       	mov    $0x44,%esi
  802673:	48 bf 2e 51 80 00 00 	movabs $0x80512e,%rdi
  80267a:	00 00 00 
  80267d:	b8 00 00 00 00       	mov    $0x0,%eax
  802682:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  802689:	00 00 00 
  80268c:	41 ff d0             	callq  *%r8
  80268f:	90                   	nop
  802690:	c9                   	leaveq 
  802691:	c3                   	retq   

0000000000802692 <ipc_host_recv>:
  802692:	55                   	push   %rbp
  802693:	48 89 e5             	mov    %rsp,%rbp
  802696:	48 83 ec 10          	sub    $0x10,%rsp
  80269a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80269e:	48 ba 40 51 80 00 00 	movabs $0x805140,%rdx
  8026a5:	00 00 00 
  8026a8:	be 4e 00 00 00       	mov    $0x4e,%esi
  8026ad:	48 bf 2e 51 80 00 00 	movabs $0x80512e,%rdi
  8026b4:	00 00 00 
  8026b7:	b8 00 00 00 00       	mov    $0x0,%eax
  8026bc:	48 b9 2e 04 80 00 00 	movabs $0x80042e,%rcx
  8026c3:	00 00 00 
  8026c6:	ff d1                	callq  *%rcx

00000000008026c8 <ipc_host_send>:
  8026c8:	55                   	push   %rbp
  8026c9:	48 89 e5             	mov    %rsp,%rbp
  8026cc:	48 83 ec 20          	sub    $0x20,%rsp
  8026d0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8026d3:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8026d6:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  8026da:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8026dd:	48 ba 60 51 80 00 00 	movabs $0x805160,%rdx
  8026e4:	00 00 00 
  8026e7:	be 58 00 00 00       	mov    $0x58,%esi
  8026ec:	48 bf 2e 51 80 00 00 	movabs $0x80512e,%rdi
  8026f3:	00 00 00 
  8026f6:	b8 00 00 00 00       	mov    $0x0,%eax
  8026fb:	48 b9 2e 04 80 00 00 	movabs $0x80042e,%rcx
  802702:	00 00 00 
  802705:	ff d1                	callq  *%rcx

0000000000802707 <ipc_find_env>:
  802707:	55                   	push   %rbp
  802708:	48 89 e5             	mov    %rsp,%rbp
  80270b:	48 83 ec 18          	sub    $0x18,%rsp
  80270f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802712:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802719:	eb 4d                	jmp    802768 <ipc_find_env+0x61>
  80271b:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802722:	00 00 00 
  802725:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802728:	48 98                	cltq   
  80272a:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802731:	48 01 d0             	add    %rdx,%rax
  802734:	48 05 d0 00 00 00    	add    $0xd0,%rax
  80273a:	8b 00                	mov    (%rax),%eax
  80273c:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80273f:	75 23                	jne    802764 <ipc_find_env+0x5d>
  802741:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802748:	00 00 00 
  80274b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80274e:	48 98                	cltq   
  802750:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802757:	48 01 d0             	add    %rdx,%rax
  80275a:	48 05 c8 00 00 00    	add    $0xc8,%rax
  802760:	8b 00                	mov    (%rax),%eax
  802762:	eb 12                	jmp    802776 <ipc_find_env+0x6f>
  802764:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802768:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  80276f:	7e aa                	jle    80271b <ipc_find_env+0x14>
  802771:	b8 00 00 00 00       	mov    $0x0,%eax
  802776:	c9                   	leaveq 
  802777:	c3                   	retq   

0000000000802778 <fd2num>:
  802778:	55                   	push   %rbp
  802779:	48 89 e5             	mov    %rsp,%rbp
  80277c:	48 83 ec 08          	sub    $0x8,%rsp
  802780:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802784:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802788:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  80278f:	ff ff ff 
  802792:	48 01 d0             	add    %rdx,%rax
  802795:	48 c1 e8 0c          	shr    $0xc,%rax
  802799:	c9                   	leaveq 
  80279a:	c3                   	retq   

000000000080279b <fd2data>:
  80279b:	55                   	push   %rbp
  80279c:	48 89 e5             	mov    %rsp,%rbp
  80279f:	48 83 ec 08          	sub    $0x8,%rsp
  8027a3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8027a7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8027ab:	48 89 c7             	mov    %rax,%rdi
  8027ae:	48 b8 78 27 80 00 00 	movabs $0x802778,%rax
  8027b5:	00 00 00 
  8027b8:	ff d0                	callq  *%rax
  8027ba:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  8027c0:	48 c1 e0 0c          	shl    $0xc,%rax
  8027c4:	c9                   	leaveq 
  8027c5:	c3                   	retq   

00000000008027c6 <fd_alloc>:
  8027c6:	55                   	push   %rbp
  8027c7:	48 89 e5             	mov    %rsp,%rbp
  8027ca:	48 83 ec 18          	sub    $0x18,%rsp
  8027ce:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8027d2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8027d9:	eb 6b                	jmp    802846 <fd_alloc+0x80>
  8027db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027de:	48 98                	cltq   
  8027e0:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8027e6:	48 c1 e0 0c          	shl    $0xc,%rax
  8027ea:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8027ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027f2:	48 c1 e8 15          	shr    $0x15,%rax
  8027f6:	48 89 c2             	mov    %rax,%rdx
  8027f9:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802800:	01 00 00 
  802803:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802807:	83 e0 01             	and    $0x1,%eax
  80280a:	48 85 c0             	test   %rax,%rax
  80280d:	74 21                	je     802830 <fd_alloc+0x6a>
  80280f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802813:	48 c1 e8 0c          	shr    $0xc,%rax
  802817:	48 89 c2             	mov    %rax,%rdx
  80281a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802821:	01 00 00 
  802824:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802828:	83 e0 01             	and    $0x1,%eax
  80282b:	48 85 c0             	test   %rax,%rax
  80282e:	75 12                	jne    802842 <fd_alloc+0x7c>
  802830:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802834:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802838:	48 89 10             	mov    %rdx,(%rax)
  80283b:	b8 00 00 00 00       	mov    $0x0,%eax
  802840:	eb 1a                	jmp    80285c <fd_alloc+0x96>
  802842:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802846:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80284a:	7e 8f                	jle    8027db <fd_alloc+0x15>
  80284c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802850:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802857:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  80285c:	c9                   	leaveq 
  80285d:	c3                   	retq   

000000000080285e <fd_lookup>:
  80285e:	55                   	push   %rbp
  80285f:	48 89 e5             	mov    %rsp,%rbp
  802862:	48 83 ec 20          	sub    $0x20,%rsp
  802866:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802869:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80286d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802871:	78 06                	js     802879 <fd_lookup+0x1b>
  802873:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802877:	7e 07                	jle    802880 <fd_lookup+0x22>
  802879:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80287e:	eb 6c                	jmp    8028ec <fd_lookup+0x8e>
  802880:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802883:	48 98                	cltq   
  802885:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80288b:	48 c1 e0 0c          	shl    $0xc,%rax
  80288f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802893:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802897:	48 c1 e8 15          	shr    $0x15,%rax
  80289b:	48 89 c2             	mov    %rax,%rdx
  80289e:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8028a5:	01 00 00 
  8028a8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8028ac:	83 e0 01             	and    $0x1,%eax
  8028af:	48 85 c0             	test   %rax,%rax
  8028b2:	74 21                	je     8028d5 <fd_lookup+0x77>
  8028b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8028b8:	48 c1 e8 0c          	shr    $0xc,%rax
  8028bc:	48 89 c2             	mov    %rax,%rdx
  8028bf:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8028c6:	01 00 00 
  8028c9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8028cd:	83 e0 01             	and    $0x1,%eax
  8028d0:	48 85 c0             	test   %rax,%rax
  8028d3:	75 07                	jne    8028dc <fd_lookup+0x7e>
  8028d5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8028da:	eb 10                	jmp    8028ec <fd_lookup+0x8e>
  8028dc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8028e0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8028e4:	48 89 10             	mov    %rdx,(%rax)
  8028e7:	b8 00 00 00 00       	mov    $0x0,%eax
  8028ec:	c9                   	leaveq 
  8028ed:	c3                   	retq   

00000000008028ee <fd_close>:
  8028ee:	55                   	push   %rbp
  8028ef:	48 89 e5             	mov    %rsp,%rbp
  8028f2:	48 83 ec 30          	sub    $0x30,%rsp
  8028f6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8028fa:	89 f0                	mov    %esi,%eax
  8028fc:	88 45 d4             	mov    %al,-0x2c(%rbp)
  8028ff:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802903:	48 89 c7             	mov    %rax,%rdi
  802906:	48 b8 78 27 80 00 00 	movabs $0x802778,%rax
  80290d:	00 00 00 
  802910:	ff d0                	callq  *%rax
  802912:	89 c2                	mov    %eax,%edx
  802914:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802918:	48 89 c6             	mov    %rax,%rsi
  80291b:	89 d7                	mov    %edx,%edi
  80291d:	48 b8 5e 28 80 00 00 	movabs $0x80285e,%rax
  802924:	00 00 00 
  802927:	ff d0                	callq  *%rax
  802929:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80292c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802930:	78 0a                	js     80293c <fd_close+0x4e>
  802932:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802936:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  80293a:	74 12                	je     80294e <fd_close+0x60>
  80293c:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802940:	74 05                	je     802947 <fd_close+0x59>
  802942:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802945:	eb 70                	jmp    8029b7 <fd_close+0xc9>
  802947:	b8 00 00 00 00       	mov    $0x0,%eax
  80294c:	eb 69                	jmp    8029b7 <fd_close+0xc9>
  80294e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802952:	8b 00                	mov    (%rax),%eax
  802954:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802958:	48 89 d6             	mov    %rdx,%rsi
  80295b:	89 c7                	mov    %eax,%edi
  80295d:	48 b8 b9 29 80 00 00 	movabs $0x8029b9,%rax
  802964:	00 00 00 
  802967:	ff d0                	callq  *%rax
  802969:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80296c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802970:	78 2a                	js     80299c <fd_close+0xae>
  802972:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802976:	48 8b 40 20          	mov    0x20(%rax),%rax
  80297a:	48 85 c0             	test   %rax,%rax
  80297d:	74 16                	je     802995 <fd_close+0xa7>
  80297f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802983:	48 8b 40 20          	mov    0x20(%rax),%rax
  802987:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80298b:	48 89 d7             	mov    %rdx,%rdi
  80298e:	ff d0                	callq  *%rax
  802990:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802993:	eb 07                	jmp    80299c <fd_close+0xae>
  802995:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80299c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029a0:	48 89 c6             	mov    %rax,%rsi
  8029a3:	bf 00 00 00 00       	mov    $0x0,%edi
  8029a8:	48 b8 da 1b 80 00 00 	movabs $0x801bda,%rax
  8029af:	00 00 00 
  8029b2:	ff d0                	callq  *%rax
  8029b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029b7:	c9                   	leaveq 
  8029b8:	c3                   	retq   

00000000008029b9 <dev_lookup>:
  8029b9:	55                   	push   %rbp
  8029ba:	48 89 e5             	mov    %rsp,%rbp
  8029bd:	48 83 ec 20          	sub    $0x20,%rsp
  8029c1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8029c4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8029c8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8029cf:	eb 41                	jmp    802a12 <dev_lookup+0x59>
  8029d1:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  8029d8:	00 00 00 
  8029db:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8029de:	48 63 d2             	movslq %edx,%rdx
  8029e1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8029e5:	8b 00                	mov    (%rax),%eax
  8029e7:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8029ea:	75 22                	jne    802a0e <dev_lookup+0x55>
  8029ec:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  8029f3:	00 00 00 
  8029f6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8029f9:	48 63 d2             	movslq %edx,%rdx
  8029fc:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802a00:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802a04:	48 89 10             	mov    %rdx,(%rax)
  802a07:	b8 00 00 00 00       	mov    $0x0,%eax
  802a0c:	eb 60                	jmp    802a6e <dev_lookup+0xb5>
  802a0e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802a12:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802a19:	00 00 00 
  802a1c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802a1f:	48 63 d2             	movslq %edx,%rdx
  802a22:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a26:	48 85 c0             	test   %rax,%rax
  802a29:	75 a6                	jne    8029d1 <dev_lookup+0x18>
  802a2b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802a32:	00 00 00 
  802a35:	48 8b 00             	mov    (%rax),%rax
  802a38:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802a3e:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802a41:	89 c6                	mov    %eax,%esi
  802a43:	48 bf 80 51 80 00 00 	movabs $0x805180,%rdi
  802a4a:	00 00 00 
  802a4d:	b8 00 00 00 00       	mov    $0x0,%eax
  802a52:	48 b9 68 06 80 00 00 	movabs $0x800668,%rcx
  802a59:	00 00 00 
  802a5c:	ff d1                	callq  *%rcx
  802a5e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802a62:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802a69:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802a6e:	c9                   	leaveq 
  802a6f:	c3                   	retq   

0000000000802a70 <close>:
  802a70:	55                   	push   %rbp
  802a71:	48 89 e5             	mov    %rsp,%rbp
  802a74:	48 83 ec 20          	sub    $0x20,%rsp
  802a78:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802a7b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802a7f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a82:	48 89 d6             	mov    %rdx,%rsi
  802a85:	89 c7                	mov    %eax,%edi
  802a87:	48 b8 5e 28 80 00 00 	movabs $0x80285e,%rax
  802a8e:	00 00 00 
  802a91:	ff d0                	callq  *%rax
  802a93:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a96:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a9a:	79 05                	jns    802aa1 <close+0x31>
  802a9c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a9f:	eb 18                	jmp    802ab9 <close+0x49>
  802aa1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802aa5:	be 01 00 00 00       	mov    $0x1,%esi
  802aaa:	48 89 c7             	mov    %rax,%rdi
  802aad:	48 b8 ee 28 80 00 00 	movabs $0x8028ee,%rax
  802ab4:	00 00 00 
  802ab7:	ff d0                	callq  *%rax
  802ab9:	c9                   	leaveq 
  802aba:	c3                   	retq   

0000000000802abb <close_all>:
  802abb:	55                   	push   %rbp
  802abc:	48 89 e5             	mov    %rsp,%rbp
  802abf:	48 83 ec 10          	sub    $0x10,%rsp
  802ac3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802aca:	eb 15                	jmp    802ae1 <close_all+0x26>
  802acc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802acf:	89 c7                	mov    %eax,%edi
  802ad1:	48 b8 70 2a 80 00 00 	movabs $0x802a70,%rax
  802ad8:	00 00 00 
  802adb:	ff d0                	callq  *%rax
  802add:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802ae1:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802ae5:	7e e5                	jle    802acc <close_all+0x11>
  802ae7:	90                   	nop
  802ae8:	c9                   	leaveq 
  802ae9:	c3                   	retq   

0000000000802aea <dup>:
  802aea:	55                   	push   %rbp
  802aeb:	48 89 e5             	mov    %rsp,%rbp
  802aee:	48 83 ec 40          	sub    $0x40,%rsp
  802af2:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802af5:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802af8:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802afc:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802aff:	48 89 d6             	mov    %rdx,%rsi
  802b02:	89 c7                	mov    %eax,%edi
  802b04:	48 b8 5e 28 80 00 00 	movabs $0x80285e,%rax
  802b0b:	00 00 00 
  802b0e:	ff d0                	callq  *%rax
  802b10:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b13:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b17:	79 08                	jns    802b21 <dup+0x37>
  802b19:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b1c:	e9 70 01 00 00       	jmpq   802c91 <dup+0x1a7>
  802b21:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802b24:	89 c7                	mov    %eax,%edi
  802b26:	48 b8 70 2a 80 00 00 	movabs $0x802a70,%rax
  802b2d:	00 00 00 
  802b30:	ff d0                	callq  *%rax
  802b32:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802b35:	48 98                	cltq   
  802b37:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802b3d:	48 c1 e0 0c          	shl    $0xc,%rax
  802b41:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802b45:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b49:	48 89 c7             	mov    %rax,%rdi
  802b4c:	48 b8 9b 27 80 00 00 	movabs $0x80279b,%rax
  802b53:	00 00 00 
  802b56:	ff d0                	callq  *%rax
  802b58:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802b5c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b60:	48 89 c7             	mov    %rax,%rdi
  802b63:	48 b8 9b 27 80 00 00 	movabs $0x80279b,%rax
  802b6a:	00 00 00 
  802b6d:	ff d0                	callq  *%rax
  802b6f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802b73:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b77:	48 c1 e8 15          	shr    $0x15,%rax
  802b7b:	48 89 c2             	mov    %rax,%rdx
  802b7e:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802b85:	01 00 00 
  802b88:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b8c:	83 e0 01             	and    $0x1,%eax
  802b8f:	48 85 c0             	test   %rax,%rax
  802b92:	74 71                	je     802c05 <dup+0x11b>
  802b94:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b98:	48 c1 e8 0c          	shr    $0xc,%rax
  802b9c:	48 89 c2             	mov    %rax,%rdx
  802b9f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802ba6:	01 00 00 
  802ba9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802bad:	83 e0 01             	and    $0x1,%eax
  802bb0:	48 85 c0             	test   %rax,%rax
  802bb3:	74 50                	je     802c05 <dup+0x11b>
  802bb5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bb9:	48 c1 e8 0c          	shr    $0xc,%rax
  802bbd:	48 89 c2             	mov    %rax,%rdx
  802bc0:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802bc7:	01 00 00 
  802bca:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802bce:	25 07 0e 00 00       	and    $0xe07,%eax
  802bd3:	89 c1                	mov    %eax,%ecx
  802bd5:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802bd9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bdd:	41 89 c8             	mov    %ecx,%r8d
  802be0:	48 89 d1             	mov    %rdx,%rcx
  802be3:	ba 00 00 00 00       	mov    $0x0,%edx
  802be8:	48 89 c6             	mov    %rax,%rsi
  802beb:	bf 00 00 00 00       	mov    $0x0,%edi
  802bf0:	48 b8 7a 1b 80 00 00 	movabs $0x801b7a,%rax
  802bf7:	00 00 00 
  802bfa:	ff d0                	callq  *%rax
  802bfc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bff:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c03:	78 55                	js     802c5a <dup+0x170>
  802c05:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c09:	48 c1 e8 0c          	shr    $0xc,%rax
  802c0d:	48 89 c2             	mov    %rax,%rdx
  802c10:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802c17:	01 00 00 
  802c1a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c1e:	25 07 0e 00 00       	and    $0xe07,%eax
  802c23:	89 c1                	mov    %eax,%ecx
  802c25:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c29:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802c2d:	41 89 c8             	mov    %ecx,%r8d
  802c30:	48 89 d1             	mov    %rdx,%rcx
  802c33:	ba 00 00 00 00       	mov    $0x0,%edx
  802c38:	48 89 c6             	mov    %rax,%rsi
  802c3b:	bf 00 00 00 00       	mov    $0x0,%edi
  802c40:	48 b8 7a 1b 80 00 00 	movabs $0x801b7a,%rax
  802c47:	00 00 00 
  802c4a:	ff d0                	callq  *%rax
  802c4c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c4f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c53:	78 08                	js     802c5d <dup+0x173>
  802c55:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802c58:	eb 37                	jmp    802c91 <dup+0x1a7>
  802c5a:	90                   	nop
  802c5b:	eb 01                	jmp    802c5e <dup+0x174>
  802c5d:	90                   	nop
  802c5e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c62:	48 89 c6             	mov    %rax,%rsi
  802c65:	bf 00 00 00 00       	mov    $0x0,%edi
  802c6a:	48 b8 da 1b 80 00 00 	movabs $0x801bda,%rax
  802c71:	00 00 00 
  802c74:	ff d0                	callq  *%rax
  802c76:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c7a:	48 89 c6             	mov    %rax,%rsi
  802c7d:	bf 00 00 00 00       	mov    $0x0,%edi
  802c82:	48 b8 da 1b 80 00 00 	movabs $0x801bda,%rax
  802c89:	00 00 00 
  802c8c:	ff d0                	callq  *%rax
  802c8e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c91:	c9                   	leaveq 
  802c92:	c3                   	retq   

0000000000802c93 <read>:
  802c93:	55                   	push   %rbp
  802c94:	48 89 e5             	mov    %rsp,%rbp
  802c97:	48 83 ec 40          	sub    $0x40,%rsp
  802c9b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802c9e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802ca2:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802ca6:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802caa:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802cad:	48 89 d6             	mov    %rdx,%rsi
  802cb0:	89 c7                	mov    %eax,%edi
  802cb2:	48 b8 5e 28 80 00 00 	movabs $0x80285e,%rax
  802cb9:	00 00 00 
  802cbc:	ff d0                	callq  *%rax
  802cbe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cc1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cc5:	78 24                	js     802ceb <read+0x58>
  802cc7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ccb:	8b 00                	mov    (%rax),%eax
  802ccd:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802cd1:	48 89 d6             	mov    %rdx,%rsi
  802cd4:	89 c7                	mov    %eax,%edi
  802cd6:	48 b8 b9 29 80 00 00 	movabs $0x8029b9,%rax
  802cdd:	00 00 00 
  802ce0:	ff d0                	callq  *%rax
  802ce2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ce5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ce9:	79 05                	jns    802cf0 <read+0x5d>
  802ceb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cee:	eb 76                	jmp    802d66 <read+0xd3>
  802cf0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cf4:	8b 40 08             	mov    0x8(%rax),%eax
  802cf7:	83 e0 03             	and    $0x3,%eax
  802cfa:	83 f8 01             	cmp    $0x1,%eax
  802cfd:	75 3a                	jne    802d39 <read+0xa6>
  802cff:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802d06:	00 00 00 
  802d09:	48 8b 00             	mov    (%rax),%rax
  802d0c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802d12:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802d15:	89 c6                	mov    %eax,%esi
  802d17:	48 bf 9f 51 80 00 00 	movabs $0x80519f,%rdi
  802d1e:	00 00 00 
  802d21:	b8 00 00 00 00       	mov    $0x0,%eax
  802d26:	48 b9 68 06 80 00 00 	movabs $0x800668,%rcx
  802d2d:	00 00 00 
  802d30:	ff d1                	callq  *%rcx
  802d32:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802d37:	eb 2d                	jmp    802d66 <read+0xd3>
  802d39:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d3d:	48 8b 40 10          	mov    0x10(%rax),%rax
  802d41:	48 85 c0             	test   %rax,%rax
  802d44:	75 07                	jne    802d4d <read+0xba>
  802d46:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802d4b:	eb 19                	jmp    802d66 <read+0xd3>
  802d4d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d51:	48 8b 40 10          	mov    0x10(%rax),%rax
  802d55:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802d59:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802d5d:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802d61:	48 89 cf             	mov    %rcx,%rdi
  802d64:	ff d0                	callq  *%rax
  802d66:	c9                   	leaveq 
  802d67:	c3                   	retq   

0000000000802d68 <readn>:
  802d68:	55                   	push   %rbp
  802d69:	48 89 e5             	mov    %rsp,%rbp
  802d6c:	48 83 ec 30          	sub    $0x30,%rsp
  802d70:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802d73:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802d77:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802d7b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802d82:	eb 47                	jmp    802dcb <readn+0x63>
  802d84:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d87:	48 98                	cltq   
  802d89:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802d8d:	48 29 c2             	sub    %rax,%rdx
  802d90:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d93:	48 63 c8             	movslq %eax,%rcx
  802d96:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d9a:	48 01 c1             	add    %rax,%rcx
  802d9d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802da0:	48 89 ce             	mov    %rcx,%rsi
  802da3:	89 c7                	mov    %eax,%edi
  802da5:	48 b8 93 2c 80 00 00 	movabs $0x802c93,%rax
  802dac:	00 00 00 
  802daf:	ff d0                	callq  *%rax
  802db1:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802db4:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802db8:	79 05                	jns    802dbf <readn+0x57>
  802dba:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802dbd:	eb 1d                	jmp    802ddc <readn+0x74>
  802dbf:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802dc3:	74 13                	je     802dd8 <readn+0x70>
  802dc5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802dc8:	01 45 fc             	add    %eax,-0x4(%rbp)
  802dcb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dce:	48 98                	cltq   
  802dd0:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802dd4:	72 ae                	jb     802d84 <readn+0x1c>
  802dd6:	eb 01                	jmp    802dd9 <readn+0x71>
  802dd8:	90                   	nop
  802dd9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ddc:	c9                   	leaveq 
  802ddd:	c3                   	retq   

0000000000802dde <write>:
  802dde:	55                   	push   %rbp
  802ddf:	48 89 e5             	mov    %rsp,%rbp
  802de2:	48 83 ec 40          	sub    $0x40,%rsp
  802de6:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802de9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802ded:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802df1:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802df5:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802df8:	48 89 d6             	mov    %rdx,%rsi
  802dfb:	89 c7                	mov    %eax,%edi
  802dfd:	48 b8 5e 28 80 00 00 	movabs $0x80285e,%rax
  802e04:	00 00 00 
  802e07:	ff d0                	callq  *%rax
  802e09:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e0c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e10:	78 24                	js     802e36 <write+0x58>
  802e12:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e16:	8b 00                	mov    (%rax),%eax
  802e18:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e1c:	48 89 d6             	mov    %rdx,%rsi
  802e1f:	89 c7                	mov    %eax,%edi
  802e21:	48 b8 b9 29 80 00 00 	movabs $0x8029b9,%rax
  802e28:	00 00 00 
  802e2b:	ff d0                	callq  *%rax
  802e2d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e30:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e34:	79 05                	jns    802e3b <write+0x5d>
  802e36:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e39:	eb 75                	jmp    802eb0 <write+0xd2>
  802e3b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e3f:	8b 40 08             	mov    0x8(%rax),%eax
  802e42:	83 e0 03             	and    $0x3,%eax
  802e45:	85 c0                	test   %eax,%eax
  802e47:	75 3a                	jne    802e83 <write+0xa5>
  802e49:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802e50:	00 00 00 
  802e53:	48 8b 00             	mov    (%rax),%rax
  802e56:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802e5c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802e5f:	89 c6                	mov    %eax,%esi
  802e61:	48 bf bb 51 80 00 00 	movabs $0x8051bb,%rdi
  802e68:	00 00 00 
  802e6b:	b8 00 00 00 00       	mov    $0x0,%eax
  802e70:	48 b9 68 06 80 00 00 	movabs $0x800668,%rcx
  802e77:	00 00 00 
  802e7a:	ff d1                	callq  *%rcx
  802e7c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802e81:	eb 2d                	jmp    802eb0 <write+0xd2>
  802e83:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e87:	48 8b 40 18          	mov    0x18(%rax),%rax
  802e8b:	48 85 c0             	test   %rax,%rax
  802e8e:	75 07                	jne    802e97 <write+0xb9>
  802e90:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802e95:	eb 19                	jmp    802eb0 <write+0xd2>
  802e97:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e9b:	48 8b 40 18          	mov    0x18(%rax),%rax
  802e9f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802ea3:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802ea7:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802eab:	48 89 cf             	mov    %rcx,%rdi
  802eae:	ff d0                	callq  *%rax
  802eb0:	c9                   	leaveq 
  802eb1:	c3                   	retq   

0000000000802eb2 <seek>:
  802eb2:	55                   	push   %rbp
  802eb3:	48 89 e5             	mov    %rsp,%rbp
  802eb6:	48 83 ec 18          	sub    $0x18,%rsp
  802eba:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ebd:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802ec0:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ec4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ec7:	48 89 d6             	mov    %rdx,%rsi
  802eca:	89 c7                	mov    %eax,%edi
  802ecc:	48 b8 5e 28 80 00 00 	movabs $0x80285e,%rax
  802ed3:	00 00 00 
  802ed6:	ff d0                	callq  *%rax
  802ed8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802edb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802edf:	79 05                	jns    802ee6 <seek+0x34>
  802ee1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ee4:	eb 0f                	jmp    802ef5 <seek+0x43>
  802ee6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802eea:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802eed:	89 50 04             	mov    %edx,0x4(%rax)
  802ef0:	b8 00 00 00 00       	mov    $0x0,%eax
  802ef5:	c9                   	leaveq 
  802ef6:	c3                   	retq   

0000000000802ef7 <ftruncate>:
  802ef7:	55                   	push   %rbp
  802ef8:	48 89 e5             	mov    %rsp,%rbp
  802efb:	48 83 ec 30          	sub    $0x30,%rsp
  802eff:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802f02:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802f05:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802f09:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802f0c:	48 89 d6             	mov    %rdx,%rsi
  802f0f:	89 c7                	mov    %eax,%edi
  802f11:	48 b8 5e 28 80 00 00 	movabs $0x80285e,%rax
  802f18:	00 00 00 
  802f1b:	ff d0                	callq  *%rax
  802f1d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f20:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f24:	78 24                	js     802f4a <ftruncate+0x53>
  802f26:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f2a:	8b 00                	mov    (%rax),%eax
  802f2c:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802f30:	48 89 d6             	mov    %rdx,%rsi
  802f33:	89 c7                	mov    %eax,%edi
  802f35:	48 b8 b9 29 80 00 00 	movabs $0x8029b9,%rax
  802f3c:	00 00 00 
  802f3f:	ff d0                	callq  *%rax
  802f41:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f44:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f48:	79 05                	jns    802f4f <ftruncate+0x58>
  802f4a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f4d:	eb 72                	jmp    802fc1 <ftruncate+0xca>
  802f4f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f53:	8b 40 08             	mov    0x8(%rax),%eax
  802f56:	83 e0 03             	and    $0x3,%eax
  802f59:	85 c0                	test   %eax,%eax
  802f5b:	75 3a                	jne    802f97 <ftruncate+0xa0>
  802f5d:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802f64:	00 00 00 
  802f67:	48 8b 00             	mov    (%rax),%rax
  802f6a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802f70:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802f73:	89 c6                	mov    %eax,%esi
  802f75:	48 bf d8 51 80 00 00 	movabs $0x8051d8,%rdi
  802f7c:	00 00 00 
  802f7f:	b8 00 00 00 00       	mov    $0x0,%eax
  802f84:	48 b9 68 06 80 00 00 	movabs $0x800668,%rcx
  802f8b:	00 00 00 
  802f8e:	ff d1                	callq  *%rcx
  802f90:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802f95:	eb 2a                	jmp    802fc1 <ftruncate+0xca>
  802f97:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f9b:	48 8b 40 30          	mov    0x30(%rax),%rax
  802f9f:	48 85 c0             	test   %rax,%rax
  802fa2:	75 07                	jne    802fab <ftruncate+0xb4>
  802fa4:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802fa9:	eb 16                	jmp    802fc1 <ftruncate+0xca>
  802fab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802faf:	48 8b 40 30          	mov    0x30(%rax),%rax
  802fb3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802fb7:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802fba:	89 ce                	mov    %ecx,%esi
  802fbc:	48 89 d7             	mov    %rdx,%rdi
  802fbf:	ff d0                	callq  *%rax
  802fc1:	c9                   	leaveq 
  802fc2:	c3                   	retq   

0000000000802fc3 <fstat>:
  802fc3:	55                   	push   %rbp
  802fc4:	48 89 e5             	mov    %rsp,%rbp
  802fc7:	48 83 ec 30          	sub    $0x30,%rsp
  802fcb:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802fce:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802fd2:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802fd6:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802fd9:	48 89 d6             	mov    %rdx,%rsi
  802fdc:	89 c7                	mov    %eax,%edi
  802fde:	48 b8 5e 28 80 00 00 	movabs $0x80285e,%rax
  802fe5:	00 00 00 
  802fe8:	ff d0                	callq  *%rax
  802fea:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ff1:	78 24                	js     803017 <fstat+0x54>
  802ff3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ff7:	8b 00                	mov    (%rax),%eax
  802ff9:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ffd:	48 89 d6             	mov    %rdx,%rsi
  803000:	89 c7                	mov    %eax,%edi
  803002:	48 b8 b9 29 80 00 00 	movabs $0x8029b9,%rax
  803009:	00 00 00 
  80300c:	ff d0                	callq  *%rax
  80300e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803011:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803015:	79 05                	jns    80301c <fstat+0x59>
  803017:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80301a:	eb 5e                	jmp    80307a <fstat+0xb7>
  80301c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803020:	48 8b 40 28          	mov    0x28(%rax),%rax
  803024:	48 85 c0             	test   %rax,%rax
  803027:	75 07                	jne    803030 <fstat+0x6d>
  803029:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80302e:	eb 4a                	jmp    80307a <fstat+0xb7>
  803030:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803034:	c6 00 00             	movb   $0x0,(%rax)
  803037:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80303b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  803042:	00 00 00 
  803045:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803049:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803050:	00 00 00 
  803053:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803057:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80305b:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  803062:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803066:	48 8b 40 28          	mov    0x28(%rax),%rax
  80306a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80306e:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  803072:	48 89 ce             	mov    %rcx,%rsi
  803075:	48 89 d7             	mov    %rdx,%rdi
  803078:	ff d0                	callq  *%rax
  80307a:	c9                   	leaveq 
  80307b:	c3                   	retq   

000000000080307c <stat>:
  80307c:	55                   	push   %rbp
  80307d:	48 89 e5             	mov    %rsp,%rbp
  803080:	48 83 ec 20          	sub    $0x20,%rsp
  803084:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803088:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80308c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803090:	be 00 00 00 00       	mov    $0x0,%esi
  803095:	48 89 c7             	mov    %rax,%rdi
  803098:	48 b8 6c 31 80 00 00 	movabs $0x80316c,%rax
  80309f:	00 00 00 
  8030a2:	ff d0                	callq  *%rax
  8030a4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030a7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030ab:	79 05                	jns    8030b2 <stat+0x36>
  8030ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030b0:	eb 2f                	jmp    8030e1 <stat+0x65>
  8030b2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8030b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030b9:	48 89 d6             	mov    %rdx,%rsi
  8030bc:	89 c7                	mov    %eax,%edi
  8030be:	48 b8 c3 2f 80 00 00 	movabs $0x802fc3,%rax
  8030c5:	00 00 00 
  8030c8:	ff d0                	callq  *%rax
  8030ca:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8030cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030d0:	89 c7                	mov    %eax,%edi
  8030d2:	48 b8 70 2a 80 00 00 	movabs $0x802a70,%rax
  8030d9:	00 00 00 
  8030dc:	ff d0                	callq  *%rax
  8030de:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8030e1:	c9                   	leaveq 
  8030e2:	c3                   	retq   

00000000008030e3 <fsipc>:
  8030e3:	55                   	push   %rbp
  8030e4:	48 89 e5             	mov    %rsp,%rbp
  8030e7:	48 83 ec 10          	sub    $0x10,%rsp
  8030eb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8030ee:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8030f2:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8030f9:	00 00 00 
  8030fc:	8b 00                	mov    (%rax),%eax
  8030fe:	85 c0                	test   %eax,%eax
  803100:	75 1f                	jne    803121 <fsipc+0x3e>
  803102:	bf 01 00 00 00       	mov    $0x1,%edi
  803107:	48 b8 07 27 80 00 00 	movabs $0x802707,%rax
  80310e:	00 00 00 
  803111:	ff d0                	callq  *%rax
  803113:	89 c2                	mov    %eax,%edx
  803115:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80311c:	00 00 00 
  80311f:	89 10                	mov    %edx,(%rax)
  803121:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  803128:	00 00 00 
  80312b:	8b 00                	mov    (%rax),%eax
  80312d:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803130:	b9 07 00 00 00       	mov    $0x7,%ecx
  803135:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  80313c:	00 00 00 
  80313f:	89 c7                	mov    %eax,%edi
  803141:	48 b8 fd 25 80 00 00 	movabs $0x8025fd,%rax
  803148:	00 00 00 
  80314b:	ff d0                	callq  *%rax
  80314d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803151:	ba 00 00 00 00       	mov    $0x0,%edx
  803156:	48 89 c6             	mov    %rax,%rsi
  803159:	bf 00 00 00 00       	mov    $0x0,%edi
  80315e:	48 b8 3c 25 80 00 00 	movabs $0x80253c,%rax
  803165:	00 00 00 
  803168:	ff d0                	callq  *%rax
  80316a:	c9                   	leaveq 
  80316b:	c3                   	retq   

000000000080316c <open>:
  80316c:	55                   	push   %rbp
  80316d:	48 89 e5             	mov    %rsp,%rbp
  803170:	48 83 ec 20          	sub    $0x20,%rsp
  803174:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803178:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80317b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80317f:	48 89 c7             	mov    %rax,%rdi
  803182:	48 b8 8c 11 80 00 00 	movabs $0x80118c,%rax
  803189:	00 00 00 
  80318c:	ff d0                	callq  *%rax
  80318e:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803193:	7e 0a                	jle    80319f <open+0x33>
  803195:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80319a:	e9 a5 00 00 00       	jmpq   803244 <open+0xd8>
  80319f:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8031a3:	48 89 c7             	mov    %rax,%rdi
  8031a6:	48 b8 c6 27 80 00 00 	movabs $0x8027c6,%rax
  8031ad:	00 00 00 
  8031b0:	ff d0                	callq  *%rax
  8031b2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031b5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031b9:	79 08                	jns    8031c3 <open+0x57>
  8031bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031be:	e9 81 00 00 00       	jmpq   803244 <open+0xd8>
  8031c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031c7:	48 89 c6             	mov    %rax,%rsi
  8031ca:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8031d1:	00 00 00 
  8031d4:	48 b8 f8 11 80 00 00 	movabs $0x8011f8,%rax
  8031db:	00 00 00 
  8031de:	ff d0                	callq  *%rax
  8031e0:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8031e7:	00 00 00 
  8031ea:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8031ed:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8031f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031f7:	48 89 c6             	mov    %rax,%rsi
  8031fa:	bf 01 00 00 00       	mov    $0x1,%edi
  8031ff:	48 b8 e3 30 80 00 00 	movabs $0x8030e3,%rax
  803206:	00 00 00 
  803209:	ff d0                	callq  *%rax
  80320b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80320e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803212:	79 1d                	jns    803231 <open+0xc5>
  803214:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803218:	be 00 00 00 00       	mov    $0x0,%esi
  80321d:	48 89 c7             	mov    %rax,%rdi
  803220:	48 b8 ee 28 80 00 00 	movabs $0x8028ee,%rax
  803227:	00 00 00 
  80322a:	ff d0                	callq  *%rax
  80322c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80322f:	eb 13                	jmp    803244 <open+0xd8>
  803231:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803235:	48 89 c7             	mov    %rax,%rdi
  803238:	48 b8 78 27 80 00 00 	movabs $0x802778,%rax
  80323f:	00 00 00 
  803242:	ff d0                	callq  *%rax
  803244:	c9                   	leaveq 
  803245:	c3                   	retq   

0000000000803246 <devfile_flush>:
  803246:	55                   	push   %rbp
  803247:	48 89 e5             	mov    %rsp,%rbp
  80324a:	48 83 ec 10          	sub    $0x10,%rsp
  80324e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803252:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803256:	8b 50 0c             	mov    0xc(%rax),%edx
  803259:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803260:	00 00 00 
  803263:	89 10                	mov    %edx,(%rax)
  803265:	be 00 00 00 00       	mov    $0x0,%esi
  80326a:	bf 06 00 00 00       	mov    $0x6,%edi
  80326f:	48 b8 e3 30 80 00 00 	movabs $0x8030e3,%rax
  803276:	00 00 00 
  803279:	ff d0                	callq  *%rax
  80327b:	c9                   	leaveq 
  80327c:	c3                   	retq   

000000000080327d <devfile_read>:
  80327d:	55                   	push   %rbp
  80327e:	48 89 e5             	mov    %rsp,%rbp
  803281:	48 83 ec 30          	sub    $0x30,%rsp
  803285:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803289:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80328d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803291:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803295:	8b 50 0c             	mov    0xc(%rax),%edx
  803298:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80329f:	00 00 00 
  8032a2:	89 10                	mov    %edx,(%rax)
  8032a4:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8032ab:	00 00 00 
  8032ae:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8032b2:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8032b6:	be 00 00 00 00       	mov    $0x0,%esi
  8032bb:	bf 03 00 00 00       	mov    $0x3,%edi
  8032c0:	48 b8 e3 30 80 00 00 	movabs $0x8030e3,%rax
  8032c7:	00 00 00 
  8032ca:	ff d0                	callq  *%rax
  8032cc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032cf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032d3:	79 08                	jns    8032dd <devfile_read+0x60>
  8032d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032d8:	e9 a4 00 00 00       	jmpq   803381 <devfile_read+0x104>
  8032dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032e0:	48 98                	cltq   
  8032e2:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8032e6:	76 35                	jbe    80331d <devfile_read+0xa0>
  8032e8:	48 b9 fe 51 80 00 00 	movabs $0x8051fe,%rcx
  8032ef:	00 00 00 
  8032f2:	48 ba 05 52 80 00 00 	movabs $0x805205,%rdx
  8032f9:	00 00 00 
  8032fc:	be 89 00 00 00       	mov    $0x89,%esi
  803301:	48 bf 1a 52 80 00 00 	movabs $0x80521a,%rdi
  803308:	00 00 00 
  80330b:	b8 00 00 00 00       	mov    $0x0,%eax
  803310:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  803317:	00 00 00 
  80331a:	41 ff d0             	callq  *%r8
  80331d:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  803324:	7e 35                	jle    80335b <devfile_read+0xde>
  803326:	48 b9 28 52 80 00 00 	movabs $0x805228,%rcx
  80332d:	00 00 00 
  803330:	48 ba 05 52 80 00 00 	movabs $0x805205,%rdx
  803337:	00 00 00 
  80333a:	be 8a 00 00 00       	mov    $0x8a,%esi
  80333f:	48 bf 1a 52 80 00 00 	movabs $0x80521a,%rdi
  803346:	00 00 00 
  803349:	b8 00 00 00 00       	mov    $0x0,%eax
  80334e:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  803355:	00 00 00 
  803358:	41 ff d0             	callq  *%r8
  80335b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80335e:	48 63 d0             	movslq %eax,%rdx
  803361:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803365:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  80336c:	00 00 00 
  80336f:	48 89 c7             	mov    %rax,%rdi
  803372:	48 b8 1d 15 80 00 00 	movabs $0x80151d,%rax
  803379:	00 00 00 
  80337c:	ff d0                	callq  *%rax
  80337e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803381:	c9                   	leaveq 
  803382:	c3                   	retq   

0000000000803383 <devfile_write>:
  803383:	55                   	push   %rbp
  803384:	48 89 e5             	mov    %rsp,%rbp
  803387:	48 83 ec 40          	sub    $0x40,%rsp
  80338b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80338f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803393:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803397:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80339b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80339f:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8033a6:	00 
  8033a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033ab:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8033af:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  8033b4:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8033b8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8033bc:	8b 50 0c             	mov    0xc(%rax),%edx
  8033bf:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8033c6:	00 00 00 
  8033c9:	89 10                	mov    %edx,(%rax)
  8033cb:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8033d2:	00 00 00 
  8033d5:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8033d9:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8033dd:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8033e1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8033e5:	48 89 c6             	mov    %rax,%rsi
  8033e8:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  8033ef:	00 00 00 
  8033f2:	48 b8 1d 15 80 00 00 	movabs $0x80151d,%rax
  8033f9:	00 00 00 
  8033fc:	ff d0                	callq  *%rax
  8033fe:	be 00 00 00 00       	mov    $0x0,%esi
  803403:	bf 04 00 00 00       	mov    $0x4,%edi
  803408:	48 b8 e3 30 80 00 00 	movabs $0x8030e3,%rax
  80340f:	00 00 00 
  803412:	ff d0                	callq  *%rax
  803414:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803417:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80341b:	79 05                	jns    803422 <devfile_write+0x9f>
  80341d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803420:	eb 43                	jmp    803465 <devfile_write+0xe2>
  803422:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803425:	48 98                	cltq   
  803427:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80342b:	76 35                	jbe    803462 <devfile_write+0xdf>
  80342d:	48 b9 fe 51 80 00 00 	movabs $0x8051fe,%rcx
  803434:	00 00 00 
  803437:	48 ba 05 52 80 00 00 	movabs $0x805205,%rdx
  80343e:	00 00 00 
  803441:	be a8 00 00 00       	mov    $0xa8,%esi
  803446:	48 bf 1a 52 80 00 00 	movabs $0x80521a,%rdi
  80344d:	00 00 00 
  803450:	b8 00 00 00 00       	mov    $0x0,%eax
  803455:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  80345c:	00 00 00 
  80345f:	41 ff d0             	callq  *%r8
  803462:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803465:	c9                   	leaveq 
  803466:	c3                   	retq   

0000000000803467 <devfile_stat>:
  803467:	55                   	push   %rbp
  803468:	48 89 e5             	mov    %rsp,%rbp
  80346b:	48 83 ec 20          	sub    $0x20,%rsp
  80346f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803473:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803477:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80347b:	8b 50 0c             	mov    0xc(%rax),%edx
  80347e:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803485:	00 00 00 
  803488:	89 10                	mov    %edx,(%rax)
  80348a:	be 00 00 00 00       	mov    $0x0,%esi
  80348f:	bf 05 00 00 00       	mov    $0x5,%edi
  803494:	48 b8 e3 30 80 00 00 	movabs $0x8030e3,%rax
  80349b:	00 00 00 
  80349e:	ff d0                	callq  *%rax
  8034a0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034a3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034a7:	79 05                	jns    8034ae <devfile_stat+0x47>
  8034a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034ac:	eb 56                	jmp    803504 <devfile_stat+0x9d>
  8034ae:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8034b2:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8034b9:	00 00 00 
  8034bc:	48 89 c7             	mov    %rax,%rdi
  8034bf:	48 b8 f8 11 80 00 00 	movabs $0x8011f8,%rax
  8034c6:	00 00 00 
  8034c9:	ff d0                	callq  *%rax
  8034cb:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8034d2:	00 00 00 
  8034d5:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  8034db:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8034df:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8034e5:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8034ec:	00 00 00 
  8034ef:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  8034f5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8034f9:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  8034ff:	b8 00 00 00 00       	mov    $0x0,%eax
  803504:	c9                   	leaveq 
  803505:	c3                   	retq   

0000000000803506 <devfile_trunc>:
  803506:	55                   	push   %rbp
  803507:	48 89 e5             	mov    %rsp,%rbp
  80350a:	48 83 ec 10          	sub    $0x10,%rsp
  80350e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803512:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803515:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803519:	8b 50 0c             	mov    0xc(%rax),%edx
  80351c:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803523:	00 00 00 
  803526:	89 10                	mov    %edx,(%rax)
  803528:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80352f:	00 00 00 
  803532:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803535:	89 50 04             	mov    %edx,0x4(%rax)
  803538:	be 00 00 00 00       	mov    $0x0,%esi
  80353d:	bf 02 00 00 00       	mov    $0x2,%edi
  803542:	48 b8 e3 30 80 00 00 	movabs $0x8030e3,%rax
  803549:	00 00 00 
  80354c:	ff d0                	callq  *%rax
  80354e:	c9                   	leaveq 
  80354f:	c3                   	retq   

0000000000803550 <remove>:
  803550:	55                   	push   %rbp
  803551:	48 89 e5             	mov    %rsp,%rbp
  803554:	48 83 ec 10          	sub    $0x10,%rsp
  803558:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80355c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803560:	48 89 c7             	mov    %rax,%rdi
  803563:	48 b8 8c 11 80 00 00 	movabs $0x80118c,%rax
  80356a:	00 00 00 
  80356d:	ff d0                	callq  *%rax
  80356f:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803574:	7e 07                	jle    80357d <remove+0x2d>
  803576:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80357b:	eb 33                	jmp    8035b0 <remove+0x60>
  80357d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803581:	48 89 c6             	mov    %rax,%rsi
  803584:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  80358b:	00 00 00 
  80358e:	48 b8 f8 11 80 00 00 	movabs $0x8011f8,%rax
  803595:	00 00 00 
  803598:	ff d0                	callq  *%rax
  80359a:	be 00 00 00 00       	mov    $0x0,%esi
  80359f:	bf 07 00 00 00       	mov    $0x7,%edi
  8035a4:	48 b8 e3 30 80 00 00 	movabs $0x8030e3,%rax
  8035ab:	00 00 00 
  8035ae:	ff d0                	callq  *%rax
  8035b0:	c9                   	leaveq 
  8035b1:	c3                   	retq   

00000000008035b2 <sync>:
  8035b2:	55                   	push   %rbp
  8035b3:	48 89 e5             	mov    %rsp,%rbp
  8035b6:	be 00 00 00 00       	mov    $0x0,%esi
  8035bb:	bf 08 00 00 00       	mov    $0x8,%edi
  8035c0:	48 b8 e3 30 80 00 00 	movabs $0x8030e3,%rax
  8035c7:	00 00 00 
  8035ca:	ff d0                	callq  *%rax
  8035cc:	5d                   	pop    %rbp
  8035cd:	c3                   	retq   

00000000008035ce <copy>:
  8035ce:	55                   	push   %rbp
  8035cf:	48 89 e5             	mov    %rsp,%rbp
  8035d2:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  8035d9:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  8035e0:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  8035e7:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  8035ee:	be 00 00 00 00       	mov    $0x0,%esi
  8035f3:	48 89 c7             	mov    %rax,%rdi
  8035f6:	48 b8 6c 31 80 00 00 	movabs $0x80316c,%rax
  8035fd:	00 00 00 
  803600:	ff d0                	callq  *%rax
  803602:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803605:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803609:	79 28                	jns    803633 <copy+0x65>
  80360b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80360e:	89 c6                	mov    %eax,%esi
  803610:	48 bf 34 52 80 00 00 	movabs $0x805234,%rdi
  803617:	00 00 00 
  80361a:	b8 00 00 00 00       	mov    $0x0,%eax
  80361f:	48 ba 68 06 80 00 00 	movabs $0x800668,%rdx
  803626:	00 00 00 
  803629:	ff d2                	callq  *%rdx
  80362b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80362e:	e9 76 01 00 00       	jmpq   8037a9 <copy+0x1db>
  803633:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  80363a:	be 01 01 00 00       	mov    $0x101,%esi
  80363f:	48 89 c7             	mov    %rax,%rdi
  803642:	48 b8 6c 31 80 00 00 	movabs $0x80316c,%rax
  803649:	00 00 00 
  80364c:	ff d0                	callq  *%rax
  80364e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803651:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803655:	0f 89 ad 00 00 00    	jns    803708 <copy+0x13a>
  80365b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80365e:	89 c6                	mov    %eax,%esi
  803660:	48 bf 4a 52 80 00 00 	movabs $0x80524a,%rdi
  803667:	00 00 00 
  80366a:	b8 00 00 00 00       	mov    $0x0,%eax
  80366f:	48 ba 68 06 80 00 00 	movabs $0x800668,%rdx
  803676:	00 00 00 
  803679:	ff d2                	callq  *%rdx
  80367b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80367e:	89 c7                	mov    %eax,%edi
  803680:	48 b8 70 2a 80 00 00 	movabs $0x802a70,%rax
  803687:	00 00 00 
  80368a:	ff d0                	callq  *%rax
  80368c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80368f:	e9 15 01 00 00       	jmpq   8037a9 <copy+0x1db>
  803694:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803697:	48 63 d0             	movslq %eax,%rdx
  80369a:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8036a1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036a4:	48 89 ce             	mov    %rcx,%rsi
  8036a7:	89 c7                	mov    %eax,%edi
  8036a9:	48 b8 de 2d 80 00 00 	movabs $0x802dde,%rax
  8036b0:	00 00 00 
  8036b3:	ff d0                	callq  *%rax
  8036b5:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8036b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8036bc:	79 4a                	jns    803708 <copy+0x13a>
  8036be:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8036c1:	89 c6                	mov    %eax,%esi
  8036c3:	48 bf 64 52 80 00 00 	movabs $0x805264,%rdi
  8036ca:	00 00 00 
  8036cd:	b8 00 00 00 00       	mov    $0x0,%eax
  8036d2:	48 ba 68 06 80 00 00 	movabs $0x800668,%rdx
  8036d9:	00 00 00 
  8036dc:	ff d2                	callq  *%rdx
  8036de:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036e1:	89 c7                	mov    %eax,%edi
  8036e3:	48 b8 70 2a 80 00 00 	movabs $0x802a70,%rax
  8036ea:	00 00 00 
  8036ed:	ff d0                	callq  *%rax
  8036ef:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036f2:	89 c7                	mov    %eax,%edi
  8036f4:	48 b8 70 2a 80 00 00 	movabs $0x802a70,%rax
  8036fb:	00 00 00 
  8036fe:	ff d0                	callq  *%rax
  803700:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803703:	e9 a1 00 00 00       	jmpq   8037a9 <copy+0x1db>
  803708:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  80370f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803712:	ba 00 02 00 00       	mov    $0x200,%edx
  803717:	48 89 ce             	mov    %rcx,%rsi
  80371a:	89 c7                	mov    %eax,%edi
  80371c:	48 b8 93 2c 80 00 00 	movabs $0x802c93,%rax
  803723:	00 00 00 
  803726:	ff d0                	callq  *%rax
  803728:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80372b:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80372f:	0f 8f 5f ff ff ff    	jg     803694 <copy+0xc6>
  803735:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803739:	79 47                	jns    803782 <copy+0x1b4>
  80373b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80373e:	89 c6                	mov    %eax,%esi
  803740:	48 bf 77 52 80 00 00 	movabs $0x805277,%rdi
  803747:	00 00 00 
  80374a:	b8 00 00 00 00       	mov    $0x0,%eax
  80374f:	48 ba 68 06 80 00 00 	movabs $0x800668,%rdx
  803756:	00 00 00 
  803759:	ff d2                	callq  *%rdx
  80375b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80375e:	89 c7                	mov    %eax,%edi
  803760:	48 b8 70 2a 80 00 00 	movabs $0x802a70,%rax
  803767:	00 00 00 
  80376a:	ff d0                	callq  *%rax
  80376c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80376f:	89 c7                	mov    %eax,%edi
  803771:	48 b8 70 2a 80 00 00 	movabs $0x802a70,%rax
  803778:	00 00 00 
  80377b:	ff d0                	callq  *%rax
  80377d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803780:	eb 27                	jmp    8037a9 <copy+0x1db>
  803782:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803785:	89 c7                	mov    %eax,%edi
  803787:	48 b8 70 2a 80 00 00 	movabs $0x802a70,%rax
  80378e:	00 00 00 
  803791:	ff d0                	callq  *%rax
  803793:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803796:	89 c7                	mov    %eax,%edi
  803798:	48 b8 70 2a 80 00 00 	movabs $0x802a70,%rax
  80379f:	00 00 00 
  8037a2:	ff d0                	callq  *%rax
  8037a4:	b8 00 00 00 00       	mov    $0x0,%eax
  8037a9:	c9                   	leaveq 
  8037aa:	c3                   	retq   

00000000008037ab <pageref>:
  8037ab:	55                   	push   %rbp
  8037ac:	48 89 e5             	mov    %rsp,%rbp
  8037af:	48 83 ec 18          	sub    $0x18,%rsp
  8037b3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8037b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037bb:	48 c1 e8 15          	shr    $0x15,%rax
  8037bf:	48 89 c2             	mov    %rax,%rdx
  8037c2:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8037c9:	01 00 00 
  8037cc:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8037d0:	83 e0 01             	and    $0x1,%eax
  8037d3:	48 85 c0             	test   %rax,%rax
  8037d6:	75 07                	jne    8037df <pageref+0x34>
  8037d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8037dd:	eb 56                	jmp    803835 <pageref+0x8a>
  8037df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037e3:	48 c1 e8 0c          	shr    $0xc,%rax
  8037e7:	48 89 c2             	mov    %rax,%rdx
  8037ea:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8037f1:	01 00 00 
  8037f4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8037f8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8037fc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803800:	83 e0 01             	and    $0x1,%eax
  803803:	48 85 c0             	test   %rax,%rax
  803806:	75 07                	jne    80380f <pageref+0x64>
  803808:	b8 00 00 00 00       	mov    $0x0,%eax
  80380d:	eb 26                	jmp    803835 <pageref+0x8a>
  80380f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803813:	48 c1 e8 0c          	shr    $0xc,%rax
  803817:	48 89 c2             	mov    %rax,%rdx
  80381a:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  803821:	00 00 00 
  803824:	48 c1 e2 04          	shl    $0x4,%rdx
  803828:	48 01 d0             	add    %rdx,%rax
  80382b:	48 83 c0 08          	add    $0x8,%rax
  80382f:	0f b7 00             	movzwl (%rax),%eax
  803832:	0f b7 c0             	movzwl %ax,%eax
  803835:	c9                   	leaveq 
  803836:	c3                   	retq   

0000000000803837 <fd2sockid>:
  803837:	55                   	push   %rbp
  803838:	48 89 e5             	mov    %rsp,%rbp
  80383b:	48 83 ec 20          	sub    $0x20,%rsp
  80383f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803842:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803846:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803849:	48 89 d6             	mov    %rdx,%rsi
  80384c:	89 c7                	mov    %eax,%edi
  80384e:	48 b8 5e 28 80 00 00 	movabs $0x80285e,%rax
  803855:	00 00 00 
  803858:	ff d0                	callq  *%rax
  80385a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80385d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803861:	79 05                	jns    803868 <fd2sockid+0x31>
  803863:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803866:	eb 24                	jmp    80388c <fd2sockid+0x55>
  803868:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80386c:	8b 10                	mov    (%rax),%edx
  80386e:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803875:	00 00 00 
  803878:	8b 00                	mov    (%rax),%eax
  80387a:	39 c2                	cmp    %eax,%edx
  80387c:	74 07                	je     803885 <fd2sockid+0x4e>
  80387e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803883:	eb 07                	jmp    80388c <fd2sockid+0x55>
  803885:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803889:	8b 40 0c             	mov    0xc(%rax),%eax
  80388c:	c9                   	leaveq 
  80388d:	c3                   	retq   

000000000080388e <alloc_sockfd>:
  80388e:	55                   	push   %rbp
  80388f:	48 89 e5             	mov    %rsp,%rbp
  803892:	48 83 ec 20          	sub    $0x20,%rsp
  803896:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803899:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80389d:	48 89 c7             	mov    %rax,%rdi
  8038a0:	48 b8 c6 27 80 00 00 	movabs $0x8027c6,%rax
  8038a7:	00 00 00 
  8038aa:	ff d0                	callq  *%rax
  8038ac:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038af:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038b3:	78 26                	js     8038db <alloc_sockfd+0x4d>
  8038b5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038b9:	ba 07 04 00 00       	mov    $0x407,%edx
  8038be:	48 89 c6             	mov    %rax,%rsi
  8038c1:	bf 00 00 00 00       	mov    $0x0,%edi
  8038c6:	48 b8 28 1b 80 00 00 	movabs $0x801b28,%rax
  8038cd:	00 00 00 
  8038d0:	ff d0                	callq  *%rax
  8038d2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038d5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038d9:	79 16                	jns    8038f1 <alloc_sockfd+0x63>
  8038db:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038de:	89 c7                	mov    %eax,%edi
  8038e0:	48 b8 9d 3d 80 00 00 	movabs $0x803d9d,%rax
  8038e7:	00 00 00 
  8038ea:	ff d0                	callq  *%rax
  8038ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038ef:	eb 3a                	jmp    80392b <alloc_sockfd+0x9d>
  8038f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038f5:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  8038fc:	00 00 00 
  8038ff:	8b 12                	mov    (%rdx),%edx
  803901:	89 10                	mov    %edx,(%rax)
  803903:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803907:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80390e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803912:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803915:	89 50 0c             	mov    %edx,0xc(%rax)
  803918:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80391c:	48 89 c7             	mov    %rax,%rdi
  80391f:	48 b8 78 27 80 00 00 	movabs $0x802778,%rax
  803926:	00 00 00 
  803929:	ff d0                	callq  *%rax
  80392b:	c9                   	leaveq 
  80392c:	c3                   	retq   

000000000080392d <accept>:
  80392d:	55                   	push   %rbp
  80392e:	48 89 e5             	mov    %rsp,%rbp
  803931:	48 83 ec 30          	sub    $0x30,%rsp
  803935:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803938:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80393c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803940:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803943:	89 c7                	mov    %eax,%edi
  803945:	48 b8 37 38 80 00 00 	movabs $0x803837,%rax
  80394c:	00 00 00 
  80394f:	ff d0                	callq  *%rax
  803951:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803954:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803958:	79 05                	jns    80395f <accept+0x32>
  80395a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80395d:	eb 3b                	jmp    80399a <accept+0x6d>
  80395f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803963:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803967:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80396a:	48 89 ce             	mov    %rcx,%rsi
  80396d:	89 c7                	mov    %eax,%edi
  80396f:	48 b8 7a 3c 80 00 00 	movabs $0x803c7a,%rax
  803976:	00 00 00 
  803979:	ff d0                	callq  *%rax
  80397b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80397e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803982:	79 05                	jns    803989 <accept+0x5c>
  803984:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803987:	eb 11                	jmp    80399a <accept+0x6d>
  803989:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80398c:	89 c7                	mov    %eax,%edi
  80398e:	48 b8 8e 38 80 00 00 	movabs $0x80388e,%rax
  803995:	00 00 00 
  803998:	ff d0                	callq  *%rax
  80399a:	c9                   	leaveq 
  80399b:	c3                   	retq   

000000000080399c <bind>:
  80399c:	55                   	push   %rbp
  80399d:	48 89 e5             	mov    %rsp,%rbp
  8039a0:	48 83 ec 20          	sub    $0x20,%rsp
  8039a4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8039a7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8039ab:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8039ae:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039b1:	89 c7                	mov    %eax,%edi
  8039b3:	48 b8 37 38 80 00 00 	movabs $0x803837,%rax
  8039ba:	00 00 00 
  8039bd:	ff d0                	callq  *%rax
  8039bf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039c2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039c6:	79 05                	jns    8039cd <bind+0x31>
  8039c8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039cb:	eb 1b                	jmp    8039e8 <bind+0x4c>
  8039cd:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8039d0:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8039d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039d7:	48 89 ce             	mov    %rcx,%rsi
  8039da:	89 c7                	mov    %eax,%edi
  8039dc:	48 b8 f9 3c 80 00 00 	movabs $0x803cf9,%rax
  8039e3:	00 00 00 
  8039e6:	ff d0                	callq  *%rax
  8039e8:	c9                   	leaveq 
  8039e9:	c3                   	retq   

00000000008039ea <shutdown>:
  8039ea:	55                   	push   %rbp
  8039eb:	48 89 e5             	mov    %rsp,%rbp
  8039ee:	48 83 ec 20          	sub    $0x20,%rsp
  8039f2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8039f5:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8039f8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039fb:	89 c7                	mov    %eax,%edi
  8039fd:	48 b8 37 38 80 00 00 	movabs $0x803837,%rax
  803a04:	00 00 00 
  803a07:	ff d0                	callq  *%rax
  803a09:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a0c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a10:	79 05                	jns    803a17 <shutdown+0x2d>
  803a12:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a15:	eb 16                	jmp    803a2d <shutdown+0x43>
  803a17:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803a1a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a1d:	89 d6                	mov    %edx,%esi
  803a1f:	89 c7                	mov    %eax,%edi
  803a21:	48 b8 5d 3d 80 00 00 	movabs $0x803d5d,%rax
  803a28:	00 00 00 
  803a2b:	ff d0                	callq  *%rax
  803a2d:	c9                   	leaveq 
  803a2e:	c3                   	retq   

0000000000803a2f <devsock_close>:
  803a2f:	55                   	push   %rbp
  803a30:	48 89 e5             	mov    %rsp,%rbp
  803a33:	48 83 ec 10          	sub    $0x10,%rsp
  803a37:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803a3b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a3f:	48 89 c7             	mov    %rax,%rdi
  803a42:	48 b8 ab 37 80 00 00 	movabs $0x8037ab,%rax
  803a49:	00 00 00 
  803a4c:	ff d0                	callq  *%rax
  803a4e:	83 f8 01             	cmp    $0x1,%eax
  803a51:	75 17                	jne    803a6a <devsock_close+0x3b>
  803a53:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a57:	8b 40 0c             	mov    0xc(%rax),%eax
  803a5a:	89 c7                	mov    %eax,%edi
  803a5c:	48 b8 9d 3d 80 00 00 	movabs $0x803d9d,%rax
  803a63:	00 00 00 
  803a66:	ff d0                	callq  *%rax
  803a68:	eb 05                	jmp    803a6f <devsock_close+0x40>
  803a6a:	b8 00 00 00 00       	mov    $0x0,%eax
  803a6f:	c9                   	leaveq 
  803a70:	c3                   	retq   

0000000000803a71 <connect>:
  803a71:	55                   	push   %rbp
  803a72:	48 89 e5             	mov    %rsp,%rbp
  803a75:	48 83 ec 20          	sub    $0x20,%rsp
  803a79:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a7c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a80:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803a83:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a86:	89 c7                	mov    %eax,%edi
  803a88:	48 b8 37 38 80 00 00 	movabs $0x803837,%rax
  803a8f:	00 00 00 
  803a92:	ff d0                	callq  *%rax
  803a94:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a97:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a9b:	79 05                	jns    803aa2 <connect+0x31>
  803a9d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803aa0:	eb 1b                	jmp    803abd <connect+0x4c>
  803aa2:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803aa5:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803aa9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803aac:	48 89 ce             	mov    %rcx,%rsi
  803aaf:	89 c7                	mov    %eax,%edi
  803ab1:	48 b8 ca 3d 80 00 00 	movabs $0x803dca,%rax
  803ab8:	00 00 00 
  803abb:	ff d0                	callq  *%rax
  803abd:	c9                   	leaveq 
  803abe:	c3                   	retq   

0000000000803abf <listen>:
  803abf:	55                   	push   %rbp
  803ac0:	48 89 e5             	mov    %rsp,%rbp
  803ac3:	48 83 ec 20          	sub    $0x20,%rsp
  803ac7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803aca:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803acd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ad0:	89 c7                	mov    %eax,%edi
  803ad2:	48 b8 37 38 80 00 00 	movabs $0x803837,%rax
  803ad9:	00 00 00 
  803adc:	ff d0                	callq  *%rax
  803ade:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ae1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ae5:	79 05                	jns    803aec <listen+0x2d>
  803ae7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803aea:	eb 16                	jmp    803b02 <listen+0x43>
  803aec:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803aef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803af2:	89 d6                	mov    %edx,%esi
  803af4:	89 c7                	mov    %eax,%edi
  803af6:	48 b8 2e 3e 80 00 00 	movabs $0x803e2e,%rax
  803afd:	00 00 00 
  803b00:	ff d0                	callq  *%rax
  803b02:	c9                   	leaveq 
  803b03:	c3                   	retq   

0000000000803b04 <devsock_read>:
  803b04:	55                   	push   %rbp
  803b05:	48 89 e5             	mov    %rsp,%rbp
  803b08:	48 83 ec 20          	sub    $0x20,%rsp
  803b0c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b10:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803b14:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803b18:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b1c:	89 c2                	mov    %eax,%edx
  803b1e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b22:	8b 40 0c             	mov    0xc(%rax),%eax
  803b25:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803b29:	b9 00 00 00 00       	mov    $0x0,%ecx
  803b2e:	89 c7                	mov    %eax,%edi
  803b30:	48 b8 6e 3e 80 00 00 	movabs $0x803e6e,%rax
  803b37:	00 00 00 
  803b3a:	ff d0                	callq  *%rax
  803b3c:	c9                   	leaveq 
  803b3d:	c3                   	retq   

0000000000803b3e <devsock_write>:
  803b3e:	55                   	push   %rbp
  803b3f:	48 89 e5             	mov    %rsp,%rbp
  803b42:	48 83 ec 20          	sub    $0x20,%rsp
  803b46:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b4a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803b4e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803b52:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b56:	89 c2                	mov    %eax,%edx
  803b58:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b5c:	8b 40 0c             	mov    0xc(%rax),%eax
  803b5f:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803b63:	b9 00 00 00 00       	mov    $0x0,%ecx
  803b68:	89 c7                	mov    %eax,%edi
  803b6a:	48 b8 3a 3f 80 00 00 	movabs $0x803f3a,%rax
  803b71:	00 00 00 
  803b74:	ff d0                	callq  *%rax
  803b76:	c9                   	leaveq 
  803b77:	c3                   	retq   

0000000000803b78 <devsock_stat>:
  803b78:	55                   	push   %rbp
  803b79:	48 89 e5             	mov    %rsp,%rbp
  803b7c:	48 83 ec 10          	sub    $0x10,%rsp
  803b80:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b84:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803b88:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b8c:	48 be 92 52 80 00 00 	movabs $0x805292,%rsi
  803b93:	00 00 00 
  803b96:	48 89 c7             	mov    %rax,%rdi
  803b99:	48 b8 f8 11 80 00 00 	movabs $0x8011f8,%rax
  803ba0:	00 00 00 
  803ba3:	ff d0                	callq  *%rax
  803ba5:	b8 00 00 00 00       	mov    $0x0,%eax
  803baa:	c9                   	leaveq 
  803bab:	c3                   	retq   

0000000000803bac <socket>:
  803bac:	55                   	push   %rbp
  803bad:	48 89 e5             	mov    %rsp,%rbp
  803bb0:	48 83 ec 20          	sub    $0x20,%rsp
  803bb4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803bb7:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803bba:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803bbd:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803bc0:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803bc3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bc6:	89 ce                	mov    %ecx,%esi
  803bc8:	89 c7                	mov    %eax,%edi
  803bca:	48 b8 f2 3f 80 00 00 	movabs $0x803ff2,%rax
  803bd1:	00 00 00 
  803bd4:	ff d0                	callq  *%rax
  803bd6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bd9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bdd:	79 05                	jns    803be4 <socket+0x38>
  803bdf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803be2:	eb 11                	jmp    803bf5 <socket+0x49>
  803be4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803be7:	89 c7                	mov    %eax,%edi
  803be9:	48 b8 8e 38 80 00 00 	movabs $0x80388e,%rax
  803bf0:	00 00 00 
  803bf3:	ff d0                	callq  *%rax
  803bf5:	c9                   	leaveq 
  803bf6:	c3                   	retq   

0000000000803bf7 <nsipc>:
  803bf7:	55                   	push   %rbp
  803bf8:	48 89 e5             	mov    %rsp,%rbp
  803bfb:	48 83 ec 10          	sub    $0x10,%rsp
  803bff:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c02:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803c09:	00 00 00 
  803c0c:	8b 00                	mov    (%rax),%eax
  803c0e:	85 c0                	test   %eax,%eax
  803c10:	75 1f                	jne    803c31 <nsipc+0x3a>
  803c12:	bf 02 00 00 00       	mov    $0x2,%edi
  803c17:	48 b8 07 27 80 00 00 	movabs $0x802707,%rax
  803c1e:	00 00 00 
  803c21:	ff d0                	callq  *%rax
  803c23:	89 c2                	mov    %eax,%edx
  803c25:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803c2c:	00 00 00 
  803c2f:	89 10                	mov    %edx,(%rax)
  803c31:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803c38:	00 00 00 
  803c3b:	8b 00                	mov    (%rax),%eax
  803c3d:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803c40:	b9 07 00 00 00       	mov    $0x7,%ecx
  803c45:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803c4c:	00 00 00 
  803c4f:	89 c7                	mov    %eax,%edi
  803c51:	48 b8 fd 25 80 00 00 	movabs $0x8025fd,%rax
  803c58:	00 00 00 
  803c5b:	ff d0                	callq  *%rax
  803c5d:	ba 00 00 00 00       	mov    $0x0,%edx
  803c62:	be 00 00 00 00       	mov    $0x0,%esi
  803c67:	bf 00 00 00 00       	mov    $0x0,%edi
  803c6c:	48 b8 3c 25 80 00 00 	movabs $0x80253c,%rax
  803c73:	00 00 00 
  803c76:	ff d0                	callq  *%rax
  803c78:	c9                   	leaveq 
  803c79:	c3                   	retq   

0000000000803c7a <nsipc_accept>:
  803c7a:	55                   	push   %rbp
  803c7b:	48 89 e5             	mov    %rsp,%rbp
  803c7e:	48 83 ec 30          	sub    $0x30,%rsp
  803c82:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c85:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c89:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803c8d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c94:	00 00 00 
  803c97:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803c9a:	89 10                	mov    %edx,(%rax)
  803c9c:	bf 01 00 00 00       	mov    $0x1,%edi
  803ca1:	48 b8 f7 3b 80 00 00 	movabs $0x803bf7,%rax
  803ca8:	00 00 00 
  803cab:	ff d0                	callq  *%rax
  803cad:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803cb0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cb4:	78 3e                	js     803cf4 <nsipc_accept+0x7a>
  803cb6:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cbd:	00 00 00 
  803cc0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803cc4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cc8:	8b 40 10             	mov    0x10(%rax),%eax
  803ccb:	89 c2                	mov    %eax,%edx
  803ccd:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803cd1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803cd5:	48 89 ce             	mov    %rcx,%rsi
  803cd8:	48 89 c7             	mov    %rax,%rdi
  803cdb:	48 b8 1d 15 80 00 00 	movabs $0x80151d,%rax
  803ce2:	00 00 00 
  803ce5:	ff d0                	callq  *%rax
  803ce7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ceb:	8b 50 10             	mov    0x10(%rax),%edx
  803cee:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803cf2:	89 10                	mov    %edx,(%rax)
  803cf4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cf7:	c9                   	leaveq 
  803cf8:	c3                   	retq   

0000000000803cf9 <nsipc_bind>:
  803cf9:	55                   	push   %rbp
  803cfa:	48 89 e5             	mov    %rsp,%rbp
  803cfd:	48 83 ec 10          	sub    $0x10,%rsp
  803d01:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d04:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803d08:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803d0b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d12:	00 00 00 
  803d15:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d18:	89 10                	mov    %edx,(%rax)
  803d1a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d1d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d21:	48 89 c6             	mov    %rax,%rsi
  803d24:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803d2b:	00 00 00 
  803d2e:	48 b8 1d 15 80 00 00 	movabs $0x80151d,%rax
  803d35:	00 00 00 
  803d38:	ff d0                	callq  *%rax
  803d3a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d41:	00 00 00 
  803d44:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d47:	89 50 14             	mov    %edx,0x14(%rax)
  803d4a:	bf 02 00 00 00       	mov    $0x2,%edi
  803d4f:	48 b8 f7 3b 80 00 00 	movabs $0x803bf7,%rax
  803d56:	00 00 00 
  803d59:	ff d0                	callq  *%rax
  803d5b:	c9                   	leaveq 
  803d5c:	c3                   	retq   

0000000000803d5d <nsipc_shutdown>:
  803d5d:	55                   	push   %rbp
  803d5e:	48 89 e5             	mov    %rsp,%rbp
  803d61:	48 83 ec 10          	sub    $0x10,%rsp
  803d65:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d68:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803d6b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d72:	00 00 00 
  803d75:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d78:	89 10                	mov    %edx,(%rax)
  803d7a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d81:	00 00 00 
  803d84:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d87:	89 50 04             	mov    %edx,0x4(%rax)
  803d8a:	bf 03 00 00 00       	mov    $0x3,%edi
  803d8f:	48 b8 f7 3b 80 00 00 	movabs $0x803bf7,%rax
  803d96:	00 00 00 
  803d99:	ff d0                	callq  *%rax
  803d9b:	c9                   	leaveq 
  803d9c:	c3                   	retq   

0000000000803d9d <nsipc_close>:
  803d9d:	55                   	push   %rbp
  803d9e:	48 89 e5             	mov    %rsp,%rbp
  803da1:	48 83 ec 10          	sub    $0x10,%rsp
  803da5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803da8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803daf:	00 00 00 
  803db2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803db5:	89 10                	mov    %edx,(%rax)
  803db7:	bf 04 00 00 00       	mov    $0x4,%edi
  803dbc:	48 b8 f7 3b 80 00 00 	movabs $0x803bf7,%rax
  803dc3:	00 00 00 
  803dc6:	ff d0                	callq  *%rax
  803dc8:	c9                   	leaveq 
  803dc9:	c3                   	retq   

0000000000803dca <nsipc_connect>:
  803dca:	55                   	push   %rbp
  803dcb:	48 89 e5             	mov    %rsp,%rbp
  803dce:	48 83 ec 10          	sub    $0x10,%rsp
  803dd2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803dd5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803dd9:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803ddc:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803de3:	00 00 00 
  803de6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803de9:	89 10                	mov    %edx,(%rax)
  803deb:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803dee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803df2:	48 89 c6             	mov    %rax,%rsi
  803df5:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803dfc:	00 00 00 
  803dff:	48 b8 1d 15 80 00 00 	movabs $0x80151d,%rax
  803e06:	00 00 00 
  803e09:	ff d0                	callq  *%rax
  803e0b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e12:	00 00 00 
  803e15:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e18:	89 50 14             	mov    %edx,0x14(%rax)
  803e1b:	bf 05 00 00 00       	mov    $0x5,%edi
  803e20:	48 b8 f7 3b 80 00 00 	movabs $0x803bf7,%rax
  803e27:	00 00 00 
  803e2a:	ff d0                	callq  *%rax
  803e2c:	c9                   	leaveq 
  803e2d:	c3                   	retq   

0000000000803e2e <nsipc_listen>:
  803e2e:	55                   	push   %rbp
  803e2f:	48 89 e5             	mov    %rsp,%rbp
  803e32:	48 83 ec 10          	sub    $0x10,%rsp
  803e36:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e39:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803e3c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e43:	00 00 00 
  803e46:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803e49:	89 10                	mov    %edx,(%rax)
  803e4b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e52:	00 00 00 
  803e55:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e58:	89 50 04             	mov    %edx,0x4(%rax)
  803e5b:	bf 06 00 00 00       	mov    $0x6,%edi
  803e60:	48 b8 f7 3b 80 00 00 	movabs $0x803bf7,%rax
  803e67:	00 00 00 
  803e6a:	ff d0                	callq  *%rax
  803e6c:	c9                   	leaveq 
  803e6d:	c3                   	retq   

0000000000803e6e <nsipc_recv>:
  803e6e:	55                   	push   %rbp
  803e6f:	48 89 e5             	mov    %rsp,%rbp
  803e72:	48 83 ec 30          	sub    $0x30,%rsp
  803e76:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e79:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803e7d:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803e80:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803e83:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e8a:	00 00 00 
  803e8d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803e90:	89 10                	mov    %edx,(%rax)
  803e92:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e99:	00 00 00 
  803e9c:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803e9f:	89 50 04             	mov    %edx,0x4(%rax)
  803ea2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ea9:	00 00 00 
  803eac:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803eaf:	89 50 08             	mov    %edx,0x8(%rax)
  803eb2:	bf 07 00 00 00       	mov    $0x7,%edi
  803eb7:	48 b8 f7 3b 80 00 00 	movabs $0x803bf7,%rax
  803ebe:	00 00 00 
  803ec1:	ff d0                	callq  *%rax
  803ec3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ec6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803eca:	78 69                	js     803f35 <nsipc_recv+0xc7>
  803ecc:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803ed3:	7f 08                	jg     803edd <nsipc_recv+0x6f>
  803ed5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ed8:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803edb:	7e 35                	jle    803f12 <nsipc_recv+0xa4>
  803edd:	48 b9 99 52 80 00 00 	movabs $0x805299,%rcx
  803ee4:	00 00 00 
  803ee7:	48 ba ae 52 80 00 00 	movabs $0x8052ae,%rdx
  803eee:	00 00 00 
  803ef1:	be 62 00 00 00       	mov    $0x62,%esi
  803ef6:	48 bf c3 52 80 00 00 	movabs $0x8052c3,%rdi
  803efd:	00 00 00 
  803f00:	b8 00 00 00 00       	mov    $0x0,%eax
  803f05:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  803f0c:	00 00 00 
  803f0f:	41 ff d0             	callq  *%r8
  803f12:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f15:	48 63 d0             	movslq %eax,%rdx
  803f18:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f1c:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803f23:	00 00 00 
  803f26:	48 89 c7             	mov    %rax,%rdi
  803f29:	48 b8 1d 15 80 00 00 	movabs $0x80151d,%rax
  803f30:	00 00 00 
  803f33:	ff d0                	callq  *%rax
  803f35:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f38:	c9                   	leaveq 
  803f39:	c3                   	retq   

0000000000803f3a <nsipc_send>:
  803f3a:	55                   	push   %rbp
  803f3b:	48 89 e5             	mov    %rsp,%rbp
  803f3e:	48 83 ec 20          	sub    $0x20,%rsp
  803f42:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f45:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803f49:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803f4c:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803f4f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f56:	00 00 00 
  803f59:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803f5c:	89 10                	mov    %edx,(%rax)
  803f5e:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803f65:	7e 35                	jle    803f9c <nsipc_send+0x62>
  803f67:	48 b9 d2 52 80 00 00 	movabs $0x8052d2,%rcx
  803f6e:	00 00 00 
  803f71:	48 ba ae 52 80 00 00 	movabs $0x8052ae,%rdx
  803f78:	00 00 00 
  803f7b:	be 6d 00 00 00       	mov    $0x6d,%esi
  803f80:	48 bf c3 52 80 00 00 	movabs $0x8052c3,%rdi
  803f87:	00 00 00 
  803f8a:	b8 00 00 00 00       	mov    $0x0,%eax
  803f8f:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  803f96:	00 00 00 
  803f99:	41 ff d0             	callq  *%r8
  803f9c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f9f:	48 63 d0             	movslq %eax,%rdx
  803fa2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fa6:	48 89 c6             	mov    %rax,%rsi
  803fa9:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803fb0:	00 00 00 
  803fb3:	48 b8 1d 15 80 00 00 	movabs $0x80151d,%rax
  803fba:	00 00 00 
  803fbd:	ff d0                	callq  *%rax
  803fbf:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fc6:	00 00 00 
  803fc9:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803fcc:	89 50 04             	mov    %edx,0x4(%rax)
  803fcf:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fd6:	00 00 00 
  803fd9:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803fdc:	89 50 08             	mov    %edx,0x8(%rax)
  803fdf:	bf 08 00 00 00       	mov    $0x8,%edi
  803fe4:	48 b8 f7 3b 80 00 00 	movabs $0x803bf7,%rax
  803feb:	00 00 00 
  803fee:	ff d0                	callq  *%rax
  803ff0:	c9                   	leaveq 
  803ff1:	c3                   	retq   

0000000000803ff2 <nsipc_socket>:
  803ff2:	55                   	push   %rbp
  803ff3:	48 89 e5             	mov    %rsp,%rbp
  803ff6:	48 83 ec 10          	sub    $0x10,%rsp
  803ffa:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ffd:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804000:	89 55 f4             	mov    %edx,-0xc(%rbp)
  804003:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80400a:	00 00 00 
  80400d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804010:	89 10                	mov    %edx,(%rax)
  804012:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804019:	00 00 00 
  80401c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80401f:	89 50 04             	mov    %edx,0x4(%rax)
  804022:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804029:	00 00 00 
  80402c:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80402f:	89 50 08             	mov    %edx,0x8(%rax)
  804032:	bf 09 00 00 00       	mov    $0x9,%edi
  804037:	48 b8 f7 3b 80 00 00 	movabs $0x803bf7,%rax
  80403e:	00 00 00 
  804041:	ff d0                	callq  *%rax
  804043:	c9                   	leaveq 
  804044:	c3                   	retq   

0000000000804045 <pipe>:
  804045:	55                   	push   %rbp
  804046:	48 89 e5             	mov    %rsp,%rbp
  804049:	53                   	push   %rbx
  80404a:	48 83 ec 38          	sub    $0x38,%rsp
  80404e:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  804052:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  804056:	48 89 c7             	mov    %rax,%rdi
  804059:	48 b8 c6 27 80 00 00 	movabs $0x8027c6,%rax
  804060:	00 00 00 
  804063:	ff d0                	callq  *%rax
  804065:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804068:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80406c:	0f 88 bf 01 00 00    	js     804231 <pipe+0x1ec>
  804072:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804076:	ba 07 04 00 00       	mov    $0x407,%edx
  80407b:	48 89 c6             	mov    %rax,%rsi
  80407e:	bf 00 00 00 00       	mov    $0x0,%edi
  804083:	48 b8 28 1b 80 00 00 	movabs $0x801b28,%rax
  80408a:	00 00 00 
  80408d:	ff d0                	callq  *%rax
  80408f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804092:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804096:	0f 88 95 01 00 00    	js     804231 <pipe+0x1ec>
  80409c:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8040a0:	48 89 c7             	mov    %rax,%rdi
  8040a3:	48 b8 c6 27 80 00 00 	movabs $0x8027c6,%rax
  8040aa:	00 00 00 
  8040ad:	ff d0                	callq  *%rax
  8040af:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8040b2:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8040b6:	0f 88 5d 01 00 00    	js     804219 <pipe+0x1d4>
  8040bc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8040c0:	ba 07 04 00 00       	mov    $0x407,%edx
  8040c5:	48 89 c6             	mov    %rax,%rsi
  8040c8:	bf 00 00 00 00       	mov    $0x0,%edi
  8040cd:	48 b8 28 1b 80 00 00 	movabs $0x801b28,%rax
  8040d4:	00 00 00 
  8040d7:	ff d0                	callq  *%rax
  8040d9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8040dc:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8040e0:	0f 88 33 01 00 00    	js     804219 <pipe+0x1d4>
  8040e6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8040ea:	48 89 c7             	mov    %rax,%rdi
  8040ed:	48 b8 9b 27 80 00 00 	movabs $0x80279b,%rax
  8040f4:	00 00 00 
  8040f7:	ff d0                	callq  *%rax
  8040f9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8040fd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804101:	ba 07 04 00 00       	mov    $0x407,%edx
  804106:	48 89 c6             	mov    %rax,%rsi
  804109:	bf 00 00 00 00       	mov    $0x0,%edi
  80410e:	48 b8 28 1b 80 00 00 	movabs $0x801b28,%rax
  804115:	00 00 00 
  804118:	ff d0                	callq  *%rax
  80411a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80411d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804121:	0f 88 d9 00 00 00    	js     804200 <pipe+0x1bb>
  804127:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80412b:	48 89 c7             	mov    %rax,%rdi
  80412e:	48 b8 9b 27 80 00 00 	movabs $0x80279b,%rax
  804135:	00 00 00 
  804138:	ff d0                	callq  *%rax
  80413a:	48 89 c2             	mov    %rax,%rdx
  80413d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804141:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  804147:	48 89 d1             	mov    %rdx,%rcx
  80414a:	ba 00 00 00 00       	mov    $0x0,%edx
  80414f:	48 89 c6             	mov    %rax,%rsi
  804152:	bf 00 00 00 00       	mov    $0x0,%edi
  804157:	48 b8 7a 1b 80 00 00 	movabs $0x801b7a,%rax
  80415e:	00 00 00 
  804161:	ff d0                	callq  *%rax
  804163:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804166:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80416a:	78 79                	js     8041e5 <pipe+0x1a0>
  80416c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804170:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804177:	00 00 00 
  80417a:	8b 12                	mov    (%rdx),%edx
  80417c:	89 10                	mov    %edx,(%rax)
  80417e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804182:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  804189:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80418d:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804194:	00 00 00 
  804197:	8b 12                	mov    (%rdx),%edx
  804199:	89 10                	mov    %edx,(%rax)
  80419b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80419f:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  8041a6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8041aa:	48 89 c7             	mov    %rax,%rdi
  8041ad:	48 b8 78 27 80 00 00 	movabs $0x802778,%rax
  8041b4:	00 00 00 
  8041b7:	ff d0                	callq  *%rax
  8041b9:	89 c2                	mov    %eax,%edx
  8041bb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8041bf:	89 10                	mov    %edx,(%rax)
  8041c1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8041c5:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8041c9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041cd:	48 89 c7             	mov    %rax,%rdi
  8041d0:	48 b8 78 27 80 00 00 	movabs $0x802778,%rax
  8041d7:	00 00 00 
  8041da:	ff d0                	callq  *%rax
  8041dc:	89 03                	mov    %eax,(%rbx)
  8041de:	b8 00 00 00 00       	mov    $0x0,%eax
  8041e3:	eb 4f                	jmp    804234 <pipe+0x1ef>
  8041e5:	90                   	nop
  8041e6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8041ea:	48 89 c6             	mov    %rax,%rsi
  8041ed:	bf 00 00 00 00       	mov    $0x0,%edi
  8041f2:	48 b8 da 1b 80 00 00 	movabs $0x801bda,%rax
  8041f9:	00 00 00 
  8041fc:	ff d0                	callq  *%rax
  8041fe:	eb 01                	jmp    804201 <pipe+0x1bc>
  804200:	90                   	nop
  804201:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804205:	48 89 c6             	mov    %rax,%rsi
  804208:	bf 00 00 00 00       	mov    $0x0,%edi
  80420d:	48 b8 da 1b 80 00 00 	movabs $0x801bda,%rax
  804214:	00 00 00 
  804217:	ff d0                	callq  *%rax
  804219:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80421d:	48 89 c6             	mov    %rax,%rsi
  804220:	bf 00 00 00 00       	mov    $0x0,%edi
  804225:	48 b8 da 1b 80 00 00 	movabs $0x801bda,%rax
  80422c:	00 00 00 
  80422f:	ff d0                	callq  *%rax
  804231:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804234:	48 83 c4 38          	add    $0x38,%rsp
  804238:	5b                   	pop    %rbx
  804239:	5d                   	pop    %rbp
  80423a:	c3                   	retq   

000000000080423b <_pipeisclosed>:
  80423b:	55                   	push   %rbp
  80423c:	48 89 e5             	mov    %rsp,%rbp
  80423f:	53                   	push   %rbx
  804240:	48 83 ec 28          	sub    $0x28,%rsp
  804244:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804248:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80424c:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804253:	00 00 00 
  804256:	48 8b 00             	mov    (%rax),%rax
  804259:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  80425f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804262:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804266:	48 89 c7             	mov    %rax,%rdi
  804269:	48 b8 ab 37 80 00 00 	movabs $0x8037ab,%rax
  804270:	00 00 00 
  804273:	ff d0                	callq  *%rax
  804275:	89 c3                	mov    %eax,%ebx
  804277:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80427b:	48 89 c7             	mov    %rax,%rdi
  80427e:	48 b8 ab 37 80 00 00 	movabs $0x8037ab,%rax
  804285:	00 00 00 
  804288:	ff d0                	callq  *%rax
  80428a:	39 c3                	cmp    %eax,%ebx
  80428c:	0f 94 c0             	sete   %al
  80428f:	0f b6 c0             	movzbl %al,%eax
  804292:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804295:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80429c:	00 00 00 
  80429f:	48 8b 00             	mov    (%rax),%rax
  8042a2:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  8042a8:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8042ab:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8042ae:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8042b1:	75 05                	jne    8042b8 <_pipeisclosed+0x7d>
  8042b3:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8042b6:	eb 4a                	jmp    804302 <_pipeisclosed+0xc7>
  8042b8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8042bb:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8042be:	74 8c                	je     80424c <_pipeisclosed+0x11>
  8042c0:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  8042c4:	75 86                	jne    80424c <_pipeisclosed+0x11>
  8042c6:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8042cd:	00 00 00 
  8042d0:	48 8b 00             	mov    (%rax),%rax
  8042d3:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8042d9:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8042dc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8042df:	89 c6                	mov    %eax,%esi
  8042e1:	48 bf e3 52 80 00 00 	movabs $0x8052e3,%rdi
  8042e8:	00 00 00 
  8042eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8042f0:	49 b8 68 06 80 00 00 	movabs $0x800668,%r8
  8042f7:	00 00 00 
  8042fa:	41 ff d0             	callq  *%r8
  8042fd:	e9 4a ff ff ff       	jmpq   80424c <_pipeisclosed+0x11>
  804302:	48 83 c4 28          	add    $0x28,%rsp
  804306:	5b                   	pop    %rbx
  804307:	5d                   	pop    %rbp
  804308:	c3                   	retq   

0000000000804309 <pipeisclosed>:
  804309:	55                   	push   %rbp
  80430a:	48 89 e5             	mov    %rsp,%rbp
  80430d:	48 83 ec 30          	sub    $0x30,%rsp
  804311:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804314:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  804318:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80431b:	48 89 d6             	mov    %rdx,%rsi
  80431e:	89 c7                	mov    %eax,%edi
  804320:	48 b8 5e 28 80 00 00 	movabs $0x80285e,%rax
  804327:	00 00 00 
  80432a:	ff d0                	callq  *%rax
  80432c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80432f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804333:	79 05                	jns    80433a <pipeisclosed+0x31>
  804335:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804338:	eb 31                	jmp    80436b <pipeisclosed+0x62>
  80433a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80433e:	48 89 c7             	mov    %rax,%rdi
  804341:	48 b8 9b 27 80 00 00 	movabs $0x80279b,%rax
  804348:	00 00 00 
  80434b:	ff d0                	callq  *%rax
  80434d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804351:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804355:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804359:	48 89 d6             	mov    %rdx,%rsi
  80435c:	48 89 c7             	mov    %rax,%rdi
  80435f:	48 b8 3b 42 80 00 00 	movabs $0x80423b,%rax
  804366:	00 00 00 
  804369:	ff d0                	callq  *%rax
  80436b:	c9                   	leaveq 
  80436c:	c3                   	retq   

000000000080436d <devpipe_read>:
  80436d:	55                   	push   %rbp
  80436e:	48 89 e5             	mov    %rsp,%rbp
  804371:	48 83 ec 40          	sub    $0x40,%rsp
  804375:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804379:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80437d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804381:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804385:	48 89 c7             	mov    %rax,%rdi
  804388:	48 b8 9b 27 80 00 00 	movabs $0x80279b,%rax
  80438f:	00 00 00 
  804392:	ff d0                	callq  *%rax
  804394:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804398:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80439c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8043a0:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8043a7:	00 
  8043a8:	e9 90 00 00 00       	jmpq   80443d <devpipe_read+0xd0>
  8043ad:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8043b2:	74 09                	je     8043bd <devpipe_read+0x50>
  8043b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043b8:	e9 8e 00 00 00       	jmpq   80444b <devpipe_read+0xde>
  8043bd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8043c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043c5:	48 89 d6             	mov    %rdx,%rsi
  8043c8:	48 89 c7             	mov    %rax,%rdi
  8043cb:	48 b8 3b 42 80 00 00 	movabs $0x80423b,%rax
  8043d2:	00 00 00 
  8043d5:	ff d0                	callq  *%rax
  8043d7:	85 c0                	test   %eax,%eax
  8043d9:	74 07                	je     8043e2 <devpipe_read+0x75>
  8043db:	b8 00 00 00 00       	mov    $0x0,%eax
  8043e0:	eb 69                	jmp    80444b <devpipe_read+0xde>
  8043e2:	48 b8 eb 1a 80 00 00 	movabs $0x801aeb,%rax
  8043e9:	00 00 00 
  8043ec:	ff d0                	callq  *%rax
  8043ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043f2:	8b 10                	mov    (%rax),%edx
  8043f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043f8:	8b 40 04             	mov    0x4(%rax),%eax
  8043fb:	39 c2                	cmp    %eax,%edx
  8043fd:	74 ae                	je     8043ad <devpipe_read+0x40>
  8043ff:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804403:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804407:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  80440b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80440f:	8b 00                	mov    (%rax),%eax
  804411:	99                   	cltd   
  804412:	c1 ea 1b             	shr    $0x1b,%edx
  804415:	01 d0                	add    %edx,%eax
  804417:	83 e0 1f             	and    $0x1f,%eax
  80441a:	29 d0                	sub    %edx,%eax
  80441c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804420:	48 98                	cltq   
  804422:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804427:	88 01                	mov    %al,(%rcx)
  804429:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80442d:	8b 00                	mov    (%rax),%eax
  80442f:	8d 50 01             	lea    0x1(%rax),%edx
  804432:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804436:	89 10                	mov    %edx,(%rax)
  804438:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80443d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804441:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804445:	72 a7                	jb     8043ee <devpipe_read+0x81>
  804447:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80444b:	c9                   	leaveq 
  80444c:	c3                   	retq   

000000000080444d <devpipe_write>:
  80444d:	55                   	push   %rbp
  80444e:	48 89 e5             	mov    %rsp,%rbp
  804451:	48 83 ec 40          	sub    $0x40,%rsp
  804455:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804459:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80445d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804461:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804465:	48 89 c7             	mov    %rax,%rdi
  804468:	48 b8 9b 27 80 00 00 	movabs $0x80279b,%rax
  80446f:	00 00 00 
  804472:	ff d0                	callq  *%rax
  804474:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804478:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80447c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804480:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804487:	00 
  804488:	e9 8f 00 00 00       	jmpq   80451c <devpipe_write+0xcf>
  80448d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804491:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804495:	48 89 d6             	mov    %rdx,%rsi
  804498:	48 89 c7             	mov    %rax,%rdi
  80449b:	48 b8 3b 42 80 00 00 	movabs $0x80423b,%rax
  8044a2:	00 00 00 
  8044a5:	ff d0                	callq  *%rax
  8044a7:	85 c0                	test   %eax,%eax
  8044a9:	74 07                	je     8044b2 <devpipe_write+0x65>
  8044ab:	b8 00 00 00 00       	mov    $0x0,%eax
  8044b0:	eb 78                	jmp    80452a <devpipe_write+0xdd>
  8044b2:	48 b8 eb 1a 80 00 00 	movabs $0x801aeb,%rax
  8044b9:	00 00 00 
  8044bc:	ff d0                	callq  *%rax
  8044be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044c2:	8b 40 04             	mov    0x4(%rax),%eax
  8044c5:	48 63 d0             	movslq %eax,%rdx
  8044c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044cc:	8b 00                	mov    (%rax),%eax
  8044ce:	48 98                	cltq   
  8044d0:	48 83 c0 20          	add    $0x20,%rax
  8044d4:	48 39 c2             	cmp    %rax,%rdx
  8044d7:	73 b4                	jae    80448d <devpipe_write+0x40>
  8044d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044dd:	8b 40 04             	mov    0x4(%rax),%eax
  8044e0:	99                   	cltd   
  8044e1:	c1 ea 1b             	shr    $0x1b,%edx
  8044e4:	01 d0                	add    %edx,%eax
  8044e6:	83 e0 1f             	and    $0x1f,%eax
  8044e9:	29 d0                	sub    %edx,%eax
  8044eb:	89 c6                	mov    %eax,%esi
  8044ed:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8044f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044f5:	48 01 d0             	add    %rdx,%rax
  8044f8:	0f b6 08             	movzbl (%rax),%ecx
  8044fb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8044ff:	48 63 c6             	movslq %esi,%rax
  804502:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  804506:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80450a:	8b 40 04             	mov    0x4(%rax),%eax
  80450d:	8d 50 01             	lea    0x1(%rax),%edx
  804510:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804514:	89 50 04             	mov    %edx,0x4(%rax)
  804517:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80451c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804520:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804524:	72 98                	jb     8044be <devpipe_write+0x71>
  804526:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80452a:	c9                   	leaveq 
  80452b:	c3                   	retq   

000000000080452c <devpipe_stat>:
  80452c:	55                   	push   %rbp
  80452d:	48 89 e5             	mov    %rsp,%rbp
  804530:	48 83 ec 20          	sub    $0x20,%rsp
  804534:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804538:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80453c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804540:	48 89 c7             	mov    %rax,%rdi
  804543:	48 b8 9b 27 80 00 00 	movabs $0x80279b,%rax
  80454a:	00 00 00 
  80454d:	ff d0                	callq  *%rax
  80454f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804553:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804557:	48 be f6 52 80 00 00 	movabs $0x8052f6,%rsi
  80455e:	00 00 00 
  804561:	48 89 c7             	mov    %rax,%rdi
  804564:	48 b8 f8 11 80 00 00 	movabs $0x8011f8,%rax
  80456b:	00 00 00 
  80456e:	ff d0                	callq  *%rax
  804570:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804574:	8b 50 04             	mov    0x4(%rax),%edx
  804577:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80457b:	8b 00                	mov    (%rax),%eax
  80457d:	29 c2                	sub    %eax,%edx
  80457f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804583:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804589:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80458d:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804594:	00 00 00 
  804597:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80459b:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  8045a2:	00 00 00 
  8045a5:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  8045ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8045b1:	c9                   	leaveq 
  8045b2:	c3                   	retq   

00000000008045b3 <devpipe_close>:
  8045b3:	55                   	push   %rbp
  8045b4:	48 89 e5             	mov    %rsp,%rbp
  8045b7:	48 83 ec 10          	sub    $0x10,%rsp
  8045bb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8045bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045c3:	48 89 c6             	mov    %rax,%rsi
  8045c6:	bf 00 00 00 00       	mov    $0x0,%edi
  8045cb:	48 b8 da 1b 80 00 00 	movabs $0x801bda,%rax
  8045d2:	00 00 00 
  8045d5:	ff d0                	callq  *%rax
  8045d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045db:	48 89 c7             	mov    %rax,%rdi
  8045de:	48 b8 9b 27 80 00 00 	movabs $0x80279b,%rax
  8045e5:	00 00 00 
  8045e8:	ff d0                	callq  *%rax
  8045ea:	48 89 c6             	mov    %rax,%rsi
  8045ed:	bf 00 00 00 00       	mov    $0x0,%edi
  8045f2:	48 b8 da 1b 80 00 00 	movabs $0x801bda,%rax
  8045f9:	00 00 00 
  8045fc:	ff d0                	callq  *%rax
  8045fe:	c9                   	leaveq 
  8045ff:	c3                   	retq   

0000000000804600 <cputchar>:
  804600:	55                   	push   %rbp
  804601:	48 89 e5             	mov    %rsp,%rbp
  804604:	48 83 ec 20          	sub    $0x20,%rsp
  804608:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80460b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80460e:	88 45 ff             	mov    %al,-0x1(%rbp)
  804611:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804615:	be 01 00 00 00       	mov    $0x1,%esi
  80461a:	48 89 c7             	mov    %rax,%rdi
  80461d:	48 b8 e0 19 80 00 00 	movabs $0x8019e0,%rax
  804624:	00 00 00 
  804627:	ff d0                	callq  *%rax
  804629:	90                   	nop
  80462a:	c9                   	leaveq 
  80462b:	c3                   	retq   

000000000080462c <getchar>:
  80462c:	55                   	push   %rbp
  80462d:	48 89 e5             	mov    %rsp,%rbp
  804630:	48 83 ec 10          	sub    $0x10,%rsp
  804634:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804638:	ba 01 00 00 00       	mov    $0x1,%edx
  80463d:	48 89 c6             	mov    %rax,%rsi
  804640:	bf 00 00 00 00       	mov    $0x0,%edi
  804645:	48 b8 93 2c 80 00 00 	movabs $0x802c93,%rax
  80464c:	00 00 00 
  80464f:	ff d0                	callq  *%rax
  804651:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804654:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804658:	79 05                	jns    80465f <getchar+0x33>
  80465a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80465d:	eb 14                	jmp    804673 <getchar+0x47>
  80465f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804663:	7f 07                	jg     80466c <getchar+0x40>
  804665:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  80466a:	eb 07                	jmp    804673 <getchar+0x47>
  80466c:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804670:	0f b6 c0             	movzbl %al,%eax
  804673:	c9                   	leaveq 
  804674:	c3                   	retq   

0000000000804675 <iscons>:
  804675:	55                   	push   %rbp
  804676:	48 89 e5             	mov    %rsp,%rbp
  804679:	48 83 ec 20          	sub    $0x20,%rsp
  80467d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804680:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804684:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804687:	48 89 d6             	mov    %rdx,%rsi
  80468a:	89 c7                	mov    %eax,%edi
  80468c:	48 b8 5e 28 80 00 00 	movabs $0x80285e,%rax
  804693:	00 00 00 
  804696:	ff d0                	callq  *%rax
  804698:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80469b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80469f:	79 05                	jns    8046a6 <iscons+0x31>
  8046a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046a4:	eb 1a                	jmp    8046c0 <iscons+0x4b>
  8046a6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046aa:	8b 10                	mov    (%rax),%edx
  8046ac:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  8046b3:	00 00 00 
  8046b6:	8b 00                	mov    (%rax),%eax
  8046b8:	39 c2                	cmp    %eax,%edx
  8046ba:	0f 94 c0             	sete   %al
  8046bd:	0f b6 c0             	movzbl %al,%eax
  8046c0:	c9                   	leaveq 
  8046c1:	c3                   	retq   

00000000008046c2 <opencons>:
  8046c2:	55                   	push   %rbp
  8046c3:	48 89 e5             	mov    %rsp,%rbp
  8046c6:	48 83 ec 10          	sub    $0x10,%rsp
  8046ca:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8046ce:	48 89 c7             	mov    %rax,%rdi
  8046d1:	48 b8 c6 27 80 00 00 	movabs $0x8027c6,%rax
  8046d8:	00 00 00 
  8046db:	ff d0                	callq  *%rax
  8046dd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046e0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046e4:	79 05                	jns    8046eb <opencons+0x29>
  8046e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046e9:	eb 5b                	jmp    804746 <opencons+0x84>
  8046eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046ef:	ba 07 04 00 00       	mov    $0x407,%edx
  8046f4:	48 89 c6             	mov    %rax,%rsi
  8046f7:	bf 00 00 00 00       	mov    $0x0,%edi
  8046fc:	48 b8 28 1b 80 00 00 	movabs $0x801b28,%rax
  804703:	00 00 00 
  804706:	ff d0                	callq  *%rax
  804708:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80470b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80470f:	79 05                	jns    804716 <opencons+0x54>
  804711:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804714:	eb 30                	jmp    804746 <opencons+0x84>
  804716:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80471a:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  804721:	00 00 00 
  804724:	8b 12                	mov    (%rdx),%edx
  804726:	89 10                	mov    %edx,(%rax)
  804728:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80472c:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804733:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804737:	48 89 c7             	mov    %rax,%rdi
  80473a:	48 b8 78 27 80 00 00 	movabs $0x802778,%rax
  804741:	00 00 00 
  804744:	ff d0                	callq  *%rax
  804746:	c9                   	leaveq 
  804747:	c3                   	retq   

0000000000804748 <devcons_read>:
  804748:	55                   	push   %rbp
  804749:	48 89 e5             	mov    %rsp,%rbp
  80474c:	48 83 ec 30          	sub    $0x30,%rsp
  804750:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804754:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804758:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80475c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804761:	75 13                	jne    804776 <devcons_read+0x2e>
  804763:	b8 00 00 00 00       	mov    $0x0,%eax
  804768:	eb 49                	jmp    8047b3 <devcons_read+0x6b>
  80476a:	48 b8 eb 1a 80 00 00 	movabs $0x801aeb,%rax
  804771:	00 00 00 
  804774:	ff d0                	callq  *%rax
  804776:	48 b8 2d 1a 80 00 00 	movabs $0x801a2d,%rax
  80477d:	00 00 00 
  804780:	ff d0                	callq  *%rax
  804782:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804785:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804789:	74 df                	je     80476a <devcons_read+0x22>
  80478b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80478f:	79 05                	jns    804796 <devcons_read+0x4e>
  804791:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804794:	eb 1d                	jmp    8047b3 <devcons_read+0x6b>
  804796:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  80479a:	75 07                	jne    8047a3 <devcons_read+0x5b>
  80479c:	b8 00 00 00 00       	mov    $0x0,%eax
  8047a1:	eb 10                	jmp    8047b3 <devcons_read+0x6b>
  8047a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047a6:	89 c2                	mov    %eax,%edx
  8047a8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8047ac:	88 10                	mov    %dl,(%rax)
  8047ae:	b8 01 00 00 00       	mov    $0x1,%eax
  8047b3:	c9                   	leaveq 
  8047b4:	c3                   	retq   

00000000008047b5 <devcons_write>:
  8047b5:	55                   	push   %rbp
  8047b6:	48 89 e5             	mov    %rsp,%rbp
  8047b9:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8047c0:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8047c7:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8047ce:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8047d5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8047dc:	eb 76                	jmp    804854 <devcons_write+0x9f>
  8047de:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8047e5:	89 c2                	mov    %eax,%edx
  8047e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047ea:	29 c2                	sub    %eax,%edx
  8047ec:	89 d0                	mov    %edx,%eax
  8047ee:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8047f1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8047f4:	83 f8 7f             	cmp    $0x7f,%eax
  8047f7:	76 07                	jbe    804800 <devcons_write+0x4b>
  8047f9:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804800:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804803:	48 63 d0             	movslq %eax,%rdx
  804806:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804809:	48 63 c8             	movslq %eax,%rcx
  80480c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804813:	48 01 c1             	add    %rax,%rcx
  804816:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80481d:	48 89 ce             	mov    %rcx,%rsi
  804820:	48 89 c7             	mov    %rax,%rdi
  804823:	48 b8 1d 15 80 00 00 	movabs $0x80151d,%rax
  80482a:	00 00 00 
  80482d:	ff d0                	callq  *%rax
  80482f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804832:	48 63 d0             	movslq %eax,%rdx
  804835:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80483c:	48 89 d6             	mov    %rdx,%rsi
  80483f:	48 89 c7             	mov    %rax,%rdi
  804842:	48 b8 e0 19 80 00 00 	movabs $0x8019e0,%rax
  804849:	00 00 00 
  80484c:	ff d0                	callq  *%rax
  80484e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804851:	01 45 fc             	add    %eax,-0x4(%rbp)
  804854:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804857:	48 98                	cltq   
  804859:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804860:	0f 82 78 ff ff ff    	jb     8047de <devcons_write+0x29>
  804866:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804869:	c9                   	leaveq 
  80486a:	c3                   	retq   

000000000080486b <devcons_close>:
  80486b:	55                   	push   %rbp
  80486c:	48 89 e5             	mov    %rsp,%rbp
  80486f:	48 83 ec 08          	sub    $0x8,%rsp
  804873:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804877:	b8 00 00 00 00       	mov    $0x0,%eax
  80487c:	c9                   	leaveq 
  80487d:	c3                   	retq   

000000000080487e <devcons_stat>:
  80487e:	55                   	push   %rbp
  80487f:	48 89 e5             	mov    %rsp,%rbp
  804882:	48 83 ec 10          	sub    $0x10,%rsp
  804886:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80488a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80488e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804892:	48 be 02 53 80 00 00 	movabs $0x805302,%rsi
  804899:	00 00 00 
  80489c:	48 89 c7             	mov    %rax,%rdi
  80489f:	48 b8 f8 11 80 00 00 	movabs $0x8011f8,%rax
  8048a6:	00 00 00 
  8048a9:	ff d0                	callq  *%rax
  8048ab:	b8 00 00 00 00       	mov    $0x0,%eax
  8048b0:	c9                   	leaveq 
  8048b1:	c3                   	retq   

00000000008048b2 <set_pgfault_handler>:
  8048b2:	55                   	push   %rbp
  8048b3:	48 89 e5             	mov    %rsp,%rbp
  8048b6:	48 83 ec 20          	sub    $0x20,%rsp
  8048ba:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8048be:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8048c5:	00 00 00 
  8048c8:	48 8b 00             	mov    (%rax),%rax
  8048cb:	48 85 c0             	test   %rax,%rax
  8048ce:	75 6f                	jne    80493f <set_pgfault_handler+0x8d>
  8048d0:	ba 07 00 00 00       	mov    $0x7,%edx
  8048d5:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8048da:	bf 00 00 00 00       	mov    $0x0,%edi
  8048df:	48 b8 28 1b 80 00 00 	movabs $0x801b28,%rax
  8048e6:	00 00 00 
  8048e9:	ff d0                	callq  *%rax
  8048eb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8048ee:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048f2:	79 30                	jns    804924 <set_pgfault_handler+0x72>
  8048f4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048f7:	89 c1                	mov    %eax,%ecx
  8048f9:	48 ba 10 53 80 00 00 	movabs $0x805310,%rdx
  804900:	00 00 00 
  804903:	be 22 00 00 00       	mov    $0x22,%esi
  804908:	48 bf 2f 53 80 00 00 	movabs $0x80532f,%rdi
  80490f:	00 00 00 
  804912:	b8 00 00 00 00       	mov    $0x0,%eax
  804917:	49 b8 2e 04 80 00 00 	movabs $0x80042e,%r8
  80491e:	00 00 00 
  804921:	41 ff d0             	callq  *%r8
  804924:	48 be 53 49 80 00 00 	movabs $0x804953,%rsi
  80492b:	00 00 00 
  80492e:	bf 00 00 00 00       	mov    $0x0,%edi
  804933:	48 b8 bf 1c 80 00 00 	movabs $0x801cbf,%rax
  80493a:	00 00 00 
  80493d:	ff d0                	callq  *%rax
  80493f:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804946:	00 00 00 
  804949:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80494d:	48 89 10             	mov    %rdx,(%rax)
  804950:	90                   	nop
  804951:	c9                   	leaveq 
  804952:	c3                   	retq   

0000000000804953 <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  804953:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  804956:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  80495d:	00 00 00 
call *%rax
  804960:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  804962:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  804969:	00 08 
    movq 152(%rsp), %rax
  80496b:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  804972:	00 
    movq 136(%rsp), %rbx
  804973:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  80497a:	00 
movq %rbx, (%rax)
  80497b:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  80497e:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  804982:	4c 8b 3c 24          	mov    (%rsp),%r15
  804986:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  80498b:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  804990:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  804995:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  80499a:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  80499f:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  8049a4:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  8049a9:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  8049ae:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  8049b3:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  8049b8:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  8049bd:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  8049c2:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  8049c7:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  8049cc:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  8049d0:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  8049d4:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  8049d5:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  8049da:	c3                   	retq   
