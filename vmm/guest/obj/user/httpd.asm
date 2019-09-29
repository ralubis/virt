
vmm/guest/obj/user/httpd:     file format elf64-x86-64


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
  80003c:	e8 0a 0b 00 00       	callq  800b4b <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <die>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 10          	sub    $0x10,%rsp
  80004b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80004f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800053:	48 89 c6             	mov    %rax,%rsi
  800056:	48 bf dc 54 80 00 00 	movabs $0x8054dc,%rdi
  80005d:	00 00 00 
  800060:	b8 00 00 00 00       	mov    $0x0,%eax
  800065:	48 ba 2d 0e 80 00 00 	movabs $0x800e2d,%rdx
  80006c:	00 00 00 
  80006f:	ff d2                	callq  *%rdx
  800071:	48 b8 cf 0b 80 00 00 	movabs $0x800bcf,%rax
  800078:	00 00 00 
  80007b:	ff d0                	callq  *%rax
  80007d:	90                   	nop
  80007e:	c9                   	leaveq 
  80007f:	c3                   	retq   

0000000000800080 <req_free>:
  800080:	55                   	push   %rbp
  800081:	48 89 e5             	mov    %rsp,%rbp
  800084:	48 83 ec 10          	sub    $0x10,%rsp
  800088:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80008c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800090:	48 8b 40 08          	mov    0x8(%rax),%rax
  800094:	48 89 c7             	mov    %rax,%rdi
  800097:	48 b8 39 43 80 00 00 	movabs $0x804339,%rax
  80009e:	00 00 00 
  8000a1:	ff d0                	callq  *%rax
  8000a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8000a7:	48 8b 40 10          	mov    0x10(%rax),%rax
  8000ab:	48 89 c7             	mov    %rax,%rdi
  8000ae:	48 b8 39 43 80 00 00 	movabs $0x804339,%rax
  8000b5:	00 00 00 
  8000b8:	ff d0                	callq  *%rax
  8000ba:	90                   	nop
  8000bb:	c9                   	leaveq 
  8000bc:	c3                   	retq   

00000000008000bd <send_header>:
  8000bd:	55                   	push   %rbp
  8000be:	48 89 e5             	mov    %rsp,%rbp
  8000c1:	48 83 ec 20          	sub    $0x20,%rsp
  8000c5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8000c9:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8000cc:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8000d3:	00 00 00 
  8000d6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8000da:	eb 10                	jmp    8000ec <send_header+0x2f>
  8000dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8000e0:	8b 00                	mov    (%rax),%eax
  8000e2:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8000e5:	74 1e                	je     800105 <send_header+0x48>
  8000e7:	48 83 45 f8 10       	addq   $0x10,-0x8(%rbp)
  8000ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8000f0:	8b 00                	mov    (%rax),%eax
  8000f2:	85 c0                	test   %eax,%eax
  8000f4:	74 10                	je     800106 <send_header+0x49>
  8000f6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8000fa:	48 8b 40 08          	mov    0x8(%rax),%rax
  8000fe:	48 85 c0             	test   %rax,%rax
  800101:	75 d9                	jne    8000dc <send_header+0x1f>
  800103:	eb 01                	jmp    800106 <send_header+0x49>
  800105:	90                   	nop
  800106:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80010a:	8b 00                	mov    (%rax),%eax
  80010c:	85 c0                	test   %eax,%eax
  80010e:	75 07                	jne    800117 <send_header+0x5a>
  800110:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  800115:	eb 5f                	jmp    800176 <send_header+0xb9>
  800117:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80011b:	48 8b 40 08          	mov    0x8(%rax),%rax
  80011f:	48 89 c7             	mov    %rax,%rdi
  800122:	48 b8 51 19 80 00 00 	movabs $0x801951,%rax
  800129:	00 00 00 
  80012c:	ff d0                	callq  *%rax
  80012e:	89 45 f4             	mov    %eax,-0xc(%rbp)
  800131:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800134:	48 63 d0             	movslq %eax,%rdx
  800137:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80013b:	48 8b 48 08          	mov    0x8(%rax),%rcx
  80013f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800143:	8b 00                	mov    (%rax),%eax
  800145:	48 89 ce             	mov    %rcx,%rsi
  800148:	89 c7                	mov    %eax,%edi
  80014a:	48 b8 4f 2d 80 00 00 	movabs $0x802d4f,%rax
  800151:	00 00 00 
  800154:	ff d0                	callq  *%rax
  800156:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  800159:	74 16                	je     800171 <send_header+0xb4>
  80015b:	48 bf e0 54 80 00 00 	movabs $0x8054e0,%rdi
  800162:	00 00 00 
  800165:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80016c:	00 00 00 
  80016f:	ff d0                	callq  *%rax
  800171:	b8 00 00 00 00       	mov    $0x0,%eax
  800176:	c9                   	leaveq 
  800177:	c3                   	retq   

0000000000800178 <send_data>:
  800178:	55                   	push   %rbp
  800179:	48 89 e5             	mov    %rsp,%rbp
  80017c:	48 81 ec 20 01 00 00 	sub    $0x120,%rsp
  800183:	48 89 bd e8 fe ff ff 	mov    %rdi,-0x118(%rbp)
  80018a:	89 b5 e4 fe ff ff    	mov    %esi,-0x11c(%rbp)
  800190:	48 8d 8d f0 fe ff ff 	lea    -0x110(%rbp),%rcx
  800197:	8b 85 e4 fe ff ff    	mov    -0x11c(%rbp),%eax
  80019d:	ba 00 01 00 00       	mov    $0x100,%edx
  8001a2:	48 89 ce             	mov    %rcx,%rsi
  8001a5:	89 c7                	mov    %eax,%edi
  8001a7:	48 b8 04 2c 80 00 00 	movabs $0x802c04,%rax
  8001ae:	00 00 00 
  8001b1:	ff d0                	callq  *%rax
  8001b3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8001b6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8001ba:	79 25                	jns    8001e1 <send_data+0x69>
  8001bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001bf:	89 c6                	mov    %eax,%esi
  8001c1:	48 bf ff 54 80 00 00 	movabs $0x8054ff,%rdi
  8001c8:	00 00 00 
  8001cb:	b8 00 00 00 00       	mov    $0x0,%eax
  8001d0:	48 ba 2d 0e 80 00 00 	movabs $0x800e2d,%rdx
  8001d7:	00 00 00 
  8001da:	ff d2                	callq  *%rdx
  8001dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001df:	eb 58                	jmp    800239 <send_data+0xc1>
  8001e1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8001e5:	75 07                	jne    8001ee <send_data+0x76>
  8001e7:	b8 00 00 00 00       	mov    $0x0,%eax
  8001ec:	eb 4b                	jmp    800239 <send_data+0xc1>
  8001ee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001f1:	48 63 d0             	movslq %eax,%rdx
  8001f4:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
  8001fb:	8b 00                	mov    (%rax),%eax
  8001fd:	48 8d 8d f0 fe ff ff 	lea    -0x110(%rbp),%rcx
  800204:	48 89 ce             	mov    %rcx,%rsi
  800207:	89 c7                	mov    %eax,%edi
  800209:	48 b8 4f 2d 80 00 00 	movabs $0x802d4f,%rax
  800210:	00 00 00 
  800213:	ff d0                	callq  *%rax
  800215:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  800218:	0f 84 72 ff ff ff    	je     800190 <send_data+0x18>
  80021e:	48 bf 1b 55 80 00 00 	movabs $0x80551b,%rdi
  800225:	00 00 00 
  800228:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80022f:	00 00 00 
  800232:	ff d0                	callq  *%rax
  800234:	e9 57 ff ff ff       	jmpq   800190 <send_data+0x18>
  800239:	c9                   	leaveq 
  80023a:	c3                   	retq   

000000000080023b <send_size>:
  80023b:	55                   	push   %rbp
  80023c:	48 89 e5             	mov    %rsp,%rbp
  80023f:	48 83 ec 60          	sub    $0x60,%rsp
  800243:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800247:	89 75 a4             	mov    %esi,-0x5c(%rbp)
  80024a:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  80024d:	48 63 d0             	movslq %eax,%rdx
  800250:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
  800254:	48 89 d1             	mov    %rdx,%rcx
  800257:	48 ba 39 55 80 00 00 	movabs $0x805539,%rdx
  80025e:	00 00 00 
  800261:	be 40 00 00 00       	mov    $0x40,%esi
  800266:	48 89 c7             	mov    %rax,%rdi
  800269:	b8 00 00 00 00       	mov    $0x0,%eax
  80026e:	49 b8 70 18 80 00 00 	movabs $0x801870,%r8
  800275:	00 00 00 
  800278:	41 ff d0             	callq  *%r8
  80027b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80027e:	83 7d fc 3f          	cmpl   $0x3f,-0x4(%rbp)
  800282:	7e 2a                	jle    8002ae <send_size+0x73>
  800284:	48 ba 4f 55 80 00 00 	movabs $0x80554f,%rdx
  80028b:	00 00 00 
  80028e:	be 6e 00 00 00       	mov    $0x6e,%esi
  800293:	48 bf 61 55 80 00 00 	movabs $0x805561,%rdi
  80029a:	00 00 00 
  80029d:	b8 00 00 00 00       	mov    $0x0,%eax
  8002a2:	48 b9 f3 0b 80 00 00 	movabs $0x800bf3,%rcx
  8002a9:	00 00 00 
  8002ac:	ff d1                	callq  *%rcx
  8002ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002b1:	48 63 d0             	movslq %eax,%rdx
  8002b4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8002b8:	8b 00                	mov    (%rax),%eax
  8002ba:	48 8d 4d b0          	lea    -0x50(%rbp),%rcx
  8002be:	48 89 ce             	mov    %rcx,%rsi
  8002c1:	89 c7                	mov    %eax,%edi
  8002c3:	48 b8 4f 2d 80 00 00 	movabs $0x802d4f,%rax
  8002ca:	00 00 00 
  8002cd:	ff d0                	callq  *%rax
  8002cf:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  8002d2:	74 07                	je     8002db <send_size+0xa0>
  8002d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  8002d9:	eb 05                	jmp    8002e0 <send_size+0xa5>
  8002db:	b8 00 00 00 00       	mov    $0x0,%eax
  8002e0:	c9                   	leaveq 
  8002e1:	c3                   	retq   

00000000008002e2 <mime_type>:
  8002e2:	55                   	push   %rbp
  8002e3:	48 89 e5             	mov    %rsp,%rbp
  8002e6:	48 83 ec 08          	sub    $0x8,%rsp
  8002ea:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8002ee:	48 b8 71 55 80 00 00 	movabs $0x805571,%rax
  8002f5:	00 00 00 
  8002f8:	c9                   	leaveq 
  8002f9:	c3                   	retq   

00000000008002fa <send_content_type>:
  8002fa:	55                   	push   %rbp
  8002fb:	48 89 e5             	mov    %rsp,%rbp
  8002fe:	48 81 ec a0 00 00 00 	sub    $0xa0,%rsp
  800305:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  80030c:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  800313:	48 8b 40 08          	mov    0x8(%rax),%rax
  800317:	48 89 c7             	mov    %rax,%rdi
  80031a:	48 b8 e2 02 80 00 00 	movabs $0x8002e2,%rax
  800321:	00 00 00 
  800324:	ff d0                	callq  *%rax
  800326:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80032a:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  80032f:	75 0a                	jne    80033b <send_content_type+0x41>
  800331:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  800336:	e9 9d 00 00 00       	jmpq   8003d8 <send_content_type+0xde>
  80033b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80033f:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  800346:	48 89 d1             	mov    %rdx,%rcx
  800349:	48 ba 7b 55 80 00 00 	movabs $0x80557b,%rdx
  800350:	00 00 00 
  800353:	be 80 00 00 00       	mov    $0x80,%esi
  800358:	48 89 c7             	mov    %rax,%rdi
  80035b:	b8 00 00 00 00       	mov    $0x0,%eax
  800360:	49 b8 70 18 80 00 00 	movabs $0x801870,%r8
  800367:	00 00 00 
  80036a:	41 ff d0             	callq  *%r8
  80036d:	89 45 f4             	mov    %eax,-0xc(%rbp)
  800370:	83 7d f4 7f          	cmpl   $0x7f,-0xc(%rbp)
  800374:	7e 2a                	jle    8003a0 <send_content_type+0xa6>
  800376:	48 ba 4f 55 80 00 00 	movabs $0x80554f,%rdx
  80037d:	00 00 00 
  800380:	be 8a 00 00 00       	mov    $0x8a,%esi
  800385:	48 bf 61 55 80 00 00 	movabs $0x805561,%rdi
  80038c:	00 00 00 
  80038f:	b8 00 00 00 00       	mov    $0x0,%eax
  800394:	48 b9 f3 0b 80 00 00 	movabs $0x800bf3,%rcx
  80039b:	00 00 00 
  80039e:	ff d1                	callq  *%rcx
  8003a0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8003a3:	48 63 d0             	movslq %eax,%rdx
  8003a6:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  8003ad:	8b 00                	mov    (%rax),%eax
  8003af:	48 8d 8d 70 ff ff ff 	lea    -0x90(%rbp),%rcx
  8003b6:	48 89 ce             	mov    %rcx,%rsi
  8003b9:	89 c7                	mov    %eax,%edi
  8003bb:	48 b8 4f 2d 80 00 00 	movabs $0x802d4f,%rax
  8003c2:	00 00 00 
  8003c5:	ff d0                	callq  *%rax
  8003c7:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8003ca:	74 07                	je     8003d3 <send_content_type+0xd9>
  8003cc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  8003d1:	eb 05                	jmp    8003d8 <send_content_type+0xde>
  8003d3:	b8 00 00 00 00       	mov    $0x0,%eax
  8003d8:	c9                   	leaveq 
  8003d9:	c3                   	retq   

00000000008003da <send_header_fin>:
  8003da:	55                   	push   %rbp
  8003db:	48 89 e5             	mov    %rsp,%rbp
  8003de:	48 83 ec 20          	sub    $0x20,%rsp
  8003e2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8003e6:	48 b8 8e 55 80 00 00 	movabs $0x80558e,%rax
  8003ed:	00 00 00 
  8003f0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8003f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8003f8:	48 89 c7             	mov    %rax,%rdi
  8003fb:	48 b8 51 19 80 00 00 	movabs $0x801951,%rax
  800402:	00 00 00 
  800405:	ff d0                	callq  *%rax
  800407:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80040a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80040d:	48 63 d0             	movslq %eax,%rdx
  800410:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800414:	8b 00                	mov    (%rax),%eax
  800416:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  80041a:	48 89 ce             	mov    %rcx,%rsi
  80041d:	89 c7                	mov    %eax,%edi
  80041f:	48 b8 4f 2d 80 00 00 	movabs $0x802d4f,%rax
  800426:	00 00 00 
  800429:	ff d0                	callq  *%rax
  80042b:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  80042e:	74 07                	je     800437 <send_header_fin+0x5d>
  800430:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  800435:	eb 05                	jmp    80043c <send_header_fin+0x62>
  800437:	b8 00 00 00 00       	mov    $0x0,%eax
  80043c:	c9                   	leaveq 
  80043d:	c3                   	retq   

000000000080043e <http_request_parse>:
  80043e:	55                   	push   %rbp
  80043f:	48 89 e5             	mov    %rsp,%rbp
  800442:	48 83 ec 30          	sub    $0x30,%rsp
  800446:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80044a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80044e:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  800453:	75 0a                	jne    80045f <http_request_parse+0x21>
  800455:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  80045a:	e9 5d 01 00 00       	jmpq   8005bc <http_request_parse+0x17e>
  80045f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800463:	ba 04 00 00 00       	mov    $0x4,%edx
  800468:	48 be 91 55 80 00 00 	movabs $0x805591,%rsi
  80046f:	00 00 00 
  800472:	48 89 c7             	mov    %rax,%rdi
  800475:	48 b8 72 1b 80 00 00 	movabs $0x801b72,%rax
  80047c:	00 00 00 
  80047f:	ff d0                	callq  *%rax
  800481:	85 c0                	test   %eax,%eax
  800483:	74 0a                	je     80048f <http_request_parse+0x51>
  800485:	b8 18 fc ff ff       	mov    $0xfffffc18,%eax
  80048a:	e9 2d 01 00 00       	jmpq   8005bc <http_request_parse+0x17e>
  80048f:	48 83 45 d0 04       	addq   $0x4,-0x30(%rbp)
  800494:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800498:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80049c:	eb 05                	jmp    8004a3 <http_request_parse+0x65>
  80049e:	48 83 45 d0 01       	addq   $0x1,-0x30(%rbp)
  8004a3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8004a7:	0f b6 00             	movzbl (%rax),%eax
  8004aa:	84 c0                	test   %al,%al
  8004ac:	74 0b                	je     8004b9 <http_request_parse+0x7b>
  8004ae:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8004b2:	0f b6 00             	movzbl (%rax),%eax
  8004b5:	3c 20                	cmp    $0x20,%al
  8004b7:	75 e5                	jne    80049e <http_request_parse+0x60>
  8004b9:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8004bd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004c1:	48 29 c2             	sub    %rax,%rdx
  8004c4:	48 89 d0             	mov    %rdx,%rax
  8004c7:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8004ca:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8004cd:	83 c0 01             	add    $0x1,%eax
  8004d0:	48 98                	cltq   
  8004d2:	48 89 c7             	mov    %rax,%rdi
  8004d5:	48 b8 c8 3f 80 00 00 	movabs $0x803fc8,%rax
  8004dc:	00 00 00 
  8004df:	ff d0                	callq  *%rax
  8004e1:	48 89 c2             	mov    %rax,%rdx
  8004e4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8004e8:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8004ec:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8004ef:	48 63 d0             	movslq %eax,%rdx
  8004f2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8004f6:	48 8b 40 08          	mov    0x8(%rax),%rax
  8004fa:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8004fe:	48 89 ce             	mov    %rcx,%rsi
  800501:	48 89 c7             	mov    %rax,%rdi
  800504:	48 b8 e2 1c 80 00 00 	movabs $0x801ce2,%rax
  80050b:	00 00 00 
  80050e:	ff d0                	callq  *%rax
  800510:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800514:	48 8b 50 08          	mov    0x8(%rax),%rdx
  800518:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80051b:	48 98                	cltq   
  80051d:	48 01 d0             	add    %rdx,%rax
  800520:	c6 00 00             	movb   $0x0,(%rax)
  800523:	48 83 45 d0 01       	addq   $0x1,-0x30(%rbp)
  800528:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80052c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800530:	eb 05                	jmp    800537 <http_request_parse+0xf9>
  800532:	48 83 45 d0 01       	addq   $0x1,-0x30(%rbp)
  800537:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80053b:	0f b6 00             	movzbl (%rax),%eax
  80053e:	84 c0                	test   %al,%al
  800540:	74 0b                	je     80054d <http_request_parse+0x10f>
  800542:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800546:	0f b6 00             	movzbl (%rax),%eax
  800549:	3c 0a                	cmp    $0xa,%al
  80054b:	75 e5                	jne    800532 <http_request_parse+0xf4>
  80054d:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  800551:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800555:	48 29 c2             	sub    %rax,%rdx
  800558:	48 89 d0             	mov    %rdx,%rax
  80055b:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80055e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800561:	83 c0 01             	add    $0x1,%eax
  800564:	48 98                	cltq   
  800566:	48 89 c7             	mov    %rax,%rdi
  800569:	48 b8 c8 3f 80 00 00 	movabs $0x803fc8,%rax
  800570:	00 00 00 
  800573:	ff d0                	callq  *%rax
  800575:	48 89 c2             	mov    %rax,%rdx
  800578:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80057c:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800580:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800583:	48 63 d0             	movslq %eax,%rdx
  800586:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80058a:	48 8b 40 10          	mov    0x10(%rax),%rax
  80058e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  800592:	48 89 ce             	mov    %rcx,%rsi
  800595:	48 89 c7             	mov    %rax,%rdi
  800598:	48 b8 e2 1c 80 00 00 	movabs $0x801ce2,%rax
  80059f:	00 00 00 
  8005a2:	ff d0                	callq  *%rax
  8005a4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8005a8:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8005ac:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8005af:	48 98                	cltq   
  8005b1:	48 01 d0             	add    %rdx,%rax
  8005b4:	c6 00 00             	movb   $0x0,(%rax)
  8005b7:	b8 00 00 00 00       	mov    $0x0,%eax
  8005bc:	c9                   	leaveq 
  8005bd:	c3                   	retq   

00000000008005be <send_error>:
  8005be:	55                   	push   %rbp
  8005bf:	48 89 e5             	mov    %rsp,%rbp
  8005c2:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  8005c9:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  8005d0:	89 b5 e4 fd ff ff    	mov    %esi,-0x21c(%rbp)
  8005d6:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8005dd:	00 00 00 
  8005e0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8005e4:	eb 13                	jmp    8005f9 <send_error+0x3b>
  8005e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005ea:	8b 00                	mov    (%rax),%eax
  8005ec:	3b 85 e4 fd ff ff    	cmp    -0x21c(%rbp),%eax
  8005f2:	74 1e                	je     800612 <send_error+0x54>
  8005f4:	48 83 45 f8 10       	addq   $0x10,-0x8(%rbp)
  8005f9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005fd:	8b 00                	mov    (%rax),%eax
  8005ff:	85 c0                	test   %eax,%eax
  800601:	74 10                	je     800613 <send_error+0x55>
  800603:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800607:	48 8b 40 08          	mov    0x8(%rax),%rax
  80060b:	48 85 c0             	test   %rax,%rax
  80060e:	75 d6                	jne    8005e6 <send_error+0x28>
  800610:	eb 01                	jmp    800613 <send_error+0x55>
  800612:	90                   	nop
  800613:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800617:	8b 00                	mov    (%rax),%eax
  800619:	85 c0                	test   %eax,%eax
  80061b:	75 0a                	jne    800627 <send_error+0x69>
  80061d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  800622:	e9 93 00 00 00       	jmpq   8006ba <send_error+0xfc>
  800627:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80062b:	48 8b 48 08          	mov    0x8(%rax),%rcx
  80062f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800633:	8b 38                	mov    (%rax),%edi
  800635:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800639:	48 8b 70 08          	mov    0x8(%rax),%rsi
  80063d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800641:	8b 10                	mov    (%rax),%edx
  800643:	48 8d 85 f0 fd ff ff 	lea    -0x210(%rbp),%rax
  80064a:	48 83 ec 08          	sub    $0x8,%rsp
  80064e:	51                   	push   %rcx
  80064f:	41 89 f9             	mov    %edi,%r9d
  800652:	49 89 f0             	mov    %rsi,%r8
  800655:	89 d1                	mov    %edx,%ecx
  800657:	48 ba 98 55 80 00 00 	movabs $0x805598,%rdx
  80065e:	00 00 00 
  800661:	be 00 02 00 00       	mov    $0x200,%esi
  800666:	48 89 c7             	mov    %rax,%rdi
  800669:	b8 00 00 00 00       	mov    $0x0,%eax
  80066e:	49 ba 70 18 80 00 00 	movabs $0x801870,%r10
  800675:	00 00 00 
  800678:	41 ff d2             	callq  *%r10
  80067b:	48 83 c4 10          	add    $0x10,%rsp
  80067f:	89 45 f4             	mov    %eax,-0xc(%rbp)
  800682:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800685:	48 63 d0             	movslq %eax,%rdx
  800688:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  80068f:	8b 00                	mov    (%rax),%eax
  800691:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  800698:	48 89 ce             	mov    %rcx,%rsi
  80069b:	89 c7                	mov    %eax,%edi
  80069d:	48 b8 4f 2d 80 00 00 	movabs $0x802d4f,%rax
  8006a4:	00 00 00 
  8006a7:	ff d0                	callq  *%rax
  8006a9:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8006ac:	74 07                	je     8006b5 <send_error+0xf7>
  8006ae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  8006b3:	eb 05                	jmp    8006ba <send_error+0xfc>
  8006b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8006ba:	c9                   	leaveq 
  8006bb:	c3                   	retq   

00000000008006bc <send_file>:
  8006bc:	55                   	push   %rbp
  8006bd:	48 89 e5             	mov    %rsp,%rbp
  8006c0:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8006c7:	48 89 bd 58 ff ff ff 	mov    %rdi,-0xa8(%rbp)
  8006ce:	c7 45 f8 ff ff ff ff 	movl   $0xffffffff,-0x8(%rbp)
  8006d5:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8006dc:	48 8b 40 08          	mov    0x8(%rax),%rax
  8006e0:	be 00 00 00 00       	mov    $0x0,%esi
  8006e5:	48 89 c7             	mov    %rax,%rdi
  8006e8:	48 b8 dd 30 80 00 00 	movabs $0x8030dd,%rax
  8006ef:	00 00 00 
  8006f2:	ff d0                	callq  *%rax
  8006f4:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8006f7:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8006fb:	79 20                	jns    80071d <send_file+0x61>
  8006fd:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  800704:	be 94 01 00 00       	mov    $0x194,%esi
  800709:	48 89 c7             	mov    %rax,%rdi
  80070c:	48 b8 be 05 80 00 00 	movabs $0x8005be,%rax
  800713:	00 00 00 
  800716:	ff d0                	callq  *%rax
  800718:	e9 5b 01 00 00       	jmpq   800878 <send_file+0x1bc>
  80071d:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  800724:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800727:	48 89 d6             	mov    %rdx,%rsi
  80072a:	89 c7                	mov    %eax,%edi
  80072c:	48 b8 34 2f 80 00 00 	movabs $0x802f34,%rax
  800733:	00 00 00 
  800736:	ff d0                	callq  *%rax
  800738:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80073b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80073f:	79 31                	jns    800772 <send_file+0xb6>
  800741:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800744:	89 c7                	mov    %eax,%edi
  800746:	48 b8 e1 29 80 00 00 	movabs $0x8029e1,%rax
  80074d:	00 00 00 
  800750:	ff d0                	callq  *%rax
  800752:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  800759:	be 94 01 00 00       	mov    $0x194,%esi
  80075e:	48 89 c7             	mov    %rax,%rdi
  800761:	48 b8 be 05 80 00 00 	movabs $0x8005be,%rax
  800768:	00 00 00 
  80076b:	ff d0                	callq  *%rax
  80076d:	e9 06 01 00 00       	jmpq   800878 <send_file+0x1bc>
  800772:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800775:	85 c0                	test   %eax,%eax
  800777:	74 31                	je     8007aa <send_file+0xee>
  800779:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80077c:	89 c7                	mov    %eax,%edi
  80077e:	48 b8 e1 29 80 00 00 	movabs $0x8029e1,%rax
  800785:	00 00 00 
  800788:	ff d0                	callq  *%rax
  80078a:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  800791:	be 94 01 00 00       	mov    $0x194,%esi
  800796:	48 89 c7             	mov    %rax,%rdi
  800799:	48 b8 be 05 80 00 00 	movabs $0x8005be,%rax
  8007a0:	00 00 00 
  8007a3:	ff d0                	callq  *%rax
  8007a5:	e9 ce 00 00 00       	jmpq   800878 <send_file+0x1bc>
  8007aa:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8007ad:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8007b0:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8007b7:	be c8 00 00 00       	mov    $0xc8,%esi
  8007bc:	48 89 c7             	mov    %rax,%rdi
  8007bf:	48 b8 bd 00 80 00 00 	movabs $0x8000bd,%rax
  8007c6:	00 00 00 
  8007c9:	ff d0                	callq  *%rax
  8007cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8007ce:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8007d2:	0f 88 82 00 00 00    	js     80085a <send_file+0x19e>
  8007d8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8007db:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8007e2:	89 d6                	mov    %edx,%esi
  8007e4:	48 89 c7             	mov    %rax,%rdi
  8007e7:	48 b8 3b 02 80 00 00 	movabs $0x80023b,%rax
  8007ee:	00 00 00 
  8007f1:	ff d0                	callq  *%rax
  8007f3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8007f6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8007fa:	78 61                	js     80085d <send_file+0x1a1>
  8007fc:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  800803:	48 89 c7             	mov    %rax,%rdi
  800806:	48 b8 fa 02 80 00 00 	movabs $0x8002fa,%rax
  80080d:	00 00 00 
  800810:	ff d0                	callq  *%rax
  800812:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800815:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800819:	78 45                	js     800860 <send_file+0x1a4>
  80081b:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  800822:	48 89 c7             	mov    %rax,%rdi
  800825:	48 b8 da 03 80 00 00 	movabs $0x8003da,%rax
  80082c:	00 00 00 
  80082f:	ff d0                	callq  *%rax
  800831:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800834:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800838:	78 29                	js     800863 <send_file+0x1a7>
  80083a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80083d:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  800844:	89 d6                	mov    %edx,%esi
  800846:	48 89 c7             	mov    %rax,%rdi
  800849:	48 b8 78 01 80 00 00 	movabs $0x800178,%rax
  800850:	00 00 00 
  800853:	ff d0                	callq  *%rax
  800855:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800858:	eb 0a                	jmp    800864 <send_file+0x1a8>
  80085a:	90                   	nop
  80085b:	eb 07                	jmp    800864 <send_file+0x1a8>
  80085d:	90                   	nop
  80085e:	eb 04                	jmp    800864 <send_file+0x1a8>
  800860:	90                   	nop
  800861:	eb 01                	jmp    800864 <send_file+0x1a8>
  800863:	90                   	nop
  800864:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800867:	89 c7                	mov    %eax,%edi
  800869:	48 b8 e1 29 80 00 00 	movabs $0x8029e1,%rax
  800870:	00 00 00 
  800873:	ff d0                	callq  *%rax
  800875:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800878:	c9                   	leaveq 
  800879:	c3                   	retq   

000000000080087a <handle_client>:
  80087a:	55                   	push   %rbp
  80087b:	48 89 e5             	mov    %rsp,%rbp
  80087e:	48 81 ec 40 02 00 00 	sub    $0x240,%rsp
  800885:	89 bd cc fd ff ff    	mov    %edi,-0x234(%rbp)
  80088b:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
  800892:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800896:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80089a:	48 8d 8d d0 fd ff ff 	lea    -0x230(%rbp),%rcx
  8008a1:	8b 85 cc fd ff ff    	mov    -0x234(%rbp),%eax
  8008a7:	ba 00 02 00 00       	mov    $0x200,%edx
  8008ac:	48 89 ce             	mov    %rcx,%rsi
  8008af:	89 c7                	mov    %eax,%edi
  8008b1:	48 b8 04 2c 80 00 00 	movabs $0x802c04,%rax
  8008b8:	00 00 00 
  8008bb:	ff d0                	callq  *%rax
  8008bd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8008c0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8008c4:	79 2a                	jns    8008f0 <handle_client+0x76>
  8008c6:	48 ba 13 56 80 00 00 	movabs $0x805613,%rdx
  8008cd:	00 00 00 
  8008d0:	be 2a 01 00 00       	mov    $0x12a,%esi
  8008d5:	48 bf 61 55 80 00 00 	movabs $0x805561,%rdi
  8008dc:	00 00 00 
  8008df:	b8 00 00 00 00       	mov    $0x0,%eax
  8008e4:	48 b9 f3 0b 80 00 00 	movabs $0x800bf3,%rcx
  8008eb:	00 00 00 
  8008ee:	ff d1                	callq  *%rcx
  8008f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8008f4:	ba 08 00 00 00       	mov    $0x8,%edx
  8008f9:	be 00 00 00 00       	mov    $0x0,%esi
  8008fe:	48 89 c7             	mov    %rax,%rdi
  800901:	48 b8 57 1c 80 00 00 	movabs $0x801c57,%rax
  800908:	00 00 00 
  80090b:	ff d0                	callq  *%rax
  80090d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800911:	8b 95 cc fd ff ff    	mov    -0x234(%rbp),%edx
  800917:	89 10                	mov    %edx,(%rax)
  800919:	48 8d 95 d0 fd ff ff 	lea    -0x230(%rbp),%rdx
  800920:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800924:	48 89 d6             	mov    %rdx,%rsi
  800927:	48 89 c7             	mov    %rax,%rdi
  80092a:	48 b8 3e 04 80 00 00 	movabs $0x80043e,%rax
  800931:	00 00 00 
  800934:	ff d0                	callq  *%rax
  800936:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800939:	81 7d ec 18 fc ff ff 	cmpl   $0xfffffc18,-0x14(%rbp)
  800940:	75 1a                	jne    80095c <handle_client+0xe2>
  800942:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800946:	be 90 01 00 00       	mov    $0x190,%esi
  80094b:	48 89 c7             	mov    %rax,%rdi
  80094e:	48 b8 be 05 80 00 00 	movabs $0x8005be,%rax
  800955:	00 00 00 
  800958:	ff d0                	callq  *%rax
  80095a:	eb 43                	jmp    80099f <handle_client+0x125>
  80095c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800960:	79 2a                	jns    80098c <handle_client+0x112>
  800962:	48 ba 22 56 80 00 00 	movabs $0x805622,%rdx
  800969:	00 00 00 
  80096c:	be 34 01 00 00       	mov    $0x134,%esi
  800971:	48 bf 61 55 80 00 00 	movabs $0x805561,%rdi
  800978:	00 00 00 
  80097b:	b8 00 00 00 00       	mov    $0x0,%eax
  800980:	48 b9 f3 0b 80 00 00 	movabs $0x800bf3,%rcx
  800987:	00 00 00 
  80098a:	ff d1                	callq  *%rcx
  80098c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800990:	48 89 c7             	mov    %rax,%rdi
  800993:	48 b8 bc 06 80 00 00 	movabs $0x8006bc,%rax
  80099a:	00 00 00 
  80099d:	ff d0                	callq  *%rax
  80099f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8009a3:	48 89 c7             	mov    %rax,%rdi
  8009a6:	48 b8 80 00 80 00 00 	movabs $0x800080,%rax
  8009ad:	00 00 00 
  8009b0:	ff d0                	callq  *%rax
  8009b2:	90                   	nop
  8009b3:	8b 85 cc fd ff ff    	mov    -0x234(%rbp),%eax
  8009b9:	89 c7                	mov    %eax,%edi
  8009bb:	48 b8 e1 29 80 00 00 	movabs $0x8029e1,%rax
  8009c2:	00 00 00 
  8009c5:	ff d0                	callq  *%rax
  8009c7:	90                   	nop
  8009c8:	c9                   	leaveq 
  8009c9:	c3                   	retq   

00000000008009ca <umain>:
  8009ca:	55                   	push   %rbp
  8009cb:	48 89 e5             	mov    %rsp,%rbp
  8009ce:	48 83 ec 50          	sub    $0x50,%rsp
  8009d2:	89 7d bc             	mov    %edi,-0x44(%rbp)
  8009d5:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
  8009d9:	48 b8 40 80 80 00 00 	movabs $0x808040,%rax
  8009e0:	00 00 00 
  8009e3:	48 b9 2f 56 80 00 00 	movabs $0x80562f,%rcx
  8009ea:	00 00 00 
  8009ed:	48 89 08             	mov    %rcx,(%rax)
  8009f0:	ba 06 00 00 00       	mov    $0x6,%edx
  8009f5:	be 01 00 00 00       	mov    $0x1,%esi
  8009fa:	bf 02 00 00 00       	mov    $0x2,%edi
  8009ff:	48 b8 91 3a 80 00 00 	movabs $0x803a91,%rax
  800a06:	00 00 00 
  800a09:	ff d0                	callq  *%rax
  800a0b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800a0e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800a12:	79 16                	jns    800a2a <umain+0x60>
  800a14:	48 bf 36 56 80 00 00 	movabs $0x805636,%rdi
  800a1b:	00 00 00 
  800a1e:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800a25:	00 00 00 
  800a28:	ff d0                	callq  *%rax
  800a2a:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  800a2e:	ba 10 00 00 00       	mov    $0x10,%edx
  800a33:	be 00 00 00 00       	mov    $0x0,%esi
  800a38:	48 89 c7             	mov    %rax,%rdi
  800a3b:	48 b8 57 1c 80 00 00 	movabs $0x801c57,%rax
  800a42:	00 00 00 
  800a45:	ff d0                	callq  *%rax
  800a47:	c6 45 e1 02          	movb   $0x2,-0x1f(%rbp)
  800a4b:	bf 00 00 00 00       	mov    $0x0,%edi
  800a50:	48 b8 34 54 80 00 00 	movabs $0x805434,%rax
  800a57:	00 00 00 
  800a5a:	ff d0                	callq  *%rax
  800a5c:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  800a5f:	bf 50 00 00 00       	mov    $0x50,%edi
  800a64:	48 b8 ef 53 80 00 00 	movabs $0x8053ef,%rax
  800a6b:	00 00 00 
  800a6e:	ff d0                	callq  *%rax
  800a70:	66 89 45 e2          	mov    %ax,-0x1e(%rbp)
  800a74:	48 8d 4d e0          	lea    -0x20(%rbp),%rcx
  800a78:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800a7b:	ba 10 00 00 00       	mov    $0x10,%edx
  800a80:	48 89 ce             	mov    %rcx,%rsi
  800a83:	89 c7                	mov    %eax,%edi
  800a85:	48 b8 81 38 80 00 00 	movabs $0x803881,%rax
  800a8c:	00 00 00 
  800a8f:	ff d0                	callq  *%rax
  800a91:	85 c0                	test   %eax,%eax
  800a93:	79 16                	jns    800aab <umain+0xe1>
  800a95:	48 bf 50 56 80 00 00 	movabs $0x805650,%rdi
  800a9c:	00 00 00 
  800a9f:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800aa6:	00 00 00 
  800aa9:	ff d0                	callq  *%rax
  800aab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800aae:	be 05 00 00 00       	mov    $0x5,%esi
  800ab3:	89 c7                	mov    %eax,%edi
  800ab5:	48 b8 a4 39 80 00 00 	movabs $0x8039a4,%rax
  800abc:	00 00 00 
  800abf:	ff d0                	callq  *%rax
  800ac1:	85 c0                	test   %eax,%eax
  800ac3:	79 16                	jns    800adb <umain+0x111>
  800ac5:	48 bf 78 56 80 00 00 	movabs $0x805678,%rdi
  800acc:	00 00 00 
  800acf:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800ad6:	00 00 00 
  800ad9:	ff d0                	callq  *%rax
  800adb:	48 bf a0 56 80 00 00 	movabs $0x8056a0,%rdi
  800ae2:	00 00 00 
  800ae5:	b8 00 00 00 00       	mov    $0x0,%eax
  800aea:	48 ba 2d 0e 80 00 00 	movabs $0x800e2d,%rdx
  800af1:	00 00 00 
  800af4:	ff d2                	callq  *%rdx
  800af6:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  800afd:	48 8d 55 cc          	lea    -0x34(%rbp),%rdx
  800b01:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
  800b05:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800b08:	48 89 ce             	mov    %rcx,%rsi
  800b0b:	89 c7                	mov    %eax,%edi
  800b0d:	48 b8 12 38 80 00 00 	movabs $0x803812,%rax
  800b14:	00 00 00 
  800b17:	ff d0                	callq  *%rax
  800b19:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800b1c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800b20:	79 16                	jns    800b38 <umain+0x16e>
  800b22:	48 bf c8 56 80 00 00 	movabs $0x8056c8,%rdi
  800b29:	00 00 00 
  800b2c:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800b33:	00 00 00 
  800b36:	ff d0                	callq  *%rax
  800b38:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800b3b:	89 c7                	mov    %eax,%edi
  800b3d:	48 b8 7a 08 80 00 00 	movabs $0x80087a,%rax
  800b44:	00 00 00 
  800b47:	ff d0                	callq  *%rax
  800b49:	eb ab                	jmp    800af6 <umain+0x12c>

0000000000800b4b <libmain>:
  800b4b:	55                   	push   %rbp
  800b4c:	48 89 e5             	mov    %rsp,%rbp
  800b4f:	48 83 ec 10          	sub    $0x10,%rsp
  800b53:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800b56:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800b5a:	48 b8 74 22 80 00 00 	movabs $0x802274,%rax
  800b61:	00 00 00 
  800b64:	ff d0                	callq  *%rax
  800b66:	25 ff 03 00 00       	and    $0x3ff,%eax
  800b6b:	48 98                	cltq   
  800b6d:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800b74:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800b7b:	00 00 00 
  800b7e:	48 01 c2             	add    %rax,%rdx
  800b81:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  800b88:	00 00 00 
  800b8b:	48 89 10             	mov    %rdx,(%rax)
  800b8e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800b92:	7e 14                	jle    800ba8 <libmain+0x5d>
  800b94:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800b98:	48 8b 10             	mov    (%rax),%rdx
  800b9b:	48 b8 40 80 80 00 00 	movabs $0x808040,%rax
  800ba2:	00 00 00 
  800ba5:	48 89 10             	mov    %rdx,(%rax)
  800ba8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800bac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800baf:	48 89 d6             	mov    %rdx,%rsi
  800bb2:	89 c7                	mov    %eax,%edi
  800bb4:	48 b8 ca 09 80 00 00 	movabs $0x8009ca,%rax
  800bbb:	00 00 00 
  800bbe:	ff d0                	callq  *%rax
  800bc0:	48 b8 cf 0b 80 00 00 	movabs $0x800bcf,%rax
  800bc7:	00 00 00 
  800bca:	ff d0                	callq  *%rax
  800bcc:	90                   	nop
  800bcd:	c9                   	leaveq 
  800bce:	c3                   	retq   

0000000000800bcf <exit>:
  800bcf:	55                   	push   %rbp
  800bd0:	48 89 e5             	mov    %rsp,%rbp
  800bd3:	48 b8 2c 2a 80 00 00 	movabs $0x802a2c,%rax
  800bda:	00 00 00 
  800bdd:	ff d0                	callq  *%rax
  800bdf:	bf 00 00 00 00       	mov    $0x0,%edi
  800be4:	48 b8 2e 22 80 00 00 	movabs $0x80222e,%rax
  800beb:	00 00 00 
  800bee:	ff d0                	callq  *%rax
  800bf0:	90                   	nop
  800bf1:	5d                   	pop    %rbp
  800bf2:	c3                   	retq   

0000000000800bf3 <_panic>:
  800bf3:	55                   	push   %rbp
  800bf4:	48 89 e5             	mov    %rsp,%rbp
  800bf7:	53                   	push   %rbx
  800bf8:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800bff:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800c06:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800c0c:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800c13:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800c1a:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800c21:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800c28:	84 c0                	test   %al,%al
  800c2a:	74 23                	je     800c4f <_panic+0x5c>
  800c2c:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800c33:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800c37:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800c3b:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800c3f:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800c43:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800c47:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800c4b:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800c4f:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800c56:	00 00 00 
  800c59:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800c60:	00 00 00 
  800c63:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800c67:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800c6e:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800c75:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800c7c:	48 b8 40 80 80 00 00 	movabs $0x808040,%rax
  800c83:	00 00 00 
  800c86:	48 8b 18             	mov    (%rax),%rbx
  800c89:	48 b8 74 22 80 00 00 	movabs $0x802274,%rax
  800c90:	00 00 00 
  800c93:	ff d0                	callq  *%rax
  800c95:	89 c6                	mov    %eax,%esi
  800c97:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  800c9d:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  800ca4:	41 89 d0             	mov    %edx,%r8d
  800ca7:	48 89 c1             	mov    %rax,%rcx
  800caa:	48 89 da             	mov    %rbx,%rdx
  800cad:	48 bf f8 56 80 00 00 	movabs $0x8056f8,%rdi
  800cb4:	00 00 00 
  800cb7:	b8 00 00 00 00       	mov    $0x0,%eax
  800cbc:	49 b9 2d 0e 80 00 00 	movabs $0x800e2d,%r9
  800cc3:	00 00 00 
  800cc6:	41 ff d1             	callq  *%r9
  800cc9:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800cd0:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800cd7:	48 89 d6             	mov    %rdx,%rsi
  800cda:	48 89 c7             	mov    %rax,%rdi
  800cdd:	48 b8 81 0d 80 00 00 	movabs $0x800d81,%rax
  800ce4:	00 00 00 
  800ce7:	ff d0                	callq  *%rax
  800ce9:	48 bf 1b 57 80 00 00 	movabs $0x80571b,%rdi
  800cf0:	00 00 00 
  800cf3:	b8 00 00 00 00       	mov    $0x0,%eax
  800cf8:	48 ba 2d 0e 80 00 00 	movabs $0x800e2d,%rdx
  800cff:	00 00 00 
  800d02:	ff d2                	callq  *%rdx
  800d04:	cc                   	int3   
  800d05:	eb fd                	jmp    800d04 <_panic+0x111>

0000000000800d07 <putch>:
  800d07:	55                   	push   %rbp
  800d08:	48 89 e5             	mov    %rsp,%rbp
  800d0b:	48 83 ec 10          	sub    $0x10,%rsp
  800d0f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800d12:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800d16:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d1a:	8b 00                	mov    (%rax),%eax
  800d1c:	8d 48 01             	lea    0x1(%rax),%ecx
  800d1f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800d23:	89 0a                	mov    %ecx,(%rdx)
  800d25:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800d28:	89 d1                	mov    %edx,%ecx
  800d2a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800d2e:	48 98                	cltq   
  800d30:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800d34:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d38:	8b 00                	mov    (%rax),%eax
  800d3a:	3d ff 00 00 00       	cmp    $0xff,%eax
  800d3f:	75 2c                	jne    800d6d <putch+0x66>
  800d41:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d45:	8b 00                	mov    (%rax),%eax
  800d47:	48 98                	cltq   
  800d49:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800d4d:	48 83 c2 08          	add    $0x8,%rdx
  800d51:	48 89 c6             	mov    %rax,%rsi
  800d54:	48 89 d7             	mov    %rdx,%rdi
  800d57:	48 b8 a5 21 80 00 00 	movabs $0x8021a5,%rax
  800d5e:	00 00 00 
  800d61:	ff d0                	callq  *%rax
  800d63:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d67:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800d6d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d71:	8b 40 04             	mov    0x4(%rax),%eax
  800d74:	8d 50 01             	lea    0x1(%rax),%edx
  800d77:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d7b:	89 50 04             	mov    %edx,0x4(%rax)
  800d7e:	90                   	nop
  800d7f:	c9                   	leaveq 
  800d80:	c3                   	retq   

0000000000800d81 <vcprintf>:
  800d81:	55                   	push   %rbp
  800d82:	48 89 e5             	mov    %rsp,%rbp
  800d85:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800d8c:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800d93:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800d9a:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800da1:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800da8:	48 8b 0a             	mov    (%rdx),%rcx
  800dab:	48 89 08             	mov    %rcx,(%rax)
  800dae:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800db2:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800db6:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800dba:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800dbe:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800dc5:	00 00 00 
  800dc8:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800dcf:	00 00 00 
  800dd2:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800dd9:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800de0:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800de7:	48 89 c6             	mov    %rax,%rsi
  800dea:	48 bf 07 0d 80 00 00 	movabs $0x800d07,%rdi
  800df1:	00 00 00 
  800df4:	48 b8 cb 11 80 00 00 	movabs $0x8011cb,%rax
  800dfb:	00 00 00 
  800dfe:	ff d0                	callq  *%rax
  800e00:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800e06:	48 98                	cltq   
  800e08:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800e0f:	48 83 c2 08          	add    $0x8,%rdx
  800e13:	48 89 c6             	mov    %rax,%rsi
  800e16:	48 89 d7             	mov    %rdx,%rdi
  800e19:	48 b8 a5 21 80 00 00 	movabs $0x8021a5,%rax
  800e20:	00 00 00 
  800e23:	ff d0                	callq  *%rax
  800e25:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800e2b:	c9                   	leaveq 
  800e2c:	c3                   	retq   

0000000000800e2d <cprintf>:
  800e2d:	55                   	push   %rbp
  800e2e:	48 89 e5             	mov    %rsp,%rbp
  800e31:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800e38:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800e3f:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800e46:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800e4d:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800e54:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800e5b:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800e62:	84 c0                	test   %al,%al
  800e64:	74 20                	je     800e86 <cprintf+0x59>
  800e66:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800e6a:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800e6e:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800e72:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800e76:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800e7a:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800e7e:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800e82:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800e86:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800e8d:	00 00 00 
  800e90:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800e97:	00 00 00 
  800e9a:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800e9e:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800ea5:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800eac:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800eb3:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800eba:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800ec1:	48 8b 0a             	mov    (%rdx),%rcx
  800ec4:	48 89 08             	mov    %rcx,(%rax)
  800ec7:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ecb:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ecf:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800ed3:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800ed7:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800ede:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800ee5:	48 89 d6             	mov    %rdx,%rsi
  800ee8:	48 89 c7             	mov    %rax,%rdi
  800eeb:	48 b8 81 0d 80 00 00 	movabs $0x800d81,%rax
  800ef2:	00 00 00 
  800ef5:	ff d0                	callq  *%rax
  800ef7:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800efd:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800f03:	c9                   	leaveq 
  800f04:	c3                   	retq   

0000000000800f05 <printnum>:
  800f05:	55                   	push   %rbp
  800f06:	48 89 e5             	mov    %rsp,%rbp
  800f09:	48 83 ec 30          	sub    $0x30,%rsp
  800f0d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800f11:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800f15:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800f19:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  800f1c:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  800f20:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  800f24:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800f27:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  800f2b:	77 54                	ja     800f81 <printnum+0x7c>
  800f2d:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800f30:	8d 78 ff             	lea    -0x1(%rax),%edi
  800f33:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800f36:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f3a:	ba 00 00 00 00       	mov    $0x0,%edx
  800f3f:	48 f7 f6             	div    %rsi
  800f42:	49 89 c2             	mov    %rax,%r10
  800f45:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800f48:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  800f4b:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  800f4f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800f53:	41 89 c9             	mov    %ecx,%r9d
  800f56:	41 89 f8             	mov    %edi,%r8d
  800f59:	89 d1                	mov    %edx,%ecx
  800f5b:	4c 89 d2             	mov    %r10,%rdx
  800f5e:	48 89 c7             	mov    %rax,%rdi
  800f61:	48 b8 05 0f 80 00 00 	movabs $0x800f05,%rax
  800f68:	00 00 00 
  800f6b:	ff d0                	callq  *%rax
  800f6d:	eb 1c                	jmp    800f8b <printnum+0x86>
  800f6f:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800f73:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800f76:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800f7a:	48 89 ce             	mov    %rcx,%rsi
  800f7d:	89 d7                	mov    %edx,%edi
  800f7f:	ff d0                	callq  *%rax
  800f81:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  800f85:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  800f89:	7f e4                	jg     800f6f <printnum+0x6a>
  800f8b:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800f8e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f92:	ba 00 00 00 00       	mov    $0x0,%edx
  800f97:	48 f7 f1             	div    %rcx
  800f9a:	48 b8 10 59 80 00 00 	movabs $0x805910,%rax
  800fa1:	00 00 00 
  800fa4:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  800fa8:	0f be d0             	movsbl %al,%edx
  800fab:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800faf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800fb3:	48 89 ce             	mov    %rcx,%rsi
  800fb6:	89 d7                	mov    %edx,%edi
  800fb8:	ff d0                	callq  *%rax
  800fba:	90                   	nop
  800fbb:	c9                   	leaveq 
  800fbc:	c3                   	retq   

0000000000800fbd <getuint>:
  800fbd:	55                   	push   %rbp
  800fbe:	48 89 e5             	mov    %rsp,%rbp
  800fc1:	48 83 ec 20          	sub    $0x20,%rsp
  800fc5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fc9:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800fcc:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800fd0:	7e 4f                	jle    801021 <getuint+0x64>
  800fd2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fd6:	8b 00                	mov    (%rax),%eax
  800fd8:	83 f8 30             	cmp    $0x30,%eax
  800fdb:	73 24                	jae    801001 <getuint+0x44>
  800fdd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fe1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800fe5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fe9:	8b 00                	mov    (%rax),%eax
  800feb:	89 c0                	mov    %eax,%eax
  800fed:	48 01 d0             	add    %rdx,%rax
  800ff0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ff4:	8b 12                	mov    (%rdx),%edx
  800ff6:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800ff9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ffd:	89 0a                	mov    %ecx,(%rdx)
  800fff:	eb 14                	jmp    801015 <getuint+0x58>
  801001:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801005:	48 8b 40 08          	mov    0x8(%rax),%rax
  801009:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80100d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801011:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801015:	48 8b 00             	mov    (%rax),%rax
  801018:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80101c:	e9 9d 00 00 00       	jmpq   8010be <getuint+0x101>
  801021:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  801025:	74 4c                	je     801073 <getuint+0xb6>
  801027:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80102b:	8b 00                	mov    (%rax),%eax
  80102d:	83 f8 30             	cmp    $0x30,%eax
  801030:	73 24                	jae    801056 <getuint+0x99>
  801032:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801036:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80103a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80103e:	8b 00                	mov    (%rax),%eax
  801040:	89 c0                	mov    %eax,%eax
  801042:	48 01 d0             	add    %rdx,%rax
  801045:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801049:	8b 12                	mov    (%rdx),%edx
  80104b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80104e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801052:	89 0a                	mov    %ecx,(%rdx)
  801054:	eb 14                	jmp    80106a <getuint+0xad>
  801056:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80105a:	48 8b 40 08          	mov    0x8(%rax),%rax
  80105e:	48 8d 48 08          	lea    0x8(%rax),%rcx
  801062:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801066:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80106a:	48 8b 00             	mov    (%rax),%rax
  80106d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801071:	eb 4b                	jmp    8010be <getuint+0x101>
  801073:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801077:	8b 00                	mov    (%rax),%eax
  801079:	83 f8 30             	cmp    $0x30,%eax
  80107c:	73 24                	jae    8010a2 <getuint+0xe5>
  80107e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801082:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801086:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80108a:	8b 00                	mov    (%rax),%eax
  80108c:	89 c0                	mov    %eax,%eax
  80108e:	48 01 d0             	add    %rdx,%rax
  801091:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801095:	8b 12                	mov    (%rdx),%edx
  801097:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80109a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80109e:	89 0a                	mov    %ecx,(%rdx)
  8010a0:	eb 14                	jmp    8010b6 <getuint+0xf9>
  8010a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010a6:	48 8b 40 08          	mov    0x8(%rax),%rax
  8010aa:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8010ae:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010b2:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8010b6:	8b 00                	mov    (%rax),%eax
  8010b8:	89 c0                	mov    %eax,%eax
  8010ba:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8010be:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010c2:	c9                   	leaveq 
  8010c3:	c3                   	retq   

00000000008010c4 <getint>:
  8010c4:	55                   	push   %rbp
  8010c5:	48 89 e5             	mov    %rsp,%rbp
  8010c8:	48 83 ec 20          	sub    $0x20,%rsp
  8010cc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010d0:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8010d3:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8010d7:	7e 4f                	jle    801128 <getint+0x64>
  8010d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010dd:	8b 00                	mov    (%rax),%eax
  8010df:	83 f8 30             	cmp    $0x30,%eax
  8010e2:	73 24                	jae    801108 <getint+0x44>
  8010e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010e8:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8010ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010f0:	8b 00                	mov    (%rax),%eax
  8010f2:	89 c0                	mov    %eax,%eax
  8010f4:	48 01 d0             	add    %rdx,%rax
  8010f7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010fb:	8b 12                	mov    (%rdx),%edx
  8010fd:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801100:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801104:	89 0a                	mov    %ecx,(%rdx)
  801106:	eb 14                	jmp    80111c <getint+0x58>
  801108:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80110c:	48 8b 40 08          	mov    0x8(%rax),%rax
  801110:	48 8d 48 08          	lea    0x8(%rax),%rcx
  801114:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801118:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80111c:	48 8b 00             	mov    (%rax),%rax
  80111f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801123:	e9 9d 00 00 00       	jmpq   8011c5 <getint+0x101>
  801128:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80112c:	74 4c                	je     80117a <getint+0xb6>
  80112e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801132:	8b 00                	mov    (%rax),%eax
  801134:	83 f8 30             	cmp    $0x30,%eax
  801137:	73 24                	jae    80115d <getint+0x99>
  801139:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80113d:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801141:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801145:	8b 00                	mov    (%rax),%eax
  801147:	89 c0                	mov    %eax,%eax
  801149:	48 01 d0             	add    %rdx,%rax
  80114c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801150:	8b 12                	mov    (%rdx),%edx
  801152:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801155:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801159:	89 0a                	mov    %ecx,(%rdx)
  80115b:	eb 14                	jmp    801171 <getint+0xad>
  80115d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801161:	48 8b 40 08          	mov    0x8(%rax),%rax
  801165:	48 8d 48 08          	lea    0x8(%rax),%rcx
  801169:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80116d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801171:	48 8b 00             	mov    (%rax),%rax
  801174:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801178:	eb 4b                	jmp    8011c5 <getint+0x101>
  80117a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80117e:	8b 00                	mov    (%rax),%eax
  801180:	83 f8 30             	cmp    $0x30,%eax
  801183:	73 24                	jae    8011a9 <getint+0xe5>
  801185:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801189:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80118d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801191:	8b 00                	mov    (%rax),%eax
  801193:	89 c0                	mov    %eax,%eax
  801195:	48 01 d0             	add    %rdx,%rax
  801198:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80119c:	8b 12                	mov    (%rdx),%edx
  80119e:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8011a1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011a5:	89 0a                	mov    %ecx,(%rdx)
  8011a7:	eb 14                	jmp    8011bd <getint+0xf9>
  8011a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011ad:	48 8b 40 08          	mov    0x8(%rax),%rax
  8011b1:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8011b5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011b9:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8011bd:	8b 00                	mov    (%rax),%eax
  8011bf:	48 98                	cltq   
  8011c1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011c9:	c9                   	leaveq 
  8011ca:	c3                   	retq   

00000000008011cb <vprintfmt>:
  8011cb:	55                   	push   %rbp
  8011cc:	48 89 e5             	mov    %rsp,%rbp
  8011cf:	41 54                	push   %r12
  8011d1:	53                   	push   %rbx
  8011d2:	48 83 ec 60          	sub    $0x60,%rsp
  8011d6:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8011da:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8011de:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8011e2:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8011e6:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8011ea:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8011ee:	48 8b 0a             	mov    (%rdx),%rcx
  8011f1:	48 89 08             	mov    %rcx,(%rax)
  8011f4:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8011f8:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8011fc:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801200:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801204:	eb 17                	jmp    80121d <vprintfmt+0x52>
  801206:	85 db                	test   %ebx,%ebx
  801208:	0f 84 b9 04 00 00    	je     8016c7 <vprintfmt+0x4fc>
  80120e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801212:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801216:	48 89 d6             	mov    %rdx,%rsi
  801219:	89 df                	mov    %ebx,%edi
  80121b:	ff d0                	callq  *%rax
  80121d:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801221:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801225:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  801229:	0f b6 00             	movzbl (%rax),%eax
  80122c:	0f b6 d8             	movzbl %al,%ebx
  80122f:	83 fb 25             	cmp    $0x25,%ebx
  801232:	75 d2                	jne    801206 <vprintfmt+0x3b>
  801234:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  801238:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  80123f:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  801246:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80124d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  801254:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801258:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80125c:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  801260:	0f b6 00             	movzbl (%rax),%eax
  801263:	0f b6 d8             	movzbl %al,%ebx
  801266:	8d 43 dd             	lea    -0x23(%rbx),%eax
  801269:	83 f8 55             	cmp    $0x55,%eax
  80126c:	0f 87 22 04 00 00    	ja     801694 <vprintfmt+0x4c9>
  801272:	89 c0                	mov    %eax,%eax
  801274:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80127b:	00 
  80127c:	48 b8 38 59 80 00 00 	movabs $0x805938,%rax
  801283:	00 00 00 
  801286:	48 01 d0             	add    %rdx,%rax
  801289:	48 8b 00             	mov    (%rax),%rax
  80128c:	ff e0                	jmpq   *%rax
  80128e:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  801292:	eb c0                	jmp    801254 <vprintfmt+0x89>
  801294:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  801298:	eb ba                	jmp    801254 <vprintfmt+0x89>
  80129a:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8012a1:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8012a4:	89 d0                	mov    %edx,%eax
  8012a6:	c1 e0 02             	shl    $0x2,%eax
  8012a9:	01 d0                	add    %edx,%eax
  8012ab:	01 c0                	add    %eax,%eax
  8012ad:	01 d8                	add    %ebx,%eax
  8012af:	83 e8 30             	sub    $0x30,%eax
  8012b2:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8012b5:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8012b9:	0f b6 00             	movzbl (%rax),%eax
  8012bc:	0f be d8             	movsbl %al,%ebx
  8012bf:	83 fb 2f             	cmp    $0x2f,%ebx
  8012c2:	7e 60                	jle    801324 <vprintfmt+0x159>
  8012c4:	83 fb 39             	cmp    $0x39,%ebx
  8012c7:	7f 5b                	jg     801324 <vprintfmt+0x159>
  8012c9:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8012ce:	eb d1                	jmp    8012a1 <vprintfmt+0xd6>
  8012d0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8012d3:	83 f8 30             	cmp    $0x30,%eax
  8012d6:	73 17                	jae    8012ef <vprintfmt+0x124>
  8012d8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8012dc:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8012df:	89 d2                	mov    %edx,%edx
  8012e1:	48 01 d0             	add    %rdx,%rax
  8012e4:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8012e7:	83 c2 08             	add    $0x8,%edx
  8012ea:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8012ed:	eb 0c                	jmp    8012fb <vprintfmt+0x130>
  8012ef:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8012f3:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8012f7:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8012fb:	8b 00                	mov    (%rax),%eax
  8012fd:	89 45 d8             	mov    %eax,-0x28(%rbp)
  801300:	eb 23                	jmp    801325 <vprintfmt+0x15a>
  801302:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801306:	0f 89 48 ff ff ff    	jns    801254 <vprintfmt+0x89>
  80130c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  801313:	e9 3c ff ff ff       	jmpq   801254 <vprintfmt+0x89>
  801318:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  80131f:	e9 30 ff ff ff       	jmpq   801254 <vprintfmt+0x89>
  801324:	90                   	nop
  801325:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801329:	0f 89 25 ff ff ff    	jns    801254 <vprintfmt+0x89>
  80132f:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801332:	89 45 dc             	mov    %eax,-0x24(%rbp)
  801335:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80133c:	e9 13 ff ff ff       	jmpq   801254 <vprintfmt+0x89>
  801341:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  801345:	e9 0a ff ff ff       	jmpq   801254 <vprintfmt+0x89>
  80134a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80134d:	83 f8 30             	cmp    $0x30,%eax
  801350:	73 17                	jae    801369 <vprintfmt+0x19e>
  801352:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801356:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801359:	89 d2                	mov    %edx,%edx
  80135b:	48 01 d0             	add    %rdx,%rax
  80135e:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801361:	83 c2 08             	add    $0x8,%edx
  801364:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801367:	eb 0c                	jmp    801375 <vprintfmt+0x1aa>
  801369:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80136d:	48 8d 50 08          	lea    0x8(%rax),%rdx
  801371:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801375:	8b 10                	mov    (%rax),%edx
  801377:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  80137b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80137f:	48 89 ce             	mov    %rcx,%rsi
  801382:	89 d7                	mov    %edx,%edi
  801384:	ff d0                	callq  *%rax
  801386:	e9 37 03 00 00       	jmpq   8016c2 <vprintfmt+0x4f7>
  80138b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80138e:	83 f8 30             	cmp    $0x30,%eax
  801391:	73 17                	jae    8013aa <vprintfmt+0x1df>
  801393:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801397:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80139a:	89 d2                	mov    %edx,%edx
  80139c:	48 01 d0             	add    %rdx,%rax
  80139f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8013a2:	83 c2 08             	add    $0x8,%edx
  8013a5:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8013a8:	eb 0c                	jmp    8013b6 <vprintfmt+0x1eb>
  8013aa:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8013ae:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8013b2:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8013b6:	8b 18                	mov    (%rax),%ebx
  8013b8:	85 db                	test   %ebx,%ebx
  8013ba:	79 02                	jns    8013be <vprintfmt+0x1f3>
  8013bc:	f7 db                	neg    %ebx
  8013be:	83 fb 15             	cmp    $0x15,%ebx
  8013c1:	7f 16                	jg     8013d9 <vprintfmt+0x20e>
  8013c3:	48 b8 60 58 80 00 00 	movabs $0x805860,%rax
  8013ca:	00 00 00 
  8013cd:	48 63 d3             	movslq %ebx,%rdx
  8013d0:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  8013d4:	4d 85 e4             	test   %r12,%r12
  8013d7:	75 2e                	jne    801407 <vprintfmt+0x23c>
  8013d9:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8013dd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8013e1:	89 d9                	mov    %ebx,%ecx
  8013e3:	48 ba 21 59 80 00 00 	movabs $0x805921,%rdx
  8013ea:	00 00 00 
  8013ed:	48 89 c7             	mov    %rax,%rdi
  8013f0:	b8 00 00 00 00       	mov    $0x0,%eax
  8013f5:	49 b8 d1 16 80 00 00 	movabs $0x8016d1,%r8
  8013fc:	00 00 00 
  8013ff:	41 ff d0             	callq  *%r8
  801402:	e9 bb 02 00 00       	jmpq   8016c2 <vprintfmt+0x4f7>
  801407:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80140b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80140f:	4c 89 e1             	mov    %r12,%rcx
  801412:	48 ba 2a 59 80 00 00 	movabs $0x80592a,%rdx
  801419:	00 00 00 
  80141c:	48 89 c7             	mov    %rax,%rdi
  80141f:	b8 00 00 00 00       	mov    $0x0,%eax
  801424:	49 b8 d1 16 80 00 00 	movabs $0x8016d1,%r8
  80142b:	00 00 00 
  80142e:	41 ff d0             	callq  *%r8
  801431:	e9 8c 02 00 00       	jmpq   8016c2 <vprintfmt+0x4f7>
  801436:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801439:	83 f8 30             	cmp    $0x30,%eax
  80143c:	73 17                	jae    801455 <vprintfmt+0x28a>
  80143e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801442:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801445:	89 d2                	mov    %edx,%edx
  801447:	48 01 d0             	add    %rdx,%rax
  80144a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80144d:	83 c2 08             	add    $0x8,%edx
  801450:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801453:	eb 0c                	jmp    801461 <vprintfmt+0x296>
  801455:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801459:	48 8d 50 08          	lea    0x8(%rax),%rdx
  80145d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801461:	4c 8b 20             	mov    (%rax),%r12
  801464:	4d 85 e4             	test   %r12,%r12
  801467:	75 0a                	jne    801473 <vprintfmt+0x2a8>
  801469:	49 bc 2d 59 80 00 00 	movabs $0x80592d,%r12
  801470:	00 00 00 
  801473:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801477:	7e 78                	jle    8014f1 <vprintfmt+0x326>
  801479:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  80147d:	74 72                	je     8014f1 <vprintfmt+0x326>
  80147f:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801482:	48 98                	cltq   
  801484:	48 89 c6             	mov    %rax,%rsi
  801487:	4c 89 e7             	mov    %r12,%rdi
  80148a:	48 b8 7f 19 80 00 00 	movabs $0x80197f,%rax
  801491:	00 00 00 
  801494:	ff d0                	callq  *%rax
  801496:	29 45 dc             	sub    %eax,-0x24(%rbp)
  801499:	eb 17                	jmp    8014b2 <vprintfmt+0x2e7>
  80149b:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  80149f:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8014a3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8014a7:	48 89 ce             	mov    %rcx,%rsi
  8014aa:	89 d7                	mov    %edx,%edi
  8014ac:	ff d0                	callq  *%rax
  8014ae:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8014b2:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8014b6:	7f e3                	jg     80149b <vprintfmt+0x2d0>
  8014b8:	eb 37                	jmp    8014f1 <vprintfmt+0x326>
  8014ba:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  8014be:	74 1e                	je     8014de <vprintfmt+0x313>
  8014c0:	83 fb 1f             	cmp    $0x1f,%ebx
  8014c3:	7e 05                	jle    8014ca <vprintfmt+0x2ff>
  8014c5:	83 fb 7e             	cmp    $0x7e,%ebx
  8014c8:	7e 14                	jle    8014de <vprintfmt+0x313>
  8014ca:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8014ce:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8014d2:	48 89 d6             	mov    %rdx,%rsi
  8014d5:	bf 3f 00 00 00       	mov    $0x3f,%edi
  8014da:	ff d0                	callq  *%rax
  8014dc:	eb 0f                	jmp    8014ed <vprintfmt+0x322>
  8014de:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8014e2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8014e6:	48 89 d6             	mov    %rdx,%rsi
  8014e9:	89 df                	mov    %ebx,%edi
  8014eb:	ff d0                	callq  *%rax
  8014ed:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8014f1:	4c 89 e0             	mov    %r12,%rax
  8014f4:	4c 8d 60 01          	lea    0x1(%rax),%r12
  8014f8:	0f b6 00             	movzbl (%rax),%eax
  8014fb:	0f be d8             	movsbl %al,%ebx
  8014fe:	85 db                	test   %ebx,%ebx
  801500:	74 28                	je     80152a <vprintfmt+0x35f>
  801502:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801506:	78 b2                	js     8014ba <vprintfmt+0x2ef>
  801508:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  80150c:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801510:	79 a8                	jns    8014ba <vprintfmt+0x2ef>
  801512:	eb 16                	jmp    80152a <vprintfmt+0x35f>
  801514:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801518:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80151c:	48 89 d6             	mov    %rdx,%rsi
  80151f:	bf 20 00 00 00       	mov    $0x20,%edi
  801524:	ff d0                	callq  *%rax
  801526:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  80152a:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80152e:	7f e4                	jg     801514 <vprintfmt+0x349>
  801530:	e9 8d 01 00 00       	jmpq   8016c2 <vprintfmt+0x4f7>
  801535:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801539:	be 03 00 00 00       	mov    $0x3,%esi
  80153e:	48 89 c7             	mov    %rax,%rdi
  801541:	48 b8 c4 10 80 00 00 	movabs $0x8010c4,%rax
  801548:	00 00 00 
  80154b:	ff d0                	callq  *%rax
  80154d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801551:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801555:	48 85 c0             	test   %rax,%rax
  801558:	79 1d                	jns    801577 <vprintfmt+0x3ac>
  80155a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80155e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801562:	48 89 d6             	mov    %rdx,%rsi
  801565:	bf 2d 00 00 00       	mov    $0x2d,%edi
  80156a:	ff d0                	callq  *%rax
  80156c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801570:	48 f7 d8             	neg    %rax
  801573:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801577:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  80157e:	e9 d2 00 00 00       	jmpq   801655 <vprintfmt+0x48a>
  801583:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801587:	be 03 00 00 00       	mov    $0x3,%esi
  80158c:	48 89 c7             	mov    %rax,%rdi
  80158f:	48 b8 bd 0f 80 00 00 	movabs $0x800fbd,%rax
  801596:	00 00 00 
  801599:	ff d0                	callq  *%rax
  80159b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80159f:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8015a6:	e9 aa 00 00 00       	jmpq   801655 <vprintfmt+0x48a>
  8015ab:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8015af:	be 03 00 00 00       	mov    $0x3,%esi
  8015b4:	48 89 c7             	mov    %rax,%rdi
  8015b7:	48 b8 bd 0f 80 00 00 	movabs $0x800fbd,%rax
  8015be:	00 00 00 
  8015c1:	ff d0                	callq  *%rax
  8015c3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8015c7:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  8015ce:	e9 82 00 00 00       	jmpq   801655 <vprintfmt+0x48a>
  8015d3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8015d7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8015db:	48 89 d6             	mov    %rdx,%rsi
  8015de:	bf 30 00 00 00       	mov    $0x30,%edi
  8015e3:	ff d0                	callq  *%rax
  8015e5:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8015e9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8015ed:	48 89 d6             	mov    %rdx,%rsi
  8015f0:	bf 78 00 00 00       	mov    $0x78,%edi
  8015f5:	ff d0                	callq  *%rax
  8015f7:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8015fa:	83 f8 30             	cmp    $0x30,%eax
  8015fd:	73 17                	jae    801616 <vprintfmt+0x44b>
  8015ff:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801603:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801606:	89 d2                	mov    %edx,%edx
  801608:	48 01 d0             	add    %rdx,%rax
  80160b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80160e:	83 c2 08             	add    $0x8,%edx
  801611:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801614:	eb 0c                	jmp    801622 <vprintfmt+0x457>
  801616:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80161a:	48 8d 50 08          	lea    0x8(%rax),%rdx
  80161e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801622:	48 8b 00             	mov    (%rax),%rax
  801625:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801629:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801630:	eb 23                	jmp    801655 <vprintfmt+0x48a>
  801632:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801636:	be 03 00 00 00       	mov    $0x3,%esi
  80163b:	48 89 c7             	mov    %rax,%rdi
  80163e:	48 b8 bd 0f 80 00 00 	movabs $0x800fbd,%rax
  801645:	00 00 00 
  801648:	ff d0                	callq  *%rax
  80164a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80164e:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801655:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  80165a:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80165d:	8b 7d dc             	mov    -0x24(%rbp),%edi
  801660:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801664:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801668:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80166c:	45 89 c1             	mov    %r8d,%r9d
  80166f:	41 89 f8             	mov    %edi,%r8d
  801672:	48 89 c7             	mov    %rax,%rdi
  801675:	48 b8 05 0f 80 00 00 	movabs $0x800f05,%rax
  80167c:	00 00 00 
  80167f:	ff d0                	callq  *%rax
  801681:	eb 3f                	jmp    8016c2 <vprintfmt+0x4f7>
  801683:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801687:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80168b:	48 89 d6             	mov    %rdx,%rsi
  80168e:	89 df                	mov    %ebx,%edi
  801690:	ff d0                	callq  *%rax
  801692:	eb 2e                	jmp    8016c2 <vprintfmt+0x4f7>
  801694:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801698:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80169c:	48 89 d6             	mov    %rdx,%rsi
  80169f:	bf 25 00 00 00       	mov    $0x25,%edi
  8016a4:	ff d0                	callq  *%rax
  8016a6:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8016ab:	eb 05                	jmp    8016b2 <vprintfmt+0x4e7>
  8016ad:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8016b2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8016b6:	48 83 e8 01          	sub    $0x1,%rax
  8016ba:	0f b6 00             	movzbl (%rax),%eax
  8016bd:	3c 25                	cmp    $0x25,%al
  8016bf:	75 ec                	jne    8016ad <vprintfmt+0x4e2>
  8016c1:	90                   	nop
  8016c2:	e9 3d fb ff ff       	jmpq   801204 <vprintfmt+0x39>
  8016c7:	90                   	nop
  8016c8:	48 83 c4 60          	add    $0x60,%rsp
  8016cc:	5b                   	pop    %rbx
  8016cd:	41 5c                	pop    %r12
  8016cf:	5d                   	pop    %rbp
  8016d0:	c3                   	retq   

00000000008016d1 <printfmt>:
  8016d1:	55                   	push   %rbp
  8016d2:	48 89 e5             	mov    %rsp,%rbp
  8016d5:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  8016dc:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  8016e3:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  8016ea:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  8016f1:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8016f8:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8016ff:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801706:	84 c0                	test   %al,%al
  801708:	74 20                	je     80172a <printfmt+0x59>
  80170a:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80170e:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801712:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801716:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80171a:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80171e:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801722:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801726:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80172a:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801731:	00 00 00 
  801734:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  80173b:	00 00 00 
  80173e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801742:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801749:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801750:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  801757:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  80175e:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  801765:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  80176c:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  801773:	48 89 c7             	mov    %rax,%rdi
  801776:	48 b8 cb 11 80 00 00 	movabs $0x8011cb,%rax
  80177d:	00 00 00 
  801780:	ff d0                	callq  *%rax
  801782:	90                   	nop
  801783:	c9                   	leaveq 
  801784:	c3                   	retq   

0000000000801785 <sprintputch>:
  801785:	55                   	push   %rbp
  801786:	48 89 e5             	mov    %rsp,%rbp
  801789:	48 83 ec 10          	sub    $0x10,%rsp
  80178d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801790:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801794:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801798:	8b 40 10             	mov    0x10(%rax),%eax
  80179b:	8d 50 01             	lea    0x1(%rax),%edx
  80179e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017a2:	89 50 10             	mov    %edx,0x10(%rax)
  8017a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017a9:	48 8b 10             	mov    (%rax),%rdx
  8017ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017b0:	48 8b 40 08          	mov    0x8(%rax),%rax
  8017b4:	48 39 c2             	cmp    %rax,%rdx
  8017b7:	73 17                	jae    8017d0 <sprintputch+0x4b>
  8017b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017bd:	48 8b 00             	mov    (%rax),%rax
  8017c0:	48 8d 48 01          	lea    0x1(%rax),%rcx
  8017c4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8017c8:	48 89 0a             	mov    %rcx,(%rdx)
  8017cb:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8017ce:	88 10                	mov    %dl,(%rax)
  8017d0:	90                   	nop
  8017d1:	c9                   	leaveq 
  8017d2:	c3                   	retq   

00000000008017d3 <vsnprintf>:
  8017d3:	55                   	push   %rbp
  8017d4:	48 89 e5             	mov    %rsp,%rbp
  8017d7:	48 83 ec 50          	sub    $0x50,%rsp
  8017db:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8017df:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  8017e2:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  8017e6:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  8017ea:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8017ee:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  8017f2:	48 8b 0a             	mov    (%rdx),%rcx
  8017f5:	48 89 08             	mov    %rcx,(%rax)
  8017f8:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8017fc:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801800:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801804:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801808:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80180c:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801810:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801813:	48 98                	cltq   
  801815:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801819:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80181d:	48 01 d0             	add    %rdx,%rax
  801820:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801824:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80182b:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  801830:	74 06                	je     801838 <vsnprintf+0x65>
  801832:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801836:	7f 07                	jg     80183f <vsnprintf+0x6c>
  801838:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80183d:	eb 2f                	jmp    80186e <vsnprintf+0x9b>
  80183f:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801843:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801847:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80184b:	48 89 c6             	mov    %rax,%rsi
  80184e:	48 bf 85 17 80 00 00 	movabs $0x801785,%rdi
  801855:	00 00 00 
  801858:	48 b8 cb 11 80 00 00 	movabs $0x8011cb,%rax
  80185f:	00 00 00 
  801862:	ff d0                	callq  *%rax
  801864:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801868:	c6 00 00             	movb   $0x0,(%rax)
  80186b:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80186e:	c9                   	leaveq 
  80186f:	c3                   	retq   

0000000000801870 <snprintf>:
  801870:	55                   	push   %rbp
  801871:	48 89 e5             	mov    %rsp,%rbp
  801874:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  80187b:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  801882:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801888:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  80188f:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801896:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80189d:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8018a4:	84 c0                	test   %al,%al
  8018a6:	74 20                	je     8018c8 <snprintf+0x58>
  8018a8:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8018ac:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8018b0:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8018b4:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8018b8:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8018bc:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8018c0:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8018c4:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8018c8:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8018cf:	00 00 00 
  8018d2:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8018d9:	00 00 00 
  8018dc:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8018e0:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8018e7:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8018ee:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8018f5:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8018fc:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801903:	48 8b 0a             	mov    (%rdx),%rcx
  801906:	48 89 08             	mov    %rcx,(%rax)
  801909:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80190d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801911:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801915:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801919:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  801920:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801927:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80192d:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801934:	48 89 c7             	mov    %rax,%rdi
  801937:	48 b8 d3 17 80 00 00 	movabs $0x8017d3,%rax
  80193e:	00 00 00 
  801941:	ff d0                	callq  *%rax
  801943:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801949:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80194f:	c9                   	leaveq 
  801950:	c3                   	retq   

0000000000801951 <strlen>:
  801951:	55                   	push   %rbp
  801952:	48 89 e5             	mov    %rsp,%rbp
  801955:	48 83 ec 18          	sub    $0x18,%rsp
  801959:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80195d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801964:	eb 09                	jmp    80196f <strlen+0x1e>
  801966:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80196a:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80196f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801973:	0f b6 00             	movzbl (%rax),%eax
  801976:	84 c0                	test   %al,%al
  801978:	75 ec                	jne    801966 <strlen+0x15>
  80197a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80197d:	c9                   	leaveq 
  80197e:	c3                   	retq   

000000000080197f <strnlen>:
  80197f:	55                   	push   %rbp
  801980:	48 89 e5             	mov    %rsp,%rbp
  801983:	48 83 ec 20          	sub    $0x20,%rsp
  801987:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80198b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80198f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801996:	eb 0e                	jmp    8019a6 <strnlen+0x27>
  801998:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80199c:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8019a1:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8019a6:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8019ab:	74 0b                	je     8019b8 <strnlen+0x39>
  8019ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019b1:	0f b6 00             	movzbl (%rax),%eax
  8019b4:	84 c0                	test   %al,%al
  8019b6:	75 e0                	jne    801998 <strnlen+0x19>
  8019b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019bb:	c9                   	leaveq 
  8019bc:	c3                   	retq   

00000000008019bd <strcpy>:
  8019bd:	55                   	push   %rbp
  8019be:	48 89 e5             	mov    %rsp,%rbp
  8019c1:	48 83 ec 20          	sub    $0x20,%rsp
  8019c5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8019c9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8019cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019d1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8019d5:	90                   	nop
  8019d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019da:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8019de:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8019e2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8019e6:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8019ea:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8019ee:	0f b6 12             	movzbl (%rdx),%edx
  8019f1:	88 10                	mov    %dl,(%rax)
  8019f3:	0f b6 00             	movzbl (%rax),%eax
  8019f6:	84 c0                	test   %al,%al
  8019f8:	75 dc                	jne    8019d6 <strcpy+0x19>
  8019fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8019fe:	c9                   	leaveq 
  8019ff:	c3                   	retq   

0000000000801a00 <strcat>:
  801a00:	55                   	push   %rbp
  801a01:	48 89 e5             	mov    %rsp,%rbp
  801a04:	48 83 ec 20          	sub    $0x20,%rsp
  801a08:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801a0c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801a10:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a14:	48 89 c7             	mov    %rax,%rdi
  801a17:	48 b8 51 19 80 00 00 	movabs $0x801951,%rax
  801a1e:	00 00 00 
  801a21:	ff d0                	callq  *%rax
  801a23:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801a26:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a29:	48 63 d0             	movslq %eax,%rdx
  801a2c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a30:	48 01 c2             	add    %rax,%rdx
  801a33:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801a37:	48 89 c6             	mov    %rax,%rsi
  801a3a:	48 89 d7             	mov    %rdx,%rdi
  801a3d:	48 b8 bd 19 80 00 00 	movabs $0x8019bd,%rax
  801a44:	00 00 00 
  801a47:	ff d0                	callq  *%rax
  801a49:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a4d:	c9                   	leaveq 
  801a4e:	c3                   	retq   

0000000000801a4f <strncpy>:
  801a4f:	55                   	push   %rbp
  801a50:	48 89 e5             	mov    %rsp,%rbp
  801a53:	48 83 ec 28          	sub    $0x28,%rsp
  801a57:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801a5b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801a5f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801a63:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a67:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801a6b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801a72:	00 
  801a73:	eb 2a                	jmp    801a9f <strncpy+0x50>
  801a75:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a79:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801a7d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801a81:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801a85:	0f b6 12             	movzbl (%rdx),%edx
  801a88:	88 10                	mov    %dl,(%rax)
  801a8a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801a8e:	0f b6 00             	movzbl (%rax),%eax
  801a91:	84 c0                	test   %al,%al
  801a93:	74 05                	je     801a9a <strncpy+0x4b>
  801a95:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801a9a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801a9f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801aa3:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801aa7:	72 cc                	jb     801a75 <strncpy+0x26>
  801aa9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801aad:	c9                   	leaveq 
  801aae:	c3                   	retq   

0000000000801aaf <strlcpy>:
  801aaf:	55                   	push   %rbp
  801ab0:	48 89 e5             	mov    %rsp,%rbp
  801ab3:	48 83 ec 28          	sub    $0x28,%rsp
  801ab7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801abb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801abf:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801ac3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ac7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801acb:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801ad0:	74 3d                	je     801b0f <strlcpy+0x60>
  801ad2:	eb 1d                	jmp    801af1 <strlcpy+0x42>
  801ad4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ad8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801adc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801ae0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801ae4:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801ae8:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801aec:	0f b6 12             	movzbl (%rdx),%edx
  801aef:	88 10                	mov    %dl,(%rax)
  801af1:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801af6:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801afb:	74 0b                	je     801b08 <strlcpy+0x59>
  801afd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801b01:	0f b6 00             	movzbl (%rax),%eax
  801b04:	84 c0                	test   %al,%al
  801b06:	75 cc                	jne    801ad4 <strlcpy+0x25>
  801b08:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b0c:	c6 00 00             	movb   $0x0,(%rax)
  801b0f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801b13:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b17:	48 29 c2             	sub    %rax,%rdx
  801b1a:	48 89 d0             	mov    %rdx,%rax
  801b1d:	c9                   	leaveq 
  801b1e:	c3                   	retq   

0000000000801b1f <strcmp>:
  801b1f:	55                   	push   %rbp
  801b20:	48 89 e5             	mov    %rsp,%rbp
  801b23:	48 83 ec 10          	sub    $0x10,%rsp
  801b27:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b2b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b2f:	eb 0a                	jmp    801b3b <strcmp+0x1c>
  801b31:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801b36:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801b3b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b3f:	0f b6 00             	movzbl (%rax),%eax
  801b42:	84 c0                	test   %al,%al
  801b44:	74 12                	je     801b58 <strcmp+0x39>
  801b46:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b4a:	0f b6 10             	movzbl (%rax),%edx
  801b4d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801b51:	0f b6 00             	movzbl (%rax),%eax
  801b54:	38 c2                	cmp    %al,%dl
  801b56:	74 d9                	je     801b31 <strcmp+0x12>
  801b58:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b5c:	0f b6 00             	movzbl (%rax),%eax
  801b5f:	0f b6 d0             	movzbl %al,%edx
  801b62:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801b66:	0f b6 00             	movzbl (%rax),%eax
  801b69:	0f b6 c0             	movzbl %al,%eax
  801b6c:	29 c2                	sub    %eax,%edx
  801b6e:	89 d0                	mov    %edx,%eax
  801b70:	c9                   	leaveq 
  801b71:	c3                   	retq   

0000000000801b72 <strncmp>:
  801b72:	55                   	push   %rbp
  801b73:	48 89 e5             	mov    %rsp,%rbp
  801b76:	48 83 ec 18          	sub    $0x18,%rsp
  801b7a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b7e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b82:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b86:	eb 0f                	jmp    801b97 <strncmp+0x25>
  801b88:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801b8d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801b92:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801b97:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801b9c:	74 1d                	je     801bbb <strncmp+0x49>
  801b9e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ba2:	0f b6 00             	movzbl (%rax),%eax
  801ba5:	84 c0                	test   %al,%al
  801ba7:	74 12                	je     801bbb <strncmp+0x49>
  801ba9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bad:	0f b6 10             	movzbl (%rax),%edx
  801bb0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801bb4:	0f b6 00             	movzbl (%rax),%eax
  801bb7:	38 c2                	cmp    %al,%dl
  801bb9:	74 cd                	je     801b88 <strncmp+0x16>
  801bbb:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801bc0:	75 07                	jne    801bc9 <strncmp+0x57>
  801bc2:	b8 00 00 00 00       	mov    $0x0,%eax
  801bc7:	eb 18                	jmp    801be1 <strncmp+0x6f>
  801bc9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bcd:	0f b6 00             	movzbl (%rax),%eax
  801bd0:	0f b6 d0             	movzbl %al,%edx
  801bd3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801bd7:	0f b6 00             	movzbl (%rax),%eax
  801bda:	0f b6 c0             	movzbl %al,%eax
  801bdd:	29 c2                	sub    %eax,%edx
  801bdf:	89 d0                	mov    %edx,%eax
  801be1:	c9                   	leaveq 
  801be2:	c3                   	retq   

0000000000801be3 <strchr>:
  801be3:	55                   	push   %rbp
  801be4:	48 89 e5             	mov    %rsp,%rbp
  801be7:	48 83 ec 10          	sub    $0x10,%rsp
  801beb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801bef:	89 f0                	mov    %esi,%eax
  801bf1:	88 45 f4             	mov    %al,-0xc(%rbp)
  801bf4:	eb 17                	jmp    801c0d <strchr+0x2a>
  801bf6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bfa:	0f b6 00             	movzbl (%rax),%eax
  801bfd:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801c00:	75 06                	jne    801c08 <strchr+0x25>
  801c02:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c06:	eb 15                	jmp    801c1d <strchr+0x3a>
  801c08:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801c0d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c11:	0f b6 00             	movzbl (%rax),%eax
  801c14:	84 c0                	test   %al,%al
  801c16:	75 de                	jne    801bf6 <strchr+0x13>
  801c18:	b8 00 00 00 00       	mov    $0x0,%eax
  801c1d:	c9                   	leaveq 
  801c1e:	c3                   	retq   

0000000000801c1f <strfind>:
  801c1f:	55                   	push   %rbp
  801c20:	48 89 e5             	mov    %rsp,%rbp
  801c23:	48 83 ec 10          	sub    $0x10,%rsp
  801c27:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c2b:	89 f0                	mov    %esi,%eax
  801c2d:	88 45 f4             	mov    %al,-0xc(%rbp)
  801c30:	eb 11                	jmp    801c43 <strfind+0x24>
  801c32:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c36:	0f b6 00             	movzbl (%rax),%eax
  801c39:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801c3c:	74 12                	je     801c50 <strfind+0x31>
  801c3e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801c43:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c47:	0f b6 00             	movzbl (%rax),%eax
  801c4a:	84 c0                	test   %al,%al
  801c4c:	75 e4                	jne    801c32 <strfind+0x13>
  801c4e:	eb 01                	jmp    801c51 <strfind+0x32>
  801c50:	90                   	nop
  801c51:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c55:	c9                   	leaveq 
  801c56:	c3                   	retq   

0000000000801c57 <memset>:
  801c57:	55                   	push   %rbp
  801c58:	48 89 e5             	mov    %rsp,%rbp
  801c5b:	48 83 ec 18          	sub    $0x18,%rsp
  801c5f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c63:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c66:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801c6a:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801c6f:	75 06                	jne    801c77 <memset+0x20>
  801c71:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c75:	eb 69                	jmp    801ce0 <memset+0x89>
  801c77:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c7b:	83 e0 03             	and    $0x3,%eax
  801c7e:	48 85 c0             	test   %rax,%rax
  801c81:	75 48                	jne    801ccb <memset+0x74>
  801c83:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c87:	83 e0 03             	and    $0x3,%eax
  801c8a:	48 85 c0             	test   %rax,%rax
  801c8d:	75 3c                	jne    801ccb <memset+0x74>
  801c8f:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801c96:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801c99:	c1 e0 18             	shl    $0x18,%eax
  801c9c:	89 c2                	mov    %eax,%edx
  801c9e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801ca1:	c1 e0 10             	shl    $0x10,%eax
  801ca4:	09 c2                	or     %eax,%edx
  801ca6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801ca9:	c1 e0 08             	shl    $0x8,%eax
  801cac:	09 d0                	or     %edx,%eax
  801cae:	09 45 f4             	or     %eax,-0xc(%rbp)
  801cb1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801cb5:	48 c1 e8 02          	shr    $0x2,%rax
  801cb9:	48 89 c1             	mov    %rax,%rcx
  801cbc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801cc0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801cc3:	48 89 d7             	mov    %rdx,%rdi
  801cc6:	fc                   	cld    
  801cc7:	f3 ab                	rep stos %eax,%es:(%rdi)
  801cc9:	eb 11                	jmp    801cdc <memset+0x85>
  801ccb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801ccf:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801cd2:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801cd6:	48 89 d7             	mov    %rdx,%rdi
  801cd9:	fc                   	cld    
  801cda:	f3 aa                	rep stos %al,%es:(%rdi)
  801cdc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ce0:	c9                   	leaveq 
  801ce1:	c3                   	retq   

0000000000801ce2 <memmove>:
  801ce2:	55                   	push   %rbp
  801ce3:	48 89 e5             	mov    %rsp,%rbp
  801ce6:	48 83 ec 28          	sub    $0x28,%rsp
  801cea:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801cee:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801cf2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801cf6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801cfa:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801cfe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d02:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801d06:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d0a:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801d0e:	0f 83 88 00 00 00    	jae    801d9c <memmove+0xba>
  801d14:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801d18:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d1c:	48 01 d0             	add    %rdx,%rax
  801d1f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801d23:	76 77                	jbe    801d9c <memmove+0xba>
  801d25:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d29:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801d2d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d31:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801d35:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d39:	83 e0 03             	and    $0x3,%eax
  801d3c:	48 85 c0             	test   %rax,%rax
  801d3f:	75 3b                	jne    801d7c <memmove+0x9a>
  801d41:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d45:	83 e0 03             	and    $0x3,%eax
  801d48:	48 85 c0             	test   %rax,%rax
  801d4b:	75 2f                	jne    801d7c <memmove+0x9a>
  801d4d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d51:	83 e0 03             	and    $0x3,%eax
  801d54:	48 85 c0             	test   %rax,%rax
  801d57:	75 23                	jne    801d7c <memmove+0x9a>
  801d59:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d5d:	48 83 e8 04          	sub    $0x4,%rax
  801d61:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801d65:	48 83 ea 04          	sub    $0x4,%rdx
  801d69:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801d6d:	48 c1 e9 02          	shr    $0x2,%rcx
  801d71:	48 89 c7             	mov    %rax,%rdi
  801d74:	48 89 d6             	mov    %rdx,%rsi
  801d77:	fd                   	std    
  801d78:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801d7a:	eb 1d                	jmp    801d99 <memmove+0xb7>
  801d7c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d80:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801d84:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d88:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801d8c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d90:	48 89 d7             	mov    %rdx,%rdi
  801d93:	48 89 c1             	mov    %rax,%rcx
  801d96:	fd                   	std    
  801d97:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801d99:	fc                   	cld    
  801d9a:	eb 57                	jmp    801df3 <memmove+0x111>
  801d9c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801da0:	83 e0 03             	and    $0x3,%eax
  801da3:	48 85 c0             	test   %rax,%rax
  801da6:	75 36                	jne    801dde <memmove+0xfc>
  801da8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801dac:	83 e0 03             	and    $0x3,%eax
  801daf:	48 85 c0             	test   %rax,%rax
  801db2:	75 2a                	jne    801dde <memmove+0xfc>
  801db4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801db8:	83 e0 03             	and    $0x3,%eax
  801dbb:	48 85 c0             	test   %rax,%rax
  801dbe:	75 1e                	jne    801dde <memmove+0xfc>
  801dc0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801dc4:	48 c1 e8 02          	shr    $0x2,%rax
  801dc8:	48 89 c1             	mov    %rax,%rcx
  801dcb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801dcf:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801dd3:	48 89 c7             	mov    %rax,%rdi
  801dd6:	48 89 d6             	mov    %rdx,%rsi
  801dd9:	fc                   	cld    
  801dda:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801ddc:	eb 15                	jmp    801df3 <memmove+0x111>
  801dde:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801de2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801de6:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801dea:	48 89 c7             	mov    %rax,%rdi
  801ded:	48 89 d6             	mov    %rdx,%rsi
  801df0:	fc                   	cld    
  801df1:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801df3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801df7:	c9                   	leaveq 
  801df8:	c3                   	retq   

0000000000801df9 <memcpy>:
  801df9:	55                   	push   %rbp
  801dfa:	48 89 e5             	mov    %rsp,%rbp
  801dfd:	48 83 ec 18          	sub    $0x18,%rsp
  801e01:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e05:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e09:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801e0d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801e11:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801e15:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e19:	48 89 ce             	mov    %rcx,%rsi
  801e1c:	48 89 c7             	mov    %rax,%rdi
  801e1f:	48 b8 e2 1c 80 00 00 	movabs $0x801ce2,%rax
  801e26:	00 00 00 
  801e29:	ff d0                	callq  *%rax
  801e2b:	c9                   	leaveq 
  801e2c:	c3                   	retq   

0000000000801e2d <memcmp>:
  801e2d:	55                   	push   %rbp
  801e2e:	48 89 e5             	mov    %rsp,%rbp
  801e31:	48 83 ec 28          	sub    $0x28,%rsp
  801e35:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801e39:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801e3d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801e41:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e45:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801e49:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801e4d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801e51:	eb 36                	jmp    801e89 <memcmp+0x5c>
  801e53:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e57:	0f b6 10             	movzbl (%rax),%edx
  801e5a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e5e:	0f b6 00             	movzbl (%rax),%eax
  801e61:	38 c2                	cmp    %al,%dl
  801e63:	74 1a                	je     801e7f <memcmp+0x52>
  801e65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e69:	0f b6 00             	movzbl (%rax),%eax
  801e6c:	0f b6 d0             	movzbl %al,%edx
  801e6f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e73:	0f b6 00             	movzbl (%rax),%eax
  801e76:	0f b6 c0             	movzbl %al,%eax
  801e79:	29 c2                	sub    %eax,%edx
  801e7b:	89 d0                	mov    %edx,%eax
  801e7d:	eb 20                	jmp    801e9f <memcmp+0x72>
  801e7f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801e84:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801e89:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e8d:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801e91:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801e95:	48 85 c0             	test   %rax,%rax
  801e98:	75 b9                	jne    801e53 <memcmp+0x26>
  801e9a:	b8 00 00 00 00       	mov    $0x0,%eax
  801e9f:	c9                   	leaveq 
  801ea0:	c3                   	retq   

0000000000801ea1 <memfind>:
  801ea1:	55                   	push   %rbp
  801ea2:	48 89 e5             	mov    %rsp,%rbp
  801ea5:	48 83 ec 28          	sub    $0x28,%rsp
  801ea9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801ead:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801eb0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801eb4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801eb8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ebc:	48 01 d0             	add    %rdx,%rax
  801ebf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801ec3:	eb 13                	jmp    801ed8 <memfind+0x37>
  801ec5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ec9:	0f b6 00             	movzbl (%rax),%eax
  801ecc:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801ecf:	38 d0                	cmp    %dl,%al
  801ed1:	74 11                	je     801ee4 <memfind+0x43>
  801ed3:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801ed8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801edc:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801ee0:	72 e3                	jb     801ec5 <memfind+0x24>
  801ee2:	eb 01                	jmp    801ee5 <memfind+0x44>
  801ee4:	90                   	nop
  801ee5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ee9:	c9                   	leaveq 
  801eea:	c3                   	retq   

0000000000801eeb <strtol>:
  801eeb:	55                   	push   %rbp
  801eec:	48 89 e5             	mov    %rsp,%rbp
  801eef:	48 83 ec 38          	sub    $0x38,%rsp
  801ef3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801ef7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801efb:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801efe:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801f05:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801f0c:	00 
  801f0d:	eb 05                	jmp    801f14 <strtol+0x29>
  801f0f:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801f14:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f18:	0f b6 00             	movzbl (%rax),%eax
  801f1b:	3c 20                	cmp    $0x20,%al
  801f1d:	74 f0                	je     801f0f <strtol+0x24>
  801f1f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f23:	0f b6 00             	movzbl (%rax),%eax
  801f26:	3c 09                	cmp    $0x9,%al
  801f28:	74 e5                	je     801f0f <strtol+0x24>
  801f2a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f2e:	0f b6 00             	movzbl (%rax),%eax
  801f31:	3c 2b                	cmp    $0x2b,%al
  801f33:	75 07                	jne    801f3c <strtol+0x51>
  801f35:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801f3a:	eb 17                	jmp    801f53 <strtol+0x68>
  801f3c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f40:	0f b6 00             	movzbl (%rax),%eax
  801f43:	3c 2d                	cmp    $0x2d,%al
  801f45:	75 0c                	jne    801f53 <strtol+0x68>
  801f47:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801f4c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801f53:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801f57:	74 06                	je     801f5f <strtol+0x74>
  801f59:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801f5d:	75 28                	jne    801f87 <strtol+0x9c>
  801f5f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f63:	0f b6 00             	movzbl (%rax),%eax
  801f66:	3c 30                	cmp    $0x30,%al
  801f68:	75 1d                	jne    801f87 <strtol+0x9c>
  801f6a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f6e:	48 83 c0 01          	add    $0x1,%rax
  801f72:	0f b6 00             	movzbl (%rax),%eax
  801f75:	3c 78                	cmp    $0x78,%al
  801f77:	75 0e                	jne    801f87 <strtol+0x9c>
  801f79:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801f7e:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801f85:	eb 2c                	jmp    801fb3 <strtol+0xc8>
  801f87:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801f8b:	75 19                	jne    801fa6 <strtol+0xbb>
  801f8d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f91:	0f b6 00             	movzbl (%rax),%eax
  801f94:	3c 30                	cmp    $0x30,%al
  801f96:	75 0e                	jne    801fa6 <strtol+0xbb>
  801f98:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801f9d:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801fa4:	eb 0d                	jmp    801fb3 <strtol+0xc8>
  801fa6:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801faa:	75 07                	jne    801fb3 <strtol+0xc8>
  801fac:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801fb3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fb7:	0f b6 00             	movzbl (%rax),%eax
  801fba:	3c 2f                	cmp    $0x2f,%al
  801fbc:	7e 1d                	jle    801fdb <strtol+0xf0>
  801fbe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fc2:	0f b6 00             	movzbl (%rax),%eax
  801fc5:	3c 39                	cmp    $0x39,%al
  801fc7:	7f 12                	jg     801fdb <strtol+0xf0>
  801fc9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fcd:	0f b6 00             	movzbl (%rax),%eax
  801fd0:	0f be c0             	movsbl %al,%eax
  801fd3:	83 e8 30             	sub    $0x30,%eax
  801fd6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801fd9:	eb 4e                	jmp    802029 <strtol+0x13e>
  801fdb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fdf:	0f b6 00             	movzbl (%rax),%eax
  801fe2:	3c 60                	cmp    $0x60,%al
  801fe4:	7e 1d                	jle    802003 <strtol+0x118>
  801fe6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fea:	0f b6 00             	movzbl (%rax),%eax
  801fed:	3c 7a                	cmp    $0x7a,%al
  801fef:	7f 12                	jg     802003 <strtol+0x118>
  801ff1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ff5:	0f b6 00             	movzbl (%rax),%eax
  801ff8:	0f be c0             	movsbl %al,%eax
  801ffb:	83 e8 57             	sub    $0x57,%eax
  801ffe:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802001:	eb 26                	jmp    802029 <strtol+0x13e>
  802003:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802007:	0f b6 00             	movzbl (%rax),%eax
  80200a:	3c 40                	cmp    $0x40,%al
  80200c:	7e 47                	jle    802055 <strtol+0x16a>
  80200e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802012:	0f b6 00             	movzbl (%rax),%eax
  802015:	3c 5a                	cmp    $0x5a,%al
  802017:	7f 3c                	jg     802055 <strtol+0x16a>
  802019:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80201d:	0f b6 00             	movzbl (%rax),%eax
  802020:	0f be c0             	movsbl %al,%eax
  802023:	83 e8 37             	sub    $0x37,%eax
  802026:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802029:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80202c:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80202f:	7d 23                	jge    802054 <strtol+0x169>
  802031:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  802036:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802039:	48 98                	cltq   
  80203b:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  802040:	48 89 c2             	mov    %rax,%rdx
  802043:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802046:	48 98                	cltq   
  802048:	48 01 d0             	add    %rdx,%rax
  80204b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80204f:	e9 5f ff ff ff       	jmpq   801fb3 <strtol+0xc8>
  802054:	90                   	nop
  802055:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  80205a:	74 0b                	je     802067 <strtol+0x17c>
  80205c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802060:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802064:	48 89 10             	mov    %rdx,(%rax)
  802067:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80206b:	74 09                	je     802076 <strtol+0x18b>
  80206d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802071:	48 f7 d8             	neg    %rax
  802074:	eb 04                	jmp    80207a <strtol+0x18f>
  802076:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80207a:	c9                   	leaveq 
  80207b:	c3                   	retq   

000000000080207c <strstr>:
  80207c:	55                   	push   %rbp
  80207d:	48 89 e5             	mov    %rsp,%rbp
  802080:	48 83 ec 30          	sub    $0x30,%rsp
  802084:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802088:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80208c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802090:	48 8d 50 01          	lea    0x1(%rax),%rdx
  802094:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  802098:	0f b6 00             	movzbl (%rax),%eax
  80209b:	88 45 ff             	mov    %al,-0x1(%rbp)
  80209e:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8020a2:	75 06                	jne    8020aa <strstr+0x2e>
  8020a4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020a8:	eb 6b                	jmp    802115 <strstr+0x99>
  8020aa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8020ae:	48 89 c7             	mov    %rax,%rdi
  8020b1:	48 b8 51 19 80 00 00 	movabs $0x801951,%rax
  8020b8:	00 00 00 
  8020bb:	ff d0                	callq  *%rax
  8020bd:	48 98                	cltq   
  8020bf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8020c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020c7:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8020cb:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8020cf:	0f b6 00             	movzbl (%rax),%eax
  8020d2:	88 45 ef             	mov    %al,-0x11(%rbp)
  8020d5:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8020d9:	75 07                	jne    8020e2 <strstr+0x66>
  8020db:	b8 00 00 00 00       	mov    $0x0,%eax
  8020e0:	eb 33                	jmp    802115 <strstr+0x99>
  8020e2:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8020e6:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8020e9:	75 d8                	jne    8020c3 <strstr+0x47>
  8020eb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8020ef:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8020f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020f7:	48 89 ce             	mov    %rcx,%rsi
  8020fa:	48 89 c7             	mov    %rax,%rdi
  8020fd:	48 b8 72 1b 80 00 00 	movabs $0x801b72,%rax
  802104:	00 00 00 
  802107:	ff d0                	callq  *%rax
  802109:	85 c0                	test   %eax,%eax
  80210b:	75 b6                	jne    8020c3 <strstr+0x47>
  80210d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802111:	48 83 e8 01          	sub    $0x1,%rax
  802115:	c9                   	leaveq 
  802116:	c3                   	retq   

0000000000802117 <syscall>:
  802117:	55                   	push   %rbp
  802118:	48 89 e5             	mov    %rsp,%rbp
  80211b:	53                   	push   %rbx
  80211c:	48 83 ec 48          	sub    $0x48,%rsp
  802120:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802123:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802126:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80212a:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80212e:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  802132:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  802136:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802139:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80213d:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  802141:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  802145:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  802149:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80214d:	4c 89 c3             	mov    %r8,%rbx
  802150:	cd 30                	int    $0x30
  802152:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802156:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  80215a:	74 3e                	je     80219a <syscall+0x83>
  80215c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802161:	7e 37                	jle    80219a <syscall+0x83>
  802163:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802167:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80216a:	49 89 d0             	mov    %rdx,%r8
  80216d:	89 c1                	mov    %eax,%ecx
  80216f:	48 ba e8 5b 80 00 00 	movabs $0x805be8,%rdx
  802176:	00 00 00 
  802179:	be 24 00 00 00       	mov    $0x24,%esi
  80217e:	48 bf 05 5c 80 00 00 	movabs $0x805c05,%rdi
  802185:	00 00 00 
  802188:	b8 00 00 00 00       	mov    $0x0,%eax
  80218d:	49 b9 f3 0b 80 00 00 	movabs $0x800bf3,%r9
  802194:	00 00 00 
  802197:	41 ff d1             	callq  *%r9
  80219a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80219e:	48 83 c4 48          	add    $0x48,%rsp
  8021a2:	5b                   	pop    %rbx
  8021a3:	5d                   	pop    %rbp
  8021a4:	c3                   	retq   

00000000008021a5 <sys_cputs>:
  8021a5:	55                   	push   %rbp
  8021a6:	48 89 e5             	mov    %rsp,%rbp
  8021a9:	48 83 ec 10          	sub    $0x10,%rsp
  8021ad:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8021b1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8021b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8021b9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8021bd:	48 83 ec 08          	sub    $0x8,%rsp
  8021c1:	6a 00                	pushq  $0x0
  8021c3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8021c9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8021cf:	48 89 d1             	mov    %rdx,%rcx
  8021d2:	48 89 c2             	mov    %rax,%rdx
  8021d5:	be 00 00 00 00       	mov    $0x0,%esi
  8021da:	bf 00 00 00 00       	mov    $0x0,%edi
  8021df:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  8021e6:	00 00 00 
  8021e9:	ff d0                	callq  *%rax
  8021eb:	48 83 c4 10          	add    $0x10,%rsp
  8021ef:	90                   	nop
  8021f0:	c9                   	leaveq 
  8021f1:	c3                   	retq   

00000000008021f2 <sys_cgetc>:
  8021f2:	55                   	push   %rbp
  8021f3:	48 89 e5             	mov    %rsp,%rbp
  8021f6:	48 83 ec 08          	sub    $0x8,%rsp
  8021fa:	6a 00                	pushq  $0x0
  8021fc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802202:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802208:	b9 00 00 00 00       	mov    $0x0,%ecx
  80220d:	ba 00 00 00 00       	mov    $0x0,%edx
  802212:	be 00 00 00 00       	mov    $0x0,%esi
  802217:	bf 01 00 00 00       	mov    $0x1,%edi
  80221c:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  802223:	00 00 00 
  802226:	ff d0                	callq  *%rax
  802228:	48 83 c4 10          	add    $0x10,%rsp
  80222c:	c9                   	leaveq 
  80222d:	c3                   	retq   

000000000080222e <sys_env_destroy>:
  80222e:	55                   	push   %rbp
  80222f:	48 89 e5             	mov    %rsp,%rbp
  802232:	48 83 ec 10          	sub    $0x10,%rsp
  802236:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802239:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80223c:	48 98                	cltq   
  80223e:	48 83 ec 08          	sub    $0x8,%rsp
  802242:	6a 00                	pushq  $0x0
  802244:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80224a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802250:	b9 00 00 00 00       	mov    $0x0,%ecx
  802255:	48 89 c2             	mov    %rax,%rdx
  802258:	be 01 00 00 00       	mov    $0x1,%esi
  80225d:	bf 03 00 00 00       	mov    $0x3,%edi
  802262:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  802269:	00 00 00 
  80226c:	ff d0                	callq  *%rax
  80226e:	48 83 c4 10          	add    $0x10,%rsp
  802272:	c9                   	leaveq 
  802273:	c3                   	retq   

0000000000802274 <sys_getenvid>:
  802274:	55                   	push   %rbp
  802275:	48 89 e5             	mov    %rsp,%rbp
  802278:	48 83 ec 08          	sub    $0x8,%rsp
  80227c:	6a 00                	pushq  $0x0
  80227e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802284:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80228a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80228f:	ba 00 00 00 00       	mov    $0x0,%edx
  802294:	be 00 00 00 00       	mov    $0x0,%esi
  802299:	bf 02 00 00 00       	mov    $0x2,%edi
  80229e:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  8022a5:	00 00 00 
  8022a8:	ff d0                	callq  *%rax
  8022aa:	48 83 c4 10          	add    $0x10,%rsp
  8022ae:	c9                   	leaveq 
  8022af:	c3                   	retq   

00000000008022b0 <sys_yield>:
  8022b0:	55                   	push   %rbp
  8022b1:	48 89 e5             	mov    %rsp,%rbp
  8022b4:	48 83 ec 08          	sub    $0x8,%rsp
  8022b8:	6a 00                	pushq  $0x0
  8022ba:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8022c0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8022c6:	b9 00 00 00 00       	mov    $0x0,%ecx
  8022cb:	ba 00 00 00 00       	mov    $0x0,%edx
  8022d0:	be 00 00 00 00       	mov    $0x0,%esi
  8022d5:	bf 0b 00 00 00       	mov    $0xb,%edi
  8022da:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  8022e1:	00 00 00 
  8022e4:	ff d0                	callq  *%rax
  8022e6:	48 83 c4 10          	add    $0x10,%rsp
  8022ea:	90                   	nop
  8022eb:	c9                   	leaveq 
  8022ec:	c3                   	retq   

00000000008022ed <sys_page_alloc>:
  8022ed:	55                   	push   %rbp
  8022ee:	48 89 e5             	mov    %rsp,%rbp
  8022f1:	48 83 ec 10          	sub    $0x10,%rsp
  8022f5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8022f8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8022fc:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8022ff:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802302:	48 63 c8             	movslq %eax,%rcx
  802305:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802309:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80230c:	48 98                	cltq   
  80230e:	48 83 ec 08          	sub    $0x8,%rsp
  802312:	6a 00                	pushq  $0x0
  802314:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80231a:	49 89 c8             	mov    %rcx,%r8
  80231d:	48 89 d1             	mov    %rdx,%rcx
  802320:	48 89 c2             	mov    %rax,%rdx
  802323:	be 01 00 00 00       	mov    $0x1,%esi
  802328:	bf 04 00 00 00       	mov    $0x4,%edi
  80232d:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  802334:	00 00 00 
  802337:	ff d0                	callq  *%rax
  802339:	48 83 c4 10          	add    $0x10,%rsp
  80233d:	c9                   	leaveq 
  80233e:	c3                   	retq   

000000000080233f <sys_page_map>:
  80233f:	55                   	push   %rbp
  802340:	48 89 e5             	mov    %rsp,%rbp
  802343:	48 83 ec 20          	sub    $0x20,%rsp
  802347:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80234a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80234e:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802351:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  802355:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802359:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80235c:	48 63 c8             	movslq %eax,%rcx
  80235f:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  802363:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802366:	48 63 f0             	movslq %eax,%rsi
  802369:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80236d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802370:	48 98                	cltq   
  802372:	48 83 ec 08          	sub    $0x8,%rsp
  802376:	51                   	push   %rcx
  802377:	49 89 f9             	mov    %rdi,%r9
  80237a:	49 89 f0             	mov    %rsi,%r8
  80237d:	48 89 d1             	mov    %rdx,%rcx
  802380:	48 89 c2             	mov    %rax,%rdx
  802383:	be 01 00 00 00       	mov    $0x1,%esi
  802388:	bf 05 00 00 00       	mov    $0x5,%edi
  80238d:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  802394:	00 00 00 
  802397:	ff d0                	callq  *%rax
  802399:	48 83 c4 10          	add    $0x10,%rsp
  80239d:	c9                   	leaveq 
  80239e:	c3                   	retq   

000000000080239f <sys_page_unmap>:
  80239f:	55                   	push   %rbp
  8023a0:	48 89 e5             	mov    %rsp,%rbp
  8023a3:	48 83 ec 10          	sub    $0x10,%rsp
  8023a7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8023aa:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8023ae:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8023b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023b5:	48 98                	cltq   
  8023b7:	48 83 ec 08          	sub    $0x8,%rsp
  8023bb:	6a 00                	pushq  $0x0
  8023bd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8023c3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8023c9:	48 89 d1             	mov    %rdx,%rcx
  8023cc:	48 89 c2             	mov    %rax,%rdx
  8023cf:	be 01 00 00 00       	mov    $0x1,%esi
  8023d4:	bf 06 00 00 00       	mov    $0x6,%edi
  8023d9:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  8023e0:	00 00 00 
  8023e3:	ff d0                	callq  *%rax
  8023e5:	48 83 c4 10          	add    $0x10,%rsp
  8023e9:	c9                   	leaveq 
  8023ea:	c3                   	retq   

00000000008023eb <sys_env_set_status>:
  8023eb:	55                   	push   %rbp
  8023ec:	48 89 e5             	mov    %rsp,%rbp
  8023ef:	48 83 ec 10          	sub    $0x10,%rsp
  8023f3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8023f6:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8023f9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023fc:	48 63 d0             	movslq %eax,%rdx
  8023ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802402:	48 98                	cltq   
  802404:	48 83 ec 08          	sub    $0x8,%rsp
  802408:	6a 00                	pushq  $0x0
  80240a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802410:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802416:	48 89 d1             	mov    %rdx,%rcx
  802419:	48 89 c2             	mov    %rax,%rdx
  80241c:	be 01 00 00 00       	mov    $0x1,%esi
  802421:	bf 08 00 00 00       	mov    $0x8,%edi
  802426:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  80242d:	00 00 00 
  802430:	ff d0                	callq  *%rax
  802432:	48 83 c4 10          	add    $0x10,%rsp
  802436:	c9                   	leaveq 
  802437:	c3                   	retq   

0000000000802438 <sys_env_set_trapframe>:
  802438:	55                   	push   %rbp
  802439:	48 89 e5             	mov    %rsp,%rbp
  80243c:	48 83 ec 10          	sub    $0x10,%rsp
  802440:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802443:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802447:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80244b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80244e:	48 98                	cltq   
  802450:	48 83 ec 08          	sub    $0x8,%rsp
  802454:	6a 00                	pushq  $0x0
  802456:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80245c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802462:	48 89 d1             	mov    %rdx,%rcx
  802465:	48 89 c2             	mov    %rax,%rdx
  802468:	be 01 00 00 00       	mov    $0x1,%esi
  80246d:	bf 09 00 00 00       	mov    $0x9,%edi
  802472:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  802479:	00 00 00 
  80247c:	ff d0                	callq  *%rax
  80247e:	48 83 c4 10          	add    $0x10,%rsp
  802482:	c9                   	leaveq 
  802483:	c3                   	retq   

0000000000802484 <sys_env_set_pgfault_upcall>:
  802484:	55                   	push   %rbp
  802485:	48 89 e5             	mov    %rsp,%rbp
  802488:	48 83 ec 10          	sub    $0x10,%rsp
  80248c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80248f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802493:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802497:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80249a:	48 98                	cltq   
  80249c:	48 83 ec 08          	sub    $0x8,%rsp
  8024a0:	6a 00                	pushq  $0x0
  8024a2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8024a8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8024ae:	48 89 d1             	mov    %rdx,%rcx
  8024b1:	48 89 c2             	mov    %rax,%rdx
  8024b4:	be 01 00 00 00       	mov    $0x1,%esi
  8024b9:	bf 0a 00 00 00       	mov    $0xa,%edi
  8024be:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  8024c5:	00 00 00 
  8024c8:	ff d0                	callq  *%rax
  8024ca:	48 83 c4 10          	add    $0x10,%rsp
  8024ce:	c9                   	leaveq 
  8024cf:	c3                   	retq   

00000000008024d0 <sys_ipc_try_send>:
  8024d0:	55                   	push   %rbp
  8024d1:	48 89 e5             	mov    %rsp,%rbp
  8024d4:	48 83 ec 20          	sub    $0x20,%rsp
  8024d8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8024db:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8024df:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8024e3:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  8024e6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024e9:	48 63 f0             	movslq %eax,%rsi
  8024ec:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8024f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024f3:	48 98                	cltq   
  8024f5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8024f9:	48 83 ec 08          	sub    $0x8,%rsp
  8024fd:	6a 00                	pushq  $0x0
  8024ff:	49 89 f1             	mov    %rsi,%r9
  802502:	49 89 c8             	mov    %rcx,%r8
  802505:	48 89 d1             	mov    %rdx,%rcx
  802508:	48 89 c2             	mov    %rax,%rdx
  80250b:	be 00 00 00 00       	mov    $0x0,%esi
  802510:	bf 0c 00 00 00       	mov    $0xc,%edi
  802515:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  80251c:	00 00 00 
  80251f:	ff d0                	callq  *%rax
  802521:	48 83 c4 10          	add    $0x10,%rsp
  802525:	c9                   	leaveq 
  802526:	c3                   	retq   

0000000000802527 <sys_ipc_recv>:
  802527:	55                   	push   %rbp
  802528:	48 89 e5             	mov    %rsp,%rbp
  80252b:	48 83 ec 10          	sub    $0x10,%rsp
  80252f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802533:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802537:	48 83 ec 08          	sub    $0x8,%rsp
  80253b:	6a 00                	pushq  $0x0
  80253d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802543:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802549:	b9 00 00 00 00       	mov    $0x0,%ecx
  80254e:	48 89 c2             	mov    %rax,%rdx
  802551:	be 01 00 00 00       	mov    $0x1,%esi
  802556:	bf 0d 00 00 00       	mov    $0xd,%edi
  80255b:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  802562:	00 00 00 
  802565:	ff d0                	callq  *%rax
  802567:	48 83 c4 10          	add    $0x10,%rsp
  80256b:	c9                   	leaveq 
  80256c:	c3                   	retq   

000000000080256d <sys_time_msec>:
  80256d:	55                   	push   %rbp
  80256e:	48 89 e5             	mov    %rsp,%rbp
  802571:	48 83 ec 08          	sub    $0x8,%rsp
  802575:	6a 00                	pushq  $0x0
  802577:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80257d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802583:	b9 00 00 00 00       	mov    $0x0,%ecx
  802588:	ba 00 00 00 00       	mov    $0x0,%edx
  80258d:	be 00 00 00 00       	mov    $0x0,%esi
  802592:	bf 0e 00 00 00       	mov    $0xe,%edi
  802597:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  80259e:	00 00 00 
  8025a1:	ff d0                	callq  *%rax
  8025a3:	48 83 c4 10          	add    $0x10,%rsp
  8025a7:	c9                   	leaveq 
  8025a8:	c3                   	retq   

00000000008025a9 <sys_net_transmit>:
  8025a9:	55                   	push   %rbp
  8025aa:	48 89 e5             	mov    %rsp,%rbp
  8025ad:	48 83 ec 10          	sub    $0x10,%rsp
  8025b1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8025b5:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8025b8:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8025bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8025bf:	48 83 ec 08          	sub    $0x8,%rsp
  8025c3:	6a 00                	pushq  $0x0
  8025c5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8025cb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8025d1:	48 89 d1             	mov    %rdx,%rcx
  8025d4:	48 89 c2             	mov    %rax,%rdx
  8025d7:	be 00 00 00 00       	mov    $0x0,%esi
  8025dc:	bf 0f 00 00 00       	mov    $0xf,%edi
  8025e1:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  8025e8:	00 00 00 
  8025eb:	ff d0                	callq  *%rax
  8025ed:	48 83 c4 10          	add    $0x10,%rsp
  8025f1:	c9                   	leaveq 
  8025f2:	c3                   	retq   

00000000008025f3 <sys_net_receive>:
  8025f3:	55                   	push   %rbp
  8025f4:	48 89 e5             	mov    %rsp,%rbp
  8025f7:	48 83 ec 10          	sub    $0x10,%rsp
  8025fb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8025ff:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802602:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802605:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802609:	48 83 ec 08          	sub    $0x8,%rsp
  80260d:	6a 00                	pushq  $0x0
  80260f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802615:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80261b:	48 89 d1             	mov    %rdx,%rcx
  80261e:	48 89 c2             	mov    %rax,%rdx
  802621:	be 00 00 00 00       	mov    $0x0,%esi
  802626:	bf 10 00 00 00       	mov    $0x10,%edi
  80262b:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  802632:	00 00 00 
  802635:	ff d0                	callq  *%rax
  802637:	48 83 c4 10          	add    $0x10,%rsp
  80263b:	c9                   	leaveq 
  80263c:	c3                   	retq   

000000000080263d <sys_ept_map>:
  80263d:	55                   	push   %rbp
  80263e:	48 89 e5             	mov    %rsp,%rbp
  802641:	48 83 ec 20          	sub    $0x20,%rsp
  802645:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802648:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80264c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80264f:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  802653:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802657:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80265a:	48 63 c8             	movslq %eax,%rcx
  80265d:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  802661:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802664:	48 63 f0             	movslq %eax,%rsi
  802667:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80266b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80266e:	48 98                	cltq   
  802670:	48 83 ec 08          	sub    $0x8,%rsp
  802674:	51                   	push   %rcx
  802675:	49 89 f9             	mov    %rdi,%r9
  802678:	49 89 f0             	mov    %rsi,%r8
  80267b:	48 89 d1             	mov    %rdx,%rcx
  80267e:	48 89 c2             	mov    %rax,%rdx
  802681:	be 00 00 00 00       	mov    $0x0,%esi
  802686:	bf 11 00 00 00       	mov    $0x11,%edi
  80268b:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  802692:	00 00 00 
  802695:	ff d0                	callq  *%rax
  802697:	48 83 c4 10          	add    $0x10,%rsp
  80269b:	c9                   	leaveq 
  80269c:	c3                   	retq   

000000000080269d <sys_env_mkguest>:
  80269d:	55                   	push   %rbp
  80269e:	48 89 e5             	mov    %rsp,%rbp
  8026a1:	48 83 ec 10          	sub    $0x10,%rsp
  8026a5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8026a9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8026ad:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8026b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8026b5:	48 83 ec 08          	sub    $0x8,%rsp
  8026b9:	6a 00                	pushq  $0x0
  8026bb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8026c1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8026c7:	48 89 d1             	mov    %rdx,%rcx
  8026ca:	48 89 c2             	mov    %rax,%rdx
  8026cd:	be 00 00 00 00       	mov    $0x0,%esi
  8026d2:	bf 12 00 00 00       	mov    $0x12,%edi
  8026d7:	48 b8 17 21 80 00 00 	movabs $0x802117,%rax
  8026de:	00 00 00 
  8026e1:	ff d0                	callq  *%rax
  8026e3:	48 83 c4 10          	add    $0x10,%rsp
  8026e7:	c9                   	leaveq 
  8026e8:	c3                   	retq   

00000000008026e9 <fd2num>:
  8026e9:	55                   	push   %rbp
  8026ea:	48 89 e5             	mov    %rsp,%rbp
  8026ed:	48 83 ec 08          	sub    $0x8,%rsp
  8026f1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8026f5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8026f9:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802700:	ff ff ff 
  802703:	48 01 d0             	add    %rdx,%rax
  802706:	48 c1 e8 0c          	shr    $0xc,%rax
  80270a:	c9                   	leaveq 
  80270b:	c3                   	retq   

000000000080270c <fd2data>:
  80270c:	55                   	push   %rbp
  80270d:	48 89 e5             	mov    %rsp,%rbp
  802710:	48 83 ec 08          	sub    $0x8,%rsp
  802714:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802718:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80271c:	48 89 c7             	mov    %rax,%rdi
  80271f:	48 b8 e9 26 80 00 00 	movabs $0x8026e9,%rax
  802726:	00 00 00 
  802729:	ff d0                	callq  *%rax
  80272b:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802731:	48 c1 e0 0c          	shl    $0xc,%rax
  802735:	c9                   	leaveq 
  802736:	c3                   	retq   

0000000000802737 <fd_alloc>:
  802737:	55                   	push   %rbp
  802738:	48 89 e5             	mov    %rsp,%rbp
  80273b:	48 83 ec 18          	sub    $0x18,%rsp
  80273f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802743:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80274a:	eb 6b                	jmp    8027b7 <fd_alloc+0x80>
  80274c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80274f:	48 98                	cltq   
  802751:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802757:	48 c1 e0 0c          	shl    $0xc,%rax
  80275b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80275f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802763:	48 c1 e8 15          	shr    $0x15,%rax
  802767:	48 89 c2             	mov    %rax,%rdx
  80276a:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802771:	01 00 00 
  802774:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802778:	83 e0 01             	and    $0x1,%eax
  80277b:	48 85 c0             	test   %rax,%rax
  80277e:	74 21                	je     8027a1 <fd_alloc+0x6a>
  802780:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802784:	48 c1 e8 0c          	shr    $0xc,%rax
  802788:	48 89 c2             	mov    %rax,%rdx
  80278b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802792:	01 00 00 
  802795:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802799:	83 e0 01             	and    $0x1,%eax
  80279c:	48 85 c0             	test   %rax,%rax
  80279f:	75 12                	jne    8027b3 <fd_alloc+0x7c>
  8027a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027a5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8027a9:	48 89 10             	mov    %rdx,(%rax)
  8027ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8027b1:	eb 1a                	jmp    8027cd <fd_alloc+0x96>
  8027b3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8027b7:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8027bb:	7e 8f                	jle    80274c <fd_alloc+0x15>
  8027bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027c1:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8027c8:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8027cd:	c9                   	leaveq 
  8027ce:	c3                   	retq   

00000000008027cf <fd_lookup>:
  8027cf:	55                   	push   %rbp
  8027d0:	48 89 e5             	mov    %rsp,%rbp
  8027d3:	48 83 ec 20          	sub    $0x20,%rsp
  8027d7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8027da:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8027de:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8027e2:	78 06                	js     8027ea <fd_lookup+0x1b>
  8027e4:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8027e8:	7e 07                	jle    8027f1 <fd_lookup+0x22>
  8027ea:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8027ef:	eb 6c                	jmp    80285d <fd_lookup+0x8e>
  8027f1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8027f4:	48 98                	cltq   
  8027f6:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8027fc:	48 c1 e0 0c          	shl    $0xc,%rax
  802800:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802804:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802808:	48 c1 e8 15          	shr    $0x15,%rax
  80280c:	48 89 c2             	mov    %rax,%rdx
  80280f:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802816:	01 00 00 
  802819:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80281d:	83 e0 01             	and    $0x1,%eax
  802820:	48 85 c0             	test   %rax,%rax
  802823:	74 21                	je     802846 <fd_lookup+0x77>
  802825:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802829:	48 c1 e8 0c          	shr    $0xc,%rax
  80282d:	48 89 c2             	mov    %rax,%rdx
  802830:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802837:	01 00 00 
  80283a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80283e:	83 e0 01             	and    $0x1,%eax
  802841:	48 85 c0             	test   %rax,%rax
  802844:	75 07                	jne    80284d <fd_lookup+0x7e>
  802846:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80284b:	eb 10                	jmp    80285d <fd_lookup+0x8e>
  80284d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802851:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802855:	48 89 10             	mov    %rdx,(%rax)
  802858:	b8 00 00 00 00       	mov    $0x0,%eax
  80285d:	c9                   	leaveq 
  80285e:	c3                   	retq   

000000000080285f <fd_close>:
  80285f:	55                   	push   %rbp
  802860:	48 89 e5             	mov    %rsp,%rbp
  802863:	48 83 ec 30          	sub    $0x30,%rsp
  802867:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80286b:	89 f0                	mov    %esi,%eax
  80286d:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802870:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802874:	48 89 c7             	mov    %rax,%rdi
  802877:	48 b8 e9 26 80 00 00 	movabs $0x8026e9,%rax
  80287e:	00 00 00 
  802881:	ff d0                	callq  *%rax
  802883:	89 c2                	mov    %eax,%edx
  802885:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802889:	48 89 c6             	mov    %rax,%rsi
  80288c:	89 d7                	mov    %edx,%edi
  80288e:	48 b8 cf 27 80 00 00 	movabs $0x8027cf,%rax
  802895:	00 00 00 
  802898:	ff d0                	callq  *%rax
  80289a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80289d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028a1:	78 0a                	js     8028ad <fd_close+0x4e>
  8028a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028a7:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8028ab:	74 12                	je     8028bf <fd_close+0x60>
  8028ad:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8028b1:	74 05                	je     8028b8 <fd_close+0x59>
  8028b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028b6:	eb 70                	jmp    802928 <fd_close+0xc9>
  8028b8:	b8 00 00 00 00       	mov    $0x0,%eax
  8028bd:	eb 69                	jmp    802928 <fd_close+0xc9>
  8028bf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028c3:	8b 00                	mov    (%rax),%eax
  8028c5:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8028c9:	48 89 d6             	mov    %rdx,%rsi
  8028cc:	89 c7                	mov    %eax,%edi
  8028ce:	48 b8 2a 29 80 00 00 	movabs $0x80292a,%rax
  8028d5:	00 00 00 
  8028d8:	ff d0                	callq  *%rax
  8028da:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028dd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028e1:	78 2a                	js     80290d <fd_close+0xae>
  8028e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028e7:	48 8b 40 20          	mov    0x20(%rax),%rax
  8028eb:	48 85 c0             	test   %rax,%rax
  8028ee:	74 16                	je     802906 <fd_close+0xa7>
  8028f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028f4:	48 8b 40 20          	mov    0x20(%rax),%rax
  8028f8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8028fc:	48 89 d7             	mov    %rdx,%rdi
  8028ff:	ff d0                	callq  *%rax
  802901:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802904:	eb 07                	jmp    80290d <fd_close+0xae>
  802906:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80290d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802911:	48 89 c6             	mov    %rax,%rsi
  802914:	bf 00 00 00 00       	mov    $0x0,%edi
  802919:	48 b8 9f 23 80 00 00 	movabs $0x80239f,%rax
  802920:	00 00 00 
  802923:	ff d0                	callq  *%rax
  802925:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802928:	c9                   	leaveq 
  802929:	c3                   	retq   

000000000080292a <dev_lookup>:
  80292a:	55                   	push   %rbp
  80292b:	48 89 e5             	mov    %rsp,%rbp
  80292e:	48 83 ec 20          	sub    $0x20,%rsp
  802932:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802935:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802939:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802940:	eb 41                	jmp    802983 <dev_lookup+0x59>
  802942:	48 b8 60 80 80 00 00 	movabs $0x808060,%rax
  802949:	00 00 00 
  80294c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80294f:	48 63 d2             	movslq %edx,%rdx
  802952:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802956:	8b 00                	mov    (%rax),%eax
  802958:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80295b:	75 22                	jne    80297f <dev_lookup+0x55>
  80295d:	48 b8 60 80 80 00 00 	movabs $0x808060,%rax
  802964:	00 00 00 
  802967:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80296a:	48 63 d2             	movslq %edx,%rdx
  80296d:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802971:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802975:	48 89 10             	mov    %rdx,(%rax)
  802978:	b8 00 00 00 00       	mov    $0x0,%eax
  80297d:	eb 60                	jmp    8029df <dev_lookup+0xb5>
  80297f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802983:	48 b8 60 80 80 00 00 	movabs $0x808060,%rax
  80298a:	00 00 00 
  80298d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802990:	48 63 d2             	movslq %edx,%rdx
  802993:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802997:	48 85 c0             	test   %rax,%rax
  80299a:	75 a6                	jne    802942 <dev_lookup+0x18>
  80299c:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  8029a3:	00 00 00 
  8029a6:	48 8b 00             	mov    (%rax),%rax
  8029a9:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8029af:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8029b2:	89 c6                	mov    %eax,%esi
  8029b4:	48 bf 18 5c 80 00 00 	movabs $0x805c18,%rdi
  8029bb:	00 00 00 
  8029be:	b8 00 00 00 00       	mov    $0x0,%eax
  8029c3:	48 b9 2d 0e 80 00 00 	movabs $0x800e2d,%rcx
  8029ca:	00 00 00 
  8029cd:	ff d1                	callq  *%rcx
  8029cf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029d3:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8029da:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8029df:	c9                   	leaveq 
  8029e0:	c3                   	retq   

00000000008029e1 <close>:
  8029e1:	55                   	push   %rbp
  8029e2:	48 89 e5             	mov    %rsp,%rbp
  8029e5:	48 83 ec 20          	sub    $0x20,%rsp
  8029e9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8029ec:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8029f0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8029f3:	48 89 d6             	mov    %rdx,%rsi
  8029f6:	89 c7                	mov    %eax,%edi
  8029f8:	48 b8 cf 27 80 00 00 	movabs $0x8027cf,%rax
  8029ff:	00 00 00 
  802a02:	ff d0                	callq  *%rax
  802a04:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a07:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a0b:	79 05                	jns    802a12 <close+0x31>
  802a0d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a10:	eb 18                	jmp    802a2a <close+0x49>
  802a12:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a16:	be 01 00 00 00       	mov    $0x1,%esi
  802a1b:	48 89 c7             	mov    %rax,%rdi
  802a1e:	48 b8 5f 28 80 00 00 	movabs $0x80285f,%rax
  802a25:	00 00 00 
  802a28:	ff d0                	callq  *%rax
  802a2a:	c9                   	leaveq 
  802a2b:	c3                   	retq   

0000000000802a2c <close_all>:
  802a2c:	55                   	push   %rbp
  802a2d:	48 89 e5             	mov    %rsp,%rbp
  802a30:	48 83 ec 10          	sub    $0x10,%rsp
  802a34:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a3b:	eb 15                	jmp    802a52 <close_all+0x26>
  802a3d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a40:	89 c7                	mov    %eax,%edi
  802a42:	48 b8 e1 29 80 00 00 	movabs $0x8029e1,%rax
  802a49:	00 00 00 
  802a4c:	ff d0                	callq  *%rax
  802a4e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802a52:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802a56:	7e e5                	jle    802a3d <close_all+0x11>
  802a58:	90                   	nop
  802a59:	c9                   	leaveq 
  802a5a:	c3                   	retq   

0000000000802a5b <dup>:
  802a5b:	55                   	push   %rbp
  802a5c:	48 89 e5             	mov    %rsp,%rbp
  802a5f:	48 83 ec 40          	sub    $0x40,%rsp
  802a63:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802a66:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802a69:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802a6d:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802a70:	48 89 d6             	mov    %rdx,%rsi
  802a73:	89 c7                	mov    %eax,%edi
  802a75:	48 b8 cf 27 80 00 00 	movabs $0x8027cf,%rax
  802a7c:	00 00 00 
  802a7f:	ff d0                	callq  *%rax
  802a81:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a84:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a88:	79 08                	jns    802a92 <dup+0x37>
  802a8a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a8d:	e9 70 01 00 00       	jmpq   802c02 <dup+0x1a7>
  802a92:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802a95:	89 c7                	mov    %eax,%edi
  802a97:	48 b8 e1 29 80 00 00 	movabs $0x8029e1,%rax
  802a9e:	00 00 00 
  802aa1:	ff d0                	callq  *%rax
  802aa3:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802aa6:	48 98                	cltq   
  802aa8:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802aae:	48 c1 e0 0c          	shl    $0xc,%rax
  802ab2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802ab6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802aba:	48 89 c7             	mov    %rax,%rdi
  802abd:	48 b8 0c 27 80 00 00 	movabs $0x80270c,%rax
  802ac4:	00 00 00 
  802ac7:	ff d0                	callq  *%rax
  802ac9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802acd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ad1:	48 89 c7             	mov    %rax,%rdi
  802ad4:	48 b8 0c 27 80 00 00 	movabs $0x80270c,%rax
  802adb:	00 00 00 
  802ade:	ff d0                	callq  *%rax
  802ae0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802ae4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ae8:	48 c1 e8 15          	shr    $0x15,%rax
  802aec:	48 89 c2             	mov    %rax,%rdx
  802aef:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802af6:	01 00 00 
  802af9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802afd:	83 e0 01             	and    $0x1,%eax
  802b00:	48 85 c0             	test   %rax,%rax
  802b03:	74 71                	je     802b76 <dup+0x11b>
  802b05:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b09:	48 c1 e8 0c          	shr    $0xc,%rax
  802b0d:	48 89 c2             	mov    %rax,%rdx
  802b10:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b17:	01 00 00 
  802b1a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b1e:	83 e0 01             	and    $0x1,%eax
  802b21:	48 85 c0             	test   %rax,%rax
  802b24:	74 50                	je     802b76 <dup+0x11b>
  802b26:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b2a:	48 c1 e8 0c          	shr    $0xc,%rax
  802b2e:	48 89 c2             	mov    %rax,%rdx
  802b31:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b38:	01 00 00 
  802b3b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b3f:	25 07 0e 00 00       	and    $0xe07,%eax
  802b44:	89 c1                	mov    %eax,%ecx
  802b46:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802b4a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b4e:	41 89 c8             	mov    %ecx,%r8d
  802b51:	48 89 d1             	mov    %rdx,%rcx
  802b54:	ba 00 00 00 00       	mov    $0x0,%edx
  802b59:	48 89 c6             	mov    %rax,%rsi
  802b5c:	bf 00 00 00 00       	mov    $0x0,%edi
  802b61:	48 b8 3f 23 80 00 00 	movabs $0x80233f,%rax
  802b68:	00 00 00 
  802b6b:	ff d0                	callq  *%rax
  802b6d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b70:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b74:	78 55                	js     802bcb <dup+0x170>
  802b76:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b7a:	48 c1 e8 0c          	shr    $0xc,%rax
  802b7e:	48 89 c2             	mov    %rax,%rdx
  802b81:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b88:	01 00 00 
  802b8b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b8f:	25 07 0e 00 00       	and    $0xe07,%eax
  802b94:	89 c1                	mov    %eax,%ecx
  802b96:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b9a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802b9e:	41 89 c8             	mov    %ecx,%r8d
  802ba1:	48 89 d1             	mov    %rdx,%rcx
  802ba4:	ba 00 00 00 00       	mov    $0x0,%edx
  802ba9:	48 89 c6             	mov    %rax,%rsi
  802bac:	bf 00 00 00 00       	mov    $0x0,%edi
  802bb1:	48 b8 3f 23 80 00 00 	movabs $0x80233f,%rax
  802bb8:	00 00 00 
  802bbb:	ff d0                	callq  *%rax
  802bbd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bc0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802bc4:	78 08                	js     802bce <dup+0x173>
  802bc6:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802bc9:	eb 37                	jmp    802c02 <dup+0x1a7>
  802bcb:	90                   	nop
  802bcc:	eb 01                	jmp    802bcf <dup+0x174>
  802bce:	90                   	nop
  802bcf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bd3:	48 89 c6             	mov    %rax,%rsi
  802bd6:	bf 00 00 00 00       	mov    $0x0,%edi
  802bdb:	48 b8 9f 23 80 00 00 	movabs $0x80239f,%rax
  802be2:	00 00 00 
  802be5:	ff d0                	callq  *%rax
  802be7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802beb:	48 89 c6             	mov    %rax,%rsi
  802bee:	bf 00 00 00 00       	mov    $0x0,%edi
  802bf3:	48 b8 9f 23 80 00 00 	movabs $0x80239f,%rax
  802bfa:	00 00 00 
  802bfd:	ff d0                	callq  *%rax
  802bff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c02:	c9                   	leaveq 
  802c03:	c3                   	retq   

0000000000802c04 <read>:
  802c04:	55                   	push   %rbp
  802c05:	48 89 e5             	mov    %rsp,%rbp
  802c08:	48 83 ec 40          	sub    $0x40,%rsp
  802c0c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802c0f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802c13:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802c17:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802c1b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802c1e:	48 89 d6             	mov    %rdx,%rsi
  802c21:	89 c7                	mov    %eax,%edi
  802c23:	48 b8 cf 27 80 00 00 	movabs $0x8027cf,%rax
  802c2a:	00 00 00 
  802c2d:	ff d0                	callq  *%rax
  802c2f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c32:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c36:	78 24                	js     802c5c <read+0x58>
  802c38:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c3c:	8b 00                	mov    (%rax),%eax
  802c3e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c42:	48 89 d6             	mov    %rdx,%rsi
  802c45:	89 c7                	mov    %eax,%edi
  802c47:	48 b8 2a 29 80 00 00 	movabs $0x80292a,%rax
  802c4e:	00 00 00 
  802c51:	ff d0                	callq  *%rax
  802c53:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c56:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c5a:	79 05                	jns    802c61 <read+0x5d>
  802c5c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c5f:	eb 76                	jmp    802cd7 <read+0xd3>
  802c61:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c65:	8b 40 08             	mov    0x8(%rax),%eax
  802c68:	83 e0 03             	and    $0x3,%eax
  802c6b:	83 f8 01             	cmp    $0x1,%eax
  802c6e:	75 3a                	jne    802caa <read+0xa6>
  802c70:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802c77:	00 00 00 
  802c7a:	48 8b 00             	mov    (%rax),%rax
  802c7d:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802c83:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802c86:	89 c6                	mov    %eax,%esi
  802c88:	48 bf 37 5c 80 00 00 	movabs $0x805c37,%rdi
  802c8f:	00 00 00 
  802c92:	b8 00 00 00 00       	mov    $0x0,%eax
  802c97:	48 b9 2d 0e 80 00 00 	movabs $0x800e2d,%rcx
  802c9e:	00 00 00 
  802ca1:	ff d1                	callq  *%rcx
  802ca3:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802ca8:	eb 2d                	jmp    802cd7 <read+0xd3>
  802caa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cae:	48 8b 40 10          	mov    0x10(%rax),%rax
  802cb2:	48 85 c0             	test   %rax,%rax
  802cb5:	75 07                	jne    802cbe <read+0xba>
  802cb7:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802cbc:	eb 19                	jmp    802cd7 <read+0xd3>
  802cbe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cc2:	48 8b 40 10          	mov    0x10(%rax),%rax
  802cc6:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802cca:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802cce:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802cd2:	48 89 cf             	mov    %rcx,%rdi
  802cd5:	ff d0                	callq  *%rax
  802cd7:	c9                   	leaveq 
  802cd8:	c3                   	retq   

0000000000802cd9 <readn>:
  802cd9:	55                   	push   %rbp
  802cda:	48 89 e5             	mov    %rsp,%rbp
  802cdd:	48 83 ec 30          	sub    $0x30,%rsp
  802ce1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ce4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ce8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802cec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802cf3:	eb 47                	jmp    802d3c <readn+0x63>
  802cf5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cf8:	48 98                	cltq   
  802cfa:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802cfe:	48 29 c2             	sub    %rax,%rdx
  802d01:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d04:	48 63 c8             	movslq %eax,%rcx
  802d07:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d0b:	48 01 c1             	add    %rax,%rcx
  802d0e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d11:	48 89 ce             	mov    %rcx,%rsi
  802d14:	89 c7                	mov    %eax,%edi
  802d16:	48 b8 04 2c 80 00 00 	movabs $0x802c04,%rax
  802d1d:	00 00 00 
  802d20:	ff d0                	callq  *%rax
  802d22:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802d25:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802d29:	79 05                	jns    802d30 <readn+0x57>
  802d2b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d2e:	eb 1d                	jmp    802d4d <readn+0x74>
  802d30:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802d34:	74 13                	je     802d49 <readn+0x70>
  802d36:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d39:	01 45 fc             	add    %eax,-0x4(%rbp)
  802d3c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d3f:	48 98                	cltq   
  802d41:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802d45:	72 ae                	jb     802cf5 <readn+0x1c>
  802d47:	eb 01                	jmp    802d4a <readn+0x71>
  802d49:	90                   	nop
  802d4a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d4d:	c9                   	leaveq 
  802d4e:	c3                   	retq   

0000000000802d4f <write>:
  802d4f:	55                   	push   %rbp
  802d50:	48 89 e5             	mov    %rsp,%rbp
  802d53:	48 83 ec 40          	sub    $0x40,%rsp
  802d57:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802d5a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802d5e:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802d62:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802d66:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802d69:	48 89 d6             	mov    %rdx,%rsi
  802d6c:	89 c7                	mov    %eax,%edi
  802d6e:	48 b8 cf 27 80 00 00 	movabs $0x8027cf,%rax
  802d75:	00 00 00 
  802d78:	ff d0                	callq  *%rax
  802d7a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d7d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d81:	78 24                	js     802da7 <write+0x58>
  802d83:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d87:	8b 00                	mov    (%rax),%eax
  802d89:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d8d:	48 89 d6             	mov    %rdx,%rsi
  802d90:	89 c7                	mov    %eax,%edi
  802d92:	48 b8 2a 29 80 00 00 	movabs $0x80292a,%rax
  802d99:	00 00 00 
  802d9c:	ff d0                	callq  *%rax
  802d9e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802da1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802da5:	79 05                	jns    802dac <write+0x5d>
  802da7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802daa:	eb 75                	jmp    802e21 <write+0xd2>
  802dac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802db0:	8b 40 08             	mov    0x8(%rax),%eax
  802db3:	83 e0 03             	and    $0x3,%eax
  802db6:	85 c0                	test   %eax,%eax
  802db8:	75 3a                	jne    802df4 <write+0xa5>
  802dba:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802dc1:	00 00 00 
  802dc4:	48 8b 00             	mov    (%rax),%rax
  802dc7:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802dcd:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802dd0:	89 c6                	mov    %eax,%esi
  802dd2:	48 bf 53 5c 80 00 00 	movabs $0x805c53,%rdi
  802dd9:	00 00 00 
  802ddc:	b8 00 00 00 00       	mov    $0x0,%eax
  802de1:	48 b9 2d 0e 80 00 00 	movabs $0x800e2d,%rcx
  802de8:	00 00 00 
  802deb:	ff d1                	callq  *%rcx
  802ded:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802df2:	eb 2d                	jmp    802e21 <write+0xd2>
  802df4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802df8:	48 8b 40 18          	mov    0x18(%rax),%rax
  802dfc:	48 85 c0             	test   %rax,%rax
  802dff:	75 07                	jne    802e08 <write+0xb9>
  802e01:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802e06:	eb 19                	jmp    802e21 <write+0xd2>
  802e08:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e0c:	48 8b 40 18          	mov    0x18(%rax),%rax
  802e10:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802e14:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802e18:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802e1c:	48 89 cf             	mov    %rcx,%rdi
  802e1f:	ff d0                	callq  *%rax
  802e21:	c9                   	leaveq 
  802e22:	c3                   	retq   

0000000000802e23 <seek>:
  802e23:	55                   	push   %rbp
  802e24:	48 89 e5             	mov    %rsp,%rbp
  802e27:	48 83 ec 18          	sub    $0x18,%rsp
  802e2b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e2e:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802e31:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e35:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e38:	48 89 d6             	mov    %rdx,%rsi
  802e3b:	89 c7                	mov    %eax,%edi
  802e3d:	48 b8 cf 27 80 00 00 	movabs $0x8027cf,%rax
  802e44:	00 00 00 
  802e47:	ff d0                	callq  *%rax
  802e49:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e4c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e50:	79 05                	jns    802e57 <seek+0x34>
  802e52:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e55:	eb 0f                	jmp    802e66 <seek+0x43>
  802e57:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e5b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802e5e:	89 50 04             	mov    %edx,0x4(%rax)
  802e61:	b8 00 00 00 00       	mov    $0x0,%eax
  802e66:	c9                   	leaveq 
  802e67:	c3                   	retq   

0000000000802e68 <ftruncate>:
  802e68:	55                   	push   %rbp
  802e69:	48 89 e5             	mov    %rsp,%rbp
  802e6c:	48 83 ec 30          	sub    $0x30,%rsp
  802e70:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802e73:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802e76:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802e7a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802e7d:	48 89 d6             	mov    %rdx,%rsi
  802e80:	89 c7                	mov    %eax,%edi
  802e82:	48 b8 cf 27 80 00 00 	movabs $0x8027cf,%rax
  802e89:	00 00 00 
  802e8c:	ff d0                	callq  *%rax
  802e8e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e91:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e95:	78 24                	js     802ebb <ftruncate+0x53>
  802e97:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e9b:	8b 00                	mov    (%rax),%eax
  802e9d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ea1:	48 89 d6             	mov    %rdx,%rsi
  802ea4:	89 c7                	mov    %eax,%edi
  802ea6:	48 b8 2a 29 80 00 00 	movabs $0x80292a,%rax
  802ead:	00 00 00 
  802eb0:	ff d0                	callq  *%rax
  802eb2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802eb5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802eb9:	79 05                	jns    802ec0 <ftruncate+0x58>
  802ebb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ebe:	eb 72                	jmp    802f32 <ftruncate+0xca>
  802ec0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ec4:	8b 40 08             	mov    0x8(%rax),%eax
  802ec7:	83 e0 03             	and    $0x3,%eax
  802eca:	85 c0                	test   %eax,%eax
  802ecc:	75 3a                	jne    802f08 <ftruncate+0xa0>
  802ece:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802ed5:	00 00 00 
  802ed8:	48 8b 00             	mov    (%rax),%rax
  802edb:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802ee1:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802ee4:	89 c6                	mov    %eax,%esi
  802ee6:	48 bf 70 5c 80 00 00 	movabs $0x805c70,%rdi
  802eed:	00 00 00 
  802ef0:	b8 00 00 00 00       	mov    $0x0,%eax
  802ef5:	48 b9 2d 0e 80 00 00 	movabs $0x800e2d,%rcx
  802efc:	00 00 00 
  802eff:	ff d1                	callq  *%rcx
  802f01:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802f06:	eb 2a                	jmp    802f32 <ftruncate+0xca>
  802f08:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f0c:	48 8b 40 30          	mov    0x30(%rax),%rax
  802f10:	48 85 c0             	test   %rax,%rax
  802f13:	75 07                	jne    802f1c <ftruncate+0xb4>
  802f15:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802f1a:	eb 16                	jmp    802f32 <ftruncate+0xca>
  802f1c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f20:	48 8b 40 30          	mov    0x30(%rax),%rax
  802f24:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802f28:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802f2b:	89 ce                	mov    %ecx,%esi
  802f2d:	48 89 d7             	mov    %rdx,%rdi
  802f30:	ff d0                	callq  *%rax
  802f32:	c9                   	leaveq 
  802f33:	c3                   	retq   

0000000000802f34 <fstat>:
  802f34:	55                   	push   %rbp
  802f35:	48 89 e5             	mov    %rsp,%rbp
  802f38:	48 83 ec 30          	sub    $0x30,%rsp
  802f3c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802f3f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802f43:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802f47:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802f4a:	48 89 d6             	mov    %rdx,%rsi
  802f4d:	89 c7                	mov    %eax,%edi
  802f4f:	48 b8 cf 27 80 00 00 	movabs $0x8027cf,%rax
  802f56:	00 00 00 
  802f59:	ff d0                	callq  *%rax
  802f5b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f5e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f62:	78 24                	js     802f88 <fstat+0x54>
  802f64:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f68:	8b 00                	mov    (%rax),%eax
  802f6a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802f6e:	48 89 d6             	mov    %rdx,%rsi
  802f71:	89 c7                	mov    %eax,%edi
  802f73:	48 b8 2a 29 80 00 00 	movabs $0x80292a,%rax
  802f7a:	00 00 00 
  802f7d:	ff d0                	callq  *%rax
  802f7f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f82:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f86:	79 05                	jns    802f8d <fstat+0x59>
  802f88:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f8b:	eb 5e                	jmp    802feb <fstat+0xb7>
  802f8d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f91:	48 8b 40 28          	mov    0x28(%rax),%rax
  802f95:	48 85 c0             	test   %rax,%rax
  802f98:	75 07                	jne    802fa1 <fstat+0x6d>
  802f9a:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802f9f:	eb 4a                	jmp    802feb <fstat+0xb7>
  802fa1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802fa5:	c6 00 00             	movb   $0x0,(%rax)
  802fa8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802fac:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802fb3:	00 00 00 
  802fb6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802fba:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802fc1:	00 00 00 
  802fc4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802fc8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802fcc:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802fd3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fd7:	48 8b 40 28          	mov    0x28(%rax),%rax
  802fdb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802fdf:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802fe3:	48 89 ce             	mov    %rcx,%rsi
  802fe6:	48 89 d7             	mov    %rdx,%rdi
  802fe9:	ff d0                	callq  *%rax
  802feb:	c9                   	leaveq 
  802fec:	c3                   	retq   

0000000000802fed <stat>:
  802fed:	55                   	push   %rbp
  802fee:	48 89 e5             	mov    %rsp,%rbp
  802ff1:	48 83 ec 20          	sub    $0x20,%rsp
  802ff5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802ff9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ffd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803001:	be 00 00 00 00       	mov    $0x0,%esi
  803006:	48 89 c7             	mov    %rax,%rdi
  803009:	48 b8 dd 30 80 00 00 	movabs $0x8030dd,%rax
  803010:	00 00 00 
  803013:	ff d0                	callq  *%rax
  803015:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803018:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80301c:	79 05                	jns    803023 <stat+0x36>
  80301e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803021:	eb 2f                	jmp    803052 <stat+0x65>
  803023:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803027:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80302a:	48 89 d6             	mov    %rdx,%rsi
  80302d:	89 c7                	mov    %eax,%edi
  80302f:	48 b8 34 2f 80 00 00 	movabs $0x802f34,%rax
  803036:	00 00 00 
  803039:	ff d0                	callq  *%rax
  80303b:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80303e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803041:	89 c7                	mov    %eax,%edi
  803043:	48 b8 e1 29 80 00 00 	movabs $0x8029e1,%rax
  80304a:	00 00 00 
  80304d:	ff d0                	callq  *%rax
  80304f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803052:	c9                   	leaveq 
  803053:	c3                   	retq   

0000000000803054 <fsipc>:
  803054:	55                   	push   %rbp
  803055:	48 89 e5             	mov    %rsp,%rbp
  803058:	48 83 ec 10          	sub    $0x10,%rsp
  80305c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80305f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803063:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80306a:	00 00 00 
  80306d:	8b 00                	mov    (%rax),%eax
  80306f:	85 c0                	test   %eax,%eax
  803071:	75 1f                	jne    803092 <fsipc+0x3e>
  803073:	bf 01 00 00 00       	mov    $0x1,%edi
  803078:	48 b8 e1 4e 80 00 00 	movabs $0x804ee1,%rax
  80307f:	00 00 00 
  803082:	ff d0                	callq  *%rax
  803084:	89 c2                	mov    %eax,%edx
  803086:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80308d:	00 00 00 
  803090:	89 10                	mov    %edx,(%rax)
  803092:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803099:	00 00 00 
  80309c:	8b 00                	mov    (%rax),%eax
  80309e:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8030a1:	b9 07 00 00 00       	mov    $0x7,%ecx
  8030a6:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  8030ad:	00 00 00 
  8030b0:	89 c7                	mov    %eax,%edi
  8030b2:	48 b8 d7 4d 80 00 00 	movabs $0x804dd7,%rax
  8030b9:	00 00 00 
  8030bc:	ff d0                	callq  *%rax
  8030be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030c2:	ba 00 00 00 00       	mov    $0x0,%edx
  8030c7:	48 89 c6             	mov    %rax,%rsi
  8030ca:	bf 00 00 00 00       	mov    $0x0,%edi
  8030cf:	48 b8 16 4d 80 00 00 	movabs $0x804d16,%rax
  8030d6:	00 00 00 
  8030d9:	ff d0                	callq  *%rax
  8030db:	c9                   	leaveq 
  8030dc:	c3                   	retq   

00000000008030dd <open>:
  8030dd:	55                   	push   %rbp
  8030de:	48 89 e5             	mov    %rsp,%rbp
  8030e1:	48 83 ec 20          	sub    $0x20,%rsp
  8030e5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8030e9:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8030ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030f0:	48 89 c7             	mov    %rax,%rdi
  8030f3:	48 b8 51 19 80 00 00 	movabs $0x801951,%rax
  8030fa:	00 00 00 
  8030fd:	ff d0                	callq  *%rax
  8030ff:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803104:	7e 0a                	jle    803110 <open+0x33>
  803106:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80310b:	e9 a5 00 00 00       	jmpq   8031b5 <open+0xd8>
  803110:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803114:	48 89 c7             	mov    %rax,%rdi
  803117:	48 b8 37 27 80 00 00 	movabs $0x802737,%rax
  80311e:	00 00 00 
  803121:	ff d0                	callq  *%rax
  803123:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803126:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80312a:	79 08                	jns    803134 <open+0x57>
  80312c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80312f:	e9 81 00 00 00       	jmpq   8031b5 <open+0xd8>
  803134:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803138:	48 89 c6             	mov    %rax,%rsi
  80313b:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  803142:	00 00 00 
  803145:	48 b8 bd 19 80 00 00 	movabs $0x8019bd,%rax
  80314c:	00 00 00 
  80314f:	ff d0                	callq  *%rax
  803151:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803158:	00 00 00 
  80315b:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80315e:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  803164:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803168:	48 89 c6             	mov    %rax,%rsi
  80316b:	bf 01 00 00 00       	mov    $0x1,%edi
  803170:	48 b8 54 30 80 00 00 	movabs $0x803054,%rax
  803177:	00 00 00 
  80317a:	ff d0                	callq  *%rax
  80317c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80317f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803183:	79 1d                	jns    8031a2 <open+0xc5>
  803185:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803189:	be 00 00 00 00       	mov    $0x0,%esi
  80318e:	48 89 c7             	mov    %rax,%rdi
  803191:	48 b8 5f 28 80 00 00 	movabs $0x80285f,%rax
  803198:	00 00 00 
  80319b:	ff d0                	callq  *%rax
  80319d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031a0:	eb 13                	jmp    8031b5 <open+0xd8>
  8031a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031a6:	48 89 c7             	mov    %rax,%rdi
  8031a9:	48 b8 e9 26 80 00 00 	movabs $0x8026e9,%rax
  8031b0:	00 00 00 
  8031b3:	ff d0                	callq  *%rax
  8031b5:	c9                   	leaveq 
  8031b6:	c3                   	retq   

00000000008031b7 <devfile_flush>:
  8031b7:	55                   	push   %rbp
  8031b8:	48 89 e5             	mov    %rsp,%rbp
  8031bb:	48 83 ec 10          	sub    $0x10,%rsp
  8031bf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8031c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8031c7:	8b 50 0c             	mov    0xc(%rax),%edx
  8031ca:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8031d1:	00 00 00 
  8031d4:	89 10                	mov    %edx,(%rax)
  8031d6:	be 00 00 00 00       	mov    $0x0,%esi
  8031db:	bf 06 00 00 00       	mov    $0x6,%edi
  8031e0:	48 b8 54 30 80 00 00 	movabs $0x803054,%rax
  8031e7:	00 00 00 
  8031ea:	ff d0                	callq  *%rax
  8031ec:	c9                   	leaveq 
  8031ed:	c3                   	retq   

00000000008031ee <devfile_read>:
  8031ee:	55                   	push   %rbp
  8031ef:	48 89 e5             	mov    %rsp,%rbp
  8031f2:	48 83 ec 30          	sub    $0x30,%rsp
  8031f6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8031fa:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8031fe:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803202:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803206:	8b 50 0c             	mov    0xc(%rax),%edx
  803209:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803210:	00 00 00 
  803213:	89 10                	mov    %edx,(%rax)
  803215:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80321c:	00 00 00 
  80321f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803223:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803227:	be 00 00 00 00       	mov    $0x0,%esi
  80322c:	bf 03 00 00 00       	mov    $0x3,%edi
  803231:	48 b8 54 30 80 00 00 	movabs $0x803054,%rax
  803238:	00 00 00 
  80323b:	ff d0                	callq  *%rax
  80323d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803240:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803244:	79 08                	jns    80324e <devfile_read+0x60>
  803246:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803249:	e9 a4 00 00 00       	jmpq   8032f2 <devfile_read+0x104>
  80324e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803251:	48 98                	cltq   
  803253:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803257:	76 35                	jbe    80328e <devfile_read+0xa0>
  803259:	48 b9 96 5c 80 00 00 	movabs $0x805c96,%rcx
  803260:	00 00 00 
  803263:	48 ba 9d 5c 80 00 00 	movabs $0x805c9d,%rdx
  80326a:	00 00 00 
  80326d:	be 89 00 00 00       	mov    $0x89,%esi
  803272:	48 bf b2 5c 80 00 00 	movabs $0x805cb2,%rdi
  803279:	00 00 00 
  80327c:	b8 00 00 00 00       	mov    $0x0,%eax
  803281:	49 b8 f3 0b 80 00 00 	movabs $0x800bf3,%r8
  803288:	00 00 00 
  80328b:	41 ff d0             	callq  *%r8
  80328e:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  803295:	7e 35                	jle    8032cc <devfile_read+0xde>
  803297:	48 b9 c0 5c 80 00 00 	movabs $0x805cc0,%rcx
  80329e:	00 00 00 
  8032a1:	48 ba 9d 5c 80 00 00 	movabs $0x805c9d,%rdx
  8032a8:	00 00 00 
  8032ab:	be 8a 00 00 00       	mov    $0x8a,%esi
  8032b0:	48 bf b2 5c 80 00 00 	movabs $0x805cb2,%rdi
  8032b7:	00 00 00 
  8032ba:	b8 00 00 00 00       	mov    $0x0,%eax
  8032bf:	49 b8 f3 0b 80 00 00 	movabs $0x800bf3,%r8
  8032c6:	00 00 00 
  8032c9:	41 ff d0             	callq  *%r8
  8032cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032cf:	48 63 d0             	movslq %eax,%rdx
  8032d2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8032d6:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  8032dd:	00 00 00 
  8032e0:	48 89 c7             	mov    %rax,%rdi
  8032e3:	48 b8 e2 1c 80 00 00 	movabs $0x801ce2,%rax
  8032ea:	00 00 00 
  8032ed:	ff d0                	callq  *%rax
  8032ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032f2:	c9                   	leaveq 
  8032f3:	c3                   	retq   

00000000008032f4 <devfile_write>:
  8032f4:	55                   	push   %rbp
  8032f5:	48 89 e5             	mov    %rsp,%rbp
  8032f8:	48 83 ec 40          	sub    $0x40,%rsp
  8032fc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803300:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803304:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803308:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80330c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803310:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  803317:	00 
  803318:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80331c:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  803320:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  803325:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  803329:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80332d:	8b 50 0c             	mov    0xc(%rax),%edx
  803330:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803337:	00 00 00 
  80333a:	89 10                	mov    %edx,(%rax)
  80333c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803343:	00 00 00 
  803346:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80334a:	48 89 50 08          	mov    %rdx,0x8(%rax)
  80334e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803352:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803356:	48 89 c6             	mov    %rax,%rsi
  803359:	48 bf 10 a0 80 00 00 	movabs $0x80a010,%rdi
  803360:	00 00 00 
  803363:	48 b8 e2 1c 80 00 00 	movabs $0x801ce2,%rax
  80336a:	00 00 00 
  80336d:	ff d0                	callq  *%rax
  80336f:	be 00 00 00 00       	mov    $0x0,%esi
  803374:	bf 04 00 00 00       	mov    $0x4,%edi
  803379:	48 b8 54 30 80 00 00 	movabs $0x803054,%rax
  803380:	00 00 00 
  803383:	ff d0                	callq  *%rax
  803385:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803388:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80338c:	79 05                	jns    803393 <devfile_write+0x9f>
  80338e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803391:	eb 43                	jmp    8033d6 <devfile_write+0xe2>
  803393:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803396:	48 98                	cltq   
  803398:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80339c:	76 35                	jbe    8033d3 <devfile_write+0xdf>
  80339e:	48 b9 96 5c 80 00 00 	movabs $0x805c96,%rcx
  8033a5:	00 00 00 
  8033a8:	48 ba 9d 5c 80 00 00 	movabs $0x805c9d,%rdx
  8033af:	00 00 00 
  8033b2:	be a8 00 00 00       	mov    $0xa8,%esi
  8033b7:	48 bf b2 5c 80 00 00 	movabs $0x805cb2,%rdi
  8033be:	00 00 00 
  8033c1:	b8 00 00 00 00       	mov    $0x0,%eax
  8033c6:	49 b8 f3 0b 80 00 00 	movabs $0x800bf3,%r8
  8033cd:	00 00 00 
  8033d0:	41 ff d0             	callq  *%r8
  8033d3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8033d6:	c9                   	leaveq 
  8033d7:	c3                   	retq   

00000000008033d8 <devfile_stat>:
  8033d8:	55                   	push   %rbp
  8033d9:	48 89 e5             	mov    %rsp,%rbp
  8033dc:	48 83 ec 20          	sub    $0x20,%rsp
  8033e0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8033e4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8033e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033ec:	8b 50 0c             	mov    0xc(%rax),%edx
  8033ef:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033f6:	00 00 00 
  8033f9:	89 10                	mov    %edx,(%rax)
  8033fb:	be 00 00 00 00       	mov    $0x0,%esi
  803400:	bf 05 00 00 00       	mov    $0x5,%edi
  803405:	48 b8 54 30 80 00 00 	movabs $0x803054,%rax
  80340c:	00 00 00 
  80340f:	ff d0                	callq  *%rax
  803411:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803414:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803418:	79 05                	jns    80341f <devfile_stat+0x47>
  80341a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80341d:	eb 56                	jmp    803475 <devfile_stat+0x9d>
  80341f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803423:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  80342a:	00 00 00 
  80342d:	48 89 c7             	mov    %rax,%rdi
  803430:	48 b8 bd 19 80 00 00 	movabs $0x8019bd,%rax
  803437:	00 00 00 
  80343a:	ff d0                	callq  *%rax
  80343c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803443:	00 00 00 
  803446:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  80344c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803450:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803456:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80345d:	00 00 00 
  803460:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803466:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80346a:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803470:	b8 00 00 00 00       	mov    $0x0,%eax
  803475:	c9                   	leaveq 
  803476:	c3                   	retq   

0000000000803477 <devfile_trunc>:
  803477:	55                   	push   %rbp
  803478:	48 89 e5             	mov    %rsp,%rbp
  80347b:	48 83 ec 10          	sub    $0x10,%rsp
  80347f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803483:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803486:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80348a:	8b 50 0c             	mov    0xc(%rax),%edx
  80348d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803494:	00 00 00 
  803497:	89 10                	mov    %edx,(%rax)
  803499:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8034a0:	00 00 00 
  8034a3:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8034a6:	89 50 04             	mov    %edx,0x4(%rax)
  8034a9:	be 00 00 00 00       	mov    $0x0,%esi
  8034ae:	bf 02 00 00 00       	mov    $0x2,%edi
  8034b3:	48 b8 54 30 80 00 00 	movabs $0x803054,%rax
  8034ba:	00 00 00 
  8034bd:	ff d0                	callq  *%rax
  8034bf:	c9                   	leaveq 
  8034c0:	c3                   	retq   

00000000008034c1 <remove>:
  8034c1:	55                   	push   %rbp
  8034c2:	48 89 e5             	mov    %rsp,%rbp
  8034c5:	48 83 ec 10          	sub    $0x10,%rsp
  8034c9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8034cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8034d1:	48 89 c7             	mov    %rax,%rdi
  8034d4:	48 b8 51 19 80 00 00 	movabs $0x801951,%rax
  8034db:	00 00 00 
  8034de:	ff d0                	callq  *%rax
  8034e0:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8034e5:	7e 07                	jle    8034ee <remove+0x2d>
  8034e7:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8034ec:	eb 33                	jmp    803521 <remove+0x60>
  8034ee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8034f2:	48 89 c6             	mov    %rax,%rsi
  8034f5:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  8034fc:	00 00 00 
  8034ff:	48 b8 bd 19 80 00 00 	movabs $0x8019bd,%rax
  803506:	00 00 00 
  803509:	ff d0                	callq  *%rax
  80350b:	be 00 00 00 00       	mov    $0x0,%esi
  803510:	bf 07 00 00 00       	mov    $0x7,%edi
  803515:	48 b8 54 30 80 00 00 	movabs $0x803054,%rax
  80351c:	00 00 00 
  80351f:	ff d0                	callq  *%rax
  803521:	c9                   	leaveq 
  803522:	c3                   	retq   

0000000000803523 <sync>:
  803523:	55                   	push   %rbp
  803524:	48 89 e5             	mov    %rsp,%rbp
  803527:	be 00 00 00 00       	mov    $0x0,%esi
  80352c:	bf 08 00 00 00       	mov    $0x8,%edi
  803531:	48 b8 54 30 80 00 00 	movabs $0x803054,%rax
  803538:	00 00 00 
  80353b:	ff d0                	callq  *%rax
  80353d:	5d                   	pop    %rbp
  80353e:	c3                   	retq   

000000000080353f <copy>:
  80353f:	55                   	push   %rbp
  803540:	48 89 e5             	mov    %rsp,%rbp
  803543:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  80354a:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803551:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803558:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  80355f:	be 00 00 00 00       	mov    $0x0,%esi
  803564:	48 89 c7             	mov    %rax,%rdi
  803567:	48 b8 dd 30 80 00 00 	movabs $0x8030dd,%rax
  80356e:	00 00 00 
  803571:	ff d0                	callq  *%rax
  803573:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803576:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80357a:	79 28                	jns    8035a4 <copy+0x65>
  80357c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80357f:	89 c6                	mov    %eax,%esi
  803581:	48 bf cc 5c 80 00 00 	movabs $0x805ccc,%rdi
  803588:	00 00 00 
  80358b:	b8 00 00 00 00       	mov    $0x0,%eax
  803590:	48 ba 2d 0e 80 00 00 	movabs $0x800e2d,%rdx
  803597:	00 00 00 
  80359a:	ff d2                	callq  *%rdx
  80359c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80359f:	e9 76 01 00 00       	jmpq   80371a <copy+0x1db>
  8035a4:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  8035ab:	be 01 01 00 00       	mov    $0x101,%esi
  8035b0:	48 89 c7             	mov    %rax,%rdi
  8035b3:	48 b8 dd 30 80 00 00 	movabs $0x8030dd,%rax
  8035ba:	00 00 00 
  8035bd:	ff d0                	callq  *%rax
  8035bf:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8035c2:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8035c6:	0f 89 ad 00 00 00    	jns    803679 <copy+0x13a>
  8035cc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035cf:	89 c6                	mov    %eax,%esi
  8035d1:	48 bf e2 5c 80 00 00 	movabs $0x805ce2,%rdi
  8035d8:	00 00 00 
  8035db:	b8 00 00 00 00       	mov    $0x0,%eax
  8035e0:	48 ba 2d 0e 80 00 00 	movabs $0x800e2d,%rdx
  8035e7:	00 00 00 
  8035ea:	ff d2                	callq  *%rdx
  8035ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035ef:	89 c7                	mov    %eax,%edi
  8035f1:	48 b8 e1 29 80 00 00 	movabs $0x8029e1,%rax
  8035f8:	00 00 00 
  8035fb:	ff d0                	callq  *%rax
  8035fd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803600:	e9 15 01 00 00       	jmpq   80371a <copy+0x1db>
  803605:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803608:	48 63 d0             	movslq %eax,%rdx
  80360b:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803612:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803615:	48 89 ce             	mov    %rcx,%rsi
  803618:	89 c7                	mov    %eax,%edi
  80361a:	48 b8 4f 2d 80 00 00 	movabs $0x802d4f,%rax
  803621:	00 00 00 
  803624:	ff d0                	callq  *%rax
  803626:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803629:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80362d:	79 4a                	jns    803679 <copy+0x13a>
  80362f:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803632:	89 c6                	mov    %eax,%esi
  803634:	48 bf fc 5c 80 00 00 	movabs $0x805cfc,%rdi
  80363b:	00 00 00 
  80363e:	b8 00 00 00 00       	mov    $0x0,%eax
  803643:	48 ba 2d 0e 80 00 00 	movabs $0x800e2d,%rdx
  80364a:	00 00 00 
  80364d:	ff d2                	callq  *%rdx
  80364f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803652:	89 c7                	mov    %eax,%edi
  803654:	48 b8 e1 29 80 00 00 	movabs $0x8029e1,%rax
  80365b:	00 00 00 
  80365e:	ff d0                	callq  *%rax
  803660:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803663:	89 c7                	mov    %eax,%edi
  803665:	48 b8 e1 29 80 00 00 	movabs $0x8029e1,%rax
  80366c:	00 00 00 
  80366f:	ff d0                	callq  *%rax
  803671:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803674:	e9 a1 00 00 00       	jmpq   80371a <copy+0x1db>
  803679:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803680:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803683:	ba 00 02 00 00       	mov    $0x200,%edx
  803688:	48 89 ce             	mov    %rcx,%rsi
  80368b:	89 c7                	mov    %eax,%edi
  80368d:	48 b8 04 2c 80 00 00 	movabs $0x802c04,%rax
  803694:	00 00 00 
  803697:	ff d0                	callq  *%rax
  803699:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80369c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8036a0:	0f 8f 5f ff ff ff    	jg     803605 <copy+0xc6>
  8036a6:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8036aa:	79 47                	jns    8036f3 <copy+0x1b4>
  8036ac:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8036af:	89 c6                	mov    %eax,%esi
  8036b1:	48 bf 0f 5d 80 00 00 	movabs $0x805d0f,%rdi
  8036b8:	00 00 00 
  8036bb:	b8 00 00 00 00       	mov    $0x0,%eax
  8036c0:	48 ba 2d 0e 80 00 00 	movabs $0x800e2d,%rdx
  8036c7:	00 00 00 
  8036ca:	ff d2                	callq  *%rdx
  8036cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036cf:	89 c7                	mov    %eax,%edi
  8036d1:	48 b8 e1 29 80 00 00 	movabs $0x8029e1,%rax
  8036d8:	00 00 00 
  8036db:	ff d0                	callq  *%rax
  8036dd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036e0:	89 c7                	mov    %eax,%edi
  8036e2:	48 b8 e1 29 80 00 00 	movabs $0x8029e1,%rax
  8036e9:	00 00 00 
  8036ec:	ff d0                	callq  *%rax
  8036ee:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8036f1:	eb 27                	jmp    80371a <copy+0x1db>
  8036f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036f6:	89 c7                	mov    %eax,%edi
  8036f8:	48 b8 e1 29 80 00 00 	movabs $0x8029e1,%rax
  8036ff:	00 00 00 
  803702:	ff d0                	callq  *%rax
  803704:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803707:	89 c7                	mov    %eax,%edi
  803709:	48 b8 e1 29 80 00 00 	movabs $0x8029e1,%rax
  803710:	00 00 00 
  803713:	ff d0                	callq  *%rax
  803715:	b8 00 00 00 00       	mov    $0x0,%eax
  80371a:	c9                   	leaveq 
  80371b:	c3                   	retq   

000000000080371c <fd2sockid>:
  80371c:	55                   	push   %rbp
  80371d:	48 89 e5             	mov    %rsp,%rbp
  803720:	48 83 ec 20          	sub    $0x20,%rsp
  803724:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803727:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80372b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80372e:	48 89 d6             	mov    %rdx,%rsi
  803731:	89 c7                	mov    %eax,%edi
  803733:	48 b8 cf 27 80 00 00 	movabs $0x8027cf,%rax
  80373a:	00 00 00 
  80373d:	ff d0                	callq  *%rax
  80373f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803742:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803746:	79 05                	jns    80374d <fd2sockid+0x31>
  803748:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80374b:	eb 24                	jmp    803771 <fd2sockid+0x55>
  80374d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803751:	8b 10                	mov    (%rax),%edx
  803753:	48 b8 e0 80 80 00 00 	movabs $0x8080e0,%rax
  80375a:	00 00 00 
  80375d:	8b 00                	mov    (%rax),%eax
  80375f:	39 c2                	cmp    %eax,%edx
  803761:	74 07                	je     80376a <fd2sockid+0x4e>
  803763:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803768:	eb 07                	jmp    803771 <fd2sockid+0x55>
  80376a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80376e:	8b 40 0c             	mov    0xc(%rax),%eax
  803771:	c9                   	leaveq 
  803772:	c3                   	retq   

0000000000803773 <alloc_sockfd>:
  803773:	55                   	push   %rbp
  803774:	48 89 e5             	mov    %rsp,%rbp
  803777:	48 83 ec 20          	sub    $0x20,%rsp
  80377b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80377e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803782:	48 89 c7             	mov    %rax,%rdi
  803785:	48 b8 37 27 80 00 00 	movabs $0x802737,%rax
  80378c:	00 00 00 
  80378f:	ff d0                	callq  *%rax
  803791:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803794:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803798:	78 26                	js     8037c0 <alloc_sockfd+0x4d>
  80379a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80379e:	ba 07 04 00 00       	mov    $0x407,%edx
  8037a3:	48 89 c6             	mov    %rax,%rsi
  8037a6:	bf 00 00 00 00       	mov    $0x0,%edi
  8037ab:	48 b8 ed 22 80 00 00 	movabs $0x8022ed,%rax
  8037b2:	00 00 00 
  8037b5:	ff d0                	callq  *%rax
  8037b7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037ba:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037be:	79 16                	jns    8037d6 <alloc_sockfd+0x63>
  8037c0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037c3:	89 c7                	mov    %eax,%edi
  8037c5:	48 b8 82 3c 80 00 00 	movabs $0x803c82,%rax
  8037cc:	00 00 00 
  8037cf:	ff d0                	callq  *%rax
  8037d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037d4:	eb 3a                	jmp    803810 <alloc_sockfd+0x9d>
  8037d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037da:	48 ba e0 80 80 00 00 	movabs $0x8080e0,%rdx
  8037e1:	00 00 00 
  8037e4:	8b 12                	mov    (%rdx),%edx
  8037e6:	89 10                	mov    %edx,(%rax)
  8037e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037ec:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8037f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037f7:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8037fa:	89 50 0c             	mov    %edx,0xc(%rax)
  8037fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803801:	48 89 c7             	mov    %rax,%rdi
  803804:	48 b8 e9 26 80 00 00 	movabs $0x8026e9,%rax
  80380b:	00 00 00 
  80380e:	ff d0                	callq  *%rax
  803810:	c9                   	leaveq 
  803811:	c3                   	retq   

0000000000803812 <accept>:
  803812:	55                   	push   %rbp
  803813:	48 89 e5             	mov    %rsp,%rbp
  803816:	48 83 ec 30          	sub    $0x30,%rsp
  80381a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80381d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803821:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803825:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803828:	89 c7                	mov    %eax,%edi
  80382a:	48 b8 1c 37 80 00 00 	movabs $0x80371c,%rax
  803831:	00 00 00 
  803834:	ff d0                	callq  *%rax
  803836:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803839:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80383d:	79 05                	jns    803844 <accept+0x32>
  80383f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803842:	eb 3b                	jmp    80387f <accept+0x6d>
  803844:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803848:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80384c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80384f:	48 89 ce             	mov    %rcx,%rsi
  803852:	89 c7                	mov    %eax,%edi
  803854:	48 b8 5f 3b 80 00 00 	movabs $0x803b5f,%rax
  80385b:	00 00 00 
  80385e:	ff d0                	callq  *%rax
  803860:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803863:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803867:	79 05                	jns    80386e <accept+0x5c>
  803869:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80386c:	eb 11                	jmp    80387f <accept+0x6d>
  80386e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803871:	89 c7                	mov    %eax,%edi
  803873:	48 b8 73 37 80 00 00 	movabs $0x803773,%rax
  80387a:	00 00 00 
  80387d:	ff d0                	callq  *%rax
  80387f:	c9                   	leaveq 
  803880:	c3                   	retq   

0000000000803881 <bind>:
  803881:	55                   	push   %rbp
  803882:	48 89 e5             	mov    %rsp,%rbp
  803885:	48 83 ec 20          	sub    $0x20,%rsp
  803889:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80388c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803890:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803893:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803896:	89 c7                	mov    %eax,%edi
  803898:	48 b8 1c 37 80 00 00 	movabs $0x80371c,%rax
  80389f:	00 00 00 
  8038a2:	ff d0                	callq  *%rax
  8038a4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038a7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038ab:	79 05                	jns    8038b2 <bind+0x31>
  8038ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038b0:	eb 1b                	jmp    8038cd <bind+0x4c>
  8038b2:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8038b5:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8038b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038bc:	48 89 ce             	mov    %rcx,%rsi
  8038bf:	89 c7                	mov    %eax,%edi
  8038c1:	48 b8 de 3b 80 00 00 	movabs $0x803bde,%rax
  8038c8:	00 00 00 
  8038cb:	ff d0                	callq  *%rax
  8038cd:	c9                   	leaveq 
  8038ce:	c3                   	retq   

00000000008038cf <shutdown>:
  8038cf:	55                   	push   %rbp
  8038d0:	48 89 e5             	mov    %rsp,%rbp
  8038d3:	48 83 ec 20          	sub    $0x20,%rsp
  8038d7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8038da:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8038dd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038e0:	89 c7                	mov    %eax,%edi
  8038e2:	48 b8 1c 37 80 00 00 	movabs $0x80371c,%rax
  8038e9:	00 00 00 
  8038ec:	ff d0                	callq  *%rax
  8038ee:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038f1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038f5:	79 05                	jns    8038fc <shutdown+0x2d>
  8038f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038fa:	eb 16                	jmp    803912 <shutdown+0x43>
  8038fc:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8038ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803902:	89 d6                	mov    %edx,%esi
  803904:	89 c7                	mov    %eax,%edi
  803906:	48 b8 42 3c 80 00 00 	movabs $0x803c42,%rax
  80390d:	00 00 00 
  803910:	ff d0                	callq  *%rax
  803912:	c9                   	leaveq 
  803913:	c3                   	retq   

0000000000803914 <devsock_close>:
  803914:	55                   	push   %rbp
  803915:	48 89 e5             	mov    %rsp,%rbp
  803918:	48 83 ec 10          	sub    $0x10,%rsp
  80391c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803920:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803924:	48 89 c7             	mov    %rax,%rdi
  803927:	48 b8 52 4f 80 00 00 	movabs $0x804f52,%rax
  80392e:	00 00 00 
  803931:	ff d0                	callq  *%rax
  803933:	83 f8 01             	cmp    $0x1,%eax
  803936:	75 17                	jne    80394f <devsock_close+0x3b>
  803938:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80393c:	8b 40 0c             	mov    0xc(%rax),%eax
  80393f:	89 c7                	mov    %eax,%edi
  803941:	48 b8 82 3c 80 00 00 	movabs $0x803c82,%rax
  803948:	00 00 00 
  80394b:	ff d0                	callq  *%rax
  80394d:	eb 05                	jmp    803954 <devsock_close+0x40>
  80394f:	b8 00 00 00 00       	mov    $0x0,%eax
  803954:	c9                   	leaveq 
  803955:	c3                   	retq   

0000000000803956 <connect>:
  803956:	55                   	push   %rbp
  803957:	48 89 e5             	mov    %rsp,%rbp
  80395a:	48 83 ec 20          	sub    $0x20,%rsp
  80395e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803961:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803965:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803968:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80396b:	89 c7                	mov    %eax,%edi
  80396d:	48 b8 1c 37 80 00 00 	movabs $0x80371c,%rax
  803974:	00 00 00 
  803977:	ff d0                	callq  *%rax
  803979:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80397c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803980:	79 05                	jns    803987 <connect+0x31>
  803982:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803985:	eb 1b                	jmp    8039a2 <connect+0x4c>
  803987:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80398a:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80398e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803991:	48 89 ce             	mov    %rcx,%rsi
  803994:	89 c7                	mov    %eax,%edi
  803996:	48 b8 af 3c 80 00 00 	movabs $0x803caf,%rax
  80399d:	00 00 00 
  8039a0:	ff d0                	callq  *%rax
  8039a2:	c9                   	leaveq 
  8039a3:	c3                   	retq   

00000000008039a4 <listen>:
  8039a4:	55                   	push   %rbp
  8039a5:	48 89 e5             	mov    %rsp,%rbp
  8039a8:	48 83 ec 20          	sub    $0x20,%rsp
  8039ac:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8039af:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8039b2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039b5:	89 c7                	mov    %eax,%edi
  8039b7:	48 b8 1c 37 80 00 00 	movabs $0x80371c,%rax
  8039be:	00 00 00 
  8039c1:	ff d0                	callq  *%rax
  8039c3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039c6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039ca:	79 05                	jns    8039d1 <listen+0x2d>
  8039cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039cf:	eb 16                	jmp    8039e7 <listen+0x43>
  8039d1:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8039d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039d7:	89 d6                	mov    %edx,%esi
  8039d9:	89 c7                	mov    %eax,%edi
  8039db:	48 b8 13 3d 80 00 00 	movabs $0x803d13,%rax
  8039e2:	00 00 00 
  8039e5:	ff d0                	callq  *%rax
  8039e7:	c9                   	leaveq 
  8039e8:	c3                   	retq   

00000000008039e9 <devsock_read>:
  8039e9:	55                   	push   %rbp
  8039ea:	48 89 e5             	mov    %rsp,%rbp
  8039ed:	48 83 ec 20          	sub    $0x20,%rsp
  8039f1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8039f5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8039f9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8039fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a01:	89 c2                	mov    %eax,%edx
  803a03:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a07:	8b 40 0c             	mov    0xc(%rax),%eax
  803a0a:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803a0e:	b9 00 00 00 00       	mov    $0x0,%ecx
  803a13:	89 c7                	mov    %eax,%edi
  803a15:	48 b8 53 3d 80 00 00 	movabs $0x803d53,%rax
  803a1c:	00 00 00 
  803a1f:	ff d0                	callq  *%rax
  803a21:	c9                   	leaveq 
  803a22:	c3                   	retq   

0000000000803a23 <devsock_write>:
  803a23:	55                   	push   %rbp
  803a24:	48 89 e5             	mov    %rsp,%rbp
  803a27:	48 83 ec 20          	sub    $0x20,%rsp
  803a2b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803a2f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803a33:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803a37:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a3b:	89 c2                	mov    %eax,%edx
  803a3d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a41:	8b 40 0c             	mov    0xc(%rax),%eax
  803a44:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803a48:	b9 00 00 00 00       	mov    $0x0,%ecx
  803a4d:	89 c7                	mov    %eax,%edi
  803a4f:	48 b8 1f 3e 80 00 00 	movabs $0x803e1f,%rax
  803a56:	00 00 00 
  803a59:	ff d0                	callq  *%rax
  803a5b:	c9                   	leaveq 
  803a5c:	c3                   	retq   

0000000000803a5d <devsock_stat>:
  803a5d:	55                   	push   %rbp
  803a5e:	48 89 e5             	mov    %rsp,%rbp
  803a61:	48 83 ec 10          	sub    $0x10,%rsp
  803a65:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803a69:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803a6d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a71:	48 be 2a 5d 80 00 00 	movabs $0x805d2a,%rsi
  803a78:	00 00 00 
  803a7b:	48 89 c7             	mov    %rax,%rdi
  803a7e:	48 b8 bd 19 80 00 00 	movabs $0x8019bd,%rax
  803a85:	00 00 00 
  803a88:	ff d0                	callq  *%rax
  803a8a:	b8 00 00 00 00       	mov    $0x0,%eax
  803a8f:	c9                   	leaveq 
  803a90:	c3                   	retq   

0000000000803a91 <socket>:
  803a91:	55                   	push   %rbp
  803a92:	48 89 e5             	mov    %rsp,%rbp
  803a95:	48 83 ec 20          	sub    $0x20,%rsp
  803a99:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a9c:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803a9f:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803aa2:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803aa5:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803aa8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803aab:	89 ce                	mov    %ecx,%esi
  803aad:	89 c7                	mov    %eax,%edi
  803aaf:	48 b8 d7 3e 80 00 00 	movabs $0x803ed7,%rax
  803ab6:	00 00 00 
  803ab9:	ff d0                	callq  *%rax
  803abb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803abe:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ac2:	79 05                	jns    803ac9 <socket+0x38>
  803ac4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ac7:	eb 11                	jmp    803ada <socket+0x49>
  803ac9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803acc:	89 c7                	mov    %eax,%edi
  803ace:	48 b8 73 37 80 00 00 	movabs $0x803773,%rax
  803ad5:	00 00 00 
  803ad8:	ff d0                	callq  *%rax
  803ada:	c9                   	leaveq 
  803adb:	c3                   	retq   

0000000000803adc <nsipc>:
  803adc:	55                   	push   %rbp
  803add:	48 89 e5             	mov    %rsp,%rbp
  803ae0:	48 83 ec 10          	sub    $0x10,%rsp
  803ae4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ae7:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  803aee:	00 00 00 
  803af1:	8b 00                	mov    (%rax),%eax
  803af3:	85 c0                	test   %eax,%eax
  803af5:	75 1f                	jne    803b16 <nsipc+0x3a>
  803af7:	bf 02 00 00 00       	mov    $0x2,%edi
  803afc:	48 b8 e1 4e 80 00 00 	movabs $0x804ee1,%rax
  803b03:	00 00 00 
  803b06:	ff d0                	callq  *%rax
  803b08:	89 c2                	mov    %eax,%edx
  803b0a:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  803b11:	00 00 00 
  803b14:	89 10                	mov    %edx,(%rax)
  803b16:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  803b1d:	00 00 00 
  803b20:	8b 00                	mov    (%rax),%eax
  803b22:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803b25:	b9 07 00 00 00       	mov    $0x7,%ecx
  803b2a:	48 ba 00 c0 80 00 00 	movabs $0x80c000,%rdx
  803b31:	00 00 00 
  803b34:	89 c7                	mov    %eax,%edi
  803b36:	48 b8 d7 4d 80 00 00 	movabs $0x804dd7,%rax
  803b3d:	00 00 00 
  803b40:	ff d0                	callq  *%rax
  803b42:	ba 00 00 00 00       	mov    $0x0,%edx
  803b47:	be 00 00 00 00       	mov    $0x0,%esi
  803b4c:	bf 00 00 00 00       	mov    $0x0,%edi
  803b51:	48 b8 16 4d 80 00 00 	movabs $0x804d16,%rax
  803b58:	00 00 00 
  803b5b:	ff d0                	callq  *%rax
  803b5d:	c9                   	leaveq 
  803b5e:	c3                   	retq   

0000000000803b5f <nsipc_accept>:
  803b5f:	55                   	push   %rbp
  803b60:	48 89 e5             	mov    %rsp,%rbp
  803b63:	48 83 ec 30          	sub    $0x30,%rsp
  803b67:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b6a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b6e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803b72:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803b79:	00 00 00 
  803b7c:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803b7f:	89 10                	mov    %edx,(%rax)
  803b81:	bf 01 00 00 00       	mov    $0x1,%edi
  803b86:	48 b8 dc 3a 80 00 00 	movabs $0x803adc,%rax
  803b8d:	00 00 00 
  803b90:	ff d0                	callq  *%rax
  803b92:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b95:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b99:	78 3e                	js     803bd9 <nsipc_accept+0x7a>
  803b9b:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803ba2:	00 00 00 
  803ba5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803ba9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bad:	8b 40 10             	mov    0x10(%rax),%eax
  803bb0:	89 c2                	mov    %eax,%edx
  803bb2:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803bb6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803bba:	48 89 ce             	mov    %rcx,%rsi
  803bbd:	48 89 c7             	mov    %rax,%rdi
  803bc0:	48 b8 e2 1c 80 00 00 	movabs $0x801ce2,%rax
  803bc7:	00 00 00 
  803bca:	ff d0                	callq  *%rax
  803bcc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bd0:	8b 50 10             	mov    0x10(%rax),%edx
  803bd3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bd7:	89 10                	mov    %edx,(%rax)
  803bd9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bdc:	c9                   	leaveq 
  803bdd:	c3                   	retq   

0000000000803bde <nsipc_bind>:
  803bde:	55                   	push   %rbp
  803bdf:	48 89 e5             	mov    %rsp,%rbp
  803be2:	48 83 ec 10          	sub    $0x10,%rsp
  803be6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803be9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803bed:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803bf0:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803bf7:	00 00 00 
  803bfa:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803bfd:	89 10                	mov    %edx,(%rax)
  803bff:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c02:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c06:	48 89 c6             	mov    %rax,%rsi
  803c09:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  803c10:	00 00 00 
  803c13:	48 b8 e2 1c 80 00 00 	movabs $0x801ce2,%rax
  803c1a:	00 00 00 
  803c1d:	ff d0                	callq  *%rax
  803c1f:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803c26:	00 00 00 
  803c29:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c2c:	89 50 14             	mov    %edx,0x14(%rax)
  803c2f:	bf 02 00 00 00       	mov    $0x2,%edi
  803c34:	48 b8 dc 3a 80 00 00 	movabs $0x803adc,%rax
  803c3b:	00 00 00 
  803c3e:	ff d0                	callq  *%rax
  803c40:	c9                   	leaveq 
  803c41:	c3                   	retq   

0000000000803c42 <nsipc_shutdown>:
  803c42:	55                   	push   %rbp
  803c43:	48 89 e5             	mov    %rsp,%rbp
  803c46:	48 83 ec 10          	sub    $0x10,%rsp
  803c4a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c4d:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803c50:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803c57:	00 00 00 
  803c5a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c5d:	89 10                	mov    %edx,(%rax)
  803c5f:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803c66:	00 00 00 
  803c69:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c6c:	89 50 04             	mov    %edx,0x4(%rax)
  803c6f:	bf 03 00 00 00       	mov    $0x3,%edi
  803c74:	48 b8 dc 3a 80 00 00 	movabs $0x803adc,%rax
  803c7b:	00 00 00 
  803c7e:	ff d0                	callq  *%rax
  803c80:	c9                   	leaveq 
  803c81:	c3                   	retq   

0000000000803c82 <nsipc_close>:
  803c82:	55                   	push   %rbp
  803c83:	48 89 e5             	mov    %rsp,%rbp
  803c86:	48 83 ec 10          	sub    $0x10,%rsp
  803c8a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c8d:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803c94:	00 00 00 
  803c97:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c9a:	89 10                	mov    %edx,(%rax)
  803c9c:	bf 04 00 00 00       	mov    $0x4,%edi
  803ca1:	48 b8 dc 3a 80 00 00 	movabs $0x803adc,%rax
  803ca8:	00 00 00 
  803cab:	ff d0                	callq  *%rax
  803cad:	c9                   	leaveq 
  803cae:	c3                   	retq   

0000000000803caf <nsipc_connect>:
  803caf:	55                   	push   %rbp
  803cb0:	48 89 e5             	mov    %rsp,%rbp
  803cb3:	48 83 ec 10          	sub    $0x10,%rsp
  803cb7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803cba:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803cbe:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803cc1:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803cc8:	00 00 00 
  803ccb:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803cce:	89 10                	mov    %edx,(%rax)
  803cd0:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803cd3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cd7:	48 89 c6             	mov    %rax,%rsi
  803cda:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  803ce1:	00 00 00 
  803ce4:	48 b8 e2 1c 80 00 00 	movabs $0x801ce2,%rax
  803ceb:	00 00 00 
  803cee:	ff d0                	callq  *%rax
  803cf0:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803cf7:	00 00 00 
  803cfa:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803cfd:	89 50 14             	mov    %edx,0x14(%rax)
  803d00:	bf 05 00 00 00       	mov    $0x5,%edi
  803d05:	48 b8 dc 3a 80 00 00 	movabs $0x803adc,%rax
  803d0c:	00 00 00 
  803d0f:	ff d0                	callq  *%rax
  803d11:	c9                   	leaveq 
  803d12:	c3                   	retq   

0000000000803d13 <nsipc_listen>:
  803d13:	55                   	push   %rbp
  803d14:	48 89 e5             	mov    %rsp,%rbp
  803d17:	48 83 ec 10          	sub    $0x10,%rsp
  803d1b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d1e:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803d21:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803d28:	00 00 00 
  803d2b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d2e:	89 10                	mov    %edx,(%rax)
  803d30:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803d37:	00 00 00 
  803d3a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d3d:	89 50 04             	mov    %edx,0x4(%rax)
  803d40:	bf 06 00 00 00       	mov    $0x6,%edi
  803d45:	48 b8 dc 3a 80 00 00 	movabs $0x803adc,%rax
  803d4c:	00 00 00 
  803d4f:	ff d0                	callq  *%rax
  803d51:	c9                   	leaveq 
  803d52:	c3                   	retq   

0000000000803d53 <nsipc_recv>:
  803d53:	55                   	push   %rbp
  803d54:	48 89 e5             	mov    %rsp,%rbp
  803d57:	48 83 ec 30          	sub    $0x30,%rsp
  803d5b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d5e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803d62:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803d65:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803d68:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803d6f:	00 00 00 
  803d72:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803d75:	89 10                	mov    %edx,(%rax)
  803d77:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803d7e:	00 00 00 
  803d81:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803d84:	89 50 04             	mov    %edx,0x4(%rax)
  803d87:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803d8e:	00 00 00 
  803d91:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803d94:	89 50 08             	mov    %edx,0x8(%rax)
  803d97:	bf 07 00 00 00       	mov    $0x7,%edi
  803d9c:	48 b8 dc 3a 80 00 00 	movabs $0x803adc,%rax
  803da3:	00 00 00 
  803da6:	ff d0                	callq  *%rax
  803da8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803dab:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803daf:	78 69                	js     803e1a <nsipc_recv+0xc7>
  803db1:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803db8:	7f 08                	jg     803dc2 <nsipc_recv+0x6f>
  803dba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dbd:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803dc0:	7e 35                	jle    803df7 <nsipc_recv+0xa4>
  803dc2:	48 b9 31 5d 80 00 00 	movabs $0x805d31,%rcx
  803dc9:	00 00 00 
  803dcc:	48 ba 46 5d 80 00 00 	movabs $0x805d46,%rdx
  803dd3:	00 00 00 
  803dd6:	be 62 00 00 00       	mov    $0x62,%esi
  803ddb:	48 bf 5b 5d 80 00 00 	movabs $0x805d5b,%rdi
  803de2:	00 00 00 
  803de5:	b8 00 00 00 00       	mov    $0x0,%eax
  803dea:	49 b8 f3 0b 80 00 00 	movabs $0x800bf3,%r8
  803df1:	00 00 00 
  803df4:	41 ff d0             	callq  *%r8
  803df7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dfa:	48 63 d0             	movslq %eax,%rdx
  803dfd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e01:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  803e08:	00 00 00 
  803e0b:	48 89 c7             	mov    %rax,%rdi
  803e0e:	48 b8 e2 1c 80 00 00 	movabs $0x801ce2,%rax
  803e15:	00 00 00 
  803e18:	ff d0                	callq  *%rax
  803e1a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e1d:	c9                   	leaveq 
  803e1e:	c3                   	retq   

0000000000803e1f <nsipc_send>:
  803e1f:	55                   	push   %rbp
  803e20:	48 89 e5             	mov    %rsp,%rbp
  803e23:	48 83 ec 20          	sub    $0x20,%rsp
  803e27:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e2a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803e2e:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803e31:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803e34:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803e3b:	00 00 00 
  803e3e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803e41:	89 10                	mov    %edx,(%rax)
  803e43:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803e4a:	7e 35                	jle    803e81 <nsipc_send+0x62>
  803e4c:	48 b9 6a 5d 80 00 00 	movabs $0x805d6a,%rcx
  803e53:	00 00 00 
  803e56:	48 ba 46 5d 80 00 00 	movabs $0x805d46,%rdx
  803e5d:	00 00 00 
  803e60:	be 6d 00 00 00       	mov    $0x6d,%esi
  803e65:	48 bf 5b 5d 80 00 00 	movabs $0x805d5b,%rdi
  803e6c:	00 00 00 
  803e6f:	b8 00 00 00 00       	mov    $0x0,%eax
  803e74:	49 b8 f3 0b 80 00 00 	movabs $0x800bf3,%r8
  803e7b:	00 00 00 
  803e7e:	41 ff d0             	callq  *%r8
  803e81:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e84:	48 63 d0             	movslq %eax,%rdx
  803e87:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e8b:	48 89 c6             	mov    %rax,%rsi
  803e8e:	48 bf 0c c0 80 00 00 	movabs $0x80c00c,%rdi
  803e95:	00 00 00 
  803e98:	48 b8 e2 1c 80 00 00 	movabs $0x801ce2,%rax
  803e9f:	00 00 00 
  803ea2:	ff d0                	callq  *%rax
  803ea4:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803eab:	00 00 00 
  803eae:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803eb1:	89 50 04             	mov    %edx,0x4(%rax)
  803eb4:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803ebb:	00 00 00 
  803ebe:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803ec1:	89 50 08             	mov    %edx,0x8(%rax)
  803ec4:	bf 08 00 00 00       	mov    $0x8,%edi
  803ec9:	48 b8 dc 3a 80 00 00 	movabs $0x803adc,%rax
  803ed0:	00 00 00 
  803ed3:	ff d0                	callq  *%rax
  803ed5:	c9                   	leaveq 
  803ed6:	c3                   	retq   

0000000000803ed7 <nsipc_socket>:
  803ed7:	55                   	push   %rbp
  803ed8:	48 89 e5             	mov    %rsp,%rbp
  803edb:	48 83 ec 10          	sub    $0x10,%rsp
  803edf:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ee2:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803ee5:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803ee8:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803eef:	00 00 00 
  803ef2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ef5:	89 10                	mov    %edx,(%rax)
  803ef7:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803efe:	00 00 00 
  803f01:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f04:	89 50 04             	mov    %edx,0x4(%rax)
  803f07:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803f0e:	00 00 00 
  803f11:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803f14:	89 50 08             	mov    %edx,0x8(%rax)
  803f17:	bf 09 00 00 00       	mov    $0x9,%edi
  803f1c:	48 b8 dc 3a 80 00 00 	movabs $0x803adc,%rax
  803f23:	00 00 00 
  803f26:	ff d0                	callq  *%rax
  803f28:	c9                   	leaveq 
  803f29:	c3                   	retq   

0000000000803f2a <isfree>:
  803f2a:	55                   	push   %rbp
  803f2b:	48 89 e5             	mov    %rsp,%rbp
  803f2e:	48 83 ec 20          	sub    $0x20,%rsp
  803f32:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803f36:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f3a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803f3e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f42:	48 01 d0             	add    %rdx,%rax
  803f45:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803f49:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f4d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803f51:	eb 64                	jmp    803fb7 <isfree+0x8d>
  803f53:	48 b8 20 81 80 00 00 	movabs $0x808120,%rax
  803f5a:	00 00 00 
  803f5d:	48 8b 00             	mov    (%rax),%rax
  803f60:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  803f64:	73 42                	jae    803fa8 <isfree+0x7e>
  803f66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f6a:	48 c1 e8 15          	shr    $0x15,%rax
  803f6e:	48 89 c2             	mov    %rax,%rdx
  803f71:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803f78:	01 00 00 
  803f7b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803f7f:	83 e0 01             	and    $0x1,%eax
  803f82:	48 85 c0             	test   %rax,%rax
  803f85:	74 28                	je     803faf <isfree+0x85>
  803f87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f8b:	48 c1 e8 0c          	shr    $0xc,%rax
  803f8f:	48 89 c2             	mov    %rax,%rdx
  803f92:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803f99:	01 00 00 
  803f9c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803fa0:	83 e0 01             	and    $0x1,%eax
  803fa3:	48 85 c0             	test   %rax,%rax
  803fa6:	74 07                	je     803faf <isfree+0x85>
  803fa8:	b8 00 00 00 00       	mov    $0x0,%eax
  803fad:	eb 17                	jmp    803fc6 <isfree+0x9c>
  803faf:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
  803fb6:	00 
  803fb7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803fbb:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  803fbf:	72 92                	jb     803f53 <isfree+0x29>
  803fc1:	b8 01 00 00 00       	mov    $0x1,%eax
  803fc6:	c9                   	leaveq 
  803fc7:	c3                   	retq   

0000000000803fc8 <malloc>:
  803fc8:	55                   	push   %rbp
  803fc9:	48 89 e5             	mov    %rsp,%rbp
  803fcc:	48 83 ec 60          	sub    $0x60,%rsp
  803fd0:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  803fd4:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  803fdb:	00 00 00 
  803fde:	48 8b 00             	mov    (%rax),%rax
  803fe1:	48 85 c0             	test   %rax,%rax
  803fe4:	75 1a                	jne    804000 <malloc+0x38>
  803fe6:	48 b8 18 81 80 00 00 	movabs $0x808118,%rax
  803fed:	00 00 00 
  803ff0:	48 8b 10             	mov    (%rax),%rdx
  803ff3:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  803ffa:	00 00 00 
  803ffd:	48 89 10             	mov    %rdx,(%rax)
  804000:	48 c7 45 f0 04 00 00 	movq   $0x4,-0x10(%rbp)
  804007:	00 
  804008:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
  80400c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804010:	48 01 d0             	add    %rdx,%rax
  804013:	48 83 e8 01          	sub    $0x1,%rax
  804017:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80401b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80401f:	ba 00 00 00 00       	mov    $0x0,%edx
  804024:	48 f7 75 f0          	divq   -0x10(%rbp)
  804028:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80402c:	48 29 d0             	sub    %rdx,%rax
  80402f:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  804033:	48 81 7d a8 ff ff 0f 	cmpq   $0xfffff,-0x58(%rbp)
  80403a:	00 
  80403b:	76 0a                	jbe    804047 <malloc+0x7f>
  80403d:	b8 00 00 00 00       	mov    $0x0,%eax
  804042:	e9 f0 02 00 00       	jmpq   804337 <malloc+0x36f>
  804047:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  80404e:	00 00 00 
  804051:	48 8b 00             	mov    (%rax),%rax
  804054:	25 ff 0f 00 00       	and    $0xfff,%eax
  804059:	48 85 c0             	test   %rax,%rax
  80405c:	0f 84 0f 01 00 00    	je     804171 <malloc+0x1a9>
  804062:	48 c7 45 e0 00 10 00 	movq   $0x1000,-0x20(%rbp)
  804069:	00 
  80406a:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804071:	00 00 00 
  804074:	48 8b 00             	mov    (%rax),%rax
  804077:	48 89 c2             	mov    %rax,%rdx
  80407a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80407e:	48 01 d0             	add    %rdx,%rax
  804081:	48 83 e8 01          	sub    $0x1,%rax
  804085:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  804089:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80408d:	ba 00 00 00 00       	mov    $0x0,%edx
  804092:	48 f7 75 e0          	divq   -0x20(%rbp)
  804096:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80409a:	48 29 d0             	sub    %rdx,%rax
  80409d:	48 83 e8 04          	sub    $0x4,%rax
  8040a1:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8040a5:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8040ac:	00 00 00 
  8040af:	48 8b 00             	mov    (%rax),%rax
  8040b2:	48 c1 e8 0c          	shr    $0xc,%rax
  8040b6:	48 89 c1             	mov    %rax,%rcx
  8040b9:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8040c0:	00 00 00 
  8040c3:	48 8b 00             	mov    (%rax),%rax
  8040c6:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
  8040ca:	48 83 c2 03          	add    $0x3,%rdx
  8040ce:	48 01 d0             	add    %rdx,%rax
  8040d1:	48 c1 e8 0c          	shr    $0xc,%rax
  8040d5:	48 39 c1             	cmp    %rax,%rcx
  8040d8:	75 4a                	jne    804124 <malloc+0x15c>
  8040da:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8040de:	8b 00                	mov    (%rax),%eax
  8040e0:	8d 50 01             	lea    0x1(%rax),%edx
  8040e3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8040e7:	89 10                	mov    %edx,(%rax)
  8040e9:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8040f0:	00 00 00 
  8040f3:	48 8b 00             	mov    (%rax),%rax
  8040f6:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8040fa:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804101:	00 00 00 
  804104:	48 8b 10             	mov    (%rax),%rdx
  804107:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80410b:	48 01 c2             	add    %rax,%rdx
  80410e:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804115:	00 00 00 
  804118:	48 89 10             	mov    %rdx,(%rax)
  80411b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80411f:	e9 13 02 00 00       	jmpq   804337 <malloc+0x36f>
  804124:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  80412b:	00 00 00 
  80412e:	48 8b 00             	mov    (%rax),%rax
  804131:	48 89 c7             	mov    %rax,%rdi
  804134:	48 b8 39 43 80 00 00 	movabs $0x804339,%rax
  80413b:	00 00 00 
  80413e:	ff d0                	callq  *%rax
  804140:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804147:	00 00 00 
  80414a:	48 8b 00             	mov    (%rax),%rax
  80414d:	48 05 00 10 00 00    	add    $0x1000,%rax
  804153:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  804157:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80415b:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  804161:	48 89 c2             	mov    %rax,%rdx
  804164:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  80416b:	00 00 00 
  80416e:	48 89 10             	mov    %rdx,(%rax)
  804171:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  804178:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80417c:	48 8d 50 04          	lea    0x4(%rax),%rdx
  804180:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804187:	00 00 00 
  80418a:	48 8b 00             	mov    (%rax),%rax
  80418d:	48 89 d6             	mov    %rdx,%rsi
  804190:	48 89 c7             	mov    %rax,%rdi
  804193:	48 b8 2a 3f 80 00 00 	movabs $0x803f2a,%rax
  80419a:	00 00 00 
  80419d:	ff d0                	callq  *%rax
  80419f:	85 c0                	test   %eax,%eax
  8041a1:	75 72                	jne    804215 <malloc+0x24d>
  8041a3:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8041aa:	00 00 00 
  8041ad:	48 8b 00             	mov    (%rax),%rax
  8041b0:	48 8d 90 00 10 00 00 	lea    0x1000(%rax),%rdx
  8041b7:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8041be:	00 00 00 
  8041c1:	48 89 10             	mov    %rdx,(%rax)
  8041c4:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8041cb:	00 00 00 
  8041ce:	48 8b 10             	mov    (%rax),%rdx
  8041d1:	48 b8 20 81 80 00 00 	movabs $0x808120,%rax
  8041d8:	00 00 00 
  8041db:	48 8b 00             	mov    (%rax),%rax
  8041de:	48 39 c2             	cmp    %rax,%rdx
  8041e1:	75 95                	jne    804178 <malloc+0x1b0>
  8041e3:	48 b8 18 81 80 00 00 	movabs $0x808118,%rax
  8041ea:	00 00 00 
  8041ed:	48 8b 10             	mov    (%rax),%rdx
  8041f0:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8041f7:	00 00 00 
  8041fa:	48 89 10             	mov    %rdx,(%rax)
  8041fd:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
  804201:	83 7d f8 02          	cmpl   $0x2,-0x8(%rbp)
  804205:	0f 85 6d ff ff ff    	jne    804178 <malloc+0x1b0>
  80420b:	b8 00 00 00 00       	mov    $0x0,%eax
  804210:	e9 22 01 00 00       	jmpq   804337 <malloc+0x36f>
  804215:	90                   	nop
  804216:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80421d:	e9 a1 00 00 00       	jmpq   8042c3 <malloc+0x2fb>
  804222:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804225:	05 00 10 00 00       	add    $0x1000,%eax
  80422a:	48 98                	cltq   
  80422c:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
  804230:	48 83 c2 04          	add    $0x4,%rdx
  804234:	48 39 d0             	cmp    %rdx,%rax
  804237:	73 07                	jae    804240 <malloc+0x278>
  804239:	b8 00 04 00 00       	mov    $0x400,%eax
  80423e:	eb 05                	jmp    804245 <malloc+0x27d>
  804240:	b8 00 00 00 00       	mov    $0x0,%eax
  804245:	89 45 bc             	mov    %eax,-0x44(%rbp)
  804248:	8b 45 bc             	mov    -0x44(%rbp),%eax
  80424b:	83 c8 07             	or     $0x7,%eax
  80424e:	89 c2                	mov    %eax,%edx
  804250:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804257:	00 00 00 
  80425a:	48 8b 08             	mov    (%rax),%rcx
  80425d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804260:	48 98                	cltq   
  804262:	48 01 c8             	add    %rcx,%rax
  804265:	48 89 c6             	mov    %rax,%rsi
  804268:	bf 00 00 00 00       	mov    $0x0,%edi
  80426d:	48 b8 ed 22 80 00 00 	movabs $0x8022ed,%rax
  804274:	00 00 00 
  804277:	ff d0                	callq  *%rax
  804279:	85 c0                	test   %eax,%eax
  80427b:	79 3f                	jns    8042bc <malloc+0x2f4>
  80427d:	eb 30                	jmp    8042af <malloc+0x2e7>
  80427f:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804286:	00 00 00 
  804289:	48 8b 10             	mov    (%rax),%rdx
  80428c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80428f:	48 98                	cltq   
  804291:	48 01 d0             	add    %rdx,%rax
  804294:	48 89 c6             	mov    %rax,%rsi
  804297:	bf 00 00 00 00       	mov    $0x0,%edi
  80429c:	48 b8 9f 23 80 00 00 	movabs $0x80239f,%rax
  8042a3:	00 00 00 
  8042a6:	ff d0                	callq  *%rax
  8042a8:	81 6d fc 00 10 00 00 	subl   $0x1000,-0x4(%rbp)
  8042af:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8042b3:	79 ca                	jns    80427f <malloc+0x2b7>
  8042b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8042ba:	eb 7b                	jmp    804337 <malloc+0x36f>
  8042bc:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
  8042c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042c6:	48 98                	cltq   
  8042c8:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
  8042cc:	48 83 c2 04          	add    $0x4,%rdx
  8042d0:	48 39 d0             	cmp    %rdx,%rax
  8042d3:	0f 82 49 ff ff ff    	jb     804222 <malloc+0x25a>
  8042d9:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8042e0:	00 00 00 
  8042e3:	48 8b 00             	mov    (%rax),%rax
  8042e6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8042e9:	48 63 d2             	movslq %edx,%rdx
  8042ec:	48 83 ea 04          	sub    $0x4,%rdx
  8042f0:	48 01 d0             	add    %rdx,%rax
  8042f3:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8042f7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042fb:	c7 00 02 00 00 00    	movl   $0x2,(%rax)
  804301:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804308:	00 00 00 
  80430b:	48 8b 00             	mov    (%rax),%rax
  80430e:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  804312:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804319:	00 00 00 
  80431c:	48 8b 10             	mov    (%rax),%rdx
  80431f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  804323:	48 01 c2             	add    %rax,%rdx
  804326:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  80432d:	00 00 00 
  804330:	48 89 10             	mov    %rdx,(%rax)
  804333:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804337:	c9                   	leaveq 
  804338:	c3                   	retq   

0000000000804339 <free>:
  804339:	55                   	push   %rbp
  80433a:	48 89 e5             	mov    %rsp,%rbp
  80433d:	48 83 ec 30          	sub    $0x30,%rsp
  804341:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804345:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80434a:	0f 84 56 01 00 00    	je     8044a6 <free+0x16d>
  804350:	48 b8 18 81 80 00 00 	movabs $0x808118,%rax
  804357:	00 00 00 
  80435a:	48 8b 00             	mov    (%rax),%rax
  80435d:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  804361:	77 13                	ja     804376 <free+0x3d>
  804363:	48 b8 20 81 80 00 00 	movabs $0x808120,%rax
  80436a:	00 00 00 
  80436d:	48 8b 00             	mov    (%rax),%rax
  804370:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  804374:	72 35                	jb     8043ab <free+0x72>
  804376:	48 b9 78 5d 80 00 00 	movabs $0x805d78,%rcx
  80437d:	00 00 00 
  804380:	48 ba a6 5d 80 00 00 	movabs $0x805da6,%rdx
  804387:	00 00 00 
  80438a:	be 7b 00 00 00       	mov    $0x7b,%esi
  80438f:	48 bf bb 5d 80 00 00 	movabs $0x805dbb,%rdi
  804396:	00 00 00 
  804399:	b8 00 00 00 00       	mov    $0x0,%eax
  80439e:	49 b8 f3 0b 80 00 00 	movabs $0x800bf3,%r8
  8043a5:	00 00 00 
  8043a8:	41 ff d0             	callq  *%r8
  8043ab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043af:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8043b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043b7:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8043bd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8043c1:	eb 7b                	jmp    80443e <free+0x105>
  8043c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043c7:	48 89 c6             	mov    %rax,%rsi
  8043ca:	bf 00 00 00 00       	mov    $0x0,%edi
  8043cf:	48 b8 9f 23 80 00 00 	movabs $0x80239f,%rax
  8043d6:	00 00 00 
  8043d9:	ff d0                	callq  *%rax
  8043db:	48 81 45 f8 00 10 00 	addq   $0x1000,-0x8(%rbp)
  8043e2:	00 
  8043e3:	48 b8 18 81 80 00 00 	movabs $0x808118,%rax
  8043ea:	00 00 00 
  8043ed:	48 8b 00             	mov    (%rax),%rax
  8043f0:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8043f4:	77 13                	ja     804409 <free+0xd0>
  8043f6:	48 b8 20 81 80 00 00 	movabs $0x808120,%rax
  8043fd:	00 00 00 
  804400:	48 8b 00             	mov    (%rax),%rax
  804403:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  804407:	72 35                	jb     80443e <free+0x105>
  804409:	48 b9 cb 5d 80 00 00 	movabs $0x805dcb,%rcx
  804410:	00 00 00 
  804413:	48 ba a6 5d 80 00 00 	movabs $0x805da6,%rdx
  80441a:	00 00 00 
  80441d:	be 82 00 00 00       	mov    $0x82,%esi
  804422:	48 bf bb 5d 80 00 00 	movabs $0x805dbb,%rdi
  804429:	00 00 00 
  80442c:	b8 00 00 00 00       	mov    $0x0,%eax
  804431:	49 b8 f3 0b 80 00 00 	movabs $0x800bf3,%r8
  804438:	00 00 00 
  80443b:	41 ff d0             	callq  *%r8
  80443e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804442:	48 c1 e8 0c          	shr    $0xc,%rax
  804446:	48 89 c2             	mov    %rax,%rdx
  804449:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804450:	01 00 00 
  804453:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804457:	25 00 04 00 00       	and    $0x400,%eax
  80445c:	48 85 c0             	test   %rax,%rax
  80445f:	0f 85 5e ff ff ff    	jne    8043c3 <free+0x8a>
  804465:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804469:	48 05 fc 0f 00 00    	add    $0xffc,%rax
  80446f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804473:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804477:	8b 00                	mov    (%rax),%eax
  804479:	8d 50 ff             	lea    -0x1(%rax),%edx
  80447c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804480:	89 10                	mov    %edx,(%rax)
  804482:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804486:	8b 00                	mov    (%rax),%eax
  804488:	85 c0                	test   %eax,%eax
  80448a:	75 1b                	jne    8044a7 <free+0x16e>
  80448c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804490:	48 89 c6             	mov    %rax,%rsi
  804493:	bf 00 00 00 00       	mov    $0x0,%edi
  804498:	48 b8 9f 23 80 00 00 	movabs $0x80239f,%rax
  80449f:	00 00 00 
  8044a2:	ff d0                	callq  *%rax
  8044a4:	eb 01                	jmp    8044a7 <free+0x16e>
  8044a6:	90                   	nop
  8044a7:	c9                   	leaveq 
  8044a8:	c3                   	retq   

00000000008044a9 <pipe>:
  8044a9:	55                   	push   %rbp
  8044aa:	48 89 e5             	mov    %rsp,%rbp
  8044ad:	53                   	push   %rbx
  8044ae:	48 83 ec 38          	sub    $0x38,%rsp
  8044b2:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8044b6:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8044ba:	48 89 c7             	mov    %rax,%rdi
  8044bd:	48 b8 37 27 80 00 00 	movabs $0x802737,%rax
  8044c4:	00 00 00 
  8044c7:	ff d0                	callq  *%rax
  8044c9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8044cc:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8044d0:	0f 88 bf 01 00 00    	js     804695 <pipe+0x1ec>
  8044d6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044da:	ba 07 04 00 00       	mov    $0x407,%edx
  8044df:	48 89 c6             	mov    %rax,%rsi
  8044e2:	bf 00 00 00 00       	mov    $0x0,%edi
  8044e7:	48 b8 ed 22 80 00 00 	movabs $0x8022ed,%rax
  8044ee:	00 00 00 
  8044f1:	ff d0                	callq  *%rax
  8044f3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8044f6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8044fa:	0f 88 95 01 00 00    	js     804695 <pipe+0x1ec>
  804500:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  804504:	48 89 c7             	mov    %rax,%rdi
  804507:	48 b8 37 27 80 00 00 	movabs $0x802737,%rax
  80450e:	00 00 00 
  804511:	ff d0                	callq  *%rax
  804513:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804516:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80451a:	0f 88 5d 01 00 00    	js     80467d <pipe+0x1d4>
  804520:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804524:	ba 07 04 00 00       	mov    $0x407,%edx
  804529:	48 89 c6             	mov    %rax,%rsi
  80452c:	bf 00 00 00 00       	mov    $0x0,%edi
  804531:	48 b8 ed 22 80 00 00 	movabs $0x8022ed,%rax
  804538:	00 00 00 
  80453b:	ff d0                	callq  *%rax
  80453d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804540:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804544:	0f 88 33 01 00 00    	js     80467d <pipe+0x1d4>
  80454a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80454e:	48 89 c7             	mov    %rax,%rdi
  804551:	48 b8 0c 27 80 00 00 	movabs $0x80270c,%rax
  804558:	00 00 00 
  80455b:	ff d0                	callq  *%rax
  80455d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804561:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804565:	ba 07 04 00 00       	mov    $0x407,%edx
  80456a:	48 89 c6             	mov    %rax,%rsi
  80456d:	bf 00 00 00 00       	mov    $0x0,%edi
  804572:	48 b8 ed 22 80 00 00 	movabs $0x8022ed,%rax
  804579:	00 00 00 
  80457c:	ff d0                	callq  *%rax
  80457e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804581:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804585:	0f 88 d9 00 00 00    	js     804664 <pipe+0x1bb>
  80458b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80458f:	48 89 c7             	mov    %rax,%rdi
  804592:	48 b8 0c 27 80 00 00 	movabs $0x80270c,%rax
  804599:	00 00 00 
  80459c:	ff d0                	callq  *%rax
  80459e:	48 89 c2             	mov    %rax,%rdx
  8045a1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8045a5:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8045ab:	48 89 d1             	mov    %rdx,%rcx
  8045ae:	ba 00 00 00 00       	mov    $0x0,%edx
  8045b3:	48 89 c6             	mov    %rax,%rsi
  8045b6:	bf 00 00 00 00       	mov    $0x0,%edi
  8045bb:	48 b8 3f 23 80 00 00 	movabs $0x80233f,%rax
  8045c2:	00 00 00 
  8045c5:	ff d0                	callq  *%rax
  8045c7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8045ca:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8045ce:	78 79                	js     804649 <pipe+0x1a0>
  8045d0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045d4:	48 ba 40 81 80 00 00 	movabs $0x808140,%rdx
  8045db:	00 00 00 
  8045de:	8b 12                	mov    (%rdx),%edx
  8045e0:	89 10                	mov    %edx,(%rax)
  8045e2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045e6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  8045ed:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8045f1:	48 ba 40 81 80 00 00 	movabs $0x808140,%rdx
  8045f8:	00 00 00 
  8045fb:	8b 12                	mov    (%rdx),%edx
  8045fd:	89 10                	mov    %edx,(%rax)
  8045ff:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804603:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  80460a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80460e:	48 89 c7             	mov    %rax,%rdi
  804611:	48 b8 e9 26 80 00 00 	movabs $0x8026e9,%rax
  804618:	00 00 00 
  80461b:	ff d0                	callq  *%rax
  80461d:	89 c2                	mov    %eax,%edx
  80461f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804623:	89 10                	mov    %edx,(%rax)
  804625:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804629:	48 8d 58 04          	lea    0x4(%rax),%rbx
  80462d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804631:	48 89 c7             	mov    %rax,%rdi
  804634:	48 b8 e9 26 80 00 00 	movabs $0x8026e9,%rax
  80463b:	00 00 00 
  80463e:	ff d0                	callq  *%rax
  804640:	89 03                	mov    %eax,(%rbx)
  804642:	b8 00 00 00 00       	mov    $0x0,%eax
  804647:	eb 4f                	jmp    804698 <pipe+0x1ef>
  804649:	90                   	nop
  80464a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80464e:	48 89 c6             	mov    %rax,%rsi
  804651:	bf 00 00 00 00       	mov    $0x0,%edi
  804656:	48 b8 9f 23 80 00 00 	movabs $0x80239f,%rax
  80465d:	00 00 00 
  804660:	ff d0                	callq  *%rax
  804662:	eb 01                	jmp    804665 <pipe+0x1bc>
  804664:	90                   	nop
  804665:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804669:	48 89 c6             	mov    %rax,%rsi
  80466c:	bf 00 00 00 00       	mov    $0x0,%edi
  804671:	48 b8 9f 23 80 00 00 	movabs $0x80239f,%rax
  804678:	00 00 00 
  80467b:	ff d0                	callq  *%rax
  80467d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804681:	48 89 c6             	mov    %rax,%rsi
  804684:	bf 00 00 00 00       	mov    $0x0,%edi
  804689:	48 b8 9f 23 80 00 00 	movabs $0x80239f,%rax
  804690:	00 00 00 
  804693:	ff d0                	callq  *%rax
  804695:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804698:	48 83 c4 38          	add    $0x38,%rsp
  80469c:	5b                   	pop    %rbx
  80469d:	5d                   	pop    %rbp
  80469e:	c3                   	retq   

000000000080469f <_pipeisclosed>:
  80469f:	55                   	push   %rbp
  8046a0:	48 89 e5             	mov    %rsp,%rbp
  8046a3:	53                   	push   %rbx
  8046a4:	48 83 ec 28          	sub    $0x28,%rsp
  8046a8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8046ac:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8046b0:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  8046b7:	00 00 00 
  8046ba:	48 8b 00             	mov    (%rax),%rax
  8046bd:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  8046c3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8046c6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8046ca:	48 89 c7             	mov    %rax,%rdi
  8046cd:	48 b8 52 4f 80 00 00 	movabs $0x804f52,%rax
  8046d4:	00 00 00 
  8046d7:	ff d0                	callq  *%rax
  8046d9:	89 c3                	mov    %eax,%ebx
  8046db:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8046df:	48 89 c7             	mov    %rax,%rdi
  8046e2:	48 b8 52 4f 80 00 00 	movabs $0x804f52,%rax
  8046e9:	00 00 00 
  8046ec:	ff d0                	callq  *%rax
  8046ee:	39 c3                	cmp    %eax,%ebx
  8046f0:	0f 94 c0             	sete   %al
  8046f3:	0f b6 c0             	movzbl %al,%eax
  8046f6:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8046f9:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  804700:	00 00 00 
  804703:	48 8b 00             	mov    (%rax),%rax
  804706:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  80470c:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80470f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804712:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804715:	75 05                	jne    80471c <_pipeisclosed+0x7d>
  804717:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80471a:	eb 4a                	jmp    804766 <_pipeisclosed+0xc7>
  80471c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80471f:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804722:	74 8c                	je     8046b0 <_pipeisclosed+0x11>
  804724:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  804728:	75 86                	jne    8046b0 <_pipeisclosed+0x11>
  80472a:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  804731:	00 00 00 
  804734:	48 8b 00             	mov    (%rax),%rax
  804737:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  80473d:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804740:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804743:	89 c6                	mov    %eax,%esi
  804745:	48 bf e8 5d 80 00 00 	movabs $0x805de8,%rdi
  80474c:	00 00 00 
  80474f:	b8 00 00 00 00       	mov    $0x0,%eax
  804754:	49 b8 2d 0e 80 00 00 	movabs $0x800e2d,%r8
  80475b:	00 00 00 
  80475e:	41 ff d0             	callq  *%r8
  804761:	e9 4a ff ff ff       	jmpq   8046b0 <_pipeisclosed+0x11>
  804766:	48 83 c4 28          	add    $0x28,%rsp
  80476a:	5b                   	pop    %rbx
  80476b:	5d                   	pop    %rbp
  80476c:	c3                   	retq   

000000000080476d <pipeisclosed>:
  80476d:	55                   	push   %rbp
  80476e:	48 89 e5             	mov    %rsp,%rbp
  804771:	48 83 ec 30          	sub    $0x30,%rsp
  804775:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804778:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80477c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80477f:	48 89 d6             	mov    %rdx,%rsi
  804782:	89 c7                	mov    %eax,%edi
  804784:	48 b8 cf 27 80 00 00 	movabs $0x8027cf,%rax
  80478b:	00 00 00 
  80478e:	ff d0                	callq  *%rax
  804790:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804793:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804797:	79 05                	jns    80479e <pipeisclosed+0x31>
  804799:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80479c:	eb 31                	jmp    8047cf <pipeisclosed+0x62>
  80479e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8047a2:	48 89 c7             	mov    %rax,%rdi
  8047a5:	48 b8 0c 27 80 00 00 	movabs $0x80270c,%rax
  8047ac:	00 00 00 
  8047af:	ff d0                	callq  *%rax
  8047b1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8047b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8047b9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8047bd:	48 89 d6             	mov    %rdx,%rsi
  8047c0:	48 89 c7             	mov    %rax,%rdi
  8047c3:	48 b8 9f 46 80 00 00 	movabs $0x80469f,%rax
  8047ca:	00 00 00 
  8047cd:	ff d0                	callq  *%rax
  8047cf:	c9                   	leaveq 
  8047d0:	c3                   	retq   

00000000008047d1 <devpipe_read>:
  8047d1:	55                   	push   %rbp
  8047d2:	48 89 e5             	mov    %rsp,%rbp
  8047d5:	48 83 ec 40          	sub    $0x40,%rsp
  8047d9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8047dd:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8047e1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8047e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8047e9:	48 89 c7             	mov    %rax,%rdi
  8047ec:	48 b8 0c 27 80 00 00 	movabs $0x80270c,%rax
  8047f3:	00 00 00 
  8047f6:	ff d0                	callq  *%rax
  8047f8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8047fc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804800:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804804:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80480b:	00 
  80480c:	e9 90 00 00 00       	jmpq   8048a1 <devpipe_read+0xd0>
  804811:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804816:	74 09                	je     804821 <devpipe_read+0x50>
  804818:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80481c:	e9 8e 00 00 00       	jmpq   8048af <devpipe_read+0xde>
  804821:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804825:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804829:	48 89 d6             	mov    %rdx,%rsi
  80482c:	48 89 c7             	mov    %rax,%rdi
  80482f:	48 b8 9f 46 80 00 00 	movabs $0x80469f,%rax
  804836:	00 00 00 
  804839:	ff d0                	callq  *%rax
  80483b:	85 c0                	test   %eax,%eax
  80483d:	74 07                	je     804846 <devpipe_read+0x75>
  80483f:	b8 00 00 00 00       	mov    $0x0,%eax
  804844:	eb 69                	jmp    8048af <devpipe_read+0xde>
  804846:	48 b8 b0 22 80 00 00 	movabs $0x8022b0,%rax
  80484d:	00 00 00 
  804850:	ff d0                	callq  *%rax
  804852:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804856:	8b 10                	mov    (%rax),%edx
  804858:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80485c:	8b 40 04             	mov    0x4(%rax),%eax
  80485f:	39 c2                	cmp    %eax,%edx
  804861:	74 ae                	je     804811 <devpipe_read+0x40>
  804863:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804867:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80486b:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  80486f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804873:	8b 00                	mov    (%rax),%eax
  804875:	99                   	cltd   
  804876:	c1 ea 1b             	shr    $0x1b,%edx
  804879:	01 d0                	add    %edx,%eax
  80487b:	83 e0 1f             	and    $0x1f,%eax
  80487e:	29 d0                	sub    %edx,%eax
  804880:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804884:	48 98                	cltq   
  804886:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  80488b:	88 01                	mov    %al,(%rcx)
  80488d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804891:	8b 00                	mov    (%rax),%eax
  804893:	8d 50 01             	lea    0x1(%rax),%edx
  804896:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80489a:	89 10                	mov    %edx,(%rax)
  80489c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8048a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8048a5:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8048a9:	72 a7                	jb     804852 <devpipe_read+0x81>
  8048ab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8048af:	c9                   	leaveq 
  8048b0:	c3                   	retq   

00000000008048b1 <devpipe_write>:
  8048b1:	55                   	push   %rbp
  8048b2:	48 89 e5             	mov    %rsp,%rbp
  8048b5:	48 83 ec 40          	sub    $0x40,%rsp
  8048b9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8048bd:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8048c1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8048c5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048c9:	48 89 c7             	mov    %rax,%rdi
  8048cc:	48 b8 0c 27 80 00 00 	movabs $0x80270c,%rax
  8048d3:	00 00 00 
  8048d6:	ff d0                	callq  *%rax
  8048d8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8048dc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8048e0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8048e4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8048eb:	00 
  8048ec:	e9 8f 00 00 00       	jmpq   804980 <devpipe_write+0xcf>
  8048f1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8048f5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048f9:	48 89 d6             	mov    %rdx,%rsi
  8048fc:	48 89 c7             	mov    %rax,%rdi
  8048ff:	48 b8 9f 46 80 00 00 	movabs $0x80469f,%rax
  804906:	00 00 00 
  804909:	ff d0                	callq  *%rax
  80490b:	85 c0                	test   %eax,%eax
  80490d:	74 07                	je     804916 <devpipe_write+0x65>
  80490f:	b8 00 00 00 00       	mov    $0x0,%eax
  804914:	eb 78                	jmp    80498e <devpipe_write+0xdd>
  804916:	48 b8 b0 22 80 00 00 	movabs $0x8022b0,%rax
  80491d:	00 00 00 
  804920:	ff d0                	callq  *%rax
  804922:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804926:	8b 40 04             	mov    0x4(%rax),%eax
  804929:	48 63 d0             	movslq %eax,%rdx
  80492c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804930:	8b 00                	mov    (%rax),%eax
  804932:	48 98                	cltq   
  804934:	48 83 c0 20          	add    $0x20,%rax
  804938:	48 39 c2             	cmp    %rax,%rdx
  80493b:	73 b4                	jae    8048f1 <devpipe_write+0x40>
  80493d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804941:	8b 40 04             	mov    0x4(%rax),%eax
  804944:	99                   	cltd   
  804945:	c1 ea 1b             	shr    $0x1b,%edx
  804948:	01 d0                	add    %edx,%eax
  80494a:	83 e0 1f             	and    $0x1f,%eax
  80494d:	29 d0                	sub    %edx,%eax
  80494f:	89 c6                	mov    %eax,%esi
  804951:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804955:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804959:	48 01 d0             	add    %rdx,%rax
  80495c:	0f b6 08             	movzbl (%rax),%ecx
  80495f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804963:	48 63 c6             	movslq %esi,%rax
  804966:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80496a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80496e:	8b 40 04             	mov    0x4(%rax),%eax
  804971:	8d 50 01             	lea    0x1(%rax),%edx
  804974:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804978:	89 50 04             	mov    %edx,0x4(%rax)
  80497b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804980:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804984:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804988:	72 98                	jb     804922 <devpipe_write+0x71>
  80498a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80498e:	c9                   	leaveq 
  80498f:	c3                   	retq   

0000000000804990 <devpipe_stat>:
  804990:	55                   	push   %rbp
  804991:	48 89 e5             	mov    %rsp,%rbp
  804994:	48 83 ec 20          	sub    $0x20,%rsp
  804998:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80499c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8049a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8049a4:	48 89 c7             	mov    %rax,%rdi
  8049a7:	48 b8 0c 27 80 00 00 	movabs $0x80270c,%rax
  8049ae:	00 00 00 
  8049b1:	ff d0                	callq  *%rax
  8049b3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8049b7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8049bb:	48 be fb 5d 80 00 00 	movabs $0x805dfb,%rsi
  8049c2:	00 00 00 
  8049c5:	48 89 c7             	mov    %rax,%rdi
  8049c8:	48 b8 bd 19 80 00 00 	movabs $0x8019bd,%rax
  8049cf:	00 00 00 
  8049d2:	ff d0                	callq  *%rax
  8049d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8049d8:	8b 50 04             	mov    0x4(%rax),%edx
  8049db:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8049df:	8b 00                	mov    (%rax),%eax
  8049e1:	29 c2                	sub    %eax,%edx
  8049e3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8049e7:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8049ed:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8049f1:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8049f8:	00 00 00 
  8049fb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8049ff:	48 b9 40 81 80 00 00 	movabs $0x808140,%rcx
  804a06:	00 00 00 
  804a09:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804a10:	b8 00 00 00 00       	mov    $0x0,%eax
  804a15:	c9                   	leaveq 
  804a16:	c3                   	retq   

0000000000804a17 <devpipe_close>:
  804a17:	55                   	push   %rbp
  804a18:	48 89 e5             	mov    %rsp,%rbp
  804a1b:	48 83 ec 10          	sub    $0x10,%rsp
  804a1f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804a23:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a27:	48 89 c6             	mov    %rax,%rsi
  804a2a:	bf 00 00 00 00       	mov    $0x0,%edi
  804a2f:	48 b8 9f 23 80 00 00 	movabs $0x80239f,%rax
  804a36:	00 00 00 
  804a39:	ff d0                	callq  *%rax
  804a3b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a3f:	48 89 c7             	mov    %rax,%rdi
  804a42:	48 b8 0c 27 80 00 00 	movabs $0x80270c,%rax
  804a49:	00 00 00 
  804a4c:	ff d0                	callq  *%rax
  804a4e:	48 89 c6             	mov    %rax,%rsi
  804a51:	bf 00 00 00 00       	mov    $0x0,%edi
  804a56:	48 b8 9f 23 80 00 00 	movabs $0x80239f,%rax
  804a5d:	00 00 00 
  804a60:	ff d0                	callq  *%rax
  804a62:	c9                   	leaveq 
  804a63:	c3                   	retq   

0000000000804a64 <cputchar>:
  804a64:	55                   	push   %rbp
  804a65:	48 89 e5             	mov    %rsp,%rbp
  804a68:	48 83 ec 20          	sub    $0x20,%rsp
  804a6c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804a6f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804a72:	88 45 ff             	mov    %al,-0x1(%rbp)
  804a75:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804a79:	be 01 00 00 00       	mov    $0x1,%esi
  804a7e:	48 89 c7             	mov    %rax,%rdi
  804a81:	48 b8 a5 21 80 00 00 	movabs $0x8021a5,%rax
  804a88:	00 00 00 
  804a8b:	ff d0                	callq  *%rax
  804a8d:	90                   	nop
  804a8e:	c9                   	leaveq 
  804a8f:	c3                   	retq   

0000000000804a90 <getchar>:
  804a90:	55                   	push   %rbp
  804a91:	48 89 e5             	mov    %rsp,%rbp
  804a94:	48 83 ec 10          	sub    $0x10,%rsp
  804a98:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804a9c:	ba 01 00 00 00       	mov    $0x1,%edx
  804aa1:	48 89 c6             	mov    %rax,%rsi
  804aa4:	bf 00 00 00 00       	mov    $0x0,%edi
  804aa9:	48 b8 04 2c 80 00 00 	movabs $0x802c04,%rax
  804ab0:	00 00 00 
  804ab3:	ff d0                	callq  *%rax
  804ab5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804ab8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804abc:	79 05                	jns    804ac3 <getchar+0x33>
  804abe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804ac1:	eb 14                	jmp    804ad7 <getchar+0x47>
  804ac3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804ac7:	7f 07                	jg     804ad0 <getchar+0x40>
  804ac9:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804ace:	eb 07                	jmp    804ad7 <getchar+0x47>
  804ad0:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804ad4:	0f b6 c0             	movzbl %al,%eax
  804ad7:	c9                   	leaveq 
  804ad8:	c3                   	retq   

0000000000804ad9 <iscons>:
  804ad9:	55                   	push   %rbp
  804ada:	48 89 e5             	mov    %rsp,%rbp
  804add:	48 83 ec 20          	sub    $0x20,%rsp
  804ae1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804ae4:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804ae8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804aeb:	48 89 d6             	mov    %rdx,%rsi
  804aee:	89 c7                	mov    %eax,%edi
  804af0:	48 b8 cf 27 80 00 00 	movabs $0x8027cf,%rax
  804af7:	00 00 00 
  804afa:	ff d0                	callq  *%rax
  804afc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804aff:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804b03:	79 05                	jns    804b0a <iscons+0x31>
  804b05:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b08:	eb 1a                	jmp    804b24 <iscons+0x4b>
  804b0a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b0e:	8b 10                	mov    (%rax),%edx
  804b10:	48 b8 80 81 80 00 00 	movabs $0x808180,%rax
  804b17:	00 00 00 
  804b1a:	8b 00                	mov    (%rax),%eax
  804b1c:	39 c2                	cmp    %eax,%edx
  804b1e:	0f 94 c0             	sete   %al
  804b21:	0f b6 c0             	movzbl %al,%eax
  804b24:	c9                   	leaveq 
  804b25:	c3                   	retq   

0000000000804b26 <opencons>:
  804b26:	55                   	push   %rbp
  804b27:	48 89 e5             	mov    %rsp,%rbp
  804b2a:	48 83 ec 10          	sub    $0x10,%rsp
  804b2e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804b32:	48 89 c7             	mov    %rax,%rdi
  804b35:	48 b8 37 27 80 00 00 	movabs $0x802737,%rax
  804b3c:	00 00 00 
  804b3f:	ff d0                	callq  *%rax
  804b41:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804b44:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804b48:	79 05                	jns    804b4f <opencons+0x29>
  804b4a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b4d:	eb 5b                	jmp    804baa <opencons+0x84>
  804b4f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b53:	ba 07 04 00 00       	mov    $0x407,%edx
  804b58:	48 89 c6             	mov    %rax,%rsi
  804b5b:	bf 00 00 00 00       	mov    $0x0,%edi
  804b60:	48 b8 ed 22 80 00 00 	movabs $0x8022ed,%rax
  804b67:	00 00 00 
  804b6a:	ff d0                	callq  *%rax
  804b6c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804b6f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804b73:	79 05                	jns    804b7a <opencons+0x54>
  804b75:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b78:	eb 30                	jmp    804baa <opencons+0x84>
  804b7a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b7e:	48 ba 80 81 80 00 00 	movabs $0x808180,%rdx
  804b85:	00 00 00 
  804b88:	8b 12                	mov    (%rdx),%edx
  804b8a:	89 10                	mov    %edx,(%rax)
  804b8c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b90:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804b97:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b9b:	48 89 c7             	mov    %rax,%rdi
  804b9e:	48 b8 e9 26 80 00 00 	movabs $0x8026e9,%rax
  804ba5:	00 00 00 
  804ba8:	ff d0                	callq  *%rax
  804baa:	c9                   	leaveq 
  804bab:	c3                   	retq   

0000000000804bac <devcons_read>:
  804bac:	55                   	push   %rbp
  804bad:	48 89 e5             	mov    %rsp,%rbp
  804bb0:	48 83 ec 30          	sub    $0x30,%rsp
  804bb4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804bb8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804bbc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804bc0:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804bc5:	75 13                	jne    804bda <devcons_read+0x2e>
  804bc7:	b8 00 00 00 00       	mov    $0x0,%eax
  804bcc:	eb 49                	jmp    804c17 <devcons_read+0x6b>
  804bce:	48 b8 b0 22 80 00 00 	movabs $0x8022b0,%rax
  804bd5:	00 00 00 
  804bd8:	ff d0                	callq  *%rax
  804bda:	48 b8 f2 21 80 00 00 	movabs $0x8021f2,%rax
  804be1:	00 00 00 
  804be4:	ff d0                	callq  *%rax
  804be6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804be9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804bed:	74 df                	je     804bce <devcons_read+0x22>
  804bef:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804bf3:	79 05                	jns    804bfa <devcons_read+0x4e>
  804bf5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804bf8:	eb 1d                	jmp    804c17 <devcons_read+0x6b>
  804bfa:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804bfe:	75 07                	jne    804c07 <devcons_read+0x5b>
  804c00:	b8 00 00 00 00       	mov    $0x0,%eax
  804c05:	eb 10                	jmp    804c17 <devcons_read+0x6b>
  804c07:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804c0a:	89 c2                	mov    %eax,%edx
  804c0c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804c10:	88 10                	mov    %dl,(%rax)
  804c12:	b8 01 00 00 00       	mov    $0x1,%eax
  804c17:	c9                   	leaveq 
  804c18:	c3                   	retq   

0000000000804c19 <devcons_write>:
  804c19:	55                   	push   %rbp
  804c1a:	48 89 e5             	mov    %rsp,%rbp
  804c1d:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  804c24:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804c2b:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804c32:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804c39:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804c40:	eb 76                	jmp    804cb8 <devcons_write+0x9f>
  804c42:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804c49:	89 c2                	mov    %eax,%edx
  804c4b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804c4e:	29 c2                	sub    %eax,%edx
  804c50:	89 d0                	mov    %edx,%eax
  804c52:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804c55:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804c58:	83 f8 7f             	cmp    $0x7f,%eax
  804c5b:	76 07                	jbe    804c64 <devcons_write+0x4b>
  804c5d:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804c64:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804c67:	48 63 d0             	movslq %eax,%rdx
  804c6a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804c6d:	48 63 c8             	movslq %eax,%rcx
  804c70:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804c77:	48 01 c1             	add    %rax,%rcx
  804c7a:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804c81:	48 89 ce             	mov    %rcx,%rsi
  804c84:	48 89 c7             	mov    %rax,%rdi
  804c87:	48 b8 e2 1c 80 00 00 	movabs $0x801ce2,%rax
  804c8e:	00 00 00 
  804c91:	ff d0                	callq  *%rax
  804c93:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804c96:	48 63 d0             	movslq %eax,%rdx
  804c99:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804ca0:	48 89 d6             	mov    %rdx,%rsi
  804ca3:	48 89 c7             	mov    %rax,%rdi
  804ca6:	48 b8 a5 21 80 00 00 	movabs $0x8021a5,%rax
  804cad:	00 00 00 
  804cb0:	ff d0                	callq  *%rax
  804cb2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804cb5:	01 45 fc             	add    %eax,-0x4(%rbp)
  804cb8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804cbb:	48 98                	cltq   
  804cbd:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804cc4:	0f 82 78 ff ff ff    	jb     804c42 <devcons_write+0x29>
  804cca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804ccd:	c9                   	leaveq 
  804cce:	c3                   	retq   

0000000000804ccf <devcons_close>:
  804ccf:	55                   	push   %rbp
  804cd0:	48 89 e5             	mov    %rsp,%rbp
  804cd3:	48 83 ec 08          	sub    $0x8,%rsp
  804cd7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804cdb:	b8 00 00 00 00       	mov    $0x0,%eax
  804ce0:	c9                   	leaveq 
  804ce1:	c3                   	retq   

0000000000804ce2 <devcons_stat>:
  804ce2:	55                   	push   %rbp
  804ce3:	48 89 e5             	mov    %rsp,%rbp
  804ce6:	48 83 ec 10          	sub    $0x10,%rsp
  804cea:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804cee:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804cf2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804cf6:	48 be 07 5e 80 00 00 	movabs $0x805e07,%rsi
  804cfd:	00 00 00 
  804d00:	48 89 c7             	mov    %rax,%rdi
  804d03:	48 b8 bd 19 80 00 00 	movabs $0x8019bd,%rax
  804d0a:	00 00 00 
  804d0d:	ff d0                	callq  *%rax
  804d0f:	b8 00 00 00 00       	mov    $0x0,%eax
  804d14:	c9                   	leaveq 
  804d15:	c3                   	retq   

0000000000804d16 <ipc_recv>:
  804d16:	55                   	push   %rbp
  804d17:	48 89 e5             	mov    %rsp,%rbp
  804d1a:	48 83 ec 30          	sub    $0x30,%rsp
  804d1e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804d22:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804d26:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804d2a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804d2f:	75 0e                	jne    804d3f <ipc_recv+0x29>
  804d31:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804d38:	00 00 00 
  804d3b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804d3f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804d43:	48 89 c7             	mov    %rax,%rdi
  804d46:	48 b8 27 25 80 00 00 	movabs $0x802527,%rax
  804d4d:	00 00 00 
  804d50:	ff d0                	callq  *%rax
  804d52:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804d55:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804d59:	79 27                	jns    804d82 <ipc_recv+0x6c>
  804d5b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804d60:	74 0a                	je     804d6c <ipc_recv+0x56>
  804d62:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804d66:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804d6c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804d71:	74 0a                	je     804d7d <ipc_recv+0x67>
  804d73:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804d77:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804d7d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804d80:	eb 53                	jmp    804dd5 <ipc_recv+0xbf>
  804d82:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804d87:	74 19                	je     804da2 <ipc_recv+0x8c>
  804d89:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  804d90:	00 00 00 
  804d93:	48 8b 00             	mov    (%rax),%rax
  804d96:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804d9c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804da0:	89 10                	mov    %edx,(%rax)
  804da2:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804da7:	74 19                	je     804dc2 <ipc_recv+0xac>
  804da9:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  804db0:	00 00 00 
  804db3:	48 8b 00             	mov    (%rax),%rax
  804db6:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804dbc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804dc0:	89 10                	mov    %edx,(%rax)
  804dc2:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  804dc9:	00 00 00 
  804dcc:	48 8b 00             	mov    (%rax),%rax
  804dcf:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804dd5:	c9                   	leaveq 
  804dd6:	c3                   	retq   

0000000000804dd7 <ipc_send>:
  804dd7:	55                   	push   %rbp
  804dd8:	48 89 e5             	mov    %rsp,%rbp
  804ddb:	48 83 ec 30          	sub    $0x30,%rsp
  804ddf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804de2:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804de5:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804de9:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804dec:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804df1:	75 1c                	jne    804e0f <ipc_send+0x38>
  804df3:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804dfa:	00 00 00 
  804dfd:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804e01:	eb 0c                	jmp    804e0f <ipc_send+0x38>
  804e03:	48 b8 b0 22 80 00 00 	movabs $0x8022b0,%rax
  804e0a:	00 00 00 
  804e0d:	ff d0                	callq  *%rax
  804e0f:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804e12:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804e15:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804e19:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804e1c:	89 c7                	mov    %eax,%edi
  804e1e:	48 b8 d0 24 80 00 00 	movabs $0x8024d0,%rax
  804e25:	00 00 00 
  804e28:	ff d0                	callq  *%rax
  804e2a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804e2d:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804e31:	74 d0                	je     804e03 <ipc_send+0x2c>
  804e33:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804e37:	79 30                	jns    804e69 <ipc_send+0x92>
  804e39:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804e3c:	89 c1                	mov    %eax,%ecx
  804e3e:	48 ba 10 5e 80 00 00 	movabs $0x805e10,%rdx
  804e45:	00 00 00 
  804e48:	be 44 00 00 00       	mov    $0x44,%esi
  804e4d:	48 bf 26 5e 80 00 00 	movabs $0x805e26,%rdi
  804e54:	00 00 00 
  804e57:	b8 00 00 00 00       	mov    $0x0,%eax
  804e5c:	49 b8 f3 0b 80 00 00 	movabs $0x800bf3,%r8
  804e63:	00 00 00 
  804e66:	41 ff d0             	callq  *%r8
  804e69:	90                   	nop
  804e6a:	c9                   	leaveq 
  804e6b:	c3                   	retq   

0000000000804e6c <ipc_host_recv>:
  804e6c:	55                   	push   %rbp
  804e6d:	48 89 e5             	mov    %rsp,%rbp
  804e70:	48 83 ec 10          	sub    $0x10,%rsp
  804e74:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804e78:	48 ba 38 5e 80 00 00 	movabs $0x805e38,%rdx
  804e7f:	00 00 00 
  804e82:	be 4e 00 00 00       	mov    $0x4e,%esi
  804e87:	48 bf 26 5e 80 00 00 	movabs $0x805e26,%rdi
  804e8e:	00 00 00 
  804e91:	b8 00 00 00 00       	mov    $0x0,%eax
  804e96:	48 b9 f3 0b 80 00 00 	movabs $0x800bf3,%rcx
  804e9d:	00 00 00 
  804ea0:	ff d1                	callq  *%rcx

0000000000804ea2 <ipc_host_send>:
  804ea2:	55                   	push   %rbp
  804ea3:	48 89 e5             	mov    %rsp,%rbp
  804ea6:	48 83 ec 20          	sub    $0x20,%rsp
  804eaa:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804ead:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804eb0:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  804eb4:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804eb7:	48 ba 58 5e 80 00 00 	movabs $0x805e58,%rdx
  804ebe:	00 00 00 
  804ec1:	be 58 00 00 00       	mov    $0x58,%esi
  804ec6:	48 bf 26 5e 80 00 00 	movabs $0x805e26,%rdi
  804ecd:	00 00 00 
  804ed0:	b8 00 00 00 00       	mov    $0x0,%eax
  804ed5:	48 b9 f3 0b 80 00 00 	movabs $0x800bf3,%rcx
  804edc:	00 00 00 
  804edf:	ff d1                	callq  *%rcx

0000000000804ee1 <ipc_find_env>:
  804ee1:	55                   	push   %rbp
  804ee2:	48 89 e5             	mov    %rsp,%rbp
  804ee5:	48 83 ec 18          	sub    $0x18,%rsp
  804ee9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804eec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804ef3:	eb 4d                	jmp    804f42 <ipc_find_env+0x61>
  804ef5:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804efc:	00 00 00 
  804eff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804f02:	48 98                	cltq   
  804f04:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804f0b:	48 01 d0             	add    %rdx,%rax
  804f0e:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804f14:	8b 00                	mov    (%rax),%eax
  804f16:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804f19:	75 23                	jne    804f3e <ipc_find_env+0x5d>
  804f1b:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804f22:	00 00 00 
  804f25:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804f28:	48 98                	cltq   
  804f2a:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804f31:	48 01 d0             	add    %rdx,%rax
  804f34:	48 05 c8 00 00 00    	add    $0xc8,%rax
  804f3a:	8b 00                	mov    (%rax),%eax
  804f3c:	eb 12                	jmp    804f50 <ipc_find_env+0x6f>
  804f3e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804f42:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804f49:	7e aa                	jle    804ef5 <ipc_find_env+0x14>
  804f4b:	b8 00 00 00 00       	mov    $0x0,%eax
  804f50:	c9                   	leaveq 
  804f51:	c3                   	retq   

0000000000804f52 <pageref>:
  804f52:	55                   	push   %rbp
  804f53:	48 89 e5             	mov    %rsp,%rbp
  804f56:	48 83 ec 18          	sub    $0x18,%rsp
  804f5a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804f5e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804f62:	48 c1 e8 15          	shr    $0x15,%rax
  804f66:	48 89 c2             	mov    %rax,%rdx
  804f69:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804f70:	01 00 00 
  804f73:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804f77:	83 e0 01             	and    $0x1,%eax
  804f7a:	48 85 c0             	test   %rax,%rax
  804f7d:	75 07                	jne    804f86 <pageref+0x34>
  804f7f:	b8 00 00 00 00       	mov    $0x0,%eax
  804f84:	eb 56                	jmp    804fdc <pageref+0x8a>
  804f86:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804f8a:	48 c1 e8 0c          	shr    $0xc,%rax
  804f8e:	48 89 c2             	mov    %rax,%rdx
  804f91:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804f98:	01 00 00 
  804f9b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804f9f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804fa3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804fa7:	83 e0 01             	and    $0x1,%eax
  804faa:	48 85 c0             	test   %rax,%rax
  804fad:	75 07                	jne    804fb6 <pageref+0x64>
  804faf:	b8 00 00 00 00       	mov    $0x0,%eax
  804fb4:	eb 26                	jmp    804fdc <pageref+0x8a>
  804fb6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804fba:	48 c1 e8 0c          	shr    $0xc,%rax
  804fbe:	48 89 c2             	mov    %rax,%rdx
  804fc1:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804fc8:	00 00 00 
  804fcb:	48 c1 e2 04          	shl    $0x4,%rdx
  804fcf:	48 01 d0             	add    %rdx,%rax
  804fd2:	48 83 c0 08          	add    $0x8,%rax
  804fd6:	0f b7 00             	movzwl (%rax),%eax
  804fd9:	0f b7 c0             	movzwl %ax,%eax
  804fdc:	c9                   	leaveq 
  804fdd:	c3                   	retq   

0000000000804fde <inet_addr>:
  804fde:	55                   	push   %rbp
  804fdf:	48 89 e5             	mov    %rsp,%rbp
  804fe2:	48 83 ec 20          	sub    $0x20,%rsp
  804fe6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804fea:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
  804fee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804ff2:	48 89 d6             	mov    %rdx,%rsi
  804ff5:	48 89 c7             	mov    %rax,%rdi
  804ff8:	48 b8 14 50 80 00 00 	movabs $0x805014,%rax
  804fff:	00 00 00 
  805002:	ff d0                	callq  *%rax
  805004:	85 c0                	test   %eax,%eax
  805006:	74 05                	je     80500d <inet_addr+0x2f>
  805008:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80500b:	eb 05                	jmp    805012 <inet_addr+0x34>
  80500d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  805012:	c9                   	leaveq 
  805013:	c3                   	retq   

0000000000805014 <inet_aton>:
  805014:	55                   	push   %rbp
  805015:	48 89 e5             	mov    %rsp,%rbp
  805018:	48 83 ec 40          	sub    $0x40,%rsp
  80501c:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  805020:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  805024:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  805028:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80502c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805030:	0f b6 00             	movzbl (%rax),%eax
  805033:	0f be c0             	movsbl %al,%eax
  805036:	89 45 f4             	mov    %eax,-0xc(%rbp)
  805039:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80503c:	3c 2f                	cmp    $0x2f,%al
  80503e:	76 07                	jbe    805047 <inet_aton+0x33>
  805040:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805043:	3c 39                	cmp    $0x39,%al
  805045:	76 0a                	jbe    805051 <inet_aton+0x3d>
  805047:	b8 00 00 00 00       	mov    $0x0,%eax
  80504c:	e9 6a 02 00 00       	jmpq   8052bb <inet_aton+0x2a7>
  805051:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  805058:	c7 45 f8 0a 00 00 00 	movl   $0xa,-0x8(%rbp)
  80505f:	83 7d f4 30          	cmpl   $0x30,-0xc(%rbp)
  805063:	75 40                	jne    8050a5 <inet_aton+0x91>
  805065:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  80506a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80506e:	0f b6 00             	movzbl (%rax),%eax
  805071:	0f be c0             	movsbl %al,%eax
  805074:	89 45 f4             	mov    %eax,-0xc(%rbp)
  805077:	83 7d f4 78          	cmpl   $0x78,-0xc(%rbp)
  80507b:	74 06                	je     805083 <inet_aton+0x6f>
  80507d:	83 7d f4 58          	cmpl   $0x58,-0xc(%rbp)
  805081:	75 1b                	jne    80509e <inet_aton+0x8a>
  805083:	c7 45 f8 10 00 00 00 	movl   $0x10,-0x8(%rbp)
  80508a:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  80508f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805093:	0f b6 00             	movzbl (%rax),%eax
  805096:	0f be c0             	movsbl %al,%eax
  805099:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80509c:	eb 07                	jmp    8050a5 <inet_aton+0x91>
  80509e:	c7 45 f8 08 00 00 00 	movl   $0x8,-0x8(%rbp)
  8050a5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8050a8:	3c 2f                	cmp    $0x2f,%al
  8050aa:	76 2f                	jbe    8050db <inet_aton+0xc7>
  8050ac:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8050af:	3c 39                	cmp    $0x39,%al
  8050b1:	77 28                	ja     8050db <inet_aton+0xc7>
  8050b3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8050b6:	0f af 45 fc          	imul   -0x4(%rbp),%eax
  8050ba:	89 c2                	mov    %eax,%edx
  8050bc:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8050bf:	01 d0                	add    %edx,%eax
  8050c1:	83 e8 30             	sub    $0x30,%eax
  8050c4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8050c7:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  8050cc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8050d0:	0f b6 00             	movzbl (%rax),%eax
  8050d3:	0f be c0             	movsbl %al,%eax
  8050d6:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8050d9:	eb 73                	jmp    80514e <inet_aton+0x13a>
  8050db:	83 7d f8 10          	cmpl   $0x10,-0x8(%rbp)
  8050df:	75 72                	jne    805153 <inet_aton+0x13f>
  8050e1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8050e4:	3c 2f                	cmp    $0x2f,%al
  8050e6:	76 07                	jbe    8050ef <inet_aton+0xdb>
  8050e8:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8050eb:	3c 39                	cmp    $0x39,%al
  8050ed:	76 1c                	jbe    80510b <inet_aton+0xf7>
  8050ef:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8050f2:	3c 60                	cmp    $0x60,%al
  8050f4:	76 07                	jbe    8050fd <inet_aton+0xe9>
  8050f6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8050f9:	3c 66                	cmp    $0x66,%al
  8050fb:	76 0e                	jbe    80510b <inet_aton+0xf7>
  8050fd:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805100:	3c 40                	cmp    $0x40,%al
  805102:	76 4f                	jbe    805153 <inet_aton+0x13f>
  805104:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805107:	3c 46                	cmp    $0x46,%al
  805109:	77 48                	ja     805153 <inet_aton+0x13f>
  80510b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80510e:	c1 e0 04             	shl    $0x4,%eax
  805111:	89 c2                	mov    %eax,%edx
  805113:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805116:	8d 48 0a             	lea    0xa(%rax),%ecx
  805119:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80511c:	3c 60                	cmp    $0x60,%al
  80511e:	76 0e                	jbe    80512e <inet_aton+0x11a>
  805120:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805123:	3c 7a                	cmp    $0x7a,%al
  805125:	77 07                	ja     80512e <inet_aton+0x11a>
  805127:	b8 61 00 00 00       	mov    $0x61,%eax
  80512c:	eb 05                	jmp    805133 <inet_aton+0x11f>
  80512e:	b8 41 00 00 00       	mov    $0x41,%eax
  805133:	29 c1                	sub    %eax,%ecx
  805135:	89 c8                	mov    %ecx,%eax
  805137:	09 d0                	or     %edx,%eax
  805139:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80513c:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  805141:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805145:	0f b6 00             	movzbl (%rax),%eax
  805148:	0f be c0             	movsbl %al,%eax
  80514b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80514e:	e9 52 ff ff ff       	jmpq   8050a5 <inet_aton+0x91>
  805153:	83 7d f4 2e          	cmpl   $0x2e,-0xc(%rbp)
  805157:	75 40                	jne    805199 <inet_aton+0x185>
  805159:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80515d:	48 83 c0 0c          	add    $0xc,%rax
  805161:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  805165:	77 0a                	ja     805171 <inet_aton+0x15d>
  805167:	b8 00 00 00 00       	mov    $0x0,%eax
  80516c:	e9 4a 01 00 00       	jmpq   8052bb <inet_aton+0x2a7>
  805171:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805175:	48 8d 50 04          	lea    0x4(%rax),%rdx
  805179:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80517d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805180:	89 10                	mov    %edx,(%rax)
  805182:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  805187:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80518b:	0f b6 00             	movzbl (%rax),%eax
  80518e:	0f be c0             	movsbl %al,%eax
  805191:	89 45 f4             	mov    %eax,-0xc(%rbp)
  805194:	e9 a0 fe ff ff       	jmpq   805039 <inet_aton+0x25>
  805199:	90                   	nop
  80519a:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80519e:	74 3c                	je     8051dc <inet_aton+0x1c8>
  8051a0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051a3:	3c 1f                	cmp    $0x1f,%al
  8051a5:	76 2b                	jbe    8051d2 <inet_aton+0x1be>
  8051a7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051aa:	84 c0                	test   %al,%al
  8051ac:	78 24                	js     8051d2 <inet_aton+0x1be>
  8051ae:	83 7d f4 20          	cmpl   $0x20,-0xc(%rbp)
  8051b2:	74 28                	je     8051dc <inet_aton+0x1c8>
  8051b4:	83 7d f4 0c          	cmpl   $0xc,-0xc(%rbp)
  8051b8:	74 22                	je     8051dc <inet_aton+0x1c8>
  8051ba:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  8051be:	74 1c                	je     8051dc <inet_aton+0x1c8>
  8051c0:	83 7d f4 0d          	cmpl   $0xd,-0xc(%rbp)
  8051c4:	74 16                	je     8051dc <inet_aton+0x1c8>
  8051c6:	83 7d f4 09          	cmpl   $0x9,-0xc(%rbp)
  8051ca:	74 10                	je     8051dc <inet_aton+0x1c8>
  8051cc:	83 7d f4 0b          	cmpl   $0xb,-0xc(%rbp)
  8051d0:	74 0a                	je     8051dc <inet_aton+0x1c8>
  8051d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8051d7:	e9 df 00 00 00       	jmpq   8052bb <inet_aton+0x2a7>
  8051dc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8051e0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8051e4:	48 29 c2             	sub    %rax,%rdx
  8051e7:	48 89 d0             	mov    %rdx,%rax
  8051ea:	48 c1 f8 02          	sar    $0x2,%rax
  8051ee:	83 c0 01             	add    $0x1,%eax
  8051f1:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8051f4:	83 7d e4 04          	cmpl   $0x4,-0x1c(%rbp)
  8051f8:	0f 87 98 00 00 00    	ja     805296 <inet_aton+0x282>
  8051fe:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  805201:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  805208:	00 
  805209:	48 b8 78 5e 80 00 00 	movabs $0x805e78,%rax
  805210:	00 00 00 
  805213:	48 01 d0             	add    %rdx,%rax
  805216:	48 8b 00             	mov    (%rax),%rax
  805219:	ff e0                	jmpq   *%rax
  80521b:	b8 00 00 00 00       	mov    $0x0,%eax
  805220:	e9 96 00 00 00       	jmpq   8052bb <inet_aton+0x2a7>
  805225:	81 7d fc ff ff ff 00 	cmpl   $0xffffff,-0x4(%rbp)
  80522c:	76 0a                	jbe    805238 <inet_aton+0x224>
  80522e:	b8 00 00 00 00       	mov    $0x0,%eax
  805233:	e9 83 00 00 00       	jmpq   8052bb <inet_aton+0x2a7>
  805238:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80523b:	c1 e0 18             	shl    $0x18,%eax
  80523e:	09 45 fc             	or     %eax,-0x4(%rbp)
  805241:	eb 53                	jmp    805296 <inet_aton+0x282>
  805243:	81 7d fc ff ff 00 00 	cmpl   $0xffff,-0x4(%rbp)
  80524a:	76 07                	jbe    805253 <inet_aton+0x23f>
  80524c:	b8 00 00 00 00       	mov    $0x0,%eax
  805251:	eb 68                	jmp    8052bb <inet_aton+0x2a7>
  805253:	8b 45 d0             	mov    -0x30(%rbp),%eax
  805256:	c1 e0 18             	shl    $0x18,%eax
  805259:	89 c2                	mov    %eax,%edx
  80525b:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80525e:	c1 e0 10             	shl    $0x10,%eax
  805261:	09 d0                	or     %edx,%eax
  805263:	09 45 fc             	or     %eax,-0x4(%rbp)
  805266:	eb 2e                	jmp    805296 <inet_aton+0x282>
  805268:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
  80526f:	76 07                	jbe    805278 <inet_aton+0x264>
  805271:	b8 00 00 00 00       	mov    $0x0,%eax
  805276:	eb 43                	jmp    8052bb <inet_aton+0x2a7>
  805278:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80527b:	c1 e0 18             	shl    $0x18,%eax
  80527e:	89 c2                	mov    %eax,%edx
  805280:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  805283:	c1 e0 10             	shl    $0x10,%eax
  805286:	09 c2                	or     %eax,%edx
  805288:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80528b:	c1 e0 08             	shl    $0x8,%eax
  80528e:	09 d0                	or     %edx,%eax
  805290:	09 45 fc             	or     %eax,-0x4(%rbp)
  805293:	eb 01                	jmp    805296 <inet_aton+0x282>
  805295:	90                   	nop
  805296:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
  80529b:	74 19                	je     8052b6 <inet_aton+0x2a2>
  80529d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8052a0:	89 c7                	mov    %eax,%edi
  8052a2:	48 b8 34 54 80 00 00 	movabs $0x805434,%rax
  8052a9:	00 00 00 
  8052ac:	ff d0                	callq  *%rax
  8052ae:	89 c2                	mov    %eax,%edx
  8052b0:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8052b4:	89 10                	mov    %edx,(%rax)
  8052b6:	b8 01 00 00 00       	mov    $0x1,%eax
  8052bb:	c9                   	leaveq 
  8052bc:	c3                   	retq   

00000000008052bd <inet_ntoa>:
  8052bd:	55                   	push   %rbp
  8052be:	48 89 e5             	mov    %rsp,%rbp
  8052c1:	48 83 ec 28          	sub    $0x28,%rsp
  8052c5:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8052c8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8052cb:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8052ce:	48 b8 10 90 80 00 00 	movabs $0x809010,%rax
  8052d5:	00 00 00 
  8052d8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8052dc:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8052e0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8052e4:	c6 45 ef 00          	movb   $0x0,-0x11(%rbp)
  8052e8:	e9 e0 00 00 00       	jmpq   8053cd <inet_ntoa+0x110>
  8052ed:	c6 45 ee 00          	movb   $0x0,-0x12(%rbp)
  8052f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8052f5:	0f b6 08             	movzbl (%rax),%ecx
  8052f8:	0f b6 d1             	movzbl %cl,%edx
  8052fb:	89 d0                	mov    %edx,%eax
  8052fd:	c1 e0 02             	shl    $0x2,%eax
  805300:	01 d0                	add    %edx,%eax
  805302:	c1 e0 03             	shl    $0x3,%eax
  805305:	01 d0                	add    %edx,%eax
  805307:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  80530e:	01 d0                	add    %edx,%eax
  805310:	66 c1 e8 08          	shr    $0x8,%ax
  805314:	c0 e8 03             	shr    $0x3,%al
  805317:	88 45 ed             	mov    %al,-0x13(%rbp)
  80531a:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  80531e:	89 d0                	mov    %edx,%eax
  805320:	c1 e0 02             	shl    $0x2,%eax
  805323:	01 d0                	add    %edx,%eax
  805325:	01 c0                	add    %eax,%eax
  805327:	29 c1                	sub    %eax,%ecx
  805329:	89 c8                	mov    %ecx,%eax
  80532b:	88 45 ed             	mov    %al,-0x13(%rbp)
  80532e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805332:	0f b6 00             	movzbl (%rax),%eax
  805335:	0f b6 d0             	movzbl %al,%edx
  805338:	89 d0                	mov    %edx,%eax
  80533a:	c1 e0 02             	shl    $0x2,%eax
  80533d:	01 d0                	add    %edx,%eax
  80533f:	c1 e0 03             	shl    $0x3,%eax
  805342:	01 d0                	add    %edx,%eax
  805344:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  80534b:	01 d0                	add    %edx,%eax
  80534d:	66 c1 e8 08          	shr    $0x8,%ax
  805351:	89 c2                	mov    %eax,%edx
  805353:	c0 ea 03             	shr    $0x3,%dl
  805356:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80535a:	88 10                	mov    %dl,(%rax)
  80535c:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  805360:	8d 50 01             	lea    0x1(%rax),%edx
  805363:	88 55 ee             	mov    %dl,-0x12(%rbp)
  805366:	0f b6 c0             	movzbl %al,%eax
  805369:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  80536d:	83 c2 30             	add    $0x30,%edx
  805370:	48 98                	cltq   
  805372:	88 54 05 e5          	mov    %dl,-0x1b(%rbp,%rax,1)
  805376:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80537a:	0f b6 00             	movzbl (%rax),%eax
  80537d:	84 c0                	test   %al,%al
  80537f:	0f 85 6c ff ff ff    	jne    8052f1 <inet_ntoa+0x34>
  805385:	eb 1a                	jmp    8053a1 <inet_ntoa+0xe4>
  805387:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80538b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80538f:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  805393:	0f b6 55 ee          	movzbl -0x12(%rbp),%edx
  805397:	48 63 d2             	movslq %edx,%rdx
  80539a:	0f b6 54 15 e5       	movzbl -0x1b(%rbp,%rdx,1),%edx
  80539f:	88 10                	mov    %dl,(%rax)
  8053a1:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  8053a5:	8d 50 ff             	lea    -0x1(%rax),%edx
  8053a8:	88 55 ee             	mov    %dl,-0x12(%rbp)
  8053ab:	84 c0                	test   %al,%al
  8053ad:	75 d8                	jne    805387 <inet_ntoa+0xca>
  8053af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8053b3:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8053b7:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  8053bb:	c6 00 2e             	movb   $0x2e,(%rax)
  8053be:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8053c3:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8053c7:	83 c0 01             	add    $0x1,%eax
  8053ca:	88 45 ef             	mov    %al,-0x11(%rbp)
  8053cd:	80 7d ef 03          	cmpb   $0x3,-0x11(%rbp)
  8053d1:	0f 86 16 ff ff ff    	jbe    8052ed <inet_ntoa+0x30>
  8053d7:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
  8053dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8053e0:	c6 00 00             	movb   $0x0,(%rax)
  8053e3:	48 b8 10 90 80 00 00 	movabs $0x809010,%rax
  8053ea:	00 00 00 
  8053ed:	c9                   	leaveq 
  8053ee:	c3                   	retq   

00000000008053ef <htons>:
  8053ef:	55                   	push   %rbp
  8053f0:	48 89 e5             	mov    %rsp,%rbp
  8053f3:	48 83 ec 08          	sub    $0x8,%rsp
  8053f7:	89 f8                	mov    %edi,%eax
  8053f9:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  8053fd:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  805401:	c1 e0 08             	shl    $0x8,%eax
  805404:	89 c2                	mov    %eax,%edx
  805406:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  80540a:	66 c1 e8 08          	shr    $0x8,%ax
  80540e:	09 d0                	or     %edx,%eax
  805410:	c9                   	leaveq 
  805411:	c3                   	retq   

0000000000805412 <ntohs>:
  805412:	55                   	push   %rbp
  805413:	48 89 e5             	mov    %rsp,%rbp
  805416:	48 83 ec 08          	sub    $0x8,%rsp
  80541a:	89 f8                	mov    %edi,%eax
  80541c:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  805420:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  805424:	89 c7                	mov    %eax,%edi
  805426:	48 b8 ef 53 80 00 00 	movabs $0x8053ef,%rax
  80542d:	00 00 00 
  805430:	ff d0                	callq  *%rax
  805432:	c9                   	leaveq 
  805433:	c3                   	retq   

0000000000805434 <htonl>:
  805434:	55                   	push   %rbp
  805435:	48 89 e5             	mov    %rsp,%rbp
  805438:	48 83 ec 08          	sub    $0x8,%rsp
  80543c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80543f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805442:	c1 e0 18             	shl    $0x18,%eax
  805445:	89 c2                	mov    %eax,%edx
  805447:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80544a:	25 00 ff 00 00       	and    $0xff00,%eax
  80544f:	c1 e0 08             	shl    $0x8,%eax
  805452:	09 c2                	or     %eax,%edx
  805454:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805457:	25 00 00 ff 00       	and    $0xff0000,%eax
  80545c:	48 c1 e8 08          	shr    $0x8,%rax
  805460:	09 c2                	or     %eax,%edx
  805462:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805465:	c1 e8 18             	shr    $0x18,%eax
  805468:	09 d0                	or     %edx,%eax
  80546a:	c9                   	leaveq 
  80546b:	c3                   	retq   

000000000080546c <ntohl>:
  80546c:	55                   	push   %rbp
  80546d:	48 89 e5             	mov    %rsp,%rbp
  805470:	48 83 ec 08          	sub    $0x8,%rsp
  805474:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805477:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80547a:	89 c7                	mov    %eax,%edi
  80547c:	48 b8 34 54 80 00 00 	movabs $0x805434,%rax
  805483:	00 00 00 
  805486:	ff d0                	callq  *%rax
  805488:	c9                   	leaveq 
  805489:	c3                   	retq   
