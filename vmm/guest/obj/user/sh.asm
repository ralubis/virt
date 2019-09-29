
vmm/guest/obj/user/sh:     file format elf64-x86-64


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
  80003c:	e8 39 12 00 00       	callq  80127a <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <runcmd>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 81 ec 60 05 00 00 	sub    $0x560,%rsp
  80004e:	48 89 bd a8 fa ff ff 	mov    %rdi,-0x558(%rbp)
  800055:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  80005c:	48 8b 85 a8 fa ff ff 	mov    -0x558(%rbp),%rax
  800063:	be 00 00 00 00       	mov    $0x0,%esi
  800068:	48 89 c7             	mov    %rax,%rdi
  80006b:	48 b8 63 0a 80 00 00 	movabs $0x800a63,%rax
  800072:	00 00 00 
  800075:	ff d0                	callq  *%rax
  800077:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80007e:	48 8d 85 58 ff ff ff 	lea    -0xa8(%rbp),%rax
  800085:	48 89 c6             	mov    %rax,%rsi
  800088:	bf 00 00 00 00       	mov    $0x0,%edi
  80008d:	48 b8 63 0a 80 00 00 	movabs $0x800a63,%rax
  800094:	00 00 00 
  800097:	ff d0                	callq  *%rax
  800099:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80009c:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80009f:	83 f8 3e             	cmp    $0x3e,%eax
  8000a2:	0f 84 4b 01 00 00    	je     8001f3 <runcmd+0x1b0>
  8000a8:	83 f8 3e             	cmp    $0x3e,%eax
  8000ab:	7f 12                	jg     8000bf <runcmd+0x7c>
  8000ad:	85 c0                	test   %eax,%eax
  8000af:	0f 84 be 03 00 00    	je     800473 <runcmd+0x430>
  8000b5:	83 f8 3c             	cmp    $0x3c,%eax
  8000b8:	74 64                	je     80011e <runcmd+0xdb>
  8000ba:	e9 78 03 00 00       	jmpq   800437 <runcmd+0x3f4>
  8000bf:	83 f8 77             	cmp    $0x77,%eax
  8000c2:	74 0e                	je     8000d2 <runcmd+0x8f>
  8000c4:	83 f8 7c             	cmp    $0x7c,%eax
  8000c7:	0f 84 fb 01 00 00    	je     8002c8 <runcmd+0x285>
  8000cd:	e9 65 03 00 00       	jmpq   800437 <runcmd+0x3f4>
  8000d2:	83 7d fc 10          	cmpl   $0x10,-0x4(%rbp)
  8000d6:	75 27                	jne    8000ff <runcmd+0xbc>
  8000d8:	48 bf 88 69 80 00 00 	movabs $0x806988,%rdi
  8000df:	00 00 00 
  8000e2:	b8 00 00 00 00       	mov    $0x0,%eax
  8000e7:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  8000ee:	00 00 00 
  8000f1:	ff d2                	callq  *%rdx
  8000f3:	48 b8 fe 12 80 00 00 	movabs $0x8012fe,%rax
  8000fa:	00 00 00 
  8000fd:	ff d0                	callq  *%rax
  8000ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800102:	8d 50 01             	lea    0x1(%rax),%edx
  800105:	89 55 fc             	mov    %edx,-0x4(%rbp)
  800108:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
  80010f:	48 98                	cltq   
  800111:	48 89 94 c5 60 ff ff 	mov    %rdx,-0xa0(%rbp,%rax,8)
  800118:	ff 
  800119:	e9 50 03 00 00       	jmpq   80046e <runcmd+0x42b>
  80011e:	48 8d 85 58 ff ff ff 	lea    -0xa8(%rbp),%rax
  800125:	48 89 c6             	mov    %rax,%rsi
  800128:	bf 00 00 00 00       	mov    $0x0,%edi
  80012d:	48 b8 63 0a 80 00 00 	movabs $0x800a63,%rax
  800134:	00 00 00 
  800137:	ff d0                	callq  *%rax
  800139:	83 f8 77             	cmp    $0x77,%eax
  80013c:	74 27                	je     800165 <runcmd+0x122>
  80013e:	48 bf a0 69 80 00 00 	movabs $0x8069a0,%rdi
  800145:	00 00 00 
  800148:	b8 00 00 00 00       	mov    $0x0,%eax
  80014d:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  800154:	00 00 00 
  800157:	ff d2                	callq  *%rdx
  800159:	48 b8 fe 12 80 00 00 	movabs $0x8012fe,%rax
  800160:	00 00 00 
  800163:	ff d0                	callq  *%rax
  800165:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  80016c:	be 00 00 00 00       	mov    $0x0,%esi
  800171:	48 89 c7             	mov    %rax,%rdi
  800174:	48 b8 61 42 80 00 00 	movabs $0x804261,%rax
  80017b:	00 00 00 
  80017e:	ff d0                	callq  *%rax
  800180:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800183:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800187:	79 34                	jns    8001bd <runcmd+0x17a>
  800189:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  800190:	8b 55 ec             	mov    -0x14(%rbp),%edx
  800193:	48 89 c6             	mov    %rax,%rsi
  800196:	48 bf c6 69 80 00 00 	movabs $0x8069c6,%rdi
  80019d:	00 00 00 
  8001a0:	b8 00 00 00 00       	mov    $0x0,%eax
  8001a5:	48 b9 5c 15 80 00 00 	movabs $0x80155c,%rcx
  8001ac:	00 00 00 
  8001af:	ff d1                	callq  *%rcx
  8001b1:	48 b8 fe 12 80 00 00 	movabs $0x8012fe,%rax
  8001b8:	00 00 00 
  8001bb:	ff d0                	callq  *%rax
  8001bd:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8001c1:	0f 84 a0 02 00 00    	je     800467 <runcmd+0x424>
  8001c7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8001ca:	be 00 00 00 00       	mov    $0x0,%esi
  8001cf:	89 c7                	mov    %eax,%edi
  8001d1:	48 b8 df 3b 80 00 00 	movabs $0x803bdf,%rax
  8001d8:	00 00 00 
  8001db:	ff d0                	callq  *%rax
  8001dd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8001e0:	89 c7                	mov    %eax,%edi
  8001e2:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  8001e9:	00 00 00 
  8001ec:	ff d0                	callq  *%rax
  8001ee:	e9 74 02 00 00       	jmpq   800467 <runcmd+0x424>
  8001f3:	48 8d 85 58 ff ff ff 	lea    -0xa8(%rbp),%rax
  8001fa:	48 89 c6             	mov    %rax,%rsi
  8001fd:	bf 00 00 00 00       	mov    $0x0,%edi
  800202:	48 b8 63 0a 80 00 00 	movabs $0x800a63,%rax
  800209:	00 00 00 
  80020c:	ff d0                	callq  *%rax
  80020e:	83 f8 77             	cmp    $0x77,%eax
  800211:	74 27                	je     80023a <runcmd+0x1f7>
  800213:	48 bf e0 69 80 00 00 	movabs $0x8069e0,%rdi
  80021a:	00 00 00 
  80021d:	b8 00 00 00 00       	mov    $0x0,%eax
  800222:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  800229:	00 00 00 
  80022c:	ff d2                	callq  *%rdx
  80022e:	48 b8 fe 12 80 00 00 	movabs $0x8012fe,%rax
  800235:	00 00 00 
  800238:	ff d0                	callq  *%rax
  80023a:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  800241:	be 01 03 00 00       	mov    $0x301,%esi
  800246:	48 89 c7             	mov    %rax,%rdi
  800249:	48 b8 61 42 80 00 00 	movabs $0x804261,%rax
  800250:	00 00 00 
  800253:	ff d0                	callq  *%rax
  800255:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800258:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80025c:	79 34                	jns    800292 <runcmd+0x24f>
  80025e:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  800265:	8b 55 ec             	mov    -0x14(%rbp),%edx
  800268:	48 89 c6             	mov    %rax,%rsi
  80026b:	48 bf 06 6a 80 00 00 	movabs $0x806a06,%rdi
  800272:	00 00 00 
  800275:	b8 00 00 00 00       	mov    $0x0,%eax
  80027a:	48 b9 5c 15 80 00 00 	movabs $0x80155c,%rcx
  800281:	00 00 00 
  800284:	ff d1                	callq  *%rcx
  800286:	48 b8 fe 12 80 00 00 	movabs $0x8012fe,%rax
  80028d:	00 00 00 
  800290:	ff d0                	callq  *%rax
  800292:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
  800296:	0f 84 d1 01 00 00    	je     80046d <runcmd+0x42a>
  80029c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80029f:	be 01 00 00 00       	mov    $0x1,%esi
  8002a4:	89 c7                	mov    %eax,%edi
  8002a6:	48 b8 df 3b 80 00 00 	movabs $0x803bdf,%rax
  8002ad:	00 00 00 
  8002b0:	ff d0                	callq  *%rax
  8002b2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8002b5:	89 c7                	mov    %eax,%edi
  8002b7:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  8002be:	00 00 00 
  8002c1:	ff d0                	callq  *%rax
  8002c3:	e9 a5 01 00 00       	jmpq   80046d <runcmd+0x42a>
  8002c8:	48 8d 85 48 fb ff ff 	lea    -0x4b8(%rbp),%rax
  8002cf:	48 89 c7             	mov    %rax,%rdi
  8002d2:	48 b8 20 5f 80 00 00 	movabs $0x805f20,%rax
  8002d9:	00 00 00 
  8002dc:	ff d0                	callq  *%rax
  8002de:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8002e1:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8002e5:	79 2c                	jns    800313 <runcmd+0x2d0>
  8002e7:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8002ea:	89 c6                	mov    %eax,%esi
  8002ec:	48 bf 1c 6a 80 00 00 	movabs $0x806a1c,%rdi
  8002f3:	00 00 00 
  8002f6:	b8 00 00 00 00       	mov    $0x0,%eax
  8002fb:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  800302:	00 00 00 
  800305:	ff d2                	callq  *%rdx
  800307:	48 b8 fe 12 80 00 00 	movabs $0x8012fe,%rax
  80030e:	00 00 00 
  800311:	ff d0                	callq  *%rax
  800313:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80031a:	00 00 00 
  80031d:	8b 00                	mov    (%rax),%eax
  80031f:	85 c0                	test   %eax,%eax
  800321:	74 29                	je     80034c <runcmd+0x309>
  800323:	8b 95 4c fb ff ff    	mov    -0x4b4(%rbp),%edx
  800329:	8b 85 48 fb ff ff    	mov    -0x4b8(%rbp),%eax
  80032f:	89 c6                	mov    %eax,%esi
  800331:	48 bf 25 6a 80 00 00 	movabs $0x806a25,%rdi
  800338:	00 00 00 
  80033b:	b8 00 00 00 00       	mov    $0x0,%eax
  800340:	48 b9 5c 15 80 00 00 	movabs $0x80155c,%rcx
  800347:	00 00 00 
  80034a:	ff d1                	callq  *%rcx
  80034c:	48 b8 17 33 80 00 00 	movabs $0x803317,%rax
  800353:	00 00 00 
  800356:	ff d0                	callq  *%rax
  800358:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80035b:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80035f:	79 2c                	jns    80038d <runcmd+0x34a>
  800361:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800364:	89 c6                	mov    %eax,%esi
  800366:	48 bf 32 6a 80 00 00 	movabs $0x806a32,%rdi
  80036d:	00 00 00 
  800370:	b8 00 00 00 00       	mov    $0x0,%eax
  800375:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  80037c:	00 00 00 
  80037f:	ff d2                	callq  *%rdx
  800381:	48 b8 fe 12 80 00 00 	movabs $0x8012fe,%rax
  800388:	00 00 00 
  80038b:	ff d0                	callq  *%rax
  80038d:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  800391:	75 50                	jne    8003e3 <runcmd+0x3a0>
  800393:	8b 85 48 fb ff ff    	mov    -0x4b8(%rbp),%eax
  800399:	85 c0                	test   %eax,%eax
  80039b:	74 2d                	je     8003ca <runcmd+0x387>
  80039d:	8b 85 48 fb ff ff    	mov    -0x4b8(%rbp),%eax
  8003a3:	be 00 00 00 00       	mov    $0x0,%esi
  8003a8:	89 c7                	mov    %eax,%edi
  8003aa:	48 b8 df 3b 80 00 00 	movabs $0x803bdf,%rax
  8003b1:	00 00 00 
  8003b4:	ff d0                	callq  *%rax
  8003b6:	8b 85 48 fb ff ff    	mov    -0x4b8(%rbp),%eax
  8003bc:	89 c7                	mov    %eax,%edi
  8003be:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  8003c5:	00 00 00 
  8003c8:	ff d0                	callq  *%rax
  8003ca:	8b 85 4c fb ff ff    	mov    -0x4b4(%rbp),%eax
  8003d0:	89 c7                	mov    %eax,%edi
  8003d2:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  8003d9:	00 00 00 
  8003dc:	ff d0                	callq  *%rax
  8003de:	e9 94 fc ff ff       	jmpq   800077 <runcmd+0x34>
  8003e3:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8003e6:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8003e9:	8b 85 4c fb ff ff    	mov    -0x4b4(%rbp),%eax
  8003ef:	83 f8 01             	cmp    $0x1,%eax
  8003f2:	74 2d                	je     800421 <runcmd+0x3de>
  8003f4:	8b 85 4c fb ff ff    	mov    -0x4b4(%rbp),%eax
  8003fa:	be 01 00 00 00       	mov    $0x1,%esi
  8003ff:	89 c7                	mov    %eax,%edi
  800401:	48 b8 df 3b 80 00 00 	movabs $0x803bdf,%rax
  800408:	00 00 00 
  80040b:	ff d0                	callq  *%rax
  80040d:	8b 85 4c fb ff ff    	mov    -0x4b4(%rbp),%eax
  800413:	89 c7                	mov    %eax,%edi
  800415:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  80041c:	00 00 00 
  80041f:	ff d0                	callq  *%rax
  800421:	8b 85 48 fb ff ff    	mov    -0x4b8(%rbp),%eax
  800427:	89 c7                	mov    %eax,%edi
  800429:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  800430:	00 00 00 
  800433:	ff d0                	callq  *%rax
  800435:	eb 3d                	jmp    800474 <runcmd+0x431>
  800437:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80043a:	89 c1                	mov    %eax,%ecx
  80043c:	48 ba 3b 6a 80 00 00 	movabs $0x806a3b,%rdx
  800443:	00 00 00 
  800446:	be ab 00 00 00       	mov    $0xab,%esi
  80044b:	48 bf 57 6a 80 00 00 	movabs $0x806a57,%rdi
  800452:	00 00 00 
  800455:	b8 00 00 00 00       	mov    $0x0,%eax
  80045a:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  800461:	00 00 00 
  800464:	41 ff d0             	callq  *%r8
  800467:	90                   	nop
  800468:	e9 11 fc ff ff       	jmpq   80007e <runcmd+0x3b>
  80046d:	90                   	nop
  80046e:	e9 0b fc ff ff       	jmpq   80007e <runcmd+0x3b>
  800473:	90                   	nop
  800474:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800478:	75 34                	jne    8004ae <runcmd+0x46b>
  80047a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800481:	00 00 00 
  800484:	8b 00                	mov    (%rax),%eax
  800486:	85 c0                	test   %eax,%eax
  800488:	0f 84 7b 03 00 00    	je     800809 <runcmd+0x7c6>
  80048e:	48 bf 64 6a 80 00 00 	movabs $0x806a64,%rdi
  800495:	00 00 00 
  800498:	b8 00 00 00 00       	mov    $0x0,%eax
  80049d:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  8004a4:	00 00 00 
  8004a7:	ff d2                	callq  *%rdx
  8004a9:	e9 5c 03 00 00       	jmpq   80080a <runcmd+0x7c7>
  8004ae:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  8004b5:	e9 8a 00 00 00       	jmpq   800544 <runcmd+0x501>
  8004ba:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8004c1:	00 00 00 
  8004c4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8004c7:	48 63 d2             	movslq %edx,%rdx
  8004ca:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8004ce:	48 8d 85 50 fb ff ff 	lea    -0x4b0(%rbp),%rax
  8004d5:	48 89 d6             	mov    %rdx,%rsi
  8004d8:	48 89 c7             	mov    %rax,%rdi
  8004db:	48 b8 4a 22 80 00 00 	movabs $0x80224a,%rax
  8004e2:	00 00 00 
  8004e5:	ff d0                	callq  *%rax
  8004e7:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  8004ee:	48 8d 85 50 fb ff ff 	lea    -0x4b0(%rbp),%rax
  8004f5:	48 89 d6             	mov    %rdx,%rsi
  8004f8:	48 89 c7             	mov    %rax,%rdi
  8004fb:	48 b8 8d 22 80 00 00 	movabs $0x80228d,%rax
  800502:	00 00 00 
  800505:	ff d0                	callq  *%rax
  800507:	48 8d 95 b0 fa ff ff 	lea    -0x550(%rbp),%rdx
  80050e:	48 8d 85 50 fb ff ff 	lea    -0x4b0(%rbp),%rax
  800515:	48 89 d6             	mov    %rdx,%rsi
  800518:	48 89 c7             	mov    %rax,%rdi
  80051b:	48 b8 71 41 80 00 00 	movabs $0x804171,%rax
  800522:	00 00 00 
  800525:	ff d0                	callq  *%rax
  800527:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80052a:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80052e:	75 10                	jne    800540 <runcmd+0x4fd>
  800530:	48 8d 85 50 fb ff ff 	lea    -0x4b0(%rbp),%rax
  800537:	48 89 85 60 ff ff ff 	mov    %rax,-0xa0(%rbp)
  80053e:	eb 19                	jmp    800559 <runcmd+0x516>
  800540:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
  800544:	48 b8 10 90 80 00 00 	movabs $0x809010,%rax
  80054b:	00 00 00 
  80054e:	8b 00                	mov    (%rax),%eax
  800550:	39 45 f8             	cmp    %eax,-0x8(%rbp)
  800553:	0f 8c 61 ff ff ff    	jl     8004ba <runcmd+0x477>
  800559:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  800560:	0f b6 00             	movzbl (%rax),%eax
  800563:	3c 2f                	cmp    $0x2f,%al
  800565:	74 39                	je     8005a0 <runcmd+0x55d>
  800567:	c6 85 50 fb ff ff 2f 	movb   $0x2f,-0x4b0(%rbp)
  80056e:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  800575:	48 8d 85 50 fb ff ff 	lea    -0x4b0(%rbp),%rax
  80057c:	48 83 c0 01          	add    $0x1,%rax
  800580:	48 89 d6             	mov    %rdx,%rsi
  800583:	48 89 c7             	mov    %rax,%rdi
  800586:	48 b8 4a 22 80 00 00 	movabs $0x80224a,%rax
  80058d:	00 00 00 
  800590:	ff d0                	callq  *%rax
  800592:	48 8d 85 50 fb ff ff 	lea    -0x4b0(%rbp),%rax
  800599:	48 89 85 60 ff ff ff 	mov    %rax,-0xa0(%rbp)
  8005a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8005a3:	48 98                	cltq   
  8005a5:	48 c7 84 c5 60 ff ff 	movq   $0x0,-0xa0(%rbp,%rax,8)
  8005ac:	ff 00 00 00 00 
  8005b1:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8005b8:	00 00 00 
  8005bb:	8b 00                	mov    (%rax),%eax
  8005bd:	85 c0                	test   %eax,%eax
  8005bf:	0f 84 95 00 00 00    	je     80065a <runcmd+0x617>
  8005c5:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  8005cc:	00 00 00 
  8005cf:	48 8b 00             	mov    (%rax),%rax
  8005d2:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8005d8:	89 c6                	mov    %eax,%esi
  8005da:	48 bf 73 6a 80 00 00 	movabs $0x806a73,%rdi
  8005e1:	00 00 00 
  8005e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8005e9:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  8005f0:	00 00 00 
  8005f3:	ff d2                	callq  *%rdx
  8005f5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  8005fc:	eb 2f                	jmp    80062d <runcmd+0x5ea>
  8005fe:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800601:	48 98                	cltq   
  800603:	48 8b 84 c5 60 ff ff 	mov    -0xa0(%rbp,%rax,8),%rax
  80060a:	ff 
  80060b:	48 89 c6             	mov    %rax,%rsi
  80060e:	48 bf 81 6a 80 00 00 	movabs $0x806a81,%rdi
  800615:	00 00 00 
  800618:	b8 00 00 00 00       	mov    $0x0,%eax
  80061d:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  800624:	00 00 00 
  800627:	ff d2                	callq  *%rdx
  800629:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
  80062d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800630:	48 98                	cltq   
  800632:	48 8b 84 c5 60 ff ff 	mov    -0xa0(%rbp,%rax,8),%rax
  800639:	ff 
  80063a:	48 85 c0             	test   %rax,%rax
  80063d:	75 bf                	jne    8005fe <runcmd+0x5bb>
  80063f:	48 bf 85 6a 80 00 00 	movabs $0x806a85,%rdi
  800646:	00 00 00 
  800649:	b8 00 00 00 00       	mov    $0x0,%eax
  80064e:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  800655:	00 00 00 
  800658:	ff d2                	callq  *%rdx
  80065a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  800661:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  800668:	48 89 d6             	mov    %rdx,%rsi
  80066b:	48 89 c7             	mov    %rax,%rdi
  80066e:	48 b8 a6 4b 80 00 00 	movabs $0x804ba6,%rax
  800675:	00 00 00 
  800678:	ff d0                	callq  *%rax
  80067a:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80067d:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  800681:	79 28                	jns    8006ab <runcmd+0x668>
  800683:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  80068a:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80068d:	48 89 c6             	mov    %rax,%rsi
  800690:	48 bf 87 6a 80 00 00 	movabs $0x806a87,%rdi
  800697:	00 00 00 
  80069a:	b8 00 00 00 00       	mov    $0x0,%eax
  80069f:	48 b9 5c 15 80 00 00 	movabs $0x80155c,%rcx
  8006a6:	00 00 00 
  8006a9:	ff d1                	callq  *%rcx
  8006ab:	48 b8 b0 3b 80 00 00 	movabs $0x803bb0,%rax
  8006b2:	00 00 00 
  8006b5:	ff d0                	callq  *%rax
  8006b7:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8006bb:	0f 88 9c 00 00 00    	js     80075d <runcmd+0x71a>
  8006c1:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8006c8:	00 00 00 
  8006cb:	8b 00                	mov    (%rax),%eax
  8006cd:	85 c0                	test   %eax,%eax
  8006cf:	74 3b                	je     80070c <runcmd+0x6c9>
  8006d1:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  8006d8:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  8006df:	00 00 00 
  8006e2:	48 8b 00             	mov    (%rax),%rax
  8006e5:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8006eb:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8006ee:	89 c6                	mov    %eax,%esi
  8006f0:	48 bf 95 6a 80 00 00 	movabs $0x806a95,%rdi
  8006f7:	00 00 00 
  8006fa:	b8 00 00 00 00       	mov    $0x0,%eax
  8006ff:	49 b8 5c 15 80 00 00 	movabs $0x80155c,%r8
  800706:	00 00 00 
  800709:	41 ff d0             	callq  *%r8
  80070c:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80070f:	89 c7                	mov    %eax,%edi
  800711:	48 b8 db 64 80 00 00 	movabs $0x8064db,%rax
  800718:	00 00 00 
  80071b:	ff d0                	callq  *%rax
  80071d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800724:	00 00 00 
  800727:	8b 00                	mov    (%rax),%eax
  800729:	85 c0                	test   %eax,%eax
  80072b:	74 30                	je     80075d <runcmd+0x71a>
  80072d:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  800734:	00 00 00 
  800737:	48 8b 00             	mov    (%rax),%rax
  80073a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800740:	89 c6                	mov    %eax,%esi
  800742:	48 bf aa 6a 80 00 00 	movabs $0x806aaa,%rdi
  800749:	00 00 00 
  80074c:	b8 00 00 00 00       	mov    $0x0,%eax
  800751:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  800758:	00 00 00 
  80075b:	ff d2                	callq  *%rdx
  80075d:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  800761:	0f 84 94 00 00 00    	je     8007fb <runcmd+0x7b8>
  800767:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80076e:	00 00 00 
  800771:	8b 00                	mov    (%rax),%eax
  800773:	85 c0                	test   %eax,%eax
  800775:	74 33                	je     8007aa <runcmd+0x767>
  800777:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  80077e:	00 00 00 
  800781:	48 8b 00             	mov    (%rax),%rax
  800784:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80078a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80078d:	89 c6                	mov    %eax,%esi
  80078f:	48 bf c0 6a 80 00 00 	movabs $0x806ac0,%rdi
  800796:	00 00 00 
  800799:	b8 00 00 00 00       	mov    $0x0,%eax
  80079e:	48 b9 5c 15 80 00 00 	movabs $0x80155c,%rcx
  8007a5:	00 00 00 
  8007a8:	ff d1                	callq  *%rcx
  8007aa:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8007ad:	89 c7                	mov    %eax,%edi
  8007af:	48 b8 db 64 80 00 00 	movabs $0x8064db,%rax
  8007b6:	00 00 00 
  8007b9:	ff d0                	callq  *%rax
  8007bb:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8007c2:	00 00 00 
  8007c5:	8b 00                	mov    (%rax),%eax
  8007c7:	85 c0                	test   %eax,%eax
  8007c9:	74 30                	je     8007fb <runcmd+0x7b8>
  8007cb:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  8007d2:	00 00 00 
  8007d5:	48 8b 00             	mov    (%rax),%rax
  8007d8:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8007de:	89 c6                	mov    %eax,%esi
  8007e0:	48 bf aa 6a 80 00 00 	movabs $0x806aaa,%rdi
  8007e7:	00 00 00 
  8007ea:	b8 00 00 00 00       	mov    $0x0,%eax
  8007ef:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  8007f6:	00 00 00 
  8007f9:	ff d2                	callq  *%rdx
  8007fb:	48 b8 fe 12 80 00 00 	movabs $0x8012fe,%rax
  800802:	00 00 00 
  800805:	ff d0                	callq  *%rax
  800807:	eb 01                	jmp    80080a <runcmd+0x7c7>
  800809:	90                   	nop
  80080a:	c9                   	leaveq 
  80080b:	c3                   	retq   

000000000080080c <_gettoken>:
  80080c:	55                   	push   %rbp
  80080d:	48 89 e5             	mov    %rsp,%rbp
  800810:	48 83 ec 30          	sub    $0x30,%rsp
  800814:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800818:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80081c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800820:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  800825:	75 36                	jne    80085d <_gettoken+0x51>
  800827:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80082e:	00 00 00 
  800831:	8b 00                	mov    (%rax),%eax
  800833:	83 f8 01             	cmp    $0x1,%eax
  800836:	7e 1b                	jle    800853 <_gettoken+0x47>
  800838:	48 bf dd 6a 80 00 00 	movabs $0x806add,%rdi
  80083f:	00 00 00 
  800842:	b8 00 00 00 00       	mov    $0x0,%eax
  800847:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  80084e:	00 00 00 
  800851:	ff d2                	callq  *%rdx
  800853:	b8 00 00 00 00       	mov    $0x0,%eax
  800858:	e9 04 02 00 00       	jmpq   800a61 <_gettoken+0x255>
  80085d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800864:	00 00 00 
  800867:	8b 00                	mov    (%rax),%eax
  800869:	83 f8 01             	cmp    $0x1,%eax
  80086c:	7e 22                	jle    800890 <_gettoken+0x84>
  80086e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800872:	48 89 c6             	mov    %rax,%rsi
  800875:	48 bf ec 6a 80 00 00 	movabs $0x806aec,%rdi
  80087c:	00 00 00 
  80087f:	b8 00 00 00 00       	mov    $0x0,%eax
  800884:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  80088b:	00 00 00 
  80088e:	ff d2                	callq  *%rdx
  800890:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800894:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80089b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80089f:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8008a6:	eb 0f                	jmp    8008b7 <_gettoken+0xab>
  8008a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008ac:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8008b0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8008b4:	c6 00 00             	movb   $0x0,(%rax)
  8008b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008bb:	0f b6 00             	movzbl (%rax),%eax
  8008be:	0f be c0             	movsbl %al,%eax
  8008c1:	89 c6                	mov    %eax,%esi
  8008c3:	48 bf fa 6a 80 00 00 	movabs $0x806afa,%rdi
  8008ca:	00 00 00 
  8008cd:	48 b8 70 24 80 00 00 	movabs $0x802470,%rax
  8008d4:	00 00 00 
  8008d7:	ff d0                	callq  *%rax
  8008d9:	48 85 c0             	test   %rax,%rax
  8008dc:	75 ca                	jne    8008a8 <_gettoken+0x9c>
  8008de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008e2:	0f b6 00             	movzbl (%rax),%eax
  8008e5:	84 c0                	test   %al,%al
  8008e7:	75 36                	jne    80091f <_gettoken+0x113>
  8008e9:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8008f0:	00 00 00 
  8008f3:	8b 00                	mov    (%rax),%eax
  8008f5:	83 f8 01             	cmp    $0x1,%eax
  8008f8:	7e 1b                	jle    800915 <_gettoken+0x109>
  8008fa:	48 bf ff 6a 80 00 00 	movabs $0x806aff,%rdi
  800901:	00 00 00 
  800904:	b8 00 00 00 00       	mov    $0x0,%eax
  800909:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  800910:	00 00 00 
  800913:	ff d2                	callq  *%rdx
  800915:	b8 00 00 00 00       	mov    $0x0,%eax
  80091a:	e9 42 01 00 00       	jmpq   800a61 <_gettoken+0x255>
  80091f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800923:	0f b6 00             	movzbl (%rax),%eax
  800926:	0f be c0             	movsbl %al,%eax
  800929:	89 c6                	mov    %eax,%esi
  80092b:	48 bf 04 6b 80 00 00 	movabs $0x806b04,%rdi
  800932:	00 00 00 
  800935:	48 b8 70 24 80 00 00 	movabs $0x802470,%rax
  80093c:	00 00 00 
  80093f:	ff d0                	callq  *%rax
  800941:	48 85 c0             	test   %rax,%rax
  800944:	74 6b                	je     8009b1 <_gettoken+0x1a5>
  800946:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80094a:	0f b6 00             	movzbl (%rax),%eax
  80094d:	0f be c0             	movsbl %al,%eax
  800950:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800953:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800957:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80095b:	48 89 10             	mov    %rdx,(%rax)
  80095e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800962:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800966:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80096a:	c6 00 00             	movb   $0x0,(%rax)
  80096d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800971:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800975:	48 89 10             	mov    %rdx,(%rax)
  800978:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80097f:	00 00 00 
  800982:	8b 00                	mov    (%rax),%eax
  800984:	83 f8 01             	cmp    $0x1,%eax
  800987:	7e 20                	jle    8009a9 <_gettoken+0x19d>
  800989:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80098c:	89 c6                	mov    %eax,%esi
  80098e:	48 bf 0c 6b 80 00 00 	movabs $0x806b0c,%rdi
  800995:	00 00 00 
  800998:	b8 00 00 00 00       	mov    $0x0,%eax
  80099d:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  8009a4:	00 00 00 
  8009a7:	ff d2                	callq  *%rdx
  8009a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8009ac:	e9 b0 00 00 00       	jmpq   800a61 <_gettoken+0x255>
  8009b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8009b5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009b9:	48 89 10             	mov    %rdx,(%rax)
  8009bc:	eb 05                	jmp    8009c3 <_gettoken+0x1b7>
  8009be:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8009c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009c7:	0f b6 00             	movzbl (%rax),%eax
  8009ca:	84 c0                	test   %al,%al
  8009cc:	74 27                	je     8009f5 <_gettoken+0x1e9>
  8009ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009d2:	0f b6 00             	movzbl (%rax),%eax
  8009d5:	0f be c0             	movsbl %al,%eax
  8009d8:	89 c6                	mov    %eax,%esi
  8009da:	48 bf 14 6b 80 00 00 	movabs $0x806b14,%rdi
  8009e1:	00 00 00 
  8009e4:	48 b8 70 24 80 00 00 	movabs $0x802470,%rax
  8009eb:	00 00 00 
  8009ee:	ff d0                	callq  *%rax
  8009f0:	48 85 c0             	test   %rax,%rax
  8009f3:	74 c9                	je     8009be <_gettoken+0x1b2>
  8009f5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8009f9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009fd:	48 89 10             	mov    %rdx,(%rax)
  800a00:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800a07:	00 00 00 
  800a0a:	8b 00                	mov    (%rax),%eax
  800a0c:	83 f8 01             	cmp    $0x1,%eax
  800a0f:	7e 4b                	jle    800a5c <_gettoken+0x250>
  800a11:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800a15:	48 8b 00             	mov    (%rax),%rax
  800a18:	0f b6 00             	movzbl (%rax),%eax
  800a1b:	0f be c0             	movsbl %al,%eax
  800a1e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800a21:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800a25:	48 8b 00             	mov    (%rax),%rax
  800a28:	c6 00 00             	movb   $0x0,(%rax)
  800a2b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800a2f:	48 8b 00             	mov    (%rax),%rax
  800a32:	48 89 c6             	mov    %rax,%rsi
  800a35:	48 bf 20 6b 80 00 00 	movabs $0x806b20,%rdi
  800a3c:	00 00 00 
  800a3f:	b8 00 00 00 00       	mov    $0x0,%eax
  800a44:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  800a4b:	00 00 00 
  800a4e:	ff d2                	callq  *%rdx
  800a50:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800a54:	48 8b 00             	mov    (%rax),%rax
  800a57:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800a5a:	88 10                	mov    %dl,(%rax)
  800a5c:	b8 77 00 00 00       	mov    $0x77,%eax
  800a61:	c9                   	leaveq 
  800a62:	c3                   	retq   

0000000000800a63 <gettoken>:
  800a63:	55                   	push   %rbp
  800a64:	48 89 e5             	mov    %rsp,%rbp
  800a67:	48 83 ec 10          	sub    $0x10,%rsp
  800a6b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800a6f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800a73:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  800a78:	74 3c                	je     800ab6 <gettoken+0x53>
  800a7a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800a7e:	48 ba 10 a0 80 00 00 	movabs $0x80a010,%rdx
  800a85:	00 00 00 
  800a88:	48 be 08 a0 80 00 00 	movabs $0x80a008,%rsi
  800a8f:	00 00 00 
  800a92:	48 89 c7             	mov    %rax,%rdi
  800a95:	48 b8 0c 08 80 00 00 	movabs $0x80080c,%rax
  800a9c:	00 00 00 
  800a9f:	ff d0                	callq  *%rax
  800aa1:	89 c2                	mov    %eax,%edx
  800aa3:	48 b8 18 a0 80 00 00 	movabs $0x80a018,%rax
  800aaa:	00 00 00 
  800aad:	89 10                	mov    %edx,(%rax)
  800aaf:	b8 00 00 00 00       	mov    $0x0,%eax
  800ab4:	eb 76                	jmp    800b2c <gettoken+0xc9>
  800ab6:	48 b8 18 a0 80 00 00 	movabs $0x80a018,%rax
  800abd:	00 00 00 
  800ac0:	8b 10                	mov    (%rax),%edx
  800ac2:	48 b8 1c a0 80 00 00 	movabs $0x80a01c,%rax
  800ac9:	00 00 00 
  800acc:	89 10                	mov    %edx,(%rax)
  800ace:	48 b8 08 a0 80 00 00 	movabs $0x80a008,%rax
  800ad5:	00 00 00 
  800ad8:	48 8b 10             	mov    (%rax),%rdx
  800adb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800adf:	48 89 10             	mov    %rdx,(%rax)
  800ae2:	48 b8 10 a0 80 00 00 	movabs $0x80a010,%rax
  800ae9:	00 00 00 
  800aec:	48 8b 00             	mov    (%rax),%rax
  800aef:	48 ba 10 a0 80 00 00 	movabs $0x80a010,%rdx
  800af6:	00 00 00 
  800af9:	48 be 08 a0 80 00 00 	movabs $0x80a008,%rsi
  800b00:	00 00 00 
  800b03:	48 89 c7             	mov    %rax,%rdi
  800b06:	48 b8 0c 08 80 00 00 	movabs $0x80080c,%rax
  800b0d:	00 00 00 
  800b10:	ff d0                	callq  *%rax
  800b12:	89 c2                	mov    %eax,%edx
  800b14:	48 b8 18 a0 80 00 00 	movabs $0x80a018,%rax
  800b1b:	00 00 00 
  800b1e:	89 10                	mov    %edx,(%rax)
  800b20:	48 b8 1c a0 80 00 00 	movabs $0x80a01c,%rax
  800b27:	00 00 00 
  800b2a:	8b 00                	mov    (%rax),%eax
  800b2c:	c9                   	leaveq 
  800b2d:	c3                   	retq   

0000000000800b2e <usage>:
  800b2e:	55                   	push   %rbp
  800b2f:	48 89 e5             	mov    %rsp,%rbp
  800b32:	48 bf 30 6b 80 00 00 	movabs $0x806b30,%rdi
  800b39:	00 00 00 
  800b3c:	b8 00 00 00 00       	mov    $0x0,%eax
  800b41:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  800b48:	00 00 00 
  800b4b:	ff d2                	callq  *%rdx
  800b4d:	48 b8 fe 12 80 00 00 	movabs $0x8012fe,%rax
  800b54:	00 00 00 
  800b57:	ff d0                	callq  *%rax
  800b59:	90                   	nop
  800b5a:	5d                   	pop    %rbp
  800b5b:	c3                   	retq   

0000000000800b5c <umain>:
  800b5c:	55                   	push   %rbp
  800b5d:	48 89 e5             	mov    %rsp,%rbp
  800b60:	48 83 ec 50          	sub    $0x50,%rsp
  800b64:	89 7d bc             	mov    %edi,-0x44(%rbp)
  800b67:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
  800b6b:	c6 45 f7 00          	movb   $0x0,-0x9(%rbp)
  800b6f:	c7 45 fc 3f 00 00 00 	movl   $0x3f,-0x4(%rbp)
  800b76:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  800b7d:	48 8d 55 c0          	lea    -0x40(%rbp),%rdx
  800b81:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
  800b85:	48 8d 45 bc          	lea    -0x44(%rbp),%rax
  800b89:	48 89 ce             	mov    %rcx,%rsi
  800b8c:	48 89 c7             	mov    %rax,%rdi
  800b8f:	48 b8 8e 35 80 00 00 	movabs $0x80358e,%rax
  800b96:	00 00 00 
  800b99:	ff d0                	callq  *%rax
  800b9b:	eb 4d                	jmp    800bea <umain+0x8e>
  800b9d:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800ba0:	83 f8 69             	cmp    $0x69,%eax
  800ba3:	74 27                	je     800bcc <umain+0x70>
  800ba5:	83 f8 78             	cmp    $0x78,%eax
  800ba8:	74 2b                	je     800bd5 <umain+0x79>
  800baa:	83 f8 64             	cmp    $0x64,%eax
  800bad:	75 2f                	jne    800bde <umain+0x82>
  800baf:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800bb6:	00 00 00 
  800bb9:	8b 00                	mov    (%rax),%eax
  800bbb:	8d 50 01             	lea    0x1(%rax),%edx
  800bbe:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800bc5:	00 00 00 
  800bc8:	89 10                	mov    %edx,(%rax)
  800bca:	eb 1e                	jmp    800bea <umain+0x8e>
  800bcc:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  800bd3:	eb 15                	jmp    800bea <umain+0x8e>
  800bd5:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
  800bdc:	eb 0c                	jmp    800bea <umain+0x8e>
  800bde:	48 b8 2e 0b 80 00 00 	movabs $0x800b2e,%rax
  800be5:	00 00 00 
  800be8:	ff d0                	callq  *%rax
  800bea:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  800bee:	48 89 c7             	mov    %rax,%rdi
  800bf1:	48 b8 f3 35 80 00 00 	movabs $0x8035f3,%rax
  800bf8:	00 00 00 
  800bfb:	ff d0                	callq  *%rax
  800bfd:	89 45 f0             	mov    %eax,-0x10(%rbp)
  800c00:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800c04:	79 97                	jns    800b9d <umain+0x41>
  800c06:	bf 00 00 00 00       	mov    $0x0,%edi
  800c0b:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  800c12:	00 00 00 
  800c15:	ff d0                	callq  *%rax
  800c17:	48 b8 8a 10 80 00 00 	movabs $0x80108a,%rax
  800c1e:	00 00 00 
  800c21:	ff d0                	callq  *%rax
  800c23:	89 45 f0             	mov    %eax,-0x10(%rbp)
  800c26:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800c2a:	79 30                	jns    800c5c <umain+0x100>
  800c2c:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800c2f:	89 c1                	mov    %eax,%ecx
  800c31:	48 ba 51 6b 80 00 00 	movabs $0x806b51,%rdx
  800c38:	00 00 00 
  800c3b:	be 66 01 00 00       	mov    $0x166,%esi
  800c40:	48 bf 57 6a 80 00 00 	movabs $0x806a57,%rdi
  800c47:	00 00 00 
  800c4a:	b8 00 00 00 00       	mov    $0x0,%eax
  800c4f:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  800c56:	00 00 00 
  800c59:	41 ff d0             	callq  *%r8
  800c5c:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800c60:	74 30                	je     800c92 <umain+0x136>
  800c62:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800c65:	89 c1                	mov    %eax,%ecx
  800c67:	48 ba 5e 6b 80 00 00 	movabs $0x806b5e,%rdx
  800c6e:	00 00 00 
  800c71:	be 68 01 00 00       	mov    $0x168,%esi
  800c76:	48 bf 57 6a 80 00 00 	movabs $0x806a57,%rdi
  800c7d:	00 00 00 
  800c80:	b8 00 00 00 00       	mov    $0x0,%eax
  800c85:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  800c8c:	00 00 00 
  800c8f:	41 ff d0             	callq  *%r8
  800c92:	be 01 00 00 00       	mov    $0x1,%esi
  800c97:	bf 00 00 00 00       	mov    $0x0,%edi
  800c9c:	48 b8 df 3b 80 00 00 	movabs $0x803bdf,%rax
  800ca3:	00 00 00 
  800ca6:	ff d0                	callq  *%rax
  800ca8:	89 45 f0             	mov    %eax,-0x10(%rbp)
  800cab:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800caf:	79 30                	jns    800ce1 <umain+0x185>
  800cb1:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800cb4:	89 c1                	mov    %eax,%ecx
  800cb6:	48 ba 78 6b 80 00 00 	movabs $0x806b78,%rdx
  800cbd:	00 00 00 
  800cc0:	be 6a 01 00 00       	mov    $0x16a,%esi
  800cc5:	48 bf 57 6a 80 00 00 	movabs $0x806a57,%rdi
  800ccc:	00 00 00 
  800ccf:	b8 00 00 00 00       	mov    $0x0,%eax
  800cd4:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  800cdb:	00 00 00 
  800cde:	41 ff d0             	callq  *%r8
  800ce1:	8b 45 bc             	mov    -0x44(%rbp),%eax
  800ce4:	83 f8 02             	cmp    $0x2,%eax
  800ce7:	7e 0c                	jle    800cf5 <umain+0x199>
  800ce9:	48 b8 2e 0b 80 00 00 	movabs $0x800b2e,%rax
  800cf0:	00 00 00 
  800cf3:	ff d0                	callq  *%rax
  800cf5:	8b 45 bc             	mov    -0x44(%rbp),%eax
  800cf8:	83 f8 02             	cmp    $0x2,%eax
  800cfb:	0f 85 b3 00 00 00    	jne    800db4 <umain+0x258>
  800d01:	bf 00 00 00 00       	mov    $0x0,%edi
  800d06:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  800d0d:	00 00 00 
  800d10:	ff d0                	callq  *%rax
  800d12:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  800d16:	48 83 c0 08          	add    $0x8,%rax
  800d1a:	48 8b 00             	mov    (%rax),%rax
  800d1d:	be 00 00 00 00       	mov    $0x0,%esi
  800d22:	48 89 c7             	mov    %rax,%rdi
  800d25:	48 b8 61 42 80 00 00 	movabs $0x804261,%rax
  800d2c:	00 00 00 
  800d2f:	ff d0                	callq  *%rax
  800d31:	89 45 f0             	mov    %eax,-0x10(%rbp)
  800d34:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800d38:	79 3f                	jns    800d79 <umain+0x21d>
  800d3a:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  800d3e:	48 83 c0 08          	add    $0x8,%rax
  800d42:	48 8b 00             	mov    (%rax),%rax
  800d45:	8b 55 f0             	mov    -0x10(%rbp),%edx
  800d48:	41 89 d0             	mov    %edx,%r8d
  800d4b:	48 89 c1             	mov    %rax,%rcx
  800d4e:	48 ba 80 6b 80 00 00 	movabs $0x806b80,%rdx
  800d55:	00 00 00 
  800d58:	be 71 01 00 00       	mov    $0x171,%esi
  800d5d:	48 bf 57 6a 80 00 00 	movabs $0x806a57,%rdi
  800d64:	00 00 00 
  800d67:	b8 00 00 00 00       	mov    $0x0,%eax
  800d6c:	49 b9 22 13 80 00 00 	movabs $0x801322,%r9
  800d73:	00 00 00 
  800d76:	41 ff d1             	callq  *%r9
  800d79:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800d7d:	74 35                	je     800db4 <umain+0x258>
  800d7f:	48 b9 8c 6b 80 00 00 	movabs $0x806b8c,%rcx
  800d86:	00 00 00 
  800d89:	48 ba 93 6b 80 00 00 	movabs $0x806b93,%rdx
  800d90:	00 00 00 
  800d93:	be 72 01 00 00       	mov    $0x172,%esi
  800d98:	48 bf 57 6a 80 00 00 	movabs $0x806a57,%rdi
  800d9f:	00 00 00 
  800da2:	b8 00 00 00 00       	mov    $0x0,%eax
  800da7:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  800dae:	00 00 00 
  800db1:	41 ff d0             	callq  *%r8
  800db4:	83 7d fc 3f          	cmpl   $0x3f,-0x4(%rbp)
  800db8:	75 14                	jne    800dce <umain+0x272>
  800dba:	bf 00 00 00 00       	mov    $0x0,%edi
  800dbf:	48 b8 3d 10 80 00 00 	movabs $0x80103d,%rax
  800dc6:	00 00 00 
  800dc9:	ff d0                	callq  *%rax
  800dcb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800dce:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800dd2:	74 0c                	je     800de0 <umain+0x284>
  800dd4:	48 b8 a8 6b 80 00 00 	movabs $0x806ba8,%rax
  800ddb:	00 00 00 
  800dde:	eb 05                	jmp    800de5 <umain+0x289>
  800de0:	b8 00 00 00 00       	mov    $0x0,%eax
  800de5:	48 89 c7             	mov    %rax,%rdi
  800de8:	48 b8 80 20 80 00 00 	movabs $0x802080,%rax
  800def:	00 00 00 
  800df2:	ff d0                	callq  *%rax
  800df4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800df8:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  800dfd:	75 37                	jne    800e36 <umain+0x2da>
  800dff:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800e06:	00 00 00 
  800e09:	8b 00                	mov    (%rax),%eax
  800e0b:	85 c0                	test   %eax,%eax
  800e0d:	74 1b                	je     800e2a <umain+0x2ce>
  800e0f:	48 bf ad 6b 80 00 00 	movabs $0x806bad,%rdi
  800e16:	00 00 00 
  800e19:	b8 00 00 00 00       	mov    $0x0,%eax
  800e1e:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  800e25:	00 00 00 
  800e28:	ff d2                	callq  *%rdx
  800e2a:	48 b8 fe 12 80 00 00 	movabs $0x8012fe,%rax
  800e31:	00 00 00 
  800e34:	ff d0                	callq  *%rax
  800e36:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e3a:	48 be b6 6b 80 00 00 	movabs $0x806bb6,%rsi
  800e41:	00 00 00 
  800e44:	48 89 c7             	mov    %rax,%rdi
  800e47:	48 b8 ac 23 80 00 00 	movabs $0x8023ac,%rax
  800e4e:	00 00 00 
  800e51:	ff d0                	callq  *%rax
  800e53:	85 c0                	test   %eax,%eax
  800e55:	75 0c                	jne    800e63 <umain+0x307>
  800e57:	48 b8 fe 12 80 00 00 	movabs $0x8012fe,%rax
  800e5e:	00 00 00 
  800e61:	ff d0                	callq  *%rax
  800e63:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800e6a:	00 00 00 
  800e6d:	8b 00                	mov    (%rax),%eax
  800e6f:	85 c0                	test   %eax,%eax
  800e71:	74 22                	je     800e95 <umain+0x339>
  800e73:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e77:	48 89 c6             	mov    %rax,%rsi
  800e7a:	48 bf bb 6b 80 00 00 	movabs $0x806bbb,%rdi
  800e81:	00 00 00 
  800e84:	b8 00 00 00 00       	mov    $0x0,%eax
  800e89:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  800e90:	00 00 00 
  800e93:	ff d2                	callq  *%rdx
  800e95:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e99:	0f b6 00             	movzbl (%rax),%eax
  800e9c:	3c 23                	cmp    $0x23,%al
  800e9e:	0f 84 1e 01 00 00    	je     800fc2 <umain+0x466>
  800ea4:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800ea8:	74 22                	je     800ecc <umain+0x370>
  800eaa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800eae:	48 89 c6             	mov    %rax,%rsi
  800eb1:	48 bf c5 6b 80 00 00 	movabs $0x806bc5,%rdi
  800eb8:	00 00 00 
  800ebb:	b8 00 00 00 00       	mov    $0x0,%eax
  800ec0:	48 ba f0 4a 80 00 00 	movabs $0x804af0,%rdx
  800ec7:	00 00 00 
  800eca:	ff d2                	callq  *%rdx
  800ecc:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800ed3:	00 00 00 
  800ed6:	8b 00                	mov    (%rax),%eax
  800ed8:	85 c0                	test   %eax,%eax
  800eda:	74 1b                	je     800ef7 <umain+0x39b>
  800edc:	48 bf cb 6b 80 00 00 	movabs $0x806bcb,%rdi
  800ee3:	00 00 00 
  800ee6:	b8 00 00 00 00       	mov    $0x0,%eax
  800eeb:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  800ef2:	00 00 00 
  800ef5:	ff d2                	callq  *%rdx
  800ef7:	48 b8 17 33 80 00 00 	movabs $0x803317,%rax
  800efe:	00 00 00 
  800f01:	ff d0                	callq  *%rax
  800f03:	89 45 f0             	mov    %eax,-0x10(%rbp)
  800f06:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800f0a:	79 30                	jns    800f3c <umain+0x3e0>
  800f0c:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800f0f:	89 c1                	mov    %eax,%ecx
  800f11:	48 ba 32 6a 80 00 00 	movabs $0x806a32,%rdx
  800f18:	00 00 00 
  800f1b:	be 98 01 00 00       	mov    $0x198,%esi
  800f20:	48 bf 57 6a 80 00 00 	movabs $0x806a57,%rdi
  800f27:	00 00 00 
  800f2a:	b8 00 00 00 00       	mov    $0x0,%eax
  800f2f:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  800f36:	00 00 00 
  800f39:	41 ff d0             	callq  *%r8
  800f3c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  800f43:	00 00 00 
  800f46:	8b 00                	mov    (%rax),%eax
  800f48:	85 c0                	test   %eax,%eax
  800f4a:	74 20                	je     800f6c <umain+0x410>
  800f4c:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800f4f:	89 c6                	mov    %eax,%esi
  800f51:	48 bf d8 6b 80 00 00 	movabs $0x806bd8,%rdi
  800f58:	00 00 00 
  800f5b:	b8 00 00 00 00       	mov    $0x0,%eax
  800f60:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  800f67:	00 00 00 
  800f6a:	ff d2                	callq  *%rdx
  800f6c:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800f70:	75 24                	jne    800f96 <umain+0x43a>
  800f72:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f76:	48 89 c7             	mov    %rax,%rdi
  800f79:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800f80:	00 00 00 
  800f83:	ff d0                	callq  *%rax
  800f85:	48 b8 fe 12 80 00 00 	movabs $0x8012fe,%rax
  800f8c:	00 00 00 
  800f8f:	ff d0                	callq  *%rax
  800f91:	e9 38 fe ff ff       	jmpq   800dce <umain+0x272>
  800f96:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800f99:	89 c7                	mov    %eax,%edi
  800f9b:	48 b8 db 64 80 00 00 	movabs $0x8064db,%rax
  800fa2:	00 00 00 
  800fa5:	ff d0                	callq  *%rax
  800fa7:	80 7d f7 00          	cmpb   $0x0,-0x9(%rbp)
  800fab:	0f 84 1d fe ff ff    	je     800dce <umain+0x272>
  800fb1:	48 b8 fe 12 80 00 00 	movabs $0x8012fe,%rax
  800fb8:	00 00 00 
  800fbb:	ff d0                	callq  *%rax
  800fbd:	e9 0c fe ff ff       	jmpq   800dce <umain+0x272>
  800fc2:	90                   	nop
  800fc3:	e9 06 fe ff ff       	jmpq   800dce <umain+0x272>

0000000000800fc8 <cputchar>:
  800fc8:	55                   	push   %rbp
  800fc9:	48 89 e5             	mov    %rsp,%rbp
  800fcc:	48 83 ec 20          	sub    $0x20,%rsp
  800fd0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800fd3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800fd6:	88 45 ff             	mov    %al,-0x1(%rbp)
  800fd9:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  800fdd:	be 01 00 00 00       	mov    $0x1,%esi
  800fe2:	48 89 c7             	mov    %rax,%rdi
  800fe5:	48 b8 32 2a 80 00 00 	movabs $0x802a32,%rax
  800fec:	00 00 00 
  800fef:	ff d0                	callq  *%rax
  800ff1:	90                   	nop
  800ff2:	c9                   	leaveq 
  800ff3:	c3                   	retq   

0000000000800ff4 <getchar>:
  800ff4:	55                   	push   %rbp
  800ff5:	48 89 e5             	mov    %rsp,%rbp
  800ff8:	48 83 ec 10          	sub    $0x10,%rsp
  800ffc:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  801000:	ba 01 00 00 00       	mov    $0x1,%edx
  801005:	48 89 c6             	mov    %rax,%rsi
  801008:	bf 00 00 00 00       	mov    $0x0,%edi
  80100d:	48 b8 88 3d 80 00 00 	movabs $0x803d88,%rax
  801014:	00 00 00 
  801017:	ff d0                	callq  *%rax
  801019:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80101c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801020:	79 05                	jns    801027 <getchar+0x33>
  801022:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801025:	eb 14                	jmp    80103b <getchar+0x47>
  801027:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80102b:	7f 07                	jg     801034 <getchar+0x40>
  80102d:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  801032:	eb 07                	jmp    80103b <getchar+0x47>
  801034:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  801038:	0f b6 c0             	movzbl %al,%eax
  80103b:	c9                   	leaveq 
  80103c:	c3                   	retq   

000000000080103d <iscons>:
  80103d:	55                   	push   %rbp
  80103e:	48 89 e5             	mov    %rsp,%rbp
  801041:	48 83 ec 20          	sub    $0x20,%rsp
  801045:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801048:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80104c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80104f:	48 89 d6             	mov    %rdx,%rsi
  801052:	89 c7                	mov    %eax,%edi
  801054:	48 b8 53 39 80 00 00 	movabs $0x803953,%rax
  80105b:	00 00 00 
  80105e:	ff d0                	callq  *%rax
  801060:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801063:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801067:	79 05                	jns    80106e <iscons+0x31>
  801069:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80106c:	eb 1a                	jmp    801088 <iscons+0x4b>
  80106e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801072:	8b 10                	mov    (%rax),%edx
  801074:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  80107b:	00 00 00 
  80107e:	8b 00                	mov    (%rax),%eax
  801080:	39 c2                	cmp    %eax,%edx
  801082:	0f 94 c0             	sete   %al
  801085:	0f b6 c0             	movzbl %al,%eax
  801088:	c9                   	leaveq 
  801089:	c3                   	retq   

000000000080108a <opencons>:
  80108a:	55                   	push   %rbp
  80108b:	48 89 e5             	mov    %rsp,%rbp
  80108e:	48 83 ec 10          	sub    $0x10,%rsp
  801092:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  801096:	48 89 c7             	mov    %rax,%rdi
  801099:	48 b8 bb 38 80 00 00 	movabs $0x8038bb,%rax
  8010a0:	00 00 00 
  8010a3:	ff d0                	callq  *%rax
  8010a5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8010a8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8010ac:	79 05                	jns    8010b3 <opencons+0x29>
  8010ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010b1:	eb 5b                	jmp    80110e <opencons+0x84>
  8010b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010b7:	ba 07 04 00 00       	mov    $0x407,%edx
  8010bc:	48 89 c6             	mov    %rax,%rsi
  8010bf:	bf 00 00 00 00       	mov    $0x0,%edi
  8010c4:	48 b8 7a 2b 80 00 00 	movabs $0x802b7a,%rax
  8010cb:	00 00 00 
  8010ce:	ff d0                	callq  *%rax
  8010d0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8010d3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8010d7:	79 05                	jns    8010de <opencons+0x54>
  8010d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010dc:	eb 30                	jmp    80110e <opencons+0x84>
  8010de:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010e2:	48 ba 20 90 80 00 00 	movabs $0x809020,%rdx
  8010e9:	00 00 00 
  8010ec:	8b 12                	mov    (%rdx),%edx
  8010ee:	89 10                	mov    %edx,(%rax)
  8010f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010f4:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8010fb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010ff:	48 89 c7             	mov    %rax,%rdi
  801102:	48 b8 6d 38 80 00 00 	movabs $0x80386d,%rax
  801109:	00 00 00 
  80110c:	ff d0                	callq  *%rax
  80110e:	c9                   	leaveq 
  80110f:	c3                   	retq   

0000000000801110 <devcons_read>:
  801110:	55                   	push   %rbp
  801111:	48 89 e5             	mov    %rsp,%rbp
  801114:	48 83 ec 30          	sub    $0x30,%rsp
  801118:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80111c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801120:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801124:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801129:	75 13                	jne    80113e <devcons_read+0x2e>
  80112b:	b8 00 00 00 00       	mov    $0x0,%eax
  801130:	eb 49                	jmp    80117b <devcons_read+0x6b>
  801132:	48 b8 3d 2b 80 00 00 	movabs $0x802b3d,%rax
  801139:	00 00 00 
  80113c:	ff d0                	callq  *%rax
  80113e:	48 b8 7f 2a 80 00 00 	movabs $0x802a7f,%rax
  801145:	00 00 00 
  801148:	ff d0                	callq  *%rax
  80114a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80114d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801151:	74 df                	je     801132 <devcons_read+0x22>
  801153:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801157:	79 05                	jns    80115e <devcons_read+0x4e>
  801159:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80115c:	eb 1d                	jmp    80117b <devcons_read+0x6b>
  80115e:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  801162:	75 07                	jne    80116b <devcons_read+0x5b>
  801164:	b8 00 00 00 00       	mov    $0x0,%eax
  801169:	eb 10                	jmp    80117b <devcons_read+0x6b>
  80116b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80116e:	89 c2                	mov    %eax,%edx
  801170:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801174:	88 10                	mov    %dl,(%rax)
  801176:	b8 01 00 00 00       	mov    $0x1,%eax
  80117b:	c9                   	leaveq 
  80117c:	c3                   	retq   

000000000080117d <devcons_write>:
  80117d:	55                   	push   %rbp
  80117e:	48 89 e5             	mov    %rsp,%rbp
  801181:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  801188:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  80118f:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  801196:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  80119d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8011a4:	eb 76                	jmp    80121c <devcons_write+0x9f>
  8011a6:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8011ad:	89 c2                	mov    %eax,%edx
  8011af:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011b2:	29 c2                	sub    %eax,%edx
  8011b4:	89 d0                	mov    %edx,%eax
  8011b6:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8011b9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8011bc:	83 f8 7f             	cmp    $0x7f,%eax
  8011bf:	76 07                	jbe    8011c8 <devcons_write+0x4b>
  8011c1:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8011c8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8011cb:	48 63 d0             	movslq %eax,%rdx
  8011ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011d1:	48 63 c8             	movslq %eax,%rcx
  8011d4:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8011db:	48 01 c1             	add    %rax,%rcx
  8011de:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8011e5:	48 89 ce             	mov    %rcx,%rsi
  8011e8:	48 89 c7             	mov    %rax,%rdi
  8011eb:	48 b8 6f 25 80 00 00 	movabs $0x80256f,%rax
  8011f2:	00 00 00 
  8011f5:	ff d0                	callq  *%rax
  8011f7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8011fa:	48 63 d0             	movslq %eax,%rdx
  8011fd:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  801204:	48 89 d6             	mov    %rdx,%rsi
  801207:	48 89 c7             	mov    %rax,%rdi
  80120a:	48 b8 32 2a 80 00 00 	movabs $0x802a32,%rax
  801211:	00 00 00 
  801214:	ff d0                	callq  *%rax
  801216:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801219:	01 45 fc             	add    %eax,-0x4(%rbp)
  80121c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80121f:	48 98                	cltq   
  801221:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  801228:	0f 82 78 ff ff ff    	jb     8011a6 <devcons_write+0x29>
  80122e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801231:	c9                   	leaveq 
  801232:	c3                   	retq   

0000000000801233 <devcons_close>:
  801233:	55                   	push   %rbp
  801234:	48 89 e5             	mov    %rsp,%rbp
  801237:	48 83 ec 08          	sub    $0x8,%rsp
  80123b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80123f:	b8 00 00 00 00       	mov    $0x0,%eax
  801244:	c9                   	leaveq 
  801245:	c3                   	retq   

0000000000801246 <devcons_stat>:
  801246:	55                   	push   %rbp
  801247:	48 89 e5             	mov    %rsp,%rbp
  80124a:	48 83 ec 10          	sub    $0x10,%rsp
  80124e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801252:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801256:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80125a:	48 be e7 6b 80 00 00 	movabs $0x806be7,%rsi
  801261:	00 00 00 
  801264:	48 89 c7             	mov    %rax,%rdi
  801267:	48 b8 4a 22 80 00 00 	movabs $0x80224a,%rax
  80126e:	00 00 00 
  801271:	ff d0                	callq  *%rax
  801273:	b8 00 00 00 00       	mov    $0x0,%eax
  801278:	c9                   	leaveq 
  801279:	c3                   	retq   

000000000080127a <libmain>:
  80127a:	55                   	push   %rbp
  80127b:	48 89 e5             	mov    %rsp,%rbp
  80127e:	48 83 ec 10          	sub    $0x10,%rsp
  801282:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801285:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801289:	48 b8 01 2b 80 00 00 	movabs $0x802b01,%rax
  801290:	00 00 00 
  801293:	ff d0                	callq  *%rax
  801295:	25 ff 03 00 00       	and    $0x3ff,%eax
  80129a:	48 98                	cltq   
  80129c:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8012a3:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8012aa:	00 00 00 
  8012ad:	48 01 c2             	add    %rax,%rdx
  8012b0:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  8012b7:	00 00 00 
  8012ba:	48 89 10             	mov    %rdx,(%rax)
  8012bd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8012c1:	7e 14                	jle    8012d7 <libmain+0x5d>
  8012c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012c7:	48 8b 10             	mov    (%rax),%rdx
  8012ca:	48 b8 58 90 80 00 00 	movabs $0x809058,%rax
  8012d1:	00 00 00 
  8012d4:	48 89 10             	mov    %rdx,(%rax)
  8012d7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8012db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8012de:	48 89 d6             	mov    %rdx,%rsi
  8012e1:	89 c7                	mov    %eax,%edi
  8012e3:	48 b8 5c 0b 80 00 00 	movabs $0x800b5c,%rax
  8012ea:	00 00 00 
  8012ed:	ff d0                	callq  *%rax
  8012ef:	48 b8 fe 12 80 00 00 	movabs $0x8012fe,%rax
  8012f6:	00 00 00 
  8012f9:	ff d0                	callq  *%rax
  8012fb:	90                   	nop
  8012fc:	c9                   	leaveq 
  8012fd:	c3                   	retq   

00000000008012fe <exit>:
  8012fe:	55                   	push   %rbp
  8012ff:	48 89 e5             	mov    %rsp,%rbp
  801302:	48 b8 b0 3b 80 00 00 	movabs $0x803bb0,%rax
  801309:	00 00 00 
  80130c:	ff d0                	callq  *%rax
  80130e:	bf 00 00 00 00       	mov    $0x0,%edi
  801313:	48 b8 bb 2a 80 00 00 	movabs $0x802abb,%rax
  80131a:	00 00 00 
  80131d:	ff d0                	callq  *%rax
  80131f:	90                   	nop
  801320:	5d                   	pop    %rbp
  801321:	c3                   	retq   

0000000000801322 <_panic>:
  801322:	55                   	push   %rbp
  801323:	48 89 e5             	mov    %rsp,%rbp
  801326:	53                   	push   %rbx
  801327:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80132e:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  801335:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  80133b:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  801342:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  801349:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  801350:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  801357:	84 c0                	test   %al,%al
  801359:	74 23                	je     80137e <_panic+0x5c>
  80135b:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  801362:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  801366:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  80136a:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80136e:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  801372:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  801376:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  80137a:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80137e:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  801385:	00 00 00 
  801388:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80138f:	00 00 00 
  801392:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801396:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80139d:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8013a4:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8013ab:	48 b8 58 90 80 00 00 	movabs $0x809058,%rax
  8013b2:	00 00 00 
  8013b5:	48 8b 18             	mov    (%rax),%rbx
  8013b8:	48 b8 01 2b 80 00 00 	movabs $0x802b01,%rax
  8013bf:	00 00 00 
  8013c2:	ff d0                	callq  *%rax
  8013c4:	89 c6                	mov    %eax,%esi
  8013c6:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  8013cc:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  8013d3:	41 89 d0             	mov    %edx,%r8d
  8013d6:	48 89 c1             	mov    %rax,%rcx
  8013d9:	48 89 da             	mov    %rbx,%rdx
  8013dc:	48 bf f8 6b 80 00 00 	movabs $0x806bf8,%rdi
  8013e3:	00 00 00 
  8013e6:	b8 00 00 00 00       	mov    $0x0,%eax
  8013eb:	49 b9 5c 15 80 00 00 	movabs $0x80155c,%r9
  8013f2:	00 00 00 
  8013f5:	41 ff d1             	callq  *%r9
  8013f8:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8013ff:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801406:	48 89 d6             	mov    %rdx,%rsi
  801409:	48 89 c7             	mov    %rax,%rdi
  80140c:	48 b8 b0 14 80 00 00 	movabs $0x8014b0,%rax
  801413:	00 00 00 
  801416:	ff d0                	callq  *%rax
  801418:	48 bf 1b 6c 80 00 00 	movabs $0x806c1b,%rdi
  80141f:	00 00 00 
  801422:	b8 00 00 00 00       	mov    $0x0,%eax
  801427:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  80142e:	00 00 00 
  801431:	ff d2                	callq  *%rdx
  801433:	cc                   	int3   
  801434:	eb fd                	jmp    801433 <_panic+0x111>

0000000000801436 <putch>:
  801436:	55                   	push   %rbp
  801437:	48 89 e5             	mov    %rsp,%rbp
  80143a:	48 83 ec 10          	sub    $0x10,%rsp
  80143e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801441:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801445:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801449:	8b 00                	mov    (%rax),%eax
  80144b:	8d 48 01             	lea    0x1(%rax),%ecx
  80144e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801452:	89 0a                	mov    %ecx,(%rdx)
  801454:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801457:	89 d1                	mov    %edx,%ecx
  801459:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80145d:	48 98                	cltq   
  80145f:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  801463:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801467:	8b 00                	mov    (%rax),%eax
  801469:	3d ff 00 00 00       	cmp    $0xff,%eax
  80146e:	75 2c                	jne    80149c <putch+0x66>
  801470:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801474:	8b 00                	mov    (%rax),%eax
  801476:	48 98                	cltq   
  801478:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80147c:	48 83 c2 08          	add    $0x8,%rdx
  801480:	48 89 c6             	mov    %rax,%rsi
  801483:	48 89 d7             	mov    %rdx,%rdi
  801486:	48 b8 32 2a 80 00 00 	movabs $0x802a32,%rax
  80148d:	00 00 00 
  801490:	ff d0                	callq  *%rax
  801492:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801496:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80149c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014a0:	8b 40 04             	mov    0x4(%rax),%eax
  8014a3:	8d 50 01             	lea    0x1(%rax),%edx
  8014a6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014aa:	89 50 04             	mov    %edx,0x4(%rax)
  8014ad:	90                   	nop
  8014ae:	c9                   	leaveq 
  8014af:	c3                   	retq   

00000000008014b0 <vcprintf>:
  8014b0:	55                   	push   %rbp
  8014b1:	48 89 e5             	mov    %rsp,%rbp
  8014b4:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8014bb:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8014c2:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8014c9:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8014d0:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8014d7:	48 8b 0a             	mov    (%rdx),%rcx
  8014da:	48 89 08             	mov    %rcx,(%rax)
  8014dd:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8014e1:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8014e5:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8014e9:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8014ed:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8014f4:	00 00 00 
  8014f7:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8014fe:	00 00 00 
  801501:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  801508:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80150f:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  801516:	48 89 c6             	mov    %rax,%rsi
  801519:	48 bf 36 14 80 00 00 	movabs $0x801436,%rdi
  801520:	00 00 00 
  801523:	48 b8 fa 18 80 00 00 	movabs $0x8018fa,%rax
  80152a:	00 00 00 
  80152d:	ff d0                	callq  *%rax
  80152f:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  801535:	48 98                	cltq   
  801537:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80153e:	48 83 c2 08          	add    $0x8,%rdx
  801542:	48 89 c6             	mov    %rax,%rsi
  801545:	48 89 d7             	mov    %rdx,%rdi
  801548:	48 b8 32 2a 80 00 00 	movabs $0x802a32,%rax
  80154f:	00 00 00 
  801552:	ff d0                	callq  *%rax
  801554:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  80155a:	c9                   	leaveq 
  80155b:	c3                   	retq   

000000000080155c <cprintf>:
  80155c:	55                   	push   %rbp
  80155d:	48 89 e5             	mov    %rsp,%rbp
  801560:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  801567:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80156e:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  801575:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80157c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801583:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80158a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801591:	84 c0                	test   %al,%al
  801593:	74 20                	je     8015b5 <cprintf+0x59>
  801595:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801599:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80159d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8015a1:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8015a5:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8015a9:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8015ad:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8015b1:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8015b5:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8015bc:	00 00 00 
  8015bf:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8015c6:	00 00 00 
  8015c9:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8015cd:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8015d4:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8015db:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8015e2:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8015e9:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8015f0:	48 8b 0a             	mov    (%rdx),%rcx
  8015f3:	48 89 08             	mov    %rcx,(%rax)
  8015f6:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8015fa:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8015fe:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801602:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801606:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80160d:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801614:	48 89 d6             	mov    %rdx,%rsi
  801617:	48 89 c7             	mov    %rax,%rdi
  80161a:	48 b8 b0 14 80 00 00 	movabs $0x8014b0,%rax
  801621:	00 00 00 
  801624:	ff d0                	callq  *%rax
  801626:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80162c:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801632:	c9                   	leaveq 
  801633:	c3                   	retq   

0000000000801634 <printnum>:
  801634:	55                   	push   %rbp
  801635:	48 89 e5             	mov    %rsp,%rbp
  801638:	48 83 ec 30          	sub    $0x30,%rsp
  80163c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801640:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801644:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801648:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  80164b:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  80164f:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  801653:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801656:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  80165a:	77 54                	ja     8016b0 <printnum+0x7c>
  80165c:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80165f:	8d 78 ff             	lea    -0x1(%rax),%edi
  801662:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  801665:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801669:	ba 00 00 00 00       	mov    $0x0,%edx
  80166e:	48 f7 f6             	div    %rsi
  801671:	49 89 c2             	mov    %rax,%r10
  801674:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  801677:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80167a:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80167e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801682:	41 89 c9             	mov    %ecx,%r9d
  801685:	41 89 f8             	mov    %edi,%r8d
  801688:	89 d1                	mov    %edx,%ecx
  80168a:	4c 89 d2             	mov    %r10,%rdx
  80168d:	48 89 c7             	mov    %rax,%rdi
  801690:	48 b8 34 16 80 00 00 	movabs $0x801634,%rax
  801697:	00 00 00 
  80169a:	ff d0                	callq  *%rax
  80169c:	eb 1c                	jmp    8016ba <printnum+0x86>
  80169e:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8016a2:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8016a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016a9:	48 89 ce             	mov    %rcx,%rsi
  8016ac:	89 d7                	mov    %edx,%edi
  8016ae:	ff d0                	callq  *%rax
  8016b0:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  8016b4:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  8016b8:	7f e4                	jg     80169e <printnum+0x6a>
  8016ba:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8016bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016c1:	ba 00 00 00 00       	mov    $0x0,%edx
  8016c6:	48 f7 f1             	div    %rcx
  8016c9:	48 b8 10 6e 80 00 00 	movabs $0x806e10,%rax
  8016d0:	00 00 00 
  8016d3:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  8016d7:	0f be d0             	movsbl %al,%edx
  8016da:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8016de:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016e2:	48 89 ce             	mov    %rcx,%rsi
  8016e5:	89 d7                	mov    %edx,%edi
  8016e7:	ff d0                	callq  *%rax
  8016e9:	90                   	nop
  8016ea:	c9                   	leaveq 
  8016eb:	c3                   	retq   

00000000008016ec <getuint>:
  8016ec:	55                   	push   %rbp
  8016ed:	48 89 e5             	mov    %rsp,%rbp
  8016f0:	48 83 ec 20          	sub    $0x20,%rsp
  8016f4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8016f8:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8016fb:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8016ff:	7e 4f                	jle    801750 <getuint+0x64>
  801701:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801705:	8b 00                	mov    (%rax),%eax
  801707:	83 f8 30             	cmp    $0x30,%eax
  80170a:	73 24                	jae    801730 <getuint+0x44>
  80170c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801710:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801714:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801718:	8b 00                	mov    (%rax),%eax
  80171a:	89 c0                	mov    %eax,%eax
  80171c:	48 01 d0             	add    %rdx,%rax
  80171f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801723:	8b 12                	mov    (%rdx),%edx
  801725:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801728:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80172c:	89 0a                	mov    %ecx,(%rdx)
  80172e:	eb 14                	jmp    801744 <getuint+0x58>
  801730:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801734:	48 8b 40 08          	mov    0x8(%rax),%rax
  801738:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80173c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801740:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801744:	48 8b 00             	mov    (%rax),%rax
  801747:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80174b:	e9 9d 00 00 00       	jmpq   8017ed <getuint+0x101>
  801750:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  801754:	74 4c                	je     8017a2 <getuint+0xb6>
  801756:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80175a:	8b 00                	mov    (%rax),%eax
  80175c:	83 f8 30             	cmp    $0x30,%eax
  80175f:	73 24                	jae    801785 <getuint+0x99>
  801761:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801765:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801769:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80176d:	8b 00                	mov    (%rax),%eax
  80176f:	89 c0                	mov    %eax,%eax
  801771:	48 01 d0             	add    %rdx,%rax
  801774:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801778:	8b 12                	mov    (%rdx),%edx
  80177a:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80177d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801781:	89 0a                	mov    %ecx,(%rdx)
  801783:	eb 14                	jmp    801799 <getuint+0xad>
  801785:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801789:	48 8b 40 08          	mov    0x8(%rax),%rax
  80178d:	48 8d 48 08          	lea    0x8(%rax),%rcx
  801791:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801795:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801799:	48 8b 00             	mov    (%rax),%rax
  80179c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8017a0:	eb 4b                	jmp    8017ed <getuint+0x101>
  8017a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017a6:	8b 00                	mov    (%rax),%eax
  8017a8:	83 f8 30             	cmp    $0x30,%eax
  8017ab:	73 24                	jae    8017d1 <getuint+0xe5>
  8017ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017b1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8017b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017b9:	8b 00                	mov    (%rax),%eax
  8017bb:	89 c0                	mov    %eax,%eax
  8017bd:	48 01 d0             	add    %rdx,%rax
  8017c0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017c4:	8b 12                	mov    (%rdx),%edx
  8017c6:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8017c9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017cd:	89 0a                	mov    %ecx,(%rdx)
  8017cf:	eb 14                	jmp    8017e5 <getuint+0xf9>
  8017d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017d5:	48 8b 40 08          	mov    0x8(%rax),%rax
  8017d9:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8017dd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017e1:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8017e5:	8b 00                	mov    (%rax),%eax
  8017e7:	89 c0                	mov    %eax,%eax
  8017e9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8017ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017f1:	c9                   	leaveq 
  8017f2:	c3                   	retq   

00000000008017f3 <getint>:
  8017f3:	55                   	push   %rbp
  8017f4:	48 89 e5             	mov    %rsp,%rbp
  8017f7:	48 83 ec 20          	sub    $0x20,%rsp
  8017fb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8017ff:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801802:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  801806:	7e 4f                	jle    801857 <getint+0x64>
  801808:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80180c:	8b 00                	mov    (%rax),%eax
  80180e:	83 f8 30             	cmp    $0x30,%eax
  801811:	73 24                	jae    801837 <getint+0x44>
  801813:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801817:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80181b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80181f:	8b 00                	mov    (%rax),%eax
  801821:	89 c0                	mov    %eax,%eax
  801823:	48 01 d0             	add    %rdx,%rax
  801826:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80182a:	8b 12                	mov    (%rdx),%edx
  80182c:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80182f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801833:	89 0a                	mov    %ecx,(%rdx)
  801835:	eb 14                	jmp    80184b <getint+0x58>
  801837:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80183b:	48 8b 40 08          	mov    0x8(%rax),%rax
  80183f:	48 8d 48 08          	lea    0x8(%rax),%rcx
  801843:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801847:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80184b:	48 8b 00             	mov    (%rax),%rax
  80184e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801852:	e9 9d 00 00 00       	jmpq   8018f4 <getint+0x101>
  801857:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80185b:	74 4c                	je     8018a9 <getint+0xb6>
  80185d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801861:	8b 00                	mov    (%rax),%eax
  801863:	83 f8 30             	cmp    $0x30,%eax
  801866:	73 24                	jae    80188c <getint+0x99>
  801868:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80186c:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801870:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801874:	8b 00                	mov    (%rax),%eax
  801876:	89 c0                	mov    %eax,%eax
  801878:	48 01 d0             	add    %rdx,%rax
  80187b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80187f:	8b 12                	mov    (%rdx),%edx
  801881:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801884:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801888:	89 0a                	mov    %ecx,(%rdx)
  80188a:	eb 14                	jmp    8018a0 <getint+0xad>
  80188c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801890:	48 8b 40 08          	mov    0x8(%rax),%rax
  801894:	48 8d 48 08          	lea    0x8(%rax),%rcx
  801898:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80189c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8018a0:	48 8b 00             	mov    (%rax),%rax
  8018a3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8018a7:	eb 4b                	jmp    8018f4 <getint+0x101>
  8018a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018ad:	8b 00                	mov    (%rax),%eax
  8018af:	83 f8 30             	cmp    $0x30,%eax
  8018b2:	73 24                	jae    8018d8 <getint+0xe5>
  8018b4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018b8:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8018bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018c0:	8b 00                	mov    (%rax),%eax
  8018c2:	89 c0                	mov    %eax,%eax
  8018c4:	48 01 d0             	add    %rdx,%rax
  8018c7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8018cb:	8b 12                	mov    (%rdx),%edx
  8018cd:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8018d0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8018d4:	89 0a                	mov    %ecx,(%rdx)
  8018d6:	eb 14                	jmp    8018ec <getint+0xf9>
  8018d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018dc:	48 8b 40 08          	mov    0x8(%rax),%rax
  8018e0:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8018e4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8018e8:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8018ec:	8b 00                	mov    (%rax),%eax
  8018ee:	48 98                	cltq   
  8018f0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8018f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018f8:	c9                   	leaveq 
  8018f9:	c3                   	retq   

00000000008018fa <vprintfmt>:
  8018fa:	55                   	push   %rbp
  8018fb:	48 89 e5             	mov    %rsp,%rbp
  8018fe:	41 54                	push   %r12
  801900:	53                   	push   %rbx
  801901:	48 83 ec 60          	sub    $0x60,%rsp
  801905:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  801909:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  80190d:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  801911:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  801915:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801919:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  80191d:	48 8b 0a             	mov    (%rdx),%rcx
  801920:	48 89 08             	mov    %rcx,(%rax)
  801923:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801927:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80192b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80192f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801933:	eb 17                	jmp    80194c <vprintfmt+0x52>
  801935:	85 db                	test   %ebx,%ebx
  801937:	0f 84 b9 04 00 00    	je     801df6 <vprintfmt+0x4fc>
  80193d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801941:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801945:	48 89 d6             	mov    %rdx,%rsi
  801948:	89 df                	mov    %ebx,%edi
  80194a:	ff d0                	callq  *%rax
  80194c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801950:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801954:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  801958:	0f b6 00             	movzbl (%rax),%eax
  80195b:	0f b6 d8             	movzbl %al,%ebx
  80195e:	83 fb 25             	cmp    $0x25,%ebx
  801961:	75 d2                	jne    801935 <vprintfmt+0x3b>
  801963:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  801967:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  80196e:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  801975:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80197c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  801983:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801987:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80198b:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80198f:	0f b6 00             	movzbl (%rax),%eax
  801992:	0f b6 d8             	movzbl %al,%ebx
  801995:	8d 43 dd             	lea    -0x23(%rbx),%eax
  801998:	83 f8 55             	cmp    $0x55,%eax
  80199b:	0f 87 22 04 00 00    	ja     801dc3 <vprintfmt+0x4c9>
  8019a1:	89 c0                	mov    %eax,%eax
  8019a3:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8019aa:	00 
  8019ab:	48 b8 38 6e 80 00 00 	movabs $0x806e38,%rax
  8019b2:	00 00 00 
  8019b5:	48 01 d0             	add    %rdx,%rax
  8019b8:	48 8b 00             	mov    (%rax),%rax
  8019bb:	ff e0                	jmpq   *%rax
  8019bd:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8019c1:	eb c0                	jmp    801983 <vprintfmt+0x89>
  8019c3:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8019c7:	eb ba                	jmp    801983 <vprintfmt+0x89>
  8019c9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8019d0:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8019d3:	89 d0                	mov    %edx,%eax
  8019d5:	c1 e0 02             	shl    $0x2,%eax
  8019d8:	01 d0                	add    %edx,%eax
  8019da:	01 c0                	add    %eax,%eax
  8019dc:	01 d8                	add    %ebx,%eax
  8019de:	83 e8 30             	sub    $0x30,%eax
  8019e1:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8019e4:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8019e8:	0f b6 00             	movzbl (%rax),%eax
  8019eb:	0f be d8             	movsbl %al,%ebx
  8019ee:	83 fb 2f             	cmp    $0x2f,%ebx
  8019f1:	7e 60                	jle    801a53 <vprintfmt+0x159>
  8019f3:	83 fb 39             	cmp    $0x39,%ebx
  8019f6:	7f 5b                	jg     801a53 <vprintfmt+0x159>
  8019f8:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8019fd:	eb d1                	jmp    8019d0 <vprintfmt+0xd6>
  8019ff:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801a02:	83 f8 30             	cmp    $0x30,%eax
  801a05:	73 17                	jae    801a1e <vprintfmt+0x124>
  801a07:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801a0b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801a0e:	89 d2                	mov    %edx,%edx
  801a10:	48 01 d0             	add    %rdx,%rax
  801a13:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801a16:	83 c2 08             	add    $0x8,%edx
  801a19:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801a1c:	eb 0c                	jmp    801a2a <vprintfmt+0x130>
  801a1e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801a22:	48 8d 50 08          	lea    0x8(%rax),%rdx
  801a26:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801a2a:	8b 00                	mov    (%rax),%eax
  801a2c:	89 45 d8             	mov    %eax,-0x28(%rbp)
  801a2f:	eb 23                	jmp    801a54 <vprintfmt+0x15a>
  801a31:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801a35:	0f 89 48 ff ff ff    	jns    801983 <vprintfmt+0x89>
  801a3b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  801a42:	e9 3c ff ff ff       	jmpq   801983 <vprintfmt+0x89>
  801a47:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  801a4e:	e9 30 ff ff ff       	jmpq   801983 <vprintfmt+0x89>
  801a53:	90                   	nop
  801a54:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801a58:	0f 89 25 ff ff ff    	jns    801983 <vprintfmt+0x89>
  801a5e:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801a61:	89 45 dc             	mov    %eax,-0x24(%rbp)
  801a64:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  801a6b:	e9 13 ff ff ff       	jmpq   801983 <vprintfmt+0x89>
  801a70:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  801a74:	e9 0a ff ff ff       	jmpq   801983 <vprintfmt+0x89>
  801a79:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801a7c:	83 f8 30             	cmp    $0x30,%eax
  801a7f:	73 17                	jae    801a98 <vprintfmt+0x19e>
  801a81:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801a85:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801a88:	89 d2                	mov    %edx,%edx
  801a8a:	48 01 d0             	add    %rdx,%rax
  801a8d:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801a90:	83 c2 08             	add    $0x8,%edx
  801a93:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801a96:	eb 0c                	jmp    801aa4 <vprintfmt+0x1aa>
  801a98:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801a9c:	48 8d 50 08          	lea    0x8(%rax),%rdx
  801aa0:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801aa4:	8b 10                	mov    (%rax),%edx
  801aa6:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  801aaa:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801aae:	48 89 ce             	mov    %rcx,%rsi
  801ab1:	89 d7                	mov    %edx,%edi
  801ab3:	ff d0                	callq  *%rax
  801ab5:	e9 37 03 00 00       	jmpq   801df1 <vprintfmt+0x4f7>
  801aba:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801abd:	83 f8 30             	cmp    $0x30,%eax
  801ac0:	73 17                	jae    801ad9 <vprintfmt+0x1df>
  801ac2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801ac6:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801ac9:	89 d2                	mov    %edx,%edx
  801acb:	48 01 d0             	add    %rdx,%rax
  801ace:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801ad1:	83 c2 08             	add    $0x8,%edx
  801ad4:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801ad7:	eb 0c                	jmp    801ae5 <vprintfmt+0x1eb>
  801ad9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801add:	48 8d 50 08          	lea    0x8(%rax),%rdx
  801ae1:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801ae5:	8b 18                	mov    (%rax),%ebx
  801ae7:	85 db                	test   %ebx,%ebx
  801ae9:	79 02                	jns    801aed <vprintfmt+0x1f3>
  801aeb:	f7 db                	neg    %ebx
  801aed:	83 fb 15             	cmp    $0x15,%ebx
  801af0:	7f 16                	jg     801b08 <vprintfmt+0x20e>
  801af2:	48 b8 60 6d 80 00 00 	movabs $0x806d60,%rax
  801af9:	00 00 00 
  801afc:	48 63 d3             	movslq %ebx,%rdx
  801aff:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  801b03:	4d 85 e4             	test   %r12,%r12
  801b06:	75 2e                	jne    801b36 <vprintfmt+0x23c>
  801b08:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801b0c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801b10:	89 d9                	mov    %ebx,%ecx
  801b12:	48 ba 21 6e 80 00 00 	movabs $0x806e21,%rdx
  801b19:	00 00 00 
  801b1c:	48 89 c7             	mov    %rax,%rdi
  801b1f:	b8 00 00 00 00       	mov    $0x0,%eax
  801b24:	49 b8 00 1e 80 00 00 	movabs $0x801e00,%r8
  801b2b:	00 00 00 
  801b2e:	41 ff d0             	callq  *%r8
  801b31:	e9 bb 02 00 00       	jmpq   801df1 <vprintfmt+0x4f7>
  801b36:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801b3a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801b3e:	4c 89 e1             	mov    %r12,%rcx
  801b41:	48 ba 2a 6e 80 00 00 	movabs $0x806e2a,%rdx
  801b48:	00 00 00 
  801b4b:	48 89 c7             	mov    %rax,%rdi
  801b4e:	b8 00 00 00 00       	mov    $0x0,%eax
  801b53:	49 b8 00 1e 80 00 00 	movabs $0x801e00,%r8
  801b5a:	00 00 00 
  801b5d:	41 ff d0             	callq  *%r8
  801b60:	e9 8c 02 00 00       	jmpq   801df1 <vprintfmt+0x4f7>
  801b65:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801b68:	83 f8 30             	cmp    $0x30,%eax
  801b6b:	73 17                	jae    801b84 <vprintfmt+0x28a>
  801b6d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801b71:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801b74:	89 d2                	mov    %edx,%edx
  801b76:	48 01 d0             	add    %rdx,%rax
  801b79:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801b7c:	83 c2 08             	add    $0x8,%edx
  801b7f:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801b82:	eb 0c                	jmp    801b90 <vprintfmt+0x296>
  801b84:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801b88:	48 8d 50 08          	lea    0x8(%rax),%rdx
  801b8c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801b90:	4c 8b 20             	mov    (%rax),%r12
  801b93:	4d 85 e4             	test   %r12,%r12
  801b96:	75 0a                	jne    801ba2 <vprintfmt+0x2a8>
  801b98:	49 bc 2d 6e 80 00 00 	movabs $0x806e2d,%r12
  801b9f:	00 00 00 
  801ba2:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801ba6:	7e 78                	jle    801c20 <vprintfmt+0x326>
  801ba8:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  801bac:	74 72                	je     801c20 <vprintfmt+0x326>
  801bae:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801bb1:	48 98                	cltq   
  801bb3:	48 89 c6             	mov    %rax,%rsi
  801bb6:	4c 89 e7             	mov    %r12,%rdi
  801bb9:	48 b8 0c 22 80 00 00 	movabs $0x80220c,%rax
  801bc0:	00 00 00 
  801bc3:	ff d0                	callq  *%rax
  801bc5:	29 45 dc             	sub    %eax,-0x24(%rbp)
  801bc8:	eb 17                	jmp    801be1 <vprintfmt+0x2e7>
  801bca:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  801bce:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  801bd2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801bd6:	48 89 ce             	mov    %rcx,%rsi
  801bd9:	89 d7                	mov    %edx,%edi
  801bdb:	ff d0                	callq  *%rax
  801bdd:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801be1:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801be5:	7f e3                	jg     801bca <vprintfmt+0x2d0>
  801be7:	eb 37                	jmp    801c20 <vprintfmt+0x326>
  801be9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  801bed:	74 1e                	je     801c0d <vprintfmt+0x313>
  801bef:	83 fb 1f             	cmp    $0x1f,%ebx
  801bf2:	7e 05                	jle    801bf9 <vprintfmt+0x2ff>
  801bf4:	83 fb 7e             	cmp    $0x7e,%ebx
  801bf7:	7e 14                	jle    801c0d <vprintfmt+0x313>
  801bf9:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801bfd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801c01:	48 89 d6             	mov    %rdx,%rsi
  801c04:	bf 3f 00 00 00       	mov    $0x3f,%edi
  801c09:	ff d0                	callq  *%rax
  801c0b:	eb 0f                	jmp    801c1c <vprintfmt+0x322>
  801c0d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801c11:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801c15:	48 89 d6             	mov    %rdx,%rsi
  801c18:	89 df                	mov    %ebx,%edi
  801c1a:	ff d0                	callq  *%rax
  801c1c:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801c20:	4c 89 e0             	mov    %r12,%rax
  801c23:	4c 8d 60 01          	lea    0x1(%rax),%r12
  801c27:	0f b6 00             	movzbl (%rax),%eax
  801c2a:	0f be d8             	movsbl %al,%ebx
  801c2d:	85 db                	test   %ebx,%ebx
  801c2f:	74 28                	je     801c59 <vprintfmt+0x35f>
  801c31:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801c35:	78 b2                	js     801be9 <vprintfmt+0x2ef>
  801c37:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  801c3b:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801c3f:	79 a8                	jns    801be9 <vprintfmt+0x2ef>
  801c41:	eb 16                	jmp    801c59 <vprintfmt+0x35f>
  801c43:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801c47:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801c4b:	48 89 d6             	mov    %rdx,%rsi
  801c4e:	bf 20 00 00 00       	mov    $0x20,%edi
  801c53:	ff d0                	callq  *%rax
  801c55:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801c59:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801c5d:	7f e4                	jg     801c43 <vprintfmt+0x349>
  801c5f:	e9 8d 01 00 00       	jmpq   801df1 <vprintfmt+0x4f7>
  801c64:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801c68:	be 03 00 00 00       	mov    $0x3,%esi
  801c6d:	48 89 c7             	mov    %rax,%rdi
  801c70:	48 b8 f3 17 80 00 00 	movabs $0x8017f3,%rax
  801c77:	00 00 00 
  801c7a:	ff d0                	callq  *%rax
  801c7c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801c80:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c84:	48 85 c0             	test   %rax,%rax
  801c87:	79 1d                	jns    801ca6 <vprintfmt+0x3ac>
  801c89:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801c8d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801c91:	48 89 d6             	mov    %rdx,%rsi
  801c94:	bf 2d 00 00 00       	mov    $0x2d,%edi
  801c99:	ff d0                	callq  *%rax
  801c9b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c9f:	48 f7 d8             	neg    %rax
  801ca2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801ca6:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  801cad:	e9 d2 00 00 00       	jmpq   801d84 <vprintfmt+0x48a>
  801cb2:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801cb6:	be 03 00 00 00       	mov    $0x3,%esi
  801cbb:	48 89 c7             	mov    %rax,%rdi
  801cbe:	48 b8 ec 16 80 00 00 	movabs $0x8016ec,%rax
  801cc5:	00 00 00 
  801cc8:	ff d0                	callq  *%rax
  801cca:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801cce:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  801cd5:	e9 aa 00 00 00       	jmpq   801d84 <vprintfmt+0x48a>
  801cda:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801cde:	be 03 00 00 00       	mov    $0x3,%esi
  801ce3:	48 89 c7             	mov    %rax,%rdi
  801ce6:	48 b8 ec 16 80 00 00 	movabs $0x8016ec,%rax
  801ced:	00 00 00 
  801cf0:	ff d0                	callq  *%rax
  801cf2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801cf6:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  801cfd:	e9 82 00 00 00       	jmpq   801d84 <vprintfmt+0x48a>
  801d02:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801d06:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801d0a:	48 89 d6             	mov    %rdx,%rsi
  801d0d:	bf 30 00 00 00       	mov    $0x30,%edi
  801d12:	ff d0                	callq  *%rax
  801d14:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801d18:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801d1c:	48 89 d6             	mov    %rdx,%rsi
  801d1f:	bf 78 00 00 00       	mov    $0x78,%edi
  801d24:	ff d0                	callq  *%rax
  801d26:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801d29:	83 f8 30             	cmp    $0x30,%eax
  801d2c:	73 17                	jae    801d45 <vprintfmt+0x44b>
  801d2e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801d32:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801d35:	89 d2                	mov    %edx,%edx
  801d37:	48 01 d0             	add    %rdx,%rax
  801d3a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801d3d:	83 c2 08             	add    $0x8,%edx
  801d40:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801d43:	eb 0c                	jmp    801d51 <vprintfmt+0x457>
  801d45:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801d49:	48 8d 50 08          	lea    0x8(%rax),%rdx
  801d4d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801d51:	48 8b 00             	mov    (%rax),%rax
  801d54:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801d58:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801d5f:	eb 23                	jmp    801d84 <vprintfmt+0x48a>
  801d61:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801d65:	be 03 00 00 00       	mov    $0x3,%esi
  801d6a:	48 89 c7             	mov    %rax,%rdi
  801d6d:	48 b8 ec 16 80 00 00 	movabs $0x8016ec,%rax
  801d74:	00 00 00 
  801d77:	ff d0                	callq  *%rax
  801d79:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801d7d:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801d84:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  801d89:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  801d8c:	8b 7d dc             	mov    -0x24(%rbp),%edi
  801d8f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801d93:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801d97:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801d9b:	45 89 c1             	mov    %r8d,%r9d
  801d9e:	41 89 f8             	mov    %edi,%r8d
  801da1:	48 89 c7             	mov    %rax,%rdi
  801da4:	48 b8 34 16 80 00 00 	movabs $0x801634,%rax
  801dab:	00 00 00 
  801dae:	ff d0                	callq  *%rax
  801db0:	eb 3f                	jmp    801df1 <vprintfmt+0x4f7>
  801db2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801db6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801dba:	48 89 d6             	mov    %rdx,%rsi
  801dbd:	89 df                	mov    %ebx,%edi
  801dbf:	ff d0                	callq  *%rax
  801dc1:	eb 2e                	jmp    801df1 <vprintfmt+0x4f7>
  801dc3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801dc7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801dcb:	48 89 d6             	mov    %rdx,%rsi
  801dce:	bf 25 00 00 00       	mov    $0x25,%edi
  801dd3:	ff d0                	callq  *%rax
  801dd5:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  801dda:	eb 05                	jmp    801de1 <vprintfmt+0x4e7>
  801ddc:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  801de1:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801de5:	48 83 e8 01          	sub    $0x1,%rax
  801de9:	0f b6 00             	movzbl (%rax),%eax
  801dec:	3c 25                	cmp    $0x25,%al
  801dee:	75 ec                	jne    801ddc <vprintfmt+0x4e2>
  801df0:	90                   	nop
  801df1:	e9 3d fb ff ff       	jmpq   801933 <vprintfmt+0x39>
  801df6:	90                   	nop
  801df7:	48 83 c4 60          	add    $0x60,%rsp
  801dfb:	5b                   	pop    %rbx
  801dfc:	41 5c                	pop    %r12
  801dfe:	5d                   	pop    %rbp
  801dff:	c3                   	retq   

0000000000801e00 <printfmt>:
  801e00:	55                   	push   %rbp
  801e01:	48 89 e5             	mov    %rsp,%rbp
  801e04:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  801e0b:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  801e12:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  801e19:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  801e20:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801e27:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801e2e:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801e35:	84 c0                	test   %al,%al
  801e37:	74 20                	je     801e59 <printfmt+0x59>
  801e39:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801e3d:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801e41:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801e45:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801e49:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801e4d:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801e51:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801e55:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801e59:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801e60:	00 00 00 
  801e63:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  801e6a:	00 00 00 
  801e6d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801e71:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801e78:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801e7f:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  801e86:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  801e8d:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  801e94:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  801e9b:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  801ea2:	48 89 c7             	mov    %rax,%rdi
  801ea5:	48 b8 fa 18 80 00 00 	movabs $0x8018fa,%rax
  801eac:	00 00 00 
  801eaf:	ff d0                	callq  *%rax
  801eb1:	90                   	nop
  801eb2:	c9                   	leaveq 
  801eb3:	c3                   	retq   

0000000000801eb4 <sprintputch>:
  801eb4:	55                   	push   %rbp
  801eb5:	48 89 e5             	mov    %rsp,%rbp
  801eb8:	48 83 ec 10          	sub    $0x10,%rsp
  801ebc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ebf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ec3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ec7:	8b 40 10             	mov    0x10(%rax),%eax
  801eca:	8d 50 01             	lea    0x1(%rax),%edx
  801ecd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ed1:	89 50 10             	mov    %edx,0x10(%rax)
  801ed4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ed8:	48 8b 10             	mov    (%rax),%rdx
  801edb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801edf:	48 8b 40 08          	mov    0x8(%rax),%rax
  801ee3:	48 39 c2             	cmp    %rax,%rdx
  801ee6:	73 17                	jae    801eff <sprintputch+0x4b>
  801ee8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801eec:	48 8b 00             	mov    (%rax),%rax
  801eef:	48 8d 48 01          	lea    0x1(%rax),%rcx
  801ef3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ef7:	48 89 0a             	mov    %rcx,(%rdx)
  801efa:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801efd:	88 10                	mov    %dl,(%rax)
  801eff:	90                   	nop
  801f00:	c9                   	leaveq 
  801f01:	c3                   	retq   

0000000000801f02 <vsnprintf>:
  801f02:	55                   	push   %rbp
  801f03:	48 89 e5             	mov    %rsp,%rbp
  801f06:	48 83 ec 50          	sub    $0x50,%rsp
  801f0a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  801f0e:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  801f11:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801f15:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  801f19:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  801f1d:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801f21:	48 8b 0a             	mov    (%rdx),%rcx
  801f24:	48 89 08             	mov    %rcx,(%rax)
  801f27:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801f2b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801f2f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801f33:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801f37:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801f3b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801f3f:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801f42:	48 98                	cltq   
  801f44:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801f48:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801f4c:	48 01 d0             	add    %rdx,%rax
  801f4f:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801f53:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  801f5a:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  801f5f:	74 06                	je     801f67 <vsnprintf+0x65>
  801f61:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801f65:	7f 07                	jg     801f6e <vsnprintf+0x6c>
  801f67:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801f6c:	eb 2f                	jmp    801f9d <vsnprintf+0x9b>
  801f6e:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801f72:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801f76:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  801f7a:	48 89 c6             	mov    %rax,%rsi
  801f7d:	48 bf b4 1e 80 00 00 	movabs $0x801eb4,%rdi
  801f84:	00 00 00 
  801f87:	48 b8 fa 18 80 00 00 	movabs $0x8018fa,%rax
  801f8e:	00 00 00 
  801f91:	ff d0                	callq  *%rax
  801f93:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801f97:	c6 00 00             	movb   $0x0,(%rax)
  801f9a:	8b 45 e0             	mov    -0x20(%rbp),%eax
  801f9d:	c9                   	leaveq 
  801f9e:	c3                   	retq   

0000000000801f9f <snprintf>:
  801f9f:	55                   	push   %rbp
  801fa0:	48 89 e5             	mov    %rsp,%rbp
  801fa3:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  801faa:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  801fb1:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801fb7:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  801fbe:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801fc5:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801fcc:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801fd3:	84 c0                	test   %al,%al
  801fd5:	74 20                	je     801ff7 <snprintf+0x58>
  801fd7:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801fdb:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801fdf:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801fe3:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801fe7:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801feb:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801fef:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801ff3:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801ff7:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  801ffe:	00 00 00 
  802001:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  802008:	00 00 00 
  80200b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80200f:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  802016:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80201d:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  802024:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80202b:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  802032:	48 8b 0a             	mov    (%rdx),%rcx
  802035:	48 89 08             	mov    %rcx,(%rax)
  802038:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80203c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  802040:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  802044:	48 89 50 10          	mov    %rdx,0x10(%rax)
  802048:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80204f:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  802056:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80205c:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  802063:	48 89 c7             	mov    %rax,%rdi
  802066:	48 b8 02 1f 80 00 00 	movabs $0x801f02,%rax
  80206d:	00 00 00 
  802070:	ff d0                	callq  *%rax
  802072:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  802078:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80207e:	c9                   	leaveq 
  80207f:	c3                   	retq   

0000000000802080 <readline>:
  802080:	55                   	push   %rbp
  802081:	48 89 e5             	mov    %rsp,%rbp
  802084:	48 83 ec 20          	sub    $0x20,%rsp
  802088:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80208c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802091:	74 27                	je     8020ba <readline+0x3a>
  802093:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802097:	48 89 c2             	mov    %rax,%rdx
  80209a:	48 be e8 70 80 00 00 	movabs $0x8070e8,%rsi
  8020a1:	00 00 00 
  8020a4:	bf 01 00 00 00       	mov    $0x1,%edi
  8020a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8020ae:	48 b9 38 4a 80 00 00 	movabs $0x804a38,%rcx
  8020b5:	00 00 00 
  8020b8:	ff d1                	callq  *%rcx
  8020ba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8020c1:	bf 00 00 00 00       	mov    $0x0,%edi
  8020c6:	48 b8 3d 10 80 00 00 	movabs $0x80103d,%rax
  8020cd:	00 00 00 
  8020d0:	ff d0                	callq  *%rax
  8020d2:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8020d5:	48 b8 f4 0f 80 00 00 	movabs $0x800ff4,%rax
  8020dc:	00 00 00 
  8020df:	ff d0                	callq  *%rax
  8020e1:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8020e4:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8020e8:	79 30                	jns    80211a <readline+0x9a>
  8020ea:	83 7d f4 f7          	cmpl   $0xfffffff7,-0xc(%rbp)
  8020ee:	74 20                	je     802110 <readline+0x90>
  8020f0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8020f3:	89 c6                	mov    %eax,%esi
  8020f5:	48 bf eb 70 80 00 00 	movabs $0x8070eb,%rdi
  8020fc:	00 00 00 
  8020ff:	b8 00 00 00 00       	mov    $0x0,%eax
  802104:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  80210b:	00 00 00 
  80210e:	ff d2                	callq  *%rdx
  802110:	b8 00 00 00 00       	mov    $0x0,%eax
  802115:	e9 c2 00 00 00       	jmpq   8021dc <readline+0x15c>
  80211a:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
  80211e:	74 06                	je     802126 <readline+0xa6>
  802120:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%rbp)
  802124:	75 26                	jne    80214c <readline+0xcc>
  802126:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80212a:	7e 20                	jle    80214c <readline+0xcc>
  80212c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802130:	74 11                	je     802143 <readline+0xc3>
  802132:	bf 08 00 00 00       	mov    $0x8,%edi
  802137:	48 b8 c8 0f 80 00 00 	movabs $0x800fc8,%rax
  80213e:	00 00 00 
  802141:	ff d0                	callq  *%rax
  802143:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
  802147:	e9 8b 00 00 00       	jmpq   8021d7 <readline+0x157>
  80214c:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%rbp)
  802150:	7e 3f                	jle    802191 <readline+0x111>
  802152:	81 7d fc fe 03 00 00 	cmpl   $0x3fe,-0x4(%rbp)
  802159:	7f 36                	jg     802191 <readline+0x111>
  80215b:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80215f:	74 11                	je     802172 <readline+0xf2>
  802161:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802164:	89 c7                	mov    %eax,%edi
  802166:	48 b8 c8 0f 80 00 00 	movabs $0x800fc8,%rax
  80216d:	00 00 00 
  802170:	ff d0                	callq  *%rax
  802172:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802175:	8d 50 01             	lea    0x1(%rax),%edx
  802178:	89 55 fc             	mov    %edx,-0x4(%rbp)
  80217b:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80217e:	89 d1                	mov    %edx,%ecx
  802180:	48 ba 20 a0 80 00 00 	movabs $0x80a020,%rdx
  802187:	00 00 00 
  80218a:	48 98                	cltq   
  80218c:	88 0c 02             	mov    %cl,(%rdx,%rax,1)
  80218f:	eb 46                	jmp    8021d7 <readline+0x157>
  802191:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  802195:	74 0a                	je     8021a1 <readline+0x121>
  802197:	83 7d f4 0d          	cmpl   $0xd,-0xc(%rbp)
  80219b:	0f 85 34 ff ff ff    	jne    8020d5 <readline+0x55>
  8021a1:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8021a5:	74 11                	je     8021b8 <readline+0x138>
  8021a7:	bf 0a 00 00 00       	mov    $0xa,%edi
  8021ac:	48 b8 c8 0f 80 00 00 	movabs $0x800fc8,%rax
  8021b3:	00 00 00 
  8021b6:	ff d0                	callq  *%rax
  8021b8:	48 ba 20 a0 80 00 00 	movabs $0x80a020,%rdx
  8021bf:	00 00 00 
  8021c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021c5:	48 98                	cltq   
  8021c7:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
  8021cb:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  8021d2:	00 00 00 
  8021d5:	eb 05                	jmp    8021dc <readline+0x15c>
  8021d7:	e9 f9 fe ff ff       	jmpq   8020d5 <readline+0x55>
  8021dc:	c9                   	leaveq 
  8021dd:	c3                   	retq   

00000000008021de <strlen>:
  8021de:	55                   	push   %rbp
  8021df:	48 89 e5             	mov    %rsp,%rbp
  8021e2:	48 83 ec 18          	sub    $0x18,%rsp
  8021e6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8021ea:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8021f1:	eb 09                	jmp    8021fc <strlen+0x1e>
  8021f3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8021f7:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8021fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802200:	0f b6 00             	movzbl (%rax),%eax
  802203:	84 c0                	test   %al,%al
  802205:	75 ec                	jne    8021f3 <strlen+0x15>
  802207:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80220a:	c9                   	leaveq 
  80220b:	c3                   	retq   

000000000080220c <strnlen>:
  80220c:	55                   	push   %rbp
  80220d:	48 89 e5             	mov    %rsp,%rbp
  802210:	48 83 ec 20          	sub    $0x20,%rsp
  802214:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802218:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80221c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802223:	eb 0e                	jmp    802233 <strnlen+0x27>
  802225:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802229:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80222e:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  802233:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802238:	74 0b                	je     802245 <strnlen+0x39>
  80223a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80223e:	0f b6 00             	movzbl (%rax),%eax
  802241:	84 c0                	test   %al,%al
  802243:	75 e0                	jne    802225 <strnlen+0x19>
  802245:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802248:	c9                   	leaveq 
  802249:	c3                   	retq   

000000000080224a <strcpy>:
  80224a:	55                   	push   %rbp
  80224b:	48 89 e5             	mov    %rsp,%rbp
  80224e:	48 83 ec 20          	sub    $0x20,%rsp
  802252:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802256:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80225a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80225e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802262:	90                   	nop
  802263:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802267:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80226b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80226f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802273:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  802277:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80227b:	0f b6 12             	movzbl (%rdx),%edx
  80227e:	88 10                	mov    %dl,(%rax)
  802280:	0f b6 00             	movzbl (%rax),%eax
  802283:	84 c0                	test   %al,%al
  802285:	75 dc                	jne    802263 <strcpy+0x19>
  802287:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80228b:	c9                   	leaveq 
  80228c:	c3                   	retq   

000000000080228d <strcat>:
  80228d:	55                   	push   %rbp
  80228e:	48 89 e5             	mov    %rsp,%rbp
  802291:	48 83 ec 20          	sub    $0x20,%rsp
  802295:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802299:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80229d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022a1:	48 89 c7             	mov    %rax,%rdi
  8022a4:	48 b8 de 21 80 00 00 	movabs $0x8021de,%rax
  8022ab:	00 00 00 
  8022ae:	ff d0                	callq  *%rax
  8022b0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022b6:	48 63 d0             	movslq %eax,%rdx
  8022b9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022bd:	48 01 c2             	add    %rax,%rdx
  8022c0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8022c4:	48 89 c6             	mov    %rax,%rsi
  8022c7:	48 89 d7             	mov    %rdx,%rdi
  8022ca:	48 b8 4a 22 80 00 00 	movabs $0x80224a,%rax
  8022d1:	00 00 00 
  8022d4:	ff d0                	callq  *%rax
  8022d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022da:	c9                   	leaveq 
  8022db:	c3                   	retq   

00000000008022dc <strncpy>:
  8022dc:	55                   	push   %rbp
  8022dd:	48 89 e5             	mov    %rsp,%rbp
  8022e0:	48 83 ec 28          	sub    $0x28,%rsp
  8022e4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8022e8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8022ec:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8022f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022f4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8022f8:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8022ff:	00 
  802300:	eb 2a                	jmp    80232c <strncpy+0x50>
  802302:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802306:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80230a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80230e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802312:	0f b6 12             	movzbl (%rdx),%edx
  802315:	88 10                	mov    %dl,(%rax)
  802317:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80231b:	0f b6 00             	movzbl (%rax),%eax
  80231e:	84 c0                	test   %al,%al
  802320:	74 05                	je     802327 <strncpy+0x4b>
  802322:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  802327:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80232c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802330:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802334:	72 cc                	jb     802302 <strncpy+0x26>
  802336:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80233a:	c9                   	leaveq 
  80233b:	c3                   	retq   

000000000080233c <strlcpy>:
  80233c:	55                   	push   %rbp
  80233d:	48 89 e5             	mov    %rsp,%rbp
  802340:	48 83 ec 28          	sub    $0x28,%rsp
  802344:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802348:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80234c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802350:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802354:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802358:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80235d:	74 3d                	je     80239c <strlcpy+0x60>
  80235f:	eb 1d                	jmp    80237e <strlcpy+0x42>
  802361:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802365:	48 8d 50 01          	lea    0x1(%rax),%rdx
  802369:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80236d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802371:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  802375:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  802379:	0f b6 12             	movzbl (%rdx),%edx
  80237c:	88 10                	mov    %dl,(%rax)
  80237e:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  802383:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802388:	74 0b                	je     802395 <strlcpy+0x59>
  80238a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80238e:	0f b6 00             	movzbl (%rax),%eax
  802391:	84 c0                	test   %al,%al
  802393:	75 cc                	jne    802361 <strlcpy+0x25>
  802395:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802399:	c6 00 00             	movb   $0x0,(%rax)
  80239c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8023a0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023a4:	48 29 c2             	sub    %rax,%rdx
  8023a7:	48 89 d0             	mov    %rdx,%rax
  8023aa:	c9                   	leaveq 
  8023ab:	c3                   	retq   

00000000008023ac <strcmp>:
  8023ac:	55                   	push   %rbp
  8023ad:	48 89 e5             	mov    %rsp,%rbp
  8023b0:	48 83 ec 10          	sub    $0x10,%rsp
  8023b4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8023b8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8023bc:	eb 0a                	jmp    8023c8 <strcmp+0x1c>
  8023be:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8023c3:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8023c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023cc:	0f b6 00             	movzbl (%rax),%eax
  8023cf:	84 c0                	test   %al,%al
  8023d1:	74 12                	je     8023e5 <strcmp+0x39>
  8023d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023d7:	0f b6 10             	movzbl (%rax),%edx
  8023da:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023de:	0f b6 00             	movzbl (%rax),%eax
  8023e1:	38 c2                	cmp    %al,%dl
  8023e3:	74 d9                	je     8023be <strcmp+0x12>
  8023e5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023e9:	0f b6 00             	movzbl (%rax),%eax
  8023ec:	0f b6 d0             	movzbl %al,%edx
  8023ef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023f3:	0f b6 00             	movzbl (%rax),%eax
  8023f6:	0f b6 c0             	movzbl %al,%eax
  8023f9:	29 c2                	sub    %eax,%edx
  8023fb:	89 d0                	mov    %edx,%eax
  8023fd:	c9                   	leaveq 
  8023fe:	c3                   	retq   

00000000008023ff <strncmp>:
  8023ff:	55                   	push   %rbp
  802400:	48 89 e5             	mov    %rsp,%rbp
  802403:	48 83 ec 18          	sub    $0x18,%rsp
  802407:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80240b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80240f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  802413:	eb 0f                	jmp    802424 <strncmp+0x25>
  802415:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80241a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80241f:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  802424:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802429:	74 1d                	je     802448 <strncmp+0x49>
  80242b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80242f:	0f b6 00             	movzbl (%rax),%eax
  802432:	84 c0                	test   %al,%al
  802434:	74 12                	je     802448 <strncmp+0x49>
  802436:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80243a:	0f b6 10             	movzbl (%rax),%edx
  80243d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802441:	0f b6 00             	movzbl (%rax),%eax
  802444:	38 c2                	cmp    %al,%dl
  802446:	74 cd                	je     802415 <strncmp+0x16>
  802448:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80244d:	75 07                	jne    802456 <strncmp+0x57>
  80244f:	b8 00 00 00 00       	mov    $0x0,%eax
  802454:	eb 18                	jmp    80246e <strncmp+0x6f>
  802456:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80245a:	0f b6 00             	movzbl (%rax),%eax
  80245d:	0f b6 d0             	movzbl %al,%edx
  802460:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802464:	0f b6 00             	movzbl (%rax),%eax
  802467:	0f b6 c0             	movzbl %al,%eax
  80246a:	29 c2                	sub    %eax,%edx
  80246c:	89 d0                	mov    %edx,%eax
  80246e:	c9                   	leaveq 
  80246f:	c3                   	retq   

0000000000802470 <strchr>:
  802470:	55                   	push   %rbp
  802471:	48 89 e5             	mov    %rsp,%rbp
  802474:	48 83 ec 10          	sub    $0x10,%rsp
  802478:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80247c:	89 f0                	mov    %esi,%eax
  80247e:	88 45 f4             	mov    %al,-0xc(%rbp)
  802481:	eb 17                	jmp    80249a <strchr+0x2a>
  802483:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802487:	0f b6 00             	movzbl (%rax),%eax
  80248a:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80248d:	75 06                	jne    802495 <strchr+0x25>
  80248f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802493:	eb 15                	jmp    8024aa <strchr+0x3a>
  802495:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80249a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80249e:	0f b6 00             	movzbl (%rax),%eax
  8024a1:	84 c0                	test   %al,%al
  8024a3:	75 de                	jne    802483 <strchr+0x13>
  8024a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8024aa:	c9                   	leaveq 
  8024ab:	c3                   	retq   

00000000008024ac <strfind>:
  8024ac:	55                   	push   %rbp
  8024ad:	48 89 e5             	mov    %rsp,%rbp
  8024b0:	48 83 ec 10          	sub    $0x10,%rsp
  8024b4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8024b8:	89 f0                	mov    %esi,%eax
  8024ba:	88 45 f4             	mov    %al,-0xc(%rbp)
  8024bd:	eb 11                	jmp    8024d0 <strfind+0x24>
  8024bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024c3:	0f b6 00             	movzbl (%rax),%eax
  8024c6:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8024c9:	74 12                	je     8024dd <strfind+0x31>
  8024cb:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8024d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024d4:	0f b6 00             	movzbl (%rax),%eax
  8024d7:	84 c0                	test   %al,%al
  8024d9:	75 e4                	jne    8024bf <strfind+0x13>
  8024db:	eb 01                	jmp    8024de <strfind+0x32>
  8024dd:	90                   	nop
  8024de:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024e2:	c9                   	leaveq 
  8024e3:	c3                   	retq   

00000000008024e4 <memset>:
  8024e4:	55                   	push   %rbp
  8024e5:	48 89 e5             	mov    %rsp,%rbp
  8024e8:	48 83 ec 18          	sub    $0x18,%rsp
  8024ec:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8024f0:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8024f3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8024f7:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8024fc:	75 06                	jne    802504 <memset+0x20>
  8024fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802502:	eb 69                	jmp    80256d <memset+0x89>
  802504:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802508:	83 e0 03             	and    $0x3,%eax
  80250b:	48 85 c0             	test   %rax,%rax
  80250e:	75 48                	jne    802558 <memset+0x74>
  802510:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802514:	83 e0 03             	and    $0x3,%eax
  802517:	48 85 c0             	test   %rax,%rax
  80251a:	75 3c                	jne    802558 <memset+0x74>
  80251c:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  802523:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802526:	c1 e0 18             	shl    $0x18,%eax
  802529:	89 c2                	mov    %eax,%edx
  80252b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80252e:	c1 e0 10             	shl    $0x10,%eax
  802531:	09 c2                	or     %eax,%edx
  802533:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802536:	c1 e0 08             	shl    $0x8,%eax
  802539:	09 d0                	or     %edx,%eax
  80253b:	09 45 f4             	or     %eax,-0xc(%rbp)
  80253e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802542:	48 c1 e8 02          	shr    $0x2,%rax
  802546:	48 89 c1             	mov    %rax,%rcx
  802549:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80254d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802550:	48 89 d7             	mov    %rdx,%rdi
  802553:	fc                   	cld    
  802554:	f3 ab                	rep stos %eax,%es:(%rdi)
  802556:	eb 11                	jmp    802569 <memset+0x85>
  802558:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80255c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80255f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802563:	48 89 d7             	mov    %rdx,%rdi
  802566:	fc                   	cld    
  802567:	f3 aa                	rep stos %al,%es:(%rdi)
  802569:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80256d:	c9                   	leaveq 
  80256e:	c3                   	retq   

000000000080256f <memmove>:
  80256f:	55                   	push   %rbp
  802570:	48 89 e5             	mov    %rsp,%rbp
  802573:	48 83 ec 28          	sub    $0x28,%rsp
  802577:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80257b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80257f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802583:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802587:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80258b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80258f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802593:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802597:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80259b:	0f 83 88 00 00 00    	jae    802629 <memmove+0xba>
  8025a1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8025a5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8025a9:	48 01 d0             	add    %rdx,%rax
  8025ac:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8025b0:	76 77                	jbe    802629 <memmove+0xba>
  8025b2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8025b6:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8025ba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8025be:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8025c2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8025c6:	83 e0 03             	and    $0x3,%eax
  8025c9:	48 85 c0             	test   %rax,%rax
  8025cc:	75 3b                	jne    802609 <memmove+0x9a>
  8025ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025d2:	83 e0 03             	and    $0x3,%eax
  8025d5:	48 85 c0             	test   %rax,%rax
  8025d8:	75 2f                	jne    802609 <memmove+0x9a>
  8025da:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8025de:	83 e0 03             	and    $0x3,%eax
  8025e1:	48 85 c0             	test   %rax,%rax
  8025e4:	75 23                	jne    802609 <memmove+0x9a>
  8025e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025ea:	48 83 e8 04          	sub    $0x4,%rax
  8025ee:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8025f2:	48 83 ea 04          	sub    $0x4,%rdx
  8025f6:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8025fa:	48 c1 e9 02          	shr    $0x2,%rcx
  8025fe:	48 89 c7             	mov    %rax,%rdi
  802601:	48 89 d6             	mov    %rdx,%rsi
  802604:	fd                   	std    
  802605:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  802607:	eb 1d                	jmp    802626 <memmove+0xb7>
  802609:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80260d:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  802611:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802615:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  802619:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80261d:	48 89 d7             	mov    %rdx,%rdi
  802620:	48 89 c1             	mov    %rax,%rcx
  802623:	fd                   	std    
  802624:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  802626:	fc                   	cld    
  802627:	eb 57                	jmp    802680 <memmove+0x111>
  802629:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80262d:	83 e0 03             	and    $0x3,%eax
  802630:	48 85 c0             	test   %rax,%rax
  802633:	75 36                	jne    80266b <memmove+0xfc>
  802635:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802639:	83 e0 03             	and    $0x3,%eax
  80263c:	48 85 c0             	test   %rax,%rax
  80263f:	75 2a                	jne    80266b <memmove+0xfc>
  802641:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802645:	83 e0 03             	and    $0x3,%eax
  802648:	48 85 c0             	test   %rax,%rax
  80264b:	75 1e                	jne    80266b <memmove+0xfc>
  80264d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802651:	48 c1 e8 02          	shr    $0x2,%rax
  802655:	48 89 c1             	mov    %rax,%rcx
  802658:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80265c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802660:	48 89 c7             	mov    %rax,%rdi
  802663:	48 89 d6             	mov    %rdx,%rsi
  802666:	fc                   	cld    
  802667:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  802669:	eb 15                	jmp    802680 <memmove+0x111>
  80266b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80266f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802673:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  802677:	48 89 c7             	mov    %rax,%rdi
  80267a:	48 89 d6             	mov    %rdx,%rsi
  80267d:	fc                   	cld    
  80267e:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  802680:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802684:	c9                   	leaveq 
  802685:	c3                   	retq   

0000000000802686 <memcpy>:
  802686:	55                   	push   %rbp
  802687:	48 89 e5             	mov    %rsp,%rbp
  80268a:	48 83 ec 18          	sub    $0x18,%rsp
  80268e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802692:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802696:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80269a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80269e:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8026a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8026a6:	48 89 ce             	mov    %rcx,%rsi
  8026a9:	48 89 c7             	mov    %rax,%rdi
  8026ac:	48 b8 6f 25 80 00 00 	movabs $0x80256f,%rax
  8026b3:	00 00 00 
  8026b6:	ff d0                	callq  *%rax
  8026b8:	c9                   	leaveq 
  8026b9:	c3                   	retq   

00000000008026ba <memcmp>:
  8026ba:	55                   	push   %rbp
  8026bb:	48 89 e5             	mov    %rsp,%rbp
  8026be:	48 83 ec 28          	sub    $0x28,%rsp
  8026c2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8026c6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8026ca:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8026ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026d2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8026d6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8026da:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8026de:	eb 36                	jmp    802716 <memcmp+0x5c>
  8026e0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8026e4:	0f b6 10             	movzbl (%rax),%edx
  8026e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026eb:	0f b6 00             	movzbl (%rax),%eax
  8026ee:	38 c2                	cmp    %al,%dl
  8026f0:	74 1a                	je     80270c <memcmp+0x52>
  8026f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8026f6:	0f b6 00             	movzbl (%rax),%eax
  8026f9:	0f b6 d0             	movzbl %al,%edx
  8026fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802700:	0f b6 00             	movzbl (%rax),%eax
  802703:	0f b6 c0             	movzbl %al,%eax
  802706:	29 c2                	sub    %eax,%edx
  802708:	89 d0                	mov    %edx,%eax
  80270a:	eb 20                	jmp    80272c <memcmp+0x72>
  80270c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  802711:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  802716:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80271a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80271e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802722:	48 85 c0             	test   %rax,%rax
  802725:	75 b9                	jne    8026e0 <memcmp+0x26>
  802727:	b8 00 00 00 00       	mov    $0x0,%eax
  80272c:	c9                   	leaveq 
  80272d:	c3                   	retq   

000000000080272e <memfind>:
  80272e:	55                   	push   %rbp
  80272f:	48 89 e5             	mov    %rsp,%rbp
  802732:	48 83 ec 28          	sub    $0x28,%rsp
  802736:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80273a:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80273d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802741:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802745:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802749:	48 01 d0             	add    %rdx,%rax
  80274c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802750:	eb 13                	jmp    802765 <memfind+0x37>
  802752:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802756:	0f b6 00             	movzbl (%rax),%eax
  802759:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80275c:	38 d0                	cmp    %dl,%al
  80275e:	74 11                	je     802771 <memfind+0x43>
  802760:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  802765:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802769:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80276d:	72 e3                	jb     802752 <memfind+0x24>
  80276f:	eb 01                	jmp    802772 <memfind+0x44>
  802771:	90                   	nop
  802772:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802776:	c9                   	leaveq 
  802777:	c3                   	retq   

0000000000802778 <strtol>:
  802778:	55                   	push   %rbp
  802779:	48 89 e5             	mov    %rsp,%rbp
  80277c:	48 83 ec 38          	sub    $0x38,%rsp
  802780:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802784:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802788:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80278b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802792:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  802799:	00 
  80279a:	eb 05                	jmp    8027a1 <strtol+0x29>
  80279c:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8027a1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027a5:	0f b6 00             	movzbl (%rax),%eax
  8027a8:	3c 20                	cmp    $0x20,%al
  8027aa:	74 f0                	je     80279c <strtol+0x24>
  8027ac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027b0:	0f b6 00             	movzbl (%rax),%eax
  8027b3:	3c 09                	cmp    $0x9,%al
  8027b5:	74 e5                	je     80279c <strtol+0x24>
  8027b7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027bb:	0f b6 00             	movzbl (%rax),%eax
  8027be:	3c 2b                	cmp    $0x2b,%al
  8027c0:	75 07                	jne    8027c9 <strtol+0x51>
  8027c2:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8027c7:	eb 17                	jmp    8027e0 <strtol+0x68>
  8027c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027cd:	0f b6 00             	movzbl (%rax),%eax
  8027d0:	3c 2d                	cmp    $0x2d,%al
  8027d2:	75 0c                	jne    8027e0 <strtol+0x68>
  8027d4:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8027d9:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8027e0:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8027e4:	74 06                	je     8027ec <strtol+0x74>
  8027e6:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8027ea:	75 28                	jne    802814 <strtol+0x9c>
  8027ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027f0:	0f b6 00             	movzbl (%rax),%eax
  8027f3:	3c 30                	cmp    $0x30,%al
  8027f5:	75 1d                	jne    802814 <strtol+0x9c>
  8027f7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027fb:	48 83 c0 01          	add    $0x1,%rax
  8027ff:	0f b6 00             	movzbl (%rax),%eax
  802802:	3c 78                	cmp    $0x78,%al
  802804:	75 0e                	jne    802814 <strtol+0x9c>
  802806:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  80280b:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  802812:	eb 2c                	jmp    802840 <strtol+0xc8>
  802814:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  802818:	75 19                	jne    802833 <strtol+0xbb>
  80281a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80281e:	0f b6 00             	movzbl (%rax),%eax
  802821:	3c 30                	cmp    $0x30,%al
  802823:	75 0e                	jne    802833 <strtol+0xbb>
  802825:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80282a:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  802831:	eb 0d                	jmp    802840 <strtol+0xc8>
  802833:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  802837:	75 07                	jne    802840 <strtol+0xc8>
  802839:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  802840:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802844:	0f b6 00             	movzbl (%rax),%eax
  802847:	3c 2f                	cmp    $0x2f,%al
  802849:	7e 1d                	jle    802868 <strtol+0xf0>
  80284b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80284f:	0f b6 00             	movzbl (%rax),%eax
  802852:	3c 39                	cmp    $0x39,%al
  802854:	7f 12                	jg     802868 <strtol+0xf0>
  802856:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80285a:	0f b6 00             	movzbl (%rax),%eax
  80285d:	0f be c0             	movsbl %al,%eax
  802860:	83 e8 30             	sub    $0x30,%eax
  802863:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802866:	eb 4e                	jmp    8028b6 <strtol+0x13e>
  802868:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80286c:	0f b6 00             	movzbl (%rax),%eax
  80286f:	3c 60                	cmp    $0x60,%al
  802871:	7e 1d                	jle    802890 <strtol+0x118>
  802873:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802877:	0f b6 00             	movzbl (%rax),%eax
  80287a:	3c 7a                	cmp    $0x7a,%al
  80287c:	7f 12                	jg     802890 <strtol+0x118>
  80287e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802882:	0f b6 00             	movzbl (%rax),%eax
  802885:	0f be c0             	movsbl %al,%eax
  802888:	83 e8 57             	sub    $0x57,%eax
  80288b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80288e:	eb 26                	jmp    8028b6 <strtol+0x13e>
  802890:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802894:	0f b6 00             	movzbl (%rax),%eax
  802897:	3c 40                	cmp    $0x40,%al
  802899:	7e 47                	jle    8028e2 <strtol+0x16a>
  80289b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80289f:	0f b6 00             	movzbl (%rax),%eax
  8028a2:	3c 5a                	cmp    $0x5a,%al
  8028a4:	7f 3c                	jg     8028e2 <strtol+0x16a>
  8028a6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028aa:	0f b6 00             	movzbl (%rax),%eax
  8028ad:	0f be c0             	movsbl %al,%eax
  8028b0:	83 e8 37             	sub    $0x37,%eax
  8028b3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8028b6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8028b9:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8028bc:	7d 23                	jge    8028e1 <strtol+0x169>
  8028be:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8028c3:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8028c6:	48 98                	cltq   
  8028c8:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8028cd:	48 89 c2             	mov    %rax,%rdx
  8028d0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8028d3:	48 98                	cltq   
  8028d5:	48 01 d0             	add    %rdx,%rax
  8028d8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8028dc:	e9 5f ff ff ff       	jmpq   802840 <strtol+0xc8>
  8028e1:	90                   	nop
  8028e2:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8028e7:	74 0b                	je     8028f4 <strtol+0x17c>
  8028e9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8028ed:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8028f1:	48 89 10             	mov    %rdx,(%rax)
  8028f4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028f8:	74 09                	je     802903 <strtol+0x18b>
  8028fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028fe:	48 f7 d8             	neg    %rax
  802901:	eb 04                	jmp    802907 <strtol+0x18f>
  802903:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802907:	c9                   	leaveq 
  802908:	c3                   	retq   

0000000000802909 <strstr>:
  802909:	55                   	push   %rbp
  80290a:	48 89 e5             	mov    %rsp,%rbp
  80290d:	48 83 ec 30          	sub    $0x30,%rsp
  802911:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802915:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802919:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80291d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  802921:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  802925:	0f b6 00             	movzbl (%rax),%eax
  802928:	88 45 ff             	mov    %al,-0x1(%rbp)
  80292b:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  80292f:	75 06                	jne    802937 <strstr+0x2e>
  802931:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802935:	eb 6b                	jmp    8029a2 <strstr+0x99>
  802937:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80293b:	48 89 c7             	mov    %rax,%rdi
  80293e:	48 b8 de 21 80 00 00 	movabs $0x8021de,%rax
  802945:	00 00 00 
  802948:	ff d0                	callq  *%rax
  80294a:	48 98                	cltq   
  80294c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802950:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802954:	48 8d 50 01          	lea    0x1(%rax),%rdx
  802958:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80295c:	0f b6 00             	movzbl (%rax),%eax
  80295f:	88 45 ef             	mov    %al,-0x11(%rbp)
  802962:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  802966:	75 07                	jne    80296f <strstr+0x66>
  802968:	b8 00 00 00 00       	mov    $0x0,%eax
  80296d:	eb 33                	jmp    8029a2 <strstr+0x99>
  80296f:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  802973:	3a 45 ff             	cmp    -0x1(%rbp),%al
  802976:	75 d8                	jne    802950 <strstr+0x47>
  802978:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80297c:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802980:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802984:	48 89 ce             	mov    %rcx,%rsi
  802987:	48 89 c7             	mov    %rax,%rdi
  80298a:	48 b8 ff 23 80 00 00 	movabs $0x8023ff,%rax
  802991:	00 00 00 
  802994:	ff d0                	callq  *%rax
  802996:	85 c0                	test   %eax,%eax
  802998:	75 b6                	jne    802950 <strstr+0x47>
  80299a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80299e:	48 83 e8 01          	sub    $0x1,%rax
  8029a2:	c9                   	leaveq 
  8029a3:	c3                   	retq   

00000000008029a4 <syscall>:
  8029a4:	55                   	push   %rbp
  8029a5:	48 89 e5             	mov    %rsp,%rbp
  8029a8:	53                   	push   %rbx
  8029a9:	48 83 ec 48          	sub    $0x48,%rsp
  8029ad:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8029b0:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8029b3:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8029b7:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8029bb:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8029bf:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8029c3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8029c6:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8029ca:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8029ce:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8029d2:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8029d6:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8029da:	4c 89 c3             	mov    %r8,%rbx
  8029dd:	cd 30                	int    $0x30
  8029df:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8029e3:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8029e7:	74 3e                	je     802a27 <syscall+0x83>
  8029e9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8029ee:	7e 37                	jle    802a27 <syscall+0x83>
  8029f0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8029f4:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8029f7:	49 89 d0             	mov    %rdx,%r8
  8029fa:	89 c1                	mov    %eax,%ecx
  8029fc:	48 ba fb 70 80 00 00 	movabs $0x8070fb,%rdx
  802a03:	00 00 00 
  802a06:	be 24 00 00 00       	mov    $0x24,%esi
  802a0b:	48 bf 18 71 80 00 00 	movabs $0x807118,%rdi
  802a12:	00 00 00 
  802a15:	b8 00 00 00 00       	mov    $0x0,%eax
  802a1a:	49 b9 22 13 80 00 00 	movabs $0x801322,%r9
  802a21:	00 00 00 
  802a24:	41 ff d1             	callq  *%r9
  802a27:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a2b:	48 83 c4 48          	add    $0x48,%rsp
  802a2f:	5b                   	pop    %rbx
  802a30:	5d                   	pop    %rbp
  802a31:	c3                   	retq   

0000000000802a32 <sys_cputs>:
  802a32:	55                   	push   %rbp
  802a33:	48 89 e5             	mov    %rsp,%rbp
  802a36:	48 83 ec 10          	sub    $0x10,%rsp
  802a3a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802a3e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802a42:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802a46:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802a4a:	48 83 ec 08          	sub    $0x8,%rsp
  802a4e:	6a 00                	pushq  $0x0
  802a50:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802a56:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802a5c:	48 89 d1             	mov    %rdx,%rcx
  802a5f:	48 89 c2             	mov    %rax,%rdx
  802a62:	be 00 00 00 00       	mov    $0x0,%esi
  802a67:	bf 00 00 00 00       	mov    $0x0,%edi
  802a6c:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802a73:	00 00 00 
  802a76:	ff d0                	callq  *%rax
  802a78:	48 83 c4 10          	add    $0x10,%rsp
  802a7c:	90                   	nop
  802a7d:	c9                   	leaveq 
  802a7e:	c3                   	retq   

0000000000802a7f <sys_cgetc>:
  802a7f:	55                   	push   %rbp
  802a80:	48 89 e5             	mov    %rsp,%rbp
  802a83:	48 83 ec 08          	sub    $0x8,%rsp
  802a87:	6a 00                	pushq  $0x0
  802a89:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802a8f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802a95:	b9 00 00 00 00       	mov    $0x0,%ecx
  802a9a:	ba 00 00 00 00       	mov    $0x0,%edx
  802a9f:	be 00 00 00 00       	mov    $0x0,%esi
  802aa4:	bf 01 00 00 00       	mov    $0x1,%edi
  802aa9:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802ab0:	00 00 00 
  802ab3:	ff d0                	callq  *%rax
  802ab5:	48 83 c4 10          	add    $0x10,%rsp
  802ab9:	c9                   	leaveq 
  802aba:	c3                   	retq   

0000000000802abb <sys_env_destroy>:
  802abb:	55                   	push   %rbp
  802abc:	48 89 e5             	mov    %rsp,%rbp
  802abf:	48 83 ec 10          	sub    $0x10,%rsp
  802ac3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802ac6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ac9:	48 98                	cltq   
  802acb:	48 83 ec 08          	sub    $0x8,%rsp
  802acf:	6a 00                	pushq  $0x0
  802ad1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802ad7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802add:	b9 00 00 00 00       	mov    $0x0,%ecx
  802ae2:	48 89 c2             	mov    %rax,%rdx
  802ae5:	be 01 00 00 00       	mov    $0x1,%esi
  802aea:	bf 03 00 00 00       	mov    $0x3,%edi
  802aef:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802af6:	00 00 00 
  802af9:	ff d0                	callq  *%rax
  802afb:	48 83 c4 10          	add    $0x10,%rsp
  802aff:	c9                   	leaveq 
  802b00:	c3                   	retq   

0000000000802b01 <sys_getenvid>:
  802b01:	55                   	push   %rbp
  802b02:	48 89 e5             	mov    %rsp,%rbp
  802b05:	48 83 ec 08          	sub    $0x8,%rsp
  802b09:	6a 00                	pushq  $0x0
  802b0b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802b11:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802b17:	b9 00 00 00 00       	mov    $0x0,%ecx
  802b1c:	ba 00 00 00 00       	mov    $0x0,%edx
  802b21:	be 00 00 00 00       	mov    $0x0,%esi
  802b26:	bf 02 00 00 00       	mov    $0x2,%edi
  802b2b:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802b32:	00 00 00 
  802b35:	ff d0                	callq  *%rax
  802b37:	48 83 c4 10          	add    $0x10,%rsp
  802b3b:	c9                   	leaveq 
  802b3c:	c3                   	retq   

0000000000802b3d <sys_yield>:
  802b3d:	55                   	push   %rbp
  802b3e:	48 89 e5             	mov    %rsp,%rbp
  802b41:	48 83 ec 08          	sub    $0x8,%rsp
  802b45:	6a 00                	pushq  $0x0
  802b47:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802b4d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802b53:	b9 00 00 00 00       	mov    $0x0,%ecx
  802b58:	ba 00 00 00 00       	mov    $0x0,%edx
  802b5d:	be 00 00 00 00       	mov    $0x0,%esi
  802b62:	bf 0b 00 00 00       	mov    $0xb,%edi
  802b67:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802b6e:	00 00 00 
  802b71:	ff d0                	callq  *%rax
  802b73:	48 83 c4 10          	add    $0x10,%rsp
  802b77:	90                   	nop
  802b78:	c9                   	leaveq 
  802b79:	c3                   	retq   

0000000000802b7a <sys_page_alloc>:
  802b7a:	55                   	push   %rbp
  802b7b:	48 89 e5             	mov    %rsp,%rbp
  802b7e:	48 83 ec 10          	sub    $0x10,%rsp
  802b82:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802b85:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802b89:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802b8c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b8f:	48 63 c8             	movslq %eax,%rcx
  802b92:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802b96:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b99:	48 98                	cltq   
  802b9b:	48 83 ec 08          	sub    $0x8,%rsp
  802b9f:	6a 00                	pushq  $0x0
  802ba1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802ba7:	49 89 c8             	mov    %rcx,%r8
  802baa:	48 89 d1             	mov    %rdx,%rcx
  802bad:	48 89 c2             	mov    %rax,%rdx
  802bb0:	be 01 00 00 00       	mov    $0x1,%esi
  802bb5:	bf 04 00 00 00       	mov    $0x4,%edi
  802bba:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802bc1:	00 00 00 
  802bc4:	ff d0                	callq  *%rax
  802bc6:	48 83 c4 10          	add    $0x10,%rsp
  802bca:	c9                   	leaveq 
  802bcb:	c3                   	retq   

0000000000802bcc <sys_page_map>:
  802bcc:	55                   	push   %rbp
  802bcd:	48 89 e5             	mov    %rsp,%rbp
  802bd0:	48 83 ec 20          	sub    $0x20,%rsp
  802bd4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802bd7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802bdb:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802bde:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  802be2:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802be6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802be9:	48 63 c8             	movslq %eax,%rcx
  802bec:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  802bf0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802bf3:	48 63 f0             	movslq %eax,%rsi
  802bf6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802bfa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bfd:	48 98                	cltq   
  802bff:	48 83 ec 08          	sub    $0x8,%rsp
  802c03:	51                   	push   %rcx
  802c04:	49 89 f9             	mov    %rdi,%r9
  802c07:	49 89 f0             	mov    %rsi,%r8
  802c0a:	48 89 d1             	mov    %rdx,%rcx
  802c0d:	48 89 c2             	mov    %rax,%rdx
  802c10:	be 01 00 00 00       	mov    $0x1,%esi
  802c15:	bf 05 00 00 00       	mov    $0x5,%edi
  802c1a:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802c21:	00 00 00 
  802c24:	ff d0                	callq  *%rax
  802c26:	48 83 c4 10          	add    $0x10,%rsp
  802c2a:	c9                   	leaveq 
  802c2b:	c3                   	retq   

0000000000802c2c <sys_page_unmap>:
  802c2c:	55                   	push   %rbp
  802c2d:	48 89 e5             	mov    %rsp,%rbp
  802c30:	48 83 ec 10          	sub    $0x10,%rsp
  802c34:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802c37:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802c3b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802c3f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c42:	48 98                	cltq   
  802c44:	48 83 ec 08          	sub    $0x8,%rsp
  802c48:	6a 00                	pushq  $0x0
  802c4a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802c50:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802c56:	48 89 d1             	mov    %rdx,%rcx
  802c59:	48 89 c2             	mov    %rax,%rdx
  802c5c:	be 01 00 00 00       	mov    $0x1,%esi
  802c61:	bf 06 00 00 00       	mov    $0x6,%edi
  802c66:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802c6d:	00 00 00 
  802c70:	ff d0                	callq  *%rax
  802c72:	48 83 c4 10          	add    $0x10,%rsp
  802c76:	c9                   	leaveq 
  802c77:	c3                   	retq   

0000000000802c78 <sys_env_set_status>:
  802c78:	55                   	push   %rbp
  802c79:	48 89 e5             	mov    %rsp,%rbp
  802c7c:	48 83 ec 10          	sub    $0x10,%rsp
  802c80:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802c83:	89 75 f8             	mov    %esi,-0x8(%rbp)
  802c86:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c89:	48 63 d0             	movslq %eax,%rdx
  802c8c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c8f:	48 98                	cltq   
  802c91:	48 83 ec 08          	sub    $0x8,%rsp
  802c95:	6a 00                	pushq  $0x0
  802c97:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802c9d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802ca3:	48 89 d1             	mov    %rdx,%rcx
  802ca6:	48 89 c2             	mov    %rax,%rdx
  802ca9:	be 01 00 00 00       	mov    $0x1,%esi
  802cae:	bf 08 00 00 00       	mov    $0x8,%edi
  802cb3:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802cba:	00 00 00 
  802cbd:	ff d0                	callq  *%rax
  802cbf:	48 83 c4 10          	add    $0x10,%rsp
  802cc3:	c9                   	leaveq 
  802cc4:	c3                   	retq   

0000000000802cc5 <sys_env_set_trapframe>:
  802cc5:	55                   	push   %rbp
  802cc6:	48 89 e5             	mov    %rsp,%rbp
  802cc9:	48 83 ec 10          	sub    $0x10,%rsp
  802ccd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802cd0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802cd4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802cd8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cdb:	48 98                	cltq   
  802cdd:	48 83 ec 08          	sub    $0x8,%rsp
  802ce1:	6a 00                	pushq  $0x0
  802ce3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802ce9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802cef:	48 89 d1             	mov    %rdx,%rcx
  802cf2:	48 89 c2             	mov    %rax,%rdx
  802cf5:	be 01 00 00 00       	mov    $0x1,%esi
  802cfa:	bf 09 00 00 00       	mov    $0x9,%edi
  802cff:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802d06:	00 00 00 
  802d09:	ff d0                	callq  *%rax
  802d0b:	48 83 c4 10          	add    $0x10,%rsp
  802d0f:	c9                   	leaveq 
  802d10:	c3                   	retq   

0000000000802d11 <sys_env_set_pgfault_upcall>:
  802d11:	55                   	push   %rbp
  802d12:	48 89 e5             	mov    %rsp,%rbp
  802d15:	48 83 ec 10          	sub    $0x10,%rsp
  802d19:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802d1c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802d20:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802d24:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d27:	48 98                	cltq   
  802d29:	48 83 ec 08          	sub    $0x8,%rsp
  802d2d:	6a 00                	pushq  $0x0
  802d2f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802d35:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802d3b:	48 89 d1             	mov    %rdx,%rcx
  802d3e:	48 89 c2             	mov    %rax,%rdx
  802d41:	be 01 00 00 00       	mov    $0x1,%esi
  802d46:	bf 0a 00 00 00       	mov    $0xa,%edi
  802d4b:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802d52:	00 00 00 
  802d55:	ff d0                	callq  *%rax
  802d57:	48 83 c4 10          	add    $0x10,%rsp
  802d5b:	c9                   	leaveq 
  802d5c:	c3                   	retq   

0000000000802d5d <sys_ipc_try_send>:
  802d5d:	55                   	push   %rbp
  802d5e:	48 89 e5             	mov    %rsp,%rbp
  802d61:	48 83 ec 20          	sub    $0x20,%rsp
  802d65:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802d68:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802d6c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  802d70:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  802d73:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d76:	48 63 f0             	movslq %eax,%rsi
  802d79:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802d7d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d80:	48 98                	cltq   
  802d82:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802d86:	48 83 ec 08          	sub    $0x8,%rsp
  802d8a:	6a 00                	pushq  $0x0
  802d8c:	49 89 f1             	mov    %rsi,%r9
  802d8f:	49 89 c8             	mov    %rcx,%r8
  802d92:	48 89 d1             	mov    %rdx,%rcx
  802d95:	48 89 c2             	mov    %rax,%rdx
  802d98:	be 00 00 00 00       	mov    $0x0,%esi
  802d9d:	bf 0c 00 00 00       	mov    $0xc,%edi
  802da2:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802da9:	00 00 00 
  802dac:	ff d0                	callq  *%rax
  802dae:	48 83 c4 10          	add    $0x10,%rsp
  802db2:	c9                   	leaveq 
  802db3:	c3                   	retq   

0000000000802db4 <sys_ipc_recv>:
  802db4:	55                   	push   %rbp
  802db5:	48 89 e5             	mov    %rsp,%rbp
  802db8:	48 83 ec 10          	sub    $0x10,%rsp
  802dbc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802dc0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802dc4:	48 83 ec 08          	sub    $0x8,%rsp
  802dc8:	6a 00                	pushq  $0x0
  802dca:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802dd0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802dd6:	b9 00 00 00 00       	mov    $0x0,%ecx
  802ddb:	48 89 c2             	mov    %rax,%rdx
  802dde:	be 01 00 00 00       	mov    $0x1,%esi
  802de3:	bf 0d 00 00 00       	mov    $0xd,%edi
  802de8:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802def:	00 00 00 
  802df2:	ff d0                	callq  *%rax
  802df4:	48 83 c4 10          	add    $0x10,%rsp
  802df8:	c9                   	leaveq 
  802df9:	c3                   	retq   

0000000000802dfa <sys_time_msec>:
  802dfa:	55                   	push   %rbp
  802dfb:	48 89 e5             	mov    %rsp,%rbp
  802dfe:	48 83 ec 08          	sub    $0x8,%rsp
  802e02:	6a 00                	pushq  $0x0
  802e04:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802e0a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802e10:	b9 00 00 00 00       	mov    $0x0,%ecx
  802e15:	ba 00 00 00 00       	mov    $0x0,%edx
  802e1a:	be 00 00 00 00       	mov    $0x0,%esi
  802e1f:	bf 0e 00 00 00       	mov    $0xe,%edi
  802e24:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802e2b:	00 00 00 
  802e2e:	ff d0                	callq  *%rax
  802e30:	48 83 c4 10          	add    $0x10,%rsp
  802e34:	c9                   	leaveq 
  802e35:	c3                   	retq   

0000000000802e36 <sys_net_transmit>:
  802e36:	55                   	push   %rbp
  802e37:	48 89 e5             	mov    %rsp,%rbp
  802e3a:	48 83 ec 10          	sub    $0x10,%rsp
  802e3e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802e42:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802e45:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802e48:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802e4c:	48 83 ec 08          	sub    $0x8,%rsp
  802e50:	6a 00                	pushq  $0x0
  802e52:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802e58:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802e5e:	48 89 d1             	mov    %rdx,%rcx
  802e61:	48 89 c2             	mov    %rax,%rdx
  802e64:	be 00 00 00 00       	mov    $0x0,%esi
  802e69:	bf 0f 00 00 00       	mov    $0xf,%edi
  802e6e:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802e75:	00 00 00 
  802e78:	ff d0                	callq  *%rax
  802e7a:	48 83 c4 10          	add    $0x10,%rsp
  802e7e:	c9                   	leaveq 
  802e7f:	c3                   	retq   

0000000000802e80 <sys_net_receive>:
  802e80:	55                   	push   %rbp
  802e81:	48 89 e5             	mov    %rsp,%rbp
  802e84:	48 83 ec 10          	sub    $0x10,%rsp
  802e88:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802e8c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802e8f:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802e92:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802e96:	48 83 ec 08          	sub    $0x8,%rsp
  802e9a:	6a 00                	pushq  $0x0
  802e9c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802ea2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802ea8:	48 89 d1             	mov    %rdx,%rcx
  802eab:	48 89 c2             	mov    %rax,%rdx
  802eae:	be 00 00 00 00       	mov    $0x0,%esi
  802eb3:	bf 10 00 00 00       	mov    $0x10,%edi
  802eb8:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802ebf:	00 00 00 
  802ec2:	ff d0                	callq  *%rax
  802ec4:	48 83 c4 10          	add    $0x10,%rsp
  802ec8:	c9                   	leaveq 
  802ec9:	c3                   	retq   

0000000000802eca <sys_ept_map>:
  802eca:	55                   	push   %rbp
  802ecb:	48 89 e5             	mov    %rsp,%rbp
  802ece:	48 83 ec 20          	sub    $0x20,%rsp
  802ed2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802ed5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802ed9:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802edc:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  802ee0:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802ee4:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802ee7:	48 63 c8             	movslq %eax,%rcx
  802eea:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  802eee:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ef1:	48 63 f0             	movslq %eax,%rsi
  802ef4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802ef8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802efb:	48 98                	cltq   
  802efd:	48 83 ec 08          	sub    $0x8,%rsp
  802f01:	51                   	push   %rcx
  802f02:	49 89 f9             	mov    %rdi,%r9
  802f05:	49 89 f0             	mov    %rsi,%r8
  802f08:	48 89 d1             	mov    %rdx,%rcx
  802f0b:	48 89 c2             	mov    %rax,%rdx
  802f0e:	be 00 00 00 00       	mov    $0x0,%esi
  802f13:	bf 11 00 00 00       	mov    $0x11,%edi
  802f18:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802f1f:	00 00 00 
  802f22:	ff d0                	callq  *%rax
  802f24:	48 83 c4 10          	add    $0x10,%rsp
  802f28:	c9                   	leaveq 
  802f29:	c3                   	retq   

0000000000802f2a <sys_env_mkguest>:
  802f2a:	55                   	push   %rbp
  802f2b:	48 89 e5             	mov    %rsp,%rbp
  802f2e:	48 83 ec 10          	sub    $0x10,%rsp
  802f32:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802f36:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802f3a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802f3e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f42:	48 83 ec 08          	sub    $0x8,%rsp
  802f46:	6a 00                	pushq  $0x0
  802f48:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802f4e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802f54:	48 89 d1             	mov    %rdx,%rcx
  802f57:	48 89 c2             	mov    %rax,%rdx
  802f5a:	be 00 00 00 00       	mov    $0x0,%esi
  802f5f:	bf 12 00 00 00       	mov    $0x12,%edi
  802f64:	48 b8 a4 29 80 00 00 	movabs $0x8029a4,%rax
  802f6b:	00 00 00 
  802f6e:	ff d0                	callq  *%rax
  802f70:	48 83 c4 10          	add    $0x10,%rsp
  802f74:	c9                   	leaveq 
  802f75:	c3                   	retq   

0000000000802f76 <pgfault>:
  802f76:	55                   	push   %rbp
  802f77:	48 89 e5             	mov    %rsp,%rbp
  802f7a:	48 83 ec 30          	sub    $0x30,%rsp
  802f7e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802f82:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802f86:	48 8b 00             	mov    (%rax),%rax
  802f89:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802f8d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802f91:	48 8b 40 08          	mov    0x8(%rax),%rax
  802f95:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f98:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f9b:	83 e0 02             	and    $0x2,%eax
  802f9e:	85 c0                	test   %eax,%eax
  802fa0:	75 40                	jne    802fe2 <pgfault+0x6c>
  802fa2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802fa6:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  802fad:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802fb1:	49 89 d0             	mov    %rdx,%r8
  802fb4:	48 89 c1             	mov    %rax,%rcx
  802fb7:	48 ba 30 71 80 00 00 	movabs $0x807130,%rdx
  802fbe:	00 00 00 
  802fc1:	be 1f 00 00 00       	mov    $0x1f,%esi
  802fc6:	48 bf 49 71 80 00 00 	movabs $0x807149,%rdi
  802fcd:	00 00 00 
  802fd0:	b8 00 00 00 00       	mov    $0x0,%eax
  802fd5:	49 b9 22 13 80 00 00 	movabs $0x801322,%r9
  802fdc:	00 00 00 
  802fdf:	41 ff d1             	callq  *%r9
  802fe2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802fe6:	48 c1 e8 0c          	shr    $0xc,%rax
  802fea:	48 89 c2             	mov    %rax,%rdx
  802fed:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802ff4:	01 00 00 
  802ff7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ffb:	25 07 08 00 00       	and    $0x807,%eax
  803000:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  803006:	74 4e                	je     803056 <pgfault+0xe0>
  803008:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80300c:	48 c1 e8 0c          	shr    $0xc,%rax
  803010:	48 89 c2             	mov    %rax,%rdx
  803013:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80301a:	01 00 00 
  80301d:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  803021:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803025:	49 89 d0             	mov    %rdx,%r8
  803028:	48 89 c1             	mov    %rax,%rcx
  80302b:	48 ba 58 71 80 00 00 	movabs $0x807158,%rdx
  803032:	00 00 00 
  803035:	be 22 00 00 00       	mov    $0x22,%esi
  80303a:	48 bf 49 71 80 00 00 	movabs $0x807149,%rdi
  803041:	00 00 00 
  803044:	b8 00 00 00 00       	mov    $0x0,%eax
  803049:	49 b9 22 13 80 00 00 	movabs $0x801322,%r9
  803050:	00 00 00 
  803053:	41 ff d1             	callq  *%r9
  803056:	ba 07 00 00 00       	mov    $0x7,%edx
  80305b:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  803060:	bf 00 00 00 00       	mov    $0x0,%edi
  803065:	48 b8 7a 2b 80 00 00 	movabs $0x802b7a,%rax
  80306c:	00 00 00 
  80306f:	ff d0                	callq  *%rax
  803071:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803074:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803078:	79 30                	jns    8030aa <pgfault+0x134>
  80307a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80307d:	89 c1                	mov    %eax,%ecx
  80307f:	48 ba 83 71 80 00 00 	movabs $0x807183,%rdx
  803086:	00 00 00 
  803089:	be 30 00 00 00       	mov    $0x30,%esi
  80308e:	48 bf 49 71 80 00 00 	movabs $0x807149,%rdi
  803095:	00 00 00 
  803098:	b8 00 00 00 00       	mov    $0x0,%eax
  80309d:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  8030a4:	00 00 00 
  8030a7:	41 ff d0             	callq  *%r8
  8030aa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8030ae:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8030b2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030b6:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8030bc:	ba 00 10 00 00       	mov    $0x1000,%edx
  8030c1:	48 89 c6             	mov    %rax,%rsi
  8030c4:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  8030c9:	48 b8 6f 25 80 00 00 	movabs $0x80256f,%rax
  8030d0:	00 00 00 
  8030d3:	ff d0                	callq  *%rax
  8030d5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8030d9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8030dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030e1:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8030e7:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  8030ed:	48 89 c1             	mov    %rax,%rcx
  8030f0:	ba 00 00 00 00       	mov    $0x0,%edx
  8030f5:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8030fa:	bf 00 00 00 00       	mov    $0x0,%edi
  8030ff:	48 b8 cc 2b 80 00 00 	movabs $0x802bcc,%rax
  803106:	00 00 00 
  803109:	ff d0                	callq  *%rax
  80310b:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80310e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803112:	79 30                	jns    803144 <pgfault+0x1ce>
  803114:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803117:	89 c1                	mov    %eax,%ecx
  803119:	48 ba 96 71 80 00 00 	movabs $0x807196,%rdx
  803120:	00 00 00 
  803123:	be 35 00 00 00       	mov    $0x35,%esi
  803128:	48 bf 49 71 80 00 00 	movabs $0x807149,%rdi
  80312f:	00 00 00 
  803132:	b8 00 00 00 00       	mov    $0x0,%eax
  803137:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  80313e:	00 00 00 
  803141:	41 ff d0             	callq  *%r8
  803144:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  803149:	bf 00 00 00 00       	mov    $0x0,%edi
  80314e:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  803155:	00 00 00 
  803158:	ff d0                	callq  *%rax
  80315a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80315d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803161:	79 30                	jns    803193 <pgfault+0x21d>
  803163:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803166:	89 c1                	mov    %eax,%ecx
  803168:	48 ba a7 71 80 00 00 	movabs $0x8071a7,%rdx
  80316f:	00 00 00 
  803172:	be 39 00 00 00       	mov    $0x39,%esi
  803177:	48 bf 49 71 80 00 00 	movabs $0x807149,%rdi
  80317e:	00 00 00 
  803181:	b8 00 00 00 00       	mov    $0x0,%eax
  803186:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  80318d:	00 00 00 
  803190:	41 ff d0             	callq  *%r8
  803193:	90                   	nop
  803194:	c9                   	leaveq 
  803195:	c3                   	retq   

0000000000803196 <duppage>:
  803196:	55                   	push   %rbp
  803197:	48 89 e5             	mov    %rsp,%rbp
  80319a:	48 83 ec 30          	sub    $0x30,%rsp
  80319e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8031a1:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8031a4:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8031a7:	c1 e0 0c             	shl    $0xc,%eax
  8031aa:	89 c0                	mov    %eax,%eax
  8031ac:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8031b0:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8031b7:	01 00 00 
  8031ba:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8031bd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8031c1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8031c5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031c9:	25 02 08 00 00       	and    $0x802,%eax
  8031ce:	48 85 c0             	test   %rax,%rax
  8031d1:	74 0e                	je     8031e1 <duppage+0x4b>
  8031d3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031d7:	25 00 04 00 00       	and    $0x400,%eax
  8031dc:	48 85 c0             	test   %rax,%rax
  8031df:	74 70                	je     803251 <duppage+0xbb>
  8031e1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031e5:	25 07 0e 00 00       	and    $0xe07,%eax
  8031ea:	89 c6                	mov    %eax,%esi
  8031ec:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8031f0:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8031f3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8031f7:	41 89 f0             	mov    %esi,%r8d
  8031fa:	48 89 c6             	mov    %rax,%rsi
  8031fd:	bf 00 00 00 00       	mov    $0x0,%edi
  803202:	48 b8 cc 2b 80 00 00 	movabs $0x802bcc,%rax
  803209:	00 00 00 
  80320c:	ff d0                	callq  *%rax
  80320e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803211:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803215:	79 30                	jns    803247 <duppage+0xb1>
  803217:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80321a:	89 c1                	mov    %eax,%ecx
  80321c:	48 ba 96 71 80 00 00 	movabs $0x807196,%rdx
  803223:	00 00 00 
  803226:	be 63 00 00 00       	mov    $0x63,%esi
  80322b:	48 bf 49 71 80 00 00 	movabs $0x807149,%rdi
  803232:	00 00 00 
  803235:	b8 00 00 00 00       	mov    $0x0,%eax
  80323a:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  803241:	00 00 00 
  803244:	41 ff d0             	callq  *%r8
  803247:	b8 00 00 00 00       	mov    $0x0,%eax
  80324c:	e9 c4 00 00 00       	jmpq   803315 <duppage+0x17f>
  803251:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  803255:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803258:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80325c:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  803262:	48 89 c6             	mov    %rax,%rsi
  803265:	bf 00 00 00 00       	mov    $0x0,%edi
  80326a:	48 b8 cc 2b 80 00 00 	movabs $0x802bcc,%rax
  803271:	00 00 00 
  803274:	ff d0                	callq  *%rax
  803276:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803279:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80327d:	79 30                	jns    8032af <duppage+0x119>
  80327f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803282:	89 c1                	mov    %eax,%ecx
  803284:	48 ba 96 71 80 00 00 	movabs $0x807196,%rdx
  80328b:	00 00 00 
  80328e:	be 7e 00 00 00       	mov    $0x7e,%esi
  803293:	48 bf 49 71 80 00 00 	movabs $0x807149,%rdi
  80329a:	00 00 00 
  80329d:	b8 00 00 00 00       	mov    $0x0,%eax
  8032a2:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  8032a9:	00 00 00 
  8032ac:	41 ff d0             	callq  *%r8
  8032af:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8032b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8032b7:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8032bd:	48 89 d1             	mov    %rdx,%rcx
  8032c0:	ba 00 00 00 00       	mov    $0x0,%edx
  8032c5:	48 89 c6             	mov    %rax,%rsi
  8032c8:	bf 00 00 00 00       	mov    $0x0,%edi
  8032cd:	48 b8 cc 2b 80 00 00 	movabs $0x802bcc,%rax
  8032d4:	00 00 00 
  8032d7:	ff d0                	callq  *%rax
  8032d9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8032dc:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8032e0:	79 30                	jns    803312 <duppage+0x17c>
  8032e2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032e5:	89 c1                	mov    %eax,%ecx
  8032e7:	48 ba 96 71 80 00 00 	movabs $0x807196,%rdx
  8032ee:	00 00 00 
  8032f1:	be 80 00 00 00       	mov    $0x80,%esi
  8032f6:	48 bf 49 71 80 00 00 	movabs $0x807149,%rdi
  8032fd:	00 00 00 
  803300:	b8 00 00 00 00       	mov    $0x0,%eax
  803305:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  80330c:	00 00 00 
  80330f:	41 ff d0             	callq  *%r8
  803312:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803315:	c9                   	leaveq 
  803316:	c3                   	retq   

0000000000803317 <fork>:
  803317:	55                   	push   %rbp
  803318:	48 89 e5             	mov    %rsp,%rbp
  80331b:	48 83 ec 20          	sub    $0x20,%rsp
  80331f:	48 bf 76 2f 80 00 00 	movabs $0x802f76,%rdi
  803326:	00 00 00 
  803329:	48 b8 71 65 80 00 00 	movabs $0x806571,%rax
  803330:	00 00 00 
  803333:	ff d0                	callq  *%rax
  803335:	b8 07 00 00 00       	mov    $0x7,%eax
  80333a:	cd 30                	int    $0x30
  80333c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80333f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803342:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803345:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803349:	79 08                	jns    803353 <fork+0x3c>
  80334b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80334e:	e9 0b 02 00 00       	jmpq   80355e <fork+0x247>
  803353:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803357:	75 3e                	jne    803397 <fork+0x80>
  803359:	48 b8 01 2b 80 00 00 	movabs $0x802b01,%rax
  803360:	00 00 00 
  803363:	ff d0                	callq  *%rax
  803365:	25 ff 03 00 00       	and    $0x3ff,%eax
  80336a:	48 98                	cltq   
  80336c:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  803373:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80337a:	00 00 00 
  80337d:	48 01 c2             	add    %rax,%rdx
  803380:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  803387:	00 00 00 
  80338a:	48 89 10             	mov    %rdx,(%rax)
  80338d:	b8 00 00 00 00       	mov    $0x0,%eax
  803392:	e9 c7 01 00 00       	jmpq   80355e <fork+0x247>
  803397:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80339e:	e9 a6 00 00 00       	jmpq   803449 <fork+0x132>
  8033a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033a6:	c1 f8 12             	sar    $0x12,%eax
  8033a9:	89 c2                	mov    %eax,%edx
  8033ab:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  8033b2:	01 00 00 
  8033b5:	48 63 d2             	movslq %edx,%rdx
  8033b8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8033bc:	83 e0 01             	and    $0x1,%eax
  8033bf:	48 85 c0             	test   %rax,%rax
  8033c2:	74 21                	je     8033e5 <fork+0xce>
  8033c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033c7:	c1 f8 09             	sar    $0x9,%eax
  8033ca:	89 c2                	mov    %eax,%edx
  8033cc:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8033d3:	01 00 00 
  8033d6:	48 63 d2             	movslq %edx,%rdx
  8033d9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8033dd:	83 e0 01             	and    $0x1,%eax
  8033e0:	48 85 c0             	test   %rax,%rax
  8033e3:	75 09                	jne    8033ee <fork+0xd7>
  8033e5:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  8033ec:	eb 5b                	jmp    803449 <fork+0x132>
  8033ee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033f1:	05 00 02 00 00       	add    $0x200,%eax
  8033f6:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8033f9:	eb 46                	jmp    803441 <fork+0x12a>
  8033fb:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803402:	01 00 00 
  803405:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803408:	48 63 d2             	movslq %edx,%rdx
  80340b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80340f:	83 e0 05             	and    $0x5,%eax
  803412:	48 83 f8 05          	cmp    $0x5,%rax
  803416:	75 21                	jne    803439 <fork+0x122>
  803418:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  80341f:	74 1b                	je     80343c <fork+0x125>
  803421:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803424:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803427:	89 d6                	mov    %edx,%esi
  803429:	89 c7                	mov    %eax,%edi
  80342b:	48 b8 96 31 80 00 00 	movabs $0x803196,%rax
  803432:	00 00 00 
  803435:	ff d0                	callq  *%rax
  803437:	eb 04                	jmp    80343d <fork+0x126>
  803439:	90                   	nop
  80343a:	eb 01                	jmp    80343d <fork+0x126>
  80343c:	90                   	nop
  80343d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803441:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803444:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  803447:	7c b2                	jl     8033fb <fork+0xe4>
  803449:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80344c:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  803451:	0f 86 4c ff ff ff    	jbe    8033a3 <fork+0x8c>
  803457:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80345a:	ba 07 00 00 00       	mov    $0x7,%edx
  80345f:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  803464:	89 c7                	mov    %eax,%edi
  803466:	48 b8 7a 2b 80 00 00 	movabs $0x802b7a,%rax
  80346d:	00 00 00 
  803470:	ff d0                	callq  *%rax
  803472:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803475:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803479:	79 30                	jns    8034ab <fork+0x194>
  80347b:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80347e:	89 c1                	mov    %eax,%ecx
  803480:	48 ba c0 71 80 00 00 	movabs $0x8071c0,%rdx
  803487:	00 00 00 
  80348a:	be bc 00 00 00       	mov    $0xbc,%esi
  80348f:	48 bf 49 71 80 00 00 	movabs $0x807149,%rdi
  803496:	00 00 00 
  803499:	b8 00 00 00 00       	mov    $0x0,%eax
  80349e:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  8034a5:	00 00 00 
  8034a8:	41 ff d0             	callq  *%r8
  8034ab:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  8034b2:	00 00 00 
  8034b5:	48 8b 00             	mov    (%rax),%rax
  8034b8:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  8034bf:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034c2:	48 89 d6             	mov    %rdx,%rsi
  8034c5:	89 c7                	mov    %eax,%edi
  8034c7:	48 b8 11 2d 80 00 00 	movabs $0x802d11,%rax
  8034ce:	00 00 00 
  8034d1:	ff d0                	callq  *%rax
  8034d3:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8034d6:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8034da:	79 30                	jns    80350c <fork+0x1f5>
  8034dc:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8034df:	89 c1                	mov    %eax,%ecx
  8034e1:	48 ba e0 71 80 00 00 	movabs $0x8071e0,%rdx
  8034e8:	00 00 00 
  8034eb:	be c0 00 00 00       	mov    $0xc0,%esi
  8034f0:	48 bf 49 71 80 00 00 	movabs $0x807149,%rdi
  8034f7:	00 00 00 
  8034fa:	b8 00 00 00 00       	mov    $0x0,%eax
  8034ff:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  803506:	00 00 00 
  803509:	41 ff d0             	callq  *%r8
  80350c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80350f:	be 02 00 00 00       	mov    $0x2,%esi
  803514:	89 c7                	mov    %eax,%edi
  803516:	48 b8 78 2c 80 00 00 	movabs $0x802c78,%rax
  80351d:	00 00 00 
  803520:	ff d0                	callq  *%rax
  803522:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803525:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803529:	79 30                	jns    80355b <fork+0x244>
  80352b:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80352e:	89 c1                	mov    %eax,%ecx
  803530:	48 ba ff 71 80 00 00 	movabs $0x8071ff,%rdx
  803537:	00 00 00 
  80353a:	be c5 00 00 00       	mov    $0xc5,%esi
  80353f:	48 bf 49 71 80 00 00 	movabs $0x807149,%rdi
  803546:	00 00 00 
  803549:	b8 00 00 00 00       	mov    $0x0,%eax
  80354e:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  803555:	00 00 00 
  803558:	41 ff d0             	callq  *%r8
  80355b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80355e:	c9                   	leaveq 
  80355f:	c3                   	retq   

0000000000803560 <sfork>:
  803560:	55                   	push   %rbp
  803561:	48 89 e5             	mov    %rsp,%rbp
  803564:	48 ba 16 72 80 00 00 	movabs $0x807216,%rdx
  80356b:	00 00 00 
  80356e:	be d2 00 00 00       	mov    $0xd2,%esi
  803573:	48 bf 49 71 80 00 00 	movabs $0x807149,%rdi
  80357a:	00 00 00 
  80357d:	b8 00 00 00 00       	mov    $0x0,%eax
  803582:	48 b9 22 13 80 00 00 	movabs $0x801322,%rcx
  803589:	00 00 00 
  80358c:	ff d1                	callq  *%rcx

000000000080358e <argstart>:
  80358e:	55                   	push   %rbp
  80358f:	48 89 e5             	mov    %rsp,%rbp
  803592:	48 83 ec 18          	sub    $0x18,%rsp
  803596:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80359a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80359e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8035a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035a6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8035aa:	48 89 10             	mov    %rdx,(%rax)
  8035ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035b1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8035b5:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8035b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8035bd:	8b 00                	mov    (%rax),%eax
  8035bf:	83 f8 01             	cmp    $0x1,%eax
  8035c2:	7e 13                	jle    8035d7 <argstart+0x49>
  8035c4:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  8035c9:	74 0c                	je     8035d7 <argstart+0x49>
  8035cb:	48 b8 2c 72 80 00 00 	movabs $0x80722c,%rax
  8035d2:	00 00 00 
  8035d5:	eb 05                	jmp    8035dc <argstart+0x4e>
  8035d7:	b8 00 00 00 00       	mov    $0x0,%eax
  8035dc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8035e0:	48 89 42 10          	mov    %rax,0x10(%rdx)
  8035e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035e8:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  8035ef:	00 
  8035f0:	90                   	nop
  8035f1:	c9                   	leaveq 
  8035f2:	c3                   	retq   

00000000008035f3 <argnext>:
  8035f3:	55                   	push   %rbp
  8035f4:	48 89 e5             	mov    %rsp,%rbp
  8035f7:	48 83 ec 20          	sub    $0x20,%rsp
  8035fb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8035ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803603:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  80360a:	00 
  80360b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80360f:	48 8b 40 10          	mov    0x10(%rax),%rax
  803613:	48 85 c0             	test   %rax,%rax
  803616:	75 0a                	jne    803622 <argnext+0x2f>
  803618:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  80361d:	e9 24 01 00 00       	jmpq   803746 <argnext+0x153>
  803622:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803626:	48 8b 40 10          	mov    0x10(%rax),%rax
  80362a:	0f b6 00             	movzbl (%rax),%eax
  80362d:	84 c0                	test   %al,%al
  80362f:	0f 85 d5 00 00 00    	jne    80370a <argnext+0x117>
  803635:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803639:	48 8b 00             	mov    (%rax),%rax
  80363c:	8b 00                	mov    (%rax),%eax
  80363e:	83 f8 01             	cmp    $0x1,%eax
  803641:	0f 84 ee 00 00 00    	je     803735 <argnext+0x142>
  803647:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80364b:	48 8b 40 08          	mov    0x8(%rax),%rax
  80364f:	48 83 c0 08          	add    $0x8,%rax
  803653:	48 8b 00             	mov    (%rax),%rax
  803656:	0f b6 00             	movzbl (%rax),%eax
  803659:	3c 2d                	cmp    $0x2d,%al
  80365b:	0f 85 d4 00 00 00    	jne    803735 <argnext+0x142>
  803661:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803665:	48 8b 40 08          	mov    0x8(%rax),%rax
  803669:	48 83 c0 08          	add    $0x8,%rax
  80366d:	48 8b 00             	mov    (%rax),%rax
  803670:	48 83 c0 01          	add    $0x1,%rax
  803674:	0f b6 00             	movzbl (%rax),%eax
  803677:	84 c0                	test   %al,%al
  803679:	0f 84 b6 00 00 00    	je     803735 <argnext+0x142>
  80367f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803683:	48 8b 40 08          	mov    0x8(%rax),%rax
  803687:	48 83 c0 08          	add    $0x8,%rax
  80368b:	48 8b 00             	mov    (%rax),%rax
  80368e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803692:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803696:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80369a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80369e:	48 8b 00             	mov    (%rax),%rax
  8036a1:	8b 00                	mov    (%rax),%eax
  8036a3:	83 e8 01             	sub    $0x1,%eax
  8036a6:	48 98                	cltq   
  8036a8:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8036af:	00 
  8036b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036b4:	48 8b 40 08          	mov    0x8(%rax),%rax
  8036b8:	48 8d 48 10          	lea    0x10(%rax),%rcx
  8036bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036c0:	48 8b 40 08          	mov    0x8(%rax),%rax
  8036c4:	48 83 c0 08          	add    $0x8,%rax
  8036c8:	48 89 ce             	mov    %rcx,%rsi
  8036cb:	48 89 c7             	mov    %rax,%rdi
  8036ce:	48 b8 6f 25 80 00 00 	movabs $0x80256f,%rax
  8036d5:	00 00 00 
  8036d8:	ff d0                	callq  *%rax
  8036da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036de:	48 8b 00             	mov    (%rax),%rax
  8036e1:	8b 10                	mov    (%rax),%edx
  8036e3:	83 ea 01             	sub    $0x1,%edx
  8036e6:	89 10                	mov    %edx,(%rax)
  8036e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036ec:	48 8b 40 10          	mov    0x10(%rax),%rax
  8036f0:	0f b6 00             	movzbl (%rax),%eax
  8036f3:	3c 2d                	cmp    $0x2d,%al
  8036f5:	75 13                	jne    80370a <argnext+0x117>
  8036f7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036fb:	48 8b 40 10          	mov    0x10(%rax),%rax
  8036ff:	48 83 c0 01          	add    $0x1,%rax
  803703:	0f b6 00             	movzbl (%rax),%eax
  803706:	84 c0                	test   %al,%al
  803708:	74 2a                	je     803734 <argnext+0x141>
  80370a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80370e:	48 8b 40 10          	mov    0x10(%rax),%rax
  803712:	0f b6 00             	movzbl (%rax),%eax
  803715:	0f b6 c0             	movzbl %al,%eax
  803718:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80371b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80371f:	48 8b 40 10          	mov    0x10(%rax),%rax
  803723:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803727:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80372b:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80372f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803732:	eb 12                	jmp    803746 <argnext+0x153>
  803734:	90                   	nop
  803735:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803739:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  803740:	00 
  803741:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  803746:	c9                   	leaveq 
  803747:	c3                   	retq   

0000000000803748 <argvalue>:
  803748:	55                   	push   %rbp
  803749:	48 89 e5             	mov    %rsp,%rbp
  80374c:	48 83 ec 10          	sub    $0x10,%rsp
  803750:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803754:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803758:	48 8b 40 18          	mov    0x18(%rax),%rax
  80375c:	48 85 c0             	test   %rax,%rax
  80375f:	74 0a                	je     80376b <argvalue+0x23>
  803761:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803765:	48 8b 40 18          	mov    0x18(%rax),%rax
  803769:	eb 13                	jmp    80377e <argvalue+0x36>
  80376b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80376f:	48 89 c7             	mov    %rax,%rdi
  803772:	48 b8 80 37 80 00 00 	movabs $0x803780,%rax
  803779:	00 00 00 
  80377c:	ff d0                	callq  *%rax
  80377e:	c9                   	leaveq 
  80377f:	c3                   	retq   

0000000000803780 <argnextvalue>:
  803780:	55                   	push   %rbp
  803781:	48 89 e5             	mov    %rsp,%rbp
  803784:	48 83 ec 10          	sub    $0x10,%rsp
  803788:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80378c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803790:	48 8b 40 10          	mov    0x10(%rax),%rax
  803794:	48 85 c0             	test   %rax,%rax
  803797:	75 0a                	jne    8037a3 <argnextvalue+0x23>
  803799:	b8 00 00 00 00       	mov    $0x0,%eax
  80379e:	e9 c8 00 00 00       	jmpq   80386b <argnextvalue+0xeb>
  8037a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037a7:	48 8b 40 10          	mov    0x10(%rax),%rax
  8037ab:	0f b6 00             	movzbl (%rax),%eax
  8037ae:	84 c0                	test   %al,%al
  8037b0:	74 27                	je     8037d9 <argnextvalue+0x59>
  8037b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037b6:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8037ba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037be:	48 89 50 18          	mov    %rdx,0x18(%rax)
  8037c2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037c6:	48 be 2c 72 80 00 00 	movabs $0x80722c,%rsi
  8037cd:	00 00 00 
  8037d0:	48 89 70 10          	mov    %rsi,0x10(%rax)
  8037d4:	e9 8a 00 00 00       	jmpq   803863 <argnextvalue+0xe3>
  8037d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037dd:	48 8b 00             	mov    (%rax),%rax
  8037e0:	8b 00                	mov    (%rax),%eax
  8037e2:	83 f8 01             	cmp    $0x1,%eax
  8037e5:	7e 64                	jle    80384b <argnextvalue+0xcb>
  8037e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037eb:	48 8b 40 08          	mov    0x8(%rax),%rax
  8037ef:	48 8b 50 08          	mov    0x8(%rax),%rdx
  8037f3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037f7:	48 89 50 18          	mov    %rdx,0x18(%rax)
  8037fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037ff:	48 8b 00             	mov    (%rax),%rax
  803802:	8b 00                	mov    (%rax),%eax
  803804:	83 e8 01             	sub    $0x1,%eax
  803807:	48 98                	cltq   
  803809:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803810:	00 
  803811:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803815:	48 8b 40 08          	mov    0x8(%rax),%rax
  803819:	48 8d 48 10          	lea    0x10(%rax),%rcx
  80381d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803821:	48 8b 40 08          	mov    0x8(%rax),%rax
  803825:	48 83 c0 08          	add    $0x8,%rax
  803829:	48 89 ce             	mov    %rcx,%rsi
  80382c:	48 89 c7             	mov    %rax,%rdi
  80382f:	48 b8 6f 25 80 00 00 	movabs $0x80256f,%rax
  803836:	00 00 00 
  803839:	ff d0                	callq  *%rax
  80383b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80383f:	48 8b 00             	mov    (%rax),%rax
  803842:	8b 10                	mov    (%rax),%edx
  803844:	83 ea 01             	sub    $0x1,%edx
  803847:	89 10                	mov    %edx,(%rax)
  803849:	eb 18                	jmp    803863 <argnextvalue+0xe3>
  80384b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80384f:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  803856:	00 
  803857:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80385b:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  803862:	00 
  803863:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803867:	48 8b 40 18          	mov    0x18(%rax),%rax
  80386b:	c9                   	leaveq 
  80386c:	c3                   	retq   

000000000080386d <fd2num>:
  80386d:	55                   	push   %rbp
  80386e:	48 89 e5             	mov    %rsp,%rbp
  803871:	48 83 ec 08          	sub    $0x8,%rsp
  803875:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803879:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80387d:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  803884:	ff ff ff 
  803887:	48 01 d0             	add    %rdx,%rax
  80388a:	48 c1 e8 0c          	shr    $0xc,%rax
  80388e:	c9                   	leaveq 
  80388f:	c3                   	retq   

0000000000803890 <fd2data>:
  803890:	55                   	push   %rbp
  803891:	48 89 e5             	mov    %rsp,%rbp
  803894:	48 83 ec 08          	sub    $0x8,%rsp
  803898:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80389c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038a0:	48 89 c7             	mov    %rax,%rdi
  8038a3:	48 b8 6d 38 80 00 00 	movabs $0x80386d,%rax
  8038aa:	00 00 00 
  8038ad:	ff d0                	callq  *%rax
  8038af:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  8038b5:	48 c1 e0 0c          	shl    $0xc,%rax
  8038b9:	c9                   	leaveq 
  8038ba:	c3                   	retq   

00000000008038bb <fd_alloc>:
  8038bb:	55                   	push   %rbp
  8038bc:	48 89 e5             	mov    %rsp,%rbp
  8038bf:	48 83 ec 18          	sub    $0x18,%rsp
  8038c3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8038c7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8038ce:	eb 6b                	jmp    80393b <fd_alloc+0x80>
  8038d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038d3:	48 98                	cltq   
  8038d5:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8038db:	48 c1 e0 0c          	shl    $0xc,%rax
  8038df:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8038e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038e7:	48 c1 e8 15          	shr    $0x15,%rax
  8038eb:	48 89 c2             	mov    %rax,%rdx
  8038ee:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8038f5:	01 00 00 
  8038f8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8038fc:	83 e0 01             	and    $0x1,%eax
  8038ff:	48 85 c0             	test   %rax,%rax
  803902:	74 21                	je     803925 <fd_alloc+0x6a>
  803904:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803908:	48 c1 e8 0c          	shr    $0xc,%rax
  80390c:	48 89 c2             	mov    %rax,%rdx
  80390f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803916:	01 00 00 
  803919:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80391d:	83 e0 01             	and    $0x1,%eax
  803920:	48 85 c0             	test   %rax,%rax
  803923:	75 12                	jne    803937 <fd_alloc+0x7c>
  803925:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803929:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80392d:	48 89 10             	mov    %rdx,(%rax)
  803930:	b8 00 00 00 00       	mov    $0x0,%eax
  803935:	eb 1a                	jmp    803951 <fd_alloc+0x96>
  803937:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80393b:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80393f:	7e 8f                	jle    8038d0 <fd_alloc+0x15>
  803941:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803945:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80394c:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  803951:	c9                   	leaveq 
  803952:	c3                   	retq   

0000000000803953 <fd_lookup>:
  803953:	55                   	push   %rbp
  803954:	48 89 e5             	mov    %rsp,%rbp
  803957:	48 83 ec 20          	sub    $0x20,%rsp
  80395b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80395e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803962:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803966:	78 06                	js     80396e <fd_lookup+0x1b>
  803968:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  80396c:	7e 07                	jle    803975 <fd_lookup+0x22>
  80396e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803973:	eb 6c                	jmp    8039e1 <fd_lookup+0x8e>
  803975:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803978:	48 98                	cltq   
  80397a:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  803980:	48 c1 e0 0c          	shl    $0xc,%rax
  803984:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803988:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80398c:	48 c1 e8 15          	shr    $0x15,%rax
  803990:	48 89 c2             	mov    %rax,%rdx
  803993:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80399a:	01 00 00 
  80399d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8039a1:	83 e0 01             	and    $0x1,%eax
  8039a4:	48 85 c0             	test   %rax,%rax
  8039a7:	74 21                	je     8039ca <fd_lookup+0x77>
  8039a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039ad:	48 c1 e8 0c          	shr    $0xc,%rax
  8039b1:	48 89 c2             	mov    %rax,%rdx
  8039b4:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8039bb:	01 00 00 
  8039be:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8039c2:	83 e0 01             	and    $0x1,%eax
  8039c5:	48 85 c0             	test   %rax,%rax
  8039c8:	75 07                	jne    8039d1 <fd_lookup+0x7e>
  8039ca:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8039cf:	eb 10                	jmp    8039e1 <fd_lookup+0x8e>
  8039d1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8039d5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8039d9:	48 89 10             	mov    %rdx,(%rax)
  8039dc:	b8 00 00 00 00       	mov    $0x0,%eax
  8039e1:	c9                   	leaveq 
  8039e2:	c3                   	retq   

00000000008039e3 <fd_close>:
  8039e3:	55                   	push   %rbp
  8039e4:	48 89 e5             	mov    %rsp,%rbp
  8039e7:	48 83 ec 30          	sub    $0x30,%rsp
  8039eb:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8039ef:	89 f0                	mov    %esi,%eax
  8039f1:	88 45 d4             	mov    %al,-0x2c(%rbp)
  8039f4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8039f8:	48 89 c7             	mov    %rax,%rdi
  8039fb:	48 b8 6d 38 80 00 00 	movabs $0x80386d,%rax
  803a02:	00 00 00 
  803a05:	ff d0                	callq  *%rax
  803a07:	89 c2                	mov    %eax,%edx
  803a09:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803a0d:	48 89 c6             	mov    %rax,%rsi
  803a10:	89 d7                	mov    %edx,%edi
  803a12:	48 b8 53 39 80 00 00 	movabs $0x803953,%rax
  803a19:	00 00 00 
  803a1c:	ff d0                	callq  *%rax
  803a1e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a21:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a25:	78 0a                	js     803a31 <fd_close+0x4e>
  803a27:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a2b:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  803a2f:	74 12                	je     803a43 <fd_close+0x60>
  803a31:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  803a35:	74 05                	je     803a3c <fd_close+0x59>
  803a37:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a3a:	eb 70                	jmp    803aac <fd_close+0xc9>
  803a3c:	b8 00 00 00 00       	mov    $0x0,%eax
  803a41:	eb 69                	jmp    803aac <fd_close+0xc9>
  803a43:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a47:	8b 00                	mov    (%rax),%eax
  803a49:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803a4d:	48 89 d6             	mov    %rdx,%rsi
  803a50:	89 c7                	mov    %eax,%edi
  803a52:	48 b8 ae 3a 80 00 00 	movabs $0x803aae,%rax
  803a59:	00 00 00 
  803a5c:	ff d0                	callq  *%rax
  803a5e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a61:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a65:	78 2a                	js     803a91 <fd_close+0xae>
  803a67:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a6b:	48 8b 40 20          	mov    0x20(%rax),%rax
  803a6f:	48 85 c0             	test   %rax,%rax
  803a72:	74 16                	je     803a8a <fd_close+0xa7>
  803a74:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a78:	48 8b 40 20          	mov    0x20(%rax),%rax
  803a7c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803a80:	48 89 d7             	mov    %rdx,%rdi
  803a83:	ff d0                	callq  *%rax
  803a85:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a88:	eb 07                	jmp    803a91 <fd_close+0xae>
  803a8a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803a91:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a95:	48 89 c6             	mov    %rax,%rsi
  803a98:	bf 00 00 00 00       	mov    $0x0,%edi
  803a9d:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  803aa4:	00 00 00 
  803aa7:	ff d0                	callq  *%rax
  803aa9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803aac:	c9                   	leaveq 
  803aad:	c3                   	retq   

0000000000803aae <dev_lookup>:
  803aae:	55                   	push   %rbp
  803aaf:	48 89 e5             	mov    %rsp,%rbp
  803ab2:	48 83 ec 20          	sub    $0x20,%rsp
  803ab6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ab9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803abd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803ac4:	eb 41                	jmp    803b07 <dev_lookup+0x59>
  803ac6:	48 b8 60 90 80 00 00 	movabs $0x809060,%rax
  803acd:	00 00 00 
  803ad0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ad3:	48 63 d2             	movslq %edx,%rdx
  803ad6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803ada:	8b 00                	mov    (%rax),%eax
  803adc:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  803adf:	75 22                	jne    803b03 <dev_lookup+0x55>
  803ae1:	48 b8 60 90 80 00 00 	movabs $0x809060,%rax
  803ae8:	00 00 00 
  803aeb:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803aee:	48 63 d2             	movslq %edx,%rdx
  803af1:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  803af5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803af9:	48 89 10             	mov    %rdx,(%rax)
  803afc:	b8 00 00 00 00       	mov    $0x0,%eax
  803b01:	eb 60                	jmp    803b63 <dev_lookup+0xb5>
  803b03:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803b07:	48 b8 60 90 80 00 00 	movabs $0x809060,%rax
  803b0e:	00 00 00 
  803b11:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803b14:	48 63 d2             	movslq %edx,%rdx
  803b17:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803b1b:	48 85 c0             	test   %rax,%rax
  803b1e:	75 a6                	jne    803ac6 <dev_lookup+0x18>
  803b20:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  803b27:	00 00 00 
  803b2a:	48 8b 00             	mov    (%rax),%rax
  803b2d:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803b33:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803b36:	89 c6                	mov    %eax,%esi
  803b38:	48 bf 30 72 80 00 00 	movabs $0x807230,%rdi
  803b3f:	00 00 00 
  803b42:	b8 00 00 00 00       	mov    $0x0,%eax
  803b47:	48 b9 5c 15 80 00 00 	movabs $0x80155c,%rcx
  803b4e:	00 00 00 
  803b51:	ff d1                	callq  *%rcx
  803b53:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b57:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  803b5e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803b63:	c9                   	leaveq 
  803b64:	c3                   	retq   

0000000000803b65 <close>:
  803b65:	55                   	push   %rbp
  803b66:	48 89 e5             	mov    %rsp,%rbp
  803b69:	48 83 ec 20          	sub    $0x20,%rsp
  803b6d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b70:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803b74:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b77:	48 89 d6             	mov    %rdx,%rsi
  803b7a:	89 c7                	mov    %eax,%edi
  803b7c:	48 b8 53 39 80 00 00 	movabs $0x803953,%rax
  803b83:	00 00 00 
  803b86:	ff d0                	callq  *%rax
  803b88:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b8b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b8f:	79 05                	jns    803b96 <close+0x31>
  803b91:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b94:	eb 18                	jmp    803bae <close+0x49>
  803b96:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b9a:	be 01 00 00 00       	mov    $0x1,%esi
  803b9f:	48 89 c7             	mov    %rax,%rdi
  803ba2:	48 b8 e3 39 80 00 00 	movabs $0x8039e3,%rax
  803ba9:	00 00 00 
  803bac:	ff d0                	callq  *%rax
  803bae:	c9                   	leaveq 
  803baf:	c3                   	retq   

0000000000803bb0 <close_all>:
  803bb0:	55                   	push   %rbp
  803bb1:	48 89 e5             	mov    %rsp,%rbp
  803bb4:	48 83 ec 10          	sub    $0x10,%rsp
  803bb8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803bbf:	eb 15                	jmp    803bd6 <close_all+0x26>
  803bc1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bc4:	89 c7                	mov    %eax,%edi
  803bc6:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  803bcd:	00 00 00 
  803bd0:	ff d0                	callq  *%rax
  803bd2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803bd6:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  803bda:	7e e5                	jle    803bc1 <close_all+0x11>
  803bdc:	90                   	nop
  803bdd:	c9                   	leaveq 
  803bde:	c3                   	retq   

0000000000803bdf <dup>:
  803bdf:	55                   	push   %rbp
  803be0:	48 89 e5             	mov    %rsp,%rbp
  803be3:	48 83 ec 40          	sub    $0x40,%rsp
  803be7:	89 7d cc             	mov    %edi,-0x34(%rbp)
  803bea:	89 75 c8             	mov    %esi,-0x38(%rbp)
  803bed:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  803bf1:	8b 45 cc             	mov    -0x34(%rbp),%eax
  803bf4:	48 89 d6             	mov    %rdx,%rsi
  803bf7:	89 c7                	mov    %eax,%edi
  803bf9:	48 b8 53 39 80 00 00 	movabs $0x803953,%rax
  803c00:	00 00 00 
  803c03:	ff d0                	callq  *%rax
  803c05:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c08:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c0c:	79 08                	jns    803c16 <dup+0x37>
  803c0e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c11:	e9 70 01 00 00       	jmpq   803d86 <dup+0x1a7>
  803c16:	8b 45 c8             	mov    -0x38(%rbp),%eax
  803c19:	89 c7                	mov    %eax,%edi
  803c1b:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  803c22:	00 00 00 
  803c25:	ff d0                	callq  *%rax
  803c27:	8b 45 c8             	mov    -0x38(%rbp),%eax
  803c2a:	48 98                	cltq   
  803c2c:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  803c32:	48 c1 e0 0c          	shl    $0xc,%rax
  803c36:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803c3a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c3e:	48 89 c7             	mov    %rax,%rdi
  803c41:	48 b8 90 38 80 00 00 	movabs $0x803890,%rax
  803c48:	00 00 00 
  803c4b:	ff d0                	callq  *%rax
  803c4d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803c51:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c55:	48 89 c7             	mov    %rax,%rdi
  803c58:	48 b8 90 38 80 00 00 	movabs $0x803890,%rax
  803c5f:	00 00 00 
  803c62:	ff d0                	callq  *%rax
  803c64:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803c68:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803c6c:	48 c1 e8 15          	shr    $0x15,%rax
  803c70:	48 89 c2             	mov    %rax,%rdx
  803c73:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803c7a:	01 00 00 
  803c7d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803c81:	83 e0 01             	and    $0x1,%eax
  803c84:	48 85 c0             	test   %rax,%rax
  803c87:	74 71                	je     803cfa <dup+0x11b>
  803c89:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803c8d:	48 c1 e8 0c          	shr    $0xc,%rax
  803c91:	48 89 c2             	mov    %rax,%rdx
  803c94:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803c9b:	01 00 00 
  803c9e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803ca2:	83 e0 01             	and    $0x1,%eax
  803ca5:	48 85 c0             	test   %rax,%rax
  803ca8:	74 50                	je     803cfa <dup+0x11b>
  803caa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803cae:	48 c1 e8 0c          	shr    $0xc,%rax
  803cb2:	48 89 c2             	mov    %rax,%rdx
  803cb5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803cbc:	01 00 00 
  803cbf:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803cc3:	25 07 0e 00 00       	and    $0xe07,%eax
  803cc8:	89 c1                	mov    %eax,%ecx
  803cca:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803cce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803cd2:	41 89 c8             	mov    %ecx,%r8d
  803cd5:	48 89 d1             	mov    %rdx,%rcx
  803cd8:	ba 00 00 00 00       	mov    $0x0,%edx
  803cdd:	48 89 c6             	mov    %rax,%rsi
  803ce0:	bf 00 00 00 00       	mov    $0x0,%edi
  803ce5:	48 b8 cc 2b 80 00 00 	movabs $0x802bcc,%rax
  803cec:	00 00 00 
  803cef:	ff d0                	callq  *%rax
  803cf1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803cf4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cf8:	78 55                	js     803d4f <dup+0x170>
  803cfa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803cfe:	48 c1 e8 0c          	shr    $0xc,%rax
  803d02:	48 89 c2             	mov    %rax,%rdx
  803d05:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803d0c:	01 00 00 
  803d0f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803d13:	25 07 0e 00 00       	and    $0xe07,%eax
  803d18:	89 c1                	mov    %eax,%ecx
  803d1a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d1e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803d22:	41 89 c8             	mov    %ecx,%r8d
  803d25:	48 89 d1             	mov    %rdx,%rcx
  803d28:	ba 00 00 00 00       	mov    $0x0,%edx
  803d2d:	48 89 c6             	mov    %rax,%rsi
  803d30:	bf 00 00 00 00       	mov    $0x0,%edi
  803d35:	48 b8 cc 2b 80 00 00 	movabs $0x802bcc,%rax
  803d3c:	00 00 00 
  803d3f:	ff d0                	callq  *%rax
  803d41:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d44:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d48:	78 08                	js     803d52 <dup+0x173>
  803d4a:	8b 45 c8             	mov    -0x38(%rbp),%eax
  803d4d:	eb 37                	jmp    803d86 <dup+0x1a7>
  803d4f:	90                   	nop
  803d50:	eb 01                	jmp    803d53 <dup+0x174>
  803d52:	90                   	nop
  803d53:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d57:	48 89 c6             	mov    %rax,%rsi
  803d5a:	bf 00 00 00 00       	mov    $0x0,%edi
  803d5f:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  803d66:	00 00 00 
  803d69:	ff d0                	callq  *%rax
  803d6b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803d6f:	48 89 c6             	mov    %rax,%rsi
  803d72:	bf 00 00 00 00       	mov    $0x0,%edi
  803d77:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  803d7e:	00 00 00 
  803d81:	ff d0                	callq  *%rax
  803d83:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d86:	c9                   	leaveq 
  803d87:	c3                   	retq   

0000000000803d88 <read>:
  803d88:	55                   	push   %rbp
  803d89:	48 89 e5             	mov    %rsp,%rbp
  803d8c:	48 83 ec 40          	sub    $0x40,%rsp
  803d90:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803d93:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803d97:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803d9b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803d9f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803da2:	48 89 d6             	mov    %rdx,%rsi
  803da5:	89 c7                	mov    %eax,%edi
  803da7:	48 b8 53 39 80 00 00 	movabs $0x803953,%rax
  803dae:	00 00 00 
  803db1:	ff d0                	callq  *%rax
  803db3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803db6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803dba:	78 24                	js     803de0 <read+0x58>
  803dbc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803dc0:	8b 00                	mov    (%rax),%eax
  803dc2:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803dc6:	48 89 d6             	mov    %rdx,%rsi
  803dc9:	89 c7                	mov    %eax,%edi
  803dcb:	48 b8 ae 3a 80 00 00 	movabs $0x803aae,%rax
  803dd2:	00 00 00 
  803dd5:	ff d0                	callq  *%rax
  803dd7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803dda:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803dde:	79 05                	jns    803de5 <read+0x5d>
  803de0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803de3:	eb 76                	jmp    803e5b <read+0xd3>
  803de5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803de9:	8b 40 08             	mov    0x8(%rax),%eax
  803dec:	83 e0 03             	and    $0x3,%eax
  803def:	83 f8 01             	cmp    $0x1,%eax
  803df2:	75 3a                	jne    803e2e <read+0xa6>
  803df4:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  803dfb:	00 00 00 
  803dfe:	48 8b 00             	mov    (%rax),%rax
  803e01:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803e07:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803e0a:	89 c6                	mov    %eax,%esi
  803e0c:	48 bf 4f 72 80 00 00 	movabs $0x80724f,%rdi
  803e13:	00 00 00 
  803e16:	b8 00 00 00 00       	mov    $0x0,%eax
  803e1b:	48 b9 5c 15 80 00 00 	movabs $0x80155c,%rcx
  803e22:	00 00 00 
  803e25:	ff d1                	callq  *%rcx
  803e27:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803e2c:	eb 2d                	jmp    803e5b <read+0xd3>
  803e2e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e32:	48 8b 40 10          	mov    0x10(%rax),%rax
  803e36:	48 85 c0             	test   %rax,%rax
  803e39:	75 07                	jne    803e42 <read+0xba>
  803e3b:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803e40:	eb 19                	jmp    803e5b <read+0xd3>
  803e42:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e46:	48 8b 40 10          	mov    0x10(%rax),%rax
  803e4a:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803e4e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803e52:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  803e56:	48 89 cf             	mov    %rcx,%rdi
  803e59:	ff d0                	callq  *%rax
  803e5b:	c9                   	leaveq 
  803e5c:	c3                   	retq   

0000000000803e5d <readn>:
  803e5d:	55                   	push   %rbp
  803e5e:	48 89 e5             	mov    %rsp,%rbp
  803e61:	48 83 ec 30          	sub    $0x30,%rsp
  803e65:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e68:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803e6c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803e70:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803e77:	eb 47                	jmp    803ec0 <readn+0x63>
  803e79:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e7c:	48 98                	cltq   
  803e7e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803e82:	48 29 c2             	sub    %rax,%rdx
  803e85:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e88:	48 63 c8             	movslq %eax,%rcx
  803e8b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e8f:	48 01 c1             	add    %rax,%rcx
  803e92:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803e95:	48 89 ce             	mov    %rcx,%rsi
  803e98:	89 c7                	mov    %eax,%edi
  803e9a:	48 b8 88 3d 80 00 00 	movabs $0x803d88,%rax
  803ea1:	00 00 00 
  803ea4:	ff d0                	callq  *%rax
  803ea6:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803ea9:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803ead:	79 05                	jns    803eb4 <readn+0x57>
  803eaf:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803eb2:	eb 1d                	jmp    803ed1 <readn+0x74>
  803eb4:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803eb8:	74 13                	je     803ecd <readn+0x70>
  803eba:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803ebd:	01 45 fc             	add    %eax,-0x4(%rbp)
  803ec0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ec3:	48 98                	cltq   
  803ec5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803ec9:	72 ae                	jb     803e79 <readn+0x1c>
  803ecb:	eb 01                	jmp    803ece <readn+0x71>
  803ecd:	90                   	nop
  803ece:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ed1:	c9                   	leaveq 
  803ed2:	c3                   	retq   

0000000000803ed3 <write>:
  803ed3:	55                   	push   %rbp
  803ed4:	48 89 e5             	mov    %rsp,%rbp
  803ed7:	48 83 ec 40          	sub    $0x40,%rsp
  803edb:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803ede:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803ee2:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803ee6:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803eea:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803eed:	48 89 d6             	mov    %rdx,%rsi
  803ef0:	89 c7                	mov    %eax,%edi
  803ef2:	48 b8 53 39 80 00 00 	movabs $0x803953,%rax
  803ef9:	00 00 00 
  803efc:	ff d0                	callq  *%rax
  803efe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f01:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f05:	78 24                	js     803f2b <write+0x58>
  803f07:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f0b:	8b 00                	mov    (%rax),%eax
  803f0d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803f11:	48 89 d6             	mov    %rdx,%rsi
  803f14:	89 c7                	mov    %eax,%edi
  803f16:	48 b8 ae 3a 80 00 00 	movabs $0x803aae,%rax
  803f1d:	00 00 00 
  803f20:	ff d0                	callq  *%rax
  803f22:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f25:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f29:	79 05                	jns    803f30 <write+0x5d>
  803f2b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f2e:	eb 75                	jmp    803fa5 <write+0xd2>
  803f30:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f34:	8b 40 08             	mov    0x8(%rax),%eax
  803f37:	83 e0 03             	and    $0x3,%eax
  803f3a:	85 c0                	test   %eax,%eax
  803f3c:	75 3a                	jne    803f78 <write+0xa5>
  803f3e:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  803f45:	00 00 00 
  803f48:	48 8b 00             	mov    (%rax),%rax
  803f4b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803f51:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803f54:	89 c6                	mov    %eax,%esi
  803f56:	48 bf 6b 72 80 00 00 	movabs $0x80726b,%rdi
  803f5d:	00 00 00 
  803f60:	b8 00 00 00 00       	mov    $0x0,%eax
  803f65:	48 b9 5c 15 80 00 00 	movabs $0x80155c,%rcx
  803f6c:	00 00 00 
  803f6f:	ff d1                	callq  *%rcx
  803f71:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803f76:	eb 2d                	jmp    803fa5 <write+0xd2>
  803f78:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f7c:	48 8b 40 18          	mov    0x18(%rax),%rax
  803f80:	48 85 c0             	test   %rax,%rax
  803f83:	75 07                	jne    803f8c <write+0xb9>
  803f85:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803f8a:	eb 19                	jmp    803fa5 <write+0xd2>
  803f8c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f90:	48 8b 40 18          	mov    0x18(%rax),%rax
  803f94:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803f98:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803f9c:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  803fa0:	48 89 cf             	mov    %rcx,%rdi
  803fa3:	ff d0                	callq  *%rax
  803fa5:	c9                   	leaveq 
  803fa6:	c3                   	retq   

0000000000803fa7 <seek>:
  803fa7:	55                   	push   %rbp
  803fa8:	48 89 e5             	mov    %rsp,%rbp
  803fab:	48 83 ec 18          	sub    $0x18,%rsp
  803faf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803fb2:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803fb5:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803fb9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803fbc:	48 89 d6             	mov    %rdx,%rsi
  803fbf:	89 c7                	mov    %eax,%edi
  803fc1:	48 b8 53 39 80 00 00 	movabs $0x803953,%rax
  803fc8:	00 00 00 
  803fcb:	ff d0                	callq  *%rax
  803fcd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803fd0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803fd4:	79 05                	jns    803fdb <seek+0x34>
  803fd6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fd9:	eb 0f                	jmp    803fea <seek+0x43>
  803fdb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fdf:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803fe2:	89 50 04             	mov    %edx,0x4(%rax)
  803fe5:	b8 00 00 00 00       	mov    $0x0,%eax
  803fea:	c9                   	leaveq 
  803feb:	c3                   	retq   

0000000000803fec <ftruncate>:
  803fec:	55                   	push   %rbp
  803fed:	48 89 e5             	mov    %rsp,%rbp
  803ff0:	48 83 ec 30          	sub    $0x30,%rsp
  803ff4:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803ff7:	89 75 d8             	mov    %esi,-0x28(%rbp)
  803ffa:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803ffe:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804001:	48 89 d6             	mov    %rdx,%rsi
  804004:	89 c7                	mov    %eax,%edi
  804006:	48 b8 53 39 80 00 00 	movabs $0x803953,%rax
  80400d:	00 00 00 
  804010:	ff d0                	callq  *%rax
  804012:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804015:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804019:	78 24                	js     80403f <ftruncate+0x53>
  80401b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80401f:	8b 00                	mov    (%rax),%eax
  804021:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804025:	48 89 d6             	mov    %rdx,%rsi
  804028:	89 c7                	mov    %eax,%edi
  80402a:	48 b8 ae 3a 80 00 00 	movabs $0x803aae,%rax
  804031:	00 00 00 
  804034:	ff d0                	callq  *%rax
  804036:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804039:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80403d:	79 05                	jns    804044 <ftruncate+0x58>
  80403f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804042:	eb 72                	jmp    8040b6 <ftruncate+0xca>
  804044:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804048:	8b 40 08             	mov    0x8(%rax),%eax
  80404b:	83 e0 03             	and    $0x3,%eax
  80404e:	85 c0                	test   %eax,%eax
  804050:	75 3a                	jne    80408c <ftruncate+0xa0>
  804052:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  804059:	00 00 00 
  80405c:	48 8b 00             	mov    (%rax),%rax
  80405f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804065:	8b 55 dc             	mov    -0x24(%rbp),%edx
  804068:	89 c6                	mov    %eax,%esi
  80406a:	48 bf 88 72 80 00 00 	movabs $0x807288,%rdi
  804071:	00 00 00 
  804074:	b8 00 00 00 00       	mov    $0x0,%eax
  804079:	48 b9 5c 15 80 00 00 	movabs $0x80155c,%rcx
  804080:	00 00 00 
  804083:	ff d1                	callq  *%rcx
  804085:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80408a:	eb 2a                	jmp    8040b6 <ftruncate+0xca>
  80408c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804090:	48 8b 40 30          	mov    0x30(%rax),%rax
  804094:	48 85 c0             	test   %rax,%rax
  804097:	75 07                	jne    8040a0 <ftruncate+0xb4>
  804099:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80409e:	eb 16                	jmp    8040b6 <ftruncate+0xca>
  8040a0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040a4:	48 8b 40 30          	mov    0x30(%rax),%rax
  8040a8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8040ac:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8040af:	89 ce                	mov    %ecx,%esi
  8040b1:	48 89 d7             	mov    %rdx,%rdi
  8040b4:	ff d0                	callq  *%rax
  8040b6:	c9                   	leaveq 
  8040b7:	c3                   	retq   

00000000008040b8 <fstat>:
  8040b8:	55                   	push   %rbp
  8040b9:	48 89 e5             	mov    %rsp,%rbp
  8040bc:	48 83 ec 30          	sub    $0x30,%rsp
  8040c0:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8040c3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8040c7:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8040cb:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8040ce:	48 89 d6             	mov    %rdx,%rsi
  8040d1:	89 c7                	mov    %eax,%edi
  8040d3:	48 b8 53 39 80 00 00 	movabs $0x803953,%rax
  8040da:	00 00 00 
  8040dd:	ff d0                	callq  *%rax
  8040df:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040e2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040e6:	78 24                	js     80410c <fstat+0x54>
  8040e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8040ec:	8b 00                	mov    (%rax),%eax
  8040ee:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8040f2:	48 89 d6             	mov    %rdx,%rsi
  8040f5:	89 c7                	mov    %eax,%edi
  8040f7:	48 b8 ae 3a 80 00 00 	movabs $0x803aae,%rax
  8040fe:	00 00 00 
  804101:	ff d0                	callq  *%rax
  804103:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804106:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80410a:	79 05                	jns    804111 <fstat+0x59>
  80410c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80410f:	eb 5e                	jmp    80416f <fstat+0xb7>
  804111:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804115:	48 8b 40 28          	mov    0x28(%rax),%rax
  804119:	48 85 c0             	test   %rax,%rax
  80411c:	75 07                	jne    804125 <fstat+0x6d>
  80411e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  804123:	eb 4a                	jmp    80416f <fstat+0xb7>
  804125:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804129:	c6 00 00             	movb   $0x0,(%rax)
  80412c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804130:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  804137:	00 00 00 
  80413a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80413e:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804145:	00 00 00 
  804148:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80414c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804150:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  804157:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80415b:	48 8b 40 28          	mov    0x28(%rax),%rax
  80415f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804163:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  804167:	48 89 ce             	mov    %rcx,%rsi
  80416a:	48 89 d7             	mov    %rdx,%rdi
  80416d:	ff d0                	callq  *%rax
  80416f:	c9                   	leaveq 
  804170:	c3                   	retq   

0000000000804171 <stat>:
  804171:	55                   	push   %rbp
  804172:	48 89 e5             	mov    %rsp,%rbp
  804175:	48 83 ec 20          	sub    $0x20,%rsp
  804179:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80417d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804181:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804185:	be 00 00 00 00       	mov    $0x0,%esi
  80418a:	48 89 c7             	mov    %rax,%rdi
  80418d:	48 b8 61 42 80 00 00 	movabs $0x804261,%rax
  804194:	00 00 00 
  804197:	ff d0                	callq  *%rax
  804199:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80419c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041a0:	79 05                	jns    8041a7 <stat+0x36>
  8041a2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041a5:	eb 2f                	jmp    8041d6 <stat+0x65>
  8041a7:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8041ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041ae:	48 89 d6             	mov    %rdx,%rsi
  8041b1:	89 c7                	mov    %eax,%edi
  8041b3:	48 b8 b8 40 80 00 00 	movabs $0x8040b8,%rax
  8041ba:	00 00 00 
  8041bd:	ff d0                	callq  *%rax
  8041bf:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8041c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041c5:	89 c7                	mov    %eax,%edi
  8041c7:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  8041ce:	00 00 00 
  8041d1:	ff d0                	callq  *%rax
  8041d3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8041d6:	c9                   	leaveq 
  8041d7:	c3                   	retq   

00000000008041d8 <fsipc>:
  8041d8:	55                   	push   %rbp
  8041d9:	48 89 e5             	mov    %rsp,%rbp
  8041dc:	48 83 ec 10          	sub    $0x10,%rsp
  8041e0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8041e3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8041e7:	48 b8 20 a4 80 00 00 	movabs $0x80a420,%rax
  8041ee:	00 00 00 
  8041f1:	8b 00                	mov    (%rax),%eax
  8041f3:	85 c0                	test   %eax,%eax
  8041f5:	75 1f                	jne    804216 <fsipc+0x3e>
  8041f7:	bf 01 00 00 00       	mov    $0x1,%edi
  8041fc:	48 b8 65 68 80 00 00 	movabs $0x806865,%rax
  804203:	00 00 00 
  804206:	ff d0                	callq  *%rax
  804208:	89 c2                	mov    %eax,%edx
  80420a:	48 b8 20 a4 80 00 00 	movabs $0x80a420,%rax
  804211:	00 00 00 
  804214:	89 10                	mov    %edx,(%rax)
  804216:	48 b8 20 a4 80 00 00 	movabs $0x80a420,%rax
  80421d:	00 00 00 
  804220:	8b 00                	mov    (%rax),%eax
  804222:	8b 75 fc             	mov    -0x4(%rbp),%esi
  804225:	b9 07 00 00 00       	mov    $0x7,%ecx
  80422a:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  804231:	00 00 00 
  804234:	89 c7                	mov    %eax,%edi
  804236:	48 b8 5b 67 80 00 00 	movabs $0x80675b,%rax
  80423d:	00 00 00 
  804240:	ff d0                	callq  *%rax
  804242:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804246:	ba 00 00 00 00       	mov    $0x0,%edx
  80424b:	48 89 c6             	mov    %rax,%rsi
  80424e:	bf 00 00 00 00       	mov    $0x0,%edi
  804253:	48 b8 9a 66 80 00 00 	movabs $0x80669a,%rax
  80425a:	00 00 00 
  80425d:	ff d0                	callq  *%rax
  80425f:	c9                   	leaveq 
  804260:	c3                   	retq   

0000000000804261 <open>:
  804261:	55                   	push   %rbp
  804262:	48 89 e5             	mov    %rsp,%rbp
  804265:	48 83 ec 20          	sub    $0x20,%rsp
  804269:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80426d:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  804270:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804274:	48 89 c7             	mov    %rax,%rdi
  804277:	48 b8 de 21 80 00 00 	movabs $0x8021de,%rax
  80427e:	00 00 00 
  804281:	ff d0                	callq  *%rax
  804283:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  804288:	7e 0a                	jle    804294 <open+0x33>
  80428a:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80428f:	e9 a5 00 00 00       	jmpq   804339 <open+0xd8>
  804294:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804298:	48 89 c7             	mov    %rax,%rdi
  80429b:	48 b8 bb 38 80 00 00 	movabs $0x8038bb,%rax
  8042a2:	00 00 00 
  8042a5:	ff d0                	callq  *%rax
  8042a7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8042aa:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8042ae:	79 08                	jns    8042b8 <open+0x57>
  8042b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042b3:	e9 81 00 00 00       	jmpq   804339 <open+0xd8>
  8042b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042bc:	48 89 c6             	mov    %rax,%rsi
  8042bf:	48 bf 00 b0 80 00 00 	movabs $0x80b000,%rdi
  8042c6:	00 00 00 
  8042c9:	48 b8 4a 22 80 00 00 	movabs $0x80224a,%rax
  8042d0:	00 00 00 
  8042d3:	ff d0                	callq  *%rax
  8042d5:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8042dc:	00 00 00 
  8042df:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8042e2:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8042e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042ec:	48 89 c6             	mov    %rax,%rsi
  8042ef:	bf 01 00 00 00       	mov    $0x1,%edi
  8042f4:	48 b8 d8 41 80 00 00 	movabs $0x8041d8,%rax
  8042fb:	00 00 00 
  8042fe:	ff d0                	callq  *%rax
  804300:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804303:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804307:	79 1d                	jns    804326 <open+0xc5>
  804309:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80430d:	be 00 00 00 00       	mov    $0x0,%esi
  804312:	48 89 c7             	mov    %rax,%rdi
  804315:	48 b8 e3 39 80 00 00 	movabs $0x8039e3,%rax
  80431c:	00 00 00 
  80431f:	ff d0                	callq  *%rax
  804321:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804324:	eb 13                	jmp    804339 <open+0xd8>
  804326:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80432a:	48 89 c7             	mov    %rax,%rdi
  80432d:	48 b8 6d 38 80 00 00 	movabs $0x80386d,%rax
  804334:	00 00 00 
  804337:	ff d0                	callq  *%rax
  804339:	c9                   	leaveq 
  80433a:	c3                   	retq   

000000000080433b <devfile_flush>:
  80433b:	55                   	push   %rbp
  80433c:	48 89 e5             	mov    %rsp,%rbp
  80433f:	48 83 ec 10          	sub    $0x10,%rsp
  804343:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804347:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80434b:	8b 50 0c             	mov    0xc(%rax),%edx
  80434e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804355:	00 00 00 
  804358:	89 10                	mov    %edx,(%rax)
  80435a:	be 00 00 00 00       	mov    $0x0,%esi
  80435f:	bf 06 00 00 00       	mov    $0x6,%edi
  804364:	48 b8 d8 41 80 00 00 	movabs $0x8041d8,%rax
  80436b:	00 00 00 
  80436e:	ff d0                	callq  *%rax
  804370:	c9                   	leaveq 
  804371:	c3                   	retq   

0000000000804372 <devfile_read>:
  804372:	55                   	push   %rbp
  804373:	48 89 e5             	mov    %rsp,%rbp
  804376:	48 83 ec 30          	sub    $0x30,%rsp
  80437a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80437e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804382:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804386:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80438a:	8b 50 0c             	mov    0xc(%rax),%edx
  80438d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804394:	00 00 00 
  804397:	89 10                	mov    %edx,(%rax)
  804399:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8043a0:	00 00 00 
  8043a3:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8043a7:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8043ab:	be 00 00 00 00       	mov    $0x0,%esi
  8043b0:	bf 03 00 00 00       	mov    $0x3,%edi
  8043b5:	48 b8 d8 41 80 00 00 	movabs $0x8041d8,%rax
  8043bc:	00 00 00 
  8043bf:	ff d0                	callq  *%rax
  8043c1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8043c4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8043c8:	79 08                	jns    8043d2 <devfile_read+0x60>
  8043ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043cd:	e9 a4 00 00 00       	jmpq   804476 <devfile_read+0x104>
  8043d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043d5:	48 98                	cltq   
  8043d7:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8043db:	76 35                	jbe    804412 <devfile_read+0xa0>
  8043dd:	48 b9 ae 72 80 00 00 	movabs $0x8072ae,%rcx
  8043e4:	00 00 00 
  8043e7:	48 ba b5 72 80 00 00 	movabs $0x8072b5,%rdx
  8043ee:	00 00 00 
  8043f1:	be 89 00 00 00       	mov    $0x89,%esi
  8043f6:	48 bf ca 72 80 00 00 	movabs $0x8072ca,%rdi
  8043fd:	00 00 00 
  804400:	b8 00 00 00 00       	mov    $0x0,%eax
  804405:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  80440c:	00 00 00 
  80440f:	41 ff d0             	callq  *%r8
  804412:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  804419:	7e 35                	jle    804450 <devfile_read+0xde>
  80441b:	48 b9 d8 72 80 00 00 	movabs $0x8072d8,%rcx
  804422:	00 00 00 
  804425:	48 ba b5 72 80 00 00 	movabs $0x8072b5,%rdx
  80442c:	00 00 00 
  80442f:	be 8a 00 00 00       	mov    $0x8a,%esi
  804434:	48 bf ca 72 80 00 00 	movabs $0x8072ca,%rdi
  80443b:	00 00 00 
  80443e:	b8 00 00 00 00       	mov    $0x0,%eax
  804443:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  80444a:	00 00 00 
  80444d:	41 ff d0             	callq  *%r8
  804450:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804453:	48 63 d0             	movslq %eax,%rdx
  804456:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80445a:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  804461:	00 00 00 
  804464:	48 89 c7             	mov    %rax,%rdi
  804467:	48 b8 6f 25 80 00 00 	movabs $0x80256f,%rax
  80446e:	00 00 00 
  804471:	ff d0                	callq  *%rax
  804473:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804476:	c9                   	leaveq 
  804477:	c3                   	retq   

0000000000804478 <devfile_write>:
  804478:	55                   	push   %rbp
  804479:	48 89 e5             	mov    %rsp,%rbp
  80447c:	48 83 ec 40          	sub    $0x40,%rsp
  804480:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804484:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804488:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80448c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804490:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804494:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  80449b:	00 
  80449c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044a0:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8044a4:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  8044a9:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8044ad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044b1:	8b 50 0c             	mov    0xc(%rax),%edx
  8044b4:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8044bb:	00 00 00 
  8044be:	89 10                	mov    %edx,(%rax)
  8044c0:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8044c7:	00 00 00 
  8044ca:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8044ce:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8044d2:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8044d6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8044da:	48 89 c6             	mov    %rax,%rsi
  8044dd:	48 bf 10 b0 80 00 00 	movabs $0x80b010,%rdi
  8044e4:	00 00 00 
  8044e7:	48 b8 6f 25 80 00 00 	movabs $0x80256f,%rax
  8044ee:	00 00 00 
  8044f1:	ff d0                	callq  *%rax
  8044f3:	be 00 00 00 00       	mov    $0x0,%esi
  8044f8:	bf 04 00 00 00       	mov    $0x4,%edi
  8044fd:	48 b8 d8 41 80 00 00 	movabs $0x8041d8,%rax
  804504:	00 00 00 
  804507:	ff d0                	callq  *%rax
  804509:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80450c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804510:	79 05                	jns    804517 <devfile_write+0x9f>
  804512:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804515:	eb 43                	jmp    80455a <devfile_write+0xe2>
  804517:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80451a:	48 98                	cltq   
  80451c:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804520:	76 35                	jbe    804557 <devfile_write+0xdf>
  804522:	48 b9 ae 72 80 00 00 	movabs $0x8072ae,%rcx
  804529:	00 00 00 
  80452c:	48 ba b5 72 80 00 00 	movabs $0x8072b5,%rdx
  804533:	00 00 00 
  804536:	be a8 00 00 00       	mov    $0xa8,%esi
  80453b:	48 bf ca 72 80 00 00 	movabs $0x8072ca,%rdi
  804542:	00 00 00 
  804545:	b8 00 00 00 00       	mov    $0x0,%eax
  80454a:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  804551:	00 00 00 
  804554:	41 ff d0             	callq  *%r8
  804557:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80455a:	c9                   	leaveq 
  80455b:	c3                   	retq   

000000000080455c <devfile_stat>:
  80455c:	55                   	push   %rbp
  80455d:	48 89 e5             	mov    %rsp,%rbp
  804560:	48 83 ec 20          	sub    $0x20,%rsp
  804564:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804568:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80456c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804570:	8b 50 0c             	mov    0xc(%rax),%edx
  804573:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80457a:	00 00 00 
  80457d:	89 10                	mov    %edx,(%rax)
  80457f:	be 00 00 00 00       	mov    $0x0,%esi
  804584:	bf 05 00 00 00       	mov    $0x5,%edi
  804589:	48 b8 d8 41 80 00 00 	movabs $0x8041d8,%rax
  804590:	00 00 00 
  804593:	ff d0                	callq  *%rax
  804595:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804598:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80459c:	79 05                	jns    8045a3 <devfile_stat+0x47>
  80459e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045a1:	eb 56                	jmp    8045f9 <devfile_stat+0x9d>
  8045a3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8045a7:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  8045ae:	00 00 00 
  8045b1:	48 89 c7             	mov    %rax,%rdi
  8045b4:	48 b8 4a 22 80 00 00 	movabs $0x80224a,%rax
  8045bb:	00 00 00 
  8045be:	ff d0                	callq  *%rax
  8045c0:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8045c7:	00 00 00 
  8045ca:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  8045d0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8045d4:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8045da:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8045e1:	00 00 00 
  8045e4:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  8045ea:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8045ee:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  8045f4:	b8 00 00 00 00       	mov    $0x0,%eax
  8045f9:	c9                   	leaveq 
  8045fa:	c3                   	retq   

00000000008045fb <devfile_trunc>:
  8045fb:	55                   	push   %rbp
  8045fc:	48 89 e5             	mov    %rsp,%rbp
  8045ff:	48 83 ec 10          	sub    $0x10,%rsp
  804603:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804607:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80460a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80460e:	8b 50 0c             	mov    0xc(%rax),%edx
  804611:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804618:	00 00 00 
  80461b:	89 10                	mov    %edx,(%rax)
  80461d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804624:	00 00 00 
  804627:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80462a:	89 50 04             	mov    %edx,0x4(%rax)
  80462d:	be 00 00 00 00       	mov    $0x0,%esi
  804632:	bf 02 00 00 00       	mov    $0x2,%edi
  804637:	48 b8 d8 41 80 00 00 	movabs $0x8041d8,%rax
  80463e:	00 00 00 
  804641:	ff d0                	callq  *%rax
  804643:	c9                   	leaveq 
  804644:	c3                   	retq   

0000000000804645 <remove>:
  804645:	55                   	push   %rbp
  804646:	48 89 e5             	mov    %rsp,%rbp
  804649:	48 83 ec 10          	sub    $0x10,%rsp
  80464d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804651:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804655:	48 89 c7             	mov    %rax,%rdi
  804658:	48 b8 de 21 80 00 00 	movabs $0x8021de,%rax
  80465f:	00 00 00 
  804662:	ff d0                	callq  *%rax
  804664:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  804669:	7e 07                	jle    804672 <remove+0x2d>
  80466b:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  804670:	eb 33                	jmp    8046a5 <remove+0x60>
  804672:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804676:	48 89 c6             	mov    %rax,%rsi
  804679:	48 bf 00 b0 80 00 00 	movabs $0x80b000,%rdi
  804680:	00 00 00 
  804683:	48 b8 4a 22 80 00 00 	movabs $0x80224a,%rax
  80468a:	00 00 00 
  80468d:	ff d0                	callq  *%rax
  80468f:	be 00 00 00 00       	mov    $0x0,%esi
  804694:	bf 07 00 00 00       	mov    $0x7,%edi
  804699:	48 b8 d8 41 80 00 00 	movabs $0x8041d8,%rax
  8046a0:	00 00 00 
  8046a3:	ff d0                	callq  *%rax
  8046a5:	c9                   	leaveq 
  8046a6:	c3                   	retq   

00000000008046a7 <sync>:
  8046a7:	55                   	push   %rbp
  8046a8:	48 89 e5             	mov    %rsp,%rbp
  8046ab:	be 00 00 00 00       	mov    $0x0,%esi
  8046b0:	bf 08 00 00 00       	mov    $0x8,%edi
  8046b5:	48 b8 d8 41 80 00 00 	movabs $0x8041d8,%rax
  8046bc:	00 00 00 
  8046bf:	ff d0                	callq  *%rax
  8046c1:	5d                   	pop    %rbp
  8046c2:	c3                   	retq   

00000000008046c3 <copy>:
  8046c3:	55                   	push   %rbp
  8046c4:	48 89 e5             	mov    %rsp,%rbp
  8046c7:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  8046ce:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  8046d5:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  8046dc:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  8046e3:	be 00 00 00 00       	mov    $0x0,%esi
  8046e8:	48 89 c7             	mov    %rax,%rdi
  8046eb:	48 b8 61 42 80 00 00 	movabs $0x804261,%rax
  8046f2:	00 00 00 
  8046f5:	ff d0                	callq  *%rax
  8046f7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046fa:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046fe:	79 28                	jns    804728 <copy+0x65>
  804700:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804703:	89 c6                	mov    %eax,%esi
  804705:	48 bf e4 72 80 00 00 	movabs $0x8072e4,%rdi
  80470c:	00 00 00 
  80470f:	b8 00 00 00 00       	mov    $0x0,%eax
  804714:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  80471b:	00 00 00 
  80471e:	ff d2                	callq  *%rdx
  804720:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804723:	e9 76 01 00 00       	jmpq   80489e <copy+0x1db>
  804728:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  80472f:	be 01 01 00 00       	mov    $0x101,%esi
  804734:	48 89 c7             	mov    %rax,%rdi
  804737:	48 b8 61 42 80 00 00 	movabs $0x804261,%rax
  80473e:	00 00 00 
  804741:	ff d0                	callq  *%rax
  804743:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804746:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80474a:	0f 89 ad 00 00 00    	jns    8047fd <copy+0x13a>
  804750:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804753:	89 c6                	mov    %eax,%esi
  804755:	48 bf fa 72 80 00 00 	movabs $0x8072fa,%rdi
  80475c:	00 00 00 
  80475f:	b8 00 00 00 00       	mov    $0x0,%eax
  804764:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  80476b:	00 00 00 
  80476e:	ff d2                	callq  *%rdx
  804770:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804773:	89 c7                	mov    %eax,%edi
  804775:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  80477c:	00 00 00 
  80477f:	ff d0                	callq  *%rax
  804781:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804784:	e9 15 01 00 00       	jmpq   80489e <copy+0x1db>
  804789:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80478c:	48 63 d0             	movslq %eax,%rdx
  80478f:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  804796:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804799:	48 89 ce             	mov    %rcx,%rsi
  80479c:	89 c7                	mov    %eax,%edi
  80479e:	48 b8 d3 3e 80 00 00 	movabs $0x803ed3,%rax
  8047a5:	00 00 00 
  8047a8:	ff d0                	callq  *%rax
  8047aa:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8047ad:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8047b1:	79 4a                	jns    8047fd <copy+0x13a>
  8047b3:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8047b6:	89 c6                	mov    %eax,%esi
  8047b8:	48 bf 14 73 80 00 00 	movabs $0x807314,%rdi
  8047bf:	00 00 00 
  8047c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8047c7:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  8047ce:	00 00 00 
  8047d1:	ff d2                	callq  *%rdx
  8047d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047d6:	89 c7                	mov    %eax,%edi
  8047d8:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  8047df:	00 00 00 
  8047e2:	ff d0                	callq  *%rax
  8047e4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8047e7:	89 c7                	mov    %eax,%edi
  8047e9:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  8047f0:	00 00 00 
  8047f3:	ff d0                	callq  *%rax
  8047f5:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8047f8:	e9 a1 00 00 00       	jmpq   80489e <copy+0x1db>
  8047fd:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  804804:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804807:	ba 00 02 00 00       	mov    $0x200,%edx
  80480c:	48 89 ce             	mov    %rcx,%rsi
  80480f:	89 c7                	mov    %eax,%edi
  804811:	48 b8 88 3d 80 00 00 	movabs $0x803d88,%rax
  804818:	00 00 00 
  80481b:	ff d0                	callq  *%rax
  80481d:	89 45 f4             	mov    %eax,-0xc(%rbp)
  804820:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  804824:	0f 8f 5f ff ff ff    	jg     804789 <copy+0xc6>
  80482a:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80482e:	79 47                	jns    804877 <copy+0x1b4>
  804830:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804833:	89 c6                	mov    %eax,%esi
  804835:	48 bf 27 73 80 00 00 	movabs $0x807327,%rdi
  80483c:	00 00 00 
  80483f:	b8 00 00 00 00       	mov    $0x0,%eax
  804844:	48 ba 5c 15 80 00 00 	movabs $0x80155c,%rdx
  80484b:	00 00 00 
  80484e:	ff d2                	callq  *%rdx
  804850:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804853:	89 c7                	mov    %eax,%edi
  804855:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  80485c:	00 00 00 
  80485f:	ff d0                	callq  *%rax
  804861:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804864:	89 c7                	mov    %eax,%edi
  804866:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  80486d:	00 00 00 
  804870:	ff d0                	callq  *%rax
  804872:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804875:	eb 27                	jmp    80489e <copy+0x1db>
  804877:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80487a:	89 c7                	mov    %eax,%edi
  80487c:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  804883:	00 00 00 
  804886:	ff d0                	callq  *%rax
  804888:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80488b:	89 c7                	mov    %eax,%edi
  80488d:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  804894:	00 00 00 
  804897:	ff d0                	callq  *%rax
  804899:	b8 00 00 00 00       	mov    $0x0,%eax
  80489e:	c9                   	leaveq 
  80489f:	c3                   	retq   

00000000008048a0 <writebuf>:
  8048a0:	55                   	push   %rbp
  8048a1:	48 89 e5             	mov    %rsp,%rbp
  8048a4:	48 83 ec 20          	sub    $0x20,%rsp
  8048a8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8048ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048b0:	8b 40 0c             	mov    0xc(%rax),%eax
  8048b3:	85 c0                	test   %eax,%eax
  8048b5:	7e 67                	jle    80491e <writebuf+0x7e>
  8048b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048bb:	8b 40 04             	mov    0x4(%rax),%eax
  8048be:	48 63 d0             	movslq %eax,%rdx
  8048c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048c5:	48 8d 48 10          	lea    0x10(%rax),%rcx
  8048c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048cd:	8b 00                	mov    (%rax),%eax
  8048cf:	48 89 ce             	mov    %rcx,%rsi
  8048d2:	89 c7                	mov    %eax,%edi
  8048d4:	48 b8 d3 3e 80 00 00 	movabs $0x803ed3,%rax
  8048db:	00 00 00 
  8048de:	ff d0                	callq  *%rax
  8048e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8048e3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048e7:	7e 13                	jle    8048fc <writebuf+0x5c>
  8048e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048ed:	8b 50 08             	mov    0x8(%rax),%edx
  8048f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048f3:	01 c2                	add    %eax,%edx
  8048f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048f9:	89 50 08             	mov    %edx,0x8(%rax)
  8048fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804900:	8b 40 04             	mov    0x4(%rax),%eax
  804903:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  804906:	74 16                	je     80491e <writebuf+0x7e>
  804908:	b8 00 00 00 00       	mov    $0x0,%eax
  80490d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804911:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  804915:	89 c2                	mov    %eax,%edx
  804917:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80491b:	89 50 0c             	mov    %edx,0xc(%rax)
  80491e:	90                   	nop
  80491f:	c9                   	leaveq 
  804920:	c3                   	retq   

0000000000804921 <putch>:
  804921:	55                   	push   %rbp
  804922:	48 89 e5             	mov    %rsp,%rbp
  804925:	48 83 ec 20          	sub    $0x20,%rsp
  804929:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80492c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804930:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804934:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804938:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80493c:	8b 40 04             	mov    0x4(%rax),%eax
  80493f:	8d 48 01             	lea    0x1(%rax),%ecx
  804942:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804946:	89 4a 04             	mov    %ecx,0x4(%rdx)
  804949:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80494c:	89 d1                	mov    %edx,%ecx
  80494e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804952:	48 98                	cltq   
  804954:	88 4c 02 10          	mov    %cl,0x10(%rdx,%rax,1)
  804958:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80495c:	8b 40 04             	mov    0x4(%rax),%eax
  80495f:	3d 00 01 00 00       	cmp    $0x100,%eax
  804964:	75 1e                	jne    804984 <putch+0x63>
  804966:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80496a:	48 89 c7             	mov    %rax,%rdi
  80496d:	48 b8 a0 48 80 00 00 	movabs $0x8048a0,%rax
  804974:	00 00 00 
  804977:	ff d0                	callq  *%rax
  804979:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80497d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  804984:	90                   	nop
  804985:	c9                   	leaveq 
  804986:	c3                   	retq   

0000000000804987 <vfprintf>:
  804987:	55                   	push   %rbp
  804988:	48 89 e5             	mov    %rsp,%rbp
  80498b:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
  804992:	89 bd ec fe ff ff    	mov    %edi,-0x114(%rbp)
  804998:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  80499f:	48 89 95 d8 fe ff ff 	mov    %rdx,-0x128(%rbp)
  8049a6:	8b 85 ec fe ff ff    	mov    -0x114(%rbp),%eax
  8049ac:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%rbp)
  8049b2:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8049b9:	00 00 00 
  8049bc:	c7 85 f8 fe ff ff 00 	movl   $0x0,-0x108(%rbp)
  8049c3:	00 00 00 
  8049c6:	c7 85 fc fe ff ff 01 	movl   $0x1,-0x104(%rbp)
  8049cd:	00 00 00 
  8049d0:	48 8b 8d d8 fe ff ff 	mov    -0x128(%rbp),%rcx
  8049d7:	48 8b 95 e0 fe ff ff 	mov    -0x120(%rbp),%rdx
  8049de:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8049e5:	48 89 c6             	mov    %rax,%rsi
  8049e8:	48 bf 21 49 80 00 00 	movabs $0x804921,%rdi
  8049ef:	00 00 00 
  8049f2:	48 b8 fa 18 80 00 00 	movabs $0x8018fa,%rax
  8049f9:	00 00 00 
  8049fc:	ff d0                	callq  *%rax
  8049fe:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  804a04:	85 c0                	test   %eax,%eax
  804a06:	7e 16                	jle    804a1e <vfprintf+0x97>
  804a08:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  804a0f:	48 89 c7             	mov    %rax,%rdi
  804a12:	48 b8 a0 48 80 00 00 	movabs $0x8048a0,%rax
  804a19:	00 00 00 
  804a1c:	ff d0                	callq  *%rax
  804a1e:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  804a24:	85 c0                	test   %eax,%eax
  804a26:	74 08                	je     804a30 <vfprintf+0xa9>
  804a28:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  804a2e:	eb 06                	jmp    804a36 <vfprintf+0xaf>
  804a30:	8b 85 fc fe ff ff    	mov    -0x104(%rbp),%eax
  804a36:	c9                   	leaveq 
  804a37:	c3                   	retq   

0000000000804a38 <fprintf>:
  804a38:	55                   	push   %rbp
  804a39:	48 89 e5             	mov    %rsp,%rbp
  804a3c:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  804a43:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%rbp)
  804a49:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  804a50:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  804a57:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  804a5e:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  804a65:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  804a6c:	84 c0                	test   %al,%al
  804a6e:	74 20                	je     804a90 <fprintf+0x58>
  804a70:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  804a74:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  804a78:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  804a7c:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  804a80:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  804a84:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  804a88:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  804a8c:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  804a90:	c7 85 30 ff ff ff 10 	movl   $0x10,-0xd0(%rbp)
  804a97:	00 00 00 
  804a9a:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  804aa1:	00 00 00 
  804aa4:	48 8d 45 10          	lea    0x10(%rbp),%rax
  804aa8:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  804aaf:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  804ab6:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  804abd:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  804ac4:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
  804acb:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  804ad1:	48 89 ce             	mov    %rcx,%rsi
  804ad4:	89 c7                	mov    %eax,%edi
  804ad6:	48 b8 87 49 80 00 00 	movabs $0x804987,%rax
  804add:	00 00 00 
  804ae0:	ff d0                	callq  *%rax
  804ae2:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  804ae8:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  804aee:	c9                   	leaveq 
  804aef:	c3                   	retq   

0000000000804af0 <printf>:
  804af0:	55                   	push   %rbp
  804af1:	48 89 e5             	mov    %rsp,%rbp
  804af4:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  804afb:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  804b02:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  804b09:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  804b10:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  804b17:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  804b1e:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  804b25:	84 c0                	test   %al,%al
  804b27:	74 20                	je     804b49 <printf+0x59>
  804b29:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  804b2d:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  804b31:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  804b35:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  804b39:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  804b3d:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  804b41:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  804b45:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  804b49:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  804b50:	00 00 00 
  804b53:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  804b5a:	00 00 00 
  804b5d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  804b61:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  804b68:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  804b6f:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  804b76:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  804b7d:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  804b84:	48 89 c6             	mov    %rax,%rsi
  804b87:	bf 01 00 00 00       	mov    $0x1,%edi
  804b8c:	48 b8 87 49 80 00 00 	movabs $0x804987,%rax
  804b93:	00 00 00 
  804b96:	ff d0                	callq  *%rax
  804b98:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  804b9e:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  804ba4:	c9                   	leaveq 
  804ba5:	c3                   	retq   

0000000000804ba6 <spawn>:
  804ba6:	55                   	push   %rbp
  804ba7:	48 89 e5             	mov    %rsp,%rbp
  804baa:	48 81 ec 00 03 00 00 	sub    $0x300,%rsp
  804bb1:	48 89 bd 08 fd ff ff 	mov    %rdi,-0x2f8(%rbp)
  804bb8:	48 89 b5 00 fd ff ff 	mov    %rsi,-0x300(%rbp)
  804bbf:	48 8b 85 08 fd ff ff 	mov    -0x2f8(%rbp),%rax
  804bc6:	be 00 00 00 00       	mov    $0x0,%esi
  804bcb:	48 89 c7             	mov    %rax,%rdi
  804bce:	48 b8 61 42 80 00 00 	movabs $0x804261,%rax
  804bd5:	00 00 00 
  804bd8:	ff d0                	callq  *%rax
  804bda:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804bdd:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  804be1:	79 08                	jns    804beb <spawn+0x45>
  804be3:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804be6:	e9 11 03 00 00       	jmpq   804efc <spawn+0x356>
  804beb:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804bee:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804bf1:	48 8d 85 d0 fd ff ff 	lea    -0x230(%rbp),%rax
  804bf8:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  804bfc:	48 8d 8d d0 fd ff ff 	lea    -0x230(%rbp),%rcx
  804c03:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  804c06:	ba 00 02 00 00       	mov    $0x200,%edx
  804c0b:	48 89 ce             	mov    %rcx,%rsi
  804c0e:	89 c7                	mov    %eax,%edi
  804c10:	48 b8 5d 3e 80 00 00 	movabs $0x803e5d,%rax
  804c17:	00 00 00 
  804c1a:	ff d0                	callq  *%rax
  804c1c:	3d 00 02 00 00       	cmp    $0x200,%eax
  804c21:	75 0d                	jne    804c30 <spawn+0x8a>
  804c23:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804c27:	8b 00                	mov    (%rax),%eax
  804c29:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  804c2e:	74 43                	je     804c73 <spawn+0xcd>
  804c30:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  804c33:	89 c7                	mov    %eax,%edi
  804c35:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  804c3c:	00 00 00 
  804c3f:	ff d0                	callq  *%rax
  804c41:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804c45:	8b 00                	mov    (%rax),%eax
  804c47:	ba 7f 45 4c 46       	mov    $0x464c457f,%edx
  804c4c:	89 c6                	mov    %eax,%esi
  804c4e:	48 bf 40 73 80 00 00 	movabs $0x807340,%rdi
  804c55:	00 00 00 
  804c58:	b8 00 00 00 00       	mov    $0x0,%eax
  804c5d:	48 b9 5c 15 80 00 00 	movabs $0x80155c,%rcx
  804c64:	00 00 00 
  804c67:	ff d1                	callq  *%rcx
  804c69:	b8 f1 ff ff ff       	mov    $0xfffffff1,%eax
  804c6e:	e9 89 02 00 00       	jmpq   804efc <spawn+0x356>
  804c73:	b8 07 00 00 00       	mov    $0x7,%eax
  804c78:	cd 30                	int    $0x30
  804c7a:	89 45 d0             	mov    %eax,-0x30(%rbp)
  804c7d:	8b 45 d0             	mov    -0x30(%rbp),%eax
  804c80:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804c83:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  804c87:	79 08                	jns    804c91 <spawn+0xeb>
  804c89:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804c8c:	e9 6b 02 00 00       	jmpq   804efc <spawn+0x356>
  804c91:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804c94:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  804c97:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804c9a:	25 ff 03 00 00       	and    $0x3ff,%eax
  804c9f:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804ca6:	00 00 00 
  804ca9:	48 98                	cltq   
  804cab:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804cb2:	48 01 c2             	add    %rax,%rdx
  804cb5:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  804cbc:	48 89 d6             	mov    %rdx,%rsi
  804cbf:	ba 18 00 00 00       	mov    $0x18,%edx
  804cc4:	48 89 c7             	mov    %rax,%rdi
  804cc7:	48 89 d1             	mov    %rdx,%rcx
  804cca:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  804ccd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804cd1:	48 8b 40 18          	mov    0x18(%rax),%rax
  804cd5:	48 89 85 a8 fd ff ff 	mov    %rax,-0x258(%rbp)
  804cdc:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  804ce3:	48 8d 90 b0 00 00 00 	lea    0xb0(%rax),%rdx
  804cea:	48 8b 8d 00 fd ff ff 	mov    -0x300(%rbp),%rcx
  804cf1:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804cf4:	48 89 ce             	mov    %rcx,%rsi
  804cf7:	89 c7                	mov    %eax,%edi
  804cf9:	48 b8 60 51 80 00 00 	movabs $0x805160,%rax
  804d00:	00 00 00 
  804d03:	ff d0                	callq  *%rax
  804d05:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804d08:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  804d0c:	79 08                	jns    804d16 <spawn+0x170>
  804d0e:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804d11:	e9 e6 01 00 00       	jmpq   804efc <spawn+0x356>
  804d16:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804d1a:	48 8b 40 20          	mov    0x20(%rax),%rax
  804d1e:	48 8d 95 d0 fd ff ff 	lea    -0x230(%rbp),%rdx
  804d25:	48 01 d0             	add    %rdx,%rax
  804d28:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804d2c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804d33:	e9 80 00 00 00       	jmpq   804db8 <spawn+0x212>
  804d38:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804d3c:	8b 00                	mov    (%rax),%eax
  804d3e:	83 f8 01             	cmp    $0x1,%eax
  804d41:	75 6b                	jne    804dae <spawn+0x208>
  804d43:	c7 45 ec 05 00 00 00 	movl   $0x5,-0x14(%rbp)
  804d4a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804d4e:	8b 40 04             	mov    0x4(%rax),%eax
  804d51:	83 e0 02             	and    $0x2,%eax
  804d54:	85 c0                	test   %eax,%eax
  804d56:	74 04                	je     804d5c <spawn+0x1b6>
  804d58:	83 4d ec 02          	orl    $0x2,-0x14(%rbp)
  804d5c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804d60:	48 8b 40 08          	mov    0x8(%rax),%rax
  804d64:	41 89 c1             	mov    %eax,%r9d
  804d67:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804d6b:	4c 8b 40 20          	mov    0x20(%rax),%r8
  804d6f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804d73:	48 8b 50 28          	mov    0x28(%rax),%rdx
  804d77:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804d7b:	48 8b 70 10          	mov    0x10(%rax),%rsi
  804d7f:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  804d82:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804d85:	48 83 ec 08          	sub    $0x8,%rsp
  804d89:	8b 7d ec             	mov    -0x14(%rbp),%edi
  804d8c:	57                   	push   %rdi
  804d8d:	89 c7                	mov    %eax,%edi
  804d8f:	48 b8 0c 54 80 00 00 	movabs $0x80540c,%rax
  804d96:	00 00 00 
  804d99:	ff d0                	callq  *%rax
  804d9b:	48 83 c4 10          	add    $0x10,%rsp
  804d9f:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804da2:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  804da6:	0f 88 2a 01 00 00    	js     804ed6 <spawn+0x330>
  804dac:	eb 01                	jmp    804daf <spawn+0x209>
  804dae:	90                   	nop
  804daf:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804db3:	48 83 45 f0 38       	addq   $0x38,-0x10(%rbp)
  804db8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804dbc:	0f b7 40 38          	movzwl 0x38(%rax),%eax
  804dc0:	0f b7 c0             	movzwl %ax,%eax
  804dc3:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  804dc6:	0f 8f 6c ff ff ff    	jg     804d38 <spawn+0x192>
  804dcc:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  804dcf:	89 c7                	mov    %eax,%edi
  804dd1:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  804dd8:	00 00 00 
  804ddb:	ff d0                	callq  *%rax
  804ddd:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
  804de4:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804de7:	89 c7                	mov    %eax,%edi
  804de9:	48 b8 f8 55 80 00 00 	movabs $0x8055f8,%rax
  804df0:	00 00 00 
  804df3:	ff d0                	callq  *%rax
  804df5:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804df8:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  804dfc:	79 30                	jns    804e2e <spawn+0x288>
  804dfe:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804e01:	89 c1                	mov    %eax,%ecx
  804e03:	48 ba 5a 73 80 00 00 	movabs $0x80735a,%rdx
  804e0a:	00 00 00 
  804e0d:	be 86 00 00 00       	mov    $0x86,%esi
  804e12:	48 bf 70 73 80 00 00 	movabs $0x807370,%rdi
  804e19:	00 00 00 
  804e1c:	b8 00 00 00 00       	mov    $0x0,%eax
  804e21:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  804e28:	00 00 00 
  804e2b:	41 ff d0             	callq  *%r8
  804e2e:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  804e35:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804e38:	48 89 d6             	mov    %rdx,%rsi
  804e3b:	89 c7                	mov    %eax,%edi
  804e3d:	48 b8 c5 2c 80 00 00 	movabs $0x802cc5,%rax
  804e44:	00 00 00 
  804e47:	ff d0                	callq  *%rax
  804e49:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804e4c:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  804e50:	79 30                	jns    804e82 <spawn+0x2dc>
  804e52:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804e55:	89 c1                	mov    %eax,%ecx
  804e57:	48 ba 7f 73 80 00 00 	movabs $0x80737f,%rdx
  804e5e:	00 00 00 
  804e61:	be 8a 00 00 00       	mov    $0x8a,%esi
  804e66:	48 bf 70 73 80 00 00 	movabs $0x807370,%rdi
  804e6d:	00 00 00 
  804e70:	b8 00 00 00 00       	mov    $0x0,%eax
  804e75:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  804e7c:	00 00 00 
  804e7f:	41 ff d0             	callq  *%r8
  804e82:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804e85:	be 02 00 00 00       	mov    $0x2,%esi
  804e8a:	89 c7                	mov    %eax,%edi
  804e8c:	48 b8 78 2c 80 00 00 	movabs $0x802c78,%rax
  804e93:	00 00 00 
  804e96:	ff d0                	callq  *%rax
  804e98:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804e9b:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  804e9f:	79 30                	jns    804ed1 <spawn+0x32b>
  804ea1:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804ea4:	89 c1                	mov    %eax,%ecx
  804ea6:	48 ba 99 73 80 00 00 	movabs $0x807399,%rdx
  804ead:	00 00 00 
  804eb0:	be 8d 00 00 00       	mov    $0x8d,%esi
  804eb5:	48 bf 70 73 80 00 00 	movabs $0x807370,%rdi
  804ebc:	00 00 00 
  804ebf:	b8 00 00 00 00       	mov    $0x0,%eax
  804ec4:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  804ecb:	00 00 00 
  804ece:	41 ff d0             	callq  *%r8
  804ed1:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804ed4:	eb 26                	jmp    804efc <spawn+0x356>
  804ed6:	90                   	nop
  804ed7:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  804eda:	89 c7                	mov    %eax,%edi
  804edc:	48 b8 bb 2a 80 00 00 	movabs $0x802abb,%rax
  804ee3:	00 00 00 
  804ee6:	ff d0                	callq  *%rax
  804ee8:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  804eeb:	89 c7                	mov    %eax,%edi
  804eed:	48 b8 65 3b 80 00 00 	movabs $0x803b65,%rax
  804ef4:	00 00 00 
  804ef7:	ff d0                	callq  *%rax
  804ef9:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804efc:	c9                   	leaveq 
  804efd:	c3                   	retq   

0000000000804efe <spawnl>:
  804efe:	55                   	push   %rbp
  804eff:	48 89 e5             	mov    %rsp,%rbp
  804f02:	41 55                	push   %r13
  804f04:	41 54                	push   %r12
  804f06:	53                   	push   %rbx
  804f07:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  804f0e:	48 89 bd f8 fe ff ff 	mov    %rdi,-0x108(%rbp)
  804f15:	48 89 b5 f0 fe ff ff 	mov    %rsi,-0x110(%rbp)
  804f1c:	48 89 95 40 ff ff ff 	mov    %rdx,-0xc0(%rbp)
  804f23:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
  804f2a:	4c 89 85 50 ff ff ff 	mov    %r8,-0xb0(%rbp)
  804f31:	4c 89 8d 58 ff ff ff 	mov    %r9,-0xa8(%rbp)
  804f38:	84 c0                	test   %al,%al
  804f3a:	74 26                	je     804f62 <spawnl+0x64>
  804f3c:	0f 29 85 60 ff ff ff 	movaps %xmm0,-0xa0(%rbp)
  804f43:	0f 29 8d 70 ff ff ff 	movaps %xmm1,-0x90(%rbp)
  804f4a:	0f 29 55 80          	movaps %xmm2,-0x80(%rbp)
  804f4e:	0f 29 5d 90          	movaps %xmm3,-0x70(%rbp)
  804f52:	0f 29 65 a0          	movaps %xmm4,-0x60(%rbp)
  804f56:	0f 29 6d b0          	movaps %xmm5,-0x50(%rbp)
  804f5a:	0f 29 75 c0          	movaps %xmm6,-0x40(%rbp)
  804f5e:	0f 29 7d d0          	movaps %xmm7,-0x30(%rbp)
  804f62:	c7 85 2c ff ff ff 00 	movl   $0x0,-0xd4(%rbp)
  804f69:	00 00 00 
  804f6c:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  804f73:	00 00 00 
  804f76:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  804f7d:	00 00 00 
  804f80:	48 8d 45 10          	lea    0x10(%rbp),%rax
  804f84:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  804f8b:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  804f92:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  804f99:	eb 07                	jmp    804fa2 <spawnl+0xa4>
  804f9b:	83 85 2c ff ff ff 01 	addl   $0x1,-0xd4(%rbp)
  804fa2:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  804fa8:	83 f8 30             	cmp    $0x30,%eax
  804fab:	73 23                	jae    804fd0 <spawnl+0xd2>
  804fad:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
  804fb4:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  804fba:	89 d2                	mov    %edx,%edx
  804fbc:	48 01 d0             	add    %rdx,%rax
  804fbf:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  804fc5:	83 c2 08             	add    $0x8,%edx
  804fc8:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  804fce:	eb 12                	jmp    804fe2 <spawnl+0xe4>
  804fd0:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  804fd7:	48 8d 50 08          	lea    0x8(%rax),%rdx
  804fdb:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  804fe2:	48 8b 00             	mov    (%rax),%rax
  804fe5:	48 85 c0             	test   %rax,%rax
  804fe8:	75 b1                	jne    804f9b <spawnl+0x9d>
  804fea:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  804ff0:	83 c0 02             	add    $0x2,%eax
  804ff3:	48 89 e2             	mov    %rsp,%rdx
  804ff6:	48 89 d3             	mov    %rdx,%rbx
  804ff9:	48 63 d0             	movslq %eax,%rdx
  804ffc:	48 83 ea 01          	sub    $0x1,%rdx
  805000:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
  805007:	48 63 d0             	movslq %eax,%rdx
  80500a:	49 89 d4             	mov    %rdx,%r12
  80500d:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  805013:	48 63 d0             	movslq %eax,%rdx
  805016:	49 89 d2             	mov    %rdx,%r10
  805019:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  80501f:	48 98                	cltq   
  805021:	48 c1 e0 03          	shl    $0x3,%rax
  805025:	48 8d 50 07          	lea    0x7(%rax),%rdx
  805029:	b8 10 00 00 00       	mov    $0x10,%eax
  80502e:	48 83 e8 01          	sub    $0x1,%rax
  805032:	48 01 d0             	add    %rdx,%rax
  805035:	be 10 00 00 00       	mov    $0x10,%esi
  80503a:	ba 00 00 00 00       	mov    $0x0,%edx
  80503f:	48 f7 f6             	div    %rsi
  805042:	48 6b c0 10          	imul   $0x10,%rax,%rax
  805046:	48 29 c4             	sub    %rax,%rsp
  805049:	48 89 e0             	mov    %rsp,%rax
  80504c:	48 83 c0 07          	add    $0x7,%rax
  805050:	48 c1 e8 03          	shr    $0x3,%rax
  805054:	48 c1 e0 03          	shl    $0x3,%rax
  805058:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
  80505f:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  805066:	48 8b 95 f0 fe ff ff 	mov    -0x110(%rbp),%rdx
  80506d:	48 89 10             	mov    %rdx,(%rax)
  805070:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  805076:	8d 50 01             	lea    0x1(%rax),%edx
  805079:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  805080:	48 63 d2             	movslq %edx,%rdx
  805083:	48 c7 04 d0 00 00 00 	movq   $0x0,(%rax,%rdx,8)
  80508a:	00 
  80508b:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  805092:	00 00 00 
  805095:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  80509c:	00 00 00 
  80509f:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8050a3:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  8050aa:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  8050b1:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  8050b8:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%rbp)
  8050bf:	00 00 00 
  8050c2:	eb 60                	jmp    805124 <spawnl+0x226>
  8050c4:	8b 85 28 ff ff ff    	mov    -0xd8(%rbp),%eax
  8050ca:	8d 48 01             	lea    0x1(%rax),%ecx
  8050cd:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  8050d3:	83 f8 30             	cmp    $0x30,%eax
  8050d6:	73 23                	jae    8050fb <spawnl+0x1fd>
  8050d8:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
  8050df:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8050e5:	89 d2                	mov    %edx,%edx
  8050e7:	48 01 d0             	add    %rdx,%rax
  8050ea:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8050f0:	83 c2 08             	add    $0x8,%edx
  8050f3:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  8050f9:	eb 12                	jmp    80510d <spawnl+0x20f>
  8050fb:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  805102:	48 8d 50 08          	lea    0x8(%rax),%rdx
  805106:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  80510d:	48 8b 10             	mov    (%rax),%rdx
  805110:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  805117:	89 c9                	mov    %ecx,%ecx
  805119:	48 89 14 c8          	mov    %rdx,(%rax,%rcx,8)
  80511d:	83 85 28 ff ff ff 01 	addl   $0x1,-0xd8(%rbp)
  805124:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  80512a:	39 85 28 ff ff ff    	cmp    %eax,-0xd8(%rbp)
  805130:	72 92                	jb     8050c4 <spawnl+0x1c6>
  805132:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  805139:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
  805140:	48 89 d6             	mov    %rdx,%rsi
  805143:	48 89 c7             	mov    %rax,%rdi
  805146:	48 b8 a6 4b 80 00 00 	movabs $0x804ba6,%rax
  80514d:	00 00 00 
  805150:	ff d0                	callq  *%rax
  805152:	48 89 dc             	mov    %rbx,%rsp
  805155:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
  805159:	5b                   	pop    %rbx
  80515a:	41 5c                	pop    %r12
  80515c:	41 5d                	pop    %r13
  80515e:	5d                   	pop    %rbp
  80515f:	c3                   	retq   

0000000000805160 <init_stack>:
  805160:	55                   	push   %rbp
  805161:	48 89 e5             	mov    %rsp,%rbp
  805164:	48 83 ec 50          	sub    $0x50,%rsp
  805168:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80516b:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  80516f:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  805173:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80517a:	00 
  80517b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  805182:	eb 33                	jmp    8051b7 <init_stack+0x57>
  805184:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805187:	48 98                	cltq   
  805189:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  805190:	00 
  805191:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  805195:	48 01 d0             	add    %rdx,%rax
  805198:	48 8b 00             	mov    (%rax),%rax
  80519b:	48 89 c7             	mov    %rax,%rdi
  80519e:	48 b8 de 21 80 00 00 	movabs $0x8021de,%rax
  8051a5:	00 00 00 
  8051a8:	ff d0                	callq  *%rax
  8051aa:	83 c0 01             	add    $0x1,%eax
  8051ad:	48 98                	cltq   
  8051af:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8051b3:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  8051b7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051ba:	48 98                	cltq   
  8051bc:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8051c3:	00 
  8051c4:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8051c8:	48 01 d0             	add    %rdx,%rax
  8051cb:	48 8b 00             	mov    (%rax),%rax
  8051ce:	48 85 c0             	test   %rax,%rax
  8051d1:	75 b1                	jne    805184 <init_stack+0x24>
  8051d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8051d7:	48 f7 d8             	neg    %rax
  8051da:	48 05 00 10 40 00    	add    $0x401000,%rax
  8051e0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8051e4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8051e8:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8051ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8051f0:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  8051f4:	48 89 c2             	mov    %rax,%rdx
  8051f7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051fa:	83 c0 01             	add    $0x1,%eax
  8051fd:	c1 e0 03             	shl    $0x3,%eax
  805200:	48 98                	cltq   
  805202:	48 f7 d8             	neg    %rax
  805205:	48 01 d0             	add    %rdx,%rax
  805208:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  80520c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805210:	48 83 e8 10          	sub    $0x10,%rax
  805214:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
  80521a:	77 0a                	ja     805226 <init_stack+0xc6>
  80521c:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
  805221:	e9 e4 01 00 00       	jmpq   80540a <init_stack+0x2aa>
  805226:	ba 07 00 00 00       	mov    $0x7,%edx
  80522b:	be 00 00 40 00       	mov    $0x400000,%esi
  805230:	bf 00 00 00 00       	mov    $0x0,%edi
  805235:	48 b8 7a 2b 80 00 00 	movabs $0x802b7a,%rax
  80523c:	00 00 00 
  80523f:	ff d0                	callq  *%rax
  805241:	89 45 ec             	mov    %eax,-0x14(%rbp)
  805244:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  805248:	79 08                	jns    805252 <init_stack+0xf2>
  80524a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80524d:	e9 b8 01 00 00       	jmpq   80540a <init_stack+0x2aa>
  805252:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  805259:	e9 8a 00 00 00       	jmpq   8052e8 <init_stack+0x188>
  80525e:	8b 45 f0             	mov    -0x10(%rbp),%eax
  805261:	48 98                	cltq   
  805263:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80526a:	00 
  80526b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80526f:	48 01 d0             	add    %rdx,%rax
  805272:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  805277:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80527b:	48 01 ca             	add    %rcx,%rdx
  80527e:	48 81 ea 00 00 40 00 	sub    $0x400000,%rdx
  805285:	48 89 10             	mov    %rdx,(%rax)
  805288:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80528b:	48 98                	cltq   
  80528d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  805294:	00 
  805295:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  805299:	48 01 d0             	add    %rdx,%rax
  80529c:	48 8b 10             	mov    (%rax),%rdx
  80529f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8052a3:	48 89 d6             	mov    %rdx,%rsi
  8052a6:	48 89 c7             	mov    %rax,%rdi
  8052a9:	48 b8 4a 22 80 00 00 	movabs $0x80224a,%rax
  8052b0:	00 00 00 
  8052b3:	ff d0                	callq  *%rax
  8052b5:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8052b8:	48 98                	cltq   
  8052ba:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8052c1:	00 
  8052c2:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8052c6:	48 01 d0             	add    %rdx,%rax
  8052c9:	48 8b 00             	mov    (%rax),%rax
  8052cc:	48 89 c7             	mov    %rax,%rdi
  8052cf:	48 b8 de 21 80 00 00 	movabs $0x8021de,%rax
  8052d6:	00 00 00 
  8052d9:	ff d0                	callq  *%rax
  8052db:	83 c0 01             	add    $0x1,%eax
  8052de:	48 98                	cltq   
  8052e0:	48 01 45 e0          	add    %rax,-0x20(%rbp)
  8052e4:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
  8052e8:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8052eb:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8052ee:	0f 8c 6a ff ff ff    	jl     80525e <init_stack+0xfe>
  8052f4:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8052f7:	48 98                	cltq   
  8052f9:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  805300:	00 
  805301:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805305:	48 01 d0             	add    %rdx,%rax
  805308:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80530f:	48 81 7d e0 00 10 40 	cmpq   $0x401000,-0x20(%rbp)
  805316:	00 
  805317:	74 35                	je     80534e <init_stack+0x1ee>
  805319:	48 b9 b0 73 80 00 00 	movabs $0x8073b0,%rcx
  805320:	00 00 00 
  805323:	48 ba d6 73 80 00 00 	movabs $0x8073d6,%rdx
  80532a:	00 00 00 
  80532d:	be f6 00 00 00       	mov    $0xf6,%esi
  805332:	48 bf 70 73 80 00 00 	movabs $0x807370,%rdi
  805339:	00 00 00 
  80533c:	b8 00 00 00 00       	mov    $0x0,%eax
  805341:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  805348:	00 00 00 
  80534b:	41 ff d0             	callq  *%r8
  80534e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805352:	48 83 e8 08          	sub    $0x8,%rax
  805356:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  80535b:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80535f:	48 01 ca             	add    %rcx,%rdx
  805362:	48 81 ea 00 00 40 00 	sub    $0x400000,%rdx
  805369:	48 89 10             	mov    %rdx,(%rax)
  80536c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805370:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  805374:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805377:	48 98                	cltq   
  805379:	48 89 02             	mov    %rax,(%rdx)
  80537c:	ba f0 cf 7f ef       	mov    $0xef7fcff0,%edx
  805381:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805385:	48 01 d0             	add    %rdx,%rax
  805388:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  80538e:	48 89 c2             	mov    %rax,%rdx
  805391:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  805395:	48 89 10             	mov    %rdx,(%rax)
  805398:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80539b:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  8053a1:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  8053a6:	89 c2                	mov    %eax,%edx
  8053a8:	be 00 00 40 00       	mov    $0x400000,%esi
  8053ad:	bf 00 00 00 00       	mov    $0x0,%edi
  8053b2:	48 b8 cc 2b 80 00 00 	movabs $0x802bcc,%rax
  8053b9:	00 00 00 
  8053bc:	ff d0                	callq  *%rax
  8053be:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8053c1:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8053c5:	78 26                	js     8053ed <init_stack+0x28d>
  8053c7:	be 00 00 40 00       	mov    $0x400000,%esi
  8053cc:	bf 00 00 00 00       	mov    $0x0,%edi
  8053d1:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  8053d8:	00 00 00 
  8053db:	ff d0                	callq  *%rax
  8053dd:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8053e0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8053e4:	78 0a                	js     8053f0 <init_stack+0x290>
  8053e6:	b8 00 00 00 00       	mov    $0x0,%eax
  8053eb:	eb 1d                	jmp    80540a <init_stack+0x2aa>
  8053ed:	90                   	nop
  8053ee:	eb 01                	jmp    8053f1 <init_stack+0x291>
  8053f0:	90                   	nop
  8053f1:	be 00 00 40 00       	mov    $0x400000,%esi
  8053f6:	bf 00 00 00 00       	mov    $0x0,%edi
  8053fb:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  805402:	00 00 00 
  805405:	ff d0                	callq  *%rax
  805407:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80540a:	c9                   	leaveq 
  80540b:	c3                   	retq   

000000000080540c <map_segment>:
  80540c:	55                   	push   %rbp
  80540d:	48 89 e5             	mov    %rsp,%rbp
  805410:	48 83 ec 50          	sub    $0x50,%rsp
  805414:	89 7d dc             	mov    %edi,-0x24(%rbp)
  805417:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80541b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80541f:	89 4d d8             	mov    %ecx,-0x28(%rbp)
  805422:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  805426:	44 89 4d bc          	mov    %r9d,-0x44(%rbp)
  80542a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80542e:	25 ff 0f 00 00       	and    $0xfff,%eax
  805433:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805436:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80543a:	74 21                	je     80545d <map_segment+0x51>
  80543c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80543f:	48 98                	cltq   
  805441:	48 29 45 d0          	sub    %rax,-0x30(%rbp)
  805445:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805448:	48 98                	cltq   
  80544a:	48 01 45 c8          	add    %rax,-0x38(%rbp)
  80544e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805451:	48 98                	cltq   
  805453:	48 01 45 c0          	add    %rax,-0x40(%rbp)
  805457:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80545a:	29 45 bc             	sub    %eax,-0x44(%rbp)
  80545d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  805464:	e9 79 01 00 00       	jmpq   8055e2 <map_segment+0x1d6>
  805469:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80546c:	48 98                	cltq   
  80546e:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
  805472:	72 3c                	jb     8054b0 <map_segment+0xa4>
  805474:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805477:	48 63 d0             	movslq %eax,%rdx
  80547a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80547e:	48 01 d0             	add    %rdx,%rax
  805481:	48 89 c1             	mov    %rax,%rcx
  805484:	8b 45 dc             	mov    -0x24(%rbp),%eax
  805487:	8b 55 10             	mov    0x10(%rbp),%edx
  80548a:	48 89 ce             	mov    %rcx,%rsi
  80548d:	89 c7                	mov    %eax,%edi
  80548f:	48 b8 7a 2b 80 00 00 	movabs $0x802b7a,%rax
  805496:	00 00 00 
  805499:	ff d0                	callq  *%rax
  80549b:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80549e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8054a2:	0f 89 33 01 00 00    	jns    8055db <map_segment+0x1cf>
  8054a8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8054ab:	e9 46 01 00 00       	jmpq   8055f6 <map_segment+0x1ea>
  8054b0:	ba 07 00 00 00       	mov    $0x7,%edx
  8054b5:	be 00 00 40 00       	mov    $0x400000,%esi
  8054ba:	bf 00 00 00 00       	mov    $0x0,%edi
  8054bf:	48 b8 7a 2b 80 00 00 	movabs $0x802b7a,%rax
  8054c6:	00 00 00 
  8054c9:	ff d0                	callq  *%rax
  8054cb:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8054ce:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8054d2:	79 08                	jns    8054dc <map_segment+0xd0>
  8054d4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8054d7:	e9 1a 01 00 00       	jmpq   8055f6 <map_segment+0x1ea>
  8054dc:	8b 55 bc             	mov    -0x44(%rbp),%edx
  8054df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8054e2:	01 c2                	add    %eax,%edx
  8054e4:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8054e7:	89 d6                	mov    %edx,%esi
  8054e9:	89 c7                	mov    %eax,%edi
  8054eb:	48 b8 a7 3f 80 00 00 	movabs $0x803fa7,%rax
  8054f2:	00 00 00 
  8054f5:	ff d0                	callq  *%rax
  8054f7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8054fa:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8054fe:	79 08                	jns    805508 <map_segment+0xfc>
  805500:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805503:	e9 ee 00 00 00       	jmpq   8055f6 <map_segment+0x1ea>
  805508:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  80550f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805512:	48 98                	cltq   
  805514:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  805518:	48 29 c2             	sub    %rax,%rdx
  80551b:	48 89 d0             	mov    %rdx,%rax
  80551e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  805522:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805525:	48 63 d0             	movslq %eax,%rdx
  805528:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80552c:	48 39 c2             	cmp    %rax,%rdx
  80552f:	48 0f 47 d0          	cmova  %rax,%rdx
  805533:	8b 45 d8             	mov    -0x28(%rbp),%eax
  805536:	be 00 00 40 00       	mov    $0x400000,%esi
  80553b:	89 c7                	mov    %eax,%edi
  80553d:	48 b8 5d 3e 80 00 00 	movabs $0x803e5d,%rax
  805544:	00 00 00 
  805547:	ff d0                	callq  *%rax
  805549:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80554c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  805550:	79 08                	jns    80555a <map_segment+0x14e>
  805552:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805555:	e9 9c 00 00 00       	jmpq   8055f6 <map_segment+0x1ea>
  80555a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80555d:	48 63 d0             	movslq %eax,%rdx
  805560:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805564:	48 01 d0             	add    %rdx,%rax
  805567:	48 89 c2             	mov    %rax,%rdx
  80556a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80556d:	44 8b 45 10          	mov    0x10(%rbp),%r8d
  805571:	48 89 d1             	mov    %rdx,%rcx
  805574:	89 c2                	mov    %eax,%edx
  805576:	be 00 00 40 00       	mov    $0x400000,%esi
  80557b:	bf 00 00 00 00       	mov    $0x0,%edi
  805580:	48 b8 cc 2b 80 00 00 	movabs $0x802bcc,%rax
  805587:	00 00 00 
  80558a:	ff d0                	callq  *%rax
  80558c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80558f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  805593:	79 30                	jns    8055c5 <map_segment+0x1b9>
  805595:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805598:	89 c1                	mov    %eax,%ecx
  80559a:	48 ba eb 73 80 00 00 	movabs $0x8073eb,%rdx
  8055a1:	00 00 00 
  8055a4:	be 29 01 00 00       	mov    $0x129,%esi
  8055a9:	48 bf 70 73 80 00 00 	movabs $0x807370,%rdi
  8055b0:	00 00 00 
  8055b3:	b8 00 00 00 00       	mov    $0x0,%eax
  8055b8:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  8055bf:	00 00 00 
  8055c2:	41 ff d0             	callq  *%r8
  8055c5:	be 00 00 40 00       	mov    $0x400000,%esi
  8055ca:	bf 00 00 00 00       	mov    $0x0,%edi
  8055cf:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  8055d6:	00 00 00 
  8055d9:	ff d0                	callq  *%rax
  8055db:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
  8055e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8055e5:	48 98                	cltq   
  8055e7:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8055eb:	0f 82 78 fe ff ff    	jb     805469 <map_segment+0x5d>
  8055f1:	b8 00 00 00 00       	mov    $0x0,%eax
  8055f6:	c9                   	leaveq 
  8055f7:	c3                   	retq   

00000000008055f8 <copy_shared_pages>:
  8055f8:	55                   	push   %rbp
  8055f9:	48 89 e5             	mov    %rsp,%rbp
  8055fc:	48 83 ec 30          	sub    $0x30,%rsp
  805600:	89 7d dc             	mov    %edi,-0x24(%rbp)
  805603:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80560a:	00 
  80560b:	e9 eb 00 00 00       	jmpq   8056fb <copy_shared_pages+0x103>
  805610:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805614:	48 c1 f8 12          	sar    $0x12,%rax
  805618:	48 89 c2             	mov    %rax,%rdx
  80561b:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  805622:	01 00 00 
  805625:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805629:	83 e0 01             	and    $0x1,%eax
  80562c:	48 85 c0             	test   %rax,%rax
  80562f:	74 21                	je     805652 <copy_shared_pages+0x5a>
  805631:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805635:	48 c1 f8 09          	sar    $0x9,%rax
  805639:	48 89 c2             	mov    %rax,%rdx
  80563c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  805643:	01 00 00 
  805646:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80564a:	83 e0 01             	and    $0x1,%eax
  80564d:	48 85 c0             	test   %rax,%rax
  805650:	75 0d                	jne    80565f <copy_shared_pages+0x67>
  805652:	48 81 45 f8 00 02 00 	addq   $0x200,-0x8(%rbp)
  805659:	00 
  80565a:	e9 9c 00 00 00       	jmpq   8056fb <copy_shared_pages+0x103>
  80565f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805663:	48 05 00 02 00 00    	add    $0x200,%rax
  805669:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80566d:	eb 7e                	jmp    8056ed <copy_shared_pages+0xf5>
  80566f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  805676:	01 00 00 
  805679:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80567d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805681:	25 01 04 00 00       	and    $0x401,%eax
  805686:	48 3d 01 04 00 00    	cmp    $0x401,%rax
  80568c:	75 5a                	jne    8056e8 <copy_shared_pages+0xf0>
  80568e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805692:	48 c1 e0 0c          	shl    $0xc,%rax
  805696:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80569a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8056a1:	01 00 00 
  8056a4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8056a8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8056ac:	25 07 0e 00 00       	and    $0xe07,%eax
  8056b1:	89 c6                	mov    %eax,%esi
  8056b3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8056b7:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8056ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8056be:	41 89 f0             	mov    %esi,%r8d
  8056c1:	48 89 c6             	mov    %rax,%rsi
  8056c4:	bf 00 00 00 00       	mov    $0x0,%edi
  8056c9:	48 b8 cc 2b 80 00 00 	movabs $0x802bcc,%rax
  8056d0:	00 00 00 
  8056d3:	ff d0                	callq  *%rax
  8056d5:	48 98                	cltq   
  8056d7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8056db:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8056e0:	79 06                	jns    8056e8 <copy_shared_pages+0xf0>
  8056e2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8056e6:	eb 28                	jmp    805710 <copy_shared_pages+0x118>
  8056e8:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8056ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8056f1:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8056f5:	0f 8c 74 ff ff ff    	jl     80566f <copy_shared_pages+0x77>
  8056fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8056ff:	48 3d ff 07 00 08    	cmp    $0x80007ff,%rax
  805705:	0f 86 05 ff ff ff    	jbe    805610 <copy_shared_pages+0x18>
  80570b:	b8 00 00 00 00       	mov    $0x0,%eax
  805710:	c9                   	leaveq 
  805711:	c3                   	retq   

0000000000805712 <fd2sockid>:
  805712:	55                   	push   %rbp
  805713:	48 89 e5             	mov    %rsp,%rbp
  805716:	48 83 ec 20          	sub    $0x20,%rsp
  80571a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80571d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  805721:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805724:	48 89 d6             	mov    %rdx,%rsi
  805727:	89 c7                	mov    %eax,%edi
  805729:	48 b8 53 39 80 00 00 	movabs $0x803953,%rax
  805730:	00 00 00 
  805733:	ff d0                	callq  *%rax
  805735:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805738:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80573c:	79 05                	jns    805743 <fd2sockid+0x31>
  80573e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805741:	eb 24                	jmp    805767 <fd2sockid+0x55>
  805743:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805747:	8b 10                	mov    (%rax),%edx
  805749:	48 b8 e0 90 80 00 00 	movabs $0x8090e0,%rax
  805750:	00 00 00 
  805753:	8b 00                	mov    (%rax),%eax
  805755:	39 c2                	cmp    %eax,%edx
  805757:	74 07                	je     805760 <fd2sockid+0x4e>
  805759:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80575e:	eb 07                	jmp    805767 <fd2sockid+0x55>
  805760:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805764:	8b 40 0c             	mov    0xc(%rax),%eax
  805767:	c9                   	leaveq 
  805768:	c3                   	retq   

0000000000805769 <alloc_sockfd>:
  805769:	55                   	push   %rbp
  80576a:	48 89 e5             	mov    %rsp,%rbp
  80576d:	48 83 ec 20          	sub    $0x20,%rsp
  805771:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805774:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  805778:	48 89 c7             	mov    %rax,%rdi
  80577b:	48 b8 bb 38 80 00 00 	movabs $0x8038bb,%rax
  805782:	00 00 00 
  805785:	ff d0                	callq  *%rax
  805787:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80578a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80578e:	78 26                	js     8057b6 <alloc_sockfd+0x4d>
  805790:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805794:	ba 07 04 00 00       	mov    $0x407,%edx
  805799:	48 89 c6             	mov    %rax,%rsi
  80579c:	bf 00 00 00 00       	mov    $0x0,%edi
  8057a1:	48 b8 7a 2b 80 00 00 	movabs $0x802b7a,%rax
  8057a8:	00 00 00 
  8057ab:	ff d0                	callq  *%rax
  8057ad:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8057b0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8057b4:	79 16                	jns    8057cc <alloc_sockfd+0x63>
  8057b6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8057b9:	89 c7                	mov    %eax,%edi
  8057bb:	48 b8 78 5c 80 00 00 	movabs $0x805c78,%rax
  8057c2:	00 00 00 
  8057c5:	ff d0                	callq  *%rax
  8057c7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8057ca:	eb 3a                	jmp    805806 <alloc_sockfd+0x9d>
  8057cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8057d0:	48 ba e0 90 80 00 00 	movabs $0x8090e0,%rdx
  8057d7:	00 00 00 
  8057da:	8b 12                	mov    (%rdx),%edx
  8057dc:	89 10                	mov    %edx,(%rax)
  8057de:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8057e2:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8057e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8057ed:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8057f0:	89 50 0c             	mov    %edx,0xc(%rax)
  8057f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8057f7:	48 89 c7             	mov    %rax,%rdi
  8057fa:	48 b8 6d 38 80 00 00 	movabs $0x80386d,%rax
  805801:	00 00 00 
  805804:	ff d0                	callq  *%rax
  805806:	c9                   	leaveq 
  805807:	c3                   	retq   

0000000000805808 <accept>:
  805808:	55                   	push   %rbp
  805809:	48 89 e5             	mov    %rsp,%rbp
  80580c:	48 83 ec 30          	sub    $0x30,%rsp
  805810:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805813:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805817:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80581b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80581e:	89 c7                	mov    %eax,%edi
  805820:	48 b8 12 57 80 00 00 	movabs $0x805712,%rax
  805827:	00 00 00 
  80582a:	ff d0                	callq  *%rax
  80582c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80582f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805833:	79 05                	jns    80583a <accept+0x32>
  805835:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805838:	eb 3b                	jmp    805875 <accept+0x6d>
  80583a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80583e:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  805842:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805845:	48 89 ce             	mov    %rcx,%rsi
  805848:	89 c7                	mov    %eax,%edi
  80584a:	48 b8 55 5b 80 00 00 	movabs $0x805b55,%rax
  805851:	00 00 00 
  805854:	ff d0                	callq  *%rax
  805856:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805859:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80585d:	79 05                	jns    805864 <accept+0x5c>
  80585f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805862:	eb 11                	jmp    805875 <accept+0x6d>
  805864:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805867:	89 c7                	mov    %eax,%edi
  805869:	48 b8 69 57 80 00 00 	movabs $0x805769,%rax
  805870:	00 00 00 
  805873:	ff d0                	callq  *%rax
  805875:	c9                   	leaveq 
  805876:	c3                   	retq   

0000000000805877 <bind>:
  805877:	55                   	push   %rbp
  805878:	48 89 e5             	mov    %rsp,%rbp
  80587b:	48 83 ec 20          	sub    $0x20,%rsp
  80587f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805882:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805886:	89 55 e8             	mov    %edx,-0x18(%rbp)
  805889:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80588c:	89 c7                	mov    %eax,%edi
  80588e:	48 b8 12 57 80 00 00 	movabs $0x805712,%rax
  805895:	00 00 00 
  805898:	ff d0                	callq  *%rax
  80589a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80589d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8058a1:	79 05                	jns    8058a8 <bind+0x31>
  8058a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8058a6:	eb 1b                	jmp    8058c3 <bind+0x4c>
  8058a8:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8058ab:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8058af:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8058b2:	48 89 ce             	mov    %rcx,%rsi
  8058b5:	89 c7                	mov    %eax,%edi
  8058b7:	48 b8 d4 5b 80 00 00 	movabs $0x805bd4,%rax
  8058be:	00 00 00 
  8058c1:	ff d0                	callq  *%rax
  8058c3:	c9                   	leaveq 
  8058c4:	c3                   	retq   

00000000008058c5 <shutdown>:
  8058c5:	55                   	push   %rbp
  8058c6:	48 89 e5             	mov    %rsp,%rbp
  8058c9:	48 83 ec 20          	sub    $0x20,%rsp
  8058cd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8058d0:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8058d3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8058d6:	89 c7                	mov    %eax,%edi
  8058d8:	48 b8 12 57 80 00 00 	movabs $0x805712,%rax
  8058df:	00 00 00 
  8058e2:	ff d0                	callq  *%rax
  8058e4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8058e7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8058eb:	79 05                	jns    8058f2 <shutdown+0x2d>
  8058ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8058f0:	eb 16                	jmp    805908 <shutdown+0x43>
  8058f2:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8058f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8058f8:	89 d6                	mov    %edx,%esi
  8058fa:	89 c7                	mov    %eax,%edi
  8058fc:	48 b8 38 5c 80 00 00 	movabs $0x805c38,%rax
  805903:	00 00 00 
  805906:	ff d0                	callq  *%rax
  805908:	c9                   	leaveq 
  805909:	c3                   	retq   

000000000080590a <devsock_close>:
  80590a:	55                   	push   %rbp
  80590b:	48 89 e5             	mov    %rsp,%rbp
  80590e:	48 83 ec 10          	sub    $0x10,%rsp
  805912:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805916:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80591a:	48 89 c7             	mov    %rax,%rdi
  80591d:	48 b8 d6 68 80 00 00 	movabs $0x8068d6,%rax
  805924:	00 00 00 
  805927:	ff d0                	callq  *%rax
  805929:	83 f8 01             	cmp    $0x1,%eax
  80592c:	75 17                	jne    805945 <devsock_close+0x3b>
  80592e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805932:	8b 40 0c             	mov    0xc(%rax),%eax
  805935:	89 c7                	mov    %eax,%edi
  805937:	48 b8 78 5c 80 00 00 	movabs $0x805c78,%rax
  80593e:	00 00 00 
  805941:	ff d0                	callq  *%rax
  805943:	eb 05                	jmp    80594a <devsock_close+0x40>
  805945:	b8 00 00 00 00       	mov    $0x0,%eax
  80594a:	c9                   	leaveq 
  80594b:	c3                   	retq   

000000000080594c <connect>:
  80594c:	55                   	push   %rbp
  80594d:	48 89 e5             	mov    %rsp,%rbp
  805950:	48 83 ec 20          	sub    $0x20,%rsp
  805954:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805957:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80595b:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80595e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805961:	89 c7                	mov    %eax,%edi
  805963:	48 b8 12 57 80 00 00 	movabs $0x805712,%rax
  80596a:	00 00 00 
  80596d:	ff d0                	callq  *%rax
  80596f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805972:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805976:	79 05                	jns    80597d <connect+0x31>
  805978:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80597b:	eb 1b                	jmp    805998 <connect+0x4c>
  80597d:	8b 55 e8             	mov    -0x18(%rbp),%edx
  805980:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  805984:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805987:	48 89 ce             	mov    %rcx,%rsi
  80598a:	89 c7                	mov    %eax,%edi
  80598c:	48 b8 a5 5c 80 00 00 	movabs $0x805ca5,%rax
  805993:	00 00 00 
  805996:	ff d0                	callq  *%rax
  805998:	c9                   	leaveq 
  805999:	c3                   	retq   

000000000080599a <listen>:
  80599a:	55                   	push   %rbp
  80599b:	48 89 e5             	mov    %rsp,%rbp
  80599e:	48 83 ec 20          	sub    $0x20,%rsp
  8059a2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8059a5:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8059a8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8059ab:	89 c7                	mov    %eax,%edi
  8059ad:	48 b8 12 57 80 00 00 	movabs $0x805712,%rax
  8059b4:	00 00 00 
  8059b7:	ff d0                	callq  *%rax
  8059b9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8059bc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8059c0:	79 05                	jns    8059c7 <listen+0x2d>
  8059c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8059c5:	eb 16                	jmp    8059dd <listen+0x43>
  8059c7:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8059ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8059cd:	89 d6                	mov    %edx,%esi
  8059cf:	89 c7                	mov    %eax,%edi
  8059d1:	48 b8 09 5d 80 00 00 	movabs $0x805d09,%rax
  8059d8:	00 00 00 
  8059db:	ff d0                	callq  *%rax
  8059dd:	c9                   	leaveq 
  8059de:	c3                   	retq   

00000000008059df <devsock_read>:
  8059df:	55                   	push   %rbp
  8059e0:	48 89 e5             	mov    %rsp,%rbp
  8059e3:	48 83 ec 20          	sub    $0x20,%rsp
  8059e7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8059eb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8059ef:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8059f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8059f7:	89 c2                	mov    %eax,%edx
  8059f9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8059fd:	8b 40 0c             	mov    0xc(%rax),%eax
  805a00:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  805a04:	b9 00 00 00 00       	mov    $0x0,%ecx
  805a09:	89 c7                	mov    %eax,%edi
  805a0b:	48 b8 49 5d 80 00 00 	movabs $0x805d49,%rax
  805a12:	00 00 00 
  805a15:	ff d0                	callq  *%rax
  805a17:	c9                   	leaveq 
  805a18:	c3                   	retq   

0000000000805a19 <devsock_write>:
  805a19:	55                   	push   %rbp
  805a1a:	48 89 e5             	mov    %rsp,%rbp
  805a1d:	48 83 ec 20          	sub    $0x20,%rsp
  805a21:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805a25:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  805a29:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  805a2d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805a31:	89 c2                	mov    %eax,%edx
  805a33:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805a37:	8b 40 0c             	mov    0xc(%rax),%eax
  805a3a:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  805a3e:	b9 00 00 00 00       	mov    $0x0,%ecx
  805a43:	89 c7                	mov    %eax,%edi
  805a45:	48 b8 15 5e 80 00 00 	movabs $0x805e15,%rax
  805a4c:	00 00 00 
  805a4f:	ff d0                	callq  *%rax
  805a51:	c9                   	leaveq 
  805a52:	c3                   	retq   

0000000000805a53 <devsock_stat>:
  805a53:	55                   	push   %rbp
  805a54:	48 89 e5             	mov    %rsp,%rbp
  805a57:	48 83 ec 10          	sub    $0x10,%rsp
  805a5b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805a5f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  805a63:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805a67:	48 be 0d 74 80 00 00 	movabs $0x80740d,%rsi
  805a6e:	00 00 00 
  805a71:	48 89 c7             	mov    %rax,%rdi
  805a74:	48 b8 4a 22 80 00 00 	movabs $0x80224a,%rax
  805a7b:	00 00 00 
  805a7e:	ff d0                	callq  *%rax
  805a80:	b8 00 00 00 00       	mov    $0x0,%eax
  805a85:	c9                   	leaveq 
  805a86:	c3                   	retq   

0000000000805a87 <socket>:
  805a87:	55                   	push   %rbp
  805a88:	48 89 e5             	mov    %rsp,%rbp
  805a8b:	48 83 ec 20          	sub    $0x20,%rsp
  805a8f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805a92:	89 75 e8             	mov    %esi,-0x18(%rbp)
  805a95:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  805a98:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  805a9b:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  805a9e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805aa1:	89 ce                	mov    %ecx,%esi
  805aa3:	89 c7                	mov    %eax,%edi
  805aa5:	48 b8 cd 5e 80 00 00 	movabs $0x805ecd,%rax
  805aac:	00 00 00 
  805aaf:	ff d0                	callq  *%rax
  805ab1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805ab4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805ab8:	79 05                	jns    805abf <socket+0x38>
  805aba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805abd:	eb 11                	jmp    805ad0 <socket+0x49>
  805abf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805ac2:	89 c7                	mov    %eax,%edi
  805ac4:	48 b8 69 57 80 00 00 	movabs $0x805769,%rax
  805acb:	00 00 00 
  805ace:	ff d0                	callq  *%rax
  805ad0:	c9                   	leaveq 
  805ad1:	c3                   	retq   

0000000000805ad2 <nsipc>:
  805ad2:	55                   	push   %rbp
  805ad3:	48 89 e5             	mov    %rsp,%rbp
  805ad6:	48 83 ec 10          	sub    $0x10,%rsp
  805ada:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805add:	48 b8 24 a4 80 00 00 	movabs $0x80a424,%rax
  805ae4:	00 00 00 
  805ae7:	8b 00                	mov    (%rax),%eax
  805ae9:	85 c0                	test   %eax,%eax
  805aeb:	75 1f                	jne    805b0c <nsipc+0x3a>
  805aed:	bf 02 00 00 00       	mov    $0x2,%edi
  805af2:	48 b8 65 68 80 00 00 	movabs $0x806865,%rax
  805af9:	00 00 00 
  805afc:	ff d0                	callq  *%rax
  805afe:	89 c2                	mov    %eax,%edx
  805b00:	48 b8 24 a4 80 00 00 	movabs $0x80a424,%rax
  805b07:	00 00 00 
  805b0a:	89 10                	mov    %edx,(%rax)
  805b0c:	48 b8 24 a4 80 00 00 	movabs $0x80a424,%rax
  805b13:	00 00 00 
  805b16:	8b 00                	mov    (%rax),%eax
  805b18:	8b 75 fc             	mov    -0x4(%rbp),%esi
  805b1b:	b9 07 00 00 00       	mov    $0x7,%ecx
  805b20:	48 ba 00 d0 80 00 00 	movabs $0x80d000,%rdx
  805b27:	00 00 00 
  805b2a:	89 c7                	mov    %eax,%edi
  805b2c:	48 b8 5b 67 80 00 00 	movabs $0x80675b,%rax
  805b33:	00 00 00 
  805b36:	ff d0                	callq  *%rax
  805b38:	ba 00 00 00 00       	mov    $0x0,%edx
  805b3d:	be 00 00 00 00       	mov    $0x0,%esi
  805b42:	bf 00 00 00 00       	mov    $0x0,%edi
  805b47:	48 b8 9a 66 80 00 00 	movabs $0x80669a,%rax
  805b4e:	00 00 00 
  805b51:	ff d0                	callq  *%rax
  805b53:	c9                   	leaveq 
  805b54:	c3                   	retq   

0000000000805b55 <nsipc_accept>:
  805b55:	55                   	push   %rbp
  805b56:	48 89 e5             	mov    %rsp,%rbp
  805b59:	48 83 ec 30          	sub    $0x30,%rsp
  805b5d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805b60:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805b64:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  805b68:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805b6f:	00 00 00 
  805b72:	8b 55 ec             	mov    -0x14(%rbp),%edx
  805b75:	89 10                	mov    %edx,(%rax)
  805b77:	bf 01 00 00 00       	mov    $0x1,%edi
  805b7c:	48 b8 d2 5a 80 00 00 	movabs $0x805ad2,%rax
  805b83:	00 00 00 
  805b86:	ff d0                	callq  *%rax
  805b88:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805b8b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805b8f:	78 3e                	js     805bcf <nsipc_accept+0x7a>
  805b91:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805b98:	00 00 00 
  805b9b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  805b9f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805ba3:	8b 40 10             	mov    0x10(%rax),%eax
  805ba6:	89 c2                	mov    %eax,%edx
  805ba8:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  805bac:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805bb0:	48 89 ce             	mov    %rcx,%rsi
  805bb3:	48 89 c7             	mov    %rax,%rdi
  805bb6:	48 b8 6f 25 80 00 00 	movabs $0x80256f,%rax
  805bbd:	00 00 00 
  805bc0:	ff d0                	callq  *%rax
  805bc2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805bc6:	8b 50 10             	mov    0x10(%rax),%edx
  805bc9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805bcd:	89 10                	mov    %edx,(%rax)
  805bcf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805bd2:	c9                   	leaveq 
  805bd3:	c3                   	retq   

0000000000805bd4 <nsipc_bind>:
  805bd4:	55                   	push   %rbp
  805bd5:	48 89 e5             	mov    %rsp,%rbp
  805bd8:	48 83 ec 10          	sub    $0x10,%rsp
  805bdc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805bdf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  805be3:	89 55 f8             	mov    %edx,-0x8(%rbp)
  805be6:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805bed:	00 00 00 
  805bf0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805bf3:	89 10                	mov    %edx,(%rax)
  805bf5:	8b 55 f8             	mov    -0x8(%rbp),%edx
  805bf8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805bfc:	48 89 c6             	mov    %rax,%rsi
  805bff:	48 bf 04 d0 80 00 00 	movabs $0x80d004,%rdi
  805c06:	00 00 00 
  805c09:	48 b8 6f 25 80 00 00 	movabs $0x80256f,%rax
  805c10:	00 00 00 
  805c13:	ff d0                	callq  *%rax
  805c15:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805c1c:	00 00 00 
  805c1f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  805c22:	89 50 14             	mov    %edx,0x14(%rax)
  805c25:	bf 02 00 00 00       	mov    $0x2,%edi
  805c2a:	48 b8 d2 5a 80 00 00 	movabs $0x805ad2,%rax
  805c31:	00 00 00 
  805c34:	ff d0                	callq  *%rax
  805c36:	c9                   	leaveq 
  805c37:	c3                   	retq   

0000000000805c38 <nsipc_shutdown>:
  805c38:	55                   	push   %rbp
  805c39:	48 89 e5             	mov    %rsp,%rbp
  805c3c:	48 83 ec 10          	sub    $0x10,%rsp
  805c40:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805c43:	89 75 f8             	mov    %esi,-0x8(%rbp)
  805c46:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805c4d:	00 00 00 
  805c50:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805c53:	89 10                	mov    %edx,(%rax)
  805c55:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805c5c:	00 00 00 
  805c5f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  805c62:	89 50 04             	mov    %edx,0x4(%rax)
  805c65:	bf 03 00 00 00       	mov    $0x3,%edi
  805c6a:	48 b8 d2 5a 80 00 00 	movabs $0x805ad2,%rax
  805c71:	00 00 00 
  805c74:	ff d0                	callq  *%rax
  805c76:	c9                   	leaveq 
  805c77:	c3                   	retq   

0000000000805c78 <nsipc_close>:
  805c78:	55                   	push   %rbp
  805c79:	48 89 e5             	mov    %rsp,%rbp
  805c7c:	48 83 ec 10          	sub    $0x10,%rsp
  805c80:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805c83:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805c8a:	00 00 00 
  805c8d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805c90:	89 10                	mov    %edx,(%rax)
  805c92:	bf 04 00 00 00       	mov    $0x4,%edi
  805c97:	48 b8 d2 5a 80 00 00 	movabs $0x805ad2,%rax
  805c9e:	00 00 00 
  805ca1:	ff d0                	callq  *%rax
  805ca3:	c9                   	leaveq 
  805ca4:	c3                   	retq   

0000000000805ca5 <nsipc_connect>:
  805ca5:	55                   	push   %rbp
  805ca6:	48 89 e5             	mov    %rsp,%rbp
  805ca9:	48 83 ec 10          	sub    $0x10,%rsp
  805cad:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805cb0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  805cb4:	89 55 f8             	mov    %edx,-0x8(%rbp)
  805cb7:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805cbe:	00 00 00 
  805cc1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805cc4:	89 10                	mov    %edx,(%rax)
  805cc6:	8b 55 f8             	mov    -0x8(%rbp),%edx
  805cc9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805ccd:	48 89 c6             	mov    %rax,%rsi
  805cd0:	48 bf 04 d0 80 00 00 	movabs $0x80d004,%rdi
  805cd7:	00 00 00 
  805cda:	48 b8 6f 25 80 00 00 	movabs $0x80256f,%rax
  805ce1:	00 00 00 
  805ce4:	ff d0                	callq  *%rax
  805ce6:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805ced:	00 00 00 
  805cf0:	8b 55 f8             	mov    -0x8(%rbp),%edx
  805cf3:	89 50 14             	mov    %edx,0x14(%rax)
  805cf6:	bf 05 00 00 00       	mov    $0x5,%edi
  805cfb:	48 b8 d2 5a 80 00 00 	movabs $0x805ad2,%rax
  805d02:	00 00 00 
  805d05:	ff d0                	callq  *%rax
  805d07:	c9                   	leaveq 
  805d08:	c3                   	retq   

0000000000805d09 <nsipc_listen>:
  805d09:	55                   	push   %rbp
  805d0a:	48 89 e5             	mov    %rsp,%rbp
  805d0d:	48 83 ec 10          	sub    $0x10,%rsp
  805d11:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805d14:	89 75 f8             	mov    %esi,-0x8(%rbp)
  805d17:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805d1e:	00 00 00 
  805d21:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805d24:	89 10                	mov    %edx,(%rax)
  805d26:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805d2d:	00 00 00 
  805d30:	8b 55 f8             	mov    -0x8(%rbp),%edx
  805d33:	89 50 04             	mov    %edx,0x4(%rax)
  805d36:	bf 06 00 00 00       	mov    $0x6,%edi
  805d3b:	48 b8 d2 5a 80 00 00 	movabs $0x805ad2,%rax
  805d42:	00 00 00 
  805d45:	ff d0                	callq  *%rax
  805d47:	c9                   	leaveq 
  805d48:	c3                   	retq   

0000000000805d49 <nsipc_recv>:
  805d49:	55                   	push   %rbp
  805d4a:	48 89 e5             	mov    %rsp,%rbp
  805d4d:	48 83 ec 30          	sub    $0x30,%rsp
  805d51:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805d54:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805d58:	89 55 e8             	mov    %edx,-0x18(%rbp)
  805d5b:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  805d5e:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805d65:	00 00 00 
  805d68:	8b 55 ec             	mov    -0x14(%rbp),%edx
  805d6b:	89 10                	mov    %edx,(%rax)
  805d6d:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805d74:	00 00 00 
  805d77:	8b 55 e8             	mov    -0x18(%rbp),%edx
  805d7a:	89 50 04             	mov    %edx,0x4(%rax)
  805d7d:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805d84:	00 00 00 
  805d87:	8b 55 dc             	mov    -0x24(%rbp),%edx
  805d8a:	89 50 08             	mov    %edx,0x8(%rax)
  805d8d:	bf 07 00 00 00       	mov    $0x7,%edi
  805d92:	48 b8 d2 5a 80 00 00 	movabs $0x805ad2,%rax
  805d99:	00 00 00 
  805d9c:	ff d0                	callq  *%rax
  805d9e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805da1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805da5:	78 69                	js     805e10 <nsipc_recv+0xc7>
  805da7:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  805dae:	7f 08                	jg     805db8 <nsipc_recv+0x6f>
  805db0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805db3:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  805db6:	7e 35                	jle    805ded <nsipc_recv+0xa4>
  805db8:	48 b9 14 74 80 00 00 	movabs $0x807414,%rcx
  805dbf:	00 00 00 
  805dc2:	48 ba 29 74 80 00 00 	movabs $0x807429,%rdx
  805dc9:	00 00 00 
  805dcc:	be 62 00 00 00       	mov    $0x62,%esi
  805dd1:	48 bf 3e 74 80 00 00 	movabs $0x80743e,%rdi
  805dd8:	00 00 00 
  805ddb:	b8 00 00 00 00       	mov    $0x0,%eax
  805de0:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  805de7:	00 00 00 
  805dea:	41 ff d0             	callq  *%r8
  805ded:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805df0:	48 63 d0             	movslq %eax,%rdx
  805df3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805df7:	48 be 00 d0 80 00 00 	movabs $0x80d000,%rsi
  805dfe:	00 00 00 
  805e01:	48 89 c7             	mov    %rax,%rdi
  805e04:	48 b8 6f 25 80 00 00 	movabs $0x80256f,%rax
  805e0b:	00 00 00 
  805e0e:	ff d0                	callq  *%rax
  805e10:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805e13:	c9                   	leaveq 
  805e14:	c3                   	retq   

0000000000805e15 <nsipc_send>:
  805e15:	55                   	push   %rbp
  805e16:	48 89 e5             	mov    %rsp,%rbp
  805e19:	48 83 ec 20          	sub    $0x20,%rsp
  805e1d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805e20:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  805e24:	89 55 f8             	mov    %edx,-0x8(%rbp)
  805e27:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  805e2a:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805e31:	00 00 00 
  805e34:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805e37:	89 10                	mov    %edx,(%rax)
  805e39:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  805e40:	7e 35                	jle    805e77 <nsipc_send+0x62>
  805e42:	48 b9 4d 74 80 00 00 	movabs $0x80744d,%rcx
  805e49:	00 00 00 
  805e4c:	48 ba 29 74 80 00 00 	movabs $0x807429,%rdx
  805e53:	00 00 00 
  805e56:	be 6d 00 00 00       	mov    $0x6d,%esi
  805e5b:	48 bf 3e 74 80 00 00 	movabs $0x80743e,%rdi
  805e62:	00 00 00 
  805e65:	b8 00 00 00 00       	mov    $0x0,%eax
  805e6a:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  805e71:	00 00 00 
  805e74:	41 ff d0             	callq  *%r8
  805e77:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805e7a:	48 63 d0             	movslq %eax,%rdx
  805e7d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805e81:	48 89 c6             	mov    %rax,%rsi
  805e84:	48 bf 0c d0 80 00 00 	movabs $0x80d00c,%rdi
  805e8b:	00 00 00 
  805e8e:	48 b8 6f 25 80 00 00 	movabs $0x80256f,%rax
  805e95:	00 00 00 
  805e98:	ff d0                	callq  *%rax
  805e9a:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805ea1:	00 00 00 
  805ea4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  805ea7:	89 50 04             	mov    %edx,0x4(%rax)
  805eaa:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805eb1:	00 00 00 
  805eb4:	8b 55 ec             	mov    -0x14(%rbp),%edx
  805eb7:	89 50 08             	mov    %edx,0x8(%rax)
  805eba:	bf 08 00 00 00       	mov    $0x8,%edi
  805ebf:	48 b8 d2 5a 80 00 00 	movabs $0x805ad2,%rax
  805ec6:	00 00 00 
  805ec9:	ff d0                	callq  *%rax
  805ecb:	c9                   	leaveq 
  805ecc:	c3                   	retq   

0000000000805ecd <nsipc_socket>:
  805ecd:	55                   	push   %rbp
  805ece:	48 89 e5             	mov    %rsp,%rbp
  805ed1:	48 83 ec 10          	sub    $0x10,%rsp
  805ed5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805ed8:	89 75 f8             	mov    %esi,-0x8(%rbp)
  805edb:	89 55 f4             	mov    %edx,-0xc(%rbp)
  805ede:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805ee5:	00 00 00 
  805ee8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805eeb:	89 10                	mov    %edx,(%rax)
  805eed:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805ef4:	00 00 00 
  805ef7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  805efa:	89 50 04             	mov    %edx,0x4(%rax)
  805efd:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805f04:	00 00 00 
  805f07:	8b 55 f4             	mov    -0xc(%rbp),%edx
  805f0a:	89 50 08             	mov    %edx,0x8(%rax)
  805f0d:	bf 09 00 00 00       	mov    $0x9,%edi
  805f12:	48 b8 d2 5a 80 00 00 	movabs $0x805ad2,%rax
  805f19:	00 00 00 
  805f1c:	ff d0                	callq  *%rax
  805f1e:	c9                   	leaveq 
  805f1f:	c3                   	retq   

0000000000805f20 <pipe>:
  805f20:	55                   	push   %rbp
  805f21:	48 89 e5             	mov    %rsp,%rbp
  805f24:	53                   	push   %rbx
  805f25:	48 83 ec 38          	sub    $0x38,%rsp
  805f29:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  805f2d:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  805f31:	48 89 c7             	mov    %rax,%rdi
  805f34:	48 b8 bb 38 80 00 00 	movabs $0x8038bb,%rax
  805f3b:	00 00 00 
  805f3e:	ff d0                	callq  *%rax
  805f40:	89 45 ec             	mov    %eax,-0x14(%rbp)
  805f43:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  805f47:	0f 88 bf 01 00 00    	js     80610c <pipe+0x1ec>
  805f4d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805f51:	ba 07 04 00 00       	mov    $0x407,%edx
  805f56:	48 89 c6             	mov    %rax,%rsi
  805f59:	bf 00 00 00 00       	mov    $0x0,%edi
  805f5e:	48 b8 7a 2b 80 00 00 	movabs $0x802b7a,%rax
  805f65:	00 00 00 
  805f68:	ff d0                	callq  *%rax
  805f6a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  805f6d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  805f71:	0f 88 95 01 00 00    	js     80610c <pipe+0x1ec>
  805f77:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  805f7b:	48 89 c7             	mov    %rax,%rdi
  805f7e:	48 b8 bb 38 80 00 00 	movabs $0x8038bb,%rax
  805f85:	00 00 00 
  805f88:	ff d0                	callq  *%rax
  805f8a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  805f8d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  805f91:	0f 88 5d 01 00 00    	js     8060f4 <pipe+0x1d4>
  805f97:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805f9b:	ba 07 04 00 00       	mov    $0x407,%edx
  805fa0:	48 89 c6             	mov    %rax,%rsi
  805fa3:	bf 00 00 00 00       	mov    $0x0,%edi
  805fa8:	48 b8 7a 2b 80 00 00 	movabs $0x802b7a,%rax
  805faf:	00 00 00 
  805fb2:	ff d0                	callq  *%rax
  805fb4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  805fb7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  805fbb:	0f 88 33 01 00 00    	js     8060f4 <pipe+0x1d4>
  805fc1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805fc5:	48 89 c7             	mov    %rax,%rdi
  805fc8:	48 b8 90 38 80 00 00 	movabs $0x803890,%rax
  805fcf:	00 00 00 
  805fd2:	ff d0                	callq  *%rax
  805fd4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  805fd8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805fdc:	ba 07 04 00 00       	mov    $0x407,%edx
  805fe1:	48 89 c6             	mov    %rax,%rsi
  805fe4:	bf 00 00 00 00       	mov    $0x0,%edi
  805fe9:	48 b8 7a 2b 80 00 00 	movabs $0x802b7a,%rax
  805ff0:	00 00 00 
  805ff3:	ff d0                	callq  *%rax
  805ff5:	89 45 ec             	mov    %eax,-0x14(%rbp)
  805ff8:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  805ffc:	0f 88 d9 00 00 00    	js     8060db <pipe+0x1bb>
  806002:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806006:	48 89 c7             	mov    %rax,%rdi
  806009:	48 b8 90 38 80 00 00 	movabs $0x803890,%rax
  806010:	00 00 00 
  806013:	ff d0                	callq  *%rax
  806015:	48 89 c2             	mov    %rax,%rdx
  806018:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80601c:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  806022:	48 89 d1             	mov    %rdx,%rcx
  806025:	ba 00 00 00 00       	mov    $0x0,%edx
  80602a:	48 89 c6             	mov    %rax,%rsi
  80602d:	bf 00 00 00 00       	mov    $0x0,%edi
  806032:	48 b8 cc 2b 80 00 00 	movabs $0x802bcc,%rax
  806039:	00 00 00 
  80603c:	ff d0                	callq  *%rax
  80603e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806041:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  806045:	78 79                	js     8060c0 <pipe+0x1a0>
  806047:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80604b:	48 ba 20 91 80 00 00 	movabs $0x809120,%rdx
  806052:	00 00 00 
  806055:	8b 12                	mov    (%rdx),%edx
  806057:	89 10                	mov    %edx,(%rax)
  806059:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80605d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  806064:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806068:	48 ba 20 91 80 00 00 	movabs $0x809120,%rdx
  80606f:	00 00 00 
  806072:	8b 12                	mov    (%rdx),%edx
  806074:	89 10                	mov    %edx,(%rax)
  806076:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80607a:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  806081:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806085:	48 89 c7             	mov    %rax,%rdi
  806088:	48 b8 6d 38 80 00 00 	movabs $0x80386d,%rax
  80608f:	00 00 00 
  806092:	ff d0                	callq  *%rax
  806094:	89 c2                	mov    %eax,%edx
  806096:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80609a:	89 10                	mov    %edx,(%rax)
  80609c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8060a0:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8060a4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8060a8:	48 89 c7             	mov    %rax,%rdi
  8060ab:	48 b8 6d 38 80 00 00 	movabs $0x80386d,%rax
  8060b2:	00 00 00 
  8060b5:	ff d0                	callq  *%rax
  8060b7:	89 03                	mov    %eax,(%rbx)
  8060b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8060be:	eb 4f                	jmp    80610f <pipe+0x1ef>
  8060c0:	90                   	nop
  8060c1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8060c5:	48 89 c6             	mov    %rax,%rsi
  8060c8:	bf 00 00 00 00       	mov    $0x0,%edi
  8060cd:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  8060d4:	00 00 00 
  8060d7:	ff d0                	callq  *%rax
  8060d9:	eb 01                	jmp    8060dc <pipe+0x1bc>
  8060db:	90                   	nop
  8060dc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8060e0:	48 89 c6             	mov    %rax,%rsi
  8060e3:	bf 00 00 00 00       	mov    $0x0,%edi
  8060e8:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  8060ef:	00 00 00 
  8060f2:	ff d0                	callq  *%rax
  8060f4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8060f8:	48 89 c6             	mov    %rax,%rsi
  8060fb:	bf 00 00 00 00       	mov    $0x0,%edi
  806100:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  806107:	00 00 00 
  80610a:	ff d0                	callq  *%rax
  80610c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80610f:	48 83 c4 38          	add    $0x38,%rsp
  806113:	5b                   	pop    %rbx
  806114:	5d                   	pop    %rbp
  806115:	c3                   	retq   

0000000000806116 <_pipeisclosed>:
  806116:	55                   	push   %rbp
  806117:	48 89 e5             	mov    %rsp,%rbp
  80611a:	53                   	push   %rbx
  80611b:	48 83 ec 28          	sub    $0x28,%rsp
  80611f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  806123:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  806127:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  80612e:	00 00 00 
  806131:	48 8b 00             	mov    (%rax),%rax
  806134:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  80613a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80613d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806141:	48 89 c7             	mov    %rax,%rdi
  806144:	48 b8 d6 68 80 00 00 	movabs $0x8068d6,%rax
  80614b:	00 00 00 
  80614e:	ff d0                	callq  *%rax
  806150:	89 c3                	mov    %eax,%ebx
  806152:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806156:	48 89 c7             	mov    %rax,%rdi
  806159:	48 b8 d6 68 80 00 00 	movabs $0x8068d6,%rax
  806160:	00 00 00 
  806163:	ff d0                	callq  *%rax
  806165:	39 c3                	cmp    %eax,%ebx
  806167:	0f 94 c0             	sete   %al
  80616a:	0f b6 c0             	movzbl %al,%eax
  80616d:	89 45 e8             	mov    %eax,-0x18(%rbp)
  806170:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  806177:	00 00 00 
  80617a:	48 8b 00             	mov    (%rax),%rax
  80617d:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  806183:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  806186:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806189:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80618c:	75 05                	jne    806193 <_pipeisclosed+0x7d>
  80618e:	8b 45 e8             	mov    -0x18(%rbp),%eax
  806191:	eb 4a                	jmp    8061dd <_pipeisclosed+0xc7>
  806193:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806196:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  806199:	74 8c                	je     806127 <_pipeisclosed+0x11>
  80619b:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  80619f:	75 86                	jne    806127 <_pipeisclosed+0x11>
  8061a1:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  8061a8:	00 00 00 
  8061ab:	48 8b 00             	mov    (%rax),%rax
  8061ae:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8061b4:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8061b7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8061ba:	89 c6                	mov    %eax,%esi
  8061bc:	48 bf 5e 74 80 00 00 	movabs $0x80745e,%rdi
  8061c3:	00 00 00 
  8061c6:	b8 00 00 00 00       	mov    $0x0,%eax
  8061cb:	49 b8 5c 15 80 00 00 	movabs $0x80155c,%r8
  8061d2:	00 00 00 
  8061d5:	41 ff d0             	callq  *%r8
  8061d8:	e9 4a ff ff ff       	jmpq   806127 <_pipeisclosed+0x11>
  8061dd:	48 83 c4 28          	add    $0x28,%rsp
  8061e1:	5b                   	pop    %rbx
  8061e2:	5d                   	pop    %rbp
  8061e3:	c3                   	retq   

00000000008061e4 <pipeisclosed>:
  8061e4:	55                   	push   %rbp
  8061e5:	48 89 e5             	mov    %rsp,%rbp
  8061e8:	48 83 ec 30          	sub    $0x30,%rsp
  8061ec:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8061ef:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8061f3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8061f6:	48 89 d6             	mov    %rdx,%rsi
  8061f9:	89 c7                	mov    %eax,%edi
  8061fb:	48 b8 53 39 80 00 00 	movabs $0x803953,%rax
  806202:	00 00 00 
  806205:	ff d0                	callq  *%rax
  806207:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80620a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80620e:	79 05                	jns    806215 <pipeisclosed+0x31>
  806210:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806213:	eb 31                	jmp    806246 <pipeisclosed+0x62>
  806215:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  806219:	48 89 c7             	mov    %rax,%rdi
  80621c:	48 b8 90 38 80 00 00 	movabs $0x803890,%rax
  806223:	00 00 00 
  806226:	ff d0                	callq  *%rax
  806228:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80622c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  806230:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  806234:	48 89 d6             	mov    %rdx,%rsi
  806237:	48 89 c7             	mov    %rax,%rdi
  80623a:	48 b8 16 61 80 00 00 	movabs $0x806116,%rax
  806241:	00 00 00 
  806244:	ff d0                	callq  *%rax
  806246:	c9                   	leaveq 
  806247:	c3                   	retq   

0000000000806248 <devpipe_read>:
  806248:	55                   	push   %rbp
  806249:	48 89 e5             	mov    %rsp,%rbp
  80624c:	48 83 ec 40          	sub    $0x40,%rsp
  806250:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  806254:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  806258:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80625c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806260:	48 89 c7             	mov    %rax,%rdi
  806263:	48 b8 90 38 80 00 00 	movabs $0x803890,%rax
  80626a:	00 00 00 
  80626d:	ff d0                	callq  *%rax
  80626f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  806273:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806277:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80627b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  806282:	00 
  806283:	e9 90 00 00 00       	jmpq   806318 <devpipe_read+0xd0>
  806288:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  80628d:	74 09                	je     806298 <devpipe_read+0x50>
  80628f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806293:	e9 8e 00 00 00       	jmpq   806326 <devpipe_read+0xde>
  806298:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80629c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8062a0:	48 89 d6             	mov    %rdx,%rsi
  8062a3:	48 89 c7             	mov    %rax,%rdi
  8062a6:	48 b8 16 61 80 00 00 	movabs $0x806116,%rax
  8062ad:	00 00 00 
  8062b0:	ff d0                	callq  *%rax
  8062b2:	85 c0                	test   %eax,%eax
  8062b4:	74 07                	je     8062bd <devpipe_read+0x75>
  8062b6:	b8 00 00 00 00       	mov    $0x0,%eax
  8062bb:	eb 69                	jmp    806326 <devpipe_read+0xde>
  8062bd:	48 b8 3d 2b 80 00 00 	movabs $0x802b3d,%rax
  8062c4:	00 00 00 
  8062c7:	ff d0                	callq  *%rax
  8062c9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8062cd:	8b 10                	mov    (%rax),%edx
  8062cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8062d3:	8b 40 04             	mov    0x4(%rax),%eax
  8062d6:	39 c2                	cmp    %eax,%edx
  8062d8:	74 ae                	je     806288 <devpipe_read+0x40>
  8062da:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8062de:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8062e2:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8062e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8062ea:	8b 00                	mov    (%rax),%eax
  8062ec:	99                   	cltd   
  8062ed:	c1 ea 1b             	shr    $0x1b,%edx
  8062f0:	01 d0                	add    %edx,%eax
  8062f2:	83 e0 1f             	and    $0x1f,%eax
  8062f5:	29 d0                	sub    %edx,%eax
  8062f7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8062fb:	48 98                	cltq   
  8062fd:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  806302:	88 01                	mov    %al,(%rcx)
  806304:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806308:	8b 00                	mov    (%rax),%eax
  80630a:	8d 50 01             	lea    0x1(%rax),%edx
  80630d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806311:	89 10                	mov    %edx,(%rax)
  806313:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  806318:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80631c:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  806320:	72 a7                	jb     8062c9 <devpipe_read+0x81>
  806322:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806326:	c9                   	leaveq 
  806327:	c3                   	retq   

0000000000806328 <devpipe_write>:
  806328:	55                   	push   %rbp
  806329:	48 89 e5             	mov    %rsp,%rbp
  80632c:	48 83 ec 40          	sub    $0x40,%rsp
  806330:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  806334:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  806338:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80633c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806340:	48 89 c7             	mov    %rax,%rdi
  806343:	48 b8 90 38 80 00 00 	movabs $0x803890,%rax
  80634a:	00 00 00 
  80634d:	ff d0                	callq  *%rax
  80634f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  806353:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806357:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80635b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  806362:	00 
  806363:	e9 8f 00 00 00       	jmpq   8063f7 <devpipe_write+0xcf>
  806368:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80636c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806370:	48 89 d6             	mov    %rdx,%rsi
  806373:	48 89 c7             	mov    %rax,%rdi
  806376:	48 b8 16 61 80 00 00 	movabs $0x806116,%rax
  80637d:	00 00 00 
  806380:	ff d0                	callq  *%rax
  806382:	85 c0                	test   %eax,%eax
  806384:	74 07                	je     80638d <devpipe_write+0x65>
  806386:	b8 00 00 00 00       	mov    $0x0,%eax
  80638b:	eb 78                	jmp    806405 <devpipe_write+0xdd>
  80638d:	48 b8 3d 2b 80 00 00 	movabs $0x802b3d,%rax
  806394:	00 00 00 
  806397:	ff d0                	callq  *%rax
  806399:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80639d:	8b 40 04             	mov    0x4(%rax),%eax
  8063a0:	48 63 d0             	movslq %eax,%rdx
  8063a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8063a7:	8b 00                	mov    (%rax),%eax
  8063a9:	48 98                	cltq   
  8063ab:	48 83 c0 20          	add    $0x20,%rax
  8063af:	48 39 c2             	cmp    %rax,%rdx
  8063b2:	73 b4                	jae    806368 <devpipe_write+0x40>
  8063b4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8063b8:	8b 40 04             	mov    0x4(%rax),%eax
  8063bb:	99                   	cltd   
  8063bc:	c1 ea 1b             	shr    $0x1b,%edx
  8063bf:	01 d0                	add    %edx,%eax
  8063c1:	83 e0 1f             	and    $0x1f,%eax
  8063c4:	29 d0                	sub    %edx,%eax
  8063c6:	89 c6                	mov    %eax,%esi
  8063c8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8063cc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8063d0:	48 01 d0             	add    %rdx,%rax
  8063d3:	0f b6 08             	movzbl (%rax),%ecx
  8063d6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8063da:	48 63 c6             	movslq %esi,%rax
  8063dd:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8063e1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8063e5:	8b 40 04             	mov    0x4(%rax),%eax
  8063e8:	8d 50 01             	lea    0x1(%rax),%edx
  8063eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8063ef:	89 50 04             	mov    %edx,0x4(%rax)
  8063f2:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8063f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8063fb:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8063ff:	72 98                	jb     806399 <devpipe_write+0x71>
  806401:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806405:	c9                   	leaveq 
  806406:	c3                   	retq   

0000000000806407 <devpipe_stat>:
  806407:	55                   	push   %rbp
  806408:	48 89 e5             	mov    %rsp,%rbp
  80640b:	48 83 ec 20          	sub    $0x20,%rsp
  80640f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  806413:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  806417:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80641b:	48 89 c7             	mov    %rax,%rdi
  80641e:	48 b8 90 38 80 00 00 	movabs $0x803890,%rax
  806425:	00 00 00 
  806428:	ff d0                	callq  *%rax
  80642a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80642e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806432:	48 be 71 74 80 00 00 	movabs $0x807471,%rsi
  806439:	00 00 00 
  80643c:	48 89 c7             	mov    %rax,%rdi
  80643f:	48 b8 4a 22 80 00 00 	movabs $0x80224a,%rax
  806446:	00 00 00 
  806449:	ff d0                	callq  *%rax
  80644b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80644f:	8b 50 04             	mov    0x4(%rax),%edx
  806452:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806456:	8b 00                	mov    (%rax),%eax
  806458:	29 c2                	sub    %eax,%edx
  80645a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80645e:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  806464:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806468:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80646f:	00 00 00 
  806472:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806476:	48 b9 20 91 80 00 00 	movabs $0x809120,%rcx
  80647d:	00 00 00 
  806480:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  806487:	b8 00 00 00 00       	mov    $0x0,%eax
  80648c:	c9                   	leaveq 
  80648d:	c3                   	retq   

000000000080648e <devpipe_close>:
  80648e:	55                   	push   %rbp
  80648f:	48 89 e5             	mov    %rsp,%rbp
  806492:	48 83 ec 10          	sub    $0x10,%rsp
  806496:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80649a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80649e:	48 89 c6             	mov    %rax,%rsi
  8064a1:	bf 00 00 00 00       	mov    $0x0,%edi
  8064a6:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  8064ad:	00 00 00 
  8064b0:	ff d0                	callq  *%rax
  8064b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8064b6:	48 89 c7             	mov    %rax,%rdi
  8064b9:	48 b8 90 38 80 00 00 	movabs $0x803890,%rax
  8064c0:	00 00 00 
  8064c3:	ff d0                	callq  *%rax
  8064c5:	48 89 c6             	mov    %rax,%rsi
  8064c8:	bf 00 00 00 00       	mov    $0x0,%edi
  8064cd:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  8064d4:	00 00 00 
  8064d7:	ff d0                	callq  *%rax
  8064d9:	c9                   	leaveq 
  8064da:	c3                   	retq   

00000000008064db <wait>:
  8064db:	55                   	push   %rbp
  8064dc:	48 89 e5             	mov    %rsp,%rbp
  8064df:	48 83 ec 20          	sub    $0x20,%rsp
  8064e3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8064e6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8064ea:	75 35                	jne    806521 <wait+0x46>
  8064ec:	48 b9 78 74 80 00 00 	movabs $0x807478,%rcx
  8064f3:	00 00 00 
  8064f6:	48 ba 83 74 80 00 00 	movabs $0x807483,%rdx
  8064fd:	00 00 00 
  806500:	be 0a 00 00 00       	mov    $0xa,%esi
  806505:	48 bf 98 74 80 00 00 	movabs $0x807498,%rdi
  80650c:	00 00 00 
  80650f:	b8 00 00 00 00       	mov    $0x0,%eax
  806514:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  80651b:	00 00 00 
  80651e:	41 ff d0             	callq  *%r8
  806521:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806524:	25 ff 03 00 00       	and    $0x3ff,%eax
  806529:	48 98                	cltq   
  80652b:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  806532:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  806539:	00 00 00 
  80653c:	48 01 d0             	add    %rdx,%rax
  80653f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  806543:	eb 0c                	jmp    806551 <wait+0x76>
  806545:	48 b8 3d 2b 80 00 00 	movabs $0x802b3d,%rax
  80654c:	00 00 00 
  80654f:	ff d0                	callq  *%rax
  806551:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806555:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80655b:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80655e:	75 0e                	jne    80656e <wait+0x93>
  806560:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806564:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  80656a:	85 c0                	test   %eax,%eax
  80656c:	75 d7                	jne    806545 <wait+0x6a>
  80656e:	90                   	nop
  80656f:	c9                   	leaveq 
  806570:	c3                   	retq   

0000000000806571 <set_pgfault_handler>:
  806571:	55                   	push   %rbp
  806572:	48 89 e5             	mov    %rsp,%rbp
  806575:	48 83 ec 20          	sub    $0x20,%rsp
  806579:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80657d:	48 b8 00 e0 80 00 00 	movabs $0x80e000,%rax
  806584:	00 00 00 
  806587:	48 8b 00             	mov    (%rax),%rax
  80658a:	48 85 c0             	test   %rax,%rax
  80658d:	75 6f                	jne    8065fe <set_pgfault_handler+0x8d>
  80658f:	ba 07 00 00 00       	mov    $0x7,%edx
  806594:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  806599:	bf 00 00 00 00       	mov    $0x0,%edi
  80659e:	48 b8 7a 2b 80 00 00 	movabs $0x802b7a,%rax
  8065a5:	00 00 00 
  8065a8:	ff d0                	callq  *%rax
  8065aa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8065ad:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8065b1:	79 30                	jns    8065e3 <set_pgfault_handler+0x72>
  8065b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8065b6:	89 c1                	mov    %eax,%ecx
  8065b8:	48 ba a8 74 80 00 00 	movabs $0x8074a8,%rdx
  8065bf:	00 00 00 
  8065c2:	be 22 00 00 00       	mov    $0x22,%esi
  8065c7:	48 bf c7 74 80 00 00 	movabs $0x8074c7,%rdi
  8065ce:	00 00 00 
  8065d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8065d6:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  8065dd:	00 00 00 
  8065e0:	41 ff d0             	callq  *%r8
  8065e3:	48 be 12 66 80 00 00 	movabs $0x806612,%rsi
  8065ea:	00 00 00 
  8065ed:	bf 00 00 00 00       	mov    $0x0,%edi
  8065f2:	48 b8 11 2d 80 00 00 	movabs $0x802d11,%rax
  8065f9:	00 00 00 
  8065fc:	ff d0                	callq  *%rax
  8065fe:	48 b8 00 e0 80 00 00 	movabs $0x80e000,%rax
  806605:	00 00 00 
  806608:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80660c:	48 89 10             	mov    %rdx,(%rax)
  80660f:	90                   	nop
  806610:	c9                   	leaveq 
  806611:	c3                   	retq   

0000000000806612 <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  806612:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  806615:	48 a1 00 e0 80 00 00 	movabs 0x80e000,%rax
  80661c:	00 00 00 
call *%rax
  80661f:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  806621:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  806628:	00 08 
    movq 152(%rsp), %rax
  80662a:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  806631:	00 
    movq 136(%rsp), %rbx
  806632:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  806639:	00 
movq %rbx, (%rax)
  80663a:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  80663d:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  806641:	4c 8b 3c 24          	mov    (%rsp),%r15
  806645:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  80664a:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  80664f:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  806654:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  806659:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  80665e:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  806663:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  806668:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  80666d:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  806672:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  806677:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  80667c:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  806681:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  806686:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  80668b:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  80668f:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  806693:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  806694:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  806699:	c3                   	retq   

000000000080669a <ipc_recv>:
  80669a:	55                   	push   %rbp
  80669b:	48 89 e5             	mov    %rsp,%rbp
  80669e:	48 83 ec 30          	sub    $0x30,%rsp
  8066a2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8066a6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8066aa:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8066ae:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8066b3:	75 0e                	jne    8066c3 <ipc_recv+0x29>
  8066b5:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8066bc:	00 00 00 
  8066bf:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8066c3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8066c7:	48 89 c7             	mov    %rax,%rdi
  8066ca:	48 b8 b4 2d 80 00 00 	movabs $0x802db4,%rax
  8066d1:	00 00 00 
  8066d4:	ff d0                	callq  *%rax
  8066d6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8066d9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8066dd:	79 27                	jns    806706 <ipc_recv+0x6c>
  8066df:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8066e4:	74 0a                	je     8066f0 <ipc_recv+0x56>
  8066e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8066ea:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8066f0:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8066f5:	74 0a                	je     806701 <ipc_recv+0x67>
  8066f7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8066fb:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  806701:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806704:	eb 53                	jmp    806759 <ipc_recv+0xbf>
  806706:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80670b:	74 19                	je     806726 <ipc_recv+0x8c>
  80670d:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  806714:	00 00 00 
  806717:	48 8b 00             	mov    (%rax),%rax
  80671a:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  806720:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  806724:	89 10                	mov    %edx,(%rax)
  806726:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80672b:	74 19                	je     806746 <ipc_recv+0xac>
  80672d:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  806734:	00 00 00 
  806737:	48 8b 00             	mov    (%rax),%rax
  80673a:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  806740:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806744:	89 10                	mov    %edx,(%rax)
  806746:	48 b8 28 a4 80 00 00 	movabs $0x80a428,%rax
  80674d:	00 00 00 
  806750:	48 8b 00             	mov    (%rax),%rax
  806753:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  806759:	c9                   	leaveq 
  80675a:	c3                   	retq   

000000000080675b <ipc_send>:
  80675b:	55                   	push   %rbp
  80675c:	48 89 e5             	mov    %rsp,%rbp
  80675f:	48 83 ec 30          	sub    $0x30,%rsp
  806763:	89 7d ec             	mov    %edi,-0x14(%rbp)
  806766:	89 75 e8             	mov    %esi,-0x18(%rbp)
  806769:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  80676d:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  806770:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  806775:	75 1c                	jne    806793 <ipc_send+0x38>
  806777:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80677e:	00 00 00 
  806781:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  806785:	eb 0c                	jmp    806793 <ipc_send+0x38>
  806787:	48 b8 3d 2b 80 00 00 	movabs $0x802b3d,%rax
  80678e:	00 00 00 
  806791:	ff d0                	callq  *%rax
  806793:	8b 75 e8             	mov    -0x18(%rbp),%esi
  806796:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  806799:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80679d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8067a0:	89 c7                	mov    %eax,%edi
  8067a2:	48 b8 5d 2d 80 00 00 	movabs $0x802d5d,%rax
  8067a9:	00 00 00 
  8067ac:	ff d0                	callq  *%rax
  8067ae:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8067b1:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8067b5:	74 d0                	je     806787 <ipc_send+0x2c>
  8067b7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8067bb:	79 30                	jns    8067ed <ipc_send+0x92>
  8067bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8067c0:	89 c1                	mov    %eax,%ecx
  8067c2:	48 ba d8 74 80 00 00 	movabs $0x8074d8,%rdx
  8067c9:	00 00 00 
  8067cc:	be 44 00 00 00       	mov    $0x44,%esi
  8067d1:	48 bf ee 74 80 00 00 	movabs $0x8074ee,%rdi
  8067d8:	00 00 00 
  8067db:	b8 00 00 00 00       	mov    $0x0,%eax
  8067e0:	49 b8 22 13 80 00 00 	movabs $0x801322,%r8
  8067e7:	00 00 00 
  8067ea:	41 ff d0             	callq  *%r8
  8067ed:	90                   	nop
  8067ee:	c9                   	leaveq 
  8067ef:	c3                   	retq   

00000000008067f0 <ipc_host_recv>:
  8067f0:	55                   	push   %rbp
  8067f1:	48 89 e5             	mov    %rsp,%rbp
  8067f4:	48 83 ec 10          	sub    $0x10,%rsp
  8067f8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8067fc:	48 ba 00 75 80 00 00 	movabs $0x807500,%rdx
  806803:	00 00 00 
  806806:	be 4e 00 00 00       	mov    $0x4e,%esi
  80680b:	48 bf ee 74 80 00 00 	movabs $0x8074ee,%rdi
  806812:	00 00 00 
  806815:	b8 00 00 00 00       	mov    $0x0,%eax
  80681a:	48 b9 22 13 80 00 00 	movabs $0x801322,%rcx
  806821:	00 00 00 
  806824:	ff d1                	callq  *%rcx

0000000000806826 <ipc_host_send>:
  806826:	55                   	push   %rbp
  806827:	48 89 e5             	mov    %rsp,%rbp
  80682a:	48 83 ec 20          	sub    $0x20,%rsp
  80682e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  806831:	89 75 f8             	mov    %esi,-0x8(%rbp)
  806834:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  806838:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  80683b:	48 ba 20 75 80 00 00 	movabs $0x807520,%rdx
  806842:	00 00 00 
  806845:	be 58 00 00 00       	mov    $0x58,%esi
  80684a:	48 bf ee 74 80 00 00 	movabs $0x8074ee,%rdi
  806851:	00 00 00 
  806854:	b8 00 00 00 00       	mov    $0x0,%eax
  806859:	48 b9 22 13 80 00 00 	movabs $0x801322,%rcx
  806860:	00 00 00 
  806863:	ff d1                	callq  *%rcx

0000000000806865 <ipc_find_env>:
  806865:	55                   	push   %rbp
  806866:	48 89 e5             	mov    %rsp,%rbp
  806869:	48 83 ec 18          	sub    $0x18,%rsp
  80686d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  806870:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  806877:	eb 4d                	jmp    8068c6 <ipc_find_env+0x61>
  806879:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  806880:	00 00 00 
  806883:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806886:	48 98                	cltq   
  806888:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80688f:	48 01 d0             	add    %rdx,%rax
  806892:	48 05 d0 00 00 00    	add    $0xd0,%rax
  806898:	8b 00                	mov    (%rax),%eax
  80689a:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80689d:	75 23                	jne    8068c2 <ipc_find_env+0x5d>
  80689f:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8068a6:	00 00 00 
  8068a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8068ac:	48 98                	cltq   
  8068ae:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8068b5:	48 01 d0             	add    %rdx,%rax
  8068b8:	48 05 c8 00 00 00    	add    $0xc8,%rax
  8068be:	8b 00                	mov    (%rax),%eax
  8068c0:	eb 12                	jmp    8068d4 <ipc_find_env+0x6f>
  8068c2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8068c6:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  8068cd:	7e aa                	jle    806879 <ipc_find_env+0x14>
  8068cf:	b8 00 00 00 00       	mov    $0x0,%eax
  8068d4:	c9                   	leaveq 
  8068d5:	c3                   	retq   

00000000008068d6 <pageref>:
  8068d6:	55                   	push   %rbp
  8068d7:	48 89 e5             	mov    %rsp,%rbp
  8068da:	48 83 ec 18          	sub    $0x18,%rsp
  8068de:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8068e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8068e6:	48 c1 e8 15          	shr    $0x15,%rax
  8068ea:	48 89 c2             	mov    %rax,%rdx
  8068ed:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8068f4:	01 00 00 
  8068f7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8068fb:	83 e0 01             	and    $0x1,%eax
  8068fe:	48 85 c0             	test   %rax,%rax
  806901:	75 07                	jne    80690a <pageref+0x34>
  806903:	b8 00 00 00 00       	mov    $0x0,%eax
  806908:	eb 56                	jmp    806960 <pageref+0x8a>
  80690a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80690e:	48 c1 e8 0c          	shr    $0xc,%rax
  806912:	48 89 c2             	mov    %rax,%rdx
  806915:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80691c:	01 00 00 
  80691f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  806923:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  806927:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80692b:	83 e0 01             	and    $0x1,%eax
  80692e:	48 85 c0             	test   %rax,%rax
  806931:	75 07                	jne    80693a <pageref+0x64>
  806933:	b8 00 00 00 00       	mov    $0x0,%eax
  806938:	eb 26                	jmp    806960 <pageref+0x8a>
  80693a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80693e:	48 c1 e8 0c          	shr    $0xc,%rax
  806942:	48 89 c2             	mov    %rax,%rdx
  806945:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  80694c:	00 00 00 
  80694f:	48 c1 e2 04          	shl    $0x4,%rdx
  806953:	48 01 d0             	add    %rdx,%rax
  806956:	48 83 c0 08          	add    $0x8,%rax
  80695a:	0f b7 00             	movzwl (%rax),%eax
  80695d:	0f b7 c0             	movzwl %ax,%eax
  806960:	c9                   	leaveq 
  806961:	c3                   	retq   
