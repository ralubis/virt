
vmm/guest/obj/user/testtime:     file format elf64-x86-64


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
  80003c:	e8 6c 01 00 00       	callq  8001ad <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <sleep>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 b8 cf 1b 80 00 00 	movabs $0x801bcf,%rax
  800055:	00 00 00 
  800058:	ff d0                	callq  *%rax
  80005a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80005d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800060:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
  800066:	89 c2                	mov    %eax,%edx
  800068:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80006b:	01 d0                	add    %edx,%eax
  80006d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800070:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800073:	85 c0                	test   %eax,%eax
  800075:	79 38                	jns    8000af <sleep+0x6c>
  800077:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80007a:	83 f8 eb             	cmp    $0xffffffeb,%eax
  80007d:	7c 30                	jl     8000af <sleep+0x6c>
  80007f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800082:	89 c1                	mov    %eax,%ecx
  800084:	48 ba e0 40 80 00 00 	movabs $0x8040e0,%rdx
  80008b:	00 00 00 
  80008e:	be 0c 00 00 00       	mov    $0xc,%esi
  800093:	48 bf f2 40 80 00 00 	movabs $0x8040f2,%rdi
  80009a:	00 00 00 
  80009d:	b8 00 00 00 00       	mov    $0x0,%eax
  8000a2:	49 b8 55 02 80 00 00 	movabs $0x800255,%r8
  8000a9:	00 00 00 
  8000ac:	41 ff d0             	callq  *%r8
  8000af:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000b2:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  8000b5:	73 36                	jae    8000ed <sleep+0xaa>
  8000b7:	48 ba 05 41 80 00 00 	movabs $0x804105,%rdx
  8000be:	00 00 00 
  8000c1:	be 0e 00 00 00       	mov    $0xe,%esi
  8000c6:	48 bf f2 40 80 00 00 	movabs $0x8040f2,%rdi
  8000cd:	00 00 00 
  8000d0:	b8 00 00 00 00       	mov    $0x0,%eax
  8000d5:	48 b9 55 02 80 00 00 	movabs $0x800255,%rcx
  8000dc:	00 00 00 
  8000df:	ff d1                	callq  *%rcx
  8000e1:	48 b8 12 19 80 00 00 	movabs $0x801912,%rax
  8000e8:	00 00 00 
  8000eb:	ff d0                	callq  *%rax
  8000ed:	48 b8 cf 1b 80 00 00 	movabs $0x801bcf,%rax
  8000f4:	00 00 00 
  8000f7:	ff d0                	callq  *%rax
  8000f9:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  8000fc:	72 e3                	jb     8000e1 <sleep+0x9e>
  8000fe:	90                   	nop
  8000ff:	c9                   	leaveq 
  800100:	c3                   	retq   

0000000000800101 <umain>:
  800101:	55                   	push   %rbp
  800102:	48 89 e5             	mov    %rsp,%rbp
  800105:	48 83 ec 20          	sub    $0x20,%rsp
  800109:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80010c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800110:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800117:	eb 10                	jmp    800129 <umain+0x28>
  800119:	48 b8 12 19 80 00 00 	movabs $0x801912,%rax
  800120:	00 00 00 
  800123:	ff d0                	callq  *%rax
  800125:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800129:	83 7d fc 31          	cmpl   $0x31,-0x4(%rbp)
  80012d:	7e ea                	jle    800119 <umain+0x18>
  80012f:	48 bf 11 41 80 00 00 	movabs $0x804111,%rdi
  800136:	00 00 00 
  800139:	b8 00 00 00 00       	mov    $0x0,%eax
  80013e:	48 ba 8f 04 80 00 00 	movabs $0x80048f,%rdx
  800145:	00 00 00 
  800148:	ff d2                	callq  *%rdx
  80014a:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%rbp)
  800151:	eb 35                	jmp    800188 <umain+0x87>
  800153:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800156:	89 c6                	mov    %eax,%esi
  800158:	48 bf 27 41 80 00 00 	movabs $0x804127,%rdi
  80015f:	00 00 00 
  800162:	b8 00 00 00 00       	mov    $0x0,%eax
  800167:	48 ba 8f 04 80 00 00 	movabs $0x80048f,%rdx
  80016e:	00 00 00 
  800171:	ff d2                	callq  *%rdx
  800173:	bf 01 00 00 00       	mov    $0x1,%edi
  800178:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80017f:	00 00 00 
  800182:	ff d0                	callq  *%rax
  800184:	83 6d fc 01          	subl   $0x1,-0x4(%rbp)
  800188:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80018c:	79 c5                	jns    800153 <umain+0x52>
  80018e:	48 bf 2b 41 80 00 00 	movabs $0x80412b,%rdi
  800195:	00 00 00 
  800198:	b8 00 00 00 00       	mov    $0x0,%eax
  80019d:	48 ba 8f 04 80 00 00 	movabs $0x80048f,%rdx
  8001a4:	00 00 00 
  8001a7:	ff d2                	callq  *%rdx
static __inline void read_gdtr (uint64_t *gdtbase, uint16_t *gdtlimit) __attribute__((always_inline));

static __inline void
breakpoint(void)
{
	__asm __volatile("int3");
  8001a9:	cc                   	int3   
  8001aa:	90                   	nop
  8001ab:	c9                   	leaveq 
  8001ac:	c3                   	retq   

00000000008001ad <libmain>:
  8001ad:	55                   	push   %rbp
  8001ae:	48 89 e5             	mov    %rsp,%rbp
  8001b1:	48 83 ec 10          	sub    $0x10,%rsp
  8001b5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8001b8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8001bc:	48 b8 d6 18 80 00 00 	movabs $0x8018d6,%rax
  8001c3:	00 00 00 
  8001c6:	ff d0                	callq  *%rax
  8001c8:	25 ff 03 00 00       	and    $0x3ff,%eax
  8001cd:	48 98                	cltq   
  8001cf:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8001d6:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8001dd:	00 00 00 
  8001e0:	48 01 c2             	add    %rax,%rdx
  8001e3:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8001ea:	00 00 00 
  8001ed:	48 89 10             	mov    %rdx,(%rax)
  8001f0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8001f4:	7e 14                	jle    80020a <libmain+0x5d>
  8001f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001fa:	48 8b 10             	mov    (%rax),%rdx
  8001fd:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  800204:	00 00 00 
  800207:	48 89 10             	mov    %rdx,(%rax)
  80020a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80020e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800211:	48 89 d6             	mov    %rdx,%rsi
  800214:	89 c7                	mov    %eax,%edi
  800216:	48 b8 01 01 80 00 00 	movabs $0x800101,%rax
  80021d:	00 00 00 
  800220:	ff d0                	callq  *%rax
  800222:	48 b8 31 02 80 00 00 	movabs $0x800231,%rax
  800229:	00 00 00 
  80022c:	ff d0                	callq  *%rax
  80022e:	90                   	nop
  80022f:	c9                   	leaveq 
  800230:	c3                   	retq   

0000000000800231 <exit>:
  800231:	55                   	push   %rbp
  800232:	48 89 e5             	mov    %rsp,%rbp
  800235:	48 b8 8e 20 80 00 00 	movabs $0x80208e,%rax
  80023c:	00 00 00 
  80023f:	ff d0                	callq  *%rax
  800241:	bf 00 00 00 00       	mov    $0x0,%edi
  800246:	48 b8 90 18 80 00 00 	movabs $0x801890,%rax
  80024d:	00 00 00 
  800250:	ff d0                	callq  *%rax
  800252:	90                   	nop
  800253:	5d                   	pop    %rbp
  800254:	c3                   	retq   

0000000000800255 <_panic>:
  800255:	55                   	push   %rbp
  800256:	48 89 e5             	mov    %rsp,%rbp
  800259:	53                   	push   %rbx
  80025a:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800261:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800268:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  80026e:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800275:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  80027c:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800283:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  80028a:	84 c0                	test   %al,%al
  80028c:	74 23                	je     8002b1 <_panic+0x5c>
  80028e:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800295:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800299:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  80029d:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  8002a1:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  8002a5:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  8002a9:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  8002ad:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  8002b1:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8002b8:	00 00 00 
  8002bb:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8002c2:	00 00 00 
  8002c5:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8002c9:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8002d0:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8002d7:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8002de:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8002e5:	00 00 00 
  8002e8:	48 8b 18             	mov    (%rax),%rbx
  8002eb:	48 b8 d6 18 80 00 00 	movabs $0x8018d6,%rax
  8002f2:	00 00 00 
  8002f5:	ff d0                	callq  *%rax
  8002f7:	89 c6                	mov    %eax,%esi
  8002f9:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  8002ff:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  800306:	41 89 d0             	mov    %edx,%r8d
  800309:	48 89 c1             	mov    %rax,%rcx
  80030c:	48 89 da             	mov    %rbx,%rdx
  80030f:	48 bf 38 41 80 00 00 	movabs $0x804138,%rdi
  800316:	00 00 00 
  800319:	b8 00 00 00 00       	mov    $0x0,%eax
  80031e:	49 b9 8f 04 80 00 00 	movabs $0x80048f,%r9
  800325:	00 00 00 
  800328:	41 ff d1             	callq  *%r9
  80032b:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800332:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800339:	48 89 d6             	mov    %rdx,%rsi
  80033c:	48 89 c7             	mov    %rax,%rdi
  80033f:	48 b8 e3 03 80 00 00 	movabs $0x8003e3,%rax
  800346:	00 00 00 
  800349:	ff d0                	callq  *%rax
  80034b:	48 bf 5b 41 80 00 00 	movabs $0x80415b,%rdi
  800352:	00 00 00 
  800355:	b8 00 00 00 00       	mov    $0x0,%eax
  80035a:	48 ba 8f 04 80 00 00 	movabs $0x80048f,%rdx
  800361:	00 00 00 
  800364:	ff d2                	callq  *%rdx
  800366:	cc                   	int3   
  800367:	eb fd                	jmp    800366 <_panic+0x111>

0000000000800369 <putch>:
  800369:	55                   	push   %rbp
  80036a:	48 89 e5             	mov    %rsp,%rbp
  80036d:	48 83 ec 10          	sub    $0x10,%rsp
  800371:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800374:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800378:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80037c:	8b 00                	mov    (%rax),%eax
  80037e:	8d 48 01             	lea    0x1(%rax),%ecx
  800381:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800385:	89 0a                	mov    %ecx,(%rdx)
  800387:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80038a:	89 d1                	mov    %edx,%ecx
  80038c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800390:	48 98                	cltq   
  800392:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800396:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80039a:	8b 00                	mov    (%rax),%eax
  80039c:	3d ff 00 00 00       	cmp    $0xff,%eax
  8003a1:	75 2c                	jne    8003cf <putch+0x66>
  8003a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003a7:	8b 00                	mov    (%rax),%eax
  8003a9:	48 98                	cltq   
  8003ab:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003af:	48 83 c2 08          	add    $0x8,%rdx
  8003b3:	48 89 c6             	mov    %rax,%rsi
  8003b6:	48 89 d7             	mov    %rdx,%rdi
  8003b9:	48 b8 07 18 80 00 00 	movabs $0x801807,%rax
  8003c0:	00 00 00 
  8003c3:	ff d0                	callq  *%rax
  8003c5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003c9:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8003cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003d3:	8b 40 04             	mov    0x4(%rax),%eax
  8003d6:	8d 50 01             	lea    0x1(%rax),%edx
  8003d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003dd:	89 50 04             	mov    %edx,0x4(%rax)
  8003e0:	90                   	nop
  8003e1:	c9                   	leaveq 
  8003e2:	c3                   	retq   

00000000008003e3 <vcprintf>:
  8003e3:	55                   	push   %rbp
  8003e4:	48 89 e5             	mov    %rsp,%rbp
  8003e7:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8003ee:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8003f5:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8003fc:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800403:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  80040a:	48 8b 0a             	mov    (%rdx),%rcx
  80040d:	48 89 08             	mov    %rcx,(%rax)
  800410:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800414:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800418:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80041c:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800420:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800427:	00 00 00 
  80042a:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800431:	00 00 00 
  800434:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  80043b:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800442:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800449:	48 89 c6             	mov    %rax,%rsi
  80044c:	48 bf 69 03 80 00 00 	movabs $0x800369,%rdi
  800453:	00 00 00 
  800456:	48 b8 2d 08 80 00 00 	movabs $0x80082d,%rax
  80045d:	00 00 00 
  800460:	ff d0                	callq  *%rax
  800462:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800468:	48 98                	cltq   
  80046a:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800471:	48 83 c2 08          	add    $0x8,%rdx
  800475:	48 89 c6             	mov    %rax,%rsi
  800478:	48 89 d7             	mov    %rdx,%rdi
  80047b:	48 b8 07 18 80 00 00 	movabs $0x801807,%rax
  800482:	00 00 00 
  800485:	ff d0                	callq  *%rax
  800487:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  80048d:	c9                   	leaveq 
  80048e:	c3                   	retq   

000000000080048f <cprintf>:
  80048f:	55                   	push   %rbp
  800490:	48 89 e5             	mov    %rsp,%rbp
  800493:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  80049a:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8004a1:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8004a8:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8004af:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8004b6:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8004bd:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8004c4:	84 c0                	test   %al,%al
  8004c6:	74 20                	je     8004e8 <cprintf+0x59>
  8004c8:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8004cc:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8004d0:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8004d4:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8004d8:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8004dc:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8004e0:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8004e4:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8004e8:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8004ef:	00 00 00 
  8004f2:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8004f9:	00 00 00 
  8004fc:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800500:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800507:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80050e:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800515:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80051c:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800523:	48 8b 0a             	mov    (%rdx),%rcx
  800526:	48 89 08             	mov    %rcx,(%rax)
  800529:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80052d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800531:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800535:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800539:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800540:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800547:	48 89 d6             	mov    %rdx,%rsi
  80054a:	48 89 c7             	mov    %rax,%rdi
  80054d:	48 b8 e3 03 80 00 00 	movabs $0x8003e3,%rax
  800554:	00 00 00 
  800557:	ff d0                	callq  *%rax
  800559:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80055f:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800565:	c9                   	leaveq 
  800566:	c3                   	retq   

0000000000800567 <printnum>:
  800567:	55                   	push   %rbp
  800568:	48 89 e5             	mov    %rsp,%rbp
  80056b:	48 83 ec 30          	sub    $0x30,%rsp
  80056f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800573:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800577:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80057b:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  80057e:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  800582:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  800586:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800589:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  80058d:	77 54                	ja     8005e3 <printnum+0x7c>
  80058f:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800592:	8d 78 ff             	lea    -0x1(%rax),%edi
  800595:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800598:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80059c:	ba 00 00 00 00       	mov    $0x0,%edx
  8005a1:	48 f7 f6             	div    %rsi
  8005a4:	49 89 c2             	mov    %rax,%r10
  8005a7:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8005aa:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8005ad:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8005b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005b5:	41 89 c9             	mov    %ecx,%r9d
  8005b8:	41 89 f8             	mov    %edi,%r8d
  8005bb:	89 d1                	mov    %edx,%ecx
  8005bd:	4c 89 d2             	mov    %r10,%rdx
  8005c0:	48 89 c7             	mov    %rax,%rdi
  8005c3:	48 b8 67 05 80 00 00 	movabs $0x800567,%rax
  8005ca:	00 00 00 
  8005cd:	ff d0                	callq  *%rax
  8005cf:	eb 1c                	jmp    8005ed <printnum+0x86>
  8005d1:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8005d5:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8005d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005dc:	48 89 ce             	mov    %rcx,%rsi
  8005df:	89 d7                	mov    %edx,%edi
  8005e1:	ff d0                	callq  *%rax
  8005e3:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  8005e7:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  8005eb:	7f e4                	jg     8005d1 <printnum+0x6a>
  8005ed:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8005f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005f4:	ba 00 00 00 00       	mov    $0x0,%edx
  8005f9:	48 f7 f1             	div    %rcx
  8005fc:	48 b8 50 43 80 00 00 	movabs $0x804350,%rax
  800603:	00 00 00 
  800606:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  80060a:	0f be d0             	movsbl %al,%edx
  80060d:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800611:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800615:	48 89 ce             	mov    %rcx,%rsi
  800618:	89 d7                	mov    %edx,%edi
  80061a:	ff d0                	callq  *%rax
  80061c:	90                   	nop
  80061d:	c9                   	leaveq 
  80061e:	c3                   	retq   

000000000080061f <getuint>:
  80061f:	55                   	push   %rbp
  800620:	48 89 e5             	mov    %rsp,%rbp
  800623:	48 83 ec 20          	sub    $0x20,%rsp
  800627:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80062b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80062e:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800632:	7e 4f                	jle    800683 <getuint+0x64>
  800634:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800638:	8b 00                	mov    (%rax),%eax
  80063a:	83 f8 30             	cmp    $0x30,%eax
  80063d:	73 24                	jae    800663 <getuint+0x44>
  80063f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800643:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800647:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80064b:	8b 00                	mov    (%rax),%eax
  80064d:	89 c0                	mov    %eax,%eax
  80064f:	48 01 d0             	add    %rdx,%rax
  800652:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800656:	8b 12                	mov    (%rdx),%edx
  800658:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80065b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80065f:	89 0a                	mov    %ecx,(%rdx)
  800661:	eb 14                	jmp    800677 <getuint+0x58>
  800663:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800667:	48 8b 40 08          	mov    0x8(%rax),%rax
  80066b:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80066f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800673:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800677:	48 8b 00             	mov    (%rax),%rax
  80067a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80067e:	e9 9d 00 00 00       	jmpq   800720 <getuint+0x101>
  800683:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800687:	74 4c                	je     8006d5 <getuint+0xb6>
  800689:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80068d:	8b 00                	mov    (%rax),%eax
  80068f:	83 f8 30             	cmp    $0x30,%eax
  800692:	73 24                	jae    8006b8 <getuint+0x99>
  800694:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800698:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80069c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006a0:	8b 00                	mov    (%rax),%eax
  8006a2:	89 c0                	mov    %eax,%eax
  8006a4:	48 01 d0             	add    %rdx,%rax
  8006a7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006ab:	8b 12                	mov    (%rdx),%edx
  8006ad:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006b0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006b4:	89 0a                	mov    %ecx,(%rdx)
  8006b6:	eb 14                	jmp    8006cc <getuint+0xad>
  8006b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006bc:	48 8b 40 08          	mov    0x8(%rax),%rax
  8006c0:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8006c4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006c8:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006cc:	48 8b 00             	mov    (%rax),%rax
  8006cf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006d3:	eb 4b                	jmp    800720 <getuint+0x101>
  8006d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006d9:	8b 00                	mov    (%rax),%eax
  8006db:	83 f8 30             	cmp    $0x30,%eax
  8006de:	73 24                	jae    800704 <getuint+0xe5>
  8006e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006e4:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006ec:	8b 00                	mov    (%rax),%eax
  8006ee:	89 c0                	mov    %eax,%eax
  8006f0:	48 01 d0             	add    %rdx,%rax
  8006f3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006f7:	8b 12                	mov    (%rdx),%edx
  8006f9:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006fc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800700:	89 0a                	mov    %ecx,(%rdx)
  800702:	eb 14                	jmp    800718 <getuint+0xf9>
  800704:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800708:	48 8b 40 08          	mov    0x8(%rax),%rax
  80070c:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800710:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800714:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800718:	8b 00                	mov    (%rax),%eax
  80071a:	89 c0                	mov    %eax,%eax
  80071c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800720:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800724:	c9                   	leaveq 
  800725:	c3                   	retq   

0000000000800726 <getint>:
  800726:	55                   	push   %rbp
  800727:	48 89 e5             	mov    %rsp,%rbp
  80072a:	48 83 ec 20          	sub    $0x20,%rsp
  80072e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800732:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800735:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800739:	7e 4f                	jle    80078a <getint+0x64>
  80073b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80073f:	8b 00                	mov    (%rax),%eax
  800741:	83 f8 30             	cmp    $0x30,%eax
  800744:	73 24                	jae    80076a <getint+0x44>
  800746:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80074a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80074e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800752:	8b 00                	mov    (%rax),%eax
  800754:	89 c0                	mov    %eax,%eax
  800756:	48 01 d0             	add    %rdx,%rax
  800759:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80075d:	8b 12                	mov    (%rdx),%edx
  80075f:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800762:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800766:	89 0a                	mov    %ecx,(%rdx)
  800768:	eb 14                	jmp    80077e <getint+0x58>
  80076a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80076e:	48 8b 40 08          	mov    0x8(%rax),%rax
  800772:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800776:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80077a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80077e:	48 8b 00             	mov    (%rax),%rax
  800781:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800785:	e9 9d 00 00 00       	jmpq   800827 <getint+0x101>
  80078a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80078e:	74 4c                	je     8007dc <getint+0xb6>
  800790:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800794:	8b 00                	mov    (%rax),%eax
  800796:	83 f8 30             	cmp    $0x30,%eax
  800799:	73 24                	jae    8007bf <getint+0x99>
  80079b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80079f:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007a7:	8b 00                	mov    (%rax),%eax
  8007a9:	89 c0                	mov    %eax,%eax
  8007ab:	48 01 d0             	add    %rdx,%rax
  8007ae:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007b2:	8b 12                	mov    (%rdx),%edx
  8007b4:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007b7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007bb:	89 0a                	mov    %ecx,(%rdx)
  8007bd:	eb 14                	jmp    8007d3 <getint+0xad>
  8007bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007c3:	48 8b 40 08          	mov    0x8(%rax),%rax
  8007c7:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8007cb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007cf:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007d3:	48 8b 00             	mov    (%rax),%rax
  8007d6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007da:	eb 4b                	jmp    800827 <getint+0x101>
  8007dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007e0:	8b 00                	mov    (%rax),%eax
  8007e2:	83 f8 30             	cmp    $0x30,%eax
  8007e5:	73 24                	jae    80080b <getint+0xe5>
  8007e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007eb:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007f3:	8b 00                	mov    (%rax),%eax
  8007f5:	89 c0                	mov    %eax,%eax
  8007f7:	48 01 d0             	add    %rdx,%rax
  8007fa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007fe:	8b 12                	mov    (%rdx),%edx
  800800:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800803:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800807:	89 0a                	mov    %ecx,(%rdx)
  800809:	eb 14                	jmp    80081f <getint+0xf9>
  80080b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80080f:	48 8b 40 08          	mov    0x8(%rax),%rax
  800813:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800817:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80081b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80081f:	8b 00                	mov    (%rax),%eax
  800821:	48 98                	cltq   
  800823:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800827:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80082b:	c9                   	leaveq 
  80082c:	c3                   	retq   

000000000080082d <vprintfmt>:
  80082d:	55                   	push   %rbp
  80082e:	48 89 e5             	mov    %rsp,%rbp
  800831:	41 54                	push   %r12
  800833:	53                   	push   %rbx
  800834:	48 83 ec 60          	sub    $0x60,%rsp
  800838:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  80083c:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800840:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800844:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800848:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80084c:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800850:	48 8b 0a             	mov    (%rdx),%rcx
  800853:	48 89 08             	mov    %rcx,(%rax)
  800856:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80085a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80085e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800862:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800866:	eb 17                	jmp    80087f <vprintfmt+0x52>
  800868:	85 db                	test   %ebx,%ebx
  80086a:	0f 84 b9 04 00 00    	je     800d29 <vprintfmt+0x4fc>
  800870:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800874:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800878:	48 89 d6             	mov    %rdx,%rsi
  80087b:	89 df                	mov    %ebx,%edi
  80087d:	ff d0                	callq  *%rax
  80087f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800883:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800887:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80088b:	0f b6 00             	movzbl (%rax),%eax
  80088e:	0f b6 d8             	movzbl %al,%ebx
  800891:	83 fb 25             	cmp    $0x25,%ebx
  800894:	75 d2                	jne    800868 <vprintfmt+0x3b>
  800896:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  80089a:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  8008a1:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8008a8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8008af:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  8008b6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8008ba:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8008be:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008c2:	0f b6 00             	movzbl (%rax),%eax
  8008c5:	0f b6 d8             	movzbl %al,%ebx
  8008c8:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8008cb:	83 f8 55             	cmp    $0x55,%eax
  8008ce:	0f 87 22 04 00 00    	ja     800cf6 <vprintfmt+0x4c9>
  8008d4:	89 c0                	mov    %eax,%eax
  8008d6:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8008dd:	00 
  8008de:	48 b8 78 43 80 00 00 	movabs $0x804378,%rax
  8008e5:	00 00 00 
  8008e8:	48 01 d0             	add    %rdx,%rax
  8008eb:	48 8b 00             	mov    (%rax),%rax
  8008ee:	ff e0                	jmpq   *%rax
  8008f0:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8008f4:	eb c0                	jmp    8008b6 <vprintfmt+0x89>
  8008f6:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8008fa:	eb ba                	jmp    8008b6 <vprintfmt+0x89>
  8008fc:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800903:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800906:	89 d0                	mov    %edx,%eax
  800908:	c1 e0 02             	shl    $0x2,%eax
  80090b:	01 d0                	add    %edx,%eax
  80090d:	01 c0                	add    %eax,%eax
  80090f:	01 d8                	add    %ebx,%eax
  800911:	83 e8 30             	sub    $0x30,%eax
  800914:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800917:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80091b:	0f b6 00             	movzbl (%rax),%eax
  80091e:	0f be d8             	movsbl %al,%ebx
  800921:	83 fb 2f             	cmp    $0x2f,%ebx
  800924:	7e 60                	jle    800986 <vprintfmt+0x159>
  800926:	83 fb 39             	cmp    $0x39,%ebx
  800929:	7f 5b                	jg     800986 <vprintfmt+0x159>
  80092b:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800930:	eb d1                	jmp    800903 <vprintfmt+0xd6>
  800932:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800935:	83 f8 30             	cmp    $0x30,%eax
  800938:	73 17                	jae    800951 <vprintfmt+0x124>
  80093a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80093e:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800941:	89 d2                	mov    %edx,%edx
  800943:	48 01 d0             	add    %rdx,%rax
  800946:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800949:	83 c2 08             	add    $0x8,%edx
  80094c:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80094f:	eb 0c                	jmp    80095d <vprintfmt+0x130>
  800951:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800955:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800959:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80095d:	8b 00                	mov    (%rax),%eax
  80095f:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800962:	eb 23                	jmp    800987 <vprintfmt+0x15a>
  800964:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800968:	0f 89 48 ff ff ff    	jns    8008b6 <vprintfmt+0x89>
  80096e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800975:	e9 3c ff ff ff       	jmpq   8008b6 <vprintfmt+0x89>
  80097a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800981:	e9 30 ff ff ff       	jmpq   8008b6 <vprintfmt+0x89>
  800986:	90                   	nop
  800987:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80098b:	0f 89 25 ff ff ff    	jns    8008b6 <vprintfmt+0x89>
  800991:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800994:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800997:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80099e:	e9 13 ff ff ff       	jmpq   8008b6 <vprintfmt+0x89>
  8009a3:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  8009a7:	e9 0a ff ff ff       	jmpq   8008b6 <vprintfmt+0x89>
  8009ac:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009af:	83 f8 30             	cmp    $0x30,%eax
  8009b2:	73 17                	jae    8009cb <vprintfmt+0x19e>
  8009b4:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8009b8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009bb:	89 d2                	mov    %edx,%edx
  8009bd:	48 01 d0             	add    %rdx,%rax
  8009c0:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009c3:	83 c2 08             	add    $0x8,%edx
  8009c6:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8009c9:	eb 0c                	jmp    8009d7 <vprintfmt+0x1aa>
  8009cb:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8009cf:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8009d3:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8009d7:	8b 10                	mov    (%rax),%edx
  8009d9:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8009dd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8009e1:	48 89 ce             	mov    %rcx,%rsi
  8009e4:	89 d7                	mov    %edx,%edi
  8009e6:	ff d0                	callq  *%rax
  8009e8:	e9 37 03 00 00       	jmpq   800d24 <vprintfmt+0x4f7>
  8009ed:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009f0:	83 f8 30             	cmp    $0x30,%eax
  8009f3:	73 17                	jae    800a0c <vprintfmt+0x1df>
  8009f5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8009f9:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009fc:	89 d2                	mov    %edx,%edx
  8009fe:	48 01 d0             	add    %rdx,%rax
  800a01:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a04:	83 c2 08             	add    $0x8,%edx
  800a07:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a0a:	eb 0c                	jmp    800a18 <vprintfmt+0x1eb>
  800a0c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800a10:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800a14:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a18:	8b 18                	mov    (%rax),%ebx
  800a1a:	85 db                	test   %ebx,%ebx
  800a1c:	79 02                	jns    800a20 <vprintfmt+0x1f3>
  800a1e:	f7 db                	neg    %ebx
  800a20:	83 fb 15             	cmp    $0x15,%ebx
  800a23:	7f 16                	jg     800a3b <vprintfmt+0x20e>
  800a25:	48 b8 a0 42 80 00 00 	movabs $0x8042a0,%rax
  800a2c:	00 00 00 
  800a2f:	48 63 d3             	movslq %ebx,%rdx
  800a32:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800a36:	4d 85 e4             	test   %r12,%r12
  800a39:	75 2e                	jne    800a69 <vprintfmt+0x23c>
  800a3b:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800a3f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a43:	89 d9                	mov    %ebx,%ecx
  800a45:	48 ba 61 43 80 00 00 	movabs $0x804361,%rdx
  800a4c:	00 00 00 
  800a4f:	48 89 c7             	mov    %rax,%rdi
  800a52:	b8 00 00 00 00       	mov    $0x0,%eax
  800a57:	49 b8 33 0d 80 00 00 	movabs $0x800d33,%r8
  800a5e:	00 00 00 
  800a61:	41 ff d0             	callq  *%r8
  800a64:	e9 bb 02 00 00       	jmpq   800d24 <vprintfmt+0x4f7>
  800a69:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800a6d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a71:	4c 89 e1             	mov    %r12,%rcx
  800a74:	48 ba 6a 43 80 00 00 	movabs $0x80436a,%rdx
  800a7b:	00 00 00 
  800a7e:	48 89 c7             	mov    %rax,%rdi
  800a81:	b8 00 00 00 00       	mov    $0x0,%eax
  800a86:	49 b8 33 0d 80 00 00 	movabs $0x800d33,%r8
  800a8d:	00 00 00 
  800a90:	41 ff d0             	callq  *%r8
  800a93:	e9 8c 02 00 00       	jmpq   800d24 <vprintfmt+0x4f7>
  800a98:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a9b:	83 f8 30             	cmp    $0x30,%eax
  800a9e:	73 17                	jae    800ab7 <vprintfmt+0x28a>
  800aa0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800aa4:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800aa7:	89 d2                	mov    %edx,%edx
  800aa9:	48 01 d0             	add    %rdx,%rax
  800aac:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800aaf:	83 c2 08             	add    $0x8,%edx
  800ab2:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ab5:	eb 0c                	jmp    800ac3 <vprintfmt+0x296>
  800ab7:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800abb:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800abf:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ac3:	4c 8b 20             	mov    (%rax),%r12
  800ac6:	4d 85 e4             	test   %r12,%r12
  800ac9:	75 0a                	jne    800ad5 <vprintfmt+0x2a8>
  800acb:	49 bc 6d 43 80 00 00 	movabs $0x80436d,%r12
  800ad2:	00 00 00 
  800ad5:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ad9:	7e 78                	jle    800b53 <vprintfmt+0x326>
  800adb:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800adf:	74 72                	je     800b53 <vprintfmt+0x326>
  800ae1:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800ae4:	48 98                	cltq   
  800ae6:	48 89 c6             	mov    %rax,%rsi
  800ae9:	4c 89 e7             	mov    %r12,%rdi
  800aec:	48 b8 e1 0f 80 00 00 	movabs $0x800fe1,%rax
  800af3:	00 00 00 
  800af6:	ff d0                	callq  *%rax
  800af8:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800afb:	eb 17                	jmp    800b14 <vprintfmt+0x2e7>
  800afd:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800b01:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b05:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b09:	48 89 ce             	mov    %rcx,%rsi
  800b0c:	89 d7                	mov    %edx,%edi
  800b0e:	ff d0                	callq  *%rax
  800b10:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800b14:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b18:	7f e3                	jg     800afd <vprintfmt+0x2d0>
  800b1a:	eb 37                	jmp    800b53 <vprintfmt+0x326>
  800b1c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800b20:	74 1e                	je     800b40 <vprintfmt+0x313>
  800b22:	83 fb 1f             	cmp    $0x1f,%ebx
  800b25:	7e 05                	jle    800b2c <vprintfmt+0x2ff>
  800b27:	83 fb 7e             	cmp    $0x7e,%ebx
  800b2a:	7e 14                	jle    800b40 <vprintfmt+0x313>
  800b2c:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b30:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b34:	48 89 d6             	mov    %rdx,%rsi
  800b37:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800b3c:	ff d0                	callq  *%rax
  800b3e:	eb 0f                	jmp    800b4f <vprintfmt+0x322>
  800b40:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b44:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b48:	48 89 d6             	mov    %rdx,%rsi
  800b4b:	89 df                	mov    %ebx,%edi
  800b4d:	ff d0                	callq  *%rax
  800b4f:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800b53:	4c 89 e0             	mov    %r12,%rax
  800b56:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800b5a:	0f b6 00             	movzbl (%rax),%eax
  800b5d:	0f be d8             	movsbl %al,%ebx
  800b60:	85 db                	test   %ebx,%ebx
  800b62:	74 28                	je     800b8c <vprintfmt+0x35f>
  800b64:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800b68:	78 b2                	js     800b1c <vprintfmt+0x2ef>
  800b6a:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800b6e:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800b72:	79 a8                	jns    800b1c <vprintfmt+0x2ef>
  800b74:	eb 16                	jmp    800b8c <vprintfmt+0x35f>
  800b76:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b7a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b7e:	48 89 d6             	mov    %rdx,%rsi
  800b81:	bf 20 00 00 00       	mov    $0x20,%edi
  800b86:	ff d0                	callq  *%rax
  800b88:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800b8c:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b90:	7f e4                	jg     800b76 <vprintfmt+0x349>
  800b92:	e9 8d 01 00 00       	jmpq   800d24 <vprintfmt+0x4f7>
  800b97:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800b9b:	be 03 00 00 00       	mov    $0x3,%esi
  800ba0:	48 89 c7             	mov    %rax,%rdi
  800ba3:	48 b8 26 07 80 00 00 	movabs $0x800726,%rax
  800baa:	00 00 00 
  800bad:	ff d0                	callq  *%rax
  800baf:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800bb3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bb7:	48 85 c0             	test   %rax,%rax
  800bba:	79 1d                	jns    800bd9 <vprintfmt+0x3ac>
  800bbc:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bc0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bc4:	48 89 d6             	mov    %rdx,%rsi
  800bc7:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800bcc:	ff d0                	callq  *%rax
  800bce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bd2:	48 f7 d8             	neg    %rax
  800bd5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800bd9:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800be0:	e9 d2 00 00 00       	jmpq   800cb7 <vprintfmt+0x48a>
  800be5:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800be9:	be 03 00 00 00       	mov    $0x3,%esi
  800bee:	48 89 c7             	mov    %rax,%rdi
  800bf1:	48 b8 1f 06 80 00 00 	movabs $0x80061f,%rax
  800bf8:	00 00 00 
  800bfb:	ff d0                	callq  *%rax
  800bfd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c01:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c08:	e9 aa 00 00 00       	jmpq   800cb7 <vprintfmt+0x48a>
  800c0d:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c11:	be 03 00 00 00       	mov    $0x3,%esi
  800c16:	48 89 c7             	mov    %rax,%rdi
  800c19:	48 b8 1f 06 80 00 00 	movabs $0x80061f,%rax
  800c20:	00 00 00 
  800c23:	ff d0                	callq  *%rax
  800c25:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c29:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800c30:	e9 82 00 00 00       	jmpq   800cb7 <vprintfmt+0x48a>
  800c35:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c39:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c3d:	48 89 d6             	mov    %rdx,%rsi
  800c40:	bf 30 00 00 00       	mov    $0x30,%edi
  800c45:	ff d0                	callq  *%rax
  800c47:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c4b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c4f:	48 89 d6             	mov    %rdx,%rsi
  800c52:	bf 78 00 00 00       	mov    $0x78,%edi
  800c57:	ff d0                	callq  *%rax
  800c59:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c5c:	83 f8 30             	cmp    $0x30,%eax
  800c5f:	73 17                	jae    800c78 <vprintfmt+0x44b>
  800c61:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800c65:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c68:	89 d2                	mov    %edx,%edx
  800c6a:	48 01 d0             	add    %rdx,%rax
  800c6d:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c70:	83 c2 08             	add    $0x8,%edx
  800c73:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c76:	eb 0c                	jmp    800c84 <vprintfmt+0x457>
  800c78:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800c7c:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800c80:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c84:	48 8b 00             	mov    (%rax),%rax
  800c87:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c8b:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800c92:	eb 23                	jmp    800cb7 <vprintfmt+0x48a>
  800c94:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c98:	be 03 00 00 00       	mov    $0x3,%esi
  800c9d:	48 89 c7             	mov    %rax,%rdi
  800ca0:	48 b8 1f 06 80 00 00 	movabs $0x80061f,%rax
  800ca7:	00 00 00 
  800caa:	ff d0                	callq  *%rax
  800cac:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cb0:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800cb7:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800cbc:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800cbf:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800cc2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800cc6:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800cca:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cce:	45 89 c1             	mov    %r8d,%r9d
  800cd1:	41 89 f8             	mov    %edi,%r8d
  800cd4:	48 89 c7             	mov    %rax,%rdi
  800cd7:	48 b8 67 05 80 00 00 	movabs $0x800567,%rax
  800cde:	00 00 00 
  800ce1:	ff d0                	callq  *%rax
  800ce3:	eb 3f                	jmp    800d24 <vprintfmt+0x4f7>
  800ce5:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ce9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ced:	48 89 d6             	mov    %rdx,%rsi
  800cf0:	89 df                	mov    %ebx,%edi
  800cf2:	ff d0                	callq  *%rax
  800cf4:	eb 2e                	jmp    800d24 <vprintfmt+0x4f7>
  800cf6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cfa:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cfe:	48 89 d6             	mov    %rdx,%rsi
  800d01:	bf 25 00 00 00       	mov    $0x25,%edi
  800d06:	ff d0                	callq  *%rax
  800d08:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d0d:	eb 05                	jmp    800d14 <vprintfmt+0x4e7>
  800d0f:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d14:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800d18:	48 83 e8 01          	sub    $0x1,%rax
  800d1c:	0f b6 00             	movzbl (%rax),%eax
  800d1f:	3c 25                	cmp    $0x25,%al
  800d21:	75 ec                	jne    800d0f <vprintfmt+0x4e2>
  800d23:	90                   	nop
  800d24:	e9 3d fb ff ff       	jmpq   800866 <vprintfmt+0x39>
  800d29:	90                   	nop
  800d2a:	48 83 c4 60          	add    $0x60,%rsp
  800d2e:	5b                   	pop    %rbx
  800d2f:	41 5c                	pop    %r12
  800d31:	5d                   	pop    %rbp
  800d32:	c3                   	retq   

0000000000800d33 <printfmt>:
  800d33:	55                   	push   %rbp
  800d34:	48 89 e5             	mov    %rsp,%rbp
  800d37:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800d3e:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800d45:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800d4c:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800d53:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800d5a:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800d61:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800d68:	84 c0                	test   %al,%al
  800d6a:	74 20                	je     800d8c <printfmt+0x59>
  800d6c:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800d70:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800d74:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800d78:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800d7c:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800d80:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800d84:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800d88:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800d8c:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800d93:	00 00 00 
  800d96:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800d9d:	00 00 00 
  800da0:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800da4:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800dab:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800db2:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800db9:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800dc0:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800dc7:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800dce:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800dd5:	48 89 c7             	mov    %rax,%rdi
  800dd8:	48 b8 2d 08 80 00 00 	movabs $0x80082d,%rax
  800ddf:	00 00 00 
  800de2:	ff d0                	callq  *%rax
  800de4:	90                   	nop
  800de5:	c9                   	leaveq 
  800de6:	c3                   	retq   

0000000000800de7 <sprintputch>:
  800de7:	55                   	push   %rbp
  800de8:	48 89 e5             	mov    %rsp,%rbp
  800deb:	48 83 ec 10          	sub    $0x10,%rsp
  800def:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800df2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800df6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800dfa:	8b 40 10             	mov    0x10(%rax),%eax
  800dfd:	8d 50 01             	lea    0x1(%rax),%edx
  800e00:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e04:	89 50 10             	mov    %edx,0x10(%rax)
  800e07:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e0b:	48 8b 10             	mov    (%rax),%rdx
  800e0e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e12:	48 8b 40 08          	mov    0x8(%rax),%rax
  800e16:	48 39 c2             	cmp    %rax,%rdx
  800e19:	73 17                	jae    800e32 <sprintputch+0x4b>
  800e1b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e1f:	48 8b 00             	mov    (%rax),%rax
  800e22:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800e26:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800e2a:	48 89 0a             	mov    %rcx,(%rdx)
  800e2d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800e30:	88 10                	mov    %dl,(%rax)
  800e32:	90                   	nop
  800e33:	c9                   	leaveq 
  800e34:	c3                   	retq   

0000000000800e35 <vsnprintf>:
  800e35:	55                   	push   %rbp
  800e36:	48 89 e5             	mov    %rsp,%rbp
  800e39:	48 83 ec 50          	sub    $0x50,%rsp
  800e3d:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800e41:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800e44:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800e48:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800e4c:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800e50:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800e54:	48 8b 0a             	mov    (%rdx),%rcx
  800e57:	48 89 08             	mov    %rcx,(%rax)
  800e5a:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800e5e:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800e62:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800e66:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800e6a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800e6e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800e72:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800e75:	48 98                	cltq   
  800e77:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800e7b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800e7f:	48 01 d0             	add    %rdx,%rax
  800e82:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800e86:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800e8d:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800e92:	74 06                	je     800e9a <vsnprintf+0x65>
  800e94:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800e98:	7f 07                	jg     800ea1 <vsnprintf+0x6c>
  800e9a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800e9f:	eb 2f                	jmp    800ed0 <vsnprintf+0x9b>
  800ea1:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800ea5:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800ea9:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800ead:	48 89 c6             	mov    %rax,%rsi
  800eb0:	48 bf e7 0d 80 00 00 	movabs $0x800de7,%rdi
  800eb7:	00 00 00 
  800eba:	48 b8 2d 08 80 00 00 	movabs $0x80082d,%rax
  800ec1:	00 00 00 
  800ec4:	ff d0                	callq  *%rax
  800ec6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800eca:	c6 00 00             	movb   $0x0,(%rax)
  800ecd:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800ed0:	c9                   	leaveq 
  800ed1:	c3                   	retq   

0000000000800ed2 <snprintf>:
  800ed2:	55                   	push   %rbp
  800ed3:	48 89 e5             	mov    %rsp,%rbp
  800ed6:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800edd:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800ee4:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800eea:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800ef1:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800ef8:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800eff:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f06:	84 c0                	test   %al,%al
  800f08:	74 20                	je     800f2a <snprintf+0x58>
  800f0a:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f0e:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f12:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f16:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f1a:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f1e:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f22:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f26:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f2a:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800f31:	00 00 00 
  800f34:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800f3b:	00 00 00 
  800f3e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800f42:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800f49:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800f50:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800f57:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800f5e:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800f65:	48 8b 0a             	mov    (%rdx),%rcx
  800f68:	48 89 08             	mov    %rcx,(%rax)
  800f6b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800f6f:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800f73:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800f77:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800f7b:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800f82:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800f89:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800f8f:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800f96:	48 89 c7             	mov    %rax,%rdi
  800f99:	48 b8 35 0e 80 00 00 	movabs $0x800e35,%rax
  800fa0:	00 00 00 
  800fa3:	ff d0                	callq  *%rax
  800fa5:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800fab:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800fb1:	c9                   	leaveq 
  800fb2:	c3                   	retq   

0000000000800fb3 <strlen>:
  800fb3:	55                   	push   %rbp
  800fb4:	48 89 e5             	mov    %rsp,%rbp
  800fb7:	48 83 ec 18          	sub    $0x18,%rsp
  800fbb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fbf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800fc6:	eb 09                	jmp    800fd1 <strlen+0x1e>
  800fc8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800fcc:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800fd1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fd5:	0f b6 00             	movzbl (%rax),%eax
  800fd8:	84 c0                	test   %al,%al
  800fda:	75 ec                	jne    800fc8 <strlen+0x15>
  800fdc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800fdf:	c9                   	leaveq 
  800fe0:	c3                   	retq   

0000000000800fe1 <strnlen>:
  800fe1:	55                   	push   %rbp
  800fe2:	48 89 e5             	mov    %rsp,%rbp
  800fe5:	48 83 ec 20          	sub    $0x20,%rsp
  800fe9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fed:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800ff1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800ff8:	eb 0e                	jmp    801008 <strnlen+0x27>
  800ffa:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800ffe:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801003:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801008:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80100d:	74 0b                	je     80101a <strnlen+0x39>
  80100f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801013:	0f b6 00             	movzbl (%rax),%eax
  801016:	84 c0                	test   %al,%al
  801018:	75 e0                	jne    800ffa <strnlen+0x19>
  80101a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80101d:	c9                   	leaveq 
  80101e:	c3                   	retq   

000000000080101f <strcpy>:
  80101f:	55                   	push   %rbp
  801020:	48 89 e5             	mov    %rsp,%rbp
  801023:	48 83 ec 20          	sub    $0x20,%rsp
  801027:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80102b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80102f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801033:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801037:	90                   	nop
  801038:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80103c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801040:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801044:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801048:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80104c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801050:	0f b6 12             	movzbl (%rdx),%edx
  801053:	88 10                	mov    %dl,(%rax)
  801055:	0f b6 00             	movzbl (%rax),%eax
  801058:	84 c0                	test   %al,%al
  80105a:	75 dc                	jne    801038 <strcpy+0x19>
  80105c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801060:	c9                   	leaveq 
  801061:	c3                   	retq   

0000000000801062 <strcat>:
  801062:	55                   	push   %rbp
  801063:	48 89 e5             	mov    %rsp,%rbp
  801066:	48 83 ec 20          	sub    $0x20,%rsp
  80106a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80106e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801072:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801076:	48 89 c7             	mov    %rax,%rdi
  801079:	48 b8 b3 0f 80 00 00 	movabs $0x800fb3,%rax
  801080:	00 00 00 
  801083:	ff d0                	callq  *%rax
  801085:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801088:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80108b:	48 63 d0             	movslq %eax,%rdx
  80108e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801092:	48 01 c2             	add    %rax,%rdx
  801095:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801099:	48 89 c6             	mov    %rax,%rsi
  80109c:	48 89 d7             	mov    %rdx,%rdi
  80109f:	48 b8 1f 10 80 00 00 	movabs $0x80101f,%rax
  8010a6:	00 00 00 
  8010a9:	ff d0                	callq  *%rax
  8010ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010af:	c9                   	leaveq 
  8010b0:	c3                   	retq   

00000000008010b1 <strncpy>:
  8010b1:	55                   	push   %rbp
  8010b2:	48 89 e5             	mov    %rsp,%rbp
  8010b5:	48 83 ec 28          	sub    $0x28,%rsp
  8010b9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010bd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010c1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8010c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010c9:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8010cd:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8010d4:	00 
  8010d5:	eb 2a                	jmp    801101 <strncpy+0x50>
  8010d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010db:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8010df:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8010e3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8010e7:	0f b6 12             	movzbl (%rdx),%edx
  8010ea:	88 10                	mov    %dl,(%rax)
  8010ec:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8010f0:	0f b6 00             	movzbl (%rax),%eax
  8010f3:	84 c0                	test   %al,%al
  8010f5:	74 05                	je     8010fc <strncpy+0x4b>
  8010f7:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8010fc:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801101:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801105:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801109:	72 cc                	jb     8010d7 <strncpy+0x26>
  80110b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80110f:	c9                   	leaveq 
  801110:	c3                   	retq   

0000000000801111 <strlcpy>:
  801111:	55                   	push   %rbp
  801112:	48 89 e5             	mov    %rsp,%rbp
  801115:	48 83 ec 28          	sub    $0x28,%rsp
  801119:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80111d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801121:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801125:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801129:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80112d:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801132:	74 3d                	je     801171 <strlcpy+0x60>
  801134:	eb 1d                	jmp    801153 <strlcpy+0x42>
  801136:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80113a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80113e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801142:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801146:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80114a:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80114e:	0f b6 12             	movzbl (%rdx),%edx
  801151:	88 10                	mov    %dl,(%rax)
  801153:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801158:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80115d:	74 0b                	je     80116a <strlcpy+0x59>
  80115f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801163:	0f b6 00             	movzbl (%rax),%eax
  801166:	84 c0                	test   %al,%al
  801168:	75 cc                	jne    801136 <strlcpy+0x25>
  80116a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80116e:	c6 00 00             	movb   $0x0,(%rax)
  801171:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801175:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801179:	48 29 c2             	sub    %rax,%rdx
  80117c:	48 89 d0             	mov    %rdx,%rax
  80117f:	c9                   	leaveq 
  801180:	c3                   	retq   

0000000000801181 <strcmp>:
  801181:	55                   	push   %rbp
  801182:	48 89 e5             	mov    %rsp,%rbp
  801185:	48 83 ec 10          	sub    $0x10,%rsp
  801189:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80118d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801191:	eb 0a                	jmp    80119d <strcmp+0x1c>
  801193:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801198:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80119d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011a1:	0f b6 00             	movzbl (%rax),%eax
  8011a4:	84 c0                	test   %al,%al
  8011a6:	74 12                	je     8011ba <strcmp+0x39>
  8011a8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011ac:	0f b6 10             	movzbl (%rax),%edx
  8011af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011b3:	0f b6 00             	movzbl (%rax),%eax
  8011b6:	38 c2                	cmp    %al,%dl
  8011b8:	74 d9                	je     801193 <strcmp+0x12>
  8011ba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011be:	0f b6 00             	movzbl (%rax),%eax
  8011c1:	0f b6 d0             	movzbl %al,%edx
  8011c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011c8:	0f b6 00             	movzbl (%rax),%eax
  8011cb:	0f b6 c0             	movzbl %al,%eax
  8011ce:	29 c2                	sub    %eax,%edx
  8011d0:	89 d0                	mov    %edx,%eax
  8011d2:	c9                   	leaveq 
  8011d3:	c3                   	retq   

00000000008011d4 <strncmp>:
  8011d4:	55                   	push   %rbp
  8011d5:	48 89 e5             	mov    %rsp,%rbp
  8011d8:	48 83 ec 18          	sub    $0x18,%rsp
  8011dc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011e0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8011e4:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8011e8:	eb 0f                	jmp    8011f9 <strncmp+0x25>
  8011ea:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8011ef:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011f4:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8011f9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8011fe:	74 1d                	je     80121d <strncmp+0x49>
  801200:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801204:	0f b6 00             	movzbl (%rax),%eax
  801207:	84 c0                	test   %al,%al
  801209:	74 12                	je     80121d <strncmp+0x49>
  80120b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80120f:	0f b6 10             	movzbl (%rax),%edx
  801212:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801216:	0f b6 00             	movzbl (%rax),%eax
  801219:	38 c2                	cmp    %al,%dl
  80121b:	74 cd                	je     8011ea <strncmp+0x16>
  80121d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801222:	75 07                	jne    80122b <strncmp+0x57>
  801224:	b8 00 00 00 00       	mov    $0x0,%eax
  801229:	eb 18                	jmp    801243 <strncmp+0x6f>
  80122b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80122f:	0f b6 00             	movzbl (%rax),%eax
  801232:	0f b6 d0             	movzbl %al,%edx
  801235:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801239:	0f b6 00             	movzbl (%rax),%eax
  80123c:	0f b6 c0             	movzbl %al,%eax
  80123f:	29 c2                	sub    %eax,%edx
  801241:	89 d0                	mov    %edx,%eax
  801243:	c9                   	leaveq 
  801244:	c3                   	retq   

0000000000801245 <strchr>:
  801245:	55                   	push   %rbp
  801246:	48 89 e5             	mov    %rsp,%rbp
  801249:	48 83 ec 10          	sub    $0x10,%rsp
  80124d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801251:	89 f0                	mov    %esi,%eax
  801253:	88 45 f4             	mov    %al,-0xc(%rbp)
  801256:	eb 17                	jmp    80126f <strchr+0x2a>
  801258:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80125c:	0f b6 00             	movzbl (%rax),%eax
  80125f:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801262:	75 06                	jne    80126a <strchr+0x25>
  801264:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801268:	eb 15                	jmp    80127f <strchr+0x3a>
  80126a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80126f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801273:	0f b6 00             	movzbl (%rax),%eax
  801276:	84 c0                	test   %al,%al
  801278:	75 de                	jne    801258 <strchr+0x13>
  80127a:	b8 00 00 00 00       	mov    $0x0,%eax
  80127f:	c9                   	leaveq 
  801280:	c3                   	retq   

0000000000801281 <strfind>:
  801281:	55                   	push   %rbp
  801282:	48 89 e5             	mov    %rsp,%rbp
  801285:	48 83 ec 10          	sub    $0x10,%rsp
  801289:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80128d:	89 f0                	mov    %esi,%eax
  80128f:	88 45 f4             	mov    %al,-0xc(%rbp)
  801292:	eb 11                	jmp    8012a5 <strfind+0x24>
  801294:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801298:	0f b6 00             	movzbl (%rax),%eax
  80129b:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80129e:	74 12                	je     8012b2 <strfind+0x31>
  8012a0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012a9:	0f b6 00             	movzbl (%rax),%eax
  8012ac:	84 c0                	test   %al,%al
  8012ae:	75 e4                	jne    801294 <strfind+0x13>
  8012b0:	eb 01                	jmp    8012b3 <strfind+0x32>
  8012b2:	90                   	nop
  8012b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012b7:	c9                   	leaveq 
  8012b8:	c3                   	retq   

00000000008012b9 <memset>:
  8012b9:	55                   	push   %rbp
  8012ba:	48 89 e5             	mov    %rsp,%rbp
  8012bd:	48 83 ec 18          	sub    $0x18,%rsp
  8012c1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012c5:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8012c8:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012cc:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8012d1:	75 06                	jne    8012d9 <memset+0x20>
  8012d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012d7:	eb 69                	jmp    801342 <memset+0x89>
  8012d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012dd:	83 e0 03             	and    $0x3,%eax
  8012e0:	48 85 c0             	test   %rax,%rax
  8012e3:	75 48                	jne    80132d <memset+0x74>
  8012e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012e9:	83 e0 03             	and    $0x3,%eax
  8012ec:	48 85 c0             	test   %rax,%rax
  8012ef:	75 3c                	jne    80132d <memset+0x74>
  8012f1:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8012f8:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8012fb:	c1 e0 18             	shl    $0x18,%eax
  8012fe:	89 c2                	mov    %eax,%edx
  801300:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801303:	c1 e0 10             	shl    $0x10,%eax
  801306:	09 c2                	or     %eax,%edx
  801308:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80130b:	c1 e0 08             	shl    $0x8,%eax
  80130e:	09 d0                	or     %edx,%eax
  801310:	09 45 f4             	or     %eax,-0xc(%rbp)
  801313:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801317:	48 c1 e8 02          	shr    $0x2,%rax
  80131b:	48 89 c1             	mov    %rax,%rcx
  80131e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801322:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801325:	48 89 d7             	mov    %rdx,%rdi
  801328:	fc                   	cld    
  801329:	f3 ab                	rep stos %eax,%es:(%rdi)
  80132b:	eb 11                	jmp    80133e <memset+0x85>
  80132d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801331:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801334:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801338:	48 89 d7             	mov    %rdx,%rdi
  80133b:	fc                   	cld    
  80133c:	f3 aa                	rep stos %al,%es:(%rdi)
  80133e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801342:	c9                   	leaveq 
  801343:	c3                   	retq   

0000000000801344 <memmove>:
  801344:	55                   	push   %rbp
  801345:	48 89 e5             	mov    %rsp,%rbp
  801348:	48 83 ec 28          	sub    $0x28,%rsp
  80134c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801350:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801354:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801358:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80135c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801360:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801364:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801368:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80136c:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801370:	0f 83 88 00 00 00    	jae    8013fe <memmove+0xba>
  801376:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80137a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80137e:	48 01 d0             	add    %rdx,%rax
  801381:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801385:	76 77                	jbe    8013fe <memmove+0xba>
  801387:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80138b:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80138f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801393:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801397:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80139b:	83 e0 03             	and    $0x3,%eax
  80139e:	48 85 c0             	test   %rax,%rax
  8013a1:	75 3b                	jne    8013de <memmove+0x9a>
  8013a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013a7:	83 e0 03             	and    $0x3,%eax
  8013aa:	48 85 c0             	test   %rax,%rax
  8013ad:	75 2f                	jne    8013de <memmove+0x9a>
  8013af:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013b3:	83 e0 03             	and    $0x3,%eax
  8013b6:	48 85 c0             	test   %rax,%rax
  8013b9:	75 23                	jne    8013de <memmove+0x9a>
  8013bb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013bf:	48 83 e8 04          	sub    $0x4,%rax
  8013c3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013c7:	48 83 ea 04          	sub    $0x4,%rdx
  8013cb:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8013cf:	48 c1 e9 02          	shr    $0x2,%rcx
  8013d3:	48 89 c7             	mov    %rax,%rdi
  8013d6:	48 89 d6             	mov    %rdx,%rsi
  8013d9:	fd                   	std    
  8013da:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8013dc:	eb 1d                	jmp    8013fb <memmove+0xb7>
  8013de:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013e2:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8013e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013ea:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8013ee:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013f2:	48 89 d7             	mov    %rdx,%rdi
  8013f5:	48 89 c1             	mov    %rax,%rcx
  8013f8:	fd                   	std    
  8013f9:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8013fb:	fc                   	cld    
  8013fc:	eb 57                	jmp    801455 <memmove+0x111>
  8013fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801402:	83 e0 03             	and    $0x3,%eax
  801405:	48 85 c0             	test   %rax,%rax
  801408:	75 36                	jne    801440 <memmove+0xfc>
  80140a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80140e:	83 e0 03             	and    $0x3,%eax
  801411:	48 85 c0             	test   %rax,%rax
  801414:	75 2a                	jne    801440 <memmove+0xfc>
  801416:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80141a:	83 e0 03             	and    $0x3,%eax
  80141d:	48 85 c0             	test   %rax,%rax
  801420:	75 1e                	jne    801440 <memmove+0xfc>
  801422:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801426:	48 c1 e8 02          	shr    $0x2,%rax
  80142a:	48 89 c1             	mov    %rax,%rcx
  80142d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801431:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801435:	48 89 c7             	mov    %rax,%rdi
  801438:	48 89 d6             	mov    %rdx,%rsi
  80143b:	fc                   	cld    
  80143c:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80143e:	eb 15                	jmp    801455 <memmove+0x111>
  801440:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801444:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801448:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80144c:	48 89 c7             	mov    %rax,%rdi
  80144f:	48 89 d6             	mov    %rdx,%rsi
  801452:	fc                   	cld    
  801453:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801455:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801459:	c9                   	leaveq 
  80145a:	c3                   	retq   

000000000080145b <memcpy>:
  80145b:	55                   	push   %rbp
  80145c:	48 89 e5             	mov    %rsp,%rbp
  80145f:	48 83 ec 18          	sub    $0x18,%rsp
  801463:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801467:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80146b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80146f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801473:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801477:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80147b:	48 89 ce             	mov    %rcx,%rsi
  80147e:	48 89 c7             	mov    %rax,%rdi
  801481:	48 b8 44 13 80 00 00 	movabs $0x801344,%rax
  801488:	00 00 00 
  80148b:	ff d0                	callq  *%rax
  80148d:	c9                   	leaveq 
  80148e:	c3                   	retq   

000000000080148f <memcmp>:
  80148f:	55                   	push   %rbp
  801490:	48 89 e5             	mov    %rsp,%rbp
  801493:	48 83 ec 28          	sub    $0x28,%rsp
  801497:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80149b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80149f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014a7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8014ab:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014af:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8014b3:	eb 36                	jmp    8014eb <memcmp+0x5c>
  8014b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014b9:	0f b6 10             	movzbl (%rax),%edx
  8014bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014c0:	0f b6 00             	movzbl (%rax),%eax
  8014c3:	38 c2                	cmp    %al,%dl
  8014c5:	74 1a                	je     8014e1 <memcmp+0x52>
  8014c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014cb:	0f b6 00             	movzbl (%rax),%eax
  8014ce:	0f b6 d0             	movzbl %al,%edx
  8014d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014d5:	0f b6 00             	movzbl (%rax),%eax
  8014d8:	0f b6 c0             	movzbl %al,%eax
  8014db:	29 c2                	sub    %eax,%edx
  8014dd:	89 d0                	mov    %edx,%eax
  8014df:	eb 20                	jmp    801501 <memcmp+0x72>
  8014e1:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8014e6:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8014eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014ef:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8014f3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014f7:	48 85 c0             	test   %rax,%rax
  8014fa:	75 b9                	jne    8014b5 <memcmp+0x26>
  8014fc:	b8 00 00 00 00       	mov    $0x0,%eax
  801501:	c9                   	leaveq 
  801502:	c3                   	retq   

0000000000801503 <memfind>:
  801503:	55                   	push   %rbp
  801504:	48 89 e5             	mov    %rsp,%rbp
  801507:	48 83 ec 28          	sub    $0x28,%rsp
  80150b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80150f:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801512:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801516:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80151a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80151e:	48 01 d0             	add    %rdx,%rax
  801521:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801525:	eb 13                	jmp    80153a <memfind+0x37>
  801527:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80152b:	0f b6 00             	movzbl (%rax),%eax
  80152e:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801531:	38 d0                	cmp    %dl,%al
  801533:	74 11                	je     801546 <memfind+0x43>
  801535:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80153a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80153e:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801542:	72 e3                	jb     801527 <memfind+0x24>
  801544:	eb 01                	jmp    801547 <memfind+0x44>
  801546:	90                   	nop
  801547:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80154b:	c9                   	leaveq 
  80154c:	c3                   	retq   

000000000080154d <strtol>:
  80154d:	55                   	push   %rbp
  80154e:	48 89 e5             	mov    %rsp,%rbp
  801551:	48 83 ec 38          	sub    $0x38,%rsp
  801555:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801559:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80155d:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801560:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801567:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80156e:	00 
  80156f:	eb 05                	jmp    801576 <strtol+0x29>
  801571:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801576:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80157a:	0f b6 00             	movzbl (%rax),%eax
  80157d:	3c 20                	cmp    $0x20,%al
  80157f:	74 f0                	je     801571 <strtol+0x24>
  801581:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801585:	0f b6 00             	movzbl (%rax),%eax
  801588:	3c 09                	cmp    $0x9,%al
  80158a:	74 e5                	je     801571 <strtol+0x24>
  80158c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801590:	0f b6 00             	movzbl (%rax),%eax
  801593:	3c 2b                	cmp    $0x2b,%al
  801595:	75 07                	jne    80159e <strtol+0x51>
  801597:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80159c:	eb 17                	jmp    8015b5 <strtol+0x68>
  80159e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015a2:	0f b6 00             	movzbl (%rax),%eax
  8015a5:	3c 2d                	cmp    $0x2d,%al
  8015a7:	75 0c                	jne    8015b5 <strtol+0x68>
  8015a9:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015ae:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8015b5:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8015b9:	74 06                	je     8015c1 <strtol+0x74>
  8015bb:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8015bf:	75 28                	jne    8015e9 <strtol+0x9c>
  8015c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015c5:	0f b6 00             	movzbl (%rax),%eax
  8015c8:	3c 30                	cmp    $0x30,%al
  8015ca:	75 1d                	jne    8015e9 <strtol+0x9c>
  8015cc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015d0:	48 83 c0 01          	add    $0x1,%rax
  8015d4:	0f b6 00             	movzbl (%rax),%eax
  8015d7:	3c 78                	cmp    $0x78,%al
  8015d9:	75 0e                	jne    8015e9 <strtol+0x9c>
  8015db:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8015e0:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8015e7:	eb 2c                	jmp    801615 <strtol+0xc8>
  8015e9:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8015ed:	75 19                	jne    801608 <strtol+0xbb>
  8015ef:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015f3:	0f b6 00             	movzbl (%rax),%eax
  8015f6:	3c 30                	cmp    $0x30,%al
  8015f8:	75 0e                	jne    801608 <strtol+0xbb>
  8015fa:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015ff:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801606:	eb 0d                	jmp    801615 <strtol+0xc8>
  801608:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80160c:	75 07                	jne    801615 <strtol+0xc8>
  80160e:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801615:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801619:	0f b6 00             	movzbl (%rax),%eax
  80161c:	3c 2f                	cmp    $0x2f,%al
  80161e:	7e 1d                	jle    80163d <strtol+0xf0>
  801620:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801624:	0f b6 00             	movzbl (%rax),%eax
  801627:	3c 39                	cmp    $0x39,%al
  801629:	7f 12                	jg     80163d <strtol+0xf0>
  80162b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80162f:	0f b6 00             	movzbl (%rax),%eax
  801632:	0f be c0             	movsbl %al,%eax
  801635:	83 e8 30             	sub    $0x30,%eax
  801638:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80163b:	eb 4e                	jmp    80168b <strtol+0x13e>
  80163d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801641:	0f b6 00             	movzbl (%rax),%eax
  801644:	3c 60                	cmp    $0x60,%al
  801646:	7e 1d                	jle    801665 <strtol+0x118>
  801648:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80164c:	0f b6 00             	movzbl (%rax),%eax
  80164f:	3c 7a                	cmp    $0x7a,%al
  801651:	7f 12                	jg     801665 <strtol+0x118>
  801653:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801657:	0f b6 00             	movzbl (%rax),%eax
  80165a:	0f be c0             	movsbl %al,%eax
  80165d:	83 e8 57             	sub    $0x57,%eax
  801660:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801663:	eb 26                	jmp    80168b <strtol+0x13e>
  801665:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801669:	0f b6 00             	movzbl (%rax),%eax
  80166c:	3c 40                	cmp    $0x40,%al
  80166e:	7e 47                	jle    8016b7 <strtol+0x16a>
  801670:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801674:	0f b6 00             	movzbl (%rax),%eax
  801677:	3c 5a                	cmp    $0x5a,%al
  801679:	7f 3c                	jg     8016b7 <strtol+0x16a>
  80167b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80167f:	0f b6 00             	movzbl (%rax),%eax
  801682:	0f be c0             	movsbl %al,%eax
  801685:	83 e8 37             	sub    $0x37,%eax
  801688:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80168b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80168e:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801691:	7d 23                	jge    8016b6 <strtol+0x169>
  801693:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801698:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80169b:	48 98                	cltq   
  80169d:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8016a2:	48 89 c2             	mov    %rax,%rdx
  8016a5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8016a8:	48 98                	cltq   
  8016aa:	48 01 d0             	add    %rdx,%rax
  8016ad:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8016b1:	e9 5f ff ff ff       	jmpq   801615 <strtol+0xc8>
  8016b6:	90                   	nop
  8016b7:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8016bc:	74 0b                	je     8016c9 <strtol+0x17c>
  8016be:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8016c2:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8016c6:	48 89 10             	mov    %rdx,(%rax)
  8016c9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8016cd:	74 09                	je     8016d8 <strtol+0x18b>
  8016cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016d3:	48 f7 d8             	neg    %rax
  8016d6:	eb 04                	jmp    8016dc <strtol+0x18f>
  8016d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016dc:	c9                   	leaveq 
  8016dd:	c3                   	retq   

00000000008016de <strstr>:
  8016de:	55                   	push   %rbp
  8016df:	48 89 e5             	mov    %rsp,%rbp
  8016e2:	48 83 ec 30          	sub    $0x30,%rsp
  8016e6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8016ea:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8016ee:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8016f2:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8016f6:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8016fa:	0f b6 00             	movzbl (%rax),%eax
  8016fd:	88 45 ff             	mov    %al,-0x1(%rbp)
  801700:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801704:	75 06                	jne    80170c <strstr+0x2e>
  801706:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80170a:	eb 6b                	jmp    801777 <strstr+0x99>
  80170c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801710:	48 89 c7             	mov    %rax,%rdi
  801713:	48 b8 b3 0f 80 00 00 	movabs $0x800fb3,%rax
  80171a:	00 00 00 
  80171d:	ff d0                	callq  *%rax
  80171f:	48 98                	cltq   
  801721:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801725:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801729:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80172d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801731:	0f b6 00             	movzbl (%rax),%eax
  801734:	88 45 ef             	mov    %al,-0x11(%rbp)
  801737:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  80173b:	75 07                	jne    801744 <strstr+0x66>
  80173d:	b8 00 00 00 00       	mov    $0x0,%eax
  801742:	eb 33                	jmp    801777 <strstr+0x99>
  801744:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801748:	3a 45 ff             	cmp    -0x1(%rbp),%al
  80174b:	75 d8                	jne    801725 <strstr+0x47>
  80174d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801751:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801755:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801759:	48 89 ce             	mov    %rcx,%rsi
  80175c:	48 89 c7             	mov    %rax,%rdi
  80175f:	48 b8 d4 11 80 00 00 	movabs $0x8011d4,%rax
  801766:	00 00 00 
  801769:	ff d0                	callq  *%rax
  80176b:	85 c0                	test   %eax,%eax
  80176d:	75 b6                	jne    801725 <strstr+0x47>
  80176f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801773:	48 83 e8 01          	sub    $0x1,%rax
  801777:	c9                   	leaveq 
  801778:	c3                   	retq   

0000000000801779 <syscall>:
  801779:	55                   	push   %rbp
  80177a:	48 89 e5             	mov    %rsp,%rbp
  80177d:	53                   	push   %rbx
  80177e:	48 83 ec 48          	sub    $0x48,%rsp
  801782:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801785:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801788:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80178c:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801790:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801794:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801798:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80179b:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80179f:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8017a3:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8017a7:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8017ab:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8017af:	4c 89 c3             	mov    %r8,%rbx
  8017b2:	cd 30                	int    $0x30
  8017b4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8017b8:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8017bc:	74 3e                	je     8017fc <syscall+0x83>
  8017be:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8017c3:	7e 37                	jle    8017fc <syscall+0x83>
  8017c5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017c9:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8017cc:	49 89 d0             	mov    %rdx,%r8
  8017cf:	89 c1                	mov    %eax,%ecx
  8017d1:	48 ba 28 46 80 00 00 	movabs $0x804628,%rdx
  8017d8:	00 00 00 
  8017db:	be 24 00 00 00       	mov    $0x24,%esi
  8017e0:	48 bf 45 46 80 00 00 	movabs $0x804645,%rdi
  8017e7:	00 00 00 
  8017ea:	b8 00 00 00 00       	mov    $0x0,%eax
  8017ef:	49 b9 55 02 80 00 00 	movabs $0x800255,%r9
  8017f6:	00 00 00 
  8017f9:	41 ff d1             	callq  *%r9
  8017fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801800:	48 83 c4 48          	add    $0x48,%rsp
  801804:	5b                   	pop    %rbx
  801805:	5d                   	pop    %rbp
  801806:	c3                   	retq   

0000000000801807 <sys_cputs>:
  801807:	55                   	push   %rbp
  801808:	48 89 e5             	mov    %rsp,%rbp
  80180b:	48 83 ec 10          	sub    $0x10,%rsp
  80180f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801813:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801817:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80181b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80181f:	48 83 ec 08          	sub    $0x8,%rsp
  801823:	6a 00                	pushq  $0x0
  801825:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80182b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801831:	48 89 d1             	mov    %rdx,%rcx
  801834:	48 89 c2             	mov    %rax,%rdx
  801837:	be 00 00 00 00       	mov    $0x0,%esi
  80183c:	bf 00 00 00 00       	mov    $0x0,%edi
  801841:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  801848:	00 00 00 
  80184b:	ff d0                	callq  *%rax
  80184d:	48 83 c4 10          	add    $0x10,%rsp
  801851:	90                   	nop
  801852:	c9                   	leaveq 
  801853:	c3                   	retq   

0000000000801854 <sys_cgetc>:
  801854:	55                   	push   %rbp
  801855:	48 89 e5             	mov    %rsp,%rbp
  801858:	48 83 ec 08          	sub    $0x8,%rsp
  80185c:	6a 00                	pushq  $0x0
  80185e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801864:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80186a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80186f:	ba 00 00 00 00       	mov    $0x0,%edx
  801874:	be 00 00 00 00       	mov    $0x0,%esi
  801879:	bf 01 00 00 00       	mov    $0x1,%edi
  80187e:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  801885:	00 00 00 
  801888:	ff d0                	callq  *%rax
  80188a:	48 83 c4 10          	add    $0x10,%rsp
  80188e:	c9                   	leaveq 
  80188f:	c3                   	retq   

0000000000801890 <sys_env_destroy>:
  801890:	55                   	push   %rbp
  801891:	48 89 e5             	mov    %rsp,%rbp
  801894:	48 83 ec 10          	sub    $0x10,%rsp
  801898:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80189b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80189e:	48 98                	cltq   
  8018a0:	48 83 ec 08          	sub    $0x8,%rsp
  8018a4:	6a 00                	pushq  $0x0
  8018a6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018ac:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018b2:	b9 00 00 00 00       	mov    $0x0,%ecx
  8018b7:	48 89 c2             	mov    %rax,%rdx
  8018ba:	be 01 00 00 00       	mov    $0x1,%esi
  8018bf:	bf 03 00 00 00       	mov    $0x3,%edi
  8018c4:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  8018cb:	00 00 00 
  8018ce:	ff d0                	callq  *%rax
  8018d0:	48 83 c4 10          	add    $0x10,%rsp
  8018d4:	c9                   	leaveq 
  8018d5:	c3                   	retq   

00000000008018d6 <sys_getenvid>:
  8018d6:	55                   	push   %rbp
  8018d7:	48 89 e5             	mov    %rsp,%rbp
  8018da:	48 83 ec 08          	sub    $0x8,%rsp
  8018de:	6a 00                	pushq  $0x0
  8018e0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018e6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018ec:	b9 00 00 00 00       	mov    $0x0,%ecx
  8018f1:	ba 00 00 00 00       	mov    $0x0,%edx
  8018f6:	be 00 00 00 00       	mov    $0x0,%esi
  8018fb:	bf 02 00 00 00       	mov    $0x2,%edi
  801900:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  801907:	00 00 00 
  80190a:	ff d0                	callq  *%rax
  80190c:	48 83 c4 10          	add    $0x10,%rsp
  801910:	c9                   	leaveq 
  801911:	c3                   	retq   

0000000000801912 <sys_yield>:
  801912:	55                   	push   %rbp
  801913:	48 89 e5             	mov    %rsp,%rbp
  801916:	48 83 ec 08          	sub    $0x8,%rsp
  80191a:	6a 00                	pushq  $0x0
  80191c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801922:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801928:	b9 00 00 00 00       	mov    $0x0,%ecx
  80192d:	ba 00 00 00 00       	mov    $0x0,%edx
  801932:	be 00 00 00 00       	mov    $0x0,%esi
  801937:	bf 0b 00 00 00       	mov    $0xb,%edi
  80193c:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  801943:	00 00 00 
  801946:	ff d0                	callq  *%rax
  801948:	48 83 c4 10          	add    $0x10,%rsp
  80194c:	90                   	nop
  80194d:	c9                   	leaveq 
  80194e:	c3                   	retq   

000000000080194f <sys_page_alloc>:
  80194f:	55                   	push   %rbp
  801950:	48 89 e5             	mov    %rsp,%rbp
  801953:	48 83 ec 10          	sub    $0x10,%rsp
  801957:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80195a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80195e:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801961:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801964:	48 63 c8             	movslq %eax,%rcx
  801967:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80196b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80196e:	48 98                	cltq   
  801970:	48 83 ec 08          	sub    $0x8,%rsp
  801974:	6a 00                	pushq  $0x0
  801976:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80197c:	49 89 c8             	mov    %rcx,%r8
  80197f:	48 89 d1             	mov    %rdx,%rcx
  801982:	48 89 c2             	mov    %rax,%rdx
  801985:	be 01 00 00 00       	mov    $0x1,%esi
  80198a:	bf 04 00 00 00       	mov    $0x4,%edi
  80198f:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  801996:	00 00 00 
  801999:	ff d0                	callq  *%rax
  80199b:	48 83 c4 10          	add    $0x10,%rsp
  80199f:	c9                   	leaveq 
  8019a0:	c3                   	retq   

00000000008019a1 <sys_page_map>:
  8019a1:	55                   	push   %rbp
  8019a2:	48 89 e5             	mov    %rsp,%rbp
  8019a5:	48 83 ec 20          	sub    $0x20,%rsp
  8019a9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019ac:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019b0:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8019b3:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8019b7:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8019bb:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8019be:	48 63 c8             	movslq %eax,%rcx
  8019c1:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8019c5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8019c8:	48 63 f0             	movslq %eax,%rsi
  8019cb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019d2:	48 98                	cltq   
  8019d4:	48 83 ec 08          	sub    $0x8,%rsp
  8019d8:	51                   	push   %rcx
  8019d9:	49 89 f9             	mov    %rdi,%r9
  8019dc:	49 89 f0             	mov    %rsi,%r8
  8019df:	48 89 d1             	mov    %rdx,%rcx
  8019e2:	48 89 c2             	mov    %rax,%rdx
  8019e5:	be 01 00 00 00       	mov    $0x1,%esi
  8019ea:	bf 05 00 00 00       	mov    $0x5,%edi
  8019ef:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  8019f6:	00 00 00 
  8019f9:	ff d0                	callq  *%rax
  8019fb:	48 83 c4 10          	add    $0x10,%rsp
  8019ff:	c9                   	leaveq 
  801a00:	c3                   	retq   

0000000000801a01 <sys_page_unmap>:
  801a01:	55                   	push   %rbp
  801a02:	48 89 e5             	mov    %rsp,%rbp
  801a05:	48 83 ec 10          	sub    $0x10,%rsp
  801a09:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a0c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a10:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a14:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a17:	48 98                	cltq   
  801a19:	48 83 ec 08          	sub    $0x8,%rsp
  801a1d:	6a 00                	pushq  $0x0
  801a1f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a25:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a2b:	48 89 d1             	mov    %rdx,%rcx
  801a2e:	48 89 c2             	mov    %rax,%rdx
  801a31:	be 01 00 00 00       	mov    $0x1,%esi
  801a36:	bf 06 00 00 00       	mov    $0x6,%edi
  801a3b:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  801a42:	00 00 00 
  801a45:	ff d0                	callq  *%rax
  801a47:	48 83 c4 10          	add    $0x10,%rsp
  801a4b:	c9                   	leaveq 
  801a4c:	c3                   	retq   

0000000000801a4d <sys_env_set_status>:
  801a4d:	55                   	push   %rbp
  801a4e:	48 89 e5             	mov    %rsp,%rbp
  801a51:	48 83 ec 10          	sub    $0x10,%rsp
  801a55:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a58:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801a5b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a5e:	48 63 d0             	movslq %eax,%rdx
  801a61:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a64:	48 98                	cltq   
  801a66:	48 83 ec 08          	sub    $0x8,%rsp
  801a6a:	6a 00                	pushq  $0x0
  801a6c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a72:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a78:	48 89 d1             	mov    %rdx,%rcx
  801a7b:	48 89 c2             	mov    %rax,%rdx
  801a7e:	be 01 00 00 00       	mov    $0x1,%esi
  801a83:	bf 08 00 00 00       	mov    $0x8,%edi
  801a88:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  801a8f:	00 00 00 
  801a92:	ff d0                	callq  *%rax
  801a94:	48 83 c4 10          	add    $0x10,%rsp
  801a98:	c9                   	leaveq 
  801a99:	c3                   	retq   

0000000000801a9a <sys_env_set_trapframe>:
  801a9a:	55                   	push   %rbp
  801a9b:	48 89 e5             	mov    %rsp,%rbp
  801a9e:	48 83 ec 10          	sub    $0x10,%rsp
  801aa2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801aa5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801aa9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801aad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ab0:	48 98                	cltq   
  801ab2:	48 83 ec 08          	sub    $0x8,%rsp
  801ab6:	6a 00                	pushq  $0x0
  801ab8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801abe:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ac4:	48 89 d1             	mov    %rdx,%rcx
  801ac7:	48 89 c2             	mov    %rax,%rdx
  801aca:	be 01 00 00 00       	mov    $0x1,%esi
  801acf:	bf 09 00 00 00       	mov    $0x9,%edi
  801ad4:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  801adb:	00 00 00 
  801ade:	ff d0                	callq  *%rax
  801ae0:	48 83 c4 10          	add    $0x10,%rsp
  801ae4:	c9                   	leaveq 
  801ae5:	c3                   	retq   

0000000000801ae6 <sys_env_set_pgfault_upcall>:
  801ae6:	55                   	push   %rbp
  801ae7:	48 89 e5             	mov    %rsp,%rbp
  801aea:	48 83 ec 10          	sub    $0x10,%rsp
  801aee:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801af1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801af5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801af9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801afc:	48 98                	cltq   
  801afe:	48 83 ec 08          	sub    $0x8,%rsp
  801b02:	6a 00                	pushq  $0x0
  801b04:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b0a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b10:	48 89 d1             	mov    %rdx,%rcx
  801b13:	48 89 c2             	mov    %rax,%rdx
  801b16:	be 01 00 00 00       	mov    $0x1,%esi
  801b1b:	bf 0a 00 00 00       	mov    $0xa,%edi
  801b20:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  801b27:	00 00 00 
  801b2a:	ff d0                	callq  *%rax
  801b2c:	48 83 c4 10          	add    $0x10,%rsp
  801b30:	c9                   	leaveq 
  801b31:	c3                   	retq   

0000000000801b32 <sys_ipc_try_send>:
  801b32:	55                   	push   %rbp
  801b33:	48 89 e5             	mov    %rsp,%rbp
  801b36:	48 83 ec 20          	sub    $0x20,%rsp
  801b3a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b3d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b41:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b45:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801b48:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b4b:	48 63 f0             	movslq %eax,%rsi
  801b4e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801b52:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b55:	48 98                	cltq   
  801b57:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b5b:	48 83 ec 08          	sub    $0x8,%rsp
  801b5f:	6a 00                	pushq  $0x0
  801b61:	49 89 f1             	mov    %rsi,%r9
  801b64:	49 89 c8             	mov    %rcx,%r8
  801b67:	48 89 d1             	mov    %rdx,%rcx
  801b6a:	48 89 c2             	mov    %rax,%rdx
  801b6d:	be 00 00 00 00       	mov    $0x0,%esi
  801b72:	bf 0c 00 00 00       	mov    $0xc,%edi
  801b77:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  801b7e:	00 00 00 
  801b81:	ff d0                	callq  *%rax
  801b83:	48 83 c4 10          	add    $0x10,%rsp
  801b87:	c9                   	leaveq 
  801b88:	c3                   	retq   

0000000000801b89 <sys_ipc_recv>:
  801b89:	55                   	push   %rbp
  801b8a:	48 89 e5             	mov    %rsp,%rbp
  801b8d:	48 83 ec 10          	sub    $0x10,%rsp
  801b91:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b95:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b99:	48 83 ec 08          	sub    $0x8,%rsp
  801b9d:	6a 00                	pushq  $0x0
  801b9f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ba5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bab:	b9 00 00 00 00       	mov    $0x0,%ecx
  801bb0:	48 89 c2             	mov    %rax,%rdx
  801bb3:	be 01 00 00 00       	mov    $0x1,%esi
  801bb8:	bf 0d 00 00 00       	mov    $0xd,%edi
  801bbd:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  801bc4:	00 00 00 
  801bc7:	ff d0                	callq  *%rax
  801bc9:	48 83 c4 10          	add    $0x10,%rsp
  801bcd:	c9                   	leaveq 
  801bce:	c3                   	retq   

0000000000801bcf <sys_time_msec>:
  801bcf:	55                   	push   %rbp
  801bd0:	48 89 e5             	mov    %rsp,%rbp
  801bd3:	48 83 ec 08          	sub    $0x8,%rsp
  801bd7:	6a 00                	pushq  $0x0
  801bd9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bdf:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801be5:	b9 00 00 00 00       	mov    $0x0,%ecx
  801bea:	ba 00 00 00 00       	mov    $0x0,%edx
  801bef:	be 00 00 00 00       	mov    $0x0,%esi
  801bf4:	bf 0e 00 00 00       	mov    $0xe,%edi
  801bf9:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  801c00:	00 00 00 
  801c03:	ff d0                	callq  *%rax
  801c05:	48 83 c4 10          	add    $0x10,%rsp
  801c09:	c9                   	leaveq 
  801c0a:	c3                   	retq   

0000000000801c0b <sys_net_transmit>:
  801c0b:	55                   	push   %rbp
  801c0c:	48 89 e5             	mov    %rsp,%rbp
  801c0f:	48 83 ec 10          	sub    $0x10,%rsp
  801c13:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c17:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c1a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c1d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c21:	48 83 ec 08          	sub    $0x8,%rsp
  801c25:	6a 00                	pushq  $0x0
  801c27:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c2d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c33:	48 89 d1             	mov    %rdx,%rcx
  801c36:	48 89 c2             	mov    %rax,%rdx
  801c39:	be 00 00 00 00       	mov    $0x0,%esi
  801c3e:	bf 0f 00 00 00       	mov    $0xf,%edi
  801c43:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  801c4a:	00 00 00 
  801c4d:	ff d0                	callq  *%rax
  801c4f:	48 83 c4 10          	add    $0x10,%rsp
  801c53:	c9                   	leaveq 
  801c54:	c3                   	retq   

0000000000801c55 <sys_net_receive>:
  801c55:	55                   	push   %rbp
  801c56:	48 89 e5             	mov    %rsp,%rbp
  801c59:	48 83 ec 10          	sub    $0x10,%rsp
  801c5d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c61:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c64:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c67:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c6b:	48 83 ec 08          	sub    $0x8,%rsp
  801c6f:	6a 00                	pushq  $0x0
  801c71:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c77:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c7d:	48 89 d1             	mov    %rdx,%rcx
  801c80:	48 89 c2             	mov    %rax,%rdx
  801c83:	be 00 00 00 00       	mov    $0x0,%esi
  801c88:	bf 10 00 00 00       	mov    $0x10,%edi
  801c8d:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  801c94:	00 00 00 
  801c97:	ff d0                	callq  *%rax
  801c99:	48 83 c4 10          	add    $0x10,%rsp
  801c9d:	c9                   	leaveq 
  801c9e:	c3                   	retq   

0000000000801c9f <sys_ept_map>:
  801c9f:	55                   	push   %rbp
  801ca0:	48 89 e5             	mov    %rsp,%rbp
  801ca3:	48 83 ec 20          	sub    $0x20,%rsp
  801ca7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801caa:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801cae:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801cb1:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801cb5:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801cb9:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801cbc:	48 63 c8             	movslq %eax,%rcx
  801cbf:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801cc3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801cc6:	48 63 f0             	movslq %eax,%rsi
  801cc9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ccd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cd0:	48 98                	cltq   
  801cd2:	48 83 ec 08          	sub    $0x8,%rsp
  801cd6:	51                   	push   %rcx
  801cd7:	49 89 f9             	mov    %rdi,%r9
  801cda:	49 89 f0             	mov    %rsi,%r8
  801cdd:	48 89 d1             	mov    %rdx,%rcx
  801ce0:	48 89 c2             	mov    %rax,%rdx
  801ce3:	be 00 00 00 00       	mov    $0x0,%esi
  801ce8:	bf 11 00 00 00       	mov    $0x11,%edi
  801ced:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  801cf4:	00 00 00 
  801cf7:	ff d0                	callq  *%rax
  801cf9:	48 83 c4 10          	add    $0x10,%rsp
  801cfd:	c9                   	leaveq 
  801cfe:	c3                   	retq   

0000000000801cff <sys_env_mkguest>:
  801cff:	55                   	push   %rbp
  801d00:	48 89 e5             	mov    %rsp,%rbp
  801d03:	48 83 ec 10          	sub    $0x10,%rsp
  801d07:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d0b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d0f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d13:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d17:	48 83 ec 08          	sub    $0x8,%rsp
  801d1b:	6a 00                	pushq  $0x0
  801d1d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d23:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d29:	48 89 d1             	mov    %rdx,%rcx
  801d2c:	48 89 c2             	mov    %rax,%rdx
  801d2f:	be 00 00 00 00       	mov    $0x0,%esi
  801d34:	bf 12 00 00 00       	mov    $0x12,%edi
  801d39:	48 b8 79 17 80 00 00 	movabs $0x801779,%rax
  801d40:	00 00 00 
  801d43:	ff d0                	callq  *%rax
  801d45:	48 83 c4 10          	add    $0x10,%rsp
  801d49:	c9                   	leaveq 
  801d4a:	c3                   	retq   

0000000000801d4b <fd2num>:
  801d4b:	55                   	push   %rbp
  801d4c:	48 89 e5             	mov    %rsp,%rbp
  801d4f:	48 83 ec 08          	sub    $0x8,%rsp
  801d53:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d57:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801d5b:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801d62:	ff ff ff 
  801d65:	48 01 d0             	add    %rdx,%rax
  801d68:	48 c1 e8 0c          	shr    $0xc,%rax
  801d6c:	c9                   	leaveq 
  801d6d:	c3                   	retq   

0000000000801d6e <fd2data>:
  801d6e:	55                   	push   %rbp
  801d6f:	48 89 e5             	mov    %rsp,%rbp
  801d72:	48 83 ec 08          	sub    $0x8,%rsp
  801d76:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d7a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d7e:	48 89 c7             	mov    %rax,%rdi
  801d81:	48 b8 4b 1d 80 00 00 	movabs $0x801d4b,%rax
  801d88:	00 00 00 
  801d8b:	ff d0                	callq  *%rax
  801d8d:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801d93:	48 c1 e0 0c          	shl    $0xc,%rax
  801d97:	c9                   	leaveq 
  801d98:	c3                   	retq   

0000000000801d99 <fd_alloc>:
  801d99:	55                   	push   %rbp
  801d9a:	48 89 e5             	mov    %rsp,%rbp
  801d9d:	48 83 ec 18          	sub    $0x18,%rsp
  801da1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801da5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801dac:	eb 6b                	jmp    801e19 <fd_alloc+0x80>
  801dae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801db1:	48 98                	cltq   
  801db3:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801db9:	48 c1 e0 0c          	shl    $0xc,%rax
  801dbd:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801dc1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801dc5:	48 c1 e8 15          	shr    $0x15,%rax
  801dc9:	48 89 c2             	mov    %rax,%rdx
  801dcc:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801dd3:	01 00 00 
  801dd6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801dda:	83 e0 01             	and    $0x1,%eax
  801ddd:	48 85 c0             	test   %rax,%rax
  801de0:	74 21                	je     801e03 <fd_alloc+0x6a>
  801de2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801de6:	48 c1 e8 0c          	shr    $0xc,%rax
  801dea:	48 89 c2             	mov    %rax,%rdx
  801ded:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801df4:	01 00 00 
  801df7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801dfb:	83 e0 01             	and    $0x1,%eax
  801dfe:	48 85 c0             	test   %rax,%rax
  801e01:	75 12                	jne    801e15 <fd_alloc+0x7c>
  801e03:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e07:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e0b:	48 89 10             	mov    %rdx,(%rax)
  801e0e:	b8 00 00 00 00       	mov    $0x0,%eax
  801e13:	eb 1a                	jmp    801e2f <fd_alloc+0x96>
  801e15:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801e19:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801e1d:	7e 8f                	jle    801dae <fd_alloc+0x15>
  801e1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e23:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801e2a:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801e2f:	c9                   	leaveq 
  801e30:	c3                   	retq   

0000000000801e31 <fd_lookup>:
  801e31:	55                   	push   %rbp
  801e32:	48 89 e5             	mov    %rsp,%rbp
  801e35:	48 83 ec 20          	sub    $0x20,%rsp
  801e39:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801e3c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801e40:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801e44:	78 06                	js     801e4c <fd_lookup+0x1b>
  801e46:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801e4a:	7e 07                	jle    801e53 <fd_lookup+0x22>
  801e4c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801e51:	eb 6c                	jmp    801ebf <fd_lookup+0x8e>
  801e53:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801e56:	48 98                	cltq   
  801e58:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801e5e:	48 c1 e0 0c          	shl    $0xc,%rax
  801e62:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801e66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e6a:	48 c1 e8 15          	shr    $0x15,%rax
  801e6e:	48 89 c2             	mov    %rax,%rdx
  801e71:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801e78:	01 00 00 
  801e7b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801e7f:	83 e0 01             	and    $0x1,%eax
  801e82:	48 85 c0             	test   %rax,%rax
  801e85:	74 21                	je     801ea8 <fd_lookup+0x77>
  801e87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e8b:	48 c1 e8 0c          	shr    $0xc,%rax
  801e8f:	48 89 c2             	mov    %rax,%rdx
  801e92:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801e99:	01 00 00 
  801e9c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801ea0:	83 e0 01             	and    $0x1,%eax
  801ea3:	48 85 c0             	test   %rax,%rax
  801ea6:	75 07                	jne    801eaf <fd_lookup+0x7e>
  801ea8:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801ead:	eb 10                	jmp    801ebf <fd_lookup+0x8e>
  801eaf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801eb3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801eb7:	48 89 10             	mov    %rdx,(%rax)
  801eba:	b8 00 00 00 00       	mov    $0x0,%eax
  801ebf:	c9                   	leaveq 
  801ec0:	c3                   	retq   

0000000000801ec1 <fd_close>:
  801ec1:	55                   	push   %rbp
  801ec2:	48 89 e5             	mov    %rsp,%rbp
  801ec5:	48 83 ec 30          	sub    $0x30,%rsp
  801ec9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801ecd:	89 f0                	mov    %esi,%eax
  801ecf:	88 45 d4             	mov    %al,-0x2c(%rbp)
  801ed2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ed6:	48 89 c7             	mov    %rax,%rdi
  801ed9:	48 b8 4b 1d 80 00 00 	movabs $0x801d4b,%rax
  801ee0:	00 00 00 
  801ee3:	ff d0                	callq  *%rax
  801ee5:	89 c2                	mov    %eax,%edx
  801ee7:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  801eeb:	48 89 c6             	mov    %rax,%rsi
  801eee:	89 d7                	mov    %edx,%edi
  801ef0:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  801ef7:	00 00 00 
  801efa:	ff d0                	callq  *%rax
  801efc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801eff:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801f03:	78 0a                	js     801f0f <fd_close+0x4e>
  801f05:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f09:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  801f0d:	74 12                	je     801f21 <fd_close+0x60>
  801f0f:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  801f13:	74 05                	je     801f1a <fd_close+0x59>
  801f15:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f18:	eb 70                	jmp    801f8a <fd_close+0xc9>
  801f1a:	b8 00 00 00 00       	mov    $0x0,%eax
  801f1f:	eb 69                	jmp    801f8a <fd_close+0xc9>
  801f21:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f25:	8b 00                	mov    (%rax),%eax
  801f27:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  801f2b:	48 89 d6             	mov    %rdx,%rsi
  801f2e:	89 c7                	mov    %eax,%edi
  801f30:	48 b8 8c 1f 80 00 00 	movabs $0x801f8c,%rax
  801f37:	00 00 00 
  801f3a:	ff d0                	callq  *%rax
  801f3c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801f3f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801f43:	78 2a                	js     801f6f <fd_close+0xae>
  801f45:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f49:	48 8b 40 20          	mov    0x20(%rax),%rax
  801f4d:	48 85 c0             	test   %rax,%rax
  801f50:	74 16                	je     801f68 <fd_close+0xa7>
  801f52:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f56:	48 8b 40 20          	mov    0x20(%rax),%rax
  801f5a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801f5e:	48 89 d7             	mov    %rdx,%rdi
  801f61:	ff d0                	callq  *%rax
  801f63:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801f66:	eb 07                	jmp    801f6f <fd_close+0xae>
  801f68:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801f6f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f73:	48 89 c6             	mov    %rax,%rsi
  801f76:	bf 00 00 00 00       	mov    $0x0,%edi
  801f7b:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  801f82:	00 00 00 
  801f85:	ff d0                	callq  *%rax
  801f87:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f8a:	c9                   	leaveq 
  801f8b:	c3                   	retq   

0000000000801f8c <dev_lookup>:
  801f8c:	55                   	push   %rbp
  801f8d:	48 89 e5             	mov    %rsp,%rbp
  801f90:	48 83 ec 20          	sub    $0x20,%rsp
  801f94:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801f97:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801f9b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801fa2:	eb 41                	jmp    801fe5 <dev_lookup+0x59>
  801fa4:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  801fab:	00 00 00 
  801fae:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801fb1:	48 63 d2             	movslq %edx,%rdx
  801fb4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fb8:	8b 00                	mov    (%rax),%eax
  801fba:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  801fbd:	75 22                	jne    801fe1 <dev_lookup+0x55>
  801fbf:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  801fc6:	00 00 00 
  801fc9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801fcc:	48 63 d2             	movslq %edx,%rdx
  801fcf:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  801fd3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801fd7:	48 89 10             	mov    %rdx,(%rax)
  801fda:	b8 00 00 00 00       	mov    $0x0,%eax
  801fdf:	eb 60                	jmp    802041 <dev_lookup+0xb5>
  801fe1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801fe5:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  801fec:	00 00 00 
  801fef:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801ff2:	48 63 d2             	movslq %edx,%rdx
  801ff5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801ff9:	48 85 c0             	test   %rax,%rax
  801ffc:	75 a6                	jne    801fa4 <dev_lookup+0x18>
  801ffe:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802005:	00 00 00 
  802008:	48 8b 00             	mov    (%rax),%rax
  80200b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802011:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802014:	89 c6                	mov    %eax,%esi
  802016:	48 bf 58 46 80 00 00 	movabs $0x804658,%rdi
  80201d:	00 00 00 
  802020:	b8 00 00 00 00       	mov    $0x0,%eax
  802025:	48 b9 8f 04 80 00 00 	movabs $0x80048f,%rcx
  80202c:	00 00 00 
  80202f:	ff d1                	callq  *%rcx
  802031:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802035:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80203c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802041:	c9                   	leaveq 
  802042:	c3                   	retq   

0000000000802043 <close>:
  802043:	55                   	push   %rbp
  802044:	48 89 e5             	mov    %rsp,%rbp
  802047:	48 83 ec 20          	sub    $0x20,%rsp
  80204b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80204e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802052:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802055:	48 89 d6             	mov    %rdx,%rsi
  802058:	89 c7                	mov    %eax,%edi
  80205a:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  802061:	00 00 00 
  802064:	ff d0                	callq  *%rax
  802066:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802069:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80206d:	79 05                	jns    802074 <close+0x31>
  80206f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802072:	eb 18                	jmp    80208c <close+0x49>
  802074:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802078:	be 01 00 00 00       	mov    $0x1,%esi
  80207d:	48 89 c7             	mov    %rax,%rdi
  802080:	48 b8 c1 1e 80 00 00 	movabs $0x801ec1,%rax
  802087:	00 00 00 
  80208a:	ff d0                	callq  *%rax
  80208c:	c9                   	leaveq 
  80208d:	c3                   	retq   

000000000080208e <close_all>:
  80208e:	55                   	push   %rbp
  80208f:	48 89 e5             	mov    %rsp,%rbp
  802092:	48 83 ec 10          	sub    $0x10,%rsp
  802096:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80209d:	eb 15                	jmp    8020b4 <close_all+0x26>
  80209f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020a2:	89 c7                	mov    %eax,%edi
  8020a4:	48 b8 43 20 80 00 00 	movabs $0x802043,%rax
  8020ab:	00 00 00 
  8020ae:	ff d0                	callq  *%rax
  8020b0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8020b4:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8020b8:	7e e5                	jle    80209f <close_all+0x11>
  8020ba:	90                   	nop
  8020bb:	c9                   	leaveq 
  8020bc:	c3                   	retq   

00000000008020bd <dup>:
  8020bd:	55                   	push   %rbp
  8020be:	48 89 e5             	mov    %rsp,%rbp
  8020c1:	48 83 ec 40          	sub    $0x40,%rsp
  8020c5:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8020c8:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8020cb:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8020cf:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8020d2:	48 89 d6             	mov    %rdx,%rsi
  8020d5:	89 c7                	mov    %eax,%edi
  8020d7:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  8020de:	00 00 00 
  8020e1:	ff d0                	callq  *%rax
  8020e3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020e6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8020ea:	79 08                	jns    8020f4 <dup+0x37>
  8020ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020ef:	e9 70 01 00 00       	jmpq   802264 <dup+0x1a7>
  8020f4:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8020f7:	89 c7                	mov    %eax,%edi
  8020f9:	48 b8 43 20 80 00 00 	movabs $0x802043,%rax
  802100:	00 00 00 
  802103:	ff d0                	callq  *%rax
  802105:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802108:	48 98                	cltq   
  80210a:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802110:	48 c1 e0 0c          	shl    $0xc,%rax
  802114:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802118:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80211c:	48 89 c7             	mov    %rax,%rdi
  80211f:	48 b8 6e 1d 80 00 00 	movabs $0x801d6e,%rax
  802126:	00 00 00 
  802129:	ff d0                	callq  *%rax
  80212b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80212f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802133:	48 89 c7             	mov    %rax,%rdi
  802136:	48 b8 6e 1d 80 00 00 	movabs $0x801d6e,%rax
  80213d:	00 00 00 
  802140:	ff d0                	callq  *%rax
  802142:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802146:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80214a:	48 c1 e8 15          	shr    $0x15,%rax
  80214e:	48 89 c2             	mov    %rax,%rdx
  802151:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802158:	01 00 00 
  80215b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80215f:	83 e0 01             	and    $0x1,%eax
  802162:	48 85 c0             	test   %rax,%rax
  802165:	74 71                	je     8021d8 <dup+0x11b>
  802167:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80216b:	48 c1 e8 0c          	shr    $0xc,%rax
  80216f:	48 89 c2             	mov    %rax,%rdx
  802172:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802179:	01 00 00 
  80217c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802180:	83 e0 01             	and    $0x1,%eax
  802183:	48 85 c0             	test   %rax,%rax
  802186:	74 50                	je     8021d8 <dup+0x11b>
  802188:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80218c:	48 c1 e8 0c          	shr    $0xc,%rax
  802190:	48 89 c2             	mov    %rax,%rdx
  802193:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80219a:	01 00 00 
  80219d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021a1:	25 07 0e 00 00       	and    $0xe07,%eax
  8021a6:	89 c1                	mov    %eax,%ecx
  8021a8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8021ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021b0:	41 89 c8             	mov    %ecx,%r8d
  8021b3:	48 89 d1             	mov    %rdx,%rcx
  8021b6:	ba 00 00 00 00       	mov    $0x0,%edx
  8021bb:	48 89 c6             	mov    %rax,%rsi
  8021be:	bf 00 00 00 00       	mov    $0x0,%edi
  8021c3:	48 b8 a1 19 80 00 00 	movabs $0x8019a1,%rax
  8021ca:	00 00 00 
  8021cd:	ff d0                	callq  *%rax
  8021cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8021d2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021d6:	78 55                	js     80222d <dup+0x170>
  8021d8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8021dc:	48 c1 e8 0c          	shr    $0xc,%rax
  8021e0:	48 89 c2             	mov    %rax,%rdx
  8021e3:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8021ea:	01 00 00 
  8021ed:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021f1:	25 07 0e 00 00       	and    $0xe07,%eax
  8021f6:	89 c1                	mov    %eax,%ecx
  8021f8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8021fc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802200:	41 89 c8             	mov    %ecx,%r8d
  802203:	48 89 d1             	mov    %rdx,%rcx
  802206:	ba 00 00 00 00       	mov    $0x0,%edx
  80220b:	48 89 c6             	mov    %rax,%rsi
  80220e:	bf 00 00 00 00       	mov    $0x0,%edi
  802213:	48 b8 a1 19 80 00 00 	movabs $0x8019a1,%rax
  80221a:	00 00 00 
  80221d:	ff d0                	callq  *%rax
  80221f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802222:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802226:	78 08                	js     802230 <dup+0x173>
  802228:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80222b:	eb 37                	jmp    802264 <dup+0x1a7>
  80222d:	90                   	nop
  80222e:	eb 01                	jmp    802231 <dup+0x174>
  802230:	90                   	nop
  802231:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802235:	48 89 c6             	mov    %rax,%rsi
  802238:	bf 00 00 00 00       	mov    $0x0,%edi
  80223d:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  802244:	00 00 00 
  802247:	ff d0                	callq  *%rax
  802249:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80224d:	48 89 c6             	mov    %rax,%rsi
  802250:	bf 00 00 00 00       	mov    $0x0,%edi
  802255:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  80225c:	00 00 00 
  80225f:	ff d0                	callq  *%rax
  802261:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802264:	c9                   	leaveq 
  802265:	c3                   	retq   

0000000000802266 <read>:
  802266:	55                   	push   %rbp
  802267:	48 89 e5             	mov    %rsp,%rbp
  80226a:	48 83 ec 40          	sub    $0x40,%rsp
  80226e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802271:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802275:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802279:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80227d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802280:	48 89 d6             	mov    %rdx,%rsi
  802283:	89 c7                	mov    %eax,%edi
  802285:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  80228c:	00 00 00 
  80228f:	ff d0                	callq  *%rax
  802291:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802294:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802298:	78 24                	js     8022be <read+0x58>
  80229a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80229e:	8b 00                	mov    (%rax),%eax
  8022a0:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8022a4:	48 89 d6             	mov    %rdx,%rsi
  8022a7:	89 c7                	mov    %eax,%edi
  8022a9:	48 b8 8c 1f 80 00 00 	movabs $0x801f8c,%rax
  8022b0:	00 00 00 
  8022b3:	ff d0                	callq  *%rax
  8022b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022b8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022bc:	79 05                	jns    8022c3 <read+0x5d>
  8022be:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022c1:	eb 76                	jmp    802339 <read+0xd3>
  8022c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022c7:	8b 40 08             	mov    0x8(%rax),%eax
  8022ca:	83 e0 03             	and    $0x3,%eax
  8022cd:	83 f8 01             	cmp    $0x1,%eax
  8022d0:	75 3a                	jne    80230c <read+0xa6>
  8022d2:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8022d9:	00 00 00 
  8022dc:	48 8b 00             	mov    (%rax),%rax
  8022df:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8022e5:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8022e8:	89 c6                	mov    %eax,%esi
  8022ea:	48 bf 77 46 80 00 00 	movabs $0x804677,%rdi
  8022f1:	00 00 00 
  8022f4:	b8 00 00 00 00       	mov    $0x0,%eax
  8022f9:	48 b9 8f 04 80 00 00 	movabs $0x80048f,%rcx
  802300:	00 00 00 
  802303:	ff d1                	callq  *%rcx
  802305:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80230a:	eb 2d                	jmp    802339 <read+0xd3>
  80230c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802310:	48 8b 40 10          	mov    0x10(%rax),%rax
  802314:	48 85 c0             	test   %rax,%rax
  802317:	75 07                	jne    802320 <read+0xba>
  802319:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80231e:	eb 19                	jmp    802339 <read+0xd3>
  802320:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802324:	48 8b 40 10          	mov    0x10(%rax),%rax
  802328:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80232c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802330:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802334:	48 89 cf             	mov    %rcx,%rdi
  802337:	ff d0                	callq  *%rax
  802339:	c9                   	leaveq 
  80233a:	c3                   	retq   

000000000080233b <readn>:
  80233b:	55                   	push   %rbp
  80233c:	48 89 e5             	mov    %rsp,%rbp
  80233f:	48 83 ec 30          	sub    $0x30,%rsp
  802343:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802346:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80234a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80234e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802355:	eb 47                	jmp    80239e <readn+0x63>
  802357:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80235a:	48 98                	cltq   
  80235c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802360:	48 29 c2             	sub    %rax,%rdx
  802363:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802366:	48 63 c8             	movslq %eax,%rcx
  802369:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80236d:	48 01 c1             	add    %rax,%rcx
  802370:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802373:	48 89 ce             	mov    %rcx,%rsi
  802376:	89 c7                	mov    %eax,%edi
  802378:	48 b8 66 22 80 00 00 	movabs $0x802266,%rax
  80237f:	00 00 00 
  802382:	ff d0                	callq  *%rax
  802384:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802387:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80238b:	79 05                	jns    802392 <readn+0x57>
  80238d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802390:	eb 1d                	jmp    8023af <readn+0x74>
  802392:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802396:	74 13                	je     8023ab <readn+0x70>
  802398:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80239b:	01 45 fc             	add    %eax,-0x4(%rbp)
  80239e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023a1:	48 98                	cltq   
  8023a3:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8023a7:	72 ae                	jb     802357 <readn+0x1c>
  8023a9:	eb 01                	jmp    8023ac <readn+0x71>
  8023ab:	90                   	nop
  8023ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023af:	c9                   	leaveq 
  8023b0:	c3                   	retq   

00000000008023b1 <write>:
  8023b1:	55                   	push   %rbp
  8023b2:	48 89 e5             	mov    %rsp,%rbp
  8023b5:	48 83 ec 40          	sub    $0x40,%rsp
  8023b9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8023bc:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8023c0:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8023c4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8023c8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8023cb:	48 89 d6             	mov    %rdx,%rsi
  8023ce:	89 c7                	mov    %eax,%edi
  8023d0:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  8023d7:	00 00 00 
  8023da:	ff d0                	callq  *%rax
  8023dc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023df:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023e3:	78 24                	js     802409 <write+0x58>
  8023e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023e9:	8b 00                	mov    (%rax),%eax
  8023eb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8023ef:	48 89 d6             	mov    %rdx,%rsi
  8023f2:	89 c7                	mov    %eax,%edi
  8023f4:	48 b8 8c 1f 80 00 00 	movabs $0x801f8c,%rax
  8023fb:	00 00 00 
  8023fe:	ff d0                	callq  *%rax
  802400:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802403:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802407:	79 05                	jns    80240e <write+0x5d>
  802409:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80240c:	eb 75                	jmp    802483 <write+0xd2>
  80240e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802412:	8b 40 08             	mov    0x8(%rax),%eax
  802415:	83 e0 03             	and    $0x3,%eax
  802418:	85 c0                	test   %eax,%eax
  80241a:	75 3a                	jne    802456 <write+0xa5>
  80241c:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802423:	00 00 00 
  802426:	48 8b 00             	mov    (%rax),%rax
  802429:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80242f:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802432:	89 c6                	mov    %eax,%esi
  802434:	48 bf 93 46 80 00 00 	movabs $0x804693,%rdi
  80243b:	00 00 00 
  80243e:	b8 00 00 00 00       	mov    $0x0,%eax
  802443:	48 b9 8f 04 80 00 00 	movabs $0x80048f,%rcx
  80244a:	00 00 00 
  80244d:	ff d1                	callq  *%rcx
  80244f:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802454:	eb 2d                	jmp    802483 <write+0xd2>
  802456:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80245a:	48 8b 40 18          	mov    0x18(%rax),%rax
  80245e:	48 85 c0             	test   %rax,%rax
  802461:	75 07                	jne    80246a <write+0xb9>
  802463:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802468:	eb 19                	jmp    802483 <write+0xd2>
  80246a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80246e:	48 8b 40 18          	mov    0x18(%rax),%rax
  802472:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802476:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80247a:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80247e:	48 89 cf             	mov    %rcx,%rdi
  802481:	ff d0                	callq  *%rax
  802483:	c9                   	leaveq 
  802484:	c3                   	retq   

0000000000802485 <seek>:
  802485:	55                   	push   %rbp
  802486:	48 89 e5             	mov    %rsp,%rbp
  802489:	48 83 ec 18          	sub    $0x18,%rsp
  80248d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802490:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802493:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802497:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80249a:	48 89 d6             	mov    %rdx,%rsi
  80249d:	89 c7                	mov    %eax,%edi
  80249f:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  8024a6:	00 00 00 
  8024a9:	ff d0                	callq  *%rax
  8024ab:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024ae:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024b2:	79 05                	jns    8024b9 <seek+0x34>
  8024b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024b7:	eb 0f                	jmp    8024c8 <seek+0x43>
  8024b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024bd:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8024c0:	89 50 04             	mov    %edx,0x4(%rax)
  8024c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8024c8:	c9                   	leaveq 
  8024c9:	c3                   	retq   

00000000008024ca <ftruncate>:
  8024ca:	55                   	push   %rbp
  8024cb:	48 89 e5             	mov    %rsp,%rbp
  8024ce:	48 83 ec 30          	sub    $0x30,%rsp
  8024d2:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8024d5:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8024d8:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8024dc:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8024df:	48 89 d6             	mov    %rdx,%rsi
  8024e2:	89 c7                	mov    %eax,%edi
  8024e4:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  8024eb:	00 00 00 
  8024ee:	ff d0                	callq  *%rax
  8024f0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024f3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024f7:	78 24                	js     80251d <ftruncate+0x53>
  8024f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8024fd:	8b 00                	mov    (%rax),%eax
  8024ff:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802503:	48 89 d6             	mov    %rdx,%rsi
  802506:	89 c7                	mov    %eax,%edi
  802508:	48 b8 8c 1f 80 00 00 	movabs $0x801f8c,%rax
  80250f:	00 00 00 
  802512:	ff d0                	callq  *%rax
  802514:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802517:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80251b:	79 05                	jns    802522 <ftruncate+0x58>
  80251d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802520:	eb 72                	jmp    802594 <ftruncate+0xca>
  802522:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802526:	8b 40 08             	mov    0x8(%rax),%eax
  802529:	83 e0 03             	and    $0x3,%eax
  80252c:	85 c0                	test   %eax,%eax
  80252e:	75 3a                	jne    80256a <ftruncate+0xa0>
  802530:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802537:	00 00 00 
  80253a:	48 8b 00             	mov    (%rax),%rax
  80253d:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802543:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802546:	89 c6                	mov    %eax,%esi
  802548:	48 bf b0 46 80 00 00 	movabs $0x8046b0,%rdi
  80254f:	00 00 00 
  802552:	b8 00 00 00 00       	mov    $0x0,%eax
  802557:	48 b9 8f 04 80 00 00 	movabs $0x80048f,%rcx
  80255e:	00 00 00 
  802561:	ff d1                	callq  *%rcx
  802563:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802568:	eb 2a                	jmp    802594 <ftruncate+0xca>
  80256a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80256e:	48 8b 40 30          	mov    0x30(%rax),%rax
  802572:	48 85 c0             	test   %rax,%rax
  802575:	75 07                	jne    80257e <ftruncate+0xb4>
  802577:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80257c:	eb 16                	jmp    802594 <ftruncate+0xca>
  80257e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802582:	48 8b 40 30          	mov    0x30(%rax),%rax
  802586:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80258a:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  80258d:	89 ce                	mov    %ecx,%esi
  80258f:	48 89 d7             	mov    %rdx,%rdi
  802592:	ff d0                	callq  *%rax
  802594:	c9                   	leaveq 
  802595:	c3                   	retq   

0000000000802596 <fstat>:
  802596:	55                   	push   %rbp
  802597:	48 89 e5             	mov    %rsp,%rbp
  80259a:	48 83 ec 30          	sub    $0x30,%rsp
  80259e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8025a1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8025a5:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8025a9:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8025ac:	48 89 d6             	mov    %rdx,%rsi
  8025af:	89 c7                	mov    %eax,%edi
  8025b1:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  8025b8:	00 00 00 
  8025bb:	ff d0                	callq  *%rax
  8025bd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025c0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025c4:	78 24                	js     8025ea <fstat+0x54>
  8025c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025ca:	8b 00                	mov    (%rax),%eax
  8025cc:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8025d0:	48 89 d6             	mov    %rdx,%rsi
  8025d3:	89 c7                	mov    %eax,%edi
  8025d5:	48 b8 8c 1f 80 00 00 	movabs $0x801f8c,%rax
  8025dc:	00 00 00 
  8025df:	ff d0                	callq  *%rax
  8025e1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025e4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025e8:	79 05                	jns    8025ef <fstat+0x59>
  8025ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025ed:	eb 5e                	jmp    80264d <fstat+0xb7>
  8025ef:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025f3:	48 8b 40 28          	mov    0x28(%rax),%rax
  8025f7:	48 85 c0             	test   %rax,%rax
  8025fa:	75 07                	jne    802603 <fstat+0x6d>
  8025fc:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802601:	eb 4a                	jmp    80264d <fstat+0xb7>
  802603:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802607:	c6 00 00             	movb   $0x0,(%rax)
  80260a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80260e:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802615:	00 00 00 
  802618:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80261c:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802623:	00 00 00 
  802626:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80262a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80262e:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802635:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802639:	48 8b 40 28          	mov    0x28(%rax),%rax
  80263d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802641:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802645:	48 89 ce             	mov    %rcx,%rsi
  802648:	48 89 d7             	mov    %rdx,%rdi
  80264b:	ff d0                	callq  *%rax
  80264d:	c9                   	leaveq 
  80264e:	c3                   	retq   

000000000080264f <stat>:
  80264f:	55                   	push   %rbp
  802650:	48 89 e5             	mov    %rsp,%rbp
  802653:	48 83 ec 20          	sub    $0x20,%rsp
  802657:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80265b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80265f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802663:	be 00 00 00 00       	mov    $0x0,%esi
  802668:	48 89 c7             	mov    %rax,%rdi
  80266b:	48 b8 3f 27 80 00 00 	movabs $0x80273f,%rax
  802672:	00 00 00 
  802675:	ff d0                	callq  *%rax
  802677:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80267a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80267e:	79 05                	jns    802685 <stat+0x36>
  802680:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802683:	eb 2f                	jmp    8026b4 <stat+0x65>
  802685:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802689:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80268c:	48 89 d6             	mov    %rdx,%rsi
  80268f:	89 c7                	mov    %eax,%edi
  802691:	48 b8 96 25 80 00 00 	movabs $0x802596,%rax
  802698:	00 00 00 
  80269b:	ff d0                	callq  *%rax
  80269d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8026a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026a3:	89 c7                	mov    %eax,%edi
  8026a5:	48 b8 43 20 80 00 00 	movabs $0x802043,%rax
  8026ac:	00 00 00 
  8026af:	ff d0                	callq  *%rax
  8026b1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8026b4:	c9                   	leaveq 
  8026b5:	c3                   	retq   

00000000008026b6 <fsipc>:
  8026b6:	55                   	push   %rbp
  8026b7:	48 89 e5             	mov    %rsp,%rbp
  8026ba:	48 83 ec 10          	sub    $0x10,%rsp
  8026be:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8026c1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8026c5:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8026cc:	00 00 00 
  8026cf:	8b 00                	mov    (%rax),%eax
  8026d1:	85 c0                	test   %eax,%eax
  8026d3:	75 1f                	jne    8026f4 <fsipc+0x3e>
  8026d5:	bf 01 00 00 00       	mov    $0x1,%edi
  8026da:	48 b8 c4 3f 80 00 00 	movabs $0x803fc4,%rax
  8026e1:	00 00 00 
  8026e4:	ff d0                	callq  *%rax
  8026e6:	89 c2                	mov    %eax,%edx
  8026e8:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8026ef:	00 00 00 
  8026f2:	89 10                	mov    %edx,(%rax)
  8026f4:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8026fb:	00 00 00 
  8026fe:	8b 00                	mov    (%rax),%eax
  802700:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802703:	b9 07 00 00 00       	mov    $0x7,%ecx
  802708:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  80270f:	00 00 00 
  802712:	89 c7                	mov    %eax,%edi
  802714:	48 b8 ba 3e 80 00 00 	movabs $0x803eba,%rax
  80271b:	00 00 00 
  80271e:	ff d0                	callq  *%rax
  802720:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802724:	ba 00 00 00 00       	mov    $0x0,%edx
  802729:	48 89 c6             	mov    %rax,%rsi
  80272c:	bf 00 00 00 00       	mov    $0x0,%edi
  802731:	48 b8 f9 3d 80 00 00 	movabs $0x803df9,%rax
  802738:	00 00 00 
  80273b:	ff d0                	callq  *%rax
  80273d:	c9                   	leaveq 
  80273e:	c3                   	retq   

000000000080273f <open>:
  80273f:	55                   	push   %rbp
  802740:	48 89 e5             	mov    %rsp,%rbp
  802743:	48 83 ec 20          	sub    $0x20,%rsp
  802747:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80274b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80274e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802752:	48 89 c7             	mov    %rax,%rdi
  802755:	48 b8 b3 0f 80 00 00 	movabs $0x800fb3,%rax
  80275c:	00 00 00 
  80275f:	ff d0                	callq  *%rax
  802761:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802766:	7e 0a                	jle    802772 <open+0x33>
  802768:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80276d:	e9 a5 00 00 00       	jmpq   802817 <open+0xd8>
  802772:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802776:	48 89 c7             	mov    %rax,%rdi
  802779:	48 b8 99 1d 80 00 00 	movabs $0x801d99,%rax
  802780:	00 00 00 
  802783:	ff d0                	callq  *%rax
  802785:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802788:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80278c:	79 08                	jns    802796 <open+0x57>
  80278e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802791:	e9 81 00 00 00       	jmpq   802817 <open+0xd8>
  802796:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80279a:	48 89 c6             	mov    %rax,%rsi
  80279d:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  8027a4:	00 00 00 
  8027a7:	48 b8 1f 10 80 00 00 	movabs $0x80101f,%rax
  8027ae:	00 00 00 
  8027b1:	ff d0                	callq  *%rax
  8027b3:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8027ba:	00 00 00 
  8027bd:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8027c0:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8027c6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027ca:	48 89 c6             	mov    %rax,%rsi
  8027cd:	bf 01 00 00 00       	mov    $0x1,%edi
  8027d2:	48 b8 b6 26 80 00 00 	movabs $0x8026b6,%rax
  8027d9:	00 00 00 
  8027dc:	ff d0                	callq  *%rax
  8027de:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027e1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027e5:	79 1d                	jns    802804 <open+0xc5>
  8027e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027eb:	be 00 00 00 00       	mov    $0x0,%esi
  8027f0:	48 89 c7             	mov    %rax,%rdi
  8027f3:	48 b8 c1 1e 80 00 00 	movabs $0x801ec1,%rax
  8027fa:	00 00 00 
  8027fd:	ff d0                	callq  *%rax
  8027ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802802:	eb 13                	jmp    802817 <open+0xd8>
  802804:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802808:	48 89 c7             	mov    %rax,%rdi
  80280b:	48 b8 4b 1d 80 00 00 	movabs $0x801d4b,%rax
  802812:	00 00 00 
  802815:	ff d0                	callq  *%rax
  802817:	c9                   	leaveq 
  802818:	c3                   	retq   

0000000000802819 <devfile_flush>:
  802819:	55                   	push   %rbp
  80281a:	48 89 e5             	mov    %rsp,%rbp
  80281d:	48 83 ec 10          	sub    $0x10,%rsp
  802821:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802825:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802829:	8b 50 0c             	mov    0xc(%rax),%edx
  80282c:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802833:	00 00 00 
  802836:	89 10                	mov    %edx,(%rax)
  802838:	be 00 00 00 00       	mov    $0x0,%esi
  80283d:	bf 06 00 00 00       	mov    $0x6,%edi
  802842:	48 b8 b6 26 80 00 00 	movabs $0x8026b6,%rax
  802849:	00 00 00 
  80284c:	ff d0                	callq  *%rax
  80284e:	c9                   	leaveq 
  80284f:	c3                   	retq   

0000000000802850 <devfile_read>:
  802850:	55                   	push   %rbp
  802851:	48 89 e5             	mov    %rsp,%rbp
  802854:	48 83 ec 30          	sub    $0x30,%rsp
  802858:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80285c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802860:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802864:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802868:	8b 50 0c             	mov    0xc(%rax),%edx
  80286b:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802872:	00 00 00 
  802875:	89 10                	mov    %edx,(%rax)
  802877:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80287e:	00 00 00 
  802881:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802885:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802889:	be 00 00 00 00       	mov    $0x0,%esi
  80288e:	bf 03 00 00 00       	mov    $0x3,%edi
  802893:	48 b8 b6 26 80 00 00 	movabs $0x8026b6,%rax
  80289a:	00 00 00 
  80289d:	ff d0                	callq  *%rax
  80289f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028a2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028a6:	79 08                	jns    8028b0 <devfile_read+0x60>
  8028a8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028ab:	e9 a4 00 00 00       	jmpq   802954 <devfile_read+0x104>
  8028b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028b3:	48 98                	cltq   
  8028b5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8028b9:	76 35                	jbe    8028f0 <devfile_read+0xa0>
  8028bb:	48 b9 d6 46 80 00 00 	movabs $0x8046d6,%rcx
  8028c2:	00 00 00 
  8028c5:	48 ba dd 46 80 00 00 	movabs $0x8046dd,%rdx
  8028cc:	00 00 00 
  8028cf:	be 89 00 00 00       	mov    $0x89,%esi
  8028d4:	48 bf f2 46 80 00 00 	movabs $0x8046f2,%rdi
  8028db:	00 00 00 
  8028de:	b8 00 00 00 00       	mov    $0x0,%eax
  8028e3:	49 b8 55 02 80 00 00 	movabs $0x800255,%r8
  8028ea:	00 00 00 
  8028ed:	41 ff d0             	callq  *%r8
  8028f0:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  8028f7:	7e 35                	jle    80292e <devfile_read+0xde>
  8028f9:	48 b9 00 47 80 00 00 	movabs $0x804700,%rcx
  802900:	00 00 00 
  802903:	48 ba dd 46 80 00 00 	movabs $0x8046dd,%rdx
  80290a:	00 00 00 
  80290d:	be 8a 00 00 00       	mov    $0x8a,%esi
  802912:	48 bf f2 46 80 00 00 	movabs $0x8046f2,%rdi
  802919:	00 00 00 
  80291c:	b8 00 00 00 00       	mov    $0x0,%eax
  802921:	49 b8 55 02 80 00 00 	movabs $0x800255,%r8
  802928:	00 00 00 
  80292b:	41 ff d0             	callq  *%r8
  80292e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802931:	48 63 d0             	movslq %eax,%rdx
  802934:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802938:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  80293f:	00 00 00 
  802942:	48 89 c7             	mov    %rax,%rdi
  802945:	48 b8 44 13 80 00 00 	movabs $0x801344,%rax
  80294c:	00 00 00 
  80294f:	ff d0                	callq  *%rax
  802951:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802954:	c9                   	leaveq 
  802955:	c3                   	retq   

0000000000802956 <devfile_write>:
  802956:	55                   	push   %rbp
  802957:	48 89 e5             	mov    %rsp,%rbp
  80295a:	48 83 ec 40          	sub    $0x40,%rsp
  80295e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802962:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802966:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80296a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80296e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802972:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802979:	00 
  80297a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80297e:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802982:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802987:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  80298b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80298f:	8b 50 0c             	mov    0xc(%rax),%edx
  802992:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802999:	00 00 00 
  80299c:	89 10                	mov    %edx,(%rax)
  80299e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8029a5:	00 00 00 
  8029a8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8029ac:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8029b0:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8029b4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8029b8:	48 89 c6             	mov    %rax,%rsi
  8029bb:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  8029c2:	00 00 00 
  8029c5:	48 b8 44 13 80 00 00 	movabs $0x801344,%rax
  8029cc:	00 00 00 
  8029cf:	ff d0                	callq  *%rax
  8029d1:	be 00 00 00 00       	mov    $0x0,%esi
  8029d6:	bf 04 00 00 00       	mov    $0x4,%edi
  8029db:	48 b8 b6 26 80 00 00 	movabs $0x8026b6,%rax
  8029e2:	00 00 00 
  8029e5:	ff d0                	callq  *%rax
  8029e7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8029ea:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8029ee:	79 05                	jns    8029f5 <devfile_write+0x9f>
  8029f0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8029f3:	eb 43                	jmp    802a38 <devfile_write+0xe2>
  8029f5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8029f8:	48 98                	cltq   
  8029fa:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8029fe:	76 35                	jbe    802a35 <devfile_write+0xdf>
  802a00:	48 b9 d6 46 80 00 00 	movabs $0x8046d6,%rcx
  802a07:	00 00 00 
  802a0a:	48 ba dd 46 80 00 00 	movabs $0x8046dd,%rdx
  802a11:	00 00 00 
  802a14:	be a8 00 00 00       	mov    $0xa8,%esi
  802a19:	48 bf f2 46 80 00 00 	movabs $0x8046f2,%rdi
  802a20:	00 00 00 
  802a23:	b8 00 00 00 00       	mov    $0x0,%eax
  802a28:	49 b8 55 02 80 00 00 	movabs $0x800255,%r8
  802a2f:	00 00 00 
  802a32:	41 ff d0             	callq  *%r8
  802a35:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a38:	c9                   	leaveq 
  802a39:	c3                   	retq   

0000000000802a3a <devfile_stat>:
  802a3a:	55                   	push   %rbp
  802a3b:	48 89 e5             	mov    %rsp,%rbp
  802a3e:	48 83 ec 20          	sub    $0x20,%rsp
  802a42:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802a46:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802a4a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a4e:	8b 50 0c             	mov    0xc(%rax),%edx
  802a51:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a58:	00 00 00 
  802a5b:	89 10                	mov    %edx,(%rax)
  802a5d:	be 00 00 00 00       	mov    $0x0,%esi
  802a62:	bf 05 00 00 00       	mov    $0x5,%edi
  802a67:	48 b8 b6 26 80 00 00 	movabs $0x8026b6,%rax
  802a6e:	00 00 00 
  802a71:	ff d0                	callq  *%rax
  802a73:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a76:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a7a:	79 05                	jns    802a81 <devfile_stat+0x47>
  802a7c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a7f:	eb 56                	jmp    802ad7 <devfile_stat+0x9d>
  802a81:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802a85:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802a8c:	00 00 00 
  802a8f:	48 89 c7             	mov    %rax,%rdi
  802a92:	48 b8 1f 10 80 00 00 	movabs $0x80101f,%rax
  802a99:	00 00 00 
  802a9c:	ff d0                	callq  *%rax
  802a9e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802aa5:	00 00 00 
  802aa8:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802aae:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ab2:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802ab8:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802abf:	00 00 00 
  802ac2:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802ac8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802acc:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802ad2:	b8 00 00 00 00       	mov    $0x0,%eax
  802ad7:	c9                   	leaveq 
  802ad8:	c3                   	retq   

0000000000802ad9 <devfile_trunc>:
  802ad9:	55                   	push   %rbp
  802ada:	48 89 e5             	mov    %rsp,%rbp
  802add:	48 83 ec 10          	sub    $0x10,%rsp
  802ae1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802ae5:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802ae8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802aec:	8b 50 0c             	mov    0xc(%rax),%edx
  802aef:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802af6:	00 00 00 
  802af9:	89 10                	mov    %edx,(%rax)
  802afb:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b02:	00 00 00 
  802b05:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802b08:	89 50 04             	mov    %edx,0x4(%rax)
  802b0b:	be 00 00 00 00       	mov    $0x0,%esi
  802b10:	bf 02 00 00 00       	mov    $0x2,%edi
  802b15:	48 b8 b6 26 80 00 00 	movabs $0x8026b6,%rax
  802b1c:	00 00 00 
  802b1f:	ff d0                	callq  *%rax
  802b21:	c9                   	leaveq 
  802b22:	c3                   	retq   

0000000000802b23 <remove>:
  802b23:	55                   	push   %rbp
  802b24:	48 89 e5             	mov    %rsp,%rbp
  802b27:	48 83 ec 10          	sub    $0x10,%rsp
  802b2b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802b2f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b33:	48 89 c7             	mov    %rax,%rdi
  802b36:	48 b8 b3 0f 80 00 00 	movabs $0x800fb3,%rax
  802b3d:	00 00 00 
  802b40:	ff d0                	callq  *%rax
  802b42:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802b47:	7e 07                	jle    802b50 <remove+0x2d>
  802b49:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802b4e:	eb 33                	jmp    802b83 <remove+0x60>
  802b50:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b54:	48 89 c6             	mov    %rax,%rsi
  802b57:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802b5e:	00 00 00 
  802b61:	48 b8 1f 10 80 00 00 	movabs $0x80101f,%rax
  802b68:	00 00 00 
  802b6b:	ff d0                	callq  *%rax
  802b6d:	be 00 00 00 00       	mov    $0x0,%esi
  802b72:	bf 07 00 00 00       	mov    $0x7,%edi
  802b77:	48 b8 b6 26 80 00 00 	movabs $0x8026b6,%rax
  802b7e:	00 00 00 
  802b81:	ff d0                	callq  *%rax
  802b83:	c9                   	leaveq 
  802b84:	c3                   	retq   

0000000000802b85 <sync>:
  802b85:	55                   	push   %rbp
  802b86:	48 89 e5             	mov    %rsp,%rbp
  802b89:	be 00 00 00 00       	mov    $0x0,%esi
  802b8e:	bf 08 00 00 00       	mov    $0x8,%edi
  802b93:	48 b8 b6 26 80 00 00 	movabs $0x8026b6,%rax
  802b9a:	00 00 00 
  802b9d:	ff d0                	callq  *%rax
  802b9f:	5d                   	pop    %rbp
  802ba0:	c3                   	retq   

0000000000802ba1 <copy>:
  802ba1:	55                   	push   %rbp
  802ba2:	48 89 e5             	mov    %rsp,%rbp
  802ba5:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802bac:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802bb3:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802bba:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802bc1:	be 00 00 00 00       	mov    $0x0,%esi
  802bc6:	48 89 c7             	mov    %rax,%rdi
  802bc9:	48 b8 3f 27 80 00 00 	movabs $0x80273f,%rax
  802bd0:	00 00 00 
  802bd3:	ff d0                	callq  *%rax
  802bd5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bd8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802bdc:	79 28                	jns    802c06 <copy+0x65>
  802bde:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802be1:	89 c6                	mov    %eax,%esi
  802be3:	48 bf 0c 47 80 00 00 	movabs $0x80470c,%rdi
  802bea:	00 00 00 
  802bed:	b8 00 00 00 00       	mov    $0x0,%eax
  802bf2:	48 ba 8f 04 80 00 00 	movabs $0x80048f,%rdx
  802bf9:	00 00 00 
  802bfc:	ff d2                	callq  *%rdx
  802bfe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c01:	e9 76 01 00 00       	jmpq   802d7c <copy+0x1db>
  802c06:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802c0d:	be 01 01 00 00       	mov    $0x101,%esi
  802c12:	48 89 c7             	mov    %rax,%rdi
  802c15:	48 b8 3f 27 80 00 00 	movabs $0x80273f,%rax
  802c1c:	00 00 00 
  802c1f:	ff d0                	callq  *%rax
  802c21:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802c24:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802c28:	0f 89 ad 00 00 00    	jns    802cdb <copy+0x13a>
  802c2e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c31:	89 c6                	mov    %eax,%esi
  802c33:	48 bf 22 47 80 00 00 	movabs $0x804722,%rdi
  802c3a:	00 00 00 
  802c3d:	b8 00 00 00 00       	mov    $0x0,%eax
  802c42:	48 ba 8f 04 80 00 00 	movabs $0x80048f,%rdx
  802c49:	00 00 00 
  802c4c:	ff d2                	callq  *%rdx
  802c4e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c51:	89 c7                	mov    %eax,%edi
  802c53:	48 b8 43 20 80 00 00 	movabs $0x802043,%rax
  802c5a:	00 00 00 
  802c5d:	ff d0                	callq  *%rax
  802c5f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c62:	e9 15 01 00 00       	jmpq   802d7c <copy+0x1db>
  802c67:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802c6a:	48 63 d0             	movslq %eax,%rdx
  802c6d:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802c74:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c77:	48 89 ce             	mov    %rcx,%rsi
  802c7a:	89 c7                	mov    %eax,%edi
  802c7c:	48 b8 b1 23 80 00 00 	movabs $0x8023b1,%rax
  802c83:	00 00 00 
  802c86:	ff d0                	callq  *%rax
  802c88:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802c8b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802c8f:	79 4a                	jns    802cdb <copy+0x13a>
  802c91:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802c94:	89 c6                	mov    %eax,%esi
  802c96:	48 bf 3c 47 80 00 00 	movabs $0x80473c,%rdi
  802c9d:	00 00 00 
  802ca0:	b8 00 00 00 00       	mov    $0x0,%eax
  802ca5:	48 ba 8f 04 80 00 00 	movabs $0x80048f,%rdx
  802cac:	00 00 00 
  802caf:	ff d2                	callq  *%rdx
  802cb1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cb4:	89 c7                	mov    %eax,%edi
  802cb6:	48 b8 43 20 80 00 00 	movabs $0x802043,%rax
  802cbd:	00 00 00 
  802cc0:	ff d0                	callq  *%rax
  802cc2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802cc5:	89 c7                	mov    %eax,%edi
  802cc7:	48 b8 43 20 80 00 00 	movabs $0x802043,%rax
  802cce:	00 00 00 
  802cd1:	ff d0                	callq  *%rax
  802cd3:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802cd6:	e9 a1 00 00 00       	jmpq   802d7c <copy+0x1db>
  802cdb:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802ce2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ce5:	ba 00 02 00 00       	mov    $0x200,%edx
  802cea:	48 89 ce             	mov    %rcx,%rsi
  802ced:	89 c7                	mov    %eax,%edi
  802cef:	48 b8 66 22 80 00 00 	movabs $0x802266,%rax
  802cf6:	00 00 00 
  802cf9:	ff d0                	callq  *%rax
  802cfb:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802cfe:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802d02:	0f 8f 5f ff ff ff    	jg     802c67 <copy+0xc6>
  802d08:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802d0c:	79 47                	jns    802d55 <copy+0x1b4>
  802d0e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802d11:	89 c6                	mov    %eax,%esi
  802d13:	48 bf 4f 47 80 00 00 	movabs $0x80474f,%rdi
  802d1a:	00 00 00 
  802d1d:	b8 00 00 00 00       	mov    $0x0,%eax
  802d22:	48 ba 8f 04 80 00 00 	movabs $0x80048f,%rdx
  802d29:	00 00 00 
  802d2c:	ff d2                	callq  *%rdx
  802d2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d31:	89 c7                	mov    %eax,%edi
  802d33:	48 b8 43 20 80 00 00 	movabs $0x802043,%rax
  802d3a:	00 00 00 
  802d3d:	ff d0                	callq  *%rax
  802d3f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d42:	89 c7                	mov    %eax,%edi
  802d44:	48 b8 43 20 80 00 00 	movabs $0x802043,%rax
  802d4b:	00 00 00 
  802d4e:	ff d0                	callq  *%rax
  802d50:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802d53:	eb 27                	jmp    802d7c <copy+0x1db>
  802d55:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d58:	89 c7                	mov    %eax,%edi
  802d5a:	48 b8 43 20 80 00 00 	movabs $0x802043,%rax
  802d61:	00 00 00 
  802d64:	ff d0                	callq  *%rax
  802d66:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d69:	89 c7                	mov    %eax,%edi
  802d6b:	48 b8 43 20 80 00 00 	movabs $0x802043,%rax
  802d72:	00 00 00 
  802d75:	ff d0                	callq  *%rax
  802d77:	b8 00 00 00 00       	mov    $0x0,%eax
  802d7c:	c9                   	leaveq 
  802d7d:	c3                   	retq   

0000000000802d7e <fd2sockid>:
  802d7e:	55                   	push   %rbp
  802d7f:	48 89 e5             	mov    %rsp,%rbp
  802d82:	48 83 ec 20          	sub    $0x20,%rsp
  802d86:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802d89:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d8d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d90:	48 89 d6             	mov    %rdx,%rsi
  802d93:	89 c7                	mov    %eax,%edi
  802d95:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  802d9c:	00 00 00 
  802d9f:	ff d0                	callq  *%rax
  802da1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802da4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802da8:	79 05                	jns    802daf <fd2sockid+0x31>
  802daa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dad:	eb 24                	jmp    802dd3 <fd2sockid+0x55>
  802daf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802db3:	8b 10                	mov    (%rax),%edx
  802db5:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  802dbc:	00 00 00 
  802dbf:	8b 00                	mov    (%rax),%eax
  802dc1:	39 c2                	cmp    %eax,%edx
  802dc3:	74 07                	je     802dcc <fd2sockid+0x4e>
  802dc5:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802dca:	eb 07                	jmp    802dd3 <fd2sockid+0x55>
  802dcc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802dd0:	8b 40 0c             	mov    0xc(%rax),%eax
  802dd3:	c9                   	leaveq 
  802dd4:	c3                   	retq   

0000000000802dd5 <alloc_sockfd>:
  802dd5:	55                   	push   %rbp
  802dd6:	48 89 e5             	mov    %rsp,%rbp
  802dd9:	48 83 ec 20          	sub    $0x20,%rsp
  802ddd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802de0:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802de4:	48 89 c7             	mov    %rax,%rdi
  802de7:	48 b8 99 1d 80 00 00 	movabs $0x801d99,%rax
  802dee:	00 00 00 
  802df1:	ff d0                	callq  *%rax
  802df3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802df6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802dfa:	78 26                	js     802e22 <alloc_sockfd+0x4d>
  802dfc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e00:	ba 07 04 00 00       	mov    $0x407,%edx
  802e05:	48 89 c6             	mov    %rax,%rsi
  802e08:	bf 00 00 00 00       	mov    $0x0,%edi
  802e0d:	48 b8 4f 19 80 00 00 	movabs $0x80194f,%rax
  802e14:	00 00 00 
  802e17:	ff d0                	callq  *%rax
  802e19:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e1c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e20:	79 16                	jns    802e38 <alloc_sockfd+0x63>
  802e22:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e25:	89 c7                	mov    %eax,%edi
  802e27:	48 b8 e4 32 80 00 00 	movabs $0x8032e4,%rax
  802e2e:	00 00 00 
  802e31:	ff d0                	callq  *%rax
  802e33:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e36:	eb 3a                	jmp    802e72 <alloc_sockfd+0x9d>
  802e38:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e3c:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  802e43:	00 00 00 
  802e46:	8b 12                	mov    (%rdx),%edx
  802e48:	89 10                	mov    %edx,(%rax)
  802e4a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e4e:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  802e55:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e59:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802e5c:	89 50 0c             	mov    %edx,0xc(%rax)
  802e5f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e63:	48 89 c7             	mov    %rax,%rdi
  802e66:	48 b8 4b 1d 80 00 00 	movabs $0x801d4b,%rax
  802e6d:	00 00 00 
  802e70:	ff d0                	callq  *%rax
  802e72:	c9                   	leaveq 
  802e73:	c3                   	retq   

0000000000802e74 <accept>:
  802e74:	55                   	push   %rbp
  802e75:	48 89 e5             	mov    %rsp,%rbp
  802e78:	48 83 ec 30          	sub    $0x30,%rsp
  802e7c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e7f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802e83:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802e87:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e8a:	89 c7                	mov    %eax,%edi
  802e8c:	48 b8 7e 2d 80 00 00 	movabs $0x802d7e,%rax
  802e93:	00 00 00 
  802e96:	ff d0                	callq  *%rax
  802e98:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e9b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e9f:	79 05                	jns    802ea6 <accept+0x32>
  802ea1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ea4:	eb 3b                	jmp    802ee1 <accept+0x6d>
  802ea6:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802eaa:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802eae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eb1:	48 89 ce             	mov    %rcx,%rsi
  802eb4:	89 c7                	mov    %eax,%edi
  802eb6:	48 b8 c1 31 80 00 00 	movabs $0x8031c1,%rax
  802ebd:	00 00 00 
  802ec0:	ff d0                	callq  *%rax
  802ec2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ec5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ec9:	79 05                	jns    802ed0 <accept+0x5c>
  802ecb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ece:	eb 11                	jmp    802ee1 <accept+0x6d>
  802ed0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ed3:	89 c7                	mov    %eax,%edi
  802ed5:	48 b8 d5 2d 80 00 00 	movabs $0x802dd5,%rax
  802edc:	00 00 00 
  802edf:	ff d0                	callq  *%rax
  802ee1:	c9                   	leaveq 
  802ee2:	c3                   	retq   

0000000000802ee3 <bind>:
  802ee3:	55                   	push   %rbp
  802ee4:	48 89 e5             	mov    %rsp,%rbp
  802ee7:	48 83 ec 20          	sub    $0x20,%rsp
  802eeb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802eee:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ef2:	89 55 e8             	mov    %edx,-0x18(%rbp)
  802ef5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ef8:	89 c7                	mov    %eax,%edi
  802efa:	48 b8 7e 2d 80 00 00 	movabs $0x802d7e,%rax
  802f01:	00 00 00 
  802f04:	ff d0                	callq  *%rax
  802f06:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f09:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f0d:	79 05                	jns    802f14 <bind+0x31>
  802f0f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f12:	eb 1b                	jmp    802f2f <bind+0x4c>
  802f14:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802f17:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802f1b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f1e:	48 89 ce             	mov    %rcx,%rsi
  802f21:	89 c7                	mov    %eax,%edi
  802f23:	48 b8 40 32 80 00 00 	movabs $0x803240,%rax
  802f2a:	00 00 00 
  802f2d:	ff d0                	callq  *%rax
  802f2f:	c9                   	leaveq 
  802f30:	c3                   	retq   

0000000000802f31 <shutdown>:
  802f31:	55                   	push   %rbp
  802f32:	48 89 e5             	mov    %rsp,%rbp
  802f35:	48 83 ec 20          	sub    $0x20,%rsp
  802f39:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f3c:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802f3f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f42:	89 c7                	mov    %eax,%edi
  802f44:	48 b8 7e 2d 80 00 00 	movabs $0x802d7e,%rax
  802f4b:	00 00 00 
  802f4e:	ff d0                	callq  *%rax
  802f50:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f53:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f57:	79 05                	jns    802f5e <shutdown+0x2d>
  802f59:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f5c:	eb 16                	jmp    802f74 <shutdown+0x43>
  802f5e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802f61:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f64:	89 d6                	mov    %edx,%esi
  802f66:	89 c7                	mov    %eax,%edi
  802f68:	48 b8 a4 32 80 00 00 	movabs $0x8032a4,%rax
  802f6f:	00 00 00 
  802f72:	ff d0                	callq  *%rax
  802f74:	c9                   	leaveq 
  802f75:	c3                   	retq   

0000000000802f76 <devsock_close>:
  802f76:	55                   	push   %rbp
  802f77:	48 89 e5             	mov    %rsp,%rbp
  802f7a:	48 83 ec 10          	sub    $0x10,%rsp
  802f7e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802f82:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f86:	48 89 c7             	mov    %rax,%rdi
  802f89:	48 b8 35 40 80 00 00 	movabs $0x804035,%rax
  802f90:	00 00 00 
  802f93:	ff d0                	callq  *%rax
  802f95:	83 f8 01             	cmp    $0x1,%eax
  802f98:	75 17                	jne    802fb1 <devsock_close+0x3b>
  802f9a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f9e:	8b 40 0c             	mov    0xc(%rax),%eax
  802fa1:	89 c7                	mov    %eax,%edi
  802fa3:	48 b8 e4 32 80 00 00 	movabs $0x8032e4,%rax
  802faa:	00 00 00 
  802fad:	ff d0                	callq  *%rax
  802faf:	eb 05                	jmp    802fb6 <devsock_close+0x40>
  802fb1:	b8 00 00 00 00       	mov    $0x0,%eax
  802fb6:	c9                   	leaveq 
  802fb7:	c3                   	retq   

0000000000802fb8 <connect>:
  802fb8:	55                   	push   %rbp
  802fb9:	48 89 e5             	mov    %rsp,%rbp
  802fbc:	48 83 ec 20          	sub    $0x20,%rsp
  802fc0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802fc3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802fc7:	89 55 e8             	mov    %edx,-0x18(%rbp)
  802fca:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802fcd:	89 c7                	mov    %eax,%edi
  802fcf:	48 b8 7e 2d 80 00 00 	movabs $0x802d7e,%rax
  802fd6:	00 00 00 
  802fd9:	ff d0                	callq  *%rax
  802fdb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fde:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fe2:	79 05                	jns    802fe9 <connect+0x31>
  802fe4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fe7:	eb 1b                	jmp    803004 <connect+0x4c>
  802fe9:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802fec:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802ff0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ff3:	48 89 ce             	mov    %rcx,%rsi
  802ff6:	89 c7                	mov    %eax,%edi
  802ff8:	48 b8 11 33 80 00 00 	movabs $0x803311,%rax
  802fff:	00 00 00 
  803002:	ff d0                	callq  *%rax
  803004:	c9                   	leaveq 
  803005:	c3                   	retq   

0000000000803006 <listen>:
  803006:	55                   	push   %rbp
  803007:	48 89 e5             	mov    %rsp,%rbp
  80300a:	48 83 ec 20          	sub    $0x20,%rsp
  80300e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803011:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803014:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803017:	89 c7                	mov    %eax,%edi
  803019:	48 b8 7e 2d 80 00 00 	movabs $0x802d7e,%rax
  803020:	00 00 00 
  803023:	ff d0                	callq  *%rax
  803025:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803028:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80302c:	79 05                	jns    803033 <listen+0x2d>
  80302e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803031:	eb 16                	jmp    803049 <listen+0x43>
  803033:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803036:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803039:	89 d6                	mov    %edx,%esi
  80303b:	89 c7                	mov    %eax,%edi
  80303d:	48 b8 75 33 80 00 00 	movabs $0x803375,%rax
  803044:	00 00 00 
  803047:	ff d0                	callq  *%rax
  803049:	c9                   	leaveq 
  80304a:	c3                   	retq   

000000000080304b <devsock_read>:
  80304b:	55                   	push   %rbp
  80304c:	48 89 e5             	mov    %rsp,%rbp
  80304f:	48 83 ec 20          	sub    $0x20,%rsp
  803053:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803057:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80305b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80305f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803063:	89 c2                	mov    %eax,%edx
  803065:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803069:	8b 40 0c             	mov    0xc(%rax),%eax
  80306c:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803070:	b9 00 00 00 00       	mov    $0x0,%ecx
  803075:	89 c7                	mov    %eax,%edi
  803077:	48 b8 b5 33 80 00 00 	movabs $0x8033b5,%rax
  80307e:	00 00 00 
  803081:	ff d0                	callq  *%rax
  803083:	c9                   	leaveq 
  803084:	c3                   	retq   

0000000000803085 <devsock_write>:
  803085:	55                   	push   %rbp
  803086:	48 89 e5             	mov    %rsp,%rbp
  803089:	48 83 ec 20          	sub    $0x20,%rsp
  80308d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803091:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803095:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803099:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80309d:	89 c2                	mov    %eax,%edx
  80309f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030a3:	8b 40 0c             	mov    0xc(%rax),%eax
  8030a6:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8030aa:	b9 00 00 00 00       	mov    $0x0,%ecx
  8030af:	89 c7                	mov    %eax,%edi
  8030b1:	48 b8 81 34 80 00 00 	movabs $0x803481,%rax
  8030b8:	00 00 00 
  8030bb:	ff d0                	callq  *%rax
  8030bd:	c9                   	leaveq 
  8030be:	c3                   	retq   

00000000008030bf <devsock_stat>:
  8030bf:	55                   	push   %rbp
  8030c0:	48 89 e5             	mov    %rsp,%rbp
  8030c3:	48 83 ec 10          	sub    $0x10,%rsp
  8030c7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8030cb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8030cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030d3:	48 be 6a 47 80 00 00 	movabs $0x80476a,%rsi
  8030da:	00 00 00 
  8030dd:	48 89 c7             	mov    %rax,%rdi
  8030e0:	48 b8 1f 10 80 00 00 	movabs $0x80101f,%rax
  8030e7:	00 00 00 
  8030ea:	ff d0                	callq  *%rax
  8030ec:	b8 00 00 00 00       	mov    $0x0,%eax
  8030f1:	c9                   	leaveq 
  8030f2:	c3                   	retq   

00000000008030f3 <socket>:
  8030f3:	55                   	push   %rbp
  8030f4:	48 89 e5             	mov    %rsp,%rbp
  8030f7:	48 83 ec 20          	sub    $0x20,%rsp
  8030fb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8030fe:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803101:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803104:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803107:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80310a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80310d:	89 ce                	mov    %ecx,%esi
  80310f:	89 c7                	mov    %eax,%edi
  803111:	48 b8 39 35 80 00 00 	movabs $0x803539,%rax
  803118:	00 00 00 
  80311b:	ff d0                	callq  *%rax
  80311d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803120:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803124:	79 05                	jns    80312b <socket+0x38>
  803126:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803129:	eb 11                	jmp    80313c <socket+0x49>
  80312b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80312e:	89 c7                	mov    %eax,%edi
  803130:	48 b8 d5 2d 80 00 00 	movabs $0x802dd5,%rax
  803137:	00 00 00 
  80313a:	ff d0                	callq  *%rax
  80313c:	c9                   	leaveq 
  80313d:	c3                   	retq   

000000000080313e <nsipc>:
  80313e:	55                   	push   %rbp
  80313f:	48 89 e5             	mov    %rsp,%rbp
  803142:	48 83 ec 10          	sub    $0x10,%rsp
  803146:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803149:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  803150:	00 00 00 
  803153:	8b 00                	mov    (%rax),%eax
  803155:	85 c0                	test   %eax,%eax
  803157:	75 1f                	jne    803178 <nsipc+0x3a>
  803159:	bf 02 00 00 00       	mov    $0x2,%edi
  80315e:	48 b8 c4 3f 80 00 00 	movabs $0x803fc4,%rax
  803165:	00 00 00 
  803168:	ff d0                	callq  *%rax
  80316a:	89 c2                	mov    %eax,%edx
  80316c:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  803173:	00 00 00 
  803176:	89 10                	mov    %edx,(%rax)
  803178:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  80317f:	00 00 00 
  803182:	8b 00                	mov    (%rax),%eax
  803184:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803187:	b9 07 00 00 00       	mov    $0x7,%ecx
  80318c:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  803193:	00 00 00 
  803196:	89 c7                	mov    %eax,%edi
  803198:	48 b8 ba 3e 80 00 00 	movabs $0x803eba,%rax
  80319f:	00 00 00 
  8031a2:	ff d0                	callq  *%rax
  8031a4:	ba 00 00 00 00       	mov    $0x0,%edx
  8031a9:	be 00 00 00 00       	mov    $0x0,%esi
  8031ae:	bf 00 00 00 00       	mov    $0x0,%edi
  8031b3:	48 b8 f9 3d 80 00 00 	movabs $0x803df9,%rax
  8031ba:	00 00 00 
  8031bd:	ff d0                	callq  *%rax
  8031bf:	c9                   	leaveq 
  8031c0:	c3                   	retq   

00000000008031c1 <nsipc_accept>:
  8031c1:	55                   	push   %rbp
  8031c2:	48 89 e5             	mov    %rsp,%rbp
  8031c5:	48 83 ec 30          	sub    $0x30,%rsp
  8031c9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8031cc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8031d0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8031d4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8031db:	00 00 00 
  8031de:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8031e1:	89 10                	mov    %edx,(%rax)
  8031e3:	bf 01 00 00 00       	mov    $0x1,%edi
  8031e8:	48 b8 3e 31 80 00 00 	movabs $0x80313e,%rax
  8031ef:	00 00 00 
  8031f2:	ff d0                	callq  *%rax
  8031f4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031f7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031fb:	78 3e                	js     80323b <nsipc_accept+0x7a>
  8031fd:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803204:	00 00 00 
  803207:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80320b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80320f:	8b 40 10             	mov    0x10(%rax),%eax
  803212:	89 c2                	mov    %eax,%edx
  803214:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803218:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80321c:	48 89 ce             	mov    %rcx,%rsi
  80321f:	48 89 c7             	mov    %rax,%rdi
  803222:	48 b8 44 13 80 00 00 	movabs $0x801344,%rax
  803229:	00 00 00 
  80322c:	ff d0                	callq  *%rax
  80322e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803232:	8b 50 10             	mov    0x10(%rax),%edx
  803235:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803239:	89 10                	mov    %edx,(%rax)
  80323b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80323e:	c9                   	leaveq 
  80323f:	c3                   	retq   

0000000000803240 <nsipc_bind>:
  803240:	55                   	push   %rbp
  803241:	48 89 e5             	mov    %rsp,%rbp
  803244:	48 83 ec 10          	sub    $0x10,%rsp
  803248:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80324b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80324f:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803252:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803259:	00 00 00 
  80325c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80325f:	89 10                	mov    %edx,(%rax)
  803261:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803264:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803268:	48 89 c6             	mov    %rax,%rsi
  80326b:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  803272:	00 00 00 
  803275:	48 b8 44 13 80 00 00 	movabs $0x801344,%rax
  80327c:	00 00 00 
  80327f:	ff d0                	callq  *%rax
  803281:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803288:	00 00 00 
  80328b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80328e:	89 50 14             	mov    %edx,0x14(%rax)
  803291:	bf 02 00 00 00       	mov    $0x2,%edi
  803296:	48 b8 3e 31 80 00 00 	movabs $0x80313e,%rax
  80329d:	00 00 00 
  8032a0:	ff d0                	callq  *%rax
  8032a2:	c9                   	leaveq 
  8032a3:	c3                   	retq   

00000000008032a4 <nsipc_shutdown>:
  8032a4:	55                   	push   %rbp
  8032a5:	48 89 e5             	mov    %rsp,%rbp
  8032a8:	48 83 ec 10          	sub    $0x10,%rsp
  8032ac:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8032af:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8032b2:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032b9:	00 00 00 
  8032bc:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8032bf:	89 10                	mov    %edx,(%rax)
  8032c1:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032c8:	00 00 00 
  8032cb:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8032ce:	89 50 04             	mov    %edx,0x4(%rax)
  8032d1:	bf 03 00 00 00       	mov    $0x3,%edi
  8032d6:	48 b8 3e 31 80 00 00 	movabs $0x80313e,%rax
  8032dd:	00 00 00 
  8032e0:	ff d0                	callq  *%rax
  8032e2:	c9                   	leaveq 
  8032e3:	c3                   	retq   

00000000008032e4 <nsipc_close>:
  8032e4:	55                   	push   %rbp
  8032e5:	48 89 e5             	mov    %rsp,%rbp
  8032e8:	48 83 ec 10          	sub    $0x10,%rsp
  8032ec:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8032ef:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032f6:	00 00 00 
  8032f9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8032fc:	89 10                	mov    %edx,(%rax)
  8032fe:	bf 04 00 00 00       	mov    $0x4,%edi
  803303:	48 b8 3e 31 80 00 00 	movabs $0x80313e,%rax
  80330a:	00 00 00 
  80330d:	ff d0                	callq  *%rax
  80330f:	c9                   	leaveq 
  803310:	c3                   	retq   

0000000000803311 <nsipc_connect>:
  803311:	55                   	push   %rbp
  803312:	48 89 e5             	mov    %rsp,%rbp
  803315:	48 83 ec 10          	sub    $0x10,%rsp
  803319:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80331c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803320:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803323:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80332a:	00 00 00 
  80332d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803330:	89 10                	mov    %edx,(%rax)
  803332:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803335:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803339:	48 89 c6             	mov    %rax,%rsi
  80333c:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  803343:	00 00 00 
  803346:	48 b8 44 13 80 00 00 	movabs $0x801344,%rax
  80334d:	00 00 00 
  803350:	ff d0                	callq  *%rax
  803352:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803359:	00 00 00 
  80335c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80335f:	89 50 14             	mov    %edx,0x14(%rax)
  803362:	bf 05 00 00 00       	mov    $0x5,%edi
  803367:	48 b8 3e 31 80 00 00 	movabs $0x80313e,%rax
  80336e:	00 00 00 
  803371:	ff d0                	callq  *%rax
  803373:	c9                   	leaveq 
  803374:	c3                   	retq   

0000000000803375 <nsipc_listen>:
  803375:	55                   	push   %rbp
  803376:	48 89 e5             	mov    %rsp,%rbp
  803379:	48 83 ec 10          	sub    $0x10,%rsp
  80337d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803380:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803383:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80338a:	00 00 00 
  80338d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803390:	89 10                	mov    %edx,(%rax)
  803392:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803399:	00 00 00 
  80339c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80339f:	89 50 04             	mov    %edx,0x4(%rax)
  8033a2:	bf 06 00 00 00       	mov    $0x6,%edi
  8033a7:	48 b8 3e 31 80 00 00 	movabs $0x80313e,%rax
  8033ae:	00 00 00 
  8033b1:	ff d0                	callq  *%rax
  8033b3:	c9                   	leaveq 
  8033b4:	c3                   	retq   

00000000008033b5 <nsipc_recv>:
  8033b5:	55                   	push   %rbp
  8033b6:	48 89 e5             	mov    %rsp,%rbp
  8033b9:	48 83 ec 30          	sub    $0x30,%rsp
  8033bd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8033c0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8033c4:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8033c7:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8033ca:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033d1:	00 00 00 
  8033d4:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8033d7:	89 10                	mov    %edx,(%rax)
  8033d9:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033e0:	00 00 00 
  8033e3:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8033e6:	89 50 04             	mov    %edx,0x4(%rax)
  8033e9:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033f0:	00 00 00 
  8033f3:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8033f6:	89 50 08             	mov    %edx,0x8(%rax)
  8033f9:	bf 07 00 00 00       	mov    $0x7,%edi
  8033fe:	48 b8 3e 31 80 00 00 	movabs $0x80313e,%rax
  803405:	00 00 00 
  803408:	ff d0                	callq  *%rax
  80340a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80340d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803411:	78 69                	js     80347c <nsipc_recv+0xc7>
  803413:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  80341a:	7f 08                	jg     803424 <nsipc_recv+0x6f>
  80341c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80341f:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803422:	7e 35                	jle    803459 <nsipc_recv+0xa4>
  803424:	48 b9 71 47 80 00 00 	movabs $0x804771,%rcx
  80342b:	00 00 00 
  80342e:	48 ba 86 47 80 00 00 	movabs $0x804786,%rdx
  803435:	00 00 00 
  803438:	be 62 00 00 00       	mov    $0x62,%esi
  80343d:	48 bf 9b 47 80 00 00 	movabs $0x80479b,%rdi
  803444:	00 00 00 
  803447:	b8 00 00 00 00       	mov    $0x0,%eax
  80344c:	49 b8 55 02 80 00 00 	movabs $0x800255,%r8
  803453:	00 00 00 
  803456:	41 ff d0             	callq  *%r8
  803459:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80345c:	48 63 d0             	movslq %eax,%rdx
  80345f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803463:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  80346a:	00 00 00 
  80346d:	48 89 c7             	mov    %rax,%rdi
  803470:	48 b8 44 13 80 00 00 	movabs $0x801344,%rax
  803477:	00 00 00 
  80347a:	ff d0                	callq  *%rax
  80347c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80347f:	c9                   	leaveq 
  803480:	c3                   	retq   

0000000000803481 <nsipc_send>:
  803481:	55                   	push   %rbp
  803482:	48 89 e5             	mov    %rsp,%rbp
  803485:	48 83 ec 20          	sub    $0x20,%rsp
  803489:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80348c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803490:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803493:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803496:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80349d:	00 00 00 
  8034a0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8034a3:	89 10                	mov    %edx,(%rax)
  8034a5:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  8034ac:	7e 35                	jle    8034e3 <nsipc_send+0x62>
  8034ae:	48 b9 aa 47 80 00 00 	movabs $0x8047aa,%rcx
  8034b5:	00 00 00 
  8034b8:	48 ba 86 47 80 00 00 	movabs $0x804786,%rdx
  8034bf:	00 00 00 
  8034c2:	be 6d 00 00 00       	mov    $0x6d,%esi
  8034c7:	48 bf 9b 47 80 00 00 	movabs $0x80479b,%rdi
  8034ce:	00 00 00 
  8034d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8034d6:	49 b8 55 02 80 00 00 	movabs $0x800255,%r8
  8034dd:	00 00 00 
  8034e0:	41 ff d0             	callq  *%r8
  8034e3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034e6:	48 63 d0             	movslq %eax,%rdx
  8034e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8034ed:	48 89 c6             	mov    %rax,%rsi
  8034f0:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  8034f7:	00 00 00 
  8034fa:	48 b8 44 13 80 00 00 	movabs $0x801344,%rax
  803501:	00 00 00 
  803504:	ff d0                	callq  *%rax
  803506:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80350d:	00 00 00 
  803510:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803513:	89 50 04             	mov    %edx,0x4(%rax)
  803516:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80351d:	00 00 00 
  803520:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803523:	89 50 08             	mov    %edx,0x8(%rax)
  803526:	bf 08 00 00 00       	mov    $0x8,%edi
  80352b:	48 b8 3e 31 80 00 00 	movabs $0x80313e,%rax
  803532:	00 00 00 
  803535:	ff d0                	callq  *%rax
  803537:	c9                   	leaveq 
  803538:	c3                   	retq   

0000000000803539 <nsipc_socket>:
  803539:	55                   	push   %rbp
  80353a:	48 89 e5             	mov    %rsp,%rbp
  80353d:	48 83 ec 10          	sub    $0x10,%rsp
  803541:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803544:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803547:	89 55 f4             	mov    %edx,-0xc(%rbp)
  80354a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803551:	00 00 00 
  803554:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803557:	89 10                	mov    %edx,(%rax)
  803559:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803560:	00 00 00 
  803563:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803566:	89 50 04             	mov    %edx,0x4(%rax)
  803569:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803570:	00 00 00 
  803573:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803576:	89 50 08             	mov    %edx,0x8(%rax)
  803579:	bf 09 00 00 00       	mov    $0x9,%edi
  80357e:	48 b8 3e 31 80 00 00 	movabs $0x80313e,%rax
  803585:	00 00 00 
  803588:	ff d0                	callq  *%rax
  80358a:	c9                   	leaveq 
  80358b:	c3                   	retq   

000000000080358c <pipe>:
  80358c:	55                   	push   %rbp
  80358d:	48 89 e5             	mov    %rsp,%rbp
  803590:	53                   	push   %rbx
  803591:	48 83 ec 38          	sub    $0x38,%rsp
  803595:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803599:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  80359d:	48 89 c7             	mov    %rax,%rdi
  8035a0:	48 b8 99 1d 80 00 00 	movabs $0x801d99,%rax
  8035a7:	00 00 00 
  8035aa:	ff d0                	callq  *%rax
  8035ac:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8035af:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8035b3:	0f 88 bf 01 00 00    	js     803778 <pipe+0x1ec>
  8035b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8035bd:	ba 07 04 00 00       	mov    $0x407,%edx
  8035c2:	48 89 c6             	mov    %rax,%rsi
  8035c5:	bf 00 00 00 00       	mov    $0x0,%edi
  8035ca:	48 b8 4f 19 80 00 00 	movabs $0x80194f,%rax
  8035d1:	00 00 00 
  8035d4:	ff d0                	callq  *%rax
  8035d6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8035d9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8035dd:	0f 88 95 01 00 00    	js     803778 <pipe+0x1ec>
  8035e3:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8035e7:	48 89 c7             	mov    %rax,%rdi
  8035ea:	48 b8 99 1d 80 00 00 	movabs $0x801d99,%rax
  8035f1:	00 00 00 
  8035f4:	ff d0                	callq  *%rax
  8035f6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8035f9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8035fd:	0f 88 5d 01 00 00    	js     803760 <pipe+0x1d4>
  803603:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803607:	ba 07 04 00 00       	mov    $0x407,%edx
  80360c:	48 89 c6             	mov    %rax,%rsi
  80360f:	bf 00 00 00 00       	mov    $0x0,%edi
  803614:	48 b8 4f 19 80 00 00 	movabs $0x80194f,%rax
  80361b:	00 00 00 
  80361e:	ff d0                	callq  *%rax
  803620:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803623:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803627:	0f 88 33 01 00 00    	js     803760 <pipe+0x1d4>
  80362d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803631:	48 89 c7             	mov    %rax,%rdi
  803634:	48 b8 6e 1d 80 00 00 	movabs $0x801d6e,%rax
  80363b:	00 00 00 
  80363e:	ff d0                	callq  *%rax
  803640:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803644:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803648:	ba 07 04 00 00       	mov    $0x407,%edx
  80364d:	48 89 c6             	mov    %rax,%rsi
  803650:	bf 00 00 00 00       	mov    $0x0,%edi
  803655:	48 b8 4f 19 80 00 00 	movabs $0x80194f,%rax
  80365c:	00 00 00 
  80365f:	ff d0                	callq  *%rax
  803661:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803664:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803668:	0f 88 d9 00 00 00    	js     803747 <pipe+0x1bb>
  80366e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803672:	48 89 c7             	mov    %rax,%rdi
  803675:	48 b8 6e 1d 80 00 00 	movabs $0x801d6e,%rax
  80367c:	00 00 00 
  80367f:	ff d0                	callq  *%rax
  803681:	48 89 c2             	mov    %rax,%rdx
  803684:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803688:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  80368e:	48 89 d1             	mov    %rdx,%rcx
  803691:	ba 00 00 00 00       	mov    $0x0,%edx
  803696:	48 89 c6             	mov    %rax,%rsi
  803699:	bf 00 00 00 00       	mov    $0x0,%edi
  80369e:	48 b8 a1 19 80 00 00 	movabs $0x8019a1,%rax
  8036a5:	00 00 00 
  8036a8:	ff d0                	callq  *%rax
  8036aa:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8036ad:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8036b1:	78 79                	js     80372c <pipe+0x1a0>
  8036b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8036b7:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  8036be:	00 00 00 
  8036c1:	8b 12                	mov    (%rdx),%edx
  8036c3:	89 10                	mov    %edx,(%rax)
  8036c5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8036c9:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  8036d0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8036d4:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  8036db:	00 00 00 
  8036de:	8b 12                	mov    (%rdx),%edx
  8036e0:	89 10                	mov    %edx,(%rax)
  8036e2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8036e6:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  8036ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8036f1:	48 89 c7             	mov    %rax,%rdi
  8036f4:	48 b8 4b 1d 80 00 00 	movabs $0x801d4b,%rax
  8036fb:	00 00 00 
  8036fe:	ff d0                	callq  *%rax
  803700:	89 c2                	mov    %eax,%edx
  803702:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803706:	89 10                	mov    %edx,(%rax)
  803708:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80370c:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803710:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803714:	48 89 c7             	mov    %rax,%rdi
  803717:	48 b8 4b 1d 80 00 00 	movabs $0x801d4b,%rax
  80371e:	00 00 00 
  803721:	ff d0                	callq  *%rax
  803723:	89 03                	mov    %eax,(%rbx)
  803725:	b8 00 00 00 00       	mov    $0x0,%eax
  80372a:	eb 4f                	jmp    80377b <pipe+0x1ef>
  80372c:	90                   	nop
  80372d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803731:	48 89 c6             	mov    %rax,%rsi
  803734:	bf 00 00 00 00       	mov    $0x0,%edi
  803739:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  803740:	00 00 00 
  803743:	ff d0                	callq  *%rax
  803745:	eb 01                	jmp    803748 <pipe+0x1bc>
  803747:	90                   	nop
  803748:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80374c:	48 89 c6             	mov    %rax,%rsi
  80374f:	bf 00 00 00 00       	mov    $0x0,%edi
  803754:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  80375b:	00 00 00 
  80375e:	ff d0                	callq  *%rax
  803760:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803764:	48 89 c6             	mov    %rax,%rsi
  803767:	bf 00 00 00 00       	mov    $0x0,%edi
  80376c:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  803773:	00 00 00 
  803776:	ff d0                	callq  *%rax
  803778:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80377b:	48 83 c4 38          	add    $0x38,%rsp
  80377f:	5b                   	pop    %rbx
  803780:	5d                   	pop    %rbp
  803781:	c3                   	retq   

0000000000803782 <_pipeisclosed>:
  803782:	55                   	push   %rbp
  803783:	48 89 e5             	mov    %rsp,%rbp
  803786:	53                   	push   %rbx
  803787:	48 83 ec 28          	sub    $0x28,%rsp
  80378b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80378f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803793:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80379a:	00 00 00 
  80379d:	48 8b 00             	mov    (%rax),%rax
  8037a0:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  8037a6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8037a9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8037ad:	48 89 c7             	mov    %rax,%rdi
  8037b0:	48 b8 35 40 80 00 00 	movabs $0x804035,%rax
  8037b7:	00 00 00 
  8037ba:	ff d0                	callq  *%rax
  8037bc:	89 c3                	mov    %eax,%ebx
  8037be:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8037c2:	48 89 c7             	mov    %rax,%rdi
  8037c5:	48 b8 35 40 80 00 00 	movabs $0x804035,%rax
  8037cc:	00 00 00 
  8037cf:	ff d0                	callq  *%rax
  8037d1:	39 c3                	cmp    %eax,%ebx
  8037d3:	0f 94 c0             	sete   %al
  8037d6:	0f b6 c0             	movzbl %al,%eax
  8037d9:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8037dc:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8037e3:	00 00 00 
  8037e6:	48 8b 00             	mov    (%rax),%rax
  8037e9:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  8037ef:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8037f2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037f5:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8037f8:	75 05                	jne    8037ff <_pipeisclosed+0x7d>
  8037fa:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8037fd:	eb 4a                	jmp    803849 <_pipeisclosed+0xc7>
  8037ff:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803802:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803805:	74 8c                	je     803793 <_pipeisclosed+0x11>
  803807:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  80380b:	75 86                	jne    803793 <_pipeisclosed+0x11>
  80380d:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803814:	00 00 00 
  803817:	48 8b 00             	mov    (%rax),%rax
  80381a:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803820:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803823:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803826:	89 c6                	mov    %eax,%esi
  803828:	48 bf bb 47 80 00 00 	movabs $0x8047bb,%rdi
  80382f:	00 00 00 
  803832:	b8 00 00 00 00       	mov    $0x0,%eax
  803837:	49 b8 8f 04 80 00 00 	movabs $0x80048f,%r8
  80383e:	00 00 00 
  803841:	41 ff d0             	callq  *%r8
  803844:	e9 4a ff ff ff       	jmpq   803793 <_pipeisclosed+0x11>
  803849:	48 83 c4 28          	add    $0x28,%rsp
  80384d:	5b                   	pop    %rbx
  80384e:	5d                   	pop    %rbp
  80384f:	c3                   	retq   

0000000000803850 <pipeisclosed>:
  803850:	55                   	push   %rbp
  803851:	48 89 e5             	mov    %rsp,%rbp
  803854:	48 83 ec 30          	sub    $0x30,%rsp
  803858:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80385b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80385f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803862:	48 89 d6             	mov    %rdx,%rsi
  803865:	89 c7                	mov    %eax,%edi
  803867:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  80386e:	00 00 00 
  803871:	ff d0                	callq  *%rax
  803873:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803876:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80387a:	79 05                	jns    803881 <pipeisclosed+0x31>
  80387c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80387f:	eb 31                	jmp    8038b2 <pipeisclosed+0x62>
  803881:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803885:	48 89 c7             	mov    %rax,%rdi
  803888:	48 b8 6e 1d 80 00 00 	movabs $0x801d6e,%rax
  80388f:	00 00 00 
  803892:	ff d0                	callq  *%rax
  803894:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803898:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80389c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8038a0:	48 89 d6             	mov    %rdx,%rsi
  8038a3:	48 89 c7             	mov    %rax,%rdi
  8038a6:	48 b8 82 37 80 00 00 	movabs $0x803782,%rax
  8038ad:	00 00 00 
  8038b0:	ff d0                	callq  *%rax
  8038b2:	c9                   	leaveq 
  8038b3:	c3                   	retq   

00000000008038b4 <devpipe_read>:
  8038b4:	55                   	push   %rbp
  8038b5:	48 89 e5             	mov    %rsp,%rbp
  8038b8:	48 83 ec 40          	sub    $0x40,%rsp
  8038bc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8038c0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8038c4:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8038c8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8038cc:	48 89 c7             	mov    %rax,%rdi
  8038cf:	48 b8 6e 1d 80 00 00 	movabs $0x801d6e,%rax
  8038d6:	00 00 00 
  8038d9:	ff d0                	callq  *%rax
  8038db:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8038df:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8038e3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8038e7:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8038ee:	00 
  8038ef:	e9 90 00 00 00       	jmpq   803984 <devpipe_read+0xd0>
  8038f4:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8038f9:	74 09                	je     803904 <devpipe_read+0x50>
  8038fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038ff:	e9 8e 00 00 00       	jmpq   803992 <devpipe_read+0xde>
  803904:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803908:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80390c:	48 89 d6             	mov    %rdx,%rsi
  80390f:	48 89 c7             	mov    %rax,%rdi
  803912:	48 b8 82 37 80 00 00 	movabs $0x803782,%rax
  803919:	00 00 00 
  80391c:	ff d0                	callq  *%rax
  80391e:	85 c0                	test   %eax,%eax
  803920:	74 07                	je     803929 <devpipe_read+0x75>
  803922:	b8 00 00 00 00       	mov    $0x0,%eax
  803927:	eb 69                	jmp    803992 <devpipe_read+0xde>
  803929:	48 b8 12 19 80 00 00 	movabs $0x801912,%rax
  803930:	00 00 00 
  803933:	ff d0                	callq  *%rax
  803935:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803939:	8b 10                	mov    (%rax),%edx
  80393b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80393f:	8b 40 04             	mov    0x4(%rax),%eax
  803942:	39 c2                	cmp    %eax,%edx
  803944:	74 ae                	je     8038f4 <devpipe_read+0x40>
  803946:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80394a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80394e:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803952:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803956:	8b 00                	mov    (%rax),%eax
  803958:	99                   	cltd   
  803959:	c1 ea 1b             	shr    $0x1b,%edx
  80395c:	01 d0                	add    %edx,%eax
  80395e:	83 e0 1f             	and    $0x1f,%eax
  803961:	29 d0                	sub    %edx,%eax
  803963:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803967:	48 98                	cltq   
  803969:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  80396e:	88 01                	mov    %al,(%rcx)
  803970:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803974:	8b 00                	mov    (%rax),%eax
  803976:	8d 50 01             	lea    0x1(%rax),%edx
  803979:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80397d:	89 10                	mov    %edx,(%rax)
  80397f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803984:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803988:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80398c:	72 a7                	jb     803935 <devpipe_read+0x81>
  80398e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803992:	c9                   	leaveq 
  803993:	c3                   	retq   

0000000000803994 <devpipe_write>:
  803994:	55                   	push   %rbp
  803995:	48 89 e5             	mov    %rsp,%rbp
  803998:	48 83 ec 40          	sub    $0x40,%rsp
  80399c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8039a0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8039a4:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8039a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8039ac:	48 89 c7             	mov    %rax,%rdi
  8039af:	48 b8 6e 1d 80 00 00 	movabs $0x801d6e,%rax
  8039b6:	00 00 00 
  8039b9:	ff d0                	callq  *%rax
  8039bb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8039bf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8039c3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8039c7:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8039ce:	00 
  8039cf:	e9 8f 00 00 00       	jmpq   803a63 <devpipe_write+0xcf>
  8039d4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8039d8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8039dc:	48 89 d6             	mov    %rdx,%rsi
  8039df:	48 89 c7             	mov    %rax,%rdi
  8039e2:	48 b8 82 37 80 00 00 	movabs $0x803782,%rax
  8039e9:	00 00 00 
  8039ec:	ff d0                	callq  *%rax
  8039ee:	85 c0                	test   %eax,%eax
  8039f0:	74 07                	je     8039f9 <devpipe_write+0x65>
  8039f2:	b8 00 00 00 00       	mov    $0x0,%eax
  8039f7:	eb 78                	jmp    803a71 <devpipe_write+0xdd>
  8039f9:	48 b8 12 19 80 00 00 	movabs $0x801912,%rax
  803a00:	00 00 00 
  803a03:	ff d0                	callq  *%rax
  803a05:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a09:	8b 40 04             	mov    0x4(%rax),%eax
  803a0c:	48 63 d0             	movslq %eax,%rdx
  803a0f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a13:	8b 00                	mov    (%rax),%eax
  803a15:	48 98                	cltq   
  803a17:	48 83 c0 20          	add    $0x20,%rax
  803a1b:	48 39 c2             	cmp    %rax,%rdx
  803a1e:	73 b4                	jae    8039d4 <devpipe_write+0x40>
  803a20:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a24:	8b 40 04             	mov    0x4(%rax),%eax
  803a27:	99                   	cltd   
  803a28:	c1 ea 1b             	shr    $0x1b,%edx
  803a2b:	01 d0                	add    %edx,%eax
  803a2d:	83 e0 1f             	and    $0x1f,%eax
  803a30:	29 d0                	sub    %edx,%eax
  803a32:	89 c6                	mov    %eax,%esi
  803a34:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803a38:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a3c:	48 01 d0             	add    %rdx,%rax
  803a3f:	0f b6 08             	movzbl (%rax),%ecx
  803a42:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803a46:	48 63 c6             	movslq %esi,%rax
  803a49:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803a4d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a51:	8b 40 04             	mov    0x4(%rax),%eax
  803a54:	8d 50 01             	lea    0x1(%rax),%edx
  803a57:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a5b:	89 50 04             	mov    %edx,0x4(%rax)
  803a5e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803a63:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a67:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803a6b:	72 98                	jb     803a05 <devpipe_write+0x71>
  803a6d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a71:	c9                   	leaveq 
  803a72:	c3                   	retq   

0000000000803a73 <devpipe_stat>:
  803a73:	55                   	push   %rbp
  803a74:	48 89 e5             	mov    %rsp,%rbp
  803a77:	48 83 ec 20          	sub    $0x20,%rsp
  803a7b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803a7f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a83:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a87:	48 89 c7             	mov    %rax,%rdi
  803a8a:	48 b8 6e 1d 80 00 00 	movabs $0x801d6e,%rax
  803a91:	00 00 00 
  803a94:	ff d0                	callq  *%rax
  803a96:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803a9a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a9e:	48 be ce 47 80 00 00 	movabs $0x8047ce,%rsi
  803aa5:	00 00 00 
  803aa8:	48 89 c7             	mov    %rax,%rdi
  803aab:	48 b8 1f 10 80 00 00 	movabs $0x80101f,%rax
  803ab2:	00 00 00 
  803ab5:	ff d0                	callq  *%rax
  803ab7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803abb:	8b 50 04             	mov    0x4(%rax),%edx
  803abe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ac2:	8b 00                	mov    (%rax),%eax
  803ac4:	29 c2                	sub    %eax,%edx
  803ac6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803aca:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803ad0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ad4:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803adb:	00 00 00 
  803ade:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ae2:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  803ae9:	00 00 00 
  803aec:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  803af3:	b8 00 00 00 00       	mov    $0x0,%eax
  803af8:	c9                   	leaveq 
  803af9:	c3                   	retq   

0000000000803afa <devpipe_close>:
  803afa:	55                   	push   %rbp
  803afb:	48 89 e5             	mov    %rsp,%rbp
  803afe:	48 83 ec 10          	sub    $0x10,%rsp
  803b02:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b06:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b0a:	48 89 c6             	mov    %rax,%rsi
  803b0d:	bf 00 00 00 00       	mov    $0x0,%edi
  803b12:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  803b19:	00 00 00 
  803b1c:	ff d0                	callq  *%rax
  803b1e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b22:	48 89 c7             	mov    %rax,%rdi
  803b25:	48 b8 6e 1d 80 00 00 	movabs $0x801d6e,%rax
  803b2c:	00 00 00 
  803b2f:	ff d0                	callq  *%rax
  803b31:	48 89 c6             	mov    %rax,%rsi
  803b34:	bf 00 00 00 00       	mov    $0x0,%edi
  803b39:	48 b8 01 1a 80 00 00 	movabs $0x801a01,%rax
  803b40:	00 00 00 
  803b43:	ff d0                	callq  *%rax
  803b45:	c9                   	leaveq 
  803b46:	c3                   	retq   

0000000000803b47 <cputchar>:
  803b47:	55                   	push   %rbp
  803b48:	48 89 e5             	mov    %rsp,%rbp
  803b4b:	48 83 ec 20          	sub    $0x20,%rsp
  803b4f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b52:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b55:	88 45 ff             	mov    %al,-0x1(%rbp)
  803b58:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  803b5c:	be 01 00 00 00       	mov    $0x1,%esi
  803b61:	48 89 c7             	mov    %rax,%rdi
  803b64:	48 b8 07 18 80 00 00 	movabs $0x801807,%rax
  803b6b:	00 00 00 
  803b6e:	ff d0                	callq  *%rax
  803b70:	90                   	nop
  803b71:	c9                   	leaveq 
  803b72:	c3                   	retq   

0000000000803b73 <getchar>:
  803b73:	55                   	push   %rbp
  803b74:	48 89 e5             	mov    %rsp,%rbp
  803b77:	48 83 ec 10          	sub    $0x10,%rsp
  803b7b:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  803b7f:	ba 01 00 00 00       	mov    $0x1,%edx
  803b84:	48 89 c6             	mov    %rax,%rsi
  803b87:	bf 00 00 00 00       	mov    $0x0,%edi
  803b8c:	48 b8 66 22 80 00 00 	movabs $0x802266,%rax
  803b93:	00 00 00 
  803b96:	ff d0                	callq  *%rax
  803b98:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b9b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b9f:	79 05                	jns    803ba6 <getchar+0x33>
  803ba1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ba4:	eb 14                	jmp    803bba <getchar+0x47>
  803ba6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803baa:	7f 07                	jg     803bb3 <getchar+0x40>
  803bac:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  803bb1:	eb 07                	jmp    803bba <getchar+0x47>
  803bb3:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  803bb7:	0f b6 c0             	movzbl %al,%eax
  803bba:	c9                   	leaveq 
  803bbb:	c3                   	retq   

0000000000803bbc <iscons>:
  803bbc:	55                   	push   %rbp
  803bbd:	48 89 e5             	mov    %rsp,%rbp
  803bc0:	48 83 ec 20          	sub    $0x20,%rsp
  803bc4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803bc7:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803bcb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bce:	48 89 d6             	mov    %rdx,%rsi
  803bd1:	89 c7                	mov    %eax,%edi
  803bd3:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  803bda:	00 00 00 
  803bdd:	ff d0                	callq  *%rax
  803bdf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803be2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803be6:	79 05                	jns    803bed <iscons+0x31>
  803be8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803beb:	eb 1a                	jmp    803c07 <iscons+0x4b>
  803bed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bf1:	8b 10                	mov    (%rax),%edx
  803bf3:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  803bfa:	00 00 00 
  803bfd:	8b 00                	mov    (%rax),%eax
  803bff:	39 c2                	cmp    %eax,%edx
  803c01:	0f 94 c0             	sete   %al
  803c04:	0f b6 c0             	movzbl %al,%eax
  803c07:	c9                   	leaveq 
  803c08:	c3                   	retq   

0000000000803c09 <opencons>:
  803c09:	55                   	push   %rbp
  803c0a:	48 89 e5             	mov    %rsp,%rbp
  803c0d:	48 83 ec 10          	sub    $0x10,%rsp
  803c11:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803c15:	48 89 c7             	mov    %rax,%rdi
  803c18:	48 b8 99 1d 80 00 00 	movabs $0x801d99,%rax
  803c1f:	00 00 00 
  803c22:	ff d0                	callq  *%rax
  803c24:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c27:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c2b:	79 05                	jns    803c32 <opencons+0x29>
  803c2d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c30:	eb 5b                	jmp    803c8d <opencons+0x84>
  803c32:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c36:	ba 07 04 00 00       	mov    $0x407,%edx
  803c3b:	48 89 c6             	mov    %rax,%rsi
  803c3e:	bf 00 00 00 00       	mov    $0x0,%edi
  803c43:	48 b8 4f 19 80 00 00 	movabs $0x80194f,%rax
  803c4a:	00 00 00 
  803c4d:	ff d0                	callq  *%rax
  803c4f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c52:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c56:	79 05                	jns    803c5d <opencons+0x54>
  803c58:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c5b:	eb 30                	jmp    803c8d <opencons+0x84>
  803c5d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c61:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  803c68:	00 00 00 
  803c6b:	8b 12                	mov    (%rdx),%edx
  803c6d:	89 10                	mov    %edx,(%rax)
  803c6f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c73:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803c7a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c7e:	48 89 c7             	mov    %rax,%rdi
  803c81:	48 b8 4b 1d 80 00 00 	movabs $0x801d4b,%rax
  803c88:	00 00 00 
  803c8b:	ff d0                	callq  *%rax
  803c8d:	c9                   	leaveq 
  803c8e:	c3                   	retq   

0000000000803c8f <devcons_read>:
  803c8f:	55                   	push   %rbp
  803c90:	48 89 e5             	mov    %rsp,%rbp
  803c93:	48 83 ec 30          	sub    $0x30,%rsp
  803c97:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803c9b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c9f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803ca3:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803ca8:	75 13                	jne    803cbd <devcons_read+0x2e>
  803caa:	b8 00 00 00 00       	mov    $0x0,%eax
  803caf:	eb 49                	jmp    803cfa <devcons_read+0x6b>
  803cb1:	48 b8 12 19 80 00 00 	movabs $0x801912,%rax
  803cb8:	00 00 00 
  803cbb:	ff d0                	callq  *%rax
  803cbd:	48 b8 54 18 80 00 00 	movabs $0x801854,%rax
  803cc4:	00 00 00 
  803cc7:	ff d0                	callq  *%rax
  803cc9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ccc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cd0:	74 df                	je     803cb1 <devcons_read+0x22>
  803cd2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cd6:	79 05                	jns    803cdd <devcons_read+0x4e>
  803cd8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cdb:	eb 1d                	jmp    803cfa <devcons_read+0x6b>
  803cdd:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  803ce1:	75 07                	jne    803cea <devcons_read+0x5b>
  803ce3:	b8 00 00 00 00       	mov    $0x0,%eax
  803ce8:	eb 10                	jmp    803cfa <devcons_read+0x6b>
  803cea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ced:	89 c2                	mov    %eax,%edx
  803cef:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803cf3:	88 10                	mov    %dl,(%rax)
  803cf5:	b8 01 00 00 00       	mov    $0x1,%eax
  803cfa:	c9                   	leaveq 
  803cfb:	c3                   	retq   

0000000000803cfc <devcons_write>:
  803cfc:	55                   	push   %rbp
  803cfd:	48 89 e5             	mov    %rsp,%rbp
  803d00:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  803d07:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  803d0e:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  803d15:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  803d1c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803d23:	eb 76                	jmp    803d9b <devcons_write+0x9f>
  803d25:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  803d2c:	89 c2                	mov    %eax,%edx
  803d2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d31:	29 c2                	sub    %eax,%edx
  803d33:	89 d0                	mov    %edx,%eax
  803d35:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803d38:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d3b:	83 f8 7f             	cmp    $0x7f,%eax
  803d3e:	76 07                	jbe    803d47 <devcons_write+0x4b>
  803d40:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  803d47:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d4a:	48 63 d0             	movslq %eax,%rdx
  803d4d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d50:	48 63 c8             	movslq %eax,%rcx
  803d53:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  803d5a:	48 01 c1             	add    %rax,%rcx
  803d5d:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803d64:	48 89 ce             	mov    %rcx,%rsi
  803d67:	48 89 c7             	mov    %rax,%rdi
  803d6a:	48 b8 44 13 80 00 00 	movabs $0x801344,%rax
  803d71:	00 00 00 
  803d74:	ff d0                	callq  *%rax
  803d76:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d79:	48 63 d0             	movslq %eax,%rdx
  803d7c:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803d83:	48 89 d6             	mov    %rdx,%rsi
  803d86:	48 89 c7             	mov    %rax,%rdi
  803d89:	48 b8 07 18 80 00 00 	movabs $0x801807,%rax
  803d90:	00 00 00 
  803d93:	ff d0                	callq  *%rax
  803d95:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d98:	01 45 fc             	add    %eax,-0x4(%rbp)
  803d9b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d9e:	48 98                	cltq   
  803da0:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  803da7:	0f 82 78 ff ff ff    	jb     803d25 <devcons_write+0x29>
  803dad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803db0:	c9                   	leaveq 
  803db1:	c3                   	retq   

0000000000803db2 <devcons_close>:
  803db2:	55                   	push   %rbp
  803db3:	48 89 e5             	mov    %rsp,%rbp
  803db6:	48 83 ec 08          	sub    $0x8,%rsp
  803dba:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803dbe:	b8 00 00 00 00       	mov    $0x0,%eax
  803dc3:	c9                   	leaveq 
  803dc4:	c3                   	retq   

0000000000803dc5 <devcons_stat>:
  803dc5:	55                   	push   %rbp
  803dc6:	48 89 e5             	mov    %rsp,%rbp
  803dc9:	48 83 ec 10          	sub    $0x10,%rsp
  803dcd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803dd1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803dd5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dd9:	48 be da 47 80 00 00 	movabs $0x8047da,%rsi
  803de0:	00 00 00 
  803de3:	48 89 c7             	mov    %rax,%rdi
  803de6:	48 b8 1f 10 80 00 00 	movabs $0x80101f,%rax
  803ded:	00 00 00 
  803df0:	ff d0                	callq  *%rax
  803df2:	b8 00 00 00 00       	mov    $0x0,%eax
  803df7:	c9                   	leaveq 
  803df8:	c3                   	retq   

0000000000803df9 <ipc_recv>:
  803df9:	55                   	push   %rbp
  803dfa:	48 89 e5             	mov    %rsp,%rbp
  803dfd:	48 83 ec 30          	sub    $0x30,%rsp
  803e01:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803e05:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803e09:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803e0d:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803e12:	75 0e                	jne    803e22 <ipc_recv+0x29>
  803e14:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803e1b:	00 00 00 
  803e1e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803e22:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e26:	48 89 c7             	mov    %rax,%rdi
  803e29:	48 b8 89 1b 80 00 00 	movabs $0x801b89,%rax
  803e30:	00 00 00 
  803e33:	ff d0                	callq  *%rax
  803e35:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e38:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e3c:	79 27                	jns    803e65 <ipc_recv+0x6c>
  803e3e:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803e43:	74 0a                	je     803e4f <ipc_recv+0x56>
  803e45:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e49:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803e4f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803e54:	74 0a                	je     803e60 <ipc_recv+0x67>
  803e56:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e5a:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803e60:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e63:	eb 53                	jmp    803eb8 <ipc_recv+0xbf>
  803e65:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803e6a:	74 19                	je     803e85 <ipc_recv+0x8c>
  803e6c:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803e73:	00 00 00 
  803e76:	48 8b 00             	mov    (%rax),%rax
  803e79:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  803e7f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e83:	89 10                	mov    %edx,(%rax)
  803e85:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803e8a:	74 19                	je     803ea5 <ipc_recv+0xac>
  803e8c:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803e93:	00 00 00 
  803e96:	48 8b 00             	mov    (%rax),%rax
  803e99:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  803e9f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ea3:	89 10                	mov    %edx,(%rax)
  803ea5:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803eac:	00 00 00 
  803eaf:	48 8b 00             	mov    (%rax),%rax
  803eb2:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  803eb8:	c9                   	leaveq 
  803eb9:	c3                   	retq   

0000000000803eba <ipc_send>:
  803eba:	55                   	push   %rbp
  803ebb:	48 89 e5             	mov    %rsp,%rbp
  803ebe:	48 83 ec 30          	sub    $0x30,%rsp
  803ec2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ec5:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803ec8:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  803ecc:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803ecf:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803ed4:	75 1c                	jne    803ef2 <ipc_send+0x38>
  803ed6:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803edd:	00 00 00 
  803ee0:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803ee4:	eb 0c                	jmp    803ef2 <ipc_send+0x38>
  803ee6:	48 b8 12 19 80 00 00 	movabs $0x801912,%rax
  803eed:	00 00 00 
  803ef0:	ff d0                	callq  *%rax
  803ef2:	8b 75 e8             	mov    -0x18(%rbp),%esi
  803ef5:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  803ef8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803efc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803eff:	89 c7                	mov    %eax,%edi
  803f01:	48 b8 32 1b 80 00 00 	movabs $0x801b32,%rax
  803f08:	00 00 00 
  803f0b:	ff d0                	callq  *%rax
  803f0d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f10:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  803f14:	74 d0                	je     803ee6 <ipc_send+0x2c>
  803f16:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f1a:	79 30                	jns    803f4c <ipc_send+0x92>
  803f1c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f1f:	89 c1                	mov    %eax,%ecx
  803f21:	48 ba e8 47 80 00 00 	movabs $0x8047e8,%rdx
  803f28:	00 00 00 
  803f2b:	be 44 00 00 00       	mov    $0x44,%esi
  803f30:	48 bf fe 47 80 00 00 	movabs $0x8047fe,%rdi
  803f37:	00 00 00 
  803f3a:	b8 00 00 00 00       	mov    $0x0,%eax
  803f3f:	49 b8 55 02 80 00 00 	movabs $0x800255,%r8
  803f46:	00 00 00 
  803f49:	41 ff d0             	callq  *%r8
  803f4c:	90                   	nop
  803f4d:	c9                   	leaveq 
  803f4e:	c3                   	retq   

0000000000803f4f <ipc_host_recv>:
  803f4f:	55                   	push   %rbp
  803f50:	48 89 e5             	mov    %rsp,%rbp
  803f53:	48 83 ec 10          	sub    $0x10,%rsp
  803f57:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803f5b:	48 ba 10 48 80 00 00 	movabs $0x804810,%rdx
  803f62:	00 00 00 
  803f65:	be 4e 00 00 00       	mov    $0x4e,%esi
  803f6a:	48 bf fe 47 80 00 00 	movabs $0x8047fe,%rdi
  803f71:	00 00 00 
  803f74:	b8 00 00 00 00       	mov    $0x0,%eax
  803f79:	48 b9 55 02 80 00 00 	movabs $0x800255,%rcx
  803f80:	00 00 00 
  803f83:	ff d1                	callq  *%rcx

0000000000803f85 <ipc_host_send>:
  803f85:	55                   	push   %rbp
  803f86:	48 89 e5             	mov    %rsp,%rbp
  803f89:	48 83 ec 20          	sub    $0x20,%rsp
  803f8d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f90:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803f93:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  803f97:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803f9a:	48 ba 30 48 80 00 00 	movabs $0x804830,%rdx
  803fa1:	00 00 00 
  803fa4:	be 58 00 00 00       	mov    $0x58,%esi
  803fa9:	48 bf fe 47 80 00 00 	movabs $0x8047fe,%rdi
  803fb0:	00 00 00 
  803fb3:	b8 00 00 00 00       	mov    $0x0,%eax
  803fb8:	48 b9 55 02 80 00 00 	movabs $0x800255,%rcx
  803fbf:	00 00 00 
  803fc2:	ff d1                	callq  *%rcx

0000000000803fc4 <ipc_find_env>:
  803fc4:	55                   	push   %rbp
  803fc5:	48 89 e5             	mov    %rsp,%rbp
  803fc8:	48 83 ec 18          	sub    $0x18,%rsp
  803fcc:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803fcf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803fd6:	eb 4d                	jmp    804025 <ipc_find_env+0x61>
  803fd8:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  803fdf:	00 00 00 
  803fe2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fe5:	48 98                	cltq   
  803fe7:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  803fee:	48 01 d0             	add    %rdx,%rax
  803ff1:	48 05 d0 00 00 00    	add    $0xd0,%rax
  803ff7:	8b 00                	mov    (%rax),%eax
  803ff9:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  803ffc:	75 23                	jne    804021 <ipc_find_env+0x5d>
  803ffe:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804005:	00 00 00 
  804008:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80400b:	48 98                	cltq   
  80400d:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804014:	48 01 d0             	add    %rdx,%rax
  804017:	48 05 c8 00 00 00    	add    $0xc8,%rax
  80401d:	8b 00                	mov    (%rax),%eax
  80401f:	eb 12                	jmp    804033 <ipc_find_env+0x6f>
  804021:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804025:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  80402c:	7e aa                	jle    803fd8 <ipc_find_env+0x14>
  80402e:	b8 00 00 00 00       	mov    $0x0,%eax
  804033:	c9                   	leaveq 
  804034:	c3                   	retq   

0000000000804035 <pageref>:
  804035:	55                   	push   %rbp
  804036:	48 89 e5             	mov    %rsp,%rbp
  804039:	48 83 ec 18          	sub    $0x18,%rsp
  80403d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804041:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804045:	48 c1 e8 15          	shr    $0x15,%rax
  804049:	48 89 c2             	mov    %rax,%rdx
  80404c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804053:	01 00 00 
  804056:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80405a:	83 e0 01             	and    $0x1,%eax
  80405d:	48 85 c0             	test   %rax,%rax
  804060:	75 07                	jne    804069 <pageref+0x34>
  804062:	b8 00 00 00 00       	mov    $0x0,%eax
  804067:	eb 56                	jmp    8040bf <pageref+0x8a>
  804069:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80406d:	48 c1 e8 0c          	shr    $0xc,%rax
  804071:	48 89 c2             	mov    %rax,%rdx
  804074:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80407b:	01 00 00 
  80407e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804082:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804086:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80408a:	83 e0 01             	and    $0x1,%eax
  80408d:	48 85 c0             	test   %rax,%rax
  804090:	75 07                	jne    804099 <pageref+0x64>
  804092:	b8 00 00 00 00       	mov    $0x0,%eax
  804097:	eb 26                	jmp    8040bf <pageref+0x8a>
  804099:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80409d:	48 c1 e8 0c          	shr    $0xc,%rax
  8040a1:	48 89 c2             	mov    %rax,%rdx
  8040a4:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8040ab:	00 00 00 
  8040ae:	48 c1 e2 04          	shl    $0x4,%rdx
  8040b2:	48 01 d0             	add    %rdx,%rax
  8040b5:	48 83 c0 08          	add    $0x8,%rax
  8040b9:	0f b7 00             	movzwl (%rax),%eax
  8040bc:	0f b7 c0             	movzwl %ax,%eax
  8040bf:	c9                   	leaveq 
  8040c0:	c3                   	retq   
