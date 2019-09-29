
vmm/guest/obj/user/echo:     file format elf64-x86-64


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
  80003c:	e8 12 01 00 00       	callq  800153 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800052:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  800059:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
  80005d:	7e 38                	jle    800097 <umain+0x54>
  80005f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800063:	48 83 c0 08          	add    $0x8,%rax
  800067:	48 8b 00             	mov    (%rax),%rax
  80006a:	48 be 80 40 80 00 00 	movabs $0x804080,%rsi
  800071:	00 00 00 
  800074:	48 89 c7             	mov    %rax,%rdi
  800077:	48 b8 c9 03 80 00 00 	movabs $0x8003c9,%rax
  80007e:	00 00 00 
  800081:	ff d0                	callq  *%rax
  800083:	85 c0                	test   %eax,%eax
  800085:	75 10                	jne    800097 <umain+0x54>
  800087:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
  80008e:	83 6d ec 01          	subl   $0x1,-0x14(%rbp)
  800092:	48 83 45 e0 08       	addq   $0x8,-0x20(%rbp)
  800097:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  80009e:	eb 7e                	jmp    80011e <umain+0xdb>
  8000a0:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
  8000a4:	7e 20                	jle    8000c6 <umain+0x83>
  8000a6:	ba 01 00 00 00       	mov    $0x1,%edx
  8000ab:	48 be 83 40 80 00 00 	movabs $0x804083,%rsi
  8000b2:	00 00 00 
  8000b5:	bf 01 00 00 00       	mov    $0x1,%edi
  8000ba:	48 b8 f9 15 80 00 00 	movabs $0x8015f9,%rax
  8000c1:	00 00 00 
  8000c4:	ff d0                	callq  *%rax
  8000c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000c9:	48 98                	cltq   
  8000cb:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8000d2:	00 
  8000d3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8000d7:	48 01 d0             	add    %rdx,%rax
  8000da:	48 8b 00             	mov    (%rax),%rax
  8000dd:	48 89 c7             	mov    %rax,%rdi
  8000e0:	48 b8 fb 01 80 00 00 	movabs $0x8001fb,%rax
  8000e7:	00 00 00 
  8000ea:	ff d0                	callq  *%rax
  8000ec:	48 63 d0             	movslq %eax,%rdx
  8000ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000f2:	48 98                	cltq   
  8000f4:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
  8000fb:	00 
  8000fc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800100:	48 01 c8             	add    %rcx,%rax
  800103:	48 8b 00             	mov    (%rax),%rax
  800106:	48 89 c6             	mov    %rax,%rsi
  800109:	bf 01 00 00 00       	mov    $0x1,%edi
  80010e:	48 b8 f9 15 80 00 00 	movabs $0x8015f9,%rax
  800115:	00 00 00 
  800118:	ff d0                	callq  *%rax
  80011a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80011e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800121:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  800124:	0f 8c 76 ff ff ff    	jl     8000a0 <umain+0x5d>
  80012a:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80012e:	75 20                	jne    800150 <umain+0x10d>
  800130:	ba 01 00 00 00       	mov    $0x1,%edx
  800135:	48 be 85 40 80 00 00 	movabs $0x804085,%rsi
  80013c:	00 00 00 
  80013f:	bf 01 00 00 00       	mov    $0x1,%edi
  800144:	48 b8 f9 15 80 00 00 	movabs $0x8015f9,%rax
  80014b:	00 00 00 
  80014e:	ff d0                	callq  *%rax
  800150:	90                   	nop
  800151:	c9                   	leaveq 
  800152:	c3                   	retq   

0000000000800153 <libmain>:
  800153:	55                   	push   %rbp
  800154:	48 89 e5             	mov    %rsp,%rbp
  800157:	48 83 ec 10          	sub    $0x10,%rsp
  80015b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80015e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800162:	48 b8 1e 0b 80 00 00 	movabs $0x800b1e,%rax
  800169:	00 00 00 
  80016c:	ff d0                	callq  *%rax
  80016e:	25 ff 03 00 00       	and    $0x3ff,%eax
  800173:	48 98                	cltq   
  800175:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80017c:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800183:	00 00 00 
  800186:	48 01 c2             	add    %rax,%rdx
  800189:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800190:	00 00 00 
  800193:	48 89 10             	mov    %rdx,(%rax)
  800196:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80019a:	7e 14                	jle    8001b0 <libmain+0x5d>
  80019c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001a0:	48 8b 10             	mov    (%rax),%rdx
  8001a3:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8001aa:	00 00 00 
  8001ad:	48 89 10             	mov    %rdx,(%rax)
  8001b0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8001b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001b7:	48 89 d6             	mov    %rdx,%rsi
  8001ba:	89 c7                	mov    %eax,%edi
  8001bc:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8001c3:	00 00 00 
  8001c6:	ff d0                	callq  *%rax
  8001c8:	48 b8 d7 01 80 00 00 	movabs $0x8001d7,%rax
  8001cf:	00 00 00 
  8001d2:	ff d0                	callq  *%rax
  8001d4:	90                   	nop
  8001d5:	c9                   	leaveq 
  8001d6:	c3                   	retq   

00000000008001d7 <exit>:
  8001d7:	55                   	push   %rbp
  8001d8:	48 89 e5             	mov    %rsp,%rbp
  8001db:	48 b8 d6 12 80 00 00 	movabs $0x8012d6,%rax
  8001e2:	00 00 00 
  8001e5:	ff d0                	callq  *%rax
  8001e7:	bf 00 00 00 00       	mov    $0x0,%edi
  8001ec:	48 b8 d8 0a 80 00 00 	movabs $0x800ad8,%rax
  8001f3:	00 00 00 
  8001f6:	ff d0                	callq  *%rax
  8001f8:	90                   	nop
  8001f9:	5d                   	pop    %rbp
  8001fa:	c3                   	retq   

00000000008001fb <strlen>:
  8001fb:	55                   	push   %rbp
  8001fc:	48 89 e5             	mov    %rsp,%rbp
  8001ff:	48 83 ec 18          	sub    $0x18,%rsp
  800203:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800207:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80020e:	eb 09                	jmp    800219 <strlen+0x1e>
  800210:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800214:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800219:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80021d:	0f b6 00             	movzbl (%rax),%eax
  800220:	84 c0                	test   %al,%al
  800222:	75 ec                	jne    800210 <strlen+0x15>
  800224:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800227:	c9                   	leaveq 
  800228:	c3                   	retq   

0000000000800229 <strnlen>:
  800229:	55                   	push   %rbp
  80022a:	48 89 e5             	mov    %rsp,%rbp
  80022d:	48 83 ec 20          	sub    $0x20,%rsp
  800231:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800235:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800239:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800240:	eb 0e                	jmp    800250 <strnlen+0x27>
  800242:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800246:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80024b:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  800250:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800255:	74 0b                	je     800262 <strnlen+0x39>
  800257:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80025b:	0f b6 00             	movzbl (%rax),%eax
  80025e:	84 c0                	test   %al,%al
  800260:	75 e0                	jne    800242 <strnlen+0x19>
  800262:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800265:	c9                   	leaveq 
  800266:	c3                   	retq   

0000000000800267 <strcpy>:
  800267:	55                   	push   %rbp
  800268:	48 89 e5             	mov    %rsp,%rbp
  80026b:	48 83 ec 20          	sub    $0x20,%rsp
  80026f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800273:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800277:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80027b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80027f:	90                   	nop
  800280:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800284:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800288:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80028c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800290:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  800294:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  800298:	0f b6 12             	movzbl (%rdx),%edx
  80029b:	88 10                	mov    %dl,(%rax)
  80029d:	0f b6 00             	movzbl (%rax),%eax
  8002a0:	84 c0                	test   %al,%al
  8002a2:	75 dc                	jne    800280 <strcpy+0x19>
  8002a4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8002a8:	c9                   	leaveq 
  8002a9:	c3                   	retq   

00000000008002aa <strcat>:
  8002aa:	55                   	push   %rbp
  8002ab:	48 89 e5             	mov    %rsp,%rbp
  8002ae:	48 83 ec 20          	sub    $0x20,%rsp
  8002b2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8002b6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8002ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8002be:	48 89 c7             	mov    %rax,%rdi
  8002c1:	48 b8 fb 01 80 00 00 	movabs $0x8001fb,%rax
  8002c8:	00 00 00 
  8002cb:	ff d0                	callq  *%rax
  8002cd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8002d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002d3:	48 63 d0             	movslq %eax,%rdx
  8002d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8002da:	48 01 c2             	add    %rax,%rdx
  8002dd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8002e1:	48 89 c6             	mov    %rax,%rsi
  8002e4:	48 89 d7             	mov    %rdx,%rdi
  8002e7:	48 b8 67 02 80 00 00 	movabs $0x800267,%rax
  8002ee:	00 00 00 
  8002f1:	ff d0                	callq  *%rax
  8002f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8002f7:	c9                   	leaveq 
  8002f8:	c3                   	retq   

00000000008002f9 <strncpy>:
  8002f9:	55                   	push   %rbp
  8002fa:	48 89 e5             	mov    %rsp,%rbp
  8002fd:	48 83 ec 28          	sub    $0x28,%rsp
  800301:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800305:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800309:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80030d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800311:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800315:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80031c:	00 
  80031d:	eb 2a                	jmp    800349 <strncpy+0x50>
  80031f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800323:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800327:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80032b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80032f:	0f b6 12             	movzbl (%rdx),%edx
  800332:	88 10                	mov    %dl,(%rax)
  800334:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800338:	0f b6 00             	movzbl (%rax),%eax
  80033b:	84 c0                	test   %al,%al
  80033d:	74 05                	je     800344 <strncpy+0x4b>
  80033f:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  800344:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  800349:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80034d:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800351:	72 cc                	jb     80031f <strncpy+0x26>
  800353:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800357:	c9                   	leaveq 
  800358:	c3                   	retq   

0000000000800359 <strlcpy>:
  800359:	55                   	push   %rbp
  80035a:	48 89 e5             	mov    %rsp,%rbp
  80035d:	48 83 ec 28          	sub    $0x28,%rsp
  800361:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800365:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800369:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80036d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800371:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800375:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80037a:	74 3d                	je     8003b9 <strlcpy+0x60>
  80037c:	eb 1d                	jmp    80039b <strlcpy+0x42>
  80037e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800382:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800386:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80038a:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80038e:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  800392:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  800396:	0f b6 12             	movzbl (%rdx),%edx
  800399:	88 10                	mov    %dl,(%rax)
  80039b:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8003a0:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8003a5:	74 0b                	je     8003b2 <strlcpy+0x59>
  8003a7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8003ab:	0f b6 00             	movzbl (%rax),%eax
  8003ae:	84 c0                	test   %al,%al
  8003b0:	75 cc                	jne    80037e <strlcpy+0x25>
  8003b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8003b6:	c6 00 00             	movb   $0x0,(%rax)
  8003b9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8003bd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8003c1:	48 29 c2             	sub    %rax,%rdx
  8003c4:	48 89 d0             	mov    %rdx,%rax
  8003c7:	c9                   	leaveq 
  8003c8:	c3                   	retq   

00000000008003c9 <strcmp>:
  8003c9:	55                   	push   %rbp
  8003ca:	48 89 e5             	mov    %rsp,%rbp
  8003cd:	48 83 ec 10          	sub    $0x10,%rsp
  8003d1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8003d5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8003d9:	eb 0a                	jmp    8003e5 <strcmp+0x1c>
  8003db:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8003e0:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8003e5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8003e9:	0f b6 00             	movzbl (%rax),%eax
  8003ec:	84 c0                	test   %al,%al
  8003ee:	74 12                	je     800402 <strcmp+0x39>
  8003f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8003f4:	0f b6 10             	movzbl (%rax),%edx
  8003f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003fb:	0f b6 00             	movzbl (%rax),%eax
  8003fe:	38 c2                	cmp    %al,%dl
  800400:	74 d9                	je     8003db <strcmp+0x12>
  800402:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800406:	0f b6 00             	movzbl (%rax),%eax
  800409:	0f b6 d0             	movzbl %al,%edx
  80040c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800410:	0f b6 00             	movzbl (%rax),%eax
  800413:	0f b6 c0             	movzbl %al,%eax
  800416:	29 c2                	sub    %eax,%edx
  800418:	89 d0                	mov    %edx,%eax
  80041a:	c9                   	leaveq 
  80041b:	c3                   	retq   

000000000080041c <strncmp>:
  80041c:	55                   	push   %rbp
  80041d:	48 89 e5             	mov    %rsp,%rbp
  800420:	48 83 ec 18          	sub    $0x18,%rsp
  800424:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800428:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80042c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800430:	eb 0f                	jmp    800441 <strncmp+0x25>
  800432:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  800437:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80043c:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  800441:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  800446:	74 1d                	je     800465 <strncmp+0x49>
  800448:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80044c:	0f b6 00             	movzbl (%rax),%eax
  80044f:	84 c0                	test   %al,%al
  800451:	74 12                	je     800465 <strncmp+0x49>
  800453:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800457:	0f b6 10             	movzbl (%rax),%edx
  80045a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80045e:	0f b6 00             	movzbl (%rax),%eax
  800461:	38 c2                	cmp    %al,%dl
  800463:	74 cd                	je     800432 <strncmp+0x16>
  800465:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80046a:	75 07                	jne    800473 <strncmp+0x57>
  80046c:	b8 00 00 00 00       	mov    $0x0,%eax
  800471:	eb 18                	jmp    80048b <strncmp+0x6f>
  800473:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800477:	0f b6 00             	movzbl (%rax),%eax
  80047a:	0f b6 d0             	movzbl %al,%edx
  80047d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800481:	0f b6 00             	movzbl (%rax),%eax
  800484:	0f b6 c0             	movzbl %al,%eax
  800487:	29 c2                	sub    %eax,%edx
  800489:	89 d0                	mov    %edx,%eax
  80048b:	c9                   	leaveq 
  80048c:	c3                   	retq   

000000000080048d <strchr>:
  80048d:	55                   	push   %rbp
  80048e:	48 89 e5             	mov    %rsp,%rbp
  800491:	48 83 ec 10          	sub    $0x10,%rsp
  800495:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800499:	89 f0                	mov    %esi,%eax
  80049b:	88 45 f4             	mov    %al,-0xc(%rbp)
  80049e:	eb 17                	jmp    8004b7 <strchr+0x2a>
  8004a0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004a4:	0f b6 00             	movzbl (%rax),%eax
  8004a7:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8004aa:	75 06                	jne    8004b2 <strchr+0x25>
  8004ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004b0:	eb 15                	jmp    8004c7 <strchr+0x3a>
  8004b2:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8004b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004bb:	0f b6 00             	movzbl (%rax),%eax
  8004be:	84 c0                	test   %al,%al
  8004c0:	75 de                	jne    8004a0 <strchr+0x13>
  8004c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8004c7:	c9                   	leaveq 
  8004c8:	c3                   	retq   

00000000008004c9 <strfind>:
  8004c9:	55                   	push   %rbp
  8004ca:	48 89 e5             	mov    %rsp,%rbp
  8004cd:	48 83 ec 10          	sub    $0x10,%rsp
  8004d1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8004d5:	89 f0                	mov    %esi,%eax
  8004d7:	88 45 f4             	mov    %al,-0xc(%rbp)
  8004da:	eb 11                	jmp    8004ed <strfind+0x24>
  8004dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004e0:	0f b6 00             	movzbl (%rax),%eax
  8004e3:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8004e6:	74 12                	je     8004fa <strfind+0x31>
  8004e8:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8004ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004f1:	0f b6 00             	movzbl (%rax),%eax
  8004f4:	84 c0                	test   %al,%al
  8004f6:	75 e4                	jne    8004dc <strfind+0x13>
  8004f8:	eb 01                	jmp    8004fb <strfind+0x32>
  8004fa:	90                   	nop
  8004fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004ff:	c9                   	leaveq 
  800500:	c3                   	retq   

0000000000800501 <memset>:
  800501:	55                   	push   %rbp
  800502:	48 89 e5             	mov    %rsp,%rbp
  800505:	48 83 ec 18          	sub    $0x18,%rsp
  800509:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80050d:	89 75 f4             	mov    %esi,-0xc(%rbp)
  800510:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800514:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  800519:	75 06                	jne    800521 <memset+0x20>
  80051b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80051f:	eb 69                	jmp    80058a <memset+0x89>
  800521:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800525:	83 e0 03             	and    $0x3,%eax
  800528:	48 85 c0             	test   %rax,%rax
  80052b:	75 48                	jne    800575 <memset+0x74>
  80052d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800531:	83 e0 03             	and    $0x3,%eax
  800534:	48 85 c0             	test   %rax,%rax
  800537:	75 3c                	jne    800575 <memset+0x74>
  800539:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  800540:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800543:	c1 e0 18             	shl    $0x18,%eax
  800546:	89 c2                	mov    %eax,%edx
  800548:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80054b:	c1 e0 10             	shl    $0x10,%eax
  80054e:	09 c2                	or     %eax,%edx
  800550:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800553:	c1 e0 08             	shl    $0x8,%eax
  800556:	09 d0                	or     %edx,%eax
  800558:	09 45 f4             	or     %eax,-0xc(%rbp)
  80055b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80055f:	48 c1 e8 02          	shr    $0x2,%rax
  800563:	48 89 c1             	mov    %rax,%rcx
  800566:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80056a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80056d:	48 89 d7             	mov    %rdx,%rdi
  800570:	fc                   	cld    
  800571:	f3 ab                	rep stos %eax,%es:(%rdi)
  800573:	eb 11                	jmp    800586 <memset+0x85>
  800575:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  800579:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80057c:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  800580:	48 89 d7             	mov    %rdx,%rdi
  800583:	fc                   	cld    
  800584:	f3 aa                	rep stos %al,%es:(%rdi)
  800586:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80058a:	c9                   	leaveq 
  80058b:	c3                   	retq   

000000000080058c <memmove>:
  80058c:	55                   	push   %rbp
  80058d:	48 89 e5             	mov    %rsp,%rbp
  800590:	48 83 ec 28          	sub    $0x28,%rsp
  800594:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800598:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80059c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8005a0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8005a4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8005a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005ac:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8005b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005b4:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8005b8:	0f 83 88 00 00 00    	jae    800646 <memmove+0xba>
  8005be:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8005c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8005c6:	48 01 d0             	add    %rdx,%rax
  8005c9:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8005cd:	76 77                	jbe    800646 <memmove+0xba>
  8005cf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8005d3:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8005d7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8005db:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8005df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005e3:	83 e0 03             	and    $0x3,%eax
  8005e6:	48 85 c0             	test   %rax,%rax
  8005e9:	75 3b                	jne    800626 <memmove+0x9a>
  8005eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005ef:	83 e0 03             	and    $0x3,%eax
  8005f2:	48 85 c0             	test   %rax,%rax
  8005f5:	75 2f                	jne    800626 <memmove+0x9a>
  8005f7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8005fb:	83 e0 03             	and    $0x3,%eax
  8005fe:	48 85 c0             	test   %rax,%rax
  800601:	75 23                	jne    800626 <memmove+0x9a>
  800603:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800607:	48 83 e8 04          	sub    $0x4,%rax
  80060b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80060f:	48 83 ea 04          	sub    $0x4,%rdx
  800613:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  800617:	48 c1 e9 02          	shr    $0x2,%rcx
  80061b:	48 89 c7             	mov    %rax,%rdi
  80061e:	48 89 d6             	mov    %rdx,%rsi
  800621:	fd                   	std    
  800622:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  800624:	eb 1d                	jmp    800643 <memmove+0xb7>
  800626:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80062a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80062e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800632:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  800636:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80063a:	48 89 d7             	mov    %rdx,%rdi
  80063d:	48 89 c1             	mov    %rax,%rcx
  800640:	fd                   	std    
  800641:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  800643:	fc                   	cld    
  800644:	eb 57                	jmp    80069d <memmove+0x111>
  800646:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80064a:	83 e0 03             	and    $0x3,%eax
  80064d:	48 85 c0             	test   %rax,%rax
  800650:	75 36                	jne    800688 <memmove+0xfc>
  800652:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800656:	83 e0 03             	and    $0x3,%eax
  800659:	48 85 c0             	test   %rax,%rax
  80065c:	75 2a                	jne    800688 <memmove+0xfc>
  80065e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800662:	83 e0 03             	and    $0x3,%eax
  800665:	48 85 c0             	test   %rax,%rax
  800668:	75 1e                	jne    800688 <memmove+0xfc>
  80066a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80066e:	48 c1 e8 02          	shr    $0x2,%rax
  800672:	48 89 c1             	mov    %rax,%rcx
  800675:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800679:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80067d:	48 89 c7             	mov    %rax,%rdi
  800680:	48 89 d6             	mov    %rdx,%rsi
  800683:	fc                   	cld    
  800684:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  800686:	eb 15                	jmp    80069d <memmove+0x111>
  800688:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80068c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  800690:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  800694:	48 89 c7             	mov    %rax,%rdi
  800697:	48 89 d6             	mov    %rdx,%rsi
  80069a:	fc                   	cld    
  80069b:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80069d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006a1:	c9                   	leaveq 
  8006a2:	c3                   	retq   

00000000008006a3 <memcpy>:
  8006a3:	55                   	push   %rbp
  8006a4:	48 89 e5             	mov    %rsp,%rbp
  8006a7:	48 83 ec 18          	sub    $0x18,%rsp
  8006ab:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8006af:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8006b3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8006b7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006bb:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8006bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006c3:	48 89 ce             	mov    %rcx,%rsi
  8006c6:	48 89 c7             	mov    %rax,%rdi
  8006c9:	48 b8 8c 05 80 00 00 	movabs $0x80058c,%rax
  8006d0:	00 00 00 
  8006d3:	ff d0                	callq  *%rax
  8006d5:	c9                   	leaveq 
  8006d6:	c3                   	retq   

00000000008006d7 <memcmp>:
  8006d7:	55                   	push   %rbp
  8006d8:	48 89 e5             	mov    %rsp,%rbp
  8006db:	48 83 ec 28          	sub    $0x28,%rsp
  8006df:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8006e3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8006e7:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8006eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006ef:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006f3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8006f7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8006fb:	eb 36                	jmp    800733 <memcmp+0x5c>
  8006fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800701:	0f b6 10             	movzbl (%rax),%edx
  800704:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800708:	0f b6 00             	movzbl (%rax),%eax
  80070b:	38 c2                	cmp    %al,%dl
  80070d:	74 1a                	je     800729 <memcmp+0x52>
  80070f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800713:	0f b6 00             	movzbl (%rax),%eax
  800716:	0f b6 d0             	movzbl %al,%edx
  800719:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80071d:	0f b6 00             	movzbl (%rax),%eax
  800720:	0f b6 c0             	movzbl %al,%eax
  800723:	29 c2                	sub    %eax,%edx
  800725:	89 d0                	mov    %edx,%eax
  800727:	eb 20                	jmp    800749 <memcmp+0x72>
  800729:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80072e:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  800733:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800737:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80073b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80073f:	48 85 c0             	test   %rax,%rax
  800742:	75 b9                	jne    8006fd <memcmp+0x26>
  800744:	b8 00 00 00 00       	mov    $0x0,%eax
  800749:	c9                   	leaveq 
  80074a:	c3                   	retq   

000000000080074b <memfind>:
  80074b:	55                   	push   %rbp
  80074c:	48 89 e5             	mov    %rsp,%rbp
  80074f:	48 83 ec 28          	sub    $0x28,%rsp
  800753:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800757:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80075a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80075e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800762:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800766:	48 01 d0             	add    %rdx,%rax
  800769:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80076d:	eb 13                	jmp    800782 <memfind+0x37>
  80076f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800773:	0f b6 00             	movzbl (%rax),%eax
  800776:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  800779:	38 d0                	cmp    %dl,%al
  80077b:	74 11                	je     80078e <memfind+0x43>
  80077d:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800782:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800786:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80078a:	72 e3                	jb     80076f <memfind+0x24>
  80078c:	eb 01                	jmp    80078f <memfind+0x44>
  80078e:	90                   	nop
  80078f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800793:	c9                   	leaveq 
  800794:	c3                   	retq   

0000000000800795 <strtol>:
  800795:	55                   	push   %rbp
  800796:	48 89 e5             	mov    %rsp,%rbp
  800799:	48 83 ec 38          	sub    $0x38,%rsp
  80079d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8007a1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8007a5:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8007a8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8007af:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8007b6:	00 
  8007b7:	eb 05                	jmp    8007be <strtol+0x29>
  8007b9:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8007be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8007c2:	0f b6 00             	movzbl (%rax),%eax
  8007c5:	3c 20                	cmp    $0x20,%al
  8007c7:	74 f0                	je     8007b9 <strtol+0x24>
  8007c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8007cd:	0f b6 00             	movzbl (%rax),%eax
  8007d0:	3c 09                	cmp    $0x9,%al
  8007d2:	74 e5                	je     8007b9 <strtol+0x24>
  8007d4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8007d8:	0f b6 00             	movzbl (%rax),%eax
  8007db:	3c 2b                	cmp    $0x2b,%al
  8007dd:	75 07                	jne    8007e6 <strtol+0x51>
  8007df:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8007e4:	eb 17                	jmp    8007fd <strtol+0x68>
  8007e6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8007ea:	0f b6 00             	movzbl (%rax),%eax
  8007ed:	3c 2d                	cmp    $0x2d,%al
  8007ef:	75 0c                	jne    8007fd <strtol+0x68>
  8007f1:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8007f6:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8007fd:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  800801:	74 06                	je     800809 <strtol+0x74>
  800803:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  800807:	75 28                	jne    800831 <strtol+0x9c>
  800809:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80080d:	0f b6 00             	movzbl (%rax),%eax
  800810:	3c 30                	cmp    $0x30,%al
  800812:	75 1d                	jne    800831 <strtol+0x9c>
  800814:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800818:	48 83 c0 01          	add    $0x1,%rax
  80081c:	0f b6 00             	movzbl (%rax),%eax
  80081f:	3c 78                	cmp    $0x78,%al
  800821:	75 0e                	jne    800831 <strtol+0x9c>
  800823:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  800828:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  80082f:	eb 2c                	jmp    80085d <strtol+0xc8>
  800831:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  800835:	75 19                	jne    800850 <strtol+0xbb>
  800837:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80083b:	0f b6 00             	movzbl (%rax),%eax
  80083e:	3c 30                	cmp    $0x30,%al
  800840:	75 0e                	jne    800850 <strtol+0xbb>
  800842:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  800847:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  80084e:	eb 0d                	jmp    80085d <strtol+0xc8>
  800850:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  800854:	75 07                	jne    80085d <strtol+0xc8>
  800856:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  80085d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800861:	0f b6 00             	movzbl (%rax),%eax
  800864:	3c 2f                	cmp    $0x2f,%al
  800866:	7e 1d                	jle    800885 <strtol+0xf0>
  800868:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80086c:	0f b6 00             	movzbl (%rax),%eax
  80086f:	3c 39                	cmp    $0x39,%al
  800871:	7f 12                	jg     800885 <strtol+0xf0>
  800873:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800877:	0f b6 00             	movzbl (%rax),%eax
  80087a:	0f be c0             	movsbl %al,%eax
  80087d:	83 e8 30             	sub    $0x30,%eax
  800880:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800883:	eb 4e                	jmp    8008d3 <strtol+0x13e>
  800885:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800889:	0f b6 00             	movzbl (%rax),%eax
  80088c:	3c 60                	cmp    $0x60,%al
  80088e:	7e 1d                	jle    8008ad <strtol+0x118>
  800890:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800894:	0f b6 00             	movzbl (%rax),%eax
  800897:	3c 7a                	cmp    $0x7a,%al
  800899:	7f 12                	jg     8008ad <strtol+0x118>
  80089b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80089f:	0f b6 00             	movzbl (%rax),%eax
  8008a2:	0f be c0             	movsbl %al,%eax
  8008a5:	83 e8 57             	sub    $0x57,%eax
  8008a8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8008ab:	eb 26                	jmp    8008d3 <strtol+0x13e>
  8008ad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8008b1:	0f b6 00             	movzbl (%rax),%eax
  8008b4:	3c 40                	cmp    $0x40,%al
  8008b6:	7e 47                	jle    8008ff <strtol+0x16a>
  8008b8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8008bc:	0f b6 00             	movzbl (%rax),%eax
  8008bf:	3c 5a                	cmp    $0x5a,%al
  8008c1:	7f 3c                	jg     8008ff <strtol+0x16a>
  8008c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8008c7:	0f b6 00             	movzbl (%rax),%eax
  8008ca:	0f be c0             	movsbl %al,%eax
  8008cd:	83 e8 37             	sub    $0x37,%eax
  8008d0:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8008d3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8008d6:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8008d9:	7d 23                	jge    8008fe <strtol+0x169>
  8008db:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8008e0:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8008e3:	48 98                	cltq   
  8008e5:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8008ea:	48 89 c2             	mov    %rax,%rdx
  8008ed:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8008f0:	48 98                	cltq   
  8008f2:	48 01 d0             	add    %rdx,%rax
  8008f5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8008f9:	e9 5f ff ff ff       	jmpq   80085d <strtol+0xc8>
  8008fe:	90                   	nop
  8008ff:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  800904:	74 0b                	je     800911 <strtol+0x17c>
  800906:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80090a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80090e:	48 89 10             	mov    %rdx,(%rax)
  800911:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800915:	74 09                	je     800920 <strtol+0x18b>
  800917:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80091b:	48 f7 d8             	neg    %rax
  80091e:	eb 04                	jmp    800924 <strtol+0x18f>
  800920:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800924:	c9                   	leaveq 
  800925:	c3                   	retq   

0000000000800926 <strstr>:
  800926:	55                   	push   %rbp
  800927:	48 89 e5             	mov    %rsp,%rbp
  80092a:	48 83 ec 30          	sub    $0x30,%rsp
  80092e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  800932:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  800936:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80093a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80093e:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  800942:	0f b6 00             	movzbl (%rax),%eax
  800945:	88 45 ff             	mov    %al,-0x1(%rbp)
  800948:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  80094c:	75 06                	jne    800954 <strstr+0x2e>
  80094e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800952:	eb 6b                	jmp    8009bf <strstr+0x99>
  800954:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800958:	48 89 c7             	mov    %rax,%rdi
  80095b:	48 b8 fb 01 80 00 00 	movabs $0x8001fb,%rax
  800962:	00 00 00 
  800965:	ff d0                	callq  *%rax
  800967:	48 98                	cltq   
  800969:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80096d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800971:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800975:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800979:	0f b6 00             	movzbl (%rax),%eax
  80097c:	88 45 ef             	mov    %al,-0x11(%rbp)
  80097f:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  800983:	75 07                	jne    80098c <strstr+0x66>
  800985:	b8 00 00 00 00       	mov    $0x0,%eax
  80098a:	eb 33                	jmp    8009bf <strstr+0x99>
  80098c:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  800990:	3a 45 ff             	cmp    -0x1(%rbp),%al
  800993:	75 d8                	jne    80096d <strstr+0x47>
  800995:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800999:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  80099d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8009a1:	48 89 ce             	mov    %rcx,%rsi
  8009a4:	48 89 c7             	mov    %rax,%rdi
  8009a7:	48 b8 1c 04 80 00 00 	movabs $0x80041c,%rax
  8009ae:	00 00 00 
  8009b1:	ff d0                	callq  *%rax
  8009b3:	85 c0                	test   %eax,%eax
  8009b5:	75 b6                	jne    80096d <strstr+0x47>
  8009b7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8009bb:	48 83 e8 01          	sub    $0x1,%rax
  8009bf:	c9                   	leaveq 
  8009c0:	c3                   	retq   

00000000008009c1 <syscall>:
  8009c1:	55                   	push   %rbp
  8009c2:	48 89 e5             	mov    %rsp,%rbp
  8009c5:	53                   	push   %rbx
  8009c6:	48 83 ec 48          	sub    $0x48,%rsp
  8009ca:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8009cd:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8009d0:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8009d4:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8009d8:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8009dc:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8009e0:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8009e3:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8009e7:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8009eb:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8009ef:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8009f3:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8009f7:	4c 89 c3             	mov    %r8,%rbx
  8009fa:	cd 30                	int    $0x30
  8009fc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a00:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800a04:	74 3e                	je     800a44 <syscall+0x83>
  800a06:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  800a0b:	7e 37                	jle    800a44 <syscall+0x83>
  800a0d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a11:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800a14:	49 89 d0             	mov    %rdx,%r8
  800a17:	89 c1                	mov    %eax,%ecx
  800a19:	48 ba 91 40 80 00 00 	movabs $0x804091,%rdx
  800a20:	00 00 00 
  800a23:	be 24 00 00 00       	mov    $0x24,%esi
  800a28:	48 bf ae 40 80 00 00 	movabs $0x8040ae,%rdi
  800a2f:	00 00 00 
  800a32:	b8 00 00 00 00       	mov    $0x0,%eax
  800a37:	49 b9 41 30 80 00 00 	movabs $0x803041,%r9
  800a3e:	00 00 00 
  800a41:	41 ff d1             	callq  *%r9
  800a44:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a48:	48 83 c4 48          	add    $0x48,%rsp
  800a4c:	5b                   	pop    %rbx
  800a4d:	5d                   	pop    %rbp
  800a4e:	c3                   	retq   

0000000000800a4f <sys_cputs>:
  800a4f:	55                   	push   %rbp
  800a50:	48 89 e5             	mov    %rsp,%rbp
  800a53:	48 83 ec 10          	sub    $0x10,%rsp
  800a57:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800a5b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800a5f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800a63:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800a67:	48 83 ec 08          	sub    $0x8,%rsp
  800a6b:	6a 00                	pushq  $0x0
  800a6d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800a73:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800a79:	48 89 d1             	mov    %rdx,%rcx
  800a7c:	48 89 c2             	mov    %rax,%rdx
  800a7f:	be 00 00 00 00       	mov    $0x0,%esi
  800a84:	bf 00 00 00 00       	mov    $0x0,%edi
  800a89:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800a90:	00 00 00 
  800a93:	ff d0                	callq  *%rax
  800a95:	48 83 c4 10          	add    $0x10,%rsp
  800a99:	90                   	nop
  800a9a:	c9                   	leaveq 
  800a9b:	c3                   	retq   

0000000000800a9c <sys_cgetc>:
  800a9c:	55                   	push   %rbp
  800a9d:	48 89 e5             	mov    %rsp,%rbp
  800aa0:	48 83 ec 08          	sub    $0x8,%rsp
  800aa4:	6a 00                	pushq  $0x0
  800aa6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800aac:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800ab2:	b9 00 00 00 00       	mov    $0x0,%ecx
  800ab7:	ba 00 00 00 00       	mov    $0x0,%edx
  800abc:	be 00 00 00 00       	mov    $0x0,%esi
  800ac1:	bf 01 00 00 00       	mov    $0x1,%edi
  800ac6:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800acd:	00 00 00 
  800ad0:	ff d0                	callq  *%rax
  800ad2:	48 83 c4 10          	add    $0x10,%rsp
  800ad6:	c9                   	leaveq 
  800ad7:	c3                   	retq   

0000000000800ad8 <sys_env_destroy>:
  800ad8:	55                   	push   %rbp
  800ad9:	48 89 e5             	mov    %rsp,%rbp
  800adc:	48 83 ec 10          	sub    $0x10,%rsp
  800ae0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800ae3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ae6:	48 98                	cltq   
  800ae8:	48 83 ec 08          	sub    $0x8,%rsp
  800aec:	6a 00                	pushq  $0x0
  800aee:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800af4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800afa:	b9 00 00 00 00       	mov    $0x0,%ecx
  800aff:	48 89 c2             	mov    %rax,%rdx
  800b02:	be 01 00 00 00       	mov    $0x1,%esi
  800b07:	bf 03 00 00 00       	mov    $0x3,%edi
  800b0c:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800b13:	00 00 00 
  800b16:	ff d0                	callq  *%rax
  800b18:	48 83 c4 10          	add    $0x10,%rsp
  800b1c:	c9                   	leaveq 
  800b1d:	c3                   	retq   

0000000000800b1e <sys_getenvid>:
  800b1e:	55                   	push   %rbp
  800b1f:	48 89 e5             	mov    %rsp,%rbp
  800b22:	48 83 ec 08          	sub    $0x8,%rsp
  800b26:	6a 00                	pushq  $0x0
  800b28:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800b2e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800b34:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b39:	ba 00 00 00 00       	mov    $0x0,%edx
  800b3e:	be 00 00 00 00       	mov    $0x0,%esi
  800b43:	bf 02 00 00 00       	mov    $0x2,%edi
  800b48:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800b4f:	00 00 00 
  800b52:	ff d0                	callq  *%rax
  800b54:	48 83 c4 10          	add    $0x10,%rsp
  800b58:	c9                   	leaveq 
  800b59:	c3                   	retq   

0000000000800b5a <sys_yield>:
  800b5a:	55                   	push   %rbp
  800b5b:	48 89 e5             	mov    %rsp,%rbp
  800b5e:	48 83 ec 08          	sub    $0x8,%rsp
  800b62:	6a 00                	pushq  $0x0
  800b64:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800b6a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800b70:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b75:	ba 00 00 00 00       	mov    $0x0,%edx
  800b7a:	be 00 00 00 00       	mov    $0x0,%esi
  800b7f:	bf 0b 00 00 00       	mov    $0xb,%edi
  800b84:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800b8b:	00 00 00 
  800b8e:	ff d0                	callq  *%rax
  800b90:	48 83 c4 10          	add    $0x10,%rsp
  800b94:	90                   	nop
  800b95:	c9                   	leaveq 
  800b96:	c3                   	retq   

0000000000800b97 <sys_page_alloc>:
  800b97:	55                   	push   %rbp
  800b98:	48 89 e5             	mov    %rsp,%rbp
  800b9b:	48 83 ec 10          	sub    $0x10,%rsp
  800b9f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800ba2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800ba6:	89 55 f8             	mov    %edx,-0x8(%rbp)
  800ba9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800bac:	48 63 c8             	movslq %eax,%rcx
  800baf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800bb3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800bb6:	48 98                	cltq   
  800bb8:	48 83 ec 08          	sub    $0x8,%rsp
  800bbc:	6a 00                	pushq  $0x0
  800bbe:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800bc4:	49 89 c8             	mov    %rcx,%r8
  800bc7:	48 89 d1             	mov    %rdx,%rcx
  800bca:	48 89 c2             	mov    %rax,%rdx
  800bcd:	be 01 00 00 00       	mov    $0x1,%esi
  800bd2:	bf 04 00 00 00       	mov    $0x4,%edi
  800bd7:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800bde:	00 00 00 
  800be1:	ff d0                	callq  *%rax
  800be3:	48 83 c4 10          	add    $0x10,%rsp
  800be7:	c9                   	leaveq 
  800be8:	c3                   	retq   

0000000000800be9 <sys_page_map>:
  800be9:	55                   	push   %rbp
  800bea:	48 89 e5             	mov    %rsp,%rbp
  800bed:	48 83 ec 20          	sub    $0x20,%rsp
  800bf1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800bf4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800bf8:	89 55 f8             	mov    %edx,-0x8(%rbp)
  800bfb:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  800bff:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  800c03:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800c06:	48 63 c8             	movslq %eax,%rcx
  800c09:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  800c0d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800c10:	48 63 f0             	movslq %eax,%rsi
  800c13:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800c17:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800c1a:	48 98                	cltq   
  800c1c:	48 83 ec 08          	sub    $0x8,%rsp
  800c20:	51                   	push   %rcx
  800c21:	49 89 f9             	mov    %rdi,%r9
  800c24:	49 89 f0             	mov    %rsi,%r8
  800c27:	48 89 d1             	mov    %rdx,%rcx
  800c2a:	48 89 c2             	mov    %rax,%rdx
  800c2d:	be 01 00 00 00       	mov    $0x1,%esi
  800c32:	bf 05 00 00 00       	mov    $0x5,%edi
  800c37:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800c3e:	00 00 00 
  800c41:	ff d0                	callq  *%rax
  800c43:	48 83 c4 10          	add    $0x10,%rsp
  800c47:	c9                   	leaveq 
  800c48:	c3                   	retq   

0000000000800c49 <sys_page_unmap>:
  800c49:	55                   	push   %rbp
  800c4a:	48 89 e5             	mov    %rsp,%rbp
  800c4d:	48 83 ec 10          	sub    $0x10,%rsp
  800c51:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800c54:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800c58:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800c5c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800c5f:	48 98                	cltq   
  800c61:	48 83 ec 08          	sub    $0x8,%rsp
  800c65:	6a 00                	pushq  $0x0
  800c67:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800c6d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800c73:	48 89 d1             	mov    %rdx,%rcx
  800c76:	48 89 c2             	mov    %rax,%rdx
  800c79:	be 01 00 00 00       	mov    $0x1,%esi
  800c7e:	bf 06 00 00 00       	mov    $0x6,%edi
  800c83:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800c8a:	00 00 00 
  800c8d:	ff d0                	callq  *%rax
  800c8f:	48 83 c4 10          	add    $0x10,%rsp
  800c93:	c9                   	leaveq 
  800c94:	c3                   	retq   

0000000000800c95 <sys_env_set_status>:
  800c95:	55                   	push   %rbp
  800c96:	48 89 e5             	mov    %rsp,%rbp
  800c99:	48 83 ec 10          	sub    $0x10,%rsp
  800c9d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800ca0:	89 75 f8             	mov    %esi,-0x8(%rbp)
  800ca3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800ca6:	48 63 d0             	movslq %eax,%rdx
  800ca9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800cac:	48 98                	cltq   
  800cae:	48 83 ec 08          	sub    $0x8,%rsp
  800cb2:	6a 00                	pushq  $0x0
  800cb4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800cba:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800cc0:	48 89 d1             	mov    %rdx,%rcx
  800cc3:	48 89 c2             	mov    %rax,%rdx
  800cc6:	be 01 00 00 00       	mov    $0x1,%esi
  800ccb:	bf 08 00 00 00       	mov    $0x8,%edi
  800cd0:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800cd7:	00 00 00 
  800cda:	ff d0                	callq  *%rax
  800cdc:	48 83 c4 10          	add    $0x10,%rsp
  800ce0:	c9                   	leaveq 
  800ce1:	c3                   	retq   

0000000000800ce2 <sys_env_set_trapframe>:
  800ce2:	55                   	push   %rbp
  800ce3:	48 89 e5             	mov    %rsp,%rbp
  800ce6:	48 83 ec 10          	sub    $0x10,%rsp
  800cea:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800ced:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800cf1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800cf5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800cf8:	48 98                	cltq   
  800cfa:	48 83 ec 08          	sub    $0x8,%rsp
  800cfe:	6a 00                	pushq  $0x0
  800d00:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800d06:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800d0c:	48 89 d1             	mov    %rdx,%rcx
  800d0f:	48 89 c2             	mov    %rax,%rdx
  800d12:	be 01 00 00 00       	mov    $0x1,%esi
  800d17:	bf 09 00 00 00       	mov    $0x9,%edi
  800d1c:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800d23:	00 00 00 
  800d26:	ff d0                	callq  *%rax
  800d28:	48 83 c4 10          	add    $0x10,%rsp
  800d2c:	c9                   	leaveq 
  800d2d:	c3                   	retq   

0000000000800d2e <sys_env_set_pgfault_upcall>:
  800d2e:	55                   	push   %rbp
  800d2f:	48 89 e5             	mov    %rsp,%rbp
  800d32:	48 83 ec 10          	sub    $0x10,%rsp
  800d36:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800d39:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800d3d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800d41:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800d44:	48 98                	cltq   
  800d46:	48 83 ec 08          	sub    $0x8,%rsp
  800d4a:	6a 00                	pushq  $0x0
  800d4c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800d52:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800d58:	48 89 d1             	mov    %rdx,%rcx
  800d5b:	48 89 c2             	mov    %rax,%rdx
  800d5e:	be 01 00 00 00       	mov    $0x1,%esi
  800d63:	bf 0a 00 00 00       	mov    $0xa,%edi
  800d68:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800d6f:	00 00 00 
  800d72:	ff d0                	callq  *%rax
  800d74:	48 83 c4 10          	add    $0x10,%rsp
  800d78:	c9                   	leaveq 
  800d79:	c3                   	retq   

0000000000800d7a <sys_ipc_try_send>:
  800d7a:	55                   	push   %rbp
  800d7b:	48 89 e5             	mov    %rsp,%rbp
  800d7e:	48 83 ec 20          	sub    $0x20,%rsp
  800d82:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800d85:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800d89:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800d8d:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  800d90:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800d93:	48 63 f0             	movslq %eax,%rsi
  800d96:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  800d9a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800d9d:	48 98                	cltq   
  800d9f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800da3:	48 83 ec 08          	sub    $0x8,%rsp
  800da7:	6a 00                	pushq  $0x0
  800da9:	49 89 f1             	mov    %rsi,%r9
  800dac:	49 89 c8             	mov    %rcx,%r8
  800daf:	48 89 d1             	mov    %rdx,%rcx
  800db2:	48 89 c2             	mov    %rax,%rdx
  800db5:	be 00 00 00 00       	mov    $0x0,%esi
  800dba:	bf 0c 00 00 00       	mov    $0xc,%edi
  800dbf:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800dc6:	00 00 00 
  800dc9:	ff d0                	callq  *%rax
  800dcb:	48 83 c4 10          	add    $0x10,%rsp
  800dcf:	c9                   	leaveq 
  800dd0:	c3                   	retq   

0000000000800dd1 <sys_ipc_recv>:
  800dd1:	55                   	push   %rbp
  800dd2:	48 89 e5             	mov    %rsp,%rbp
  800dd5:	48 83 ec 10          	sub    $0x10,%rsp
  800dd9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800ddd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800de1:	48 83 ec 08          	sub    $0x8,%rsp
  800de5:	6a 00                	pushq  $0x0
  800de7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800ded:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800df3:	b9 00 00 00 00       	mov    $0x0,%ecx
  800df8:	48 89 c2             	mov    %rax,%rdx
  800dfb:	be 01 00 00 00       	mov    $0x1,%esi
  800e00:	bf 0d 00 00 00       	mov    $0xd,%edi
  800e05:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800e0c:	00 00 00 
  800e0f:	ff d0                	callq  *%rax
  800e11:	48 83 c4 10          	add    $0x10,%rsp
  800e15:	c9                   	leaveq 
  800e16:	c3                   	retq   

0000000000800e17 <sys_time_msec>:
  800e17:	55                   	push   %rbp
  800e18:	48 89 e5             	mov    %rsp,%rbp
  800e1b:	48 83 ec 08          	sub    $0x8,%rsp
  800e1f:	6a 00                	pushq  $0x0
  800e21:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800e27:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800e2d:	b9 00 00 00 00       	mov    $0x0,%ecx
  800e32:	ba 00 00 00 00       	mov    $0x0,%edx
  800e37:	be 00 00 00 00       	mov    $0x0,%esi
  800e3c:	bf 0e 00 00 00       	mov    $0xe,%edi
  800e41:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800e48:	00 00 00 
  800e4b:	ff d0                	callq  *%rax
  800e4d:	48 83 c4 10          	add    $0x10,%rsp
  800e51:	c9                   	leaveq 
  800e52:	c3                   	retq   

0000000000800e53 <sys_net_transmit>:
  800e53:	55                   	push   %rbp
  800e54:	48 89 e5             	mov    %rsp,%rbp
  800e57:	48 83 ec 10          	sub    $0x10,%rsp
  800e5b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800e5f:	89 75 f4             	mov    %esi,-0xc(%rbp)
  800e62:	8b 55 f4             	mov    -0xc(%rbp),%edx
  800e65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800e69:	48 83 ec 08          	sub    $0x8,%rsp
  800e6d:	6a 00                	pushq  $0x0
  800e6f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800e75:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800e7b:	48 89 d1             	mov    %rdx,%rcx
  800e7e:	48 89 c2             	mov    %rax,%rdx
  800e81:	be 00 00 00 00       	mov    $0x0,%esi
  800e86:	bf 0f 00 00 00       	mov    $0xf,%edi
  800e8b:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800e92:	00 00 00 
  800e95:	ff d0                	callq  *%rax
  800e97:	48 83 c4 10          	add    $0x10,%rsp
  800e9b:	c9                   	leaveq 
  800e9c:	c3                   	retq   

0000000000800e9d <sys_net_receive>:
  800e9d:	55                   	push   %rbp
  800e9e:	48 89 e5             	mov    %rsp,%rbp
  800ea1:	48 83 ec 10          	sub    $0x10,%rsp
  800ea5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800ea9:	89 75 f4             	mov    %esi,-0xc(%rbp)
  800eac:	8b 55 f4             	mov    -0xc(%rbp),%edx
  800eaf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800eb3:	48 83 ec 08          	sub    $0x8,%rsp
  800eb7:	6a 00                	pushq  $0x0
  800eb9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800ebf:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800ec5:	48 89 d1             	mov    %rdx,%rcx
  800ec8:	48 89 c2             	mov    %rax,%rdx
  800ecb:	be 00 00 00 00       	mov    $0x0,%esi
  800ed0:	bf 10 00 00 00       	mov    $0x10,%edi
  800ed5:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800edc:	00 00 00 
  800edf:	ff d0                	callq  *%rax
  800ee1:	48 83 c4 10          	add    $0x10,%rsp
  800ee5:	c9                   	leaveq 
  800ee6:	c3                   	retq   

0000000000800ee7 <sys_ept_map>:
  800ee7:	55                   	push   %rbp
  800ee8:	48 89 e5             	mov    %rsp,%rbp
  800eeb:	48 83 ec 20          	sub    $0x20,%rsp
  800eef:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800ef2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800ef6:	89 55 f8             	mov    %edx,-0x8(%rbp)
  800ef9:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  800efd:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  800f01:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800f04:	48 63 c8             	movslq %eax,%rcx
  800f07:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  800f0b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800f0e:	48 63 f0             	movslq %eax,%rsi
  800f11:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800f15:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f18:	48 98                	cltq   
  800f1a:	48 83 ec 08          	sub    $0x8,%rsp
  800f1e:	51                   	push   %rcx
  800f1f:	49 89 f9             	mov    %rdi,%r9
  800f22:	49 89 f0             	mov    %rsi,%r8
  800f25:	48 89 d1             	mov    %rdx,%rcx
  800f28:	48 89 c2             	mov    %rax,%rdx
  800f2b:	be 00 00 00 00       	mov    $0x0,%esi
  800f30:	bf 11 00 00 00       	mov    $0x11,%edi
  800f35:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800f3c:	00 00 00 
  800f3f:	ff d0                	callq  *%rax
  800f41:	48 83 c4 10          	add    $0x10,%rsp
  800f45:	c9                   	leaveq 
  800f46:	c3                   	retq   

0000000000800f47 <sys_env_mkguest>:
  800f47:	55                   	push   %rbp
  800f48:	48 89 e5             	mov    %rsp,%rbp
  800f4b:	48 83 ec 10          	sub    $0x10,%rsp
  800f4f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800f53:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800f57:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800f5b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800f5f:	48 83 ec 08          	sub    $0x8,%rsp
  800f63:	6a 00                	pushq  $0x0
  800f65:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800f6b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800f71:	48 89 d1             	mov    %rdx,%rcx
  800f74:	48 89 c2             	mov    %rax,%rdx
  800f77:	be 00 00 00 00       	mov    $0x0,%esi
  800f7c:	bf 12 00 00 00       	mov    $0x12,%edi
  800f81:	48 b8 c1 09 80 00 00 	movabs $0x8009c1,%rax
  800f88:	00 00 00 
  800f8b:	ff d0                	callq  *%rax
  800f8d:	48 83 c4 10          	add    $0x10,%rsp
  800f91:	c9                   	leaveq 
  800f92:	c3                   	retq   

0000000000800f93 <fd2num>:
  800f93:	55                   	push   %rbp
  800f94:	48 89 e5             	mov    %rsp,%rbp
  800f97:	48 83 ec 08          	sub    $0x8,%rsp
  800f9b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800f9f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  800fa3:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  800faa:	ff ff ff 
  800fad:	48 01 d0             	add    %rdx,%rax
  800fb0:	48 c1 e8 0c          	shr    $0xc,%rax
  800fb4:	c9                   	leaveq 
  800fb5:	c3                   	retq   

0000000000800fb6 <fd2data>:
  800fb6:	55                   	push   %rbp
  800fb7:	48 89 e5             	mov    %rsp,%rbp
  800fba:	48 83 ec 08          	sub    $0x8,%rsp
  800fbe:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800fc2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800fc6:	48 89 c7             	mov    %rax,%rdi
  800fc9:	48 b8 93 0f 80 00 00 	movabs $0x800f93,%rax
  800fd0:	00 00 00 
  800fd3:	ff d0                	callq  *%rax
  800fd5:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  800fdb:	48 c1 e0 0c          	shl    $0xc,%rax
  800fdf:	c9                   	leaveq 
  800fe0:	c3                   	retq   

0000000000800fe1 <fd_alloc>:
  800fe1:	55                   	push   %rbp
  800fe2:	48 89 e5             	mov    %rsp,%rbp
  800fe5:	48 83 ec 18          	sub    $0x18,%rsp
  800fe9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800ff4:	eb 6b                	jmp    801061 <fd_alloc+0x80>
  800ff6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ff9:	48 98                	cltq   
  800ffb:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801001:	48 c1 e0 0c          	shl    $0xc,%rax
  801005:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801009:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80100d:	48 c1 e8 15          	shr    $0x15,%rax
  801011:	48 89 c2             	mov    %rax,%rdx
  801014:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80101b:	01 00 00 
  80101e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801022:	83 e0 01             	and    $0x1,%eax
  801025:	48 85 c0             	test   %rax,%rax
  801028:	74 21                	je     80104b <fd_alloc+0x6a>
  80102a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80102e:	48 c1 e8 0c          	shr    $0xc,%rax
  801032:	48 89 c2             	mov    %rax,%rdx
  801035:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80103c:	01 00 00 
  80103f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801043:	83 e0 01             	and    $0x1,%eax
  801046:	48 85 c0             	test   %rax,%rax
  801049:	75 12                	jne    80105d <fd_alloc+0x7c>
  80104b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80104f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801053:	48 89 10             	mov    %rdx,(%rax)
  801056:	b8 00 00 00 00       	mov    $0x0,%eax
  80105b:	eb 1a                	jmp    801077 <fd_alloc+0x96>
  80105d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801061:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801065:	7e 8f                	jle    800ff6 <fd_alloc+0x15>
  801067:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80106b:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801072:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801077:	c9                   	leaveq 
  801078:	c3                   	retq   

0000000000801079 <fd_lookup>:
  801079:	55                   	push   %rbp
  80107a:	48 89 e5             	mov    %rsp,%rbp
  80107d:	48 83 ec 20          	sub    $0x20,%rsp
  801081:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801084:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801088:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80108c:	78 06                	js     801094 <fd_lookup+0x1b>
  80108e:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801092:	7e 07                	jle    80109b <fd_lookup+0x22>
  801094:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801099:	eb 6c                	jmp    801107 <fd_lookup+0x8e>
  80109b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80109e:	48 98                	cltq   
  8010a0:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8010a6:	48 c1 e0 0c          	shl    $0xc,%rax
  8010aa:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8010ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010b2:	48 c1 e8 15          	shr    $0x15,%rax
  8010b6:	48 89 c2             	mov    %rax,%rdx
  8010b9:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8010c0:	01 00 00 
  8010c3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8010c7:	83 e0 01             	and    $0x1,%eax
  8010ca:	48 85 c0             	test   %rax,%rax
  8010cd:	74 21                	je     8010f0 <fd_lookup+0x77>
  8010cf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010d3:	48 c1 e8 0c          	shr    $0xc,%rax
  8010d7:	48 89 c2             	mov    %rax,%rdx
  8010da:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8010e1:	01 00 00 
  8010e4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8010e8:	83 e0 01             	and    $0x1,%eax
  8010eb:	48 85 c0             	test   %rax,%rax
  8010ee:	75 07                	jne    8010f7 <fd_lookup+0x7e>
  8010f0:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8010f5:	eb 10                	jmp    801107 <fd_lookup+0x8e>
  8010f7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8010fb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8010ff:	48 89 10             	mov    %rdx,(%rax)
  801102:	b8 00 00 00 00       	mov    $0x0,%eax
  801107:	c9                   	leaveq 
  801108:	c3                   	retq   

0000000000801109 <fd_close>:
  801109:	55                   	push   %rbp
  80110a:	48 89 e5             	mov    %rsp,%rbp
  80110d:	48 83 ec 30          	sub    $0x30,%rsp
  801111:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801115:	89 f0                	mov    %esi,%eax
  801117:	88 45 d4             	mov    %al,-0x2c(%rbp)
  80111a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80111e:	48 89 c7             	mov    %rax,%rdi
  801121:	48 b8 93 0f 80 00 00 	movabs $0x800f93,%rax
  801128:	00 00 00 
  80112b:	ff d0                	callq  *%rax
  80112d:	89 c2                	mov    %eax,%edx
  80112f:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  801133:	48 89 c6             	mov    %rax,%rsi
  801136:	89 d7                	mov    %edx,%edi
  801138:	48 b8 79 10 80 00 00 	movabs $0x801079,%rax
  80113f:	00 00 00 
  801142:	ff d0                	callq  *%rax
  801144:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801147:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80114b:	78 0a                	js     801157 <fd_close+0x4e>
  80114d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801151:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  801155:	74 12                	je     801169 <fd_close+0x60>
  801157:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  80115b:	74 05                	je     801162 <fd_close+0x59>
  80115d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801160:	eb 70                	jmp    8011d2 <fd_close+0xc9>
  801162:	b8 00 00 00 00       	mov    $0x0,%eax
  801167:	eb 69                	jmp    8011d2 <fd_close+0xc9>
  801169:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80116d:	8b 00                	mov    (%rax),%eax
  80116f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  801173:	48 89 d6             	mov    %rdx,%rsi
  801176:	89 c7                	mov    %eax,%edi
  801178:	48 b8 d4 11 80 00 00 	movabs $0x8011d4,%rax
  80117f:	00 00 00 
  801182:	ff d0                	callq  *%rax
  801184:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801187:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80118b:	78 2a                	js     8011b7 <fd_close+0xae>
  80118d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801191:	48 8b 40 20          	mov    0x20(%rax),%rax
  801195:	48 85 c0             	test   %rax,%rax
  801198:	74 16                	je     8011b0 <fd_close+0xa7>
  80119a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80119e:	48 8b 40 20          	mov    0x20(%rax),%rax
  8011a2:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8011a6:	48 89 d7             	mov    %rdx,%rdi
  8011a9:	ff d0                	callq  *%rax
  8011ab:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8011ae:	eb 07                	jmp    8011b7 <fd_close+0xae>
  8011b0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8011b7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8011bb:	48 89 c6             	mov    %rax,%rsi
  8011be:	bf 00 00 00 00       	mov    $0x0,%edi
  8011c3:	48 b8 49 0c 80 00 00 	movabs $0x800c49,%rax
  8011ca:	00 00 00 
  8011cd:	ff d0                	callq  *%rax
  8011cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011d2:	c9                   	leaveq 
  8011d3:	c3                   	retq   

00000000008011d4 <dev_lookup>:
  8011d4:	55                   	push   %rbp
  8011d5:	48 89 e5             	mov    %rsp,%rbp
  8011d8:	48 83 ec 20          	sub    $0x20,%rsp
  8011dc:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8011df:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011e3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8011ea:	eb 41                	jmp    80122d <dev_lookup+0x59>
  8011ec:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8011f3:	00 00 00 
  8011f6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8011f9:	48 63 d2             	movslq %edx,%rdx
  8011fc:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801200:	8b 00                	mov    (%rax),%eax
  801202:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  801205:	75 22                	jne    801229 <dev_lookup+0x55>
  801207:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  80120e:	00 00 00 
  801211:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801214:	48 63 d2             	movslq %edx,%rdx
  801217:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80121b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80121f:	48 89 10             	mov    %rdx,(%rax)
  801222:	b8 00 00 00 00       	mov    $0x0,%eax
  801227:	eb 60                	jmp    801289 <dev_lookup+0xb5>
  801229:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80122d:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  801234:	00 00 00 
  801237:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80123a:	48 63 d2             	movslq %edx,%rdx
  80123d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801241:	48 85 c0             	test   %rax,%rax
  801244:	75 a6                	jne    8011ec <dev_lookup+0x18>
  801246:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80124d:	00 00 00 
  801250:	48 8b 00             	mov    (%rax),%rax
  801253:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  801259:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80125c:	89 c6                	mov    %eax,%esi
  80125e:	48 bf c0 40 80 00 00 	movabs $0x8040c0,%rdi
  801265:	00 00 00 
  801268:	b8 00 00 00 00       	mov    $0x0,%eax
  80126d:	48 b9 7b 32 80 00 00 	movabs $0x80327b,%rcx
  801274:	00 00 00 
  801277:	ff d1                	callq  *%rcx
  801279:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80127d:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801284:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801289:	c9                   	leaveq 
  80128a:	c3                   	retq   

000000000080128b <close>:
  80128b:	55                   	push   %rbp
  80128c:	48 89 e5             	mov    %rsp,%rbp
  80128f:	48 83 ec 20          	sub    $0x20,%rsp
  801293:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801296:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80129a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80129d:	48 89 d6             	mov    %rdx,%rsi
  8012a0:	89 c7                	mov    %eax,%edi
  8012a2:	48 b8 79 10 80 00 00 	movabs $0x801079,%rax
  8012a9:	00 00 00 
  8012ac:	ff d0                	callq  *%rax
  8012ae:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8012b1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8012b5:	79 05                	jns    8012bc <close+0x31>
  8012b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8012ba:	eb 18                	jmp    8012d4 <close+0x49>
  8012bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012c0:	be 01 00 00 00       	mov    $0x1,%esi
  8012c5:	48 89 c7             	mov    %rax,%rdi
  8012c8:	48 b8 09 11 80 00 00 	movabs $0x801109,%rax
  8012cf:	00 00 00 
  8012d2:	ff d0                	callq  *%rax
  8012d4:	c9                   	leaveq 
  8012d5:	c3                   	retq   

00000000008012d6 <close_all>:
  8012d6:	55                   	push   %rbp
  8012d7:	48 89 e5             	mov    %rsp,%rbp
  8012da:	48 83 ec 10          	sub    $0x10,%rsp
  8012de:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8012e5:	eb 15                	jmp    8012fc <close_all+0x26>
  8012e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8012ea:	89 c7                	mov    %eax,%edi
  8012ec:	48 b8 8b 12 80 00 00 	movabs $0x80128b,%rax
  8012f3:	00 00 00 
  8012f6:	ff d0                	callq  *%rax
  8012f8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8012fc:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801300:	7e e5                	jle    8012e7 <close_all+0x11>
  801302:	90                   	nop
  801303:	c9                   	leaveq 
  801304:	c3                   	retq   

0000000000801305 <dup>:
  801305:	55                   	push   %rbp
  801306:	48 89 e5             	mov    %rsp,%rbp
  801309:	48 83 ec 40          	sub    $0x40,%rsp
  80130d:	89 7d cc             	mov    %edi,-0x34(%rbp)
  801310:	89 75 c8             	mov    %esi,-0x38(%rbp)
  801313:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  801317:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80131a:	48 89 d6             	mov    %rdx,%rsi
  80131d:	89 c7                	mov    %eax,%edi
  80131f:	48 b8 79 10 80 00 00 	movabs $0x801079,%rax
  801326:	00 00 00 
  801329:	ff d0                	callq  *%rax
  80132b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80132e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801332:	79 08                	jns    80133c <dup+0x37>
  801334:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801337:	e9 70 01 00 00       	jmpq   8014ac <dup+0x1a7>
  80133c:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80133f:	89 c7                	mov    %eax,%edi
  801341:	48 b8 8b 12 80 00 00 	movabs $0x80128b,%rax
  801348:	00 00 00 
  80134b:	ff d0                	callq  *%rax
  80134d:	8b 45 c8             	mov    -0x38(%rbp),%eax
  801350:	48 98                	cltq   
  801352:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801358:	48 c1 e0 0c          	shl    $0xc,%rax
  80135c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801360:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801364:	48 89 c7             	mov    %rax,%rdi
  801367:	48 b8 b6 0f 80 00 00 	movabs $0x800fb6,%rax
  80136e:	00 00 00 
  801371:	ff d0                	callq  *%rax
  801373:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801377:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80137b:	48 89 c7             	mov    %rax,%rdi
  80137e:	48 b8 b6 0f 80 00 00 	movabs $0x800fb6,%rax
  801385:	00 00 00 
  801388:	ff d0                	callq  *%rax
  80138a:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80138e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801392:	48 c1 e8 15          	shr    $0x15,%rax
  801396:	48 89 c2             	mov    %rax,%rdx
  801399:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8013a0:	01 00 00 
  8013a3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8013a7:	83 e0 01             	and    $0x1,%eax
  8013aa:	48 85 c0             	test   %rax,%rax
  8013ad:	74 71                	je     801420 <dup+0x11b>
  8013af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013b3:	48 c1 e8 0c          	shr    $0xc,%rax
  8013b7:	48 89 c2             	mov    %rax,%rdx
  8013ba:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8013c1:	01 00 00 
  8013c4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8013c8:	83 e0 01             	and    $0x1,%eax
  8013cb:	48 85 c0             	test   %rax,%rax
  8013ce:	74 50                	je     801420 <dup+0x11b>
  8013d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013d4:	48 c1 e8 0c          	shr    $0xc,%rax
  8013d8:	48 89 c2             	mov    %rax,%rdx
  8013db:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8013e2:	01 00 00 
  8013e5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8013e9:	25 07 0e 00 00       	and    $0xe07,%eax
  8013ee:	89 c1                	mov    %eax,%ecx
  8013f0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8013f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013f8:	41 89 c8             	mov    %ecx,%r8d
  8013fb:	48 89 d1             	mov    %rdx,%rcx
  8013fe:	ba 00 00 00 00       	mov    $0x0,%edx
  801403:	48 89 c6             	mov    %rax,%rsi
  801406:	bf 00 00 00 00       	mov    $0x0,%edi
  80140b:	48 b8 e9 0b 80 00 00 	movabs $0x800be9,%rax
  801412:	00 00 00 
  801415:	ff d0                	callq  *%rax
  801417:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80141a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80141e:	78 55                	js     801475 <dup+0x170>
  801420:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801424:	48 c1 e8 0c          	shr    $0xc,%rax
  801428:	48 89 c2             	mov    %rax,%rdx
  80142b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801432:	01 00 00 
  801435:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801439:	25 07 0e 00 00       	and    $0xe07,%eax
  80143e:	89 c1                	mov    %eax,%ecx
  801440:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801444:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801448:	41 89 c8             	mov    %ecx,%r8d
  80144b:	48 89 d1             	mov    %rdx,%rcx
  80144e:	ba 00 00 00 00       	mov    $0x0,%edx
  801453:	48 89 c6             	mov    %rax,%rsi
  801456:	bf 00 00 00 00       	mov    $0x0,%edi
  80145b:	48 b8 e9 0b 80 00 00 	movabs $0x800be9,%rax
  801462:	00 00 00 
  801465:	ff d0                	callq  *%rax
  801467:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80146a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80146e:	78 08                	js     801478 <dup+0x173>
  801470:	8b 45 c8             	mov    -0x38(%rbp),%eax
  801473:	eb 37                	jmp    8014ac <dup+0x1a7>
  801475:	90                   	nop
  801476:	eb 01                	jmp    801479 <dup+0x174>
  801478:	90                   	nop
  801479:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80147d:	48 89 c6             	mov    %rax,%rsi
  801480:	bf 00 00 00 00       	mov    $0x0,%edi
  801485:	48 b8 49 0c 80 00 00 	movabs $0x800c49,%rax
  80148c:	00 00 00 
  80148f:	ff d0                	callq  *%rax
  801491:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801495:	48 89 c6             	mov    %rax,%rsi
  801498:	bf 00 00 00 00       	mov    $0x0,%edi
  80149d:	48 b8 49 0c 80 00 00 	movabs $0x800c49,%rax
  8014a4:	00 00 00 
  8014a7:	ff d0                	callq  *%rax
  8014a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8014ac:	c9                   	leaveq 
  8014ad:	c3                   	retq   

00000000008014ae <read>:
  8014ae:	55                   	push   %rbp
  8014af:	48 89 e5             	mov    %rsp,%rbp
  8014b2:	48 83 ec 40          	sub    $0x40,%rsp
  8014b6:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8014b9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8014bd:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8014c1:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8014c5:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8014c8:	48 89 d6             	mov    %rdx,%rsi
  8014cb:	89 c7                	mov    %eax,%edi
  8014cd:	48 b8 79 10 80 00 00 	movabs $0x801079,%rax
  8014d4:	00 00 00 
  8014d7:	ff d0                	callq  *%rax
  8014d9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8014dc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8014e0:	78 24                	js     801506 <read+0x58>
  8014e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014e6:	8b 00                	mov    (%rax),%eax
  8014e8:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8014ec:	48 89 d6             	mov    %rdx,%rsi
  8014ef:	89 c7                	mov    %eax,%edi
  8014f1:	48 b8 d4 11 80 00 00 	movabs $0x8011d4,%rax
  8014f8:	00 00 00 
  8014fb:	ff d0                	callq  *%rax
  8014fd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801500:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801504:	79 05                	jns    80150b <read+0x5d>
  801506:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801509:	eb 76                	jmp    801581 <read+0xd3>
  80150b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80150f:	8b 40 08             	mov    0x8(%rax),%eax
  801512:	83 e0 03             	and    $0x3,%eax
  801515:	83 f8 01             	cmp    $0x1,%eax
  801518:	75 3a                	jne    801554 <read+0xa6>
  80151a:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  801521:	00 00 00 
  801524:	48 8b 00             	mov    (%rax),%rax
  801527:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80152d:	8b 55 dc             	mov    -0x24(%rbp),%edx
  801530:	89 c6                	mov    %eax,%esi
  801532:	48 bf df 40 80 00 00 	movabs $0x8040df,%rdi
  801539:	00 00 00 
  80153c:	b8 00 00 00 00       	mov    $0x0,%eax
  801541:	48 b9 7b 32 80 00 00 	movabs $0x80327b,%rcx
  801548:	00 00 00 
  80154b:	ff d1                	callq  *%rcx
  80154d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801552:	eb 2d                	jmp    801581 <read+0xd3>
  801554:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801558:	48 8b 40 10          	mov    0x10(%rax),%rax
  80155c:	48 85 c0             	test   %rax,%rax
  80155f:	75 07                	jne    801568 <read+0xba>
  801561:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  801566:	eb 19                	jmp    801581 <read+0xd3>
  801568:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80156c:	48 8b 40 10          	mov    0x10(%rax),%rax
  801570:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801574:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801578:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80157c:	48 89 cf             	mov    %rcx,%rdi
  80157f:	ff d0                	callq  *%rax
  801581:	c9                   	leaveq 
  801582:	c3                   	retq   

0000000000801583 <readn>:
  801583:	55                   	push   %rbp
  801584:	48 89 e5             	mov    %rsp,%rbp
  801587:	48 83 ec 30          	sub    $0x30,%rsp
  80158b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80158e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801592:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801596:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80159d:	eb 47                	jmp    8015e6 <readn+0x63>
  80159f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8015a2:	48 98                	cltq   
  8015a4:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8015a8:	48 29 c2             	sub    %rax,%rdx
  8015ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8015ae:	48 63 c8             	movslq %eax,%rcx
  8015b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8015b5:	48 01 c1             	add    %rax,%rcx
  8015b8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8015bb:	48 89 ce             	mov    %rcx,%rsi
  8015be:	89 c7                	mov    %eax,%edi
  8015c0:	48 b8 ae 14 80 00 00 	movabs $0x8014ae,%rax
  8015c7:	00 00 00 
  8015ca:	ff d0                	callq  *%rax
  8015cc:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8015cf:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8015d3:	79 05                	jns    8015da <readn+0x57>
  8015d5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8015d8:	eb 1d                	jmp    8015f7 <readn+0x74>
  8015da:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8015de:	74 13                	je     8015f3 <readn+0x70>
  8015e0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8015e3:	01 45 fc             	add    %eax,-0x4(%rbp)
  8015e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8015e9:	48 98                	cltq   
  8015eb:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8015ef:	72 ae                	jb     80159f <readn+0x1c>
  8015f1:	eb 01                	jmp    8015f4 <readn+0x71>
  8015f3:	90                   	nop
  8015f4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8015f7:	c9                   	leaveq 
  8015f8:	c3                   	retq   

00000000008015f9 <write>:
  8015f9:	55                   	push   %rbp
  8015fa:	48 89 e5             	mov    %rsp,%rbp
  8015fd:	48 83 ec 40          	sub    $0x40,%rsp
  801601:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801604:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801608:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80160c:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  801610:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801613:	48 89 d6             	mov    %rdx,%rsi
  801616:	89 c7                	mov    %eax,%edi
  801618:	48 b8 79 10 80 00 00 	movabs $0x801079,%rax
  80161f:	00 00 00 
  801622:	ff d0                	callq  *%rax
  801624:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801627:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80162b:	78 24                	js     801651 <write+0x58>
  80162d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801631:	8b 00                	mov    (%rax),%eax
  801633:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801637:	48 89 d6             	mov    %rdx,%rsi
  80163a:	89 c7                	mov    %eax,%edi
  80163c:	48 b8 d4 11 80 00 00 	movabs $0x8011d4,%rax
  801643:	00 00 00 
  801646:	ff d0                	callq  *%rax
  801648:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80164b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80164f:	79 05                	jns    801656 <write+0x5d>
  801651:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801654:	eb 75                	jmp    8016cb <write+0xd2>
  801656:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80165a:	8b 40 08             	mov    0x8(%rax),%eax
  80165d:	83 e0 03             	and    $0x3,%eax
  801660:	85 c0                	test   %eax,%eax
  801662:	75 3a                	jne    80169e <write+0xa5>
  801664:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80166b:	00 00 00 
  80166e:	48 8b 00             	mov    (%rax),%rax
  801671:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  801677:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80167a:	89 c6                	mov    %eax,%esi
  80167c:	48 bf fb 40 80 00 00 	movabs $0x8040fb,%rdi
  801683:	00 00 00 
  801686:	b8 00 00 00 00       	mov    $0x0,%eax
  80168b:	48 b9 7b 32 80 00 00 	movabs $0x80327b,%rcx
  801692:	00 00 00 
  801695:	ff d1                	callq  *%rcx
  801697:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80169c:	eb 2d                	jmp    8016cb <write+0xd2>
  80169e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016a2:	48 8b 40 18          	mov    0x18(%rax),%rax
  8016a6:	48 85 c0             	test   %rax,%rax
  8016a9:	75 07                	jne    8016b2 <write+0xb9>
  8016ab:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8016b0:	eb 19                	jmp    8016cb <write+0xd2>
  8016b2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016b6:	48 8b 40 18          	mov    0x18(%rax),%rax
  8016ba:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8016be:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8016c2:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8016c6:	48 89 cf             	mov    %rcx,%rdi
  8016c9:	ff d0                	callq  *%rax
  8016cb:	c9                   	leaveq 
  8016cc:	c3                   	retq   

00000000008016cd <seek>:
  8016cd:	55                   	push   %rbp
  8016ce:	48 89 e5             	mov    %rsp,%rbp
  8016d1:	48 83 ec 18          	sub    $0x18,%rsp
  8016d5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8016d8:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8016db:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8016df:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8016e2:	48 89 d6             	mov    %rdx,%rsi
  8016e5:	89 c7                	mov    %eax,%edi
  8016e7:	48 b8 79 10 80 00 00 	movabs $0x801079,%rax
  8016ee:	00 00 00 
  8016f1:	ff d0                	callq  *%rax
  8016f3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8016f6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8016fa:	79 05                	jns    801701 <seek+0x34>
  8016fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8016ff:	eb 0f                	jmp    801710 <seek+0x43>
  801701:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801705:	8b 55 e8             	mov    -0x18(%rbp),%edx
  801708:	89 50 04             	mov    %edx,0x4(%rax)
  80170b:	b8 00 00 00 00       	mov    $0x0,%eax
  801710:	c9                   	leaveq 
  801711:	c3                   	retq   

0000000000801712 <ftruncate>:
  801712:	55                   	push   %rbp
  801713:	48 89 e5             	mov    %rsp,%rbp
  801716:	48 83 ec 30          	sub    $0x30,%rsp
  80171a:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80171d:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801720:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  801724:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801727:	48 89 d6             	mov    %rdx,%rsi
  80172a:	89 c7                	mov    %eax,%edi
  80172c:	48 b8 79 10 80 00 00 	movabs $0x801079,%rax
  801733:	00 00 00 
  801736:	ff d0                	callq  *%rax
  801738:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80173b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80173f:	78 24                	js     801765 <ftruncate+0x53>
  801741:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801745:	8b 00                	mov    (%rax),%eax
  801747:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80174b:	48 89 d6             	mov    %rdx,%rsi
  80174e:	89 c7                	mov    %eax,%edi
  801750:	48 b8 d4 11 80 00 00 	movabs $0x8011d4,%rax
  801757:	00 00 00 
  80175a:	ff d0                	callq  *%rax
  80175c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80175f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801763:	79 05                	jns    80176a <ftruncate+0x58>
  801765:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801768:	eb 72                	jmp    8017dc <ftruncate+0xca>
  80176a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80176e:	8b 40 08             	mov    0x8(%rax),%eax
  801771:	83 e0 03             	and    $0x3,%eax
  801774:	85 c0                	test   %eax,%eax
  801776:	75 3a                	jne    8017b2 <ftruncate+0xa0>
  801778:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80177f:	00 00 00 
  801782:	48 8b 00             	mov    (%rax),%rax
  801785:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80178b:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80178e:	89 c6                	mov    %eax,%esi
  801790:	48 bf 18 41 80 00 00 	movabs $0x804118,%rdi
  801797:	00 00 00 
  80179a:	b8 00 00 00 00       	mov    $0x0,%eax
  80179f:	48 b9 7b 32 80 00 00 	movabs $0x80327b,%rcx
  8017a6:	00 00 00 
  8017a9:	ff d1                	callq  *%rcx
  8017ab:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8017b0:	eb 2a                	jmp    8017dc <ftruncate+0xca>
  8017b2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017b6:	48 8b 40 30          	mov    0x30(%rax),%rax
  8017ba:	48 85 c0             	test   %rax,%rax
  8017bd:	75 07                	jne    8017c6 <ftruncate+0xb4>
  8017bf:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8017c4:	eb 16                	jmp    8017dc <ftruncate+0xca>
  8017c6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017ca:	48 8b 40 30          	mov    0x30(%rax),%rax
  8017ce:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017d2:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8017d5:	89 ce                	mov    %ecx,%esi
  8017d7:	48 89 d7             	mov    %rdx,%rdi
  8017da:	ff d0                	callq  *%rax
  8017dc:	c9                   	leaveq 
  8017dd:	c3                   	retq   

00000000008017de <fstat>:
  8017de:	55                   	push   %rbp
  8017df:	48 89 e5             	mov    %rsp,%rbp
  8017e2:	48 83 ec 30          	sub    $0x30,%rsp
  8017e6:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8017e9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8017ed:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8017f1:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8017f4:	48 89 d6             	mov    %rdx,%rsi
  8017f7:	89 c7                	mov    %eax,%edi
  8017f9:	48 b8 79 10 80 00 00 	movabs $0x801079,%rax
  801800:	00 00 00 
  801803:	ff d0                	callq  *%rax
  801805:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801808:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80180c:	78 24                	js     801832 <fstat+0x54>
  80180e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801812:	8b 00                	mov    (%rax),%eax
  801814:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801818:	48 89 d6             	mov    %rdx,%rsi
  80181b:	89 c7                	mov    %eax,%edi
  80181d:	48 b8 d4 11 80 00 00 	movabs $0x8011d4,%rax
  801824:	00 00 00 
  801827:	ff d0                	callq  *%rax
  801829:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80182c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801830:	79 05                	jns    801837 <fstat+0x59>
  801832:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801835:	eb 5e                	jmp    801895 <fstat+0xb7>
  801837:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80183b:	48 8b 40 28          	mov    0x28(%rax),%rax
  80183f:	48 85 c0             	test   %rax,%rax
  801842:	75 07                	jne    80184b <fstat+0x6d>
  801844:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  801849:	eb 4a                	jmp    801895 <fstat+0xb7>
  80184b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80184f:	c6 00 00             	movb   $0x0,(%rax)
  801852:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801856:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  80185d:	00 00 00 
  801860:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801864:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80186b:	00 00 00 
  80186e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801872:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801876:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  80187d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801881:	48 8b 40 28          	mov    0x28(%rax),%rax
  801885:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801889:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  80188d:	48 89 ce             	mov    %rcx,%rsi
  801890:	48 89 d7             	mov    %rdx,%rdi
  801893:	ff d0                	callq  *%rax
  801895:	c9                   	leaveq 
  801896:	c3                   	retq   

0000000000801897 <stat>:
  801897:	55                   	push   %rbp
  801898:	48 89 e5             	mov    %rsp,%rbp
  80189b:	48 83 ec 20          	sub    $0x20,%rsp
  80189f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8018a3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8018a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018ab:	be 00 00 00 00       	mov    $0x0,%esi
  8018b0:	48 89 c7             	mov    %rax,%rdi
  8018b3:	48 b8 87 19 80 00 00 	movabs $0x801987,%rax
  8018ba:	00 00 00 
  8018bd:	ff d0                	callq  *%rax
  8018bf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8018c2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8018c6:	79 05                	jns    8018cd <stat+0x36>
  8018c8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018cb:	eb 2f                	jmp    8018fc <stat+0x65>
  8018cd:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8018d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018d4:	48 89 d6             	mov    %rdx,%rsi
  8018d7:	89 c7                	mov    %eax,%edi
  8018d9:	48 b8 de 17 80 00 00 	movabs $0x8017de,%rax
  8018e0:	00 00 00 
  8018e3:	ff d0                	callq  *%rax
  8018e5:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8018e8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018eb:	89 c7                	mov    %eax,%edi
  8018ed:	48 b8 8b 12 80 00 00 	movabs $0x80128b,%rax
  8018f4:	00 00 00 
  8018f7:	ff d0                	callq  *%rax
  8018f9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8018fc:	c9                   	leaveq 
  8018fd:	c3                   	retq   

00000000008018fe <fsipc>:
  8018fe:	55                   	push   %rbp
  8018ff:	48 89 e5             	mov    %rsp,%rbp
  801902:	48 83 ec 10          	sub    $0x10,%rsp
  801906:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801909:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80190d:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  801914:	00 00 00 
  801917:	8b 00                	mov    (%rax),%eax
  801919:	85 c0                	test   %eax,%eax
  80191b:	75 1f                	jne    80193c <fsipc+0x3e>
  80191d:	bf 01 00 00 00       	mov    $0x1,%edi
  801922:	48 b8 6a 3f 80 00 00 	movabs $0x803f6a,%rax
  801929:	00 00 00 
  80192c:	ff d0                	callq  *%rax
  80192e:	89 c2                	mov    %eax,%edx
  801930:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  801937:	00 00 00 
  80193a:	89 10                	mov    %edx,(%rax)
  80193c:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  801943:	00 00 00 
  801946:	8b 00                	mov    (%rax),%eax
  801948:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80194b:	b9 07 00 00 00       	mov    $0x7,%ecx
  801950:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  801957:	00 00 00 
  80195a:	89 c7                	mov    %eax,%edi
  80195c:	48 b8 60 3e 80 00 00 	movabs $0x803e60,%rax
  801963:	00 00 00 
  801966:	ff d0                	callq  *%rax
  801968:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80196c:	ba 00 00 00 00       	mov    $0x0,%edx
  801971:	48 89 c6             	mov    %rax,%rsi
  801974:	bf 00 00 00 00       	mov    $0x0,%edi
  801979:	48 b8 9f 3d 80 00 00 	movabs $0x803d9f,%rax
  801980:	00 00 00 
  801983:	ff d0                	callq  *%rax
  801985:	c9                   	leaveq 
  801986:	c3                   	retq   

0000000000801987 <open>:
  801987:	55                   	push   %rbp
  801988:	48 89 e5             	mov    %rsp,%rbp
  80198b:	48 83 ec 20          	sub    $0x20,%rsp
  80198f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801993:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801996:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80199a:	48 89 c7             	mov    %rax,%rdi
  80199d:	48 b8 fb 01 80 00 00 	movabs $0x8001fb,%rax
  8019a4:	00 00 00 
  8019a7:	ff d0                	callq  *%rax
  8019a9:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8019ae:	7e 0a                	jle    8019ba <open+0x33>
  8019b0:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8019b5:	e9 a5 00 00 00       	jmpq   801a5f <open+0xd8>
  8019ba:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8019be:	48 89 c7             	mov    %rax,%rdi
  8019c1:	48 b8 e1 0f 80 00 00 	movabs $0x800fe1,%rax
  8019c8:	00 00 00 
  8019cb:	ff d0                	callq  *%rax
  8019cd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8019d0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8019d4:	79 08                	jns    8019de <open+0x57>
  8019d6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019d9:	e9 81 00 00 00       	jmpq   801a5f <open+0xd8>
  8019de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019e2:	48 89 c6             	mov    %rax,%rsi
  8019e5:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  8019ec:	00 00 00 
  8019ef:	48 b8 67 02 80 00 00 	movabs $0x800267,%rax
  8019f6:	00 00 00 
  8019f9:	ff d0                	callq  *%rax
  8019fb:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801a02:	00 00 00 
  801a05:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801a08:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  801a0e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a12:	48 89 c6             	mov    %rax,%rsi
  801a15:	bf 01 00 00 00       	mov    $0x1,%edi
  801a1a:	48 b8 fe 18 80 00 00 	movabs $0x8018fe,%rax
  801a21:	00 00 00 
  801a24:	ff d0                	callq  *%rax
  801a26:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801a29:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801a2d:	79 1d                	jns    801a4c <open+0xc5>
  801a2f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a33:	be 00 00 00 00       	mov    $0x0,%esi
  801a38:	48 89 c7             	mov    %rax,%rdi
  801a3b:	48 b8 09 11 80 00 00 	movabs $0x801109,%rax
  801a42:	00 00 00 
  801a45:	ff d0                	callq  *%rax
  801a47:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a4a:	eb 13                	jmp    801a5f <open+0xd8>
  801a4c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a50:	48 89 c7             	mov    %rax,%rdi
  801a53:	48 b8 93 0f 80 00 00 	movabs $0x800f93,%rax
  801a5a:	00 00 00 
  801a5d:	ff d0                	callq  *%rax
  801a5f:	c9                   	leaveq 
  801a60:	c3                   	retq   

0000000000801a61 <devfile_flush>:
  801a61:	55                   	push   %rbp
  801a62:	48 89 e5             	mov    %rsp,%rbp
  801a65:	48 83 ec 10          	sub    $0x10,%rsp
  801a69:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a6d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a71:	8b 50 0c             	mov    0xc(%rax),%edx
  801a74:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801a7b:	00 00 00 
  801a7e:	89 10                	mov    %edx,(%rax)
  801a80:	be 00 00 00 00       	mov    $0x0,%esi
  801a85:	bf 06 00 00 00       	mov    $0x6,%edi
  801a8a:	48 b8 fe 18 80 00 00 	movabs $0x8018fe,%rax
  801a91:	00 00 00 
  801a94:	ff d0                	callq  *%rax
  801a96:	c9                   	leaveq 
  801a97:	c3                   	retq   

0000000000801a98 <devfile_read>:
  801a98:	55                   	push   %rbp
  801a99:	48 89 e5             	mov    %rsp,%rbp
  801a9c:	48 83 ec 30          	sub    $0x30,%rsp
  801aa0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801aa4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801aa8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801aac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ab0:	8b 50 0c             	mov    0xc(%rax),%edx
  801ab3:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801aba:	00 00 00 
  801abd:	89 10                	mov    %edx,(%rax)
  801abf:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801ac6:	00 00 00 
  801ac9:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801acd:	48 89 50 08          	mov    %rdx,0x8(%rax)
  801ad1:	be 00 00 00 00       	mov    $0x0,%esi
  801ad6:	bf 03 00 00 00       	mov    $0x3,%edi
  801adb:	48 b8 fe 18 80 00 00 	movabs $0x8018fe,%rax
  801ae2:	00 00 00 
  801ae5:	ff d0                	callq  *%rax
  801ae7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801aea:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801aee:	79 08                	jns    801af8 <devfile_read+0x60>
  801af0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801af3:	e9 a4 00 00 00       	jmpq   801b9c <devfile_read+0x104>
  801af8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801afb:	48 98                	cltq   
  801afd:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801b01:	76 35                	jbe    801b38 <devfile_read+0xa0>
  801b03:	48 b9 3e 41 80 00 00 	movabs $0x80413e,%rcx
  801b0a:	00 00 00 
  801b0d:	48 ba 45 41 80 00 00 	movabs $0x804145,%rdx
  801b14:	00 00 00 
  801b17:	be 89 00 00 00       	mov    $0x89,%esi
  801b1c:	48 bf 5a 41 80 00 00 	movabs $0x80415a,%rdi
  801b23:	00 00 00 
  801b26:	b8 00 00 00 00       	mov    $0x0,%eax
  801b2b:	49 b8 41 30 80 00 00 	movabs $0x803041,%r8
  801b32:	00 00 00 
  801b35:	41 ff d0             	callq  *%r8
  801b38:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  801b3f:	7e 35                	jle    801b76 <devfile_read+0xde>
  801b41:	48 b9 68 41 80 00 00 	movabs $0x804168,%rcx
  801b48:	00 00 00 
  801b4b:	48 ba 45 41 80 00 00 	movabs $0x804145,%rdx
  801b52:	00 00 00 
  801b55:	be 8a 00 00 00       	mov    $0x8a,%esi
  801b5a:	48 bf 5a 41 80 00 00 	movabs $0x80415a,%rdi
  801b61:	00 00 00 
  801b64:	b8 00 00 00 00       	mov    $0x0,%eax
  801b69:	49 b8 41 30 80 00 00 	movabs $0x803041,%r8
  801b70:	00 00 00 
  801b73:	41 ff d0             	callq  *%r8
  801b76:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b79:	48 63 d0             	movslq %eax,%rdx
  801b7c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801b80:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  801b87:	00 00 00 
  801b8a:	48 89 c7             	mov    %rax,%rdi
  801b8d:	48 b8 8c 05 80 00 00 	movabs $0x80058c,%rax
  801b94:	00 00 00 
  801b97:	ff d0                	callq  *%rax
  801b99:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b9c:	c9                   	leaveq 
  801b9d:	c3                   	retq   

0000000000801b9e <devfile_write>:
  801b9e:	55                   	push   %rbp
  801b9f:	48 89 e5             	mov    %rsp,%rbp
  801ba2:	48 83 ec 40          	sub    $0x40,%rsp
  801ba6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801baa:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801bae:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  801bb2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801bb6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801bba:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  801bc1:	00 
  801bc2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801bc6:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  801bca:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  801bcf:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  801bd3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801bd7:	8b 50 0c             	mov    0xc(%rax),%edx
  801bda:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801be1:	00 00 00 
  801be4:	89 10                	mov    %edx,(%rax)
  801be6:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801bed:	00 00 00 
  801bf0:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801bf4:	48 89 50 08          	mov    %rdx,0x8(%rax)
  801bf8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801bfc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801c00:	48 89 c6             	mov    %rax,%rsi
  801c03:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  801c0a:	00 00 00 
  801c0d:	48 b8 8c 05 80 00 00 	movabs $0x80058c,%rax
  801c14:	00 00 00 
  801c17:	ff d0                	callq  *%rax
  801c19:	be 00 00 00 00       	mov    $0x0,%esi
  801c1e:	bf 04 00 00 00       	mov    $0x4,%edi
  801c23:	48 b8 fe 18 80 00 00 	movabs $0x8018fe,%rax
  801c2a:	00 00 00 
  801c2d:	ff d0                	callq  *%rax
  801c2f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801c32:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801c36:	79 05                	jns    801c3d <devfile_write+0x9f>
  801c38:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801c3b:	eb 43                	jmp    801c80 <devfile_write+0xe2>
  801c3d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801c40:	48 98                	cltq   
  801c42:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  801c46:	76 35                	jbe    801c7d <devfile_write+0xdf>
  801c48:	48 b9 3e 41 80 00 00 	movabs $0x80413e,%rcx
  801c4f:	00 00 00 
  801c52:	48 ba 45 41 80 00 00 	movabs $0x804145,%rdx
  801c59:	00 00 00 
  801c5c:	be a8 00 00 00       	mov    $0xa8,%esi
  801c61:	48 bf 5a 41 80 00 00 	movabs $0x80415a,%rdi
  801c68:	00 00 00 
  801c6b:	b8 00 00 00 00       	mov    $0x0,%eax
  801c70:	49 b8 41 30 80 00 00 	movabs $0x803041,%r8
  801c77:	00 00 00 
  801c7a:	41 ff d0             	callq  *%r8
  801c7d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801c80:	c9                   	leaveq 
  801c81:	c3                   	retq   

0000000000801c82 <devfile_stat>:
  801c82:	55                   	push   %rbp
  801c83:	48 89 e5             	mov    %rsp,%rbp
  801c86:	48 83 ec 20          	sub    $0x20,%rsp
  801c8a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801c8e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801c92:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c96:	8b 50 0c             	mov    0xc(%rax),%edx
  801c99:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801ca0:	00 00 00 
  801ca3:	89 10                	mov    %edx,(%rax)
  801ca5:	be 00 00 00 00       	mov    $0x0,%esi
  801caa:	bf 05 00 00 00       	mov    $0x5,%edi
  801caf:	48 b8 fe 18 80 00 00 	movabs $0x8018fe,%rax
  801cb6:	00 00 00 
  801cb9:	ff d0                	callq  *%rax
  801cbb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801cbe:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801cc2:	79 05                	jns    801cc9 <devfile_stat+0x47>
  801cc4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cc7:	eb 56                	jmp    801d1f <devfile_stat+0x9d>
  801cc9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801ccd:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  801cd4:	00 00 00 
  801cd7:	48 89 c7             	mov    %rax,%rdi
  801cda:	48 b8 67 02 80 00 00 	movabs $0x800267,%rax
  801ce1:	00 00 00 
  801ce4:	ff d0                	callq  *%rax
  801ce6:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801ced:	00 00 00 
  801cf0:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  801cf6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801cfa:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  801d00:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801d07:	00 00 00 
  801d0a:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  801d10:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801d14:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  801d1a:	b8 00 00 00 00       	mov    $0x0,%eax
  801d1f:	c9                   	leaveq 
  801d20:	c3                   	retq   

0000000000801d21 <devfile_trunc>:
  801d21:	55                   	push   %rbp
  801d22:	48 89 e5             	mov    %rsp,%rbp
  801d25:	48 83 ec 10          	sub    $0x10,%rsp
  801d29:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d2d:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801d30:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d34:	8b 50 0c             	mov    0xc(%rax),%edx
  801d37:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801d3e:	00 00 00 
  801d41:	89 10                	mov    %edx,(%rax)
  801d43:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801d4a:	00 00 00 
  801d4d:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801d50:	89 50 04             	mov    %edx,0x4(%rax)
  801d53:	be 00 00 00 00       	mov    $0x0,%esi
  801d58:	bf 02 00 00 00       	mov    $0x2,%edi
  801d5d:	48 b8 fe 18 80 00 00 	movabs $0x8018fe,%rax
  801d64:	00 00 00 
  801d67:	ff d0                	callq  *%rax
  801d69:	c9                   	leaveq 
  801d6a:	c3                   	retq   

0000000000801d6b <remove>:
  801d6b:	55                   	push   %rbp
  801d6c:	48 89 e5             	mov    %rsp,%rbp
  801d6f:	48 83 ec 10          	sub    $0x10,%rsp
  801d73:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d77:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d7b:	48 89 c7             	mov    %rax,%rdi
  801d7e:	48 b8 fb 01 80 00 00 	movabs $0x8001fb,%rax
  801d85:	00 00 00 
  801d88:	ff d0                	callq  *%rax
  801d8a:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  801d8f:	7e 07                	jle    801d98 <remove+0x2d>
  801d91:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  801d96:	eb 33                	jmp    801dcb <remove+0x60>
  801d98:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d9c:	48 89 c6             	mov    %rax,%rsi
  801d9f:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  801da6:	00 00 00 
  801da9:	48 b8 67 02 80 00 00 	movabs $0x800267,%rax
  801db0:	00 00 00 
  801db3:	ff d0                	callq  *%rax
  801db5:	be 00 00 00 00       	mov    $0x0,%esi
  801dba:	bf 07 00 00 00       	mov    $0x7,%edi
  801dbf:	48 b8 fe 18 80 00 00 	movabs $0x8018fe,%rax
  801dc6:	00 00 00 
  801dc9:	ff d0                	callq  *%rax
  801dcb:	c9                   	leaveq 
  801dcc:	c3                   	retq   

0000000000801dcd <sync>:
  801dcd:	55                   	push   %rbp
  801dce:	48 89 e5             	mov    %rsp,%rbp
  801dd1:	be 00 00 00 00       	mov    $0x0,%esi
  801dd6:	bf 08 00 00 00       	mov    $0x8,%edi
  801ddb:	48 b8 fe 18 80 00 00 	movabs $0x8018fe,%rax
  801de2:	00 00 00 
  801de5:	ff d0                	callq  *%rax
  801de7:	5d                   	pop    %rbp
  801de8:	c3                   	retq   

0000000000801de9 <copy>:
  801de9:	55                   	push   %rbp
  801dea:	48 89 e5             	mov    %rsp,%rbp
  801ded:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  801df4:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  801dfb:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  801e02:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  801e09:	be 00 00 00 00       	mov    $0x0,%esi
  801e0e:	48 89 c7             	mov    %rax,%rdi
  801e11:	48 b8 87 19 80 00 00 	movabs $0x801987,%rax
  801e18:	00 00 00 
  801e1b:	ff d0                	callq  *%rax
  801e1d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801e20:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801e24:	79 28                	jns    801e4e <copy+0x65>
  801e26:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e29:	89 c6                	mov    %eax,%esi
  801e2b:	48 bf 74 41 80 00 00 	movabs $0x804174,%rdi
  801e32:	00 00 00 
  801e35:	b8 00 00 00 00       	mov    $0x0,%eax
  801e3a:	48 ba 7b 32 80 00 00 	movabs $0x80327b,%rdx
  801e41:	00 00 00 
  801e44:	ff d2                	callq  *%rdx
  801e46:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e49:	e9 76 01 00 00       	jmpq   801fc4 <copy+0x1db>
  801e4e:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  801e55:	be 01 01 00 00       	mov    $0x101,%esi
  801e5a:	48 89 c7             	mov    %rax,%rdi
  801e5d:	48 b8 87 19 80 00 00 	movabs $0x801987,%rax
  801e64:	00 00 00 
  801e67:	ff d0                	callq  *%rax
  801e69:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801e6c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801e70:	0f 89 ad 00 00 00    	jns    801f23 <copy+0x13a>
  801e76:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e79:	89 c6                	mov    %eax,%esi
  801e7b:	48 bf 8a 41 80 00 00 	movabs $0x80418a,%rdi
  801e82:	00 00 00 
  801e85:	b8 00 00 00 00       	mov    $0x0,%eax
  801e8a:	48 ba 7b 32 80 00 00 	movabs $0x80327b,%rdx
  801e91:	00 00 00 
  801e94:	ff d2                	callq  *%rdx
  801e96:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e99:	89 c7                	mov    %eax,%edi
  801e9b:	48 b8 8b 12 80 00 00 	movabs $0x80128b,%rax
  801ea2:	00 00 00 
  801ea5:	ff d0                	callq  *%rax
  801ea7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801eaa:	e9 15 01 00 00       	jmpq   801fc4 <copy+0x1db>
  801eaf:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801eb2:	48 63 d0             	movslq %eax,%rdx
  801eb5:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  801ebc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ebf:	48 89 ce             	mov    %rcx,%rsi
  801ec2:	89 c7                	mov    %eax,%edi
  801ec4:	48 b8 f9 15 80 00 00 	movabs $0x8015f9,%rax
  801ecb:	00 00 00 
  801ece:	ff d0                	callq  *%rax
  801ed0:	89 45 f0             	mov    %eax,-0x10(%rbp)
  801ed3:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  801ed7:	79 4a                	jns    801f23 <copy+0x13a>
  801ed9:	8b 45 f0             	mov    -0x10(%rbp),%eax
  801edc:	89 c6                	mov    %eax,%esi
  801ede:	48 bf a4 41 80 00 00 	movabs $0x8041a4,%rdi
  801ee5:	00 00 00 
  801ee8:	b8 00 00 00 00       	mov    $0x0,%eax
  801eed:	48 ba 7b 32 80 00 00 	movabs $0x80327b,%rdx
  801ef4:	00 00 00 
  801ef7:	ff d2                	callq  *%rdx
  801ef9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801efc:	89 c7                	mov    %eax,%edi
  801efe:	48 b8 8b 12 80 00 00 	movabs $0x80128b,%rax
  801f05:	00 00 00 
  801f08:	ff d0                	callq  *%rax
  801f0a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f0d:	89 c7                	mov    %eax,%edi
  801f0f:	48 b8 8b 12 80 00 00 	movabs $0x80128b,%rax
  801f16:	00 00 00 
  801f19:	ff d0                	callq  *%rax
  801f1b:	8b 45 f0             	mov    -0x10(%rbp),%eax
  801f1e:	e9 a1 00 00 00       	jmpq   801fc4 <copy+0x1db>
  801f23:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  801f2a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f2d:	ba 00 02 00 00       	mov    $0x200,%edx
  801f32:	48 89 ce             	mov    %rcx,%rsi
  801f35:	89 c7                	mov    %eax,%edi
  801f37:	48 b8 ae 14 80 00 00 	movabs $0x8014ae,%rax
  801f3e:	00 00 00 
  801f41:	ff d0                	callq  *%rax
  801f43:	89 45 f4             	mov    %eax,-0xc(%rbp)
  801f46:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  801f4a:	0f 8f 5f ff ff ff    	jg     801eaf <copy+0xc6>
  801f50:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  801f54:	79 47                	jns    801f9d <copy+0x1b4>
  801f56:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801f59:	89 c6                	mov    %eax,%esi
  801f5b:	48 bf b7 41 80 00 00 	movabs $0x8041b7,%rdi
  801f62:	00 00 00 
  801f65:	b8 00 00 00 00       	mov    $0x0,%eax
  801f6a:	48 ba 7b 32 80 00 00 	movabs $0x80327b,%rdx
  801f71:	00 00 00 
  801f74:	ff d2                	callq  *%rdx
  801f76:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f79:	89 c7                	mov    %eax,%edi
  801f7b:	48 b8 8b 12 80 00 00 	movabs $0x80128b,%rax
  801f82:	00 00 00 
  801f85:	ff d0                	callq  *%rax
  801f87:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f8a:	89 c7                	mov    %eax,%edi
  801f8c:	48 b8 8b 12 80 00 00 	movabs $0x80128b,%rax
  801f93:	00 00 00 
  801f96:	ff d0                	callq  *%rax
  801f98:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801f9b:	eb 27                	jmp    801fc4 <copy+0x1db>
  801f9d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801fa0:	89 c7                	mov    %eax,%edi
  801fa2:	48 b8 8b 12 80 00 00 	movabs $0x80128b,%rax
  801fa9:	00 00 00 
  801fac:	ff d0                	callq  *%rax
  801fae:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801fb1:	89 c7                	mov    %eax,%edi
  801fb3:	48 b8 8b 12 80 00 00 	movabs $0x80128b,%rax
  801fba:	00 00 00 
  801fbd:	ff d0                	callq  *%rax
  801fbf:	b8 00 00 00 00       	mov    $0x0,%eax
  801fc4:	c9                   	leaveq 
  801fc5:	c3                   	retq   

0000000000801fc6 <fd2sockid>:
  801fc6:	55                   	push   %rbp
  801fc7:	48 89 e5             	mov    %rsp,%rbp
  801fca:	48 83 ec 20          	sub    $0x20,%rsp
  801fce:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801fd1:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801fd5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801fd8:	48 89 d6             	mov    %rdx,%rsi
  801fdb:	89 c7                	mov    %eax,%edi
  801fdd:	48 b8 79 10 80 00 00 	movabs $0x801079,%rax
  801fe4:	00 00 00 
  801fe7:	ff d0                	callq  *%rax
  801fe9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801fec:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801ff0:	79 05                	jns    801ff7 <fd2sockid+0x31>
  801ff2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ff5:	eb 24                	jmp    80201b <fd2sockid+0x55>
  801ff7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ffb:	8b 10                	mov    (%rax),%edx
  801ffd:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  802004:	00 00 00 
  802007:	8b 00                	mov    (%rax),%eax
  802009:	39 c2                	cmp    %eax,%edx
  80200b:	74 07                	je     802014 <fd2sockid+0x4e>
  80200d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802012:	eb 07                	jmp    80201b <fd2sockid+0x55>
  802014:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802018:	8b 40 0c             	mov    0xc(%rax),%eax
  80201b:	c9                   	leaveq 
  80201c:	c3                   	retq   

000000000080201d <alloc_sockfd>:
  80201d:	55                   	push   %rbp
  80201e:	48 89 e5             	mov    %rsp,%rbp
  802021:	48 83 ec 20          	sub    $0x20,%rsp
  802025:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802028:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80202c:	48 89 c7             	mov    %rax,%rdi
  80202f:	48 b8 e1 0f 80 00 00 	movabs $0x800fe1,%rax
  802036:	00 00 00 
  802039:	ff d0                	callq  *%rax
  80203b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80203e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802042:	78 26                	js     80206a <alloc_sockfd+0x4d>
  802044:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802048:	ba 07 04 00 00       	mov    $0x407,%edx
  80204d:	48 89 c6             	mov    %rax,%rsi
  802050:	bf 00 00 00 00       	mov    $0x0,%edi
  802055:	48 b8 97 0b 80 00 00 	movabs $0x800b97,%rax
  80205c:	00 00 00 
  80205f:	ff d0                	callq  *%rax
  802061:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802064:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802068:	79 16                	jns    802080 <alloc_sockfd+0x63>
  80206a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80206d:	89 c7                	mov    %eax,%edi
  80206f:	48 b8 2c 25 80 00 00 	movabs $0x80252c,%rax
  802076:	00 00 00 
  802079:	ff d0                	callq  *%rax
  80207b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80207e:	eb 3a                	jmp    8020ba <alloc_sockfd+0x9d>
  802080:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802084:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  80208b:	00 00 00 
  80208e:	8b 12                	mov    (%rdx),%edx
  802090:	89 10                	mov    %edx,(%rax)
  802092:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802096:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80209d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020a1:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8020a4:	89 50 0c             	mov    %edx,0xc(%rax)
  8020a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020ab:	48 89 c7             	mov    %rax,%rdi
  8020ae:	48 b8 93 0f 80 00 00 	movabs $0x800f93,%rax
  8020b5:	00 00 00 
  8020b8:	ff d0                	callq  *%rax
  8020ba:	c9                   	leaveq 
  8020bb:	c3                   	retq   

00000000008020bc <accept>:
  8020bc:	55                   	push   %rbp
  8020bd:	48 89 e5             	mov    %rsp,%rbp
  8020c0:	48 83 ec 30          	sub    $0x30,%rsp
  8020c4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8020c7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8020cb:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8020cf:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8020d2:	89 c7                	mov    %eax,%edi
  8020d4:	48 b8 c6 1f 80 00 00 	movabs $0x801fc6,%rax
  8020db:	00 00 00 
  8020de:	ff d0                	callq  *%rax
  8020e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020e3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8020e7:	79 05                	jns    8020ee <accept+0x32>
  8020e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020ec:	eb 3b                	jmp    802129 <accept+0x6d>
  8020ee:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8020f2:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8020f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020f9:	48 89 ce             	mov    %rcx,%rsi
  8020fc:	89 c7                	mov    %eax,%edi
  8020fe:	48 b8 09 24 80 00 00 	movabs $0x802409,%rax
  802105:	00 00 00 
  802108:	ff d0                	callq  *%rax
  80210a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80210d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802111:	79 05                	jns    802118 <accept+0x5c>
  802113:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802116:	eb 11                	jmp    802129 <accept+0x6d>
  802118:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80211b:	89 c7                	mov    %eax,%edi
  80211d:	48 b8 1d 20 80 00 00 	movabs $0x80201d,%rax
  802124:	00 00 00 
  802127:	ff d0                	callq  *%rax
  802129:	c9                   	leaveq 
  80212a:	c3                   	retq   

000000000080212b <bind>:
  80212b:	55                   	push   %rbp
  80212c:	48 89 e5             	mov    %rsp,%rbp
  80212f:	48 83 ec 20          	sub    $0x20,%rsp
  802133:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802136:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80213a:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80213d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802140:	89 c7                	mov    %eax,%edi
  802142:	48 b8 c6 1f 80 00 00 	movabs $0x801fc6,%rax
  802149:	00 00 00 
  80214c:	ff d0                	callq  *%rax
  80214e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802151:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802155:	79 05                	jns    80215c <bind+0x31>
  802157:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80215a:	eb 1b                	jmp    802177 <bind+0x4c>
  80215c:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80215f:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802163:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802166:	48 89 ce             	mov    %rcx,%rsi
  802169:	89 c7                	mov    %eax,%edi
  80216b:	48 b8 88 24 80 00 00 	movabs $0x802488,%rax
  802172:	00 00 00 
  802175:	ff d0                	callq  *%rax
  802177:	c9                   	leaveq 
  802178:	c3                   	retq   

0000000000802179 <shutdown>:
  802179:	55                   	push   %rbp
  80217a:	48 89 e5             	mov    %rsp,%rbp
  80217d:	48 83 ec 20          	sub    $0x20,%rsp
  802181:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802184:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802187:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80218a:	89 c7                	mov    %eax,%edi
  80218c:	48 b8 c6 1f 80 00 00 	movabs $0x801fc6,%rax
  802193:	00 00 00 
  802196:	ff d0                	callq  *%rax
  802198:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80219b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80219f:	79 05                	jns    8021a6 <shutdown+0x2d>
  8021a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021a4:	eb 16                	jmp    8021bc <shutdown+0x43>
  8021a6:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8021a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021ac:	89 d6                	mov    %edx,%esi
  8021ae:	89 c7                	mov    %eax,%edi
  8021b0:	48 b8 ec 24 80 00 00 	movabs $0x8024ec,%rax
  8021b7:	00 00 00 
  8021ba:	ff d0                	callq  *%rax
  8021bc:	c9                   	leaveq 
  8021bd:	c3                   	retq   

00000000008021be <devsock_close>:
  8021be:	55                   	push   %rbp
  8021bf:	48 89 e5             	mov    %rsp,%rbp
  8021c2:	48 83 ec 10          	sub    $0x10,%rsp
  8021c6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8021ca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8021ce:	48 89 c7             	mov    %rax,%rdi
  8021d1:	48 b8 db 3f 80 00 00 	movabs $0x803fdb,%rax
  8021d8:	00 00 00 
  8021db:	ff d0                	callq  *%rax
  8021dd:	83 f8 01             	cmp    $0x1,%eax
  8021e0:	75 17                	jne    8021f9 <devsock_close+0x3b>
  8021e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8021e6:	8b 40 0c             	mov    0xc(%rax),%eax
  8021e9:	89 c7                	mov    %eax,%edi
  8021eb:	48 b8 2c 25 80 00 00 	movabs $0x80252c,%rax
  8021f2:	00 00 00 
  8021f5:	ff d0                	callq  *%rax
  8021f7:	eb 05                	jmp    8021fe <devsock_close+0x40>
  8021f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8021fe:	c9                   	leaveq 
  8021ff:	c3                   	retq   

0000000000802200 <connect>:
  802200:	55                   	push   %rbp
  802201:	48 89 e5             	mov    %rsp,%rbp
  802204:	48 83 ec 20          	sub    $0x20,%rsp
  802208:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80220b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80220f:	89 55 e8             	mov    %edx,-0x18(%rbp)
  802212:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802215:	89 c7                	mov    %eax,%edi
  802217:	48 b8 c6 1f 80 00 00 	movabs $0x801fc6,%rax
  80221e:	00 00 00 
  802221:	ff d0                	callq  *%rax
  802223:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802226:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80222a:	79 05                	jns    802231 <connect+0x31>
  80222c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80222f:	eb 1b                	jmp    80224c <connect+0x4c>
  802231:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802234:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802238:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80223b:	48 89 ce             	mov    %rcx,%rsi
  80223e:	89 c7                	mov    %eax,%edi
  802240:	48 b8 59 25 80 00 00 	movabs $0x802559,%rax
  802247:	00 00 00 
  80224a:	ff d0                	callq  *%rax
  80224c:	c9                   	leaveq 
  80224d:	c3                   	retq   

000000000080224e <listen>:
  80224e:	55                   	push   %rbp
  80224f:	48 89 e5             	mov    %rsp,%rbp
  802252:	48 83 ec 20          	sub    $0x20,%rsp
  802256:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802259:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80225c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80225f:	89 c7                	mov    %eax,%edi
  802261:	48 b8 c6 1f 80 00 00 	movabs $0x801fc6,%rax
  802268:	00 00 00 
  80226b:	ff d0                	callq  *%rax
  80226d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802270:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802274:	79 05                	jns    80227b <listen+0x2d>
  802276:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802279:	eb 16                	jmp    802291 <listen+0x43>
  80227b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80227e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802281:	89 d6                	mov    %edx,%esi
  802283:	89 c7                	mov    %eax,%edi
  802285:	48 b8 bd 25 80 00 00 	movabs $0x8025bd,%rax
  80228c:	00 00 00 
  80228f:	ff d0                	callq  *%rax
  802291:	c9                   	leaveq 
  802292:	c3                   	retq   

0000000000802293 <devsock_read>:
  802293:	55                   	push   %rbp
  802294:	48 89 e5             	mov    %rsp,%rbp
  802297:	48 83 ec 20          	sub    $0x20,%rsp
  80229b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80229f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8022a3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8022a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022ab:	89 c2                	mov    %eax,%edx
  8022ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022b1:	8b 40 0c             	mov    0xc(%rax),%eax
  8022b4:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8022b8:	b9 00 00 00 00       	mov    $0x0,%ecx
  8022bd:	89 c7                	mov    %eax,%edi
  8022bf:	48 b8 fd 25 80 00 00 	movabs $0x8025fd,%rax
  8022c6:	00 00 00 
  8022c9:	ff d0                	callq  *%rax
  8022cb:	c9                   	leaveq 
  8022cc:	c3                   	retq   

00000000008022cd <devsock_write>:
  8022cd:	55                   	push   %rbp
  8022ce:	48 89 e5             	mov    %rsp,%rbp
  8022d1:	48 83 ec 20          	sub    $0x20,%rsp
  8022d5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8022d9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8022dd:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8022e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022e5:	89 c2                	mov    %eax,%edx
  8022e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022eb:	8b 40 0c             	mov    0xc(%rax),%eax
  8022ee:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8022f2:	b9 00 00 00 00       	mov    $0x0,%ecx
  8022f7:	89 c7                	mov    %eax,%edi
  8022f9:	48 b8 c9 26 80 00 00 	movabs $0x8026c9,%rax
  802300:	00 00 00 
  802303:	ff d0                	callq  *%rax
  802305:	c9                   	leaveq 
  802306:	c3                   	retq   

0000000000802307 <devsock_stat>:
  802307:	55                   	push   %rbp
  802308:	48 89 e5             	mov    %rsp,%rbp
  80230b:	48 83 ec 10          	sub    $0x10,%rsp
  80230f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802313:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802317:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80231b:	48 be d2 41 80 00 00 	movabs $0x8041d2,%rsi
  802322:	00 00 00 
  802325:	48 89 c7             	mov    %rax,%rdi
  802328:	48 b8 67 02 80 00 00 	movabs $0x800267,%rax
  80232f:	00 00 00 
  802332:	ff d0                	callq  *%rax
  802334:	b8 00 00 00 00       	mov    $0x0,%eax
  802339:	c9                   	leaveq 
  80233a:	c3                   	retq   

000000000080233b <socket>:
  80233b:	55                   	push   %rbp
  80233c:	48 89 e5             	mov    %rsp,%rbp
  80233f:	48 83 ec 20          	sub    $0x20,%rsp
  802343:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802346:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802349:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  80234c:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80234f:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  802352:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802355:	89 ce                	mov    %ecx,%esi
  802357:	89 c7                	mov    %eax,%edi
  802359:	48 b8 81 27 80 00 00 	movabs $0x802781,%rax
  802360:	00 00 00 
  802363:	ff d0                	callq  *%rax
  802365:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802368:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80236c:	79 05                	jns    802373 <socket+0x38>
  80236e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802371:	eb 11                	jmp    802384 <socket+0x49>
  802373:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802376:	89 c7                	mov    %eax,%edi
  802378:	48 b8 1d 20 80 00 00 	movabs $0x80201d,%rax
  80237f:	00 00 00 
  802382:	ff d0                	callq  *%rax
  802384:	c9                   	leaveq 
  802385:	c3                   	retq   

0000000000802386 <nsipc>:
  802386:	55                   	push   %rbp
  802387:	48 89 e5             	mov    %rsp,%rbp
  80238a:	48 83 ec 10          	sub    $0x10,%rsp
  80238e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802391:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  802398:	00 00 00 
  80239b:	8b 00                	mov    (%rax),%eax
  80239d:	85 c0                	test   %eax,%eax
  80239f:	75 1f                	jne    8023c0 <nsipc+0x3a>
  8023a1:	bf 02 00 00 00       	mov    $0x2,%edi
  8023a6:	48 b8 6a 3f 80 00 00 	movabs $0x803f6a,%rax
  8023ad:	00 00 00 
  8023b0:	ff d0                	callq  *%rax
  8023b2:	89 c2                	mov    %eax,%edx
  8023b4:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  8023bb:	00 00 00 
  8023be:	89 10                	mov    %edx,(%rax)
  8023c0:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  8023c7:	00 00 00 
  8023ca:	8b 00                	mov    (%rax),%eax
  8023cc:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8023cf:	b9 07 00 00 00       	mov    $0x7,%ecx
  8023d4:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  8023db:	00 00 00 
  8023de:	89 c7                	mov    %eax,%edi
  8023e0:	48 b8 60 3e 80 00 00 	movabs $0x803e60,%rax
  8023e7:	00 00 00 
  8023ea:	ff d0                	callq  *%rax
  8023ec:	ba 00 00 00 00       	mov    $0x0,%edx
  8023f1:	be 00 00 00 00       	mov    $0x0,%esi
  8023f6:	bf 00 00 00 00       	mov    $0x0,%edi
  8023fb:	48 b8 9f 3d 80 00 00 	movabs $0x803d9f,%rax
  802402:	00 00 00 
  802405:	ff d0                	callq  *%rax
  802407:	c9                   	leaveq 
  802408:	c3                   	retq   

0000000000802409 <nsipc_accept>:
  802409:	55                   	push   %rbp
  80240a:	48 89 e5             	mov    %rsp,%rbp
  80240d:	48 83 ec 30          	sub    $0x30,%rsp
  802411:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802414:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802418:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80241c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802423:	00 00 00 
  802426:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802429:	89 10                	mov    %edx,(%rax)
  80242b:	bf 01 00 00 00       	mov    $0x1,%edi
  802430:	48 b8 86 23 80 00 00 	movabs $0x802386,%rax
  802437:	00 00 00 
  80243a:	ff d0                	callq  *%rax
  80243c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80243f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802443:	78 3e                	js     802483 <nsipc_accept+0x7a>
  802445:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80244c:	00 00 00 
  80244f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802453:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802457:	8b 40 10             	mov    0x10(%rax),%eax
  80245a:	89 c2                	mov    %eax,%edx
  80245c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  802460:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802464:	48 89 ce             	mov    %rcx,%rsi
  802467:	48 89 c7             	mov    %rax,%rdi
  80246a:	48 b8 8c 05 80 00 00 	movabs $0x80058c,%rax
  802471:	00 00 00 
  802474:	ff d0                	callq  *%rax
  802476:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80247a:	8b 50 10             	mov    0x10(%rax),%edx
  80247d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802481:	89 10                	mov    %edx,(%rax)
  802483:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802486:	c9                   	leaveq 
  802487:	c3                   	retq   

0000000000802488 <nsipc_bind>:
  802488:	55                   	push   %rbp
  802489:	48 89 e5             	mov    %rsp,%rbp
  80248c:	48 83 ec 10          	sub    $0x10,%rsp
  802490:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802493:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802497:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80249a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8024a1:	00 00 00 
  8024a4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8024a7:	89 10                	mov    %edx,(%rax)
  8024a9:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8024ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024b0:	48 89 c6             	mov    %rax,%rsi
  8024b3:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  8024ba:	00 00 00 
  8024bd:	48 b8 8c 05 80 00 00 	movabs $0x80058c,%rax
  8024c4:	00 00 00 
  8024c7:	ff d0                	callq  *%rax
  8024c9:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8024d0:	00 00 00 
  8024d3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8024d6:	89 50 14             	mov    %edx,0x14(%rax)
  8024d9:	bf 02 00 00 00       	mov    $0x2,%edi
  8024de:	48 b8 86 23 80 00 00 	movabs $0x802386,%rax
  8024e5:	00 00 00 
  8024e8:	ff d0                	callq  *%rax
  8024ea:	c9                   	leaveq 
  8024eb:	c3                   	retq   

00000000008024ec <nsipc_shutdown>:
  8024ec:	55                   	push   %rbp
  8024ed:	48 89 e5             	mov    %rsp,%rbp
  8024f0:	48 83 ec 10          	sub    $0x10,%rsp
  8024f4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8024f7:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8024fa:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802501:	00 00 00 
  802504:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802507:	89 10                	mov    %edx,(%rax)
  802509:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802510:	00 00 00 
  802513:	8b 55 f8             	mov    -0x8(%rbp),%edx
  802516:	89 50 04             	mov    %edx,0x4(%rax)
  802519:	bf 03 00 00 00       	mov    $0x3,%edi
  80251e:	48 b8 86 23 80 00 00 	movabs $0x802386,%rax
  802525:	00 00 00 
  802528:	ff d0                	callq  *%rax
  80252a:	c9                   	leaveq 
  80252b:	c3                   	retq   

000000000080252c <nsipc_close>:
  80252c:	55                   	push   %rbp
  80252d:	48 89 e5             	mov    %rsp,%rbp
  802530:	48 83 ec 10          	sub    $0x10,%rsp
  802534:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802537:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80253e:	00 00 00 
  802541:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802544:	89 10                	mov    %edx,(%rax)
  802546:	bf 04 00 00 00       	mov    $0x4,%edi
  80254b:	48 b8 86 23 80 00 00 	movabs $0x802386,%rax
  802552:	00 00 00 
  802555:	ff d0                	callq  *%rax
  802557:	c9                   	leaveq 
  802558:	c3                   	retq   

0000000000802559 <nsipc_connect>:
  802559:	55                   	push   %rbp
  80255a:	48 89 e5             	mov    %rsp,%rbp
  80255d:	48 83 ec 10          	sub    $0x10,%rsp
  802561:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802564:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802568:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80256b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802572:	00 00 00 
  802575:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802578:	89 10                	mov    %edx,(%rax)
  80257a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80257d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802581:	48 89 c6             	mov    %rax,%rsi
  802584:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80258b:	00 00 00 
  80258e:	48 b8 8c 05 80 00 00 	movabs $0x80058c,%rax
  802595:	00 00 00 
  802598:	ff d0                	callq  *%rax
  80259a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8025a1:	00 00 00 
  8025a4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8025a7:	89 50 14             	mov    %edx,0x14(%rax)
  8025aa:	bf 05 00 00 00       	mov    $0x5,%edi
  8025af:	48 b8 86 23 80 00 00 	movabs $0x802386,%rax
  8025b6:	00 00 00 
  8025b9:	ff d0                	callq  *%rax
  8025bb:	c9                   	leaveq 
  8025bc:	c3                   	retq   

00000000008025bd <nsipc_listen>:
  8025bd:	55                   	push   %rbp
  8025be:	48 89 e5             	mov    %rsp,%rbp
  8025c1:	48 83 ec 10          	sub    $0x10,%rsp
  8025c5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8025c8:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8025cb:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8025d2:	00 00 00 
  8025d5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8025d8:	89 10                	mov    %edx,(%rax)
  8025da:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8025e1:	00 00 00 
  8025e4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8025e7:	89 50 04             	mov    %edx,0x4(%rax)
  8025ea:	bf 06 00 00 00       	mov    $0x6,%edi
  8025ef:	48 b8 86 23 80 00 00 	movabs $0x802386,%rax
  8025f6:	00 00 00 
  8025f9:	ff d0                	callq  *%rax
  8025fb:	c9                   	leaveq 
  8025fc:	c3                   	retq   

00000000008025fd <nsipc_recv>:
  8025fd:	55                   	push   %rbp
  8025fe:	48 89 e5             	mov    %rsp,%rbp
  802601:	48 83 ec 30          	sub    $0x30,%rsp
  802605:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802608:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80260c:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80260f:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  802612:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802619:	00 00 00 
  80261c:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80261f:	89 10                	mov    %edx,(%rax)
  802621:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802628:	00 00 00 
  80262b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80262e:	89 50 04             	mov    %edx,0x4(%rax)
  802631:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802638:	00 00 00 
  80263b:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80263e:	89 50 08             	mov    %edx,0x8(%rax)
  802641:	bf 07 00 00 00       	mov    $0x7,%edi
  802646:	48 b8 86 23 80 00 00 	movabs $0x802386,%rax
  80264d:	00 00 00 
  802650:	ff d0                	callq  *%rax
  802652:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802655:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802659:	78 69                	js     8026c4 <nsipc_recv+0xc7>
  80265b:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  802662:	7f 08                	jg     80266c <nsipc_recv+0x6f>
  802664:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802667:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  80266a:	7e 35                	jle    8026a1 <nsipc_recv+0xa4>
  80266c:	48 b9 d9 41 80 00 00 	movabs $0x8041d9,%rcx
  802673:	00 00 00 
  802676:	48 ba ee 41 80 00 00 	movabs $0x8041ee,%rdx
  80267d:	00 00 00 
  802680:	be 62 00 00 00       	mov    $0x62,%esi
  802685:	48 bf 03 42 80 00 00 	movabs $0x804203,%rdi
  80268c:	00 00 00 
  80268f:	b8 00 00 00 00       	mov    $0x0,%eax
  802694:	49 b8 41 30 80 00 00 	movabs $0x803041,%r8
  80269b:	00 00 00 
  80269e:	41 ff d0             	callq  *%r8
  8026a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026a4:	48 63 d0             	movslq %eax,%rdx
  8026a7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8026ab:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  8026b2:	00 00 00 
  8026b5:	48 89 c7             	mov    %rax,%rdi
  8026b8:	48 b8 8c 05 80 00 00 	movabs $0x80058c,%rax
  8026bf:	00 00 00 
  8026c2:	ff d0                	callq  *%rax
  8026c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026c7:	c9                   	leaveq 
  8026c8:	c3                   	retq   

00000000008026c9 <nsipc_send>:
  8026c9:	55                   	push   %rbp
  8026ca:	48 89 e5             	mov    %rsp,%rbp
  8026cd:	48 83 ec 20          	sub    $0x20,%rsp
  8026d1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8026d4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8026d8:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8026db:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8026de:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8026e5:	00 00 00 
  8026e8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8026eb:	89 10                	mov    %edx,(%rax)
  8026ed:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  8026f4:	7e 35                	jle    80272b <nsipc_send+0x62>
  8026f6:	48 b9 12 42 80 00 00 	movabs $0x804212,%rcx
  8026fd:	00 00 00 
  802700:	48 ba ee 41 80 00 00 	movabs $0x8041ee,%rdx
  802707:	00 00 00 
  80270a:	be 6d 00 00 00       	mov    $0x6d,%esi
  80270f:	48 bf 03 42 80 00 00 	movabs $0x804203,%rdi
  802716:	00 00 00 
  802719:	b8 00 00 00 00       	mov    $0x0,%eax
  80271e:	49 b8 41 30 80 00 00 	movabs $0x803041,%r8
  802725:	00 00 00 
  802728:	41 ff d0             	callq  *%r8
  80272b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80272e:	48 63 d0             	movslq %eax,%rdx
  802731:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802735:	48 89 c6             	mov    %rax,%rsi
  802738:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  80273f:	00 00 00 
  802742:	48 b8 8c 05 80 00 00 	movabs $0x80058c,%rax
  802749:	00 00 00 
  80274c:	ff d0                	callq  *%rax
  80274e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802755:	00 00 00 
  802758:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80275b:	89 50 04             	mov    %edx,0x4(%rax)
  80275e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802765:	00 00 00 
  802768:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80276b:	89 50 08             	mov    %edx,0x8(%rax)
  80276e:	bf 08 00 00 00       	mov    $0x8,%edi
  802773:	48 b8 86 23 80 00 00 	movabs $0x802386,%rax
  80277a:	00 00 00 
  80277d:	ff d0                	callq  *%rax
  80277f:	c9                   	leaveq 
  802780:	c3                   	retq   

0000000000802781 <nsipc_socket>:
  802781:	55                   	push   %rbp
  802782:	48 89 e5             	mov    %rsp,%rbp
  802785:	48 83 ec 10          	sub    $0x10,%rsp
  802789:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80278c:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80278f:	89 55 f4             	mov    %edx,-0xc(%rbp)
  802792:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802799:	00 00 00 
  80279c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80279f:	89 10                	mov    %edx,(%rax)
  8027a1:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8027a8:	00 00 00 
  8027ab:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8027ae:	89 50 04             	mov    %edx,0x4(%rax)
  8027b1:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8027b8:	00 00 00 
  8027bb:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8027be:	89 50 08             	mov    %edx,0x8(%rax)
  8027c1:	bf 09 00 00 00       	mov    $0x9,%edi
  8027c6:	48 b8 86 23 80 00 00 	movabs $0x802386,%rax
  8027cd:	00 00 00 
  8027d0:	ff d0                	callq  *%rax
  8027d2:	c9                   	leaveq 
  8027d3:	c3                   	retq   

00000000008027d4 <pipe>:
  8027d4:	55                   	push   %rbp
  8027d5:	48 89 e5             	mov    %rsp,%rbp
  8027d8:	53                   	push   %rbx
  8027d9:	48 83 ec 38          	sub    $0x38,%rsp
  8027dd:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8027e1:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8027e5:	48 89 c7             	mov    %rax,%rdi
  8027e8:	48 b8 e1 0f 80 00 00 	movabs $0x800fe1,%rax
  8027ef:	00 00 00 
  8027f2:	ff d0                	callq  *%rax
  8027f4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8027f7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8027fb:	0f 88 bf 01 00 00    	js     8029c0 <pipe+0x1ec>
  802801:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802805:	ba 07 04 00 00       	mov    $0x407,%edx
  80280a:	48 89 c6             	mov    %rax,%rsi
  80280d:	bf 00 00 00 00       	mov    $0x0,%edi
  802812:	48 b8 97 0b 80 00 00 	movabs $0x800b97,%rax
  802819:	00 00 00 
  80281c:	ff d0                	callq  *%rax
  80281e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802821:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802825:	0f 88 95 01 00 00    	js     8029c0 <pipe+0x1ec>
  80282b:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80282f:	48 89 c7             	mov    %rax,%rdi
  802832:	48 b8 e1 0f 80 00 00 	movabs $0x800fe1,%rax
  802839:	00 00 00 
  80283c:	ff d0                	callq  *%rax
  80283e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802841:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802845:	0f 88 5d 01 00 00    	js     8029a8 <pipe+0x1d4>
  80284b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80284f:	ba 07 04 00 00       	mov    $0x407,%edx
  802854:	48 89 c6             	mov    %rax,%rsi
  802857:	bf 00 00 00 00       	mov    $0x0,%edi
  80285c:	48 b8 97 0b 80 00 00 	movabs $0x800b97,%rax
  802863:	00 00 00 
  802866:	ff d0                	callq  *%rax
  802868:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80286b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80286f:	0f 88 33 01 00 00    	js     8029a8 <pipe+0x1d4>
  802875:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802879:	48 89 c7             	mov    %rax,%rdi
  80287c:	48 b8 b6 0f 80 00 00 	movabs $0x800fb6,%rax
  802883:	00 00 00 
  802886:	ff d0                	callq  *%rax
  802888:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80288c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802890:	ba 07 04 00 00       	mov    $0x407,%edx
  802895:	48 89 c6             	mov    %rax,%rsi
  802898:	bf 00 00 00 00       	mov    $0x0,%edi
  80289d:	48 b8 97 0b 80 00 00 	movabs $0x800b97,%rax
  8028a4:	00 00 00 
  8028a7:	ff d0                	callq  *%rax
  8028a9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8028ac:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8028b0:	0f 88 d9 00 00 00    	js     80298f <pipe+0x1bb>
  8028b6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8028ba:	48 89 c7             	mov    %rax,%rdi
  8028bd:	48 b8 b6 0f 80 00 00 	movabs $0x800fb6,%rax
  8028c4:	00 00 00 
  8028c7:	ff d0                	callq  *%rax
  8028c9:	48 89 c2             	mov    %rax,%rdx
  8028cc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8028d0:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8028d6:	48 89 d1             	mov    %rdx,%rcx
  8028d9:	ba 00 00 00 00       	mov    $0x0,%edx
  8028de:	48 89 c6             	mov    %rax,%rsi
  8028e1:	bf 00 00 00 00       	mov    $0x0,%edi
  8028e6:	48 b8 e9 0b 80 00 00 	movabs $0x800be9,%rax
  8028ed:	00 00 00 
  8028f0:	ff d0                	callq  *%rax
  8028f2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8028f5:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8028f9:	78 79                	js     802974 <pipe+0x1a0>
  8028fb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028ff:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  802906:	00 00 00 
  802909:	8b 12                	mov    (%rdx),%edx
  80290b:	89 10                	mov    %edx,(%rax)
  80290d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802911:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  802918:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80291c:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  802923:	00 00 00 
  802926:	8b 12                	mov    (%rdx),%edx
  802928:	89 10                	mov    %edx,(%rax)
  80292a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80292e:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  802935:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802939:	48 89 c7             	mov    %rax,%rdi
  80293c:	48 b8 93 0f 80 00 00 	movabs $0x800f93,%rax
  802943:	00 00 00 
  802946:	ff d0                	callq  *%rax
  802948:	89 c2                	mov    %eax,%edx
  80294a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80294e:	89 10                	mov    %edx,(%rax)
  802950:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802954:	48 8d 58 04          	lea    0x4(%rax),%rbx
  802958:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80295c:	48 89 c7             	mov    %rax,%rdi
  80295f:	48 b8 93 0f 80 00 00 	movabs $0x800f93,%rax
  802966:	00 00 00 
  802969:	ff d0                	callq  *%rax
  80296b:	89 03                	mov    %eax,(%rbx)
  80296d:	b8 00 00 00 00       	mov    $0x0,%eax
  802972:	eb 4f                	jmp    8029c3 <pipe+0x1ef>
  802974:	90                   	nop
  802975:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802979:	48 89 c6             	mov    %rax,%rsi
  80297c:	bf 00 00 00 00       	mov    $0x0,%edi
  802981:	48 b8 49 0c 80 00 00 	movabs $0x800c49,%rax
  802988:	00 00 00 
  80298b:	ff d0                	callq  *%rax
  80298d:	eb 01                	jmp    802990 <pipe+0x1bc>
  80298f:	90                   	nop
  802990:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802994:	48 89 c6             	mov    %rax,%rsi
  802997:	bf 00 00 00 00       	mov    $0x0,%edi
  80299c:	48 b8 49 0c 80 00 00 	movabs $0x800c49,%rax
  8029a3:	00 00 00 
  8029a6:	ff d0                	callq  *%rax
  8029a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029ac:	48 89 c6             	mov    %rax,%rsi
  8029af:	bf 00 00 00 00       	mov    $0x0,%edi
  8029b4:	48 b8 49 0c 80 00 00 	movabs $0x800c49,%rax
  8029bb:	00 00 00 
  8029be:	ff d0                	callq  *%rax
  8029c0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8029c3:	48 83 c4 38          	add    $0x38,%rsp
  8029c7:	5b                   	pop    %rbx
  8029c8:	5d                   	pop    %rbp
  8029c9:	c3                   	retq   

00000000008029ca <_pipeisclosed>:
  8029ca:	55                   	push   %rbp
  8029cb:	48 89 e5             	mov    %rsp,%rbp
  8029ce:	53                   	push   %rbx
  8029cf:	48 83 ec 28          	sub    $0x28,%rsp
  8029d3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8029d7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8029db:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8029e2:	00 00 00 
  8029e5:	48 8b 00             	mov    (%rax),%rax
  8029e8:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  8029ee:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8029f1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029f5:	48 89 c7             	mov    %rax,%rdi
  8029f8:	48 b8 db 3f 80 00 00 	movabs $0x803fdb,%rax
  8029ff:	00 00 00 
  802a02:	ff d0                	callq  *%rax
  802a04:	89 c3                	mov    %eax,%ebx
  802a06:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802a0a:	48 89 c7             	mov    %rax,%rdi
  802a0d:	48 b8 db 3f 80 00 00 	movabs $0x803fdb,%rax
  802a14:	00 00 00 
  802a17:	ff d0                	callq  *%rax
  802a19:	39 c3                	cmp    %eax,%ebx
  802a1b:	0f 94 c0             	sete   %al
  802a1e:	0f b6 c0             	movzbl %al,%eax
  802a21:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802a24:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802a2b:	00 00 00 
  802a2e:	48 8b 00             	mov    (%rax),%rax
  802a31:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  802a37:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  802a3a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a3d:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  802a40:	75 05                	jne    802a47 <_pipeisclosed+0x7d>
  802a42:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802a45:	eb 4a                	jmp    802a91 <_pipeisclosed+0xc7>
  802a47:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a4a:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  802a4d:	74 8c                	je     8029db <_pipeisclosed+0x11>
  802a4f:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  802a53:	75 86                	jne    8029db <_pipeisclosed+0x11>
  802a55:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802a5c:	00 00 00 
  802a5f:	48 8b 00             	mov    (%rax),%rax
  802a62:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  802a68:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  802a6b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a6e:	89 c6                	mov    %eax,%esi
  802a70:	48 bf 23 42 80 00 00 	movabs $0x804223,%rdi
  802a77:	00 00 00 
  802a7a:	b8 00 00 00 00       	mov    $0x0,%eax
  802a7f:	49 b8 7b 32 80 00 00 	movabs $0x80327b,%r8
  802a86:	00 00 00 
  802a89:	41 ff d0             	callq  *%r8
  802a8c:	e9 4a ff ff ff       	jmpq   8029db <_pipeisclosed+0x11>
  802a91:	48 83 c4 28          	add    $0x28,%rsp
  802a95:	5b                   	pop    %rbx
  802a96:	5d                   	pop    %rbp
  802a97:	c3                   	retq   

0000000000802a98 <pipeisclosed>:
  802a98:	55                   	push   %rbp
  802a99:	48 89 e5             	mov    %rsp,%rbp
  802a9c:	48 83 ec 30          	sub    $0x30,%rsp
  802aa0:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802aa3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802aa7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802aaa:	48 89 d6             	mov    %rdx,%rsi
  802aad:	89 c7                	mov    %eax,%edi
  802aaf:	48 b8 79 10 80 00 00 	movabs $0x801079,%rax
  802ab6:	00 00 00 
  802ab9:	ff d0                	callq  *%rax
  802abb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802abe:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ac2:	79 05                	jns    802ac9 <pipeisclosed+0x31>
  802ac4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ac7:	eb 31                	jmp    802afa <pipeisclosed+0x62>
  802ac9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802acd:	48 89 c7             	mov    %rax,%rdi
  802ad0:	48 b8 b6 0f 80 00 00 	movabs $0x800fb6,%rax
  802ad7:	00 00 00 
  802ada:	ff d0                	callq  *%rax
  802adc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802ae0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ae4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802ae8:	48 89 d6             	mov    %rdx,%rsi
  802aeb:	48 89 c7             	mov    %rax,%rdi
  802aee:	48 b8 ca 29 80 00 00 	movabs $0x8029ca,%rax
  802af5:	00 00 00 
  802af8:	ff d0                	callq  *%rax
  802afa:	c9                   	leaveq 
  802afb:	c3                   	retq   

0000000000802afc <devpipe_read>:
  802afc:	55                   	push   %rbp
  802afd:	48 89 e5             	mov    %rsp,%rbp
  802b00:	48 83 ec 40          	sub    $0x40,%rsp
  802b04:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802b08:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802b0c:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802b10:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b14:	48 89 c7             	mov    %rax,%rdi
  802b17:	48 b8 b6 0f 80 00 00 	movabs $0x800fb6,%rax
  802b1e:	00 00 00 
  802b21:	ff d0                	callq  *%rax
  802b23:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802b27:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802b2b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802b2f:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  802b36:	00 
  802b37:	e9 90 00 00 00       	jmpq   802bcc <devpipe_read+0xd0>
  802b3c:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  802b41:	74 09                	je     802b4c <devpipe_read+0x50>
  802b43:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b47:	e9 8e 00 00 00       	jmpq   802bda <devpipe_read+0xde>
  802b4c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802b50:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b54:	48 89 d6             	mov    %rdx,%rsi
  802b57:	48 89 c7             	mov    %rax,%rdi
  802b5a:	48 b8 ca 29 80 00 00 	movabs $0x8029ca,%rax
  802b61:	00 00 00 
  802b64:	ff d0                	callq  *%rax
  802b66:	85 c0                	test   %eax,%eax
  802b68:	74 07                	je     802b71 <devpipe_read+0x75>
  802b6a:	b8 00 00 00 00       	mov    $0x0,%eax
  802b6f:	eb 69                	jmp    802bda <devpipe_read+0xde>
  802b71:	48 b8 5a 0b 80 00 00 	movabs $0x800b5a,%rax
  802b78:	00 00 00 
  802b7b:	ff d0                	callq  *%rax
  802b7d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b81:	8b 10                	mov    (%rax),%edx
  802b83:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b87:	8b 40 04             	mov    0x4(%rax),%eax
  802b8a:	39 c2                	cmp    %eax,%edx
  802b8c:	74 ae                	je     802b3c <devpipe_read+0x40>
  802b8e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802b92:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b96:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  802b9a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b9e:	8b 00                	mov    (%rax),%eax
  802ba0:	99                   	cltd   
  802ba1:	c1 ea 1b             	shr    $0x1b,%edx
  802ba4:	01 d0                	add    %edx,%eax
  802ba6:	83 e0 1f             	and    $0x1f,%eax
  802ba9:	29 d0                	sub    %edx,%eax
  802bab:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802baf:	48 98                	cltq   
  802bb1:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  802bb6:	88 01                	mov    %al,(%rcx)
  802bb8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bbc:	8b 00                	mov    (%rax),%eax
  802bbe:	8d 50 01             	lea    0x1(%rax),%edx
  802bc1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bc5:	89 10                	mov    %edx,(%rax)
  802bc7:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  802bcc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802bd0:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802bd4:	72 a7                	jb     802b7d <devpipe_read+0x81>
  802bd6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802bda:	c9                   	leaveq 
  802bdb:	c3                   	retq   

0000000000802bdc <devpipe_write>:
  802bdc:	55                   	push   %rbp
  802bdd:	48 89 e5             	mov    %rsp,%rbp
  802be0:	48 83 ec 40          	sub    $0x40,%rsp
  802be4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802be8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802bec:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802bf0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802bf4:	48 89 c7             	mov    %rax,%rdi
  802bf7:	48 b8 b6 0f 80 00 00 	movabs $0x800fb6,%rax
  802bfe:	00 00 00 
  802c01:	ff d0                	callq  *%rax
  802c03:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802c07:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802c0b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802c0f:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  802c16:	00 
  802c17:	e9 8f 00 00 00       	jmpq   802cab <devpipe_write+0xcf>
  802c1c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802c20:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c24:	48 89 d6             	mov    %rdx,%rsi
  802c27:	48 89 c7             	mov    %rax,%rdi
  802c2a:	48 b8 ca 29 80 00 00 	movabs $0x8029ca,%rax
  802c31:	00 00 00 
  802c34:	ff d0                	callq  *%rax
  802c36:	85 c0                	test   %eax,%eax
  802c38:	74 07                	je     802c41 <devpipe_write+0x65>
  802c3a:	b8 00 00 00 00       	mov    $0x0,%eax
  802c3f:	eb 78                	jmp    802cb9 <devpipe_write+0xdd>
  802c41:	48 b8 5a 0b 80 00 00 	movabs $0x800b5a,%rax
  802c48:	00 00 00 
  802c4b:	ff d0                	callq  *%rax
  802c4d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c51:	8b 40 04             	mov    0x4(%rax),%eax
  802c54:	48 63 d0             	movslq %eax,%rdx
  802c57:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c5b:	8b 00                	mov    (%rax),%eax
  802c5d:	48 98                	cltq   
  802c5f:	48 83 c0 20          	add    $0x20,%rax
  802c63:	48 39 c2             	cmp    %rax,%rdx
  802c66:	73 b4                	jae    802c1c <devpipe_write+0x40>
  802c68:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c6c:	8b 40 04             	mov    0x4(%rax),%eax
  802c6f:	99                   	cltd   
  802c70:	c1 ea 1b             	shr    $0x1b,%edx
  802c73:	01 d0                	add    %edx,%eax
  802c75:	83 e0 1f             	and    $0x1f,%eax
  802c78:	29 d0                	sub    %edx,%eax
  802c7a:	89 c6                	mov    %eax,%esi
  802c7c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802c80:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c84:	48 01 d0             	add    %rdx,%rax
  802c87:	0f b6 08             	movzbl (%rax),%ecx
  802c8a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802c8e:	48 63 c6             	movslq %esi,%rax
  802c91:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  802c95:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c99:	8b 40 04             	mov    0x4(%rax),%eax
  802c9c:	8d 50 01             	lea    0x1(%rax),%edx
  802c9f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ca3:	89 50 04             	mov    %edx,0x4(%rax)
  802ca6:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  802cab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802caf:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802cb3:	72 98                	jb     802c4d <devpipe_write+0x71>
  802cb5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802cb9:	c9                   	leaveq 
  802cba:	c3                   	retq   

0000000000802cbb <devpipe_stat>:
  802cbb:	55                   	push   %rbp
  802cbc:	48 89 e5             	mov    %rsp,%rbp
  802cbf:	48 83 ec 20          	sub    $0x20,%rsp
  802cc3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802cc7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ccb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ccf:	48 89 c7             	mov    %rax,%rdi
  802cd2:	48 b8 b6 0f 80 00 00 	movabs $0x800fb6,%rax
  802cd9:	00 00 00 
  802cdc:	ff d0                	callq  *%rax
  802cde:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802ce2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ce6:	48 be 36 42 80 00 00 	movabs $0x804236,%rsi
  802ced:	00 00 00 
  802cf0:	48 89 c7             	mov    %rax,%rdi
  802cf3:	48 b8 67 02 80 00 00 	movabs $0x800267,%rax
  802cfa:	00 00 00 
  802cfd:	ff d0                	callq  *%rax
  802cff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d03:	8b 50 04             	mov    0x4(%rax),%edx
  802d06:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d0a:	8b 00                	mov    (%rax),%eax
  802d0c:	29 c2                	sub    %eax,%edx
  802d0e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d12:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802d18:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d1c:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802d23:	00 00 00 
  802d26:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d2a:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  802d31:	00 00 00 
  802d34:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  802d3b:	b8 00 00 00 00       	mov    $0x0,%eax
  802d40:	c9                   	leaveq 
  802d41:	c3                   	retq   

0000000000802d42 <devpipe_close>:
  802d42:	55                   	push   %rbp
  802d43:	48 89 e5             	mov    %rsp,%rbp
  802d46:	48 83 ec 10          	sub    $0x10,%rsp
  802d4a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802d4e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d52:	48 89 c6             	mov    %rax,%rsi
  802d55:	bf 00 00 00 00       	mov    $0x0,%edi
  802d5a:	48 b8 49 0c 80 00 00 	movabs $0x800c49,%rax
  802d61:	00 00 00 
  802d64:	ff d0                	callq  *%rax
  802d66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d6a:	48 89 c7             	mov    %rax,%rdi
  802d6d:	48 b8 b6 0f 80 00 00 	movabs $0x800fb6,%rax
  802d74:	00 00 00 
  802d77:	ff d0                	callq  *%rax
  802d79:	48 89 c6             	mov    %rax,%rsi
  802d7c:	bf 00 00 00 00       	mov    $0x0,%edi
  802d81:	48 b8 49 0c 80 00 00 	movabs $0x800c49,%rax
  802d88:	00 00 00 
  802d8b:	ff d0                	callq  *%rax
  802d8d:	c9                   	leaveq 
  802d8e:	c3                   	retq   

0000000000802d8f <cputchar>:
  802d8f:	55                   	push   %rbp
  802d90:	48 89 e5             	mov    %rsp,%rbp
  802d93:	48 83 ec 20          	sub    $0x20,%rsp
  802d97:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802d9a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d9d:	88 45 ff             	mov    %al,-0x1(%rbp)
  802da0:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  802da4:	be 01 00 00 00       	mov    $0x1,%esi
  802da9:	48 89 c7             	mov    %rax,%rdi
  802dac:	48 b8 4f 0a 80 00 00 	movabs $0x800a4f,%rax
  802db3:	00 00 00 
  802db6:	ff d0                	callq  *%rax
  802db8:	90                   	nop
  802db9:	c9                   	leaveq 
  802dba:	c3                   	retq   

0000000000802dbb <getchar>:
  802dbb:	55                   	push   %rbp
  802dbc:	48 89 e5             	mov    %rsp,%rbp
  802dbf:	48 83 ec 10          	sub    $0x10,%rsp
  802dc3:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  802dc7:	ba 01 00 00 00       	mov    $0x1,%edx
  802dcc:	48 89 c6             	mov    %rax,%rsi
  802dcf:	bf 00 00 00 00       	mov    $0x0,%edi
  802dd4:	48 b8 ae 14 80 00 00 	movabs $0x8014ae,%rax
  802ddb:	00 00 00 
  802dde:	ff d0                	callq  *%rax
  802de0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802de3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802de7:	79 05                	jns    802dee <getchar+0x33>
  802de9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dec:	eb 14                	jmp    802e02 <getchar+0x47>
  802dee:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802df2:	7f 07                	jg     802dfb <getchar+0x40>
  802df4:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  802df9:	eb 07                	jmp    802e02 <getchar+0x47>
  802dfb:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  802dff:	0f b6 c0             	movzbl %al,%eax
  802e02:	c9                   	leaveq 
  802e03:	c3                   	retq   

0000000000802e04 <iscons>:
  802e04:	55                   	push   %rbp
  802e05:	48 89 e5             	mov    %rsp,%rbp
  802e08:	48 83 ec 20          	sub    $0x20,%rsp
  802e0c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e0f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e13:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e16:	48 89 d6             	mov    %rdx,%rsi
  802e19:	89 c7                	mov    %eax,%edi
  802e1b:	48 b8 79 10 80 00 00 	movabs $0x801079,%rax
  802e22:	00 00 00 
  802e25:	ff d0                	callq  *%rax
  802e27:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e2a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e2e:	79 05                	jns    802e35 <iscons+0x31>
  802e30:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e33:	eb 1a                	jmp    802e4f <iscons+0x4b>
  802e35:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e39:	8b 10                	mov    (%rax),%edx
  802e3b:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  802e42:	00 00 00 
  802e45:	8b 00                	mov    (%rax),%eax
  802e47:	39 c2                	cmp    %eax,%edx
  802e49:	0f 94 c0             	sete   %al
  802e4c:	0f b6 c0             	movzbl %al,%eax
  802e4f:	c9                   	leaveq 
  802e50:	c3                   	retq   

0000000000802e51 <opencons>:
  802e51:	55                   	push   %rbp
  802e52:	48 89 e5             	mov    %rsp,%rbp
  802e55:	48 83 ec 10          	sub    $0x10,%rsp
  802e59:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802e5d:	48 89 c7             	mov    %rax,%rdi
  802e60:	48 b8 e1 0f 80 00 00 	movabs $0x800fe1,%rax
  802e67:	00 00 00 
  802e6a:	ff d0                	callq  *%rax
  802e6c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e6f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e73:	79 05                	jns    802e7a <opencons+0x29>
  802e75:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e78:	eb 5b                	jmp    802ed5 <opencons+0x84>
  802e7a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e7e:	ba 07 04 00 00       	mov    $0x407,%edx
  802e83:	48 89 c6             	mov    %rax,%rsi
  802e86:	bf 00 00 00 00       	mov    $0x0,%edi
  802e8b:	48 b8 97 0b 80 00 00 	movabs $0x800b97,%rax
  802e92:	00 00 00 
  802e95:	ff d0                	callq  *%rax
  802e97:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e9a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e9e:	79 05                	jns    802ea5 <opencons+0x54>
  802ea0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ea3:	eb 30                	jmp    802ed5 <opencons+0x84>
  802ea5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ea9:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  802eb0:	00 00 00 
  802eb3:	8b 12                	mov    (%rdx),%edx
  802eb5:	89 10                	mov    %edx,(%rax)
  802eb7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ebb:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  802ec2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ec6:	48 89 c7             	mov    %rax,%rdi
  802ec9:	48 b8 93 0f 80 00 00 	movabs $0x800f93,%rax
  802ed0:	00 00 00 
  802ed3:	ff d0                	callq  *%rax
  802ed5:	c9                   	leaveq 
  802ed6:	c3                   	retq   

0000000000802ed7 <devcons_read>:
  802ed7:	55                   	push   %rbp
  802ed8:	48 89 e5             	mov    %rsp,%rbp
  802edb:	48 83 ec 30          	sub    $0x30,%rsp
  802edf:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802ee3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ee7:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802eeb:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802ef0:	75 13                	jne    802f05 <devcons_read+0x2e>
  802ef2:	b8 00 00 00 00       	mov    $0x0,%eax
  802ef7:	eb 49                	jmp    802f42 <devcons_read+0x6b>
  802ef9:	48 b8 5a 0b 80 00 00 	movabs $0x800b5a,%rax
  802f00:	00 00 00 
  802f03:	ff d0                	callq  *%rax
  802f05:	48 b8 9c 0a 80 00 00 	movabs $0x800a9c,%rax
  802f0c:	00 00 00 
  802f0f:	ff d0                	callq  *%rax
  802f11:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f14:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f18:	74 df                	je     802ef9 <devcons_read+0x22>
  802f1a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f1e:	79 05                	jns    802f25 <devcons_read+0x4e>
  802f20:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f23:	eb 1d                	jmp    802f42 <devcons_read+0x6b>
  802f25:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  802f29:	75 07                	jne    802f32 <devcons_read+0x5b>
  802f2b:	b8 00 00 00 00       	mov    $0x0,%eax
  802f30:	eb 10                	jmp    802f42 <devcons_read+0x6b>
  802f32:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f35:	89 c2                	mov    %eax,%edx
  802f37:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802f3b:	88 10                	mov    %dl,(%rax)
  802f3d:	b8 01 00 00 00       	mov    $0x1,%eax
  802f42:	c9                   	leaveq 
  802f43:	c3                   	retq   

0000000000802f44 <devcons_write>:
  802f44:	55                   	push   %rbp
  802f45:	48 89 e5             	mov    %rsp,%rbp
  802f48:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  802f4f:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  802f56:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  802f5d:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  802f64:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802f6b:	eb 76                	jmp    802fe3 <devcons_write+0x9f>
  802f6d:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  802f74:	89 c2                	mov    %eax,%edx
  802f76:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f79:	29 c2                	sub    %eax,%edx
  802f7b:	89 d0                	mov    %edx,%eax
  802f7d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802f80:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f83:	83 f8 7f             	cmp    $0x7f,%eax
  802f86:	76 07                	jbe    802f8f <devcons_write+0x4b>
  802f88:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  802f8f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f92:	48 63 d0             	movslq %eax,%rdx
  802f95:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f98:	48 63 c8             	movslq %eax,%rcx
  802f9b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  802fa2:	48 01 c1             	add    %rax,%rcx
  802fa5:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  802fac:	48 89 ce             	mov    %rcx,%rsi
  802faf:	48 89 c7             	mov    %rax,%rdi
  802fb2:	48 b8 8c 05 80 00 00 	movabs $0x80058c,%rax
  802fb9:	00 00 00 
  802fbc:	ff d0                	callq  *%rax
  802fbe:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802fc1:	48 63 d0             	movslq %eax,%rdx
  802fc4:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  802fcb:	48 89 d6             	mov    %rdx,%rsi
  802fce:	48 89 c7             	mov    %rax,%rdi
  802fd1:	48 b8 4f 0a 80 00 00 	movabs $0x800a4f,%rax
  802fd8:	00 00 00 
  802fdb:	ff d0                	callq  *%rax
  802fdd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802fe0:	01 45 fc             	add    %eax,-0x4(%rbp)
  802fe3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fe6:	48 98                	cltq   
  802fe8:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  802fef:	0f 82 78 ff ff ff    	jb     802f6d <devcons_write+0x29>
  802ff5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ff8:	c9                   	leaveq 
  802ff9:	c3                   	retq   

0000000000802ffa <devcons_close>:
  802ffa:	55                   	push   %rbp
  802ffb:	48 89 e5             	mov    %rsp,%rbp
  802ffe:	48 83 ec 08          	sub    $0x8,%rsp
  803002:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803006:	b8 00 00 00 00       	mov    $0x0,%eax
  80300b:	c9                   	leaveq 
  80300c:	c3                   	retq   

000000000080300d <devcons_stat>:
  80300d:	55                   	push   %rbp
  80300e:	48 89 e5             	mov    %rsp,%rbp
  803011:	48 83 ec 10          	sub    $0x10,%rsp
  803015:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803019:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80301d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803021:	48 be 42 42 80 00 00 	movabs $0x804242,%rsi
  803028:	00 00 00 
  80302b:	48 89 c7             	mov    %rax,%rdi
  80302e:	48 b8 67 02 80 00 00 	movabs $0x800267,%rax
  803035:	00 00 00 
  803038:	ff d0                	callq  *%rax
  80303a:	b8 00 00 00 00       	mov    $0x0,%eax
  80303f:	c9                   	leaveq 
  803040:	c3                   	retq   

0000000000803041 <_panic>:
  803041:	55                   	push   %rbp
  803042:	48 89 e5             	mov    %rsp,%rbp
  803045:	53                   	push   %rbx
  803046:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80304d:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  803054:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  80305a:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803061:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  803068:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  80306f:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  803076:	84 c0                	test   %al,%al
  803078:	74 23                	je     80309d <_panic+0x5c>
  80307a:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  803081:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  803085:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  803089:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80308d:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  803091:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  803095:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  803099:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80309d:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8030a4:	00 00 00 
  8030a7:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8030ae:	00 00 00 
  8030b1:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8030b5:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8030bc:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8030c3:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8030ca:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8030d1:	00 00 00 
  8030d4:	48 8b 18             	mov    (%rax),%rbx
  8030d7:	48 b8 1e 0b 80 00 00 	movabs $0x800b1e,%rax
  8030de:	00 00 00 
  8030e1:	ff d0                	callq  *%rax
  8030e3:	89 c6                	mov    %eax,%esi
  8030e5:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  8030eb:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  8030f2:	41 89 d0             	mov    %edx,%r8d
  8030f5:	48 89 c1             	mov    %rax,%rcx
  8030f8:	48 89 da             	mov    %rbx,%rdx
  8030fb:	48 bf 50 42 80 00 00 	movabs $0x804250,%rdi
  803102:	00 00 00 
  803105:	b8 00 00 00 00       	mov    $0x0,%eax
  80310a:	49 b9 7b 32 80 00 00 	movabs $0x80327b,%r9
  803111:	00 00 00 
  803114:	41 ff d1             	callq  *%r9
  803117:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  80311e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  803125:	48 89 d6             	mov    %rdx,%rsi
  803128:	48 89 c7             	mov    %rax,%rdi
  80312b:	48 b8 cf 31 80 00 00 	movabs $0x8031cf,%rax
  803132:	00 00 00 
  803135:	ff d0                	callq  *%rax
  803137:	48 bf 73 42 80 00 00 	movabs $0x804273,%rdi
  80313e:	00 00 00 
  803141:	b8 00 00 00 00       	mov    $0x0,%eax
  803146:	48 ba 7b 32 80 00 00 	movabs $0x80327b,%rdx
  80314d:	00 00 00 
  803150:	ff d2                	callq  *%rdx
  803152:	cc                   	int3   
  803153:	eb fd                	jmp    803152 <_panic+0x111>

0000000000803155 <putch>:
  803155:	55                   	push   %rbp
  803156:	48 89 e5             	mov    %rsp,%rbp
  803159:	48 83 ec 10          	sub    $0x10,%rsp
  80315d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803160:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803164:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803168:	8b 00                	mov    (%rax),%eax
  80316a:	8d 48 01             	lea    0x1(%rax),%ecx
  80316d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803171:	89 0a                	mov    %ecx,(%rdx)
  803173:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803176:	89 d1                	mov    %edx,%ecx
  803178:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80317c:	48 98                	cltq   
  80317e:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803182:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803186:	8b 00                	mov    (%rax),%eax
  803188:	3d ff 00 00 00       	cmp    $0xff,%eax
  80318d:	75 2c                	jne    8031bb <putch+0x66>
  80318f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803193:	8b 00                	mov    (%rax),%eax
  803195:	48 98                	cltq   
  803197:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80319b:	48 83 c2 08          	add    $0x8,%rdx
  80319f:	48 89 c6             	mov    %rax,%rsi
  8031a2:	48 89 d7             	mov    %rdx,%rdi
  8031a5:	48 b8 4f 0a 80 00 00 	movabs $0x800a4f,%rax
  8031ac:	00 00 00 
  8031af:	ff d0                	callq  *%rax
  8031b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031b5:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8031bb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031bf:	8b 40 04             	mov    0x4(%rax),%eax
  8031c2:	8d 50 01             	lea    0x1(%rax),%edx
  8031c5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031c9:	89 50 04             	mov    %edx,0x4(%rax)
  8031cc:	90                   	nop
  8031cd:	c9                   	leaveq 
  8031ce:	c3                   	retq   

00000000008031cf <vcprintf>:
  8031cf:	55                   	push   %rbp
  8031d0:	48 89 e5             	mov    %rsp,%rbp
  8031d3:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8031da:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8031e1:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8031e8:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8031ef:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8031f6:	48 8b 0a             	mov    (%rdx),%rcx
  8031f9:	48 89 08             	mov    %rcx,(%rax)
  8031fc:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  803200:	48 89 48 08          	mov    %rcx,0x8(%rax)
  803204:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  803208:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80320c:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  803213:	00 00 00 
  803216:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80321d:	00 00 00 
  803220:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  803227:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80322e:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  803235:	48 89 c6             	mov    %rax,%rsi
  803238:	48 bf 55 31 80 00 00 	movabs $0x803155,%rdi
  80323f:	00 00 00 
  803242:	48 b8 19 36 80 00 00 	movabs $0x803619,%rax
  803249:	00 00 00 
  80324c:	ff d0                	callq  *%rax
  80324e:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  803254:	48 98                	cltq   
  803256:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80325d:	48 83 c2 08          	add    $0x8,%rdx
  803261:	48 89 c6             	mov    %rax,%rsi
  803264:	48 89 d7             	mov    %rdx,%rdi
  803267:	48 b8 4f 0a 80 00 00 	movabs $0x800a4f,%rax
  80326e:	00 00 00 
  803271:	ff d0                	callq  *%rax
  803273:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  803279:	c9                   	leaveq 
  80327a:	c3                   	retq   

000000000080327b <cprintf>:
  80327b:	55                   	push   %rbp
  80327c:	48 89 e5             	mov    %rsp,%rbp
  80327f:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  803286:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80328d:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  803294:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80329b:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8032a2:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8032a9:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8032b0:	84 c0                	test   %al,%al
  8032b2:	74 20                	je     8032d4 <cprintf+0x59>
  8032b4:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8032b8:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8032bc:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8032c0:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8032c4:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8032c8:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8032cc:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8032d0:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8032d4:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8032db:	00 00 00 
  8032de:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8032e5:	00 00 00 
  8032e8:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8032ec:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8032f3:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8032fa:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  803301:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  803308:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80330f:	48 8b 0a             	mov    (%rdx),%rcx
  803312:	48 89 08             	mov    %rcx,(%rax)
  803315:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  803319:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80331d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  803321:	48 89 50 10          	mov    %rdx,0x10(%rax)
  803325:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80332c:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  803333:	48 89 d6             	mov    %rdx,%rsi
  803336:	48 89 c7             	mov    %rax,%rdi
  803339:	48 b8 cf 31 80 00 00 	movabs $0x8031cf,%rax
  803340:	00 00 00 
  803343:	ff d0                	callq  *%rax
  803345:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80334b:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  803351:	c9                   	leaveq 
  803352:	c3                   	retq   

0000000000803353 <printnum>:
  803353:	55                   	push   %rbp
  803354:	48 89 e5             	mov    %rsp,%rbp
  803357:	48 83 ec 30          	sub    $0x30,%rsp
  80335b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80335f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803363:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803367:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  80336a:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  80336e:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  803372:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803375:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  803379:	77 54                	ja     8033cf <printnum+0x7c>
  80337b:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80337e:	8d 78 ff             	lea    -0x1(%rax),%edi
  803381:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  803384:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803388:	ba 00 00 00 00       	mov    $0x0,%edx
  80338d:	48 f7 f6             	div    %rsi
  803390:	49 89 c2             	mov    %rax,%r10
  803393:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  803396:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803399:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80339d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8033a1:	41 89 c9             	mov    %ecx,%r9d
  8033a4:	41 89 f8             	mov    %edi,%r8d
  8033a7:	89 d1                	mov    %edx,%ecx
  8033a9:	4c 89 d2             	mov    %r10,%rdx
  8033ac:	48 89 c7             	mov    %rax,%rdi
  8033af:	48 b8 53 33 80 00 00 	movabs $0x803353,%rax
  8033b6:	00 00 00 
  8033b9:	ff d0                	callq  *%rax
  8033bb:	eb 1c                	jmp    8033d9 <printnum+0x86>
  8033bd:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8033c1:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8033c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8033c8:	48 89 ce             	mov    %rcx,%rsi
  8033cb:	89 d7                	mov    %edx,%edi
  8033cd:	ff d0                	callq  *%rax
  8033cf:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  8033d3:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  8033d7:	7f e4                	jg     8033bd <printnum+0x6a>
  8033d9:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8033dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033e0:	ba 00 00 00 00       	mov    $0x0,%edx
  8033e5:	48 f7 f1             	div    %rcx
  8033e8:	48 b8 70 44 80 00 00 	movabs $0x804470,%rax
  8033ef:	00 00 00 
  8033f2:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  8033f6:	0f be d0             	movsbl %al,%edx
  8033f9:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8033fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803401:	48 89 ce             	mov    %rcx,%rsi
  803404:	89 d7                	mov    %edx,%edi
  803406:	ff d0                	callq  *%rax
  803408:	90                   	nop
  803409:	c9                   	leaveq 
  80340a:	c3                   	retq   

000000000080340b <getuint>:
  80340b:	55                   	push   %rbp
  80340c:	48 89 e5             	mov    %rsp,%rbp
  80340f:	48 83 ec 20          	sub    $0x20,%rsp
  803413:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803417:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80341a:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80341e:	7e 4f                	jle    80346f <getuint+0x64>
  803420:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803424:	8b 00                	mov    (%rax),%eax
  803426:	83 f8 30             	cmp    $0x30,%eax
  803429:	73 24                	jae    80344f <getuint+0x44>
  80342b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80342f:	48 8b 50 10          	mov    0x10(%rax),%rdx
  803433:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803437:	8b 00                	mov    (%rax),%eax
  803439:	89 c0                	mov    %eax,%eax
  80343b:	48 01 d0             	add    %rdx,%rax
  80343e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803442:	8b 12                	mov    (%rdx),%edx
  803444:	8d 4a 08             	lea    0x8(%rdx),%ecx
  803447:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80344b:	89 0a                	mov    %ecx,(%rdx)
  80344d:	eb 14                	jmp    803463 <getuint+0x58>
  80344f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803453:	48 8b 40 08          	mov    0x8(%rax),%rax
  803457:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80345b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80345f:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  803463:	48 8b 00             	mov    (%rax),%rax
  803466:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80346a:	e9 9d 00 00 00       	jmpq   80350c <getuint+0x101>
  80346f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  803473:	74 4c                	je     8034c1 <getuint+0xb6>
  803475:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803479:	8b 00                	mov    (%rax),%eax
  80347b:	83 f8 30             	cmp    $0x30,%eax
  80347e:	73 24                	jae    8034a4 <getuint+0x99>
  803480:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803484:	48 8b 50 10          	mov    0x10(%rax),%rdx
  803488:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80348c:	8b 00                	mov    (%rax),%eax
  80348e:	89 c0                	mov    %eax,%eax
  803490:	48 01 d0             	add    %rdx,%rax
  803493:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803497:	8b 12                	mov    (%rdx),%edx
  803499:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80349c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8034a0:	89 0a                	mov    %ecx,(%rdx)
  8034a2:	eb 14                	jmp    8034b8 <getuint+0xad>
  8034a4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034a8:	48 8b 40 08          	mov    0x8(%rax),%rax
  8034ac:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8034b0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8034b4:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8034b8:	48 8b 00             	mov    (%rax),%rax
  8034bb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8034bf:	eb 4b                	jmp    80350c <getuint+0x101>
  8034c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034c5:	8b 00                	mov    (%rax),%eax
  8034c7:	83 f8 30             	cmp    $0x30,%eax
  8034ca:	73 24                	jae    8034f0 <getuint+0xe5>
  8034cc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034d0:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8034d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034d8:	8b 00                	mov    (%rax),%eax
  8034da:	89 c0                	mov    %eax,%eax
  8034dc:	48 01 d0             	add    %rdx,%rax
  8034df:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8034e3:	8b 12                	mov    (%rdx),%edx
  8034e5:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8034e8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8034ec:	89 0a                	mov    %ecx,(%rdx)
  8034ee:	eb 14                	jmp    803504 <getuint+0xf9>
  8034f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034f4:	48 8b 40 08          	mov    0x8(%rax),%rax
  8034f8:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8034fc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803500:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  803504:	8b 00                	mov    (%rax),%eax
  803506:	89 c0                	mov    %eax,%eax
  803508:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80350c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803510:	c9                   	leaveq 
  803511:	c3                   	retq   

0000000000803512 <getint>:
  803512:	55                   	push   %rbp
  803513:	48 89 e5             	mov    %rsp,%rbp
  803516:	48 83 ec 20          	sub    $0x20,%rsp
  80351a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80351e:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  803521:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  803525:	7e 4f                	jle    803576 <getint+0x64>
  803527:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80352b:	8b 00                	mov    (%rax),%eax
  80352d:	83 f8 30             	cmp    $0x30,%eax
  803530:	73 24                	jae    803556 <getint+0x44>
  803532:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803536:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80353a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80353e:	8b 00                	mov    (%rax),%eax
  803540:	89 c0                	mov    %eax,%eax
  803542:	48 01 d0             	add    %rdx,%rax
  803545:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803549:	8b 12                	mov    (%rdx),%edx
  80354b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80354e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803552:	89 0a                	mov    %ecx,(%rdx)
  803554:	eb 14                	jmp    80356a <getint+0x58>
  803556:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80355a:	48 8b 40 08          	mov    0x8(%rax),%rax
  80355e:	48 8d 48 08          	lea    0x8(%rax),%rcx
  803562:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803566:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80356a:	48 8b 00             	mov    (%rax),%rax
  80356d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803571:	e9 9d 00 00 00       	jmpq   803613 <getint+0x101>
  803576:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80357a:	74 4c                	je     8035c8 <getint+0xb6>
  80357c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803580:	8b 00                	mov    (%rax),%eax
  803582:	83 f8 30             	cmp    $0x30,%eax
  803585:	73 24                	jae    8035ab <getint+0x99>
  803587:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80358b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80358f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803593:	8b 00                	mov    (%rax),%eax
  803595:	89 c0                	mov    %eax,%eax
  803597:	48 01 d0             	add    %rdx,%rax
  80359a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80359e:	8b 12                	mov    (%rdx),%edx
  8035a0:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8035a3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8035a7:	89 0a                	mov    %ecx,(%rdx)
  8035a9:	eb 14                	jmp    8035bf <getint+0xad>
  8035ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035af:	48 8b 40 08          	mov    0x8(%rax),%rax
  8035b3:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8035b7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8035bb:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8035bf:	48 8b 00             	mov    (%rax),%rax
  8035c2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8035c6:	eb 4b                	jmp    803613 <getint+0x101>
  8035c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035cc:	8b 00                	mov    (%rax),%eax
  8035ce:	83 f8 30             	cmp    $0x30,%eax
  8035d1:	73 24                	jae    8035f7 <getint+0xe5>
  8035d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035d7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8035db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035df:	8b 00                	mov    (%rax),%eax
  8035e1:	89 c0                	mov    %eax,%eax
  8035e3:	48 01 d0             	add    %rdx,%rax
  8035e6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8035ea:	8b 12                	mov    (%rdx),%edx
  8035ec:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8035ef:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8035f3:	89 0a                	mov    %ecx,(%rdx)
  8035f5:	eb 14                	jmp    80360b <getint+0xf9>
  8035f7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035fb:	48 8b 40 08          	mov    0x8(%rax),%rax
  8035ff:	48 8d 48 08          	lea    0x8(%rax),%rcx
  803603:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803607:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80360b:	8b 00                	mov    (%rax),%eax
  80360d:	48 98                	cltq   
  80360f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803613:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803617:	c9                   	leaveq 
  803618:	c3                   	retq   

0000000000803619 <vprintfmt>:
  803619:	55                   	push   %rbp
  80361a:	48 89 e5             	mov    %rsp,%rbp
  80361d:	41 54                	push   %r12
  80361f:	53                   	push   %rbx
  803620:	48 83 ec 60          	sub    $0x60,%rsp
  803624:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  803628:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  80362c:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  803630:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  803634:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803638:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  80363c:	48 8b 0a             	mov    (%rdx),%rcx
  80363f:	48 89 08             	mov    %rcx,(%rax)
  803642:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  803646:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80364a:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80364e:	48 89 50 10          	mov    %rdx,0x10(%rax)
  803652:	eb 17                	jmp    80366b <vprintfmt+0x52>
  803654:	85 db                	test   %ebx,%ebx
  803656:	0f 84 b9 04 00 00    	je     803b15 <vprintfmt+0x4fc>
  80365c:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803660:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803664:	48 89 d6             	mov    %rdx,%rsi
  803667:	89 df                	mov    %ebx,%edi
  803669:	ff d0                	callq  *%rax
  80366b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80366f:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803673:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  803677:	0f b6 00             	movzbl (%rax),%eax
  80367a:	0f b6 d8             	movzbl %al,%ebx
  80367d:	83 fb 25             	cmp    $0x25,%ebx
  803680:	75 d2                	jne    803654 <vprintfmt+0x3b>
  803682:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  803686:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  80368d:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  803694:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80369b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  8036a2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8036a6:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8036aa:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8036ae:	0f b6 00             	movzbl (%rax),%eax
  8036b1:	0f b6 d8             	movzbl %al,%ebx
  8036b4:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8036b7:	83 f8 55             	cmp    $0x55,%eax
  8036ba:	0f 87 22 04 00 00    	ja     803ae2 <vprintfmt+0x4c9>
  8036c0:	89 c0                	mov    %eax,%eax
  8036c2:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8036c9:	00 
  8036ca:	48 b8 98 44 80 00 00 	movabs $0x804498,%rax
  8036d1:	00 00 00 
  8036d4:	48 01 d0             	add    %rdx,%rax
  8036d7:	48 8b 00             	mov    (%rax),%rax
  8036da:	ff e0                	jmpq   *%rax
  8036dc:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8036e0:	eb c0                	jmp    8036a2 <vprintfmt+0x89>
  8036e2:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8036e6:	eb ba                	jmp    8036a2 <vprintfmt+0x89>
  8036e8:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8036ef:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8036f2:	89 d0                	mov    %edx,%eax
  8036f4:	c1 e0 02             	shl    $0x2,%eax
  8036f7:	01 d0                	add    %edx,%eax
  8036f9:	01 c0                	add    %eax,%eax
  8036fb:	01 d8                	add    %ebx,%eax
  8036fd:	83 e8 30             	sub    $0x30,%eax
  803700:	89 45 d8             	mov    %eax,-0x28(%rbp)
  803703:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  803707:	0f b6 00             	movzbl (%rax),%eax
  80370a:	0f be d8             	movsbl %al,%ebx
  80370d:	83 fb 2f             	cmp    $0x2f,%ebx
  803710:	7e 60                	jle    803772 <vprintfmt+0x159>
  803712:	83 fb 39             	cmp    $0x39,%ebx
  803715:	7f 5b                	jg     803772 <vprintfmt+0x159>
  803717:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  80371c:	eb d1                	jmp    8036ef <vprintfmt+0xd6>
  80371e:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803721:	83 f8 30             	cmp    $0x30,%eax
  803724:	73 17                	jae    80373d <vprintfmt+0x124>
  803726:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80372a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80372d:	89 d2                	mov    %edx,%edx
  80372f:	48 01 d0             	add    %rdx,%rax
  803732:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803735:	83 c2 08             	add    $0x8,%edx
  803738:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80373b:	eb 0c                	jmp    803749 <vprintfmt+0x130>
  80373d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803741:	48 8d 50 08          	lea    0x8(%rax),%rdx
  803745:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  803749:	8b 00                	mov    (%rax),%eax
  80374b:	89 45 d8             	mov    %eax,-0x28(%rbp)
  80374e:	eb 23                	jmp    803773 <vprintfmt+0x15a>
  803750:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  803754:	0f 89 48 ff ff ff    	jns    8036a2 <vprintfmt+0x89>
  80375a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  803761:	e9 3c ff ff ff       	jmpq   8036a2 <vprintfmt+0x89>
  803766:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  80376d:	e9 30 ff ff ff       	jmpq   8036a2 <vprintfmt+0x89>
  803772:	90                   	nop
  803773:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  803777:	0f 89 25 ff ff ff    	jns    8036a2 <vprintfmt+0x89>
  80377d:	8b 45 d8             	mov    -0x28(%rbp),%eax
  803780:	89 45 dc             	mov    %eax,-0x24(%rbp)
  803783:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80378a:	e9 13 ff ff ff       	jmpq   8036a2 <vprintfmt+0x89>
  80378f:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  803793:	e9 0a ff ff ff       	jmpq   8036a2 <vprintfmt+0x89>
  803798:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80379b:	83 f8 30             	cmp    $0x30,%eax
  80379e:	73 17                	jae    8037b7 <vprintfmt+0x19e>
  8037a0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8037a4:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8037a7:	89 d2                	mov    %edx,%edx
  8037a9:	48 01 d0             	add    %rdx,%rax
  8037ac:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8037af:	83 c2 08             	add    $0x8,%edx
  8037b2:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8037b5:	eb 0c                	jmp    8037c3 <vprintfmt+0x1aa>
  8037b7:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8037bb:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8037bf:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8037c3:	8b 10                	mov    (%rax),%edx
  8037c5:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8037c9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8037cd:	48 89 ce             	mov    %rcx,%rsi
  8037d0:	89 d7                	mov    %edx,%edi
  8037d2:	ff d0                	callq  *%rax
  8037d4:	e9 37 03 00 00       	jmpq   803b10 <vprintfmt+0x4f7>
  8037d9:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8037dc:	83 f8 30             	cmp    $0x30,%eax
  8037df:	73 17                	jae    8037f8 <vprintfmt+0x1df>
  8037e1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8037e5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8037e8:	89 d2                	mov    %edx,%edx
  8037ea:	48 01 d0             	add    %rdx,%rax
  8037ed:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8037f0:	83 c2 08             	add    $0x8,%edx
  8037f3:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8037f6:	eb 0c                	jmp    803804 <vprintfmt+0x1eb>
  8037f8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8037fc:	48 8d 50 08          	lea    0x8(%rax),%rdx
  803800:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  803804:	8b 18                	mov    (%rax),%ebx
  803806:	85 db                	test   %ebx,%ebx
  803808:	79 02                	jns    80380c <vprintfmt+0x1f3>
  80380a:	f7 db                	neg    %ebx
  80380c:	83 fb 15             	cmp    $0x15,%ebx
  80380f:	7f 16                	jg     803827 <vprintfmt+0x20e>
  803811:	48 b8 c0 43 80 00 00 	movabs $0x8043c0,%rax
  803818:	00 00 00 
  80381b:	48 63 d3             	movslq %ebx,%rdx
  80381e:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  803822:	4d 85 e4             	test   %r12,%r12
  803825:	75 2e                	jne    803855 <vprintfmt+0x23c>
  803827:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80382b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80382f:	89 d9                	mov    %ebx,%ecx
  803831:	48 ba 81 44 80 00 00 	movabs $0x804481,%rdx
  803838:	00 00 00 
  80383b:	48 89 c7             	mov    %rax,%rdi
  80383e:	b8 00 00 00 00       	mov    $0x0,%eax
  803843:	49 b8 1f 3b 80 00 00 	movabs $0x803b1f,%r8
  80384a:	00 00 00 
  80384d:	41 ff d0             	callq  *%r8
  803850:	e9 bb 02 00 00       	jmpq   803b10 <vprintfmt+0x4f7>
  803855:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  803859:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80385d:	4c 89 e1             	mov    %r12,%rcx
  803860:	48 ba 8a 44 80 00 00 	movabs $0x80448a,%rdx
  803867:	00 00 00 
  80386a:	48 89 c7             	mov    %rax,%rdi
  80386d:	b8 00 00 00 00       	mov    $0x0,%eax
  803872:	49 b8 1f 3b 80 00 00 	movabs $0x803b1f,%r8
  803879:	00 00 00 
  80387c:	41 ff d0             	callq  *%r8
  80387f:	e9 8c 02 00 00       	jmpq   803b10 <vprintfmt+0x4f7>
  803884:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803887:	83 f8 30             	cmp    $0x30,%eax
  80388a:	73 17                	jae    8038a3 <vprintfmt+0x28a>
  80388c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803890:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803893:	89 d2                	mov    %edx,%edx
  803895:	48 01 d0             	add    %rdx,%rax
  803898:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80389b:	83 c2 08             	add    $0x8,%edx
  80389e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8038a1:	eb 0c                	jmp    8038af <vprintfmt+0x296>
  8038a3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8038a7:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8038ab:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8038af:	4c 8b 20             	mov    (%rax),%r12
  8038b2:	4d 85 e4             	test   %r12,%r12
  8038b5:	75 0a                	jne    8038c1 <vprintfmt+0x2a8>
  8038b7:	49 bc 8d 44 80 00 00 	movabs $0x80448d,%r12
  8038be:	00 00 00 
  8038c1:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8038c5:	7e 78                	jle    80393f <vprintfmt+0x326>
  8038c7:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  8038cb:	74 72                	je     80393f <vprintfmt+0x326>
  8038cd:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8038d0:	48 98                	cltq   
  8038d2:	48 89 c6             	mov    %rax,%rsi
  8038d5:	4c 89 e7             	mov    %r12,%rdi
  8038d8:	48 b8 29 02 80 00 00 	movabs $0x800229,%rax
  8038df:	00 00 00 
  8038e2:	ff d0                	callq  *%rax
  8038e4:	29 45 dc             	sub    %eax,-0x24(%rbp)
  8038e7:	eb 17                	jmp    803900 <vprintfmt+0x2e7>
  8038e9:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  8038ed:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8038f1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8038f5:	48 89 ce             	mov    %rcx,%rsi
  8038f8:	89 d7                	mov    %edx,%edi
  8038fa:	ff d0                	callq  *%rax
  8038fc:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  803900:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  803904:	7f e3                	jg     8038e9 <vprintfmt+0x2d0>
  803906:	eb 37                	jmp    80393f <vprintfmt+0x326>
  803908:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  80390c:	74 1e                	je     80392c <vprintfmt+0x313>
  80390e:	83 fb 1f             	cmp    $0x1f,%ebx
  803911:	7e 05                	jle    803918 <vprintfmt+0x2ff>
  803913:	83 fb 7e             	cmp    $0x7e,%ebx
  803916:	7e 14                	jle    80392c <vprintfmt+0x313>
  803918:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80391c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803920:	48 89 d6             	mov    %rdx,%rsi
  803923:	bf 3f 00 00 00       	mov    $0x3f,%edi
  803928:	ff d0                	callq  *%rax
  80392a:	eb 0f                	jmp    80393b <vprintfmt+0x322>
  80392c:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803930:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803934:	48 89 d6             	mov    %rdx,%rsi
  803937:	89 df                	mov    %ebx,%edi
  803939:	ff d0                	callq  *%rax
  80393b:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  80393f:	4c 89 e0             	mov    %r12,%rax
  803942:	4c 8d 60 01          	lea    0x1(%rax),%r12
  803946:	0f b6 00             	movzbl (%rax),%eax
  803949:	0f be d8             	movsbl %al,%ebx
  80394c:	85 db                	test   %ebx,%ebx
  80394e:	74 28                	je     803978 <vprintfmt+0x35f>
  803950:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  803954:	78 b2                	js     803908 <vprintfmt+0x2ef>
  803956:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  80395a:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  80395e:	79 a8                	jns    803908 <vprintfmt+0x2ef>
  803960:	eb 16                	jmp    803978 <vprintfmt+0x35f>
  803962:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803966:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80396a:	48 89 d6             	mov    %rdx,%rsi
  80396d:	bf 20 00 00 00       	mov    $0x20,%edi
  803972:	ff d0                	callq  *%rax
  803974:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  803978:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80397c:	7f e4                	jg     803962 <vprintfmt+0x349>
  80397e:	e9 8d 01 00 00       	jmpq   803b10 <vprintfmt+0x4f7>
  803983:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803987:	be 03 00 00 00       	mov    $0x3,%esi
  80398c:	48 89 c7             	mov    %rax,%rdi
  80398f:	48 b8 12 35 80 00 00 	movabs $0x803512,%rax
  803996:	00 00 00 
  803999:	ff d0                	callq  *%rax
  80399b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80399f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039a3:	48 85 c0             	test   %rax,%rax
  8039a6:	79 1d                	jns    8039c5 <vprintfmt+0x3ac>
  8039a8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8039ac:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8039b0:	48 89 d6             	mov    %rdx,%rsi
  8039b3:	bf 2d 00 00 00       	mov    $0x2d,%edi
  8039b8:	ff d0                	callq  *%rax
  8039ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039be:	48 f7 d8             	neg    %rax
  8039c1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8039c5:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8039cc:	e9 d2 00 00 00       	jmpq   803aa3 <vprintfmt+0x48a>
  8039d1:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8039d5:	be 03 00 00 00       	mov    $0x3,%esi
  8039da:	48 89 c7             	mov    %rax,%rdi
  8039dd:	48 b8 0b 34 80 00 00 	movabs $0x80340b,%rax
  8039e4:	00 00 00 
  8039e7:	ff d0                	callq  *%rax
  8039e9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8039ed:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8039f4:	e9 aa 00 00 00       	jmpq   803aa3 <vprintfmt+0x48a>
  8039f9:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8039fd:	be 03 00 00 00       	mov    $0x3,%esi
  803a02:	48 89 c7             	mov    %rax,%rdi
  803a05:	48 b8 0b 34 80 00 00 	movabs $0x80340b,%rax
  803a0c:	00 00 00 
  803a0f:	ff d0                	callq  *%rax
  803a11:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803a15:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  803a1c:	e9 82 00 00 00       	jmpq   803aa3 <vprintfmt+0x48a>
  803a21:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803a25:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803a29:	48 89 d6             	mov    %rdx,%rsi
  803a2c:	bf 30 00 00 00       	mov    $0x30,%edi
  803a31:	ff d0                	callq  *%rax
  803a33:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803a37:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803a3b:	48 89 d6             	mov    %rdx,%rsi
  803a3e:	bf 78 00 00 00       	mov    $0x78,%edi
  803a43:	ff d0                	callq  *%rax
  803a45:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803a48:	83 f8 30             	cmp    $0x30,%eax
  803a4b:	73 17                	jae    803a64 <vprintfmt+0x44b>
  803a4d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803a51:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803a54:	89 d2                	mov    %edx,%edx
  803a56:	48 01 d0             	add    %rdx,%rax
  803a59:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803a5c:	83 c2 08             	add    $0x8,%edx
  803a5f:	89 55 b8             	mov    %edx,-0x48(%rbp)
  803a62:	eb 0c                	jmp    803a70 <vprintfmt+0x457>
  803a64:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803a68:	48 8d 50 08          	lea    0x8(%rax),%rdx
  803a6c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  803a70:	48 8b 00             	mov    (%rax),%rax
  803a73:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803a77:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  803a7e:	eb 23                	jmp    803aa3 <vprintfmt+0x48a>
  803a80:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803a84:	be 03 00 00 00       	mov    $0x3,%esi
  803a89:	48 89 c7             	mov    %rax,%rdi
  803a8c:	48 b8 0b 34 80 00 00 	movabs $0x80340b,%rax
  803a93:	00 00 00 
  803a96:	ff d0                	callq  *%rax
  803a98:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803a9c:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  803aa3:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  803aa8:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  803aab:	8b 7d dc             	mov    -0x24(%rbp),%edi
  803aae:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803ab2:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  803ab6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803aba:	45 89 c1             	mov    %r8d,%r9d
  803abd:	41 89 f8             	mov    %edi,%r8d
  803ac0:	48 89 c7             	mov    %rax,%rdi
  803ac3:	48 b8 53 33 80 00 00 	movabs $0x803353,%rax
  803aca:	00 00 00 
  803acd:	ff d0                	callq  *%rax
  803acf:	eb 3f                	jmp    803b10 <vprintfmt+0x4f7>
  803ad1:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803ad5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803ad9:	48 89 d6             	mov    %rdx,%rsi
  803adc:	89 df                	mov    %ebx,%edi
  803ade:	ff d0                	callq  *%rax
  803ae0:	eb 2e                	jmp    803b10 <vprintfmt+0x4f7>
  803ae2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803ae6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803aea:	48 89 d6             	mov    %rdx,%rsi
  803aed:	bf 25 00 00 00       	mov    $0x25,%edi
  803af2:	ff d0                	callq  *%rax
  803af4:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  803af9:	eb 05                	jmp    803b00 <vprintfmt+0x4e7>
  803afb:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  803b00:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  803b04:	48 83 e8 01          	sub    $0x1,%rax
  803b08:	0f b6 00             	movzbl (%rax),%eax
  803b0b:	3c 25                	cmp    $0x25,%al
  803b0d:	75 ec                	jne    803afb <vprintfmt+0x4e2>
  803b0f:	90                   	nop
  803b10:	e9 3d fb ff ff       	jmpq   803652 <vprintfmt+0x39>
  803b15:	90                   	nop
  803b16:	48 83 c4 60          	add    $0x60,%rsp
  803b1a:	5b                   	pop    %rbx
  803b1b:	41 5c                	pop    %r12
  803b1d:	5d                   	pop    %rbp
  803b1e:	c3                   	retq   

0000000000803b1f <printfmt>:
  803b1f:	55                   	push   %rbp
  803b20:	48 89 e5             	mov    %rsp,%rbp
  803b23:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  803b2a:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  803b31:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  803b38:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  803b3f:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803b46:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803b4d:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803b54:	84 c0                	test   %al,%al
  803b56:	74 20                	je     803b78 <printfmt+0x59>
  803b58:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803b5c:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803b60:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  803b64:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803b68:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803b6c:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803b70:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803b74:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803b78:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  803b7f:	00 00 00 
  803b82:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  803b89:	00 00 00 
  803b8c:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803b90:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  803b97:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  803b9e:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  803ba5:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  803bac:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  803bb3:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  803bba:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  803bc1:	48 89 c7             	mov    %rax,%rdi
  803bc4:	48 b8 19 36 80 00 00 	movabs $0x803619,%rax
  803bcb:	00 00 00 
  803bce:	ff d0                	callq  *%rax
  803bd0:	90                   	nop
  803bd1:	c9                   	leaveq 
  803bd2:	c3                   	retq   

0000000000803bd3 <sprintputch>:
  803bd3:	55                   	push   %rbp
  803bd4:	48 89 e5             	mov    %rsp,%rbp
  803bd7:	48 83 ec 10          	sub    $0x10,%rsp
  803bdb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803bde:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803be2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803be6:	8b 40 10             	mov    0x10(%rax),%eax
  803be9:	8d 50 01             	lea    0x1(%rax),%edx
  803bec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bf0:	89 50 10             	mov    %edx,0x10(%rax)
  803bf3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bf7:	48 8b 10             	mov    (%rax),%rdx
  803bfa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bfe:	48 8b 40 08          	mov    0x8(%rax),%rax
  803c02:	48 39 c2             	cmp    %rax,%rdx
  803c05:	73 17                	jae    803c1e <sprintputch+0x4b>
  803c07:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c0b:	48 8b 00             	mov    (%rax),%rax
  803c0e:	48 8d 48 01          	lea    0x1(%rax),%rcx
  803c12:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803c16:	48 89 0a             	mov    %rcx,(%rdx)
  803c19:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c1c:	88 10                	mov    %dl,(%rax)
  803c1e:	90                   	nop
  803c1f:	c9                   	leaveq 
  803c20:	c3                   	retq   

0000000000803c21 <vsnprintf>:
  803c21:	55                   	push   %rbp
  803c22:	48 89 e5             	mov    %rsp,%rbp
  803c25:	48 83 ec 50          	sub    $0x50,%rsp
  803c29:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803c2d:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  803c30:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  803c34:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  803c38:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  803c3c:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  803c40:	48 8b 0a             	mov    (%rdx),%rcx
  803c43:	48 89 08             	mov    %rcx,(%rax)
  803c46:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  803c4a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  803c4e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  803c52:	48 89 50 10          	mov    %rdx,0x10(%rax)
  803c56:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803c5a:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  803c5e:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  803c61:	48 98                	cltq   
  803c63:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  803c67:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803c6b:	48 01 d0             	add    %rdx,%rax
  803c6e:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  803c72:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  803c79:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  803c7e:	74 06                	je     803c86 <vsnprintf+0x65>
  803c80:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  803c84:	7f 07                	jg     803c8d <vsnprintf+0x6c>
  803c86:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803c8b:	eb 2f                	jmp    803cbc <vsnprintf+0x9b>
  803c8d:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  803c91:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  803c95:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803c99:	48 89 c6             	mov    %rax,%rsi
  803c9c:	48 bf d3 3b 80 00 00 	movabs $0x803bd3,%rdi
  803ca3:	00 00 00 
  803ca6:	48 b8 19 36 80 00 00 	movabs $0x803619,%rax
  803cad:	00 00 00 
  803cb0:	ff d0                	callq  *%rax
  803cb2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803cb6:	c6 00 00             	movb   $0x0,(%rax)
  803cb9:	8b 45 e0             	mov    -0x20(%rbp),%eax
  803cbc:	c9                   	leaveq 
  803cbd:	c3                   	retq   

0000000000803cbe <snprintf>:
  803cbe:	55                   	push   %rbp
  803cbf:	48 89 e5             	mov    %rsp,%rbp
  803cc2:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  803cc9:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  803cd0:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  803cd6:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  803cdd:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803ce4:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803ceb:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803cf2:	84 c0                	test   %al,%al
  803cf4:	74 20                	je     803d16 <snprintf+0x58>
  803cf6:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803cfa:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803cfe:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  803d02:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803d06:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803d0a:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803d0e:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803d12:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803d16:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  803d1d:	00 00 00 
  803d20:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  803d27:	00 00 00 
  803d2a:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803d2e:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803d35:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  803d3c:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  803d43:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  803d4a:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  803d51:	48 8b 0a             	mov    (%rdx),%rcx
  803d54:	48 89 08             	mov    %rcx,(%rax)
  803d57:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  803d5b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  803d5f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  803d63:	48 89 50 10          	mov    %rdx,0x10(%rax)
  803d67:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  803d6e:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  803d75:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  803d7b:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  803d82:	48 89 c7             	mov    %rax,%rdi
  803d85:	48 b8 21 3c 80 00 00 	movabs $0x803c21,%rax
  803d8c:	00 00 00 
  803d8f:	ff d0                	callq  *%rax
  803d91:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  803d97:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  803d9d:	c9                   	leaveq 
  803d9e:	c3                   	retq   

0000000000803d9f <ipc_recv>:
  803d9f:	55                   	push   %rbp
  803da0:	48 89 e5             	mov    %rsp,%rbp
  803da3:	48 83 ec 30          	sub    $0x30,%rsp
  803da7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803dab:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803daf:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803db3:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803db8:	75 0e                	jne    803dc8 <ipc_recv+0x29>
  803dba:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803dc1:	00 00 00 
  803dc4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803dc8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803dcc:	48 89 c7             	mov    %rax,%rdi
  803dcf:	48 b8 d1 0d 80 00 00 	movabs $0x800dd1,%rax
  803dd6:	00 00 00 
  803dd9:	ff d0                	callq  *%rax
  803ddb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803dde:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803de2:	79 27                	jns    803e0b <ipc_recv+0x6c>
  803de4:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803de9:	74 0a                	je     803df5 <ipc_recv+0x56>
  803deb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803def:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803df5:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803dfa:	74 0a                	je     803e06 <ipc_recv+0x67>
  803dfc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e00:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803e06:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e09:	eb 53                	jmp    803e5e <ipc_recv+0xbf>
  803e0b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803e10:	74 19                	je     803e2b <ipc_recv+0x8c>
  803e12:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803e19:	00 00 00 
  803e1c:	48 8b 00             	mov    (%rax),%rax
  803e1f:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  803e25:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e29:	89 10                	mov    %edx,(%rax)
  803e2b:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803e30:	74 19                	je     803e4b <ipc_recv+0xac>
  803e32:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803e39:	00 00 00 
  803e3c:	48 8b 00             	mov    (%rax),%rax
  803e3f:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  803e45:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e49:	89 10                	mov    %edx,(%rax)
  803e4b:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803e52:	00 00 00 
  803e55:	48 8b 00             	mov    (%rax),%rax
  803e58:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  803e5e:	c9                   	leaveq 
  803e5f:	c3                   	retq   

0000000000803e60 <ipc_send>:
  803e60:	55                   	push   %rbp
  803e61:	48 89 e5             	mov    %rsp,%rbp
  803e64:	48 83 ec 30          	sub    $0x30,%rsp
  803e68:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e6b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803e6e:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  803e72:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803e75:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803e7a:	75 1c                	jne    803e98 <ipc_send+0x38>
  803e7c:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803e83:	00 00 00 
  803e86:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803e8a:	eb 0c                	jmp    803e98 <ipc_send+0x38>
  803e8c:	48 b8 5a 0b 80 00 00 	movabs $0x800b5a,%rax
  803e93:	00 00 00 
  803e96:	ff d0                	callq  *%rax
  803e98:	8b 75 e8             	mov    -0x18(%rbp),%esi
  803e9b:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  803e9e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803ea2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ea5:	89 c7                	mov    %eax,%edi
  803ea7:	48 b8 7a 0d 80 00 00 	movabs $0x800d7a,%rax
  803eae:	00 00 00 
  803eb1:	ff d0                	callq  *%rax
  803eb3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803eb6:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  803eba:	74 d0                	je     803e8c <ipc_send+0x2c>
  803ebc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ec0:	79 30                	jns    803ef2 <ipc_send+0x92>
  803ec2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ec5:	89 c1                	mov    %eax,%ecx
  803ec7:	48 ba 48 47 80 00 00 	movabs $0x804748,%rdx
  803ece:	00 00 00 
  803ed1:	be 44 00 00 00       	mov    $0x44,%esi
  803ed6:	48 bf 5e 47 80 00 00 	movabs $0x80475e,%rdi
  803edd:	00 00 00 
  803ee0:	b8 00 00 00 00       	mov    $0x0,%eax
  803ee5:	49 b8 41 30 80 00 00 	movabs $0x803041,%r8
  803eec:	00 00 00 
  803eef:	41 ff d0             	callq  *%r8
  803ef2:	90                   	nop
  803ef3:	c9                   	leaveq 
  803ef4:	c3                   	retq   

0000000000803ef5 <ipc_host_recv>:
  803ef5:	55                   	push   %rbp
  803ef6:	48 89 e5             	mov    %rsp,%rbp
  803ef9:	48 83 ec 10          	sub    $0x10,%rsp
  803efd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803f01:	48 ba 70 47 80 00 00 	movabs $0x804770,%rdx
  803f08:	00 00 00 
  803f0b:	be 4e 00 00 00       	mov    $0x4e,%esi
  803f10:	48 bf 5e 47 80 00 00 	movabs $0x80475e,%rdi
  803f17:	00 00 00 
  803f1a:	b8 00 00 00 00       	mov    $0x0,%eax
  803f1f:	48 b9 41 30 80 00 00 	movabs $0x803041,%rcx
  803f26:	00 00 00 
  803f29:	ff d1                	callq  *%rcx

0000000000803f2b <ipc_host_send>:
  803f2b:	55                   	push   %rbp
  803f2c:	48 89 e5             	mov    %rsp,%rbp
  803f2f:	48 83 ec 20          	sub    $0x20,%rsp
  803f33:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f36:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803f39:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  803f3d:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803f40:	48 ba 90 47 80 00 00 	movabs $0x804790,%rdx
  803f47:	00 00 00 
  803f4a:	be 58 00 00 00       	mov    $0x58,%esi
  803f4f:	48 bf 5e 47 80 00 00 	movabs $0x80475e,%rdi
  803f56:	00 00 00 
  803f59:	b8 00 00 00 00       	mov    $0x0,%eax
  803f5e:	48 b9 41 30 80 00 00 	movabs $0x803041,%rcx
  803f65:	00 00 00 
  803f68:	ff d1                	callq  *%rcx

0000000000803f6a <ipc_find_env>:
  803f6a:	55                   	push   %rbp
  803f6b:	48 89 e5             	mov    %rsp,%rbp
  803f6e:	48 83 ec 18          	sub    $0x18,%rsp
  803f72:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f75:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803f7c:	eb 4d                	jmp    803fcb <ipc_find_env+0x61>
  803f7e:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  803f85:	00 00 00 
  803f88:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f8b:	48 98                	cltq   
  803f8d:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  803f94:	48 01 d0             	add    %rdx,%rax
  803f97:	48 05 d0 00 00 00    	add    $0xd0,%rax
  803f9d:	8b 00                	mov    (%rax),%eax
  803f9f:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  803fa2:	75 23                	jne    803fc7 <ipc_find_env+0x5d>
  803fa4:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  803fab:	00 00 00 
  803fae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fb1:	48 98                	cltq   
  803fb3:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  803fba:	48 01 d0             	add    %rdx,%rax
  803fbd:	48 05 c8 00 00 00    	add    $0xc8,%rax
  803fc3:	8b 00                	mov    (%rax),%eax
  803fc5:	eb 12                	jmp    803fd9 <ipc_find_env+0x6f>
  803fc7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803fcb:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  803fd2:	7e aa                	jle    803f7e <ipc_find_env+0x14>
  803fd4:	b8 00 00 00 00       	mov    $0x0,%eax
  803fd9:	c9                   	leaveq 
  803fda:	c3                   	retq   

0000000000803fdb <pageref>:
  803fdb:	55                   	push   %rbp
  803fdc:	48 89 e5             	mov    %rsp,%rbp
  803fdf:	48 83 ec 18          	sub    $0x18,%rsp
  803fe3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803fe7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803feb:	48 c1 e8 15          	shr    $0x15,%rax
  803fef:	48 89 c2             	mov    %rax,%rdx
  803ff2:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803ff9:	01 00 00 
  803ffc:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804000:	83 e0 01             	and    $0x1,%eax
  804003:	48 85 c0             	test   %rax,%rax
  804006:	75 07                	jne    80400f <pageref+0x34>
  804008:	b8 00 00 00 00       	mov    $0x0,%eax
  80400d:	eb 56                	jmp    804065 <pageref+0x8a>
  80400f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804013:	48 c1 e8 0c          	shr    $0xc,%rax
  804017:	48 89 c2             	mov    %rax,%rdx
  80401a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804021:	01 00 00 
  804024:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804028:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80402c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804030:	83 e0 01             	and    $0x1,%eax
  804033:	48 85 c0             	test   %rax,%rax
  804036:	75 07                	jne    80403f <pageref+0x64>
  804038:	b8 00 00 00 00       	mov    $0x0,%eax
  80403d:	eb 26                	jmp    804065 <pageref+0x8a>
  80403f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804043:	48 c1 e8 0c          	shr    $0xc,%rax
  804047:	48 89 c2             	mov    %rax,%rdx
  80404a:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804051:	00 00 00 
  804054:	48 c1 e2 04          	shl    $0x4,%rdx
  804058:	48 01 d0             	add    %rdx,%rax
  80405b:	48 83 c0 08          	add    $0x8,%rax
  80405f:	0f b7 00             	movzwl (%rax),%eax
  804062:	0f b7 c0             	movzwl %ax,%eax
  804065:	c9                   	leaveq 
  804066:	c3                   	retq   
