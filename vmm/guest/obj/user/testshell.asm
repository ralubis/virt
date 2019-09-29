
vmm/guest/obj/user/testshell:     file format elf64-x86-64


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
  80003c:	e8 f5 07 00 00       	callq  800836 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 40          	sub    $0x40,%rsp
  80004b:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80004e:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  800052:	bf 00 00 00 00       	mov    $0x0,%edi
  800057:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  80005e:	00 00 00 
  800061:	ff d0                	callq  *%rax
  800063:	bf 01 00 00 00       	mov    $0x1,%edi
  800068:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  80006f:	00 00 00 
  800072:	ff d0                	callq  *%rax
  800074:	48 b8 46 06 80 00 00 	movabs $0x800646,%rax
  80007b:	00 00 00 
  80007e:	ff d0                	callq  *%rax
  800080:	48 b8 46 06 80 00 00 	movabs $0x800646,%rax
  800087:	00 00 00 
  80008a:	ff d0                	callq  *%rax
  80008c:	be 00 00 00 00       	mov    $0x0,%esi
  800091:	48 bf e0 57 80 00 00 	movabs $0x8057e0,%rdi
  800098:	00 00 00 
  80009b:	48 b8 e0 33 80 00 00 	movabs $0x8033e0,%rax
  8000a2:	00 00 00 
  8000a5:	ff d0                	callq  *%rax
  8000a7:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8000aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8000ae:	79 30                	jns    8000e0 <umain+0x9d>
  8000b0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8000b3:	89 c1                	mov    %eax,%ecx
  8000b5:	48 ba ed 57 80 00 00 	movabs $0x8057ed,%rdx
  8000bc:	00 00 00 
  8000bf:	be 14 00 00 00       	mov    $0x14,%esi
  8000c4:	48 bf 03 58 80 00 00 	movabs $0x805803,%rdi
  8000cb:	00 00 00 
  8000ce:	b8 00 00 00 00       	mov    $0x0,%eax
  8000d3:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  8000da:	00 00 00 
  8000dd:	41 ff d0             	callq  *%r8
  8000e0:	48 8d 45 d4          	lea    -0x2c(%rbp),%rax
  8000e4:	48 89 c7             	mov    %rax,%rdi
  8000e7:	48 b8 99 4d 80 00 00 	movabs $0x804d99,%rax
  8000ee:	00 00 00 
  8000f1:	ff d0                	callq  *%rax
  8000f3:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8000f6:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8000fa:	79 30                	jns    80012c <umain+0xe9>
  8000fc:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8000ff:	89 c1                	mov    %eax,%ecx
  800101:	48 ba 17 58 80 00 00 	movabs $0x805817,%rdx
  800108:	00 00 00 
  80010b:	be 16 00 00 00       	mov    $0x16,%esi
  800110:	48 bf 03 58 80 00 00 	movabs $0x805803,%rdi
  800117:	00 00 00 
  80011a:	b8 00 00 00 00       	mov    $0x0,%eax
  80011f:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  800126:	00 00 00 
  800129:	41 ff d0             	callq  *%r8
  80012c:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80012f:	89 45 f0             	mov    %eax,-0x10(%rbp)
  800132:	48 bf 20 58 80 00 00 	movabs $0x805820,%rdi
  800139:	00 00 00 
  80013c:	b8 00 00 00 00       	mov    $0x0,%eax
  800141:	48 ba 18 0b 80 00 00 	movabs $0x800b18,%rdx
  800148:	00 00 00 
  80014b:	ff d2                	callq  *%rdx
  80014d:	48 b8 75 27 80 00 00 	movabs $0x802775,%rax
  800154:	00 00 00 
  800157:	ff d0                	callq  *%rax
  800159:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80015c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800160:	79 30                	jns    800192 <umain+0x14f>
  800162:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800165:	89 c1                	mov    %eax,%ecx
  800167:	48 ba 44 58 80 00 00 	movabs $0x805844,%rdx
  80016e:	00 00 00 
  800171:	be 1b 00 00 00       	mov    $0x1b,%esi
  800176:	48 bf 03 58 80 00 00 	movabs $0x805803,%rdi
  80017d:	00 00 00 
  800180:	b8 00 00 00 00       	mov    $0x0,%eax
  800185:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  80018c:	00 00 00 
  80018f:	41 ff d0             	callq  *%r8
  800192:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800196:	0f 85 fb 00 00 00    	jne    800297 <umain+0x254>
  80019c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80019f:	be 00 00 00 00       	mov    $0x0,%esi
  8001a4:	89 c7                	mov    %eax,%edi
  8001a6:	48 b8 5e 2d 80 00 00 	movabs $0x802d5e,%rax
  8001ad:	00 00 00 
  8001b0:	ff d0                	callq  *%rax
  8001b2:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8001b5:	be 01 00 00 00       	mov    $0x1,%esi
  8001ba:	89 c7                	mov    %eax,%edi
  8001bc:	48 b8 5e 2d 80 00 00 	movabs $0x802d5e,%rax
  8001c3:	00 00 00 
  8001c6:	ff d0                	callq  *%rax
  8001c8:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8001cb:	89 c7                	mov    %eax,%edi
  8001cd:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  8001d4:	00 00 00 
  8001d7:	ff d0                	callq  *%rax
  8001d9:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8001dc:	89 c7                	mov    %eax,%edi
  8001de:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  8001e5:	00 00 00 
  8001e8:	ff d0                	callq  *%rax
  8001ea:	b9 00 00 00 00       	mov    $0x0,%ecx
  8001ef:	48 ba 4d 58 80 00 00 	movabs $0x80584d,%rdx
  8001f6:	00 00 00 
  8001f9:	48 be 50 58 80 00 00 	movabs $0x805850,%rsi
  800200:	00 00 00 
  800203:	48 bf 53 58 80 00 00 	movabs $0x805853,%rdi
  80020a:	00 00 00 
  80020d:	b8 00 00 00 00       	mov    $0x0,%eax
  800212:	49 b8 77 3d 80 00 00 	movabs $0x803d77,%r8
  800219:	00 00 00 
  80021c:	41 ff d0             	callq  *%r8
  80021f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  800222:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800226:	79 30                	jns    800258 <umain+0x215>
  800228:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80022b:	89 c1                	mov    %eax,%ecx
  80022d:	48 ba 5b 58 80 00 00 	movabs $0x80585b,%rdx
  800234:	00 00 00 
  800237:	be 22 00 00 00       	mov    $0x22,%esi
  80023c:	48 bf 03 58 80 00 00 	movabs $0x805803,%rdi
  800243:	00 00 00 
  800246:	b8 00 00 00 00       	mov    $0x0,%eax
  80024b:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  800252:	00 00 00 
  800255:	41 ff d0             	callq  *%r8
  800258:	bf 00 00 00 00       	mov    $0x0,%edi
  80025d:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  800264:	00 00 00 
  800267:	ff d0                	callq  *%rax
  800269:	bf 01 00 00 00       	mov    $0x1,%edi
  80026e:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  800275:	00 00 00 
  800278:	ff d0                	callq  *%rax
  80027a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80027d:	89 c7                	mov    %eax,%edi
  80027f:	48 b8 54 53 80 00 00 	movabs $0x805354,%rax
  800286:	00 00 00 
  800289:	ff d0                	callq  *%rax
  80028b:	48 b8 ba 08 80 00 00 	movabs $0x8008ba,%rax
  800292:	00 00 00 
  800295:	ff d0                	callq  *%rax
  800297:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80029a:	89 c7                	mov    %eax,%edi
  80029c:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  8002a3:	00 00 00 
  8002a6:	ff d0                	callq  *%rax
  8002a8:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8002ab:	89 c7                	mov    %eax,%edi
  8002ad:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  8002b4:	00 00 00 
  8002b7:	ff d0                	callq  *%rax
  8002b9:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8002bc:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8002bf:	be 00 00 00 00       	mov    $0x0,%esi
  8002c4:	48 bf 65 58 80 00 00 	movabs $0x805865,%rdi
  8002cb:	00 00 00 
  8002ce:	48 b8 e0 33 80 00 00 	movabs $0x8033e0,%rax
  8002d5:	00 00 00 
  8002d8:	ff d0                	callq  *%rax
  8002da:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8002dd:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8002e1:	79 30                	jns    800313 <umain+0x2d0>
  8002e3:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8002e6:	89 c1                	mov    %eax,%ecx
  8002e8:	48 ba 78 58 80 00 00 	movabs $0x805878,%rdx
  8002ef:	00 00 00 
  8002f2:	be 2d 00 00 00       	mov    $0x2d,%esi
  8002f7:	48 bf 03 58 80 00 00 	movabs $0x805803,%rdi
  8002fe:	00 00 00 
  800301:	b8 00 00 00 00       	mov    $0x0,%eax
  800306:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  80030d:	00 00 00 
  800310:	41 ff d0             	callq  *%r8
  800313:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  80031a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800321:	48 8d 4d df          	lea    -0x21(%rbp),%rcx
  800325:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800328:	ba 01 00 00 00       	mov    $0x1,%edx
  80032d:	48 89 ce             	mov    %rcx,%rsi
  800330:	89 c7                	mov    %eax,%edi
  800332:	48 b8 07 2f 80 00 00 	movabs $0x802f07,%rax
  800339:	00 00 00 
  80033c:	ff d0                	callq  *%rax
  80033e:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  800341:	48 8d 4d de          	lea    -0x22(%rbp),%rcx
  800345:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800348:	ba 01 00 00 00       	mov    $0x1,%edx
  80034d:	48 89 ce             	mov    %rcx,%rsi
  800350:	89 c7                	mov    %eax,%edi
  800352:	48 b8 07 2f 80 00 00 	movabs $0x802f07,%rax
  800359:	00 00 00 
  80035c:	ff d0                	callq  *%rax
  80035e:	89 45 e0             	mov    %eax,-0x20(%rbp)
  800361:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800365:	79 30                	jns    800397 <umain+0x354>
  800367:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80036a:	89 c1                	mov    %eax,%ecx
  80036c:	48 ba 9b 58 80 00 00 	movabs $0x80589b,%rdx
  800373:	00 00 00 
  800376:	be 34 00 00 00       	mov    $0x34,%esi
  80037b:	48 bf 03 58 80 00 00 	movabs $0x805803,%rdi
  800382:	00 00 00 
  800385:	b8 00 00 00 00       	mov    $0x0,%eax
  80038a:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  800391:	00 00 00 
  800394:	41 ff d0             	callq  *%r8
  800397:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  80039b:	79 30                	jns    8003cd <umain+0x38a>
  80039d:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8003a0:	89 c1                	mov    %eax,%ecx
  8003a2:	48 ba b5 58 80 00 00 	movabs $0x8058b5,%rdx
  8003a9:	00 00 00 
  8003ac:	be 36 00 00 00       	mov    $0x36,%esi
  8003b1:	48 bf 03 58 80 00 00 	movabs $0x805803,%rdi
  8003b8:	00 00 00 
  8003bb:	b8 00 00 00 00       	mov    $0x0,%eax
  8003c0:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  8003c7:	00 00 00 
  8003ca:	41 ff d0             	callq  *%r8
  8003cd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8003d1:	75 06                	jne    8003d9 <umain+0x396>
  8003d3:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  8003d7:	74 4b                	je     800424 <umain+0x3e1>
  8003d9:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8003dd:	75 12                	jne    8003f1 <umain+0x3ae>
  8003df:	83 7d e0 01          	cmpl   $0x1,-0x20(%rbp)
  8003e3:	75 0c                	jne    8003f1 <umain+0x3ae>
  8003e5:	0f b6 55 df          	movzbl -0x21(%rbp),%edx
  8003e9:	0f b6 45 de          	movzbl -0x22(%rbp),%eax
  8003ed:	38 c2                	cmp    %al,%dl
  8003ef:	74 19                	je     80040a <umain+0x3c7>
  8003f1:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8003f4:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8003f7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8003fa:	89 ce                	mov    %ecx,%esi
  8003fc:	89 c7                	mov    %eax,%edi
  8003fe:	48 b8 44 04 80 00 00 	movabs $0x800444,%rax
  800405:	00 00 00 
  800408:	ff d0                	callq  *%rax
  80040a:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
  80040e:	3c 0a                	cmp    $0xa,%al
  800410:	75 09                	jne    80041b <umain+0x3d8>
  800412:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800415:	83 c0 01             	add    $0x1,%eax
  800418:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80041b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80041f:	e9 fd fe ff ff       	jmpq   800321 <umain+0x2de>
  800424:	90                   	nop
  800425:	48 bf cf 58 80 00 00 	movabs $0x8058cf,%rdi
  80042c:	00 00 00 
  80042f:	b8 00 00 00 00       	mov    $0x0,%eax
  800434:	48 ba 18 0b 80 00 00 	movabs $0x800b18,%rdx
  80043b:	00 00 00 
  80043e:	ff d2                	callq  *%rdx
static __inline void read_gdtr (uint64_t *gdtbase, uint16_t *gdtlimit) __attribute__((always_inline));

static __inline void
breakpoint(void)
{
	__asm __volatile("int3");
  800440:	cc                   	int3   
  800441:	90                   	nop
  800442:	c9                   	leaveq 
  800443:	c3                   	retq   

0000000000800444 <wrong>:
  800444:	55                   	push   %rbp
  800445:	48 89 e5             	mov    %rsp,%rbp
  800448:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
  80044c:	89 7d 8c             	mov    %edi,-0x74(%rbp)
  80044f:	89 75 88             	mov    %esi,-0x78(%rbp)
  800452:	89 55 84             	mov    %edx,-0x7c(%rbp)
  800455:	8b 55 84             	mov    -0x7c(%rbp),%edx
  800458:	8b 45 8c             	mov    -0x74(%rbp),%eax
  80045b:	89 d6                	mov    %edx,%esi
  80045d:	89 c7                	mov    %eax,%edi
  80045f:	48 b8 26 31 80 00 00 	movabs $0x803126,%rax
  800466:	00 00 00 
  800469:	ff d0                	callq  *%rax
  80046b:	8b 55 84             	mov    -0x7c(%rbp),%edx
  80046e:	8b 45 88             	mov    -0x78(%rbp),%eax
  800471:	89 d6                	mov    %edx,%esi
  800473:	89 c7                	mov    %eax,%edi
  800475:	48 b8 26 31 80 00 00 	movabs $0x803126,%rax
  80047c:	00 00 00 
  80047f:	ff d0                	callq  *%rax
  800481:	48 bf e8 58 80 00 00 	movabs $0x8058e8,%rdi
  800488:	00 00 00 
  80048b:	b8 00 00 00 00       	mov    $0x0,%eax
  800490:	48 ba 18 0b 80 00 00 	movabs $0x800b18,%rdx
  800497:	00 00 00 
  80049a:	ff d2                	callq  *%rdx
  80049c:	48 bf 0a 59 80 00 00 	movabs $0x80590a,%rdi
  8004a3:	00 00 00 
  8004a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8004ab:	48 ba 18 0b 80 00 00 	movabs $0x800b18,%rdx
  8004b2:	00 00 00 
  8004b5:	ff d2                	callq  *%rdx
  8004b7:	eb 1c                	jmp    8004d5 <wrong+0x91>
  8004b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8004bc:	48 63 d0             	movslq %eax,%rdx
  8004bf:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  8004c3:	48 89 d6             	mov    %rdx,%rsi
  8004c6:	48 89 c7             	mov    %rax,%rdi
  8004c9:	48 b8 90 1e 80 00 00 	movabs $0x801e90,%rax
  8004d0:	00 00 00 
  8004d3:	ff d0                	callq  *%rax
  8004d5:	48 8d 4d 90          	lea    -0x70(%rbp),%rcx
  8004d9:	8b 45 88             	mov    -0x78(%rbp),%eax
  8004dc:	ba 63 00 00 00       	mov    $0x63,%edx
  8004e1:	48 89 ce             	mov    %rcx,%rsi
  8004e4:	89 c7                	mov    %eax,%edi
  8004e6:	48 b8 07 2f 80 00 00 	movabs $0x802f07,%rax
  8004ed:	00 00 00 
  8004f0:	ff d0                	callq  *%rax
  8004f2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8004f5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8004f9:	7f be                	jg     8004b9 <wrong+0x75>
  8004fb:	48 bf 19 59 80 00 00 	movabs $0x805919,%rdi
  800502:	00 00 00 
  800505:	b8 00 00 00 00       	mov    $0x0,%eax
  80050a:	48 ba 18 0b 80 00 00 	movabs $0x800b18,%rdx
  800511:	00 00 00 
  800514:	ff d2                	callq  *%rdx
  800516:	eb 1c                	jmp    800534 <wrong+0xf0>
  800518:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80051b:	48 63 d0             	movslq %eax,%rdx
  80051e:	48 8d 45 90          	lea    -0x70(%rbp),%rax
  800522:	48 89 d6             	mov    %rdx,%rsi
  800525:	48 89 c7             	mov    %rax,%rdi
  800528:	48 b8 90 1e 80 00 00 	movabs $0x801e90,%rax
  80052f:	00 00 00 
  800532:	ff d0                	callq  *%rax
  800534:	48 8d 4d 90          	lea    -0x70(%rbp),%rcx
  800538:	8b 45 8c             	mov    -0x74(%rbp),%eax
  80053b:	ba 63 00 00 00       	mov    $0x63,%edx
  800540:	48 89 ce             	mov    %rcx,%rsi
  800543:	89 c7                	mov    %eax,%edi
  800545:	48 b8 07 2f 80 00 00 	movabs $0x802f07,%rax
  80054c:	00 00 00 
  80054f:	ff d0                	callq  *%rax
  800551:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800554:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800558:	7f be                	jg     800518 <wrong+0xd4>
  80055a:	48 bf 27 59 80 00 00 	movabs $0x805927,%rdi
  800561:	00 00 00 
  800564:	b8 00 00 00 00       	mov    $0x0,%eax
  800569:	48 ba 18 0b 80 00 00 	movabs $0x800b18,%rdx
  800570:	00 00 00 
  800573:	ff d2                	callq  *%rdx
  800575:	48 b8 ba 08 80 00 00 	movabs $0x8008ba,%rax
  80057c:	00 00 00 
  80057f:	ff d0                	callq  *%rax
  800581:	90                   	nop
  800582:	c9                   	leaveq 
  800583:	c3                   	retq   

0000000000800584 <cputchar>:
  800584:	55                   	push   %rbp
  800585:	48 89 e5             	mov    %rsp,%rbp
  800588:	48 83 ec 20          	sub    $0x20,%rsp
  80058c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80058f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800592:	88 45 ff             	mov    %al,-0x1(%rbp)
  800595:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  800599:	be 01 00 00 00       	mov    $0x1,%esi
  80059e:	48 89 c7             	mov    %rax,%rdi
  8005a1:	48 b8 90 1e 80 00 00 	movabs $0x801e90,%rax
  8005a8:	00 00 00 
  8005ab:	ff d0                	callq  *%rax
  8005ad:	90                   	nop
  8005ae:	c9                   	leaveq 
  8005af:	c3                   	retq   

00000000008005b0 <getchar>:
  8005b0:	55                   	push   %rbp
  8005b1:	48 89 e5             	mov    %rsp,%rbp
  8005b4:	48 83 ec 10          	sub    $0x10,%rsp
  8005b8:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8005bc:	ba 01 00 00 00       	mov    $0x1,%edx
  8005c1:	48 89 c6             	mov    %rax,%rsi
  8005c4:	bf 00 00 00 00       	mov    $0x0,%edi
  8005c9:	48 b8 07 2f 80 00 00 	movabs $0x802f07,%rax
  8005d0:	00 00 00 
  8005d3:	ff d0                	callq  *%rax
  8005d5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8005d8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8005dc:	79 05                	jns    8005e3 <getchar+0x33>
  8005de:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8005e1:	eb 14                	jmp    8005f7 <getchar+0x47>
  8005e3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8005e7:	7f 07                	jg     8005f0 <getchar+0x40>
  8005e9:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  8005ee:	eb 07                	jmp    8005f7 <getchar+0x47>
  8005f0:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  8005f4:	0f b6 c0             	movzbl %al,%eax
  8005f7:	c9                   	leaveq 
  8005f8:	c3                   	retq   

00000000008005f9 <iscons>:
  8005f9:	55                   	push   %rbp
  8005fa:	48 89 e5             	mov    %rsp,%rbp
  8005fd:	48 83 ec 20          	sub    $0x20,%rsp
  800601:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800604:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  800608:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80060b:	48 89 d6             	mov    %rdx,%rsi
  80060e:	89 c7                	mov    %eax,%edi
  800610:	48 b8 d2 2a 80 00 00 	movabs $0x802ad2,%rax
  800617:	00 00 00 
  80061a:	ff d0                	callq  *%rax
  80061c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80061f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800623:	79 05                	jns    80062a <iscons+0x31>
  800625:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800628:	eb 1a                	jmp    800644 <iscons+0x4b>
  80062a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80062e:	8b 10                	mov    (%rax),%edx
  800630:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  800637:	00 00 00 
  80063a:	8b 00                	mov    (%rax),%eax
  80063c:	39 c2                	cmp    %eax,%edx
  80063e:	0f 94 c0             	sete   %al
  800641:	0f b6 c0             	movzbl %al,%eax
  800644:	c9                   	leaveq 
  800645:	c3                   	retq   

0000000000800646 <opencons>:
  800646:	55                   	push   %rbp
  800647:	48 89 e5             	mov    %rsp,%rbp
  80064a:	48 83 ec 10          	sub    $0x10,%rsp
  80064e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  800652:	48 89 c7             	mov    %rax,%rdi
  800655:	48 b8 3a 2a 80 00 00 	movabs $0x802a3a,%rax
  80065c:	00 00 00 
  80065f:	ff d0                	callq  *%rax
  800661:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800664:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800668:	79 05                	jns    80066f <opencons+0x29>
  80066a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80066d:	eb 5b                	jmp    8006ca <opencons+0x84>
  80066f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800673:	ba 07 04 00 00       	mov    $0x407,%edx
  800678:	48 89 c6             	mov    %rax,%rsi
  80067b:	bf 00 00 00 00       	mov    $0x0,%edi
  800680:	48 b8 d8 1f 80 00 00 	movabs $0x801fd8,%rax
  800687:	00 00 00 
  80068a:	ff d0                	callq  *%rax
  80068c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80068f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800693:	79 05                	jns    80069a <opencons+0x54>
  800695:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800698:	eb 30                	jmp    8006ca <opencons+0x84>
  80069a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80069e:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  8006a5:	00 00 00 
  8006a8:	8b 12                	mov    (%rdx),%edx
  8006aa:	89 10                	mov    %edx,(%rax)
  8006ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8006b0:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8006b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8006bb:	48 89 c7             	mov    %rax,%rdi
  8006be:	48 b8 ec 29 80 00 00 	movabs $0x8029ec,%rax
  8006c5:	00 00 00 
  8006c8:	ff d0                	callq  *%rax
  8006ca:	c9                   	leaveq 
  8006cb:	c3                   	retq   

00000000008006cc <devcons_read>:
  8006cc:	55                   	push   %rbp
  8006cd:	48 89 e5             	mov    %rsp,%rbp
  8006d0:	48 83 ec 30          	sub    $0x30,%rsp
  8006d4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8006d8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8006dc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8006e0:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8006e5:	75 13                	jne    8006fa <devcons_read+0x2e>
  8006e7:	b8 00 00 00 00       	mov    $0x0,%eax
  8006ec:	eb 49                	jmp    800737 <devcons_read+0x6b>
  8006ee:	48 b8 9b 1f 80 00 00 	movabs $0x801f9b,%rax
  8006f5:	00 00 00 
  8006f8:	ff d0                	callq  *%rax
  8006fa:	48 b8 dd 1e 80 00 00 	movabs $0x801edd,%rax
  800701:	00 00 00 
  800704:	ff d0                	callq  *%rax
  800706:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800709:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80070d:	74 df                	je     8006ee <devcons_read+0x22>
  80070f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800713:	79 05                	jns    80071a <devcons_read+0x4e>
  800715:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800718:	eb 1d                	jmp    800737 <devcons_read+0x6b>
  80071a:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  80071e:	75 07                	jne    800727 <devcons_read+0x5b>
  800720:	b8 00 00 00 00       	mov    $0x0,%eax
  800725:	eb 10                	jmp    800737 <devcons_read+0x6b>
  800727:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80072a:	89 c2                	mov    %eax,%edx
  80072c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800730:	88 10                	mov    %dl,(%rax)
  800732:	b8 01 00 00 00       	mov    $0x1,%eax
  800737:	c9                   	leaveq 
  800738:	c3                   	retq   

0000000000800739 <devcons_write>:
  800739:	55                   	push   %rbp
  80073a:	48 89 e5             	mov    %rsp,%rbp
  80073d:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  800744:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  80074b:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  800752:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  800759:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800760:	eb 76                	jmp    8007d8 <devcons_write+0x9f>
  800762:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  800769:	89 c2                	mov    %eax,%edx
  80076b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80076e:	29 c2                	sub    %eax,%edx
  800770:	89 d0                	mov    %edx,%eax
  800772:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800775:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800778:	83 f8 7f             	cmp    $0x7f,%eax
  80077b:	76 07                	jbe    800784 <devcons_write+0x4b>
  80077d:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  800784:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800787:	48 63 d0             	movslq %eax,%rdx
  80078a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80078d:	48 63 c8             	movslq %eax,%rcx
  800790:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  800797:	48 01 c1             	add    %rax,%rcx
  80079a:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8007a1:	48 89 ce             	mov    %rcx,%rsi
  8007a4:	48 89 c7             	mov    %rax,%rdi
  8007a7:	48 b8 cd 19 80 00 00 	movabs $0x8019cd,%rax
  8007ae:	00 00 00 
  8007b1:	ff d0                	callq  *%rax
  8007b3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8007b6:	48 63 d0             	movslq %eax,%rdx
  8007b9:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8007c0:	48 89 d6             	mov    %rdx,%rsi
  8007c3:	48 89 c7             	mov    %rax,%rdi
  8007c6:	48 b8 90 1e 80 00 00 	movabs $0x801e90,%rax
  8007cd:	00 00 00 
  8007d0:	ff d0                	callq  *%rax
  8007d2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8007d5:	01 45 fc             	add    %eax,-0x4(%rbp)
  8007d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8007db:	48 98                	cltq   
  8007dd:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8007e4:	0f 82 78 ff ff ff    	jb     800762 <devcons_write+0x29>
  8007ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8007ed:	c9                   	leaveq 
  8007ee:	c3                   	retq   

00000000008007ef <devcons_close>:
  8007ef:	55                   	push   %rbp
  8007f0:	48 89 e5             	mov    %rsp,%rbp
  8007f3:	48 83 ec 08          	sub    $0x8,%rsp
  8007f7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8007fb:	b8 00 00 00 00       	mov    $0x0,%eax
  800800:	c9                   	leaveq 
  800801:	c3                   	retq   

0000000000800802 <devcons_stat>:
  800802:	55                   	push   %rbp
  800803:	48 89 e5             	mov    %rsp,%rbp
  800806:	48 83 ec 10          	sub    $0x10,%rsp
  80080a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80080e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800812:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800816:	48 be 31 59 80 00 00 	movabs $0x805931,%rsi
  80081d:	00 00 00 
  800820:	48 89 c7             	mov    %rax,%rdi
  800823:	48 b8 a8 16 80 00 00 	movabs $0x8016a8,%rax
  80082a:	00 00 00 
  80082d:	ff d0                	callq  *%rax
  80082f:	b8 00 00 00 00       	mov    $0x0,%eax
  800834:	c9                   	leaveq 
  800835:	c3                   	retq   

0000000000800836 <libmain>:
  800836:	55                   	push   %rbp
  800837:	48 89 e5             	mov    %rsp,%rbp
  80083a:	48 83 ec 10          	sub    $0x10,%rsp
  80083e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800841:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800845:	48 b8 5f 1f 80 00 00 	movabs $0x801f5f,%rax
  80084c:	00 00 00 
  80084f:	ff d0                	callq  *%rax
  800851:	25 ff 03 00 00       	and    $0x3ff,%eax
  800856:	48 98                	cltq   
  800858:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80085f:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800866:	00 00 00 
  800869:	48 01 c2             	add    %rax,%rdx
  80086c:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  800873:	00 00 00 
  800876:	48 89 10             	mov    %rdx,(%rax)
  800879:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80087d:	7e 14                	jle    800893 <libmain+0x5d>
  80087f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800883:	48 8b 10             	mov    (%rax),%rdx
  800886:	48 b8 38 80 80 00 00 	movabs $0x808038,%rax
  80088d:	00 00 00 
  800890:	48 89 10             	mov    %rdx,(%rax)
  800893:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800897:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80089a:	48 89 d6             	mov    %rdx,%rsi
  80089d:	89 c7                	mov    %eax,%edi
  80089f:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8008a6:	00 00 00 
  8008a9:	ff d0                	callq  *%rax
  8008ab:	48 b8 ba 08 80 00 00 	movabs $0x8008ba,%rax
  8008b2:	00 00 00 
  8008b5:	ff d0                	callq  *%rax
  8008b7:	90                   	nop
  8008b8:	c9                   	leaveq 
  8008b9:	c3                   	retq   

00000000008008ba <exit>:
  8008ba:	55                   	push   %rbp
  8008bb:	48 89 e5             	mov    %rsp,%rbp
  8008be:	48 b8 2f 2d 80 00 00 	movabs $0x802d2f,%rax
  8008c5:	00 00 00 
  8008c8:	ff d0                	callq  *%rax
  8008ca:	bf 00 00 00 00       	mov    $0x0,%edi
  8008cf:	48 b8 19 1f 80 00 00 	movabs $0x801f19,%rax
  8008d6:	00 00 00 
  8008d9:	ff d0                	callq  *%rax
  8008db:	90                   	nop
  8008dc:	5d                   	pop    %rbp
  8008dd:	c3                   	retq   

00000000008008de <_panic>:
  8008de:	55                   	push   %rbp
  8008df:	48 89 e5             	mov    %rsp,%rbp
  8008e2:	53                   	push   %rbx
  8008e3:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8008ea:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8008f1:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8008f7:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8008fe:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800905:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  80090c:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800913:	84 c0                	test   %al,%al
  800915:	74 23                	je     80093a <_panic+0x5c>
  800917:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  80091e:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800922:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800926:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80092a:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  80092e:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800932:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800936:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80093a:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800941:	00 00 00 
  800944:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80094b:	00 00 00 
  80094e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800952:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800959:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800960:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800967:	48 b8 38 80 80 00 00 	movabs $0x808038,%rax
  80096e:	00 00 00 
  800971:	48 8b 18             	mov    (%rax),%rbx
  800974:	48 b8 5f 1f 80 00 00 	movabs $0x801f5f,%rax
  80097b:	00 00 00 
  80097e:	ff d0                	callq  *%rax
  800980:	89 c6                	mov    %eax,%esi
  800982:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  800988:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  80098f:	41 89 d0             	mov    %edx,%r8d
  800992:	48 89 c1             	mov    %rax,%rcx
  800995:	48 89 da             	mov    %rbx,%rdx
  800998:	48 bf 48 59 80 00 00 	movabs $0x805948,%rdi
  80099f:	00 00 00 
  8009a2:	b8 00 00 00 00       	mov    $0x0,%eax
  8009a7:	49 b9 18 0b 80 00 00 	movabs $0x800b18,%r9
  8009ae:	00 00 00 
  8009b1:	41 ff d1             	callq  *%r9
  8009b4:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8009bb:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8009c2:	48 89 d6             	mov    %rdx,%rsi
  8009c5:	48 89 c7             	mov    %rax,%rdi
  8009c8:	48 b8 6c 0a 80 00 00 	movabs $0x800a6c,%rax
  8009cf:	00 00 00 
  8009d2:	ff d0                	callq  *%rax
  8009d4:	48 bf 6b 59 80 00 00 	movabs $0x80596b,%rdi
  8009db:	00 00 00 
  8009de:	b8 00 00 00 00       	mov    $0x0,%eax
  8009e3:	48 ba 18 0b 80 00 00 	movabs $0x800b18,%rdx
  8009ea:	00 00 00 
  8009ed:	ff d2                	callq  *%rdx
  8009ef:	cc                   	int3   
  8009f0:	eb fd                	jmp    8009ef <_panic+0x111>

00000000008009f2 <putch>:
  8009f2:	55                   	push   %rbp
  8009f3:	48 89 e5             	mov    %rsp,%rbp
  8009f6:	48 83 ec 10          	sub    $0x10,%rsp
  8009fa:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8009fd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800a01:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800a05:	8b 00                	mov    (%rax),%eax
  800a07:	8d 48 01             	lea    0x1(%rax),%ecx
  800a0a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800a0e:	89 0a                	mov    %ecx,(%rdx)
  800a10:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800a13:	89 d1                	mov    %edx,%ecx
  800a15:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800a19:	48 98                	cltq   
  800a1b:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800a1f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800a23:	8b 00                	mov    (%rax),%eax
  800a25:	3d ff 00 00 00       	cmp    $0xff,%eax
  800a2a:	75 2c                	jne    800a58 <putch+0x66>
  800a2c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800a30:	8b 00                	mov    (%rax),%eax
  800a32:	48 98                	cltq   
  800a34:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800a38:	48 83 c2 08          	add    $0x8,%rdx
  800a3c:	48 89 c6             	mov    %rax,%rsi
  800a3f:	48 89 d7             	mov    %rdx,%rdi
  800a42:	48 b8 90 1e 80 00 00 	movabs $0x801e90,%rax
  800a49:	00 00 00 
  800a4c:	ff d0                	callq  *%rax
  800a4e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800a52:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800a58:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800a5c:	8b 40 04             	mov    0x4(%rax),%eax
  800a5f:	8d 50 01             	lea    0x1(%rax),%edx
  800a62:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800a66:	89 50 04             	mov    %edx,0x4(%rax)
  800a69:	90                   	nop
  800a6a:	c9                   	leaveq 
  800a6b:	c3                   	retq   

0000000000800a6c <vcprintf>:
  800a6c:	55                   	push   %rbp
  800a6d:	48 89 e5             	mov    %rsp,%rbp
  800a70:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800a77:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800a7e:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800a85:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800a8c:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800a93:	48 8b 0a             	mov    (%rdx),%rcx
  800a96:	48 89 08             	mov    %rcx,(%rax)
  800a99:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800a9d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800aa1:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800aa5:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800aa9:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800ab0:	00 00 00 
  800ab3:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800aba:	00 00 00 
  800abd:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800ac4:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800acb:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800ad2:	48 89 c6             	mov    %rax,%rsi
  800ad5:	48 bf f2 09 80 00 00 	movabs $0x8009f2,%rdi
  800adc:	00 00 00 
  800adf:	48 b8 b6 0e 80 00 00 	movabs $0x800eb6,%rax
  800ae6:	00 00 00 
  800ae9:	ff d0                	callq  *%rax
  800aeb:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800af1:	48 98                	cltq   
  800af3:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800afa:	48 83 c2 08          	add    $0x8,%rdx
  800afe:	48 89 c6             	mov    %rax,%rsi
  800b01:	48 89 d7             	mov    %rdx,%rdi
  800b04:	48 b8 90 1e 80 00 00 	movabs $0x801e90,%rax
  800b0b:	00 00 00 
  800b0e:	ff d0                	callq  *%rax
  800b10:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800b16:	c9                   	leaveq 
  800b17:	c3                   	retq   

0000000000800b18 <cprintf>:
  800b18:	55                   	push   %rbp
  800b19:	48 89 e5             	mov    %rsp,%rbp
  800b1c:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800b23:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800b2a:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800b31:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800b38:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800b3f:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800b46:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800b4d:	84 c0                	test   %al,%al
  800b4f:	74 20                	je     800b71 <cprintf+0x59>
  800b51:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800b55:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800b59:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800b5d:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800b61:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800b65:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800b69:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800b6d:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800b71:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800b78:	00 00 00 
  800b7b:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800b82:	00 00 00 
  800b85:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800b89:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800b90:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800b97:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800b9e:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800ba5:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800bac:	48 8b 0a             	mov    (%rdx),%rcx
  800baf:	48 89 08             	mov    %rcx,(%rax)
  800bb2:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800bb6:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800bba:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800bbe:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800bc2:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800bc9:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800bd0:	48 89 d6             	mov    %rdx,%rsi
  800bd3:	48 89 c7             	mov    %rax,%rdi
  800bd6:	48 b8 6c 0a 80 00 00 	movabs $0x800a6c,%rax
  800bdd:	00 00 00 
  800be0:	ff d0                	callq  *%rax
  800be2:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800be8:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800bee:	c9                   	leaveq 
  800bef:	c3                   	retq   

0000000000800bf0 <printnum>:
  800bf0:	55                   	push   %rbp
  800bf1:	48 89 e5             	mov    %rsp,%rbp
  800bf4:	48 83 ec 30          	sub    $0x30,%rsp
  800bf8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800bfc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800c00:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800c04:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  800c07:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  800c0b:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  800c0f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800c12:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  800c16:	77 54                	ja     800c6c <printnum+0x7c>
  800c18:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800c1b:	8d 78 ff             	lea    -0x1(%rax),%edi
  800c1e:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800c21:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c25:	ba 00 00 00 00       	mov    $0x0,%edx
  800c2a:	48 f7 f6             	div    %rsi
  800c2d:	49 89 c2             	mov    %rax,%r10
  800c30:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800c33:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  800c36:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  800c3a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800c3e:	41 89 c9             	mov    %ecx,%r9d
  800c41:	41 89 f8             	mov    %edi,%r8d
  800c44:	89 d1                	mov    %edx,%ecx
  800c46:	4c 89 d2             	mov    %r10,%rdx
  800c49:	48 89 c7             	mov    %rax,%rdi
  800c4c:	48 b8 f0 0b 80 00 00 	movabs $0x800bf0,%rax
  800c53:	00 00 00 
  800c56:	ff d0                	callq  *%rax
  800c58:	eb 1c                	jmp    800c76 <printnum+0x86>
  800c5a:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800c5e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800c61:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800c65:	48 89 ce             	mov    %rcx,%rsi
  800c68:	89 d7                	mov    %edx,%edi
  800c6a:	ff d0                	callq  *%rax
  800c6c:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  800c70:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  800c74:	7f e4                	jg     800c5a <printnum+0x6a>
  800c76:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800c79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c7d:	ba 00 00 00 00       	mov    $0x0,%edx
  800c82:	48 f7 f1             	div    %rcx
  800c85:	48 b8 70 5b 80 00 00 	movabs $0x805b70,%rax
  800c8c:	00 00 00 
  800c8f:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  800c93:	0f be d0             	movsbl %al,%edx
  800c96:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800c9a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800c9e:	48 89 ce             	mov    %rcx,%rsi
  800ca1:	89 d7                	mov    %edx,%edi
  800ca3:	ff d0                	callq  *%rax
  800ca5:	90                   	nop
  800ca6:	c9                   	leaveq 
  800ca7:	c3                   	retq   

0000000000800ca8 <getuint>:
  800ca8:	55                   	push   %rbp
  800ca9:	48 89 e5             	mov    %rsp,%rbp
  800cac:	48 83 ec 20          	sub    $0x20,%rsp
  800cb0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800cb4:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800cb7:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800cbb:	7e 4f                	jle    800d0c <getuint+0x64>
  800cbd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cc1:	8b 00                	mov    (%rax),%eax
  800cc3:	83 f8 30             	cmp    $0x30,%eax
  800cc6:	73 24                	jae    800cec <getuint+0x44>
  800cc8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ccc:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800cd0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cd4:	8b 00                	mov    (%rax),%eax
  800cd6:	89 c0                	mov    %eax,%eax
  800cd8:	48 01 d0             	add    %rdx,%rax
  800cdb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800cdf:	8b 12                	mov    (%rdx),%edx
  800ce1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800ce4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ce8:	89 0a                	mov    %ecx,(%rdx)
  800cea:	eb 14                	jmp    800d00 <getuint+0x58>
  800cec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cf0:	48 8b 40 08          	mov    0x8(%rax),%rax
  800cf4:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800cf8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800cfc:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800d00:	48 8b 00             	mov    (%rax),%rax
  800d03:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800d07:	e9 9d 00 00 00       	jmpq   800da9 <getuint+0x101>
  800d0c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800d10:	74 4c                	je     800d5e <getuint+0xb6>
  800d12:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d16:	8b 00                	mov    (%rax),%eax
  800d18:	83 f8 30             	cmp    $0x30,%eax
  800d1b:	73 24                	jae    800d41 <getuint+0x99>
  800d1d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d21:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800d25:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d29:	8b 00                	mov    (%rax),%eax
  800d2b:	89 c0                	mov    %eax,%eax
  800d2d:	48 01 d0             	add    %rdx,%rax
  800d30:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d34:	8b 12                	mov    (%rdx),%edx
  800d36:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800d39:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d3d:	89 0a                	mov    %ecx,(%rdx)
  800d3f:	eb 14                	jmp    800d55 <getuint+0xad>
  800d41:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d45:	48 8b 40 08          	mov    0x8(%rax),%rax
  800d49:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800d4d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d51:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800d55:	48 8b 00             	mov    (%rax),%rax
  800d58:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800d5c:	eb 4b                	jmp    800da9 <getuint+0x101>
  800d5e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d62:	8b 00                	mov    (%rax),%eax
  800d64:	83 f8 30             	cmp    $0x30,%eax
  800d67:	73 24                	jae    800d8d <getuint+0xe5>
  800d69:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d6d:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800d71:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d75:	8b 00                	mov    (%rax),%eax
  800d77:	89 c0                	mov    %eax,%eax
  800d79:	48 01 d0             	add    %rdx,%rax
  800d7c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d80:	8b 12                	mov    (%rdx),%edx
  800d82:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800d85:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d89:	89 0a                	mov    %ecx,(%rdx)
  800d8b:	eb 14                	jmp    800da1 <getuint+0xf9>
  800d8d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d91:	48 8b 40 08          	mov    0x8(%rax),%rax
  800d95:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800d99:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d9d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800da1:	8b 00                	mov    (%rax),%eax
  800da3:	89 c0                	mov    %eax,%eax
  800da5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800da9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800dad:	c9                   	leaveq 
  800dae:	c3                   	retq   

0000000000800daf <getint>:
  800daf:	55                   	push   %rbp
  800db0:	48 89 e5             	mov    %rsp,%rbp
  800db3:	48 83 ec 20          	sub    $0x20,%rsp
  800db7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800dbb:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800dbe:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800dc2:	7e 4f                	jle    800e13 <getint+0x64>
  800dc4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800dc8:	8b 00                	mov    (%rax),%eax
  800dca:	83 f8 30             	cmp    $0x30,%eax
  800dcd:	73 24                	jae    800df3 <getint+0x44>
  800dcf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800dd3:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800dd7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ddb:	8b 00                	mov    (%rax),%eax
  800ddd:	89 c0                	mov    %eax,%eax
  800ddf:	48 01 d0             	add    %rdx,%rax
  800de2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800de6:	8b 12                	mov    (%rdx),%edx
  800de8:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800deb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800def:	89 0a                	mov    %ecx,(%rdx)
  800df1:	eb 14                	jmp    800e07 <getint+0x58>
  800df3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800df7:	48 8b 40 08          	mov    0x8(%rax),%rax
  800dfb:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800dff:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e03:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800e07:	48 8b 00             	mov    (%rax),%rax
  800e0a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800e0e:	e9 9d 00 00 00       	jmpq   800eb0 <getint+0x101>
  800e13:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800e17:	74 4c                	je     800e65 <getint+0xb6>
  800e19:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e1d:	8b 00                	mov    (%rax),%eax
  800e1f:	83 f8 30             	cmp    $0x30,%eax
  800e22:	73 24                	jae    800e48 <getint+0x99>
  800e24:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e28:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800e2c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e30:	8b 00                	mov    (%rax),%eax
  800e32:	89 c0                	mov    %eax,%eax
  800e34:	48 01 d0             	add    %rdx,%rax
  800e37:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e3b:	8b 12                	mov    (%rdx),%edx
  800e3d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800e40:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e44:	89 0a                	mov    %ecx,(%rdx)
  800e46:	eb 14                	jmp    800e5c <getint+0xad>
  800e48:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e4c:	48 8b 40 08          	mov    0x8(%rax),%rax
  800e50:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800e54:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e58:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800e5c:	48 8b 00             	mov    (%rax),%rax
  800e5f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800e63:	eb 4b                	jmp    800eb0 <getint+0x101>
  800e65:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e69:	8b 00                	mov    (%rax),%eax
  800e6b:	83 f8 30             	cmp    $0x30,%eax
  800e6e:	73 24                	jae    800e94 <getint+0xe5>
  800e70:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e74:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800e78:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e7c:	8b 00                	mov    (%rax),%eax
  800e7e:	89 c0                	mov    %eax,%eax
  800e80:	48 01 d0             	add    %rdx,%rax
  800e83:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e87:	8b 12                	mov    (%rdx),%edx
  800e89:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800e8c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e90:	89 0a                	mov    %ecx,(%rdx)
  800e92:	eb 14                	jmp    800ea8 <getint+0xf9>
  800e94:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e98:	48 8b 40 08          	mov    0x8(%rax),%rax
  800e9c:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800ea0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ea4:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800ea8:	8b 00                	mov    (%rax),%eax
  800eaa:	48 98                	cltq   
  800eac:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800eb0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800eb4:	c9                   	leaveq 
  800eb5:	c3                   	retq   

0000000000800eb6 <vprintfmt>:
  800eb6:	55                   	push   %rbp
  800eb7:	48 89 e5             	mov    %rsp,%rbp
  800eba:	41 54                	push   %r12
  800ebc:	53                   	push   %rbx
  800ebd:	48 83 ec 60          	sub    $0x60,%rsp
  800ec1:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800ec5:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800ec9:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800ecd:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800ed1:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ed5:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800ed9:	48 8b 0a             	mov    (%rdx),%rcx
  800edc:	48 89 08             	mov    %rcx,(%rax)
  800edf:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ee3:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ee7:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800eeb:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800eef:	eb 17                	jmp    800f08 <vprintfmt+0x52>
  800ef1:	85 db                	test   %ebx,%ebx
  800ef3:	0f 84 b9 04 00 00    	je     8013b2 <vprintfmt+0x4fc>
  800ef9:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800efd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f01:	48 89 d6             	mov    %rdx,%rsi
  800f04:	89 df                	mov    %ebx,%edi
  800f06:	ff d0                	callq  *%rax
  800f08:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800f0c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800f10:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800f14:	0f b6 00             	movzbl (%rax),%eax
  800f17:	0f b6 d8             	movzbl %al,%ebx
  800f1a:	83 fb 25             	cmp    $0x25,%ebx
  800f1d:	75 d2                	jne    800ef1 <vprintfmt+0x3b>
  800f1f:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800f23:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800f2a:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800f31:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800f38:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800f3f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800f43:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800f47:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800f4b:	0f b6 00             	movzbl (%rax),%eax
  800f4e:	0f b6 d8             	movzbl %al,%ebx
  800f51:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800f54:	83 f8 55             	cmp    $0x55,%eax
  800f57:	0f 87 22 04 00 00    	ja     80137f <vprintfmt+0x4c9>
  800f5d:	89 c0                	mov    %eax,%eax
  800f5f:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800f66:	00 
  800f67:	48 b8 98 5b 80 00 00 	movabs $0x805b98,%rax
  800f6e:	00 00 00 
  800f71:	48 01 d0             	add    %rdx,%rax
  800f74:	48 8b 00             	mov    (%rax),%rax
  800f77:	ff e0                	jmpq   *%rax
  800f79:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800f7d:	eb c0                	jmp    800f3f <vprintfmt+0x89>
  800f7f:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800f83:	eb ba                	jmp    800f3f <vprintfmt+0x89>
  800f85:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800f8c:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800f8f:	89 d0                	mov    %edx,%eax
  800f91:	c1 e0 02             	shl    $0x2,%eax
  800f94:	01 d0                	add    %edx,%eax
  800f96:	01 c0                	add    %eax,%eax
  800f98:	01 d8                	add    %ebx,%eax
  800f9a:	83 e8 30             	sub    $0x30,%eax
  800f9d:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800fa0:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800fa4:	0f b6 00             	movzbl (%rax),%eax
  800fa7:	0f be d8             	movsbl %al,%ebx
  800faa:	83 fb 2f             	cmp    $0x2f,%ebx
  800fad:	7e 60                	jle    80100f <vprintfmt+0x159>
  800faf:	83 fb 39             	cmp    $0x39,%ebx
  800fb2:	7f 5b                	jg     80100f <vprintfmt+0x159>
  800fb4:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800fb9:	eb d1                	jmp    800f8c <vprintfmt+0xd6>
  800fbb:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800fbe:	83 f8 30             	cmp    $0x30,%eax
  800fc1:	73 17                	jae    800fda <vprintfmt+0x124>
  800fc3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800fc7:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800fca:	89 d2                	mov    %edx,%edx
  800fcc:	48 01 d0             	add    %rdx,%rax
  800fcf:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800fd2:	83 c2 08             	add    $0x8,%edx
  800fd5:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800fd8:	eb 0c                	jmp    800fe6 <vprintfmt+0x130>
  800fda:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800fde:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800fe2:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800fe6:	8b 00                	mov    (%rax),%eax
  800fe8:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800feb:	eb 23                	jmp    801010 <vprintfmt+0x15a>
  800fed:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ff1:	0f 89 48 ff ff ff    	jns    800f3f <vprintfmt+0x89>
  800ff7:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800ffe:	e9 3c ff ff ff       	jmpq   800f3f <vprintfmt+0x89>
  801003:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  80100a:	e9 30 ff ff ff       	jmpq   800f3f <vprintfmt+0x89>
  80100f:	90                   	nop
  801010:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801014:	0f 89 25 ff ff ff    	jns    800f3f <vprintfmt+0x89>
  80101a:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80101d:	89 45 dc             	mov    %eax,-0x24(%rbp)
  801020:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  801027:	e9 13 ff ff ff       	jmpq   800f3f <vprintfmt+0x89>
  80102c:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  801030:	e9 0a ff ff ff       	jmpq   800f3f <vprintfmt+0x89>
  801035:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801038:	83 f8 30             	cmp    $0x30,%eax
  80103b:	73 17                	jae    801054 <vprintfmt+0x19e>
  80103d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801041:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801044:	89 d2                	mov    %edx,%edx
  801046:	48 01 d0             	add    %rdx,%rax
  801049:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80104c:	83 c2 08             	add    $0x8,%edx
  80104f:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801052:	eb 0c                	jmp    801060 <vprintfmt+0x1aa>
  801054:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801058:	48 8d 50 08          	lea    0x8(%rax),%rdx
  80105c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801060:	8b 10                	mov    (%rax),%edx
  801062:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  801066:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80106a:	48 89 ce             	mov    %rcx,%rsi
  80106d:	89 d7                	mov    %edx,%edi
  80106f:	ff d0                	callq  *%rax
  801071:	e9 37 03 00 00       	jmpq   8013ad <vprintfmt+0x4f7>
  801076:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801079:	83 f8 30             	cmp    $0x30,%eax
  80107c:	73 17                	jae    801095 <vprintfmt+0x1df>
  80107e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801082:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801085:	89 d2                	mov    %edx,%edx
  801087:	48 01 d0             	add    %rdx,%rax
  80108a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80108d:	83 c2 08             	add    $0x8,%edx
  801090:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801093:	eb 0c                	jmp    8010a1 <vprintfmt+0x1eb>
  801095:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801099:	48 8d 50 08          	lea    0x8(%rax),%rdx
  80109d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8010a1:	8b 18                	mov    (%rax),%ebx
  8010a3:	85 db                	test   %ebx,%ebx
  8010a5:	79 02                	jns    8010a9 <vprintfmt+0x1f3>
  8010a7:	f7 db                	neg    %ebx
  8010a9:	83 fb 15             	cmp    $0x15,%ebx
  8010ac:	7f 16                	jg     8010c4 <vprintfmt+0x20e>
  8010ae:	48 b8 c0 5a 80 00 00 	movabs $0x805ac0,%rax
  8010b5:	00 00 00 
  8010b8:	48 63 d3             	movslq %ebx,%rdx
  8010bb:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  8010bf:	4d 85 e4             	test   %r12,%r12
  8010c2:	75 2e                	jne    8010f2 <vprintfmt+0x23c>
  8010c4:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8010c8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8010cc:	89 d9                	mov    %ebx,%ecx
  8010ce:	48 ba 81 5b 80 00 00 	movabs $0x805b81,%rdx
  8010d5:	00 00 00 
  8010d8:	48 89 c7             	mov    %rax,%rdi
  8010db:	b8 00 00 00 00       	mov    $0x0,%eax
  8010e0:	49 b8 bc 13 80 00 00 	movabs $0x8013bc,%r8
  8010e7:	00 00 00 
  8010ea:	41 ff d0             	callq  *%r8
  8010ed:	e9 bb 02 00 00       	jmpq   8013ad <vprintfmt+0x4f7>
  8010f2:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8010f6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8010fa:	4c 89 e1             	mov    %r12,%rcx
  8010fd:	48 ba 8a 5b 80 00 00 	movabs $0x805b8a,%rdx
  801104:	00 00 00 
  801107:	48 89 c7             	mov    %rax,%rdi
  80110a:	b8 00 00 00 00       	mov    $0x0,%eax
  80110f:	49 b8 bc 13 80 00 00 	movabs $0x8013bc,%r8
  801116:	00 00 00 
  801119:	41 ff d0             	callq  *%r8
  80111c:	e9 8c 02 00 00       	jmpq   8013ad <vprintfmt+0x4f7>
  801121:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801124:	83 f8 30             	cmp    $0x30,%eax
  801127:	73 17                	jae    801140 <vprintfmt+0x28a>
  801129:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80112d:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801130:	89 d2                	mov    %edx,%edx
  801132:	48 01 d0             	add    %rdx,%rax
  801135:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801138:	83 c2 08             	add    $0x8,%edx
  80113b:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80113e:	eb 0c                	jmp    80114c <vprintfmt+0x296>
  801140:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801144:	48 8d 50 08          	lea    0x8(%rax),%rdx
  801148:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80114c:	4c 8b 20             	mov    (%rax),%r12
  80114f:	4d 85 e4             	test   %r12,%r12
  801152:	75 0a                	jne    80115e <vprintfmt+0x2a8>
  801154:	49 bc 8d 5b 80 00 00 	movabs $0x805b8d,%r12
  80115b:	00 00 00 
  80115e:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801162:	7e 78                	jle    8011dc <vprintfmt+0x326>
  801164:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  801168:	74 72                	je     8011dc <vprintfmt+0x326>
  80116a:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80116d:	48 98                	cltq   
  80116f:	48 89 c6             	mov    %rax,%rsi
  801172:	4c 89 e7             	mov    %r12,%rdi
  801175:	48 b8 6a 16 80 00 00 	movabs $0x80166a,%rax
  80117c:	00 00 00 
  80117f:	ff d0                	callq  *%rax
  801181:	29 45 dc             	sub    %eax,-0x24(%rbp)
  801184:	eb 17                	jmp    80119d <vprintfmt+0x2e7>
  801186:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  80118a:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  80118e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801192:	48 89 ce             	mov    %rcx,%rsi
  801195:	89 d7                	mov    %edx,%edi
  801197:	ff d0                	callq  *%rax
  801199:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  80119d:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8011a1:	7f e3                	jg     801186 <vprintfmt+0x2d0>
  8011a3:	eb 37                	jmp    8011dc <vprintfmt+0x326>
  8011a5:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  8011a9:	74 1e                	je     8011c9 <vprintfmt+0x313>
  8011ab:	83 fb 1f             	cmp    $0x1f,%ebx
  8011ae:	7e 05                	jle    8011b5 <vprintfmt+0x2ff>
  8011b0:	83 fb 7e             	cmp    $0x7e,%ebx
  8011b3:	7e 14                	jle    8011c9 <vprintfmt+0x313>
  8011b5:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8011b9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8011bd:	48 89 d6             	mov    %rdx,%rsi
  8011c0:	bf 3f 00 00 00       	mov    $0x3f,%edi
  8011c5:	ff d0                	callq  *%rax
  8011c7:	eb 0f                	jmp    8011d8 <vprintfmt+0x322>
  8011c9:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8011cd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8011d1:	48 89 d6             	mov    %rdx,%rsi
  8011d4:	89 df                	mov    %ebx,%edi
  8011d6:	ff d0                	callq  *%rax
  8011d8:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8011dc:	4c 89 e0             	mov    %r12,%rax
  8011df:	4c 8d 60 01          	lea    0x1(%rax),%r12
  8011e3:	0f b6 00             	movzbl (%rax),%eax
  8011e6:	0f be d8             	movsbl %al,%ebx
  8011e9:	85 db                	test   %ebx,%ebx
  8011eb:	74 28                	je     801215 <vprintfmt+0x35f>
  8011ed:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8011f1:	78 b2                	js     8011a5 <vprintfmt+0x2ef>
  8011f3:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  8011f7:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8011fb:	79 a8                	jns    8011a5 <vprintfmt+0x2ef>
  8011fd:	eb 16                	jmp    801215 <vprintfmt+0x35f>
  8011ff:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801203:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801207:	48 89 d6             	mov    %rdx,%rsi
  80120a:	bf 20 00 00 00       	mov    $0x20,%edi
  80120f:	ff d0                	callq  *%rax
  801211:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801215:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801219:	7f e4                	jg     8011ff <vprintfmt+0x349>
  80121b:	e9 8d 01 00 00       	jmpq   8013ad <vprintfmt+0x4f7>
  801220:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801224:	be 03 00 00 00       	mov    $0x3,%esi
  801229:	48 89 c7             	mov    %rax,%rdi
  80122c:	48 b8 af 0d 80 00 00 	movabs $0x800daf,%rax
  801233:	00 00 00 
  801236:	ff d0                	callq  *%rax
  801238:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80123c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801240:	48 85 c0             	test   %rax,%rax
  801243:	79 1d                	jns    801262 <vprintfmt+0x3ac>
  801245:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801249:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80124d:	48 89 d6             	mov    %rdx,%rsi
  801250:	bf 2d 00 00 00       	mov    $0x2d,%edi
  801255:	ff d0                	callq  *%rax
  801257:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80125b:	48 f7 d8             	neg    %rax
  80125e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801262:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  801269:	e9 d2 00 00 00       	jmpq   801340 <vprintfmt+0x48a>
  80126e:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801272:	be 03 00 00 00       	mov    $0x3,%esi
  801277:	48 89 c7             	mov    %rax,%rdi
  80127a:	48 b8 a8 0c 80 00 00 	movabs $0x800ca8,%rax
  801281:	00 00 00 
  801284:	ff d0                	callq  *%rax
  801286:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80128a:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  801291:	e9 aa 00 00 00       	jmpq   801340 <vprintfmt+0x48a>
  801296:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80129a:	be 03 00 00 00       	mov    $0x3,%esi
  80129f:	48 89 c7             	mov    %rax,%rdi
  8012a2:	48 b8 a8 0c 80 00 00 	movabs $0x800ca8,%rax
  8012a9:	00 00 00 
  8012ac:	ff d0                	callq  *%rax
  8012ae:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8012b2:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  8012b9:	e9 82 00 00 00       	jmpq   801340 <vprintfmt+0x48a>
  8012be:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8012c2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8012c6:	48 89 d6             	mov    %rdx,%rsi
  8012c9:	bf 30 00 00 00       	mov    $0x30,%edi
  8012ce:	ff d0                	callq  *%rax
  8012d0:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8012d4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8012d8:	48 89 d6             	mov    %rdx,%rsi
  8012db:	bf 78 00 00 00       	mov    $0x78,%edi
  8012e0:	ff d0                	callq  *%rax
  8012e2:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8012e5:	83 f8 30             	cmp    $0x30,%eax
  8012e8:	73 17                	jae    801301 <vprintfmt+0x44b>
  8012ea:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8012ee:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8012f1:	89 d2                	mov    %edx,%edx
  8012f3:	48 01 d0             	add    %rdx,%rax
  8012f6:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8012f9:	83 c2 08             	add    $0x8,%edx
  8012fc:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8012ff:	eb 0c                	jmp    80130d <vprintfmt+0x457>
  801301:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801305:	48 8d 50 08          	lea    0x8(%rax),%rdx
  801309:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80130d:	48 8b 00             	mov    (%rax),%rax
  801310:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801314:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  80131b:	eb 23                	jmp    801340 <vprintfmt+0x48a>
  80131d:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801321:	be 03 00 00 00       	mov    $0x3,%esi
  801326:	48 89 c7             	mov    %rax,%rdi
  801329:	48 b8 a8 0c 80 00 00 	movabs $0x800ca8,%rax
  801330:	00 00 00 
  801333:	ff d0                	callq  *%rax
  801335:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801339:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801340:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  801345:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  801348:	8b 7d dc             	mov    -0x24(%rbp),%edi
  80134b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80134f:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801353:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801357:	45 89 c1             	mov    %r8d,%r9d
  80135a:	41 89 f8             	mov    %edi,%r8d
  80135d:	48 89 c7             	mov    %rax,%rdi
  801360:	48 b8 f0 0b 80 00 00 	movabs $0x800bf0,%rax
  801367:	00 00 00 
  80136a:	ff d0                	callq  *%rax
  80136c:	eb 3f                	jmp    8013ad <vprintfmt+0x4f7>
  80136e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801372:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801376:	48 89 d6             	mov    %rdx,%rsi
  801379:	89 df                	mov    %ebx,%edi
  80137b:	ff d0                	callq  *%rax
  80137d:	eb 2e                	jmp    8013ad <vprintfmt+0x4f7>
  80137f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801383:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801387:	48 89 d6             	mov    %rdx,%rsi
  80138a:	bf 25 00 00 00       	mov    $0x25,%edi
  80138f:	ff d0                	callq  *%rax
  801391:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  801396:	eb 05                	jmp    80139d <vprintfmt+0x4e7>
  801398:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  80139d:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8013a1:	48 83 e8 01          	sub    $0x1,%rax
  8013a5:	0f b6 00             	movzbl (%rax),%eax
  8013a8:	3c 25                	cmp    $0x25,%al
  8013aa:	75 ec                	jne    801398 <vprintfmt+0x4e2>
  8013ac:	90                   	nop
  8013ad:	e9 3d fb ff ff       	jmpq   800eef <vprintfmt+0x39>
  8013b2:	90                   	nop
  8013b3:	48 83 c4 60          	add    $0x60,%rsp
  8013b7:	5b                   	pop    %rbx
  8013b8:	41 5c                	pop    %r12
  8013ba:	5d                   	pop    %rbp
  8013bb:	c3                   	retq   

00000000008013bc <printfmt>:
  8013bc:	55                   	push   %rbp
  8013bd:	48 89 e5             	mov    %rsp,%rbp
  8013c0:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  8013c7:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  8013ce:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  8013d5:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  8013dc:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8013e3:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8013ea:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8013f1:	84 c0                	test   %al,%al
  8013f3:	74 20                	je     801415 <printfmt+0x59>
  8013f5:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8013f9:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8013fd:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801401:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801405:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801409:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80140d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801411:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801415:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  80141c:	00 00 00 
  80141f:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  801426:	00 00 00 
  801429:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80142d:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801434:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80143b:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  801442:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  801449:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  801450:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  801457:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  80145e:	48 89 c7             	mov    %rax,%rdi
  801461:	48 b8 b6 0e 80 00 00 	movabs $0x800eb6,%rax
  801468:	00 00 00 
  80146b:	ff d0                	callq  *%rax
  80146d:	90                   	nop
  80146e:	c9                   	leaveq 
  80146f:	c3                   	retq   

0000000000801470 <sprintputch>:
  801470:	55                   	push   %rbp
  801471:	48 89 e5             	mov    %rsp,%rbp
  801474:	48 83 ec 10          	sub    $0x10,%rsp
  801478:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80147b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80147f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801483:	8b 40 10             	mov    0x10(%rax),%eax
  801486:	8d 50 01             	lea    0x1(%rax),%edx
  801489:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80148d:	89 50 10             	mov    %edx,0x10(%rax)
  801490:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801494:	48 8b 10             	mov    (%rax),%rdx
  801497:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80149b:	48 8b 40 08          	mov    0x8(%rax),%rax
  80149f:	48 39 c2             	cmp    %rax,%rdx
  8014a2:	73 17                	jae    8014bb <sprintputch+0x4b>
  8014a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014a8:	48 8b 00             	mov    (%rax),%rax
  8014ab:	48 8d 48 01          	lea    0x1(%rax),%rcx
  8014af:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8014b3:	48 89 0a             	mov    %rcx,(%rdx)
  8014b6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8014b9:	88 10                	mov    %dl,(%rax)
  8014bb:	90                   	nop
  8014bc:	c9                   	leaveq 
  8014bd:	c3                   	retq   

00000000008014be <vsnprintf>:
  8014be:	55                   	push   %rbp
  8014bf:	48 89 e5             	mov    %rsp,%rbp
  8014c2:	48 83 ec 50          	sub    $0x50,%rsp
  8014c6:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8014ca:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  8014cd:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  8014d1:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  8014d5:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8014d9:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  8014dd:	48 8b 0a             	mov    (%rdx),%rcx
  8014e0:	48 89 08             	mov    %rcx,(%rax)
  8014e3:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8014e7:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8014eb:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8014ef:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8014f3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8014f7:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8014fb:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  8014fe:	48 98                	cltq   
  801500:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801504:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801508:	48 01 d0             	add    %rdx,%rax
  80150b:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  80150f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  801516:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  80151b:	74 06                	je     801523 <vsnprintf+0x65>
  80151d:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801521:	7f 07                	jg     80152a <vsnprintf+0x6c>
  801523:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801528:	eb 2f                	jmp    801559 <vsnprintf+0x9b>
  80152a:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  80152e:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801532:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  801536:	48 89 c6             	mov    %rax,%rsi
  801539:	48 bf 70 14 80 00 00 	movabs $0x801470,%rdi
  801540:	00 00 00 
  801543:	48 b8 b6 0e 80 00 00 	movabs $0x800eb6,%rax
  80154a:	00 00 00 
  80154d:	ff d0                	callq  *%rax
  80154f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801553:	c6 00 00             	movb   $0x0,(%rax)
  801556:	8b 45 e0             	mov    -0x20(%rbp),%eax
  801559:	c9                   	leaveq 
  80155a:	c3                   	retq   

000000000080155b <snprintf>:
  80155b:	55                   	push   %rbp
  80155c:	48 89 e5             	mov    %rsp,%rbp
  80155f:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  801566:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80156d:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801573:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  80157a:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801581:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801588:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80158f:	84 c0                	test   %al,%al
  801591:	74 20                	je     8015b3 <snprintf+0x58>
  801593:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801597:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80159b:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80159f:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8015a3:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8015a7:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8015ab:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8015af:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8015b3:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8015ba:	00 00 00 
  8015bd:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8015c4:	00 00 00 
  8015c7:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8015cb:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8015d2:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8015d9:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8015e0:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8015e7:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8015ee:	48 8b 0a             	mov    (%rdx),%rcx
  8015f1:	48 89 08             	mov    %rcx,(%rax)
  8015f4:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8015f8:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8015fc:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801600:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801604:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80160b:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801612:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  801618:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80161f:	48 89 c7             	mov    %rax,%rdi
  801622:	48 b8 be 14 80 00 00 	movabs $0x8014be,%rax
  801629:	00 00 00 
  80162c:	ff d0                	callq  *%rax
  80162e:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801634:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80163a:	c9                   	leaveq 
  80163b:	c3                   	retq   

000000000080163c <strlen>:
  80163c:	55                   	push   %rbp
  80163d:	48 89 e5             	mov    %rsp,%rbp
  801640:	48 83 ec 18          	sub    $0x18,%rsp
  801644:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801648:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80164f:	eb 09                	jmp    80165a <strlen+0x1e>
  801651:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801655:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80165a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80165e:	0f b6 00             	movzbl (%rax),%eax
  801661:	84 c0                	test   %al,%al
  801663:	75 ec                	jne    801651 <strlen+0x15>
  801665:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801668:	c9                   	leaveq 
  801669:	c3                   	retq   

000000000080166a <strnlen>:
  80166a:	55                   	push   %rbp
  80166b:	48 89 e5             	mov    %rsp,%rbp
  80166e:	48 83 ec 20          	sub    $0x20,%rsp
  801672:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801676:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80167a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801681:	eb 0e                	jmp    801691 <strnlen+0x27>
  801683:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801687:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80168c:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801691:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801696:	74 0b                	je     8016a3 <strnlen+0x39>
  801698:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80169c:	0f b6 00             	movzbl (%rax),%eax
  80169f:	84 c0                	test   %al,%al
  8016a1:	75 e0                	jne    801683 <strnlen+0x19>
  8016a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8016a6:	c9                   	leaveq 
  8016a7:	c3                   	retq   

00000000008016a8 <strcpy>:
  8016a8:	55                   	push   %rbp
  8016a9:	48 89 e5             	mov    %rsp,%rbp
  8016ac:	48 83 ec 20          	sub    $0x20,%rsp
  8016b0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8016b4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8016b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016bc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8016c0:	90                   	nop
  8016c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016c5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8016c9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8016cd:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8016d1:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8016d5:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8016d9:	0f b6 12             	movzbl (%rdx),%edx
  8016dc:	88 10                	mov    %dl,(%rax)
  8016de:	0f b6 00             	movzbl (%rax),%eax
  8016e1:	84 c0                	test   %al,%al
  8016e3:	75 dc                	jne    8016c1 <strcpy+0x19>
  8016e5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016e9:	c9                   	leaveq 
  8016ea:	c3                   	retq   

00000000008016eb <strcat>:
  8016eb:	55                   	push   %rbp
  8016ec:	48 89 e5             	mov    %rsp,%rbp
  8016ef:	48 83 ec 20          	sub    $0x20,%rsp
  8016f3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8016f7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8016fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016ff:	48 89 c7             	mov    %rax,%rdi
  801702:	48 b8 3c 16 80 00 00 	movabs $0x80163c,%rax
  801709:	00 00 00 
  80170c:	ff d0                	callq  *%rax
  80170e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801711:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801714:	48 63 d0             	movslq %eax,%rdx
  801717:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80171b:	48 01 c2             	add    %rax,%rdx
  80171e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801722:	48 89 c6             	mov    %rax,%rsi
  801725:	48 89 d7             	mov    %rdx,%rdi
  801728:	48 b8 a8 16 80 00 00 	movabs $0x8016a8,%rax
  80172f:	00 00 00 
  801732:	ff d0                	callq  *%rax
  801734:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801738:	c9                   	leaveq 
  801739:	c3                   	retq   

000000000080173a <strncpy>:
  80173a:	55                   	push   %rbp
  80173b:	48 89 e5             	mov    %rsp,%rbp
  80173e:	48 83 ec 28          	sub    $0x28,%rsp
  801742:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801746:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80174a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80174e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801752:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801756:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80175d:	00 
  80175e:	eb 2a                	jmp    80178a <strncpy+0x50>
  801760:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801764:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801768:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80176c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801770:	0f b6 12             	movzbl (%rdx),%edx
  801773:	88 10                	mov    %dl,(%rax)
  801775:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801779:	0f b6 00             	movzbl (%rax),%eax
  80177c:	84 c0                	test   %al,%al
  80177e:	74 05                	je     801785 <strncpy+0x4b>
  801780:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801785:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80178a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80178e:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801792:	72 cc                	jb     801760 <strncpy+0x26>
  801794:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801798:	c9                   	leaveq 
  801799:	c3                   	retq   

000000000080179a <strlcpy>:
  80179a:	55                   	push   %rbp
  80179b:	48 89 e5             	mov    %rsp,%rbp
  80179e:	48 83 ec 28          	sub    $0x28,%rsp
  8017a2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8017a6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8017aa:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8017ae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017b2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8017b6:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8017bb:	74 3d                	je     8017fa <strlcpy+0x60>
  8017bd:	eb 1d                	jmp    8017dc <strlcpy+0x42>
  8017bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017c3:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8017c7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8017cb:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8017cf:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8017d3:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8017d7:	0f b6 12             	movzbl (%rdx),%edx
  8017da:	88 10                	mov    %dl,(%rax)
  8017dc:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8017e1:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8017e6:	74 0b                	je     8017f3 <strlcpy+0x59>
  8017e8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8017ec:	0f b6 00             	movzbl (%rax),%eax
  8017ef:	84 c0                	test   %al,%al
  8017f1:	75 cc                	jne    8017bf <strlcpy+0x25>
  8017f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017f7:	c6 00 00             	movb   $0x0,(%rax)
  8017fa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801802:	48 29 c2             	sub    %rax,%rdx
  801805:	48 89 d0             	mov    %rdx,%rax
  801808:	c9                   	leaveq 
  801809:	c3                   	retq   

000000000080180a <strcmp>:
  80180a:	55                   	push   %rbp
  80180b:	48 89 e5             	mov    %rsp,%rbp
  80180e:	48 83 ec 10          	sub    $0x10,%rsp
  801812:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801816:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80181a:	eb 0a                	jmp    801826 <strcmp+0x1c>
  80181c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801821:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801826:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80182a:	0f b6 00             	movzbl (%rax),%eax
  80182d:	84 c0                	test   %al,%al
  80182f:	74 12                	je     801843 <strcmp+0x39>
  801831:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801835:	0f b6 10             	movzbl (%rax),%edx
  801838:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80183c:	0f b6 00             	movzbl (%rax),%eax
  80183f:	38 c2                	cmp    %al,%dl
  801841:	74 d9                	je     80181c <strcmp+0x12>
  801843:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801847:	0f b6 00             	movzbl (%rax),%eax
  80184a:	0f b6 d0             	movzbl %al,%edx
  80184d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801851:	0f b6 00             	movzbl (%rax),%eax
  801854:	0f b6 c0             	movzbl %al,%eax
  801857:	29 c2                	sub    %eax,%edx
  801859:	89 d0                	mov    %edx,%eax
  80185b:	c9                   	leaveq 
  80185c:	c3                   	retq   

000000000080185d <strncmp>:
  80185d:	55                   	push   %rbp
  80185e:	48 89 e5             	mov    %rsp,%rbp
  801861:	48 83 ec 18          	sub    $0x18,%rsp
  801865:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801869:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80186d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801871:	eb 0f                	jmp    801882 <strncmp+0x25>
  801873:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801878:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80187d:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801882:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801887:	74 1d                	je     8018a6 <strncmp+0x49>
  801889:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80188d:	0f b6 00             	movzbl (%rax),%eax
  801890:	84 c0                	test   %al,%al
  801892:	74 12                	je     8018a6 <strncmp+0x49>
  801894:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801898:	0f b6 10             	movzbl (%rax),%edx
  80189b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80189f:	0f b6 00             	movzbl (%rax),%eax
  8018a2:	38 c2                	cmp    %al,%dl
  8018a4:	74 cd                	je     801873 <strncmp+0x16>
  8018a6:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8018ab:	75 07                	jne    8018b4 <strncmp+0x57>
  8018ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8018b2:	eb 18                	jmp    8018cc <strncmp+0x6f>
  8018b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018b8:	0f b6 00             	movzbl (%rax),%eax
  8018bb:	0f b6 d0             	movzbl %al,%edx
  8018be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018c2:	0f b6 00             	movzbl (%rax),%eax
  8018c5:	0f b6 c0             	movzbl %al,%eax
  8018c8:	29 c2                	sub    %eax,%edx
  8018ca:	89 d0                	mov    %edx,%eax
  8018cc:	c9                   	leaveq 
  8018cd:	c3                   	retq   

00000000008018ce <strchr>:
  8018ce:	55                   	push   %rbp
  8018cf:	48 89 e5             	mov    %rsp,%rbp
  8018d2:	48 83 ec 10          	sub    $0x10,%rsp
  8018d6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8018da:	89 f0                	mov    %esi,%eax
  8018dc:	88 45 f4             	mov    %al,-0xc(%rbp)
  8018df:	eb 17                	jmp    8018f8 <strchr+0x2a>
  8018e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018e5:	0f b6 00             	movzbl (%rax),%eax
  8018e8:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8018eb:	75 06                	jne    8018f3 <strchr+0x25>
  8018ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018f1:	eb 15                	jmp    801908 <strchr+0x3a>
  8018f3:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8018f8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018fc:	0f b6 00             	movzbl (%rax),%eax
  8018ff:	84 c0                	test   %al,%al
  801901:	75 de                	jne    8018e1 <strchr+0x13>
  801903:	b8 00 00 00 00       	mov    $0x0,%eax
  801908:	c9                   	leaveq 
  801909:	c3                   	retq   

000000000080190a <strfind>:
  80190a:	55                   	push   %rbp
  80190b:	48 89 e5             	mov    %rsp,%rbp
  80190e:	48 83 ec 10          	sub    $0x10,%rsp
  801912:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801916:	89 f0                	mov    %esi,%eax
  801918:	88 45 f4             	mov    %al,-0xc(%rbp)
  80191b:	eb 11                	jmp    80192e <strfind+0x24>
  80191d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801921:	0f b6 00             	movzbl (%rax),%eax
  801924:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801927:	74 12                	je     80193b <strfind+0x31>
  801929:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80192e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801932:	0f b6 00             	movzbl (%rax),%eax
  801935:	84 c0                	test   %al,%al
  801937:	75 e4                	jne    80191d <strfind+0x13>
  801939:	eb 01                	jmp    80193c <strfind+0x32>
  80193b:	90                   	nop
  80193c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801940:	c9                   	leaveq 
  801941:	c3                   	retq   

0000000000801942 <memset>:
  801942:	55                   	push   %rbp
  801943:	48 89 e5             	mov    %rsp,%rbp
  801946:	48 83 ec 18          	sub    $0x18,%rsp
  80194a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80194e:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801951:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801955:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80195a:	75 06                	jne    801962 <memset+0x20>
  80195c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801960:	eb 69                	jmp    8019cb <memset+0x89>
  801962:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801966:	83 e0 03             	and    $0x3,%eax
  801969:	48 85 c0             	test   %rax,%rax
  80196c:	75 48                	jne    8019b6 <memset+0x74>
  80196e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801972:	83 e0 03             	and    $0x3,%eax
  801975:	48 85 c0             	test   %rax,%rax
  801978:	75 3c                	jne    8019b6 <memset+0x74>
  80197a:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801981:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801984:	c1 e0 18             	shl    $0x18,%eax
  801987:	89 c2                	mov    %eax,%edx
  801989:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80198c:	c1 e0 10             	shl    $0x10,%eax
  80198f:	09 c2                	or     %eax,%edx
  801991:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801994:	c1 e0 08             	shl    $0x8,%eax
  801997:	09 d0                	or     %edx,%eax
  801999:	09 45 f4             	or     %eax,-0xc(%rbp)
  80199c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019a0:	48 c1 e8 02          	shr    $0x2,%rax
  8019a4:	48 89 c1             	mov    %rax,%rcx
  8019a7:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8019ab:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8019ae:	48 89 d7             	mov    %rdx,%rdi
  8019b1:	fc                   	cld    
  8019b2:	f3 ab                	rep stos %eax,%es:(%rdi)
  8019b4:	eb 11                	jmp    8019c7 <memset+0x85>
  8019b6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8019ba:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8019bd:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8019c1:	48 89 d7             	mov    %rdx,%rdi
  8019c4:	fc                   	cld    
  8019c5:	f3 aa                	rep stos %al,%es:(%rdi)
  8019c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8019cb:	c9                   	leaveq 
  8019cc:	c3                   	retq   

00000000008019cd <memmove>:
  8019cd:	55                   	push   %rbp
  8019ce:	48 89 e5             	mov    %rsp,%rbp
  8019d1:	48 83 ec 28          	sub    $0x28,%rsp
  8019d5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8019d9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8019dd:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8019e1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8019e5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8019e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019ed:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8019f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8019f5:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8019f9:	0f 83 88 00 00 00    	jae    801a87 <memmove+0xba>
  8019ff:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801a03:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a07:	48 01 d0             	add    %rdx,%rax
  801a0a:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801a0e:	76 77                	jbe    801a87 <memmove+0xba>
  801a10:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a14:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801a18:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a1c:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801a20:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a24:	83 e0 03             	and    $0x3,%eax
  801a27:	48 85 c0             	test   %rax,%rax
  801a2a:	75 3b                	jne    801a67 <memmove+0x9a>
  801a2c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a30:	83 e0 03             	and    $0x3,%eax
  801a33:	48 85 c0             	test   %rax,%rax
  801a36:	75 2f                	jne    801a67 <memmove+0x9a>
  801a38:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a3c:	83 e0 03             	and    $0x3,%eax
  801a3f:	48 85 c0             	test   %rax,%rax
  801a42:	75 23                	jne    801a67 <memmove+0x9a>
  801a44:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a48:	48 83 e8 04          	sub    $0x4,%rax
  801a4c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801a50:	48 83 ea 04          	sub    $0x4,%rdx
  801a54:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801a58:	48 c1 e9 02          	shr    $0x2,%rcx
  801a5c:	48 89 c7             	mov    %rax,%rdi
  801a5f:	48 89 d6             	mov    %rdx,%rsi
  801a62:	fd                   	std    
  801a63:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801a65:	eb 1d                	jmp    801a84 <memmove+0xb7>
  801a67:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a6b:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801a6f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a73:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801a77:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a7b:	48 89 d7             	mov    %rdx,%rdi
  801a7e:	48 89 c1             	mov    %rax,%rcx
  801a81:	fd                   	std    
  801a82:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801a84:	fc                   	cld    
  801a85:	eb 57                	jmp    801ade <memmove+0x111>
  801a87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a8b:	83 e0 03             	and    $0x3,%eax
  801a8e:	48 85 c0             	test   %rax,%rax
  801a91:	75 36                	jne    801ac9 <memmove+0xfc>
  801a93:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a97:	83 e0 03             	and    $0x3,%eax
  801a9a:	48 85 c0             	test   %rax,%rax
  801a9d:	75 2a                	jne    801ac9 <memmove+0xfc>
  801a9f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801aa3:	83 e0 03             	and    $0x3,%eax
  801aa6:	48 85 c0             	test   %rax,%rax
  801aa9:	75 1e                	jne    801ac9 <memmove+0xfc>
  801aab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801aaf:	48 c1 e8 02          	shr    $0x2,%rax
  801ab3:	48 89 c1             	mov    %rax,%rcx
  801ab6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801aba:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801abe:	48 89 c7             	mov    %rax,%rdi
  801ac1:	48 89 d6             	mov    %rdx,%rsi
  801ac4:	fc                   	cld    
  801ac5:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801ac7:	eb 15                	jmp    801ade <memmove+0x111>
  801ac9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801acd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801ad1:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801ad5:	48 89 c7             	mov    %rax,%rdi
  801ad8:	48 89 d6             	mov    %rdx,%rsi
  801adb:	fc                   	cld    
  801adc:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801ade:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ae2:	c9                   	leaveq 
  801ae3:	c3                   	retq   

0000000000801ae4 <memcpy>:
  801ae4:	55                   	push   %rbp
  801ae5:	48 89 e5             	mov    %rsp,%rbp
  801ae8:	48 83 ec 18          	sub    $0x18,%rsp
  801aec:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801af0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801af4:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801af8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801afc:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801b00:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b04:	48 89 ce             	mov    %rcx,%rsi
  801b07:	48 89 c7             	mov    %rax,%rdi
  801b0a:	48 b8 cd 19 80 00 00 	movabs $0x8019cd,%rax
  801b11:	00 00 00 
  801b14:	ff d0                	callq  *%rax
  801b16:	c9                   	leaveq 
  801b17:	c3                   	retq   

0000000000801b18 <memcmp>:
  801b18:	55                   	push   %rbp
  801b19:	48 89 e5             	mov    %rsp,%rbp
  801b1c:	48 83 ec 28          	sub    $0x28,%rsp
  801b20:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801b24:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801b28:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801b2c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b30:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801b34:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801b38:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801b3c:	eb 36                	jmp    801b74 <memcmp+0x5c>
  801b3e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b42:	0f b6 10             	movzbl (%rax),%edx
  801b45:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801b49:	0f b6 00             	movzbl (%rax),%eax
  801b4c:	38 c2                	cmp    %al,%dl
  801b4e:	74 1a                	je     801b6a <memcmp+0x52>
  801b50:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b54:	0f b6 00             	movzbl (%rax),%eax
  801b57:	0f b6 d0             	movzbl %al,%edx
  801b5a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801b5e:	0f b6 00             	movzbl (%rax),%eax
  801b61:	0f b6 c0             	movzbl %al,%eax
  801b64:	29 c2                	sub    %eax,%edx
  801b66:	89 d0                	mov    %edx,%eax
  801b68:	eb 20                	jmp    801b8a <memcmp+0x72>
  801b6a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801b6f:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801b74:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b78:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801b7c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801b80:	48 85 c0             	test   %rax,%rax
  801b83:	75 b9                	jne    801b3e <memcmp+0x26>
  801b85:	b8 00 00 00 00       	mov    $0x0,%eax
  801b8a:	c9                   	leaveq 
  801b8b:	c3                   	retq   

0000000000801b8c <memfind>:
  801b8c:	55                   	push   %rbp
  801b8d:	48 89 e5             	mov    %rsp,%rbp
  801b90:	48 83 ec 28          	sub    $0x28,%rsp
  801b94:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801b98:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801b9b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801b9f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801ba3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ba7:	48 01 d0             	add    %rdx,%rax
  801baa:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801bae:	eb 13                	jmp    801bc3 <memfind+0x37>
  801bb0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bb4:	0f b6 00             	movzbl (%rax),%eax
  801bb7:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801bba:	38 d0                	cmp    %dl,%al
  801bbc:	74 11                	je     801bcf <memfind+0x43>
  801bbe:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801bc3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bc7:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801bcb:	72 e3                	jb     801bb0 <memfind+0x24>
  801bcd:	eb 01                	jmp    801bd0 <memfind+0x44>
  801bcf:	90                   	nop
  801bd0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bd4:	c9                   	leaveq 
  801bd5:	c3                   	retq   

0000000000801bd6 <strtol>:
  801bd6:	55                   	push   %rbp
  801bd7:	48 89 e5             	mov    %rsp,%rbp
  801bda:	48 83 ec 38          	sub    $0x38,%rsp
  801bde:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801be2:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801be6:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801be9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801bf0:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801bf7:	00 
  801bf8:	eb 05                	jmp    801bff <strtol+0x29>
  801bfa:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801bff:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c03:	0f b6 00             	movzbl (%rax),%eax
  801c06:	3c 20                	cmp    $0x20,%al
  801c08:	74 f0                	je     801bfa <strtol+0x24>
  801c0a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c0e:	0f b6 00             	movzbl (%rax),%eax
  801c11:	3c 09                	cmp    $0x9,%al
  801c13:	74 e5                	je     801bfa <strtol+0x24>
  801c15:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c19:	0f b6 00             	movzbl (%rax),%eax
  801c1c:	3c 2b                	cmp    $0x2b,%al
  801c1e:	75 07                	jne    801c27 <strtol+0x51>
  801c20:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801c25:	eb 17                	jmp    801c3e <strtol+0x68>
  801c27:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c2b:	0f b6 00             	movzbl (%rax),%eax
  801c2e:	3c 2d                	cmp    $0x2d,%al
  801c30:	75 0c                	jne    801c3e <strtol+0x68>
  801c32:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801c37:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801c3e:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801c42:	74 06                	je     801c4a <strtol+0x74>
  801c44:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801c48:	75 28                	jne    801c72 <strtol+0x9c>
  801c4a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c4e:	0f b6 00             	movzbl (%rax),%eax
  801c51:	3c 30                	cmp    $0x30,%al
  801c53:	75 1d                	jne    801c72 <strtol+0x9c>
  801c55:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c59:	48 83 c0 01          	add    $0x1,%rax
  801c5d:	0f b6 00             	movzbl (%rax),%eax
  801c60:	3c 78                	cmp    $0x78,%al
  801c62:	75 0e                	jne    801c72 <strtol+0x9c>
  801c64:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801c69:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801c70:	eb 2c                	jmp    801c9e <strtol+0xc8>
  801c72:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801c76:	75 19                	jne    801c91 <strtol+0xbb>
  801c78:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c7c:	0f b6 00             	movzbl (%rax),%eax
  801c7f:	3c 30                	cmp    $0x30,%al
  801c81:	75 0e                	jne    801c91 <strtol+0xbb>
  801c83:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801c88:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801c8f:	eb 0d                	jmp    801c9e <strtol+0xc8>
  801c91:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801c95:	75 07                	jne    801c9e <strtol+0xc8>
  801c97:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801c9e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ca2:	0f b6 00             	movzbl (%rax),%eax
  801ca5:	3c 2f                	cmp    $0x2f,%al
  801ca7:	7e 1d                	jle    801cc6 <strtol+0xf0>
  801ca9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cad:	0f b6 00             	movzbl (%rax),%eax
  801cb0:	3c 39                	cmp    $0x39,%al
  801cb2:	7f 12                	jg     801cc6 <strtol+0xf0>
  801cb4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cb8:	0f b6 00             	movzbl (%rax),%eax
  801cbb:	0f be c0             	movsbl %al,%eax
  801cbe:	83 e8 30             	sub    $0x30,%eax
  801cc1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801cc4:	eb 4e                	jmp    801d14 <strtol+0x13e>
  801cc6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cca:	0f b6 00             	movzbl (%rax),%eax
  801ccd:	3c 60                	cmp    $0x60,%al
  801ccf:	7e 1d                	jle    801cee <strtol+0x118>
  801cd1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cd5:	0f b6 00             	movzbl (%rax),%eax
  801cd8:	3c 7a                	cmp    $0x7a,%al
  801cda:	7f 12                	jg     801cee <strtol+0x118>
  801cdc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ce0:	0f b6 00             	movzbl (%rax),%eax
  801ce3:	0f be c0             	movsbl %al,%eax
  801ce6:	83 e8 57             	sub    $0x57,%eax
  801ce9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801cec:	eb 26                	jmp    801d14 <strtol+0x13e>
  801cee:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cf2:	0f b6 00             	movzbl (%rax),%eax
  801cf5:	3c 40                	cmp    $0x40,%al
  801cf7:	7e 47                	jle    801d40 <strtol+0x16a>
  801cf9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cfd:	0f b6 00             	movzbl (%rax),%eax
  801d00:	3c 5a                	cmp    $0x5a,%al
  801d02:	7f 3c                	jg     801d40 <strtol+0x16a>
  801d04:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d08:	0f b6 00             	movzbl (%rax),%eax
  801d0b:	0f be c0             	movsbl %al,%eax
  801d0e:	83 e8 37             	sub    $0x37,%eax
  801d11:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801d14:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801d17:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801d1a:	7d 23                	jge    801d3f <strtol+0x169>
  801d1c:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801d21:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801d24:	48 98                	cltq   
  801d26:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801d2b:	48 89 c2             	mov    %rax,%rdx
  801d2e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801d31:	48 98                	cltq   
  801d33:	48 01 d0             	add    %rdx,%rax
  801d36:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801d3a:	e9 5f ff ff ff       	jmpq   801c9e <strtol+0xc8>
  801d3f:	90                   	nop
  801d40:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801d45:	74 0b                	je     801d52 <strtol+0x17c>
  801d47:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801d4b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801d4f:	48 89 10             	mov    %rdx,(%rax)
  801d52:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801d56:	74 09                	je     801d61 <strtol+0x18b>
  801d58:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d5c:	48 f7 d8             	neg    %rax
  801d5f:	eb 04                	jmp    801d65 <strtol+0x18f>
  801d61:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d65:	c9                   	leaveq 
  801d66:	c3                   	retq   

0000000000801d67 <strstr>:
  801d67:	55                   	push   %rbp
  801d68:	48 89 e5             	mov    %rsp,%rbp
  801d6b:	48 83 ec 30          	sub    $0x30,%rsp
  801d6f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801d73:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801d77:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801d7b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801d7f:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801d83:	0f b6 00             	movzbl (%rax),%eax
  801d86:	88 45 ff             	mov    %al,-0x1(%rbp)
  801d89:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801d8d:	75 06                	jne    801d95 <strstr+0x2e>
  801d8f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d93:	eb 6b                	jmp    801e00 <strstr+0x99>
  801d95:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801d99:	48 89 c7             	mov    %rax,%rdi
  801d9c:	48 b8 3c 16 80 00 00 	movabs $0x80163c,%rax
  801da3:	00 00 00 
  801da6:	ff d0                	callq  *%rax
  801da8:	48 98                	cltq   
  801daa:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801dae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801db2:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801db6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801dba:	0f b6 00             	movzbl (%rax),%eax
  801dbd:	88 45 ef             	mov    %al,-0x11(%rbp)
  801dc0:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801dc4:	75 07                	jne    801dcd <strstr+0x66>
  801dc6:	b8 00 00 00 00       	mov    $0x0,%eax
  801dcb:	eb 33                	jmp    801e00 <strstr+0x99>
  801dcd:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801dd1:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801dd4:	75 d8                	jne    801dae <strstr+0x47>
  801dd6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801dda:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801dde:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801de2:	48 89 ce             	mov    %rcx,%rsi
  801de5:	48 89 c7             	mov    %rax,%rdi
  801de8:	48 b8 5d 18 80 00 00 	movabs $0x80185d,%rax
  801def:	00 00 00 
  801df2:	ff d0                	callq  *%rax
  801df4:	85 c0                	test   %eax,%eax
  801df6:	75 b6                	jne    801dae <strstr+0x47>
  801df8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801dfc:	48 83 e8 01          	sub    $0x1,%rax
  801e00:	c9                   	leaveq 
  801e01:	c3                   	retq   

0000000000801e02 <syscall>:
  801e02:	55                   	push   %rbp
  801e03:	48 89 e5             	mov    %rsp,%rbp
  801e06:	53                   	push   %rbx
  801e07:	48 83 ec 48          	sub    $0x48,%rsp
  801e0b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801e0e:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801e11:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801e15:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801e19:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801e1d:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801e21:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801e24:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801e28:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801e2c:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801e30:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801e34:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801e38:	4c 89 c3             	mov    %r8,%rbx
  801e3b:	cd 30                	int    $0x30
  801e3d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801e41:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801e45:	74 3e                	je     801e85 <syscall+0x83>
  801e47:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801e4c:	7e 37                	jle    801e85 <syscall+0x83>
  801e4e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801e52:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801e55:	49 89 d0             	mov    %rdx,%r8
  801e58:	89 c1                	mov    %eax,%ecx
  801e5a:	48 ba 48 5e 80 00 00 	movabs $0x805e48,%rdx
  801e61:	00 00 00 
  801e64:	be 24 00 00 00       	mov    $0x24,%esi
  801e69:	48 bf 65 5e 80 00 00 	movabs $0x805e65,%rdi
  801e70:	00 00 00 
  801e73:	b8 00 00 00 00       	mov    $0x0,%eax
  801e78:	49 b9 de 08 80 00 00 	movabs $0x8008de,%r9
  801e7f:	00 00 00 
  801e82:	41 ff d1             	callq  *%r9
  801e85:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e89:	48 83 c4 48          	add    $0x48,%rsp
  801e8d:	5b                   	pop    %rbx
  801e8e:	5d                   	pop    %rbp
  801e8f:	c3                   	retq   

0000000000801e90 <sys_cputs>:
  801e90:	55                   	push   %rbp
  801e91:	48 89 e5             	mov    %rsp,%rbp
  801e94:	48 83 ec 10          	sub    $0x10,%rsp
  801e98:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e9c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ea0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ea4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ea8:	48 83 ec 08          	sub    $0x8,%rsp
  801eac:	6a 00                	pushq  $0x0
  801eae:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801eb4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801eba:	48 89 d1             	mov    %rdx,%rcx
  801ebd:	48 89 c2             	mov    %rax,%rdx
  801ec0:	be 00 00 00 00       	mov    $0x0,%esi
  801ec5:	bf 00 00 00 00       	mov    $0x0,%edi
  801eca:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  801ed1:	00 00 00 
  801ed4:	ff d0                	callq  *%rax
  801ed6:	48 83 c4 10          	add    $0x10,%rsp
  801eda:	90                   	nop
  801edb:	c9                   	leaveq 
  801edc:	c3                   	retq   

0000000000801edd <sys_cgetc>:
  801edd:	55                   	push   %rbp
  801ede:	48 89 e5             	mov    %rsp,%rbp
  801ee1:	48 83 ec 08          	sub    $0x8,%rsp
  801ee5:	6a 00                	pushq  $0x0
  801ee7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801eed:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ef3:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ef8:	ba 00 00 00 00       	mov    $0x0,%edx
  801efd:	be 00 00 00 00       	mov    $0x0,%esi
  801f02:	bf 01 00 00 00       	mov    $0x1,%edi
  801f07:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  801f0e:	00 00 00 
  801f11:	ff d0                	callq  *%rax
  801f13:	48 83 c4 10          	add    $0x10,%rsp
  801f17:	c9                   	leaveq 
  801f18:	c3                   	retq   

0000000000801f19 <sys_env_destroy>:
  801f19:	55                   	push   %rbp
  801f1a:	48 89 e5             	mov    %rsp,%rbp
  801f1d:	48 83 ec 10          	sub    $0x10,%rsp
  801f21:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f24:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f27:	48 98                	cltq   
  801f29:	48 83 ec 08          	sub    $0x8,%rsp
  801f2d:	6a 00                	pushq  $0x0
  801f2f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f35:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f3b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f40:	48 89 c2             	mov    %rax,%rdx
  801f43:	be 01 00 00 00       	mov    $0x1,%esi
  801f48:	bf 03 00 00 00       	mov    $0x3,%edi
  801f4d:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  801f54:	00 00 00 
  801f57:	ff d0                	callq  *%rax
  801f59:	48 83 c4 10          	add    $0x10,%rsp
  801f5d:	c9                   	leaveq 
  801f5e:	c3                   	retq   

0000000000801f5f <sys_getenvid>:
  801f5f:	55                   	push   %rbp
  801f60:	48 89 e5             	mov    %rsp,%rbp
  801f63:	48 83 ec 08          	sub    $0x8,%rsp
  801f67:	6a 00                	pushq  $0x0
  801f69:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f6f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f75:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f7a:	ba 00 00 00 00       	mov    $0x0,%edx
  801f7f:	be 00 00 00 00       	mov    $0x0,%esi
  801f84:	bf 02 00 00 00       	mov    $0x2,%edi
  801f89:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  801f90:	00 00 00 
  801f93:	ff d0                	callq  *%rax
  801f95:	48 83 c4 10          	add    $0x10,%rsp
  801f99:	c9                   	leaveq 
  801f9a:	c3                   	retq   

0000000000801f9b <sys_yield>:
  801f9b:	55                   	push   %rbp
  801f9c:	48 89 e5             	mov    %rsp,%rbp
  801f9f:	48 83 ec 08          	sub    $0x8,%rsp
  801fa3:	6a 00                	pushq  $0x0
  801fa5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fab:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fb1:	b9 00 00 00 00       	mov    $0x0,%ecx
  801fb6:	ba 00 00 00 00       	mov    $0x0,%edx
  801fbb:	be 00 00 00 00       	mov    $0x0,%esi
  801fc0:	bf 0b 00 00 00       	mov    $0xb,%edi
  801fc5:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  801fcc:	00 00 00 
  801fcf:	ff d0                	callq  *%rax
  801fd1:	48 83 c4 10          	add    $0x10,%rsp
  801fd5:	90                   	nop
  801fd6:	c9                   	leaveq 
  801fd7:	c3                   	retq   

0000000000801fd8 <sys_page_alloc>:
  801fd8:	55                   	push   %rbp
  801fd9:	48 89 e5             	mov    %rsp,%rbp
  801fdc:	48 83 ec 10          	sub    $0x10,%rsp
  801fe0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801fe3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801fe7:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801fea:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801fed:	48 63 c8             	movslq %eax,%rcx
  801ff0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ff4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ff7:	48 98                	cltq   
  801ff9:	48 83 ec 08          	sub    $0x8,%rsp
  801ffd:	6a 00                	pushq  $0x0
  801fff:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802005:	49 89 c8             	mov    %rcx,%r8
  802008:	48 89 d1             	mov    %rdx,%rcx
  80200b:	48 89 c2             	mov    %rax,%rdx
  80200e:	be 01 00 00 00       	mov    $0x1,%esi
  802013:	bf 04 00 00 00       	mov    $0x4,%edi
  802018:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  80201f:	00 00 00 
  802022:	ff d0                	callq  *%rax
  802024:	48 83 c4 10          	add    $0x10,%rsp
  802028:	c9                   	leaveq 
  802029:	c3                   	retq   

000000000080202a <sys_page_map>:
  80202a:	55                   	push   %rbp
  80202b:	48 89 e5             	mov    %rsp,%rbp
  80202e:	48 83 ec 20          	sub    $0x20,%rsp
  802032:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802035:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802039:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80203c:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  802040:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802044:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802047:	48 63 c8             	movslq %eax,%rcx
  80204a:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  80204e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802051:	48 63 f0             	movslq %eax,%rsi
  802054:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802058:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80205b:	48 98                	cltq   
  80205d:	48 83 ec 08          	sub    $0x8,%rsp
  802061:	51                   	push   %rcx
  802062:	49 89 f9             	mov    %rdi,%r9
  802065:	49 89 f0             	mov    %rsi,%r8
  802068:	48 89 d1             	mov    %rdx,%rcx
  80206b:	48 89 c2             	mov    %rax,%rdx
  80206e:	be 01 00 00 00       	mov    $0x1,%esi
  802073:	bf 05 00 00 00       	mov    $0x5,%edi
  802078:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  80207f:	00 00 00 
  802082:	ff d0                	callq  *%rax
  802084:	48 83 c4 10          	add    $0x10,%rsp
  802088:	c9                   	leaveq 
  802089:	c3                   	retq   

000000000080208a <sys_page_unmap>:
  80208a:	55                   	push   %rbp
  80208b:	48 89 e5             	mov    %rsp,%rbp
  80208e:	48 83 ec 10          	sub    $0x10,%rsp
  802092:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802095:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802099:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80209d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020a0:	48 98                	cltq   
  8020a2:	48 83 ec 08          	sub    $0x8,%rsp
  8020a6:	6a 00                	pushq  $0x0
  8020a8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8020ae:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8020b4:	48 89 d1             	mov    %rdx,%rcx
  8020b7:	48 89 c2             	mov    %rax,%rdx
  8020ba:	be 01 00 00 00       	mov    $0x1,%esi
  8020bf:	bf 06 00 00 00       	mov    $0x6,%edi
  8020c4:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  8020cb:	00 00 00 
  8020ce:	ff d0                	callq  *%rax
  8020d0:	48 83 c4 10          	add    $0x10,%rsp
  8020d4:	c9                   	leaveq 
  8020d5:	c3                   	retq   

00000000008020d6 <sys_env_set_status>:
  8020d6:	55                   	push   %rbp
  8020d7:	48 89 e5             	mov    %rsp,%rbp
  8020da:	48 83 ec 10          	sub    $0x10,%rsp
  8020de:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8020e1:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8020e4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020e7:	48 63 d0             	movslq %eax,%rdx
  8020ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020ed:	48 98                	cltq   
  8020ef:	48 83 ec 08          	sub    $0x8,%rsp
  8020f3:	6a 00                	pushq  $0x0
  8020f5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8020fb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802101:	48 89 d1             	mov    %rdx,%rcx
  802104:	48 89 c2             	mov    %rax,%rdx
  802107:	be 01 00 00 00       	mov    $0x1,%esi
  80210c:	bf 08 00 00 00       	mov    $0x8,%edi
  802111:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  802118:	00 00 00 
  80211b:	ff d0                	callq  *%rax
  80211d:	48 83 c4 10          	add    $0x10,%rsp
  802121:	c9                   	leaveq 
  802122:	c3                   	retq   

0000000000802123 <sys_env_set_trapframe>:
  802123:	55                   	push   %rbp
  802124:	48 89 e5             	mov    %rsp,%rbp
  802127:	48 83 ec 10          	sub    $0x10,%rsp
  80212b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80212e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802132:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802136:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802139:	48 98                	cltq   
  80213b:	48 83 ec 08          	sub    $0x8,%rsp
  80213f:	6a 00                	pushq  $0x0
  802141:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802147:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80214d:	48 89 d1             	mov    %rdx,%rcx
  802150:	48 89 c2             	mov    %rax,%rdx
  802153:	be 01 00 00 00       	mov    $0x1,%esi
  802158:	bf 09 00 00 00       	mov    $0x9,%edi
  80215d:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  802164:	00 00 00 
  802167:	ff d0                	callq  *%rax
  802169:	48 83 c4 10          	add    $0x10,%rsp
  80216d:	c9                   	leaveq 
  80216e:	c3                   	retq   

000000000080216f <sys_env_set_pgfault_upcall>:
  80216f:	55                   	push   %rbp
  802170:	48 89 e5             	mov    %rsp,%rbp
  802173:	48 83 ec 10          	sub    $0x10,%rsp
  802177:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80217a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80217e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802182:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802185:	48 98                	cltq   
  802187:	48 83 ec 08          	sub    $0x8,%rsp
  80218b:	6a 00                	pushq  $0x0
  80218d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802193:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802199:	48 89 d1             	mov    %rdx,%rcx
  80219c:	48 89 c2             	mov    %rax,%rdx
  80219f:	be 01 00 00 00       	mov    $0x1,%esi
  8021a4:	bf 0a 00 00 00       	mov    $0xa,%edi
  8021a9:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  8021b0:	00 00 00 
  8021b3:	ff d0                	callq  *%rax
  8021b5:	48 83 c4 10          	add    $0x10,%rsp
  8021b9:	c9                   	leaveq 
  8021ba:	c3                   	retq   

00000000008021bb <sys_ipc_try_send>:
  8021bb:	55                   	push   %rbp
  8021bc:	48 89 e5             	mov    %rsp,%rbp
  8021bf:	48 83 ec 20          	sub    $0x20,%rsp
  8021c3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8021c6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8021ca:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8021ce:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  8021d1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8021d4:	48 63 f0             	movslq %eax,%rsi
  8021d7:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8021db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021de:	48 98                	cltq   
  8021e0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8021e4:	48 83 ec 08          	sub    $0x8,%rsp
  8021e8:	6a 00                	pushq  $0x0
  8021ea:	49 89 f1             	mov    %rsi,%r9
  8021ed:	49 89 c8             	mov    %rcx,%r8
  8021f0:	48 89 d1             	mov    %rdx,%rcx
  8021f3:	48 89 c2             	mov    %rax,%rdx
  8021f6:	be 00 00 00 00       	mov    $0x0,%esi
  8021fb:	bf 0c 00 00 00       	mov    $0xc,%edi
  802200:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  802207:	00 00 00 
  80220a:	ff d0                	callq  *%rax
  80220c:	48 83 c4 10          	add    $0x10,%rsp
  802210:	c9                   	leaveq 
  802211:	c3                   	retq   

0000000000802212 <sys_ipc_recv>:
  802212:	55                   	push   %rbp
  802213:	48 89 e5             	mov    %rsp,%rbp
  802216:	48 83 ec 10          	sub    $0x10,%rsp
  80221a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80221e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802222:	48 83 ec 08          	sub    $0x8,%rsp
  802226:	6a 00                	pushq  $0x0
  802228:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80222e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802234:	b9 00 00 00 00       	mov    $0x0,%ecx
  802239:	48 89 c2             	mov    %rax,%rdx
  80223c:	be 01 00 00 00       	mov    $0x1,%esi
  802241:	bf 0d 00 00 00       	mov    $0xd,%edi
  802246:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  80224d:	00 00 00 
  802250:	ff d0                	callq  *%rax
  802252:	48 83 c4 10          	add    $0x10,%rsp
  802256:	c9                   	leaveq 
  802257:	c3                   	retq   

0000000000802258 <sys_time_msec>:
  802258:	55                   	push   %rbp
  802259:	48 89 e5             	mov    %rsp,%rbp
  80225c:	48 83 ec 08          	sub    $0x8,%rsp
  802260:	6a 00                	pushq  $0x0
  802262:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802268:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80226e:	b9 00 00 00 00       	mov    $0x0,%ecx
  802273:	ba 00 00 00 00       	mov    $0x0,%edx
  802278:	be 00 00 00 00       	mov    $0x0,%esi
  80227d:	bf 0e 00 00 00       	mov    $0xe,%edi
  802282:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  802289:	00 00 00 
  80228c:	ff d0                	callq  *%rax
  80228e:	48 83 c4 10          	add    $0x10,%rsp
  802292:	c9                   	leaveq 
  802293:	c3                   	retq   

0000000000802294 <sys_net_transmit>:
  802294:	55                   	push   %rbp
  802295:	48 89 e5             	mov    %rsp,%rbp
  802298:	48 83 ec 10          	sub    $0x10,%rsp
  80229c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8022a0:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8022a3:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8022a6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022aa:	48 83 ec 08          	sub    $0x8,%rsp
  8022ae:	6a 00                	pushq  $0x0
  8022b0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8022b6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8022bc:	48 89 d1             	mov    %rdx,%rcx
  8022bf:	48 89 c2             	mov    %rax,%rdx
  8022c2:	be 00 00 00 00       	mov    $0x0,%esi
  8022c7:	bf 0f 00 00 00       	mov    $0xf,%edi
  8022cc:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  8022d3:	00 00 00 
  8022d6:	ff d0                	callq  *%rax
  8022d8:	48 83 c4 10          	add    $0x10,%rsp
  8022dc:	c9                   	leaveq 
  8022dd:	c3                   	retq   

00000000008022de <sys_net_receive>:
  8022de:	55                   	push   %rbp
  8022df:	48 89 e5             	mov    %rsp,%rbp
  8022e2:	48 83 ec 10          	sub    $0x10,%rsp
  8022e6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8022ea:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8022ed:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8022f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022f4:	48 83 ec 08          	sub    $0x8,%rsp
  8022f8:	6a 00                	pushq  $0x0
  8022fa:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802300:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802306:	48 89 d1             	mov    %rdx,%rcx
  802309:	48 89 c2             	mov    %rax,%rdx
  80230c:	be 00 00 00 00       	mov    $0x0,%esi
  802311:	bf 10 00 00 00       	mov    $0x10,%edi
  802316:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  80231d:	00 00 00 
  802320:	ff d0                	callq  *%rax
  802322:	48 83 c4 10          	add    $0x10,%rsp
  802326:	c9                   	leaveq 
  802327:	c3                   	retq   

0000000000802328 <sys_ept_map>:
  802328:	55                   	push   %rbp
  802329:	48 89 e5             	mov    %rsp,%rbp
  80232c:	48 83 ec 20          	sub    $0x20,%rsp
  802330:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802333:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802337:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80233a:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  80233e:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802342:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802345:	48 63 c8             	movslq %eax,%rcx
  802348:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  80234c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80234f:	48 63 f0             	movslq %eax,%rsi
  802352:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802356:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802359:	48 98                	cltq   
  80235b:	48 83 ec 08          	sub    $0x8,%rsp
  80235f:	51                   	push   %rcx
  802360:	49 89 f9             	mov    %rdi,%r9
  802363:	49 89 f0             	mov    %rsi,%r8
  802366:	48 89 d1             	mov    %rdx,%rcx
  802369:	48 89 c2             	mov    %rax,%rdx
  80236c:	be 00 00 00 00       	mov    $0x0,%esi
  802371:	bf 11 00 00 00       	mov    $0x11,%edi
  802376:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  80237d:	00 00 00 
  802380:	ff d0                	callq  *%rax
  802382:	48 83 c4 10          	add    $0x10,%rsp
  802386:	c9                   	leaveq 
  802387:	c3                   	retq   

0000000000802388 <sys_env_mkguest>:
  802388:	55                   	push   %rbp
  802389:	48 89 e5             	mov    %rsp,%rbp
  80238c:	48 83 ec 10          	sub    $0x10,%rsp
  802390:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802394:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802398:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80239c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023a0:	48 83 ec 08          	sub    $0x8,%rsp
  8023a4:	6a 00                	pushq  $0x0
  8023a6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8023ac:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8023b2:	48 89 d1             	mov    %rdx,%rcx
  8023b5:	48 89 c2             	mov    %rax,%rdx
  8023b8:	be 00 00 00 00       	mov    $0x0,%esi
  8023bd:	bf 12 00 00 00       	mov    $0x12,%edi
  8023c2:	48 b8 02 1e 80 00 00 	movabs $0x801e02,%rax
  8023c9:	00 00 00 
  8023cc:	ff d0                	callq  *%rax
  8023ce:	48 83 c4 10          	add    $0x10,%rsp
  8023d2:	c9                   	leaveq 
  8023d3:	c3                   	retq   

00000000008023d4 <pgfault>:
  8023d4:	55                   	push   %rbp
  8023d5:	48 89 e5             	mov    %rsp,%rbp
  8023d8:	48 83 ec 30          	sub    $0x30,%rsp
  8023dc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8023e0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8023e4:	48 8b 00             	mov    (%rax),%rax
  8023e7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8023eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8023ef:	48 8b 40 08          	mov    0x8(%rax),%rax
  8023f3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023f9:	83 e0 02             	and    $0x2,%eax
  8023fc:	85 c0                	test   %eax,%eax
  8023fe:	75 40                	jne    802440 <pgfault+0x6c>
  802400:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802404:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  80240b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80240f:	49 89 d0             	mov    %rdx,%r8
  802412:	48 89 c1             	mov    %rax,%rcx
  802415:	48 ba 78 5e 80 00 00 	movabs $0x805e78,%rdx
  80241c:	00 00 00 
  80241f:	be 1f 00 00 00       	mov    $0x1f,%esi
  802424:	48 bf 91 5e 80 00 00 	movabs $0x805e91,%rdi
  80242b:	00 00 00 
  80242e:	b8 00 00 00 00       	mov    $0x0,%eax
  802433:	49 b9 de 08 80 00 00 	movabs $0x8008de,%r9
  80243a:	00 00 00 
  80243d:	41 ff d1             	callq  *%r9
  802440:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802444:	48 c1 e8 0c          	shr    $0xc,%rax
  802448:	48 89 c2             	mov    %rax,%rdx
  80244b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802452:	01 00 00 
  802455:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802459:	25 07 08 00 00       	and    $0x807,%eax
  80245e:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  802464:	74 4e                	je     8024b4 <pgfault+0xe0>
  802466:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80246a:	48 c1 e8 0c          	shr    $0xc,%rax
  80246e:	48 89 c2             	mov    %rax,%rdx
  802471:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802478:	01 00 00 
  80247b:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80247f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802483:	49 89 d0             	mov    %rdx,%r8
  802486:	48 89 c1             	mov    %rax,%rcx
  802489:	48 ba a0 5e 80 00 00 	movabs $0x805ea0,%rdx
  802490:	00 00 00 
  802493:	be 22 00 00 00       	mov    $0x22,%esi
  802498:	48 bf 91 5e 80 00 00 	movabs $0x805e91,%rdi
  80249f:	00 00 00 
  8024a2:	b8 00 00 00 00       	mov    $0x0,%eax
  8024a7:	49 b9 de 08 80 00 00 	movabs $0x8008de,%r9
  8024ae:	00 00 00 
  8024b1:	41 ff d1             	callq  *%r9
  8024b4:	ba 07 00 00 00       	mov    $0x7,%edx
  8024b9:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8024be:	bf 00 00 00 00       	mov    $0x0,%edi
  8024c3:	48 b8 d8 1f 80 00 00 	movabs $0x801fd8,%rax
  8024ca:	00 00 00 
  8024cd:	ff d0                	callq  *%rax
  8024cf:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8024d2:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8024d6:	79 30                	jns    802508 <pgfault+0x134>
  8024d8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024db:	89 c1                	mov    %eax,%ecx
  8024dd:	48 ba cb 5e 80 00 00 	movabs $0x805ecb,%rdx
  8024e4:	00 00 00 
  8024e7:	be 30 00 00 00       	mov    $0x30,%esi
  8024ec:	48 bf 91 5e 80 00 00 	movabs $0x805e91,%rdi
  8024f3:	00 00 00 
  8024f6:	b8 00 00 00 00       	mov    $0x0,%eax
  8024fb:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  802502:	00 00 00 
  802505:	41 ff d0             	callq  *%r8
  802508:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80250c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802510:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802514:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  80251a:	ba 00 10 00 00       	mov    $0x1000,%edx
  80251f:	48 89 c6             	mov    %rax,%rsi
  802522:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  802527:	48 b8 cd 19 80 00 00 	movabs $0x8019cd,%rax
  80252e:	00 00 00 
  802531:	ff d0                	callq  *%rax
  802533:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802537:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80253b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80253f:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802545:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  80254b:	48 89 c1             	mov    %rax,%rcx
  80254e:	ba 00 00 00 00       	mov    $0x0,%edx
  802553:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802558:	bf 00 00 00 00       	mov    $0x0,%edi
  80255d:	48 b8 2a 20 80 00 00 	movabs $0x80202a,%rax
  802564:	00 00 00 
  802567:	ff d0                	callq  *%rax
  802569:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80256c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802570:	79 30                	jns    8025a2 <pgfault+0x1ce>
  802572:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802575:	89 c1                	mov    %eax,%ecx
  802577:	48 ba de 5e 80 00 00 	movabs $0x805ede,%rdx
  80257e:	00 00 00 
  802581:	be 35 00 00 00       	mov    $0x35,%esi
  802586:	48 bf 91 5e 80 00 00 	movabs $0x805e91,%rdi
  80258d:	00 00 00 
  802590:	b8 00 00 00 00       	mov    $0x0,%eax
  802595:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  80259c:	00 00 00 
  80259f:	41 ff d0             	callq  *%r8
  8025a2:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8025a7:	bf 00 00 00 00       	mov    $0x0,%edi
  8025ac:	48 b8 8a 20 80 00 00 	movabs $0x80208a,%rax
  8025b3:	00 00 00 
  8025b6:	ff d0                	callq  *%rax
  8025b8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8025bb:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8025bf:	79 30                	jns    8025f1 <pgfault+0x21d>
  8025c1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8025c4:	89 c1                	mov    %eax,%ecx
  8025c6:	48 ba ef 5e 80 00 00 	movabs $0x805eef,%rdx
  8025cd:	00 00 00 
  8025d0:	be 39 00 00 00       	mov    $0x39,%esi
  8025d5:	48 bf 91 5e 80 00 00 	movabs $0x805e91,%rdi
  8025dc:	00 00 00 
  8025df:	b8 00 00 00 00       	mov    $0x0,%eax
  8025e4:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  8025eb:	00 00 00 
  8025ee:	41 ff d0             	callq  *%r8
  8025f1:	90                   	nop
  8025f2:	c9                   	leaveq 
  8025f3:	c3                   	retq   

00000000008025f4 <duppage>:
  8025f4:	55                   	push   %rbp
  8025f5:	48 89 e5             	mov    %rsp,%rbp
  8025f8:	48 83 ec 30          	sub    $0x30,%rsp
  8025fc:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8025ff:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802602:	8b 45 d8             	mov    -0x28(%rbp),%eax
  802605:	c1 e0 0c             	shl    $0xc,%eax
  802608:	89 c0                	mov    %eax,%eax
  80260a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80260e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802615:	01 00 00 
  802618:	8b 55 d8             	mov    -0x28(%rbp),%edx
  80261b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80261f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802623:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802627:	25 02 08 00 00       	and    $0x802,%eax
  80262c:	48 85 c0             	test   %rax,%rax
  80262f:	74 0e                	je     80263f <duppage+0x4b>
  802631:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802635:	25 00 04 00 00       	and    $0x400,%eax
  80263a:	48 85 c0             	test   %rax,%rax
  80263d:	74 70                	je     8026af <duppage+0xbb>
  80263f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802643:	25 07 0e 00 00       	and    $0xe07,%eax
  802648:	89 c6                	mov    %eax,%esi
  80264a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  80264e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802651:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802655:	41 89 f0             	mov    %esi,%r8d
  802658:	48 89 c6             	mov    %rax,%rsi
  80265b:	bf 00 00 00 00       	mov    $0x0,%edi
  802660:	48 b8 2a 20 80 00 00 	movabs $0x80202a,%rax
  802667:	00 00 00 
  80266a:	ff d0                	callq  *%rax
  80266c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80266f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802673:	79 30                	jns    8026a5 <duppage+0xb1>
  802675:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802678:	89 c1                	mov    %eax,%ecx
  80267a:	48 ba de 5e 80 00 00 	movabs $0x805ede,%rdx
  802681:	00 00 00 
  802684:	be 63 00 00 00       	mov    $0x63,%esi
  802689:	48 bf 91 5e 80 00 00 	movabs $0x805e91,%rdi
  802690:	00 00 00 
  802693:	b8 00 00 00 00       	mov    $0x0,%eax
  802698:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  80269f:	00 00 00 
  8026a2:	41 ff d0             	callq  *%r8
  8026a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8026aa:	e9 c4 00 00 00       	jmpq   802773 <duppage+0x17f>
  8026af:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8026b3:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8026b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8026ba:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8026c0:	48 89 c6             	mov    %rax,%rsi
  8026c3:	bf 00 00 00 00       	mov    $0x0,%edi
  8026c8:	48 b8 2a 20 80 00 00 	movabs $0x80202a,%rax
  8026cf:	00 00 00 
  8026d2:	ff d0                	callq  *%rax
  8026d4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8026d7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8026db:	79 30                	jns    80270d <duppage+0x119>
  8026dd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8026e0:	89 c1                	mov    %eax,%ecx
  8026e2:	48 ba de 5e 80 00 00 	movabs $0x805ede,%rdx
  8026e9:	00 00 00 
  8026ec:	be 7e 00 00 00       	mov    $0x7e,%esi
  8026f1:	48 bf 91 5e 80 00 00 	movabs $0x805e91,%rdi
  8026f8:	00 00 00 
  8026fb:	b8 00 00 00 00       	mov    $0x0,%eax
  802700:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  802707:	00 00 00 
  80270a:	41 ff d0             	callq  *%r8
  80270d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802711:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802715:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  80271b:	48 89 d1             	mov    %rdx,%rcx
  80271e:	ba 00 00 00 00       	mov    $0x0,%edx
  802723:	48 89 c6             	mov    %rax,%rsi
  802726:	bf 00 00 00 00       	mov    $0x0,%edi
  80272b:	48 b8 2a 20 80 00 00 	movabs $0x80202a,%rax
  802732:	00 00 00 
  802735:	ff d0                	callq  *%rax
  802737:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80273a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80273e:	79 30                	jns    802770 <duppage+0x17c>
  802740:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802743:	89 c1                	mov    %eax,%ecx
  802745:	48 ba de 5e 80 00 00 	movabs $0x805ede,%rdx
  80274c:	00 00 00 
  80274f:	be 80 00 00 00       	mov    $0x80,%esi
  802754:	48 bf 91 5e 80 00 00 	movabs $0x805e91,%rdi
  80275b:	00 00 00 
  80275e:	b8 00 00 00 00       	mov    $0x0,%eax
  802763:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  80276a:	00 00 00 
  80276d:	41 ff d0             	callq  *%r8
  802770:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802773:	c9                   	leaveq 
  802774:	c3                   	retq   

0000000000802775 <fork>:
  802775:	55                   	push   %rbp
  802776:	48 89 e5             	mov    %rsp,%rbp
  802779:	48 83 ec 20          	sub    $0x20,%rsp
  80277d:	48 bf d4 23 80 00 00 	movabs $0x8023d4,%rdi
  802784:	00 00 00 
  802787:	48 b8 ea 53 80 00 00 	movabs $0x8053ea,%rax
  80278e:	00 00 00 
  802791:	ff d0                	callq  *%rax
  802793:	b8 07 00 00 00       	mov    $0x7,%eax
  802798:	cd 30                	int    $0x30
  80279a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80279d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8027a0:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8027a3:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8027a7:	79 08                	jns    8027b1 <fork+0x3c>
  8027a9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8027ac:	e9 0b 02 00 00       	jmpq   8029bc <fork+0x247>
  8027b1:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8027b5:	75 3e                	jne    8027f5 <fork+0x80>
  8027b7:	48 b8 5f 1f 80 00 00 	movabs $0x801f5f,%rax
  8027be:	00 00 00 
  8027c1:	ff d0                	callq  *%rax
  8027c3:	25 ff 03 00 00       	and    $0x3ff,%eax
  8027c8:	48 98                	cltq   
  8027ca:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8027d1:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8027d8:	00 00 00 
  8027db:	48 01 c2             	add    %rax,%rdx
  8027de:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8027e5:	00 00 00 
  8027e8:	48 89 10             	mov    %rdx,(%rax)
  8027eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8027f0:	e9 c7 01 00 00       	jmpq   8029bc <fork+0x247>
  8027f5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8027fc:	e9 a6 00 00 00       	jmpq   8028a7 <fork+0x132>
  802801:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802804:	c1 f8 12             	sar    $0x12,%eax
  802807:	89 c2                	mov    %eax,%edx
  802809:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  802810:	01 00 00 
  802813:	48 63 d2             	movslq %edx,%rdx
  802816:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80281a:	83 e0 01             	and    $0x1,%eax
  80281d:	48 85 c0             	test   %rax,%rax
  802820:	74 21                	je     802843 <fork+0xce>
  802822:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802825:	c1 f8 09             	sar    $0x9,%eax
  802828:	89 c2                	mov    %eax,%edx
  80282a:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802831:	01 00 00 
  802834:	48 63 d2             	movslq %edx,%rdx
  802837:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80283b:	83 e0 01             	and    $0x1,%eax
  80283e:	48 85 c0             	test   %rax,%rax
  802841:	75 09                	jne    80284c <fork+0xd7>
  802843:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  80284a:	eb 5b                	jmp    8028a7 <fork+0x132>
  80284c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80284f:	05 00 02 00 00       	add    $0x200,%eax
  802854:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802857:	eb 46                	jmp    80289f <fork+0x12a>
  802859:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802860:	01 00 00 
  802863:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802866:	48 63 d2             	movslq %edx,%rdx
  802869:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80286d:	83 e0 05             	and    $0x5,%eax
  802870:	48 83 f8 05          	cmp    $0x5,%rax
  802874:	75 21                	jne    802897 <fork+0x122>
  802876:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  80287d:	74 1b                	je     80289a <fork+0x125>
  80287f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802882:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802885:	89 d6                	mov    %edx,%esi
  802887:	89 c7                	mov    %eax,%edi
  802889:	48 b8 f4 25 80 00 00 	movabs $0x8025f4,%rax
  802890:	00 00 00 
  802893:	ff d0                	callq  *%rax
  802895:	eb 04                	jmp    80289b <fork+0x126>
  802897:	90                   	nop
  802898:	eb 01                	jmp    80289b <fork+0x126>
  80289a:	90                   	nop
  80289b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80289f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028a2:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8028a5:	7c b2                	jl     802859 <fork+0xe4>
  8028a7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028aa:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  8028af:	0f 86 4c ff ff ff    	jbe    802801 <fork+0x8c>
  8028b5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8028b8:	ba 07 00 00 00       	mov    $0x7,%edx
  8028bd:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8028c2:	89 c7                	mov    %eax,%edi
  8028c4:	48 b8 d8 1f 80 00 00 	movabs $0x801fd8,%rax
  8028cb:	00 00 00 
  8028ce:	ff d0                	callq  *%rax
  8028d0:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8028d3:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8028d7:	79 30                	jns    802909 <fork+0x194>
  8028d9:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8028dc:	89 c1                	mov    %eax,%ecx
  8028de:	48 ba 08 5f 80 00 00 	movabs $0x805f08,%rdx
  8028e5:	00 00 00 
  8028e8:	be bc 00 00 00       	mov    $0xbc,%esi
  8028ed:	48 bf 91 5e 80 00 00 	movabs $0x805e91,%rdi
  8028f4:	00 00 00 
  8028f7:	b8 00 00 00 00       	mov    $0x0,%eax
  8028fc:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  802903:	00 00 00 
  802906:	41 ff d0             	callq  *%r8
  802909:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  802910:	00 00 00 
  802913:	48 8b 00             	mov    (%rax),%rax
  802916:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  80291d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802920:	48 89 d6             	mov    %rdx,%rsi
  802923:	89 c7                	mov    %eax,%edi
  802925:	48 b8 6f 21 80 00 00 	movabs $0x80216f,%rax
  80292c:	00 00 00 
  80292f:	ff d0                	callq  *%rax
  802931:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802934:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802938:	79 30                	jns    80296a <fork+0x1f5>
  80293a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80293d:	89 c1                	mov    %eax,%ecx
  80293f:	48 ba 28 5f 80 00 00 	movabs $0x805f28,%rdx
  802946:	00 00 00 
  802949:	be c0 00 00 00       	mov    $0xc0,%esi
  80294e:	48 bf 91 5e 80 00 00 	movabs $0x805e91,%rdi
  802955:	00 00 00 
  802958:	b8 00 00 00 00       	mov    $0x0,%eax
  80295d:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  802964:	00 00 00 
  802967:	41 ff d0             	callq  *%r8
  80296a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80296d:	be 02 00 00 00       	mov    $0x2,%esi
  802972:	89 c7                	mov    %eax,%edi
  802974:	48 b8 d6 20 80 00 00 	movabs $0x8020d6,%rax
  80297b:	00 00 00 
  80297e:	ff d0                	callq  *%rax
  802980:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802983:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802987:	79 30                	jns    8029b9 <fork+0x244>
  802989:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80298c:	89 c1                	mov    %eax,%ecx
  80298e:	48 ba 47 5f 80 00 00 	movabs $0x805f47,%rdx
  802995:	00 00 00 
  802998:	be c5 00 00 00       	mov    $0xc5,%esi
  80299d:	48 bf 91 5e 80 00 00 	movabs $0x805e91,%rdi
  8029a4:	00 00 00 
  8029a7:	b8 00 00 00 00       	mov    $0x0,%eax
  8029ac:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  8029b3:	00 00 00 
  8029b6:	41 ff d0             	callq  *%r8
  8029b9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8029bc:	c9                   	leaveq 
  8029bd:	c3                   	retq   

00000000008029be <sfork>:
  8029be:	55                   	push   %rbp
  8029bf:	48 89 e5             	mov    %rsp,%rbp
  8029c2:	48 ba 5e 5f 80 00 00 	movabs $0x805f5e,%rdx
  8029c9:	00 00 00 
  8029cc:	be d2 00 00 00       	mov    $0xd2,%esi
  8029d1:	48 bf 91 5e 80 00 00 	movabs $0x805e91,%rdi
  8029d8:	00 00 00 
  8029db:	b8 00 00 00 00       	mov    $0x0,%eax
  8029e0:	48 b9 de 08 80 00 00 	movabs $0x8008de,%rcx
  8029e7:	00 00 00 
  8029ea:	ff d1                	callq  *%rcx

00000000008029ec <fd2num>:
  8029ec:	55                   	push   %rbp
  8029ed:	48 89 e5             	mov    %rsp,%rbp
  8029f0:	48 83 ec 08          	sub    $0x8,%rsp
  8029f4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8029f8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8029fc:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802a03:	ff ff ff 
  802a06:	48 01 d0             	add    %rdx,%rax
  802a09:	48 c1 e8 0c          	shr    $0xc,%rax
  802a0d:	c9                   	leaveq 
  802a0e:	c3                   	retq   

0000000000802a0f <fd2data>:
  802a0f:	55                   	push   %rbp
  802a10:	48 89 e5             	mov    %rsp,%rbp
  802a13:	48 83 ec 08          	sub    $0x8,%rsp
  802a17:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802a1b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802a1f:	48 89 c7             	mov    %rax,%rdi
  802a22:	48 b8 ec 29 80 00 00 	movabs $0x8029ec,%rax
  802a29:	00 00 00 
  802a2c:	ff d0                	callq  *%rax
  802a2e:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802a34:	48 c1 e0 0c          	shl    $0xc,%rax
  802a38:	c9                   	leaveq 
  802a39:	c3                   	retq   

0000000000802a3a <fd_alloc>:
  802a3a:	55                   	push   %rbp
  802a3b:	48 89 e5             	mov    %rsp,%rbp
  802a3e:	48 83 ec 18          	sub    $0x18,%rsp
  802a42:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802a46:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a4d:	eb 6b                	jmp    802aba <fd_alloc+0x80>
  802a4f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a52:	48 98                	cltq   
  802a54:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802a5a:	48 c1 e0 0c          	shl    $0xc,%rax
  802a5e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802a62:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a66:	48 c1 e8 15          	shr    $0x15,%rax
  802a6a:	48 89 c2             	mov    %rax,%rdx
  802a6d:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802a74:	01 00 00 
  802a77:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a7b:	83 e0 01             	and    $0x1,%eax
  802a7e:	48 85 c0             	test   %rax,%rax
  802a81:	74 21                	je     802aa4 <fd_alloc+0x6a>
  802a83:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a87:	48 c1 e8 0c          	shr    $0xc,%rax
  802a8b:	48 89 c2             	mov    %rax,%rdx
  802a8e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a95:	01 00 00 
  802a98:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a9c:	83 e0 01             	and    $0x1,%eax
  802a9f:	48 85 c0             	test   %rax,%rax
  802aa2:	75 12                	jne    802ab6 <fd_alloc+0x7c>
  802aa4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802aa8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802aac:	48 89 10             	mov    %rdx,(%rax)
  802aaf:	b8 00 00 00 00       	mov    $0x0,%eax
  802ab4:	eb 1a                	jmp    802ad0 <fd_alloc+0x96>
  802ab6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802aba:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802abe:	7e 8f                	jle    802a4f <fd_alloc+0x15>
  802ac0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ac4:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802acb:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802ad0:	c9                   	leaveq 
  802ad1:	c3                   	retq   

0000000000802ad2 <fd_lookup>:
  802ad2:	55                   	push   %rbp
  802ad3:	48 89 e5             	mov    %rsp,%rbp
  802ad6:	48 83 ec 20          	sub    $0x20,%rsp
  802ada:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802add:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ae1:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802ae5:	78 06                	js     802aed <fd_lookup+0x1b>
  802ae7:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802aeb:	7e 07                	jle    802af4 <fd_lookup+0x22>
  802aed:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802af2:	eb 6c                	jmp    802b60 <fd_lookup+0x8e>
  802af4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802af7:	48 98                	cltq   
  802af9:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802aff:	48 c1 e0 0c          	shl    $0xc,%rax
  802b03:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802b07:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b0b:	48 c1 e8 15          	shr    $0x15,%rax
  802b0f:	48 89 c2             	mov    %rax,%rdx
  802b12:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802b19:	01 00 00 
  802b1c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b20:	83 e0 01             	and    $0x1,%eax
  802b23:	48 85 c0             	test   %rax,%rax
  802b26:	74 21                	je     802b49 <fd_lookup+0x77>
  802b28:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b2c:	48 c1 e8 0c          	shr    $0xc,%rax
  802b30:	48 89 c2             	mov    %rax,%rdx
  802b33:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802b3a:	01 00 00 
  802b3d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802b41:	83 e0 01             	and    $0x1,%eax
  802b44:	48 85 c0             	test   %rax,%rax
  802b47:	75 07                	jne    802b50 <fd_lookup+0x7e>
  802b49:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802b4e:	eb 10                	jmp    802b60 <fd_lookup+0x8e>
  802b50:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b54:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802b58:	48 89 10             	mov    %rdx,(%rax)
  802b5b:	b8 00 00 00 00       	mov    $0x0,%eax
  802b60:	c9                   	leaveq 
  802b61:	c3                   	retq   

0000000000802b62 <fd_close>:
  802b62:	55                   	push   %rbp
  802b63:	48 89 e5             	mov    %rsp,%rbp
  802b66:	48 83 ec 30          	sub    $0x30,%rsp
  802b6a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802b6e:	89 f0                	mov    %esi,%eax
  802b70:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802b73:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b77:	48 89 c7             	mov    %rax,%rdi
  802b7a:	48 b8 ec 29 80 00 00 	movabs $0x8029ec,%rax
  802b81:	00 00 00 
  802b84:	ff d0                	callq  *%rax
  802b86:	89 c2                	mov    %eax,%edx
  802b88:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802b8c:	48 89 c6             	mov    %rax,%rsi
  802b8f:	89 d7                	mov    %edx,%edi
  802b91:	48 b8 d2 2a 80 00 00 	movabs $0x802ad2,%rax
  802b98:	00 00 00 
  802b9b:	ff d0                	callq  *%rax
  802b9d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ba0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ba4:	78 0a                	js     802bb0 <fd_close+0x4e>
  802ba6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802baa:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802bae:	74 12                	je     802bc2 <fd_close+0x60>
  802bb0:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802bb4:	74 05                	je     802bbb <fd_close+0x59>
  802bb6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bb9:	eb 70                	jmp    802c2b <fd_close+0xc9>
  802bbb:	b8 00 00 00 00       	mov    $0x0,%eax
  802bc0:	eb 69                	jmp    802c2b <fd_close+0xc9>
  802bc2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802bc6:	8b 00                	mov    (%rax),%eax
  802bc8:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802bcc:	48 89 d6             	mov    %rdx,%rsi
  802bcf:	89 c7                	mov    %eax,%edi
  802bd1:	48 b8 2d 2c 80 00 00 	movabs $0x802c2d,%rax
  802bd8:	00 00 00 
  802bdb:	ff d0                	callq  *%rax
  802bdd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802be0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802be4:	78 2a                	js     802c10 <fd_close+0xae>
  802be6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bea:	48 8b 40 20          	mov    0x20(%rax),%rax
  802bee:	48 85 c0             	test   %rax,%rax
  802bf1:	74 16                	je     802c09 <fd_close+0xa7>
  802bf3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bf7:	48 8b 40 20          	mov    0x20(%rax),%rax
  802bfb:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802bff:	48 89 d7             	mov    %rdx,%rdi
  802c02:	ff d0                	callq  *%rax
  802c04:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c07:	eb 07                	jmp    802c10 <fd_close+0xae>
  802c09:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802c10:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802c14:	48 89 c6             	mov    %rax,%rsi
  802c17:	bf 00 00 00 00       	mov    $0x0,%edi
  802c1c:	48 b8 8a 20 80 00 00 	movabs $0x80208a,%rax
  802c23:	00 00 00 
  802c26:	ff d0                	callq  *%rax
  802c28:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c2b:	c9                   	leaveq 
  802c2c:	c3                   	retq   

0000000000802c2d <dev_lookup>:
  802c2d:	55                   	push   %rbp
  802c2e:	48 89 e5             	mov    %rsp,%rbp
  802c31:	48 83 ec 20          	sub    $0x20,%rsp
  802c35:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802c38:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802c3c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802c43:	eb 41                	jmp    802c86 <dev_lookup+0x59>
  802c45:	48 b8 40 80 80 00 00 	movabs $0x808040,%rax
  802c4c:	00 00 00 
  802c4f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802c52:	48 63 d2             	movslq %edx,%rdx
  802c55:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c59:	8b 00                	mov    (%rax),%eax
  802c5b:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802c5e:	75 22                	jne    802c82 <dev_lookup+0x55>
  802c60:	48 b8 40 80 80 00 00 	movabs $0x808040,%rax
  802c67:	00 00 00 
  802c6a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802c6d:	48 63 d2             	movslq %edx,%rdx
  802c70:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802c74:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c78:	48 89 10             	mov    %rdx,(%rax)
  802c7b:	b8 00 00 00 00       	mov    $0x0,%eax
  802c80:	eb 60                	jmp    802ce2 <dev_lookup+0xb5>
  802c82:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802c86:	48 b8 40 80 80 00 00 	movabs $0x808040,%rax
  802c8d:	00 00 00 
  802c90:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802c93:	48 63 d2             	movslq %edx,%rdx
  802c96:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c9a:	48 85 c0             	test   %rax,%rax
  802c9d:	75 a6                	jne    802c45 <dev_lookup+0x18>
  802c9f:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  802ca6:	00 00 00 
  802ca9:	48 8b 00             	mov    (%rax),%rax
  802cac:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802cb2:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802cb5:	89 c6                	mov    %eax,%esi
  802cb7:	48 bf 78 5f 80 00 00 	movabs $0x805f78,%rdi
  802cbe:	00 00 00 
  802cc1:	b8 00 00 00 00       	mov    $0x0,%eax
  802cc6:	48 b9 18 0b 80 00 00 	movabs $0x800b18,%rcx
  802ccd:	00 00 00 
  802cd0:	ff d1                	callq  *%rcx
  802cd2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802cd6:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802cdd:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802ce2:	c9                   	leaveq 
  802ce3:	c3                   	retq   

0000000000802ce4 <close>:
  802ce4:	55                   	push   %rbp
  802ce5:	48 89 e5             	mov    %rsp,%rbp
  802ce8:	48 83 ec 20          	sub    $0x20,%rsp
  802cec:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802cef:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802cf3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802cf6:	48 89 d6             	mov    %rdx,%rsi
  802cf9:	89 c7                	mov    %eax,%edi
  802cfb:	48 b8 d2 2a 80 00 00 	movabs $0x802ad2,%rax
  802d02:	00 00 00 
  802d05:	ff d0                	callq  *%rax
  802d07:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d0a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d0e:	79 05                	jns    802d15 <close+0x31>
  802d10:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d13:	eb 18                	jmp    802d2d <close+0x49>
  802d15:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d19:	be 01 00 00 00       	mov    $0x1,%esi
  802d1e:	48 89 c7             	mov    %rax,%rdi
  802d21:	48 b8 62 2b 80 00 00 	movabs $0x802b62,%rax
  802d28:	00 00 00 
  802d2b:	ff d0                	callq  *%rax
  802d2d:	c9                   	leaveq 
  802d2e:	c3                   	retq   

0000000000802d2f <close_all>:
  802d2f:	55                   	push   %rbp
  802d30:	48 89 e5             	mov    %rsp,%rbp
  802d33:	48 83 ec 10          	sub    $0x10,%rsp
  802d37:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802d3e:	eb 15                	jmp    802d55 <close_all+0x26>
  802d40:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d43:	89 c7                	mov    %eax,%edi
  802d45:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  802d4c:	00 00 00 
  802d4f:	ff d0                	callq  *%rax
  802d51:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802d55:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802d59:	7e e5                	jle    802d40 <close_all+0x11>
  802d5b:	90                   	nop
  802d5c:	c9                   	leaveq 
  802d5d:	c3                   	retq   

0000000000802d5e <dup>:
  802d5e:	55                   	push   %rbp
  802d5f:	48 89 e5             	mov    %rsp,%rbp
  802d62:	48 83 ec 40          	sub    $0x40,%rsp
  802d66:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802d69:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802d6c:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802d70:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802d73:	48 89 d6             	mov    %rdx,%rsi
  802d76:	89 c7                	mov    %eax,%edi
  802d78:	48 b8 d2 2a 80 00 00 	movabs $0x802ad2,%rax
  802d7f:	00 00 00 
  802d82:	ff d0                	callq  *%rax
  802d84:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d87:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d8b:	79 08                	jns    802d95 <dup+0x37>
  802d8d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d90:	e9 70 01 00 00       	jmpq   802f05 <dup+0x1a7>
  802d95:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802d98:	89 c7                	mov    %eax,%edi
  802d9a:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  802da1:	00 00 00 
  802da4:	ff d0                	callq  *%rax
  802da6:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802da9:	48 98                	cltq   
  802dab:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802db1:	48 c1 e0 0c          	shl    $0xc,%rax
  802db5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802db9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802dbd:	48 89 c7             	mov    %rax,%rdi
  802dc0:	48 b8 0f 2a 80 00 00 	movabs $0x802a0f,%rax
  802dc7:	00 00 00 
  802dca:	ff d0                	callq  *%rax
  802dcc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802dd0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802dd4:	48 89 c7             	mov    %rax,%rdi
  802dd7:	48 b8 0f 2a 80 00 00 	movabs $0x802a0f,%rax
  802dde:	00 00 00 
  802de1:	ff d0                	callq  *%rax
  802de3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802de7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802deb:	48 c1 e8 15          	shr    $0x15,%rax
  802def:	48 89 c2             	mov    %rax,%rdx
  802df2:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802df9:	01 00 00 
  802dfc:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802e00:	83 e0 01             	and    $0x1,%eax
  802e03:	48 85 c0             	test   %rax,%rax
  802e06:	74 71                	je     802e79 <dup+0x11b>
  802e08:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e0c:	48 c1 e8 0c          	shr    $0xc,%rax
  802e10:	48 89 c2             	mov    %rax,%rdx
  802e13:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802e1a:	01 00 00 
  802e1d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802e21:	83 e0 01             	and    $0x1,%eax
  802e24:	48 85 c0             	test   %rax,%rax
  802e27:	74 50                	je     802e79 <dup+0x11b>
  802e29:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e2d:	48 c1 e8 0c          	shr    $0xc,%rax
  802e31:	48 89 c2             	mov    %rax,%rdx
  802e34:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802e3b:	01 00 00 
  802e3e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802e42:	25 07 0e 00 00       	and    $0xe07,%eax
  802e47:	89 c1                	mov    %eax,%ecx
  802e49:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802e4d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e51:	41 89 c8             	mov    %ecx,%r8d
  802e54:	48 89 d1             	mov    %rdx,%rcx
  802e57:	ba 00 00 00 00       	mov    $0x0,%edx
  802e5c:	48 89 c6             	mov    %rax,%rsi
  802e5f:	bf 00 00 00 00       	mov    $0x0,%edi
  802e64:	48 b8 2a 20 80 00 00 	movabs $0x80202a,%rax
  802e6b:	00 00 00 
  802e6e:	ff d0                	callq  *%rax
  802e70:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e73:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e77:	78 55                	js     802ece <dup+0x170>
  802e79:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802e7d:	48 c1 e8 0c          	shr    $0xc,%rax
  802e81:	48 89 c2             	mov    %rax,%rdx
  802e84:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802e8b:	01 00 00 
  802e8e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802e92:	25 07 0e 00 00       	and    $0xe07,%eax
  802e97:	89 c1                	mov    %eax,%ecx
  802e99:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802e9d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802ea1:	41 89 c8             	mov    %ecx,%r8d
  802ea4:	48 89 d1             	mov    %rdx,%rcx
  802ea7:	ba 00 00 00 00       	mov    $0x0,%edx
  802eac:	48 89 c6             	mov    %rax,%rsi
  802eaf:	bf 00 00 00 00       	mov    $0x0,%edi
  802eb4:	48 b8 2a 20 80 00 00 	movabs $0x80202a,%rax
  802ebb:	00 00 00 
  802ebe:	ff d0                	callq  *%rax
  802ec0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ec3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ec7:	78 08                	js     802ed1 <dup+0x173>
  802ec9:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802ecc:	eb 37                	jmp    802f05 <dup+0x1a7>
  802ece:	90                   	nop
  802ecf:	eb 01                	jmp    802ed2 <dup+0x174>
  802ed1:	90                   	nop
  802ed2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ed6:	48 89 c6             	mov    %rax,%rsi
  802ed9:	bf 00 00 00 00       	mov    $0x0,%edi
  802ede:	48 b8 8a 20 80 00 00 	movabs $0x80208a,%rax
  802ee5:	00 00 00 
  802ee8:	ff d0                	callq  *%rax
  802eea:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802eee:	48 89 c6             	mov    %rax,%rsi
  802ef1:	bf 00 00 00 00       	mov    $0x0,%edi
  802ef6:	48 b8 8a 20 80 00 00 	movabs $0x80208a,%rax
  802efd:	00 00 00 
  802f00:	ff d0                	callq  *%rax
  802f02:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f05:	c9                   	leaveq 
  802f06:	c3                   	retq   

0000000000802f07 <read>:
  802f07:	55                   	push   %rbp
  802f08:	48 89 e5             	mov    %rsp,%rbp
  802f0b:	48 83 ec 40          	sub    $0x40,%rsp
  802f0f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802f12:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802f16:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802f1a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802f1e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802f21:	48 89 d6             	mov    %rdx,%rsi
  802f24:	89 c7                	mov    %eax,%edi
  802f26:	48 b8 d2 2a 80 00 00 	movabs $0x802ad2,%rax
  802f2d:	00 00 00 
  802f30:	ff d0                	callq  *%rax
  802f32:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f35:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f39:	78 24                	js     802f5f <read+0x58>
  802f3b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f3f:	8b 00                	mov    (%rax),%eax
  802f41:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802f45:	48 89 d6             	mov    %rdx,%rsi
  802f48:	89 c7                	mov    %eax,%edi
  802f4a:	48 b8 2d 2c 80 00 00 	movabs $0x802c2d,%rax
  802f51:	00 00 00 
  802f54:	ff d0                	callq  *%rax
  802f56:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f59:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f5d:	79 05                	jns    802f64 <read+0x5d>
  802f5f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f62:	eb 76                	jmp    802fda <read+0xd3>
  802f64:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f68:	8b 40 08             	mov    0x8(%rax),%eax
  802f6b:	83 e0 03             	and    $0x3,%eax
  802f6e:	83 f8 01             	cmp    $0x1,%eax
  802f71:	75 3a                	jne    802fad <read+0xa6>
  802f73:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  802f7a:	00 00 00 
  802f7d:	48 8b 00             	mov    (%rax),%rax
  802f80:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802f86:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802f89:	89 c6                	mov    %eax,%esi
  802f8b:	48 bf 97 5f 80 00 00 	movabs $0x805f97,%rdi
  802f92:	00 00 00 
  802f95:	b8 00 00 00 00       	mov    $0x0,%eax
  802f9a:	48 b9 18 0b 80 00 00 	movabs $0x800b18,%rcx
  802fa1:	00 00 00 
  802fa4:	ff d1                	callq  *%rcx
  802fa6:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802fab:	eb 2d                	jmp    802fda <read+0xd3>
  802fad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fb1:	48 8b 40 10          	mov    0x10(%rax),%rax
  802fb5:	48 85 c0             	test   %rax,%rax
  802fb8:	75 07                	jne    802fc1 <read+0xba>
  802fba:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802fbf:	eb 19                	jmp    802fda <read+0xd3>
  802fc1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fc5:	48 8b 40 10          	mov    0x10(%rax),%rax
  802fc9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802fcd:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802fd1:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802fd5:	48 89 cf             	mov    %rcx,%rdi
  802fd8:	ff d0                	callq  *%rax
  802fda:	c9                   	leaveq 
  802fdb:	c3                   	retq   

0000000000802fdc <readn>:
  802fdc:	55                   	push   %rbp
  802fdd:	48 89 e5             	mov    %rsp,%rbp
  802fe0:	48 83 ec 30          	sub    $0x30,%rsp
  802fe4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802fe7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802feb:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802fef:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802ff6:	eb 47                	jmp    80303f <readn+0x63>
  802ff8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ffb:	48 98                	cltq   
  802ffd:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803001:	48 29 c2             	sub    %rax,%rdx
  803004:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803007:	48 63 c8             	movslq %eax,%rcx
  80300a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80300e:	48 01 c1             	add    %rax,%rcx
  803011:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803014:	48 89 ce             	mov    %rcx,%rsi
  803017:	89 c7                	mov    %eax,%edi
  803019:	48 b8 07 2f 80 00 00 	movabs $0x802f07,%rax
  803020:	00 00 00 
  803023:	ff d0                	callq  *%rax
  803025:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803028:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80302c:	79 05                	jns    803033 <readn+0x57>
  80302e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803031:	eb 1d                	jmp    803050 <readn+0x74>
  803033:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803037:	74 13                	je     80304c <readn+0x70>
  803039:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80303c:	01 45 fc             	add    %eax,-0x4(%rbp)
  80303f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803042:	48 98                	cltq   
  803044:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803048:	72 ae                	jb     802ff8 <readn+0x1c>
  80304a:	eb 01                	jmp    80304d <readn+0x71>
  80304c:	90                   	nop
  80304d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803050:	c9                   	leaveq 
  803051:	c3                   	retq   

0000000000803052 <write>:
  803052:	55                   	push   %rbp
  803053:	48 89 e5             	mov    %rsp,%rbp
  803056:	48 83 ec 40          	sub    $0x40,%rsp
  80305a:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80305d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803061:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803065:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803069:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80306c:	48 89 d6             	mov    %rdx,%rsi
  80306f:	89 c7                	mov    %eax,%edi
  803071:	48 b8 d2 2a 80 00 00 	movabs $0x802ad2,%rax
  803078:	00 00 00 
  80307b:	ff d0                	callq  *%rax
  80307d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803080:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803084:	78 24                	js     8030aa <write+0x58>
  803086:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80308a:	8b 00                	mov    (%rax),%eax
  80308c:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803090:	48 89 d6             	mov    %rdx,%rsi
  803093:	89 c7                	mov    %eax,%edi
  803095:	48 b8 2d 2c 80 00 00 	movabs $0x802c2d,%rax
  80309c:	00 00 00 
  80309f:	ff d0                	callq  *%rax
  8030a1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030a4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030a8:	79 05                	jns    8030af <write+0x5d>
  8030aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030ad:	eb 75                	jmp    803124 <write+0xd2>
  8030af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030b3:	8b 40 08             	mov    0x8(%rax),%eax
  8030b6:	83 e0 03             	and    $0x3,%eax
  8030b9:	85 c0                	test   %eax,%eax
  8030bb:	75 3a                	jne    8030f7 <write+0xa5>
  8030bd:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8030c4:	00 00 00 
  8030c7:	48 8b 00             	mov    (%rax),%rax
  8030ca:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8030d0:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8030d3:	89 c6                	mov    %eax,%esi
  8030d5:	48 bf b3 5f 80 00 00 	movabs $0x805fb3,%rdi
  8030dc:	00 00 00 
  8030df:	b8 00 00 00 00       	mov    $0x0,%eax
  8030e4:	48 b9 18 0b 80 00 00 	movabs $0x800b18,%rcx
  8030eb:	00 00 00 
  8030ee:	ff d1                	callq  *%rcx
  8030f0:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8030f5:	eb 2d                	jmp    803124 <write+0xd2>
  8030f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030fb:	48 8b 40 18          	mov    0x18(%rax),%rax
  8030ff:	48 85 c0             	test   %rax,%rax
  803102:	75 07                	jne    80310b <write+0xb9>
  803104:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803109:	eb 19                	jmp    803124 <write+0xd2>
  80310b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80310f:	48 8b 40 18          	mov    0x18(%rax),%rax
  803113:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803117:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80311b:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80311f:	48 89 cf             	mov    %rcx,%rdi
  803122:	ff d0                	callq  *%rax
  803124:	c9                   	leaveq 
  803125:	c3                   	retq   

0000000000803126 <seek>:
  803126:	55                   	push   %rbp
  803127:	48 89 e5             	mov    %rsp,%rbp
  80312a:	48 83 ec 18          	sub    $0x18,%rsp
  80312e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803131:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803134:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803138:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80313b:	48 89 d6             	mov    %rdx,%rsi
  80313e:	89 c7                	mov    %eax,%edi
  803140:	48 b8 d2 2a 80 00 00 	movabs $0x802ad2,%rax
  803147:	00 00 00 
  80314a:	ff d0                	callq  *%rax
  80314c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80314f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803153:	79 05                	jns    80315a <seek+0x34>
  803155:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803158:	eb 0f                	jmp    803169 <seek+0x43>
  80315a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80315e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803161:	89 50 04             	mov    %edx,0x4(%rax)
  803164:	b8 00 00 00 00       	mov    $0x0,%eax
  803169:	c9                   	leaveq 
  80316a:	c3                   	retq   

000000000080316b <ftruncate>:
  80316b:	55                   	push   %rbp
  80316c:	48 89 e5             	mov    %rsp,%rbp
  80316f:	48 83 ec 30          	sub    $0x30,%rsp
  803173:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803176:	89 75 d8             	mov    %esi,-0x28(%rbp)
  803179:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80317d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803180:	48 89 d6             	mov    %rdx,%rsi
  803183:	89 c7                	mov    %eax,%edi
  803185:	48 b8 d2 2a 80 00 00 	movabs $0x802ad2,%rax
  80318c:	00 00 00 
  80318f:	ff d0                	callq  *%rax
  803191:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803194:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803198:	78 24                	js     8031be <ftruncate+0x53>
  80319a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80319e:	8b 00                	mov    (%rax),%eax
  8031a0:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8031a4:	48 89 d6             	mov    %rdx,%rsi
  8031a7:	89 c7                	mov    %eax,%edi
  8031a9:	48 b8 2d 2c 80 00 00 	movabs $0x802c2d,%rax
  8031b0:	00 00 00 
  8031b3:	ff d0                	callq  *%rax
  8031b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031b8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031bc:	79 05                	jns    8031c3 <ftruncate+0x58>
  8031be:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031c1:	eb 72                	jmp    803235 <ftruncate+0xca>
  8031c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031c7:	8b 40 08             	mov    0x8(%rax),%eax
  8031ca:	83 e0 03             	and    $0x3,%eax
  8031cd:	85 c0                	test   %eax,%eax
  8031cf:	75 3a                	jne    80320b <ftruncate+0xa0>
  8031d1:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8031d8:	00 00 00 
  8031db:	48 8b 00             	mov    (%rax),%rax
  8031de:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8031e4:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8031e7:	89 c6                	mov    %eax,%esi
  8031e9:	48 bf d0 5f 80 00 00 	movabs $0x805fd0,%rdi
  8031f0:	00 00 00 
  8031f3:	b8 00 00 00 00       	mov    $0x0,%eax
  8031f8:	48 b9 18 0b 80 00 00 	movabs $0x800b18,%rcx
  8031ff:	00 00 00 
  803202:	ff d1                	callq  *%rcx
  803204:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  803209:	eb 2a                	jmp    803235 <ftruncate+0xca>
  80320b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80320f:	48 8b 40 30          	mov    0x30(%rax),%rax
  803213:	48 85 c0             	test   %rax,%rax
  803216:	75 07                	jne    80321f <ftruncate+0xb4>
  803218:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80321d:	eb 16                	jmp    803235 <ftruncate+0xca>
  80321f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803223:	48 8b 40 30          	mov    0x30(%rax),%rax
  803227:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80322b:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  80322e:	89 ce                	mov    %ecx,%esi
  803230:	48 89 d7             	mov    %rdx,%rdi
  803233:	ff d0                	callq  *%rax
  803235:	c9                   	leaveq 
  803236:	c3                   	retq   

0000000000803237 <fstat>:
  803237:	55                   	push   %rbp
  803238:	48 89 e5             	mov    %rsp,%rbp
  80323b:	48 83 ec 30          	sub    $0x30,%rsp
  80323f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803242:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803246:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80324a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80324d:	48 89 d6             	mov    %rdx,%rsi
  803250:	89 c7                	mov    %eax,%edi
  803252:	48 b8 d2 2a 80 00 00 	movabs $0x802ad2,%rax
  803259:	00 00 00 
  80325c:	ff d0                	callq  *%rax
  80325e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803261:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803265:	78 24                	js     80328b <fstat+0x54>
  803267:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80326b:	8b 00                	mov    (%rax),%eax
  80326d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803271:	48 89 d6             	mov    %rdx,%rsi
  803274:	89 c7                	mov    %eax,%edi
  803276:	48 b8 2d 2c 80 00 00 	movabs $0x802c2d,%rax
  80327d:	00 00 00 
  803280:	ff d0                	callq  *%rax
  803282:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803285:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803289:	79 05                	jns    803290 <fstat+0x59>
  80328b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80328e:	eb 5e                	jmp    8032ee <fstat+0xb7>
  803290:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803294:	48 8b 40 28          	mov    0x28(%rax),%rax
  803298:	48 85 c0             	test   %rax,%rax
  80329b:	75 07                	jne    8032a4 <fstat+0x6d>
  80329d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8032a2:	eb 4a                	jmp    8032ee <fstat+0xb7>
  8032a4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8032a8:	c6 00 00             	movb   $0x0,(%rax)
  8032ab:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8032af:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8032b6:	00 00 00 
  8032b9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8032bd:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8032c4:	00 00 00 
  8032c7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8032cb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8032cf:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8032d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032da:	48 8b 40 28          	mov    0x28(%rax),%rax
  8032de:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8032e2:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8032e6:	48 89 ce             	mov    %rcx,%rsi
  8032e9:	48 89 d7             	mov    %rdx,%rdi
  8032ec:	ff d0                	callq  *%rax
  8032ee:	c9                   	leaveq 
  8032ef:	c3                   	retq   

00000000008032f0 <stat>:
  8032f0:	55                   	push   %rbp
  8032f1:	48 89 e5             	mov    %rsp,%rbp
  8032f4:	48 83 ec 20          	sub    $0x20,%rsp
  8032f8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8032fc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803300:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803304:	be 00 00 00 00       	mov    $0x0,%esi
  803309:	48 89 c7             	mov    %rax,%rdi
  80330c:	48 b8 e0 33 80 00 00 	movabs $0x8033e0,%rax
  803313:	00 00 00 
  803316:	ff d0                	callq  *%rax
  803318:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80331b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80331f:	79 05                	jns    803326 <stat+0x36>
  803321:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803324:	eb 2f                	jmp    803355 <stat+0x65>
  803326:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80332a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80332d:	48 89 d6             	mov    %rdx,%rsi
  803330:	89 c7                	mov    %eax,%edi
  803332:	48 b8 37 32 80 00 00 	movabs $0x803237,%rax
  803339:	00 00 00 
  80333c:	ff d0                	callq  *%rax
  80333e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803341:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803344:	89 c7                	mov    %eax,%edi
  803346:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  80334d:	00 00 00 
  803350:	ff d0                	callq  *%rax
  803352:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803355:	c9                   	leaveq 
  803356:	c3                   	retq   

0000000000803357 <fsipc>:
  803357:	55                   	push   %rbp
  803358:	48 89 e5             	mov    %rsp,%rbp
  80335b:	48 83 ec 10          	sub    $0x10,%rsp
  80335f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803362:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803366:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80336d:	00 00 00 
  803370:	8b 00                	mov    (%rax),%eax
  803372:	85 c0                	test   %eax,%eax
  803374:	75 1f                	jne    803395 <fsipc+0x3e>
  803376:	bf 01 00 00 00       	mov    $0x1,%edi
  80337b:	48 b8 de 56 80 00 00 	movabs $0x8056de,%rax
  803382:	00 00 00 
  803385:	ff d0                	callq  *%rax
  803387:	89 c2                	mov    %eax,%edx
  803389:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803390:	00 00 00 
  803393:	89 10                	mov    %edx,(%rax)
  803395:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80339c:	00 00 00 
  80339f:	8b 00                	mov    (%rax),%eax
  8033a1:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8033a4:	b9 07 00 00 00       	mov    $0x7,%ecx
  8033a9:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  8033b0:	00 00 00 
  8033b3:	89 c7                	mov    %eax,%edi
  8033b5:	48 b8 d4 55 80 00 00 	movabs $0x8055d4,%rax
  8033bc:	00 00 00 
  8033bf:	ff d0                	callq  *%rax
  8033c1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033c5:	ba 00 00 00 00       	mov    $0x0,%edx
  8033ca:	48 89 c6             	mov    %rax,%rsi
  8033cd:	bf 00 00 00 00       	mov    $0x0,%edi
  8033d2:	48 b8 13 55 80 00 00 	movabs $0x805513,%rax
  8033d9:	00 00 00 
  8033dc:	ff d0                	callq  *%rax
  8033de:	c9                   	leaveq 
  8033df:	c3                   	retq   

00000000008033e0 <open>:
  8033e0:	55                   	push   %rbp
  8033e1:	48 89 e5             	mov    %rsp,%rbp
  8033e4:	48 83 ec 20          	sub    $0x20,%rsp
  8033e8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8033ec:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8033ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033f3:	48 89 c7             	mov    %rax,%rdi
  8033f6:	48 b8 3c 16 80 00 00 	movabs $0x80163c,%rax
  8033fd:	00 00 00 
  803400:	ff d0                	callq  *%rax
  803402:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803407:	7e 0a                	jle    803413 <open+0x33>
  803409:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80340e:	e9 a5 00 00 00       	jmpq   8034b8 <open+0xd8>
  803413:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803417:	48 89 c7             	mov    %rax,%rdi
  80341a:	48 b8 3a 2a 80 00 00 	movabs $0x802a3a,%rax
  803421:	00 00 00 
  803424:	ff d0                	callq  *%rax
  803426:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803429:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80342d:	79 08                	jns    803437 <open+0x57>
  80342f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803432:	e9 81 00 00 00       	jmpq   8034b8 <open+0xd8>
  803437:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80343b:	48 89 c6             	mov    %rax,%rsi
  80343e:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  803445:	00 00 00 
  803448:	48 b8 a8 16 80 00 00 	movabs $0x8016a8,%rax
  80344f:	00 00 00 
  803452:	ff d0                	callq  *%rax
  803454:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80345b:	00 00 00 
  80345e:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803461:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  803467:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80346b:	48 89 c6             	mov    %rax,%rsi
  80346e:	bf 01 00 00 00       	mov    $0x1,%edi
  803473:	48 b8 57 33 80 00 00 	movabs $0x803357,%rax
  80347a:	00 00 00 
  80347d:	ff d0                	callq  *%rax
  80347f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803482:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803486:	79 1d                	jns    8034a5 <open+0xc5>
  803488:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80348c:	be 00 00 00 00       	mov    $0x0,%esi
  803491:	48 89 c7             	mov    %rax,%rdi
  803494:	48 b8 62 2b 80 00 00 	movabs $0x802b62,%rax
  80349b:	00 00 00 
  80349e:	ff d0                	callq  *%rax
  8034a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034a3:	eb 13                	jmp    8034b8 <open+0xd8>
  8034a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8034a9:	48 89 c7             	mov    %rax,%rdi
  8034ac:	48 b8 ec 29 80 00 00 	movabs $0x8029ec,%rax
  8034b3:	00 00 00 
  8034b6:	ff d0                	callq  *%rax
  8034b8:	c9                   	leaveq 
  8034b9:	c3                   	retq   

00000000008034ba <devfile_flush>:
  8034ba:	55                   	push   %rbp
  8034bb:	48 89 e5             	mov    %rsp,%rbp
  8034be:	48 83 ec 10          	sub    $0x10,%rsp
  8034c2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8034c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8034ca:	8b 50 0c             	mov    0xc(%rax),%edx
  8034cd:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8034d4:	00 00 00 
  8034d7:	89 10                	mov    %edx,(%rax)
  8034d9:	be 00 00 00 00       	mov    $0x0,%esi
  8034de:	bf 06 00 00 00       	mov    $0x6,%edi
  8034e3:	48 b8 57 33 80 00 00 	movabs $0x803357,%rax
  8034ea:	00 00 00 
  8034ed:	ff d0                	callq  *%rax
  8034ef:	c9                   	leaveq 
  8034f0:	c3                   	retq   

00000000008034f1 <devfile_read>:
  8034f1:	55                   	push   %rbp
  8034f2:	48 89 e5             	mov    %rsp,%rbp
  8034f5:	48 83 ec 30          	sub    $0x30,%rsp
  8034f9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8034fd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803501:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803505:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803509:	8b 50 0c             	mov    0xc(%rax),%edx
  80350c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803513:	00 00 00 
  803516:	89 10                	mov    %edx,(%rax)
  803518:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80351f:	00 00 00 
  803522:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803526:	48 89 50 08          	mov    %rdx,0x8(%rax)
  80352a:	be 00 00 00 00       	mov    $0x0,%esi
  80352f:	bf 03 00 00 00       	mov    $0x3,%edi
  803534:	48 b8 57 33 80 00 00 	movabs $0x803357,%rax
  80353b:	00 00 00 
  80353e:	ff d0                	callq  *%rax
  803540:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803543:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803547:	79 08                	jns    803551 <devfile_read+0x60>
  803549:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80354c:	e9 a4 00 00 00       	jmpq   8035f5 <devfile_read+0x104>
  803551:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803554:	48 98                	cltq   
  803556:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80355a:	76 35                	jbe    803591 <devfile_read+0xa0>
  80355c:	48 b9 f6 5f 80 00 00 	movabs $0x805ff6,%rcx
  803563:	00 00 00 
  803566:	48 ba fd 5f 80 00 00 	movabs $0x805ffd,%rdx
  80356d:	00 00 00 
  803570:	be 89 00 00 00       	mov    $0x89,%esi
  803575:	48 bf 12 60 80 00 00 	movabs $0x806012,%rdi
  80357c:	00 00 00 
  80357f:	b8 00 00 00 00       	mov    $0x0,%eax
  803584:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  80358b:	00 00 00 
  80358e:	41 ff d0             	callq  *%r8
  803591:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  803598:	7e 35                	jle    8035cf <devfile_read+0xde>
  80359a:	48 b9 20 60 80 00 00 	movabs $0x806020,%rcx
  8035a1:	00 00 00 
  8035a4:	48 ba fd 5f 80 00 00 	movabs $0x805ffd,%rdx
  8035ab:	00 00 00 
  8035ae:	be 8a 00 00 00       	mov    $0x8a,%esi
  8035b3:	48 bf 12 60 80 00 00 	movabs $0x806012,%rdi
  8035ba:	00 00 00 
  8035bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8035c2:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  8035c9:	00 00 00 
  8035cc:	41 ff d0             	callq  *%r8
  8035cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035d2:	48 63 d0             	movslq %eax,%rdx
  8035d5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8035d9:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  8035e0:	00 00 00 
  8035e3:	48 89 c7             	mov    %rax,%rdi
  8035e6:	48 b8 cd 19 80 00 00 	movabs $0x8019cd,%rax
  8035ed:	00 00 00 
  8035f0:	ff d0                	callq  *%rax
  8035f2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035f5:	c9                   	leaveq 
  8035f6:	c3                   	retq   

00000000008035f7 <devfile_write>:
  8035f7:	55                   	push   %rbp
  8035f8:	48 89 e5             	mov    %rsp,%rbp
  8035fb:	48 83 ec 40          	sub    $0x40,%rsp
  8035ff:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803603:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803607:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80360b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80360f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803613:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  80361a:	00 
  80361b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80361f:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  803623:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  803628:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  80362c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803630:	8b 50 0c             	mov    0xc(%rax),%edx
  803633:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80363a:	00 00 00 
  80363d:	89 10                	mov    %edx,(%rax)
  80363f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803646:	00 00 00 
  803649:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80364d:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803651:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803655:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803659:	48 89 c6             	mov    %rax,%rsi
  80365c:	48 bf 10 a0 80 00 00 	movabs $0x80a010,%rdi
  803663:	00 00 00 
  803666:	48 b8 cd 19 80 00 00 	movabs $0x8019cd,%rax
  80366d:	00 00 00 
  803670:	ff d0                	callq  *%rax
  803672:	be 00 00 00 00       	mov    $0x0,%esi
  803677:	bf 04 00 00 00       	mov    $0x4,%edi
  80367c:	48 b8 57 33 80 00 00 	movabs $0x803357,%rax
  803683:	00 00 00 
  803686:	ff d0                	callq  *%rax
  803688:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80368b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80368f:	79 05                	jns    803696 <devfile_write+0x9f>
  803691:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803694:	eb 43                	jmp    8036d9 <devfile_write+0xe2>
  803696:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803699:	48 98                	cltq   
  80369b:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80369f:	76 35                	jbe    8036d6 <devfile_write+0xdf>
  8036a1:	48 b9 f6 5f 80 00 00 	movabs $0x805ff6,%rcx
  8036a8:	00 00 00 
  8036ab:	48 ba fd 5f 80 00 00 	movabs $0x805ffd,%rdx
  8036b2:	00 00 00 
  8036b5:	be a8 00 00 00       	mov    $0xa8,%esi
  8036ba:	48 bf 12 60 80 00 00 	movabs $0x806012,%rdi
  8036c1:	00 00 00 
  8036c4:	b8 00 00 00 00       	mov    $0x0,%eax
  8036c9:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  8036d0:	00 00 00 
  8036d3:	41 ff d0             	callq  *%r8
  8036d6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036d9:	c9                   	leaveq 
  8036da:	c3                   	retq   

00000000008036db <devfile_stat>:
  8036db:	55                   	push   %rbp
  8036dc:	48 89 e5             	mov    %rsp,%rbp
  8036df:	48 83 ec 20          	sub    $0x20,%rsp
  8036e3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8036e7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8036eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036ef:	8b 50 0c             	mov    0xc(%rax),%edx
  8036f2:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8036f9:	00 00 00 
  8036fc:	89 10                	mov    %edx,(%rax)
  8036fe:	be 00 00 00 00       	mov    $0x0,%esi
  803703:	bf 05 00 00 00       	mov    $0x5,%edi
  803708:	48 b8 57 33 80 00 00 	movabs $0x803357,%rax
  80370f:	00 00 00 
  803712:	ff d0                	callq  *%rax
  803714:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803717:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80371b:	79 05                	jns    803722 <devfile_stat+0x47>
  80371d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803720:	eb 56                	jmp    803778 <devfile_stat+0x9d>
  803722:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803726:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  80372d:	00 00 00 
  803730:	48 89 c7             	mov    %rax,%rdi
  803733:	48 b8 a8 16 80 00 00 	movabs $0x8016a8,%rax
  80373a:	00 00 00 
  80373d:	ff d0                	callq  *%rax
  80373f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803746:	00 00 00 
  803749:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  80374f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803753:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803759:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803760:	00 00 00 
  803763:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803769:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80376d:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803773:	b8 00 00 00 00       	mov    $0x0,%eax
  803778:	c9                   	leaveq 
  803779:	c3                   	retq   

000000000080377a <devfile_trunc>:
  80377a:	55                   	push   %rbp
  80377b:	48 89 e5             	mov    %rsp,%rbp
  80377e:	48 83 ec 10          	sub    $0x10,%rsp
  803782:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803786:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803789:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80378d:	8b 50 0c             	mov    0xc(%rax),%edx
  803790:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803797:	00 00 00 
  80379a:	89 10                	mov    %edx,(%rax)
  80379c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8037a3:	00 00 00 
  8037a6:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8037a9:	89 50 04             	mov    %edx,0x4(%rax)
  8037ac:	be 00 00 00 00       	mov    $0x0,%esi
  8037b1:	bf 02 00 00 00       	mov    $0x2,%edi
  8037b6:	48 b8 57 33 80 00 00 	movabs $0x803357,%rax
  8037bd:	00 00 00 
  8037c0:	ff d0                	callq  *%rax
  8037c2:	c9                   	leaveq 
  8037c3:	c3                   	retq   

00000000008037c4 <remove>:
  8037c4:	55                   	push   %rbp
  8037c5:	48 89 e5             	mov    %rsp,%rbp
  8037c8:	48 83 ec 10          	sub    $0x10,%rsp
  8037cc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8037d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037d4:	48 89 c7             	mov    %rax,%rdi
  8037d7:	48 b8 3c 16 80 00 00 	movabs $0x80163c,%rax
  8037de:	00 00 00 
  8037e1:	ff d0                	callq  *%rax
  8037e3:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8037e8:	7e 07                	jle    8037f1 <remove+0x2d>
  8037ea:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8037ef:	eb 33                	jmp    803824 <remove+0x60>
  8037f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037f5:	48 89 c6             	mov    %rax,%rsi
  8037f8:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  8037ff:	00 00 00 
  803802:	48 b8 a8 16 80 00 00 	movabs $0x8016a8,%rax
  803809:	00 00 00 
  80380c:	ff d0                	callq  *%rax
  80380e:	be 00 00 00 00       	mov    $0x0,%esi
  803813:	bf 07 00 00 00       	mov    $0x7,%edi
  803818:	48 b8 57 33 80 00 00 	movabs $0x803357,%rax
  80381f:	00 00 00 
  803822:	ff d0                	callq  *%rax
  803824:	c9                   	leaveq 
  803825:	c3                   	retq   

0000000000803826 <sync>:
  803826:	55                   	push   %rbp
  803827:	48 89 e5             	mov    %rsp,%rbp
  80382a:	be 00 00 00 00       	mov    $0x0,%esi
  80382f:	bf 08 00 00 00       	mov    $0x8,%edi
  803834:	48 b8 57 33 80 00 00 	movabs $0x803357,%rax
  80383b:	00 00 00 
  80383e:	ff d0                	callq  *%rax
  803840:	5d                   	pop    %rbp
  803841:	c3                   	retq   

0000000000803842 <copy>:
  803842:	55                   	push   %rbp
  803843:	48 89 e5             	mov    %rsp,%rbp
  803846:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  80384d:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803854:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  80385b:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803862:	be 00 00 00 00       	mov    $0x0,%esi
  803867:	48 89 c7             	mov    %rax,%rdi
  80386a:	48 b8 e0 33 80 00 00 	movabs $0x8033e0,%rax
  803871:	00 00 00 
  803874:	ff d0                	callq  *%rax
  803876:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803879:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80387d:	79 28                	jns    8038a7 <copy+0x65>
  80387f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803882:	89 c6                	mov    %eax,%esi
  803884:	48 bf 2c 60 80 00 00 	movabs $0x80602c,%rdi
  80388b:	00 00 00 
  80388e:	b8 00 00 00 00       	mov    $0x0,%eax
  803893:	48 ba 18 0b 80 00 00 	movabs $0x800b18,%rdx
  80389a:	00 00 00 
  80389d:	ff d2                	callq  *%rdx
  80389f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038a2:	e9 76 01 00 00       	jmpq   803a1d <copy+0x1db>
  8038a7:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  8038ae:	be 01 01 00 00       	mov    $0x101,%esi
  8038b3:	48 89 c7             	mov    %rax,%rdi
  8038b6:	48 b8 e0 33 80 00 00 	movabs $0x8033e0,%rax
  8038bd:	00 00 00 
  8038c0:	ff d0                	callq  *%rax
  8038c2:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8038c5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8038c9:	0f 89 ad 00 00 00    	jns    80397c <copy+0x13a>
  8038cf:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8038d2:	89 c6                	mov    %eax,%esi
  8038d4:	48 bf 42 60 80 00 00 	movabs $0x806042,%rdi
  8038db:	00 00 00 
  8038de:	b8 00 00 00 00       	mov    $0x0,%eax
  8038e3:	48 ba 18 0b 80 00 00 	movabs $0x800b18,%rdx
  8038ea:	00 00 00 
  8038ed:	ff d2                	callq  *%rdx
  8038ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038f2:	89 c7                	mov    %eax,%edi
  8038f4:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  8038fb:	00 00 00 
  8038fe:	ff d0                	callq  *%rax
  803900:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803903:	e9 15 01 00 00       	jmpq   803a1d <copy+0x1db>
  803908:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80390b:	48 63 d0             	movslq %eax,%rdx
  80390e:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803915:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803918:	48 89 ce             	mov    %rcx,%rsi
  80391b:	89 c7                	mov    %eax,%edi
  80391d:	48 b8 52 30 80 00 00 	movabs $0x803052,%rax
  803924:	00 00 00 
  803927:	ff d0                	callq  *%rax
  803929:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80392c:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803930:	79 4a                	jns    80397c <copy+0x13a>
  803932:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803935:	89 c6                	mov    %eax,%esi
  803937:	48 bf 5c 60 80 00 00 	movabs $0x80605c,%rdi
  80393e:	00 00 00 
  803941:	b8 00 00 00 00       	mov    $0x0,%eax
  803946:	48 ba 18 0b 80 00 00 	movabs $0x800b18,%rdx
  80394d:	00 00 00 
  803950:	ff d2                	callq  *%rdx
  803952:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803955:	89 c7                	mov    %eax,%edi
  803957:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  80395e:	00 00 00 
  803961:	ff d0                	callq  *%rax
  803963:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803966:	89 c7                	mov    %eax,%edi
  803968:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  80396f:	00 00 00 
  803972:	ff d0                	callq  *%rax
  803974:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803977:	e9 a1 00 00 00       	jmpq   803a1d <copy+0x1db>
  80397c:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803983:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803986:	ba 00 02 00 00       	mov    $0x200,%edx
  80398b:	48 89 ce             	mov    %rcx,%rsi
  80398e:	89 c7                	mov    %eax,%edi
  803990:	48 b8 07 2f 80 00 00 	movabs $0x802f07,%rax
  803997:	00 00 00 
  80399a:	ff d0                	callq  *%rax
  80399c:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80399f:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8039a3:	0f 8f 5f ff ff ff    	jg     803908 <copy+0xc6>
  8039a9:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8039ad:	79 47                	jns    8039f6 <copy+0x1b4>
  8039af:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8039b2:	89 c6                	mov    %eax,%esi
  8039b4:	48 bf 6f 60 80 00 00 	movabs $0x80606f,%rdi
  8039bb:	00 00 00 
  8039be:	b8 00 00 00 00       	mov    $0x0,%eax
  8039c3:	48 ba 18 0b 80 00 00 	movabs $0x800b18,%rdx
  8039ca:	00 00 00 
  8039cd:	ff d2                	callq  *%rdx
  8039cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039d2:	89 c7                	mov    %eax,%edi
  8039d4:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  8039db:	00 00 00 
  8039de:	ff d0                	callq  *%rax
  8039e0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8039e3:	89 c7                	mov    %eax,%edi
  8039e5:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  8039ec:	00 00 00 
  8039ef:	ff d0                	callq  *%rax
  8039f1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8039f4:	eb 27                	jmp    803a1d <copy+0x1db>
  8039f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039f9:	89 c7                	mov    %eax,%edi
  8039fb:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  803a02:	00 00 00 
  803a05:	ff d0                	callq  *%rax
  803a07:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803a0a:	89 c7                	mov    %eax,%edi
  803a0c:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  803a13:	00 00 00 
  803a16:	ff d0                	callq  *%rax
  803a18:	b8 00 00 00 00       	mov    $0x0,%eax
  803a1d:	c9                   	leaveq 
  803a1e:	c3                   	retq   

0000000000803a1f <spawn>:
  803a1f:	55                   	push   %rbp
  803a20:	48 89 e5             	mov    %rsp,%rbp
  803a23:	48 81 ec 00 03 00 00 	sub    $0x300,%rsp
  803a2a:	48 89 bd 08 fd ff ff 	mov    %rdi,-0x2f8(%rbp)
  803a31:	48 89 b5 00 fd ff ff 	mov    %rsi,-0x300(%rbp)
  803a38:	48 8b 85 08 fd ff ff 	mov    -0x2f8(%rbp),%rax
  803a3f:	be 00 00 00 00       	mov    $0x0,%esi
  803a44:	48 89 c7             	mov    %rax,%rdi
  803a47:	48 b8 e0 33 80 00 00 	movabs $0x8033e0,%rax
  803a4e:	00 00 00 
  803a51:	ff d0                	callq  *%rax
  803a53:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803a56:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803a5a:	79 08                	jns    803a64 <spawn+0x45>
  803a5c:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803a5f:	e9 11 03 00 00       	jmpq   803d75 <spawn+0x356>
  803a64:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803a67:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803a6a:	48 8d 85 d0 fd ff ff 	lea    -0x230(%rbp),%rax
  803a71:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  803a75:	48 8d 8d d0 fd ff ff 	lea    -0x230(%rbp),%rcx
  803a7c:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803a7f:	ba 00 02 00 00       	mov    $0x200,%edx
  803a84:	48 89 ce             	mov    %rcx,%rsi
  803a87:	89 c7                	mov    %eax,%edi
  803a89:	48 b8 dc 2f 80 00 00 	movabs $0x802fdc,%rax
  803a90:	00 00 00 
  803a93:	ff d0                	callq  *%rax
  803a95:	3d 00 02 00 00       	cmp    $0x200,%eax
  803a9a:	75 0d                	jne    803aa9 <spawn+0x8a>
  803a9c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803aa0:	8b 00                	mov    (%rax),%eax
  803aa2:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  803aa7:	74 43                	je     803aec <spawn+0xcd>
  803aa9:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803aac:	89 c7                	mov    %eax,%edi
  803aae:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  803ab5:	00 00 00 
  803ab8:	ff d0                	callq  *%rax
  803aba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803abe:	8b 00                	mov    (%rax),%eax
  803ac0:	ba 7f 45 4c 46       	mov    $0x464c457f,%edx
  803ac5:	89 c6                	mov    %eax,%esi
  803ac7:	48 bf 88 60 80 00 00 	movabs $0x806088,%rdi
  803ace:	00 00 00 
  803ad1:	b8 00 00 00 00       	mov    $0x0,%eax
  803ad6:	48 b9 18 0b 80 00 00 	movabs $0x800b18,%rcx
  803add:	00 00 00 
  803ae0:	ff d1                	callq  *%rcx
  803ae2:	b8 f1 ff ff ff       	mov    $0xfffffff1,%eax
  803ae7:	e9 89 02 00 00       	jmpq   803d75 <spawn+0x356>
  803aec:	b8 07 00 00 00       	mov    $0x7,%eax
  803af1:	cd 30                	int    $0x30
  803af3:	89 45 d0             	mov    %eax,-0x30(%rbp)
  803af6:	8b 45 d0             	mov    -0x30(%rbp),%eax
  803af9:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803afc:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803b00:	79 08                	jns    803b0a <spawn+0xeb>
  803b02:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803b05:	e9 6b 02 00 00       	jmpq   803d75 <spawn+0x356>
  803b0a:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803b0d:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  803b10:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803b13:	25 ff 03 00 00       	and    $0x3ff,%eax
  803b18:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  803b1f:	00 00 00 
  803b22:	48 98                	cltq   
  803b24:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  803b2b:	48 01 c2             	add    %rax,%rdx
  803b2e:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  803b35:	48 89 d6             	mov    %rdx,%rsi
  803b38:	ba 18 00 00 00       	mov    $0x18,%edx
  803b3d:	48 89 c7             	mov    %rax,%rdi
  803b40:	48 89 d1             	mov    %rdx,%rcx
  803b43:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  803b46:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b4a:	48 8b 40 18          	mov    0x18(%rax),%rax
  803b4e:	48 89 85 a8 fd ff ff 	mov    %rax,-0x258(%rbp)
  803b55:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  803b5c:	48 8d 90 b0 00 00 00 	lea    0xb0(%rax),%rdx
  803b63:	48 8b 8d 00 fd ff ff 	mov    -0x300(%rbp),%rcx
  803b6a:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803b6d:	48 89 ce             	mov    %rcx,%rsi
  803b70:	89 c7                	mov    %eax,%edi
  803b72:	48 b8 d9 3f 80 00 00 	movabs $0x803fd9,%rax
  803b79:	00 00 00 
  803b7c:	ff d0                	callq  *%rax
  803b7e:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803b81:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803b85:	79 08                	jns    803b8f <spawn+0x170>
  803b87:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803b8a:	e9 e6 01 00 00       	jmpq   803d75 <spawn+0x356>
  803b8f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b93:	48 8b 40 20          	mov    0x20(%rax),%rax
  803b97:	48 8d 95 d0 fd ff ff 	lea    -0x230(%rbp),%rdx
  803b9e:	48 01 d0             	add    %rdx,%rax
  803ba1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803ba5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803bac:	e9 80 00 00 00       	jmpq   803c31 <spawn+0x212>
  803bb1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bb5:	8b 00                	mov    (%rax),%eax
  803bb7:	83 f8 01             	cmp    $0x1,%eax
  803bba:	75 6b                	jne    803c27 <spawn+0x208>
  803bbc:	c7 45 ec 05 00 00 00 	movl   $0x5,-0x14(%rbp)
  803bc3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bc7:	8b 40 04             	mov    0x4(%rax),%eax
  803bca:	83 e0 02             	and    $0x2,%eax
  803bcd:	85 c0                	test   %eax,%eax
  803bcf:	74 04                	je     803bd5 <spawn+0x1b6>
  803bd1:	83 4d ec 02          	orl    $0x2,-0x14(%rbp)
  803bd5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bd9:	48 8b 40 08          	mov    0x8(%rax),%rax
  803bdd:	41 89 c1             	mov    %eax,%r9d
  803be0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803be4:	4c 8b 40 20          	mov    0x20(%rax),%r8
  803be8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bec:	48 8b 50 28          	mov    0x28(%rax),%rdx
  803bf0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bf4:	48 8b 70 10          	mov    0x10(%rax),%rsi
  803bf8:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  803bfb:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803bfe:	48 83 ec 08          	sub    $0x8,%rsp
  803c02:	8b 7d ec             	mov    -0x14(%rbp),%edi
  803c05:	57                   	push   %rdi
  803c06:	89 c7                	mov    %eax,%edi
  803c08:	48 b8 85 42 80 00 00 	movabs $0x804285,%rax
  803c0f:	00 00 00 
  803c12:	ff d0                	callq  *%rax
  803c14:	48 83 c4 10          	add    $0x10,%rsp
  803c18:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803c1b:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803c1f:	0f 88 2a 01 00 00    	js     803d4f <spawn+0x330>
  803c25:	eb 01                	jmp    803c28 <spawn+0x209>
  803c27:	90                   	nop
  803c28:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803c2c:	48 83 45 f0 38       	addq   $0x38,-0x10(%rbp)
  803c31:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c35:	0f b7 40 38          	movzwl 0x38(%rax),%eax
  803c39:	0f b7 c0             	movzwl %ax,%eax
  803c3c:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  803c3f:	0f 8f 6c ff ff ff    	jg     803bb1 <spawn+0x192>
  803c45:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803c48:	89 c7                	mov    %eax,%edi
  803c4a:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  803c51:	00 00 00 
  803c54:	ff d0                	callq  *%rax
  803c56:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
  803c5d:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803c60:	89 c7                	mov    %eax,%edi
  803c62:	48 b8 71 44 80 00 00 	movabs $0x804471,%rax
  803c69:	00 00 00 
  803c6c:	ff d0                	callq  *%rax
  803c6e:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803c71:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803c75:	79 30                	jns    803ca7 <spawn+0x288>
  803c77:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803c7a:	89 c1                	mov    %eax,%ecx
  803c7c:	48 ba a2 60 80 00 00 	movabs $0x8060a2,%rdx
  803c83:	00 00 00 
  803c86:	be 86 00 00 00       	mov    $0x86,%esi
  803c8b:	48 bf b8 60 80 00 00 	movabs $0x8060b8,%rdi
  803c92:	00 00 00 
  803c95:	b8 00 00 00 00       	mov    $0x0,%eax
  803c9a:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  803ca1:	00 00 00 
  803ca4:	41 ff d0             	callq  *%r8
  803ca7:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  803cae:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803cb1:	48 89 d6             	mov    %rdx,%rsi
  803cb4:	89 c7                	mov    %eax,%edi
  803cb6:	48 b8 23 21 80 00 00 	movabs $0x802123,%rax
  803cbd:	00 00 00 
  803cc0:	ff d0                	callq  *%rax
  803cc2:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803cc5:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803cc9:	79 30                	jns    803cfb <spawn+0x2dc>
  803ccb:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803cce:	89 c1                	mov    %eax,%ecx
  803cd0:	48 ba c7 60 80 00 00 	movabs $0x8060c7,%rdx
  803cd7:	00 00 00 
  803cda:	be 8a 00 00 00       	mov    $0x8a,%esi
  803cdf:	48 bf b8 60 80 00 00 	movabs $0x8060b8,%rdi
  803ce6:	00 00 00 
  803ce9:	b8 00 00 00 00       	mov    $0x0,%eax
  803cee:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  803cf5:	00 00 00 
  803cf8:	41 ff d0             	callq  *%r8
  803cfb:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803cfe:	be 02 00 00 00       	mov    $0x2,%esi
  803d03:	89 c7                	mov    %eax,%edi
  803d05:	48 b8 d6 20 80 00 00 	movabs $0x8020d6,%rax
  803d0c:	00 00 00 
  803d0f:	ff d0                	callq  *%rax
  803d11:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803d14:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803d18:	79 30                	jns    803d4a <spawn+0x32b>
  803d1a:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803d1d:	89 c1                	mov    %eax,%ecx
  803d1f:	48 ba e1 60 80 00 00 	movabs $0x8060e1,%rdx
  803d26:	00 00 00 
  803d29:	be 8d 00 00 00       	mov    $0x8d,%esi
  803d2e:	48 bf b8 60 80 00 00 	movabs $0x8060b8,%rdi
  803d35:	00 00 00 
  803d38:	b8 00 00 00 00       	mov    $0x0,%eax
  803d3d:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  803d44:	00 00 00 
  803d47:	41 ff d0             	callq  *%r8
  803d4a:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803d4d:	eb 26                	jmp    803d75 <spawn+0x356>
  803d4f:	90                   	nop
  803d50:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803d53:	89 c7                	mov    %eax,%edi
  803d55:	48 b8 19 1f 80 00 00 	movabs $0x801f19,%rax
  803d5c:	00 00 00 
  803d5f:	ff d0                	callq  *%rax
  803d61:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803d64:	89 c7                	mov    %eax,%edi
  803d66:	48 b8 e4 2c 80 00 00 	movabs $0x802ce4,%rax
  803d6d:	00 00 00 
  803d70:	ff d0                	callq  *%rax
  803d72:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803d75:	c9                   	leaveq 
  803d76:	c3                   	retq   

0000000000803d77 <spawnl>:
  803d77:	55                   	push   %rbp
  803d78:	48 89 e5             	mov    %rsp,%rbp
  803d7b:	41 55                	push   %r13
  803d7d:	41 54                	push   %r12
  803d7f:	53                   	push   %rbx
  803d80:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  803d87:	48 89 bd f8 fe ff ff 	mov    %rdi,-0x108(%rbp)
  803d8e:	48 89 b5 f0 fe ff ff 	mov    %rsi,-0x110(%rbp)
  803d95:	48 89 95 40 ff ff ff 	mov    %rdx,-0xc0(%rbp)
  803d9c:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
  803da3:	4c 89 85 50 ff ff ff 	mov    %r8,-0xb0(%rbp)
  803daa:	4c 89 8d 58 ff ff ff 	mov    %r9,-0xa8(%rbp)
  803db1:	84 c0                	test   %al,%al
  803db3:	74 26                	je     803ddb <spawnl+0x64>
  803db5:	0f 29 85 60 ff ff ff 	movaps %xmm0,-0xa0(%rbp)
  803dbc:	0f 29 8d 70 ff ff ff 	movaps %xmm1,-0x90(%rbp)
  803dc3:	0f 29 55 80          	movaps %xmm2,-0x80(%rbp)
  803dc7:	0f 29 5d 90          	movaps %xmm3,-0x70(%rbp)
  803dcb:	0f 29 65 a0          	movaps %xmm4,-0x60(%rbp)
  803dcf:	0f 29 6d b0          	movaps %xmm5,-0x50(%rbp)
  803dd3:	0f 29 75 c0          	movaps %xmm6,-0x40(%rbp)
  803dd7:	0f 29 7d d0          	movaps %xmm7,-0x30(%rbp)
  803ddb:	c7 85 2c ff ff ff 00 	movl   $0x0,-0xd4(%rbp)
  803de2:	00 00 00 
  803de5:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  803dec:	00 00 00 
  803def:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  803df6:	00 00 00 
  803df9:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803dfd:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  803e04:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  803e0b:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  803e12:	eb 07                	jmp    803e1b <spawnl+0xa4>
  803e14:	83 85 2c ff ff ff 01 	addl   $0x1,-0xd4(%rbp)
  803e1b:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  803e21:	83 f8 30             	cmp    $0x30,%eax
  803e24:	73 23                	jae    803e49 <spawnl+0xd2>
  803e26:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
  803e2d:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  803e33:	89 d2                	mov    %edx,%edx
  803e35:	48 01 d0             	add    %rdx,%rax
  803e38:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  803e3e:	83 c2 08             	add    $0x8,%edx
  803e41:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  803e47:	eb 12                	jmp    803e5b <spawnl+0xe4>
  803e49:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  803e50:	48 8d 50 08          	lea    0x8(%rax),%rdx
  803e54:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803e5b:	48 8b 00             	mov    (%rax),%rax
  803e5e:	48 85 c0             	test   %rax,%rax
  803e61:	75 b1                	jne    803e14 <spawnl+0x9d>
  803e63:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803e69:	83 c0 02             	add    $0x2,%eax
  803e6c:	48 89 e2             	mov    %rsp,%rdx
  803e6f:	48 89 d3             	mov    %rdx,%rbx
  803e72:	48 63 d0             	movslq %eax,%rdx
  803e75:	48 83 ea 01          	sub    $0x1,%rdx
  803e79:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
  803e80:	48 63 d0             	movslq %eax,%rdx
  803e83:	49 89 d4             	mov    %rdx,%r12
  803e86:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  803e8c:	48 63 d0             	movslq %eax,%rdx
  803e8f:	49 89 d2             	mov    %rdx,%r10
  803e92:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  803e98:	48 98                	cltq   
  803e9a:	48 c1 e0 03          	shl    $0x3,%rax
  803e9e:	48 8d 50 07          	lea    0x7(%rax),%rdx
  803ea2:	b8 10 00 00 00       	mov    $0x10,%eax
  803ea7:	48 83 e8 01          	sub    $0x1,%rax
  803eab:	48 01 d0             	add    %rdx,%rax
  803eae:	be 10 00 00 00       	mov    $0x10,%esi
  803eb3:	ba 00 00 00 00       	mov    $0x0,%edx
  803eb8:	48 f7 f6             	div    %rsi
  803ebb:	48 6b c0 10          	imul   $0x10,%rax,%rax
  803ebf:	48 29 c4             	sub    %rax,%rsp
  803ec2:	48 89 e0             	mov    %rsp,%rax
  803ec5:	48 83 c0 07          	add    $0x7,%rax
  803ec9:	48 c1 e8 03          	shr    $0x3,%rax
  803ecd:	48 c1 e0 03          	shl    $0x3,%rax
  803ed1:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
  803ed8:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803edf:	48 8b 95 f0 fe ff ff 	mov    -0x110(%rbp),%rdx
  803ee6:	48 89 10             	mov    %rdx,(%rax)
  803ee9:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803eef:	8d 50 01             	lea    0x1(%rax),%edx
  803ef2:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803ef9:	48 63 d2             	movslq %edx,%rdx
  803efc:	48 c7 04 d0 00 00 00 	movq   $0x0,(%rax,%rdx,8)
  803f03:	00 
  803f04:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  803f0b:	00 00 00 
  803f0e:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  803f15:	00 00 00 
  803f18:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803f1c:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  803f23:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  803f2a:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  803f31:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%rbp)
  803f38:	00 00 00 
  803f3b:	eb 60                	jmp    803f9d <spawnl+0x226>
  803f3d:	8b 85 28 ff ff ff    	mov    -0xd8(%rbp),%eax
  803f43:	8d 48 01             	lea    0x1(%rax),%ecx
  803f46:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  803f4c:	83 f8 30             	cmp    $0x30,%eax
  803f4f:	73 23                	jae    803f74 <spawnl+0x1fd>
  803f51:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
  803f58:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  803f5e:	89 d2                	mov    %edx,%edx
  803f60:	48 01 d0             	add    %rdx,%rax
  803f63:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  803f69:	83 c2 08             	add    $0x8,%edx
  803f6c:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  803f72:	eb 12                	jmp    803f86 <spawnl+0x20f>
  803f74:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  803f7b:	48 8d 50 08          	lea    0x8(%rax),%rdx
  803f7f:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803f86:	48 8b 10             	mov    (%rax),%rdx
  803f89:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803f90:	89 c9                	mov    %ecx,%ecx
  803f92:	48 89 14 c8          	mov    %rdx,(%rax,%rcx,8)
  803f96:	83 85 28 ff ff ff 01 	addl   $0x1,-0xd8(%rbp)
  803f9d:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803fa3:	39 85 28 ff ff ff    	cmp    %eax,-0xd8(%rbp)
  803fa9:	72 92                	jb     803f3d <spawnl+0x1c6>
  803fab:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  803fb2:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
  803fb9:	48 89 d6             	mov    %rdx,%rsi
  803fbc:	48 89 c7             	mov    %rax,%rdi
  803fbf:	48 b8 1f 3a 80 00 00 	movabs $0x803a1f,%rax
  803fc6:	00 00 00 
  803fc9:	ff d0                	callq  *%rax
  803fcb:	48 89 dc             	mov    %rbx,%rsp
  803fce:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
  803fd2:	5b                   	pop    %rbx
  803fd3:	41 5c                	pop    %r12
  803fd5:	41 5d                	pop    %r13
  803fd7:	5d                   	pop    %rbp
  803fd8:	c3                   	retq   

0000000000803fd9 <init_stack>:
  803fd9:	55                   	push   %rbp
  803fda:	48 89 e5             	mov    %rsp,%rbp
  803fdd:	48 83 ec 50          	sub    $0x50,%rsp
  803fe1:	89 7d cc             	mov    %edi,-0x34(%rbp)
  803fe4:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  803fe8:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  803fec:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803ff3:	00 
  803ff4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  803ffb:	eb 33                	jmp    804030 <init_stack+0x57>
  803ffd:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804000:	48 98                	cltq   
  804002:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  804009:	00 
  80400a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80400e:	48 01 d0             	add    %rdx,%rax
  804011:	48 8b 00             	mov    (%rax),%rax
  804014:	48 89 c7             	mov    %rax,%rdi
  804017:	48 b8 3c 16 80 00 00 	movabs $0x80163c,%rax
  80401e:	00 00 00 
  804021:	ff d0                	callq  *%rax
  804023:	83 c0 01             	add    $0x1,%eax
  804026:	48 98                	cltq   
  804028:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80402c:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  804030:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804033:	48 98                	cltq   
  804035:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80403c:	00 
  80403d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  804041:	48 01 d0             	add    %rdx,%rax
  804044:	48 8b 00             	mov    (%rax),%rax
  804047:	48 85 c0             	test   %rax,%rax
  80404a:	75 b1                	jne    803ffd <init_stack+0x24>
  80404c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804050:	48 f7 d8             	neg    %rax
  804053:	48 05 00 10 40 00    	add    $0x401000,%rax
  804059:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80405d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804061:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  804065:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804069:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  80406d:	48 89 c2             	mov    %rax,%rdx
  804070:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804073:	83 c0 01             	add    $0x1,%eax
  804076:	c1 e0 03             	shl    $0x3,%eax
  804079:	48 98                	cltq   
  80407b:	48 f7 d8             	neg    %rax
  80407e:	48 01 d0             	add    %rdx,%rax
  804081:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  804085:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804089:	48 83 e8 10          	sub    $0x10,%rax
  80408d:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
  804093:	77 0a                	ja     80409f <init_stack+0xc6>
  804095:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
  80409a:	e9 e4 01 00 00       	jmpq   804283 <init_stack+0x2aa>
  80409f:	ba 07 00 00 00       	mov    $0x7,%edx
  8040a4:	be 00 00 40 00       	mov    $0x400000,%esi
  8040a9:	bf 00 00 00 00       	mov    $0x0,%edi
  8040ae:	48 b8 d8 1f 80 00 00 	movabs $0x801fd8,%rax
  8040b5:	00 00 00 
  8040b8:	ff d0                	callq  *%rax
  8040ba:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8040bd:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8040c1:	79 08                	jns    8040cb <init_stack+0xf2>
  8040c3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8040c6:	e9 b8 01 00 00       	jmpq   804283 <init_stack+0x2aa>
  8040cb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  8040d2:	e9 8a 00 00 00       	jmpq   804161 <init_stack+0x188>
  8040d7:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8040da:	48 98                	cltq   
  8040dc:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8040e3:	00 
  8040e4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8040e8:	48 01 d0             	add    %rdx,%rax
  8040eb:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  8040f0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8040f4:	48 01 ca             	add    %rcx,%rdx
  8040f7:	48 81 ea 00 00 40 00 	sub    $0x400000,%rdx
  8040fe:	48 89 10             	mov    %rdx,(%rax)
  804101:	8b 45 f0             	mov    -0x10(%rbp),%eax
  804104:	48 98                	cltq   
  804106:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80410d:	00 
  80410e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  804112:	48 01 d0             	add    %rdx,%rax
  804115:	48 8b 10             	mov    (%rax),%rdx
  804118:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80411c:	48 89 d6             	mov    %rdx,%rsi
  80411f:	48 89 c7             	mov    %rax,%rdi
  804122:	48 b8 a8 16 80 00 00 	movabs $0x8016a8,%rax
  804129:	00 00 00 
  80412c:	ff d0                	callq  *%rax
  80412e:	8b 45 f0             	mov    -0x10(%rbp),%eax
  804131:	48 98                	cltq   
  804133:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80413a:	00 
  80413b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80413f:	48 01 d0             	add    %rdx,%rax
  804142:	48 8b 00             	mov    (%rax),%rax
  804145:	48 89 c7             	mov    %rax,%rdi
  804148:	48 b8 3c 16 80 00 00 	movabs $0x80163c,%rax
  80414f:	00 00 00 
  804152:	ff d0                	callq  *%rax
  804154:	83 c0 01             	add    $0x1,%eax
  804157:	48 98                	cltq   
  804159:	48 01 45 e0          	add    %rax,-0x20(%rbp)
  80415d:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
  804161:	8b 45 f0             	mov    -0x10(%rbp),%eax
  804164:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  804167:	0f 8c 6a ff ff ff    	jl     8040d7 <init_stack+0xfe>
  80416d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804170:	48 98                	cltq   
  804172:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  804179:	00 
  80417a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80417e:	48 01 d0             	add    %rdx,%rax
  804181:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  804188:	48 81 7d e0 00 10 40 	cmpq   $0x401000,-0x20(%rbp)
  80418f:	00 
  804190:	74 35                	je     8041c7 <init_stack+0x1ee>
  804192:	48 b9 f8 60 80 00 00 	movabs $0x8060f8,%rcx
  804199:	00 00 00 
  80419c:	48 ba 1e 61 80 00 00 	movabs $0x80611e,%rdx
  8041a3:	00 00 00 
  8041a6:	be f6 00 00 00       	mov    $0xf6,%esi
  8041ab:	48 bf b8 60 80 00 00 	movabs $0x8060b8,%rdi
  8041b2:	00 00 00 
  8041b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8041ba:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  8041c1:	00 00 00 
  8041c4:	41 ff d0             	callq  *%r8
  8041c7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041cb:	48 83 e8 08          	sub    $0x8,%rax
  8041cf:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  8041d4:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8041d8:	48 01 ca             	add    %rcx,%rdx
  8041db:	48 81 ea 00 00 40 00 	sub    $0x400000,%rdx
  8041e2:	48 89 10             	mov    %rdx,(%rax)
  8041e5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041e9:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  8041ed:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8041f0:	48 98                	cltq   
  8041f2:	48 89 02             	mov    %rax,(%rdx)
  8041f5:	ba f0 cf 7f ef       	mov    $0xef7fcff0,%edx
  8041fa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8041fe:	48 01 d0             	add    %rdx,%rax
  804201:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  804207:	48 89 c2             	mov    %rax,%rdx
  80420a:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  80420e:	48 89 10             	mov    %rdx,(%rax)
  804211:	8b 45 cc             	mov    -0x34(%rbp),%eax
  804214:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  80421a:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  80421f:	89 c2                	mov    %eax,%edx
  804221:	be 00 00 40 00       	mov    $0x400000,%esi
  804226:	bf 00 00 00 00       	mov    $0x0,%edi
  80422b:	48 b8 2a 20 80 00 00 	movabs $0x80202a,%rax
  804232:	00 00 00 
  804235:	ff d0                	callq  *%rax
  804237:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80423a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80423e:	78 26                	js     804266 <init_stack+0x28d>
  804240:	be 00 00 40 00       	mov    $0x400000,%esi
  804245:	bf 00 00 00 00       	mov    $0x0,%edi
  80424a:	48 b8 8a 20 80 00 00 	movabs $0x80208a,%rax
  804251:	00 00 00 
  804254:	ff d0                	callq  *%rax
  804256:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804259:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80425d:	78 0a                	js     804269 <init_stack+0x290>
  80425f:	b8 00 00 00 00       	mov    $0x0,%eax
  804264:	eb 1d                	jmp    804283 <init_stack+0x2aa>
  804266:	90                   	nop
  804267:	eb 01                	jmp    80426a <init_stack+0x291>
  804269:	90                   	nop
  80426a:	be 00 00 40 00       	mov    $0x400000,%esi
  80426f:	bf 00 00 00 00       	mov    $0x0,%edi
  804274:	48 b8 8a 20 80 00 00 	movabs $0x80208a,%rax
  80427b:	00 00 00 
  80427e:	ff d0                	callq  *%rax
  804280:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804283:	c9                   	leaveq 
  804284:	c3                   	retq   

0000000000804285 <map_segment>:
  804285:	55                   	push   %rbp
  804286:	48 89 e5             	mov    %rsp,%rbp
  804289:	48 83 ec 50          	sub    $0x50,%rsp
  80428d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804290:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804294:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804298:	89 4d d8             	mov    %ecx,-0x28(%rbp)
  80429b:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  80429f:	44 89 4d bc          	mov    %r9d,-0x44(%rbp)
  8042a3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042a7:	25 ff 0f 00 00       	and    $0xfff,%eax
  8042ac:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8042af:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8042b3:	74 21                	je     8042d6 <map_segment+0x51>
  8042b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042b8:	48 98                	cltq   
  8042ba:	48 29 45 d0          	sub    %rax,-0x30(%rbp)
  8042be:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042c1:	48 98                	cltq   
  8042c3:	48 01 45 c8          	add    %rax,-0x38(%rbp)
  8042c7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042ca:	48 98                	cltq   
  8042cc:	48 01 45 c0          	add    %rax,-0x40(%rbp)
  8042d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042d3:	29 45 bc             	sub    %eax,-0x44(%rbp)
  8042d6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8042dd:	e9 79 01 00 00       	jmpq   80445b <map_segment+0x1d6>
  8042e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042e5:	48 98                	cltq   
  8042e7:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
  8042eb:	72 3c                	jb     804329 <map_segment+0xa4>
  8042ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042f0:	48 63 d0             	movslq %eax,%rdx
  8042f3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042f7:	48 01 d0             	add    %rdx,%rax
  8042fa:	48 89 c1             	mov    %rax,%rcx
  8042fd:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804300:	8b 55 10             	mov    0x10(%rbp),%edx
  804303:	48 89 ce             	mov    %rcx,%rsi
  804306:	89 c7                	mov    %eax,%edi
  804308:	48 b8 d8 1f 80 00 00 	movabs $0x801fd8,%rax
  80430f:	00 00 00 
  804312:	ff d0                	callq  *%rax
  804314:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804317:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80431b:	0f 89 33 01 00 00    	jns    804454 <map_segment+0x1cf>
  804321:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804324:	e9 46 01 00 00       	jmpq   80446f <map_segment+0x1ea>
  804329:	ba 07 00 00 00       	mov    $0x7,%edx
  80432e:	be 00 00 40 00       	mov    $0x400000,%esi
  804333:	bf 00 00 00 00       	mov    $0x0,%edi
  804338:	48 b8 d8 1f 80 00 00 	movabs $0x801fd8,%rax
  80433f:	00 00 00 
  804342:	ff d0                	callq  *%rax
  804344:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804347:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80434b:	79 08                	jns    804355 <map_segment+0xd0>
  80434d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804350:	e9 1a 01 00 00       	jmpq   80446f <map_segment+0x1ea>
  804355:	8b 55 bc             	mov    -0x44(%rbp),%edx
  804358:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80435b:	01 c2                	add    %eax,%edx
  80435d:	8b 45 d8             	mov    -0x28(%rbp),%eax
  804360:	89 d6                	mov    %edx,%esi
  804362:	89 c7                	mov    %eax,%edi
  804364:	48 b8 26 31 80 00 00 	movabs $0x803126,%rax
  80436b:	00 00 00 
  80436e:	ff d0                	callq  *%rax
  804370:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804373:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  804377:	79 08                	jns    804381 <map_segment+0xfc>
  804379:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80437c:	e9 ee 00 00 00       	jmpq   80446f <map_segment+0x1ea>
  804381:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  804388:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80438b:	48 98                	cltq   
  80438d:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  804391:	48 29 c2             	sub    %rax,%rdx
  804394:	48 89 d0             	mov    %rdx,%rax
  804397:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80439b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80439e:	48 63 d0             	movslq %eax,%rdx
  8043a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043a5:	48 39 c2             	cmp    %rax,%rdx
  8043a8:	48 0f 47 d0          	cmova  %rax,%rdx
  8043ac:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8043af:	be 00 00 40 00       	mov    $0x400000,%esi
  8043b4:	89 c7                	mov    %eax,%edi
  8043b6:	48 b8 dc 2f 80 00 00 	movabs $0x802fdc,%rax
  8043bd:	00 00 00 
  8043c0:	ff d0                	callq  *%rax
  8043c2:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8043c5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8043c9:	79 08                	jns    8043d3 <map_segment+0x14e>
  8043cb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8043ce:	e9 9c 00 00 00       	jmpq   80446f <map_segment+0x1ea>
  8043d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043d6:	48 63 d0             	movslq %eax,%rdx
  8043d9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8043dd:	48 01 d0             	add    %rdx,%rax
  8043e0:	48 89 c2             	mov    %rax,%rdx
  8043e3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8043e6:	44 8b 45 10          	mov    0x10(%rbp),%r8d
  8043ea:	48 89 d1             	mov    %rdx,%rcx
  8043ed:	89 c2                	mov    %eax,%edx
  8043ef:	be 00 00 40 00       	mov    $0x400000,%esi
  8043f4:	bf 00 00 00 00       	mov    $0x0,%edi
  8043f9:	48 b8 2a 20 80 00 00 	movabs $0x80202a,%rax
  804400:	00 00 00 
  804403:	ff d0                	callq  *%rax
  804405:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804408:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80440c:	79 30                	jns    80443e <map_segment+0x1b9>
  80440e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804411:	89 c1                	mov    %eax,%ecx
  804413:	48 ba 33 61 80 00 00 	movabs $0x806133,%rdx
  80441a:	00 00 00 
  80441d:	be 29 01 00 00       	mov    $0x129,%esi
  804422:	48 bf b8 60 80 00 00 	movabs $0x8060b8,%rdi
  804429:	00 00 00 
  80442c:	b8 00 00 00 00       	mov    $0x0,%eax
  804431:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  804438:	00 00 00 
  80443b:	41 ff d0             	callq  *%r8
  80443e:	be 00 00 40 00       	mov    $0x400000,%esi
  804443:	bf 00 00 00 00       	mov    $0x0,%edi
  804448:	48 b8 8a 20 80 00 00 	movabs $0x80208a,%rax
  80444f:	00 00 00 
  804452:	ff d0                	callq  *%rax
  804454:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
  80445b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80445e:	48 98                	cltq   
  804460:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804464:	0f 82 78 fe ff ff    	jb     8042e2 <map_segment+0x5d>
  80446a:	b8 00 00 00 00       	mov    $0x0,%eax
  80446f:	c9                   	leaveq 
  804470:	c3                   	retq   

0000000000804471 <copy_shared_pages>:
  804471:	55                   	push   %rbp
  804472:	48 89 e5             	mov    %rsp,%rbp
  804475:	48 83 ec 30          	sub    $0x30,%rsp
  804479:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80447c:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804483:	00 
  804484:	e9 eb 00 00 00       	jmpq   804574 <copy_shared_pages+0x103>
  804489:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80448d:	48 c1 f8 12          	sar    $0x12,%rax
  804491:	48 89 c2             	mov    %rax,%rdx
  804494:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  80449b:	01 00 00 
  80449e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8044a2:	83 e0 01             	and    $0x1,%eax
  8044a5:	48 85 c0             	test   %rax,%rax
  8044a8:	74 21                	je     8044cb <copy_shared_pages+0x5a>
  8044aa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044ae:	48 c1 f8 09          	sar    $0x9,%rax
  8044b2:	48 89 c2             	mov    %rax,%rdx
  8044b5:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8044bc:	01 00 00 
  8044bf:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8044c3:	83 e0 01             	and    $0x1,%eax
  8044c6:	48 85 c0             	test   %rax,%rax
  8044c9:	75 0d                	jne    8044d8 <copy_shared_pages+0x67>
  8044cb:	48 81 45 f8 00 02 00 	addq   $0x200,-0x8(%rbp)
  8044d2:	00 
  8044d3:	e9 9c 00 00 00       	jmpq   804574 <copy_shared_pages+0x103>
  8044d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044dc:	48 05 00 02 00 00    	add    $0x200,%rax
  8044e2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8044e6:	eb 7e                	jmp    804566 <copy_shared_pages+0xf5>
  8044e8:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8044ef:	01 00 00 
  8044f2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8044f6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8044fa:	25 01 04 00 00       	and    $0x401,%eax
  8044ff:	48 3d 01 04 00 00    	cmp    $0x401,%rax
  804505:	75 5a                	jne    804561 <copy_shared_pages+0xf0>
  804507:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80450b:	48 c1 e0 0c          	shl    $0xc,%rax
  80450f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804513:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80451a:	01 00 00 
  80451d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804521:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804525:	25 07 0e 00 00       	and    $0xe07,%eax
  80452a:	89 c6                	mov    %eax,%esi
  80452c:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  804530:	8b 55 dc             	mov    -0x24(%rbp),%edx
  804533:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804537:	41 89 f0             	mov    %esi,%r8d
  80453a:	48 89 c6             	mov    %rax,%rsi
  80453d:	bf 00 00 00 00       	mov    $0x0,%edi
  804542:	48 b8 2a 20 80 00 00 	movabs $0x80202a,%rax
  804549:	00 00 00 
  80454c:	ff d0                	callq  *%rax
  80454e:	48 98                	cltq   
  804550:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804554:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804559:	79 06                	jns    804561 <copy_shared_pages+0xf0>
  80455b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80455f:	eb 28                	jmp    804589 <copy_shared_pages+0x118>
  804561:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804566:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80456a:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80456e:	0f 8c 74 ff ff ff    	jl     8044e8 <copy_shared_pages+0x77>
  804574:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804578:	48 3d ff 07 00 08    	cmp    $0x80007ff,%rax
  80457e:	0f 86 05 ff ff ff    	jbe    804489 <copy_shared_pages+0x18>
  804584:	b8 00 00 00 00       	mov    $0x0,%eax
  804589:	c9                   	leaveq 
  80458a:	c3                   	retq   

000000000080458b <fd2sockid>:
  80458b:	55                   	push   %rbp
  80458c:	48 89 e5             	mov    %rsp,%rbp
  80458f:	48 83 ec 20          	sub    $0x20,%rsp
  804593:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804596:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80459a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80459d:	48 89 d6             	mov    %rdx,%rsi
  8045a0:	89 c7                	mov    %eax,%edi
  8045a2:	48 b8 d2 2a 80 00 00 	movabs $0x802ad2,%rax
  8045a9:	00 00 00 
  8045ac:	ff d0                	callq  *%rax
  8045ae:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8045b1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8045b5:	79 05                	jns    8045bc <fd2sockid+0x31>
  8045b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045ba:	eb 24                	jmp    8045e0 <fd2sockid+0x55>
  8045bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045c0:	8b 10                	mov    (%rax),%edx
  8045c2:	48 b8 c0 80 80 00 00 	movabs $0x8080c0,%rax
  8045c9:	00 00 00 
  8045cc:	8b 00                	mov    (%rax),%eax
  8045ce:	39 c2                	cmp    %eax,%edx
  8045d0:	74 07                	je     8045d9 <fd2sockid+0x4e>
  8045d2:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8045d7:	eb 07                	jmp    8045e0 <fd2sockid+0x55>
  8045d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045dd:	8b 40 0c             	mov    0xc(%rax),%eax
  8045e0:	c9                   	leaveq 
  8045e1:	c3                   	retq   

00000000008045e2 <alloc_sockfd>:
  8045e2:	55                   	push   %rbp
  8045e3:	48 89 e5             	mov    %rsp,%rbp
  8045e6:	48 83 ec 20          	sub    $0x20,%rsp
  8045ea:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8045ed:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8045f1:	48 89 c7             	mov    %rax,%rdi
  8045f4:	48 b8 3a 2a 80 00 00 	movabs $0x802a3a,%rax
  8045fb:	00 00 00 
  8045fe:	ff d0                	callq  *%rax
  804600:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804603:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804607:	78 26                	js     80462f <alloc_sockfd+0x4d>
  804609:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80460d:	ba 07 04 00 00       	mov    $0x407,%edx
  804612:	48 89 c6             	mov    %rax,%rsi
  804615:	bf 00 00 00 00       	mov    $0x0,%edi
  80461a:	48 b8 d8 1f 80 00 00 	movabs $0x801fd8,%rax
  804621:	00 00 00 
  804624:	ff d0                	callq  *%rax
  804626:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804629:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80462d:	79 16                	jns    804645 <alloc_sockfd+0x63>
  80462f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804632:	89 c7                	mov    %eax,%edi
  804634:	48 b8 f1 4a 80 00 00 	movabs $0x804af1,%rax
  80463b:	00 00 00 
  80463e:	ff d0                	callq  *%rax
  804640:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804643:	eb 3a                	jmp    80467f <alloc_sockfd+0x9d>
  804645:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804649:	48 ba c0 80 80 00 00 	movabs $0x8080c0,%rdx
  804650:	00 00 00 
  804653:	8b 12                	mov    (%rdx),%edx
  804655:	89 10                	mov    %edx,(%rax)
  804657:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80465b:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804662:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804666:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804669:	89 50 0c             	mov    %edx,0xc(%rax)
  80466c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804670:	48 89 c7             	mov    %rax,%rdi
  804673:	48 b8 ec 29 80 00 00 	movabs $0x8029ec,%rax
  80467a:	00 00 00 
  80467d:	ff d0                	callq  *%rax
  80467f:	c9                   	leaveq 
  804680:	c3                   	retq   

0000000000804681 <accept>:
  804681:	55                   	push   %rbp
  804682:	48 89 e5             	mov    %rsp,%rbp
  804685:	48 83 ec 30          	sub    $0x30,%rsp
  804689:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80468c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804690:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804694:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804697:	89 c7                	mov    %eax,%edi
  804699:	48 b8 8b 45 80 00 00 	movabs $0x80458b,%rax
  8046a0:	00 00 00 
  8046a3:	ff d0                	callq  *%rax
  8046a5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046a8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046ac:	79 05                	jns    8046b3 <accept+0x32>
  8046ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046b1:	eb 3b                	jmp    8046ee <accept+0x6d>
  8046b3:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8046b7:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8046bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046be:	48 89 ce             	mov    %rcx,%rsi
  8046c1:	89 c7                	mov    %eax,%edi
  8046c3:	48 b8 ce 49 80 00 00 	movabs $0x8049ce,%rax
  8046ca:	00 00 00 
  8046cd:	ff d0                	callq  *%rax
  8046cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046d2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046d6:	79 05                	jns    8046dd <accept+0x5c>
  8046d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046db:	eb 11                	jmp    8046ee <accept+0x6d>
  8046dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046e0:	89 c7                	mov    %eax,%edi
  8046e2:	48 b8 e2 45 80 00 00 	movabs $0x8045e2,%rax
  8046e9:	00 00 00 
  8046ec:	ff d0                	callq  *%rax
  8046ee:	c9                   	leaveq 
  8046ef:	c3                   	retq   

00000000008046f0 <bind>:
  8046f0:	55                   	push   %rbp
  8046f1:	48 89 e5             	mov    %rsp,%rbp
  8046f4:	48 83 ec 20          	sub    $0x20,%rsp
  8046f8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8046fb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8046ff:	89 55 e8             	mov    %edx,-0x18(%rbp)
  804702:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804705:	89 c7                	mov    %eax,%edi
  804707:	48 b8 8b 45 80 00 00 	movabs $0x80458b,%rax
  80470e:	00 00 00 
  804711:	ff d0                	callq  *%rax
  804713:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804716:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80471a:	79 05                	jns    804721 <bind+0x31>
  80471c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80471f:	eb 1b                	jmp    80473c <bind+0x4c>
  804721:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804724:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  804728:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80472b:	48 89 ce             	mov    %rcx,%rsi
  80472e:	89 c7                	mov    %eax,%edi
  804730:	48 b8 4d 4a 80 00 00 	movabs $0x804a4d,%rax
  804737:	00 00 00 
  80473a:	ff d0                	callq  *%rax
  80473c:	c9                   	leaveq 
  80473d:	c3                   	retq   

000000000080473e <shutdown>:
  80473e:	55                   	push   %rbp
  80473f:	48 89 e5             	mov    %rsp,%rbp
  804742:	48 83 ec 20          	sub    $0x20,%rsp
  804746:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804749:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80474c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80474f:	89 c7                	mov    %eax,%edi
  804751:	48 b8 8b 45 80 00 00 	movabs $0x80458b,%rax
  804758:	00 00 00 
  80475b:	ff d0                	callq  *%rax
  80475d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804760:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804764:	79 05                	jns    80476b <shutdown+0x2d>
  804766:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804769:	eb 16                	jmp    804781 <shutdown+0x43>
  80476b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80476e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804771:	89 d6                	mov    %edx,%esi
  804773:	89 c7                	mov    %eax,%edi
  804775:	48 b8 b1 4a 80 00 00 	movabs $0x804ab1,%rax
  80477c:	00 00 00 
  80477f:	ff d0                	callq  *%rax
  804781:	c9                   	leaveq 
  804782:	c3                   	retq   

0000000000804783 <devsock_close>:
  804783:	55                   	push   %rbp
  804784:	48 89 e5             	mov    %rsp,%rbp
  804787:	48 83 ec 10          	sub    $0x10,%rsp
  80478b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80478f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804793:	48 89 c7             	mov    %rax,%rdi
  804796:	48 b8 4f 57 80 00 00 	movabs $0x80574f,%rax
  80479d:	00 00 00 
  8047a0:	ff d0                	callq  *%rax
  8047a2:	83 f8 01             	cmp    $0x1,%eax
  8047a5:	75 17                	jne    8047be <devsock_close+0x3b>
  8047a7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8047ab:	8b 40 0c             	mov    0xc(%rax),%eax
  8047ae:	89 c7                	mov    %eax,%edi
  8047b0:	48 b8 f1 4a 80 00 00 	movabs $0x804af1,%rax
  8047b7:	00 00 00 
  8047ba:	ff d0                	callq  *%rax
  8047bc:	eb 05                	jmp    8047c3 <devsock_close+0x40>
  8047be:	b8 00 00 00 00       	mov    $0x0,%eax
  8047c3:	c9                   	leaveq 
  8047c4:	c3                   	retq   

00000000008047c5 <connect>:
  8047c5:	55                   	push   %rbp
  8047c6:	48 89 e5             	mov    %rsp,%rbp
  8047c9:	48 83 ec 20          	sub    $0x20,%rsp
  8047cd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8047d0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8047d4:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8047d7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8047da:	89 c7                	mov    %eax,%edi
  8047dc:	48 b8 8b 45 80 00 00 	movabs $0x80458b,%rax
  8047e3:	00 00 00 
  8047e6:	ff d0                	callq  *%rax
  8047e8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8047eb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8047ef:	79 05                	jns    8047f6 <connect+0x31>
  8047f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047f4:	eb 1b                	jmp    804811 <connect+0x4c>
  8047f6:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8047f9:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8047fd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804800:	48 89 ce             	mov    %rcx,%rsi
  804803:	89 c7                	mov    %eax,%edi
  804805:	48 b8 1e 4b 80 00 00 	movabs $0x804b1e,%rax
  80480c:	00 00 00 
  80480f:	ff d0                	callq  *%rax
  804811:	c9                   	leaveq 
  804812:	c3                   	retq   

0000000000804813 <listen>:
  804813:	55                   	push   %rbp
  804814:	48 89 e5             	mov    %rsp,%rbp
  804817:	48 83 ec 20          	sub    $0x20,%rsp
  80481b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80481e:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804821:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804824:	89 c7                	mov    %eax,%edi
  804826:	48 b8 8b 45 80 00 00 	movabs $0x80458b,%rax
  80482d:	00 00 00 
  804830:	ff d0                	callq  *%rax
  804832:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804835:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804839:	79 05                	jns    804840 <listen+0x2d>
  80483b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80483e:	eb 16                	jmp    804856 <listen+0x43>
  804840:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804843:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804846:	89 d6                	mov    %edx,%esi
  804848:	89 c7                	mov    %eax,%edi
  80484a:	48 b8 82 4b 80 00 00 	movabs $0x804b82,%rax
  804851:	00 00 00 
  804854:	ff d0                	callq  *%rax
  804856:	c9                   	leaveq 
  804857:	c3                   	retq   

0000000000804858 <devsock_read>:
  804858:	55                   	push   %rbp
  804859:	48 89 e5             	mov    %rsp,%rbp
  80485c:	48 83 ec 20          	sub    $0x20,%rsp
  804860:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804864:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804868:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80486c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804870:	89 c2                	mov    %eax,%edx
  804872:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804876:	8b 40 0c             	mov    0xc(%rax),%eax
  804879:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80487d:	b9 00 00 00 00       	mov    $0x0,%ecx
  804882:	89 c7                	mov    %eax,%edi
  804884:	48 b8 c2 4b 80 00 00 	movabs $0x804bc2,%rax
  80488b:	00 00 00 
  80488e:	ff d0                	callq  *%rax
  804890:	c9                   	leaveq 
  804891:	c3                   	retq   

0000000000804892 <devsock_write>:
  804892:	55                   	push   %rbp
  804893:	48 89 e5             	mov    %rsp,%rbp
  804896:	48 83 ec 20          	sub    $0x20,%rsp
  80489a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80489e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8048a2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8048a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048aa:	89 c2                	mov    %eax,%edx
  8048ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8048b0:	8b 40 0c             	mov    0xc(%rax),%eax
  8048b3:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8048b7:	b9 00 00 00 00       	mov    $0x0,%ecx
  8048bc:	89 c7                	mov    %eax,%edi
  8048be:	48 b8 8e 4c 80 00 00 	movabs $0x804c8e,%rax
  8048c5:	00 00 00 
  8048c8:	ff d0                	callq  *%rax
  8048ca:	c9                   	leaveq 
  8048cb:	c3                   	retq   

00000000008048cc <devsock_stat>:
  8048cc:	55                   	push   %rbp
  8048cd:	48 89 e5             	mov    %rsp,%rbp
  8048d0:	48 83 ec 10          	sub    $0x10,%rsp
  8048d4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8048d8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8048dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8048e0:	48 be 55 61 80 00 00 	movabs $0x806155,%rsi
  8048e7:	00 00 00 
  8048ea:	48 89 c7             	mov    %rax,%rdi
  8048ed:	48 b8 a8 16 80 00 00 	movabs $0x8016a8,%rax
  8048f4:	00 00 00 
  8048f7:	ff d0                	callq  *%rax
  8048f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8048fe:	c9                   	leaveq 
  8048ff:	c3                   	retq   

0000000000804900 <socket>:
  804900:	55                   	push   %rbp
  804901:	48 89 e5             	mov    %rsp,%rbp
  804904:	48 83 ec 20          	sub    $0x20,%rsp
  804908:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80490b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80490e:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  804911:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  804914:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804917:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80491a:	89 ce                	mov    %ecx,%esi
  80491c:	89 c7                	mov    %eax,%edi
  80491e:	48 b8 46 4d 80 00 00 	movabs $0x804d46,%rax
  804925:	00 00 00 
  804928:	ff d0                	callq  *%rax
  80492a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80492d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804931:	79 05                	jns    804938 <socket+0x38>
  804933:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804936:	eb 11                	jmp    804949 <socket+0x49>
  804938:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80493b:	89 c7                	mov    %eax,%edi
  80493d:	48 b8 e2 45 80 00 00 	movabs $0x8045e2,%rax
  804944:	00 00 00 
  804947:	ff d0                	callq  *%rax
  804949:	c9                   	leaveq 
  80494a:	c3                   	retq   

000000000080494b <nsipc>:
  80494b:	55                   	push   %rbp
  80494c:	48 89 e5             	mov    %rsp,%rbp
  80494f:	48 83 ec 10          	sub    $0x10,%rsp
  804953:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804956:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  80495d:	00 00 00 
  804960:	8b 00                	mov    (%rax),%eax
  804962:	85 c0                	test   %eax,%eax
  804964:	75 1f                	jne    804985 <nsipc+0x3a>
  804966:	bf 02 00 00 00       	mov    $0x2,%edi
  80496b:	48 b8 de 56 80 00 00 	movabs $0x8056de,%rax
  804972:	00 00 00 
  804975:	ff d0                	callq  *%rax
  804977:	89 c2                	mov    %eax,%edx
  804979:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  804980:	00 00 00 
  804983:	89 10                	mov    %edx,(%rax)
  804985:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  80498c:	00 00 00 
  80498f:	8b 00                	mov    (%rax),%eax
  804991:	8b 75 fc             	mov    -0x4(%rbp),%esi
  804994:	b9 07 00 00 00       	mov    $0x7,%ecx
  804999:	48 ba 00 c0 80 00 00 	movabs $0x80c000,%rdx
  8049a0:	00 00 00 
  8049a3:	89 c7                	mov    %eax,%edi
  8049a5:	48 b8 d4 55 80 00 00 	movabs $0x8055d4,%rax
  8049ac:	00 00 00 
  8049af:	ff d0                	callq  *%rax
  8049b1:	ba 00 00 00 00       	mov    $0x0,%edx
  8049b6:	be 00 00 00 00       	mov    $0x0,%esi
  8049bb:	bf 00 00 00 00       	mov    $0x0,%edi
  8049c0:	48 b8 13 55 80 00 00 	movabs $0x805513,%rax
  8049c7:	00 00 00 
  8049ca:	ff d0                	callq  *%rax
  8049cc:	c9                   	leaveq 
  8049cd:	c3                   	retq   

00000000008049ce <nsipc_accept>:
  8049ce:	55                   	push   %rbp
  8049cf:	48 89 e5             	mov    %rsp,%rbp
  8049d2:	48 83 ec 30          	sub    $0x30,%rsp
  8049d6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8049d9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8049dd:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8049e1:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8049e8:	00 00 00 
  8049eb:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8049ee:	89 10                	mov    %edx,(%rax)
  8049f0:	bf 01 00 00 00       	mov    $0x1,%edi
  8049f5:	48 b8 4b 49 80 00 00 	movabs $0x80494b,%rax
  8049fc:	00 00 00 
  8049ff:	ff d0                	callq  *%rax
  804a01:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804a04:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804a08:	78 3e                	js     804a48 <nsipc_accept+0x7a>
  804a0a:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804a11:	00 00 00 
  804a14:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804a18:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a1c:	8b 40 10             	mov    0x10(%rax),%eax
  804a1f:	89 c2                	mov    %eax,%edx
  804a21:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  804a25:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804a29:	48 89 ce             	mov    %rcx,%rsi
  804a2c:	48 89 c7             	mov    %rax,%rdi
  804a2f:	48 b8 cd 19 80 00 00 	movabs $0x8019cd,%rax
  804a36:	00 00 00 
  804a39:	ff d0                	callq  *%rax
  804a3b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a3f:	8b 50 10             	mov    0x10(%rax),%edx
  804a42:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804a46:	89 10                	mov    %edx,(%rax)
  804a48:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a4b:	c9                   	leaveq 
  804a4c:	c3                   	retq   

0000000000804a4d <nsipc_bind>:
  804a4d:	55                   	push   %rbp
  804a4e:	48 89 e5             	mov    %rsp,%rbp
  804a51:	48 83 ec 10          	sub    $0x10,%rsp
  804a55:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804a58:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804a5c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804a5f:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804a66:	00 00 00 
  804a69:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804a6c:	89 10                	mov    %edx,(%rax)
  804a6e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804a71:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a75:	48 89 c6             	mov    %rax,%rsi
  804a78:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  804a7f:	00 00 00 
  804a82:	48 b8 cd 19 80 00 00 	movabs $0x8019cd,%rax
  804a89:	00 00 00 
  804a8c:	ff d0                	callq  *%rax
  804a8e:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804a95:	00 00 00 
  804a98:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804a9b:	89 50 14             	mov    %edx,0x14(%rax)
  804a9e:	bf 02 00 00 00       	mov    $0x2,%edi
  804aa3:	48 b8 4b 49 80 00 00 	movabs $0x80494b,%rax
  804aaa:	00 00 00 
  804aad:	ff d0                	callq  *%rax
  804aaf:	c9                   	leaveq 
  804ab0:	c3                   	retq   

0000000000804ab1 <nsipc_shutdown>:
  804ab1:	55                   	push   %rbp
  804ab2:	48 89 e5             	mov    %rsp,%rbp
  804ab5:	48 83 ec 10          	sub    $0x10,%rsp
  804ab9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804abc:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804abf:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804ac6:	00 00 00 
  804ac9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804acc:	89 10                	mov    %edx,(%rax)
  804ace:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804ad5:	00 00 00 
  804ad8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804adb:	89 50 04             	mov    %edx,0x4(%rax)
  804ade:	bf 03 00 00 00       	mov    $0x3,%edi
  804ae3:	48 b8 4b 49 80 00 00 	movabs $0x80494b,%rax
  804aea:	00 00 00 
  804aed:	ff d0                	callq  *%rax
  804aef:	c9                   	leaveq 
  804af0:	c3                   	retq   

0000000000804af1 <nsipc_close>:
  804af1:	55                   	push   %rbp
  804af2:	48 89 e5             	mov    %rsp,%rbp
  804af5:	48 83 ec 10          	sub    $0x10,%rsp
  804af9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804afc:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804b03:	00 00 00 
  804b06:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804b09:	89 10                	mov    %edx,(%rax)
  804b0b:	bf 04 00 00 00       	mov    $0x4,%edi
  804b10:	48 b8 4b 49 80 00 00 	movabs $0x80494b,%rax
  804b17:	00 00 00 
  804b1a:	ff d0                	callq  *%rax
  804b1c:	c9                   	leaveq 
  804b1d:	c3                   	retq   

0000000000804b1e <nsipc_connect>:
  804b1e:	55                   	push   %rbp
  804b1f:	48 89 e5             	mov    %rsp,%rbp
  804b22:	48 83 ec 10          	sub    $0x10,%rsp
  804b26:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804b29:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804b2d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804b30:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804b37:	00 00 00 
  804b3a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804b3d:	89 10                	mov    %edx,(%rax)
  804b3f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804b42:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804b46:	48 89 c6             	mov    %rax,%rsi
  804b49:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  804b50:	00 00 00 
  804b53:	48 b8 cd 19 80 00 00 	movabs $0x8019cd,%rax
  804b5a:	00 00 00 
  804b5d:	ff d0                	callq  *%rax
  804b5f:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804b66:	00 00 00 
  804b69:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804b6c:	89 50 14             	mov    %edx,0x14(%rax)
  804b6f:	bf 05 00 00 00       	mov    $0x5,%edi
  804b74:	48 b8 4b 49 80 00 00 	movabs $0x80494b,%rax
  804b7b:	00 00 00 
  804b7e:	ff d0                	callq  *%rax
  804b80:	c9                   	leaveq 
  804b81:	c3                   	retq   

0000000000804b82 <nsipc_listen>:
  804b82:	55                   	push   %rbp
  804b83:	48 89 e5             	mov    %rsp,%rbp
  804b86:	48 83 ec 10          	sub    $0x10,%rsp
  804b8a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804b8d:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804b90:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804b97:	00 00 00 
  804b9a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804b9d:	89 10                	mov    %edx,(%rax)
  804b9f:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804ba6:	00 00 00 
  804ba9:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804bac:	89 50 04             	mov    %edx,0x4(%rax)
  804baf:	bf 06 00 00 00       	mov    $0x6,%edi
  804bb4:	48 b8 4b 49 80 00 00 	movabs $0x80494b,%rax
  804bbb:	00 00 00 
  804bbe:	ff d0                	callq  *%rax
  804bc0:	c9                   	leaveq 
  804bc1:	c3                   	retq   

0000000000804bc2 <nsipc_recv>:
  804bc2:	55                   	push   %rbp
  804bc3:	48 89 e5             	mov    %rsp,%rbp
  804bc6:	48 83 ec 30          	sub    $0x30,%rsp
  804bca:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804bcd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804bd1:	89 55 e8             	mov    %edx,-0x18(%rbp)
  804bd4:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804bd7:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804bde:	00 00 00 
  804be1:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804be4:	89 10                	mov    %edx,(%rax)
  804be6:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804bed:	00 00 00 
  804bf0:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804bf3:	89 50 04             	mov    %edx,0x4(%rax)
  804bf6:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804bfd:	00 00 00 
  804c00:	8b 55 dc             	mov    -0x24(%rbp),%edx
  804c03:	89 50 08             	mov    %edx,0x8(%rax)
  804c06:	bf 07 00 00 00       	mov    $0x7,%edi
  804c0b:	48 b8 4b 49 80 00 00 	movabs $0x80494b,%rax
  804c12:	00 00 00 
  804c15:	ff d0                	callq  *%rax
  804c17:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804c1a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804c1e:	78 69                	js     804c89 <nsipc_recv+0xc7>
  804c20:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  804c27:	7f 08                	jg     804c31 <nsipc_recv+0x6f>
  804c29:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804c2c:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  804c2f:	7e 35                	jle    804c66 <nsipc_recv+0xa4>
  804c31:	48 b9 5c 61 80 00 00 	movabs $0x80615c,%rcx
  804c38:	00 00 00 
  804c3b:	48 ba 71 61 80 00 00 	movabs $0x806171,%rdx
  804c42:	00 00 00 
  804c45:	be 62 00 00 00       	mov    $0x62,%esi
  804c4a:	48 bf 86 61 80 00 00 	movabs $0x806186,%rdi
  804c51:	00 00 00 
  804c54:	b8 00 00 00 00       	mov    $0x0,%eax
  804c59:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  804c60:	00 00 00 
  804c63:	41 ff d0             	callq  *%r8
  804c66:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804c69:	48 63 d0             	movslq %eax,%rdx
  804c6c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804c70:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  804c77:	00 00 00 
  804c7a:	48 89 c7             	mov    %rax,%rdi
  804c7d:	48 b8 cd 19 80 00 00 	movabs $0x8019cd,%rax
  804c84:	00 00 00 
  804c87:	ff d0                	callq  *%rax
  804c89:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804c8c:	c9                   	leaveq 
  804c8d:	c3                   	retq   

0000000000804c8e <nsipc_send>:
  804c8e:	55                   	push   %rbp
  804c8f:	48 89 e5             	mov    %rsp,%rbp
  804c92:	48 83 ec 20          	sub    $0x20,%rsp
  804c96:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804c99:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804c9d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804ca0:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804ca3:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804caa:	00 00 00 
  804cad:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804cb0:	89 10                	mov    %edx,(%rax)
  804cb2:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  804cb9:	7e 35                	jle    804cf0 <nsipc_send+0x62>
  804cbb:	48 b9 95 61 80 00 00 	movabs $0x806195,%rcx
  804cc2:	00 00 00 
  804cc5:	48 ba 71 61 80 00 00 	movabs $0x806171,%rdx
  804ccc:	00 00 00 
  804ccf:	be 6d 00 00 00       	mov    $0x6d,%esi
  804cd4:	48 bf 86 61 80 00 00 	movabs $0x806186,%rdi
  804cdb:	00 00 00 
  804cde:	b8 00 00 00 00       	mov    $0x0,%eax
  804ce3:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  804cea:	00 00 00 
  804ced:	41 ff d0             	callq  *%r8
  804cf0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804cf3:	48 63 d0             	movslq %eax,%rdx
  804cf6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804cfa:	48 89 c6             	mov    %rax,%rsi
  804cfd:	48 bf 0c c0 80 00 00 	movabs $0x80c00c,%rdi
  804d04:	00 00 00 
  804d07:	48 b8 cd 19 80 00 00 	movabs $0x8019cd,%rax
  804d0e:	00 00 00 
  804d11:	ff d0                	callq  *%rax
  804d13:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804d1a:	00 00 00 
  804d1d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804d20:	89 50 04             	mov    %edx,0x4(%rax)
  804d23:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804d2a:	00 00 00 
  804d2d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804d30:	89 50 08             	mov    %edx,0x8(%rax)
  804d33:	bf 08 00 00 00       	mov    $0x8,%edi
  804d38:	48 b8 4b 49 80 00 00 	movabs $0x80494b,%rax
  804d3f:	00 00 00 
  804d42:	ff d0                	callq  *%rax
  804d44:	c9                   	leaveq 
  804d45:	c3                   	retq   

0000000000804d46 <nsipc_socket>:
  804d46:	55                   	push   %rbp
  804d47:	48 89 e5             	mov    %rsp,%rbp
  804d4a:	48 83 ec 10          	sub    $0x10,%rsp
  804d4e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804d51:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804d54:	89 55 f4             	mov    %edx,-0xc(%rbp)
  804d57:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804d5e:	00 00 00 
  804d61:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804d64:	89 10                	mov    %edx,(%rax)
  804d66:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804d6d:	00 00 00 
  804d70:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804d73:	89 50 04             	mov    %edx,0x4(%rax)
  804d76:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804d7d:	00 00 00 
  804d80:	8b 55 f4             	mov    -0xc(%rbp),%edx
  804d83:	89 50 08             	mov    %edx,0x8(%rax)
  804d86:	bf 09 00 00 00       	mov    $0x9,%edi
  804d8b:	48 b8 4b 49 80 00 00 	movabs $0x80494b,%rax
  804d92:	00 00 00 
  804d95:	ff d0                	callq  *%rax
  804d97:	c9                   	leaveq 
  804d98:	c3                   	retq   

0000000000804d99 <pipe>:
  804d99:	55                   	push   %rbp
  804d9a:	48 89 e5             	mov    %rsp,%rbp
  804d9d:	53                   	push   %rbx
  804d9e:	48 83 ec 38          	sub    $0x38,%rsp
  804da2:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  804da6:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  804daa:	48 89 c7             	mov    %rax,%rdi
  804dad:	48 b8 3a 2a 80 00 00 	movabs $0x802a3a,%rax
  804db4:	00 00 00 
  804db7:	ff d0                	callq  *%rax
  804db9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804dbc:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804dc0:	0f 88 bf 01 00 00    	js     804f85 <pipe+0x1ec>
  804dc6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804dca:	ba 07 04 00 00       	mov    $0x407,%edx
  804dcf:	48 89 c6             	mov    %rax,%rsi
  804dd2:	bf 00 00 00 00       	mov    $0x0,%edi
  804dd7:	48 b8 d8 1f 80 00 00 	movabs $0x801fd8,%rax
  804dde:	00 00 00 
  804de1:	ff d0                	callq  *%rax
  804de3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804de6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804dea:	0f 88 95 01 00 00    	js     804f85 <pipe+0x1ec>
  804df0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  804df4:	48 89 c7             	mov    %rax,%rdi
  804df7:	48 b8 3a 2a 80 00 00 	movabs $0x802a3a,%rax
  804dfe:	00 00 00 
  804e01:	ff d0                	callq  *%rax
  804e03:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804e06:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804e0a:	0f 88 5d 01 00 00    	js     804f6d <pipe+0x1d4>
  804e10:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804e14:	ba 07 04 00 00       	mov    $0x407,%edx
  804e19:	48 89 c6             	mov    %rax,%rsi
  804e1c:	bf 00 00 00 00       	mov    $0x0,%edi
  804e21:	48 b8 d8 1f 80 00 00 	movabs $0x801fd8,%rax
  804e28:	00 00 00 
  804e2b:	ff d0                	callq  *%rax
  804e2d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804e30:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804e34:	0f 88 33 01 00 00    	js     804f6d <pipe+0x1d4>
  804e3a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804e3e:	48 89 c7             	mov    %rax,%rdi
  804e41:	48 b8 0f 2a 80 00 00 	movabs $0x802a0f,%rax
  804e48:	00 00 00 
  804e4b:	ff d0                	callq  *%rax
  804e4d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804e51:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804e55:	ba 07 04 00 00       	mov    $0x407,%edx
  804e5a:	48 89 c6             	mov    %rax,%rsi
  804e5d:	bf 00 00 00 00       	mov    $0x0,%edi
  804e62:	48 b8 d8 1f 80 00 00 	movabs $0x801fd8,%rax
  804e69:	00 00 00 
  804e6c:	ff d0                	callq  *%rax
  804e6e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804e71:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804e75:	0f 88 d9 00 00 00    	js     804f54 <pipe+0x1bb>
  804e7b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804e7f:	48 89 c7             	mov    %rax,%rdi
  804e82:	48 b8 0f 2a 80 00 00 	movabs $0x802a0f,%rax
  804e89:	00 00 00 
  804e8c:	ff d0                	callq  *%rax
  804e8e:	48 89 c2             	mov    %rax,%rdx
  804e91:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804e95:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  804e9b:	48 89 d1             	mov    %rdx,%rcx
  804e9e:	ba 00 00 00 00       	mov    $0x0,%edx
  804ea3:	48 89 c6             	mov    %rax,%rsi
  804ea6:	bf 00 00 00 00       	mov    $0x0,%edi
  804eab:	48 b8 2a 20 80 00 00 	movabs $0x80202a,%rax
  804eb2:	00 00 00 
  804eb5:	ff d0                	callq  *%rax
  804eb7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804eba:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804ebe:	78 79                	js     804f39 <pipe+0x1a0>
  804ec0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804ec4:	48 ba 00 81 80 00 00 	movabs $0x808100,%rdx
  804ecb:	00 00 00 
  804ece:	8b 12                	mov    (%rdx),%edx
  804ed0:	89 10                	mov    %edx,(%rax)
  804ed2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804ed6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  804edd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804ee1:	48 ba 00 81 80 00 00 	movabs $0x808100,%rdx
  804ee8:	00 00 00 
  804eeb:	8b 12                	mov    (%rdx),%edx
  804eed:	89 10                	mov    %edx,(%rax)
  804eef:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804ef3:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  804efa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804efe:	48 89 c7             	mov    %rax,%rdi
  804f01:	48 b8 ec 29 80 00 00 	movabs $0x8029ec,%rax
  804f08:	00 00 00 
  804f0b:	ff d0                	callq  *%rax
  804f0d:	89 c2                	mov    %eax,%edx
  804f0f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804f13:	89 10                	mov    %edx,(%rax)
  804f15:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804f19:	48 8d 58 04          	lea    0x4(%rax),%rbx
  804f1d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804f21:	48 89 c7             	mov    %rax,%rdi
  804f24:	48 b8 ec 29 80 00 00 	movabs $0x8029ec,%rax
  804f2b:	00 00 00 
  804f2e:	ff d0                	callq  *%rax
  804f30:	89 03                	mov    %eax,(%rbx)
  804f32:	b8 00 00 00 00       	mov    $0x0,%eax
  804f37:	eb 4f                	jmp    804f88 <pipe+0x1ef>
  804f39:	90                   	nop
  804f3a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804f3e:	48 89 c6             	mov    %rax,%rsi
  804f41:	bf 00 00 00 00       	mov    $0x0,%edi
  804f46:	48 b8 8a 20 80 00 00 	movabs $0x80208a,%rax
  804f4d:	00 00 00 
  804f50:	ff d0                	callq  *%rax
  804f52:	eb 01                	jmp    804f55 <pipe+0x1bc>
  804f54:	90                   	nop
  804f55:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804f59:	48 89 c6             	mov    %rax,%rsi
  804f5c:	bf 00 00 00 00       	mov    $0x0,%edi
  804f61:	48 b8 8a 20 80 00 00 	movabs $0x80208a,%rax
  804f68:	00 00 00 
  804f6b:	ff d0                	callq  *%rax
  804f6d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804f71:	48 89 c6             	mov    %rax,%rsi
  804f74:	bf 00 00 00 00       	mov    $0x0,%edi
  804f79:	48 b8 8a 20 80 00 00 	movabs $0x80208a,%rax
  804f80:	00 00 00 
  804f83:	ff d0                	callq  *%rax
  804f85:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804f88:	48 83 c4 38          	add    $0x38,%rsp
  804f8c:	5b                   	pop    %rbx
  804f8d:	5d                   	pop    %rbp
  804f8e:	c3                   	retq   

0000000000804f8f <_pipeisclosed>:
  804f8f:	55                   	push   %rbp
  804f90:	48 89 e5             	mov    %rsp,%rbp
  804f93:	53                   	push   %rbx
  804f94:	48 83 ec 28          	sub    $0x28,%rsp
  804f98:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804f9c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804fa0:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804fa7:	00 00 00 
  804faa:	48 8b 00             	mov    (%rax),%rax
  804fad:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  804fb3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804fb6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804fba:	48 89 c7             	mov    %rax,%rdi
  804fbd:	48 b8 4f 57 80 00 00 	movabs $0x80574f,%rax
  804fc4:	00 00 00 
  804fc7:	ff d0                	callq  *%rax
  804fc9:	89 c3                	mov    %eax,%ebx
  804fcb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804fcf:	48 89 c7             	mov    %rax,%rdi
  804fd2:	48 b8 4f 57 80 00 00 	movabs $0x80574f,%rax
  804fd9:	00 00 00 
  804fdc:	ff d0                	callq  *%rax
  804fde:	39 c3                	cmp    %eax,%ebx
  804fe0:	0f 94 c0             	sete   %al
  804fe3:	0f b6 c0             	movzbl %al,%eax
  804fe6:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804fe9:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804ff0:	00 00 00 
  804ff3:	48 8b 00             	mov    (%rax),%rax
  804ff6:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  804ffc:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804fff:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805002:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  805005:	75 05                	jne    80500c <_pipeisclosed+0x7d>
  805007:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80500a:	eb 4a                	jmp    805056 <_pipeisclosed+0xc7>
  80500c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80500f:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  805012:	74 8c                	je     804fa0 <_pipeisclosed+0x11>
  805014:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  805018:	75 86                	jne    804fa0 <_pipeisclosed+0x11>
  80501a:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  805021:	00 00 00 
  805024:	48 8b 00             	mov    (%rax),%rax
  805027:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  80502d:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  805030:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805033:	89 c6                	mov    %eax,%esi
  805035:	48 bf a6 61 80 00 00 	movabs $0x8061a6,%rdi
  80503c:	00 00 00 
  80503f:	b8 00 00 00 00       	mov    $0x0,%eax
  805044:	49 b8 18 0b 80 00 00 	movabs $0x800b18,%r8
  80504b:	00 00 00 
  80504e:	41 ff d0             	callq  *%r8
  805051:	e9 4a ff ff ff       	jmpq   804fa0 <_pipeisclosed+0x11>
  805056:	48 83 c4 28          	add    $0x28,%rsp
  80505a:	5b                   	pop    %rbx
  80505b:	5d                   	pop    %rbp
  80505c:	c3                   	retq   

000000000080505d <pipeisclosed>:
  80505d:	55                   	push   %rbp
  80505e:	48 89 e5             	mov    %rsp,%rbp
  805061:	48 83 ec 30          	sub    $0x30,%rsp
  805065:	89 7d dc             	mov    %edi,-0x24(%rbp)
  805068:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80506c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80506f:	48 89 d6             	mov    %rdx,%rsi
  805072:	89 c7                	mov    %eax,%edi
  805074:	48 b8 d2 2a 80 00 00 	movabs $0x802ad2,%rax
  80507b:	00 00 00 
  80507e:	ff d0                	callq  *%rax
  805080:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805083:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805087:	79 05                	jns    80508e <pipeisclosed+0x31>
  805089:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80508c:	eb 31                	jmp    8050bf <pipeisclosed+0x62>
  80508e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805092:	48 89 c7             	mov    %rax,%rdi
  805095:	48 b8 0f 2a 80 00 00 	movabs $0x802a0f,%rax
  80509c:	00 00 00 
  80509f:	ff d0                	callq  *%rax
  8050a1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8050a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8050a9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8050ad:	48 89 d6             	mov    %rdx,%rsi
  8050b0:	48 89 c7             	mov    %rax,%rdi
  8050b3:	48 b8 8f 4f 80 00 00 	movabs $0x804f8f,%rax
  8050ba:	00 00 00 
  8050bd:	ff d0                	callq  *%rax
  8050bf:	c9                   	leaveq 
  8050c0:	c3                   	retq   

00000000008050c1 <devpipe_read>:
  8050c1:	55                   	push   %rbp
  8050c2:	48 89 e5             	mov    %rsp,%rbp
  8050c5:	48 83 ec 40          	sub    $0x40,%rsp
  8050c9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8050cd:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8050d1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8050d5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8050d9:	48 89 c7             	mov    %rax,%rdi
  8050dc:	48 b8 0f 2a 80 00 00 	movabs $0x802a0f,%rax
  8050e3:	00 00 00 
  8050e6:	ff d0                	callq  *%rax
  8050e8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8050ec:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8050f0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8050f4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8050fb:	00 
  8050fc:	e9 90 00 00 00       	jmpq   805191 <devpipe_read+0xd0>
  805101:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  805106:	74 09                	je     805111 <devpipe_read+0x50>
  805108:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80510c:	e9 8e 00 00 00       	jmpq   80519f <devpipe_read+0xde>
  805111:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  805115:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805119:	48 89 d6             	mov    %rdx,%rsi
  80511c:	48 89 c7             	mov    %rax,%rdi
  80511f:	48 b8 8f 4f 80 00 00 	movabs $0x804f8f,%rax
  805126:	00 00 00 
  805129:	ff d0                	callq  *%rax
  80512b:	85 c0                	test   %eax,%eax
  80512d:	74 07                	je     805136 <devpipe_read+0x75>
  80512f:	b8 00 00 00 00       	mov    $0x0,%eax
  805134:	eb 69                	jmp    80519f <devpipe_read+0xde>
  805136:	48 b8 9b 1f 80 00 00 	movabs $0x801f9b,%rax
  80513d:	00 00 00 
  805140:	ff d0                	callq  *%rax
  805142:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805146:	8b 10                	mov    (%rax),%edx
  805148:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80514c:	8b 40 04             	mov    0x4(%rax),%eax
  80514f:	39 c2                	cmp    %eax,%edx
  805151:	74 ae                	je     805101 <devpipe_read+0x40>
  805153:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  805157:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80515b:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  80515f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805163:	8b 00                	mov    (%rax),%eax
  805165:	99                   	cltd   
  805166:	c1 ea 1b             	shr    $0x1b,%edx
  805169:	01 d0                	add    %edx,%eax
  80516b:	83 e0 1f             	and    $0x1f,%eax
  80516e:	29 d0                	sub    %edx,%eax
  805170:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  805174:	48 98                	cltq   
  805176:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  80517b:	88 01                	mov    %al,(%rcx)
  80517d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805181:	8b 00                	mov    (%rax),%eax
  805183:	8d 50 01             	lea    0x1(%rax),%edx
  805186:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80518a:	89 10                	mov    %edx,(%rax)
  80518c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  805191:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805195:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  805199:	72 a7                	jb     805142 <devpipe_read+0x81>
  80519b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80519f:	c9                   	leaveq 
  8051a0:	c3                   	retq   

00000000008051a1 <devpipe_write>:
  8051a1:	55                   	push   %rbp
  8051a2:	48 89 e5             	mov    %rsp,%rbp
  8051a5:	48 83 ec 40          	sub    $0x40,%rsp
  8051a9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8051ad:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8051b1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8051b5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8051b9:	48 89 c7             	mov    %rax,%rdi
  8051bc:	48 b8 0f 2a 80 00 00 	movabs $0x802a0f,%rax
  8051c3:	00 00 00 
  8051c6:	ff d0                	callq  *%rax
  8051c8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8051cc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8051d0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8051d4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8051db:	00 
  8051dc:	e9 8f 00 00 00       	jmpq   805270 <devpipe_write+0xcf>
  8051e1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8051e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8051e9:	48 89 d6             	mov    %rdx,%rsi
  8051ec:	48 89 c7             	mov    %rax,%rdi
  8051ef:	48 b8 8f 4f 80 00 00 	movabs $0x804f8f,%rax
  8051f6:	00 00 00 
  8051f9:	ff d0                	callq  *%rax
  8051fb:	85 c0                	test   %eax,%eax
  8051fd:	74 07                	je     805206 <devpipe_write+0x65>
  8051ff:	b8 00 00 00 00       	mov    $0x0,%eax
  805204:	eb 78                	jmp    80527e <devpipe_write+0xdd>
  805206:	48 b8 9b 1f 80 00 00 	movabs $0x801f9b,%rax
  80520d:	00 00 00 
  805210:	ff d0                	callq  *%rax
  805212:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805216:	8b 40 04             	mov    0x4(%rax),%eax
  805219:	48 63 d0             	movslq %eax,%rdx
  80521c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805220:	8b 00                	mov    (%rax),%eax
  805222:	48 98                	cltq   
  805224:	48 83 c0 20          	add    $0x20,%rax
  805228:	48 39 c2             	cmp    %rax,%rdx
  80522b:	73 b4                	jae    8051e1 <devpipe_write+0x40>
  80522d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805231:	8b 40 04             	mov    0x4(%rax),%eax
  805234:	99                   	cltd   
  805235:	c1 ea 1b             	shr    $0x1b,%edx
  805238:	01 d0                	add    %edx,%eax
  80523a:	83 e0 1f             	and    $0x1f,%eax
  80523d:	29 d0                	sub    %edx,%eax
  80523f:	89 c6                	mov    %eax,%esi
  805241:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  805245:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805249:	48 01 d0             	add    %rdx,%rax
  80524c:	0f b6 08             	movzbl (%rax),%ecx
  80524f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  805253:	48 63 c6             	movslq %esi,%rax
  805256:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80525a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80525e:	8b 40 04             	mov    0x4(%rax),%eax
  805261:	8d 50 01             	lea    0x1(%rax),%edx
  805264:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805268:	89 50 04             	mov    %edx,0x4(%rax)
  80526b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  805270:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805274:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  805278:	72 98                	jb     805212 <devpipe_write+0x71>
  80527a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80527e:	c9                   	leaveq 
  80527f:	c3                   	retq   

0000000000805280 <devpipe_stat>:
  805280:	55                   	push   %rbp
  805281:	48 89 e5             	mov    %rsp,%rbp
  805284:	48 83 ec 20          	sub    $0x20,%rsp
  805288:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80528c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805290:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805294:	48 89 c7             	mov    %rax,%rdi
  805297:	48 b8 0f 2a 80 00 00 	movabs $0x802a0f,%rax
  80529e:	00 00 00 
  8052a1:	ff d0                	callq  *%rax
  8052a3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8052a7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8052ab:	48 be b9 61 80 00 00 	movabs $0x8061b9,%rsi
  8052b2:	00 00 00 
  8052b5:	48 89 c7             	mov    %rax,%rdi
  8052b8:	48 b8 a8 16 80 00 00 	movabs $0x8016a8,%rax
  8052bf:	00 00 00 
  8052c2:	ff d0                	callq  *%rax
  8052c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8052c8:	8b 50 04             	mov    0x4(%rax),%edx
  8052cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8052cf:	8b 00                	mov    (%rax),%eax
  8052d1:	29 c2                	sub    %eax,%edx
  8052d3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8052d7:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8052dd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8052e1:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8052e8:	00 00 00 
  8052eb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8052ef:	48 b9 00 81 80 00 00 	movabs $0x808100,%rcx
  8052f6:	00 00 00 
  8052f9:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  805300:	b8 00 00 00 00       	mov    $0x0,%eax
  805305:	c9                   	leaveq 
  805306:	c3                   	retq   

0000000000805307 <devpipe_close>:
  805307:	55                   	push   %rbp
  805308:	48 89 e5             	mov    %rsp,%rbp
  80530b:	48 83 ec 10          	sub    $0x10,%rsp
  80530f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805313:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805317:	48 89 c6             	mov    %rax,%rsi
  80531a:	bf 00 00 00 00       	mov    $0x0,%edi
  80531f:	48 b8 8a 20 80 00 00 	movabs $0x80208a,%rax
  805326:	00 00 00 
  805329:	ff d0                	callq  *%rax
  80532b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80532f:	48 89 c7             	mov    %rax,%rdi
  805332:	48 b8 0f 2a 80 00 00 	movabs $0x802a0f,%rax
  805339:	00 00 00 
  80533c:	ff d0                	callq  *%rax
  80533e:	48 89 c6             	mov    %rax,%rsi
  805341:	bf 00 00 00 00       	mov    $0x0,%edi
  805346:	48 b8 8a 20 80 00 00 	movabs $0x80208a,%rax
  80534d:	00 00 00 
  805350:	ff d0                	callq  *%rax
  805352:	c9                   	leaveq 
  805353:	c3                   	retq   

0000000000805354 <wait>:
  805354:	55                   	push   %rbp
  805355:	48 89 e5             	mov    %rsp,%rbp
  805358:	48 83 ec 20          	sub    $0x20,%rsp
  80535c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80535f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  805363:	75 35                	jne    80539a <wait+0x46>
  805365:	48 b9 c0 61 80 00 00 	movabs $0x8061c0,%rcx
  80536c:	00 00 00 
  80536f:	48 ba cb 61 80 00 00 	movabs $0x8061cb,%rdx
  805376:	00 00 00 
  805379:	be 0a 00 00 00       	mov    $0xa,%esi
  80537e:	48 bf e0 61 80 00 00 	movabs $0x8061e0,%rdi
  805385:	00 00 00 
  805388:	b8 00 00 00 00       	mov    $0x0,%eax
  80538d:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  805394:	00 00 00 
  805397:	41 ff d0             	callq  *%r8
  80539a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80539d:	25 ff 03 00 00       	and    $0x3ff,%eax
  8053a2:	48 98                	cltq   
  8053a4:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8053ab:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8053b2:	00 00 00 
  8053b5:	48 01 d0             	add    %rdx,%rax
  8053b8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8053bc:	eb 0c                	jmp    8053ca <wait+0x76>
  8053be:	48 b8 9b 1f 80 00 00 	movabs $0x801f9b,%rax
  8053c5:	00 00 00 
  8053c8:	ff d0                	callq  *%rax
  8053ca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8053ce:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8053d4:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8053d7:	75 0e                	jne    8053e7 <wait+0x93>
  8053d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8053dd:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  8053e3:	85 c0                	test   %eax,%eax
  8053e5:	75 d7                	jne    8053be <wait+0x6a>
  8053e7:	90                   	nop
  8053e8:	c9                   	leaveq 
  8053e9:	c3                   	retq   

00000000008053ea <set_pgfault_handler>:
  8053ea:	55                   	push   %rbp
  8053eb:	48 89 e5             	mov    %rsp,%rbp
  8053ee:	48 83 ec 20          	sub    $0x20,%rsp
  8053f2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8053f6:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8053fd:	00 00 00 
  805400:	48 8b 00             	mov    (%rax),%rax
  805403:	48 85 c0             	test   %rax,%rax
  805406:	75 6f                	jne    805477 <set_pgfault_handler+0x8d>
  805408:	ba 07 00 00 00       	mov    $0x7,%edx
  80540d:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  805412:	bf 00 00 00 00       	mov    $0x0,%edi
  805417:	48 b8 d8 1f 80 00 00 	movabs $0x801fd8,%rax
  80541e:	00 00 00 
  805421:	ff d0                	callq  *%rax
  805423:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805426:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80542a:	79 30                	jns    80545c <set_pgfault_handler+0x72>
  80542c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80542f:	89 c1                	mov    %eax,%ecx
  805431:	48 ba f0 61 80 00 00 	movabs $0x8061f0,%rdx
  805438:	00 00 00 
  80543b:	be 22 00 00 00       	mov    $0x22,%esi
  805440:	48 bf 0f 62 80 00 00 	movabs $0x80620f,%rdi
  805447:	00 00 00 
  80544a:	b8 00 00 00 00       	mov    $0x0,%eax
  80544f:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  805456:	00 00 00 
  805459:	41 ff d0             	callq  *%r8
  80545c:	48 be 8b 54 80 00 00 	movabs $0x80548b,%rsi
  805463:	00 00 00 
  805466:	bf 00 00 00 00       	mov    $0x0,%edi
  80546b:	48 b8 6f 21 80 00 00 	movabs $0x80216f,%rax
  805472:	00 00 00 
  805475:	ff d0                	callq  *%rax
  805477:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  80547e:	00 00 00 
  805481:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  805485:	48 89 10             	mov    %rdx,(%rax)
  805488:	90                   	nop
  805489:	c9                   	leaveq 
  80548a:	c3                   	retq   

000000000080548b <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  80548b:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  80548e:	48 a1 00 d0 80 00 00 	movabs 0x80d000,%rax
  805495:	00 00 00 
call *%rax
  805498:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  80549a:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  8054a1:	00 08 
    movq 152(%rsp), %rax
  8054a3:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  8054aa:	00 
    movq 136(%rsp), %rbx
  8054ab:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  8054b2:	00 
movq %rbx, (%rax)
  8054b3:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  8054b6:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  8054ba:	4c 8b 3c 24          	mov    (%rsp),%r15
  8054be:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  8054c3:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  8054c8:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  8054cd:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  8054d2:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  8054d7:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  8054dc:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  8054e1:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  8054e6:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  8054eb:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  8054f0:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  8054f5:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  8054fa:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  8054ff:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  805504:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  805508:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  80550c:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  80550d:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  805512:	c3                   	retq   

0000000000805513 <ipc_recv>:
  805513:	55                   	push   %rbp
  805514:	48 89 e5             	mov    %rsp,%rbp
  805517:	48 83 ec 30          	sub    $0x30,%rsp
  80551b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80551f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805523:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  805527:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80552c:	75 0e                	jne    80553c <ipc_recv+0x29>
  80552e:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  805535:	00 00 00 
  805538:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80553c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805540:	48 89 c7             	mov    %rax,%rdi
  805543:	48 b8 12 22 80 00 00 	movabs $0x802212,%rax
  80554a:	00 00 00 
  80554d:	ff d0                	callq  *%rax
  80554f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805552:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805556:	79 27                	jns    80557f <ipc_recv+0x6c>
  805558:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80555d:	74 0a                	je     805569 <ipc_recv+0x56>
  80555f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805563:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  805569:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80556e:	74 0a                	je     80557a <ipc_recv+0x67>
  805570:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805574:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80557a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80557d:	eb 53                	jmp    8055d2 <ipc_recv+0xbf>
  80557f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  805584:	74 19                	je     80559f <ipc_recv+0x8c>
  805586:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  80558d:	00 00 00 
  805590:	48 8b 00             	mov    (%rax),%rax
  805593:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  805599:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80559d:	89 10                	mov    %edx,(%rax)
  80559f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8055a4:	74 19                	je     8055bf <ipc_recv+0xac>
  8055a6:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8055ad:	00 00 00 
  8055b0:	48 8b 00             	mov    (%rax),%rax
  8055b3:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8055b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8055bd:	89 10                	mov    %edx,(%rax)
  8055bf:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8055c6:	00 00 00 
  8055c9:	48 8b 00             	mov    (%rax),%rax
  8055cc:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8055d2:	c9                   	leaveq 
  8055d3:	c3                   	retq   

00000000008055d4 <ipc_send>:
  8055d4:	55                   	push   %rbp
  8055d5:	48 89 e5             	mov    %rsp,%rbp
  8055d8:	48 83 ec 30          	sub    $0x30,%rsp
  8055dc:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8055df:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8055e2:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  8055e6:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8055e9:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8055ee:	75 1c                	jne    80560c <ipc_send+0x38>
  8055f0:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8055f7:	00 00 00 
  8055fa:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8055fe:	eb 0c                	jmp    80560c <ipc_send+0x38>
  805600:	48 b8 9b 1f 80 00 00 	movabs $0x801f9b,%rax
  805607:	00 00 00 
  80560a:	ff d0                	callq  *%rax
  80560c:	8b 75 e8             	mov    -0x18(%rbp),%esi
  80560f:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  805612:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  805616:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805619:	89 c7                	mov    %eax,%edi
  80561b:	48 b8 bb 21 80 00 00 	movabs $0x8021bb,%rax
  805622:	00 00 00 
  805625:	ff d0                	callq  *%rax
  805627:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80562a:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  80562e:	74 d0                	je     805600 <ipc_send+0x2c>
  805630:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805634:	79 30                	jns    805666 <ipc_send+0x92>
  805636:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805639:	89 c1                	mov    %eax,%ecx
  80563b:	48 ba 20 62 80 00 00 	movabs $0x806220,%rdx
  805642:	00 00 00 
  805645:	be 44 00 00 00       	mov    $0x44,%esi
  80564a:	48 bf 36 62 80 00 00 	movabs $0x806236,%rdi
  805651:	00 00 00 
  805654:	b8 00 00 00 00       	mov    $0x0,%eax
  805659:	49 b8 de 08 80 00 00 	movabs $0x8008de,%r8
  805660:	00 00 00 
  805663:	41 ff d0             	callq  *%r8
  805666:	90                   	nop
  805667:	c9                   	leaveq 
  805668:	c3                   	retq   

0000000000805669 <ipc_host_recv>:
  805669:	55                   	push   %rbp
  80566a:	48 89 e5             	mov    %rsp,%rbp
  80566d:	48 83 ec 10          	sub    $0x10,%rsp
  805671:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805675:	48 ba 48 62 80 00 00 	movabs $0x806248,%rdx
  80567c:	00 00 00 
  80567f:	be 4e 00 00 00       	mov    $0x4e,%esi
  805684:	48 bf 36 62 80 00 00 	movabs $0x806236,%rdi
  80568b:	00 00 00 
  80568e:	b8 00 00 00 00       	mov    $0x0,%eax
  805693:	48 b9 de 08 80 00 00 	movabs $0x8008de,%rcx
  80569a:	00 00 00 
  80569d:	ff d1                	callq  *%rcx

000000000080569f <ipc_host_send>:
  80569f:	55                   	push   %rbp
  8056a0:	48 89 e5             	mov    %rsp,%rbp
  8056a3:	48 83 ec 20          	sub    $0x20,%rsp
  8056a7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8056aa:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8056ad:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  8056b1:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8056b4:	48 ba 68 62 80 00 00 	movabs $0x806268,%rdx
  8056bb:	00 00 00 
  8056be:	be 58 00 00 00       	mov    $0x58,%esi
  8056c3:	48 bf 36 62 80 00 00 	movabs $0x806236,%rdi
  8056ca:	00 00 00 
  8056cd:	b8 00 00 00 00       	mov    $0x0,%eax
  8056d2:	48 b9 de 08 80 00 00 	movabs $0x8008de,%rcx
  8056d9:	00 00 00 
  8056dc:	ff d1                	callq  *%rcx

00000000008056de <ipc_find_env>:
  8056de:	55                   	push   %rbp
  8056df:	48 89 e5             	mov    %rsp,%rbp
  8056e2:	48 83 ec 18          	sub    $0x18,%rsp
  8056e6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8056e9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8056f0:	eb 4d                	jmp    80573f <ipc_find_env+0x61>
  8056f2:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8056f9:	00 00 00 
  8056fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8056ff:	48 98                	cltq   
  805701:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  805708:	48 01 d0             	add    %rdx,%rax
  80570b:	48 05 d0 00 00 00    	add    $0xd0,%rax
  805711:	8b 00                	mov    (%rax),%eax
  805713:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  805716:	75 23                	jne    80573b <ipc_find_env+0x5d>
  805718:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80571f:	00 00 00 
  805722:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805725:	48 98                	cltq   
  805727:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80572e:	48 01 d0             	add    %rdx,%rax
  805731:	48 05 c8 00 00 00    	add    $0xc8,%rax
  805737:	8b 00                	mov    (%rax),%eax
  805739:	eb 12                	jmp    80574d <ipc_find_env+0x6f>
  80573b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80573f:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  805746:	7e aa                	jle    8056f2 <ipc_find_env+0x14>
  805748:	b8 00 00 00 00       	mov    $0x0,%eax
  80574d:	c9                   	leaveq 
  80574e:	c3                   	retq   

000000000080574f <pageref>:
  80574f:	55                   	push   %rbp
  805750:	48 89 e5             	mov    %rsp,%rbp
  805753:	48 83 ec 18          	sub    $0x18,%rsp
  805757:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80575b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80575f:	48 c1 e8 15          	shr    $0x15,%rax
  805763:	48 89 c2             	mov    %rax,%rdx
  805766:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80576d:	01 00 00 
  805770:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805774:	83 e0 01             	and    $0x1,%eax
  805777:	48 85 c0             	test   %rax,%rax
  80577a:	75 07                	jne    805783 <pageref+0x34>
  80577c:	b8 00 00 00 00       	mov    $0x0,%eax
  805781:	eb 56                	jmp    8057d9 <pageref+0x8a>
  805783:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805787:	48 c1 e8 0c          	shr    $0xc,%rax
  80578b:	48 89 c2             	mov    %rax,%rdx
  80578e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  805795:	01 00 00 
  805798:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80579c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8057a0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8057a4:	83 e0 01             	and    $0x1,%eax
  8057a7:	48 85 c0             	test   %rax,%rax
  8057aa:	75 07                	jne    8057b3 <pageref+0x64>
  8057ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8057b1:	eb 26                	jmp    8057d9 <pageref+0x8a>
  8057b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8057b7:	48 c1 e8 0c          	shr    $0xc,%rax
  8057bb:	48 89 c2             	mov    %rax,%rdx
  8057be:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8057c5:	00 00 00 
  8057c8:	48 c1 e2 04          	shl    $0x4,%rdx
  8057cc:	48 01 d0             	add    %rdx,%rax
  8057cf:	48 83 c0 08          	add    $0x8,%rax
  8057d3:	0f b7 00             	movzwl (%rax),%eax
  8057d6:	0f b7 c0             	movzwl %ax,%eax
  8057d9:	c9                   	leaveq 
  8057da:	c3                   	retq   
