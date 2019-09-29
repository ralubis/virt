
vmm/guest/obj/user/spawnhello:     file format elf64-x86-64


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
  80003c:	e8 a7 00 00 00       	callq  8000e8 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800052:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800059:	00 00 00 
  80005c:	48 8b 00             	mov    (%rax),%rax
  80005f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800065:	89 c6                	mov    %eax,%esi
  800067:	48 bf 80 4b 80 00 00 	movabs $0x804b80,%rdi
  80006e:	00 00 00 
  800071:	b8 00 00 00 00       	mov    $0x0,%eax
  800076:	48 ba ca 03 80 00 00 	movabs $0x8003ca,%rdx
  80007d:	00 00 00 
  800080:	ff d2                	callq  *%rdx
  800082:	ba 00 00 00 00       	mov    $0x0,%edx
  800087:	48 be 9e 4b 80 00 00 	movabs $0x804b9e,%rsi
  80008e:	00 00 00 
  800091:	48 bf a4 4b 80 00 00 	movabs $0x804ba4,%rdi
  800098:	00 00 00 
  80009b:	b8 00 00 00 00       	mov    $0x0,%eax
  8000a0:	48 b9 11 30 80 00 00 	movabs $0x803011,%rcx
  8000a7:	00 00 00 
  8000aa:	ff d1                	callq  *%rcx
  8000ac:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8000af:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000b3:	79 30                	jns    8000e5 <umain+0xa2>
  8000b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000b8:	89 c1                	mov    %eax,%ecx
  8000ba:	48 ba af 4b 80 00 00 	movabs $0x804baf,%rdx
  8000c1:	00 00 00 
  8000c4:	be 0a 00 00 00       	mov    $0xa,%esi
  8000c9:	48 bf c7 4b 80 00 00 	movabs $0x804bc7,%rdi
  8000d0:	00 00 00 
  8000d3:	b8 00 00 00 00       	mov    $0x0,%eax
  8000d8:	49 b8 90 01 80 00 00 	movabs $0x800190,%r8
  8000df:	00 00 00 
  8000e2:	41 ff d0             	callq  *%r8
  8000e5:	90                   	nop
  8000e6:	c9                   	leaveq 
  8000e7:	c3                   	retq   

00000000008000e8 <libmain>:
  8000e8:	55                   	push   %rbp
  8000e9:	48 89 e5             	mov    %rsp,%rbp
  8000ec:	48 83 ec 10          	sub    $0x10,%rsp
  8000f0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8000f3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8000f7:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  8000fe:	00 00 00 
  800101:	ff d0                	callq  *%rax
  800103:	25 ff 03 00 00       	and    $0x3ff,%eax
  800108:	48 98                	cltq   
  80010a:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800111:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800118:	00 00 00 
  80011b:	48 01 c2             	add    %rax,%rdx
  80011e:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800125:	00 00 00 
  800128:	48 89 10             	mov    %rdx,(%rax)
  80012b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80012f:	7e 14                	jle    800145 <libmain+0x5d>
  800131:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800135:	48 8b 10             	mov    (%rax),%rdx
  800138:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80013f:	00 00 00 
  800142:	48 89 10             	mov    %rdx,(%rax)
  800145:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800149:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80014c:	48 89 d6             	mov    %rdx,%rsi
  80014f:	89 c7                	mov    %eax,%edi
  800151:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800158:	00 00 00 
  80015b:	ff d0                	callq  *%rax
  80015d:	48 b8 6c 01 80 00 00 	movabs $0x80016c,%rax
  800164:	00 00 00 
  800167:	ff d0                	callq  *%rax
  800169:	90                   	nop
  80016a:	c9                   	leaveq 
  80016b:	c3                   	retq   

000000000080016c <exit>:
  80016c:	55                   	push   %rbp
  80016d:	48 89 e5             	mov    %rsp,%rbp
  800170:	48 b8 c9 1f 80 00 00 	movabs $0x801fc9,%rax
  800177:	00 00 00 
  80017a:	ff d0                	callq  *%rax
  80017c:	bf 00 00 00 00       	mov    $0x0,%edi
  800181:	48 b8 cb 17 80 00 00 	movabs $0x8017cb,%rax
  800188:	00 00 00 
  80018b:	ff d0                	callq  *%rax
  80018d:	90                   	nop
  80018e:	5d                   	pop    %rbp
  80018f:	c3                   	retq   

0000000000800190 <_panic>:
  800190:	55                   	push   %rbp
  800191:	48 89 e5             	mov    %rsp,%rbp
  800194:	53                   	push   %rbx
  800195:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80019c:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8001a3:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8001a9:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8001b0:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  8001b7:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8001be:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8001c5:	84 c0                	test   %al,%al
  8001c7:	74 23                	je     8001ec <_panic+0x5c>
  8001c9:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  8001d0:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  8001d4:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  8001d8:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  8001dc:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  8001e0:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  8001e4:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  8001e8:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  8001ec:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8001f3:	00 00 00 
  8001f6:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8001fd:	00 00 00 
  800200:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800204:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80020b:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800212:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800219:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800220:	00 00 00 
  800223:	48 8b 18             	mov    (%rax),%rbx
  800226:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  80022d:	00 00 00 
  800230:	ff d0                	callq  *%rax
  800232:	89 c6                	mov    %eax,%esi
  800234:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  80023a:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  800241:	41 89 d0             	mov    %edx,%r8d
  800244:	48 89 c1             	mov    %rax,%rcx
  800247:	48 89 da             	mov    %rbx,%rdx
  80024a:	48 bf e8 4b 80 00 00 	movabs $0x804be8,%rdi
  800251:	00 00 00 
  800254:	b8 00 00 00 00       	mov    $0x0,%eax
  800259:	49 b9 ca 03 80 00 00 	movabs $0x8003ca,%r9
  800260:	00 00 00 
  800263:	41 ff d1             	callq  *%r9
  800266:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  80026d:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800274:	48 89 d6             	mov    %rdx,%rsi
  800277:	48 89 c7             	mov    %rax,%rdi
  80027a:	48 b8 1e 03 80 00 00 	movabs $0x80031e,%rax
  800281:	00 00 00 
  800284:	ff d0                	callq  *%rax
  800286:	48 bf 0b 4c 80 00 00 	movabs $0x804c0b,%rdi
  80028d:	00 00 00 
  800290:	b8 00 00 00 00       	mov    $0x0,%eax
  800295:	48 ba ca 03 80 00 00 	movabs $0x8003ca,%rdx
  80029c:	00 00 00 
  80029f:	ff d2                	callq  *%rdx
  8002a1:	cc                   	int3   
  8002a2:	eb fd                	jmp    8002a1 <_panic+0x111>

00000000008002a4 <putch>:
  8002a4:	55                   	push   %rbp
  8002a5:	48 89 e5             	mov    %rsp,%rbp
  8002a8:	48 83 ec 10          	sub    $0x10,%rsp
  8002ac:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8002af:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8002b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002b7:	8b 00                	mov    (%rax),%eax
  8002b9:	8d 48 01             	lea    0x1(%rax),%ecx
  8002bc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8002c0:	89 0a                	mov    %ecx,(%rdx)
  8002c2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8002c5:	89 d1                	mov    %edx,%ecx
  8002c7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8002cb:	48 98                	cltq   
  8002cd:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8002d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002d5:	8b 00                	mov    (%rax),%eax
  8002d7:	3d ff 00 00 00       	cmp    $0xff,%eax
  8002dc:	75 2c                	jne    80030a <putch+0x66>
  8002de:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002e2:	8b 00                	mov    (%rax),%eax
  8002e4:	48 98                	cltq   
  8002e6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8002ea:	48 83 c2 08          	add    $0x8,%rdx
  8002ee:	48 89 c6             	mov    %rax,%rsi
  8002f1:	48 89 d7             	mov    %rdx,%rdi
  8002f4:	48 b8 42 17 80 00 00 	movabs $0x801742,%rax
  8002fb:	00 00 00 
  8002fe:	ff d0                	callq  *%rax
  800300:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800304:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80030a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80030e:	8b 40 04             	mov    0x4(%rax),%eax
  800311:	8d 50 01             	lea    0x1(%rax),%edx
  800314:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800318:	89 50 04             	mov    %edx,0x4(%rax)
  80031b:	90                   	nop
  80031c:	c9                   	leaveq 
  80031d:	c3                   	retq   

000000000080031e <vcprintf>:
  80031e:	55                   	push   %rbp
  80031f:	48 89 e5             	mov    %rsp,%rbp
  800322:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800329:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800330:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800337:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  80033e:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800345:	48 8b 0a             	mov    (%rdx),%rcx
  800348:	48 89 08             	mov    %rcx,(%rax)
  80034b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80034f:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800353:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800357:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80035b:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800362:	00 00 00 
  800365:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80036c:	00 00 00 
  80036f:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800376:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80037d:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800384:	48 89 c6             	mov    %rax,%rsi
  800387:	48 bf a4 02 80 00 00 	movabs $0x8002a4,%rdi
  80038e:	00 00 00 
  800391:	48 b8 68 07 80 00 00 	movabs $0x800768,%rax
  800398:	00 00 00 
  80039b:	ff d0                	callq  *%rax
  80039d:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8003a3:	48 98                	cltq   
  8003a5:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8003ac:	48 83 c2 08          	add    $0x8,%rdx
  8003b0:	48 89 c6             	mov    %rax,%rsi
  8003b3:	48 89 d7             	mov    %rdx,%rdi
  8003b6:	48 b8 42 17 80 00 00 	movabs $0x801742,%rax
  8003bd:	00 00 00 
  8003c0:	ff d0                	callq  *%rax
  8003c2:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8003c8:	c9                   	leaveq 
  8003c9:	c3                   	retq   

00000000008003ca <cprintf>:
  8003ca:	55                   	push   %rbp
  8003cb:	48 89 e5             	mov    %rsp,%rbp
  8003ce:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  8003d5:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8003dc:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8003e3:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8003ea:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8003f1:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8003f8:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8003ff:	84 c0                	test   %al,%al
  800401:	74 20                	je     800423 <cprintf+0x59>
  800403:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800407:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80040b:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80040f:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800413:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800417:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80041b:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80041f:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800423:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80042a:	00 00 00 
  80042d:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800434:	00 00 00 
  800437:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80043b:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800442:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800449:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800450:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800457:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80045e:	48 8b 0a             	mov    (%rdx),%rcx
  800461:	48 89 08             	mov    %rcx,(%rax)
  800464:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800468:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80046c:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800470:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800474:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80047b:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800482:	48 89 d6             	mov    %rdx,%rsi
  800485:	48 89 c7             	mov    %rax,%rdi
  800488:	48 b8 1e 03 80 00 00 	movabs $0x80031e,%rax
  80048f:	00 00 00 
  800492:	ff d0                	callq  *%rax
  800494:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80049a:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8004a0:	c9                   	leaveq 
  8004a1:	c3                   	retq   

00000000008004a2 <printnum>:
  8004a2:	55                   	push   %rbp
  8004a3:	48 89 e5             	mov    %rsp,%rbp
  8004a6:	48 83 ec 30          	sub    $0x30,%rsp
  8004aa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8004ae:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8004b2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8004b6:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  8004b9:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  8004bd:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  8004c1:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8004c4:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  8004c8:	77 54                	ja     80051e <printnum+0x7c>
  8004ca:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8004cd:	8d 78 ff             	lea    -0x1(%rax),%edi
  8004d0:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  8004d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004d7:	ba 00 00 00 00       	mov    $0x0,%edx
  8004dc:	48 f7 f6             	div    %rsi
  8004df:	49 89 c2             	mov    %rax,%r10
  8004e2:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8004e5:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8004e8:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8004ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004f0:	41 89 c9             	mov    %ecx,%r9d
  8004f3:	41 89 f8             	mov    %edi,%r8d
  8004f6:	89 d1                	mov    %edx,%ecx
  8004f8:	4c 89 d2             	mov    %r10,%rdx
  8004fb:	48 89 c7             	mov    %rax,%rdi
  8004fe:	48 b8 a2 04 80 00 00 	movabs $0x8004a2,%rax
  800505:	00 00 00 
  800508:	ff d0                	callq  *%rax
  80050a:	eb 1c                	jmp    800528 <printnum+0x86>
  80050c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800510:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800513:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800517:	48 89 ce             	mov    %rcx,%rsi
  80051a:	89 d7                	mov    %edx,%edi
  80051c:	ff d0                	callq  *%rax
  80051e:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  800522:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  800526:	7f e4                	jg     80050c <printnum+0x6a>
  800528:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80052b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80052f:	ba 00 00 00 00       	mov    $0x0,%edx
  800534:	48 f7 f1             	div    %rcx
  800537:	48 b8 10 4e 80 00 00 	movabs $0x804e10,%rax
  80053e:	00 00 00 
  800541:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  800545:	0f be d0             	movsbl %al,%edx
  800548:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80054c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800550:	48 89 ce             	mov    %rcx,%rsi
  800553:	89 d7                	mov    %edx,%edi
  800555:	ff d0                	callq  *%rax
  800557:	90                   	nop
  800558:	c9                   	leaveq 
  800559:	c3                   	retq   

000000000080055a <getuint>:
  80055a:	55                   	push   %rbp
  80055b:	48 89 e5             	mov    %rsp,%rbp
  80055e:	48 83 ec 20          	sub    $0x20,%rsp
  800562:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800566:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800569:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80056d:	7e 4f                	jle    8005be <getuint+0x64>
  80056f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800573:	8b 00                	mov    (%rax),%eax
  800575:	83 f8 30             	cmp    $0x30,%eax
  800578:	73 24                	jae    80059e <getuint+0x44>
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
  80059c:	eb 14                	jmp    8005b2 <getuint+0x58>
  80059e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005a2:	48 8b 40 08          	mov    0x8(%rax),%rax
  8005a6:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8005aa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005ae:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8005b2:	48 8b 00             	mov    (%rax),%rax
  8005b5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8005b9:	e9 9d 00 00 00       	jmpq   80065b <getuint+0x101>
  8005be:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8005c2:	74 4c                	je     800610 <getuint+0xb6>
  8005c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005c8:	8b 00                	mov    (%rax),%eax
  8005ca:	83 f8 30             	cmp    $0x30,%eax
  8005cd:	73 24                	jae    8005f3 <getuint+0x99>
  8005cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005d3:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8005d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005db:	8b 00                	mov    (%rax),%eax
  8005dd:	89 c0                	mov    %eax,%eax
  8005df:	48 01 d0             	add    %rdx,%rax
  8005e2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005e6:	8b 12                	mov    (%rdx),%edx
  8005e8:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8005eb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005ef:	89 0a                	mov    %ecx,(%rdx)
  8005f1:	eb 14                	jmp    800607 <getuint+0xad>
  8005f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005f7:	48 8b 40 08          	mov    0x8(%rax),%rax
  8005fb:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8005ff:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800603:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800607:	48 8b 00             	mov    (%rax),%rax
  80060a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80060e:	eb 4b                	jmp    80065b <getuint+0x101>
  800610:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800614:	8b 00                	mov    (%rax),%eax
  800616:	83 f8 30             	cmp    $0x30,%eax
  800619:	73 24                	jae    80063f <getuint+0xe5>
  80061b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80061f:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800623:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800627:	8b 00                	mov    (%rax),%eax
  800629:	89 c0                	mov    %eax,%eax
  80062b:	48 01 d0             	add    %rdx,%rax
  80062e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800632:	8b 12                	mov    (%rdx),%edx
  800634:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800637:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80063b:	89 0a                	mov    %ecx,(%rdx)
  80063d:	eb 14                	jmp    800653 <getuint+0xf9>
  80063f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800643:	48 8b 40 08          	mov    0x8(%rax),%rax
  800647:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80064b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80064f:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800653:	8b 00                	mov    (%rax),%eax
  800655:	89 c0                	mov    %eax,%eax
  800657:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80065b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80065f:	c9                   	leaveq 
  800660:	c3                   	retq   

0000000000800661 <getint>:
  800661:	55                   	push   %rbp
  800662:	48 89 e5             	mov    %rsp,%rbp
  800665:	48 83 ec 20          	sub    $0x20,%rsp
  800669:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80066d:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800670:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800674:	7e 4f                	jle    8006c5 <getint+0x64>
  800676:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80067a:	8b 00                	mov    (%rax),%eax
  80067c:	83 f8 30             	cmp    $0x30,%eax
  80067f:	73 24                	jae    8006a5 <getint+0x44>
  800681:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800685:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800689:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80068d:	8b 00                	mov    (%rax),%eax
  80068f:	89 c0                	mov    %eax,%eax
  800691:	48 01 d0             	add    %rdx,%rax
  800694:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800698:	8b 12                	mov    (%rdx),%edx
  80069a:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80069d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006a1:	89 0a                	mov    %ecx,(%rdx)
  8006a3:	eb 14                	jmp    8006b9 <getint+0x58>
  8006a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006a9:	48 8b 40 08          	mov    0x8(%rax),%rax
  8006ad:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8006b1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006b5:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006b9:	48 8b 00             	mov    (%rax),%rax
  8006bc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006c0:	e9 9d 00 00 00       	jmpq   800762 <getint+0x101>
  8006c5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8006c9:	74 4c                	je     800717 <getint+0xb6>
  8006cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006cf:	8b 00                	mov    (%rax),%eax
  8006d1:	83 f8 30             	cmp    $0x30,%eax
  8006d4:	73 24                	jae    8006fa <getint+0x99>
  8006d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006da:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006e2:	8b 00                	mov    (%rax),%eax
  8006e4:	89 c0                	mov    %eax,%eax
  8006e6:	48 01 d0             	add    %rdx,%rax
  8006e9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006ed:	8b 12                	mov    (%rdx),%edx
  8006ef:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006f2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006f6:	89 0a                	mov    %ecx,(%rdx)
  8006f8:	eb 14                	jmp    80070e <getint+0xad>
  8006fa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006fe:	48 8b 40 08          	mov    0x8(%rax),%rax
  800702:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800706:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80070a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80070e:	48 8b 00             	mov    (%rax),%rax
  800711:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800715:	eb 4b                	jmp    800762 <getint+0x101>
  800717:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80071b:	8b 00                	mov    (%rax),%eax
  80071d:	83 f8 30             	cmp    $0x30,%eax
  800720:	73 24                	jae    800746 <getint+0xe5>
  800722:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800726:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80072a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80072e:	8b 00                	mov    (%rax),%eax
  800730:	89 c0                	mov    %eax,%eax
  800732:	48 01 d0             	add    %rdx,%rax
  800735:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800739:	8b 12                	mov    (%rdx),%edx
  80073b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80073e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800742:	89 0a                	mov    %ecx,(%rdx)
  800744:	eb 14                	jmp    80075a <getint+0xf9>
  800746:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80074a:	48 8b 40 08          	mov    0x8(%rax),%rax
  80074e:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800752:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800756:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80075a:	8b 00                	mov    (%rax),%eax
  80075c:	48 98                	cltq   
  80075e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800762:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800766:	c9                   	leaveq 
  800767:	c3                   	retq   

0000000000800768 <vprintfmt>:
  800768:	55                   	push   %rbp
  800769:	48 89 e5             	mov    %rsp,%rbp
  80076c:	41 54                	push   %r12
  80076e:	53                   	push   %rbx
  80076f:	48 83 ec 60          	sub    $0x60,%rsp
  800773:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800777:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  80077b:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80077f:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800783:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800787:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  80078b:	48 8b 0a             	mov    (%rdx),%rcx
  80078e:	48 89 08             	mov    %rcx,(%rax)
  800791:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800795:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800799:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80079d:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8007a1:	eb 17                	jmp    8007ba <vprintfmt+0x52>
  8007a3:	85 db                	test   %ebx,%ebx
  8007a5:	0f 84 b9 04 00 00    	je     800c64 <vprintfmt+0x4fc>
  8007ab:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8007af:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8007b3:	48 89 d6             	mov    %rdx,%rsi
  8007b6:	89 df                	mov    %ebx,%edi
  8007b8:	ff d0                	callq  *%rax
  8007ba:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8007be:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8007c2:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8007c6:	0f b6 00             	movzbl (%rax),%eax
  8007c9:	0f b6 d8             	movzbl %al,%ebx
  8007cc:	83 fb 25             	cmp    $0x25,%ebx
  8007cf:	75 d2                	jne    8007a3 <vprintfmt+0x3b>
  8007d1:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  8007d5:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  8007dc:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8007e3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8007ea:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  8007f1:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8007f5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8007f9:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8007fd:	0f b6 00             	movzbl (%rax),%eax
  800800:	0f b6 d8             	movzbl %al,%ebx
  800803:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800806:	83 f8 55             	cmp    $0x55,%eax
  800809:	0f 87 22 04 00 00    	ja     800c31 <vprintfmt+0x4c9>
  80080f:	89 c0                	mov    %eax,%eax
  800811:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800818:	00 
  800819:	48 b8 38 4e 80 00 00 	movabs $0x804e38,%rax
  800820:	00 00 00 
  800823:	48 01 d0             	add    %rdx,%rax
  800826:	48 8b 00             	mov    (%rax),%rax
  800829:	ff e0                	jmpq   *%rax
  80082b:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  80082f:	eb c0                	jmp    8007f1 <vprintfmt+0x89>
  800831:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800835:	eb ba                	jmp    8007f1 <vprintfmt+0x89>
  800837:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  80083e:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800841:	89 d0                	mov    %edx,%eax
  800843:	c1 e0 02             	shl    $0x2,%eax
  800846:	01 d0                	add    %edx,%eax
  800848:	01 c0                	add    %eax,%eax
  80084a:	01 d8                	add    %ebx,%eax
  80084c:	83 e8 30             	sub    $0x30,%eax
  80084f:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800852:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800856:	0f b6 00             	movzbl (%rax),%eax
  800859:	0f be d8             	movsbl %al,%ebx
  80085c:	83 fb 2f             	cmp    $0x2f,%ebx
  80085f:	7e 60                	jle    8008c1 <vprintfmt+0x159>
  800861:	83 fb 39             	cmp    $0x39,%ebx
  800864:	7f 5b                	jg     8008c1 <vprintfmt+0x159>
  800866:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  80086b:	eb d1                	jmp    80083e <vprintfmt+0xd6>
  80086d:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800870:	83 f8 30             	cmp    $0x30,%eax
  800873:	73 17                	jae    80088c <vprintfmt+0x124>
  800875:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800879:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80087c:	89 d2                	mov    %edx,%edx
  80087e:	48 01 d0             	add    %rdx,%rax
  800881:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800884:	83 c2 08             	add    $0x8,%edx
  800887:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80088a:	eb 0c                	jmp    800898 <vprintfmt+0x130>
  80088c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800890:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800894:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800898:	8b 00                	mov    (%rax),%eax
  80089a:	89 45 d8             	mov    %eax,-0x28(%rbp)
  80089d:	eb 23                	jmp    8008c2 <vprintfmt+0x15a>
  80089f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8008a3:	0f 89 48 ff ff ff    	jns    8007f1 <vprintfmt+0x89>
  8008a9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  8008b0:	e9 3c ff ff ff       	jmpq   8007f1 <vprintfmt+0x89>
  8008b5:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  8008bc:	e9 30 ff ff ff       	jmpq   8007f1 <vprintfmt+0x89>
  8008c1:	90                   	nop
  8008c2:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8008c6:	0f 89 25 ff ff ff    	jns    8007f1 <vprintfmt+0x89>
  8008cc:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8008cf:	89 45 dc             	mov    %eax,-0x24(%rbp)
  8008d2:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8008d9:	e9 13 ff ff ff       	jmpq   8007f1 <vprintfmt+0x89>
  8008de:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  8008e2:	e9 0a ff ff ff       	jmpq   8007f1 <vprintfmt+0x89>
  8008e7:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8008ea:	83 f8 30             	cmp    $0x30,%eax
  8008ed:	73 17                	jae    800906 <vprintfmt+0x19e>
  8008ef:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8008f3:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8008f6:	89 d2                	mov    %edx,%edx
  8008f8:	48 01 d0             	add    %rdx,%rax
  8008fb:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8008fe:	83 c2 08             	add    $0x8,%edx
  800901:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800904:	eb 0c                	jmp    800912 <vprintfmt+0x1aa>
  800906:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80090a:	48 8d 50 08          	lea    0x8(%rax),%rdx
  80090e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800912:	8b 10                	mov    (%rax),%edx
  800914:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800918:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80091c:	48 89 ce             	mov    %rcx,%rsi
  80091f:	89 d7                	mov    %edx,%edi
  800921:	ff d0                	callq  *%rax
  800923:	e9 37 03 00 00       	jmpq   800c5f <vprintfmt+0x4f7>
  800928:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80092b:	83 f8 30             	cmp    $0x30,%eax
  80092e:	73 17                	jae    800947 <vprintfmt+0x1df>
  800930:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800934:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800937:	89 d2                	mov    %edx,%edx
  800939:	48 01 d0             	add    %rdx,%rax
  80093c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80093f:	83 c2 08             	add    $0x8,%edx
  800942:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800945:	eb 0c                	jmp    800953 <vprintfmt+0x1eb>
  800947:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80094b:	48 8d 50 08          	lea    0x8(%rax),%rdx
  80094f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800953:	8b 18                	mov    (%rax),%ebx
  800955:	85 db                	test   %ebx,%ebx
  800957:	79 02                	jns    80095b <vprintfmt+0x1f3>
  800959:	f7 db                	neg    %ebx
  80095b:	83 fb 15             	cmp    $0x15,%ebx
  80095e:	7f 16                	jg     800976 <vprintfmt+0x20e>
  800960:	48 b8 60 4d 80 00 00 	movabs $0x804d60,%rax
  800967:	00 00 00 
  80096a:	48 63 d3             	movslq %ebx,%rdx
  80096d:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800971:	4d 85 e4             	test   %r12,%r12
  800974:	75 2e                	jne    8009a4 <vprintfmt+0x23c>
  800976:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80097a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80097e:	89 d9                	mov    %ebx,%ecx
  800980:	48 ba 21 4e 80 00 00 	movabs $0x804e21,%rdx
  800987:	00 00 00 
  80098a:	48 89 c7             	mov    %rax,%rdi
  80098d:	b8 00 00 00 00       	mov    $0x0,%eax
  800992:	49 b8 6e 0c 80 00 00 	movabs $0x800c6e,%r8
  800999:	00 00 00 
  80099c:	41 ff d0             	callq  *%r8
  80099f:	e9 bb 02 00 00       	jmpq   800c5f <vprintfmt+0x4f7>
  8009a4:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8009a8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8009ac:	4c 89 e1             	mov    %r12,%rcx
  8009af:	48 ba 2a 4e 80 00 00 	movabs $0x804e2a,%rdx
  8009b6:	00 00 00 
  8009b9:	48 89 c7             	mov    %rax,%rdi
  8009bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8009c1:	49 b8 6e 0c 80 00 00 	movabs $0x800c6e,%r8
  8009c8:	00 00 00 
  8009cb:	41 ff d0             	callq  *%r8
  8009ce:	e9 8c 02 00 00       	jmpq   800c5f <vprintfmt+0x4f7>
  8009d3:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009d6:	83 f8 30             	cmp    $0x30,%eax
  8009d9:	73 17                	jae    8009f2 <vprintfmt+0x28a>
  8009db:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8009df:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009e2:	89 d2                	mov    %edx,%edx
  8009e4:	48 01 d0             	add    %rdx,%rax
  8009e7:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009ea:	83 c2 08             	add    $0x8,%edx
  8009ed:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8009f0:	eb 0c                	jmp    8009fe <vprintfmt+0x296>
  8009f2:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8009f6:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8009fa:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8009fe:	4c 8b 20             	mov    (%rax),%r12
  800a01:	4d 85 e4             	test   %r12,%r12
  800a04:	75 0a                	jne    800a10 <vprintfmt+0x2a8>
  800a06:	49 bc 2d 4e 80 00 00 	movabs $0x804e2d,%r12
  800a0d:	00 00 00 
  800a10:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a14:	7e 78                	jle    800a8e <vprintfmt+0x326>
  800a16:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800a1a:	74 72                	je     800a8e <vprintfmt+0x326>
  800a1c:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800a1f:	48 98                	cltq   
  800a21:	48 89 c6             	mov    %rax,%rsi
  800a24:	4c 89 e7             	mov    %r12,%rdi
  800a27:	48 b8 1c 0f 80 00 00 	movabs $0x800f1c,%rax
  800a2e:	00 00 00 
  800a31:	ff d0                	callq  *%rax
  800a33:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800a36:	eb 17                	jmp    800a4f <vprintfmt+0x2e7>
  800a38:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800a3c:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800a40:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a44:	48 89 ce             	mov    %rcx,%rsi
  800a47:	89 d7                	mov    %edx,%edi
  800a49:	ff d0                	callq  *%rax
  800a4b:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800a4f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a53:	7f e3                	jg     800a38 <vprintfmt+0x2d0>
  800a55:	eb 37                	jmp    800a8e <vprintfmt+0x326>
  800a57:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800a5b:	74 1e                	je     800a7b <vprintfmt+0x313>
  800a5d:	83 fb 1f             	cmp    $0x1f,%ebx
  800a60:	7e 05                	jle    800a67 <vprintfmt+0x2ff>
  800a62:	83 fb 7e             	cmp    $0x7e,%ebx
  800a65:	7e 14                	jle    800a7b <vprintfmt+0x313>
  800a67:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a6b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a6f:	48 89 d6             	mov    %rdx,%rsi
  800a72:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800a77:	ff d0                	callq  *%rax
  800a79:	eb 0f                	jmp    800a8a <vprintfmt+0x322>
  800a7b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a7f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a83:	48 89 d6             	mov    %rdx,%rsi
  800a86:	89 df                	mov    %ebx,%edi
  800a88:	ff d0                	callq  *%rax
  800a8a:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800a8e:	4c 89 e0             	mov    %r12,%rax
  800a91:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800a95:	0f b6 00             	movzbl (%rax),%eax
  800a98:	0f be d8             	movsbl %al,%ebx
  800a9b:	85 db                	test   %ebx,%ebx
  800a9d:	74 28                	je     800ac7 <vprintfmt+0x35f>
  800a9f:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800aa3:	78 b2                	js     800a57 <vprintfmt+0x2ef>
  800aa5:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800aa9:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800aad:	79 a8                	jns    800a57 <vprintfmt+0x2ef>
  800aaf:	eb 16                	jmp    800ac7 <vprintfmt+0x35f>
  800ab1:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ab5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ab9:	48 89 d6             	mov    %rdx,%rsi
  800abc:	bf 20 00 00 00       	mov    $0x20,%edi
  800ac1:	ff d0                	callq  *%rax
  800ac3:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800ac7:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800acb:	7f e4                	jg     800ab1 <vprintfmt+0x349>
  800acd:	e9 8d 01 00 00       	jmpq   800c5f <vprintfmt+0x4f7>
  800ad2:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ad6:	be 03 00 00 00       	mov    $0x3,%esi
  800adb:	48 89 c7             	mov    %rax,%rdi
  800ade:	48 b8 61 06 80 00 00 	movabs $0x800661,%rax
  800ae5:	00 00 00 
  800ae8:	ff d0                	callq  *%rax
  800aea:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800aee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800af2:	48 85 c0             	test   %rax,%rax
  800af5:	79 1d                	jns    800b14 <vprintfmt+0x3ac>
  800af7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800afb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800aff:	48 89 d6             	mov    %rdx,%rsi
  800b02:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800b07:	ff d0                	callq  *%rax
  800b09:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b0d:	48 f7 d8             	neg    %rax
  800b10:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b14:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800b1b:	e9 d2 00 00 00       	jmpq   800bf2 <vprintfmt+0x48a>
  800b20:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800b24:	be 03 00 00 00       	mov    $0x3,%esi
  800b29:	48 89 c7             	mov    %rax,%rdi
  800b2c:	48 b8 5a 05 80 00 00 	movabs $0x80055a,%rax
  800b33:	00 00 00 
  800b36:	ff d0                	callq  *%rax
  800b38:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b3c:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800b43:	e9 aa 00 00 00       	jmpq   800bf2 <vprintfmt+0x48a>
  800b48:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800b4c:	be 03 00 00 00       	mov    $0x3,%esi
  800b51:	48 89 c7             	mov    %rax,%rdi
  800b54:	48 b8 5a 05 80 00 00 	movabs $0x80055a,%rax
  800b5b:	00 00 00 
  800b5e:	ff d0                	callq  *%rax
  800b60:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b64:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800b6b:	e9 82 00 00 00       	jmpq   800bf2 <vprintfmt+0x48a>
  800b70:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b74:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b78:	48 89 d6             	mov    %rdx,%rsi
  800b7b:	bf 30 00 00 00       	mov    $0x30,%edi
  800b80:	ff d0                	callq  *%rax
  800b82:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b86:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b8a:	48 89 d6             	mov    %rdx,%rsi
  800b8d:	bf 78 00 00 00       	mov    $0x78,%edi
  800b92:	ff d0                	callq  *%rax
  800b94:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b97:	83 f8 30             	cmp    $0x30,%eax
  800b9a:	73 17                	jae    800bb3 <vprintfmt+0x44b>
  800b9c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ba0:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ba3:	89 d2                	mov    %edx,%edx
  800ba5:	48 01 d0             	add    %rdx,%rax
  800ba8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bab:	83 c2 08             	add    $0x8,%edx
  800bae:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bb1:	eb 0c                	jmp    800bbf <vprintfmt+0x457>
  800bb3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800bb7:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800bbb:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800bbf:	48 8b 00             	mov    (%rax),%rax
  800bc2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800bc6:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800bcd:	eb 23                	jmp    800bf2 <vprintfmt+0x48a>
  800bcf:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800bd3:	be 03 00 00 00       	mov    $0x3,%esi
  800bd8:	48 89 c7             	mov    %rax,%rdi
  800bdb:	48 b8 5a 05 80 00 00 	movabs $0x80055a,%rax
  800be2:	00 00 00 
  800be5:	ff d0                	callq  *%rax
  800be7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800beb:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800bf2:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800bf7:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800bfa:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800bfd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c01:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800c05:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c09:	45 89 c1             	mov    %r8d,%r9d
  800c0c:	41 89 f8             	mov    %edi,%r8d
  800c0f:	48 89 c7             	mov    %rax,%rdi
  800c12:	48 b8 a2 04 80 00 00 	movabs $0x8004a2,%rax
  800c19:	00 00 00 
  800c1c:	ff d0                	callq  *%rax
  800c1e:	eb 3f                	jmp    800c5f <vprintfmt+0x4f7>
  800c20:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c24:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c28:	48 89 d6             	mov    %rdx,%rsi
  800c2b:	89 df                	mov    %ebx,%edi
  800c2d:	ff d0                	callq  *%rax
  800c2f:	eb 2e                	jmp    800c5f <vprintfmt+0x4f7>
  800c31:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c35:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c39:	48 89 d6             	mov    %rdx,%rsi
  800c3c:	bf 25 00 00 00       	mov    $0x25,%edi
  800c41:	ff d0                	callq  *%rax
  800c43:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800c48:	eb 05                	jmp    800c4f <vprintfmt+0x4e7>
  800c4a:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800c4f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c53:	48 83 e8 01          	sub    $0x1,%rax
  800c57:	0f b6 00             	movzbl (%rax),%eax
  800c5a:	3c 25                	cmp    $0x25,%al
  800c5c:	75 ec                	jne    800c4a <vprintfmt+0x4e2>
  800c5e:	90                   	nop
  800c5f:	e9 3d fb ff ff       	jmpq   8007a1 <vprintfmt+0x39>
  800c64:	90                   	nop
  800c65:	48 83 c4 60          	add    $0x60,%rsp
  800c69:	5b                   	pop    %rbx
  800c6a:	41 5c                	pop    %r12
  800c6c:	5d                   	pop    %rbp
  800c6d:	c3                   	retq   

0000000000800c6e <printfmt>:
  800c6e:	55                   	push   %rbp
  800c6f:	48 89 e5             	mov    %rsp,%rbp
  800c72:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800c79:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800c80:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800c87:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800c8e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800c95:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800c9c:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800ca3:	84 c0                	test   %al,%al
  800ca5:	74 20                	je     800cc7 <printfmt+0x59>
  800ca7:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800cab:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800caf:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800cb3:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800cb7:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800cbb:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800cbf:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800cc3:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800cc7:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800cce:	00 00 00 
  800cd1:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800cd8:	00 00 00 
  800cdb:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800cdf:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800ce6:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800ced:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800cf4:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800cfb:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800d02:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800d09:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800d10:	48 89 c7             	mov    %rax,%rdi
  800d13:	48 b8 68 07 80 00 00 	movabs $0x800768,%rax
  800d1a:	00 00 00 
  800d1d:	ff d0                	callq  *%rax
  800d1f:	90                   	nop
  800d20:	c9                   	leaveq 
  800d21:	c3                   	retq   

0000000000800d22 <sprintputch>:
  800d22:	55                   	push   %rbp
  800d23:	48 89 e5             	mov    %rsp,%rbp
  800d26:	48 83 ec 10          	sub    $0x10,%rsp
  800d2a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800d2d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800d31:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d35:	8b 40 10             	mov    0x10(%rax),%eax
  800d38:	8d 50 01             	lea    0x1(%rax),%edx
  800d3b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d3f:	89 50 10             	mov    %edx,0x10(%rax)
  800d42:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d46:	48 8b 10             	mov    (%rax),%rdx
  800d49:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d4d:	48 8b 40 08          	mov    0x8(%rax),%rax
  800d51:	48 39 c2             	cmp    %rax,%rdx
  800d54:	73 17                	jae    800d6d <sprintputch+0x4b>
  800d56:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d5a:	48 8b 00             	mov    (%rax),%rax
  800d5d:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800d61:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800d65:	48 89 0a             	mov    %rcx,(%rdx)
  800d68:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800d6b:	88 10                	mov    %dl,(%rax)
  800d6d:	90                   	nop
  800d6e:	c9                   	leaveq 
  800d6f:	c3                   	retq   

0000000000800d70 <vsnprintf>:
  800d70:	55                   	push   %rbp
  800d71:	48 89 e5             	mov    %rsp,%rbp
  800d74:	48 83 ec 50          	sub    $0x50,%rsp
  800d78:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800d7c:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800d7f:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800d83:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800d87:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800d8b:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800d8f:	48 8b 0a             	mov    (%rdx),%rcx
  800d92:	48 89 08             	mov    %rcx,(%rax)
  800d95:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800d99:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800d9d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800da1:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800da5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800da9:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800dad:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800db0:	48 98                	cltq   
  800db2:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800db6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800dba:	48 01 d0             	add    %rdx,%rax
  800dbd:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800dc1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800dc8:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800dcd:	74 06                	je     800dd5 <vsnprintf+0x65>
  800dcf:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800dd3:	7f 07                	jg     800ddc <vsnprintf+0x6c>
  800dd5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800dda:	eb 2f                	jmp    800e0b <vsnprintf+0x9b>
  800ddc:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800de0:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800de4:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800de8:	48 89 c6             	mov    %rax,%rsi
  800deb:	48 bf 22 0d 80 00 00 	movabs $0x800d22,%rdi
  800df2:	00 00 00 
  800df5:	48 b8 68 07 80 00 00 	movabs $0x800768,%rax
  800dfc:	00 00 00 
  800dff:	ff d0                	callq  *%rax
  800e01:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800e05:	c6 00 00             	movb   $0x0,(%rax)
  800e08:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800e0b:	c9                   	leaveq 
  800e0c:	c3                   	retq   

0000000000800e0d <snprintf>:
  800e0d:	55                   	push   %rbp
  800e0e:	48 89 e5             	mov    %rsp,%rbp
  800e11:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800e18:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800e1f:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800e25:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800e2c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800e33:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800e3a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800e41:	84 c0                	test   %al,%al
  800e43:	74 20                	je     800e65 <snprintf+0x58>
  800e45:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800e49:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800e4d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800e51:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800e55:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800e59:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800e5d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800e61:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800e65:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800e6c:	00 00 00 
  800e6f:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800e76:	00 00 00 
  800e79:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800e7d:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800e84:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800e8b:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800e92:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800e99:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800ea0:	48 8b 0a             	mov    (%rdx),%rcx
  800ea3:	48 89 08             	mov    %rcx,(%rax)
  800ea6:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800eaa:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800eae:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800eb2:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800eb6:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800ebd:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800ec4:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800eca:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800ed1:	48 89 c7             	mov    %rax,%rdi
  800ed4:	48 b8 70 0d 80 00 00 	movabs $0x800d70,%rax
  800edb:	00 00 00 
  800ede:	ff d0                	callq  *%rax
  800ee0:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800ee6:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800eec:	c9                   	leaveq 
  800eed:	c3                   	retq   

0000000000800eee <strlen>:
  800eee:	55                   	push   %rbp
  800eef:	48 89 e5             	mov    %rsp,%rbp
  800ef2:	48 83 ec 18          	sub    $0x18,%rsp
  800ef6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800efa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800f01:	eb 09                	jmp    800f0c <strlen+0x1e>
  800f03:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800f07:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800f0c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f10:	0f b6 00             	movzbl (%rax),%eax
  800f13:	84 c0                	test   %al,%al
  800f15:	75 ec                	jne    800f03 <strlen+0x15>
  800f17:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f1a:	c9                   	leaveq 
  800f1b:	c3                   	retq   

0000000000800f1c <strnlen>:
  800f1c:	55                   	push   %rbp
  800f1d:	48 89 e5             	mov    %rsp,%rbp
  800f20:	48 83 ec 20          	sub    $0x20,%rsp
  800f24:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f28:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f2c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800f33:	eb 0e                	jmp    800f43 <strnlen+0x27>
  800f35:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800f39:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800f3e:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  800f43:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800f48:	74 0b                	je     800f55 <strnlen+0x39>
  800f4a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f4e:	0f b6 00             	movzbl (%rax),%eax
  800f51:	84 c0                	test   %al,%al
  800f53:	75 e0                	jne    800f35 <strnlen+0x19>
  800f55:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f58:	c9                   	leaveq 
  800f59:	c3                   	retq   

0000000000800f5a <strcpy>:
  800f5a:	55                   	push   %rbp
  800f5b:	48 89 e5             	mov    %rsp,%rbp
  800f5e:	48 83 ec 20          	sub    $0x20,%rsp
  800f62:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f66:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f6a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f6e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800f72:	90                   	nop
  800f73:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f77:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800f7b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800f7f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800f83:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  800f87:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  800f8b:	0f b6 12             	movzbl (%rdx),%edx
  800f8e:	88 10                	mov    %dl,(%rax)
  800f90:	0f b6 00             	movzbl (%rax),%eax
  800f93:	84 c0                	test   %al,%al
  800f95:	75 dc                	jne    800f73 <strcpy+0x19>
  800f97:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800f9b:	c9                   	leaveq 
  800f9c:	c3                   	retq   

0000000000800f9d <strcat>:
  800f9d:	55                   	push   %rbp
  800f9e:	48 89 e5             	mov    %rsp,%rbp
  800fa1:	48 83 ec 20          	sub    $0x20,%rsp
  800fa5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fa9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800fad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fb1:	48 89 c7             	mov    %rax,%rdi
  800fb4:	48 b8 ee 0e 80 00 00 	movabs $0x800eee,%rax
  800fbb:	00 00 00 
  800fbe:	ff d0                	callq  *%rax
  800fc0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800fc3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800fc6:	48 63 d0             	movslq %eax,%rdx
  800fc9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fcd:	48 01 c2             	add    %rax,%rdx
  800fd0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800fd4:	48 89 c6             	mov    %rax,%rsi
  800fd7:	48 89 d7             	mov    %rdx,%rdi
  800fda:	48 b8 5a 0f 80 00 00 	movabs $0x800f5a,%rax
  800fe1:	00 00 00 
  800fe4:	ff d0                	callq  *%rax
  800fe6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fea:	c9                   	leaveq 
  800feb:	c3                   	retq   

0000000000800fec <strncpy>:
  800fec:	55                   	push   %rbp
  800fed:	48 89 e5             	mov    %rsp,%rbp
  800ff0:	48 83 ec 28          	sub    $0x28,%rsp
  800ff4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800ff8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800ffc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801000:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801004:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801008:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80100f:	00 
  801010:	eb 2a                	jmp    80103c <strncpy+0x50>
  801012:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801016:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80101a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80101e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801022:	0f b6 12             	movzbl (%rdx),%edx
  801025:	88 10                	mov    %dl,(%rax)
  801027:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80102b:	0f b6 00             	movzbl (%rax),%eax
  80102e:	84 c0                	test   %al,%al
  801030:	74 05                	je     801037 <strncpy+0x4b>
  801032:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801037:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80103c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801040:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801044:	72 cc                	jb     801012 <strncpy+0x26>
  801046:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80104a:	c9                   	leaveq 
  80104b:	c3                   	retq   

000000000080104c <strlcpy>:
  80104c:	55                   	push   %rbp
  80104d:	48 89 e5             	mov    %rsp,%rbp
  801050:	48 83 ec 28          	sub    $0x28,%rsp
  801054:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801058:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80105c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801060:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801064:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801068:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80106d:	74 3d                	je     8010ac <strlcpy+0x60>
  80106f:	eb 1d                	jmp    80108e <strlcpy+0x42>
  801071:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801075:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801079:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80107d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801081:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801085:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801089:	0f b6 12             	movzbl (%rdx),%edx
  80108c:	88 10                	mov    %dl,(%rax)
  80108e:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801093:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801098:	74 0b                	je     8010a5 <strlcpy+0x59>
  80109a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80109e:	0f b6 00             	movzbl (%rax),%eax
  8010a1:	84 c0                	test   %al,%al
  8010a3:	75 cc                	jne    801071 <strlcpy+0x25>
  8010a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010a9:	c6 00 00             	movb   $0x0,(%rax)
  8010ac:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010b4:	48 29 c2             	sub    %rax,%rdx
  8010b7:	48 89 d0             	mov    %rdx,%rax
  8010ba:	c9                   	leaveq 
  8010bb:	c3                   	retq   

00000000008010bc <strcmp>:
  8010bc:	55                   	push   %rbp
  8010bd:	48 89 e5             	mov    %rsp,%rbp
  8010c0:	48 83 ec 10          	sub    $0x10,%rsp
  8010c4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8010c8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8010cc:	eb 0a                	jmp    8010d8 <strcmp+0x1c>
  8010ce:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8010d3:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8010d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010dc:	0f b6 00             	movzbl (%rax),%eax
  8010df:	84 c0                	test   %al,%al
  8010e1:	74 12                	je     8010f5 <strcmp+0x39>
  8010e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010e7:	0f b6 10             	movzbl (%rax),%edx
  8010ea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010ee:	0f b6 00             	movzbl (%rax),%eax
  8010f1:	38 c2                	cmp    %al,%dl
  8010f3:	74 d9                	je     8010ce <strcmp+0x12>
  8010f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010f9:	0f b6 00             	movzbl (%rax),%eax
  8010fc:	0f b6 d0             	movzbl %al,%edx
  8010ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801103:	0f b6 00             	movzbl (%rax),%eax
  801106:	0f b6 c0             	movzbl %al,%eax
  801109:	29 c2                	sub    %eax,%edx
  80110b:	89 d0                	mov    %edx,%eax
  80110d:	c9                   	leaveq 
  80110e:	c3                   	retq   

000000000080110f <strncmp>:
  80110f:	55                   	push   %rbp
  801110:	48 89 e5             	mov    %rsp,%rbp
  801113:	48 83 ec 18          	sub    $0x18,%rsp
  801117:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80111b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80111f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801123:	eb 0f                	jmp    801134 <strncmp+0x25>
  801125:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80112a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80112f:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801134:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801139:	74 1d                	je     801158 <strncmp+0x49>
  80113b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80113f:	0f b6 00             	movzbl (%rax),%eax
  801142:	84 c0                	test   %al,%al
  801144:	74 12                	je     801158 <strncmp+0x49>
  801146:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80114a:	0f b6 10             	movzbl (%rax),%edx
  80114d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801151:	0f b6 00             	movzbl (%rax),%eax
  801154:	38 c2                	cmp    %al,%dl
  801156:	74 cd                	je     801125 <strncmp+0x16>
  801158:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80115d:	75 07                	jne    801166 <strncmp+0x57>
  80115f:	b8 00 00 00 00       	mov    $0x0,%eax
  801164:	eb 18                	jmp    80117e <strncmp+0x6f>
  801166:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80116a:	0f b6 00             	movzbl (%rax),%eax
  80116d:	0f b6 d0             	movzbl %al,%edx
  801170:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801174:	0f b6 00             	movzbl (%rax),%eax
  801177:	0f b6 c0             	movzbl %al,%eax
  80117a:	29 c2                	sub    %eax,%edx
  80117c:	89 d0                	mov    %edx,%eax
  80117e:	c9                   	leaveq 
  80117f:	c3                   	retq   

0000000000801180 <strchr>:
  801180:	55                   	push   %rbp
  801181:	48 89 e5             	mov    %rsp,%rbp
  801184:	48 83 ec 10          	sub    $0x10,%rsp
  801188:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80118c:	89 f0                	mov    %esi,%eax
  80118e:	88 45 f4             	mov    %al,-0xc(%rbp)
  801191:	eb 17                	jmp    8011aa <strchr+0x2a>
  801193:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801197:	0f b6 00             	movzbl (%rax),%eax
  80119a:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80119d:	75 06                	jne    8011a5 <strchr+0x25>
  80119f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011a3:	eb 15                	jmp    8011ba <strchr+0x3a>
  8011a5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011aa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011ae:	0f b6 00             	movzbl (%rax),%eax
  8011b1:	84 c0                	test   %al,%al
  8011b3:	75 de                	jne    801193 <strchr+0x13>
  8011b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8011ba:	c9                   	leaveq 
  8011bb:	c3                   	retq   

00000000008011bc <strfind>:
  8011bc:	55                   	push   %rbp
  8011bd:	48 89 e5             	mov    %rsp,%rbp
  8011c0:	48 83 ec 10          	sub    $0x10,%rsp
  8011c4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011c8:	89 f0                	mov    %esi,%eax
  8011ca:	88 45 f4             	mov    %al,-0xc(%rbp)
  8011cd:	eb 11                	jmp    8011e0 <strfind+0x24>
  8011cf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011d3:	0f b6 00             	movzbl (%rax),%eax
  8011d6:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8011d9:	74 12                	je     8011ed <strfind+0x31>
  8011db:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011e0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011e4:	0f b6 00             	movzbl (%rax),%eax
  8011e7:	84 c0                	test   %al,%al
  8011e9:	75 e4                	jne    8011cf <strfind+0x13>
  8011eb:	eb 01                	jmp    8011ee <strfind+0x32>
  8011ed:	90                   	nop
  8011ee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011f2:	c9                   	leaveq 
  8011f3:	c3                   	retq   

00000000008011f4 <memset>:
  8011f4:	55                   	push   %rbp
  8011f5:	48 89 e5             	mov    %rsp,%rbp
  8011f8:	48 83 ec 18          	sub    $0x18,%rsp
  8011fc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801200:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801203:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801207:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80120c:	75 06                	jne    801214 <memset+0x20>
  80120e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801212:	eb 69                	jmp    80127d <memset+0x89>
  801214:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801218:	83 e0 03             	and    $0x3,%eax
  80121b:	48 85 c0             	test   %rax,%rax
  80121e:	75 48                	jne    801268 <memset+0x74>
  801220:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801224:	83 e0 03             	and    $0x3,%eax
  801227:	48 85 c0             	test   %rax,%rax
  80122a:	75 3c                	jne    801268 <memset+0x74>
  80122c:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801233:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801236:	c1 e0 18             	shl    $0x18,%eax
  801239:	89 c2                	mov    %eax,%edx
  80123b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80123e:	c1 e0 10             	shl    $0x10,%eax
  801241:	09 c2                	or     %eax,%edx
  801243:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801246:	c1 e0 08             	shl    $0x8,%eax
  801249:	09 d0                	or     %edx,%eax
  80124b:	09 45 f4             	or     %eax,-0xc(%rbp)
  80124e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801252:	48 c1 e8 02          	shr    $0x2,%rax
  801256:	48 89 c1             	mov    %rax,%rcx
  801259:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80125d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801260:	48 89 d7             	mov    %rdx,%rdi
  801263:	fc                   	cld    
  801264:	f3 ab                	rep stos %eax,%es:(%rdi)
  801266:	eb 11                	jmp    801279 <memset+0x85>
  801268:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80126c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80126f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801273:	48 89 d7             	mov    %rdx,%rdi
  801276:	fc                   	cld    
  801277:	f3 aa                	rep stos %al,%es:(%rdi)
  801279:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80127d:	c9                   	leaveq 
  80127e:	c3                   	retq   

000000000080127f <memmove>:
  80127f:	55                   	push   %rbp
  801280:	48 89 e5             	mov    %rsp,%rbp
  801283:	48 83 ec 28          	sub    $0x28,%rsp
  801287:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80128b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80128f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801293:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801297:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80129b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80129f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8012a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012a7:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8012ab:	0f 83 88 00 00 00    	jae    801339 <memmove+0xba>
  8012b1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8012b5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012b9:	48 01 d0             	add    %rdx,%rax
  8012bc:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8012c0:	76 77                	jbe    801339 <memmove+0xba>
  8012c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012c6:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8012ca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012ce:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8012d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012d6:	83 e0 03             	and    $0x3,%eax
  8012d9:	48 85 c0             	test   %rax,%rax
  8012dc:	75 3b                	jne    801319 <memmove+0x9a>
  8012de:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012e2:	83 e0 03             	and    $0x3,%eax
  8012e5:	48 85 c0             	test   %rax,%rax
  8012e8:	75 2f                	jne    801319 <memmove+0x9a>
  8012ea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012ee:	83 e0 03             	and    $0x3,%eax
  8012f1:	48 85 c0             	test   %rax,%rax
  8012f4:	75 23                	jne    801319 <memmove+0x9a>
  8012f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012fa:	48 83 e8 04          	sub    $0x4,%rax
  8012fe:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801302:	48 83 ea 04          	sub    $0x4,%rdx
  801306:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80130a:	48 c1 e9 02          	shr    $0x2,%rcx
  80130e:	48 89 c7             	mov    %rax,%rdi
  801311:	48 89 d6             	mov    %rdx,%rsi
  801314:	fd                   	std    
  801315:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801317:	eb 1d                	jmp    801336 <memmove+0xb7>
  801319:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80131d:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801321:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801325:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801329:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80132d:	48 89 d7             	mov    %rdx,%rdi
  801330:	48 89 c1             	mov    %rax,%rcx
  801333:	fd                   	std    
  801334:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801336:	fc                   	cld    
  801337:	eb 57                	jmp    801390 <memmove+0x111>
  801339:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80133d:	83 e0 03             	and    $0x3,%eax
  801340:	48 85 c0             	test   %rax,%rax
  801343:	75 36                	jne    80137b <memmove+0xfc>
  801345:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801349:	83 e0 03             	and    $0x3,%eax
  80134c:	48 85 c0             	test   %rax,%rax
  80134f:	75 2a                	jne    80137b <memmove+0xfc>
  801351:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801355:	83 e0 03             	and    $0x3,%eax
  801358:	48 85 c0             	test   %rax,%rax
  80135b:	75 1e                	jne    80137b <memmove+0xfc>
  80135d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801361:	48 c1 e8 02          	shr    $0x2,%rax
  801365:	48 89 c1             	mov    %rax,%rcx
  801368:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80136c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801370:	48 89 c7             	mov    %rax,%rdi
  801373:	48 89 d6             	mov    %rdx,%rsi
  801376:	fc                   	cld    
  801377:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801379:	eb 15                	jmp    801390 <memmove+0x111>
  80137b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80137f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801383:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801387:	48 89 c7             	mov    %rax,%rdi
  80138a:	48 89 d6             	mov    %rdx,%rsi
  80138d:	fc                   	cld    
  80138e:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801390:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801394:	c9                   	leaveq 
  801395:	c3                   	retq   

0000000000801396 <memcpy>:
  801396:	55                   	push   %rbp
  801397:	48 89 e5             	mov    %rsp,%rbp
  80139a:	48 83 ec 18          	sub    $0x18,%rsp
  80139e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013a2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8013a6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013aa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8013ae:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8013b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013b6:	48 89 ce             	mov    %rcx,%rsi
  8013b9:	48 89 c7             	mov    %rax,%rdi
  8013bc:	48 b8 7f 12 80 00 00 	movabs $0x80127f,%rax
  8013c3:	00 00 00 
  8013c6:	ff d0                	callq  *%rax
  8013c8:	c9                   	leaveq 
  8013c9:	c3                   	retq   

00000000008013ca <memcmp>:
  8013ca:	55                   	push   %rbp
  8013cb:	48 89 e5             	mov    %rsp,%rbp
  8013ce:	48 83 ec 28          	sub    $0x28,%rsp
  8013d2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013d6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013da:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013e2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013e6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8013ea:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8013ee:	eb 36                	jmp    801426 <memcmp+0x5c>
  8013f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013f4:	0f b6 10             	movzbl (%rax),%edx
  8013f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013fb:	0f b6 00             	movzbl (%rax),%eax
  8013fe:	38 c2                	cmp    %al,%dl
  801400:	74 1a                	je     80141c <memcmp+0x52>
  801402:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801406:	0f b6 00             	movzbl (%rax),%eax
  801409:	0f b6 d0             	movzbl %al,%edx
  80140c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801410:	0f b6 00             	movzbl (%rax),%eax
  801413:	0f b6 c0             	movzbl %al,%eax
  801416:	29 c2                	sub    %eax,%edx
  801418:	89 d0                	mov    %edx,%eax
  80141a:	eb 20                	jmp    80143c <memcmp+0x72>
  80141c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801421:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801426:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80142a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80142e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801432:	48 85 c0             	test   %rax,%rax
  801435:	75 b9                	jne    8013f0 <memcmp+0x26>
  801437:	b8 00 00 00 00       	mov    $0x0,%eax
  80143c:	c9                   	leaveq 
  80143d:	c3                   	retq   

000000000080143e <memfind>:
  80143e:	55                   	push   %rbp
  80143f:	48 89 e5             	mov    %rsp,%rbp
  801442:	48 83 ec 28          	sub    $0x28,%rsp
  801446:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80144a:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80144d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801451:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801455:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801459:	48 01 d0             	add    %rdx,%rax
  80145c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801460:	eb 13                	jmp    801475 <memfind+0x37>
  801462:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801466:	0f b6 00             	movzbl (%rax),%eax
  801469:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80146c:	38 d0                	cmp    %dl,%al
  80146e:	74 11                	je     801481 <memfind+0x43>
  801470:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801475:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801479:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80147d:	72 e3                	jb     801462 <memfind+0x24>
  80147f:	eb 01                	jmp    801482 <memfind+0x44>
  801481:	90                   	nop
  801482:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801486:	c9                   	leaveq 
  801487:	c3                   	retq   

0000000000801488 <strtol>:
  801488:	55                   	push   %rbp
  801489:	48 89 e5             	mov    %rsp,%rbp
  80148c:	48 83 ec 38          	sub    $0x38,%rsp
  801490:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801494:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801498:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80149b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8014a2:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8014a9:	00 
  8014aa:	eb 05                	jmp    8014b1 <strtol+0x29>
  8014ac:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8014b1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014b5:	0f b6 00             	movzbl (%rax),%eax
  8014b8:	3c 20                	cmp    $0x20,%al
  8014ba:	74 f0                	je     8014ac <strtol+0x24>
  8014bc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014c0:	0f b6 00             	movzbl (%rax),%eax
  8014c3:	3c 09                	cmp    $0x9,%al
  8014c5:	74 e5                	je     8014ac <strtol+0x24>
  8014c7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014cb:	0f b6 00             	movzbl (%rax),%eax
  8014ce:	3c 2b                	cmp    $0x2b,%al
  8014d0:	75 07                	jne    8014d9 <strtol+0x51>
  8014d2:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8014d7:	eb 17                	jmp    8014f0 <strtol+0x68>
  8014d9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014dd:	0f b6 00             	movzbl (%rax),%eax
  8014e0:	3c 2d                	cmp    $0x2d,%al
  8014e2:	75 0c                	jne    8014f0 <strtol+0x68>
  8014e4:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8014e9:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8014f0:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8014f4:	74 06                	je     8014fc <strtol+0x74>
  8014f6:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8014fa:	75 28                	jne    801524 <strtol+0x9c>
  8014fc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801500:	0f b6 00             	movzbl (%rax),%eax
  801503:	3c 30                	cmp    $0x30,%al
  801505:	75 1d                	jne    801524 <strtol+0x9c>
  801507:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80150b:	48 83 c0 01          	add    $0x1,%rax
  80150f:	0f b6 00             	movzbl (%rax),%eax
  801512:	3c 78                	cmp    $0x78,%al
  801514:	75 0e                	jne    801524 <strtol+0x9c>
  801516:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  80151b:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801522:	eb 2c                	jmp    801550 <strtol+0xc8>
  801524:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801528:	75 19                	jne    801543 <strtol+0xbb>
  80152a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80152e:	0f b6 00             	movzbl (%rax),%eax
  801531:	3c 30                	cmp    $0x30,%al
  801533:	75 0e                	jne    801543 <strtol+0xbb>
  801535:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80153a:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801541:	eb 0d                	jmp    801550 <strtol+0xc8>
  801543:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801547:	75 07                	jne    801550 <strtol+0xc8>
  801549:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801550:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801554:	0f b6 00             	movzbl (%rax),%eax
  801557:	3c 2f                	cmp    $0x2f,%al
  801559:	7e 1d                	jle    801578 <strtol+0xf0>
  80155b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80155f:	0f b6 00             	movzbl (%rax),%eax
  801562:	3c 39                	cmp    $0x39,%al
  801564:	7f 12                	jg     801578 <strtol+0xf0>
  801566:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80156a:	0f b6 00             	movzbl (%rax),%eax
  80156d:	0f be c0             	movsbl %al,%eax
  801570:	83 e8 30             	sub    $0x30,%eax
  801573:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801576:	eb 4e                	jmp    8015c6 <strtol+0x13e>
  801578:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80157c:	0f b6 00             	movzbl (%rax),%eax
  80157f:	3c 60                	cmp    $0x60,%al
  801581:	7e 1d                	jle    8015a0 <strtol+0x118>
  801583:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801587:	0f b6 00             	movzbl (%rax),%eax
  80158a:	3c 7a                	cmp    $0x7a,%al
  80158c:	7f 12                	jg     8015a0 <strtol+0x118>
  80158e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801592:	0f b6 00             	movzbl (%rax),%eax
  801595:	0f be c0             	movsbl %al,%eax
  801598:	83 e8 57             	sub    $0x57,%eax
  80159b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80159e:	eb 26                	jmp    8015c6 <strtol+0x13e>
  8015a0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015a4:	0f b6 00             	movzbl (%rax),%eax
  8015a7:	3c 40                	cmp    $0x40,%al
  8015a9:	7e 47                	jle    8015f2 <strtol+0x16a>
  8015ab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015af:	0f b6 00             	movzbl (%rax),%eax
  8015b2:	3c 5a                	cmp    $0x5a,%al
  8015b4:	7f 3c                	jg     8015f2 <strtol+0x16a>
  8015b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015ba:	0f b6 00             	movzbl (%rax),%eax
  8015bd:	0f be c0             	movsbl %al,%eax
  8015c0:	83 e8 37             	sub    $0x37,%eax
  8015c3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8015c6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8015c9:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8015cc:	7d 23                	jge    8015f1 <strtol+0x169>
  8015ce:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015d3:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8015d6:	48 98                	cltq   
  8015d8:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8015dd:	48 89 c2             	mov    %rax,%rdx
  8015e0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8015e3:	48 98                	cltq   
  8015e5:	48 01 d0             	add    %rdx,%rax
  8015e8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8015ec:	e9 5f ff ff ff       	jmpq   801550 <strtol+0xc8>
  8015f1:	90                   	nop
  8015f2:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8015f7:	74 0b                	je     801604 <strtol+0x17c>
  8015f9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8015fd:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801601:	48 89 10             	mov    %rdx,(%rax)
  801604:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801608:	74 09                	je     801613 <strtol+0x18b>
  80160a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80160e:	48 f7 d8             	neg    %rax
  801611:	eb 04                	jmp    801617 <strtol+0x18f>
  801613:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801617:	c9                   	leaveq 
  801618:	c3                   	retq   

0000000000801619 <strstr>:
  801619:	55                   	push   %rbp
  80161a:	48 89 e5             	mov    %rsp,%rbp
  80161d:	48 83 ec 30          	sub    $0x30,%rsp
  801621:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801625:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801629:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80162d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801631:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801635:	0f b6 00             	movzbl (%rax),%eax
  801638:	88 45 ff             	mov    %al,-0x1(%rbp)
  80163b:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  80163f:	75 06                	jne    801647 <strstr+0x2e>
  801641:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801645:	eb 6b                	jmp    8016b2 <strstr+0x99>
  801647:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80164b:	48 89 c7             	mov    %rax,%rdi
  80164e:	48 b8 ee 0e 80 00 00 	movabs $0x800eee,%rax
  801655:	00 00 00 
  801658:	ff d0                	callq  *%rax
  80165a:	48 98                	cltq   
  80165c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801660:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801664:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801668:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80166c:	0f b6 00             	movzbl (%rax),%eax
  80166f:	88 45 ef             	mov    %al,-0x11(%rbp)
  801672:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801676:	75 07                	jne    80167f <strstr+0x66>
  801678:	b8 00 00 00 00       	mov    $0x0,%eax
  80167d:	eb 33                	jmp    8016b2 <strstr+0x99>
  80167f:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801683:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801686:	75 d8                	jne    801660 <strstr+0x47>
  801688:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80168c:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801690:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801694:	48 89 ce             	mov    %rcx,%rsi
  801697:	48 89 c7             	mov    %rax,%rdi
  80169a:	48 b8 0f 11 80 00 00 	movabs $0x80110f,%rax
  8016a1:	00 00 00 
  8016a4:	ff d0                	callq  *%rax
  8016a6:	85 c0                	test   %eax,%eax
  8016a8:	75 b6                	jne    801660 <strstr+0x47>
  8016aa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ae:	48 83 e8 01          	sub    $0x1,%rax
  8016b2:	c9                   	leaveq 
  8016b3:	c3                   	retq   

00000000008016b4 <syscall>:
  8016b4:	55                   	push   %rbp
  8016b5:	48 89 e5             	mov    %rsp,%rbp
  8016b8:	53                   	push   %rbx
  8016b9:	48 83 ec 48          	sub    $0x48,%rsp
  8016bd:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8016c0:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8016c3:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8016c7:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8016cb:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8016cf:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8016d3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8016d6:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8016da:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8016de:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8016e2:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8016e6:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8016ea:	4c 89 c3             	mov    %r8,%rbx
  8016ed:	cd 30                	int    $0x30
  8016ef:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8016f3:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8016f7:	74 3e                	je     801737 <syscall+0x83>
  8016f9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8016fe:	7e 37                	jle    801737 <syscall+0x83>
  801700:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801704:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801707:	49 89 d0             	mov    %rdx,%r8
  80170a:	89 c1                	mov    %eax,%ecx
  80170c:	48 ba e8 50 80 00 00 	movabs $0x8050e8,%rdx
  801713:	00 00 00 
  801716:	be 24 00 00 00       	mov    $0x24,%esi
  80171b:	48 bf 05 51 80 00 00 	movabs $0x805105,%rdi
  801722:	00 00 00 
  801725:	b8 00 00 00 00       	mov    $0x0,%eax
  80172a:	49 b9 90 01 80 00 00 	movabs $0x800190,%r9
  801731:	00 00 00 
  801734:	41 ff d1             	callq  *%r9
  801737:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80173b:	48 83 c4 48          	add    $0x48,%rsp
  80173f:	5b                   	pop    %rbx
  801740:	5d                   	pop    %rbp
  801741:	c3                   	retq   

0000000000801742 <sys_cputs>:
  801742:	55                   	push   %rbp
  801743:	48 89 e5             	mov    %rsp,%rbp
  801746:	48 83 ec 10          	sub    $0x10,%rsp
  80174a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80174e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801752:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801756:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80175a:	48 83 ec 08          	sub    $0x8,%rsp
  80175e:	6a 00                	pushq  $0x0
  801760:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801766:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80176c:	48 89 d1             	mov    %rdx,%rcx
  80176f:	48 89 c2             	mov    %rax,%rdx
  801772:	be 00 00 00 00       	mov    $0x0,%esi
  801777:	bf 00 00 00 00       	mov    $0x0,%edi
  80177c:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  801783:	00 00 00 
  801786:	ff d0                	callq  *%rax
  801788:	48 83 c4 10          	add    $0x10,%rsp
  80178c:	90                   	nop
  80178d:	c9                   	leaveq 
  80178e:	c3                   	retq   

000000000080178f <sys_cgetc>:
  80178f:	55                   	push   %rbp
  801790:	48 89 e5             	mov    %rsp,%rbp
  801793:	48 83 ec 08          	sub    $0x8,%rsp
  801797:	6a 00                	pushq  $0x0
  801799:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80179f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8017a5:	b9 00 00 00 00       	mov    $0x0,%ecx
  8017aa:	ba 00 00 00 00       	mov    $0x0,%edx
  8017af:	be 00 00 00 00       	mov    $0x0,%esi
  8017b4:	bf 01 00 00 00       	mov    $0x1,%edi
  8017b9:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  8017c0:	00 00 00 
  8017c3:	ff d0                	callq  *%rax
  8017c5:	48 83 c4 10          	add    $0x10,%rsp
  8017c9:	c9                   	leaveq 
  8017ca:	c3                   	retq   

00000000008017cb <sys_env_destroy>:
  8017cb:	55                   	push   %rbp
  8017cc:	48 89 e5             	mov    %rsp,%rbp
  8017cf:	48 83 ec 10          	sub    $0x10,%rsp
  8017d3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8017d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8017d9:	48 98                	cltq   
  8017db:	48 83 ec 08          	sub    $0x8,%rsp
  8017df:	6a 00                	pushq  $0x0
  8017e1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8017e7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8017ed:	b9 00 00 00 00       	mov    $0x0,%ecx
  8017f2:	48 89 c2             	mov    %rax,%rdx
  8017f5:	be 01 00 00 00       	mov    $0x1,%esi
  8017fa:	bf 03 00 00 00       	mov    $0x3,%edi
  8017ff:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  801806:	00 00 00 
  801809:	ff d0                	callq  *%rax
  80180b:	48 83 c4 10          	add    $0x10,%rsp
  80180f:	c9                   	leaveq 
  801810:	c3                   	retq   

0000000000801811 <sys_getenvid>:
  801811:	55                   	push   %rbp
  801812:	48 89 e5             	mov    %rsp,%rbp
  801815:	48 83 ec 08          	sub    $0x8,%rsp
  801819:	6a 00                	pushq  $0x0
  80181b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801821:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801827:	b9 00 00 00 00       	mov    $0x0,%ecx
  80182c:	ba 00 00 00 00       	mov    $0x0,%edx
  801831:	be 00 00 00 00       	mov    $0x0,%esi
  801836:	bf 02 00 00 00       	mov    $0x2,%edi
  80183b:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  801842:	00 00 00 
  801845:	ff d0                	callq  *%rax
  801847:	48 83 c4 10          	add    $0x10,%rsp
  80184b:	c9                   	leaveq 
  80184c:	c3                   	retq   

000000000080184d <sys_yield>:
  80184d:	55                   	push   %rbp
  80184e:	48 89 e5             	mov    %rsp,%rbp
  801851:	48 83 ec 08          	sub    $0x8,%rsp
  801855:	6a 00                	pushq  $0x0
  801857:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80185d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801863:	b9 00 00 00 00       	mov    $0x0,%ecx
  801868:	ba 00 00 00 00       	mov    $0x0,%edx
  80186d:	be 00 00 00 00       	mov    $0x0,%esi
  801872:	bf 0b 00 00 00       	mov    $0xb,%edi
  801877:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  80187e:	00 00 00 
  801881:	ff d0                	callq  *%rax
  801883:	48 83 c4 10          	add    $0x10,%rsp
  801887:	90                   	nop
  801888:	c9                   	leaveq 
  801889:	c3                   	retq   

000000000080188a <sys_page_alloc>:
  80188a:	55                   	push   %rbp
  80188b:	48 89 e5             	mov    %rsp,%rbp
  80188e:	48 83 ec 10          	sub    $0x10,%rsp
  801892:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801895:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801899:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80189c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80189f:	48 63 c8             	movslq %eax,%rcx
  8018a2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018a9:	48 98                	cltq   
  8018ab:	48 83 ec 08          	sub    $0x8,%rsp
  8018af:	6a 00                	pushq  $0x0
  8018b1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018b7:	49 89 c8             	mov    %rcx,%r8
  8018ba:	48 89 d1             	mov    %rdx,%rcx
  8018bd:	48 89 c2             	mov    %rax,%rdx
  8018c0:	be 01 00 00 00       	mov    $0x1,%esi
  8018c5:	bf 04 00 00 00       	mov    $0x4,%edi
  8018ca:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  8018d1:	00 00 00 
  8018d4:	ff d0                	callq  *%rax
  8018d6:	48 83 c4 10          	add    $0x10,%rsp
  8018da:	c9                   	leaveq 
  8018db:	c3                   	retq   

00000000008018dc <sys_page_map>:
  8018dc:	55                   	push   %rbp
  8018dd:	48 89 e5             	mov    %rsp,%rbp
  8018e0:	48 83 ec 20          	sub    $0x20,%rsp
  8018e4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018e7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018eb:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8018ee:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8018f2:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8018f6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8018f9:	48 63 c8             	movslq %eax,%rcx
  8018fc:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801900:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801903:	48 63 f0             	movslq %eax,%rsi
  801906:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80190a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80190d:	48 98                	cltq   
  80190f:	48 83 ec 08          	sub    $0x8,%rsp
  801913:	51                   	push   %rcx
  801914:	49 89 f9             	mov    %rdi,%r9
  801917:	49 89 f0             	mov    %rsi,%r8
  80191a:	48 89 d1             	mov    %rdx,%rcx
  80191d:	48 89 c2             	mov    %rax,%rdx
  801920:	be 01 00 00 00       	mov    $0x1,%esi
  801925:	bf 05 00 00 00       	mov    $0x5,%edi
  80192a:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  801931:	00 00 00 
  801934:	ff d0                	callq  *%rax
  801936:	48 83 c4 10          	add    $0x10,%rsp
  80193a:	c9                   	leaveq 
  80193b:	c3                   	retq   

000000000080193c <sys_page_unmap>:
  80193c:	55                   	push   %rbp
  80193d:	48 89 e5             	mov    %rsp,%rbp
  801940:	48 83 ec 10          	sub    $0x10,%rsp
  801944:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801947:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80194b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80194f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801952:	48 98                	cltq   
  801954:	48 83 ec 08          	sub    $0x8,%rsp
  801958:	6a 00                	pushq  $0x0
  80195a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801960:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801966:	48 89 d1             	mov    %rdx,%rcx
  801969:	48 89 c2             	mov    %rax,%rdx
  80196c:	be 01 00 00 00       	mov    $0x1,%esi
  801971:	bf 06 00 00 00       	mov    $0x6,%edi
  801976:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  80197d:	00 00 00 
  801980:	ff d0                	callq  *%rax
  801982:	48 83 c4 10          	add    $0x10,%rsp
  801986:	c9                   	leaveq 
  801987:	c3                   	retq   

0000000000801988 <sys_env_set_status>:
  801988:	55                   	push   %rbp
  801989:	48 89 e5             	mov    %rsp,%rbp
  80198c:	48 83 ec 10          	sub    $0x10,%rsp
  801990:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801993:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801996:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801999:	48 63 d0             	movslq %eax,%rdx
  80199c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80199f:	48 98                	cltq   
  8019a1:	48 83 ec 08          	sub    $0x8,%rsp
  8019a5:	6a 00                	pushq  $0x0
  8019a7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019ad:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019b3:	48 89 d1             	mov    %rdx,%rcx
  8019b6:	48 89 c2             	mov    %rax,%rdx
  8019b9:	be 01 00 00 00       	mov    $0x1,%esi
  8019be:	bf 08 00 00 00       	mov    $0x8,%edi
  8019c3:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  8019ca:	00 00 00 
  8019cd:	ff d0                	callq  *%rax
  8019cf:	48 83 c4 10          	add    $0x10,%rsp
  8019d3:	c9                   	leaveq 
  8019d4:	c3                   	retq   

00000000008019d5 <sys_env_set_trapframe>:
  8019d5:	55                   	push   %rbp
  8019d6:	48 89 e5             	mov    %rsp,%rbp
  8019d9:	48 83 ec 10          	sub    $0x10,%rsp
  8019dd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019e0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019e4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019e8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019eb:	48 98                	cltq   
  8019ed:	48 83 ec 08          	sub    $0x8,%rsp
  8019f1:	6a 00                	pushq  $0x0
  8019f3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019f9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019ff:	48 89 d1             	mov    %rdx,%rcx
  801a02:	48 89 c2             	mov    %rax,%rdx
  801a05:	be 01 00 00 00       	mov    $0x1,%esi
  801a0a:	bf 09 00 00 00       	mov    $0x9,%edi
  801a0f:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  801a16:	00 00 00 
  801a19:	ff d0                	callq  *%rax
  801a1b:	48 83 c4 10          	add    $0x10,%rsp
  801a1f:	c9                   	leaveq 
  801a20:	c3                   	retq   

0000000000801a21 <sys_env_set_pgfault_upcall>:
  801a21:	55                   	push   %rbp
  801a22:	48 89 e5             	mov    %rsp,%rbp
  801a25:	48 83 ec 10          	sub    $0x10,%rsp
  801a29:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a2c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a30:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a34:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a37:	48 98                	cltq   
  801a39:	48 83 ec 08          	sub    $0x8,%rsp
  801a3d:	6a 00                	pushq  $0x0
  801a3f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a45:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a4b:	48 89 d1             	mov    %rdx,%rcx
  801a4e:	48 89 c2             	mov    %rax,%rdx
  801a51:	be 01 00 00 00       	mov    $0x1,%esi
  801a56:	bf 0a 00 00 00       	mov    $0xa,%edi
  801a5b:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  801a62:	00 00 00 
  801a65:	ff d0                	callq  *%rax
  801a67:	48 83 c4 10          	add    $0x10,%rsp
  801a6b:	c9                   	leaveq 
  801a6c:	c3                   	retq   

0000000000801a6d <sys_ipc_try_send>:
  801a6d:	55                   	push   %rbp
  801a6e:	48 89 e5             	mov    %rsp,%rbp
  801a71:	48 83 ec 20          	sub    $0x20,%rsp
  801a75:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a78:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a7c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801a80:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801a83:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a86:	48 63 f0             	movslq %eax,%rsi
  801a89:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801a8d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a90:	48 98                	cltq   
  801a92:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a96:	48 83 ec 08          	sub    $0x8,%rsp
  801a9a:	6a 00                	pushq  $0x0
  801a9c:	49 89 f1             	mov    %rsi,%r9
  801a9f:	49 89 c8             	mov    %rcx,%r8
  801aa2:	48 89 d1             	mov    %rdx,%rcx
  801aa5:	48 89 c2             	mov    %rax,%rdx
  801aa8:	be 00 00 00 00       	mov    $0x0,%esi
  801aad:	bf 0c 00 00 00       	mov    $0xc,%edi
  801ab2:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  801ab9:	00 00 00 
  801abc:	ff d0                	callq  *%rax
  801abe:	48 83 c4 10          	add    $0x10,%rsp
  801ac2:	c9                   	leaveq 
  801ac3:	c3                   	retq   

0000000000801ac4 <sys_ipc_recv>:
  801ac4:	55                   	push   %rbp
  801ac5:	48 89 e5             	mov    %rsp,%rbp
  801ac8:	48 83 ec 10          	sub    $0x10,%rsp
  801acc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ad0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ad4:	48 83 ec 08          	sub    $0x8,%rsp
  801ad8:	6a 00                	pushq  $0x0
  801ada:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ae0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ae6:	b9 00 00 00 00       	mov    $0x0,%ecx
  801aeb:	48 89 c2             	mov    %rax,%rdx
  801aee:	be 01 00 00 00       	mov    $0x1,%esi
  801af3:	bf 0d 00 00 00       	mov    $0xd,%edi
  801af8:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  801aff:	00 00 00 
  801b02:	ff d0                	callq  *%rax
  801b04:	48 83 c4 10          	add    $0x10,%rsp
  801b08:	c9                   	leaveq 
  801b09:	c3                   	retq   

0000000000801b0a <sys_time_msec>:
  801b0a:	55                   	push   %rbp
  801b0b:	48 89 e5             	mov    %rsp,%rbp
  801b0e:	48 83 ec 08          	sub    $0x8,%rsp
  801b12:	6a 00                	pushq  $0x0
  801b14:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b1a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b20:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b25:	ba 00 00 00 00       	mov    $0x0,%edx
  801b2a:	be 00 00 00 00       	mov    $0x0,%esi
  801b2f:	bf 0e 00 00 00       	mov    $0xe,%edi
  801b34:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  801b3b:	00 00 00 
  801b3e:	ff d0                	callq  *%rax
  801b40:	48 83 c4 10          	add    $0x10,%rsp
  801b44:	c9                   	leaveq 
  801b45:	c3                   	retq   

0000000000801b46 <sys_net_transmit>:
  801b46:	55                   	push   %rbp
  801b47:	48 89 e5             	mov    %rsp,%rbp
  801b4a:	48 83 ec 10          	sub    $0x10,%rsp
  801b4e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b52:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801b55:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801b58:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b5c:	48 83 ec 08          	sub    $0x8,%rsp
  801b60:	6a 00                	pushq  $0x0
  801b62:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b68:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b6e:	48 89 d1             	mov    %rdx,%rcx
  801b71:	48 89 c2             	mov    %rax,%rdx
  801b74:	be 00 00 00 00       	mov    $0x0,%esi
  801b79:	bf 0f 00 00 00       	mov    $0xf,%edi
  801b7e:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  801b85:	00 00 00 
  801b88:	ff d0                	callq  *%rax
  801b8a:	48 83 c4 10          	add    $0x10,%rsp
  801b8e:	c9                   	leaveq 
  801b8f:	c3                   	retq   

0000000000801b90 <sys_net_receive>:
  801b90:	55                   	push   %rbp
  801b91:	48 89 e5             	mov    %rsp,%rbp
  801b94:	48 83 ec 10          	sub    $0x10,%rsp
  801b98:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b9c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801b9f:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801ba2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ba6:	48 83 ec 08          	sub    $0x8,%rsp
  801baa:	6a 00                	pushq  $0x0
  801bac:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bb2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bb8:	48 89 d1             	mov    %rdx,%rcx
  801bbb:	48 89 c2             	mov    %rax,%rdx
  801bbe:	be 00 00 00 00       	mov    $0x0,%esi
  801bc3:	bf 10 00 00 00       	mov    $0x10,%edi
  801bc8:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  801bcf:	00 00 00 
  801bd2:	ff d0                	callq  *%rax
  801bd4:	48 83 c4 10          	add    $0x10,%rsp
  801bd8:	c9                   	leaveq 
  801bd9:	c3                   	retq   

0000000000801bda <sys_ept_map>:
  801bda:	55                   	push   %rbp
  801bdb:	48 89 e5             	mov    %rsp,%rbp
  801bde:	48 83 ec 20          	sub    $0x20,%rsp
  801be2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801be5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801be9:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801bec:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801bf0:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801bf4:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801bf7:	48 63 c8             	movslq %eax,%rcx
  801bfa:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801bfe:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c01:	48 63 f0             	movslq %eax,%rsi
  801c04:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c08:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c0b:	48 98                	cltq   
  801c0d:	48 83 ec 08          	sub    $0x8,%rsp
  801c11:	51                   	push   %rcx
  801c12:	49 89 f9             	mov    %rdi,%r9
  801c15:	49 89 f0             	mov    %rsi,%r8
  801c18:	48 89 d1             	mov    %rdx,%rcx
  801c1b:	48 89 c2             	mov    %rax,%rdx
  801c1e:	be 00 00 00 00       	mov    $0x0,%esi
  801c23:	bf 11 00 00 00       	mov    $0x11,%edi
  801c28:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  801c2f:	00 00 00 
  801c32:	ff d0                	callq  *%rax
  801c34:	48 83 c4 10          	add    $0x10,%rsp
  801c38:	c9                   	leaveq 
  801c39:	c3                   	retq   

0000000000801c3a <sys_env_mkguest>:
  801c3a:	55                   	push   %rbp
  801c3b:	48 89 e5             	mov    %rsp,%rbp
  801c3e:	48 83 ec 10          	sub    $0x10,%rsp
  801c42:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c46:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c4a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c4e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c52:	48 83 ec 08          	sub    $0x8,%rsp
  801c56:	6a 00                	pushq  $0x0
  801c58:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c5e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c64:	48 89 d1             	mov    %rdx,%rcx
  801c67:	48 89 c2             	mov    %rax,%rdx
  801c6a:	be 00 00 00 00       	mov    $0x0,%esi
  801c6f:	bf 12 00 00 00       	mov    $0x12,%edi
  801c74:	48 b8 b4 16 80 00 00 	movabs $0x8016b4,%rax
  801c7b:	00 00 00 
  801c7e:	ff d0                	callq  *%rax
  801c80:	48 83 c4 10          	add    $0x10,%rsp
  801c84:	c9                   	leaveq 
  801c85:	c3                   	retq   

0000000000801c86 <fd2num>:
  801c86:	55                   	push   %rbp
  801c87:	48 89 e5             	mov    %rsp,%rbp
  801c8a:	48 83 ec 08          	sub    $0x8,%rsp
  801c8e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c92:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801c96:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801c9d:	ff ff ff 
  801ca0:	48 01 d0             	add    %rdx,%rax
  801ca3:	48 c1 e8 0c          	shr    $0xc,%rax
  801ca7:	c9                   	leaveq 
  801ca8:	c3                   	retq   

0000000000801ca9 <fd2data>:
  801ca9:	55                   	push   %rbp
  801caa:	48 89 e5             	mov    %rsp,%rbp
  801cad:	48 83 ec 08          	sub    $0x8,%rsp
  801cb1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801cb5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cb9:	48 89 c7             	mov    %rax,%rdi
  801cbc:	48 b8 86 1c 80 00 00 	movabs $0x801c86,%rax
  801cc3:	00 00 00 
  801cc6:	ff d0                	callq  *%rax
  801cc8:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801cce:	48 c1 e0 0c          	shl    $0xc,%rax
  801cd2:	c9                   	leaveq 
  801cd3:	c3                   	retq   

0000000000801cd4 <fd_alloc>:
  801cd4:	55                   	push   %rbp
  801cd5:	48 89 e5             	mov    %rsp,%rbp
  801cd8:	48 83 ec 18          	sub    $0x18,%rsp
  801cdc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801ce0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801ce7:	eb 6b                	jmp    801d54 <fd_alloc+0x80>
  801ce9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cec:	48 98                	cltq   
  801cee:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801cf4:	48 c1 e0 0c          	shl    $0xc,%rax
  801cf8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801cfc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d00:	48 c1 e8 15          	shr    $0x15,%rax
  801d04:	48 89 c2             	mov    %rax,%rdx
  801d07:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801d0e:	01 00 00 
  801d11:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801d15:	83 e0 01             	and    $0x1,%eax
  801d18:	48 85 c0             	test   %rax,%rax
  801d1b:	74 21                	je     801d3e <fd_alloc+0x6a>
  801d1d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d21:	48 c1 e8 0c          	shr    $0xc,%rax
  801d25:	48 89 c2             	mov    %rax,%rdx
  801d28:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801d2f:	01 00 00 
  801d32:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801d36:	83 e0 01             	and    $0x1,%eax
  801d39:	48 85 c0             	test   %rax,%rax
  801d3c:	75 12                	jne    801d50 <fd_alloc+0x7c>
  801d3e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d42:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d46:	48 89 10             	mov    %rdx,(%rax)
  801d49:	b8 00 00 00 00       	mov    $0x0,%eax
  801d4e:	eb 1a                	jmp    801d6a <fd_alloc+0x96>
  801d50:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801d54:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801d58:	7e 8f                	jle    801ce9 <fd_alloc+0x15>
  801d5a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d5e:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801d65:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801d6a:	c9                   	leaveq 
  801d6b:	c3                   	retq   

0000000000801d6c <fd_lookup>:
  801d6c:	55                   	push   %rbp
  801d6d:	48 89 e5             	mov    %rsp,%rbp
  801d70:	48 83 ec 20          	sub    $0x20,%rsp
  801d74:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801d77:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801d7b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801d7f:	78 06                	js     801d87 <fd_lookup+0x1b>
  801d81:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801d85:	7e 07                	jle    801d8e <fd_lookup+0x22>
  801d87:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801d8c:	eb 6c                	jmp    801dfa <fd_lookup+0x8e>
  801d8e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801d91:	48 98                	cltq   
  801d93:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801d99:	48 c1 e0 0c          	shl    $0xc,%rax
  801d9d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801da1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801da5:	48 c1 e8 15          	shr    $0x15,%rax
  801da9:	48 89 c2             	mov    %rax,%rdx
  801dac:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801db3:	01 00 00 
  801db6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801dba:	83 e0 01             	and    $0x1,%eax
  801dbd:	48 85 c0             	test   %rax,%rax
  801dc0:	74 21                	je     801de3 <fd_lookup+0x77>
  801dc2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dc6:	48 c1 e8 0c          	shr    $0xc,%rax
  801dca:	48 89 c2             	mov    %rax,%rdx
  801dcd:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801dd4:	01 00 00 
  801dd7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801ddb:	83 e0 01             	and    $0x1,%eax
  801dde:	48 85 c0             	test   %rax,%rax
  801de1:	75 07                	jne    801dea <fd_lookup+0x7e>
  801de3:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801de8:	eb 10                	jmp    801dfa <fd_lookup+0x8e>
  801dea:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801dee:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801df2:	48 89 10             	mov    %rdx,(%rax)
  801df5:	b8 00 00 00 00       	mov    $0x0,%eax
  801dfa:	c9                   	leaveq 
  801dfb:	c3                   	retq   

0000000000801dfc <fd_close>:
  801dfc:	55                   	push   %rbp
  801dfd:	48 89 e5             	mov    %rsp,%rbp
  801e00:	48 83 ec 30          	sub    $0x30,%rsp
  801e04:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801e08:	89 f0                	mov    %esi,%eax
  801e0a:	88 45 d4             	mov    %al,-0x2c(%rbp)
  801e0d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e11:	48 89 c7             	mov    %rax,%rdi
  801e14:	48 b8 86 1c 80 00 00 	movabs $0x801c86,%rax
  801e1b:	00 00 00 
  801e1e:	ff d0                	callq  *%rax
  801e20:	89 c2                	mov    %eax,%edx
  801e22:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  801e26:	48 89 c6             	mov    %rax,%rsi
  801e29:	89 d7                	mov    %edx,%edi
  801e2b:	48 b8 6c 1d 80 00 00 	movabs $0x801d6c,%rax
  801e32:	00 00 00 
  801e35:	ff d0                	callq  *%rax
  801e37:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801e3a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801e3e:	78 0a                	js     801e4a <fd_close+0x4e>
  801e40:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e44:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  801e48:	74 12                	je     801e5c <fd_close+0x60>
  801e4a:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  801e4e:	74 05                	je     801e55 <fd_close+0x59>
  801e50:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e53:	eb 70                	jmp    801ec5 <fd_close+0xc9>
  801e55:	b8 00 00 00 00       	mov    $0x0,%eax
  801e5a:	eb 69                	jmp    801ec5 <fd_close+0xc9>
  801e5c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e60:	8b 00                	mov    (%rax),%eax
  801e62:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  801e66:	48 89 d6             	mov    %rdx,%rsi
  801e69:	89 c7                	mov    %eax,%edi
  801e6b:	48 b8 c7 1e 80 00 00 	movabs $0x801ec7,%rax
  801e72:	00 00 00 
  801e75:	ff d0                	callq  *%rax
  801e77:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801e7a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801e7e:	78 2a                	js     801eaa <fd_close+0xae>
  801e80:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e84:	48 8b 40 20          	mov    0x20(%rax),%rax
  801e88:	48 85 c0             	test   %rax,%rax
  801e8b:	74 16                	je     801ea3 <fd_close+0xa7>
  801e8d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e91:	48 8b 40 20          	mov    0x20(%rax),%rax
  801e95:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801e99:	48 89 d7             	mov    %rdx,%rdi
  801e9c:	ff d0                	callq  *%rax
  801e9e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801ea1:	eb 07                	jmp    801eaa <fd_close+0xae>
  801ea3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801eaa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801eae:	48 89 c6             	mov    %rax,%rsi
  801eb1:	bf 00 00 00 00       	mov    $0x0,%edi
  801eb6:	48 b8 3c 19 80 00 00 	movabs $0x80193c,%rax
  801ebd:	00 00 00 
  801ec0:	ff d0                	callq  *%rax
  801ec2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ec5:	c9                   	leaveq 
  801ec6:	c3                   	retq   

0000000000801ec7 <dev_lookup>:
  801ec7:	55                   	push   %rbp
  801ec8:	48 89 e5             	mov    %rsp,%rbp
  801ecb:	48 83 ec 20          	sub    $0x20,%rsp
  801ecf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801ed2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801ed6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801edd:	eb 41                	jmp    801f20 <dev_lookup+0x59>
  801edf:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  801ee6:	00 00 00 
  801ee9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801eec:	48 63 d2             	movslq %edx,%rdx
  801eef:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801ef3:	8b 00                	mov    (%rax),%eax
  801ef5:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  801ef8:	75 22                	jne    801f1c <dev_lookup+0x55>
  801efa:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  801f01:	00 00 00 
  801f04:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801f07:	48 63 d2             	movslq %edx,%rdx
  801f0a:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  801f0e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f12:	48 89 10             	mov    %rdx,(%rax)
  801f15:	b8 00 00 00 00       	mov    $0x0,%eax
  801f1a:	eb 60                	jmp    801f7c <dev_lookup+0xb5>
  801f1c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801f20:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  801f27:	00 00 00 
  801f2a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801f2d:	48 63 d2             	movslq %edx,%rdx
  801f30:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f34:	48 85 c0             	test   %rax,%rax
  801f37:	75 a6                	jne    801edf <dev_lookup+0x18>
  801f39:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  801f40:	00 00 00 
  801f43:	48 8b 00             	mov    (%rax),%rax
  801f46:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  801f4c:	8b 55 ec             	mov    -0x14(%rbp),%edx
  801f4f:	89 c6                	mov    %eax,%esi
  801f51:	48 bf 18 51 80 00 00 	movabs $0x805118,%rdi
  801f58:	00 00 00 
  801f5b:	b8 00 00 00 00       	mov    $0x0,%eax
  801f60:	48 b9 ca 03 80 00 00 	movabs $0x8003ca,%rcx
  801f67:	00 00 00 
  801f6a:	ff d1                	callq  *%rcx
  801f6c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f70:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801f77:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801f7c:	c9                   	leaveq 
  801f7d:	c3                   	retq   

0000000000801f7e <close>:
  801f7e:	55                   	push   %rbp
  801f7f:	48 89 e5             	mov    %rsp,%rbp
  801f82:	48 83 ec 20          	sub    $0x20,%rsp
  801f86:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801f89:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801f8d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f90:	48 89 d6             	mov    %rdx,%rsi
  801f93:	89 c7                	mov    %eax,%edi
  801f95:	48 b8 6c 1d 80 00 00 	movabs $0x801d6c,%rax
  801f9c:	00 00 00 
  801f9f:	ff d0                	callq  *%rax
  801fa1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801fa4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801fa8:	79 05                	jns    801faf <close+0x31>
  801faa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801fad:	eb 18                	jmp    801fc7 <close+0x49>
  801faf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fb3:	be 01 00 00 00       	mov    $0x1,%esi
  801fb8:	48 89 c7             	mov    %rax,%rdi
  801fbb:	48 b8 fc 1d 80 00 00 	movabs $0x801dfc,%rax
  801fc2:	00 00 00 
  801fc5:	ff d0                	callq  *%rax
  801fc7:	c9                   	leaveq 
  801fc8:	c3                   	retq   

0000000000801fc9 <close_all>:
  801fc9:	55                   	push   %rbp
  801fca:	48 89 e5             	mov    %rsp,%rbp
  801fcd:	48 83 ec 10          	sub    $0x10,%rsp
  801fd1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801fd8:	eb 15                	jmp    801fef <close_all+0x26>
  801fda:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801fdd:	89 c7                	mov    %eax,%edi
  801fdf:	48 b8 7e 1f 80 00 00 	movabs $0x801f7e,%rax
  801fe6:	00 00 00 
  801fe9:	ff d0                	callq  *%rax
  801feb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801fef:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801ff3:	7e e5                	jle    801fda <close_all+0x11>
  801ff5:	90                   	nop
  801ff6:	c9                   	leaveq 
  801ff7:	c3                   	retq   

0000000000801ff8 <dup>:
  801ff8:	55                   	push   %rbp
  801ff9:	48 89 e5             	mov    %rsp,%rbp
  801ffc:	48 83 ec 40          	sub    $0x40,%rsp
  802000:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802003:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802006:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  80200a:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80200d:	48 89 d6             	mov    %rdx,%rsi
  802010:	89 c7                	mov    %eax,%edi
  802012:	48 b8 6c 1d 80 00 00 	movabs $0x801d6c,%rax
  802019:	00 00 00 
  80201c:	ff d0                	callq  *%rax
  80201e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802021:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802025:	79 08                	jns    80202f <dup+0x37>
  802027:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80202a:	e9 70 01 00 00       	jmpq   80219f <dup+0x1a7>
  80202f:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802032:	89 c7                	mov    %eax,%edi
  802034:	48 b8 7e 1f 80 00 00 	movabs $0x801f7e,%rax
  80203b:	00 00 00 
  80203e:	ff d0                	callq  *%rax
  802040:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802043:	48 98                	cltq   
  802045:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80204b:	48 c1 e0 0c          	shl    $0xc,%rax
  80204f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802053:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802057:	48 89 c7             	mov    %rax,%rdi
  80205a:	48 b8 a9 1c 80 00 00 	movabs $0x801ca9,%rax
  802061:	00 00 00 
  802064:	ff d0                	callq  *%rax
  802066:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80206a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80206e:	48 89 c7             	mov    %rax,%rdi
  802071:	48 b8 a9 1c 80 00 00 	movabs $0x801ca9,%rax
  802078:	00 00 00 
  80207b:	ff d0                	callq  *%rax
  80207d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802081:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802085:	48 c1 e8 15          	shr    $0x15,%rax
  802089:	48 89 c2             	mov    %rax,%rdx
  80208c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802093:	01 00 00 
  802096:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80209a:	83 e0 01             	and    $0x1,%eax
  80209d:	48 85 c0             	test   %rax,%rax
  8020a0:	74 71                	je     802113 <dup+0x11b>
  8020a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020a6:	48 c1 e8 0c          	shr    $0xc,%rax
  8020aa:	48 89 c2             	mov    %rax,%rdx
  8020ad:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8020b4:	01 00 00 
  8020b7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020bb:	83 e0 01             	and    $0x1,%eax
  8020be:	48 85 c0             	test   %rax,%rax
  8020c1:	74 50                	je     802113 <dup+0x11b>
  8020c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020c7:	48 c1 e8 0c          	shr    $0xc,%rax
  8020cb:	48 89 c2             	mov    %rax,%rdx
  8020ce:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8020d5:	01 00 00 
  8020d8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020dc:	25 07 0e 00 00       	and    $0xe07,%eax
  8020e1:	89 c1                	mov    %eax,%ecx
  8020e3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8020e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020eb:	41 89 c8             	mov    %ecx,%r8d
  8020ee:	48 89 d1             	mov    %rdx,%rcx
  8020f1:	ba 00 00 00 00       	mov    $0x0,%edx
  8020f6:	48 89 c6             	mov    %rax,%rsi
  8020f9:	bf 00 00 00 00       	mov    $0x0,%edi
  8020fe:	48 b8 dc 18 80 00 00 	movabs $0x8018dc,%rax
  802105:	00 00 00 
  802108:	ff d0                	callq  *%rax
  80210a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80210d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802111:	78 55                	js     802168 <dup+0x170>
  802113:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802117:	48 c1 e8 0c          	shr    $0xc,%rax
  80211b:	48 89 c2             	mov    %rax,%rdx
  80211e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802125:	01 00 00 
  802128:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80212c:	25 07 0e 00 00       	and    $0xe07,%eax
  802131:	89 c1                	mov    %eax,%ecx
  802133:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802137:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80213b:	41 89 c8             	mov    %ecx,%r8d
  80213e:	48 89 d1             	mov    %rdx,%rcx
  802141:	ba 00 00 00 00       	mov    $0x0,%edx
  802146:	48 89 c6             	mov    %rax,%rsi
  802149:	bf 00 00 00 00       	mov    $0x0,%edi
  80214e:	48 b8 dc 18 80 00 00 	movabs $0x8018dc,%rax
  802155:	00 00 00 
  802158:	ff d0                	callq  *%rax
  80215a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80215d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802161:	78 08                	js     80216b <dup+0x173>
  802163:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802166:	eb 37                	jmp    80219f <dup+0x1a7>
  802168:	90                   	nop
  802169:	eb 01                	jmp    80216c <dup+0x174>
  80216b:	90                   	nop
  80216c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802170:	48 89 c6             	mov    %rax,%rsi
  802173:	bf 00 00 00 00       	mov    $0x0,%edi
  802178:	48 b8 3c 19 80 00 00 	movabs $0x80193c,%rax
  80217f:	00 00 00 
  802182:	ff d0                	callq  *%rax
  802184:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802188:	48 89 c6             	mov    %rax,%rsi
  80218b:	bf 00 00 00 00       	mov    $0x0,%edi
  802190:	48 b8 3c 19 80 00 00 	movabs $0x80193c,%rax
  802197:	00 00 00 
  80219a:	ff d0                	callq  *%rax
  80219c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80219f:	c9                   	leaveq 
  8021a0:	c3                   	retq   

00000000008021a1 <read>:
  8021a1:	55                   	push   %rbp
  8021a2:	48 89 e5             	mov    %rsp,%rbp
  8021a5:	48 83 ec 40          	sub    $0x40,%rsp
  8021a9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8021ac:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8021b0:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8021b4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8021b8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8021bb:	48 89 d6             	mov    %rdx,%rsi
  8021be:	89 c7                	mov    %eax,%edi
  8021c0:	48 b8 6c 1d 80 00 00 	movabs $0x801d6c,%rax
  8021c7:	00 00 00 
  8021ca:	ff d0                	callq  *%rax
  8021cc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8021cf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021d3:	78 24                	js     8021f9 <read+0x58>
  8021d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021d9:	8b 00                	mov    (%rax),%eax
  8021db:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8021df:	48 89 d6             	mov    %rdx,%rsi
  8021e2:	89 c7                	mov    %eax,%edi
  8021e4:	48 b8 c7 1e 80 00 00 	movabs $0x801ec7,%rax
  8021eb:	00 00 00 
  8021ee:	ff d0                	callq  *%rax
  8021f0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8021f3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021f7:	79 05                	jns    8021fe <read+0x5d>
  8021f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021fc:	eb 76                	jmp    802274 <read+0xd3>
  8021fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802202:	8b 40 08             	mov    0x8(%rax),%eax
  802205:	83 e0 03             	and    $0x3,%eax
  802208:	83 f8 01             	cmp    $0x1,%eax
  80220b:	75 3a                	jne    802247 <read+0xa6>
  80220d:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802214:	00 00 00 
  802217:	48 8b 00             	mov    (%rax),%rax
  80221a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802220:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802223:	89 c6                	mov    %eax,%esi
  802225:	48 bf 37 51 80 00 00 	movabs $0x805137,%rdi
  80222c:	00 00 00 
  80222f:	b8 00 00 00 00       	mov    $0x0,%eax
  802234:	48 b9 ca 03 80 00 00 	movabs $0x8003ca,%rcx
  80223b:	00 00 00 
  80223e:	ff d1                	callq  *%rcx
  802240:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802245:	eb 2d                	jmp    802274 <read+0xd3>
  802247:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80224b:	48 8b 40 10          	mov    0x10(%rax),%rax
  80224f:	48 85 c0             	test   %rax,%rax
  802252:	75 07                	jne    80225b <read+0xba>
  802254:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802259:	eb 19                	jmp    802274 <read+0xd3>
  80225b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80225f:	48 8b 40 10          	mov    0x10(%rax),%rax
  802263:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802267:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80226b:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80226f:	48 89 cf             	mov    %rcx,%rdi
  802272:	ff d0                	callq  *%rax
  802274:	c9                   	leaveq 
  802275:	c3                   	retq   

0000000000802276 <readn>:
  802276:	55                   	push   %rbp
  802277:	48 89 e5             	mov    %rsp,%rbp
  80227a:	48 83 ec 30          	sub    $0x30,%rsp
  80227e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802281:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802285:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802289:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802290:	eb 47                	jmp    8022d9 <readn+0x63>
  802292:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802295:	48 98                	cltq   
  802297:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80229b:	48 29 c2             	sub    %rax,%rdx
  80229e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022a1:	48 63 c8             	movslq %eax,%rcx
  8022a4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8022a8:	48 01 c1             	add    %rax,%rcx
  8022ab:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8022ae:	48 89 ce             	mov    %rcx,%rsi
  8022b1:	89 c7                	mov    %eax,%edi
  8022b3:	48 b8 a1 21 80 00 00 	movabs $0x8021a1,%rax
  8022ba:	00 00 00 
  8022bd:	ff d0                	callq  *%rax
  8022bf:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8022c2:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8022c6:	79 05                	jns    8022cd <readn+0x57>
  8022c8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8022cb:	eb 1d                	jmp    8022ea <readn+0x74>
  8022cd:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8022d1:	74 13                	je     8022e6 <readn+0x70>
  8022d3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8022d6:	01 45 fc             	add    %eax,-0x4(%rbp)
  8022d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022dc:	48 98                	cltq   
  8022de:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8022e2:	72 ae                	jb     802292 <readn+0x1c>
  8022e4:	eb 01                	jmp    8022e7 <readn+0x71>
  8022e6:	90                   	nop
  8022e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022ea:	c9                   	leaveq 
  8022eb:	c3                   	retq   

00000000008022ec <write>:
  8022ec:	55                   	push   %rbp
  8022ed:	48 89 e5             	mov    %rsp,%rbp
  8022f0:	48 83 ec 40          	sub    $0x40,%rsp
  8022f4:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8022f7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8022fb:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8022ff:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802303:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802306:	48 89 d6             	mov    %rdx,%rsi
  802309:	89 c7                	mov    %eax,%edi
  80230b:	48 b8 6c 1d 80 00 00 	movabs $0x801d6c,%rax
  802312:	00 00 00 
  802315:	ff d0                	callq  *%rax
  802317:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80231a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80231e:	78 24                	js     802344 <write+0x58>
  802320:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802324:	8b 00                	mov    (%rax),%eax
  802326:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80232a:	48 89 d6             	mov    %rdx,%rsi
  80232d:	89 c7                	mov    %eax,%edi
  80232f:	48 b8 c7 1e 80 00 00 	movabs $0x801ec7,%rax
  802336:	00 00 00 
  802339:	ff d0                	callq  *%rax
  80233b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80233e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802342:	79 05                	jns    802349 <write+0x5d>
  802344:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802347:	eb 75                	jmp    8023be <write+0xd2>
  802349:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80234d:	8b 40 08             	mov    0x8(%rax),%eax
  802350:	83 e0 03             	and    $0x3,%eax
  802353:	85 c0                	test   %eax,%eax
  802355:	75 3a                	jne    802391 <write+0xa5>
  802357:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80235e:	00 00 00 
  802361:	48 8b 00             	mov    (%rax),%rax
  802364:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80236a:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80236d:	89 c6                	mov    %eax,%esi
  80236f:	48 bf 53 51 80 00 00 	movabs $0x805153,%rdi
  802376:	00 00 00 
  802379:	b8 00 00 00 00       	mov    $0x0,%eax
  80237e:	48 b9 ca 03 80 00 00 	movabs $0x8003ca,%rcx
  802385:	00 00 00 
  802388:	ff d1                	callq  *%rcx
  80238a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80238f:	eb 2d                	jmp    8023be <write+0xd2>
  802391:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802395:	48 8b 40 18          	mov    0x18(%rax),%rax
  802399:	48 85 c0             	test   %rax,%rax
  80239c:	75 07                	jne    8023a5 <write+0xb9>
  80239e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8023a3:	eb 19                	jmp    8023be <write+0xd2>
  8023a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023a9:	48 8b 40 18          	mov    0x18(%rax),%rax
  8023ad:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8023b1:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8023b5:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8023b9:	48 89 cf             	mov    %rcx,%rdi
  8023bc:	ff d0                	callq  *%rax
  8023be:	c9                   	leaveq 
  8023bf:	c3                   	retq   

00000000008023c0 <seek>:
  8023c0:	55                   	push   %rbp
  8023c1:	48 89 e5             	mov    %rsp,%rbp
  8023c4:	48 83 ec 18          	sub    $0x18,%rsp
  8023c8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8023cb:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8023ce:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8023d2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8023d5:	48 89 d6             	mov    %rdx,%rsi
  8023d8:	89 c7                	mov    %eax,%edi
  8023da:	48 b8 6c 1d 80 00 00 	movabs $0x801d6c,%rax
  8023e1:	00 00 00 
  8023e4:	ff d0                	callq  *%rax
  8023e6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023e9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023ed:	79 05                	jns    8023f4 <seek+0x34>
  8023ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023f2:	eb 0f                	jmp    802403 <seek+0x43>
  8023f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023f8:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8023fb:	89 50 04             	mov    %edx,0x4(%rax)
  8023fe:	b8 00 00 00 00       	mov    $0x0,%eax
  802403:	c9                   	leaveq 
  802404:	c3                   	retq   

0000000000802405 <ftruncate>:
  802405:	55                   	push   %rbp
  802406:	48 89 e5             	mov    %rsp,%rbp
  802409:	48 83 ec 30          	sub    $0x30,%rsp
  80240d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802410:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802413:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802417:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80241a:	48 89 d6             	mov    %rdx,%rsi
  80241d:	89 c7                	mov    %eax,%edi
  80241f:	48 b8 6c 1d 80 00 00 	movabs $0x801d6c,%rax
  802426:	00 00 00 
  802429:	ff d0                	callq  *%rax
  80242b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80242e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802432:	78 24                	js     802458 <ftruncate+0x53>
  802434:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802438:	8b 00                	mov    (%rax),%eax
  80243a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80243e:	48 89 d6             	mov    %rdx,%rsi
  802441:	89 c7                	mov    %eax,%edi
  802443:	48 b8 c7 1e 80 00 00 	movabs $0x801ec7,%rax
  80244a:	00 00 00 
  80244d:	ff d0                	callq  *%rax
  80244f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802452:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802456:	79 05                	jns    80245d <ftruncate+0x58>
  802458:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80245b:	eb 72                	jmp    8024cf <ftruncate+0xca>
  80245d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802461:	8b 40 08             	mov    0x8(%rax),%eax
  802464:	83 e0 03             	and    $0x3,%eax
  802467:	85 c0                	test   %eax,%eax
  802469:	75 3a                	jne    8024a5 <ftruncate+0xa0>
  80246b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802472:	00 00 00 
  802475:	48 8b 00             	mov    (%rax),%rax
  802478:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80247e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802481:	89 c6                	mov    %eax,%esi
  802483:	48 bf 70 51 80 00 00 	movabs $0x805170,%rdi
  80248a:	00 00 00 
  80248d:	b8 00 00 00 00       	mov    $0x0,%eax
  802492:	48 b9 ca 03 80 00 00 	movabs $0x8003ca,%rcx
  802499:	00 00 00 
  80249c:	ff d1                	callq  *%rcx
  80249e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8024a3:	eb 2a                	jmp    8024cf <ftruncate+0xca>
  8024a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024a9:	48 8b 40 30          	mov    0x30(%rax),%rax
  8024ad:	48 85 c0             	test   %rax,%rax
  8024b0:	75 07                	jne    8024b9 <ftruncate+0xb4>
  8024b2:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8024b7:	eb 16                	jmp    8024cf <ftruncate+0xca>
  8024b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024bd:	48 8b 40 30          	mov    0x30(%rax),%rax
  8024c1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8024c5:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8024c8:	89 ce                	mov    %ecx,%esi
  8024ca:	48 89 d7             	mov    %rdx,%rdi
  8024cd:	ff d0                	callq  *%rax
  8024cf:	c9                   	leaveq 
  8024d0:	c3                   	retq   

00000000008024d1 <fstat>:
  8024d1:	55                   	push   %rbp
  8024d2:	48 89 e5             	mov    %rsp,%rbp
  8024d5:	48 83 ec 30          	sub    $0x30,%rsp
  8024d9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8024dc:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8024e0:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8024e4:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8024e7:	48 89 d6             	mov    %rdx,%rsi
  8024ea:	89 c7                	mov    %eax,%edi
  8024ec:	48 b8 6c 1d 80 00 00 	movabs $0x801d6c,%rax
  8024f3:	00 00 00 
  8024f6:	ff d0                	callq  *%rax
  8024f8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024fb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024ff:	78 24                	js     802525 <fstat+0x54>
  802501:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802505:	8b 00                	mov    (%rax),%eax
  802507:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80250b:	48 89 d6             	mov    %rdx,%rsi
  80250e:	89 c7                	mov    %eax,%edi
  802510:	48 b8 c7 1e 80 00 00 	movabs $0x801ec7,%rax
  802517:	00 00 00 
  80251a:	ff d0                	callq  *%rax
  80251c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80251f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802523:	79 05                	jns    80252a <fstat+0x59>
  802525:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802528:	eb 5e                	jmp    802588 <fstat+0xb7>
  80252a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80252e:	48 8b 40 28          	mov    0x28(%rax),%rax
  802532:	48 85 c0             	test   %rax,%rax
  802535:	75 07                	jne    80253e <fstat+0x6d>
  802537:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80253c:	eb 4a                	jmp    802588 <fstat+0xb7>
  80253e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802542:	c6 00 00             	movb   $0x0,(%rax)
  802545:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802549:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802550:	00 00 00 
  802553:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802557:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80255e:	00 00 00 
  802561:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802565:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802569:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802570:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802574:	48 8b 40 28          	mov    0x28(%rax),%rax
  802578:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80257c:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802580:	48 89 ce             	mov    %rcx,%rsi
  802583:	48 89 d7             	mov    %rdx,%rdi
  802586:	ff d0                	callq  *%rax
  802588:	c9                   	leaveq 
  802589:	c3                   	retq   

000000000080258a <stat>:
  80258a:	55                   	push   %rbp
  80258b:	48 89 e5             	mov    %rsp,%rbp
  80258e:	48 83 ec 20          	sub    $0x20,%rsp
  802592:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802596:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80259a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80259e:	be 00 00 00 00       	mov    $0x0,%esi
  8025a3:	48 89 c7             	mov    %rax,%rdi
  8025a6:	48 b8 7a 26 80 00 00 	movabs $0x80267a,%rax
  8025ad:	00 00 00 
  8025b0:	ff d0                	callq  *%rax
  8025b2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025b5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025b9:	79 05                	jns    8025c0 <stat+0x36>
  8025bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025be:	eb 2f                	jmp    8025ef <stat+0x65>
  8025c0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8025c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025c7:	48 89 d6             	mov    %rdx,%rsi
  8025ca:	89 c7                	mov    %eax,%edi
  8025cc:	48 b8 d1 24 80 00 00 	movabs $0x8024d1,%rax
  8025d3:	00 00 00 
  8025d6:	ff d0                	callq  *%rax
  8025d8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8025db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025de:	89 c7                	mov    %eax,%edi
  8025e0:	48 b8 7e 1f 80 00 00 	movabs $0x801f7e,%rax
  8025e7:	00 00 00 
  8025ea:	ff d0                	callq  *%rax
  8025ec:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8025ef:	c9                   	leaveq 
  8025f0:	c3                   	retq   

00000000008025f1 <fsipc>:
  8025f1:	55                   	push   %rbp
  8025f2:	48 89 e5             	mov    %rsp,%rbp
  8025f5:	48 83 ec 10          	sub    $0x10,%rsp
  8025f9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8025fc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802600:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802607:	00 00 00 
  80260a:	8b 00                	mov    (%rax),%eax
  80260c:	85 c0                	test   %eax,%eax
  80260e:	75 1f                	jne    80262f <fsipc+0x3e>
  802610:	bf 01 00 00 00       	mov    $0x1,%edi
  802615:	48 b8 6b 4a 80 00 00 	movabs $0x804a6b,%rax
  80261c:	00 00 00 
  80261f:	ff d0                	callq  *%rax
  802621:	89 c2                	mov    %eax,%edx
  802623:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80262a:	00 00 00 
  80262d:	89 10                	mov    %edx,(%rax)
  80262f:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802636:	00 00 00 
  802639:	8b 00                	mov    (%rax),%eax
  80263b:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80263e:	b9 07 00 00 00       	mov    $0x7,%ecx
  802643:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  80264a:	00 00 00 
  80264d:	89 c7                	mov    %eax,%edi
  80264f:	48 b8 61 49 80 00 00 	movabs $0x804961,%rax
  802656:	00 00 00 
  802659:	ff d0                	callq  *%rax
  80265b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80265f:	ba 00 00 00 00       	mov    $0x0,%edx
  802664:	48 89 c6             	mov    %rax,%rsi
  802667:	bf 00 00 00 00       	mov    $0x0,%edi
  80266c:	48 b8 a0 48 80 00 00 	movabs $0x8048a0,%rax
  802673:	00 00 00 
  802676:	ff d0                	callq  *%rax
  802678:	c9                   	leaveq 
  802679:	c3                   	retq   

000000000080267a <open>:
  80267a:	55                   	push   %rbp
  80267b:	48 89 e5             	mov    %rsp,%rbp
  80267e:	48 83 ec 20          	sub    $0x20,%rsp
  802682:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802686:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802689:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80268d:	48 89 c7             	mov    %rax,%rdi
  802690:	48 b8 ee 0e 80 00 00 	movabs $0x800eee,%rax
  802697:	00 00 00 
  80269a:	ff d0                	callq  *%rax
  80269c:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8026a1:	7e 0a                	jle    8026ad <open+0x33>
  8026a3:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8026a8:	e9 a5 00 00 00       	jmpq   802752 <open+0xd8>
  8026ad:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8026b1:	48 89 c7             	mov    %rax,%rdi
  8026b4:	48 b8 d4 1c 80 00 00 	movabs $0x801cd4,%rax
  8026bb:	00 00 00 
  8026be:	ff d0                	callq  *%rax
  8026c0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026c3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026c7:	79 08                	jns    8026d1 <open+0x57>
  8026c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026cc:	e9 81 00 00 00       	jmpq   802752 <open+0xd8>
  8026d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026d5:	48 89 c6             	mov    %rax,%rsi
  8026d8:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8026df:	00 00 00 
  8026e2:	48 b8 5a 0f 80 00 00 	movabs $0x800f5a,%rax
  8026e9:	00 00 00 
  8026ec:	ff d0                	callq  *%rax
  8026ee:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8026f5:	00 00 00 
  8026f8:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8026fb:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802701:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802705:	48 89 c6             	mov    %rax,%rsi
  802708:	bf 01 00 00 00       	mov    $0x1,%edi
  80270d:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  802714:	00 00 00 
  802717:	ff d0                	callq  *%rax
  802719:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80271c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802720:	79 1d                	jns    80273f <open+0xc5>
  802722:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802726:	be 00 00 00 00       	mov    $0x0,%esi
  80272b:	48 89 c7             	mov    %rax,%rdi
  80272e:	48 b8 fc 1d 80 00 00 	movabs $0x801dfc,%rax
  802735:	00 00 00 
  802738:	ff d0                	callq  *%rax
  80273a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80273d:	eb 13                	jmp    802752 <open+0xd8>
  80273f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802743:	48 89 c7             	mov    %rax,%rdi
  802746:	48 b8 86 1c 80 00 00 	movabs $0x801c86,%rax
  80274d:	00 00 00 
  802750:	ff d0                	callq  *%rax
  802752:	c9                   	leaveq 
  802753:	c3                   	retq   

0000000000802754 <devfile_flush>:
  802754:	55                   	push   %rbp
  802755:	48 89 e5             	mov    %rsp,%rbp
  802758:	48 83 ec 10          	sub    $0x10,%rsp
  80275c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802760:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802764:	8b 50 0c             	mov    0xc(%rax),%edx
  802767:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80276e:	00 00 00 
  802771:	89 10                	mov    %edx,(%rax)
  802773:	be 00 00 00 00       	mov    $0x0,%esi
  802778:	bf 06 00 00 00       	mov    $0x6,%edi
  80277d:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  802784:	00 00 00 
  802787:	ff d0                	callq  *%rax
  802789:	c9                   	leaveq 
  80278a:	c3                   	retq   

000000000080278b <devfile_read>:
  80278b:	55                   	push   %rbp
  80278c:	48 89 e5             	mov    %rsp,%rbp
  80278f:	48 83 ec 30          	sub    $0x30,%rsp
  802793:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802797:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80279b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80279f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027a3:	8b 50 0c             	mov    0xc(%rax),%edx
  8027a6:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8027ad:	00 00 00 
  8027b0:	89 10                	mov    %edx,(%rax)
  8027b2:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8027b9:	00 00 00 
  8027bc:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8027c0:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8027c4:	be 00 00 00 00       	mov    $0x0,%esi
  8027c9:	bf 03 00 00 00       	mov    $0x3,%edi
  8027ce:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  8027d5:	00 00 00 
  8027d8:	ff d0                	callq  *%rax
  8027da:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027dd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027e1:	79 08                	jns    8027eb <devfile_read+0x60>
  8027e3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027e6:	e9 a4 00 00 00       	jmpq   80288f <devfile_read+0x104>
  8027eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027ee:	48 98                	cltq   
  8027f0:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8027f4:	76 35                	jbe    80282b <devfile_read+0xa0>
  8027f6:	48 b9 96 51 80 00 00 	movabs $0x805196,%rcx
  8027fd:	00 00 00 
  802800:	48 ba 9d 51 80 00 00 	movabs $0x80519d,%rdx
  802807:	00 00 00 
  80280a:	be 89 00 00 00       	mov    $0x89,%esi
  80280f:	48 bf b2 51 80 00 00 	movabs $0x8051b2,%rdi
  802816:	00 00 00 
  802819:	b8 00 00 00 00       	mov    $0x0,%eax
  80281e:	49 b8 90 01 80 00 00 	movabs $0x800190,%r8
  802825:	00 00 00 
  802828:	41 ff d0             	callq  *%r8
  80282b:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802832:	7e 35                	jle    802869 <devfile_read+0xde>
  802834:	48 b9 c0 51 80 00 00 	movabs $0x8051c0,%rcx
  80283b:	00 00 00 
  80283e:	48 ba 9d 51 80 00 00 	movabs $0x80519d,%rdx
  802845:	00 00 00 
  802848:	be 8a 00 00 00       	mov    $0x8a,%esi
  80284d:	48 bf b2 51 80 00 00 	movabs $0x8051b2,%rdi
  802854:	00 00 00 
  802857:	b8 00 00 00 00       	mov    $0x0,%eax
  80285c:	49 b8 90 01 80 00 00 	movabs $0x800190,%r8
  802863:	00 00 00 
  802866:	41 ff d0             	callq  *%r8
  802869:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80286c:	48 63 d0             	movslq %eax,%rdx
  80286f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802873:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  80287a:	00 00 00 
  80287d:	48 89 c7             	mov    %rax,%rdi
  802880:	48 b8 7f 12 80 00 00 	movabs $0x80127f,%rax
  802887:	00 00 00 
  80288a:	ff d0                	callq  *%rax
  80288c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80288f:	c9                   	leaveq 
  802890:	c3                   	retq   

0000000000802891 <devfile_write>:
  802891:	55                   	push   %rbp
  802892:	48 89 e5             	mov    %rsp,%rbp
  802895:	48 83 ec 40          	sub    $0x40,%rsp
  802899:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80289d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8028a1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8028a5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8028a9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8028ad:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8028b4:	00 
  8028b5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028b9:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8028bd:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  8028c2:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8028c6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028ca:	8b 50 0c             	mov    0xc(%rax),%edx
  8028cd:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8028d4:	00 00 00 
  8028d7:	89 10                	mov    %edx,(%rax)
  8028d9:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8028e0:	00 00 00 
  8028e3:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8028e7:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8028eb:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8028ef:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8028f3:	48 89 c6             	mov    %rax,%rsi
  8028f6:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  8028fd:	00 00 00 
  802900:	48 b8 7f 12 80 00 00 	movabs $0x80127f,%rax
  802907:	00 00 00 
  80290a:	ff d0                	callq  *%rax
  80290c:	be 00 00 00 00       	mov    $0x0,%esi
  802911:	bf 04 00 00 00       	mov    $0x4,%edi
  802916:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  80291d:	00 00 00 
  802920:	ff d0                	callq  *%rax
  802922:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802925:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802929:	79 05                	jns    802930 <devfile_write+0x9f>
  80292b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80292e:	eb 43                	jmp    802973 <devfile_write+0xe2>
  802930:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802933:	48 98                	cltq   
  802935:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802939:	76 35                	jbe    802970 <devfile_write+0xdf>
  80293b:	48 b9 96 51 80 00 00 	movabs $0x805196,%rcx
  802942:	00 00 00 
  802945:	48 ba 9d 51 80 00 00 	movabs $0x80519d,%rdx
  80294c:	00 00 00 
  80294f:	be a8 00 00 00       	mov    $0xa8,%esi
  802954:	48 bf b2 51 80 00 00 	movabs $0x8051b2,%rdi
  80295b:	00 00 00 
  80295e:	b8 00 00 00 00       	mov    $0x0,%eax
  802963:	49 b8 90 01 80 00 00 	movabs $0x800190,%r8
  80296a:	00 00 00 
  80296d:	41 ff d0             	callq  *%r8
  802970:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802973:	c9                   	leaveq 
  802974:	c3                   	retq   

0000000000802975 <devfile_stat>:
  802975:	55                   	push   %rbp
  802976:	48 89 e5             	mov    %rsp,%rbp
  802979:	48 83 ec 20          	sub    $0x20,%rsp
  80297d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802981:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802985:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802989:	8b 50 0c             	mov    0xc(%rax),%edx
  80298c:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802993:	00 00 00 
  802996:	89 10                	mov    %edx,(%rax)
  802998:	be 00 00 00 00       	mov    $0x0,%esi
  80299d:	bf 05 00 00 00       	mov    $0x5,%edi
  8029a2:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  8029a9:	00 00 00 
  8029ac:	ff d0                	callq  *%rax
  8029ae:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029b1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029b5:	79 05                	jns    8029bc <devfile_stat+0x47>
  8029b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029ba:	eb 56                	jmp    802a12 <devfile_stat+0x9d>
  8029bc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029c0:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8029c7:	00 00 00 
  8029ca:	48 89 c7             	mov    %rax,%rdi
  8029cd:	48 b8 5a 0f 80 00 00 	movabs $0x800f5a,%rax
  8029d4:	00 00 00 
  8029d7:	ff d0                	callq  *%rax
  8029d9:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8029e0:	00 00 00 
  8029e3:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  8029e9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029ed:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8029f3:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8029fa:	00 00 00 
  8029fd:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802a03:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802a07:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802a0d:	b8 00 00 00 00       	mov    $0x0,%eax
  802a12:	c9                   	leaveq 
  802a13:	c3                   	retq   

0000000000802a14 <devfile_trunc>:
  802a14:	55                   	push   %rbp
  802a15:	48 89 e5             	mov    %rsp,%rbp
  802a18:	48 83 ec 10          	sub    $0x10,%rsp
  802a1c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802a20:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802a23:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802a27:	8b 50 0c             	mov    0xc(%rax),%edx
  802a2a:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802a31:	00 00 00 
  802a34:	89 10                	mov    %edx,(%rax)
  802a36:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802a3d:	00 00 00 
  802a40:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802a43:	89 50 04             	mov    %edx,0x4(%rax)
  802a46:	be 00 00 00 00       	mov    $0x0,%esi
  802a4b:	bf 02 00 00 00       	mov    $0x2,%edi
  802a50:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  802a57:	00 00 00 
  802a5a:	ff d0                	callq  *%rax
  802a5c:	c9                   	leaveq 
  802a5d:	c3                   	retq   

0000000000802a5e <remove>:
  802a5e:	55                   	push   %rbp
  802a5f:	48 89 e5             	mov    %rsp,%rbp
  802a62:	48 83 ec 10          	sub    $0x10,%rsp
  802a66:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802a6a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802a6e:	48 89 c7             	mov    %rax,%rdi
  802a71:	48 b8 ee 0e 80 00 00 	movabs $0x800eee,%rax
  802a78:	00 00 00 
  802a7b:	ff d0                	callq  *%rax
  802a7d:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802a82:	7e 07                	jle    802a8b <remove+0x2d>
  802a84:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802a89:	eb 33                	jmp    802abe <remove+0x60>
  802a8b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802a8f:	48 89 c6             	mov    %rax,%rsi
  802a92:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  802a99:	00 00 00 
  802a9c:	48 b8 5a 0f 80 00 00 	movabs $0x800f5a,%rax
  802aa3:	00 00 00 
  802aa6:	ff d0                	callq  *%rax
  802aa8:	be 00 00 00 00       	mov    $0x0,%esi
  802aad:	bf 07 00 00 00       	mov    $0x7,%edi
  802ab2:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  802ab9:	00 00 00 
  802abc:	ff d0                	callq  *%rax
  802abe:	c9                   	leaveq 
  802abf:	c3                   	retq   

0000000000802ac0 <sync>:
  802ac0:	55                   	push   %rbp
  802ac1:	48 89 e5             	mov    %rsp,%rbp
  802ac4:	be 00 00 00 00       	mov    $0x0,%esi
  802ac9:	bf 08 00 00 00       	mov    $0x8,%edi
  802ace:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  802ad5:	00 00 00 
  802ad8:	ff d0                	callq  *%rax
  802ada:	5d                   	pop    %rbp
  802adb:	c3                   	retq   

0000000000802adc <copy>:
  802adc:	55                   	push   %rbp
  802add:	48 89 e5             	mov    %rsp,%rbp
  802ae0:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802ae7:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802aee:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802af5:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802afc:	be 00 00 00 00       	mov    $0x0,%esi
  802b01:	48 89 c7             	mov    %rax,%rdi
  802b04:	48 b8 7a 26 80 00 00 	movabs $0x80267a,%rax
  802b0b:	00 00 00 
  802b0e:	ff d0                	callq  *%rax
  802b10:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b13:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b17:	79 28                	jns    802b41 <copy+0x65>
  802b19:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b1c:	89 c6                	mov    %eax,%esi
  802b1e:	48 bf cc 51 80 00 00 	movabs $0x8051cc,%rdi
  802b25:	00 00 00 
  802b28:	b8 00 00 00 00       	mov    $0x0,%eax
  802b2d:	48 ba ca 03 80 00 00 	movabs $0x8003ca,%rdx
  802b34:	00 00 00 
  802b37:	ff d2                	callq  *%rdx
  802b39:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b3c:	e9 76 01 00 00       	jmpq   802cb7 <copy+0x1db>
  802b41:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802b48:	be 01 01 00 00       	mov    $0x101,%esi
  802b4d:	48 89 c7             	mov    %rax,%rdi
  802b50:	48 b8 7a 26 80 00 00 	movabs $0x80267a,%rax
  802b57:	00 00 00 
  802b5a:	ff d0                	callq  *%rax
  802b5c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802b5f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802b63:	0f 89 ad 00 00 00    	jns    802c16 <copy+0x13a>
  802b69:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b6c:	89 c6                	mov    %eax,%esi
  802b6e:	48 bf e2 51 80 00 00 	movabs $0x8051e2,%rdi
  802b75:	00 00 00 
  802b78:	b8 00 00 00 00       	mov    $0x0,%eax
  802b7d:	48 ba ca 03 80 00 00 	movabs $0x8003ca,%rdx
  802b84:	00 00 00 
  802b87:	ff d2                	callq  *%rdx
  802b89:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b8c:	89 c7                	mov    %eax,%edi
  802b8e:	48 b8 7e 1f 80 00 00 	movabs $0x801f7e,%rax
  802b95:	00 00 00 
  802b98:	ff d0                	callq  *%rax
  802b9a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b9d:	e9 15 01 00 00       	jmpq   802cb7 <copy+0x1db>
  802ba2:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802ba5:	48 63 d0             	movslq %eax,%rdx
  802ba8:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802baf:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802bb2:	48 89 ce             	mov    %rcx,%rsi
  802bb5:	89 c7                	mov    %eax,%edi
  802bb7:	48 b8 ec 22 80 00 00 	movabs $0x8022ec,%rax
  802bbe:	00 00 00 
  802bc1:	ff d0                	callq  *%rax
  802bc3:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802bc6:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802bca:	79 4a                	jns    802c16 <copy+0x13a>
  802bcc:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802bcf:	89 c6                	mov    %eax,%esi
  802bd1:	48 bf fc 51 80 00 00 	movabs $0x8051fc,%rdi
  802bd8:	00 00 00 
  802bdb:	b8 00 00 00 00       	mov    $0x0,%eax
  802be0:	48 ba ca 03 80 00 00 	movabs $0x8003ca,%rdx
  802be7:	00 00 00 
  802bea:	ff d2                	callq  *%rdx
  802bec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bef:	89 c7                	mov    %eax,%edi
  802bf1:	48 b8 7e 1f 80 00 00 	movabs $0x801f7e,%rax
  802bf8:	00 00 00 
  802bfb:	ff d0                	callq  *%rax
  802bfd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c00:	89 c7                	mov    %eax,%edi
  802c02:	48 b8 7e 1f 80 00 00 	movabs $0x801f7e,%rax
  802c09:	00 00 00 
  802c0c:	ff d0                	callq  *%rax
  802c0e:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802c11:	e9 a1 00 00 00       	jmpq   802cb7 <copy+0x1db>
  802c16:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802c1d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c20:	ba 00 02 00 00       	mov    $0x200,%edx
  802c25:	48 89 ce             	mov    %rcx,%rsi
  802c28:	89 c7                	mov    %eax,%edi
  802c2a:	48 b8 a1 21 80 00 00 	movabs $0x8021a1,%rax
  802c31:	00 00 00 
  802c34:	ff d0                	callq  *%rax
  802c36:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802c39:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802c3d:	0f 8f 5f ff ff ff    	jg     802ba2 <copy+0xc6>
  802c43:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802c47:	79 47                	jns    802c90 <copy+0x1b4>
  802c49:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802c4c:	89 c6                	mov    %eax,%esi
  802c4e:	48 bf 0f 52 80 00 00 	movabs $0x80520f,%rdi
  802c55:	00 00 00 
  802c58:	b8 00 00 00 00       	mov    $0x0,%eax
  802c5d:	48 ba ca 03 80 00 00 	movabs $0x8003ca,%rdx
  802c64:	00 00 00 
  802c67:	ff d2                	callq  *%rdx
  802c69:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c6c:	89 c7                	mov    %eax,%edi
  802c6e:	48 b8 7e 1f 80 00 00 	movabs $0x801f7e,%rax
  802c75:	00 00 00 
  802c78:	ff d0                	callq  *%rax
  802c7a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c7d:	89 c7                	mov    %eax,%edi
  802c7f:	48 b8 7e 1f 80 00 00 	movabs $0x801f7e,%rax
  802c86:	00 00 00 
  802c89:	ff d0                	callq  *%rax
  802c8b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802c8e:	eb 27                	jmp    802cb7 <copy+0x1db>
  802c90:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c93:	89 c7                	mov    %eax,%edi
  802c95:	48 b8 7e 1f 80 00 00 	movabs $0x801f7e,%rax
  802c9c:	00 00 00 
  802c9f:	ff d0                	callq  *%rax
  802ca1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ca4:	89 c7                	mov    %eax,%edi
  802ca6:	48 b8 7e 1f 80 00 00 	movabs $0x801f7e,%rax
  802cad:	00 00 00 
  802cb0:	ff d0                	callq  *%rax
  802cb2:	b8 00 00 00 00       	mov    $0x0,%eax
  802cb7:	c9                   	leaveq 
  802cb8:	c3                   	retq   

0000000000802cb9 <spawn>:
  802cb9:	55                   	push   %rbp
  802cba:	48 89 e5             	mov    %rsp,%rbp
  802cbd:	48 81 ec 00 03 00 00 	sub    $0x300,%rsp
  802cc4:	48 89 bd 08 fd ff ff 	mov    %rdi,-0x2f8(%rbp)
  802ccb:	48 89 b5 00 fd ff ff 	mov    %rsi,-0x300(%rbp)
  802cd2:	48 8b 85 08 fd ff ff 	mov    -0x2f8(%rbp),%rax
  802cd9:	be 00 00 00 00       	mov    $0x0,%esi
  802cde:	48 89 c7             	mov    %rax,%rdi
  802ce1:	48 b8 7a 26 80 00 00 	movabs $0x80267a,%rax
  802ce8:	00 00 00 
  802ceb:	ff d0                	callq  *%rax
  802ced:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802cf0:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  802cf4:	79 08                	jns    802cfe <spawn+0x45>
  802cf6:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802cf9:	e9 11 03 00 00       	jmpq   80300f <spawn+0x356>
  802cfe:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802d01:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  802d04:	48 8d 85 d0 fd ff ff 	lea    -0x230(%rbp),%rax
  802d0b:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  802d0f:	48 8d 8d d0 fd ff ff 	lea    -0x230(%rbp),%rcx
  802d16:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802d19:	ba 00 02 00 00       	mov    $0x200,%edx
  802d1e:	48 89 ce             	mov    %rcx,%rsi
  802d21:	89 c7                	mov    %eax,%edi
  802d23:	48 b8 76 22 80 00 00 	movabs $0x802276,%rax
  802d2a:	00 00 00 
  802d2d:	ff d0                	callq  *%rax
  802d2f:	3d 00 02 00 00       	cmp    $0x200,%eax
  802d34:	75 0d                	jne    802d43 <spawn+0x8a>
  802d36:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802d3a:	8b 00                	mov    (%rax),%eax
  802d3c:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  802d41:	74 43                	je     802d86 <spawn+0xcd>
  802d43:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802d46:	89 c7                	mov    %eax,%edi
  802d48:	48 b8 7e 1f 80 00 00 	movabs $0x801f7e,%rax
  802d4f:	00 00 00 
  802d52:	ff d0                	callq  *%rax
  802d54:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802d58:	8b 00                	mov    (%rax),%eax
  802d5a:	ba 7f 45 4c 46       	mov    $0x464c457f,%edx
  802d5f:	89 c6                	mov    %eax,%esi
  802d61:	48 bf 28 52 80 00 00 	movabs $0x805228,%rdi
  802d68:	00 00 00 
  802d6b:	b8 00 00 00 00       	mov    $0x0,%eax
  802d70:	48 b9 ca 03 80 00 00 	movabs $0x8003ca,%rcx
  802d77:	00 00 00 
  802d7a:	ff d1                	callq  *%rcx
  802d7c:	b8 f1 ff ff ff       	mov    $0xfffffff1,%eax
  802d81:	e9 89 02 00 00       	jmpq   80300f <spawn+0x356>
  802d86:	b8 07 00 00 00       	mov    $0x7,%eax
  802d8b:	cd 30                	int    $0x30
  802d8d:	89 45 d0             	mov    %eax,-0x30(%rbp)
  802d90:	8b 45 d0             	mov    -0x30(%rbp),%eax
  802d93:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802d96:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  802d9a:	79 08                	jns    802da4 <spawn+0xeb>
  802d9c:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802d9f:	e9 6b 02 00 00       	jmpq   80300f <spawn+0x356>
  802da4:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802da7:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  802daa:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  802dad:	25 ff 03 00 00       	and    $0x3ff,%eax
  802db2:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802db9:	00 00 00 
  802dbc:	48 98                	cltq   
  802dbe:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802dc5:	48 01 c2             	add    %rax,%rdx
  802dc8:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  802dcf:	48 89 d6             	mov    %rdx,%rsi
  802dd2:	ba 18 00 00 00       	mov    $0x18,%edx
  802dd7:	48 89 c7             	mov    %rax,%rdi
  802dda:	48 89 d1             	mov    %rdx,%rcx
  802ddd:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  802de0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802de4:	48 8b 40 18          	mov    0x18(%rax),%rax
  802de8:	48 89 85 a8 fd ff ff 	mov    %rax,-0x258(%rbp)
  802def:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  802df6:	48 8d 90 b0 00 00 00 	lea    0xb0(%rax),%rdx
  802dfd:	48 8b 8d 00 fd ff ff 	mov    -0x300(%rbp),%rcx
  802e04:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  802e07:	48 89 ce             	mov    %rcx,%rsi
  802e0a:	89 c7                	mov    %eax,%edi
  802e0c:	48 b8 73 32 80 00 00 	movabs $0x803273,%rax
  802e13:	00 00 00 
  802e16:	ff d0                	callq  *%rax
  802e18:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802e1b:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  802e1f:	79 08                	jns    802e29 <spawn+0x170>
  802e21:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802e24:	e9 e6 01 00 00       	jmpq   80300f <spawn+0x356>
  802e29:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802e2d:	48 8b 40 20          	mov    0x20(%rax),%rax
  802e31:	48 8d 95 d0 fd ff ff 	lea    -0x230(%rbp),%rdx
  802e38:	48 01 d0             	add    %rdx,%rax
  802e3b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802e3f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802e46:	e9 80 00 00 00       	jmpq   802ecb <spawn+0x212>
  802e4b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e4f:	8b 00                	mov    (%rax),%eax
  802e51:	83 f8 01             	cmp    $0x1,%eax
  802e54:	75 6b                	jne    802ec1 <spawn+0x208>
  802e56:	c7 45 ec 05 00 00 00 	movl   $0x5,-0x14(%rbp)
  802e5d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e61:	8b 40 04             	mov    0x4(%rax),%eax
  802e64:	83 e0 02             	and    $0x2,%eax
  802e67:	85 c0                	test   %eax,%eax
  802e69:	74 04                	je     802e6f <spawn+0x1b6>
  802e6b:	83 4d ec 02          	orl    $0x2,-0x14(%rbp)
  802e6f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e73:	48 8b 40 08          	mov    0x8(%rax),%rax
  802e77:	41 89 c1             	mov    %eax,%r9d
  802e7a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e7e:	4c 8b 40 20          	mov    0x20(%rax),%r8
  802e82:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e86:	48 8b 50 28          	mov    0x28(%rax),%rdx
  802e8a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e8e:	48 8b 70 10          	mov    0x10(%rax),%rsi
  802e92:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  802e95:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  802e98:	48 83 ec 08          	sub    $0x8,%rsp
  802e9c:	8b 7d ec             	mov    -0x14(%rbp),%edi
  802e9f:	57                   	push   %rdi
  802ea0:	89 c7                	mov    %eax,%edi
  802ea2:	48 b8 1f 35 80 00 00 	movabs $0x80351f,%rax
  802ea9:	00 00 00 
  802eac:	ff d0                	callq  *%rax
  802eae:	48 83 c4 10          	add    $0x10,%rsp
  802eb2:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802eb5:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  802eb9:	0f 88 2a 01 00 00    	js     802fe9 <spawn+0x330>
  802ebf:	eb 01                	jmp    802ec2 <spawn+0x209>
  802ec1:	90                   	nop
  802ec2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802ec6:	48 83 45 f0 38       	addq   $0x38,-0x10(%rbp)
  802ecb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802ecf:	0f b7 40 38          	movzwl 0x38(%rax),%eax
  802ed3:	0f b7 c0             	movzwl %ax,%eax
  802ed6:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  802ed9:	0f 8f 6c ff ff ff    	jg     802e4b <spawn+0x192>
  802edf:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802ee2:	89 c7                	mov    %eax,%edi
  802ee4:	48 b8 7e 1f 80 00 00 	movabs $0x801f7e,%rax
  802eeb:	00 00 00 
  802eee:	ff d0                	callq  *%rax
  802ef0:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
  802ef7:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  802efa:	89 c7                	mov    %eax,%edi
  802efc:	48 b8 0b 37 80 00 00 	movabs $0x80370b,%rax
  802f03:	00 00 00 
  802f06:	ff d0                	callq  *%rax
  802f08:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802f0b:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  802f0f:	79 30                	jns    802f41 <spawn+0x288>
  802f11:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802f14:	89 c1                	mov    %eax,%ecx
  802f16:	48 ba 42 52 80 00 00 	movabs $0x805242,%rdx
  802f1d:	00 00 00 
  802f20:	be 86 00 00 00       	mov    $0x86,%esi
  802f25:	48 bf 58 52 80 00 00 	movabs $0x805258,%rdi
  802f2c:	00 00 00 
  802f2f:	b8 00 00 00 00       	mov    $0x0,%eax
  802f34:	49 b8 90 01 80 00 00 	movabs $0x800190,%r8
  802f3b:	00 00 00 
  802f3e:	41 ff d0             	callq  *%r8
  802f41:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  802f48:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  802f4b:	48 89 d6             	mov    %rdx,%rsi
  802f4e:	89 c7                	mov    %eax,%edi
  802f50:	48 b8 d5 19 80 00 00 	movabs $0x8019d5,%rax
  802f57:	00 00 00 
  802f5a:	ff d0                	callq  *%rax
  802f5c:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802f5f:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  802f63:	79 30                	jns    802f95 <spawn+0x2dc>
  802f65:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802f68:	89 c1                	mov    %eax,%ecx
  802f6a:	48 ba 67 52 80 00 00 	movabs $0x805267,%rdx
  802f71:	00 00 00 
  802f74:	be 8a 00 00 00       	mov    $0x8a,%esi
  802f79:	48 bf 58 52 80 00 00 	movabs $0x805258,%rdi
  802f80:	00 00 00 
  802f83:	b8 00 00 00 00       	mov    $0x0,%eax
  802f88:	49 b8 90 01 80 00 00 	movabs $0x800190,%r8
  802f8f:	00 00 00 
  802f92:	41 ff d0             	callq  *%r8
  802f95:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  802f98:	be 02 00 00 00       	mov    $0x2,%esi
  802f9d:	89 c7                	mov    %eax,%edi
  802f9f:	48 b8 88 19 80 00 00 	movabs $0x801988,%rax
  802fa6:	00 00 00 
  802fa9:	ff d0                	callq  *%rax
  802fab:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802fae:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  802fb2:	79 30                	jns    802fe4 <spawn+0x32b>
  802fb4:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802fb7:	89 c1                	mov    %eax,%ecx
  802fb9:	48 ba 81 52 80 00 00 	movabs $0x805281,%rdx
  802fc0:	00 00 00 
  802fc3:	be 8d 00 00 00       	mov    $0x8d,%esi
  802fc8:	48 bf 58 52 80 00 00 	movabs $0x805258,%rdi
  802fcf:	00 00 00 
  802fd2:	b8 00 00 00 00       	mov    $0x0,%eax
  802fd7:	49 b8 90 01 80 00 00 	movabs $0x800190,%r8
  802fde:	00 00 00 
  802fe1:	41 ff d0             	callq  *%r8
  802fe4:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  802fe7:	eb 26                	jmp    80300f <spawn+0x356>
  802fe9:	90                   	nop
  802fea:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  802fed:	89 c7                	mov    %eax,%edi
  802fef:	48 b8 cb 17 80 00 00 	movabs $0x8017cb,%rax
  802ff6:	00 00 00 
  802ff9:	ff d0                	callq  *%rax
  802ffb:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802ffe:	89 c7                	mov    %eax,%edi
  803000:	48 b8 7e 1f 80 00 00 	movabs $0x801f7e,%rax
  803007:	00 00 00 
  80300a:	ff d0                	callq  *%rax
  80300c:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80300f:	c9                   	leaveq 
  803010:	c3                   	retq   

0000000000803011 <spawnl>:
  803011:	55                   	push   %rbp
  803012:	48 89 e5             	mov    %rsp,%rbp
  803015:	41 55                	push   %r13
  803017:	41 54                	push   %r12
  803019:	53                   	push   %rbx
  80301a:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  803021:	48 89 bd f8 fe ff ff 	mov    %rdi,-0x108(%rbp)
  803028:	48 89 b5 f0 fe ff ff 	mov    %rsi,-0x110(%rbp)
  80302f:	48 89 95 40 ff ff ff 	mov    %rdx,-0xc0(%rbp)
  803036:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
  80303d:	4c 89 85 50 ff ff ff 	mov    %r8,-0xb0(%rbp)
  803044:	4c 89 8d 58 ff ff ff 	mov    %r9,-0xa8(%rbp)
  80304b:	84 c0                	test   %al,%al
  80304d:	74 26                	je     803075 <spawnl+0x64>
  80304f:	0f 29 85 60 ff ff ff 	movaps %xmm0,-0xa0(%rbp)
  803056:	0f 29 8d 70 ff ff ff 	movaps %xmm1,-0x90(%rbp)
  80305d:	0f 29 55 80          	movaps %xmm2,-0x80(%rbp)
  803061:	0f 29 5d 90          	movaps %xmm3,-0x70(%rbp)
  803065:	0f 29 65 a0          	movaps %xmm4,-0x60(%rbp)
  803069:	0f 29 6d b0          	movaps %xmm5,-0x50(%rbp)
  80306d:	0f 29 75 c0          	movaps %xmm6,-0x40(%rbp)
  803071:	0f 29 7d d0          	movaps %xmm7,-0x30(%rbp)
  803075:	c7 85 2c ff ff ff 00 	movl   $0x0,-0xd4(%rbp)
  80307c:	00 00 00 
  80307f:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  803086:	00 00 00 
  803089:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  803090:	00 00 00 
  803093:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803097:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  80309e:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  8030a5:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  8030ac:	eb 07                	jmp    8030b5 <spawnl+0xa4>
  8030ae:	83 85 2c ff ff ff 01 	addl   $0x1,-0xd4(%rbp)
  8030b5:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  8030bb:	83 f8 30             	cmp    $0x30,%eax
  8030be:	73 23                	jae    8030e3 <spawnl+0xd2>
  8030c0:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
  8030c7:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8030cd:	89 d2                	mov    %edx,%edx
  8030cf:	48 01 d0             	add    %rdx,%rax
  8030d2:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8030d8:	83 c2 08             	add    $0x8,%edx
  8030db:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  8030e1:	eb 12                	jmp    8030f5 <spawnl+0xe4>
  8030e3:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8030ea:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8030ee:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8030f5:	48 8b 00             	mov    (%rax),%rax
  8030f8:	48 85 c0             	test   %rax,%rax
  8030fb:	75 b1                	jne    8030ae <spawnl+0x9d>
  8030fd:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803103:	83 c0 02             	add    $0x2,%eax
  803106:	48 89 e2             	mov    %rsp,%rdx
  803109:	48 89 d3             	mov    %rdx,%rbx
  80310c:	48 63 d0             	movslq %eax,%rdx
  80310f:	48 83 ea 01          	sub    $0x1,%rdx
  803113:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
  80311a:	48 63 d0             	movslq %eax,%rdx
  80311d:	49 89 d4             	mov    %rdx,%r12
  803120:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  803126:	48 63 d0             	movslq %eax,%rdx
  803129:	49 89 d2             	mov    %rdx,%r10
  80312c:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  803132:	48 98                	cltq   
  803134:	48 c1 e0 03          	shl    $0x3,%rax
  803138:	48 8d 50 07          	lea    0x7(%rax),%rdx
  80313c:	b8 10 00 00 00       	mov    $0x10,%eax
  803141:	48 83 e8 01          	sub    $0x1,%rax
  803145:	48 01 d0             	add    %rdx,%rax
  803148:	be 10 00 00 00       	mov    $0x10,%esi
  80314d:	ba 00 00 00 00       	mov    $0x0,%edx
  803152:	48 f7 f6             	div    %rsi
  803155:	48 6b c0 10          	imul   $0x10,%rax,%rax
  803159:	48 29 c4             	sub    %rax,%rsp
  80315c:	48 89 e0             	mov    %rsp,%rax
  80315f:	48 83 c0 07          	add    $0x7,%rax
  803163:	48 c1 e8 03          	shr    $0x3,%rax
  803167:	48 c1 e0 03          	shl    $0x3,%rax
  80316b:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
  803172:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803179:	48 8b 95 f0 fe ff ff 	mov    -0x110(%rbp),%rdx
  803180:	48 89 10             	mov    %rdx,(%rax)
  803183:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803189:	8d 50 01             	lea    0x1(%rax),%edx
  80318c:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803193:	48 63 d2             	movslq %edx,%rdx
  803196:	48 c7 04 d0 00 00 00 	movq   $0x0,(%rax,%rdx,8)
  80319d:	00 
  80319e:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  8031a5:	00 00 00 
  8031a8:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  8031af:	00 00 00 
  8031b2:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8031b6:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  8031bd:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  8031c4:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  8031cb:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%rbp)
  8031d2:	00 00 00 
  8031d5:	eb 60                	jmp    803237 <spawnl+0x226>
  8031d7:	8b 85 28 ff ff ff    	mov    -0xd8(%rbp),%eax
  8031dd:	8d 48 01             	lea    0x1(%rax),%ecx
  8031e0:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  8031e6:	83 f8 30             	cmp    $0x30,%eax
  8031e9:	73 23                	jae    80320e <spawnl+0x1fd>
  8031eb:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
  8031f2:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8031f8:	89 d2                	mov    %edx,%edx
  8031fa:	48 01 d0             	add    %rdx,%rax
  8031fd:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  803203:	83 c2 08             	add    $0x8,%edx
  803206:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  80320c:	eb 12                	jmp    803220 <spawnl+0x20f>
  80320e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  803215:	48 8d 50 08          	lea    0x8(%rax),%rdx
  803219:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803220:	48 8b 10             	mov    (%rax),%rdx
  803223:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  80322a:	89 c9                	mov    %ecx,%ecx
  80322c:	48 89 14 c8          	mov    %rdx,(%rax,%rcx,8)
  803230:	83 85 28 ff ff ff 01 	addl   $0x1,-0xd8(%rbp)
  803237:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  80323d:	39 85 28 ff ff ff    	cmp    %eax,-0xd8(%rbp)
  803243:	72 92                	jb     8031d7 <spawnl+0x1c6>
  803245:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  80324c:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
  803253:	48 89 d6             	mov    %rdx,%rsi
  803256:	48 89 c7             	mov    %rax,%rdi
  803259:	48 b8 b9 2c 80 00 00 	movabs $0x802cb9,%rax
  803260:	00 00 00 
  803263:	ff d0                	callq  *%rax
  803265:	48 89 dc             	mov    %rbx,%rsp
  803268:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
  80326c:	5b                   	pop    %rbx
  80326d:	41 5c                	pop    %r12
  80326f:	41 5d                	pop    %r13
  803271:	5d                   	pop    %rbp
  803272:	c3                   	retq   

0000000000803273 <init_stack>:
  803273:	55                   	push   %rbp
  803274:	48 89 e5             	mov    %rsp,%rbp
  803277:	48 83 ec 50          	sub    $0x50,%rsp
  80327b:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80327e:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  803282:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  803286:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80328d:	00 
  80328e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  803295:	eb 33                	jmp    8032ca <init_stack+0x57>
  803297:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80329a:	48 98                	cltq   
  80329c:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8032a3:	00 
  8032a4:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8032a8:	48 01 d0             	add    %rdx,%rax
  8032ab:	48 8b 00             	mov    (%rax),%rax
  8032ae:	48 89 c7             	mov    %rax,%rdi
  8032b1:	48 b8 ee 0e 80 00 00 	movabs $0x800eee,%rax
  8032b8:	00 00 00 
  8032bb:	ff d0                	callq  *%rax
  8032bd:	83 c0 01             	add    $0x1,%eax
  8032c0:	48 98                	cltq   
  8032c2:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8032c6:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  8032ca:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8032cd:	48 98                	cltq   
  8032cf:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8032d6:	00 
  8032d7:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8032db:	48 01 d0             	add    %rdx,%rax
  8032de:	48 8b 00             	mov    (%rax),%rax
  8032e1:	48 85 c0             	test   %rax,%rax
  8032e4:	75 b1                	jne    803297 <init_stack+0x24>
  8032e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8032ea:	48 f7 d8             	neg    %rax
  8032ed:	48 05 00 10 40 00    	add    $0x401000,%rax
  8032f3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8032f7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8032fb:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8032ff:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803303:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  803307:	48 89 c2             	mov    %rax,%rdx
  80330a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80330d:	83 c0 01             	add    $0x1,%eax
  803310:	c1 e0 03             	shl    $0x3,%eax
  803313:	48 98                	cltq   
  803315:	48 f7 d8             	neg    %rax
  803318:	48 01 d0             	add    %rdx,%rax
  80331b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  80331f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803323:	48 83 e8 10          	sub    $0x10,%rax
  803327:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
  80332d:	77 0a                	ja     803339 <init_stack+0xc6>
  80332f:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
  803334:	e9 e4 01 00 00       	jmpq   80351d <init_stack+0x2aa>
  803339:	ba 07 00 00 00       	mov    $0x7,%edx
  80333e:	be 00 00 40 00       	mov    $0x400000,%esi
  803343:	bf 00 00 00 00       	mov    $0x0,%edi
  803348:	48 b8 8a 18 80 00 00 	movabs $0x80188a,%rax
  80334f:	00 00 00 
  803352:	ff d0                	callq  *%rax
  803354:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803357:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80335b:	79 08                	jns    803365 <init_stack+0xf2>
  80335d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803360:	e9 b8 01 00 00       	jmpq   80351d <init_stack+0x2aa>
  803365:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  80336c:	e9 8a 00 00 00       	jmpq   8033fb <init_stack+0x188>
  803371:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803374:	48 98                	cltq   
  803376:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80337d:	00 
  80337e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803382:	48 01 d0             	add    %rdx,%rax
  803385:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  80338a:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80338e:	48 01 ca             	add    %rcx,%rdx
  803391:	48 81 ea 00 00 40 00 	sub    $0x400000,%rdx
  803398:	48 89 10             	mov    %rdx,(%rax)
  80339b:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80339e:	48 98                	cltq   
  8033a0:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8033a7:	00 
  8033a8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8033ac:	48 01 d0             	add    %rdx,%rax
  8033af:	48 8b 10             	mov    (%rax),%rdx
  8033b2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8033b6:	48 89 d6             	mov    %rdx,%rsi
  8033b9:	48 89 c7             	mov    %rax,%rdi
  8033bc:	48 b8 5a 0f 80 00 00 	movabs $0x800f5a,%rax
  8033c3:	00 00 00 
  8033c6:	ff d0                	callq  *%rax
  8033c8:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8033cb:	48 98                	cltq   
  8033cd:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8033d4:	00 
  8033d5:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8033d9:	48 01 d0             	add    %rdx,%rax
  8033dc:	48 8b 00             	mov    (%rax),%rax
  8033df:	48 89 c7             	mov    %rax,%rdi
  8033e2:	48 b8 ee 0e 80 00 00 	movabs $0x800eee,%rax
  8033e9:	00 00 00 
  8033ec:	ff d0                	callq  *%rax
  8033ee:	83 c0 01             	add    $0x1,%eax
  8033f1:	48 98                	cltq   
  8033f3:	48 01 45 e0          	add    %rax,-0x20(%rbp)
  8033f7:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
  8033fb:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8033fe:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  803401:	0f 8c 6a ff ff ff    	jl     803371 <init_stack+0xfe>
  803407:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80340a:	48 98                	cltq   
  80340c:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803413:	00 
  803414:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803418:	48 01 d0             	add    %rdx,%rax
  80341b:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  803422:	48 81 7d e0 00 10 40 	cmpq   $0x401000,-0x20(%rbp)
  803429:	00 
  80342a:	74 35                	je     803461 <init_stack+0x1ee>
  80342c:	48 b9 98 52 80 00 00 	movabs $0x805298,%rcx
  803433:	00 00 00 
  803436:	48 ba be 52 80 00 00 	movabs $0x8052be,%rdx
  80343d:	00 00 00 
  803440:	be f6 00 00 00       	mov    $0xf6,%esi
  803445:	48 bf 58 52 80 00 00 	movabs $0x805258,%rdi
  80344c:	00 00 00 
  80344f:	b8 00 00 00 00       	mov    $0x0,%eax
  803454:	49 b8 90 01 80 00 00 	movabs $0x800190,%r8
  80345b:	00 00 00 
  80345e:	41 ff d0             	callq  *%r8
  803461:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803465:	48 83 e8 08          	sub    $0x8,%rax
  803469:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  80346e:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  803472:	48 01 ca             	add    %rcx,%rdx
  803475:	48 81 ea 00 00 40 00 	sub    $0x400000,%rdx
  80347c:	48 89 10             	mov    %rdx,(%rax)
  80347f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803483:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  803487:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80348a:	48 98                	cltq   
  80348c:	48 89 02             	mov    %rax,(%rdx)
  80348f:	ba f0 cf 7f ef       	mov    $0xef7fcff0,%edx
  803494:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803498:	48 01 d0             	add    %rdx,%rax
  80349b:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  8034a1:	48 89 c2             	mov    %rax,%rdx
  8034a4:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  8034a8:	48 89 10             	mov    %rdx,(%rax)
  8034ab:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8034ae:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  8034b4:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  8034b9:	89 c2                	mov    %eax,%edx
  8034bb:	be 00 00 40 00       	mov    $0x400000,%esi
  8034c0:	bf 00 00 00 00       	mov    $0x0,%edi
  8034c5:	48 b8 dc 18 80 00 00 	movabs $0x8018dc,%rax
  8034cc:	00 00 00 
  8034cf:	ff d0                	callq  *%rax
  8034d1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8034d4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8034d8:	78 26                	js     803500 <init_stack+0x28d>
  8034da:	be 00 00 40 00       	mov    $0x400000,%esi
  8034df:	bf 00 00 00 00       	mov    $0x0,%edi
  8034e4:	48 b8 3c 19 80 00 00 	movabs $0x80193c,%rax
  8034eb:	00 00 00 
  8034ee:	ff d0                	callq  *%rax
  8034f0:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8034f3:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8034f7:	78 0a                	js     803503 <init_stack+0x290>
  8034f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8034fe:	eb 1d                	jmp    80351d <init_stack+0x2aa>
  803500:	90                   	nop
  803501:	eb 01                	jmp    803504 <init_stack+0x291>
  803503:	90                   	nop
  803504:	be 00 00 40 00       	mov    $0x400000,%esi
  803509:	bf 00 00 00 00       	mov    $0x0,%edi
  80350e:	48 b8 3c 19 80 00 00 	movabs $0x80193c,%rax
  803515:	00 00 00 
  803518:	ff d0                	callq  *%rax
  80351a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80351d:	c9                   	leaveq 
  80351e:	c3                   	retq   

000000000080351f <map_segment>:
  80351f:	55                   	push   %rbp
  803520:	48 89 e5             	mov    %rsp,%rbp
  803523:	48 83 ec 50          	sub    $0x50,%rsp
  803527:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80352a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80352e:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803532:	89 4d d8             	mov    %ecx,-0x28(%rbp)
  803535:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  803539:	44 89 4d bc          	mov    %r9d,-0x44(%rbp)
  80353d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803541:	25 ff 0f 00 00       	and    $0xfff,%eax
  803546:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803549:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80354d:	74 21                	je     803570 <map_segment+0x51>
  80354f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803552:	48 98                	cltq   
  803554:	48 29 45 d0          	sub    %rax,-0x30(%rbp)
  803558:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80355b:	48 98                	cltq   
  80355d:	48 01 45 c8          	add    %rax,-0x38(%rbp)
  803561:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803564:	48 98                	cltq   
  803566:	48 01 45 c0          	add    %rax,-0x40(%rbp)
  80356a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80356d:	29 45 bc             	sub    %eax,-0x44(%rbp)
  803570:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803577:	e9 79 01 00 00       	jmpq   8036f5 <map_segment+0x1d6>
  80357c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80357f:	48 98                	cltq   
  803581:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
  803585:	72 3c                	jb     8035c3 <map_segment+0xa4>
  803587:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80358a:	48 63 d0             	movslq %eax,%rdx
  80358d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803591:	48 01 d0             	add    %rdx,%rax
  803594:	48 89 c1             	mov    %rax,%rcx
  803597:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80359a:	8b 55 10             	mov    0x10(%rbp),%edx
  80359d:	48 89 ce             	mov    %rcx,%rsi
  8035a0:	89 c7                	mov    %eax,%edi
  8035a2:	48 b8 8a 18 80 00 00 	movabs $0x80188a,%rax
  8035a9:	00 00 00 
  8035ac:	ff d0                	callq  *%rax
  8035ae:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8035b1:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8035b5:	0f 89 33 01 00 00    	jns    8036ee <map_segment+0x1cf>
  8035bb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035be:	e9 46 01 00 00       	jmpq   803709 <map_segment+0x1ea>
  8035c3:	ba 07 00 00 00       	mov    $0x7,%edx
  8035c8:	be 00 00 40 00       	mov    $0x400000,%esi
  8035cd:	bf 00 00 00 00       	mov    $0x0,%edi
  8035d2:	48 b8 8a 18 80 00 00 	movabs $0x80188a,%rax
  8035d9:	00 00 00 
  8035dc:	ff d0                	callq  *%rax
  8035de:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8035e1:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8035e5:	79 08                	jns    8035ef <map_segment+0xd0>
  8035e7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035ea:	e9 1a 01 00 00       	jmpq   803709 <map_segment+0x1ea>
  8035ef:	8b 55 bc             	mov    -0x44(%rbp),%edx
  8035f2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035f5:	01 c2                	add    %eax,%edx
  8035f7:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8035fa:	89 d6                	mov    %edx,%esi
  8035fc:	89 c7                	mov    %eax,%edi
  8035fe:	48 b8 c0 23 80 00 00 	movabs $0x8023c0,%rax
  803605:	00 00 00 
  803608:	ff d0                	callq  *%rax
  80360a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80360d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803611:	79 08                	jns    80361b <map_segment+0xfc>
  803613:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803616:	e9 ee 00 00 00       	jmpq   803709 <map_segment+0x1ea>
  80361b:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  803622:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803625:	48 98                	cltq   
  803627:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80362b:	48 29 c2             	sub    %rax,%rdx
  80362e:	48 89 d0             	mov    %rdx,%rax
  803631:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803635:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803638:	48 63 d0             	movslq %eax,%rdx
  80363b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80363f:	48 39 c2             	cmp    %rax,%rdx
  803642:	48 0f 47 d0          	cmova  %rax,%rdx
  803646:	8b 45 d8             	mov    -0x28(%rbp),%eax
  803649:	be 00 00 40 00       	mov    $0x400000,%esi
  80364e:	89 c7                	mov    %eax,%edi
  803650:	48 b8 76 22 80 00 00 	movabs $0x802276,%rax
  803657:	00 00 00 
  80365a:	ff d0                	callq  *%rax
  80365c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80365f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803663:	79 08                	jns    80366d <map_segment+0x14e>
  803665:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803668:	e9 9c 00 00 00       	jmpq   803709 <map_segment+0x1ea>
  80366d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803670:	48 63 d0             	movslq %eax,%rdx
  803673:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803677:	48 01 d0             	add    %rdx,%rax
  80367a:	48 89 c2             	mov    %rax,%rdx
  80367d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803680:	44 8b 45 10          	mov    0x10(%rbp),%r8d
  803684:	48 89 d1             	mov    %rdx,%rcx
  803687:	89 c2                	mov    %eax,%edx
  803689:	be 00 00 40 00       	mov    $0x400000,%esi
  80368e:	bf 00 00 00 00       	mov    $0x0,%edi
  803693:	48 b8 dc 18 80 00 00 	movabs $0x8018dc,%rax
  80369a:	00 00 00 
  80369d:	ff d0                	callq  *%rax
  80369f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8036a2:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8036a6:	79 30                	jns    8036d8 <map_segment+0x1b9>
  8036a8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036ab:	89 c1                	mov    %eax,%ecx
  8036ad:	48 ba d3 52 80 00 00 	movabs $0x8052d3,%rdx
  8036b4:	00 00 00 
  8036b7:	be 29 01 00 00       	mov    $0x129,%esi
  8036bc:	48 bf 58 52 80 00 00 	movabs $0x805258,%rdi
  8036c3:	00 00 00 
  8036c6:	b8 00 00 00 00       	mov    $0x0,%eax
  8036cb:	49 b8 90 01 80 00 00 	movabs $0x800190,%r8
  8036d2:	00 00 00 
  8036d5:	41 ff d0             	callq  *%r8
  8036d8:	be 00 00 40 00       	mov    $0x400000,%esi
  8036dd:	bf 00 00 00 00       	mov    $0x0,%edi
  8036e2:	48 b8 3c 19 80 00 00 	movabs $0x80193c,%rax
  8036e9:	00 00 00 
  8036ec:	ff d0                	callq  *%rax
  8036ee:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
  8036f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036f8:	48 98                	cltq   
  8036fa:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8036fe:	0f 82 78 fe ff ff    	jb     80357c <map_segment+0x5d>
  803704:	b8 00 00 00 00       	mov    $0x0,%eax
  803709:	c9                   	leaveq 
  80370a:	c3                   	retq   

000000000080370b <copy_shared_pages>:
  80370b:	55                   	push   %rbp
  80370c:	48 89 e5             	mov    %rsp,%rbp
  80370f:	48 83 ec 30          	sub    $0x30,%rsp
  803713:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803716:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80371d:	00 
  80371e:	e9 eb 00 00 00       	jmpq   80380e <copy_shared_pages+0x103>
  803723:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803727:	48 c1 f8 12          	sar    $0x12,%rax
  80372b:	48 89 c2             	mov    %rax,%rdx
  80372e:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  803735:	01 00 00 
  803738:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80373c:	83 e0 01             	and    $0x1,%eax
  80373f:	48 85 c0             	test   %rax,%rax
  803742:	74 21                	je     803765 <copy_shared_pages+0x5a>
  803744:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803748:	48 c1 f8 09          	sar    $0x9,%rax
  80374c:	48 89 c2             	mov    %rax,%rdx
  80374f:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803756:	01 00 00 
  803759:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80375d:	83 e0 01             	and    $0x1,%eax
  803760:	48 85 c0             	test   %rax,%rax
  803763:	75 0d                	jne    803772 <copy_shared_pages+0x67>
  803765:	48 81 45 f8 00 02 00 	addq   $0x200,-0x8(%rbp)
  80376c:	00 
  80376d:	e9 9c 00 00 00       	jmpq   80380e <copy_shared_pages+0x103>
  803772:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803776:	48 05 00 02 00 00    	add    $0x200,%rax
  80377c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803780:	eb 7e                	jmp    803800 <copy_shared_pages+0xf5>
  803782:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803789:	01 00 00 
  80378c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803790:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803794:	25 01 04 00 00       	and    $0x401,%eax
  803799:	48 3d 01 04 00 00    	cmp    $0x401,%rax
  80379f:	75 5a                	jne    8037fb <copy_shared_pages+0xf0>
  8037a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037a5:	48 c1 e0 0c          	shl    $0xc,%rax
  8037a9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8037ad:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8037b4:	01 00 00 
  8037b7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8037bb:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8037bf:	25 07 0e 00 00       	and    $0xe07,%eax
  8037c4:	89 c6                	mov    %eax,%esi
  8037c6:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8037ca:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8037cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037d1:	41 89 f0             	mov    %esi,%r8d
  8037d4:	48 89 c6             	mov    %rax,%rsi
  8037d7:	bf 00 00 00 00       	mov    $0x0,%edi
  8037dc:	48 b8 dc 18 80 00 00 	movabs $0x8018dc,%rax
  8037e3:	00 00 00 
  8037e6:	ff d0                	callq  *%rax
  8037e8:	48 98                	cltq   
  8037ea:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8037ee:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8037f3:	79 06                	jns    8037fb <copy_shared_pages+0xf0>
  8037f5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8037f9:	eb 28                	jmp    803823 <copy_shared_pages+0x118>
  8037fb:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803800:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803804:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  803808:	0f 8c 74 ff ff ff    	jl     803782 <copy_shared_pages+0x77>
  80380e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803812:	48 3d ff 07 00 08    	cmp    $0x80007ff,%rax
  803818:	0f 86 05 ff ff ff    	jbe    803723 <copy_shared_pages+0x18>
  80381e:	b8 00 00 00 00       	mov    $0x0,%eax
  803823:	c9                   	leaveq 
  803824:	c3                   	retq   

0000000000803825 <fd2sockid>:
  803825:	55                   	push   %rbp
  803826:	48 89 e5             	mov    %rsp,%rbp
  803829:	48 83 ec 20          	sub    $0x20,%rsp
  80382d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803830:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803834:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803837:	48 89 d6             	mov    %rdx,%rsi
  80383a:	89 c7                	mov    %eax,%edi
  80383c:	48 b8 6c 1d 80 00 00 	movabs $0x801d6c,%rax
  803843:	00 00 00 
  803846:	ff d0                	callq  *%rax
  803848:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80384b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80384f:	79 05                	jns    803856 <fd2sockid+0x31>
  803851:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803854:	eb 24                	jmp    80387a <fd2sockid+0x55>
  803856:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80385a:	8b 10                	mov    (%rax),%edx
  80385c:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803863:	00 00 00 
  803866:	8b 00                	mov    (%rax),%eax
  803868:	39 c2                	cmp    %eax,%edx
  80386a:	74 07                	je     803873 <fd2sockid+0x4e>
  80386c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803871:	eb 07                	jmp    80387a <fd2sockid+0x55>
  803873:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803877:	8b 40 0c             	mov    0xc(%rax),%eax
  80387a:	c9                   	leaveq 
  80387b:	c3                   	retq   

000000000080387c <alloc_sockfd>:
  80387c:	55                   	push   %rbp
  80387d:	48 89 e5             	mov    %rsp,%rbp
  803880:	48 83 ec 20          	sub    $0x20,%rsp
  803884:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803887:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80388b:	48 89 c7             	mov    %rax,%rdi
  80388e:	48 b8 d4 1c 80 00 00 	movabs $0x801cd4,%rax
  803895:	00 00 00 
  803898:	ff d0                	callq  *%rax
  80389a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80389d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038a1:	78 26                	js     8038c9 <alloc_sockfd+0x4d>
  8038a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038a7:	ba 07 04 00 00       	mov    $0x407,%edx
  8038ac:	48 89 c6             	mov    %rax,%rsi
  8038af:	bf 00 00 00 00       	mov    $0x0,%edi
  8038b4:	48 b8 8a 18 80 00 00 	movabs $0x80188a,%rax
  8038bb:	00 00 00 
  8038be:	ff d0                	callq  *%rax
  8038c0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038c3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038c7:	79 16                	jns    8038df <alloc_sockfd+0x63>
  8038c9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038cc:	89 c7                	mov    %eax,%edi
  8038ce:	48 b8 8b 3d 80 00 00 	movabs $0x803d8b,%rax
  8038d5:	00 00 00 
  8038d8:	ff d0                	callq  *%rax
  8038da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038dd:	eb 3a                	jmp    803919 <alloc_sockfd+0x9d>
  8038df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038e3:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  8038ea:	00 00 00 
  8038ed:	8b 12                	mov    (%rdx),%edx
  8038ef:	89 10                	mov    %edx,(%rax)
  8038f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038f5:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8038fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803900:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803903:	89 50 0c             	mov    %edx,0xc(%rax)
  803906:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80390a:	48 89 c7             	mov    %rax,%rdi
  80390d:	48 b8 86 1c 80 00 00 	movabs $0x801c86,%rax
  803914:	00 00 00 
  803917:	ff d0                	callq  *%rax
  803919:	c9                   	leaveq 
  80391a:	c3                   	retq   

000000000080391b <accept>:
  80391b:	55                   	push   %rbp
  80391c:	48 89 e5             	mov    %rsp,%rbp
  80391f:	48 83 ec 30          	sub    $0x30,%rsp
  803923:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803926:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80392a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80392e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803931:	89 c7                	mov    %eax,%edi
  803933:	48 b8 25 38 80 00 00 	movabs $0x803825,%rax
  80393a:	00 00 00 
  80393d:	ff d0                	callq  *%rax
  80393f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803942:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803946:	79 05                	jns    80394d <accept+0x32>
  803948:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80394b:	eb 3b                	jmp    803988 <accept+0x6d>
  80394d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803951:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803955:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803958:	48 89 ce             	mov    %rcx,%rsi
  80395b:	89 c7                	mov    %eax,%edi
  80395d:	48 b8 68 3c 80 00 00 	movabs $0x803c68,%rax
  803964:	00 00 00 
  803967:	ff d0                	callq  *%rax
  803969:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80396c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803970:	79 05                	jns    803977 <accept+0x5c>
  803972:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803975:	eb 11                	jmp    803988 <accept+0x6d>
  803977:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80397a:	89 c7                	mov    %eax,%edi
  80397c:	48 b8 7c 38 80 00 00 	movabs $0x80387c,%rax
  803983:	00 00 00 
  803986:	ff d0                	callq  *%rax
  803988:	c9                   	leaveq 
  803989:	c3                   	retq   

000000000080398a <bind>:
  80398a:	55                   	push   %rbp
  80398b:	48 89 e5             	mov    %rsp,%rbp
  80398e:	48 83 ec 20          	sub    $0x20,%rsp
  803992:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803995:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803999:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80399c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80399f:	89 c7                	mov    %eax,%edi
  8039a1:	48 b8 25 38 80 00 00 	movabs $0x803825,%rax
  8039a8:	00 00 00 
  8039ab:	ff d0                	callq  *%rax
  8039ad:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039b0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039b4:	79 05                	jns    8039bb <bind+0x31>
  8039b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039b9:	eb 1b                	jmp    8039d6 <bind+0x4c>
  8039bb:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8039be:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8039c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039c5:	48 89 ce             	mov    %rcx,%rsi
  8039c8:	89 c7                	mov    %eax,%edi
  8039ca:	48 b8 e7 3c 80 00 00 	movabs $0x803ce7,%rax
  8039d1:	00 00 00 
  8039d4:	ff d0                	callq  *%rax
  8039d6:	c9                   	leaveq 
  8039d7:	c3                   	retq   

00000000008039d8 <shutdown>:
  8039d8:	55                   	push   %rbp
  8039d9:	48 89 e5             	mov    %rsp,%rbp
  8039dc:	48 83 ec 20          	sub    $0x20,%rsp
  8039e0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8039e3:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8039e6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039e9:	89 c7                	mov    %eax,%edi
  8039eb:	48 b8 25 38 80 00 00 	movabs $0x803825,%rax
  8039f2:	00 00 00 
  8039f5:	ff d0                	callq  *%rax
  8039f7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039fa:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039fe:	79 05                	jns    803a05 <shutdown+0x2d>
  803a00:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a03:	eb 16                	jmp    803a1b <shutdown+0x43>
  803a05:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803a08:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a0b:	89 d6                	mov    %edx,%esi
  803a0d:	89 c7                	mov    %eax,%edi
  803a0f:	48 b8 4b 3d 80 00 00 	movabs $0x803d4b,%rax
  803a16:	00 00 00 
  803a19:	ff d0                	callq  *%rax
  803a1b:	c9                   	leaveq 
  803a1c:	c3                   	retq   

0000000000803a1d <devsock_close>:
  803a1d:	55                   	push   %rbp
  803a1e:	48 89 e5             	mov    %rsp,%rbp
  803a21:	48 83 ec 10          	sub    $0x10,%rsp
  803a25:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803a29:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a2d:	48 89 c7             	mov    %rax,%rdi
  803a30:	48 b8 dc 4a 80 00 00 	movabs $0x804adc,%rax
  803a37:	00 00 00 
  803a3a:	ff d0                	callq  *%rax
  803a3c:	83 f8 01             	cmp    $0x1,%eax
  803a3f:	75 17                	jne    803a58 <devsock_close+0x3b>
  803a41:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a45:	8b 40 0c             	mov    0xc(%rax),%eax
  803a48:	89 c7                	mov    %eax,%edi
  803a4a:	48 b8 8b 3d 80 00 00 	movabs $0x803d8b,%rax
  803a51:	00 00 00 
  803a54:	ff d0                	callq  *%rax
  803a56:	eb 05                	jmp    803a5d <devsock_close+0x40>
  803a58:	b8 00 00 00 00       	mov    $0x0,%eax
  803a5d:	c9                   	leaveq 
  803a5e:	c3                   	retq   

0000000000803a5f <connect>:
  803a5f:	55                   	push   %rbp
  803a60:	48 89 e5             	mov    %rsp,%rbp
  803a63:	48 83 ec 20          	sub    $0x20,%rsp
  803a67:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a6a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a6e:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803a71:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a74:	89 c7                	mov    %eax,%edi
  803a76:	48 b8 25 38 80 00 00 	movabs $0x803825,%rax
  803a7d:	00 00 00 
  803a80:	ff d0                	callq  *%rax
  803a82:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a85:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a89:	79 05                	jns    803a90 <connect+0x31>
  803a8b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a8e:	eb 1b                	jmp    803aab <connect+0x4c>
  803a90:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803a93:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803a97:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a9a:	48 89 ce             	mov    %rcx,%rsi
  803a9d:	89 c7                	mov    %eax,%edi
  803a9f:	48 b8 b8 3d 80 00 00 	movabs $0x803db8,%rax
  803aa6:	00 00 00 
  803aa9:	ff d0                	callq  *%rax
  803aab:	c9                   	leaveq 
  803aac:	c3                   	retq   

0000000000803aad <listen>:
  803aad:	55                   	push   %rbp
  803aae:	48 89 e5             	mov    %rsp,%rbp
  803ab1:	48 83 ec 20          	sub    $0x20,%rsp
  803ab5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ab8:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803abb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803abe:	89 c7                	mov    %eax,%edi
  803ac0:	48 b8 25 38 80 00 00 	movabs $0x803825,%rax
  803ac7:	00 00 00 
  803aca:	ff d0                	callq  *%rax
  803acc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803acf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ad3:	79 05                	jns    803ada <listen+0x2d>
  803ad5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ad8:	eb 16                	jmp    803af0 <listen+0x43>
  803ada:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803add:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ae0:	89 d6                	mov    %edx,%esi
  803ae2:	89 c7                	mov    %eax,%edi
  803ae4:	48 b8 1c 3e 80 00 00 	movabs $0x803e1c,%rax
  803aeb:	00 00 00 
  803aee:	ff d0                	callq  *%rax
  803af0:	c9                   	leaveq 
  803af1:	c3                   	retq   

0000000000803af2 <devsock_read>:
  803af2:	55                   	push   %rbp
  803af3:	48 89 e5             	mov    %rsp,%rbp
  803af6:	48 83 ec 20          	sub    $0x20,%rsp
  803afa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803afe:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803b02:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803b06:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b0a:	89 c2                	mov    %eax,%edx
  803b0c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b10:	8b 40 0c             	mov    0xc(%rax),%eax
  803b13:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803b17:	b9 00 00 00 00       	mov    $0x0,%ecx
  803b1c:	89 c7                	mov    %eax,%edi
  803b1e:	48 b8 5c 3e 80 00 00 	movabs $0x803e5c,%rax
  803b25:	00 00 00 
  803b28:	ff d0                	callq  *%rax
  803b2a:	c9                   	leaveq 
  803b2b:	c3                   	retq   

0000000000803b2c <devsock_write>:
  803b2c:	55                   	push   %rbp
  803b2d:	48 89 e5             	mov    %rsp,%rbp
  803b30:	48 83 ec 20          	sub    $0x20,%rsp
  803b34:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b38:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803b3c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803b40:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b44:	89 c2                	mov    %eax,%edx
  803b46:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b4a:	8b 40 0c             	mov    0xc(%rax),%eax
  803b4d:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803b51:	b9 00 00 00 00       	mov    $0x0,%ecx
  803b56:	89 c7                	mov    %eax,%edi
  803b58:	48 b8 28 3f 80 00 00 	movabs $0x803f28,%rax
  803b5f:	00 00 00 
  803b62:	ff d0                	callq  *%rax
  803b64:	c9                   	leaveq 
  803b65:	c3                   	retq   

0000000000803b66 <devsock_stat>:
  803b66:	55                   	push   %rbp
  803b67:	48 89 e5             	mov    %rsp,%rbp
  803b6a:	48 83 ec 10          	sub    $0x10,%rsp
  803b6e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b72:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803b76:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b7a:	48 be f5 52 80 00 00 	movabs $0x8052f5,%rsi
  803b81:	00 00 00 
  803b84:	48 89 c7             	mov    %rax,%rdi
  803b87:	48 b8 5a 0f 80 00 00 	movabs $0x800f5a,%rax
  803b8e:	00 00 00 
  803b91:	ff d0                	callq  *%rax
  803b93:	b8 00 00 00 00       	mov    $0x0,%eax
  803b98:	c9                   	leaveq 
  803b99:	c3                   	retq   

0000000000803b9a <socket>:
  803b9a:	55                   	push   %rbp
  803b9b:	48 89 e5             	mov    %rsp,%rbp
  803b9e:	48 83 ec 20          	sub    $0x20,%rsp
  803ba2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ba5:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803ba8:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803bab:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803bae:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803bb1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bb4:	89 ce                	mov    %ecx,%esi
  803bb6:	89 c7                	mov    %eax,%edi
  803bb8:	48 b8 e0 3f 80 00 00 	movabs $0x803fe0,%rax
  803bbf:	00 00 00 
  803bc2:	ff d0                	callq  *%rax
  803bc4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bc7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bcb:	79 05                	jns    803bd2 <socket+0x38>
  803bcd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bd0:	eb 11                	jmp    803be3 <socket+0x49>
  803bd2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bd5:	89 c7                	mov    %eax,%edi
  803bd7:	48 b8 7c 38 80 00 00 	movabs $0x80387c,%rax
  803bde:	00 00 00 
  803be1:	ff d0                	callq  *%rax
  803be3:	c9                   	leaveq 
  803be4:	c3                   	retq   

0000000000803be5 <nsipc>:
  803be5:	55                   	push   %rbp
  803be6:	48 89 e5             	mov    %rsp,%rbp
  803be9:	48 83 ec 10          	sub    $0x10,%rsp
  803bed:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803bf0:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803bf7:	00 00 00 
  803bfa:	8b 00                	mov    (%rax),%eax
  803bfc:	85 c0                	test   %eax,%eax
  803bfe:	75 1f                	jne    803c1f <nsipc+0x3a>
  803c00:	bf 02 00 00 00       	mov    $0x2,%edi
  803c05:	48 b8 6b 4a 80 00 00 	movabs $0x804a6b,%rax
  803c0c:	00 00 00 
  803c0f:	ff d0                	callq  *%rax
  803c11:	89 c2                	mov    %eax,%edx
  803c13:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803c1a:	00 00 00 
  803c1d:	89 10                	mov    %edx,(%rax)
  803c1f:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803c26:	00 00 00 
  803c29:	8b 00                	mov    (%rax),%eax
  803c2b:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803c2e:	b9 07 00 00 00       	mov    $0x7,%ecx
  803c33:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803c3a:	00 00 00 
  803c3d:	89 c7                	mov    %eax,%edi
  803c3f:	48 b8 61 49 80 00 00 	movabs $0x804961,%rax
  803c46:	00 00 00 
  803c49:	ff d0                	callq  *%rax
  803c4b:	ba 00 00 00 00       	mov    $0x0,%edx
  803c50:	be 00 00 00 00       	mov    $0x0,%esi
  803c55:	bf 00 00 00 00       	mov    $0x0,%edi
  803c5a:	48 b8 a0 48 80 00 00 	movabs $0x8048a0,%rax
  803c61:	00 00 00 
  803c64:	ff d0                	callq  *%rax
  803c66:	c9                   	leaveq 
  803c67:	c3                   	retq   

0000000000803c68 <nsipc_accept>:
  803c68:	55                   	push   %rbp
  803c69:	48 89 e5             	mov    %rsp,%rbp
  803c6c:	48 83 ec 30          	sub    $0x30,%rsp
  803c70:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c73:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c77:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803c7b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c82:	00 00 00 
  803c85:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803c88:	89 10                	mov    %edx,(%rax)
  803c8a:	bf 01 00 00 00       	mov    $0x1,%edi
  803c8f:	48 b8 e5 3b 80 00 00 	movabs $0x803be5,%rax
  803c96:	00 00 00 
  803c99:	ff d0                	callq  *%rax
  803c9b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c9e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ca2:	78 3e                	js     803ce2 <nsipc_accept+0x7a>
  803ca4:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cab:	00 00 00 
  803cae:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803cb2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cb6:	8b 40 10             	mov    0x10(%rax),%eax
  803cb9:	89 c2                	mov    %eax,%edx
  803cbb:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803cbf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803cc3:	48 89 ce             	mov    %rcx,%rsi
  803cc6:	48 89 c7             	mov    %rax,%rdi
  803cc9:	48 b8 7f 12 80 00 00 	movabs $0x80127f,%rax
  803cd0:	00 00 00 
  803cd3:	ff d0                	callq  *%rax
  803cd5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cd9:	8b 50 10             	mov    0x10(%rax),%edx
  803cdc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ce0:	89 10                	mov    %edx,(%rax)
  803ce2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ce5:	c9                   	leaveq 
  803ce6:	c3                   	retq   

0000000000803ce7 <nsipc_bind>:
  803ce7:	55                   	push   %rbp
  803ce8:	48 89 e5             	mov    %rsp,%rbp
  803ceb:	48 83 ec 10          	sub    $0x10,%rsp
  803cef:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803cf2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803cf6:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803cf9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d00:	00 00 00 
  803d03:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d06:	89 10                	mov    %edx,(%rax)
  803d08:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d0b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d0f:	48 89 c6             	mov    %rax,%rsi
  803d12:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803d19:	00 00 00 
  803d1c:	48 b8 7f 12 80 00 00 	movabs $0x80127f,%rax
  803d23:	00 00 00 
  803d26:	ff d0                	callq  *%rax
  803d28:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d2f:	00 00 00 
  803d32:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d35:	89 50 14             	mov    %edx,0x14(%rax)
  803d38:	bf 02 00 00 00       	mov    $0x2,%edi
  803d3d:	48 b8 e5 3b 80 00 00 	movabs $0x803be5,%rax
  803d44:	00 00 00 
  803d47:	ff d0                	callq  *%rax
  803d49:	c9                   	leaveq 
  803d4a:	c3                   	retq   

0000000000803d4b <nsipc_shutdown>:
  803d4b:	55                   	push   %rbp
  803d4c:	48 89 e5             	mov    %rsp,%rbp
  803d4f:	48 83 ec 10          	sub    $0x10,%rsp
  803d53:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d56:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803d59:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d60:	00 00 00 
  803d63:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d66:	89 10                	mov    %edx,(%rax)
  803d68:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d6f:	00 00 00 
  803d72:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d75:	89 50 04             	mov    %edx,0x4(%rax)
  803d78:	bf 03 00 00 00       	mov    $0x3,%edi
  803d7d:	48 b8 e5 3b 80 00 00 	movabs $0x803be5,%rax
  803d84:	00 00 00 
  803d87:	ff d0                	callq  *%rax
  803d89:	c9                   	leaveq 
  803d8a:	c3                   	retq   

0000000000803d8b <nsipc_close>:
  803d8b:	55                   	push   %rbp
  803d8c:	48 89 e5             	mov    %rsp,%rbp
  803d8f:	48 83 ec 10          	sub    $0x10,%rsp
  803d93:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d96:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d9d:	00 00 00 
  803da0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803da3:	89 10                	mov    %edx,(%rax)
  803da5:	bf 04 00 00 00       	mov    $0x4,%edi
  803daa:	48 b8 e5 3b 80 00 00 	movabs $0x803be5,%rax
  803db1:	00 00 00 
  803db4:	ff d0                	callq  *%rax
  803db6:	c9                   	leaveq 
  803db7:	c3                   	retq   

0000000000803db8 <nsipc_connect>:
  803db8:	55                   	push   %rbp
  803db9:	48 89 e5             	mov    %rsp,%rbp
  803dbc:	48 83 ec 10          	sub    $0x10,%rsp
  803dc0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803dc3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803dc7:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803dca:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803dd1:	00 00 00 
  803dd4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803dd7:	89 10                	mov    %edx,(%rax)
  803dd9:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ddc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803de0:	48 89 c6             	mov    %rax,%rsi
  803de3:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803dea:	00 00 00 
  803ded:	48 b8 7f 12 80 00 00 	movabs $0x80127f,%rax
  803df4:	00 00 00 
  803df7:	ff d0                	callq  *%rax
  803df9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e00:	00 00 00 
  803e03:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e06:	89 50 14             	mov    %edx,0x14(%rax)
  803e09:	bf 05 00 00 00       	mov    $0x5,%edi
  803e0e:	48 b8 e5 3b 80 00 00 	movabs $0x803be5,%rax
  803e15:	00 00 00 
  803e18:	ff d0                	callq  *%rax
  803e1a:	c9                   	leaveq 
  803e1b:	c3                   	retq   

0000000000803e1c <nsipc_listen>:
  803e1c:	55                   	push   %rbp
  803e1d:	48 89 e5             	mov    %rsp,%rbp
  803e20:	48 83 ec 10          	sub    $0x10,%rsp
  803e24:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e27:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803e2a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e31:	00 00 00 
  803e34:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803e37:	89 10                	mov    %edx,(%rax)
  803e39:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e40:	00 00 00 
  803e43:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e46:	89 50 04             	mov    %edx,0x4(%rax)
  803e49:	bf 06 00 00 00       	mov    $0x6,%edi
  803e4e:	48 b8 e5 3b 80 00 00 	movabs $0x803be5,%rax
  803e55:	00 00 00 
  803e58:	ff d0                	callq  *%rax
  803e5a:	c9                   	leaveq 
  803e5b:	c3                   	retq   

0000000000803e5c <nsipc_recv>:
  803e5c:	55                   	push   %rbp
  803e5d:	48 89 e5             	mov    %rsp,%rbp
  803e60:	48 83 ec 30          	sub    $0x30,%rsp
  803e64:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e67:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803e6b:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803e6e:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803e71:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e78:	00 00 00 
  803e7b:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803e7e:	89 10                	mov    %edx,(%rax)
  803e80:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e87:	00 00 00 
  803e8a:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803e8d:	89 50 04             	mov    %edx,0x4(%rax)
  803e90:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e97:	00 00 00 
  803e9a:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803e9d:	89 50 08             	mov    %edx,0x8(%rax)
  803ea0:	bf 07 00 00 00       	mov    $0x7,%edi
  803ea5:	48 b8 e5 3b 80 00 00 	movabs $0x803be5,%rax
  803eac:	00 00 00 
  803eaf:	ff d0                	callq  *%rax
  803eb1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803eb4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803eb8:	78 69                	js     803f23 <nsipc_recv+0xc7>
  803eba:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803ec1:	7f 08                	jg     803ecb <nsipc_recv+0x6f>
  803ec3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ec6:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803ec9:	7e 35                	jle    803f00 <nsipc_recv+0xa4>
  803ecb:	48 b9 fc 52 80 00 00 	movabs $0x8052fc,%rcx
  803ed2:	00 00 00 
  803ed5:	48 ba 11 53 80 00 00 	movabs $0x805311,%rdx
  803edc:	00 00 00 
  803edf:	be 62 00 00 00       	mov    $0x62,%esi
  803ee4:	48 bf 26 53 80 00 00 	movabs $0x805326,%rdi
  803eeb:	00 00 00 
  803eee:	b8 00 00 00 00       	mov    $0x0,%eax
  803ef3:	49 b8 90 01 80 00 00 	movabs $0x800190,%r8
  803efa:	00 00 00 
  803efd:	41 ff d0             	callq  *%r8
  803f00:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f03:	48 63 d0             	movslq %eax,%rdx
  803f06:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f0a:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803f11:	00 00 00 
  803f14:	48 89 c7             	mov    %rax,%rdi
  803f17:	48 b8 7f 12 80 00 00 	movabs $0x80127f,%rax
  803f1e:	00 00 00 
  803f21:	ff d0                	callq  *%rax
  803f23:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f26:	c9                   	leaveq 
  803f27:	c3                   	retq   

0000000000803f28 <nsipc_send>:
  803f28:	55                   	push   %rbp
  803f29:	48 89 e5             	mov    %rsp,%rbp
  803f2c:	48 83 ec 20          	sub    $0x20,%rsp
  803f30:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f33:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803f37:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803f3a:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803f3d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f44:	00 00 00 
  803f47:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803f4a:	89 10                	mov    %edx,(%rax)
  803f4c:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803f53:	7e 35                	jle    803f8a <nsipc_send+0x62>
  803f55:	48 b9 35 53 80 00 00 	movabs $0x805335,%rcx
  803f5c:	00 00 00 
  803f5f:	48 ba 11 53 80 00 00 	movabs $0x805311,%rdx
  803f66:	00 00 00 
  803f69:	be 6d 00 00 00       	mov    $0x6d,%esi
  803f6e:	48 bf 26 53 80 00 00 	movabs $0x805326,%rdi
  803f75:	00 00 00 
  803f78:	b8 00 00 00 00       	mov    $0x0,%eax
  803f7d:	49 b8 90 01 80 00 00 	movabs $0x800190,%r8
  803f84:	00 00 00 
  803f87:	41 ff d0             	callq  *%r8
  803f8a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f8d:	48 63 d0             	movslq %eax,%rdx
  803f90:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f94:	48 89 c6             	mov    %rax,%rsi
  803f97:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803f9e:	00 00 00 
  803fa1:	48 b8 7f 12 80 00 00 	movabs $0x80127f,%rax
  803fa8:	00 00 00 
  803fab:	ff d0                	callq  *%rax
  803fad:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fb4:	00 00 00 
  803fb7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803fba:	89 50 04             	mov    %edx,0x4(%rax)
  803fbd:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fc4:	00 00 00 
  803fc7:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803fca:	89 50 08             	mov    %edx,0x8(%rax)
  803fcd:	bf 08 00 00 00       	mov    $0x8,%edi
  803fd2:	48 b8 e5 3b 80 00 00 	movabs $0x803be5,%rax
  803fd9:	00 00 00 
  803fdc:	ff d0                	callq  *%rax
  803fde:	c9                   	leaveq 
  803fdf:	c3                   	retq   

0000000000803fe0 <nsipc_socket>:
  803fe0:	55                   	push   %rbp
  803fe1:	48 89 e5             	mov    %rsp,%rbp
  803fe4:	48 83 ec 10          	sub    $0x10,%rsp
  803fe8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803feb:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803fee:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803ff1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ff8:	00 00 00 
  803ffb:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ffe:	89 10                	mov    %edx,(%rax)
  804000:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804007:	00 00 00 
  80400a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80400d:	89 50 04             	mov    %edx,0x4(%rax)
  804010:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804017:	00 00 00 
  80401a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80401d:	89 50 08             	mov    %edx,0x8(%rax)
  804020:	bf 09 00 00 00       	mov    $0x9,%edi
  804025:	48 b8 e5 3b 80 00 00 	movabs $0x803be5,%rax
  80402c:	00 00 00 
  80402f:	ff d0                	callq  *%rax
  804031:	c9                   	leaveq 
  804032:	c3                   	retq   

0000000000804033 <pipe>:
  804033:	55                   	push   %rbp
  804034:	48 89 e5             	mov    %rsp,%rbp
  804037:	53                   	push   %rbx
  804038:	48 83 ec 38          	sub    $0x38,%rsp
  80403c:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  804040:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  804044:	48 89 c7             	mov    %rax,%rdi
  804047:	48 b8 d4 1c 80 00 00 	movabs $0x801cd4,%rax
  80404e:	00 00 00 
  804051:	ff d0                	callq  *%rax
  804053:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804056:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80405a:	0f 88 bf 01 00 00    	js     80421f <pipe+0x1ec>
  804060:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804064:	ba 07 04 00 00       	mov    $0x407,%edx
  804069:	48 89 c6             	mov    %rax,%rsi
  80406c:	bf 00 00 00 00       	mov    $0x0,%edi
  804071:	48 b8 8a 18 80 00 00 	movabs $0x80188a,%rax
  804078:	00 00 00 
  80407b:	ff d0                	callq  *%rax
  80407d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804080:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804084:	0f 88 95 01 00 00    	js     80421f <pipe+0x1ec>
  80408a:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80408e:	48 89 c7             	mov    %rax,%rdi
  804091:	48 b8 d4 1c 80 00 00 	movabs $0x801cd4,%rax
  804098:	00 00 00 
  80409b:	ff d0                	callq  *%rax
  80409d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8040a0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8040a4:	0f 88 5d 01 00 00    	js     804207 <pipe+0x1d4>
  8040aa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8040ae:	ba 07 04 00 00       	mov    $0x407,%edx
  8040b3:	48 89 c6             	mov    %rax,%rsi
  8040b6:	bf 00 00 00 00       	mov    $0x0,%edi
  8040bb:	48 b8 8a 18 80 00 00 	movabs $0x80188a,%rax
  8040c2:	00 00 00 
  8040c5:	ff d0                	callq  *%rax
  8040c7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8040ca:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8040ce:	0f 88 33 01 00 00    	js     804207 <pipe+0x1d4>
  8040d4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8040d8:	48 89 c7             	mov    %rax,%rdi
  8040db:	48 b8 a9 1c 80 00 00 	movabs $0x801ca9,%rax
  8040e2:	00 00 00 
  8040e5:	ff d0                	callq  *%rax
  8040e7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8040eb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8040ef:	ba 07 04 00 00       	mov    $0x407,%edx
  8040f4:	48 89 c6             	mov    %rax,%rsi
  8040f7:	bf 00 00 00 00       	mov    $0x0,%edi
  8040fc:	48 b8 8a 18 80 00 00 	movabs $0x80188a,%rax
  804103:	00 00 00 
  804106:	ff d0                	callq  *%rax
  804108:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80410b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80410f:	0f 88 d9 00 00 00    	js     8041ee <pipe+0x1bb>
  804115:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804119:	48 89 c7             	mov    %rax,%rdi
  80411c:	48 b8 a9 1c 80 00 00 	movabs $0x801ca9,%rax
  804123:	00 00 00 
  804126:	ff d0                	callq  *%rax
  804128:	48 89 c2             	mov    %rax,%rdx
  80412b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80412f:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  804135:	48 89 d1             	mov    %rdx,%rcx
  804138:	ba 00 00 00 00       	mov    $0x0,%edx
  80413d:	48 89 c6             	mov    %rax,%rsi
  804140:	bf 00 00 00 00       	mov    $0x0,%edi
  804145:	48 b8 dc 18 80 00 00 	movabs $0x8018dc,%rax
  80414c:	00 00 00 
  80414f:	ff d0                	callq  *%rax
  804151:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804154:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804158:	78 79                	js     8041d3 <pipe+0x1a0>
  80415a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80415e:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804165:	00 00 00 
  804168:	8b 12                	mov    (%rdx),%edx
  80416a:	89 10                	mov    %edx,(%rax)
  80416c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804170:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  804177:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80417b:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804182:	00 00 00 
  804185:	8b 12                	mov    (%rdx),%edx
  804187:	89 10                	mov    %edx,(%rax)
  804189:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80418d:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  804194:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804198:	48 89 c7             	mov    %rax,%rdi
  80419b:	48 b8 86 1c 80 00 00 	movabs $0x801c86,%rax
  8041a2:	00 00 00 
  8041a5:	ff d0                	callq  *%rax
  8041a7:	89 c2                	mov    %eax,%edx
  8041a9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8041ad:	89 10                	mov    %edx,(%rax)
  8041af:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8041b3:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8041b7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041bb:	48 89 c7             	mov    %rax,%rdi
  8041be:	48 b8 86 1c 80 00 00 	movabs $0x801c86,%rax
  8041c5:	00 00 00 
  8041c8:	ff d0                	callq  *%rax
  8041ca:	89 03                	mov    %eax,(%rbx)
  8041cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8041d1:	eb 4f                	jmp    804222 <pipe+0x1ef>
  8041d3:	90                   	nop
  8041d4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8041d8:	48 89 c6             	mov    %rax,%rsi
  8041db:	bf 00 00 00 00       	mov    $0x0,%edi
  8041e0:	48 b8 3c 19 80 00 00 	movabs $0x80193c,%rax
  8041e7:	00 00 00 
  8041ea:	ff d0                	callq  *%rax
  8041ec:	eb 01                	jmp    8041ef <pipe+0x1bc>
  8041ee:	90                   	nop
  8041ef:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041f3:	48 89 c6             	mov    %rax,%rsi
  8041f6:	bf 00 00 00 00       	mov    $0x0,%edi
  8041fb:	48 b8 3c 19 80 00 00 	movabs $0x80193c,%rax
  804202:	00 00 00 
  804205:	ff d0                	callq  *%rax
  804207:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80420b:	48 89 c6             	mov    %rax,%rsi
  80420e:	bf 00 00 00 00       	mov    $0x0,%edi
  804213:	48 b8 3c 19 80 00 00 	movabs $0x80193c,%rax
  80421a:	00 00 00 
  80421d:	ff d0                	callq  *%rax
  80421f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804222:	48 83 c4 38          	add    $0x38,%rsp
  804226:	5b                   	pop    %rbx
  804227:	5d                   	pop    %rbp
  804228:	c3                   	retq   

0000000000804229 <_pipeisclosed>:
  804229:	55                   	push   %rbp
  80422a:	48 89 e5             	mov    %rsp,%rbp
  80422d:	53                   	push   %rbx
  80422e:	48 83 ec 28          	sub    $0x28,%rsp
  804232:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804236:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80423a:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804241:	00 00 00 
  804244:	48 8b 00             	mov    (%rax),%rax
  804247:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  80424d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804250:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804254:	48 89 c7             	mov    %rax,%rdi
  804257:	48 b8 dc 4a 80 00 00 	movabs $0x804adc,%rax
  80425e:	00 00 00 
  804261:	ff d0                	callq  *%rax
  804263:	89 c3                	mov    %eax,%ebx
  804265:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804269:	48 89 c7             	mov    %rax,%rdi
  80426c:	48 b8 dc 4a 80 00 00 	movabs $0x804adc,%rax
  804273:	00 00 00 
  804276:	ff d0                	callq  *%rax
  804278:	39 c3                	cmp    %eax,%ebx
  80427a:	0f 94 c0             	sete   %al
  80427d:	0f b6 c0             	movzbl %al,%eax
  804280:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804283:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80428a:	00 00 00 
  80428d:	48 8b 00             	mov    (%rax),%rax
  804290:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  804296:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804299:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80429c:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80429f:	75 05                	jne    8042a6 <_pipeisclosed+0x7d>
  8042a1:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8042a4:	eb 4a                	jmp    8042f0 <_pipeisclosed+0xc7>
  8042a6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8042a9:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8042ac:	74 8c                	je     80423a <_pipeisclosed+0x11>
  8042ae:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  8042b2:	75 86                	jne    80423a <_pipeisclosed+0x11>
  8042b4:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8042bb:	00 00 00 
  8042be:	48 8b 00             	mov    (%rax),%rax
  8042c1:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8042c7:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8042ca:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8042cd:	89 c6                	mov    %eax,%esi
  8042cf:	48 bf 46 53 80 00 00 	movabs $0x805346,%rdi
  8042d6:	00 00 00 
  8042d9:	b8 00 00 00 00       	mov    $0x0,%eax
  8042de:	49 b8 ca 03 80 00 00 	movabs $0x8003ca,%r8
  8042e5:	00 00 00 
  8042e8:	41 ff d0             	callq  *%r8
  8042eb:	e9 4a ff ff ff       	jmpq   80423a <_pipeisclosed+0x11>
  8042f0:	48 83 c4 28          	add    $0x28,%rsp
  8042f4:	5b                   	pop    %rbx
  8042f5:	5d                   	pop    %rbp
  8042f6:	c3                   	retq   

00000000008042f7 <pipeisclosed>:
  8042f7:	55                   	push   %rbp
  8042f8:	48 89 e5             	mov    %rsp,%rbp
  8042fb:	48 83 ec 30          	sub    $0x30,%rsp
  8042ff:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804302:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  804306:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804309:	48 89 d6             	mov    %rdx,%rsi
  80430c:	89 c7                	mov    %eax,%edi
  80430e:	48 b8 6c 1d 80 00 00 	movabs $0x801d6c,%rax
  804315:	00 00 00 
  804318:	ff d0                	callq  *%rax
  80431a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80431d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804321:	79 05                	jns    804328 <pipeisclosed+0x31>
  804323:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804326:	eb 31                	jmp    804359 <pipeisclosed+0x62>
  804328:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80432c:	48 89 c7             	mov    %rax,%rdi
  80432f:	48 b8 a9 1c 80 00 00 	movabs $0x801ca9,%rax
  804336:	00 00 00 
  804339:	ff d0                	callq  *%rax
  80433b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80433f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804343:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804347:	48 89 d6             	mov    %rdx,%rsi
  80434a:	48 89 c7             	mov    %rax,%rdi
  80434d:	48 b8 29 42 80 00 00 	movabs $0x804229,%rax
  804354:	00 00 00 
  804357:	ff d0                	callq  *%rax
  804359:	c9                   	leaveq 
  80435a:	c3                   	retq   

000000000080435b <devpipe_read>:
  80435b:	55                   	push   %rbp
  80435c:	48 89 e5             	mov    %rsp,%rbp
  80435f:	48 83 ec 40          	sub    $0x40,%rsp
  804363:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804367:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80436b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80436f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804373:	48 89 c7             	mov    %rax,%rdi
  804376:	48 b8 a9 1c 80 00 00 	movabs $0x801ca9,%rax
  80437d:	00 00 00 
  804380:	ff d0                	callq  *%rax
  804382:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804386:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80438a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80438e:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804395:	00 
  804396:	e9 90 00 00 00       	jmpq   80442b <devpipe_read+0xd0>
  80439b:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8043a0:	74 09                	je     8043ab <devpipe_read+0x50>
  8043a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043a6:	e9 8e 00 00 00       	jmpq   804439 <devpipe_read+0xde>
  8043ab:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8043af:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043b3:	48 89 d6             	mov    %rdx,%rsi
  8043b6:	48 89 c7             	mov    %rax,%rdi
  8043b9:	48 b8 29 42 80 00 00 	movabs $0x804229,%rax
  8043c0:	00 00 00 
  8043c3:	ff d0                	callq  *%rax
  8043c5:	85 c0                	test   %eax,%eax
  8043c7:	74 07                	je     8043d0 <devpipe_read+0x75>
  8043c9:	b8 00 00 00 00       	mov    $0x0,%eax
  8043ce:	eb 69                	jmp    804439 <devpipe_read+0xde>
  8043d0:	48 b8 4d 18 80 00 00 	movabs $0x80184d,%rax
  8043d7:	00 00 00 
  8043da:	ff d0                	callq  *%rax
  8043dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043e0:	8b 10                	mov    (%rax),%edx
  8043e2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043e6:	8b 40 04             	mov    0x4(%rax),%eax
  8043e9:	39 c2                	cmp    %eax,%edx
  8043eb:	74 ae                	je     80439b <devpipe_read+0x40>
  8043ed:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8043f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043f5:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8043f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043fd:	8b 00                	mov    (%rax),%eax
  8043ff:	99                   	cltd   
  804400:	c1 ea 1b             	shr    $0x1b,%edx
  804403:	01 d0                	add    %edx,%eax
  804405:	83 e0 1f             	and    $0x1f,%eax
  804408:	29 d0                	sub    %edx,%eax
  80440a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80440e:	48 98                	cltq   
  804410:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804415:	88 01                	mov    %al,(%rcx)
  804417:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80441b:	8b 00                	mov    (%rax),%eax
  80441d:	8d 50 01             	lea    0x1(%rax),%edx
  804420:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804424:	89 10                	mov    %edx,(%rax)
  804426:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80442b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80442f:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804433:	72 a7                	jb     8043dc <devpipe_read+0x81>
  804435:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804439:	c9                   	leaveq 
  80443a:	c3                   	retq   

000000000080443b <devpipe_write>:
  80443b:	55                   	push   %rbp
  80443c:	48 89 e5             	mov    %rsp,%rbp
  80443f:	48 83 ec 40          	sub    $0x40,%rsp
  804443:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804447:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80444b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80444f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804453:	48 89 c7             	mov    %rax,%rdi
  804456:	48 b8 a9 1c 80 00 00 	movabs $0x801ca9,%rax
  80445d:	00 00 00 
  804460:	ff d0                	callq  *%rax
  804462:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804466:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80446a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80446e:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804475:	00 
  804476:	e9 8f 00 00 00       	jmpq   80450a <devpipe_write+0xcf>
  80447b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80447f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804483:	48 89 d6             	mov    %rdx,%rsi
  804486:	48 89 c7             	mov    %rax,%rdi
  804489:	48 b8 29 42 80 00 00 	movabs $0x804229,%rax
  804490:	00 00 00 
  804493:	ff d0                	callq  *%rax
  804495:	85 c0                	test   %eax,%eax
  804497:	74 07                	je     8044a0 <devpipe_write+0x65>
  804499:	b8 00 00 00 00       	mov    $0x0,%eax
  80449e:	eb 78                	jmp    804518 <devpipe_write+0xdd>
  8044a0:	48 b8 4d 18 80 00 00 	movabs $0x80184d,%rax
  8044a7:	00 00 00 
  8044aa:	ff d0                	callq  *%rax
  8044ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044b0:	8b 40 04             	mov    0x4(%rax),%eax
  8044b3:	48 63 d0             	movslq %eax,%rdx
  8044b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044ba:	8b 00                	mov    (%rax),%eax
  8044bc:	48 98                	cltq   
  8044be:	48 83 c0 20          	add    $0x20,%rax
  8044c2:	48 39 c2             	cmp    %rax,%rdx
  8044c5:	73 b4                	jae    80447b <devpipe_write+0x40>
  8044c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044cb:	8b 40 04             	mov    0x4(%rax),%eax
  8044ce:	99                   	cltd   
  8044cf:	c1 ea 1b             	shr    $0x1b,%edx
  8044d2:	01 d0                	add    %edx,%eax
  8044d4:	83 e0 1f             	and    $0x1f,%eax
  8044d7:	29 d0                	sub    %edx,%eax
  8044d9:	89 c6                	mov    %eax,%esi
  8044db:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8044df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044e3:	48 01 d0             	add    %rdx,%rax
  8044e6:	0f b6 08             	movzbl (%rax),%ecx
  8044e9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8044ed:	48 63 c6             	movslq %esi,%rax
  8044f0:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8044f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044f8:	8b 40 04             	mov    0x4(%rax),%eax
  8044fb:	8d 50 01             	lea    0x1(%rax),%edx
  8044fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804502:	89 50 04             	mov    %edx,0x4(%rax)
  804505:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80450a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80450e:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804512:	72 98                	jb     8044ac <devpipe_write+0x71>
  804514:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804518:	c9                   	leaveq 
  804519:	c3                   	retq   

000000000080451a <devpipe_stat>:
  80451a:	55                   	push   %rbp
  80451b:	48 89 e5             	mov    %rsp,%rbp
  80451e:	48 83 ec 20          	sub    $0x20,%rsp
  804522:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804526:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80452a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80452e:	48 89 c7             	mov    %rax,%rdi
  804531:	48 b8 a9 1c 80 00 00 	movabs $0x801ca9,%rax
  804538:	00 00 00 
  80453b:	ff d0                	callq  *%rax
  80453d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804541:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804545:	48 be 59 53 80 00 00 	movabs $0x805359,%rsi
  80454c:	00 00 00 
  80454f:	48 89 c7             	mov    %rax,%rdi
  804552:	48 b8 5a 0f 80 00 00 	movabs $0x800f5a,%rax
  804559:	00 00 00 
  80455c:	ff d0                	callq  *%rax
  80455e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804562:	8b 50 04             	mov    0x4(%rax),%edx
  804565:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804569:	8b 00                	mov    (%rax),%eax
  80456b:	29 c2                	sub    %eax,%edx
  80456d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804571:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804577:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80457b:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804582:	00 00 00 
  804585:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804589:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  804590:	00 00 00 
  804593:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  80459a:	b8 00 00 00 00       	mov    $0x0,%eax
  80459f:	c9                   	leaveq 
  8045a0:	c3                   	retq   

00000000008045a1 <devpipe_close>:
  8045a1:	55                   	push   %rbp
  8045a2:	48 89 e5             	mov    %rsp,%rbp
  8045a5:	48 83 ec 10          	sub    $0x10,%rsp
  8045a9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8045ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045b1:	48 89 c6             	mov    %rax,%rsi
  8045b4:	bf 00 00 00 00       	mov    $0x0,%edi
  8045b9:	48 b8 3c 19 80 00 00 	movabs $0x80193c,%rax
  8045c0:	00 00 00 
  8045c3:	ff d0                	callq  *%rax
  8045c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045c9:	48 89 c7             	mov    %rax,%rdi
  8045cc:	48 b8 a9 1c 80 00 00 	movabs $0x801ca9,%rax
  8045d3:	00 00 00 
  8045d6:	ff d0                	callq  *%rax
  8045d8:	48 89 c6             	mov    %rax,%rsi
  8045db:	bf 00 00 00 00       	mov    $0x0,%edi
  8045e0:	48 b8 3c 19 80 00 00 	movabs $0x80193c,%rax
  8045e7:	00 00 00 
  8045ea:	ff d0                	callq  *%rax
  8045ec:	c9                   	leaveq 
  8045ed:	c3                   	retq   

00000000008045ee <cputchar>:
  8045ee:	55                   	push   %rbp
  8045ef:	48 89 e5             	mov    %rsp,%rbp
  8045f2:	48 83 ec 20          	sub    $0x20,%rsp
  8045f6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8045f9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8045fc:	88 45 ff             	mov    %al,-0x1(%rbp)
  8045ff:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804603:	be 01 00 00 00       	mov    $0x1,%esi
  804608:	48 89 c7             	mov    %rax,%rdi
  80460b:	48 b8 42 17 80 00 00 	movabs $0x801742,%rax
  804612:	00 00 00 
  804615:	ff d0                	callq  *%rax
  804617:	90                   	nop
  804618:	c9                   	leaveq 
  804619:	c3                   	retq   

000000000080461a <getchar>:
  80461a:	55                   	push   %rbp
  80461b:	48 89 e5             	mov    %rsp,%rbp
  80461e:	48 83 ec 10          	sub    $0x10,%rsp
  804622:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804626:	ba 01 00 00 00       	mov    $0x1,%edx
  80462b:	48 89 c6             	mov    %rax,%rsi
  80462e:	bf 00 00 00 00       	mov    $0x0,%edi
  804633:	48 b8 a1 21 80 00 00 	movabs $0x8021a1,%rax
  80463a:	00 00 00 
  80463d:	ff d0                	callq  *%rax
  80463f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804642:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804646:	79 05                	jns    80464d <getchar+0x33>
  804648:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80464b:	eb 14                	jmp    804661 <getchar+0x47>
  80464d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804651:	7f 07                	jg     80465a <getchar+0x40>
  804653:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804658:	eb 07                	jmp    804661 <getchar+0x47>
  80465a:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  80465e:	0f b6 c0             	movzbl %al,%eax
  804661:	c9                   	leaveq 
  804662:	c3                   	retq   

0000000000804663 <iscons>:
  804663:	55                   	push   %rbp
  804664:	48 89 e5             	mov    %rsp,%rbp
  804667:	48 83 ec 20          	sub    $0x20,%rsp
  80466b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80466e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804672:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804675:	48 89 d6             	mov    %rdx,%rsi
  804678:	89 c7                	mov    %eax,%edi
  80467a:	48 b8 6c 1d 80 00 00 	movabs $0x801d6c,%rax
  804681:	00 00 00 
  804684:	ff d0                	callq  *%rax
  804686:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804689:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80468d:	79 05                	jns    804694 <iscons+0x31>
  80468f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804692:	eb 1a                	jmp    8046ae <iscons+0x4b>
  804694:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804698:	8b 10                	mov    (%rax),%edx
  80469a:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  8046a1:	00 00 00 
  8046a4:	8b 00                	mov    (%rax),%eax
  8046a6:	39 c2                	cmp    %eax,%edx
  8046a8:	0f 94 c0             	sete   %al
  8046ab:	0f b6 c0             	movzbl %al,%eax
  8046ae:	c9                   	leaveq 
  8046af:	c3                   	retq   

00000000008046b0 <opencons>:
  8046b0:	55                   	push   %rbp
  8046b1:	48 89 e5             	mov    %rsp,%rbp
  8046b4:	48 83 ec 10          	sub    $0x10,%rsp
  8046b8:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8046bc:	48 89 c7             	mov    %rax,%rdi
  8046bf:	48 b8 d4 1c 80 00 00 	movabs $0x801cd4,%rax
  8046c6:	00 00 00 
  8046c9:	ff d0                	callq  *%rax
  8046cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046ce:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046d2:	79 05                	jns    8046d9 <opencons+0x29>
  8046d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046d7:	eb 5b                	jmp    804734 <opencons+0x84>
  8046d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046dd:	ba 07 04 00 00       	mov    $0x407,%edx
  8046e2:	48 89 c6             	mov    %rax,%rsi
  8046e5:	bf 00 00 00 00       	mov    $0x0,%edi
  8046ea:	48 b8 8a 18 80 00 00 	movabs $0x80188a,%rax
  8046f1:	00 00 00 
  8046f4:	ff d0                	callq  *%rax
  8046f6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046f9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046fd:	79 05                	jns    804704 <opencons+0x54>
  8046ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804702:	eb 30                	jmp    804734 <opencons+0x84>
  804704:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804708:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  80470f:	00 00 00 
  804712:	8b 12                	mov    (%rdx),%edx
  804714:	89 10                	mov    %edx,(%rax)
  804716:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80471a:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804721:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804725:	48 89 c7             	mov    %rax,%rdi
  804728:	48 b8 86 1c 80 00 00 	movabs $0x801c86,%rax
  80472f:	00 00 00 
  804732:	ff d0                	callq  *%rax
  804734:	c9                   	leaveq 
  804735:	c3                   	retq   

0000000000804736 <devcons_read>:
  804736:	55                   	push   %rbp
  804737:	48 89 e5             	mov    %rsp,%rbp
  80473a:	48 83 ec 30          	sub    $0x30,%rsp
  80473e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804742:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804746:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80474a:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80474f:	75 13                	jne    804764 <devcons_read+0x2e>
  804751:	b8 00 00 00 00       	mov    $0x0,%eax
  804756:	eb 49                	jmp    8047a1 <devcons_read+0x6b>
  804758:	48 b8 4d 18 80 00 00 	movabs $0x80184d,%rax
  80475f:	00 00 00 
  804762:	ff d0                	callq  *%rax
  804764:	48 b8 8f 17 80 00 00 	movabs $0x80178f,%rax
  80476b:	00 00 00 
  80476e:	ff d0                	callq  *%rax
  804770:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804773:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804777:	74 df                	je     804758 <devcons_read+0x22>
  804779:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80477d:	79 05                	jns    804784 <devcons_read+0x4e>
  80477f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804782:	eb 1d                	jmp    8047a1 <devcons_read+0x6b>
  804784:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804788:	75 07                	jne    804791 <devcons_read+0x5b>
  80478a:	b8 00 00 00 00       	mov    $0x0,%eax
  80478f:	eb 10                	jmp    8047a1 <devcons_read+0x6b>
  804791:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804794:	89 c2                	mov    %eax,%edx
  804796:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80479a:	88 10                	mov    %dl,(%rax)
  80479c:	b8 01 00 00 00       	mov    $0x1,%eax
  8047a1:	c9                   	leaveq 
  8047a2:	c3                   	retq   

00000000008047a3 <devcons_write>:
  8047a3:	55                   	push   %rbp
  8047a4:	48 89 e5             	mov    %rsp,%rbp
  8047a7:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8047ae:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8047b5:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8047bc:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8047c3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8047ca:	eb 76                	jmp    804842 <devcons_write+0x9f>
  8047cc:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8047d3:	89 c2                	mov    %eax,%edx
  8047d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047d8:	29 c2                	sub    %eax,%edx
  8047da:	89 d0                	mov    %edx,%eax
  8047dc:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8047df:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8047e2:	83 f8 7f             	cmp    $0x7f,%eax
  8047e5:	76 07                	jbe    8047ee <devcons_write+0x4b>
  8047e7:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8047ee:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8047f1:	48 63 d0             	movslq %eax,%rdx
  8047f4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047f7:	48 63 c8             	movslq %eax,%rcx
  8047fa:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804801:	48 01 c1             	add    %rax,%rcx
  804804:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80480b:	48 89 ce             	mov    %rcx,%rsi
  80480e:	48 89 c7             	mov    %rax,%rdi
  804811:	48 b8 7f 12 80 00 00 	movabs $0x80127f,%rax
  804818:	00 00 00 
  80481b:	ff d0                	callq  *%rax
  80481d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804820:	48 63 d0             	movslq %eax,%rdx
  804823:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80482a:	48 89 d6             	mov    %rdx,%rsi
  80482d:	48 89 c7             	mov    %rax,%rdi
  804830:	48 b8 42 17 80 00 00 	movabs $0x801742,%rax
  804837:	00 00 00 
  80483a:	ff d0                	callq  *%rax
  80483c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80483f:	01 45 fc             	add    %eax,-0x4(%rbp)
  804842:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804845:	48 98                	cltq   
  804847:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  80484e:	0f 82 78 ff ff ff    	jb     8047cc <devcons_write+0x29>
  804854:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804857:	c9                   	leaveq 
  804858:	c3                   	retq   

0000000000804859 <devcons_close>:
  804859:	55                   	push   %rbp
  80485a:	48 89 e5             	mov    %rsp,%rbp
  80485d:	48 83 ec 08          	sub    $0x8,%rsp
  804861:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804865:	b8 00 00 00 00       	mov    $0x0,%eax
  80486a:	c9                   	leaveq 
  80486b:	c3                   	retq   

000000000080486c <devcons_stat>:
  80486c:	55                   	push   %rbp
  80486d:	48 89 e5             	mov    %rsp,%rbp
  804870:	48 83 ec 10          	sub    $0x10,%rsp
  804874:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804878:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80487c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804880:	48 be 65 53 80 00 00 	movabs $0x805365,%rsi
  804887:	00 00 00 
  80488a:	48 89 c7             	mov    %rax,%rdi
  80488d:	48 b8 5a 0f 80 00 00 	movabs $0x800f5a,%rax
  804894:	00 00 00 
  804897:	ff d0                	callq  *%rax
  804899:	b8 00 00 00 00       	mov    $0x0,%eax
  80489e:	c9                   	leaveq 
  80489f:	c3                   	retq   

00000000008048a0 <ipc_recv>:
  8048a0:	55                   	push   %rbp
  8048a1:	48 89 e5             	mov    %rsp,%rbp
  8048a4:	48 83 ec 30          	sub    $0x30,%rsp
  8048a8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8048ac:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8048b0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8048b4:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8048b9:	75 0e                	jne    8048c9 <ipc_recv+0x29>
  8048bb:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8048c2:	00 00 00 
  8048c5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8048c9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8048cd:	48 89 c7             	mov    %rax,%rdi
  8048d0:	48 b8 c4 1a 80 00 00 	movabs $0x801ac4,%rax
  8048d7:	00 00 00 
  8048da:	ff d0                	callq  *%rax
  8048dc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8048df:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048e3:	79 27                	jns    80490c <ipc_recv+0x6c>
  8048e5:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8048ea:	74 0a                	je     8048f6 <ipc_recv+0x56>
  8048ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048f0:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8048f6:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8048fb:	74 0a                	je     804907 <ipc_recv+0x67>
  8048fd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804901:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804907:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80490a:	eb 53                	jmp    80495f <ipc_recv+0xbf>
  80490c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804911:	74 19                	je     80492c <ipc_recv+0x8c>
  804913:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80491a:	00 00 00 
  80491d:	48 8b 00             	mov    (%rax),%rax
  804920:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804926:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80492a:	89 10                	mov    %edx,(%rax)
  80492c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804931:	74 19                	je     80494c <ipc_recv+0xac>
  804933:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80493a:	00 00 00 
  80493d:	48 8b 00             	mov    (%rax),%rax
  804940:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804946:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80494a:	89 10                	mov    %edx,(%rax)
  80494c:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804953:	00 00 00 
  804956:	48 8b 00             	mov    (%rax),%rax
  804959:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  80495f:	c9                   	leaveq 
  804960:	c3                   	retq   

0000000000804961 <ipc_send>:
  804961:	55                   	push   %rbp
  804962:	48 89 e5             	mov    %rsp,%rbp
  804965:	48 83 ec 30          	sub    $0x30,%rsp
  804969:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80496c:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80496f:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804973:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804976:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80497b:	75 1c                	jne    804999 <ipc_send+0x38>
  80497d:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804984:	00 00 00 
  804987:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80498b:	eb 0c                	jmp    804999 <ipc_send+0x38>
  80498d:	48 b8 4d 18 80 00 00 	movabs $0x80184d,%rax
  804994:	00 00 00 
  804997:	ff d0                	callq  *%rax
  804999:	8b 75 e8             	mov    -0x18(%rbp),%esi
  80499c:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  80499f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8049a3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8049a6:	89 c7                	mov    %eax,%edi
  8049a8:	48 b8 6d 1a 80 00 00 	movabs $0x801a6d,%rax
  8049af:	00 00 00 
  8049b2:	ff d0                	callq  *%rax
  8049b4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8049b7:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8049bb:	74 d0                	je     80498d <ipc_send+0x2c>
  8049bd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049c1:	79 30                	jns    8049f3 <ipc_send+0x92>
  8049c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049c6:	89 c1                	mov    %eax,%ecx
  8049c8:	48 ba 70 53 80 00 00 	movabs $0x805370,%rdx
  8049cf:	00 00 00 
  8049d2:	be 44 00 00 00       	mov    $0x44,%esi
  8049d7:	48 bf 86 53 80 00 00 	movabs $0x805386,%rdi
  8049de:	00 00 00 
  8049e1:	b8 00 00 00 00       	mov    $0x0,%eax
  8049e6:	49 b8 90 01 80 00 00 	movabs $0x800190,%r8
  8049ed:	00 00 00 
  8049f0:	41 ff d0             	callq  *%r8
  8049f3:	90                   	nop
  8049f4:	c9                   	leaveq 
  8049f5:	c3                   	retq   

00000000008049f6 <ipc_host_recv>:
  8049f6:	55                   	push   %rbp
  8049f7:	48 89 e5             	mov    %rsp,%rbp
  8049fa:	48 83 ec 10          	sub    $0x10,%rsp
  8049fe:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804a02:	48 ba 98 53 80 00 00 	movabs $0x805398,%rdx
  804a09:	00 00 00 
  804a0c:	be 4e 00 00 00       	mov    $0x4e,%esi
  804a11:	48 bf 86 53 80 00 00 	movabs $0x805386,%rdi
  804a18:	00 00 00 
  804a1b:	b8 00 00 00 00       	mov    $0x0,%eax
  804a20:	48 b9 90 01 80 00 00 	movabs $0x800190,%rcx
  804a27:	00 00 00 
  804a2a:	ff d1                	callq  *%rcx

0000000000804a2c <ipc_host_send>:
  804a2c:	55                   	push   %rbp
  804a2d:	48 89 e5             	mov    %rsp,%rbp
  804a30:	48 83 ec 20          	sub    $0x20,%rsp
  804a34:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804a37:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804a3a:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  804a3e:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804a41:	48 ba b8 53 80 00 00 	movabs $0x8053b8,%rdx
  804a48:	00 00 00 
  804a4b:	be 58 00 00 00       	mov    $0x58,%esi
  804a50:	48 bf 86 53 80 00 00 	movabs $0x805386,%rdi
  804a57:	00 00 00 
  804a5a:	b8 00 00 00 00       	mov    $0x0,%eax
  804a5f:	48 b9 90 01 80 00 00 	movabs $0x800190,%rcx
  804a66:	00 00 00 
  804a69:	ff d1                	callq  *%rcx

0000000000804a6b <ipc_find_env>:
  804a6b:	55                   	push   %rbp
  804a6c:	48 89 e5             	mov    %rsp,%rbp
  804a6f:	48 83 ec 18          	sub    $0x18,%rsp
  804a73:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804a76:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804a7d:	eb 4d                	jmp    804acc <ipc_find_env+0x61>
  804a7f:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804a86:	00 00 00 
  804a89:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a8c:	48 98                	cltq   
  804a8e:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804a95:	48 01 d0             	add    %rdx,%rax
  804a98:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804a9e:	8b 00                	mov    (%rax),%eax
  804aa0:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804aa3:	75 23                	jne    804ac8 <ipc_find_env+0x5d>
  804aa5:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804aac:	00 00 00 
  804aaf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804ab2:	48 98                	cltq   
  804ab4:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804abb:	48 01 d0             	add    %rdx,%rax
  804abe:	48 05 c8 00 00 00    	add    $0xc8,%rax
  804ac4:	8b 00                	mov    (%rax),%eax
  804ac6:	eb 12                	jmp    804ada <ipc_find_env+0x6f>
  804ac8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804acc:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804ad3:	7e aa                	jle    804a7f <ipc_find_env+0x14>
  804ad5:	b8 00 00 00 00       	mov    $0x0,%eax
  804ada:	c9                   	leaveq 
  804adb:	c3                   	retq   

0000000000804adc <pageref>:
  804adc:	55                   	push   %rbp
  804add:	48 89 e5             	mov    %rsp,%rbp
  804ae0:	48 83 ec 18          	sub    $0x18,%rsp
  804ae4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804ae8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804aec:	48 c1 e8 15          	shr    $0x15,%rax
  804af0:	48 89 c2             	mov    %rax,%rdx
  804af3:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804afa:	01 00 00 
  804afd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804b01:	83 e0 01             	and    $0x1,%eax
  804b04:	48 85 c0             	test   %rax,%rax
  804b07:	75 07                	jne    804b10 <pageref+0x34>
  804b09:	b8 00 00 00 00       	mov    $0x0,%eax
  804b0e:	eb 56                	jmp    804b66 <pageref+0x8a>
  804b10:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804b14:	48 c1 e8 0c          	shr    $0xc,%rax
  804b18:	48 89 c2             	mov    %rax,%rdx
  804b1b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804b22:	01 00 00 
  804b25:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804b29:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804b2d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b31:	83 e0 01             	and    $0x1,%eax
  804b34:	48 85 c0             	test   %rax,%rax
  804b37:	75 07                	jne    804b40 <pageref+0x64>
  804b39:	b8 00 00 00 00       	mov    $0x0,%eax
  804b3e:	eb 26                	jmp    804b66 <pageref+0x8a>
  804b40:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b44:	48 c1 e8 0c          	shr    $0xc,%rax
  804b48:	48 89 c2             	mov    %rax,%rdx
  804b4b:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804b52:	00 00 00 
  804b55:	48 c1 e2 04          	shl    $0x4,%rdx
  804b59:	48 01 d0             	add    %rdx,%rax
  804b5c:	48 83 c0 08          	add    $0x8,%rax
  804b60:	0f b7 00             	movzwl (%rax),%eax
  804b63:	0f b7 c0             	movzwl %ax,%eax
  804b66:	c9                   	leaveq 
  804b67:	c3                   	retq   
