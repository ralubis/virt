
vmm/guest/obj/user/echosrv:     file format elf64-x86-64


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
  80003c:	e8 fb 02 00 00       	callq  80033c <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <die>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 10          	sub    $0x10,%rsp
  80004b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80004f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800053:	48 89 c6             	mov    %rax,%rsi
  800056:	48 bf 00 47 80 00 00 	movabs $0x804700,%rdi
  80005d:	00 00 00 
  800060:	b8 00 00 00 00       	mov    $0x0,%eax
  800065:	48 ba 0a 05 80 00 00 	movabs $0x80050a,%rdx
  80006c:	00 00 00 
  80006f:	ff d2                	callq  *%rdx
  800071:	48 b8 c0 03 80 00 00 	movabs $0x8003c0,%rax
  800078:	00 00 00 
  80007b:	ff d0                	callq  *%rax
  80007d:	90                   	nop
  80007e:	c9                   	leaveq 
  80007f:	c3                   	retq   

0000000000800080 <handle_client>:
  800080:	55                   	push   %rbp
  800081:	48 89 e5             	mov    %rsp,%rbp
  800084:	48 83 ec 40          	sub    $0x40,%rsp
  800088:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80008b:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%rbp)
  800092:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
  800096:	8b 45 cc             	mov    -0x34(%rbp),%eax
  800099:	ba 20 00 00 00       	mov    $0x20,%edx
  80009e:	48 89 ce             	mov    %rcx,%rsi
  8000a1:	89 c7                	mov    %eax,%edi
  8000a3:	48 b8 e1 22 80 00 00 	movabs $0x8022e1,%rax
  8000aa:	00 00 00 
  8000ad:	ff d0                	callq  *%rax
  8000af:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8000b2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000b6:	0f 89 8d 00 00 00    	jns    800149 <handle_client+0xc9>
  8000bc:	48 bf 08 47 80 00 00 	movabs $0x804708,%rdi
  8000c3:	00 00 00 
  8000c6:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8000cd:	00 00 00 
  8000d0:	ff d0                	callq  *%rax
  8000d2:	eb 75                	jmp    800149 <handle_client+0xc9>
  8000d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000d7:	48 63 d0             	movslq %eax,%rdx
  8000da:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
  8000de:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8000e1:	48 89 ce             	mov    %rcx,%rsi
  8000e4:	89 c7                	mov    %eax,%edi
  8000e6:	48 b8 2c 24 80 00 00 	movabs $0x80242c,%rax
  8000ed:	00 00 00 
  8000f0:	ff d0                	callq  *%rax
  8000f2:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  8000f5:	74 16                	je     80010d <handle_client+0x8d>
  8000f7:	48 bf 38 47 80 00 00 	movabs $0x804738,%rdi
  8000fe:	00 00 00 
  800101:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800108:	00 00 00 
  80010b:	ff d0                	callq  *%rax
  80010d:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
  800111:	8b 45 cc             	mov    -0x34(%rbp),%eax
  800114:	ba 20 00 00 00       	mov    $0x20,%edx
  800119:	48 89 ce             	mov    %rcx,%rsi
  80011c:	89 c7                	mov    %eax,%edi
  80011e:	48 b8 e1 22 80 00 00 	movabs $0x8022e1,%rax
  800125:	00 00 00 
  800128:	ff d0                	callq  *%rax
  80012a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80012d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800131:	79 16                	jns    800149 <handle_client+0xc9>
  800133:	48 bf 58 47 80 00 00 	movabs $0x804758,%rdi
  80013a:	00 00 00 
  80013d:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800144:	00 00 00 
  800147:	ff d0                	callq  *%rax
  800149:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80014d:	7f 85                	jg     8000d4 <handle_client+0x54>
  80014f:	8b 45 cc             	mov    -0x34(%rbp),%eax
  800152:	89 c7                	mov    %eax,%edi
  800154:	48 b8 be 20 80 00 00 	movabs $0x8020be,%rax
  80015b:	00 00 00 
  80015e:	ff d0                	callq  *%rax
  800160:	90                   	nop
  800161:	c9                   	leaveq 
  800162:	c3                   	retq   

0000000000800163 <umain>:
  800163:	55                   	push   %rbp
  800164:	48 89 e5             	mov    %rsp,%rbp
  800167:	48 83 ec 70          	sub    $0x70,%rsp
  80016b:	89 7d 9c             	mov    %edi,-0x64(%rbp)
  80016e:	48 89 75 90          	mov    %rsi,-0x70(%rbp)
  800172:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800179:	ba 06 00 00 00       	mov    $0x6,%edx
  80017e:	be 01 00 00 00       	mov    $0x1,%esi
  800183:	bf 02 00 00 00       	mov    $0x2,%edi
  800188:	48 b8 6e 31 80 00 00 	movabs $0x80316e,%rax
  80018f:	00 00 00 
  800192:	ff d0                	callq  *%rax
  800194:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800197:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80019b:	79 16                	jns    8001b3 <umain+0x50>
  80019d:	48 bf 87 47 80 00 00 	movabs $0x804787,%rdi
  8001a4:	00 00 00 
  8001a7:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8001ae:	00 00 00 
  8001b1:	ff d0                	callq  *%rax
  8001b3:	48 bf 9f 47 80 00 00 	movabs $0x80479f,%rdi
  8001ba:	00 00 00 
  8001bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8001c2:	48 ba 0a 05 80 00 00 	movabs $0x80050a,%rdx
  8001c9:	00 00 00 
  8001cc:	ff d2                	callq  *%rdx
  8001ce:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  8001d2:	ba 10 00 00 00       	mov    $0x10,%edx
  8001d7:	be 00 00 00 00       	mov    $0x0,%esi
  8001dc:	48 89 c7             	mov    %rax,%rdi
  8001df:	48 b8 34 13 80 00 00 	movabs $0x801334,%rax
  8001e6:	00 00 00 
  8001e9:	ff d0                	callq  *%rax
  8001eb:	c6 45 e1 02          	movb   $0x2,-0x1f(%rbp)
  8001ef:	bf 00 00 00 00       	mov    $0x0,%edi
  8001f4:	48 b8 a6 46 80 00 00 	movabs $0x8046a6,%rax
  8001fb:	00 00 00 
  8001fe:	ff d0                	callq  *%rax
  800200:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  800203:	bf 07 00 00 00       	mov    $0x7,%edi
  800208:	48 b8 61 46 80 00 00 	movabs $0x804661,%rax
  80020f:	00 00 00 
  800212:	ff d0                	callq  *%rax
  800214:	66 89 45 e2          	mov    %ax,-0x1e(%rbp)
  800218:	48 bf ae 47 80 00 00 	movabs $0x8047ae,%rdi
  80021f:	00 00 00 
  800222:	b8 00 00 00 00       	mov    $0x0,%eax
  800227:	48 ba 0a 05 80 00 00 	movabs $0x80050a,%rdx
  80022e:	00 00 00 
  800231:	ff d2                	callq  *%rdx
  800233:	48 8d 4d e0          	lea    -0x20(%rbp),%rcx
  800237:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80023a:	ba 10 00 00 00       	mov    $0x10,%edx
  80023f:	48 89 ce             	mov    %rcx,%rsi
  800242:	89 c7                	mov    %eax,%edi
  800244:	48 b8 5e 2f 80 00 00 	movabs $0x802f5e,%rax
  80024b:	00 00 00 
  80024e:	ff d0                	callq  *%rax
  800250:	85 c0                	test   %eax,%eax
  800252:	79 16                	jns    80026a <umain+0x107>
  800254:	48 bf c0 47 80 00 00 	movabs $0x8047c0,%rdi
  80025b:	00 00 00 
  80025e:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800265:	00 00 00 
  800268:	ff d0                	callq  *%rax
  80026a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80026d:	be 05 00 00 00       	mov    $0x5,%esi
  800272:	89 c7                	mov    %eax,%edi
  800274:	48 b8 81 30 80 00 00 	movabs $0x803081,%rax
  80027b:	00 00 00 
  80027e:	ff d0                	callq  *%rax
  800280:	85 c0                	test   %eax,%eax
  800282:	79 16                	jns    80029a <umain+0x137>
  800284:	48 bf e8 47 80 00 00 	movabs $0x8047e8,%rdi
  80028b:	00 00 00 
  80028e:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800295:	00 00 00 
  800298:	ff d0                	callq  *%rax
  80029a:	48 bf 0a 48 80 00 00 	movabs $0x80480a,%rdi
  8002a1:	00 00 00 
  8002a4:	b8 00 00 00 00       	mov    $0x0,%eax
  8002a9:	48 ba 0a 05 80 00 00 	movabs $0x80050a,%rdx
  8002b0:	00 00 00 
  8002b3:	ff d2                	callq  *%rdx
  8002b5:	c7 45 ac 10 00 00 00 	movl   $0x10,-0x54(%rbp)
  8002bc:	48 8d 55 ac          	lea    -0x54(%rbp),%rdx
  8002c0:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
  8002c4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8002c7:	48 89 ce             	mov    %rcx,%rsi
  8002ca:	89 c7                	mov    %eax,%edi
  8002cc:	48 b8 ef 2e 80 00 00 	movabs $0x802eef,%rax
  8002d3:	00 00 00 
  8002d6:	ff d0                	callq  *%rax
  8002d8:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8002db:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8002df:	79 16                	jns    8002f7 <umain+0x194>
  8002e1:	48 bf 18 48 80 00 00 	movabs $0x804818,%rdi
  8002e8:	00 00 00 
  8002eb:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8002f2:	00 00 00 
  8002f5:	ff d0                	callq  *%rax
  8002f7:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8002fa:	89 c7                	mov    %eax,%edi
  8002fc:	48 b8 2f 45 80 00 00 	movabs $0x80452f,%rax
  800303:	00 00 00 
  800306:	ff d0                	callq  *%rax
  800308:	48 89 c6             	mov    %rax,%rsi
  80030b:	48 bf 3b 48 80 00 00 	movabs $0x80483b,%rdi
  800312:	00 00 00 
  800315:	b8 00 00 00 00       	mov    $0x0,%eax
  80031a:	48 ba 0a 05 80 00 00 	movabs $0x80050a,%rdx
  800321:	00 00 00 
  800324:	ff d2                	callq  *%rdx
  800326:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800329:	89 c7                	mov    %eax,%edi
  80032b:	48 b8 80 00 80 00 00 	movabs $0x800080,%rax
  800332:	00 00 00 
  800335:	ff d0                	callq  *%rax
  800337:	e9 79 ff ff ff       	jmpq   8002b5 <umain+0x152>

000000000080033c <libmain>:
  80033c:	55                   	push   %rbp
  80033d:	48 89 e5             	mov    %rsp,%rbp
  800340:	48 83 ec 10          	sub    $0x10,%rsp
  800344:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800347:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80034b:	48 b8 51 19 80 00 00 	movabs $0x801951,%rax
  800352:	00 00 00 
  800355:	ff d0                	callq  *%rax
  800357:	25 ff 03 00 00       	and    $0x3ff,%eax
  80035c:	48 98                	cltq   
  80035e:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800365:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80036c:	00 00 00 
  80036f:	48 01 c2             	add    %rax,%rdx
  800372:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  800379:	00 00 00 
  80037c:	48 89 10             	mov    %rdx,(%rax)
  80037f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800383:	7e 14                	jle    800399 <libmain+0x5d>
  800385:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800389:	48 8b 10             	mov    (%rax),%rdx
  80038c:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  800393:	00 00 00 
  800396:	48 89 10             	mov    %rdx,(%rax)
  800399:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80039d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003a0:	48 89 d6             	mov    %rdx,%rsi
  8003a3:	89 c7                	mov    %eax,%edi
  8003a5:	48 b8 63 01 80 00 00 	movabs $0x800163,%rax
  8003ac:	00 00 00 
  8003af:	ff d0                	callq  *%rax
  8003b1:	48 b8 c0 03 80 00 00 	movabs $0x8003c0,%rax
  8003b8:	00 00 00 
  8003bb:	ff d0                	callq  *%rax
  8003bd:	90                   	nop
  8003be:	c9                   	leaveq 
  8003bf:	c3                   	retq   

00000000008003c0 <exit>:
  8003c0:	55                   	push   %rbp
  8003c1:	48 89 e5             	mov    %rsp,%rbp
  8003c4:	48 b8 09 21 80 00 00 	movabs $0x802109,%rax
  8003cb:	00 00 00 
  8003ce:	ff d0                	callq  *%rax
  8003d0:	bf 00 00 00 00       	mov    $0x0,%edi
  8003d5:	48 b8 0b 19 80 00 00 	movabs $0x80190b,%rax
  8003dc:	00 00 00 
  8003df:	ff d0                	callq  *%rax
  8003e1:	90                   	nop
  8003e2:	5d                   	pop    %rbp
  8003e3:	c3                   	retq   

00000000008003e4 <putch>:
  8003e4:	55                   	push   %rbp
  8003e5:	48 89 e5             	mov    %rsp,%rbp
  8003e8:	48 83 ec 10          	sub    $0x10,%rsp
  8003ec:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8003ef:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8003f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003f7:	8b 00                	mov    (%rax),%eax
  8003f9:	8d 48 01             	lea    0x1(%rax),%ecx
  8003fc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800400:	89 0a                	mov    %ecx,(%rdx)
  800402:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800405:	89 d1                	mov    %edx,%ecx
  800407:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80040b:	48 98                	cltq   
  80040d:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800411:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800415:	8b 00                	mov    (%rax),%eax
  800417:	3d ff 00 00 00       	cmp    $0xff,%eax
  80041c:	75 2c                	jne    80044a <putch+0x66>
  80041e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800422:	8b 00                	mov    (%rax),%eax
  800424:	48 98                	cltq   
  800426:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80042a:	48 83 c2 08          	add    $0x8,%rdx
  80042e:	48 89 c6             	mov    %rax,%rsi
  800431:	48 89 d7             	mov    %rdx,%rdi
  800434:	48 b8 82 18 80 00 00 	movabs $0x801882,%rax
  80043b:	00 00 00 
  80043e:	ff d0                	callq  *%rax
  800440:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800444:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80044a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80044e:	8b 40 04             	mov    0x4(%rax),%eax
  800451:	8d 50 01             	lea    0x1(%rax),%edx
  800454:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800458:	89 50 04             	mov    %edx,0x4(%rax)
  80045b:	90                   	nop
  80045c:	c9                   	leaveq 
  80045d:	c3                   	retq   

000000000080045e <vcprintf>:
  80045e:	55                   	push   %rbp
  80045f:	48 89 e5             	mov    %rsp,%rbp
  800462:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800469:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800470:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800477:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  80047e:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800485:	48 8b 0a             	mov    (%rdx),%rcx
  800488:	48 89 08             	mov    %rcx,(%rax)
  80048b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80048f:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800493:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800497:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80049b:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8004a2:	00 00 00 
  8004a5:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8004ac:	00 00 00 
  8004af:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8004b6:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8004bd:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8004c4:	48 89 c6             	mov    %rax,%rsi
  8004c7:	48 bf e4 03 80 00 00 	movabs $0x8003e4,%rdi
  8004ce:	00 00 00 
  8004d1:	48 b8 a8 08 80 00 00 	movabs $0x8008a8,%rax
  8004d8:	00 00 00 
  8004db:	ff d0                	callq  *%rax
  8004dd:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8004e3:	48 98                	cltq   
  8004e5:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8004ec:	48 83 c2 08          	add    $0x8,%rdx
  8004f0:	48 89 c6             	mov    %rax,%rsi
  8004f3:	48 89 d7             	mov    %rdx,%rdi
  8004f6:	48 b8 82 18 80 00 00 	movabs $0x801882,%rax
  8004fd:	00 00 00 
  800500:	ff d0                	callq  *%rax
  800502:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800508:	c9                   	leaveq 
  800509:	c3                   	retq   

000000000080050a <cprintf>:
  80050a:	55                   	push   %rbp
  80050b:	48 89 e5             	mov    %rsp,%rbp
  80050e:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800515:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80051c:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800523:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80052a:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800531:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800538:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80053f:	84 c0                	test   %al,%al
  800541:	74 20                	je     800563 <cprintf+0x59>
  800543:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800547:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80054b:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80054f:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800553:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800557:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80055b:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80055f:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800563:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80056a:	00 00 00 
  80056d:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800574:	00 00 00 
  800577:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80057b:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800582:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800589:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800590:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800597:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80059e:	48 8b 0a             	mov    (%rdx),%rcx
  8005a1:	48 89 08             	mov    %rcx,(%rax)
  8005a4:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8005a8:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8005ac:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8005b0:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8005b4:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8005bb:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8005c2:	48 89 d6             	mov    %rdx,%rsi
  8005c5:	48 89 c7             	mov    %rax,%rdi
  8005c8:	48 b8 5e 04 80 00 00 	movabs $0x80045e,%rax
  8005cf:	00 00 00 
  8005d2:	ff d0                	callq  *%rax
  8005d4:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8005da:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8005e0:	c9                   	leaveq 
  8005e1:	c3                   	retq   

00000000008005e2 <printnum>:
  8005e2:	55                   	push   %rbp
  8005e3:	48 89 e5             	mov    %rsp,%rbp
  8005e6:	48 83 ec 30          	sub    $0x30,%rsp
  8005ea:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8005ee:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8005f2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8005f6:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  8005f9:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  8005fd:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  800601:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800604:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  800608:	77 54                	ja     80065e <printnum+0x7c>
  80060a:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80060d:	8d 78 ff             	lea    -0x1(%rax),%edi
  800610:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800613:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800617:	ba 00 00 00 00       	mov    $0x0,%edx
  80061c:	48 f7 f6             	div    %rsi
  80061f:	49 89 c2             	mov    %rax,%r10
  800622:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800625:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  800628:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80062c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800630:	41 89 c9             	mov    %ecx,%r9d
  800633:	41 89 f8             	mov    %edi,%r8d
  800636:	89 d1                	mov    %edx,%ecx
  800638:	4c 89 d2             	mov    %r10,%rdx
  80063b:	48 89 c7             	mov    %rax,%rdi
  80063e:	48 b8 e2 05 80 00 00 	movabs $0x8005e2,%rax
  800645:	00 00 00 
  800648:	ff d0                	callq  *%rax
  80064a:	eb 1c                	jmp    800668 <printnum+0x86>
  80064c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800650:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800653:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800657:	48 89 ce             	mov    %rcx,%rsi
  80065a:	89 d7                	mov    %edx,%edi
  80065c:	ff d0                	callq  *%rax
  80065e:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  800662:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  800666:	7f e4                	jg     80064c <printnum+0x6a>
  800668:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80066b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80066f:	ba 00 00 00 00       	mov    $0x0,%edx
  800674:	48 f7 f1             	div    %rcx
  800677:	48 b8 50 4a 80 00 00 	movabs $0x804a50,%rax
  80067e:	00 00 00 
  800681:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  800685:	0f be d0             	movsbl %al,%edx
  800688:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80068c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800690:	48 89 ce             	mov    %rcx,%rsi
  800693:	89 d7                	mov    %edx,%edi
  800695:	ff d0                	callq  *%rax
  800697:	90                   	nop
  800698:	c9                   	leaveq 
  800699:	c3                   	retq   

000000000080069a <getuint>:
  80069a:	55                   	push   %rbp
  80069b:	48 89 e5             	mov    %rsp,%rbp
  80069e:	48 83 ec 20          	sub    $0x20,%rsp
  8006a2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8006a6:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8006a9:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8006ad:	7e 4f                	jle    8006fe <getuint+0x64>
  8006af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006b3:	8b 00                	mov    (%rax),%eax
  8006b5:	83 f8 30             	cmp    $0x30,%eax
  8006b8:	73 24                	jae    8006de <getuint+0x44>
  8006ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006be:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006c6:	8b 00                	mov    (%rax),%eax
  8006c8:	89 c0                	mov    %eax,%eax
  8006ca:	48 01 d0             	add    %rdx,%rax
  8006cd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006d1:	8b 12                	mov    (%rdx),%edx
  8006d3:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006d6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006da:	89 0a                	mov    %ecx,(%rdx)
  8006dc:	eb 14                	jmp    8006f2 <getuint+0x58>
  8006de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006e2:	48 8b 40 08          	mov    0x8(%rax),%rax
  8006e6:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8006ea:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006ee:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006f2:	48 8b 00             	mov    (%rax),%rax
  8006f5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006f9:	e9 9d 00 00 00       	jmpq   80079b <getuint+0x101>
  8006fe:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800702:	74 4c                	je     800750 <getuint+0xb6>
  800704:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800708:	8b 00                	mov    (%rax),%eax
  80070a:	83 f8 30             	cmp    $0x30,%eax
  80070d:	73 24                	jae    800733 <getuint+0x99>
  80070f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800713:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800717:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80071b:	8b 00                	mov    (%rax),%eax
  80071d:	89 c0                	mov    %eax,%eax
  80071f:	48 01 d0             	add    %rdx,%rax
  800722:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800726:	8b 12                	mov    (%rdx),%edx
  800728:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80072b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80072f:	89 0a                	mov    %ecx,(%rdx)
  800731:	eb 14                	jmp    800747 <getuint+0xad>
  800733:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800737:	48 8b 40 08          	mov    0x8(%rax),%rax
  80073b:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80073f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800743:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800747:	48 8b 00             	mov    (%rax),%rax
  80074a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80074e:	eb 4b                	jmp    80079b <getuint+0x101>
  800750:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800754:	8b 00                	mov    (%rax),%eax
  800756:	83 f8 30             	cmp    $0x30,%eax
  800759:	73 24                	jae    80077f <getuint+0xe5>
  80075b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80075f:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800763:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800767:	8b 00                	mov    (%rax),%eax
  800769:	89 c0                	mov    %eax,%eax
  80076b:	48 01 d0             	add    %rdx,%rax
  80076e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800772:	8b 12                	mov    (%rdx),%edx
  800774:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800777:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80077b:	89 0a                	mov    %ecx,(%rdx)
  80077d:	eb 14                	jmp    800793 <getuint+0xf9>
  80077f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800783:	48 8b 40 08          	mov    0x8(%rax),%rax
  800787:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80078b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80078f:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800793:	8b 00                	mov    (%rax),%eax
  800795:	89 c0                	mov    %eax,%eax
  800797:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80079b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80079f:	c9                   	leaveq 
  8007a0:	c3                   	retq   

00000000008007a1 <getint>:
  8007a1:	55                   	push   %rbp
  8007a2:	48 89 e5             	mov    %rsp,%rbp
  8007a5:	48 83 ec 20          	sub    $0x20,%rsp
  8007a9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8007ad:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8007b0:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8007b4:	7e 4f                	jle    800805 <getint+0x64>
  8007b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ba:	8b 00                	mov    (%rax),%eax
  8007bc:	83 f8 30             	cmp    $0x30,%eax
  8007bf:	73 24                	jae    8007e5 <getint+0x44>
  8007c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007c5:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007cd:	8b 00                	mov    (%rax),%eax
  8007cf:	89 c0                	mov    %eax,%eax
  8007d1:	48 01 d0             	add    %rdx,%rax
  8007d4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007d8:	8b 12                	mov    (%rdx),%edx
  8007da:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007dd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007e1:	89 0a                	mov    %ecx,(%rdx)
  8007e3:	eb 14                	jmp    8007f9 <getint+0x58>
  8007e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007e9:	48 8b 40 08          	mov    0x8(%rax),%rax
  8007ed:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8007f1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007f5:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007f9:	48 8b 00             	mov    (%rax),%rax
  8007fc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800800:	e9 9d 00 00 00       	jmpq   8008a2 <getint+0x101>
  800805:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800809:	74 4c                	je     800857 <getint+0xb6>
  80080b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80080f:	8b 00                	mov    (%rax),%eax
  800811:	83 f8 30             	cmp    $0x30,%eax
  800814:	73 24                	jae    80083a <getint+0x99>
  800816:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80081a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80081e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800822:	8b 00                	mov    (%rax),%eax
  800824:	89 c0                	mov    %eax,%eax
  800826:	48 01 d0             	add    %rdx,%rax
  800829:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80082d:	8b 12                	mov    (%rdx),%edx
  80082f:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800832:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800836:	89 0a                	mov    %ecx,(%rdx)
  800838:	eb 14                	jmp    80084e <getint+0xad>
  80083a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80083e:	48 8b 40 08          	mov    0x8(%rax),%rax
  800842:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800846:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80084a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80084e:	48 8b 00             	mov    (%rax),%rax
  800851:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800855:	eb 4b                	jmp    8008a2 <getint+0x101>
  800857:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80085b:	8b 00                	mov    (%rax),%eax
  80085d:	83 f8 30             	cmp    $0x30,%eax
  800860:	73 24                	jae    800886 <getint+0xe5>
  800862:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800866:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80086a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80086e:	8b 00                	mov    (%rax),%eax
  800870:	89 c0                	mov    %eax,%eax
  800872:	48 01 d0             	add    %rdx,%rax
  800875:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800879:	8b 12                	mov    (%rdx),%edx
  80087b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80087e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800882:	89 0a                	mov    %ecx,(%rdx)
  800884:	eb 14                	jmp    80089a <getint+0xf9>
  800886:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80088a:	48 8b 40 08          	mov    0x8(%rax),%rax
  80088e:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800892:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800896:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80089a:	8b 00                	mov    (%rax),%eax
  80089c:	48 98                	cltq   
  80089e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8008a6:	c9                   	leaveq 
  8008a7:	c3                   	retq   

00000000008008a8 <vprintfmt>:
  8008a8:	55                   	push   %rbp
  8008a9:	48 89 e5             	mov    %rsp,%rbp
  8008ac:	41 54                	push   %r12
  8008ae:	53                   	push   %rbx
  8008af:	48 83 ec 60          	sub    $0x60,%rsp
  8008b3:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8008b7:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8008bb:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008bf:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8008c3:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8008c7:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8008cb:	48 8b 0a             	mov    (%rdx),%rcx
  8008ce:	48 89 08             	mov    %rcx,(%rax)
  8008d1:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8008d5:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8008d9:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8008dd:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8008e1:	eb 17                	jmp    8008fa <vprintfmt+0x52>
  8008e3:	85 db                	test   %ebx,%ebx
  8008e5:	0f 84 b9 04 00 00    	je     800da4 <vprintfmt+0x4fc>
  8008eb:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8008ef:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8008f3:	48 89 d6             	mov    %rdx,%rsi
  8008f6:	89 df                	mov    %ebx,%edi
  8008f8:	ff d0                	callq  *%rax
  8008fa:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8008fe:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800902:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800906:	0f b6 00             	movzbl (%rax),%eax
  800909:	0f b6 d8             	movzbl %al,%ebx
  80090c:	83 fb 25             	cmp    $0x25,%ebx
  80090f:	75 d2                	jne    8008e3 <vprintfmt+0x3b>
  800911:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800915:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  80091c:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800923:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80092a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800931:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800935:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800939:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80093d:	0f b6 00             	movzbl (%rax),%eax
  800940:	0f b6 d8             	movzbl %al,%ebx
  800943:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800946:	83 f8 55             	cmp    $0x55,%eax
  800949:	0f 87 22 04 00 00    	ja     800d71 <vprintfmt+0x4c9>
  80094f:	89 c0                	mov    %eax,%eax
  800951:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800958:	00 
  800959:	48 b8 78 4a 80 00 00 	movabs $0x804a78,%rax
  800960:	00 00 00 
  800963:	48 01 d0             	add    %rdx,%rax
  800966:	48 8b 00             	mov    (%rax),%rax
  800969:	ff e0                	jmpq   *%rax
  80096b:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  80096f:	eb c0                	jmp    800931 <vprintfmt+0x89>
  800971:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800975:	eb ba                	jmp    800931 <vprintfmt+0x89>
  800977:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  80097e:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800981:	89 d0                	mov    %edx,%eax
  800983:	c1 e0 02             	shl    $0x2,%eax
  800986:	01 d0                	add    %edx,%eax
  800988:	01 c0                	add    %eax,%eax
  80098a:	01 d8                	add    %ebx,%eax
  80098c:	83 e8 30             	sub    $0x30,%eax
  80098f:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800992:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800996:	0f b6 00             	movzbl (%rax),%eax
  800999:	0f be d8             	movsbl %al,%ebx
  80099c:	83 fb 2f             	cmp    $0x2f,%ebx
  80099f:	7e 60                	jle    800a01 <vprintfmt+0x159>
  8009a1:	83 fb 39             	cmp    $0x39,%ebx
  8009a4:	7f 5b                	jg     800a01 <vprintfmt+0x159>
  8009a6:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8009ab:	eb d1                	jmp    80097e <vprintfmt+0xd6>
  8009ad:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009b0:	83 f8 30             	cmp    $0x30,%eax
  8009b3:	73 17                	jae    8009cc <vprintfmt+0x124>
  8009b5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8009b9:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009bc:	89 d2                	mov    %edx,%edx
  8009be:	48 01 d0             	add    %rdx,%rax
  8009c1:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009c4:	83 c2 08             	add    $0x8,%edx
  8009c7:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8009ca:	eb 0c                	jmp    8009d8 <vprintfmt+0x130>
  8009cc:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8009d0:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8009d4:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8009d8:	8b 00                	mov    (%rax),%eax
  8009da:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8009dd:	eb 23                	jmp    800a02 <vprintfmt+0x15a>
  8009df:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009e3:	0f 89 48 ff ff ff    	jns    800931 <vprintfmt+0x89>
  8009e9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  8009f0:	e9 3c ff ff ff       	jmpq   800931 <vprintfmt+0x89>
  8009f5:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  8009fc:	e9 30 ff ff ff       	jmpq   800931 <vprintfmt+0x89>
  800a01:	90                   	nop
  800a02:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a06:	0f 89 25 ff ff ff    	jns    800931 <vprintfmt+0x89>
  800a0c:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800a0f:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800a12:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a19:	e9 13 ff ff ff       	jmpq   800931 <vprintfmt+0x89>
  800a1e:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800a22:	e9 0a ff ff ff       	jmpq   800931 <vprintfmt+0x89>
  800a27:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a2a:	83 f8 30             	cmp    $0x30,%eax
  800a2d:	73 17                	jae    800a46 <vprintfmt+0x19e>
  800a2f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800a33:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a36:	89 d2                	mov    %edx,%edx
  800a38:	48 01 d0             	add    %rdx,%rax
  800a3b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a3e:	83 c2 08             	add    $0x8,%edx
  800a41:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a44:	eb 0c                	jmp    800a52 <vprintfmt+0x1aa>
  800a46:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800a4a:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800a4e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a52:	8b 10                	mov    (%rax),%edx
  800a54:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800a58:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a5c:	48 89 ce             	mov    %rcx,%rsi
  800a5f:	89 d7                	mov    %edx,%edi
  800a61:	ff d0                	callq  *%rax
  800a63:	e9 37 03 00 00       	jmpq   800d9f <vprintfmt+0x4f7>
  800a68:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a6b:	83 f8 30             	cmp    $0x30,%eax
  800a6e:	73 17                	jae    800a87 <vprintfmt+0x1df>
  800a70:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800a74:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a77:	89 d2                	mov    %edx,%edx
  800a79:	48 01 d0             	add    %rdx,%rax
  800a7c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a7f:	83 c2 08             	add    $0x8,%edx
  800a82:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a85:	eb 0c                	jmp    800a93 <vprintfmt+0x1eb>
  800a87:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800a8b:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800a8f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a93:	8b 18                	mov    (%rax),%ebx
  800a95:	85 db                	test   %ebx,%ebx
  800a97:	79 02                	jns    800a9b <vprintfmt+0x1f3>
  800a99:	f7 db                	neg    %ebx
  800a9b:	83 fb 15             	cmp    $0x15,%ebx
  800a9e:	7f 16                	jg     800ab6 <vprintfmt+0x20e>
  800aa0:	48 b8 a0 49 80 00 00 	movabs $0x8049a0,%rax
  800aa7:	00 00 00 
  800aaa:	48 63 d3             	movslq %ebx,%rdx
  800aad:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800ab1:	4d 85 e4             	test   %r12,%r12
  800ab4:	75 2e                	jne    800ae4 <vprintfmt+0x23c>
  800ab6:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800aba:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800abe:	89 d9                	mov    %ebx,%ecx
  800ac0:	48 ba 61 4a 80 00 00 	movabs $0x804a61,%rdx
  800ac7:	00 00 00 
  800aca:	48 89 c7             	mov    %rax,%rdi
  800acd:	b8 00 00 00 00       	mov    $0x0,%eax
  800ad2:	49 b8 ae 0d 80 00 00 	movabs $0x800dae,%r8
  800ad9:	00 00 00 
  800adc:	41 ff d0             	callq  *%r8
  800adf:	e9 bb 02 00 00       	jmpq   800d9f <vprintfmt+0x4f7>
  800ae4:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800ae8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800aec:	4c 89 e1             	mov    %r12,%rcx
  800aef:	48 ba 6a 4a 80 00 00 	movabs $0x804a6a,%rdx
  800af6:	00 00 00 
  800af9:	48 89 c7             	mov    %rax,%rdi
  800afc:	b8 00 00 00 00       	mov    $0x0,%eax
  800b01:	49 b8 ae 0d 80 00 00 	movabs $0x800dae,%r8
  800b08:	00 00 00 
  800b0b:	41 ff d0             	callq  *%r8
  800b0e:	e9 8c 02 00 00       	jmpq   800d9f <vprintfmt+0x4f7>
  800b13:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b16:	83 f8 30             	cmp    $0x30,%eax
  800b19:	73 17                	jae    800b32 <vprintfmt+0x28a>
  800b1b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800b1f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b22:	89 d2                	mov    %edx,%edx
  800b24:	48 01 d0             	add    %rdx,%rax
  800b27:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b2a:	83 c2 08             	add    $0x8,%edx
  800b2d:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b30:	eb 0c                	jmp    800b3e <vprintfmt+0x296>
  800b32:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800b36:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800b3a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b3e:	4c 8b 20             	mov    (%rax),%r12
  800b41:	4d 85 e4             	test   %r12,%r12
  800b44:	75 0a                	jne    800b50 <vprintfmt+0x2a8>
  800b46:	49 bc 6d 4a 80 00 00 	movabs $0x804a6d,%r12
  800b4d:	00 00 00 
  800b50:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b54:	7e 78                	jle    800bce <vprintfmt+0x326>
  800b56:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800b5a:	74 72                	je     800bce <vprintfmt+0x326>
  800b5c:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b5f:	48 98                	cltq   
  800b61:	48 89 c6             	mov    %rax,%rsi
  800b64:	4c 89 e7             	mov    %r12,%rdi
  800b67:	48 b8 5c 10 80 00 00 	movabs $0x80105c,%rax
  800b6e:	00 00 00 
  800b71:	ff d0                	callq  *%rax
  800b73:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800b76:	eb 17                	jmp    800b8f <vprintfmt+0x2e7>
  800b78:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800b7c:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b80:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b84:	48 89 ce             	mov    %rcx,%rsi
  800b87:	89 d7                	mov    %edx,%edi
  800b89:	ff d0                	callq  *%rax
  800b8b:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800b8f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b93:	7f e3                	jg     800b78 <vprintfmt+0x2d0>
  800b95:	eb 37                	jmp    800bce <vprintfmt+0x326>
  800b97:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800b9b:	74 1e                	je     800bbb <vprintfmt+0x313>
  800b9d:	83 fb 1f             	cmp    $0x1f,%ebx
  800ba0:	7e 05                	jle    800ba7 <vprintfmt+0x2ff>
  800ba2:	83 fb 7e             	cmp    $0x7e,%ebx
  800ba5:	7e 14                	jle    800bbb <vprintfmt+0x313>
  800ba7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bab:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800baf:	48 89 d6             	mov    %rdx,%rsi
  800bb2:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800bb7:	ff d0                	callq  *%rax
  800bb9:	eb 0f                	jmp    800bca <vprintfmt+0x322>
  800bbb:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bbf:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bc3:	48 89 d6             	mov    %rdx,%rsi
  800bc6:	89 df                	mov    %ebx,%edi
  800bc8:	ff d0                	callq  *%rax
  800bca:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800bce:	4c 89 e0             	mov    %r12,%rax
  800bd1:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800bd5:	0f b6 00             	movzbl (%rax),%eax
  800bd8:	0f be d8             	movsbl %al,%ebx
  800bdb:	85 db                	test   %ebx,%ebx
  800bdd:	74 28                	je     800c07 <vprintfmt+0x35f>
  800bdf:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800be3:	78 b2                	js     800b97 <vprintfmt+0x2ef>
  800be5:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800be9:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800bed:	79 a8                	jns    800b97 <vprintfmt+0x2ef>
  800bef:	eb 16                	jmp    800c07 <vprintfmt+0x35f>
  800bf1:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bf5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bf9:	48 89 d6             	mov    %rdx,%rsi
  800bfc:	bf 20 00 00 00       	mov    $0x20,%edi
  800c01:	ff d0                	callq  *%rax
  800c03:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c07:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c0b:	7f e4                	jg     800bf1 <vprintfmt+0x349>
  800c0d:	e9 8d 01 00 00       	jmpq   800d9f <vprintfmt+0x4f7>
  800c12:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c16:	be 03 00 00 00       	mov    $0x3,%esi
  800c1b:	48 89 c7             	mov    %rax,%rdi
  800c1e:	48 b8 a1 07 80 00 00 	movabs $0x8007a1,%rax
  800c25:	00 00 00 
  800c28:	ff d0                	callq  *%rax
  800c2a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c2e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c32:	48 85 c0             	test   %rax,%rax
  800c35:	79 1d                	jns    800c54 <vprintfmt+0x3ac>
  800c37:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c3b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c3f:	48 89 d6             	mov    %rdx,%rsi
  800c42:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800c47:	ff d0                	callq  *%rax
  800c49:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c4d:	48 f7 d8             	neg    %rax
  800c50:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c54:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c5b:	e9 d2 00 00 00       	jmpq   800d32 <vprintfmt+0x48a>
  800c60:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c64:	be 03 00 00 00       	mov    $0x3,%esi
  800c69:	48 89 c7             	mov    %rax,%rdi
  800c6c:	48 b8 9a 06 80 00 00 	movabs $0x80069a,%rax
  800c73:	00 00 00 
  800c76:	ff d0                	callq  *%rax
  800c78:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c7c:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c83:	e9 aa 00 00 00       	jmpq   800d32 <vprintfmt+0x48a>
  800c88:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c8c:	be 03 00 00 00       	mov    $0x3,%esi
  800c91:	48 89 c7             	mov    %rax,%rdi
  800c94:	48 b8 9a 06 80 00 00 	movabs $0x80069a,%rax
  800c9b:	00 00 00 
  800c9e:	ff d0                	callq  *%rax
  800ca0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ca4:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800cab:	e9 82 00 00 00       	jmpq   800d32 <vprintfmt+0x48a>
  800cb0:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cb4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cb8:	48 89 d6             	mov    %rdx,%rsi
  800cbb:	bf 30 00 00 00       	mov    $0x30,%edi
  800cc0:	ff d0                	callq  *%rax
  800cc2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cc6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cca:	48 89 d6             	mov    %rdx,%rsi
  800ccd:	bf 78 00 00 00       	mov    $0x78,%edi
  800cd2:	ff d0                	callq  *%rax
  800cd4:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800cd7:	83 f8 30             	cmp    $0x30,%eax
  800cda:	73 17                	jae    800cf3 <vprintfmt+0x44b>
  800cdc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ce0:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ce3:	89 d2                	mov    %edx,%edx
  800ce5:	48 01 d0             	add    %rdx,%rax
  800ce8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ceb:	83 c2 08             	add    $0x8,%edx
  800cee:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800cf1:	eb 0c                	jmp    800cff <vprintfmt+0x457>
  800cf3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800cf7:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800cfb:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800cff:	48 8b 00             	mov    (%rax),%rax
  800d02:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d06:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d0d:	eb 23                	jmp    800d32 <vprintfmt+0x48a>
  800d0f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d13:	be 03 00 00 00       	mov    $0x3,%esi
  800d18:	48 89 c7             	mov    %rax,%rdi
  800d1b:	48 b8 9a 06 80 00 00 	movabs $0x80069a,%rax
  800d22:	00 00 00 
  800d25:	ff d0                	callq  *%rax
  800d27:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d2b:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d32:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800d37:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800d3a:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800d3d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d41:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800d45:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d49:	45 89 c1             	mov    %r8d,%r9d
  800d4c:	41 89 f8             	mov    %edi,%r8d
  800d4f:	48 89 c7             	mov    %rax,%rdi
  800d52:	48 b8 e2 05 80 00 00 	movabs $0x8005e2,%rax
  800d59:	00 00 00 
  800d5c:	ff d0                	callq  *%rax
  800d5e:	eb 3f                	jmp    800d9f <vprintfmt+0x4f7>
  800d60:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d64:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d68:	48 89 d6             	mov    %rdx,%rsi
  800d6b:	89 df                	mov    %ebx,%edi
  800d6d:	ff d0                	callq  *%rax
  800d6f:	eb 2e                	jmp    800d9f <vprintfmt+0x4f7>
  800d71:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d75:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d79:	48 89 d6             	mov    %rdx,%rsi
  800d7c:	bf 25 00 00 00       	mov    $0x25,%edi
  800d81:	ff d0                	callq  *%rax
  800d83:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d88:	eb 05                	jmp    800d8f <vprintfmt+0x4e7>
  800d8a:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d8f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800d93:	48 83 e8 01          	sub    $0x1,%rax
  800d97:	0f b6 00             	movzbl (%rax),%eax
  800d9a:	3c 25                	cmp    $0x25,%al
  800d9c:	75 ec                	jne    800d8a <vprintfmt+0x4e2>
  800d9e:	90                   	nop
  800d9f:	e9 3d fb ff ff       	jmpq   8008e1 <vprintfmt+0x39>
  800da4:	90                   	nop
  800da5:	48 83 c4 60          	add    $0x60,%rsp
  800da9:	5b                   	pop    %rbx
  800daa:	41 5c                	pop    %r12
  800dac:	5d                   	pop    %rbp
  800dad:	c3                   	retq   

0000000000800dae <printfmt>:
  800dae:	55                   	push   %rbp
  800daf:	48 89 e5             	mov    %rsp,%rbp
  800db2:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800db9:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800dc0:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800dc7:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800dce:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800dd5:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800ddc:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800de3:	84 c0                	test   %al,%al
  800de5:	74 20                	je     800e07 <printfmt+0x59>
  800de7:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800deb:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800def:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800df3:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800df7:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800dfb:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800dff:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800e03:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800e07:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800e0e:	00 00 00 
  800e11:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800e18:	00 00 00 
  800e1b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800e1f:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800e26:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800e2d:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800e34:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800e3b:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800e42:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800e49:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800e50:	48 89 c7             	mov    %rax,%rdi
  800e53:	48 b8 a8 08 80 00 00 	movabs $0x8008a8,%rax
  800e5a:	00 00 00 
  800e5d:	ff d0                	callq  *%rax
  800e5f:	90                   	nop
  800e60:	c9                   	leaveq 
  800e61:	c3                   	retq   

0000000000800e62 <sprintputch>:
  800e62:	55                   	push   %rbp
  800e63:	48 89 e5             	mov    %rsp,%rbp
  800e66:	48 83 ec 10          	sub    $0x10,%rsp
  800e6a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800e6d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800e71:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e75:	8b 40 10             	mov    0x10(%rax),%eax
  800e78:	8d 50 01             	lea    0x1(%rax),%edx
  800e7b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e7f:	89 50 10             	mov    %edx,0x10(%rax)
  800e82:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e86:	48 8b 10             	mov    (%rax),%rdx
  800e89:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e8d:	48 8b 40 08          	mov    0x8(%rax),%rax
  800e91:	48 39 c2             	cmp    %rax,%rdx
  800e94:	73 17                	jae    800ead <sprintputch+0x4b>
  800e96:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e9a:	48 8b 00             	mov    (%rax),%rax
  800e9d:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800ea1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800ea5:	48 89 0a             	mov    %rcx,(%rdx)
  800ea8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800eab:	88 10                	mov    %dl,(%rax)
  800ead:	90                   	nop
  800eae:	c9                   	leaveq 
  800eaf:	c3                   	retq   

0000000000800eb0 <vsnprintf>:
  800eb0:	55                   	push   %rbp
  800eb1:	48 89 e5             	mov    %rsp,%rbp
  800eb4:	48 83 ec 50          	sub    $0x50,%rsp
  800eb8:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800ebc:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800ebf:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800ec3:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800ec7:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800ecb:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800ecf:	48 8b 0a             	mov    (%rdx),%rcx
  800ed2:	48 89 08             	mov    %rcx,(%rax)
  800ed5:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ed9:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800edd:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800ee1:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800ee5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ee9:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800eed:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800ef0:	48 98                	cltq   
  800ef2:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800ef6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800efa:	48 01 d0             	add    %rdx,%rax
  800efd:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800f01:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800f08:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800f0d:	74 06                	je     800f15 <vsnprintf+0x65>
  800f0f:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800f13:	7f 07                	jg     800f1c <vsnprintf+0x6c>
  800f15:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800f1a:	eb 2f                	jmp    800f4b <vsnprintf+0x9b>
  800f1c:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800f20:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800f24:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800f28:	48 89 c6             	mov    %rax,%rsi
  800f2b:	48 bf 62 0e 80 00 00 	movabs $0x800e62,%rdi
  800f32:	00 00 00 
  800f35:	48 b8 a8 08 80 00 00 	movabs $0x8008a8,%rax
  800f3c:	00 00 00 
  800f3f:	ff d0                	callq  *%rax
  800f41:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800f45:	c6 00 00             	movb   $0x0,(%rax)
  800f48:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800f4b:	c9                   	leaveq 
  800f4c:	c3                   	retq   

0000000000800f4d <snprintf>:
  800f4d:	55                   	push   %rbp
  800f4e:	48 89 e5             	mov    %rsp,%rbp
  800f51:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800f58:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800f5f:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800f65:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800f6c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f73:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f7a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f81:	84 c0                	test   %al,%al
  800f83:	74 20                	je     800fa5 <snprintf+0x58>
  800f85:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f89:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f8d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f91:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f95:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f99:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f9d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800fa1:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800fa5:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800fac:	00 00 00 
  800faf:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800fb6:	00 00 00 
  800fb9:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800fbd:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800fc4:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800fcb:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800fd2:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800fd9:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800fe0:	48 8b 0a             	mov    (%rdx),%rcx
  800fe3:	48 89 08             	mov    %rcx,(%rax)
  800fe6:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800fea:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800fee:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800ff2:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800ff6:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800ffd:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801004:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80100a:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801011:	48 89 c7             	mov    %rax,%rdi
  801014:	48 b8 b0 0e 80 00 00 	movabs $0x800eb0,%rax
  80101b:	00 00 00 
  80101e:	ff d0                	callq  *%rax
  801020:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801026:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80102c:	c9                   	leaveq 
  80102d:	c3                   	retq   

000000000080102e <strlen>:
  80102e:	55                   	push   %rbp
  80102f:	48 89 e5             	mov    %rsp,%rbp
  801032:	48 83 ec 18          	sub    $0x18,%rsp
  801036:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80103a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801041:	eb 09                	jmp    80104c <strlen+0x1e>
  801043:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801047:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80104c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801050:	0f b6 00             	movzbl (%rax),%eax
  801053:	84 c0                	test   %al,%al
  801055:	75 ec                	jne    801043 <strlen+0x15>
  801057:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80105a:	c9                   	leaveq 
  80105b:	c3                   	retq   

000000000080105c <strnlen>:
  80105c:	55                   	push   %rbp
  80105d:	48 89 e5             	mov    %rsp,%rbp
  801060:	48 83 ec 20          	sub    $0x20,%rsp
  801064:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801068:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80106c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801073:	eb 0e                	jmp    801083 <strnlen+0x27>
  801075:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801079:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80107e:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801083:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801088:	74 0b                	je     801095 <strnlen+0x39>
  80108a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80108e:	0f b6 00             	movzbl (%rax),%eax
  801091:	84 c0                	test   %al,%al
  801093:	75 e0                	jne    801075 <strnlen+0x19>
  801095:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801098:	c9                   	leaveq 
  801099:	c3                   	retq   

000000000080109a <strcpy>:
  80109a:	55                   	push   %rbp
  80109b:	48 89 e5             	mov    %rsp,%rbp
  80109e:	48 83 ec 20          	sub    $0x20,%rsp
  8010a2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010a6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010ae:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8010b2:	90                   	nop
  8010b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010b7:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8010bb:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8010bf:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8010c3:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8010c7:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8010cb:	0f b6 12             	movzbl (%rdx),%edx
  8010ce:	88 10                	mov    %dl,(%rax)
  8010d0:	0f b6 00             	movzbl (%rax),%eax
  8010d3:	84 c0                	test   %al,%al
  8010d5:	75 dc                	jne    8010b3 <strcpy+0x19>
  8010d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010db:	c9                   	leaveq 
  8010dc:	c3                   	retq   

00000000008010dd <strcat>:
  8010dd:	55                   	push   %rbp
  8010de:	48 89 e5             	mov    %rsp,%rbp
  8010e1:	48 83 ec 20          	sub    $0x20,%rsp
  8010e5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010e9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010f1:	48 89 c7             	mov    %rax,%rdi
  8010f4:	48 b8 2e 10 80 00 00 	movabs $0x80102e,%rax
  8010fb:	00 00 00 
  8010fe:	ff d0                	callq  *%rax
  801100:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801103:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801106:	48 63 d0             	movslq %eax,%rdx
  801109:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80110d:	48 01 c2             	add    %rax,%rdx
  801110:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801114:	48 89 c6             	mov    %rax,%rsi
  801117:	48 89 d7             	mov    %rdx,%rdi
  80111a:	48 b8 9a 10 80 00 00 	movabs $0x80109a,%rax
  801121:	00 00 00 
  801124:	ff d0                	callq  *%rax
  801126:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80112a:	c9                   	leaveq 
  80112b:	c3                   	retq   

000000000080112c <strncpy>:
  80112c:	55                   	push   %rbp
  80112d:	48 89 e5             	mov    %rsp,%rbp
  801130:	48 83 ec 28          	sub    $0x28,%rsp
  801134:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801138:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80113c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801140:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801144:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801148:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80114f:	00 
  801150:	eb 2a                	jmp    80117c <strncpy+0x50>
  801152:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801156:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80115a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80115e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801162:	0f b6 12             	movzbl (%rdx),%edx
  801165:	88 10                	mov    %dl,(%rax)
  801167:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80116b:	0f b6 00             	movzbl (%rax),%eax
  80116e:	84 c0                	test   %al,%al
  801170:	74 05                	je     801177 <strncpy+0x4b>
  801172:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801177:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80117c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801180:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801184:	72 cc                	jb     801152 <strncpy+0x26>
  801186:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80118a:	c9                   	leaveq 
  80118b:	c3                   	retq   

000000000080118c <strlcpy>:
  80118c:	55                   	push   %rbp
  80118d:	48 89 e5             	mov    %rsp,%rbp
  801190:	48 83 ec 28          	sub    $0x28,%rsp
  801194:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801198:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80119c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8011a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011a4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011a8:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8011ad:	74 3d                	je     8011ec <strlcpy+0x60>
  8011af:	eb 1d                	jmp    8011ce <strlcpy+0x42>
  8011b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011b5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8011b9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8011bd:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8011c1:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8011c5:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8011c9:	0f b6 12             	movzbl (%rdx),%edx
  8011cc:	88 10                	mov    %dl,(%rax)
  8011ce:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8011d3:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8011d8:	74 0b                	je     8011e5 <strlcpy+0x59>
  8011da:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8011de:	0f b6 00             	movzbl (%rax),%eax
  8011e1:	84 c0                	test   %al,%al
  8011e3:	75 cc                	jne    8011b1 <strlcpy+0x25>
  8011e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011e9:	c6 00 00             	movb   $0x0,(%rax)
  8011ec:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011f4:	48 29 c2             	sub    %rax,%rdx
  8011f7:	48 89 d0             	mov    %rdx,%rax
  8011fa:	c9                   	leaveq 
  8011fb:	c3                   	retq   

00000000008011fc <strcmp>:
  8011fc:	55                   	push   %rbp
  8011fd:	48 89 e5             	mov    %rsp,%rbp
  801200:	48 83 ec 10          	sub    $0x10,%rsp
  801204:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801208:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80120c:	eb 0a                	jmp    801218 <strcmp+0x1c>
  80120e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801213:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801218:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80121c:	0f b6 00             	movzbl (%rax),%eax
  80121f:	84 c0                	test   %al,%al
  801221:	74 12                	je     801235 <strcmp+0x39>
  801223:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801227:	0f b6 10             	movzbl (%rax),%edx
  80122a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80122e:	0f b6 00             	movzbl (%rax),%eax
  801231:	38 c2                	cmp    %al,%dl
  801233:	74 d9                	je     80120e <strcmp+0x12>
  801235:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801239:	0f b6 00             	movzbl (%rax),%eax
  80123c:	0f b6 d0             	movzbl %al,%edx
  80123f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801243:	0f b6 00             	movzbl (%rax),%eax
  801246:	0f b6 c0             	movzbl %al,%eax
  801249:	29 c2                	sub    %eax,%edx
  80124b:	89 d0                	mov    %edx,%eax
  80124d:	c9                   	leaveq 
  80124e:	c3                   	retq   

000000000080124f <strncmp>:
  80124f:	55                   	push   %rbp
  801250:	48 89 e5             	mov    %rsp,%rbp
  801253:	48 83 ec 18          	sub    $0x18,%rsp
  801257:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80125b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80125f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801263:	eb 0f                	jmp    801274 <strncmp+0x25>
  801265:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80126a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80126f:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801274:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801279:	74 1d                	je     801298 <strncmp+0x49>
  80127b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80127f:	0f b6 00             	movzbl (%rax),%eax
  801282:	84 c0                	test   %al,%al
  801284:	74 12                	je     801298 <strncmp+0x49>
  801286:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80128a:	0f b6 10             	movzbl (%rax),%edx
  80128d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801291:	0f b6 00             	movzbl (%rax),%eax
  801294:	38 c2                	cmp    %al,%dl
  801296:	74 cd                	je     801265 <strncmp+0x16>
  801298:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80129d:	75 07                	jne    8012a6 <strncmp+0x57>
  80129f:	b8 00 00 00 00       	mov    $0x0,%eax
  8012a4:	eb 18                	jmp    8012be <strncmp+0x6f>
  8012a6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012aa:	0f b6 00             	movzbl (%rax),%eax
  8012ad:	0f b6 d0             	movzbl %al,%edx
  8012b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012b4:	0f b6 00             	movzbl (%rax),%eax
  8012b7:	0f b6 c0             	movzbl %al,%eax
  8012ba:	29 c2                	sub    %eax,%edx
  8012bc:	89 d0                	mov    %edx,%eax
  8012be:	c9                   	leaveq 
  8012bf:	c3                   	retq   

00000000008012c0 <strchr>:
  8012c0:	55                   	push   %rbp
  8012c1:	48 89 e5             	mov    %rsp,%rbp
  8012c4:	48 83 ec 10          	sub    $0x10,%rsp
  8012c8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012cc:	89 f0                	mov    %esi,%eax
  8012ce:	88 45 f4             	mov    %al,-0xc(%rbp)
  8012d1:	eb 17                	jmp    8012ea <strchr+0x2a>
  8012d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012d7:	0f b6 00             	movzbl (%rax),%eax
  8012da:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8012dd:	75 06                	jne    8012e5 <strchr+0x25>
  8012df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012e3:	eb 15                	jmp    8012fa <strchr+0x3a>
  8012e5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012ea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ee:	0f b6 00             	movzbl (%rax),%eax
  8012f1:	84 c0                	test   %al,%al
  8012f3:	75 de                	jne    8012d3 <strchr+0x13>
  8012f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8012fa:	c9                   	leaveq 
  8012fb:	c3                   	retq   

00000000008012fc <strfind>:
  8012fc:	55                   	push   %rbp
  8012fd:	48 89 e5             	mov    %rsp,%rbp
  801300:	48 83 ec 10          	sub    $0x10,%rsp
  801304:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801308:	89 f0                	mov    %esi,%eax
  80130a:	88 45 f4             	mov    %al,-0xc(%rbp)
  80130d:	eb 11                	jmp    801320 <strfind+0x24>
  80130f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801313:	0f b6 00             	movzbl (%rax),%eax
  801316:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801319:	74 12                	je     80132d <strfind+0x31>
  80131b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801320:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801324:	0f b6 00             	movzbl (%rax),%eax
  801327:	84 c0                	test   %al,%al
  801329:	75 e4                	jne    80130f <strfind+0x13>
  80132b:	eb 01                	jmp    80132e <strfind+0x32>
  80132d:	90                   	nop
  80132e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801332:	c9                   	leaveq 
  801333:	c3                   	retq   

0000000000801334 <memset>:
  801334:	55                   	push   %rbp
  801335:	48 89 e5             	mov    %rsp,%rbp
  801338:	48 83 ec 18          	sub    $0x18,%rsp
  80133c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801340:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801343:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801347:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80134c:	75 06                	jne    801354 <memset+0x20>
  80134e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801352:	eb 69                	jmp    8013bd <memset+0x89>
  801354:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801358:	83 e0 03             	and    $0x3,%eax
  80135b:	48 85 c0             	test   %rax,%rax
  80135e:	75 48                	jne    8013a8 <memset+0x74>
  801360:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801364:	83 e0 03             	and    $0x3,%eax
  801367:	48 85 c0             	test   %rax,%rax
  80136a:	75 3c                	jne    8013a8 <memset+0x74>
  80136c:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801373:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801376:	c1 e0 18             	shl    $0x18,%eax
  801379:	89 c2                	mov    %eax,%edx
  80137b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80137e:	c1 e0 10             	shl    $0x10,%eax
  801381:	09 c2                	or     %eax,%edx
  801383:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801386:	c1 e0 08             	shl    $0x8,%eax
  801389:	09 d0                	or     %edx,%eax
  80138b:	09 45 f4             	or     %eax,-0xc(%rbp)
  80138e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801392:	48 c1 e8 02          	shr    $0x2,%rax
  801396:	48 89 c1             	mov    %rax,%rcx
  801399:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80139d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013a0:	48 89 d7             	mov    %rdx,%rdi
  8013a3:	fc                   	cld    
  8013a4:	f3 ab                	rep stos %eax,%es:(%rdi)
  8013a6:	eb 11                	jmp    8013b9 <memset+0x85>
  8013a8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013ac:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013af:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8013b3:	48 89 d7             	mov    %rdx,%rdi
  8013b6:	fc                   	cld    
  8013b7:	f3 aa                	rep stos %al,%es:(%rdi)
  8013b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013bd:	c9                   	leaveq 
  8013be:	c3                   	retq   

00000000008013bf <memmove>:
  8013bf:	55                   	push   %rbp
  8013c0:	48 89 e5             	mov    %rsp,%rbp
  8013c3:	48 83 ec 28          	sub    $0x28,%rsp
  8013c7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013cb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013cf:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013d3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8013d7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013df:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8013e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013e7:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8013eb:	0f 83 88 00 00 00    	jae    801479 <memmove+0xba>
  8013f1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013f5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013f9:	48 01 d0             	add    %rdx,%rax
  8013fc:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801400:	76 77                	jbe    801479 <memmove+0xba>
  801402:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801406:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80140a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80140e:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801412:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801416:	83 e0 03             	and    $0x3,%eax
  801419:	48 85 c0             	test   %rax,%rax
  80141c:	75 3b                	jne    801459 <memmove+0x9a>
  80141e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801422:	83 e0 03             	and    $0x3,%eax
  801425:	48 85 c0             	test   %rax,%rax
  801428:	75 2f                	jne    801459 <memmove+0x9a>
  80142a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80142e:	83 e0 03             	and    $0x3,%eax
  801431:	48 85 c0             	test   %rax,%rax
  801434:	75 23                	jne    801459 <memmove+0x9a>
  801436:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80143a:	48 83 e8 04          	sub    $0x4,%rax
  80143e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801442:	48 83 ea 04          	sub    $0x4,%rdx
  801446:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80144a:	48 c1 e9 02          	shr    $0x2,%rcx
  80144e:	48 89 c7             	mov    %rax,%rdi
  801451:	48 89 d6             	mov    %rdx,%rsi
  801454:	fd                   	std    
  801455:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801457:	eb 1d                	jmp    801476 <memmove+0xb7>
  801459:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80145d:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801461:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801465:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801469:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80146d:	48 89 d7             	mov    %rdx,%rdi
  801470:	48 89 c1             	mov    %rax,%rcx
  801473:	fd                   	std    
  801474:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801476:	fc                   	cld    
  801477:	eb 57                	jmp    8014d0 <memmove+0x111>
  801479:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80147d:	83 e0 03             	and    $0x3,%eax
  801480:	48 85 c0             	test   %rax,%rax
  801483:	75 36                	jne    8014bb <memmove+0xfc>
  801485:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801489:	83 e0 03             	and    $0x3,%eax
  80148c:	48 85 c0             	test   %rax,%rax
  80148f:	75 2a                	jne    8014bb <memmove+0xfc>
  801491:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801495:	83 e0 03             	and    $0x3,%eax
  801498:	48 85 c0             	test   %rax,%rax
  80149b:	75 1e                	jne    8014bb <memmove+0xfc>
  80149d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014a1:	48 c1 e8 02          	shr    $0x2,%rax
  8014a5:	48 89 c1             	mov    %rax,%rcx
  8014a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014ac:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014b0:	48 89 c7             	mov    %rax,%rdi
  8014b3:	48 89 d6             	mov    %rdx,%rsi
  8014b6:	fc                   	cld    
  8014b7:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8014b9:	eb 15                	jmp    8014d0 <memmove+0x111>
  8014bb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014bf:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014c3:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8014c7:	48 89 c7             	mov    %rax,%rdi
  8014ca:	48 89 d6             	mov    %rdx,%rsi
  8014cd:	fc                   	cld    
  8014ce:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8014d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014d4:	c9                   	leaveq 
  8014d5:	c3                   	retq   

00000000008014d6 <memcpy>:
  8014d6:	55                   	push   %rbp
  8014d7:	48 89 e5             	mov    %rsp,%rbp
  8014da:	48 83 ec 18          	sub    $0x18,%rsp
  8014de:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014e2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8014e6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014ea:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8014ee:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8014f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014f6:	48 89 ce             	mov    %rcx,%rsi
  8014f9:	48 89 c7             	mov    %rax,%rdi
  8014fc:	48 b8 bf 13 80 00 00 	movabs $0x8013bf,%rax
  801503:	00 00 00 
  801506:	ff d0                	callq  *%rax
  801508:	c9                   	leaveq 
  801509:	c3                   	retq   

000000000080150a <memcmp>:
  80150a:	55                   	push   %rbp
  80150b:	48 89 e5             	mov    %rsp,%rbp
  80150e:	48 83 ec 28          	sub    $0x28,%rsp
  801512:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801516:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80151a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80151e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801522:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801526:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80152a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80152e:	eb 36                	jmp    801566 <memcmp+0x5c>
  801530:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801534:	0f b6 10             	movzbl (%rax),%edx
  801537:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80153b:	0f b6 00             	movzbl (%rax),%eax
  80153e:	38 c2                	cmp    %al,%dl
  801540:	74 1a                	je     80155c <memcmp+0x52>
  801542:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801546:	0f b6 00             	movzbl (%rax),%eax
  801549:	0f b6 d0             	movzbl %al,%edx
  80154c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801550:	0f b6 00             	movzbl (%rax),%eax
  801553:	0f b6 c0             	movzbl %al,%eax
  801556:	29 c2                	sub    %eax,%edx
  801558:	89 d0                	mov    %edx,%eax
  80155a:	eb 20                	jmp    80157c <memcmp+0x72>
  80155c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801561:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801566:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80156a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80156e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801572:	48 85 c0             	test   %rax,%rax
  801575:	75 b9                	jne    801530 <memcmp+0x26>
  801577:	b8 00 00 00 00       	mov    $0x0,%eax
  80157c:	c9                   	leaveq 
  80157d:	c3                   	retq   

000000000080157e <memfind>:
  80157e:	55                   	push   %rbp
  80157f:	48 89 e5             	mov    %rsp,%rbp
  801582:	48 83 ec 28          	sub    $0x28,%rsp
  801586:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80158a:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80158d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801591:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801595:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801599:	48 01 d0             	add    %rdx,%rax
  80159c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8015a0:	eb 13                	jmp    8015b5 <memfind+0x37>
  8015a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015a6:	0f b6 00             	movzbl (%rax),%eax
  8015a9:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8015ac:	38 d0                	cmp    %dl,%al
  8015ae:	74 11                	je     8015c1 <memfind+0x43>
  8015b0:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8015b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015b9:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8015bd:	72 e3                	jb     8015a2 <memfind+0x24>
  8015bf:	eb 01                	jmp    8015c2 <memfind+0x44>
  8015c1:	90                   	nop
  8015c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015c6:	c9                   	leaveq 
  8015c7:	c3                   	retq   

00000000008015c8 <strtol>:
  8015c8:	55                   	push   %rbp
  8015c9:	48 89 e5             	mov    %rsp,%rbp
  8015cc:	48 83 ec 38          	sub    $0x38,%rsp
  8015d0:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8015d4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8015d8:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8015db:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8015e2:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8015e9:	00 
  8015ea:	eb 05                	jmp    8015f1 <strtol+0x29>
  8015ec:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015f1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015f5:	0f b6 00             	movzbl (%rax),%eax
  8015f8:	3c 20                	cmp    $0x20,%al
  8015fa:	74 f0                	je     8015ec <strtol+0x24>
  8015fc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801600:	0f b6 00             	movzbl (%rax),%eax
  801603:	3c 09                	cmp    $0x9,%al
  801605:	74 e5                	je     8015ec <strtol+0x24>
  801607:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80160b:	0f b6 00             	movzbl (%rax),%eax
  80160e:	3c 2b                	cmp    $0x2b,%al
  801610:	75 07                	jne    801619 <strtol+0x51>
  801612:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801617:	eb 17                	jmp    801630 <strtol+0x68>
  801619:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80161d:	0f b6 00             	movzbl (%rax),%eax
  801620:	3c 2d                	cmp    $0x2d,%al
  801622:	75 0c                	jne    801630 <strtol+0x68>
  801624:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801629:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801630:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801634:	74 06                	je     80163c <strtol+0x74>
  801636:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80163a:	75 28                	jne    801664 <strtol+0x9c>
  80163c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801640:	0f b6 00             	movzbl (%rax),%eax
  801643:	3c 30                	cmp    $0x30,%al
  801645:	75 1d                	jne    801664 <strtol+0x9c>
  801647:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80164b:	48 83 c0 01          	add    $0x1,%rax
  80164f:	0f b6 00             	movzbl (%rax),%eax
  801652:	3c 78                	cmp    $0x78,%al
  801654:	75 0e                	jne    801664 <strtol+0x9c>
  801656:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  80165b:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801662:	eb 2c                	jmp    801690 <strtol+0xc8>
  801664:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801668:	75 19                	jne    801683 <strtol+0xbb>
  80166a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80166e:	0f b6 00             	movzbl (%rax),%eax
  801671:	3c 30                	cmp    $0x30,%al
  801673:	75 0e                	jne    801683 <strtol+0xbb>
  801675:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80167a:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801681:	eb 0d                	jmp    801690 <strtol+0xc8>
  801683:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801687:	75 07                	jne    801690 <strtol+0xc8>
  801689:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801690:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801694:	0f b6 00             	movzbl (%rax),%eax
  801697:	3c 2f                	cmp    $0x2f,%al
  801699:	7e 1d                	jle    8016b8 <strtol+0xf0>
  80169b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80169f:	0f b6 00             	movzbl (%rax),%eax
  8016a2:	3c 39                	cmp    $0x39,%al
  8016a4:	7f 12                	jg     8016b8 <strtol+0xf0>
  8016a6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016aa:	0f b6 00             	movzbl (%rax),%eax
  8016ad:	0f be c0             	movsbl %al,%eax
  8016b0:	83 e8 30             	sub    $0x30,%eax
  8016b3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016b6:	eb 4e                	jmp    801706 <strtol+0x13e>
  8016b8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016bc:	0f b6 00             	movzbl (%rax),%eax
  8016bf:	3c 60                	cmp    $0x60,%al
  8016c1:	7e 1d                	jle    8016e0 <strtol+0x118>
  8016c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016c7:	0f b6 00             	movzbl (%rax),%eax
  8016ca:	3c 7a                	cmp    $0x7a,%al
  8016cc:	7f 12                	jg     8016e0 <strtol+0x118>
  8016ce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016d2:	0f b6 00             	movzbl (%rax),%eax
  8016d5:	0f be c0             	movsbl %al,%eax
  8016d8:	83 e8 57             	sub    $0x57,%eax
  8016db:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016de:	eb 26                	jmp    801706 <strtol+0x13e>
  8016e0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016e4:	0f b6 00             	movzbl (%rax),%eax
  8016e7:	3c 40                	cmp    $0x40,%al
  8016e9:	7e 47                	jle    801732 <strtol+0x16a>
  8016eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ef:	0f b6 00             	movzbl (%rax),%eax
  8016f2:	3c 5a                	cmp    $0x5a,%al
  8016f4:	7f 3c                	jg     801732 <strtol+0x16a>
  8016f6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016fa:	0f b6 00             	movzbl (%rax),%eax
  8016fd:	0f be c0             	movsbl %al,%eax
  801700:	83 e8 37             	sub    $0x37,%eax
  801703:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801706:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801709:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80170c:	7d 23                	jge    801731 <strtol+0x169>
  80170e:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801713:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801716:	48 98                	cltq   
  801718:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80171d:	48 89 c2             	mov    %rax,%rdx
  801720:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801723:	48 98                	cltq   
  801725:	48 01 d0             	add    %rdx,%rax
  801728:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80172c:	e9 5f ff ff ff       	jmpq   801690 <strtol+0xc8>
  801731:	90                   	nop
  801732:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801737:	74 0b                	je     801744 <strtol+0x17c>
  801739:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80173d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801741:	48 89 10             	mov    %rdx,(%rax)
  801744:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801748:	74 09                	je     801753 <strtol+0x18b>
  80174a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80174e:	48 f7 d8             	neg    %rax
  801751:	eb 04                	jmp    801757 <strtol+0x18f>
  801753:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801757:	c9                   	leaveq 
  801758:	c3                   	retq   

0000000000801759 <strstr>:
  801759:	55                   	push   %rbp
  80175a:	48 89 e5             	mov    %rsp,%rbp
  80175d:	48 83 ec 30          	sub    $0x30,%rsp
  801761:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801765:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801769:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80176d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801771:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801775:	0f b6 00             	movzbl (%rax),%eax
  801778:	88 45 ff             	mov    %al,-0x1(%rbp)
  80177b:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  80177f:	75 06                	jne    801787 <strstr+0x2e>
  801781:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801785:	eb 6b                	jmp    8017f2 <strstr+0x99>
  801787:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80178b:	48 89 c7             	mov    %rax,%rdi
  80178e:	48 b8 2e 10 80 00 00 	movabs $0x80102e,%rax
  801795:	00 00 00 
  801798:	ff d0                	callq  *%rax
  80179a:	48 98                	cltq   
  80179c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8017a0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a4:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8017a8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8017ac:	0f b6 00             	movzbl (%rax),%eax
  8017af:	88 45 ef             	mov    %al,-0x11(%rbp)
  8017b2:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8017b6:	75 07                	jne    8017bf <strstr+0x66>
  8017b8:	b8 00 00 00 00       	mov    $0x0,%eax
  8017bd:	eb 33                	jmp    8017f2 <strstr+0x99>
  8017bf:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8017c3:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8017c6:	75 d8                	jne    8017a0 <strstr+0x47>
  8017c8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8017cc:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8017d0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017d4:	48 89 ce             	mov    %rcx,%rsi
  8017d7:	48 89 c7             	mov    %rax,%rdi
  8017da:	48 b8 4f 12 80 00 00 	movabs $0x80124f,%rax
  8017e1:	00 00 00 
  8017e4:	ff d0                	callq  *%rax
  8017e6:	85 c0                	test   %eax,%eax
  8017e8:	75 b6                	jne    8017a0 <strstr+0x47>
  8017ea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017ee:	48 83 e8 01          	sub    $0x1,%rax
  8017f2:	c9                   	leaveq 
  8017f3:	c3                   	retq   

00000000008017f4 <syscall>:
  8017f4:	55                   	push   %rbp
  8017f5:	48 89 e5             	mov    %rsp,%rbp
  8017f8:	53                   	push   %rbx
  8017f9:	48 83 ec 48          	sub    $0x48,%rsp
  8017fd:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801800:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801803:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801807:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80180b:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  80180f:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801813:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801816:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80181a:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  80181e:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801822:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801826:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80182a:	4c 89 c3             	mov    %r8,%rbx
  80182d:	cd 30                	int    $0x30
  80182f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801833:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801837:	74 3e                	je     801877 <syscall+0x83>
  801839:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80183e:	7e 37                	jle    801877 <syscall+0x83>
  801840:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801844:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801847:	49 89 d0             	mov    %rdx,%r8
  80184a:	89 c1                	mov    %eax,%ecx
  80184c:	48 ba 28 4d 80 00 00 	movabs $0x804d28,%rdx
  801853:	00 00 00 
  801856:	be 24 00 00 00       	mov    $0x24,%esi
  80185b:	48 bf 45 4d 80 00 00 	movabs $0x804d45,%rdi
  801862:	00 00 00 
  801865:	b8 00 00 00 00       	mov    $0x0,%eax
  80186a:	49 b9 74 3e 80 00 00 	movabs $0x803e74,%r9
  801871:	00 00 00 
  801874:	41 ff d1             	callq  *%r9
  801877:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80187b:	48 83 c4 48          	add    $0x48,%rsp
  80187f:	5b                   	pop    %rbx
  801880:	5d                   	pop    %rbp
  801881:	c3                   	retq   

0000000000801882 <sys_cputs>:
  801882:	55                   	push   %rbp
  801883:	48 89 e5             	mov    %rsp,%rbp
  801886:	48 83 ec 10          	sub    $0x10,%rsp
  80188a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80188e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801892:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801896:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80189a:	48 83 ec 08          	sub    $0x8,%rsp
  80189e:	6a 00                	pushq  $0x0
  8018a0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018a6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018ac:	48 89 d1             	mov    %rdx,%rcx
  8018af:	48 89 c2             	mov    %rax,%rdx
  8018b2:	be 00 00 00 00       	mov    $0x0,%esi
  8018b7:	bf 00 00 00 00       	mov    $0x0,%edi
  8018bc:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  8018c3:	00 00 00 
  8018c6:	ff d0                	callq  *%rax
  8018c8:	48 83 c4 10          	add    $0x10,%rsp
  8018cc:	90                   	nop
  8018cd:	c9                   	leaveq 
  8018ce:	c3                   	retq   

00000000008018cf <sys_cgetc>:
  8018cf:	55                   	push   %rbp
  8018d0:	48 89 e5             	mov    %rsp,%rbp
  8018d3:	48 83 ec 08          	sub    $0x8,%rsp
  8018d7:	6a 00                	pushq  $0x0
  8018d9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018df:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018e5:	b9 00 00 00 00       	mov    $0x0,%ecx
  8018ea:	ba 00 00 00 00       	mov    $0x0,%edx
  8018ef:	be 00 00 00 00       	mov    $0x0,%esi
  8018f4:	bf 01 00 00 00       	mov    $0x1,%edi
  8018f9:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  801900:	00 00 00 
  801903:	ff d0                	callq  *%rax
  801905:	48 83 c4 10          	add    $0x10,%rsp
  801909:	c9                   	leaveq 
  80190a:	c3                   	retq   

000000000080190b <sys_env_destroy>:
  80190b:	55                   	push   %rbp
  80190c:	48 89 e5             	mov    %rsp,%rbp
  80190f:	48 83 ec 10          	sub    $0x10,%rsp
  801913:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801916:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801919:	48 98                	cltq   
  80191b:	48 83 ec 08          	sub    $0x8,%rsp
  80191f:	6a 00                	pushq  $0x0
  801921:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801927:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80192d:	b9 00 00 00 00       	mov    $0x0,%ecx
  801932:	48 89 c2             	mov    %rax,%rdx
  801935:	be 01 00 00 00       	mov    $0x1,%esi
  80193a:	bf 03 00 00 00       	mov    $0x3,%edi
  80193f:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  801946:	00 00 00 
  801949:	ff d0                	callq  *%rax
  80194b:	48 83 c4 10          	add    $0x10,%rsp
  80194f:	c9                   	leaveq 
  801950:	c3                   	retq   

0000000000801951 <sys_getenvid>:
  801951:	55                   	push   %rbp
  801952:	48 89 e5             	mov    %rsp,%rbp
  801955:	48 83 ec 08          	sub    $0x8,%rsp
  801959:	6a 00                	pushq  $0x0
  80195b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801961:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801967:	b9 00 00 00 00       	mov    $0x0,%ecx
  80196c:	ba 00 00 00 00       	mov    $0x0,%edx
  801971:	be 00 00 00 00       	mov    $0x0,%esi
  801976:	bf 02 00 00 00       	mov    $0x2,%edi
  80197b:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  801982:	00 00 00 
  801985:	ff d0                	callq  *%rax
  801987:	48 83 c4 10          	add    $0x10,%rsp
  80198b:	c9                   	leaveq 
  80198c:	c3                   	retq   

000000000080198d <sys_yield>:
  80198d:	55                   	push   %rbp
  80198e:	48 89 e5             	mov    %rsp,%rbp
  801991:	48 83 ec 08          	sub    $0x8,%rsp
  801995:	6a 00                	pushq  $0x0
  801997:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80199d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019a3:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019a8:	ba 00 00 00 00       	mov    $0x0,%edx
  8019ad:	be 00 00 00 00       	mov    $0x0,%esi
  8019b2:	bf 0b 00 00 00       	mov    $0xb,%edi
  8019b7:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  8019be:	00 00 00 
  8019c1:	ff d0                	callq  *%rax
  8019c3:	48 83 c4 10          	add    $0x10,%rsp
  8019c7:	90                   	nop
  8019c8:	c9                   	leaveq 
  8019c9:	c3                   	retq   

00000000008019ca <sys_page_alloc>:
  8019ca:	55                   	push   %rbp
  8019cb:	48 89 e5             	mov    %rsp,%rbp
  8019ce:	48 83 ec 10          	sub    $0x10,%rsp
  8019d2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019d5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019d9:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8019dc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8019df:	48 63 c8             	movslq %eax,%rcx
  8019e2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019e9:	48 98                	cltq   
  8019eb:	48 83 ec 08          	sub    $0x8,%rsp
  8019ef:	6a 00                	pushq  $0x0
  8019f1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019f7:	49 89 c8             	mov    %rcx,%r8
  8019fa:	48 89 d1             	mov    %rdx,%rcx
  8019fd:	48 89 c2             	mov    %rax,%rdx
  801a00:	be 01 00 00 00       	mov    $0x1,%esi
  801a05:	bf 04 00 00 00       	mov    $0x4,%edi
  801a0a:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  801a11:	00 00 00 
  801a14:	ff d0                	callq  *%rax
  801a16:	48 83 c4 10          	add    $0x10,%rsp
  801a1a:	c9                   	leaveq 
  801a1b:	c3                   	retq   

0000000000801a1c <sys_page_map>:
  801a1c:	55                   	push   %rbp
  801a1d:	48 89 e5             	mov    %rsp,%rbp
  801a20:	48 83 ec 20          	sub    $0x20,%rsp
  801a24:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a27:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a2b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a2e:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801a32:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801a36:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801a39:	48 63 c8             	movslq %eax,%rcx
  801a3c:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801a40:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a43:	48 63 f0             	movslq %eax,%rsi
  801a46:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a4a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a4d:	48 98                	cltq   
  801a4f:	48 83 ec 08          	sub    $0x8,%rsp
  801a53:	51                   	push   %rcx
  801a54:	49 89 f9             	mov    %rdi,%r9
  801a57:	49 89 f0             	mov    %rsi,%r8
  801a5a:	48 89 d1             	mov    %rdx,%rcx
  801a5d:	48 89 c2             	mov    %rax,%rdx
  801a60:	be 01 00 00 00       	mov    $0x1,%esi
  801a65:	bf 05 00 00 00       	mov    $0x5,%edi
  801a6a:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  801a71:	00 00 00 
  801a74:	ff d0                	callq  *%rax
  801a76:	48 83 c4 10          	add    $0x10,%rsp
  801a7a:	c9                   	leaveq 
  801a7b:	c3                   	retq   

0000000000801a7c <sys_page_unmap>:
  801a7c:	55                   	push   %rbp
  801a7d:	48 89 e5             	mov    %rsp,%rbp
  801a80:	48 83 ec 10          	sub    $0x10,%rsp
  801a84:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a87:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a8b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a8f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a92:	48 98                	cltq   
  801a94:	48 83 ec 08          	sub    $0x8,%rsp
  801a98:	6a 00                	pushq  $0x0
  801a9a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801aa0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801aa6:	48 89 d1             	mov    %rdx,%rcx
  801aa9:	48 89 c2             	mov    %rax,%rdx
  801aac:	be 01 00 00 00       	mov    $0x1,%esi
  801ab1:	bf 06 00 00 00       	mov    $0x6,%edi
  801ab6:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  801abd:	00 00 00 
  801ac0:	ff d0                	callq  *%rax
  801ac2:	48 83 c4 10          	add    $0x10,%rsp
  801ac6:	c9                   	leaveq 
  801ac7:	c3                   	retq   

0000000000801ac8 <sys_env_set_status>:
  801ac8:	55                   	push   %rbp
  801ac9:	48 89 e5             	mov    %rsp,%rbp
  801acc:	48 83 ec 10          	sub    $0x10,%rsp
  801ad0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ad3:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801ad6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ad9:	48 63 d0             	movslq %eax,%rdx
  801adc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801adf:	48 98                	cltq   
  801ae1:	48 83 ec 08          	sub    $0x8,%rsp
  801ae5:	6a 00                	pushq  $0x0
  801ae7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801aed:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801af3:	48 89 d1             	mov    %rdx,%rcx
  801af6:	48 89 c2             	mov    %rax,%rdx
  801af9:	be 01 00 00 00       	mov    $0x1,%esi
  801afe:	bf 08 00 00 00       	mov    $0x8,%edi
  801b03:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  801b0a:	00 00 00 
  801b0d:	ff d0                	callq  *%rax
  801b0f:	48 83 c4 10          	add    $0x10,%rsp
  801b13:	c9                   	leaveq 
  801b14:	c3                   	retq   

0000000000801b15 <sys_env_set_trapframe>:
  801b15:	55                   	push   %rbp
  801b16:	48 89 e5             	mov    %rsp,%rbp
  801b19:	48 83 ec 10          	sub    $0x10,%rsp
  801b1d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b20:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b24:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b28:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b2b:	48 98                	cltq   
  801b2d:	48 83 ec 08          	sub    $0x8,%rsp
  801b31:	6a 00                	pushq  $0x0
  801b33:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b39:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b3f:	48 89 d1             	mov    %rdx,%rcx
  801b42:	48 89 c2             	mov    %rax,%rdx
  801b45:	be 01 00 00 00       	mov    $0x1,%esi
  801b4a:	bf 09 00 00 00       	mov    $0x9,%edi
  801b4f:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  801b56:	00 00 00 
  801b59:	ff d0                	callq  *%rax
  801b5b:	48 83 c4 10          	add    $0x10,%rsp
  801b5f:	c9                   	leaveq 
  801b60:	c3                   	retq   

0000000000801b61 <sys_env_set_pgfault_upcall>:
  801b61:	55                   	push   %rbp
  801b62:	48 89 e5             	mov    %rsp,%rbp
  801b65:	48 83 ec 10          	sub    $0x10,%rsp
  801b69:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b6c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b70:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b74:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b77:	48 98                	cltq   
  801b79:	48 83 ec 08          	sub    $0x8,%rsp
  801b7d:	6a 00                	pushq  $0x0
  801b7f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b85:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b8b:	48 89 d1             	mov    %rdx,%rcx
  801b8e:	48 89 c2             	mov    %rax,%rdx
  801b91:	be 01 00 00 00       	mov    $0x1,%esi
  801b96:	bf 0a 00 00 00       	mov    $0xa,%edi
  801b9b:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  801ba2:	00 00 00 
  801ba5:	ff d0                	callq  *%rax
  801ba7:	48 83 c4 10          	add    $0x10,%rsp
  801bab:	c9                   	leaveq 
  801bac:	c3                   	retq   

0000000000801bad <sys_ipc_try_send>:
  801bad:	55                   	push   %rbp
  801bae:	48 89 e5             	mov    %rsp,%rbp
  801bb1:	48 83 ec 20          	sub    $0x20,%rsp
  801bb5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bb8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bbc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801bc0:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801bc3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801bc6:	48 63 f0             	movslq %eax,%rsi
  801bc9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801bcd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bd0:	48 98                	cltq   
  801bd2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bd6:	48 83 ec 08          	sub    $0x8,%rsp
  801bda:	6a 00                	pushq  $0x0
  801bdc:	49 89 f1             	mov    %rsi,%r9
  801bdf:	49 89 c8             	mov    %rcx,%r8
  801be2:	48 89 d1             	mov    %rdx,%rcx
  801be5:	48 89 c2             	mov    %rax,%rdx
  801be8:	be 00 00 00 00       	mov    $0x0,%esi
  801bed:	bf 0c 00 00 00       	mov    $0xc,%edi
  801bf2:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  801bf9:	00 00 00 
  801bfc:	ff d0                	callq  *%rax
  801bfe:	48 83 c4 10          	add    $0x10,%rsp
  801c02:	c9                   	leaveq 
  801c03:	c3                   	retq   

0000000000801c04 <sys_ipc_recv>:
  801c04:	55                   	push   %rbp
  801c05:	48 89 e5             	mov    %rsp,%rbp
  801c08:	48 83 ec 10          	sub    $0x10,%rsp
  801c0c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c10:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c14:	48 83 ec 08          	sub    $0x8,%rsp
  801c18:	6a 00                	pushq  $0x0
  801c1a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c20:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c26:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c2b:	48 89 c2             	mov    %rax,%rdx
  801c2e:	be 01 00 00 00       	mov    $0x1,%esi
  801c33:	bf 0d 00 00 00       	mov    $0xd,%edi
  801c38:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  801c3f:	00 00 00 
  801c42:	ff d0                	callq  *%rax
  801c44:	48 83 c4 10          	add    $0x10,%rsp
  801c48:	c9                   	leaveq 
  801c49:	c3                   	retq   

0000000000801c4a <sys_time_msec>:
  801c4a:	55                   	push   %rbp
  801c4b:	48 89 e5             	mov    %rsp,%rbp
  801c4e:	48 83 ec 08          	sub    $0x8,%rsp
  801c52:	6a 00                	pushq  $0x0
  801c54:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c5a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c60:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c65:	ba 00 00 00 00       	mov    $0x0,%edx
  801c6a:	be 00 00 00 00       	mov    $0x0,%esi
  801c6f:	bf 0e 00 00 00       	mov    $0xe,%edi
  801c74:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  801c7b:	00 00 00 
  801c7e:	ff d0                	callq  *%rax
  801c80:	48 83 c4 10          	add    $0x10,%rsp
  801c84:	c9                   	leaveq 
  801c85:	c3                   	retq   

0000000000801c86 <sys_net_transmit>:
  801c86:	55                   	push   %rbp
  801c87:	48 89 e5             	mov    %rsp,%rbp
  801c8a:	48 83 ec 10          	sub    $0x10,%rsp
  801c8e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c92:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c95:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c98:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c9c:	48 83 ec 08          	sub    $0x8,%rsp
  801ca0:	6a 00                	pushq  $0x0
  801ca2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ca8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cae:	48 89 d1             	mov    %rdx,%rcx
  801cb1:	48 89 c2             	mov    %rax,%rdx
  801cb4:	be 00 00 00 00       	mov    $0x0,%esi
  801cb9:	bf 0f 00 00 00       	mov    $0xf,%edi
  801cbe:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  801cc5:	00 00 00 
  801cc8:	ff d0                	callq  *%rax
  801cca:	48 83 c4 10          	add    $0x10,%rsp
  801cce:	c9                   	leaveq 
  801ccf:	c3                   	retq   

0000000000801cd0 <sys_net_receive>:
  801cd0:	55                   	push   %rbp
  801cd1:	48 89 e5             	mov    %rsp,%rbp
  801cd4:	48 83 ec 10          	sub    $0x10,%rsp
  801cd8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801cdc:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801cdf:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801ce2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ce6:	48 83 ec 08          	sub    $0x8,%rsp
  801cea:	6a 00                	pushq  $0x0
  801cec:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cf2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cf8:	48 89 d1             	mov    %rdx,%rcx
  801cfb:	48 89 c2             	mov    %rax,%rdx
  801cfe:	be 00 00 00 00       	mov    $0x0,%esi
  801d03:	bf 10 00 00 00       	mov    $0x10,%edi
  801d08:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  801d0f:	00 00 00 
  801d12:	ff d0                	callq  *%rax
  801d14:	48 83 c4 10          	add    $0x10,%rsp
  801d18:	c9                   	leaveq 
  801d19:	c3                   	retq   

0000000000801d1a <sys_ept_map>:
  801d1a:	55                   	push   %rbp
  801d1b:	48 89 e5             	mov    %rsp,%rbp
  801d1e:	48 83 ec 20          	sub    $0x20,%rsp
  801d22:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d25:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d29:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d2c:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801d30:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801d34:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801d37:	48 63 c8             	movslq %eax,%rcx
  801d3a:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801d3e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d41:	48 63 f0             	movslq %eax,%rsi
  801d44:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d48:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d4b:	48 98                	cltq   
  801d4d:	48 83 ec 08          	sub    $0x8,%rsp
  801d51:	51                   	push   %rcx
  801d52:	49 89 f9             	mov    %rdi,%r9
  801d55:	49 89 f0             	mov    %rsi,%r8
  801d58:	48 89 d1             	mov    %rdx,%rcx
  801d5b:	48 89 c2             	mov    %rax,%rdx
  801d5e:	be 00 00 00 00       	mov    $0x0,%esi
  801d63:	bf 11 00 00 00       	mov    $0x11,%edi
  801d68:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  801d6f:	00 00 00 
  801d72:	ff d0                	callq  *%rax
  801d74:	48 83 c4 10          	add    $0x10,%rsp
  801d78:	c9                   	leaveq 
  801d79:	c3                   	retq   

0000000000801d7a <sys_env_mkguest>:
  801d7a:	55                   	push   %rbp
  801d7b:	48 89 e5             	mov    %rsp,%rbp
  801d7e:	48 83 ec 10          	sub    $0x10,%rsp
  801d82:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d86:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d8a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d8e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d92:	48 83 ec 08          	sub    $0x8,%rsp
  801d96:	6a 00                	pushq  $0x0
  801d98:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d9e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801da4:	48 89 d1             	mov    %rdx,%rcx
  801da7:	48 89 c2             	mov    %rax,%rdx
  801daa:	be 00 00 00 00       	mov    $0x0,%esi
  801daf:	bf 12 00 00 00       	mov    $0x12,%edi
  801db4:	48 b8 f4 17 80 00 00 	movabs $0x8017f4,%rax
  801dbb:	00 00 00 
  801dbe:	ff d0                	callq  *%rax
  801dc0:	48 83 c4 10          	add    $0x10,%rsp
  801dc4:	c9                   	leaveq 
  801dc5:	c3                   	retq   

0000000000801dc6 <fd2num>:
  801dc6:	55                   	push   %rbp
  801dc7:	48 89 e5             	mov    %rsp,%rbp
  801dca:	48 83 ec 08          	sub    $0x8,%rsp
  801dce:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801dd2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801dd6:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801ddd:	ff ff ff 
  801de0:	48 01 d0             	add    %rdx,%rax
  801de3:	48 c1 e8 0c          	shr    $0xc,%rax
  801de7:	c9                   	leaveq 
  801de8:	c3                   	retq   

0000000000801de9 <fd2data>:
  801de9:	55                   	push   %rbp
  801dea:	48 89 e5             	mov    %rsp,%rbp
  801ded:	48 83 ec 08          	sub    $0x8,%rsp
  801df1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801df5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801df9:	48 89 c7             	mov    %rax,%rdi
  801dfc:	48 b8 c6 1d 80 00 00 	movabs $0x801dc6,%rax
  801e03:	00 00 00 
  801e06:	ff d0                	callq  *%rax
  801e08:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801e0e:	48 c1 e0 0c          	shl    $0xc,%rax
  801e12:	c9                   	leaveq 
  801e13:	c3                   	retq   

0000000000801e14 <fd_alloc>:
  801e14:	55                   	push   %rbp
  801e15:	48 89 e5             	mov    %rsp,%rbp
  801e18:	48 83 ec 18          	sub    $0x18,%rsp
  801e1c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801e20:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801e27:	eb 6b                	jmp    801e94 <fd_alloc+0x80>
  801e29:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e2c:	48 98                	cltq   
  801e2e:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801e34:	48 c1 e0 0c          	shl    $0xc,%rax
  801e38:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801e3c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e40:	48 c1 e8 15          	shr    $0x15,%rax
  801e44:	48 89 c2             	mov    %rax,%rdx
  801e47:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801e4e:	01 00 00 
  801e51:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801e55:	83 e0 01             	and    $0x1,%eax
  801e58:	48 85 c0             	test   %rax,%rax
  801e5b:	74 21                	je     801e7e <fd_alloc+0x6a>
  801e5d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e61:	48 c1 e8 0c          	shr    $0xc,%rax
  801e65:	48 89 c2             	mov    %rax,%rdx
  801e68:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801e6f:	01 00 00 
  801e72:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801e76:	83 e0 01             	and    $0x1,%eax
  801e79:	48 85 c0             	test   %rax,%rax
  801e7c:	75 12                	jne    801e90 <fd_alloc+0x7c>
  801e7e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e82:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e86:	48 89 10             	mov    %rdx,(%rax)
  801e89:	b8 00 00 00 00       	mov    $0x0,%eax
  801e8e:	eb 1a                	jmp    801eaa <fd_alloc+0x96>
  801e90:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801e94:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801e98:	7e 8f                	jle    801e29 <fd_alloc+0x15>
  801e9a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e9e:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801ea5:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801eaa:	c9                   	leaveq 
  801eab:	c3                   	retq   

0000000000801eac <fd_lookup>:
  801eac:	55                   	push   %rbp
  801ead:	48 89 e5             	mov    %rsp,%rbp
  801eb0:	48 83 ec 20          	sub    $0x20,%rsp
  801eb4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801eb7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801ebb:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801ebf:	78 06                	js     801ec7 <fd_lookup+0x1b>
  801ec1:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801ec5:	7e 07                	jle    801ece <fd_lookup+0x22>
  801ec7:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801ecc:	eb 6c                	jmp    801f3a <fd_lookup+0x8e>
  801ece:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801ed1:	48 98                	cltq   
  801ed3:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801ed9:	48 c1 e0 0c          	shl    $0xc,%rax
  801edd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801ee1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ee5:	48 c1 e8 15          	shr    $0x15,%rax
  801ee9:	48 89 c2             	mov    %rax,%rdx
  801eec:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801ef3:	01 00 00 
  801ef6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801efa:	83 e0 01             	and    $0x1,%eax
  801efd:	48 85 c0             	test   %rax,%rax
  801f00:	74 21                	je     801f23 <fd_lookup+0x77>
  801f02:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f06:	48 c1 e8 0c          	shr    $0xc,%rax
  801f0a:	48 89 c2             	mov    %rax,%rdx
  801f0d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f14:	01 00 00 
  801f17:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f1b:	83 e0 01             	and    $0x1,%eax
  801f1e:	48 85 c0             	test   %rax,%rax
  801f21:	75 07                	jne    801f2a <fd_lookup+0x7e>
  801f23:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801f28:	eb 10                	jmp    801f3a <fd_lookup+0x8e>
  801f2a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f2e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801f32:	48 89 10             	mov    %rdx,(%rax)
  801f35:	b8 00 00 00 00       	mov    $0x0,%eax
  801f3a:	c9                   	leaveq 
  801f3b:	c3                   	retq   

0000000000801f3c <fd_close>:
  801f3c:	55                   	push   %rbp
  801f3d:	48 89 e5             	mov    %rsp,%rbp
  801f40:	48 83 ec 30          	sub    $0x30,%rsp
  801f44:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801f48:	89 f0                	mov    %esi,%eax
  801f4a:	88 45 d4             	mov    %al,-0x2c(%rbp)
  801f4d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f51:	48 89 c7             	mov    %rax,%rdi
  801f54:	48 b8 c6 1d 80 00 00 	movabs $0x801dc6,%rax
  801f5b:	00 00 00 
  801f5e:	ff d0                	callq  *%rax
  801f60:	89 c2                	mov    %eax,%edx
  801f62:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  801f66:	48 89 c6             	mov    %rax,%rsi
  801f69:	89 d7                	mov    %edx,%edi
  801f6b:	48 b8 ac 1e 80 00 00 	movabs $0x801eac,%rax
  801f72:	00 00 00 
  801f75:	ff d0                	callq  *%rax
  801f77:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801f7a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801f7e:	78 0a                	js     801f8a <fd_close+0x4e>
  801f80:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f84:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  801f88:	74 12                	je     801f9c <fd_close+0x60>
  801f8a:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  801f8e:	74 05                	je     801f95 <fd_close+0x59>
  801f90:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f93:	eb 70                	jmp    802005 <fd_close+0xc9>
  801f95:	b8 00 00 00 00       	mov    $0x0,%eax
  801f9a:	eb 69                	jmp    802005 <fd_close+0xc9>
  801f9c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fa0:	8b 00                	mov    (%rax),%eax
  801fa2:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  801fa6:	48 89 d6             	mov    %rdx,%rsi
  801fa9:	89 c7                	mov    %eax,%edi
  801fab:	48 b8 07 20 80 00 00 	movabs $0x802007,%rax
  801fb2:	00 00 00 
  801fb5:	ff d0                	callq  *%rax
  801fb7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801fba:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801fbe:	78 2a                	js     801fea <fd_close+0xae>
  801fc0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fc4:	48 8b 40 20          	mov    0x20(%rax),%rax
  801fc8:	48 85 c0             	test   %rax,%rax
  801fcb:	74 16                	je     801fe3 <fd_close+0xa7>
  801fcd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fd1:	48 8b 40 20          	mov    0x20(%rax),%rax
  801fd5:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801fd9:	48 89 d7             	mov    %rdx,%rdi
  801fdc:	ff d0                	callq  *%rax
  801fde:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801fe1:	eb 07                	jmp    801fea <fd_close+0xae>
  801fe3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801fea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fee:	48 89 c6             	mov    %rax,%rsi
  801ff1:	bf 00 00 00 00       	mov    $0x0,%edi
  801ff6:	48 b8 7c 1a 80 00 00 	movabs $0x801a7c,%rax
  801ffd:	00 00 00 
  802000:	ff d0                	callq  *%rax
  802002:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802005:	c9                   	leaveq 
  802006:	c3                   	retq   

0000000000802007 <dev_lookup>:
  802007:	55                   	push   %rbp
  802008:	48 89 e5             	mov    %rsp,%rbp
  80200b:	48 83 ec 20          	sub    $0x20,%rsp
  80200f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802012:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802016:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80201d:	eb 41                	jmp    802060 <dev_lookup+0x59>
  80201f:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802026:	00 00 00 
  802029:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80202c:	48 63 d2             	movslq %edx,%rdx
  80202f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802033:	8b 00                	mov    (%rax),%eax
  802035:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802038:	75 22                	jne    80205c <dev_lookup+0x55>
  80203a:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802041:	00 00 00 
  802044:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802047:	48 63 d2             	movslq %edx,%rdx
  80204a:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80204e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802052:	48 89 10             	mov    %rdx,(%rax)
  802055:	b8 00 00 00 00       	mov    $0x0,%eax
  80205a:	eb 60                	jmp    8020bc <dev_lookup+0xb5>
  80205c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802060:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802067:	00 00 00 
  80206a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80206d:	48 63 d2             	movslq %edx,%rdx
  802070:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802074:	48 85 c0             	test   %rax,%rax
  802077:	75 a6                	jne    80201f <dev_lookup+0x18>
  802079:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802080:	00 00 00 
  802083:	48 8b 00             	mov    (%rax),%rax
  802086:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80208c:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80208f:	89 c6                	mov    %eax,%esi
  802091:	48 bf 58 4d 80 00 00 	movabs $0x804d58,%rdi
  802098:	00 00 00 
  80209b:	b8 00 00 00 00       	mov    $0x0,%eax
  8020a0:	48 b9 0a 05 80 00 00 	movabs $0x80050a,%rcx
  8020a7:	00 00 00 
  8020aa:	ff d1                	callq  *%rcx
  8020ac:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8020b0:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8020b7:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8020bc:	c9                   	leaveq 
  8020bd:	c3                   	retq   

00000000008020be <close>:
  8020be:	55                   	push   %rbp
  8020bf:	48 89 e5             	mov    %rsp,%rbp
  8020c2:	48 83 ec 20          	sub    $0x20,%rsp
  8020c6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8020c9:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8020cd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8020d0:	48 89 d6             	mov    %rdx,%rsi
  8020d3:	89 c7                	mov    %eax,%edi
  8020d5:	48 b8 ac 1e 80 00 00 	movabs $0x801eac,%rax
  8020dc:	00 00 00 
  8020df:	ff d0                	callq  *%rax
  8020e1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020e4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8020e8:	79 05                	jns    8020ef <close+0x31>
  8020ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020ed:	eb 18                	jmp    802107 <close+0x49>
  8020ef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020f3:	be 01 00 00 00       	mov    $0x1,%esi
  8020f8:	48 89 c7             	mov    %rax,%rdi
  8020fb:	48 b8 3c 1f 80 00 00 	movabs $0x801f3c,%rax
  802102:	00 00 00 
  802105:	ff d0                	callq  *%rax
  802107:	c9                   	leaveq 
  802108:	c3                   	retq   

0000000000802109 <close_all>:
  802109:	55                   	push   %rbp
  80210a:	48 89 e5             	mov    %rsp,%rbp
  80210d:	48 83 ec 10          	sub    $0x10,%rsp
  802111:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802118:	eb 15                	jmp    80212f <close_all+0x26>
  80211a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80211d:	89 c7                	mov    %eax,%edi
  80211f:	48 b8 be 20 80 00 00 	movabs $0x8020be,%rax
  802126:	00 00 00 
  802129:	ff d0                	callq  *%rax
  80212b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80212f:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802133:	7e e5                	jle    80211a <close_all+0x11>
  802135:	90                   	nop
  802136:	c9                   	leaveq 
  802137:	c3                   	retq   

0000000000802138 <dup>:
  802138:	55                   	push   %rbp
  802139:	48 89 e5             	mov    %rsp,%rbp
  80213c:	48 83 ec 40          	sub    $0x40,%rsp
  802140:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802143:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802146:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  80214a:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80214d:	48 89 d6             	mov    %rdx,%rsi
  802150:	89 c7                	mov    %eax,%edi
  802152:	48 b8 ac 1e 80 00 00 	movabs $0x801eac,%rax
  802159:	00 00 00 
  80215c:	ff d0                	callq  *%rax
  80215e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802161:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802165:	79 08                	jns    80216f <dup+0x37>
  802167:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80216a:	e9 70 01 00 00       	jmpq   8022df <dup+0x1a7>
  80216f:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802172:	89 c7                	mov    %eax,%edi
  802174:	48 b8 be 20 80 00 00 	movabs $0x8020be,%rax
  80217b:	00 00 00 
  80217e:	ff d0                	callq  *%rax
  802180:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802183:	48 98                	cltq   
  802185:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80218b:	48 c1 e0 0c          	shl    $0xc,%rax
  80218f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802193:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802197:	48 89 c7             	mov    %rax,%rdi
  80219a:	48 b8 e9 1d 80 00 00 	movabs $0x801de9,%rax
  8021a1:	00 00 00 
  8021a4:	ff d0                	callq  *%rax
  8021a6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8021aa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021ae:	48 89 c7             	mov    %rax,%rdi
  8021b1:	48 b8 e9 1d 80 00 00 	movabs $0x801de9,%rax
  8021b8:	00 00 00 
  8021bb:	ff d0                	callq  *%rax
  8021bd:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8021c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021c5:	48 c1 e8 15          	shr    $0x15,%rax
  8021c9:	48 89 c2             	mov    %rax,%rdx
  8021cc:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8021d3:	01 00 00 
  8021d6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021da:	83 e0 01             	and    $0x1,%eax
  8021dd:	48 85 c0             	test   %rax,%rax
  8021e0:	74 71                	je     802253 <dup+0x11b>
  8021e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021e6:	48 c1 e8 0c          	shr    $0xc,%rax
  8021ea:	48 89 c2             	mov    %rax,%rdx
  8021ed:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8021f4:	01 00 00 
  8021f7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021fb:	83 e0 01             	and    $0x1,%eax
  8021fe:	48 85 c0             	test   %rax,%rax
  802201:	74 50                	je     802253 <dup+0x11b>
  802203:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802207:	48 c1 e8 0c          	shr    $0xc,%rax
  80220b:	48 89 c2             	mov    %rax,%rdx
  80220e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802215:	01 00 00 
  802218:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80221c:	25 07 0e 00 00       	and    $0xe07,%eax
  802221:	89 c1                	mov    %eax,%ecx
  802223:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802227:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80222b:	41 89 c8             	mov    %ecx,%r8d
  80222e:	48 89 d1             	mov    %rdx,%rcx
  802231:	ba 00 00 00 00       	mov    $0x0,%edx
  802236:	48 89 c6             	mov    %rax,%rsi
  802239:	bf 00 00 00 00       	mov    $0x0,%edi
  80223e:	48 b8 1c 1a 80 00 00 	movabs $0x801a1c,%rax
  802245:	00 00 00 
  802248:	ff d0                	callq  *%rax
  80224a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80224d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802251:	78 55                	js     8022a8 <dup+0x170>
  802253:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802257:	48 c1 e8 0c          	shr    $0xc,%rax
  80225b:	48 89 c2             	mov    %rax,%rdx
  80225e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802265:	01 00 00 
  802268:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80226c:	25 07 0e 00 00       	and    $0xe07,%eax
  802271:	89 c1                	mov    %eax,%ecx
  802273:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802277:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80227b:	41 89 c8             	mov    %ecx,%r8d
  80227e:	48 89 d1             	mov    %rdx,%rcx
  802281:	ba 00 00 00 00       	mov    $0x0,%edx
  802286:	48 89 c6             	mov    %rax,%rsi
  802289:	bf 00 00 00 00       	mov    $0x0,%edi
  80228e:	48 b8 1c 1a 80 00 00 	movabs $0x801a1c,%rax
  802295:	00 00 00 
  802298:	ff d0                	callq  *%rax
  80229a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80229d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022a1:	78 08                	js     8022ab <dup+0x173>
  8022a3:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8022a6:	eb 37                	jmp    8022df <dup+0x1a7>
  8022a8:	90                   	nop
  8022a9:	eb 01                	jmp    8022ac <dup+0x174>
  8022ab:	90                   	nop
  8022ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022b0:	48 89 c6             	mov    %rax,%rsi
  8022b3:	bf 00 00 00 00       	mov    $0x0,%edi
  8022b8:	48 b8 7c 1a 80 00 00 	movabs $0x801a7c,%rax
  8022bf:	00 00 00 
  8022c2:	ff d0                	callq  *%rax
  8022c4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8022c8:	48 89 c6             	mov    %rax,%rsi
  8022cb:	bf 00 00 00 00       	mov    $0x0,%edi
  8022d0:	48 b8 7c 1a 80 00 00 	movabs $0x801a7c,%rax
  8022d7:	00 00 00 
  8022da:	ff d0                	callq  *%rax
  8022dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022df:	c9                   	leaveq 
  8022e0:	c3                   	retq   

00000000008022e1 <read>:
  8022e1:	55                   	push   %rbp
  8022e2:	48 89 e5             	mov    %rsp,%rbp
  8022e5:	48 83 ec 40          	sub    $0x40,%rsp
  8022e9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8022ec:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8022f0:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8022f4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8022f8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8022fb:	48 89 d6             	mov    %rdx,%rsi
  8022fe:	89 c7                	mov    %eax,%edi
  802300:	48 b8 ac 1e 80 00 00 	movabs $0x801eac,%rax
  802307:	00 00 00 
  80230a:	ff d0                	callq  *%rax
  80230c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80230f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802313:	78 24                	js     802339 <read+0x58>
  802315:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802319:	8b 00                	mov    (%rax),%eax
  80231b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80231f:	48 89 d6             	mov    %rdx,%rsi
  802322:	89 c7                	mov    %eax,%edi
  802324:	48 b8 07 20 80 00 00 	movabs $0x802007,%rax
  80232b:	00 00 00 
  80232e:	ff d0                	callq  *%rax
  802330:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802333:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802337:	79 05                	jns    80233e <read+0x5d>
  802339:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80233c:	eb 76                	jmp    8023b4 <read+0xd3>
  80233e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802342:	8b 40 08             	mov    0x8(%rax),%eax
  802345:	83 e0 03             	and    $0x3,%eax
  802348:	83 f8 01             	cmp    $0x1,%eax
  80234b:	75 3a                	jne    802387 <read+0xa6>
  80234d:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802354:	00 00 00 
  802357:	48 8b 00             	mov    (%rax),%rax
  80235a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802360:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802363:	89 c6                	mov    %eax,%esi
  802365:	48 bf 77 4d 80 00 00 	movabs $0x804d77,%rdi
  80236c:	00 00 00 
  80236f:	b8 00 00 00 00       	mov    $0x0,%eax
  802374:	48 b9 0a 05 80 00 00 	movabs $0x80050a,%rcx
  80237b:	00 00 00 
  80237e:	ff d1                	callq  *%rcx
  802380:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802385:	eb 2d                	jmp    8023b4 <read+0xd3>
  802387:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80238b:	48 8b 40 10          	mov    0x10(%rax),%rax
  80238f:	48 85 c0             	test   %rax,%rax
  802392:	75 07                	jne    80239b <read+0xba>
  802394:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802399:	eb 19                	jmp    8023b4 <read+0xd3>
  80239b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80239f:	48 8b 40 10          	mov    0x10(%rax),%rax
  8023a3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8023a7:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8023ab:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8023af:	48 89 cf             	mov    %rcx,%rdi
  8023b2:	ff d0                	callq  *%rax
  8023b4:	c9                   	leaveq 
  8023b5:	c3                   	retq   

00000000008023b6 <readn>:
  8023b6:	55                   	push   %rbp
  8023b7:	48 89 e5             	mov    %rsp,%rbp
  8023ba:	48 83 ec 30          	sub    $0x30,%rsp
  8023be:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8023c1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8023c5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8023c9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8023d0:	eb 47                	jmp    802419 <readn+0x63>
  8023d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023d5:	48 98                	cltq   
  8023d7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8023db:	48 29 c2             	sub    %rax,%rdx
  8023de:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023e1:	48 63 c8             	movslq %eax,%rcx
  8023e4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8023e8:	48 01 c1             	add    %rax,%rcx
  8023eb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8023ee:	48 89 ce             	mov    %rcx,%rsi
  8023f1:	89 c7                	mov    %eax,%edi
  8023f3:	48 b8 e1 22 80 00 00 	movabs $0x8022e1,%rax
  8023fa:	00 00 00 
  8023fd:	ff d0                	callq  *%rax
  8023ff:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802402:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802406:	79 05                	jns    80240d <readn+0x57>
  802408:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80240b:	eb 1d                	jmp    80242a <readn+0x74>
  80240d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802411:	74 13                	je     802426 <readn+0x70>
  802413:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802416:	01 45 fc             	add    %eax,-0x4(%rbp)
  802419:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80241c:	48 98                	cltq   
  80241e:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802422:	72 ae                	jb     8023d2 <readn+0x1c>
  802424:	eb 01                	jmp    802427 <readn+0x71>
  802426:	90                   	nop
  802427:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80242a:	c9                   	leaveq 
  80242b:	c3                   	retq   

000000000080242c <write>:
  80242c:	55                   	push   %rbp
  80242d:	48 89 e5             	mov    %rsp,%rbp
  802430:	48 83 ec 40          	sub    $0x40,%rsp
  802434:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802437:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80243b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80243f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802443:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802446:	48 89 d6             	mov    %rdx,%rsi
  802449:	89 c7                	mov    %eax,%edi
  80244b:	48 b8 ac 1e 80 00 00 	movabs $0x801eac,%rax
  802452:	00 00 00 
  802455:	ff d0                	callq  *%rax
  802457:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80245a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80245e:	78 24                	js     802484 <write+0x58>
  802460:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802464:	8b 00                	mov    (%rax),%eax
  802466:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80246a:	48 89 d6             	mov    %rdx,%rsi
  80246d:	89 c7                	mov    %eax,%edi
  80246f:	48 b8 07 20 80 00 00 	movabs $0x802007,%rax
  802476:	00 00 00 
  802479:	ff d0                	callq  *%rax
  80247b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80247e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802482:	79 05                	jns    802489 <write+0x5d>
  802484:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802487:	eb 75                	jmp    8024fe <write+0xd2>
  802489:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80248d:	8b 40 08             	mov    0x8(%rax),%eax
  802490:	83 e0 03             	and    $0x3,%eax
  802493:	85 c0                	test   %eax,%eax
  802495:	75 3a                	jne    8024d1 <write+0xa5>
  802497:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80249e:	00 00 00 
  8024a1:	48 8b 00             	mov    (%rax),%rax
  8024a4:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8024aa:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8024ad:	89 c6                	mov    %eax,%esi
  8024af:	48 bf 93 4d 80 00 00 	movabs $0x804d93,%rdi
  8024b6:	00 00 00 
  8024b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8024be:	48 b9 0a 05 80 00 00 	movabs $0x80050a,%rcx
  8024c5:	00 00 00 
  8024c8:	ff d1                	callq  *%rcx
  8024ca:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8024cf:	eb 2d                	jmp    8024fe <write+0xd2>
  8024d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024d5:	48 8b 40 18          	mov    0x18(%rax),%rax
  8024d9:	48 85 c0             	test   %rax,%rax
  8024dc:	75 07                	jne    8024e5 <write+0xb9>
  8024de:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8024e3:	eb 19                	jmp    8024fe <write+0xd2>
  8024e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024e9:	48 8b 40 18          	mov    0x18(%rax),%rax
  8024ed:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8024f1:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8024f5:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8024f9:	48 89 cf             	mov    %rcx,%rdi
  8024fc:	ff d0                	callq  *%rax
  8024fe:	c9                   	leaveq 
  8024ff:	c3                   	retq   

0000000000802500 <seek>:
  802500:	55                   	push   %rbp
  802501:	48 89 e5             	mov    %rsp,%rbp
  802504:	48 83 ec 18          	sub    $0x18,%rsp
  802508:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80250b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80250e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802512:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802515:	48 89 d6             	mov    %rdx,%rsi
  802518:	89 c7                	mov    %eax,%edi
  80251a:	48 b8 ac 1e 80 00 00 	movabs $0x801eac,%rax
  802521:	00 00 00 
  802524:	ff d0                	callq  *%rax
  802526:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802529:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80252d:	79 05                	jns    802534 <seek+0x34>
  80252f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802532:	eb 0f                	jmp    802543 <seek+0x43>
  802534:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802538:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80253b:	89 50 04             	mov    %edx,0x4(%rax)
  80253e:	b8 00 00 00 00       	mov    $0x0,%eax
  802543:	c9                   	leaveq 
  802544:	c3                   	retq   

0000000000802545 <ftruncate>:
  802545:	55                   	push   %rbp
  802546:	48 89 e5             	mov    %rsp,%rbp
  802549:	48 83 ec 30          	sub    $0x30,%rsp
  80254d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802550:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802553:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802557:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80255a:	48 89 d6             	mov    %rdx,%rsi
  80255d:	89 c7                	mov    %eax,%edi
  80255f:	48 b8 ac 1e 80 00 00 	movabs $0x801eac,%rax
  802566:	00 00 00 
  802569:	ff d0                	callq  *%rax
  80256b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80256e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802572:	78 24                	js     802598 <ftruncate+0x53>
  802574:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802578:	8b 00                	mov    (%rax),%eax
  80257a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80257e:	48 89 d6             	mov    %rdx,%rsi
  802581:	89 c7                	mov    %eax,%edi
  802583:	48 b8 07 20 80 00 00 	movabs $0x802007,%rax
  80258a:	00 00 00 
  80258d:	ff d0                	callq  *%rax
  80258f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802592:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802596:	79 05                	jns    80259d <ftruncate+0x58>
  802598:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80259b:	eb 72                	jmp    80260f <ftruncate+0xca>
  80259d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025a1:	8b 40 08             	mov    0x8(%rax),%eax
  8025a4:	83 e0 03             	and    $0x3,%eax
  8025a7:	85 c0                	test   %eax,%eax
  8025a9:	75 3a                	jne    8025e5 <ftruncate+0xa0>
  8025ab:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  8025b2:	00 00 00 
  8025b5:	48 8b 00             	mov    (%rax),%rax
  8025b8:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8025be:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8025c1:	89 c6                	mov    %eax,%esi
  8025c3:	48 bf b0 4d 80 00 00 	movabs $0x804db0,%rdi
  8025ca:	00 00 00 
  8025cd:	b8 00 00 00 00       	mov    $0x0,%eax
  8025d2:	48 b9 0a 05 80 00 00 	movabs $0x80050a,%rcx
  8025d9:	00 00 00 
  8025dc:	ff d1                	callq  *%rcx
  8025de:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8025e3:	eb 2a                	jmp    80260f <ftruncate+0xca>
  8025e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025e9:	48 8b 40 30          	mov    0x30(%rax),%rax
  8025ed:	48 85 c0             	test   %rax,%rax
  8025f0:	75 07                	jne    8025f9 <ftruncate+0xb4>
  8025f2:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8025f7:	eb 16                	jmp    80260f <ftruncate+0xca>
  8025f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025fd:	48 8b 40 30          	mov    0x30(%rax),%rax
  802601:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802605:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802608:	89 ce                	mov    %ecx,%esi
  80260a:	48 89 d7             	mov    %rdx,%rdi
  80260d:	ff d0                	callq  *%rax
  80260f:	c9                   	leaveq 
  802610:	c3                   	retq   

0000000000802611 <fstat>:
  802611:	55                   	push   %rbp
  802612:	48 89 e5             	mov    %rsp,%rbp
  802615:	48 83 ec 30          	sub    $0x30,%rsp
  802619:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80261c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802620:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802624:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802627:	48 89 d6             	mov    %rdx,%rsi
  80262a:	89 c7                	mov    %eax,%edi
  80262c:	48 b8 ac 1e 80 00 00 	movabs $0x801eac,%rax
  802633:	00 00 00 
  802636:	ff d0                	callq  *%rax
  802638:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80263b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80263f:	78 24                	js     802665 <fstat+0x54>
  802641:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802645:	8b 00                	mov    (%rax),%eax
  802647:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80264b:	48 89 d6             	mov    %rdx,%rsi
  80264e:	89 c7                	mov    %eax,%edi
  802650:	48 b8 07 20 80 00 00 	movabs $0x802007,%rax
  802657:	00 00 00 
  80265a:	ff d0                	callq  *%rax
  80265c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80265f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802663:	79 05                	jns    80266a <fstat+0x59>
  802665:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802668:	eb 5e                	jmp    8026c8 <fstat+0xb7>
  80266a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80266e:	48 8b 40 28          	mov    0x28(%rax),%rax
  802672:	48 85 c0             	test   %rax,%rax
  802675:	75 07                	jne    80267e <fstat+0x6d>
  802677:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80267c:	eb 4a                	jmp    8026c8 <fstat+0xb7>
  80267e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802682:	c6 00 00             	movb   $0x0,(%rax)
  802685:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802689:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802690:	00 00 00 
  802693:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802697:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80269e:	00 00 00 
  8026a1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8026a5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8026a9:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8026b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026b4:	48 8b 40 28          	mov    0x28(%rax),%rax
  8026b8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8026bc:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8026c0:	48 89 ce             	mov    %rcx,%rsi
  8026c3:	48 89 d7             	mov    %rdx,%rdi
  8026c6:	ff d0                	callq  *%rax
  8026c8:	c9                   	leaveq 
  8026c9:	c3                   	retq   

00000000008026ca <stat>:
  8026ca:	55                   	push   %rbp
  8026cb:	48 89 e5             	mov    %rsp,%rbp
  8026ce:	48 83 ec 20          	sub    $0x20,%rsp
  8026d2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8026d6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8026da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026de:	be 00 00 00 00       	mov    $0x0,%esi
  8026e3:	48 89 c7             	mov    %rax,%rdi
  8026e6:	48 b8 ba 27 80 00 00 	movabs $0x8027ba,%rax
  8026ed:	00 00 00 
  8026f0:	ff d0                	callq  *%rax
  8026f2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026f5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026f9:	79 05                	jns    802700 <stat+0x36>
  8026fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026fe:	eb 2f                	jmp    80272f <stat+0x65>
  802700:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802704:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802707:	48 89 d6             	mov    %rdx,%rsi
  80270a:	89 c7                	mov    %eax,%edi
  80270c:	48 b8 11 26 80 00 00 	movabs $0x802611,%rax
  802713:	00 00 00 
  802716:	ff d0                	callq  *%rax
  802718:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80271b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80271e:	89 c7                	mov    %eax,%edi
  802720:	48 b8 be 20 80 00 00 	movabs $0x8020be,%rax
  802727:	00 00 00 
  80272a:	ff d0                	callq  *%rax
  80272c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80272f:	c9                   	leaveq 
  802730:	c3                   	retq   

0000000000802731 <fsipc>:
  802731:	55                   	push   %rbp
  802732:	48 89 e5             	mov    %rsp,%rbp
  802735:	48 83 ec 10          	sub    $0x10,%rsp
  802739:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80273c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802740:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  802747:	00 00 00 
  80274a:	8b 00                	mov    (%rax),%eax
  80274c:	85 c0                	test   %eax,%eax
  80274e:	75 1f                	jne    80276f <fsipc+0x3e>
  802750:	bf 01 00 00 00       	mov    $0x1,%edi
  802755:	48 b8 53 41 80 00 00 	movabs $0x804153,%rax
  80275c:	00 00 00 
  80275f:	ff d0                	callq  *%rax
  802761:	89 c2                	mov    %eax,%edx
  802763:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80276a:	00 00 00 
  80276d:	89 10                	mov    %edx,(%rax)
  80276f:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  802776:	00 00 00 
  802779:	8b 00                	mov    (%rax),%eax
  80277b:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80277e:	b9 07 00 00 00       	mov    $0x7,%ecx
  802783:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  80278a:	00 00 00 
  80278d:	89 c7                	mov    %eax,%edi
  80278f:	48 b8 49 40 80 00 00 	movabs $0x804049,%rax
  802796:	00 00 00 
  802799:	ff d0                	callq  *%rax
  80279b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80279f:	ba 00 00 00 00       	mov    $0x0,%edx
  8027a4:	48 89 c6             	mov    %rax,%rsi
  8027a7:	bf 00 00 00 00       	mov    $0x0,%edi
  8027ac:	48 b8 88 3f 80 00 00 	movabs $0x803f88,%rax
  8027b3:	00 00 00 
  8027b6:	ff d0                	callq  *%rax
  8027b8:	c9                   	leaveq 
  8027b9:	c3                   	retq   

00000000008027ba <open>:
  8027ba:	55                   	push   %rbp
  8027bb:	48 89 e5             	mov    %rsp,%rbp
  8027be:	48 83 ec 20          	sub    $0x20,%rsp
  8027c2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8027c6:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8027c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027cd:	48 89 c7             	mov    %rax,%rdi
  8027d0:	48 b8 2e 10 80 00 00 	movabs $0x80102e,%rax
  8027d7:	00 00 00 
  8027da:	ff d0                	callq  *%rax
  8027dc:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8027e1:	7e 0a                	jle    8027ed <open+0x33>
  8027e3:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8027e8:	e9 a5 00 00 00       	jmpq   802892 <open+0xd8>
  8027ed:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8027f1:	48 89 c7             	mov    %rax,%rdi
  8027f4:	48 b8 14 1e 80 00 00 	movabs $0x801e14,%rax
  8027fb:	00 00 00 
  8027fe:	ff d0                	callq  *%rax
  802800:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802803:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802807:	79 08                	jns    802811 <open+0x57>
  802809:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80280c:	e9 81 00 00 00       	jmpq   802892 <open+0xd8>
  802811:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802815:	48 89 c6             	mov    %rax,%rsi
  802818:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  80281f:	00 00 00 
  802822:	48 b8 9a 10 80 00 00 	movabs $0x80109a,%rax
  802829:	00 00 00 
  80282c:	ff d0                	callq  *%rax
  80282e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802835:	00 00 00 
  802838:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80283b:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802841:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802845:	48 89 c6             	mov    %rax,%rsi
  802848:	bf 01 00 00 00       	mov    $0x1,%edi
  80284d:	48 b8 31 27 80 00 00 	movabs $0x802731,%rax
  802854:	00 00 00 
  802857:	ff d0                	callq  *%rax
  802859:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80285c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802860:	79 1d                	jns    80287f <open+0xc5>
  802862:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802866:	be 00 00 00 00       	mov    $0x0,%esi
  80286b:	48 89 c7             	mov    %rax,%rdi
  80286e:	48 b8 3c 1f 80 00 00 	movabs $0x801f3c,%rax
  802875:	00 00 00 
  802878:	ff d0                	callq  *%rax
  80287a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80287d:	eb 13                	jmp    802892 <open+0xd8>
  80287f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802883:	48 89 c7             	mov    %rax,%rdi
  802886:	48 b8 c6 1d 80 00 00 	movabs $0x801dc6,%rax
  80288d:	00 00 00 
  802890:	ff d0                	callq  *%rax
  802892:	c9                   	leaveq 
  802893:	c3                   	retq   

0000000000802894 <devfile_flush>:
  802894:	55                   	push   %rbp
  802895:	48 89 e5             	mov    %rsp,%rbp
  802898:	48 83 ec 10          	sub    $0x10,%rsp
  80289c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8028a0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8028a4:	8b 50 0c             	mov    0xc(%rax),%edx
  8028a7:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8028ae:	00 00 00 
  8028b1:	89 10                	mov    %edx,(%rax)
  8028b3:	be 00 00 00 00       	mov    $0x0,%esi
  8028b8:	bf 06 00 00 00       	mov    $0x6,%edi
  8028bd:	48 b8 31 27 80 00 00 	movabs $0x802731,%rax
  8028c4:	00 00 00 
  8028c7:	ff d0                	callq  *%rax
  8028c9:	c9                   	leaveq 
  8028ca:	c3                   	retq   

00000000008028cb <devfile_read>:
  8028cb:	55                   	push   %rbp
  8028cc:	48 89 e5             	mov    %rsp,%rbp
  8028cf:	48 83 ec 30          	sub    $0x30,%rsp
  8028d3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8028d7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8028db:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8028df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028e3:	8b 50 0c             	mov    0xc(%rax),%edx
  8028e6:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8028ed:	00 00 00 
  8028f0:	89 10                	mov    %edx,(%rax)
  8028f2:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8028f9:	00 00 00 
  8028fc:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802900:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802904:	be 00 00 00 00       	mov    $0x0,%esi
  802909:	bf 03 00 00 00       	mov    $0x3,%edi
  80290e:	48 b8 31 27 80 00 00 	movabs $0x802731,%rax
  802915:	00 00 00 
  802918:	ff d0                	callq  *%rax
  80291a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80291d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802921:	79 08                	jns    80292b <devfile_read+0x60>
  802923:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802926:	e9 a4 00 00 00       	jmpq   8029cf <devfile_read+0x104>
  80292b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80292e:	48 98                	cltq   
  802930:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802934:	76 35                	jbe    80296b <devfile_read+0xa0>
  802936:	48 b9 d6 4d 80 00 00 	movabs $0x804dd6,%rcx
  80293d:	00 00 00 
  802940:	48 ba dd 4d 80 00 00 	movabs $0x804ddd,%rdx
  802947:	00 00 00 
  80294a:	be 89 00 00 00       	mov    $0x89,%esi
  80294f:	48 bf f2 4d 80 00 00 	movabs $0x804df2,%rdi
  802956:	00 00 00 
  802959:	b8 00 00 00 00       	mov    $0x0,%eax
  80295e:	49 b8 74 3e 80 00 00 	movabs $0x803e74,%r8
  802965:	00 00 00 
  802968:	41 ff d0             	callq  *%r8
  80296b:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802972:	7e 35                	jle    8029a9 <devfile_read+0xde>
  802974:	48 b9 00 4e 80 00 00 	movabs $0x804e00,%rcx
  80297b:	00 00 00 
  80297e:	48 ba dd 4d 80 00 00 	movabs $0x804ddd,%rdx
  802985:	00 00 00 
  802988:	be 8a 00 00 00       	mov    $0x8a,%esi
  80298d:	48 bf f2 4d 80 00 00 	movabs $0x804df2,%rdi
  802994:	00 00 00 
  802997:	b8 00 00 00 00       	mov    $0x0,%eax
  80299c:	49 b8 74 3e 80 00 00 	movabs $0x803e74,%r8
  8029a3:	00 00 00 
  8029a6:	41 ff d0             	callq  *%r8
  8029a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029ac:	48 63 d0             	movslq %eax,%rdx
  8029af:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029b3:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  8029ba:	00 00 00 
  8029bd:	48 89 c7             	mov    %rax,%rdi
  8029c0:	48 b8 bf 13 80 00 00 	movabs $0x8013bf,%rax
  8029c7:	00 00 00 
  8029ca:	ff d0                	callq  *%rax
  8029cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029cf:	c9                   	leaveq 
  8029d0:	c3                   	retq   

00000000008029d1 <devfile_write>:
  8029d1:	55                   	push   %rbp
  8029d2:	48 89 e5             	mov    %rsp,%rbp
  8029d5:	48 83 ec 40          	sub    $0x40,%rsp
  8029d9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8029dd:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8029e1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8029e5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8029e9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8029ed:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8029f4:	00 
  8029f5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029f9:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8029fd:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802a02:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802a06:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a0a:	8b 50 0c             	mov    0xc(%rax),%edx
  802a0d:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a14:	00 00 00 
  802a17:	89 10                	mov    %edx,(%rax)
  802a19:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a20:	00 00 00 
  802a23:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802a27:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802a2b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802a2f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802a33:	48 89 c6             	mov    %rax,%rsi
  802a36:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  802a3d:	00 00 00 
  802a40:	48 b8 bf 13 80 00 00 	movabs $0x8013bf,%rax
  802a47:	00 00 00 
  802a4a:	ff d0                	callq  *%rax
  802a4c:	be 00 00 00 00       	mov    $0x0,%esi
  802a51:	bf 04 00 00 00       	mov    $0x4,%edi
  802a56:	48 b8 31 27 80 00 00 	movabs $0x802731,%rax
  802a5d:	00 00 00 
  802a60:	ff d0                	callq  *%rax
  802a62:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802a65:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802a69:	79 05                	jns    802a70 <devfile_write+0x9f>
  802a6b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a6e:	eb 43                	jmp    802ab3 <devfile_write+0xe2>
  802a70:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a73:	48 98                	cltq   
  802a75:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802a79:	76 35                	jbe    802ab0 <devfile_write+0xdf>
  802a7b:	48 b9 d6 4d 80 00 00 	movabs $0x804dd6,%rcx
  802a82:	00 00 00 
  802a85:	48 ba dd 4d 80 00 00 	movabs $0x804ddd,%rdx
  802a8c:	00 00 00 
  802a8f:	be a8 00 00 00       	mov    $0xa8,%esi
  802a94:	48 bf f2 4d 80 00 00 	movabs $0x804df2,%rdi
  802a9b:	00 00 00 
  802a9e:	b8 00 00 00 00       	mov    $0x0,%eax
  802aa3:	49 b8 74 3e 80 00 00 	movabs $0x803e74,%r8
  802aaa:	00 00 00 
  802aad:	41 ff d0             	callq  *%r8
  802ab0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ab3:	c9                   	leaveq 
  802ab4:	c3                   	retq   

0000000000802ab5 <devfile_stat>:
  802ab5:	55                   	push   %rbp
  802ab6:	48 89 e5             	mov    %rsp,%rbp
  802ab9:	48 83 ec 20          	sub    $0x20,%rsp
  802abd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802ac1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ac5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ac9:	8b 50 0c             	mov    0xc(%rax),%edx
  802acc:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802ad3:	00 00 00 
  802ad6:	89 10                	mov    %edx,(%rax)
  802ad8:	be 00 00 00 00       	mov    $0x0,%esi
  802add:	bf 05 00 00 00       	mov    $0x5,%edi
  802ae2:	48 b8 31 27 80 00 00 	movabs $0x802731,%rax
  802ae9:	00 00 00 
  802aec:	ff d0                	callq  *%rax
  802aee:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802af1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802af5:	79 05                	jns    802afc <devfile_stat+0x47>
  802af7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802afa:	eb 56                	jmp    802b52 <devfile_stat+0x9d>
  802afc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b00:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802b07:	00 00 00 
  802b0a:	48 89 c7             	mov    %rax,%rdi
  802b0d:	48 b8 9a 10 80 00 00 	movabs $0x80109a,%rax
  802b14:	00 00 00 
  802b17:	ff d0                	callq  *%rax
  802b19:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b20:	00 00 00 
  802b23:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802b29:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b2d:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802b33:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b3a:	00 00 00 
  802b3d:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802b43:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b47:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802b4d:	b8 00 00 00 00       	mov    $0x0,%eax
  802b52:	c9                   	leaveq 
  802b53:	c3                   	retq   

0000000000802b54 <devfile_trunc>:
  802b54:	55                   	push   %rbp
  802b55:	48 89 e5             	mov    %rsp,%rbp
  802b58:	48 83 ec 10          	sub    $0x10,%rsp
  802b5c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802b60:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802b63:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b67:	8b 50 0c             	mov    0xc(%rax),%edx
  802b6a:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b71:	00 00 00 
  802b74:	89 10                	mov    %edx,(%rax)
  802b76:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b7d:	00 00 00 
  802b80:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802b83:	89 50 04             	mov    %edx,0x4(%rax)
  802b86:	be 00 00 00 00       	mov    $0x0,%esi
  802b8b:	bf 02 00 00 00       	mov    $0x2,%edi
  802b90:	48 b8 31 27 80 00 00 	movabs $0x802731,%rax
  802b97:	00 00 00 
  802b9a:	ff d0                	callq  *%rax
  802b9c:	c9                   	leaveq 
  802b9d:	c3                   	retq   

0000000000802b9e <remove>:
  802b9e:	55                   	push   %rbp
  802b9f:	48 89 e5             	mov    %rsp,%rbp
  802ba2:	48 83 ec 10          	sub    $0x10,%rsp
  802ba6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802baa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802bae:	48 89 c7             	mov    %rax,%rdi
  802bb1:	48 b8 2e 10 80 00 00 	movabs $0x80102e,%rax
  802bb8:	00 00 00 
  802bbb:	ff d0                	callq  *%rax
  802bbd:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802bc2:	7e 07                	jle    802bcb <remove+0x2d>
  802bc4:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802bc9:	eb 33                	jmp    802bfe <remove+0x60>
  802bcb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802bcf:	48 89 c6             	mov    %rax,%rsi
  802bd2:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802bd9:	00 00 00 
  802bdc:	48 b8 9a 10 80 00 00 	movabs $0x80109a,%rax
  802be3:	00 00 00 
  802be6:	ff d0                	callq  *%rax
  802be8:	be 00 00 00 00       	mov    $0x0,%esi
  802bed:	bf 07 00 00 00       	mov    $0x7,%edi
  802bf2:	48 b8 31 27 80 00 00 	movabs $0x802731,%rax
  802bf9:	00 00 00 
  802bfc:	ff d0                	callq  *%rax
  802bfe:	c9                   	leaveq 
  802bff:	c3                   	retq   

0000000000802c00 <sync>:
  802c00:	55                   	push   %rbp
  802c01:	48 89 e5             	mov    %rsp,%rbp
  802c04:	be 00 00 00 00       	mov    $0x0,%esi
  802c09:	bf 08 00 00 00       	mov    $0x8,%edi
  802c0e:	48 b8 31 27 80 00 00 	movabs $0x802731,%rax
  802c15:	00 00 00 
  802c18:	ff d0                	callq  *%rax
  802c1a:	5d                   	pop    %rbp
  802c1b:	c3                   	retq   

0000000000802c1c <copy>:
  802c1c:	55                   	push   %rbp
  802c1d:	48 89 e5             	mov    %rsp,%rbp
  802c20:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802c27:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802c2e:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802c35:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802c3c:	be 00 00 00 00       	mov    $0x0,%esi
  802c41:	48 89 c7             	mov    %rax,%rdi
  802c44:	48 b8 ba 27 80 00 00 	movabs $0x8027ba,%rax
  802c4b:	00 00 00 
  802c4e:	ff d0                	callq  *%rax
  802c50:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c53:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c57:	79 28                	jns    802c81 <copy+0x65>
  802c59:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c5c:	89 c6                	mov    %eax,%esi
  802c5e:	48 bf 0c 4e 80 00 00 	movabs $0x804e0c,%rdi
  802c65:	00 00 00 
  802c68:	b8 00 00 00 00       	mov    $0x0,%eax
  802c6d:	48 ba 0a 05 80 00 00 	movabs $0x80050a,%rdx
  802c74:	00 00 00 
  802c77:	ff d2                	callq  *%rdx
  802c79:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c7c:	e9 76 01 00 00       	jmpq   802df7 <copy+0x1db>
  802c81:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802c88:	be 01 01 00 00       	mov    $0x101,%esi
  802c8d:	48 89 c7             	mov    %rax,%rdi
  802c90:	48 b8 ba 27 80 00 00 	movabs $0x8027ba,%rax
  802c97:	00 00 00 
  802c9a:	ff d0                	callq  *%rax
  802c9c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802c9f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802ca3:	0f 89 ad 00 00 00    	jns    802d56 <copy+0x13a>
  802ca9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802cac:	89 c6                	mov    %eax,%esi
  802cae:	48 bf 22 4e 80 00 00 	movabs $0x804e22,%rdi
  802cb5:	00 00 00 
  802cb8:	b8 00 00 00 00       	mov    $0x0,%eax
  802cbd:	48 ba 0a 05 80 00 00 	movabs $0x80050a,%rdx
  802cc4:	00 00 00 
  802cc7:	ff d2                	callq  *%rdx
  802cc9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ccc:	89 c7                	mov    %eax,%edi
  802cce:	48 b8 be 20 80 00 00 	movabs $0x8020be,%rax
  802cd5:	00 00 00 
  802cd8:	ff d0                	callq  *%rax
  802cda:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802cdd:	e9 15 01 00 00       	jmpq   802df7 <copy+0x1db>
  802ce2:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802ce5:	48 63 d0             	movslq %eax,%rdx
  802ce8:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802cef:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802cf2:	48 89 ce             	mov    %rcx,%rsi
  802cf5:	89 c7                	mov    %eax,%edi
  802cf7:	48 b8 2c 24 80 00 00 	movabs $0x80242c,%rax
  802cfe:	00 00 00 
  802d01:	ff d0                	callq  *%rax
  802d03:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802d06:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802d0a:	79 4a                	jns    802d56 <copy+0x13a>
  802d0c:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802d0f:	89 c6                	mov    %eax,%esi
  802d11:	48 bf 3c 4e 80 00 00 	movabs $0x804e3c,%rdi
  802d18:	00 00 00 
  802d1b:	b8 00 00 00 00       	mov    $0x0,%eax
  802d20:	48 ba 0a 05 80 00 00 	movabs $0x80050a,%rdx
  802d27:	00 00 00 
  802d2a:	ff d2                	callq  *%rdx
  802d2c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d2f:	89 c7                	mov    %eax,%edi
  802d31:	48 b8 be 20 80 00 00 	movabs $0x8020be,%rax
  802d38:	00 00 00 
  802d3b:	ff d0                	callq  *%rax
  802d3d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d40:	89 c7                	mov    %eax,%edi
  802d42:	48 b8 be 20 80 00 00 	movabs $0x8020be,%rax
  802d49:	00 00 00 
  802d4c:	ff d0                	callq  *%rax
  802d4e:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802d51:	e9 a1 00 00 00       	jmpq   802df7 <copy+0x1db>
  802d56:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802d5d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d60:	ba 00 02 00 00       	mov    $0x200,%edx
  802d65:	48 89 ce             	mov    %rcx,%rsi
  802d68:	89 c7                	mov    %eax,%edi
  802d6a:	48 b8 e1 22 80 00 00 	movabs $0x8022e1,%rax
  802d71:	00 00 00 
  802d74:	ff d0                	callq  *%rax
  802d76:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802d79:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802d7d:	0f 8f 5f ff ff ff    	jg     802ce2 <copy+0xc6>
  802d83:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802d87:	79 47                	jns    802dd0 <copy+0x1b4>
  802d89:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802d8c:	89 c6                	mov    %eax,%esi
  802d8e:	48 bf 4f 4e 80 00 00 	movabs $0x804e4f,%rdi
  802d95:	00 00 00 
  802d98:	b8 00 00 00 00       	mov    $0x0,%eax
  802d9d:	48 ba 0a 05 80 00 00 	movabs $0x80050a,%rdx
  802da4:	00 00 00 
  802da7:	ff d2                	callq  *%rdx
  802da9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dac:	89 c7                	mov    %eax,%edi
  802dae:	48 b8 be 20 80 00 00 	movabs $0x8020be,%rax
  802db5:	00 00 00 
  802db8:	ff d0                	callq  *%rax
  802dba:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802dbd:	89 c7                	mov    %eax,%edi
  802dbf:	48 b8 be 20 80 00 00 	movabs $0x8020be,%rax
  802dc6:	00 00 00 
  802dc9:	ff d0                	callq  *%rax
  802dcb:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802dce:	eb 27                	jmp    802df7 <copy+0x1db>
  802dd0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dd3:	89 c7                	mov    %eax,%edi
  802dd5:	48 b8 be 20 80 00 00 	movabs $0x8020be,%rax
  802ddc:	00 00 00 
  802ddf:	ff d0                	callq  *%rax
  802de1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802de4:	89 c7                	mov    %eax,%edi
  802de6:	48 b8 be 20 80 00 00 	movabs $0x8020be,%rax
  802ded:	00 00 00 
  802df0:	ff d0                	callq  *%rax
  802df2:	b8 00 00 00 00       	mov    $0x0,%eax
  802df7:	c9                   	leaveq 
  802df8:	c3                   	retq   

0000000000802df9 <fd2sockid>:
  802df9:	55                   	push   %rbp
  802dfa:	48 89 e5             	mov    %rsp,%rbp
  802dfd:	48 83 ec 20          	sub    $0x20,%rsp
  802e01:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e04:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e08:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e0b:	48 89 d6             	mov    %rdx,%rsi
  802e0e:	89 c7                	mov    %eax,%edi
  802e10:	48 b8 ac 1e 80 00 00 	movabs $0x801eac,%rax
  802e17:	00 00 00 
  802e1a:	ff d0                	callq  *%rax
  802e1c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e1f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e23:	79 05                	jns    802e2a <fd2sockid+0x31>
  802e25:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e28:	eb 24                	jmp    802e4e <fd2sockid+0x55>
  802e2a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e2e:	8b 10                	mov    (%rax),%edx
  802e30:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  802e37:	00 00 00 
  802e3a:	8b 00                	mov    (%rax),%eax
  802e3c:	39 c2                	cmp    %eax,%edx
  802e3e:	74 07                	je     802e47 <fd2sockid+0x4e>
  802e40:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802e45:	eb 07                	jmp    802e4e <fd2sockid+0x55>
  802e47:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e4b:	8b 40 0c             	mov    0xc(%rax),%eax
  802e4e:	c9                   	leaveq 
  802e4f:	c3                   	retq   

0000000000802e50 <alloc_sockfd>:
  802e50:	55                   	push   %rbp
  802e51:	48 89 e5             	mov    %rsp,%rbp
  802e54:	48 83 ec 20          	sub    $0x20,%rsp
  802e58:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e5b:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802e5f:	48 89 c7             	mov    %rax,%rdi
  802e62:	48 b8 14 1e 80 00 00 	movabs $0x801e14,%rax
  802e69:	00 00 00 
  802e6c:	ff d0                	callq  *%rax
  802e6e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e71:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e75:	78 26                	js     802e9d <alloc_sockfd+0x4d>
  802e77:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e7b:	ba 07 04 00 00       	mov    $0x407,%edx
  802e80:	48 89 c6             	mov    %rax,%rsi
  802e83:	bf 00 00 00 00       	mov    $0x0,%edi
  802e88:	48 b8 ca 19 80 00 00 	movabs $0x8019ca,%rax
  802e8f:	00 00 00 
  802e92:	ff d0                	callq  *%rax
  802e94:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e97:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e9b:	79 16                	jns    802eb3 <alloc_sockfd+0x63>
  802e9d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ea0:	89 c7                	mov    %eax,%edi
  802ea2:	48 b8 5f 33 80 00 00 	movabs $0x80335f,%rax
  802ea9:	00 00 00 
  802eac:	ff d0                	callq  *%rax
  802eae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eb1:	eb 3a                	jmp    802eed <alloc_sockfd+0x9d>
  802eb3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802eb7:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  802ebe:	00 00 00 
  802ec1:	8b 12                	mov    (%rdx),%edx
  802ec3:	89 10                	mov    %edx,(%rax)
  802ec5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ec9:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  802ed0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ed4:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802ed7:	89 50 0c             	mov    %edx,0xc(%rax)
  802eda:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ede:	48 89 c7             	mov    %rax,%rdi
  802ee1:	48 b8 c6 1d 80 00 00 	movabs $0x801dc6,%rax
  802ee8:	00 00 00 
  802eeb:	ff d0                	callq  *%rax
  802eed:	c9                   	leaveq 
  802eee:	c3                   	retq   

0000000000802eef <accept>:
  802eef:	55                   	push   %rbp
  802ef0:	48 89 e5             	mov    %rsp,%rbp
  802ef3:	48 83 ec 30          	sub    $0x30,%rsp
  802ef7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802efa:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802efe:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802f02:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f05:	89 c7                	mov    %eax,%edi
  802f07:	48 b8 f9 2d 80 00 00 	movabs $0x802df9,%rax
  802f0e:	00 00 00 
  802f11:	ff d0                	callq  *%rax
  802f13:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f16:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f1a:	79 05                	jns    802f21 <accept+0x32>
  802f1c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f1f:	eb 3b                	jmp    802f5c <accept+0x6d>
  802f21:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802f25:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802f29:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f2c:	48 89 ce             	mov    %rcx,%rsi
  802f2f:	89 c7                	mov    %eax,%edi
  802f31:	48 b8 3c 32 80 00 00 	movabs $0x80323c,%rax
  802f38:	00 00 00 
  802f3b:	ff d0                	callq  *%rax
  802f3d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f40:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f44:	79 05                	jns    802f4b <accept+0x5c>
  802f46:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f49:	eb 11                	jmp    802f5c <accept+0x6d>
  802f4b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f4e:	89 c7                	mov    %eax,%edi
  802f50:	48 b8 50 2e 80 00 00 	movabs $0x802e50,%rax
  802f57:	00 00 00 
  802f5a:	ff d0                	callq  *%rax
  802f5c:	c9                   	leaveq 
  802f5d:	c3                   	retq   

0000000000802f5e <bind>:
  802f5e:	55                   	push   %rbp
  802f5f:	48 89 e5             	mov    %rsp,%rbp
  802f62:	48 83 ec 20          	sub    $0x20,%rsp
  802f66:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f69:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802f6d:	89 55 e8             	mov    %edx,-0x18(%rbp)
  802f70:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f73:	89 c7                	mov    %eax,%edi
  802f75:	48 b8 f9 2d 80 00 00 	movabs $0x802df9,%rax
  802f7c:	00 00 00 
  802f7f:	ff d0                	callq  *%rax
  802f81:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f84:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f88:	79 05                	jns    802f8f <bind+0x31>
  802f8a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f8d:	eb 1b                	jmp    802faa <bind+0x4c>
  802f8f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802f92:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802f96:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f99:	48 89 ce             	mov    %rcx,%rsi
  802f9c:	89 c7                	mov    %eax,%edi
  802f9e:	48 b8 bb 32 80 00 00 	movabs $0x8032bb,%rax
  802fa5:	00 00 00 
  802fa8:	ff d0                	callq  *%rax
  802faa:	c9                   	leaveq 
  802fab:	c3                   	retq   

0000000000802fac <shutdown>:
  802fac:	55                   	push   %rbp
  802fad:	48 89 e5             	mov    %rsp,%rbp
  802fb0:	48 83 ec 20          	sub    $0x20,%rsp
  802fb4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802fb7:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802fba:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802fbd:	89 c7                	mov    %eax,%edi
  802fbf:	48 b8 f9 2d 80 00 00 	movabs $0x802df9,%rax
  802fc6:	00 00 00 
  802fc9:	ff d0                	callq  *%rax
  802fcb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fce:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fd2:	79 05                	jns    802fd9 <shutdown+0x2d>
  802fd4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fd7:	eb 16                	jmp    802fef <shutdown+0x43>
  802fd9:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802fdc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fdf:	89 d6                	mov    %edx,%esi
  802fe1:	89 c7                	mov    %eax,%edi
  802fe3:	48 b8 1f 33 80 00 00 	movabs $0x80331f,%rax
  802fea:	00 00 00 
  802fed:	ff d0                	callq  *%rax
  802fef:	c9                   	leaveq 
  802ff0:	c3                   	retq   

0000000000802ff1 <devsock_close>:
  802ff1:	55                   	push   %rbp
  802ff2:	48 89 e5             	mov    %rsp,%rbp
  802ff5:	48 83 ec 10          	sub    $0x10,%rsp
  802ff9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802ffd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803001:	48 89 c7             	mov    %rax,%rdi
  803004:	48 b8 c4 41 80 00 00 	movabs $0x8041c4,%rax
  80300b:	00 00 00 
  80300e:	ff d0                	callq  *%rax
  803010:	83 f8 01             	cmp    $0x1,%eax
  803013:	75 17                	jne    80302c <devsock_close+0x3b>
  803015:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803019:	8b 40 0c             	mov    0xc(%rax),%eax
  80301c:	89 c7                	mov    %eax,%edi
  80301e:	48 b8 5f 33 80 00 00 	movabs $0x80335f,%rax
  803025:	00 00 00 
  803028:	ff d0                	callq  *%rax
  80302a:	eb 05                	jmp    803031 <devsock_close+0x40>
  80302c:	b8 00 00 00 00       	mov    $0x0,%eax
  803031:	c9                   	leaveq 
  803032:	c3                   	retq   

0000000000803033 <connect>:
  803033:	55                   	push   %rbp
  803034:	48 89 e5             	mov    %rsp,%rbp
  803037:	48 83 ec 20          	sub    $0x20,%rsp
  80303b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80303e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803042:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803045:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803048:	89 c7                	mov    %eax,%edi
  80304a:	48 b8 f9 2d 80 00 00 	movabs $0x802df9,%rax
  803051:	00 00 00 
  803054:	ff d0                	callq  *%rax
  803056:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803059:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80305d:	79 05                	jns    803064 <connect+0x31>
  80305f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803062:	eb 1b                	jmp    80307f <connect+0x4c>
  803064:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803067:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80306b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80306e:	48 89 ce             	mov    %rcx,%rsi
  803071:	89 c7                	mov    %eax,%edi
  803073:	48 b8 8c 33 80 00 00 	movabs $0x80338c,%rax
  80307a:	00 00 00 
  80307d:	ff d0                	callq  *%rax
  80307f:	c9                   	leaveq 
  803080:	c3                   	retq   

0000000000803081 <listen>:
  803081:	55                   	push   %rbp
  803082:	48 89 e5             	mov    %rsp,%rbp
  803085:	48 83 ec 20          	sub    $0x20,%rsp
  803089:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80308c:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80308f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803092:	89 c7                	mov    %eax,%edi
  803094:	48 b8 f9 2d 80 00 00 	movabs $0x802df9,%rax
  80309b:	00 00 00 
  80309e:	ff d0                	callq  *%rax
  8030a0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030a3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030a7:	79 05                	jns    8030ae <listen+0x2d>
  8030a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030ac:	eb 16                	jmp    8030c4 <listen+0x43>
  8030ae:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8030b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030b4:	89 d6                	mov    %edx,%esi
  8030b6:	89 c7                	mov    %eax,%edi
  8030b8:	48 b8 f0 33 80 00 00 	movabs $0x8033f0,%rax
  8030bf:	00 00 00 
  8030c2:	ff d0                	callq  *%rax
  8030c4:	c9                   	leaveq 
  8030c5:	c3                   	retq   

00000000008030c6 <devsock_read>:
  8030c6:	55                   	push   %rbp
  8030c7:	48 89 e5             	mov    %rsp,%rbp
  8030ca:	48 83 ec 20          	sub    $0x20,%rsp
  8030ce:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8030d2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8030d6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8030da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030de:	89 c2                	mov    %eax,%edx
  8030e0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030e4:	8b 40 0c             	mov    0xc(%rax),%eax
  8030e7:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8030eb:	b9 00 00 00 00       	mov    $0x0,%ecx
  8030f0:	89 c7                	mov    %eax,%edi
  8030f2:	48 b8 30 34 80 00 00 	movabs $0x803430,%rax
  8030f9:	00 00 00 
  8030fc:	ff d0                	callq  *%rax
  8030fe:	c9                   	leaveq 
  8030ff:	c3                   	retq   

0000000000803100 <devsock_write>:
  803100:	55                   	push   %rbp
  803101:	48 89 e5             	mov    %rsp,%rbp
  803104:	48 83 ec 20          	sub    $0x20,%rsp
  803108:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80310c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803110:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803114:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803118:	89 c2                	mov    %eax,%edx
  80311a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80311e:	8b 40 0c             	mov    0xc(%rax),%eax
  803121:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803125:	b9 00 00 00 00       	mov    $0x0,%ecx
  80312a:	89 c7                	mov    %eax,%edi
  80312c:	48 b8 fc 34 80 00 00 	movabs $0x8034fc,%rax
  803133:	00 00 00 
  803136:	ff d0                	callq  *%rax
  803138:	c9                   	leaveq 
  803139:	c3                   	retq   

000000000080313a <devsock_stat>:
  80313a:	55                   	push   %rbp
  80313b:	48 89 e5             	mov    %rsp,%rbp
  80313e:	48 83 ec 10          	sub    $0x10,%rsp
  803142:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803146:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80314a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80314e:	48 be 6a 4e 80 00 00 	movabs $0x804e6a,%rsi
  803155:	00 00 00 
  803158:	48 89 c7             	mov    %rax,%rdi
  80315b:	48 b8 9a 10 80 00 00 	movabs $0x80109a,%rax
  803162:	00 00 00 
  803165:	ff d0                	callq  *%rax
  803167:	b8 00 00 00 00       	mov    $0x0,%eax
  80316c:	c9                   	leaveq 
  80316d:	c3                   	retq   

000000000080316e <socket>:
  80316e:	55                   	push   %rbp
  80316f:	48 89 e5             	mov    %rsp,%rbp
  803172:	48 83 ec 20          	sub    $0x20,%rsp
  803176:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803179:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80317c:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  80317f:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803182:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803185:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803188:	89 ce                	mov    %ecx,%esi
  80318a:	89 c7                	mov    %eax,%edi
  80318c:	48 b8 b4 35 80 00 00 	movabs $0x8035b4,%rax
  803193:	00 00 00 
  803196:	ff d0                	callq  *%rax
  803198:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80319b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80319f:	79 05                	jns    8031a6 <socket+0x38>
  8031a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031a4:	eb 11                	jmp    8031b7 <socket+0x49>
  8031a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031a9:	89 c7                	mov    %eax,%edi
  8031ab:	48 b8 50 2e 80 00 00 	movabs $0x802e50,%rax
  8031b2:	00 00 00 
  8031b5:	ff d0                	callq  *%rax
  8031b7:	c9                   	leaveq 
  8031b8:	c3                   	retq   

00000000008031b9 <nsipc>:
  8031b9:	55                   	push   %rbp
  8031ba:	48 89 e5             	mov    %rsp,%rbp
  8031bd:	48 83 ec 10          	sub    $0x10,%rsp
  8031c1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8031c4:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  8031cb:	00 00 00 
  8031ce:	8b 00                	mov    (%rax),%eax
  8031d0:	85 c0                	test   %eax,%eax
  8031d2:	75 1f                	jne    8031f3 <nsipc+0x3a>
  8031d4:	bf 02 00 00 00       	mov    $0x2,%edi
  8031d9:	48 b8 53 41 80 00 00 	movabs $0x804153,%rax
  8031e0:	00 00 00 
  8031e3:	ff d0                	callq  *%rax
  8031e5:	89 c2                	mov    %eax,%edx
  8031e7:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  8031ee:	00 00 00 
  8031f1:	89 10                	mov    %edx,(%rax)
  8031f3:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  8031fa:	00 00 00 
  8031fd:	8b 00                	mov    (%rax),%eax
  8031ff:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803202:	b9 07 00 00 00       	mov    $0x7,%ecx
  803207:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  80320e:	00 00 00 
  803211:	89 c7                	mov    %eax,%edi
  803213:	48 b8 49 40 80 00 00 	movabs $0x804049,%rax
  80321a:	00 00 00 
  80321d:	ff d0                	callq  *%rax
  80321f:	ba 00 00 00 00       	mov    $0x0,%edx
  803224:	be 00 00 00 00       	mov    $0x0,%esi
  803229:	bf 00 00 00 00       	mov    $0x0,%edi
  80322e:	48 b8 88 3f 80 00 00 	movabs $0x803f88,%rax
  803235:	00 00 00 
  803238:	ff d0                	callq  *%rax
  80323a:	c9                   	leaveq 
  80323b:	c3                   	retq   

000000000080323c <nsipc_accept>:
  80323c:	55                   	push   %rbp
  80323d:	48 89 e5             	mov    %rsp,%rbp
  803240:	48 83 ec 30          	sub    $0x30,%rsp
  803244:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803247:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80324b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80324f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803256:	00 00 00 
  803259:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80325c:	89 10                	mov    %edx,(%rax)
  80325e:	bf 01 00 00 00       	mov    $0x1,%edi
  803263:	48 b8 b9 31 80 00 00 	movabs $0x8031b9,%rax
  80326a:	00 00 00 
  80326d:	ff d0                	callq  *%rax
  80326f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803272:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803276:	78 3e                	js     8032b6 <nsipc_accept+0x7a>
  803278:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80327f:	00 00 00 
  803282:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803286:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80328a:	8b 40 10             	mov    0x10(%rax),%eax
  80328d:	89 c2                	mov    %eax,%edx
  80328f:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803293:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803297:	48 89 ce             	mov    %rcx,%rsi
  80329a:	48 89 c7             	mov    %rax,%rdi
  80329d:	48 b8 bf 13 80 00 00 	movabs $0x8013bf,%rax
  8032a4:	00 00 00 
  8032a7:	ff d0                	callq  *%rax
  8032a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032ad:	8b 50 10             	mov    0x10(%rax),%edx
  8032b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8032b4:	89 10                	mov    %edx,(%rax)
  8032b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032b9:	c9                   	leaveq 
  8032ba:	c3                   	retq   

00000000008032bb <nsipc_bind>:
  8032bb:	55                   	push   %rbp
  8032bc:	48 89 e5             	mov    %rsp,%rbp
  8032bf:	48 83 ec 10          	sub    $0x10,%rsp
  8032c3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8032c6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8032ca:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8032cd:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032d4:	00 00 00 
  8032d7:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8032da:	89 10                	mov    %edx,(%rax)
  8032dc:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8032df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032e3:	48 89 c6             	mov    %rax,%rsi
  8032e6:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  8032ed:	00 00 00 
  8032f0:	48 b8 bf 13 80 00 00 	movabs $0x8013bf,%rax
  8032f7:	00 00 00 
  8032fa:	ff d0                	callq  *%rax
  8032fc:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803303:	00 00 00 
  803306:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803309:	89 50 14             	mov    %edx,0x14(%rax)
  80330c:	bf 02 00 00 00       	mov    $0x2,%edi
  803311:	48 b8 b9 31 80 00 00 	movabs $0x8031b9,%rax
  803318:	00 00 00 
  80331b:	ff d0                	callq  *%rax
  80331d:	c9                   	leaveq 
  80331e:	c3                   	retq   

000000000080331f <nsipc_shutdown>:
  80331f:	55                   	push   %rbp
  803320:	48 89 e5             	mov    %rsp,%rbp
  803323:	48 83 ec 10          	sub    $0x10,%rsp
  803327:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80332a:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80332d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803334:	00 00 00 
  803337:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80333a:	89 10                	mov    %edx,(%rax)
  80333c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803343:	00 00 00 
  803346:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803349:	89 50 04             	mov    %edx,0x4(%rax)
  80334c:	bf 03 00 00 00       	mov    $0x3,%edi
  803351:	48 b8 b9 31 80 00 00 	movabs $0x8031b9,%rax
  803358:	00 00 00 
  80335b:	ff d0                	callq  *%rax
  80335d:	c9                   	leaveq 
  80335e:	c3                   	retq   

000000000080335f <nsipc_close>:
  80335f:	55                   	push   %rbp
  803360:	48 89 e5             	mov    %rsp,%rbp
  803363:	48 83 ec 10          	sub    $0x10,%rsp
  803367:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80336a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803371:	00 00 00 
  803374:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803377:	89 10                	mov    %edx,(%rax)
  803379:	bf 04 00 00 00       	mov    $0x4,%edi
  80337e:	48 b8 b9 31 80 00 00 	movabs $0x8031b9,%rax
  803385:	00 00 00 
  803388:	ff d0                	callq  *%rax
  80338a:	c9                   	leaveq 
  80338b:	c3                   	retq   

000000000080338c <nsipc_connect>:
  80338c:	55                   	push   %rbp
  80338d:	48 89 e5             	mov    %rsp,%rbp
  803390:	48 83 ec 10          	sub    $0x10,%rsp
  803394:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803397:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80339b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80339e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033a5:	00 00 00 
  8033a8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8033ab:	89 10                	mov    %edx,(%rax)
  8033ad:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8033b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033b4:	48 89 c6             	mov    %rax,%rsi
  8033b7:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  8033be:	00 00 00 
  8033c1:	48 b8 bf 13 80 00 00 	movabs $0x8013bf,%rax
  8033c8:	00 00 00 
  8033cb:	ff d0                	callq  *%rax
  8033cd:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033d4:	00 00 00 
  8033d7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8033da:	89 50 14             	mov    %edx,0x14(%rax)
  8033dd:	bf 05 00 00 00       	mov    $0x5,%edi
  8033e2:	48 b8 b9 31 80 00 00 	movabs $0x8031b9,%rax
  8033e9:	00 00 00 
  8033ec:	ff d0                	callq  *%rax
  8033ee:	c9                   	leaveq 
  8033ef:	c3                   	retq   

00000000008033f0 <nsipc_listen>:
  8033f0:	55                   	push   %rbp
  8033f1:	48 89 e5             	mov    %rsp,%rbp
  8033f4:	48 83 ec 10          	sub    $0x10,%rsp
  8033f8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8033fb:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8033fe:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803405:	00 00 00 
  803408:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80340b:	89 10                	mov    %edx,(%rax)
  80340d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803414:	00 00 00 
  803417:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80341a:	89 50 04             	mov    %edx,0x4(%rax)
  80341d:	bf 06 00 00 00       	mov    $0x6,%edi
  803422:	48 b8 b9 31 80 00 00 	movabs $0x8031b9,%rax
  803429:	00 00 00 
  80342c:	ff d0                	callq  *%rax
  80342e:	c9                   	leaveq 
  80342f:	c3                   	retq   

0000000000803430 <nsipc_recv>:
  803430:	55                   	push   %rbp
  803431:	48 89 e5             	mov    %rsp,%rbp
  803434:	48 83 ec 30          	sub    $0x30,%rsp
  803438:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80343b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80343f:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803442:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803445:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80344c:	00 00 00 
  80344f:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803452:	89 10                	mov    %edx,(%rax)
  803454:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80345b:	00 00 00 
  80345e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803461:	89 50 04             	mov    %edx,0x4(%rax)
  803464:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80346b:	00 00 00 
  80346e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803471:	89 50 08             	mov    %edx,0x8(%rax)
  803474:	bf 07 00 00 00       	mov    $0x7,%edi
  803479:	48 b8 b9 31 80 00 00 	movabs $0x8031b9,%rax
  803480:	00 00 00 
  803483:	ff d0                	callq  *%rax
  803485:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803488:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80348c:	78 69                	js     8034f7 <nsipc_recv+0xc7>
  80348e:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803495:	7f 08                	jg     80349f <nsipc_recv+0x6f>
  803497:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80349a:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  80349d:	7e 35                	jle    8034d4 <nsipc_recv+0xa4>
  80349f:	48 b9 71 4e 80 00 00 	movabs $0x804e71,%rcx
  8034a6:	00 00 00 
  8034a9:	48 ba 86 4e 80 00 00 	movabs $0x804e86,%rdx
  8034b0:	00 00 00 
  8034b3:	be 62 00 00 00       	mov    $0x62,%esi
  8034b8:	48 bf 9b 4e 80 00 00 	movabs $0x804e9b,%rdi
  8034bf:	00 00 00 
  8034c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8034c7:	49 b8 74 3e 80 00 00 	movabs $0x803e74,%r8
  8034ce:	00 00 00 
  8034d1:	41 ff d0             	callq  *%r8
  8034d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034d7:	48 63 d0             	movslq %eax,%rdx
  8034da:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8034de:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  8034e5:	00 00 00 
  8034e8:	48 89 c7             	mov    %rax,%rdi
  8034eb:	48 b8 bf 13 80 00 00 	movabs $0x8013bf,%rax
  8034f2:	00 00 00 
  8034f5:	ff d0                	callq  *%rax
  8034f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034fa:	c9                   	leaveq 
  8034fb:	c3                   	retq   

00000000008034fc <nsipc_send>:
  8034fc:	55                   	push   %rbp
  8034fd:	48 89 e5             	mov    %rsp,%rbp
  803500:	48 83 ec 20          	sub    $0x20,%rsp
  803504:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803507:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80350b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80350e:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803511:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803518:	00 00 00 
  80351b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80351e:	89 10                	mov    %edx,(%rax)
  803520:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803527:	7e 35                	jle    80355e <nsipc_send+0x62>
  803529:	48 b9 aa 4e 80 00 00 	movabs $0x804eaa,%rcx
  803530:	00 00 00 
  803533:	48 ba 86 4e 80 00 00 	movabs $0x804e86,%rdx
  80353a:	00 00 00 
  80353d:	be 6d 00 00 00       	mov    $0x6d,%esi
  803542:	48 bf 9b 4e 80 00 00 	movabs $0x804e9b,%rdi
  803549:	00 00 00 
  80354c:	b8 00 00 00 00       	mov    $0x0,%eax
  803551:	49 b8 74 3e 80 00 00 	movabs $0x803e74,%r8
  803558:	00 00 00 
  80355b:	41 ff d0             	callq  *%r8
  80355e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803561:	48 63 d0             	movslq %eax,%rdx
  803564:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803568:	48 89 c6             	mov    %rax,%rsi
  80356b:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  803572:	00 00 00 
  803575:	48 b8 bf 13 80 00 00 	movabs $0x8013bf,%rax
  80357c:	00 00 00 
  80357f:	ff d0                	callq  *%rax
  803581:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803588:	00 00 00 
  80358b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80358e:	89 50 04             	mov    %edx,0x4(%rax)
  803591:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803598:	00 00 00 
  80359b:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80359e:	89 50 08             	mov    %edx,0x8(%rax)
  8035a1:	bf 08 00 00 00       	mov    $0x8,%edi
  8035a6:	48 b8 b9 31 80 00 00 	movabs $0x8031b9,%rax
  8035ad:	00 00 00 
  8035b0:	ff d0                	callq  *%rax
  8035b2:	c9                   	leaveq 
  8035b3:	c3                   	retq   

00000000008035b4 <nsipc_socket>:
  8035b4:	55                   	push   %rbp
  8035b5:	48 89 e5             	mov    %rsp,%rbp
  8035b8:	48 83 ec 10          	sub    $0x10,%rsp
  8035bc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8035bf:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8035c2:	89 55 f4             	mov    %edx,-0xc(%rbp)
  8035c5:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8035cc:	00 00 00 
  8035cf:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8035d2:	89 10                	mov    %edx,(%rax)
  8035d4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8035db:	00 00 00 
  8035de:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8035e1:	89 50 04             	mov    %edx,0x4(%rax)
  8035e4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8035eb:	00 00 00 
  8035ee:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8035f1:	89 50 08             	mov    %edx,0x8(%rax)
  8035f4:	bf 09 00 00 00       	mov    $0x9,%edi
  8035f9:	48 b8 b9 31 80 00 00 	movabs $0x8031b9,%rax
  803600:	00 00 00 
  803603:	ff d0                	callq  *%rax
  803605:	c9                   	leaveq 
  803606:	c3                   	retq   

0000000000803607 <pipe>:
  803607:	55                   	push   %rbp
  803608:	48 89 e5             	mov    %rsp,%rbp
  80360b:	53                   	push   %rbx
  80360c:	48 83 ec 38          	sub    $0x38,%rsp
  803610:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803614:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803618:	48 89 c7             	mov    %rax,%rdi
  80361b:	48 b8 14 1e 80 00 00 	movabs $0x801e14,%rax
  803622:	00 00 00 
  803625:	ff d0                	callq  *%rax
  803627:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80362a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80362e:	0f 88 bf 01 00 00    	js     8037f3 <pipe+0x1ec>
  803634:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803638:	ba 07 04 00 00       	mov    $0x407,%edx
  80363d:	48 89 c6             	mov    %rax,%rsi
  803640:	bf 00 00 00 00       	mov    $0x0,%edi
  803645:	48 b8 ca 19 80 00 00 	movabs $0x8019ca,%rax
  80364c:	00 00 00 
  80364f:	ff d0                	callq  *%rax
  803651:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803654:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803658:	0f 88 95 01 00 00    	js     8037f3 <pipe+0x1ec>
  80365e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803662:	48 89 c7             	mov    %rax,%rdi
  803665:	48 b8 14 1e 80 00 00 	movabs $0x801e14,%rax
  80366c:	00 00 00 
  80366f:	ff d0                	callq  *%rax
  803671:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803674:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803678:	0f 88 5d 01 00 00    	js     8037db <pipe+0x1d4>
  80367e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803682:	ba 07 04 00 00       	mov    $0x407,%edx
  803687:	48 89 c6             	mov    %rax,%rsi
  80368a:	bf 00 00 00 00       	mov    $0x0,%edi
  80368f:	48 b8 ca 19 80 00 00 	movabs $0x8019ca,%rax
  803696:	00 00 00 
  803699:	ff d0                	callq  *%rax
  80369b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80369e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8036a2:	0f 88 33 01 00 00    	js     8037db <pipe+0x1d4>
  8036a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8036ac:	48 89 c7             	mov    %rax,%rdi
  8036af:	48 b8 e9 1d 80 00 00 	movabs $0x801de9,%rax
  8036b6:	00 00 00 
  8036b9:	ff d0                	callq  *%rax
  8036bb:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8036bf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8036c3:	ba 07 04 00 00       	mov    $0x407,%edx
  8036c8:	48 89 c6             	mov    %rax,%rsi
  8036cb:	bf 00 00 00 00       	mov    $0x0,%edi
  8036d0:	48 b8 ca 19 80 00 00 	movabs $0x8019ca,%rax
  8036d7:	00 00 00 
  8036da:	ff d0                	callq  *%rax
  8036dc:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8036df:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8036e3:	0f 88 d9 00 00 00    	js     8037c2 <pipe+0x1bb>
  8036e9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8036ed:	48 89 c7             	mov    %rax,%rdi
  8036f0:	48 b8 e9 1d 80 00 00 	movabs $0x801de9,%rax
  8036f7:	00 00 00 
  8036fa:	ff d0                	callq  *%rax
  8036fc:	48 89 c2             	mov    %rax,%rdx
  8036ff:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803703:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803709:	48 89 d1             	mov    %rdx,%rcx
  80370c:	ba 00 00 00 00       	mov    $0x0,%edx
  803711:	48 89 c6             	mov    %rax,%rsi
  803714:	bf 00 00 00 00       	mov    $0x0,%edi
  803719:	48 b8 1c 1a 80 00 00 	movabs $0x801a1c,%rax
  803720:	00 00 00 
  803723:	ff d0                	callq  *%rax
  803725:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803728:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80372c:	78 79                	js     8037a7 <pipe+0x1a0>
  80372e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803732:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803739:	00 00 00 
  80373c:	8b 12                	mov    (%rdx),%edx
  80373e:	89 10                	mov    %edx,(%rax)
  803740:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803744:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  80374b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80374f:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803756:	00 00 00 
  803759:	8b 12                	mov    (%rdx),%edx
  80375b:	89 10                	mov    %edx,(%rax)
  80375d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803761:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803768:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80376c:	48 89 c7             	mov    %rax,%rdi
  80376f:	48 b8 c6 1d 80 00 00 	movabs $0x801dc6,%rax
  803776:	00 00 00 
  803779:	ff d0                	callq  *%rax
  80377b:	89 c2                	mov    %eax,%edx
  80377d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803781:	89 10                	mov    %edx,(%rax)
  803783:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803787:	48 8d 58 04          	lea    0x4(%rax),%rbx
  80378b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80378f:	48 89 c7             	mov    %rax,%rdi
  803792:	48 b8 c6 1d 80 00 00 	movabs $0x801dc6,%rax
  803799:	00 00 00 
  80379c:	ff d0                	callq  *%rax
  80379e:	89 03                	mov    %eax,(%rbx)
  8037a0:	b8 00 00 00 00       	mov    $0x0,%eax
  8037a5:	eb 4f                	jmp    8037f6 <pipe+0x1ef>
  8037a7:	90                   	nop
  8037a8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8037ac:	48 89 c6             	mov    %rax,%rsi
  8037af:	bf 00 00 00 00       	mov    $0x0,%edi
  8037b4:	48 b8 7c 1a 80 00 00 	movabs $0x801a7c,%rax
  8037bb:	00 00 00 
  8037be:	ff d0                	callq  *%rax
  8037c0:	eb 01                	jmp    8037c3 <pipe+0x1bc>
  8037c2:	90                   	nop
  8037c3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8037c7:	48 89 c6             	mov    %rax,%rsi
  8037ca:	bf 00 00 00 00       	mov    $0x0,%edi
  8037cf:	48 b8 7c 1a 80 00 00 	movabs $0x801a7c,%rax
  8037d6:	00 00 00 
  8037d9:	ff d0                	callq  *%rax
  8037db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8037df:	48 89 c6             	mov    %rax,%rsi
  8037e2:	bf 00 00 00 00       	mov    $0x0,%edi
  8037e7:	48 b8 7c 1a 80 00 00 	movabs $0x801a7c,%rax
  8037ee:	00 00 00 
  8037f1:	ff d0                	callq  *%rax
  8037f3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037f6:	48 83 c4 38          	add    $0x38,%rsp
  8037fa:	5b                   	pop    %rbx
  8037fb:	5d                   	pop    %rbp
  8037fc:	c3                   	retq   

00000000008037fd <_pipeisclosed>:
  8037fd:	55                   	push   %rbp
  8037fe:	48 89 e5             	mov    %rsp,%rbp
  803801:	53                   	push   %rbx
  803802:	48 83 ec 28          	sub    $0x28,%rsp
  803806:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80380a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80380e:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  803815:	00 00 00 
  803818:	48 8b 00             	mov    (%rax),%rax
  80381b:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803821:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803824:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803828:	48 89 c7             	mov    %rax,%rdi
  80382b:	48 b8 c4 41 80 00 00 	movabs $0x8041c4,%rax
  803832:	00 00 00 
  803835:	ff d0                	callq  *%rax
  803837:	89 c3                	mov    %eax,%ebx
  803839:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80383d:	48 89 c7             	mov    %rax,%rdi
  803840:	48 b8 c4 41 80 00 00 	movabs $0x8041c4,%rax
  803847:	00 00 00 
  80384a:	ff d0                	callq  *%rax
  80384c:	39 c3                	cmp    %eax,%ebx
  80384e:	0f 94 c0             	sete   %al
  803851:	0f b6 c0             	movzbl %al,%eax
  803854:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803857:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80385e:	00 00 00 
  803861:	48 8b 00             	mov    (%rax),%rax
  803864:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  80386a:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80386d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803870:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803873:	75 05                	jne    80387a <_pipeisclosed+0x7d>
  803875:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803878:	eb 4a                	jmp    8038c4 <_pipeisclosed+0xc7>
  80387a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80387d:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803880:	74 8c                	je     80380e <_pipeisclosed+0x11>
  803882:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803886:	75 86                	jne    80380e <_pipeisclosed+0x11>
  803888:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80388f:	00 00 00 
  803892:	48 8b 00             	mov    (%rax),%rax
  803895:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  80389b:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80389e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038a1:	89 c6                	mov    %eax,%esi
  8038a3:	48 bf bb 4e 80 00 00 	movabs $0x804ebb,%rdi
  8038aa:	00 00 00 
  8038ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8038b2:	49 b8 0a 05 80 00 00 	movabs $0x80050a,%r8
  8038b9:	00 00 00 
  8038bc:	41 ff d0             	callq  *%r8
  8038bf:	e9 4a ff ff ff       	jmpq   80380e <_pipeisclosed+0x11>
  8038c4:	48 83 c4 28          	add    $0x28,%rsp
  8038c8:	5b                   	pop    %rbx
  8038c9:	5d                   	pop    %rbp
  8038ca:	c3                   	retq   

00000000008038cb <pipeisclosed>:
  8038cb:	55                   	push   %rbp
  8038cc:	48 89 e5             	mov    %rsp,%rbp
  8038cf:	48 83 ec 30          	sub    $0x30,%rsp
  8038d3:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8038d6:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8038da:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8038dd:	48 89 d6             	mov    %rdx,%rsi
  8038e0:	89 c7                	mov    %eax,%edi
  8038e2:	48 b8 ac 1e 80 00 00 	movabs $0x801eac,%rax
  8038e9:	00 00 00 
  8038ec:	ff d0                	callq  *%rax
  8038ee:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038f1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038f5:	79 05                	jns    8038fc <pipeisclosed+0x31>
  8038f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038fa:	eb 31                	jmp    80392d <pipeisclosed+0x62>
  8038fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803900:	48 89 c7             	mov    %rax,%rdi
  803903:	48 b8 e9 1d 80 00 00 	movabs $0x801de9,%rax
  80390a:	00 00 00 
  80390d:	ff d0                	callq  *%rax
  80390f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803913:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803917:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80391b:	48 89 d6             	mov    %rdx,%rsi
  80391e:	48 89 c7             	mov    %rax,%rdi
  803921:	48 b8 fd 37 80 00 00 	movabs $0x8037fd,%rax
  803928:	00 00 00 
  80392b:	ff d0                	callq  *%rax
  80392d:	c9                   	leaveq 
  80392e:	c3                   	retq   

000000000080392f <devpipe_read>:
  80392f:	55                   	push   %rbp
  803930:	48 89 e5             	mov    %rsp,%rbp
  803933:	48 83 ec 40          	sub    $0x40,%rsp
  803937:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80393b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80393f:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803943:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803947:	48 89 c7             	mov    %rax,%rdi
  80394a:	48 b8 e9 1d 80 00 00 	movabs $0x801de9,%rax
  803951:	00 00 00 
  803954:	ff d0                	callq  *%rax
  803956:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80395a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80395e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803962:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803969:	00 
  80396a:	e9 90 00 00 00       	jmpq   8039ff <devpipe_read+0xd0>
  80396f:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  803974:	74 09                	je     80397f <devpipe_read+0x50>
  803976:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80397a:	e9 8e 00 00 00       	jmpq   803a0d <devpipe_read+0xde>
  80397f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803983:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803987:	48 89 d6             	mov    %rdx,%rsi
  80398a:	48 89 c7             	mov    %rax,%rdi
  80398d:	48 b8 fd 37 80 00 00 	movabs $0x8037fd,%rax
  803994:	00 00 00 
  803997:	ff d0                	callq  *%rax
  803999:	85 c0                	test   %eax,%eax
  80399b:	74 07                	je     8039a4 <devpipe_read+0x75>
  80399d:	b8 00 00 00 00       	mov    $0x0,%eax
  8039a2:	eb 69                	jmp    803a0d <devpipe_read+0xde>
  8039a4:	48 b8 8d 19 80 00 00 	movabs $0x80198d,%rax
  8039ab:	00 00 00 
  8039ae:	ff d0                	callq  *%rax
  8039b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039b4:	8b 10                	mov    (%rax),%edx
  8039b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039ba:	8b 40 04             	mov    0x4(%rax),%eax
  8039bd:	39 c2                	cmp    %eax,%edx
  8039bf:	74 ae                	je     80396f <devpipe_read+0x40>
  8039c1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8039c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039c9:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8039cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039d1:	8b 00                	mov    (%rax),%eax
  8039d3:	99                   	cltd   
  8039d4:	c1 ea 1b             	shr    $0x1b,%edx
  8039d7:	01 d0                	add    %edx,%eax
  8039d9:	83 e0 1f             	and    $0x1f,%eax
  8039dc:	29 d0                	sub    %edx,%eax
  8039de:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8039e2:	48 98                	cltq   
  8039e4:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8039e9:	88 01                	mov    %al,(%rcx)
  8039eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039ef:	8b 00                	mov    (%rax),%eax
  8039f1:	8d 50 01             	lea    0x1(%rax),%edx
  8039f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039f8:	89 10                	mov    %edx,(%rax)
  8039fa:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8039ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a03:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803a07:	72 a7                	jb     8039b0 <devpipe_read+0x81>
  803a09:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a0d:	c9                   	leaveq 
  803a0e:	c3                   	retq   

0000000000803a0f <devpipe_write>:
  803a0f:	55                   	push   %rbp
  803a10:	48 89 e5             	mov    %rsp,%rbp
  803a13:	48 83 ec 40          	sub    $0x40,%rsp
  803a17:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803a1b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803a1f:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803a23:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a27:	48 89 c7             	mov    %rax,%rdi
  803a2a:	48 b8 e9 1d 80 00 00 	movabs $0x801de9,%rax
  803a31:	00 00 00 
  803a34:	ff d0                	callq  *%rax
  803a36:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803a3a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a3e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803a42:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803a49:	00 
  803a4a:	e9 8f 00 00 00       	jmpq   803ade <devpipe_write+0xcf>
  803a4f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803a53:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a57:	48 89 d6             	mov    %rdx,%rsi
  803a5a:	48 89 c7             	mov    %rax,%rdi
  803a5d:	48 b8 fd 37 80 00 00 	movabs $0x8037fd,%rax
  803a64:	00 00 00 
  803a67:	ff d0                	callq  *%rax
  803a69:	85 c0                	test   %eax,%eax
  803a6b:	74 07                	je     803a74 <devpipe_write+0x65>
  803a6d:	b8 00 00 00 00       	mov    $0x0,%eax
  803a72:	eb 78                	jmp    803aec <devpipe_write+0xdd>
  803a74:	48 b8 8d 19 80 00 00 	movabs $0x80198d,%rax
  803a7b:	00 00 00 
  803a7e:	ff d0                	callq  *%rax
  803a80:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a84:	8b 40 04             	mov    0x4(%rax),%eax
  803a87:	48 63 d0             	movslq %eax,%rdx
  803a8a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a8e:	8b 00                	mov    (%rax),%eax
  803a90:	48 98                	cltq   
  803a92:	48 83 c0 20          	add    $0x20,%rax
  803a96:	48 39 c2             	cmp    %rax,%rdx
  803a99:	73 b4                	jae    803a4f <devpipe_write+0x40>
  803a9b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a9f:	8b 40 04             	mov    0x4(%rax),%eax
  803aa2:	99                   	cltd   
  803aa3:	c1 ea 1b             	shr    $0x1b,%edx
  803aa6:	01 d0                	add    %edx,%eax
  803aa8:	83 e0 1f             	and    $0x1f,%eax
  803aab:	29 d0                	sub    %edx,%eax
  803aad:	89 c6                	mov    %eax,%esi
  803aaf:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803ab3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ab7:	48 01 d0             	add    %rdx,%rax
  803aba:	0f b6 08             	movzbl (%rax),%ecx
  803abd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803ac1:	48 63 c6             	movslq %esi,%rax
  803ac4:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803ac8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803acc:	8b 40 04             	mov    0x4(%rax),%eax
  803acf:	8d 50 01             	lea    0x1(%rax),%edx
  803ad2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ad6:	89 50 04             	mov    %edx,0x4(%rax)
  803ad9:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803ade:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ae2:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803ae6:	72 98                	jb     803a80 <devpipe_write+0x71>
  803ae8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803aec:	c9                   	leaveq 
  803aed:	c3                   	retq   

0000000000803aee <devpipe_stat>:
  803aee:	55                   	push   %rbp
  803aef:	48 89 e5             	mov    %rsp,%rbp
  803af2:	48 83 ec 20          	sub    $0x20,%rsp
  803af6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803afa:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803afe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b02:	48 89 c7             	mov    %rax,%rdi
  803b05:	48 b8 e9 1d 80 00 00 	movabs $0x801de9,%rax
  803b0c:	00 00 00 
  803b0f:	ff d0                	callq  *%rax
  803b11:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803b15:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b19:	48 be ce 4e 80 00 00 	movabs $0x804ece,%rsi
  803b20:	00 00 00 
  803b23:	48 89 c7             	mov    %rax,%rdi
  803b26:	48 b8 9a 10 80 00 00 	movabs $0x80109a,%rax
  803b2d:	00 00 00 
  803b30:	ff d0                	callq  *%rax
  803b32:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b36:	8b 50 04             	mov    0x4(%rax),%edx
  803b39:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b3d:	8b 00                	mov    (%rax),%eax
  803b3f:	29 c2                	sub    %eax,%edx
  803b41:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b45:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803b4b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b4f:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803b56:	00 00 00 
  803b59:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b5d:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  803b64:	00 00 00 
  803b67:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  803b6e:	b8 00 00 00 00       	mov    $0x0,%eax
  803b73:	c9                   	leaveq 
  803b74:	c3                   	retq   

0000000000803b75 <devpipe_close>:
  803b75:	55                   	push   %rbp
  803b76:	48 89 e5             	mov    %rsp,%rbp
  803b79:	48 83 ec 10          	sub    $0x10,%rsp
  803b7d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b81:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b85:	48 89 c6             	mov    %rax,%rsi
  803b88:	bf 00 00 00 00       	mov    $0x0,%edi
  803b8d:	48 b8 7c 1a 80 00 00 	movabs $0x801a7c,%rax
  803b94:	00 00 00 
  803b97:	ff d0                	callq  *%rax
  803b99:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b9d:	48 89 c7             	mov    %rax,%rdi
  803ba0:	48 b8 e9 1d 80 00 00 	movabs $0x801de9,%rax
  803ba7:	00 00 00 
  803baa:	ff d0                	callq  *%rax
  803bac:	48 89 c6             	mov    %rax,%rsi
  803baf:	bf 00 00 00 00       	mov    $0x0,%edi
  803bb4:	48 b8 7c 1a 80 00 00 	movabs $0x801a7c,%rax
  803bbb:	00 00 00 
  803bbe:	ff d0                	callq  *%rax
  803bc0:	c9                   	leaveq 
  803bc1:	c3                   	retq   

0000000000803bc2 <cputchar>:
  803bc2:	55                   	push   %rbp
  803bc3:	48 89 e5             	mov    %rsp,%rbp
  803bc6:	48 83 ec 20          	sub    $0x20,%rsp
  803bca:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803bcd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bd0:	88 45 ff             	mov    %al,-0x1(%rbp)
  803bd3:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  803bd7:	be 01 00 00 00       	mov    $0x1,%esi
  803bdc:	48 89 c7             	mov    %rax,%rdi
  803bdf:	48 b8 82 18 80 00 00 	movabs $0x801882,%rax
  803be6:	00 00 00 
  803be9:	ff d0                	callq  *%rax
  803beb:	90                   	nop
  803bec:	c9                   	leaveq 
  803bed:	c3                   	retq   

0000000000803bee <getchar>:
  803bee:	55                   	push   %rbp
  803bef:	48 89 e5             	mov    %rsp,%rbp
  803bf2:	48 83 ec 10          	sub    $0x10,%rsp
  803bf6:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  803bfa:	ba 01 00 00 00       	mov    $0x1,%edx
  803bff:	48 89 c6             	mov    %rax,%rsi
  803c02:	bf 00 00 00 00       	mov    $0x0,%edi
  803c07:	48 b8 e1 22 80 00 00 	movabs $0x8022e1,%rax
  803c0e:	00 00 00 
  803c11:	ff d0                	callq  *%rax
  803c13:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c16:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c1a:	79 05                	jns    803c21 <getchar+0x33>
  803c1c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c1f:	eb 14                	jmp    803c35 <getchar+0x47>
  803c21:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c25:	7f 07                	jg     803c2e <getchar+0x40>
  803c27:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  803c2c:	eb 07                	jmp    803c35 <getchar+0x47>
  803c2e:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  803c32:	0f b6 c0             	movzbl %al,%eax
  803c35:	c9                   	leaveq 
  803c36:	c3                   	retq   

0000000000803c37 <iscons>:
  803c37:	55                   	push   %rbp
  803c38:	48 89 e5             	mov    %rsp,%rbp
  803c3b:	48 83 ec 20          	sub    $0x20,%rsp
  803c3f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c42:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803c46:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c49:	48 89 d6             	mov    %rdx,%rsi
  803c4c:	89 c7                	mov    %eax,%edi
  803c4e:	48 b8 ac 1e 80 00 00 	movabs $0x801eac,%rax
  803c55:	00 00 00 
  803c58:	ff d0                	callq  *%rax
  803c5a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c5d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c61:	79 05                	jns    803c68 <iscons+0x31>
  803c63:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c66:	eb 1a                	jmp    803c82 <iscons+0x4b>
  803c68:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c6c:	8b 10                	mov    (%rax),%edx
  803c6e:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  803c75:	00 00 00 
  803c78:	8b 00                	mov    (%rax),%eax
  803c7a:	39 c2                	cmp    %eax,%edx
  803c7c:	0f 94 c0             	sete   %al
  803c7f:	0f b6 c0             	movzbl %al,%eax
  803c82:	c9                   	leaveq 
  803c83:	c3                   	retq   

0000000000803c84 <opencons>:
  803c84:	55                   	push   %rbp
  803c85:	48 89 e5             	mov    %rsp,%rbp
  803c88:	48 83 ec 10          	sub    $0x10,%rsp
  803c8c:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803c90:	48 89 c7             	mov    %rax,%rdi
  803c93:	48 b8 14 1e 80 00 00 	movabs $0x801e14,%rax
  803c9a:	00 00 00 
  803c9d:	ff d0                	callq  *%rax
  803c9f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ca2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ca6:	79 05                	jns    803cad <opencons+0x29>
  803ca8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cab:	eb 5b                	jmp    803d08 <opencons+0x84>
  803cad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cb1:	ba 07 04 00 00       	mov    $0x407,%edx
  803cb6:	48 89 c6             	mov    %rax,%rsi
  803cb9:	bf 00 00 00 00       	mov    $0x0,%edi
  803cbe:	48 b8 ca 19 80 00 00 	movabs $0x8019ca,%rax
  803cc5:	00 00 00 
  803cc8:	ff d0                	callq  *%rax
  803cca:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ccd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cd1:	79 05                	jns    803cd8 <opencons+0x54>
  803cd3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cd6:	eb 30                	jmp    803d08 <opencons+0x84>
  803cd8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cdc:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  803ce3:	00 00 00 
  803ce6:	8b 12                	mov    (%rdx),%edx
  803ce8:	89 10                	mov    %edx,(%rax)
  803cea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cee:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803cf5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cf9:	48 89 c7             	mov    %rax,%rdi
  803cfc:	48 b8 c6 1d 80 00 00 	movabs $0x801dc6,%rax
  803d03:	00 00 00 
  803d06:	ff d0                	callq  *%rax
  803d08:	c9                   	leaveq 
  803d09:	c3                   	retq   

0000000000803d0a <devcons_read>:
  803d0a:	55                   	push   %rbp
  803d0b:	48 89 e5             	mov    %rsp,%rbp
  803d0e:	48 83 ec 30          	sub    $0x30,%rsp
  803d12:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803d16:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803d1a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803d1e:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803d23:	75 13                	jne    803d38 <devcons_read+0x2e>
  803d25:	b8 00 00 00 00       	mov    $0x0,%eax
  803d2a:	eb 49                	jmp    803d75 <devcons_read+0x6b>
  803d2c:	48 b8 8d 19 80 00 00 	movabs $0x80198d,%rax
  803d33:	00 00 00 
  803d36:	ff d0                	callq  *%rax
  803d38:	48 b8 cf 18 80 00 00 	movabs $0x8018cf,%rax
  803d3f:	00 00 00 
  803d42:	ff d0                	callq  *%rax
  803d44:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d47:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d4b:	74 df                	je     803d2c <devcons_read+0x22>
  803d4d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d51:	79 05                	jns    803d58 <devcons_read+0x4e>
  803d53:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d56:	eb 1d                	jmp    803d75 <devcons_read+0x6b>
  803d58:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  803d5c:	75 07                	jne    803d65 <devcons_read+0x5b>
  803d5e:	b8 00 00 00 00       	mov    $0x0,%eax
  803d63:	eb 10                	jmp    803d75 <devcons_read+0x6b>
  803d65:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d68:	89 c2                	mov    %eax,%edx
  803d6a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803d6e:	88 10                	mov    %dl,(%rax)
  803d70:	b8 01 00 00 00       	mov    $0x1,%eax
  803d75:	c9                   	leaveq 
  803d76:	c3                   	retq   

0000000000803d77 <devcons_write>:
  803d77:	55                   	push   %rbp
  803d78:	48 89 e5             	mov    %rsp,%rbp
  803d7b:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  803d82:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  803d89:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  803d90:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  803d97:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803d9e:	eb 76                	jmp    803e16 <devcons_write+0x9f>
  803da0:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  803da7:	89 c2                	mov    %eax,%edx
  803da9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dac:	29 c2                	sub    %eax,%edx
  803dae:	89 d0                	mov    %edx,%eax
  803db0:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803db3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803db6:	83 f8 7f             	cmp    $0x7f,%eax
  803db9:	76 07                	jbe    803dc2 <devcons_write+0x4b>
  803dbb:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  803dc2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803dc5:	48 63 d0             	movslq %eax,%rdx
  803dc8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dcb:	48 63 c8             	movslq %eax,%rcx
  803dce:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  803dd5:	48 01 c1             	add    %rax,%rcx
  803dd8:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803ddf:	48 89 ce             	mov    %rcx,%rsi
  803de2:	48 89 c7             	mov    %rax,%rdi
  803de5:	48 b8 bf 13 80 00 00 	movabs $0x8013bf,%rax
  803dec:	00 00 00 
  803def:	ff d0                	callq  *%rax
  803df1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803df4:	48 63 d0             	movslq %eax,%rdx
  803df7:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803dfe:	48 89 d6             	mov    %rdx,%rsi
  803e01:	48 89 c7             	mov    %rax,%rdi
  803e04:	48 b8 82 18 80 00 00 	movabs $0x801882,%rax
  803e0b:	00 00 00 
  803e0e:	ff d0                	callq  *%rax
  803e10:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e13:	01 45 fc             	add    %eax,-0x4(%rbp)
  803e16:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e19:	48 98                	cltq   
  803e1b:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  803e22:	0f 82 78 ff ff ff    	jb     803da0 <devcons_write+0x29>
  803e28:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e2b:	c9                   	leaveq 
  803e2c:	c3                   	retq   

0000000000803e2d <devcons_close>:
  803e2d:	55                   	push   %rbp
  803e2e:	48 89 e5             	mov    %rsp,%rbp
  803e31:	48 83 ec 08          	sub    $0x8,%rsp
  803e35:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803e39:	b8 00 00 00 00       	mov    $0x0,%eax
  803e3e:	c9                   	leaveq 
  803e3f:	c3                   	retq   

0000000000803e40 <devcons_stat>:
  803e40:	55                   	push   %rbp
  803e41:	48 89 e5             	mov    %rsp,%rbp
  803e44:	48 83 ec 10          	sub    $0x10,%rsp
  803e48:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803e4c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803e50:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e54:	48 be da 4e 80 00 00 	movabs $0x804eda,%rsi
  803e5b:	00 00 00 
  803e5e:	48 89 c7             	mov    %rax,%rdi
  803e61:	48 b8 9a 10 80 00 00 	movabs $0x80109a,%rax
  803e68:	00 00 00 
  803e6b:	ff d0                	callq  *%rax
  803e6d:	b8 00 00 00 00       	mov    $0x0,%eax
  803e72:	c9                   	leaveq 
  803e73:	c3                   	retq   

0000000000803e74 <_panic>:
  803e74:	55                   	push   %rbp
  803e75:	48 89 e5             	mov    %rsp,%rbp
  803e78:	53                   	push   %rbx
  803e79:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  803e80:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  803e87:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  803e8d:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803e94:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  803e9b:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  803ea2:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  803ea9:	84 c0                	test   %al,%al
  803eab:	74 23                	je     803ed0 <_panic+0x5c>
  803ead:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  803eb4:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  803eb8:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  803ebc:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  803ec0:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  803ec4:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  803ec8:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  803ecc:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  803ed0:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  803ed7:	00 00 00 
  803eda:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  803ee1:	00 00 00 
  803ee4:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803ee8:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  803eef:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  803ef6:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803efd:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  803f04:	00 00 00 
  803f07:	48 8b 18             	mov    (%rax),%rbx
  803f0a:	48 b8 51 19 80 00 00 	movabs $0x801951,%rax
  803f11:	00 00 00 
  803f14:	ff d0                	callq  *%rax
  803f16:	89 c6                	mov    %eax,%esi
  803f18:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  803f1e:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803f25:	41 89 d0             	mov    %edx,%r8d
  803f28:	48 89 c1             	mov    %rax,%rcx
  803f2b:	48 89 da             	mov    %rbx,%rdx
  803f2e:	48 bf e8 4e 80 00 00 	movabs $0x804ee8,%rdi
  803f35:	00 00 00 
  803f38:	b8 00 00 00 00       	mov    $0x0,%eax
  803f3d:	49 b9 0a 05 80 00 00 	movabs $0x80050a,%r9
  803f44:	00 00 00 
  803f47:	41 ff d1             	callq  *%r9
  803f4a:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  803f51:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  803f58:	48 89 d6             	mov    %rdx,%rsi
  803f5b:	48 89 c7             	mov    %rax,%rdi
  803f5e:	48 b8 5e 04 80 00 00 	movabs $0x80045e,%rax
  803f65:	00 00 00 
  803f68:	ff d0                	callq  *%rax
  803f6a:	48 bf 0b 4f 80 00 00 	movabs $0x804f0b,%rdi
  803f71:	00 00 00 
  803f74:	b8 00 00 00 00       	mov    $0x0,%eax
  803f79:	48 ba 0a 05 80 00 00 	movabs $0x80050a,%rdx
  803f80:	00 00 00 
  803f83:	ff d2                	callq  *%rdx
  803f85:	cc                   	int3   
  803f86:	eb fd                	jmp    803f85 <_panic+0x111>

0000000000803f88 <ipc_recv>:
  803f88:	55                   	push   %rbp
  803f89:	48 89 e5             	mov    %rsp,%rbp
  803f8c:	48 83 ec 30          	sub    $0x30,%rsp
  803f90:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803f94:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f98:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803f9c:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803fa1:	75 0e                	jne    803fb1 <ipc_recv+0x29>
  803fa3:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803faa:	00 00 00 
  803fad:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803fb1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fb5:	48 89 c7             	mov    %rax,%rdi
  803fb8:	48 b8 04 1c 80 00 00 	movabs $0x801c04,%rax
  803fbf:	00 00 00 
  803fc2:	ff d0                	callq  *%rax
  803fc4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803fc7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803fcb:	79 27                	jns    803ff4 <ipc_recv+0x6c>
  803fcd:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803fd2:	74 0a                	je     803fde <ipc_recv+0x56>
  803fd4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803fd8:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803fde:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803fe3:	74 0a                	je     803fef <ipc_recv+0x67>
  803fe5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803fe9:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803fef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ff2:	eb 53                	jmp    804047 <ipc_recv+0xbf>
  803ff4:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803ff9:	74 19                	je     804014 <ipc_recv+0x8c>
  803ffb:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  804002:	00 00 00 
  804005:	48 8b 00             	mov    (%rax),%rax
  804008:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  80400e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804012:	89 10                	mov    %edx,(%rax)
  804014:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804019:	74 19                	je     804034 <ipc_recv+0xac>
  80401b:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  804022:	00 00 00 
  804025:	48 8b 00             	mov    (%rax),%rax
  804028:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  80402e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804032:	89 10                	mov    %edx,(%rax)
  804034:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80403b:	00 00 00 
  80403e:	48 8b 00             	mov    (%rax),%rax
  804041:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804047:	c9                   	leaveq 
  804048:	c3                   	retq   

0000000000804049 <ipc_send>:
  804049:	55                   	push   %rbp
  80404a:	48 89 e5             	mov    %rsp,%rbp
  80404d:	48 83 ec 30          	sub    $0x30,%rsp
  804051:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804054:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804057:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  80405b:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80405e:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804063:	75 1c                	jne    804081 <ipc_send+0x38>
  804065:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80406c:	00 00 00 
  80406f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804073:	eb 0c                	jmp    804081 <ipc_send+0x38>
  804075:	48 b8 8d 19 80 00 00 	movabs $0x80198d,%rax
  80407c:	00 00 00 
  80407f:	ff d0                	callq  *%rax
  804081:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804084:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804087:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80408b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80408e:	89 c7                	mov    %eax,%edi
  804090:	48 b8 ad 1b 80 00 00 	movabs $0x801bad,%rax
  804097:	00 00 00 
  80409a:	ff d0                	callq  *%rax
  80409c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80409f:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8040a3:	74 d0                	je     804075 <ipc_send+0x2c>
  8040a5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040a9:	79 30                	jns    8040db <ipc_send+0x92>
  8040ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040ae:	89 c1                	mov    %eax,%ecx
  8040b0:	48 ba 10 4f 80 00 00 	movabs $0x804f10,%rdx
  8040b7:	00 00 00 
  8040ba:	be 44 00 00 00       	mov    $0x44,%esi
  8040bf:	48 bf 26 4f 80 00 00 	movabs $0x804f26,%rdi
  8040c6:	00 00 00 
  8040c9:	b8 00 00 00 00       	mov    $0x0,%eax
  8040ce:	49 b8 74 3e 80 00 00 	movabs $0x803e74,%r8
  8040d5:	00 00 00 
  8040d8:	41 ff d0             	callq  *%r8
  8040db:	90                   	nop
  8040dc:	c9                   	leaveq 
  8040dd:	c3                   	retq   

00000000008040de <ipc_host_recv>:
  8040de:	55                   	push   %rbp
  8040df:	48 89 e5             	mov    %rsp,%rbp
  8040e2:	48 83 ec 10          	sub    $0x10,%rsp
  8040e6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8040ea:	48 ba 38 4f 80 00 00 	movabs $0x804f38,%rdx
  8040f1:	00 00 00 
  8040f4:	be 4e 00 00 00       	mov    $0x4e,%esi
  8040f9:	48 bf 26 4f 80 00 00 	movabs $0x804f26,%rdi
  804100:	00 00 00 
  804103:	b8 00 00 00 00       	mov    $0x0,%eax
  804108:	48 b9 74 3e 80 00 00 	movabs $0x803e74,%rcx
  80410f:	00 00 00 
  804112:	ff d1                	callq  *%rcx

0000000000804114 <ipc_host_send>:
  804114:	55                   	push   %rbp
  804115:	48 89 e5             	mov    %rsp,%rbp
  804118:	48 83 ec 20          	sub    $0x20,%rsp
  80411c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80411f:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804122:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  804126:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804129:	48 ba 58 4f 80 00 00 	movabs $0x804f58,%rdx
  804130:	00 00 00 
  804133:	be 58 00 00 00       	mov    $0x58,%esi
  804138:	48 bf 26 4f 80 00 00 	movabs $0x804f26,%rdi
  80413f:	00 00 00 
  804142:	b8 00 00 00 00       	mov    $0x0,%eax
  804147:	48 b9 74 3e 80 00 00 	movabs $0x803e74,%rcx
  80414e:	00 00 00 
  804151:	ff d1                	callq  *%rcx

0000000000804153 <ipc_find_env>:
  804153:	55                   	push   %rbp
  804154:	48 89 e5             	mov    %rsp,%rbp
  804157:	48 83 ec 18          	sub    $0x18,%rsp
  80415b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80415e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804165:	eb 4d                	jmp    8041b4 <ipc_find_env+0x61>
  804167:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80416e:	00 00 00 
  804171:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804174:	48 98                	cltq   
  804176:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80417d:	48 01 d0             	add    %rdx,%rax
  804180:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804186:	8b 00                	mov    (%rax),%eax
  804188:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80418b:	75 23                	jne    8041b0 <ipc_find_env+0x5d>
  80418d:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804194:	00 00 00 
  804197:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80419a:	48 98                	cltq   
  80419c:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8041a3:	48 01 d0             	add    %rdx,%rax
  8041a6:	48 05 c8 00 00 00    	add    $0xc8,%rax
  8041ac:	8b 00                	mov    (%rax),%eax
  8041ae:	eb 12                	jmp    8041c2 <ipc_find_env+0x6f>
  8041b0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8041b4:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  8041bb:	7e aa                	jle    804167 <ipc_find_env+0x14>
  8041bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8041c2:	c9                   	leaveq 
  8041c3:	c3                   	retq   

00000000008041c4 <pageref>:
  8041c4:	55                   	push   %rbp
  8041c5:	48 89 e5             	mov    %rsp,%rbp
  8041c8:	48 83 ec 18          	sub    $0x18,%rsp
  8041cc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8041d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8041d4:	48 c1 e8 15          	shr    $0x15,%rax
  8041d8:	48 89 c2             	mov    %rax,%rdx
  8041db:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8041e2:	01 00 00 
  8041e5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8041e9:	83 e0 01             	and    $0x1,%eax
  8041ec:	48 85 c0             	test   %rax,%rax
  8041ef:	75 07                	jne    8041f8 <pageref+0x34>
  8041f1:	b8 00 00 00 00       	mov    $0x0,%eax
  8041f6:	eb 56                	jmp    80424e <pageref+0x8a>
  8041f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8041fc:	48 c1 e8 0c          	shr    $0xc,%rax
  804200:	48 89 c2             	mov    %rax,%rdx
  804203:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80420a:	01 00 00 
  80420d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804211:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804215:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804219:	83 e0 01             	and    $0x1,%eax
  80421c:	48 85 c0             	test   %rax,%rax
  80421f:	75 07                	jne    804228 <pageref+0x64>
  804221:	b8 00 00 00 00       	mov    $0x0,%eax
  804226:	eb 26                	jmp    80424e <pageref+0x8a>
  804228:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80422c:	48 c1 e8 0c          	shr    $0xc,%rax
  804230:	48 89 c2             	mov    %rax,%rdx
  804233:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  80423a:	00 00 00 
  80423d:	48 c1 e2 04          	shl    $0x4,%rdx
  804241:	48 01 d0             	add    %rdx,%rax
  804244:	48 83 c0 08          	add    $0x8,%rax
  804248:	0f b7 00             	movzwl (%rax),%eax
  80424b:	0f b7 c0             	movzwl %ax,%eax
  80424e:	c9                   	leaveq 
  80424f:	c3                   	retq   

0000000000804250 <inet_addr>:
  804250:	55                   	push   %rbp
  804251:	48 89 e5             	mov    %rsp,%rbp
  804254:	48 83 ec 20          	sub    $0x20,%rsp
  804258:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80425c:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
  804260:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804264:	48 89 d6             	mov    %rdx,%rsi
  804267:	48 89 c7             	mov    %rax,%rdi
  80426a:	48 b8 86 42 80 00 00 	movabs $0x804286,%rax
  804271:	00 00 00 
  804274:	ff d0                	callq  *%rax
  804276:	85 c0                	test   %eax,%eax
  804278:	74 05                	je     80427f <inet_addr+0x2f>
  80427a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80427d:	eb 05                	jmp    804284 <inet_addr+0x34>
  80427f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  804284:	c9                   	leaveq 
  804285:	c3                   	retq   

0000000000804286 <inet_aton>:
  804286:	55                   	push   %rbp
  804287:	48 89 e5             	mov    %rsp,%rbp
  80428a:	48 83 ec 40          	sub    $0x40,%rsp
  80428e:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  804292:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  804296:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80429a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80429e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8042a2:	0f b6 00             	movzbl (%rax),%eax
  8042a5:	0f be c0             	movsbl %al,%eax
  8042a8:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8042ab:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8042ae:	3c 2f                	cmp    $0x2f,%al
  8042b0:	76 07                	jbe    8042b9 <inet_aton+0x33>
  8042b2:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8042b5:	3c 39                	cmp    $0x39,%al
  8042b7:	76 0a                	jbe    8042c3 <inet_aton+0x3d>
  8042b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8042be:	e9 6a 02 00 00       	jmpq   80452d <inet_aton+0x2a7>
  8042c3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8042ca:	c7 45 f8 0a 00 00 00 	movl   $0xa,-0x8(%rbp)
  8042d1:	83 7d f4 30          	cmpl   $0x30,-0xc(%rbp)
  8042d5:	75 40                	jne    804317 <inet_aton+0x91>
  8042d7:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  8042dc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8042e0:	0f b6 00             	movzbl (%rax),%eax
  8042e3:	0f be c0             	movsbl %al,%eax
  8042e6:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8042e9:	83 7d f4 78          	cmpl   $0x78,-0xc(%rbp)
  8042ed:	74 06                	je     8042f5 <inet_aton+0x6f>
  8042ef:	83 7d f4 58          	cmpl   $0x58,-0xc(%rbp)
  8042f3:	75 1b                	jne    804310 <inet_aton+0x8a>
  8042f5:	c7 45 f8 10 00 00 00 	movl   $0x10,-0x8(%rbp)
  8042fc:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  804301:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804305:	0f b6 00             	movzbl (%rax),%eax
  804308:	0f be c0             	movsbl %al,%eax
  80430b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80430e:	eb 07                	jmp    804317 <inet_aton+0x91>
  804310:	c7 45 f8 08 00 00 00 	movl   $0x8,-0x8(%rbp)
  804317:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80431a:	3c 2f                	cmp    $0x2f,%al
  80431c:	76 2f                	jbe    80434d <inet_aton+0xc7>
  80431e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804321:	3c 39                	cmp    $0x39,%al
  804323:	77 28                	ja     80434d <inet_aton+0xc7>
  804325:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804328:	0f af 45 fc          	imul   -0x4(%rbp),%eax
  80432c:	89 c2                	mov    %eax,%edx
  80432e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804331:	01 d0                	add    %edx,%eax
  804333:	83 e8 30             	sub    $0x30,%eax
  804336:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804339:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  80433e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804342:	0f b6 00             	movzbl (%rax),%eax
  804345:	0f be c0             	movsbl %al,%eax
  804348:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80434b:	eb 73                	jmp    8043c0 <inet_aton+0x13a>
  80434d:	83 7d f8 10          	cmpl   $0x10,-0x8(%rbp)
  804351:	75 72                	jne    8043c5 <inet_aton+0x13f>
  804353:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804356:	3c 2f                	cmp    $0x2f,%al
  804358:	76 07                	jbe    804361 <inet_aton+0xdb>
  80435a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80435d:	3c 39                	cmp    $0x39,%al
  80435f:	76 1c                	jbe    80437d <inet_aton+0xf7>
  804361:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804364:	3c 60                	cmp    $0x60,%al
  804366:	76 07                	jbe    80436f <inet_aton+0xe9>
  804368:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80436b:	3c 66                	cmp    $0x66,%al
  80436d:	76 0e                	jbe    80437d <inet_aton+0xf7>
  80436f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804372:	3c 40                	cmp    $0x40,%al
  804374:	76 4f                	jbe    8043c5 <inet_aton+0x13f>
  804376:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804379:	3c 46                	cmp    $0x46,%al
  80437b:	77 48                	ja     8043c5 <inet_aton+0x13f>
  80437d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804380:	c1 e0 04             	shl    $0x4,%eax
  804383:	89 c2                	mov    %eax,%edx
  804385:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804388:	8d 48 0a             	lea    0xa(%rax),%ecx
  80438b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80438e:	3c 60                	cmp    $0x60,%al
  804390:	76 0e                	jbe    8043a0 <inet_aton+0x11a>
  804392:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804395:	3c 7a                	cmp    $0x7a,%al
  804397:	77 07                	ja     8043a0 <inet_aton+0x11a>
  804399:	b8 61 00 00 00       	mov    $0x61,%eax
  80439e:	eb 05                	jmp    8043a5 <inet_aton+0x11f>
  8043a0:	b8 41 00 00 00       	mov    $0x41,%eax
  8043a5:	29 c1                	sub    %eax,%ecx
  8043a7:	89 c8                	mov    %ecx,%eax
  8043a9:	09 d0                	or     %edx,%eax
  8043ab:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8043ae:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  8043b3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8043b7:	0f b6 00             	movzbl (%rax),%eax
  8043ba:	0f be c0             	movsbl %al,%eax
  8043bd:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8043c0:	e9 52 ff ff ff       	jmpq   804317 <inet_aton+0x91>
  8043c5:	83 7d f4 2e          	cmpl   $0x2e,-0xc(%rbp)
  8043c9:	75 40                	jne    80440b <inet_aton+0x185>
  8043cb:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8043cf:	48 83 c0 0c          	add    $0xc,%rax
  8043d3:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  8043d7:	77 0a                	ja     8043e3 <inet_aton+0x15d>
  8043d9:	b8 00 00 00 00       	mov    $0x0,%eax
  8043de:	e9 4a 01 00 00       	jmpq   80452d <inet_aton+0x2a7>
  8043e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043e7:	48 8d 50 04          	lea    0x4(%rax),%rdx
  8043eb:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8043ef:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8043f2:	89 10                	mov    %edx,(%rax)
  8043f4:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  8043f9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8043fd:	0f b6 00             	movzbl (%rax),%eax
  804400:	0f be c0             	movsbl %al,%eax
  804403:	89 45 f4             	mov    %eax,-0xc(%rbp)
  804406:	e9 a0 fe ff ff       	jmpq   8042ab <inet_aton+0x25>
  80440b:	90                   	nop
  80440c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  804410:	74 3c                	je     80444e <inet_aton+0x1c8>
  804412:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804415:	3c 1f                	cmp    $0x1f,%al
  804417:	76 2b                	jbe    804444 <inet_aton+0x1be>
  804419:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80441c:	84 c0                	test   %al,%al
  80441e:	78 24                	js     804444 <inet_aton+0x1be>
  804420:	83 7d f4 20          	cmpl   $0x20,-0xc(%rbp)
  804424:	74 28                	je     80444e <inet_aton+0x1c8>
  804426:	83 7d f4 0c          	cmpl   $0xc,-0xc(%rbp)
  80442a:	74 22                	je     80444e <inet_aton+0x1c8>
  80442c:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  804430:	74 1c                	je     80444e <inet_aton+0x1c8>
  804432:	83 7d f4 0d          	cmpl   $0xd,-0xc(%rbp)
  804436:	74 16                	je     80444e <inet_aton+0x1c8>
  804438:	83 7d f4 09          	cmpl   $0x9,-0xc(%rbp)
  80443c:	74 10                	je     80444e <inet_aton+0x1c8>
  80443e:	83 7d f4 0b          	cmpl   $0xb,-0xc(%rbp)
  804442:	74 0a                	je     80444e <inet_aton+0x1c8>
  804444:	b8 00 00 00 00       	mov    $0x0,%eax
  804449:	e9 df 00 00 00       	jmpq   80452d <inet_aton+0x2a7>
  80444e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804452:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  804456:	48 29 c2             	sub    %rax,%rdx
  804459:	48 89 d0             	mov    %rdx,%rax
  80445c:	48 c1 f8 02          	sar    $0x2,%rax
  804460:	83 c0 01             	add    $0x1,%eax
  804463:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804466:	83 7d e4 04          	cmpl   $0x4,-0x1c(%rbp)
  80446a:	0f 87 98 00 00 00    	ja     804508 <inet_aton+0x282>
  804470:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  804473:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80447a:	00 
  80447b:	48 b8 78 4f 80 00 00 	movabs $0x804f78,%rax
  804482:	00 00 00 
  804485:	48 01 d0             	add    %rdx,%rax
  804488:	48 8b 00             	mov    (%rax),%rax
  80448b:	ff e0                	jmpq   *%rax
  80448d:	b8 00 00 00 00       	mov    $0x0,%eax
  804492:	e9 96 00 00 00       	jmpq   80452d <inet_aton+0x2a7>
  804497:	81 7d fc ff ff ff 00 	cmpl   $0xffffff,-0x4(%rbp)
  80449e:	76 0a                	jbe    8044aa <inet_aton+0x224>
  8044a0:	b8 00 00 00 00       	mov    $0x0,%eax
  8044a5:	e9 83 00 00 00       	jmpq   80452d <inet_aton+0x2a7>
  8044aa:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8044ad:	c1 e0 18             	shl    $0x18,%eax
  8044b0:	09 45 fc             	or     %eax,-0x4(%rbp)
  8044b3:	eb 53                	jmp    804508 <inet_aton+0x282>
  8044b5:	81 7d fc ff ff 00 00 	cmpl   $0xffff,-0x4(%rbp)
  8044bc:	76 07                	jbe    8044c5 <inet_aton+0x23f>
  8044be:	b8 00 00 00 00       	mov    $0x0,%eax
  8044c3:	eb 68                	jmp    80452d <inet_aton+0x2a7>
  8044c5:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8044c8:	c1 e0 18             	shl    $0x18,%eax
  8044cb:	89 c2                	mov    %eax,%edx
  8044cd:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8044d0:	c1 e0 10             	shl    $0x10,%eax
  8044d3:	09 d0                	or     %edx,%eax
  8044d5:	09 45 fc             	or     %eax,-0x4(%rbp)
  8044d8:	eb 2e                	jmp    804508 <inet_aton+0x282>
  8044da:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
  8044e1:	76 07                	jbe    8044ea <inet_aton+0x264>
  8044e3:	b8 00 00 00 00       	mov    $0x0,%eax
  8044e8:	eb 43                	jmp    80452d <inet_aton+0x2a7>
  8044ea:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8044ed:	c1 e0 18             	shl    $0x18,%eax
  8044f0:	89 c2                	mov    %eax,%edx
  8044f2:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8044f5:	c1 e0 10             	shl    $0x10,%eax
  8044f8:	09 c2                	or     %eax,%edx
  8044fa:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8044fd:	c1 e0 08             	shl    $0x8,%eax
  804500:	09 d0                	or     %edx,%eax
  804502:	09 45 fc             	or     %eax,-0x4(%rbp)
  804505:	eb 01                	jmp    804508 <inet_aton+0x282>
  804507:	90                   	nop
  804508:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
  80450d:	74 19                	je     804528 <inet_aton+0x2a2>
  80450f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804512:	89 c7                	mov    %eax,%edi
  804514:	48 b8 a6 46 80 00 00 	movabs $0x8046a6,%rax
  80451b:	00 00 00 
  80451e:	ff d0                	callq  *%rax
  804520:	89 c2                	mov    %eax,%edx
  804522:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  804526:	89 10                	mov    %edx,(%rax)
  804528:	b8 01 00 00 00       	mov    $0x1,%eax
  80452d:	c9                   	leaveq 
  80452e:	c3                   	retq   

000000000080452f <inet_ntoa>:
  80452f:	55                   	push   %rbp
  804530:	48 89 e5             	mov    %rsp,%rbp
  804533:	48 83 ec 28          	sub    $0x28,%rsp
  804537:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80453a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80453d:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804540:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  804547:	00 00 00 
  80454a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80454e:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  804552:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804556:	c6 45 ef 00          	movb   $0x0,-0x11(%rbp)
  80455a:	e9 e0 00 00 00       	jmpq   80463f <inet_ntoa+0x110>
  80455f:	c6 45 ee 00          	movb   $0x0,-0x12(%rbp)
  804563:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804567:	0f b6 08             	movzbl (%rax),%ecx
  80456a:	0f b6 d1             	movzbl %cl,%edx
  80456d:	89 d0                	mov    %edx,%eax
  80456f:	c1 e0 02             	shl    $0x2,%eax
  804572:	01 d0                	add    %edx,%eax
  804574:	c1 e0 03             	shl    $0x3,%eax
  804577:	01 d0                	add    %edx,%eax
  804579:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  804580:	01 d0                	add    %edx,%eax
  804582:	66 c1 e8 08          	shr    $0x8,%ax
  804586:	c0 e8 03             	shr    $0x3,%al
  804589:	88 45 ed             	mov    %al,-0x13(%rbp)
  80458c:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  804590:	89 d0                	mov    %edx,%eax
  804592:	c1 e0 02             	shl    $0x2,%eax
  804595:	01 d0                	add    %edx,%eax
  804597:	01 c0                	add    %eax,%eax
  804599:	29 c1                	sub    %eax,%ecx
  80459b:	89 c8                	mov    %ecx,%eax
  80459d:	88 45 ed             	mov    %al,-0x13(%rbp)
  8045a0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045a4:	0f b6 00             	movzbl (%rax),%eax
  8045a7:	0f b6 d0             	movzbl %al,%edx
  8045aa:	89 d0                	mov    %edx,%eax
  8045ac:	c1 e0 02             	shl    $0x2,%eax
  8045af:	01 d0                	add    %edx,%eax
  8045b1:	c1 e0 03             	shl    $0x3,%eax
  8045b4:	01 d0                	add    %edx,%eax
  8045b6:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  8045bd:	01 d0                	add    %edx,%eax
  8045bf:	66 c1 e8 08          	shr    $0x8,%ax
  8045c3:	89 c2                	mov    %eax,%edx
  8045c5:	c0 ea 03             	shr    $0x3,%dl
  8045c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045cc:	88 10                	mov    %dl,(%rax)
  8045ce:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  8045d2:	8d 50 01             	lea    0x1(%rax),%edx
  8045d5:	88 55 ee             	mov    %dl,-0x12(%rbp)
  8045d8:	0f b6 c0             	movzbl %al,%eax
  8045db:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  8045df:	83 c2 30             	add    $0x30,%edx
  8045e2:	48 98                	cltq   
  8045e4:	88 54 05 e5          	mov    %dl,-0x1b(%rbp,%rax,1)
  8045e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045ec:	0f b6 00             	movzbl (%rax),%eax
  8045ef:	84 c0                	test   %al,%al
  8045f1:	0f 85 6c ff ff ff    	jne    804563 <inet_ntoa+0x34>
  8045f7:	eb 1a                	jmp    804613 <inet_ntoa+0xe4>
  8045f9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045fd:	48 8d 50 01          	lea    0x1(%rax),%rdx
  804601:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  804605:	0f b6 55 ee          	movzbl -0x12(%rbp),%edx
  804609:	48 63 d2             	movslq %edx,%rdx
  80460c:	0f b6 54 15 e5       	movzbl -0x1b(%rbp,%rdx,1),%edx
  804611:	88 10                	mov    %dl,(%rax)
  804613:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  804617:	8d 50 ff             	lea    -0x1(%rax),%edx
  80461a:	88 55 ee             	mov    %dl,-0x12(%rbp)
  80461d:	84 c0                	test   %al,%al
  80461f:	75 d8                	jne    8045f9 <inet_ntoa+0xca>
  804621:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804625:	48 8d 50 01          	lea    0x1(%rax),%rdx
  804629:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  80462d:	c6 00 2e             	movb   $0x2e,(%rax)
  804630:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  804635:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  804639:	83 c0 01             	add    $0x1,%eax
  80463c:	88 45 ef             	mov    %al,-0x11(%rbp)
  80463f:	80 7d ef 03          	cmpb   $0x3,-0x11(%rbp)
  804643:	0f 86 16 ff ff ff    	jbe    80455f <inet_ntoa+0x30>
  804649:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
  80464e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804652:	c6 00 00             	movb   $0x0,(%rax)
  804655:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  80465c:	00 00 00 
  80465f:	c9                   	leaveq 
  804660:	c3                   	retq   

0000000000804661 <htons>:
  804661:	55                   	push   %rbp
  804662:	48 89 e5             	mov    %rsp,%rbp
  804665:	48 83 ec 08          	sub    $0x8,%rsp
  804669:	89 f8                	mov    %edi,%eax
  80466b:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  80466f:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  804673:	c1 e0 08             	shl    $0x8,%eax
  804676:	89 c2                	mov    %eax,%edx
  804678:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  80467c:	66 c1 e8 08          	shr    $0x8,%ax
  804680:	09 d0                	or     %edx,%eax
  804682:	c9                   	leaveq 
  804683:	c3                   	retq   

0000000000804684 <ntohs>:
  804684:	55                   	push   %rbp
  804685:	48 89 e5             	mov    %rsp,%rbp
  804688:	48 83 ec 08          	sub    $0x8,%rsp
  80468c:	89 f8                	mov    %edi,%eax
  80468e:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  804692:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  804696:	89 c7                	mov    %eax,%edi
  804698:	48 b8 61 46 80 00 00 	movabs $0x804661,%rax
  80469f:	00 00 00 
  8046a2:	ff d0                	callq  *%rax
  8046a4:	c9                   	leaveq 
  8046a5:	c3                   	retq   

00000000008046a6 <htonl>:
  8046a6:	55                   	push   %rbp
  8046a7:	48 89 e5             	mov    %rsp,%rbp
  8046aa:	48 83 ec 08          	sub    $0x8,%rsp
  8046ae:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8046b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046b4:	c1 e0 18             	shl    $0x18,%eax
  8046b7:	89 c2                	mov    %eax,%edx
  8046b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046bc:	25 00 ff 00 00       	and    $0xff00,%eax
  8046c1:	c1 e0 08             	shl    $0x8,%eax
  8046c4:	09 c2                	or     %eax,%edx
  8046c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046c9:	25 00 00 ff 00       	and    $0xff0000,%eax
  8046ce:	48 c1 e8 08          	shr    $0x8,%rax
  8046d2:	09 c2                	or     %eax,%edx
  8046d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046d7:	c1 e8 18             	shr    $0x18,%eax
  8046da:	09 d0                	or     %edx,%eax
  8046dc:	c9                   	leaveq 
  8046dd:	c3                   	retq   

00000000008046de <ntohl>:
  8046de:	55                   	push   %rbp
  8046df:	48 89 e5             	mov    %rsp,%rbp
  8046e2:	48 83 ec 08          	sub    $0x8,%rsp
  8046e6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8046e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046ec:	89 c7                	mov    %eax,%edi
  8046ee:	48 b8 a6 46 80 00 00 	movabs $0x8046a6,%rax
  8046f5:	00 00 00 
  8046f8:	ff d0                	callq  *%rax
  8046fa:	c9                   	leaveq 
  8046fb:	c3                   	retq   
