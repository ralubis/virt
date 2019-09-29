
vmm/guest/obj/net/testinput:     file format elf64-x86-64


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
  80003c:	e8 18 0a 00 00       	callq  800a59 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <announce>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	c6 45 ea 52          	movb   $0x52,-0x16(%rbp)
  80004f:	c6 45 eb 54          	movb   $0x54,-0x15(%rbp)
  800053:	c6 45 ec 00          	movb   $0x0,-0x14(%rbp)
  800057:	c6 45 ed 12          	movb   $0x12,-0x13(%rbp)
  80005b:	c6 45 ee 34          	movb   $0x34,-0x12(%rbp)
  80005f:	c6 45 ef 56          	movb   $0x56,-0x11(%rbp)
  800063:	48 bf 60 55 80 00 00 	movabs $0x805560,%rdi
  80006a:	00 00 00 
  80006d:	48 b8 ae 50 80 00 00 	movabs $0x8050ae,%rax
  800074:	00 00 00 
  800077:	ff d0                	callq  *%rax
  800079:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80007c:	48 bf 6a 55 80 00 00 	movabs $0x80556a,%rdi
  800083:	00 00 00 
  800086:	48 b8 ae 50 80 00 00 	movabs $0x8050ae,%rax
  80008d:	00 00 00 
  800090:	ff d0                	callq  *%rax
  800092:	89 45 e0             	mov    %eax,-0x20(%rbp)
  800095:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80009c:	00 00 00 
  80009f:	48 8b 00             	mov    (%rax),%rax
  8000a2:	ba 07 00 00 00       	mov    $0x7,%edx
  8000a7:	48 89 c6             	mov    %rax,%rsi
  8000aa:	bf 00 00 00 00       	mov    $0x0,%edi
  8000af:	48 b8 fb 21 80 00 00 	movabs $0x8021fb,%rax
  8000b6:	00 00 00 
  8000b9:	ff d0                	callq  *%rax
  8000bb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8000be:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000c2:	79 30                	jns    8000f4 <announce+0xb1>
  8000c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000c7:	89 c1                	mov    %eax,%ecx
  8000c9:	48 ba 73 55 80 00 00 	movabs $0x805573,%rdx
  8000d0:	00 00 00 
  8000d3:	be 1a 00 00 00       	mov    $0x1a,%esi
  8000d8:	48 bf 84 55 80 00 00 	movabs $0x805584,%rdi
  8000df:	00 00 00 
  8000e2:	b8 00 00 00 00       	mov    $0x0,%eax
  8000e7:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  8000ee:	00 00 00 
  8000f1:	41 ff d0             	callq  *%r8
  8000f4:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8000fb:	00 00 00 
  8000fe:	48 8b 00             	mov    (%rax),%rax
  800101:	48 83 c0 04          	add    $0x4,%rax
  800105:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800109:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  800110:	00 00 00 
  800113:	48 8b 00             	mov    (%rax),%rax
  800116:	c7 00 2a 00 00 00    	movl   $0x2a,(%rax)
  80011c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800120:	ba 06 00 00 00       	mov    $0x6,%edx
  800125:	be ff 00 00 00       	mov    $0xff,%esi
  80012a:	48 89 c7             	mov    %rax,%rdi
  80012d:	48 b8 65 1b 80 00 00 	movabs $0x801b65,%rax
  800134:	00 00 00 
  800137:	ff d0                	callq  *%rax
  800139:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80013d:	48 8d 48 06          	lea    0x6(%rax),%rcx
  800141:	48 8d 45 ea          	lea    -0x16(%rbp),%rax
  800145:	ba 06 00 00 00       	mov    $0x6,%edx
  80014a:	48 89 c6             	mov    %rax,%rsi
  80014d:	48 89 cf             	mov    %rcx,%rdi
  800150:	48 b8 07 1d 80 00 00 	movabs $0x801d07,%rax
  800157:	00 00 00 
  80015a:	ff d0                	callq  *%rax
  80015c:	bf 06 08 00 00       	mov    $0x806,%edi
  800161:	48 b8 bf 54 80 00 00 	movabs $0x8054bf,%rax
  800168:	00 00 00 
  80016b:	ff d0                	callq  *%rax
  80016d:	89 c2                	mov    %eax,%edx
  80016f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800173:	66 89 50 0c          	mov    %dx,0xc(%rax)
  800177:	bf 01 00 00 00       	mov    $0x1,%edi
  80017c:	48 b8 bf 54 80 00 00 	movabs $0x8054bf,%rax
  800183:	00 00 00 
  800186:	ff d0                	callq  *%rax
  800188:	89 c2                	mov    %eax,%edx
  80018a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80018e:	66 89 50 0e          	mov    %dx,0xe(%rax)
  800192:	bf 00 08 00 00       	mov    $0x800,%edi
  800197:	48 b8 bf 54 80 00 00 	movabs $0x8054bf,%rax
  80019e:	00 00 00 
  8001a1:	ff d0                	callq  *%rax
  8001a3:	89 c2                	mov    %eax,%edx
  8001a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001a9:	66 89 50 10          	mov    %dx,0x10(%rax)
  8001ad:	bf 04 06 00 00       	mov    $0x604,%edi
  8001b2:	48 b8 bf 54 80 00 00 	movabs $0x8054bf,%rax
  8001b9:	00 00 00 
  8001bc:	ff d0                	callq  *%rax
  8001be:	89 c2                	mov    %eax,%edx
  8001c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001c4:	66 89 50 12          	mov    %dx,0x12(%rax)
  8001c8:	bf 01 00 00 00       	mov    $0x1,%edi
  8001cd:	48 b8 bf 54 80 00 00 	movabs $0x8054bf,%rax
  8001d4:	00 00 00 
  8001d7:	ff d0                	callq  *%rax
  8001d9:	89 c2                	mov    %eax,%edx
  8001db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001df:	66 89 50 14          	mov    %dx,0x14(%rax)
  8001e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001e7:	48 8d 48 16          	lea    0x16(%rax),%rcx
  8001eb:	48 8d 45 ea          	lea    -0x16(%rbp),%rax
  8001ef:	ba 06 00 00 00       	mov    $0x6,%edx
  8001f4:	48 89 c6             	mov    %rax,%rsi
  8001f7:	48 89 cf             	mov    %rcx,%rdi
  8001fa:	48 b8 07 1d 80 00 00 	movabs $0x801d07,%rax
  800201:	00 00 00 
  800204:	ff d0                	callq  *%rax
  800206:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80020a:	48 8d 48 1c          	lea    0x1c(%rax),%rcx
  80020e:	48 8d 45 e4          	lea    -0x1c(%rbp),%rax
  800212:	ba 04 00 00 00       	mov    $0x4,%edx
  800217:	48 89 c6             	mov    %rax,%rsi
  80021a:	48 89 cf             	mov    %rcx,%rdi
  80021d:	48 b8 07 1d 80 00 00 	movabs $0x801d07,%rax
  800224:	00 00 00 
  800227:	ff d0                	callq  *%rax
  800229:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80022d:	48 83 c0 20          	add    $0x20,%rax
  800231:	ba 06 00 00 00       	mov    $0x6,%edx
  800236:	be 00 00 00 00       	mov    $0x0,%esi
  80023b:	48 89 c7             	mov    %rax,%rdi
  80023e:	48 b8 65 1b 80 00 00 	movabs $0x801b65,%rax
  800245:	00 00 00 
  800248:	ff d0                	callq  *%rax
  80024a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80024e:	48 8d 48 26          	lea    0x26(%rax),%rcx
  800252:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  800256:	ba 04 00 00 00       	mov    $0x4,%edx
  80025b:	48 89 c6             	mov    %rax,%rsi
  80025e:	48 89 cf             	mov    %rcx,%rdi
  800261:	48 b8 07 1d 80 00 00 	movabs $0x801d07,%rax
  800268:	00 00 00 
  80026b:	ff d0                	callq  *%rax
  80026d:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  800274:	00 00 00 
  800277:	48 8b 10             	mov    (%rax),%rdx
  80027a:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  800281:	00 00 00 
  800284:	8b 00                	mov    (%rax),%eax
  800286:	b9 07 00 00 00       	mov    $0x7,%ecx
  80028b:	be 0b 00 00 00       	mov    $0xb,%esi
  800290:	89 c7                	mov    %eax,%edi
  800292:	48 b8 d0 2c 80 00 00 	movabs $0x802cd0,%rax
  800299:	00 00 00 
  80029c:	ff d0                	callq  *%rax
  80029e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8002a5:	00 00 00 
  8002a8:	48 8b 00             	mov    (%rax),%rax
  8002ab:	48 89 c6             	mov    %rax,%rsi
  8002ae:	bf 00 00 00 00       	mov    $0x0,%edi
  8002b3:	48 b8 ad 22 80 00 00 	movabs $0x8022ad,%rax
  8002ba:	00 00 00 
  8002bd:	ff d0                	callq  *%rax
  8002bf:	90                   	nop
  8002c0:	c9                   	leaveq 
  8002c1:	c3                   	retq   

00000000008002c2 <hexdump>:
  8002c2:	55                   	push   %rbp
  8002c3:	48 89 e5             	mov    %rsp,%rbp
  8002c6:	48 81 ec 90 00 00 00 	sub    $0x90,%rsp
  8002cd:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
  8002d1:	48 89 75 80          	mov    %rsi,-0x80(%rbp)
  8002d5:	89 95 7c ff ff ff    	mov    %edx,-0x84(%rbp)
  8002db:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  8002df:	48 83 c0 50          	add    $0x50,%rax
  8002e3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8002e7:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8002ee:	00 
  8002ef:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8002f6:	e9 41 01 00 00       	jmpq   80043c <hexdump+0x17a>
  8002fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002fe:	83 e0 0f             	and    $0xf,%eax
  800301:	85 c0                	test   %eax,%eax
  800303:	75 4d                	jne    800352 <hexdump+0x90>
  800305:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800309:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  80030d:	48 29 c2             	sub    %rax,%rdx
  800310:	48 89 d0             	mov    %rdx,%rax
  800313:	89 c6                	mov    %eax,%esi
  800315:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  800318:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
  80031c:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  800320:	41 89 c8             	mov    %ecx,%r8d
  800323:	48 89 d1             	mov    %rdx,%rcx
  800326:	48 ba 97 55 80 00 00 	movabs $0x805597,%rdx
  80032d:	00 00 00 
  800330:	48 89 c7             	mov    %rax,%rdi
  800333:	b8 00 00 00 00       	mov    $0x0,%eax
  800338:	49 b9 7e 17 80 00 00 	movabs $0x80177e,%r9
  80033f:	00 00 00 
  800342:	41 ff d1             	callq  *%r9
  800345:	48 98                	cltq   
  800347:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  80034b:	48 01 d0             	add    %rdx,%rax
  80034e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800352:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800355:	48 63 d0             	movslq %eax,%rdx
  800358:	48 8b 45 80          	mov    -0x80(%rbp),%rax
  80035c:	48 01 d0             	add    %rdx,%rax
  80035f:	0f b6 00             	movzbl (%rax),%eax
  800362:	0f b6 d0             	movzbl %al,%edx
  800365:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  800369:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80036d:	48 29 c1             	sub    %rax,%rcx
  800370:	48 89 c8             	mov    %rcx,%rax
  800373:	89 c6                	mov    %eax,%esi
  800375:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800379:	89 d1                	mov    %edx,%ecx
  80037b:	48 ba a1 55 80 00 00 	movabs $0x8055a1,%rdx
  800382:	00 00 00 
  800385:	48 89 c7             	mov    %rax,%rdi
  800388:	b8 00 00 00 00       	mov    $0x0,%eax
  80038d:	49 b8 7e 17 80 00 00 	movabs $0x80177e,%r8
  800394:	00 00 00 
  800397:	41 ff d0             	callq  *%r8
  80039a:	48 98                	cltq   
  80039c:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8003a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003a3:	99                   	cltd   
  8003a4:	c1 ea 1c             	shr    $0x1c,%edx
  8003a7:	01 d0                	add    %edx,%eax
  8003a9:	83 e0 0f             	and    $0xf,%eax
  8003ac:	29 d0                	sub    %edx,%eax
  8003ae:	83 f8 0f             	cmp    $0xf,%eax
  8003b1:	74 0e                	je     8003c1 <hexdump+0xff>
  8003b3:	8b 85 7c ff ff ff    	mov    -0x84(%rbp),%eax
  8003b9:	83 e8 01             	sub    $0x1,%eax
  8003bc:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  8003bf:	75 33                	jne    8003f4 <hexdump+0x132>
  8003c1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003c5:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  8003c9:	48 89 d1             	mov    %rdx,%rcx
  8003cc:	48 29 c1             	sub    %rax,%rcx
  8003cf:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  8003d3:	48 89 c2             	mov    %rax,%rdx
  8003d6:	48 89 ce             	mov    %rcx,%rsi
  8003d9:	48 bf a6 55 80 00 00 	movabs $0x8055a6,%rdi
  8003e0:	00 00 00 
  8003e3:	b8 00 00 00 00       	mov    $0x0,%eax
  8003e8:	48 b9 3b 0d 80 00 00 	movabs $0x800d3b,%rcx
  8003ef:	00 00 00 
  8003f2:	ff d1                	callq  *%rcx
  8003f4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003f7:	99                   	cltd   
  8003f8:	c1 ea 1f             	shr    $0x1f,%edx
  8003fb:	01 d0                	add    %edx,%eax
  8003fd:	83 e0 01             	and    $0x1,%eax
  800400:	29 d0                	sub    %edx,%eax
  800402:	83 f8 01             	cmp    $0x1,%eax
  800405:	75 0f                	jne    800416 <hexdump+0x154>
  800407:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80040b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80040f:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  800413:	c6 00 20             	movb   $0x20,(%rax)
  800416:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800419:	99                   	cltd   
  80041a:	c1 ea 1c             	shr    $0x1c,%edx
  80041d:	01 d0                	add    %edx,%eax
  80041f:	83 e0 0f             	and    $0xf,%eax
  800422:	29 d0                	sub    %edx,%eax
  800424:	83 f8 07             	cmp    $0x7,%eax
  800427:	75 0f                	jne    800438 <hexdump+0x176>
  800429:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80042d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800431:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  800435:	c6 00 20             	movb   $0x20,(%rax)
  800438:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80043c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80043f:	3b 85 7c ff ff ff    	cmp    -0x84(%rbp),%eax
  800445:	0f 8c b0 fe ff ff    	jl     8002fb <hexdump+0x39>
  80044b:	90                   	nop
  80044c:	c9                   	leaveq 
  80044d:	c3                   	retq   

000000000080044e <umain>:
  80044e:	55                   	push   %rbp
  80044f:	48 89 e5             	mov    %rsp,%rbp
  800452:	48 83 ec 30          	sub    $0x30,%rsp
  800456:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800459:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80045d:	48 b8 82 21 80 00 00 	movabs $0x802182,%rax
  800464:	00 00 00 
  800467:	ff d0                	callq  *%rax
  800469:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80046c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  800473:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80047a:	00 00 00 
  80047d:	48 be ac 55 80 00 00 	movabs $0x8055ac,%rsi
  800484:	00 00 00 
  800487:	48 89 30             	mov    %rsi,(%rax)
  80048a:	48 b8 98 29 80 00 00 	movabs $0x802998,%rax
  800491:	00 00 00 
  800494:	ff d0                	callq  *%rax
  800496:	89 c2                	mov    %eax,%edx
  800498:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80049f:	00 00 00 
  8004a2:	89 10                	mov    %edx,(%rax)
  8004a4:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8004ab:	00 00 00 
  8004ae:	8b 00                	mov    (%rax),%eax
  8004b0:	85 c0                	test   %eax,%eax
  8004b2:	79 2a                	jns    8004de <umain+0x90>
  8004b4:	48 ba b6 55 80 00 00 	movabs $0x8055b6,%rdx
  8004bb:	00 00 00 
  8004be:	be 4e 00 00 00       	mov    $0x4e,%esi
  8004c3:	48 bf 84 55 80 00 00 	movabs $0x805584,%rdi
  8004ca:	00 00 00 
  8004cd:	b8 00 00 00 00       	mov    $0x0,%eax
  8004d2:	48 b9 01 0b 80 00 00 	movabs $0x800b01,%rcx
  8004d9:	00 00 00 
  8004dc:	ff d1                	callq  *%rcx
  8004de:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8004e5:	00 00 00 
  8004e8:	8b 00                	mov    (%rax),%eax
  8004ea:	85 c0                	test   %eax,%eax
  8004ec:	75 16                	jne    800504 <umain+0xb6>
  8004ee:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8004f1:	89 c7                	mov    %eax,%edi
  8004f3:	48 b8 44 09 80 00 00 	movabs $0x800944,%rax
  8004fa:	00 00 00 
  8004fd:	ff d0                	callq  *%rax
  8004ff:	e9 fd 01 00 00       	jmpq   800701 <umain+0x2b3>
  800504:	48 b8 98 29 80 00 00 	movabs $0x802998,%rax
  80050b:	00 00 00 
  80050e:	ff d0                	callq  *%rax
  800510:	89 c2                	mov    %eax,%edx
  800512:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  800519:	00 00 00 
  80051c:	89 10                	mov    %edx,(%rax)
  80051e:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  800525:	00 00 00 
  800528:	8b 00                	mov    (%rax),%eax
  80052a:	85 c0                	test   %eax,%eax
  80052c:	79 2a                	jns    800558 <umain+0x10a>
  80052e:	48 ba b6 55 80 00 00 	movabs $0x8055b6,%rdx
  800535:	00 00 00 
  800538:	be 56 00 00 00       	mov    $0x56,%esi
  80053d:	48 bf 84 55 80 00 00 	movabs $0x805584,%rdi
  800544:	00 00 00 
  800547:	b8 00 00 00 00       	mov    $0x0,%eax
  80054c:	48 b9 01 0b 80 00 00 	movabs $0x800b01,%rcx
  800553:	00 00 00 
  800556:	ff d1                	callq  *%rcx
  800558:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  80055f:	00 00 00 
  800562:	8b 00                	mov    (%rax),%eax
  800564:	85 c0                	test   %eax,%eax
  800566:	75 16                	jne    80057e <umain+0x130>
  800568:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80056b:	89 c7                	mov    %eax,%edi
  80056d:	48 b8 26 08 80 00 00 	movabs $0x800826,%rax
  800574:	00 00 00 
  800577:	ff d0                	callq  *%rax
  800579:	e9 83 01 00 00       	jmpq   800701 <umain+0x2b3>
  80057e:	48 bf c4 55 80 00 00 	movabs $0x8055c4,%rdi
  800585:	00 00 00 
  800588:	b8 00 00 00 00       	mov    $0x0,%eax
  80058d:	48 ba 3b 0d 80 00 00 	movabs $0x800d3b,%rdx
  800594:	00 00 00 
  800597:	ff d2                	callq  *%rdx
  800599:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8005a0:	00 00 00 
  8005a3:	ff d0                	callq  *%rax
  8005a5:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8005ac:	00 00 00 
  8005af:	48 8b 08             	mov    (%rax),%rcx
  8005b2:	48 8d 55 ec          	lea    -0x14(%rbp),%rdx
  8005b6:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8005ba:	48 89 ce             	mov    %rcx,%rsi
  8005bd:	48 89 c7             	mov    %rax,%rdi
  8005c0:	48 b8 0f 2c 80 00 00 	movabs $0x802c0f,%rax
  8005c7:	00 00 00 
  8005ca:	ff d0                	callq  *%rax
  8005cc:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8005cf:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8005d3:	79 30                	jns    800605 <umain+0x1b7>
  8005d5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8005d8:	89 c1                	mov    %eax,%ecx
  8005da:	48 ba e1 55 80 00 00 	movabs $0x8055e1,%rdx
  8005e1:	00 00 00 
  8005e4:	be 65 00 00 00       	mov    $0x65,%esi
  8005e9:	48 bf 84 55 80 00 00 	movabs $0x805584,%rdi
  8005f0:	00 00 00 
  8005f3:	b8 00 00 00 00       	mov    $0x0,%eax
  8005f8:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  8005ff:	00 00 00 
  800602:	41 ff d0             	callq  *%r8
  800605:	8b 55 f0             	mov    -0x10(%rbp),%edx
  800608:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  80060f:	00 00 00 
  800612:	8b 00                	mov    (%rax),%eax
  800614:	39 c2                	cmp    %eax,%edx
  800616:	74 30                	je     800648 <umain+0x1fa>
  800618:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80061b:	89 c1                	mov    %eax,%ecx
  80061d:	48 ba f0 55 80 00 00 	movabs $0x8055f0,%rdx
  800624:	00 00 00 
  800627:	be 67 00 00 00       	mov    $0x67,%esi
  80062c:	48 bf 84 55 80 00 00 	movabs $0x805584,%rdi
  800633:	00 00 00 
  800636:	b8 00 00 00 00       	mov    $0x0,%eax
  80063b:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  800642:	00 00 00 
  800645:	41 ff d0             	callq  *%r8
  800648:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  80064c:	74 30                	je     80067e <umain+0x230>
  80064e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800651:	89 c1                	mov    %eax,%ecx
  800653:	48 ba 15 56 80 00 00 	movabs $0x805615,%rdx
  80065a:	00 00 00 
  80065d:	be 69 00 00 00       	mov    $0x69,%esi
  800662:	48 bf 84 55 80 00 00 	movabs $0x805584,%rdi
  800669:	00 00 00 
  80066c:	b8 00 00 00 00       	mov    $0x0,%eax
  800671:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  800678:	00 00 00 
  80067b:	41 ff d0             	callq  *%r8
  80067e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  800685:	00 00 00 
  800688:	48 8b 00             	mov    (%rax),%rax
  80068b:	8b 00                	mov    (%rax),%eax
  80068d:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  800694:	00 00 00 
  800697:	48 8b 12             	mov    (%rdx),%rdx
  80069a:	48 8d 4a 04          	lea    0x4(%rdx),%rcx
  80069e:	89 c2                	mov    %eax,%edx
  8006a0:	48 89 ce             	mov    %rcx,%rsi
  8006a3:	48 bf 27 56 80 00 00 	movabs $0x805627,%rdi
  8006aa:	00 00 00 
  8006ad:	48 b8 c2 02 80 00 00 	movabs $0x8002c2,%rax
  8006b4:	00 00 00 
  8006b7:	ff d0                	callq  *%rax
  8006b9:	48 bf 2f 56 80 00 00 	movabs $0x80562f,%rdi
  8006c0:	00 00 00 
  8006c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8006c8:	48 ba 3b 0d 80 00 00 	movabs $0x800d3b,%rdx
  8006cf:	00 00 00 
  8006d2:	ff d2                	callq  *%rdx
  8006d4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8006d8:	74 1b                	je     8006f5 <umain+0x2a7>
  8006da:	48 bf 31 56 80 00 00 	movabs $0x805631,%rdi
  8006e1:	00 00 00 
  8006e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8006e9:	48 ba 3b 0d 80 00 00 	movabs $0x800d3b,%rdx
  8006f0:	00 00 00 
  8006f3:	ff d2                	callq  *%rdx
  8006f5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8006fc:	e9 a4 fe ff ff       	jmpq   8005a5 <umain+0x157>
  800701:	c9                   	leaveq 
  800702:	c3                   	retq   

0000000000800703 <timer>:
  800703:	55                   	push   %rbp
  800704:	48 89 e5             	mov    %rsp,%rbp
  800707:	48 83 ec 20          	sub    $0x20,%rsp
  80070b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80070e:	89 75 e8             	mov    %esi,-0x18(%rbp)
  800711:	48 b8 7b 24 80 00 00 	movabs $0x80247b,%rax
  800718:	00 00 00 
  80071b:	ff d0                	callq  *%rax
  80071d:	89 c2                	mov    %eax,%edx
  80071f:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800722:	01 d0                	add    %edx,%eax
  800724:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800727:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80072e:	00 00 00 
  800731:	48 b9 50 56 80 00 00 	movabs $0x805650,%rcx
  800738:	00 00 00 
  80073b:	48 89 08             	mov    %rcx,(%rax)
  80073e:	eb 0c                	jmp    80074c <timer+0x49>
  800740:	48 b8 be 21 80 00 00 	movabs $0x8021be,%rax
  800747:	00 00 00 
  80074a:	ff d0                	callq  *%rax
  80074c:	48 b8 7b 24 80 00 00 	movabs $0x80247b,%rax
  800753:	00 00 00 
  800756:	ff d0                	callq  *%rax
  800758:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80075b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80075e:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  800761:	73 06                	jae    800769 <timer+0x66>
  800763:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800767:	79 d7                	jns    800740 <timer+0x3d>
  800769:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80076d:	79 30                	jns    80079f <timer+0x9c>
  80076f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800772:	89 c1                	mov    %eax,%ecx
  800774:	48 ba 59 56 80 00 00 	movabs $0x805659,%rdx
  80077b:	00 00 00 
  80077e:	be 10 00 00 00       	mov    $0x10,%esi
  800783:	48 bf 6b 56 80 00 00 	movabs $0x80566b,%rdi
  80078a:	00 00 00 
  80078d:	b8 00 00 00 00       	mov    $0x0,%eax
  800792:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  800799:	00 00 00 
  80079c:	41 ff d0             	callq  *%r8
  80079f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8007a2:	b9 00 00 00 00       	mov    $0x0,%ecx
  8007a7:	ba 00 00 00 00       	mov    $0x0,%edx
  8007ac:	be 0c 00 00 00       	mov    $0xc,%esi
  8007b1:	89 c7                	mov    %eax,%edi
  8007b3:	48 b8 d0 2c 80 00 00 	movabs $0x802cd0,%rax
  8007ba:	00 00 00 
  8007bd:	ff d0                	callq  *%rax
  8007bf:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8007c3:	ba 00 00 00 00       	mov    $0x0,%edx
  8007c8:	be 00 00 00 00       	mov    $0x0,%esi
  8007cd:	48 89 c7             	mov    %rax,%rdi
  8007d0:	48 b8 0f 2c 80 00 00 	movabs $0x802c0f,%rax
  8007d7:	00 00 00 
  8007da:	ff d0                	callq  *%rax
  8007dc:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8007df:	8b 55 f0             	mov    -0x10(%rbp),%edx
  8007e2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8007e5:	39 c2                	cmp    %eax,%edx
  8007e7:	74 22                	je     80080b <timer+0x108>
  8007e9:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8007ec:	89 c6                	mov    %eax,%esi
  8007ee:	48 bf 80 56 80 00 00 	movabs $0x805680,%rdi
  8007f5:	00 00 00 
  8007f8:	b8 00 00 00 00       	mov    $0x0,%eax
  8007fd:	48 ba 3b 0d 80 00 00 	movabs $0x800d3b,%rdx
  800804:	00 00 00 
  800807:	ff d2                	callq  *%rdx
  800809:	eb b4                	jmp    8007bf <timer+0xbc>
  80080b:	48 b8 7b 24 80 00 00 	movabs $0x80247b,%rax
  800812:	00 00 00 
  800815:	ff d0                	callq  *%rax
  800817:	89 c2                	mov    %eax,%edx
  800819:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80081c:	01 d0                	add    %edx,%eax
  80081e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800821:	e9 18 ff ff ff       	jmpq   80073e <timer+0x3b>

0000000000800826 <input>:
  800826:	55                   	push   %rbp
  800827:	48 89 e5             	mov    %rsp,%rbp
  80082a:	48 83 ec 20          	sub    $0x20,%rsp
  80082e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800831:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800838:	00 00 00 
  80083b:	48 b9 bb 56 80 00 00 	movabs $0x8056bb,%rcx
  800842:	00 00 00 
  800845:	48 89 08             	mov    %rcx,(%rax)
  800848:	ba 07 00 00 00       	mov    $0x7,%edx
  80084d:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  800854:	00 00 00 
  800857:	bf 00 00 00 00       	mov    $0x0,%edi
  80085c:	48 b8 fb 21 80 00 00 	movabs $0x8021fb,%rax
  800863:	00 00 00 
  800866:	ff d0                	callq  *%rax
  800868:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80086b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80086f:	79 30                	jns    8008a1 <input+0x7b>
  800871:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800874:	89 c1                	mov    %eax,%ecx
  800876:	48 ba c4 56 80 00 00 	movabs $0x8056c4,%rdx
  80087d:	00 00 00 
  800880:	be 0e 00 00 00       	mov    $0xe,%esi
  800885:	48 bf d7 56 80 00 00 	movabs $0x8056d7,%rdi
  80088c:	00 00 00 
  80088f:	b8 00 00 00 00       	mov    $0x0,%eax
  800894:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  80089b:	00 00 00 
  80089e:	41 ff d0             	callq  *%r8
  8008a1:	be ee 05 00 00       	mov    $0x5ee,%esi
  8008a6:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  8008ad:	00 00 00 
  8008b0:	48 b8 01 25 80 00 00 	movabs $0x802501,%rax
  8008b7:	00 00 00 
  8008ba:	ff d0                	callq  *%rax
  8008bc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8008bf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8008c3:	75 11                	jne    8008d6 <input+0xb0>
  8008c5:	48 b8 be 21 80 00 00 	movabs $0x8021be,%rax
  8008cc:	00 00 00 
  8008cf:	ff d0                	callq  *%rax
  8008d1:	e9 72 ff ff ff       	jmpq   800848 <input+0x22>
  8008d6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8008da:	79 25                	jns    800901 <input+0xdb>
  8008dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8008df:	89 c6                	mov    %eax,%esi
  8008e1:	48 bf e6 56 80 00 00 	movabs $0x8056e6,%rdi
  8008e8:	00 00 00 
  8008eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8008f0:	48 ba 3b 0d 80 00 00 	movabs $0x800d3b,%rdx
  8008f7:	00 00 00 
  8008fa:	ff d2                	callq  *%rdx
  8008fc:	e9 47 ff ff ff       	jmpq   800848 <input+0x22>
  800901:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800905:	0f 8e 3d ff ff ff    	jle    800848 <input+0x22>
  80090b:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  800912:	00 00 00 
  800915:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800918:	89 10                	mov    %edx,(%rax)
  80091a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80091d:	b9 05 00 00 00       	mov    $0x5,%ecx
  800922:	48 ba 00 c0 80 00 00 	movabs $0x80c000,%rdx
  800929:	00 00 00 
  80092c:	be 0a 00 00 00       	mov    $0xa,%esi
  800931:	89 c7                	mov    %eax,%edi
  800933:	48 b8 d0 2c 80 00 00 	movabs $0x802cd0,%rax
  80093a:	00 00 00 
  80093d:	ff d0                	callq  *%rax
  80093f:	e9 04 ff ff ff       	jmpq   800848 <input+0x22>

0000000000800944 <output>:
  800944:	55                   	push   %rbp
  800945:	48 89 e5             	mov    %rsp,%rbp
  800948:	48 83 ec 20          	sub    $0x20,%rsp
  80094c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80094f:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800956:	00 00 00 
  800959:	48 b9 08 57 80 00 00 	movabs $0x805708,%rcx
  800960:	00 00 00 
  800963:	48 89 08             	mov    %rcx,(%rax)
  800966:	48 8d 45 f4          	lea    -0xc(%rbp),%rax
  80096a:	ba 00 00 00 00       	mov    $0x0,%edx
  80096f:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  800976:	00 00 00 
  800979:	48 89 c7             	mov    %rax,%rdi
  80097c:	48 b8 0f 2c 80 00 00 	movabs $0x802c0f,%rax
  800983:	00 00 00 
  800986:	ff d0                	callq  *%rax
  800988:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80098b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80098e:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  800991:	74 35                	je     8009c8 <output+0x84>
  800993:	48 b9 12 57 80 00 00 	movabs $0x805712,%rcx
  80099a:	00 00 00 
  80099d:	48 ba 23 57 80 00 00 	movabs $0x805723,%rdx
  8009a4:	00 00 00 
  8009a7:	be 11 00 00 00       	mov    $0x11,%esi
  8009ac:	48 bf 38 57 80 00 00 	movabs $0x805738,%rdi
  8009b3:	00 00 00 
  8009b6:	b8 00 00 00 00       	mov    $0x0,%eax
  8009bb:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  8009c2:	00 00 00 
  8009c5:	41 ff d0             	callq  *%r8
  8009c8:	83 7d fc 0b          	cmpl   $0xb,-0x4(%rbp)
  8009cc:	74 35                	je     800a03 <output+0xbf>
  8009ce:	48 b9 48 57 80 00 00 	movabs $0x805748,%rcx
  8009d5:	00 00 00 
  8009d8:	48 ba 23 57 80 00 00 	movabs $0x805723,%rdx
  8009df:	00 00 00 
  8009e2:	be 12 00 00 00       	mov    $0x12,%esi
  8009e7:	48 bf 38 57 80 00 00 	movabs $0x805738,%rdi
  8009ee:	00 00 00 
  8009f1:	b8 00 00 00 00       	mov    $0x0,%eax
  8009f6:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  8009fd:	00 00 00 
  800a00:	41 ff d0             	callq  *%r8
  800a03:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  800a0a:	00 00 00 
  800a0d:	8b 00                	mov    (%rax),%eax
  800a0f:	89 c6                	mov    %eax,%esi
  800a11:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  800a18:	00 00 00 
  800a1b:	48 b8 b7 24 80 00 00 	movabs $0x8024b7,%rax
  800a22:	00 00 00 
  800a25:	ff d0                	callq  *%rax
  800a27:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800a2a:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800a2e:	0f 89 32 ff ff ff    	jns    800966 <output+0x22>
  800a34:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800a37:	89 c6                	mov    %eax,%esi
  800a39:	48 bf 60 57 80 00 00 	movabs $0x805760,%rdi
  800a40:	00 00 00 
  800a43:	b8 00 00 00 00       	mov    $0x0,%eax
  800a48:	48 ba 3b 0d 80 00 00 	movabs $0x800d3b,%rdx
  800a4f:	00 00 00 
  800a52:	ff d2                	callq  *%rdx
  800a54:	e9 0d ff ff ff       	jmpq   800966 <output+0x22>

0000000000800a59 <libmain>:
  800a59:	55                   	push   %rbp
  800a5a:	48 89 e5             	mov    %rsp,%rbp
  800a5d:	48 83 ec 10          	sub    $0x10,%rsp
  800a61:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800a64:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800a68:	48 b8 82 21 80 00 00 	movabs $0x802182,%rax
  800a6f:	00 00 00 
  800a72:	ff d0                	callq  *%rax
  800a74:	25 ff 03 00 00       	and    $0x3ff,%eax
  800a79:	48 98                	cltq   
  800a7b:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800a82:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800a89:	00 00 00 
  800a8c:	48 01 c2             	add    %rax,%rdx
  800a8f:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  800a96:	00 00 00 
  800a99:	48 89 10             	mov    %rdx,(%rax)
  800a9c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800aa0:	7e 14                	jle    800ab6 <libmain+0x5d>
  800aa2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800aa6:	48 8b 10             	mov    (%rax),%rdx
  800aa9:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800ab0:	00 00 00 
  800ab3:	48 89 10             	mov    %rdx,(%rax)
  800ab6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800aba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800abd:	48 89 d6             	mov    %rdx,%rsi
  800ac0:	89 c7                	mov    %eax,%edi
  800ac2:	48 b8 4e 04 80 00 00 	movabs $0x80044e,%rax
  800ac9:	00 00 00 
  800acc:	ff d0                	callq  *%rax
  800ace:	48 b8 dd 0a 80 00 00 	movabs $0x800add,%rax
  800ad5:	00 00 00 
  800ad8:	ff d0                	callq  *%rax
  800ada:	90                   	nop
  800adb:	c9                   	leaveq 
  800adc:	c3                   	retq   

0000000000800add <exit>:
  800add:	55                   	push   %rbp
  800ade:	48 89 e5             	mov    %rsp,%rbp
  800ae1:	48 b8 8e 31 80 00 00 	movabs $0x80318e,%rax
  800ae8:	00 00 00 
  800aeb:	ff d0                	callq  *%rax
  800aed:	bf 00 00 00 00       	mov    $0x0,%edi
  800af2:	48 b8 3c 21 80 00 00 	movabs $0x80213c,%rax
  800af9:	00 00 00 
  800afc:	ff d0                	callq  *%rax
  800afe:	90                   	nop
  800aff:	5d                   	pop    %rbp
  800b00:	c3                   	retq   

0000000000800b01 <_panic>:
  800b01:	55                   	push   %rbp
  800b02:	48 89 e5             	mov    %rsp,%rbp
  800b05:	53                   	push   %rbx
  800b06:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800b0d:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800b14:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800b1a:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800b21:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800b28:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800b2f:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800b36:	84 c0                	test   %al,%al
  800b38:	74 23                	je     800b5d <_panic+0x5c>
  800b3a:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800b41:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800b45:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800b49:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800b4d:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800b51:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800b55:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800b59:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800b5d:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800b64:	00 00 00 
  800b67:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800b6e:	00 00 00 
  800b71:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800b75:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800b7c:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800b83:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800b8a:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800b91:	00 00 00 
  800b94:	48 8b 18             	mov    (%rax),%rbx
  800b97:	48 b8 82 21 80 00 00 	movabs $0x802182,%rax
  800b9e:	00 00 00 
  800ba1:	ff d0                	callq  *%rax
  800ba3:	89 c6                	mov    %eax,%esi
  800ba5:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  800bab:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  800bb2:	41 89 d0             	mov    %edx,%r8d
  800bb5:	48 89 c1             	mov    %rax,%rcx
  800bb8:	48 89 da             	mov    %rbx,%rdx
  800bbb:	48 bf 90 57 80 00 00 	movabs $0x805790,%rdi
  800bc2:	00 00 00 
  800bc5:	b8 00 00 00 00       	mov    $0x0,%eax
  800bca:	49 b9 3b 0d 80 00 00 	movabs $0x800d3b,%r9
  800bd1:	00 00 00 
  800bd4:	41 ff d1             	callq  *%r9
  800bd7:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800bde:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800be5:	48 89 d6             	mov    %rdx,%rsi
  800be8:	48 89 c7             	mov    %rax,%rdi
  800beb:	48 b8 8f 0c 80 00 00 	movabs $0x800c8f,%rax
  800bf2:	00 00 00 
  800bf5:	ff d0                	callq  *%rax
  800bf7:	48 bf b3 57 80 00 00 	movabs $0x8057b3,%rdi
  800bfe:	00 00 00 
  800c01:	b8 00 00 00 00       	mov    $0x0,%eax
  800c06:	48 ba 3b 0d 80 00 00 	movabs $0x800d3b,%rdx
  800c0d:	00 00 00 
  800c10:	ff d2                	callq  *%rdx
  800c12:	cc                   	int3   
  800c13:	eb fd                	jmp    800c12 <_panic+0x111>

0000000000800c15 <putch>:
  800c15:	55                   	push   %rbp
  800c16:	48 89 e5             	mov    %rsp,%rbp
  800c19:	48 83 ec 10          	sub    $0x10,%rsp
  800c1d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800c20:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800c24:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c28:	8b 00                	mov    (%rax),%eax
  800c2a:	8d 48 01             	lea    0x1(%rax),%ecx
  800c2d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800c31:	89 0a                	mov    %ecx,(%rdx)
  800c33:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800c36:	89 d1                	mov    %edx,%ecx
  800c38:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800c3c:	48 98                	cltq   
  800c3e:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800c42:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c46:	8b 00                	mov    (%rax),%eax
  800c48:	3d ff 00 00 00       	cmp    $0xff,%eax
  800c4d:	75 2c                	jne    800c7b <putch+0x66>
  800c4f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c53:	8b 00                	mov    (%rax),%eax
  800c55:	48 98                	cltq   
  800c57:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800c5b:	48 83 c2 08          	add    $0x8,%rdx
  800c5f:	48 89 c6             	mov    %rax,%rsi
  800c62:	48 89 d7             	mov    %rdx,%rdi
  800c65:	48 b8 b3 20 80 00 00 	movabs $0x8020b3,%rax
  800c6c:	00 00 00 
  800c6f:	ff d0                	callq  *%rax
  800c71:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c75:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800c7b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c7f:	8b 40 04             	mov    0x4(%rax),%eax
  800c82:	8d 50 01             	lea    0x1(%rax),%edx
  800c85:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800c89:	89 50 04             	mov    %edx,0x4(%rax)
  800c8c:	90                   	nop
  800c8d:	c9                   	leaveq 
  800c8e:	c3                   	retq   

0000000000800c8f <vcprintf>:
  800c8f:	55                   	push   %rbp
  800c90:	48 89 e5             	mov    %rsp,%rbp
  800c93:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800c9a:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800ca1:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800ca8:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800caf:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800cb6:	48 8b 0a             	mov    (%rdx),%rcx
  800cb9:	48 89 08             	mov    %rcx,(%rax)
  800cbc:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800cc0:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800cc4:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800cc8:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800ccc:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800cd3:	00 00 00 
  800cd6:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800cdd:	00 00 00 
  800ce0:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800ce7:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800cee:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800cf5:	48 89 c6             	mov    %rax,%rsi
  800cf8:	48 bf 15 0c 80 00 00 	movabs $0x800c15,%rdi
  800cff:	00 00 00 
  800d02:	48 b8 d9 10 80 00 00 	movabs $0x8010d9,%rax
  800d09:	00 00 00 
  800d0c:	ff d0                	callq  *%rax
  800d0e:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800d14:	48 98                	cltq   
  800d16:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800d1d:	48 83 c2 08          	add    $0x8,%rdx
  800d21:	48 89 c6             	mov    %rax,%rsi
  800d24:	48 89 d7             	mov    %rdx,%rdi
  800d27:	48 b8 b3 20 80 00 00 	movabs $0x8020b3,%rax
  800d2e:	00 00 00 
  800d31:	ff d0                	callq  *%rax
  800d33:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800d39:	c9                   	leaveq 
  800d3a:	c3                   	retq   

0000000000800d3b <cprintf>:
  800d3b:	55                   	push   %rbp
  800d3c:	48 89 e5             	mov    %rsp,%rbp
  800d3f:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800d46:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800d4d:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800d54:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800d5b:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800d62:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800d69:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800d70:	84 c0                	test   %al,%al
  800d72:	74 20                	je     800d94 <cprintf+0x59>
  800d74:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800d78:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800d7c:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800d80:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800d84:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800d88:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800d8c:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800d90:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800d94:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800d9b:	00 00 00 
  800d9e:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800da5:	00 00 00 
  800da8:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800dac:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800db3:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800dba:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800dc1:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800dc8:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800dcf:	48 8b 0a             	mov    (%rdx),%rcx
  800dd2:	48 89 08             	mov    %rcx,(%rax)
  800dd5:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800dd9:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ddd:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800de1:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800de5:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800dec:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800df3:	48 89 d6             	mov    %rdx,%rsi
  800df6:	48 89 c7             	mov    %rax,%rdi
  800df9:	48 b8 8f 0c 80 00 00 	movabs $0x800c8f,%rax
  800e00:	00 00 00 
  800e03:	ff d0                	callq  *%rax
  800e05:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800e0b:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800e11:	c9                   	leaveq 
  800e12:	c3                   	retq   

0000000000800e13 <printnum>:
  800e13:	55                   	push   %rbp
  800e14:	48 89 e5             	mov    %rsp,%rbp
  800e17:	48 83 ec 30          	sub    $0x30,%rsp
  800e1b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800e1f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800e23:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800e27:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  800e2a:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  800e2e:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  800e32:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800e35:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  800e39:	77 54                	ja     800e8f <printnum+0x7c>
  800e3b:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800e3e:	8d 78 ff             	lea    -0x1(%rax),%edi
  800e41:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800e44:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e48:	ba 00 00 00 00       	mov    $0x0,%edx
  800e4d:	48 f7 f6             	div    %rsi
  800e50:	49 89 c2             	mov    %rax,%r10
  800e53:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800e56:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  800e59:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  800e5d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800e61:	41 89 c9             	mov    %ecx,%r9d
  800e64:	41 89 f8             	mov    %edi,%r8d
  800e67:	89 d1                	mov    %edx,%ecx
  800e69:	4c 89 d2             	mov    %r10,%rdx
  800e6c:	48 89 c7             	mov    %rax,%rdi
  800e6f:	48 b8 13 0e 80 00 00 	movabs $0x800e13,%rax
  800e76:	00 00 00 
  800e79:	ff d0                	callq  *%rax
  800e7b:	eb 1c                	jmp    800e99 <printnum+0x86>
  800e7d:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800e81:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800e84:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800e88:	48 89 ce             	mov    %rcx,%rsi
  800e8b:	89 d7                	mov    %edx,%edi
  800e8d:	ff d0                	callq  *%rax
  800e8f:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  800e93:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  800e97:	7f e4                	jg     800e7d <printnum+0x6a>
  800e99:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800e9c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ea0:	ba 00 00 00 00       	mov    $0x0,%edx
  800ea5:	48 f7 f1             	div    %rcx
  800ea8:	48 b8 b0 59 80 00 00 	movabs $0x8059b0,%rax
  800eaf:	00 00 00 
  800eb2:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  800eb6:	0f be d0             	movsbl %al,%edx
  800eb9:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800ebd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800ec1:	48 89 ce             	mov    %rcx,%rsi
  800ec4:	89 d7                	mov    %edx,%edi
  800ec6:	ff d0                	callq  *%rax
  800ec8:	90                   	nop
  800ec9:	c9                   	leaveq 
  800eca:	c3                   	retq   

0000000000800ecb <getuint>:
  800ecb:	55                   	push   %rbp
  800ecc:	48 89 e5             	mov    %rsp,%rbp
  800ecf:	48 83 ec 20          	sub    $0x20,%rsp
  800ed3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800ed7:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800eda:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800ede:	7e 4f                	jle    800f2f <getuint+0x64>
  800ee0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ee4:	8b 00                	mov    (%rax),%eax
  800ee6:	83 f8 30             	cmp    $0x30,%eax
  800ee9:	73 24                	jae    800f0f <getuint+0x44>
  800eeb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800eef:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800ef3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ef7:	8b 00                	mov    (%rax),%eax
  800ef9:	89 c0                	mov    %eax,%eax
  800efb:	48 01 d0             	add    %rdx,%rax
  800efe:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f02:	8b 12                	mov    (%rdx),%edx
  800f04:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800f07:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f0b:	89 0a                	mov    %ecx,(%rdx)
  800f0d:	eb 14                	jmp    800f23 <getuint+0x58>
  800f0f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f13:	48 8b 40 08          	mov    0x8(%rax),%rax
  800f17:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800f1b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f1f:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800f23:	48 8b 00             	mov    (%rax),%rax
  800f26:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800f2a:	e9 9d 00 00 00       	jmpq   800fcc <getuint+0x101>
  800f2f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800f33:	74 4c                	je     800f81 <getuint+0xb6>
  800f35:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f39:	8b 00                	mov    (%rax),%eax
  800f3b:	83 f8 30             	cmp    $0x30,%eax
  800f3e:	73 24                	jae    800f64 <getuint+0x99>
  800f40:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f44:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800f48:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f4c:	8b 00                	mov    (%rax),%eax
  800f4e:	89 c0                	mov    %eax,%eax
  800f50:	48 01 d0             	add    %rdx,%rax
  800f53:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f57:	8b 12                	mov    (%rdx),%edx
  800f59:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800f5c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f60:	89 0a                	mov    %ecx,(%rdx)
  800f62:	eb 14                	jmp    800f78 <getuint+0xad>
  800f64:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f68:	48 8b 40 08          	mov    0x8(%rax),%rax
  800f6c:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800f70:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f74:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800f78:	48 8b 00             	mov    (%rax),%rax
  800f7b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800f7f:	eb 4b                	jmp    800fcc <getuint+0x101>
  800f81:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f85:	8b 00                	mov    (%rax),%eax
  800f87:	83 f8 30             	cmp    $0x30,%eax
  800f8a:	73 24                	jae    800fb0 <getuint+0xe5>
  800f8c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f90:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800f94:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f98:	8b 00                	mov    (%rax),%eax
  800f9a:	89 c0                	mov    %eax,%eax
  800f9c:	48 01 d0             	add    %rdx,%rax
  800f9f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800fa3:	8b 12                	mov    (%rdx),%edx
  800fa5:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800fa8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800fac:	89 0a                	mov    %ecx,(%rdx)
  800fae:	eb 14                	jmp    800fc4 <getuint+0xf9>
  800fb0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fb4:	48 8b 40 08          	mov    0x8(%rax),%rax
  800fb8:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800fbc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800fc0:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800fc4:	8b 00                	mov    (%rax),%eax
  800fc6:	89 c0                	mov    %eax,%eax
  800fc8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800fcc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800fd0:	c9                   	leaveq 
  800fd1:	c3                   	retq   

0000000000800fd2 <getint>:
  800fd2:	55                   	push   %rbp
  800fd3:	48 89 e5             	mov    %rsp,%rbp
  800fd6:	48 83 ec 20          	sub    $0x20,%rsp
  800fda:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fde:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800fe1:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800fe5:	7e 4f                	jle    801036 <getint+0x64>
  800fe7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800feb:	8b 00                	mov    (%rax),%eax
  800fed:	83 f8 30             	cmp    $0x30,%eax
  800ff0:	73 24                	jae    801016 <getint+0x44>
  800ff2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ff6:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800ffa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ffe:	8b 00                	mov    (%rax),%eax
  801000:	89 c0                	mov    %eax,%eax
  801002:	48 01 d0             	add    %rdx,%rax
  801005:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801009:	8b 12                	mov    (%rdx),%edx
  80100b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80100e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801012:	89 0a                	mov    %ecx,(%rdx)
  801014:	eb 14                	jmp    80102a <getint+0x58>
  801016:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80101a:	48 8b 40 08          	mov    0x8(%rax),%rax
  80101e:	48 8d 48 08          	lea    0x8(%rax),%rcx
  801022:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801026:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80102a:	48 8b 00             	mov    (%rax),%rax
  80102d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801031:	e9 9d 00 00 00       	jmpq   8010d3 <getint+0x101>
  801036:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80103a:	74 4c                	je     801088 <getint+0xb6>
  80103c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801040:	8b 00                	mov    (%rax),%eax
  801042:	83 f8 30             	cmp    $0x30,%eax
  801045:	73 24                	jae    80106b <getint+0x99>
  801047:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80104b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80104f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801053:	8b 00                	mov    (%rax),%eax
  801055:	89 c0                	mov    %eax,%eax
  801057:	48 01 d0             	add    %rdx,%rax
  80105a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80105e:	8b 12                	mov    (%rdx),%edx
  801060:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801063:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801067:	89 0a                	mov    %ecx,(%rdx)
  801069:	eb 14                	jmp    80107f <getint+0xad>
  80106b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80106f:	48 8b 40 08          	mov    0x8(%rax),%rax
  801073:	48 8d 48 08          	lea    0x8(%rax),%rcx
  801077:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80107b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80107f:	48 8b 00             	mov    (%rax),%rax
  801082:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801086:	eb 4b                	jmp    8010d3 <getint+0x101>
  801088:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80108c:	8b 00                	mov    (%rax),%eax
  80108e:	83 f8 30             	cmp    $0x30,%eax
  801091:	73 24                	jae    8010b7 <getint+0xe5>
  801093:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801097:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80109b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80109f:	8b 00                	mov    (%rax),%eax
  8010a1:	89 c0                	mov    %eax,%eax
  8010a3:	48 01 d0             	add    %rdx,%rax
  8010a6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010aa:	8b 12                	mov    (%rdx),%edx
  8010ac:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8010af:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010b3:	89 0a                	mov    %ecx,(%rdx)
  8010b5:	eb 14                	jmp    8010cb <getint+0xf9>
  8010b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010bb:	48 8b 40 08          	mov    0x8(%rax),%rax
  8010bf:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8010c3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010c7:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8010cb:	8b 00                	mov    (%rax),%eax
  8010cd:	48 98                	cltq   
  8010cf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8010d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010d7:	c9                   	leaveq 
  8010d8:	c3                   	retq   

00000000008010d9 <vprintfmt>:
  8010d9:	55                   	push   %rbp
  8010da:	48 89 e5             	mov    %rsp,%rbp
  8010dd:	41 54                	push   %r12
  8010df:	53                   	push   %rbx
  8010e0:	48 83 ec 60          	sub    $0x60,%rsp
  8010e4:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8010e8:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8010ec:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8010f0:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8010f4:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8010f8:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8010fc:	48 8b 0a             	mov    (%rdx),%rcx
  8010ff:	48 89 08             	mov    %rcx,(%rax)
  801102:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801106:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80110a:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80110e:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801112:	eb 17                	jmp    80112b <vprintfmt+0x52>
  801114:	85 db                	test   %ebx,%ebx
  801116:	0f 84 b9 04 00 00    	je     8015d5 <vprintfmt+0x4fc>
  80111c:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801120:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801124:	48 89 d6             	mov    %rdx,%rsi
  801127:	89 df                	mov    %ebx,%edi
  801129:	ff d0                	callq  *%rax
  80112b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80112f:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801133:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  801137:	0f b6 00             	movzbl (%rax),%eax
  80113a:	0f b6 d8             	movzbl %al,%ebx
  80113d:	83 fb 25             	cmp    $0x25,%ebx
  801140:	75 d2                	jne    801114 <vprintfmt+0x3b>
  801142:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  801146:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  80114d:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  801154:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80115b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  801162:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801166:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80116a:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80116e:	0f b6 00             	movzbl (%rax),%eax
  801171:	0f b6 d8             	movzbl %al,%ebx
  801174:	8d 43 dd             	lea    -0x23(%rbx),%eax
  801177:	83 f8 55             	cmp    $0x55,%eax
  80117a:	0f 87 22 04 00 00    	ja     8015a2 <vprintfmt+0x4c9>
  801180:	89 c0                	mov    %eax,%eax
  801182:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  801189:	00 
  80118a:	48 b8 d8 59 80 00 00 	movabs $0x8059d8,%rax
  801191:	00 00 00 
  801194:	48 01 d0             	add    %rdx,%rax
  801197:	48 8b 00             	mov    (%rax),%rax
  80119a:	ff e0                	jmpq   *%rax
  80119c:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8011a0:	eb c0                	jmp    801162 <vprintfmt+0x89>
  8011a2:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8011a6:	eb ba                	jmp    801162 <vprintfmt+0x89>
  8011a8:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8011af:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8011b2:	89 d0                	mov    %edx,%eax
  8011b4:	c1 e0 02             	shl    $0x2,%eax
  8011b7:	01 d0                	add    %edx,%eax
  8011b9:	01 c0                	add    %eax,%eax
  8011bb:	01 d8                	add    %ebx,%eax
  8011bd:	83 e8 30             	sub    $0x30,%eax
  8011c0:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8011c3:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8011c7:	0f b6 00             	movzbl (%rax),%eax
  8011ca:	0f be d8             	movsbl %al,%ebx
  8011cd:	83 fb 2f             	cmp    $0x2f,%ebx
  8011d0:	7e 60                	jle    801232 <vprintfmt+0x159>
  8011d2:	83 fb 39             	cmp    $0x39,%ebx
  8011d5:	7f 5b                	jg     801232 <vprintfmt+0x159>
  8011d7:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8011dc:	eb d1                	jmp    8011af <vprintfmt+0xd6>
  8011de:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8011e1:	83 f8 30             	cmp    $0x30,%eax
  8011e4:	73 17                	jae    8011fd <vprintfmt+0x124>
  8011e6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8011ea:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8011ed:	89 d2                	mov    %edx,%edx
  8011ef:	48 01 d0             	add    %rdx,%rax
  8011f2:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8011f5:	83 c2 08             	add    $0x8,%edx
  8011f8:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8011fb:	eb 0c                	jmp    801209 <vprintfmt+0x130>
  8011fd:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801201:	48 8d 50 08          	lea    0x8(%rax),%rdx
  801205:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801209:	8b 00                	mov    (%rax),%eax
  80120b:	89 45 d8             	mov    %eax,-0x28(%rbp)
  80120e:	eb 23                	jmp    801233 <vprintfmt+0x15a>
  801210:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801214:	0f 89 48 ff ff ff    	jns    801162 <vprintfmt+0x89>
  80121a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  801221:	e9 3c ff ff ff       	jmpq   801162 <vprintfmt+0x89>
  801226:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  80122d:	e9 30 ff ff ff       	jmpq   801162 <vprintfmt+0x89>
  801232:	90                   	nop
  801233:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801237:	0f 89 25 ff ff ff    	jns    801162 <vprintfmt+0x89>
  80123d:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801240:	89 45 dc             	mov    %eax,-0x24(%rbp)
  801243:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80124a:	e9 13 ff ff ff       	jmpq   801162 <vprintfmt+0x89>
  80124f:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  801253:	e9 0a ff ff ff       	jmpq   801162 <vprintfmt+0x89>
  801258:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80125b:	83 f8 30             	cmp    $0x30,%eax
  80125e:	73 17                	jae    801277 <vprintfmt+0x19e>
  801260:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801264:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801267:	89 d2                	mov    %edx,%edx
  801269:	48 01 d0             	add    %rdx,%rax
  80126c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80126f:	83 c2 08             	add    $0x8,%edx
  801272:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801275:	eb 0c                	jmp    801283 <vprintfmt+0x1aa>
  801277:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80127b:	48 8d 50 08          	lea    0x8(%rax),%rdx
  80127f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801283:	8b 10                	mov    (%rax),%edx
  801285:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  801289:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80128d:	48 89 ce             	mov    %rcx,%rsi
  801290:	89 d7                	mov    %edx,%edi
  801292:	ff d0                	callq  *%rax
  801294:	e9 37 03 00 00       	jmpq   8015d0 <vprintfmt+0x4f7>
  801299:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80129c:	83 f8 30             	cmp    $0x30,%eax
  80129f:	73 17                	jae    8012b8 <vprintfmt+0x1df>
  8012a1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8012a5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8012a8:	89 d2                	mov    %edx,%edx
  8012aa:	48 01 d0             	add    %rdx,%rax
  8012ad:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8012b0:	83 c2 08             	add    $0x8,%edx
  8012b3:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8012b6:	eb 0c                	jmp    8012c4 <vprintfmt+0x1eb>
  8012b8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8012bc:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8012c0:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8012c4:	8b 18                	mov    (%rax),%ebx
  8012c6:	85 db                	test   %ebx,%ebx
  8012c8:	79 02                	jns    8012cc <vprintfmt+0x1f3>
  8012ca:	f7 db                	neg    %ebx
  8012cc:	83 fb 15             	cmp    $0x15,%ebx
  8012cf:	7f 16                	jg     8012e7 <vprintfmt+0x20e>
  8012d1:	48 b8 00 59 80 00 00 	movabs $0x805900,%rax
  8012d8:	00 00 00 
  8012db:	48 63 d3             	movslq %ebx,%rdx
  8012de:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  8012e2:	4d 85 e4             	test   %r12,%r12
  8012e5:	75 2e                	jne    801315 <vprintfmt+0x23c>
  8012e7:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8012eb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8012ef:	89 d9                	mov    %ebx,%ecx
  8012f1:	48 ba c1 59 80 00 00 	movabs $0x8059c1,%rdx
  8012f8:	00 00 00 
  8012fb:	48 89 c7             	mov    %rax,%rdi
  8012fe:	b8 00 00 00 00       	mov    $0x0,%eax
  801303:	49 b8 df 15 80 00 00 	movabs $0x8015df,%r8
  80130a:	00 00 00 
  80130d:	41 ff d0             	callq  *%r8
  801310:	e9 bb 02 00 00       	jmpq   8015d0 <vprintfmt+0x4f7>
  801315:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801319:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80131d:	4c 89 e1             	mov    %r12,%rcx
  801320:	48 ba ca 59 80 00 00 	movabs $0x8059ca,%rdx
  801327:	00 00 00 
  80132a:	48 89 c7             	mov    %rax,%rdi
  80132d:	b8 00 00 00 00       	mov    $0x0,%eax
  801332:	49 b8 df 15 80 00 00 	movabs $0x8015df,%r8
  801339:	00 00 00 
  80133c:	41 ff d0             	callq  *%r8
  80133f:	e9 8c 02 00 00       	jmpq   8015d0 <vprintfmt+0x4f7>
  801344:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801347:	83 f8 30             	cmp    $0x30,%eax
  80134a:	73 17                	jae    801363 <vprintfmt+0x28a>
  80134c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801350:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801353:	89 d2                	mov    %edx,%edx
  801355:	48 01 d0             	add    %rdx,%rax
  801358:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80135b:	83 c2 08             	add    $0x8,%edx
  80135e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801361:	eb 0c                	jmp    80136f <vprintfmt+0x296>
  801363:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801367:	48 8d 50 08          	lea    0x8(%rax),%rdx
  80136b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80136f:	4c 8b 20             	mov    (%rax),%r12
  801372:	4d 85 e4             	test   %r12,%r12
  801375:	75 0a                	jne    801381 <vprintfmt+0x2a8>
  801377:	49 bc cd 59 80 00 00 	movabs $0x8059cd,%r12
  80137e:	00 00 00 
  801381:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801385:	7e 78                	jle    8013ff <vprintfmt+0x326>
  801387:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  80138b:	74 72                	je     8013ff <vprintfmt+0x326>
  80138d:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801390:	48 98                	cltq   
  801392:	48 89 c6             	mov    %rax,%rsi
  801395:	4c 89 e7             	mov    %r12,%rdi
  801398:	48 b8 8d 18 80 00 00 	movabs $0x80188d,%rax
  80139f:	00 00 00 
  8013a2:	ff d0                	callq  *%rax
  8013a4:	29 45 dc             	sub    %eax,-0x24(%rbp)
  8013a7:	eb 17                	jmp    8013c0 <vprintfmt+0x2e7>
  8013a9:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  8013ad:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8013b1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8013b5:	48 89 ce             	mov    %rcx,%rsi
  8013b8:	89 d7                	mov    %edx,%edi
  8013ba:	ff d0                	callq  *%rax
  8013bc:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8013c0:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8013c4:	7f e3                	jg     8013a9 <vprintfmt+0x2d0>
  8013c6:	eb 37                	jmp    8013ff <vprintfmt+0x326>
  8013c8:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  8013cc:	74 1e                	je     8013ec <vprintfmt+0x313>
  8013ce:	83 fb 1f             	cmp    $0x1f,%ebx
  8013d1:	7e 05                	jle    8013d8 <vprintfmt+0x2ff>
  8013d3:	83 fb 7e             	cmp    $0x7e,%ebx
  8013d6:	7e 14                	jle    8013ec <vprintfmt+0x313>
  8013d8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8013dc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8013e0:	48 89 d6             	mov    %rdx,%rsi
  8013e3:	bf 3f 00 00 00       	mov    $0x3f,%edi
  8013e8:	ff d0                	callq  *%rax
  8013ea:	eb 0f                	jmp    8013fb <vprintfmt+0x322>
  8013ec:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8013f0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8013f4:	48 89 d6             	mov    %rdx,%rsi
  8013f7:	89 df                	mov    %ebx,%edi
  8013f9:	ff d0                	callq  *%rax
  8013fb:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8013ff:	4c 89 e0             	mov    %r12,%rax
  801402:	4c 8d 60 01          	lea    0x1(%rax),%r12
  801406:	0f b6 00             	movzbl (%rax),%eax
  801409:	0f be d8             	movsbl %al,%ebx
  80140c:	85 db                	test   %ebx,%ebx
  80140e:	74 28                	je     801438 <vprintfmt+0x35f>
  801410:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801414:	78 b2                	js     8013c8 <vprintfmt+0x2ef>
  801416:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  80141a:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  80141e:	79 a8                	jns    8013c8 <vprintfmt+0x2ef>
  801420:	eb 16                	jmp    801438 <vprintfmt+0x35f>
  801422:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801426:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80142a:	48 89 d6             	mov    %rdx,%rsi
  80142d:	bf 20 00 00 00       	mov    $0x20,%edi
  801432:	ff d0                	callq  *%rax
  801434:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801438:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80143c:	7f e4                	jg     801422 <vprintfmt+0x349>
  80143e:	e9 8d 01 00 00       	jmpq   8015d0 <vprintfmt+0x4f7>
  801443:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801447:	be 03 00 00 00       	mov    $0x3,%esi
  80144c:	48 89 c7             	mov    %rax,%rdi
  80144f:	48 b8 d2 0f 80 00 00 	movabs $0x800fd2,%rax
  801456:	00 00 00 
  801459:	ff d0                	callq  *%rax
  80145b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80145f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801463:	48 85 c0             	test   %rax,%rax
  801466:	79 1d                	jns    801485 <vprintfmt+0x3ac>
  801468:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80146c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801470:	48 89 d6             	mov    %rdx,%rsi
  801473:	bf 2d 00 00 00       	mov    $0x2d,%edi
  801478:	ff d0                	callq  *%rax
  80147a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80147e:	48 f7 d8             	neg    %rax
  801481:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801485:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  80148c:	e9 d2 00 00 00       	jmpq   801563 <vprintfmt+0x48a>
  801491:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801495:	be 03 00 00 00       	mov    $0x3,%esi
  80149a:	48 89 c7             	mov    %rax,%rdi
  80149d:	48 b8 cb 0e 80 00 00 	movabs $0x800ecb,%rax
  8014a4:	00 00 00 
  8014a7:	ff d0                	callq  *%rax
  8014a9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8014ad:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8014b4:	e9 aa 00 00 00       	jmpq   801563 <vprintfmt+0x48a>
  8014b9:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8014bd:	be 03 00 00 00       	mov    $0x3,%esi
  8014c2:	48 89 c7             	mov    %rax,%rdi
  8014c5:	48 b8 cb 0e 80 00 00 	movabs $0x800ecb,%rax
  8014cc:	00 00 00 
  8014cf:	ff d0                	callq  *%rax
  8014d1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8014d5:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  8014dc:	e9 82 00 00 00       	jmpq   801563 <vprintfmt+0x48a>
  8014e1:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8014e5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8014e9:	48 89 d6             	mov    %rdx,%rsi
  8014ec:	bf 30 00 00 00       	mov    $0x30,%edi
  8014f1:	ff d0                	callq  *%rax
  8014f3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8014f7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8014fb:	48 89 d6             	mov    %rdx,%rsi
  8014fe:	bf 78 00 00 00       	mov    $0x78,%edi
  801503:	ff d0                	callq  *%rax
  801505:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801508:	83 f8 30             	cmp    $0x30,%eax
  80150b:	73 17                	jae    801524 <vprintfmt+0x44b>
  80150d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801511:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801514:	89 d2                	mov    %edx,%edx
  801516:	48 01 d0             	add    %rdx,%rax
  801519:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80151c:	83 c2 08             	add    $0x8,%edx
  80151f:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801522:	eb 0c                	jmp    801530 <vprintfmt+0x457>
  801524:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801528:	48 8d 50 08          	lea    0x8(%rax),%rdx
  80152c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801530:	48 8b 00             	mov    (%rax),%rax
  801533:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801537:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  80153e:	eb 23                	jmp    801563 <vprintfmt+0x48a>
  801540:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801544:	be 03 00 00 00       	mov    $0x3,%esi
  801549:	48 89 c7             	mov    %rax,%rdi
  80154c:	48 b8 cb 0e 80 00 00 	movabs $0x800ecb,%rax
  801553:	00 00 00 
  801556:	ff d0                	callq  *%rax
  801558:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80155c:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801563:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  801568:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80156b:	8b 7d dc             	mov    -0x24(%rbp),%edi
  80156e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801572:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801576:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80157a:	45 89 c1             	mov    %r8d,%r9d
  80157d:	41 89 f8             	mov    %edi,%r8d
  801580:	48 89 c7             	mov    %rax,%rdi
  801583:	48 b8 13 0e 80 00 00 	movabs $0x800e13,%rax
  80158a:	00 00 00 
  80158d:	ff d0                	callq  *%rax
  80158f:	eb 3f                	jmp    8015d0 <vprintfmt+0x4f7>
  801591:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801595:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801599:	48 89 d6             	mov    %rdx,%rsi
  80159c:	89 df                	mov    %ebx,%edi
  80159e:	ff d0                	callq  *%rax
  8015a0:	eb 2e                	jmp    8015d0 <vprintfmt+0x4f7>
  8015a2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8015a6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8015aa:	48 89 d6             	mov    %rdx,%rsi
  8015ad:	bf 25 00 00 00       	mov    $0x25,%edi
  8015b2:	ff d0                	callq  *%rax
  8015b4:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8015b9:	eb 05                	jmp    8015c0 <vprintfmt+0x4e7>
  8015bb:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8015c0:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8015c4:	48 83 e8 01          	sub    $0x1,%rax
  8015c8:	0f b6 00             	movzbl (%rax),%eax
  8015cb:	3c 25                	cmp    $0x25,%al
  8015cd:	75 ec                	jne    8015bb <vprintfmt+0x4e2>
  8015cf:	90                   	nop
  8015d0:	e9 3d fb ff ff       	jmpq   801112 <vprintfmt+0x39>
  8015d5:	90                   	nop
  8015d6:	48 83 c4 60          	add    $0x60,%rsp
  8015da:	5b                   	pop    %rbx
  8015db:	41 5c                	pop    %r12
  8015dd:	5d                   	pop    %rbp
  8015de:	c3                   	retq   

00000000008015df <printfmt>:
  8015df:	55                   	push   %rbp
  8015e0:	48 89 e5             	mov    %rsp,%rbp
  8015e3:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  8015ea:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  8015f1:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  8015f8:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  8015ff:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801606:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80160d:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801614:	84 c0                	test   %al,%al
  801616:	74 20                	je     801638 <printfmt+0x59>
  801618:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80161c:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801620:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801624:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801628:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80162c:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801630:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801634:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801638:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  80163f:	00 00 00 
  801642:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  801649:	00 00 00 
  80164c:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801650:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801657:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80165e:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  801665:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  80166c:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  801673:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  80167a:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  801681:	48 89 c7             	mov    %rax,%rdi
  801684:	48 b8 d9 10 80 00 00 	movabs $0x8010d9,%rax
  80168b:	00 00 00 
  80168e:	ff d0                	callq  *%rax
  801690:	90                   	nop
  801691:	c9                   	leaveq 
  801692:	c3                   	retq   

0000000000801693 <sprintputch>:
  801693:	55                   	push   %rbp
  801694:	48 89 e5             	mov    %rsp,%rbp
  801697:	48 83 ec 10          	sub    $0x10,%rsp
  80169b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80169e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8016a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016a6:	8b 40 10             	mov    0x10(%rax),%eax
  8016a9:	8d 50 01             	lea    0x1(%rax),%edx
  8016ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016b0:	89 50 10             	mov    %edx,0x10(%rax)
  8016b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016b7:	48 8b 10             	mov    (%rax),%rdx
  8016ba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016be:	48 8b 40 08          	mov    0x8(%rax),%rax
  8016c2:	48 39 c2             	cmp    %rax,%rdx
  8016c5:	73 17                	jae    8016de <sprintputch+0x4b>
  8016c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016cb:	48 8b 00             	mov    (%rax),%rax
  8016ce:	48 8d 48 01          	lea    0x1(%rax),%rcx
  8016d2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8016d6:	48 89 0a             	mov    %rcx,(%rdx)
  8016d9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8016dc:	88 10                	mov    %dl,(%rax)
  8016de:	90                   	nop
  8016df:	c9                   	leaveq 
  8016e0:	c3                   	retq   

00000000008016e1 <vsnprintf>:
  8016e1:	55                   	push   %rbp
  8016e2:	48 89 e5             	mov    %rsp,%rbp
  8016e5:	48 83 ec 50          	sub    $0x50,%rsp
  8016e9:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8016ed:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  8016f0:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  8016f4:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  8016f8:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8016fc:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801700:	48 8b 0a             	mov    (%rdx),%rcx
  801703:	48 89 08             	mov    %rcx,(%rax)
  801706:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80170a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80170e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801712:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801716:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80171a:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  80171e:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801721:	48 98                	cltq   
  801723:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801727:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80172b:	48 01 d0             	add    %rdx,%rax
  80172e:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801732:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  801739:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  80173e:	74 06                	je     801746 <vsnprintf+0x65>
  801740:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801744:	7f 07                	jg     80174d <vsnprintf+0x6c>
  801746:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80174b:	eb 2f                	jmp    80177c <vsnprintf+0x9b>
  80174d:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801751:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801755:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  801759:	48 89 c6             	mov    %rax,%rsi
  80175c:	48 bf 93 16 80 00 00 	movabs $0x801693,%rdi
  801763:	00 00 00 
  801766:	48 b8 d9 10 80 00 00 	movabs $0x8010d9,%rax
  80176d:	00 00 00 
  801770:	ff d0                	callq  *%rax
  801772:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801776:	c6 00 00             	movb   $0x0,(%rax)
  801779:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80177c:	c9                   	leaveq 
  80177d:	c3                   	retq   

000000000080177e <snprintf>:
  80177e:	55                   	push   %rbp
  80177f:	48 89 e5             	mov    %rsp,%rbp
  801782:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  801789:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  801790:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801796:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  80179d:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8017a4:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8017ab:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8017b2:	84 c0                	test   %al,%al
  8017b4:	74 20                	je     8017d6 <snprintf+0x58>
  8017b6:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8017ba:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8017be:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8017c2:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8017c6:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8017ca:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8017ce:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8017d2:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8017d6:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8017dd:	00 00 00 
  8017e0:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8017e7:	00 00 00 
  8017ea:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8017ee:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8017f5:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8017fc:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801803:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80180a:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801811:	48 8b 0a             	mov    (%rdx),%rcx
  801814:	48 89 08             	mov    %rcx,(%rax)
  801817:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80181b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80181f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801823:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801827:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80182e:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801835:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80183b:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801842:	48 89 c7             	mov    %rax,%rdi
  801845:	48 b8 e1 16 80 00 00 	movabs $0x8016e1,%rax
  80184c:	00 00 00 
  80184f:	ff d0                	callq  *%rax
  801851:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801857:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80185d:	c9                   	leaveq 
  80185e:	c3                   	retq   

000000000080185f <strlen>:
  80185f:	55                   	push   %rbp
  801860:	48 89 e5             	mov    %rsp,%rbp
  801863:	48 83 ec 18          	sub    $0x18,%rsp
  801867:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80186b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801872:	eb 09                	jmp    80187d <strlen+0x1e>
  801874:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801878:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80187d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801881:	0f b6 00             	movzbl (%rax),%eax
  801884:	84 c0                	test   %al,%al
  801886:	75 ec                	jne    801874 <strlen+0x15>
  801888:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80188b:	c9                   	leaveq 
  80188c:	c3                   	retq   

000000000080188d <strnlen>:
  80188d:	55                   	push   %rbp
  80188e:	48 89 e5             	mov    %rsp,%rbp
  801891:	48 83 ec 20          	sub    $0x20,%rsp
  801895:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801899:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80189d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8018a4:	eb 0e                	jmp    8018b4 <strnlen+0x27>
  8018a6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8018aa:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8018af:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8018b4:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8018b9:	74 0b                	je     8018c6 <strnlen+0x39>
  8018bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018bf:	0f b6 00             	movzbl (%rax),%eax
  8018c2:	84 c0                	test   %al,%al
  8018c4:	75 e0                	jne    8018a6 <strnlen+0x19>
  8018c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018c9:	c9                   	leaveq 
  8018ca:	c3                   	retq   

00000000008018cb <strcpy>:
  8018cb:	55                   	push   %rbp
  8018cc:	48 89 e5             	mov    %rsp,%rbp
  8018cf:	48 83 ec 20          	sub    $0x20,%rsp
  8018d3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8018d7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8018db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018df:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8018e3:	90                   	nop
  8018e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018e8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8018ec:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8018f0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8018f4:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8018f8:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8018fc:	0f b6 12             	movzbl (%rdx),%edx
  8018ff:	88 10                	mov    %dl,(%rax)
  801901:	0f b6 00             	movzbl (%rax),%eax
  801904:	84 c0                	test   %al,%al
  801906:	75 dc                	jne    8018e4 <strcpy+0x19>
  801908:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80190c:	c9                   	leaveq 
  80190d:	c3                   	retq   

000000000080190e <strcat>:
  80190e:	55                   	push   %rbp
  80190f:	48 89 e5             	mov    %rsp,%rbp
  801912:	48 83 ec 20          	sub    $0x20,%rsp
  801916:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80191a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80191e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801922:	48 89 c7             	mov    %rax,%rdi
  801925:	48 b8 5f 18 80 00 00 	movabs $0x80185f,%rax
  80192c:	00 00 00 
  80192f:	ff d0                	callq  *%rax
  801931:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801934:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801937:	48 63 d0             	movslq %eax,%rdx
  80193a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80193e:	48 01 c2             	add    %rax,%rdx
  801941:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801945:	48 89 c6             	mov    %rax,%rsi
  801948:	48 89 d7             	mov    %rdx,%rdi
  80194b:	48 b8 cb 18 80 00 00 	movabs $0x8018cb,%rax
  801952:	00 00 00 
  801955:	ff d0                	callq  *%rax
  801957:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80195b:	c9                   	leaveq 
  80195c:	c3                   	retq   

000000000080195d <strncpy>:
  80195d:	55                   	push   %rbp
  80195e:	48 89 e5             	mov    %rsp,%rbp
  801961:	48 83 ec 28          	sub    $0x28,%rsp
  801965:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801969:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80196d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801971:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801975:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801979:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801980:	00 
  801981:	eb 2a                	jmp    8019ad <strncpy+0x50>
  801983:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801987:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80198b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80198f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801993:	0f b6 12             	movzbl (%rdx),%edx
  801996:	88 10                	mov    %dl,(%rax)
  801998:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80199c:	0f b6 00             	movzbl (%rax),%eax
  80199f:	84 c0                	test   %al,%al
  8019a1:	74 05                	je     8019a8 <strncpy+0x4b>
  8019a3:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8019a8:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8019ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8019b1:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8019b5:	72 cc                	jb     801983 <strncpy+0x26>
  8019b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8019bb:	c9                   	leaveq 
  8019bc:	c3                   	retq   

00000000008019bd <strlcpy>:
  8019bd:	55                   	push   %rbp
  8019be:	48 89 e5             	mov    %rsp,%rbp
  8019c1:	48 83 ec 28          	sub    $0x28,%rsp
  8019c5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8019c9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8019cd:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8019d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019d5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8019d9:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8019de:	74 3d                	je     801a1d <strlcpy+0x60>
  8019e0:	eb 1d                	jmp    8019ff <strlcpy+0x42>
  8019e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019e6:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8019ea:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8019ee:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8019f2:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8019f6:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8019fa:	0f b6 12             	movzbl (%rdx),%edx
  8019fd:	88 10                	mov    %dl,(%rax)
  8019ff:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801a04:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801a09:	74 0b                	je     801a16 <strlcpy+0x59>
  801a0b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801a0f:	0f b6 00             	movzbl (%rax),%eax
  801a12:	84 c0                	test   %al,%al
  801a14:	75 cc                	jne    8019e2 <strlcpy+0x25>
  801a16:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a1a:	c6 00 00             	movb   $0x0,(%rax)
  801a1d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801a21:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a25:	48 29 c2             	sub    %rax,%rdx
  801a28:	48 89 d0             	mov    %rdx,%rax
  801a2b:	c9                   	leaveq 
  801a2c:	c3                   	retq   

0000000000801a2d <strcmp>:
  801a2d:	55                   	push   %rbp
  801a2e:	48 89 e5             	mov    %rsp,%rbp
  801a31:	48 83 ec 10          	sub    $0x10,%rsp
  801a35:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a39:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a3d:	eb 0a                	jmp    801a49 <strcmp+0x1c>
  801a3f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801a44:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801a49:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a4d:	0f b6 00             	movzbl (%rax),%eax
  801a50:	84 c0                	test   %al,%al
  801a52:	74 12                	je     801a66 <strcmp+0x39>
  801a54:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a58:	0f b6 10             	movzbl (%rax),%edx
  801a5b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a5f:	0f b6 00             	movzbl (%rax),%eax
  801a62:	38 c2                	cmp    %al,%dl
  801a64:	74 d9                	je     801a3f <strcmp+0x12>
  801a66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a6a:	0f b6 00             	movzbl (%rax),%eax
  801a6d:	0f b6 d0             	movzbl %al,%edx
  801a70:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a74:	0f b6 00             	movzbl (%rax),%eax
  801a77:	0f b6 c0             	movzbl %al,%eax
  801a7a:	29 c2                	sub    %eax,%edx
  801a7c:	89 d0                	mov    %edx,%eax
  801a7e:	c9                   	leaveq 
  801a7f:	c3                   	retq   

0000000000801a80 <strncmp>:
  801a80:	55                   	push   %rbp
  801a81:	48 89 e5             	mov    %rsp,%rbp
  801a84:	48 83 ec 18          	sub    $0x18,%rsp
  801a88:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a8c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a90:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801a94:	eb 0f                	jmp    801aa5 <strncmp+0x25>
  801a96:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801a9b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801aa0:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801aa5:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801aaa:	74 1d                	je     801ac9 <strncmp+0x49>
  801aac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ab0:	0f b6 00             	movzbl (%rax),%eax
  801ab3:	84 c0                	test   %al,%al
  801ab5:	74 12                	je     801ac9 <strncmp+0x49>
  801ab7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801abb:	0f b6 10             	movzbl (%rax),%edx
  801abe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ac2:	0f b6 00             	movzbl (%rax),%eax
  801ac5:	38 c2                	cmp    %al,%dl
  801ac7:	74 cd                	je     801a96 <strncmp+0x16>
  801ac9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801ace:	75 07                	jne    801ad7 <strncmp+0x57>
  801ad0:	b8 00 00 00 00       	mov    $0x0,%eax
  801ad5:	eb 18                	jmp    801aef <strncmp+0x6f>
  801ad7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801adb:	0f b6 00             	movzbl (%rax),%eax
  801ade:	0f b6 d0             	movzbl %al,%edx
  801ae1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ae5:	0f b6 00             	movzbl (%rax),%eax
  801ae8:	0f b6 c0             	movzbl %al,%eax
  801aeb:	29 c2                	sub    %eax,%edx
  801aed:	89 d0                	mov    %edx,%eax
  801aef:	c9                   	leaveq 
  801af0:	c3                   	retq   

0000000000801af1 <strchr>:
  801af1:	55                   	push   %rbp
  801af2:	48 89 e5             	mov    %rsp,%rbp
  801af5:	48 83 ec 10          	sub    $0x10,%rsp
  801af9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801afd:	89 f0                	mov    %esi,%eax
  801aff:	88 45 f4             	mov    %al,-0xc(%rbp)
  801b02:	eb 17                	jmp    801b1b <strchr+0x2a>
  801b04:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b08:	0f b6 00             	movzbl (%rax),%eax
  801b0b:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801b0e:	75 06                	jne    801b16 <strchr+0x25>
  801b10:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b14:	eb 15                	jmp    801b2b <strchr+0x3a>
  801b16:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801b1b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b1f:	0f b6 00             	movzbl (%rax),%eax
  801b22:	84 c0                	test   %al,%al
  801b24:	75 de                	jne    801b04 <strchr+0x13>
  801b26:	b8 00 00 00 00       	mov    $0x0,%eax
  801b2b:	c9                   	leaveq 
  801b2c:	c3                   	retq   

0000000000801b2d <strfind>:
  801b2d:	55                   	push   %rbp
  801b2e:	48 89 e5             	mov    %rsp,%rbp
  801b31:	48 83 ec 10          	sub    $0x10,%rsp
  801b35:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b39:	89 f0                	mov    %esi,%eax
  801b3b:	88 45 f4             	mov    %al,-0xc(%rbp)
  801b3e:	eb 11                	jmp    801b51 <strfind+0x24>
  801b40:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b44:	0f b6 00             	movzbl (%rax),%eax
  801b47:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801b4a:	74 12                	je     801b5e <strfind+0x31>
  801b4c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801b51:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b55:	0f b6 00             	movzbl (%rax),%eax
  801b58:	84 c0                	test   %al,%al
  801b5a:	75 e4                	jne    801b40 <strfind+0x13>
  801b5c:	eb 01                	jmp    801b5f <strfind+0x32>
  801b5e:	90                   	nop
  801b5f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b63:	c9                   	leaveq 
  801b64:	c3                   	retq   

0000000000801b65 <memset>:
  801b65:	55                   	push   %rbp
  801b66:	48 89 e5             	mov    %rsp,%rbp
  801b69:	48 83 ec 18          	sub    $0x18,%rsp
  801b6d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b71:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801b74:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b78:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801b7d:	75 06                	jne    801b85 <memset+0x20>
  801b7f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b83:	eb 69                	jmp    801bee <memset+0x89>
  801b85:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b89:	83 e0 03             	and    $0x3,%eax
  801b8c:	48 85 c0             	test   %rax,%rax
  801b8f:	75 48                	jne    801bd9 <memset+0x74>
  801b91:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b95:	83 e0 03             	and    $0x3,%eax
  801b98:	48 85 c0             	test   %rax,%rax
  801b9b:	75 3c                	jne    801bd9 <memset+0x74>
  801b9d:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801ba4:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801ba7:	c1 e0 18             	shl    $0x18,%eax
  801baa:	89 c2                	mov    %eax,%edx
  801bac:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801baf:	c1 e0 10             	shl    $0x10,%eax
  801bb2:	09 c2                	or     %eax,%edx
  801bb4:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801bb7:	c1 e0 08             	shl    $0x8,%eax
  801bba:	09 d0                	or     %edx,%eax
  801bbc:	09 45 f4             	or     %eax,-0xc(%rbp)
  801bbf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bc3:	48 c1 e8 02          	shr    $0x2,%rax
  801bc7:	48 89 c1             	mov    %rax,%rcx
  801bca:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801bce:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801bd1:	48 89 d7             	mov    %rdx,%rdi
  801bd4:	fc                   	cld    
  801bd5:	f3 ab                	rep stos %eax,%es:(%rdi)
  801bd7:	eb 11                	jmp    801bea <memset+0x85>
  801bd9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801bdd:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801be0:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801be4:	48 89 d7             	mov    %rdx,%rdi
  801be7:	fc                   	cld    
  801be8:	f3 aa                	rep stos %al,%es:(%rdi)
  801bea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bee:	c9                   	leaveq 
  801bef:	c3                   	retq   

0000000000801bf0 <memmove>:
  801bf0:	55                   	push   %rbp
  801bf1:	48 89 e5             	mov    %rsp,%rbp
  801bf4:	48 83 ec 28          	sub    $0x28,%rsp
  801bf8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801bfc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801c00:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801c04:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801c08:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801c0c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c10:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801c14:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c18:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801c1c:	0f 83 88 00 00 00    	jae    801caa <memmove+0xba>
  801c22:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801c26:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c2a:	48 01 d0             	add    %rdx,%rax
  801c2d:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801c31:	76 77                	jbe    801caa <memmove+0xba>
  801c33:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c37:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801c3b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c3f:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801c43:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c47:	83 e0 03             	and    $0x3,%eax
  801c4a:	48 85 c0             	test   %rax,%rax
  801c4d:	75 3b                	jne    801c8a <memmove+0x9a>
  801c4f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801c53:	83 e0 03             	and    $0x3,%eax
  801c56:	48 85 c0             	test   %rax,%rax
  801c59:	75 2f                	jne    801c8a <memmove+0x9a>
  801c5b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c5f:	83 e0 03             	and    $0x3,%eax
  801c62:	48 85 c0             	test   %rax,%rax
  801c65:	75 23                	jne    801c8a <memmove+0x9a>
  801c67:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801c6b:	48 83 e8 04          	sub    $0x4,%rax
  801c6f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801c73:	48 83 ea 04          	sub    $0x4,%rdx
  801c77:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801c7b:	48 c1 e9 02          	shr    $0x2,%rcx
  801c7f:	48 89 c7             	mov    %rax,%rdi
  801c82:	48 89 d6             	mov    %rdx,%rsi
  801c85:	fd                   	std    
  801c86:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801c88:	eb 1d                	jmp    801ca7 <memmove+0xb7>
  801c8a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801c8e:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801c92:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c96:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801c9a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c9e:	48 89 d7             	mov    %rdx,%rdi
  801ca1:	48 89 c1             	mov    %rax,%rcx
  801ca4:	fd                   	std    
  801ca5:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801ca7:	fc                   	cld    
  801ca8:	eb 57                	jmp    801d01 <memmove+0x111>
  801caa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cae:	83 e0 03             	and    $0x3,%eax
  801cb1:	48 85 c0             	test   %rax,%rax
  801cb4:	75 36                	jne    801cec <memmove+0xfc>
  801cb6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801cba:	83 e0 03             	and    $0x3,%eax
  801cbd:	48 85 c0             	test   %rax,%rax
  801cc0:	75 2a                	jne    801cec <memmove+0xfc>
  801cc2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cc6:	83 e0 03             	and    $0x3,%eax
  801cc9:	48 85 c0             	test   %rax,%rax
  801ccc:	75 1e                	jne    801cec <memmove+0xfc>
  801cce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cd2:	48 c1 e8 02          	shr    $0x2,%rax
  801cd6:	48 89 c1             	mov    %rax,%rcx
  801cd9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801cdd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801ce1:	48 89 c7             	mov    %rax,%rdi
  801ce4:	48 89 d6             	mov    %rdx,%rsi
  801ce7:	fc                   	cld    
  801ce8:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801cea:	eb 15                	jmp    801d01 <memmove+0x111>
  801cec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801cf0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801cf4:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801cf8:	48 89 c7             	mov    %rax,%rdi
  801cfb:	48 89 d6             	mov    %rdx,%rsi
  801cfe:	fc                   	cld    
  801cff:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801d01:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d05:	c9                   	leaveq 
  801d06:	c3                   	retq   

0000000000801d07 <memcpy>:
  801d07:	55                   	push   %rbp
  801d08:	48 89 e5             	mov    %rsp,%rbp
  801d0b:	48 83 ec 18          	sub    $0x18,%rsp
  801d0f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d13:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d17:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801d1b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801d1f:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801d23:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d27:	48 89 ce             	mov    %rcx,%rsi
  801d2a:	48 89 c7             	mov    %rax,%rdi
  801d2d:	48 b8 f0 1b 80 00 00 	movabs $0x801bf0,%rax
  801d34:	00 00 00 
  801d37:	ff d0                	callq  *%rax
  801d39:	c9                   	leaveq 
  801d3a:	c3                   	retq   

0000000000801d3b <memcmp>:
  801d3b:	55                   	push   %rbp
  801d3c:	48 89 e5             	mov    %rsp,%rbp
  801d3f:	48 83 ec 28          	sub    $0x28,%rsp
  801d43:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801d47:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801d4b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801d4f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d53:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801d57:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801d5b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801d5f:	eb 36                	jmp    801d97 <memcmp+0x5c>
  801d61:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d65:	0f b6 10             	movzbl (%rax),%edx
  801d68:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d6c:	0f b6 00             	movzbl (%rax),%eax
  801d6f:	38 c2                	cmp    %al,%dl
  801d71:	74 1a                	je     801d8d <memcmp+0x52>
  801d73:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d77:	0f b6 00             	movzbl (%rax),%eax
  801d7a:	0f b6 d0             	movzbl %al,%edx
  801d7d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d81:	0f b6 00             	movzbl (%rax),%eax
  801d84:	0f b6 c0             	movzbl %al,%eax
  801d87:	29 c2                	sub    %eax,%edx
  801d89:	89 d0                	mov    %edx,%eax
  801d8b:	eb 20                	jmp    801dad <memcmp+0x72>
  801d8d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801d92:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801d97:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d9b:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801d9f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801da3:	48 85 c0             	test   %rax,%rax
  801da6:	75 b9                	jne    801d61 <memcmp+0x26>
  801da8:	b8 00 00 00 00       	mov    $0x0,%eax
  801dad:	c9                   	leaveq 
  801dae:	c3                   	retq   

0000000000801daf <memfind>:
  801daf:	55                   	push   %rbp
  801db0:	48 89 e5             	mov    %rsp,%rbp
  801db3:	48 83 ec 28          	sub    $0x28,%rsp
  801db7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801dbb:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801dbe:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801dc2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801dc6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801dca:	48 01 d0             	add    %rdx,%rax
  801dcd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801dd1:	eb 13                	jmp    801de6 <memfind+0x37>
  801dd3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801dd7:	0f b6 00             	movzbl (%rax),%eax
  801dda:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801ddd:	38 d0                	cmp    %dl,%al
  801ddf:	74 11                	je     801df2 <memfind+0x43>
  801de1:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801de6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801dea:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801dee:	72 e3                	jb     801dd3 <memfind+0x24>
  801df0:	eb 01                	jmp    801df3 <memfind+0x44>
  801df2:	90                   	nop
  801df3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801df7:	c9                   	leaveq 
  801df8:	c3                   	retq   

0000000000801df9 <strtol>:
  801df9:	55                   	push   %rbp
  801dfa:	48 89 e5             	mov    %rsp,%rbp
  801dfd:	48 83 ec 38          	sub    $0x38,%rsp
  801e01:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801e05:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801e09:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801e0c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801e13:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801e1a:	00 
  801e1b:	eb 05                	jmp    801e22 <strtol+0x29>
  801e1d:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801e22:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e26:	0f b6 00             	movzbl (%rax),%eax
  801e29:	3c 20                	cmp    $0x20,%al
  801e2b:	74 f0                	je     801e1d <strtol+0x24>
  801e2d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e31:	0f b6 00             	movzbl (%rax),%eax
  801e34:	3c 09                	cmp    $0x9,%al
  801e36:	74 e5                	je     801e1d <strtol+0x24>
  801e38:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e3c:	0f b6 00             	movzbl (%rax),%eax
  801e3f:	3c 2b                	cmp    $0x2b,%al
  801e41:	75 07                	jne    801e4a <strtol+0x51>
  801e43:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801e48:	eb 17                	jmp    801e61 <strtol+0x68>
  801e4a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e4e:	0f b6 00             	movzbl (%rax),%eax
  801e51:	3c 2d                	cmp    $0x2d,%al
  801e53:	75 0c                	jne    801e61 <strtol+0x68>
  801e55:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801e5a:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801e61:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801e65:	74 06                	je     801e6d <strtol+0x74>
  801e67:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801e6b:	75 28                	jne    801e95 <strtol+0x9c>
  801e6d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e71:	0f b6 00             	movzbl (%rax),%eax
  801e74:	3c 30                	cmp    $0x30,%al
  801e76:	75 1d                	jne    801e95 <strtol+0x9c>
  801e78:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e7c:	48 83 c0 01          	add    $0x1,%rax
  801e80:	0f b6 00             	movzbl (%rax),%eax
  801e83:	3c 78                	cmp    $0x78,%al
  801e85:	75 0e                	jne    801e95 <strtol+0x9c>
  801e87:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801e8c:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801e93:	eb 2c                	jmp    801ec1 <strtol+0xc8>
  801e95:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801e99:	75 19                	jne    801eb4 <strtol+0xbb>
  801e9b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e9f:	0f b6 00             	movzbl (%rax),%eax
  801ea2:	3c 30                	cmp    $0x30,%al
  801ea4:	75 0e                	jne    801eb4 <strtol+0xbb>
  801ea6:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801eab:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801eb2:	eb 0d                	jmp    801ec1 <strtol+0xc8>
  801eb4:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801eb8:	75 07                	jne    801ec1 <strtol+0xc8>
  801eba:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801ec1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ec5:	0f b6 00             	movzbl (%rax),%eax
  801ec8:	3c 2f                	cmp    $0x2f,%al
  801eca:	7e 1d                	jle    801ee9 <strtol+0xf0>
  801ecc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ed0:	0f b6 00             	movzbl (%rax),%eax
  801ed3:	3c 39                	cmp    $0x39,%al
  801ed5:	7f 12                	jg     801ee9 <strtol+0xf0>
  801ed7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801edb:	0f b6 00             	movzbl (%rax),%eax
  801ede:	0f be c0             	movsbl %al,%eax
  801ee1:	83 e8 30             	sub    $0x30,%eax
  801ee4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801ee7:	eb 4e                	jmp    801f37 <strtol+0x13e>
  801ee9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801eed:	0f b6 00             	movzbl (%rax),%eax
  801ef0:	3c 60                	cmp    $0x60,%al
  801ef2:	7e 1d                	jle    801f11 <strtol+0x118>
  801ef4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ef8:	0f b6 00             	movzbl (%rax),%eax
  801efb:	3c 7a                	cmp    $0x7a,%al
  801efd:	7f 12                	jg     801f11 <strtol+0x118>
  801eff:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f03:	0f b6 00             	movzbl (%rax),%eax
  801f06:	0f be c0             	movsbl %al,%eax
  801f09:	83 e8 57             	sub    $0x57,%eax
  801f0c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801f0f:	eb 26                	jmp    801f37 <strtol+0x13e>
  801f11:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f15:	0f b6 00             	movzbl (%rax),%eax
  801f18:	3c 40                	cmp    $0x40,%al
  801f1a:	7e 47                	jle    801f63 <strtol+0x16a>
  801f1c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f20:	0f b6 00             	movzbl (%rax),%eax
  801f23:	3c 5a                	cmp    $0x5a,%al
  801f25:	7f 3c                	jg     801f63 <strtol+0x16a>
  801f27:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f2b:	0f b6 00             	movzbl (%rax),%eax
  801f2e:	0f be c0             	movsbl %al,%eax
  801f31:	83 e8 37             	sub    $0x37,%eax
  801f34:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801f37:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f3a:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801f3d:	7d 23                	jge    801f62 <strtol+0x169>
  801f3f:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801f44:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801f47:	48 98                	cltq   
  801f49:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801f4e:	48 89 c2             	mov    %rax,%rdx
  801f51:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f54:	48 98                	cltq   
  801f56:	48 01 d0             	add    %rdx,%rax
  801f59:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801f5d:	e9 5f ff ff ff       	jmpq   801ec1 <strtol+0xc8>
  801f62:	90                   	nop
  801f63:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801f68:	74 0b                	je     801f75 <strtol+0x17c>
  801f6a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801f6e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801f72:	48 89 10             	mov    %rdx,(%rax)
  801f75:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801f79:	74 09                	je     801f84 <strtol+0x18b>
  801f7b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f7f:	48 f7 d8             	neg    %rax
  801f82:	eb 04                	jmp    801f88 <strtol+0x18f>
  801f84:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f88:	c9                   	leaveq 
  801f89:	c3                   	retq   

0000000000801f8a <strstr>:
  801f8a:	55                   	push   %rbp
  801f8b:	48 89 e5             	mov    %rsp,%rbp
  801f8e:	48 83 ec 30          	sub    $0x30,%rsp
  801f92:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801f96:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801f9a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801f9e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801fa2:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801fa6:	0f b6 00             	movzbl (%rax),%eax
  801fa9:	88 45 ff             	mov    %al,-0x1(%rbp)
  801fac:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801fb0:	75 06                	jne    801fb8 <strstr+0x2e>
  801fb2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fb6:	eb 6b                	jmp    802023 <strstr+0x99>
  801fb8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801fbc:	48 89 c7             	mov    %rax,%rdi
  801fbf:	48 b8 5f 18 80 00 00 	movabs $0x80185f,%rax
  801fc6:	00 00 00 
  801fc9:	ff d0                	callq  *%rax
  801fcb:	48 98                	cltq   
  801fcd:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801fd1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fd5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801fd9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801fdd:	0f b6 00             	movzbl (%rax),%eax
  801fe0:	88 45 ef             	mov    %al,-0x11(%rbp)
  801fe3:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801fe7:	75 07                	jne    801ff0 <strstr+0x66>
  801fe9:	b8 00 00 00 00       	mov    $0x0,%eax
  801fee:	eb 33                	jmp    802023 <strstr+0x99>
  801ff0:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801ff4:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801ff7:	75 d8                	jne    801fd1 <strstr+0x47>
  801ff9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ffd:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802001:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802005:	48 89 ce             	mov    %rcx,%rsi
  802008:	48 89 c7             	mov    %rax,%rdi
  80200b:	48 b8 80 1a 80 00 00 	movabs $0x801a80,%rax
  802012:	00 00 00 
  802015:	ff d0                	callq  *%rax
  802017:	85 c0                	test   %eax,%eax
  802019:	75 b6                	jne    801fd1 <strstr+0x47>
  80201b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80201f:	48 83 e8 01          	sub    $0x1,%rax
  802023:	c9                   	leaveq 
  802024:	c3                   	retq   

0000000000802025 <syscall>:
  802025:	55                   	push   %rbp
  802026:	48 89 e5             	mov    %rsp,%rbp
  802029:	53                   	push   %rbx
  80202a:	48 83 ec 48          	sub    $0x48,%rsp
  80202e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802031:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802034:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  802038:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80203c:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  802040:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  802044:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802047:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80204b:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  80204f:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  802053:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  802057:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80205b:	4c 89 c3             	mov    %r8,%rbx
  80205e:	cd 30                	int    $0x30
  802060:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802064:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  802068:	74 3e                	je     8020a8 <syscall+0x83>
  80206a:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80206f:	7e 37                	jle    8020a8 <syscall+0x83>
  802071:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802075:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802078:	49 89 d0             	mov    %rdx,%r8
  80207b:	89 c1                	mov    %eax,%ecx
  80207d:	48 ba 88 5c 80 00 00 	movabs $0x805c88,%rdx
  802084:	00 00 00 
  802087:	be 24 00 00 00       	mov    $0x24,%esi
  80208c:	48 bf a5 5c 80 00 00 	movabs $0x805ca5,%rdi
  802093:	00 00 00 
  802096:	b8 00 00 00 00       	mov    $0x0,%eax
  80209b:	49 b9 01 0b 80 00 00 	movabs $0x800b01,%r9
  8020a2:	00 00 00 
  8020a5:	41 ff d1             	callq  *%r9
  8020a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020ac:	48 83 c4 48          	add    $0x48,%rsp
  8020b0:	5b                   	pop    %rbx
  8020b1:	5d                   	pop    %rbp
  8020b2:	c3                   	retq   

00000000008020b3 <sys_cputs>:
  8020b3:	55                   	push   %rbp
  8020b4:	48 89 e5             	mov    %rsp,%rbp
  8020b7:	48 83 ec 10          	sub    $0x10,%rsp
  8020bb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8020bf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8020c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8020c7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8020cb:	48 83 ec 08          	sub    $0x8,%rsp
  8020cf:	6a 00                	pushq  $0x0
  8020d1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8020d7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8020dd:	48 89 d1             	mov    %rdx,%rcx
  8020e0:	48 89 c2             	mov    %rax,%rdx
  8020e3:	be 00 00 00 00       	mov    $0x0,%esi
  8020e8:	bf 00 00 00 00       	mov    $0x0,%edi
  8020ed:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  8020f4:	00 00 00 
  8020f7:	ff d0                	callq  *%rax
  8020f9:	48 83 c4 10          	add    $0x10,%rsp
  8020fd:	90                   	nop
  8020fe:	c9                   	leaveq 
  8020ff:	c3                   	retq   

0000000000802100 <sys_cgetc>:
  802100:	55                   	push   %rbp
  802101:	48 89 e5             	mov    %rsp,%rbp
  802104:	48 83 ec 08          	sub    $0x8,%rsp
  802108:	6a 00                	pushq  $0x0
  80210a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802110:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802116:	b9 00 00 00 00       	mov    $0x0,%ecx
  80211b:	ba 00 00 00 00       	mov    $0x0,%edx
  802120:	be 00 00 00 00       	mov    $0x0,%esi
  802125:	bf 01 00 00 00       	mov    $0x1,%edi
  80212a:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  802131:	00 00 00 
  802134:	ff d0                	callq  *%rax
  802136:	48 83 c4 10          	add    $0x10,%rsp
  80213a:	c9                   	leaveq 
  80213b:	c3                   	retq   

000000000080213c <sys_env_destroy>:
  80213c:	55                   	push   %rbp
  80213d:	48 89 e5             	mov    %rsp,%rbp
  802140:	48 83 ec 10          	sub    $0x10,%rsp
  802144:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802147:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80214a:	48 98                	cltq   
  80214c:	48 83 ec 08          	sub    $0x8,%rsp
  802150:	6a 00                	pushq  $0x0
  802152:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802158:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80215e:	b9 00 00 00 00       	mov    $0x0,%ecx
  802163:	48 89 c2             	mov    %rax,%rdx
  802166:	be 01 00 00 00       	mov    $0x1,%esi
  80216b:	bf 03 00 00 00       	mov    $0x3,%edi
  802170:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  802177:	00 00 00 
  80217a:	ff d0                	callq  *%rax
  80217c:	48 83 c4 10          	add    $0x10,%rsp
  802180:	c9                   	leaveq 
  802181:	c3                   	retq   

0000000000802182 <sys_getenvid>:
  802182:	55                   	push   %rbp
  802183:	48 89 e5             	mov    %rsp,%rbp
  802186:	48 83 ec 08          	sub    $0x8,%rsp
  80218a:	6a 00                	pushq  $0x0
  80218c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802192:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802198:	b9 00 00 00 00       	mov    $0x0,%ecx
  80219d:	ba 00 00 00 00       	mov    $0x0,%edx
  8021a2:	be 00 00 00 00       	mov    $0x0,%esi
  8021a7:	bf 02 00 00 00       	mov    $0x2,%edi
  8021ac:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  8021b3:	00 00 00 
  8021b6:	ff d0                	callq  *%rax
  8021b8:	48 83 c4 10          	add    $0x10,%rsp
  8021bc:	c9                   	leaveq 
  8021bd:	c3                   	retq   

00000000008021be <sys_yield>:
  8021be:	55                   	push   %rbp
  8021bf:	48 89 e5             	mov    %rsp,%rbp
  8021c2:	48 83 ec 08          	sub    $0x8,%rsp
  8021c6:	6a 00                	pushq  $0x0
  8021c8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8021ce:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8021d4:	b9 00 00 00 00       	mov    $0x0,%ecx
  8021d9:	ba 00 00 00 00       	mov    $0x0,%edx
  8021de:	be 00 00 00 00       	mov    $0x0,%esi
  8021e3:	bf 0b 00 00 00       	mov    $0xb,%edi
  8021e8:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  8021ef:	00 00 00 
  8021f2:	ff d0                	callq  *%rax
  8021f4:	48 83 c4 10          	add    $0x10,%rsp
  8021f8:	90                   	nop
  8021f9:	c9                   	leaveq 
  8021fa:	c3                   	retq   

00000000008021fb <sys_page_alloc>:
  8021fb:	55                   	push   %rbp
  8021fc:	48 89 e5             	mov    %rsp,%rbp
  8021ff:	48 83 ec 10          	sub    $0x10,%rsp
  802203:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802206:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80220a:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80220d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802210:	48 63 c8             	movslq %eax,%rcx
  802213:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802217:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80221a:	48 98                	cltq   
  80221c:	48 83 ec 08          	sub    $0x8,%rsp
  802220:	6a 00                	pushq  $0x0
  802222:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802228:	49 89 c8             	mov    %rcx,%r8
  80222b:	48 89 d1             	mov    %rdx,%rcx
  80222e:	48 89 c2             	mov    %rax,%rdx
  802231:	be 01 00 00 00       	mov    $0x1,%esi
  802236:	bf 04 00 00 00       	mov    $0x4,%edi
  80223b:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  802242:	00 00 00 
  802245:	ff d0                	callq  *%rax
  802247:	48 83 c4 10          	add    $0x10,%rsp
  80224b:	c9                   	leaveq 
  80224c:	c3                   	retq   

000000000080224d <sys_page_map>:
  80224d:	55                   	push   %rbp
  80224e:	48 89 e5             	mov    %rsp,%rbp
  802251:	48 83 ec 20          	sub    $0x20,%rsp
  802255:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802258:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80225c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80225f:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  802263:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802267:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80226a:	48 63 c8             	movslq %eax,%rcx
  80226d:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  802271:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802274:	48 63 f0             	movslq %eax,%rsi
  802277:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80227b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80227e:	48 98                	cltq   
  802280:	48 83 ec 08          	sub    $0x8,%rsp
  802284:	51                   	push   %rcx
  802285:	49 89 f9             	mov    %rdi,%r9
  802288:	49 89 f0             	mov    %rsi,%r8
  80228b:	48 89 d1             	mov    %rdx,%rcx
  80228e:	48 89 c2             	mov    %rax,%rdx
  802291:	be 01 00 00 00       	mov    $0x1,%esi
  802296:	bf 05 00 00 00       	mov    $0x5,%edi
  80229b:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  8022a2:	00 00 00 
  8022a5:	ff d0                	callq  *%rax
  8022a7:	48 83 c4 10          	add    $0x10,%rsp
  8022ab:	c9                   	leaveq 
  8022ac:	c3                   	retq   

00000000008022ad <sys_page_unmap>:
  8022ad:	55                   	push   %rbp
  8022ae:	48 89 e5             	mov    %rsp,%rbp
  8022b1:	48 83 ec 10          	sub    $0x10,%rsp
  8022b5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8022b8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8022bc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8022c0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022c3:	48 98                	cltq   
  8022c5:	48 83 ec 08          	sub    $0x8,%rsp
  8022c9:	6a 00                	pushq  $0x0
  8022cb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8022d1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8022d7:	48 89 d1             	mov    %rdx,%rcx
  8022da:	48 89 c2             	mov    %rax,%rdx
  8022dd:	be 01 00 00 00       	mov    $0x1,%esi
  8022e2:	bf 06 00 00 00       	mov    $0x6,%edi
  8022e7:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  8022ee:	00 00 00 
  8022f1:	ff d0                	callq  *%rax
  8022f3:	48 83 c4 10          	add    $0x10,%rsp
  8022f7:	c9                   	leaveq 
  8022f8:	c3                   	retq   

00000000008022f9 <sys_env_set_status>:
  8022f9:	55                   	push   %rbp
  8022fa:	48 89 e5             	mov    %rsp,%rbp
  8022fd:	48 83 ec 10          	sub    $0x10,%rsp
  802301:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802304:	89 75 f8             	mov    %esi,-0x8(%rbp)
  802307:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80230a:	48 63 d0             	movslq %eax,%rdx
  80230d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802310:	48 98                	cltq   
  802312:	48 83 ec 08          	sub    $0x8,%rsp
  802316:	6a 00                	pushq  $0x0
  802318:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80231e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802324:	48 89 d1             	mov    %rdx,%rcx
  802327:	48 89 c2             	mov    %rax,%rdx
  80232a:	be 01 00 00 00       	mov    $0x1,%esi
  80232f:	bf 08 00 00 00       	mov    $0x8,%edi
  802334:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  80233b:	00 00 00 
  80233e:	ff d0                	callq  *%rax
  802340:	48 83 c4 10          	add    $0x10,%rsp
  802344:	c9                   	leaveq 
  802345:	c3                   	retq   

0000000000802346 <sys_env_set_trapframe>:
  802346:	55                   	push   %rbp
  802347:	48 89 e5             	mov    %rsp,%rbp
  80234a:	48 83 ec 10          	sub    $0x10,%rsp
  80234e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802351:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802355:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802359:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80235c:	48 98                	cltq   
  80235e:	48 83 ec 08          	sub    $0x8,%rsp
  802362:	6a 00                	pushq  $0x0
  802364:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80236a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802370:	48 89 d1             	mov    %rdx,%rcx
  802373:	48 89 c2             	mov    %rax,%rdx
  802376:	be 01 00 00 00       	mov    $0x1,%esi
  80237b:	bf 09 00 00 00       	mov    $0x9,%edi
  802380:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  802387:	00 00 00 
  80238a:	ff d0                	callq  *%rax
  80238c:	48 83 c4 10          	add    $0x10,%rsp
  802390:	c9                   	leaveq 
  802391:	c3                   	retq   

0000000000802392 <sys_env_set_pgfault_upcall>:
  802392:	55                   	push   %rbp
  802393:	48 89 e5             	mov    %rsp,%rbp
  802396:	48 83 ec 10          	sub    $0x10,%rsp
  80239a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80239d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8023a1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8023a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023a8:	48 98                	cltq   
  8023aa:	48 83 ec 08          	sub    $0x8,%rsp
  8023ae:	6a 00                	pushq  $0x0
  8023b0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8023b6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8023bc:	48 89 d1             	mov    %rdx,%rcx
  8023bf:	48 89 c2             	mov    %rax,%rdx
  8023c2:	be 01 00 00 00       	mov    $0x1,%esi
  8023c7:	bf 0a 00 00 00       	mov    $0xa,%edi
  8023cc:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  8023d3:	00 00 00 
  8023d6:	ff d0                	callq  *%rax
  8023d8:	48 83 c4 10          	add    $0x10,%rsp
  8023dc:	c9                   	leaveq 
  8023dd:	c3                   	retq   

00000000008023de <sys_ipc_try_send>:
  8023de:	55                   	push   %rbp
  8023df:	48 89 e5             	mov    %rsp,%rbp
  8023e2:	48 83 ec 20          	sub    $0x20,%rsp
  8023e6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8023e9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8023ed:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8023f1:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  8023f4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023f7:	48 63 f0             	movslq %eax,%rsi
  8023fa:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8023fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802401:	48 98                	cltq   
  802403:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802407:	48 83 ec 08          	sub    $0x8,%rsp
  80240b:	6a 00                	pushq  $0x0
  80240d:	49 89 f1             	mov    %rsi,%r9
  802410:	49 89 c8             	mov    %rcx,%r8
  802413:	48 89 d1             	mov    %rdx,%rcx
  802416:	48 89 c2             	mov    %rax,%rdx
  802419:	be 00 00 00 00       	mov    $0x0,%esi
  80241e:	bf 0c 00 00 00       	mov    $0xc,%edi
  802423:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  80242a:	00 00 00 
  80242d:	ff d0                	callq  *%rax
  80242f:	48 83 c4 10          	add    $0x10,%rsp
  802433:	c9                   	leaveq 
  802434:	c3                   	retq   

0000000000802435 <sys_ipc_recv>:
  802435:	55                   	push   %rbp
  802436:	48 89 e5             	mov    %rsp,%rbp
  802439:	48 83 ec 10          	sub    $0x10,%rsp
  80243d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802441:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802445:	48 83 ec 08          	sub    $0x8,%rsp
  802449:	6a 00                	pushq  $0x0
  80244b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802451:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802457:	b9 00 00 00 00       	mov    $0x0,%ecx
  80245c:	48 89 c2             	mov    %rax,%rdx
  80245f:	be 01 00 00 00       	mov    $0x1,%esi
  802464:	bf 0d 00 00 00       	mov    $0xd,%edi
  802469:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  802470:	00 00 00 
  802473:	ff d0                	callq  *%rax
  802475:	48 83 c4 10          	add    $0x10,%rsp
  802479:	c9                   	leaveq 
  80247a:	c3                   	retq   

000000000080247b <sys_time_msec>:
  80247b:	55                   	push   %rbp
  80247c:	48 89 e5             	mov    %rsp,%rbp
  80247f:	48 83 ec 08          	sub    $0x8,%rsp
  802483:	6a 00                	pushq  $0x0
  802485:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80248b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802491:	b9 00 00 00 00       	mov    $0x0,%ecx
  802496:	ba 00 00 00 00       	mov    $0x0,%edx
  80249b:	be 00 00 00 00       	mov    $0x0,%esi
  8024a0:	bf 0e 00 00 00       	mov    $0xe,%edi
  8024a5:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  8024ac:	00 00 00 
  8024af:	ff d0                	callq  *%rax
  8024b1:	48 83 c4 10          	add    $0x10,%rsp
  8024b5:	c9                   	leaveq 
  8024b6:	c3                   	retq   

00000000008024b7 <sys_net_transmit>:
  8024b7:	55                   	push   %rbp
  8024b8:	48 89 e5             	mov    %rsp,%rbp
  8024bb:	48 83 ec 10          	sub    $0x10,%rsp
  8024bf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8024c3:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8024c6:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8024c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024cd:	48 83 ec 08          	sub    $0x8,%rsp
  8024d1:	6a 00                	pushq  $0x0
  8024d3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8024d9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8024df:	48 89 d1             	mov    %rdx,%rcx
  8024e2:	48 89 c2             	mov    %rax,%rdx
  8024e5:	be 00 00 00 00       	mov    $0x0,%esi
  8024ea:	bf 0f 00 00 00       	mov    $0xf,%edi
  8024ef:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  8024f6:	00 00 00 
  8024f9:	ff d0                	callq  *%rax
  8024fb:	48 83 c4 10          	add    $0x10,%rsp
  8024ff:	c9                   	leaveq 
  802500:	c3                   	retq   

0000000000802501 <sys_net_receive>:
  802501:	55                   	push   %rbp
  802502:	48 89 e5             	mov    %rsp,%rbp
  802505:	48 83 ec 10          	sub    $0x10,%rsp
  802509:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80250d:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802510:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802513:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802517:	48 83 ec 08          	sub    $0x8,%rsp
  80251b:	6a 00                	pushq  $0x0
  80251d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802523:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802529:	48 89 d1             	mov    %rdx,%rcx
  80252c:	48 89 c2             	mov    %rax,%rdx
  80252f:	be 00 00 00 00       	mov    $0x0,%esi
  802534:	bf 10 00 00 00       	mov    $0x10,%edi
  802539:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  802540:	00 00 00 
  802543:	ff d0                	callq  *%rax
  802545:	48 83 c4 10          	add    $0x10,%rsp
  802549:	c9                   	leaveq 
  80254a:	c3                   	retq   

000000000080254b <sys_ept_map>:
  80254b:	55                   	push   %rbp
  80254c:	48 89 e5             	mov    %rsp,%rbp
  80254f:	48 83 ec 20          	sub    $0x20,%rsp
  802553:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802556:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80255a:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80255d:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  802561:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802565:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802568:	48 63 c8             	movslq %eax,%rcx
  80256b:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  80256f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802572:	48 63 f0             	movslq %eax,%rsi
  802575:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802579:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80257c:	48 98                	cltq   
  80257e:	48 83 ec 08          	sub    $0x8,%rsp
  802582:	51                   	push   %rcx
  802583:	49 89 f9             	mov    %rdi,%r9
  802586:	49 89 f0             	mov    %rsi,%r8
  802589:	48 89 d1             	mov    %rdx,%rcx
  80258c:	48 89 c2             	mov    %rax,%rdx
  80258f:	be 00 00 00 00       	mov    $0x0,%esi
  802594:	bf 11 00 00 00       	mov    $0x11,%edi
  802599:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  8025a0:	00 00 00 
  8025a3:	ff d0                	callq  *%rax
  8025a5:	48 83 c4 10          	add    $0x10,%rsp
  8025a9:	c9                   	leaveq 
  8025aa:	c3                   	retq   

00000000008025ab <sys_env_mkguest>:
  8025ab:	55                   	push   %rbp
  8025ac:	48 89 e5             	mov    %rsp,%rbp
  8025af:	48 83 ec 10          	sub    $0x10,%rsp
  8025b3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8025b7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8025bb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8025bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8025c3:	48 83 ec 08          	sub    $0x8,%rsp
  8025c7:	6a 00                	pushq  $0x0
  8025c9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8025cf:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8025d5:	48 89 d1             	mov    %rdx,%rcx
  8025d8:	48 89 c2             	mov    %rax,%rdx
  8025db:	be 00 00 00 00       	mov    $0x0,%esi
  8025e0:	bf 12 00 00 00       	mov    $0x12,%edi
  8025e5:	48 b8 25 20 80 00 00 	movabs $0x802025,%rax
  8025ec:	00 00 00 
  8025ef:	ff d0                	callq  *%rax
  8025f1:	48 83 c4 10          	add    $0x10,%rsp
  8025f5:	c9                   	leaveq 
  8025f6:	c3                   	retq   

00000000008025f7 <pgfault>:
  8025f7:	55                   	push   %rbp
  8025f8:	48 89 e5             	mov    %rsp,%rbp
  8025fb:	48 83 ec 30          	sub    $0x30,%rsp
  8025ff:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802603:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802607:	48 8b 00             	mov    (%rax),%rax
  80260a:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80260e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802612:	48 8b 40 08          	mov    0x8(%rax),%rax
  802616:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802619:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80261c:	83 e0 02             	and    $0x2,%eax
  80261f:	85 c0                	test   %eax,%eax
  802621:	75 40                	jne    802663 <pgfault+0x6c>
  802623:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802627:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  80262e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802632:	49 89 d0             	mov    %rdx,%r8
  802635:	48 89 c1             	mov    %rax,%rcx
  802638:	48 ba b8 5c 80 00 00 	movabs $0x805cb8,%rdx
  80263f:	00 00 00 
  802642:	be 1f 00 00 00       	mov    $0x1f,%esi
  802647:	48 bf d1 5c 80 00 00 	movabs $0x805cd1,%rdi
  80264e:	00 00 00 
  802651:	b8 00 00 00 00       	mov    $0x0,%eax
  802656:	49 b9 01 0b 80 00 00 	movabs $0x800b01,%r9
  80265d:	00 00 00 
  802660:	41 ff d1             	callq  *%r9
  802663:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802667:	48 c1 e8 0c          	shr    $0xc,%rax
  80266b:	48 89 c2             	mov    %rax,%rdx
  80266e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802675:	01 00 00 
  802678:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80267c:	25 07 08 00 00       	and    $0x807,%eax
  802681:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  802687:	74 4e                	je     8026d7 <pgfault+0xe0>
  802689:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80268d:	48 c1 e8 0c          	shr    $0xc,%rax
  802691:	48 89 c2             	mov    %rax,%rdx
  802694:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80269b:	01 00 00 
  80269e:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8026a2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8026a6:	49 89 d0             	mov    %rdx,%r8
  8026a9:	48 89 c1             	mov    %rax,%rcx
  8026ac:	48 ba e0 5c 80 00 00 	movabs $0x805ce0,%rdx
  8026b3:	00 00 00 
  8026b6:	be 22 00 00 00       	mov    $0x22,%esi
  8026bb:	48 bf d1 5c 80 00 00 	movabs $0x805cd1,%rdi
  8026c2:	00 00 00 
  8026c5:	b8 00 00 00 00       	mov    $0x0,%eax
  8026ca:	49 b9 01 0b 80 00 00 	movabs $0x800b01,%r9
  8026d1:	00 00 00 
  8026d4:	41 ff d1             	callq  *%r9
  8026d7:	ba 07 00 00 00       	mov    $0x7,%edx
  8026dc:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8026e1:	bf 00 00 00 00       	mov    $0x0,%edi
  8026e6:	48 b8 fb 21 80 00 00 	movabs $0x8021fb,%rax
  8026ed:	00 00 00 
  8026f0:	ff d0                	callq  *%rax
  8026f2:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8026f5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8026f9:	79 30                	jns    80272b <pgfault+0x134>
  8026fb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8026fe:	89 c1                	mov    %eax,%ecx
  802700:	48 ba 0b 5d 80 00 00 	movabs $0x805d0b,%rdx
  802707:	00 00 00 
  80270a:	be 30 00 00 00       	mov    $0x30,%esi
  80270f:	48 bf d1 5c 80 00 00 	movabs $0x805cd1,%rdi
  802716:	00 00 00 
  802719:	b8 00 00 00 00       	mov    $0x0,%eax
  80271e:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  802725:	00 00 00 
  802728:	41 ff d0             	callq  *%r8
  80272b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80272f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802733:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802737:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  80273d:	ba 00 10 00 00       	mov    $0x1000,%edx
  802742:	48 89 c6             	mov    %rax,%rsi
  802745:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  80274a:	48 b8 f0 1b 80 00 00 	movabs $0x801bf0,%rax
  802751:	00 00 00 
  802754:	ff d0                	callq  *%rax
  802756:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80275a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80275e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802762:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802768:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  80276e:	48 89 c1             	mov    %rax,%rcx
  802771:	ba 00 00 00 00       	mov    $0x0,%edx
  802776:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  80277b:	bf 00 00 00 00       	mov    $0x0,%edi
  802780:	48 b8 4d 22 80 00 00 	movabs $0x80224d,%rax
  802787:	00 00 00 
  80278a:	ff d0                	callq  *%rax
  80278c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80278f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802793:	79 30                	jns    8027c5 <pgfault+0x1ce>
  802795:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802798:	89 c1                	mov    %eax,%ecx
  80279a:	48 ba 1e 5d 80 00 00 	movabs $0x805d1e,%rdx
  8027a1:	00 00 00 
  8027a4:	be 35 00 00 00       	mov    $0x35,%esi
  8027a9:	48 bf d1 5c 80 00 00 	movabs $0x805cd1,%rdi
  8027b0:	00 00 00 
  8027b3:	b8 00 00 00 00       	mov    $0x0,%eax
  8027b8:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  8027bf:	00 00 00 
  8027c2:	41 ff d0             	callq  *%r8
  8027c5:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8027ca:	bf 00 00 00 00       	mov    $0x0,%edi
  8027cf:	48 b8 ad 22 80 00 00 	movabs $0x8022ad,%rax
  8027d6:	00 00 00 
  8027d9:	ff d0                	callq  *%rax
  8027db:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8027de:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8027e2:	79 30                	jns    802814 <pgfault+0x21d>
  8027e4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8027e7:	89 c1                	mov    %eax,%ecx
  8027e9:	48 ba 2f 5d 80 00 00 	movabs $0x805d2f,%rdx
  8027f0:	00 00 00 
  8027f3:	be 39 00 00 00       	mov    $0x39,%esi
  8027f8:	48 bf d1 5c 80 00 00 	movabs $0x805cd1,%rdi
  8027ff:	00 00 00 
  802802:	b8 00 00 00 00       	mov    $0x0,%eax
  802807:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  80280e:	00 00 00 
  802811:	41 ff d0             	callq  *%r8
  802814:	90                   	nop
  802815:	c9                   	leaveq 
  802816:	c3                   	retq   

0000000000802817 <duppage>:
  802817:	55                   	push   %rbp
  802818:	48 89 e5             	mov    %rsp,%rbp
  80281b:	48 83 ec 30          	sub    $0x30,%rsp
  80281f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802822:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802825:	8b 45 d8             	mov    -0x28(%rbp),%eax
  802828:	c1 e0 0c             	shl    $0xc,%eax
  80282b:	89 c0                	mov    %eax,%eax
  80282d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802831:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802838:	01 00 00 
  80283b:	8b 55 d8             	mov    -0x28(%rbp),%edx
  80283e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802842:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802846:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80284a:	25 02 08 00 00       	and    $0x802,%eax
  80284f:	48 85 c0             	test   %rax,%rax
  802852:	74 0e                	je     802862 <duppage+0x4b>
  802854:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802858:	25 00 04 00 00       	and    $0x400,%eax
  80285d:	48 85 c0             	test   %rax,%rax
  802860:	74 70                	je     8028d2 <duppage+0xbb>
  802862:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802866:	25 07 0e 00 00       	and    $0xe07,%eax
  80286b:	89 c6                	mov    %eax,%esi
  80286d:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802871:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802874:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802878:	41 89 f0             	mov    %esi,%r8d
  80287b:	48 89 c6             	mov    %rax,%rsi
  80287e:	bf 00 00 00 00       	mov    $0x0,%edi
  802883:	48 b8 4d 22 80 00 00 	movabs $0x80224d,%rax
  80288a:	00 00 00 
  80288d:	ff d0                	callq  *%rax
  80288f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802892:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802896:	79 30                	jns    8028c8 <duppage+0xb1>
  802898:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80289b:	89 c1                	mov    %eax,%ecx
  80289d:	48 ba 1e 5d 80 00 00 	movabs $0x805d1e,%rdx
  8028a4:	00 00 00 
  8028a7:	be 63 00 00 00       	mov    $0x63,%esi
  8028ac:	48 bf d1 5c 80 00 00 	movabs $0x805cd1,%rdi
  8028b3:	00 00 00 
  8028b6:	b8 00 00 00 00       	mov    $0x0,%eax
  8028bb:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  8028c2:	00 00 00 
  8028c5:	41 ff d0             	callq  *%r8
  8028c8:	b8 00 00 00 00       	mov    $0x0,%eax
  8028cd:	e9 c4 00 00 00       	jmpq   802996 <duppage+0x17f>
  8028d2:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8028d6:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8028d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8028dd:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8028e3:	48 89 c6             	mov    %rax,%rsi
  8028e6:	bf 00 00 00 00       	mov    $0x0,%edi
  8028eb:	48 b8 4d 22 80 00 00 	movabs $0x80224d,%rax
  8028f2:	00 00 00 
  8028f5:	ff d0                	callq  *%rax
  8028f7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8028fa:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8028fe:	79 30                	jns    802930 <duppage+0x119>
  802900:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802903:	89 c1                	mov    %eax,%ecx
  802905:	48 ba 1e 5d 80 00 00 	movabs $0x805d1e,%rdx
  80290c:	00 00 00 
  80290f:	be 7e 00 00 00       	mov    $0x7e,%esi
  802914:	48 bf d1 5c 80 00 00 	movabs $0x805cd1,%rdi
  80291b:	00 00 00 
  80291e:	b8 00 00 00 00       	mov    $0x0,%eax
  802923:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  80292a:	00 00 00 
  80292d:	41 ff d0             	callq  *%r8
  802930:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802934:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802938:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  80293e:	48 89 d1             	mov    %rdx,%rcx
  802941:	ba 00 00 00 00       	mov    $0x0,%edx
  802946:	48 89 c6             	mov    %rax,%rsi
  802949:	bf 00 00 00 00       	mov    $0x0,%edi
  80294e:	48 b8 4d 22 80 00 00 	movabs $0x80224d,%rax
  802955:	00 00 00 
  802958:	ff d0                	callq  *%rax
  80295a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80295d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802961:	79 30                	jns    802993 <duppage+0x17c>
  802963:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802966:	89 c1                	mov    %eax,%ecx
  802968:	48 ba 1e 5d 80 00 00 	movabs $0x805d1e,%rdx
  80296f:	00 00 00 
  802972:	be 80 00 00 00       	mov    $0x80,%esi
  802977:	48 bf d1 5c 80 00 00 	movabs $0x805cd1,%rdi
  80297e:	00 00 00 
  802981:	b8 00 00 00 00       	mov    $0x0,%eax
  802986:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  80298d:	00 00 00 
  802990:	41 ff d0             	callq  *%r8
  802993:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802996:	c9                   	leaveq 
  802997:	c3                   	retq   

0000000000802998 <fork>:
  802998:	55                   	push   %rbp
  802999:	48 89 e5             	mov    %rsp,%rbp
  80299c:	48 83 ec 20          	sub    $0x20,%rsp
  8029a0:	48 bf f7 25 80 00 00 	movabs $0x8025f7,%rdi
  8029a7:	00 00 00 
  8029aa:	48 b8 f9 4e 80 00 00 	movabs $0x804ef9,%rax
  8029b1:	00 00 00 
  8029b4:	ff d0                	callq  *%rax
  8029b6:	b8 07 00 00 00       	mov    $0x7,%eax
  8029bb:	cd 30                	int    $0x30
  8029bd:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8029c0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8029c3:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8029c6:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8029ca:	79 08                	jns    8029d4 <fork+0x3c>
  8029cc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8029cf:	e9 0b 02 00 00       	jmpq   802bdf <fork+0x247>
  8029d4:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8029d8:	75 3e                	jne    802a18 <fork+0x80>
  8029da:	48 b8 82 21 80 00 00 	movabs $0x802182,%rax
  8029e1:	00 00 00 
  8029e4:	ff d0                	callq  *%rax
  8029e6:	25 ff 03 00 00       	and    $0x3ff,%eax
  8029eb:	48 98                	cltq   
  8029ed:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8029f4:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8029fb:	00 00 00 
  8029fe:	48 01 c2             	add    %rax,%rdx
  802a01:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802a08:	00 00 00 
  802a0b:	48 89 10             	mov    %rdx,(%rax)
  802a0e:	b8 00 00 00 00       	mov    $0x0,%eax
  802a13:	e9 c7 01 00 00       	jmpq   802bdf <fork+0x247>
  802a18:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a1f:	e9 a6 00 00 00       	jmpq   802aca <fork+0x132>
  802a24:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a27:	c1 f8 12             	sar    $0x12,%eax
  802a2a:	89 c2                	mov    %eax,%edx
  802a2c:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  802a33:	01 00 00 
  802a36:	48 63 d2             	movslq %edx,%rdx
  802a39:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a3d:	83 e0 01             	and    $0x1,%eax
  802a40:	48 85 c0             	test   %rax,%rax
  802a43:	74 21                	je     802a66 <fork+0xce>
  802a45:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a48:	c1 f8 09             	sar    $0x9,%eax
  802a4b:	89 c2                	mov    %eax,%edx
  802a4d:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802a54:	01 00 00 
  802a57:	48 63 d2             	movslq %edx,%rdx
  802a5a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a5e:	83 e0 01             	and    $0x1,%eax
  802a61:	48 85 c0             	test   %rax,%rax
  802a64:	75 09                	jne    802a6f <fork+0xd7>
  802a66:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  802a6d:	eb 5b                	jmp    802aca <fork+0x132>
  802a6f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a72:	05 00 02 00 00       	add    $0x200,%eax
  802a77:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802a7a:	eb 46                	jmp    802ac2 <fork+0x12a>
  802a7c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a83:	01 00 00 
  802a86:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802a89:	48 63 d2             	movslq %edx,%rdx
  802a8c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a90:	83 e0 05             	and    $0x5,%eax
  802a93:	48 83 f8 05          	cmp    $0x5,%rax
  802a97:	75 21                	jne    802aba <fork+0x122>
  802a99:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  802aa0:	74 1b                	je     802abd <fork+0x125>
  802aa2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802aa5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802aa8:	89 d6                	mov    %edx,%esi
  802aaa:	89 c7                	mov    %eax,%edi
  802aac:	48 b8 17 28 80 00 00 	movabs $0x802817,%rax
  802ab3:	00 00 00 
  802ab6:	ff d0                	callq  *%rax
  802ab8:	eb 04                	jmp    802abe <fork+0x126>
  802aba:	90                   	nop
  802abb:	eb 01                	jmp    802abe <fork+0x126>
  802abd:	90                   	nop
  802abe:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802ac2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ac5:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  802ac8:	7c b2                	jl     802a7c <fork+0xe4>
  802aca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802acd:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  802ad2:	0f 86 4c ff ff ff    	jbe    802a24 <fork+0x8c>
  802ad8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802adb:	ba 07 00 00 00       	mov    $0x7,%edx
  802ae0:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  802ae5:	89 c7                	mov    %eax,%edi
  802ae7:	48 b8 fb 21 80 00 00 	movabs $0x8021fb,%rax
  802aee:	00 00 00 
  802af1:	ff d0                	callq  *%rax
  802af3:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802af6:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802afa:	79 30                	jns    802b2c <fork+0x194>
  802afc:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802aff:	89 c1                	mov    %eax,%ecx
  802b01:	48 ba 48 5d 80 00 00 	movabs $0x805d48,%rdx
  802b08:	00 00 00 
  802b0b:	be bc 00 00 00       	mov    $0xbc,%esi
  802b10:	48 bf d1 5c 80 00 00 	movabs $0x805cd1,%rdi
  802b17:	00 00 00 
  802b1a:	b8 00 00 00 00       	mov    $0x0,%eax
  802b1f:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  802b26:	00 00 00 
  802b29:	41 ff d0             	callq  *%r8
  802b2c:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802b33:	00 00 00 
  802b36:	48 8b 00             	mov    (%rax),%rax
  802b39:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  802b40:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b43:	48 89 d6             	mov    %rdx,%rsi
  802b46:	89 c7                	mov    %eax,%edi
  802b48:	48 b8 92 23 80 00 00 	movabs $0x802392,%rax
  802b4f:	00 00 00 
  802b52:	ff d0                	callq  *%rax
  802b54:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802b57:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802b5b:	79 30                	jns    802b8d <fork+0x1f5>
  802b5d:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802b60:	89 c1                	mov    %eax,%ecx
  802b62:	48 ba 68 5d 80 00 00 	movabs $0x805d68,%rdx
  802b69:	00 00 00 
  802b6c:	be c0 00 00 00       	mov    $0xc0,%esi
  802b71:	48 bf d1 5c 80 00 00 	movabs $0x805cd1,%rdi
  802b78:	00 00 00 
  802b7b:	b8 00 00 00 00       	mov    $0x0,%eax
  802b80:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  802b87:	00 00 00 
  802b8a:	41 ff d0             	callq  *%r8
  802b8d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b90:	be 02 00 00 00       	mov    $0x2,%esi
  802b95:	89 c7                	mov    %eax,%edi
  802b97:	48 b8 f9 22 80 00 00 	movabs $0x8022f9,%rax
  802b9e:	00 00 00 
  802ba1:	ff d0                	callq  *%rax
  802ba3:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802ba6:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802baa:	79 30                	jns    802bdc <fork+0x244>
  802bac:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802baf:	89 c1                	mov    %eax,%ecx
  802bb1:	48 ba 87 5d 80 00 00 	movabs $0x805d87,%rdx
  802bb8:	00 00 00 
  802bbb:	be c5 00 00 00       	mov    $0xc5,%esi
  802bc0:	48 bf d1 5c 80 00 00 	movabs $0x805cd1,%rdi
  802bc7:	00 00 00 
  802bca:	b8 00 00 00 00       	mov    $0x0,%eax
  802bcf:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  802bd6:	00 00 00 
  802bd9:	41 ff d0             	callq  *%r8
  802bdc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802bdf:	c9                   	leaveq 
  802be0:	c3                   	retq   

0000000000802be1 <sfork>:
  802be1:	55                   	push   %rbp
  802be2:	48 89 e5             	mov    %rsp,%rbp
  802be5:	48 ba 9e 5d 80 00 00 	movabs $0x805d9e,%rdx
  802bec:	00 00 00 
  802bef:	be d2 00 00 00       	mov    $0xd2,%esi
  802bf4:	48 bf d1 5c 80 00 00 	movabs $0x805cd1,%rdi
  802bfb:	00 00 00 
  802bfe:	b8 00 00 00 00       	mov    $0x0,%eax
  802c03:	48 b9 01 0b 80 00 00 	movabs $0x800b01,%rcx
  802c0a:	00 00 00 
  802c0d:	ff d1                	callq  *%rcx

0000000000802c0f <ipc_recv>:
  802c0f:	55                   	push   %rbp
  802c10:	48 89 e5             	mov    %rsp,%rbp
  802c13:	48 83 ec 30          	sub    $0x30,%rsp
  802c17:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802c1b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802c1f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802c23:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802c28:	75 0e                	jne    802c38 <ipc_recv+0x29>
  802c2a:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802c31:	00 00 00 
  802c34:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802c38:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c3c:	48 89 c7             	mov    %rax,%rdi
  802c3f:	48 b8 35 24 80 00 00 	movabs $0x802435,%rax
  802c46:	00 00 00 
  802c49:	ff d0                	callq  *%rax
  802c4b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c4e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c52:	79 27                	jns    802c7b <ipc_recv+0x6c>
  802c54:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802c59:	74 0a                	je     802c65 <ipc_recv+0x56>
  802c5b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c5f:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  802c65:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802c6a:	74 0a                	je     802c76 <ipc_recv+0x67>
  802c6c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c70:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  802c76:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c79:	eb 53                	jmp    802cce <ipc_recv+0xbf>
  802c7b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802c80:	74 19                	je     802c9b <ipc_recv+0x8c>
  802c82:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802c89:	00 00 00 
  802c8c:	48 8b 00             	mov    (%rax),%rax
  802c8f:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  802c95:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c99:	89 10                	mov    %edx,(%rax)
  802c9b:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802ca0:	74 19                	je     802cbb <ipc_recv+0xac>
  802ca2:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802ca9:	00 00 00 
  802cac:	48 8b 00             	mov    (%rax),%rax
  802caf:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  802cb5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802cb9:	89 10                	mov    %edx,(%rax)
  802cbb:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802cc2:	00 00 00 
  802cc5:	48 8b 00             	mov    (%rax),%rax
  802cc8:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  802cce:	c9                   	leaveq 
  802ccf:	c3                   	retq   

0000000000802cd0 <ipc_send>:
  802cd0:	55                   	push   %rbp
  802cd1:	48 89 e5             	mov    %rsp,%rbp
  802cd4:	48 83 ec 30          	sub    $0x30,%rsp
  802cd8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802cdb:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802cde:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  802ce2:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  802ce5:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802cea:	75 1c                	jne    802d08 <ipc_send+0x38>
  802cec:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802cf3:	00 00 00 
  802cf6:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802cfa:	eb 0c                	jmp    802d08 <ipc_send+0x38>
  802cfc:	48 b8 be 21 80 00 00 	movabs $0x8021be,%rax
  802d03:	00 00 00 
  802d06:	ff d0                	callq  *%rax
  802d08:	8b 75 e8             	mov    -0x18(%rbp),%esi
  802d0b:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  802d0e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802d12:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d15:	89 c7                	mov    %eax,%edi
  802d17:	48 b8 de 23 80 00 00 	movabs $0x8023de,%rax
  802d1e:	00 00 00 
  802d21:	ff d0                	callq  *%rax
  802d23:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d26:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  802d2a:	74 d0                	je     802cfc <ipc_send+0x2c>
  802d2c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d30:	79 30                	jns    802d62 <ipc_send+0x92>
  802d32:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d35:	89 c1                	mov    %eax,%ecx
  802d37:	48 ba b8 5d 80 00 00 	movabs $0x805db8,%rdx
  802d3e:	00 00 00 
  802d41:	be 44 00 00 00       	mov    $0x44,%esi
  802d46:	48 bf ce 5d 80 00 00 	movabs $0x805dce,%rdi
  802d4d:	00 00 00 
  802d50:	b8 00 00 00 00       	mov    $0x0,%eax
  802d55:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  802d5c:	00 00 00 
  802d5f:	41 ff d0             	callq  *%r8
  802d62:	90                   	nop
  802d63:	c9                   	leaveq 
  802d64:	c3                   	retq   

0000000000802d65 <ipc_host_recv>:
  802d65:	55                   	push   %rbp
  802d66:	48 89 e5             	mov    %rsp,%rbp
  802d69:	48 83 ec 10          	sub    $0x10,%rsp
  802d6d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802d71:	48 ba e0 5d 80 00 00 	movabs $0x805de0,%rdx
  802d78:	00 00 00 
  802d7b:	be 4e 00 00 00       	mov    $0x4e,%esi
  802d80:	48 bf ce 5d 80 00 00 	movabs $0x805dce,%rdi
  802d87:	00 00 00 
  802d8a:	b8 00 00 00 00       	mov    $0x0,%eax
  802d8f:	48 b9 01 0b 80 00 00 	movabs $0x800b01,%rcx
  802d96:	00 00 00 
  802d99:	ff d1                	callq  *%rcx

0000000000802d9b <ipc_host_send>:
  802d9b:	55                   	push   %rbp
  802d9c:	48 89 e5             	mov    %rsp,%rbp
  802d9f:	48 83 ec 20          	sub    $0x20,%rsp
  802da3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802da6:	89 75 f8             	mov    %esi,-0x8(%rbp)
  802da9:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  802dad:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  802db0:	48 ba 00 5e 80 00 00 	movabs $0x805e00,%rdx
  802db7:	00 00 00 
  802dba:	be 58 00 00 00       	mov    $0x58,%esi
  802dbf:	48 bf ce 5d 80 00 00 	movabs $0x805dce,%rdi
  802dc6:	00 00 00 
  802dc9:	b8 00 00 00 00       	mov    $0x0,%eax
  802dce:	48 b9 01 0b 80 00 00 	movabs $0x800b01,%rcx
  802dd5:	00 00 00 
  802dd8:	ff d1                	callq  *%rcx

0000000000802dda <ipc_find_env>:
  802dda:	55                   	push   %rbp
  802ddb:	48 89 e5             	mov    %rsp,%rbp
  802dde:	48 83 ec 18          	sub    $0x18,%rsp
  802de2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802de5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802dec:	eb 4d                	jmp    802e3b <ipc_find_env+0x61>
  802dee:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802df5:	00 00 00 
  802df8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dfb:	48 98                	cltq   
  802dfd:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802e04:	48 01 d0             	add    %rdx,%rax
  802e07:	48 05 d0 00 00 00    	add    $0xd0,%rax
  802e0d:	8b 00                	mov    (%rax),%eax
  802e0f:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802e12:	75 23                	jne    802e37 <ipc_find_env+0x5d>
  802e14:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802e1b:	00 00 00 
  802e1e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e21:	48 98                	cltq   
  802e23:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802e2a:	48 01 d0             	add    %rdx,%rax
  802e2d:	48 05 c8 00 00 00    	add    $0xc8,%rax
  802e33:	8b 00                	mov    (%rax),%eax
  802e35:	eb 12                	jmp    802e49 <ipc_find_env+0x6f>
  802e37:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802e3b:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  802e42:	7e aa                	jle    802dee <ipc_find_env+0x14>
  802e44:	b8 00 00 00 00       	mov    $0x0,%eax
  802e49:	c9                   	leaveq 
  802e4a:	c3                   	retq   

0000000000802e4b <fd2num>:
  802e4b:	55                   	push   %rbp
  802e4c:	48 89 e5             	mov    %rsp,%rbp
  802e4f:	48 83 ec 08          	sub    $0x8,%rsp
  802e53:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802e57:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802e5b:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802e62:	ff ff ff 
  802e65:	48 01 d0             	add    %rdx,%rax
  802e68:	48 c1 e8 0c          	shr    $0xc,%rax
  802e6c:	c9                   	leaveq 
  802e6d:	c3                   	retq   

0000000000802e6e <fd2data>:
  802e6e:	55                   	push   %rbp
  802e6f:	48 89 e5             	mov    %rsp,%rbp
  802e72:	48 83 ec 08          	sub    $0x8,%rsp
  802e76:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802e7a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802e7e:	48 89 c7             	mov    %rax,%rdi
  802e81:	48 b8 4b 2e 80 00 00 	movabs $0x802e4b,%rax
  802e88:	00 00 00 
  802e8b:	ff d0                	callq  *%rax
  802e8d:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802e93:	48 c1 e0 0c          	shl    $0xc,%rax
  802e97:	c9                   	leaveq 
  802e98:	c3                   	retq   

0000000000802e99 <fd_alloc>:
  802e99:	55                   	push   %rbp
  802e9a:	48 89 e5             	mov    %rsp,%rbp
  802e9d:	48 83 ec 18          	sub    $0x18,%rsp
  802ea1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802ea5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802eac:	eb 6b                	jmp    802f19 <fd_alloc+0x80>
  802eae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eb1:	48 98                	cltq   
  802eb3:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802eb9:	48 c1 e0 0c          	shl    $0xc,%rax
  802ebd:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802ec1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ec5:	48 c1 e8 15          	shr    $0x15,%rax
  802ec9:	48 89 c2             	mov    %rax,%rdx
  802ecc:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802ed3:	01 00 00 
  802ed6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802eda:	83 e0 01             	and    $0x1,%eax
  802edd:	48 85 c0             	test   %rax,%rax
  802ee0:	74 21                	je     802f03 <fd_alloc+0x6a>
  802ee2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ee6:	48 c1 e8 0c          	shr    $0xc,%rax
  802eea:	48 89 c2             	mov    %rax,%rdx
  802eed:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802ef4:	01 00 00 
  802ef7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802efb:	83 e0 01             	and    $0x1,%eax
  802efe:	48 85 c0             	test   %rax,%rax
  802f01:	75 12                	jne    802f15 <fd_alloc+0x7c>
  802f03:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f07:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802f0b:	48 89 10             	mov    %rdx,(%rax)
  802f0e:	b8 00 00 00 00       	mov    $0x0,%eax
  802f13:	eb 1a                	jmp    802f2f <fd_alloc+0x96>
  802f15:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802f19:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802f1d:	7e 8f                	jle    802eae <fd_alloc+0x15>
  802f1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f23:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802f2a:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802f2f:	c9                   	leaveq 
  802f30:	c3                   	retq   

0000000000802f31 <fd_lookup>:
  802f31:	55                   	push   %rbp
  802f32:	48 89 e5             	mov    %rsp,%rbp
  802f35:	48 83 ec 20          	sub    $0x20,%rsp
  802f39:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f3c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802f40:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802f44:	78 06                	js     802f4c <fd_lookup+0x1b>
  802f46:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802f4a:	7e 07                	jle    802f53 <fd_lookup+0x22>
  802f4c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802f51:	eb 6c                	jmp    802fbf <fd_lookup+0x8e>
  802f53:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f56:	48 98                	cltq   
  802f58:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802f5e:	48 c1 e0 0c          	shl    $0xc,%rax
  802f62:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802f66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f6a:	48 c1 e8 15          	shr    $0x15,%rax
  802f6e:	48 89 c2             	mov    %rax,%rdx
  802f71:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802f78:	01 00 00 
  802f7b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802f7f:	83 e0 01             	and    $0x1,%eax
  802f82:	48 85 c0             	test   %rax,%rax
  802f85:	74 21                	je     802fa8 <fd_lookup+0x77>
  802f87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f8b:	48 c1 e8 0c          	shr    $0xc,%rax
  802f8f:	48 89 c2             	mov    %rax,%rdx
  802f92:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802f99:	01 00 00 
  802f9c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802fa0:	83 e0 01             	and    $0x1,%eax
  802fa3:	48 85 c0             	test   %rax,%rax
  802fa6:	75 07                	jne    802faf <fd_lookup+0x7e>
  802fa8:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802fad:	eb 10                	jmp    802fbf <fd_lookup+0x8e>
  802faf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802fb3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802fb7:	48 89 10             	mov    %rdx,(%rax)
  802fba:	b8 00 00 00 00       	mov    $0x0,%eax
  802fbf:	c9                   	leaveq 
  802fc0:	c3                   	retq   

0000000000802fc1 <fd_close>:
  802fc1:	55                   	push   %rbp
  802fc2:	48 89 e5             	mov    %rsp,%rbp
  802fc5:	48 83 ec 30          	sub    $0x30,%rsp
  802fc9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802fcd:	89 f0                	mov    %esi,%eax
  802fcf:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802fd2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802fd6:	48 89 c7             	mov    %rax,%rdi
  802fd9:	48 b8 4b 2e 80 00 00 	movabs $0x802e4b,%rax
  802fe0:	00 00 00 
  802fe3:	ff d0                	callq  *%rax
  802fe5:	89 c2                	mov    %eax,%edx
  802fe7:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802feb:	48 89 c6             	mov    %rax,%rsi
  802fee:	89 d7                	mov    %edx,%edi
  802ff0:	48 b8 31 2f 80 00 00 	movabs $0x802f31,%rax
  802ff7:	00 00 00 
  802ffa:	ff d0                	callq  *%rax
  802ffc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fff:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803003:	78 0a                	js     80300f <fd_close+0x4e>
  803005:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803009:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  80300d:	74 12                	je     803021 <fd_close+0x60>
  80300f:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  803013:	74 05                	je     80301a <fd_close+0x59>
  803015:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803018:	eb 70                	jmp    80308a <fd_close+0xc9>
  80301a:	b8 00 00 00 00       	mov    $0x0,%eax
  80301f:	eb 69                	jmp    80308a <fd_close+0xc9>
  803021:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803025:	8b 00                	mov    (%rax),%eax
  803027:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80302b:	48 89 d6             	mov    %rdx,%rsi
  80302e:	89 c7                	mov    %eax,%edi
  803030:	48 b8 8c 30 80 00 00 	movabs $0x80308c,%rax
  803037:	00 00 00 
  80303a:	ff d0                	callq  *%rax
  80303c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80303f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803043:	78 2a                	js     80306f <fd_close+0xae>
  803045:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803049:	48 8b 40 20          	mov    0x20(%rax),%rax
  80304d:	48 85 c0             	test   %rax,%rax
  803050:	74 16                	je     803068 <fd_close+0xa7>
  803052:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803056:	48 8b 40 20          	mov    0x20(%rax),%rax
  80305a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80305e:	48 89 d7             	mov    %rdx,%rdi
  803061:	ff d0                	callq  *%rax
  803063:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803066:	eb 07                	jmp    80306f <fd_close+0xae>
  803068:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80306f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803073:	48 89 c6             	mov    %rax,%rsi
  803076:	bf 00 00 00 00       	mov    $0x0,%edi
  80307b:	48 b8 ad 22 80 00 00 	movabs $0x8022ad,%rax
  803082:	00 00 00 
  803085:	ff d0                	callq  *%rax
  803087:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80308a:	c9                   	leaveq 
  80308b:	c3                   	retq   

000000000080308c <dev_lookup>:
  80308c:	55                   	push   %rbp
  80308d:	48 89 e5             	mov    %rsp,%rbp
  803090:	48 83 ec 20          	sub    $0x20,%rsp
  803094:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803097:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80309b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8030a2:	eb 41                	jmp    8030e5 <dev_lookup+0x59>
  8030a4:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8030ab:	00 00 00 
  8030ae:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8030b1:	48 63 d2             	movslq %edx,%rdx
  8030b4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8030b8:	8b 00                	mov    (%rax),%eax
  8030ba:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8030bd:	75 22                	jne    8030e1 <dev_lookup+0x55>
  8030bf:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8030c6:	00 00 00 
  8030c9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8030cc:	48 63 d2             	movslq %edx,%rdx
  8030cf:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8030d3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8030d7:	48 89 10             	mov    %rdx,(%rax)
  8030da:	b8 00 00 00 00       	mov    $0x0,%eax
  8030df:	eb 60                	jmp    803141 <dev_lookup+0xb5>
  8030e1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8030e5:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8030ec:	00 00 00 
  8030ef:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8030f2:	48 63 d2             	movslq %edx,%rdx
  8030f5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8030f9:	48 85 c0             	test   %rax,%rax
  8030fc:	75 a6                	jne    8030a4 <dev_lookup+0x18>
  8030fe:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  803105:	00 00 00 
  803108:	48 8b 00             	mov    (%rax),%rax
  80310b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803111:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803114:	89 c6                	mov    %eax,%esi
  803116:	48 bf 20 5e 80 00 00 	movabs $0x805e20,%rdi
  80311d:	00 00 00 
  803120:	b8 00 00 00 00       	mov    $0x0,%eax
  803125:	48 b9 3b 0d 80 00 00 	movabs $0x800d3b,%rcx
  80312c:	00 00 00 
  80312f:	ff d1                	callq  *%rcx
  803131:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803135:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80313c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803141:	c9                   	leaveq 
  803142:	c3                   	retq   

0000000000803143 <close>:
  803143:	55                   	push   %rbp
  803144:	48 89 e5             	mov    %rsp,%rbp
  803147:	48 83 ec 20          	sub    $0x20,%rsp
  80314b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80314e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803152:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803155:	48 89 d6             	mov    %rdx,%rsi
  803158:	89 c7                	mov    %eax,%edi
  80315a:	48 b8 31 2f 80 00 00 	movabs $0x802f31,%rax
  803161:	00 00 00 
  803164:	ff d0                	callq  *%rax
  803166:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803169:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80316d:	79 05                	jns    803174 <close+0x31>
  80316f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803172:	eb 18                	jmp    80318c <close+0x49>
  803174:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803178:	be 01 00 00 00       	mov    $0x1,%esi
  80317d:	48 89 c7             	mov    %rax,%rdi
  803180:	48 b8 c1 2f 80 00 00 	movabs $0x802fc1,%rax
  803187:	00 00 00 
  80318a:	ff d0                	callq  *%rax
  80318c:	c9                   	leaveq 
  80318d:	c3                   	retq   

000000000080318e <close_all>:
  80318e:	55                   	push   %rbp
  80318f:	48 89 e5             	mov    %rsp,%rbp
  803192:	48 83 ec 10          	sub    $0x10,%rsp
  803196:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80319d:	eb 15                	jmp    8031b4 <close_all+0x26>
  80319f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031a2:	89 c7                	mov    %eax,%edi
  8031a4:	48 b8 43 31 80 00 00 	movabs $0x803143,%rax
  8031ab:	00 00 00 
  8031ae:	ff d0                	callq  *%rax
  8031b0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8031b4:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8031b8:	7e e5                	jle    80319f <close_all+0x11>
  8031ba:	90                   	nop
  8031bb:	c9                   	leaveq 
  8031bc:	c3                   	retq   

00000000008031bd <dup>:
  8031bd:	55                   	push   %rbp
  8031be:	48 89 e5             	mov    %rsp,%rbp
  8031c1:	48 83 ec 40          	sub    $0x40,%rsp
  8031c5:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8031c8:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8031cb:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8031cf:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8031d2:	48 89 d6             	mov    %rdx,%rsi
  8031d5:	89 c7                	mov    %eax,%edi
  8031d7:	48 b8 31 2f 80 00 00 	movabs $0x802f31,%rax
  8031de:	00 00 00 
  8031e1:	ff d0                	callq  *%rax
  8031e3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031e6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031ea:	79 08                	jns    8031f4 <dup+0x37>
  8031ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031ef:	e9 70 01 00 00       	jmpq   803364 <dup+0x1a7>
  8031f4:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8031f7:	89 c7                	mov    %eax,%edi
  8031f9:	48 b8 43 31 80 00 00 	movabs $0x803143,%rax
  803200:	00 00 00 
  803203:	ff d0                	callq  *%rax
  803205:	8b 45 c8             	mov    -0x38(%rbp),%eax
  803208:	48 98                	cltq   
  80320a:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  803210:	48 c1 e0 0c          	shl    $0xc,%rax
  803214:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803218:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80321c:	48 89 c7             	mov    %rax,%rdi
  80321f:	48 b8 6e 2e 80 00 00 	movabs $0x802e6e,%rax
  803226:	00 00 00 
  803229:	ff d0                	callq  *%rax
  80322b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80322f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803233:	48 89 c7             	mov    %rax,%rdi
  803236:	48 b8 6e 2e 80 00 00 	movabs $0x802e6e,%rax
  80323d:	00 00 00 
  803240:	ff d0                	callq  *%rax
  803242:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803246:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80324a:	48 c1 e8 15          	shr    $0x15,%rax
  80324e:	48 89 c2             	mov    %rax,%rdx
  803251:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803258:	01 00 00 
  80325b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80325f:	83 e0 01             	and    $0x1,%eax
  803262:	48 85 c0             	test   %rax,%rax
  803265:	74 71                	je     8032d8 <dup+0x11b>
  803267:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80326b:	48 c1 e8 0c          	shr    $0xc,%rax
  80326f:	48 89 c2             	mov    %rax,%rdx
  803272:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803279:	01 00 00 
  80327c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803280:	83 e0 01             	and    $0x1,%eax
  803283:	48 85 c0             	test   %rax,%rax
  803286:	74 50                	je     8032d8 <dup+0x11b>
  803288:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80328c:	48 c1 e8 0c          	shr    $0xc,%rax
  803290:	48 89 c2             	mov    %rax,%rdx
  803293:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80329a:	01 00 00 
  80329d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8032a1:	25 07 0e 00 00       	and    $0xe07,%eax
  8032a6:	89 c1                	mov    %eax,%ecx
  8032a8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8032ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032b0:	41 89 c8             	mov    %ecx,%r8d
  8032b3:	48 89 d1             	mov    %rdx,%rcx
  8032b6:	ba 00 00 00 00       	mov    $0x0,%edx
  8032bb:	48 89 c6             	mov    %rax,%rsi
  8032be:	bf 00 00 00 00       	mov    $0x0,%edi
  8032c3:	48 b8 4d 22 80 00 00 	movabs $0x80224d,%rax
  8032ca:	00 00 00 
  8032cd:	ff d0                	callq  *%rax
  8032cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032d2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032d6:	78 55                	js     80332d <dup+0x170>
  8032d8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8032dc:	48 c1 e8 0c          	shr    $0xc,%rax
  8032e0:	48 89 c2             	mov    %rax,%rdx
  8032e3:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8032ea:	01 00 00 
  8032ed:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8032f1:	25 07 0e 00 00       	and    $0xe07,%eax
  8032f6:	89 c1                	mov    %eax,%ecx
  8032f8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8032fc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803300:	41 89 c8             	mov    %ecx,%r8d
  803303:	48 89 d1             	mov    %rdx,%rcx
  803306:	ba 00 00 00 00       	mov    $0x0,%edx
  80330b:	48 89 c6             	mov    %rax,%rsi
  80330e:	bf 00 00 00 00       	mov    $0x0,%edi
  803313:	48 b8 4d 22 80 00 00 	movabs $0x80224d,%rax
  80331a:	00 00 00 
  80331d:	ff d0                	callq  *%rax
  80331f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803322:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803326:	78 08                	js     803330 <dup+0x173>
  803328:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80332b:	eb 37                	jmp    803364 <dup+0x1a7>
  80332d:	90                   	nop
  80332e:	eb 01                	jmp    803331 <dup+0x174>
  803330:	90                   	nop
  803331:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803335:	48 89 c6             	mov    %rax,%rsi
  803338:	bf 00 00 00 00       	mov    $0x0,%edi
  80333d:	48 b8 ad 22 80 00 00 	movabs $0x8022ad,%rax
  803344:	00 00 00 
  803347:	ff d0                	callq  *%rax
  803349:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80334d:	48 89 c6             	mov    %rax,%rsi
  803350:	bf 00 00 00 00       	mov    $0x0,%edi
  803355:	48 b8 ad 22 80 00 00 	movabs $0x8022ad,%rax
  80335c:	00 00 00 
  80335f:	ff d0                	callq  *%rax
  803361:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803364:	c9                   	leaveq 
  803365:	c3                   	retq   

0000000000803366 <read>:
  803366:	55                   	push   %rbp
  803367:	48 89 e5             	mov    %rsp,%rbp
  80336a:	48 83 ec 40          	sub    $0x40,%rsp
  80336e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803371:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803375:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803379:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80337d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803380:	48 89 d6             	mov    %rdx,%rsi
  803383:	89 c7                	mov    %eax,%edi
  803385:	48 b8 31 2f 80 00 00 	movabs $0x802f31,%rax
  80338c:	00 00 00 
  80338f:	ff d0                	callq  *%rax
  803391:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803394:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803398:	78 24                	js     8033be <read+0x58>
  80339a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80339e:	8b 00                	mov    (%rax),%eax
  8033a0:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8033a4:	48 89 d6             	mov    %rdx,%rsi
  8033a7:	89 c7                	mov    %eax,%edi
  8033a9:	48 b8 8c 30 80 00 00 	movabs $0x80308c,%rax
  8033b0:	00 00 00 
  8033b3:	ff d0                	callq  *%rax
  8033b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033b8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033bc:	79 05                	jns    8033c3 <read+0x5d>
  8033be:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033c1:	eb 76                	jmp    803439 <read+0xd3>
  8033c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033c7:	8b 40 08             	mov    0x8(%rax),%eax
  8033ca:	83 e0 03             	and    $0x3,%eax
  8033cd:	83 f8 01             	cmp    $0x1,%eax
  8033d0:	75 3a                	jne    80340c <read+0xa6>
  8033d2:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  8033d9:	00 00 00 
  8033dc:	48 8b 00             	mov    (%rax),%rax
  8033df:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8033e5:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8033e8:	89 c6                	mov    %eax,%esi
  8033ea:	48 bf 3f 5e 80 00 00 	movabs $0x805e3f,%rdi
  8033f1:	00 00 00 
  8033f4:	b8 00 00 00 00       	mov    $0x0,%eax
  8033f9:	48 b9 3b 0d 80 00 00 	movabs $0x800d3b,%rcx
  803400:	00 00 00 
  803403:	ff d1                	callq  *%rcx
  803405:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80340a:	eb 2d                	jmp    803439 <read+0xd3>
  80340c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803410:	48 8b 40 10          	mov    0x10(%rax),%rax
  803414:	48 85 c0             	test   %rax,%rax
  803417:	75 07                	jne    803420 <read+0xba>
  803419:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80341e:	eb 19                	jmp    803439 <read+0xd3>
  803420:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803424:	48 8b 40 10          	mov    0x10(%rax),%rax
  803428:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80342c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803430:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  803434:	48 89 cf             	mov    %rcx,%rdi
  803437:	ff d0                	callq  *%rax
  803439:	c9                   	leaveq 
  80343a:	c3                   	retq   

000000000080343b <readn>:
  80343b:	55                   	push   %rbp
  80343c:	48 89 e5             	mov    %rsp,%rbp
  80343f:	48 83 ec 30          	sub    $0x30,%rsp
  803443:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803446:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80344a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80344e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803455:	eb 47                	jmp    80349e <readn+0x63>
  803457:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80345a:	48 98                	cltq   
  80345c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803460:	48 29 c2             	sub    %rax,%rdx
  803463:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803466:	48 63 c8             	movslq %eax,%rcx
  803469:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80346d:	48 01 c1             	add    %rax,%rcx
  803470:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803473:	48 89 ce             	mov    %rcx,%rsi
  803476:	89 c7                	mov    %eax,%edi
  803478:	48 b8 66 33 80 00 00 	movabs $0x803366,%rax
  80347f:	00 00 00 
  803482:	ff d0                	callq  *%rax
  803484:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803487:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80348b:	79 05                	jns    803492 <readn+0x57>
  80348d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803490:	eb 1d                	jmp    8034af <readn+0x74>
  803492:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803496:	74 13                	je     8034ab <readn+0x70>
  803498:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80349b:	01 45 fc             	add    %eax,-0x4(%rbp)
  80349e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034a1:	48 98                	cltq   
  8034a3:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8034a7:	72 ae                	jb     803457 <readn+0x1c>
  8034a9:	eb 01                	jmp    8034ac <readn+0x71>
  8034ab:	90                   	nop
  8034ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034af:	c9                   	leaveq 
  8034b0:	c3                   	retq   

00000000008034b1 <write>:
  8034b1:	55                   	push   %rbp
  8034b2:	48 89 e5             	mov    %rsp,%rbp
  8034b5:	48 83 ec 40          	sub    $0x40,%rsp
  8034b9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8034bc:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8034c0:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8034c4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8034c8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8034cb:	48 89 d6             	mov    %rdx,%rsi
  8034ce:	89 c7                	mov    %eax,%edi
  8034d0:	48 b8 31 2f 80 00 00 	movabs $0x802f31,%rax
  8034d7:	00 00 00 
  8034da:	ff d0                	callq  *%rax
  8034dc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034df:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034e3:	78 24                	js     803509 <write+0x58>
  8034e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034e9:	8b 00                	mov    (%rax),%eax
  8034eb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8034ef:	48 89 d6             	mov    %rdx,%rsi
  8034f2:	89 c7                	mov    %eax,%edi
  8034f4:	48 b8 8c 30 80 00 00 	movabs $0x80308c,%rax
  8034fb:	00 00 00 
  8034fe:	ff d0                	callq  *%rax
  803500:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803503:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803507:	79 05                	jns    80350e <write+0x5d>
  803509:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80350c:	eb 75                	jmp    803583 <write+0xd2>
  80350e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803512:	8b 40 08             	mov    0x8(%rax),%eax
  803515:	83 e0 03             	and    $0x3,%eax
  803518:	85 c0                	test   %eax,%eax
  80351a:	75 3a                	jne    803556 <write+0xa5>
  80351c:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  803523:	00 00 00 
  803526:	48 8b 00             	mov    (%rax),%rax
  803529:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80352f:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803532:	89 c6                	mov    %eax,%esi
  803534:	48 bf 5b 5e 80 00 00 	movabs $0x805e5b,%rdi
  80353b:	00 00 00 
  80353e:	b8 00 00 00 00       	mov    $0x0,%eax
  803543:	48 b9 3b 0d 80 00 00 	movabs $0x800d3b,%rcx
  80354a:	00 00 00 
  80354d:	ff d1                	callq  *%rcx
  80354f:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803554:	eb 2d                	jmp    803583 <write+0xd2>
  803556:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80355a:	48 8b 40 18          	mov    0x18(%rax),%rax
  80355e:	48 85 c0             	test   %rax,%rax
  803561:	75 07                	jne    80356a <write+0xb9>
  803563:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803568:	eb 19                	jmp    803583 <write+0xd2>
  80356a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80356e:	48 8b 40 18          	mov    0x18(%rax),%rax
  803572:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803576:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80357a:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80357e:	48 89 cf             	mov    %rcx,%rdi
  803581:	ff d0                	callq  *%rax
  803583:	c9                   	leaveq 
  803584:	c3                   	retq   

0000000000803585 <seek>:
  803585:	55                   	push   %rbp
  803586:	48 89 e5             	mov    %rsp,%rbp
  803589:	48 83 ec 18          	sub    $0x18,%rsp
  80358d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803590:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803593:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803597:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80359a:	48 89 d6             	mov    %rdx,%rsi
  80359d:	89 c7                	mov    %eax,%edi
  80359f:	48 b8 31 2f 80 00 00 	movabs $0x802f31,%rax
  8035a6:	00 00 00 
  8035a9:	ff d0                	callq  *%rax
  8035ab:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035ae:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035b2:	79 05                	jns    8035b9 <seek+0x34>
  8035b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035b7:	eb 0f                	jmp    8035c8 <seek+0x43>
  8035b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035bd:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8035c0:	89 50 04             	mov    %edx,0x4(%rax)
  8035c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8035c8:	c9                   	leaveq 
  8035c9:	c3                   	retq   

00000000008035ca <ftruncate>:
  8035ca:	55                   	push   %rbp
  8035cb:	48 89 e5             	mov    %rsp,%rbp
  8035ce:	48 83 ec 30          	sub    $0x30,%rsp
  8035d2:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8035d5:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8035d8:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8035dc:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8035df:	48 89 d6             	mov    %rdx,%rsi
  8035e2:	89 c7                	mov    %eax,%edi
  8035e4:	48 b8 31 2f 80 00 00 	movabs $0x802f31,%rax
  8035eb:	00 00 00 
  8035ee:	ff d0                	callq  *%rax
  8035f0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035f3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035f7:	78 24                	js     80361d <ftruncate+0x53>
  8035f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035fd:	8b 00                	mov    (%rax),%eax
  8035ff:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803603:	48 89 d6             	mov    %rdx,%rsi
  803606:	89 c7                	mov    %eax,%edi
  803608:	48 b8 8c 30 80 00 00 	movabs $0x80308c,%rax
  80360f:	00 00 00 
  803612:	ff d0                	callq  *%rax
  803614:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803617:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80361b:	79 05                	jns    803622 <ftruncate+0x58>
  80361d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803620:	eb 72                	jmp    803694 <ftruncate+0xca>
  803622:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803626:	8b 40 08             	mov    0x8(%rax),%eax
  803629:	83 e0 03             	and    $0x3,%eax
  80362c:	85 c0                	test   %eax,%eax
  80362e:	75 3a                	jne    80366a <ftruncate+0xa0>
  803630:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  803637:	00 00 00 
  80363a:	48 8b 00             	mov    (%rax),%rax
  80363d:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803643:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803646:	89 c6                	mov    %eax,%esi
  803648:	48 bf 78 5e 80 00 00 	movabs $0x805e78,%rdi
  80364f:	00 00 00 
  803652:	b8 00 00 00 00       	mov    $0x0,%eax
  803657:	48 b9 3b 0d 80 00 00 	movabs $0x800d3b,%rcx
  80365e:	00 00 00 
  803661:	ff d1                	callq  *%rcx
  803663:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803668:	eb 2a                	jmp    803694 <ftruncate+0xca>
  80366a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80366e:	48 8b 40 30          	mov    0x30(%rax),%rax
  803672:	48 85 c0             	test   %rax,%rax
  803675:	75 07                	jne    80367e <ftruncate+0xb4>
  803677:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80367c:	eb 16                	jmp    803694 <ftruncate+0xca>
  80367e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803682:	48 8b 40 30          	mov    0x30(%rax),%rax
  803686:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80368a:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  80368d:	89 ce                	mov    %ecx,%esi
  80368f:	48 89 d7             	mov    %rdx,%rdi
  803692:	ff d0                	callq  *%rax
  803694:	c9                   	leaveq 
  803695:	c3                   	retq   

0000000000803696 <fstat>:
  803696:	55                   	push   %rbp
  803697:	48 89 e5             	mov    %rsp,%rbp
  80369a:	48 83 ec 30          	sub    $0x30,%rsp
  80369e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8036a1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8036a5:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8036a9:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8036ac:	48 89 d6             	mov    %rdx,%rsi
  8036af:	89 c7                	mov    %eax,%edi
  8036b1:	48 b8 31 2f 80 00 00 	movabs $0x802f31,%rax
  8036b8:	00 00 00 
  8036bb:	ff d0                	callq  *%rax
  8036bd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036c0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036c4:	78 24                	js     8036ea <fstat+0x54>
  8036c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036ca:	8b 00                	mov    (%rax),%eax
  8036cc:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8036d0:	48 89 d6             	mov    %rdx,%rsi
  8036d3:	89 c7                	mov    %eax,%edi
  8036d5:	48 b8 8c 30 80 00 00 	movabs $0x80308c,%rax
  8036dc:	00 00 00 
  8036df:	ff d0                	callq  *%rax
  8036e1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036e4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036e8:	79 05                	jns    8036ef <fstat+0x59>
  8036ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036ed:	eb 5e                	jmp    80374d <fstat+0xb7>
  8036ef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036f3:	48 8b 40 28          	mov    0x28(%rax),%rax
  8036f7:	48 85 c0             	test   %rax,%rax
  8036fa:	75 07                	jne    803703 <fstat+0x6d>
  8036fc:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803701:	eb 4a                	jmp    80374d <fstat+0xb7>
  803703:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803707:	c6 00 00             	movb   $0x0,(%rax)
  80370a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80370e:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  803715:	00 00 00 
  803718:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80371c:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803723:	00 00 00 
  803726:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80372a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80372e:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  803735:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803739:	48 8b 40 28          	mov    0x28(%rax),%rax
  80373d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803741:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  803745:	48 89 ce             	mov    %rcx,%rsi
  803748:	48 89 d7             	mov    %rdx,%rdi
  80374b:	ff d0                	callq  *%rax
  80374d:	c9                   	leaveq 
  80374e:	c3                   	retq   

000000000080374f <stat>:
  80374f:	55                   	push   %rbp
  803750:	48 89 e5             	mov    %rsp,%rbp
  803753:	48 83 ec 20          	sub    $0x20,%rsp
  803757:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80375b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80375f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803763:	be 00 00 00 00       	mov    $0x0,%esi
  803768:	48 89 c7             	mov    %rax,%rdi
  80376b:	48 b8 3f 38 80 00 00 	movabs $0x80383f,%rax
  803772:	00 00 00 
  803775:	ff d0                	callq  *%rax
  803777:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80377a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80377e:	79 05                	jns    803785 <stat+0x36>
  803780:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803783:	eb 2f                	jmp    8037b4 <stat+0x65>
  803785:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803789:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80378c:	48 89 d6             	mov    %rdx,%rsi
  80378f:	89 c7                	mov    %eax,%edi
  803791:	48 b8 96 36 80 00 00 	movabs $0x803696,%rax
  803798:	00 00 00 
  80379b:	ff d0                	callq  *%rax
  80379d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8037a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037a3:	89 c7                	mov    %eax,%edi
  8037a5:	48 b8 43 31 80 00 00 	movabs $0x803143,%rax
  8037ac:	00 00 00 
  8037af:	ff d0                	callq  *%rax
  8037b1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8037b4:	c9                   	leaveq 
  8037b5:	c3                   	retq   

00000000008037b6 <fsipc>:
  8037b6:	55                   	push   %rbp
  8037b7:	48 89 e5             	mov    %rsp,%rbp
  8037ba:	48 83 ec 10          	sub    $0x10,%rsp
  8037be:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8037c1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8037c5:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8037cc:	00 00 00 
  8037cf:	8b 00                	mov    (%rax),%eax
  8037d1:	85 c0                	test   %eax,%eax
  8037d3:	75 1f                	jne    8037f4 <fsipc+0x3e>
  8037d5:	bf 01 00 00 00       	mov    $0x1,%edi
  8037da:	48 b8 da 2d 80 00 00 	movabs $0x802dda,%rax
  8037e1:	00 00 00 
  8037e4:	ff d0                	callq  *%rax
  8037e6:	89 c2                	mov    %eax,%edx
  8037e8:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8037ef:	00 00 00 
  8037f2:	89 10                	mov    %edx,(%rax)
  8037f4:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8037fb:	00 00 00 
  8037fe:	8b 00                	mov    (%rax),%eax
  803800:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803803:	b9 07 00 00 00       	mov    $0x7,%ecx
  803808:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  80380f:	00 00 00 
  803812:	89 c7                	mov    %eax,%edi
  803814:	48 b8 d0 2c 80 00 00 	movabs $0x802cd0,%rax
  80381b:	00 00 00 
  80381e:	ff d0                	callq  *%rax
  803820:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803824:	ba 00 00 00 00       	mov    $0x0,%edx
  803829:	48 89 c6             	mov    %rax,%rsi
  80382c:	bf 00 00 00 00       	mov    $0x0,%edi
  803831:	48 b8 0f 2c 80 00 00 	movabs $0x802c0f,%rax
  803838:	00 00 00 
  80383b:	ff d0                	callq  *%rax
  80383d:	c9                   	leaveq 
  80383e:	c3                   	retq   

000000000080383f <open>:
  80383f:	55                   	push   %rbp
  803840:	48 89 e5             	mov    %rsp,%rbp
  803843:	48 83 ec 20          	sub    $0x20,%rsp
  803847:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80384b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80384e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803852:	48 89 c7             	mov    %rax,%rdi
  803855:	48 b8 5f 18 80 00 00 	movabs $0x80185f,%rax
  80385c:	00 00 00 
  80385f:	ff d0                	callq  *%rax
  803861:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803866:	7e 0a                	jle    803872 <open+0x33>
  803868:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80386d:	e9 a5 00 00 00       	jmpq   803917 <open+0xd8>
  803872:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803876:	48 89 c7             	mov    %rax,%rdi
  803879:	48 b8 99 2e 80 00 00 	movabs $0x802e99,%rax
  803880:	00 00 00 
  803883:	ff d0                	callq  *%rax
  803885:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803888:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80388c:	79 08                	jns    803896 <open+0x57>
  80388e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803891:	e9 81 00 00 00       	jmpq   803917 <open+0xd8>
  803896:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80389a:	48 89 c6             	mov    %rax,%rsi
  80389d:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  8038a4:	00 00 00 
  8038a7:	48 b8 cb 18 80 00 00 	movabs $0x8018cb,%rax
  8038ae:	00 00 00 
  8038b1:	ff d0                	callq  *%rax
  8038b3:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8038ba:	00 00 00 
  8038bd:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8038c0:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8038c6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038ca:	48 89 c6             	mov    %rax,%rsi
  8038cd:	bf 01 00 00 00       	mov    $0x1,%edi
  8038d2:	48 b8 b6 37 80 00 00 	movabs $0x8037b6,%rax
  8038d9:	00 00 00 
  8038dc:	ff d0                	callq  *%rax
  8038de:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038e1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038e5:	79 1d                	jns    803904 <open+0xc5>
  8038e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038eb:	be 00 00 00 00       	mov    $0x0,%esi
  8038f0:	48 89 c7             	mov    %rax,%rdi
  8038f3:	48 b8 c1 2f 80 00 00 	movabs $0x802fc1,%rax
  8038fa:	00 00 00 
  8038fd:	ff d0                	callq  *%rax
  8038ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803902:	eb 13                	jmp    803917 <open+0xd8>
  803904:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803908:	48 89 c7             	mov    %rax,%rdi
  80390b:	48 b8 4b 2e 80 00 00 	movabs $0x802e4b,%rax
  803912:	00 00 00 
  803915:	ff d0                	callq  *%rax
  803917:	c9                   	leaveq 
  803918:	c3                   	retq   

0000000000803919 <devfile_flush>:
  803919:	55                   	push   %rbp
  80391a:	48 89 e5             	mov    %rsp,%rbp
  80391d:	48 83 ec 10          	sub    $0x10,%rsp
  803921:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803925:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803929:	8b 50 0c             	mov    0xc(%rax),%edx
  80392c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803933:	00 00 00 
  803936:	89 10                	mov    %edx,(%rax)
  803938:	be 00 00 00 00       	mov    $0x0,%esi
  80393d:	bf 06 00 00 00       	mov    $0x6,%edi
  803942:	48 b8 b6 37 80 00 00 	movabs $0x8037b6,%rax
  803949:	00 00 00 
  80394c:	ff d0                	callq  *%rax
  80394e:	c9                   	leaveq 
  80394f:	c3                   	retq   

0000000000803950 <devfile_read>:
  803950:	55                   	push   %rbp
  803951:	48 89 e5             	mov    %rsp,%rbp
  803954:	48 83 ec 30          	sub    $0x30,%rsp
  803958:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80395c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803960:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803964:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803968:	8b 50 0c             	mov    0xc(%rax),%edx
  80396b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803972:	00 00 00 
  803975:	89 10                	mov    %edx,(%rax)
  803977:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80397e:	00 00 00 
  803981:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803985:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803989:	be 00 00 00 00       	mov    $0x0,%esi
  80398e:	bf 03 00 00 00       	mov    $0x3,%edi
  803993:	48 b8 b6 37 80 00 00 	movabs $0x8037b6,%rax
  80399a:	00 00 00 
  80399d:	ff d0                	callq  *%rax
  80399f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039a2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039a6:	79 08                	jns    8039b0 <devfile_read+0x60>
  8039a8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039ab:	e9 a4 00 00 00       	jmpq   803a54 <devfile_read+0x104>
  8039b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039b3:	48 98                	cltq   
  8039b5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8039b9:	76 35                	jbe    8039f0 <devfile_read+0xa0>
  8039bb:	48 b9 9e 5e 80 00 00 	movabs $0x805e9e,%rcx
  8039c2:	00 00 00 
  8039c5:	48 ba a5 5e 80 00 00 	movabs $0x805ea5,%rdx
  8039cc:	00 00 00 
  8039cf:	be 89 00 00 00       	mov    $0x89,%esi
  8039d4:	48 bf ba 5e 80 00 00 	movabs $0x805eba,%rdi
  8039db:	00 00 00 
  8039de:	b8 00 00 00 00       	mov    $0x0,%eax
  8039e3:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  8039ea:	00 00 00 
  8039ed:	41 ff d0             	callq  *%r8
  8039f0:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  8039f7:	7e 35                	jle    803a2e <devfile_read+0xde>
  8039f9:	48 b9 c8 5e 80 00 00 	movabs $0x805ec8,%rcx
  803a00:	00 00 00 
  803a03:	48 ba a5 5e 80 00 00 	movabs $0x805ea5,%rdx
  803a0a:	00 00 00 
  803a0d:	be 8a 00 00 00       	mov    $0x8a,%esi
  803a12:	48 bf ba 5e 80 00 00 	movabs $0x805eba,%rdi
  803a19:	00 00 00 
  803a1c:	b8 00 00 00 00       	mov    $0x0,%eax
  803a21:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  803a28:	00 00 00 
  803a2b:	41 ff d0             	callq  *%r8
  803a2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a31:	48 63 d0             	movslq %eax,%rdx
  803a34:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a38:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803a3f:	00 00 00 
  803a42:	48 89 c7             	mov    %rax,%rdi
  803a45:	48 b8 f0 1b 80 00 00 	movabs $0x801bf0,%rax
  803a4c:	00 00 00 
  803a4f:	ff d0                	callq  *%rax
  803a51:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a54:	c9                   	leaveq 
  803a55:	c3                   	retq   

0000000000803a56 <devfile_write>:
  803a56:	55                   	push   %rbp
  803a57:	48 89 e5             	mov    %rsp,%rbp
  803a5a:	48 83 ec 40          	sub    $0x40,%rsp
  803a5e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803a62:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803a66:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803a6a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803a6e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803a72:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  803a79:	00 
  803a7a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a7e:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  803a82:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  803a87:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  803a8b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a8f:	8b 50 0c             	mov    0xc(%rax),%edx
  803a92:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a99:	00 00 00 
  803a9c:	89 10                	mov    %edx,(%rax)
  803a9e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803aa5:	00 00 00 
  803aa8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803aac:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803ab0:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803ab4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ab8:	48 89 c6             	mov    %rax,%rsi
  803abb:	48 bf 10 a0 80 00 00 	movabs $0x80a010,%rdi
  803ac2:	00 00 00 
  803ac5:	48 b8 f0 1b 80 00 00 	movabs $0x801bf0,%rax
  803acc:	00 00 00 
  803acf:	ff d0                	callq  *%rax
  803ad1:	be 00 00 00 00       	mov    $0x0,%esi
  803ad6:	bf 04 00 00 00       	mov    $0x4,%edi
  803adb:	48 b8 b6 37 80 00 00 	movabs $0x8037b6,%rax
  803ae2:	00 00 00 
  803ae5:	ff d0                	callq  *%rax
  803ae7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803aea:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803aee:	79 05                	jns    803af5 <devfile_write+0x9f>
  803af0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803af3:	eb 43                	jmp    803b38 <devfile_write+0xe2>
  803af5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803af8:	48 98                	cltq   
  803afa:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803afe:	76 35                	jbe    803b35 <devfile_write+0xdf>
  803b00:	48 b9 9e 5e 80 00 00 	movabs $0x805e9e,%rcx
  803b07:	00 00 00 
  803b0a:	48 ba a5 5e 80 00 00 	movabs $0x805ea5,%rdx
  803b11:	00 00 00 
  803b14:	be a8 00 00 00       	mov    $0xa8,%esi
  803b19:	48 bf ba 5e 80 00 00 	movabs $0x805eba,%rdi
  803b20:	00 00 00 
  803b23:	b8 00 00 00 00       	mov    $0x0,%eax
  803b28:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  803b2f:	00 00 00 
  803b32:	41 ff d0             	callq  *%r8
  803b35:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b38:	c9                   	leaveq 
  803b39:	c3                   	retq   

0000000000803b3a <devfile_stat>:
  803b3a:	55                   	push   %rbp
  803b3b:	48 89 e5             	mov    %rsp,%rbp
  803b3e:	48 83 ec 20          	sub    $0x20,%rsp
  803b42:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803b46:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b4a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803b4e:	8b 50 0c             	mov    0xc(%rax),%edx
  803b51:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803b58:	00 00 00 
  803b5b:	89 10                	mov    %edx,(%rax)
  803b5d:	be 00 00 00 00       	mov    $0x0,%esi
  803b62:	bf 05 00 00 00       	mov    $0x5,%edi
  803b67:	48 b8 b6 37 80 00 00 	movabs $0x8037b6,%rax
  803b6e:	00 00 00 
  803b71:	ff d0                	callq  *%rax
  803b73:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b76:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b7a:	79 05                	jns    803b81 <devfile_stat+0x47>
  803b7c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b7f:	eb 56                	jmp    803bd7 <devfile_stat+0x9d>
  803b81:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b85:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803b8c:	00 00 00 
  803b8f:	48 89 c7             	mov    %rax,%rdi
  803b92:	48 b8 cb 18 80 00 00 	movabs $0x8018cb,%rax
  803b99:	00 00 00 
  803b9c:	ff d0                	callq  *%rax
  803b9e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803ba5:	00 00 00 
  803ba8:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803bae:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803bb2:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803bb8:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803bbf:	00 00 00 
  803bc2:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803bc8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803bcc:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803bd2:	b8 00 00 00 00       	mov    $0x0,%eax
  803bd7:	c9                   	leaveq 
  803bd8:	c3                   	retq   

0000000000803bd9 <devfile_trunc>:
  803bd9:	55                   	push   %rbp
  803bda:	48 89 e5             	mov    %rsp,%rbp
  803bdd:	48 83 ec 10          	sub    $0x10,%rsp
  803be1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803be5:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803be8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803bec:	8b 50 0c             	mov    0xc(%rax),%edx
  803bef:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803bf6:	00 00 00 
  803bf9:	89 10                	mov    %edx,(%rax)
  803bfb:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803c02:	00 00 00 
  803c05:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803c08:	89 50 04             	mov    %edx,0x4(%rax)
  803c0b:	be 00 00 00 00       	mov    $0x0,%esi
  803c10:	bf 02 00 00 00       	mov    $0x2,%edi
  803c15:	48 b8 b6 37 80 00 00 	movabs $0x8037b6,%rax
  803c1c:	00 00 00 
  803c1f:	ff d0                	callq  *%rax
  803c21:	c9                   	leaveq 
  803c22:	c3                   	retq   

0000000000803c23 <remove>:
  803c23:	55                   	push   %rbp
  803c24:	48 89 e5             	mov    %rsp,%rbp
  803c27:	48 83 ec 10          	sub    $0x10,%rsp
  803c2b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803c2f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c33:	48 89 c7             	mov    %rax,%rdi
  803c36:	48 b8 5f 18 80 00 00 	movabs $0x80185f,%rax
  803c3d:	00 00 00 
  803c40:	ff d0                	callq  *%rax
  803c42:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803c47:	7e 07                	jle    803c50 <remove+0x2d>
  803c49:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803c4e:	eb 33                	jmp    803c83 <remove+0x60>
  803c50:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c54:	48 89 c6             	mov    %rax,%rsi
  803c57:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  803c5e:	00 00 00 
  803c61:	48 b8 cb 18 80 00 00 	movabs $0x8018cb,%rax
  803c68:	00 00 00 
  803c6b:	ff d0                	callq  *%rax
  803c6d:	be 00 00 00 00       	mov    $0x0,%esi
  803c72:	bf 07 00 00 00       	mov    $0x7,%edi
  803c77:	48 b8 b6 37 80 00 00 	movabs $0x8037b6,%rax
  803c7e:	00 00 00 
  803c81:	ff d0                	callq  *%rax
  803c83:	c9                   	leaveq 
  803c84:	c3                   	retq   

0000000000803c85 <sync>:
  803c85:	55                   	push   %rbp
  803c86:	48 89 e5             	mov    %rsp,%rbp
  803c89:	be 00 00 00 00       	mov    $0x0,%esi
  803c8e:	bf 08 00 00 00       	mov    $0x8,%edi
  803c93:	48 b8 b6 37 80 00 00 	movabs $0x8037b6,%rax
  803c9a:	00 00 00 
  803c9d:	ff d0                	callq  *%rax
  803c9f:	5d                   	pop    %rbp
  803ca0:	c3                   	retq   

0000000000803ca1 <copy>:
  803ca1:	55                   	push   %rbp
  803ca2:	48 89 e5             	mov    %rsp,%rbp
  803ca5:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  803cac:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803cb3:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803cba:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803cc1:	be 00 00 00 00       	mov    $0x0,%esi
  803cc6:	48 89 c7             	mov    %rax,%rdi
  803cc9:	48 b8 3f 38 80 00 00 	movabs $0x80383f,%rax
  803cd0:	00 00 00 
  803cd3:	ff d0                	callq  *%rax
  803cd5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803cd8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cdc:	79 28                	jns    803d06 <copy+0x65>
  803cde:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ce1:	89 c6                	mov    %eax,%esi
  803ce3:	48 bf d4 5e 80 00 00 	movabs $0x805ed4,%rdi
  803cea:	00 00 00 
  803ced:	b8 00 00 00 00       	mov    $0x0,%eax
  803cf2:	48 ba 3b 0d 80 00 00 	movabs $0x800d3b,%rdx
  803cf9:	00 00 00 
  803cfc:	ff d2                	callq  *%rdx
  803cfe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d01:	e9 76 01 00 00       	jmpq   803e7c <copy+0x1db>
  803d06:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  803d0d:	be 01 01 00 00       	mov    $0x101,%esi
  803d12:	48 89 c7             	mov    %rax,%rdi
  803d15:	48 b8 3f 38 80 00 00 	movabs $0x80383f,%rax
  803d1c:	00 00 00 
  803d1f:	ff d0                	callq  *%rax
  803d21:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803d24:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803d28:	0f 89 ad 00 00 00    	jns    803ddb <copy+0x13a>
  803d2e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d31:	89 c6                	mov    %eax,%esi
  803d33:	48 bf ea 5e 80 00 00 	movabs $0x805eea,%rdi
  803d3a:	00 00 00 
  803d3d:	b8 00 00 00 00       	mov    $0x0,%eax
  803d42:	48 ba 3b 0d 80 00 00 	movabs $0x800d3b,%rdx
  803d49:	00 00 00 
  803d4c:	ff d2                	callq  *%rdx
  803d4e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d51:	89 c7                	mov    %eax,%edi
  803d53:	48 b8 43 31 80 00 00 	movabs $0x803143,%rax
  803d5a:	00 00 00 
  803d5d:	ff d0                	callq  *%rax
  803d5f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d62:	e9 15 01 00 00       	jmpq   803e7c <copy+0x1db>
  803d67:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803d6a:	48 63 d0             	movslq %eax,%rdx
  803d6d:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803d74:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d77:	48 89 ce             	mov    %rcx,%rsi
  803d7a:	89 c7                	mov    %eax,%edi
  803d7c:	48 b8 b1 34 80 00 00 	movabs $0x8034b1,%rax
  803d83:	00 00 00 
  803d86:	ff d0                	callq  *%rax
  803d88:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803d8b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803d8f:	79 4a                	jns    803ddb <copy+0x13a>
  803d91:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803d94:	89 c6                	mov    %eax,%esi
  803d96:	48 bf 04 5f 80 00 00 	movabs $0x805f04,%rdi
  803d9d:	00 00 00 
  803da0:	b8 00 00 00 00       	mov    $0x0,%eax
  803da5:	48 ba 3b 0d 80 00 00 	movabs $0x800d3b,%rdx
  803dac:	00 00 00 
  803daf:	ff d2                	callq  *%rdx
  803db1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803db4:	89 c7                	mov    %eax,%edi
  803db6:	48 b8 43 31 80 00 00 	movabs $0x803143,%rax
  803dbd:	00 00 00 
  803dc0:	ff d0                	callq  *%rax
  803dc2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803dc5:	89 c7                	mov    %eax,%edi
  803dc7:	48 b8 43 31 80 00 00 	movabs $0x803143,%rax
  803dce:	00 00 00 
  803dd1:	ff d0                	callq  *%rax
  803dd3:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803dd6:	e9 a1 00 00 00       	jmpq   803e7c <copy+0x1db>
  803ddb:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803de2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803de5:	ba 00 02 00 00       	mov    $0x200,%edx
  803dea:	48 89 ce             	mov    %rcx,%rsi
  803ded:	89 c7                	mov    %eax,%edi
  803def:	48 b8 66 33 80 00 00 	movabs $0x803366,%rax
  803df6:	00 00 00 
  803df9:	ff d0                	callq  *%rax
  803dfb:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803dfe:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803e02:	0f 8f 5f ff ff ff    	jg     803d67 <copy+0xc6>
  803e08:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803e0c:	79 47                	jns    803e55 <copy+0x1b4>
  803e0e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803e11:	89 c6                	mov    %eax,%esi
  803e13:	48 bf 17 5f 80 00 00 	movabs $0x805f17,%rdi
  803e1a:	00 00 00 
  803e1d:	b8 00 00 00 00       	mov    $0x0,%eax
  803e22:	48 ba 3b 0d 80 00 00 	movabs $0x800d3b,%rdx
  803e29:	00 00 00 
  803e2c:	ff d2                	callq  *%rdx
  803e2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e31:	89 c7                	mov    %eax,%edi
  803e33:	48 b8 43 31 80 00 00 	movabs $0x803143,%rax
  803e3a:	00 00 00 
  803e3d:	ff d0                	callq  *%rax
  803e3f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e42:	89 c7                	mov    %eax,%edi
  803e44:	48 b8 43 31 80 00 00 	movabs $0x803143,%rax
  803e4b:	00 00 00 
  803e4e:	ff d0                	callq  *%rax
  803e50:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803e53:	eb 27                	jmp    803e7c <copy+0x1db>
  803e55:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e58:	89 c7                	mov    %eax,%edi
  803e5a:	48 b8 43 31 80 00 00 	movabs $0x803143,%rax
  803e61:	00 00 00 
  803e64:	ff d0                	callq  *%rax
  803e66:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e69:	89 c7                	mov    %eax,%edi
  803e6b:	48 b8 43 31 80 00 00 	movabs $0x803143,%rax
  803e72:	00 00 00 
  803e75:	ff d0                	callq  *%rax
  803e77:	b8 00 00 00 00       	mov    $0x0,%eax
  803e7c:	c9                   	leaveq 
  803e7d:	c3                   	retq   

0000000000803e7e <fd2sockid>:
  803e7e:	55                   	push   %rbp
  803e7f:	48 89 e5             	mov    %rsp,%rbp
  803e82:	48 83 ec 20          	sub    $0x20,%rsp
  803e86:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e89:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803e8d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803e90:	48 89 d6             	mov    %rdx,%rsi
  803e93:	89 c7                	mov    %eax,%edi
  803e95:	48 b8 31 2f 80 00 00 	movabs $0x802f31,%rax
  803e9c:	00 00 00 
  803e9f:	ff d0                	callq  *%rax
  803ea1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ea4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ea8:	79 05                	jns    803eaf <fd2sockid+0x31>
  803eaa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ead:	eb 24                	jmp    803ed3 <fd2sockid+0x55>
  803eaf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803eb3:	8b 10                	mov    (%rax),%edx
  803eb5:	48 b8 a0 80 80 00 00 	movabs $0x8080a0,%rax
  803ebc:	00 00 00 
  803ebf:	8b 00                	mov    (%rax),%eax
  803ec1:	39 c2                	cmp    %eax,%edx
  803ec3:	74 07                	je     803ecc <fd2sockid+0x4e>
  803ec5:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803eca:	eb 07                	jmp    803ed3 <fd2sockid+0x55>
  803ecc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ed0:	8b 40 0c             	mov    0xc(%rax),%eax
  803ed3:	c9                   	leaveq 
  803ed4:	c3                   	retq   

0000000000803ed5 <alloc_sockfd>:
  803ed5:	55                   	push   %rbp
  803ed6:	48 89 e5             	mov    %rsp,%rbp
  803ed9:	48 83 ec 20          	sub    $0x20,%rsp
  803edd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ee0:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803ee4:	48 89 c7             	mov    %rax,%rdi
  803ee7:	48 b8 99 2e 80 00 00 	movabs $0x802e99,%rax
  803eee:	00 00 00 
  803ef1:	ff d0                	callq  *%rax
  803ef3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ef6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803efa:	78 26                	js     803f22 <alloc_sockfd+0x4d>
  803efc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f00:	ba 07 04 00 00       	mov    $0x407,%edx
  803f05:	48 89 c6             	mov    %rax,%rsi
  803f08:	bf 00 00 00 00       	mov    $0x0,%edi
  803f0d:	48 b8 fb 21 80 00 00 	movabs $0x8021fb,%rax
  803f14:	00 00 00 
  803f17:	ff d0                	callq  *%rax
  803f19:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f1c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f20:	79 16                	jns    803f38 <alloc_sockfd+0x63>
  803f22:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f25:	89 c7                	mov    %eax,%edi
  803f27:	48 b8 e4 43 80 00 00 	movabs $0x8043e4,%rax
  803f2e:	00 00 00 
  803f31:	ff d0                	callq  *%rax
  803f33:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f36:	eb 3a                	jmp    803f72 <alloc_sockfd+0x9d>
  803f38:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f3c:	48 ba a0 80 80 00 00 	movabs $0x8080a0,%rdx
  803f43:	00 00 00 
  803f46:	8b 12                	mov    (%rdx),%edx
  803f48:	89 10                	mov    %edx,(%rax)
  803f4a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f4e:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803f55:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f59:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803f5c:	89 50 0c             	mov    %edx,0xc(%rax)
  803f5f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f63:	48 89 c7             	mov    %rax,%rdi
  803f66:	48 b8 4b 2e 80 00 00 	movabs $0x802e4b,%rax
  803f6d:	00 00 00 
  803f70:	ff d0                	callq  *%rax
  803f72:	c9                   	leaveq 
  803f73:	c3                   	retq   

0000000000803f74 <accept>:
  803f74:	55                   	push   %rbp
  803f75:	48 89 e5             	mov    %rsp,%rbp
  803f78:	48 83 ec 30          	sub    $0x30,%rsp
  803f7c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f7f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f83:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803f87:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f8a:	89 c7                	mov    %eax,%edi
  803f8c:	48 b8 7e 3e 80 00 00 	movabs $0x803e7e,%rax
  803f93:	00 00 00 
  803f96:	ff d0                	callq  *%rax
  803f98:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f9b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f9f:	79 05                	jns    803fa6 <accept+0x32>
  803fa1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fa4:	eb 3b                	jmp    803fe1 <accept+0x6d>
  803fa6:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803faa:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803fae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fb1:	48 89 ce             	mov    %rcx,%rsi
  803fb4:	89 c7                	mov    %eax,%edi
  803fb6:	48 b8 c1 42 80 00 00 	movabs $0x8042c1,%rax
  803fbd:	00 00 00 
  803fc0:	ff d0                	callq  *%rax
  803fc2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803fc5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803fc9:	79 05                	jns    803fd0 <accept+0x5c>
  803fcb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fce:	eb 11                	jmp    803fe1 <accept+0x6d>
  803fd0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fd3:	89 c7                	mov    %eax,%edi
  803fd5:	48 b8 d5 3e 80 00 00 	movabs $0x803ed5,%rax
  803fdc:	00 00 00 
  803fdf:	ff d0                	callq  *%rax
  803fe1:	c9                   	leaveq 
  803fe2:	c3                   	retq   

0000000000803fe3 <bind>:
  803fe3:	55                   	push   %rbp
  803fe4:	48 89 e5             	mov    %rsp,%rbp
  803fe7:	48 83 ec 20          	sub    $0x20,%rsp
  803feb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803fee:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803ff2:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803ff5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ff8:	89 c7                	mov    %eax,%edi
  803ffa:	48 b8 7e 3e 80 00 00 	movabs $0x803e7e,%rax
  804001:	00 00 00 
  804004:	ff d0                	callq  *%rax
  804006:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804009:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80400d:	79 05                	jns    804014 <bind+0x31>
  80400f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804012:	eb 1b                	jmp    80402f <bind+0x4c>
  804014:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804017:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80401b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80401e:	48 89 ce             	mov    %rcx,%rsi
  804021:	89 c7                	mov    %eax,%edi
  804023:	48 b8 40 43 80 00 00 	movabs $0x804340,%rax
  80402a:	00 00 00 
  80402d:	ff d0                	callq  *%rax
  80402f:	c9                   	leaveq 
  804030:	c3                   	retq   

0000000000804031 <shutdown>:
  804031:	55                   	push   %rbp
  804032:	48 89 e5             	mov    %rsp,%rbp
  804035:	48 83 ec 20          	sub    $0x20,%rsp
  804039:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80403c:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80403f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804042:	89 c7                	mov    %eax,%edi
  804044:	48 b8 7e 3e 80 00 00 	movabs $0x803e7e,%rax
  80404b:	00 00 00 
  80404e:	ff d0                	callq  *%rax
  804050:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804053:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804057:	79 05                	jns    80405e <shutdown+0x2d>
  804059:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80405c:	eb 16                	jmp    804074 <shutdown+0x43>
  80405e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804061:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804064:	89 d6                	mov    %edx,%esi
  804066:	89 c7                	mov    %eax,%edi
  804068:	48 b8 a4 43 80 00 00 	movabs $0x8043a4,%rax
  80406f:	00 00 00 
  804072:	ff d0                	callq  *%rax
  804074:	c9                   	leaveq 
  804075:	c3                   	retq   

0000000000804076 <devsock_close>:
  804076:	55                   	push   %rbp
  804077:	48 89 e5             	mov    %rsp,%rbp
  80407a:	48 83 ec 10          	sub    $0x10,%rsp
  80407e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804082:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804086:	48 89 c7             	mov    %rax,%rdi
  804089:	48 b8 22 50 80 00 00 	movabs $0x805022,%rax
  804090:	00 00 00 
  804093:	ff d0                	callq  *%rax
  804095:	83 f8 01             	cmp    $0x1,%eax
  804098:	75 17                	jne    8040b1 <devsock_close+0x3b>
  80409a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80409e:	8b 40 0c             	mov    0xc(%rax),%eax
  8040a1:	89 c7                	mov    %eax,%edi
  8040a3:	48 b8 e4 43 80 00 00 	movabs $0x8043e4,%rax
  8040aa:	00 00 00 
  8040ad:	ff d0                	callq  *%rax
  8040af:	eb 05                	jmp    8040b6 <devsock_close+0x40>
  8040b1:	b8 00 00 00 00       	mov    $0x0,%eax
  8040b6:	c9                   	leaveq 
  8040b7:	c3                   	retq   

00000000008040b8 <connect>:
  8040b8:	55                   	push   %rbp
  8040b9:	48 89 e5             	mov    %rsp,%rbp
  8040bc:	48 83 ec 20          	sub    $0x20,%rsp
  8040c0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8040c3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8040c7:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8040ca:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8040cd:	89 c7                	mov    %eax,%edi
  8040cf:	48 b8 7e 3e 80 00 00 	movabs $0x803e7e,%rax
  8040d6:	00 00 00 
  8040d9:	ff d0                	callq  *%rax
  8040db:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040de:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040e2:	79 05                	jns    8040e9 <connect+0x31>
  8040e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040e7:	eb 1b                	jmp    804104 <connect+0x4c>
  8040e9:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8040ec:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8040f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040f3:	48 89 ce             	mov    %rcx,%rsi
  8040f6:	89 c7                	mov    %eax,%edi
  8040f8:	48 b8 11 44 80 00 00 	movabs $0x804411,%rax
  8040ff:	00 00 00 
  804102:	ff d0                	callq  *%rax
  804104:	c9                   	leaveq 
  804105:	c3                   	retq   

0000000000804106 <listen>:
  804106:	55                   	push   %rbp
  804107:	48 89 e5             	mov    %rsp,%rbp
  80410a:	48 83 ec 20          	sub    $0x20,%rsp
  80410e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804111:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804114:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804117:	89 c7                	mov    %eax,%edi
  804119:	48 b8 7e 3e 80 00 00 	movabs $0x803e7e,%rax
  804120:	00 00 00 
  804123:	ff d0                	callq  *%rax
  804125:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804128:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80412c:	79 05                	jns    804133 <listen+0x2d>
  80412e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804131:	eb 16                	jmp    804149 <listen+0x43>
  804133:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804136:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804139:	89 d6                	mov    %edx,%esi
  80413b:	89 c7                	mov    %eax,%edi
  80413d:	48 b8 75 44 80 00 00 	movabs $0x804475,%rax
  804144:	00 00 00 
  804147:	ff d0                	callq  *%rax
  804149:	c9                   	leaveq 
  80414a:	c3                   	retq   

000000000080414b <devsock_read>:
  80414b:	55                   	push   %rbp
  80414c:	48 89 e5             	mov    %rsp,%rbp
  80414f:	48 83 ec 20          	sub    $0x20,%rsp
  804153:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804157:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80415b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80415f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804163:	89 c2                	mov    %eax,%edx
  804165:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804169:	8b 40 0c             	mov    0xc(%rax),%eax
  80416c:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  804170:	b9 00 00 00 00       	mov    $0x0,%ecx
  804175:	89 c7                	mov    %eax,%edi
  804177:	48 b8 b5 44 80 00 00 	movabs $0x8044b5,%rax
  80417e:	00 00 00 
  804181:	ff d0                	callq  *%rax
  804183:	c9                   	leaveq 
  804184:	c3                   	retq   

0000000000804185 <devsock_write>:
  804185:	55                   	push   %rbp
  804186:	48 89 e5             	mov    %rsp,%rbp
  804189:	48 83 ec 20          	sub    $0x20,%rsp
  80418d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804191:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804195:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  804199:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80419d:	89 c2                	mov    %eax,%edx
  80419f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041a3:	8b 40 0c             	mov    0xc(%rax),%eax
  8041a6:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8041aa:	b9 00 00 00 00       	mov    $0x0,%ecx
  8041af:	89 c7                	mov    %eax,%edi
  8041b1:	48 b8 81 45 80 00 00 	movabs $0x804581,%rax
  8041b8:	00 00 00 
  8041bb:	ff d0                	callq  *%rax
  8041bd:	c9                   	leaveq 
  8041be:	c3                   	retq   

00000000008041bf <devsock_stat>:
  8041bf:	55                   	push   %rbp
  8041c0:	48 89 e5             	mov    %rsp,%rbp
  8041c3:	48 83 ec 10          	sub    $0x10,%rsp
  8041c7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8041cb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8041cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041d3:	48 be 32 5f 80 00 00 	movabs $0x805f32,%rsi
  8041da:	00 00 00 
  8041dd:	48 89 c7             	mov    %rax,%rdi
  8041e0:	48 b8 cb 18 80 00 00 	movabs $0x8018cb,%rax
  8041e7:	00 00 00 
  8041ea:	ff d0                	callq  *%rax
  8041ec:	b8 00 00 00 00       	mov    $0x0,%eax
  8041f1:	c9                   	leaveq 
  8041f2:	c3                   	retq   

00000000008041f3 <socket>:
  8041f3:	55                   	push   %rbp
  8041f4:	48 89 e5             	mov    %rsp,%rbp
  8041f7:	48 83 ec 20          	sub    $0x20,%rsp
  8041fb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8041fe:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804201:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  804204:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  804207:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80420a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80420d:	89 ce                	mov    %ecx,%esi
  80420f:	89 c7                	mov    %eax,%edi
  804211:	48 b8 39 46 80 00 00 	movabs $0x804639,%rax
  804218:	00 00 00 
  80421b:	ff d0                	callq  *%rax
  80421d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804220:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804224:	79 05                	jns    80422b <socket+0x38>
  804226:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804229:	eb 11                	jmp    80423c <socket+0x49>
  80422b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80422e:	89 c7                	mov    %eax,%edi
  804230:	48 b8 d5 3e 80 00 00 	movabs $0x803ed5,%rax
  804237:	00 00 00 
  80423a:	ff d0                	callq  *%rax
  80423c:	c9                   	leaveq 
  80423d:	c3                   	retq   

000000000080423e <nsipc>:
  80423e:	55                   	push   %rbp
  80423f:	48 89 e5             	mov    %rsp,%rbp
  804242:	48 83 ec 10          	sub    $0x10,%rsp
  804246:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804249:	48 b8 0c 90 80 00 00 	movabs $0x80900c,%rax
  804250:	00 00 00 
  804253:	8b 00                	mov    (%rax),%eax
  804255:	85 c0                	test   %eax,%eax
  804257:	75 1f                	jne    804278 <nsipc+0x3a>
  804259:	bf 02 00 00 00       	mov    $0x2,%edi
  80425e:	48 b8 da 2d 80 00 00 	movabs $0x802dda,%rax
  804265:	00 00 00 
  804268:	ff d0                	callq  *%rax
  80426a:	89 c2                	mov    %eax,%edx
  80426c:	48 b8 0c 90 80 00 00 	movabs $0x80900c,%rax
  804273:	00 00 00 
  804276:	89 10                	mov    %edx,(%rax)
  804278:	48 b8 0c 90 80 00 00 	movabs $0x80900c,%rax
  80427f:	00 00 00 
  804282:	8b 00                	mov    (%rax),%eax
  804284:	8b 75 fc             	mov    -0x4(%rbp),%esi
  804287:	b9 07 00 00 00       	mov    $0x7,%ecx
  80428c:	48 ba 00 c0 80 00 00 	movabs $0x80c000,%rdx
  804293:	00 00 00 
  804296:	89 c7                	mov    %eax,%edi
  804298:	48 b8 d0 2c 80 00 00 	movabs $0x802cd0,%rax
  80429f:	00 00 00 
  8042a2:	ff d0                	callq  *%rax
  8042a4:	ba 00 00 00 00       	mov    $0x0,%edx
  8042a9:	be 00 00 00 00       	mov    $0x0,%esi
  8042ae:	bf 00 00 00 00       	mov    $0x0,%edi
  8042b3:	48 b8 0f 2c 80 00 00 	movabs $0x802c0f,%rax
  8042ba:	00 00 00 
  8042bd:	ff d0                	callq  *%rax
  8042bf:	c9                   	leaveq 
  8042c0:	c3                   	retq   

00000000008042c1 <nsipc_accept>:
  8042c1:	55                   	push   %rbp
  8042c2:	48 89 e5             	mov    %rsp,%rbp
  8042c5:	48 83 ec 30          	sub    $0x30,%rsp
  8042c9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8042cc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8042d0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8042d4:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8042db:	00 00 00 
  8042de:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8042e1:	89 10                	mov    %edx,(%rax)
  8042e3:	bf 01 00 00 00       	mov    $0x1,%edi
  8042e8:	48 b8 3e 42 80 00 00 	movabs $0x80423e,%rax
  8042ef:	00 00 00 
  8042f2:	ff d0                	callq  *%rax
  8042f4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8042f7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8042fb:	78 3e                	js     80433b <nsipc_accept+0x7a>
  8042fd:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804304:	00 00 00 
  804307:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80430b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80430f:	8b 40 10             	mov    0x10(%rax),%eax
  804312:	89 c2                	mov    %eax,%edx
  804314:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  804318:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80431c:	48 89 ce             	mov    %rcx,%rsi
  80431f:	48 89 c7             	mov    %rax,%rdi
  804322:	48 b8 f0 1b 80 00 00 	movabs $0x801bf0,%rax
  804329:	00 00 00 
  80432c:	ff d0                	callq  *%rax
  80432e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804332:	8b 50 10             	mov    0x10(%rax),%edx
  804335:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804339:	89 10                	mov    %edx,(%rax)
  80433b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80433e:	c9                   	leaveq 
  80433f:	c3                   	retq   

0000000000804340 <nsipc_bind>:
  804340:	55                   	push   %rbp
  804341:	48 89 e5             	mov    %rsp,%rbp
  804344:	48 83 ec 10          	sub    $0x10,%rsp
  804348:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80434b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80434f:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804352:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804359:	00 00 00 
  80435c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80435f:	89 10                	mov    %edx,(%rax)
  804361:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804364:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804368:	48 89 c6             	mov    %rax,%rsi
  80436b:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  804372:	00 00 00 
  804375:	48 b8 f0 1b 80 00 00 	movabs $0x801bf0,%rax
  80437c:	00 00 00 
  80437f:	ff d0                	callq  *%rax
  804381:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804388:	00 00 00 
  80438b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80438e:	89 50 14             	mov    %edx,0x14(%rax)
  804391:	bf 02 00 00 00       	mov    $0x2,%edi
  804396:	48 b8 3e 42 80 00 00 	movabs $0x80423e,%rax
  80439d:	00 00 00 
  8043a0:	ff d0                	callq  *%rax
  8043a2:	c9                   	leaveq 
  8043a3:	c3                   	retq   

00000000008043a4 <nsipc_shutdown>:
  8043a4:	55                   	push   %rbp
  8043a5:	48 89 e5             	mov    %rsp,%rbp
  8043a8:	48 83 ec 10          	sub    $0x10,%rsp
  8043ac:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8043af:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8043b2:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8043b9:	00 00 00 
  8043bc:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8043bf:	89 10                	mov    %edx,(%rax)
  8043c1:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8043c8:	00 00 00 
  8043cb:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8043ce:	89 50 04             	mov    %edx,0x4(%rax)
  8043d1:	bf 03 00 00 00       	mov    $0x3,%edi
  8043d6:	48 b8 3e 42 80 00 00 	movabs $0x80423e,%rax
  8043dd:	00 00 00 
  8043e0:	ff d0                	callq  *%rax
  8043e2:	c9                   	leaveq 
  8043e3:	c3                   	retq   

00000000008043e4 <nsipc_close>:
  8043e4:	55                   	push   %rbp
  8043e5:	48 89 e5             	mov    %rsp,%rbp
  8043e8:	48 83 ec 10          	sub    $0x10,%rsp
  8043ec:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8043ef:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8043f6:	00 00 00 
  8043f9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8043fc:	89 10                	mov    %edx,(%rax)
  8043fe:	bf 04 00 00 00       	mov    $0x4,%edi
  804403:	48 b8 3e 42 80 00 00 	movabs $0x80423e,%rax
  80440a:	00 00 00 
  80440d:	ff d0                	callq  *%rax
  80440f:	c9                   	leaveq 
  804410:	c3                   	retq   

0000000000804411 <nsipc_connect>:
  804411:	55                   	push   %rbp
  804412:	48 89 e5             	mov    %rsp,%rbp
  804415:	48 83 ec 10          	sub    $0x10,%rsp
  804419:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80441c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804420:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804423:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80442a:	00 00 00 
  80442d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804430:	89 10                	mov    %edx,(%rax)
  804432:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804435:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804439:	48 89 c6             	mov    %rax,%rsi
  80443c:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  804443:	00 00 00 
  804446:	48 b8 f0 1b 80 00 00 	movabs $0x801bf0,%rax
  80444d:	00 00 00 
  804450:	ff d0                	callq  *%rax
  804452:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804459:	00 00 00 
  80445c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80445f:	89 50 14             	mov    %edx,0x14(%rax)
  804462:	bf 05 00 00 00       	mov    $0x5,%edi
  804467:	48 b8 3e 42 80 00 00 	movabs $0x80423e,%rax
  80446e:	00 00 00 
  804471:	ff d0                	callq  *%rax
  804473:	c9                   	leaveq 
  804474:	c3                   	retq   

0000000000804475 <nsipc_listen>:
  804475:	55                   	push   %rbp
  804476:	48 89 e5             	mov    %rsp,%rbp
  804479:	48 83 ec 10          	sub    $0x10,%rsp
  80447d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804480:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804483:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80448a:	00 00 00 
  80448d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804490:	89 10                	mov    %edx,(%rax)
  804492:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804499:	00 00 00 
  80449c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80449f:	89 50 04             	mov    %edx,0x4(%rax)
  8044a2:	bf 06 00 00 00       	mov    $0x6,%edi
  8044a7:	48 b8 3e 42 80 00 00 	movabs $0x80423e,%rax
  8044ae:	00 00 00 
  8044b1:	ff d0                	callq  *%rax
  8044b3:	c9                   	leaveq 
  8044b4:	c3                   	retq   

00000000008044b5 <nsipc_recv>:
  8044b5:	55                   	push   %rbp
  8044b6:	48 89 e5             	mov    %rsp,%rbp
  8044b9:	48 83 ec 30          	sub    $0x30,%rsp
  8044bd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8044c0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8044c4:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8044c7:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8044ca:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8044d1:	00 00 00 
  8044d4:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8044d7:	89 10                	mov    %edx,(%rax)
  8044d9:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8044e0:	00 00 00 
  8044e3:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8044e6:	89 50 04             	mov    %edx,0x4(%rax)
  8044e9:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8044f0:	00 00 00 
  8044f3:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8044f6:	89 50 08             	mov    %edx,0x8(%rax)
  8044f9:	bf 07 00 00 00       	mov    $0x7,%edi
  8044fe:	48 b8 3e 42 80 00 00 	movabs $0x80423e,%rax
  804505:	00 00 00 
  804508:	ff d0                	callq  *%rax
  80450a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80450d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804511:	78 69                	js     80457c <nsipc_recv+0xc7>
  804513:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  80451a:	7f 08                	jg     804524 <nsipc_recv+0x6f>
  80451c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80451f:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  804522:	7e 35                	jle    804559 <nsipc_recv+0xa4>
  804524:	48 b9 39 5f 80 00 00 	movabs $0x805f39,%rcx
  80452b:	00 00 00 
  80452e:	48 ba 4e 5f 80 00 00 	movabs $0x805f4e,%rdx
  804535:	00 00 00 
  804538:	be 62 00 00 00       	mov    $0x62,%esi
  80453d:	48 bf 63 5f 80 00 00 	movabs $0x805f63,%rdi
  804544:	00 00 00 
  804547:	b8 00 00 00 00       	mov    $0x0,%eax
  80454c:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  804553:	00 00 00 
  804556:	41 ff d0             	callq  *%r8
  804559:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80455c:	48 63 d0             	movslq %eax,%rdx
  80455f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804563:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  80456a:	00 00 00 
  80456d:	48 89 c7             	mov    %rax,%rdi
  804570:	48 b8 f0 1b 80 00 00 	movabs $0x801bf0,%rax
  804577:	00 00 00 
  80457a:	ff d0                	callq  *%rax
  80457c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80457f:	c9                   	leaveq 
  804580:	c3                   	retq   

0000000000804581 <nsipc_send>:
  804581:	55                   	push   %rbp
  804582:	48 89 e5             	mov    %rsp,%rbp
  804585:	48 83 ec 20          	sub    $0x20,%rsp
  804589:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80458c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804590:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804593:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804596:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80459d:	00 00 00 
  8045a0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8045a3:	89 10                	mov    %edx,(%rax)
  8045a5:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  8045ac:	7e 35                	jle    8045e3 <nsipc_send+0x62>
  8045ae:	48 b9 72 5f 80 00 00 	movabs $0x805f72,%rcx
  8045b5:	00 00 00 
  8045b8:	48 ba 4e 5f 80 00 00 	movabs $0x805f4e,%rdx
  8045bf:	00 00 00 
  8045c2:	be 6d 00 00 00       	mov    $0x6d,%esi
  8045c7:	48 bf 63 5f 80 00 00 	movabs $0x805f63,%rdi
  8045ce:	00 00 00 
  8045d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8045d6:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  8045dd:	00 00 00 
  8045e0:	41 ff d0             	callq  *%r8
  8045e3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8045e6:	48 63 d0             	movslq %eax,%rdx
  8045e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045ed:	48 89 c6             	mov    %rax,%rsi
  8045f0:	48 bf 0c c0 80 00 00 	movabs $0x80c00c,%rdi
  8045f7:	00 00 00 
  8045fa:	48 b8 f0 1b 80 00 00 	movabs $0x801bf0,%rax
  804601:	00 00 00 
  804604:	ff d0                	callq  *%rax
  804606:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80460d:	00 00 00 
  804610:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804613:	89 50 04             	mov    %edx,0x4(%rax)
  804616:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80461d:	00 00 00 
  804620:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804623:	89 50 08             	mov    %edx,0x8(%rax)
  804626:	bf 08 00 00 00       	mov    $0x8,%edi
  80462b:	48 b8 3e 42 80 00 00 	movabs $0x80423e,%rax
  804632:	00 00 00 
  804635:	ff d0                	callq  *%rax
  804637:	c9                   	leaveq 
  804638:	c3                   	retq   

0000000000804639 <nsipc_socket>:
  804639:	55                   	push   %rbp
  80463a:	48 89 e5             	mov    %rsp,%rbp
  80463d:	48 83 ec 10          	sub    $0x10,%rsp
  804641:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804644:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804647:	89 55 f4             	mov    %edx,-0xc(%rbp)
  80464a:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804651:	00 00 00 
  804654:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804657:	89 10                	mov    %edx,(%rax)
  804659:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804660:	00 00 00 
  804663:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804666:	89 50 04             	mov    %edx,0x4(%rax)
  804669:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804670:	00 00 00 
  804673:	8b 55 f4             	mov    -0xc(%rbp),%edx
  804676:	89 50 08             	mov    %edx,0x8(%rax)
  804679:	bf 09 00 00 00       	mov    $0x9,%edi
  80467e:	48 b8 3e 42 80 00 00 	movabs $0x80423e,%rax
  804685:	00 00 00 
  804688:	ff d0                	callq  *%rax
  80468a:	c9                   	leaveq 
  80468b:	c3                   	retq   

000000000080468c <pipe>:
  80468c:	55                   	push   %rbp
  80468d:	48 89 e5             	mov    %rsp,%rbp
  804690:	53                   	push   %rbx
  804691:	48 83 ec 38          	sub    $0x38,%rsp
  804695:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  804699:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  80469d:	48 89 c7             	mov    %rax,%rdi
  8046a0:	48 b8 99 2e 80 00 00 	movabs $0x802e99,%rax
  8046a7:	00 00 00 
  8046aa:	ff d0                	callq  *%rax
  8046ac:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8046af:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8046b3:	0f 88 bf 01 00 00    	js     804878 <pipe+0x1ec>
  8046b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8046bd:	ba 07 04 00 00       	mov    $0x407,%edx
  8046c2:	48 89 c6             	mov    %rax,%rsi
  8046c5:	bf 00 00 00 00       	mov    $0x0,%edi
  8046ca:	48 b8 fb 21 80 00 00 	movabs $0x8021fb,%rax
  8046d1:	00 00 00 
  8046d4:	ff d0                	callq  *%rax
  8046d6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8046d9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8046dd:	0f 88 95 01 00 00    	js     804878 <pipe+0x1ec>
  8046e3:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8046e7:	48 89 c7             	mov    %rax,%rdi
  8046ea:	48 b8 99 2e 80 00 00 	movabs $0x802e99,%rax
  8046f1:	00 00 00 
  8046f4:	ff d0                	callq  *%rax
  8046f6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8046f9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8046fd:	0f 88 5d 01 00 00    	js     804860 <pipe+0x1d4>
  804703:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804707:	ba 07 04 00 00       	mov    $0x407,%edx
  80470c:	48 89 c6             	mov    %rax,%rsi
  80470f:	bf 00 00 00 00       	mov    $0x0,%edi
  804714:	48 b8 fb 21 80 00 00 	movabs $0x8021fb,%rax
  80471b:	00 00 00 
  80471e:	ff d0                	callq  *%rax
  804720:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804723:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804727:	0f 88 33 01 00 00    	js     804860 <pipe+0x1d4>
  80472d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804731:	48 89 c7             	mov    %rax,%rdi
  804734:	48 b8 6e 2e 80 00 00 	movabs $0x802e6e,%rax
  80473b:	00 00 00 
  80473e:	ff d0                	callq  *%rax
  804740:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804744:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804748:	ba 07 04 00 00       	mov    $0x407,%edx
  80474d:	48 89 c6             	mov    %rax,%rsi
  804750:	bf 00 00 00 00       	mov    $0x0,%edi
  804755:	48 b8 fb 21 80 00 00 	movabs $0x8021fb,%rax
  80475c:	00 00 00 
  80475f:	ff d0                	callq  *%rax
  804761:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804764:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804768:	0f 88 d9 00 00 00    	js     804847 <pipe+0x1bb>
  80476e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804772:	48 89 c7             	mov    %rax,%rdi
  804775:	48 b8 6e 2e 80 00 00 	movabs $0x802e6e,%rax
  80477c:	00 00 00 
  80477f:	ff d0                	callq  *%rax
  804781:	48 89 c2             	mov    %rax,%rdx
  804784:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804788:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  80478e:	48 89 d1             	mov    %rdx,%rcx
  804791:	ba 00 00 00 00       	mov    $0x0,%edx
  804796:	48 89 c6             	mov    %rax,%rsi
  804799:	bf 00 00 00 00       	mov    $0x0,%edi
  80479e:	48 b8 4d 22 80 00 00 	movabs $0x80224d,%rax
  8047a5:	00 00 00 
  8047a8:	ff d0                	callq  *%rax
  8047aa:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8047ad:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8047b1:	78 79                	js     80482c <pipe+0x1a0>
  8047b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8047b7:	48 ba e0 80 80 00 00 	movabs $0x8080e0,%rdx
  8047be:	00 00 00 
  8047c1:	8b 12                	mov    (%rdx),%edx
  8047c3:	89 10                	mov    %edx,(%rax)
  8047c5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8047c9:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  8047d0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8047d4:	48 ba e0 80 80 00 00 	movabs $0x8080e0,%rdx
  8047db:	00 00 00 
  8047de:	8b 12                	mov    (%rdx),%edx
  8047e0:	89 10                	mov    %edx,(%rax)
  8047e2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8047e6:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  8047ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8047f1:	48 89 c7             	mov    %rax,%rdi
  8047f4:	48 b8 4b 2e 80 00 00 	movabs $0x802e4b,%rax
  8047fb:	00 00 00 
  8047fe:	ff d0                	callq  *%rax
  804800:	89 c2                	mov    %eax,%edx
  804802:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804806:	89 10                	mov    %edx,(%rax)
  804808:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80480c:	48 8d 58 04          	lea    0x4(%rax),%rbx
  804810:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804814:	48 89 c7             	mov    %rax,%rdi
  804817:	48 b8 4b 2e 80 00 00 	movabs $0x802e4b,%rax
  80481e:	00 00 00 
  804821:	ff d0                	callq  *%rax
  804823:	89 03                	mov    %eax,(%rbx)
  804825:	b8 00 00 00 00       	mov    $0x0,%eax
  80482a:	eb 4f                	jmp    80487b <pipe+0x1ef>
  80482c:	90                   	nop
  80482d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804831:	48 89 c6             	mov    %rax,%rsi
  804834:	bf 00 00 00 00       	mov    $0x0,%edi
  804839:	48 b8 ad 22 80 00 00 	movabs $0x8022ad,%rax
  804840:	00 00 00 
  804843:	ff d0                	callq  *%rax
  804845:	eb 01                	jmp    804848 <pipe+0x1bc>
  804847:	90                   	nop
  804848:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80484c:	48 89 c6             	mov    %rax,%rsi
  80484f:	bf 00 00 00 00       	mov    $0x0,%edi
  804854:	48 b8 ad 22 80 00 00 	movabs $0x8022ad,%rax
  80485b:	00 00 00 
  80485e:	ff d0                	callq  *%rax
  804860:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804864:	48 89 c6             	mov    %rax,%rsi
  804867:	bf 00 00 00 00       	mov    $0x0,%edi
  80486c:	48 b8 ad 22 80 00 00 	movabs $0x8022ad,%rax
  804873:	00 00 00 
  804876:	ff d0                	callq  *%rax
  804878:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80487b:	48 83 c4 38          	add    $0x38,%rsp
  80487f:	5b                   	pop    %rbx
  804880:	5d                   	pop    %rbp
  804881:	c3                   	retq   

0000000000804882 <_pipeisclosed>:
  804882:	55                   	push   %rbp
  804883:	48 89 e5             	mov    %rsp,%rbp
  804886:	53                   	push   %rbx
  804887:	48 83 ec 28          	sub    $0x28,%rsp
  80488b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80488f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804893:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  80489a:	00 00 00 
  80489d:	48 8b 00             	mov    (%rax),%rax
  8048a0:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  8048a6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8048a9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048ad:	48 89 c7             	mov    %rax,%rdi
  8048b0:	48 b8 22 50 80 00 00 	movabs $0x805022,%rax
  8048b7:	00 00 00 
  8048ba:	ff d0                	callq  *%rax
  8048bc:	89 c3                	mov    %eax,%ebx
  8048be:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8048c2:	48 89 c7             	mov    %rax,%rdi
  8048c5:	48 b8 22 50 80 00 00 	movabs $0x805022,%rax
  8048cc:	00 00 00 
  8048cf:	ff d0                	callq  *%rax
  8048d1:	39 c3                	cmp    %eax,%ebx
  8048d3:	0f 94 c0             	sete   %al
  8048d6:	0f b6 c0             	movzbl %al,%eax
  8048d9:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8048dc:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  8048e3:	00 00 00 
  8048e6:	48 8b 00             	mov    (%rax),%rax
  8048e9:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  8048ef:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8048f2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8048f5:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8048f8:	75 05                	jne    8048ff <_pipeisclosed+0x7d>
  8048fa:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8048fd:	eb 4a                	jmp    804949 <_pipeisclosed+0xc7>
  8048ff:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804902:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804905:	74 8c                	je     804893 <_pipeisclosed+0x11>
  804907:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  80490b:	75 86                	jne    804893 <_pipeisclosed+0x11>
  80490d:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  804914:	00 00 00 
  804917:	48 8b 00             	mov    (%rax),%rax
  80491a:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804920:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804923:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804926:	89 c6                	mov    %eax,%esi
  804928:	48 bf 83 5f 80 00 00 	movabs $0x805f83,%rdi
  80492f:	00 00 00 
  804932:	b8 00 00 00 00       	mov    $0x0,%eax
  804937:	49 b8 3b 0d 80 00 00 	movabs $0x800d3b,%r8
  80493e:	00 00 00 
  804941:	41 ff d0             	callq  *%r8
  804944:	e9 4a ff ff ff       	jmpq   804893 <_pipeisclosed+0x11>
  804949:	48 83 c4 28          	add    $0x28,%rsp
  80494d:	5b                   	pop    %rbx
  80494e:	5d                   	pop    %rbp
  80494f:	c3                   	retq   

0000000000804950 <pipeisclosed>:
  804950:	55                   	push   %rbp
  804951:	48 89 e5             	mov    %rsp,%rbp
  804954:	48 83 ec 30          	sub    $0x30,%rsp
  804958:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80495b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80495f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804962:	48 89 d6             	mov    %rdx,%rsi
  804965:	89 c7                	mov    %eax,%edi
  804967:	48 b8 31 2f 80 00 00 	movabs $0x802f31,%rax
  80496e:	00 00 00 
  804971:	ff d0                	callq  *%rax
  804973:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804976:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80497a:	79 05                	jns    804981 <pipeisclosed+0x31>
  80497c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80497f:	eb 31                	jmp    8049b2 <pipeisclosed+0x62>
  804981:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804985:	48 89 c7             	mov    %rax,%rdi
  804988:	48 b8 6e 2e 80 00 00 	movabs $0x802e6e,%rax
  80498f:	00 00 00 
  804992:	ff d0                	callq  *%rax
  804994:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804998:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80499c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8049a0:	48 89 d6             	mov    %rdx,%rsi
  8049a3:	48 89 c7             	mov    %rax,%rdi
  8049a6:	48 b8 82 48 80 00 00 	movabs $0x804882,%rax
  8049ad:	00 00 00 
  8049b0:	ff d0                	callq  *%rax
  8049b2:	c9                   	leaveq 
  8049b3:	c3                   	retq   

00000000008049b4 <devpipe_read>:
  8049b4:	55                   	push   %rbp
  8049b5:	48 89 e5             	mov    %rsp,%rbp
  8049b8:	48 83 ec 40          	sub    $0x40,%rsp
  8049bc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8049c0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8049c4:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8049c8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8049cc:	48 89 c7             	mov    %rax,%rdi
  8049cf:	48 b8 6e 2e 80 00 00 	movabs $0x802e6e,%rax
  8049d6:	00 00 00 
  8049d9:	ff d0                	callq  *%rax
  8049db:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8049df:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8049e3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8049e7:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8049ee:	00 
  8049ef:	e9 90 00 00 00       	jmpq   804a84 <devpipe_read+0xd0>
  8049f4:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8049f9:	74 09                	je     804a04 <devpipe_read+0x50>
  8049fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8049ff:	e9 8e 00 00 00       	jmpq   804a92 <devpipe_read+0xde>
  804a04:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804a08:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804a0c:	48 89 d6             	mov    %rdx,%rsi
  804a0f:	48 89 c7             	mov    %rax,%rdi
  804a12:	48 b8 82 48 80 00 00 	movabs $0x804882,%rax
  804a19:	00 00 00 
  804a1c:	ff d0                	callq  *%rax
  804a1e:	85 c0                	test   %eax,%eax
  804a20:	74 07                	je     804a29 <devpipe_read+0x75>
  804a22:	b8 00 00 00 00       	mov    $0x0,%eax
  804a27:	eb 69                	jmp    804a92 <devpipe_read+0xde>
  804a29:	48 b8 be 21 80 00 00 	movabs $0x8021be,%rax
  804a30:	00 00 00 
  804a33:	ff d0                	callq  *%rax
  804a35:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a39:	8b 10                	mov    (%rax),%edx
  804a3b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a3f:	8b 40 04             	mov    0x4(%rax),%eax
  804a42:	39 c2                	cmp    %eax,%edx
  804a44:	74 ae                	je     8049f4 <devpipe_read+0x40>
  804a46:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804a4a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a4e:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  804a52:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a56:	8b 00                	mov    (%rax),%eax
  804a58:	99                   	cltd   
  804a59:	c1 ea 1b             	shr    $0x1b,%edx
  804a5c:	01 d0                	add    %edx,%eax
  804a5e:	83 e0 1f             	and    $0x1f,%eax
  804a61:	29 d0                	sub    %edx,%eax
  804a63:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804a67:	48 98                	cltq   
  804a69:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804a6e:	88 01                	mov    %al,(%rcx)
  804a70:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a74:	8b 00                	mov    (%rax),%eax
  804a76:	8d 50 01             	lea    0x1(%rax),%edx
  804a79:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a7d:	89 10                	mov    %edx,(%rax)
  804a7f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804a84:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a88:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804a8c:	72 a7                	jb     804a35 <devpipe_read+0x81>
  804a8e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a92:	c9                   	leaveq 
  804a93:	c3                   	retq   

0000000000804a94 <devpipe_write>:
  804a94:	55                   	push   %rbp
  804a95:	48 89 e5             	mov    %rsp,%rbp
  804a98:	48 83 ec 40          	sub    $0x40,%rsp
  804a9c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804aa0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804aa4:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804aa8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804aac:	48 89 c7             	mov    %rax,%rdi
  804aaf:	48 b8 6e 2e 80 00 00 	movabs $0x802e6e,%rax
  804ab6:	00 00 00 
  804ab9:	ff d0                	callq  *%rax
  804abb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804abf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804ac3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804ac7:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804ace:	00 
  804acf:	e9 8f 00 00 00       	jmpq   804b63 <devpipe_write+0xcf>
  804ad4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804ad8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804adc:	48 89 d6             	mov    %rdx,%rsi
  804adf:	48 89 c7             	mov    %rax,%rdi
  804ae2:	48 b8 82 48 80 00 00 	movabs $0x804882,%rax
  804ae9:	00 00 00 
  804aec:	ff d0                	callq  *%rax
  804aee:	85 c0                	test   %eax,%eax
  804af0:	74 07                	je     804af9 <devpipe_write+0x65>
  804af2:	b8 00 00 00 00       	mov    $0x0,%eax
  804af7:	eb 78                	jmp    804b71 <devpipe_write+0xdd>
  804af9:	48 b8 be 21 80 00 00 	movabs $0x8021be,%rax
  804b00:	00 00 00 
  804b03:	ff d0                	callq  *%rax
  804b05:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b09:	8b 40 04             	mov    0x4(%rax),%eax
  804b0c:	48 63 d0             	movslq %eax,%rdx
  804b0f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b13:	8b 00                	mov    (%rax),%eax
  804b15:	48 98                	cltq   
  804b17:	48 83 c0 20          	add    $0x20,%rax
  804b1b:	48 39 c2             	cmp    %rax,%rdx
  804b1e:	73 b4                	jae    804ad4 <devpipe_write+0x40>
  804b20:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b24:	8b 40 04             	mov    0x4(%rax),%eax
  804b27:	99                   	cltd   
  804b28:	c1 ea 1b             	shr    $0x1b,%edx
  804b2b:	01 d0                	add    %edx,%eax
  804b2d:	83 e0 1f             	and    $0x1f,%eax
  804b30:	29 d0                	sub    %edx,%eax
  804b32:	89 c6                	mov    %eax,%esi
  804b34:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804b38:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b3c:	48 01 d0             	add    %rdx,%rax
  804b3f:	0f b6 08             	movzbl (%rax),%ecx
  804b42:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804b46:	48 63 c6             	movslq %esi,%rax
  804b49:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  804b4d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b51:	8b 40 04             	mov    0x4(%rax),%eax
  804b54:	8d 50 01             	lea    0x1(%rax),%edx
  804b57:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b5b:	89 50 04             	mov    %edx,0x4(%rax)
  804b5e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804b63:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b67:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804b6b:	72 98                	jb     804b05 <devpipe_write+0x71>
  804b6d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b71:	c9                   	leaveq 
  804b72:	c3                   	retq   

0000000000804b73 <devpipe_stat>:
  804b73:	55                   	push   %rbp
  804b74:	48 89 e5             	mov    %rsp,%rbp
  804b77:	48 83 ec 20          	sub    $0x20,%rsp
  804b7b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804b7f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804b83:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804b87:	48 89 c7             	mov    %rax,%rdi
  804b8a:	48 b8 6e 2e 80 00 00 	movabs $0x802e6e,%rax
  804b91:	00 00 00 
  804b94:	ff d0                	callq  *%rax
  804b96:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804b9a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804b9e:	48 be 96 5f 80 00 00 	movabs $0x805f96,%rsi
  804ba5:	00 00 00 
  804ba8:	48 89 c7             	mov    %rax,%rdi
  804bab:	48 b8 cb 18 80 00 00 	movabs $0x8018cb,%rax
  804bb2:	00 00 00 
  804bb5:	ff d0                	callq  *%rax
  804bb7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804bbb:	8b 50 04             	mov    0x4(%rax),%edx
  804bbe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804bc2:	8b 00                	mov    (%rax),%eax
  804bc4:	29 c2                	sub    %eax,%edx
  804bc6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804bca:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804bd0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804bd4:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804bdb:	00 00 00 
  804bde:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804be2:	48 b9 e0 80 80 00 00 	movabs $0x8080e0,%rcx
  804be9:	00 00 00 
  804bec:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804bf3:	b8 00 00 00 00       	mov    $0x0,%eax
  804bf8:	c9                   	leaveq 
  804bf9:	c3                   	retq   

0000000000804bfa <devpipe_close>:
  804bfa:	55                   	push   %rbp
  804bfb:	48 89 e5             	mov    %rsp,%rbp
  804bfe:	48 83 ec 10          	sub    $0x10,%rsp
  804c02:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804c06:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c0a:	48 89 c6             	mov    %rax,%rsi
  804c0d:	bf 00 00 00 00       	mov    $0x0,%edi
  804c12:	48 b8 ad 22 80 00 00 	movabs $0x8022ad,%rax
  804c19:	00 00 00 
  804c1c:	ff d0                	callq  *%rax
  804c1e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c22:	48 89 c7             	mov    %rax,%rdi
  804c25:	48 b8 6e 2e 80 00 00 	movabs $0x802e6e,%rax
  804c2c:	00 00 00 
  804c2f:	ff d0                	callq  *%rax
  804c31:	48 89 c6             	mov    %rax,%rsi
  804c34:	bf 00 00 00 00       	mov    $0x0,%edi
  804c39:	48 b8 ad 22 80 00 00 	movabs $0x8022ad,%rax
  804c40:	00 00 00 
  804c43:	ff d0                	callq  *%rax
  804c45:	c9                   	leaveq 
  804c46:	c3                   	retq   

0000000000804c47 <cputchar>:
  804c47:	55                   	push   %rbp
  804c48:	48 89 e5             	mov    %rsp,%rbp
  804c4b:	48 83 ec 20          	sub    $0x20,%rsp
  804c4f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804c52:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804c55:	88 45 ff             	mov    %al,-0x1(%rbp)
  804c58:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804c5c:	be 01 00 00 00       	mov    $0x1,%esi
  804c61:	48 89 c7             	mov    %rax,%rdi
  804c64:	48 b8 b3 20 80 00 00 	movabs $0x8020b3,%rax
  804c6b:	00 00 00 
  804c6e:	ff d0                	callq  *%rax
  804c70:	90                   	nop
  804c71:	c9                   	leaveq 
  804c72:	c3                   	retq   

0000000000804c73 <getchar>:
  804c73:	55                   	push   %rbp
  804c74:	48 89 e5             	mov    %rsp,%rbp
  804c77:	48 83 ec 10          	sub    $0x10,%rsp
  804c7b:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804c7f:	ba 01 00 00 00       	mov    $0x1,%edx
  804c84:	48 89 c6             	mov    %rax,%rsi
  804c87:	bf 00 00 00 00       	mov    $0x0,%edi
  804c8c:	48 b8 66 33 80 00 00 	movabs $0x803366,%rax
  804c93:	00 00 00 
  804c96:	ff d0                	callq  *%rax
  804c98:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804c9b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804c9f:	79 05                	jns    804ca6 <getchar+0x33>
  804ca1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804ca4:	eb 14                	jmp    804cba <getchar+0x47>
  804ca6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804caa:	7f 07                	jg     804cb3 <getchar+0x40>
  804cac:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804cb1:	eb 07                	jmp    804cba <getchar+0x47>
  804cb3:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804cb7:	0f b6 c0             	movzbl %al,%eax
  804cba:	c9                   	leaveq 
  804cbb:	c3                   	retq   

0000000000804cbc <iscons>:
  804cbc:	55                   	push   %rbp
  804cbd:	48 89 e5             	mov    %rsp,%rbp
  804cc0:	48 83 ec 20          	sub    $0x20,%rsp
  804cc4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804cc7:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804ccb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804cce:	48 89 d6             	mov    %rdx,%rsi
  804cd1:	89 c7                	mov    %eax,%edi
  804cd3:	48 b8 31 2f 80 00 00 	movabs $0x802f31,%rax
  804cda:	00 00 00 
  804cdd:	ff d0                	callq  *%rax
  804cdf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804ce2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804ce6:	79 05                	jns    804ced <iscons+0x31>
  804ce8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804ceb:	eb 1a                	jmp    804d07 <iscons+0x4b>
  804ced:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804cf1:	8b 10                	mov    (%rax),%edx
  804cf3:	48 b8 20 81 80 00 00 	movabs $0x808120,%rax
  804cfa:	00 00 00 
  804cfd:	8b 00                	mov    (%rax),%eax
  804cff:	39 c2                	cmp    %eax,%edx
  804d01:	0f 94 c0             	sete   %al
  804d04:	0f b6 c0             	movzbl %al,%eax
  804d07:	c9                   	leaveq 
  804d08:	c3                   	retq   

0000000000804d09 <opencons>:
  804d09:	55                   	push   %rbp
  804d0a:	48 89 e5             	mov    %rsp,%rbp
  804d0d:	48 83 ec 10          	sub    $0x10,%rsp
  804d11:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804d15:	48 89 c7             	mov    %rax,%rdi
  804d18:	48 b8 99 2e 80 00 00 	movabs $0x802e99,%rax
  804d1f:	00 00 00 
  804d22:	ff d0                	callq  *%rax
  804d24:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804d27:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804d2b:	79 05                	jns    804d32 <opencons+0x29>
  804d2d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804d30:	eb 5b                	jmp    804d8d <opencons+0x84>
  804d32:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804d36:	ba 07 04 00 00       	mov    $0x407,%edx
  804d3b:	48 89 c6             	mov    %rax,%rsi
  804d3e:	bf 00 00 00 00       	mov    $0x0,%edi
  804d43:	48 b8 fb 21 80 00 00 	movabs $0x8021fb,%rax
  804d4a:	00 00 00 
  804d4d:	ff d0                	callq  *%rax
  804d4f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804d52:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804d56:	79 05                	jns    804d5d <opencons+0x54>
  804d58:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804d5b:	eb 30                	jmp    804d8d <opencons+0x84>
  804d5d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804d61:	48 ba 20 81 80 00 00 	movabs $0x808120,%rdx
  804d68:	00 00 00 
  804d6b:	8b 12                	mov    (%rdx),%edx
  804d6d:	89 10                	mov    %edx,(%rax)
  804d6f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804d73:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804d7a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804d7e:	48 89 c7             	mov    %rax,%rdi
  804d81:	48 b8 4b 2e 80 00 00 	movabs $0x802e4b,%rax
  804d88:	00 00 00 
  804d8b:	ff d0                	callq  *%rax
  804d8d:	c9                   	leaveq 
  804d8e:	c3                   	retq   

0000000000804d8f <devcons_read>:
  804d8f:	55                   	push   %rbp
  804d90:	48 89 e5             	mov    %rsp,%rbp
  804d93:	48 83 ec 30          	sub    $0x30,%rsp
  804d97:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804d9b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804d9f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804da3:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804da8:	75 13                	jne    804dbd <devcons_read+0x2e>
  804daa:	b8 00 00 00 00       	mov    $0x0,%eax
  804daf:	eb 49                	jmp    804dfa <devcons_read+0x6b>
  804db1:	48 b8 be 21 80 00 00 	movabs $0x8021be,%rax
  804db8:	00 00 00 
  804dbb:	ff d0                	callq  *%rax
  804dbd:	48 b8 00 21 80 00 00 	movabs $0x802100,%rax
  804dc4:	00 00 00 
  804dc7:	ff d0                	callq  *%rax
  804dc9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804dcc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804dd0:	74 df                	je     804db1 <devcons_read+0x22>
  804dd2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804dd6:	79 05                	jns    804ddd <devcons_read+0x4e>
  804dd8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804ddb:	eb 1d                	jmp    804dfa <devcons_read+0x6b>
  804ddd:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804de1:	75 07                	jne    804dea <devcons_read+0x5b>
  804de3:	b8 00 00 00 00       	mov    $0x0,%eax
  804de8:	eb 10                	jmp    804dfa <devcons_read+0x6b>
  804dea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804ded:	89 c2                	mov    %eax,%edx
  804def:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804df3:	88 10                	mov    %dl,(%rax)
  804df5:	b8 01 00 00 00       	mov    $0x1,%eax
  804dfa:	c9                   	leaveq 
  804dfb:	c3                   	retq   

0000000000804dfc <devcons_write>:
  804dfc:	55                   	push   %rbp
  804dfd:	48 89 e5             	mov    %rsp,%rbp
  804e00:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  804e07:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804e0e:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804e15:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804e1c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804e23:	eb 76                	jmp    804e9b <devcons_write+0x9f>
  804e25:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804e2c:	89 c2                	mov    %eax,%edx
  804e2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804e31:	29 c2                	sub    %eax,%edx
  804e33:	89 d0                	mov    %edx,%eax
  804e35:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804e38:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804e3b:	83 f8 7f             	cmp    $0x7f,%eax
  804e3e:	76 07                	jbe    804e47 <devcons_write+0x4b>
  804e40:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804e47:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804e4a:	48 63 d0             	movslq %eax,%rdx
  804e4d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804e50:	48 63 c8             	movslq %eax,%rcx
  804e53:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804e5a:	48 01 c1             	add    %rax,%rcx
  804e5d:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804e64:	48 89 ce             	mov    %rcx,%rsi
  804e67:	48 89 c7             	mov    %rax,%rdi
  804e6a:	48 b8 f0 1b 80 00 00 	movabs $0x801bf0,%rax
  804e71:	00 00 00 
  804e74:	ff d0                	callq  *%rax
  804e76:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804e79:	48 63 d0             	movslq %eax,%rdx
  804e7c:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804e83:	48 89 d6             	mov    %rdx,%rsi
  804e86:	48 89 c7             	mov    %rax,%rdi
  804e89:	48 b8 b3 20 80 00 00 	movabs $0x8020b3,%rax
  804e90:	00 00 00 
  804e93:	ff d0                	callq  *%rax
  804e95:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804e98:	01 45 fc             	add    %eax,-0x4(%rbp)
  804e9b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804e9e:	48 98                	cltq   
  804ea0:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804ea7:	0f 82 78 ff ff ff    	jb     804e25 <devcons_write+0x29>
  804ead:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804eb0:	c9                   	leaveq 
  804eb1:	c3                   	retq   

0000000000804eb2 <devcons_close>:
  804eb2:	55                   	push   %rbp
  804eb3:	48 89 e5             	mov    %rsp,%rbp
  804eb6:	48 83 ec 08          	sub    $0x8,%rsp
  804eba:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804ebe:	b8 00 00 00 00       	mov    $0x0,%eax
  804ec3:	c9                   	leaveq 
  804ec4:	c3                   	retq   

0000000000804ec5 <devcons_stat>:
  804ec5:	55                   	push   %rbp
  804ec6:	48 89 e5             	mov    %rsp,%rbp
  804ec9:	48 83 ec 10          	sub    $0x10,%rsp
  804ecd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804ed1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804ed5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804ed9:	48 be a2 5f 80 00 00 	movabs $0x805fa2,%rsi
  804ee0:	00 00 00 
  804ee3:	48 89 c7             	mov    %rax,%rdi
  804ee6:	48 b8 cb 18 80 00 00 	movabs $0x8018cb,%rax
  804eed:	00 00 00 
  804ef0:	ff d0                	callq  *%rax
  804ef2:	b8 00 00 00 00       	mov    $0x0,%eax
  804ef7:	c9                   	leaveq 
  804ef8:	c3                   	retq   

0000000000804ef9 <set_pgfault_handler>:
  804ef9:	55                   	push   %rbp
  804efa:	48 89 e5             	mov    %rsp,%rbp
  804efd:	48 83 ec 20          	sub    $0x20,%rsp
  804f01:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804f05:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804f0c:	00 00 00 
  804f0f:	48 8b 00             	mov    (%rax),%rax
  804f12:	48 85 c0             	test   %rax,%rax
  804f15:	75 6f                	jne    804f86 <set_pgfault_handler+0x8d>
  804f17:	ba 07 00 00 00       	mov    $0x7,%edx
  804f1c:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  804f21:	bf 00 00 00 00       	mov    $0x0,%edi
  804f26:	48 b8 fb 21 80 00 00 	movabs $0x8021fb,%rax
  804f2d:	00 00 00 
  804f30:	ff d0                	callq  *%rax
  804f32:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804f35:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804f39:	79 30                	jns    804f6b <set_pgfault_handler+0x72>
  804f3b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804f3e:	89 c1                	mov    %eax,%ecx
  804f40:	48 ba b0 5f 80 00 00 	movabs $0x805fb0,%rdx
  804f47:	00 00 00 
  804f4a:	be 22 00 00 00       	mov    $0x22,%esi
  804f4f:	48 bf cf 5f 80 00 00 	movabs $0x805fcf,%rdi
  804f56:	00 00 00 
  804f59:	b8 00 00 00 00       	mov    $0x0,%eax
  804f5e:	49 b8 01 0b 80 00 00 	movabs $0x800b01,%r8
  804f65:	00 00 00 
  804f68:	41 ff d0             	callq  *%r8
  804f6b:	48 be 9a 4f 80 00 00 	movabs $0x804f9a,%rsi
  804f72:	00 00 00 
  804f75:	bf 00 00 00 00       	mov    $0x0,%edi
  804f7a:	48 b8 92 23 80 00 00 	movabs $0x802392,%rax
  804f81:	00 00 00 
  804f84:	ff d0                	callq  *%rax
  804f86:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804f8d:	00 00 00 
  804f90:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804f94:	48 89 10             	mov    %rdx,(%rax)
  804f97:	90                   	nop
  804f98:	c9                   	leaveq 
  804f99:	c3                   	retq   

0000000000804f9a <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  804f9a:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  804f9d:	48 a1 00 d0 80 00 00 	movabs 0x80d000,%rax
  804fa4:	00 00 00 
call *%rax
  804fa7:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  804fa9:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  804fb0:	00 08 
    movq 152(%rsp), %rax
  804fb2:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  804fb9:	00 
    movq 136(%rsp), %rbx
  804fba:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  804fc1:	00 
movq %rbx, (%rax)
  804fc2:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804fc5:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  804fc9:	4c 8b 3c 24          	mov    (%rsp),%r15
  804fcd:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  804fd2:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  804fd7:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  804fdc:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  804fe1:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  804fe6:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  804feb:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  804ff0:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  804ff5:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  804ffa:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  804fff:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  805004:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  805009:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  80500e:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  805013:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  805017:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  80501b:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  80501c:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  805021:	c3                   	retq   

0000000000805022 <pageref>:
  805022:	55                   	push   %rbp
  805023:	48 89 e5             	mov    %rsp,%rbp
  805026:	48 83 ec 18          	sub    $0x18,%rsp
  80502a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80502e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805032:	48 c1 e8 15          	shr    $0x15,%rax
  805036:	48 89 c2             	mov    %rax,%rdx
  805039:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  805040:	01 00 00 
  805043:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805047:	83 e0 01             	and    $0x1,%eax
  80504a:	48 85 c0             	test   %rax,%rax
  80504d:	75 07                	jne    805056 <pageref+0x34>
  80504f:	b8 00 00 00 00       	mov    $0x0,%eax
  805054:	eb 56                	jmp    8050ac <pageref+0x8a>
  805056:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80505a:	48 c1 e8 0c          	shr    $0xc,%rax
  80505e:	48 89 c2             	mov    %rax,%rdx
  805061:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  805068:	01 00 00 
  80506b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80506f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  805073:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805077:	83 e0 01             	and    $0x1,%eax
  80507a:	48 85 c0             	test   %rax,%rax
  80507d:	75 07                	jne    805086 <pageref+0x64>
  80507f:	b8 00 00 00 00       	mov    $0x0,%eax
  805084:	eb 26                	jmp    8050ac <pageref+0x8a>
  805086:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80508a:	48 c1 e8 0c          	shr    $0xc,%rax
  80508e:	48 89 c2             	mov    %rax,%rdx
  805091:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  805098:	00 00 00 
  80509b:	48 c1 e2 04          	shl    $0x4,%rdx
  80509f:	48 01 d0             	add    %rdx,%rax
  8050a2:	48 83 c0 08          	add    $0x8,%rax
  8050a6:	0f b7 00             	movzwl (%rax),%eax
  8050a9:	0f b7 c0             	movzwl %ax,%eax
  8050ac:	c9                   	leaveq 
  8050ad:	c3                   	retq   

00000000008050ae <inet_addr>:
  8050ae:	55                   	push   %rbp
  8050af:	48 89 e5             	mov    %rsp,%rbp
  8050b2:	48 83 ec 20          	sub    $0x20,%rsp
  8050b6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8050ba:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
  8050be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8050c2:	48 89 d6             	mov    %rdx,%rsi
  8050c5:	48 89 c7             	mov    %rax,%rdi
  8050c8:	48 b8 e4 50 80 00 00 	movabs $0x8050e4,%rax
  8050cf:	00 00 00 
  8050d2:	ff d0                	callq  *%rax
  8050d4:	85 c0                	test   %eax,%eax
  8050d6:	74 05                	je     8050dd <inet_addr+0x2f>
  8050d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8050db:	eb 05                	jmp    8050e2 <inet_addr+0x34>
  8050dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  8050e2:	c9                   	leaveq 
  8050e3:	c3                   	retq   

00000000008050e4 <inet_aton>:
  8050e4:	55                   	push   %rbp
  8050e5:	48 89 e5             	mov    %rsp,%rbp
  8050e8:	48 83 ec 40          	sub    $0x40,%rsp
  8050ec:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8050f0:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  8050f4:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8050f8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8050fc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805100:	0f b6 00             	movzbl (%rax),%eax
  805103:	0f be c0             	movsbl %al,%eax
  805106:	89 45 f4             	mov    %eax,-0xc(%rbp)
  805109:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80510c:	3c 2f                	cmp    $0x2f,%al
  80510e:	76 07                	jbe    805117 <inet_aton+0x33>
  805110:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805113:	3c 39                	cmp    $0x39,%al
  805115:	76 0a                	jbe    805121 <inet_aton+0x3d>
  805117:	b8 00 00 00 00       	mov    $0x0,%eax
  80511c:	e9 6a 02 00 00       	jmpq   80538b <inet_aton+0x2a7>
  805121:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  805128:	c7 45 f8 0a 00 00 00 	movl   $0xa,-0x8(%rbp)
  80512f:	83 7d f4 30          	cmpl   $0x30,-0xc(%rbp)
  805133:	75 40                	jne    805175 <inet_aton+0x91>
  805135:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  80513a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80513e:	0f b6 00             	movzbl (%rax),%eax
  805141:	0f be c0             	movsbl %al,%eax
  805144:	89 45 f4             	mov    %eax,-0xc(%rbp)
  805147:	83 7d f4 78          	cmpl   $0x78,-0xc(%rbp)
  80514b:	74 06                	je     805153 <inet_aton+0x6f>
  80514d:	83 7d f4 58          	cmpl   $0x58,-0xc(%rbp)
  805151:	75 1b                	jne    80516e <inet_aton+0x8a>
  805153:	c7 45 f8 10 00 00 00 	movl   $0x10,-0x8(%rbp)
  80515a:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  80515f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805163:	0f b6 00             	movzbl (%rax),%eax
  805166:	0f be c0             	movsbl %al,%eax
  805169:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80516c:	eb 07                	jmp    805175 <inet_aton+0x91>
  80516e:	c7 45 f8 08 00 00 00 	movl   $0x8,-0x8(%rbp)
  805175:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805178:	3c 2f                	cmp    $0x2f,%al
  80517a:	76 2f                	jbe    8051ab <inet_aton+0xc7>
  80517c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80517f:	3c 39                	cmp    $0x39,%al
  805181:	77 28                	ja     8051ab <inet_aton+0xc7>
  805183:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805186:	0f af 45 fc          	imul   -0x4(%rbp),%eax
  80518a:	89 c2                	mov    %eax,%edx
  80518c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80518f:	01 d0                	add    %edx,%eax
  805191:	83 e8 30             	sub    $0x30,%eax
  805194:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805197:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  80519c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8051a0:	0f b6 00             	movzbl (%rax),%eax
  8051a3:	0f be c0             	movsbl %al,%eax
  8051a6:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8051a9:	eb 73                	jmp    80521e <inet_aton+0x13a>
  8051ab:	83 7d f8 10          	cmpl   $0x10,-0x8(%rbp)
  8051af:	75 72                	jne    805223 <inet_aton+0x13f>
  8051b1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051b4:	3c 2f                	cmp    $0x2f,%al
  8051b6:	76 07                	jbe    8051bf <inet_aton+0xdb>
  8051b8:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051bb:	3c 39                	cmp    $0x39,%al
  8051bd:	76 1c                	jbe    8051db <inet_aton+0xf7>
  8051bf:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051c2:	3c 60                	cmp    $0x60,%al
  8051c4:	76 07                	jbe    8051cd <inet_aton+0xe9>
  8051c6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051c9:	3c 66                	cmp    $0x66,%al
  8051cb:	76 0e                	jbe    8051db <inet_aton+0xf7>
  8051cd:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051d0:	3c 40                	cmp    $0x40,%al
  8051d2:	76 4f                	jbe    805223 <inet_aton+0x13f>
  8051d4:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051d7:	3c 46                	cmp    $0x46,%al
  8051d9:	77 48                	ja     805223 <inet_aton+0x13f>
  8051db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8051de:	c1 e0 04             	shl    $0x4,%eax
  8051e1:	89 c2                	mov    %eax,%edx
  8051e3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051e6:	8d 48 0a             	lea    0xa(%rax),%ecx
  8051e9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051ec:	3c 60                	cmp    $0x60,%al
  8051ee:	76 0e                	jbe    8051fe <inet_aton+0x11a>
  8051f0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8051f3:	3c 7a                	cmp    $0x7a,%al
  8051f5:	77 07                	ja     8051fe <inet_aton+0x11a>
  8051f7:	b8 61 00 00 00       	mov    $0x61,%eax
  8051fc:	eb 05                	jmp    805203 <inet_aton+0x11f>
  8051fe:	b8 41 00 00 00       	mov    $0x41,%eax
  805203:	29 c1                	sub    %eax,%ecx
  805205:	89 c8                	mov    %ecx,%eax
  805207:	09 d0                	or     %edx,%eax
  805209:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80520c:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  805211:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805215:	0f b6 00             	movzbl (%rax),%eax
  805218:	0f be c0             	movsbl %al,%eax
  80521b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80521e:	e9 52 ff ff ff       	jmpq   805175 <inet_aton+0x91>
  805223:	83 7d f4 2e          	cmpl   $0x2e,-0xc(%rbp)
  805227:	75 40                	jne    805269 <inet_aton+0x185>
  805229:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80522d:	48 83 c0 0c          	add    $0xc,%rax
  805231:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  805235:	77 0a                	ja     805241 <inet_aton+0x15d>
  805237:	b8 00 00 00 00       	mov    $0x0,%eax
  80523c:	e9 4a 01 00 00       	jmpq   80538b <inet_aton+0x2a7>
  805241:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805245:	48 8d 50 04          	lea    0x4(%rax),%rdx
  805249:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80524d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  805250:	89 10                	mov    %edx,(%rax)
  805252:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  805257:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80525b:	0f b6 00             	movzbl (%rax),%eax
  80525e:	0f be c0             	movsbl %al,%eax
  805261:	89 45 f4             	mov    %eax,-0xc(%rbp)
  805264:	e9 a0 fe ff ff       	jmpq   805109 <inet_aton+0x25>
  805269:	90                   	nop
  80526a:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80526e:	74 3c                	je     8052ac <inet_aton+0x1c8>
  805270:	8b 45 f4             	mov    -0xc(%rbp),%eax
  805273:	3c 1f                	cmp    $0x1f,%al
  805275:	76 2b                	jbe    8052a2 <inet_aton+0x1be>
  805277:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80527a:	84 c0                	test   %al,%al
  80527c:	78 24                	js     8052a2 <inet_aton+0x1be>
  80527e:	83 7d f4 20          	cmpl   $0x20,-0xc(%rbp)
  805282:	74 28                	je     8052ac <inet_aton+0x1c8>
  805284:	83 7d f4 0c          	cmpl   $0xc,-0xc(%rbp)
  805288:	74 22                	je     8052ac <inet_aton+0x1c8>
  80528a:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  80528e:	74 1c                	je     8052ac <inet_aton+0x1c8>
  805290:	83 7d f4 0d          	cmpl   $0xd,-0xc(%rbp)
  805294:	74 16                	je     8052ac <inet_aton+0x1c8>
  805296:	83 7d f4 09          	cmpl   $0x9,-0xc(%rbp)
  80529a:	74 10                	je     8052ac <inet_aton+0x1c8>
  80529c:	83 7d f4 0b          	cmpl   $0xb,-0xc(%rbp)
  8052a0:	74 0a                	je     8052ac <inet_aton+0x1c8>
  8052a2:	b8 00 00 00 00       	mov    $0x0,%eax
  8052a7:	e9 df 00 00 00       	jmpq   80538b <inet_aton+0x2a7>
  8052ac:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8052b0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8052b4:	48 29 c2             	sub    %rax,%rdx
  8052b7:	48 89 d0             	mov    %rdx,%rax
  8052ba:	48 c1 f8 02          	sar    $0x2,%rax
  8052be:	83 c0 01             	add    $0x1,%eax
  8052c1:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8052c4:	83 7d e4 04          	cmpl   $0x4,-0x1c(%rbp)
  8052c8:	0f 87 98 00 00 00    	ja     805366 <inet_aton+0x282>
  8052ce:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8052d1:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8052d8:	00 
  8052d9:	48 b8 e0 5f 80 00 00 	movabs $0x805fe0,%rax
  8052e0:	00 00 00 
  8052e3:	48 01 d0             	add    %rdx,%rax
  8052e6:	48 8b 00             	mov    (%rax),%rax
  8052e9:	ff e0                	jmpq   *%rax
  8052eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8052f0:	e9 96 00 00 00       	jmpq   80538b <inet_aton+0x2a7>
  8052f5:	81 7d fc ff ff ff 00 	cmpl   $0xffffff,-0x4(%rbp)
  8052fc:	76 0a                	jbe    805308 <inet_aton+0x224>
  8052fe:	b8 00 00 00 00       	mov    $0x0,%eax
  805303:	e9 83 00 00 00       	jmpq   80538b <inet_aton+0x2a7>
  805308:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80530b:	c1 e0 18             	shl    $0x18,%eax
  80530e:	09 45 fc             	or     %eax,-0x4(%rbp)
  805311:	eb 53                	jmp    805366 <inet_aton+0x282>
  805313:	81 7d fc ff ff 00 00 	cmpl   $0xffff,-0x4(%rbp)
  80531a:	76 07                	jbe    805323 <inet_aton+0x23f>
  80531c:	b8 00 00 00 00       	mov    $0x0,%eax
  805321:	eb 68                	jmp    80538b <inet_aton+0x2a7>
  805323:	8b 45 d0             	mov    -0x30(%rbp),%eax
  805326:	c1 e0 18             	shl    $0x18,%eax
  805329:	89 c2                	mov    %eax,%edx
  80532b:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80532e:	c1 e0 10             	shl    $0x10,%eax
  805331:	09 d0                	or     %edx,%eax
  805333:	09 45 fc             	or     %eax,-0x4(%rbp)
  805336:	eb 2e                	jmp    805366 <inet_aton+0x282>
  805338:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
  80533f:	76 07                	jbe    805348 <inet_aton+0x264>
  805341:	b8 00 00 00 00       	mov    $0x0,%eax
  805346:	eb 43                	jmp    80538b <inet_aton+0x2a7>
  805348:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80534b:	c1 e0 18             	shl    $0x18,%eax
  80534e:	89 c2                	mov    %eax,%edx
  805350:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  805353:	c1 e0 10             	shl    $0x10,%eax
  805356:	09 c2                	or     %eax,%edx
  805358:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80535b:	c1 e0 08             	shl    $0x8,%eax
  80535e:	09 d0                	or     %edx,%eax
  805360:	09 45 fc             	or     %eax,-0x4(%rbp)
  805363:	eb 01                	jmp    805366 <inet_aton+0x282>
  805365:	90                   	nop
  805366:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
  80536b:	74 19                	je     805386 <inet_aton+0x2a2>
  80536d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805370:	89 c7                	mov    %eax,%edi
  805372:	48 b8 04 55 80 00 00 	movabs $0x805504,%rax
  805379:	00 00 00 
  80537c:	ff d0                	callq  *%rax
  80537e:	89 c2                	mov    %eax,%edx
  805380:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  805384:	89 10                	mov    %edx,(%rax)
  805386:	b8 01 00 00 00       	mov    $0x1,%eax
  80538b:	c9                   	leaveq 
  80538c:	c3                   	retq   

000000000080538d <inet_ntoa>:
  80538d:	55                   	push   %rbp
  80538e:	48 89 e5             	mov    %rsp,%rbp
  805391:	48 83 ec 28          	sub    $0x28,%rsp
  805395:	89 7d dc             	mov    %edi,-0x24(%rbp)
  805398:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80539b:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80539e:	48 b8 10 90 80 00 00 	movabs $0x809010,%rax
  8053a5:	00 00 00 
  8053a8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8053ac:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8053b0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8053b4:	c6 45 ef 00          	movb   $0x0,-0x11(%rbp)
  8053b8:	e9 e0 00 00 00       	jmpq   80549d <inet_ntoa+0x110>
  8053bd:	c6 45 ee 00          	movb   $0x0,-0x12(%rbp)
  8053c1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8053c5:	0f b6 08             	movzbl (%rax),%ecx
  8053c8:	0f b6 d1             	movzbl %cl,%edx
  8053cb:	89 d0                	mov    %edx,%eax
  8053cd:	c1 e0 02             	shl    $0x2,%eax
  8053d0:	01 d0                	add    %edx,%eax
  8053d2:	c1 e0 03             	shl    $0x3,%eax
  8053d5:	01 d0                	add    %edx,%eax
  8053d7:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  8053de:	01 d0                	add    %edx,%eax
  8053e0:	66 c1 e8 08          	shr    $0x8,%ax
  8053e4:	c0 e8 03             	shr    $0x3,%al
  8053e7:	88 45 ed             	mov    %al,-0x13(%rbp)
  8053ea:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  8053ee:	89 d0                	mov    %edx,%eax
  8053f0:	c1 e0 02             	shl    $0x2,%eax
  8053f3:	01 d0                	add    %edx,%eax
  8053f5:	01 c0                	add    %eax,%eax
  8053f7:	29 c1                	sub    %eax,%ecx
  8053f9:	89 c8                	mov    %ecx,%eax
  8053fb:	88 45 ed             	mov    %al,-0x13(%rbp)
  8053fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805402:	0f b6 00             	movzbl (%rax),%eax
  805405:	0f b6 d0             	movzbl %al,%edx
  805408:	89 d0                	mov    %edx,%eax
  80540a:	c1 e0 02             	shl    $0x2,%eax
  80540d:	01 d0                	add    %edx,%eax
  80540f:	c1 e0 03             	shl    $0x3,%eax
  805412:	01 d0                	add    %edx,%eax
  805414:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  80541b:	01 d0                	add    %edx,%eax
  80541d:	66 c1 e8 08          	shr    $0x8,%ax
  805421:	89 c2                	mov    %eax,%edx
  805423:	c0 ea 03             	shr    $0x3,%dl
  805426:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80542a:	88 10                	mov    %dl,(%rax)
  80542c:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  805430:	8d 50 01             	lea    0x1(%rax),%edx
  805433:	88 55 ee             	mov    %dl,-0x12(%rbp)
  805436:	0f b6 c0             	movzbl %al,%eax
  805439:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  80543d:	83 c2 30             	add    $0x30,%edx
  805440:	48 98                	cltq   
  805442:	88 54 05 e5          	mov    %dl,-0x1b(%rbp,%rax,1)
  805446:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80544a:	0f b6 00             	movzbl (%rax),%eax
  80544d:	84 c0                	test   %al,%al
  80544f:	0f 85 6c ff ff ff    	jne    8053c1 <inet_ntoa+0x34>
  805455:	eb 1a                	jmp    805471 <inet_ntoa+0xe4>
  805457:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80545b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80545f:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  805463:	0f b6 55 ee          	movzbl -0x12(%rbp),%edx
  805467:	48 63 d2             	movslq %edx,%rdx
  80546a:	0f b6 54 15 e5       	movzbl -0x1b(%rbp,%rdx,1),%edx
  80546f:	88 10                	mov    %dl,(%rax)
  805471:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  805475:	8d 50 ff             	lea    -0x1(%rax),%edx
  805478:	88 55 ee             	mov    %dl,-0x12(%rbp)
  80547b:	84 c0                	test   %al,%al
  80547d:	75 d8                	jne    805457 <inet_ntoa+0xca>
  80547f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805483:	48 8d 50 01          	lea    0x1(%rax),%rdx
  805487:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  80548b:	c6 00 2e             	movb   $0x2e,(%rax)
  80548e:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  805493:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  805497:	83 c0 01             	add    $0x1,%eax
  80549a:	88 45 ef             	mov    %al,-0x11(%rbp)
  80549d:	80 7d ef 03          	cmpb   $0x3,-0x11(%rbp)
  8054a1:	0f 86 16 ff ff ff    	jbe    8053bd <inet_ntoa+0x30>
  8054a7:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
  8054ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8054b0:	c6 00 00             	movb   $0x0,(%rax)
  8054b3:	48 b8 10 90 80 00 00 	movabs $0x809010,%rax
  8054ba:	00 00 00 
  8054bd:	c9                   	leaveq 
  8054be:	c3                   	retq   

00000000008054bf <htons>:
  8054bf:	55                   	push   %rbp
  8054c0:	48 89 e5             	mov    %rsp,%rbp
  8054c3:	48 83 ec 08          	sub    $0x8,%rsp
  8054c7:	89 f8                	mov    %edi,%eax
  8054c9:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  8054cd:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  8054d1:	c1 e0 08             	shl    $0x8,%eax
  8054d4:	89 c2                	mov    %eax,%edx
  8054d6:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  8054da:	66 c1 e8 08          	shr    $0x8,%ax
  8054de:	09 d0                	or     %edx,%eax
  8054e0:	c9                   	leaveq 
  8054e1:	c3                   	retq   

00000000008054e2 <ntohs>:
  8054e2:	55                   	push   %rbp
  8054e3:	48 89 e5             	mov    %rsp,%rbp
  8054e6:	48 83 ec 08          	sub    $0x8,%rsp
  8054ea:	89 f8                	mov    %edi,%eax
  8054ec:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  8054f0:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  8054f4:	89 c7                	mov    %eax,%edi
  8054f6:	48 b8 bf 54 80 00 00 	movabs $0x8054bf,%rax
  8054fd:	00 00 00 
  805500:	ff d0                	callq  *%rax
  805502:	c9                   	leaveq 
  805503:	c3                   	retq   

0000000000805504 <htonl>:
  805504:	55                   	push   %rbp
  805505:	48 89 e5             	mov    %rsp,%rbp
  805508:	48 83 ec 08          	sub    $0x8,%rsp
  80550c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80550f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805512:	c1 e0 18             	shl    $0x18,%eax
  805515:	89 c2                	mov    %eax,%edx
  805517:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80551a:	25 00 ff 00 00       	and    $0xff00,%eax
  80551f:	c1 e0 08             	shl    $0x8,%eax
  805522:	09 c2                	or     %eax,%edx
  805524:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805527:	25 00 00 ff 00       	and    $0xff0000,%eax
  80552c:	48 c1 e8 08          	shr    $0x8,%rax
  805530:	09 c2                	or     %eax,%edx
  805532:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805535:	c1 e8 18             	shr    $0x18,%eax
  805538:	09 d0                	or     %edx,%eax
  80553a:	c9                   	leaveq 
  80553b:	c3                   	retq   

000000000080553c <ntohl>:
  80553c:	55                   	push   %rbp
  80553d:	48 89 e5             	mov    %rsp,%rbp
  805540:	48 83 ec 08          	sub    $0x8,%rsp
  805544:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805547:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80554a:	89 c7                	mov    %eax,%edi
  80554c:	48 b8 04 55 80 00 00 	movabs $0x805504,%rax
  805553:	00 00 00 
  805556:	ff d0                	callq  *%rax
  805558:	c9                   	leaveq 
  805559:	c3                   	retq   
