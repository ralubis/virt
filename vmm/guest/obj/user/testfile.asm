
vmm/guest/obj/user/testfile:     file format elf64-x86-64


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
  80003c:	e8 1b 0c 00 00       	callq  800c5c <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <xopen>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80004f:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800052:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800056:	48 89 c6             	mov    %rax,%rsi
  800059:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  800060:	00 00 00 
  800063:	48 b8 ce 1a 80 00 00 	movabs $0x801ace,%rax
  80006a:	00 00 00 
  80006d:	ff d0                	callq  *%rax
  80006f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  800076:	00 00 00 
  800079:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80007c:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  800082:	bf 01 00 00 00       	mov    $0x1,%edi
  800087:	48 b8 c5 29 80 00 00 	movabs $0x8029c5,%rax
  80008e:	00 00 00 
  800091:	ff d0                	callq  *%rax
  800093:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800096:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800099:	b9 07 00 00 00       	mov    $0x7,%ecx
  80009e:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  8000a5:	00 00 00 
  8000a8:	be 01 00 00 00       	mov    $0x1,%esi
  8000ad:	89 c7                	mov    %eax,%edi
  8000af:	48 b8 bb 28 80 00 00 	movabs $0x8028bb,%rax
  8000b6:	00 00 00 
  8000b9:	ff d0                	callq  *%rax
  8000bb:	ba 00 00 00 00       	mov    $0x0,%edx
  8000c0:	be 00 c0 cc cc       	mov    $0xccccc000,%esi
  8000c5:	bf 00 00 00 00       	mov    $0x0,%edi
  8000ca:	48 b8 fa 27 80 00 00 	movabs $0x8027fa,%rax
  8000d1:	00 00 00 
  8000d4:	ff d0                	callq  *%rax
  8000d6:	c9                   	leaveq 
  8000d7:	c3                   	retq   

00000000008000d8 <umain>:
  8000d8:	55                   	push   %rbp
  8000d9:	48 89 e5             	mov    %rsp,%rbp
  8000dc:	53                   	push   %rbx
  8000dd:	48 81 ec d8 02 00 00 	sub    $0x2d8,%rsp
  8000e4:	89 bd 2c fd ff ff    	mov    %edi,-0x2d4(%rbp)
  8000ea:	48 89 b5 20 fd ff ff 	mov    %rsi,-0x2e0(%rbp)
  8000f1:	be 00 00 00 00       	mov    $0x0,%esi
  8000f6:	48 bf a6 4b 80 00 00 	movabs $0x804ba6,%rdi
  8000fd:	00 00 00 
  800100:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800107:	00 00 00 
  80010a:	ff d0                	callq  *%rax
  80010c:	48 98                	cltq   
  80010e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800112:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800117:	79 39                	jns    800152 <umain+0x7a>
  800119:	48 83 7d e0 f4       	cmpq   $0xfffffffffffffff4,-0x20(%rbp)
  80011e:	74 32                	je     800152 <umain+0x7a>
  800120:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800124:	48 89 c1             	mov    %rax,%rcx
  800127:	48 ba b1 4b 80 00 00 	movabs $0x804bb1,%rdx
  80012e:	00 00 00 
  800131:	be 21 00 00 00       	mov    $0x21,%esi
  800136:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  80013d:	00 00 00 
  800140:	b8 00 00 00 00       	mov    $0x0,%eax
  800145:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  80014c:	00 00 00 
  80014f:	41 ff d0             	callq  *%r8
  800152:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800157:	78 2a                	js     800183 <umain+0xab>
  800159:	48 ba e0 4b 80 00 00 	movabs $0x804be0,%rdx
  800160:	00 00 00 
  800163:	be 23 00 00 00       	mov    $0x23,%esi
  800168:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  80016f:	00 00 00 
  800172:	b8 00 00 00 00       	mov    $0x0,%eax
  800177:	48 b9 04 0d 80 00 00 	movabs $0x800d04,%rcx
  80017e:	00 00 00 
  800181:	ff d1                	callq  *%rcx
  800183:	be 00 00 00 00       	mov    $0x0,%esi
  800188:	48 bf 01 4c 80 00 00 	movabs $0x804c01,%rdi
  80018f:	00 00 00 
  800192:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800199:	00 00 00 
  80019c:	ff d0                	callq  *%rax
  80019e:	48 98                	cltq   
  8001a0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8001a4:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8001a9:	79 32                	jns    8001dd <umain+0x105>
  8001ab:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8001af:	48 89 c1             	mov    %rax,%rcx
  8001b2:	48 ba 0a 4c 80 00 00 	movabs $0x804c0a,%rdx
  8001b9:	00 00 00 
  8001bc:	be 26 00 00 00       	mov    $0x26,%esi
  8001c1:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  8001c8:	00 00 00 
  8001cb:	b8 00 00 00 00       	mov    $0x0,%eax
  8001d0:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  8001d7:	00 00 00 
  8001da:	41 ff d0             	callq  *%r8
  8001dd:	b8 00 c0 cc cc       	mov    $0xccccc000,%eax
  8001e2:	8b 00                	mov    (%rax),%eax
  8001e4:	83 f8 66             	cmp    $0x66,%eax
  8001e7:	75 18                	jne    800201 <umain+0x129>
  8001e9:	b8 00 c0 cc cc       	mov    $0xccccc000,%eax
  8001ee:	8b 40 04             	mov    0x4(%rax),%eax
  8001f1:	85 c0                	test   %eax,%eax
  8001f3:	75 0c                	jne    800201 <umain+0x129>
  8001f5:	b8 00 c0 cc cc       	mov    $0xccccc000,%eax
  8001fa:	8b 40 08             	mov    0x8(%rax),%eax
  8001fd:	85 c0                	test   %eax,%eax
  8001ff:	74 2a                	je     80022b <umain+0x153>
  800201:	48 ba 28 4c 80 00 00 	movabs $0x804c28,%rdx
  800208:	00 00 00 
  80020b:	be 28 00 00 00       	mov    $0x28,%esi
  800210:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  800217:	00 00 00 
  80021a:	b8 00 00 00 00       	mov    $0x0,%eax
  80021f:	48 b9 04 0d 80 00 00 	movabs $0x800d04,%rcx
  800226:	00 00 00 
  800229:	ff d1                	callq  *%rcx
  80022b:	48 bf 55 4c 80 00 00 	movabs $0x804c55,%rdi
  800232:	00 00 00 
  800235:	b8 00 00 00 00       	mov    $0x0,%eax
  80023a:	48 ba 3e 0f 80 00 00 	movabs $0x800f3e,%rdx
  800241:	00 00 00 
  800244:	ff d2                	callq  *%rdx
  800246:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  80024d:	00 00 00 
  800250:	48 8b 40 28          	mov    0x28(%rax),%rax
  800254:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80025b:	48 89 d6             	mov    %rdx,%rsi
  80025e:	bf 00 c0 cc cc       	mov    $0xccccc000,%edi
  800263:	ff d0                	callq  *%rax
  800265:	48 98                	cltq   
  800267:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80026b:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800270:	79 32                	jns    8002a4 <umain+0x1cc>
  800272:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800276:	48 89 c1             	mov    %rax,%rcx
  800279:	48 ba 69 4c 80 00 00 	movabs $0x804c69,%rdx
  800280:	00 00 00 
  800283:	be 2c 00 00 00       	mov    $0x2c,%esi
  800288:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  80028f:	00 00 00 
  800292:	b8 00 00 00 00       	mov    $0x0,%eax
  800297:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  80029e:	00 00 00 
  8002a1:	41 ff d0             	callq  *%r8
  8002a4:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8002ab:	00 00 00 
  8002ae:	48 8b 00             	mov    (%rax),%rax
  8002b1:	48 89 c7             	mov    %rax,%rdi
  8002b4:	48 b8 62 1a 80 00 00 	movabs $0x801a62,%rax
  8002bb:	00 00 00 
  8002be:	ff d0                	callq  *%rax
  8002c0:	89 c2                	mov    %eax,%edx
  8002c2:	8b 45 b0             	mov    -0x50(%rbp),%eax
  8002c5:	39 c2                	cmp    %eax,%edx
  8002c7:	74 51                	je     80031a <umain+0x242>
  8002c9:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8002d0:	00 00 00 
  8002d3:	48 8b 00             	mov    (%rax),%rax
  8002d6:	48 89 c7             	mov    %rax,%rdi
  8002d9:	48 b8 62 1a 80 00 00 	movabs $0x801a62,%rax
  8002e0:	00 00 00 
  8002e3:	ff d0                	callq  *%rax
  8002e5:	89 c2                	mov    %eax,%edx
  8002e7:	8b 45 b0             	mov    -0x50(%rbp),%eax
  8002ea:	41 89 d0             	mov    %edx,%r8d
  8002ed:	89 c1                	mov    %eax,%ecx
  8002ef:	48 ba 78 4c 80 00 00 	movabs $0x804c78,%rdx
  8002f6:	00 00 00 
  8002f9:	be 2e 00 00 00       	mov    $0x2e,%esi
  8002fe:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  800305:	00 00 00 
  800308:	b8 00 00 00 00       	mov    $0x0,%eax
  80030d:	49 b9 04 0d 80 00 00 	movabs $0x800d04,%r9
  800314:	00 00 00 
  800317:	41 ff d1             	callq  *%r9
  80031a:	48 bf 9e 4c 80 00 00 	movabs $0x804c9e,%rdi
  800321:	00 00 00 
  800324:	b8 00 00 00 00       	mov    $0x0,%eax
  800329:	48 ba 3e 0f 80 00 00 	movabs $0x800f3e,%rdx
  800330:	00 00 00 
  800333:	ff d2                	callq  *%rdx
  800335:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  80033c:	ba 00 02 00 00       	mov    $0x200,%edx
  800341:	be 00 00 00 00       	mov    $0x0,%esi
  800346:	48 89 c7             	mov    %rax,%rdi
  800349:	48 b8 68 1d 80 00 00 	movabs $0x801d68,%rax
  800350:	00 00 00 
  800353:	ff d0                	callq  *%rax
  800355:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  80035c:	00 00 00 
  80035f:	48 8b 40 10          	mov    0x10(%rax),%rax
  800363:	48 8d 8d 30 fd ff ff 	lea    -0x2d0(%rbp),%rcx
  80036a:	ba 00 02 00 00       	mov    $0x200,%edx
  80036f:	48 89 ce             	mov    %rcx,%rsi
  800372:	bf 00 c0 cc cc       	mov    $0xccccc000,%edi
  800377:	ff d0                	callq  *%rax
  800379:	48 98                	cltq   
  80037b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80037f:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800384:	79 32                	jns    8003b8 <umain+0x2e0>
  800386:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80038a:	48 89 c1             	mov    %rax,%rcx
  80038d:	48 ba b1 4c 80 00 00 	movabs $0x804cb1,%rdx
  800394:	00 00 00 
  800397:	be 33 00 00 00       	mov    $0x33,%esi
  80039c:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  8003a3:	00 00 00 
  8003a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8003ab:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  8003b2:	00 00 00 
  8003b5:	41 ff d0             	callq  *%r8
  8003b8:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8003bf:	00 00 00 
  8003c2:	48 8b 10             	mov    (%rax),%rdx
  8003c5:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  8003cc:	48 89 d6             	mov    %rdx,%rsi
  8003cf:	48 89 c7             	mov    %rax,%rdi
  8003d2:	48 b8 30 1c 80 00 00 	movabs $0x801c30,%rax
  8003d9:	00 00 00 
  8003dc:	ff d0                	callq  *%rax
  8003de:	85 c0                	test   %eax,%eax
  8003e0:	74 2a                	je     80040c <umain+0x334>
  8003e2:	48 ba bf 4c 80 00 00 	movabs $0x804cbf,%rdx
  8003e9:	00 00 00 
  8003ec:	be 35 00 00 00       	mov    $0x35,%esi
  8003f1:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  8003f8:	00 00 00 
  8003fb:	b8 00 00 00 00       	mov    $0x0,%eax
  800400:	48 b9 04 0d 80 00 00 	movabs $0x800d04,%rcx
  800407:	00 00 00 
  80040a:	ff d1                	callq  *%rcx
  80040c:	48 bf dd 4c 80 00 00 	movabs $0x804cdd,%rdi
  800413:	00 00 00 
  800416:	b8 00 00 00 00       	mov    $0x0,%eax
  80041b:	48 ba 3e 0f 80 00 00 	movabs $0x800f3e,%rdx
  800422:	00 00 00 
  800425:	ff d2                	callq  *%rdx
  800427:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  80042e:	00 00 00 
  800431:	48 8b 40 20          	mov    0x20(%rax),%rax
  800435:	bf 00 c0 cc cc       	mov    $0xccccc000,%edi
  80043a:	ff d0                	callq  *%rax
  80043c:	48 98                	cltq   
  80043e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800442:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800447:	79 32                	jns    80047b <umain+0x3a3>
  800449:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80044d:	48 89 c1             	mov    %rax,%rcx
  800450:	48 ba f0 4c 80 00 00 	movabs $0x804cf0,%rdx
  800457:	00 00 00 
  80045a:	be 39 00 00 00       	mov    $0x39,%esi
  80045f:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  800466:	00 00 00 
  800469:	b8 00 00 00 00       	mov    $0x0,%eax
  80046e:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  800475:	00 00 00 
  800478:	41 ff d0             	callq  *%r8
  80047b:	48 bf ff 4c 80 00 00 	movabs $0x804cff,%rdi
  800482:	00 00 00 
  800485:	b8 00 00 00 00       	mov    $0x0,%eax
  80048a:	48 ba 3e 0f 80 00 00 	movabs $0x800f3e,%rdx
  800491:	00 00 00 
  800494:	ff d2                	callq  *%rdx
  800496:	b8 00 c0 cc cc       	mov    $0xccccc000,%eax
  80049b:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80049f:	48 8b 00             	mov    (%rax),%rax
  8004a2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  8004a6:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8004aa:	be 00 c0 cc cc       	mov    $0xccccc000,%esi
  8004af:	bf 00 00 00 00       	mov    $0x0,%edi
  8004b4:	48 b8 b0 24 80 00 00 	movabs $0x8024b0,%rax
  8004bb:	00 00 00 
  8004be:	ff d0                	callq  *%rax
  8004c0:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  8004c7:	00 00 00 
  8004ca:	48 8b 40 10          	mov    0x10(%rax),%rax
  8004ce:	48 8d b5 30 fd ff ff 	lea    -0x2d0(%rbp),%rsi
  8004d5:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
  8004d9:	ba 00 02 00 00       	mov    $0x200,%edx
  8004de:	48 89 cf             	mov    %rcx,%rdi
  8004e1:	ff d0                	callq  *%rax
  8004e3:	48 98                	cltq   
  8004e5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8004e9:	48 83 7d e0 fd       	cmpq   $0xfffffffffffffffd,-0x20(%rbp)
  8004ee:	74 32                	je     800522 <umain+0x44a>
  8004f0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8004f4:	48 89 c1             	mov    %rax,%rcx
  8004f7:	48 ba 18 4d 80 00 00 	movabs $0x804d18,%rdx
  8004fe:	00 00 00 
  800501:	be 44 00 00 00       	mov    $0x44,%esi
  800506:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  80050d:	00 00 00 
  800510:	b8 00 00 00 00       	mov    $0x0,%eax
  800515:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  80051c:	00 00 00 
  80051f:	41 ff d0             	callq  *%r8
  800522:	48 bf 4f 4d 80 00 00 	movabs $0x804d4f,%rdi
  800529:	00 00 00 
  80052c:	b8 00 00 00 00       	mov    $0x0,%eax
  800531:	48 ba 3e 0f 80 00 00 	movabs $0x800f3e,%rdx
  800538:	00 00 00 
  80053b:	ff d2                	callq  *%rdx
  80053d:	be 02 01 00 00       	mov    $0x102,%esi
  800542:	48 bf 65 4d 80 00 00 	movabs $0x804d65,%rdi
  800549:	00 00 00 
  80054c:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800553:	00 00 00 
  800556:	ff d0                	callq  *%rax
  800558:	48 98                	cltq   
  80055a:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80055e:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800563:	79 32                	jns    800597 <umain+0x4bf>
  800565:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800569:	48 89 c1             	mov    %rax,%rcx
  80056c:	48 ba 6f 4d 80 00 00 	movabs $0x804d6f,%rdx
  800573:	00 00 00 
  800576:	be 49 00 00 00       	mov    $0x49,%esi
  80057b:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  800582:	00 00 00 
  800585:	b8 00 00 00 00       	mov    $0x0,%eax
  80058a:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  800591:	00 00 00 
  800594:	41 ff d0             	callq  *%r8
  800597:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80059e:	00 00 00 
  8005a1:	48 8b 10             	mov    (%rax),%rdx
  8005a4:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  8005ab:	00 00 00 
  8005ae:	48 8b 70 18          	mov    0x18(%rax),%rsi
  8005b2:	48 83 ec 08          	sub    $0x8,%rsp
  8005b6:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  8005bd:	00 00 00 
  8005c0:	ff 70 30             	pushq  0x30(%rax)
  8005c3:	ff 70 28             	pushq  0x28(%rax)
  8005c6:	ff 70 20             	pushq  0x20(%rax)
  8005c9:	ff 70 18             	pushq  0x18(%rax)
  8005cc:	ff 70 10             	pushq  0x10(%rax)
  8005cf:	ff 70 08             	pushq  0x8(%rax)
  8005d2:	ff 30                	pushq  (%rax)
  8005d4:	b9 00 c0 cc cc       	mov    $0xccccc000,%ecx
  8005d9:	48 bf 88 4d 80 00 00 	movabs $0x804d88,%rdi
  8005e0:	00 00 00 
  8005e3:	b8 00 00 00 00       	mov    $0x0,%eax
  8005e8:	49 b8 3e 0f 80 00 00 	movabs $0x800f3e,%r8
  8005ef:	00 00 00 
  8005f2:	41 ff d0             	callq  *%r8
  8005f5:	48 83 c4 40          	add    $0x40,%rsp
  8005f9:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  800600:	00 00 00 
  800603:	48 8b 58 18          	mov    0x18(%rax),%rbx
  800607:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80060e:	00 00 00 
  800611:	48 8b 00             	mov    (%rax),%rax
  800614:	48 89 c7             	mov    %rax,%rdi
  800617:	48 b8 62 1a 80 00 00 	movabs $0x801a62,%rax
  80061e:	00 00 00 
  800621:	ff d0                	callq  *%rax
  800623:	48 63 d0             	movslq %eax,%rdx
  800626:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80062d:	00 00 00 
  800630:	48 8b 00             	mov    (%rax),%rax
  800633:	48 89 c6             	mov    %rax,%rsi
  800636:	bf 00 c0 cc cc       	mov    $0xccccc000,%edi
  80063b:	ff d3                	callq  *%rbx
  80063d:	48 98                	cltq   
  80063f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800643:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80064a:	00 00 00 
  80064d:	48 8b 00             	mov    (%rax),%rax
  800650:	48 89 c7             	mov    %rax,%rdi
  800653:	48 b8 62 1a 80 00 00 	movabs $0x801a62,%rax
  80065a:	00 00 00 
  80065d:	ff d0                	callq  *%rax
  80065f:	48 98                	cltq   
  800661:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
  800665:	74 32                	je     800699 <umain+0x5c1>
  800667:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80066b:	48 89 c1             	mov    %rax,%rcx
  80066e:	48 ba c8 4d 80 00 00 	movabs $0x804dc8,%rdx
  800675:	00 00 00 
  800678:	be 4e 00 00 00       	mov    $0x4e,%esi
  80067d:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  800684:	00 00 00 
  800687:	b8 00 00 00 00       	mov    $0x0,%eax
  80068c:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  800693:	00 00 00 
  800696:	41 ff d0             	callq  *%r8
  800699:	48 bf d7 4d 80 00 00 	movabs $0x804dd7,%rdi
  8006a0:	00 00 00 
  8006a3:	b8 00 00 00 00       	mov    $0x0,%eax
  8006a8:	48 ba 3e 0f 80 00 00 	movabs $0x800f3e,%rdx
  8006af:	00 00 00 
  8006b2:	ff d2                	callq  *%rdx
  8006b4:	b8 00 c0 cc cc       	mov    $0xccccc000,%eax
  8006b9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  8006c0:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  8006c7:	ba 00 02 00 00       	mov    $0x200,%edx
  8006cc:	be 00 00 00 00       	mov    $0x0,%esi
  8006d1:	48 89 c7             	mov    %rax,%rdi
  8006d4:	48 b8 68 1d 80 00 00 	movabs $0x801d68,%rax
  8006db:	00 00 00 
  8006de:	ff d0                	callq  *%rax
  8006e0:	48 b8 60 70 80 00 00 	movabs $0x807060,%rax
  8006e7:	00 00 00 
  8006ea:	48 8b 40 10          	mov    0x10(%rax),%rax
  8006ee:	48 8d 8d 30 fd ff ff 	lea    -0x2d0(%rbp),%rcx
  8006f5:	ba 00 02 00 00       	mov    $0x200,%edx
  8006fa:	48 89 ce             	mov    %rcx,%rsi
  8006fd:	bf 00 c0 cc cc       	mov    $0xccccc000,%edi
  800702:	ff d0                	callq  *%rax
  800704:	48 98                	cltq   
  800706:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80070a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80070f:	79 32                	jns    800743 <umain+0x66b>
  800711:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800715:	48 89 c1             	mov    %rax,%rcx
  800718:	48 ba f0 4d 80 00 00 	movabs $0x804df0,%rdx
  80071f:	00 00 00 
  800722:	be 54 00 00 00       	mov    $0x54,%esi
  800727:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  80072e:	00 00 00 
  800731:	b8 00 00 00 00       	mov    $0x0,%eax
  800736:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  80073d:	00 00 00 
  800740:	41 ff d0             	callq  *%r8
  800743:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80074a:	00 00 00 
  80074d:	48 8b 00             	mov    (%rax),%rax
  800750:	48 89 c7             	mov    %rax,%rdi
  800753:	48 b8 62 1a 80 00 00 	movabs $0x801a62,%rax
  80075a:	00 00 00 
  80075d:	ff d0                	callq  *%rax
  80075f:	48 98                	cltq   
  800761:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
  800765:	74 32                	je     800799 <umain+0x6c1>
  800767:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80076b:	48 89 c1             	mov    %rax,%rcx
  80076e:	48 ba 10 4e 80 00 00 	movabs $0x804e10,%rdx
  800775:	00 00 00 
  800778:	be 56 00 00 00       	mov    $0x56,%esi
  80077d:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  800784:	00 00 00 
  800787:	b8 00 00 00 00       	mov    $0x0,%eax
  80078c:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  800793:	00 00 00 
  800796:	41 ff d0             	callq  *%r8
  800799:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8007a0:	00 00 00 
  8007a3:	48 8b 10             	mov    (%rax),%rdx
  8007a6:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  8007ad:	48 89 d6             	mov    %rdx,%rsi
  8007b0:	48 89 c7             	mov    %rax,%rdi
  8007b3:	48 b8 30 1c 80 00 00 	movabs $0x801c30,%rax
  8007ba:	00 00 00 
  8007bd:	ff d0                	callq  *%rax
  8007bf:	85 c0                	test   %eax,%eax
  8007c1:	74 2a                	je     8007ed <umain+0x715>
  8007c3:	48 ba 48 4e 80 00 00 	movabs $0x804e48,%rdx
  8007ca:	00 00 00 
  8007cd:	be 58 00 00 00       	mov    $0x58,%esi
  8007d2:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  8007d9:	00 00 00 
  8007dc:	b8 00 00 00 00       	mov    $0x0,%eax
  8007e1:	48 b9 04 0d 80 00 00 	movabs $0x800d04,%rcx
  8007e8:	00 00 00 
  8007eb:	ff d1                	callq  *%rcx
  8007ed:	48 bf 78 4e 80 00 00 	movabs $0x804e78,%rdi
  8007f4:	00 00 00 
  8007f7:	b8 00 00 00 00       	mov    $0x0,%eax
  8007fc:	48 ba 3e 0f 80 00 00 	movabs $0x800f3e,%rdx
  800803:	00 00 00 
  800806:	ff d2                	callq  *%rdx
  800808:	be 00 00 00 00       	mov    $0x0,%esi
  80080d:	48 bf a6 4b 80 00 00 	movabs $0x804ba6,%rdi
  800814:	00 00 00 
  800817:	48 b8 2a 34 80 00 00 	movabs $0x80342a,%rax
  80081e:	00 00 00 
  800821:	ff d0                	callq  *%rax
  800823:	48 98                	cltq   
  800825:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800829:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80082e:	79 39                	jns    800869 <umain+0x791>
  800830:	48 83 7d e0 f4       	cmpq   $0xfffffffffffffff4,-0x20(%rbp)
  800835:	74 32                	je     800869 <umain+0x791>
  800837:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80083b:	48 89 c1             	mov    %rax,%rcx
  80083e:	48 ba 9c 4e 80 00 00 	movabs $0x804e9c,%rdx
  800845:	00 00 00 
  800848:	be 5d 00 00 00       	mov    $0x5d,%esi
  80084d:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  800854:	00 00 00 
  800857:	b8 00 00 00 00       	mov    $0x0,%eax
  80085c:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  800863:	00 00 00 
  800866:	41 ff d0             	callq  *%r8
  800869:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80086e:	78 2a                	js     80089a <umain+0x7c2>
  800870:	48 ba b0 4e 80 00 00 	movabs $0x804eb0,%rdx
  800877:	00 00 00 
  80087a:	be 5f 00 00 00       	mov    $0x5f,%esi
  80087f:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  800886:	00 00 00 
  800889:	b8 00 00 00 00       	mov    $0x0,%eax
  80088e:	48 b9 04 0d 80 00 00 	movabs $0x800d04,%rcx
  800895:	00 00 00 
  800898:	ff d1                	callq  *%rcx
  80089a:	be 00 00 00 00       	mov    $0x0,%esi
  80089f:	48 bf 01 4c 80 00 00 	movabs $0x804c01,%rdi
  8008a6:	00 00 00 
  8008a9:	48 b8 2a 34 80 00 00 	movabs $0x80342a,%rax
  8008b0:	00 00 00 
  8008b3:	ff d0                	callq  *%rax
  8008b5:	48 98                	cltq   
  8008b7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8008bb:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8008c0:	79 32                	jns    8008f4 <umain+0x81c>
  8008c2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8008c6:	48 89 c1             	mov    %rax,%rcx
  8008c9:	48 ba cb 4e 80 00 00 	movabs $0x804ecb,%rdx
  8008d0:	00 00 00 
  8008d3:	be 62 00 00 00       	mov    $0x62,%esi
  8008d8:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  8008df:	00 00 00 
  8008e2:	b8 00 00 00 00       	mov    $0x0,%eax
  8008e7:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  8008ee:	00 00 00 
  8008f1:	41 ff d0             	callq  *%r8
  8008f4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8008f8:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8008fe:	48 c1 e0 0c          	shl    $0xc,%rax
  800902:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800906:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80090a:	8b 00                	mov    (%rax),%eax
  80090c:	83 f8 66             	cmp    $0x66,%eax
  80090f:	75 16                	jne    800927 <umain+0x84f>
  800911:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800915:	8b 40 04             	mov    0x4(%rax),%eax
  800918:	85 c0                	test   %eax,%eax
  80091a:	75 0b                	jne    800927 <umain+0x84f>
  80091c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800920:	8b 40 08             	mov    0x8(%rax),%eax
  800923:	85 c0                	test   %eax,%eax
  800925:	74 2a                	je     800951 <umain+0x879>
  800927:	48 ba e0 4e 80 00 00 	movabs $0x804ee0,%rdx
  80092e:	00 00 00 
  800931:	be 65 00 00 00       	mov    $0x65,%esi
  800936:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  80093d:	00 00 00 
  800940:	b8 00 00 00 00       	mov    $0x0,%eax
  800945:	48 b9 04 0d 80 00 00 	movabs $0x800d04,%rcx
  80094c:	00 00 00 
  80094f:	ff d1                	callq  *%rcx
  800951:	48 bf 07 4f 80 00 00 	movabs $0x804f07,%rdi
  800958:	00 00 00 
  80095b:	b8 00 00 00 00       	mov    $0x0,%eax
  800960:	48 ba 3e 0f 80 00 00 	movabs $0x800f3e,%rdx
  800967:	00 00 00 
  80096a:	ff d2                	callq  *%rdx
  80096c:	be 01 01 00 00       	mov    $0x101,%esi
  800971:	48 bf 15 4f 80 00 00 	movabs $0x804f15,%rdi
  800978:	00 00 00 
  80097b:	48 b8 2a 34 80 00 00 	movabs $0x80342a,%rax
  800982:	00 00 00 
  800985:	ff d0                	callq  *%rax
  800987:	48 98                	cltq   
  800989:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  80098d:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  800992:	79 32                	jns    8009c6 <umain+0x8ee>
  800994:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800998:	48 89 c1             	mov    %rax,%rcx
  80099b:	48 ba 1a 4f 80 00 00 	movabs $0x804f1a,%rdx
  8009a2:	00 00 00 
  8009a5:	be 6a 00 00 00       	mov    $0x6a,%esi
  8009aa:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  8009b1:	00 00 00 
  8009b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8009b9:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  8009c0:	00 00 00 
  8009c3:	41 ff d0             	callq  *%r8
  8009c6:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  8009cd:	ba 00 02 00 00       	mov    $0x200,%edx
  8009d2:	be 00 00 00 00       	mov    $0x0,%esi
  8009d7:	48 89 c7             	mov    %rax,%rdi
  8009da:	48 b8 68 1d 80 00 00 	movabs $0x801d68,%rax
  8009e1:	00 00 00 
  8009e4:	ff d0                	callq  *%rax
  8009e6:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  8009ed:	00 
  8009ee:	e9 84 00 00 00       	jmpq   800a77 <umain+0x99f>
  8009f3:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  8009fa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009fe:	89 10                	mov    %edx,(%rax)
  800a00:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800a04:	89 c1                	mov    %eax,%ecx
  800a06:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  800a0d:	ba 00 02 00 00       	mov    $0x200,%edx
  800a12:	48 89 c6             	mov    %rax,%rsi
  800a15:	89 cf                	mov    %ecx,%edi
  800a17:	48 b8 9c 30 80 00 00 	movabs $0x80309c,%rax
  800a1e:	00 00 00 
  800a21:	ff d0                	callq  *%rax
  800a23:	48 98                	cltq   
  800a25:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800a29:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800a2e:	79 39                	jns    800a69 <umain+0x991>
  800a30:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800a34:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a38:	49 89 d0             	mov    %rdx,%r8
  800a3b:	48 89 c1             	mov    %rax,%rcx
  800a3e:	48 ba 29 4f 80 00 00 	movabs $0x804f29,%rdx
  800a45:	00 00 00 
  800a48:	be 6f 00 00 00       	mov    $0x6f,%esi
  800a4d:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  800a54:	00 00 00 
  800a57:	b8 00 00 00 00       	mov    $0x0,%eax
  800a5c:	49 b9 04 0d 80 00 00 	movabs $0x800d04,%r9
  800a63:	00 00 00 
  800a66:	41 ff d1             	callq  *%r9
  800a69:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a6d:	48 05 00 02 00 00    	add    $0x200,%rax
  800a73:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a77:	48 81 7d e8 ff df 01 	cmpq   $0x1dfff,-0x18(%rbp)
  800a7e:	00 
  800a7f:	0f 8e 6e ff ff ff    	jle    8009f3 <umain+0x91b>
  800a85:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800a89:	89 c7                	mov    %eax,%edi
  800a8b:	48 b8 2e 2d 80 00 00 	movabs $0x802d2e,%rax
  800a92:	00 00 00 
  800a95:	ff d0                	callq  *%rax
  800a97:	be 00 00 00 00       	mov    $0x0,%esi
  800a9c:	48 bf 15 4f 80 00 00 	movabs $0x804f15,%rdi
  800aa3:	00 00 00 
  800aa6:	48 b8 2a 34 80 00 00 	movabs $0x80342a,%rax
  800aad:	00 00 00 
  800ab0:	ff d0                	callq  *%rax
  800ab2:	48 98                	cltq   
  800ab4:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800ab8:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  800abd:	79 32                	jns    800af1 <umain+0xa19>
  800abf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800ac3:	48 89 c1             	mov    %rax,%rcx
  800ac6:	48 ba 3b 4f 80 00 00 	movabs $0x804f3b,%rdx
  800acd:	00 00 00 
  800ad0:	be 74 00 00 00       	mov    $0x74,%esi
  800ad5:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  800adc:	00 00 00 
  800adf:	b8 00 00 00 00       	mov    $0x0,%eax
  800ae4:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  800aeb:	00 00 00 
  800aee:	41 ff d0             	callq  *%r8
  800af1:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  800af8:	00 
  800af9:	e9 1c 01 00 00       	jmpq   800c1a <umain+0xb42>
  800afe:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  800b05:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b09:	89 10                	mov    %edx,(%rax)
  800b0b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800b0f:	89 c1                	mov    %eax,%ecx
  800b11:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  800b18:	ba 00 02 00 00       	mov    $0x200,%edx
  800b1d:	48 89 c6             	mov    %rax,%rsi
  800b20:	89 cf                	mov    %ecx,%edi
  800b22:	48 b8 26 30 80 00 00 	movabs $0x803026,%rax
  800b29:	00 00 00 
  800b2c:	ff d0                	callq  *%rax
  800b2e:	48 98                	cltq   
  800b30:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800b34:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800b39:	79 39                	jns    800b74 <umain+0xa9c>
  800b3b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800b3f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b43:	49 89 d0             	mov    %rdx,%r8
  800b46:	48 89 c1             	mov    %rax,%rcx
  800b49:	48 ba 49 4f 80 00 00 	movabs $0x804f49,%rdx
  800b50:	00 00 00 
  800b53:	be 78 00 00 00       	mov    $0x78,%esi
  800b58:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  800b5f:	00 00 00 
  800b62:	b8 00 00 00 00       	mov    $0x0,%eax
  800b67:	49 b9 04 0d 80 00 00 	movabs $0x800d04,%r9
  800b6e:	00 00 00 
  800b71:	41 ff d1             	callq  *%r9
  800b74:	48 81 7d e0 00 02 00 	cmpq   $0x200,-0x20(%rbp)
  800b7b:	00 
  800b7c:	74 3f                	je     800bbd <umain+0xae5>
  800b7e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800b82:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b86:	41 b9 00 02 00 00    	mov    $0x200,%r9d
  800b8c:	49 89 d0             	mov    %rdx,%r8
  800b8f:	48 89 c1             	mov    %rax,%rcx
  800b92:	48 ba 60 4f 80 00 00 	movabs $0x804f60,%rdx
  800b99:	00 00 00 
  800b9c:	be 7b 00 00 00       	mov    $0x7b,%esi
  800ba1:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  800ba8:	00 00 00 
  800bab:	b8 00 00 00 00       	mov    $0x0,%eax
  800bb0:	49 ba 04 0d 80 00 00 	movabs $0x800d04,%r10
  800bb7:	00 00 00 
  800bba:	41 ff d2             	callq  *%r10
  800bbd:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  800bc4:	8b 00                	mov    (%rax),%eax
  800bc6:	48 98                	cltq   
  800bc8:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  800bcc:	74 3e                	je     800c0c <umain+0xb34>
  800bce:	48 8d 85 30 fd ff ff 	lea    -0x2d0(%rbp),%rax
  800bd5:	8b 10                	mov    (%rax),%edx
  800bd7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bdb:	41 89 d0             	mov    %edx,%r8d
  800bde:	48 89 c1             	mov    %rax,%rcx
  800be1:	48 ba 90 4f 80 00 00 	movabs $0x804f90,%rdx
  800be8:	00 00 00 
  800beb:	be 7e 00 00 00       	mov    $0x7e,%esi
  800bf0:	48 bf cb 4b 80 00 00 	movabs $0x804bcb,%rdi
  800bf7:	00 00 00 
  800bfa:	b8 00 00 00 00       	mov    $0x0,%eax
  800bff:	49 b9 04 0d 80 00 00 	movabs $0x800d04,%r9
  800c06:	00 00 00 
  800c09:	41 ff d1             	callq  *%r9
  800c0c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c10:	48 05 00 02 00 00    	add    $0x200,%rax
  800c16:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c1a:	48 81 7d e8 ff df 01 	cmpq   $0x1dfff,-0x18(%rbp)
  800c21:	00 
  800c22:	0f 8e d6 fe ff ff    	jle    800afe <umain+0xa26>
  800c28:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800c2c:	89 c7                	mov    %eax,%edi
  800c2e:	48 b8 2e 2d 80 00 00 	movabs $0x802d2e,%rax
  800c35:	00 00 00 
  800c38:	ff d0                	callq  *%rax
  800c3a:	48 bf b7 4f 80 00 00 	movabs $0x804fb7,%rdi
  800c41:	00 00 00 
  800c44:	b8 00 00 00 00       	mov    $0x0,%eax
  800c49:	48 ba 3e 0f 80 00 00 	movabs $0x800f3e,%rdx
  800c50:	00 00 00 
  800c53:	ff d2                	callq  *%rdx
  800c55:	90                   	nop
  800c56:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  800c5a:	c9                   	leaveq 
  800c5b:	c3                   	retq   

0000000000800c5c <libmain>:
  800c5c:	55                   	push   %rbp
  800c5d:	48 89 e5             	mov    %rsp,%rbp
  800c60:	48 83 ec 10          	sub    $0x10,%rsp
  800c64:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800c67:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800c6b:	48 b8 85 23 80 00 00 	movabs $0x802385,%rax
  800c72:	00 00 00 
  800c75:	ff d0                	callq  *%rax
  800c77:	25 ff 03 00 00       	and    $0x3ff,%eax
  800c7c:	48 98                	cltq   
  800c7e:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800c85:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800c8c:	00 00 00 
  800c8f:	48 01 c2             	add    %rax,%rdx
  800c92:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800c99:	00 00 00 
  800c9c:	48 89 10             	mov    %rdx,(%rax)
  800c9f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800ca3:	7e 14                	jle    800cb9 <libmain+0x5d>
  800ca5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ca9:	48 8b 10             	mov    (%rax),%rdx
  800cac:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800cb3:	00 00 00 
  800cb6:	48 89 10             	mov    %rdx,(%rax)
  800cb9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800cbd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800cc0:	48 89 d6             	mov    %rdx,%rsi
  800cc3:	89 c7                	mov    %eax,%edi
  800cc5:	48 b8 d8 00 80 00 00 	movabs $0x8000d8,%rax
  800ccc:	00 00 00 
  800ccf:	ff d0                	callq  *%rax
  800cd1:	48 b8 e0 0c 80 00 00 	movabs $0x800ce0,%rax
  800cd8:	00 00 00 
  800cdb:	ff d0                	callq  *%rax
  800cdd:	90                   	nop
  800cde:	c9                   	leaveq 
  800cdf:	c3                   	retq   

0000000000800ce0 <exit>:
  800ce0:	55                   	push   %rbp
  800ce1:	48 89 e5             	mov    %rsp,%rbp
  800ce4:	48 b8 79 2d 80 00 00 	movabs $0x802d79,%rax
  800ceb:	00 00 00 
  800cee:	ff d0                	callq  *%rax
  800cf0:	bf 00 00 00 00       	mov    $0x0,%edi
  800cf5:	48 b8 3f 23 80 00 00 	movabs $0x80233f,%rax
  800cfc:	00 00 00 
  800cff:	ff d0                	callq  *%rax
  800d01:	90                   	nop
  800d02:	5d                   	pop    %rbp
  800d03:	c3                   	retq   

0000000000800d04 <_panic>:
  800d04:	55                   	push   %rbp
  800d05:	48 89 e5             	mov    %rsp,%rbp
  800d08:	53                   	push   %rbx
  800d09:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800d10:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800d17:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800d1d:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800d24:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800d2b:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800d32:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800d39:	84 c0                	test   %al,%al
  800d3b:	74 23                	je     800d60 <_panic+0x5c>
  800d3d:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800d44:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800d48:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800d4c:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800d50:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800d54:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800d58:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800d5c:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800d60:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800d67:	00 00 00 
  800d6a:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800d71:	00 00 00 
  800d74:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800d78:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800d7f:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800d86:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800d8d:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800d94:	00 00 00 
  800d97:	48 8b 18             	mov    (%rax),%rbx
  800d9a:	48 b8 85 23 80 00 00 	movabs $0x802385,%rax
  800da1:	00 00 00 
  800da4:	ff d0                	callq  *%rax
  800da6:	89 c6                	mov    %eax,%esi
  800da8:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  800dae:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  800db5:	41 89 d0             	mov    %edx,%r8d
  800db8:	48 89 c1             	mov    %rax,%rcx
  800dbb:	48 89 da             	mov    %rbx,%rdx
  800dbe:	48 bf d8 4f 80 00 00 	movabs $0x804fd8,%rdi
  800dc5:	00 00 00 
  800dc8:	b8 00 00 00 00       	mov    $0x0,%eax
  800dcd:	49 b9 3e 0f 80 00 00 	movabs $0x800f3e,%r9
  800dd4:	00 00 00 
  800dd7:	41 ff d1             	callq  *%r9
  800dda:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800de1:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800de8:	48 89 d6             	mov    %rdx,%rsi
  800deb:	48 89 c7             	mov    %rax,%rdi
  800dee:	48 b8 92 0e 80 00 00 	movabs $0x800e92,%rax
  800df5:	00 00 00 
  800df8:	ff d0                	callq  *%rax
  800dfa:	48 bf fb 4f 80 00 00 	movabs $0x804ffb,%rdi
  800e01:	00 00 00 
  800e04:	b8 00 00 00 00       	mov    $0x0,%eax
  800e09:	48 ba 3e 0f 80 00 00 	movabs $0x800f3e,%rdx
  800e10:	00 00 00 
  800e13:	ff d2                	callq  *%rdx
  800e15:	cc                   	int3   
  800e16:	eb fd                	jmp    800e15 <_panic+0x111>

0000000000800e18 <putch>:
  800e18:	55                   	push   %rbp
  800e19:	48 89 e5             	mov    %rsp,%rbp
  800e1c:	48 83 ec 10          	sub    $0x10,%rsp
  800e20:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800e23:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800e27:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e2b:	8b 00                	mov    (%rax),%eax
  800e2d:	8d 48 01             	lea    0x1(%rax),%ecx
  800e30:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800e34:	89 0a                	mov    %ecx,(%rdx)
  800e36:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800e39:	89 d1                	mov    %edx,%ecx
  800e3b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800e3f:	48 98                	cltq   
  800e41:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800e45:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e49:	8b 00                	mov    (%rax),%eax
  800e4b:	3d ff 00 00 00       	cmp    $0xff,%eax
  800e50:	75 2c                	jne    800e7e <putch+0x66>
  800e52:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e56:	8b 00                	mov    (%rax),%eax
  800e58:	48 98                	cltq   
  800e5a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800e5e:	48 83 c2 08          	add    $0x8,%rdx
  800e62:	48 89 c6             	mov    %rax,%rsi
  800e65:	48 89 d7             	mov    %rdx,%rdi
  800e68:	48 b8 b6 22 80 00 00 	movabs $0x8022b6,%rax
  800e6f:	00 00 00 
  800e72:	ff d0                	callq  *%rax
  800e74:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e78:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800e7e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e82:	8b 40 04             	mov    0x4(%rax),%eax
  800e85:	8d 50 01             	lea    0x1(%rax),%edx
  800e88:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e8c:	89 50 04             	mov    %edx,0x4(%rax)
  800e8f:	90                   	nop
  800e90:	c9                   	leaveq 
  800e91:	c3                   	retq   

0000000000800e92 <vcprintf>:
  800e92:	55                   	push   %rbp
  800e93:	48 89 e5             	mov    %rsp,%rbp
  800e96:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800e9d:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800ea4:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800eab:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800eb2:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800eb9:	48 8b 0a             	mov    (%rdx),%rcx
  800ebc:	48 89 08             	mov    %rcx,(%rax)
  800ebf:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ec3:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ec7:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800ecb:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800ecf:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800ed6:	00 00 00 
  800ed9:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800ee0:	00 00 00 
  800ee3:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800eea:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800ef1:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800ef8:	48 89 c6             	mov    %rax,%rsi
  800efb:	48 bf 18 0e 80 00 00 	movabs $0x800e18,%rdi
  800f02:	00 00 00 
  800f05:	48 b8 dc 12 80 00 00 	movabs $0x8012dc,%rax
  800f0c:	00 00 00 
  800f0f:	ff d0                	callq  *%rax
  800f11:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800f17:	48 98                	cltq   
  800f19:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800f20:	48 83 c2 08          	add    $0x8,%rdx
  800f24:	48 89 c6             	mov    %rax,%rsi
  800f27:	48 89 d7             	mov    %rdx,%rdi
  800f2a:	48 b8 b6 22 80 00 00 	movabs $0x8022b6,%rax
  800f31:	00 00 00 
  800f34:	ff d0                	callq  *%rax
  800f36:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800f3c:	c9                   	leaveq 
  800f3d:	c3                   	retq   

0000000000800f3e <cprintf>:
  800f3e:	55                   	push   %rbp
  800f3f:	48 89 e5             	mov    %rsp,%rbp
  800f42:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800f49:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800f50:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800f57:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800f5e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f65:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f6c:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f73:	84 c0                	test   %al,%al
  800f75:	74 20                	je     800f97 <cprintf+0x59>
  800f77:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f7b:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f7f:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f83:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f87:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f8b:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f8f:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f93:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f97:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800f9e:	00 00 00 
  800fa1:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800fa8:	00 00 00 
  800fab:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800faf:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800fb6:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800fbd:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800fc4:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800fcb:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800fd2:	48 8b 0a             	mov    (%rdx),%rcx
  800fd5:	48 89 08             	mov    %rcx,(%rax)
  800fd8:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800fdc:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800fe0:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800fe4:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800fe8:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800fef:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800ff6:	48 89 d6             	mov    %rdx,%rsi
  800ff9:	48 89 c7             	mov    %rax,%rdi
  800ffc:	48 b8 92 0e 80 00 00 	movabs $0x800e92,%rax
  801003:	00 00 00 
  801006:	ff d0                	callq  *%rax
  801008:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80100e:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801014:	c9                   	leaveq 
  801015:	c3                   	retq   

0000000000801016 <printnum>:
  801016:	55                   	push   %rbp
  801017:	48 89 e5             	mov    %rsp,%rbp
  80101a:	48 83 ec 30          	sub    $0x30,%rsp
  80101e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801022:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801026:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80102a:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  80102d:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  801031:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  801035:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801038:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  80103c:	77 54                	ja     801092 <printnum+0x7c>
  80103e:	8b 45 e0             	mov    -0x20(%rbp),%eax
  801041:	8d 78 ff             	lea    -0x1(%rax),%edi
  801044:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  801047:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80104b:	ba 00 00 00 00       	mov    $0x0,%edx
  801050:	48 f7 f6             	div    %rsi
  801053:	49 89 c2             	mov    %rax,%r10
  801056:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  801059:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80105c:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  801060:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801064:	41 89 c9             	mov    %ecx,%r9d
  801067:	41 89 f8             	mov    %edi,%r8d
  80106a:	89 d1                	mov    %edx,%ecx
  80106c:	4c 89 d2             	mov    %r10,%rdx
  80106f:	48 89 c7             	mov    %rax,%rdi
  801072:	48 b8 16 10 80 00 00 	movabs $0x801016,%rax
  801079:	00 00 00 
  80107c:	ff d0                	callq  *%rax
  80107e:	eb 1c                	jmp    80109c <printnum+0x86>
  801080:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801084:	8b 55 dc             	mov    -0x24(%rbp),%edx
  801087:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80108b:	48 89 ce             	mov    %rcx,%rsi
  80108e:	89 d7                	mov    %edx,%edi
  801090:	ff d0                	callq  *%rax
  801092:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  801096:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  80109a:	7f e4                	jg     801080 <printnum+0x6a>
  80109c:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80109f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010a3:	ba 00 00 00 00       	mov    $0x0,%edx
  8010a8:	48 f7 f1             	div    %rcx
  8010ab:	48 b8 f0 51 80 00 00 	movabs $0x8051f0,%rax
  8010b2:	00 00 00 
  8010b5:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  8010b9:	0f be d0             	movsbl %al,%edx
  8010bc:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8010c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010c4:	48 89 ce             	mov    %rcx,%rsi
  8010c7:	89 d7                	mov    %edx,%edi
  8010c9:	ff d0                	callq  *%rax
  8010cb:	90                   	nop
  8010cc:	c9                   	leaveq 
  8010cd:	c3                   	retq   

00000000008010ce <getuint>:
  8010ce:	55                   	push   %rbp
  8010cf:	48 89 e5             	mov    %rsp,%rbp
  8010d2:	48 83 ec 20          	sub    $0x20,%rsp
  8010d6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010da:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8010dd:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8010e1:	7e 4f                	jle    801132 <getuint+0x64>
  8010e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010e7:	8b 00                	mov    (%rax),%eax
  8010e9:	83 f8 30             	cmp    $0x30,%eax
  8010ec:	73 24                	jae    801112 <getuint+0x44>
  8010ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010f2:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8010f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010fa:	8b 00                	mov    (%rax),%eax
  8010fc:	89 c0                	mov    %eax,%eax
  8010fe:	48 01 d0             	add    %rdx,%rax
  801101:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801105:	8b 12                	mov    (%rdx),%edx
  801107:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80110a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80110e:	89 0a                	mov    %ecx,(%rdx)
  801110:	eb 14                	jmp    801126 <getuint+0x58>
  801112:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801116:	48 8b 40 08          	mov    0x8(%rax),%rax
  80111a:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80111e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801122:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801126:	48 8b 00             	mov    (%rax),%rax
  801129:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80112d:	e9 9d 00 00 00       	jmpq   8011cf <getuint+0x101>
  801132:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  801136:	74 4c                	je     801184 <getuint+0xb6>
  801138:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80113c:	8b 00                	mov    (%rax),%eax
  80113e:	83 f8 30             	cmp    $0x30,%eax
  801141:	73 24                	jae    801167 <getuint+0x99>
  801143:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801147:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80114b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80114f:	8b 00                	mov    (%rax),%eax
  801151:	89 c0                	mov    %eax,%eax
  801153:	48 01 d0             	add    %rdx,%rax
  801156:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80115a:	8b 12                	mov    (%rdx),%edx
  80115c:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80115f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801163:	89 0a                	mov    %ecx,(%rdx)
  801165:	eb 14                	jmp    80117b <getuint+0xad>
  801167:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80116b:	48 8b 40 08          	mov    0x8(%rax),%rax
  80116f:	48 8d 48 08          	lea    0x8(%rax),%rcx
  801173:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801177:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80117b:	48 8b 00             	mov    (%rax),%rax
  80117e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801182:	eb 4b                	jmp    8011cf <getuint+0x101>
  801184:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801188:	8b 00                	mov    (%rax),%eax
  80118a:	83 f8 30             	cmp    $0x30,%eax
  80118d:	73 24                	jae    8011b3 <getuint+0xe5>
  80118f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801193:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801197:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80119b:	8b 00                	mov    (%rax),%eax
  80119d:	89 c0                	mov    %eax,%eax
  80119f:	48 01 d0             	add    %rdx,%rax
  8011a2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011a6:	8b 12                	mov    (%rdx),%edx
  8011a8:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8011ab:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011af:	89 0a                	mov    %ecx,(%rdx)
  8011b1:	eb 14                	jmp    8011c7 <getuint+0xf9>
  8011b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011b7:	48 8b 40 08          	mov    0x8(%rax),%rax
  8011bb:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8011bf:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011c3:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8011c7:	8b 00                	mov    (%rax),%eax
  8011c9:	89 c0                	mov    %eax,%eax
  8011cb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011cf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011d3:	c9                   	leaveq 
  8011d4:	c3                   	retq   

00000000008011d5 <getint>:
  8011d5:	55                   	push   %rbp
  8011d6:	48 89 e5             	mov    %rsp,%rbp
  8011d9:	48 83 ec 20          	sub    $0x20,%rsp
  8011dd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011e1:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8011e4:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8011e8:	7e 4f                	jle    801239 <getint+0x64>
  8011ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011ee:	8b 00                	mov    (%rax),%eax
  8011f0:	83 f8 30             	cmp    $0x30,%eax
  8011f3:	73 24                	jae    801219 <getint+0x44>
  8011f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011f9:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8011fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801201:	8b 00                	mov    (%rax),%eax
  801203:	89 c0                	mov    %eax,%eax
  801205:	48 01 d0             	add    %rdx,%rax
  801208:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80120c:	8b 12                	mov    (%rdx),%edx
  80120e:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801211:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801215:	89 0a                	mov    %ecx,(%rdx)
  801217:	eb 14                	jmp    80122d <getint+0x58>
  801219:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80121d:	48 8b 40 08          	mov    0x8(%rax),%rax
  801221:	48 8d 48 08          	lea    0x8(%rax),%rcx
  801225:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801229:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80122d:	48 8b 00             	mov    (%rax),%rax
  801230:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801234:	e9 9d 00 00 00       	jmpq   8012d6 <getint+0x101>
  801239:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80123d:	74 4c                	je     80128b <getint+0xb6>
  80123f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801243:	8b 00                	mov    (%rax),%eax
  801245:	83 f8 30             	cmp    $0x30,%eax
  801248:	73 24                	jae    80126e <getint+0x99>
  80124a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80124e:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801252:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801256:	8b 00                	mov    (%rax),%eax
  801258:	89 c0                	mov    %eax,%eax
  80125a:	48 01 d0             	add    %rdx,%rax
  80125d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801261:	8b 12                	mov    (%rdx),%edx
  801263:	8d 4a 08             	lea    0x8(%rdx),%ecx
  801266:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80126a:	89 0a                	mov    %ecx,(%rdx)
  80126c:	eb 14                	jmp    801282 <getint+0xad>
  80126e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801272:	48 8b 40 08          	mov    0x8(%rax),%rax
  801276:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80127a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80127e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  801282:	48 8b 00             	mov    (%rax),%rax
  801285:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801289:	eb 4b                	jmp    8012d6 <getint+0x101>
  80128b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80128f:	8b 00                	mov    (%rax),%eax
  801291:	83 f8 30             	cmp    $0x30,%eax
  801294:	73 24                	jae    8012ba <getint+0xe5>
  801296:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80129a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80129e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012a2:	8b 00                	mov    (%rax),%eax
  8012a4:	89 c0                	mov    %eax,%eax
  8012a6:	48 01 d0             	add    %rdx,%rax
  8012a9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8012ad:	8b 12                	mov    (%rdx),%edx
  8012af:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8012b2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8012b6:	89 0a                	mov    %ecx,(%rdx)
  8012b8:	eb 14                	jmp    8012ce <getint+0xf9>
  8012ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012be:	48 8b 40 08          	mov    0x8(%rax),%rax
  8012c2:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8012c6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8012ca:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8012ce:	8b 00                	mov    (%rax),%eax
  8012d0:	48 98                	cltq   
  8012d2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8012d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012da:	c9                   	leaveq 
  8012db:	c3                   	retq   

00000000008012dc <vprintfmt>:
  8012dc:	55                   	push   %rbp
  8012dd:	48 89 e5             	mov    %rsp,%rbp
  8012e0:	41 54                	push   %r12
  8012e2:	53                   	push   %rbx
  8012e3:	48 83 ec 60          	sub    $0x60,%rsp
  8012e7:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8012eb:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8012ef:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8012f3:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8012f7:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8012fb:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8012ff:	48 8b 0a             	mov    (%rdx),%rcx
  801302:	48 89 08             	mov    %rcx,(%rax)
  801305:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801309:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80130d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801311:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801315:	eb 17                	jmp    80132e <vprintfmt+0x52>
  801317:	85 db                	test   %ebx,%ebx
  801319:	0f 84 b9 04 00 00    	je     8017d8 <vprintfmt+0x4fc>
  80131f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801323:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801327:	48 89 d6             	mov    %rdx,%rsi
  80132a:	89 df                	mov    %ebx,%edi
  80132c:	ff d0                	callq  *%rax
  80132e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801332:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801336:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80133a:	0f b6 00             	movzbl (%rax),%eax
  80133d:	0f b6 d8             	movzbl %al,%ebx
  801340:	83 fb 25             	cmp    $0x25,%ebx
  801343:	75 d2                	jne    801317 <vprintfmt+0x3b>
  801345:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  801349:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  801350:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  801357:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80135e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  801365:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801369:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80136d:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  801371:	0f b6 00             	movzbl (%rax),%eax
  801374:	0f b6 d8             	movzbl %al,%ebx
  801377:	8d 43 dd             	lea    -0x23(%rbx),%eax
  80137a:	83 f8 55             	cmp    $0x55,%eax
  80137d:	0f 87 22 04 00 00    	ja     8017a5 <vprintfmt+0x4c9>
  801383:	89 c0                	mov    %eax,%eax
  801385:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80138c:	00 
  80138d:	48 b8 18 52 80 00 00 	movabs $0x805218,%rax
  801394:	00 00 00 
  801397:	48 01 d0             	add    %rdx,%rax
  80139a:	48 8b 00             	mov    (%rax),%rax
  80139d:	ff e0                	jmpq   *%rax
  80139f:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8013a3:	eb c0                	jmp    801365 <vprintfmt+0x89>
  8013a5:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8013a9:	eb ba                	jmp    801365 <vprintfmt+0x89>
  8013ab:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8013b2:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8013b5:	89 d0                	mov    %edx,%eax
  8013b7:	c1 e0 02             	shl    $0x2,%eax
  8013ba:	01 d0                	add    %edx,%eax
  8013bc:	01 c0                	add    %eax,%eax
  8013be:	01 d8                	add    %ebx,%eax
  8013c0:	83 e8 30             	sub    $0x30,%eax
  8013c3:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8013c6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8013ca:	0f b6 00             	movzbl (%rax),%eax
  8013cd:	0f be d8             	movsbl %al,%ebx
  8013d0:	83 fb 2f             	cmp    $0x2f,%ebx
  8013d3:	7e 60                	jle    801435 <vprintfmt+0x159>
  8013d5:	83 fb 39             	cmp    $0x39,%ebx
  8013d8:	7f 5b                	jg     801435 <vprintfmt+0x159>
  8013da:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8013df:	eb d1                	jmp    8013b2 <vprintfmt+0xd6>
  8013e1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8013e4:	83 f8 30             	cmp    $0x30,%eax
  8013e7:	73 17                	jae    801400 <vprintfmt+0x124>
  8013e9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8013ed:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8013f0:	89 d2                	mov    %edx,%edx
  8013f2:	48 01 d0             	add    %rdx,%rax
  8013f5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8013f8:	83 c2 08             	add    $0x8,%edx
  8013fb:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8013fe:	eb 0c                	jmp    80140c <vprintfmt+0x130>
  801400:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801404:	48 8d 50 08          	lea    0x8(%rax),%rdx
  801408:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80140c:	8b 00                	mov    (%rax),%eax
  80140e:	89 45 d8             	mov    %eax,-0x28(%rbp)
  801411:	eb 23                	jmp    801436 <vprintfmt+0x15a>
  801413:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801417:	0f 89 48 ff ff ff    	jns    801365 <vprintfmt+0x89>
  80141d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  801424:	e9 3c ff ff ff       	jmpq   801365 <vprintfmt+0x89>
  801429:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  801430:	e9 30 ff ff ff       	jmpq   801365 <vprintfmt+0x89>
  801435:	90                   	nop
  801436:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80143a:	0f 89 25 ff ff ff    	jns    801365 <vprintfmt+0x89>
  801440:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801443:	89 45 dc             	mov    %eax,-0x24(%rbp)
  801446:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80144d:	e9 13 ff ff ff       	jmpq   801365 <vprintfmt+0x89>
  801452:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  801456:	e9 0a ff ff ff       	jmpq   801365 <vprintfmt+0x89>
  80145b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80145e:	83 f8 30             	cmp    $0x30,%eax
  801461:	73 17                	jae    80147a <vprintfmt+0x19e>
  801463:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801467:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80146a:	89 d2                	mov    %edx,%edx
  80146c:	48 01 d0             	add    %rdx,%rax
  80146f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801472:	83 c2 08             	add    $0x8,%edx
  801475:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801478:	eb 0c                	jmp    801486 <vprintfmt+0x1aa>
  80147a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80147e:	48 8d 50 08          	lea    0x8(%rax),%rdx
  801482:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801486:	8b 10                	mov    (%rax),%edx
  801488:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  80148c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801490:	48 89 ce             	mov    %rcx,%rsi
  801493:	89 d7                	mov    %edx,%edi
  801495:	ff d0                	callq  *%rax
  801497:	e9 37 03 00 00       	jmpq   8017d3 <vprintfmt+0x4f7>
  80149c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80149f:	83 f8 30             	cmp    $0x30,%eax
  8014a2:	73 17                	jae    8014bb <vprintfmt+0x1df>
  8014a4:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8014a8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8014ab:	89 d2                	mov    %edx,%edx
  8014ad:	48 01 d0             	add    %rdx,%rax
  8014b0:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8014b3:	83 c2 08             	add    $0x8,%edx
  8014b6:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8014b9:	eb 0c                	jmp    8014c7 <vprintfmt+0x1eb>
  8014bb:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8014bf:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8014c3:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8014c7:	8b 18                	mov    (%rax),%ebx
  8014c9:	85 db                	test   %ebx,%ebx
  8014cb:	79 02                	jns    8014cf <vprintfmt+0x1f3>
  8014cd:	f7 db                	neg    %ebx
  8014cf:	83 fb 15             	cmp    $0x15,%ebx
  8014d2:	7f 16                	jg     8014ea <vprintfmt+0x20e>
  8014d4:	48 b8 40 51 80 00 00 	movabs $0x805140,%rax
  8014db:	00 00 00 
  8014de:	48 63 d3             	movslq %ebx,%rdx
  8014e1:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  8014e5:	4d 85 e4             	test   %r12,%r12
  8014e8:	75 2e                	jne    801518 <vprintfmt+0x23c>
  8014ea:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8014ee:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8014f2:	89 d9                	mov    %ebx,%ecx
  8014f4:	48 ba 01 52 80 00 00 	movabs $0x805201,%rdx
  8014fb:	00 00 00 
  8014fe:	48 89 c7             	mov    %rax,%rdi
  801501:	b8 00 00 00 00       	mov    $0x0,%eax
  801506:	49 b8 e2 17 80 00 00 	movabs $0x8017e2,%r8
  80150d:	00 00 00 
  801510:	41 ff d0             	callq  *%r8
  801513:	e9 bb 02 00 00       	jmpq   8017d3 <vprintfmt+0x4f7>
  801518:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80151c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801520:	4c 89 e1             	mov    %r12,%rcx
  801523:	48 ba 0a 52 80 00 00 	movabs $0x80520a,%rdx
  80152a:	00 00 00 
  80152d:	48 89 c7             	mov    %rax,%rdi
  801530:	b8 00 00 00 00       	mov    $0x0,%eax
  801535:	49 b8 e2 17 80 00 00 	movabs $0x8017e2,%r8
  80153c:	00 00 00 
  80153f:	41 ff d0             	callq  *%r8
  801542:	e9 8c 02 00 00       	jmpq   8017d3 <vprintfmt+0x4f7>
  801547:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80154a:	83 f8 30             	cmp    $0x30,%eax
  80154d:	73 17                	jae    801566 <vprintfmt+0x28a>
  80154f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801553:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801556:	89 d2                	mov    %edx,%edx
  801558:	48 01 d0             	add    %rdx,%rax
  80155b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80155e:	83 c2 08             	add    $0x8,%edx
  801561:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801564:	eb 0c                	jmp    801572 <vprintfmt+0x296>
  801566:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80156a:	48 8d 50 08          	lea    0x8(%rax),%rdx
  80156e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801572:	4c 8b 20             	mov    (%rax),%r12
  801575:	4d 85 e4             	test   %r12,%r12
  801578:	75 0a                	jne    801584 <vprintfmt+0x2a8>
  80157a:	49 bc 0d 52 80 00 00 	movabs $0x80520d,%r12
  801581:	00 00 00 
  801584:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801588:	7e 78                	jle    801602 <vprintfmt+0x326>
  80158a:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  80158e:	74 72                	je     801602 <vprintfmt+0x326>
  801590:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801593:	48 98                	cltq   
  801595:	48 89 c6             	mov    %rax,%rsi
  801598:	4c 89 e7             	mov    %r12,%rdi
  80159b:	48 b8 90 1a 80 00 00 	movabs $0x801a90,%rax
  8015a2:	00 00 00 
  8015a5:	ff d0                	callq  *%rax
  8015a7:	29 45 dc             	sub    %eax,-0x24(%rbp)
  8015aa:	eb 17                	jmp    8015c3 <vprintfmt+0x2e7>
  8015ac:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  8015b0:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8015b4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8015b8:	48 89 ce             	mov    %rcx,%rsi
  8015bb:	89 d7                	mov    %edx,%edi
  8015bd:	ff d0                	callq  *%rax
  8015bf:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8015c3:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8015c7:	7f e3                	jg     8015ac <vprintfmt+0x2d0>
  8015c9:	eb 37                	jmp    801602 <vprintfmt+0x326>
  8015cb:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  8015cf:	74 1e                	je     8015ef <vprintfmt+0x313>
  8015d1:	83 fb 1f             	cmp    $0x1f,%ebx
  8015d4:	7e 05                	jle    8015db <vprintfmt+0x2ff>
  8015d6:	83 fb 7e             	cmp    $0x7e,%ebx
  8015d9:	7e 14                	jle    8015ef <vprintfmt+0x313>
  8015db:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8015df:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8015e3:	48 89 d6             	mov    %rdx,%rsi
  8015e6:	bf 3f 00 00 00       	mov    $0x3f,%edi
  8015eb:	ff d0                	callq  *%rax
  8015ed:	eb 0f                	jmp    8015fe <vprintfmt+0x322>
  8015ef:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8015f3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8015f7:	48 89 d6             	mov    %rdx,%rsi
  8015fa:	89 df                	mov    %ebx,%edi
  8015fc:	ff d0                	callq  *%rax
  8015fe:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801602:	4c 89 e0             	mov    %r12,%rax
  801605:	4c 8d 60 01          	lea    0x1(%rax),%r12
  801609:	0f b6 00             	movzbl (%rax),%eax
  80160c:	0f be d8             	movsbl %al,%ebx
  80160f:	85 db                	test   %ebx,%ebx
  801611:	74 28                	je     80163b <vprintfmt+0x35f>
  801613:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801617:	78 b2                	js     8015cb <vprintfmt+0x2ef>
  801619:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  80161d:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801621:	79 a8                	jns    8015cb <vprintfmt+0x2ef>
  801623:	eb 16                	jmp    80163b <vprintfmt+0x35f>
  801625:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801629:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80162d:	48 89 d6             	mov    %rdx,%rsi
  801630:	bf 20 00 00 00       	mov    $0x20,%edi
  801635:	ff d0                	callq  *%rax
  801637:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  80163b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80163f:	7f e4                	jg     801625 <vprintfmt+0x349>
  801641:	e9 8d 01 00 00       	jmpq   8017d3 <vprintfmt+0x4f7>
  801646:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80164a:	be 03 00 00 00       	mov    $0x3,%esi
  80164f:	48 89 c7             	mov    %rax,%rdi
  801652:	48 b8 d5 11 80 00 00 	movabs $0x8011d5,%rax
  801659:	00 00 00 
  80165c:	ff d0                	callq  *%rax
  80165e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801662:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801666:	48 85 c0             	test   %rax,%rax
  801669:	79 1d                	jns    801688 <vprintfmt+0x3ac>
  80166b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80166f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801673:	48 89 d6             	mov    %rdx,%rsi
  801676:	bf 2d 00 00 00       	mov    $0x2d,%edi
  80167b:	ff d0                	callq  *%rax
  80167d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801681:	48 f7 d8             	neg    %rax
  801684:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801688:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  80168f:	e9 d2 00 00 00       	jmpq   801766 <vprintfmt+0x48a>
  801694:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801698:	be 03 00 00 00       	mov    $0x3,%esi
  80169d:	48 89 c7             	mov    %rax,%rdi
  8016a0:	48 b8 ce 10 80 00 00 	movabs $0x8010ce,%rax
  8016a7:	00 00 00 
  8016aa:	ff d0                	callq  *%rax
  8016ac:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8016b0:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8016b7:	e9 aa 00 00 00       	jmpq   801766 <vprintfmt+0x48a>
  8016bc:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8016c0:	be 03 00 00 00       	mov    $0x3,%esi
  8016c5:	48 89 c7             	mov    %rax,%rdi
  8016c8:	48 b8 ce 10 80 00 00 	movabs $0x8010ce,%rax
  8016cf:	00 00 00 
  8016d2:	ff d0                	callq  *%rax
  8016d4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8016d8:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  8016df:	e9 82 00 00 00       	jmpq   801766 <vprintfmt+0x48a>
  8016e4:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8016e8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8016ec:	48 89 d6             	mov    %rdx,%rsi
  8016ef:	bf 30 00 00 00       	mov    $0x30,%edi
  8016f4:	ff d0                	callq  *%rax
  8016f6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8016fa:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8016fe:	48 89 d6             	mov    %rdx,%rsi
  801701:	bf 78 00 00 00       	mov    $0x78,%edi
  801706:	ff d0                	callq  *%rax
  801708:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80170b:	83 f8 30             	cmp    $0x30,%eax
  80170e:	73 17                	jae    801727 <vprintfmt+0x44b>
  801710:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801714:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801717:	89 d2                	mov    %edx,%edx
  801719:	48 01 d0             	add    %rdx,%rax
  80171c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80171f:	83 c2 08             	add    $0x8,%edx
  801722:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801725:	eb 0c                	jmp    801733 <vprintfmt+0x457>
  801727:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80172b:	48 8d 50 08          	lea    0x8(%rax),%rdx
  80172f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801733:	48 8b 00             	mov    (%rax),%rax
  801736:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80173a:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801741:	eb 23                	jmp    801766 <vprintfmt+0x48a>
  801743:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801747:	be 03 00 00 00       	mov    $0x3,%esi
  80174c:	48 89 c7             	mov    %rax,%rdi
  80174f:	48 b8 ce 10 80 00 00 	movabs $0x8010ce,%rax
  801756:	00 00 00 
  801759:	ff d0                	callq  *%rax
  80175b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80175f:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801766:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  80176b:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80176e:	8b 7d dc             	mov    -0x24(%rbp),%edi
  801771:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801775:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801779:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80177d:	45 89 c1             	mov    %r8d,%r9d
  801780:	41 89 f8             	mov    %edi,%r8d
  801783:	48 89 c7             	mov    %rax,%rdi
  801786:	48 b8 16 10 80 00 00 	movabs $0x801016,%rax
  80178d:	00 00 00 
  801790:	ff d0                	callq  *%rax
  801792:	eb 3f                	jmp    8017d3 <vprintfmt+0x4f7>
  801794:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801798:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80179c:	48 89 d6             	mov    %rdx,%rsi
  80179f:	89 df                	mov    %ebx,%edi
  8017a1:	ff d0                	callq  *%rax
  8017a3:	eb 2e                	jmp    8017d3 <vprintfmt+0x4f7>
  8017a5:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8017a9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8017ad:	48 89 d6             	mov    %rdx,%rsi
  8017b0:	bf 25 00 00 00       	mov    $0x25,%edi
  8017b5:	ff d0                	callq  *%rax
  8017b7:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8017bc:	eb 05                	jmp    8017c3 <vprintfmt+0x4e7>
  8017be:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  8017c3:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8017c7:	48 83 e8 01          	sub    $0x1,%rax
  8017cb:	0f b6 00             	movzbl (%rax),%eax
  8017ce:	3c 25                	cmp    $0x25,%al
  8017d0:	75 ec                	jne    8017be <vprintfmt+0x4e2>
  8017d2:	90                   	nop
  8017d3:	e9 3d fb ff ff       	jmpq   801315 <vprintfmt+0x39>
  8017d8:	90                   	nop
  8017d9:	48 83 c4 60          	add    $0x60,%rsp
  8017dd:	5b                   	pop    %rbx
  8017de:	41 5c                	pop    %r12
  8017e0:	5d                   	pop    %rbp
  8017e1:	c3                   	retq   

00000000008017e2 <printfmt>:
  8017e2:	55                   	push   %rbp
  8017e3:	48 89 e5             	mov    %rsp,%rbp
  8017e6:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  8017ed:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  8017f4:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  8017fb:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  801802:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801809:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801810:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801817:	84 c0                	test   %al,%al
  801819:	74 20                	je     80183b <printfmt+0x59>
  80181b:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80181f:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801823:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801827:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80182b:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80182f:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801833:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801837:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80183b:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801842:	00 00 00 
  801845:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  80184c:	00 00 00 
  80184f:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801853:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80185a:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801861:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  801868:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  80186f:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  801876:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  80187d:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  801884:	48 89 c7             	mov    %rax,%rdi
  801887:	48 b8 dc 12 80 00 00 	movabs $0x8012dc,%rax
  80188e:	00 00 00 
  801891:	ff d0                	callq  *%rax
  801893:	90                   	nop
  801894:	c9                   	leaveq 
  801895:	c3                   	retq   

0000000000801896 <sprintputch>:
  801896:	55                   	push   %rbp
  801897:	48 89 e5             	mov    %rsp,%rbp
  80189a:	48 83 ec 10          	sub    $0x10,%rsp
  80189e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018a1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018a9:	8b 40 10             	mov    0x10(%rax),%eax
  8018ac:	8d 50 01             	lea    0x1(%rax),%edx
  8018af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018b3:	89 50 10             	mov    %edx,0x10(%rax)
  8018b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018ba:	48 8b 10             	mov    (%rax),%rdx
  8018bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018c1:	48 8b 40 08          	mov    0x8(%rax),%rax
  8018c5:	48 39 c2             	cmp    %rax,%rdx
  8018c8:	73 17                	jae    8018e1 <sprintputch+0x4b>
  8018ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018ce:	48 8b 00             	mov    (%rax),%rax
  8018d1:	48 8d 48 01          	lea    0x1(%rax),%rcx
  8018d5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018d9:	48 89 0a             	mov    %rcx,(%rdx)
  8018dc:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8018df:	88 10                	mov    %dl,(%rax)
  8018e1:	90                   	nop
  8018e2:	c9                   	leaveq 
  8018e3:	c3                   	retq   

00000000008018e4 <vsnprintf>:
  8018e4:	55                   	push   %rbp
  8018e5:	48 89 e5             	mov    %rsp,%rbp
  8018e8:	48 83 ec 50          	sub    $0x50,%rsp
  8018ec:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8018f0:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  8018f3:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  8018f7:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  8018fb:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8018ff:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801903:	48 8b 0a             	mov    (%rdx),%rcx
  801906:	48 89 08             	mov    %rcx,(%rax)
  801909:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80190d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801911:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801915:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801919:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80191d:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801921:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801924:	48 98                	cltq   
  801926:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80192a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80192e:	48 01 d0             	add    %rdx,%rax
  801931:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801935:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80193c:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  801941:	74 06                	je     801949 <vsnprintf+0x65>
  801943:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801947:	7f 07                	jg     801950 <vsnprintf+0x6c>
  801949:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80194e:	eb 2f                	jmp    80197f <vsnprintf+0x9b>
  801950:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801954:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801958:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80195c:	48 89 c6             	mov    %rax,%rsi
  80195f:	48 bf 96 18 80 00 00 	movabs $0x801896,%rdi
  801966:	00 00 00 
  801969:	48 b8 dc 12 80 00 00 	movabs $0x8012dc,%rax
  801970:	00 00 00 
  801973:	ff d0                	callq  *%rax
  801975:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801979:	c6 00 00             	movb   $0x0,(%rax)
  80197c:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80197f:	c9                   	leaveq 
  801980:	c3                   	retq   

0000000000801981 <snprintf>:
  801981:	55                   	push   %rbp
  801982:	48 89 e5             	mov    %rsp,%rbp
  801985:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  80198c:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  801993:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801999:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  8019a0:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8019a7:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8019ae:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8019b5:	84 c0                	test   %al,%al
  8019b7:	74 20                	je     8019d9 <snprintf+0x58>
  8019b9:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8019bd:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8019c1:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8019c5:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8019c9:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8019cd:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8019d1:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8019d5:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8019d9:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8019e0:	00 00 00 
  8019e3:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8019ea:	00 00 00 
  8019ed:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8019f1:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8019f8:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8019ff:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801a06:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  801a0d:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801a14:	48 8b 0a             	mov    (%rdx),%rcx
  801a17:	48 89 08             	mov    %rcx,(%rax)
  801a1a:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801a1e:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801a22:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801a26:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801a2a:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  801a31:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801a38:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  801a3e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801a45:	48 89 c7             	mov    %rax,%rdi
  801a48:	48 b8 e4 18 80 00 00 	movabs $0x8018e4,%rax
  801a4f:	00 00 00 
  801a52:	ff d0                	callq  *%rax
  801a54:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801a5a:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801a60:	c9                   	leaveq 
  801a61:	c3                   	retq   

0000000000801a62 <strlen>:
  801a62:	55                   	push   %rbp
  801a63:	48 89 e5             	mov    %rsp,%rbp
  801a66:	48 83 ec 18          	sub    $0x18,%rsp
  801a6a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801a6e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801a75:	eb 09                	jmp    801a80 <strlen+0x1e>
  801a77:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801a7b:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801a80:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a84:	0f b6 00             	movzbl (%rax),%eax
  801a87:	84 c0                	test   %al,%al
  801a89:	75 ec                	jne    801a77 <strlen+0x15>
  801a8b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a8e:	c9                   	leaveq 
  801a8f:	c3                   	retq   

0000000000801a90 <strnlen>:
  801a90:	55                   	push   %rbp
  801a91:	48 89 e5             	mov    %rsp,%rbp
  801a94:	48 83 ec 20          	sub    $0x20,%rsp
  801a98:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801a9c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801aa0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801aa7:	eb 0e                	jmp    801ab7 <strnlen+0x27>
  801aa9:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801aad:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801ab2:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801ab7:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801abc:	74 0b                	je     801ac9 <strnlen+0x39>
  801abe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ac2:	0f b6 00             	movzbl (%rax),%eax
  801ac5:	84 c0                	test   %al,%al
  801ac7:	75 e0                	jne    801aa9 <strnlen+0x19>
  801ac9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801acc:	c9                   	leaveq 
  801acd:	c3                   	retq   

0000000000801ace <strcpy>:
  801ace:	55                   	push   %rbp
  801acf:	48 89 e5             	mov    %rsp,%rbp
  801ad2:	48 83 ec 20          	sub    $0x20,%rsp
  801ad6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801ada:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801ade:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ae2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801ae6:	90                   	nop
  801ae7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801aeb:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801aef:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801af3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801af7:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801afb:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801aff:	0f b6 12             	movzbl (%rdx),%edx
  801b02:	88 10                	mov    %dl,(%rax)
  801b04:	0f b6 00             	movzbl (%rax),%eax
  801b07:	84 c0                	test   %al,%al
  801b09:	75 dc                	jne    801ae7 <strcpy+0x19>
  801b0b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b0f:	c9                   	leaveq 
  801b10:	c3                   	retq   

0000000000801b11 <strcat>:
  801b11:	55                   	push   %rbp
  801b12:	48 89 e5             	mov    %rsp,%rbp
  801b15:	48 83 ec 20          	sub    $0x20,%rsp
  801b19:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801b1d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801b21:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b25:	48 89 c7             	mov    %rax,%rdi
  801b28:	48 b8 62 1a 80 00 00 	movabs $0x801a62,%rax
  801b2f:	00 00 00 
  801b32:	ff d0                	callq  *%rax
  801b34:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801b37:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b3a:	48 63 d0             	movslq %eax,%rdx
  801b3d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b41:	48 01 c2             	add    %rax,%rdx
  801b44:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801b48:	48 89 c6             	mov    %rax,%rsi
  801b4b:	48 89 d7             	mov    %rdx,%rdi
  801b4e:	48 b8 ce 1a 80 00 00 	movabs $0x801ace,%rax
  801b55:	00 00 00 
  801b58:	ff d0                	callq  *%rax
  801b5a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b5e:	c9                   	leaveq 
  801b5f:	c3                   	retq   

0000000000801b60 <strncpy>:
  801b60:	55                   	push   %rbp
  801b61:	48 89 e5             	mov    %rsp,%rbp
  801b64:	48 83 ec 28          	sub    $0x28,%rsp
  801b68:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801b6c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801b70:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801b74:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b78:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801b7c:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801b83:	00 
  801b84:	eb 2a                	jmp    801bb0 <strncpy+0x50>
  801b86:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b8a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801b8e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b92:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801b96:	0f b6 12             	movzbl (%rdx),%edx
  801b99:	88 10                	mov    %dl,(%rax)
  801b9b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801b9f:	0f b6 00             	movzbl (%rax),%eax
  801ba2:	84 c0                	test   %al,%al
  801ba4:	74 05                	je     801bab <strncpy+0x4b>
  801ba6:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801bab:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801bb0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bb4:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801bb8:	72 cc                	jb     801b86 <strncpy+0x26>
  801bba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801bbe:	c9                   	leaveq 
  801bbf:	c3                   	retq   

0000000000801bc0 <strlcpy>:
  801bc0:	55                   	push   %rbp
  801bc1:	48 89 e5             	mov    %rsp,%rbp
  801bc4:	48 83 ec 28          	sub    $0x28,%rsp
  801bc8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801bcc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801bd0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801bd4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bd8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801bdc:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801be1:	74 3d                	je     801c20 <strlcpy+0x60>
  801be3:	eb 1d                	jmp    801c02 <strlcpy+0x42>
  801be5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801be9:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801bed:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801bf1:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801bf5:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801bf9:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801bfd:	0f b6 12             	movzbl (%rdx),%edx
  801c00:	88 10                	mov    %dl,(%rax)
  801c02:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801c07:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801c0c:	74 0b                	je     801c19 <strlcpy+0x59>
  801c0e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801c12:	0f b6 00             	movzbl (%rax),%eax
  801c15:	84 c0                	test   %al,%al
  801c17:	75 cc                	jne    801be5 <strlcpy+0x25>
  801c19:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c1d:	c6 00 00             	movb   $0x0,(%rax)
  801c20:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801c24:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c28:	48 29 c2             	sub    %rax,%rdx
  801c2b:	48 89 d0             	mov    %rdx,%rax
  801c2e:	c9                   	leaveq 
  801c2f:	c3                   	retq   

0000000000801c30 <strcmp>:
  801c30:	55                   	push   %rbp
  801c31:	48 89 e5             	mov    %rsp,%rbp
  801c34:	48 83 ec 10          	sub    $0x10,%rsp
  801c38:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c3c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c40:	eb 0a                	jmp    801c4c <strcmp+0x1c>
  801c42:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801c47:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801c4c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c50:	0f b6 00             	movzbl (%rax),%eax
  801c53:	84 c0                	test   %al,%al
  801c55:	74 12                	je     801c69 <strcmp+0x39>
  801c57:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c5b:	0f b6 10             	movzbl (%rax),%edx
  801c5e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801c62:	0f b6 00             	movzbl (%rax),%eax
  801c65:	38 c2                	cmp    %al,%dl
  801c67:	74 d9                	je     801c42 <strcmp+0x12>
  801c69:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c6d:	0f b6 00             	movzbl (%rax),%eax
  801c70:	0f b6 d0             	movzbl %al,%edx
  801c73:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801c77:	0f b6 00             	movzbl (%rax),%eax
  801c7a:	0f b6 c0             	movzbl %al,%eax
  801c7d:	29 c2                	sub    %eax,%edx
  801c7f:	89 d0                	mov    %edx,%eax
  801c81:	c9                   	leaveq 
  801c82:	c3                   	retq   

0000000000801c83 <strncmp>:
  801c83:	55                   	push   %rbp
  801c84:	48 89 e5             	mov    %rsp,%rbp
  801c87:	48 83 ec 18          	sub    $0x18,%rsp
  801c8b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c8f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c93:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801c97:	eb 0f                	jmp    801ca8 <strncmp+0x25>
  801c99:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801c9e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801ca3:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801ca8:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801cad:	74 1d                	je     801ccc <strncmp+0x49>
  801caf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cb3:	0f b6 00             	movzbl (%rax),%eax
  801cb6:	84 c0                	test   %al,%al
  801cb8:	74 12                	je     801ccc <strncmp+0x49>
  801cba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cbe:	0f b6 10             	movzbl (%rax),%edx
  801cc1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801cc5:	0f b6 00             	movzbl (%rax),%eax
  801cc8:	38 c2                	cmp    %al,%dl
  801cca:	74 cd                	je     801c99 <strncmp+0x16>
  801ccc:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801cd1:	75 07                	jne    801cda <strncmp+0x57>
  801cd3:	b8 00 00 00 00       	mov    $0x0,%eax
  801cd8:	eb 18                	jmp    801cf2 <strncmp+0x6f>
  801cda:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cde:	0f b6 00             	movzbl (%rax),%eax
  801ce1:	0f b6 d0             	movzbl %al,%edx
  801ce4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ce8:	0f b6 00             	movzbl (%rax),%eax
  801ceb:	0f b6 c0             	movzbl %al,%eax
  801cee:	29 c2                	sub    %eax,%edx
  801cf0:	89 d0                	mov    %edx,%eax
  801cf2:	c9                   	leaveq 
  801cf3:	c3                   	retq   

0000000000801cf4 <strchr>:
  801cf4:	55                   	push   %rbp
  801cf5:	48 89 e5             	mov    %rsp,%rbp
  801cf8:	48 83 ec 10          	sub    $0x10,%rsp
  801cfc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d00:	89 f0                	mov    %esi,%eax
  801d02:	88 45 f4             	mov    %al,-0xc(%rbp)
  801d05:	eb 17                	jmp    801d1e <strchr+0x2a>
  801d07:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d0b:	0f b6 00             	movzbl (%rax),%eax
  801d0e:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801d11:	75 06                	jne    801d19 <strchr+0x25>
  801d13:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d17:	eb 15                	jmp    801d2e <strchr+0x3a>
  801d19:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801d1e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d22:	0f b6 00             	movzbl (%rax),%eax
  801d25:	84 c0                	test   %al,%al
  801d27:	75 de                	jne    801d07 <strchr+0x13>
  801d29:	b8 00 00 00 00       	mov    $0x0,%eax
  801d2e:	c9                   	leaveq 
  801d2f:	c3                   	retq   

0000000000801d30 <strfind>:
  801d30:	55                   	push   %rbp
  801d31:	48 89 e5             	mov    %rsp,%rbp
  801d34:	48 83 ec 10          	sub    $0x10,%rsp
  801d38:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d3c:	89 f0                	mov    %esi,%eax
  801d3e:	88 45 f4             	mov    %al,-0xc(%rbp)
  801d41:	eb 11                	jmp    801d54 <strfind+0x24>
  801d43:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d47:	0f b6 00             	movzbl (%rax),%eax
  801d4a:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801d4d:	74 12                	je     801d61 <strfind+0x31>
  801d4f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801d54:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d58:	0f b6 00             	movzbl (%rax),%eax
  801d5b:	84 c0                	test   %al,%al
  801d5d:	75 e4                	jne    801d43 <strfind+0x13>
  801d5f:	eb 01                	jmp    801d62 <strfind+0x32>
  801d61:	90                   	nop
  801d62:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d66:	c9                   	leaveq 
  801d67:	c3                   	retq   

0000000000801d68 <memset>:
  801d68:	55                   	push   %rbp
  801d69:	48 89 e5             	mov    %rsp,%rbp
  801d6c:	48 83 ec 18          	sub    $0x18,%rsp
  801d70:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d74:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801d77:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801d7b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801d80:	75 06                	jne    801d88 <memset+0x20>
  801d82:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d86:	eb 69                	jmp    801df1 <memset+0x89>
  801d88:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d8c:	83 e0 03             	and    $0x3,%eax
  801d8f:	48 85 c0             	test   %rax,%rax
  801d92:	75 48                	jne    801ddc <memset+0x74>
  801d94:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d98:	83 e0 03             	and    $0x3,%eax
  801d9b:	48 85 c0             	test   %rax,%rax
  801d9e:	75 3c                	jne    801ddc <memset+0x74>
  801da0:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801da7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801daa:	c1 e0 18             	shl    $0x18,%eax
  801dad:	89 c2                	mov    %eax,%edx
  801daf:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801db2:	c1 e0 10             	shl    $0x10,%eax
  801db5:	09 c2                	or     %eax,%edx
  801db7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801dba:	c1 e0 08             	shl    $0x8,%eax
  801dbd:	09 d0                	or     %edx,%eax
  801dbf:	09 45 f4             	or     %eax,-0xc(%rbp)
  801dc2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801dc6:	48 c1 e8 02          	shr    $0x2,%rax
  801dca:	48 89 c1             	mov    %rax,%rcx
  801dcd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801dd1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801dd4:	48 89 d7             	mov    %rdx,%rdi
  801dd7:	fc                   	cld    
  801dd8:	f3 ab                	rep stos %eax,%es:(%rdi)
  801dda:	eb 11                	jmp    801ded <memset+0x85>
  801ddc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801de0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801de3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801de7:	48 89 d7             	mov    %rdx,%rdi
  801dea:	fc                   	cld    
  801deb:	f3 aa                	rep stos %al,%es:(%rdi)
  801ded:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801df1:	c9                   	leaveq 
  801df2:	c3                   	retq   

0000000000801df3 <memmove>:
  801df3:	55                   	push   %rbp
  801df4:	48 89 e5             	mov    %rsp,%rbp
  801df7:	48 83 ec 28          	sub    $0x28,%rsp
  801dfb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801dff:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801e03:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801e07:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801e0b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801e0f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e13:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801e17:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e1b:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801e1f:	0f 83 88 00 00 00    	jae    801ead <memmove+0xba>
  801e25:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801e29:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e2d:	48 01 d0             	add    %rdx,%rax
  801e30:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801e34:	76 77                	jbe    801ead <memmove+0xba>
  801e36:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e3a:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801e3e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e42:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801e46:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e4a:	83 e0 03             	and    $0x3,%eax
  801e4d:	48 85 c0             	test   %rax,%rax
  801e50:	75 3b                	jne    801e8d <memmove+0x9a>
  801e52:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e56:	83 e0 03             	and    $0x3,%eax
  801e59:	48 85 c0             	test   %rax,%rax
  801e5c:	75 2f                	jne    801e8d <memmove+0x9a>
  801e5e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e62:	83 e0 03             	and    $0x3,%eax
  801e65:	48 85 c0             	test   %rax,%rax
  801e68:	75 23                	jne    801e8d <memmove+0x9a>
  801e6a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e6e:	48 83 e8 04          	sub    $0x4,%rax
  801e72:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801e76:	48 83 ea 04          	sub    $0x4,%rdx
  801e7a:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801e7e:	48 c1 e9 02          	shr    $0x2,%rcx
  801e82:	48 89 c7             	mov    %rax,%rdi
  801e85:	48 89 d6             	mov    %rdx,%rsi
  801e88:	fd                   	std    
  801e89:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801e8b:	eb 1d                	jmp    801eaa <memmove+0xb7>
  801e8d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e91:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801e95:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e99:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801e9d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ea1:	48 89 d7             	mov    %rdx,%rdi
  801ea4:	48 89 c1             	mov    %rax,%rcx
  801ea7:	fd                   	std    
  801ea8:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801eaa:	fc                   	cld    
  801eab:	eb 57                	jmp    801f04 <memmove+0x111>
  801ead:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801eb1:	83 e0 03             	and    $0x3,%eax
  801eb4:	48 85 c0             	test   %rax,%rax
  801eb7:	75 36                	jne    801eef <memmove+0xfc>
  801eb9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ebd:	83 e0 03             	and    $0x3,%eax
  801ec0:	48 85 c0             	test   %rax,%rax
  801ec3:	75 2a                	jne    801eef <memmove+0xfc>
  801ec5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ec9:	83 e0 03             	and    $0x3,%eax
  801ecc:	48 85 c0             	test   %rax,%rax
  801ecf:	75 1e                	jne    801eef <memmove+0xfc>
  801ed1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ed5:	48 c1 e8 02          	shr    $0x2,%rax
  801ed9:	48 89 c1             	mov    %rax,%rcx
  801edc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ee0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801ee4:	48 89 c7             	mov    %rax,%rdi
  801ee7:	48 89 d6             	mov    %rdx,%rsi
  801eea:	fc                   	cld    
  801eeb:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801eed:	eb 15                	jmp    801f04 <memmove+0x111>
  801eef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ef3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801ef7:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801efb:	48 89 c7             	mov    %rax,%rdi
  801efe:	48 89 d6             	mov    %rdx,%rsi
  801f01:	fc                   	cld    
  801f02:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801f04:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f08:	c9                   	leaveq 
  801f09:	c3                   	retq   

0000000000801f0a <memcpy>:
  801f0a:	55                   	push   %rbp
  801f0b:	48 89 e5             	mov    %rsp,%rbp
  801f0e:	48 83 ec 18          	sub    $0x18,%rsp
  801f12:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f16:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f1a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801f1e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801f22:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801f26:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f2a:	48 89 ce             	mov    %rcx,%rsi
  801f2d:	48 89 c7             	mov    %rax,%rdi
  801f30:	48 b8 f3 1d 80 00 00 	movabs $0x801df3,%rax
  801f37:	00 00 00 
  801f3a:	ff d0                	callq  *%rax
  801f3c:	c9                   	leaveq 
  801f3d:	c3                   	retq   

0000000000801f3e <memcmp>:
  801f3e:	55                   	push   %rbp
  801f3f:	48 89 e5             	mov    %rsp,%rbp
  801f42:	48 83 ec 28          	sub    $0x28,%rsp
  801f46:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801f4a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801f4e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801f52:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f56:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801f5a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f5e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801f62:	eb 36                	jmp    801f9a <memcmp+0x5c>
  801f64:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f68:	0f b6 10             	movzbl (%rax),%edx
  801f6b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f6f:	0f b6 00             	movzbl (%rax),%eax
  801f72:	38 c2                	cmp    %al,%dl
  801f74:	74 1a                	je     801f90 <memcmp+0x52>
  801f76:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f7a:	0f b6 00             	movzbl (%rax),%eax
  801f7d:	0f b6 d0             	movzbl %al,%edx
  801f80:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f84:	0f b6 00             	movzbl (%rax),%eax
  801f87:	0f b6 c0             	movzbl %al,%eax
  801f8a:	29 c2                	sub    %eax,%edx
  801f8c:	89 d0                	mov    %edx,%eax
  801f8e:	eb 20                	jmp    801fb0 <memcmp+0x72>
  801f90:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801f95:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801f9a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f9e:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801fa2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801fa6:	48 85 c0             	test   %rax,%rax
  801fa9:	75 b9                	jne    801f64 <memcmp+0x26>
  801fab:	b8 00 00 00 00       	mov    $0x0,%eax
  801fb0:	c9                   	leaveq 
  801fb1:	c3                   	retq   

0000000000801fb2 <memfind>:
  801fb2:	55                   	push   %rbp
  801fb3:	48 89 e5             	mov    %rsp,%rbp
  801fb6:	48 83 ec 28          	sub    $0x28,%rsp
  801fba:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801fbe:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801fc1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801fc5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801fc9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fcd:	48 01 d0             	add    %rdx,%rax
  801fd0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801fd4:	eb 13                	jmp    801fe9 <memfind+0x37>
  801fd6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fda:	0f b6 00             	movzbl (%rax),%eax
  801fdd:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801fe0:	38 d0                	cmp    %dl,%al
  801fe2:	74 11                	je     801ff5 <memfind+0x43>
  801fe4:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801fe9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fed:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801ff1:	72 e3                	jb     801fd6 <memfind+0x24>
  801ff3:	eb 01                	jmp    801ff6 <memfind+0x44>
  801ff5:	90                   	nop
  801ff6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ffa:	c9                   	leaveq 
  801ffb:	c3                   	retq   

0000000000801ffc <strtol>:
  801ffc:	55                   	push   %rbp
  801ffd:	48 89 e5             	mov    %rsp,%rbp
  802000:	48 83 ec 38          	sub    $0x38,%rsp
  802004:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802008:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80200c:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80200f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802016:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80201d:	00 
  80201e:	eb 05                	jmp    802025 <strtol+0x29>
  802020:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  802025:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802029:	0f b6 00             	movzbl (%rax),%eax
  80202c:	3c 20                	cmp    $0x20,%al
  80202e:	74 f0                	je     802020 <strtol+0x24>
  802030:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802034:	0f b6 00             	movzbl (%rax),%eax
  802037:	3c 09                	cmp    $0x9,%al
  802039:	74 e5                	je     802020 <strtol+0x24>
  80203b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80203f:	0f b6 00             	movzbl (%rax),%eax
  802042:	3c 2b                	cmp    $0x2b,%al
  802044:	75 07                	jne    80204d <strtol+0x51>
  802046:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80204b:	eb 17                	jmp    802064 <strtol+0x68>
  80204d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802051:	0f b6 00             	movzbl (%rax),%eax
  802054:	3c 2d                	cmp    $0x2d,%al
  802056:	75 0c                	jne    802064 <strtol+0x68>
  802058:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80205d:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  802064:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  802068:	74 06                	je     802070 <strtol+0x74>
  80206a:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80206e:	75 28                	jne    802098 <strtol+0x9c>
  802070:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802074:	0f b6 00             	movzbl (%rax),%eax
  802077:	3c 30                	cmp    $0x30,%al
  802079:	75 1d                	jne    802098 <strtol+0x9c>
  80207b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80207f:	48 83 c0 01          	add    $0x1,%rax
  802083:	0f b6 00             	movzbl (%rax),%eax
  802086:	3c 78                	cmp    $0x78,%al
  802088:	75 0e                	jne    802098 <strtol+0x9c>
  80208a:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  80208f:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  802096:	eb 2c                	jmp    8020c4 <strtol+0xc8>
  802098:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80209c:	75 19                	jne    8020b7 <strtol+0xbb>
  80209e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020a2:	0f b6 00             	movzbl (%rax),%eax
  8020a5:	3c 30                	cmp    $0x30,%al
  8020a7:	75 0e                	jne    8020b7 <strtol+0xbb>
  8020a9:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8020ae:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8020b5:	eb 0d                	jmp    8020c4 <strtol+0xc8>
  8020b7:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8020bb:	75 07                	jne    8020c4 <strtol+0xc8>
  8020bd:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8020c4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020c8:	0f b6 00             	movzbl (%rax),%eax
  8020cb:	3c 2f                	cmp    $0x2f,%al
  8020cd:	7e 1d                	jle    8020ec <strtol+0xf0>
  8020cf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020d3:	0f b6 00             	movzbl (%rax),%eax
  8020d6:	3c 39                	cmp    $0x39,%al
  8020d8:	7f 12                	jg     8020ec <strtol+0xf0>
  8020da:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020de:	0f b6 00             	movzbl (%rax),%eax
  8020e1:	0f be c0             	movsbl %al,%eax
  8020e4:	83 e8 30             	sub    $0x30,%eax
  8020e7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8020ea:	eb 4e                	jmp    80213a <strtol+0x13e>
  8020ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020f0:	0f b6 00             	movzbl (%rax),%eax
  8020f3:	3c 60                	cmp    $0x60,%al
  8020f5:	7e 1d                	jle    802114 <strtol+0x118>
  8020f7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020fb:	0f b6 00             	movzbl (%rax),%eax
  8020fe:	3c 7a                	cmp    $0x7a,%al
  802100:	7f 12                	jg     802114 <strtol+0x118>
  802102:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802106:	0f b6 00             	movzbl (%rax),%eax
  802109:	0f be c0             	movsbl %al,%eax
  80210c:	83 e8 57             	sub    $0x57,%eax
  80210f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802112:	eb 26                	jmp    80213a <strtol+0x13e>
  802114:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802118:	0f b6 00             	movzbl (%rax),%eax
  80211b:	3c 40                	cmp    $0x40,%al
  80211d:	7e 47                	jle    802166 <strtol+0x16a>
  80211f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802123:	0f b6 00             	movzbl (%rax),%eax
  802126:	3c 5a                	cmp    $0x5a,%al
  802128:	7f 3c                	jg     802166 <strtol+0x16a>
  80212a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80212e:	0f b6 00             	movzbl (%rax),%eax
  802131:	0f be c0             	movsbl %al,%eax
  802134:	83 e8 37             	sub    $0x37,%eax
  802137:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80213a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80213d:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  802140:	7d 23                	jge    802165 <strtol+0x169>
  802142:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  802147:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80214a:	48 98                	cltq   
  80214c:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  802151:	48 89 c2             	mov    %rax,%rdx
  802154:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802157:	48 98                	cltq   
  802159:	48 01 d0             	add    %rdx,%rax
  80215c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802160:	e9 5f ff ff ff       	jmpq   8020c4 <strtol+0xc8>
  802165:	90                   	nop
  802166:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  80216b:	74 0b                	je     802178 <strtol+0x17c>
  80216d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802171:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802175:	48 89 10             	mov    %rdx,(%rax)
  802178:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80217c:	74 09                	je     802187 <strtol+0x18b>
  80217e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802182:	48 f7 d8             	neg    %rax
  802185:	eb 04                	jmp    80218b <strtol+0x18f>
  802187:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80218b:	c9                   	leaveq 
  80218c:	c3                   	retq   

000000000080218d <strstr>:
  80218d:	55                   	push   %rbp
  80218e:	48 89 e5             	mov    %rsp,%rbp
  802191:	48 83 ec 30          	sub    $0x30,%rsp
  802195:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802199:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80219d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8021a1:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8021a5:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8021a9:	0f b6 00             	movzbl (%rax),%eax
  8021ac:	88 45 ff             	mov    %al,-0x1(%rbp)
  8021af:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8021b3:	75 06                	jne    8021bb <strstr+0x2e>
  8021b5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8021b9:	eb 6b                	jmp    802226 <strstr+0x99>
  8021bb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8021bf:	48 89 c7             	mov    %rax,%rdi
  8021c2:	48 b8 62 1a 80 00 00 	movabs $0x801a62,%rax
  8021c9:	00 00 00 
  8021cc:	ff d0                	callq  *%rax
  8021ce:	48 98                	cltq   
  8021d0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8021d4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8021d8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8021dc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8021e0:	0f b6 00             	movzbl (%rax),%eax
  8021e3:	88 45 ef             	mov    %al,-0x11(%rbp)
  8021e6:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8021ea:	75 07                	jne    8021f3 <strstr+0x66>
  8021ec:	b8 00 00 00 00       	mov    $0x0,%eax
  8021f1:	eb 33                	jmp    802226 <strstr+0x99>
  8021f3:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8021f7:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8021fa:	75 d8                	jne    8021d4 <strstr+0x47>
  8021fc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802200:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802204:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802208:	48 89 ce             	mov    %rcx,%rsi
  80220b:	48 89 c7             	mov    %rax,%rdi
  80220e:	48 b8 83 1c 80 00 00 	movabs $0x801c83,%rax
  802215:	00 00 00 
  802218:	ff d0                	callq  *%rax
  80221a:	85 c0                	test   %eax,%eax
  80221c:	75 b6                	jne    8021d4 <strstr+0x47>
  80221e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802222:	48 83 e8 01          	sub    $0x1,%rax
  802226:	c9                   	leaveq 
  802227:	c3                   	retq   

0000000000802228 <syscall>:
  802228:	55                   	push   %rbp
  802229:	48 89 e5             	mov    %rsp,%rbp
  80222c:	53                   	push   %rbx
  80222d:	48 83 ec 48          	sub    $0x48,%rsp
  802231:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802234:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802237:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80223b:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80223f:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  802243:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  802247:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80224a:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80224e:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  802252:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  802256:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  80225a:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80225e:	4c 89 c3             	mov    %r8,%rbx
  802261:	cd 30                	int    $0x30
  802263:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802267:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  80226b:	74 3e                	je     8022ab <syscall+0x83>
  80226d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802272:	7e 37                	jle    8022ab <syscall+0x83>
  802274:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802278:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80227b:	49 89 d0             	mov    %rdx,%r8
  80227e:	89 c1                	mov    %eax,%ecx
  802280:	48 ba c8 54 80 00 00 	movabs $0x8054c8,%rdx
  802287:	00 00 00 
  80228a:	be 24 00 00 00       	mov    $0x24,%esi
  80228f:	48 bf e5 54 80 00 00 	movabs $0x8054e5,%rdi
  802296:	00 00 00 
  802299:	b8 00 00 00 00       	mov    $0x0,%eax
  80229e:	49 b9 04 0d 80 00 00 	movabs $0x800d04,%r9
  8022a5:	00 00 00 
  8022a8:	41 ff d1             	callq  *%r9
  8022ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022af:	48 83 c4 48          	add    $0x48,%rsp
  8022b3:	5b                   	pop    %rbx
  8022b4:	5d                   	pop    %rbp
  8022b5:	c3                   	retq   

00000000008022b6 <sys_cputs>:
  8022b6:	55                   	push   %rbp
  8022b7:	48 89 e5             	mov    %rsp,%rbp
  8022ba:	48 83 ec 10          	sub    $0x10,%rsp
  8022be:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8022c2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8022c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022ca:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8022ce:	48 83 ec 08          	sub    $0x8,%rsp
  8022d2:	6a 00                	pushq  $0x0
  8022d4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8022da:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8022e0:	48 89 d1             	mov    %rdx,%rcx
  8022e3:	48 89 c2             	mov    %rax,%rdx
  8022e6:	be 00 00 00 00       	mov    $0x0,%esi
  8022eb:	bf 00 00 00 00       	mov    $0x0,%edi
  8022f0:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  8022f7:	00 00 00 
  8022fa:	ff d0                	callq  *%rax
  8022fc:	48 83 c4 10          	add    $0x10,%rsp
  802300:	90                   	nop
  802301:	c9                   	leaveq 
  802302:	c3                   	retq   

0000000000802303 <sys_cgetc>:
  802303:	55                   	push   %rbp
  802304:	48 89 e5             	mov    %rsp,%rbp
  802307:	48 83 ec 08          	sub    $0x8,%rsp
  80230b:	6a 00                	pushq  $0x0
  80230d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802313:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802319:	b9 00 00 00 00       	mov    $0x0,%ecx
  80231e:	ba 00 00 00 00       	mov    $0x0,%edx
  802323:	be 00 00 00 00       	mov    $0x0,%esi
  802328:	bf 01 00 00 00       	mov    $0x1,%edi
  80232d:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  802334:	00 00 00 
  802337:	ff d0                	callq  *%rax
  802339:	48 83 c4 10          	add    $0x10,%rsp
  80233d:	c9                   	leaveq 
  80233e:	c3                   	retq   

000000000080233f <sys_env_destroy>:
  80233f:	55                   	push   %rbp
  802340:	48 89 e5             	mov    %rsp,%rbp
  802343:	48 83 ec 10          	sub    $0x10,%rsp
  802347:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80234a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80234d:	48 98                	cltq   
  80234f:	48 83 ec 08          	sub    $0x8,%rsp
  802353:	6a 00                	pushq  $0x0
  802355:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80235b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802361:	b9 00 00 00 00       	mov    $0x0,%ecx
  802366:	48 89 c2             	mov    %rax,%rdx
  802369:	be 01 00 00 00       	mov    $0x1,%esi
  80236e:	bf 03 00 00 00       	mov    $0x3,%edi
  802373:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  80237a:	00 00 00 
  80237d:	ff d0                	callq  *%rax
  80237f:	48 83 c4 10          	add    $0x10,%rsp
  802383:	c9                   	leaveq 
  802384:	c3                   	retq   

0000000000802385 <sys_getenvid>:
  802385:	55                   	push   %rbp
  802386:	48 89 e5             	mov    %rsp,%rbp
  802389:	48 83 ec 08          	sub    $0x8,%rsp
  80238d:	6a 00                	pushq  $0x0
  80238f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802395:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80239b:	b9 00 00 00 00       	mov    $0x0,%ecx
  8023a0:	ba 00 00 00 00       	mov    $0x0,%edx
  8023a5:	be 00 00 00 00       	mov    $0x0,%esi
  8023aa:	bf 02 00 00 00       	mov    $0x2,%edi
  8023af:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  8023b6:	00 00 00 
  8023b9:	ff d0                	callq  *%rax
  8023bb:	48 83 c4 10          	add    $0x10,%rsp
  8023bf:	c9                   	leaveq 
  8023c0:	c3                   	retq   

00000000008023c1 <sys_yield>:
  8023c1:	55                   	push   %rbp
  8023c2:	48 89 e5             	mov    %rsp,%rbp
  8023c5:	48 83 ec 08          	sub    $0x8,%rsp
  8023c9:	6a 00                	pushq  $0x0
  8023cb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8023d1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8023d7:	b9 00 00 00 00       	mov    $0x0,%ecx
  8023dc:	ba 00 00 00 00       	mov    $0x0,%edx
  8023e1:	be 00 00 00 00       	mov    $0x0,%esi
  8023e6:	bf 0b 00 00 00       	mov    $0xb,%edi
  8023eb:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  8023f2:	00 00 00 
  8023f5:	ff d0                	callq  *%rax
  8023f7:	48 83 c4 10          	add    $0x10,%rsp
  8023fb:	90                   	nop
  8023fc:	c9                   	leaveq 
  8023fd:	c3                   	retq   

00000000008023fe <sys_page_alloc>:
  8023fe:	55                   	push   %rbp
  8023ff:	48 89 e5             	mov    %rsp,%rbp
  802402:	48 83 ec 10          	sub    $0x10,%rsp
  802406:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802409:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80240d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802410:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802413:	48 63 c8             	movslq %eax,%rcx
  802416:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80241a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80241d:	48 98                	cltq   
  80241f:	48 83 ec 08          	sub    $0x8,%rsp
  802423:	6a 00                	pushq  $0x0
  802425:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80242b:	49 89 c8             	mov    %rcx,%r8
  80242e:	48 89 d1             	mov    %rdx,%rcx
  802431:	48 89 c2             	mov    %rax,%rdx
  802434:	be 01 00 00 00       	mov    $0x1,%esi
  802439:	bf 04 00 00 00       	mov    $0x4,%edi
  80243e:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  802445:	00 00 00 
  802448:	ff d0                	callq  *%rax
  80244a:	48 83 c4 10          	add    $0x10,%rsp
  80244e:	c9                   	leaveq 
  80244f:	c3                   	retq   

0000000000802450 <sys_page_map>:
  802450:	55                   	push   %rbp
  802451:	48 89 e5             	mov    %rsp,%rbp
  802454:	48 83 ec 20          	sub    $0x20,%rsp
  802458:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80245b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80245f:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802462:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  802466:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  80246a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80246d:	48 63 c8             	movslq %eax,%rcx
  802470:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  802474:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802477:	48 63 f0             	movslq %eax,%rsi
  80247a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80247e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802481:	48 98                	cltq   
  802483:	48 83 ec 08          	sub    $0x8,%rsp
  802487:	51                   	push   %rcx
  802488:	49 89 f9             	mov    %rdi,%r9
  80248b:	49 89 f0             	mov    %rsi,%r8
  80248e:	48 89 d1             	mov    %rdx,%rcx
  802491:	48 89 c2             	mov    %rax,%rdx
  802494:	be 01 00 00 00       	mov    $0x1,%esi
  802499:	bf 05 00 00 00       	mov    $0x5,%edi
  80249e:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  8024a5:	00 00 00 
  8024a8:	ff d0                	callq  *%rax
  8024aa:	48 83 c4 10          	add    $0x10,%rsp
  8024ae:	c9                   	leaveq 
  8024af:	c3                   	retq   

00000000008024b0 <sys_page_unmap>:
  8024b0:	55                   	push   %rbp
  8024b1:	48 89 e5             	mov    %rsp,%rbp
  8024b4:	48 83 ec 10          	sub    $0x10,%rsp
  8024b8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8024bb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8024bf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8024c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024c6:	48 98                	cltq   
  8024c8:	48 83 ec 08          	sub    $0x8,%rsp
  8024cc:	6a 00                	pushq  $0x0
  8024ce:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8024d4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8024da:	48 89 d1             	mov    %rdx,%rcx
  8024dd:	48 89 c2             	mov    %rax,%rdx
  8024e0:	be 01 00 00 00       	mov    $0x1,%esi
  8024e5:	bf 06 00 00 00       	mov    $0x6,%edi
  8024ea:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  8024f1:	00 00 00 
  8024f4:	ff d0                	callq  *%rax
  8024f6:	48 83 c4 10          	add    $0x10,%rsp
  8024fa:	c9                   	leaveq 
  8024fb:	c3                   	retq   

00000000008024fc <sys_env_set_status>:
  8024fc:	55                   	push   %rbp
  8024fd:	48 89 e5             	mov    %rsp,%rbp
  802500:	48 83 ec 10          	sub    $0x10,%rsp
  802504:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802507:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80250a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80250d:	48 63 d0             	movslq %eax,%rdx
  802510:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802513:	48 98                	cltq   
  802515:	48 83 ec 08          	sub    $0x8,%rsp
  802519:	6a 00                	pushq  $0x0
  80251b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802521:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802527:	48 89 d1             	mov    %rdx,%rcx
  80252a:	48 89 c2             	mov    %rax,%rdx
  80252d:	be 01 00 00 00       	mov    $0x1,%esi
  802532:	bf 08 00 00 00       	mov    $0x8,%edi
  802537:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  80253e:	00 00 00 
  802541:	ff d0                	callq  *%rax
  802543:	48 83 c4 10          	add    $0x10,%rsp
  802547:	c9                   	leaveq 
  802548:	c3                   	retq   

0000000000802549 <sys_env_set_trapframe>:
  802549:	55                   	push   %rbp
  80254a:	48 89 e5             	mov    %rsp,%rbp
  80254d:	48 83 ec 10          	sub    $0x10,%rsp
  802551:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802554:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802558:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80255c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80255f:	48 98                	cltq   
  802561:	48 83 ec 08          	sub    $0x8,%rsp
  802565:	6a 00                	pushq  $0x0
  802567:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80256d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802573:	48 89 d1             	mov    %rdx,%rcx
  802576:	48 89 c2             	mov    %rax,%rdx
  802579:	be 01 00 00 00       	mov    $0x1,%esi
  80257e:	bf 09 00 00 00       	mov    $0x9,%edi
  802583:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  80258a:	00 00 00 
  80258d:	ff d0                	callq  *%rax
  80258f:	48 83 c4 10          	add    $0x10,%rsp
  802593:	c9                   	leaveq 
  802594:	c3                   	retq   

0000000000802595 <sys_env_set_pgfault_upcall>:
  802595:	55                   	push   %rbp
  802596:	48 89 e5             	mov    %rsp,%rbp
  802599:	48 83 ec 10          	sub    $0x10,%rsp
  80259d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8025a0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8025a4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8025a8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025ab:	48 98                	cltq   
  8025ad:	48 83 ec 08          	sub    $0x8,%rsp
  8025b1:	6a 00                	pushq  $0x0
  8025b3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8025b9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8025bf:	48 89 d1             	mov    %rdx,%rcx
  8025c2:	48 89 c2             	mov    %rax,%rdx
  8025c5:	be 01 00 00 00       	mov    $0x1,%esi
  8025ca:	bf 0a 00 00 00       	mov    $0xa,%edi
  8025cf:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  8025d6:	00 00 00 
  8025d9:	ff d0                	callq  *%rax
  8025db:	48 83 c4 10          	add    $0x10,%rsp
  8025df:	c9                   	leaveq 
  8025e0:	c3                   	retq   

00000000008025e1 <sys_ipc_try_send>:
  8025e1:	55                   	push   %rbp
  8025e2:	48 89 e5             	mov    %rsp,%rbp
  8025e5:	48 83 ec 20          	sub    $0x20,%rsp
  8025e9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8025ec:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8025f0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8025f4:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  8025f7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8025fa:	48 63 f0             	movslq %eax,%rsi
  8025fd:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802601:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802604:	48 98                	cltq   
  802606:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80260a:	48 83 ec 08          	sub    $0x8,%rsp
  80260e:	6a 00                	pushq  $0x0
  802610:	49 89 f1             	mov    %rsi,%r9
  802613:	49 89 c8             	mov    %rcx,%r8
  802616:	48 89 d1             	mov    %rdx,%rcx
  802619:	48 89 c2             	mov    %rax,%rdx
  80261c:	be 00 00 00 00       	mov    $0x0,%esi
  802621:	bf 0c 00 00 00       	mov    $0xc,%edi
  802626:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  80262d:	00 00 00 
  802630:	ff d0                	callq  *%rax
  802632:	48 83 c4 10          	add    $0x10,%rsp
  802636:	c9                   	leaveq 
  802637:	c3                   	retq   

0000000000802638 <sys_ipc_recv>:
  802638:	55                   	push   %rbp
  802639:	48 89 e5             	mov    %rsp,%rbp
  80263c:	48 83 ec 10          	sub    $0x10,%rsp
  802640:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802644:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802648:	48 83 ec 08          	sub    $0x8,%rsp
  80264c:	6a 00                	pushq  $0x0
  80264e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802654:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80265a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80265f:	48 89 c2             	mov    %rax,%rdx
  802662:	be 01 00 00 00       	mov    $0x1,%esi
  802667:	bf 0d 00 00 00       	mov    $0xd,%edi
  80266c:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  802673:	00 00 00 
  802676:	ff d0                	callq  *%rax
  802678:	48 83 c4 10          	add    $0x10,%rsp
  80267c:	c9                   	leaveq 
  80267d:	c3                   	retq   

000000000080267e <sys_time_msec>:
  80267e:	55                   	push   %rbp
  80267f:	48 89 e5             	mov    %rsp,%rbp
  802682:	48 83 ec 08          	sub    $0x8,%rsp
  802686:	6a 00                	pushq  $0x0
  802688:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80268e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802694:	b9 00 00 00 00       	mov    $0x0,%ecx
  802699:	ba 00 00 00 00       	mov    $0x0,%edx
  80269e:	be 00 00 00 00       	mov    $0x0,%esi
  8026a3:	bf 0e 00 00 00       	mov    $0xe,%edi
  8026a8:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  8026af:	00 00 00 
  8026b2:	ff d0                	callq  *%rax
  8026b4:	48 83 c4 10          	add    $0x10,%rsp
  8026b8:	c9                   	leaveq 
  8026b9:	c3                   	retq   

00000000008026ba <sys_net_transmit>:
  8026ba:	55                   	push   %rbp
  8026bb:	48 89 e5             	mov    %rsp,%rbp
  8026be:	48 83 ec 10          	sub    $0x10,%rsp
  8026c2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8026c6:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8026c9:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8026cc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8026d0:	48 83 ec 08          	sub    $0x8,%rsp
  8026d4:	6a 00                	pushq  $0x0
  8026d6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8026dc:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8026e2:	48 89 d1             	mov    %rdx,%rcx
  8026e5:	48 89 c2             	mov    %rax,%rdx
  8026e8:	be 00 00 00 00       	mov    $0x0,%esi
  8026ed:	bf 0f 00 00 00       	mov    $0xf,%edi
  8026f2:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  8026f9:	00 00 00 
  8026fc:	ff d0                	callq  *%rax
  8026fe:	48 83 c4 10          	add    $0x10,%rsp
  802702:	c9                   	leaveq 
  802703:	c3                   	retq   

0000000000802704 <sys_net_receive>:
  802704:	55                   	push   %rbp
  802705:	48 89 e5             	mov    %rsp,%rbp
  802708:	48 83 ec 10          	sub    $0x10,%rsp
  80270c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802710:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802713:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802716:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80271a:	48 83 ec 08          	sub    $0x8,%rsp
  80271e:	6a 00                	pushq  $0x0
  802720:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802726:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80272c:	48 89 d1             	mov    %rdx,%rcx
  80272f:	48 89 c2             	mov    %rax,%rdx
  802732:	be 00 00 00 00       	mov    $0x0,%esi
  802737:	bf 10 00 00 00       	mov    $0x10,%edi
  80273c:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  802743:	00 00 00 
  802746:	ff d0                	callq  *%rax
  802748:	48 83 c4 10          	add    $0x10,%rsp
  80274c:	c9                   	leaveq 
  80274d:	c3                   	retq   

000000000080274e <sys_ept_map>:
  80274e:	55                   	push   %rbp
  80274f:	48 89 e5             	mov    %rsp,%rbp
  802752:	48 83 ec 20          	sub    $0x20,%rsp
  802756:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802759:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80275d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802760:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  802764:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802768:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80276b:	48 63 c8             	movslq %eax,%rcx
  80276e:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  802772:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802775:	48 63 f0             	movslq %eax,%rsi
  802778:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80277c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80277f:	48 98                	cltq   
  802781:	48 83 ec 08          	sub    $0x8,%rsp
  802785:	51                   	push   %rcx
  802786:	49 89 f9             	mov    %rdi,%r9
  802789:	49 89 f0             	mov    %rsi,%r8
  80278c:	48 89 d1             	mov    %rdx,%rcx
  80278f:	48 89 c2             	mov    %rax,%rdx
  802792:	be 00 00 00 00       	mov    $0x0,%esi
  802797:	bf 11 00 00 00       	mov    $0x11,%edi
  80279c:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  8027a3:	00 00 00 
  8027a6:	ff d0                	callq  *%rax
  8027a8:	48 83 c4 10          	add    $0x10,%rsp
  8027ac:	c9                   	leaveq 
  8027ad:	c3                   	retq   

00000000008027ae <sys_env_mkguest>:
  8027ae:	55                   	push   %rbp
  8027af:	48 89 e5             	mov    %rsp,%rbp
  8027b2:	48 83 ec 10          	sub    $0x10,%rsp
  8027b6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8027ba:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8027be:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8027c2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8027c6:	48 83 ec 08          	sub    $0x8,%rsp
  8027ca:	6a 00                	pushq  $0x0
  8027cc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8027d2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8027d8:	48 89 d1             	mov    %rdx,%rcx
  8027db:	48 89 c2             	mov    %rax,%rdx
  8027de:	be 00 00 00 00       	mov    $0x0,%esi
  8027e3:	bf 12 00 00 00       	mov    $0x12,%edi
  8027e8:	48 b8 28 22 80 00 00 	movabs $0x802228,%rax
  8027ef:	00 00 00 
  8027f2:	ff d0                	callq  *%rax
  8027f4:	48 83 c4 10          	add    $0x10,%rsp
  8027f8:	c9                   	leaveq 
  8027f9:	c3                   	retq   

00000000008027fa <ipc_recv>:
  8027fa:	55                   	push   %rbp
  8027fb:	48 89 e5             	mov    %rsp,%rbp
  8027fe:	48 83 ec 30          	sub    $0x30,%rsp
  802802:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802806:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80280a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80280e:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802813:	75 0e                	jne    802823 <ipc_recv+0x29>
  802815:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80281c:	00 00 00 
  80281f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802823:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802827:	48 89 c7             	mov    %rax,%rdi
  80282a:	48 b8 38 26 80 00 00 	movabs $0x802638,%rax
  802831:	00 00 00 
  802834:	ff d0                	callq  *%rax
  802836:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802839:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80283d:	79 27                	jns    802866 <ipc_recv+0x6c>
  80283f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  802844:	74 0a                	je     802850 <ipc_recv+0x56>
  802846:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80284a:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  802850:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802855:	74 0a                	je     802861 <ipc_recv+0x67>
  802857:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80285b:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  802861:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802864:	eb 53                	jmp    8028b9 <ipc_recv+0xbf>
  802866:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80286b:	74 19                	je     802886 <ipc_recv+0x8c>
  80286d:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802874:	00 00 00 
  802877:	48 8b 00             	mov    (%rax),%rax
  80287a:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  802880:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802884:	89 10                	mov    %edx,(%rax)
  802886:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80288b:	74 19                	je     8028a6 <ipc_recv+0xac>
  80288d:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802894:	00 00 00 
  802897:	48 8b 00             	mov    (%rax),%rax
  80289a:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8028a0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028a4:	89 10                	mov    %edx,(%rax)
  8028a6:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8028ad:	00 00 00 
  8028b0:	48 8b 00             	mov    (%rax),%rax
  8028b3:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8028b9:	c9                   	leaveq 
  8028ba:	c3                   	retq   

00000000008028bb <ipc_send>:
  8028bb:	55                   	push   %rbp
  8028bc:	48 89 e5             	mov    %rsp,%rbp
  8028bf:	48 83 ec 30          	sub    $0x30,%rsp
  8028c3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8028c6:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8028c9:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  8028cd:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8028d0:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8028d5:	75 1c                	jne    8028f3 <ipc_send+0x38>
  8028d7:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8028de:	00 00 00 
  8028e1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8028e5:	eb 0c                	jmp    8028f3 <ipc_send+0x38>
  8028e7:	48 b8 c1 23 80 00 00 	movabs $0x8023c1,%rax
  8028ee:	00 00 00 
  8028f1:	ff d0                	callq  *%rax
  8028f3:	8b 75 e8             	mov    -0x18(%rbp),%esi
  8028f6:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8028f9:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8028fd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802900:	89 c7                	mov    %eax,%edi
  802902:	48 b8 e1 25 80 00 00 	movabs $0x8025e1,%rax
  802909:	00 00 00 
  80290c:	ff d0                	callq  *%rax
  80290e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802911:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  802915:	74 d0                	je     8028e7 <ipc_send+0x2c>
  802917:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80291b:	79 30                	jns    80294d <ipc_send+0x92>
  80291d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802920:	89 c1                	mov    %eax,%ecx
  802922:	48 ba f8 54 80 00 00 	movabs $0x8054f8,%rdx
  802929:	00 00 00 
  80292c:	be 44 00 00 00       	mov    $0x44,%esi
  802931:	48 bf 0e 55 80 00 00 	movabs $0x80550e,%rdi
  802938:	00 00 00 
  80293b:	b8 00 00 00 00       	mov    $0x0,%eax
  802940:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  802947:	00 00 00 
  80294a:	41 ff d0             	callq  *%r8
  80294d:	90                   	nop
  80294e:	c9                   	leaveq 
  80294f:	c3                   	retq   

0000000000802950 <ipc_host_recv>:
  802950:	55                   	push   %rbp
  802951:	48 89 e5             	mov    %rsp,%rbp
  802954:	48 83 ec 10          	sub    $0x10,%rsp
  802958:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80295c:	48 ba 20 55 80 00 00 	movabs $0x805520,%rdx
  802963:	00 00 00 
  802966:	be 4e 00 00 00       	mov    $0x4e,%esi
  80296b:	48 bf 0e 55 80 00 00 	movabs $0x80550e,%rdi
  802972:	00 00 00 
  802975:	b8 00 00 00 00       	mov    $0x0,%eax
  80297a:	48 b9 04 0d 80 00 00 	movabs $0x800d04,%rcx
  802981:	00 00 00 
  802984:	ff d1                	callq  *%rcx

0000000000802986 <ipc_host_send>:
  802986:	55                   	push   %rbp
  802987:	48 89 e5             	mov    %rsp,%rbp
  80298a:	48 83 ec 20          	sub    $0x20,%rsp
  80298e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802991:	89 75 f8             	mov    %esi,-0x8(%rbp)
  802994:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  802998:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  80299b:	48 ba 40 55 80 00 00 	movabs $0x805540,%rdx
  8029a2:	00 00 00 
  8029a5:	be 58 00 00 00       	mov    $0x58,%esi
  8029aa:	48 bf 0e 55 80 00 00 	movabs $0x80550e,%rdi
  8029b1:	00 00 00 
  8029b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8029b9:	48 b9 04 0d 80 00 00 	movabs $0x800d04,%rcx
  8029c0:	00 00 00 
  8029c3:	ff d1                	callq  *%rcx

00000000008029c5 <ipc_find_env>:
  8029c5:	55                   	push   %rbp
  8029c6:	48 89 e5             	mov    %rsp,%rbp
  8029c9:	48 83 ec 18          	sub    $0x18,%rsp
  8029cd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8029d0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8029d7:	eb 4d                	jmp    802a26 <ipc_find_env+0x61>
  8029d9:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8029e0:	00 00 00 
  8029e3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029e6:	48 98                	cltq   
  8029e8:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8029ef:	48 01 d0             	add    %rdx,%rax
  8029f2:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8029f8:	8b 00                	mov    (%rax),%eax
  8029fa:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8029fd:	75 23                	jne    802a22 <ipc_find_env+0x5d>
  8029ff:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802a06:	00 00 00 
  802a09:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a0c:	48 98                	cltq   
  802a0e:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802a15:	48 01 d0             	add    %rdx,%rax
  802a18:	48 05 c8 00 00 00    	add    $0xc8,%rax
  802a1e:	8b 00                	mov    (%rax),%eax
  802a20:	eb 12                	jmp    802a34 <ipc_find_env+0x6f>
  802a22:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802a26:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  802a2d:	7e aa                	jle    8029d9 <ipc_find_env+0x14>
  802a2f:	b8 00 00 00 00       	mov    $0x0,%eax
  802a34:	c9                   	leaveq 
  802a35:	c3                   	retq   

0000000000802a36 <fd2num>:
  802a36:	55                   	push   %rbp
  802a37:	48 89 e5             	mov    %rsp,%rbp
  802a3a:	48 83 ec 08          	sub    $0x8,%rsp
  802a3e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802a42:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802a46:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802a4d:	ff ff ff 
  802a50:	48 01 d0             	add    %rdx,%rax
  802a53:	48 c1 e8 0c          	shr    $0xc,%rax
  802a57:	c9                   	leaveq 
  802a58:	c3                   	retq   

0000000000802a59 <fd2data>:
  802a59:	55                   	push   %rbp
  802a5a:	48 89 e5             	mov    %rsp,%rbp
  802a5d:	48 83 ec 08          	sub    $0x8,%rsp
  802a61:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802a65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802a69:	48 89 c7             	mov    %rax,%rdi
  802a6c:	48 b8 36 2a 80 00 00 	movabs $0x802a36,%rax
  802a73:	00 00 00 
  802a76:	ff d0                	callq  *%rax
  802a78:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802a7e:	48 c1 e0 0c          	shl    $0xc,%rax
  802a82:	c9                   	leaveq 
  802a83:	c3                   	retq   

0000000000802a84 <fd_alloc>:
  802a84:	55                   	push   %rbp
  802a85:	48 89 e5             	mov    %rsp,%rbp
  802a88:	48 83 ec 18          	sub    $0x18,%rsp
  802a8c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802a90:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a97:	eb 6b                	jmp    802b04 <fd_alloc+0x80>
  802a99:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a9c:	48 98                	cltq   
  802a9e:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802aa4:	48 c1 e0 0c          	shl    $0xc,%rax
  802aa8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802aac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ab0:	48 c1 e8 15          	shr    $0x15,%rax
  802ab4:	48 89 c2             	mov    %rax,%rdx
  802ab7:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802abe:	01 00 00 
  802ac1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ac5:	83 e0 01             	and    $0x1,%eax
  802ac8:	48 85 c0             	test   %rax,%rax
  802acb:	74 21                	je     802aee <fd_alloc+0x6a>
  802acd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ad1:	48 c1 e8 0c          	shr    $0xc,%rax
  802ad5:	48 89 c2             	mov    %rax,%rdx
  802ad8:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802adf:	01 00 00 
  802ae2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ae6:	83 e0 01             	and    $0x1,%eax
  802ae9:	48 85 c0             	test   %rax,%rax
  802aec:	75 12                	jne    802b00 <fd_alloc+0x7c>
  802aee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802af2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802af6:	48 89 10             	mov    %rdx,(%rax)
  802af9:	b8 00 00 00 00       	mov    $0x0,%eax
  802afe:	eb 1a                	jmp    802b1a <fd_alloc+0x96>
  802b00:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802b04:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802b08:	7e 8f                	jle    802a99 <fd_alloc+0x15>
  802b0a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b0e:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802b15:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802b1a:	c9                   	leaveq 
  802b1b:	c3                   	retq   

0000000000802b1c <fd_lookup>:
  802b1c:	55                   	push   %rbp
  802b1d:	48 89 e5             	mov    %rsp,%rbp
  802b20:	48 83 ec 20          	sub    $0x20,%rsp
  802b24:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802b27:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802b2b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802b2f:	78 06                	js     802b37 <fd_lookup+0x1b>
  802b31:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802b35:	7e 07                	jle    802b3e <fd_lookup+0x22>
  802b37:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802b3c:	eb 6c                	jmp    802baa <fd_lookup+0x8e>
  802b3e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b41:	48 98                	cltq   
  802b43:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802b49:	48 c1 e0 0c          	shl    $0xc,%rax
  802b4d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802b51:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b55:	48 c1 e8 15          	shr    $0x15,%rax
  802b59:	48 89 c2             	mov    %rax,%rdx
  802b5c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802b63:	01 00 00 
  802b66:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b6a:	83 e0 01             	and    $0x1,%eax
  802b6d:	48 85 c0             	test   %rax,%rax
  802b70:	74 21                	je     802b93 <fd_lookup+0x77>
  802b72:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b76:	48 c1 e8 0c          	shr    $0xc,%rax
  802b7a:	48 89 c2             	mov    %rax,%rdx
  802b7d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b84:	01 00 00 
  802b87:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b8b:	83 e0 01             	and    $0x1,%eax
  802b8e:	48 85 c0             	test   %rax,%rax
  802b91:	75 07                	jne    802b9a <fd_lookup+0x7e>
  802b93:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802b98:	eb 10                	jmp    802baa <fd_lookup+0x8e>
  802b9a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b9e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802ba2:	48 89 10             	mov    %rdx,(%rax)
  802ba5:	b8 00 00 00 00       	mov    $0x0,%eax
  802baa:	c9                   	leaveq 
  802bab:	c3                   	retq   

0000000000802bac <fd_close>:
  802bac:	55                   	push   %rbp
  802bad:	48 89 e5             	mov    %rsp,%rbp
  802bb0:	48 83 ec 30          	sub    $0x30,%rsp
  802bb4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802bb8:	89 f0                	mov    %esi,%eax
  802bba:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802bbd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802bc1:	48 89 c7             	mov    %rax,%rdi
  802bc4:	48 b8 36 2a 80 00 00 	movabs $0x802a36,%rax
  802bcb:	00 00 00 
  802bce:	ff d0                	callq  *%rax
  802bd0:	89 c2                	mov    %eax,%edx
  802bd2:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802bd6:	48 89 c6             	mov    %rax,%rsi
  802bd9:	89 d7                	mov    %edx,%edi
  802bdb:	48 b8 1c 2b 80 00 00 	movabs $0x802b1c,%rax
  802be2:	00 00 00 
  802be5:	ff d0                	callq  *%rax
  802be7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bea:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802bee:	78 0a                	js     802bfa <fd_close+0x4e>
  802bf0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bf4:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802bf8:	74 12                	je     802c0c <fd_close+0x60>
  802bfa:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802bfe:	74 05                	je     802c05 <fd_close+0x59>
  802c00:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c03:	eb 70                	jmp    802c75 <fd_close+0xc9>
  802c05:	b8 00 00 00 00       	mov    $0x0,%eax
  802c0a:	eb 69                	jmp    802c75 <fd_close+0xc9>
  802c0c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c10:	8b 00                	mov    (%rax),%eax
  802c12:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802c16:	48 89 d6             	mov    %rdx,%rsi
  802c19:	89 c7                	mov    %eax,%edi
  802c1b:	48 b8 77 2c 80 00 00 	movabs $0x802c77,%rax
  802c22:	00 00 00 
  802c25:	ff d0                	callq  *%rax
  802c27:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c2a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c2e:	78 2a                	js     802c5a <fd_close+0xae>
  802c30:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c34:	48 8b 40 20          	mov    0x20(%rax),%rax
  802c38:	48 85 c0             	test   %rax,%rax
  802c3b:	74 16                	je     802c53 <fd_close+0xa7>
  802c3d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c41:	48 8b 40 20          	mov    0x20(%rax),%rax
  802c45:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802c49:	48 89 d7             	mov    %rdx,%rdi
  802c4c:	ff d0                	callq  *%rax
  802c4e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c51:	eb 07                	jmp    802c5a <fd_close+0xae>
  802c53:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802c5a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c5e:	48 89 c6             	mov    %rax,%rsi
  802c61:	bf 00 00 00 00       	mov    $0x0,%edi
  802c66:	48 b8 b0 24 80 00 00 	movabs $0x8024b0,%rax
  802c6d:	00 00 00 
  802c70:	ff d0                	callq  *%rax
  802c72:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c75:	c9                   	leaveq 
  802c76:	c3                   	retq   

0000000000802c77 <dev_lookup>:
  802c77:	55                   	push   %rbp
  802c78:	48 89 e5             	mov    %rsp,%rbp
  802c7b:	48 83 ec 20          	sub    $0x20,%rsp
  802c7f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802c82:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802c86:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802c8d:	eb 41                	jmp    802cd0 <dev_lookup+0x59>
  802c8f:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802c96:	00 00 00 
  802c99:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802c9c:	48 63 d2             	movslq %edx,%rdx
  802c9f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ca3:	8b 00                	mov    (%rax),%eax
  802ca5:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802ca8:	75 22                	jne    802ccc <dev_lookup+0x55>
  802caa:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802cb1:	00 00 00 
  802cb4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802cb7:	48 63 d2             	movslq %edx,%rdx
  802cba:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802cbe:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802cc2:	48 89 10             	mov    %rdx,(%rax)
  802cc5:	b8 00 00 00 00       	mov    $0x0,%eax
  802cca:	eb 60                	jmp    802d2c <dev_lookup+0xb5>
  802ccc:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802cd0:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802cd7:	00 00 00 
  802cda:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802cdd:	48 63 d2             	movslq %edx,%rdx
  802ce0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ce4:	48 85 c0             	test   %rax,%rax
  802ce7:	75 a6                	jne    802c8f <dev_lookup+0x18>
  802ce9:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802cf0:	00 00 00 
  802cf3:	48 8b 00             	mov    (%rax),%rax
  802cf6:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802cfc:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802cff:	89 c6                	mov    %eax,%esi
  802d01:	48 bf 60 55 80 00 00 	movabs $0x805560,%rdi
  802d08:	00 00 00 
  802d0b:	b8 00 00 00 00       	mov    $0x0,%eax
  802d10:	48 b9 3e 0f 80 00 00 	movabs $0x800f3e,%rcx
  802d17:	00 00 00 
  802d1a:	ff d1                	callq  *%rcx
  802d1c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802d20:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802d27:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802d2c:	c9                   	leaveq 
  802d2d:	c3                   	retq   

0000000000802d2e <close>:
  802d2e:	55                   	push   %rbp
  802d2f:	48 89 e5             	mov    %rsp,%rbp
  802d32:	48 83 ec 20          	sub    $0x20,%rsp
  802d36:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802d39:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d3d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d40:	48 89 d6             	mov    %rdx,%rsi
  802d43:	89 c7                	mov    %eax,%edi
  802d45:	48 b8 1c 2b 80 00 00 	movabs $0x802b1c,%rax
  802d4c:	00 00 00 
  802d4f:	ff d0                	callq  *%rax
  802d51:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d54:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d58:	79 05                	jns    802d5f <close+0x31>
  802d5a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d5d:	eb 18                	jmp    802d77 <close+0x49>
  802d5f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d63:	be 01 00 00 00       	mov    $0x1,%esi
  802d68:	48 89 c7             	mov    %rax,%rdi
  802d6b:	48 b8 ac 2b 80 00 00 	movabs $0x802bac,%rax
  802d72:	00 00 00 
  802d75:	ff d0                	callq  *%rax
  802d77:	c9                   	leaveq 
  802d78:	c3                   	retq   

0000000000802d79 <close_all>:
  802d79:	55                   	push   %rbp
  802d7a:	48 89 e5             	mov    %rsp,%rbp
  802d7d:	48 83 ec 10          	sub    $0x10,%rsp
  802d81:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802d88:	eb 15                	jmp    802d9f <close_all+0x26>
  802d8a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d8d:	89 c7                	mov    %eax,%edi
  802d8f:	48 b8 2e 2d 80 00 00 	movabs $0x802d2e,%rax
  802d96:	00 00 00 
  802d99:	ff d0                	callq  *%rax
  802d9b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802d9f:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802da3:	7e e5                	jle    802d8a <close_all+0x11>
  802da5:	90                   	nop
  802da6:	c9                   	leaveq 
  802da7:	c3                   	retq   

0000000000802da8 <dup>:
  802da8:	55                   	push   %rbp
  802da9:	48 89 e5             	mov    %rsp,%rbp
  802dac:	48 83 ec 40          	sub    $0x40,%rsp
  802db0:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802db3:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802db6:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802dba:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802dbd:	48 89 d6             	mov    %rdx,%rsi
  802dc0:	89 c7                	mov    %eax,%edi
  802dc2:	48 b8 1c 2b 80 00 00 	movabs $0x802b1c,%rax
  802dc9:	00 00 00 
  802dcc:	ff d0                	callq  *%rax
  802dce:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802dd1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802dd5:	79 08                	jns    802ddf <dup+0x37>
  802dd7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dda:	e9 70 01 00 00       	jmpq   802f4f <dup+0x1a7>
  802ddf:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802de2:	89 c7                	mov    %eax,%edi
  802de4:	48 b8 2e 2d 80 00 00 	movabs $0x802d2e,%rax
  802deb:	00 00 00 
  802dee:	ff d0                	callq  *%rax
  802df0:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802df3:	48 98                	cltq   
  802df5:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802dfb:	48 c1 e0 0c          	shl    $0xc,%rax
  802dff:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802e03:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802e07:	48 89 c7             	mov    %rax,%rdi
  802e0a:	48 b8 59 2a 80 00 00 	movabs $0x802a59,%rax
  802e11:	00 00 00 
  802e14:	ff d0                	callq  *%rax
  802e16:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802e1a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e1e:	48 89 c7             	mov    %rax,%rdi
  802e21:	48 b8 59 2a 80 00 00 	movabs $0x802a59,%rax
  802e28:	00 00 00 
  802e2b:	ff d0                	callq  *%rax
  802e2d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802e31:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e35:	48 c1 e8 15          	shr    $0x15,%rax
  802e39:	48 89 c2             	mov    %rax,%rdx
  802e3c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802e43:	01 00 00 
  802e46:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802e4a:	83 e0 01             	and    $0x1,%eax
  802e4d:	48 85 c0             	test   %rax,%rax
  802e50:	74 71                	je     802ec3 <dup+0x11b>
  802e52:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e56:	48 c1 e8 0c          	shr    $0xc,%rax
  802e5a:	48 89 c2             	mov    %rax,%rdx
  802e5d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802e64:	01 00 00 
  802e67:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802e6b:	83 e0 01             	and    $0x1,%eax
  802e6e:	48 85 c0             	test   %rax,%rax
  802e71:	74 50                	je     802ec3 <dup+0x11b>
  802e73:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e77:	48 c1 e8 0c          	shr    $0xc,%rax
  802e7b:	48 89 c2             	mov    %rax,%rdx
  802e7e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802e85:	01 00 00 
  802e88:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802e8c:	25 07 0e 00 00       	and    $0xe07,%eax
  802e91:	89 c1                	mov    %eax,%ecx
  802e93:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802e97:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e9b:	41 89 c8             	mov    %ecx,%r8d
  802e9e:	48 89 d1             	mov    %rdx,%rcx
  802ea1:	ba 00 00 00 00       	mov    $0x0,%edx
  802ea6:	48 89 c6             	mov    %rax,%rsi
  802ea9:	bf 00 00 00 00       	mov    $0x0,%edi
  802eae:	48 b8 50 24 80 00 00 	movabs $0x802450,%rax
  802eb5:	00 00 00 
  802eb8:	ff d0                	callq  *%rax
  802eba:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ebd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ec1:	78 55                	js     802f18 <dup+0x170>
  802ec3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802ec7:	48 c1 e8 0c          	shr    $0xc,%rax
  802ecb:	48 89 c2             	mov    %rax,%rdx
  802ece:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802ed5:	01 00 00 
  802ed8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802edc:	25 07 0e 00 00       	and    $0xe07,%eax
  802ee1:	89 c1                	mov    %eax,%ecx
  802ee3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802ee7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802eeb:	41 89 c8             	mov    %ecx,%r8d
  802eee:	48 89 d1             	mov    %rdx,%rcx
  802ef1:	ba 00 00 00 00       	mov    $0x0,%edx
  802ef6:	48 89 c6             	mov    %rax,%rsi
  802ef9:	bf 00 00 00 00       	mov    $0x0,%edi
  802efe:	48 b8 50 24 80 00 00 	movabs $0x802450,%rax
  802f05:	00 00 00 
  802f08:	ff d0                	callq  *%rax
  802f0a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f0d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f11:	78 08                	js     802f1b <dup+0x173>
  802f13:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802f16:	eb 37                	jmp    802f4f <dup+0x1a7>
  802f18:	90                   	nop
  802f19:	eb 01                	jmp    802f1c <dup+0x174>
  802f1b:	90                   	nop
  802f1c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f20:	48 89 c6             	mov    %rax,%rsi
  802f23:	bf 00 00 00 00       	mov    $0x0,%edi
  802f28:	48 b8 b0 24 80 00 00 	movabs $0x8024b0,%rax
  802f2f:	00 00 00 
  802f32:	ff d0                	callq  *%rax
  802f34:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802f38:	48 89 c6             	mov    %rax,%rsi
  802f3b:	bf 00 00 00 00       	mov    $0x0,%edi
  802f40:	48 b8 b0 24 80 00 00 	movabs $0x8024b0,%rax
  802f47:	00 00 00 
  802f4a:	ff d0                	callq  *%rax
  802f4c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f4f:	c9                   	leaveq 
  802f50:	c3                   	retq   

0000000000802f51 <read>:
  802f51:	55                   	push   %rbp
  802f52:	48 89 e5             	mov    %rsp,%rbp
  802f55:	48 83 ec 40          	sub    $0x40,%rsp
  802f59:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802f5c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802f60:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802f64:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802f68:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802f6b:	48 89 d6             	mov    %rdx,%rsi
  802f6e:	89 c7                	mov    %eax,%edi
  802f70:	48 b8 1c 2b 80 00 00 	movabs $0x802b1c,%rax
  802f77:	00 00 00 
  802f7a:	ff d0                	callq  *%rax
  802f7c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f7f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f83:	78 24                	js     802fa9 <read+0x58>
  802f85:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f89:	8b 00                	mov    (%rax),%eax
  802f8b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802f8f:	48 89 d6             	mov    %rdx,%rsi
  802f92:	89 c7                	mov    %eax,%edi
  802f94:	48 b8 77 2c 80 00 00 	movabs $0x802c77,%rax
  802f9b:	00 00 00 
  802f9e:	ff d0                	callq  *%rax
  802fa0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fa3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fa7:	79 05                	jns    802fae <read+0x5d>
  802fa9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fac:	eb 76                	jmp    803024 <read+0xd3>
  802fae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fb2:	8b 40 08             	mov    0x8(%rax),%eax
  802fb5:	83 e0 03             	and    $0x3,%eax
  802fb8:	83 f8 01             	cmp    $0x1,%eax
  802fbb:	75 3a                	jne    802ff7 <read+0xa6>
  802fbd:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802fc4:	00 00 00 
  802fc7:	48 8b 00             	mov    (%rax),%rax
  802fca:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802fd0:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802fd3:	89 c6                	mov    %eax,%esi
  802fd5:	48 bf 7f 55 80 00 00 	movabs $0x80557f,%rdi
  802fdc:	00 00 00 
  802fdf:	b8 00 00 00 00       	mov    $0x0,%eax
  802fe4:	48 b9 3e 0f 80 00 00 	movabs $0x800f3e,%rcx
  802feb:	00 00 00 
  802fee:	ff d1                	callq  *%rcx
  802ff0:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802ff5:	eb 2d                	jmp    803024 <read+0xd3>
  802ff7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ffb:	48 8b 40 10          	mov    0x10(%rax),%rax
  802fff:	48 85 c0             	test   %rax,%rax
  803002:	75 07                	jne    80300b <read+0xba>
  803004:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803009:	eb 19                	jmp    803024 <read+0xd3>
  80300b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80300f:	48 8b 40 10          	mov    0x10(%rax),%rax
  803013:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803017:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80301b:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80301f:	48 89 cf             	mov    %rcx,%rdi
  803022:	ff d0                	callq  *%rax
  803024:	c9                   	leaveq 
  803025:	c3                   	retq   

0000000000803026 <readn>:
  803026:	55                   	push   %rbp
  803027:	48 89 e5             	mov    %rsp,%rbp
  80302a:	48 83 ec 30          	sub    $0x30,%rsp
  80302e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803031:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803035:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803039:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803040:	eb 47                	jmp    803089 <readn+0x63>
  803042:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803045:	48 98                	cltq   
  803047:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80304b:	48 29 c2             	sub    %rax,%rdx
  80304e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803051:	48 63 c8             	movslq %eax,%rcx
  803054:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803058:	48 01 c1             	add    %rax,%rcx
  80305b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80305e:	48 89 ce             	mov    %rcx,%rsi
  803061:	89 c7                	mov    %eax,%edi
  803063:	48 b8 51 2f 80 00 00 	movabs $0x802f51,%rax
  80306a:	00 00 00 
  80306d:	ff d0                	callq  *%rax
  80306f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803072:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803076:	79 05                	jns    80307d <readn+0x57>
  803078:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80307b:	eb 1d                	jmp    80309a <readn+0x74>
  80307d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803081:	74 13                	je     803096 <readn+0x70>
  803083:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803086:	01 45 fc             	add    %eax,-0x4(%rbp)
  803089:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80308c:	48 98                	cltq   
  80308e:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803092:	72 ae                	jb     803042 <readn+0x1c>
  803094:	eb 01                	jmp    803097 <readn+0x71>
  803096:	90                   	nop
  803097:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80309a:	c9                   	leaveq 
  80309b:	c3                   	retq   

000000000080309c <write>:
  80309c:	55                   	push   %rbp
  80309d:	48 89 e5             	mov    %rsp,%rbp
  8030a0:	48 83 ec 40          	sub    $0x40,%rsp
  8030a4:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8030a7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8030ab:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8030af:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8030b3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8030b6:	48 89 d6             	mov    %rdx,%rsi
  8030b9:	89 c7                	mov    %eax,%edi
  8030bb:	48 b8 1c 2b 80 00 00 	movabs $0x802b1c,%rax
  8030c2:	00 00 00 
  8030c5:	ff d0                	callq  *%rax
  8030c7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030ca:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030ce:	78 24                	js     8030f4 <write+0x58>
  8030d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030d4:	8b 00                	mov    (%rax),%eax
  8030d6:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8030da:	48 89 d6             	mov    %rdx,%rsi
  8030dd:	89 c7                	mov    %eax,%edi
  8030df:	48 b8 77 2c 80 00 00 	movabs $0x802c77,%rax
  8030e6:	00 00 00 
  8030e9:	ff d0                	callq  *%rax
  8030eb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030ee:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030f2:	79 05                	jns    8030f9 <write+0x5d>
  8030f4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030f7:	eb 75                	jmp    80316e <write+0xd2>
  8030f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030fd:	8b 40 08             	mov    0x8(%rax),%eax
  803100:	83 e0 03             	and    $0x3,%eax
  803103:	85 c0                	test   %eax,%eax
  803105:	75 3a                	jne    803141 <write+0xa5>
  803107:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80310e:	00 00 00 
  803111:	48 8b 00             	mov    (%rax),%rax
  803114:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80311a:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80311d:	89 c6                	mov    %eax,%esi
  80311f:	48 bf 9b 55 80 00 00 	movabs $0x80559b,%rdi
  803126:	00 00 00 
  803129:	b8 00 00 00 00       	mov    $0x0,%eax
  80312e:	48 b9 3e 0f 80 00 00 	movabs $0x800f3e,%rcx
  803135:	00 00 00 
  803138:	ff d1                	callq  *%rcx
  80313a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80313f:	eb 2d                	jmp    80316e <write+0xd2>
  803141:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803145:	48 8b 40 18          	mov    0x18(%rax),%rax
  803149:	48 85 c0             	test   %rax,%rax
  80314c:	75 07                	jne    803155 <write+0xb9>
  80314e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803153:	eb 19                	jmp    80316e <write+0xd2>
  803155:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803159:	48 8b 40 18          	mov    0x18(%rax),%rax
  80315d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803161:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803165:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  803169:	48 89 cf             	mov    %rcx,%rdi
  80316c:	ff d0                	callq  *%rax
  80316e:	c9                   	leaveq 
  80316f:	c3                   	retq   

0000000000803170 <seek>:
  803170:	55                   	push   %rbp
  803171:	48 89 e5             	mov    %rsp,%rbp
  803174:	48 83 ec 18          	sub    $0x18,%rsp
  803178:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80317b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80317e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803182:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803185:	48 89 d6             	mov    %rdx,%rsi
  803188:	89 c7                	mov    %eax,%edi
  80318a:	48 b8 1c 2b 80 00 00 	movabs $0x802b1c,%rax
  803191:	00 00 00 
  803194:	ff d0                	callq  *%rax
  803196:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803199:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80319d:	79 05                	jns    8031a4 <seek+0x34>
  80319f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031a2:	eb 0f                	jmp    8031b3 <seek+0x43>
  8031a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031a8:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8031ab:	89 50 04             	mov    %edx,0x4(%rax)
  8031ae:	b8 00 00 00 00       	mov    $0x0,%eax
  8031b3:	c9                   	leaveq 
  8031b4:	c3                   	retq   

00000000008031b5 <ftruncate>:
  8031b5:	55                   	push   %rbp
  8031b6:	48 89 e5             	mov    %rsp,%rbp
  8031b9:	48 83 ec 30          	sub    $0x30,%rsp
  8031bd:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8031c0:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8031c3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8031c7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8031ca:	48 89 d6             	mov    %rdx,%rsi
  8031cd:	89 c7                	mov    %eax,%edi
  8031cf:	48 b8 1c 2b 80 00 00 	movabs $0x802b1c,%rax
  8031d6:	00 00 00 
  8031d9:	ff d0                	callq  *%rax
  8031db:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031de:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031e2:	78 24                	js     803208 <ftruncate+0x53>
  8031e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031e8:	8b 00                	mov    (%rax),%eax
  8031ea:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8031ee:	48 89 d6             	mov    %rdx,%rsi
  8031f1:	89 c7                	mov    %eax,%edi
  8031f3:	48 b8 77 2c 80 00 00 	movabs $0x802c77,%rax
  8031fa:	00 00 00 
  8031fd:	ff d0                	callq  *%rax
  8031ff:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803202:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803206:	79 05                	jns    80320d <ftruncate+0x58>
  803208:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80320b:	eb 72                	jmp    80327f <ftruncate+0xca>
  80320d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803211:	8b 40 08             	mov    0x8(%rax),%eax
  803214:	83 e0 03             	and    $0x3,%eax
  803217:	85 c0                	test   %eax,%eax
  803219:	75 3a                	jne    803255 <ftruncate+0xa0>
  80321b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803222:	00 00 00 
  803225:	48 8b 00             	mov    (%rax),%rax
  803228:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80322e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803231:	89 c6                	mov    %eax,%esi
  803233:	48 bf b8 55 80 00 00 	movabs $0x8055b8,%rdi
  80323a:	00 00 00 
  80323d:	b8 00 00 00 00       	mov    $0x0,%eax
  803242:	48 b9 3e 0f 80 00 00 	movabs $0x800f3e,%rcx
  803249:	00 00 00 
  80324c:	ff d1                	callq  *%rcx
  80324e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803253:	eb 2a                	jmp    80327f <ftruncate+0xca>
  803255:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803259:	48 8b 40 30          	mov    0x30(%rax),%rax
  80325d:	48 85 c0             	test   %rax,%rax
  803260:	75 07                	jne    803269 <ftruncate+0xb4>
  803262:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803267:	eb 16                	jmp    80327f <ftruncate+0xca>
  803269:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80326d:	48 8b 40 30          	mov    0x30(%rax),%rax
  803271:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803275:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  803278:	89 ce                	mov    %ecx,%esi
  80327a:	48 89 d7             	mov    %rdx,%rdi
  80327d:	ff d0                	callq  *%rax
  80327f:	c9                   	leaveq 
  803280:	c3                   	retq   

0000000000803281 <fstat>:
  803281:	55                   	push   %rbp
  803282:	48 89 e5             	mov    %rsp,%rbp
  803285:	48 83 ec 30          	sub    $0x30,%rsp
  803289:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80328c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803290:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803294:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803297:	48 89 d6             	mov    %rdx,%rsi
  80329a:	89 c7                	mov    %eax,%edi
  80329c:	48 b8 1c 2b 80 00 00 	movabs $0x802b1c,%rax
  8032a3:	00 00 00 
  8032a6:	ff d0                	callq  *%rax
  8032a8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032ab:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032af:	78 24                	js     8032d5 <fstat+0x54>
  8032b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032b5:	8b 00                	mov    (%rax),%eax
  8032b7:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8032bb:	48 89 d6             	mov    %rdx,%rsi
  8032be:	89 c7                	mov    %eax,%edi
  8032c0:	48 b8 77 2c 80 00 00 	movabs $0x802c77,%rax
  8032c7:	00 00 00 
  8032ca:	ff d0                	callq  *%rax
  8032cc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032cf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032d3:	79 05                	jns    8032da <fstat+0x59>
  8032d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032d8:	eb 5e                	jmp    803338 <fstat+0xb7>
  8032da:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032de:	48 8b 40 28          	mov    0x28(%rax),%rax
  8032e2:	48 85 c0             	test   %rax,%rax
  8032e5:	75 07                	jne    8032ee <fstat+0x6d>
  8032e7:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8032ec:	eb 4a                	jmp    803338 <fstat+0xb7>
  8032ee:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8032f2:	c6 00 00             	movb   $0x0,(%rax)
  8032f5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8032f9:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  803300:	00 00 00 
  803303:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803307:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80330e:	00 00 00 
  803311:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803315:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803319:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  803320:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803324:	48 8b 40 28          	mov    0x28(%rax),%rax
  803328:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80332c:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  803330:	48 89 ce             	mov    %rcx,%rsi
  803333:	48 89 d7             	mov    %rdx,%rdi
  803336:	ff d0                	callq  *%rax
  803338:	c9                   	leaveq 
  803339:	c3                   	retq   

000000000080333a <stat>:
  80333a:	55                   	push   %rbp
  80333b:	48 89 e5             	mov    %rsp,%rbp
  80333e:	48 83 ec 20          	sub    $0x20,%rsp
  803342:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803346:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80334a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80334e:	be 00 00 00 00       	mov    $0x0,%esi
  803353:	48 89 c7             	mov    %rax,%rdi
  803356:	48 b8 2a 34 80 00 00 	movabs $0x80342a,%rax
  80335d:	00 00 00 
  803360:	ff d0                	callq  *%rax
  803362:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803365:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803369:	79 05                	jns    803370 <stat+0x36>
  80336b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80336e:	eb 2f                	jmp    80339f <stat+0x65>
  803370:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803374:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803377:	48 89 d6             	mov    %rdx,%rsi
  80337a:	89 c7                	mov    %eax,%edi
  80337c:	48 b8 81 32 80 00 00 	movabs $0x803281,%rax
  803383:	00 00 00 
  803386:	ff d0                	callq  *%rax
  803388:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80338b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80338e:	89 c7                	mov    %eax,%edi
  803390:	48 b8 2e 2d 80 00 00 	movabs $0x802d2e,%rax
  803397:	00 00 00 
  80339a:	ff d0                	callq  *%rax
  80339c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80339f:	c9                   	leaveq 
  8033a0:	c3                   	retq   

00000000008033a1 <fsipc>:
  8033a1:	55                   	push   %rbp
  8033a2:	48 89 e5             	mov    %rsp,%rbp
  8033a5:	48 83 ec 10          	sub    $0x10,%rsp
  8033a9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8033ac:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8033b0:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8033b7:	00 00 00 
  8033ba:	8b 00                	mov    (%rax),%eax
  8033bc:	85 c0                	test   %eax,%eax
  8033be:	75 1f                	jne    8033df <fsipc+0x3e>
  8033c0:	bf 01 00 00 00       	mov    $0x1,%edi
  8033c5:	48 b8 c5 29 80 00 00 	movabs $0x8029c5,%rax
  8033cc:	00 00 00 
  8033cf:	ff d0                	callq  *%rax
  8033d1:	89 c2                	mov    %eax,%edx
  8033d3:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8033da:	00 00 00 
  8033dd:	89 10                	mov    %edx,(%rax)
  8033df:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8033e6:	00 00 00 
  8033e9:	8b 00                	mov    (%rax),%eax
  8033eb:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8033ee:	b9 07 00 00 00       	mov    $0x7,%ecx
  8033f3:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  8033fa:	00 00 00 
  8033fd:	89 c7                	mov    %eax,%edi
  8033ff:	48 b8 bb 28 80 00 00 	movabs $0x8028bb,%rax
  803406:	00 00 00 
  803409:	ff d0                	callq  *%rax
  80340b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80340f:	ba 00 00 00 00       	mov    $0x0,%edx
  803414:	48 89 c6             	mov    %rax,%rsi
  803417:	bf 00 00 00 00       	mov    $0x0,%edi
  80341c:	48 b8 fa 27 80 00 00 	movabs $0x8027fa,%rax
  803423:	00 00 00 
  803426:	ff d0                	callq  *%rax
  803428:	c9                   	leaveq 
  803429:	c3                   	retq   

000000000080342a <open>:
  80342a:	55                   	push   %rbp
  80342b:	48 89 e5             	mov    %rsp,%rbp
  80342e:	48 83 ec 20          	sub    $0x20,%rsp
  803432:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803436:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  803439:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80343d:	48 89 c7             	mov    %rax,%rdi
  803440:	48 b8 62 1a 80 00 00 	movabs $0x801a62,%rax
  803447:	00 00 00 
  80344a:	ff d0                	callq  *%rax
  80344c:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803451:	7e 0a                	jle    80345d <open+0x33>
  803453:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803458:	e9 a5 00 00 00       	jmpq   803502 <open+0xd8>
  80345d:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803461:	48 89 c7             	mov    %rax,%rdi
  803464:	48 b8 84 2a 80 00 00 	movabs $0x802a84,%rax
  80346b:	00 00 00 
  80346e:	ff d0                	callq  *%rax
  803470:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803473:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803477:	79 08                	jns    803481 <open+0x57>
  803479:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80347c:	e9 81 00 00 00       	jmpq   803502 <open+0xd8>
  803481:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803485:	48 89 c6             	mov    %rax,%rsi
  803488:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  80348f:	00 00 00 
  803492:	48 b8 ce 1a 80 00 00 	movabs $0x801ace,%rax
  803499:	00 00 00 
  80349c:	ff d0                	callq  *%rax
  80349e:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8034a5:	00 00 00 
  8034a8:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8034ab:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8034b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8034b5:	48 89 c6             	mov    %rax,%rsi
  8034b8:	bf 01 00 00 00       	mov    $0x1,%edi
  8034bd:	48 b8 a1 33 80 00 00 	movabs $0x8033a1,%rax
  8034c4:	00 00 00 
  8034c7:	ff d0                	callq  *%rax
  8034c9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034cc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034d0:	79 1d                	jns    8034ef <open+0xc5>
  8034d2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8034d6:	be 00 00 00 00       	mov    $0x0,%esi
  8034db:	48 89 c7             	mov    %rax,%rdi
  8034de:	48 b8 ac 2b 80 00 00 	movabs $0x802bac,%rax
  8034e5:	00 00 00 
  8034e8:	ff d0                	callq  *%rax
  8034ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034ed:	eb 13                	jmp    803502 <open+0xd8>
  8034ef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8034f3:	48 89 c7             	mov    %rax,%rdi
  8034f6:	48 b8 36 2a 80 00 00 	movabs $0x802a36,%rax
  8034fd:	00 00 00 
  803500:	ff d0                	callq  *%rax
  803502:	c9                   	leaveq 
  803503:	c3                   	retq   

0000000000803504 <devfile_flush>:
  803504:	55                   	push   %rbp
  803505:	48 89 e5             	mov    %rsp,%rbp
  803508:	48 83 ec 10          	sub    $0x10,%rsp
  80350c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803510:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803514:	8b 50 0c             	mov    0xc(%rax),%edx
  803517:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80351e:	00 00 00 
  803521:	89 10                	mov    %edx,(%rax)
  803523:	be 00 00 00 00       	mov    $0x0,%esi
  803528:	bf 06 00 00 00       	mov    $0x6,%edi
  80352d:	48 b8 a1 33 80 00 00 	movabs $0x8033a1,%rax
  803534:	00 00 00 
  803537:	ff d0                	callq  *%rax
  803539:	c9                   	leaveq 
  80353a:	c3                   	retq   

000000000080353b <devfile_read>:
  80353b:	55                   	push   %rbp
  80353c:	48 89 e5             	mov    %rsp,%rbp
  80353f:	48 83 ec 30          	sub    $0x30,%rsp
  803543:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803547:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80354b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80354f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803553:	8b 50 0c             	mov    0xc(%rax),%edx
  803556:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80355d:	00 00 00 
  803560:	89 10                	mov    %edx,(%rax)
  803562:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803569:	00 00 00 
  80356c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803570:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803574:	be 00 00 00 00       	mov    $0x0,%esi
  803579:	bf 03 00 00 00       	mov    $0x3,%edi
  80357e:	48 b8 a1 33 80 00 00 	movabs $0x8033a1,%rax
  803585:	00 00 00 
  803588:	ff d0                	callq  *%rax
  80358a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80358d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803591:	79 08                	jns    80359b <devfile_read+0x60>
  803593:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803596:	e9 a4 00 00 00       	jmpq   80363f <devfile_read+0x104>
  80359b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80359e:	48 98                	cltq   
  8035a0:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8035a4:	76 35                	jbe    8035db <devfile_read+0xa0>
  8035a6:	48 b9 de 55 80 00 00 	movabs $0x8055de,%rcx
  8035ad:	00 00 00 
  8035b0:	48 ba e5 55 80 00 00 	movabs $0x8055e5,%rdx
  8035b7:	00 00 00 
  8035ba:	be 89 00 00 00       	mov    $0x89,%esi
  8035bf:	48 bf fa 55 80 00 00 	movabs $0x8055fa,%rdi
  8035c6:	00 00 00 
  8035c9:	b8 00 00 00 00       	mov    $0x0,%eax
  8035ce:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  8035d5:	00 00 00 
  8035d8:	41 ff d0             	callq  *%r8
  8035db:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  8035e2:	7e 35                	jle    803619 <devfile_read+0xde>
  8035e4:	48 b9 08 56 80 00 00 	movabs $0x805608,%rcx
  8035eb:	00 00 00 
  8035ee:	48 ba e5 55 80 00 00 	movabs $0x8055e5,%rdx
  8035f5:	00 00 00 
  8035f8:	be 8a 00 00 00       	mov    $0x8a,%esi
  8035fd:	48 bf fa 55 80 00 00 	movabs $0x8055fa,%rdi
  803604:	00 00 00 
  803607:	b8 00 00 00 00       	mov    $0x0,%eax
  80360c:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  803613:	00 00 00 
  803616:	41 ff d0             	callq  *%r8
  803619:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80361c:	48 63 d0             	movslq %eax,%rdx
  80361f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803623:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  80362a:	00 00 00 
  80362d:	48 89 c7             	mov    %rax,%rdi
  803630:	48 b8 f3 1d 80 00 00 	movabs $0x801df3,%rax
  803637:	00 00 00 
  80363a:	ff d0                	callq  *%rax
  80363c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80363f:	c9                   	leaveq 
  803640:	c3                   	retq   

0000000000803641 <devfile_write>:
  803641:	55                   	push   %rbp
  803642:	48 89 e5             	mov    %rsp,%rbp
  803645:	48 83 ec 40          	sub    $0x40,%rsp
  803649:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80364d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803651:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803655:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803659:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80365d:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  803664:	00 
  803665:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803669:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  80366d:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  803672:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  803676:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80367a:	8b 50 0c             	mov    0xc(%rax),%edx
  80367d:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803684:	00 00 00 
  803687:	89 10                	mov    %edx,(%rax)
  803689:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803690:	00 00 00 
  803693:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803697:	48 89 50 08          	mov    %rdx,0x8(%rax)
  80369b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80369f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8036a3:	48 89 c6             	mov    %rax,%rsi
  8036a6:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  8036ad:	00 00 00 
  8036b0:	48 b8 f3 1d 80 00 00 	movabs $0x801df3,%rax
  8036b7:	00 00 00 
  8036ba:	ff d0                	callq  *%rax
  8036bc:	be 00 00 00 00       	mov    $0x0,%esi
  8036c1:	bf 04 00 00 00       	mov    $0x4,%edi
  8036c6:	48 b8 a1 33 80 00 00 	movabs $0x8033a1,%rax
  8036cd:	00 00 00 
  8036d0:	ff d0                	callq  *%rax
  8036d2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8036d5:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8036d9:	79 05                	jns    8036e0 <devfile_write+0x9f>
  8036db:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036de:	eb 43                	jmp    803723 <devfile_write+0xe2>
  8036e0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036e3:	48 98                	cltq   
  8036e5:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8036e9:	76 35                	jbe    803720 <devfile_write+0xdf>
  8036eb:	48 b9 de 55 80 00 00 	movabs $0x8055de,%rcx
  8036f2:	00 00 00 
  8036f5:	48 ba e5 55 80 00 00 	movabs $0x8055e5,%rdx
  8036fc:	00 00 00 
  8036ff:	be a8 00 00 00       	mov    $0xa8,%esi
  803704:	48 bf fa 55 80 00 00 	movabs $0x8055fa,%rdi
  80370b:	00 00 00 
  80370e:	b8 00 00 00 00       	mov    $0x0,%eax
  803713:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  80371a:	00 00 00 
  80371d:	41 ff d0             	callq  *%r8
  803720:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803723:	c9                   	leaveq 
  803724:	c3                   	retq   

0000000000803725 <devfile_stat>:
  803725:	55                   	push   %rbp
  803726:	48 89 e5             	mov    %rsp,%rbp
  803729:	48 83 ec 20          	sub    $0x20,%rsp
  80372d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803731:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803735:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803739:	8b 50 0c             	mov    0xc(%rax),%edx
  80373c:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803743:	00 00 00 
  803746:	89 10                	mov    %edx,(%rax)
  803748:	be 00 00 00 00       	mov    $0x0,%esi
  80374d:	bf 05 00 00 00       	mov    $0x5,%edi
  803752:	48 b8 a1 33 80 00 00 	movabs $0x8033a1,%rax
  803759:	00 00 00 
  80375c:	ff d0                	callq  *%rax
  80375e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803761:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803765:	79 05                	jns    80376c <devfile_stat+0x47>
  803767:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80376a:	eb 56                	jmp    8037c2 <devfile_stat+0x9d>
  80376c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803770:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  803777:	00 00 00 
  80377a:	48 89 c7             	mov    %rax,%rdi
  80377d:	48 b8 ce 1a 80 00 00 	movabs $0x801ace,%rax
  803784:	00 00 00 
  803787:	ff d0                	callq  *%rax
  803789:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803790:	00 00 00 
  803793:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803799:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80379d:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8037a3:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8037aa:	00 00 00 
  8037ad:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  8037b3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8037b7:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  8037bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8037c2:	c9                   	leaveq 
  8037c3:	c3                   	retq   

00000000008037c4 <devfile_trunc>:
  8037c4:	55                   	push   %rbp
  8037c5:	48 89 e5             	mov    %rsp,%rbp
  8037c8:	48 83 ec 10          	sub    $0x10,%rsp
  8037cc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8037d0:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8037d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037d7:	8b 50 0c             	mov    0xc(%rax),%edx
  8037da:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8037e1:	00 00 00 
  8037e4:	89 10                	mov    %edx,(%rax)
  8037e6:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8037ed:	00 00 00 
  8037f0:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8037f3:	89 50 04             	mov    %edx,0x4(%rax)
  8037f6:	be 00 00 00 00       	mov    $0x0,%esi
  8037fb:	bf 02 00 00 00       	mov    $0x2,%edi
  803800:	48 b8 a1 33 80 00 00 	movabs $0x8033a1,%rax
  803807:	00 00 00 
  80380a:	ff d0                	callq  *%rax
  80380c:	c9                   	leaveq 
  80380d:	c3                   	retq   

000000000080380e <remove>:
  80380e:	55                   	push   %rbp
  80380f:	48 89 e5             	mov    %rsp,%rbp
  803812:	48 83 ec 10          	sub    $0x10,%rsp
  803816:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80381a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80381e:	48 89 c7             	mov    %rax,%rdi
  803821:	48 b8 62 1a 80 00 00 	movabs $0x801a62,%rax
  803828:	00 00 00 
  80382b:	ff d0                	callq  *%rax
  80382d:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803832:	7e 07                	jle    80383b <remove+0x2d>
  803834:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803839:	eb 33                	jmp    80386e <remove+0x60>
  80383b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80383f:	48 89 c6             	mov    %rax,%rsi
  803842:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  803849:	00 00 00 
  80384c:	48 b8 ce 1a 80 00 00 	movabs $0x801ace,%rax
  803853:	00 00 00 
  803856:	ff d0                	callq  *%rax
  803858:	be 00 00 00 00       	mov    $0x0,%esi
  80385d:	bf 07 00 00 00       	mov    $0x7,%edi
  803862:	48 b8 a1 33 80 00 00 	movabs $0x8033a1,%rax
  803869:	00 00 00 
  80386c:	ff d0                	callq  *%rax
  80386e:	c9                   	leaveq 
  80386f:	c3                   	retq   

0000000000803870 <sync>:
  803870:	55                   	push   %rbp
  803871:	48 89 e5             	mov    %rsp,%rbp
  803874:	be 00 00 00 00       	mov    $0x0,%esi
  803879:	bf 08 00 00 00       	mov    $0x8,%edi
  80387e:	48 b8 a1 33 80 00 00 	movabs $0x8033a1,%rax
  803885:	00 00 00 
  803888:	ff d0                	callq  *%rax
  80388a:	5d                   	pop    %rbp
  80388b:	c3                   	retq   

000000000080388c <copy>:
  80388c:	55                   	push   %rbp
  80388d:	48 89 e5             	mov    %rsp,%rbp
  803890:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  803897:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  80389e:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  8038a5:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  8038ac:	be 00 00 00 00       	mov    $0x0,%esi
  8038b1:	48 89 c7             	mov    %rax,%rdi
  8038b4:	48 b8 2a 34 80 00 00 	movabs $0x80342a,%rax
  8038bb:	00 00 00 
  8038be:	ff d0                	callq  *%rax
  8038c0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038c3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038c7:	79 28                	jns    8038f1 <copy+0x65>
  8038c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038cc:	89 c6                	mov    %eax,%esi
  8038ce:	48 bf 14 56 80 00 00 	movabs $0x805614,%rdi
  8038d5:	00 00 00 
  8038d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8038dd:	48 ba 3e 0f 80 00 00 	movabs $0x800f3e,%rdx
  8038e4:	00 00 00 
  8038e7:	ff d2                	callq  *%rdx
  8038e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038ec:	e9 76 01 00 00       	jmpq   803a67 <copy+0x1db>
  8038f1:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  8038f8:	be 01 01 00 00       	mov    $0x101,%esi
  8038fd:	48 89 c7             	mov    %rax,%rdi
  803900:	48 b8 2a 34 80 00 00 	movabs $0x80342a,%rax
  803907:	00 00 00 
  80390a:	ff d0                	callq  *%rax
  80390c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80390f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803913:	0f 89 ad 00 00 00    	jns    8039c6 <copy+0x13a>
  803919:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80391c:	89 c6                	mov    %eax,%esi
  80391e:	48 bf 2a 56 80 00 00 	movabs $0x80562a,%rdi
  803925:	00 00 00 
  803928:	b8 00 00 00 00       	mov    $0x0,%eax
  80392d:	48 ba 3e 0f 80 00 00 	movabs $0x800f3e,%rdx
  803934:	00 00 00 
  803937:	ff d2                	callq  *%rdx
  803939:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80393c:	89 c7                	mov    %eax,%edi
  80393e:	48 b8 2e 2d 80 00 00 	movabs $0x802d2e,%rax
  803945:	00 00 00 
  803948:	ff d0                	callq  *%rax
  80394a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80394d:	e9 15 01 00 00       	jmpq   803a67 <copy+0x1db>
  803952:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803955:	48 63 d0             	movslq %eax,%rdx
  803958:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  80395f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803962:	48 89 ce             	mov    %rcx,%rsi
  803965:	89 c7                	mov    %eax,%edi
  803967:	48 b8 9c 30 80 00 00 	movabs $0x80309c,%rax
  80396e:	00 00 00 
  803971:	ff d0                	callq  *%rax
  803973:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803976:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80397a:	79 4a                	jns    8039c6 <copy+0x13a>
  80397c:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80397f:	89 c6                	mov    %eax,%esi
  803981:	48 bf 44 56 80 00 00 	movabs $0x805644,%rdi
  803988:	00 00 00 
  80398b:	b8 00 00 00 00       	mov    $0x0,%eax
  803990:	48 ba 3e 0f 80 00 00 	movabs $0x800f3e,%rdx
  803997:	00 00 00 
  80399a:	ff d2                	callq  *%rdx
  80399c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80399f:	89 c7                	mov    %eax,%edi
  8039a1:	48 b8 2e 2d 80 00 00 	movabs $0x802d2e,%rax
  8039a8:	00 00 00 
  8039ab:	ff d0                	callq  *%rax
  8039ad:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8039b0:	89 c7                	mov    %eax,%edi
  8039b2:	48 b8 2e 2d 80 00 00 	movabs $0x802d2e,%rax
  8039b9:	00 00 00 
  8039bc:	ff d0                	callq  *%rax
  8039be:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8039c1:	e9 a1 00 00 00       	jmpq   803a67 <copy+0x1db>
  8039c6:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8039cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039d0:	ba 00 02 00 00       	mov    $0x200,%edx
  8039d5:	48 89 ce             	mov    %rcx,%rsi
  8039d8:	89 c7                	mov    %eax,%edi
  8039da:	48 b8 51 2f 80 00 00 	movabs $0x802f51,%rax
  8039e1:	00 00 00 
  8039e4:	ff d0                	callq  *%rax
  8039e6:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8039e9:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8039ed:	0f 8f 5f ff ff ff    	jg     803952 <copy+0xc6>
  8039f3:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8039f7:	79 47                	jns    803a40 <copy+0x1b4>
  8039f9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8039fc:	89 c6                	mov    %eax,%esi
  8039fe:	48 bf 57 56 80 00 00 	movabs $0x805657,%rdi
  803a05:	00 00 00 
  803a08:	b8 00 00 00 00       	mov    $0x0,%eax
  803a0d:	48 ba 3e 0f 80 00 00 	movabs $0x800f3e,%rdx
  803a14:	00 00 00 
  803a17:	ff d2                	callq  *%rdx
  803a19:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a1c:	89 c7                	mov    %eax,%edi
  803a1e:	48 b8 2e 2d 80 00 00 	movabs $0x802d2e,%rax
  803a25:	00 00 00 
  803a28:	ff d0                	callq  *%rax
  803a2a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803a2d:	89 c7                	mov    %eax,%edi
  803a2f:	48 b8 2e 2d 80 00 00 	movabs $0x802d2e,%rax
  803a36:	00 00 00 
  803a39:	ff d0                	callq  *%rax
  803a3b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803a3e:	eb 27                	jmp    803a67 <copy+0x1db>
  803a40:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a43:	89 c7                	mov    %eax,%edi
  803a45:	48 b8 2e 2d 80 00 00 	movabs $0x802d2e,%rax
  803a4c:	00 00 00 
  803a4f:	ff d0                	callq  *%rax
  803a51:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803a54:	89 c7                	mov    %eax,%edi
  803a56:	48 b8 2e 2d 80 00 00 	movabs $0x802d2e,%rax
  803a5d:	00 00 00 
  803a60:	ff d0                	callq  *%rax
  803a62:	b8 00 00 00 00       	mov    $0x0,%eax
  803a67:	c9                   	leaveq 
  803a68:	c3                   	retq   

0000000000803a69 <fd2sockid>:
  803a69:	55                   	push   %rbp
  803a6a:	48 89 e5             	mov    %rsp,%rbp
  803a6d:	48 83 ec 20          	sub    $0x20,%rsp
  803a71:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a74:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803a78:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a7b:	48 89 d6             	mov    %rdx,%rsi
  803a7e:	89 c7                	mov    %eax,%edi
  803a80:	48 b8 1c 2b 80 00 00 	movabs $0x802b1c,%rax
  803a87:	00 00 00 
  803a8a:	ff d0                	callq  *%rax
  803a8c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a8f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a93:	79 05                	jns    803a9a <fd2sockid+0x31>
  803a95:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a98:	eb 24                	jmp    803abe <fd2sockid+0x55>
  803a9a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a9e:	8b 10                	mov    (%rax),%edx
  803aa0:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803aa7:	00 00 00 
  803aaa:	8b 00                	mov    (%rax),%eax
  803aac:	39 c2                	cmp    %eax,%edx
  803aae:	74 07                	je     803ab7 <fd2sockid+0x4e>
  803ab0:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803ab5:	eb 07                	jmp    803abe <fd2sockid+0x55>
  803ab7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803abb:	8b 40 0c             	mov    0xc(%rax),%eax
  803abe:	c9                   	leaveq 
  803abf:	c3                   	retq   

0000000000803ac0 <alloc_sockfd>:
  803ac0:	55                   	push   %rbp
  803ac1:	48 89 e5             	mov    %rsp,%rbp
  803ac4:	48 83 ec 20          	sub    $0x20,%rsp
  803ac8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803acb:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803acf:	48 89 c7             	mov    %rax,%rdi
  803ad2:	48 b8 84 2a 80 00 00 	movabs $0x802a84,%rax
  803ad9:	00 00 00 
  803adc:	ff d0                	callq  *%rax
  803ade:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ae1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ae5:	78 26                	js     803b0d <alloc_sockfd+0x4d>
  803ae7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803aeb:	ba 07 04 00 00       	mov    $0x407,%edx
  803af0:	48 89 c6             	mov    %rax,%rsi
  803af3:	bf 00 00 00 00       	mov    $0x0,%edi
  803af8:	48 b8 fe 23 80 00 00 	movabs $0x8023fe,%rax
  803aff:	00 00 00 
  803b02:	ff d0                	callq  *%rax
  803b04:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b07:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b0b:	79 16                	jns    803b23 <alloc_sockfd+0x63>
  803b0d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b10:	89 c7                	mov    %eax,%edi
  803b12:	48 b8 cf 3f 80 00 00 	movabs $0x803fcf,%rax
  803b19:	00 00 00 
  803b1c:	ff d0                	callq  *%rax
  803b1e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b21:	eb 3a                	jmp    803b5d <alloc_sockfd+0x9d>
  803b23:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b27:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  803b2e:	00 00 00 
  803b31:	8b 12                	mov    (%rdx),%edx
  803b33:	89 10                	mov    %edx,(%rax)
  803b35:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b39:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803b40:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b44:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803b47:	89 50 0c             	mov    %edx,0xc(%rax)
  803b4a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b4e:	48 89 c7             	mov    %rax,%rdi
  803b51:	48 b8 36 2a 80 00 00 	movabs $0x802a36,%rax
  803b58:	00 00 00 
  803b5b:	ff d0                	callq  *%rax
  803b5d:	c9                   	leaveq 
  803b5e:	c3                   	retq   

0000000000803b5f <accept>:
  803b5f:	55                   	push   %rbp
  803b60:	48 89 e5             	mov    %rsp,%rbp
  803b63:	48 83 ec 30          	sub    $0x30,%rsp
  803b67:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b6a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b6e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803b72:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b75:	89 c7                	mov    %eax,%edi
  803b77:	48 b8 69 3a 80 00 00 	movabs $0x803a69,%rax
  803b7e:	00 00 00 
  803b81:	ff d0                	callq  *%rax
  803b83:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b86:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b8a:	79 05                	jns    803b91 <accept+0x32>
  803b8c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b8f:	eb 3b                	jmp    803bcc <accept+0x6d>
  803b91:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803b95:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803b99:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b9c:	48 89 ce             	mov    %rcx,%rsi
  803b9f:	89 c7                	mov    %eax,%edi
  803ba1:	48 b8 ac 3e 80 00 00 	movabs $0x803eac,%rax
  803ba8:	00 00 00 
  803bab:	ff d0                	callq  *%rax
  803bad:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bb0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bb4:	79 05                	jns    803bbb <accept+0x5c>
  803bb6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bb9:	eb 11                	jmp    803bcc <accept+0x6d>
  803bbb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bbe:	89 c7                	mov    %eax,%edi
  803bc0:	48 b8 c0 3a 80 00 00 	movabs $0x803ac0,%rax
  803bc7:	00 00 00 
  803bca:	ff d0                	callq  *%rax
  803bcc:	c9                   	leaveq 
  803bcd:	c3                   	retq   

0000000000803bce <bind>:
  803bce:	55                   	push   %rbp
  803bcf:	48 89 e5             	mov    %rsp,%rbp
  803bd2:	48 83 ec 20          	sub    $0x20,%rsp
  803bd6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803bd9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803bdd:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803be0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803be3:	89 c7                	mov    %eax,%edi
  803be5:	48 b8 69 3a 80 00 00 	movabs $0x803a69,%rax
  803bec:	00 00 00 
  803bef:	ff d0                	callq  *%rax
  803bf1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bf4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bf8:	79 05                	jns    803bff <bind+0x31>
  803bfa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bfd:	eb 1b                	jmp    803c1a <bind+0x4c>
  803bff:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803c02:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803c06:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c09:	48 89 ce             	mov    %rcx,%rsi
  803c0c:	89 c7                	mov    %eax,%edi
  803c0e:	48 b8 2b 3f 80 00 00 	movabs $0x803f2b,%rax
  803c15:	00 00 00 
  803c18:	ff d0                	callq  *%rax
  803c1a:	c9                   	leaveq 
  803c1b:	c3                   	retq   

0000000000803c1c <shutdown>:
  803c1c:	55                   	push   %rbp
  803c1d:	48 89 e5             	mov    %rsp,%rbp
  803c20:	48 83 ec 20          	sub    $0x20,%rsp
  803c24:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c27:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803c2a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c2d:	89 c7                	mov    %eax,%edi
  803c2f:	48 b8 69 3a 80 00 00 	movabs $0x803a69,%rax
  803c36:	00 00 00 
  803c39:	ff d0                	callq  *%rax
  803c3b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c3e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c42:	79 05                	jns    803c49 <shutdown+0x2d>
  803c44:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c47:	eb 16                	jmp    803c5f <shutdown+0x43>
  803c49:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803c4c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c4f:	89 d6                	mov    %edx,%esi
  803c51:	89 c7                	mov    %eax,%edi
  803c53:	48 b8 8f 3f 80 00 00 	movabs $0x803f8f,%rax
  803c5a:	00 00 00 
  803c5d:	ff d0                	callq  *%rax
  803c5f:	c9                   	leaveq 
  803c60:	c3                   	retq   

0000000000803c61 <devsock_close>:
  803c61:	55                   	push   %rbp
  803c62:	48 89 e5             	mov    %rsp,%rbp
  803c65:	48 83 ec 10          	sub    $0x10,%rsp
  803c69:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803c6d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c71:	48 89 c7             	mov    %rax,%rdi
  803c74:	48 b8 e4 4a 80 00 00 	movabs $0x804ae4,%rax
  803c7b:	00 00 00 
  803c7e:	ff d0                	callq  *%rax
  803c80:	83 f8 01             	cmp    $0x1,%eax
  803c83:	75 17                	jne    803c9c <devsock_close+0x3b>
  803c85:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c89:	8b 40 0c             	mov    0xc(%rax),%eax
  803c8c:	89 c7                	mov    %eax,%edi
  803c8e:	48 b8 cf 3f 80 00 00 	movabs $0x803fcf,%rax
  803c95:	00 00 00 
  803c98:	ff d0                	callq  *%rax
  803c9a:	eb 05                	jmp    803ca1 <devsock_close+0x40>
  803c9c:	b8 00 00 00 00       	mov    $0x0,%eax
  803ca1:	c9                   	leaveq 
  803ca2:	c3                   	retq   

0000000000803ca3 <connect>:
  803ca3:	55                   	push   %rbp
  803ca4:	48 89 e5             	mov    %rsp,%rbp
  803ca7:	48 83 ec 20          	sub    $0x20,%rsp
  803cab:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803cae:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803cb2:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803cb5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cb8:	89 c7                	mov    %eax,%edi
  803cba:	48 b8 69 3a 80 00 00 	movabs $0x803a69,%rax
  803cc1:	00 00 00 
  803cc4:	ff d0                	callq  *%rax
  803cc6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803cc9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ccd:	79 05                	jns    803cd4 <connect+0x31>
  803ccf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cd2:	eb 1b                	jmp    803cef <connect+0x4c>
  803cd4:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803cd7:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803cdb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cde:	48 89 ce             	mov    %rcx,%rsi
  803ce1:	89 c7                	mov    %eax,%edi
  803ce3:	48 b8 fc 3f 80 00 00 	movabs $0x803ffc,%rax
  803cea:	00 00 00 
  803ced:	ff d0                	callq  *%rax
  803cef:	c9                   	leaveq 
  803cf0:	c3                   	retq   

0000000000803cf1 <listen>:
  803cf1:	55                   	push   %rbp
  803cf2:	48 89 e5             	mov    %rsp,%rbp
  803cf5:	48 83 ec 20          	sub    $0x20,%rsp
  803cf9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803cfc:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803cff:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d02:	89 c7                	mov    %eax,%edi
  803d04:	48 b8 69 3a 80 00 00 	movabs $0x803a69,%rax
  803d0b:	00 00 00 
  803d0e:	ff d0                	callq  *%rax
  803d10:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d13:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d17:	79 05                	jns    803d1e <listen+0x2d>
  803d19:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d1c:	eb 16                	jmp    803d34 <listen+0x43>
  803d1e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803d21:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d24:	89 d6                	mov    %edx,%esi
  803d26:	89 c7                	mov    %eax,%edi
  803d28:	48 b8 60 40 80 00 00 	movabs $0x804060,%rax
  803d2f:	00 00 00 
  803d32:	ff d0                	callq  *%rax
  803d34:	c9                   	leaveq 
  803d35:	c3                   	retq   

0000000000803d36 <devsock_read>:
  803d36:	55                   	push   %rbp
  803d37:	48 89 e5             	mov    %rsp,%rbp
  803d3a:	48 83 ec 20          	sub    $0x20,%rsp
  803d3e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803d42:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803d46:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803d4a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d4e:	89 c2                	mov    %eax,%edx
  803d50:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d54:	8b 40 0c             	mov    0xc(%rax),%eax
  803d57:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803d5b:	b9 00 00 00 00       	mov    $0x0,%ecx
  803d60:	89 c7                	mov    %eax,%edi
  803d62:	48 b8 a0 40 80 00 00 	movabs $0x8040a0,%rax
  803d69:	00 00 00 
  803d6c:	ff d0                	callq  *%rax
  803d6e:	c9                   	leaveq 
  803d6f:	c3                   	retq   

0000000000803d70 <devsock_write>:
  803d70:	55                   	push   %rbp
  803d71:	48 89 e5             	mov    %rsp,%rbp
  803d74:	48 83 ec 20          	sub    $0x20,%rsp
  803d78:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803d7c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803d80:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803d84:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d88:	89 c2                	mov    %eax,%edx
  803d8a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d8e:	8b 40 0c             	mov    0xc(%rax),%eax
  803d91:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803d95:	b9 00 00 00 00       	mov    $0x0,%ecx
  803d9a:	89 c7                	mov    %eax,%edi
  803d9c:	48 b8 6c 41 80 00 00 	movabs $0x80416c,%rax
  803da3:	00 00 00 
  803da6:	ff d0                	callq  *%rax
  803da8:	c9                   	leaveq 
  803da9:	c3                   	retq   

0000000000803daa <devsock_stat>:
  803daa:	55                   	push   %rbp
  803dab:	48 89 e5             	mov    %rsp,%rbp
  803dae:	48 83 ec 10          	sub    $0x10,%rsp
  803db2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803db6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803dba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dbe:	48 be 72 56 80 00 00 	movabs $0x805672,%rsi
  803dc5:	00 00 00 
  803dc8:	48 89 c7             	mov    %rax,%rdi
  803dcb:	48 b8 ce 1a 80 00 00 	movabs $0x801ace,%rax
  803dd2:	00 00 00 
  803dd5:	ff d0                	callq  *%rax
  803dd7:	b8 00 00 00 00       	mov    $0x0,%eax
  803ddc:	c9                   	leaveq 
  803ddd:	c3                   	retq   

0000000000803dde <socket>:
  803dde:	55                   	push   %rbp
  803ddf:	48 89 e5             	mov    %rsp,%rbp
  803de2:	48 83 ec 20          	sub    $0x20,%rsp
  803de6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803de9:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803dec:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803def:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803df2:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803df5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803df8:	89 ce                	mov    %ecx,%esi
  803dfa:	89 c7                	mov    %eax,%edi
  803dfc:	48 b8 24 42 80 00 00 	movabs $0x804224,%rax
  803e03:	00 00 00 
  803e06:	ff d0                	callq  *%rax
  803e08:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e0b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e0f:	79 05                	jns    803e16 <socket+0x38>
  803e11:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e14:	eb 11                	jmp    803e27 <socket+0x49>
  803e16:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e19:	89 c7                	mov    %eax,%edi
  803e1b:	48 b8 c0 3a 80 00 00 	movabs $0x803ac0,%rax
  803e22:	00 00 00 
  803e25:	ff d0                	callq  *%rax
  803e27:	c9                   	leaveq 
  803e28:	c3                   	retq   

0000000000803e29 <nsipc>:
  803e29:	55                   	push   %rbp
  803e2a:	48 89 e5             	mov    %rsp,%rbp
  803e2d:	48 83 ec 10          	sub    $0x10,%rsp
  803e31:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e34:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803e3b:	00 00 00 
  803e3e:	8b 00                	mov    (%rax),%eax
  803e40:	85 c0                	test   %eax,%eax
  803e42:	75 1f                	jne    803e63 <nsipc+0x3a>
  803e44:	bf 02 00 00 00       	mov    $0x2,%edi
  803e49:	48 b8 c5 29 80 00 00 	movabs $0x8029c5,%rax
  803e50:	00 00 00 
  803e53:	ff d0                	callq  *%rax
  803e55:	89 c2                	mov    %eax,%edx
  803e57:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803e5e:	00 00 00 
  803e61:	89 10                	mov    %edx,(%rax)
  803e63:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803e6a:	00 00 00 
  803e6d:	8b 00                	mov    (%rax),%eax
  803e6f:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803e72:	b9 07 00 00 00       	mov    $0x7,%ecx
  803e77:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803e7e:	00 00 00 
  803e81:	89 c7                	mov    %eax,%edi
  803e83:	48 b8 bb 28 80 00 00 	movabs $0x8028bb,%rax
  803e8a:	00 00 00 
  803e8d:	ff d0                	callq  *%rax
  803e8f:	ba 00 00 00 00       	mov    $0x0,%edx
  803e94:	be 00 00 00 00       	mov    $0x0,%esi
  803e99:	bf 00 00 00 00       	mov    $0x0,%edi
  803e9e:	48 b8 fa 27 80 00 00 	movabs $0x8027fa,%rax
  803ea5:	00 00 00 
  803ea8:	ff d0                	callq  *%rax
  803eaa:	c9                   	leaveq 
  803eab:	c3                   	retq   

0000000000803eac <nsipc_accept>:
  803eac:	55                   	push   %rbp
  803ead:	48 89 e5             	mov    %rsp,%rbp
  803eb0:	48 83 ec 30          	sub    $0x30,%rsp
  803eb4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803eb7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803ebb:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803ebf:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ec6:	00 00 00 
  803ec9:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803ecc:	89 10                	mov    %edx,(%rax)
  803ece:	bf 01 00 00 00       	mov    $0x1,%edi
  803ed3:	48 b8 29 3e 80 00 00 	movabs $0x803e29,%rax
  803eda:	00 00 00 
  803edd:	ff d0                	callq  *%rax
  803edf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ee2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ee6:	78 3e                	js     803f26 <nsipc_accept+0x7a>
  803ee8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803eef:	00 00 00 
  803ef2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803ef6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803efa:	8b 40 10             	mov    0x10(%rax),%eax
  803efd:	89 c2                	mov    %eax,%edx
  803eff:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803f03:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f07:	48 89 ce             	mov    %rcx,%rsi
  803f0a:	48 89 c7             	mov    %rax,%rdi
  803f0d:	48 b8 f3 1d 80 00 00 	movabs $0x801df3,%rax
  803f14:	00 00 00 
  803f17:	ff d0                	callq  *%rax
  803f19:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f1d:	8b 50 10             	mov    0x10(%rax),%edx
  803f20:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f24:	89 10                	mov    %edx,(%rax)
  803f26:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f29:	c9                   	leaveq 
  803f2a:	c3                   	retq   

0000000000803f2b <nsipc_bind>:
  803f2b:	55                   	push   %rbp
  803f2c:	48 89 e5             	mov    %rsp,%rbp
  803f2f:	48 83 ec 10          	sub    $0x10,%rsp
  803f33:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f36:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803f3a:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803f3d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f44:	00 00 00 
  803f47:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803f4a:	89 10                	mov    %edx,(%rax)
  803f4c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f4f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f53:	48 89 c6             	mov    %rax,%rsi
  803f56:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803f5d:	00 00 00 
  803f60:	48 b8 f3 1d 80 00 00 	movabs $0x801df3,%rax
  803f67:	00 00 00 
  803f6a:	ff d0                	callq  *%rax
  803f6c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f73:	00 00 00 
  803f76:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f79:	89 50 14             	mov    %edx,0x14(%rax)
  803f7c:	bf 02 00 00 00       	mov    $0x2,%edi
  803f81:	48 b8 29 3e 80 00 00 	movabs $0x803e29,%rax
  803f88:	00 00 00 
  803f8b:	ff d0                	callq  *%rax
  803f8d:	c9                   	leaveq 
  803f8e:	c3                   	retq   

0000000000803f8f <nsipc_shutdown>:
  803f8f:	55                   	push   %rbp
  803f90:	48 89 e5             	mov    %rsp,%rbp
  803f93:	48 83 ec 10          	sub    $0x10,%rsp
  803f97:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f9a:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803f9d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fa4:	00 00 00 
  803fa7:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803faa:	89 10                	mov    %edx,(%rax)
  803fac:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fb3:	00 00 00 
  803fb6:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803fb9:	89 50 04             	mov    %edx,0x4(%rax)
  803fbc:	bf 03 00 00 00       	mov    $0x3,%edi
  803fc1:	48 b8 29 3e 80 00 00 	movabs $0x803e29,%rax
  803fc8:	00 00 00 
  803fcb:	ff d0                	callq  *%rax
  803fcd:	c9                   	leaveq 
  803fce:	c3                   	retq   

0000000000803fcf <nsipc_close>:
  803fcf:	55                   	push   %rbp
  803fd0:	48 89 e5             	mov    %rsp,%rbp
  803fd3:	48 83 ec 10          	sub    $0x10,%rsp
  803fd7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803fda:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fe1:	00 00 00 
  803fe4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803fe7:	89 10                	mov    %edx,(%rax)
  803fe9:	bf 04 00 00 00       	mov    $0x4,%edi
  803fee:	48 b8 29 3e 80 00 00 	movabs $0x803e29,%rax
  803ff5:	00 00 00 
  803ff8:	ff d0                	callq  *%rax
  803ffa:	c9                   	leaveq 
  803ffb:	c3                   	retq   

0000000000803ffc <nsipc_connect>:
  803ffc:	55                   	push   %rbp
  803ffd:	48 89 e5             	mov    %rsp,%rbp
  804000:	48 83 ec 10          	sub    $0x10,%rsp
  804004:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804007:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80400b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80400e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804015:	00 00 00 
  804018:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80401b:	89 10                	mov    %edx,(%rax)
  80401d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804020:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804024:	48 89 c6             	mov    %rax,%rsi
  804027:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  80402e:	00 00 00 
  804031:	48 b8 f3 1d 80 00 00 	movabs $0x801df3,%rax
  804038:	00 00 00 
  80403b:	ff d0                	callq  *%rax
  80403d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804044:	00 00 00 
  804047:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80404a:	89 50 14             	mov    %edx,0x14(%rax)
  80404d:	bf 05 00 00 00       	mov    $0x5,%edi
  804052:	48 b8 29 3e 80 00 00 	movabs $0x803e29,%rax
  804059:	00 00 00 
  80405c:	ff d0                	callq  *%rax
  80405e:	c9                   	leaveq 
  80405f:	c3                   	retq   

0000000000804060 <nsipc_listen>:
  804060:	55                   	push   %rbp
  804061:	48 89 e5             	mov    %rsp,%rbp
  804064:	48 83 ec 10          	sub    $0x10,%rsp
  804068:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80406b:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80406e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804075:	00 00 00 
  804078:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80407b:	89 10                	mov    %edx,(%rax)
  80407d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804084:	00 00 00 
  804087:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80408a:	89 50 04             	mov    %edx,0x4(%rax)
  80408d:	bf 06 00 00 00       	mov    $0x6,%edi
  804092:	48 b8 29 3e 80 00 00 	movabs $0x803e29,%rax
  804099:	00 00 00 
  80409c:	ff d0                	callq  *%rax
  80409e:	c9                   	leaveq 
  80409f:	c3                   	retq   

00000000008040a0 <nsipc_recv>:
  8040a0:	55                   	push   %rbp
  8040a1:	48 89 e5             	mov    %rsp,%rbp
  8040a4:	48 83 ec 30          	sub    $0x30,%rsp
  8040a8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8040ab:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8040af:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8040b2:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8040b5:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040bc:	00 00 00 
  8040bf:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8040c2:	89 10                	mov    %edx,(%rax)
  8040c4:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040cb:	00 00 00 
  8040ce:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8040d1:	89 50 04             	mov    %edx,0x4(%rax)
  8040d4:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040db:	00 00 00 
  8040de:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8040e1:	89 50 08             	mov    %edx,0x8(%rax)
  8040e4:	bf 07 00 00 00       	mov    $0x7,%edi
  8040e9:	48 b8 29 3e 80 00 00 	movabs $0x803e29,%rax
  8040f0:	00 00 00 
  8040f3:	ff d0                	callq  *%rax
  8040f5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040f8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040fc:	78 69                	js     804167 <nsipc_recv+0xc7>
  8040fe:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  804105:	7f 08                	jg     80410f <nsipc_recv+0x6f>
  804107:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80410a:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  80410d:	7e 35                	jle    804144 <nsipc_recv+0xa4>
  80410f:	48 b9 79 56 80 00 00 	movabs $0x805679,%rcx
  804116:	00 00 00 
  804119:	48 ba 8e 56 80 00 00 	movabs $0x80568e,%rdx
  804120:	00 00 00 
  804123:	be 62 00 00 00       	mov    $0x62,%esi
  804128:	48 bf a3 56 80 00 00 	movabs $0x8056a3,%rdi
  80412f:	00 00 00 
  804132:	b8 00 00 00 00       	mov    $0x0,%eax
  804137:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  80413e:	00 00 00 
  804141:	41 ff d0             	callq  *%r8
  804144:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804147:	48 63 d0             	movslq %eax,%rdx
  80414a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80414e:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  804155:	00 00 00 
  804158:	48 89 c7             	mov    %rax,%rdi
  80415b:	48 b8 f3 1d 80 00 00 	movabs $0x801df3,%rax
  804162:	00 00 00 
  804165:	ff d0                	callq  *%rax
  804167:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80416a:	c9                   	leaveq 
  80416b:	c3                   	retq   

000000000080416c <nsipc_send>:
  80416c:	55                   	push   %rbp
  80416d:	48 89 e5             	mov    %rsp,%rbp
  804170:	48 83 ec 20          	sub    $0x20,%rsp
  804174:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804177:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80417b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80417e:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804181:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804188:	00 00 00 
  80418b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80418e:	89 10                	mov    %edx,(%rax)
  804190:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  804197:	7e 35                	jle    8041ce <nsipc_send+0x62>
  804199:	48 b9 b2 56 80 00 00 	movabs $0x8056b2,%rcx
  8041a0:	00 00 00 
  8041a3:	48 ba 8e 56 80 00 00 	movabs $0x80568e,%rdx
  8041aa:	00 00 00 
  8041ad:	be 6d 00 00 00       	mov    $0x6d,%esi
  8041b2:	48 bf a3 56 80 00 00 	movabs $0x8056a3,%rdi
  8041b9:	00 00 00 
  8041bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8041c1:	49 b8 04 0d 80 00 00 	movabs $0x800d04,%r8
  8041c8:	00 00 00 
  8041cb:	41 ff d0             	callq  *%r8
  8041ce:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8041d1:	48 63 d0             	movslq %eax,%rdx
  8041d4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041d8:	48 89 c6             	mov    %rax,%rsi
  8041db:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  8041e2:	00 00 00 
  8041e5:	48 b8 f3 1d 80 00 00 	movabs $0x801df3,%rax
  8041ec:	00 00 00 
  8041ef:	ff d0                	callq  *%rax
  8041f1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8041f8:	00 00 00 
  8041fb:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8041fe:	89 50 04             	mov    %edx,0x4(%rax)
  804201:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804208:	00 00 00 
  80420b:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80420e:	89 50 08             	mov    %edx,0x8(%rax)
  804211:	bf 08 00 00 00       	mov    $0x8,%edi
  804216:	48 b8 29 3e 80 00 00 	movabs $0x803e29,%rax
  80421d:	00 00 00 
  804220:	ff d0                	callq  *%rax
  804222:	c9                   	leaveq 
  804223:	c3                   	retq   

0000000000804224 <nsipc_socket>:
  804224:	55                   	push   %rbp
  804225:	48 89 e5             	mov    %rsp,%rbp
  804228:	48 83 ec 10          	sub    $0x10,%rsp
  80422c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80422f:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804232:	89 55 f4             	mov    %edx,-0xc(%rbp)
  804235:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80423c:	00 00 00 
  80423f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804242:	89 10                	mov    %edx,(%rax)
  804244:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80424b:	00 00 00 
  80424e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804251:	89 50 04             	mov    %edx,0x4(%rax)
  804254:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80425b:	00 00 00 
  80425e:	8b 55 f4             	mov    -0xc(%rbp),%edx
  804261:	89 50 08             	mov    %edx,0x8(%rax)
  804264:	bf 09 00 00 00       	mov    $0x9,%edi
  804269:	48 b8 29 3e 80 00 00 	movabs $0x803e29,%rax
  804270:	00 00 00 
  804273:	ff d0                	callq  *%rax
  804275:	c9                   	leaveq 
  804276:	c3                   	retq   

0000000000804277 <pipe>:
  804277:	55                   	push   %rbp
  804278:	48 89 e5             	mov    %rsp,%rbp
  80427b:	53                   	push   %rbx
  80427c:	48 83 ec 38          	sub    $0x38,%rsp
  804280:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  804284:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  804288:	48 89 c7             	mov    %rax,%rdi
  80428b:	48 b8 84 2a 80 00 00 	movabs $0x802a84,%rax
  804292:	00 00 00 
  804295:	ff d0                	callq  *%rax
  804297:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80429a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80429e:	0f 88 bf 01 00 00    	js     804463 <pipe+0x1ec>
  8042a4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042a8:	ba 07 04 00 00       	mov    $0x407,%edx
  8042ad:	48 89 c6             	mov    %rax,%rsi
  8042b0:	bf 00 00 00 00       	mov    $0x0,%edi
  8042b5:	48 b8 fe 23 80 00 00 	movabs $0x8023fe,%rax
  8042bc:	00 00 00 
  8042bf:	ff d0                	callq  *%rax
  8042c1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8042c4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8042c8:	0f 88 95 01 00 00    	js     804463 <pipe+0x1ec>
  8042ce:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8042d2:	48 89 c7             	mov    %rax,%rdi
  8042d5:	48 b8 84 2a 80 00 00 	movabs $0x802a84,%rax
  8042dc:	00 00 00 
  8042df:	ff d0                	callq  *%rax
  8042e1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8042e4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8042e8:	0f 88 5d 01 00 00    	js     80444b <pipe+0x1d4>
  8042ee:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042f2:	ba 07 04 00 00       	mov    $0x407,%edx
  8042f7:	48 89 c6             	mov    %rax,%rsi
  8042fa:	bf 00 00 00 00       	mov    $0x0,%edi
  8042ff:	48 b8 fe 23 80 00 00 	movabs $0x8023fe,%rax
  804306:	00 00 00 
  804309:	ff d0                	callq  *%rax
  80430b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80430e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804312:	0f 88 33 01 00 00    	js     80444b <pipe+0x1d4>
  804318:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80431c:	48 89 c7             	mov    %rax,%rdi
  80431f:	48 b8 59 2a 80 00 00 	movabs $0x802a59,%rax
  804326:	00 00 00 
  804329:	ff d0                	callq  *%rax
  80432b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80432f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804333:	ba 07 04 00 00       	mov    $0x407,%edx
  804338:	48 89 c6             	mov    %rax,%rsi
  80433b:	bf 00 00 00 00       	mov    $0x0,%edi
  804340:	48 b8 fe 23 80 00 00 	movabs $0x8023fe,%rax
  804347:	00 00 00 
  80434a:	ff d0                	callq  *%rax
  80434c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80434f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804353:	0f 88 d9 00 00 00    	js     804432 <pipe+0x1bb>
  804359:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80435d:	48 89 c7             	mov    %rax,%rdi
  804360:	48 b8 59 2a 80 00 00 	movabs $0x802a59,%rax
  804367:	00 00 00 
  80436a:	ff d0                	callq  *%rax
  80436c:	48 89 c2             	mov    %rax,%rdx
  80436f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804373:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  804379:	48 89 d1             	mov    %rdx,%rcx
  80437c:	ba 00 00 00 00       	mov    $0x0,%edx
  804381:	48 89 c6             	mov    %rax,%rsi
  804384:	bf 00 00 00 00       	mov    $0x0,%edi
  804389:	48 b8 50 24 80 00 00 	movabs $0x802450,%rax
  804390:	00 00 00 
  804393:	ff d0                	callq  *%rax
  804395:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804398:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80439c:	78 79                	js     804417 <pipe+0x1a0>
  80439e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043a2:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  8043a9:	00 00 00 
  8043ac:	8b 12                	mov    (%rdx),%edx
  8043ae:	89 10                	mov    %edx,(%rax)
  8043b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043b4:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  8043bb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8043bf:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  8043c6:	00 00 00 
  8043c9:	8b 12                	mov    (%rdx),%edx
  8043cb:	89 10                	mov    %edx,(%rax)
  8043cd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8043d1:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  8043d8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043dc:	48 89 c7             	mov    %rax,%rdi
  8043df:	48 b8 36 2a 80 00 00 	movabs $0x802a36,%rax
  8043e6:	00 00 00 
  8043e9:	ff d0                	callq  *%rax
  8043eb:	89 c2                	mov    %eax,%edx
  8043ed:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8043f1:	89 10                	mov    %edx,(%rax)
  8043f3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8043f7:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8043fb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8043ff:	48 89 c7             	mov    %rax,%rdi
  804402:	48 b8 36 2a 80 00 00 	movabs $0x802a36,%rax
  804409:	00 00 00 
  80440c:	ff d0                	callq  *%rax
  80440e:	89 03                	mov    %eax,(%rbx)
  804410:	b8 00 00 00 00       	mov    $0x0,%eax
  804415:	eb 4f                	jmp    804466 <pipe+0x1ef>
  804417:	90                   	nop
  804418:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80441c:	48 89 c6             	mov    %rax,%rsi
  80441f:	bf 00 00 00 00       	mov    $0x0,%edi
  804424:	48 b8 b0 24 80 00 00 	movabs $0x8024b0,%rax
  80442b:	00 00 00 
  80442e:	ff d0                	callq  *%rax
  804430:	eb 01                	jmp    804433 <pipe+0x1bc>
  804432:	90                   	nop
  804433:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804437:	48 89 c6             	mov    %rax,%rsi
  80443a:	bf 00 00 00 00       	mov    $0x0,%edi
  80443f:	48 b8 b0 24 80 00 00 	movabs $0x8024b0,%rax
  804446:	00 00 00 
  804449:	ff d0                	callq  *%rax
  80444b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80444f:	48 89 c6             	mov    %rax,%rsi
  804452:	bf 00 00 00 00       	mov    $0x0,%edi
  804457:	48 b8 b0 24 80 00 00 	movabs $0x8024b0,%rax
  80445e:	00 00 00 
  804461:	ff d0                	callq  *%rax
  804463:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804466:	48 83 c4 38          	add    $0x38,%rsp
  80446a:	5b                   	pop    %rbx
  80446b:	5d                   	pop    %rbp
  80446c:	c3                   	retq   

000000000080446d <_pipeisclosed>:
  80446d:	55                   	push   %rbp
  80446e:	48 89 e5             	mov    %rsp,%rbp
  804471:	53                   	push   %rbx
  804472:	48 83 ec 28          	sub    $0x28,%rsp
  804476:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80447a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80447e:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804485:	00 00 00 
  804488:	48 8b 00             	mov    (%rax),%rax
  80448b:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  804491:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804494:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804498:	48 89 c7             	mov    %rax,%rdi
  80449b:	48 b8 e4 4a 80 00 00 	movabs $0x804ae4,%rax
  8044a2:	00 00 00 
  8044a5:	ff d0                	callq  *%rax
  8044a7:	89 c3                	mov    %eax,%ebx
  8044a9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8044ad:	48 89 c7             	mov    %rax,%rdi
  8044b0:	48 b8 e4 4a 80 00 00 	movabs $0x804ae4,%rax
  8044b7:	00 00 00 
  8044ba:	ff d0                	callq  *%rax
  8044bc:	39 c3                	cmp    %eax,%ebx
  8044be:	0f 94 c0             	sete   %al
  8044c1:	0f b6 c0             	movzbl %al,%eax
  8044c4:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8044c7:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8044ce:	00 00 00 
  8044d1:	48 8b 00             	mov    (%rax),%rax
  8044d4:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  8044da:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8044dd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8044e0:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8044e3:	75 05                	jne    8044ea <_pipeisclosed+0x7d>
  8044e5:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8044e8:	eb 4a                	jmp    804534 <_pipeisclosed+0xc7>
  8044ea:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8044ed:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8044f0:	74 8c                	je     80447e <_pipeisclosed+0x11>
  8044f2:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  8044f6:	75 86                	jne    80447e <_pipeisclosed+0x11>
  8044f8:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8044ff:	00 00 00 
  804502:	48 8b 00             	mov    (%rax),%rax
  804505:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  80450b:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80450e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804511:	89 c6                	mov    %eax,%esi
  804513:	48 bf c3 56 80 00 00 	movabs $0x8056c3,%rdi
  80451a:	00 00 00 
  80451d:	b8 00 00 00 00       	mov    $0x0,%eax
  804522:	49 b8 3e 0f 80 00 00 	movabs $0x800f3e,%r8
  804529:	00 00 00 
  80452c:	41 ff d0             	callq  *%r8
  80452f:	e9 4a ff ff ff       	jmpq   80447e <_pipeisclosed+0x11>
  804534:	48 83 c4 28          	add    $0x28,%rsp
  804538:	5b                   	pop    %rbx
  804539:	5d                   	pop    %rbp
  80453a:	c3                   	retq   

000000000080453b <pipeisclosed>:
  80453b:	55                   	push   %rbp
  80453c:	48 89 e5             	mov    %rsp,%rbp
  80453f:	48 83 ec 30          	sub    $0x30,%rsp
  804543:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804546:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80454a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80454d:	48 89 d6             	mov    %rdx,%rsi
  804550:	89 c7                	mov    %eax,%edi
  804552:	48 b8 1c 2b 80 00 00 	movabs $0x802b1c,%rax
  804559:	00 00 00 
  80455c:	ff d0                	callq  *%rax
  80455e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804561:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804565:	79 05                	jns    80456c <pipeisclosed+0x31>
  804567:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80456a:	eb 31                	jmp    80459d <pipeisclosed+0x62>
  80456c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804570:	48 89 c7             	mov    %rax,%rdi
  804573:	48 b8 59 2a 80 00 00 	movabs $0x802a59,%rax
  80457a:	00 00 00 
  80457d:	ff d0                	callq  *%rax
  80457f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804583:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804587:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80458b:	48 89 d6             	mov    %rdx,%rsi
  80458e:	48 89 c7             	mov    %rax,%rdi
  804591:	48 b8 6d 44 80 00 00 	movabs $0x80446d,%rax
  804598:	00 00 00 
  80459b:	ff d0                	callq  *%rax
  80459d:	c9                   	leaveq 
  80459e:	c3                   	retq   

000000000080459f <devpipe_read>:
  80459f:	55                   	push   %rbp
  8045a0:	48 89 e5             	mov    %rsp,%rbp
  8045a3:	48 83 ec 40          	sub    $0x40,%rsp
  8045a7:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8045ab:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8045af:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8045b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045b7:	48 89 c7             	mov    %rax,%rdi
  8045ba:	48 b8 59 2a 80 00 00 	movabs $0x802a59,%rax
  8045c1:	00 00 00 
  8045c4:	ff d0                	callq  *%rax
  8045c6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8045ca:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8045ce:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8045d2:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8045d9:	00 
  8045da:	e9 90 00 00 00       	jmpq   80466f <devpipe_read+0xd0>
  8045df:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8045e4:	74 09                	je     8045ef <devpipe_read+0x50>
  8045e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045ea:	e9 8e 00 00 00       	jmpq   80467d <devpipe_read+0xde>
  8045ef:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8045f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045f7:	48 89 d6             	mov    %rdx,%rsi
  8045fa:	48 89 c7             	mov    %rax,%rdi
  8045fd:	48 b8 6d 44 80 00 00 	movabs $0x80446d,%rax
  804604:	00 00 00 
  804607:	ff d0                	callq  *%rax
  804609:	85 c0                	test   %eax,%eax
  80460b:	74 07                	je     804614 <devpipe_read+0x75>
  80460d:	b8 00 00 00 00       	mov    $0x0,%eax
  804612:	eb 69                	jmp    80467d <devpipe_read+0xde>
  804614:	48 b8 c1 23 80 00 00 	movabs $0x8023c1,%rax
  80461b:	00 00 00 
  80461e:	ff d0                	callq  *%rax
  804620:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804624:	8b 10                	mov    (%rax),%edx
  804626:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80462a:	8b 40 04             	mov    0x4(%rax),%eax
  80462d:	39 c2                	cmp    %eax,%edx
  80462f:	74 ae                	je     8045df <devpipe_read+0x40>
  804631:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804635:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804639:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  80463d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804641:	8b 00                	mov    (%rax),%eax
  804643:	99                   	cltd   
  804644:	c1 ea 1b             	shr    $0x1b,%edx
  804647:	01 d0                	add    %edx,%eax
  804649:	83 e0 1f             	and    $0x1f,%eax
  80464c:	29 d0                	sub    %edx,%eax
  80464e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804652:	48 98                	cltq   
  804654:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804659:	88 01                	mov    %al,(%rcx)
  80465b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80465f:	8b 00                	mov    (%rax),%eax
  804661:	8d 50 01             	lea    0x1(%rax),%edx
  804664:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804668:	89 10                	mov    %edx,(%rax)
  80466a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80466f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804673:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804677:	72 a7                	jb     804620 <devpipe_read+0x81>
  804679:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80467d:	c9                   	leaveq 
  80467e:	c3                   	retq   

000000000080467f <devpipe_write>:
  80467f:	55                   	push   %rbp
  804680:	48 89 e5             	mov    %rsp,%rbp
  804683:	48 83 ec 40          	sub    $0x40,%rsp
  804687:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80468b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80468f:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804693:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804697:	48 89 c7             	mov    %rax,%rdi
  80469a:	48 b8 59 2a 80 00 00 	movabs $0x802a59,%rax
  8046a1:	00 00 00 
  8046a4:	ff d0                	callq  *%rax
  8046a6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8046aa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8046ae:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8046b2:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8046b9:	00 
  8046ba:	e9 8f 00 00 00       	jmpq   80474e <devpipe_write+0xcf>
  8046bf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8046c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8046c7:	48 89 d6             	mov    %rdx,%rsi
  8046ca:	48 89 c7             	mov    %rax,%rdi
  8046cd:	48 b8 6d 44 80 00 00 	movabs $0x80446d,%rax
  8046d4:	00 00 00 
  8046d7:	ff d0                	callq  *%rax
  8046d9:	85 c0                	test   %eax,%eax
  8046db:	74 07                	je     8046e4 <devpipe_write+0x65>
  8046dd:	b8 00 00 00 00       	mov    $0x0,%eax
  8046e2:	eb 78                	jmp    80475c <devpipe_write+0xdd>
  8046e4:	48 b8 c1 23 80 00 00 	movabs $0x8023c1,%rax
  8046eb:	00 00 00 
  8046ee:	ff d0                	callq  *%rax
  8046f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046f4:	8b 40 04             	mov    0x4(%rax),%eax
  8046f7:	48 63 d0             	movslq %eax,%rdx
  8046fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046fe:	8b 00                	mov    (%rax),%eax
  804700:	48 98                	cltq   
  804702:	48 83 c0 20          	add    $0x20,%rax
  804706:	48 39 c2             	cmp    %rax,%rdx
  804709:	73 b4                	jae    8046bf <devpipe_write+0x40>
  80470b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80470f:	8b 40 04             	mov    0x4(%rax),%eax
  804712:	99                   	cltd   
  804713:	c1 ea 1b             	shr    $0x1b,%edx
  804716:	01 d0                	add    %edx,%eax
  804718:	83 e0 1f             	and    $0x1f,%eax
  80471b:	29 d0                	sub    %edx,%eax
  80471d:	89 c6                	mov    %eax,%esi
  80471f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804723:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804727:	48 01 d0             	add    %rdx,%rax
  80472a:	0f b6 08             	movzbl (%rax),%ecx
  80472d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804731:	48 63 c6             	movslq %esi,%rax
  804734:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  804738:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80473c:	8b 40 04             	mov    0x4(%rax),%eax
  80473f:	8d 50 01             	lea    0x1(%rax),%edx
  804742:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804746:	89 50 04             	mov    %edx,0x4(%rax)
  804749:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80474e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804752:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804756:	72 98                	jb     8046f0 <devpipe_write+0x71>
  804758:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80475c:	c9                   	leaveq 
  80475d:	c3                   	retq   

000000000080475e <devpipe_stat>:
  80475e:	55                   	push   %rbp
  80475f:	48 89 e5             	mov    %rsp,%rbp
  804762:	48 83 ec 20          	sub    $0x20,%rsp
  804766:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80476a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80476e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804772:	48 89 c7             	mov    %rax,%rdi
  804775:	48 b8 59 2a 80 00 00 	movabs $0x802a59,%rax
  80477c:	00 00 00 
  80477f:	ff d0                	callq  *%rax
  804781:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804785:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804789:	48 be d6 56 80 00 00 	movabs $0x8056d6,%rsi
  804790:	00 00 00 
  804793:	48 89 c7             	mov    %rax,%rdi
  804796:	48 b8 ce 1a 80 00 00 	movabs $0x801ace,%rax
  80479d:	00 00 00 
  8047a0:	ff d0                	callq  *%rax
  8047a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8047a6:	8b 50 04             	mov    0x4(%rax),%edx
  8047a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8047ad:	8b 00                	mov    (%rax),%eax
  8047af:	29 c2                	sub    %eax,%edx
  8047b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8047b5:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8047bb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8047bf:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8047c6:	00 00 00 
  8047c9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8047cd:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  8047d4:	00 00 00 
  8047d7:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  8047de:	b8 00 00 00 00       	mov    $0x0,%eax
  8047e3:	c9                   	leaveq 
  8047e4:	c3                   	retq   

00000000008047e5 <devpipe_close>:
  8047e5:	55                   	push   %rbp
  8047e6:	48 89 e5             	mov    %rsp,%rbp
  8047e9:	48 83 ec 10          	sub    $0x10,%rsp
  8047ed:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8047f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8047f5:	48 89 c6             	mov    %rax,%rsi
  8047f8:	bf 00 00 00 00       	mov    $0x0,%edi
  8047fd:	48 b8 b0 24 80 00 00 	movabs $0x8024b0,%rax
  804804:	00 00 00 
  804807:	ff d0                	callq  *%rax
  804809:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80480d:	48 89 c7             	mov    %rax,%rdi
  804810:	48 b8 59 2a 80 00 00 	movabs $0x802a59,%rax
  804817:	00 00 00 
  80481a:	ff d0                	callq  *%rax
  80481c:	48 89 c6             	mov    %rax,%rsi
  80481f:	bf 00 00 00 00       	mov    $0x0,%edi
  804824:	48 b8 b0 24 80 00 00 	movabs $0x8024b0,%rax
  80482b:	00 00 00 
  80482e:	ff d0                	callq  *%rax
  804830:	c9                   	leaveq 
  804831:	c3                   	retq   

0000000000804832 <cputchar>:
  804832:	55                   	push   %rbp
  804833:	48 89 e5             	mov    %rsp,%rbp
  804836:	48 83 ec 20          	sub    $0x20,%rsp
  80483a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80483d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804840:	88 45 ff             	mov    %al,-0x1(%rbp)
  804843:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804847:	be 01 00 00 00       	mov    $0x1,%esi
  80484c:	48 89 c7             	mov    %rax,%rdi
  80484f:	48 b8 b6 22 80 00 00 	movabs $0x8022b6,%rax
  804856:	00 00 00 
  804859:	ff d0                	callq  *%rax
  80485b:	90                   	nop
  80485c:	c9                   	leaveq 
  80485d:	c3                   	retq   

000000000080485e <getchar>:
  80485e:	55                   	push   %rbp
  80485f:	48 89 e5             	mov    %rsp,%rbp
  804862:	48 83 ec 10          	sub    $0x10,%rsp
  804866:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  80486a:	ba 01 00 00 00       	mov    $0x1,%edx
  80486f:	48 89 c6             	mov    %rax,%rsi
  804872:	bf 00 00 00 00       	mov    $0x0,%edi
  804877:	48 b8 51 2f 80 00 00 	movabs $0x802f51,%rax
  80487e:	00 00 00 
  804881:	ff d0                	callq  *%rax
  804883:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804886:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80488a:	79 05                	jns    804891 <getchar+0x33>
  80488c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80488f:	eb 14                	jmp    8048a5 <getchar+0x47>
  804891:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804895:	7f 07                	jg     80489e <getchar+0x40>
  804897:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  80489c:	eb 07                	jmp    8048a5 <getchar+0x47>
  80489e:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  8048a2:	0f b6 c0             	movzbl %al,%eax
  8048a5:	c9                   	leaveq 
  8048a6:	c3                   	retq   

00000000008048a7 <iscons>:
  8048a7:	55                   	push   %rbp
  8048a8:	48 89 e5             	mov    %rsp,%rbp
  8048ab:	48 83 ec 20          	sub    $0x20,%rsp
  8048af:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8048b2:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8048b6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8048b9:	48 89 d6             	mov    %rdx,%rsi
  8048bc:	89 c7                	mov    %eax,%edi
  8048be:	48 b8 1c 2b 80 00 00 	movabs $0x802b1c,%rax
  8048c5:	00 00 00 
  8048c8:	ff d0                	callq  *%rax
  8048ca:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8048cd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048d1:	79 05                	jns    8048d8 <iscons+0x31>
  8048d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048d6:	eb 1a                	jmp    8048f2 <iscons+0x4b>
  8048d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8048dc:	8b 10                	mov    (%rax),%edx
  8048de:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  8048e5:	00 00 00 
  8048e8:	8b 00                	mov    (%rax),%eax
  8048ea:	39 c2                	cmp    %eax,%edx
  8048ec:	0f 94 c0             	sete   %al
  8048ef:	0f b6 c0             	movzbl %al,%eax
  8048f2:	c9                   	leaveq 
  8048f3:	c3                   	retq   

00000000008048f4 <opencons>:
  8048f4:	55                   	push   %rbp
  8048f5:	48 89 e5             	mov    %rsp,%rbp
  8048f8:	48 83 ec 10          	sub    $0x10,%rsp
  8048fc:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804900:	48 89 c7             	mov    %rax,%rdi
  804903:	48 b8 84 2a 80 00 00 	movabs $0x802a84,%rax
  80490a:	00 00 00 
  80490d:	ff d0                	callq  *%rax
  80490f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804912:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804916:	79 05                	jns    80491d <opencons+0x29>
  804918:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80491b:	eb 5b                	jmp    804978 <opencons+0x84>
  80491d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804921:	ba 07 04 00 00       	mov    $0x407,%edx
  804926:	48 89 c6             	mov    %rax,%rsi
  804929:	bf 00 00 00 00       	mov    $0x0,%edi
  80492e:	48 b8 fe 23 80 00 00 	movabs $0x8023fe,%rax
  804935:	00 00 00 
  804938:	ff d0                	callq  *%rax
  80493a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80493d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804941:	79 05                	jns    804948 <opencons+0x54>
  804943:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804946:	eb 30                	jmp    804978 <opencons+0x84>
  804948:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80494c:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  804953:	00 00 00 
  804956:	8b 12                	mov    (%rdx),%edx
  804958:	89 10                	mov    %edx,(%rax)
  80495a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80495e:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804965:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804969:	48 89 c7             	mov    %rax,%rdi
  80496c:	48 b8 36 2a 80 00 00 	movabs $0x802a36,%rax
  804973:	00 00 00 
  804976:	ff d0                	callq  *%rax
  804978:	c9                   	leaveq 
  804979:	c3                   	retq   

000000000080497a <devcons_read>:
  80497a:	55                   	push   %rbp
  80497b:	48 89 e5             	mov    %rsp,%rbp
  80497e:	48 83 ec 30          	sub    $0x30,%rsp
  804982:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804986:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80498a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80498e:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804993:	75 13                	jne    8049a8 <devcons_read+0x2e>
  804995:	b8 00 00 00 00       	mov    $0x0,%eax
  80499a:	eb 49                	jmp    8049e5 <devcons_read+0x6b>
  80499c:	48 b8 c1 23 80 00 00 	movabs $0x8023c1,%rax
  8049a3:	00 00 00 
  8049a6:	ff d0                	callq  *%rax
  8049a8:	48 b8 03 23 80 00 00 	movabs $0x802303,%rax
  8049af:	00 00 00 
  8049b2:	ff d0                	callq  *%rax
  8049b4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8049b7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049bb:	74 df                	je     80499c <devcons_read+0x22>
  8049bd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8049c1:	79 05                	jns    8049c8 <devcons_read+0x4e>
  8049c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049c6:	eb 1d                	jmp    8049e5 <devcons_read+0x6b>
  8049c8:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  8049cc:	75 07                	jne    8049d5 <devcons_read+0x5b>
  8049ce:	b8 00 00 00 00       	mov    $0x0,%eax
  8049d3:	eb 10                	jmp    8049e5 <devcons_read+0x6b>
  8049d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049d8:	89 c2                	mov    %eax,%edx
  8049da:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8049de:	88 10                	mov    %dl,(%rax)
  8049e0:	b8 01 00 00 00       	mov    $0x1,%eax
  8049e5:	c9                   	leaveq 
  8049e6:	c3                   	retq   

00000000008049e7 <devcons_write>:
  8049e7:	55                   	push   %rbp
  8049e8:	48 89 e5             	mov    %rsp,%rbp
  8049eb:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8049f2:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8049f9:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804a00:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804a07:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804a0e:	eb 76                	jmp    804a86 <devcons_write+0x9f>
  804a10:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804a17:	89 c2                	mov    %eax,%edx
  804a19:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a1c:	29 c2                	sub    %eax,%edx
  804a1e:	89 d0                	mov    %edx,%eax
  804a20:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804a23:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804a26:	83 f8 7f             	cmp    $0x7f,%eax
  804a29:	76 07                	jbe    804a32 <devcons_write+0x4b>
  804a2b:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804a32:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804a35:	48 63 d0             	movslq %eax,%rdx
  804a38:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a3b:	48 63 c8             	movslq %eax,%rcx
  804a3e:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804a45:	48 01 c1             	add    %rax,%rcx
  804a48:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804a4f:	48 89 ce             	mov    %rcx,%rsi
  804a52:	48 89 c7             	mov    %rax,%rdi
  804a55:	48 b8 f3 1d 80 00 00 	movabs $0x801df3,%rax
  804a5c:	00 00 00 
  804a5f:	ff d0                	callq  *%rax
  804a61:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804a64:	48 63 d0             	movslq %eax,%rdx
  804a67:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804a6e:	48 89 d6             	mov    %rdx,%rsi
  804a71:	48 89 c7             	mov    %rax,%rdi
  804a74:	48 b8 b6 22 80 00 00 	movabs $0x8022b6,%rax
  804a7b:	00 00 00 
  804a7e:	ff d0                	callq  *%rax
  804a80:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804a83:	01 45 fc             	add    %eax,-0x4(%rbp)
  804a86:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a89:	48 98                	cltq   
  804a8b:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804a92:	0f 82 78 ff ff ff    	jb     804a10 <devcons_write+0x29>
  804a98:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a9b:	c9                   	leaveq 
  804a9c:	c3                   	retq   

0000000000804a9d <devcons_close>:
  804a9d:	55                   	push   %rbp
  804a9e:	48 89 e5             	mov    %rsp,%rbp
  804aa1:	48 83 ec 08          	sub    $0x8,%rsp
  804aa5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804aa9:	b8 00 00 00 00       	mov    $0x0,%eax
  804aae:	c9                   	leaveq 
  804aaf:	c3                   	retq   

0000000000804ab0 <devcons_stat>:
  804ab0:	55                   	push   %rbp
  804ab1:	48 89 e5             	mov    %rsp,%rbp
  804ab4:	48 83 ec 10          	sub    $0x10,%rsp
  804ab8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804abc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804ac0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804ac4:	48 be e2 56 80 00 00 	movabs $0x8056e2,%rsi
  804acb:	00 00 00 
  804ace:	48 89 c7             	mov    %rax,%rdi
  804ad1:	48 b8 ce 1a 80 00 00 	movabs $0x801ace,%rax
  804ad8:	00 00 00 
  804adb:	ff d0                	callq  *%rax
  804add:	b8 00 00 00 00       	mov    $0x0,%eax
  804ae2:	c9                   	leaveq 
  804ae3:	c3                   	retq   

0000000000804ae4 <pageref>:
  804ae4:	55                   	push   %rbp
  804ae5:	48 89 e5             	mov    %rsp,%rbp
  804ae8:	48 83 ec 18          	sub    $0x18,%rsp
  804aec:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804af0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804af4:	48 c1 e8 15          	shr    $0x15,%rax
  804af8:	48 89 c2             	mov    %rax,%rdx
  804afb:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804b02:	01 00 00 
  804b05:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804b09:	83 e0 01             	and    $0x1,%eax
  804b0c:	48 85 c0             	test   %rax,%rax
  804b0f:	75 07                	jne    804b18 <pageref+0x34>
  804b11:	b8 00 00 00 00       	mov    $0x0,%eax
  804b16:	eb 56                	jmp    804b6e <pageref+0x8a>
  804b18:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804b1c:	48 c1 e8 0c          	shr    $0xc,%rax
  804b20:	48 89 c2             	mov    %rax,%rdx
  804b23:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804b2a:	01 00 00 
  804b2d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804b31:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804b35:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b39:	83 e0 01             	and    $0x1,%eax
  804b3c:	48 85 c0             	test   %rax,%rax
  804b3f:	75 07                	jne    804b48 <pageref+0x64>
  804b41:	b8 00 00 00 00       	mov    $0x0,%eax
  804b46:	eb 26                	jmp    804b6e <pageref+0x8a>
  804b48:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b4c:	48 c1 e8 0c          	shr    $0xc,%rax
  804b50:	48 89 c2             	mov    %rax,%rdx
  804b53:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804b5a:	00 00 00 
  804b5d:	48 c1 e2 04          	shl    $0x4,%rdx
  804b61:	48 01 d0             	add    %rdx,%rax
  804b64:	48 83 c0 08          	add    $0x8,%rax
  804b68:	0f b7 00             	movzwl (%rax),%eax
  804b6b:	0f b7 c0             	movzwl %ax,%eax
  804b6e:	c9                   	leaveq 
  804b6f:	c3                   	retq   
