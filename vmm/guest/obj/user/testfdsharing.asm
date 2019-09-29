
vmm/guest/obj/user/testfdsharing:     file format elf64-x86-64


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

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800052:	be 00 00 00 00       	mov    $0x0,%esi
  800057:	48 bf 40 4a 80 00 00 	movabs $0x804a40,%rdi
  80005e:	00 00 00 
  800061:	48 b8 e6 2e 80 00 00 	movabs $0x802ee6,%rax
  800068:	00 00 00 
  80006b:	ff d0                	callq  *%rax
  80006d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800070:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800074:	79 30                	jns    8000a6 <umain+0x63>
  800076:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800079:	89 c1                	mov    %eax,%ecx
  80007b:	48 ba 45 4a 80 00 00 	movabs $0x804a45,%rdx
  800082:	00 00 00 
  800085:	be 0d 00 00 00       	mov    $0xd,%esi
  80008a:	48 bf 53 4a 80 00 00 	movabs $0x804a53,%rdi
  800091:	00 00 00 
  800094:	b8 00 00 00 00       	mov    $0x0,%eax
  800099:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  8000a0:	00 00 00 
  8000a3:	41 ff d0             	callq  *%r8
  8000a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000a9:	be 00 00 00 00       	mov    $0x0,%esi
  8000ae:	89 c7                	mov    %eax,%edi
  8000b0:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  8000b7:	00 00 00 
  8000ba:	ff d0                	callq  *%rax
  8000bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000bf:	ba 00 02 00 00       	mov    $0x200,%edx
  8000c4:	48 be 20 82 80 00 00 	movabs $0x808220,%rsi
  8000cb:	00 00 00 
  8000ce:	89 c7                	mov    %eax,%edi
  8000d0:	48 b8 e2 2a 80 00 00 	movabs $0x802ae2,%rax
  8000d7:	00 00 00 
  8000da:	ff d0                	callq  *%rax
  8000dc:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8000df:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000e3:	7f 30                	jg     800115 <umain+0xd2>
  8000e5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000e8:	89 c1                	mov    %eax,%ecx
  8000ea:	48 ba 6b 4a 80 00 00 	movabs $0x804a6b,%rdx
  8000f1:	00 00 00 
  8000f4:	be 10 00 00 00       	mov    $0x10,%esi
  8000f9:	48 bf 53 4a 80 00 00 	movabs $0x804a53,%rdi
  800100:	00 00 00 
  800103:	b8 00 00 00 00       	mov    $0x0,%eax
  800108:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  80010f:	00 00 00 
  800112:	41 ff d0             	callq  *%r8
  800115:	48 b8 7b 22 80 00 00 	movabs $0x80227b,%rax
  80011c:	00 00 00 
  80011f:	ff d0                	callq  *%rax
  800121:	89 45 f4             	mov    %eax,-0xc(%rbp)
  800124:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  800128:	79 30                	jns    80015a <umain+0x117>
  80012a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80012d:	89 c1                	mov    %eax,%ecx
  80012f:	48 ba 75 4a 80 00 00 	movabs $0x804a75,%rdx
  800136:	00 00 00 
  800139:	be 13 00 00 00       	mov    $0x13,%esi
  80013e:	48 bf 53 4a 80 00 00 	movabs $0x804a53,%rdi
  800145:	00 00 00 
  800148:	b8 00 00 00 00       	mov    $0x0,%eax
  80014d:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  800154:	00 00 00 
  800157:	41 ff d0             	callq  *%r8
  80015a:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80015e:	0f 85 36 01 00 00    	jne    80029a <umain+0x257>
  800164:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800167:	be 00 00 00 00       	mov    $0x0,%esi
  80016c:	89 c7                	mov    %eax,%edi
  80016e:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  800175:	00 00 00 
  800178:	ff d0                	callq  *%rax
  80017a:	48 bf 80 4a 80 00 00 	movabs $0x804a80,%rdi
  800181:	00 00 00 
  800184:	b8 00 00 00 00       	mov    $0x0,%eax
  800189:	48 ba 1e 06 80 00 00 	movabs $0x80061e,%rdx
  800190:	00 00 00 
  800193:	ff d2                	callq  *%rdx
  800195:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800198:	ba 00 02 00 00       	mov    $0x200,%edx
  80019d:	48 be 20 80 80 00 00 	movabs $0x808020,%rsi
  8001a4:	00 00 00 
  8001a7:	89 c7                	mov    %eax,%edi
  8001a9:	48 b8 e2 2a 80 00 00 	movabs $0x802ae2,%rax
  8001b0:	00 00 00 
  8001b3:	ff d0                	callq  *%rax
  8001b5:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8001b8:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8001bb:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  8001be:	74 36                	je     8001f6 <umain+0x1b3>
  8001c0:	8b 55 f0             	mov    -0x10(%rbp),%edx
  8001c3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8001c6:	41 89 d0             	mov    %edx,%r8d
  8001c9:	89 c1                	mov    %eax,%ecx
  8001cb:	48 ba c8 4a 80 00 00 	movabs $0x804ac8,%rdx
  8001d2:	00 00 00 
  8001d5:	be 18 00 00 00       	mov    $0x18,%esi
  8001da:	48 bf 53 4a 80 00 00 	movabs $0x804a53,%rdi
  8001e1:	00 00 00 
  8001e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8001e9:	49 b9 e4 03 80 00 00 	movabs $0x8003e4,%r9
  8001f0:	00 00 00 
  8001f3:	41 ff d1             	callq  *%r9
  8001f6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8001f9:	48 98                	cltq   
  8001fb:	48 89 c2             	mov    %rax,%rdx
  8001fe:	48 be 20 80 80 00 00 	movabs $0x808020,%rsi
  800205:	00 00 00 
  800208:	48 bf 20 82 80 00 00 	movabs $0x808220,%rdi
  80020f:	00 00 00 
  800212:	48 b8 1e 16 80 00 00 	movabs $0x80161e,%rax
  800219:	00 00 00 
  80021c:	ff d0                	callq  *%rax
  80021e:	85 c0                	test   %eax,%eax
  800220:	74 2a                	je     80024c <umain+0x209>
  800222:	48 ba f8 4a 80 00 00 	movabs $0x804af8,%rdx
  800229:	00 00 00 
  80022c:	be 1a 00 00 00       	mov    $0x1a,%esi
  800231:	48 bf 53 4a 80 00 00 	movabs $0x804a53,%rdi
  800238:	00 00 00 
  80023b:	b8 00 00 00 00       	mov    $0x0,%eax
  800240:	48 b9 e4 03 80 00 00 	movabs $0x8003e4,%rcx
  800247:	00 00 00 
  80024a:	ff d1                	callq  *%rcx
  80024c:	48 bf 2e 4b 80 00 00 	movabs $0x804b2e,%rdi
  800253:	00 00 00 
  800256:	b8 00 00 00 00       	mov    $0x0,%eax
  80025b:	48 ba 1e 06 80 00 00 	movabs $0x80061e,%rdx
  800262:	00 00 00 
  800265:	ff d2                	callq  *%rdx
  800267:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80026a:	be 00 00 00 00       	mov    $0x0,%esi
  80026f:	89 c7                	mov    %eax,%edi
  800271:	48 b8 2c 2c 80 00 00 	movabs $0x802c2c,%rax
  800278:	00 00 00 
  80027b:	ff d0                	callq  *%rax
  80027d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800280:	89 c7                	mov    %eax,%edi
  800282:	48 b8 ea 27 80 00 00 	movabs $0x8027ea,%rax
  800289:	00 00 00 
  80028c:	ff d0                	callq  *%rax
  80028e:	48 b8 c0 03 80 00 00 	movabs $0x8003c0,%rax
  800295:	00 00 00 
  800298:	ff d0                	callq  *%rax
  80029a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80029d:	89 c7                	mov    %eax,%edi
  80029f:	48 b8 ee 42 80 00 00 	movabs $0x8042ee,%rax
  8002a6:	00 00 00 
  8002a9:	ff d0                	callq  *%rax
  8002ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002ae:	ba 00 02 00 00       	mov    $0x200,%edx
  8002b3:	48 be 20 80 80 00 00 	movabs $0x808020,%rsi
  8002ba:	00 00 00 
  8002bd:	89 c7                	mov    %eax,%edi
  8002bf:	48 b8 e2 2a 80 00 00 	movabs $0x802ae2,%rax
  8002c6:	00 00 00 
  8002c9:	ff d0                	callq  *%rax
  8002cb:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8002ce:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8002d1:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  8002d4:	74 36                	je     80030c <umain+0x2c9>
  8002d6:	8b 55 f0             	mov    -0x10(%rbp),%edx
  8002d9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8002dc:	41 89 d0             	mov    %edx,%r8d
  8002df:	89 c1                	mov    %eax,%ecx
  8002e1:	48 ba 48 4b 80 00 00 	movabs $0x804b48,%rdx
  8002e8:	00 00 00 
  8002eb:	be 22 00 00 00       	mov    $0x22,%esi
  8002f0:	48 bf 53 4a 80 00 00 	movabs $0x804a53,%rdi
  8002f7:	00 00 00 
  8002fa:	b8 00 00 00 00       	mov    $0x0,%eax
  8002ff:	49 b9 e4 03 80 00 00 	movabs $0x8003e4,%r9
  800306:	00 00 00 
  800309:	41 ff d1             	callq  *%r9
  80030c:	48 bf 6b 4b 80 00 00 	movabs $0x804b6b,%rdi
  800313:	00 00 00 
  800316:	b8 00 00 00 00       	mov    $0x0,%eax
  80031b:	48 ba 1e 06 80 00 00 	movabs $0x80061e,%rdx
  800322:	00 00 00 
  800325:	ff d2                	callq  *%rdx
  800327:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80032a:	89 c7                	mov    %eax,%edi
  80032c:	48 b8 ea 27 80 00 00 	movabs $0x8027ea,%rax
  800333:	00 00 00 
  800336:	ff d0                	callq  *%rax
static __inline void read_gdtr (uint64_t *gdtbase, uint16_t *gdtlimit) __attribute__((always_inline));

static __inline void
breakpoint(void)
{
	__asm __volatile("int3");
  800338:	cc                   	int3   
  800339:	90                   	nop
  80033a:	c9                   	leaveq 
  80033b:	c3                   	retq   

000000000080033c <libmain>:
  80033c:	55                   	push   %rbp
  80033d:	48 89 e5             	mov    %rsp,%rbp
  800340:	48 83 ec 10          	sub    $0x10,%rsp
  800344:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800347:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80034b:	48 b8 65 1a 80 00 00 	movabs $0x801a65,%rax
  800352:	00 00 00 
  800355:	ff d0                	callq  *%rax
  800357:	25 ff 03 00 00       	and    $0x3ff,%eax
  80035c:	48 98                	cltq   
  80035e:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800365:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80036c:	00 00 00 
  80036f:	48 01 c2             	add    %rax,%rdx
  800372:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  800379:	00 00 00 
  80037c:	48 89 10             	mov    %rdx,(%rax)
  80037f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800383:	7e 14                	jle    800399 <libmain+0x5d>
  800385:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800389:	48 8b 10             	mov    (%rax),%rdx
  80038c:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800393:	00 00 00 
  800396:	48 89 10             	mov    %rdx,(%rax)
  800399:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80039d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003a0:	48 89 d6             	mov    %rdx,%rsi
  8003a3:	89 c7                	mov    %eax,%edi
  8003a5:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
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
  8003c4:	48 b8 35 28 80 00 00 	movabs $0x802835,%rax
  8003cb:	00 00 00 
  8003ce:	ff d0                	callq  *%rax
  8003d0:	bf 00 00 00 00       	mov    $0x0,%edi
  8003d5:	48 b8 1f 1a 80 00 00 	movabs $0x801a1f,%rax
  8003dc:	00 00 00 
  8003df:	ff d0                	callq  *%rax
  8003e1:	90                   	nop
  8003e2:	5d                   	pop    %rbp
  8003e3:	c3                   	retq   

00000000008003e4 <_panic>:
  8003e4:	55                   	push   %rbp
  8003e5:	48 89 e5             	mov    %rsp,%rbp
  8003e8:	53                   	push   %rbx
  8003e9:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8003f0:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8003f7:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8003fd:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800404:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  80040b:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800412:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800419:	84 c0                	test   %al,%al
  80041b:	74 23                	je     800440 <_panic+0x5c>
  80041d:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800424:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800428:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  80042c:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800430:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800434:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800438:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  80043c:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800440:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800447:	00 00 00 
  80044a:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800451:	00 00 00 
  800454:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800458:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80045f:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800466:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80046d:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800474:	00 00 00 
  800477:	48 8b 18             	mov    (%rax),%rbx
  80047a:	48 b8 65 1a 80 00 00 	movabs $0x801a65,%rax
  800481:	00 00 00 
  800484:	ff d0                	callq  *%rax
  800486:	89 c6                	mov    %eax,%esi
  800488:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  80048e:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  800495:	41 89 d0             	mov    %edx,%r8d
  800498:	48 89 c1             	mov    %rax,%rcx
  80049b:	48 89 da             	mov    %rbx,%rdx
  80049e:	48 bf 90 4b 80 00 00 	movabs $0x804b90,%rdi
  8004a5:	00 00 00 
  8004a8:	b8 00 00 00 00       	mov    $0x0,%eax
  8004ad:	49 b9 1e 06 80 00 00 	movabs $0x80061e,%r9
  8004b4:	00 00 00 
  8004b7:	41 ff d1             	callq  *%r9
  8004ba:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8004c1:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8004c8:	48 89 d6             	mov    %rdx,%rsi
  8004cb:	48 89 c7             	mov    %rax,%rdi
  8004ce:	48 b8 72 05 80 00 00 	movabs $0x800572,%rax
  8004d5:	00 00 00 
  8004d8:	ff d0                	callq  *%rax
  8004da:	48 bf b3 4b 80 00 00 	movabs $0x804bb3,%rdi
  8004e1:	00 00 00 
  8004e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8004e9:	48 ba 1e 06 80 00 00 	movabs $0x80061e,%rdx
  8004f0:	00 00 00 
  8004f3:	ff d2                	callq  *%rdx
  8004f5:	cc                   	int3   
  8004f6:	eb fd                	jmp    8004f5 <_panic+0x111>

00000000008004f8 <putch>:
  8004f8:	55                   	push   %rbp
  8004f9:	48 89 e5             	mov    %rsp,%rbp
  8004fc:	48 83 ec 10          	sub    $0x10,%rsp
  800500:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800503:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800507:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80050b:	8b 00                	mov    (%rax),%eax
  80050d:	8d 48 01             	lea    0x1(%rax),%ecx
  800510:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800514:	89 0a                	mov    %ecx,(%rdx)
  800516:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800519:	89 d1                	mov    %edx,%ecx
  80051b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80051f:	48 98                	cltq   
  800521:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800525:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800529:	8b 00                	mov    (%rax),%eax
  80052b:	3d ff 00 00 00       	cmp    $0xff,%eax
  800530:	75 2c                	jne    80055e <putch+0x66>
  800532:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800536:	8b 00                	mov    (%rax),%eax
  800538:	48 98                	cltq   
  80053a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80053e:	48 83 c2 08          	add    $0x8,%rdx
  800542:	48 89 c6             	mov    %rax,%rsi
  800545:	48 89 d7             	mov    %rdx,%rdi
  800548:	48 b8 96 19 80 00 00 	movabs $0x801996,%rax
  80054f:	00 00 00 
  800552:	ff d0                	callq  *%rax
  800554:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800558:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80055e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800562:	8b 40 04             	mov    0x4(%rax),%eax
  800565:	8d 50 01             	lea    0x1(%rax),%edx
  800568:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80056c:	89 50 04             	mov    %edx,0x4(%rax)
  80056f:	90                   	nop
  800570:	c9                   	leaveq 
  800571:	c3                   	retq   

0000000000800572 <vcprintf>:
  800572:	55                   	push   %rbp
  800573:	48 89 e5             	mov    %rsp,%rbp
  800576:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  80057d:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800584:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  80058b:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800592:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800599:	48 8b 0a             	mov    (%rdx),%rcx
  80059c:	48 89 08             	mov    %rcx,(%rax)
  80059f:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8005a3:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8005a7:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8005ab:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8005af:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8005b6:	00 00 00 
  8005b9:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8005c0:	00 00 00 
  8005c3:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8005ca:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8005d1:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8005d8:	48 89 c6             	mov    %rax,%rsi
  8005db:	48 bf f8 04 80 00 00 	movabs $0x8004f8,%rdi
  8005e2:	00 00 00 
  8005e5:	48 b8 bc 09 80 00 00 	movabs $0x8009bc,%rax
  8005ec:	00 00 00 
  8005ef:	ff d0                	callq  *%rax
  8005f1:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8005f7:	48 98                	cltq   
  8005f9:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800600:	48 83 c2 08          	add    $0x8,%rdx
  800604:	48 89 c6             	mov    %rax,%rsi
  800607:	48 89 d7             	mov    %rdx,%rdi
  80060a:	48 b8 96 19 80 00 00 	movabs $0x801996,%rax
  800611:	00 00 00 
  800614:	ff d0                	callq  *%rax
  800616:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  80061c:	c9                   	leaveq 
  80061d:	c3                   	retq   

000000000080061e <cprintf>:
  80061e:	55                   	push   %rbp
  80061f:	48 89 e5             	mov    %rsp,%rbp
  800622:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800629:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800630:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800637:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80063e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800645:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80064c:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800653:	84 c0                	test   %al,%al
  800655:	74 20                	je     800677 <cprintf+0x59>
  800657:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80065b:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80065f:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800663:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800667:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80066b:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80066f:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800673:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800677:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80067e:	00 00 00 
  800681:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800688:	00 00 00 
  80068b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80068f:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800696:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80069d:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8006a4:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8006ab:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8006b2:	48 8b 0a             	mov    (%rdx),%rcx
  8006b5:	48 89 08             	mov    %rcx,(%rax)
  8006b8:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8006bc:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8006c0:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8006c4:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8006c8:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8006cf:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8006d6:	48 89 d6             	mov    %rdx,%rsi
  8006d9:	48 89 c7             	mov    %rax,%rdi
  8006dc:	48 b8 72 05 80 00 00 	movabs $0x800572,%rax
  8006e3:	00 00 00 
  8006e6:	ff d0                	callq  *%rax
  8006e8:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8006ee:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8006f4:	c9                   	leaveq 
  8006f5:	c3                   	retq   

00000000008006f6 <printnum>:
  8006f6:	55                   	push   %rbp
  8006f7:	48 89 e5             	mov    %rsp,%rbp
  8006fa:	48 83 ec 30          	sub    $0x30,%rsp
  8006fe:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800702:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800706:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80070a:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  80070d:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  800711:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  800715:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800718:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  80071c:	77 54                	ja     800772 <printnum+0x7c>
  80071e:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800721:	8d 78 ff             	lea    -0x1(%rax),%edi
  800724:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800727:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80072b:	ba 00 00 00 00       	mov    $0x0,%edx
  800730:	48 f7 f6             	div    %rsi
  800733:	49 89 c2             	mov    %rax,%r10
  800736:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800739:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80073c:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  800740:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800744:	41 89 c9             	mov    %ecx,%r9d
  800747:	41 89 f8             	mov    %edi,%r8d
  80074a:	89 d1                	mov    %edx,%ecx
  80074c:	4c 89 d2             	mov    %r10,%rdx
  80074f:	48 89 c7             	mov    %rax,%rdi
  800752:	48 b8 f6 06 80 00 00 	movabs $0x8006f6,%rax
  800759:	00 00 00 
  80075c:	ff d0                	callq  *%rax
  80075e:	eb 1c                	jmp    80077c <printnum+0x86>
  800760:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800764:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800767:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80076b:	48 89 ce             	mov    %rcx,%rsi
  80076e:	89 d7                	mov    %edx,%edi
  800770:	ff d0                	callq  *%rax
  800772:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  800776:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  80077a:	7f e4                	jg     800760 <printnum+0x6a>
  80077c:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80077f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800783:	ba 00 00 00 00       	mov    $0x0,%edx
  800788:	48 f7 f1             	div    %rcx
  80078b:	48 b8 b0 4d 80 00 00 	movabs $0x804db0,%rax
  800792:	00 00 00 
  800795:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  800799:	0f be d0             	movsbl %al,%edx
  80079c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8007a0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8007a4:	48 89 ce             	mov    %rcx,%rsi
  8007a7:	89 d7                	mov    %edx,%edi
  8007a9:	ff d0                	callq  *%rax
  8007ab:	90                   	nop
  8007ac:	c9                   	leaveq 
  8007ad:	c3                   	retq   

00000000008007ae <getuint>:
  8007ae:	55                   	push   %rbp
  8007af:	48 89 e5             	mov    %rsp,%rbp
  8007b2:	48 83 ec 20          	sub    $0x20,%rsp
  8007b6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8007ba:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8007bd:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8007c1:	7e 4f                	jle    800812 <getuint+0x64>
  8007c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007c7:	8b 00                	mov    (%rax),%eax
  8007c9:	83 f8 30             	cmp    $0x30,%eax
  8007cc:	73 24                	jae    8007f2 <getuint+0x44>
  8007ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007d2:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007da:	8b 00                	mov    (%rax),%eax
  8007dc:	89 c0                	mov    %eax,%eax
  8007de:	48 01 d0             	add    %rdx,%rax
  8007e1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007e5:	8b 12                	mov    (%rdx),%edx
  8007e7:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007ea:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007ee:	89 0a                	mov    %ecx,(%rdx)
  8007f0:	eb 14                	jmp    800806 <getuint+0x58>
  8007f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007f6:	48 8b 40 08          	mov    0x8(%rax),%rax
  8007fa:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8007fe:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800802:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800806:	48 8b 00             	mov    (%rax),%rax
  800809:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80080d:	e9 9d 00 00 00       	jmpq   8008af <getuint+0x101>
  800812:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800816:	74 4c                	je     800864 <getuint+0xb6>
  800818:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80081c:	8b 00                	mov    (%rax),%eax
  80081e:	83 f8 30             	cmp    $0x30,%eax
  800821:	73 24                	jae    800847 <getuint+0x99>
  800823:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800827:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80082b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80082f:	8b 00                	mov    (%rax),%eax
  800831:	89 c0                	mov    %eax,%eax
  800833:	48 01 d0             	add    %rdx,%rax
  800836:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80083a:	8b 12                	mov    (%rdx),%edx
  80083c:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80083f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800843:	89 0a                	mov    %ecx,(%rdx)
  800845:	eb 14                	jmp    80085b <getuint+0xad>
  800847:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80084b:	48 8b 40 08          	mov    0x8(%rax),%rax
  80084f:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800853:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800857:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80085b:	48 8b 00             	mov    (%rax),%rax
  80085e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800862:	eb 4b                	jmp    8008af <getuint+0x101>
  800864:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800868:	8b 00                	mov    (%rax),%eax
  80086a:	83 f8 30             	cmp    $0x30,%eax
  80086d:	73 24                	jae    800893 <getuint+0xe5>
  80086f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800873:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800877:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80087b:	8b 00                	mov    (%rax),%eax
  80087d:	89 c0                	mov    %eax,%eax
  80087f:	48 01 d0             	add    %rdx,%rax
  800882:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800886:	8b 12                	mov    (%rdx),%edx
  800888:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80088b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80088f:	89 0a                	mov    %ecx,(%rdx)
  800891:	eb 14                	jmp    8008a7 <getuint+0xf9>
  800893:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800897:	48 8b 40 08          	mov    0x8(%rax),%rax
  80089b:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80089f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008a3:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008a7:	8b 00                	mov    (%rax),%eax
  8008a9:	89 c0                	mov    %eax,%eax
  8008ab:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8008b3:	c9                   	leaveq 
  8008b4:	c3                   	retq   

00000000008008b5 <getint>:
  8008b5:	55                   	push   %rbp
  8008b6:	48 89 e5             	mov    %rsp,%rbp
  8008b9:	48 83 ec 20          	sub    $0x20,%rsp
  8008bd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8008c1:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8008c4:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8008c8:	7e 4f                	jle    800919 <getint+0x64>
  8008ca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008ce:	8b 00                	mov    (%rax),%eax
  8008d0:	83 f8 30             	cmp    $0x30,%eax
  8008d3:	73 24                	jae    8008f9 <getint+0x44>
  8008d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008d9:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008e1:	8b 00                	mov    (%rax),%eax
  8008e3:	89 c0                	mov    %eax,%eax
  8008e5:	48 01 d0             	add    %rdx,%rax
  8008e8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008ec:	8b 12                	mov    (%rdx),%edx
  8008ee:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008f1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008f5:	89 0a                	mov    %ecx,(%rdx)
  8008f7:	eb 14                	jmp    80090d <getint+0x58>
  8008f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008fd:	48 8b 40 08          	mov    0x8(%rax),%rax
  800901:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800905:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800909:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80090d:	48 8b 00             	mov    (%rax),%rax
  800910:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800914:	e9 9d 00 00 00       	jmpq   8009b6 <getint+0x101>
  800919:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80091d:	74 4c                	je     80096b <getint+0xb6>
  80091f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800923:	8b 00                	mov    (%rax),%eax
  800925:	83 f8 30             	cmp    $0x30,%eax
  800928:	73 24                	jae    80094e <getint+0x99>
  80092a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80092e:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800932:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800936:	8b 00                	mov    (%rax),%eax
  800938:	89 c0                	mov    %eax,%eax
  80093a:	48 01 d0             	add    %rdx,%rax
  80093d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800941:	8b 12                	mov    (%rdx),%edx
  800943:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800946:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80094a:	89 0a                	mov    %ecx,(%rdx)
  80094c:	eb 14                	jmp    800962 <getint+0xad>
  80094e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800952:	48 8b 40 08          	mov    0x8(%rax),%rax
  800956:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80095a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80095e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800962:	48 8b 00             	mov    (%rax),%rax
  800965:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800969:	eb 4b                	jmp    8009b6 <getint+0x101>
  80096b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80096f:	8b 00                	mov    (%rax),%eax
  800971:	83 f8 30             	cmp    $0x30,%eax
  800974:	73 24                	jae    80099a <getint+0xe5>
  800976:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80097a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80097e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800982:	8b 00                	mov    (%rax),%eax
  800984:	89 c0                	mov    %eax,%eax
  800986:	48 01 d0             	add    %rdx,%rax
  800989:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80098d:	8b 12                	mov    (%rdx),%edx
  80098f:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800992:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800996:	89 0a                	mov    %ecx,(%rdx)
  800998:	eb 14                	jmp    8009ae <getint+0xf9>
  80099a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80099e:	48 8b 40 08          	mov    0x8(%rax),%rax
  8009a2:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8009a6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009aa:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009ae:	8b 00                	mov    (%rax),%eax
  8009b0:	48 98                	cltq   
  8009b2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8009b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8009ba:	c9                   	leaveq 
  8009bb:	c3                   	retq   

00000000008009bc <vprintfmt>:
  8009bc:	55                   	push   %rbp
  8009bd:	48 89 e5             	mov    %rsp,%rbp
  8009c0:	41 54                	push   %r12
  8009c2:	53                   	push   %rbx
  8009c3:	48 83 ec 60          	sub    $0x60,%rsp
  8009c7:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8009cb:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8009cf:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8009d3:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8009d7:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8009db:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8009df:	48 8b 0a             	mov    (%rdx),%rcx
  8009e2:	48 89 08             	mov    %rcx,(%rax)
  8009e5:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8009e9:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8009ed:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8009f1:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8009f5:	eb 17                	jmp    800a0e <vprintfmt+0x52>
  8009f7:	85 db                	test   %ebx,%ebx
  8009f9:	0f 84 b9 04 00 00    	je     800eb8 <vprintfmt+0x4fc>
  8009ff:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a03:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a07:	48 89 d6             	mov    %rdx,%rsi
  800a0a:	89 df                	mov    %ebx,%edi
  800a0c:	ff d0                	callq  *%rax
  800a0e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a12:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800a16:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a1a:	0f b6 00             	movzbl (%rax),%eax
  800a1d:	0f b6 d8             	movzbl %al,%ebx
  800a20:	83 fb 25             	cmp    $0x25,%ebx
  800a23:	75 d2                	jne    8009f7 <vprintfmt+0x3b>
  800a25:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800a29:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800a30:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a37:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800a3e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800a45:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a49:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800a4d:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a51:	0f b6 00             	movzbl (%rax),%eax
  800a54:	0f b6 d8             	movzbl %al,%ebx
  800a57:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800a5a:	83 f8 55             	cmp    $0x55,%eax
  800a5d:	0f 87 22 04 00 00    	ja     800e85 <vprintfmt+0x4c9>
  800a63:	89 c0                	mov    %eax,%eax
  800a65:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800a6c:	00 
  800a6d:	48 b8 d8 4d 80 00 00 	movabs $0x804dd8,%rax
  800a74:	00 00 00 
  800a77:	48 01 d0             	add    %rdx,%rax
  800a7a:	48 8b 00             	mov    (%rax),%rax
  800a7d:	ff e0                	jmpq   *%rax
  800a7f:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800a83:	eb c0                	jmp    800a45 <vprintfmt+0x89>
  800a85:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800a89:	eb ba                	jmp    800a45 <vprintfmt+0x89>
  800a8b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800a92:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800a95:	89 d0                	mov    %edx,%eax
  800a97:	c1 e0 02             	shl    $0x2,%eax
  800a9a:	01 d0                	add    %edx,%eax
  800a9c:	01 c0                	add    %eax,%eax
  800a9e:	01 d8                	add    %ebx,%eax
  800aa0:	83 e8 30             	sub    $0x30,%eax
  800aa3:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800aa6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800aaa:	0f b6 00             	movzbl (%rax),%eax
  800aad:	0f be d8             	movsbl %al,%ebx
  800ab0:	83 fb 2f             	cmp    $0x2f,%ebx
  800ab3:	7e 60                	jle    800b15 <vprintfmt+0x159>
  800ab5:	83 fb 39             	cmp    $0x39,%ebx
  800ab8:	7f 5b                	jg     800b15 <vprintfmt+0x159>
  800aba:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800abf:	eb d1                	jmp    800a92 <vprintfmt+0xd6>
  800ac1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ac4:	83 f8 30             	cmp    $0x30,%eax
  800ac7:	73 17                	jae    800ae0 <vprintfmt+0x124>
  800ac9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800acd:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ad0:	89 d2                	mov    %edx,%edx
  800ad2:	48 01 d0             	add    %rdx,%rax
  800ad5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ad8:	83 c2 08             	add    $0x8,%edx
  800adb:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ade:	eb 0c                	jmp    800aec <vprintfmt+0x130>
  800ae0:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800ae4:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800ae8:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800aec:	8b 00                	mov    (%rax),%eax
  800aee:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800af1:	eb 23                	jmp    800b16 <vprintfmt+0x15a>
  800af3:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800af7:	0f 89 48 ff ff ff    	jns    800a45 <vprintfmt+0x89>
  800afd:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800b04:	e9 3c ff ff ff       	jmpq   800a45 <vprintfmt+0x89>
  800b09:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800b10:	e9 30 ff ff ff       	jmpq   800a45 <vprintfmt+0x89>
  800b15:	90                   	nop
  800b16:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b1a:	0f 89 25 ff ff ff    	jns    800a45 <vprintfmt+0x89>
  800b20:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b23:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800b26:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800b2d:	e9 13 ff ff ff       	jmpq   800a45 <vprintfmt+0x89>
  800b32:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800b36:	e9 0a ff ff ff       	jmpq   800a45 <vprintfmt+0x89>
  800b3b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b3e:	83 f8 30             	cmp    $0x30,%eax
  800b41:	73 17                	jae    800b5a <vprintfmt+0x19e>
  800b43:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800b47:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b4a:	89 d2                	mov    %edx,%edx
  800b4c:	48 01 d0             	add    %rdx,%rax
  800b4f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b52:	83 c2 08             	add    $0x8,%edx
  800b55:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b58:	eb 0c                	jmp    800b66 <vprintfmt+0x1aa>
  800b5a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800b5e:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800b62:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b66:	8b 10                	mov    (%rax),%edx
  800b68:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b6c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b70:	48 89 ce             	mov    %rcx,%rsi
  800b73:	89 d7                	mov    %edx,%edi
  800b75:	ff d0                	callq  *%rax
  800b77:	e9 37 03 00 00       	jmpq   800eb3 <vprintfmt+0x4f7>
  800b7c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b7f:	83 f8 30             	cmp    $0x30,%eax
  800b82:	73 17                	jae    800b9b <vprintfmt+0x1df>
  800b84:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800b88:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b8b:	89 d2                	mov    %edx,%edx
  800b8d:	48 01 d0             	add    %rdx,%rax
  800b90:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b93:	83 c2 08             	add    $0x8,%edx
  800b96:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b99:	eb 0c                	jmp    800ba7 <vprintfmt+0x1eb>
  800b9b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800b9f:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800ba3:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ba7:	8b 18                	mov    (%rax),%ebx
  800ba9:	85 db                	test   %ebx,%ebx
  800bab:	79 02                	jns    800baf <vprintfmt+0x1f3>
  800bad:	f7 db                	neg    %ebx
  800baf:	83 fb 15             	cmp    $0x15,%ebx
  800bb2:	7f 16                	jg     800bca <vprintfmt+0x20e>
  800bb4:	48 b8 00 4d 80 00 00 	movabs $0x804d00,%rax
  800bbb:	00 00 00 
  800bbe:	48 63 d3             	movslq %ebx,%rdx
  800bc1:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800bc5:	4d 85 e4             	test   %r12,%r12
  800bc8:	75 2e                	jne    800bf8 <vprintfmt+0x23c>
  800bca:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800bce:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bd2:	89 d9                	mov    %ebx,%ecx
  800bd4:	48 ba c1 4d 80 00 00 	movabs $0x804dc1,%rdx
  800bdb:	00 00 00 
  800bde:	48 89 c7             	mov    %rax,%rdi
  800be1:	b8 00 00 00 00       	mov    $0x0,%eax
  800be6:	49 b8 c2 0e 80 00 00 	movabs $0x800ec2,%r8
  800bed:	00 00 00 
  800bf0:	41 ff d0             	callq  *%r8
  800bf3:	e9 bb 02 00 00       	jmpq   800eb3 <vprintfmt+0x4f7>
  800bf8:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800bfc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c00:	4c 89 e1             	mov    %r12,%rcx
  800c03:	48 ba ca 4d 80 00 00 	movabs $0x804dca,%rdx
  800c0a:	00 00 00 
  800c0d:	48 89 c7             	mov    %rax,%rdi
  800c10:	b8 00 00 00 00       	mov    $0x0,%eax
  800c15:	49 b8 c2 0e 80 00 00 	movabs $0x800ec2,%r8
  800c1c:	00 00 00 
  800c1f:	41 ff d0             	callq  *%r8
  800c22:	e9 8c 02 00 00       	jmpq   800eb3 <vprintfmt+0x4f7>
  800c27:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c2a:	83 f8 30             	cmp    $0x30,%eax
  800c2d:	73 17                	jae    800c46 <vprintfmt+0x28a>
  800c2f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800c33:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c36:	89 d2                	mov    %edx,%edx
  800c38:	48 01 d0             	add    %rdx,%rax
  800c3b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c3e:	83 c2 08             	add    $0x8,%edx
  800c41:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c44:	eb 0c                	jmp    800c52 <vprintfmt+0x296>
  800c46:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800c4a:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800c4e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c52:	4c 8b 20             	mov    (%rax),%r12
  800c55:	4d 85 e4             	test   %r12,%r12
  800c58:	75 0a                	jne    800c64 <vprintfmt+0x2a8>
  800c5a:	49 bc cd 4d 80 00 00 	movabs $0x804dcd,%r12
  800c61:	00 00 00 
  800c64:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c68:	7e 78                	jle    800ce2 <vprintfmt+0x326>
  800c6a:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800c6e:	74 72                	je     800ce2 <vprintfmt+0x326>
  800c70:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800c73:	48 98                	cltq   
  800c75:	48 89 c6             	mov    %rax,%rsi
  800c78:	4c 89 e7             	mov    %r12,%rdi
  800c7b:	48 b8 70 11 80 00 00 	movabs $0x801170,%rax
  800c82:	00 00 00 
  800c85:	ff d0                	callq  *%rax
  800c87:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800c8a:	eb 17                	jmp    800ca3 <vprintfmt+0x2e7>
  800c8c:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800c90:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800c94:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c98:	48 89 ce             	mov    %rcx,%rsi
  800c9b:	89 d7                	mov    %edx,%edi
  800c9d:	ff d0                	callq  *%rax
  800c9f:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800ca3:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ca7:	7f e3                	jg     800c8c <vprintfmt+0x2d0>
  800ca9:	eb 37                	jmp    800ce2 <vprintfmt+0x326>
  800cab:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800caf:	74 1e                	je     800ccf <vprintfmt+0x313>
  800cb1:	83 fb 1f             	cmp    $0x1f,%ebx
  800cb4:	7e 05                	jle    800cbb <vprintfmt+0x2ff>
  800cb6:	83 fb 7e             	cmp    $0x7e,%ebx
  800cb9:	7e 14                	jle    800ccf <vprintfmt+0x313>
  800cbb:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cbf:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cc3:	48 89 d6             	mov    %rdx,%rsi
  800cc6:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800ccb:	ff d0                	callq  *%rax
  800ccd:	eb 0f                	jmp    800cde <vprintfmt+0x322>
  800ccf:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cd3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cd7:	48 89 d6             	mov    %rdx,%rsi
  800cda:	89 df                	mov    %ebx,%edi
  800cdc:	ff d0                	callq  *%rax
  800cde:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800ce2:	4c 89 e0             	mov    %r12,%rax
  800ce5:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800ce9:	0f b6 00             	movzbl (%rax),%eax
  800cec:	0f be d8             	movsbl %al,%ebx
  800cef:	85 db                	test   %ebx,%ebx
  800cf1:	74 28                	je     800d1b <vprintfmt+0x35f>
  800cf3:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800cf7:	78 b2                	js     800cab <vprintfmt+0x2ef>
  800cf9:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800cfd:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800d01:	79 a8                	jns    800cab <vprintfmt+0x2ef>
  800d03:	eb 16                	jmp    800d1b <vprintfmt+0x35f>
  800d05:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d09:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d0d:	48 89 d6             	mov    %rdx,%rsi
  800d10:	bf 20 00 00 00       	mov    $0x20,%edi
  800d15:	ff d0                	callq  *%rax
  800d17:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d1b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d1f:	7f e4                	jg     800d05 <vprintfmt+0x349>
  800d21:	e9 8d 01 00 00       	jmpq   800eb3 <vprintfmt+0x4f7>
  800d26:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d2a:	be 03 00 00 00       	mov    $0x3,%esi
  800d2f:	48 89 c7             	mov    %rax,%rdi
  800d32:	48 b8 b5 08 80 00 00 	movabs $0x8008b5,%rax
  800d39:	00 00 00 
  800d3c:	ff d0                	callq  *%rax
  800d3e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d42:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d46:	48 85 c0             	test   %rax,%rax
  800d49:	79 1d                	jns    800d68 <vprintfmt+0x3ac>
  800d4b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d4f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d53:	48 89 d6             	mov    %rdx,%rsi
  800d56:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800d5b:	ff d0                	callq  *%rax
  800d5d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d61:	48 f7 d8             	neg    %rax
  800d64:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d68:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800d6f:	e9 d2 00 00 00       	jmpq   800e46 <vprintfmt+0x48a>
  800d74:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d78:	be 03 00 00 00       	mov    $0x3,%esi
  800d7d:	48 89 c7             	mov    %rax,%rdi
  800d80:	48 b8 ae 07 80 00 00 	movabs $0x8007ae,%rax
  800d87:	00 00 00 
  800d8a:	ff d0                	callq  *%rax
  800d8c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d90:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800d97:	e9 aa 00 00 00       	jmpq   800e46 <vprintfmt+0x48a>
  800d9c:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800da0:	be 03 00 00 00       	mov    $0x3,%esi
  800da5:	48 89 c7             	mov    %rax,%rdi
  800da8:	48 b8 ae 07 80 00 00 	movabs $0x8007ae,%rax
  800daf:	00 00 00 
  800db2:	ff d0                	callq  *%rax
  800db4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800db8:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800dbf:	e9 82 00 00 00       	jmpq   800e46 <vprintfmt+0x48a>
  800dc4:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800dc8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dcc:	48 89 d6             	mov    %rdx,%rsi
  800dcf:	bf 30 00 00 00       	mov    $0x30,%edi
  800dd4:	ff d0                	callq  *%rax
  800dd6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800dda:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dde:	48 89 d6             	mov    %rdx,%rsi
  800de1:	bf 78 00 00 00       	mov    $0x78,%edi
  800de6:	ff d0                	callq  *%rax
  800de8:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800deb:	83 f8 30             	cmp    $0x30,%eax
  800dee:	73 17                	jae    800e07 <vprintfmt+0x44b>
  800df0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800df4:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800df7:	89 d2                	mov    %edx,%edx
  800df9:	48 01 d0             	add    %rdx,%rax
  800dfc:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800dff:	83 c2 08             	add    $0x8,%edx
  800e02:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800e05:	eb 0c                	jmp    800e13 <vprintfmt+0x457>
  800e07:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800e0b:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800e0f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e13:	48 8b 00             	mov    (%rax),%rax
  800e16:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e1a:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800e21:	eb 23                	jmp    800e46 <vprintfmt+0x48a>
  800e23:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e27:	be 03 00 00 00       	mov    $0x3,%esi
  800e2c:	48 89 c7             	mov    %rax,%rdi
  800e2f:	48 b8 ae 07 80 00 00 	movabs $0x8007ae,%rax
  800e36:	00 00 00 
  800e39:	ff d0                	callq  *%rax
  800e3b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e3f:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800e46:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800e4b:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800e4e:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800e51:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e55:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800e59:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e5d:	45 89 c1             	mov    %r8d,%r9d
  800e60:	41 89 f8             	mov    %edi,%r8d
  800e63:	48 89 c7             	mov    %rax,%rdi
  800e66:	48 b8 f6 06 80 00 00 	movabs $0x8006f6,%rax
  800e6d:	00 00 00 
  800e70:	ff d0                	callq  *%rax
  800e72:	eb 3f                	jmp    800eb3 <vprintfmt+0x4f7>
  800e74:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e78:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e7c:	48 89 d6             	mov    %rdx,%rsi
  800e7f:	89 df                	mov    %ebx,%edi
  800e81:	ff d0                	callq  *%rax
  800e83:	eb 2e                	jmp    800eb3 <vprintfmt+0x4f7>
  800e85:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e89:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e8d:	48 89 d6             	mov    %rdx,%rsi
  800e90:	bf 25 00 00 00       	mov    $0x25,%edi
  800e95:	ff d0                	callq  *%rax
  800e97:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800e9c:	eb 05                	jmp    800ea3 <vprintfmt+0x4e7>
  800e9e:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800ea3:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800ea7:	48 83 e8 01          	sub    $0x1,%rax
  800eab:	0f b6 00             	movzbl (%rax),%eax
  800eae:	3c 25                	cmp    $0x25,%al
  800eb0:	75 ec                	jne    800e9e <vprintfmt+0x4e2>
  800eb2:	90                   	nop
  800eb3:	e9 3d fb ff ff       	jmpq   8009f5 <vprintfmt+0x39>
  800eb8:	90                   	nop
  800eb9:	48 83 c4 60          	add    $0x60,%rsp
  800ebd:	5b                   	pop    %rbx
  800ebe:	41 5c                	pop    %r12
  800ec0:	5d                   	pop    %rbp
  800ec1:	c3                   	retq   

0000000000800ec2 <printfmt>:
  800ec2:	55                   	push   %rbp
  800ec3:	48 89 e5             	mov    %rsp,%rbp
  800ec6:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800ecd:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800ed4:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800edb:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800ee2:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800ee9:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800ef0:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800ef7:	84 c0                	test   %al,%al
  800ef9:	74 20                	je     800f1b <printfmt+0x59>
  800efb:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800eff:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f03:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f07:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f0b:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f0f:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f13:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f17:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f1b:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800f22:	00 00 00 
  800f25:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800f2c:	00 00 00 
  800f2f:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800f33:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800f3a:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800f41:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800f48:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800f4f:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800f56:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800f5d:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800f64:	48 89 c7             	mov    %rax,%rdi
  800f67:	48 b8 bc 09 80 00 00 	movabs $0x8009bc,%rax
  800f6e:	00 00 00 
  800f71:	ff d0                	callq  *%rax
  800f73:	90                   	nop
  800f74:	c9                   	leaveq 
  800f75:	c3                   	retq   

0000000000800f76 <sprintputch>:
  800f76:	55                   	push   %rbp
  800f77:	48 89 e5             	mov    %rsp,%rbp
  800f7a:	48 83 ec 10          	sub    $0x10,%rsp
  800f7e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800f81:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800f85:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f89:	8b 40 10             	mov    0x10(%rax),%eax
  800f8c:	8d 50 01             	lea    0x1(%rax),%edx
  800f8f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f93:	89 50 10             	mov    %edx,0x10(%rax)
  800f96:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f9a:	48 8b 10             	mov    (%rax),%rdx
  800f9d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fa1:	48 8b 40 08          	mov    0x8(%rax),%rax
  800fa5:	48 39 c2             	cmp    %rax,%rdx
  800fa8:	73 17                	jae    800fc1 <sprintputch+0x4b>
  800faa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fae:	48 8b 00             	mov    (%rax),%rax
  800fb1:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800fb5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800fb9:	48 89 0a             	mov    %rcx,(%rdx)
  800fbc:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800fbf:	88 10                	mov    %dl,(%rax)
  800fc1:	90                   	nop
  800fc2:	c9                   	leaveq 
  800fc3:	c3                   	retq   

0000000000800fc4 <vsnprintf>:
  800fc4:	55                   	push   %rbp
  800fc5:	48 89 e5             	mov    %rsp,%rbp
  800fc8:	48 83 ec 50          	sub    $0x50,%rsp
  800fcc:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800fd0:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800fd3:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800fd7:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800fdb:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800fdf:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800fe3:	48 8b 0a             	mov    (%rdx),%rcx
  800fe6:	48 89 08             	mov    %rcx,(%rax)
  800fe9:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800fed:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ff1:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800ff5:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800ff9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ffd:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801001:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801004:	48 98                	cltq   
  801006:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80100a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80100e:	48 01 d0             	add    %rdx,%rax
  801011:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801015:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80101c:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  801021:	74 06                	je     801029 <vsnprintf+0x65>
  801023:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801027:	7f 07                	jg     801030 <vsnprintf+0x6c>
  801029:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80102e:	eb 2f                	jmp    80105f <vsnprintf+0x9b>
  801030:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801034:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801038:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80103c:	48 89 c6             	mov    %rax,%rsi
  80103f:	48 bf 76 0f 80 00 00 	movabs $0x800f76,%rdi
  801046:	00 00 00 
  801049:	48 b8 bc 09 80 00 00 	movabs $0x8009bc,%rax
  801050:	00 00 00 
  801053:	ff d0                	callq  *%rax
  801055:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801059:	c6 00 00             	movb   $0x0,(%rax)
  80105c:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80105f:	c9                   	leaveq 
  801060:	c3                   	retq   

0000000000801061 <snprintf>:
  801061:	55                   	push   %rbp
  801062:	48 89 e5             	mov    %rsp,%rbp
  801065:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  80106c:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  801073:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801079:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  801080:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801087:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80108e:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801095:	84 c0                	test   %al,%al
  801097:	74 20                	je     8010b9 <snprintf+0x58>
  801099:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80109d:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8010a1:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8010a5:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8010a9:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8010ad:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8010b1:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8010b5:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8010b9:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8010c0:	00 00 00 
  8010c3:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8010ca:	00 00 00 
  8010cd:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8010d1:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8010d8:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8010df:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8010e6:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8010ed:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8010f4:	48 8b 0a             	mov    (%rdx),%rcx
  8010f7:	48 89 08             	mov    %rcx,(%rax)
  8010fa:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8010fe:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801102:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801106:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80110a:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  801111:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801118:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80111e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801125:	48 89 c7             	mov    %rax,%rdi
  801128:	48 b8 c4 0f 80 00 00 	movabs $0x800fc4,%rax
  80112f:	00 00 00 
  801132:	ff d0                	callq  *%rax
  801134:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80113a:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801140:	c9                   	leaveq 
  801141:	c3                   	retq   

0000000000801142 <strlen>:
  801142:	55                   	push   %rbp
  801143:	48 89 e5             	mov    %rsp,%rbp
  801146:	48 83 ec 18          	sub    $0x18,%rsp
  80114a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80114e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801155:	eb 09                	jmp    801160 <strlen+0x1e>
  801157:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80115b:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801160:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801164:	0f b6 00             	movzbl (%rax),%eax
  801167:	84 c0                	test   %al,%al
  801169:	75 ec                	jne    801157 <strlen+0x15>
  80116b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80116e:	c9                   	leaveq 
  80116f:	c3                   	retq   

0000000000801170 <strnlen>:
  801170:	55                   	push   %rbp
  801171:	48 89 e5             	mov    %rsp,%rbp
  801174:	48 83 ec 20          	sub    $0x20,%rsp
  801178:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80117c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801180:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801187:	eb 0e                	jmp    801197 <strnlen+0x27>
  801189:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80118d:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801192:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801197:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80119c:	74 0b                	je     8011a9 <strnlen+0x39>
  80119e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011a2:	0f b6 00             	movzbl (%rax),%eax
  8011a5:	84 c0                	test   %al,%al
  8011a7:	75 e0                	jne    801189 <strnlen+0x19>
  8011a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011ac:	c9                   	leaveq 
  8011ad:	c3                   	retq   

00000000008011ae <strcpy>:
  8011ae:	55                   	push   %rbp
  8011af:	48 89 e5             	mov    %rsp,%rbp
  8011b2:	48 83 ec 20          	sub    $0x20,%rsp
  8011b6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011ba:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011c2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011c6:	90                   	nop
  8011c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011cb:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8011cf:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8011d3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8011d7:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8011db:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8011df:	0f b6 12             	movzbl (%rdx),%edx
  8011e2:	88 10                	mov    %dl,(%rax)
  8011e4:	0f b6 00             	movzbl (%rax),%eax
  8011e7:	84 c0                	test   %al,%al
  8011e9:	75 dc                	jne    8011c7 <strcpy+0x19>
  8011eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011ef:	c9                   	leaveq 
  8011f0:	c3                   	retq   

00000000008011f1 <strcat>:
  8011f1:	55                   	push   %rbp
  8011f2:	48 89 e5             	mov    %rsp,%rbp
  8011f5:	48 83 ec 20          	sub    $0x20,%rsp
  8011f9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011fd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801201:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801205:	48 89 c7             	mov    %rax,%rdi
  801208:	48 b8 42 11 80 00 00 	movabs $0x801142,%rax
  80120f:	00 00 00 
  801212:	ff d0                	callq  *%rax
  801214:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801217:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80121a:	48 63 d0             	movslq %eax,%rdx
  80121d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801221:	48 01 c2             	add    %rax,%rdx
  801224:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801228:	48 89 c6             	mov    %rax,%rsi
  80122b:	48 89 d7             	mov    %rdx,%rdi
  80122e:	48 b8 ae 11 80 00 00 	movabs $0x8011ae,%rax
  801235:	00 00 00 
  801238:	ff d0                	callq  *%rax
  80123a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80123e:	c9                   	leaveq 
  80123f:	c3                   	retq   

0000000000801240 <strncpy>:
  801240:	55                   	push   %rbp
  801241:	48 89 e5             	mov    %rsp,%rbp
  801244:	48 83 ec 28          	sub    $0x28,%rsp
  801248:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80124c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801250:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801254:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801258:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80125c:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801263:	00 
  801264:	eb 2a                	jmp    801290 <strncpy+0x50>
  801266:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80126a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80126e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801272:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801276:	0f b6 12             	movzbl (%rdx),%edx
  801279:	88 10                	mov    %dl,(%rax)
  80127b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80127f:	0f b6 00             	movzbl (%rax),%eax
  801282:	84 c0                	test   %al,%al
  801284:	74 05                	je     80128b <strncpy+0x4b>
  801286:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  80128b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801290:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801294:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801298:	72 cc                	jb     801266 <strncpy+0x26>
  80129a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80129e:	c9                   	leaveq 
  80129f:	c3                   	retq   

00000000008012a0 <strlcpy>:
  8012a0:	55                   	push   %rbp
  8012a1:	48 89 e5             	mov    %rsp,%rbp
  8012a4:	48 83 ec 28          	sub    $0x28,%rsp
  8012a8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8012ac:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8012b0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8012b4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012b8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8012bc:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8012c1:	74 3d                	je     801300 <strlcpy+0x60>
  8012c3:	eb 1d                	jmp    8012e2 <strlcpy+0x42>
  8012c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012c9:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8012cd:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012d1:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8012d5:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8012d9:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8012dd:	0f b6 12             	movzbl (%rdx),%edx
  8012e0:	88 10                	mov    %dl,(%rax)
  8012e2:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8012e7:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8012ec:	74 0b                	je     8012f9 <strlcpy+0x59>
  8012ee:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8012f2:	0f b6 00             	movzbl (%rax),%eax
  8012f5:	84 c0                	test   %al,%al
  8012f7:	75 cc                	jne    8012c5 <strlcpy+0x25>
  8012f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012fd:	c6 00 00             	movb   $0x0,(%rax)
  801300:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801304:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801308:	48 29 c2             	sub    %rax,%rdx
  80130b:	48 89 d0             	mov    %rdx,%rax
  80130e:	c9                   	leaveq 
  80130f:	c3                   	retq   

0000000000801310 <strcmp>:
  801310:	55                   	push   %rbp
  801311:	48 89 e5             	mov    %rsp,%rbp
  801314:	48 83 ec 10          	sub    $0x10,%rsp
  801318:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80131c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801320:	eb 0a                	jmp    80132c <strcmp+0x1c>
  801322:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801327:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80132c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801330:	0f b6 00             	movzbl (%rax),%eax
  801333:	84 c0                	test   %al,%al
  801335:	74 12                	je     801349 <strcmp+0x39>
  801337:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80133b:	0f b6 10             	movzbl (%rax),%edx
  80133e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801342:	0f b6 00             	movzbl (%rax),%eax
  801345:	38 c2                	cmp    %al,%dl
  801347:	74 d9                	je     801322 <strcmp+0x12>
  801349:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80134d:	0f b6 00             	movzbl (%rax),%eax
  801350:	0f b6 d0             	movzbl %al,%edx
  801353:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801357:	0f b6 00             	movzbl (%rax),%eax
  80135a:	0f b6 c0             	movzbl %al,%eax
  80135d:	29 c2                	sub    %eax,%edx
  80135f:	89 d0                	mov    %edx,%eax
  801361:	c9                   	leaveq 
  801362:	c3                   	retq   

0000000000801363 <strncmp>:
  801363:	55                   	push   %rbp
  801364:	48 89 e5             	mov    %rsp,%rbp
  801367:	48 83 ec 18          	sub    $0x18,%rsp
  80136b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80136f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801373:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801377:	eb 0f                	jmp    801388 <strncmp+0x25>
  801379:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80137e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801383:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801388:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80138d:	74 1d                	je     8013ac <strncmp+0x49>
  80138f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801393:	0f b6 00             	movzbl (%rax),%eax
  801396:	84 c0                	test   %al,%al
  801398:	74 12                	je     8013ac <strncmp+0x49>
  80139a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80139e:	0f b6 10             	movzbl (%rax),%edx
  8013a1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013a5:	0f b6 00             	movzbl (%rax),%eax
  8013a8:	38 c2                	cmp    %al,%dl
  8013aa:	74 cd                	je     801379 <strncmp+0x16>
  8013ac:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8013b1:	75 07                	jne    8013ba <strncmp+0x57>
  8013b3:	b8 00 00 00 00       	mov    $0x0,%eax
  8013b8:	eb 18                	jmp    8013d2 <strncmp+0x6f>
  8013ba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013be:	0f b6 00             	movzbl (%rax),%eax
  8013c1:	0f b6 d0             	movzbl %al,%edx
  8013c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013c8:	0f b6 00             	movzbl (%rax),%eax
  8013cb:	0f b6 c0             	movzbl %al,%eax
  8013ce:	29 c2                	sub    %eax,%edx
  8013d0:	89 d0                	mov    %edx,%eax
  8013d2:	c9                   	leaveq 
  8013d3:	c3                   	retq   

00000000008013d4 <strchr>:
  8013d4:	55                   	push   %rbp
  8013d5:	48 89 e5             	mov    %rsp,%rbp
  8013d8:	48 83 ec 10          	sub    $0x10,%rsp
  8013dc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013e0:	89 f0                	mov    %esi,%eax
  8013e2:	88 45 f4             	mov    %al,-0xc(%rbp)
  8013e5:	eb 17                	jmp    8013fe <strchr+0x2a>
  8013e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013eb:	0f b6 00             	movzbl (%rax),%eax
  8013ee:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8013f1:	75 06                	jne    8013f9 <strchr+0x25>
  8013f3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013f7:	eb 15                	jmp    80140e <strchr+0x3a>
  8013f9:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8013fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801402:	0f b6 00             	movzbl (%rax),%eax
  801405:	84 c0                	test   %al,%al
  801407:	75 de                	jne    8013e7 <strchr+0x13>
  801409:	b8 00 00 00 00       	mov    $0x0,%eax
  80140e:	c9                   	leaveq 
  80140f:	c3                   	retq   

0000000000801410 <strfind>:
  801410:	55                   	push   %rbp
  801411:	48 89 e5             	mov    %rsp,%rbp
  801414:	48 83 ec 10          	sub    $0x10,%rsp
  801418:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80141c:	89 f0                	mov    %esi,%eax
  80141e:	88 45 f4             	mov    %al,-0xc(%rbp)
  801421:	eb 11                	jmp    801434 <strfind+0x24>
  801423:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801427:	0f b6 00             	movzbl (%rax),%eax
  80142a:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80142d:	74 12                	je     801441 <strfind+0x31>
  80142f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801434:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801438:	0f b6 00             	movzbl (%rax),%eax
  80143b:	84 c0                	test   %al,%al
  80143d:	75 e4                	jne    801423 <strfind+0x13>
  80143f:	eb 01                	jmp    801442 <strfind+0x32>
  801441:	90                   	nop
  801442:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801446:	c9                   	leaveq 
  801447:	c3                   	retq   

0000000000801448 <memset>:
  801448:	55                   	push   %rbp
  801449:	48 89 e5             	mov    %rsp,%rbp
  80144c:	48 83 ec 18          	sub    $0x18,%rsp
  801450:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801454:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801457:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80145b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801460:	75 06                	jne    801468 <memset+0x20>
  801462:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801466:	eb 69                	jmp    8014d1 <memset+0x89>
  801468:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80146c:	83 e0 03             	and    $0x3,%eax
  80146f:	48 85 c0             	test   %rax,%rax
  801472:	75 48                	jne    8014bc <memset+0x74>
  801474:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801478:	83 e0 03             	and    $0x3,%eax
  80147b:	48 85 c0             	test   %rax,%rax
  80147e:	75 3c                	jne    8014bc <memset+0x74>
  801480:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801487:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80148a:	c1 e0 18             	shl    $0x18,%eax
  80148d:	89 c2                	mov    %eax,%edx
  80148f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801492:	c1 e0 10             	shl    $0x10,%eax
  801495:	09 c2                	or     %eax,%edx
  801497:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80149a:	c1 e0 08             	shl    $0x8,%eax
  80149d:	09 d0                	or     %edx,%eax
  80149f:	09 45 f4             	or     %eax,-0xc(%rbp)
  8014a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014a6:	48 c1 e8 02          	shr    $0x2,%rax
  8014aa:	48 89 c1             	mov    %rax,%rcx
  8014ad:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014b1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014b4:	48 89 d7             	mov    %rdx,%rdi
  8014b7:	fc                   	cld    
  8014b8:	f3 ab                	rep stos %eax,%es:(%rdi)
  8014ba:	eb 11                	jmp    8014cd <memset+0x85>
  8014bc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014c0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014c3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8014c7:	48 89 d7             	mov    %rdx,%rdi
  8014ca:	fc                   	cld    
  8014cb:	f3 aa                	rep stos %al,%es:(%rdi)
  8014cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014d1:	c9                   	leaveq 
  8014d2:	c3                   	retq   

00000000008014d3 <memmove>:
  8014d3:	55                   	push   %rbp
  8014d4:	48 89 e5             	mov    %rsp,%rbp
  8014d7:	48 83 ec 28          	sub    $0x28,%rsp
  8014db:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014df:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014e3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014e7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014eb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8014ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014f3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8014f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014fb:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8014ff:	0f 83 88 00 00 00    	jae    80158d <memmove+0xba>
  801505:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801509:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80150d:	48 01 d0             	add    %rdx,%rax
  801510:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801514:	76 77                	jbe    80158d <memmove+0xba>
  801516:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80151a:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80151e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801522:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801526:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80152a:	83 e0 03             	and    $0x3,%eax
  80152d:	48 85 c0             	test   %rax,%rax
  801530:	75 3b                	jne    80156d <memmove+0x9a>
  801532:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801536:	83 e0 03             	and    $0x3,%eax
  801539:	48 85 c0             	test   %rax,%rax
  80153c:	75 2f                	jne    80156d <memmove+0x9a>
  80153e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801542:	83 e0 03             	and    $0x3,%eax
  801545:	48 85 c0             	test   %rax,%rax
  801548:	75 23                	jne    80156d <memmove+0x9a>
  80154a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80154e:	48 83 e8 04          	sub    $0x4,%rax
  801552:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801556:	48 83 ea 04          	sub    $0x4,%rdx
  80155a:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80155e:	48 c1 e9 02          	shr    $0x2,%rcx
  801562:	48 89 c7             	mov    %rax,%rdi
  801565:	48 89 d6             	mov    %rdx,%rsi
  801568:	fd                   	std    
  801569:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80156b:	eb 1d                	jmp    80158a <memmove+0xb7>
  80156d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801571:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801575:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801579:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  80157d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801581:	48 89 d7             	mov    %rdx,%rdi
  801584:	48 89 c1             	mov    %rax,%rcx
  801587:	fd                   	std    
  801588:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80158a:	fc                   	cld    
  80158b:	eb 57                	jmp    8015e4 <memmove+0x111>
  80158d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801591:	83 e0 03             	and    $0x3,%eax
  801594:	48 85 c0             	test   %rax,%rax
  801597:	75 36                	jne    8015cf <memmove+0xfc>
  801599:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80159d:	83 e0 03             	and    $0x3,%eax
  8015a0:	48 85 c0             	test   %rax,%rax
  8015a3:	75 2a                	jne    8015cf <memmove+0xfc>
  8015a5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015a9:	83 e0 03             	and    $0x3,%eax
  8015ac:	48 85 c0             	test   %rax,%rax
  8015af:	75 1e                	jne    8015cf <memmove+0xfc>
  8015b1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015b5:	48 c1 e8 02          	shr    $0x2,%rax
  8015b9:	48 89 c1             	mov    %rax,%rcx
  8015bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015c0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8015c4:	48 89 c7             	mov    %rax,%rdi
  8015c7:	48 89 d6             	mov    %rdx,%rsi
  8015ca:	fc                   	cld    
  8015cb:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8015cd:	eb 15                	jmp    8015e4 <memmove+0x111>
  8015cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015d3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8015d7:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8015db:	48 89 c7             	mov    %rax,%rdi
  8015de:	48 89 d6             	mov    %rdx,%rsi
  8015e1:	fc                   	cld    
  8015e2:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8015e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015e8:	c9                   	leaveq 
  8015e9:	c3                   	retq   

00000000008015ea <memcpy>:
  8015ea:	55                   	push   %rbp
  8015eb:	48 89 e5             	mov    %rsp,%rbp
  8015ee:	48 83 ec 18          	sub    $0x18,%rsp
  8015f2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015f6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8015fa:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8015fe:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801602:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801606:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80160a:	48 89 ce             	mov    %rcx,%rsi
  80160d:	48 89 c7             	mov    %rax,%rdi
  801610:	48 b8 d3 14 80 00 00 	movabs $0x8014d3,%rax
  801617:	00 00 00 
  80161a:	ff d0                	callq  *%rax
  80161c:	c9                   	leaveq 
  80161d:	c3                   	retq   

000000000080161e <memcmp>:
  80161e:	55                   	push   %rbp
  80161f:	48 89 e5             	mov    %rsp,%rbp
  801622:	48 83 ec 28          	sub    $0x28,%rsp
  801626:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80162a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80162e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801632:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801636:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80163a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80163e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801642:	eb 36                	jmp    80167a <memcmp+0x5c>
  801644:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801648:	0f b6 10             	movzbl (%rax),%edx
  80164b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80164f:	0f b6 00             	movzbl (%rax),%eax
  801652:	38 c2                	cmp    %al,%dl
  801654:	74 1a                	je     801670 <memcmp+0x52>
  801656:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80165a:	0f b6 00             	movzbl (%rax),%eax
  80165d:	0f b6 d0             	movzbl %al,%edx
  801660:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801664:	0f b6 00             	movzbl (%rax),%eax
  801667:	0f b6 c0             	movzbl %al,%eax
  80166a:	29 c2                	sub    %eax,%edx
  80166c:	89 d0                	mov    %edx,%eax
  80166e:	eb 20                	jmp    801690 <memcmp+0x72>
  801670:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801675:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80167a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80167e:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801682:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801686:	48 85 c0             	test   %rax,%rax
  801689:	75 b9                	jne    801644 <memcmp+0x26>
  80168b:	b8 00 00 00 00       	mov    $0x0,%eax
  801690:	c9                   	leaveq 
  801691:	c3                   	retq   

0000000000801692 <memfind>:
  801692:	55                   	push   %rbp
  801693:	48 89 e5             	mov    %rsp,%rbp
  801696:	48 83 ec 28          	sub    $0x28,%rsp
  80169a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80169e:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8016a1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8016a5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8016a9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ad:	48 01 d0             	add    %rdx,%rax
  8016b0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8016b4:	eb 13                	jmp    8016c9 <memfind+0x37>
  8016b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016ba:	0f b6 00             	movzbl (%rax),%eax
  8016bd:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8016c0:	38 d0                	cmp    %dl,%al
  8016c2:	74 11                	je     8016d5 <memfind+0x43>
  8016c4:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8016c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016cd:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8016d1:	72 e3                	jb     8016b6 <memfind+0x24>
  8016d3:	eb 01                	jmp    8016d6 <memfind+0x44>
  8016d5:	90                   	nop
  8016d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016da:	c9                   	leaveq 
  8016db:	c3                   	retq   

00000000008016dc <strtol>:
  8016dc:	55                   	push   %rbp
  8016dd:	48 89 e5             	mov    %rsp,%rbp
  8016e0:	48 83 ec 38          	sub    $0x38,%rsp
  8016e4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8016e8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8016ec:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8016ef:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8016f6:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8016fd:	00 
  8016fe:	eb 05                	jmp    801705 <strtol+0x29>
  801700:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801705:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801709:	0f b6 00             	movzbl (%rax),%eax
  80170c:	3c 20                	cmp    $0x20,%al
  80170e:	74 f0                	je     801700 <strtol+0x24>
  801710:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801714:	0f b6 00             	movzbl (%rax),%eax
  801717:	3c 09                	cmp    $0x9,%al
  801719:	74 e5                	je     801700 <strtol+0x24>
  80171b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80171f:	0f b6 00             	movzbl (%rax),%eax
  801722:	3c 2b                	cmp    $0x2b,%al
  801724:	75 07                	jne    80172d <strtol+0x51>
  801726:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80172b:	eb 17                	jmp    801744 <strtol+0x68>
  80172d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801731:	0f b6 00             	movzbl (%rax),%eax
  801734:	3c 2d                	cmp    $0x2d,%al
  801736:	75 0c                	jne    801744 <strtol+0x68>
  801738:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80173d:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801744:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801748:	74 06                	je     801750 <strtol+0x74>
  80174a:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80174e:	75 28                	jne    801778 <strtol+0x9c>
  801750:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801754:	0f b6 00             	movzbl (%rax),%eax
  801757:	3c 30                	cmp    $0x30,%al
  801759:	75 1d                	jne    801778 <strtol+0x9c>
  80175b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80175f:	48 83 c0 01          	add    $0x1,%rax
  801763:	0f b6 00             	movzbl (%rax),%eax
  801766:	3c 78                	cmp    $0x78,%al
  801768:	75 0e                	jne    801778 <strtol+0x9c>
  80176a:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  80176f:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801776:	eb 2c                	jmp    8017a4 <strtol+0xc8>
  801778:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80177c:	75 19                	jne    801797 <strtol+0xbb>
  80177e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801782:	0f b6 00             	movzbl (%rax),%eax
  801785:	3c 30                	cmp    $0x30,%al
  801787:	75 0e                	jne    801797 <strtol+0xbb>
  801789:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80178e:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801795:	eb 0d                	jmp    8017a4 <strtol+0xc8>
  801797:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80179b:	75 07                	jne    8017a4 <strtol+0xc8>
  80179d:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8017a4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a8:	0f b6 00             	movzbl (%rax),%eax
  8017ab:	3c 2f                	cmp    $0x2f,%al
  8017ad:	7e 1d                	jle    8017cc <strtol+0xf0>
  8017af:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017b3:	0f b6 00             	movzbl (%rax),%eax
  8017b6:	3c 39                	cmp    $0x39,%al
  8017b8:	7f 12                	jg     8017cc <strtol+0xf0>
  8017ba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017be:	0f b6 00             	movzbl (%rax),%eax
  8017c1:	0f be c0             	movsbl %al,%eax
  8017c4:	83 e8 30             	sub    $0x30,%eax
  8017c7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8017ca:	eb 4e                	jmp    80181a <strtol+0x13e>
  8017cc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017d0:	0f b6 00             	movzbl (%rax),%eax
  8017d3:	3c 60                	cmp    $0x60,%al
  8017d5:	7e 1d                	jle    8017f4 <strtol+0x118>
  8017d7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017db:	0f b6 00             	movzbl (%rax),%eax
  8017de:	3c 7a                	cmp    $0x7a,%al
  8017e0:	7f 12                	jg     8017f4 <strtol+0x118>
  8017e2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017e6:	0f b6 00             	movzbl (%rax),%eax
  8017e9:	0f be c0             	movsbl %al,%eax
  8017ec:	83 e8 57             	sub    $0x57,%eax
  8017ef:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8017f2:	eb 26                	jmp    80181a <strtol+0x13e>
  8017f4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017f8:	0f b6 00             	movzbl (%rax),%eax
  8017fb:	3c 40                	cmp    $0x40,%al
  8017fd:	7e 47                	jle    801846 <strtol+0x16a>
  8017ff:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801803:	0f b6 00             	movzbl (%rax),%eax
  801806:	3c 5a                	cmp    $0x5a,%al
  801808:	7f 3c                	jg     801846 <strtol+0x16a>
  80180a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80180e:	0f b6 00             	movzbl (%rax),%eax
  801811:	0f be c0             	movsbl %al,%eax
  801814:	83 e8 37             	sub    $0x37,%eax
  801817:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80181a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80181d:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801820:	7d 23                	jge    801845 <strtol+0x169>
  801822:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801827:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80182a:	48 98                	cltq   
  80182c:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801831:	48 89 c2             	mov    %rax,%rdx
  801834:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801837:	48 98                	cltq   
  801839:	48 01 d0             	add    %rdx,%rax
  80183c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801840:	e9 5f ff ff ff       	jmpq   8017a4 <strtol+0xc8>
  801845:	90                   	nop
  801846:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  80184b:	74 0b                	je     801858 <strtol+0x17c>
  80184d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801851:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801855:	48 89 10             	mov    %rdx,(%rax)
  801858:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80185c:	74 09                	je     801867 <strtol+0x18b>
  80185e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801862:	48 f7 d8             	neg    %rax
  801865:	eb 04                	jmp    80186b <strtol+0x18f>
  801867:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80186b:	c9                   	leaveq 
  80186c:	c3                   	retq   

000000000080186d <strstr>:
  80186d:	55                   	push   %rbp
  80186e:	48 89 e5             	mov    %rsp,%rbp
  801871:	48 83 ec 30          	sub    $0x30,%rsp
  801875:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801879:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80187d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801881:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801885:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801889:	0f b6 00             	movzbl (%rax),%eax
  80188c:	88 45 ff             	mov    %al,-0x1(%rbp)
  80188f:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801893:	75 06                	jne    80189b <strstr+0x2e>
  801895:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801899:	eb 6b                	jmp    801906 <strstr+0x99>
  80189b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80189f:	48 89 c7             	mov    %rax,%rdi
  8018a2:	48 b8 42 11 80 00 00 	movabs $0x801142,%rax
  8018a9:	00 00 00 
  8018ac:	ff d0                	callq  *%rax
  8018ae:	48 98                	cltq   
  8018b0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8018b4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018b8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8018bc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8018c0:	0f b6 00             	movzbl (%rax),%eax
  8018c3:	88 45 ef             	mov    %al,-0x11(%rbp)
  8018c6:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8018ca:	75 07                	jne    8018d3 <strstr+0x66>
  8018cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8018d1:	eb 33                	jmp    801906 <strstr+0x99>
  8018d3:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8018d7:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8018da:	75 d8                	jne    8018b4 <strstr+0x47>
  8018dc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018e0:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8018e4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018e8:	48 89 ce             	mov    %rcx,%rsi
  8018eb:	48 89 c7             	mov    %rax,%rdi
  8018ee:	48 b8 63 13 80 00 00 	movabs $0x801363,%rax
  8018f5:	00 00 00 
  8018f8:	ff d0                	callq  *%rax
  8018fa:	85 c0                	test   %eax,%eax
  8018fc:	75 b6                	jne    8018b4 <strstr+0x47>
  8018fe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801902:	48 83 e8 01          	sub    $0x1,%rax
  801906:	c9                   	leaveq 
  801907:	c3                   	retq   

0000000000801908 <syscall>:
  801908:	55                   	push   %rbp
  801909:	48 89 e5             	mov    %rsp,%rbp
  80190c:	53                   	push   %rbx
  80190d:	48 83 ec 48          	sub    $0x48,%rsp
  801911:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801914:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801917:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80191b:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80191f:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801923:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801927:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80192a:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80192e:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801932:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801936:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  80193a:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80193e:	4c 89 c3             	mov    %r8,%rbx
  801941:	cd 30                	int    $0x30
  801943:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801947:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  80194b:	74 3e                	je     80198b <syscall+0x83>
  80194d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801952:	7e 37                	jle    80198b <syscall+0x83>
  801954:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801958:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80195b:	49 89 d0             	mov    %rdx,%r8
  80195e:	89 c1                	mov    %eax,%ecx
  801960:	48 ba 88 50 80 00 00 	movabs $0x805088,%rdx
  801967:	00 00 00 
  80196a:	be 24 00 00 00       	mov    $0x24,%esi
  80196f:	48 bf a5 50 80 00 00 	movabs $0x8050a5,%rdi
  801976:	00 00 00 
  801979:	b8 00 00 00 00       	mov    $0x0,%eax
  80197e:	49 b9 e4 03 80 00 00 	movabs $0x8003e4,%r9
  801985:	00 00 00 
  801988:	41 ff d1             	callq  *%r9
  80198b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80198f:	48 83 c4 48          	add    $0x48,%rsp
  801993:	5b                   	pop    %rbx
  801994:	5d                   	pop    %rbp
  801995:	c3                   	retq   

0000000000801996 <sys_cputs>:
  801996:	55                   	push   %rbp
  801997:	48 89 e5             	mov    %rsp,%rbp
  80199a:	48 83 ec 10          	sub    $0x10,%rsp
  80199e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8019a2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019a6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8019aa:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019ae:	48 83 ec 08          	sub    $0x8,%rsp
  8019b2:	6a 00                	pushq  $0x0
  8019b4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019ba:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019c0:	48 89 d1             	mov    %rdx,%rcx
  8019c3:	48 89 c2             	mov    %rax,%rdx
  8019c6:	be 00 00 00 00       	mov    $0x0,%esi
  8019cb:	bf 00 00 00 00       	mov    $0x0,%edi
  8019d0:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  8019d7:	00 00 00 
  8019da:	ff d0                	callq  *%rax
  8019dc:	48 83 c4 10          	add    $0x10,%rsp
  8019e0:	90                   	nop
  8019e1:	c9                   	leaveq 
  8019e2:	c3                   	retq   

00000000008019e3 <sys_cgetc>:
  8019e3:	55                   	push   %rbp
  8019e4:	48 89 e5             	mov    %rsp,%rbp
  8019e7:	48 83 ec 08          	sub    $0x8,%rsp
  8019eb:	6a 00                	pushq  $0x0
  8019ed:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019f3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019f9:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019fe:	ba 00 00 00 00       	mov    $0x0,%edx
  801a03:	be 00 00 00 00       	mov    $0x0,%esi
  801a08:	bf 01 00 00 00       	mov    $0x1,%edi
  801a0d:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801a14:	00 00 00 
  801a17:	ff d0                	callq  *%rax
  801a19:	48 83 c4 10          	add    $0x10,%rsp
  801a1d:	c9                   	leaveq 
  801a1e:	c3                   	retq   

0000000000801a1f <sys_env_destroy>:
  801a1f:	55                   	push   %rbp
  801a20:	48 89 e5             	mov    %rsp,%rbp
  801a23:	48 83 ec 10          	sub    $0x10,%rsp
  801a27:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a2a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a2d:	48 98                	cltq   
  801a2f:	48 83 ec 08          	sub    $0x8,%rsp
  801a33:	6a 00                	pushq  $0x0
  801a35:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a3b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a41:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a46:	48 89 c2             	mov    %rax,%rdx
  801a49:	be 01 00 00 00       	mov    $0x1,%esi
  801a4e:	bf 03 00 00 00       	mov    $0x3,%edi
  801a53:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801a5a:	00 00 00 
  801a5d:	ff d0                	callq  *%rax
  801a5f:	48 83 c4 10          	add    $0x10,%rsp
  801a63:	c9                   	leaveq 
  801a64:	c3                   	retq   

0000000000801a65 <sys_getenvid>:
  801a65:	55                   	push   %rbp
  801a66:	48 89 e5             	mov    %rsp,%rbp
  801a69:	48 83 ec 08          	sub    $0x8,%rsp
  801a6d:	6a 00                	pushq  $0x0
  801a6f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a75:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a7b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a80:	ba 00 00 00 00       	mov    $0x0,%edx
  801a85:	be 00 00 00 00       	mov    $0x0,%esi
  801a8a:	bf 02 00 00 00       	mov    $0x2,%edi
  801a8f:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801a96:	00 00 00 
  801a99:	ff d0                	callq  *%rax
  801a9b:	48 83 c4 10          	add    $0x10,%rsp
  801a9f:	c9                   	leaveq 
  801aa0:	c3                   	retq   

0000000000801aa1 <sys_yield>:
  801aa1:	55                   	push   %rbp
  801aa2:	48 89 e5             	mov    %rsp,%rbp
  801aa5:	48 83 ec 08          	sub    $0x8,%rsp
  801aa9:	6a 00                	pushq  $0x0
  801aab:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ab1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ab7:	b9 00 00 00 00       	mov    $0x0,%ecx
  801abc:	ba 00 00 00 00       	mov    $0x0,%edx
  801ac1:	be 00 00 00 00       	mov    $0x0,%esi
  801ac6:	bf 0b 00 00 00       	mov    $0xb,%edi
  801acb:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801ad2:	00 00 00 
  801ad5:	ff d0                	callq  *%rax
  801ad7:	48 83 c4 10          	add    $0x10,%rsp
  801adb:	90                   	nop
  801adc:	c9                   	leaveq 
  801add:	c3                   	retq   

0000000000801ade <sys_page_alloc>:
  801ade:	55                   	push   %rbp
  801adf:	48 89 e5             	mov    %rsp,%rbp
  801ae2:	48 83 ec 10          	sub    $0x10,%rsp
  801ae6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ae9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801aed:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801af0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801af3:	48 63 c8             	movslq %eax,%rcx
  801af6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801afa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801afd:	48 98                	cltq   
  801aff:	48 83 ec 08          	sub    $0x8,%rsp
  801b03:	6a 00                	pushq  $0x0
  801b05:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b0b:	49 89 c8             	mov    %rcx,%r8
  801b0e:	48 89 d1             	mov    %rdx,%rcx
  801b11:	48 89 c2             	mov    %rax,%rdx
  801b14:	be 01 00 00 00       	mov    $0x1,%esi
  801b19:	bf 04 00 00 00       	mov    $0x4,%edi
  801b1e:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801b25:	00 00 00 
  801b28:	ff d0                	callq  *%rax
  801b2a:	48 83 c4 10          	add    $0x10,%rsp
  801b2e:	c9                   	leaveq 
  801b2f:	c3                   	retq   

0000000000801b30 <sys_page_map>:
  801b30:	55                   	push   %rbp
  801b31:	48 89 e5             	mov    %rsp,%rbp
  801b34:	48 83 ec 20          	sub    $0x20,%rsp
  801b38:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b3b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b3f:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801b42:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801b46:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801b4a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801b4d:	48 63 c8             	movslq %eax,%rcx
  801b50:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801b54:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b57:	48 63 f0             	movslq %eax,%rsi
  801b5a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b5e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b61:	48 98                	cltq   
  801b63:	48 83 ec 08          	sub    $0x8,%rsp
  801b67:	51                   	push   %rcx
  801b68:	49 89 f9             	mov    %rdi,%r9
  801b6b:	49 89 f0             	mov    %rsi,%r8
  801b6e:	48 89 d1             	mov    %rdx,%rcx
  801b71:	48 89 c2             	mov    %rax,%rdx
  801b74:	be 01 00 00 00       	mov    $0x1,%esi
  801b79:	bf 05 00 00 00       	mov    $0x5,%edi
  801b7e:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801b85:	00 00 00 
  801b88:	ff d0                	callq  *%rax
  801b8a:	48 83 c4 10          	add    $0x10,%rsp
  801b8e:	c9                   	leaveq 
  801b8f:	c3                   	retq   

0000000000801b90 <sys_page_unmap>:
  801b90:	55                   	push   %rbp
  801b91:	48 89 e5             	mov    %rsp,%rbp
  801b94:	48 83 ec 10          	sub    $0x10,%rsp
  801b98:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b9b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b9f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ba3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ba6:	48 98                	cltq   
  801ba8:	48 83 ec 08          	sub    $0x8,%rsp
  801bac:	6a 00                	pushq  $0x0
  801bae:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bb4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bba:	48 89 d1             	mov    %rdx,%rcx
  801bbd:	48 89 c2             	mov    %rax,%rdx
  801bc0:	be 01 00 00 00       	mov    $0x1,%esi
  801bc5:	bf 06 00 00 00       	mov    $0x6,%edi
  801bca:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801bd1:	00 00 00 
  801bd4:	ff d0                	callq  *%rax
  801bd6:	48 83 c4 10          	add    $0x10,%rsp
  801bda:	c9                   	leaveq 
  801bdb:	c3                   	retq   

0000000000801bdc <sys_env_set_status>:
  801bdc:	55                   	push   %rbp
  801bdd:	48 89 e5             	mov    %rsp,%rbp
  801be0:	48 83 ec 10          	sub    $0x10,%rsp
  801be4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801be7:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801bea:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801bed:	48 63 d0             	movslq %eax,%rdx
  801bf0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bf3:	48 98                	cltq   
  801bf5:	48 83 ec 08          	sub    $0x8,%rsp
  801bf9:	6a 00                	pushq  $0x0
  801bfb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c01:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c07:	48 89 d1             	mov    %rdx,%rcx
  801c0a:	48 89 c2             	mov    %rax,%rdx
  801c0d:	be 01 00 00 00       	mov    $0x1,%esi
  801c12:	bf 08 00 00 00       	mov    $0x8,%edi
  801c17:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801c1e:	00 00 00 
  801c21:	ff d0                	callq  *%rax
  801c23:	48 83 c4 10          	add    $0x10,%rsp
  801c27:	c9                   	leaveq 
  801c28:	c3                   	retq   

0000000000801c29 <sys_env_set_trapframe>:
  801c29:	55                   	push   %rbp
  801c2a:	48 89 e5             	mov    %rsp,%rbp
  801c2d:	48 83 ec 10          	sub    $0x10,%rsp
  801c31:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c34:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c38:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c3c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c3f:	48 98                	cltq   
  801c41:	48 83 ec 08          	sub    $0x8,%rsp
  801c45:	6a 00                	pushq  $0x0
  801c47:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c4d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c53:	48 89 d1             	mov    %rdx,%rcx
  801c56:	48 89 c2             	mov    %rax,%rdx
  801c59:	be 01 00 00 00       	mov    $0x1,%esi
  801c5e:	bf 09 00 00 00       	mov    $0x9,%edi
  801c63:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801c6a:	00 00 00 
  801c6d:	ff d0                	callq  *%rax
  801c6f:	48 83 c4 10          	add    $0x10,%rsp
  801c73:	c9                   	leaveq 
  801c74:	c3                   	retq   

0000000000801c75 <sys_env_set_pgfault_upcall>:
  801c75:	55                   	push   %rbp
  801c76:	48 89 e5             	mov    %rsp,%rbp
  801c79:	48 83 ec 10          	sub    $0x10,%rsp
  801c7d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c80:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c84:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c88:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c8b:	48 98                	cltq   
  801c8d:	48 83 ec 08          	sub    $0x8,%rsp
  801c91:	6a 00                	pushq  $0x0
  801c93:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c99:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c9f:	48 89 d1             	mov    %rdx,%rcx
  801ca2:	48 89 c2             	mov    %rax,%rdx
  801ca5:	be 01 00 00 00       	mov    $0x1,%esi
  801caa:	bf 0a 00 00 00       	mov    $0xa,%edi
  801caf:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801cb6:	00 00 00 
  801cb9:	ff d0                	callq  *%rax
  801cbb:	48 83 c4 10          	add    $0x10,%rsp
  801cbf:	c9                   	leaveq 
  801cc0:	c3                   	retq   

0000000000801cc1 <sys_ipc_try_send>:
  801cc1:	55                   	push   %rbp
  801cc2:	48 89 e5             	mov    %rsp,%rbp
  801cc5:	48 83 ec 20          	sub    $0x20,%rsp
  801cc9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ccc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801cd0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801cd4:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801cd7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801cda:	48 63 f0             	movslq %eax,%rsi
  801cdd:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801ce1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ce4:	48 98                	cltq   
  801ce6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801cea:	48 83 ec 08          	sub    $0x8,%rsp
  801cee:	6a 00                	pushq  $0x0
  801cf0:	49 89 f1             	mov    %rsi,%r9
  801cf3:	49 89 c8             	mov    %rcx,%r8
  801cf6:	48 89 d1             	mov    %rdx,%rcx
  801cf9:	48 89 c2             	mov    %rax,%rdx
  801cfc:	be 00 00 00 00       	mov    $0x0,%esi
  801d01:	bf 0c 00 00 00       	mov    $0xc,%edi
  801d06:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801d0d:	00 00 00 
  801d10:	ff d0                	callq  *%rax
  801d12:	48 83 c4 10          	add    $0x10,%rsp
  801d16:	c9                   	leaveq 
  801d17:	c3                   	retq   

0000000000801d18 <sys_ipc_recv>:
  801d18:	55                   	push   %rbp
  801d19:	48 89 e5             	mov    %rsp,%rbp
  801d1c:	48 83 ec 10          	sub    $0x10,%rsp
  801d20:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d24:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d28:	48 83 ec 08          	sub    $0x8,%rsp
  801d2c:	6a 00                	pushq  $0x0
  801d2e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d34:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d3a:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d3f:	48 89 c2             	mov    %rax,%rdx
  801d42:	be 01 00 00 00       	mov    $0x1,%esi
  801d47:	bf 0d 00 00 00       	mov    $0xd,%edi
  801d4c:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801d53:	00 00 00 
  801d56:	ff d0                	callq  *%rax
  801d58:	48 83 c4 10          	add    $0x10,%rsp
  801d5c:	c9                   	leaveq 
  801d5d:	c3                   	retq   

0000000000801d5e <sys_time_msec>:
  801d5e:	55                   	push   %rbp
  801d5f:	48 89 e5             	mov    %rsp,%rbp
  801d62:	48 83 ec 08          	sub    $0x8,%rsp
  801d66:	6a 00                	pushq  $0x0
  801d68:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d6e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d74:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d79:	ba 00 00 00 00       	mov    $0x0,%edx
  801d7e:	be 00 00 00 00       	mov    $0x0,%esi
  801d83:	bf 0e 00 00 00       	mov    $0xe,%edi
  801d88:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801d8f:	00 00 00 
  801d92:	ff d0                	callq  *%rax
  801d94:	48 83 c4 10          	add    $0x10,%rsp
  801d98:	c9                   	leaveq 
  801d99:	c3                   	retq   

0000000000801d9a <sys_net_transmit>:
  801d9a:	55                   	push   %rbp
  801d9b:	48 89 e5             	mov    %rsp,%rbp
  801d9e:	48 83 ec 10          	sub    $0x10,%rsp
  801da2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801da6:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801da9:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801dac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801db0:	48 83 ec 08          	sub    $0x8,%rsp
  801db4:	6a 00                	pushq  $0x0
  801db6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dbc:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dc2:	48 89 d1             	mov    %rdx,%rcx
  801dc5:	48 89 c2             	mov    %rax,%rdx
  801dc8:	be 00 00 00 00       	mov    $0x0,%esi
  801dcd:	bf 0f 00 00 00       	mov    $0xf,%edi
  801dd2:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801dd9:	00 00 00 
  801ddc:	ff d0                	callq  *%rax
  801dde:	48 83 c4 10          	add    $0x10,%rsp
  801de2:	c9                   	leaveq 
  801de3:	c3                   	retq   

0000000000801de4 <sys_net_receive>:
  801de4:	55                   	push   %rbp
  801de5:	48 89 e5             	mov    %rsp,%rbp
  801de8:	48 83 ec 10          	sub    $0x10,%rsp
  801dec:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801df0:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801df3:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801df6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dfa:	48 83 ec 08          	sub    $0x8,%rsp
  801dfe:	6a 00                	pushq  $0x0
  801e00:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e06:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e0c:	48 89 d1             	mov    %rdx,%rcx
  801e0f:	48 89 c2             	mov    %rax,%rdx
  801e12:	be 00 00 00 00       	mov    $0x0,%esi
  801e17:	bf 10 00 00 00       	mov    $0x10,%edi
  801e1c:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801e23:	00 00 00 
  801e26:	ff d0                	callq  *%rax
  801e28:	48 83 c4 10          	add    $0x10,%rsp
  801e2c:	c9                   	leaveq 
  801e2d:	c3                   	retq   

0000000000801e2e <sys_ept_map>:
  801e2e:	55                   	push   %rbp
  801e2f:	48 89 e5             	mov    %rsp,%rbp
  801e32:	48 83 ec 20          	sub    $0x20,%rsp
  801e36:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e39:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e3d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801e40:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801e44:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801e48:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801e4b:	48 63 c8             	movslq %eax,%rcx
  801e4e:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801e52:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e55:	48 63 f0             	movslq %eax,%rsi
  801e58:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e5c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e5f:	48 98                	cltq   
  801e61:	48 83 ec 08          	sub    $0x8,%rsp
  801e65:	51                   	push   %rcx
  801e66:	49 89 f9             	mov    %rdi,%r9
  801e69:	49 89 f0             	mov    %rsi,%r8
  801e6c:	48 89 d1             	mov    %rdx,%rcx
  801e6f:	48 89 c2             	mov    %rax,%rdx
  801e72:	be 00 00 00 00       	mov    $0x0,%esi
  801e77:	bf 11 00 00 00       	mov    $0x11,%edi
  801e7c:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801e83:	00 00 00 
  801e86:	ff d0                	callq  *%rax
  801e88:	48 83 c4 10          	add    $0x10,%rsp
  801e8c:	c9                   	leaveq 
  801e8d:	c3                   	retq   

0000000000801e8e <sys_env_mkguest>:
  801e8e:	55                   	push   %rbp
  801e8f:	48 89 e5             	mov    %rsp,%rbp
  801e92:	48 83 ec 10          	sub    $0x10,%rsp
  801e96:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e9a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e9e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ea2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ea6:	48 83 ec 08          	sub    $0x8,%rsp
  801eaa:	6a 00                	pushq  $0x0
  801eac:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801eb2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801eb8:	48 89 d1             	mov    %rdx,%rcx
  801ebb:	48 89 c2             	mov    %rax,%rdx
  801ebe:	be 00 00 00 00       	mov    $0x0,%esi
  801ec3:	bf 12 00 00 00       	mov    $0x12,%edi
  801ec8:	48 b8 08 19 80 00 00 	movabs $0x801908,%rax
  801ecf:	00 00 00 
  801ed2:	ff d0                	callq  *%rax
  801ed4:	48 83 c4 10          	add    $0x10,%rsp
  801ed8:	c9                   	leaveq 
  801ed9:	c3                   	retq   

0000000000801eda <pgfault>:
  801eda:	55                   	push   %rbp
  801edb:	48 89 e5             	mov    %rsp,%rbp
  801ede:	48 83 ec 30          	sub    $0x30,%rsp
  801ee2:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801ee6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801eea:	48 8b 00             	mov    (%rax),%rax
  801eed:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801ef1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ef5:	48 8b 40 08          	mov    0x8(%rax),%rax
  801ef9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801efc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801eff:	83 e0 02             	and    $0x2,%eax
  801f02:	85 c0                	test   %eax,%eax
  801f04:	75 40                	jne    801f46 <pgfault+0x6c>
  801f06:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f0a:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  801f11:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f15:	49 89 d0             	mov    %rdx,%r8
  801f18:	48 89 c1             	mov    %rax,%rcx
  801f1b:	48 ba b8 50 80 00 00 	movabs $0x8050b8,%rdx
  801f22:	00 00 00 
  801f25:	be 1f 00 00 00       	mov    $0x1f,%esi
  801f2a:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  801f31:	00 00 00 
  801f34:	b8 00 00 00 00       	mov    $0x0,%eax
  801f39:	49 b9 e4 03 80 00 00 	movabs $0x8003e4,%r9
  801f40:	00 00 00 
  801f43:	41 ff d1             	callq  *%r9
  801f46:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f4a:	48 c1 e8 0c          	shr    $0xc,%rax
  801f4e:	48 89 c2             	mov    %rax,%rdx
  801f51:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f58:	01 00 00 
  801f5b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f5f:	25 07 08 00 00       	and    $0x807,%eax
  801f64:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  801f6a:	74 4e                	je     801fba <pgfault+0xe0>
  801f6c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f70:	48 c1 e8 0c          	shr    $0xc,%rax
  801f74:	48 89 c2             	mov    %rax,%rdx
  801f77:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f7e:	01 00 00 
  801f81:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  801f85:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f89:	49 89 d0             	mov    %rdx,%r8
  801f8c:	48 89 c1             	mov    %rax,%rcx
  801f8f:	48 ba e0 50 80 00 00 	movabs $0x8050e0,%rdx
  801f96:	00 00 00 
  801f99:	be 22 00 00 00       	mov    $0x22,%esi
  801f9e:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  801fa5:	00 00 00 
  801fa8:	b8 00 00 00 00       	mov    $0x0,%eax
  801fad:	49 b9 e4 03 80 00 00 	movabs $0x8003e4,%r9
  801fb4:	00 00 00 
  801fb7:	41 ff d1             	callq  *%r9
  801fba:	ba 07 00 00 00       	mov    $0x7,%edx
  801fbf:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801fc4:	bf 00 00 00 00       	mov    $0x0,%edi
  801fc9:	48 b8 de 1a 80 00 00 	movabs $0x801ade,%rax
  801fd0:	00 00 00 
  801fd3:	ff d0                	callq  *%rax
  801fd5:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801fd8:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801fdc:	79 30                	jns    80200e <pgfault+0x134>
  801fde:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801fe1:	89 c1                	mov    %eax,%ecx
  801fe3:	48 ba 0b 51 80 00 00 	movabs $0x80510b,%rdx
  801fea:	00 00 00 
  801fed:	be 30 00 00 00       	mov    $0x30,%esi
  801ff2:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  801ff9:	00 00 00 
  801ffc:	b8 00 00 00 00       	mov    $0x0,%eax
  802001:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  802008:	00 00 00 
  80200b:	41 ff d0             	callq  *%r8
  80200e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802012:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802016:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80201a:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802020:	ba 00 10 00 00       	mov    $0x1000,%edx
  802025:	48 89 c6             	mov    %rax,%rsi
  802028:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  80202d:	48 b8 d3 14 80 00 00 	movabs $0x8014d3,%rax
  802034:	00 00 00 
  802037:	ff d0                	callq  *%rax
  802039:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80203d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802041:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802045:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  80204b:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  802051:	48 89 c1             	mov    %rax,%rcx
  802054:	ba 00 00 00 00       	mov    $0x0,%edx
  802059:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  80205e:	bf 00 00 00 00       	mov    $0x0,%edi
  802063:	48 b8 30 1b 80 00 00 	movabs $0x801b30,%rax
  80206a:	00 00 00 
  80206d:	ff d0                	callq  *%rax
  80206f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802072:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802076:	79 30                	jns    8020a8 <pgfault+0x1ce>
  802078:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80207b:	89 c1                	mov    %eax,%ecx
  80207d:	48 ba 1e 51 80 00 00 	movabs $0x80511e,%rdx
  802084:	00 00 00 
  802087:	be 35 00 00 00       	mov    $0x35,%esi
  80208c:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  802093:	00 00 00 
  802096:	b8 00 00 00 00       	mov    $0x0,%eax
  80209b:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  8020a2:	00 00 00 
  8020a5:	41 ff d0             	callq  *%r8
  8020a8:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8020ad:	bf 00 00 00 00       	mov    $0x0,%edi
  8020b2:	48 b8 90 1b 80 00 00 	movabs $0x801b90,%rax
  8020b9:	00 00 00 
  8020bc:	ff d0                	callq  *%rax
  8020be:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8020c1:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8020c5:	79 30                	jns    8020f7 <pgfault+0x21d>
  8020c7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020ca:	89 c1                	mov    %eax,%ecx
  8020cc:	48 ba 2f 51 80 00 00 	movabs $0x80512f,%rdx
  8020d3:	00 00 00 
  8020d6:	be 39 00 00 00       	mov    $0x39,%esi
  8020db:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  8020e2:	00 00 00 
  8020e5:	b8 00 00 00 00       	mov    $0x0,%eax
  8020ea:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  8020f1:	00 00 00 
  8020f4:	41 ff d0             	callq  *%r8
  8020f7:	90                   	nop
  8020f8:	c9                   	leaveq 
  8020f9:	c3                   	retq   

00000000008020fa <duppage>:
  8020fa:	55                   	push   %rbp
  8020fb:	48 89 e5             	mov    %rsp,%rbp
  8020fe:	48 83 ec 30          	sub    $0x30,%rsp
  802102:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802105:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802108:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80210b:	c1 e0 0c             	shl    $0xc,%eax
  80210e:	89 c0                	mov    %eax,%eax
  802110:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802114:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80211b:	01 00 00 
  80211e:	8b 55 d8             	mov    -0x28(%rbp),%edx
  802121:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802125:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802129:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80212d:	25 02 08 00 00       	and    $0x802,%eax
  802132:	48 85 c0             	test   %rax,%rax
  802135:	74 0e                	je     802145 <duppage+0x4b>
  802137:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80213b:	25 00 04 00 00       	and    $0x400,%eax
  802140:	48 85 c0             	test   %rax,%rax
  802143:	74 70                	je     8021b5 <duppage+0xbb>
  802145:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802149:	25 07 0e 00 00       	and    $0xe07,%eax
  80214e:	89 c6                	mov    %eax,%esi
  802150:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802154:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802157:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80215b:	41 89 f0             	mov    %esi,%r8d
  80215e:	48 89 c6             	mov    %rax,%rsi
  802161:	bf 00 00 00 00       	mov    $0x0,%edi
  802166:	48 b8 30 1b 80 00 00 	movabs $0x801b30,%rax
  80216d:	00 00 00 
  802170:	ff d0                	callq  *%rax
  802172:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802175:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802179:	79 30                	jns    8021ab <duppage+0xb1>
  80217b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80217e:	89 c1                	mov    %eax,%ecx
  802180:	48 ba 1e 51 80 00 00 	movabs $0x80511e,%rdx
  802187:	00 00 00 
  80218a:	be 63 00 00 00       	mov    $0x63,%esi
  80218f:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  802196:	00 00 00 
  802199:	b8 00 00 00 00       	mov    $0x0,%eax
  80219e:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  8021a5:	00 00 00 
  8021a8:	41 ff d0             	callq  *%r8
  8021ab:	b8 00 00 00 00       	mov    $0x0,%eax
  8021b0:	e9 c4 00 00 00       	jmpq   802279 <duppage+0x17f>
  8021b5:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8021b9:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8021bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8021c0:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8021c6:	48 89 c6             	mov    %rax,%rsi
  8021c9:	bf 00 00 00 00       	mov    $0x0,%edi
  8021ce:	48 b8 30 1b 80 00 00 	movabs $0x801b30,%rax
  8021d5:	00 00 00 
  8021d8:	ff d0                	callq  *%rax
  8021da:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8021dd:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8021e1:	79 30                	jns    802213 <duppage+0x119>
  8021e3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8021e6:	89 c1                	mov    %eax,%ecx
  8021e8:	48 ba 1e 51 80 00 00 	movabs $0x80511e,%rdx
  8021ef:	00 00 00 
  8021f2:	be 7e 00 00 00       	mov    $0x7e,%esi
  8021f7:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  8021fe:	00 00 00 
  802201:	b8 00 00 00 00       	mov    $0x0,%eax
  802206:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  80220d:	00 00 00 
  802210:	41 ff d0             	callq  *%r8
  802213:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802217:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80221b:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802221:	48 89 d1             	mov    %rdx,%rcx
  802224:	ba 00 00 00 00       	mov    $0x0,%edx
  802229:	48 89 c6             	mov    %rax,%rsi
  80222c:	bf 00 00 00 00       	mov    $0x0,%edi
  802231:	48 b8 30 1b 80 00 00 	movabs $0x801b30,%rax
  802238:	00 00 00 
  80223b:	ff d0                	callq  *%rax
  80223d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802240:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802244:	79 30                	jns    802276 <duppage+0x17c>
  802246:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802249:	89 c1                	mov    %eax,%ecx
  80224b:	48 ba 1e 51 80 00 00 	movabs $0x80511e,%rdx
  802252:	00 00 00 
  802255:	be 80 00 00 00       	mov    $0x80,%esi
  80225a:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  802261:	00 00 00 
  802264:	b8 00 00 00 00       	mov    $0x0,%eax
  802269:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  802270:	00 00 00 
  802273:	41 ff d0             	callq  *%r8
  802276:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802279:	c9                   	leaveq 
  80227a:	c3                   	retq   

000000000080227b <fork>:
  80227b:	55                   	push   %rbp
  80227c:	48 89 e5             	mov    %rsp,%rbp
  80227f:	48 83 ec 20          	sub    $0x20,%rsp
  802283:	48 bf da 1e 80 00 00 	movabs $0x801eda,%rdi
  80228a:	00 00 00 
  80228d:	48 b8 36 46 80 00 00 	movabs $0x804636,%rax
  802294:	00 00 00 
  802297:	ff d0                	callq  *%rax
  802299:	b8 07 00 00 00       	mov    $0x7,%eax
  80229e:	cd 30                	int    $0x30
  8022a0:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8022a3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8022a6:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8022a9:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8022ad:	79 08                	jns    8022b7 <fork+0x3c>
  8022af:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8022b2:	e9 0b 02 00 00       	jmpq   8024c2 <fork+0x247>
  8022b7:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8022bb:	75 3e                	jne    8022fb <fork+0x80>
  8022bd:	48 b8 65 1a 80 00 00 	movabs $0x801a65,%rax
  8022c4:	00 00 00 
  8022c7:	ff d0                	callq  *%rax
  8022c9:	25 ff 03 00 00       	and    $0x3ff,%eax
  8022ce:	48 98                	cltq   
  8022d0:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8022d7:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8022de:	00 00 00 
  8022e1:	48 01 c2             	add    %rax,%rdx
  8022e4:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  8022eb:	00 00 00 
  8022ee:	48 89 10             	mov    %rdx,(%rax)
  8022f1:	b8 00 00 00 00       	mov    $0x0,%eax
  8022f6:	e9 c7 01 00 00       	jmpq   8024c2 <fork+0x247>
  8022fb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802302:	e9 a6 00 00 00       	jmpq   8023ad <fork+0x132>
  802307:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80230a:	c1 f8 12             	sar    $0x12,%eax
  80230d:	89 c2                	mov    %eax,%edx
  80230f:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  802316:	01 00 00 
  802319:	48 63 d2             	movslq %edx,%rdx
  80231c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802320:	83 e0 01             	and    $0x1,%eax
  802323:	48 85 c0             	test   %rax,%rax
  802326:	74 21                	je     802349 <fork+0xce>
  802328:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80232b:	c1 f8 09             	sar    $0x9,%eax
  80232e:	89 c2                	mov    %eax,%edx
  802330:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802337:	01 00 00 
  80233a:	48 63 d2             	movslq %edx,%rdx
  80233d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802341:	83 e0 01             	and    $0x1,%eax
  802344:	48 85 c0             	test   %rax,%rax
  802347:	75 09                	jne    802352 <fork+0xd7>
  802349:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  802350:	eb 5b                	jmp    8023ad <fork+0x132>
  802352:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802355:	05 00 02 00 00       	add    $0x200,%eax
  80235a:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80235d:	eb 46                	jmp    8023a5 <fork+0x12a>
  80235f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802366:	01 00 00 
  802369:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80236c:	48 63 d2             	movslq %edx,%rdx
  80236f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802373:	83 e0 05             	and    $0x5,%eax
  802376:	48 83 f8 05          	cmp    $0x5,%rax
  80237a:	75 21                	jne    80239d <fork+0x122>
  80237c:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  802383:	74 1b                	je     8023a0 <fork+0x125>
  802385:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802388:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80238b:	89 d6                	mov    %edx,%esi
  80238d:	89 c7                	mov    %eax,%edi
  80238f:	48 b8 fa 20 80 00 00 	movabs $0x8020fa,%rax
  802396:	00 00 00 
  802399:	ff d0                	callq  *%rax
  80239b:	eb 04                	jmp    8023a1 <fork+0x126>
  80239d:	90                   	nop
  80239e:	eb 01                	jmp    8023a1 <fork+0x126>
  8023a0:	90                   	nop
  8023a1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8023a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023a8:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8023ab:	7c b2                	jl     80235f <fork+0xe4>
  8023ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023b0:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  8023b5:	0f 86 4c ff ff ff    	jbe    802307 <fork+0x8c>
  8023bb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023be:	ba 07 00 00 00       	mov    $0x7,%edx
  8023c3:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8023c8:	89 c7                	mov    %eax,%edi
  8023ca:	48 b8 de 1a 80 00 00 	movabs $0x801ade,%rax
  8023d1:	00 00 00 
  8023d4:	ff d0                	callq  *%rax
  8023d6:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8023d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8023dd:	79 30                	jns    80240f <fork+0x194>
  8023df:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8023e2:	89 c1                	mov    %eax,%ecx
  8023e4:	48 ba 48 51 80 00 00 	movabs $0x805148,%rdx
  8023eb:	00 00 00 
  8023ee:	be bc 00 00 00       	mov    $0xbc,%esi
  8023f3:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  8023fa:	00 00 00 
  8023fd:	b8 00 00 00 00       	mov    $0x0,%eax
  802402:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  802409:	00 00 00 
  80240c:	41 ff d0             	callq  *%r8
  80240f:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  802416:	00 00 00 
  802419:	48 8b 00             	mov    (%rax),%rax
  80241c:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  802423:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802426:	48 89 d6             	mov    %rdx,%rsi
  802429:	89 c7                	mov    %eax,%edi
  80242b:	48 b8 75 1c 80 00 00 	movabs $0x801c75,%rax
  802432:	00 00 00 
  802435:	ff d0                	callq  *%rax
  802437:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80243a:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80243e:	79 30                	jns    802470 <fork+0x1f5>
  802440:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802443:	89 c1                	mov    %eax,%ecx
  802445:	48 ba 68 51 80 00 00 	movabs $0x805168,%rdx
  80244c:	00 00 00 
  80244f:	be c0 00 00 00       	mov    $0xc0,%esi
  802454:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  80245b:	00 00 00 
  80245e:	b8 00 00 00 00       	mov    $0x0,%eax
  802463:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  80246a:	00 00 00 
  80246d:	41 ff d0             	callq  *%r8
  802470:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802473:	be 02 00 00 00       	mov    $0x2,%esi
  802478:	89 c7                	mov    %eax,%edi
  80247a:	48 b8 dc 1b 80 00 00 	movabs $0x801bdc,%rax
  802481:	00 00 00 
  802484:	ff d0                	callq  *%rax
  802486:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802489:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80248d:	79 30                	jns    8024bf <fork+0x244>
  80248f:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802492:	89 c1                	mov    %eax,%ecx
  802494:	48 ba 87 51 80 00 00 	movabs $0x805187,%rdx
  80249b:	00 00 00 
  80249e:	be c5 00 00 00       	mov    $0xc5,%esi
  8024a3:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  8024aa:	00 00 00 
  8024ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8024b2:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  8024b9:	00 00 00 
  8024bc:	41 ff d0             	callq  *%r8
  8024bf:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024c2:	c9                   	leaveq 
  8024c3:	c3                   	retq   

00000000008024c4 <sfork>:
  8024c4:	55                   	push   %rbp
  8024c5:	48 89 e5             	mov    %rsp,%rbp
  8024c8:	48 ba 9e 51 80 00 00 	movabs $0x80519e,%rdx
  8024cf:	00 00 00 
  8024d2:	be d2 00 00 00       	mov    $0xd2,%esi
  8024d7:	48 bf d1 50 80 00 00 	movabs $0x8050d1,%rdi
  8024de:	00 00 00 
  8024e1:	b8 00 00 00 00       	mov    $0x0,%eax
  8024e6:	48 b9 e4 03 80 00 00 	movabs $0x8003e4,%rcx
  8024ed:	00 00 00 
  8024f0:	ff d1                	callq  *%rcx

00000000008024f2 <fd2num>:
  8024f2:	55                   	push   %rbp
  8024f3:	48 89 e5             	mov    %rsp,%rbp
  8024f6:	48 83 ec 08          	sub    $0x8,%rsp
  8024fa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8024fe:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802502:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802509:	ff ff ff 
  80250c:	48 01 d0             	add    %rdx,%rax
  80250f:	48 c1 e8 0c          	shr    $0xc,%rax
  802513:	c9                   	leaveq 
  802514:	c3                   	retq   

0000000000802515 <fd2data>:
  802515:	55                   	push   %rbp
  802516:	48 89 e5             	mov    %rsp,%rbp
  802519:	48 83 ec 08          	sub    $0x8,%rsp
  80251d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802521:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802525:	48 89 c7             	mov    %rax,%rdi
  802528:	48 b8 f2 24 80 00 00 	movabs $0x8024f2,%rax
  80252f:	00 00 00 
  802532:	ff d0                	callq  *%rax
  802534:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  80253a:	48 c1 e0 0c          	shl    $0xc,%rax
  80253e:	c9                   	leaveq 
  80253f:	c3                   	retq   

0000000000802540 <fd_alloc>:
  802540:	55                   	push   %rbp
  802541:	48 89 e5             	mov    %rsp,%rbp
  802544:	48 83 ec 18          	sub    $0x18,%rsp
  802548:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80254c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802553:	eb 6b                	jmp    8025c0 <fd_alloc+0x80>
  802555:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802558:	48 98                	cltq   
  80255a:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802560:	48 c1 e0 0c          	shl    $0xc,%rax
  802564:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802568:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80256c:	48 c1 e8 15          	shr    $0x15,%rax
  802570:	48 89 c2             	mov    %rax,%rdx
  802573:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80257a:	01 00 00 
  80257d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802581:	83 e0 01             	and    $0x1,%eax
  802584:	48 85 c0             	test   %rax,%rax
  802587:	74 21                	je     8025aa <fd_alloc+0x6a>
  802589:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80258d:	48 c1 e8 0c          	shr    $0xc,%rax
  802591:	48 89 c2             	mov    %rax,%rdx
  802594:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80259b:	01 00 00 
  80259e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8025a2:	83 e0 01             	and    $0x1,%eax
  8025a5:	48 85 c0             	test   %rax,%rax
  8025a8:	75 12                	jne    8025bc <fd_alloc+0x7c>
  8025aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025ae:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8025b2:	48 89 10             	mov    %rdx,(%rax)
  8025b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8025ba:	eb 1a                	jmp    8025d6 <fd_alloc+0x96>
  8025bc:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8025c0:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8025c4:	7e 8f                	jle    802555 <fd_alloc+0x15>
  8025c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025ca:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8025d1:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8025d6:	c9                   	leaveq 
  8025d7:	c3                   	retq   

00000000008025d8 <fd_lookup>:
  8025d8:	55                   	push   %rbp
  8025d9:	48 89 e5             	mov    %rsp,%rbp
  8025dc:	48 83 ec 20          	sub    $0x20,%rsp
  8025e0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8025e3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8025e7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8025eb:	78 06                	js     8025f3 <fd_lookup+0x1b>
  8025ed:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8025f1:	7e 07                	jle    8025fa <fd_lookup+0x22>
  8025f3:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8025f8:	eb 6c                	jmp    802666 <fd_lookup+0x8e>
  8025fa:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8025fd:	48 98                	cltq   
  8025ff:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802605:	48 c1 e0 0c          	shl    $0xc,%rax
  802609:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80260d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802611:	48 c1 e8 15          	shr    $0x15,%rax
  802615:	48 89 c2             	mov    %rax,%rdx
  802618:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80261f:	01 00 00 
  802622:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802626:	83 e0 01             	and    $0x1,%eax
  802629:	48 85 c0             	test   %rax,%rax
  80262c:	74 21                	je     80264f <fd_lookup+0x77>
  80262e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802632:	48 c1 e8 0c          	shr    $0xc,%rax
  802636:	48 89 c2             	mov    %rax,%rdx
  802639:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802640:	01 00 00 
  802643:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802647:	83 e0 01             	and    $0x1,%eax
  80264a:	48 85 c0             	test   %rax,%rax
  80264d:	75 07                	jne    802656 <fd_lookup+0x7e>
  80264f:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802654:	eb 10                	jmp    802666 <fd_lookup+0x8e>
  802656:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80265a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80265e:	48 89 10             	mov    %rdx,(%rax)
  802661:	b8 00 00 00 00       	mov    $0x0,%eax
  802666:	c9                   	leaveq 
  802667:	c3                   	retq   

0000000000802668 <fd_close>:
  802668:	55                   	push   %rbp
  802669:	48 89 e5             	mov    %rsp,%rbp
  80266c:	48 83 ec 30          	sub    $0x30,%rsp
  802670:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802674:	89 f0                	mov    %esi,%eax
  802676:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802679:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80267d:	48 89 c7             	mov    %rax,%rdi
  802680:	48 b8 f2 24 80 00 00 	movabs $0x8024f2,%rax
  802687:	00 00 00 
  80268a:	ff d0                	callq  *%rax
  80268c:	89 c2                	mov    %eax,%edx
  80268e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802692:	48 89 c6             	mov    %rax,%rsi
  802695:	89 d7                	mov    %edx,%edi
  802697:	48 b8 d8 25 80 00 00 	movabs $0x8025d8,%rax
  80269e:	00 00 00 
  8026a1:	ff d0                	callq  *%rax
  8026a3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026a6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026aa:	78 0a                	js     8026b6 <fd_close+0x4e>
  8026ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026b0:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8026b4:	74 12                	je     8026c8 <fd_close+0x60>
  8026b6:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8026ba:	74 05                	je     8026c1 <fd_close+0x59>
  8026bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026bf:	eb 70                	jmp    802731 <fd_close+0xc9>
  8026c1:	b8 00 00 00 00       	mov    $0x0,%eax
  8026c6:	eb 69                	jmp    802731 <fd_close+0xc9>
  8026c8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8026cc:	8b 00                	mov    (%rax),%eax
  8026ce:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8026d2:	48 89 d6             	mov    %rdx,%rsi
  8026d5:	89 c7                	mov    %eax,%edi
  8026d7:	48 b8 33 27 80 00 00 	movabs $0x802733,%rax
  8026de:	00 00 00 
  8026e1:	ff d0                	callq  *%rax
  8026e3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026e6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026ea:	78 2a                	js     802716 <fd_close+0xae>
  8026ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026f0:	48 8b 40 20          	mov    0x20(%rax),%rax
  8026f4:	48 85 c0             	test   %rax,%rax
  8026f7:	74 16                	je     80270f <fd_close+0xa7>
  8026f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026fd:	48 8b 40 20          	mov    0x20(%rax),%rax
  802701:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802705:	48 89 d7             	mov    %rdx,%rdi
  802708:	ff d0                	callq  *%rax
  80270a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80270d:	eb 07                	jmp    802716 <fd_close+0xae>
  80270f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802716:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80271a:	48 89 c6             	mov    %rax,%rsi
  80271d:	bf 00 00 00 00       	mov    $0x0,%edi
  802722:	48 b8 90 1b 80 00 00 	movabs $0x801b90,%rax
  802729:	00 00 00 
  80272c:	ff d0                	callq  *%rax
  80272e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802731:	c9                   	leaveq 
  802732:	c3                   	retq   

0000000000802733 <dev_lookup>:
  802733:	55                   	push   %rbp
  802734:	48 89 e5             	mov    %rsp,%rbp
  802737:	48 83 ec 20          	sub    $0x20,%rsp
  80273b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80273e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802742:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802749:	eb 41                	jmp    80278c <dev_lookup+0x59>
  80274b:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802752:	00 00 00 
  802755:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802758:	48 63 d2             	movslq %edx,%rdx
  80275b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80275f:	8b 00                	mov    (%rax),%eax
  802761:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802764:	75 22                	jne    802788 <dev_lookup+0x55>
  802766:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80276d:	00 00 00 
  802770:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802773:	48 63 d2             	movslq %edx,%rdx
  802776:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80277a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80277e:	48 89 10             	mov    %rdx,(%rax)
  802781:	b8 00 00 00 00       	mov    $0x0,%eax
  802786:	eb 60                	jmp    8027e8 <dev_lookup+0xb5>
  802788:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80278c:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802793:	00 00 00 
  802796:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802799:	48 63 d2             	movslq %edx,%rdx
  80279c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8027a0:	48 85 c0             	test   %rax,%rax
  8027a3:	75 a6                	jne    80274b <dev_lookup+0x18>
  8027a5:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  8027ac:	00 00 00 
  8027af:	48 8b 00             	mov    (%rax),%rax
  8027b2:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8027b8:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8027bb:	89 c6                	mov    %eax,%esi
  8027bd:	48 bf b8 51 80 00 00 	movabs $0x8051b8,%rdi
  8027c4:	00 00 00 
  8027c7:	b8 00 00 00 00       	mov    $0x0,%eax
  8027cc:	48 b9 1e 06 80 00 00 	movabs $0x80061e,%rcx
  8027d3:	00 00 00 
  8027d6:	ff d1                	callq  *%rcx
  8027d8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8027dc:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8027e3:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8027e8:	c9                   	leaveq 
  8027e9:	c3                   	retq   

00000000008027ea <close>:
  8027ea:	55                   	push   %rbp
  8027eb:	48 89 e5             	mov    %rsp,%rbp
  8027ee:	48 83 ec 20          	sub    $0x20,%rsp
  8027f2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8027f5:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8027f9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8027fc:	48 89 d6             	mov    %rdx,%rsi
  8027ff:	89 c7                	mov    %eax,%edi
  802801:	48 b8 d8 25 80 00 00 	movabs $0x8025d8,%rax
  802808:	00 00 00 
  80280b:	ff d0                	callq  *%rax
  80280d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802810:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802814:	79 05                	jns    80281b <close+0x31>
  802816:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802819:	eb 18                	jmp    802833 <close+0x49>
  80281b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80281f:	be 01 00 00 00       	mov    $0x1,%esi
  802824:	48 89 c7             	mov    %rax,%rdi
  802827:	48 b8 68 26 80 00 00 	movabs $0x802668,%rax
  80282e:	00 00 00 
  802831:	ff d0                	callq  *%rax
  802833:	c9                   	leaveq 
  802834:	c3                   	retq   

0000000000802835 <close_all>:
  802835:	55                   	push   %rbp
  802836:	48 89 e5             	mov    %rsp,%rbp
  802839:	48 83 ec 10          	sub    $0x10,%rsp
  80283d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802844:	eb 15                	jmp    80285b <close_all+0x26>
  802846:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802849:	89 c7                	mov    %eax,%edi
  80284b:	48 b8 ea 27 80 00 00 	movabs $0x8027ea,%rax
  802852:	00 00 00 
  802855:	ff d0                	callq  *%rax
  802857:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80285b:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80285f:	7e e5                	jle    802846 <close_all+0x11>
  802861:	90                   	nop
  802862:	c9                   	leaveq 
  802863:	c3                   	retq   

0000000000802864 <dup>:
  802864:	55                   	push   %rbp
  802865:	48 89 e5             	mov    %rsp,%rbp
  802868:	48 83 ec 40          	sub    $0x40,%rsp
  80286c:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80286f:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802872:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802876:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802879:	48 89 d6             	mov    %rdx,%rsi
  80287c:	89 c7                	mov    %eax,%edi
  80287e:	48 b8 d8 25 80 00 00 	movabs $0x8025d8,%rax
  802885:	00 00 00 
  802888:	ff d0                	callq  *%rax
  80288a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80288d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802891:	79 08                	jns    80289b <dup+0x37>
  802893:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802896:	e9 70 01 00 00       	jmpq   802a0b <dup+0x1a7>
  80289b:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80289e:	89 c7                	mov    %eax,%edi
  8028a0:	48 b8 ea 27 80 00 00 	movabs $0x8027ea,%rax
  8028a7:	00 00 00 
  8028aa:	ff d0                	callq  *%rax
  8028ac:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8028af:	48 98                	cltq   
  8028b1:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8028b7:	48 c1 e0 0c          	shl    $0xc,%rax
  8028bb:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8028bf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028c3:	48 89 c7             	mov    %rax,%rdi
  8028c6:	48 b8 15 25 80 00 00 	movabs $0x802515,%rax
  8028cd:	00 00 00 
  8028d0:	ff d0                	callq  *%rax
  8028d2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8028d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028da:	48 89 c7             	mov    %rax,%rdi
  8028dd:	48 b8 15 25 80 00 00 	movabs $0x802515,%rax
  8028e4:	00 00 00 
  8028e7:	ff d0                	callq  *%rax
  8028e9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8028ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028f1:	48 c1 e8 15          	shr    $0x15,%rax
  8028f5:	48 89 c2             	mov    %rax,%rdx
  8028f8:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8028ff:	01 00 00 
  802902:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802906:	83 e0 01             	and    $0x1,%eax
  802909:	48 85 c0             	test   %rax,%rax
  80290c:	74 71                	je     80297f <dup+0x11b>
  80290e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802912:	48 c1 e8 0c          	shr    $0xc,%rax
  802916:	48 89 c2             	mov    %rax,%rdx
  802919:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802920:	01 00 00 
  802923:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802927:	83 e0 01             	and    $0x1,%eax
  80292a:	48 85 c0             	test   %rax,%rax
  80292d:	74 50                	je     80297f <dup+0x11b>
  80292f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802933:	48 c1 e8 0c          	shr    $0xc,%rax
  802937:	48 89 c2             	mov    %rax,%rdx
  80293a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802941:	01 00 00 
  802944:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802948:	25 07 0e 00 00       	and    $0xe07,%eax
  80294d:	89 c1                	mov    %eax,%ecx
  80294f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802953:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802957:	41 89 c8             	mov    %ecx,%r8d
  80295a:	48 89 d1             	mov    %rdx,%rcx
  80295d:	ba 00 00 00 00       	mov    $0x0,%edx
  802962:	48 89 c6             	mov    %rax,%rsi
  802965:	bf 00 00 00 00       	mov    $0x0,%edi
  80296a:	48 b8 30 1b 80 00 00 	movabs $0x801b30,%rax
  802971:	00 00 00 
  802974:	ff d0                	callq  *%rax
  802976:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802979:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80297d:	78 55                	js     8029d4 <dup+0x170>
  80297f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802983:	48 c1 e8 0c          	shr    $0xc,%rax
  802987:	48 89 c2             	mov    %rax,%rdx
  80298a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802991:	01 00 00 
  802994:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802998:	25 07 0e 00 00       	and    $0xe07,%eax
  80299d:	89 c1                	mov    %eax,%ecx
  80299f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029a3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8029a7:	41 89 c8             	mov    %ecx,%r8d
  8029aa:	48 89 d1             	mov    %rdx,%rcx
  8029ad:	ba 00 00 00 00       	mov    $0x0,%edx
  8029b2:	48 89 c6             	mov    %rax,%rsi
  8029b5:	bf 00 00 00 00       	mov    $0x0,%edi
  8029ba:	48 b8 30 1b 80 00 00 	movabs $0x801b30,%rax
  8029c1:	00 00 00 
  8029c4:	ff d0                	callq  *%rax
  8029c6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029c9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029cd:	78 08                	js     8029d7 <dup+0x173>
  8029cf:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8029d2:	eb 37                	jmp    802a0b <dup+0x1a7>
  8029d4:	90                   	nop
  8029d5:	eb 01                	jmp    8029d8 <dup+0x174>
  8029d7:	90                   	nop
  8029d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029dc:	48 89 c6             	mov    %rax,%rsi
  8029df:	bf 00 00 00 00       	mov    $0x0,%edi
  8029e4:	48 b8 90 1b 80 00 00 	movabs $0x801b90,%rax
  8029eb:	00 00 00 
  8029ee:	ff d0                	callq  *%rax
  8029f0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029f4:	48 89 c6             	mov    %rax,%rsi
  8029f7:	bf 00 00 00 00       	mov    $0x0,%edi
  8029fc:	48 b8 90 1b 80 00 00 	movabs $0x801b90,%rax
  802a03:	00 00 00 
  802a06:	ff d0                	callq  *%rax
  802a08:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a0b:	c9                   	leaveq 
  802a0c:	c3                   	retq   

0000000000802a0d <read>:
  802a0d:	55                   	push   %rbp
  802a0e:	48 89 e5             	mov    %rsp,%rbp
  802a11:	48 83 ec 40          	sub    $0x40,%rsp
  802a15:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802a18:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802a1c:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802a20:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802a24:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802a27:	48 89 d6             	mov    %rdx,%rsi
  802a2a:	89 c7                	mov    %eax,%edi
  802a2c:	48 b8 d8 25 80 00 00 	movabs $0x8025d8,%rax
  802a33:	00 00 00 
  802a36:	ff d0                	callq  *%rax
  802a38:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a3b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a3f:	78 24                	js     802a65 <read+0x58>
  802a41:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a45:	8b 00                	mov    (%rax),%eax
  802a47:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802a4b:	48 89 d6             	mov    %rdx,%rsi
  802a4e:	89 c7                	mov    %eax,%edi
  802a50:	48 b8 33 27 80 00 00 	movabs $0x802733,%rax
  802a57:	00 00 00 
  802a5a:	ff d0                	callq  *%rax
  802a5c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a5f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a63:	79 05                	jns    802a6a <read+0x5d>
  802a65:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a68:	eb 76                	jmp    802ae0 <read+0xd3>
  802a6a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a6e:	8b 40 08             	mov    0x8(%rax),%eax
  802a71:	83 e0 03             	and    $0x3,%eax
  802a74:	83 f8 01             	cmp    $0x1,%eax
  802a77:	75 3a                	jne    802ab3 <read+0xa6>
  802a79:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  802a80:	00 00 00 
  802a83:	48 8b 00             	mov    (%rax),%rax
  802a86:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802a8c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802a8f:	89 c6                	mov    %eax,%esi
  802a91:	48 bf d7 51 80 00 00 	movabs $0x8051d7,%rdi
  802a98:	00 00 00 
  802a9b:	b8 00 00 00 00       	mov    $0x0,%eax
  802aa0:	48 b9 1e 06 80 00 00 	movabs $0x80061e,%rcx
  802aa7:	00 00 00 
  802aaa:	ff d1                	callq  *%rcx
  802aac:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802ab1:	eb 2d                	jmp    802ae0 <read+0xd3>
  802ab3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ab7:	48 8b 40 10          	mov    0x10(%rax),%rax
  802abb:	48 85 c0             	test   %rax,%rax
  802abe:	75 07                	jne    802ac7 <read+0xba>
  802ac0:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802ac5:	eb 19                	jmp    802ae0 <read+0xd3>
  802ac7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802acb:	48 8b 40 10          	mov    0x10(%rax),%rax
  802acf:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802ad3:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802ad7:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802adb:	48 89 cf             	mov    %rcx,%rdi
  802ade:	ff d0                	callq  *%rax
  802ae0:	c9                   	leaveq 
  802ae1:	c3                   	retq   

0000000000802ae2 <readn>:
  802ae2:	55                   	push   %rbp
  802ae3:	48 89 e5             	mov    %rsp,%rbp
  802ae6:	48 83 ec 30          	sub    $0x30,%rsp
  802aea:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802aed:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802af1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802af5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802afc:	eb 47                	jmp    802b45 <readn+0x63>
  802afe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b01:	48 98                	cltq   
  802b03:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802b07:	48 29 c2             	sub    %rax,%rdx
  802b0a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b0d:	48 63 c8             	movslq %eax,%rcx
  802b10:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b14:	48 01 c1             	add    %rax,%rcx
  802b17:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b1a:	48 89 ce             	mov    %rcx,%rsi
  802b1d:	89 c7                	mov    %eax,%edi
  802b1f:	48 b8 0d 2a 80 00 00 	movabs $0x802a0d,%rax
  802b26:	00 00 00 
  802b29:	ff d0                	callq  *%rax
  802b2b:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802b2e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802b32:	79 05                	jns    802b39 <readn+0x57>
  802b34:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b37:	eb 1d                	jmp    802b56 <readn+0x74>
  802b39:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802b3d:	74 13                	je     802b52 <readn+0x70>
  802b3f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b42:	01 45 fc             	add    %eax,-0x4(%rbp)
  802b45:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b48:	48 98                	cltq   
  802b4a:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802b4e:	72 ae                	jb     802afe <readn+0x1c>
  802b50:	eb 01                	jmp    802b53 <readn+0x71>
  802b52:	90                   	nop
  802b53:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b56:	c9                   	leaveq 
  802b57:	c3                   	retq   

0000000000802b58 <write>:
  802b58:	55                   	push   %rbp
  802b59:	48 89 e5             	mov    %rsp,%rbp
  802b5c:	48 83 ec 40          	sub    $0x40,%rsp
  802b60:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802b63:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802b67:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802b6b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802b6f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802b72:	48 89 d6             	mov    %rdx,%rsi
  802b75:	89 c7                	mov    %eax,%edi
  802b77:	48 b8 d8 25 80 00 00 	movabs $0x8025d8,%rax
  802b7e:	00 00 00 
  802b81:	ff d0                	callq  *%rax
  802b83:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b86:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b8a:	78 24                	js     802bb0 <write+0x58>
  802b8c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b90:	8b 00                	mov    (%rax),%eax
  802b92:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802b96:	48 89 d6             	mov    %rdx,%rsi
  802b99:	89 c7                	mov    %eax,%edi
  802b9b:	48 b8 33 27 80 00 00 	movabs $0x802733,%rax
  802ba2:	00 00 00 
  802ba5:	ff d0                	callq  *%rax
  802ba7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802baa:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802bae:	79 05                	jns    802bb5 <write+0x5d>
  802bb0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bb3:	eb 75                	jmp    802c2a <write+0xd2>
  802bb5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bb9:	8b 40 08             	mov    0x8(%rax),%eax
  802bbc:	83 e0 03             	and    $0x3,%eax
  802bbf:	85 c0                	test   %eax,%eax
  802bc1:	75 3a                	jne    802bfd <write+0xa5>
  802bc3:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  802bca:	00 00 00 
  802bcd:	48 8b 00             	mov    (%rax),%rax
  802bd0:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802bd6:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802bd9:	89 c6                	mov    %eax,%esi
  802bdb:	48 bf f3 51 80 00 00 	movabs $0x8051f3,%rdi
  802be2:	00 00 00 
  802be5:	b8 00 00 00 00       	mov    $0x0,%eax
  802bea:	48 b9 1e 06 80 00 00 	movabs $0x80061e,%rcx
  802bf1:	00 00 00 
  802bf4:	ff d1                	callq  *%rcx
  802bf6:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802bfb:	eb 2d                	jmp    802c2a <write+0xd2>
  802bfd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c01:	48 8b 40 18          	mov    0x18(%rax),%rax
  802c05:	48 85 c0             	test   %rax,%rax
  802c08:	75 07                	jne    802c11 <write+0xb9>
  802c0a:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802c0f:	eb 19                	jmp    802c2a <write+0xd2>
  802c11:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c15:	48 8b 40 18          	mov    0x18(%rax),%rax
  802c19:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802c1d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802c21:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802c25:	48 89 cf             	mov    %rcx,%rdi
  802c28:	ff d0                	callq  *%rax
  802c2a:	c9                   	leaveq 
  802c2b:	c3                   	retq   

0000000000802c2c <seek>:
  802c2c:	55                   	push   %rbp
  802c2d:	48 89 e5             	mov    %rsp,%rbp
  802c30:	48 83 ec 18          	sub    $0x18,%rsp
  802c34:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802c37:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802c3a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c3e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802c41:	48 89 d6             	mov    %rdx,%rsi
  802c44:	89 c7                	mov    %eax,%edi
  802c46:	48 b8 d8 25 80 00 00 	movabs $0x8025d8,%rax
  802c4d:	00 00 00 
  802c50:	ff d0                	callq  *%rax
  802c52:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c55:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c59:	79 05                	jns    802c60 <seek+0x34>
  802c5b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c5e:	eb 0f                	jmp    802c6f <seek+0x43>
  802c60:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c64:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802c67:	89 50 04             	mov    %edx,0x4(%rax)
  802c6a:	b8 00 00 00 00       	mov    $0x0,%eax
  802c6f:	c9                   	leaveq 
  802c70:	c3                   	retq   

0000000000802c71 <ftruncate>:
  802c71:	55                   	push   %rbp
  802c72:	48 89 e5             	mov    %rsp,%rbp
  802c75:	48 83 ec 30          	sub    $0x30,%rsp
  802c79:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802c7c:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802c7f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802c83:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802c86:	48 89 d6             	mov    %rdx,%rsi
  802c89:	89 c7                	mov    %eax,%edi
  802c8b:	48 b8 d8 25 80 00 00 	movabs $0x8025d8,%rax
  802c92:	00 00 00 
  802c95:	ff d0                	callq  *%rax
  802c97:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c9a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c9e:	78 24                	js     802cc4 <ftruncate+0x53>
  802ca0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ca4:	8b 00                	mov    (%rax),%eax
  802ca6:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802caa:	48 89 d6             	mov    %rdx,%rsi
  802cad:	89 c7                	mov    %eax,%edi
  802caf:	48 b8 33 27 80 00 00 	movabs $0x802733,%rax
  802cb6:	00 00 00 
  802cb9:	ff d0                	callq  *%rax
  802cbb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cbe:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cc2:	79 05                	jns    802cc9 <ftruncate+0x58>
  802cc4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cc7:	eb 72                	jmp    802d3b <ftruncate+0xca>
  802cc9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ccd:	8b 40 08             	mov    0x8(%rax),%eax
  802cd0:	83 e0 03             	and    $0x3,%eax
  802cd3:	85 c0                	test   %eax,%eax
  802cd5:	75 3a                	jne    802d11 <ftruncate+0xa0>
  802cd7:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  802cde:	00 00 00 
  802ce1:	48 8b 00             	mov    (%rax),%rax
  802ce4:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802cea:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802ced:	89 c6                	mov    %eax,%esi
  802cef:	48 bf 10 52 80 00 00 	movabs $0x805210,%rdi
  802cf6:	00 00 00 
  802cf9:	b8 00 00 00 00       	mov    $0x0,%eax
  802cfe:	48 b9 1e 06 80 00 00 	movabs $0x80061e,%rcx
  802d05:	00 00 00 
  802d08:	ff d1                	callq  *%rcx
  802d0a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802d0f:	eb 2a                	jmp    802d3b <ftruncate+0xca>
  802d11:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d15:	48 8b 40 30          	mov    0x30(%rax),%rax
  802d19:	48 85 c0             	test   %rax,%rax
  802d1c:	75 07                	jne    802d25 <ftruncate+0xb4>
  802d1e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802d23:	eb 16                	jmp    802d3b <ftruncate+0xca>
  802d25:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d29:	48 8b 40 30          	mov    0x30(%rax),%rax
  802d2d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802d31:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802d34:	89 ce                	mov    %ecx,%esi
  802d36:	48 89 d7             	mov    %rdx,%rdi
  802d39:	ff d0                	callq  *%rax
  802d3b:	c9                   	leaveq 
  802d3c:	c3                   	retq   

0000000000802d3d <fstat>:
  802d3d:	55                   	push   %rbp
  802d3e:	48 89 e5             	mov    %rsp,%rbp
  802d41:	48 83 ec 30          	sub    $0x30,%rsp
  802d45:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802d48:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802d4c:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802d50:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802d53:	48 89 d6             	mov    %rdx,%rsi
  802d56:	89 c7                	mov    %eax,%edi
  802d58:	48 b8 d8 25 80 00 00 	movabs $0x8025d8,%rax
  802d5f:	00 00 00 
  802d62:	ff d0                	callq  *%rax
  802d64:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d67:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d6b:	78 24                	js     802d91 <fstat+0x54>
  802d6d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d71:	8b 00                	mov    (%rax),%eax
  802d73:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d77:	48 89 d6             	mov    %rdx,%rsi
  802d7a:	89 c7                	mov    %eax,%edi
  802d7c:	48 b8 33 27 80 00 00 	movabs $0x802733,%rax
  802d83:	00 00 00 
  802d86:	ff d0                	callq  *%rax
  802d88:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d8b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d8f:	79 05                	jns    802d96 <fstat+0x59>
  802d91:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d94:	eb 5e                	jmp    802df4 <fstat+0xb7>
  802d96:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d9a:	48 8b 40 28          	mov    0x28(%rax),%rax
  802d9e:	48 85 c0             	test   %rax,%rax
  802da1:	75 07                	jne    802daa <fstat+0x6d>
  802da3:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802da8:	eb 4a                	jmp    802df4 <fstat+0xb7>
  802daa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802dae:	c6 00 00             	movb   $0x0,(%rax)
  802db1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802db5:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802dbc:	00 00 00 
  802dbf:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802dc3:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802dca:	00 00 00 
  802dcd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802dd1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802dd5:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802ddc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802de0:	48 8b 40 28          	mov    0x28(%rax),%rax
  802de4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802de8:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802dec:	48 89 ce             	mov    %rcx,%rsi
  802def:	48 89 d7             	mov    %rdx,%rdi
  802df2:	ff d0                	callq  *%rax
  802df4:	c9                   	leaveq 
  802df5:	c3                   	retq   

0000000000802df6 <stat>:
  802df6:	55                   	push   %rbp
  802df7:	48 89 e5             	mov    %rsp,%rbp
  802dfa:	48 83 ec 20          	sub    $0x20,%rsp
  802dfe:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802e02:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802e06:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e0a:	be 00 00 00 00       	mov    $0x0,%esi
  802e0f:	48 89 c7             	mov    %rax,%rdi
  802e12:	48 b8 e6 2e 80 00 00 	movabs $0x802ee6,%rax
  802e19:	00 00 00 
  802e1c:	ff d0                	callq  *%rax
  802e1e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e21:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e25:	79 05                	jns    802e2c <stat+0x36>
  802e27:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e2a:	eb 2f                	jmp    802e5b <stat+0x65>
  802e2c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802e30:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e33:	48 89 d6             	mov    %rdx,%rsi
  802e36:	89 c7                	mov    %eax,%edi
  802e38:	48 b8 3d 2d 80 00 00 	movabs $0x802d3d,%rax
  802e3f:	00 00 00 
  802e42:	ff d0                	callq  *%rax
  802e44:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802e47:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e4a:	89 c7                	mov    %eax,%edi
  802e4c:	48 b8 ea 27 80 00 00 	movabs $0x8027ea,%rax
  802e53:	00 00 00 
  802e56:	ff d0                	callq  *%rax
  802e58:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e5b:	c9                   	leaveq 
  802e5c:	c3                   	retq   

0000000000802e5d <fsipc>:
  802e5d:	55                   	push   %rbp
  802e5e:	48 89 e5             	mov    %rsp,%rbp
  802e61:	48 83 ec 10          	sub    $0x10,%rsp
  802e65:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802e68:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802e6c:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802e73:	00 00 00 
  802e76:	8b 00                	mov    (%rax),%eax
  802e78:	85 c0                	test   %eax,%eax
  802e7a:	75 1f                	jne    802e9b <fsipc+0x3e>
  802e7c:	bf 01 00 00 00       	mov    $0x1,%edi
  802e81:	48 b8 2a 49 80 00 00 	movabs $0x80492a,%rax
  802e88:	00 00 00 
  802e8b:	ff d0                	callq  *%rax
  802e8d:	89 c2                	mov    %eax,%edx
  802e8f:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802e96:	00 00 00 
  802e99:	89 10                	mov    %edx,(%rax)
  802e9b:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802ea2:	00 00 00 
  802ea5:	8b 00                	mov    (%rax),%eax
  802ea7:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802eaa:	b9 07 00 00 00       	mov    $0x7,%ecx
  802eaf:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  802eb6:	00 00 00 
  802eb9:	89 c7                	mov    %eax,%edi
  802ebb:	48 b8 20 48 80 00 00 	movabs $0x804820,%rax
  802ec2:	00 00 00 
  802ec5:	ff d0                	callq  *%rax
  802ec7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ecb:	ba 00 00 00 00       	mov    $0x0,%edx
  802ed0:	48 89 c6             	mov    %rax,%rsi
  802ed3:	bf 00 00 00 00       	mov    $0x0,%edi
  802ed8:	48 b8 5f 47 80 00 00 	movabs $0x80475f,%rax
  802edf:	00 00 00 
  802ee2:	ff d0                	callq  *%rax
  802ee4:	c9                   	leaveq 
  802ee5:	c3                   	retq   

0000000000802ee6 <open>:
  802ee6:	55                   	push   %rbp
  802ee7:	48 89 e5             	mov    %rsp,%rbp
  802eea:	48 83 ec 20          	sub    $0x20,%rsp
  802eee:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802ef2:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802ef5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ef9:	48 89 c7             	mov    %rax,%rdi
  802efc:	48 b8 42 11 80 00 00 	movabs $0x801142,%rax
  802f03:	00 00 00 
  802f06:	ff d0                	callq  *%rax
  802f08:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802f0d:	7e 0a                	jle    802f19 <open+0x33>
  802f0f:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802f14:	e9 a5 00 00 00       	jmpq   802fbe <open+0xd8>
  802f19:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802f1d:	48 89 c7             	mov    %rax,%rdi
  802f20:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  802f27:	00 00 00 
  802f2a:	ff d0                	callq  *%rax
  802f2c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f2f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f33:	79 08                	jns    802f3d <open+0x57>
  802f35:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f38:	e9 81 00 00 00       	jmpq   802fbe <open+0xd8>
  802f3d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f41:	48 89 c6             	mov    %rax,%rsi
  802f44:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  802f4b:	00 00 00 
  802f4e:	48 b8 ae 11 80 00 00 	movabs $0x8011ae,%rax
  802f55:	00 00 00 
  802f58:	ff d0                	callq  *%rax
  802f5a:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802f61:	00 00 00 
  802f64:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802f67:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802f6d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f71:	48 89 c6             	mov    %rax,%rsi
  802f74:	bf 01 00 00 00       	mov    $0x1,%edi
  802f79:	48 b8 5d 2e 80 00 00 	movabs $0x802e5d,%rax
  802f80:	00 00 00 
  802f83:	ff d0                	callq  *%rax
  802f85:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f88:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f8c:	79 1d                	jns    802fab <open+0xc5>
  802f8e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f92:	be 00 00 00 00       	mov    $0x0,%esi
  802f97:	48 89 c7             	mov    %rax,%rdi
  802f9a:	48 b8 68 26 80 00 00 	movabs $0x802668,%rax
  802fa1:	00 00 00 
  802fa4:	ff d0                	callq  *%rax
  802fa6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fa9:	eb 13                	jmp    802fbe <open+0xd8>
  802fab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802faf:	48 89 c7             	mov    %rax,%rdi
  802fb2:	48 b8 f2 24 80 00 00 	movabs $0x8024f2,%rax
  802fb9:	00 00 00 
  802fbc:	ff d0                	callq  *%rax
  802fbe:	c9                   	leaveq 
  802fbf:	c3                   	retq   

0000000000802fc0 <devfile_flush>:
  802fc0:	55                   	push   %rbp
  802fc1:	48 89 e5             	mov    %rsp,%rbp
  802fc4:	48 83 ec 10          	sub    $0x10,%rsp
  802fc8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802fcc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802fd0:	8b 50 0c             	mov    0xc(%rax),%edx
  802fd3:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802fda:	00 00 00 
  802fdd:	89 10                	mov    %edx,(%rax)
  802fdf:	be 00 00 00 00       	mov    $0x0,%esi
  802fe4:	bf 06 00 00 00       	mov    $0x6,%edi
  802fe9:	48 b8 5d 2e 80 00 00 	movabs $0x802e5d,%rax
  802ff0:	00 00 00 
  802ff3:	ff d0                	callq  *%rax
  802ff5:	c9                   	leaveq 
  802ff6:	c3                   	retq   

0000000000802ff7 <devfile_read>:
  802ff7:	55                   	push   %rbp
  802ff8:	48 89 e5             	mov    %rsp,%rbp
  802ffb:	48 83 ec 30          	sub    $0x30,%rsp
  802fff:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803003:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803007:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80300b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80300f:	8b 50 0c             	mov    0xc(%rax),%edx
  803012:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803019:	00 00 00 
  80301c:	89 10                	mov    %edx,(%rax)
  80301e:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803025:	00 00 00 
  803028:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80302c:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803030:	be 00 00 00 00       	mov    $0x0,%esi
  803035:	bf 03 00 00 00       	mov    $0x3,%edi
  80303a:	48 b8 5d 2e 80 00 00 	movabs $0x802e5d,%rax
  803041:	00 00 00 
  803044:	ff d0                	callq  *%rax
  803046:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803049:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80304d:	79 08                	jns    803057 <devfile_read+0x60>
  80304f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803052:	e9 a4 00 00 00       	jmpq   8030fb <devfile_read+0x104>
  803057:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80305a:	48 98                	cltq   
  80305c:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803060:	76 35                	jbe    803097 <devfile_read+0xa0>
  803062:	48 b9 36 52 80 00 00 	movabs $0x805236,%rcx
  803069:	00 00 00 
  80306c:	48 ba 3d 52 80 00 00 	movabs $0x80523d,%rdx
  803073:	00 00 00 
  803076:	be 89 00 00 00       	mov    $0x89,%esi
  80307b:	48 bf 52 52 80 00 00 	movabs $0x805252,%rdi
  803082:	00 00 00 
  803085:	b8 00 00 00 00       	mov    $0x0,%eax
  80308a:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  803091:	00 00 00 
  803094:	41 ff d0             	callq  *%r8
  803097:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  80309e:	7e 35                	jle    8030d5 <devfile_read+0xde>
  8030a0:	48 b9 60 52 80 00 00 	movabs $0x805260,%rcx
  8030a7:	00 00 00 
  8030aa:	48 ba 3d 52 80 00 00 	movabs $0x80523d,%rdx
  8030b1:	00 00 00 
  8030b4:	be 8a 00 00 00       	mov    $0x8a,%esi
  8030b9:	48 bf 52 52 80 00 00 	movabs $0x805252,%rdi
  8030c0:	00 00 00 
  8030c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8030c8:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  8030cf:	00 00 00 
  8030d2:	41 ff d0             	callq  *%r8
  8030d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030d8:	48 63 d0             	movslq %eax,%rdx
  8030db:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8030df:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8030e6:	00 00 00 
  8030e9:	48 89 c7             	mov    %rax,%rdi
  8030ec:	48 b8 d3 14 80 00 00 	movabs $0x8014d3,%rax
  8030f3:	00 00 00 
  8030f6:	ff d0                	callq  *%rax
  8030f8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030fb:	c9                   	leaveq 
  8030fc:	c3                   	retq   

00000000008030fd <devfile_write>:
  8030fd:	55                   	push   %rbp
  8030fe:	48 89 e5             	mov    %rsp,%rbp
  803101:	48 83 ec 40          	sub    $0x40,%rsp
  803105:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803109:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80310d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803111:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803115:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803119:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  803120:	00 
  803121:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803125:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  803129:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  80312e:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  803132:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803136:	8b 50 0c             	mov    0xc(%rax),%edx
  803139:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803140:	00 00 00 
  803143:	89 10                	mov    %edx,(%rax)
  803145:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80314c:	00 00 00 
  80314f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803153:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803157:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80315b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80315f:	48 89 c6             	mov    %rax,%rsi
  803162:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  803169:	00 00 00 
  80316c:	48 b8 d3 14 80 00 00 	movabs $0x8014d3,%rax
  803173:	00 00 00 
  803176:	ff d0                	callq  *%rax
  803178:	be 00 00 00 00       	mov    $0x0,%esi
  80317d:	bf 04 00 00 00       	mov    $0x4,%edi
  803182:	48 b8 5d 2e 80 00 00 	movabs $0x802e5d,%rax
  803189:	00 00 00 
  80318c:	ff d0                	callq  *%rax
  80318e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803191:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803195:	79 05                	jns    80319c <devfile_write+0x9f>
  803197:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80319a:	eb 43                	jmp    8031df <devfile_write+0xe2>
  80319c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80319f:	48 98                	cltq   
  8031a1:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8031a5:	76 35                	jbe    8031dc <devfile_write+0xdf>
  8031a7:	48 b9 36 52 80 00 00 	movabs $0x805236,%rcx
  8031ae:	00 00 00 
  8031b1:	48 ba 3d 52 80 00 00 	movabs $0x80523d,%rdx
  8031b8:	00 00 00 
  8031bb:	be a8 00 00 00       	mov    $0xa8,%esi
  8031c0:	48 bf 52 52 80 00 00 	movabs $0x805252,%rdi
  8031c7:	00 00 00 
  8031ca:	b8 00 00 00 00       	mov    $0x0,%eax
  8031cf:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  8031d6:	00 00 00 
  8031d9:	41 ff d0             	callq  *%r8
  8031dc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8031df:	c9                   	leaveq 
  8031e0:	c3                   	retq   

00000000008031e1 <devfile_stat>:
  8031e1:	55                   	push   %rbp
  8031e2:	48 89 e5             	mov    %rsp,%rbp
  8031e5:	48 83 ec 20          	sub    $0x20,%rsp
  8031e9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8031ed:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8031f1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8031f5:	8b 50 0c             	mov    0xc(%rax),%edx
  8031f8:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8031ff:	00 00 00 
  803202:	89 10                	mov    %edx,(%rax)
  803204:	be 00 00 00 00       	mov    $0x0,%esi
  803209:	bf 05 00 00 00       	mov    $0x5,%edi
  80320e:	48 b8 5d 2e 80 00 00 	movabs $0x802e5d,%rax
  803215:	00 00 00 
  803218:	ff d0                	callq  *%rax
  80321a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80321d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803221:	79 05                	jns    803228 <devfile_stat+0x47>
  803223:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803226:	eb 56                	jmp    80327e <devfile_stat+0x9d>
  803228:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80322c:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  803233:	00 00 00 
  803236:	48 89 c7             	mov    %rax,%rdi
  803239:	48 b8 ae 11 80 00 00 	movabs $0x8011ae,%rax
  803240:	00 00 00 
  803243:	ff d0                	callq  *%rax
  803245:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80324c:	00 00 00 
  80324f:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803255:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803259:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80325f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803266:	00 00 00 
  803269:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  80326f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803273:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803279:	b8 00 00 00 00       	mov    $0x0,%eax
  80327e:	c9                   	leaveq 
  80327f:	c3                   	retq   

0000000000803280 <devfile_trunc>:
  803280:	55                   	push   %rbp
  803281:	48 89 e5             	mov    %rsp,%rbp
  803284:	48 83 ec 10          	sub    $0x10,%rsp
  803288:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80328c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80328f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803293:	8b 50 0c             	mov    0xc(%rax),%edx
  803296:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80329d:	00 00 00 
  8032a0:	89 10                	mov    %edx,(%rax)
  8032a2:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8032a9:	00 00 00 
  8032ac:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8032af:	89 50 04             	mov    %edx,0x4(%rax)
  8032b2:	be 00 00 00 00       	mov    $0x0,%esi
  8032b7:	bf 02 00 00 00       	mov    $0x2,%edi
  8032bc:	48 b8 5d 2e 80 00 00 	movabs $0x802e5d,%rax
  8032c3:	00 00 00 
  8032c6:	ff d0                	callq  *%rax
  8032c8:	c9                   	leaveq 
  8032c9:	c3                   	retq   

00000000008032ca <remove>:
  8032ca:	55                   	push   %rbp
  8032cb:	48 89 e5             	mov    %rsp,%rbp
  8032ce:	48 83 ec 10          	sub    $0x10,%rsp
  8032d2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8032d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8032da:	48 89 c7             	mov    %rax,%rdi
  8032dd:	48 b8 42 11 80 00 00 	movabs $0x801142,%rax
  8032e4:	00 00 00 
  8032e7:	ff d0                	callq  *%rax
  8032e9:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8032ee:	7e 07                	jle    8032f7 <remove+0x2d>
  8032f0:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8032f5:	eb 33                	jmp    80332a <remove+0x60>
  8032f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8032fb:	48 89 c6             	mov    %rax,%rsi
  8032fe:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  803305:	00 00 00 
  803308:	48 b8 ae 11 80 00 00 	movabs $0x8011ae,%rax
  80330f:	00 00 00 
  803312:	ff d0                	callq  *%rax
  803314:	be 00 00 00 00       	mov    $0x0,%esi
  803319:	bf 07 00 00 00       	mov    $0x7,%edi
  80331e:	48 b8 5d 2e 80 00 00 	movabs $0x802e5d,%rax
  803325:	00 00 00 
  803328:	ff d0                	callq  *%rax
  80332a:	c9                   	leaveq 
  80332b:	c3                   	retq   

000000000080332c <sync>:
  80332c:	55                   	push   %rbp
  80332d:	48 89 e5             	mov    %rsp,%rbp
  803330:	be 00 00 00 00       	mov    $0x0,%esi
  803335:	bf 08 00 00 00       	mov    $0x8,%edi
  80333a:	48 b8 5d 2e 80 00 00 	movabs $0x802e5d,%rax
  803341:	00 00 00 
  803344:	ff d0                	callq  *%rax
  803346:	5d                   	pop    %rbp
  803347:	c3                   	retq   

0000000000803348 <copy>:
  803348:	55                   	push   %rbp
  803349:	48 89 e5             	mov    %rsp,%rbp
  80334c:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  803353:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  80335a:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803361:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803368:	be 00 00 00 00       	mov    $0x0,%esi
  80336d:	48 89 c7             	mov    %rax,%rdi
  803370:	48 b8 e6 2e 80 00 00 	movabs $0x802ee6,%rax
  803377:	00 00 00 
  80337a:	ff d0                	callq  *%rax
  80337c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80337f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803383:	79 28                	jns    8033ad <copy+0x65>
  803385:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803388:	89 c6                	mov    %eax,%esi
  80338a:	48 bf 6c 52 80 00 00 	movabs $0x80526c,%rdi
  803391:	00 00 00 
  803394:	b8 00 00 00 00       	mov    $0x0,%eax
  803399:	48 ba 1e 06 80 00 00 	movabs $0x80061e,%rdx
  8033a0:	00 00 00 
  8033a3:	ff d2                	callq  *%rdx
  8033a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033a8:	e9 76 01 00 00       	jmpq   803523 <copy+0x1db>
  8033ad:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  8033b4:	be 01 01 00 00       	mov    $0x101,%esi
  8033b9:	48 89 c7             	mov    %rax,%rdi
  8033bc:	48 b8 e6 2e 80 00 00 	movabs $0x802ee6,%rax
  8033c3:	00 00 00 
  8033c6:	ff d0                	callq  *%rax
  8033c8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8033cb:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8033cf:	0f 89 ad 00 00 00    	jns    803482 <copy+0x13a>
  8033d5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8033d8:	89 c6                	mov    %eax,%esi
  8033da:	48 bf 82 52 80 00 00 	movabs $0x805282,%rdi
  8033e1:	00 00 00 
  8033e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8033e9:	48 ba 1e 06 80 00 00 	movabs $0x80061e,%rdx
  8033f0:	00 00 00 
  8033f3:	ff d2                	callq  *%rdx
  8033f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033f8:	89 c7                	mov    %eax,%edi
  8033fa:	48 b8 ea 27 80 00 00 	movabs $0x8027ea,%rax
  803401:	00 00 00 
  803404:	ff d0                	callq  *%rax
  803406:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803409:	e9 15 01 00 00       	jmpq   803523 <copy+0x1db>
  80340e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803411:	48 63 d0             	movslq %eax,%rdx
  803414:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  80341b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80341e:	48 89 ce             	mov    %rcx,%rsi
  803421:	89 c7                	mov    %eax,%edi
  803423:	48 b8 58 2b 80 00 00 	movabs $0x802b58,%rax
  80342a:	00 00 00 
  80342d:	ff d0                	callq  *%rax
  80342f:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803432:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803436:	79 4a                	jns    803482 <copy+0x13a>
  803438:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80343b:	89 c6                	mov    %eax,%esi
  80343d:	48 bf 9c 52 80 00 00 	movabs $0x80529c,%rdi
  803444:	00 00 00 
  803447:	b8 00 00 00 00       	mov    $0x0,%eax
  80344c:	48 ba 1e 06 80 00 00 	movabs $0x80061e,%rdx
  803453:	00 00 00 
  803456:	ff d2                	callq  *%rdx
  803458:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80345b:	89 c7                	mov    %eax,%edi
  80345d:	48 b8 ea 27 80 00 00 	movabs $0x8027ea,%rax
  803464:	00 00 00 
  803467:	ff d0                	callq  *%rax
  803469:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80346c:	89 c7                	mov    %eax,%edi
  80346e:	48 b8 ea 27 80 00 00 	movabs $0x8027ea,%rax
  803475:	00 00 00 
  803478:	ff d0                	callq  *%rax
  80347a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80347d:	e9 a1 00 00 00       	jmpq   803523 <copy+0x1db>
  803482:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803489:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80348c:	ba 00 02 00 00       	mov    $0x200,%edx
  803491:	48 89 ce             	mov    %rcx,%rsi
  803494:	89 c7                	mov    %eax,%edi
  803496:	48 b8 0d 2a 80 00 00 	movabs $0x802a0d,%rax
  80349d:	00 00 00 
  8034a0:	ff d0                	callq  *%rax
  8034a2:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8034a5:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8034a9:	0f 8f 5f ff ff ff    	jg     80340e <copy+0xc6>
  8034af:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8034b3:	79 47                	jns    8034fc <copy+0x1b4>
  8034b5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8034b8:	89 c6                	mov    %eax,%esi
  8034ba:	48 bf af 52 80 00 00 	movabs $0x8052af,%rdi
  8034c1:	00 00 00 
  8034c4:	b8 00 00 00 00       	mov    $0x0,%eax
  8034c9:	48 ba 1e 06 80 00 00 	movabs $0x80061e,%rdx
  8034d0:	00 00 00 
  8034d3:	ff d2                	callq  *%rdx
  8034d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034d8:	89 c7                	mov    %eax,%edi
  8034da:	48 b8 ea 27 80 00 00 	movabs $0x8027ea,%rax
  8034e1:	00 00 00 
  8034e4:	ff d0                	callq  *%rax
  8034e6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034e9:	89 c7                	mov    %eax,%edi
  8034eb:	48 b8 ea 27 80 00 00 	movabs $0x8027ea,%rax
  8034f2:	00 00 00 
  8034f5:	ff d0                	callq  *%rax
  8034f7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8034fa:	eb 27                	jmp    803523 <copy+0x1db>
  8034fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034ff:	89 c7                	mov    %eax,%edi
  803501:	48 b8 ea 27 80 00 00 	movabs $0x8027ea,%rax
  803508:	00 00 00 
  80350b:	ff d0                	callq  *%rax
  80350d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803510:	89 c7                	mov    %eax,%edi
  803512:	48 b8 ea 27 80 00 00 	movabs $0x8027ea,%rax
  803519:	00 00 00 
  80351c:	ff d0                	callq  *%rax
  80351e:	b8 00 00 00 00       	mov    $0x0,%eax
  803523:	c9                   	leaveq 
  803524:	c3                   	retq   

0000000000803525 <fd2sockid>:
  803525:	55                   	push   %rbp
  803526:	48 89 e5             	mov    %rsp,%rbp
  803529:	48 83 ec 20          	sub    $0x20,%rsp
  80352d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803530:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803534:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803537:	48 89 d6             	mov    %rdx,%rsi
  80353a:	89 c7                	mov    %eax,%edi
  80353c:	48 b8 d8 25 80 00 00 	movabs $0x8025d8,%rax
  803543:	00 00 00 
  803546:	ff d0                	callq  *%rax
  803548:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80354b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80354f:	79 05                	jns    803556 <fd2sockid+0x31>
  803551:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803554:	eb 24                	jmp    80357a <fd2sockid+0x55>
  803556:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80355a:	8b 10                	mov    (%rax),%edx
  80355c:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803563:	00 00 00 
  803566:	8b 00                	mov    (%rax),%eax
  803568:	39 c2                	cmp    %eax,%edx
  80356a:	74 07                	je     803573 <fd2sockid+0x4e>
  80356c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803571:	eb 07                	jmp    80357a <fd2sockid+0x55>
  803573:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803577:	8b 40 0c             	mov    0xc(%rax),%eax
  80357a:	c9                   	leaveq 
  80357b:	c3                   	retq   

000000000080357c <alloc_sockfd>:
  80357c:	55                   	push   %rbp
  80357d:	48 89 e5             	mov    %rsp,%rbp
  803580:	48 83 ec 20          	sub    $0x20,%rsp
  803584:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803587:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80358b:	48 89 c7             	mov    %rax,%rdi
  80358e:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  803595:	00 00 00 
  803598:	ff d0                	callq  *%rax
  80359a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80359d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035a1:	78 26                	js     8035c9 <alloc_sockfd+0x4d>
  8035a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035a7:	ba 07 04 00 00       	mov    $0x407,%edx
  8035ac:	48 89 c6             	mov    %rax,%rsi
  8035af:	bf 00 00 00 00       	mov    $0x0,%edi
  8035b4:	48 b8 de 1a 80 00 00 	movabs $0x801ade,%rax
  8035bb:	00 00 00 
  8035be:	ff d0                	callq  *%rax
  8035c0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035c3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035c7:	79 16                	jns    8035df <alloc_sockfd+0x63>
  8035c9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8035cc:	89 c7                	mov    %eax,%edi
  8035ce:	48 b8 8b 3a 80 00 00 	movabs $0x803a8b,%rax
  8035d5:	00 00 00 
  8035d8:	ff d0                	callq  *%rax
  8035da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035dd:	eb 3a                	jmp    803619 <alloc_sockfd+0x9d>
  8035df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035e3:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  8035ea:	00 00 00 
  8035ed:	8b 12                	mov    (%rdx),%edx
  8035ef:	89 10                	mov    %edx,(%rax)
  8035f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035f5:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8035fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803600:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803603:	89 50 0c             	mov    %edx,0xc(%rax)
  803606:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80360a:	48 89 c7             	mov    %rax,%rdi
  80360d:	48 b8 f2 24 80 00 00 	movabs $0x8024f2,%rax
  803614:	00 00 00 
  803617:	ff d0                	callq  *%rax
  803619:	c9                   	leaveq 
  80361a:	c3                   	retq   

000000000080361b <accept>:
  80361b:	55                   	push   %rbp
  80361c:	48 89 e5             	mov    %rsp,%rbp
  80361f:	48 83 ec 30          	sub    $0x30,%rsp
  803623:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803626:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80362a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80362e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803631:	89 c7                	mov    %eax,%edi
  803633:	48 b8 25 35 80 00 00 	movabs $0x803525,%rax
  80363a:	00 00 00 
  80363d:	ff d0                	callq  *%rax
  80363f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803642:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803646:	79 05                	jns    80364d <accept+0x32>
  803648:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80364b:	eb 3b                	jmp    803688 <accept+0x6d>
  80364d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803651:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803655:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803658:	48 89 ce             	mov    %rcx,%rsi
  80365b:	89 c7                	mov    %eax,%edi
  80365d:	48 b8 68 39 80 00 00 	movabs $0x803968,%rax
  803664:	00 00 00 
  803667:	ff d0                	callq  *%rax
  803669:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80366c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803670:	79 05                	jns    803677 <accept+0x5c>
  803672:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803675:	eb 11                	jmp    803688 <accept+0x6d>
  803677:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80367a:	89 c7                	mov    %eax,%edi
  80367c:	48 b8 7c 35 80 00 00 	movabs $0x80357c,%rax
  803683:	00 00 00 
  803686:	ff d0                	callq  *%rax
  803688:	c9                   	leaveq 
  803689:	c3                   	retq   

000000000080368a <bind>:
  80368a:	55                   	push   %rbp
  80368b:	48 89 e5             	mov    %rsp,%rbp
  80368e:	48 83 ec 20          	sub    $0x20,%rsp
  803692:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803695:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803699:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80369c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80369f:	89 c7                	mov    %eax,%edi
  8036a1:	48 b8 25 35 80 00 00 	movabs $0x803525,%rax
  8036a8:	00 00 00 
  8036ab:	ff d0                	callq  *%rax
  8036ad:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036b0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036b4:	79 05                	jns    8036bb <bind+0x31>
  8036b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036b9:	eb 1b                	jmp    8036d6 <bind+0x4c>
  8036bb:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8036be:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8036c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036c5:	48 89 ce             	mov    %rcx,%rsi
  8036c8:	89 c7                	mov    %eax,%edi
  8036ca:	48 b8 e7 39 80 00 00 	movabs $0x8039e7,%rax
  8036d1:	00 00 00 
  8036d4:	ff d0                	callq  *%rax
  8036d6:	c9                   	leaveq 
  8036d7:	c3                   	retq   

00000000008036d8 <shutdown>:
  8036d8:	55                   	push   %rbp
  8036d9:	48 89 e5             	mov    %rsp,%rbp
  8036dc:	48 83 ec 20          	sub    $0x20,%rsp
  8036e0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8036e3:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8036e6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036e9:	89 c7                	mov    %eax,%edi
  8036eb:	48 b8 25 35 80 00 00 	movabs $0x803525,%rax
  8036f2:	00 00 00 
  8036f5:	ff d0                	callq  *%rax
  8036f7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036fa:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036fe:	79 05                	jns    803705 <shutdown+0x2d>
  803700:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803703:	eb 16                	jmp    80371b <shutdown+0x43>
  803705:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803708:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80370b:	89 d6                	mov    %edx,%esi
  80370d:	89 c7                	mov    %eax,%edi
  80370f:	48 b8 4b 3a 80 00 00 	movabs $0x803a4b,%rax
  803716:	00 00 00 
  803719:	ff d0                	callq  *%rax
  80371b:	c9                   	leaveq 
  80371c:	c3                   	retq   

000000000080371d <devsock_close>:
  80371d:	55                   	push   %rbp
  80371e:	48 89 e5             	mov    %rsp,%rbp
  803721:	48 83 ec 10          	sub    $0x10,%rsp
  803725:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803729:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80372d:	48 89 c7             	mov    %rax,%rdi
  803730:	48 b8 9b 49 80 00 00 	movabs $0x80499b,%rax
  803737:	00 00 00 
  80373a:	ff d0                	callq  *%rax
  80373c:	83 f8 01             	cmp    $0x1,%eax
  80373f:	75 17                	jne    803758 <devsock_close+0x3b>
  803741:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803745:	8b 40 0c             	mov    0xc(%rax),%eax
  803748:	89 c7                	mov    %eax,%edi
  80374a:	48 b8 8b 3a 80 00 00 	movabs $0x803a8b,%rax
  803751:	00 00 00 
  803754:	ff d0                	callq  *%rax
  803756:	eb 05                	jmp    80375d <devsock_close+0x40>
  803758:	b8 00 00 00 00       	mov    $0x0,%eax
  80375d:	c9                   	leaveq 
  80375e:	c3                   	retq   

000000000080375f <connect>:
  80375f:	55                   	push   %rbp
  803760:	48 89 e5             	mov    %rsp,%rbp
  803763:	48 83 ec 20          	sub    $0x20,%rsp
  803767:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80376a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80376e:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803771:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803774:	89 c7                	mov    %eax,%edi
  803776:	48 b8 25 35 80 00 00 	movabs $0x803525,%rax
  80377d:	00 00 00 
  803780:	ff d0                	callq  *%rax
  803782:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803785:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803789:	79 05                	jns    803790 <connect+0x31>
  80378b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80378e:	eb 1b                	jmp    8037ab <connect+0x4c>
  803790:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803793:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803797:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80379a:	48 89 ce             	mov    %rcx,%rsi
  80379d:	89 c7                	mov    %eax,%edi
  80379f:	48 b8 b8 3a 80 00 00 	movabs $0x803ab8,%rax
  8037a6:	00 00 00 
  8037a9:	ff d0                	callq  *%rax
  8037ab:	c9                   	leaveq 
  8037ac:	c3                   	retq   

00000000008037ad <listen>:
  8037ad:	55                   	push   %rbp
  8037ae:	48 89 e5             	mov    %rsp,%rbp
  8037b1:	48 83 ec 20          	sub    $0x20,%rsp
  8037b5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8037b8:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8037bb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037be:	89 c7                	mov    %eax,%edi
  8037c0:	48 b8 25 35 80 00 00 	movabs $0x803525,%rax
  8037c7:	00 00 00 
  8037ca:	ff d0                	callq  *%rax
  8037cc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037cf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037d3:	79 05                	jns    8037da <listen+0x2d>
  8037d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037d8:	eb 16                	jmp    8037f0 <listen+0x43>
  8037da:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8037dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037e0:	89 d6                	mov    %edx,%esi
  8037e2:	89 c7                	mov    %eax,%edi
  8037e4:	48 b8 1c 3b 80 00 00 	movabs $0x803b1c,%rax
  8037eb:	00 00 00 
  8037ee:	ff d0                	callq  *%rax
  8037f0:	c9                   	leaveq 
  8037f1:	c3                   	retq   

00000000008037f2 <devsock_read>:
  8037f2:	55                   	push   %rbp
  8037f3:	48 89 e5             	mov    %rsp,%rbp
  8037f6:	48 83 ec 20          	sub    $0x20,%rsp
  8037fa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8037fe:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803802:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803806:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80380a:	89 c2                	mov    %eax,%edx
  80380c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803810:	8b 40 0c             	mov    0xc(%rax),%eax
  803813:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803817:	b9 00 00 00 00       	mov    $0x0,%ecx
  80381c:	89 c7                	mov    %eax,%edi
  80381e:	48 b8 5c 3b 80 00 00 	movabs $0x803b5c,%rax
  803825:	00 00 00 
  803828:	ff d0                	callq  *%rax
  80382a:	c9                   	leaveq 
  80382b:	c3                   	retq   

000000000080382c <devsock_write>:
  80382c:	55                   	push   %rbp
  80382d:	48 89 e5             	mov    %rsp,%rbp
  803830:	48 83 ec 20          	sub    $0x20,%rsp
  803834:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803838:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80383c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803840:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803844:	89 c2                	mov    %eax,%edx
  803846:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80384a:	8b 40 0c             	mov    0xc(%rax),%eax
  80384d:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803851:	b9 00 00 00 00       	mov    $0x0,%ecx
  803856:	89 c7                	mov    %eax,%edi
  803858:	48 b8 28 3c 80 00 00 	movabs $0x803c28,%rax
  80385f:	00 00 00 
  803862:	ff d0                	callq  *%rax
  803864:	c9                   	leaveq 
  803865:	c3                   	retq   

0000000000803866 <devsock_stat>:
  803866:	55                   	push   %rbp
  803867:	48 89 e5             	mov    %rsp,%rbp
  80386a:	48 83 ec 10          	sub    $0x10,%rsp
  80386e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803872:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803876:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80387a:	48 be ca 52 80 00 00 	movabs $0x8052ca,%rsi
  803881:	00 00 00 
  803884:	48 89 c7             	mov    %rax,%rdi
  803887:	48 b8 ae 11 80 00 00 	movabs $0x8011ae,%rax
  80388e:	00 00 00 
  803891:	ff d0                	callq  *%rax
  803893:	b8 00 00 00 00       	mov    $0x0,%eax
  803898:	c9                   	leaveq 
  803899:	c3                   	retq   

000000000080389a <socket>:
  80389a:	55                   	push   %rbp
  80389b:	48 89 e5             	mov    %rsp,%rbp
  80389e:	48 83 ec 20          	sub    $0x20,%rsp
  8038a2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8038a5:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8038a8:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  8038ab:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8038ae:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8038b1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8038b4:	89 ce                	mov    %ecx,%esi
  8038b6:	89 c7                	mov    %eax,%edi
  8038b8:	48 b8 e0 3c 80 00 00 	movabs $0x803ce0,%rax
  8038bf:	00 00 00 
  8038c2:	ff d0                	callq  *%rax
  8038c4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038c7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038cb:	79 05                	jns    8038d2 <socket+0x38>
  8038cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038d0:	eb 11                	jmp    8038e3 <socket+0x49>
  8038d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038d5:	89 c7                	mov    %eax,%edi
  8038d7:	48 b8 7c 35 80 00 00 	movabs $0x80357c,%rax
  8038de:	00 00 00 
  8038e1:	ff d0                	callq  *%rax
  8038e3:	c9                   	leaveq 
  8038e4:	c3                   	retq   

00000000008038e5 <nsipc>:
  8038e5:	55                   	push   %rbp
  8038e6:	48 89 e5             	mov    %rsp,%rbp
  8038e9:	48 83 ec 10          	sub    $0x10,%rsp
  8038ed:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8038f0:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  8038f7:	00 00 00 
  8038fa:	8b 00                	mov    (%rax),%eax
  8038fc:	85 c0                	test   %eax,%eax
  8038fe:	75 1f                	jne    80391f <nsipc+0x3a>
  803900:	bf 02 00 00 00       	mov    $0x2,%edi
  803905:	48 b8 2a 49 80 00 00 	movabs $0x80492a,%rax
  80390c:	00 00 00 
  80390f:	ff d0                	callq  *%rax
  803911:	89 c2                	mov    %eax,%edx
  803913:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  80391a:	00 00 00 
  80391d:	89 10                	mov    %edx,(%rax)
  80391f:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803926:	00 00 00 
  803929:	8b 00                	mov    (%rax),%eax
  80392b:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80392e:	b9 07 00 00 00       	mov    $0x7,%ecx
  803933:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  80393a:	00 00 00 
  80393d:	89 c7                	mov    %eax,%edi
  80393f:	48 b8 20 48 80 00 00 	movabs $0x804820,%rax
  803946:	00 00 00 
  803949:	ff d0                	callq  *%rax
  80394b:	ba 00 00 00 00       	mov    $0x0,%edx
  803950:	be 00 00 00 00       	mov    $0x0,%esi
  803955:	bf 00 00 00 00       	mov    $0x0,%edi
  80395a:	48 b8 5f 47 80 00 00 	movabs $0x80475f,%rax
  803961:	00 00 00 
  803964:	ff d0                	callq  *%rax
  803966:	c9                   	leaveq 
  803967:	c3                   	retq   

0000000000803968 <nsipc_accept>:
  803968:	55                   	push   %rbp
  803969:	48 89 e5             	mov    %rsp,%rbp
  80396c:	48 83 ec 30          	sub    $0x30,%rsp
  803970:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803973:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803977:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80397b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803982:	00 00 00 
  803985:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803988:	89 10                	mov    %edx,(%rax)
  80398a:	bf 01 00 00 00       	mov    $0x1,%edi
  80398f:	48 b8 e5 38 80 00 00 	movabs $0x8038e5,%rax
  803996:	00 00 00 
  803999:	ff d0                	callq  *%rax
  80399b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80399e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039a2:	78 3e                	js     8039e2 <nsipc_accept+0x7a>
  8039a4:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8039ab:	00 00 00 
  8039ae:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8039b2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039b6:	8b 40 10             	mov    0x10(%rax),%eax
  8039b9:	89 c2                	mov    %eax,%edx
  8039bb:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8039bf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8039c3:	48 89 ce             	mov    %rcx,%rsi
  8039c6:	48 89 c7             	mov    %rax,%rdi
  8039c9:	48 b8 d3 14 80 00 00 	movabs $0x8014d3,%rax
  8039d0:	00 00 00 
  8039d3:	ff d0                	callq  *%rax
  8039d5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039d9:	8b 50 10             	mov    0x10(%rax),%edx
  8039dc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8039e0:	89 10                	mov    %edx,(%rax)
  8039e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039e5:	c9                   	leaveq 
  8039e6:	c3                   	retq   

00000000008039e7 <nsipc_bind>:
  8039e7:	55                   	push   %rbp
  8039e8:	48 89 e5             	mov    %rsp,%rbp
  8039eb:	48 83 ec 10          	sub    $0x10,%rsp
  8039ef:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8039f2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8039f6:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8039f9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a00:	00 00 00 
  803a03:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803a06:	89 10                	mov    %edx,(%rax)
  803a08:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803a0b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a0f:	48 89 c6             	mov    %rax,%rsi
  803a12:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803a19:	00 00 00 
  803a1c:	48 b8 d3 14 80 00 00 	movabs $0x8014d3,%rax
  803a23:	00 00 00 
  803a26:	ff d0                	callq  *%rax
  803a28:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a2f:	00 00 00 
  803a32:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803a35:	89 50 14             	mov    %edx,0x14(%rax)
  803a38:	bf 02 00 00 00       	mov    $0x2,%edi
  803a3d:	48 b8 e5 38 80 00 00 	movabs $0x8038e5,%rax
  803a44:	00 00 00 
  803a47:	ff d0                	callq  *%rax
  803a49:	c9                   	leaveq 
  803a4a:	c3                   	retq   

0000000000803a4b <nsipc_shutdown>:
  803a4b:	55                   	push   %rbp
  803a4c:	48 89 e5             	mov    %rsp,%rbp
  803a4f:	48 83 ec 10          	sub    $0x10,%rsp
  803a53:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803a56:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803a59:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a60:	00 00 00 
  803a63:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803a66:	89 10                	mov    %edx,(%rax)
  803a68:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a6f:	00 00 00 
  803a72:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803a75:	89 50 04             	mov    %edx,0x4(%rax)
  803a78:	bf 03 00 00 00       	mov    $0x3,%edi
  803a7d:	48 b8 e5 38 80 00 00 	movabs $0x8038e5,%rax
  803a84:	00 00 00 
  803a87:	ff d0                	callq  *%rax
  803a89:	c9                   	leaveq 
  803a8a:	c3                   	retq   

0000000000803a8b <nsipc_close>:
  803a8b:	55                   	push   %rbp
  803a8c:	48 89 e5             	mov    %rsp,%rbp
  803a8f:	48 83 ec 10          	sub    $0x10,%rsp
  803a93:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803a96:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a9d:	00 00 00 
  803aa0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803aa3:	89 10                	mov    %edx,(%rax)
  803aa5:	bf 04 00 00 00       	mov    $0x4,%edi
  803aaa:	48 b8 e5 38 80 00 00 	movabs $0x8038e5,%rax
  803ab1:	00 00 00 
  803ab4:	ff d0                	callq  *%rax
  803ab6:	c9                   	leaveq 
  803ab7:	c3                   	retq   

0000000000803ab8 <nsipc_connect>:
  803ab8:	55                   	push   %rbp
  803ab9:	48 89 e5             	mov    %rsp,%rbp
  803abc:	48 83 ec 10          	sub    $0x10,%rsp
  803ac0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ac3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803ac7:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803aca:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ad1:	00 00 00 
  803ad4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ad7:	89 10                	mov    %edx,(%rax)
  803ad9:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803adc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ae0:	48 89 c6             	mov    %rax,%rsi
  803ae3:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803aea:	00 00 00 
  803aed:	48 b8 d3 14 80 00 00 	movabs $0x8014d3,%rax
  803af4:	00 00 00 
  803af7:	ff d0                	callq  *%rax
  803af9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b00:	00 00 00 
  803b03:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b06:	89 50 14             	mov    %edx,0x14(%rax)
  803b09:	bf 05 00 00 00       	mov    $0x5,%edi
  803b0e:	48 b8 e5 38 80 00 00 	movabs $0x8038e5,%rax
  803b15:	00 00 00 
  803b18:	ff d0                	callq  *%rax
  803b1a:	c9                   	leaveq 
  803b1b:	c3                   	retq   

0000000000803b1c <nsipc_listen>:
  803b1c:	55                   	push   %rbp
  803b1d:	48 89 e5             	mov    %rsp,%rbp
  803b20:	48 83 ec 10          	sub    $0x10,%rsp
  803b24:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b27:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803b2a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b31:	00 00 00 
  803b34:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803b37:	89 10                	mov    %edx,(%rax)
  803b39:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b40:	00 00 00 
  803b43:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b46:	89 50 04             	mov    %edx,0x4(%rax)
  803b49:	bf 06 00 00 00       	mov    $0x6,%edi
  803b4e:	48 b8 e5 38 80 00 00 	movabs $0x8038e5,%rax
  803b55:	00 00 00 
  803b58:	ff d0                	callq  *%rax
  803b5a:	c9                   	leaveq 
  803b5b:	c3                   	retq   

0000000000803b5c <nsipc_recv>:
  803b5c:	55                   	push   %rbp
  803b5d:	48 89 e5             	mov    %rsp,%rbp
  803b60:	48 83 ec 30          	sub    $0x30,%rsp
  803b64:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b67:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b6b:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803b6e:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803b71:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b78:	00 00 00 
  803b7b:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803b7e:	89 10                	mov    %edx,(%rax)
  803b80:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b87:	00 00 00 
  803b8a:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803b8d:	89 50 04             	mov    %edx,0x4(%rax)
  803b90:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b97:	00 00 00 
  803b9a:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803b9d:	89 50 08             	mov    %edx,0x8(%rax)
  803ba0:	bf 07 00 00 00       	mov    $0x7,%edi
  803ba5:	48 b8 e5 38 80 00 00 	movabs $0x8038e5,%rax
  803bac:	00 00 00 
  803baf:	ff d0                	callq  *%rax
  803bb1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bb4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bb8:	78 69                	js     803c23 <nsipc_recv+0xc7>
  803bba:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803bc1:	7f 08                	jg     803bcb <nsipc_recv+0x6f>
  803bc3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bc6:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803bc9:	7e 35                	jle    803c00 <nsipc_recv+0xa4>
  803bcb:	48 b9 d1 52 80 00 00 	movabs $0x8052d1,%rcx
  803bd2:	00 00 00 
  803bd5:	48 ba e6 52 80 00 00 	movabs $0x8052e6,%rdx
  803bdc:	00 00 00 
  803bdf:	be 62 00 00 00       	mov    $0x62,%esi
  803be4:	48 bf fb 52 80 00 00 	movabs $0x8052fb,%rdi
  803beb:	00 00 00 
  803bee:	b8 00 00 00 00       	mov    $0x0,%eax
  803bf3:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  803bfa:	00 00 00 
  803bfd:	41 ff d0             	callq  *%r8
  803c00:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c03:	48 63 d0             	movslq %eax,%rdx
  803c06:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c0a:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803c11:	00 00 00 
  803c14:	48 89 c7             	mov    %rax,%rdi
  803c17:	48 b8 d3 14 80 00 00 	movabs $0x8014d3,%rax
  803c1e:	00 00 00 
  803c21:	ff d0                	callq  *%rax
  803c23:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c26:	c9                   	leaveq 
  803c27:	c3                   	retq   

0000000000803c28 <nsipc_send>:
  803c28:	55                   	push   %rbp
  803c29:	48 89 e5             	mov    %rsp,%rbp
  803c2c:	48 83 ec 20          	sub    $0x20,%rsp
  803c30:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c33:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803c37:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803c3a:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803c3d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c44:	00 00 00 
  803c47:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c4a:	89 10                	mov    %edx,(%rax)
  803c4c:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803c53:	7e 35                	jle    803c8a <nsipc_send+0x62>
  803c55:	48 b9 0a 53 80 00 00 	movabs $0x80530a,%rcx
  803c5c:	00 00 00 
  803c5f:	48 ba e6 52 80 00 00 	movabs $0x8052e6,%rdx
  803c66:	00 00 00 
  803c69:	be 6d 00 00 00       	mov    $0x6d,%esi
  803c6e:	48 bf fb 52 80 00 00 	movabs $0x8052fb,%rdi
  803c75:	00 00 00 
  803c78:	b8 00 00 00 00       	mov    $0x0,%eax
  803c7d:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  803c84:	00 00 00 
  803c87:	41 ff d0             	callq  *%r8
  803c8a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803c8d:	48 63 d0             	movslq %eax,%rdx
  803c90:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c94:	48 89 c6             	mov    %rax,%rsi
  803c97:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803c9e:	00 00 00 
  803ca1:	48 b8 d3 14 80 00 00 	movabs $0x8014d3,%rax
  803ca8:	00 00 00 
  803cab:	ff d0                	callq  *%rax
  803cad:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cb4:	00 00 00 
  803cb7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803cba:	89 50 04             	mov    %edx,0x4(%rax)
  803cbd:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cc4:	00 00 00 
  803cc7:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803cca:	89 50 08             	mov    %edx,0x8(%rax)
  803ccd:	bf 08 00 00 00       	mov    $0x8,%edi
  803cd2:	48 b8 e5 38 80 00 00 	movabs $0x8038e5,%rax
  803cd9:	00 00 00 
  803cdc:	ff d0                	callq  *%rax
  803cde:	c9                   	leaveq 
  803cdf:	c3                   	retq   

0000000000803ce0 <nsipc_socket>:
  803ce0:	55                   	push   %rbp
  803ce1:	48 89 e5             	mov    %rsp,%rbp
  803ce4:	48 83 ec 10          	sub    $0x10,%rsp
  803ce8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ceb:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803cee:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803cf1:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cf8:	00 00 00 
  803cfb:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803cfe:	89 10                	mov    %edx,(%rax)
  803d00:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d07:	00 00 00 
  803d0a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d0d:	89 50 04             	mov    %edx,0x4(%rax)
  803d10:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d17:	00 00 00 
  803d1a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803d1d:	89 50 08             	mov    %edx,0x8(%rax)
  803d20:	bf 09 00 00 00       	mov    $0x9,%edi
  803d25:	48 b8 e5 38 80 00 00 	movabs $0x8038e5,%rax
  803d2c:	00 00 00 
  803d2f:	ff d0                	callq  *%rax
  803d31:	c9                   	leaveq 
  803d32:	c3                   	retq   

0000000000803d33 <pipe>:
  803d33:	55                   	push   %rbp
  803d34:	48 89 e5             	mov    %rsp,%rbp
  803d37:	53                   	push   %rbx
  803d38:	48 83 ec 38          	sub    $0x38,%rsp
  803d3c:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803d40:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803d44:	48 89 c7             	mov    %rax,%rdi
  803d47:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  803d4e:	00 00 00 
  803d51:	ff d0                	callq  *%rax
  803d53:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803d56:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803d5a:	0f 88 bf 01 00 00    	js     803f1f <pipe+0x1ec>
  803d60:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d64:	ba 07 04 00 00       	mov    $0x407,%edx
  803d69:	48 89 c6             	mov    %rax,%rsi
  803d6c:	bf 00 00 00 00       	mov    $0x0,%edi
  803d71:	48 b8 de 1a 80 00 00 	movabs $0x801ade,%rax
  803d78:	00 00 00 
  803d7b:	ff d0                	callq  *%rax
  803d7d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803d80:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803d84:	0f 88 95 01 00 00    	js     803f1f <pipe+0x1ec>
  803d8a:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803d8e:	48 89 c7             	mov    %rax,%rdi
  803d91:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  803d98:	00 00 00 
  803d9b:	ff d0                	callq  *%rax
  803d9d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803da0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803da4:	0f 88 5d 01 00 00    	js     803f07 <pipe+0x1d4>
  803daa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803dae:	ba 07 04 00 00       	mov    $0x407,%edx
  803db3:	48 89 c6             	mov    %rax,%rsi
  803db6:	bf 00 00 00 00       	mov    $0x0,%edi
  803dbb:	48 b8 de 1a 80 00 00 	movabs $0x801ade,%rax
  803dc2:	00 00 00 
  803dc5:	ff d0                	callq  *%rax
  803dc7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803dca:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803dce:	0f 88 33 01 00 00    	js     803f07 <pipe+0x1d4>
  803dd4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803dd8:	48 89 c7             	mov    %rax,%rdi
  803ddb:	48 b8 15 25 80 00 00 	movabs $0x802515,%rax
  803de2:	00 00 00 
  803de5:	ff d0                	callq  *%rax
  803de7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803deb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803def:	ba 07 04 00 00       	mov    $0x407,%edx
  803df4:	48 89 c6             	mov    %rax,%rsi
  803df7:	bf 00 00 00 00       	mov    $0x0,%edi
  803dfc:	48 b8 de 1a 80 00 00 	movabs $0x801ade,%rax
  803e03:	00 00 00 
  803e06:	ff d0                	callq  *%rax
  803e08:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e0b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e0f:	0f 88 d9 00 00 00    	js     803eee <pipe+0x1bb>
  803e15:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e19:	48 89 c7             	mov    %rax,%rdi
  803e1c:	48 b8 15 25 80 00 00 	movabs $0x802515,%rax
  803e23:	00 00 00 
  803e26:	ff d0                	callq  *%rax
  803e28:	48 89 c2             	mov    %rax,%rdx
  803e2b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e2f:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803e35:	48 89 d1             	mov    %rdx,%rcx
  803e38:	ba 00 00 00 00       	mov    $0x0,%edx
  803e3d:	48 89 c6             	mov    %rax,%rsi
  803e40:	bf 00 00 00 00       	mov    $0x0,%edi
  803e45:	48 b8 30 1b 80 00 00 	movabs $0x801b30,%rax
  803e4c:	00 00 00 
  803e4f:	ff d0                	callq  *%rax
  803e51:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e54:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e58:	78 79                	js     803ed3 <pipe+0x1a0>
  803e5a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e5e:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803e65:	00 00 00 
  803e68:	8b 12                	mov    (%rdx),%edx
  803e6a:	89 10                	mov    %edx,(%rax)
  803e6c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e70:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803e77:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e7b:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803e82:	00 00 00 
  803e85:	8b 12                	mov    (%rdx),%edx
  803e87:	89 10                	mov    %edx,(%rax)
  803e89:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e8d:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803e94:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e98:	48 89 c7             	mov    %rax,%rdi
  803e9b:	48 b8 f2 24 80 00 00 	movabs $0x8024f2,%rax
  803ea2:	00 00 00 
  803ea5:	ff d0                	callq  *%rax
  803ea7:	89 c2                	mov    %eax,%edx
  803ea9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803ead:	89 10                	mov    %edx,(%rax)
  803eaf:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803eb3:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803eb7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ebb:	48 89 c7             	mov    %rax,%rdi
  803ebe:	48 b8 f2 24 80 00 00 	movabs $0x8024f2,%rax
  803ec5:	00 00 00 
  803ec8:	ff d0                	callq  *%rax
  803eca:	89 03                	mov    %eax,(%rbx)
  803ecc:	b8 00 00 00 00       	mov    $0x0,%eax
  803ed1:	eb 4f                	jmp    803f22 <pipe+0x1ef>
  803ed3:	90                   	nop
  803ed4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ed8:	48 89 c6             	mov    %rax,%rsi
  803edb:	bf 00 00 00 00       	mov    $0x0,%edi
  803ee0:	48 b8 90 1b 80 00 00 	movabs $0x801b90,%rax
  803ee7:	00 00 00 
  803eea:	ff d0                	callq  *%rax
  803eec:	eb 01                	jmp    803eef <pipe+0x1bc>
  803eee:	90                   	nop
  803eef:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ef3:	48 89 c6             	mov    %rax,%rsi
  803ef6:	bf 00 00 00 00       	mov    $0x0,%edi
  803efb:	48 b8 90 1b 80 00 00 	movabs $0x801b90,%rax
  803f02:	00 00 00 
  803f05:	ff d0                	callq  *%rax
  803f07:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f0b:	48 89 c6             	mov    %rax,%rsi
  803f0e:	bf 00 00 00 00       	mov    $0x0,%edi
  803f13:	48 b8 90 1b 80 00 00 	movabs $0x801b90,%rax
  803f1a:	00 00 00 
  803f1d:	ff d0                	callq  *%rax
  803f1f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f22:	48 83 c4 38          	add    $0x38,%rsp
  803f26:	5b                   	pop    %rbx
  803f27:	5d                   	pop    %rbp
  803f28:	c3                   	retq   

0000000000803f29 <_pipeisclosed>:
  803f29:	55                   	push   %rbp
  803f2a:	48 89 e5             	mov    %rsp,%rbp
  803f2d:	53                   	push   %rbx
  803f2e:	48 83 ec 28          	sub    $0x28,%rsp
  803f32:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803f36:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803f3a:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  803f41:	00 00 00 
  803f44:	48 8b 00             	mov    (%rax),%rax
  803f47:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803f4d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f50:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f54:	48 89 c7             	mov    %rax,%rdi
  803f57:	48 b8 9b 49 80 00 00 	movabs $0x80499b,%rax
  803f5e:	00 00 00 
  803f61:	ff d0                	callq  *%rax
  803f63:	89 c3                	mov    %eax,%ebx
  803f65:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f69:	48 89 c7             	mov    %rax,%rdi
  803f6c:	48 b8 9b 49 80 00 00 	movabs $0x80499b,%rax
  803f73:	00 00 00 
  803f76:	ff d0                	callq  *%rax
  803f78:	39 c3                	cmp    %eax,%ebx
  803f7a:	0f 94 c0             	sete   %al
  803f7d:	0f b6 c0             	movzbl %al,%eax
  803f80:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803f83:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  803f8a:	00 00 00 
  803f8d:	48 8b 00             	mov    (%rax),%rax
  803f90:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803f96:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803f99:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f9c:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803f9f:	75 05                	jne    803fa6 <_pipeisclosed+0x7d>
  803fa1:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803fa4:	eb 4a                	jmp    803ff0 <_pipeisclosed+0xc7>
  803fa6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803fa9:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803fac:	74 8c                	je     803f3a <_pipeisclosed+0x11>
  803fae:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803fb2:	75 86                	jne    803f3a <_pipeisclosed+0x11>
  803fb4:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  803fbb:	00 00 00 
  803fbe:	48 8b 00             	mov    (%rax),%rax
  803fc1:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803fc7:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803fca:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803fcd:	89 c6                	mov    %eax,%esi
  803fcf:	48 bf 1b 53 80 00 00 	movabs $0x80531b,%rdi
  803fd6:	00 00 00 
  803fd9:	b8 00 00 00 00       	mov    $0x0,%eax
  803fde:	49 b8 1e 06 80 00 00 	movabs $0x80061e,%r8
  803fe5:	00 00 00 
  803fe8:	41 ff d0             	callq  *%r8
  803feb:	e9 4a ff ff ff       	jmpq   803f3a <_pipeisclosed+0x11>
  803ff0:	48 83 c4 28          	add    $0x28,%rsp
  803ff4:	5b                   	pop    %rbx
  803ff5:	5d                   	pop    %rbp
  803ff6:	c3                   	retq   

0000000000803ff7 <pipeisclosed>:
  803ff7:	55                   	push   %rbp
  803ff8:	48 89 e5             	mov    %rsp,%rbp
  803ffb:	48 83 ec 30          	sub    $0x30,%rsp
  803fff:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804002:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  804006:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804009:	48 89 d6             	mov    %rdx,%rsi
  80400c:	89 c7                	mov    %eax,%edi
  80400e:	48 b8 d8 25 80 00 00 	movabs $0x8025d8,%rax
  804015:	00 00 00 
  804018:	ff d0                	callq  *%rax
  80401a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80401d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804021:	79 05                	jns    804028 <pipeisclosed+0x31>
  804023:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804026:	eb 31                	jmp    804059 <pipeisclosed+0x62>
  804028:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80402c:	48 89 c7             	mov    %rax,%rdi
  80402f:	48 b8 15 25 80 00 00 	movabs $0x802515,%rax
  804036:	00 00 00 
  804039:	ff d0                	callq  *%rax
  80403b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80403f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804043:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804047:	48 89 d6             	mov    %rdx,%rsi
  80404a:	48 89 c7             	mov    %rax,%rdi
  80404d:	48 b8 29 3f 80 00 00 	movabs $0x803f29,%rax
  804054:	00 00 00 
  804057:	ff d0                	callq  *%rax
  804059:	c9                   	leaveq 
  80405a:	c3                   	retq   

000000000080405b <devpipe_read>:
  80405b:	55                   	push   %rbp
  80405c:	48 89 e5             	mov    %rsp,%rbp
  80405f:	48 83 ec 40          	sub    $0x40,%rsp
  804063:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804067:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80406b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80406f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804073:	48 89 c7             	mov    %rax,%rdi
  804076:	48 b8 15 25 80 00 00 	movabs $0x802515,%rax
  80407d:	00 00 00 
  804080:	ff d0                	callq  *%rax
  804082:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804086:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80408a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80408e:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804095:	00 
  804096:	e9 90 00 00 00       	jmpq   80412b <devpipe_read+0xd0>
  80409b:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8040a0:	74 09                	je     8040ab <devpipe_read+0x50>
  8040a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040a6:	e9 8e 00 00 00       	jmpq   804139 <devpipe_read+0xde>
  8040ab:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8040af:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8040b3:	48 89 d6             	mov    %rdx,%rsi
  8040b6:	48 89 c7             	mov    %rax,%rdi
  8040b9:	48 b8 29 3f 80 00 00 	movabs $0x803f29,%rax
  8040c0:	00 00 00 
  8040c3:	ff d0                	callq  *%rax
  8040c5:	85 c0                	test   %eax,%eax
  8040c7:	74 07                	je     8040d0 <devpipe_read+0x75>
  8040c9:	b8 00 00 00 00       	mov    $0x0,%eax
  8040ce:	eb 69                	jmp    804139 <devpipe_read+0xde>
  8040d0:	48 b8 a1 1a 80 00 00 	movabs $0x801aa1,%rax
  8040d7:	00 00 00 
  8040da:	ff d0                	callq  *%rax
  8040dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040e0:	8b 10                	mov    (%rax),%edx
  8040e2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040e6:	8b 40 04             	mov    0x4(%rax),%eax
  8040e9:	39 c2                	cmp    %eax,%edx
  8040eb:	74 ae                	je     80409b <devpipe_read+0x40>
  8040ed:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8040f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040f5:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8040f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040fd:	8b 00                	mov    (%rax),%eax
  8040ff:	99                   	cltd   
  804100:	c1 ea 1b             	shr    $0x1b,%edx
  804103:	01 d0                	add    %edx,%eax
  804105:	83 e0 1f             	and    $0x1f,%eax
  804108:	29 d0                	sub    %edx,%eax
  80410a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80410e:	48 98                	cltq   
  804110:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804115:	88 01                	mov    %al,(%rcx)
  804117:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80411b:	8b 00                	mov    (%rax),%eax
  80411d:	8d 50 01             	lea    0x1(%rax),%edx
  804120:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804124:	89 10                	mov    %edx,(%rax)
  804126:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80412b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80412f:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804133:	72 a7                	jb     8040dc <devpipe_read+0x81>
  804135:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804139:	c9                   	leaveq 
  80413a:	c3                   	retq   

000000000080413b <devpipe_write>:
  80413b:	55                   	push   %rbp
  80413c:	48 89 e5             	mov    %rsp,%rbp
  80413f:	48 83 ec 40          	sub    $0x40,%rsp
  804143:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804147:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80414b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80414f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804153:	48 89 c7             	mov    %rax,%rdi
  804156:	48 b8 15 25 80 00 00 	movabs $0x802515,%rax
  80415d:	00 00 00 
  804160:	ff d0                	callq  *%rax
  804162:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804166:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80416a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80416e:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804175:	00 
  804176:	e9 8f 00 00 00       	jmpq   80420a <devpipe_write+0xcf>
  80417b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80417f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804183:	48 89 d6             	mov    %rdx,%rsi
  804186:	48 89 c7             	mov    %rax,%rdi
  804189:	48 b8 29 3f 80 00 00 	movabs $0x803f29,%rax
  804190:	00 00 00 
  804193:	ff d0                	callq  *%rax
  804195:	85 c0                	test   %eax,%eax
  804197:	74 07                	je     8041a0 <devpipe_write+0x65>
  804199:	b8 00 00 00 00       	mov    $0x0,%eax
  80419e:	eb 78                	jmp    804218 <devpipe_write+0xdd>
  8041a0:	48 b8 a1 1a 80 00 00 	movabs $0x801aa1,%rax
  8041a7:	00 00 00 
  8041aa:	ff d0                	callq  *%rax
  8041ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041b0:	8b 40 04             	mov    0x4(%rax),%eax
  8041b3:	48 63 d0             	movslq %eax,%rdx
  8041b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041ba:	8b 00                	mov    (%rax),%eax
  8041bc:	48 98                	cltq   
  8041be:	48 83 c0 20          	add    $0x20,%rax
  8041c2:	48 39 c2             	cmp    %rax,%rdx
  8041c5:	73 b4                	jae    80417b <devpipe_write+0x40>
  8041c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041cb:	8b 40 04             	mov    0x4(%rax),%eax
  8041ce:	99                   	cltd   
  8041cf:	c1 ea 1b             	shr    $0x1b,%edx
  8041d2:	01 d0                	add    %edx,%eax
  8041d4:	83 e0 1f             	and    $0x1f,%eax
  8041d7:	29 d0                	sub    %edx,%eax
  8041d9:	89 c6                	mov    %eax,%esi
  8041db:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8041df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041e3:	48 01 d0             	add    %rdx,%rax
  8041e6:	0f b6 08             	movzbl (%rax),%ecx
  8041e9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8041ed:	48 63 c6             	movslq %esi,%rax
  8041f0:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8041f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041f8:	8b 40 04             	mov    0x4(%rax),%eax
  8041fb:	8d 50 01             	lea    0x1(%rax),%edx
  8041fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804202:	89 50 04             	mov    %edx,0x4(%rax)
  804205:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80420a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80420e:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804212:	72 98                	jb     8041ac <devpipe_write+0x71>
  804214:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804218:	c9                   	leaveq 
  804219:	c3                   	retq   

000000000080421a <devpipe_stat>:
  80421a:	55                   	push   %rbp
  80421b:	48 89 e5             	mov    %rsp,%rbp
  80421e:	48 83 ec 20          	sub    $0x20,%rsp
  804222:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804226:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80422a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80422e:	48 89 c7             	mov    %rax,%rdi
  804231:	48 b8 15 25 80 00 00 	movabs $0x802515,%rax
  804238:	00 00 00 
  80423b:	ff d0                	callq  *%rax
  80423d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804241:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804245:	48 be 2e 53 80 00 00 	movabs $0x80532e,%rsi
  80424c:	00 00 00 
  80424f:	48 89 c7             	mov    %rax,%rdi
  804252:	48 b8 ae 11 80 00 00 	movabs $0x8011ae,%rax
  804259:	00 00 00 
  80425c:	ff d0                	callq  *%rax
  80425e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804262:	8b 50 04             	mov    0x4(%rax),%edx
  804265:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804269:	8b 00                	mov    (%rax),%eax
  80426b:	29 c2                	sub    %eax,%edx
  80426d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804271:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804277:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80427b:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804282:	00 00 00 
  804285:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804289:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  804290:	00 00 00 
  804293:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  80429a:	b8 00 00 00 00       	mov    $0x0,%eax
  80429f:	c9                   	leaveq 
  8042a0:	c3                   	retq   

00000000008042a1 <devpipe_close>:
  8042a1:	55                   	push   %rbp
  8042a2:	48 89 e5             	mov    %rsp,%rbp
  8042a5:	48 83 ec 10          	sub    $0x10,%rsp
  8042a9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8042ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042b1:	48 89 c6             	mov    %rax,%rsi
  8042b4:	bf 00 00 00 00       	mov    $0x0,%edi
  8042b9:	48 b8 90 1b 80 00 00 	movabs $0x801b90,%rax
  8042c0:	00 00 00 
  8042c3:	ff d0                	callq  *%rax
  8042c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042c9:	48 89 c7             	mov    %rax,%rdi
  8042cc:	48 b8 15 25 80 00 00 	movabs $0x802515,%rax
  8042d3:	00 00 00 
  8042d6:	ff d0                	callq  *%rax
  8042d8:	48 89 c6             	mov    %rax,%rsi
  8042db:	bf 00 00 00 00       	mov    $0x0,%edi
  8042e0:	48 b8 90 1b 80 00 00 	movabs $0x801b90,%rax
  8042e7:	00 00 00 
  8042ea:	ff d0                	callq  *%rax
  8042ec:	c9                   	leaveq 
  8042ed:	c3                   	retq   

00000000008042ee <wait>:
  8042ee:	55                   	push   %rbp
  8042ef:	48 89 e5             	mov    %rsp,%rbp
  8042f2:	48 83 ec 20          	sub    $0x20,%rsp
  8042f6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8042f9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8042fd:	75 35                	jne    804334 <wait+0x46>
  8042ff:	48 b9 35 53 80 00 00 	movabs $0x805335,%rcx
  804306:	00 00 00 
  804309:	48 ba 40 53 80 00 00 	movabs $0x805340,%rdx
  804310:	00 00 00 
  804313:	be 0a 00 00 00       	mov    $0xa,%esi
  804318:	48 bf 55 53 80 00 00 	movabs $0x805355,%rdi
  80431f:	00 00 00 
  804322:	b8 00 00 00 00       	mov    $0x0,%eax
  804327:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  80432e:	00 00 00 
  804331:	41 ff d0             	callq  *%r8
  804334:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804337:	25 ff 03 00 00       	and    $0x3ff,%eax
  80433c:	48 98                	cltq   
  80433e:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  804345:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80434c:	00 00 00 
  80434f:	48 01 d0             	add    %rdx,%rax
  804352:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804356:	eb 0c                	jmp    804364 <wait+0x76>
  804358:	48 b8 a1 1a 80 00 00 	movabs $0x801aa1,%rax
  80435f:	00 00 00 
  804362:	ff d0                	callq  *%rax
  804364:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804368:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80436e:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804371:	75 0e                	jne    804381 <wait+0x93>
  804373:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804377:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  80437d:	85 c0                	test   %eax,%eax
  80437f:	75 d7                	jne    804358 <wait+0x6a>
  804381:	90                   	nop
  804382:	c9                   	leaveq 
  804383:	c3                   	retq   

0000000000804384 <cputchar>:
  804384:	55                   	push   %rbp
  804385:	48 89 e5             	mov    %rsp,%rbp
  804388:	48 83 ec 20          	sub    $0x20,%rsp
  80438c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80438f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804392:	88 45 ff             	mov    %al,-0x1(%rbp)
  804395:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804399:	be 01 00 00 00       	mov    $0x1,%esi
  80439e:	48 89 c7             	mov    %rax,%rdi
  8043a1:	48 b8 96 19 80 00 00 	movabs $0x801996,%rax
  8043a8:	00 00 00 
  8043ab:	ff d0                	callq  *%rax
  8043ad:	90                   	nop
  8043ae:	c9                   	leaveq 
  8043af:	c3                   	retq   

00000000008043b0 <getchar>:
  8043b0:	55                   	push   %rbp
  8043b1:	48 89 e5             	mov    %rsp,%rbp
  8043b4:	48 83 ec 10          	sub    $0x10,%rsp
  8043b8:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8043bc:	ba 01 00 00 00       	mov    $0x1,%edx
  8043c1:	48 89 c6             	mov    %rax,%rsi
  8043c4:	bf 00 00 00 00       	mov    $0x0,%edi
  8043c9:	48 b8 0d 2a 80 00 00 	movabs $0x802a0d,%rax
  8043d0:	00 00 00 
  8043d3:	ff d0                	callq  *%rax
  8043d5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8043d8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8043dc:	79 05                	jns    8043e3 <getchar+0x33>
  8043de:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043e1:	eb 14                	jmp    8043f7 <getchar+0x47>
  8043e3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8043e7:	7f 07                	jg     8043f0 <getchar+0x40>
  8043e9:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  8043ee:	eb 07                	jmp    8043f7 <getchar+0x47>
  8043f0:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  8043f4:	0f b6 c0             	movzbl %al,%eax
  8043f7:	c9                   	leaveq 
  8043f8:	c3                   	retq   

00000000008043f9 <iscons>:
  8043f9:	55                   	push   %rbp
  8043fa:	48 89 e5             	mov    %rsp,%rbp
  8043fd:	48 83 ec 20          	sub    $0x20,%rsp
  804401:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804404:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804408:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80440b:	48 89 d6             	mov    %rdx,%rsi
  80440e:	89 c7                	mov    %eax,%edi
  804410:	48 b8 d8 25 80 00 00 	movabs $0x8025d8,%rax
  804417:	00 00 00 
  80441a:	ff d0                	callq  *%rax
  80441c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80441f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804423:	79 05                	jns    80442a <iscons+0x31>
  804425:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804428:	eb 1a                	jmp    804444 <iscons+0x4b>
  80442a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80442e:	8b 10                	mov    (%rax),%edx
  804430:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  804437:	00 00 00 
  80443a:	8b 00                	mov    (%rax),%eax
  80443c:	39 c2                	cmp    %eax,%edx
  80443e:	0f 94 c0             	sete   %al
  804441:	0f b6 c0             	movzbl %al,%eax
  804444:	c9                   	leaveq 
  804445:	c3                   	retq   

0000000000804446 <opencons>:
  804446:	55                   	push   %rbp
  804447:	48 89 e5             	mov    %rsp,%rbp
  80444a:	48 83 ec 10          	sub    $0x10,%rsp
  80444e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804452:	48 89 c7             	mov    %rax,%rdi
  804455:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  80445c:	00 00 00 
  80445f:	ff d0                	callq  *%rax
  804461:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804464:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804468:	79 05                	jns    80446f <opencons+0x29>
  80446a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80446d:	eb 5b                	jmp    8044ca <opencons+0x84>
  80446f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804473:	ba 07 04 00 00       	mov    $0x407,%edx
  804478:	48 89 c6             	mov    %rax,%rsi
  80447b:	bf 00 00 00 00       	mov    $0x0,%edi
  804480:	48 b8 de 1a 80 00 00 	movabs $0x801ade,%rax
  804487:	00 00 00 
  80448a:	ff d0                	callq  *%rax
  80448c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80448f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804493:	79 05                	jns    80449a <opencons+0x54>
  804495:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804498:	eb 30                	jmp    8044ca <opencons+0x84>
  80449a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80449e:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  8044a5:	00 00 00 
  8044a8:	8b 12                	mov    (%rdx),%edx
  8044aa:	89 10                	mov    %edx,(%rax)
  8044ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044b0:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8044b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044bb:	48 89 c7             	mov    %rax,%rdi
  8044be:	48 b8 f2 24 80 00 00 	movabs $0x8024f2,%rax
  8044c5:	00 00 00 
  8044c8:	ff d0                	callq  *%rax
  8044ca:	c9                   	leaveq 
  8044cb:	c3                   	retq   

00000000008044cc <devcons_read>:
  8044cc:	55                   	push   %rbp
  8044cd:	48 89 e5             	mov    %rsp,%rbp
  8044d0:	48 83 ec 30          	sub    $0x30,%rsp
  8044d4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8044d8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8044dc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8044e0:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8044e5:	75 13                	jne    8044fa <devcons_read+0x2e>
  8044e7:	b8 00 00 00 00       	mov    $0x0,%eax
  8044ec:	eb 49                	jmp    804537 <devcons_read+0x6b>
  8044ee:	48 b8 a1 1a 80 00 00 	movabs $0x801aa1,%rax
  8044f5:	00 00 00 
  8044f8:	ff d0                	callq  *%rax
  8044fa:	48 b8 e3 19 80 00 00 	movabs $0x8019e3,%rax
  804501:	00 00 00 
  804504:	ff d0                	callq  *%rax
  804506:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804509:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80450d:	74 df                	je     8044ee <devcons_read+0x22>
  80450f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804513:	79 05                	jns    80451a <devcons_read+0x4e>
  804515:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804518:	eb 1d                	jmp    804537 <devcons_read+0x6b>
  80451a:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  80451e:	75 07                	jne    804527 <devcons_read+0x5b>
  804520:	b8 00 00 00 00       	mov    $0x0,%eax
  804525:	eb 10                	jmp    804537 <devcons_read+0x6b>
  804527:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80452a:	89 c2                	mov    %eax,%edx
  80452c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804530:	88 10                	mov    %dl,(%rax)
  804532:	b8 01 00 00 00       	mov    $0x1,%eax
  804537:	c9                   	leaveq 
  804538:	c3                   	retq   

0000000000804539 <devcons_write>:
  804539:	55                   	push   %rbp
  80453a:	48 89 e5             	mov    %rsp,%rbp
  80453d:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  804544:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  80454b:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804552:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804559:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804560:	eb 76                	jmp    8045d8 <devcons_write+0x9f>
  804562:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804569:	89 c2                	mov    %eax,%edx
  80456b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80456e:	29 c2                	sub    %eax,%edx
  804570:	89 d0                	mov    %edx,%eax
  804572:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804575:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804578:	83 f8 7f             	cmp    $0x7f,%eax
  80457b:	76 07                	jbe    804584 <devcons_write+0x4b>
  80457d:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804584:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804587:	48 63 d0             	movslq %eax,%rdx
  80458a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80458d:	48 63 c8             	movslq %eax,%rcx
  804590:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804597:	48 01 c1             	add    %rax,%rcx
  80459a:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8045a1:	48 89 ce             	mov    %rcx,%rsi
  8045a4:	48 89 c7             	mov    %rax,%rdi
  8045a7:	48 b8 d3 14 80 00 00 	movabs $0x8014d3,%rax
  8045ae:	00 00 00 
  8045b1:	ff d0                	callq  *%rax
  8045b3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8045b6:	48 63 d0             	movslq %eax,%rdx
  8045b9:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8045c0:	48 89 d6             	mov    %rdx,%rsi
  8045c3:	48 89 c7             	mov    %rax,%rdi
  8045c6:	48 b8 96 19 80 00 00 	movabs $0x801996,%rax
  8045cd:	00 00 00 
  8045d0:	ff d0                	callq  *%rax
  8045d2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8045d5:	01 45 fc             	add    %eax,-0x4(%rbp)
  8045d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045db:	48 98                	cltq   
  8045dd:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8045e4:	0f 82 78 ff ff ff    	jb     804562 <devcons_write+0x29>
  8045ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045ed:	c9                   	leaveq 
  8045ee:	c3                   	retq   

00000000008045ef <devcons_close>:
  8045ef:	55                   	push   %rbp
  8045f0:	48 89 e5             	mov    %rsp,%rbp
  8045f3:	48 83 ec 08          	sub    $0x8,%rsp
  8045f7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8045fb:	b8 00 00 00 00       	mov    $0x0,%eax
  804600:	c9                   	leaveq 
  804601:	c3                   	retq   

0000000000804602 <devcons_stat>:
  804602:	55                   	push   %rbp
  804603:	48 89 e5             	mov    %rsp,%rbp
  804606:	48 83 ec 10          	sub    $0x10,%rsp
  80460a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80460e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804612:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804616:	48 be 68 53 80 00 00 	movabs $0x805368,%rsi
  80461d:	00 00 00 
  804620:	48 89 c7             	mov    %rax,%rdi
  804623:	48 b8 ae 11 80 00 00 	movabs $0x8011ae,%rax
  80462a:	00 00 00 
  80462d:	ff d0                	callq  *%rax
  80462f:	b8 00 00 00 00       	mov    $0x0,%eax
  804634:	c9                   	leaveq 
  804635:	c3                   	retq   

0000000000804636 <set_pgfault_handler>:
  804636:	55                   	push   %rbp
  804637:	48 89 e5             	mov    %rsp,%rbp
  80463a:	48 83 ec 20          	sub    $0x20,%rsp
  80463e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804642:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804649:	00 00 00 
  80464c:	48 8b 00             	mov    (%rax),%rax
  80464f:	48 85 c0             	test   %rax,%rax
  804652:	75 6f                	jne    8046c3 <set_pgfault_handler+0x8d>
  804654:	ba 07 00 00 00       	mov    $0x7,%edx
  804659:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  80465e:	bf 00 00 00 00       	mov    $0x0,%edi
  804663:	48 b8 de 1a 80 00 00 	movabs $0x801ade,%rax
  80466a:	00 00 00 
  80466d:	ff d0                	callq  *%rax
  80466f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804672:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804676:	79 30                	jns    8046a8 <set_pgfault_handler+0x72>
  804678:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80467b:	89 c1                	mov    %eax,%ecx
  80467d:	48 ba 70 53 80 00 00 	movabs $0x805370,%rdx
  804684:	00 00 00 
  804687:	be 22 00 00 00       	mov    $0x22,%esi
  80468c:	48 bf 8f 53 80 00 00 	movabs $0x80538f,%rdi
  804693:	00 00 00 
  804696:	b8 00 00 00 00       	mov    $0x0,%eax
  80469b:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  8046a2:	00 00 00 
  8046a5:	41 ff d0             	callq  *%r8
  8046a8:	48 be d7 46 80 00 00 	movabs $0x8046d7,%rsi
  8046af:	00 00 00 
  8046b2:	bf 00 00 00 00       	mov    $0x0,%edi
  8046b7:	48 b8 75 1c 80 00 00 	movabs $0x801c75,%rax
  8046be:	00 00 00 
  8046c1:	ff d0                	callq  *%rax
  8046c3:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8046ca:	00 00 00 
  8046cd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8046d1:	48 89 10             	mov    %rdx,(%rax)
  8046d4:	90                   	nop
  8046d5:	c9                   	leaveq 
  8046d6:	c3                   	retq   

00000000008046d7 <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  8046d7:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  8046da:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  8046e1:	00 00 00 
call *%rax
  8046e4:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  8046e6:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  8046ed:	00 08 
    movq 152(%rsp), %rax
  8046ef:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  8046f6:	00 
    movq 136(%rsp), %rbx
  8046f7:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  8046fe:	00 
movq %rbx, (%rax)
  8046ff:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804702:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  804706:	4c 8b 3c 24          	mov    (%rsp),%r15
  80470a:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  80470f:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  804714:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  804719:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  80471e:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  804723:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  804728:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  80472d:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  804732:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  804737:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  80473c:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  804741:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  804746:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  80474b:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  804750:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  804754:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  804758:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  804759:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  80475e:	c3                   	retq   

000000000080475f <ipc_recv>:
  80475f:	55                   	push   %rbp
  804760:	48 89 e5             	mov    %rsp,%rbp
  804763:	48 83 ec 30          	sub    $0x30,%rsp
  804767:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80476b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80476f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804773:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804778:	75 0e                	jne    804788 <ipc_recv+0x29>
  80477a:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804781:	00 00 00 
  804784:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804788:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80478c:	48 89 c7             	mov    %rax,%rdi
  80478f:	48 b8 18 1d 80 00 00 	movabs $0x801d18,%rax
  804796:	00 00 00 
  804799:	ff d0                	callq  *%rax
  80479b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80479e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8047a2:	79 27                	jns    8047cb <ipc_recv+0x6c>
  8047a4:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8047a9:	74 0a                	je     8047b5 <ipc_recv+0x56>
  8047ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8047af:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8047b5:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8047ba:	74 0a                	je     8047c6 <ipc_recv+0x67>
  8047bc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8047c0:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8047c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047c9:	eb 53                	jmp    80481e <ipc_recv+0xbf>
  8047cb:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8047d0:	74 19                	je     8047eb <ipc_recv+0x8c>
  8047d2:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  8047d9:	00 00 00 
  8047dc:	48 8b 00             	mov    (%rax),%rax
  8047df:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8047e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8047e9:	89 10                	mov    %edx,(%rax)
  8047eb:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8047f0:	74 19                	je     80480b <ipc_recv+0xac>
  8047f2:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  8047f9:	00 00 00 
  8047fc:	48 8b 00             	mov    (%rax),%rax
  8047ff:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804805:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804809:	89 10                	mov    %edx,(%rax)
  80480b:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  804812:	00 00 00 
  804815:	48 8b 00             	mov    (%rax),%rax
  804818:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  80481e:	c9                   	leaveq 
  80481f:	c3                   	retq   

0000000000804820 <ipc_send>:
  804820:	55                   	push   %rbp
  804821:	48 89 e5             	mov    %rsp,%rbp
  804824:	48 83 ec 30          	sub    $0x30,%rsp
  804828:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80482b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80482e:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804832:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804835:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80483a:	75 1c                	jne    804858 <ipc_send+0x38>
  80483c:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804843:	00 00 00 
  804846:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80484a:	eb 0c                	jmp    804858 <ipc_send+0x38>
  80484c:	48 b8 a1 1a 80 00 00 	movabs $0x801aa1,%rax
  804853:	00 00 00 
  804856:	ff d0                	callq  *%rax
  804858:	8b 75 e8             	mov    -0x18(%rbp),%esi
  80485b:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  80485e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804862:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804865:	89 c7                	mov    %eax,%edi
  804867:	48 b8 c1 1c 80 00 00 	movabs $0x801cc1,%rax
  80486e:	00 00 00 
  804871:	ff d0                	callq  *%rax
  804873:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804876:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  80487a:	74 d0                	je     80484c <ipc_send+0x2c>
  80487c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804880:	79 30                	jns    8048b2 <ipc_send+0x92>
  804882:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804885:	89 c1                	mov    %eax,%ecx
  804887:	48 ba a0 53 80 00 00 	movabs $0x8053a0,%rdx
  80488e:	00 00 00 
  804891:	be 44 00 00 00       	mov    $0x44,%esi
  804896:	48 bf b6 53 80 00 00 	movabs $0x8053b6,%rdi
  80489d:	00 00 00 
  8048a0:	b8 00 00 00 00       	mov    $0x0,%eax
  8048a5:	49 b8 e4 03 80 00 00 	movabs $0x8003e4,%r8
  8048ac:	00 00 00 
  8048af:	41 ff d0             	callq  *%r8
  8048b2:	90                   	nop
  8048b3:	c9                   	leaveq 
  8048b4:	c3                   	retq   

00000000008048b5 <ipc_host_recv>:
  8048b5:	55                   	push   %rbp
  8048b6:	48 89 e5             	mov    %rsp,%rbp
  8048b9:	48 83 ec 10          	sub    $0x10,%rsp
  8048bd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8048c1:	48 ba c8 53 80 00 00 	movabs $0x8053c8,%rdx
  8048c8:	00 00 00 
  8048cb:	be 4e 00 00 00       	mov    $0x4e,%esi
  8048d0:	48 bf b6 53 80 00 00 	movabs $0x8053b6,%rdi
  8048d7:	00 00 00 
  8048da:	b8 00 00 00 00       	mov    $0x0,%eax
  8048df:	48 b9 e4 03 80 00 00 	movabs $0x8003e4,%rcx
  8048e6:	00 00 00 
  8048e9:	ff d1                	callq  *%rcx

00000000008048eb <ipc_host_send>:
  8048eb:	55                   	push   %rbp
  8048ec:	48 89 e5             	mov    %rsp,%rbp
  8048ef:	48 83 ec 20          	sub    $0x20,%rsp
  8048f3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8048f6:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8048f9:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  8048fd:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804900:	48 ba e8 53 80 00 00 	movabs $0x8053e8,%rdx
  804907:	00 00 00 
  80490a:	be 58 00 00 00       	mov    $0x58,%esi
  80490f:	48 bf b6 53 80 00 00 	movabs $0x8053b6,%rdi
  804916:	00 00 00 
  804919:	b8 00 00 00 00       	mov    $0x0,%eax
  80491e:	48 b9 e4 03 80 00 00 	movabs $0x8003e4,%rcx
  804925:	00 00 00 
  804928:	ff d1                	callq  *%rcx

000000000080492a <ipc_find_env>:
  80492a:	55                   	push   %rbp
  80492b:	48 89 e5             	mov    %rsp,%rbp
  80492e:	48 83 ec 18          	sub    $0x18,%rsp
  804932:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804935:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80493c:	eb 4d                	jmp    80498b <ipc_find_env+0x61>
  80493e:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804945:	00 00 00 
  804948:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80494b:	48 98                	cltq   
  80494d:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804954:	48 01 d0             	add    %rdx,%rax
  804957:	48 05 d0 00 00 00    	add    $0xd0,%rax
  80495d:	8b 00                	mov    (%rax),%eax
  80495f:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804962:	75 23                	jne    804987 <ipc_find_env+0x5d>
  804964:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80496b:	00 00 00 
  80496e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804971:	48 98                	cltq   
  804973:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80497a:	48 01 d0             	add    %rdx,%rax
  80497d:	48 05 c8 00 00 00    	add    $0xc8,%rax
  804983:	8b 00                	mov    (%rax),%eax
  804985:	eb 12                	jmp    804999 <ipc_find_env+0x6f>
  804987:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80498b:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804992:	7e aa                	jle    80493e <ipc_find_env+0x14>
  804994:	b8 00 00 00 00       	mov    $0x0,%eax
  804999:	c9                   	leaveq 
  80499a:	c3                   	retq   

000000000080499b <pageref>:
  80499b:	55                   	push   %rbp
  80499c:	48 89 e5             	mov    %rsp,%rbp
  80499f:	48 83 ec 18          	sub    $0x18,%rsp
  8049a3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8049a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8049ab:	48 c1 e8 15          	shr    $0x15,%rax
  8049af:	48 89 c2             	mov    %rax,%rdx
  8049b2:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8049b9:	01 00 00 
  8049bc:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8049c0:	83 e0 01             	and    $0x1,%eax
  8049c3:	48 85 c0             	test   %rax,%rax
  8049c6:	75 07                	jne    8049cf <pageref+0x34>
  8049c8:	b8 00 00 00 00       	mov    $0x0,%eax
  8049cd:	eb 56                	jmp    804a25 <pageref+0x8a>
  8049cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8049d3:	48 c1 e8 0c          	shr    $0xc,%rax
  8049d7:	48 89 c2             	mov    %rax,%rdx
  8049da:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8049e1:	01 00 00 
  8049e4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8049e8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8049ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8049f0:	83 e0 01             	and    $0x1,%eax
  8049f3:	48 85 c0             	test   %rax,%rax
  8049f6:	75 07                	jne    8049ff <pageref+0x64>
  8049f8:	b8 00 00 00 00       	mov    $0x0,%eax
  8049fd:	eb 26                	jmp    804a25 <pageref+0x8a>
  8049ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a03:	48 c1 e8 0c          	shr    $0xc,%rax
  804a07:	48 89 c2             	mov    %rax,%rdx
  804a0a:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804a11:	00 00 00 
  804a14:	48 c1 e2 04          	shl    $0x4,%rdx
  804a18:	48 01 d0             	add    %rdx,%rax
  804a1b:	48 83 c0 08          	add    $0x8,%rax
  804a1f:	0f b7 00             	movzwl (%rax),%eax
  804a22:	0f b7 c0             	movzwl %ax,%eax
  804a25:	c9                   	leaveq 
  804a26:	c3                   	retq   
