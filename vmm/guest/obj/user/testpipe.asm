
vmm/guest/obj/user/testpipe:     file format elf64-x86-64


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
  80003c:	e8 c3 04 00 00       	callq  800504 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 81 ec 90 00 00 00 	sub    $0x90,%rsp
  80004e:	89 bd 7c ff ff ff    	mov    %edi,-0x84(%rbp)
  800054:	48 89 b5 70 ff ff ff 	mov    %rsi,-0x90(%rbp)
  80005b:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800062:	00 00 00 
  800065:	48 be 44 4c 80 00 00 	movabs $0x804c44,%rsi
  80006c:	00 00 00 
  80006f:	48 89 30             	mov    %rsi,(%rax)
  800072:	48 8d 45 88          	lea    -0x78(%rbp),%rax
  800076:	48 89 c7             	mov    %rax,%rdi
  800079:	48 b8 fb 3e 80 00 00 	movabs $0x803efb,%rax
  800080:	00 00 00 
  800083:	ff d0                	callq  *%rax
  800085:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800088:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80008c:	79 30                	jns    8000be <umain+0x7b>
  80008e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800091:	89 c1                	mov    %eax,%ecx
  800093:	48 ba 50 4c 80 00 00 	movabs $0x804c50,%rdx
  80009a:	00 00 00 
  80009d:	be 0f 00 00 00       	mov    $0xf,%esi
  8000a2:	48 bf 59 4c 80 00 00 	movabs $0x804c59,%rdi
  8000a9:	00 00 00 
  8000ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8000b1:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  8000b8:	00 00 00 
  8000bb:	41 ff d0             	callq  *%r8
  8000be:	48 b8 43 24 80 00 00 	movabs $0x802443,%rax
  8000c5:	00 00 00 
  8000c8:	ff d0                	callq  *%rax
  8000ca:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8000cd:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000d1:	79 30                	jns    800103 <umain+0xc0>
  8000d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000d6:	89 c1                	mov    %eax,%ecx
  8000d8:	48 ba 6c 4c 80 00 00 	movabs $0x804c6c,%rdx
  8000df:	00 00 00 
  8000e2:	be 12 00 00 00       	mov    $0x12,%esi
  8000e7:	48 bf 59 4c 80 00 00 	movabs $0x804c59,%rdi
  8000ee:	00 00 00 
  8000f1:	b8 00 00 00 00       	mov    $0x0,%eax
  8000f6:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  8000fd:	00 00 00 
  800100:	41 ff d0             	callq  *%r8
  800103:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800107:	0f 85 50 01 00 00    	jne    80025d <umain+0x21a>
  80010d:	8b 55 8c             	mov    -0x74(%rbp),%edx
  800110:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800117:	00 00 00 
  80011a:	48 8b 00             	mov    (%rax),%rax
  80011d:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800123:	89 c6                	mov    %eax,%esi
  800125:	48 bf 75 4c 80 00 00 	movabs $0x804c75,%rdi
  80012c:	00 00 00 
  80012f:	b8 00 00 00 00       	mov    $0x0,%eax
  800134:	48 b9 e6 07 80 00 00 	movabs $0x8007e6,%rcx
  80013b:	00 00 00 
  80013e:	ff d1                	callq  *%rcx
  800140:	8b 45 8c             	mov    -0x74(%rbp),%eax
  800143:	89 c7                	mov    %eax,%edi
  800145:	48 b8 b2 29 80 00 00 	movabs $0x8029b2,%rax
  80014c:	00 00 00 
  80014f:	ff d0                	callq  *%rax
  800151:	8b 55 88             	mov    -0x78(%rbp),%edx
  800154:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80015b:	00 00 00 
  80015e:	48 8b 00             	mov    (%rax),%rax
  800161:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800167:	89 c6                	mov    %eax,%esi
  800169:	48 bf 92 4c 80 00 00 	movabs $0x804c92,%rdi
  800170:	00 00 00 
  800173:	b8 00 00 00 00       	mov    $0x0,%eax
  800178:	48 b9 e6 07 80 00 00 	movabs $0x8007e6,%rcx
  80017f:	00 00 00 
  800182:	ff d1                	callq  *%rcx
  800184:	8b 45 88             	mov    -0x78(%rbp),%eax
  800187:	48 8d 4d 90          	lea    -0x70(%rbp),%rcx
  80018b:	ba 63 00 00 00       	mov    $0x63,%edx
  800190:	48 89 ce             	mov    %rcx,%rsi
  800193:	89 c7                	mov    %eax,%edi
  800195:	48 b8 aa 2c 80 00 00 	movabs $0x802caa,%rax
  80019c:	00 00 00 
  80019f:	ff d0                	callq  *%rax
  8001a1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8001a4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8001a8:	79 30                	jns    8001da <umain+0x197>
  8001aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001ad:	89 c1                	mov    %eax,%ecx
  8001af:	48 ba af 4c 80 00 00 	movabs $0x804caf,%rdx
  8001b6:	00 00 00 
  8001b9:	be 1a 00 00 00       	mov    $0x1a,%esi
  8001be:	48 bf 59 4c 80 00 00 	movabs $0x804c59,%rdi
  8001c5:	00 00 00 
  8001c8:	b8 00 00 00 00       	mov    $0x0,%eax
  8001cd:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  8001d4:	00 00 00 
  8001d7:	41 ff d0             	callq  *%r8
  8001da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001dd:	48 98                	cltq   
  8001df:	c6 44 05 90 00       	movb   $0x0,-0x70(%rbp,%rax,1)
  8001e4:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8001eb:	00 00 00 
  8001ee:	48 8b 10             	mov    (%rax),%rdx
  8001f1:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  8001f5:	48 89 d6             	mov    %rdx,%rsi
  8001f8:	48 89 c7             	mov    %rax,%rdi
  8001fb:	48 b8 d8 14 80 00 00 	movabs $0x8014d8,%rax
  800202:	00 00 00 
  800205:	ff d0                	callq  *%rax
  800207:	85 c0                	test   %eax,%eax
  800209:	75 1d                	jne    800228 <umain+0x1e5>
  80020b:	48 bf b8 4c 80 00 00 	movabs $0x804cb8,%rdi
  800212:	00 00 00 
  800215:	b8 00 00 00 00       	mov    $0x0,%eax
  80021a:	48 ba e6 07 80 00 00 	movabs $0x8007e6,%rdx
  800221:	00 00 00 
  800224:	ff d2                	callq  *%rdx
  800226:	eb 24                	jmp    80024c <umain+0x209>
  800228:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  80022c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80022f:	89 c6                	mov    %eax,%esi
  800231:	48 bf d4 4c 80 00 00 	movabs $0x804cd4,%rdi
  800238:	00 00 00 
  80023b:	b8 00 00 00 00       	mov    $0x0,%eax
  800240:	48 b9 e6 07 80 00 00 	movabs $0x8007e6,%rcx
  800247:	00 00 00 
  80024a:	ff d1                	callq  *%rcx
  80024c:	48 b8 88 05 80 00 00 	movabs $0x800588,%rax
  800253:	00 00 00 
  800256:	ff d0                	callq  *%rax
  800258:	e9 1c 01 00 00       	jmpq   800379 <umain+0x336>
  80025d:	8b 55 88             	mov    -0x78(%rbp),%edx
  800260:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800267:	00 00 00 
  80026a:	48 8b 00             	mov    (%rax),%rax
  80026d:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800273:	89 c6                	mov    %eax,%esi
  800275:	48 bf 75 4c 80 00 00 	movabs $0x804c75,%rdi
  80027c:	00 00 00 
  80027f:	b8 00 00 00 00       	mov    $0x0,%eax
  800284:	48 b9 e6 07 80 00 00 	movabs $0x8007e6,%rcx
  80028b:	00 00 00 
  80028e:	ff d1                	callq  *%rcx
  800290:	8b 45 88             	mov    -0x78(%rbp),%eax
  800293:	89 c7                	mov    %eax,%edi
  800295:	48 b8 b2 29 80 00 00 	movabs $0x8029b2,%rax
  80029c:	00 00 00 
  80029f:	ff d0                	callq  *%rax
  8002a1:	8b 55 8c             	mov    -0x74(%rbp),%edx
  8002a4:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8002ab:	00 00 00 
  8002ae:	48 8b 00             	mov    (%rax),%rax
  8002b1:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8002b7:	89 c6                	mov    %eax,%esi
  8002b9:	48 bf e7 4c 80 00 00 	movabs $0x804ce7,%rdi
  8002c0:	00 00 00 
  8002c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8002c8:	48 b9 e6 07 80 00 00 	movabs $0x8007e6,%rcx
  8002cf:	00 00 00 
  8002d2:	ff d1                	callq  *%rcx
  8002d4:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8002db:	00 00 00 
  8002de:	48 8b 00             	mov    (%rax),%rax
  8002e1:	48 89 c7             	mov    %rax,%rdi
  8002e4:	48 b8 0a 13 80 00 00 	movabs $0x80130a,%rax
  8002eb:	00 00 00 
  8002ee:	ff d0                	callq  *%rax
  8002f0:	48 63 d0             	movslq %eax,%rdx
  8002f3:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8002fa:	00 00 00 
  8002fd:	48 8b 08             	mov    (%rax),%rcx
  800300:	8b 45 8c             	mov    -0x74(%rbp),%eax
  800303:	48 89 ce             	mov    %rcx,%rsi
  800306:	89 c7                	mov    %eax,%edi
  800308:	48 b8 20 2d 80 00 00 	movabs $0x802d20,%rax
  80030f:	00 00 00 
  800312:	ff d0                	callq  *%rax
  800314:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800317:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80031e:	00 00 00 
  800321:	48 8b 00             	mov    (%rax),%rax
  800324:	48 89 c7             	mov    %rax,%rdi
  800327:	48 b8 0a 13 80 00 00 	movabs $0x80130a,%rax
  80032e:	00 00 00 
  800331:	ff d0                	callq  *%rax
  800333:	39 45 fc             	cmp    %eax,-0x4(%rbp)
  800336:	74 30                	je     800368 <umain+0x325>
  800338:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80033b:	89 c1                	mov    %eax,%ecx
  80033d:	48 ba 04 4d 80 00 00 	movabs $0x804d04,%rdx
  800344:	00 00 00 
  800347:	be 26 00 00 00       	mov    $0x26,%esi
  80034c:	48 bf 59 4c 80 00 00 	movabs $0x804c59,%rdi
  800353:	00 00 00 
  800356:	b8 00 00 00 00       	mov    $0x0,%eax
  80035b:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  800362:	00 00 00 
  800365:	41 ff d0             	callq  *%r8
  800368:	8b 45 8c             	mov    -0x74(%rbp),%eax
  80036b:	89 c7                	mov    %eax,%edi
  80036d:	48 b8 b2 29 80 00 00 	movabs $0x8029b2,%rax
  800374:	00 00 00 
  800377:	ff d0                	callq  *%rax
  800379:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80037c:	89 c7                	mov    %eax,%edi
  80037e:	48 b8 b6 44 80 00 00 	movabs $0x8044b6,%rax
  800385:	00 00 00 
  800388:	ff d0                	callq  *%rax
  80038a:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800391:	00 00 00 
  800394:	48 be 0e 4d 80 00 00 	movabs $0x804d0e,%rsi
  80039b:	00 00 00 
  80039e:	48 89 30             	mov    %rsi,(%rax)
  8003a1:	48 8d 45 88          	lea    -0x78(%rbp),%rax
  8003a5:	48 89 c7             	mov    %rax,%rdi
  8003a8:	48 b8 fb 3e 80 00 00 	movabs $0x803efb,%rax
  8003af:	00 00 00 
  8003b2:	ff d0                	callq  *%rax
  8003b4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8003b7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8003bb:	79 30                	jns    8003ed <umain+0x3aa>
  8003bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003c0:	89 c1                	mov    %eax,%ecx
  8003c2:	48 ba 50 4c 80 00 00 	movabs $0x804c50,%rdx
  8003c9:	00 00 00 
  8003cc:	be 2d 00 00 00       	mov    $0x2d,%esi
  8003d1:	48 bf 59 4c 80 00 00 	movabs $0x804c59,%rdi
  8003d8:	00 00 00 
  8003db:	b8 00 00 00 00       	mov    $0x0,%eax
  8003e0:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  8003e7:	00 00 00 
  8003ea:	41 ff d0             	callq  *%r8
  8003ed:	48 b8 43 24 80 00 00 	movabs $0x802443,%rax
  8003f4:	00 00 00 
  8003f7:	ff d0                	callq  *%rax
  8003f9:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8003fc:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800400:	79 30                	jns    800432 <umain+0x3ef>
  800402:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800405:	89 c1                	mov    %eax,%ecx
  800407:	48 ba 6c 4c 80 00 00 	movabs $0x804c6c,%rdx
  80040e:	00 00 00 
  800411:	be 30 00 00 00       	mov    $0x30,%esi
  800416:	48 bf 59 4c 80 00 00 	movabs $0x804c59,%rdi
  80041d:	00 00 00 
  800420:	b8 00 00 00 00       	mov    $0x0,%eax
  800425:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  80042c:	00 00 00 
  80042f:	41 ff d0             	callq  *%r8
  800432:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800436:	75 7b                	jne    8004b3 <umain+0x470>
  800438:	8b 45 88             	mov    -0x78(%rbp),%eax
  80043b:	89 c7                	mov    %eax,%edi
  80043d:	48 b8 b2 29 80 00 00 	movabs $0x8029b2,%rax
  800444:	00 00 00 
  800447:	ff d0                	callq  *%rax
  800449:	48 bf 1b 4d 80 00 00 	movabs $0x804d1b,%rdi
  800450:	00 00 00 
  800453:	b8 00 00 00 00       	mov    $0x0,%eax
  800458:	48 ba e6 07 80 00 00 	movabs $0x8007e6,%rdx
  80045f:	00 00 00 
  800462:	ff d2                	callq  *%rdx
  800464:	8b 45 8c             	mov    -0x74(%rbp),%eax
  800467:	ba 01 00 00 00       	mov    $0x1,%edx
  80046c:	48 be 1d 4d 80 00 00 	movabs $0x804d1d,%rsi
  800473:	00 00 00 
  800476:	89 c7                	mov    %eax,%edi
  800478:	48 b8 20 2d 80 00 00 	movabs $0x802d20,%rax
  80047f:	00 00 00 
  800482:	ff d0                	callq  *%rax
  800484:	83 f8 01             	cmp    $0x1,%eax
  800487:	75 02                	jne    80048b <umain+0x448>
  800489:	eb be                	jmp    800449 <umain+0x406>
  80048b:	90                   	nop
  80048c:	48 bf 1f 4d 80 00 00 	movabs $0x804d1f,%rdi
  800493:	00 00 00 
  800496:	b8 00 00 00 00       	mov    $0x0,%eax
  80049b:	48 ba e6 07 80 00 00 	movabs $0x8007e6,%rdx
  8004a2:	00 00 00 
  8004a5:	ff d2                	callq  *%rdx
  8004a7:	48 b8 88 05 80 00 00 	movabs $0x800588,%rax
  8004ae:	00 00 00 
  8004b1:	ff d0                	callq  *%rax
  8004b3:	8b 45 88             	mov    -0x78(%rbp),%eax
  8004b6:	89 c7                	mov    %eax,%edi
  8004b8:	48 b8 b2 29 80 00 00 	movabs $0x8029b2,%rax
  8004bf:	00 00 00 
  8004c2:	ff d0                	callq  *%rax
  8004c4:	8b 45 8c             	mov    -0x74(%rbp),%eax
  8004c7:	89 c7                	mov    %eax,%edi
  8004c9:	48 b8 b2 29 80 00 00 	movabs $0x8029b2,%rax
  8004d0:	00 00 00 
  8004d3:	ff d0                	callq  *%rax
  8004d5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8004d8:	89 c7                	mov    %eax,%edi
  8004da:	48 b8 b6 44 80 00 00 	movabs $0x8044b6,%rax
  8004e1:	00 00 00 
  8004e4:	ff d0                	callq  *%rax
  8004e6:	48 bf 3c 4d 80 00 00 	movabs $0x804d3c,%rdi
  8004ed:	00 00 00 
  8004f0:	b8 00 00 00 00       	mov    $0x0,%eax
  8004f5:	48 ba e6 07 80 00 00 	movabs $0x8007e6,%rdx
  8004fc:	00 00 00 
  8004ff:	ff d2                	callq  *%rdx
  800501:	90                   	nop
  800502:	c9                   	leaveq 
  800503:	c3                   	retq   

0000000000800504 <libmain>:
  800504:	55                   	push   %rbp
  800505:	48 89 e5             	mov    %rsp,%rbp
  800508:	48 83 ec 10          	sub    $0x10,%rsp
  80050c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80050f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800513:	48 b8 2d 1c 80 00 00 	movabs $0x801c2d,%rax
  80051a:	00 00 00 
  80051d:	ff d0                	callq  *%rax
  80051f:	25 ff 03 00 00       	and    $0x3ff,%eax
  800524:	48 98                	cltq   
  800526:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80052d:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800534:	00 00 00 
  800537:	48 01 c2             	add    %rax,%rdx
  80053a:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800541:	00 00 00 
  800544:	48 89 10             	mov    %rdx,(%rax)
  800547:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80054b:	7e 14                	jle    800561 <libmain+0x5d>
  80054d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800551:	48 8b 10             	mov    (%rax),%rdx
  800554:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80055b:	00 00 00 
  80055e:	48 89 10             	mov    %rdx,(%rax)
  800561:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800565:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800568:	48 89 d6             	mov    %rdx,%rsi
  80056b:	89 c7                	mov    %eax,%edi
  80056d:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800574:	00 00 00 
  800577:	ff d0                	callq  *%rax
  800579:	48 b8 88 05 80 00 00 	movabs $0x800588,%rax
  800580:	00 00 00 
  800583:	ff d0                	callq  *%rax
  800585:	90                   	nop
  800586:	c9                   	leaveq 
  800587:	c3                   	retq   

0000000000800588 <exit>:
  800588:	55                   	push   %rbp
  800589:	48 89 e5             	mov    %rsp,%rbp
  80058c:	48 b8 fd 29 80 00 00 	movabs $0x8029fd,%rax
  800593:	00 00 00 
  800596:	ff d0                	callq  *%rax
  800598:	bf 00 00 00 00       	mov    $0x0,%edi
  80059d:	48 b8 e7 1b 80 00 00 	movabs $0x801be7,%rax
  8005a4:	00 00 00 
  8005a7:	ff d0                	callq  *%rax
  8005a9:	90                   	nop
  8005aa:	5d                   	pop    %rbp
  8005ab:	c3                   	retq   

00000000008005ac <_panic>:
  8005ac:	55                   	push   %rbp
  8005ad:	48 89 e5             	mov    %rsp,%rbp
  8005b0:	53                   	push   %rbx
  8005b1:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8005b8:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8005bf:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8005c5:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8005cc:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  8005d3:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8005da:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8005e1:	84 c0                	test   %al,%al
  8005e3:	74 23                	je     800608 <_panic+0x5c>
  8005e5:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  8005ec:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  8005f0:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  8005f4:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  8005f8:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  8005fc:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800600:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800604:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800608:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  80060f:	00 00 00 
  800612:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800619:	00 00 00 
  80061c:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800620:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800627:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  80062e:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800635:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80063c:	00 00 00 
  80063f:	48 8b 18             	mov    (%rax),%rbx
  800642:	48 b8 2d 1c 80 00 00 	movabs $0x801c2d,%rax
  800649:	00 00 00 
  80064c:	ff d0                	callq  *%rax
  80064e:	89 c6                	mov    %eax,%esi
  800650:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  800656:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  80065d:	41 89 d0             	mov    %edx,%r8d
  800660:	48 89 c1             	mov    %rax,%rcx
  800663:	48 89 da             	mov    %rbx,%rdx
  800666:	48 bf 60 4d 80 00 00 	movabs $0x804d60,%rdi
  80066d:	00 00 00 
  800670:	b8 00 00 00 00       	mov    $0x0,%eax
  800675:	49 b9 e6 07 80 00 00 	movabs $0x8007e6,%r9
  80067c:	00 00 00 
  80067f:	41 ff d1             	callq  *%r9
  800682:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800689:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800690:	48 89 d6             	mov    %rdx,%rsi
  800693:	48 89 c7             	mov    %rax,%rdi
  800696:	48 b8 3a 07 80 00 00 	movabs $0x80073a,%rax
  80069d:	00 00 00 
  8006a0:	ff d0                	callq  *%rax
  8006a2:	48 bf 83 4d 80 00 00 	movabs $0x804d83,%rdi
  8006a9:	00 00 00 
  8006ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8006b1:	48 ba e6 07 80 00 00 	movabs $0x8007e6,%rdx
  8006b8:	00 00 00 
  8006bb:	ff d2                	callq  *%rdx
  8006bd:	cc                   	int3   
  8006be:	eb fd                	jmp    8006bd <_panic+0x111>

00000000008006c0 <putch>:
  8006c0:	55                   	push   %rbp
  8006c1:	48 89 e5             	mov    %rsp,%rbp
  8006c4:	48 83 ec 10          	sub    $0x10,%rsp
  8006c8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8006cb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8006cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8006d3:	8b 00                	mov    (%rax),%eax
  8006d5:	8d 48 01             	lea    0x1(%rax),%ecx
  8006d8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8006dc:	89 0a                	mov    %ecx,(%rdx)
  8006de:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8006e1:	89 d1                	mov    %edx,%ecx
  8006e3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8006e7:	48 98                	cltq   
  8006e9:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8006ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8006f1:	8b 00                	mov    (%rax),%eax
  8006f3:	3d ff 00 00 00       	cmp    $0xff,%eax
  8006f8:	75 2c                	jne    800726 <putch+0x66>
  8006fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8006fe:	8b 00                	mov    (%rax),%eax
  800700:	48 98                	cltq   
  800702:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800706:	48 83 c2 08          	add    $0x8,%rdx
  80070a:	48 89 c6             	mov    %rax,%rsi
  80070d:	48 89 d7             	mov    %rdx,%rdi
  800710:	48 b8 5e 1b 80 00 00 	movabs $0x801b5e,%rax
  800717:	00 00 00 
  80071a:	ff d0                	callq  *%rax
  80071c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800720:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800726:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80072a:	8b 40 04             	mov    0x4(%rax),%eax
  80072d:	8d 50 01             	lea    0x1(%rax),%edx
  800730:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800734:	89 50 04             	mov    %edx,0x4(%rax)
  800737:	90                   	nop
  800738:	c9                   	leaveq 
  800739:	c3                   	retq   

000000000080073a <vcprintf>:
  80073a:	55                   	push   %rbp
  80073b:	48 89 e5             	mov    %rsp,%rbp
  80073e:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800745:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  80074c:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800753:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  80075a:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800761:	48 8b 0a             	mov    (%rdx),%rcx
  800764:	48 89 08             	mov    %rcx,(%rax)
  800767:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80076b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80076f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800773:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800777:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  80077e:	00 00 00 
  800781:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800788:	00 00 00 
  80078b:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800792:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800799:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8007a0:	48 89 c6             	mov    %rax,%rsi
  8007a3:	48 bf c0 06 80 00 00 	movabs $0x8006c0,%rdi
  8007aa:	00 00 00 
  8007ad:	48 b8 84 0b 80 00 00 	movabs $0x800b84,%rax
  8007b4:	00 00 00 
  8007b7:	ff d0                	callq  *%rax
  8007b9:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8007bf:	48 98                	cltq   
  8007c1:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8007c8:	48 83 c2 08          	add    $0x8,%rdx
  8007cc:	48 89 c6             	mov    %rax,%rsi
  8007cf:	48 89 d7             	mov    %rdx,%rdi
  8007d2:	48 b8 5e 1b 80 00 00 	movabs $0x801b5e,%rax
  8007d9:	00 00 00 
  8007dc:	ff d0                	callq  *%rax
  8007de:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8007e4:	c9                   	leaveq 
  8007e5:	c3                   	retq   

00000000008007e6 <cprintf>:
  8007e6:	55                   	push   %rbp
  8007e7:	48 89 e5             	mov    %rsp,%rbp
  8007ea:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  8007f1:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8007f8:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8007ff:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800806:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80080d:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800814:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80081b:	84 c0                	test   %al,%al
  80081d:	74 20                	je     80083f <cprintf+0x59>
  80081f:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800823:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800827:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80082b:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80082f:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800833:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800837:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80083b:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80083f:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800846:	00 00 00 
  800849:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800850:	00 00 00 
  800853:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800857:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80085e:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800865:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80086c:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800873:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80087a:	48 8b 0a             	mov    (%rdx),%rcx
  80087d:	48 89 08             	mov    %rcx,(%rax)
  800880:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800884:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800888:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80088c:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800890:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800897:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80089e:	48 89 d6             	mov    %rdx,%rsi
  8008a1:	48 89 c7             	mov    %rax,%rdi
  8008a4:	48 b8 3a 07 80 00 00 	movabs $0x80073a,%rax
  8008ab:	00 00 00 
  8008ae:	ff d0                	callq  *%rax
  8008b0:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8008b6:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8008bc:	c9                   	leaveq 
  8008bd:	c3                   	retq   

00000000008008be <printnum>:
  8008be:	55                   	push   %rbp
  8008bf:	48 89 e5             	mov    %rsp,%rbp
  8008c2:	48 83 ec 30          	sub    $0x30,%rsp
  8008c6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8008ca:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8008ce:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8008d2:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  8008d5:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  8008d9:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  8008dd:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8008e0:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  8008e4:	77 54                	ja     80093a <printnum+0x7c>
  8008e6:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8008e9:	8d 78 ff             	lea    -0x1(%rax),%edi
  8008ec:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  8008ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008f3:	ba 00 00 00 00       	mov    $0x0,%edx
  8008f8:	48 f7 f6             	div    %rsi
  8008fb:	49 89 c2             	mov    %rax,%r10
  8008fe:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800901:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  800904:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  800908:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80090c:	41 89 c9             	mov    %ecx,%r9d
  80090f:	41 89 f8             	mov    %edi,%r8d
  800912:	89 d1                	mov    %edx,%ecx
  800914:	4c 89 d2             	mov    %r10,%rdx
  800917:	48 89 c7             	mov    %rax,%rdi
  80091a:	48 b8 be 08 80 00 00 	movabs $0x8008be,%rax
  800921:	00 00 00 
  800924:	ff d0                	callq  *%rax
  800926:	eb 1c                	jmp    800944 <printnum+0x86>
  800928:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80092c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80092f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800933:	48 89 ce             	mov    %rcx,%rsi
  800936:	89 d7                	mov    %edx,%edi
  800938:	ff d0                	callq  *%rax
  80093a:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  80093e:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  800942:	7f e4                	jg     800928 <printnum+0x6a>
  800944:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800947:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80094b:	ba 00 00 00 00       	mov    $0x0,%edx
  800950:	48 f7 f1             	div    %rcx
  800953:	48 b8 90 4f 80 00 00 	movabs $0x804f90,%rax
  80095a:	00 00 00 
  80095d:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  800961:	0f be d0             	movsbl %al,%edx
  800964:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800968:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80096c:	48 89 ce             	mov    %rcx,%rsi
  80096f:	89 d7                	mov    %edx,%edi
  800971:	ff d0                	callq  *%rax
  800973:	90                   	nop
  800974:	c9                   	leaveq 
  800975:	c3                   	retq   

0000000000800976 <getuint>:
  800976:	55                   	push   %rbp
  800977:	48 89 e5             	mov    %rsp,%rbp
  80097a:	48 83 ec 20          	sub    $0x20,%rsp
  80097e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800982:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800985:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800989:	7e 4f                	jle    8009da <getuint+0x64>
  80098b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80098f:	8b 00                	mov    (%rax),%eax
  800991:	83 f8 30             	cmp    $0x30,%eax
  800994:	73 24                	jae    8009ba <getuint+0x44>
  800996:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80099a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80099e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009a2:	8b 00                	mov    (%rax),%eax
  8009a4:	89 c0                	mov    %eax,%eax
  8009a6:	48 01 d0             	add    %rdx,%rax
  8009a9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009ad:	8b 12                	mov    (%rdx),%edx
  8009af:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8009b2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009b6:	89 0a                	mov    %ecx,(%rdx)
  8009b8:	eb 14                	jmp    8009ce <getuint+0x58>
  8009ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009be:	48 8b 40 08          	mov    0x8(%rax),%rax
  8009c2:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8009c6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009ca:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009ce:	48 8b 00             	mov    (%rax),%rax
  8009d1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8009d5:	e9 9d 00 00 00       	jmpq   800a77 <getuint+0x101>
  8009da:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8009de:	74 4c                	je     800a2c <getuint+0xb6>
  8009e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009e4:	8b 00                	mov    (%rax),%eax
  8009e6:	83 f8 30             	cmp    $0x30,%eax
  8009e9:	73 24                	jae    800a0f <getuint+0x99>
  8009eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009ef:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8009f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009f7:	8b 00                	mov    (%rax),%eax
  8009f9:	89 c0                	mov    %eax,%eax
  8009fb:	48 01 d0             	add    %rdx,%rax
  8009fe:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a02:	8b 12                	mov    (%rdx),%edx
  800a04:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a07:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a0b:	89 0a                	mov    %ecx,(%rdx)
  800a0d:	eb 14                	jmp    800a23 <getuint+0xad>
  800a0f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a13:	48 8b 40 08          	mov    0x8(%rax),%rax
  800a17:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800a1b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a1f:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a23:	48 8b 00             	mov    (%rax),%rax
  800a26:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a2a:	eb 4b                	jmp    800a77 <getuint+0x101>
  800a2c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a30:	8b 00                	mov    (%rax),%eax
  800a32:	83 f8 30             	cmp    $0x30,%eax
  800a35:	73 24                	jae    800a5b <getuint+0xe5>
  800a37:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a3b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a3f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a43:	8b 00                	mov    (%rax),%eax
  800a45:	89 c0                	mov    %eax,%eax
  800a47:	48 01 d0             	add    %rdx,%rax
  800a4a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a4e:	8b 12                	mov    (%rdx),%edx
  800a50:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a53:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a57:	89 0a                	mov    %ecx,(%rdx)
  800a59:	eb 14                	jmp    800a6f <getuint+0xf9>
  800a5b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a5f:	48 8b 40 08          	mov    0x8(%rax),%rax
  800a63:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800a67:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a6b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a6f:	8b 00                	mov    (%rax),%eax
  800a71:	89 c0                	mov    %eax,%eax
  800a73:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a77:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800a7b:	c9                   	leaveq 
  800a7c:	c3                   	retq   

0000000000800a7d <getint>:
  800a7d:	55                   	push   %rbp
  800a7e:	48 89 e5             	mov    %rsp,%rbp
  800a81:	48 83 ec 20          	sub    $0x20,%rsp
  800a85:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800a89:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800a8c:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800a90:	7e 4f                	jle    800ae1 <getint+0x64>
  800a92:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a96:	8b 00                	mov    (%rax),%eax
  800a98:	83 f8 30             	cmp    $0x30,%eax
  800a9b:	73 24                	jae    800ac1 <getint+0x44>
  800a9d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800aa1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800aa5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800aa9:	8b 00                	mov    (%rax),%eax
  800aab:	89 c0                	mov    %eax,%eax
  800aad:	48 01 d0             	add    %rdx,%rax
  800ab0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ab4:	8b 12                	mov    (%rdx),%edx
  800ab6:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800ab9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800abd:	89 0a                	mov    %ecx,(%rdx)
  800abf:	eb 14                	jmp    800ad5 <getint+0x58>
  800ac1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ac5:	48 8b 40 08          	mov    0x8(%rax),%rax
  800ac9:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800acd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ad1:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800ad5:	48 8b 00             	mov    (%rax),%rax
  800ad8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800adc:	e9 9d 00 00 00       	jmpq   800b7e <getint+0x101>
  800ae1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800ae5:	74 4c                	je     800b33 <getint+0xb6>
  800ae7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800aeb:	8b 00                	mov    (%rax),%eax
  800aed:	83 f8 30             	cmp    $0x30,%eax
  800af0:	73 24                	jae    800b16 <getint+0x99>
  800af2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800af6:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800afa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800afe:	8b 00                	mov    (%rax),%eax
  800b00:	89 c0                	mov    %eax,%eax
  800b02:	48 01 d0             	add    %rdx,%rax
  800b05:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b09:	8b 12                	mov    (%rdx),%edx
  800b0b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800b0e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b12:	89 0a                	mov    %ecx,(%rdx)
  800b14:	eb 14                	jmp    800b2a <getint+0xad>
  800b16:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b1a:	48 8b 40 08          	mov    0x8(%rax),%rax
  800b1e:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800b22:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b26:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800b2a:	48 8b 00             	mov    (%rax),%rax
  800b2d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800b31:	eb 4b                	jmp    800b7e <getint+0x101>
  800b33:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b37:	8b 00                	mov    (%rax),%eax
  800b39:	83 f8 30             	cmp    $0x30,%eax
  800b3c:	73 24                	jae    800b62 <getint+0xe5>
  800b3e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b42:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b46:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b4a:	8b 00                	mov    (%rax),%eax
  800b4c:	89 c0                	mov    %eax,%eax
  800b4e:	48 01 d0             	add    %rdx,%rax
  800b51:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b55:	8b 12                	mov    (%rdx),%edx
  800b57:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800b5a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b5e:	89 0a                	mov    %ecx,(%rdx)
  800b60:	eb 14                	jmp    800b76 <getint+0xf9>
  800b62:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b66:	48 8b 40 08          	mov    0x8(%rax),%rax
  800b6a:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800b6e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b72:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800b76:	8b 00                	mov    (%rax),%eax
  800b78:	48 98                	cltq   
  800b7a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800b7e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800b82:	c9                   	leaveq 
  800b83:	c3                   	retq   

0000000000800b84 <vprintfmt>:
  800b84:	55                   	push   %rbp
  800b85:	48 89 e5             	mov    %rsp,%rbp
  800b88:	41 54                	push   %r12
  800b8a:	53                   	push   %rbx
  800b8b:	48 83 ec 60          	sub    $0x60,%rsp
  800b8f:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800b93:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800b97:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800b9b:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800b9f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ba3:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800ba7:	48 8b 0a             	mov    (%rdx),%rcx
  800baa:	48 89 08             	mov    %rcx,(%rax)
  800bad:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800bb1:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800bb5:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800bb9:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800bbd:	eb 17                	jmp    800bd6 <vprintfmt+0x52>
  800bbf:	85 db                	test   %ebx,%ebx
  800bc1:	0f 84 b9 04 00 00    	je     801080 <vprintfmt+0x4fc>
  800bc7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bcb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bcf:	48 89 d6             	mov    %rdx,%rsi
  800bd2:	89 df                	mov    %ebx,%edi
  800bd4:	ff d0                	callq  *%rax
  800bd6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800bda:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800bde:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800be2:	0f b6 00             	movzbl (%rax),%eax
  800be5:	0f b6 d8             	movzbl %al,%ebx
  800be8:	83 fb 25             	cmp    $0x25,%ebx
  800beb:	75 d2                	jne    800bbf <vprintfmt+0x3b>
  800bed:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800bf1:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800bf8:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800bff:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800c06:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800c0d:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c11:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800c15:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800c19:	0f b6 00             	movzbl (%rax),%eax
  800c1c:	0f b6 d8             	movzbl %al,%ebx
  800c1f:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800c22:	83 f8 55             	cmp    $0x55,%eax
  800c25:	0f 87 22 04 00 00    	ja     80104d <vprintfmt+0x4c9>
  800c2b:	89 c0                	mov    %eax,%eax
  800c2d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800c34:	00 
  800c35:	48 b8 b8 4f 80 00 00 	movabs $0x804fb8,%rax
  800c3c:	00 00 00 
  800c3f:	48 01 d0             	add    %rdx,%rax
  800c42:	48 8b 00             	mov    (%rax),%rax
  800c45:	ff e0                	jmpq   *%rax
  800c47:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800c4b:	eb c0                	jmp    800c0d <vprintfmt+0x89>
  800c4d:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800c51:	eb ba                	jmp    800c0d <vprintfmt+0x89>
  800c53:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800c5a:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800c5d:	89 d0                	mov    %edx,%eax
  800c5f:	c1 e0 02             	shl    $0x2,%eax
  800c62:	01 d0                	add    %edx,%eax
  800c64:	01 c0                	add    %eax,%eax
  800c66:	01 d8                	add    %ebx,%eax
  800c68:	83 e8 30             	sub    $0x30,%eax
  800c6b:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800c6e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c72:	0f b6 00             	movzbl (%rax),%eax
  800c75:	0f be d8             	movsbl %al,%ebx
  800c78:	83 fb 2f             	cmp    $0x2f,%ebx
  800c7b:	7e 60                	jle    800cdd <vprintfmt+0x159>
  800c7d:	83 fb 39             	cmp    $0x39,%ebx
  800c80:	7f 5b                	jg     800cdd <vprintfmt+0x159>
  800c82:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800c87:	eb d1                	jmp    800c5a <vprintfmt+0xd6>
  800c89:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c8c:	83 f8 30             	cmp    $0x30,%eax
  800c8f:	73 17                	jae    800ca8 <vprintfmt+0x124>
  800c91:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800c95:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c98:	89 d2                	mov    %edx,%edx
  800c9a:	48 01 d0             	add    %rdx,%rax
  800c9d:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ca0:	83 c2 08             	add    $0x8,%edx
  800ca3:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ca6:	eb 0c                	jmp    800cb4 <vprintfmt+0x130>
  800ca8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800cac:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800cb0:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800cb4:	8b 00                	mov    (%rax),%eax
  800cb6:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800cb9:	eb 23                	jmp    800cde <vprintfmt+0x15a>
  800cbb:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800cbf:	0f 89 48 ff ff ff    	jns    800c0d <vprintfmt+0x89>
  800cc5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800ccc:	e9 3c ff ff ff       	jmpq   800c0d <vprintfmt+0x89>
  800cd1:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800cd8:	e9 30 ff ff ff       	jmpq   800c0d <vprintfmt+0x89>
  800cdd:	90                   	nop
  800cde:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ce2:	0f 89 25 ff ff ff    	jns    800c0d <vprintfmt+0x89>
  800ce8:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800ceb:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800cee:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800cf5:	e9 13 ff ff ff       	jmpq   800c0d <vprintfmt+0x89>
  800cfa:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800cfe:	e9 0a ff ff ff       	jmpq   800c0d <vprintfmt+0x89>
  800d03:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d06:	83 f8 30             	cmp    $0x30,%eax
  800d09:	73 17                	jae    800d22 <vprintfmt+0x19e>
  800d0b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d0f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d12:	89 d2                	mov    %edx,%edx
  800d14:	48 01 d0             	add    %rdx,%rax
  800d17:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d1a:	83 c2 08             	add    $0x8,%edx
  800d1d:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d20:	eb 0c                	jmp    800d2e <vprintfmt+0x1aa>
  800d22:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800d26:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800d2a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d2e:	8b 10                	mov    (%rax),%edx
  800d30:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800d34:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d38:	48 89 ce             	mov    %rcx,%rsi
  800d3b:	89 d7                	mov    %edx,%edi
  800d3d:	ff d0                	callq  *%rax
  800d3f:	e9 37 03 00 00       	jmpq   80107b <vprintfmt+0x4f7>
  800d44:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d47:	83 f8 30             	cmp    $0x30,%eax
  800d4a:	73 17                	jae    800d63 <vprintfmt+0x1df>
  800d4c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d50:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d53:	89 d2                	mov    %edx,%edx
  800d55:	48 01 d0             	add    %rdx,%rax
  800d58:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d5b:	83 c2 08             	add    $0x8,%edx
  800d5e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d61:	eb 0c                	jmp    800d6f <vprintfmt+0x1eb>
  800d63:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800d67:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800d6b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d6f:	8b 18                	mov    (%rax),%ebx
  800d71:	85 db                	test   %ebx,%ebx
  800d73:	79 02                	jns    800d77 <vprintfmt+0x1f3>
  800d75:	f7 db                	neg    %ebx
  800d77:	83 fb 15             	cmp    $0x15,%ebx
  800d7a:	7f 16                	jg     800d92 <vprintfmt+0x20e>
  800d7c:	48 b8 e0 4e 80 00 00 	movabs $0x804ee0,%rax
  800d83:	00 00 00 
  800d86:	48 63 d3             	movslq %ebx,%rdx
  800d89:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800d8d:	4d 85 e4             	test   %r12,%r12
  800d90:	75 2e                	jne    800dc0 <vprintfmt+0x23c>
  800d92:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800d96:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d9a:	89 d9                	mov    %ebx,%ecx
  800d9c:	48 ba a1 4f 80 00 00 	movabs $0x804fa1,%rdx
  800da3:	00 00 00 
  800da6:	48 89 c7             	mov    %rax,%rdi
  800da9:	b8 00 00 00 00       	mov    $0x0,%eax
  800dae:	49 b8 8a 10 80 00 00 	movabs $0x80108a,%r8
  800db5:	00 00 00 
  800db8:	41 ff d0             	callq  *%r8
  800dbb:	e9 bb 02 00 00       	jmpq   80107b <vprintfmt+0x4f7>
  800dc0:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800dc4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dc8:	4c 89 e1             	mov    %r12,%rcx
  800dcb:	48 ba aa 4f 80 00 00 	movabs $0x804faa,%rdx
  800dd2:	00 00 00 
  800dd5:	48 89 c7             	mov    %rax,%rdi
  800dd8:	b8 00 00 00 00       	mov    $0x0,%eax
  800ddd:	49 b8 8a 10 80 00 00 	movabs $0x80108a,%r8
  800de4:	00 00 00 
  800de7:	41 ff d0             	callq  *%r8
  800dea:	e9 8c 02 00 00       	jmpq   80107b <vprintfmt+0x4f7>
  800def:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800df2:	83 f8 30             	cmp    $0x30,%eax
  800df5:	73 17                	jae    800e0e <vprintfmt+0x28a>
  800df7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800dfb:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800dfe:	89 d2                	mov    %edx,%edx
  800e00:	48 01 d0             	add    %rdx,%rax
  800e03:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e06:	83 c2 08             	add    $0x8,%edx
  800e09:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800e0c:	eb 0c                	jmp    800e1a <vprintfmt+0x296>
  800e0e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800e12:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800e16:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e1a:	4c 8b 20             	mov    (%rax),%r12
  800e1d:	4d 85 e4             	test   %r12,%r12
  800e20:	75 0a                	jne    800e2c <vprintfmt+0x2a8>
  800e22:	49 bc ad 4f 80 00 00 	movabs $0x804fad,%r12
  800e29:	00 00 00 
  800e2c:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800e30:	7e 78                	jle    800eaa <vprintfmt+0x326>
  800e32:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800e36:	74 72                	je     800eaa <vprintfmt+0x326>
  800e38:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800e3b:	48 98                	cltq   
  800e3d:	48 89 c6             	mov    %rax,%rsi
  800e40:	4c 89 e7             	mov    %r12,%rdi
  800e43:	48 b8 38 13 80 00 00 	movabs $0x801338,%rax
  800e4a:	00 00 00 
  800e4d:	ff d0                	callq  *%rax
  800e4f:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800e52:	eb 17                	jmp    800e6b <vprintfmt+0x2e7>
  800e54:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800e58:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800e5c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e60:	48 89 ce             	mov    %rcx,%rsi
  800e63:	89 d7                	mov    %edx,%edi
  800e65:	ff d0                	callq  *%rax
  800e67:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800e6b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800e6f:	7f e3                	jg     800e54 <vprintfmt+0x2d0>
  800e71:	eb 37                	jmp    800eaa <vprintfmt+0x326>
  800e73:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800e77:	74 1e                	je     800e97 <vprintfmt+0x313>
  800e79:	83 fb 1f             	cmp    $0x1f,%ebx
  800e7c:	7e 05                	jle    800e83 <vprintfmt+0x2ff>
  800e7e:	83 fb 7e             	cmp    $0x7e,%ebx
  800e81:	7e 14                	jle    800e97 <vprintfmt+0x313>
  800e83:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e87:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e8b:	48 89 d6             	mov    %rdx,%rsi
  800e8e:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800e93:	ff d0                	callq  *%rax
  800e95:	eb 0f                	jmp    800ea6 <vprintfmt+0x322>
  800e97:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e9b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e9f:	48 89 d6             	mov    %rdx,%rsi
  800ea2:	89 df                	mov    %ebx,%edi
  800ea4:	ff d0                	callq  *%rax
  800ea6:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800eaa:	4c 89 e0             	mov    %r12,%rax
  800ead:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800eb1:	0f b6 00             	movzbl (%rax),%eax
  800eb4:	0f be d8             	movsbl %al,%ebx
  800eb7:	85 db                	test   %ebx,%ebx
  800eb9:	74 28                	je     800ee3 <vprintfmt+0x35f>
  800ebb:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800ebf:	78 b2                	js     800e73 <vprintfmt+0x2ef>
  800ec1:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800ec5:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800ec9:	79 a8                	jns    800e73 <vprintfmt+0x2ef>
  800ecb:	eb 16                	jmp    800ee3 <vprintfmt+0x35f>
  800ecd:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ed1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ed5:	48 89 d6             	mov    %rdx,%rsi
  800ed8:	bf 20 00 00 00       	mov    $0x20,%edi
  800edd:	ff d0                	callq  *%rax
  800edf:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800ee3:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ee7:	7f e4                	jg     800ecd <vprintfmt+0x349>
  800ee9:	e9 8d 01 00 00       	jmpq   80107b <vprintfmt+0x4f7>
  800eee:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ef2:	be 03 00 00 00       	mov    $0x3,%esi
  800ef7:	48 89 c7             	mov    %rax,%rdi
  800efa:	48 b8 7d 0a 80 00 00 	movabs $0x800a7d,%rax
  800f01:	00 00 00 
  800f04:	ff d0                	callq  *%rax
  800f06:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f0a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f0e:	48 85 c0             	test   %rax,%rax
  800f11:	79 1d                	jns    800f30 <vprintfmt+0x3ac>
  800f13:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f17:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f1b:	48 89 d6             	mov    %rdx,%rsi
  800f1e:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800f23:	ff d0                	callq  *%rax
  800f25:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f29:	48 f7 d8             	neg    %rax
  800f2c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f30:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800f37:	e9 d2 00 00 00       	jmpq   80100e <vprintfmt+0x48a>
  800f3c:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800f40:	be 03 00 00 00       	mov    $0x3,%esi
  800f45:	48 89 c7             	mov    %rax,%rdi
  800f48:	48 b8 76 09 80 00 00 	movabs $0x800976,%rax
  800f4f:	00 00 00 
  800f52:	ff d0                	callq  *%rax
  800f54:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f58:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800f5f:	e9 aa 00 00 00       	jmpq   80100e <vprintfmt+0x48a>
  800f64:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800f68:	be 03 00 00 00       	mov    $0x3,%esi
  800f6d:	48 89 c7             	mov    %rax,%rdi
  800f70:	48 b8 76 09 80 00 00 	movabs $0x800976,%rax
  800f77:	00 00 00 
  800f7a:	ff d0                	callq  *%rax
  800f7c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f80:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800f87:	e9 82 00 00 00       	jmpq   80100e <vprintfmt+0x48a>
  800f8c:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f90:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f94:	48 89 d6             	mov    %rdx,%rsi
  800f97:	bf 30 00 00 00       	mov    $0x30,%edi
  800f9c:	ff d0                	callq  *%rax
  800f9e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800fa2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800fa6:	48 89 d6             	mov    %rdx,%rsi
  800fa9:	bf 78 00 00 00       	mov    $0x78,%edi
  800fae:	ff d0                	callq  *%rax
  800fb0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800fb3:	83 f8 30             	cmp    $0x30,%eax
  800fb6:	73 17                	jae    800fcf <vprintfmt+0x44b>
  800fb8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800fbc:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800fbf:	89 d2                	mov    %edx,%edx
  800fc1:	48 01 d0             	add    %rdx,%rax
  800fc4:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800fc7:	83 c2 08             	add    $0x8,%edx
  800fca:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800fcd:	eb 0c                	jmp    800fdb <vprintfmt+0x457>
  800fcf:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800fd3:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800fd7:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800fdb:	48 8b 00             	mov    (%rax),%rax
  800fde:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800fe2:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800fe9:	eb 23                	jmp    80100e <vprintfmt+0x48a>
  800feb:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800fef:	be 03 00 00 00       	mov    $0x3,%esi
  800ff4:	48 89 c7             	mov    %rax,%rdi
  800ff7:	48 b8 76 09 80 00 00 	movabs $0x800976,%rax
  800ffe:	00 00 00 
  801001:	ff d0                	callq  *%rax
  801003:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801007:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  80100e:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  801013:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  801016:	8b 7d dc             	mov    -0x24(%rbp),%edi
  801019:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80101d:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801021:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801025:	45 89 c1             	mov    %r8d,%r9d
  801028:	41 89 f8             	mov    %edi,%r8d
  80102b:	48 89 c7             	mov    %rax,%rdi
  80102e:	48 b8 be 08 80 00 00 	movabs $0x8008be,%rax
  801035:	00 00 00 
  801038:	ff d0                	callq  *%rax
  80103a:	eb 3f                	jmp    80107b <vprintfmt+0x4f7>
  80103c:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801040:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801044:	48 89 d6             	mov    %rdx,%rsi
  801047:	89 df                	mov    %ebx,%edi
  801049:	ff d0                	callq  *%rax
  80104b:	eb 2e                	jmp    80107b <vprintfmt+0x4f7>
  80104d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801051:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801055:	48 89 d6             	mov    %rdx,%rsi
  801058:	bf 25 00 00 00       	mov    $0x25,%edi
  80105d:	ff d0                	callq  *%rax
  80105f:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  801064:	eb 05                	jmp    80106b <vprintfmt+0x4e7>
  801066:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  80106b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80106f:	48 83 e8 01          	sub    $0x1,%rax
  801073:	0f b6 00             	movzbl (%rax),%eax
  801076:	3c 25                	cmp    $0x25,%al
  801078:	75 ec                	jne    801066 <vprintfmt+0x4e2>
  80107a:	90                   	nop
  80107b:	e9 3d fb ff ff       	jmpq   800bbd <vprintfmt+0x39>
  801080:	90                   	nop
  801081:	48 83 c4 60          	add    $0x60,%rsp
  801085:	5b                   	pop    %rbx
  801086:	41 5c                	pop    %r12
  801088:	5d                   	pop    %rbp
  801089:	c3                   	retq   

000000000080108a <printfmt>:
  80108a:	55                   	push   %rbp
  80108b:	48 89 e5             	mov    %rsp,%rbp
  80108e:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  801095:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  80109c:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  8010a3:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  8010aa:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8010b1:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8010b8:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8010bf:	84 c0                	test   %al,%al
  8010c1:	74 20                	je     8010e3 <printfmt+0x59>
  8010c3:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8010c7:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8010cb:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8010cf:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8010d3:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8010d7:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8010db:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8010df:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8010e3:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  8010ea:	00 00 00 
  8010ed:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  8010f4:	00 00 00 
  8010f7:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8010fb:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801102:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801109:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  801110:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  801117:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  80111e:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  801125:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  80112c:	48 89 c7             	mov    %rax,%rdi
  80112f:	48 b8 84 0b 80 00 00 	movabs $0x800b84,%rax
  801136:	00 00 00 
  801139:	ff d0                	callq  *%rax
  80113b:	90                   	nop
  80113c:	c9                   	leaveq 
  80113d:	c3                   	retq   

000000000080113e <sprintputch>:
  80113e:	55                   	push   %rbp
  80113f:	48 89 e5             	mov    %rsp,%rbp
  801142:	48 83 ec 10          	sub    $0x10,%rsp
  801146:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801149:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80114d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801151:	8b 40 10             	mov    0x10(%rax),%eax
  801154:	8d 50 01             	lea    0x1(%rax),%edx
  801157:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80115b:	89 50 10             	mov    %edx,0x10(%rax)
  80115e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801162:	48 8b 10             	mov    (%rax),%rdx
  801165:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801169:	48 8b 40 08          	mov    0x8(%rax),%rax
  80116d:	48 39 c2             	cmp    %rax,%rdx
  801170:	73 17                	jae    801189 <sprintputch+0x4b>
  801172:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801176:	48 8b 00             	mov    (%rax),%rax
  801179:	48 8d 48 01          	lea    0x1(%rax),%rcx
  80117d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801181:	48 89 0a             	mov    %rcx,(%rdx)
  801184:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801187:	88 10                	mov    %dl,(%rax)
  801189:	90                   	nop
  80118a:	c9                   	leaveq 
  80118b:	c3                   	retq   

000000000080118c <vsnprintf>:
  80118c:	55                   	push   %rbp
  80118d:	48 89 e5             	mov    %rsp,%rbp
  801190:	48 83 ec 50          	sub    $0x50,%rsp
  801194:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  801198:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  80119b:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  80119f:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  8011a3:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8011a7:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  8011ab:	48 8b 0a             	mov    (%rdx),%rcx
  8011ae:	48 89 08             	mov    %rcx,(%rax)
  8011b1:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8011b5:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8011b9:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8011bd:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8011c1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8011c5:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8011c9:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  8011cc:	48 98                	cltq   
  8011ce:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8011d2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8011d6:	48 01 d0             	add    %rdx,%rax
  8011d9:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8011dd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8011e4:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  8011e9:	74 06                	je     8011f1 <vsnprintf+0x65>
  8011eb:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  8011ef:	7f 07                	jg     8011f8 <vsnprintf+0x6c>
  8011f1:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8011f6:	eb 2f                	jmp    801227 <vsnprintf+0x9b>
  8011f8:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  8011fc:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801200:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  801204:	48 89 c6             	mov    %rax,%rsi
  801207:	48 bf 3e 11 80 00 00 	movabs $0x80113e,%rdi
  80120e:	00 00 00 
  801211:	48 b8 84 0b 80 00 00 	movabs $0x800b84,%rax
  801218:	00 00 00 
  80121b:	ff d0                	callq  *%rax
  80121d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801221:	c6 00 00             	movb   $0x0,(%rax)
  801224:	8b 45 e0             	mov    -0x20(%rbp),%eax
  801227:	c9                   	leaveq 
  801228:	c3                   	retq   

0000000000801229 <snprintf>:
  801229:	55                   	push   %rbp
  80122a:	48 89 e5             	mov    %rsp,%rbp
  80122d:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  801234:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80123b:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801241:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  801248:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80124f:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801256:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80125d:	84 c0                	test   %al,%al
  80125f:	74 20                	je     801281 <snprintf+0x58>
  801261:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801265:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801269:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80126d:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801271:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801275:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801279:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80127d:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801281:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  801288:	00 00 00 
  80128b:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  801292:	00 00 00 
  801295:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801299:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8012a0:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8012a7:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8012ae:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8012b5:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8012bc:	48 8b 0a             	mov    (%rdx),%rcx
  8012bf:	48 89 08             	mov    %rcx,(%rax)
  8012c2:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8012c6:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8012ca:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8012ce:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8012d2:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  8012d9:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  8012e0:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  8012e6:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8012ed:	48 89 c7             	mov    %rax,%rdi
  8012f0:	48 b8 8c 11 80 00 00 	movabs $0x80118c,%rax
  8012f7:	00 00 00 
  8012fa:	ff d0                	callq  *%rax
  8012fc:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801302:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801308:	c9                   	leaveq 
  801309:	c3                   	retq   

000000000080130a <strlen>:
  80130a:	55                   	push   %rbp
  80130b:	48 89 e5             	mov    %rsp,%rbp
  80130e:	48 83 ec 18          	sub    $0x18,%rsp
  801312:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801316:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80131d:	eb 09                	jmp    801328 <strlen+0x1e>
  80131f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801323:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801328:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80132c:	0f b6 00             	movzbl (%rax),%eax
  80132f:	84 c0                	test   %al,%al
  801331:	75 ec                	jne    80131f <strlen+0x15>
  801333:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801336:	c9                   	leaveq 
  801337:	c3                   	retq   

0000000000801338 <strnlen>:
  801338:	55                   	push   %rbp
  801339:	48 89 e5             	mov    %rsp,%rbp
  80133c:	48 83 ec 20          	sub    $0x20,%rsp
  801340:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801344:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801348:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80134f:	eb 0e                	jmp    80135f <strnlen+0x27>
  801351:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801355:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80135a:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  80135f:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801364:	74 0b                	je     801371 <strnlen+0x39>
  801366:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80136a:	0f b6 00             	movzbl (%rax),%eax
  80136d:	84 c0                	test   %al,%al
  80136f:	75 e0                	jne    801351 <strnlen+0x19>
  801371:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801374:	c9                   	leaveq 
  801375:	c3                   	retq   

0000000000801376 <strcpy>:
  801376:	55                   	push   %rbp
  801377:	48 89 e5             	mov    %rsp,%rbp
  80137a:	48 83 ec 20          	sub    $0x20,%rsp
  80137e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801382:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801386:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80138a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80138e:	90                   	nop
  80138f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801393:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801397:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80139b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80139f:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8013a3:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8013a7:	0f b6 12             	movzbl (%rdx),%edx
  8013aa:	88 10                	mov    %dl,(%rax)
  8013ac:	0f b6 00             	movzbl (%rax),%eax
  8013af:	84 c0                	test   %al,%al
  8013b1:	75 dc                	jne    80138f <strcpy+0x19>
  8013b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013b7:	c9                   	leaveq 
  8013b8:	c3                   	retq   

00000000008013b9 <strcat>:
  8013b9:	55                   	push   %rbp
  8013ba:	48 89 e5             	mov    %rsp,%rbp
  8013bd:	48 83 ec 20          	sub    $0x20,%rsp
  8013c1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013c5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013cd:	48 89 c7             	mov    %rax,%rdi
  8013d0:	48 b8 0a 13 80 00 00 	movabs $0x80130a,%rax
  8013d7:	00 00 00 
  8013da:	ff d0                	callq  *%rax
  8013dc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8013df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8013e2:	48 63 d0             	movslq %eax,%rdx
  8013e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013e9:	48 01 c2             	add    %rax,%rdx
  8013ec:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8013f0:	48 89 c6             	mov    %rax,%rsi
  8013f3:	48 89 d7             	mov    %rdx,%rdi
  8013f6:	48 b8 76 13 80 00 00 	movabs $0x801376,%rax
  8013fd:	00 00 00 
  801400:	ff d0                	callq  *%rax
  801402:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801406:	c9                   	leaveq 
  801407:	c3                   	retq   

0000000000801408 <strncpy>:
  801408:	55                   	push   %rbp
  801409:	48 89 e5             	mov    %rsp,%rbp
  80140c:	48 83 ec 28          	sub    $0x28,%rsp
  801410:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801414:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801418:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80141c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801420:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801424:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80142b:	00 
  80142c:	eb 2a                	jmp    801458 <strncpy+0x50>
  80142e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801432:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801436:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80143a:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80143e:	0f b6 12             	movzbl (%rdx),%edx
  801441:	88 10                	mov    %dl,(%rax)
  801443:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801447:	0f b6 00             	movzbl (%rax),%eax
  80144a:	84 c0                	test   %al,%al
  80144c:	74 05                	je     801453 <strncpy+0x4b>
  80144e:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801453:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801458:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80145c:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801460:	72 cc                	jb     80142e <strncpy+0x26>
  801462:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801466:	c9                   	leaveq 
  801467:	c3                   	retq   

0000000000801468 <strlcpy>:
  801468:	55                   	push   %rbp
  801469:	48 89 e5             	mov    %rsp,%rbp
  80146c:	48 83 ec 28          	sub    $0x28,%rsp
  801470:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801474:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801478:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80147c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801480:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801484:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801489:	74 3d                	je     8014c8 <strlcpy+0x60>
  80148b:	eb 1d                	jmp    8014aa <strlcpy+0x42>
  80148d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801491:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801495:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801499:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80149d:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8014a1:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8014a5:	0f b6 12             	movzbl (%rdx),%edx
  8014a8:	88 10                	mov    %dl,(%rax)
  8014aa:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8014af:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8014b4:	74 0b                	je     8014c1 <strlcpy+0x59>
  8014b6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014ba:	0f b6 00             	movzbl (%rax),%eax
  8014bd:	84 c0                	test   %al,%al
  8014bf:	75 cc                	jne    80148d <strlcpy+0x25>
  8014c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014c5:	c6 00 00             	movb   $0x0,(%rax)
  8014c8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8014cc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014d0:	48 29 c2             	sub    %rax,%rdx
  8014d3:	48 89 d0             	mov    %rdx,%rax
  8014d6:	c9                   	leaveq 
  8014d7:	c3                   	retq   

00000000008014d8 <strcmp>:
  8014d8:	55                   	push   %rbp
  8014d9:	48 89 e5             	mov    %rsp,%rbp
  8014dc:	48 83 ec 10          	sub    $0x10,%rsp
  8014e0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014e4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8014e8:	eb 0a                	jmp    8014f4 <strcmp+0x1c>
  8014ea:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8014ef:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8014f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014f8:	0f b6 00             	movzbl (%rax),%eax
  8014fb:	84 c0                	test   %al,%al
  8014fd:	74 12                	je     801511 <strcmp+0x39>
  8014ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801503:	0f b6 10             	movzbl (%rax),%edx
  801506:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80150a:	0f b6 00             	movzbl (%rax),%eax
  80150d:	38 c2                	cmp    %al,%dl
  80150f:	74 d9                	je     8014ea <strcmp+0x12>
  801511:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801515:	0f b6 00             	movzbl (%rax),%eax
  801518:	0f b6 d0             	movzbl %al,%edx
  80151b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80151f:	0f b6 00             	movzbl (%rax),%eax
  801522:	0f b6 c0             	movzbl %al,%eax
  801525:	29 c2                	sub    %eax,%edx
  801527:	89 d0                	mov    %edx,%eax
  801529:	c9                   	leaveq 
  80152a:	c3                   	retq   

000000000080152b <strncmp>:
  80152b:	55                   	push   %rbp
  80152c:	48 89 e5             	mov    %rsp,%rbp
  80152f:	48 83 ec 18          	sub    $0x18,%rsp
  801533:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801537:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80153b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80153f:	eb 0f                	jmp    801550 <strncmp+0x25>
  801541:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801546:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80154b:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801550:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801555:	74 1d                	je     801574 <strncmp+0x49>
  801557:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80155b:	0f b6 00             	movzbl (%rax),%eax
  80155e:	84 c0                	test   %al,%al
  801560:	74 12                	je     801574 <strncmp+0x49>
  801562:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801566:	0f b6 10             	movzbl (%rax),%edx
  801569:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80156d:	0f b6 00             	movzbl (%rax),%eax
  801570:	38 c2                	cmp    %al,%dl
  801572:	74 cd                	je     801541 <strncmp+0x16>
  801574:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801579:	75 07                	jne    801582 <strncmp+0x57>
  80157b:	b8 00 00 00 00       	mov    $0x0,%eax
  801580:	eb 18                	jmp    80159a <strncmp+0x6f>
  801582:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801586:	0f b6 00             	movzbl (%rax),%eax
  801589:	0f b6 d0             	movzbl %al,%edx
  80158c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801590:	0f b6 00             	movzbl (%rax),%eax
  801593:	0f b6 c0             	movzbl %al,%eax
  801596:	29 c2                	sub    %eax,%edx
  801598:	89 d0                	mov    %edx,%eax
  80159a:	c9                   	leaveq 
  80159b:	c3                   	retq   

000000000080159c <strchr>:
  80159c:	55                   	push   %rbp
  80159d:	48 89 e5             	mov    %rsp,%rbp
  8015a0:	48 83 ec 10          	sub    $0x10,%rsp
  8015a4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015a8:	89 f0                	mov    %esi,%eax
  8015aa:	88 45 f4             	mov    %al,-0xc(%rbp)
  8015ad:	eb 17                	jmp    8015c6 <strchr+0x2a>
  8015af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015b3:	0f b6 00             	movzbl (%rax),%eax
  8015b6:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8015b9:	75 06                	jne    8015c1 <strchr+0x25>
  8015bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015bf:	eb 15                	jmp    8015d6 <strchr+0x3a>
  8015c1:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8015c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015ca:	0f b6 00             	movzbl (%rax),%eax
  8015cd:	84 c0                	test   %al,%al
  8015cf:	75 de                	jne    8015af <strchr+0x13>
  8015d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8015d6:	c9                   	leaveq 
  8015d7:	c3                   	retq   

00000000008015d8 <strfind>:
  8015d8:	55                   	push   %rbp
  8015d9:	48 89 e5             	mov    %rsp,%rbp
  8015dc:	48 83 ec 10          	sub    $0x10,%rsp
  8015e0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015e4:	89 f0                	mov    %esi,%eax
  8015e6:	88 45 f4             	mov    %al,-0xc(%rbp)
  8015e9:	eb 11                	jmp    8015fc <strfind+0x24>
  8015eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015ef:	0f b6 00             	movzbl (%rax),%eax
  8015f2:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8015f5:	74 12                	je     801609 <strfind+0x31>
  8015f7:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8015fc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801600:	0f b6 00             	movzbl (%rax),%eax
  801603:	84 c0                	test   %al,%al
  801605:	75 e4                	jne    8015eb <strfind+0x13>
  801607:	eb 01                	jmp    80160a <strfind+0x32>
  801609:	90                   	nop
  80160a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80160e:	c9                   	leaveq 
  80160f:	c3                   	retq   

0000000000801610 <memset>:
  801610:	55                   	push   %rbp
  801611:	48 89 e5             	mov    %rsp,%rbp
  801614:	48 83 ec 18          	sub    $0x18,%rsp
  801618:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80161c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80161f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801623:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801628:	75 06                	jne    801630 <memset+0x20>
  80162a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80162e:	eb 69                	jmp    801699 <memset+0x89>
  801630:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801634:	83 e0 03             	and    $0x3,%eax
  801637:	48 85 c0             	test   %rax,%rax
  80163a:	75 48                	jne    801684 <memset+0x74>
  80163c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801640:	83 e0 03             	and    $0x3,%eax
  801643:	48 85 c0             	test   %rax,%rax
  801646:	75 3c                	jne    801684 <memset+0x74>
  801648:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  80164f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801652:	c1 e0 18             	shl    $0x18,%eax
  801655:	89 c2                	mov    %eax,%edx
  801657:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80165a:	c1 e0 10             	shl    $0x10,%eax
  80165d:	09 c2                	or     %eax,%edx
  80165f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801662:	c1 e0 08             	shl    $0x8,%eax
  801665:	09 d0                	or     %edx,%eax
  801667:	09 45 f4             	or     %eax,-0xc(%rbp)
  80166a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80166e:	48 c1 e8 02          	shr    $0x2,%rax
  801672:	48 89 c1             	mov    %rax,%rcx
  801675:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801679:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80167c:	48 89 d7             	mov    %rdx,%rdi
  80167f:	fc                   	cld    
  801680:	f3 ab                	rep stos %eax,%es:(%rdi)
  801682:	eb 11                	jmp    801695 <memset+0x85>
  801684:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801688:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80168b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80168f:	48 89 d7             	mov    %rdx,%rdi
  801692:	fc                   	cld    
  801693:	f3 aa                	rep stos %al,%es:(%rdi)
  801695:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801699:	c9                   	leaveq 
  80169a:	c3                   	retq   

000000000080169b <memmove>:
  80169b:	55                   	push   %rbp
  80169c:	48 89 e5             	mov    %rsp,%rbp
  80169f:	48 83 ec 28          	sub    $0x28,%rsp
  8016a3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8016a7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8016ab:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8016af:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8016b3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8016b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016bb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8016bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016c3:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8016c7:	0f 83 88 00 00 00    	jae    801755 <memmove+0xba>
  8016cd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8016d1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016d5:	48 01 d0             	add    %rdx,%rax
  8016d8:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8016dc:	76 77                	jbe    801755 <memmove+0xba>
  8016de:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016e2:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8016e6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ea:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8016ee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016f2:	83 e0 03             	and    $0x3,%eax
  8016f5:	48 85 c0             	test   %rax,%rax
  8016f8:	75 3b                	jne    801735 <memmove+0x9a>
  8016fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016fe:	83 e0 03             	and    $0x3,%eax
  801701:	48 85 c0             	test   %rax,%rax
  801704:	75 2f                	jne    801735 <memmove+0x9a>
  801706:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80170a:	83 e0 03             	and    $0x3,%eax
  80170d:	48 85 c0             	test   %rax,%rax
  801710:	75 23                	jne    801735 <memmove+0x9a>
  801712:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801716:	48 83 e8 04          	sub    $0x4,%rax
  80171a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80171e:	48 83 ea 04          	sub    $0x4,%rdx
  801722:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801726:	48 c1 e9 02          	shr    $0x2,%rcx
  80172a:	48 89 c7             	mov    %rax,%rdi
  80172d:	48 89 d6             	mov    %rdx,%rsi
  801730:	fd                   	std    
  801731:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801733:	eb 1d                	jmp    801752 <memmove+0xb7>
  801735:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801739:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80173d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801741:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801745:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801749:	48 89 d7             	mov    %rdx,%rdi
  80174c:	48 89 c1             	mov    %rax,%rcx
  80174f:	fd                   	std    
  801750:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801752:	fc                   	cld    
  801753:	eb 57                	jmp    8017ac <memmove+0x111>
  801755:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801759:	83 e0 03             	and    $0x3,%eax
  80175c:	48 85 c0             	test   %rax,%rax
  80175f:	75 36                	jne    801797 <memmove+0xfc>
  801761:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801765:	83 e0 03             	and    $0x3,%eax
  801768:	48 85 c0             	test   %rax,%rax
  80176b:	75 2a                	jne    801797 <memmove+0xfc>
  80176d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801771:	83 e0 03             	and    $0x3,%eax
  801774:	48 85 c0             	test   %rax,%rax
  801777:	75 1e                	jne    801797 <memmove+0xfc>
  801779:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80177d:	48 c1 e8 02          	shr    $0x2,%rax
  801781:	48 89 c1             	mov    %rax,%rcx
  801784:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801788:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80178c:	48 89 c7             	mov    %rax,%rdi
  80178f:	48 89 d6             	mov    %rdx,%rsi
  801792:	fc                   	cld    
  801793:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801795:	eb 15                	jmp    8017ac <memmove+0x111>
  801797:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80179b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80179f:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8017a3:	48 89 c7             	mov    %rax,%rdi
  8017a6:	48 89 d6             	mov    %rdx,%rsi
  8017a9:	fc                   	cld    
  8017aa:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8017ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017b0:	c9                   	leaveq 
  8017b1:	c3                   	retq   

00000000008017b2 <memcpy>:
  8017b2:	55                   	push   %rbp
  8017b3:	48 89 e5             	mov    %rsp,%rbp
  8017b6:	48 83 ec 18          	sub    $0x18,%rsp
  8017ba:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8017be:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8017c2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8017c6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017ca:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8017ce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017d2:	48 89 ce             	mov    %rcx,%rsi
  8017d5:	48 89 c7             	mov    %rax,%rdi
  8017d8:	48 b8 9b 16 80 00 00 	movabs $0x80169b,%rax
  8017df:	00 00 00 
  8017e2:	ff d0                	callq  *%rax
  8017e4:	c9                   	leaveq 
  8017e5:	c3                   	retq   

00000000008017e6 <memcmp>:
  8017e6:	55                   	push   %rbp
  8017e7:	48 89 e5             	mov    %rsp,%rbp
  8017ea:	48 83 ec 28          	sub    $0x28,%rsp
  8017ee:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8017f2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8017f6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8017fa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017fe:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801802:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801806:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80180a:	eb 36                	jmp    801842 <memcmp+0x5c>
  80180c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801810:	0f b6 10             	movzbl (%rax),%edx
  801813:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801817:	0f b6 00             	movzbl (%rax),%eax
  80181a:	38 c2                	cmp    %al,%dl
  80181c:	74 1a                	je     801838 <memcmp+0x52>
  80181e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801822:	0f b6 00             	movzbl (%rax),%eax
  801825:	0f b6 d0             	movzbl %al,%edx
  801828:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80182c:	0f b6 00             	movzbl (%rax),%eax
  80182f:	0f b6 c0             	movzbl %al,%eax
  801832:	29 c2                	sub    %eax,%edx
  801834:	89 d0                	mov    %edx,%eax
  801836:	eb 20                	jmp    801858 <memcmp+0x72>
  801838:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80183d:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801842:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801846:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80184a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80184e:	48 85 c0             	test   %rax,%rax
  801851:	75 b9                	jne    80180c <memcmp+0x26>
  801853:	b8 00 00 00 00       	mov    $0x0,%eax
  801858:	c9                   	leaveq 
  801859:	c3                   	retq   

000000000080185a <memfind>:
  80185a:	55                   	push   %rbp
  80185b:	48 89 e5             	mov    %rsp,%rbp
  80185e:	48 83 ec 28          	sub    $0x28,%rsp
  801862:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801866:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801869:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80186d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801871:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801875:	48 01 d0             	add    %rdx,%rax
  801878:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80187c:	eb 13                	jmp    801891 <memfind+0x37>
  80187e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801882:	0f b6 00             	movzbl (%rax),%eax
  801885:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801888:	38 d0                	cmp    %dl,%al
  80188a:	74 11                	je     80189d <memfind+0x43>
  80188c:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801891:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801895:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801899:	72 e3                	jb     80187e <memfind+0x24>
  80189b:	eb 01                	jmp    80189e <memfind+0x44>
  80189d:	90                   	nop
  80189e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018a2:	c9                   	leaveq 
  8018a3:	c3                   	retq   

00000000008018a4 <strtol>:
  8018a4:	55                   	push   %rbp
  8018a5:	48 89 e5             	mov    %rsp,%rbp
  8018a8:	48 83 ec 38          	sub    $0x38,%rsp
  8018ac:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8018b0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8018b4:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8018b7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8018be:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8018c5:	00 
  8018c6:	eb 05                	jmp    8018cd <strtol+0x29>
  8018c8:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8018cd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018d1:	0f b6 00             	movzbl (%rax),%eax
  8018d4:	3c 20                	cmp    $0x20,%al
  8018d6:	74 f0                	je     8018c8 <strtol+0x24>
  8018d8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018dc:	0f b6 00             	movzbl (%rax),%eax
  8018df:	3c 09                	cmp    $0x9,%al
  8018e1:	74 e5                	je     8018c8 <strtol+0x24>
  8018e3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018e7:	0f b6 00             	movzbl (%rax),%eax
  8018ea:	3c 2b                	cmp    $0x2b,%al
  8018ec:	75 07                	jne    8018f5 <strtol+0x51>
  8018ee:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8018f3:	eb 17                	jmp    80190c <strtol+0x68>
  8018f5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018f9:	0f b6 00             	movzbl (%rax),%eax
  8018fc:	3c 2d                	cmp    $0x2d,%al
  8018fe:	75 0c                	jne    80190c <strtol+0x68>
  801900:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801905:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  80190c:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801910:	74 06                	je     801918 <strtol+0x74>
  801912:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801916:	75 28                	jne    801940 <strtol+0x9c>
  801918:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80191c:	0f b6 00             	movzbl (%rax),%eax
  80191f:	3c 30                	cmp    $0x30,%al
  801921:	75 1d                	jne    801940 <strtol+0x9c>
  801923:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801927:	48 83 c0 01          	add    $0x1,%rax
  80192b:	0f b6 00             	movzbl (%rax),%eax
  80192e:	3c 78                	cmp    $0x78,%al
  801930:	75 0e                	jne    801940 <strtol+0x9c>
  801932:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801937:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  80193e:	eb 2c                	jmp    80196c <strtol+0xc8>
  801940:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801944:	75 19                	jne    80195f <strtol+0xbb>
  801946:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80194a:	0f b6 00             	movzbl (%rax),%eax
  80194d:	3c 30                	cmp    $0x30,%al
  80194f:	75 0e                	jne    80195f <strtol+0xbb>
  801951:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801956:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  80195d:	eb 0d                	jmp    80196c <strtol+0xc8>
  80195f:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801963:	75 07                	jne    80196c <strtol+0xc8>
  801965:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  80196c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801970:	0f b6 00             	movzbl (%rax),%eax
  801973:	3c 2f                	cmp    $0x2f,%al
  801975:	7e 1d                	jle    801994 <strtol+0xf0>
  801977:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80197b:	0f b6 00             	movzbl (%rax),%eax
  80197e:	3c 39                	cmp    $0x39,%al
  801980:	7f 12                	jg     801994 <strtol+0xf0>
  801982:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801986:	0f b6 00             	movzbl (%rax),%eax
  801989:	0f be c0             	movsbl %al,%eax
  80198c:	83 e8 30             	sub    $0x30,%eax
  80198f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801992:	eb 4e                	jmp    8019e2 <strtol+0x13e>
  801994:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801998:	0f b6 00             	movzbl (%rax),%eax
  80199b:	3c 60                	cmp    $0x60,%al
  80199d:	7e 1d                	jle    8019bc <strtol+0x118>
  80199f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019a3:	0f b6 00             	movzbl (%rax),%eax
  8019a6:	3c 7a                	cmp    $0x7a,%al
  8019a8:	7f 12                	jg     8019bc <strtol+0x118>
  8019aa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019ae:	0f b6 00             	movzbl (%rax),%eax
  8019b1:	0f be c0             	movsbl %al,%eax
  8019b4:	83 e8 57             	sub    $0x57,%eax
  8019b7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8019ba:	eb 26                	jmp    8019e2 <strtol+0x13e>
  8019bc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019c0:	0f b6 00             	movzbl (%rax),%eax
  8019c3:	3c 40                	cmp    $0x40,%al
  8019c5:	7e 47                	jle    801a0e <strtol+0x16a>
  8019c7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019cb:	0f b6 00             	movzbl (%rax),%eax
  8019ce:	3c 5a                	cmp    $0x5a,%al
  8019d0:	7f 3c                	jg     801a0e <strtol+0x16a>
  8019d2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019d6:	0f b6 00             	movzbl (%rax),%eax
  8019d9:	0f be c0             	movsbl %al,%eax
  8019dc:	83 e8 37             	sub    $0x37,%eax
  8019df:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8019e2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8019e5:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8019e8:	7d 23                	jge    801a0d <strtol+0x169>
  8019ea:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8019ef:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8019f2:	48 98                	cltq   
  8019f4:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8019f9:	48 89 c2             	mov    %rax,%rdx
  8019fc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8019ff:	48 98                	cltq   
  801a01:	48 01 d0             	add    %rdx,%rax
  801a04:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801a08:	e9 5f ff ff ff       	jmpq   80196c <strtol+0xc8>
  801a0d:	90                   	nop
  801a0e:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801a13:	74 0b                	je     801a20 <strtol+0x17c>
  801a15:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801a19:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801a1d:	48 89 10             	mov    %rdx,(%rax)
  801a20:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801a24:	74 09                	je     801a2f <strtol+0x18b>
  801a26:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a2a:	48 f7 d8             	neg    %rax
  801a2d:	eb 04                	jmp    801a33 <strtol+0x18f>
  801a2f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a33:	c9                   	leaveq 
  801a34:	c3                   	retq   

0000000000801a35 <strstr>:
  801a35:	55                   	push   %rbp
  801a36:	48 89 e5             	mov    %rsp,%rbp
  801a39:	48 83 ec 30          	sub    $0x30,%rsp
  801a3d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801a41:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801a45:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801a49:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801a4d:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801a51:	0f b6 00             	movzbl (%rax),%eax
  801a54:	88 45 ff             	mov    %al,-0x1(%rbp)
  801a57:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801a5b:	75 06                	jne    801a63 <strstr+0x2e>
  801a5d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a61:	eb 6b                	jmp    801ace <strstr+0x99>
  801a63:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801a67:	48 89 c7             	mov    %rax,%rdi
  801a6a:	48 b8 0a 13 80 00 00 	movabs $0x80130a,%rax
  801a71:	00 00 00 
  801a74:	ff d0                	callq  *%rax
  801a76:	48 98                	cltq   
  801a78:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801a7c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a80:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801a84:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801a88:	0f b6 00             	movzbl (%rax),%eax
  801a8b:	88 45 ef             	mov    %al,-0x11(%rbp)
  801a8e:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801a92:	75 07                	jne    801a9b <strstr+0x66>
  801a94:	b8 00 00 00 00       	mov    $0x0,%eax
  801a99:	eb 33                	jmp    801ace <strstr+0x99>
  801a9b:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801a9f:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801aa2:	75 d8                	jne    801a7c <strstr+0x47>
  801aa4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801aa8:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801aac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ab0:	48 89 ce             	mov    %rcx,%rsi
  801ab3:	48 89 c7             	mov    %rax,%rdi
  801ab6:	48 b8 2b 15 80 00 00 	movabs $0x80152b,%rax
  801abd:	00 00 00 
  801ac0:	ff d0                	callq  *%rax
  801ac2:	85 c0                	test   %eax,%eax
  801ac4:	75 b6                	jne    801a7c <strstr+0x47>
  801ac6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801aca:	48 83 e8 01          	sub    $0x1,%rax
  801ace:	c9                   	leaveq 
  801acf:	c3                   	retq   

0000000000801ad0 <syscall>:
  801ad0:	55                   	push   %rbp
  801ad1:	48 89 e5             	mov    %rsp,%rbp
  801ad4:	53                   	push   %rbx
  801ad5:	48 83 ec 48          	sub    $0x48,%rsp
  801ad9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801adc:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801adf:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801ae3:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801ae7:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801aeb:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801aef:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801af2:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801af6:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801afa:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801afe:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801b02:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801b06:	4c 89 c3             	mov    %r8,%rbx
  801b09:	cd 30                	int    $0x30
  801b0b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801b0f:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801b13:	74 3e                	je     801b53 <syscall+0x83>
  801b15:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801b1a:	7e 37                	jle    801b53 <syscall+0x83>
  801b1c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801b20:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801b23:	49 89 d0             	mov    %rdx,%r8
  801b26:	89 c1                	mov    %eax,%ecx
  801b28:	48 ba 68 52 80 00 00 	movabs $0x805268,%rdx
  801b2f:	00 00 00 
  801b32:	be 24 00 00 00       	mov    $0x24,%esi
  801b37:	48 bf 85 52 80 00 00 	movabs $0x805285,%rdi
  801b3e:	00 00 00 
  801b41:	b8 00 00 00 00       	mov    $0x0,%eax
  801b46:	49 b9 ac 05 80 00 00 	movabs $0x8005ac,%r9
  801b4d:	00 00 00 
  801b50:	41 ff d1             	callq  *%r9
  801b53:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b57:	48 83 c4 48          	add    $0x48,%rsp
  801b5b:	5b                   	pop    %rbx
  801b5c:	5d                   	pop    %rbp
  801b5d:	c3                   	retq   

0000000000801b5e <sys_cputs>:
  801b5e:	55                   	push   %rbp
  801b5f:	48 89 e5             	mov    %rsp,%rbp
  801b62:	48 83 ec 10          	sub    $0x10,%rsp
  801b66:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b6a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b6e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b72:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b76:	48 83 ec 08          	sub    $0x8,%rsp
  801b7a:	6a 00                	pushq  $0x0
  801b7c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b82:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b88:	48 89 d1             	mov    %rdx,%rcx
  801b8b:	48 89 c2             	mov    %rax,%rdx
  801b8e:	be 00 00 00 00       	mov    $0x0,%esi
  801b93:	bf 00 00 00 00       	mov    $0x0,%edi
  801b98:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  801b9f:	00 00 00 
  801ba2:	ff d0                	callq  *%rax
  801ba4:	48 83 c4 10          	add    $0x10,%rsp
  801ba8:	90                   	nop
  801ba9:	c9                   	leaveq 
  801baa:	c3                   	retq   

0000000000801bab <sys_cgetc>:
  801bab:	55                   	push   %rbp
  801bac:	48 89 e5             	mov    %rsp,%rbp
  801baf:	48 83 ec 08          	sub    $0x8,%rsp
  801bb3:	6a 00                	pushq  $0x0
  801bb5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bbb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bc1:	b9 00 00 00 00       	mov    $0x0,%ecx
  801bc6:	ba 00 00 00 00       	mov    $0x0,%edx
  801bcb:	be 00 00 00 00       	mov    $0x0,%esi
  801bd0:	bf 01 00 00 00       	mov    $0x1,%edi
  801bd5:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  801bdc:	00 00 00 
  801bdf:	ff d0                	callq  *%rax
  801be1:	48 83 c4 10          	add    $0x10,%rsp
  801be5:	c9                   	leaveq 
  801be6:	c3                   	retq   

0000000000801be7 <sys_env_destroy>:
  801be7:	55                   	push   %rbp
  801be8:	48 89 e5             	mov    %rsp,%rbp
  801beb:	48 83 ec 10          	sub    $0x10,%rsp
  801bef:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bf2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bf5:	48 98                	cltq   
  801bf7:	48 83 ec 08          	sub    $0x8,%rsp
  801bfb:	6a 00                	pushq  $0x0
  801bfd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c03:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c09:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c0e:	48 89 c2             	mov    %rax,%rdx
  801c11:	be 01 00 00 00       	mov    $0x1,%esi
  801c16:	bf 03 00 00 00       	mov    $0x3,%edi
  801c1b:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  801c22:	00 00 00 
  801c25:	ff d0                	callq  *%rax
  801c27:	48 83 c4 10          	add    $0x10,%rsp
  801c2b:	c9                   	leaveq 
  801c2c:	c3                   	retq   

0000000000801c2d <sys_getenvid>:
  801c2d:	55                   	push   %rbp
  801c2e:	48 89 e5             	mov    %rsp,%rbp
  801c31:	48 83 ec 08          	sub    $0x8,%rsp
  801c35:	6a 00                	pushq  $0x0
  801c37:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c3d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c43:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c48:	ba 00 00 00 00       	mov    $0x0,%edx
  801c4d:	be 00 00 00 00       	mov    $0x0,%esi
  801c52:	bf 02 00 00 00       	mov    $0x2,%edi
  801c57:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  801c5e:	00 00 00 
  801c61:	ff d0                	callq  *%rax
  801c63:	48 83 c4 10          	add    $0x10,%rsp
  801c67:	c9                   	leaveq 
  801c68:	c3                   	retq   

0000000000801c69 <sys_yield>:
  801c69:	55                   	push   %rbp
  801c6a:	48 89 e5             	mov    %rsp,%rbp
  801c6d:	48 83 ec 08          	sub    $0x8,%rsp
  801c71:	6a 00                	pushq  $0x0
  801c73:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c79:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c7f:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c84:	ba 00 00 00 00       	mov    $0x0,%edx
  801c89:	be 00 00 00 00       	mov    $0x0,%esi
  801c8e:	bf 0b 00 00 00       	mov    $0xb,%edi
  801c93:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  801c9a:	00 00 00 
  801c9d:	ff d0                	callq  *%rax
  801c9f:	48 83 c4 10          	add    $0x10,%rsp
  801ca3:	90                   	nop
  801ca4:	c9                   	leaveq 
  801ca5:	c3                   	retq   

0000000000801ca6 <sys_page_alloc>:
  801ca6:	55                   	push   %rbp
  801ca7:	48 89 e5             	mov    %rsp,%rbp
  801caa:	48 83 ec 10          	sub    $0x10,%rsp
  801cae:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cb1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801cb5:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801cb8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801cbb:	48 63 c8             	movslq %eax,%rcx
  801cbe:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801cc2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cc5:	48 98                	cltq   
  801cc7:	48 83 ec 08          	sub    $0x8,%rsp
  801ccb:	6a 00                	pushq  $0x0
  801ccd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cd3:	49 89 c8             	mov    %rcx,%r8
  801cd6:	48 89 d1             	mov    %rdx,%rcx
  801cd9:	48 89 c2             	mov    %rax,%rdx
  801cdc:	be 01 00 00 00       	mov    $0x1,%esi
  801ce1:	bf 04 00 00 00       	mov    $0x4,%edi
  801ce6:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  801ced:	00 00 00 
  801cf0:	ff d0                	callq  *%rax
  801cf2:	48 83 c4 10          	add    $0x10,%rsp
  801cf6:	c9                   	leaveq 
  801cf7:	c3                   	retq   

0000000000801cf8 <sys_page_map>:
  801cf8:	55                   	push   %rbp
  801cf9:	48 89 e5             	mov    %rsp,%rbp
  801cfc:	48 83 ec 20          	sub    $0x20,%rsp
  801d00:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d03:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d07:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d0a:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801d0e:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801d12:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801d15:	48 63 c8             	movslq %eax,%rcx
  801d18:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801d1c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d1f:	48 63 f0             	movslq %eax,%rsi
  801d22:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d26:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d29:	48 98                	cltq   
  801d2b:	48 83 ec 08          	sub    $0x8,%rsp
  801d2f:	51                   	push   %rcx
  801d30:	49 89 f9             	mov    %rdi,%r9
  801d33:	49 89 f0             	mov    %rsi,%r8
  801d36:	48 89 d1             	mov    %rdx,%rcx
  801d39:	48 89 c2             	mov    %rax,%rdx
  801d3c:	be 01 00 00 00       	mov    $0x1,%esi
  801d41:	bf 05 00 00 00       	mov    $0x5,%edi
  801d46:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  801d4d:	00 00 00 
  801d50:	ff d0                	callq  *%rax
  801d52:	48 83 c4 10          	add    $0x10,%rsp
  801d56:	c9                   	leaveq 
  801d57:	c3                   	retq   

0000000000801d58 <sys_page_unmap>:
  801d58:	55                   	push   %rbp
  801d59:	48 89 e5             	mov    %rsp,%rbp
  801d5c:	48 83 ec 10          	sub    $0x10,%rsp
  801d60:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d63:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d67:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d6b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d6e:	48 98                	cltq   
  801d70:	48 83 ec 08          	sub    $0x8,%rsp
  801d74:	6a 00                	pushq  $0x0
  801d76:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d7c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d82:	48 89 d1             	mov    %rdx,%rcx
  801d85:	48 89 c2             	mov    %rax,%rdx
  801d88:	be 01 00 00 00       	mov    $0x1,%esi
  801d8d:	bf 06 00 00 00       	mov    $0x6,%edi
  801d92:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  801d99:	00 00 00 
  801d9c:	ff d0                	callq  *%rax
  801d9e:	48 83 c4 10          	add    $0x10,%rsp
  801da2:	c9                   	leaveq 
  801da3:	c3                   	retq   

0000000000801da4 <sys_env_set_status>:
  801da4:	55                   	push   %rbp
  801da5:	48 89 e5             	mov    %rsp,%rbp
  801da8:	48 83 ec 10          	sub    $0x10,%rsp
  801dac:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801daf:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801db2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801db5:	48 63 d0             	movslq %eax,%rdx
  801db8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801dbb:	48 98                	cltq   
  801dbd:	48 83 ec 08          	sub    $0x8,%rsp
  801dc1:	6a 00                	pushq  $0x0
  801dc3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dc9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dcf:	48 89 d1             	mov    %rdx,%rcx
  801dd2:	48 89 c2             	mov    %rax,%rdx
  801dd5:	be 01 00 00 00       	mov    $0x1,%esi
  801dda:	bf 08 00 00 00       	mov    $0x8,%edi
  801ddf:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  801de6:	00 00 00 
  801de9:	ff d0                	callq  *%rax
  801deb:	48 83 c4 10          	add    $0x10,%rsp
  801def:	c9                   	leaveq 
  801df0:	c3                   	retq   

0000000000801df1 <sys_env_set_trapframe>:
  801df1:	55                   	push   %rbp
  801df2:	48 89 e5             	mov    %rsp,%rbp
  801df5:	48 83 ec 10          	sub    $0x10,%rsp
  801df9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801dfc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e00:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e04:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e07:	48 98                	cltq   
  801e09:	48 83 ec 08          	sub    $0x8,%rsp
  801e0d:	6a 00                	pushq  $0x0
  801e0f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e15:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e1b:	48 89 d1             	mov    %rdx,%rcx
  801e1e:	48 89 c2             	mov    %rax,%rdx
  801e21:	be 01 00 00 00       	mov    $0x1,%esi
  801e26:	bf 09 00 00 00       	mov    $0x9,%edi
  801e2b:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  801e32:	00 00 00 
  801e35:	ff d0                	callq  *%rax
  801e37:	48 83 c4 10          	add    $0x10,%rsp
  801e3b:	c9                   	leaveq 
  801e3c:	c3                   	retq   

0000000000801e3d <sys_env_set_pgfault_upcall>:
  801e3d:	55                   	push   %rbp
  801e3e:	48 89 e5             	mov    %rsp,%rbp
  801e41:	48 83 ec 10          	sub    $0x10,%rsp
  801e45:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e48:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e4c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e50:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e53:	48 98                	cltq   
  801e55:	48 83 ec 08          	sub    $0x8,%rsp
  801e59:	6a 00                	pushq  $0x0
  801e5b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e61:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e67:	48 89 d1             	mov    %rdx,%rcx
  801e6a:	48 89 c2             	mov    %rax,%rdx
  801e6d:	be 01 00 00 00       	mov    $0x1,%esi
  801e72:	bf 0a 00 00 00       	mov    $0xa,%edi
  801e77:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  801e7e:	00 00 00 
  801e81:	ff d0                	callq  *%rax
  801e83:	48 83 c4 10          	add    $0x10,%rsp
  801e87:	c9                   	leaveq 
  801e88:	c3                   	retq   

0000000000801e89 <sys_ipc_try_send>:
  801e89:	55                   	push   %rbp
  801e8a:	48 89 e5             	mov    %rsp,%rbp
  801e8d:	48 83 ec 20          	sub    $0x20,%rsp
  801e91:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e94:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e98:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801e9c:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801e9f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ea2:	48 63 f0             	movslq %eax,%rsi
  801ea5:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801ea9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801eac:	48 98                	cltq   
  801eae:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801eb2:	48 83 ec 08          	sub    $0x8,%rsp
  801eb6:	6a 00                	pushq  $0x0
  801eb8:	49 89 f1             	mov    %rsi,%r9
  801ebb:	49 89 c8             	mov    %rcx,%r8
  801ebe:	48 89 d1             	mov    %rdx,%rcx
  801ec1:	48 89 c2             	mov    %rax,%rdx
  801ec4:	be 00 00 00 00       	mov    $0x0,%esi
  801ec9:	bf 0c 00 00 00       	mov    $0xc,%edi
  801ece:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  801ed5:	00 00 00 
  801ed8:	ff d0                	callq  *%rax
  801eda:	48 83 c4 10          	add    $0x10,%rsp
  801ede:	c9                   	leaveq 
  801edf:	c3                   	retq   

0000000000801ee0 <sys_ipc_recv>:
  801ee0:	55                   	push   %rbp
  801ee1:	48 89 e5             	mov    %rsp,%rbp
  801ee4:	48 83 ec 10          	sub    $0x10,%rsp
  801ee8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801eec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ef0:	48 83 ec 08          	sub    $0x8,%rsp
  801ef4:	6a 00                	pushq  $0x0
  801ef6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801efc:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f02:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f07:	48 89 c2             	mov    %rax,%rdx
  801f0a:	be 01 00 00 00       	mov    $0x1,%esi
  801f0f:	bf 0d 00 00 00       	mov    $0xd,%edi
  801f14:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  801f1b:	00 00 00 
  801f1e:	ff d0                	callq  *%rax
  801f20:	48 83 c4 10          	add    $0x10,%rsp
  801f24:	c9                   	leaveq 
  801f25:	c3                   	retq   

0000000000801f26 <sys_time_msec>:
  801f26:	55                   	push   %rbp
  801f27:	48 89 e5             	mov    %rsp,%rbp
  801f2a:	48 83 ec 08          	sub    $0x8,%rsp
  801f2e:	6a 00                	pushq  $0x0
  801f30:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f36:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f3c:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f41:	ba 00 00 00 00       	mov    $0x0,%edx
  801f46:	be 00 00 00 00       	mov    $0x0,%esi
  801f4b:	bf 0e 00 00 00       	mov    $0xe,%edi
  801f50:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  801f57:	00 00 00 
  801f5a:	ff d0                	callq  *%rax
  801f5c:	48 83 c4 10          	add    $0x10,%rsp
  801f60:	c9                   	leaveq 
  801f61:	c3                   	retq   

0000000000801f62 <sys_net_transmit>:
  801f62:	55                   	push   %rbp
  801f63:	48 89 e5             	mov    %rsp,%rbp
  801f66:	48 83 ec 10          	sub    $0x10,%rsp
  801f6a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f6e:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801f71:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801f74:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f78:	48 83 ec 08          	sub    $0x8,%rsp
  801f7c:	6a 00                	pushq  $0x0
  801f7e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f84:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f8a:	48 89 d1             	mov    %rdx,%rcx
  801f8d:	48 89 c2             	mov    %rax,%rdx
  801f90:	be 00 00 00 00       	mov    $0x0,%esi
  801f95:	bf 0f 00 00 00       	mov    $0xf,%edi
  801f9a:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  801fa1:	00 00 00 
  801fa4:	ff d0                	callq  *%rax
  801fa6:	48 83 c4 10          	add    $0x10,%rsp
  801faa:	c9                   	leaveq 
  801fab:	c3                   	retq   

0000000000801fac <sys_net_receive>:
  801fac:	55                   	push   %rbp
  801fad:	48 89 e5             	mov    %rsp,%rbp
  801fb0:	48 83 ec 10          	sub    $0x10,%rsp
  801fb4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801fb8:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801fbb:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801fbe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fc2:	48 83 ec 08          	sub    $0x8,%rsp
  801fc6:	6a 00                	pushq  $0x0
  801fc8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fce:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fd4:	48 89 d1             	mov    %rdx,%rcx
  801fd7:	48 89 c2             	mov    %rax,%rdx
  801fda:	be 00 00 00 00       	mov    $0x0,%esi
  801fdf:	bf 10 00 00 00       	mov    $0x10,%edi
  801fe4:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  801feb:	00 00 00 
  801fee:	ff d0                	callq  *%rax
  801ff0:	48 83 c4 10          	add    $0x10,%rsp
  801ff4:	c9                   	leaveq 
  801ff5:	c3                   	retq   

0000000000801ff6 <sys_ept_map>:
  801ff6:	55                   	push   %rbp
  801ff7:	48 89 e5             	mov    %rsp,%rbp
  801ffa:	48 83 ec 20          	sub    $0x20,%rsp
  801ffe:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802001:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802005:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802008:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  80200c:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802010:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802013:	48 63 c8             	movslq %eax,%rcx
  802016:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  80201a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80201d:	48 63 f0             	movslq %eax,%rsi
  802020:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802024:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802027:	48 98                	cltq   
  802029:	48 83 ec 08          	sub    $0x8,%rsp
  80202d:	51                   	push   %rcx
  80202e:	49 89 f9             	mov    %rdi,%r9
  802031:	49 89 f0             	mov    %rsi,%r8
  802034:	48 89 d1             	mov    %rdx,%rcx
  802037:	48 89 c2             	mov    %rax,%rdx
  80203a:	be 00 00 00 00       	mov    $0x0,%esi
  80203f:	bf 11 00 00 00       	mov    $0x11,%edi
  802044:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  80204b:	00 00 00 
  80204e:	ff d0                	callq  *%rax
  802050:	48 83 c4 10          	add    $0x10,%rsp
  802054:	c9                   	leaveq 
  802055:	c3                   	retq   

0000000000802056 <sys_env_mkguest>:
  802056:	55                   	push   %rbp
  802057:	48 89 e5             	mov    %rsp,%rbp
  80205a:	48 83 ec 10          	sub    $0x10,%rsp
  80205e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802062:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802066:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80206a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80206e:	48 83 ec 08          	sub    $0x8,%rsp
  802072:	6a 00                	pushq  $0x0
  802074:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80207a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802080:	48 89 d1             	mov    %rdx,%rcx
  802083:	48 89 c2             	mov    %rax,%rdx
  802086:	be 00 00 00 00       	mov    $0x0,%esi
  80208b:	bf 12 00 00 00       	mov    $0x12,%edi
  802090:	48 b8 d0 1a 80 00 00 	movabs $0x801ad0,%rax
  802097:	00 00 00 
  80209a:	ff d0                	callq  *%rax
  80209c:	48 83 c4 10          	add    $0x10,%rsp
  8020a0:	c9                   	leaveq 
  8020a1:	c3                   	retq   

00000000008020a2 <pgfault>:
  8020a2:	55                   	push   %rbp
  8020a3:	48 89 e5             	mov    %rsp,%rbp
  8020a6:	48 83 ec 30          	sub    $0x30,%rsp
  8020aa:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8020ae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020b2:	48 8b 00             	mov    (%rax),%rax
  8020b5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8020b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020bd:	48 8b 40 08          	mov    0x8(%rax),%rax
  8020c1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020c7:	83 e0 02             	and    $0x2,%eax
  8020ca:	85 c0                	test   %eax,%eax
  8020cc:	75 40                	jne    80210e <pgfault+0x6c>
  8020ce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020d2:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  8020d9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8020dd:	49 89 d0             	mov    %rdx,%r8
  8020e0:	48 89 c1             	mov    %rax,%rcx
  8020e3:	48 ba 98 52 80 00 00 	movabs $0x805298,%rdx
  8020ea:	00 00 00 
  8020ed:	be 1f 00 00 00       	mov    $0x1f,%esi
  8020f2:	48 bf b1 52 80 00 00 	movabs $0x8052b1,%rdi
  8020f9:	00 00 00 
  8020fc:	b8 00 00 00 00       	mov    $0x0,%eax
  802101:	49 b9 ac 05 80 00 00 	movabs $0x8005ac,%r9
  802108:	00 00 00 
  80210b:	41 ff d1             	callq  *%r9
  80210e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802112:	48 c1 e8 0c          	shr    $0xc,%rax
  802116:	48 89 c2             	mov    %rax,%rdx
  802119:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802120:	01 00 00 
  802123:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802127:	25 07 08 00 00       	and    $0x807,%eax
  80212c:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  802132:	74 4e                	je     802182 <pgfault+0xe0>
  802134:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802138:	48 c1 e8 0c          	shr    $0xc,%rax
  80213c:	48 89 c2             	mov    %rax,%rdx
  80213f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802146:	01 00 00 
  802149:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80214d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802151:	49 89 d0             	mov    %rdx,%r8
  802154:	48 89 c1             	mov    %rax,%rcx
  802157:	48 ba c0 52 80 00 00 	movabs $0x8052c0,%rdx
  80215e:	00 00 00 
  802161:	be 22 00 00 00       	mov    $0x22,%esi
  802166:	48 bf b1 52 80 00 00 	movabs $0x8052b1,%rdi
  80216d:	00 00 00 
  802170:	b8 00 00 00 00       	mov    $0x0,%eax
  802175:	49 b9 ac 05 80 00 00 	movabs $0x8005ac,%r9
  80217c:	00 00 00 
  80217f:	41 ff d1             	callq  *%r9
  802182:	ba 07 00 00 00       	mov    $0x7,%edx
  802187:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  80218c:	bf 00 00 00 00       	mov    $0x0,%edi
  802191:	48 b8 a6 1c 80 00 00 	movabs $0x801ca6,%rax
  802198:	00 00 00 
  80219b:	ff d0                	callq  *%rax
  80219d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8021a0:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8021a4:	79 30                	jns    8021d6 <pgfault+0x134>
  8021a6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8021a9:	89 c1                	mov    %eax,%ecx
  8021ab:	48 ba eb 52 80 00 00 	movabs $0x8052eb,%rdx
  8021b2:	00 00 00 
  8021b5:	be 30 00 00 00       	mov    $0x30,%esi
  8021ba:	48 bf b1 52 80 00 00 	movabs $0x8052b1,%rdi
  8021c1:	00 00 00 
  8021c4:	b8 00 00 00 00       	mov    $0x0,%eax
  8021c9:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  8021d0:	00 00 00 
  8021d3:	41 ff d0             	callq  *%r8
  8021d6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8021da:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8021de:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021e2:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8021e8:	ba 00 10 00 00       	mov    $0x1000,%edx
  8021ed:	48 89 c6             	mov    %rax,%rsi
  8021f0:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  8021f5:	48 b8 9b 16 80 00 00 	movabs $0x80169b,%rax
  8021fc:	00 00 00 
  8021ff:	ff d0                	callq  *%rax
  802201:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802205:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802209:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80220d:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802213:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  802219:	48 89 c1             	mov    %rax,%rcx
  80221c:	ba 00 00 00 00       	mov    $0x0,%edx
  802221:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802226:	bf 00 00 00 00       	mov    $0x0,%edi
  80222b:	48 b8 f8 1c 80 00 00 	movabs $0x801cf8,%rax
  802232:	00 00 00 
  802235:	ff d0                	callq  *%rax
  802237:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80223a:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80223e:	79 30                	jns    802270 <pgfault+0x1ce>
  802240:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802243:	89 c1                	mov    %eax,%ecx
  802245:	48 ba fe 52 80 00 00 	movabs $0x8052fe,%rdx
  80224c:	00 00 00 
  80224f:	be 35 00 00 00       	mov    $0x35,%esi
  802254:	48 bf b1 52 80 00 00 	movabs $0x8052b1,%rdi
  80225b:	00 00 00 
  80225e:	b8 00 00 00 00       	mov    $0x0,%eax
  802263:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  80226a:	00 00 00 
  80226d:	41 ff d0             	callq  *%r8
  802270:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802275:	bf 00 00 00 00       	mov    $0x0,%edi
  80227a:	48 b8 58 1d 80 00 00 	movabs $0x801d58,%rax
  802281:	00 00 00 
  802284:	ff d0                	callq  *%rax
  802286:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802289:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80228d:	79 30                	jns    8022bf <pgfault+0x21d>
  80228f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802292:	89 c1                	mov    %eax,%ecx
  802294:	48 ba 0f 53 80 00 00 	movabs $0x80530f,%rdx
  80229b:	00 00 00 
  80229e:	be 39 00 00 00       	mov    $0x39,%esi
  8022a3:	48 bf b1 52 80 00 00 	movabs $0x8052b1,%rdi
  8022aa:	00 00 00 
  8022ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8022b2:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  8022b9:	00 00 00 
  8022bc:	41 ff d0             	callq  *%r8
  8022bf:	90                   	nop
  8022c0:	c9                   	leaveq 
  8022c1:	c3                   	retq   

00000000008022c2 <duppage>:
  8022c2:	55                   	push   %rbp
  8022c3:	48 89 e5             	mov    %rsp,%rbp
  8022c6:	48 83 ec 30          	sub    $0x30,%rsp
  8022ca:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8022cd:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8022d0:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8022d3:	c1 e0 0c             	shl    $0xc,%eax
  8022d6:	89 c0                	mov    %eax,%eax
  8022d8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8022dc:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022e3:	01 00 00 
  8022e6:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8022e9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022ed:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8022f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022f5:	25 02 08 00 00       	and    $0x802,%eax
  8022fa:	48 85 c0             	test   %rax,%rax
  8022fd:	74 0e                	je     80230d <duppage+0x4b>
  8022ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802303:	25 00 04 00 00       	and    $0x400,%eax
  802308:	48 85 c0             	test   %rax,%rax
  80230b:	74 70                	je     80237d <duppage+0xbb>
  80230d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802311:	25 07 0e 00 00       	and    $0xe07,%eax
  802316:	89 c6                	mov    %eax,%esi
  802318:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  80231c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80231f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802323:	41 89 f0             	mov    %esi,%r8d
  802326:	48 89 c6             	mov    %rax,%rsi
  802329:	bf 00 00 00 00       	mov    $0x0,%edi
  80232e:	48 b8 f8 1c 80 00 00 	movabs $0x801cf8,%rax
  802335:	00 00 00 
  802338:	ff d0                	callq  *%rax
  80233a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80233d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802341:	79 30                	jns    802373 <duppage+0xb1>
  802343:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802346:	89 c1                	mov    %eax,%ecx
  802348:	48 ba fe 52 80 00 00 	movabs $0x8052fe,%rdx
  80234f:	00 00 00 
  802352:	be 63 00 00 00       	mov    $0x63,%esi
  802357:	48 bf b1 52 80 00 00 	movabs $0x8052b1,%rdi
  80235e:	00 00 00 
  802361:	b8 00 00 00 00       	mov    $0x0,%eax
  802366:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  80236d:	00 00 00 
  802370:	41 ff d0             	callq  *%r8
  802373:	b8 00 00 00 00       	mov    $0x0,%eax
  802378:	e9 c4 00 00 00       	jmpq   802441 <duppage+0x17f>
  80237d:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802381:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802384:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802388:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  80238e:	48 89 c6             	mov    %rax,%rsi
  802391:	bf 00 00 00 00       	mov    $0x0,%edi
  802396:	48 b8 f8 1c 80 00 00 	movabs $0x801cf8,%rax
  80239d:	00 00 00 
  8023a0:	ff d0                	callq  *%rax
  8023a2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8023a5:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8023a9:	79 30                	jns    8023db <duppage+0x119>
  8023ab:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8023ae:	89 c1                	mov    %eax,%ecx
  8023b0:	48 ba fe 52 80 00 00 	movabs $0x8052fe,%rdx
  8023b7:	00 00 00 
  8023ba:	be 7e 00 00 00       	mov    $0x7e,%esi
  8023bf:	48 bf b1 52 80 00 00 	movabs $0x8052b1,%rdi
  8023c6:	00 00 00 
  8023c9:	b8 00 00 00 00       	mov    $0x0,%eax
  8023ce:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  8023d5:	00 00 00 
  8023d8:	41 ff d0             	callq  *%r8
  8023db:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8023df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023e3:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8023e9:	48 89 d1             	mov    %rdx,%rcx
  8023ec:	ba 00 00 00 00       	mov    $0x0,%edx
  8023f1:	48 89 c6             	mov    %rax,%rsi
  8023f4:	bf 00 00 00 00       	mov    $0x0,%edi
  8023f9:	48 b8 f8 1c 80 00 00 	movabs $0x801cf8,%rax
  802400:	00 00 00 
  802403:	ff d0                	callq  *%rax
  802405:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802408:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80240c:	79 30                	jns    80243e <duppage+0x17c>
  80240e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802411:	89 c1                	mov    %eax,%ecx
  802413:	48 ba fe 52 80 00 00 	movabs $0x8052fe,%rdx
  80241a:	00 00 00 
  80241d:	be 80 00 00 00       	mov    $0x80,%esi
  802422:	48 bf b1 52 80 00 00 	movabs $0x8052b1,%rdi
  802429:	00 00 00 
  80242c:	b8 00 00 00 00       	mov    $0x0,%eax
  802431:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  802438:	00 00 00 
  80243b:	41 ff d0             	callq  *%r8
  80243e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802441:	c9                   	leaveq 
  802442:	c3                   	retq   

0000000000802443 <fork>:
  802443:	55                   	push   %rbp
  802444:	48 89 e5             	mov    %rsp,%rbp
  802447:	48 83 ec 20          	sub    $0x20,%rsp
  80244b:	48 bf a2 20 80 00 00 	movabs $0x8020a2,%rdi
  802452:	00 00 00 
  802455:	48 b8 fe 47 80 00 00 	movabs $0x8047fe,%rax
  80245c:	00 00 00 
  80245f:	ff d0                	callq  *%rax
  802461:	b8 07 00 00 00       	mov    $0x7,%eax
  802466:	cd 30                	int    $0x30
  802468:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80246b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80246e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802471:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802475:	79 08                	jns    80247f <fork+0x3c>
  802477:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80247a:	e9 0b 02 00 00       	jmpq   80268a <fork+0x247>
  80247f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802483:	75 3e                	jne    8024c3 <fork+0x80>
  802485:	48 b8 2d 1c 80 00 00 	movabs $0x801c2d,%rax
  80248c:	00 00 00 
  80248f:	ff d0                	callq  *%rax
  802491:	25 ff 03 00 00       	and    $0x3ff,%eax
  802496:	48 98                	cltq   
  802498:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80249f:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8024a6:	00 00 00 
  8024a9:	48 01 c2             	add    %rax,%rdx
  8024ac:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8024b3:	00 00 00 
  8024b6:	48 89 10             	mov    %rdx,(%rax)
  8024b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8024be:	e9 c7 01 00 00       	jmpq   80268a <fork+0x247>
  8024c3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8024ca:	e9 a6 00 00 00       	jmpq   802575 <fork+0x132>
  8024cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024d2:	c1 f8 12             	sar    $0x12,%eax
  8024d5:	89 c2                	mov    %eax,%edx
  8024d7:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  8024de:	01 00 00 
  8024e1:	48 63 d2             	movslq %edx,%rdx
  8024e4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8024e8:	83 e0 01             	and    $0x1,%eax
  8024eb:	48 85 c0             	test   %rax,%rax
  8024ee:	74 21                	je     802511 <fork+0xce>
  8024f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024f3:	c1 f8 09             	sar    $0x9,%eax
  8024f6:	89 c2                	mov    %eax,%edx
  8024f8:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8024ff:	01 00 00 
  802502:	48 63 d2             	movslq %edx,%rdx
  802505:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802509:	83 e0 01             	and    $0x1,%eax
  80250c:	48 85 c0             	test   %rax,%rax
  80250f:	75 09                	jne    80251a <fork+0xd7>
  802511:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  802518:	eb 5b                	jmp    802575 <fork+0x132>
  80251a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80251d:	05 00 02 00 00       	add    $0x200,%eax
  802522:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802525:	eb 46                	jmp    80256d <fork+0x12a>
  802527:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80252e:	01 00 00 
  802531:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802534:	48 63 d2             	movslq %edx,%rdx
  802537:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80253b:	83 e0 05             	and    $0x5,%eax
  80253e:	48 83 f8 05          	cmp    $0x5,%rax
  802542:	75 21                	jne    802565 <fork+0x122>
  802544:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  80254b:	74 1b                	je     802568 <fork+0x125>
  80254d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802550:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802553:	89 d6                	mov    %edx,%esi
  802555:	89 c7                	mov    %eax,%edi
  802557:	48 b8 c2 22 80 00 00 	movabs $0x8022c2,%rax
  80255e:	00 00 00 
  802561:	ff d0                	callq  *%rax
  802563:	eb 04                	jmp    802569 <fork+0x126>
  802565:	90                   	nop
  802566:	eb 01                	jmp    802569 <fork+0x126>
  802568:	90                   	nop
  802569:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80256d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802570:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  802573:	7c b2                	jl     802527 <fork+0xe4>
  802575:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802578:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  80257d:	0f 86 4c ff ff ff    	jbe    8024cf <fork+0x8c>
  802583:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802586:	ba 07 00 00 00       	mov    $0x7,%edx
  80258b:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  802590:	89 c7                	mov    %eax,%edi
  802592:	48 b8 a6 1c 80 00 00 	movabs $0x801ca6,%rax
  802599:	00 00 00 
  80259c:	ff d0                	callq  *%rax
  80259e:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8025a1:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8025a5:	79 30                	jns    8025d7 <fork+0x194>
  8025a7:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8025aa:	89 c1                	mov    %eax,%ecx
  8025ac:	48 ba 28 53 80 00 00 	movabs $0x805328,%rdx
  8025b3:	00 00 00 
  8025b6:	be bc 00 00 00       	mov    $0xbc,%esi
  8025bb:	48 bf b1 52 80 00 00 	movabs $0x8052b1,%rdi
  8025c2:	00 00 00 
  8025c5:	b8 00 00 00 00       	mov    $0x0,%eax
  8025ca:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  8025d1:	00 00 00 
  8025d4:	41 ff d0             	callq  *%r8
  8025d7:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8025de:	00 00 00 
  8025e1:	48 8b 00             	mov    (%rax),%rax
  8025e4:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  8025eb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8025ee:	48 89 d6             	mov    %rdx,%rsi
  8025f1:	89 c7                	mov    %eax,%edi
  8025f3:	48 b8 3d 1e 80 00 00 	movabs $0x801e3d,%rax
  8025fa:	00 00 00 
  8025fd:	ff d0                	callq  *%rax
  8025ff:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802602:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802606:	79 30                	jns    802638 <fork+0x1f5>
  802608:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80260b:	89 c1                	mov    %eax,%ecx
  80260d:	48 ba 48 53 80 00 00 	movabs $0x805348,%rdx
  802614:	00 00 00 
  802617:	be c0 00 00 00       	mov    $0xc0,%esi
  80261c:	48 bf b1 52 80 00 00 	movabs $0x8052b1,%rdi
  802623:	00 00 00 
  802626:	b8 00 00 00 00       	mov    $0x0,%eax
  80262b:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  802632:	00 00 00 
  802635:	41 ff d0             	callq  *%r8
  802638:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80263b:	be 02 00 00 00       	mov    $0x2,%esi
  802640:	89 c7                	mov    %eax,%edi
  802642:	48 b8 a4 1d 80 00 00 	movabs $0x801da4,%rax
  802649:	00 00 00 
  80264c:	ff d0                	callq  *%rax
  80264e:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802651:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802655:	79 30                	jns    802687 <fork+0x244>
  802657:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80265a:	89 c1                	mov    %eax,%ecx
  80265c:	48 ba 67 53 80 00 00 	movabs $0x805367,%rdx
  802663:	00 00 00 
  802666:	be c5 00 00 00       	mov    $0xc5,%esi
  80266b:	48 bf b1 52 80 00 00 	movabs $0x8052b1,%rdi
  802672:	00 00 00 
  802675:	b8 00 00 00 00       	mov    $0x0,%eax
  80267a:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  802681:	00 00 00 
  802684:	41 ff d0             	callq  *%r8
  802687:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80268a:	c9                   	leaveq 
  80268b:	c3                   	retq   

000000000080268c <sfork>:
  80268c:	55                   	push   %rbp
  80268d:	48 89 e5             	mov    %rsp,%rbp
  802690:	48 ba 7e 53 80 00 00 	movabs $0x80537e,%rdx
  802697:	00 00 00 
  80269a:	be d2 00 00 00       	mov    $0xd2,%esi
  80269f:	48 bf b1 52 80 00 00 	movabs $0x8052b1,%rdi
  8026a6:	00 00 00 
  8026a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8026ae:	48 b9 ac 05 80 00 00 	movabs $0x8005ac,%rcx
  8026b5:	00 00 00 
  8026b8:	ff d1                	callq  *%rcx

00000000008026ba <fd2num>:
  8026ba:	55                   	push   %rbp
  8026bb:	48 89 e5             	mov    %rsp,%rbp
  8026be:	48 83 ec 08          	sub    $0x8,%rsp
  8026c2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8026c6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8026ca:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  8026d1:	ff ff ff 
  8026d4:	48 01 d0             	add    %rdx,%rax
  8026d7:	48 c1 e8 0c          	shr    $0xc,%rax
  8026db:	c9                   	leaveq 
  8026dc:	c3                   	retq   

00000000008026dd <fd2data>:
  8026dd:	55                   	push   %rbp
  8026de:	48 89 e5             	mov    %rsp,%rbp
  8026e1:	48 83 ec 08          	sub    $0x8,%rsp
  8026e5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8026e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8026ed:	48 89 c7             	mov    %rax,%rdi
  8026f0:	48 b8 ba 26 80 00 00 	movabs $0x8026ba,%rax
  8026f7:	00 00 00 
  8026fa:	ff d0                	callq  *%rax
  8026fc:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802702:	48 c1 e0 0c          	shl    $0xc,%rax
  802706:	c9                   	leaveq 
  802707:	c3                   	retq   

0000000000802708 <fd_alloc>:
  802708:	55                   	push   %rbp
  802709:	48 89 e5             	mov    %rsp,%rbp
  80270c:	48 83 ec 18          	sub    $0x18,%rsp
  802710:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802714:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80271b:	eb 6b                	jmp    802788 <fd_alloc+0x80>
  80271d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802720:	48 98                	cltq   
  802722:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802728:	48 c1 e0 0c          	shl    $0xc,%rax
  80272c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802730:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802734:	48 c1 e8 15          	shr    $0x15,%rax
  802738:	48 89 c2             	mov    %rax,%rdx
  80273b:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802742:	01 00 00 
  802745:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802749:	83 e0 01             	and    $0x1,%eax
  80274c:	48 85 c0             	test   %rax,%rax
  80274f:	74 21                	je     802772 <fd_alloc+0x6a>
  802751:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802755:	48 c1 e8 0c          	shr    $0xc,%rax
  802759:	48 89 c2             	mov    %rax,%rdx
  80275c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802763:	01 00 00 
  802766:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80276a:	83 e0 01             	and    $0x1,%eax
  80276d:	48 85 c0             	test   %rax,%rax
  802770:	75 12                	jne    802784 <fd_alloc+0x7c>
  802772:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802776:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80277a:	48 89 10             	mov    %rdx,(%rax)
  80277d:	b8 00 00 00 00       	mov    $0x0,%eax
  802782:	eb 1a                	jmp    80279e <fd_alloc+0x96>
  802784:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802788:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80278c:	7e 8f                	jle    80271d <fd_alloc+0x15>
  80278e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802792:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802799:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  80279e:	c9                   	leaveq 
  80279f:	c3                   	retq   

00000000008027a0 <fd_lookup>:
  8027a0:	55                   	push   %rbp
  8027a1:	48 89 e5             	mov    %rsp,%rbp
  8027a4:	48 83 ec 20          	sub    $0x20,%rsp
  8027a8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8027ab:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8027af:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8027b3:	78 06                	js     8027bb <fd_lookup+0x1b>
  8027b5:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8027b9:	7e 07                	jle    8027c2 <fd_lookup+0x22>
  8027bb:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8027c0:	eb 6c                	jmp    80282e <fd_lookup+0x8e>
  8027c2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8027c5:	48 98                	cltq   
  8027c7:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8027cd:	48 c1 e0 0c          	shl    $0xc,%rax
  8027d1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8027d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8027d9:	48 c1 e8 15          	shr    $0x15,%rax
  8027dd:	48 89 c2             	mov    %rax,%rdx
  8027e0:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8027e7:	01 00 00 
  8027ea:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8027ee:	83 e0 01             	and    $0x1,%eax
  8027f1:	48 85 c0             	test   %rax,%rax
  8027f4:	74 21                	je     802817 <fd_lookup+0x77>
  8027f6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8027fa:	48 c1 e8 0c          	shr    $0xc,%rax
  8027fe:	48 89 c2             	mov    %rax,%rdx
  802801:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802808:	01 00 00 
  80280b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80280f:	83 e0 01             	and    $0x1,%eax
  802812:	48 85 c0             	test   %rax,%rax
  802815:	75 07                	jne    80281e <fd_lookup+0x7e>
  802817:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80281c:	eb 10                	jmp    80282e <fd_lookup+0x8e>
  80281e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802822:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802826:	48 89 10             	mov    %rdx,(%rax)
  802829:	b8 00 00 00 00       	mov    $0x0,%eax
  80282e:	c9                   	leaveq 
  80282f:	c3                   	retq   

0000000000802830 <fd_close>:
  802830:	55                   	push   %rbp
  802831:	48 89 e5             	mov    %rsp,%rbp
  802834:	48 83 ec 30          	sub    $0x30,%rsp
  802838:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80283c:	89 f0                	mov    %esi,%eax
  80283e:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802841:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802845:	48 89 c7             	mov    %rax,%rdi
  802848:	48 b8 ba 26 80 00 00 	movabs $0x8026ba,%rax
  80284f:	00 00 00 
  802852:	ff d0                	callq  *%rax
  802854:	89 c2                	mov    %eax,%edx
  802856:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80285a:	48 89 c6             	mov    %rax,%rsi
  80285d:	89 d7                	mov    %edx,%edi
  80285f:	48 b8 a0 27 80 00 00 	movabs $0x8027a0,%rax
  802866:	00 00 00 
  802869:	ff d0                	callq  *%rax
  80286b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80286e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802872:	78 0a                	js     80287e <fd_close+0x4e>
  802874:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802878:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  80287c:	74 12                	je     802890 <fd_close+0x60>
  80287e:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802882:	74 05                	je     802889 <fd_close+0x59>
  802884:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802887:	eb 70                	jmp    8028f9 <fd_close+0xc9>
  802889:	b8 00 00 00 00       	mov    $0x0,%eax
  80288e:	eb 69                	jmp    8028f9 <fd_close+0xc9>
  802890:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802894:	8b 00                	mov    (%rax),%eax
  802896:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80289a:	48 89 d6             	mov    %rdx,%rsi
  80289d:	89 c7                	mov    %eax,%edi
  80289f:	48 b8 fb 28 80 00 00 	movabs $0x8028fb,%rax
  8028a6:	00 00 00 
  8028a9:	ff d0                	callq  *%rax
  8028ab:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028ae:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028b2:	78 2a                	js     8028de <fd_close+0xae>
  8028b4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028b8:	48 8b 40 20          	mov    0x20(%rax),%rax
  8028bc:	48 85 c0             	test   %rax,%rax
  8028bf:	74 16                	je     8028d7 <fd_close+0xa7>
  8028c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028c5:	48 8b 40 20          	mov    0x20(%rax),%rax
  8028c9:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8028cd:	48 89 d7             	mov    %rdx,%rdi
  8028d0:	ff d0                	callq  *%rax
  8028d2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028d5:	eb 07                	jmp    8028de <fd_close+0xae>
  8028d7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8028de:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028e2:	48 89 c6             	mov    %rax,%rsi
  8028e5:	bf 00 00 00 00       	mov    $0x0,%edi
  8028ea:	48 b8 58 1d 80 00 00 	movabs $0x801d58,%rax
  8028f1:	00 00 00 
  8028f4:	ff d0                	callq  *%rax
  8028f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028f9:	c9                   	leaveq 
  8028fa:	c3                   	retq   

00000000008028fb <dev_lookup>:
  8028fb:	55                   	push   %rbp
  8028fc:	48 89 e5             	mov    %rsp,%rbp
  8028ff:	48 83 ec 20          	sub    $0x20,%rsp
  802903:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802906:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80290a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802911:	eb 41                	jmp    802954 <dev_lookup+0x59>
  802913:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80291a:	00 00 00 
  80291d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802920:	48 63 d2             	movslq %edx,%rdx
  802923:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802927:	8b 00                	mov    (%rax),%eax
  802929:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80292c:	75 22                	jne    802950 <dev_lookup+0x55>
  80292e:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802935:	00 00 00 
  802938:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80293b:	48 63 d2             	movslq %edx,%rdx
  80293e:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802942:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802946:	48 89 10             	mov    %rdx,(%rax)
  802949:	b8 00 00 00 00       	mov    $0x0,%eax
  80294e:	eb 60                	jmp    8029b0 <dev_lookup+0xb5>
  802950:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802954:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80295b:	00 00 00 
  80295e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802961:	48 63 d2             	movslq %edx,%rdx
  802964:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802968:	48 85 c0             	test   %rax,%rax
  80296b:	75 a6                	jne    802913 <dev_lookup+0x18>
  80296d:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802974:	00 00 00 
  802977:	48 8b 00             	mov    (%rax),%rax
  80297a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802980:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802983:	89 c6                	mov    %eax,%esi
  802985:	48 bf 98 53 80 00 00 	movabs $0x805398,%rdi
  80298c:	00 00 00 
  80298f:	b8 00 00 00 00       	mov    $0x0,%eax
  802994:	48 b9 e6 07 80 00 00 	movabs $0x8007e6,%rcx
  80299b:	00 00 00 
  80299e:	ff d1                	callq  *%rcx
  8029a0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029a4:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8029ab:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8029b0:	c9                   	leaveq 
  8029b1:	c3                   	retq   

00000000008029b2 <close>:
  8029b2:	55                   	push   %rbp
  8029b3:	48 89 e5             	mov    %rsp,%rbp
  8029b6:	48 83 ec 20          	sub    $0x20,%rsp
  8029ba:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8029bd:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8029c1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8029c4:	48 89 d6             	mov    %rdx,%rsi
  8029c7:	89 c7                	mov    %eax,%edi
  8029c9:	48 b8 a0 27 80 00 00 	movabs $0x8027a0,%rax
  8029d0:	00 00 00 
  8029d3:	ff d0                	callq  *%rax
  8029d5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029d8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029dc:	79 05                	jns    8029e3 <close+0x31>
  8029de:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029e1:	eb 18                	jmp    8029fb <close+0x49>
  8029e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029e7:	be 01 00 00 00       	mov    $0x1,%esi
  8029ec:	48 89 c7             	mov    %rax,%rdi
  8029ef:	48 b8 30 28 80 00 00 	movabs $0x802830,%rax
  8029f6:	00 00 00 
  8029f9:	ff d0                	callq  *%rax
  8029fb:	c9                   	leaveq 
  8029fc:	c3                   	retq   

00000000008029fd <close_all>:
  8029fd:	55                   	push   %rbp
  8029fe:	48 89 e5             	mov    %rsp,%rbp
  802a01:	48 83 ec 10          	sub    $0x10,%rsp
  802a05:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a0c:	eb 15                	jmp    802a23 <close_all+0x26>
  802a0e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a11:	89 c7                	mov    %eax,%edi
  802a13:	48 b8 b2 29 80 00 00 	movabs $0x8029b2,%rax
  802a1a:	00 00 00 
  802a1d:	ff d0                	callq  *%rax
  802a1f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802a23:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802a27:	7e e5                	jle    802a0e <close_all+0x11>
  802a29:	90                   	nop
  802a2a:	c9                   	leaveq 
  802a2b:	c3                   	retq   

0000000000802a2c <dup>:
  802a2c:	55                   	push   %rbp
  802a2d:	48 89 e5             	mov    %rsp,%rbp
  802a30:	48 83 ec 40          	sub    $0x40,%rsp
  802a34:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802a37:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802a3a:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802a3e:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802a41:	48 89 d6             	mov    %rdx,%rsi
  802a44:	89 c7                	mov    %eax,%edi
  802a46:	48 b8 a0 27 80 00 00 	movabs $0x8027a0,%rax
  802a4d:	00 00 00 
  802a50:	ff d0                	callq  *%rax
  802a52:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a55:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a59:	79 08                	jns    802a63 <dup+0x37>
  802a5b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a5e:	e9 70 01 00 00       	jmpq   802bd3 <dup+0x1a7>
  802a63:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802a66:	89 c7                	mov    %eax,%edi
  802a68:	48 b8 b2 29 80 00 00 	movabs $0x8029b2,%rax
  802a6f:	00 00 00 
  802a72:	ff d0                	callq  *%rax
  802a74:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802a77:	48 98                	cltq   
  802a79:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802a7f:	48 c1 e0 0c          	shl    $0xc,%rax
  802a83:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802a87:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a8b:	48 89 c7             	mov    %rax,%rdi
  802a8e:	48 b8 dd 26 80 00 00 	movabs $0x8026dd,%rax
  802a95:	00 00 00 
  802a98:	ff d0                	callq  *%rax
  802a9a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802a9e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802aa2:	48 89 c7             	mov    %rax,%rdi
  802aa5:	48 b8 dd 26 80 00 00 	movabs $0x8026dd,%rax
  802aac:	00 00 00 
  802aaf:	ff d0                	callq  *%rax
  802ab1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802ab5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ab9:	48 c1 e8 15          	shr    $0x15,%rax
  802abd:	48 89 c2             	mov    %rax,%rdx
  802ac0:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802ac7:	01 00 00 
  802aca:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ace:	83 e0 01             	and    $0x1,%eax
  802ad1:	48 85 c0             	test   %rax,%rax
  802ad4:	74 71                	je     802b47 <dup+0x11b>
  802ad6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ada:	48 c1 e8 0c          	shr    $0xc,%rax
  802ade:	48 89 c2             	mov    %rax,%rdx
  802ae1:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802ae8:	01 00 00 
  802aeb:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802aef:	83 e0 01             	and    $0x1,%eax
  802af2:	48 85 c0             	test   %rax,%rax
  802af5:	74 50                	je     802b47 <dup+0x11b>
  802af7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802afb:	48 c1 e8 0c          	shr    $0xc,%rax
  802aff:	48 89 c2             	mov    %rax,%rdx
  802b02:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b09:	01 00 00 
  802b0c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b10:	25 07 0e 00 00       	and    $0xe07,%eax
  802b15:	89 c1                	mov    %eax,%ecx
  802b17:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802b1b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b1f:	41 89 c8             	mov    %ecx,%r8d
  802b22:	48 89 d1             	mov    %rdx,%rcx
  802b25:	ba 00 00 00 00       	mov    $0x0,%edx
  802b2a:	48 89 c6             	mov    %rax,%rsi
  802b2d:	bf 00 00 00 00       	mov    $0x0,%edi
  802b32:	48 b8 f8 1c 80 00 00 	movabs $0x801cf8,%rax
  802b39:	00 00 00 
  802b3c:	ff d0                	callq  *%rax
  802b3e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b41:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b45:	78 55                	js     802b9c <dup+0x170>
  802b47:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b4b:	48 c1 e8 0c          	shr    $0xc,%rax
  802b4f:	48 89 c2             	mov    %rax,%rdx
  802b52:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b59:	01 00 00 
  802b5c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b60:	25 07 0e 00 00       	and    $0xe07,%eax
  802b65:	89 c1                	mov    %eax,%ecx
  802b67:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b6b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802b6f:	41 89 c8             	mov    %ecx,%r8d
  802b72:	48 89 d1             	mov    %rdx,%rcx
  802b75:	ba 00 00 00 00       	mov    $0x0,%edx
  802b7a:	48 89 c6             	mov    %rax,%rsi
  802b7d:	bf 00 00 00 00       	mov    $0x0,%edi
  802b82:	48 b8 f8 1c 80 00 00 	movabs $0x801cf8,%rax
  802b89:	00 00 00 
  802b8c:	ff d0                	callq  *%rax
  802b8e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b91:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b95:	78 08                	js     802b9f <dup+0x173>
  802b97:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802b9a:	eb 37                	jmp    802bd3 <dup+0x1a7>
  802b9c:	90                   	nop
  802b9d:	eb 01                	jmp    802ba0 <dup+0x174>
  802b9f:	90                   	nop
  802ba0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ba4:	48 89 c6             	mov    %rax,%rsi
  802ba7:	bf 00 00 00 00       	mov    $0x0,%edi
  802bac:	48 b8 58 1d 80 00 00 	movabs $0x801d58,%rax
  802bb3:	00 00 00 
  802bb6:	ff d0                	callq  *%rax
  802bb8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802bbc:	48 89 c6             	mov    %rax,%rsi
  802bbf:	bf 00 00 00 00       	mov    $0x0,%edi
  802bc4:	48 b8 58 1d 80 00 00 	movabs $0x801d58,%rax
  802bcb:	00 00 00 
  802bce:	ff d0                	callq  *%rax
  802bd0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bd3:	c9                   	leaveq 
  802bd4:	c3                   	retq   

0000000000802bd5 <read>:
  802bd5:	55                   	push   %rbp
  802bd6:	48 89 e5             	mov    %rsp,%rbp
  802bd9:	48 83 ec 40          	sub    $0x40,%rsp
  802bdd:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802be0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802be4:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802be8:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802bec:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802bef:	48 89 d6             	mov    %rdx,%rsi
  802bf2:	89 c7                	mov    %eax,%edi
  802bf4:	48 b8 a0 27 80 00 00 	movabs $0x8027a0,%rax
  802bfb:	00 00 00 
  802bfe:	ff d0                	callq  *%rax
  802c00:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c03:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c07:	78 24                	js     802c2d <read+0x58>
  802c09:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c0d:	8b 00                	mov    (%rax),%eax
  802c0f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c13:	48 89 d6             	mov    %rdx,%rsi
  802c16:	89 c7                	mov    %eax,%edi
  802c18:	48 b8 fb 28 80 00 00 	movabs $0x8028fb,%rax
  802c1f:	00 00 00 
  802c22:	ff d0                	callq  *%rax
  802c24:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c27:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c2b:	79 05                	jns    802c32 <read+0x5d>
  802c2d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c30:	eb 76                	jmp    802ca8 <read+0xd3>
  802c32:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c36:	8b 40 08             	mov    0x8(%rax),%eax
  802c39:	83 e0 03             	and    $0x3,%eax
  802c3c:	83 f8 01             	cmp    $0x1,%eax
  802c3f:	75 3a                	jne    802c7b <read+0xa6>
  802c41:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802c48:	00 00 00 
  802c4b:	48 8b 00             	mov    (%rax),%rax
  802c4e:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802c54:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802c57:	89 c6                	mov    %eax,%esi
  802c59:	48 bf b7 53 80 00 00 	movabs $0x8053b7,%rdi
  802c60:	00 00 00 
  802c63:	b8 00 00 00 00       	mov    $0x0,%eax
  802c68:	48 b9 e6 07 80 00 00 	movabs $0x8007e6,%rcx
  802c6f:	00 00 00 
  802c72:	ff d1                	callq  *%rcx
  802c74:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802c79:	eb 2d                	jmp    802ca8 <read+0xd3>
  802c7b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c7f:	48 8b 40 10          	mov    0x10(%rax),%rax
  802c83:	48 85 c0             	test   %rax,%rax
  802c86:	75 07                	jne    802c8f <read+0xba>
  802c88:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802c8d:	eb 19                	jmp    802ca8 <read+0xd3>
  802c8f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c93:	48 8b 40 10          	mov    0x10(%rax),%rax
  802c97:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802c9b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802c9f:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802ca3:	48 89 cf             	mov    %rcx,%rdi
  802ca6:	ff d0                	callq  *%rax
  802ca8:	c9                   	leaveq 
  802ca9:	c3                   	retq   

0000000000802caa <readn>:
  802caa:	55                   	push   %rbp
  802cab:	48 89 e5             	mov    %rsp,%rbp
  802cae:	48 83 ec 30          	sub    $0x30,%rsp
  802cb2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802cb5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802cb9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802cbd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802cc4:	eb 47                	jmp    802d0d <readn+0x63>
  802cc6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cc9:	48 98                	cltq   
  802ccb:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802ccf:	48 29 c2             	sub    %rax,%rdx
  802cd2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cd5:	48 63 c8             	movslq %eax,%rcx
  802cd8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802cdc:	48 01 c1             	add    %rax,%rcx
  802cdf:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ce2:	48 89 ce             	mov    %rcx,%rsi
  802ce5:	89 c7                	mov    %eax,%edi
  802ce7:	48 b8 d5 2b 80 00 00 	movabs $0x802bd5,%rax
  802cee:	00 00 00 
  802cf1:	ff d0                	callq  *%rax
  802cf3:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802cf6:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802cfa:	79 05                	jns    802d01 <readn+0x57>
  802cfc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802cff:	eb 1d                	jmp    802d1e <readn+0x74>
  802d01:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802d05:	74 13                	je     802d1a <readn+0x70>
  802d07:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d0a:	01 45 fc             	add    %eax,-0x4(%rbp)
  802d0d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d10:	48 98                	cltq   
  802d12:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802d16:	72 ae                	jb     802cc6 <readn+0x1c>
  802d18:	eb 01                	jmp    802d1b <readn+0x71>
  802d1a:	90                   	nop
  802d1b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d1e:	c9                   	leaveq 
  802d1f:	c3                   	retq   

0000000000802d20 <write>:
  802d20:	55                   	push   %rbp
  802d21:	48 89 e5             	mov    %rsp,%rbp
  802d24:	48 83 ec 40          	sub    $0x40,%rsp
  802d28:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802d2b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802d2f:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802d33:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802d37:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802d3a:	48 89 d6             	mov    %rdx,%rsi
  802d3d:	89 c7                	mov    %eax,%edi
  802d3f:	48 b8 a0 27 80 00 00 	movabs $0x8027a0,%rax
  802d46:	00 00 00 
  802d49:	ff d0                	callq  *%rax
  802d4b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d4e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d52:	78 24                	js     802d78 <write+0x58>
  802d54:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d58:	8b 00                	mov    (%rax),%eax
  802d5a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d5e:	48 89 d6             	mov    %rdx,%rsi
  802d61:	89 c7                	mov    %eax,%edi
  802d63:	48 b8 fb 28 80 00 00 	movabs $0x8028fb,%rax
  802d6a:	00 00 00 
  802d6d:	ff d0                	callq  *%rax
  802d6f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d72:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d76:	79 05                	jns    802d7d <write+0x5d>
  802d78:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d7b:	eb 75                	jmp    802df2 <write+0xd2>
  802d7d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d81:	8b 40 08             	mov    0x8(%rax),%eax
  802d84:	83 e0 03             	and    $0x3,%eax
  802d87:	85 c0                	test   %eax,%eax
  802d89:	75 3a                	jne    802dc5 <write+0xa5>
  802d8b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802d92:	00 00 00 
  802d95:	48 8b 00             	mov    (%rax),%rax
  802d98:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802d9e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802da1:	89 c6                	mov    %eax,%esi
  802da3:	48 bf d3 53 80 00 00 	movabs $0x8053d3,%rdi
  802daa:	00 00 00 
  802dad:	b8 00 00 00 00       	mov    $0x0,%eax
  802db2:	48 b9 e6 07 80 00 00 	movabs $0x8007e6,%rcx
  802db9:	00 00 00 
  802dbc:	ff d1                	callq  *%rcx
  802dbe:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802dc3:	eb 2d                	jmp    802df2 <write+0xd2>
  802dc5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802dc9:	48 8b 40 18          	mov    0x18(%rax),%rax
  802dcd:	48 85 c0             	test   %rax,%rax
  802dd0:	75 07                	jne    802dd9 <write+0xb9>
  802dd2:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802dd7:	eb 19                	jmp    802df2 <write+0xd2>
  802dd9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ddd:	48 8b 40 18          	mov    0x18(%rax),%rax
  802de1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802de5:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802de9:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802ded:	48 89 cf             	mov    %rcx,%rdi
  802df0:	ff d0                	callq  *%rax
  802df2:	c9                   	leaveq 
  802df3:	c3                   	retq   

0000000000802df4 <seek>:
  802df4:	55                   	push   %rbp
  802df5:	48 89 e5             	mov    %rsp,%rbp
  802df8:	48 83 ec 18          	sub    $0x18,%rsp
  802dfc:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802dff:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802e02:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e06:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e09:	48 89 d6             	mov    %rdx,%rsi
  802e0c:	89 c7                	mov    %eax,%edi
  802e0e:	48 b8 a0 27 80 00 00 	movabs $0x8027a0,%rax
  802e15:	00 00 00 
  802e18:	ff d0                	callq  *%rax
  802e1a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e1d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e21:	79 05                	jns    802e28 <seek+0x34>
  802e23:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e26:	eb 0f                	jmp    802e37 <seek+0x43>
  802e28:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e2c:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802e2f:	89 50 04             	mov    %edx,0x4(%rax)
  802e32:	b8 00 00 00 00       	mov    $0x0,%eax
  802e37:	c9                   	leaveq 
  802e38:	c3                   	retq   

0000000000802e39 <ftruncate>:
  802e39:	55                   	push   %rbp
  802e3a:	48 89 e5             	mov    %rsp,%rbp
  802e3d:	48 83 ec 30          	sub    $0x30,%rsp
  802e41:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802e44:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802e47:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802e4b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802e4e:	48 89 d6             	mov    %rdx,%rsi
  802e51:	89 c7                	mov    %eax,%edi
  802e53:	48 b8 a0 27 80 00 00 	movabs $0x8027a0,%rax
  802e5a:	00 00 00 
  802e5d:	ff d0                	callq  *%rax
  802e5f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e62:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e66:	78 24                	js     802e8c <ftruncate+0x53>
  802e68:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e6c:	8b 00                	mov    (%rax),%eax
  802e6e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e72:	48 89 d6             	mov    %rdx,%rsi
  802e75:	89 c7                	mov    %eax,%edi
  802e77:	48 b8 fb 28 80 00 00 	movabs $0x8028fb,%rax
  802e7e:	00 00 00 
  802e81:	ff d0                	callq  *%rax
  802e83:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e86:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e8a:	79 05                	jns    802e91 <ftruncate+0x58>
  802e8c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e8f:	eb 72                	jmp    802f03 <ftruncate+0xca>
  802e91:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e95:	8b 40 08             	mov    0x8(%rax),%eax
  802e98:	83 e0 03             	and    $0x3,%eax
  802e9b:	85 c0                	test   %eax,%eax
  802e9d:	75 3a                	jne    802ed9 <ftruncate+0xa0>
  802e9f:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802ea6:	00 00 00 
  802ea9:	48 8b 00             	mov    (%rax),%rax
  802eac:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802eb2:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802eb5:	89 c6                	mov    %eax,%esi
  802eb7:	48 bf f0 53 80 00 00 	movabs $0x8053f0,%rdi
  802ebe:	00 00 00 
  802ec1:	b8 00 00 00 00       	mov    $0x0,%eax
  802ec6:	48 b9 e6 07 80 00 00 	movabs $0x8007e6,%rcx
  802ecd:	00 00 00 
  802ed0:	ff d1                	callq  *%rcx
  802ed2:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802ed7:	eb 2a                	jmp    802f03 <ftruncate+0xca>
  802ed9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802edd:	48 8b 40 30          	mov    0x30(%rax),%rax
  802ee1:	48 85 c0             	test   %rax,%rax
  802ee4:	75 07                	jne    802eed <ftruncate+0xb4>
  802ee6:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802eeb:	eb 16                	jmp    802f03 <ftruncate+0xca>
  802eed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ef1:	48 8b 40 30          	mov    0x30(%rax),%rax
  802ef5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802ef9:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802efc:	89 ce                	mov    %ecx,%esi
  802efe:	48 89 d7             	mov    %rdx,%rdi
  802f01:	ff d0                	callq  *%rax
  802f03:	c9                   	leaveq 
  802f04:	c3                   	retq   

0000000000802f05 <fstat>:
  802f05:	55                   	push   %rbp
  802f06:	48 89 e5             	mov    %rsp,%rbp
  802f09:	48 83 ec 30          	sub    $0x30,%rsp
  802f0d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802f10:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802f14:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802f18:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802f1b:	48 89 d6             	mov    %rdx,%rsi
  802f1e:	89 c7                	mov    %eax,%edi
  802f20:	48 b8 a0 27 80 00 00 	movabs $0x8027a0,%rax
  802f27:	00 00 00 
  802f2a:	ff d0                	callq  *%rax
  802f2c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f2f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f33:	78 24                	js     802f59 <fstat+0x54>
  802f35:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f39:	8b 00                	mov    (%rax),%eax
  802f3b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802f3f:	48 89 d6             	mov    %rdx,%rsi
  802f42:	89 c7                	mov    %eax,%edi
  802f44:	48 b8 fb 28 80 00 00 	movabs $0x8028fb,%rax
  802f4b:	00 00 00 
  802f4e:	ff d0                	callq  *%rax
  802f50:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f53:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f57:	79 05                	jns    802f5e <fstat+0x59>
  802f59:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f5c:	eb 5e                	jmp    802fbc <fstat+0xb7>
  802f5e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f62:	48 8b 40 28          	mov    0x28(%rax),%rax
  802f66:	48 85 c0             	test   %rax,%rax
  802f69:	75 07                	jne    802f72 <fstat+0x6d>
  802f6b:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802f70:	eb 4a                	jmp    802fbc <fstat+0xb7>
  802f72:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802f76:	c6 00 00             	movb   $0x0,(%rax)
  802f79:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802f7d:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802f84:	00 00 00 
  802f87:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802f8b:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802f92:	00 00 00 
  802f95:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802f99:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802f9d:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802fa4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fa8:	48 8b 40 28          	mov    0x28(%rax),%rax
  802fac:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802fb0:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802fb4:	48 89 ce             	mov    %rcx,%rsi
  802fb7:	48 89 d7             	mov    %rdx,%rdi
  802fba:	ff d0                	callq  *%rax
  802fbc:	c9                   	leaveq 
  802fbd:	c3                   	retq   

0000000000802fbe <stat>:
  802fbe:	55                   	push   %rbp
  802fbf:	48 89 e5             	mov    %rsp,%rbp
  802fc2:	48 83 ec 20          	sub    $0x20,%rsp
  802fc6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802fca:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802fce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fd2:	be 00 00 00 00       	mov    $0x0,%esi
  802fd7:	48 89 c7             	mov    %rax,%rdi
  802fda:	48 b8 ae 30 80 00 00 	movabs $0x8030ae,%rax
  802fe1:	00 00 00 
  802fe4:	ff d0                	callq  *%rax
  802fe6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fe9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fed:	79 05                	jns    802ff4 <stat+0x36>
  802fef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ff2:	eb 2f                	jmp    803023 <stat+0x65>
  802ff4:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802ff8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ffb:	48 89 d6             	mov    %rdx,%rsi
  802ffe:	89 c7                	mov    %eax,%edi
  803000:	48 b8 05 2f 80 00 00 	movabs $0x802f05,%rax
  803007:	00 00 00 
  80300a:	ff d0                	callq  *%rax
  80300c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80300f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803012:	89 c7                	mov    %eax,%edi
  803014:	48 b8 b2 29 80 00 00 	movabs $0x8029b2,%rax
  80301b:	00 00 00 
  80301e:	ff d0                	callq  *%rax
  803020:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803023:	c9                   	leaveq 
  803024:	c3                   	retq   

0000000000803025 <fsipc>:
  803025:	55                   	push   %rbp
  803026:	48 89 e5             	mov    %rsp,%rbp
  803029:	48 83 ec 10          	sub    $0x10,%rsp
  80302d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803030:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803034:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80303b:	00 00 00 
  80303e:	8b 00                	mov    (%rax),%eax
  803040:	85 c0                	test   %eax,%eax
  803042:	75 1f                	jne    803063 <fsipc+0x3e>
  803044:	bf 01 00 00 00       	mov    $0x1,%edi
  803049:	48 b8 f2 4a 80 00 00 	movabs $0x804af2,%rax
  803050:	00 00 00 
  803053:	ff d0                	callq  *%rax
  803055:	89 c2                	mov    %eax,%edx
  803057:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80305e:	00 00 00 
  803061:	89 10                	mov    %edx,(%rax)
  803063:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80306a:	00 00 00 
  80306d:	8b 00                	mov    (%rax),%eax
  80306f:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803072:	b9 07 00 00 00       	mov    $0x7,%ecx
  803077:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  80307e:	00 00 00 
  803081:	89 c7                	mov    %eax,%edi
  803083:	48 b8 e8 49 80 00 00 	movabs $0x8049e8,%rax
  80308a:	00 00 00 
  80308d:	ff d0                	callq  *%rax
  80308f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803093:	ba 00 00 00 00       	mov    $0x0,%edx
  803098:	48 89 c6             	mov    %rax,%rsi
  80309b:	bf 00 00 00 00       	mov    $0x0,%edi
  8030a0:	48 b8 27 49 80 00 00 	movabs $0x804927,%rax
  8030a7:	00 00 00 
  8030aa:	ff d0                	callq  *%rax
  8030ac:	c9                   	leaveq 
  8030ad:	c3                   	retq   

00000000008030ae <open>:
  8030ae:	55                   	push   %rbp
  8030af:	48 89 e5             	mov    %rsp,%rbp
  8030b2:	48 83 ec 20          	sub    $0x20,%rsp
  8030b6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8030ba:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8030bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030c1:	48 89 c7             	mov    %rax,%rdi
  8030c4:	48 b8 0a 13 80 00 00 	movabs $0x80130a,%rax
  8030cb:	00 00 00 
  8030ce:	ff d0                	callq  *%rax
  8030d0:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8030d5:	7e 0a                	jle    8030e1 <open+0x33>
  8030d7:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8030dc:	e9 a5 00 00 00       	jmpq   803186 <open+0xd8>
  8030e1:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8030e5:	48 89 c7             	mov    %rax,%rdi
  8030e8:	48 b8 08 27 80 00 00 	movabs $0x802708,%rax
  8030ef:	00 00 00 
  8030f2:	ff d0                	callq  *%rax
  8030f4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030f7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030fb:	79 08                	jns    803105 <open+0x57>
  8030fd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803100:	e9 81 00 00 00       	jmpq   803186 <open+0xd8>
  803105:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803109:	48 89 c6             	mov    %rax,%rsi
  80310c:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  803113:	00 00 00 
  803116:	48 b8 76 13 80 00 00 	movabs $0x801376,%rax
  80311d:	00 00 00 
  803120:	ff d0                	callq  *%rax
  803122:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803129:	00 00 00 
  80312c:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80312f:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  803135:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803139:	48 89 c6             	mov    %rax,%rsi
  80313c:	bf 01 00 00 00       	mov    $0x1,%edi
  803141:	48 b8 25 30 80 00 00 	movabs $0x803025,%rax
  803148:	00 00 00 
  80314b:	ff d0                	callq  *%rax
  80314d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803150:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803154:	79 1d                	jns    803173 <open+0xc5>
  803156:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80315a:	be 00 00 00 00       	mov    $0x0,%esi
  80315f:	48 89 c7             	mov    %rax,%rdi
  803162:	48 b8 30 28 80 00 00 	movabs $0x802830,%rax
  803169:	00 00 00 
  80316c:	ff d0                	callq  *%rax
  80316e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803171:	eb 13                	jmp    803186 <open+0xd8>
  803173:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803177:	48 89 c7             	mov    %rax,%rdi
  80317a:	48 b8 ba 26 80 00 00 	movabs $0x8026ba,%rax
  803181:	00 00 00 
  803184:	ff d0                	callq  *%rax
  803186:	c9                   	leaveq 
  803187:	c3                   	retq   

0000000000803188 <devfile_flush>:
  803188:	55                   	push   %rbp
  803189:	48 89 e5             	mov    %rsp,%rbp
  80318c:	48 83 ec 10          	sub    $0x10,%rsp
  803190:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803194:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803198:	8b 50 0c             	mov    0xc(%rax),%edx
  80319b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8031a2:	00 00 00 
  8031a5:	89 10                	mov    %edx,(%rax)
  8031a7:	be 00 00 00 00       	mov    $0x0,%esi
  8031ac:	bf 06 00 00 00       	mov    $0x6,%edi
  8031b1:	48 b8 25 30 80 00 00 	movabs $0x803025,%rax
  8031b8:	00 00 00 
  8031bb:	ff d0                	callq  *%rax
  8031bd:	c9                   	leaveq 
  8031be:	c3                   	retq   

00000000008031bf <devfile_read>:
  8031bf:	55                   	push   %rbp
  8031c0:	48 89 e5             	mov    %rsp,%rbp
  8031c3:	48 83 ec 30          	sub    $0x30,%rsp
  8031c7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8031cb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8031cf:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8031d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031d7:	8b 50 0c             	mov    0xc(%rax),%edx
  8031da:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8031e1:	00 00 00 
  8031e4:	89 10                	mov    %edx,(%rax)
  8031e6:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8031ed:	00 00 00 
  8031f0:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8031f4:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8031f8:	be 00 00 00 00       	mov    $0x0,%esi
  8031fd:	bf 03 00 00 00       	mov    $0x3,%edi
  803202:	48 b8 25 30 80 00 00 	movabs $0x803025,%rax
  803209:	00 00 00 
  80320c:	ff d0                	callq  *%rax
  80320e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803211:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803215:	79 08                	jns    80321f <devfile_read+0x60>
  803217:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80321a:	e9 a4 00 00 00       	jmpq   8032c3 <devfile_read+0x104>
  80321f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803222:	48 98                	cltq   
  803224:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803228:	76 35                	jbe    80325f <devfile_read+0xa0>
  80322a:	48 b9 16 54 80 00 00 	movabs $0x805416,%rcx
  803231:	00 00 00 
  803234:	48 ba 1d 54 80 00 00 	movabs $0x80541d,%rdx
  80323b:	00 00 00 
  80323e:	be 89 00 00 00       	mov    $0x89,%esi
  803243:	48 bf 32 54 80 00 00 	movabs $0x805432,%rdi
  80324a:	00 00 00 
  80324d:	b8 00 00 00 00       	mov    $0x0,%eax
  803252:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  803259:	00 00 00 
  80325c:	41 ff d0             	callq  *%r8
  80325f:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  803266:	7e 35                	jle    80329d <devfile_read+0xde>
  803268:	48 b9 40 54 80 00 00 	movabs $0x805440,%rcx
  80326f:	00 00 00 
  803272:	48 ba 1d 54 80 00 00 	movabs $0x80541d,%rdx
  803279:	00 00 00 
  80327c:	be 8a 00 00 00       	mov    $0x8a,%esi
  803281:	48 bf 32 54 80 00 00 	movabs $0x805432,%rdi
  803288:	00 00 00 
  80328b:	b8 00 00 00 00       	mov    $0x0,%eax
  803290:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  803297:	00 00 00 
  80329a:	41 ff d0             	callq  *%r8
  80329d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032a0:	48 63 d0             	movslq %eax,%rdx
  8032a3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8032a7:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8032ae:	00 00 00 
  8032b1:	48 89 c7             	mov    %rax,%rdi
  8032b4:	48 b8 9b 16 80 00 00 	movabs $0x80169b,%rax
  8032bb:	00 00 00 
  8032be:	ff d0                	callq  *%rax
  8032c0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032c3:	c9                   	leaveq 
  8032c4:	c3                   	retq   

00000000008032c5 <devfile_write>:
  8032c5:	55                   	push   %rbp
  8032c6:	48 89 e5             	mov    %rsp,%rbp
  8032c9:	48 83 ec 40          	sub    $0x40,%rsp
  8032cd:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8032d1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8032d5:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8032d9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8032dd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8032e1:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8032e8:	00 
  8032e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032ed:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8032f1:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  8032f6:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8032fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8032fe:	8b 50 0c             	mov    0xc(%rax),%edx
  803301:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803308:	00 00 00 
  80330b:	89 10                	mov    %edx,(%rax)
  80330d:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803314:	00 00 00 
  803317:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80331b:	48 89 50 08          	mov    %rdx,0x8(%rax)
  80331f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803323:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803327:	48 89 c6             	mov    %rax,%rsi
  80332a:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  803331:	00 00 00 
  803334:	48 b8 9b 16 80 00 00 	movabs $0x80169b,%rax
  80333b:	00 00 00 
  80333e:	ff d0                	callq  *%rax
  803340:	be 00 00 00 00       	mov    $0x0,%esi
  803345:	bf 04 00 00 00       	mov    $0x4,%edi
  80334a:	48 b8 25 30 80 00 00 	movabs $0x803025,%rax
  803351:	00 00 00 
  803354:	ff d0                	callq  *%rax
  803356:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803359:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80335d:	79 05                	jns    803364 <devfile_write+0x9f>
  80335f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803362:	eb 43                	jmp    8033a7 <devfile_write+0xe2>
  803364:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803367:	48 98                	cltq   
  803369:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80336d:	76 35                	jbe    8033a4 <devfile_write+0xdf>
  80336f:	48 b9 16 54 80 00 00 	movabs $0x805416,%rcx
  803376:	00 00 00 
  803379:	48 ba 1d 54 80 00 00 	movabs $0x80541d,%rdx
  803380:	00 00 00 
  803383:	be a8 00 00 00       	mov    $0xa8,%esi
  803388:	48 bf 32 54 80 00 00 	movabs $0x805432,%rdi
  80338f:	00 00 00 
  803392:	b8 00 00 00 00       	mov    $0x0,%eax
  803397:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  80339e:	00 00 00 
  8033a1:	41 ff d0             	callq  *%r8
  8033a4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8033a7:	c9                   	leaveq 
  8033a8:	c3                   	retq   

00000000008033a9 <devfile_stat>:
  8033a9:	55                   	push   %rbp
  8033aa:	48 89 e5             	mov    %rsp,%rbp
  8033ad:	48 83 ec 20          	sub    $0x20,%rsp
  8033b1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8033b5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8033b9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033bd:	8b 50 0c             	mov    0xc(%rax),%edx
  8033c0:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8033c7:	00 00 00 
  8033ca:	89 10                	mov    %edx,(%rax)
  8033cc:	be 00 00 00 00       	mov    $0x0,%esi
  8033d1:	bf 05 00 00 00       	mov    $0x5,%edi
  8033d6:	48 b8 25 30 80 00 00 	movabs $0x803025,%rax
  8033dd:	00 00 00 
  8033e0:	ff d0                	callq  *%rax
  8033e2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033e5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033e9:	79 05                	jns    8033f0 <devfile_stat+0x47>
  8033eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033ee:	eb 56                	jmp    803446 <devfile_stat+0x9d>
  8033f0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8033f4:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8033fb:	00 00 00 
  8033fe:	48 89 c7             	mov    %rax,%rdi
  803401:	48 b8 76 13 80 00 00 	movabs $0x801376,%rax
  803408:	00 00 00 
  80340b:	ff d0                	callq  *%rax
  80340d:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803414:	00 00 00 
  803417:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  80341d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803421:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803427:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80342e:	00 00 00 
  803431:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803437:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80343b:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803441:	b8 00 00 00 00       	mov    $0x0,%eax
  803446:	c9                   	leaveq 
  803447:	c3                   	retq   

0000000000803448 <devfile_trunc>:
  803448:	55                   	push   %rbp
  803449:	48 89 e5             	mov    %rsp,%rbp
  80344c:	48 83 ec 10          	sub    $0x10,%rsp
  803450:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803454:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803457:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80345b:	8b 50 0c             	mov    0xc(%rax),%edx
  80345e:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803465:	00 00 00 
  803468:	89 10                	mov    %edx,(%rax)
  80346a:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803471:	00 00 00 
  803474:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803477:	89 50 04             	mov    %edx,0x4(%rax)
  80347a:	be 00 00 00 00       	mov    $0x0,%esi
  80347f:	bf 02 00 00 00       	mov    $0x2,%edi
  803484:	48 b8 25 30 80 00 00 	movabs $0x803025,%rax
  80348b:	00 00 00 
  80348e:	ff d0                	callq  *%rax
  803490:	c9                   	leaveq 
  803491:	c3                   	retq   

0000000000803492 <remove>:
  803492:	55                   	push   %rbp
  803493:	48 89 e5             	mov    %rsp,%rbp
  803496:	48 83 ec 10          	sub    $0x10,%rsp
  80349a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80349e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8034a2:	48 89 c7             	mov    %rax,%rdi
  8034a5:	48 b8 0a 13 80 00 00 	movabs $0x80130a,%rax
  8034ac:	00 00 00 
  8034af:	ff d0                	callq  *%rax
  8034b1:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8034b6:	7e 07                	jle    8034bf <remove+0x2d>
  8034b8:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8034bd:	eb 33                	jmp    8034f2 <remove+0x60>
  8034bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8034c3:	48 89 c6             	mov    %rax,%rsi
  8034c6:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8034cd:	00 00 00 
  8034d0:	48 b8 76 13 80 00 00 	movabs $0x801376,%rax
  8034d7:	00 00 00 
  8034da:	ff d0                	callq  *%rax
  8034dc:	be 00 00 00 00       	mov    $0x0,%esi
  8034e1:	bf 07 00 00 00       	mov    $0x7,%edi
  8034e6:	48 b8 25 30 80 00 00 	movabs $0x803025,%rax
  8034ed:	00 00 00 
  8034f0:	ff d0                	callq  *%rax
  8034f2:	c9                   	leaveq 
  8034f3:	c3                   	retq   

00000000008034f4 <sync>:
  8034f4:	55                   	push   %rbp
  8034f5:	48 89 e5             	mov    %rsp,%rbp
  8034f8:	be 00 00 00 00       	mov    $0x0,%esi
  8034fd:	bf 08 00 00 00       	mov    $0x8,%edi
  803502:	48 b8 25 30 80 00 00 	movabs $0x803025,%rax
  803509:	00 00 00 
  80350c:	ff d0                	callq  *%rax
  80350e:	5d                   	pop    %rbp
  80350f:	c3                   	retq   

0000000000803510 <copy>:
  803510:	55                   	push   %rbp
  803511:	48 89 e5             	mov    %rsp,%rbp
  803514:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  80351b:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803522:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803529:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803530:	be 00 00 00 00       	mov    $0x0,%esi
  803535:	48 89 c7             	mov    %rax,%rdi
  803538:	48 b8 ae 30 80 00 00 	movabs $0x8030ae,%rax
  80353f:	00 00 00 
  803542:	ff d0                	callq  *%rax
  803544:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803547:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80354b:	79 28                	jns    803575 <copy+0x65>
  80354d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803550:	89 c6                	mov    %eax,%esi
  803552:	48 bf 4c 54 80 00 00 	movabs $0x80544c,%rdi
  803559:	00 00 00 
  80355c:	b8 00 00 00 00       	mov    $0x0,%eax
  803561:	48 ba e6 07 80 00 00 	movabs $0x8007e6,%rdx
  803568:	00 00 00 
  80356b:	ff d2                	callq  *%rdx
  80356d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803570:	e9 76 01 00 00       	jmpq   8036eb <copy+0x1db>
  803575:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  80357c:	be 01 01 00 00       	mov    $0x101,%esi
  803581:	48 89 c7             	mov    %rax,%rdi
  803584:	48 b8 ae 30 80 00 00 	movabs $0x8030ae,%rax
  80358b:	00 00 00 
  80358e:	ff d0                	callq  *%rax
  803590:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803593:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803597:	0f 89 ad 00 00 00    	jns    80364a <copy+0x13a>
  80359d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035a0:	89 c6                	mov    %eax,%esi
  8035a2:	48 bf 62 54 80 00 00 	movabs $0x805462,%rdi
  8035a9:	00 00 00 
  8035ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8035b1:	48 ba e6 07 80 00 00 	movabs $0x8007e6,%rdx
  8035b8:	00 00 00 
  8035bb:	ff d2                	callq  *%rdx
  8035bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035c0:	89 c7                	mov    %eax,%edi
  8035c2:	48 b8 b2 29 80 00 00 	movabs $0x8029b2,%rax
  8035c9:	00 00 00 
  8035cc:	ff d0                	callq  *%rax
  8035ce:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035d1:	e9 15 01 00 00       	jmpq   8036eb <copy+0x1db>
  8035d6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8035d9:	48 63 d0             	movslq %eax,%rdx
  8035dc:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8035e3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035e6:	48 89 ce             	mov    %rcx,%rsi
  8035e9:	89 c7                	mov    %eax,%edi
  8035eb:	48 b8 20 2d 80 00 00 	movabs $0x802d20,%rax
  8035f2:	00 00 00 
  8035f5:	ff d0                	callq  *%rax
  8035f7:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8035fa:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8035fe:	79 4a                	jns    80364a <copy+0x13a>
  803600:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803603:	89 c6                	mov    %eax,%esi
  803605:	48 bf 7c 54 80 00 00 	movabs $0x80547c,%rdi
  80360c:	00 00 00 
  80360f:	b8 00 00 00 00       	mov    $0x0,%eax
  803614:	48 ba e6 07 80 00 00 	movabs $0x8007e6,%rdx
  80361b:	00 00 00 
  80361e:	ff d2                	callq  *%rdx
  803620:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803623:	89 c7                	mov    %eax,%edi
  803625:	48 b8 b2 29 80 00 00 	movabs $0x8029b2,%rax
  80362c:	00 00 00 
  80362f:	ff d0                	callq  *%rax
  803631:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803634:	89 c7                	mov    %eax,%edi
  803636:	48 b8 b2 29 80 00 00 	movabs $0x8029b2,%rax
  80363d:	00 00 00 
  803640:	ff d0                	callq  *%rax
  803642:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803645:	e9 a1 00 00 00       	jmpq   8036eb <copy+0x1db>
  80364a:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803651:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803654:	ba 00 02 00 00       	mov    $0x200,%edx
  803659:	48 89 ce             	mov    %rcx,%rsi
  80365c:	89 c7                	mov    %eax,%edi
  80365e:	48 b8 d5 2b 80 00 00 	movabs $0x802bd5,%rax
  803665:	00 00 00 
  803668:	ff d0                	callq  *%rax
  80366a:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80366d:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803671:	0f 8f 5f ff ff ff    	jg     8035d6 <copy+0xc6>
  803677:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80367b:	79 47                	jns    8036c4 <copy+0x1b4>
  80367d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803680:	89 c6                	mov    %eax,%esi
  803682:	48 bf 8f 54 80 00 00 	movabs $0x80548f,%rdi
  803689:	00 00 00 
  80368c:	b8 00 00 00 00       	mov    $0x0,%eax
  803691:	48 ba e6 07 80 00 00 	movabs $0x8007e6,%rdx
  803698:	00 00 00 
  80369b:	ff d2                	callq  *%rdx
  80369d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036a0:	89 c7                	mov    %eax,%edi
  8036a2:	48 b8 b2 29 80 00 00 	movabs $0x8029b2,%rax
  8036a9:	00 00 00 
  8036ac:	ff d0                	callq  *%rax
  8036ae:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036b1:	89 c7                	mov    %eax,%edi
  8036b3:	48 b8 b2 29 80 00 00 	movabs $0x8029b2,%rax
  8036ba:	00 00 00 
  8036bd:	ff d0                	callq  *%rax
  8036bf:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8036c2:	eb 27                	jmp    8036eb <copy+0x1db>
  8036c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036c7:	89 c7                	mov    %eax,%edi
  8036c9:	48 b8 b2 29 80 00 00 	movabs $0x8029b2,%rax
  8036d0:	00 00 00 
  8036d3:	ff d0                	callq  *%rax
  8036d5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036d8:	89 c7                	mov    %eax,%edi
  8036da:	48 b8 b2 29 80 00 00 	movabs $0x8029b2,%rax
  8036e1:	00 00 00 
  8036e4:	ff d0                	callq  *%rax
  8036e6:	b8 00 00 00 00       	mov    $0x0,%eax
  8036eb:	c9                   	leaveq 
  8036ec:	c3                   	retq   

00000000008036ed <fd2sockid>:
  8036ed:	55                   	push   %rbp
  8036ee:	48 89 e5             	mov    %rsp,%rbp
  8036f1:	48 83 ec 20          	sub    $0x20,%rsp
  8036f5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8036f8:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8036fc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036ff:	48 89 d6             	mov    %rdx,%rsi
  803702:	89 c7                	mov    %eax,%edi
  803704:	48 b8 a0 27 80 00 00 	movabs $0x8027a0,%rax
  80370b:	00 00 00 
  80370e:	ff d0                	callq  *%rax
  803710:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803713:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803717:	79 05                	jns    80371e <fd2sockid+0x31>
  803719:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80371c:	eb 24                	jmp    803742 <fd2sockid+0x55>
  80371e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803722:	8b 10                	mov    (%rax),%edx
  803724:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  80372b:	00 00 00 
  80372e:	8b 00                	mov    (%rax),%eax
  803730:	39 c2                	cmp    %eax,%edx
  803732:	74 07                	je     80373b <fd2sockid+0x4e>
  803734:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803739:	eb 07                	jmp    803742 <fd2sockid+0x55>
  80373b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80373f:	8b 40 0c             	mov    0xc(%rax),%eax
  803742:	c9                   	leaveq 
  803743:	c3                   	retq   

0000000000803744 <alloc_sockfd>:
  803744:	55                   	push   %rbp
  803745:	48 89 e5             	mov    %rsp,%rbp
  803748:	48 83 ec 20          	sub    $0x20,%rsp
  80374c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80374f:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803753:	48 89 c7             	mov    %rax,%rdi
  803756:	48 b8 08 27 80 00 00 	movabs $0x802708,%rax
  80375d:	00 00 00 
  803760:	ff d0                	callq  *%rax
  803762:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803765:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803769:	78 26                	js     803791 <alloc_sockfd+0x4d>
  80376b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80376f:	ba 07 04 00 00       	mov    $0x407,%edx
  803774:	48 89 c6             	mov    %rax,%rsi
  803777:	bf 00 00 00 00       	mov    $0x0,%edi
  80377c:	48 b8 a6 1c 80 00 00 	movabs $0x801ca6,%rax
  803783:	00 00 00 
  803786:	ff d0                	callq  *%rax
  803788:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80378b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80378f:	79 16                	jns    8037a7 <alloc_sockfd+0x63>
  803791:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803794:	89 c7                	mov    %eax,%edi
  803796:	48 b8 53 3c 80 00 00 	movabs $0x803c53,%rax
  80379d:	00 00 00 
  8037a0:	ff d0                	callq  *%rax
  8037a2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037a5:	eb 3a                	jmp    8037e1 <alloc_sockfd+0x9d>
  8037a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037ab:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  8037b2:	00 00 00 
  8037b5:	8b 12                	mov    (%rdx),%edx
  8037b7:	89 10                	mov    %edx,(%rax)
  8037b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037bd:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8037c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037c8:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8037cb:	89 50 0c             	mov    %edx,0xc(%rax)
  8037ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037d2:	48 89 c7             	mov    %rax,%rdi
  8037d5:	48 b8 ba 26 80 00 00 	movabs $0x8026ba,%rax
  8037dc:	00 00 00 
  8037df:	ff d0                	callq  *%rax
  8037e1:	c9                   	leaveq 
  8037e2:	c3                   	retq   

00000000008037e3 <accept>:
  8037e3:	55                   	push   %rbp
  8037e4:	48 89 e5             	mov    %rsp,%rbp
  8037e7:	48 83 ec 30          	sub    $0x30,%rsp
  8037eb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8037ee:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8037f2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8037f6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037f9:	89 c7                	mov    %eax,%edi
  8037fb:	48 b8 ed 36 80 00 00 	movabs $0x8036ed,%rax
  803802:	00 00 00 
  803805:	ff d0                	callq  *%rax
  803807:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80380a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80380e:	79 05                	jns    803815 <accept+0x32>
  803810:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803813:	eb 3b                	jmp    803850 <accept+0x6d>
  803815:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803819:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80381d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803820:	48 89 ce             	mov    %rcx,%rsi
  803823:	89 c7                	mov    %eax,%edi
  803825:	48 b8 30 3b 80 00 00 	movabs $0x803b30,%rax
  80382c:	00 00 00 
  80382f:	ff d0                	callq  *%rax
  803831:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803834:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803838:	79 05                	jns    80383f <accept+0x5c>
  80383a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80383d:	eb 11                	jmp    803850 <accept+0x6d>
  80383f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803842:	89 c7                	mov    %eax,%edi
  803844:	48 b8 44 37 80 00 00 	movabs $0x803744,%rax
  80384b:	00 00 00 
  80384e:	ff d0                	callq  *%rax
  803850:	c9                   	leaveq 
  803851:	c3                   	retq   

0000000000803852 <bind>:
  803852:	55                   	push   %rbp
  803853:	48 89 e5             	mov    %rsp,%rbp
  803856:	48 83 ec 20          	sub    $0x20,%rsp
  80385a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80385d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803861:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803864:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803867:	89 c7                	mov    %eax,%edi
  803869:	48 b8 ed 36 80 00 00 	movabs $0x8036ed,%rax
  803870:	00 00 00 
  803873:	ff d0                	callq  *%rax
  803875:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803878:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80387c:	79 05                	jns    803883 <bind+0x31>
  80387e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803881:	eb 1b                	jmp    80389e <bind+0x4c>
  803883:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803886:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80388a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80388d:	48 89 ce             	mov    %rcx,%rsi
  803890:	89 c7                	mov    %eax,%edi
  803892:	48 b8 af 3b 80 00 00 	movabs $0x803baf,%rax
  803899:	00 00 00 
  80389c:	ff d0                	callq  *%rax
  80389e:	c9                   	leaveq 
  80389f:	c3                   	retq   

00000000008038a0 <shutdown>:
  8038a0:	55                   	push   %rbp
  8038a1:	48 89 e5             	mov    %rsp,%rbp
  8038a4:	48 83 ec 20          	sub    $0x20,%rsp
  8038a8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8038ab:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8038ae:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038b1:	89 c7                	mov    %eax,%edi
  8038b3:	48 b8 ed 36 80 00 00 	movabs $0x8036ed,%rax
  8038ba:	00 00 00 
  8038bd:	ff d0                	callq  *%rax
  8038bf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038c2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038c6:	79 05                	jns    8038cd <shutdown+0x2d>
  8038c8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038cb:	eb 16                	jmp    8038e3 <shutdown+0x43>
  8038cd:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8038d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038d3:	89 d6                	mov    %edx,%esi
  8038d5:	89 c7                	mov    %eax,%edi
  8038d7:	48 b8 13 3c 80 00 00 	movabs $0x803c13,%rax
  8038de:	00 00 00 
  8038e1:	ff d0                	callq  *%rax
  8038e3:	c9                   	leaveq 
  8038e4:	c3                   	retq   

00000000008038e5 <devsock_close>:
  8038e5:	55                   	push   %rbp
  8038e6:	48 89 e5             	mov    %rsp,%rbp
  8038e9:	48 83 ec 10          	sub    $0x10,%rsp
  8038ed:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8038f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038f5:	48 89 c7             	mov    %rax,%rdi
  8038f8:	48 b8 63 4b 80 00 00 	movabs $0x804b63,%rax
  8038ff:	00 00 00 
  803902:	ff d0                	callq  *%rax
  803904:	83 f8 01             	cmp    $0x1,%eax
  803907:	75 17                	jne    803920 <devsock_close+0x3b>
  803909:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80390d:	8b 40 0c             	mov    0xc(%rax),%eax
  803910:	89 c7                	mov    %eax,%edi
  803912:	48 b8 53 3c 80 00 00 	movabs $0x803c53,%rax
  803919:	00 00 00 
  80391c:	ff d0                	callq  *%rax
  80391e:	eb 05                	jmp    803925 <devsock_close+0x40>
  803920:	b8 00 00 00 00       	mov    $0x0,%eax
  803925:	c9                   	leaveq 
  803926:	c3                   	retq   

0000000000803927 <connect>:
  803927:	55                   	push   %rbp
  803928:	48 89 e5             	mov    %rsp,%rbp
  80392b:	48 83 ec 20          	sub    $0x20,%rsp
  80392f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803932:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803936:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803939:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80393c:	89 c7                	mov    %eax,%edi
  80393e:	48 b8 ed 36 80 00 00 	movabs $0x8036ed,%rax
  803945:	00 00 00 
  803948:	ff d0                	callq  *%rax
  80394a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80394d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803951:	79 05                	jns    803958 <connect+0x31>
  803953:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803956:	eb 1b                	jmp    803973 <connect+0x4c>
  803958:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80395b:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80395f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803962:	48 89 ce             	mov    %rcx,%rsi
  803965:	89 c7                	mov    %eax,%edi
  803967:	48 b8 80 3c 80 00 00 	movabs $0x803c80,%rax
  80396e:	00 00 00 
  803971:	ff d0                	callq  *%rax
  803973:	c9                   	leaveq 
  803974:	c3                   	retq   

0000000000803975 <listen>:
  803975:	55                   	push   %rbp
  803976:	48 89 e5             	mov    %rsp,%rbp
  803979:	48 83 ec 20          	sub    $0x20,%rsp
  80397d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803980:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803983:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803986:	89 c7                	mov    %eax,%edi
  803988:	48 b8 ed 36 80 00 00 	movabs $0x8036ed,%rax
  80398f:	00 00 00 
  803992:	ff d0                	callq  *%rax
  803994:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803997:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80399b:	79 05                	jns    8039a2 <listen+0x2d>
  80399d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039a0:	eb 16                	jmp    8039b8 <listen+0x43>
  8039a2:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8039a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039a8:	89 d6                	mov    %edx,%esi
  8039aa:	89 c7                	mov    %eax,%edi
  8039ac:	48 b8 e4 3c 80 00 00 	movabs $0x803ce4,%rax
  8039b3:	00 00 00 
  8039b6:	ff d0                	callq  *%rax
  8039b8:	c9                   	leaveq 
  8039b9:	c3                   	retq   

00000000008039ba <devsock_read>:
  8039ba:	55                   	push   %rbp
  8039bb:	48 89 e5             	mov    %rsp,%rbp
  8039be:	48 83 ec 20          	sub    $0x20,%rsp
  8039c2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8039c6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8039ca:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8039ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039d2:	89 c2                	mov    %eax,%edx
  8039d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039d8:	8b 40 0c             	mov    0xc(%rax),%eax
  8039db:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8039df:	b9 00 00 00 00       	mov    $0x0,%ecx
  8039e4:	89 c7                	mov    %eax,%edi
  8039e6:	48 b8 24 3d 80 00 00 	movabs $0x803d24,%rax
  8039ed:	00 00 00 
  8039f0:	ff d0                	callq  *%rax
  8039f2:	c9                   	leaveq 
  8039f3:	c3                   	retq   

00000000008039f4 <devsock_write>:
  8039f4:	55                   	push   %rbp
  8039f5:	48 89 e5             	mov    %rsp,%rbp
  8039f8:	48 83 ec 20          	sub    $0x20,%rsp
  8039fc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803a00:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803a04:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803a08:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a0c:	89 c2                	mov    %eax,%edx
  803a0e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a12:	8b 40 0c             	mov    0xc(%rax),%eax
  803a15:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803a19:	b9 00 00 00 00       	mov    $0x0,%ecx
  803a1e:	89 c7                	mov    %eax,%edi
  803a20:	48 b8 f0 3d 80 00 00 	movabs $0x803df0,%rax
  803a27:	00 00 00 
  803a2a:	ff d0                	callq  *%rax
  803a2c:	c9                   	leaveq 
  803a2d:	c3                   	retq   

0000000000803a2e <devsock_stat>:
  803a2e:	55                   	push   %rbp
  803a2f:	48 89 e5             	mov    %rsp,%rbp
  803a32:	48 83 ec 10          	sub    $0x10,%rsp
  803a36:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803a3a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803a3e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a42:	48 be aa 54 80 00 00 	movabs $0x8054aa,%rsi
  803a49:	00 00 00 
  803a4c:	48 89 c7             	mov    %rax,%rdi
  803a4f:	48 b8 76 13 80 00 00 	movabs $0x801376,%rax
  803a56:	00 00 00 
  803a59:	ff d0                	callq  *%rax
  803a5b:	b8 00 00 00 00       	mov    $0x0,%eax
  803a60:	c9                   	leaveq 
  803a61:	c3                   	retq   

0000000000803a62 <socket>:
  803a62:	55                   	push   %rbp
  803a63:	48 89 e5             	mov    %rsp,%rbp
  803a66:	48 83 ec 20          	sub    $0x20,%rsp
  803a6a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a6d:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803a70:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803a73:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803a76:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803a79:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a7c:	89 ce                	mov    %ecx,%esi
  803a7e:	89 c7                	mov    %eax,%edi
  803a80:	48 b8 a8 3e 80 00 00 	movabs $0x803ea8,%rax
  803a87:	00 00 00 
  803a8a:	ff d0                	callq  *%rax
  803a8c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a8f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a93:	79 05                	jns    803a9a <socket+0x38>
  803a95:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a98:	eb 11                	jmp    803aab <socket+0x49>
  803a9a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a9d:	89 c7                	mov    %eax,%edi
  803a9f:	48 b8 44 37 80 00 00 	movabs $0x803744,%rax
  803aa6:	00 00 00 
  803aa9:	ff d0                	callq  *%rax
  803aab:	c9                   	leaveq 
  803aac:	c3                   	retq   

0000000000803aad <nsipc>:
  803aad:	55                   	push   %rbp
  803aae:	48 89 e5             	mov    %rsp,%rbp
  803ab1:	48 83 ec 10          	sub    $0x10,%rsp
  803ab5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ab8:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803abf:	00 00 00 
  803ac2:	8b 00                	mov    (%rax),%eax
  803ac4:	85 c0                	test   %eax,%eax
  803ac6:	75 1f                	jne    803ae7 <nsipc+0x3a>
  803ac8:	bf 02 00 00 00       	mov    $0x2,%edi
  803acd:	48 b8 f2 4a 80 00 00 	movabs $0x804af2,%rax
  803ad4:	00 00 00 
  803ad7:	ff d0                	callq  *%rax
  803ad9:	89 c2                	mov    %eax,%edx
  803adb:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803ae2:	00 00 00 
  803ae5:	89 10                	mov    %edx,(%rax)
  803ae7:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803aee:	00 00 00 
  803af1:	8b 00                	mov    (%rax),%eax
  803af3:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803af6:	b9 07 00 00 00       	mov    $0x7,%ecx
  803afb:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803b02:	00 00 00 
  803b05:	89 c7                	mov    %eax,%edi
  803b07:	48 b8 e8 49 80 00 00 	movabs $0x8049e8,%rax
  803b0e:	00 00 00 
  803b11:	ff d0                	callq  *%rax
  803b13:	ba 00 00 00 00       	mov    $0x0,%edx
  803b18:	be 00 00 00 00       	mov    $0x0,%esi
  803b1d:	bf 00 00 00 00       	mov    $0x0,%edi
  803b22:	48 b8 27 49 80 00 00 	movabs $0x804927,%rax
  803b29:	00 00 00 
  803b2c:	ff d0                	callq  *%rax
  803b2e:	c9                   	leaveq 
  803b2f:	c3                   	retq   

0000000000803b30 <nsipc_accept>:
  803b30:	55                   	push   %rbp
  803b31:	48 89 e5             	mov    %rsp,%rbp
  803b34:	48 83 ec 30          	sub    $0x30,%rsp
  803b38:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b3b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b3f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803b43:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b4a:	00 00 00 
  803b4d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803b50:	89 10                	mov    %edx,(%rax)
  803b52:	bf 01 00 00 00       	mov    $0x1,%edi
  803b57:	48 b8 ad 3a 80 00 00 	movabs $0x803aad,%rax
  803b5e:	00 00 00 
  803b61:	ff d0                	callq  *%rax
  803b63:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b66:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b6a:	78 3e                	js     803baa <nsipc_accept+0x7a>
  803b6c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b73:	00 00 00 
  803b76:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803b7a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b7e:	8b 40 10             	mov    0x10(%rax),%eax
  803b81:	89 c2                	mov    %eax,%edx
  803b83:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803b87:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b8b:	48 89 ce             	mov    %rcx,%rsi
  803b8e:	48 89 c7             	mov    %rax,%rdi
  803b91:	48 b8 9b 16 80 00 00 	movabs $0x80169b,%rax
  803b98:	00 00 00 
  803b9b:	ff d0                	callq  *%rax
  803b9d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ba1:	8b 50 10             	mov    0x10(%rax),%edx
  803ba4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ba8:	89 10                	mov    %edx,(%rax)
  803baa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bad:	c9                   	leaveq 
  803bae:	c3                   	retq   

0000000000803baf <nsipc_bind>:
  803baf:	55                   	push   %rbp
  803bb0:	48 89 e5             	mov    %rsp,%rbp
  803bb3:	48 83 ec 10          	sub    $0x10,%rsp
  803bb7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803bba:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803bbe:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803bc1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bc8:	00 00 00 
  803bcb:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803bce:	89 10                	mov    %edx,(%rax)
  803bd0:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803bd3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bd7:	48 89 c6             	mov    %rax,%rsi
  803bda:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803be1:	00 00 00 
  803be4:	48 b8 9b 16 80 00 00 	movabs $0x80169b,%rax
  803beb:	00 00 00 
  803bee:	ff d0                	callq  *%rax
  803bf0:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bf7:	00 00 00 
  803bfa:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803bfd:	89 50 14             	mov    %edx,0x14(%rax)
  803c00:	bf 02 00 00 00       	mov    $0x2,%edi
  803c05:	48 b8 ad 3a 80 00 00 	movabs $0x803aad,%rax
  803c0c:	00 00 00 
  803c0f:	ff d0                	callq  *%rax
  803c11:	c9                   	leaveq 
  803c12:	c3                   	retq   

0000000000803c13 <nsipc_shutdown>:
  803c13:	55                   	push   %rbp
  803c14:	48 89 e5             	mov    %rsp,%rbp
  803c17:	48 83 ec 10          	sub    $0x10,%rsp
  803c1b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c1e:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803c21:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c28:	00 00 00 
  803c2b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c2e:	89 10                	mov    %edx,(%rax)
  803c30:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c37:	00 00 00 
  803c3a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c3d:	89 50 04             	mov    %edx,0x4(%rax)
  803c40:	bf 03 00 00 00       	mov    $0x3,%edi
  803c45:	48 b8 ad 3a 80 00 00 	movabs $0x803aad,%rax
  803c4c:	00 00 00 
  803c4f:	ff d0                	callq  *%rax
  803c51:	c9                   	leaveq 
  803c52:	c3                   	retq   

0000000000803c53 <nsipc_close>:
  803c53:	55                   	push   %rbp
  803c54:	48 89 e5             	mov    %rsp,%rbp
  803c57:	48 83 ec 10          	sub    $0x10,%rsp
  803c5b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c5e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c65:	00 00 00 
  803c68:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c6b:	89 10                	mov    %edx,(%rax)
  803c6d:	bf 04 00 00 00       	mov    $0x4,%edi
  803c72:	48 b8 ad 3a 80 00 00 	movabs $0x803aad,%rax
  803c79:	00 00 00 
  803c7c:	ff d0                	callq  *%rax
  803c7e:	c9                   	leaveq 
  803c7f:	c3                   	retq   

0000000000803c80 <nsipc_connect>:
  803c80:	55                   	push   %rbp
  803c81:	48 89 e5             	mov    %rsp,%rbp
  803c84:	48 83 ec 10          	sub    $0x10,%rsp
  803c88:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c8b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803c8f:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803c92:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c99:	00 00 00 
  803c9c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c9f:	89 10                	mov    %edx,(%rax)
  803ca1:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ca4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ca8:	48 89 c6             	mov    %rax,%rsi
  803cab:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803cb2:	00 00 00 
  803cb5:	48 b8 9b 16 80 00 00 	movabs $0x80169b,%rax
  803cbc:	00 00 00 
  803cbf:	ff d0                	callq  *%rax
  803cc1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cc8:	00 00 00 
  803ccb:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803cce:	89 50 14             	mov    %edx,0x14(%rax)
  803cd1:	bf 05 00 00 00       	mov    $0x5,%edi
  803cd6:	48 b8 ad 3a 80 00 00 	movabs $0x803aad,%rax
  803cdd:	00 00 00 
  803ce0:	ff d0                	callq  *%rax
  803ce2:	c9                   	leaveq 
  803ce3:	c3                   	retq   

0000000000803ce4 <nsipc_listen>:
  803ce4:	55                   	push   %rbp
  803ce5:	48 89 e5             	mov    %rsp,%rbp
  803ce8:	48 83 ec 10          	sub    $0x10,%rsp
  803cec:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803cef:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803cf2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cf9:	00 00 00 
  803cfc:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803cff:	89 10                	mov    %edx,(%rax)
  803d01:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d08:	00 00 00 
  803d0b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d0e:	89 50 04             	mov    %edx,0x4(%rax)
  803d11:	bf 06 00 00 00       	mov    $0x6,%edi
  803d16:	48 b8 ad 3a 80 00 00 	movabs $0x803aad,%rax
  803d1d:	00 00 00 
  803d20:	ff d0                	callq  *%rax
  803d22:	c9                   	leaveq 
  803d23:	c3                   	retq   

0000000000803d24 <nsipc_recv>:
  803d24:	55                   	push   %rbp
  803d25:	48 89 e5             	mov    %rsp,%rbp
  803d28:	48 83 ec 30          	sub    $0x30,%rsp
  803d2c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d2f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803d33:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803d36:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803d39:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d40:	00 00 00 
  803d43:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803d46:	89 10                	mov    %edx,(%rax)
  803d48:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d4f:	00 00 00 
  803d52:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803d55:	89 50 04             	mov    %edx,0x4(%rax)
  803d58:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d5f:	00 00 00 
  803d62:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803d65:	89 50 08             	mov    %edx,0x8(%rax)
  803d68:	bf 07 00 00 00       	mov    $0x7,%edi
  803d6d:	48 b8 ad 3a 80 00 00 	movabs $0x803aad,%rax
  803d74:	00 00 00 
  803d77:	ff d0                	callq  *%rax
  803d79:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d7c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d80:	78 69                	js     803deb <nsipc_recv+0xc7>
  803d82:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803d89:	7f 08                	jg     803d93 <nsipc_recv+0x6f>
  803d8b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d8e:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803d91:	7e 35                	jle    803dc8 <nsipc_recv+0xa4>
  803d93:	48 b9 b1 54 80 00 00 	movabs $0x8054b1,%rcx
  803d9a:	00 00 00 
  803d9d:	48 ba c6 54 80 00 00 	movabs $0x8054c6,%rdx
  803da4:	00 00 00 
  803da7:	be 62 00 00 00       	mov    $0x62,%esi
  803dac:	48 bf db 54 80 00 00 	movabs $0x8054db,%rdi
  803db3:	00 00 00 
  803db6:	b8 00 00 00 00       	mov    $0x0,%eax
  803dbb:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  803dc2:	00 00 00 
  803dc5:	41 ff d0             	callq  *%r8
  803dc8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dcb:	48 63 d0             	movslq %eax,%rdx
  803dce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803dd2:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803dd9:	00 00 00 
  803ddc:	48 89 c7             	mov    %rax,%rdi
  803ddf:	48 b8 9b 16 80 00 00 	movabs $0x80169b,%rax
  803de6:	00 00 00 
  803de9:	ff d0                	callq  *%rax
  803deb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dee:	c9                   	leaveq 
  803def:	c3                   	retq   

0000000000803df0 <nsipc_send>:
  803df0:	55                   	push   %rbp
  803df1:	48 89 e5             	mov    %rsp,%rbp
  803df4:	48 83 ec 20          	sub    $0x20,%rsp
  803df8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803dfb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803dff:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803e02:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803e05:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e0c:	00 00 00 
  803e0f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803e12:	89 10                	mov    %edx,(%rax)
  803e14:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803e1b:	7e 35                	jle    803e52 <nsipc_send+0x62>
  803e1d:	48 b9 ea 54 80 00 00 	movabs $0x8054ea,%rcx
  803e24:	00 00 00 
  803e27:	48 ba c6 54 80 00 00 	movabs $0x8054c6,%rdx
  803e2e:	00 00 00 
  803e31:	be 6d 00 00 00       	mov    $0x6d,%esi
  803e36:	48 bf db 54 80 00 00 	movabs $0x8054db,%rdi
  803e3d:	00 00 00 
  803e40:	b8 00 00 00 00       	mov    $0x0,%eax
  803e45:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  803e4c:	00 00 00 
  803e4f:	41 ff d0             	callq  *%r8
  803e52:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e55:	48 63 d0             	movslq %eax,%rdx
  803e58:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e5c:	48 89 c6             	mov    %rax,%rsi
  803e5f:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803e66:	00 00 00 
  803e69:	48 b8 9b 16 80 00 00 	movabs $0x80169b,%rax
  803e70:	00 00 00 
  803e73:	ff d0                	callq  *%rax
  803e75:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e7c:	00 00 00 
  803e7f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e82:	89 50 04             	mov    %edx,0x4(%rax)
  803e85:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e8c:	00 00 00 
  803e8f:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803e92:	89 50 08             	mov    %edx,0x8(%rax)
  803e95:	bf 08 00 00 00       	mov    $0x8,%edi
  803e9a:	48 b8 ad 3a 80 00 00 	movabs $0x803aad,%rax
  803ea1:	00 00 00 
  803ea4:	ff d0                	callq  *%rax
  803ea6:	c9                   	leaveq 
  803ea7:	c3                   	retq   

0000000000803ea8 <nsipc_socket>:
  803ea8:	55                   	push   %rbp
  803ea9:	48 89 e5             	mov    %rsp,%rbp
  803eac:	48 83 ec 10          	sub    $0x10,%rsp
  803eb0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803eb3:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803eb6:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803eb9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ec0:	00 00 00 
  803ec3:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ec6:	89 10                	mov    %edx,(%rax)
  803ec8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ecf:	00 00 00 
  803ed2:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ed5:	89 50 04             	mov    %edx,0x4(%rax)
  803ed8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803edf:	00 00 00 
  803ee2:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803ee5:	89 50 08             	mov    %edx,0x8(%rax)
  803ee8:	bf 09 00 00 00       	mov    $0x9,%edi
  803eed:	48 b8 ad 3a 80 00 00 	movabs $0x803aad,%rax
  803ef4:	00 00 00 
  803ef7:	ff d0                	callq  *%rax
  803ef9:	c9                   	leaveq 
  803efa:	c3                   	retq   

0000000000803efb <pipe>:
  803efb:	55                   	push   %rbp
  803efc:	48 89 e5             	mov    %rsp,%rbp
  803eff:	53                   	push   %rbx
  803f00:	48 83 ec 38          	sub    $0x38,%rsp
  803f04:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803f08:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803f0c:	48 89 c7             	mov    %rax,%rdi
  803f0f:	48 b8 08 27 80 00 00 	movabs $0x802708,%rax
  803f16:	00 00 00 
  803f19:	ff d0                	callq  *%rax
  803f1b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f1e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f22:	0f 88 bf 01 00 00    	js     8040e7 <pipe+0x1ec>
  803f28:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f2c:	ba 07 04 00 00       	mov    $0x407,%edx
  803f31:	48 89 c6             	mov    %rax,%rsi
  803f34:	bf 00 00 00 00       	mov    $0x0,%edi
  803f39:	48 b8 a6 1c 80 00 00 	movabs $0x801ca6,%rax
  803f40:	00 00 00 
  803f43:	ff d0                	callq  *%rax
  803f45:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f48:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f4c:	0f 88 95 01 00 00    	js     8040e7 <pipe+0x1ec>
  803f52:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803f56:	48 89 c7             	mov    %rax,%rdi
  803f59:	48 b8 08 27 80 00 00 	movabs $0x802708,%rax
  803f60:	00 00 00 
  803f63:	ff d0                	callq  *%rax
  803f65:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f68:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f6c:	0f 88 5d 01 00 00    	js     8040cf <pipe+0x1d4>
  803f72:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f76:	ba 07 04 00 00       	mov    $0x407,%edx
  803f7b:	48 89 c6             	mov    %rax,%rsi
  803f7e:	bf 00 00 00 00       	mov    $0x0,%edi
  803f83:	48 b8 a6 1c 80 00 00 	movabs $0x801ca6,%rax
  803f8a:	00 00 00 
  803f8d:	ff d0                	callq  *%rax
  803f8f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f92:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f96:	0f 88 33 01 00 00    	js     8040cf <pipe+0x1d4>
  803f9c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803fa0:	48 89 c7             	mov    %rax,%rdi
  803fa3:	48 b8 dd 26 80 00 00 	movabs $0x8026dd,%rax
  803faa:	00 00 00 
  803fad:	ff d0                	callq  *%rax
  803faf:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803fb3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fb7:	ba 07 04 00 00       	mov    $0x407,%edx
  803fbc:	48 89 c6             	mov    %rax,%rsi
  803fbf:	bf 00 00 00 00       	mov    $0x0,%edi
  803fc4:	48 b8 a6 1c 80 00 00 	movabs $0x801ca6,%rax
  803fcb:	00 00 00 
  803fce:	ff d0                	callq  *%rax
  803fd0:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803fd3:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803fd7:	0f 88 d9 00 00 00    	js     8040b6 <pipe+0x1bb>
  803fdd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803fe1:	48 89 c7             	mov    %rax,%rdi
  803fe4:	48 b8 dd 26 80 00 00 	movabs $0x8026dd,%rax
  803feb:	00 00 00 
  803fee:	ff d0                	callq  *%rax
  803ff0:	48 89 c2             	mov    %rax,%rdx
  803ff3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ff7:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803ffd:	48 89 d1             	mov    %rdx,%rcx
  804000:	ba 00 00 00 00       	mov    $0x0,%edx
  804005:	48 89 c6             	mov    %rax,%rsi
  804008:	bf 00 00 00 00       	mov    $0x0,%edi
  80400d:	48 b8 f8 1c 80 00 00 	movabs $0x801cf8,%rax
  804014:	00 00 00 
  804017:	ff d0                	callq  *%rax
  804019:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80401c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804020:	78 79                	js     80409b <pipe+0x1a0>
  804022:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804026:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  80402d:	00 00 00 
  804030:	8b 12                	mov    (%rdx),%edx
  804032:	89 10                	mov    %edx,(%rax)
  804034:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804038:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  80403f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804043:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  80404a:	00 00 00 
  80404d:	8b 12                	mov    (%rdx),%edx
  80404f:	89 10                	mov    %edx,(%rax)
  804051:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804055:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  80405c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804060:	48 89 c7             	mov    %rax,%rdi
  804063:	48 b8 ba 26 80 00 00 	movabs $0x8026ba,%rax
  80406a:	00 00 00 
  80406d:	ff d0                	callq  *%rax
  80406f:	89 c2                	mov    %eax,%edx
  804071:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804075:	89 10                	mov    %edx,(%rax)
  804077:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80407b:	48 8d 58 04          	lea    0x4(%rax),%rbx
  80407f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804083:	48 89 c7             	mov    %rax,%rdi
  804086:	48 b8 ba 26 80 00 00 	movabs $0x8026ba,%rax
  80408d:	00 00 00 
  804090:	ff d0                	callq  *%rax
  804092:	89 03                	mov    %eax,(%rbx)
  804094:	b8 00 00 00 00       	mov    $0x0,%eax
  804099:	eb 4f                	jmp    8040ea <pipe+0x1ef>
  80409b:	90                   	nop
  80409c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8040a0:	48 89 c6             	mov    %rax,%rsi
  8040a3:	bf 00 00 00 00       	mov    $0x0,%edi
  8040a8:	48 b8 58 1d 80 00 00 	movabs $0x801d58,%rax
  8040af:	00 00 00 
  8040b2:	ff d0                	callq  *%rax
  8040b4:	eb 01                	jmp    8040b7 <pipe+0x1bc>
  8040b6:	90                   	nop
  8040b7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8040bb:	48 89 c6             	mov    %rax,%rsi
  8040be:	bf 00 00 00 00       	mov    $0x0,%edi
  8040c3:	48 b8 58 1d 80 00 00 	movabs $0x801d58,%rax
  8040ca:	00 00 00 
  8040cd:	ff d0                	callq  *%rax
  8040cf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8040d3:	48 89 c6             	mov    %rax,%rsi
  8040d6:	bf 00 00 00 00       	mov    $0x0,%edi
  8040db:	48 b8 58 1d 80 00 00 	movabs $0x801d58,%rax
  8040e2:	00 00 00 
  8040e5:	ff d0                	callq  *%rax
  8040e7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8040ea:	48 83 c4 38          	add    $0x38,%rsp
  8040ee:	5b                   	pop    %rbx
  8040ef:	5d                   	pop    %rbp
  8040f0:	c3                   	retq   

00000000008040f1 <_pipeisclosed>:
  8040f1:	55                   	push   %rbp
  8040f2:	48 89 e5             	mov    %rsp,%rbp
  8040f5:	53                   	push   %rbx
  8040f6:	48 83 ec 28          	sub    $0x28,%rsp
  8040fa:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8040fe:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804102:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804109:	00 00 00 
  80410c:	48 8b 00             	mov    (%rax),%rax
  80410f:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  804115:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804118:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80411c:	48 89 c7             	mov    %rax,%rdi
  80411f:	48 b8 63 4b 80 00 00 	movabs $0x804b63,%rax
  804126:	00 00 00 
  804129:	ff d0                	callq  *%rax
  80412b:	89 c3                	mov    %eax,%ebx
  80412d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804131:	48 89 c7             	mov    %rax,%rdi
  804134:	48 b8 63 4b 80 00 00 	movabs $0x804b63,%rax
  80413b:	00 00 00 
  80413e:	ff d0                	callq  *%rax
  804140:	39 c3                	cmp    %eax,%ebx
  804142:	0f 94 c0             	sete   %al
  804145:	0f b6 c0             	movzbl %al,%eax
  804148:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80414b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804152:	00 00 00 
  804155:	48 8b 00             	mov    (%rax),%rax
  804158:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  80415e:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804161:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804164:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804167:	75 05                	jne    80416e <_pipeisclosed+0x7d>
  804169:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80416c:	eb 4a                	jmp    8041b8 <_pipeisclosed+0xc7>
  80416e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804171:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804174:	74 8c                	je     804102 <_pipeisclosed+0x11>
  804176:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  80417a:	75 86                	jne    804102 <_pipeisclosed+0x11>
  80417c:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804183:	00 00 00 
  804186:	48 8b 00             	mov    (%rax),%rax
  804189:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  80418f:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804192:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804195:	89 c6                	mov    %eax,%esi
  804197:	48 bf fb 54 80 00 00 	movabs $0x8054fb,%rdi
  80419e:	00 00 00 
  8041a1:	b8 00 00 00 00       	mov    $0x0,%eax
  8041a6:	49 b8 e6 07 80 00 00 	movabs $0x8007e6,%r8
  8041ad:	00 00 00 
  8041b0:	41 ff d0             	callq  *%r8
  8041b3:	e9 4a ff ff ff       	jmpq   804102 <_pipeisclosed+0x11>
  8041b8:	48 83 c4 28          	add    $0x28,%rsp
  8041bc:	5b                   	pop    %rbx
  8041bd:	5d                   	pop    %rbp
  8041be:	c3                   	retq   

00000000008041bf <pipeisclosed>:
  8041bf:	55                   	push   %rbp
  8041c0:	48 89 e5             	mov    %rsp,%rbp
  8041c3:	48 83 ec 30          	sub    $0x30,%rsp
  8041c7:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8041ca:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8041ce:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8041d1:	48 89 d6             	mov    %rdx,%rsi
  8041d4:	89 c7                	mov    %eax,%edi
  8041d6:	48 b8 a0 27 80 00 00 	movabs $0x8027a0,%rax
  8041dd:	00 00 00 
  8041e0:	ff d0                	callq  *%rax
  8041e2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8041e5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041e9:	79 05                	jns    8041f0 <pipeisclosed+0x31>
  8041eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041ee:	eb 31                	jmp    804221 <pipeisclosed+0x62>
  8041f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8041f4:	48 89 c7             	mov    %rax,%rdi
  8041f7:	48 b8 dd 26 80 00 00 	movabs $0x8026dd,%rax
  8041fe:	00 00 00 
  804201:	ff d0                	callq  *%rax
  804203:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804207:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80420b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80420f:	48 89 d6             	mov    %rdx,%rsi
  804212:	48 89 c7             	mov    %rax,%rdi
  804215:	48 b8 f1 40 80 00 00 	movabs $0x8040f1,%rax
  80421c:	00 00 00 
  80421f:	ff d0                	callq  *%rax
  804221:	c9                   	leaveq 
  804222:	c3                   	retq   

0000000000804223 <devpipe_read>:
  804223:	55                   	push   %rbp
  804224:	48 89 e5             	mov    %rsp,%rbp
  804227:	48 83 ec 40          	sub    $0x40,%rsp
  80422b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80422f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804233:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804237:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80423b:	48 89 c7             	mov    %rax,%rdi
  80423e:	48 b8 dd 26 80 00 00 	movabs $0x8026dd,%rax
  804245:	00 00 00 
  804248:	ff d0                	callq  *%rax
  80424a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80424e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804252:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804256:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80425d:	00 
  80425e:	e9 90 00 00 00       	jmpq   8042f3 <devpipe_read+0xd0>
  804263:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804268:	74 09                	je     804273 <devpipe_read+0x50>
  80426a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80426e:	e9 8e 00 00 00       	jmpq   804301 <devpipe_read+0xde>
  804273:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804277:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80427b:	48 89 d6             	mov    %rdx,%rsi
  80427e:	48 89 c7             	mov    %rax,%rdi
  804281:	48 b8 f1 40 80 00 00 	movabs $0x8040f1,%rax
  804288:	00 00 00 
  80428b:	ff d0                	callq  *%rax
  80428d:	85 c0                	test   %eax,%eax
  80428f:	74 07                	je     804298 <devpipe_read+0x75>
  804291:	b8 00 00 00 00       	mov    $0x0,%eax
  804296:	eb 69                	jmp    804301 <devpipe_read+0xde>
  804298:	48 b8 69 1c 80 00 00 	movabs $0x801c69,%rax
  80429f:	00 00 00 
  8042a2:	ff d0                	callq  *%rax
  8042a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042a8:	8b 10                	mov    (%rax),%edx
  8042aa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042ae:	8b 40 04             	mov    0x4(%rax),%eax
  8042b1:	39 c2                	cmp    %eax,%edx
  8042b3:	74 ae                	je     804263 <devpipe_read+0x40>
  8042b5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8042b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042bd:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8042c1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042c5:	8b 00                	mov    (%rax),%eax
  8042c7:	99                   	cltd   
  8042c8:	c1 ea 1b             	shr    $0x1b,%edx
  8042cb:	01 d0                	add    %edx,%eax
  8042cd:	83 e0 1f             	and    $0x1f,%eax
  8042d0:	29 d0                	sub    %edx,%eax
  8042d2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8042d6:	48 98                	cltq   
  8042d8:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8042dd:	88 01                	mov    %al,(%rcx)
  8042df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042e3:	8b 00                	mov    (%rax),%eax
  8042e5:	8d 50 01             	lea    0x1(%rax),%edx
  8042e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042ec:	89 10                	mov    %edx,(%rax)
  8042ee:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8042f3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042f7:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8042fb:	72 a7                	jb     8042a4 <devpipe_read+0x81>
  8042fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804301:	c9                   	leaveq 
  804302:	c3                   	retq   

0000000000804303 <devpipe_write>:
  804303:	55                   	push   %rbp
  804304:	48 89 e5             	mov    %rsp,%rbp
  804307:	48 83 ec 40          	sub    $0x40,%rsp
  80430b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80430f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804313:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804317:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80431b:	48 89 c7             	mov    %rax,%rdi
  80431e:	48 b8 dd 26 80 00 00 	movabs $0x8026dd,%rax
  804325:	00 00 00 
  804328:	ff d0                	callq  *%rax
  80432a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80432e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804332:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804336:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80433d:	00 
  80433e:	e9 8f 00 00 00       	jmpq   8043d2 <devpipe_write+0xcf>
  804343:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804347:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80434b:	48 89 d6             	mov    %rdx,%rsi
  80434e:	48 89 c7             	mov    %rax,%rdi
  804351:	48 b8 f1 40 80 00 00 	movabs $0x8040f1,%rax
  804358:	00 00 00 
  80435b:	ff d0                	callq  *%rax
  80435d:	85 c0                	test   %eax,%eax
  80435f:	74 07                	je     804368 <devpipe_write+0x65>
  804361:	b8 00 00 00 00       	mov    $0x0,%eax
  804366:	eb 78                	jmp    8043e0 <devpipe_write+0xdd>
  804368:	48 b8 69 1c 80 00 00 	movabs $0x801c69,%rax
  80436f:	00 00 00 
  804372:	ff d0                	callq  *%rax
  804374:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804378:	8b 40 04             	mov    0x4(%rax),%eax
  80437b:	48 63 d0             	movslq %eax,%rdx
  80437e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804382:	8b 00                	mov    (%rax),%eax
  804384:	48 98                	cltq   
  804386:	48 83 c0 20          	add    $0x20,%rax
  80438a:	48 39 c2             	cmp    %rax,%rdx
  80438d:	73 b4                	jae    804343 <devpipe_write+0x40>
  80438f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804393:	8b 40 04             	mov    0x4(%rax),%eax
  804396:	99                   	cltd   
  804397:	c1 ea 1b             	shr    $0x1b,%edx
  80439a:	01 d0                	add    %edx,%eax
  80439c:	83 e0 1f             	and    $0x1f,%eax
  80439f:	29 d0                	sub    %edx,%eax
  8043a1:	89 c6                	mov    %eax,%esi
  8043a3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8043a7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043ab:	48 01 d0             	add    %rdx,%rax
  8043ae:	0f b6 08             	movzbl (%rax),%ecx
  8043b1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8043b5:	48 63 c6             	movslq %esi,%rax
  8043b8:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8043bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043c0:	8b 40 04             	mov    0x4(%rax),%eax
  8043c3:	8d 50 01             	lea    0x1(%rax),%edx
  8043c6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043ca:	89 50 04             	mov    %edx,0x4(%rax)
  8043cd:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8043d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043d6:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8043da:	72 98                	jb     804374 <devpipe_write+0x71>
  8043dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043e0:	c9                   	leaveq 
  8043e1:	c3                   	retq   

00000000008043e2 <devpipe_stat>:
  8043e2:	55                   	push   %rbp
  8043e3:	48 89 e5             	mov    %rsp,%rbp
  8043e6:	48 83 ec 20          	sub    $0x20,%rsp
  8043ea:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8043ee:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8043f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043f6:	48 89 c7             	mov    %rax,%rdi
  8043f9:	48 b8 dd 26 80 00 00 	movabs $0x8026dd,%rax
  804400:	00 00 00 
  804403:	ff d0                	callq  *%rax
  804405:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804409:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80440d:	48 be 0e 55 80 00 00 	movabs $0x80550e,%rsi
  804414:	00 00 00 
  804417:	48 89 c7             	mov    %rax,%rdi
  80441a:	48 b8 76 13 80 00 00 	movabs $0x801376,%rax
  804421:	00 00 00 
  804424:	ff d0                	callq  *%rax
  804426:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80442a:	8b 50 04             	mov    0x4(%rax),%edx
  80442d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804431:	8b 00                	mov    (%rax),%eax
  804433:	29 c2                	sub    %eax,%edx
  804435:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804439:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80443f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804443:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80444a:	00 00 00 
  80444d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804451:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  804458:	00 00 00 
  80445b:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804462:	b8 00 00 00 00       	mov    $0x0,%eax
  804467:	c9                   	leaveq 
  804468:	c3                   	retq   

0000000000804469 <devpipe_close>:
  804469:	55                   	push   %rbp
  80446a:	48 89 e5             	mov    %rsp,%rbp
  80446d:	48 83 ec 10          	sub    $0x10,%rsp
  804471:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804475:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804479:	48 89 c6             	mov    %rax,%rsi
  80447c:	bf 00 00 00 00       	mov    $0x0,%edi
  804481:	48 b8 58 1d 80 00 00 	movabs $0x801d58,%rax
  804488:	00 00 00 
  80448b:	ff d0                	callq  *%rax
  80448d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804491:	48 89 c7             	mov    %rax,%rdi
  804494:	48 b8 dd 26 80 00 00 	movabs $0x8026dd,%rax
  80449b:	00 00 00 
  80449e:	ff d0                	callq  *%rax
  8044a0:	48 89 c6             	mov    %rax,%rsi
  8044a3:	bf 00 00 00 00       	mov    $0x0,%edi
  8044a8:	48 b8 58 1d 80 00 00 	movabs $0x801d58,%rax
  8044af:	00 00 00 
  8044b2:	ff d0                	callq  *%rax
  8044b4:	c9                   	leaveq 
  8044b5:	c3                   	retq   

00000000008044b6 <wait>:
  8044b6:	55                   	push   %rbp
  8044b7:	48 89 e5             	mov    %rsp,%rbp
  8044ba:	48 83 ec 20          	sub    $0x20,%rsp
  8044be:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8044c1:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8044c5:	75 35                	jne    8044fc <wait+0x46>
  8044c7:	48 b9 15 55 80 00 00 	movabs $0x805515,%rcx
  8044ce:	00 00 00 
  8044d1:	48 ba 20 55 80 00 00 	movabs $0x805520,%rdx
  8044d8:	00 00 00 
  8044db:	be 0a 00 00 00       	mov    $0xa,%esi
  8044e0:	48 bf 35 55 80 00 00 	movabs $0x805535,%rdi
  8044e7:	00 00 00 
  8044ea:	b8 00 00 00 00       	mov    $0x0,%eax
  8044ef:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  8044f6:	00 00 00 
  8044f9:	41 ff d0             	callq  *%r8
  8044fc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8044ff:	25 ff 03 00 00       	and    $0x3ff,%eax
  804504:	48 98                	cltq   
  804506:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80450d:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804514:	00 00 00 
  804517:	48 01 d0             	add    %rdx,%rax
  80451a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80451e:	eb 0c                	jmp    80452c <wait+0x76>
  804520:	48 b8 69 1c 80 00 00 	movabs $0x801c69,%rax
  804527:	00 00 00 
  80452a:	ff d0                	callq  *%rax
  80452c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804530:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804536:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804539:	75 0e                	jne    804549 <wait+0x93>
  80453b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80453f:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  804545:	85 c0                	test   %eax,%eax
  804547:	75 d7                	jne    804520 <wait+0x6a>
  804549:	90                   	nop
  80454a:	c9                   	leaveq 
  80454b:	c3                   	retq   

000000000080454c <cputchar>:
  80454c:	55                   	push   %rbp
  80454d:	48 89 e5             	mov    %rsp,%rbp
  804550:	48 83 ec 20          	sub    $0x20,%rsp
  804554:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804557:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80455a:	88 45 ff             	mov    %al,-0x1(%rbp)
  80455d:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804561:	be 01 00 00 00       	mov    $0x1,%esi
  804566:	48 89 c7             	mov    %rax,%rdi
  804569:	48 b8 5e 1b 80 00 00 	movabs $0x801b5e,%rax
  804570:	00 00 00 
  804573:	ff d0                	callq  *%rax
  804575:	90                   	nop
  804576:	c9                   	leaveq 
  804577:	c3                   	retq   

0000000000804578 <getchar>:
  804578:	55                   	push   %rbp
  804579:	48 89 e5             	mov    %rsp,%rbp
  80457c:	48 83 ec 10          	sub    $0x10,%rsp
  804580:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804584:	ba 01 00 00 00       	mov    $0x1,%edx
  804589:	48 89 c6             	mov    %rax,%rsi
  80458c:	bf 00 00 00 00       	mov    $0x0,%edi
  804591:	48 b8 d5 2b 80 00 00 	movabs $0x802bd5,%rax
  804598:	00 00 00 
  80459b:	ff d0                	callq  *%rax
  80459d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8045a0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8045a4:	79 05                	jns    8045ab <getchar+0x33>
  8045a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045a9:	eb 14                	jmp    8045bf <getchar+0x47>
  8045ab:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8045af:	7f 07                	jg     8045b8 <getchar+0x40>
  8045b1:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  8045b6:	eb 07                	jmp    8045bf <getchar+0x47>
  8045b8:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  8045bc:	0f b6 c0             	movzbl %al,%eax
  8045bf:	c9                   	leaveq 
  8045c0:	c3                   	retq   

00000000008045c1 <iscons>:
  8045c1:	55                   	push   %rbp
  8045c2:	48 89 e5             	mov    %rsp,%rbp
  8045c5:	48 83 ec 20          	sub    $0x20,%rsp
  8045c9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8045cc:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8045d0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8045d3:	48 89 d6             	mov    %rdx,%rsi
  8045d6:	89 c7                	mov    %eax,%edi
  8045d8:	48 b8 a0 27 80 00 00 	movabs $0x8027a0,%rax
  8045df:	00 00 00 
  8045e2:	ff d0                	callq  *%rax
  8045e4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8045e7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8045eb:	79 05                	jns    8045f2 <iscons+0x31>
  8045ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045f0:	eb 1a                	jmp    80460c <iscons+0x4b>
  8045f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045f6:	8b 10                	mov    (%rax),%edx
  8045f8:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  8045ff:	00 00 00 
  804602:	8b 00                	mov    (%rax),%eax
  804604:	39 c2                	cmp    %eax,%edx
  804606:	0f 94 c0             	sete   %al
  804609:	0f b6 c0             	movzbl %al,%eax
  80460c:	c9                   	leaveq 
  80460d:	c3                   	retq   

000000000080460e <opencons>:
  80460e:	55                   	push   %rbp
  80460f:	48 89 e5             	mov    %rsp,%rbp
  804612:	48 83 ec 10          	sub    $0x10,%rsp
  804616:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80461a:	48 89 c7             	mov    %rax,%rdi
  80461d:	48 b8 08 27 80 00 00 	movabs $0x802708,%rax
  804624:	00 00 00 
  804627:	ff d0                	callq  *%rax
  804629:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80462c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804630:	79 05                	jns    804637 <opencons+0x29>
  804632:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804635:	eb 5b                	jmp    804692 <opencons+0x84>
  804637:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80463b:	ba 07 04 00 00       	mov    $0x407,%edx
  804640:	48 89 c6             	mov    %rax,%rsi
  804643:	bf 00 00 00 00       	mov    $0x0,%edi
  804648:	48 b8 a6 1c 80 00 00 	movabs $0x801ca6,%rax
  80464f:	00 00 00 
  804652:	ff d0                	callq  *%rax
  804654:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804657:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80465b:	79 05                	jns    804662 <opencons+0x54>
  80465d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804660:	eb 30                	jmp    804692 <opencons+0x84>
  804662:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804666:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  80466d:	00 00 00 
  804670:	8b 12                	mov    (%rdx),%edx
  804672:	89 10                	mov    %edx,(%rax)
  804674:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804678:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80467f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804683:	48 89 c7             	mov    %rax,%rdi
  804686:	48 b8 ba 26 80 00 00 	movabs $0x8026ba,%rax
  80468d:	00 00 00 
  804690:	ff d0                	callq  *%rax
  804692:	c9                   	leaveq 
  804693:	c3                   	retq   

0000000000804694 <devcons_read>:
  804694:	55                   	push   %rbp
  804695:	48 89 e5             	mov    %rsp,%rbp
  804698:	48 83 ec 30          	sub    $0x30,%rsp
  80469c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8046a0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8046a4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8046a8:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8046ad:	75 13                	jne    8046c2 <devcons_read+0x2e>
  8046af:	b8 00 00 00 00       	mov    $0x0,%eax
  8046b4:	eb 49                	jmp    8046ff <devcons_read+0x6b>
  8046b6:	48 b8 69 1c 80 00 00 	movabs $0x801c69,%rax
  8046bd:	00 00 00 
  8046c0:	ff d0                	callq  *%rax
  8046c2:	48 b8 ab 1b 80 00 00 	movabs $0x801bab,%rax
  8046c9:	00 00 00 
  8046cc:	ff d0                	callq  *%rax
  8046ce:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046d1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046d5:	74 df                	je     8046b6 <devcons_read+0x22>
  8046d7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046db:	79 05                	jns    8046e2 <devcons_read+0x4e>
  8046dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046e0:	eb 1d                	jmp    8046ff <devcons_read+0x6b>
  8046e2:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  8046e6:	75 07                	jne    8046ef <devcons_read+0x5b>
  8046e8:	b8 00 00 00 00       	mov    $0x0,%eax
  8046ed:	eb 10                	jmp    8046ff <devcons_read+0x6b>
  8046ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046f2:	89 c2                	mov    %eax,%edx
  8046f4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046f8:	88 10                	mov    %dl,(%rax)
  8046fa:	b8 01 00 00 00       	mov    $0x1,%eax
  8046ff:	c9                   	leaveq 
  804700:	c3                   	retq   

0000000000804701 <devcons_write>:
  804701:	55                   	push   %rbp
  804702:	48 89 e5             	mov    %rsp,%rbp
  804705:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80470c:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804713:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  80471a:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804721:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804728:	eb 76                	jmp    8047a0 <devcons_write+0x9f>
  80472a:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804731:	89 c2                	mov    %eax,%edx
  804733:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804736:	29 c2                	sub    %eax,%edx
  804738:	89 d0                	mov    %edx,%eax
  80473a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80473d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804740:	83 f8 7f             	cmp    $0x7f,%eax
  804743:	76 07                	jbe    80474c <devcons_write+0x4b>
  804745:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  80474c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80474f:	48 63 d0             	movslq %eax,%rdx
  804752:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804755:	48 63 c8             	movslq %eax,%rcx
  804758:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  80475f:	48 01 c1             	add    %rax,%rcx
  804762:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804769:	48 89 ce             	mov    %rcx,%rsi
  80476c:	48 89 c7             	mov    %rax,%rdi
  80476f:	48 b8 9b 16 80 00 00 	movabs $0x80169b,%rax
  804776:	00 00 00 
  804779:	ff d0                	callq  *%rax
  80477b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80477e:	48 63 d0             	movslq %eax,%rdx
  804781:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804788:	48 89 d6             	mov    %rdx,%rsi
  80478b:	48 89 c7             	mov    %rax,%rdi
  80478e:	48 b8 5e 1b 80 00 00 	movabs $0x801b5e,%rax
  804795:	00 00 00 
  804798:	ff d0                	callq  *%rax
  80479a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80479d:	01 45 fc             	add    %eax,-0x4(%rbp)
  8047a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047a3:	48 98                	cltq   
  8047a5:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8047ac:	0f 82 78 ff ff ff    	jb     80472a <devcons_write+0x29>
  8047b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047b5:	c9                   	leaveq 
  8047b6:	c3                   	retq   

00000000008047b7 <devcons_close>:
  8047b7:	55                   	push   %rbp
  8047b8:	48 89 e5             	mov    %rsp,%rbp
  8047bb:	48 83 ec 08          	sub    $0x8,%rsp
  8047bf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8047c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8047c8:	c9                   	leaveq 
  8047c9:	c3                   	retq   

00000000008047ca <devcons_stat>:
  8047ca:	55                   	push   %rbp
  8047cb:	48 89 e5             	mov    %rsp,%rbp
  8047ce:	48 83 ec 10          	sub    $0x10,%rsp
  8047d2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8047d6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8047da:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8047de:	48 be 48 55 80 00 00 	movabs $0x805548,%rsi
  8047e5:	00 00 00 
  8047e8:	48 89 c7             	mov    %rax,%rdi
  8047eb:	48 b8 76 13 80 00 00 	movabs $0x801376,%rax
  8047f2:	00 00 00 
  8047f5:	ff d0                	callq  *%rax
  8047f7:	b8 00 00 00 00       	mov    $0x0,%eax
  8047fc:	c9                   	leaveq 
  8047fd:	c3                   	retq   

00000000008047fe <set_pgfault_handler>:
  8047fe:	55                   	push   %rbp
  8047ff:	48 89 e5             	mov    %rsp,%rbp
  804802:	48 83 ec 20          	sub    $0x20,%rsp
  804806:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80480a:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804811:	00 00 00 
  804814:	48 8b 00             	mov    (%rax),%rax
  804817:	48 85 c0             	test   %rax,%rax
  80481a:	75 6f                	jne    80488b <set_pgfault_handler+0x8d>
  80481c:	ba 07 00 00 00       	mov    $0x7,%edx
  804821:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  804826:	bf 00 00 00 00       	mov    $0x0,%edi
  80482b:	48 b8 a6 1c 80 00 00 	movabs $0x801ca6,%rax
  804832:	00 00 00 
  804835:	ff d0                	callq  *%rax
  804837:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80483a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80483e:	79 30                	jns    804870 <set_pgfault_handler+0x72>
  804840:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804843:	89 c1                	mov    %eax,%ecx
  804845:	48 ba 50 55 80 00 00 	movabs $0x805550,%rdx
  80484c:	00 00 00 
  80484f:	be 22 00 00 00       	mov    $0x22,%esi
  804854:	48 bf 6f 55 80 00 00 	movabs $0x80556f,%rdi
  80485b:	00 00 00 
  80485e:	b8 00 00 00 00       	mov    $0x0,%eax
  804863:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  80486a:	00 00 00 
  80486d:	41 ff d0             	callq  *%r8
  804870:	48 be 9f 48 80 00 00 	movabs $0x80489f,%rsi
  804877:	00 00 00 
  80487a:	bf 00 00 00 00       	mov    $0x0,%edi
  80487f:	48 b8 3d 1e 80 00 00 	movabs $0x801e3d,%rax
  804886:	00 00 00 
  804889:	ff d0                	callq  *%rax
  80488b:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804892:	00 00 00 
  804895:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804899:	48 89 10             	mov    %rdx,(%rax)
  80489c:	90                   	nop
  80489d:	c9                   	leaveq 
  80489e:	c3                   	retq   

000000000080489f <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  80489f:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  8048a2:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  8048a9:	00 00 00 
call *%rax
  8048ac:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  8048ae:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  8048b5:	00 08 
    movq 152(%rsp), %rax
  8048b7:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  8048be:	00 
    movq 136(%rsp), %rbx
  8048bf:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  8048c6:	00 
movq %rbx, (%rax)
  8048c7:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  8048ca:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  8048ce:	4c 8b 3c 24          	mov    (%rsp),%r15
  8048d2:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  8048d7:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  8048dc:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  8048e1:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  8048e6:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  8048eb:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  8048f0:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  8048f5:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  8048fa:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  8048ff:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  804904:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  804909:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  80490e:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  804913:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  804918:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  80491c:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  804920:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  804921:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  804926:	c3                   	retq   

0000000000804927 <ipc_recv>:
  804927:	55                   	push   %rbp
  804928:	48 89 e5             	mov    %rsp,%rbp
  80492b:	48 83 ec 30          	sub    $0x30,%rsp
  80492f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804933:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804937:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80493b:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804940:	75 0e                	jne    804950 <ipc_recv+0x29>
  804942:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804949:	00 00 00 
  80494c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804950:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804954:	48 89 c7             	mov    %rax,%rdi
  804957:	48 b8 e0 1e 80 00 00 	movabs $0x801ee0,%rax
  80495e:	00 00 00 
  804961:	ff d0                	callq  *%rax
  804963:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804966:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80496a:	79 27                	jns    804993 <ipc_recv+0x6c>
  80496c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804971:	74 0a                	je     80497d <ipc_recv+0x56>
  804973:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804977:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80497d:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804982:	74 0a                	je     80498e <ipc_recv+0x67>
  804984:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804988:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80498e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804991:	eb 53                	jmp    8049e6 <ipc_recv+0xbf>
  804993:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804998:	74 19                	je     8049b3 <ipc_recv+0x8c>
  80499a:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8049a1:	00 00 00 
  8049a4:	48 8b 00             	mov    (%rax),%rax
  8049a7:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8049ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8049b1:	89 10                	mov    %edx,(%rax)
  8049b3:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8049b8:	74 19                	je     8049d3 <ipc_recv+0xac>
  8049ba:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8049c1:	00 00 00 
  8049c4:	48 8b 00             	mov    (%rax),%rax
  8049c7:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8049cd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8049d1:	89 10                	mov    %edx,(%rax)
  8049d3:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8049da:	00 00 00 
  8049dd:	48 8b 00             	mov    (%rax),%rax
  8049e0:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8049e6:	c9                   	leaveq 
  8049e7:	c3                   	retq   

00000000008049e8 <ipc_send>:
  8049e8:	55                   	push   %rbp
  8049e9:	48 89 e5             	mov    %rsp,%rbp
  8049ec:	48 83 ec 30          	sub    $0x30,%rsp
  8049f0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8049f3:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8049f6:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  8049fa:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8049fd:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804a02:	75 1c                	jne    804a20 <ipc_send+0x38>
  804a04:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804a0b:	00 00 00 
  804a0e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804a12:	eb 0c                	jmp    804a20 <ipc_send+0x38>
  804a14:	48 b8 69 1c 80 00 00 	movabs $0x801c69,%rax
  804a1b:	00 00 00 
  804a1e:	ff d0                	callq  *%rax
  804a20:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804a23:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804a26:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804a2a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804a2d:	89 c7                	mov    %eax,%edi
  804a2f:	48 b8 89 1e 80 00 00 	movabs $0x801e89,%rax
  804a36:	00 00 00 
  804a39:	ff d0                	callq  *%rax
  804a3b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804a3e:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804a42:	74 d0                	je     804a14 <ipc_send+0x2c>
  804a44:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804a48:	79 30                	jns    804a7a <ipc_send+0x92>
  804a4a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a4d:	89 c1                	mov    %eax,%ecx
  804a4f:	48 ba 80 55 80 00 00 	movabs $0x805580,%rdx
  804a56:	00 00 00 
  804a59:	be 44 00 00 00       	mov    $0x44,%esi
  804a5e:	48 bf 96 55 80 00 00 	movabs $0x805596,%rdi
  804a65:	00 00 00 
  804a68:	b8 00 00 00 00       	mov    $0x0,%eax
  804a6d:	49 b8 ac 05 80 00 00 	movabs $0x8005ac,%r8
  804a74:	00 00 00 
  804a77:	41 ff d0             	callq  *%r8
  804a7a:	90                   	nop
  804a7b:	c9                   	leaveq 
  804a7c:	c3                   	retq   

0000000000804a7d <ipc_host_recv>:
  804a7d:	55                   	push   %rbp
  804a7e:	48 89 e5             	mov    %rsp,%rbp
  804a81:	48 83 ec 10          	sub    $0x10,%rsp
  804a85:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804a89:	48 ba a8 55 80 00 00 	movabs $0x8055a8,%rdx
  804a90:	00 00 00 
  804a93:	be 4e 00 00 00       	mov    $0x4e,%esi
  804a98:	48 bf 96 55 80 00 00 	movabs $0x805596,%rdi
  804a9f:	00 00 00 
  804aa2:	b8 00 00 00 00       	mov    $0x0,%eax
  804aa7:	48 b9 ac 05 80 00 00 	movabs $0x8005ac,%rcx
  804aae:	00 00 00 
  804ab1:	ff d1                	callq  *%rcx

0000000000804ab3 <ipc_host_send>:
  804ab3:	55                   	push   %rbp
  804ab4:	48 89 e5             	mov    %rsp,%rbp
  804ab7:	48 83 ec 20          	sub    $0x20,%rsp
  804abb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804abe:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804ac1:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  804ac5:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804ac8:	48 ba c8 55 80 00 00 	movabs $0x8055c8,%rdx
  804acf:	00 00 00 
  804ad2:	be 58 00 00 00       	mov    $0x58,%esi
  804ad7:	48 bf 96 55 80 00 00 	movabs $0x805596,%rdi
  804ade:	00 00 00 
  804ae1:	b8 00 00 00 00       	mov    $0x0,%eax
  804ae6:	48 b9 ac 05 80 00 00 	movabs $0x8005ac,%rcx
  804aed:	00 00 00 
  804af0:	ff d1                	callq  *%rcx

0000000000804af2 <ipc_find_env>:
  804af2:	55                   	push   %rbp
  804af3:	48 89 e5             	mov    %rsp,%rbp
  804af6:	48 83 ec 18          	sub    $0x18,%rsp
  804afa:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804afd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804b04:	eb 4d                	jmp    804b53 <ipc_find_env+0x61>
  804b06:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804b0d:	00 00 00 
  804b10:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b13:	48 98                	cltq   
  804b15:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804b1c:	48 01 d0             	add    %rdx,%rax
  804b1f:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804b25:	8b 00                	mov    (%rax),%eax
  804b27:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804b2a:	75 23                	jne    804b4f <ipc_find_env+0x5d>
  804b2c:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804b33:	00 00 00 
  804b36:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b39:	48 98                	cltq   
  804b3b:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804b42:	48 01 d0             	add    %rdx,%rax
  804b45:	48 05 c8 00 00 00    	add    $0xc8,%rax
  804b4b:	8b 00                	mov    (%rax),%eax
  804b4d:	eb 12                	jmp    804b61 <ipc_find_env+0x6f>
  804b4f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804b53:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804b5a:	7e aa                	jle    804b06 <ipc_find_env+0x14>
  804b5c:	b8 00 00 00 00       	mov    $0x0,%eax
  804b61:	c9                   	leaveq 
  804b62:	c3                   	retq   

0000000000804b63 <pageref>:
  804b63:	55                   	push   %rbp
  804b64:	48 89 e5             	mov    %rsp,%rbp
  804b67:	48 83 ec 18          	sub    $0x18,%rsp
  804b6b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804b6f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804b73:	48 c1 e8 15          	shr    $0x15,%rax
  804b77:	48 89 c2             	mov    %rax,%rdx
  804b7a:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804b81:	01 00 00 
  804b84:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804b88:	83 e0 01             	and    $0x1,%eax
  804b8b:	48 85 c0             	test   %rax,%rax
  804b8e:	75 07                	jne    804b97 <pageref+0x34>
  804b90:	b8 00 00 00 00       	mov    $0x0,%eax
  804b95:	eb 56                	jmp    804bed <pageref+0x8a>
  804b97:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804b9b:	48 c1 e8 0c          	shr    $0xc,%rax
  804b9f:	48 89 c2             	mov    %rax,%rdx
  804ba2:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804ba9:	01 00 00 
  804bac:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804bb0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804bb4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804bb8:	83 e0 01             	and    $0x1,%eax
  804bbb:	48 85 c0             	test   %rax,%rax
  804bbe:	75 07                	jne    804bc7 <pageref+0x64>
  804bc0:	b8 00 00 00 00       	mov    $0x0,%eax
  804bc5:	eb 26                	jmp    804bed <pageref+0x8a>
  804bc7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804bcb:	48 c1 e8 0c          	shr    $0xc,%rax
  804bcf:	48 89 c2             	mov    %rax,%rdx
  804bd2:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804bd9:	00 00 00 
  804bdc:	48 c1 e2 04          	shl    $0x4,%rdx
  804be0:	48 01 d0             	add    %rdx,%rax
  804be3:	48 83 c0 08          	add    $0x8,%rax
  804be7:	0f b7 00             	movzwl (%rax),%eax
  804bea:	0f b7 c0             	movzwl %ax,%eax
  804bed:	c9                   	leaveq 
  804bee:	c3                   	retq   
