
vmm/guest/obj/user/testkbd:     file format elf64-x86-64


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
  80003c:	e8 29 04 00 00       	callq  80046a <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800052:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800059:	eb 10                	jmp    80006b <umain+0x28>
  80005b:	48 b8 2d 1d 80 00 00 	movabs $0x801d2d,%rax
  800062:	00 00 00 
  800065:	ff d0                	callq  *%rax
  800067:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80006b:	83 7d fc 09          	cmpl   $0x9,-0x4(%rbp)
  80006f:	7e ea                	jle    80005b <umain+0x18>
  800071:	bf 00 00 00 00       	mov    $0x0,%edi
  800076:	48 b8 5e 24 80 00 00 	movabs $0x80245e,%rax
  80007d:	00 00 00 
  800080:	ff d0                	callq  *%rax
  800082:	48 b8 7a 02 80 00 00 	movabs $0x80027a,%rax
  800089:	00 00 00 
  80008c:	ff d0                	callq  *%rax
  80008e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800091:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800095:	79 30                	jns    8000c7 <umain+0x84>
  800097:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80009a:	89 c1                	mov    %eax,%ecx
  80009c:	48 ba 40 45 80 00 00 	movabs $0x804540,%rdx
  8000a3:	00 00 00 
  8000a6:	be 10 00 00 00       	mov    $0x10,%esi
  8000ab:	48 bf 4d 45 80 00 00 	movabs $0x80454d,%rdi
  8000b2:	00 00 00 
  8000b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8000ba:	49 b8 12 05 80 00 00 	movabs $0x800512,%r8
  8000c1:	00 00 00 
  8000c4:	41 ff d0             	callq  *%r8
  8000c7:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000cb:	74 30                	je     8000fd <umain+0xba>
  8000cd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000d0:	89 c1                	mov    %eax,%ecx
  8000d2:	48 ba 5f 45 80 00 00 	movabs $0x80455f,%rdx
  8000d9:	00 00 00 
  8000dc:	be 12 00 00 00       	mov    $0x12,%esi
  8000e1:	48 bf 4d 45 80 00 00 	movabs $0x80454d,%rdi
  8000e8:	00 00 00 
  8000eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8000f0:	49 b8 12 05 80 00 00 	movabs $0x800512,%r8
  8000f7:	00 00 00 
  8000fa:	41 ff d0             	callq  *%r8
  8000fd:	be 01 00 00 00       	mov    $0x1,%esi
  800102:	bf 00 00 00 00       	mov    $0x0,%edi
  800107:	48 b8 d8 24 80 00 00 	movabs $0x8024d8,%rax
  80010e:	00 00 00 
  800111:	ff d0                	callq  *%rax
  800113:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800116:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80011a:	79 30                	jns    80014c <umain+0x109>
  80011c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80011f:	89 c1                	mov    %eax,%ecx
  800121:	48 ba 79 45 80 00 00 	movabs $0x804579,%rdx
  800128:	00 00 00 
  80012b:	be 14 00 00 00       	mov    $0x14,%esi
  800130:	48 bf 4d 45 80 00 00 	movabs $0x80454d,%rdi
  800137:	00 00 00 
  80013a:	b8 00 00 00 00       	mov    $0x0,%eax
  80013f:	49 b8 12 05 80 00 00 	movabs $0x800512,%r8
  800146:	00 00 00 
  800149:	41 ff d0             	callq  *%r8
  80014c:	48 bf 81 45 80 00 00 	movabs $0x804581,%rdi
  800153:	00 00 00 
  800156:	48 b8 70 12 80 00 00 	movabs $0x801270,%rax
  80015d:	00 00 00 
  800160:	ff d0                	callq  *%rax
  800162:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800166:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  80016b:	74 29                	je     800196 <umain+0x153>
  80016d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800171:	48 89 c2             	mov    %rax,%rdx
  800174:	48 be 8f 45 80 00 00 	movabs $0x80458f,%rsi
  80017b:	00 00 00 
  80017e:	bf 01 00 00 00       	mov    $0x1,%edi
  800183:	b8 00 00 00 00       	mov    $0x0,%eax
  800188:	48 b9 31 33 80 00 00 	movabs $0x803331,%rcx
  80018f:	00 00 00 
  800192:	ff d1                	callq  *%rcx
  800194:	eb b6                	jmp    80014c <umain+0x109>
  800196:	48 be 93 45 80 00 00 	movabs $0x804593,%rsi
  80019d:	00 00 00 
  8001a0:	bf 01 00 00 00       	mov    $0x1,%edi
  8001a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8001aa:	48 ba 31 33 80 00 00 	movabs $0x803331,%rdx
  8001b1:	00 00 00 
  8001b4:	ff d2                	callq  *%rdx
  8001b6:	eb 94                	jmp    80014c <umain+0x109>

00000000008001b8 <cputchar>:
  8001b8:	55                   	push   %rbp
  8001b9:	48 89 e5             	mov    %rsp,%rbp
  8001bc:	48 83 ec 20          	sub    $0x20,%rsp
  8001c0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8001c3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8001c6:	88 45 ff             	mov    %al,-0x1(%rbp)
  8001c9:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  8001cd:	be 01 00 00 00       	mov    $0x1,%esi
  8001d2:	48 89 c7             	mov    %rax,%rdi
  8001d5:	48 b8 22 1c 80 00 00 	movabs $0x801c22,%rax
  8001dc:	00 00 00 
  8001df:	ff d0                	callq  *%rax
  8001e1:	90                   	nop
  8001e2:	c9                   	leaveq 
  8001e3:	c3                   	retq   

00000000008001e4 <getchar>:
  8001e4:	55                   	push   %rbp
  8001e5:	48 89 e5             	mov    %rsp,%rbp
  8001e8:	48 83 ec 10          	sub    $0x10,%rsp
  8001ec:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8001f0:	ba 01 00 00 00       	mov    $0x1,%edx
  8001f5:	48 89 c6             	mov    %rax,%rsi
  8001f8:	bf 00 00 00 00       	mov    $0x0,%edi
  8001fd:	48 b8 81 26 80 00 00 	movabs $0x802681,%rax
  800204:	00 00 00 
  800207:	ff d0                	callq  *%rax
  800209:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80020c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800210:	79 05                	jns    800217 <getchar+0x33>
  800212:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800215:	eb 14                	jmp    80022b <getchar+0x47>
  800217:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80021b:	7f 07                	jg     800224 <getchar+0x40>
  80021d:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  800222:	eb 07                	jmp    80022b <getchar+0x47>
  800224:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  800228:	0f b6 c0             	movzbl %al,%eax
  80022b:	c9                   	leaveq 
  80022c:	c3                   	retq   

000000000080022d <iscons>:
  80022d:	55                   	push   %rbp
  80022e:	48 89 e5             	mov    %rsp,%rbp
  800231:	48 83 ec 20          	sub    $0x20,%rsp
  800235:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800238:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80023c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80023f:	48 89 d6             	mov    %rdx,%rsi
  800242:	89 c7                	mov    %eax,%edi
  800244:	48 b8 4c 22 80 00 00 	movabs $0x80224c,%rax
  80024b:	00 00 00 
  80024e:	ff d0                	callq  *%rax
  800250:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800253:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800257:	79 05                	jns    80025e <iscons+0x31>
  800259:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80025c:	eb 1a                	jmp    800278 <iscons+0x4b>
  80025e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800262:	8b 10                	mov    (%rax),%edx
  800264:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  80026b:	00 00 00 
  80026e:	8b 00                	mov    (%rax),%eax
  800270:	39 c2                	cmp    %eax,%edx
  800272:	0f 94 c0             	sete   %al
  800275:	0f b6 c0             	movzbl %al,%eax
  800278:	c9                   	leaveq 
  800279:	c3                   	retq   

000000000080027a <opencons>:
  80027a:	55                   	push   %rbp
  80027b:	48 89 e5             	mov    %rsp,%rbp
  80027e:	48 83 ec 10          	sub    $0x10,%rsp
  800282:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  800286:	48 89 c7             	mov    %rax,%rdi
  800289:	48 b8 b4 21 80 00 00 	movabs $0x8021b4,%rax
  800290:	00 00 00 
  800293:	ff d0                	callq  *%rax
  800295:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800298:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80029c:	79 05                	jns    8002a3 <opencons+0x29>
  80029e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002a1:	eb 5b                	jmp    8002fe <opencons+0x84>
  8002a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002a7:	ba 07 04 00 00       	mov    $0x407,%edx
  8002ac:	48 89 c6             	mov    %rax,%rsi
  8002af:	bf 00 00 00 00       	mov    $0x0,%edi
  8002b4:	48 b8 6a 1d 80 00 00 	movabs $0x801d6a,%rax
  8002bb:	00 00 00 
  8002be:	ff d0                	callq  *%rax
  8002c0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8002c3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8002c7:	79 05                	jns    8002ce <opencons+0x54>
  8002c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002cc:	eb 30                	jmp    8002fe <opencons+0x84>
  8002ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002d2:	48 ba 00 60 80 00 00 	movabs $0x806000,%rdx
  8002d9:	00 00 00 
  8002dc:	8b 12                	mov    (%rdx),%edx
  8002de:	89 10                	mov    %edx,(%rax)
  8002e0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002e4:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8002eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002ef:	48 89 c7             	mov    %rax,%rdi
  8002f2:	48 b8 66 21 80 00 00 	movabs $0x802166,%rax
  8002f9:	00 00 00 
  8002fc:	ff d0                	callq  *%rax
  8002fe:	c9                   	leaveq 
  8002ff:	c3                   	retq   

0000000000800300 <devcons_read>:
  800300:	55                   	push   %rbp
  800301:	48 89 e5             	mov    %rsp,%rbp
  800304:	48 83 ec 30          	sub    $0x30,%rsp
  800308:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80030c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800310:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800314:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  800319:	75 13                	jne    80032e <devcons_read+0x2e>
  80031b:	b8 00 00 00 00       	mov    $0x0,%eax
  800320:	eb 49                	jmp    80036b <devcons_read+0x6b>
  800322:	48 b8 2d 1d 80 00 00 	movabs $0x801d2d,%rax
  800329:	00 00 00 
  80032c:	ff d0                	callq  *%rax
  80032e:	48 b8 6f 1c 80 00 00 	movabs $0x801c6f,%rax
  800335:	00 00 00 
  800338:	ff d0                	callq  *%rax
  80033a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80033d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800341:	74 df                	je     800322 <devcons_read+0x22>
  800343:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800347:	79 05                	jns    80034e <devcons_read+0x4e>
  800349:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80034c:	eb 1d                	jmp    80036b <devcons_read+0x6b>
  80034e:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  800352:	75 07                	jne    80035b <devcons_read+0x5b>
  800354:	b8 00 00 00 00       	mov    $0x0,%eax
  800359:	eb 10                	jmp    80036b <devcons_read+0x6b>
  80035b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80035e:	89 c2                	mov    %eax,%edx
  800360:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800364:	88 10                	mov    %dl,(%rax)
  800366:	b8 01 00 00 00       	mov    $0x1,%eax
  80036b:	c9                   	leaveq 
  80036c:	c3                   	retq   

000000000080036d <devcons_write>:
  80036d:	55                   	push   %rbp
  80036e:	48 89 e5             	mov    %rsp,%rbp
  800371:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  800378:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  80037f:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  800386:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  80038d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800394:	eb 76                	jmp    80040c <devcons_write+0x9f>
  800396:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  80039d:	89 c2                	mov    %eax,%edx
  80039f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003a2:	29 c2                	sub    %eax,%edx
  8003a4:	89 d0                	mov    %edx,%eax
  8003a6:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8003a9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8003ac:	83 f8 7f             	cmp    $0x7f,%eax
  8003af:	76 07                	jbe    8003b8 <devcons_write+0x4b>
  8003b1:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8003b8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8003bb:	48 63 d0             	movslq %eax,%rdx
  8003be:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003c1:	48 63 c8             	movslq %eax,%rcx
  8003c4:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8003cb:	48 01 c1             	add    %rax,%rcx
  8003ce:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8003d5:	48 89 ce             	mov    %rcx,%rsi
  8003d8:	48 89 c7             	mov    %rax,%rdi
  8003db:	48 b8 5f 17 80 00 00 	movabs $0x80175f,%rax
  8003e2:	00 00 00 
  8003e5:	ff d0                	callq  *%rax
  8003e7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8003ea:	48 63 d0             	movslq %eax,%rdx
  8003ed:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8003f4:	48 89 d6             	mov    %rdx,%rsi
  8003f7:	48 89 c7             	mov    %rax,%rdi
  8003fa:	48 b8 22 1c 80 00 00 	movabs $0x801c22,%rax
  800401:	00 00 00 
  800404:	ff d0                	callq  *%rax
  800406:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800409:	01 45 fc             	add    %eax,-0x4(%rbp)
  80040c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80040f:	48 98                	cltq   
  800411:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  800418:	0f 82 78 ff ff ff    	jb     800396 <devcons_write+0x29>
  80041e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800421:	c9                   	leaveq 
  800422:	c3                   	retq   

0000000000800423 <devcons_close>:
  800423:	55                   	push   %rbp
  800424:	48 89 e5             	mov    %rsp,%rbp
  800427:	48 83 ec 08          	sub    $0x8,%rsp
  80042b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80042f:	b8 00 00 00 00       	mov    $0x0,%eax
  800434:	c9                   	leaveq 
  800435:	c3                   	retq   

0000000000800436 <devcons_stat>:
  800436:	55                   	push   %rbp
  800437:	48 89 e5             	mov    %rsp,%rbp
  80043a:	48 83 ec 10          	sub    $0x10,%rsp
  80043e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800442:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800446:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80044a:	48 be b0 45 80 00 00 	movabs $0x8045b0,%rsi
  800451:	00 00 00 
  800454:	48 89 c7             	mov    %rax,%rdi
  800457:	48 b8 3a 14 80 00 00 	movabs $0x80143a,%rax
  80045e:	00 00 00 
  800461:	ff d0                	callq  *%rax
  800463:	b8 00 00 00 00       	mov    $0x0,%eax
  800468:	c9                   	leaveq 
  800469:	c3                   	retq   

000000000080046a <libmain>:
  80046a:	55                   	push   %rbp
  80046b:	48 89 e5             	mov    %rsp,%rbp
  80046e:	48 83 ec 10          	sub    $0x10,%rsp
  800472:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800475:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800479:	48 b8 f1 1c 80 00 00 	movabs $0x801cf1,%rax
  800480:	00 00 00 
  800483:	ff d0                	callq  *%rax
  800485:	25 ff 03 00 00       	and    $0x3ff,%eax
  80048a:	48 98                	cltq   
  80048c:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800493:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80049a:	00 00 00 
  80049d:	48 01 c2             	add    %rax,%rdx
  8004a0:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  8004a7:	00 00 00 
  8004aa:	48 89 10             	mov    %rdx,(%rax)
  8004ad:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8004b1:	7e 14                	jle    8004c7 <libmain+0x5d>
  8004b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004b7:	48 8b 10             	mov    (%rax),%rdx
  8004ba:	48 b8 38 60 80 00 00 	movabs $0x806038,%rax
  8004c1:	00 00 00 
  8004c4:	48 89 10             	mov    %rdx,(%rax)
  8004c7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8004cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8004ce:	48 89 d6             	mov    %rdx,%rsi
  8004d1:	89 c7                	mov    %eax,%edi
  8004d3:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8004da:	00 00 00 
  8004dd:	ff d0                	callq  *%rax
  8004df:	48 b8 ee 04 80 00 00 	movabs $0x8004ee,%rax
  8004e6:	00 00 00 
  8004e9:	ff d0                	callq  *%rax
  8004eb:	90                   	nop
  8004ec:	c9                   	leaveq 
  8004ed:	c3                   	retq   

00000000008004ee <exit>:
  8004ee:	55                   	push   %rbp
  8004ef:	48 89 e5             	mov    %rsp,%rbp
  8004f2:	48 b8 a9 24 80 00 00 	movabs $0x8024a9,%rax
  8004f9:	00 00 00 
  8004fc:	ff d0                	callq  *%rax
  8004fe:	bf 00 00 00 00       	mov    $0x0,%edi
  800503:	48 b8 ab 1c 80 00 00 	movabs $0x801cab,%rax
  80050a:	00 00 00 
  80050d:	ff d0                	callq  *%rax
  80050f:	90                   	nop
  800510:	5d                   	pop    %rbp
  800511:	c3                   	retq   

0000000000800512 <_panic>:
  800512:	55                   	push   %rbp
  800513:	48 89 e5             	mov    %rsp,%rbp
  800516:	53                   	push   %rbx
  800517:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80051e:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800525:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  80052b:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800532:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800539:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800540:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800547:	84 c0                	test   %al,%al
  800549:	74 23                	je     80056e <_panic+0x5c>
  80054b:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800552:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800556:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  80055a:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80055e:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800562:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800566:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  80056a:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80056e:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800575:	00 00 00 
  800578:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80057f:	00 00 00 
  800582:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800586:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80058d:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800594:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80059b:	48 b8 38 60 80 00 00 	movabs $0x806038,%rax
  8005a2:	00 00 00 
  8005a5:	48 8b 18             	mov    (%rax),%rbx
  8005a8:	48 b8 f1 1c 80 00 00 	movabs $0x801cf1,%rax
  8005af:	00 00 00 
  8005b2:	ff d0                	callq  *%rax
  8005b4:	89 c6                	mov    %eax,%esi
  8005b6:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  8005bc:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  8005c3:	41 89 d0             	mov    %edx,%r8d
  8005c6:	48 89 c1             	mov    %rax,%rcx
  8005c9:	48 89 da             	mov    %rbx,%rdx
  8005cc:	48 bf c8 45 80 00 00 	movabs $0x8045c8,%rdi
  8005d3:	00 00 00 
  8005d6:	b8 00 00 00 00       	mov    $0x0,%eax
  8005db:	49 b9 4c 07 80 00 00 	movabs $0x80074c,%r9
  8005e2:	00 00 00 
  8005e5:	41 ff d1             	callq  *%r9
  8005e8:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8005ef:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8005f6:	48 89 d6             	mov    %rdx,%rsi
  8005f9:	48 89 c7             	mov    %rax,%rdi
  8005fc:	48 b8 a0 06 80 00 00 	movabs $0x8006a0,%rax
  800603:	00 00 00 
  800606:	ff d0                	callq  *%rax
  800608:	48 bf eb 45 80 00 00 	movabs $0x8045eb,%rdi
  80060f:	00 00 00 
  800612:	b8 00 00 00 00       	mov    $0x0,%eax
  800617:	48 ba 4c 07 80 00 00 	movabs $0x80074c,%rdx
  80061e:	00 00 00 
  800621:	ff d2                	callq  *%rdx
  800623:	cc                   	int3   
  800624:	eb fd                	jmp    800623 <_panic+0x111>

0000000000800626 <putch>:
  800626:	55                   	push   %rbp
  800627:	48 89 e5             	mov    %rsp,%rbp
  80062a:	48 83 ec 10          	sub    $0x10,%rsp
  80062e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800631:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800635:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800639:	8b 00                	mov    (%rax),%eax
  80063b:	8d 48 01             	lea    0x1(%rax),%ecx
  80063e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800642:	89 0a                	mov    %ecx,(%rdx)
  800644:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800647:	89 d1                	mov    %edx,%ecx
  800649:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80064d:	48 98                	cltq   
  80064f:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800653:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800657:	8b 00                	mov    (%rax),%eax
  800659:	3d ff 00 00 00       	cmp    $0xff,%eax
  80065e:	75 2c                	jne    80068c <putch+0x66>
  800660:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800664:	8b 00                	mov    (%rax),%eax
  800666:	48 98                	cltq   
  800668:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80066c:	48 83 c2 08          	add    $0x8,%rdx
  800670:	48 89 c6             	mov    %rax,%rsi
  800673:	48 89 d7             	mov    %rdx,%rdi
  800676:	48 b8 22 1c 80 00 00 	movabs $0x801c22,%rax
  80067d:	00 00 00 
  800680:	ff d0                	callq  *%rax
  800682:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800686:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80068c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800690:	8b 40 04             	mov    0x4(%rax),%eax
  800693:	8d 50 01             	lea    0x1(%rax),%edx
  800696:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80069a:	89 50 04             	mov    %edx,0x4(%rax)
  80069d:	90                   	nop
  80069e:	c9                   	leaveq 
  80069f:	c3                   	retq   

00000000008006a0 <vcprintf>:
  8006a0:	55                   	push   %rbp
  8006a1:	48 89 e5             	mov    %rsp,%rbp
  8006a4:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8006ab:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8006b2:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8006b9:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8006c0:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8006c7:	48 8b 0a             	mov    (%rdx),%rcx
  8006ca:	48 89 08             	mov    %rcx,(%rax)
  8006cd:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8006d1:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8006d5:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8006d9:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8006dd:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8006e4:	00 00 00 
  8006e7:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8006ee:	00 00 00 
  8006f1:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8006f8:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8006ff:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800706:	48 89 c6             	mov    %rax,%rsi
  800709:	48 bf 26 06 80 00 00 	movabs $0x800626,%rdi
  800710:	00 00 00 
  800713:	48 b8 ea 0a 80 00 00 	movabs $0x800aea,%rax
  80071a:	00 00 00 
  80071d:	ff d0                	callq  *%rax
  80071f:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800725:	48 98                	cltq   
  800727:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80072e:	48 83 c2 08          	add    $0x8,%rdx
  800732:	48 89 c6             	mov    %rax,%rsi
  800735:	48 89 d7             	mov    %rdx,%rdi
  800738:	48 b8 22 1c 80 00 00 	movabs $0x801c22,%rax
  80073f:	00 00 00 
  800742:	ff d0                	callq  *%rax
  800744:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  80074a:	c9                   	leaveq 
  80074b:	c3                   	retq   

000000000080074c <cprintf>:
  80074c:	55                   	push   %rbp
  80074d:	48 89 e5             	mov    %rsp,%rbp
  800750:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800757:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80075e:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800765:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80076c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800773:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80077a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800781:	84 c0                	test   %al,%al
  800783:	74 20                	je     8007a5 <cprintf+0x59>
  800785:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800789:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80078d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800791:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800795:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800799:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80079d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8007a1:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8007a5:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8007ac:	00 00 00 
  8007af:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8007b6:	00 00 00 
  8007b9:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8007bd:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8007c4:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8007cb:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8007d2:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8007d9:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8007e0:	48 8b 0a             	mov    (%rdx),%rcx
  8007e3:	48 89 08             	mov    %rcx,(%rax)
  8007e6:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8007ea:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8007ee:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8007f2:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8007f6:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8007fd:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800804:	48 89 d6             	mov    %rdx,%rsi
  800807:	48 89 c7             	mov    %rax,%rdi
  80080a:	48 b8 a0 06 80 00 00 	movabs $0x8006a0,%rax
  800811:	00 00 00 
  800814:	ff d0                	callq  *%rax
  800816:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80081c:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800822:	c9                   	leaveq 
  800823:	c3                   	retq   

0000000000800824 <printnum>:
  800824:	55                   	push   %rbp
  800825:	48 89 e5             	mov    %rsp,%rbp
  800828:	48 83 ec 30          	sub    $0x30,%rsp
  80082c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800830:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800834:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800838:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  80083b:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  80083f:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  800843:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800846:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  80084a:	77 54                	ja     8008a0 <printnum+0x7c>
  80084c:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80084f:	8d 78 ff             	lea    -0x1(%rax),%edi
  800852:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800855:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800859:	ba 00 00 00 00       	mov    $0x0,%edx
  80085e:	48 f7 f6             	div    %rsi
  800861:	49 89 c2             	mov    %rax,%r10
  800864:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800867:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80086a:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80086e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800872:	41 89 c9             	mov    %ecx,%r9d
  800875:	41 89 f8             	mov    %edi,%r8d
  800878:	89 d1                	mov    %edx,%ecx
  80087a:	4c 89 d2             	mov    %r10,%rdx
  80087d:	48 89 c7             	mov    %rax,%rdi
  800880:	48 b8 24 08 80 00 00 	movabs $0x800824,%rax
  800887:	00 00 00 
  80088a:	ff d0                	callq  *%rax
  80088c:	eb 1c                	jmp    8008aa <printnum+0x86>
  80088e:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800892:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800895:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800899:	48 89 ce             	mov    %rcx,%rsi
  80089c:	89 d7                	mov    %edx,%edi
  80089e:	ff d0                	callq  *%rax
  8008a0:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  8008a4:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  8008a8:	7f e4                	jg     80088e <printnum+0x6a>
  8008aa:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8008ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008b1:	ba 00 00 00 00       	mov    $0x0,%edx
  8008b6:	48 f7 f1             	div    %rcx
  8008b9:	48 b8 f0 47 80 00 00 	movabs $0x8047f0,%rax
  8008c0:	00 00 00 
  8008c3:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  8008c7:	0f be d0             	movsbl %al,%edx
  8008ca:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8008ce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8008d2:	48 89 ce             	mov    %rcx,%rsi
  8008d5:	89 d7                	mov    %edx,%edi
  8008d7:	ff d0                	callq  *%rax
  8008d9:	90                   	nop
  8008da:	c9                   	leaveq 
  8008db:	c3                   	retq   

00000000008008dc <getuint>:
  8008dc:	55                   	push   %rbp
  8008dd:	48 89 e5             	mov    %rsp,%rbp
  8008e0:	48 83 ec 20          	sub    $0x20,%rsp
  8008e4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8008e8:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8008eb:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8008ef:	7e 4f                	jle    800940 <getuint+0x64>
  8008f1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008f5:	8b 00                	mov    (%rax),%eax
  8008f7:	83 f8 30             	cmp    $0x30,%eax
  8008fa:	73 24                	jae    800920 <getuint+0x44>
  8008fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800900:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800904:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800908:	8b 00                	mov    (%rax),%eax
  80090a:	89 c0                	mov    %eax,%eax
  80090c:	48 01 d0             	add    %rdx,%rax
  80090f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800913:	8b 12                	mov    (%rdx),%edx
  800915:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800918:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80091c:	89 0a                	mov    %ecx,(%rdx)
  80091e:	eb 14                	jmp    800934 <getuint+0x58>
  800920:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800924:	48 8b 40 08          	mov    0x8(%rax),%rax
  800928:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80092c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800930:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800934:	48 8b 00             	mov    (%rax),%rax
  800937:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80093b:	e9 9d 00 00 00       	jmpq   8009dd <getuint+0x101>
  800940:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800944:	74 4c                	je     800992 <getuint+0xb6>
  800946:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80094a:	8b 00                	mov    (%rax),%eax
  80094c:	83 f8 30             	cmp    $0x30,%eax
  80094f:	73 24                	jae    800975 <getuint+0x99>
  800951:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800955:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800959:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80095d:	8b 00                	mov    (%rax),%eax
  80095f:	89 c0                	mov    %eax,%eax
  800961:	48 01 d0             	add    %rdx,%rax
  800964:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800968:	8b 12                	mov    (%rdx),%edx
  80096a:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80096d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800971:	89 0a                	mov    %ecx,(%rdx)
  800973:	eb 14                	jmp    800989 <getuint+0xad>
  800975:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800979:	48 8b 40 08          	mov    0x8(%rax),%rax
  80097d:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800981:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800985:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800989:	48 8b 00             	mov    (%rax),%rax
  80098c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800990:	eb 4b                	jmp    8009dd <getuint+0x101>
  800992:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800996:	8b 00                	mov    (%rax),%eax
  800998:	83 f8 30             	cmp    $0x30,%eax
  80099b:	73 24                	jae    8009c1 <getuint+0xe5>
  80099d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009a1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8009a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009a9:	8b 00                	mov    (%rax),%eax
  8009ab:	89 c0                	mov    %eax,%eax
  8009ad:	48 01 d0             	add    %rdx,%rax
  8009b0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009b4:	8b 12                	mov    (%rdx),%edx
  8009b6:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8009b9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009bd:	89 0a                	mov    %ecx,(%rdx)
  8009bf:	eb 14                	jmp    8009d5 <getuint+0xf9>
  8009c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009c5:	48 8b 40 08          	mov    0x8(%rax),%rax
  8009c9:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8009cd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009d1:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009d5:	8b 00                	mov    (%rax),%eax
  8009d7:	89 c0                	mov    %eax,%eax
  8009d9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8009dd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8009e1:	c9                   	leaveq 
  8009e2:	c3                   	retq   

00000000008009e3 <getint>:
  8009e3:	55                   	push   %rbp
  8009e4:	48 89 e5             	mov    %rsp,%rbp
  8009e7:	48 83 ec 20          	sub    $0x20,%rsp
  8009eb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8009ef:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8009f2:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8009f6:	7e 4f                	jle    800a47 <getint+0x64>
  8009f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009fc:	8b 00                	mov    (%rax),%eax
  8009fe:	83 f8 30             	cmp    $0x30,%eax
  800a01:	73 24                	jae    800a27 <getint+0x44>
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
  800a25:	eb 14                	jmp    800a3b <getint+0x58>
  800a27:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a2b:	48 8b 40 08          	mov    0x8(%rax),%rax
  800a2f:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800a33:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a37:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a3b:	48 8b 00             	mov    (%rax),%rax
  800a3e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a42:	e9 9d 00 00 00       	jmpq   800ae4 <getint+0x101>
  800a47:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800a4b:	74 4c                	je     800a99 <getint+0xb6>
  800a4d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a51:	8b 00                	mov    (%rax),%eax
  800a53:	83 f8 30             	cmp    $0x30,%eax
  800a56:	73 24                	jae    800a7c <getint+0x99>
  800a58:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a5c:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a60:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a64:	8b 00                	mov    (%rax),%eax
  800a66:	89 c0                	mov    %eax,%eax
  800a68:	48 01 d0             	add    %rdx,%rax
  800a6b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a6f:	8b 12                	mov    (%rdx),%edx
  800a71:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a74:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a78:	89 0a                	mov    %ecx,(%rdx)
  800a7a:	eb 14                	jmp    800a90 <getint+0xad>
  800a7c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a80:	48 8b 40 08          	mov    0x8(%rax),%rax
  800a84:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800a88:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a8c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a90:	48 8b 00             	mov    (%rax),%rax
  800a93:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a97:	eb 4b                	jmp    800ae4 <getint+0x101>
  800a99:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a9d:	8b 00                	mov    (%rax),%eax
  800a9f:	83 f8 30             	cmp    $0x30,%eax
  800aa2:	73 24                	jae    800ac8 <getint+0xe5>
  800aa4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800aa8:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800aac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ab0:	8b 00                	mov    (%rax),%eax
  800ab2:	89 c0                	mov    %eax,%eax
  800ab4:	48 01 d0             	add    %rdx,%rax
  800ab7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800abb:	8b 12                	mov    (%rdx),%edx
  800abd:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800ac0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ac4:	89 0a                	mov    %ecx,(%rdx)
  800ac6:	eb 14                	jmp    800adc <getint+0xf9>
  800ac8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800acc:	48 8b 40 08          	mov    0x8(%rax),%rax
  800ad0:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800ad4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ad8:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800adc:	8b 00                	mov    (%rax),%eax
  800ade:	48 98                	cltq   
  800ae0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800ae4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800ae8:	c9                   	leaveq 
  800ae9:	c3                   	retq   

0000000000800aea <vprintfmt>:
  800aea:	55                   	push   %rbp
  800aeb:	48 89 e5             	mov    %rsp,%rbp
  800aee:	41 54                	push   %r12
  800af0:	53                   	push   %rbx
  800af1:	48 83 ec 60          	sub    $0x60,%rsp
  800af5:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800af9:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800afd:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800b01:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800b05:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800b09:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800b0d:	48 8b 0a             	mov    (%rdx),%rcx
  800b10:	48 89 08             	mov    %rcx,(%rax)
  800b13:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800b17:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800b1b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800b1f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800b23:	eb 17                	jmp    800b3c <vprintfmt+0x52>
  800b25:	85 db                	test   %ebx,%ebx
  800b27:	0f 84 b9 04 00 00    	je     800fe6 <vprintfmt+0x4fc>
  800b2d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b31:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b35:	48 89 d6             	mov    %rdx,%rsi
  800b38:	89 df                	mov    %ebx,%edi
  800b3a:	ff d0                	callq  *%rax
  800b3c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800b40:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800b44:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800b48:	0f b6 00             	movzbl (%rax),%eax
  800b4b:	0f b6 d8             	movzbl %al,%ebx
  800b4e:	83 fb 25             	cmp    $0x25,%ebx
  800b51:	75 d2                	jne    800b25 <vprintfmt+0x3b>
  800b53:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800b57:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800b5e:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800b65:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800b6c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800b73:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800b77:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800b7b:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800b7f:	0f b6 00             	movzbl (%rax),%eax
  800b82:	0f b6 d8             	movzbl %al,%ebx
  800b85:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800b88:	83 f8 55             	cmp    $0x55,%eax
  800b8b:	0f 87 22 04 00 00    	ja     800fb3 <vprintfmt+0x4c9>
  800b91:	89 c0                	mov    %eax,%eax
  800b93:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800b9a:	00 
  800b9b:	48 b8 18 48 80 00 00 	movabs $0x804818,%rax
  800ba2:	00 00 00 
  800ba5:	48 01 d0             	add    %rdx,%rax
  800ba8:	48 8b 00             	mov    (%rax),%rax
  800bab:	ff e0                	jmpq   *%rax
  800bad:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800bb1:	eb c0                	jmp    800b73 <vprintfmt+0x89>
  800bb3:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800bb7:	eb ba                	jmp    800b73 <vprintfmt+0x89>
  800bb9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800bc0:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800bc3:	89 d0                	mov    %edx,%eax
  800bc5:	c1 e0 02             	shl    $0x2,%eax
  800bc8:	01 d0                	add    %edx,%eax
  800bca:	01 c0                	add    %eax,%eax
  800bcc:	01 d8                	add    %ebx,%eax
  800bce:	83 e8 30             	sub    $0x30,%eax
  800bd1:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800bd4:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800bd8:	0f b6 00             	movzbl (%rax),%eax
  800bdb:	0f be d8             	movsbl %al,%ebx
  800bde:	83 fb 2f             	cmp    $0x2f,%ebx
  800be1:	7e 60                	jle    800c43 <vprintfmt+0x159>
  800be3:	83 fb 39             	cmp    $0x39,%ebx
  800be6:	7f 5b                	jg     800c43 <vprintfmt+0x159>
  800be8:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800bed:	eb d1                	jmp    800bc0 <vprintfmt+0xd6>
  800bef:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bf2:	83 f8 30             	cmp    $0x30,%eax
  800bf5:	73 17                	jae    800c0e <vprintfmt+0x124>
  800bf7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800bfb:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bfe:	89 d2                	mov    %edx,%edx
  800c00:	48 01 d0             	add    %rdx,%rax
  800c03:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c06:	83 c2 08             	add    $0x8,%edx
  800c09:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c0c:	eb 0c                	jmp    800c1a <vprintfmt+0x130>
  800c0e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800c12:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800c16:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c1a:	8b 00                	mov    (%rax),%eax
  800c1c:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800c1f:	eb 23                	jmp    800c44 <vprintfmt+0x15a>
  800c21:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c25:	0f 89 48 ff ff ff    	jns    800b73 <vprintfmt+0x89>
  800c2b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800c32:	e9 3c ff ff ff       	jmpq   800b73 <vprintfmt+0x89>
  800c37:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800c3e:	e9 30 ff ff ff       	jmpq   800b73 <vprintfmt+0x89>
  800c43:	90                   	nop
  800c44:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c48:	0f 89 25 ff ff ff    	jns    800b73 <vprintfmt+0x89>
  800c4e:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800c51:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800c54:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800c5b:	e9 13 ff ff ff       	jmpq   800b73 <vprintfmt+0x89>
  800c60:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800c64:	e9 0a ff ff ff       	jmpq   800b73 <vprintfmt+0x89>
  800c69:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c6c:	83 f8 30             	cmp    $0x30,%eax
  800c6f:	73 17                	jae    800c88 <vprintfmt+0x19e>
  800c71:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800c75:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c78:	89 d2                	mov    %edx,%edx
  800c7a:	48 01 d0             	add    %rdx,%rax
  800c7d:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c80:	83 c2 08             	add    $0x8,%edx
  800c83:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c86:	eb 0c                	jmp    800c94 <vprintfmt+0x1aa>
  800c88:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800c8c:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800c90:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c94:	8b 10                	mov    (%rax),%edx
  800c96:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800c9a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c9e:	48 89 ce             	mov    %rcx,%rsi
  800ca1:	89 d7                	mov    %edx,%edi
  800ca3:	ff d0                	callq  *%rax
  800ca5:	e9 37 03 00 00       	jmpq   800fe1 <vprintfmt+0x4f7>
  800caa:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800cad:	83 f8 30             	cmp    $0x30,%eax
  800cb0:	73 17                	jae    800cc9 <vprintfmt+0x1df>
  800cb2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800cb6:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800cb9:	89 d2                	mov    %edx,%edx
  800cbb:	48 01 d0             	add    %rdx,%rax
  800cbe:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800cc1:	83 c2 08             	add    $0x8,%edx
  800cc4:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800cc7:	eb 0c                	jmp    800cd5 <vprintfmt+0x1eb>
  800cc9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800ccd:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800cd1:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800cd5:	8b 18                	mov    (%rax),%ebx
  800cd7:	85 db                	test   %ebx,%ebx
  800cd9:	79 02                	jns    800cdd <vprintfmt+0x1f3>
  800cdb:	f7 db                	neg    %ebx
  800cdd:	83 fb 15             	cmp    $0x15,%ebx
  800ce0:	7f 16                	jg     800cf8 <vprintfmt+0x20e>
  800ce2:	48 b8 40 47 80 00 00 	movabs $0x804740,%rax
  800ce9:	00 00 00 
  800cec:	48 63 d3             	movslq %ebx,%rdx
  800cef:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800cf3:	4d 85 e4             	test   %r12,%r12
  800cf6:	75 2e                	jne    800d26 <vprintfmt+0x23c>
  800cf8:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800cfc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d00:	89 d9                	mov    %ebx,%ecx
  800d02:	48 ba 01 48 80 00 00 	movabs $0x804801,%rdx
  800d09:	00 00 00 
  800d0c:	48 89 c7             	mov    %rax,%rdi
  800d0f:	b8 00 00 00 00       	mov    $0x0,%eax
  800d14:	49 b8 f0 0f 80 00 00 	movabs $0x800ff0,%r8
  800d1b:	00 00 00 
  800d1e:	41 ff d0             	callq  *%r8
  800d21:	e9 bb 02 00 00       	jmpq   800fe1 <vprintfmt+0x4f7>
  800d26:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800d2a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d2e:	4c 89 e1             	mov    %r12,%rcx
  800d31:	48 ba 0a 48 80 00 00 	movabs $0x80480a,%rdx
  800d38:	00 00 00 
  800d3b:	48 89 c7             	mov    %rax,%rdi
  800d3e:	b8 00 00 00 00       	mov    $0x0,%eax
  800d43:	49 b8 f0 0f 80 00 00 	movabs $0x800ff0,%r8
  800d4a:	00 00 00 
  800d4d:	41 ff d0             	callq  *%r8
  800d50:	e9 8c 02 00 00       	jmpq   800fe1 <vprintfmt+0x4f7>
  800d55:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d58:	83 f8 30             	cmp    $0x30,%eax
  800d5b:	73 17                	jae    800d74 <vprintfmt+0x28a>
  800d5d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d61:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d64:	89 d2                	mov    %edx,%edx
  800d66:	48 01 d0             	add    %rdx,%rax
  800d69:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d6c:	83 c2 08             	add    $0x8,%edx
  800d6f:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d72:	eb 0c                	jmp    800d80 <vprintfmt+0x296>
  800d74:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800d78:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800d7c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d80:	4c 8b 20             	mov    (%rax),%r12
  800d83:	4d 85 e4             	test   %r12,%r12
  800d86:	75 0a                	jne    800d92 <vprintfmt+0x2a8>
  800d88:	49 bc 0d 48 80 00 00 	movabs $0x80480d,%r12
  800d8f:	00 00 00 
  800d92:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d96:	7e 78                	jle    800e10 <vprintfmt+0x326>
  800d98:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800d9c:	74 72                	je     800e10 <vprintfmt+0x326>
  800d9e:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800da1:	48 98                	cltq   
  800da3:	48 89 c6             	mov    %rax,%rsi
  800da6:	4c 89 e7             	mov    %r12,%rdi
  800da9:	48 b8 fc 13 80 00 00 	movabs $0x8013fc,%rax
  800db0:	00 00 00 
  800db3:	ff d0                	callq  *%rax
  800db5:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800db8:	eb 17                	jmp    800dd1 <vprintfmt+0x2e7>
  800dba:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800dbe:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800dc2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dc6:	48 89 ce             	mov    %rcx,%rsi
  800dc9:	89 d7                	mov    %edx,%edi
  800dcb:	ff d0                	callq  *%rax
  800dcd:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800dd1:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800dd5:	7f e3                	jg     800dba <vprintfmt+0x2d0>
  800dd7:	eb 37                	jmp    800e10 <vprintfmt+0x326>
  800dd9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800ddd:	74 1e                	je     800dfd <vprintfmt+0x313>
  800ddf:	83 fb 1f             	cmp    $0x1f,%ebx
  800de2:	7e 05                	jle    800de9 <vprintfmt+0x2ff>
  800de4:	83 fb 7e             	cmp    $0x7e,%ebx
  800de7:	7e 14                	jle    800dfd <vprintfmt+0x313>
  800de9:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ded:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800df1:	48 89 d6             	mov    %rdx,%rsi
  800df4:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800df9:	ff d0                	callq  *%rax
  800dfb:	eb 0f                	jmp    800e0c <vprintfmt+0x322>
  800dfd:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e01:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e05:	48 89 d6             	mov    %rdx,%rsi
  800e08:	89 df                	mov    %ebx,%edi
  800e0a:	ff d0                	callq  *%rax
  800e0c:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800e10:	4c 89 e0             	mov    %r12,%rax
  800e13:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800e17:	0f b6 00             	movzbl (%rax),%eax
  800e1a:	0f be d8             	movsbl %al,%ebx
  800e1d:	85 db                	test   %ebx,%ebx
  800e1f:	74 28                	je     800e49 <vprintfmt+0x35f>
  800e21:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800e25:	78 b2                	js     800dd9 <vprintfmt+0x2ef>
  800e27:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800e2b:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800e2f:	79 a8                	jns    800dd9 <vprintfmt+0x2ef>
  800e31:	eb 16                	jmp    800e49 <vprintfmt+0x35f>
  800e33:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e37:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e3b:	48 89 d6             	mov    %rdx,%rsi
  800e3e:	bf 20 00 00 00       	mov    $0x20,%edi
  800e43:	ff d0                	callq  *%rax
  800e45:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800e49:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800e4d:	7f e4                	jg     800e33 <vprintfmt+0x349>
  800e4f:	e9 8d 01 00 00       	jmpq   800fe1 <vprintfmt+0x4f7>
  800e54:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e58:	be 03 00 00 00       	mov    $0x3,%esi
  800e5d:	48 89 c7             	mov    %rax,%rdi
  800e60:	48 b8 e3 09 80 00 00 	movabs $0x8009e3,%rax
  800e67:	00 00 00 
  800e6a:	ff d0                	callq  *%rax
  800e6c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e70:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e74:	48 85 c0             	test   %rax,%rax
  800e77:	79 1d                	jns    800e96 <vprintfmt+0x3ac>
  800e79:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e7d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e81:	48 89 d6             	mov    %rdx,%rsi
  800e84:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800e89:	ff d0                	callq  *%rax
  800e8b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e8f:	48 f7 d8             	neg    %rax
  800e92:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e96:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800e9d:	e9 d2 00 00 00       	jmpq   800f74 <vprintfmt+0x48a>
  800ea2:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ea6:	be 03 00 00 00       	mov    $0x3,%esi
  800eab:	48 89 c7             	mov    %rax,%rdi
  800eae:	48 b8 dc 08 80 00 00 	movabs $0x8008dc,%rax
  800eb5:	00 00 00 
  800eb8:	ff d0                	callq  *%rax
  800eba:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ebe:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800ec5:	e9 aa 00 00 00       	jmpq   800f74 <vprintfmt+0x48a>
  800eca:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ece:	be 03 00 00 00       	mov    $0x3,%esi
  800ed3:	48 89 c7             	mov    %rax,%rdi
  800ed6:	48 b8 dc 08 80 00 00 	movabs $0x8008dc,%rax
  800edd:	00 00 00 
  800ee0:	ff d0                	callq  *%rax
  800ee2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ee6:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800eed:	e9 82 00 00 00       	jmpq   800f74 <vprintfmt+0x48a>
  800ef2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ef6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800efa:	48 89 d6             	mov    %rdx,%rsi
  800efd:	bf 30 00 00 00       	mov    $0x30,%edi
  800f02:	ff d0                	callq  *%rax
  800f04:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f08:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f0c:	48 89 d6             	mov    %rdx,%rsi
  800f0f:	bf 78 00 00 00       	mov    $0x78,%edi
  800f14:	ff d0                	callq  *%rax
  800f16:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800f19:	83 f8 30             	cmp    $0x30,%eax
  800f1c:	73 17                	jae    800f35 <vprintfmt+0x44b>
  800f1e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800f22:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800f25:	89 d2                	mov    %edx,%edx
  800f27:	48 01 d0             	add    %rdx,%rax
  800f2a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800f2d:	83 c2 08             	add    $0x8,%edx
  800f30:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800f33:	eb 0c                	jmp    800f41 <vprintfmt+0x457>
  800f35:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800f39:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800f3d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800f41:	48 8b 00             	mov    (%rax),%rax
  800f44:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f48:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800f4f:	eb 23                	jmp    800f74 <vprintfmt+0x48a>
  800f51:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800f55:	be 03 00 00 00       	mov    $0x3,%esi
  800f5a:	48 89 c7             	mov    %rax,%rdi
  800f5d:	48 b8 dc 08 80 00 00 	movabs $0x8008dc,%rax
  800f64:	00 00 00 
  800f67:	ff d0                	callq  *%rax
  800f69:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f6d:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800f74:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800f79:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800f7c:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800f7f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f83:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800f87:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f8b:	45 89 c1             	mov    %r8d,%r9d
  800f8e:	41 89 f8             	mov    %edi,%r8d
  800f91:	48 89 c7             	mov    %rax,%rdi
  800f94:	48 b8 24 08 80 00 00 	movabs $0x800824,%rax
  800f9b:	00 00 00 
  800f9e:	ff d0                	callq  *%rax
  800fa0:	eb 3f                	jmp    800fe1 <vprintfmt+0x4f7>
  800fa2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800fa6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800faa:	48 89 d6             	mov    %rdx,%rsi
  800fad:	89 df                	mov    %ebx,%edi
  800faf:	ff d0                	callq  *%rax
  800fb1:	eb 2e                	jmp    800fe1 <vprintfmt+0x4f7>
  800fb3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800fb7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800fbb:	48 89 d6             	mov    %rdx,%rsi
  800fbe:	bf 25 00 00 00       	mov    $0x25,%edi
  800fc3:	ff d0                	callq  *%rax
  800fc5:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800fca:	eb 05                	jmp    800fd1 <vprintfmt+0x4e7>
  800fcc:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800fd1:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800fd5:	48 83 e8 01          	sub    $0x1,%rax
  800fd9:	0f b6 00             	movzbl (%rax),%eax
  800fdc:	3c 25                	cmp    $0x25,%al
  800fde:	75 ec                	jne    800fcc <vprintfmt+0x4e2>
  800fe0:	90                   	nop
  800fe1:	e9 3d fb ff ff       	jmpq   800b23 <vprintfmt+0x39>
  800fe6:	90                   	nop
  800fe7:	48 83 c4 60          	add    $0x60,%rsp
  800feb:	5b                   	pop    %rbx
  800fec:	41 5c                	pop    %r12
  800fee:	5d                   	pop    %rbp
  800fef:	c3                   	retq   

0000000000800ff0 <printfmt>:
  800ff0:	55                   	push   %rbp
  800ff1:	48 89 e5             	mov    %rsp,%rbp
  800ff4:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800ffb:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  801002:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  801009:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  801010:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801017:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80101e:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801025:	84 c0                	test   %al,%al
  801027:	74 20                	je     801049 <printfmt+0x59>
  801029:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80102d:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801031:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801035:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801039:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80103d:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801041:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801045:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801049:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801050:	00 00 00 
  801053:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  80105a:	00 00 00 
  80105d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801061:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801068:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80106f:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  801076:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  80107d:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  801084:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  80108b:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  801092:	48 89 c7             	mov    %rax,%rdi
  801095:	48 b8 ea 0a 80 00 00 	movabs $0x800aea,%rax
  80109c:	00 00 00 
  80109f:	ff d0                	callq  *%rax
  8010a1:	90                   	nop
  8010a2:	c9                   	leaveq 
  8010a3:	c3                   	retq   

00000000008010a4 <sprintputch>:
  8010a4:	55                   	push   %rbp
  8010a5:	48 89 e5             	mov    %rsp,%rbp
  8010a8:	48 83 ec 10          	sub    $0x10,%rsp
  8010ac:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8010af:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8010b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010b7:	8b 40 10             	mov    0x10(%rax),%eax
  8010ba:	8d 50 01             	lea    0x1(%rax),%edx
  8010bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010c1:	89 50 10             	mov    %edx,0x10(%rax)
  8010c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010c8:	48 8b 10             	mov    (%rax),%rdx
  8010cb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010cf:	48 8b 40 08          	mov    0x8(%rax),%rax
  8010d3:	48 39 c2             	cmp    %rax,%rdx
  8010d6:	73 17                	jae    8010ef <sprintputch+0x4b>
  8010d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010dc:	48 8b 00             	mov    (%rax),%rax
  8010df:	48 8d 48 01          	lea    0x1(%rax),%rcx
  8010e3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8010e7:	48 89 0a             	mov    %rcx,(%rdx)
  8010ea:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8010ed:	88 10                	mov    %dl,(%rax)
  8010ef:	90                   	nop
  8010f0:	c9                   	leaveq 
  8010f1:	c3                   	retq   

00000000008010f2 <vsnprintf>:
  8010f2:	55                   	push   %rbp
  8010f3:	48 89 e5             	mov    %rsp,%rbp
  8010f6:	48 83 ec 50          	sub    $0x50,%rsp
  8010fa:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8010fe:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  801101:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801105:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  801109:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  80110d:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801111:	48 8b 0a             	mov    (%rdx),%rcx
  801114:	48 89 08             	mov    %rcx,(%rax)
  801117:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80111b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80111f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801123:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801127:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80112b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  80112f:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801132:	48 98                	cltq   
  801134:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801138:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80113c:	48 01 d0             	add    %rdx,%rax
  80113f:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801143:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80114a:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  80114f:	74 06                	je     801157 <vsnprintf+0x65>
  801151:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801155:	7f 07                	jg     80115e <vsnprintf+0x6c>
  801157:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80115c:	eb 2f                	jmp    80118d <vsnprintf+0x9b>
  80115e:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801162:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801166:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80116a:	48 89 c6             	mov    %rax,%rsi
  80116d:	48 bf a4 10 80 00 00 	movabs $0x8010a4,%rdi
  801174:	00 00 00 
  801177:	48 b8 ea 0a 80 00 00 	movabs $0x800aea,%rax
  80117e:	00 00 00 
  801181:	ff d0                	callq  *%rax
  801183:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801187:	c6 00 00             	movb   $0x0,(%rax)
  80118a:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80118d:	c9                   	leaveq 
  80118e:	c3                   	retq   

000000000080118f <snprintf>:
  80118f:	55                   	push   %rbp
  801190:	48 89 e5             	mov    %rsp,%rbp
  801193:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  80119a:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8011a1:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  8011a7:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  8011ae:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8011b5:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8011bc:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8011c3:	84 c0                	test   %al,%al
  8011c5:	74 20                	je     8011e7 <snprintf+0x58>
  8011c7:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8011cb:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8011cf:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8011d3:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8011d7:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8011db:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8011df:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8011e3:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8011e7:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8011ee:	00 00 00 
  8011f1:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8011f8:	00 00 00 
  8011fb:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8011ff:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801206:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80120d:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801214:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80121b:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801222:	48 8b 0a             	mov    (%rdx),%rcx
  801225:	48 89 08             	mov    %rcx,(%rax)
  801228:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80122c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801230:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801234:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801238:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80123f:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801246:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80124c:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801253:	48 89 c7             	mov    %rax,%rdi
  801256:	48 b8 f2 10 80 00 00 	movabs $0x8010f2,%rax
  80125d:	00 00 00 
  801260:	ff d0                	callq  *%rax
  801262:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801268:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80126e:	c9                   	leaveq 
  80126f:	c3                   	retq   

0000000000801270 <readline>:
  801270:	55                   	push   %rbp
  801271:	48 89 e5             	mov    %rsp,%rbp
  801274:	48 83 ec 20          	sub    $0x20,%rsp
  801278:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80127c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801281:	74 27                	je     8012aa <readline+0x3a>
  801283:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801287:	48 89 c2             	mov    %rax,%rdx
  80128a:	48 be c8 4a 80 00 00 	movabs $0x804ac8,%rsi
  801291:	00 00 00 
  801294:	bf 01 00 00 00       	mov    $0x1,%edi
  801299:	b8 00 00 00 00       	mov    $0x0,%eax
  80129e:	48 b9 31 33 80 00 00 	movabs $0x803331,%rcx
  8012a5:	00 00 00 
  8012a8:	ff d1                	callq  *%rcx
  8012aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8012b1:	bf 00 00 00 00       	mov    $0x0,%edi
  8012b6:	48 b8 2d 02 80 00 00 	movabs $0x80022d,%rax
  8012bd:	00 00 00 
  8012c0:	ff d0                	callq  *%rax
  8012c2:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8012c5:	48 b8 e4 01 80 00 00 	movabs $0x8001e4,%rax
  8012cc:	00 00 00 
  8012cf:	ff d0                	callq  *%rax
  8012d1:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8012d4:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8012d8:	79 30                	jns    80130a <readline+0x9a>
  8012da:	83 7d f4 f7          	cmpl   $0xfffffff7,-0xc(%rbp)
  8012de:	74 20                	je     801300 <readline+0x90>
  8012e0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8012e3:	89 c6                	mov    %eax,%esi
  8012e5:	48 bf cb 4a 80 00 00 	movabs $0x804acb,%rdi
  8012ec:	00 00 00 
  8012ef:	b8 00 00 00 00       	mov    $0x0,%eax
  8012f4:	48 ba 4c 07 80 00 00 	movabs $0x80074c,%rdx
  8012fb:	00 00 00 
  8012fe:	ff d2                	callq  *%rdx
  801300:	b8 00 00 00 00       	mov    $0x0,%eax
  801305:	e9 c2 00 00 00       	jmpq   8013cc <readline+0x15c>
  80130a:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
  80130e:	74 06                	je     801316 <readline+0xa6>
  801310:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%rbp)
  801314:	75 26                	jne    80133c <readline+0xcc>
  801316:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80131a:	7e 20                	jle    80133c <readline+0xcc>
  80131c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801320:	74 11                	je     801333 <readline+0xc3>
  801322:	bf 08 00 00 00       	mov    $0x8,%edi
  801327:	48 b8 b8 01 80 00 00 	movabs $0x8001b8,%rax
  80132e:	00 00 00 
  801331:	ff d0                	callq  *%rax
  801333:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
  801337:	e9 8b 00 00 00       	jmpq   8013c7 <readline+0x157>
  80133c:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%rbp)
  801340:	7e 3f                	jle    801381 <readline+0x111>
  801342:	81 7d fc fe 03 00 00 	cmpl   $0x3fe,-0x4(%rbp)
  801349:	7f 36                	jg     801381 <readline+0x111>
  80134b:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80134f:	74 11                	je     801362 <readline+0xf2>
  801351:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801354:	89 c7                	mov    %eax,%edi
  801356:	48 b8 b8 01 80 00 00 	movabs $0x8001b8,%rax
  80135d:	00 00 00 
  801360:	ff d0                	callq  *%rax
  801362:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801365:	8d 50 01             	lea    0x1(%rax),%edx
  801368:	89 55 fc             	mov    %edx,-0x4(%rbp)
  80136b:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80136e:	89 d1                	mov    %edx,%ecx
  801370:	48 ba 00 70 80 00 00 	movabs $0x807000,%rdx
  801377:	00 00 00 
  80137a:	48 98                	cltq   
  80137c:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
  80137f:	eb 46                	jmp    8013c7 <readline+0x157>
  801381:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  801385:	74 0a                	je     801391 <readline+0x121>
  801387:	83 7d f4 0d          	cmpl   $0xd,-0xc(%rbp)
  80138b:	0f 85 34 ff ff ff    	jne    8012c5 <readline+0x55>
  801391:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801395:	74 11                	je     8013a8 <readline+0x138>
  801397:	bf 0a 00 00 00       	mov    $0xa,%edi
  80139c:	48 b8 b8 01 80 00 00 	movabs $0x8001b8,%rax
  8013a3:	00 00 00 
  8013a6:	ff d0                	callq  *%rax
  8013a8:	48 ba 00 70 80 00 00 	movabs $0x807000,%rdx
  8013af:	00 00 00 
  8013b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8013b5:	48 98                	cltq   
  8013b7:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
  8013bb:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8013c2:	00 00 00 
  8013c5:	eb 05                	jmp    8013cc <readline+0x15c>
  8013c7:	e9 f9 fe ff ff       	jmpq   8012c5 <readline+0x55>
  8013cc:	c9                   	leaveq 
  8013cd:	c3                   	retq   

00000000008013ce <strlen>:
  8013ce:	55                   	push   %rbp
  8013cf:	48 89 e5             	mov    %rsp,%rbp
  8013d2:	48 83 ec 18          	sub    $0x18,%rsp
  8013d6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013da:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8013e1:	eb 09                	jmp    8013ec <strlen+0x1e>
  8013e3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8013e7:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8013ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013f0:	0f b6 00             	movzbl (%rax),%eax
  8013f3:	84 c0                	test   %al,%al
  8013f5:	75 ec                	jne    8013e3 <strlen+0x15>
  8013f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8013fa:	c9                   	leaveq 
  8013fb:	c3                   	retq   

00000000008013fc <strnlen>:
  8013fc:	55                   	push   %rbp
  8013fd:	48 89 e5             	mov    %rsp,%rbp
  801400:	48 83 ec 20          	sub    $0x20,%rsp
  801404:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801408:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80140c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801413:	eb 0e                	jmp    801423 <strnlen+0x27>
  801415:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801419:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80141e:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801423:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801428:	74 0b                	je     801435 <strnlen+0x39>
  80142a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80142e:	0f b6 00             	movzbl (%rax),%eax
  801431:	84 c0                	test   %al,%al
  801433:	75 e0                	jne    801415 <strnlen+0x19>
  801435:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801438:	c9                   	leaveq 
  801439:	c3                   	retq   

000000000080143a <strcpy>:
  80143a:	55                   	push   %rbp
  80143b:	48 89 e5             	mov    %rsp,%rbp
  80143e:	48 83 ec 20          	sub    $0x20,%rsp
  801442:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801446:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80144a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80144e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801452:	90                   	nop
  801453:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801457:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80145b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80145f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801463:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801467:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80146b:	0f b6 12             	movzbl (%rdx),%edx
  80146e:	88 10                	mov    %dl,(%rax)
  801470:	0f b6 00             	movzbl (%rax),%eax
  801473:	84 c0                	test   %al,%al
  801475:	75 dc                	jne    801453 <strcpy+0x19>
  801477:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80147b:	c9                   	leaveq 
  80147c:	c3                   	retq   

000000000080147d <strcat>:
  80147d:	55                   	push   %rbp
  80147e:	48 89 e5             	mov    %rsp,%rbp
  801481:	48 83 ec 20          	sub    $0x20,%rsp
  801485:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801489:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80148d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801491:	48 89 c7             	mov    %rax,%rdi
  801494:	48 b8 ce 13 80 00 00 	movabs $0x8013ce,%rax
  80149b:	00 00 00 
  80149e:	ff d0                	callq  *%rax
  8014a0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8014a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8014a6:	48 63 d0             	movslq %eax,%rdx
  8014a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014ad:	48 01 c2             	add    %rax,%rdx
  8014b0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014b4:	48 89 c6             	mov    %rax,%rsi
  8014b7:	48 89 d7             	mov    %rdx,%rdi
  8014ba:	48 b8 3a 14 80 00 00 	movabs $0x80143a,%rax
  8014c1:	00 00 00 
  8014c4:	ff d0                	callq  *%rax
  8014c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014ca:	c9                   	leaveq 
  8014cb:	c3                   	retq   

00000000008014cc <strncpy>:
  8014cc:	55                   	push   %rbp
  8014cd:	48 89 e5             	mov    %rsp,%rbp
  8014d0:	48 83 ec 28          	sub    $0x28,%rsp
  8014d4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014d8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014dc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014e4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8014e8:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8014ef:	00 
  8014f0:	eb 2a                	jmp    80151c <strncpy+0x50>
  8014f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014f6:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8014fa:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014fe:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801502:	0f b6 12             	movzbl (%rdx),%edx
  801505:	88 10                	mov    %dl,(%rax)
  801507:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80150b:	0f b6 00             	movzbl (%rax),%eax
  80150e:	84 c0                	test   %al,%al
  801510:	74 05                	je     801517 <strncpy+0x4b>
  801512:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801517:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80151c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801520:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801524:	72 cc                	jb     8014f2 <strncpy+0x26>
  801526:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80152a:	c9                   	leaveq 
  80152b:	c3                   	retq   

000000000080152c <strlcpy>:
  80152c:	55                   	push   %rbp
  80152d:	48 89 e5             	mov    %rsp,%rbp
  801530:	48 83 ec 28          	sub    $0x28,%rsp
  801534:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801538:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80153c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801540:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801544:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801548:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80154d:	74 3d                	je     80158c <strlcpy+0x60>
  80154f:	eb 1d                	jmp    80156e <strlcpy+0x42>
  801551:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801555:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801559:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80155d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801561:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801565:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801569:	0f b6 12             	movzbl (%rdx),%edx
  80156c:	88 10                	mov    %dl,(%rax)
  80156e:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801573:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801578:	74 0b                	je     801585 <strlcpy+0x59>
  80157a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80157e:	0f b6 00             	movzbl (%rax),%eax
  801581:	84 c0                	test   %al,%al
  801583:	75 cc                	jne    801551 <strlcpy+0x25>
  801585:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801589:	c6 00 00             	movb   $0x0,(%rax)
  80158c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801590:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801594:	48 29 c2             	sub    %rax,%rdx
  801597:	48 89 d0             	mov    %rdx,%rax
  80159a:	c9                   	leaveq 
  80159b:	c3                   	retq   

000000000080159c <strcmp>:
  80159c:	55                   	push   %rbp
  80159d:	48 89 e5             	mov    %rsp,%rbp
  8015a0:	48 83 ec 10          	sub    $0x10,%rsp
  8015a4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015a8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8015ac:	eb 0a                	jmp    8015b8 <strcmp+0x1c>
  8015ae:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8015b3:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8015b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015bc:	0f b6 00             	movzbl (%rax),%eax
  8015bf:	84 c0                	test   %al,%al
  8015c1:	74 12                	je     8015d5 <strcmp+0x39>
  8015c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015c7:	0f b6 10             	movzbl (%rax),%edx
  8015ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015ce:	0f b6 00             	movzbl (%rax),%eax
  8015d1:	38 c2                	cmp    %al,%dl
  8015d3:	74 d9                	je     8015ae <strcmp+0x12>
  8015d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015d9:	0f b6 00             	movzbl (%rax),%eax
  8015dc:	0f b6 d0             	movzbl %al,%edx
  8015df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015e3:	0f b6 00             	movzbl (%rax),%eax
  8015e6:	0f b6 c0             	movzbl %al,%eax
  8015e9:	29 c2                	sub    %eax,%edx
  8015eb:	89 d0                	mov    %edx,%eax
  8015ed:	c9                   	leaveq 
  8015ee:	c3                   	retq   

00000000008015ef <strncmp>:
  8015ef:	55                   	push   %rbp
  8015f0:	48 89 e5             	mov    %rsp,%rbp
  8015f3:	48 83 ec 18          	sub    $0x18,%rsp
  8015f7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015fb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8015ff:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801603:	eb 0f                	jmp    801614 <strncmp+0x25>
  801605:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80160a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80160f:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801614:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801619:	74 1d                	je     801638 <strncmp+0x49>
  80161b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80161f:	0f b6 00             	movzbl (%rax),%eax
  801622:	84 c0                	test   %al,%al
  801624:	74 12                	je     801638 <strncmp+0x49>
  801626:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80162a:	0f b6 10             	movzbl (%rax),%edx
  80162d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801631:	0f b6 00             	movzbl (%rax),%eax
  801634:	38 c2                	cmp    %al,%dl
  801636:	74 cd                	je     801605 <strncmp+0x16>
  801638:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80163d:	75 07                	jne    801646 <strncmp+0x57>
  80163f:	b8 00 00 00 00       	mov    $0x0,%eax
  801644:	eb 18                	jmp    80165e <strncmp+0x6f>
  801646:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80164a:	0f b6 00             	movzbl (%rax),%eax
  80164d:	0f b6 d0             	movzbl %al,%edx
  801650:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801654:	0f b6 00             	movzbl (%rax),%eax
  801657:	0f b6 c0             	movzbl %al,%eax
  80165a:	29 c2                	sub    %eax,%edx
  80165c:	89 d0                	mov    %edx,%eax
  80165e:	c9                   	leaveq 
  80165f:	c3                   	retq   

0000000000801660 <strchr>:
  801660:	55                   	push   %rbp
  801661:	48 89 e5             	mov    %rsp,%rbp
  801664:	48 83 ec 10          	sub    $0x10,%rsp
  801668:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80166c:	89 f0                	mov    %esi,%eax
  80166e:	88 45 f4             	mov    %al,-0xc(%rbp)
  801671:	eb 17                	jmp    80168a <strchr+0x2a>
  801673:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801677:	0f b6 00             	movzbl (%rax),%eax
  80167a:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80167d:	75 06                	jne    801685 <strchr+0x25>
  80167f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801683:	eb 15                	jmp    80169a <strchr+0x3a>
  801685:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80168a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80168e:	0f b6 00             	movzbl (%rax),%eax
  801691:	84 c0                	test   %al,%al
  801693:	75 de                	jne    801673 <strchr+0x13>
  801695:	b8 00 00 00 00       	mov    $0x0,%eax
  80169a:	c9                   	leaveq 
  80169b:	c3                   	retq   

000000000080169c <strfind>:
  80169c:	55                   	push   %rbp
  80169d:	48 89 e5             	mov    %rsp,%rbp
  8016a0:	48 83 ec 10          	sub    $0x10,%rsp
  8016a4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8016a8:	89 f0                	mov    %esi,%eax
  8016aa:	88 45 f4             	mov    %al,-0xc(%rbp)
  8016ad:	eb 11                	jmp    8016c0 <strfind+0x24>
  8016af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016b3:	0f b6 00             	movzbl (%rax),%eax
  8016b6:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8016b9:	74 12                	je     8016cd <strfind+0x31>
  8016bb:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8016c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016c4:	0f b6 00             	movzbl (%rax),%eax
  8016c7:	84 c0                	test   %al,%al
  8016c9:	75 e4                	jne    8016af <strfind+0x13>
  8016cb:	eb 01                	jmp    8016ce <strfind+0x32>
  8016cd:	90                   	nop
  8016ce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016d2:	c9                   	leaveq 
  8016d3:	c3                   	retq   

00000000008016d4 <memset>:
  8016d4:	55                   	push   %rbp
  8016d5:	48 89 e5             	mov    %rsp,%rbp
  8016d8:	48 83 ec 18          	sub    $0x18,%rsp
  8016dc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8016e0:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8016e3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8016e7:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8016ec:	75 06                	jne    8016f4 <memset+0x20>
  8016ee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016f2:	eb 69                	jmp    80175d <memset+0x89>
  8016f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016f8:	83 e0 03             	and    $0x3,%eax
  8016fb:	48 85 c0             	test   %rax,%rax
  8016fe:	75 48                	jne    801748 <memset+0x74>
  801700:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801704:	83 e0 03             	and    $0x3,%eax
  801707:	48 85 c0             	test   %rax,%rax
  80170a:	75 3c                	jne    801748 <memset+0x74>
  80170c:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801713:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801716:	c1 e0 18             	shl    $0x18,%eax
  801719:	89 c2                	mov    %eax,%edx
  80171b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80171e:	c1 e0 10             	shl    $0x10,%eax
  801721:	09 c2                	or     %eax,%edx
  801723:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801726:	c1 e0 08             	shl    $0x8,%eax
  801729:	09 d0                	or     %edx,%eax
  80172b:	09 45 f4             	or     %eax,-0xc(%rbp)
  80172e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801732:	48 c1 e8 02          	shr    $0x2,%rax
  801736:	48 89 c1             	mov    %rax,%rcx
  801739:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80173d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801740:	48 89 d7             	mov    %rdx,%rdi
  801743:	fc                   	cld    
  801744:	f3 ab                	rep stos %eax,%es:(%rdi)
  801746:	eb 11                	jmp    801759 <memset+0x85>
  801748:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80174c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80174f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801753:	48 89 d7             	mov    %rdx,%rdi
  801756:	fc                   	cld    
  801757:	f3 aa                	rep stos %al,%es:(%rdi)
  801759:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80175d:	c9                   	leaveq 
  80175e:	c3                   	retq   

000000000080175f <memmove>:
  80175f:	55                   	push   %rbp
  801760:	48 89 e5             	mov    %rsp,%rbp
  801763:	48 83 ec 28          	sub    $0x28,%rsp
  801767:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80176b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80176f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801773:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801777:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80177b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80177f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801783:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801787:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80178b:	0f 83 88 00 00 00    	jae    801819 <memmove+0xba>
  801791:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801795:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801799:	48 01 d0             	add    %rdx,%rax
  80179c:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8017a0:	76 77                	jbe    801819 <memmove+0xba>
  8017a2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a6:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8017aa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017ae:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8017b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017b6:	83 e0 03             	and    $0x3,%eax
  8017b9:	48 85 c0             	test   %rax,%rax
  8017bc:	75 3b                	jne    8017f9 <memmove+0x9a>
  8017be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017c2:	83 e0 03             	and    $0x3,%eax
  8017c5:	48 85 c0             	test   %rax,%rax
  8017c8:	75 2f                	jne    8017f9 <memmove+0x9a>
  8017ca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017ce:	83 e0 03             	and    $0x3,%eax
  8017d1:	48 85 c0             	test   %rax,%rax
  8017d4:	75 23                	jne    8017f9 <memmove+0x9a>
  8017d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017da:	48 83 e8 04          	sub    $0x4,%rax
  8017de:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8017e2:	48 83 ea 04          	sub    $0x4,%rdx
  8017e6:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8017ea:	48 c1 e9 02          	shr    $0x2,%rcx
  8017ee:	48 89 c7             	mov    %rax,%rdi
  8017f1:	48 89 d6             	mov    %rdx,%rsi
  8017f4:	fd                   	std    
  8017f5:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8017f7:	eb 1d                	jmp    801816 <memmove+0xb7>
  8017f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017fd:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801801:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801805:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801809:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80180d:	48 89 d7             	mov    %rdx,%rdi
  801810:	48 89 c1             	mov    %rax,%rcx
  801813:	fd                   	std    
  801814:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801816:	fc                   	cld    
  801817:	eb 57                	jmp    801870 <memmove+0x111>
  801819:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80181d:	83 e0 03             	and    $0x3,%eax
  801820:	48 85 c0             	test   %rax,%rax
  801823:	75 36                	jne    80185b <memmove+0xfc>
  801825:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801829:	83 e0 03             	and    $0x3,%eax
  80182c:	48 85 c0             	test   %rax,%rax
  80182f:	75 2a                	jne    80185b <memmove+0xfc>
  801831:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801835:	83 e0 03             	and    $0x3,%eax
  801838:	48 85 c0             	test   %rax,%rax
  80183b:	75 1e                	jne    80185b <memmove+0xfc>
  80183d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801841:	48 c1 e8 02          	shr    $0x2,%rax
  801845:	48 89 c1             	mov    %rax,%rcx
  801848:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80184c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801850:	48 89 c7             	mov    %rax,%rdi
  801853:	48 89 d6             	mov    %rdx,%rsi
  801856:	fc                   	cld    
  801857:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801859:	eb 15                	jmp    801870 <memmove+0x111>
  80185b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80185f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801863:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801867:	48 89 c7             	mov    %rax,%rdi
  80186a:	48 89 d6             	mov    %rdx,%rsi
  80186d:	fc                   	cld    
  80186e:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801870:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801874:	c9                   	leaveq 
  801875:	c3                   	retq   

0000000000801876 <memcpy>:
  801876:	55                   	push   %rbp
  801877:	48 89 e5             	mov    %rsp,%rbp
  80187a:	48 83 ec 18          	sub    $0x18,%rsp
  80187e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801882:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801886:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80188a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80188e:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801892:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801896:	48 89 ce             	mov    %rcx,%rsi
  801899:	48 89 c7             	mov    %rax,%rdi
  80189c:	48 b8 5f 17 80 00 00 	movabs $0x80175f,%rax
  8018a3:	00 00 00 
  8018a6:	ff d0                	callq  *%rax
  8018a8:	c9                   	leaveq 
  8018a9:	c3                   	retq   

00000000008018aa <memcmp>:
  8018aa:	55                   	push   %rbp
  8018ab:	48 89 e5             	mov    %rsp,%rbp
  8018ae:	48 83 ec 28          	sub    $0x28,%rsp
  8018b2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8018b6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8018ba:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8018be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018c2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8018c6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8018ca:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8018ce:	eb 36                	jmp    801906 <memcmp+0x5c>
  8018d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018d4:	0f b6 10             	movzbl (%rax),%edx
  8018d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018db:	0f b6 00             	movzbl (%rax),%eax
  8018de:	38 c2                	cmp    %al,%dl
  8018e0:	74 1a                	je     8018fc <memcmp+0x52>
  8018e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018e6:	0f b6 00             	movzbl (%rax),%eax
  8018e9:	0f b6 d0             	movzbl %al,%edx
  8018ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018f0:	0f b6 00             	movzbl (%rax),%eax
  8018f3:	0f b6 c0             	movzbl %al,%eax
  8018f6:	29 c2                	sub    %eax,%edx
  8018f8:	89 d0                	mov    %edx,%eax
  8018fa:	eb 20                	jmp    80191c <memcmp+0x72>
  8018fc:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801901:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801906:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80190a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80190e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801912:	48 85 c0             	test   %rax,%rax
  801915:	75 b9                	jne    8018d0 <memcmp+0x26>
  801917:	b8 00 00 00 00       	mov    $0x0,%eax
  80191c:	c9                   	leaveq 
  80191d:	c3                   	retq   

000000000080191e <memfind>:
  80191e:	55                   	push   %rbp
  80191f:	48 89 e5             	mov    %rsp,%rbp
  801922:	48 83 ec 28          	sub    $0x28,%rsp
  801926:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80192a:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80192d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801931:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801935:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801939:	48 01 d0             	add    %rdx,%rax
  80193c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801940:	eb 13                	jmp    801955 <memfind+0x37>
  801942:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801946:	0f b6 00             	movzbl (%rax),%eax
  801949:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80194c:	38 d0                	cmp    %dl,%al
  80194e:	74 11                	je     801961 <memfind+0x43>
  801950:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801955:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801959:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80195d:	72 e3                	jb     801942 <memfind+0x24>
  80195f:	eb 01                	jmp    801962 <memfind+0x44>
  801961:	90                   	nop
  801962:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801966:	c9                   	leaveq 
  801967:	c3                   	retq   

0000000000801968 <strtol>:
  801968:	55                   	push   %rbp
  801969:	48 89 e5             	mov    %rsp,%rbp
  80196c:	48 83 ec 38          	sub    $0x38,%rsp
  801970:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801974:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801978:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80197b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801982:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801989:	00 
  80198a:	eb 05                	jmp    801991 <strtol+0x29>
  80198c:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801991:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801995:	0f b6 00             	movzbl (%rax),%eax
  801998:	3c 20                	cmp    $0x20,%al
  80199a:	74 f0                	je     80198c <strtol+0x24>
  80199c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019a0:	0f b6 00             	movzbl (%rax),%eax
  8019a3:	3c 09                	cmp    $0x9,%al
  8019a5:	74 e5                	je     80198c <strtol+0x24>
  8019a7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019ab:	0f b6 00             	movzbl (%rax),%eax
  8019ae:	3c 2b                	cmp    $0x2b,%al
  8019b0:	75 07                	jne    8019b9 <strtol+0x51>
  8019b2:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8019b7:	eb 17                	jmp    8019d0 <strtol+0x68>
  8019b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019bd:	0f b6 00             	movzbl (%rax),%eax
  8019c0:	3c 2d                	cmp    $0x2d,%al
  8019c2:	75 0c                	jne    8019d0 <strtol+0x68>
  8019c4:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8019c9:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8019d0:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8019d4:	74 06                	je     8019dc <strtol+0x74>
  8019d6:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8019da:	75 28                	jne    801a04 <strtol+0x9c>
  8019dc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019e0:	0f b6 00             	movzbl (%rax),%eax
  8019e3:	3c 30                	cmp    $0x30,%al
  8019e5:	75 1d                	jne    801a04 <strtol+0x9c>
  8019e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019eb:	48 83 c0 01          	add    $0x1,%rax
  8019ef:	0f b6 00             	movzbl (%rax),%eax
  8019f2:	3c 78                	cmp    $0x78,%al
  8019f4:	75 0e                	jne    801a04 <strtol+0x9c>
  8019f6:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8019fb:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801a02:	eb 2c                	jmp    801a30 <strtol+0xc8>
  801a04:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801a08:	75 19                	jne    801a23 <strtol+0xbb>
  801a0a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a0e:	0f b6 00             	movzbl (%rax),%eax
  801a11:	3c 30                	cmp    $0x30,%al
  801a13:	75 0e                	jne    801a23 <strtol+0xbb>
  801a15:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801a1a:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801a21:	eb 0d                	jmp    801a30 <strtol+0xc8>
  801a23:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801a27:	75 07                	jne    801a30 <strtol+0xc8>
  801a29:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801a30:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a34:	0f b6 00             	movzbl (%rax),%eax
  801a37:	3c 2f                	cmp    $0x2f,%al
  801a39:	7e 1d                	jle    801a58 <strtol+0xf0>
  801a3b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a3f:	0f b6 00             	movzbl (%rax),%eax
  801a42:	3c 39                	cmp    $0x39,%al
  801a44:	7f 12                	jg     801a58 <strtol+0xf0>
  801a46:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a4a:	0f b6 00             	movzbl (%rax),%eax
  801a4d:	0f be c0             	movsbl %al,%eax
  801a50:	83 e8 30             	sub    $0x30,%eax
  801a53:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801a56:	eb 4e                	jmp    801aa6 <strtol+0x13e>
  801a58:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a5c:	0f b6 00             	movzbl (%rax),%eax
  801a5f:	3c 60                	cmp    $0x60,%al
  801a61:	7e 1d                	jle    801a80 <strtol+0x118>
  801a63:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a67:	0f b6 00             	movzbl (%rax),%eax
  801a6a:	3c 7a                	cmp    $0x7a,%al
  801a6c:	7f 12                	jg     801a80 <strtol+0x118>
  801a6e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a72:	0f b6 00             	movzbl (%rax),%eax
  801a75:	0f be c0             	movsbl %al,%eax
  801a78:	83 e8 57             	sub    $0x57,%eax
  801a7b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801a7e:	eb 26                	jmp    801aa6 <strtol+0x13e>
  801a80:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a84:	0f b6 00             	movzbl (%rax),%eax
  801a87:	3c 40                	cmp    $0x40,%al
  801a89:	7e 47                	jle    801ad2 <strtol+0x16a>
  801a8b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a8f:	0f b6 00             	movzbl (%rax),%eax
  801a92:	3c 5a                	cmp    $0x5a,%al
  801a94:	7f 3c                	jg     801ad2 <strtol+0x16a>
  801a96:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a9a:	0f b6 00             	movzbl (%rax),%eax
  801a9d:	0f be c0             	movsbl %al,%eax
  801aa0:	83 e8 37             	sub    $0x37,%eax
  801aa3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801aa6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801aa9:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801aac:	7d 23                	jge    801ad1 <strtol+0x169>
  801aae:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801ab3:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801ab6:	48 98                	cltq   
  801ab8:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801abd:	48 89 c2             	mov    %rax,%rdx
  801ac0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801ac3:	48 98                	cltq   
  801ac5:	48 01 d0             	add    %rdx,%rax
  801ac8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801acc:	e9 5f ff ff ff       	jmpq   801a30 <strtol+0xc8>
  801ad1:	90                   	nop
  801ad2:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801ad7:	74 0b                	je     801ae4 <strtol+0x17c>
  801ad9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801add:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801ae1:	48 89 10             	mov    %rdx,(%rax)
  801ae4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801ae8:	74 09                	je     801af3 <strtol+0x18b>
  801aea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801aee:	48 f7 d8             	neg    %rax
  801af1:	eb 04                	jmp    801af7 <strtol+0x18f>
  801af3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801af7:	c9                   	leaveq 
  801af8:	c3                   	retq   

0000000000801af9 <strstr>:
  801af9:	55                   	push   %rbp
  801afa:	48 89 e5             	mov    %rsp,%rbp
  801afd:	48 83 ec 30          	sub    $0x30,%rsp
  801b01:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801b05:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801b09:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801b0d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801b11:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801b15:	0f b6 00             	movzbl (%rax),%eax
  801b18:	88 45 ff             	mov    %al,-0x1(%rbp)
  801b1b:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801b1f:	75 06                	jne    801b27 <strstr+0x2e>
  801b21:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b25:	eb 6b                	jmp    801b92 <strstr+0x99>
  801b27:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801b2b:	48 89 c7             	mov    %rax,%rdi
  801b2e:	48 b8 ce 13 80 00 00 	movabs $0x8013ce,%rax
  801b35:	00 00 00 
  801b38:	ff d0                	callq  *%rax
  801b3a:	48 98                	cltq   
  801b3c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801b40:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b44:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801b48:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801b4c:	0f b6 00             	movzbl (%rax),%eax
  801b4f:	88 45 ef             	mov    %al,-0x11(%rbp)
  801b52:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801b56:	75 07                	jne    801b5f <strstr+0x66>
  801b58:	b8 00 00 00 00       	mov    $0x0,%eax
  801b5d:	eb 33                	jmp    801b92 <strstr+0x99>
  801b5f:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801b63:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801b66:	75 d8                	jne    801b40 <strstr+0x47>
  801b68:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b6c:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801b70:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b74:	48 89 ce             	mov    %rcx,%rsi
  801b77:	48 89 c7             	mov    %rax,%rdi
  801b7a:	48 b8 ef 15 80 00 00 	movabs $0x8015ef,%rax
  801b81:	00 00 00 
  801b84:	ff d0                	callq  *%rax
  801b86:	85 c0                	test   %eax,%eax
  801b88:	75 b6                	jne    801b40 <strstr+0x47>
  801b8a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b8e:	48 83 e8 01          	sub    $0x1,%rax
  801b92:	c9                   	leaveq 
  801b93:	c3                   	retq   

0000000000801b94 <syscall>:
  801b94:	55                   	push   %rbp
  801b95:	48 89 e5             	mov    %rsp,%rbp
  801b98:	53                   	push   %rbx
  801b99:	48 83 ec 48          	sub    $0x48,%rsp
  801b9d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801ba0:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801ba3:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801ba7:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801bab:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801baf:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801bb3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801bb6:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801bba:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801bbe:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801bc2:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801bc6:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801bca:	4c 89 c3             	mov    %r8,%rbx
  801bcd:	cd 30                	int    $0x30
  801bcf:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801bd3:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801bd7:	74 3e                	je     801c17 <syscall+0x83>
  801bd9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801bde:	7e 37                	jle    801c17 <syscall+0x83>
  801be0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801be4:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801be7:	49 89 d0             	mov    %rdx,%r8
  801bea:	89 c1                	mov    %eax,%ecx
  801bec:	48 ba db 4a 80 00 00 	movabs $0x804adb,%rdx
  801bf3:	00 00 00 
  801bf6:	be 24 00 00 00       	mov    $0x24,%esi
  801bfb:	48 bf f8 4a 80 00 00 	movabs $0x804af8,%rdi
  801c02:	00 00 00 
  801c05:	b8 00 00 00 00       	mov    $0x0,%eax
  801c0a:	49 b9 12 05 80 00 00 	movabs $0x800512,%r9
  801c11:	00 00 00 
  801c14:	41 ff d1             	callq  *%r9
  801c17:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c1b:	48 83 c4 48          	add    $0x48,%rsp
  801c1f:	5b                   	pop    %rbx
  801c20:	5d                   	pop    %rbp
  801c21:	c3                   	retq   

0000000000801c22 <sys_cputs>:
  801c22:	55                   	push   %rbp
  801c23:	48 89 e5             	mov    %rsp,%rbp
  801c26:	48 83 ec 10          	sub    $0x10,%rsp
  801c2a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c2e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c32:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c36:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c3a:	48 83 ec 08          	sub    $0x8,%rsp
  801c3e:	6a 00                	pushq  $0x0
  801c40:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c46:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c4c:	48 89 d1             	mov    %rdx,%rcx
  801c4f:	48 89 c2             	mov    %rax,%rdx
  801c52:	be 00 00 00 00       	mov    $0x0,%esi
  801c57:	bf 00 00 00 00       	mov    $0x0,%edi
  801c5c:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  801c63:	00 00 00 
  801c66:	ff d0                	callq  *%rax
  801c68:	48 83 c4 10          	add    $0x10,%rsp
  801c6c:	90                   	nop
  801c6d:	c9                   	leaveq 
  801c6e:	c3                   	retq   

0000000000801c6f <sys_cgetc>:
  801c6f:	55                   	push   %rbp
  801c70:	48 89 e5             	mov    %rsp,%rbp
  801c73:	48 83 ec 08          	sub    $0x8,%rsp
  801c77:	6a 00                	pushq  $0x0
  801c79:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c7f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c85:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c8a:	ba 00 00 00 00       	mov    $0x0,%edx
  801c8f:	be 00 00 00 00       	mov    $0x0,%esi
  801c94:	bf 01 00 00 00       	mov    $0x1,%edi
  801c99:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  801ca0:	00 00 00 
  801ca3:	ff d0                	callq  *%rax
  801ca5:	48 83 c4 10          	add    $0x10,%rsp
  801ca9:	c9                   	leaveq 
  801caa:	c3                   	retq   

0000000000801cab <sys_env_destroy>:
  801cab:	55                   	push   %rbp
  801cac:	48 89 e5             	mov    %rsp,%rbp
  801caf:	48 83 ec 10          	sub    $0x10,%rsp
  801cb3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cb6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cb9:	48 98                	cltq   
  801cbb:	48 83 ec 08          	sub    $0x8,%rsp
  801cbf:	6a 00                	pushq  $0x0
  801cc1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cc7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ccd:	b9 00 00 00 00       	mov    $0x0,%ecx
  801cd2:	48 89 c2             	mov    %rax,%rdx
  801cd5:	be 01 00 00 00       	mov    $0x1,%esi
  801cda:	bf 03 00 00 00       	mov    $0x3,%edi
  801cdf:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  801ce6:	00 00 00 
  801ce9:	ff d0                	callq  *%rax
  801ceb:	48 83 c4 10          	add    $0x10,%rsp
  801cef:	c9                   	leaveq 
  801cf0:	c3                   	retq   

0000000000801cf1 <sys_getenvid>:
  801cf1:	55                   	push   %rbp
  801cf2:	48 89 e5             	mov    %rsp,%rbp
  801cf5:	48 83 ec 08          	sub    $0x8,%rsp
  801cf9:	6a 00                	pushq  $0x0
  801cfb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d01:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d07:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d0c:	ba 00 00 00 00       	mov    $0x0,%edx
  801d11:	be 00 00 00 00       	mov    $0x0,%esi
  801d16:	bf 02 00 00 00       	mov    $0x2,%edi
  801d1b:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  801d22:	00 00 00 
  801d25:	ff d0                	callq  *%rax
  801d27:	48 83 c4 10          	add    $0x10,%rsp
  801d2b:	c9                   	leaveq 
  801d2c:	c3                   	retq   

0000000000801d2d <sys_yield>:
  801d2d:	55                   	push   %rbp
  801d2e:	48 89 e5             	mov    %rsp,%rbp
  801d31:	48 83 ec 08          	sub    $0x8,%rsp
  801d35:	6a 00                	pushq  $0x0
  801d37:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d3d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d43:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d48:	ba 00 00 00 00       	mov    $0x0,%edx
  801d4d:	be 00 00 00 00       	mov    $0x0,%esi
  801d52:	bf 0b 00 00 00       	mov    $0xb,%edi
  801d57:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  801d5e:	00 00 00 
  801d61:	ff d0                	callq  *%rax
  801d63:	48 83 c4 10          	add    $0x10,%rsp
  801d67:	90                   	nop
  801d68:	c9                   	leaveq 
  801d69:	c3                   	retq   

0000000000801d6a <sys_page_alloc>:
  801d6a:	55                   	push   %rbp
  801d6b:	48 89 e5             	mov    %rsp,%rbp
  801d6e:	48 83 ec 10          	sub    $0x10,%rsp
  801d72:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d75:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d79:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d7c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d7f:	48 63 c8             	movslq %eax,%rcx
  801d82:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d86:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d89:	48 98                	cltq   
  801d8b:	48 83 ec 08          	sub    $0x8,%rsp
  801d8f:	6a 00                	pushq  $0x0
  801d91:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d97:	49 89 c8             	mov    %rcx,%r8
  801d9a:	48 89 d1             	mov    %rdx,%rcx
  801d9d:	48 89 c2             	mov    %rax,%rdx
  801da0:	be 01 00 00 00       	mov    $0x1,%esi
  801da5:	bf 04 00 00 00       	mov    $0x4,%edi
  801daa:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  801db1:	00 00 00 
  801db4:	ff d0                	callq  *%rax
  801db6:	48 83 c4 10          	add    $0x10,%rsp
  801dba:	c9                   	leaveq 
  801dbb:	c3                   	retq   

0000000000801dbc <sys_page_map>:
  801dbc:	55                   	push   %rbp
  801dbd:	48 89 e5             	mov    %rsp,%rbp
  801dc0:	48 83 ec 20          	sub    $0x20,%rsp
  801dc4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801dc7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801dcb:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801dce:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801dd2:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801dd6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801dd9:	48 63 c8             	movslq %eax,%rcx
  801ddc:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801de0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801de3:	48 63 f0             	movslq %eax,%rsi
  801de6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801dea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ded:	48 98                	cltq   
  801def:	48 83 ec 08          	sub    $0x8,%rsp
  801df3:	51                   	push   %rcx
  801df4:	49 89 f9             	mov    %rdi,%r9
  801df7:	49 89 f0             	mov    %rsi,%r8
  801dfa:	48 89 d1             	mov    %rdx,%rcx
  801dfd:	48 89 c2             	mov    %rax,%rdx
  801e00:	be 01 00 00 00       	mov    $0x1,%esi
  801e05:	bf 05 00 00 00       	mov    $0x5,%edi
  801e0a:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  801e11:	00 00 00 
  801e14:	ff d0                	callq  *%rax
  801e16:	48 83 c4 10          	add    $0x10,%rsp
  801e1a:	c9                   	leaveq 
  801e1b:	c3                   	retq   

0000000000801e1c <sys_page_unmap>:
  801e1c:	55                   	push   %rbp
  801e1d:	48 89 e5             	mov    %rsp,%rbp
  801e20:	48 83 ec 10          	sub    $0x10,%rsp
  801e24:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e27:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e2b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e2f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e32:	48 98                	cltq   
  801e34:	48 83 ec 08          	sub    $0x8,%rsp
  801e38:	6a 00                	pushq  $0x0
  801e3a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e40:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e46:	48 89 d1             	mov    %rdx,%rcx
  801e49:	48 89 c2             	mov    %rax,%rdx
  801e4c:	be 01 00 00 00       	mov    $0x1,%esi
  801e51:	bf 06 00 00 00       	mov    $0x6,%edi
  801e56:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  801e5d:	00 00 00 
  801e60:	ff d0                	callq  *%rax
  801e62:	48 83 c4 10          	add    $0x10,%rsp
  801e66:	c9                   	leaveq 
  801e67:	c3                   	retq   

0000000000801e68 <sys_env_set_status>:
  801e68:	55                   	push   %rbp
  801e69:	48 89 e5             	mov    %rsp,%rbp
  801e6c:	48 83 ec 10          	sub    $0x10,%rsp
  801e70:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e73:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801e76:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e79:	48 63 d0             	movslq %eax,%rdx
  801e7c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e7f:	48 98                	cltq   
  801e81:	48 83 ec 08          	sub    $0x8,%rsp
  801e85:	6a 00                	pushq  $0x0
  801e87:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e8d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e93:	48 89 d1             	mov    %rdx,%rcx
  801e96:	48 89 c2             	mov    %rax,%rdx
  801e99:	be 01 00 00 00       	mov    $0x1,%esi
  801e9e:	bf 08 00 00 00       	mov    $0x8,%edi
  801ea3:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  801eaa:	00 00 00 
  801ead:	ff d0                	callq  *%rax
  801eaf:	48 83 c4 10          	add    $0x10,%rsp
  801eb3:	c9                   	leaveq 
  801eb4:	c3                   	retq   

0000000000801eb5 <sys_env_set_trapframe>:
  801eb5:	55                   	push   %rbp
  801eb6:	48 89 e5             	mov    %rsp,%rbp
  801eb9:	48 83 ec 10          	sub    $0x10,%rsp
  801ebd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ec0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ec4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ec8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ecb:	48 98                	cltq   
  801ecd:	48 83 ec 08          	sub    $0x8,%rsp
  801ed1:	6a 00                	pushq  $0x0
  801ed3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ed9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801edf:	48 89 d1             	mov    %rdx,%rcx
  801ee2:	48 89 c2             	mov    %rax,%rdx
  801ee5:	be 01 00 00 00       	mov    $0x1,%esi
  801eea:	bf 09 00 00 00       	mov    $0x9,%edi
  801eef:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  801ef6:	00 00 00 
  801ef9:	ff d0                	callq  *%rax
  801efb:	48 83 c4 10          	add    $0x10,%rsp
  801eff:	c9                   	leaveq 
  801f00:	c3                   	retq   

0000000000801f01 <sys_env_set_pgfault_upcall>:
  801f01:	55                   	push   %rbp
  801f02:	48 89 e5             	mov    %rsp,%rbp
  801f05:	48 83 ec 10          	sub    $0x10,%rsp
  801f09:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f0c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f10:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f14:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f17:	48 98                	cltq   
  801f19:	48 83 ec 08          	sub    $0x8,%rsp
  801f1d:	6a 00                	pushq  $0x0
  801f1f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f25:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f2b:	48 89 d1             	mov    %rdx,%rcx
  801f2e:	48 89 c2             	mov    %rax,%rdx
  801f31:	be 01 00 00 00       	mov    $0x1,%esi
  801f36:	bf 0a 00 00 00       	mov    $0xa,%edi
  801f3b:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  801f42:	00 00 00 
  801f45:	ff d0                	callq  *%rax
  801f47:	48 83 c4 10          	add    $0x10,%rsp
  801f4b:	c9                   	leaveq 
  801f4c:	c3                   	retq   

0000000000801f4d <sys_ipc_try_send>:
  801f4d:	55                   	push   %rbp
  801f4e:	48 89 e5             	mov    %rsp,%rbp
  801f51:	48 83 ec 20          	sub    $0x20,%rsp
  801f55:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f58:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f5c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801f60:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801f63:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f66:	48 63 f0             	movslq %eax,%rsi
  801f69:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801f6d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f70:	48 98                	cltq   
  801f72:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f76:	48 83 ec 08          	sub    $0x8,%rsp
  801f7a:	6a 00                	pushq  $0x0
  801f7c:	49 89 f1             	mov    %rsi,%r9
  801f7f:	49 89 c8             	mov    %rcx,%r8
  801f82:	48 89 d1             	mov    %rdx,%rcx
  801f85:	48 89 c2             	mov    %rax,%rdx
  801f88:	be 00 00 00 00       	mov    $0x0,%esi
  801f8d:	bf 0c 00 00 00       	mov    $0xc,%edi
  801f92:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  801f99:	00 00 00 
  801f9c:	ff d0                	callq  *%rax
  801f9e:	48 83 c4 10          	add    $0x10,%rsp
  801fa2:	c9                   	leaveq 
  801fa3:	c3                   	retq   

0000000000801fa4 <sys_ipc_recv>:
  801fa4:	55                   	push   %rbp
  801fa5:	48 89 e5             	mov    %rsp,%rbp
  801fa8:	48 83 ec 10          	sub    $0x10,%rsp
  801fac:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801fb0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fb4:	48 83 ec 08          	sub    $0x8,%rsp
  801fb8:	6a 00                	pushq  $0x0
  801fba:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fc0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fc6:	b9 00 00 00 00       	mov    $0x0,%ecx
  801fcb:	48 89 c2             	mov    %rax,%rdx
  801fce:	be 01 00 00 00       	mov    $0x1,%esi
  801fd3:	bf 0d 00 00 00       	mov    $0xd,%edi
  801fd8:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  801fdf:	00 00 00 
  801fe2:	ff d0                	callq  *%rax
  801fe4:	48 83 c4 10          	add    $0x10,%rsp
  801fe8:	c9                   	leaveq 
  801fe9:	c3                   	retq   

0000000000801fea <sys_time_msec>:
  801fea:	55                   	push   %rbp
  801feb:	48 89 e5             	mov    %rsp,%rbp
  801fee:	48 83 ec 08          	sub    $0x8,%rsp
  801ff2:	6a 00                	pushq  $0x0
  801ff4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ffa:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802000:	b9 00 00 00 00       	mov    $0x0,%ecx
  802005:	ba 00 00 00 00       	mov    $0x0,%edx
  80200a:	be 00 00 00 00       	mov    $0x0,%esi
  80200f:	bf 0e 00 00 00       	mov    $0xe,%edi
  802014:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  80201b:	00 00 00 
  80201e:	ff d0                	callq  *%rax
  802020:	48 83 c4 10          	add    $0x10,%rsp
  802024:	c9                   	leaveq 
  802025:	c3                   	retq   

0000000000802026 <sys_net_transmit>:
  802026:	55                   	push   %rbp
  802027:	48 89 e5             	mov    %rsp,%rbp
  80202a:	48 83 ec 10          	sub    $0x10,%rsp
  80202e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802032:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802035:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802038:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80203c:	48 83 ec 08          	sub    $0x8,%rsp
  802040:	6a 00                	pushq  $0x0
  802042:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802048:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80204e:	48 89 d1             	mov    %rdx,%rcx
  802051:	48 89 c2             	mov    %rax,%rdx
  802054:	be 00 00 00 00       	mov    $0x0,%esi
  802059:	bf 0f 00 00 00       	mov    $0xf,%edi
  80205e:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  802065:	00 00 00 
  802068:	ff d0                	callq  *%rax
  80206a:	48 83 c4 10          	add    $0x10,%rsp
  80206e:	c9                   	leaveq 
  80206f:	c3                   	retq   

0000000000802070 <sys_net_receive>:
  802070:	55                   	push   %rbp
  802071:	48 89 e5             	mov    %rsp,%rbp
  802074:	48 83 ec 10          	sub    $0x10,%rsp
  802078:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80207c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80207f:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802082:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802086:	48 83 ec 08          	sub    $0x8,%rsp
  80208a:	6a 00                	pushq  $0x0
  80208c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802092:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802098:	48 89 d1             	mov    %rdx,%rcx
  80209b:	48 89 c2             	mov    %rax,%rdx
  80209e:	be 00 00 00 00       	mov    $0x0,%esi
  8020a3:	bf 10 00 00 00       	mov    $0x10,%edi
  8020a8:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  8020af:	00 00 00 
  8020b2:	ff d0                	callq  *%rax
  8020b4:	48 83 c4 10          	add    $0x10,%rsp
  8020b8:	c9                   	leaveq 
  8020b9:	c3                   	retq   

00000000008020ba <sys_ept_map>:
  8020ba:	55                   	push   %rbp
  8020bb:	48 89 e5             	mov    %rsp,%rbp
  8020be:	48 83 ec 20          	sub    $0x20,%rsp
  8020c2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8020c5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8020c9:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8020cc:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8020d0:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8020d4:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8020d7:	48 63 c8             	movslq %eax,%rcx
  8020da:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8020de:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020e1:	48 63 f0             	movslq %eax,%rsi
  8020e4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8020e8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020eb:	48 98                	cltq   
  8020ed:	48 83 ec 08          	sub    $0x8,%rsp
  8020f1:	51                   	push   %rcx
  8020f2:	49 89 f9             	mov    %rdi,%r9
  8020f5:	49 89 f0             	mov    %rsi,%r8
  8020f8:	48 89 d1             	mov    %rdx,%rcx
  8020fb:	48 89 c2             	mov    %rax,%rdx
  8020fe:	be 00 00 00 00       	mov    $0x0,%esi
  802103:	bf 11 00 00 00       	mov    $0x11,%edi
  802108:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  80210f:	00 00 00 
  802112:	ff d0                	callq  *%rax
  802114:	48 83 c4 10          	add    $0x10,%rsp
  802118:	c9                   	leaveq 
  802119:	c3                   	retq   

000000000080211a <sys_env_mkguest>:
  80211a:	55                   	push   %rbp
  80211b:	48 89 e5             	mov    %rsp,%rbp
  80211e:	48 83 ec 10          	sub    $0x10,%rsp
  802122:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802126:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80212a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80212e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802132:	48 83 ec 08          	sub    $0x8,%rsp
  802136:	6a 00                	pushq  $0x0
  802138:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80213e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802144:	48 89 d1             	mov    %rdx,%rcx
  802147:	48 89 c2             	mov    %rax,%rdx
  80214a:	be 00 00 00 00       	mov    $0x0,%esi
  80214f:	bf 12 00 00 00       	mov    $0x12,%edi
  802154:	48 b8 94 1b 80 00 00 	movabs $0x801b94,%rax
  80215b:	00 00 00 
  80215e:	ff d0                	callq  *%rax
  802160:	48 83 c4 10          	add    $0x10,%rsp
  802164:	c9                   	leaveq 
  802165:	c3                   	retq   

0000000000802166 <fd2num>:
  802166:	55                   	push   %rbp
  802167:	48 89 e5             	mov    %rsp,%rbp
  80216a:	48 83 ec 08          	sub    $0x8,%rsp
  80216e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802172:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802176:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  80217d:	ff ff ff 
  802180:	48 01 d0             	add    %rdx,%rax
  802183:	48 c1 e8 0c          	shr    $0xc,%rax
  802187:	c9                   	leaveq 
  802188:	c3                   	retq   

0000000000802189 <fd2data>:
  802189:	55                   	push   %rbp
  80218a:	48 89 e5             	mov    %rsp,%rbp
  80218d:	48 83 ec 08          	sub    $0x8,%rsp
  802191:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802195:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802199:	48 89 c7             	mov    %rax,%rdi
  80219c:	48 b8 66 21 80 00 00 	movabs $0x802166,%rax
  8021a3:	00 00 00 
  8021a6:	ff d0                	callq  *%rax
  8021a8:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  8021ae:	48 c1 e0 0c          	shl    $0xc,%rax
  8021b2:	c9                   	leaveq 
  8021b3:	c3                   	retq   

00000000008021b4 <fd_alloc>:
  8021b4:	55                   	push   %rbp
  8021b5:	48 89 e5             	mov    %rsp,%rbp
  8021b8:	48 83 ec 18          	sub    $0x18,%rsp
  8021bc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8021c0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8021c7:	eb 6b                	jmp    802234 <fd_alloc+0x80>
  8021c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021cc:	48 98                	cltq   
  8021ce:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8021d4:	48 c1 e0 0c          	shl    $0xc,%rax
  8021d8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8021dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021e0:	48 c1 e8 15          	shr    $0x15,%rax
  8021e4:	48 89 c2             	mov    %rax,%rdx
  8021e7:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8021ee:	01 00 00 
  8021f1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021f5:	83 e0 01             	and    $0x1,%eax
  8021f8:	48 85 c0             	test   %rax,%rax
  8021fb:	74 21                	je     80221e <fd_alloc+0x6a>
  8021fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802201:	48 c1 e8 0c          	shr    $0xc,%rax
  802205:	48 89 c2             	mov    %rax,%rdx
  802208:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80220f:	01 00 00 
  802212:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802216:	83 e0 01             	and    $0x1,%eax
  802219:	48 85 c0             	test   %rax,%rax
  80221c:	75 12                	jne    802230 <fd_alloc+0x7c>
  80221e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802222:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802226:	48 89 10             	mov    %rdx,(%rax)
  802229:	b8 00 00 00 00       	mov    $0x0,%eax
  80222e:	eb 1a                	jmp    80224a <fd_alloc+0x96>
  802230:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802234:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802238:	7e 8f                	jle    8021c9 <fd_alloc+0x15>
  80223a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80223e:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802245:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  80224a:	c9                   	leaveq 
  80224b:	c3                   	retq   

000000000080224c <fd_lookup>:
  80224c:	55                   	push   %rbp
  80224d:	48 89 e5             	mov    %rsp,%rbp
  802250:	48 83 ec 20          	sub    $0x20,%rsp
  802254:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802257:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80225b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80225f:	78 06                	js     802267 <fd_lookup+0x1b>
  802261:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802265:	7e 07                	jle    80226e <fd_lookup+0x22>
  802267:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80226c:	eb 6c                	jmp    8022da <fd_lookup+0x8e>
  80226e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802271:	48 98                	cltq   
  802273:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802279:	48 c1 e0 0c          	shl    $0xc,%rax
  80227d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802281:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802285:	48 c1 e8 15          	shr    $0x15,%rax
  802289:	48 89 c2             	mov    %rax,%rdx
  80228c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802293:	01 00 00 
  802296:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80229a:	83 e0 01             	and    $0x1,%eax
  80229d:	48 85 c0             	test   %rax,%rax
  8022a0:	74 21                	je     8022c3 <fd_lookup+0x77>
  8022a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022a6:	48 c1 e8 0c          	shr    $0xc,%rax
  8022aa:	48 89 c2             	mov    %rax,%rdx
  8022ad:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022b4:	01 00 00 
  8022b7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022bb:	83 e0 01             	and    $0x1,%eax
  8022be:	48 85 c0             	test   %rax,%rax
  8022c1:	75 07                	jne    8022ca <fd_lookup+0x7e>
  8022c3:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8022c8:	eb 10                	jmp    8022da <fd_lookup+0x8e>
  8022ca:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8022ce:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8022d2:	48 89 10             	mov    %rdx,(%rax)
  8022d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8022da:	c9                   	leaveq 
  8022db:	c3                   	retq   

00000000008022dc <fd_close>:
  8022dc:	55                   	push   %rbp
  8022dd:	48 89 e5             	mov    %rsp,%rbp
  8022e0:	48 83 ec 30          	sub    $0x30,%rsp
  8022e4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8022e8:	89 f0                	mov    %esi,%eax
  8022ea:	88 45 d4             	mov    %al,-0x2c(%rbp)
  8022ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8022f1:	48 89 c7             	mov    %rax,%rdi
  8022f4:	48 b8 66 21 80 00 00 	movabs $0x802166,%rax
  8022fb:	00 00 00 
  8022fe:	ff d0                	callq  *%rax
  802300:	89 c2                	mov    %eax,%edx
  802302:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802306:	48 89 c6             	mov    %rax,%rsi
  802309:	89 d7                	mov    %edx,%edi
  80230b:	48 b8 4c 22 80 00 00 	movabs $0x80224c,%rax
  802312:	00 00 00 
  802315:	ff d0                	callq  *%rax
  802317:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80231a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80231e:	78 0a                	js     80232a <fd_close+0x4e>
  802320:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802324:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802328:	74 12                	je     80233c <fd_close+0x60>
  80232a:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  80232e:	74 05                	je     802335 <fd_close+0x59>
  802330:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802333:	eb 70                	jmp    8023a5 <fd_close+0xc9>
  802335:	b8 00 00 00 00       	mov    $0x0,%eax
  80233a:	eb 69                	jmp    8023a5 <fd_close+0xc9>
  80233c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802340:	8b 00                	mov    (%rax),%eax
  802342:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802346:	48 89 d6             	mov    %rdx,%rsi
  802349:	89 c7                	mov    %eax,%edi
  80234b:	48 b8 a7 23 80 00 00 	movabs $0x8023a7,%rax
  802352:	00 00 00 
  802355:	ff d0                	callq  *%rax
  802357:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80235a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80235e:	78 2a                	js     80238a <fd_close+0xae>
  802360:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802364:	48 8b 40 20          	mov    0x20(%rax),%rax
  802368:	48 85 c0             	test   %rax,%rax
  80236b:	74 16                	je     802383 <fd_close+0xa7>
  80236d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802371:	48 8b 40 20          	mov    0x20(%rax),%rax
  802375:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802379:	48 89 d7             	mov    %rdx,%rdi
  80237c:	ff d0                	callq  *%rax
  80237e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802381:	eb 07                	jmp    80238a <fd_close+0xae>
  802383:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80238a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80238e:	48 89 c6             	mov    %rax,%rsi
  802391:	bf 00 00 00 00       	mov    $0x0,%edi
  802396:	48 b8 1c 1e 80 00 00 	movabs $0x801e1c,%rax
  80239d:	00 00 00 
  8023a0:	ff d0                	callq  *%rax
  8023a2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023a5:	c9                   	leaveq 
  8023a6:	c3                   	retq   

00000000008023a7 <dev_lookup>:
  8023a7:	55                   	push   %rbp
  8023a8:	48 89 e5             	mov    %rsp,%rbp
  8023ab:	48 83 ec 20          	sub    $0x20,%rsp
  8023af:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8023b2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8023b6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8023bd:	eb 41                	jmp    802400 <dev_lookup+0x59>
  8023bf:	48 b8 40 60 80 00 00 	movabs $0x806040,%rax
  8023c6:	00 00 00 
  8023c9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8023cc:	48 63 d2             	movslq %edx,%rdx
  8023cf:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8023d3:	8b 00                	mov    (%rax),%eax
  8023d5:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8023d8:	75 22                	jne    8023fc <dev_lookup+0x55>
  8023da:	48 b8 40 60 80 00 00 	movabs $0x806040,%rax
  8023e1:	00 00 00 
  8023e4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8023e7:	48 63 d2             	movslq %edx,%rdx
  8023ea:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8023ee:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8023f2:	48 89 10             	mov    %rdx,(%rax)
  8023f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8023fa:	eb 60                	jmp    80245c <dev_lookup+0xb5>
  8023fc:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802400:	48 b8 40 60 80 00 00 	movabs $0x806040,%rax
  802407:	00 00 00 
  80240a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80240d:	48 63 d2             	movslq %edx,%rdx
  802410:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802414:	48 85 c0             	test   %rax,%rax
  802417:	75 a6                	jne    8023bf <dev_lookup+0x18>
  802419:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  802420:	00 00 00 
  802423:	48 8b 00             	mov    (%rax),%rax
  802426:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80242c:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80242f:	89 c6                	mov    %eax,%esi
  802431:	48 bf 10 4b 80 00 00 	movabs $0x804b10,%rdi
  802438:	00 00 00 
  80243b:	b8 00 00 00 00       	mov    $0x0,%eax
  802440:	48 b9 4c 07 80 00 00 	movabs $0x80074c,%rcx
  802447:	00 00 00 
  80244a:	ff d1                	callq  *%rcx
  80244c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802450:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802457:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80245c:	c9                   	leaveq 
  80245d:	c3                   	retq   

000000000080245e <close>:
  80245e:	55                   	push   %rbp
  80245f:	48 89 e5             	mov    %rsp,%rbp
  802462:	48 83 ec 20          	sub    $0x20,%rsp
  802466:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802469:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80246d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802470:	48 89 d6             	mov    %rdx,%rsi
  802473:	89 c7                	mov    %eax,%edi
  802475:	48 b8 4c 22 80 00 00 	movabs $0x80224c,%rax
  80247c:	00 00 00 
  80247f:	ff d0                	callq  *%rax
  802481:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802484:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802488:	79 05                	jns    80248f <close+0x31>
  80248a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80248d:	eb 18                	jmp    8024a7 <close+0x49>
  80248f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802493:	be 01 00 00 00       	mov    $0x1,%esi
  802498:	48 89 c7             	mov    %rax,%rdi
  80249b:	48 b8 dc 22 80 00 00 	movabs $0x8022dc,%rax
  8024a2:	00 00 00 
  8024a5:	ff d0                	callq  *%rax
  8024a7:	c9                   	leaveq 
  8024a8:	c3                   	retq   

00000000008024a9 <close_all>:
  8024a9:	55                   	push   %rbp
  8024aa:	48 89 e5             	mov    %rsp,%rbp
  8024ad:	48 83 ec 10          	sub    $0x10,%rsp
  8024b1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8024b8:	eb 15                	jmp    8024cf <close_all+0x26>
  8024ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024bd:	89 c7                	mov    %eax,%edi
  8024bf:	48 b8 5e 24 80 00 00 	movabs $0x80245e,%rax
  8024c6:	00 00 00 
  8024c9:	ff d0                	callq  *%rax
  8024cb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8024cf:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8024d3:	7e e5                	jle    8024ba <close_all+0x11>
  8024d5:	90                   	nop
  8024d6:	c9                   	leaveq 
  8024d7:	c3                   	retq   

00000000008024d8 <dup>:
  8024d8:	55                   	push   %rbp
  8024d9:	48 89 e5             	mov    %rsp,%rbp
  8024dc:	48 83 ec 40          	sub    $0x40,%rsp
  8024e0:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8024e3:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8024e6:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8024ea:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8024ed:	48 89 d6             	mov    %rdx,%rsi
  8024f0:	89 c7                	mov    %eax,%edi
  8024f2:	48 b8 4c 22 80 00 00 	movabs $0x80224c,%rax
  8024f9:	00 00 00 
  8024fc:	ff d0                	callq  *%rax
  8024fe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802501:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802505:	79 08                	jns    80250f <dup+0x37>
  802507:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80250a:	e9 70 01 00 00       	jmpq   80267f <dup+0x1a7>
  80250f:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802512:	89 c7                	mov    %eax,%edi
  802514:	48 b8 5e 24 80 00 00 	movabs $0x80245e,%rax
  80251b:	00 00 00 
  80251e:	ff d0                	callq  *%rax
  802520:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802523:	48 98                	cltq   
  802525:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80252b:	48 c1 e0 0c          	shl    $0xc,%rax
  80252f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802533:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802537:	48 89 c7             	mov    %rax,%rdi
  80253a:	48 b8 89 21 80 00 00 	movabs $0x802189,%rax
  802541:	00 00 00 
  802544:	ff d0                	callq  *%rax
  802546:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80254a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80254e:	48 89 c7             	mov    %rax,%rdi
  802551:	48 b8 89 21 80 00 00 	movabs $0x802189,%rax
  802558:	00 00 00 
  80255b:	ff d0                	callq  *%rax
  80255d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802561:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802565:	48 c1 e8 15          	shr    $0x15,%rax
  802569:	48 89 c2             	mov    %rax,%rdx
  80256c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802573:	01 00 00 
  802576:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80257a:	83 e0 01             	and    $0x1,%eax
  80257d:	48 85 c0             	test   %rax,%rax
  802580:	74 71                	je     8025f3 <dup+0x11b>
  802582:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802586:	48 c1 e8 0c          	shr    $0xc,%rax
  80258a:	48 89 c2             	mov    %rax,%rdx
  80258d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802594:	01 00 00 
  802597:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80259b:	83 e0 01             	and    $0x1,%eax
  80259e:	48 85 c0             	test   %rax,%rax
  8025a1:	74 50                	je     8025f3 <dup+0x11b>
  8025a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025a7:	48 c1 e8 0c          	shr    $0xc,%rax
  8025ab:	48 89 c2             	mov    %rax,%rdx
  8025ae:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8025b5:	01 00 00 
  8025b8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8025bc:	25 07 0e 00 00       	and    $0xe07,%eax
  8025c1:	89 c1                	mov    %eax,%ecx
  8025c3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8025c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025cb:	41 89 c8             	mov    %ecx,%r8d
  8025ce:	48 89 d1             	mov    %rdx,%rcx
  8025d1:	ba 00 00 00 00       	mov    $0x0,%edx
  8025d6:	48 89 c6             	mov    %rax,%rsi
  8025d9:	bf 00 00 00 00       	mov    $0x0,%edi
  8025de:	48 b8 bc 1d 80 00 00 	movabs $0x801dbc,%rax
  8025e5:	00 00 00 
  8025e8:	ff d0                	callq  *%rax
  8025ea:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025ed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025f1:	78 55                	js     802648 <dup+0x170>
  8025f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8025f7:	48 c1 e8 0c          	shr    $0xc,%rax
  8025fb:	48 89 c2             	mov    %rax,%rdx
  8025fe:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802605:	01 00 00 
  802608:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80260c:	25 07 0e 00 00       	and    $0xe07,%eax
  802611:	89 c1                	mov    %eax,%ecx
  802613:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802617:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80261b:	41 89 c8             	mov    %ecx,%r8d
  80261e:	48 89 d1             	mov    %rdx,%rcx
  802621:	ba 00 00 00 00       	mov    $0x0,%edx
  802626:	48 89 c6             	mov    %rax,%rsi
  802629:	bf 00 00 00 00       	mov    $0x0,%edi
  80262e:	48 b8 bc 1d 80 00 00 	movabs $0x801dbc,%rax
  802635:	00 00 00 
  802638:	ff d0                	callq  *%rax
  80263a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80263d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802641:	78 08                	js     80264b <dup+0x173>
  802643:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802646:	eb 37                	jmp    80267f <dup+0x1a7>
  802648:	90                   	nop
  802649:	eb 01                	jmp    80264c <dup+0x174>
  80264b:	90                   	nop
  80264c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802650:	48 89 c6             	mov    %rax,%rsi
  802653:	bf 00 00 00 00       	mov    $0x0,%edi
  802658:	48 b8 1c 1e 80 00 00 	movabs $0x801e1c,%rax
  80265f:	00 00 00 
  802662:	ff d0                	callq  *%rax
  802664:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802668:	48 89 c6             	mov    %rax,%rsi
  80266b:	bf 00 00 00 00       	mov    $0x0,%edi
  802670:	48 b8 1c 1e 80 00 00 	movabs $0x801e1c,%rax
  802677:	00 00 00 
  80267a:	ff d0                	callq  *%rax
  80267c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80267f:	c9                   	leaveq 
  802680:	c3                   	retq   

0000000000802681 <read>:
  802681:	55                   	push   %rbp
  802682:	48 89 e5             	mov    %rsp,%rbp
  802685:	48 83 ec 40          	sub    $0x40,%rsp
  802689:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80268c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802690:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802694:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802698:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80269b:	48 89 d6             	mov    %rdx,%rsi
  80269e:	89 c7                	mov    %eax,%edi
  8026a0:	48 b8 4c 22 80 00 00 	movabs $0x80224c,%rax
  8026a7:	00 00 00 
  8026aa:	ff d0                	callq  *%rax
  8026ac:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026af:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026b3:	78 24                	js     8026d9 <read+0x58>
  8026b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026b9:	8b 00                	mov    (%rax),%eax
  8026bb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8026bf:	48 89 d6             	mov    %rdx,%rsi
  8026c2:	89 c7                	mov    %eax,%edi
  8026c4:	48 b8 a7 23 80 00 00 	movabs $0x8023a7,%rax
  8026cb:	00 00 00 
  8026ce:	ff d0                	callq  *%rax
  8026d0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026d3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026d7:	79 05                	jns    8026de <read+0x5d>
  8026d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026dc:	eb 76                	jmp    802754 <read+0xd3>
  8026de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026e2:	8b 40 08             	mov    0x8(%rax),%eax
  8026e5:	83 e0 03             	and    $0x3,%eax
  8026e8:	83 f8 01             	cmp    $0x1,%eax
  8026eb:	75 3a                	jne    802727 <read+0xa6>
  8026ed:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  8026f4:	00 00 00 
  8026f7:	48 8b 00             	mov    (%rax),%rax
  8026fa:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802700:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802703:	89 c6                	mov    %eax,%esi
  802705:	48 bf 2f 4b 80 00 00 	movabs $0x804b2f,%rdi
  80270c:	00 00 00 
  80270f:	b8 00 00 00 00       	mov    $0x0,%eax
  802714:	48 b9 4c 07 80 00 00 	movabs $0x80074c,%rcx
  80271b:	00 00 00 
  80271e:	ff d1                	callq  *%rcx
  802720:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802725:	eb 2d                	jmp    802754 <read+0xd3>
  802727:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80272b:	48 8b 40 10          	mov    0x10(%rax),%rax
  80272f:	48 85 c0             	test   %rax,%rax
  802732:	75 07                	jne    80273b <read+0xba>
  802734:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802739:	eb 19                	jmp    802754 <read+0xd3>
  80273b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80273f:	48 8b 40 10          	mov    0x10(%rax),%rax
  802743:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802747:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80274b:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80274f:	48 89 cf             	mov    %rcx,%rdi
  802752:	ff d0                	callq  *%rax
  802754:	c9                   	leaveq 
  802755:	c3                   	retq   

0000000000802756 <readn>:
  802756:	55                   	push   %rbp
  802757:	48 89 e5             	mov    %rsp,%rbp
  80275a:	48 83 ec 30          	sub    $0x30,%rsp
  80275e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802761:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802765:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802769:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802770:	eb 47                	jmp    8027b9 <readn+0x63>
  802772:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802775:	48 98                	cltq   
  802777:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80277b:	48 29 c2             	sub    %rax,%rdx
  80277e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802781:	48 63 c8             	movslq %eax,%rcx
  802784:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802788:	48 01 c1             	add    %rax,%rcx
  80278b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80278e:	48 89 ce             	mov    %rcx,%rsi
  802791:	89 c7                	mov    %eax,%edi
  802793:	48 b8 81 26 80 00 00 	movabs $0x802681,%rax
  80279a:	00 00 00 
  80279d:	ff d0                	callq  *%rax
  80279f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8027a2:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8027a6:	79 05                	jns    8027ad <readn+0x57>
  8027a8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8027ab:	eb 1d                	jmp    8027ca <readn+0x74>
  8027ad:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8027b1:	74 13                	je     8027c6 <readn+0x70>
  8027b3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8027b6:	01 45 fc             	add    %eax,-0x4(%rbp)
  8027b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027bc:	48 98                	cltq   
  8027be:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8027c2:	72 ae                	jb     802772 <readn+0x1c>
  8027c4:	eb 01                	jmp    8027c7 <readn+0x71>
  8027c6:	90                   	nop
  8027c7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027ca:	c9                   	leaveq 
  8027cb:	c3                   	retq   

00000000008027cc <write>:
  8027cc:	55                   	push   %rbp
  8027cd:	48 89 e5             	mov    %rsp,%rbp
  8027d0:	48 83 ec 40          	sub    $0x40,%rsp
  8027d4:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8027d7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8027db:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8027df:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8027e3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8027e6:	48 89 d6             	mov    %rdx,%rsi
  8027e9:	89 c7                	mov    %eax,%edi
  8027eb:	48 b8 4c 22 80 00 00 	movabs $0x80224c,%rax
  8027f2:	00 00 00 
  8027f5:	ff d0                	callq  *%rax
  8027f7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027fa:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027fe:	78 24                	js     802824 <write+0x58>
  802800:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802804:	8b 00                	mov    (%rax),%eax
  802806:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80280a:	48 89 d6             	mov    %rdx,%rsi
  80280d:	89 c7                	mov    %eax,%edi
  80280f:	48 b8 a7 23 80 00 00 	movabs $0x8023a7,%rax
  802816:	00 00 00 
  802819:	ff d0                	callq  *%rax
  80281b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80281e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802822:	79 05                	jns    802829 <write+0x5d>
  802824:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802827:	eb 75                	jmp    80289e <write+0xd2>
  802829:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80282d:	8b 40 08             	mov    0x8(%rax),%eax
  802830:	83 e0 03             	and    $0x3,%eax
  802833:	85 c0                	test   %eax,%eax
  802835:	75 3a                	jne    802871 <write+0xa5>
  802837:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  80283e:	00 00 00 
  802841:	48 8b 00             	mov    (%rax),%rax
  802844:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80284a:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80284d:	89 c6                	mov    %eax,%esi
  80284f:	48 bf 4b 4b 80 00 00 	movabs $0x804b4b,%rdi
  802856:	00 00 00 
  802859:	b8 00 00 00 00       	mov    $0x0,%eax
  80285e:	48 b9 4c 07 80 00 00 	movabs $0x80074c,%rcx
  802865:	00 00 00 
  802868:	ff d1                	callq  *%rcx
  80286a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80286f:	eb 2d                	jmp    80289e <write+0xd2>
  802871:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802875:	48 8b 40 18          	mov    0x18(%rax),%rax
  802879:	48 85 c0             	test   %rax,%rax
  80287c:	75 07                	jne    802885 <write+0xb9>
  80287e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802883:	eb 19                	jmp    80289e <write+0xd2>
  802885:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802889:	48 8b 40 18          	mov    0x18(%rax),%rax
  80288d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802891:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802895:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802899:	48 89 cf             	mov    %rcx,%rdi
  80289c:	ff d0                	callq  *%rax
  80289e:	c9                   	leaveq 
  80289f:	c3                   	retq   

00000000008028a0 <seek>:
  8028a0:	55                   	push   %rbp
  8028a1:	48 89 e5             	mov    %rsp,%rbp
  8028a4:	48 83 ec 18          	sub    $0x18,%rsp
  8028a8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8028ab:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8028ae:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8028b2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8028b5:	48 89 d6             	mov    %rdx,%rsi
  8028b8:	89 c7                	mov    %eax,%edi
  8028ba:	48 b8 4c 22 80 00 00 	movabs $0x80224c,%rax
  8028c1:	00 00 00 
  8028c4:	ff d0                	callq  *%rax
  8028c6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028c9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028cd:	79 05                	jns    8028d4 <seek+0x34>
  8028cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028d2:	eb 0f                	jmp    8028e3 <seek+0x43>
  8028d4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028d8:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8028db:	89 50 04             	mov    %edx,0x4(%rax)
  8028de:	b8 00 00 00 00       	mov    $0x0,%eax
  8028e3:	c9                   	leaveq 
  8028e4:	c3                   	retq   

00000000008028e5 <ftruncate>:
  8028e5:	55                   	push   %rbp
  8028e6:	48 89 e5             	mov    %rsp,%rbp
  8028e9:	48 83 ec 30          	sub    $0x30,%rsp
  8028ed:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8028f0:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8028f3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8028f7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8028fa:	48 89 d6             	mov    %rdx,%rsi
  8028fd:	89 c7                	mov    %eax,%edi
  8028ff:	48 b8 4c 22 80 00 00 	movabs $0x80224c,%rax
  802906:	00 00 00 
  802909:	ff d0                	callq  *%rax
  80290b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80290e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802912:	78 24                	js     802938 <ftruncate+0x53>
  802914:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802918:	8b 00                	mov    (%rax),%eax
  80291a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80291e:	48 89 d6             	mov    %rdx,%rsi
  802921:	89 c7                	mov    %eax,%edi
  802923:	48 b8 a7 23 80 00 00 	movabs $0x8023a7,%rax
  80292a:	00 00 00 
  80292d:	ff d0                	callq  *%rax
  80292f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802932:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802936:	79 05                	jns    80293d <ftruncate+0x58>
  802938:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80293b:	eb 72                	jmp    8029af <ftruncate+0xca>
  80293d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802941:	8b 40 08             	mov    0x8(%rax),%eax
  802944:	83 e0 03             	and    $0x3,%eax
  802947:	85 c0                	test   %eax,%eax
  802949:	75 3a                	jne    802985 <ftruncate+0xa0>
  80294b:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  802952:	00 00 00 
  802955:	48 8b 00             	mov    (%rax),%rax
  802958:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80295e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802961:	89 c6                	mov    %eax,%esi
  802963:	48 bf 68 4b 80 00 00 	movabs $0x804b68,%rdi
  80296a:	00 00 00 
  80296d:	b8 00 00 00 00       	mov    $0x0,%eax
  802972:	48 b9 4c 07 80 00 00 	movabs $0x80074c,%rcx
  802979:	00 00 00 
  80297c:	ff d1                	callq  *%rcx
  80297e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802983:	eb 2a                	jmp    8029af <ftruncate+0xca>
  802985:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802989:	48 8b 40 30          	mov    0x30(%rax),%rax
  80298d:	48 85 c0             	test   %rax,%rax
  802990:	75 07                	jne    802999 <ftruncate+0xb4>
  802992:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802997:	eb 16                	jmp    8029af <ftruncate+0xca>
  802999:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80299d:	48 8b 40 30          	mov    0x30(%rax),%rax
  8029a1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8029a5:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8029a8:	89 ce                	mov    %ecx,%esi
  8029aa:	48 89 d7             	mov    %rdx,%rdi
  8029ad:	ff d0                	callq  *%rax
  8029af:	c9                   	leaveq 
  8029b0:	c3                   	retq   

00000000008029b1 <fstat>:
  8029b1:	55                   	push   %rbp
  8029b2:	48 89 e5             	mov    %rsp,%rbp
  8029b5:	48 83 ec 30          	sub    $0x30,%rsp
  8029b9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8029bc:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8029c0:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8029c4:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8029c7:	48 89 d6             	mov    %rdx,%rsi
  8029ca:	89 c7                	mov    %eax,%edi
  8029cc:	48 b8 4c 22 80 00 00 	movabs $0x80224c,%rax
  8029d3:	00 00 00 
  8029d6:	ff d0                	callq  *%rax
  8029d8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029db:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029df:	78 24                	js     802a05 <fstat+0x54>
  8029e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029e5:	8b 00                	mov    (%rax),%eax
  8029e7:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8029eb:	48 89 d6             	mov    %rdx,%rsi
  8029ee:	89 c7                	mov    %eax,%edi
  8029f0:	48 b8 a7 23 80 00 00 	movabs $0x8023a7,%rax
  8029f7:	00 00 00 
  8029fa:	ff d0                	callq  *%rax
  8029fc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029ff:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a03:	79 05                	jns    802a0a <fstat+0x59>
  802a05:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a08:	eb 5e                	jmp    802a68 <fstat+0xb7>
  802a0a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a0e:	48 8b 40 28          	mov    0x28(%rax),%rax
  802a12:	48 85 c0             	test   %rax,%rax
  802a15:	75 07                	jne    802a1e <fstat+0x6d>
  802a17:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802a1c:	eb 4a                	jmp    802a68 <fstat+0xb7>
  802a1e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802a22:	c6 00 00             	movb   $0x0,(%rax)
  802a25:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802a29:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802a30:	00 00 00 
  802a33:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802a37:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802a3e:	00 00 00 
  802a41:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802a45:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802a49:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802a50:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a54:	48 8b 40 28          	mov    0x28(%rax),%rax
  802a58:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802a5c:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802a60:	48 89 ce             	mov    %rcx,%rsi
  802a63:	48 89 d7             	mov    %rdx,%rdi
  802a66:	ff d0                	callq  *%rax
  802a68:	c9                   	leaveq 
  802a69:	c3                   	retq   

0000000000802a6a <stat>:
  802a6a:	55                   	push   %rbp
  802a6b:	48 89 e5             	mov    %rsp,%rbp
  802a6e:	48 83 ec 20          	sub    $0x20,%rsp
  802a72:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802a76:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802a7a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a7e:	be 00 00 00 00       	mov    $0x0,%esi
  802a83:	48 89 c7             	mov    %rax,%rdi
  802a86:	48 b8 5a 2b 80 00 00 	movabs $0x802b5a,%rax
  802a8d:	00 00 00 
  802a90:	ff d0                	callq  *%rax
  802a92:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a95:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a99:	79 05                	jns    802aa0 <stat+0x36>
  802a9b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a9e:	eb 2f                	jmp    802acf <stat+0x65>
  802aa0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802aa4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802aa7:	48 89 d6             	mov    %rdx,%rsi
  802aaa:	89 c7                	mov    %eax,%edi
  802aac:	48 b8 b1 29 80 00 00 	movabs $0x8029b1,%rax
  802ab3:	00 00 00 
  802ab6:	ff d0                	callq  *%rax
  802ab8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802abb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802abe:	89 c7                	mov    %eax,%edi
  802ac0:	48 b8 5e 24 80 00 00 	movabs $0x80245e,%rax
  802ac7:	00 00 00 
  802aca:	ff d0                	callq  *%rax
  802acc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802acf:	c9                   	leaveq 
  802ad0:	c3                   	retq   

0000000000802ad1 <fsipc>:
  802ad1:	55                   	push   %rbp
  802ad2:	48 89 e5             	mov    %rsp,%rbp
  802ad5:	48 83 ec 10          	sub    $0x10,%rsp
  802ad9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802adc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802ae0:	48 b8 00 74 80 00 00 	movabs $0x807400,%rax
  802ae7:	00 00 00 
  802aea:	8b 00                	mov    (%rax),%eax
  802aec:	85 c0                	test   %eax,%eax
  802aee:	75 1f                	jne    802b0f <fsipc+0x3e>
  802af0:	bf 01 00 00 00       	mov    $0x1,%edi
  802af5:	48 b8 33 44 80 00 00 	movabs $0x804433,%rax
  802afc:	00 00 00 
  802aff:	ff d0                	callq  *%rax
  802b01:	89 c2                	mov    %eax,%edx
  802b03:	48 b8 00 74 80 00 00 	movabs $0x807400,%rax
  802b0a:	00 00 00 
  802b0d:	89 10                	mov    %edx,(%rax)
  802b0f:	48 b8 00 74 80 00 00 	movabs $0x807400,%rax
  802b16:	00 00 00 
  802b19:	8b 00                	mov    (%rax),%eax
  802b1b:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802b1e:	b9 07 00 00 00       	mov    $0x7,%ecx
  802b23:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  802b2a:	00 00 00 
  802b2d:	89 c7                	mov    %eax,%edi
  802b2f:	48 b8 29 43 80 00 00 	movabs $0x804329,%rax
  802b36:	00 00 00 
  802b39:	ff d0                	callq  *%rax
  802b3b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b3f:	ba 00 00 00 00       	mov    $0x0,%edx
  802b44:	48 89 c6             	mov    %rax,%rsi
  802b47:	bf 00 00 00 00       	mov    $0x0,%edi
  802b4c:	48 b8 68 42 80 00 00 	movabs $0x804268,%rax
  802b53:	00 00 00 
  802b56:	ff d0                	callq  *%rax
  802b58:	c9                   	leaveq 
  802b59:	c3                   	retq   

0000000000802b5a <open>:
  802b5a:	55                   	push   %rbp
  802b5b:	48 89 e5             	mov    %rsp,%rbp
  802b5e:	48 83 ec 20          	sub    $0x20,%rsp
  802b62:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802b66:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802b69:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b6d:	48 89 c7             	mov    %rax,%rdi
  802b70:	48 b8 ce 13 80 00 00 	movabs $0x8013ce,%rax
  802b77:	00 00 00 
  802b7a:	ff d0                	callq  *%rax
  802b7c:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802b81:	7e 0a                	jle    802b8d <open+0x33>
  802b83:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802b88:	e9 a5 00 00 00       	jmpq   802c32 <open+0xd8>
  802b8d:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802b91:	48 89 c7             	mov    %rax,%rdi
  802b94:	48 b8 b4 21 80 00 00 	movabs $0x8021b4,%rax
  802b9b:	00 00 00 
  802b9e:	ff d0                	callq  *%rax
  802ba0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ba3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ba7:	79 08                	jns    802bb1 <open+0x57>
  802ba9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bac:	e9 81 00 00 00       	jmpq   802c32 <open+0xd8>
  802bb1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bb5:	48 89 c6             	mov    %rax,%rsi
  802bb8:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802bbf:	00 00 00 
  802bc2:	48 b8 3a 14 80 00 00 	movabs $0x80143a,%rax
  802bc9:	00 00 00 
  802bcc:	ff d0                	callq  *%rax
  802bce:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802bd5:	00 00 00 
  802bd8:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802bdb:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802be1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802be5:	48 89 c6             	mov    %rax,%rsi
  802be8:	bf 01 00 00 00       	mov    $0x1,%edi
  802bed:	48 b8 d1 2a 80 00 00 	movabs $0x802ad1,%rax
  802bf4:	00 00 00 
  802bf7:	ff d0                	callq  *%rax
  802bf9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bfc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c00:	79 1d                	jns    802c1f <open+0xc5>
  802c02:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c06:	be 00 00 00 00       	mov    $0x0,%esi
  802c0b:	48 89 c7             	mov    %rax,%rdi
  802c0e:	48 b8 dc 22 80 00 00 	movabs $0x8022dc,%rax
  802c15:	00 00 00 
  802c18:	ff d0                	callq  *%rax
  802c1a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c1d:	eb 13                	jmp    802c32 <open+0xd8>
  802c1f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c23:	48 89 c7             	mov    %rax,%rdi
  802c26:	48 b8 66 21 80 00 00 	movabs $0x802166,%rax
  802c2d:	00 00 00 
  802c30:	ff d0                	callq  *%rax
  802c32:	c9                   	leaveq 
  802c33:	c3                   	retq   

0000000000802c34 <devfile_flush>:
  802c34:	55                   	push   %rbp
  802c35:	48 89 e5             	mov    %rsp,%rbp
  802c38:	48 83 ec 10          	sub    $0x10,%rsp
  802c3c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802c40:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c44:	8b 50 0c             	mov    0xc(%rax),%edx
  802c47:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c4e:	00 00 00 
  802c51:	89 10                	mov    %edx,(%rax)
  802c53:	be 00 00 00 00       	mov    $0x0,%esi
  802c58:	bf 06 00 00 00       	mov    $0x6,%edi
  802c5d:	48 b8 d1 2a 80 00 00 	movabs $0x802ad1,%rax
  802c64:	00 00 00 
  802c67:	ff d0                	callq  *%rax
  802c69:	c9                   	leaveq 
  802c6a:	c3                   	retq   

0000000000802c6b <devfile_read>:
  802c6b:	55                   	push   %rbp
  802c6c:	48 89 e5             	mov    %rsp,%rbp
  802c6f:	48 83 ec 30          	sub    $0x30,%rsp
  802c73:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802c77:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802c7b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802c7f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c83:	8b 50 0c             	mov    0xc(%rax),%edx
  802c86:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c8d:	00 00 00 
  802c90:	89 10                	mov    %edx,(%rax)
  802c92:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c99:	00 00 00 
  802c9c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802ca0:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802ca4:	be 00 00 00 00       	mov    $0x0,%esi
  802ca9:	bf 03 00 00 00       	mov    $0x3,%edi
  802cae:	48 b8 d1 2a 80 00 00 	movabs $0x802ad1,%rax
  802cb5:	00 00 00 
  802cb8:	ff d0                	callq  *%rax
  802cba:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cbd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cc1:	79 08                	jns    802ccb <devfile_read+0x60>
  802cc3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cc6:	e9 a4 00 00 00       	jmpq   802d6f <devfile_read+0x104>
  802ccb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cce:	48 98                	cltq   
  802cd0:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802cd4:	76 35                	jbe    802d0b <devfile_read+0xa0>
  802cd6:	48 b9 8e 4b 80 00 00 	movabs $0x804b8e,%rcx
  802cdd:	00 00 00 
  802ce0:	48 ba 95 4b 80 00 00 	movabs $0x804b95,%rdx
  802ce7:	00 00 00 
  802cea:	be 89 00 00 00       	mov    $0x89,%esi
  802cef:	48 bf aa 4b 80 00 00 	movabs $0x804baa,%rdi
  802cf6:	00 00 00 
  802cf9:	b8 00 00 00 00       	mov    $0x0,%eax
  802cfe:	49 b8 12 05 80 00 00 	movabs $0x800512,%r8
  802d05:	00 00 00 
  802d08:	41 ff d0             	callq  *%r8
  802d0b:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802d12:	7e 35                	jle    802d49 <devfile_read+0xde>
  802d14:	48 b9 b8 4b 80 00 00 	movabs $0x804bb8,%rcx
  802d1b:	00 00 00 
  802d1e:	48 ba 95 4b 80 00 00 	movabs $0x804b95,%rdx
  802d25:	00 00 00 
  802d28:	be 8a 00 00 00       	mov    $0x8a,%esi
  802d2d:	48 bf aa 4b 80 00 00 	movabs $0x804baa,%rdi
  802d34:	00 00 00 
  802d37:	b8 00 00 00 00       	mov    $0x0,%eax
  802d3c:	49 b8 12 05 80 00 00 	movabs $0x800512,%r8
  802d43:	00 00 00 
  802d46:	41 ff d0             	callq  *%r8
  802d49:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d4c:	48 63 d0             	movslq %eax,%rdx
  802d4f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d53:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802d5a:	00 00 00 
  802d5d:	48 89 c7             	mov    %rax,%rdi
  802d60:	48 b8 5f 17 80 00 00 	movabs $0x80175f,%rax
  802d67:	00 00 00 
  802d6a:	ff d0                	callq  *%rax
  802d6c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d6f:	c9                   	leaveq 
  802d70:	c3                   	retq   

0000000000802d71 <devfile_write>:
  802d71:	55                   	push   %rbp
  802d72:	48 89 e5             	mov    %rsp,%rbp
  802d75:	48 83 ec 40          	sub    $0x40,%rsp
  802d79:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802d7d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802d81:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802d85:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802d89:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802d8d:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802d94:	00 
  802d95:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d99:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802d9d:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802da2:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802da6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802daa:	8b 50 0c             	mov    0xc(%rax),%edx
  802dad:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802db4:	00 00 00 
  802db7:	89 10                	mov    %edx,(%rax)
  802db9:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802dc0:	00 00 00 
  802dc3:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802dc7:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802dcb:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802dcf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802dd3:	48 89 c6             	mov    %rax,%rsi
  802dd6:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  802ddd:	00 00 00 
  802de0:	48 b8 5f 17 80 00 00 	movabs $0x80175f,%rax
  802de7:	00 00 00 
  802dea:	ff d0                	callq  *%rax
  802dec:	be 00 00 00 00       	mov    $0x0,%esi
  802df1:	bf 04 00 00 00       	mov    $0x4,%edi
  802df6:	48 b8 d1 2a 80 00 00 	movabs $0x802ad1,%rax
  802dfd:	00 00 00 
  802e00:	ff d0                	callq  *%rax
  802e02:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802e05:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802e09:	79 05                	jns    802e10 <devfile_write+0x9f>
  802e0b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e0e:	eb 43                	jmp    802e53 <devfile_write+0xe2>
  802e10:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e13:	48 98                	cltq   
  802e15:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802e19:	76 35                	jbe    802e50 <devfile_write+0xdf>
  802e1b:	48 b9 8e 4b 80 00 00 	movabs $0x804b8e,%rcx
  802e22:	00 00 00 
  802e25:	48 ba 95 4b 80 00 00 	movabs $0x804b95,%rdx
  802e2c:	00 00 00 
  802e2f:	be a8 00 00 00       	mov    $0xa8,%esi
  802e34:	48 bf aa 4b 80 00 00 	movabs $0x804baa,%rdi
  802e3b:	00 00 00 
  802e3e:	b8 00 00 00 00       	mov    $0x0,%eax
  802e43:	49 b8 12 05 80 00 00 	movabs $0x800512,%r8
  802e4a:	00 00 00 
  802e4d:	41 ff d0             	callq  *%r8
  802e50:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e53:	c9                   	leaveq 
  802e54:	c3                   	retq   

0000000000802e55 <devfile_stat>:
  802e55:	55                   	push   %rbp
  802e56:	48 89 e5             	mov    %rsp,%rbp
  802e59:	48 83 ec 20          	sub    $0x20,%rsp
  802e5d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802e61:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802e65:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e69:	8b 50 0c             	mov    0xc(%rax),%edx
  802e6c:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802e73:	00 00 00 
  802e76:	89 10                	mov    %edx,(%rax)
  802e78:	be 00 00 00 00       	mov    $0x0,%esi
  802e7d:	bf 05 00 00 00       	mov    $0x5,%edi
  802e82:	48 b8 d1 2a 80 00 00 	movabs $0x802ad1,%rax
  802e89:	00 00 00 
  802e8c:	ff d0                	callq  *%rax
  802e8e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e91:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e95:	79 05                	jns    802e9c <devfile_stat+0x47>
  802e97:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e9a:	eb 56                	jmp    802ef2 <devfile_stat+0x9d>
  802e9c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ea0:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802ea7:	00 00 00 
  802eaa:	48 89 c7             	mov    %rax,%rdi
  802ead:	48 b8 3a 14 80 00 00 	movabs $0x80143a,%rax
  802eb4:	00 00 00 
  802eb7:	ff d0                	callq  *%rax
  802eb9:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802ec0:	00 00 00 
  802ec3:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802ec9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ecd:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802ed3:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802eda:	00 00 00 
  802edd:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802ee3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ee7:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802eed:	b8 00 00 00 00       	mov    $0x0,%eax
  802ef2:	c9                   	leaveq 
  802ef3:	c3                   	retq   

0000000000802ef4 <devfile_trunc>:
  802ef4:	55                   	push   %rbp
  802ef5:	48 89 e5             	mov    %rsp,%rbp
  802ef8:	48 83 ec 10          	sub    $0x10,%rsp
  802efc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802f00:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802f03:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f07:	8b 50 0c             	mov    0xc(%rax),%edx
  802f0a:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802f11:	00 00 00 
  802f14:	89 10                	mov    %edx,(%rax)
  802f16:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802f1d:	00 00 00 
  802f20:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802f23:	89 50 04             	mov    %edx,0x4(%rax)
  802f26:	be 00 00 00 00       	mov    $0x0,%esi
  802f2b:	bf 02 00 00 00       	mov    $0x2,%edi
  802f30:	48 b8 d1 2a 80 00 00 	movabs $0x802ad1,%rax
  802f37:	00 00 00 
  802f3a:	ff d0                	callq  *%rax
  802f3c:	c9                   	leaveq 
  802f3d:	c3                   	retq   

0000000000802f3e <remove>:
  802f3e:	55                   	push   %rbp
  802f3f:	48 89 e5             	mov    %rsp,%rbp
  802f42:	48 83 ec 10          	sub    $0x10,%rsp
  802f46:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802f4a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f4e:	48 89 c7             	mov    %rax,%rdi
  802f51:	48 b8 ce 13 80 00 00 	movabs $0x8013ce,%rax
  802f58:	00 00 00 
  802f5b:	ff d0                	callq  *%rax
  802f5d:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802f62:	7e 07                	jle    802f6b <remove+0x2d>
  802f64:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802f69:	eb 33                	jmp    802f9e <remove+0x60>
  802f6b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f6f:	48 89 c6             	mov    %rax,%rsi
  802f72:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802f79:	00 00 00 
  802f7c:	48 b8 3a 14 80 00 00 	movabs $0x80143a,%rax
  802f83:	00 00 00 
  802f86:	ff d0                	callq  *%rax
  802f88:	be 00 00 00 00       	mov    $0x0,%esi
  802f8d:	bf 07 00 00 00       	mov    $0x7,%edi
  802f92:	48 b8 d1 2a 80 00 00 	movabs $0x802ad1,%rax
  802f99:	00 00 00 
  802f9c:	ff d0                	callq  *%rax
  802f9e:	c9                   	leaveq 
  802f9f:	c3                   	retq   

0000000000802fa0 <sync>:
  802fa0:	55                   	push   %rbp
  802fa1:	48 89 e5             	mov    %rsp,%rbp
  802fa4:	be 00 00 00 00       	mov    $0x0,%esi
  802fa9:	bf 08 00 00 00       	mov    $0x8,%edi
  802fae:	48 b8 d1 2a 80 00 00 	movabs $0x802ad1,%rax
  802fb5:	00 00 00 
  802fb8:	ff d0                	callq  *%rax
  802fba:	5d                   	pop    %rbp
  802fbb:	c3                   	retq   

0000000000802fbc <copy>:
  802fbc:	55                   	push   %rbp
  802fbd:	48 89 e5             	mov    %rsp,%rbp
  802fc0:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802fc7:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802fce:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802fd5:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802fdc:	be 00 00 00 00       	mov    $0x0,%esi
  802fe1:	48 89 c7             	mov    %rax,%rdi
  802fe4:	48 b8 5a 2b 80 00 00 	movabs $0x802b5a,%rax
  802feb:	00 00 00 
  802fee:	ff d0                	callq  *%rax
  802ff0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ff3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ff7:	79 28                	jns    803021 <copy+0x65>
  802ff9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ffc:	89 c6                	mov    %eax,%esi
  802ffe:	48 bf c4 4b 80 00 00 	movabs $0x804bc4,%rdi
  803005:	00 00 00 
  803008:	b8 00 00 00 00       	mov    $0x0,%eax
  80300d:	48 ba 4c 07 80 00 00 	movabs $0x80074c,%rdx
  803014:	00 00 00 
  803017:	ff d2                	callq  *%rdx
  803019:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80301c:	e9 76 01 00 00       	jmpq   803197 <copy+0x1db>
  803021:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  803028:	be 01 01 00 00       	mov    $0x101,%esi
  80302d:	48 89 c7             	mov    %rax,%rdi
  803030:	48 b8 5a 2b 80 00 00 	movabs $0x802b5a,%rax
  803037:	00 00 00 
  80303a:	ff d0                	callq  *%rax
  80303c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80303f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803043:	0f 89 ad 00 00 00    	jns    8030f6 <copy+0x13a>
  803049:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80304c:	89 c6                	mov    %eax,%esi
  80304e:	48 bf da 4b 80 00 00 	movabs $0x804bda,%rdi
  803055:	00 00 00 
  803058:	b8 00 00 00 00       	mov    $0x0,%eax
  80305d:	48 ba 4c 07 80 00 00 	movabs $0x80074c,%rdx
  803064:	00 00 00 
  803067:	ff d2                	callq  *%rdx
  803069:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80306c:	89 c7                	mov    %eax,%edi
  80306e:	48 b8 5e 24 80 00 00 	movabs $0x80245e,%rax
  803075:	00 00 00 
  803078:	ff d0                	callq  *%rax
  80307a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80307d:	e9 15 01 00 00       	jmpq   803197 <copy+0x1db>
  803082:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803085:	48 63 d0             	movslq %eax,%rdx
  803088:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  80308f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803092:	48 89 ce             	mov    %rcx,%rsi
  803095:	89 c7                	mov    %eax,%edi
  803097:	48 b8 cc 27 80 00 00 	movabs $0x8027cc,%rax
  80309e:	00 00 00 
  8030a1:	ff d0                	callq  *%rax
  8030a3:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8030a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8030aa:	79 4a                	jns    8030f6 <copy+0x13a>
  8030ac:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8030af:	89 c6                	mov    %eax,%esi
  8030b1:	48 bf f4 4b 80 00 00 	movabs $0x804bf4,%rdi
  8030b8:	00 00 00 
  8030bb:	b8 00 00 00 00       	mov    $0x0,%eax
  8030c0:	48 ba 4c 07 80 00 00 	movabs $0x80074c,%rdx
  8030c7:	00 00 00 
  8030ca:	ff d2                	callq  *%rdx
  8030cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030cf:	89 c7                	mov    %eax,%edi
  8030d1:	48 b8 5e 24 80 00 00 	movabs $0x80245e,%rax
  8030d8:	00 00 00 
  8030db:	ff d0                	callq  *%rax
  8030dd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8030e0:	89 c7                	mov    %eax,%edi
  8030e2:	48 b8 5e 24 80 00 00 	movabs $0x80245e,%rax
  8030e9:	00 00 00 
  8030ec:	ff d0                	callq  *%rax
  8030ee:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8030f1:	e9 a1 00 00 00       	jmpq   803197 <copy+0x1db>
  8030f6:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8030fd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803100:	ba 00 02 00 00       	mov    $0x200,%edx
  803105:	48 89 ce             	mov    %rcx,%rsi
  803108:	89 c7                	mov    %eax,%edi
  80310a:	48 b8 81 26 80 00 00 	movabs $0x802681,%rax
  803111:	00 00 00 
  803114:	ff d0                	callq  *%rax
  803116:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803119:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80311d:	0f 8f 5f ff ff ff    	jg     803082 <copy+0xc6>
  803123:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803127:	79 47                	jns    803170 <copy+0x1b4>
  803129:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80312c:	89 c6                	mov    %eax,%esi
  80312e:	48 bf 07 4c 80 00 00 	movabs $0x804c07,%rdi
  803135:	00 00 00 
  803138:	b8 00 00 00 00       	mov    $0x0,%eax
  80313d:	48 ba 4c 07 80 00 00 	movabs $0x80074c,%rdx
  803144:	00 00 00 
  803147:	ff d2                	callq  *%rdx
  803149:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80314c:	89 c7                	mov    %eax,%edi
  80314e:	48 b8 5e 24 80 00 00 	movabs $0x80245e,%rax
  803155:	00 00 00 
  803158:	ff d0                	callq  *%rax
  80315a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80315d:	89 c7                	mov    %eax,%edi
  80315f:	48 b8 5e 24 80 00 00 	movabs $0x80245e,%rax
  803166:	00 00 00 
  803169:	ff d0                	callq  *%rax
  80316b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80316e:	eb 27                	jmp    803197 <copy+0x1db>
  803170:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803173:	89 c7                	mov    %eax,%edi
  803175:	48 b8 5e 24 80 00 00 	movabs $0x80245e,%rax
  80317c:	00 00 00 
  80317f:	ff d0                	callq  *%rax
  803181:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803184:	89 c7                	mov    %eax,%edi
  803186:	48 b8 5e 24 80 00 00 	movabs $0x80245e,%rax
  80318d:	00 00 00 
  803190:	ff d0                	callq  *%rax
  803192:	b8 00 00 00 00       	mov    $0x0,%eax
  803197:	c9                   	leaveq 
  803198:	c3                   	retq   

0000000000803199 <writebuf>:
  803199:	55                   	push   %rbp
  80319a:	48 89 e5             	mov    %rsp,%rbp
  80319d:	48 83 ec 20          	sub    $0x20,%rsp
  8031a1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8031a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031a9:	8b 40 0c             	mov    0xc(%rax),%eax
  8031ac:	85 c0                	test   %eax,%eax
  8031ae:	7e 67                	jle    803217 <writebuf+0x7e>
  8031b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031b4:	8b 40 04             	mov    0x4(%rax),%eax
  8031b7:	48 63 d0             	movslq %eax,%rdx
  8031ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031be:	48 8d 48 10          	lea    0x10(%rax),%rcx
  8031c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031c6:	8b 00                	mov    (%rax),%eax
  8031c8:	48 89 ce             	mov    %rcx,%rsi
  8031cb:	89 c7                	mov    %eax,%edi
  8031cd:	48 b8 cc 27 80 00 00 	movabs $0x8027cc,%rax
  8031d4:	00 00 00 
  8031d7:	ff d0                	callq  *%rax
  8031d9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031dc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031e0:	7e 13                	jle    8031f5 <writebuf+0x5c>
  8031e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031e6:	8b 50 08             	mov    0x8(%rax),%edx
  8031e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031ec:	01 c2                	add    %eax,%edx
  8031ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031f2:	89 50 08             	mov    %edx,0x8(%rax)
  8031f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031f9:	8b 40 04             	mov    0x4(%rax),%eax
  8031fc:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  8031ff:	74 16                	je     803217 <writebuf+0x7e>
  803201:	b8 00 00 00 00       	mov    $0x0,%eax
  803206:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80320a:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  80320e:	89 c2                	mov    %eax,%edx
  803210:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803214:	89 50 0c             	mov    %edx,0xc(%rax)
  803217:	90                   	nop
  803218:	c9                   	leaveq 
  803219:	c3                   	retq   

000000000080321a <putch>:
  80321a:	55                   	push   %rbp
  80321b:	48 89 e5             	mov    %rsp,%rbp
  80321e:	48 83 ec 20          	sub    $0x20,%rsp
  803222:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803225:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803229:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80322d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803231:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803235:	8b 40 04             	mov    0x4(%rax),%eax
  803238:	8d 48 01             	lea    0x1(%rax),%ecx
  80323b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80323f:	89 4a 04             	mov    %ecx,0x4(%rdx)
  803242:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803245:	89 d1                	mov    %edx,%ecx
  803247:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80324b:	48 98                	cltq   
  80324d:	88 4c 02 10          	mov    %cl,0x10(%rdx,%rax,1)
  803251:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803255:	8b 40 04             	mov    0x4(%rax),%eax
  803258:	3d 00 01 00 00       	cmp    $0x100,%eax
  80325d:	75 1e                	jne    80327d <putch+0x63>
  80325f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803263:	48 89 c7             	mov    %rax,%rdi
  803266:	48 b8 99 31 80 00 00 	movabs $0x803199,%rax
  80326d:	00 00 00 
  803270:	ff d0                	callq  *%rax
  803272:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803276:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  80327d:	90                   	nop
  80327e:	c9                   	leaveq 
  80327f:	c3                   	retq   

0000000000803280 <vfprintf>:
  803280:	55                   	push   %rbp
  803281:	48 89 e5             	mov    %rsp,%rbp
  803284:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
  80328b:	89 bd ec fe ff ff    	mov    %edi,-0x114(%rbp)
  803291:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  803298:	48 89 95 d8 fe ff ff 	mov    %rdx,-0x128(%rbp)
  80329f:	8b 85 ec fe ff ff    	mov    -0x114(%rbp),%eax
  8032a5:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%rbp)
  8032ab:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8032b2:	00 00 00 
  8032b5:	c7 85 f8 fe ff ff 00 	movl   $0x0,-0x108(%rbp)
  8032bc:	00 00 00 
  8032bf:	c7 85 fc fe ff ff 01 	movl   $0x1,-0x104(%rbp)
  8032c6:	00 00 00 
  8032c9:	48 8b 8d d8 fe ff ff 	mov    -0x128(%rbp),%rcx
  8032d0:	48 8b 95 e0 fe ff ff 	mov    -0x120(%rbp),%rdx
  8032d7:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8032de:	48 89 c6             	mov    %rax,%rsi
  8032e1:	48 bf 1a 32 80 00 00 	movabs $0x80321a,%rdi
  8032e8:	00 00 00 
  8032eb:	48 b8 ea 0a 80 00 00 	movabs $0x800aea,%rax
  8032f2:	00 00 00 
  8032f5:	ff d0                	callq  *%rax
  8032f7:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8032fd:	85 c0                	test   %eax,%eax
  8032ff:	7e 16                	jle    803317 <vfprintf+0x97>
  803301:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  803308:	48 89 c7             	mov    %rax,%rdi
  80330b:	48 b8 99 31 80 00 00 	movabs $0x803199,%rax
  803312:	00 00 00 
  803315:	ff d0                	callq  *%rax
  803317:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  80331d:	85 c0                	test   %eax,%eax
  80331f:	74 08                	je     803329 <vfprintf+0xa9>
  803321:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  803327:	eb 06                	jmp    80332f <vfprintf+0xaf>
  803329:	8b 85 fc fe ff ff    	mov    -0x104(%rbp),%eax
  80332f:	c9                   	leaveq 
  803330:	c3                   	retq   

0000000000803331 <fprintf>:
  803331:	55                   	push   %rbp
  803332:	48 89 e5             	mov    %rsp,%rbp
  803335:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  80333c:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%rbp)
  803342:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  803349:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  803350:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803357:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80335e:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803365:	84 c0                	test   %al,%al
  803367:	74 20                	je     803389 <fprintf+0x58>
  803369:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80336d:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803371:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  803375:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803379:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80337d:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803381:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803385:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803389:	c7 85 30 ff ff ff 10 	movl   $0x10,-0xd0(%rbp)
  803390:	00 00 00 
  803393:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80339a:	00 00 00 
  80339d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8033a1:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8033a8:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8033af:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8033b6:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8033bd:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
  8033c4:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8033ca:	48 89 ce             	mov    %rcx,%rsi
  8033cd:	89 c7                	mov    %eax,%edi
  8033cf:	48 b8 80 32 80 00 00 	movabs $0x803280,%rax
  8033d6:	00 00 00 
  8033d9:	ff d0                	callq  *%rax
  8033db:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8033e1:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8033e7:	c9                   	leaveq 
  8033e8:	c3                   	retq   

00000000008033e9 <printf>:
  8033e9:	55                   	push   %rbp
  8033ea:	48 89 e5             	mov    %rsp,%rbp
  8033ed:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  8033f4:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  8033fb:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  803402:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  803409:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803410:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803417:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80341e:	84 c0                	test   %al,%al
  803420:	74 20                	je     803442 <printf+0x59>
  803422:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803426:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80342a:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80342e:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803432:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803436:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80343a:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80343e:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803442:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  803449:	00 00 00 
  80344c:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  803453:	00 00 00 
  803456:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80345a:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803461:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  803468:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80346f:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  803476:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  80347d:	48 89 c6             	mov    %rax,%rsi
  803480:	bf 01 00 00 00       	mov    $0x1,%edi
  803485:	48 b8 80 32 80 00 00 	movabs $0x803280,%rax
  80348c:	00 00 00 
  80348f:	ff d0                	callq  *%rax
  803491:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  803497:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80349d:	c9                   	leaveq 
  80349e:	c3                   	retq   

000000000080349f <fd2sockid>:
  80349f:	55                   	push   %rbp
  8034a0:	48 89 e5             	mov    %rsp,%rbp
  8034a3:	48 83 ec 20          	sub    $0x20,%rsp
  8034a7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8034aa:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8034ae:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034b1:	48 89 d6             	mov    %rdx,%rsi
  8034b4:	89 c7                	mov    %eax,%edi
  8034b6:	48 b8 4c 22 80 00 00 	movabs $0x80224c,%rax
  8034bd:	00 00 00 
  8034c0:	ff d0                	callq  *%rax
  8034c2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034c5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034c9:	79 05                	jns    8034d0 <fd2sockid+0x31>
  8034cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034ce:	eb 24                	jmp    8034f4 <fd2sockid+0x55>
  8034d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8034d4:	8b 10                	mov    (%rax),%edx
  8034d6:	48 b8 c0 60 80 00 00 	movabs $0x8060c0,%rax
  8034dd:	00 00 00 
  8034e0:	8b 00                	mov    (%rax),%eax
  8034e2:	39 c2                	cmp    %eax,%edx
  8034e4:	74 07                	je     8034ed <fd2sockid+0x4e>
  8034e6:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8034eb:	eb 07                	jmp    8034f4 <fd2sockid+0x55>
  8034ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8034f1:	8b 40 0c             	mov    0xc(%rax),%eax
  8034f4:	c9                   	leaveq 
  8034f5:	c3                   	retq   

00000000008034f6 <alloc_sockfd>:
  8034f6:	55                   	push   %rbp
  8034f7:	48 89 e5             	mov    %rsp,%rbp
  8034fa:	48 83 ec 20          	sub    $0x20,%rsp
  8034fe:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803501:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803505:	48 89 c7             	mov    %rax,%rdi
  803508:	48 b8 b4 21 80 00 00 	movabs $0x8021b4,%rax
  80350f:	00 00 00 
  803512:	ff d0                	callq  *%rax
  803514:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803517:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80351b:	78 26                	js     803543 <alloc_sockfd+0x4d>
  80351d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803521:	ba 07 04 00 00       	mov    $0x407,%edx
  803526:	48 89 c6             	mov    %rax,%rsi
  803529:	bf 00 00 00 00       	mov    $0x0,%edi
  80352e:	48 b8 6a 1d 80 00 00 	movabs $0x801d6a,%rax
  803535:	00 00 00 
  803538:	ff d0                	callq  *%rax
  80353a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80353d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803541:	79 16                	jns    803559 <alloc_sockfd+0x63>
  803543:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803546:	89 c7                	mov    %eax,%edi
  803548:	48 b8 05 3a 80 00 00 	movabs $0x803a05,%rax
  80354f:	00 00 00 
  803552:	ff d0                	callq  *%rax
  803554:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803557:	eb 3a                	jmp    803593 <alloc_sockfd+0x9d>
  803559:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80355d:	48 ba c0 60 80 00 00 	movabs $0x8060c0,%rdx
  803564:	00 00 00 
  803567:	8b 12                	mov    (%rdx),%edx
  803569:	89 10                	mov    %edx,(%rax)
  80356b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80356f:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803576:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80357a:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80357d:	89 50 0c             	mov    %edx,0xc(%rax)
  803580:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803584:	48 89 c7             	mov    %rax,%rdi
  803587:	48 b8 66 21 80 00 00 	movabs $0x802166,%rax
  80358e:	00 00 00 
  803591:	ff d0                	callq  *%rax
  803593:	c9                   	leaveq 
  803594:	c3                   	retq   

0000000000803595 <accept>:
  803595:	55                   	push   %rbp
  803596:	48 89 e5             	mov    %rsp,%rbp
  803599:	48 83 ec 30          	sub    $0x30,%rsp
  80359d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8035a0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8035a4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8035a8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8035ab:	89 c7                	mov    %eax,%edi
  8035ad:	48 b8 9f 34 80 00 00 	movabs $0x80349f,%rax
  8035b4:	00 00 00 
  8035b7:	ff d0                	callq  *%rax
  8035b9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035bc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035c0:	79 05                	jns    8035c7 <accept+0x32>
  8035c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035c5:	eb 3b                	jmp    803602 <accept+0x6d>
  8035c7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8035cb:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8035cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035d2:	48 89 ce             	mov    %rcx,%rsi
  8035d5:	89 c7                	mov    %eax,%edi
  8035d7:	48 b8 e2 38 80 00 00 	movabs $0x8038e2,%rax
  8035de:	00 00 00 
  8035e1:	ff d0                	callq  *%rax
  8035e3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035e6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035ea:	79 05                	jns    8035f1 <accept+0x5c>
  8035ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035ef:	eb 11                	jmp    803602 <accept+0x6d>
  8035f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035f4:	89 c7                	mov    %eax,%edi
  8035f6:	48 b8 f6 34 80 00 00 	movabs $0x8034f6,%rax
  8035fd:	00 00 00 
  803600:	ff d0                	callq  *%rax
  803602:	c9                   	leaveq 
  803603:	c3                   	retq   

0000000000803604 <bind>:
  803604:	55                   	push   %rbp
  803605:	48 89 e5             	mov    %rsp,%rbp
  803608:	48 83 ec 20          	sub    $0x20,%rsp
  80360c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80360f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803613:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803616:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803619:	89 c7                	mov    %eax,%edi
  80361b:	48 b8 9f 34 80 00 00 	movabs $0x80349f,%rax
  803622:	00 00 00 
  803625:	ff d0                	callq  *%rax
  803627:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80362a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80362e:	79 05                	jns    803635 <bind+0x31>
  803630:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803633:	eb 1b                	jmp    803650 <bind+0x4c>
  803635:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803638:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80363c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80363f:	48 89 ce             	mov    %rcx,%rsi
  803642:	89 c7                	mov    %eax,%edi
  803644:	48 b8 61 39 80 00 00 	movabs $0x803961,%rax
  80364b:	00 00 00 
  80364e:	ff d0                	callq  *%rax
  803650:	c9                   	leaveq 
  803651:	c3                   	retq   

0000000000803652 <shutdown>:
  803652:	55                   	push   %rbp
  803653:	48 89 e5             	mov    %rsp,%rbp
  803656:	48 83 ec 20          	sub    $0x20,%rsp
  80365a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80365d:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803660:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803663:	89 c7                	mov    %eax,%edi
  803665:	48 b8 9f 34 80 00 00 	movabs $0x80349f,%rax
  80366c:	00 00 00 
  80366f:	ff d0                	callq  *%rax
  803671:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803674:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803678:	79 05                	jns    80367f <shutdown+0x2d>
  80367a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80367d:	eb 16                	jmp    803695 <shutdown+0x43>
  80367f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803682:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803685:	89 d6                	mov    %edx,%esi
  803687:	89 c7                	mov    %eax,%edi
  803689:	48 b8 c5 39 80 00 00 	movabs $0x8039c5,%rax
  803690:	00 00 00 
  803693:	ff d0                	callq  *%rax
  803695:	c9                   	leaveq 
  803696:	c3                   	retq   

0000000000803697 <devsock_close>:
  803697:	55                   	push   %rbp
  803698:	48 89 e5             	mov    %rsp,%rbp
  80369b:	48 83 ec 10          	sub    $0x10,%rsp
  80369f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8036a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8036a7:	48 89 c7             	mov    %rax,%rdi
  8036aa:	48 b8 a4 44 80 00 00 	movabs $0x8044a4,%rax
  8036b1:	00 00 00 
  8036b4:	ff d0                	callq  *%rax
  8036b6:	83 f8 01             	cmp    $0x1,%eax
  8036b9:	75 17                	jne    8036d2 <devsock_close+0x3b>
  8036bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8036bf:	8b 40 0c             	mov    0xc(%rax),%eax
  8036c2:	89 c7                	mov    %eax,%edi
  8036c4:	48 b8 05 3a 80 00 00 	movabs $0x803a05,%rax
  8036cb:	00 00 00 
  8036ce:	ff d0                	callq  *%rax
  8036d0:	eb 05                	jmp    8036d7 <devsock_close+0x40>
  8036d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8036d7:	c9                   	leaveq 
  8036d8:	c3                   	retq   

00000000008036d9 <connect>:
  8036d9:	55                   	push   %rbp
  8036da:	48 89 e5             	mov    %rsp,%rbp
  8036dd:	48 83 ec 20          	sub    $0x20,%rsp
  8036e1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8036e4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8036e8:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8036eb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036ee:	89 c7                	mov    %eax,%edi
  8036f0:	48 b8 9f 34 80 00 00 	movabs $0x80349f,%rax
  8036f7:	00 00 00 
  8036fa:	ff d0                	callq  *%rax
  8036fc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036ff:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803703:	79 05                	jns    80370a <connect+0x31>
  803705:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803708:	eb 1b                	jmp    803725 <connect+0x4c>
  80370a:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80370d:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803711:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803714:	48 89 ce             	mov    %rcx,%rsi
  803717:	89 c7                	mov    %eax,%edi
  803719:	48 b8 32 3a 80 00 00 	movabs $0x803a32,%rax
  803720:	00 00 00 
  803723:	ff d0                	callq  *%rax
  803725:	c9                   	leaveq 
  803726:	c3                   	retq   

0000000000803727 <listen>:
  803727:	55                   	push   %rbp
  803728:	48 89 e5             	mov    %rsp,%rbp
  80372b:	48 83 ec 20          	sub    $0x20,%rsp
  80372f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803732:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803735:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803738:	89 c7                	mov    %eax,%edi
  80373a:	48 b8 9f 34 80 00 00 	movabs $0x80349f,%rax
  803741:	00 00 00 
  803744:	ff d0                	callq  *%rax
  803746:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803749:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80374d:	79 05                	jns    803754 <listen+0x2d>
  80374f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803752:	eb 16                	jmp    80376a <listen+0x43>
  803754:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803757:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80375a:	89 d6                	mov    %edx,%esi
  80375c:	89 c7                	mov    %eax,%edi
  80375e:	48 b8 96 3a 80 00 00 	movabs $0x803a96,%rax
  803765:	00 00 00 
  803768:	ff d0                	callq  *%rax
  80376a:	c9                   	leaveq 
  80376b:	c3                   	retq   

000000000080376c <devsock_read>:
  80376c:	55                   	push   %rbp
  80376d:	48 89 e5             	mov    %rsp,%rbp
  803770:	48 83 ec 20          	sub    $0x20,%rsp
  803774:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803778:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80377c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803780:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803784:	89 c2                	mov    %eax,%edx
  803786:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80378a:	8b 40 0c             	mov    0xc(%rax),%eax
  80378d:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803791:	b9 00 00 00 00       	mov    $0x0,%ecx
  803796:	89 c7                	mov    %eax,%edi
  803798:	48 b8 d6 3a 80 00 00 	movabs $0x803ad6,%rax
  80379f:	00 00 00 
  8037a2:	ff d0                	callq  *%rax
  8037a4:	c9                   	leaveq 
  8037a5:	c3                   	retq   

00000000008037a6 <devsock_write>:
  8037a6:	55                   	push   %rbp
  8037a7:	48 89 e5             	mov    %rsp,%rbp
  8037aa:	48 83 ec 20          	sub    $0x20,%rsp
  8037ae:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8037b2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8037b6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8037ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037be:	89 c2                	mov    %eax,%edx
  8037c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037c4:	8b 40 0c             	mov    0xc(%rax),%eax
  8037c7:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8037cb:	b9 00 00 00 00       	mov    $0x0,%ecx
  8037d0:	89 c7                	mov    %eax,%edi
  8037d2:	48 b8 a2 3b 80 00 00 	movabs $0x803ba2,%rax
  8037d9:	00 00 00 
  8037dc:	ff d0                	callq  *%rax
  8037de:	c9                   	leaveq 
  8037df:	c3                   	retq   

00000000008037e0 <devsock_stat>:
  8037e0:	55                   	push   %rbp
  8037e1:	48 89 e5             	mov    %rsp,%rbp
  8037e4:	48 83 ec 10          	sub    $0x10,%rsp
  8037e8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8037ec:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8037f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037f4:	48 be 22 4c 80 00 00 	movabs $0x804c22,%rsi
  8037fb:	00 00 00 
  8037fe:	48 89 c7             	mov    %rax,%rdi
  803801:	48 b8 3a 14 80 00 00 	movabs $0x80143a,%rax
  803808:	00 00 00 
  80380b:	ff d0                	callq  *%rax
  80380d:	b8 00 00 00 00       	mov    $0x0,%eax
  803812:	c9                   	leaveq 
  803813:	c3                   	retq   

0000000000803814 <socket>:
  803814:	55                   	push   %rbp
  803815:	48 89 e5             	mov    %rsp,%rbp
  803818:	48 83 ec 20          	sub    $0x20,%rsp
  80381c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80381f:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803822:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803825:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803828:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80382b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80382e:	89 ce                	mov    %ecx,%esi
  803830:	89 c7                	mov    %eax,%edi
  803832:	48 b8 5a 3c 80 00 00 	movabs $0x803c5a,%rax
  803839:	00 00 00 
  80383c:	ff d0                	callq  *%rax
  80383e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803841:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803845:	79 05                	jns    80384c <socket+0x38>
  803847:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80384a:	eb 11                	jmp    80385d <socket+0x49>
  80384c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80384f:	89 c7                	mov    %eax,%edi
  803851:	48 b8 f6 34 80 00 00 	movabs $0x8034f6,%rax
  803858:	00 00 00 
  80385b:	ff d0                	callq  *%rax
  80385d:	c9                   	leaveq 
  80385e:	c3                   	retq   

000000000080385f <nsipc>:
  80385f:	55                   	push   %rbp
  803860:	48 89 e5             	mov    %rsp,%rbp
  803863:	48 83 ec 10          	sub    $0x10,%rsp
  803867:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80386a:	48 b8 04 74 80 00 00 	movabs $0x807404,%rax
  803871:	00 00 00 
  803874:	8b 00                	mov    (%rax),%eax
  803876:	85 c0                	test   %eax,%eax
  803878:	75 1f                	jne    803899 <nsipc+0x3a>
  80387a:	bf 02 00 00 00       	mov    $0x2,%edi
  80387f:	48 b8 33 44 80 00 00 	movabs $0x804433,%rax
  803886:	00 00 00 
  803889:	ff d0                	callq  *%rax
  80388b:	89 c2                	mov    %eax,%edx
  80388d:	48 b8 04 74 80 00 00 	movabs $0x807404,%rax
  803894:	00 00 00 
  803897:	89 10                	mov    %edx,(%rax)
  803899:	48 b8 04 74 80 00 00 	movabs $0x807404,%rax
  8038a0:	00 00 00 
  8038a3:	8b 00                	mov    (%rax),%eax
  8038a5:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8038a8:	b9 07 00 00 00       	mov    $0x7,%ecx
  8038ad:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  8038b4:	00 00 00 
  8038b7:	89 c7                	mov    %eax,%edi
  8038b9:	48 b8 29 43 80 00 00 	movabs $0x804329,%rax
  8038c0:	00 00 00 
  8038c3:	ff d0                	callq  *%rax
  8038c5:	ba 00 00 00 00       	mov    $0x0,%edx
  8038ca:	be 00 00 00 00       	mov    $0x0,%esi
  8038cf:	bf 00 00 00 00       	mov    $0x0,%edi
  8038d4:	48 b8 68 42 80 00 00 	movabs $0x804268,%rax
  8038db:	00 00 00 
  8038de:	ff d0                	callq  *%rax
  8038e0:	c9                   	leaveq 
  8038e1:	c3                   	retq   

00000000008038e2 <nsipc_accept>:
  8038e2:	55                   	push   %rbp
  8038e3:	48 89 e5             	mov    %rsp,%rbp
  8038e6:	48 83 ec 30          	sub    $0x30,%rsp
  8038ea:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8038ed:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8038f1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8038f5:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8038fc:	00 00 00 
  8038ff:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803902:	89 10                	mov    %edx,(%rax)
  803904:	bf 01 00 00 00       	mov    $0x1,%edi
  803909:	48 b8 5f 38 80 00 00 	movabs $0x80385f,%rax
  803910:	00 00 00 
  803913:	ff d0                	callq  *%rax
  803915:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803918:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80391c:	78 3e                	js     80395c <nsipc_accept+0x7a>
  80391e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803925:	00 00 00 
  803928:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80392c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803930:	8b 40 10             	mov    0x10(%rax),%eax
  803933:	89 c2                	mov    %eax,%edx
  803935:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803939:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80393d:	48 89 ce             	mov    %rcx,%rsi
  803940:	48 89 c7             	mov    %rax,%rdi
  803943:	48 b8 5f 17 80 00 00 	movabs $0x80175f,%rax
  80394a:	00 00 00 
  80394d:	ff d0                	callq  *%rax
  80394f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803953:	8b 50 10             	mov    0x10(%rax),%edx
  803956:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80395a:	89 10                	mov    %edx,(%rax)
  80395c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80395f:	c9                   	leaveq 
  803960:	c3                   	retq   

0000000000803961 <nsipc_bind>:
  803961:	55                   	push   %rbp
  803962:	48 89 e5             	mov    %rsp,%rbp
  803965:	48 83 ec 10          	sub    $0x10,%rsp
  803969:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80396c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803970:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803973:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80397a:	00 00 00 
  80397d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803980:	89 10                	mov    %edx,(%rax)
  803982:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803985:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803989:	48 89 c6             	mov    %rax,%rsi
  80398c:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  803993:	00 00 00 
  803996:	48 b8 5f 17 80 00 00 	movabs $0x80175f,%rax
  80399d:	00 00 00 
  8039a0:	ff d0                	callq  *%rax
  8039a2:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8039a9:	00 00 00 
  8039ac:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8039af:	89 50 14             	mov    %edx,0x14(%rax)
  8039b2:	bf 02 00 00 00       	mov    $0x2,%edi
  8039b7:	48 b8 5f 38 80 00 00 	movabs $0x80385f,%rax
  8039be:	00 00 00 
  8039c1:	ff d0                	callq  *%rax
  8039c3:	c9                   	leaveq 
  8039c4:	c3                   	retq   

00000000008039c5 <nsipc_shutdown>:
  8039c5:	55                   	push   %rbp
  8039c6:	48 89 e5             	mov    %rsp,%rbp
  8039c9:	48 83 ec 10          	sub    $0x10,%rsp
  8039cd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8039d0:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8039d3:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8039da:	00 00 00 
  8039dd:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8039e0:	89 10                	mov    %edx,(%rax)
  8039e2:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8039e9:	00 00 00 
  8039ec:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8039ef:	89 50 04             	mov    %edx,0x4(%rax)
  8039f2:	bf 03 00 00 00       	mov    $0x3,%edi
  8039f7:	48 b8 5f 38 80 00 00 	movabs $0x80385f,%rax
  8039fe:	00 00 00 
  803a01:	ff d0                	callq  *%rax
  803a03:	c9                   	leaveq 
  803a04:	c3                   	retq   

0000000000803a05 <nsipc_close>:
  803a05:	55                   	push   %rbp
  803a06:	48 89 e5             	mov    %rsp,%rbp
  803a09:	48 83 ec 10          	sub    $0x10,%rsp
  803a0d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803a10:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a17:	00 00 00 
  803a1a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803a1d:	89 10                	mov    %edx,(%rax)
  803a1f:	bf 04 00 00 00       	mov    $0x4,%edi
  803a24:	48 b8 5f 38 80 00 00 	movabs $0x80385f,%rax
  803a2b:	00 00 00 
  803a2e:	ff d0                	callq  *%rax
  803a30:	c9                   	leaveq 
  803a31:	c3                   	retq   

0000000000803a32 <nsipc_connect>:
  803a32:	55                   	push   %rbp
  803a33:	48 89 e5             	mov    %rsp,%rbp
  803a36:	48 83 ec 10          	sub    $0x10,%rsp
  803a3a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803a3d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803a41:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803a44:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a4b:	00 00 00 
  803a4e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803a51:	89 10                	mov    %edx,(%rax)
  803a53:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803a56:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a5a:	48 89 c6             	mov    %rax,%rsi
  803a5d:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  803a64:	00 00 00 
  803a67:	48 b8 5f 17 80 00 00 	movabs $0x80175f,%rax
  803a6e:	00 00 00 
  803a71:	ff d0                	callq  *%rax
  803a73:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a7a:	00 00 00 
  803a7d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803a80:	89 50 14             	mov    %edx,0x14(%rax)
  803a83:	bf 05 00 00 00       	mov    $0x5,%edi
  803a88:	48 b8 5f 38 80 00 00 	movabs $0x80385f,%rax
  803a8f:	00 00 00 
  803a92:	ff d0                	callq  *%rax
  803a94:	c9                   	leaveq 
  803a95:	c3                   	retq   

0000000000803a96 <nsipc_listen>:
  803a96:	55                   	push   %rbp
  803a97:	48 89 e5             	mov    %rsp,%rbp
  803a9a:	48 83 ec 10          	sub    $0x10,%rsp
  803a9e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803aa1:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803aa4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803aab:	00 00 00 
  803aae:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ab1:	89 10                	mov    %edx,(%rax)
  803ab3:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803aba:	00 00 00 
  803abd:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ac0:	89 50 04             	mov    %edx,0x4(%rax)
  803ac3:	bf 06 00 00 00       	mov    $0x6,%edi
  803ac8:	48 b8 5f 38 80 00 00 	movabs $0x80385f,%rax
  803acf:	00 00 00 
  803ad2:	ff d0                	callq  *%rax
  803ad4:	c9                   	leaveq 
  803ad5:	c3                   	retq   

0000000000803ad6 <nsipc_recv>:
  803ad6:	55                   	push   %rbp
  803ad7:	48 89 e5             	mov    %rsp,%rbp
  803ada:	48 83 ec 30          	sub    $0x30,%rsp
  803ade:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ae1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803ae5:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803ae8:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803aeb:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803af2:	00 00 00 
  803af5:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803af8:	89 10                	mov    %edx,(%rax)
  803afa:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803b01:	00 00 00 
  803b04:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803b07:	89 50 04             	mov    %edx,0x4(%rax)
  803b0a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803b11:	00 00 00 
  803b14:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803b17:	89 50 08             	mov    %edx,0x8(%rax)
  803b1a:	bf 07 00 00 00       	mov    $0x7,%edi
  803b1f:	48 b8 5f 38 80 00 00 	movabs $0x80385f,%rax
  803b26:	00 00 00 
  803b29:	ff d0                	callq  *%rax
  803b2b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b2e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b32:	78 69                	js     803b9d <nsipc_recv+0xc7>
  803b34:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803b3b:	7f 08                	jg     803b45 <nsipc_recv+0x6f>
  803b3d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b40:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803b43:	7e 35                	jle    803b7a <nsipc_recv+0xa4>
  803b45:	48 b9 29 4c 80 00 00 	movabs $0x804c29,%rcx
  803b4c:	00 00 00 
  803b4f:	48 ba 3e 4c 80 00 00 	movabs $0x804c3e,%rdx
  803b56:	00 00 00 
  803b59:	be 62 00 00 00       	mov    $0x62,%esi
  803b5e:	48 bf 53 4c 80 00 00 	movabs $0x804c53,%rdi
  803b65:	00 00 00 
  803b68:	b8 00 00 00 00       	mov    $0x0,%eax
  803b6d:	49 b8 12 05 80 00 00 	movabs $0x800512,%r8
  803b74:	00 00 00 
  803b77:	41 ff d0             	callq  *%r8
  803b7a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b7d:	48 63 d0             	movslq %eax,%rdx
  803b80:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b84:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803b8b:	00 00 00 
  803b8e:	48 89 c7             	mov    %rax,%rdi
  803b91:	48 b8 5f 17 80 00 00 	movabs $0x80175f,%rax
  803b98:	00 00 00 
  803b9b:	ff d0                	callq  *%rax
  803b9d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ba0:	c9                   	leaveq 
  803ba1:	c3                   	retq   

0000000000803ba2 <nsipc_send>:
  803ba2:	55                   	push   %rbp
  803ba3:	48 89 e5             	mov    %rsp,%rbp
  803ba6:	48 83 ec 20          	sub    $0x20,%rsp
  803baa:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803bad:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803bb1:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803bb4:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803bb7:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803bbe:	00 00 00 
  803bc1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803bc4:	89 10                	mov    %edx,(%rax)
  803bc6:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803bcd:	7e 35                	jle    803c04 <nsipc_send+0x62>
  803bcf:	48 b9 62 4c 80 00 00 	movabs $0x804c62,%rcx
  803bd6:	00 00 00 
  803bd9:	48 ba 3e 4c 80 00 00 	movabs $0x804c3e,%rdx
  803be0:	00 00 00 
  803be3:	be 6d 00 00 00       	mov    $0x6d,%esi
  803be8:	48 bf 53 4c 80 00 00 	movabs $0x804c53,%rdi
  803bef:	00 00 00 
  803bf2:	b8 00 00 00 00       	mov    $0x0,%eax
  803bf7:	49 b8 12 05 80 00 00 	movabs $0x800512,%r8
  803bfe:	00 00 00 
  803c01:	41 ff d0             	callq  *%r8
  803c04:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803c07:	48 63 d0             	movslq %eax,%rdx
  803c0a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c0e:	48 89 c6             	mov    %rax,%rsi
  803c11:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  803c18:	00 00 00 
  803c1b:	48 b8 5f 17 80 00 00 	movabs $0x80175f,%rax
  803c22:	00 00 00 
  803c25:	ff d0                	callq  *%rax
  803c27:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803c2e:	00 00 00 
  803c31:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c34:	89 50 04             	mov    %edx,0x4(%rax)
  803c37:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803c3e:	00 00 00 
  803c41:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803c44:	89 50 08             	mov    %edx,0x8(%rax)
  803c47:	bf 08 00 00 00       	mov    $0x8,%edi
  803c4c:	48 b8 5f 38 80 00 00 	movabs $0x80385f,%rax
  803c53:	00 00 00 
  803c56:	ff d0                	callq  *%rax
  803c58:	c9                   	leaveq 
  803c59:	c3                   	retq   

0000000000803c5a <nsipc_socket>:
  803c5a:	55                   	push   %rbp
  803c5b:	48 89 e5             	mov    %rsp,%rbp
  803c5e:	48 83 ec 10          	sub    $0x10,%rsp
  803c62:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c65:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803c68:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803c6b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803c72:	00 00 00 
  803c75:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c78:	89 10                	mov    %edx,(%rax)
  803c7a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803c81:	00 00 00 
  803c84:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c87:	89 50 04             	mov    %edx,0x4(%rax)
  803c8a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803c91:	00 00 00 
  803c94:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803c97:	89 50 08             	mov    %edx,0x8(%rax)
  803c9a:	bf 09 00 00 00       	mov    $0x9,%edi
  803c9f:	48 b8 5f 38 80 00 00 	movabs $0x80385f,%rax
  803ca6:	00 00 00 
  803ca9:	ff d0                	callq  *%rax
  803cab:	c9                   	leaveq 
  803cac:	c3                   	retq   

0000000000803cad <pipe>:
  803cad:	55                   	push   %rbp
  803cae:	48 89 e5             	mov    %rsp,%rbp
  803cb1:	53                   	push   %rbx
  803cb2:	48 83 ec 38          	sub    $0x38,%rsp
  803cb6:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803cba:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803cbe:	48 89 c7             	mov    %rax,%rdi
  803cc1:	48 b8 b4 21 80 00 00 	movabs $0x8021b4,%rax
  803cc8:	00 00 00 
  803ccb:	ff d0                	callq  *%rax
  803ccd:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803cd0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803cd4:	0f 88 bf 01 00 00    	js     803e99 <pipe+0x1ec>
  803cda:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803cde:	ba 07 04 00 00       	mov    $0x407,%edx
  803ce3:	48 89 c6             	mov    %rax,%rsi
  803ce6:	bf 00 00 00 00       	mov    $0x0,%edi
  803ceb:	48 b8 6a 1d 80 00 00 	movabs $0x801d6a,%rax
  803cf2:	00 00 00 
  803cf5:	ff d0                	callq  *%rax
  803cf7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803cfa:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803cfe:	0f 88 95 01 00 00    	js     803e99 <pipe+0x1ec>
  803d04:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803d08:	48 89 c7             	mov    %rax,%rdi
  803d0b:	48 b8 b4 21 80 00 00 	movabs $0x8021b4,%rax
  803d12:	00 00 00 
  803d15:	ff d0                	callq  *%rax
  803d17:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803d1a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803d1e:	0f 88 5d 01 00 00    	js     803e81 <pipe+0x1d4>
  803d24:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d28:	ba 07 04 00 00       	mov    $0x407,%edx
  803d2d:	48 89 c6             	mov    %rax,%rsi
  803d30:	bf 00 00 00 00       	mov    $0x0,%edi
  803d35:	48 b8 6a 1d 80 00 00 	movabs $0x801d6a,%rax
  803d3c:	00 00 00 
  803d3f:	ff d0                	callq  *%rax
  803d41:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803d44:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803d48:	0f 88 33 01 00 00    	js     803e81 <pipe+0x1d4>
  803d4e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d52:	48 89 c7             	mov    %rax,%rdi
  803d55:	48 b8 89 21 80 00 00 	movabs $0x802189,%rax
  803d5c:	00 00 00 
  803d5f:	ff d0                	callq  *%rax
  803d61:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803d65:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803d69:	ba 07 04 00 00       	mov    $0x407,%edx
  803d6e:	48 89 c6             	mov    %rax,%rsi
  803d71:	bf 00 00 00 00       	mov    $0x0,%edi
  803d76:	48 b8 6a 1d 80 00 00 	movabs $0x801d6a,%rax
  803d7d:	00 00 00 
  803d80:	ff d0                	callq  *%rax
  803d82:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803d85:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803d89:	0f 88 d9 00 00 00    	js     803e68 <pipe+0x1bb>
  803d8f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d93:	48 89 c7             	mov    %rax,%rdi
  803d96:	48 b8 89 21 80 00 00 	movabs $0x802189,%rax
  803d9d:	00 00 00 
  803da0:	ff d0                	callq  *%rax
  803da2:	48 89 c2             	mov    %rax,%rdx
  803da5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803da9:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803daf:	48 89 d1             	mov    %rdx,%rcx
  803db2:	ba 00 00 00 00       	mov    $0x0,%edx
  803db7:	48 89 c6             	mov    %rax,%rsi
  803dba:	bf 00 00 00 00       	mov    $0x0,%edi
  803dbf:	48 b8 bc 1d 80 00 00 	movabs $0x801dbc,%rax
  803dc6:	00 00 00 
  803dc9:	ff d0                	callq  *%rax
  803dcb:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803dce:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803dd2:	78 79                	js     803e4d <pipe+0x1a0>
  803dd4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803dd8:	48 ba 00 61 80 00 00 	movabs $0x806100,%rdx
  803ddf:	00 00 00 
  803de2:	8b 12                	mov    (%rdx),%edx
  803de4:	89 10                	mov    %edx,(%rax)
  803de6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803dea:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803df1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803df5:	48 ba 00 61 80 00 00 	movabs $0x806100,%rdx
  803dfc:	00 00 00 
  803dff:	8b 12                	mov    (%rdx),%edx
  803e01:	89 10                	mov    %edx,(%rax)
  803e03:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e07:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803e0e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e12:	48 89 c7             	mov    %rax,%rdi
  803e15:	48 b8 66 21 80 00 00 	movabs $0x802166,%rax
  803e1c:	00 00 00 
  803e1f:	ff d0                	callq  *%rax
  803e21:	89 c2                	mov    %eax,%edx
  803e23:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803e27:	89 10                	mov    %edx,(%rax)
  803e29:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803e2d:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803e31:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e35:	48 89 c7             	mov    %rax,%rdi
  803e38:	48 b8 66 21 80 00 00 	movabs $0x802166,%rax
  803e3f:	00 00 00 
  803e42:	ff d0                	callq  *%rax
  803e44:	89 03                	mov    %eax,(%rbx)
  803e46:	b8 00 00 00 00       	mov    $0x0,%eax
  803e4b:	eb 4f                	jmp    803e9c <pipe+0x1ef>
  803e4d:	90                   	nop
  803e4e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e52:	48 89 c6             	mov    %rax,%rsi
  803e55:	bf 00 00 00 00       	mov    $0x0,%edi
  803e5a:	48 b8 1c 1e 80 00 00 	movabs $0x801e1c,%rax
  803e61:	00 00 00 
  803e64:	ff d0                	callq  *%rax
  803e66:	eb 01                	jmp    803e69 <pipe+0x1bc>
  803e68:	90                   	nop
  803e69:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e6d:	48 89 c6             	mov    %rax,%rsi
  803e70:	bf 00 00 00 00       	mov    $0x0,%edi
  803e75:	48 b8 1c 1e 80 00 00 	movabs $0x801e1c,%rax
  803e7c:	00 00 00 
  803e7f:	ff d0                	callq  *%rax
  803e81:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e85:	48 89 c6             	mov    %rax,%rsi
  803e88:	bf 00 00 00 00       	mov    $0x0,%edi
  803e8d:	48 b8 1c 1e 80 00 00 	movabs $0x801e1c,%rax
  803e94:	00 00 00 
  803e97:	ff d0                	callq  *%rax
  803e99:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803e9c:	48 83 c4 38          	add    $0x38,%rsp
  803ea0:	5b                   	pop    %rbx
  803ea1:	5d                   	pop    %rbp
  803ea2:	c3                   	retq   

0000000000803ea3 <_pipeisclosed>:
  803ea3:	55                   	push   %rbp
  803ea4:	48 89 e5             	mov    %rsp,%rbp
  803ea7:	53                   	push   %rbx
  803ea8:	48 83 ec 28          	sub    $0x28,%rsp
  803eac:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803eb0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803eb4:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  803ebb:	00 00 00 
  803ebe:	48 8b 00             	mov    (%rax),%rax
  803ec1:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803ec7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803eca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ece:	48 89 c7             	mov    %rax,%rdi
  803ed1:	48 b8 a4 44 80 00 00 	movabs $0x8044a4,%rax
  803ed8:	00 00 00 
  803edb:	ff d0                	callq  *%rax
  803edd:	89 c3                	mov    %eax,%ebx
  803edf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ee3:	48 89 c7             	mov    %rax,%rdi
  803ee6:	48 b8 a4 44 80 00 00 	movabs $0x8044a4,%rax
  803eed:	00 00 00 
  803ef0:	ff d0                	callq  *%rax
  803ef2:	39 c3                	cmp    %eax,%ebx
  803ef4:	0f 94 c0             	sete   %al
  803ef7:	0f b6 c0             	movzbl %al,%eax
  803efa:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803efd:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  803f04:	00 00 00 
  803f07:	48 8b 00             	mov    (%rax),%rax
  803f0a:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803f10:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803f13:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f16:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803f19:	75 05                	jne    803f20 <_pipeisclosed+0x7d>
  803f1b:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803f1e:	eb 4a                	jmp    803f6a <_pipeisclosed+0xc7>
  803f20:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f23:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803f26:	74 8c                	je     803eb4 <_pipeisclosed+0x11>
  803f28:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803f2c:	75 86                	jne    803eb4 <_pipeisclosed+0x11>
  803f2e:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  803f35:	00 00 00 
  803f38:	48 8b 00             	mov    (%rax),%rax
  803f3b:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803f41:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803f44:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f47:	89 c6                	mov    %eax,%esi
  803f49:	48 bf 73 4c 80 00 00 	movabs $0x804c73,%rdi
  803f50:	00 00 00 
  803f53:	b8 00 00 00 00       	mov    $0x0,%eax
  803f58:	49 b8 4c 07 80 00 00 	movabs $0x80074c,%r8
  803f5f:	00 00 00 
  803f62:	41 ff d0             	callq  *%r8
  803f65:	e9 4a ff ff ff       	jmpq   803eb4 <_pipeisclosed+0x11>
  803f6a:	48 83 c4 28          	add    $0x28,%rsp
  803f6e:	5b                   	pop    %rbx
  803f6f:	5d                   	pop    %rbp
  803f70:	c3                   	retq   

0000000000803f71 <pipeisclosed>:
  803f71:	55                   	push   %rbp
  803f72:	48 89 e5             	mov    %rsp,%rbp
  803f75:	48 83 ec 30          	sub    $0x30,%rsp
  803f79:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803f7c:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803f80:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803f83:	48 89 d6             	mov    %rdx,%rsi
  803f86:	89 c7                	mov    %eax,%edi
  803f88:	48 b8 4c 22 80 00 00 	movabs $0x80224c,%rax
  803f8f:	00 00 00 
  803f92:	ff d0                	callq  *%rax
  803f94:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f97:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f9b:	79 05                	jns    803fa2 <pipeisclosed+0x31>
  803f9d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fa0:	eb 31                	jmp    803fd3 <pipeisclosed+0x62>
  803fa2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803fa6:	48 89 c7             	mov    %rax,%rdi
  803fa9:	48 b8 89 21 80 00 00 	movabs $0x802189,%rax
  803fb0:	00 00 00 
  803fb3:	ff d0                	callq  *%rax
  803fb5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803fb9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803fbd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803fc1:	48 89 d6             	mov    %rdx,%rsi
  803fc4:	48 89 c7             	mov    %rax,%rdi
  803fc7:	48 b8 a3 3e 80 00 00 	movabs $0x803ea3,%rax
  803fce:	00 00 00 
  803fd1:	ff d0                	callq  *%rax
  803fd3:	c9                   	leaveq 
  803fd4:	c3                   	retq   

0000000000803fd5 <devpipe_read>:
  803fd5:	55                   	push   %rbp
  803fd6:	48 89 e5             	mov    %rsp,%rbp
  803fd9:	48 83 ec 40          	sub    $0x40,%rsp
  803fdd:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803fe1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803fe5:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803fe9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803fed:	48 89 c7             	mov    %rax,%rdi
  803ff0:	48 b8 89 21 80 00 00 	movabs $0x802189,%rax
  803ff7:	00 00 00 
  803ffa:	ff d0                	callq  *%rax
  803ffc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804000:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804004:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804008:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80400f:	00 
  804010:	e9 90 00 00 00       	jmpq   8040a5 <devpipe_read+0xd0>
  804015:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  80401a:	74 09                	je     804025 <devpipe_read+0x50>
  80401c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804020:	e9 8e 00 00 00       	jmpq   8040b3 <devpipe_read+0xde>
  804025:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804029:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80402d:	48 89 d6             	mov    %rdx,%rsi
  804030:	48 89 c7             	mov    %rax,%rdi
  804033:	48 b8 a3 3e 80 00 00 	movabs $0x803ea3,%rax
  80403a:	00 00 00 
  80403d:	ff d0                	callq  *%rax
  80403f:	85 c0                	test   %eax,%eax
  804041:	74 07                	je     80404a <devpipe_read+0x75>
  804043:	b8 00 00 00 00       	mov    $0x0,%eax
  804048:	eb 69                	jmp    8040b3 <devpipe_read+0xde>
  80404a:	48 b8 2d 1d 80 00 00 	movabs $0x801d2d,%rax
  804051:	00 00 00 
  804054:	ff d0                	callq  *%rax
  804056:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80405a:	8b 10                	mov    (%rax),%edx
  80405c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804060:	8b 40 04             	mov    0x4(%rax),%eax
  804063:	39 c2                	cmp    %eax,%edx
  804065:	74 ae                	je     804015 <devpipe_read+0x40>
  804067:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80406b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80406f:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  804073:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804077:	8b 00                	mov    (%rax),%eax
  804079:	99                   	cltd   
  80407a:	c1 ea 1b             	shr    $0x1b,%edx
  80407d:	01 d0                	add    %edx,%eax
  80407f:	83 e0 1f             	and    $0x1f,%eax
  804082:	29 d0                	sub    %edx,%eax
  804084:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804088:	48 98                	cltq   
  80408a:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  80408f:	88 01                	mov    %al,(%rcx)
  804091:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804095:	8b 00                	mov    (%rax),%eax
  804097:	8d 50 01             	lea    0x1(%rax),%edx
  80409a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80409e:	89 10                	mov    %edx,(%rax)
  8040a0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8040a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040a9:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8040ad:	72 a7                	jb     804056 <devpipe_read+0x81>
  8040af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040b3:	c9                   	leaveq 
  8040b4:	c3                   	retq   

00000000008040b5 <devpipe_write>:
  8040b5:	55                   	push   %rbp
  8040b6:	48 89 e5             	mov    %rsp,%rbp
  8040b9:	48 83 ec 40          	sub    $0x40,%rsp
  8040bd:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8040c1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8040c5:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8040c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8040cd:	48 89 c7             	mov    %rax,%rdi
  8040d0:	48 b8 89 21 80 00 00 	movabs $0x802189,%rax
  8040d7:	00 00 00 
  8040da:	ff d0                	callq  *%rax
  8040dc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8040e0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8040e4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8040e8:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8040ef:	00 
  8040f0:	e9 8f 00 00 00       	jmpq   804184 <devpipe_write+0xcf>
  8040f5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8040f9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8040fd:	48 89 d6             	mov    %rdx,%rsi
  804100:	48 89 c7             	mov    %rax,%rdi
  804103:	48 b8 a3 3e 80 00 00 	movabs $0x803ea3,%rax
  80410a:	00 00 00 
  80410d:	ff d0                	callq  *%rax
  80410f:	85 c0                	test   %eax,%eax
  804111:	74 07                	je     80411a <devpipe_write+0x65>
  804113:	b8 00 00 00 00       	mov    $0x0,%eax
  804118:	eb 78                	jmp    804192 <devpipe_write+0xdd>
  80411a:	48 b8 2d 1d 80 00 00 	movabs $0x801d2d,%rax
  804121:	00 00 00 
  804124:	ff d0                	callq  *%rax
  804126:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80412a:	8b 40 04             	mov    0x4(%rax),%eax
  80412d:	48 63 d0             	movslq %eax,%rdx
  804130:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804134:	8b 00                	mov    (%rax),%eax
  804136:	48 98                	cltq   
  804138:	48 83 c0 20          	add    $0x20,%rax
  80413c:	48 39 c2             	cmp    %rax,%rdx
  80413f:	73 b4                	jae    8040f5 <devpipe_write+0x40>
  804141:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804145:	8b 40 04             	mov    0x4(%rax),%eax
  804148:	99                   	cltd   
  804149:	c1 ea 1b             	shr    $0x1b,%edx
  80414c:	01 d0                	add    %edx,%eax
  80414e:	83 e0 1f             	and    $0x1f,%eax
  804151:	29 d0                	sub    %edx,%eax
  804153:	89 c6                	mov    %eax,%esi
  804155:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804159:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80415d:	48 01 d0             	add    %rdx,%rax
  804160:	0f b6 08             	movzbl (%rax),%ecx
  804163:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804167:	48 63 c6             	movslq %esi,%rax
  80416a:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80416e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804172:	8b 40 04             	mov    0x4(%rax),%eax
  804175:	8d 50 01             	lea    0x1(%rax),%edx
  804178:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80417c:	89 50 04             	mov    %edx,0x4(%rax)
  80417f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804184:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804188:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80418c:	72 98                	jb     804126 <devpipe_write+0x71>
  80418e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804192:	c9                   	leaveq 
  804193:	c3                   	retq   

0000000000804194 <devpipe_stat>:
  804194:	55                   	push   %rbp
  804195:	48 89 e5             	mov    %rsp,%rbp
  804198:	48 83 ec 20          	sub    $0x20,%rsp
  80419c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8041a0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8041a4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8041a8:	48 89 c7             	mov    %rax,%rdi
  8041ab:	48 b8 89 21 80 00 00 	movabs $0x802189,%rax
  8041b2:	00 00 00 
  8041b5:	ff d0                	callq  *%rax
  8041b7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8041bb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8041bf:	48 be 86 4c 80 00 00 	movabs $0x804c86,%rsi
  8041c6:	00 00 00 
  8041c9:	48 89 c7             	mov    %rax,%rdi
  8041cc:	48 b8 3a 14 80 00 00 	movabs $0x80143a,%rax
  8041d3:	00 00 00 
  8041d6:	ff d0                	callq  *%rax
  8041d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041dc:	8b 50 04             	mov    0x4(%rax),%edx
  8041df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041e3:	8b 00                	mov    (%rax),%eax
  8041e5:	29 c2                	sub    %eax,%edx
  8041e7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8041eb:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8041f1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8041f5:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8041fc:	00 00 00 
  8041ff:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804203:	48 b9 00 61 80 00 00 	movabs $0x806100,%rcx
  80420a:	00 00 00 
  80420d:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804214:	b8 00 00 00 00       	mov    $0x0,%eax
  804219:	c9                   	leaveq 
  80421a:	c3                   	retq   

000000000080421b <devpipe_close>:
  80421b:	55                   	push   %rbp
  80421c:	48 89 e5             	mov    %rsp,%rbp
  80421f:	48 83 ec 10          	sub    $0x10,%rsp
  804223:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804227:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80422b:	48 89 c6             	mov    %rax,%rsi
  80422e:	bf 00 00 00 00       	mov    $0x0,%edi
  804233:	48 b8 1c 1e 80 00 00 	movabs $0x801e1c,%rax
  80423a:	00 00 00 
  80423d:	ff d0                	callq  *%rax
  80423f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804243:	48 89 c7             	mov    %rax,%rdi
  804246:	48 b8 89 21 80 00 00 	movabs $0x802189,%rax
  80424d:	00 00 00 
  804250:	ff d0                	callq  *%rax
  804252:	48 89 c6             	mov    %rax,%rsi
  804255:	bf 00 00 00 00       	mov    $0x0,%edi
  80425a:	48 b8 1c 1e 80 00 00 	movabs $0x801e1c,%rax
  804261:	00 00 00 
  804264:	ff d0                	callq  *%rax
  804266:	c9                   	leaveq 
  804267:	c3                   	retq   

0000000000804268 <ipc_recv>:
  804268:	55                   	push   %rbp
  804269:	48 89 e5             	mov    %rsp,%rbp
  80426c:	48 83 ec 30          	sub    $0x30,%rsp
  804270:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804274:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804278:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80427c:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804281:	75 0e                	jne    804291 <ipc_recv+0x29>
  804283:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80428a:	00 00 00 
  80428d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804291:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804295:	48 89 c7             	mov    %rax,%rdi
  804298:	48 b8 a4 1f 80 00 00 	movabs $0x801fa4,%rax
  80429f:	00 00 00 
  8042a2:	ff d0                	callq  *%rax
  8042a4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8042a7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8042ab:	79 27                	jns    8042d4 <ipc_recv+0x6c>
  8042ad:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8042b2:	74 0a                	je     8042be <ipc_recv+0x56>
  8042b4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042b8:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8042be:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8042c3:	74 0a                	je     8042cf <ipc_recv+0x67>
  8042c5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042c9:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8042cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042d2:	eb 53                	jmp    804327 <ipc_recv+0xbf>
  8042d4:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8042d9:	74 19                	je     8042f4 <ipc_recv+0x8c>
  8042db:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  8042e2:	00 00 00 
  8042e5:	48 8b 00             	mov    (%rax),%rax
  8042e8:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8042ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042f2:	89 10                	mov    %edx,(%rax)
  8042f4:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8042f9:	74 19                	je     804314 <ipc_recv+0xac>
  8042fb:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  804302:	00 00 00 
  804305:	48 8b 00             	mov    (%rax),%rax
  804308:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  80430e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804312:	89 10                	mov    %edx,(%rax)
  804314:	48 b8 08 74 80 00 00 	movabs $0x807408,%rax
  80431b:	00 00 00 
  80431e:	48 8b 00             	mov    (%rax),%rax
  804321:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804327:	c9                   	leaveq 
  804328:	c3                   	retq   

0000000000804329 <ipc_send>:
  804329:	55                   	push   %rbp
  80432a:	48 89 e5             	mov    %rsp,%rbp
  80432d:	48 83 ec 30          	sub    $0x30,%rsp
  804331:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804334:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804337:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  80433b:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80433e:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804343:	75 1c                	jne    804361 <ipc_send+0x38>
  804345:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80434c:	00 00 00 
  80434f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804353:	eb 0c                	jmp    804361 <ipc_send+0x38>
  804355:	48 b8 2d 1d 80 00 00 	movabs $0x801d2d,%rax
  80435c:	00 00 00 
  80435f:	ff d0                	callq  *%rax
  804361:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804364:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804367:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80436b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80436e:	89 c7                	mov    %eax,%edi
  804370:	48 b8 4d 1f 80 00 00 	movabs $0x801f4d,%rax
  804377:	00 00 00 
  80437a:	ff d0                	callq  *%rax
  80437c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80437f:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804383:	74 d0                	je     804355 <ipc_send+0x2c>
  804385:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804389:	79 30                	jns    8043bb <ipc_send+0x92>
  80438b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80438e:	89 c1                	mov    %eax,%ecx
  804390:	48 ba 90 4c 80 00 00 	movabs $0x804c90,%rdx
  804397:	00 00 00 
  80439a:	be 44 00 00 00       	mov    $0x44,%esi
  80439f:	48 bf a6 4c 80 00 00 	movabs $0x804ca6,%rdi
  8043a6:	00 00 00 
  8043a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8043ae:	49 b8 12 05 80 00 00 	movabs $0x800512,%r8
  8043b5:	00 00 00 
  8043b8:	41 ff d0             	callq  *%r8
  8043bb:	90                   	nop
  8043bc:	c9                   	leaveq 
  8043bd:	c3                   	retq   

00000000008043be <ipc_host_recv>:
  8043be:	55                   	push   %rbp
  8043bf:	48 89 e5             	mov    %rsp,%rbp
  8043c2:	48 83 ec 10          	sub    $0x10,%rsp
  8043c6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8043ca:	48 ba b8 4c 80 00 00 	movabs $0x804cb8,%rdx
  8043d1:	00 00 00 
  8043d4:	be 4e 00 00 00       	mov    $0x4e,%esi
  8043d9:	48 bf a6 4c 80 00 00 	movabs $0x804ca6,%rdi
  8043e0:	00 00 00 
  8043e3:	b8 00 00 00 00       	mov    $0x0,%eax
  8043e8:	48 b9 12 05 80 00 00 	movabs $0x800512,%rcx
  8043ef:	00 00 00 
  8043f2:	ff d1                	callq  *%rcx

00000000008043f4 <ipc_host_send>:
  8043f4:	55                   	push   %rbp
  8043f5:	48 89 e5             	mov    %rsp,%rbp
  8043f8:	48 83 ec 20          	sub    $0x20,%rsp
  8043fc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8043ff:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804402:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  804406:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804409:	48 ba d8 4c 80 00 00 	movabs $0x804cd8,%rdx
  804410:	00 00 00 
  804413:	be 58 00 00 00       	mov    $0x58,%esi
  804418:	48 bf a6 4c 80 00 00 	movabs $0x804ca6,%rdi
  80441f:	00 00 00 
  804422:	b8 00 00 00 00       	mov    $0x0,%eax
  804427:	48 b9 12 05 80 00 00 	movabs $0x800512,%rcx
  80442e:	00 00 00 
  804431:	ff d1                	callq  *%rcx

0000000000804433 <ipc_find_env>:
  804433:	55                   	push   %rbp
  804434:	48 89 e5             	mov    %rsp,%rbp
  804437:	48 83 ec 18          	sub    $0x18,%rsp
  80443b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80443e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804445:	eb 4d                	jmp    804494 <ipc_find_env+0x61>
  804447:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80444e:	00 00 00 
  804451:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804454:	48 98                	cltq   
  804456:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80445d:	48 01 d0             	add    %rdx,%rax
  804460:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804466:	8b 00                	mov    (%rax),%eax
  804468:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80446b:	75 23                	jne    804490 <ipc_find_env+0x5d>
  80446d:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804474:	00 00 00 
  804477:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80447a:	48 98                	cltq   
  80447c:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804483:	48 01 d0             	add    %rdx,%rax
  804486:	48 05 c8 00 00 00    	add    $0xc8,%rax
  80448c:	8b 00                	mov    (%rax),%eax
  80448e:	eb 12                	jmp    8044a2 <ipc_find_env+0x6f>
  804490:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804494:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  80449b:	7e aa                	jle    804447 <ipc_find_env+0x14>
  80449d:	b8 00 00 00 00       	mov    $0x0,%eax
  8044a2:	c9                   	leaveq 
  8044a3:	c3                   	retq   

00000000008044a4 <pageref>:
  8044a4:	55                   	push   %rbp
  8044a5:	48 89 e5             	mov    %rsp,%rbp
  8044a8:	48 83 ec 18          	sub    $0x18,%rsp
  8044ac:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8044b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8044b4:	48 c1 e8 15          	shr    $0x15,%rax
  8044b8:	48 89 c2             	mov    %rax,%rdx
  8044bb:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8044c2:	01 00 00 
  8044c5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8044c9:	83 e0 01             	and    $0x1,%eax
  8044cc:	48 85 c0             	test   %rax,%rax
  8044cf:	75 07                	jne    8044d8 <pageref+0x34>
  8044d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8044d6:	eb 56                	jmp    80452e <pageref+0x8a>
  8044d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8044dc:	48 c1 e8 0c          	shr    $0xc,%rax
  8044e0:	48 89 c2             	mov    %rax,%rdx
  8044e3:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8044ea:	01 00 00 
  8044ed:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8044f1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8044f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044f9:	83 e0 01             	and    $0x1,%eax
  8044fc:	48 85 c0             	test   %rax,%rax
  8044ff:	75 07                	jne    804508 <pageref+0x64>
  804501:	b8 00 00 00 00       	mov    $0x0,%eax
  804506:	eb 26                	jmp    80452e <pageref+0x8a>
  804508:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80450c:	48 c1 e8 0c          	shr    $0xc,%rax
  804510:	48 89 c2             	mov    %rax,%rdx
  804513:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  80451a:	00 00 00 
  80451d:	48 c1 e2 04          	shl    $0x4,%rdx
  804521:	48 01 d0             	add    %rdx,%rax
  804524:	48 83 c0 08          	add    $0x8,%rax
  804528:	0f b7 00             	movzwl (%rax),%eax
  80452b:	0f b7 c0             	movzwl %ax,%eax
  80452e:	c9                   	leaveq 
  80452f:	c3                   	retq   
