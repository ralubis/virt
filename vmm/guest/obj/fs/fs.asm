
vmm/guest/obj/fs/fs:     file format elf64-x86-64


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
  80003c:	e8 f7 33 00 00       	callq  803438 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <ide_wait_ready>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 18          	sub    $0x18,%rsp
  80004b:	89 f8                	mov    %edi,%eax
  80004d:	88 45 ec             	mov    %al,-0x14(%rbp)
  800050:	90                   	nop
  800051:	c7 45 f8 f7 01 00 00 	movl   $0x1f7,-0x8(%rbp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  800058:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80005b:	89 c2                	mov    %eax,%edx
  80005d:	ec                   	in     (%dx),%al
  80005e:	88 45 f7             	mov    %al,-0x9(%rbp)
	return data;
  800061:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
  800065:	0f b6 c0             	movzbl %al,%eax
  800068:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80006b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80006e:	25 c0 00 00 00       	and    $0xc0,%eax
  800073:	83 f8 40             	cmp    $0x40,%eax
  800076:	75 d9                	jne    800051 <ide_wait_ready+0xe>
  800078:	80 7d ec 00          	cmpb   $0x0,-0x14(%rbp)
  80007c:	74 11                	je     80008f <ide_wait_ready+0x4c>
  80007e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800081:	83 e0 21             	and    $0x21,%eax
  800084:	85 c0                	test   %eax,%eax
  800086:	74 07                	je     80008f <ide_wait_ready+0x4c>
  800088:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  80008d:	eb 05                	jmp    800094 <ide_wait_ready+0x51>
  80008f:	b8 00 00 00 00       	mov    $0x0,%eax
  800094:	c9                   	leaveq 
  800095:	c3                   	retq   

0000000000800096 <ide_probe_disk1>:
  800096:	55                   	push   %rbp
  800097:	48 89 e5             	mov    %rsp,%rbp
  80009a:	48 83 ec 20          	sub    $0x20,%rsp
  80009e:	bf 00 00 00 00       	mov    $0x0,%edi
  8000a3:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8000aa:	00 00 00 
  8000ad:	ff d0                	callq  *%rax
  8000af:	c7 45 ec f6 01 00 00 	movl   $0x1f6,-0x14(%rbp)
  8000b6:	c6 45 eb f0          	movb   $0xf0,-0x15(%rbp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  8000ba:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
  8000be:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8000c1:	ee                   	out    %al,(%dx)
  8000c2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8000c9:	eb 04                	jmp    8000cf <ide_probe_disk1+0x39>
  8000cb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8000cf:	81 7d fc e7 03 00 00 	cmpl   $0x3e7,-0x4(%rbp)
  8000d6:	7f 26                	jg     8000fe <ide_probe_disk1+0x68>
  8000d8:	c7 45 f8 f7 01 00 00 	movl   $0x1f7,-0x8(%rbp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  8000df:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000e2:	89 c2                	mov    %eax,%edx
  8000e4:	ec                   	in     (%dx),%al
  8000e5:	88 45 ea             	mov    %al,-0x16(%rbp)
	return data;
  8000e8:	0f b6 45 ea          	movzbl -0x16(%rbp),%eax
  8000ec:	0f b6 c0             	movzbl %al,%eax
  8000ef:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8000f2:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8000f5:	25 a1 00 00 00       	and    $0xa1,%eax
  8000fa:	85 c0                	test   %eax,%eax
  8000fc:	75 cd                	jne    8000cb <ide_probe_disk1+0x35>
  8000fe:	c7 45 f4 f6 01 00 00 	movl   $0x1f6,-0xc(%rbp)
  800105:	c6 45 e9 e0          	movb   $0xe0,-0x17(%rbp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  800109:	0f b6 45 e9          	movzbl -0x17(%rbp),%eax
  80010d:	8b 55 f4             	mov    -0xc(%rbp),%edx
  800110:	ee                   	out    %al,(%dx)
  800111:	81 7d fc e7 03 00 00 	cmpl   $0x3e7,-0x4(%rbp)
  800118:	0f 9e c0             	setle  %al
  80011b:	0f b6 c0             	movzbl %al,%eax
  80011e:	89 c6                	mov    %eax,%esi
  800120:	48 bf 80 74 80 00 00 	movabs $0x807480,%rdi
  800127:	00 00 00 
  80012a:	b8 00 00 00 00       	mov    $0x0,%eax
  80012f:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  800136:	00 00 00 
  800139:	ff d2                	callq  *%rdx
  80013b:	81 7d fc e7 03 00 00 	cmpl   $0x3e7,-0x4(%rbp)
  800142:	0f 9e c0             	setle  %al
  800145:	c9                   	leaveq 
  800146:	c3                   	retq   

0000000000800147 <ide_set_disk>:
  800147:	55                   	push   %rbp
  800148:	48 89 e5             	mov    %rsp,%rbp
  80014b:	48 83 ec 10          	sub    $0x10,%rsp
  80014f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800152:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800156:	74 30                	je     800188 <ide_set_disk+0x41>
  800158:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
  80015c:	74 2a                	je     800188 <ide_set_disk+0x41>
  80015e:	48 ba 97 74 80 00 00 	movabs $0x807497,%rdx
  800165:	00 00 00 
  800168:	be 3f 00 00 00       	mov    $0x3f,%esi
  80016d:	48 bf a7 74 80 00 00 	movabs $0x8074a7,%rdi
  800174:	00 00 00 
  800177:	b8 00 00 00 00       	mov    $0x0,%eax
  80017c:	48 b9 e0 34 80 00 00 	movabs $0x8034e0,%rcx
  800183:	00 00 00 
  800186:	ff d1                	callq  *%rcx
  800188:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80018f:	00 00 00 
  800192:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800195:	89 10                	mov    %edx,(%rax)
  800197:	90                   	nop
  800198:	c9                   	leaveq 
  800199:	c3                   	retq   

000000000080019a <ide_read>:
  80019a:	55                   	push   %rbp
  80019b:	48 89 e5             	mov    %rsp,%rbp
  80019e:	48 83 ec 60          	sub    $0x60,%rsp
  8001a2:	89 7d bc             	mov    %edi,-0x44(%rbp)
  8001a5:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
  8001a9:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
  8001ad:	48 81 7d a8 00 01 00 	cmpq   $0x100,-0x58(%rbp)
  8001b4:	00 
  8001b5:	76 35                	jbe    8001ec <ide_read+0x52>
  8001b7:	48 b9 b3 74 80 00 00 	movabs $0x8074b3,%rcx
  8001be:	00 00 00 
  8001c1:	48 ba c0 74 80 00 00 	movabs $0x8074c0,%rdx
  8001c8:	00 00 00 
  8001cb:	be 51 00 00 00       	mov    $0x51,%esi
  8001d0:	48 bf a7 74 80 00 00 	movabs $0x8074a7,%rdi
  8001d7:	00 00 00 
  8001da:	b8 00 00 00 00       	mov    $0x0,%eax
  8001df:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  8001e6:	00 00 00 
  8001e9:	41 ff d0             	callq  *%r8
  8001ec:	bf 00 00 00 00       	mov    $0x0,%edi
  8001f1:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8001f8:	00 00 00 
  8001fb:	ff d0                	callq  *%rax
  8001fd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800201:	0f b6 c0             	movzbl %al,%eax
  800204:	c7 45 f8 f2 01 00 00 	movl   $0x1f2,-0x8(%rbp)
  80020b:	88 45 da             	mov    %al,-0x26(%rbp)
  80020e:	0f b6 45 da          	movzbl -0x26(%rbp),%eax
  800212:	8b 55 f8             	mov    -0x8(%rbp),%edx
  800215:	ee                   	out    %al,(%dx)
  800216:	8b 45 bc             	mov    -0x44(%rbp),%eax
  800219:	0f b6 c0             	movzbl %al,%eax
  80021c:	c7 45 f4 f3 01 00 00 	movl   $0x1f3,-0xc(%rbp)
  800223:	88 45 db             	mov    %al,-0x25(%rbp)
  800226:	0f b6 45 db          	movzbl -0x25(%rbp),%eax
  80022a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80022d:	ee                   	out    %al,(%dx)
  80022e:	8b 45 bc             	mov    -0x44(%rbp),%eax
  800231:	c1 e8 08             	shr    $0x8,%eax
  800234:	0f b6 c0             	movzbl %al,%eax
  800237:	c7 45 f0 f4 01 00 00 	movl   $0x1f4,-0x10(%rbp)
  80023e:	88 45 dc             	mov    %al,-0x24(%rbp)
  800241:	0f b6 45 dc          	movzbl -0x24(%rbp),%eax
  800245:	8b 55 f0             	mov    -0x10(%rbp),%edx
  800248:	ee                   	out    %al,(%dx)
  800249:	8b 45 bc             	mov    -0x44(%rbp),%eax
  80024c:	c1 e8 10             	shr    $0x10,%eax
  80024f:	0f b6 c0             	movzbl %al,%eax
  800252:	c7 45 ec f5 01 00 00 	movl   $0x1f5,-0x14(%rbp)
  800259:	88 45 dd             	mov    %al,-0x23(%rbp)
  80025c:	0f b6 45 dd          	movzbl -0x23(%rbp),%eax
  800260:	8b 55 ec             	mov    -0x14(%rbp),%edx
  800263:	ee                   	out    %al,(%dx)
  800264:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80026b:	00 00 00 
  80026e:	8b 00                	mov    (%rax),%eax
  800270:	83 e0 01             	and    $0x1,%eax
  800273:	c1 e0 04             	shl    $0x4,%eax
  800276:	89 c2                	mov    %eax,%edx
  800278:	8b 45 bc             	mov    -0x44(%rbp),%eax
  80027b:	c1 e8 18             	shr    $0x18,%eax
  80027e:	83 e0 0f             	and    $0xf,%eax
  800281:	09 d0                	or     %edx,%eax
  800283:	83 c8 e0             	or     $0xffffffe0,%eax
  800286:	0f b6 c0             	movzbl %al,%eax
  800289:	c7 45 e8 f6 01 00 00 	movl   $0x1f6,-0x18(%rbp)
  800290:	88 45 de             	mov    %al,-0x22(%rbp)
  800293:	0f b6 45 de          	movzbl -0x22(%rbp),%eax
  800297:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80029a:	ee                   	out    %al,(%dx)
  80029b:	c7 45 e0 f7 01 00 00 	movl   $0x1f7,-0x20(%rbp)
  8002a2:	c6 45 df 20          	movb   $0x20,-0x21(%rbp)
  8002a6:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
  8002aa:	8b 55 e0             	mov    -0x20(%rbp),%edx
  8002ad:	ee                   	out    %al,(%dx)
  8002ae:	eb 64                	jmp    800314 <ide_read+0x17a>
  8002b0:	bf 01 00 00 00       	mov    $0x1,%edi
  8002b5:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8002bc:	00 00 00 
  8002bf:	ff d0                	callq  *%rax
  8002c1:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8002c4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8002c8:	79 05                	jns    8002cf <ide_read+0x135>
  8002ca:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8002cd:	eb 51                	jmp    800320 <ide_read+0x186>
  8002cf:	c7 45 fc f0 01 00 00 	movl   $0x1f0,-0x4(%rbp)
  8002d6:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  8002da:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8002de:	c7 45 cc 00 01 00 00 	movl   $0x100,-0x34(%rbp)
}

static __inline void
insw(int port, void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\tinsw"			:
  8002e5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8002e8:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8002ec:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8002ef:	48 89 ce             	mov    %rcx,%rsi
  8002f2:	48 89 f7             	mov    %rsi,%rdi
  8002f5:	89 c1                	mov    %eax,%ecx
  8002f7:	fc                   	cld    
  8002f8:	f2 66 6d             	repnz insw (%dx),%es:(%rdi)
  8002fb:	89 c8                	mov    %ecx,%eax
  8002fd:	48 89 fe             	mov    %rdi,%rsi
  800300:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  800304:	89 45 cc             	mov    %eax,-0x34(%rbp)
  800307:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
  80030c:	48 81 45 b0 00 02 00 	addq   $0x200,-0x50(%rbp)
  800313:	00 
  800314:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
  800319:	75 95                	jne    8002b0 <ide_read+0x116>
  80031b:	b8 00 00 00 00       	mov    $0x0,%eax
  800320:	c9                   	leaveq 
  800321:	c3                   	retq   

0000000000800322 <ide_write>:
  800322:	55                   	push   %rbp
  800323:	48 89 e5             	mov    %rsp,%rbp
  800326:	48 83 ec 60          	sub    $0x60,%rsp
  80032a:	89 7d bc             	mov    %edi,-0x44(%rbp)
  80032d:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
  800331:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
  800335:	48 81 7d a8 00 01 00 	cmpq   $0x100,-0x58(%rbp)
  80033c:	00 
  80033d:	76 35                	jbe    800374 <ide_write+0x52>
  80033f:	48 b9 b3 74 80 00 00 	movabs $0x8074b3,%rcx
  800346:	00 00 00 
  800349:	48 ba c0 74 80 00 00 	movabs $0x8074c0,%rdx
  800350:	00 00 00 
  800353:	be 71 00 00 00       	mov    $0x71,%esi
  800358:	48 bf a7 74 80 00 00 	movabs $0x8074a7,%rdi
  80035f:	00 00 00 
  800362:	b8 00 00 00 00       	mov    $0x0,%eax
  800367:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  80036e:	00 00 00 
  800371:	41 ff d0             	callq  *%r8
  800374:	bf 00 00 00 00       	mov    $0x0,%edi
  800379:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800380:	00 00 00 
  800383:	ff d0                	callq  *%rax
  800385:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800389:	0f b6 c0             	movzbl %al,%eax
  80038c:	c7 45 f8 f2 01 00 00 	movl   $0x1f2,-0x8(%rbp)
  800393:	88 45 da             	mov    %al,-0x26(%rbp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  800396:	0f b6 45 da          	movzbl -0x26(%rbp),%eax
  80039a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80039d:	ee                   	out    %al,(%dx)
  80039e:	8b 45 bc             	mov    -0x44(%rbp),%eax
  8003a1:	0f b6 c0             	movzbl %al,%eax
  8003a4:	c7 45 f4 f3 01 00 00 	movl   $0x1f3,-0xc(%rbp)
  8003ab:	88 45 db             	mov    %al,-0x25(%rbp)
  8003ae:	0f b6 45 db          	movzbl -0x25(%rbp),%eax
  8003b2:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8003b5:	ee                   	out    %al,(%dx)
  8003b6:	8b 45 bc             	mov    -0x44(%rbp),%eax
  8003b9:	c1 e8 08             	shr    $0x8,%eax
  8003bc:	0f b6 c0             	movzbl %al,%eax
  8003bf:	c7 45 f0 f4 01 00 00 	movl   $0x1f4,-0x10(%rbp)
  8003c6:	88 45 dc             	mov    %al,-0x24(%rbp)
  8003c9:	0f b6 45 dc          	movzbl -0x24(%rbp),%eax
  8003cd:	8b 55 f0             	mov    -0x10(%rbp),%edx
  8003d0:	ee                   	out    %al,(%dx)
  8003d1:	8b 45 bc             	mov    -0x44(%rbp),%eax
  8003d4:	c1 e8 10             	shr    $0x10,%eax
  8003d7:	0f b6 c0             	movzbl %al,%eax
  8003da:	c7 45 ec f5 01 00 00 	movl   $0x1f5,-0x14(%rbp)
  8003e1:	88 45 dd             	mov    %al,-0x23(%rbp)
  8003e4:	0f b6 45 dd          	movzbl -0x23(%rbp),%eax
  8003e8:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8003eb:	ee                   	out    %al,(%dx)
  8003ec:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8003f3:	00 00 00 
  8003f6:	8b 00                	mov    (%rax),%eax
  8003f8:	83 e0 01             	and    $0x1,%eax
  8003fb:	c1 e0 04             	shl    $0x4,%eax
  8003fe:	89 c2                	mov    %eax,%edx
  800400:	8b 45 bc             	mov    -0x44(%rbp),%eax
  800403:	c1 e8 18             	shr    $0x18,%eax
  800406:	83 e0 0f             	and    $0xf,%eax
  800409:	09 d0                	or     %edx,%eax
  80040b:	83 c8 e0             	or     $0xffffffe0,%eax
  80040e:	0f b6 c0             	movzbl %al,%eax
  800411:	c7 45 e8 f6 01 00 00 	movl   $0x1f6,-0x18(%rbp)
  800418:	88 45 de             	mov    %al,-0x22(%rbp)
  80041b:	0f b6 45 de          	movzbl -0x22(%rbp),%eax
  80041f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  800422:	ee                   	out    %al,(%dx)
  800423:	c7 45 e0 f7 01 00 00 	movl   $0x1f7,-0x20(%rbp)
  80042a:	c6 45 df 30          	movb   $0x30,-0x21(%rbp)
  80042e:	0f b6 45 df          	movzbl -0x21(%rbp),%eax
  800432:	8b 55 e0             	mov    -0x20(%rbp),%edx
  800435:	ee                   	out    %al,(%dx)
  800436:	eb 5e                	jmp    800496 <ide_write+0x174>
  800438:	bf 01 00 00 00       	mov    $0x1,%edi
  80043d:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800444:	00 00 00 
  800447:	ff d0                	callq  *%rax
  800449:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80044c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800450:	79 05                	jns    800457 <ide_write+0x135>
  800452:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800455:	eb 4b                	jmp    8004a2 <ide_write+0x180>
  800457:	c7 45 fc f0 01 00 00 	movl   $0x1f0,-0x4(%rbp)
  80045e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  800462:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800466:	c7 45 cc 00 01 00 00 	movl   $0x100,-0x34(%rbp)
}

static __inline void
outsw(int port, const void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\toutsw"		:
  80046d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800470:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  800474:	8b 45 cc             	mov    -0x34(%rbp),%eax
  800477:	48 89 ce             	mov    %rcx,%rsi
  80047a:	89 c1                	mov    %eax,%ecx
  80047c:	fc                   	cld    
  80047d:	f2 66 6f             	repnz outsw %ds:(%rsi),(%dx)
  800480:	89 c8                	mov    %ecx,%eax
  800482:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  800486:	89 45 cc             	mov    %eax,-0x34(%rbp)
  800489:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
  80048e:	48 81 45 b0 00 02 00 	addq   $0x200,-0x50(%rbp)
  800495:	00 
  800496:	48 83 7d a8 00       	cmpq   $0x0,-0x58(%rbp)
  80049b:	75 9b                	jne    800438 <ide_write+0x116>
  80049d:	b8 00 00 00 00       	mov    $0x0,%eax
  8004a2:	c9                   	leaveq 
  8004a3:	c3                   	retq   

00000000008004a4 <diskaddr>:
#include "fs.h"

// Return the virtual address of this disk block.
void*
diskaddr(uint64_t blockno)
{
  8004a4:	55                   	push   %rbp
  8004a5:	48 89 e5             	mov    %rsp,%rbp
  8004a8:	48 83 ec 10          	sub    $0x10,%rsp
  8004ac:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
	if (blockno == 0 || (super && blockno >= super->s_nblocks))
  8004b0:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8004b5:	74 2a                	je     8004e1 <diskaddr+0x3d>
  8004b7:	48 b8 18 60 81 00 00 	movabs $0x816018,%rax
  8004be:	00 00 00 
  8004c1:	48 8b 00             	mov    (%rax),%rax
  8004c4:	48 85 c0             	test   %rax,%rax
  8004c7:	74 4a                	je     800513 <diskaddr+0x6f>
  8004c9:	48 b8 18 60 81 00 00 	movabs $0x816018,%rax
  8004d0:	00 00 00 
  8004d3:	48 8b 00             	mov    (%rax),%rax
  8004d6:	8b 40 04             	mov    0x4(%rax),%eax
  8004d9:	89 c0                	mov    %eax,%eax
  8004db:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8004df:	77 32                	ja     800513 <diskaddr+0x6f>
		panic("bad block number %08x in diskaddr", blockno);
  8004e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004e5:	48 89 c1             	mov    %rax,%rcx
  8004e8:	48 ba d8 74 80 00 00 	movabs $0x8074d8,%rdx
  8004ef:	00 00 00 
  8004f2:	be 09 00 00 00       	mov    $0x9,%esi
  8004f7:	48 bf fa 74 80 00 00 	movabs $0x8074fa,%rdi
  8004fe:	00 00 00 
  800501:	b8 00 00 00 00       	mov    $0x0,%eax
  800506:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  80050d:	00 00 00 
  800510:	41 ff d0             	callq  *%r8
	return (char*) (DISKMAP + blockno * BLKSIZE);
  800513:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800517:	48 05 00 00 01 00    	add    $0x10000,%rax
  80051d:	48 c1 e0 0c          	shl    $0xc,%rax
}
  800521:	c9                   	leaveq 
  800522:	c3                   	retq   

0000000000800523 <va_is_mapped>:

// Is this virtual address mapped?
bool
va_is_mapped(void *va)
{
  800523:	55                   	push   %rbp
  800524:	48 89 e5             	mov    %rsp,%rbp
  800527:	48 83 ec 08          	sub    $0x8,%rsp
  80052b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
	return (uvpml4e[VPML4E(va)] & PTE_P) && (uvpde[VPDPE(va)] & PTE_P) && (uvpd[VPD(va)] & PTE_P) && (uvpt[PGNUM(va)] & PTE_P);
  80052f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800533:	48 c1 e8 27          	shr    $0x27,%rax
  800537:	48 89 c2             	mov    %rax,%rdx
  80053a:	48 b8 00 20 40 80 00 	movabs $0x10080402000,%rax
  800541:	01 00 00 
  800544:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800548:	83 e0 01             	and    $0x1,%eax
  80054b:	48 85 c0             	test   %rax,%rax
  80054e:	74 6a                	je     8005ba <va_is_mapped+0x97>
  800550:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800554:	48 c1 e8 1e          	shr    $0x1e,%rax
  800558:	48 89 c2             	mov    %rax,%rdx
  80055b:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  800562:	01 00 00 
  800565:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800569:	83 e0 01             	and    $0x1,%eax
  80056c:	48 85 c0             	test   %rax,%rax
  80056f:	74 49                	je     8005ba <va_is_mapped+0x97>
  800571:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800575:	48 c1 e8 15          	shr    $0x15,%rax
  800579:	48 89 c2             	mov    %rax,%rdx
  80057c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  800583:	01 00 00 
  800586:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80058a:	83 e0 01             	and    $0x1,%eax
  80058d:	48 85 c0             	test   %rax,%rax
  800590:	74 28                	je     8005ba <va_is_mapped+0x97>
  800592:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800596:	48 c1 e8 0c          	shr    $0xc,%rax
  80059a:	48 89 c2             	mov    %rax,%rdx
  80059d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8005a4:	01 00 00 
  8005a7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8005ab:	83 e0 01             	and    $0x1,%eax
  8005ae:	48 85 c0             	test   %rax,%rax
  8005b1:	74 07                	je     8005ba <va_is_mapped+0x97>
  8005b3:	b8 01 00 00 00       	mov    $0x1,%eax
  8005b8:	eb 05                	jmp    8005bf <va_is_mapped+0x9c>
  8005ba:	b8 00 00 00 00       	mov    $0x0,%eax
  8005bf:	83 e0 01             	and    $0x1,%eax
}
  8005c2:	c9                   	leaveq 
  8005c3:	c3                   	retq   

00000000008005c4 <va_is_dirty>:

// Is this virtual address dirty?
bool
va_is_dirty(void *va)
{
  8005c4:	55                   	push   %rbp
  8005c5:	48 89 e5             	mov    %rsp,%rbp
  8005c8:	48 83 ec 08          	sub    $0x8,%rsp
  8005cc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
	return (uvpt[PGNUM(va)] & PTE_D) != 0;
  8005d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005d4:	48 c1 e8 0c          	shr    $0xc,%rax
  8005d8:	48 89 c2             	mov    %rax,%rdx
  8005db:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8005e2:	01 00 00 
  8005e5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8005e9:	83 e0 40             	and    $0x40,%eax
  8005ec:	48 85 c0             	test   %rax,%rax
  8005ef:	0f 95 c0             	setne  %al
}
  8005f2:	c9                   	leaveq 
  8005f3:	c3                   	retq   

00000000008005f4 <bc_pgfault>:
// Fault any disk block that is read in to memory by
// loading it from disk.
// Hint: Use ide_read and BLKSECTS.
static void
bc_pgfault(struct UTrapframe *utf)
{
  8005f4:	55                   	push   %rbp
  8005f5:	48 89 e5             	mov    %rsp,%rbp
  8005f8:	48 83 ec 30          	sub    $0x30,%rsp
  8005fc:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
	void *addr = (void *) utf->utf_fault_va;
  800600:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800604:	48 8b 00             	mov    (%rax),%rax
  800607:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
	uint64_t blockno = ((uint64_t)addr - DISKMAP) / BLKSIZE;
  80060b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80060f:	48 2d 00 00 00 10    	sub    $0x10000000,%rax
  800615:	48 c1 e8 0c          	shr    $0xc,%rax
  800619:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
	int r;

	// Check that the fault was within the block cache region
	if (addr < (void*)DISKMAP || addr >= (void*)(DISKMAP + DISKSIZE))
  80061d:	48 81 7d f8 ff ff ff 	cmpq   $0xfffffff,-0x8(%rbp)
  800624:	0f 
  800625:	76 0b                	jbe    800632 <bc_pgfault+0x3e>
  800627:	b8 ff ff ff cf       	mov    $0xcfffffff,%eax
  80062c:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  800630:	76 4b                	jbe    80067d <bc_pgfault+0x89>
		panic("page fault in FS: eip %08x, va %08x, err %04x",
  800632:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800636:	48 8b 48 08          	mov    0x8(%rax),%rcx
  80063a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80063e:	48 8b 80 88 00 00 00 	mov    0x88(%rax),%rax
  800645:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  800649:	49 89 c9             	mov    %rcx,%r9
  80064c:	49 89 d0             	mov    %rdx,%r8
  80064f:	48 89 c1             	mov    %rax,%rcx
  800652:	48 ba 08 75 80 00 00 	movabs $0x807508,%rdx
  800659:	00 00 00 
  80065c:	be 28 00 00 00       	mov    $0x28,%esi
  800661:	48 bf fa 74 80 00 00 	movabs $0x8074fa,%rdi
  800668:	00 00 00 
  80066b:	b8 00 00 00 00       	mov    $0x0,%eax
  800670:	49 ba e0 34 80 00 00 	movabs $0x8034e0,%r10
  800677:	00 00 00 
  80067a:	41 ff d2             	callq  *%r10
		      utf->utf_rip, addr, utf->utf_err);

	// Sanity check the block number.
	if (super && blockno >= super->s_nblocks)
  80067d:	48 b8 18 60 81 00 00 	movabs $0x816018,%rax
  800684:	00 00 00 
  800687:	48 8b 00             	mov    (%rax),%rax
  80068a:	48 85 c0             	test   %rax,%rax
  80068d:	74 4a                	je     8006d9 <bc_pgfault+0xe5>
  80068f:	48 b8 18 60 81 00 00 	movabs $0x816018,%rax
  800696:	00 00 00 
  800699:	48 8b 00             	mov    (%rax),%rax
  80069c:	8b 40 04             	mov    0x4(%rax),%eax
  80069f:	89 c0                	mov    %eax,%eax
  8006a1:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8006a5:	77 32                	ja     8006d9 <bc_pgfault+0xe5>
		panic("reading non-existent block %08x\n", blockno);
  8006a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8006ab:	48 89 c1             	mov    %rax,%rcx
  8006ae:	48 ba 38 75 80 00 00 	movabs $0x807538,%rdx
  8006b5:	00 00 00 
  8006b8:	be 2c 00 00 00       	mov    $0x2c,%esi
  8006bd:	48 bf fa 74 80 00 00 	movabs $0x8074fa,%rdi
  8006c4:	00 00 00 
  8006c7:	b8 00 00 00 00       	mov    $0x0,%eax
  8006cc:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  8006d3:	00 00 00 
  8006d6:	41 ff d0             	callq  *%r8

	// Allocate a page in the disk map region, read the contents
	// of the block from the disk into that page.
	// Hint: first round addr to page boundary.
	//
	addr = ROUNDDOWN(addr, PGSIZE);
  8006d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006dd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8006e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006e5:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8006eb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
	if ((r = sys_page_alloc(0, addr, PTE_U|PTE_P|PTE_W)) < 0)
  8006ef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006f3:	ba 07 00 00 00       	mov    $0x7,%edx
  8006f8:	48 89 c6             	mov    %rax,%rsi
  8006fb:	bf 00 00 00 00       	mov    $0x0,%edi
  800700:	48 b8 da 4b 80 00 00 	movabs $0x804bda,%rax
  800707:	00 00 00 
  80070a:	ff d0                	callq  *%rax
  80070c:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80070f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800713:	79 30                	jns    800745 <bc_pgfault+0x151>
		panic("in bc_pgfault, sys_page_alloc: %e", r);
  800715:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800718:	89 c1                	mov    %eax,%ecx
  80071a:	48 ba 60 75 80 00 00 	movabs $0x807560,%rdx
  800721:	00 00 00 
  800724:	be 34 00 00 00       	mov    $0x34,%esi
  800729:	48 bf fa 74 80 00 00 	movabs $0x8074fa,%rdi
  800730:	00 00 00 
  800733:	b8 00 00 00 00       	mov    $0x0,%eax
  800738:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  80073f:	00 00 00 
  800742:	41 ff d0             	callq  *%r8
	/* FIXME DP: Should be lab 8 */
    /* Your code here */

#endif // VMM_GUEST

	if ((r = sys_page_map(0, addr, 0, addr, uvpt[PGNUM(addr)] & PTE_SYSCALL)) < 0)
  800745:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800749:	48 c1 e8 0c          	shr    $0xc,%rax
  80074d:	48 89 c2             	mov    %rax,%rdx
  800750:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  800757:	01 00 00 
  80075a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80075e:	25 07 0e 00 00       	and    $0xe07,%eax
  800763:	89 c1                	mov    %eax,%ecx
  800765:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  800769:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80076d:	41 89 c8             	mov    %ecx,%r8d
  800770:	48 89 d1             	mov    %rdx,%rcx
  800773:	ba 00 00 00 00       	mov    $0x0,%edx
  800778:	48 89 c6             	mov    %rax,%rsi
  80077b:	bf 00 00 00 00       	mov    $0x0,%edi
  800780:	48 b8 2c 4c 80 00 00 	movabs $0x804c2c,%rax
  800787:	00 00 00 
  80078a:	ff d0                	callq  *%rax
  80078c:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80078f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800793:	79 30                	jns    8007c5 <bc_pgfault+0x1d1>
		panic("in bc_pgfault, sys_page_map: %e", r);
  800795:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800798:	89 c1                	mov    %eax,%ecx
  80079a:	48 ba 88 75 80 00 00 	movabs $0x807588,%rdx
  8007a1:	00 00 00 
  8007a4:	be 43 00 00 00       	mov    $0x43,%esi
  8007a9:	48 bf fa 74 80 00 00 	movabs $0x8074fa,%rdi
  8007b0:	00 00 00 
  8007b3:	b8 00 00 00 00       	mov    $0x0,%eax
  8007b8:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  8007bf:	00 00 00 
  8007c2:	41 ff d0             	callq  *%r8

	// Check that the block we read was allocated. (exercise for
	// the reader: why do we do this *after* reading the block
	// in?)
	if (bitmap && block_is_free(blockno))
  8007c5:	48 b8 10 60 81 00 00 	movabs $0x816010,%rax
  8007cc:	00 00 00 
  8007cf:	48 8b 00             	mov    (%rax),%rax
  8007d2:	48 85 c0             	test   %rax,%rax
  8007d5:	74 48                	je     80081f <bc_pgfault+0x22b>
  8007d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8007db:	89 c7                	mov    %eax,%edi
  8007dd:	48 b8 af 0c 80 00 00 	movabs $0x800caf,%rax
  8007e4:	00 00 00 
  8007e7:	ff d0                	callq  *%rax
  8007e9:	84 c0                	test   %al,%al
  8007eb:	74 32                	je     80081f <bc_pgfault+0x22b>
		panic("reading free block %08x\n", blockno);
  8007ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8007f1:	48 89 c1             	mov    %rax,%rcx
  8007f4:	48 ba a8 75 80 00 00 	movabs $0x8075a8,%rdx
  8007fb:	00 00 00 
  8007fe:	be 49 00 00 00       	mov    $0x49,%esi
  800803:	48 bf fa 74 80 00 00 	movabs $0x8074fa,%rdi
  80080a:	00 00 00 
  80080d:	b8 00 00 00 00       	mov    $0x0,%eax
  800812:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  800819:	00 00 00 
  80081c:	41 ff d0             	callq  *%r8
}
  80081f:	90                   	nop
  800820:	c9                   	leaveq 
  800821:	c3                   	retq   

0000000000800822 <flush_block>:
// Hint: Use va_is_mapped, va_is_dirty, and ide_write.
// Hint: Use the PTE_SYSCALL constant when calling sys_page_map.
// Hint: Don't forget to round addr down.
void
flush_block(void *addr)
{
  800822:	55                   	push   %rbp
  800823:	48 89 e5             	mov    %rsp,%rbp
  800826:	48 83 ec 20          	sub    $0x20,%rsp
  80082a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
	uint64_t blockno = ((uint64_t)addr - DISKMAP) / BLKSIZE;
  80082e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800832:	48 2d 00 00 00 10    	sub    $0x10000000,%rax
  800838:	48 c1 e8 0c          	shr    $0xc,%rax
  80083c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)

	if (addr < (void*)DISKMAP || addr >= (void*)(DISKMAP + DISKSIZE))
  800840:	48 81 7d e8 ff ff ff 	cmpq   $0xfffffff,-0x18(%rbp)
  800847:	0f 
  800848:	76 0b                	jbe    800855 <flush_block+0x33>
  80084a:	b8 ff ff ff cf       	mov    $0xcfffffff,%eax
  80084f:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
  800853:	76 32                	jbe    800887 <flush_block+0x65>
		panic("flush_block of bad va %08x", addr);
  800855:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800859:	48 89 c1             	mov    %rax,%rcx
  80085c:	48 ba c1 75 80 00 00 	movabs $0x8075c1,%rdx
  800863:	00 00 00 
  800866:	be 59 00 00 00       	mov    $0x59,%esi
  80086b:	48 bf fa 74 80 00 00 	movabs $0x8074fa,%rdi
  800872:	00 00 00 
  800875:	b8 00 00 00 00       	mov    $0x0,%eax
  80087a:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  800881:	00 00 00 
  800884:	41 ff d0             	callq  *%r8

	if (!va_is_mapped(addr) || !va_is_dirty(addr))
  800887:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80088b:	48 89 c7             	mov    %rax,%rdi
  80088e:	48 b8 23 05 80 00 00 	movabs $0x800523,%rax
  800895:	00 00 00 
  800898:	ff d0                	callq  *%rax
  80089a:	83 f0 01             	xor    $0x1,%eax
  80089d:	84 c0                	test   %al,%al
  80089f:	75 79                	jne    80091a <flush_block+0xf8>
  8008a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008a5:	48 89 c7             	mov    %rax,%rdi
  8008a8:	48 b8 c4 05 80 00 00 	movabs $0x8005c4,%rax
  8008af:	00 00 00 
  8008b2:	ff d0                	callq  *%rax
  8008b4:	83 f0 01             	xor    $0x1,%eax
  8008b7:	84 c0                	test   %al,%al
  8008b9:	75 5f                	jne    80091a <flush_block+0xf8>
		return;

	// Write the disk block and clear PTE_D.
	addr = ROUNDDOWN(addr, BLKSIZE);
  8008bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008bf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8008c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8008c7:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8008cd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
	/* FIXME DP: Should be lab 8 */
    /* Your code here */

#endif

	sys_page_map(0, addr, 0, addr, uvpt[PGNUM(addr)] & PTE_SYSCALL);
  8008d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008d5:	48 c1 e8 0c          	shr    $0xc,%rax
  8008d9:	48 89 c2             	mov    %rax,%rdx
  8008dc:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8008e3:	01 00 00 
  8008e6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8008ea:	25 07 0e 00 00       	and    $0xe07,%eax
  8008ef:	89 c1                	mov    %eax,%ecx
  8008f1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008f9:	41 89 c8             	mov    %ecx,%r8d
  8008fc:	48 89 d1             	mov    %rdx,%rcx
  8008ff:	ba 00 00 00 00       	mov    $0x0,%edx
  800904:	48 89 c6             	mov    %rax,%rsi
  800907:	bf 00 00 00 00       	mov    $0x0,%edi
  80090c:	48 b8 2c 4c 80 00 00 	movabs $0x804c2c,%rax
  800913:	00 00 00 
  800916:	ff d0                	callq  *%rax
  800918:	eb 01                	jmp    80091b <flush_block+0xf9>

	if (addr < (void*)DISKMAP || addr >= (void*)(DISKMAP + DISKSIZE))
		panic("flush_block of bad va %08x", addr);

	if (!va_is_mapped(addr) || !va_is_dirty(addr))
		return;
  80091a:	90                   	nop
    /* Your code here */

#endif

	sys_page_map(0, addr, 0, addr, uvpt[PGNUM(addr)] & PTE_SYSCALL);
}
  80091b:	c9                   	leaveq 
  80091c:	c3                   	retq   

000000000080091d <check_bc>:

// Test that the block cache works, by smashing the superblock and
// reading it back.
static void
check_bc(void)
{
  80091d:	55                   	push   %rbp
  80091e:	48 89 e5             	mov    %rsp,%rbp
  800921:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
	struct Super backup;

	// back up super block
	memmove(&backup, diskaddr(1), sizeof backup);
  800928:	bf 01 00 00 00       	mov    $0x1,%edi
  80092d:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  800934:	00 00 00 
  800937:	ff d0                	callq  *%rax
  800939:	48 89 c1             	mov    %rax,%rcx
  80093c:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800943:	ba 08 01 00 00       	mov    $0x108,%edx
  800948:	48 89 ce             	mov    %rcx,%rsi
  80094b:	48 89 c7             	mov    %rax,%rdi
  80094e:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  800955:	00 00 00 
  800958:	ff d0                	callq  *%rax

	// smash it
	strcpy(diskaddr(1), "OOPS!\n");
  80095a:	bf 01 00 00 00       	mov    $0x1,%edi
  80095f:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  800966:	00 00 00 
  800969:	ff d0                	callq  *%rax
  80096b:	48 be dc 75 80 00 00 	movabs $0x8075dc,%rsi
  800972:	00 00 00 
  800975:	48 89 c7             	mov    %rax,%rdi
  800978:	48 b8 aa 42 80 00 00 	movabs $0x8042aa,%rax
  80097f:	00 00 00 
  800982:	ff d0                	callq  *%rax
	flush_block(diskaddr(1));
  800984:	bf 01 00 00 00       	mov    $0x1,%edi
  800989:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  800990:	00 00 00 
  800993:	ff d0                	callq  *%rax
  800995:	48 89 c7             	mov    %rax,%rdi
  800998:	48 b8 22 08 80 00 00 	movabs $0x800822,%rax
  80099f:	00 00 00 
  8009a2:	ff d0                	callq  *%rax
	assert(va_is_mapped(diskaddr(1)));
  8009a4:	bf 01 00 00 00       	mov    $0x1,%edi
  8009a9:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  8009b0:	00 00 00 
  8009b3:	ff d0                	callq  *%rax
  8009b5:	48 89 c7             	mov    %rax,%rdi
  8009b8:	48 b8 23 05 80 00 00 	movabs $0x800523,%rax
  8009bf:	00 00 00 
  8009c2:	ff d0                	callq  *%rax
  8009c4:	83 f0 01             	xor    $0x1,%eax
  8009c7:	84 c0                	test   %al,%al
  8009c9:	74 35                	je     800a00 <check_bc+0xe3>
  8009cb:	48 b9 e3 75 80 00 00 	movabs $0x8075e3,%rcx
  8009d2:	00 00 00 
  8009d5:	48 ba fd 75 80 00 00 	movabs $0x8075fd,%rdx
  8009dc:	00 00 00 
  8009df:	be 7c 00 00 00       	mov    $0x7c,%esi
  8009e4:	48 bf fa 74 80 00 00 	movabs $0x8074fa,%rdi
  8009eb:	00 00 00 
  8009ee:	b8 00 00 00 00       	mov    $0x0,%eax
  8009f3:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  8009fa:	00 00 00 
  8009fd:	41 ff d0             	callq  *%r8
	assert(!va_is_dirty(diskaddr(1)));
  800a00:	bf 01 00 00 00       	mov    $0x1,%edi
  800a05:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  800a0c:	00 00 00 
  800a0f:	ff d0                	callq  *%rax
  800a11:	48 89 c7             	mov    %rax,%rdi
  800a14:	48 b8 c4 05 80 00 00 	movabs $0x8005c4,%rax
  800a1b:	00 00 00 
  800a1e:	ff d0                	callq  *%rax
  800a20:	84 c0                	test   %al,%al
  800a22:	74 35                	je     800a59 <check_bc+0x13c>
  800a24:	48 b9 12 76 80 00 00 	movabs $0x807612,%rcx
  800a2b:	00 00 00 
  800a2e:	48 ba fd 75 80 00 00 	movabs $0x8075fd,%rdx
  800a35:	00 00 00 
  800a38:	be 7d 00 00 00       	mov    $0x7d,%esi
  800a3d:	48 bf fa 74 80 00 00 	movabs $0x8074fa,%rdi
  800a44:	00 00 00 
  800a47:	b8 00 00 00 00       	mov    $0x0,%eax
  800a4c:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  800a53:	00 00 00 
  800a56:	41 ff d0             	callq  *%r8

	// clear it out
	sys_page_unmap(0, diskaddr(1));
  800a59:	bf 01 00 00 00       	mov    $0x1,%edi
  800a5e:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  800a65:	00 00 00 
  800a68:	ff d0                	callq  *%rax
  800a6a:	48 89 c6             	mov    %rax,%rsi
  800a6d:	bf 00 00 00 00       	mov    $0x0,%edi
  800a72:	48 b8 8c 4c 80 00 00 	movabs $0x804c8c,%rax
  800a79:	00 00 00 
  800a7c:	ff d0                	callq  *%rax
	assert(!va_is_mapped(diskaddr(1)));
  800a7e:	bf 01 00 00 00       	mov    $0x1,%edi
  800a83:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  800a8a:	00 00 00 
  800a8d:	ff d0                	callq  *%rax
  800a8f:	48 89 c7             	mov    %rax,%rdi
  800a92:	48 b8 23 05 80 00 00 	movabs $0x800523,%rax
  800a99:	00 00 00 
  800a9c:	ff d0                	callq  *%rax
  800a9e:	84 c0                	test   %al,%al
  800aa0:	74 35                	je     800ad7 <check_bc+0x1ba>
  800aa2:	48 b9 2c 76 80 00 00 	movabs $0x80762c,%rcx
  800aa9:	00 00 00 
  800aac:	48 ba fd 75 80 00 00 	movabs $0x8075fd,%rdx
  800ab3:	00 00 00 
  800ab6:	be 81 00 00 00       	mov    $0x81,%esi
  800abb:	48 bf fa 74 80 00 00 	movabs $0x8074fa,%rdi
  800ac2:	00 00 00 
  800ac5:	b8 00 00 00 00       	mov    $0x0,%eax
  800aca:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  800ad1:	00 00 00 
  800ad4:	41 ff d0             	callq  *%r8

	// read it back in
	assert(strcmp(diskaddr(1), "OOPS!\n") == 0);
  800ad7:	bf 01 00 00 00       	mov    $0x1,%edi
  800adc:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  800ae3:	00 00 00 
  800ae6:	ff d0                	callq  *%rax
  800ae8:	48 be dc 75 80 00 00 	movabs $0x8075dc,%rsi
  800aef:	00 00 00 
  800af2:	48 89 c7             	mov    %rax,%rdi
  800af5:	48 b8 0c 44 80 00 00 	movabs $0x80440c,%rax
  800afc:	00 00 00 
  800aff:	ff d0                	callq  *%rax
  800b01:	85 c0                	test   %eax,%eax
  800b03:	74 35                	je     800b3a <check_bc+0x21d>
  800b05:	48 b9 48 76 80 00 00 	movabs $0x807648,%rcx
  800b0c:	00 00 00 
  800b0f:	48 ba fd 75 80 00 00 	movabs $0x8075fd,%rdx
  800b16:	00 00 00 
  800b19:	be 84 00 00 00       	mov    $0x84,%esi
  800b1e:	48 bf fa 74 80 00 00 	movabs $0x8074fa,%rdi
  800b25:	00 00 00 
  800b28:	b8 00 00 00 00       	mov    $0x0,%eax
  800b2d:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  800b34:	00 00 00 
  800b37:	41 ff d0             	callq  *%r8

	// fix it
	memmove(diskaddr(1), &backup, sizeof backup);
  800b3a:	bf 01 00 00 00       	mov    $0x1,%edi
  800b3f:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  800b46:	00 00 00 
  800b49:	ff d0                	callq  *%rax
  800b4b:	48 89 c1             	mov    %rax,%rcx
  800b4e:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800b55:	ba 08 01 00 00       	mov    $0x108,%edx
  800b5a:	48 89 c6             	mov    %rax,%rsi
  800b5d:	48 89 cf             	mov    %rcx,%rdi
  800b60:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  800b67:	00 00 00 
  800b6a:	ff d0                	callq  *%rax
	flush_block(diskaddr(1));
  800b6c:	bf 01 00 00 00       	mov    $0x1,%edi
  800b71:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  800b78:	00 00 00 
  800b7b:	ff d0                	callq  *%rax
  800b7d:	48 89 c7             	mov    %rax,%rdi
  800b80:	48 b8 22 08 80 00 00 	movabs $0x800822,%rax
  800b87:	00 00 00 
  800b8a:	ff d0                	callq  *%rax

	cprintf("block cache is good\n");
  800b8c:	48 bf 6c 76 80 00 00 	movabs $0x80766c,%rdi
  800b93:	00 00 00 
  800b96:	b8 00 00 00 00       	mov    $0x0,%eax
  800b9b:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  800ba2:	00 00 00 
  800ba5:	ff d2                	callq  *%rdx
}
  800ba7:	90                   	nop
  800ba8:	c9                   	leaveq 
  800ba9:	c3                   	retq   

0000000000800baa <bc_init>:

void
bc_init(void)
{
  800baa:	55                   	push   %rbp
  800bab:	48 89 e5             	mov    %rsp,%rbp
  800bae:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
	struct Super super;
	set_pgfault_handler(bc_pgfault);
  800bb5:	48 bf f4 05 80 00 00 	movabs $0x8005f4,%rdi
  800bbc:	00 00 00 
  800bbf:	48 b8 d6 4f 80 00 00 	movabs $0x804fd6,%rax
  800bc6:	00 00 00 
  800bc9:	ff d0                	callq  *%rax
	check_bc();
  800bcb:	48 b8 1d 09 80 00 00 	movabs $0x80091d,%rax
  800bd2:	00 00 00 
  800bd5:	ff d0                	callq  *%rax

	// cache the super block by reading it once
	memmove(&super, diskaddr(1), sizeof super);
  800bd7:	bf 01 00 00 00       	mov    $0x1,%edi
  800bdc:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  800be3:	00 00 00 
  800be6:	ff d0                	callq  *%rax
  800be8:	48 89 c1             	mov    %rax,%rcx
  800beb:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800bf2:	ba 08 01 00 00       	mov    $0x108,%edx
  800bf7:	48 89 ce             	mov    %rcx,%rsi
  800bfa:	48 89 c7             	mov    %rax,%rdi
  800bfd:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  800c04:	00 00 00 
  800c07:	ff d0                	callq  *%rax
}
  800c09:	90                   	nop
  800c0a:	c9                   	leaveq 
  800c0b:	c3                   	retq   

0000000000800c0c <check_super>:
  800c0c:	55                   	push   %rbp
  800c0d:	48 89 e5             	mov    %rsp,%rbp
  800c10:	48 b8 18 60 81 00 00 	movabs $0x816018,%rax
  800c17:	00 00 00 
  800c1a:	48 8b 00             	mov    (%rax),%rax
  800c1d:	8b 00                	mov    (%rax),%eax
  800c1f:	3d ae 30 05 4a       	cmp    $0x4a0530ae,%eax
  800c24:	74 2a                	je     800c50 <check_super+0x44>
  800c26:	48 ba 81 76 80 00 00 	movabs $0x807681,%rdx
  800c2d:	00 00 00 
  800c30:	be 12 00 00 00       	mov    $0x12,%esi
  800c35:	48 bf 9e 76 80 00 00 	movabs $0x80769e,%rdi
  800c3c:	00 00 00 
  800c3f:	b8 00 00 00 00       	mov    $0x0,%eax
  800c44:	48 b9 e0 34 80 00 00 	movabs $0x8034e0,%rcx
  800c4b:	00 00 00 
  800c4e:	ff d1                	callq  *%rcx
  800c50:	48 b8 18 60 81 00 00 	movabs $0x816018,%rax
  800c57:	00 00 00 
  800c5a:	48 8b 00             	mov    (%rax),%rax
  800c5d:	8b 40 04             	mov    0x4(%rax),%eax
  800c60:	3d 00 00 0c 00       	cmp    $0xc0000,%eax
  800c65:	76 2a                	jbe    800c91 <check_super+0x85>
  800c67:	48 ba a9 76 80 00 00 	movabs $0x8076a9,%rdx
  800c6e:	00 00 00 
  800c71:	be 15 00 00 00       	mov    $0x15,%esi
  800c76:	48 bf 9e 76 80 00 00 	movabs $0x80769e,%rdi
  800c7d:	00 00 00 
  800c80:	b8 00 00 00 00       	mov    $0x0,%eax
  800c85:	48 b9 e0 34 80 00 00 	movabs $0x8034e0,%rcx
  800c8c:	00 00 00 
  800c8f:	ff d1                	callq  *%rcx
  800c91:	48 bf c2 76 80 00 00 	movabs $0x8076c2,%rdi
  800c98:	00 00 00 
  800c9b:	b8 00 00 00 00       	mov    $0x0,%eax
  800ca0:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  800ca7:	00 00 00 
  800caa:	ff d2                	callq  *%rdx
  800cac:	90                   	nop
  800cad:	5d                   	pop    %rbp
  800cae:	c3                   	retq   

0000000000800caf <block_is_free>:
  800caf:	55                   	push   %rbp
  800cb0:	48 89 e5             	mov    %rsp,%rbp
  800cb3:	48 83 ec 08          	sub    $0x8,%rsp
  800cb7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800cba:	48 b8 18 60 81 00 00 	movabs $0x816018,%rax
  800cc1:	00 00 00 
  800cc4:	48 8b 00             	mov    (%rax),%rax
  800cc7:	48 85 c0             	test   %rax,%rax
  800cca:	74 15                	je     800ce1 <block_is_free+0x32>
  800ccc:	48 b8 18 60 81 00 00 	movabs $0x816018,%rax
  800cd3:	00 00 00 
  800cd6:	48 8b 00             	mov    (%rax),%rax
  800cd9:	8b 40 04             	mov    0x4(%rax),%eax
  800cdc:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  800cdf:	77 07                	ja     800ce8 <block_is_free+0x39>
  800ce1:	b8 00 00 00 00       	mov    $0x0,%eax
  800ce6:	eb 41                	jmp    800d29 <block_is_free+0x7a>
  800ce8:	48 b8 10 60 81 00 00 	movabs $0x816010,%rax
  800cef:	00 00 00 
  800cf2:	48 8b 00             	mov    (%rax),%rax
  800cf5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800cf8:	c1 ea 05             	shr    $0x5,%edx
  800cfb:	89 d2                	mov    %edx,%edx
  800cfd:	48 c1 e2 02          	shl    $0x2,%rdx
  800d01:	48 01 d0             	add    %rdx,%rax
  800d04:	8b 00                	mov    (%rax),%eax
  800d06:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800d09:	83 e2 1f             	and    $0x1f,%edx
  800d0c:	be 01 00 00 00       	mov    $0x1,%esi
  800d11:	89 d1                	mov    %edx,%ecx
  800d13:	d3 e6                	shl    %cl,%esi
  800d15:	89 f2                	mov    %esi,%edx
  800d17:	21 d0                	and    %edx,%eax
  800d19:	85 c0                	test   %eax,%eax
  800d1b:	74 07                	je     800d24 <block_is_free+0x75>
  800d1d:	b8 01 00 00 00       	mov    $0x1,%eax
  800d22:	eb 05                	jmp    800d29 <block_is_free+0x7a>
  800d24:	b8 00 00 00 00       	mov    $0x0,%eax
  800d29:	c9                   	leaveq 
  800d2a:	c3                   	retq   

0000000000800d2b <free_block>:
  800d2b:	55                   	push   %rbp
  800d2c:	48 89 e5             	mov    %rsp,%rbp
  800d2f:	48 83 ec 10          	sub    $0x10,%rsp
  800d33:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800d36:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800d3a:	75 2a                	jne    800d66 <free_block+0x3b>
  800d3c:	48 ba d6 76 80 00 00 	movabs $0x8076d6,%rdx
  800d43:	00 00 00 
  800d46:	be 30 00 00 00       	mov    $0x30,%esi
  800d4b:	48 bf 9e 76 80 00 00 	movabs $0x80769e,%rdi
  800d52:	00 00 00 
  800d55:	b8 00 00 00 00       	mov    $0x0,%eax
  800d5a:	48 b9 e0 34 80 00 00 	movabs $0x8034e0,%rcx
  800d61:	00 00 00 
  800d64:	ff d1                	callq  *%rcx
  800d66:	48 b8 10 60 81 00 00 	movabs $0x816010,%rax
  800d6d:	00 00 00 
  800d70:	48 8b 00             	mov    (%rax),%rax
  800d73:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800d76:	c1 ea 05             	shr    $0x5,%edx
  800d79:	89 d1                	mov    %edx,%ecx
  800d7b:	89 ca                	mov    %ecx,%edx
  800d7d:	48 c1 e2 02          	shl    $0x2,%rdx
  800d81:	48 01 c2             	add    %rax,%rdx
  800d84:	48 b8 10 60 81 00 00 	movabs $0x816010,%rax
  800d8b:	00 00 00 
  800d8e:	48 8b 00             	mov    (%rax),%rax
  800d91:	89 c9                	mov    %ecx,%ecx
  800d93:	48 c1 e1 02          	shl    $0x2,%rcx
  800d97:	48 01 c8             	add    %rcx,%rax
  800d9a:	8b 00                	mov    (%rax),%eax
  800d9c:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  800d9f:	83 e1 1f             	and    $0x1f,%ecx
  800da2:	be 01 00 00 00       	mov    $0x1,%esi
  800da7:	d3 e6                	shl    %cl,%esi
  800da9:	89 f1                	mov    %esi,%ecx
  800dab:	09 c8                	or     %ecx,%eax
  800dad:	89 02                	mov    %eax,(%rdx)
  800daf:	90                   	nop
  800db0:	c9                   	leaveq 
  800db1:	c3                   	retq   

0000000000800db2 <alloc_block>:
  800db2:	55                   	push   %rbp
  800db3:	48 89 e5             	mov    %rsp,%rbp
  800db6:	48 83 ec 10          	sub    $0x10,%rsp
  800dba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800dc1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800dc8:	e9 f5 00 00 00       	jmpq   800ec2 <alloc_block+0x110>
  800dcd:	48 b8 00 30 81 00 00 	movabs $0x813000,%rax
  800dd4:	00 00 00 
  800dd7:	8b 10                	mov    (%rax),%edx
  800dd9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ddc:	01 d0                	add    %edx,%eax
  800dde:	89 c2                	mov    %eax,%edx
  800de0:	48 b8 18 60 81 00 00 	movabs $0x816018,%rax
  800de7:	00 00 00 
  800dea:	48 8b 00             	mov    (%rax),%rax
  800ded:	8b 48 04             	mov    0x4(%rax),%ecx
  800df0:	89 d0                	mov    %edx,%eax
  800df2:	ba 00 00 00 00       	mov    $0x0,%edx
  800df7:	f7 f1                	div    %ecx
  800df9:	89 d0                	mov    %edx,%eax
  800dfb:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800dfe:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800e01:	89 c7                	mov    %eax,%edi
  800e03:	48 b8 af 0c 80 00 00 	movabs $0x800caf,%rax
  800e0a:	00 00 00 
  800e0d:	ff d0                	callq  *%rax
  800e0f:	84 c0                	test   %al,%al
  800e11:	0f 84 a7 00 00 00    	je     800ebe <alloc_block+0x10c>
  800e17:	48 b8 10 60 81 00 00 	movabs $0x816010,%rax
  800e1e:	00 00 00 
  800e21:	48 8b 08             	mov    (%rax),%rcx
  800e24:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800e27:	8d 50 1f             	lea    0x1f(%rax),%edx
  800e2a:	85 c0                	test   %eax,%eax
  800e2c:	0f 48 c2             	cmovs  %edx,%eax
  800e2f:	c1 f8 05             	sar    $0x5,%eax
  800e32:	89 c2                	mov    %eax,%edx
  800e34:	48 63 c2             	movslq %edx,%rax
  800e37:	48 c1 e0 02          	shl    $0x2,%rax
  800e3b:	48 8d 34 01          	lea    (%rcx,%rax,1),%rsi
  800e3f:	48 b8 10 60 81 00 00 	movabs $0x816010,%rax
  800e46:	00 00 00 
  800e49:	48 8b 00             	mov    (%rax),%rax
  800e4c:	48 63 d2             	movslq %edx,%rdx
  800e4f:	48 c1 e2 02          	shl    $0x2,%rdx
  800e53:	48 01 d0             	add    %rdx,%rax
  800e56:	8b 38                	mov    (%rax),%edi
  800e58:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800e5b:	99                   	cltd   
  800e5c:	c1 ea 1b             	shr    $0x1b,%edx
  800e5f:	01 d0                	add    %edx,%eax
  800e61:	83 e0 1f             	and    $0x1f,%eax
  800e64:	29 d0                	sub    %edx,%eax
  800e66:	ba 01 00 00 00       	mov    $0x1,%edx
  800e6b:	89 c1                	mov    %eax,%ecx
  800e6d:	d3 e2                	shl    %cl,%edx
  800e6f:	89 d0                	mov    %edx,%eax
  800e71:	f7 d0                	not    %eax
  800e73:	21 f8                	and    %edi,%eax
  800e75:	89 06                	mov    %eax,(%rsi)
  800e77:	48 b8 10 60 81 00 00 	movabs $0x816010,%rax
  800e7e:	00 00 00 
  800e81:	48 8b 10             	mov    (%rax),%rdx
  800e84:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800e87:	8d 48 1f             	lea    0x1f(%rax),%ecx
  800e8a:	85 c0                	test   %eax,%eax
  800e8c:	0f 48 c1             	cmovs  %ecx,%eax
  800e8f:	c1 f8 05             	sar    $0x5,%eax
  800e92:	48 98                	cltq   
  800e94:	48 c1 e0 02          	shl    $0x2,%rax
  800e98:	48 01 d0             	add    %rdx,%rax
  800e9b:	48 89 c7             	mov    %rax,%rdi
  800e9e:	48 b8 22 08 80 00 00 	movabs $0x800822,%rax
  800ea5:	00 00 00 
  800ea8:	ff d0                	callq  *%rax
  800eaa:	48 b8 00 30 81 00 00 	movabs $0x813000,%rax
  800eb1:	00 00 00 
  800eb4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  800eb7:	89 10                	mov    %edx,(%rax)
  800eb9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800ebc:	eb 24                	jmp    800ee2 <alloc_block+0x130>
  800ebe:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800ec2:	48 b8 18 60 81 00 00 	movabs $0x816018,%rax
  800ec9:	00 00 00 
  800ecc:	48 8b 00             	mov    (%rax),%rax
  800ecf:	8b 50 04             	mov    0x4(%rax),%edx
  800ed2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ed5:	39 c2                	cmp    %eax,%edx
  800ed7:	0f 87 f0 fe ff ff    	ja     800dcd <alloc_block+0x1b>
  800edd:	b8 f6 ff ff ff       	mov    $0xfffffff6,%eax
  800ee2:	c9                   	leaveq 
  800ee3:	c3                   	retq   

0000000000800ee4 <check_bitmap>:
  800ee4:	55                   	push   %rbp
  800ee5:	48 89 e5             	mov    %rsp,%rbp
  800ee8:	48 83 ec 10          	sub    $0x10,%rsp
  800eec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800ef3:	eb 51                	jmp    800f46 <check_bitmap+0x62>
  800ef5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ef8:	83 c0 02             	add    $0x2,%eax
  800efb:	89 c7                	mov    %eax,%edi
  800efd:	48 b8 af 0c 80 00 00 	movabs $0x800caf,%rax
  800f04:	00 00 00 
  800f07:	ff d0                	callq  *%rax
  800f09:	84 c0                	test   %al,%al
  800f0b:	74 35                	je     800f42 <check_bitmap+0x5e>
  800f0d:	48 b9 f1 76 80 00 00 	movabs $0x8076f1,%rcx
  800f14:	00 00 00 
  800f17:	48 ba 05 77 80 00 00 	movabs $0x807705,%rdx
  800f1e:	00 00 00 
  800f21:	be 62 00 00 00       	mov    $0x62,%esi
  800f26:	48 bf 9e 76 80 00 00 	movabs $0x80769e,%rdi
  800f2d:	00 00 00 
  800f30:	b8 00 00 00 00       	mov    $0x0,%eax
  800f35:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  800f3c:	00 00 00 
  800f3f:	41 ff d0             	callq  *%r8
  800f42:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800f46:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f49:	c1 e0 0f             	shl    $0xf,%eax
  800f4c:	89 c2                	mov    %eax,%edx
  800f4e:	48 b8 18 60 81 00 00 	movabs $0x816018,%rax
  800f55:	00 00 00 
  800f58:	48 8b 00             	mov    (%rax),%rax
  800f5b:	8b 40 04             	mov    0x4(%rax),%eax
  800f5e:	39 c2                	cmp    %eax,%edx
  800f60:	72 93                	jb     800ef5 <check_bitmap+0x11>
  800f62:	bf 00 00 00 00       	mov    $0x0,%edi
  800f67:	48 b8 af 0c 80 00 00 	movabs $0x800caf,%rax
  800f6e:	00 00 00 
  800f71:	ff d0                	callq  *%rax
  800f73:	84 c0                	test   %al,%al
  800f75:	74 35                	je     800fac <check_bitmap+0xc8>
  800f77:	48 b9 1a 77 80 00 00 	movabs $0x80771a,%rcx
  800f7e:	00 00 00 
  800f81:	48 ba 05 77 80 00 00 	movabs $0x807705,%rdx
  800f88:	00 00 00 
  800f8b:	be 65 00 00 00       	mov    $0x65,%esi
  800f90:	48 bf 9e 76 80 00 00 	movabs $0x80769e,%rdi
  800f97:	00 00 00 
  800f9a:	b8 00 00 00 00       	mov    $0x0,%eax
  800f9f:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  800fa6:	00 00 00 
  800fa9:	41 ff d0             	callq  *%r8
  800fac:	bf 01 00 00 00       	mov    $0x1,%edi
  800fb1:	48 b8 af 0c 80 00 00 	movabs $0x800caf,%rax
  800fb8:	00 00 00 
  800fbb:	ff d0                	callq  *%rax
  800fbd:	84 c0                	test   %al,%al
  800fbf:	74 35                	je     800ff6 <check_bitmap+0x112>
  800fc1:	48 b9 2c 77 80 00 00 	movabs $0x80772c,%rcx
  800fc8:	00 00 00 
  800fcb:	48 ba 05 77 80 00 00 	movabs $0x807705,%rdx
  800fd2:	00 00 00 
  800fd5:	be 66 00 00 00       	mov    $0x66,%esi
  800fda:	48 bf 9e 76 80 00 00 	movabs $0x80769e,%rdi
  800fe1:	00 00 00 
  800fe4:	b8 00 00 00 00       	mov    $0x0,%eax
  800fe9:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  800ff0:	00 00 00 
  800ff3:	41 ff d0             	callq  *%r8
  800ff6:	48 bf 3e 77 80 00 00 	movabs $0x80773e,%rdi
  800ffd:	00 00 00 
  801000:	b8 00 00 00 00       	mov    $0x0,%eax
  801005:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  80100c:	00 00 00 
  80100f:	ff d2                	callq  *%rdx
  801011:	90                   	nop
  801012:	c9                   	leaveq 
  801013:	c3                   	retq   

0000000000801014 <fs_init>:
  801014:	55                   	push   %rbp
  801015:	48 89 e5             	mov    %rsp,%rbp
  801018:	b8 00 00 00 00       	mov    $0x0,%eax
  80101d:	48 ba 06 33 80 00 00 	movabs $0x803306,%rdx
  801024:	00 00 00 
  801027:	ff d2                	callq  *%rdx
  801029:	48 b8 aa 0b 80 00 00 	movabs $0x800baa,%rax
  801030:	00 00 00 
  801033:	ff d0                	callq  *%rax
  801035:	bf 01 00 00 00       	mov    $0x1,%edi
  80103a:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  801041:	00 00 00 
  801044:	ff d0                	callq  *%rax
  801046:	48 89 c2             	mov    %rax,%rdx
  801049:	48 b8 18 60 81 00 00 	movabs $0x816018,%rax
  801050:	00 00 00 
  801053:	48 89 10             	mov    %rdx,(%rax)
  801056:	48 b8 0c 0c 80 00 00 	movabs $0x800c0c,%rax
  80105d:	00 00 00 
  801060:	ff d0                	callq  *%rax
  801062:	bf 02 00 00 00       	mov    $0x2,%edi
  801067:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  80106e:	00 00 00 
  801071:	ff d0                	callq  *%rax
  801073:	48 89 c2             	mov    %rax,%rdx
  801076:	48 b8 10 60 81 00 00 	movabs $0x816010,%rax
  80107d:	00 00 00 
  801080:	48 89 10             	mov    %rdx,(%rax)
  801083:	48 b8 e4 0e 80 00 00 	movabs $0x800ee4,%rax
  80108a:	00 00 00 
  80108d:	ff d0                	callq  *%rax
  80108f:	90                   	nop
  801090:	5d                   	pop    %rbp
  801091:	c3                   	retq   

0000000000801092 <file_block_walk>:
  801092:	55                   	push   %rbp
  801093:	48 89 e5             	mov    %rsp,%rbp
  801096:	48 83 ec 30          	sub    $0x30,%rsp
  80109a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80109e:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8010a1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8010a5:	89 c8                	mov    %ecx,%eax
  8010a7:	88 45 e0             	mov    %al,-0x20(%rbp)
  8010aa:	83 7d e4 09          	cmpl   $0x9,-0x1c(%rbp)
  8010ae:	77 23                	ja     8010d3 <file_block_walk+0x41>
  8010b0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8010b3:	48 83 c0 20          	add    $0x20,%rax
  8010b7:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  8010be:	00 
  8010bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010c3:	48 01 d0             	add    %rdx,%rax
  8010c6:	48 83 c0 08          	add    $0x8,%rax
  8010ca:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8010ce:	e9 c0 00 00 00       	jmpq   801193 <file_block_walk+0x101>
  8010d3:	81 7d e4 09 04 00 00 	cmpl   $0x409,-0x1c(%rbp)
  8010da:	0f 87 ac 00 00 00    	ja     80118c <file_block_walk+0xfa>
  8010e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010e4:	8b 80 b0 00 00 00    	mov    0xb0(%rax),%eax
  8010ea:	85 c0                	test   %eax,%eax
  8010ec:	75 6c                	jne    80115a <file_block_walk+0xc8>
  8010ee:	0f b6 45 e0          	movzbl -0x20(%rbp),%eax
  8010f2:	83 f0 01             	xor    $0x1,%eax
  8010f5:	84 c0                	test   %al,%al
  8010f7:	74 0a                	je     801103 <file_block_walk+0x71>
  8010f9:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  8010fe:	e9 a0 00 00 00       	jmpq   8011a3 <file_block_walk+0x111>
  801103:	48 b8 b2 0d 80 00 00 	movabs $0x800db2,%rax
  80110a:	00 00 00 
  80110d:	ff d0                	callq  *%rax
  80110f:	89 45 f4             	mov    %eax,-0xc(%rbp)
  801112:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  801116:	79 08                	jns    801120 <file_block_walk+0x8e>
  801118:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80111b:	e9 83 00 00 00       	jmpq   8011a3 <file_block_walk+0x111>
  801120:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801123:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801127:	89 90 b0 00 00 00    	mov    %edx,0xb0(%rax)
  80112d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801130:	48 98                	cltq   
  801132:	48 89 c7             	mov    %rax,%rdi
  801135:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  80113c:	00 00 00 
  80113f:	ff d0                	callq  *%rax
  801141:	ba 00 10 00 00       	mov    $0x1000,%edx
  801146:	be 00 00 00 00       	mov    $0x0,%esi
  80114b:	48 89 c7             	mov    %rax,%rdi
  80114e:	48 b8 44 45 80 00 00 	movabs $0x804544,%rax
  801155:	00 00 00 
  801158:	ff d0                	callq  *%rax
  80115a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80115e:	8b 80 b0 00 00 00    	mov    0xb0(%rax),%eax
  801164:	89 c0                	mov    %eax,%eax
  801166:	48 89 c7             	mov    %rax,%rdi
  801169:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  801170:	00 00 00 
  801173:	ff d0                	callq  *%rax
  801175:	48 89 c2             	mov    %rax,%rdx
  801178:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80117b:	48 c1 e0 02          	shl    $0x2,%rax
  80117f:	48 83 e8 28          	sub    $0x28,%rax
  801183:	48 01 d0             	add    %rdx,%rax
  801186:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80118a:	eb 07                	jmp    801193 <file_block_walk+0x101>
  80118c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801191:	eb 10                	jmp    8011a3 <file_block_walk+0x111>
  801193:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801197:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80119b:	48 89 10             	mov    %rdx,(%rax)
  80119e:	b8 00 00 00 00       	mov    $0x0,%eax
  8011a3:	c9                   	leaveq 
  8011a4:	c3                   	retq   

00000000008011a5 <file_get_block>:
  8011a5:	55                   	push   %rbp
  8011a6:	48 89 e5             	mov    %rsp,%rbp
  8011a9:	48 83 ec 30          	sub    $0x30,%rsp
  8011ad:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011b1:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8011b4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8011b8:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8011bc:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  8011bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011c3:	b9 01 00 00 00       	mov    $0x1,%ecx
  8011c8:	48 89 c7             	mov    %rax,%rdi
  8011cb:	48 b8 92 10 80 00 00 	movabs $0x801092,%rax
  8011d2:	00 00 00 
  8011d5:	ff d0                	callq  *%rax
  8011d7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8011da:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8011de:	79 05                	jns    8011e5 <file_get_block+0x40>
  8011e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011e3:	eb 53                	jmp    801238 <file_get_block+0x93>
  8011e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011e9:	8b 00                	mov    (%rax),%eax
  8011eb:	85 c0                	test   %eax,%eax
  8011ed:	75 23                	jne    801212 <file_get_block+0x6d>
  8011ef:	48 b8 b2 0d 80 00 00 	movabs $0x800db2,%rax
  8011f6:	00 00 00 
  8011f9:	ff d0                	callq  *%rax
  8011fb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8011fe:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801202:	79 05                	jns    801209 <file_get_block+0x64>
  801204:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801207:	eb 2f                	jmp    801238 <file_get_block+0x93>
  801209:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80120d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801210:	89 10                	mov    %edx,(%rax)
  801212:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801216:	8b 00                	mov    (%rax),%eax
  801218:	89 c0                	mov    %eax,%eax
  80121a:	48 89 c7             	mov    %rax,%rdi
  80121d:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  801224:	00 00 00 
  801227:	ff d0                	callq  *%rax
  801229:	48 89 c2             	mov    %rax,%rdx
  80122c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801230:	48 89 10             	mov    %rdx,(%rax)
  801233:	b8 00 00 00 00       	mov    $0x0,%eax
  801238:	c9                   	leaveq 
  801239:	c3                   	retq   

000000000080123a <dir_lookup>:
  80123a:	55                   	push   %rbp
  80123b:	48 89 e5             	mov    %rsp,%rbp
  80123e:	48 83 ec 40          	sub    $0x40,%rsp
  801242:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801246:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80124a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80124e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801252:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  801258:	25 ff 0f 00 00       	and    $0xfff,%eax
  80125d:	85 c0                	test   %eax,%eax
  80125f:	74 35                	je     801296 <dir_lookup+0x5c>
  801261:	48 b9 4e 77 80 00 00 	movabs $0x80774e,%rcx
  801268:	00 00 00 
  80126b:	48 ba 05 77 80 00 00 	movabs $0x807705,%rdx
  801272:	00 00 00 
  801275:	be 32 01 00 00       	mov    $0x132,%esi
  80127a:	48 bf 9e 76 80 00 00 	movabs $0x80769e,%rdi
  801281:	00 00 00 
  801284:	b8 00 00 00 00       	mov    $0x0,%eax
  801289:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  801290:	00 00 00 
  801293:	41 ff d0             	callq  *%r8
  801296:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80129a:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  8012a0:	8d 90 ff 0f 00 00    	lea    0xfff(%rax),%edx
  8012a6:	85 c0                	test   %eax,%eax
  8012a8:	0f 48 c2             	cmovs  %edx,%eax
  8012ab:	c1 f8 0c             	sar    $0xc,%eax
  8012ae:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8012b1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8012b8:	e9 96 00 00 00       	jmpq   801353 <dir_lookup+0x119>
  8012bd:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
  8012c1:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  8012c4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012c8:	89 ce                	mov    %ecx,%esi
  8012ca:	48 89 c7             	mov    %rax,%rdi
  8012cd:	48 b8 a5 11 80 00 00 	movabs $0x8011a5,%rax
  8012d4:	00 00 00 
  8012d7:	ff d0                	callq  *%rax
  8012d9:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8012dc:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8012e0:	79 05                	jns    8012e7 <dir_lookup+0xad>
  8012e2:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8012e5:	eb 7d                	jmp    801364 <dir_lookup+0x12a>
  8012e7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8012eb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8012ef:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  8012f6:	eb 51                	jmp    801349 <dir_lookup+0x10f>
  8012f8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8012fb:	48 c1 e0 08          	shl    $0x8,%rax
  8012ff:	48 89 c2             	mov    %rax,%rdx
  801302:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801306:	48 01 d0             	add    %rdx,%rax
  801309:	48 89 c2             	mov    %rax,%rdx
  80130c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801310:	48 89 c6             	mov    %rax,%rsi
  801313:	48 89 d7             	mov    %rdx,%rdi
  801316:	48 b8 0c 44 80 00 00 	movabs $0x80440c,%rax
  80131d:	00 00 00 
  801320:	ff d0                	callq  *%rax
  801322:	85 c0                	test   %eax,%eax
  801324:	75 1f                	jne    801345 <dir_lookup+0x10b>
  801326:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801329:	48 c1 e0 08          	shl    $0x8,%rax
  80132d:	48 89 c2             	mov    %rax,%rdx
  801330:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801334:	48 01 c2             	add    %rax,%rdx
  801337:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80133b:	48 89 10             	mov    %rdx,(%rax)
  80133e:	b8 00 00 00 00       	mov    $0x0,%eax
  801343:	eb 1f                	jmp    801364 <dir_lookup+0x12a>
  801345:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
  801349:	83 7d f8 0f          	cmpl   $0xf,-0x8(%rbp)
  80134d:	76 a9                	jbe    8012f8 <dir_lookup+0xbe>
  80134f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801353:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801356:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  801359:	0f 82 5e ff ff ff    	jb     8012bd <dir_lookup+0x83>
  80135f:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  801364:	c9                   	leaveq 
  801365:	c3                   	retq   

0000000000801366 <dir_alloc_file>:
  801366:	55                   	push   %rbp
  801367:	48 89 e5             	mov    %rsp,%rbp
  80136a:	48 83 ec 30          	sub    $0x30,%rsp
  80136e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801372:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801376:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80137a:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  801380:	25 ff 0f 00 00       	and    $0xfff,%eax
  801385:	85 c0                	test   %eax,%eax
  801387:	74 35                	je     8013be <dir_alloc_file+0x58>
  801389:	48 b9 4e 77 80 00 00 	movabs $0x80774e,%rcx
  801390:	00 00 00 
  801393:	48 ba 05 77 80 00 00 	movabs $0x807705,%rdx
  80139a:	00 00 00 
  80139d:	be 4b 01 00 00       	mov    $0x14b,%esi
  8013a2:	48 bf 9e 76 80 00 00 	movabs $0x80769e,%rdi
  8013a9:	00 00 00 
  8013ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8013b1:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  8013b8:	00 00 00 
  8013bb:	41 ff d0             	callq  *%r8
  8013be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013c2:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  8013c8:	8d 90 ff 0f 00 00    	lea    0xfff(%rax),%edx
  8013ce:	85 c0                	test   %eax,%eax
  8013d0:	0f 48 c2             	cmovs  %edx,%eax
  8013d3:	c1 f8 0c             	sar    $0xc,%eax
  8013d6:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8013d9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8013e0:	e9 83 00 00 00       	jmpq   801468 <dir_alloc_file+0x102>
  8013e5:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
  8013e9:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  8013ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013f0:	89 ce                	mov    %ecx,%esi
  8013f2:	48 89 c7             	mov    %rax,%rdi
  8013f5:	48 b8 a5 11 80 00 00 	movabs $0x8011a5,%rax
  8013fc:	00 00 00 
  8013ff:	ff d0                	callq  *%rax
  801401:	89 45 f0             	mov    %eax,-0x10(%rbp)
  801404:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  801408:	79 08                	jns    801412 <dir_alloc_file+0xac>
  80140a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80140d:	e9 be 00 00 00       	jmpq   8014d0 <dir_alloc_file+0x16a>
  801412:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801416:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80141a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  801421:	eb 3b                	jmp    80145e <dir_alloc_file+0xf8>
  801423:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801426:	48 c1 e0 08          	shl    $0x8,%rax
  80142a:	48 89 c2             	mov    %rax,%rdx
  80142d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801431:	48 01 d0             	add    %rdx,%rax
  801434:	0f b6 00             	movzbl (%rax),%eax
  801437:	84 c0                	test   %al,%al
  801439:	75 1f                	jne    80145a <dir_alloc_file+0xf4>
  80143b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80143e:	48 c1 e0 08          	shl    $0x8,%rax
  801442:	48 89 c2             	mov    %rax,%rdx
  801445:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801449:	48 01 c2             	add    %rax,%rdx
  80144c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801450:	48 89 10             	mov    %rdx,(%rax)
  801453:	b8 00 00 00 00       	mov    $0x0,%eax
  801458:	eb 76                	jmp    8014d0 <dir_alloc_file+0x16a>
  80145a:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
  80145e:	83 7d f8 0f          	cmpl   $0xf,-0x8(%rbp)
  801462:	76 bf                	jbe    801423 <dir_alloc_file+0xbd>
  801464:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801468:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80146b:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  80146e:	0f 82 71 ff ff ff    	jb     8013e5 <dir_alloc_file+0x7f>
  801474:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801478:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  80147e:	8d 90 00 10 00 00    	lea    0x1000(%rax),%edx
  801484:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801488:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80148e:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
  801492:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  801495:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801499:	89 ce                	mov    %ecx,%esi
  80149b:	48 89 c7             	mov    %rax,%rdi
  80149e:	48 b8 a5 11 80 00 00 	movabs $0x8011a5,%rax
  8014a5:	00 00 00 
  8014a8:	ff d0                	callq  *%rax
  8014aa:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8014ad:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8014b1:	79 05                	jns    8014b8 <dir_alloc_file+0x152>
  8014b3:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8014b6:	eb 18                	jmp    8014d0 <dir_alloc_file+0x16a>
  8014b8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014bc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8014c0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8014c4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8014c8:	48 89 10             	mov    %rdx,(%rax)
  8014cb:	b8 00 00 00 00       	mov    $0x0,%eax
  8014d0:	c9                   	leaveq 
  8014d1:	c3                   	retq   

00000000008014d2 <skip_slash>:
  8014d2:	55                   	push   %rbp
  8014d3:	48 89 e5             	mov    %rsp,%rbp
  8014d6:	48 83 ec 08          	sub    $0x8,%rsp
  8014da:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014de:	eb 05                	jmp    8014e5 <skip_slash+0x13>
  8014e0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8014e5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014e9:	0f b6 00             	movzbl (%rax),%eax
  8014ec:	3c 2f                	cmp    $0x2f,%al
  8014ee:	74 f0                	je     8014e0 <skip_slash+0xe>
  8014f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014f4:	c9                   	leaveq 
  8014f5:	c3                   	retq   

00000000008014f6 <walk_path>:
  8014f6:	55                   	push   %rbp
  8014f7:	48 89 e5             	mov    %rsp,%rbp
  8014fa:	48 81 ec d0 00 00 00 	sub    $0xd0,%rsp
  801501:	48 89 bd 48 ff ff ff 	mov    %rdi,-0xb8(%rbp)
  801508:	48 89 b5 40 ff ff ff 	mov    %rsi,-0xc0(%rbp)
  80150f:	48 89 95 38 ff ff ff 	mov    %rdx,-0xc8(%rbp)
  801516:	48 89 8d 30 ff ff ff 	mov    %rcx,-0xd0(%rbp)
  80151d:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
  801524:	48 89 c7             	mov    %rax,%rdi
  801527:	48 b8 d2 14 80 00 00 	movabs $0x8014d2,%rax
  80152e:	00 00 00 
  801531:	ff d0                	callq  *%rax
  801533:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  80153a:	48 b8 18 60 81 00 00 	movabs $0x816018,%rax
  801541:	00 00 00 
  801544:	48 8b 00             	mov    (%rax),%rax
  801547:	48 83 c0 08          	add    $0x8,%rax
  80154b:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
  801552:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801559:	00 
  80155a:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%rbp)
  801561:	48 83 bd 40 ff ff ff 	cmpq   $0x0,-0xc0(%rbp)
  801568:	00 
  801569:	74 0e                	je     801579 <walk_path+0x83>
  80156b:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
  801572:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801579:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
  801580:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801587:	e9 73 01 00 00       	jmpq   8016ff <walk_path+0x209>
  80158c:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  801593:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801597:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
  80159e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8015a2:	eb 08                	jmp    8015ac <walk_path+0xb6>
  8015a4:	48 83 85 48 ff ff ff 	addq   $0x1,-0xb8(%rbp)
  8015ab:	01 
  8015ac:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
  8015b3:	0f b6 00             	movzbl (%rax),%eax
  8015b6:	3c 2f                	cmp    $0x2f,%al
  8015b8:	74 0e                	je     8015c8 <walk_path+0xd2>
  8015ba:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
  8015c1:	0f b6 00             	movzbl (%rax),%eax
  8015c4:	84 c0                	test   %al,%al
  8015c6:	75 dc                	jne    8015a4 <walk_path+0xae>
  8015c8:	48 8b 95 48 ff ff ff 	mov    -0xb8(%rbp),%rdx
  8015cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015d3:	48 29 c2             	sub    %rax,%rdx
  8015d6:	48 89 d0             	mov    %rdx,%rax
  8015d9:	48 83 f8 7f          	cmp    $0x7f,%rax
  8015dd:	7e 0a                	jle    8015e9 <walk_path+0xf3>
  8015df:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8015e4:	e9 56 01 00 00       	jmpq   80173f <walk_path+0x249>
  8015e9:	48 8b 95 48 ff ff ff 	mov    -0xb8(%rbp),%rdx
  8015f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015f4:	48 29 c2             	sub    %rax,%rdx
  8015f7:	48 89 d0             	mov    %rdx,%rax
  8015fa:	48 89 c2             	mov    %rax,%rdx
  8015fd:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801601:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
  801608:	48 89 ce             	mov    %rcx,%rsi
  80160b:	48 89 c7             	mov    %rax,%rdi
  80160e:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  801615:	00 00 00 
  801618:	ff d0                	callq  *%rax
  80161a:	48 8b 95 48 ff ff ff 	mov    -0xb8(%rbp),%rdx
  801621:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801625:	48 29 c2             	sub    %rax,%rdx
  801628:	48 89 d0             	mov    %rdx,%rax
  80162b:	c6 84 05 60 ff ff ff 	movb   $0x0,-0xa0(%rbp,%rax,1)
  801632:	00 
  801633:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
  80163a:	48 89 c7             	mov    %rax,%rdi
  80163d:	48 b8 d2 14 80 00 00 	movabs $0x8014d2,%rax
  801644:	00 00 00 
  801647:	ff d0                	callq  *%rax
  801649:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  801650:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801654:	8b 80 84 00 00 00    	mov    0x84(%rax),%eax
  80165a:	83 f8 01             	cmp    $0x1,%eax
  80165d:	74 0a                	je     801669 <walk_path+0x173>
  80165f:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  801664:	e9 d6 00 00 00       	jmpq   80173f <walk_path+0x249>
  801669:	48 8d 95 58 ff ff ff 	lea    -0xa8(%rbp),%rdx
  801670:	48 8d 8d 60 ff ff ff 	lea    -0xa0(%rbp),%rcx
  801677:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80167b:	48 89 ce             	mov    %rcx,%rsi
  80167e:	48 89 c7             	mov    %rax,%rdi
  801681:	48 b8 3a 12 80 00 00 	movabs $0x80123a,%rax
  801688:	00 00 00 
  80168b:	ff d0                	callq  *%rax
  80168d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801690:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801694:	79 69                	jns    8016ff <walk_path+0x209>
  801696:	83 7d ec f4          	cmpl   $0xfffffff4,-0x14(%rbp)
  80169a:	75 5e                	jne    8016fa <walk_path+0x204>
  80169c:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
  8016a3:	0f b6 00             	movzbl (%rax),%eax
  8016a6:	84 c0                	test   %al,%al
  8016a8:	75 50                	jne    8016fa <walk_path+0x204>
  8016aa:	48 83 bd 40 ff ff ff 	cmpq   $0x0,-0xc0(%rbp)
  8016b1:	00 
  8016b2:	74 0e                	je     8016c2 <walk_path+0x1cc>
  8016b4:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
  8016bb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8016bf:	48 89 10             	mov    %rdx,(%rax)
  8016c2:	48 83 bd 30 ff ff ff 	cmpq   $0x0,-0xd0(%rbp)
  8016c9:	00 
  8016ca:	74 20                	je     8016ec <walk_path+0x1f6>
  8016cc:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  8016d3:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
  8016da:	48 89 d6             	mov    %rdx,%rsi
  8016dd:	48 89 c7             	mov    %rax,%rdi
  8016e0:	48 b8 aa 42 80 00 00 	movabs $0x8042aa,%rax
  8016e7:	00 00 00 
  8016ea:	ff d0                	callq  *%rax
  8016ec:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
  8016f3:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8016fa:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8016fd:	eb 40                	jmp    80173f <walk_path+0x249>
  8016ff:	48 8b 85 48 ff ff ff 	mov    -0xb8(%rbp),%rax
  801706:	0f b6 00             	movzbl (%rax),%eax
  801709:	84 c0                	test   %al,%al
  80170b:	0f 85 7b fe ff ff    	jne    80158c <walk_path+0x96>
  801711:	48 83 bd 40 ff ff ff 	cmpq   $0x0,-0xc0(%rbp)
  801718:	00 
  801719:	74 0e                	je     801729 <walk_path+0x233>
  80171b:	48 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%rax
  801722:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801726:	48 89 10             	mov    %rdx,(%rax)
  801729:	48 8b 95 58 ff ff ff 	mov    -0xa8(%rbp),%rdx
  801730:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
  801737:	48 89 10             	mov    %rdx,(%rax)
  80173a:	b8 00 00 00 00       	mov    $0x0,%eax
  80173f:	c9                   	leaveq 
  801740:	c3                   	retq   

0000000000801741 <file_create>:
  801741:	55                   	push   %rbp
  801742:	48 89 e5             	mov    %rsp,%rbp
  801745:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80174c:	48 89 bd 58 ff ff ff 	mov    %rdi,-0xa8(%rbp)
  801753:	48 89 b5 50 ff ff ff 	mov    %rsi,-0xb0(%rbp)
  80175a:	48 8d 8d 70 ff ff ff 	lea    -0x90(%rbp),%rcx
  801761:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  801768:	48 8d b5 68 ff ff ff 	lea    -0x98(%rbp),%rsi
  80176f:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  801776:	48 89 c7             	mov    %rax,%rdi
  801779:	48 b8 f6 14 80 00 00 	movabs $0x8014f6,%rax
  801780:	00 00 00 
  801783:	ff d0                	callq  *%rax
  801785:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801788:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80178c:	75 0a                	jne    801798 <file_create+0x57>
  80178e:	b8 f2 ff ff ff       	mov    $0xfffffff2,%eax
  801793:	e9 94 00 00 00       	jmpq   80182c <file_create+0xeb>
  801798:	83 7d fc f4          	cmpl   $0xfffffff4,-0x4(%rbp)
  80179c:	75 0c                	jne    8017aa <file_create+0x69>
  80179e:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  8017a5:	48 85 c0             	test   %rax,%rax
  8017a8:	75 05                	jne    8017af <file_create+0x6e>
  8017aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8017ad:	eb 7d                	jmp    80182c <file_create+0xeb>
  8017af:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  8017b6:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  8017bd:	48 89 d6             	mov    %rdx,%rsi
  8017c0:	48 89 c7             	mov    %rax,%rdi
  8017c3:	48 b8 66 13 80 00 00 	movabs $0x801366,%rax
  8017ca:	00 00 00 
  8017cd:	ff d0                	callq  *%rax
  8017cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8017d2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8017d6:	79 05                	jns    8017dd <file_create+0x9c>
  8017d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8017db:	eb 4f                	jmp    80182c <file_create+0xeb>
  8017dd:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8017e4:	48 89 c2             	mov    %rax,%rdx
  8017e7:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8017ee:	48 89 c6             	mov    %rax,%rsi
  8017f1:	48 89 d7             	mov    %rdx,%rdi
  8017f4:	48 b8 aa 42 80 00 00 	movabs $0x8042aa,%rax
  8017fb:	00 00 00 
  8017fe:	ff d0                	callq  *%rax
  801800:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  801807:	48 8b 85 50 ff ff ff 	mov    -0xb0(%rbp),%rax
  80180e:	48 89 10             	mov    %rdx,(%rax)
  801811:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
  801818:	48 89 c7             	mov    %rax,%rdi
  80181b:	48 b8 bb 1c 80 00 00 	movabs $0x801cbb,%rax
  801822:	00 00 00 
  801825:	ff d0                	callq  *%rax
  801827:	b8 00 00 00 00       	mov    $0x0,%eax
  80182c:	c9                   	leaveq 
  80182d:	c3                   	retq   

000000000080182e <file_open>:
  80182e:	55                   	push   %rbp
  80182f:	48 89 e5             	mov    %rsp,%rbp
  801832:	48 83 ec 10          	sub    $0x10,%rsp
  801836:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80183a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80183e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801842:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801846:	b9 00 00 00 00       	mov    $0x0,%ecx
  80184b:	be 00 00 00 00       	mov    $0x0,%esi
  801850:	48 89 c7             	mov    %rax,%rdi
  801853:	48 b8 f6 14 80 00 00 	movabs $0x8014f6,%rax
  80185a:	00 00 00 
  80185d:	ff d0                	callq  *%rax
  80185f:	c9                   	leaveq 
  801860:	c3                   	retq   

0000000000801861 <file_read>:
  801861:	55                   	push   %rbp
  801862:	48 89 e5             	mov    %rsp,%rbp
  801865:	48 83 ec 60          	sub    $0x60,%rsp
  801869:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
  80186d:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
  801871:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
  801875:	89 4d a4             	mov    %ecx,-0x5c(%rbp)
  801878:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  80187c:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  801882:	3b 45 a4             	cmp    -0x5c(%rbp),%eax
  801885:	7f 0a                	jg     801891 <file_read+0x30>
  801887:	b8 00 00 00 00       	mov    $0x0,%eax
  80188c:	e9 24 01 00 00       	jmpq   8019b5 <file_read+0x154>
  801891:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801895:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801899:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  80189d:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  8018a3:	2b 45 a4             	sub    -0x5c(%rbp),%eax
  8018a6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8018a9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8018ac:	48 63 d0             	movslq %eax,%rdx
  8018af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018b3:	48 39 c2             	cmp    %rax,%rdx
  8018b6:	48 0f 46 c2          	cmovbe %rdx,%rax
  8018ba:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  8018be:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  8018c1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8018c4:	e9 cd 00 00 00       	jmpq   801996 <file_read+0x135>
  8018c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018cc:	8d 90 ff 0f 00 00    	lea    0xfff(%rax),%edx
  8018d2:	85 c0                	test   %eax,%eax
  8018d4:	0f 48 c2             	cmovs  %edx,%eax
  8018d7:	c1 f8 0c             	sar    $0xc,%eax
  8018da:	89 c1                	mov    %eax,%ecx
  8018dc:	48 8d 55 c8          	lea    -0x38(%rbp),%rdx
  8018e0:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  8018e4:	89 ce                	mov    %ecx,%esi
  8018e6:	48 89 c7             	mov    %rax,%rdi
  8018e9:	48 b8 a5 11 80 00 00 	movabs $0x8011a5,%rax
  8018f0:	00 00 00 
  8018f3:	ff d0                	callq  *%rax
  8018f5:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8018f8:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8018fc:	79 08                	jns    801906 <file_read+0xa5>
  8018fe:	8b 45 e8             	mov    -0x18(%rbp),%eax
  801901:	e9 af 00 00 00       	jmpq   8019b5 <file_read+0x154>
  801906:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801909:	99                   	cltd   
  80190a:	c1 ea 14             	shr    $0x14,%edx
  80190d:	01 d0                	add    %edx,%eax
  80190f:	25 ff 0f 00 00       	and    $0xfff,%eax
  801914:	29 d0                	sub    %edx,%eax
  801916:	ba 00 10 00 00       	mov    $0x1000,%edx
  80191b:	29 c2                	sub    %eax,%edx
  80191d:	89 d0                	mov    %edx,%eax
  80191f:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  801922:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  801925:	48 63 d0             	movslq %eax,%rdx
  801928:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80192c:	48 01 c2             	add    %rax,%rdx
  80192f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801932:	48 98                	cltq   
  801934:	48 29 c2             	sub    %rax,%rdx
  801937:	48 89 d0             	mov    %rdx,%rax
  80193a:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  80193e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801941:	48 63 d0             	movslq %eax,%rdx
  801944:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801948:	48 39 c2             	cmp    %rax,%rdx
  80194b:	48 0f 46 c2          	cmovbe %rdx,%rax
  80194f:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  801952:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  801955:	48 63 c8             	movslq %eax,%rcx
  801958:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
  80195c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80195f:	99                   	cltd   
  801960:	c1 ea 14             	shr    $0x14,%edx
  801963:	01 d0                	add    %edx,%eax
  801965:	25 ff 0f 00 00       	and    $0xfff,%eax
  80196a:	29 d0                	sub    %edx,%eax
  80196c:	48 98                	cltq   
  80196e:	48 01 c6             	add    %rax,%rsi
  801971:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
  801975:	48 89 ca             	mov    %rcx,%rdx
  801978:	48 89 c7             	mov    %rax,%rdi
  80197b:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  801982:	00 00 00 
  801985:	ff d0                	callq  *%rax
  801987:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80198a:	01 45 fc             	add    %eax,-0x4(%rbp)
  80198d:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  801990:	48 98                	cltq   
  801992:	48 01 45 b0          	add    %rax,-0x50(%rbp)
  801996:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801999:	48 98                	cltq   
  80199b:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  80199e:	48 63 ca             	movslq %edx,%rcx
  8019a1:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
  8019a5:	48 01 ca             	add    %rcx,%rdx
  8019a8:	48 39 d0             	cmp    %rdx,%rax
  8019ab:	0f 82 18 ff ff ff    	jb     8018c9 <file_read+0x68>
  8019b1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8019b5:	c9                   	leaveq 
  8019b6:	c3                   	retq   

00000000008019b7 <file_write>:
  8019b7:	55                   	push   %rbp
  8019b8:	48 89 e5             	mov    %rsp,%rbp
  8019bb:	48 83 ec 50          	sub    $0x50,%rsp
  8019bf:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8019c3:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  8019c7:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  8019cb:	89 4d b4             	mov    %ecx,-0x4c(%rbp)
  8019ce:	8b 45 b4             	mov    -0x4c(%rbp),%eax
  8019d1:	48 63 d0             	movslq %eax,%rdx
  8019d4:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  8019d8:	48 01 c2             	add    %rax,%rdx
  8019db:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8019df:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  8019e5:	48 98                	cltq   
  8019e7:	48 39 c2             	cmp    %rax,%rdx
  8019ea:	76 33                	jbe    801a1f <file_write+0x68>
  8019ec:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  8019f0:	89 c2                	mov    %eax,%edx
  8019f2:	8b 45 b4             	mov    -0x4c(%rbp),%eax
  8019f5:	01 d0                	add    %edx,%eax
  8019f7:	89 c2                	mov    %eax,%edx
  8019f9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8019fd:	89 d6                	mov    %edx,%esi
  8019ff:	48 89 c7             	mov    %rax,%rdi
  801a02:	48 b8 5e 1c 80 00 00 	movabs $0x801c5e,%rax
  801a09:	00 00 00 
  801a0c:	ff d0                	callq  *%rax
  801a0e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801a11:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801a15:	79 08                	jns    801a1f <file_write+0x68>
  801a17:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a1a:	e9 f8 00 00 00       	jmpq   801b17 <file_write+0x160>
  801a1f:	8b 45 b4             	mov    -0x4c(%rbp),%eax
  801a22:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801a25:	e9 ce 00 00 00       	jmpq   801af8 <file_write+0x141>
  801a2a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a2d:	8d 90 ff 0f 00 00    	lea    0xfff(%rax),%edx
  801a33:	85 c0                	test   %eax,%eax
  801a35:	0f 48 c2             	cmovs  %edx,%eax
  801a38:	c1 f8 0c             	sar    $0xc,%eax
  801a3b:	89 c1                	mov    %eax,%ecx
  801a3d:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  801a41:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801a45:	89 ce                	mov    %ecx,%esi
  801a47:	48 89 c7             	mov    %rax,%rdi
  801a4a:	48 b8 a5 11 80 00 00 	movabs $0x8011a5,%rax
  801a51:	00 00 00 
  801a54:	ff d0                	callq  *%rax
  801a56:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801a59:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801a5d:	79 08                	jns    801a67 <file_write+0xb0>
  801a5f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a62:	e9 b0 00 00 00       	jmpq   801b17 <file_write+0x160>
  801a67:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a6a:	99                   	cltd   
  801a6b:	c1 ea 14             	shr    $0x14,%edx
  801a6e:	01 d0                	add    %edx,%eax
  801a70:	25 ff 0f 00 00       	and    $0xfff,%eax
  801a75:	29 d0                	sub    %edx,%eax
  801a77:	ba 00 10 00 00       	mov    $0x1000,%edx
  801a7c:	29 c2                	sub    %eax,%edx
  801a7e:	89 d0                	mov    %edx,%eax
  801a80:	89 45 f4             	mov    %eax,-0xc(%rbp)
  801a83:	8b 45 b4             	mov    -0x4c(%rbp),%eax
  801a86:	48 63 d0             	movslq %eax,%rdx
  801a89:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  801a8d:	48 01 c2             	add    %rax,%rdx
  801a90:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a93:	48 98                	cltq   
  801a95:	48 29 c2             	sub    %rax,%rdx
  801a98:	48 89 d0             	mov    %rdx,%rax
  801a9b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801a9f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801aa2:	48 63 d0             	movslq %eax,%rdx
  801aa5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801aa9:	48 39 c2             	cmp    %rax,%rdx
  801aac:	48 0f 46 c2          	cmovbe %rdx,%rax
  801ab0:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  801ab3:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801ab6:	48 63 c8             	movslq %eax,%rcx
  801ab9:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
  801abd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ac0:	99                   	cltd   
  801ac1:	c1 ea 14             	shr    $0x14,%edx
  801ac4:	01 d0                	add    %edx,%eax
  801ac6:	25 ff 0f 00 00       	and    $0xfff,%eax
  801acb:	29 d0                	sub    %edx,%eax
  801acd:	48 98                	cltq   
  801acf:	48 8d 3c 06          	lea    (%rsi,%rax,1),%rdi
  801ad3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801ad7:	48 89 ca             	mov    %rcx,%rdx
  801ada:	48 89 c6             	mov    %rax,%rsi
  801add:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  801ae4:	00 00 00 
  801ae7:	ff d0                	callq  *%rax
  801ae9:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801aec:	01 45 fc             	add    %eax,-0x4(%rbp)
  801aef:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801af2:	48 98                	cltq   
  801af4:	48 01 45 c0          	add    %rax,-0x40(%rbp)
  801af8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801afb:	48 98                	cltq   
  801afd:	8b 55 b4             	mov    -0x4c(%rbp),%edx
  801b00:	48 63 ca             	movslq %edx,%rcx
  801b03:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801b07:	48 01 ca             	add    %rcx,%rdx
  801b0a:	48 39 d0             	cmp    %rdx,%rax
  801b0d:	0f 82 17 ff ff ff    	jb     801a2a <file_write+0x73>
  801b13:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  801b17:	c9                   	leaveq 
  801b18:	c3                   	retq   

0000000000801b19 <file_free_block>:
  801b19:	55                   	push   %rbp
  801b1a:	48 89 e5             	mov    %rsp,%rbp
  801b1d:	48 83 ec 20          	sub    $0x20,%rsp
  801b21:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801b25:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801b28:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801b2c:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  801b2f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b33:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b38:	48 89 c7             	mov    %rax,%rdi
  801b3b:	48 b8 92 10 80 00 00 	movabs $0x801092,%rax
  801b42:	00 00 00 
  801b45:	ff d0                	callq  *%rax
  801b47:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801b4a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801b4e:	79 05                	jns    801b55 <file_free_block+0x3c>
  801b50:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b53:	eb 2d                	jmp    801b82 <file_free_block+0x69>
  801b55:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801b59:	8b 00                	mov    (%rax),%eax
  801b5b:	85 c0                	test   %eax,%eax
  801b5d:	74 1e                	je     801b7d <file_free_block+0x64>
  801b5f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801b63:	8b 00                	mov    (%rax),%eax
  801b65:	89 c7                	mov    %eax,%edi
  801b67:	48 b8 2b 0d 80 00 00 	movabs $0x800d2b,%rax
  801b6e:	00 00 00 
  801b71:	ff d0                	callq  *%rax
  801b73:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801b77:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  801b7d:	b8 00 00 00 00       	mov    $0x0,%eax
  801b82:	c9                   	leaveq 
  801b83:	c3                   	retq   

0000000000801b84 <file_truncate_blocks>:
  801b84:	55                   	push   %rbp
  801b85:	48 89 e5             	mov    %rsp,%rbp
  801b88:	48 83 ec 20          	sub    $0x20,%rsp
  801b8c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801b90:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801b93:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b97:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  801b9d:	05 ff 0f 00 00       	add    $0xfff,%eax
  801ba2:	8d 90 ff 0f 00 00    	lea    0xfff(%rax),%edx
  801ba8:	85 c0                	test   %eax,%eax
  801baa:	0f 48 c2             	cmovs  %edx,%eax
  801bad:	c1 f8 0c             	sar    $0xc,%eax
  801bb0:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801bb3:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801bb6:	05 ff 0f 00 00       	add    $0xfff,%eax
  801bbb:	8d 90 ff 0f 00 00    	lea    0xfff(%rax),%edx
  801bc1:	85 c0                	test   %eax,%eax
  801bc3:	0f 48 c2             	cmovs  %edx,%eax
  801bc6:	c1 f8 0c             	sar    $0xc,%eax
  801bc9:	89 45 f4             	mov    %eax,-0xc(%rbp)
  801bcc:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801bcf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801bd2:	eb 45                	jmp    801c19 <file_truncate_blocks+0x95>
  801bd4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801bd7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bdb:	89 d6                	mov    %edx,%esi
  801bdd:	48 89 c7             	mov    %rax,%rdi
  801be0:	48 b8 19 1b 80 00 00 	movabs $0x801b19,%rax
  801be7:	00 00 00 
  801bea:	ff d0                	callq  *%rax
  801bec:	89 45 f0             	mov    %eax,-0x10(%rbp)
  801bef:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  801bf3:	79 20                	jns    801c15 <file_truncate_blocks+0x91>
  801bf5:	8b 45 f0             	mov    -0x10(%rbp),%eax
  801bf8:	89 c6                	mov    %eax,%esi
  801bfa:	48 bf 6b 77 80 00 00 	movabs $0x80776b,%rdi
  801c01:	00 00 00 
  801c04:	b8 00 00 00 00       	mov    $0x0,%eax
  801c09:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  801c10:	00 00 00 
  801c13:	ff d2                	callq  *%rdx
  801c15:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801c19:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c1c:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  801c1f:	72 b3                	jb     801bd4 <file_truncate_blocks+0x50>
  801c21:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  801c25:	77 34                	ja     801c5b <file_truncate_blocks+0xd7>
  801c27:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c2b:	8b 80 b0 00 00 00    	mov    0xb0(%rax),%eax
  801c31:	85 c0                	test   %eax,%eax
  801c33:	74 26                	je     801c5b <file_truncate_blocks+0xd7>
  801c35:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c39:	8b 80 b0 00 00 00    	mov    0xb0(%rax),%eax
  801c3f:	89 c7                	mov    %eax,%edi
  801c41:	48 b8 2b 0d 80 00 00 	movabs $0x800d2b,%rax
  801c48:	00 00 00 
  801c4b:	ff d0                	callq  *%rax
  801c4d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c51:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%rax)
  801c58:	00 00 00 
  801c5b:	90                   	nop
  801c5c:	c9                   	leaveq 
  801c5d:	c3                   	retq   

0000000000801c5e <file_set_size>:
  801c5e:	55                   	push   %rbp
  801c5f:	48 89 e5             	mov    %rsp,%rbp
  801c62:	48 83 ec 10          	sub    $0x10,%rsp
  801c66:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c6a:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c6d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c71:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  801c77:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  801c7a:	7e 18                	jle    801c94 <file_set_size+0x36>
  801c7c:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c7f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c83:	89 d6                	mov    %edx,%esi
  801c85:	48 89 c7             	mov    %rax,%rdi
  801c88:	48 b8 84 1b 80 00 00 	movabs $0x801b84,%rax
  801c8f:	00 00 00 
  801c92:	ff d0                	callq  *%rax
  801c94:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c98:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c9b:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  801ca1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ca5:	48 89 c7             	mov    %rax,%rdi
  801ca8:	48 b8 22 08 80 00 00 	movabs $0x800822,%rax
  801caf:	00 00 00 
  801cb2:	ff d0                	callq  *%rax
  801cb4:	b8 00 00 00 00       	mov    $0x0,%eax
  801cb9:	c9                   	leaveq 
  801cba:	c3                   	retq   

0000000000801cbb <file_flush>:
  801cbb:	55                   	push   %rbp
  801cbc:	48 89 e5             	mov    %rsp,%rbp
  801cbf:	48 83 ec 20          	sub    $0x20,%rsp
  801cc3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801cc7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801cce:	eb 63                	jmp    801d33 <file_flush+0x78>
  801cd0:	8b 75 fc             	mov    -0x4(%rbp),%esi
  801cd3:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801cd7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801cdb:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ce0:	48 89 c7             	mov    %rax,%rdi
  801ce3:	48 b8 92 10 80 00 00 	movabs $0x801092,%rax
  801cea:	00 00 00 
  801ced:	ff d0                	callq  *%rax
  801cef:	85 c0                	test   %eax,%eax
  801cf1:	78 3b                	js     801d2e <file_flush+0x73>
  801cf3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801cf7:	48 85 c0             	test   %rax,%rax
  801cfa:	74 32                	je     801d2e <file_flush+0x73>
  801cfc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d00:	8b 00                	mov    (%rax),%eax
  801d02:	85 c0                	test   %eax,%eax
  801d04:	74 28                	je     801d2e <file_flush+0x73>
  801d06:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d0a:	8b 00                	mov    (%rax),%eax
  801d0c:	89 c0                	mov    %eax,%eax
  801d0e:	48 89 c7             	mov    %rax,%rdi
  801d11:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  801d18:	00 00 00 
  801d1b:	ff d0                	callq  *%rax
  801d1d:	48 89 c7             	mov    %rax,%rdi
  801d20:	48 b8 22 08 80 00 00 	movabs $0x800822,%rax
  801d27:	00 00 00 
  801d2a:	ff d0                	callq  *%rax
  801d2c:	eb 01                	jmp    801d2f <file_flush+0x74>
  801d2e:	90                   	nop
  801d2f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801d33:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d37:	8b 80 80 00 00 00    	mov    0x80(%rax),%eax
  801d3d:	05 ff 0f 00 00       	add    $0xfff,%eax
  801d42:	8d 90 ff 0f 00 00    	lea    0xfff(%rax),%edx
  801d48:	85 c0                	test   %eax,%eax
  801d4a:	0f 48 c2             	cmovs  %edx,%eax
  801d4d:	c1 f8 0c             	sar    $0xc,%eax
  801d50:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  801d53:	0f 8f 77 ff ff ff    	jg     801cd0 <file_flush+0x15>
  801d59:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d5d:	48 89 c7             	mov    %rax,%rdi
  801d60:	48 b8 22 08 80 00 00 	movabs $0x800822,%rax
  801d67:	00 00 00 
  801d6a:	ff d0                	callq  *%rax
  801d6c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d70:	8b 80 b0 00 00 00    	mov    0xb0(%rax),%eax
  801d76:	85 c0                	test   %eax,%eax
  801d78:	74 2a                	je     801da4 <file_flush+0xe9>
  801d7a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d7e:	8b 80 b0 00 00 00    	mov    0xb0(%rax),%eax
  801d84:	89 c0                	mov    %eax,%eax
  801d86:	48 89 c7             	mov    %rax,%rdi
  801d89:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  801d90:	00 00 00 
  801d93:	ff d0                	callq  *%rax
  801d95:	48 89 c7             	mov    %rax,%rdi
  801d98:	48 b8 22 08 80 00 00 	movabs $0x800822,%rax
  801d9f:	00 00 00 
  801da2:	ff d0                	callq  *%rax
  801da4:	90                   	nop
  801da5:	c9                   	leaveq 
  801da6:	c3                   	retq   

0000000000801da7 <file_remove>:
  801da7:	55                   	push   %rbp
  801da8:	48 89 e5             	mov    %rsp,%rbp
  801dab:	48 83 ec 20          	sub    $0x20,%rsp
  801daf:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801db3:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801db7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801dbb:	b9 00 00 00 00       	mov    $0x0,%ecx
  801dc0:	be 00 00 00 00       	mov    $0x0,%esi
  801dc5:	48 89 c7             	mov    %rax,%rdi
  801dc8:	48 b8 f6 14 80 00 00 	movabs $0x8014f6,%rax
  801dcf:	00 00 00 
  801dd2:	ff d0                	callq  *%rax
  801dd4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801dd7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801ddb:	79 05                	jns    801de2 <file_remove+0x3b>
  801ddd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801de0:	eb 45                	jmp    801e27 <file_remove+0x80>
  801de2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801de6:	be 00 00 00 00       	mov    $0x0,%esi
  801deb:	48 89 c7             	mov    %rax,%rdi
  801dee:	48 b8 84 1b 80 00 00 	movabs $0x801b84,%rax
  801df5:	00 00 00 
  801df8:	ff d0                	callq  *%rax
  801dfa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801dfe:	c6 00 00             	movb   $0x0,(%rax)
  801e01:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e05:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  801e0c:	00 00 00 
  801e0f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e13:	48 89 c7             	mov    %rax,%rdi
  801e16:	48 b8 22 08 80 00 00 	movabs $0x800822,%rax
  801e1d:	00 00 00 
  801e20:	ff d0                	callq  *%rax
  801e22:	b8 00 00 00 00       	mov    $0x0,%eax
  801e27:	c9                   	leaveq 
  801e28:	c3                   	retq   

0000000000801e29 <fs_sync>:
  801e29:	55                   	push   %rbp
  801e2a:	48 89 e5             	mov    %rsp,%rbp
  801e2d:	48 83 ec 10          	sub    $0x10,%rsp
  801e31:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801e38:	eb 27                	jmp    801e61 <fs_sync+0x38>
  801e3a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e3d:	48 98                	cltq   
  801e3f:	48 89 c7             	mov    %rax,%rdi
  801e42:	48 b8 a4 04 80 00 00 	movabs $0x8004a4,%rax
  801e49:	00 00 00 
  801e4c:	ff d0                	callq  *%rax
  801e4e:	48 89 c7             	mov    %rax,%rdi
  801e51:	48 b8 22 08 80 00 00 	movabs $0x800822,%rax
  801e58:	00 00 00 
  801e5b:	ff d0                	callq  *%rax
  801e5d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801e61:	48 b8 18 60 81 00 00 	movabs $0x816018,%rax
  801e68:	00 00 00 
  801e6b:	48 8b 00             	mov    (%rax),%rax
  801e6e:	8b 50 04             	mov    0x4(%rax),%edx
  801e71:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e74:	39 c2                	cmp    %eax,%edx
  801e76:	77 c2                	ja     801e3a <fs_sync+0x11>
  801e78:	90                   	nop
  801e79:	c9                   	leaveq 
  801e7a:	c3                   	retq   

0000000000801e7b <serve_init>:
  801e7b:	55                   	push   %rbp
  801e7c:	48 89 e5             	mov    %rsp,%rbp
  801e7f:	48 83 ec 10          	sub    $0x10,%rsp
  801e83:	b8 00 00 00 d0       	mov    $0xd0000000,%eax
  801e88:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801e8c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801e93:	eb 4a                	jmp    801edf <serve_init+0x64>
  801e95:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e98:	48 ba 20 a0 80 00 00 	movabs $0x80a020,%rdx
  801e9f:	00 00 00 
  801ea2:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  801ea5:	48 63 c9             	movslq %ecx,%rcx
  801ea8:	48 c1 e1 05          	shl    $0x5,%rcx
  801eac:	48 01 ca             	add    %rcx,%rdx
  801eaf:	89 02                	mov    %eax,(%rdx)
  801eb1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801eb5:	48 ba 20 a0 80 00 00 	movabs $0x80a020,%rdx
  801ebc:	00 00 00 
  801ebf:	8b 4d fc             	mov    -0x4(%rbp),%ecx
  801ec2:	48 63 c9             	movslq %ecx,%rcx
  801ec5:	48 c1 e1 05          	shl    $0x5,%rcx
  801ec9:	48 01 ca             	add    %rcx,%rdx
  801ecc:	48 83 c2 18          	add    $0x18,%rdx
  801ed0:	48 89 02             	mov    %rax,(%rdx)
  801ed3:	48 81 45 f0 00 10 00 	addq   $0x1000,-0x10(%rbp)
  801eda:	00 
  801edb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801edf:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  801ee6:	7e ad                	jle    801e95 <serve_init+0x1a>
  801ee8:	90                   	nop
  801ee9:	c9                   	leaveq 
  801eea:	c3                   	retq   

0000000000801eeb <openfile_alloc>:
  801eeb:	55                   	push   %rbp
  801eec:	48 89 e5             	mov    %rsp,%rbp
  801eef:	53                   	push   %rbx
  801ef0:	48 83 ec 28          	sub    $0x28,%rsp
  801ef4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801ef8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  801eff:	e9 fd 01 00 00       	jmpq   802101 <openfile_alloc+0x216>
  801f04:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  801f0b:	00 00 00 
  801f0e:	8b 55 ec             	mov    -0x14(%rbp),%edx
  801f11:	48 63 d2             	movslq %edx,%rdx
  801f14:	48 c1 e2 05          	shl    $0x5,%rdx
  801f18:	48 01 d0             	add    %rdx,%rax
  801f1b:	48 83 c0 18          	add    $0x18,%rax
  801f1f:	48 8b 00             	mov    (%rax),%rax
  801f22:	48 89 c7             	mov    %rax,%rdi
  801f25:	48 b8 6e 63 80 00 00 	movabs $0x80636e,%rax
  801f2c:	00 00 00 
  801f2f:	ff d0                	callq  *%rax
  801f31:	85 c0                	test   %eax,%eax
  801f33:	74 0e                	je     801f43 <openfile_alloc+0x58>
  801f35:	83 f8 01             	cmp    $0x1,%eax
  801f38:	0f 84 ea 00 00 00    	je     802028 <openfile_alloc+0x13d>
  801f3e:	e9 ba 01 00 00       	jmpq   8020fd <openfile_alloc+0x212>
  801f43:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  801f4a:	00 00 00 
  801f4d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  801f50:	48 63 d2             	movslq %edx,%rdx
  801f53:	48 c1 e2 05          	shl    $0x5,%rdx
  801f57:	48 01 d0             	add    %rdx,%rax
  801f5a:	48 83 c0 18          	add    $0x18,%rax
  801f5e:	48 8b 00             	mov    (%rax),%rax
  801f61:	ba 07 00 00 00       	mov    $0x7,%edx
  801f66:	48 89 c6             	mov    %rax,%rsi
  801f69:	bf 00 00 00 00       	mov    $0x0,%edi
  801f6e:	48 b8 da 4b 80 00 00 	movabs $0x804bda,%rax
  801f75:	00 00 00 
  801f78:	ff d0                	callq  *%rax
  801f7a:	89 45 e8             	mov    %eax,-0x18(%rbp)
  801f7d:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  801f81:	79 08                	jns    801f8b <openfile_alloc+0xa0>
  801f83:	8b 45 e8             	mov    -0x18(%rbp),%eax
  801f86:	e9 88 01 00 00       	jmpq   802113 <openfile_alloc+0x228>
  801f8b:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  801f92:	00 00 00 
  801f95:	8b 55 ec             	mov    -0x14(%rbp),%edx
  801f98:	48 63 d2             	movslq %edx,%rdx
  801f9b:	48 c1 e2 05          	shl    $0x5,%rdx
  801f9f:	48 01 d0             	add    %rdx,%rax
  801fa2:	8b 00                	mov    (%rax),%eax
  801fa4:	8d 90 00 04 00 00    	lea    0x400(%rax),%edx
  801faa:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  801fb1:	00 00 00 
  801fb4:	8b 4d ec             	mov    -0x14(%rbp),%ecx
  801fb7:	48 63 c9             	movslq %ecx,%rcx
  801fba:	48 c1 e1 05          	shl    $0x5,%rcx
  801fbe:	48 01 c8             	add    %rcx,%rax
  801fc1:	89 10                	mov    %edx,(%rax)
  801fc3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801fc6:	48 98                	cltq   
  801fc8:	48 c1 e0 05          	shl    $0x5,%rax
  801fcc:	48 89 c2             	mov    %rax,%rdx
  801fcf:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  801fd6:	00 00 00 
  801fd9:	48 01 c2             	add    %rax,%rdx
  801fdc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fe0:	48 89 10             	mov    %rdx,(%rax)
  801fe3:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  801fea:	00 00 00 
  801fed:	8b 55 ec             	mov    -0x14(%rbp),%edx
  801ff0:	48 63 d2             	movslq %edx,%rdx
  801ff3:	48 c1 e2 05          	shl    $0x5,%rdx
  801ff7:	48 01 d0             	add    %rdx,%rax
  801ffa:	48 83 c0 18          	add    $0x18,%rax
  801ffe:	48 8b 00             	mov    (%rax),%rax
  802001:	ba 00 10 00 00       	mov    $0x1000,%edx
  802006:	be 00 00 00 00       	mov    $0x0,%esi
  80200b:	48 89 c7             	mov    %rax,%rdi
  80200e:	48 b8 44 45 80 00 00 	movabs $0x804544,%rax
  802015:	00 00 00 
  802018:	ff d0                	callq  *%rax
  80201a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80201e:	48 8b 00             	mov    (%rax),%rax
  802021:	8b 00                	mov    (%rax),%eax
  802023:	e9 eb 00 00 00       	jmpq   802113 <openfile_alloc+0x228>
  802028:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  80202f:	00 00 00 
  802032:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802035:	48 63 d2             	movslq %edx,%rdx
  802038:	48 c1 e2 05          	shl    $0x5,%rdx
  80203c:	48 01 d0             	add    %rdx,%rax
  80203f:	48 83 c0 18          	add    $0x18,%rax
  802043:	48 8b 00             	mov    (%rax),%rax
  802046:	48 89 c3             	mov    %rax,%rbx
  802049:	b8 00 00 00 00       	mov    $0x0,%eax
  80204e:	48 ba 06 31 80 00 00 	movabs $0x803106,%rdx
  802055:	00 00 00 
  802058:	ff d2                	callq  *%rdx
  80205a:	48 39 c3             	cmp    %rax,%rbx
  80205d:	0f 84 9a 00 00 00    	je     8020fd <openfile_alloc+0x212>
  802063:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  80206a:	00 00 00 
  80206d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802070:	48 63 d2             	movslq %edx,%rdx
  802073:	48 c1 e2 05          	shl    $0x5,%rdx
  802077:	48 01 d0             	add    %rdx,%rax
  80207a:	8b 00                	mov    (%rax),%eax
  80207c:	8d 90 00 04 00 00    	lea    0x400(%rax),%edx
  802082:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  802089:	00 00 00 
  80208c:	8b 4d ec             	mov    -0x14(%rbp),%ecx
  80208f:	48 63 c9             	movslq %ecx,%rcx
  802092:	48 c1 e1 05          	shl    $0x5,%rcx
  802096:	48 01 c8             	add    %rcx,%rax
  802099:	89 10                	mov    %edx,(%rax)
  80209b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80209e:	48 98                	cltq   
  8020a0:	48 c1 e0 05          	shl    $0x5,%rax
  8020a4:	48 89 c2             	mov    %rax,%rdx
  8020a7:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  8020ae:	00 00 00 
  8020b1:	48 01 c2             	add    %rax,%rdx
  8020b4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020b8:	48 89 10             	mov    %rdx,(%rax)
  8020bb:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  8020c2:	00 00 00 
  8020c5:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8020c8:	48 63 d2             	movslq %edx,%rdx
  8020cb:	48 c1 e2 05          	shl    $0x5,%rdx
  8020cf:	48 01 d0             	add    %rdx,%rax
  8020d2:	48 83 c0 18          	add    $0x18,%rax
  8020d6:	48 8b 00             	mov    (%rax),%rax
  8020d9:	ba 00 10 00 00       	mov    $0x1000,%edx
  8020de:	be 00 00 00 00       	mov    $0x0,%esi
  8020e3:	48 89 c7             	mov    %rax,%rdi
  8020e6:	48 b8 44 45 80 00 00 	movabs $0x804544,%rax
  8020ed:	00 00 00 
  8020f0:	ff d0                	callq  *%rax
  8020f2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020f6:	48 8b 00             	mov    (%rax),%rax
  8020f9:	8b 00                	mov    (%rax),%eax
  8020fb:	eb 16                	jmp    802113 <openfile_alloc+0x228>
  8020fd:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  802101:	81 7d ec ff 03 00 00 	cmpl   $0x3ff,-0x14(%rbp)
  802108:	0f 8e f6 fd ff ff    	jle    801f04 <openfile_alloc+0x19>
  80210e:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802113:	48 83 c4 28          	add    $0x28,%rsp
  802117:	5b                   	pop    %rbx
  802118:	5d                   	pop    %rbp
  802119:	c3                   	retq   

000000000080211a <openfile_lookup>:
  80211a:	55                   	push   %rbp
  80211b:	48 89 e5             	mov    %rsp,%rbp
  80211e:	48 83 ec 20          	sub    $0x20,%rsp
  802122:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802125:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802128:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  80212c:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80212f:	25 ff 03 00 00       	and    $0x3ff,%eax
  802134:	89 c0                	mov    %eax,%eax
  802136:	48 c1 e0 05          	shl    $0x5,%rax
  80213a:	48 89 c2             	mov    %rax,%rdx
  80213d:	48 b8 20 a0 80 00 00 	movabs $0x80a020,%rax
  802144:	00 00 00 
  802147:	48 01 d0             	add    %rdx,%rax
  80214a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80214e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802152:	48 8b 40 18          	mov    0x18(%rax),%rax
  802156:	48 89 c7             	mov    %rax,%rdi
  802159:	48 b8 6e 63 80 00 00 	movabs $0x80636e,%rax
  802160:	00 00 00 
  802163:	ff d0                	callq  *%rax
  802165:	83 f8 01             	cmp    $0x1,%eax
  802168:	74 0b                	je     802175 <openfile_lookup+0x5b>
  80216a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80216e:	8b 00                	mov    (%rax),%eax
  802170:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  802173:	74 07                	je     80217c <openfile_lookup+0x62>
  802175:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80217a:	eb 10                	jmp    80218c <openfile_lookup+0x72>
  80217c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802180:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802184:	48 89 10             	mov    %rdx,(%rax)
  802187:	b8 00 00 00 00       	mov    $0x0,%eax
  80218c:	c9                   	leaveq 
  80218d:	c3                   	retq   

000000000080218e <serve_open>:
  80218e:	55                   	push   %rbp
  80218f:	48 89 e5             	mov    %rsp,%rbp
  802192:	48 81 ec 40 04 00 00 	sub    $0x440,%rsp
  802199:	89 bd dc fb ff ff    	mov    %edi,-0x424(%rbp)
  80219f:	48 89 b5 d0 fb ff ff 	mov    %rsi,-0x430(%rbp)
  8021a6:	48 89 95 c8 fb ff ff 	mov    %rdx,-0x438(%rbp)
  8021ad:	48 89 8d c0 fb ff ff 	mov    %rcx,-0x440(%rbp)
  8021b4:	48 8b 8d d0 fb ff ff 	mov    -0x430(%rbp),%rcx
  8021bb:	48 8d 85 f0 fb ff ff 	lea    -0x410(%rbp),%rax
  8021c2:	ba 00 04 00 00       	mov    $0x400,%edx
  8021c7:	48 89 ce             	mov    %rcx,%rsi
  8021ca:	48 89 c7             	mov    %rax,%rdi
  8021cd:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  8021d4:	00 00 00 
  8021d7:	ff d0                	callq  *%rax
  8021d9:	c6 45 ef 00          	movb   $0x0,-0x11(%rbp)
  8021dd:	48 8d 85 e0 fb ff ff 	lea    -0x420(%rbp),%rax
  8021e4:	48 89 c7             	mov    %rax,%rdi
  8021e7:	48 b8 eb 1e 80 00 00 	movabs $0x801eeb,%rax
  8021ee:	00 00 00 
  8021f1:	ff d0                	callq  *%rax
  8021f3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8021f6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021fa:	79 08                	jns    802204 <serve_open+0x76>
  8021fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021ff:	e9 7b 01 00 00       	jmpq   80237f <serve_open+0x1f1>
  802204:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802207:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80220a:	48 8b 85 d0 fb ff ff 	mov    -0x430(%rbp),%rax
  802211:	8b 80 00 04 00 00    	mov    0x400(%rax),%eax
  802217:	25 00 01 00 00       	and    $0x100,%eax
  80221c:	85 c0                	test   %eax,%eax
  80221e:	74 4e                	je     80226e <serve_open+0xe0>
  802220:	48 8d 95 e8 fb ff ff 	lea    -0x418(%rbp),%rdx
  802227:	48 8d 85 f0 fb ff ff 	lea    -0x410(%rbp),%rax
  80222e:	48 89 d6             	mov    %rdx,%rsi
  802231:	48 89 c7             	mov    %rax,%rdi
  802234:	48 b8 41 17 80 00 00 	movabs $0x801741,%rax
  80223b:	00 00 00 
  80223e:	ff d0                	callq  *%rax
  802240:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802243:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802247:	79 56                	jns    80229f <serve_open+0x111>
  802249:	48 8b 85 d0 fb ff ff 	mov    -0x430(%rbp),%rax
  802250:	8b 80 00 04 00 00    	mov    0x400(%rax),%eax
  802256:	25 00 04 00 00       	and    $0x400,%eax
  80225b:	85 c0                	test   %eax,%eax
  80225d:	75 06                	jne    802265 <serve_open+0xd7>
  80225f:	83 7d fc f2          	cmpl   $0xfffffff2,-0x4(%rbp)
  802263:	74 08                	je     80226d <serve_open+0xdf>
  802265:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802268:	e9 12 01 00 00       	jmpq   80237f <serve_open+0x1f1>
  80226d:	90                   	nop
  80226e:	48 8d 95 e8 fb ff ff 	lea    -0x418(%rbp),%rdx
  802275:	48 8d 85 f0 fb ff ff 	lea    -0x410(%rbp),%rax
  80227c:	48 89 d6             	mov    %rdx,%rsi
  80227f:	48 89 c7             	mov    %rax,%rdi
  802282:	48 b8 2e 18 80 00 00 	movabs $0x80182e,%rax
  802289:	00 00 00 
  80228c:	ff d0                	callq  *%rax
  80228e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802291:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802295:	79 08                	jns    80229f <serve_open+0x111>
  802297:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80229a:	e9 e0 00 00 00       	jmpq   80237f <serve_open+0x1f1>
  80229f:	48 8b 85 d0 fb ff ff 	mov    -0x430(%rbp),%rax
  8022a6:	8b 80 00 04 00 00    	mov    0x400(%rax),%eax
  8022ac:	25 00 02 00 00       	and    $0x200,%eax
  8022b1:	85 c0                	test   %eax,%eax
  8022b3:	74 2c                	je     8022e1 <serve_open+0x153>
  8022b5:	48 8b 85 e8 fb ff ff 	mov    -0x418(%rbp),%rax
  8022bc:	be 00 00 00 00       	mov    $0x0,%esi
  8022c1:	48 89 c7             	mov    %rax,%rdi
  8022c4:	48 b8 5e 1c 80 00 00 	movabs $0x801c5e,%rax
  8022cb:	00 00 00 
  8022ce:	ff d0                	callq  *%rax
  8022d0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022d3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022d7:	79 08                	jns    8022e1 <serve_open+0x153>
  8022d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022dc:	e9 9e 00 00 00       	jmpq   80237f <serve_open+0x1f1>
  8022e1:	48 8b 85 e0 fb ff ff 	mov    -0x420(%rbp),%rax
  8022e8:	48 8b 95 e8 fb ff ff 	mov    -0x418(%rbp),%rdx
  8022ef:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8022f3:	48 8b 85 e0 fb ff ff 	mov    -0x420(%rbp),%rax
  8022fa:	48 8b 40 18          	mov    0x18(%rax),%rax
  8022fe:	48 8b 95 e0 fb ff ff 	mov    -0x420(%rbp),%rdx
  802305:	8b 12                	mov    (%rdx),%edx
  802307:	89 50 0c             	mov    %edx,0xc(%rax)
  80230a:	48 8b 85 e0 fb ff ff 	mov    -0x420(%rbp),%rax
  802311:	48 8b 40 18          	mov    0x18(%rax),%rax
  802315:	48 8b 95 d0 fb ff ff 	mov    -0x430(%rbp),%rdx
  80231c:	8b 92 00 04 00 00    	mov    0x400(%rdx),%edx
  802322:	83 e2 03             	and    $0x3,%edx
  802325:	89 50 08             	mov    %edx,0x8(%rax)
  802328:	48 8b 85 e0 fb ff ff 	mov    -0x420(%rbp),%rax
  80232f:	48 8b 40 18          	mov    0x18(%rax),%rax
  802333:	48 ba e0 20 81 00 00 	movabs $0x8120e0,%rdx
  80233a:	00 00 00 
  80233d:	8b 12                	mov    (%rdx),%edx
  80233f:	89 10                	mov    %edx,(%rax)
  802341:	48 8b 85 e0 fb ff ff 	mov    -0x420(%rbp),%rax
  802348:	48 8b 95 d0 fb ff ff 	mov    -0x430(%rbp),%rdx
  80234f:	8b 92 00 04 00 00    	mov    0x400(%rdx),%edx
  802355:	89 50 10             	mov    %edx,0x10(%rax)
  802358:	48 8b 85 e0 fb ff ff 	mov    -0x420(%rbp),%rax
  80235f:	48 8b 50 18          	mov    0x18(%rax),%rdx
  802363:	48 8b 85 c8 fb ff ff 	mov    -0x438(%rbp),%rax
  80236a:	48 89 10             	mov    %rdx,(%rax)
  80236d:	48 8b 85 c0 fb ff ff 	mov    -0x440(%rbp),%rax
  802374:	c7 00 07 04 00 00    	movl   $0x407,(%rax)
  80237a:	b8 00 00 00 00       	mov    $0x0,%eax
  80237f:	c9                   	leaveq 
  802380:	c3                   	retq   

0000000000802381 <serve_set_size>:
  802381:	55                   	push   %rbp
  802382:	48 89 e5             	mov    %rsp,%rbp
  802385:	48 83 ec 20          	sub    $0x20,%rsp
  802389:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80238c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802390:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802394:	8b 00                	mov    (%rax),%eax
  802396:	89 c1                	mov    %eax,%ecx
  802398:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80239c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80239f:	89 ce                	mov    %ecx,%esi
  8023a1:	89 c7                	mov    %eax,%edi
  8023a3:	48 b8 1a 21 80 00 00 	movabs $0x80211a,%rax
  8023aa:	00 00 00 
  8023ad:	ff d0                	callq  *%rax
  8023af:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023b2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023b6:	79 05                	jns    8023bd <serve_set_size+0x3c>
  8023b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023bb:	eb 20                	jmp    8023dd <serve_set_size+0x5c>
  8023bd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8023c1:	8b 50 04             	mov    0x4(%rax),%edx
  8023c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023c8:	48 8b 40 08          	mov    0x8(%rax),%rax
  8023cc:	89 d6                	mov    %edx,%esi
  8023ce:	48 89 c7             	mov    %rax,%rdi
  8023d1:	48 b8 5e 1c 80 00 00 	movabs $0x801c5e,%rax
  8023d8:	00 00 00 
  8023db:	ff d0                	callq  *%rax
  8023dd:	c9                   	leaveq 
  8023de:	c3                   	retq   

00000000008023df <serve_read>:
  8023df:	55                   	push   %rbp
  8023e0:	48 89 e5             	mov    %rsp,%rbp
  8023e3:	48 83 ec 40          	sub    $0x40,%rsp
  8023e7:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8023ea:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  8023ee:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8023f2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8023f6:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8023fa:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8023fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802402:	8b 00                	mov    (%rax),%eax
  802404:	89 c1                	mov    %eax,%ecx
  802406:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
  80240a:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80240d:	89 ce                	mov    %ecx,%esi
  80240f:	89 c7                	mov    %eax,%edi
  802411:	48 b8 1a 21 80 00 00 	movabs $0x80211a,%rax
  802418:	00 00 00 
  80241b:	ff d0                	callq  *%rax
  80241d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802420:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802424:	79 05                	jns    80242b <serve_read+0x4c>
  802426:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802429:	eb 76                	jmp    8024a1 <serve_read+0xc2>
  80242b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80242f:	48 8b 40 18          	mov    0x18(%rax),%rax
  802433:	8b 48 04             	mov    0x4(%rax),%ecx
  802436:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80243a:	48 8b 40 08          	mov    0x8(%rax),%rax
  80243e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802442:	48 c7 45 d8 00 10 00 	movq   $0x1000,-0x28(%rbp)
  802449:	00 
  80244a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80244e:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
  802452:	48 0f 46 45 e0       	cmovbe -0x20(%rbp),%rax
  802457:	48 89 c2             	mov    %rax,%rdx
  80245a:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80245e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802462:	48 8b 40 08          	mov    0x8(%rax),%rax
  802466:	48 89 c7             	mov    %rax,%rdi
  802469:	48 b8 61 18 80 00 00 	movabs $0x801861,%rax
  802470:	00 00 00 
  802473:	ff d0                	callq  *%rax
  802475:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802478:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80247c:	79 05                	jns    802483 <serve_read+0xa4>
  80247e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802481:	eb 1e                	jmp    8024a1 <serve_read+0xc2>
  802483:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802487:	48 8b 40 18          	mov    0x18(%rax),%rax
  80248b:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80248f:	48 8b 52 18          	mov    0x18(%rdx),%rdx
  802493:	8b 4a 04             	mov    0x4(%rdx),%ecx
  802496:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802499:	01 ca                	add    %ecx,%edx
  80249b:	89 50 04             	mov    %edx,0x4(%rax)
  80249e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8024a1:	c9                   	leaveq 
  8024a2:	c3                   	retq   

00000000008024a3 <serve_write>:
  8024a3:	55                   	push   %rbp
  8024a4:	48 89 e5             	mov    %rsp,%rbp
  8024a7:	48 83 ec 20          	sub    $0x20,%rsp
  8024ab:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8024ae:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8024b2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8024b6:	8b 00                	mov    (%rax),%eax
  8024b8:	89 c1                	mov    %eax,%ecx
  8024ba:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8024be:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8024c1:	89 ce                	mov    %ecx,%esi
  8024c3:	89 c7                	mov    %eax,%edi
  8024c5:	48 b8 1a 21 80 00 00 	movabs $0x80211a,%rax
  8024cc:	00 00 00 
  8024cf:	ff d0                	callq  *%rax
  8024d1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024d4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024d8:	79 05                	jns    8024df <serve_write+0x3c>
  8024da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024dd:	eb 75                	jmp    802554 <serve_write+0xb1>
  8024df:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8024e3:	48 8b 40 08          	mov    0x8(%rax),%rax
  8024e7:	48 3d f4 0f 00 00    	cmp    $0xff4,%rax
  8024ed:	76 07                	jbe    8024f6 <serve_write+0x53>
  8024ef:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8024f4:	eb 5e                	jmp    802554 <serve_write+0xb1>
  8024f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024fa:	48 8b 40 18          	mov    0x18(%rax),%rax
  8024fe:	8b 48 04             	mov    0x4(%rax),%ecx
  802501:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802505:	48 8b 50 08          	mov    0x8(%rax),%rdx
  802509:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80250d:	48 8d 70 10          	lea    0x10(%rax),%rsi
  802511:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802515:	48 8b 40 08          	mov    0x8(%rax),%rax
  802519:	48 89 c7             	mov    %rax,%rdi
  80251c:	48 b8 b7 19 80 00 00 	movabs $0x8019b7,%rax
  802523:	00 00 00 
  802526:	ff d0                	callq  *%rax
  802528:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80252b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80252f:	79 05                	jns    802536 <serve_write+0x93>
  802531:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802534:	eb 1e                	jmp    802554 <serve_write+0xb1>
  802536:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80253a:	48 8b 40 18          	mov    0x18(%rax),%rax
  80253e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802542:	48 8b 52 18          	mov    0x18(%rdx),%rdx
  802546:	8b 4a 04             	mov    0x4(%rdx),%ecx
  802549:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80254c:	01 ca                	add    %ecx,%edx
  80254e:	89 50 04             	mov    %edx,0x4(%rax)
  802551:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802554:	c9                   	leaveq 
  802555:	c3                   	retq   

0000000000802556 <serve_stat>:
  802556:	55                   	push   %rbp
  802557:	48 89 e5             	mov    %rsp,%rbp
  80255a:	48 83 ec 30          	sub    $0x30,%rsp
  80255e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802561:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802565:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802569:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80256d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802571:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802575:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802579:	8b 00                	mov    (%rax),%eax
  80257b:	89 c1                	mov    %eax,%ecx
  80257d:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
  802581:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802584:	89 ce                	mov    %ecx,%esi
  802586:	89 c7                	mov    %eax,%edi
  802588:	48 b8 1a 21 80 00 00 	movabs $0x80211a,%rax
  80258f:	00 00 00 
  802592:	ff d0                	callq  *%rax
  802594:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802597:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80259b:	79 05                	jns    8025a2 <serve_stat+0x4c>
  80259d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8025a0:	eb 5f                	jmp    802601 <serve_stat+0xab>
  8025a2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8025a6:	48 8b 40 08          	mov    0x8(%rax),%rax
  8025aa:	48 89 c2             	mov    %rax,%rdx
  8025ad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025b1:	48 89 d6             	mov    %rdx,%rsi
  8025b4:	48 89 c7             	mov    %rax,%rdi
  8025b7:	48 b8 aa 42 80 00 00 	movabs $0x8042aa,%rax
  8025be:	00 00 00 
  8025c1:	ff d0                	callq  *%rax
  8025c3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8025c7:	48 8b 40 08          	mov    0x8(%rax),%rax
  8025cb:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  8025d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025d5:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8025db:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8025df:	48 8b 40 08          	mov    0x8(%rax),%rax
  8025e3:	8b 80 84 00 00 00    	mov    0x84(%rax),%eax
  8025e9:	83 f8 01             	cmp    $0x1,%eax
  8025ec:	0f 94 c0             	sete   %al
  8025ef:	0f b6 d0             	movzbl %al,%edx
  8025f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025f6:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  8025fc:	b8 00 00 00 00       	mov    $0x0,%eax
  802601:	c9                   	leaveq 
  802602:	c3                   	retq   

0000000000802603 <serve_flush>:
  802603:	55                   	push   %rbp
  802604:	48 89 e5             	mov    %rsp,%rbp
  802607:	48 83 ec 20          	sub    $0x20,%rsp
  80260b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80260e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802612:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802616:	8b 00                	mov    (%rax),%eax
  802618:	89 c1                	mov    %eax,%ecx
  80261a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80261e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802621:	89 ce                	mov    %ecx,%esi
  802623:	89 c7                	mov    %eax,%edi
  802625:	48 b8 1a 21 80 00 00 	movabs $0x80211a,%rax
  80262c:	00 00 00 
  80262f:	ff d0                	callq  *%rax
  802631:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802634:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802638:	79 05                	jns    80263f <serve_flush+0x3c>
  80263a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80263d:	eb 1c                	jmp    80265b <serve_flush+0x58>
  80263f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802643:	48 8b 40 08          	mov    0x8(%rax),%rax
  802647:	48 89 c7             	mov    %rax,%rdi
  80264a:	48 b8 bb 1c 80 00 00 	movabs $0x801cbb,%rax
  802651:	00 00 00 
  802654:	ff d0                	callq  *%rax
  802656:	b8 00 00 00 00       	mov    $0x0,%eax
  80265b:	c9                   	leaveq 
  80265c:	c3                   	retq   

000000000080265d <serve_remove>:
  80265d:	55                   	push   %rbp
  80265e:	48 89 e5             	mov    %rsp,%rbp
  802661:	48 81 ec 10 04 00 00 	sub    $0x410,%rsp
  802668:	89 bd fc fb ff ff    	mov    %edi,-0x404(%rbp)
  80266e:	48 89 b5 f0 fb ff ff 	mov    %rsi,-0x410(%rbp)
  802675:	48 8b 8d f0 fb ff ff 	mov    -0x410(%rbp),%rcx
  80267c:	48 8d 85 00 fc ff ff 	lea    -0x400(%rbp),%rax
  802683:	ba 00 04 00 00       	mov    $0x400,%edx
  802688:	48 89 ce             	mov    %rcx,%rsi
  80268b:	48 89 c7             	mov    %rax,%rdi
  80268e:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  802695:	00 00 00 
  802698:	ff d0                	callq  *%rax
  80269a:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
  80269e:	48 8d 85 00 fc ff ff 	lea    -0x400(%rbp),%rax
  8026a5:	48 89 c7             	mov    %rax,%rdi
  8026a8:	48 b8 a7 1d 80 00 00 	movabs $0x801da7,%rax
  8026af:	00 00 00 
  8026b2:	ff d0                	callq  *%rax
  8026b4:	c9                   	leaveq 
  8026b5:	c3                   	retq   

00000000008026b6 <serve_sync>:
  8026b6:	55                   	push   %rbp
  8026b7:	48 89 e5             	mov    %rsp,%rbp
  8026ba:	48 83 ec 10          	sub    $0x10,%rsp
  8026be:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8026c1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8026c5:	48 b8 29 1e 80 00 00 	movabs $0x801e29,%rax
  8026cc:	00 00 00 
  8026cf:	ff d0                	callq  *%rax
  8026d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8026d6:	c9                   	leaveq 
  8026d7:	c3                   	retq   

00000000008026d8 <serve>:
  8026d8:	55                   	push   %rbp
  8026d9:	48 89 e5             	mov    %rsp,%rbp
  8026dc:	48 83 ec 20          	sub    $0x20,%rsp
  8026e0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  8026e7:	48 b8 20 20 81 00 00 	movabs $0x812020,%rax
  8026ee:	00 00 00 
  8026f1:	48 8b 08             	mov    (%rax),%rcx
  8026f4:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8026f8:	48 8d 45 f4          	lea    -0xc(%rbp),%rax
  8026fc:	48 89 ce             	mov    %rcx,%rsi
  8026ff:	48 89 c7             	mov    %rax,%rdi
  802702:	48 b8 ff 50 80 00 00 	movabs $0x8050ff,%rax
  802709:	00 00 00 
  80270c:	ff d0                	callq  *%rax
  80270e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802711:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802714:	83 e0 01             	and    $0x1,%eax
  802717:	85 c0                	test   %eax,%eax
  802719:	75 25                	jne    802740 <serve+0x68>
  80271b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80271e:	89 c6                	mov    %eax,%esi
  802720:	48 bf 88 77 80 00 00 	movabs $0x807788,%rdi
  802727:	00 00 00 
  80272a:	b8 00 00 00 00       	mov    $0x0,%eax
  80272f:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  802736:	00 00 00 
  802739:	ff d2                	callq  *%rdx
  80273b:	e9 ed 00 00 00       	jmpq   80282d <serve+0x155>
  802740:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  802747:	00 
  802748:	83 7d f8 01          	cmpl   $0x1,-0x8(%rbp)
  80274c:	75 2e                	jne    80277c <serve+0xa4>
  80274e:	48 b8 20 20 81 00 00 	movabs $0x812020,%rax
  802755:	00 00 00 
  802758:	48 8b 00             	mov    (%rax),%rax
  80275b:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80275e:	89 d7                	mov    %edx,%edi
  802760:	48 8d 4d f0          	lea    -0x10(%rbp),%rcx
  802764:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802768:	48 89 c6             	mov    %rax,%rsi
  80276b:	48 b8 8e 21 80 00 00 	movabs $0x80218e,%rax
  802772:	00 00 00 
  802775:	ff d0                	callq  *%rax
  802777:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80277a:	eb 73                	jmp    8027ef <serve+0x117>
  80277c:	83 7d f8 08          	cmpl   $0x8,-0x8(%rbp)
  802780:	77 43                	ja     8027c5 <serve+0xed>
  802782:	48 b8 40 20 81 00 00 	movabs $0x812040,%rax
  802789:	00 00 00 
  80278c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80278f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802793:	48 85 c0             	test   %rax,%rax
  802796:	74 2d                	je     8027c5 <serve+0xed>
  802798:	48 b8 40 20 81 00 00 	movabs $0x812040,%rax
  80279f:	00 00 00 
  8027a2:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8027a5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8027a9:	48 ba 20 20 81 00 00 	movabs $0x812020,%rdx
  8027b0:	00 00 00 
  8027b3:	48 8b 12             	mov    (%rdx),%rdx
  8027b6:	8b 4d f4             	mov    -0xc(%rbp),%ecx
  8027b9:	48 89 d6             	mov    %rdx,%rsi
  8027bc:	89 cf                	mov    %ecx,%edi
  8027be:	ff d0                	callq  *%rax
  8027c0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027c3:	eb 2a                	jmp    8027ef <serve+0x117>
  8027c5:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8027c8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8027cb:	89 c6                	mov    %eax,%esi
  8027cd:	48 bf b8 77 80 00 00 	movabs $0x8077b8,%rdi
  8027d4:	00 00 00 
  8027d7:	b8 00 00 00 00       	mov    $0x0,%eax
  8027dc:	48 b9 1a 37 80 00 00 	movabs $0x80371a,%rcx
  8027e3:	00 00 00 
  8027e6:	ff d1                	callq  *%rcx
  8027e8:	c7 45 fc fd ff ff ff 	movl   $0xfffffffd,-0x4(%rbp)
  8027ef:	8b 4d f0             	mov    -0x10(%rbp),%ecx
  8027f2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8027f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027f9:	8b 75 f4             	mov    -0xc(%rbp),%esi
  8027fc:	89 f7                	mov    %esi,%edi
  8027fe:	89 c6                	mov    %eax,%esi
  802800:	48 b8 c0 51 80 00 00 	movabs $0x8051c0,%rax
  802807:	00 00 00 
  80280a:	ff d0                	callq  *%rax
  80280c:	48 b8 20 20 81 00 00 	movabs $0x812020,%rax
  802813:	00 00 00 
  802816:	48 8b 00             	mov    (%rax),%rax
  802819:	48 89 c6             	mov    %rax,%rsi
  80281c:	bf 00 00 00 00       	mov    $0x0,%edi
  802821:	48 b8 8c 4c 80 00 00 	movabs $0x804c8c,%rax
  802828:	00 00 00 
  80282b:	ff d0                	callq  *%rax
  80282d:	e9 ae fe ff ff       	jmpq   8026e0 <serve+0x8>

0000000000802832 <umain>:
  802832:	55                   	push   %rbp
  802833:	48 89 e5             	mov    %rsp,%rbp
  802836:	48 83 ec 20          	sub    $0x20,%rsp
  80283a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80283d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802841:	48 b8 90 20 81 00 00 	movabs $0x812090,%rax
  802848:	00 00 00 
  80284b:	48 b9 db 77 80 00 00 	movabs $0x8077db,%rcx
  802852:	00 00 00 
  802855:	48 89 08             	mov    %rcx,(%rax)
  802858:	48 bf de 77 80 00 00 	movabs $0x8077de,%rdi
  80285f:	00 00 00 
  802862:	b8 00 00 00 00       	mov    $0x0,%eax
  802867:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  80286e:	00 00 00 
  802871:	ff d2                	callq  *%rdx
  802873:	c7 45 fc 00 8a 00 00 	movl   $0x8a00,-0x4(%rbp)
  80287a:	66 c7 45 fa 00 8a    	movw   $0x8a00,-0x6(%rbp)
}

static __inline void
outw(int port, uint16_t data)
{
	__asm __volatile("outw %0,%w1" : : "a" (data), "d" (port));
  802880:	0f b7 45 fa          	movzwl -0x6(%rbp),%eax
  802884:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802887:	66 ef                	out    %ax,(%dx)
  802889:	48 bf ed 77 80 00 00 	movabs $0x8077ed,%rdi
  802890:	00 00 00 
  802893:	b8 00 00 00 00       	mov    $0x0,%eax
  802898:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  80289f:	00 00 00 
  8028a2:	ff d2                	callq  *%rdx
  8028a4:	48 b8 7b 1e 80 00 00 	movabs $0x801e7b,%rax
  8028ab:	00 00 00 
  8028ae:	ff d0                	callq  *%rax
  8028b0:	48 b8 14 10 80 00 00 	movabs $0x801014,%rax
  8028b7:	00 00 00 
  8028ba:	ff d0                	callq  *%rax
  8028bc:	48 b8 d8 26 80 00 00 	movabs $0x8026d8,%rax
  8028c3:	00 00 00 
  8028c6:	ff d0                	callq  *%rax
  8028c8:	90                   	nop
  8028c9:	c9                   	leaveq 
  8028ca:	c3                   	retq   

00000000008028cb <fs_test>:
  8028cb:	55                   	push   %rbp
  8028cc:	48 89 e5             	mov    %rsp,%rbp
  8028cf:	48 83 ec 20          	sub    $0x20,%rsp
  8028d3:	ba 07 00 00 00       	mov    $0x7,%edx
  8028d8:	be 00 10 00 00       	mov    $0x1000,%esi
  8028dd:	bf 00 00 00 00       	mov    $0x0,%edi
  8028e2:	48 b8 da 4b 80 00 00 	movabs $0x804bda,%rax
  8028e9:	00 00 00 
  8028ec:	ff d0                	callq  *%rax
  8028ee:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028f1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028f5:	79 30                	jns    802927 <fs_test+0x5c>
  8028f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028fa:	89 c1                	mov    %eax,%ecx
  8028fc:	48 ba 26 78 80 00 00 	movabs $0x807826,%rdx
  802903:	00 00 00 
  802906:	be 14 00 00 00       	mov    $0x14,%esi
  80290b:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802912:	00 00 00 
  802915:	b8 00 00 00 00       	mov    $0x0,%eax
  80291a:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  802921:	00 00 00 
  802924:	41 ff d0             	callq  *%r8
  802927:	48 c7 45 f0 00 10 00 	movq   $0x1000,-0x10(%rbp)
  80292e:	00 
  80292f:	48 b8 10 60 81 00 00 	movabs $0x816010,%rax
  802936:	00 00 00 
  802939:	48 8b 08             	mov    (%rax),%rcx
  80293c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802940:	ba 00 10 00 00       	mov    $0x1000,%edx
  802945:	48 89 ce             	mov    %rcx,%rsi
  802948:	48 89 c7             	mov    %rax,%rdi
  80294b:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  802952:	00 00 00 
  802955:	ff d0                	callq  *%rax
  802957:	48 b8 b2 0d 80 00 00 	movabs $0x800db2,%rax
  80295e:	00 00 00 
  802961:	ff d0                	callq  *%rax
  802963:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802966:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80296a:	79 30                	jns    80299c <fs_test+0xd1>
  80296c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80296f:	89 c1                	mov    %eax,%ecx
  802971:	48 ba 46 78 80 00 00 	movabs $0x807846,%rdx
  802978:	00 00 00 
  80297b:	be 19 00 00 00       	mov    $0x19,%esi
  802980:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802987:	00 00 00 
  80298a:	b8 00 00 00 00       	mov    $0x0,%eax
  80298f:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  802996:	00 00 00 
  802999:	41 ff d0             	callq  *%r8
  80299c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80299f:	8d 50 1f             	lea    0x1f(%rax),%edx
  8029a2:	85 c0                	test   %eax,%eax
  8029a4:	0f 48 c2             	cmovs  %edx,%eax
  8029a7:	c1 f8 05             	sar    $0x5,%eax
  8029aa:	48 98                	cltq   
  8029ac:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  8029b3:	00 
  8029b4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029b8:	48 01 d0             	add    %rdx,%rax
  8029bb:	8b 30                	mov    (%rax),%esi
  8029bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029c0:	99                   	cltd   
  8029c1:	c1 ea 1b             	shr    $0x1b,%edx
  8029c4:	01 d0                	add    %edx,%eax
  8029c6:	83 e0 1f             	and    $0x1f,%eax
  8029c9:	29 d0                	sub    %edx,%eax
  8029cb:	ba 01 00 00 00       	mov    $0x1,%edx
  8029d0:	89 c1                	mov    %eax,%ecx
  8029d2:	d3 e2                	shl    %cl,%edx
  8029d4:	89 d0                	mov    %edx,%eax
  8029d6:	21 f0                	and    %esi,%eax
  8029d8:	85 c0                	test   %eax,%eax
  8029da:	75 35                	jne    802a11 <fs_test+0x146>
  8029dc:	48 b9 56 78 80 00 00 	movabs $0x807856,%rcx
  8029e3:	00 00 00 
  8029e6:	48 ba 71 78 80 00 00 	movabs $0x807871,%rdx
  8029ed:	00 00 00 
  8029f0:	be 1b 00 00 00       	mov    $0x1b,%esi
  8029f5:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  8029fc:	00 00 00 
  8029ff:	b8 00 00 00 00       	mov    $0x0,%eax
  802a04:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  802a0b:	00 00 00 
  802a0e:	41 ff d0             	callq  *%r8
  802a11:	48 b8 10 60 81 00 00 	movabs $0x816010,%rax
  802a18:	00 00 00 
  802a1b:	48 8b 10             	mov    (%rax),%rdx
  802a1e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a21:	8d 48 1f             	lea    0x1f(%rax),%ecx
  802a24:	85 c0                	test   %eax,%eax
  802a26:	0f 48 c1             	cmovs  %ecx,%eax
  802a29:	c1 f8 05             	sar    $0x5,%eax
  802a2c:	48 98                	cltq   
  802a2e:	48 c1 e0 02          	shl    $0x2,%rax
  802a32:	48 01 d0             	add    %rdx,%rax
  802a35:	8b 30                	mov    (%rax),%esi
  802a37:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a3a:	99                   	cltd   
  802a3b:	c1 ea 1b             	shr    $0x1b,%edx
  802a3e:	01 d0                	add    %edx,%eax
  802a40:	83 e0 1f             	and    $0x1f,%eax
  802a43:	29 d0                	sub    %edx,%eax
  802a45:	ba 01 00 00 00       	mov    $0x1,%edx
  802a4a:	89 c1                	mov    %eax,%ecx
  802a4c:	d3 e2                	shl    %cl,%edx
  802a4e:	89 d0                	mov    %edx,%eax
  802a50:	21 f0                	and    %esi,%eax
  802a52:	85 c0                	test   %eax,%eax
  802a54:	74 35                	je     802a8b <fs_test+0x1c0>
  802a56:	48 b9 88 78 80 00 00 	movabs $0x807888,%rcx
  802a5d:	00 00 00 
  802a60:	48 ba 71 78 80 00 00 	movabs $0x807871,%rdx
  802a67:	00 00 00 
  802a6a:	be 1d 00 00 00       	mov    $0x1d,%esi
  802a6f:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802a76:	00 00 00 
  802a79:	b8 00 00 00 00       	mov    $0x0,%eax
  802a7e:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  802a85:	00 00 00 
  802a88:	41 ff d0             	callq  *%r8
  802a8b:	48 bf a8 78 80 00 00 	movabs $0x8078a8,%rdi
  802a92:	00 00 00 
  802a95:	b8 00 00 00 00       	mov    $0x0,%eax
  802a9a:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  802aa1:	00 00 00 
  802aa4:	ff d2                	callq  *%rdx
  802aa6:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  802aaa:	48 89 c6             	mov    %rax,%rsi
  802aad:	48 bf bd 78 80 00 00 	movabs $0x8078bd,%rdi
  802ab4:	00 00 00 
  802ab7:	48 b8 2e 18 80 00 00 	movabs $0x80182e,%rax
  802abe:	00 00 00 
  802ac1:	ff d0                	callq  *%rax
  802ac3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ac6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802aca:	79 36                	jns    802b02 <fs_test+0x237>
  802acc:	83 7d fc f4          	cmpl   $0xfffffff4,-0x4(%rbp)
  802ad0:	74 30                	je     802b02 <fs_test+0x237>
  802ad2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ad5:	89 c1                	mov    %eax,%ecx
  802ad7:	48 ba c8 78 80 00 00 	movabs $0x8078c8,%rdx
  802ade:	00 00 00 
  802ae1:	be 21 00 00 00       	mov    $0x21,%esi
  802ae6:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802aed:	00 00 00 
  802af0:	b8 00 00 00 00       	mov    $0x0,%eax
  802af5:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  802afc:	00 00 00 
  802aff:	41 ff d0             	callq  *%r8
  802b02:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b06:	75 2a                	jne    802b32 <fs_test+0x267>
  802b08:	48 ba e8 78 80 00 00 	movabs $0x8078e8,%rdx
  802b0f:	00 00 00 
  802b12:	be 23 00 00 00       	mov    $0x23,%esi
  802b17:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802b1e:	00 00 00 
  802b21:	b8 00 00 00 00       	mov    $0x0,%eax
  802b26:	48 b9 e0 34 80 00 00 	movabs $0x8034e0,%rcx
  802b2d:	00 00 00 
  802b30:	ff d1                	callq  *%rcx
  802b32:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  802b36:	48 89 c6             	mov    %rax,%rsi
  802b39:	48 bf 08 79 80 00 00 	movabs $0x807908,%rdi
  802b40:	00 00 00 
  802b43:	48 b8 2e 18 80 00 00 	movabs $0x80182e,%rax
  802b4a:	00 00 00 
  802b4d:	ff d0                	callq  *%rax
  802b4f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b52:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b56:	79 30                	jns    802b88 <fs_test+0x2bd>
  802b58:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b5b:	89 c1                	mov    %eax,%ecx
  802b5d:	48 ba 11 79 80 00 00 	movabs $0x807911,%rdx
  802b64:	00 00 00 
  802b67:	be 25 00 00 00       	mov    $0x25,%esi
  802b6c:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802b73:	00 00 00 
  802b76:	b8 00 00 00 00       	mov    $0x0,%eax
  802b7b:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  802b82:	00 00 00 
  802b85:	41 ff d0             	callq  *%r8
  802b88:	48 bf 28 79 80 00 00 	movabs $0x807928,%rdi
  802b8f:	00 00 00 
  802b92:	b8 00 00 00 00       	mov    $0x0,%eax
  802b97:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  802b9e:	00 00 00 
  802ba1:	ff d2                	callq  *%rdx
  802ba3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ba7:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
  802bab:	be 00 00 00 00       	mov    $0x0,%esi
  802bb0:	48 89 c7             	mov    %rax,%rdi
  802bb3:	48 b8 a5 11 80 00 00 	movabs $0x8011a5,%rax
  802bba:	00 00 00 
  802bbd:	ff d0                	callq  *%rax
  802bbf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bc2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802bc6:	79 30                	jns    802bf8 <fs_test+0x32d>
  802bc8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bcb:	89 c1                	mov    %eax,%ecx
  802bcd:	48 ba 3b 79 80 00 00 	movabs $0x80793b,%rdx
  802bd4:	00 00 00 
  802bd7:	be 29 00 00 00       	mov    $0x29,%esi
  802bdc:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802be3:	00 00 00 
  802be6:	b8 00 00 00 00       	mov    $0x0,%eax
  802beb:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  802bf2:	00 00 00 
  802bf5:	41 ff d0             	callq  *%r8
  802bf8:	48 b8 88 20 81 00 00 	movabs $0x812088,%rax
  802bff:	00 00 00 
  802c02:	48 8b 10             	mov    (%rax),%rdx
  802c05:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c09:	48 89 d6             	mov    %rdx,%rsi
  802c0c:	48 89 c7             	mov    %rax,%rdi
  802c0f:	48 b8 0c 44 80 00 00 	movabs $0x80440c,%rax
  802c16:	00 00 00 
  802c19:	ff d0                	callq  *%rax
  802c1b:	85 c0                	test   %eax,%eax
  802c1d:	74 2a                	je     802c49 <fs_test+0x37e>
  802c1f:	48 ba 50 79 80 00 00 	movabs $0x807950,%rdx
  802c26:	00 00 00 
  802c29:	be 2b 00 00 00       	mov    $0x2b,%esi
  802c2e:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802c35:	00 00 00 
  802c38:	b8 00 00 00 00       	mov    $0x0,%eax
  802c3d:	48 b9 e0 34 80 00 00 	movabs $0x8034e0,%rcx
  802c44:	00 00 00 
  802c47:	ff d1                	callq  *%rcx
  802c49:	48 bf 73 79 80 00 00 	movabs $0x807973,%rdi
  802c50:	00 00 00 
  802c53:	b8 00 00 00 00       	mov    $0x0,%eax
  802c58:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  802c5f:	00 00 00 
  802c62:	ff d2                	callq  *%rdx
  802c64:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c68:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802c6c:	0f b6 12             	movzbl (%rdx),%edx
  802c6f:	88 10                	mov    %dl,(%rax)
  802c71:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c75:	48 c1 e8 0c          	shr    $0xc,%rax
  802c79:	48 89 c2             	mov    %rax,%rdx
  802c7c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802c83:	01 00 00 
  802c86:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c8a:	83 e0 40             	and    $0x40,%eax
  802c8d:	48 85 c0             	test   %rax,%rax
  802c90:	75 35                	jne    802cc7 <fs_test+0x3fc>
  802c92:	48 b9 8b 79 80 00 00 	movabs $0x80798b,%rcx
  802c99:	00 00 00 
  802c9c:	48 ba 71 78 80 00 00 	movabs $0x807871,%rdx
  802ca3:	00 00 00 
  802ca6:	be 2f 00 00 00       	mov    $0x2f,%esi
  802cab:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802cb2:	00 00 00 
  802cb5:	b8 00 00 00 00       	mov    $0x0,%eax
  802cba:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  802cc1:	00 00 00 
  802cc4:	41 ff d0             	callq  *%r8
  802cc7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ccb:	48 89 c7             	mov    %rax,%rdi
  802cce:	48 b8 bb 1c 80 00 00 	movabs $0x801cbb,%rax
  802cd5:	00 00 00 
  802cd8:	ff d0                	callq  *%rax
  802cda:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802cde:	48 c1 e8 0c          	shr    $0xc,%rax
  802ce2:	48 89 c2             	mov    %rax,%rdx
  802ce5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802cec:	01 00 00 
  802cef:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802cf3:	83 e0 40             	and    $0x40,%eax
  802cf6:	48 85 c0             	test   %rax,%rax
  802cf9:	74 35                	je     802d30 <fs_test+0x465>
  802cfb:	48 b9 a6 79 80 00 00 	movabs $0x8079a6,%rcx
  802d02:	00 00 00 
  802d05:	48 ba 71 78 80 00 00 	movabs $0x807871,%rdx
  802d0c:	00 00 00 
  802d0f:	be 31 00 00 00       	mov    $0x31,%esi
  802d14:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802d1b:	00 00 00 
  802d1e:	b8 00 00 00 00       	mov    $0x0,%eax
  802d23:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  802d2a:	00 00 00 
  802d2d:	41 ff d0             	callq  *%r8
  802d30:	48 bf c2 79 80 00 00 	movabs $0x8079c2,%rdi
  802d37:	00 00 00 
  802d3a:	b8 00 00 00 00       	mov    $0x0,%eax
  802d3f:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  802d46:	00 00 00 
  802d49:	ff d2                	callq  *%rdx
  802d4b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d4f:	be 00 00 00 00       	mov    $0x0,%esi
  802d54:	48 89 c7             	mov    %rax,%rdi
  802d57:	48 b8 5e 1c 80 00 00 	movabs $0x801c5e,%rax
  802d5e:	00 00 00 
  802d61:	ff d0                	callq  *%rax
  802d63:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d66:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d6a:	79 30                	jns    802d9c <fs_test+0x4d1>
  802d6c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d6f:	89 c1                	mov    %eax,%ecx
  802d71:	48 ba d6 79 80 00 00 	movabs $0x8079d6,%rdx
  802d78:	00 00 00 
  802d7b:	be 35 00 00 00       	mov    $0x35,%esi
  802d80:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802d87:	00 00 00 
  802d8a:	b8 00 00 00 00       	mov    $0x0,%eax
  802d8f:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  802d96:	00 00 00 
  802d99:	41 ff d0             	callq  *%r8
  802d9c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802da0:	8b 80 88 00 00 00    	mov    0x88(%rax),%eax
  802da6:	85 c0                	test   %eax,%eax
  802da8:	74 35                	je     802ddf <fs_test+0x514>
  802daa:	48 b9 e8 79 80 00 00 	movabs $0x8079e8,%rcx
  802db1:	00 00 00 
  802db4:	48 ba 71 78 80 00 00 	movabs $0x807871,%rdx
  802dbb:	00 00 00 
  802dbe:	be 36 00 00 00       	mov    $0x36,%esi
  802dc3:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802dca:	00 00 00 
  802dcd:	b8 00 00 00 00       	mov    $0x0,%eax
  802dd2:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  802dd9:	00 00 00 
  802ddc:	41 ff d0             	callq  *%r8
  802ddf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802de3:	48 c1 e8 0c          	shr    $0xc,%rax
  802de7:	48 89 c2             	mov    %rax,%rdx
  802dea:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802df1:	01 00 00 
  802df4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802df8:	83 e0 40             	and    $0x40,%eax
  802dfb:	48 85 c0             	test   %rax,%rax
  802dfe:	74 35                	je     802e35 <fs_test+0x56a>
  802e00:	48 b9 fc 79 80 00 00 	movabs $0x8079fc,%rcx
  802e07:	00 00 00 
  802e0a:	48 ba 71 78 80 00 00 	movabs $0x807871,%rdx
  802e11:	00 00 00 
  802e14:	be 37 00 00 00       	mov    $0x37,%esi
  802e19:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802e20:	00 00 00 
  802e23:	b8 00 00 00 00       	mov    $0x0,%eax
  802e28:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  802e2f:	00 00 00 
  802e32:	41 ff d0             	callq  *%r8
  802e35:	48 bf 16 7a 80 00 00 	movabs $0x807a16,%rdi
  802e3c:	00 00 00 
  802e3f:	b8 00 00 00 00       	mov    $0x0,%eax
  802e44:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  802e4b:	00 00 00 
  802e4e:	ff d2                	callq  *%rdx
  802e50:	48 b8 88 20 81 00 00 	movabs $0x812088,%rax
  802e57:	00 00 00 
  802e5a:	48 8b 00             	mov    (%rax),%rax
  802e5d:	48 89 c7             	mov    %rax,%rdi
  802e60:	48 b8 3e 42 80 00 00 	movabs $0x80423e,%rax
  802e67:	00 00 00 
  802e6a:	ff d0                	callq  *%rax
  802e6c:	89 c2                	mov    %eax,%edx
  802e6e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e72:	89 d6                	mov    %edx,%esi
  802e74:	48 89 c7             	mov    %rax,%rdi
  802e77:	48 b8 5e 1c 80 00 00 	movabs $0x801c5e,%rax
  802e7e:	00 00 00 
  802e81:	ff d0                	callq  *%rax
  802e83:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e86:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e8a:	79 30                	jns    802ebc <fs_test+0x5f1>
  802e8c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e8f:	89 c1                	mov    %eax,%ecx
  802e91:	48 ba 2d 7a 80 00 00 	movabs $0x807a2d,%rdx
  802e98:	00 00 00 
  802e9b:	be 3b 00 00 00       	mov    $0x3b,%esi
  802ea0:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802ea7:	00 00 00 
  802eaa:	b8 00 00 00 00       	mov    $0x0,%eax
  802eaf:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  802eb6:	00 00 00 
  802eb9:	41 ff d0             	callq  *%r8
  802ebc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ec0:	48 c1 e8 0c          	shr    $0xc,%rax
  802ec4:	48 89 c2             	mov    %rax,%rdx
  802ec7:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802ece:	01 00 00 
  802ed1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ed5:	83 e0 40             	and    $0x40,%eax
  802ed8:	48 85 c0             	test   %rax,%rax
  802edb:	74 35                	je     802f12 <fs_test+0x647>
  802edd:	48 b9 fc 79 80 00 00 	movabs $0x8079fc,%rcx
  802ee4:	00 00 00 
  802ee7:	48 ba 71 78 80 00 00 	movabs $0x807871,%rdx
  802eee:	00 00 00 
  802ef1:	be 3c 00 00 00       	mov    $0x3c,%esi
  802ef6:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802efd:	00 00 00 
  802f00:	b8 00 00 00 00       	mov    $0x0,%eax
  802f05:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  802f0c:	00 00 00 
  802f0f:	41 ff d0             	callq  *%r8
  802f12:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f16:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
  802f1a:	be 00 00 00 00       	mov    $0x0,%esi
  802f1f:	48 89 c7             	mov    %rax,%rdi
  802f22:	48 b8 a5 11 80 00 00 	movabs $0x8011a5,%rax
  802f29:	00 00 00 
  802f2c:	ff d0                	callq  *%rax
  802f2e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f31:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f35:	79 30                	jns    802f67 <fs_test+0x69c>
  802f37:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f3a:	89 c1                	mov    %eax,%ecx
  802f3c:	48 ba 41 7a 80 00 00 	movabs $0x807a41,%rdx
  802f43:	00 00 00 
  802f46:	be 3e 00 00 00       	mov    $0x3e,%esi
  802f4b:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802f52:	00 00 00 
  802f55:	b8 00 00 00 00       	mov    $0x0,%eax
  802f5a:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  802f61:	00 00 00 
  802f64:	41 ff d0             	callq  *%r8
  802f67:	48 b8 88 20 81 00 00 	movabs $0x812088,%rax
  802f6e:	00 00 00 
  802f71:	48 8b 10             	mov    (%rax),%rdx
  802f74:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802f78:	48 89 d6             	mov    %rdx,%rsi
  802f7b:	48 89 c7             	mov    %rax,%rdi
  802f7e:	48 b8 aa 42 80 00 00 	movabs $0x8042aa,%rax
  802f85:	00 00 00 
  802f88:	ff d0                	callq  *%rax
  802f8a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802f8e:	48 c1 e8 0c          	shr    $0xc,%rax
  802f92:	48 89 c2             	mov    %rax,%rdx
  802f95:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802f9c:	01 00 00 
  802f9f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802fa3:	83 e0 40             	and    $0x40,%eax
  802fa6:	48 85 c0             	test   %rax,%rax
  802fa9:	75 35                	jne    802fe0 <fs_test+0x715>
  802fab:	48 b9 8b 79 80 00 00 	movabs $0x80798b,%rcx
  802fb2:	00 00 00 
  802fb5:	48 ba 71 78 80 00 00 	movabs $0x807871,%rdx
  802fbc:	00 00 00 
  802fbf:	be 40 00 00 00       	mov    $0x40,%esi
  802fc4:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  802fcb:	00 00 00 
  802fce:	b8 00 00 00 00       	mov    $0x0,%eax
  802fd3:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  802fda:	00 00 00 
  802fdd:	41 ff d0             	callq  *%r8
  802fe0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fe4:	48 89 c7             	mov    %rax,%rdi
  802fe7:	48 b8 bb 1c 80 00 00 	movabs $0x801cbb,%rax
  802fee:	00 00 00 
  802ff1:	ff d0                	callq  *%rax
  802ff3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ff7:	48 c1 e8 0c          	shr    $0xc,%rax
  802ffb:	48 89 c2             	mov    %rax,%rdx
  802ffe:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803005:	01 00 00 
  803008:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80300c:	83 e0 40             	and    $0x40,%eax
  80300f:	48 85 c0             	test   %rax,%rax
  803012:	74 35                	je     803049 <fs_test+0x77e>
  803014:	48 b9 a6 79 80 00 00 	movabs $0x8079a6,%rcx
  80301b:	00 00 00 
  80301e:	48 ba 71 78 80 00 00 	movabs $0x807871,%rdx
  803025:	00 00 00 
  803028:	be 42 00 00 00       	mov    $0x42,%esi
  80302d:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  803034:	00 00 00 
  803037:	b8 00 00 00 00       	mov    $0x0,%eax
  80303c:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  803043:	00 00 00 
  803046:	41 ff d0             	callq  *%r8
  803049:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80304d:	48 c1 e8 0c          	shr    $0xc,%rax
  803051:	48 89 c2             	mov    %rax,%rdx
  803054:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80305b:	01 00 00 
  80305e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803062:	83 e0 40             	and    $0x40,%eax
  803065:	48 85 c0             	test   %rax,%rax
  803068:	74 35                	je     80309f <fs_test+0x7d4>
  80306a:	48 b9 fc 79 80 00 00 	movabs $0x8079fc,%rcx
  803071:	00 00 00 
  803074:	48 ba 71 78 80 00 00 	movabs $0x807871,%rdx
  80307b:	00 00 00 
  80307e:	be 43 00 00 00       	mov    $0x43,%esi
  803083:	48 bf 39 78 80 00 00 	movabs $0x807839,%rdi
  80308a:	00 00 00 
  80308d:	b8 00 00 00 00       	mov    $0x0,%eax
  803092:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  803099:	00 00 00 
  80309c:	41 ff d0             	callq  *%r8
  80309f:	48 bf 56 7a 80 00 00 	movabs $0x807a56,%rdi
  8030a6:	00 00 00 
  8030a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8030ae:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  8030b5:	00 00 00 
  8030b8:	ff d2                	callq  *%rdx
  8030ba:	90                   	nop
  8030bb:	c9                   	leaveq 
  8030bc:	c3                   	retq   

00000000008030bd <host_fsipc>:
  8030bd:	55                   	push   %rbp
  8030be:	48 89 e5             	mov    %rsp,%rbp
  8030c1:	48 83 ec 10          	sub    $0x10,%rsp
  8030c5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8030c8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8030cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030cf:	b9 07 00 00 00       	mov    $0x7,%ecx
  8030d4:	48 ba 00 50 81 00 00 	movabs $0x815000,%rdx
  8030db:	00 00 00 
  8030de:	89 c6                	mov    %eax,%esi
  8030e0:	bf 01 00 00 00       	mov    $0x1,%edi
  8030e5:	48 b8 8b 52 80 00 00 	movabs $0x80528b,%rax
  8030ec:	00 00 00 
  8030ef:	ff d0                	callq  *%rax
  8030f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030f5:	48 89 c7             	mov    %rax,%rdi
  8030f8:	48 b8 55 52 80 00 00 	movabs $0x805255,%rax
  8030ff:	00 00 00 
  803102:	ff d0                	callq  *%rax
  803104:	c9                   	leaveq 
  803105:	c3                   	retq   

0000000000803106 <get_host_fd>:
  803106:	55                   	push   %rbp
  803107:	48 89 e5             	mov    %rsp,%rbp
  80310a:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  803111:	00 00 00 
  803114:	48 8b 00             	mov    (%rax),%rax
  803117:	5d                   	pop    %rbp
  803118:	c3                   	retq   

0000000000803119 <host_read>:
  803119:	55                   	push   %rbp
  80311a:	48 89 e5             	mov    %rsp,%rbp
  80311d:	48 83 ec 30          	sub    $0x30,%rsp
  803121:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803124:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803128:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80312c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803133:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  80313a:	00 00 00 
  80313d:	48 8b 00             	mov    (%rax),%rax
  803140:	8b 40 0c             	mov    0xc(%rax),%eax
  803143:	85 c0                	test   %eax,%eax
  803145:	75 11                	jne    803158 <host_read+0x3f>
  803147:	b8 00 00 00 00       	mov    $0x0,%eax
  80314c:	48 ba 06 33 80 00 00 	movabs $0x803306,%rdx
  803153:	00 00 00 
  803156:	ff d2                	callq  *%rdx
  803158:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  80315f:	00 00 00 
  803162:	48 8b 00             	mov    (%rax),%rax
  803165:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803168:	c1 e2 09             	shl    $0x9,%edx
  80316b:	89 50 04             	mov    %edx,0x4(%rax)
  80316e:	e9 8c 00 00 00       	jmpq   8031ff <host_read+0xe6>
  803173:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  80317a:	00 00 00 
  80317d:	48 8b 00             	mov    (%rax),%rax
  803180:	8b 50 0c             	mov    0xc(%rax),%edx
  803183:	48 b8 00 50 81 00 00 	movabs $0x815000,%rax
  80318a:	00 00 00 
  80318d:	89 10                	mov    %edx,(%rax)
  80318f:	48 b8 00 50 81 00 00 	movabs $0x815000,%rax
  803196:	00 00 00 
  803199:	48 c7 40 08 00 04 00 	movq   $0x400,0x8(%rax)
  8031a0:	00 
  8031a1:	be 00 00 00 00       	mov    $0x0,%esi
  8031a6:	bf 03 00 00 00       	mov    $0x3,%edi
  8031ab:	48 b8 bd 30 80 00 00 	movabs $0x8030bd,%rax
  8031b2:	00 00 00 
  8031b5:	ff d0                	callq  *%rax
  8031b7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8031ba:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8031be:	79 05                	jns    8031c5 <host_read+0xac>
  8031c0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8031c3:	eb 4a                	jmp    80320f <host_read+0xf6>
  8031c5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8031c8:	48 98                	cltq   
  8031ca:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8031cd:	48 63 ca             	movslq %edx,%rcx
  8031d0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8031d4:	48 01 d1             	add    %rdx,%rcx
  8031d7:	48 89 c2             	mov    %rax,%rdx
  8031da:	48 be 00 50 81 00 00 	movabs $0x815000,%rsi
  8031e1:	00 00 00 
  8031e4:	48 89 cf             	mov    %rcx,%rdi
  8031e7:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  8031ee:	00 00 00 
  8031f1:	ff d0                	callq  *%rax
  8031f3:	81 45 fc 00 04 00 00 	addl   $0x400,-0x4(%rbp)
  8031fa:	48 83 6d d8 02       	subq   $0x2,-0x28(%rbp)
  8031ff:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803204:	0f 85 69 ff ff ff    	jne    803173 <host_read+0x5a>
  80320a:	b8 00 00 00 00       	mov    $0x0,%eax
  80320f:	c9                   	leaveq 
  803210:	c3                   	retq   

0000000000803211 <host_write>:
  803211:	55                   	push   %rbp
  803212:	48 89 e5             	mov    %rsp,%rbp
  803215:	48 83 ec 30          	sub    $0x30,%rsp
  803219:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80321c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803220:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803224:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80322b:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  803232:	00 00 00 
  803235:	48 8b 00             	mov    (%rax),%rax
  803238:	8b 40 0c             	mov    0xc(%rax),%eax
  80323b:	85 c0                	test   %eax,%eax
  80323d:	75 11                	jne    803250 <host_write+0x3f>
  80323f:	b8 00 00 00 00       	mov    $0x0,%eax
  803244:	48 ba 06 33 80 00 00 	movabs $0x803306,%rdx
  80324b:	00 00 00 
  80324e:	ff d2                	callq  *%rdx
  803250:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  803257:	00 00 00 
  80325a:	48 8b 00             	mov    (%rax),%rax
  80325d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803260:	c1 e2 09             	shl    $0x9,%edx
  803263:	89 50 04             	mov    %edx,0x4(%rax)
  803266:	e9 89 00 00 00       	jmpq   8032f4 <host_write+0xe3>
  80326b:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  803272:	00 00 00 
  803275:	48 8b 00             	mov    (%rax),%rax
  803278:	8b 50 0c             	mov    0xc(%rax),%edx
  80327b:	48 b8 00 50 81 00 00 	movabs $0x815000,%rax
  803282:	00 00 00 
  803285:	89 10                	mov    %edx,(%rax)
  803287:	48 b8 00 50 81 00 00 	movabs $0x815000,%rax
  80328e:	00 00 00 
  803291:	48 c7 40 08 00 04 00 	movq   $0x400,0x8(%rax)
  803298:	00 
  803299:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80329c:	48 63 d0             	movslq %eax,%rdx
  80329f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8032a3:	48 01 d0             	add    %rdx,%rax
  8032a6:	ba 00 04 00 00       	mov    $0x400,%edx
  8032ab:	48 89 c6             	mov    %rax,%rsi
  8032ae:	48 bf 10 50 81 00 00 	movabs $0x815010,%rdi
  8032b5:	00 00 00 
  8032b8:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  8032bf:	00 00 00 
  8032c2:	ff d0                	callq  *%rax
  8032c4:	be 00 00 00 00       	mov    $0x0,%esi
  8032c9:	bf 04 00 00 00       	mov    $0x4,%edi
  8032ce:	48 b8 bd 30 80 00 00 	movabs $0x8030bd,%rax
  8032d5:	00 00 00 
  8032d8:	ff d0                	callq  *%rax
  8032da:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8032dd:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8032e1:	79 05                	jns    8032e8 <host_write+0xd7>
  8032e3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8032e6:	eb 1c                	jmp    803304 <host_write+0xf3>
  8032e8:	81 45 fc 00 04 00 00 	addl   $0x400,-0x4(%rbp)
  8032ef:	48 83 6d d8 02       	subq   $0x2,-0x28(%rbp)
  8032f4:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8032f9:	0f 85 6c ff ff ff    	jne    80326b <host_write+0x5a>
  8032ff:	b8 00 00 00 00       	mov    $0x0,%eax
  803304:	c9                   	leaveq 
  803305:	c3                   	retq   

0000000000803306 <host_ipc_init>:
  803306:	55                   	push   %rbp
  803307:	48 89 e5             	mov    %rsp,%rbp
  80330a:	48 83 ec 40          	sub    $0x40,%rsp
  80330e:	48 bf 00 40 81 00 00 	movabs $0x814000,%rdi
  803315:	00 00 00 
  803318:	48 b8 89 53 80 00 00 	movabs $0x805389,%rax
  80331f:	00 00 00 
  803322:	ff d0                	callq  *%rax
  803324:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803327:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80332b:	79 2a                	jns    803357 <host_ipc_init+0x51>
  80332d:	48 ba 6c 7a 80 00 00 	movabs $0x807a6c,%rdx
  803334:	00 00 00 
  803337:	be 53 00 00 00       	mov    $0x53,%esi
  80333c:	48 bf 85 7a 80 00 00 	movabs $0x807a85,%rdi
  803343:	00 00 00 
  803346:	b8 00 00 00 00       	mov    $0x0,%eax
  80334b:	48 b9 e0 34 80 00 00 	movabs $0x8034e0,%rcx
  803352:	00 00 00 
  803355:	ff d1                	callq  *%rcx
  803357:	b8 06 00 00 00       	mov    $0x6,%eax
  80335c:	0f 01 c1             	vmcall 
  80335f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803362:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803365:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  803369:	89 d1                	mov    %edx,%ecx
  80336b:	48 ba 96 7a 80 00 00 	movabs $0x807a96,%rdx
  803372:	00 00 00 
  803375:	be 32 00 00 00       	mov    $0x32,%esi
  80337a:	48 89 c7             	mov    %rax,%rdi
  80337d:	b8 00 00 00 00       	mov    $0x0,%eax
  803382:	49 b8 5d 41 80 00 00 	movabs $0x80415d,%r8
  803389:	00 00 00 
  80338c:	41 ff d0             	callq  *%r8
  80338f:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  803393:	48 89 c6             	mov    %rax,%rsi
  803396:	48 bf 00 50 81 00 00 	movabs $0x815000,%rdi
  80339d:	00 00 00 
  8033a0:	48 b8 aa 42 80 00 00 	movabs $0x8042aa,%rax
  8033a7:	00 00 00 
  8033aa:	ff d0                	callq  *%rax
  8033ac:	48 b8 00 50 81 00 00 	movabs $0x815000,%rax
  8033b3:	00 00 00 
  8033b6:	c7 80 00 04 00 00 02 	movl   $0x2,0x400(%rax)
  8033bd:	00 00 00 
  8033c0:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  8033c7:	00 00 00 
  8033ca:	48 8b 00             	mov    (%rax),%rax
  8033cd:	48 89 c6             	mov    %rax,%rsi
  8033d0:	bf 01 00 00 00       	mov    $0x1,%edi
  8033d5:	48 b8 bd 30 80 00 00 	movabs $0x8030bd,%rax
  8033dc:	00 00 00 
  8033df:	ff d0                	callq  *%rax
  8033e1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033e4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033e8:	79 4b                	jns    803435 <host_ipc_init+0x12f>
  8033ea:	48 b8 00 40 81 00 00 	movabs $0x814000,%rax
  8033f1:	00 00 00 
  8033f4:	48 8b 00             	mov    (%rax),%rax
  8033f7:	be 00 00 00 00       	mov    $0x0,%esi
  8033fc:	48 89 c7             	mov    %rax,%rdi
  8033ff:	48 b8 b1 54 80 00 00 	movabs $0x8054b1,%rax
  803406:	00 00 00 
  803409:	ff d0                	callq  *%rax
  80340b:	48 ba a4 7a 80 00 00 	movabs $0x807aa4,%rdx
  803412:	00 00 00 
  803415:	be 5b 00 00 00       	mov    $0x5b,%esi
  80341a:	48 bf 85 7a 80 00 00 	movabs $0x807a85,%rdi
  803421:	00 00 00 
  803424:	b8 00 00 00 00       	mov    $0x0,%eax
  803429:	48 b9 e0 34 80 00 00 	movabs $0x8034e0,%rcx
  803430:	00 00 00 
  803433:	ff d1                	callq  *%rcx
  803435:	90                   	nop
  803436:	c9                   	leaveq 
  803437:	c3                   	retq   

0000000000803438 <libmain>:
  803438:	55                   	push   %rbp
  803439:	48 89 e5             	mov    %rsp,%rbp
  80343c:	48 83 ec 10          	sub    $0x10,%rsp
  803440:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803443:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803447:	48 b8 61 4b 80 00 00 	movabs $0x804b61,%rax
  80344e:	00 00 00 
  803451:	ff d0                	callq  *%rax
  803453:	25 ff 03 00 00       	and    $0x3ff,%eax
  803458:	48 98                	cltq   
  80345a:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  803461:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803468:	00 00 00 
  80346b:	48 01 c2             	add    %rax,%rdx
  80346e:	48 b8 20 60 81 00 00 	movabs $0x816020,%rax
  803475:	00 00 00 
  803478:	48 89 10             	mov    %rdx,(%rax)
  80347b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80347f:	7e 14                	jle    803495 <libmain+0x5d>
  803481:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803485:	48 8b 10             	mov    (%rax),%rdx
  803488:	48 b8 90 20 81 00 00 	movabs $0x812090,%rax
  80348f:	00 00 00 
  803492:	48 89 10             	mov    %rdx,(%rax)
  803495:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803499:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80349c:	48 89 d6             	mov    %rdx,%rsi
  80349f:	89 c7                	mov    %eax,%edi
  8034a1:	48 b8 32 28 80 00 00 	movabs $0x802832,%rax
  8034a8:	00 00 00 
  8034ab:	ff d0                	callq  *%rax
  8034ad:	48 b8 bc 34 80 00 00 	movabs $0x8034bc,%rax
  8034b4:	00 00 00 
  8034b7:	ff d0                	callq  *%rax
  8034b9:	90                   	nop
  8034ba:	c9                   	leaveq 
  8034bb:	c3                   	retq   

00000000008034bc <exit>:
  8034bc:	55                   	push   %rbp
  8034bd:	48 89 e5             	mov    %rsp,%rbp
  8034c0:	48 b8 7e 56 80 00 00 	movabs $0x80567e,%rax
  8034c7:	00 00 00 
  8034ca:	ff d0                	callq  *%rax
  8034cc:	bf 00 00 00 00       	mov    $0x0,%edi
  8034d1:	48 b8 1b 4b 80 00 00 	movabs $0x804b1b,%rax
  8034d8:	00 00 00 
  8034db:	ff d0                	callq  *%rax
  8034dd:	90                   	nop
  8034de:	5d                   	pop    %rbp
  8034df:	c3                   	retq   

00000000008034e0 <_panic>:
  8034e0:	55                   	push   %rbp
  8034e1:	48 89 e5             	mov    %rsp,%rbp
  8034e4:	53                   	push   %rbx
  8034e5:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8034ec:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8034f3:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8034f9:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803500:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  803507:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  80350e:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  803515:	84 c0                	test   %al,%al
  803517:	74 23                	je     80353c <_panic+0x5c>
  803519:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  803520:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  803524:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  803528:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80352c:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  803530:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  803534:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  803538:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80353c:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  803543:	00 00 00 
  803546:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80354d:	00 00 00 
  803550:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803554:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80355b:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  803562:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803569:	48 b8 90 20 81 00 00 	movabs $0x812090,%rax
  803570:	00 00 00 
  803573:	48 8b 18             	mov    (%rax),%rbx
  803576:	48 b8 61 4b 80 00 00 	movabs $0x804b61,%rax
  80357d:	00 00 00 
  803580:	ff d0                	callq  *%rax
  803582:	89 c6                	mov    %eax,%esi
  803584:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  80358a:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803591:	41 89 d0             	mov    %edx,%r8d
  803594:	48 89 c1             	mov    %rax,%rcx
  803597:	48 89 da             	mov    %rbx,%rdx
  80359a:	48 bf c8 7a 80 00 00 	movabs $0x807ac8,%rdi
  8035a1:	00 00 00 
  8035a4:	b8 00 00 00 00       	mov    $0x0,%eax
  8035a9:	49 b9 1a 37 80 00 00 	movabs $0x80371a,%r9
  8035b0:	00 00 00 
  8035b3:	41 ff d1             	callq  *%r9
  8035b6:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8035bd:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8035c4:	48 89 d6             	mov    %rdx,%rsi
  8035c7:	48 89 c7             	mov    %rax,%rdi
  8035ca:	48 b8 6e 36 80 00 00 	movabs $0x80366e,%rax
  8035d1:	00 00 00 
  8035d4:	ff d0                	callq  *%rax
  8035d6:	48 bf eb 7a 80 00 00 	movabs $0x807aeb,%rdi
  8035dd:	00 00 00 
  8035e0:	b8 00 00 00 00       	mov    $0x0,%eax
  8035e5:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  8035ec:	00 00 00 
  8035ef:	ff d2                	callq  *%rdx
  8035f1:	cc                   	int3   
  8035f2:	eb fd                	jmp    8035f1 <_panic+0x111>

00000000008035f4 <putch>:
  8035f4:	55                   	push   %rbp
  8035f5:	48 89 e5             	mov    %rsp,%rbp
  8035f8:	48 83 ec 10          	sub    $0x10,%rsp
  8035fc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8035ff:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803603:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803607:	8b 00                	mov    (%rax),%eax
  803609:	8d 48 01             	lea    0x1(%rax),%ecx
  80360c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803610:	89 0a                	mov    %ecx,(%rdx)
  803612:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803615:	89 d1                	mov    %edx,%ecx
  803617:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80361b:	48 98                	cltq   
  80361d:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803621:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803625:	8b 00                	mov    (%rax),%eax
  803627:	3d ff 00 00 00       	cmp    $0xff,%eax
  80362c:	75 2c                	jne    80365a <putch+0x66>
  80362e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803632:	8b 00                	mov    (%rax),%eax
  803634:	48 98                	cltq   
  803636:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80363a:	48 83 c2 08          	add    $0x8,%rdx
  80363e:	48 89 c6             	mov    %rax,%rsi
  803641:	48 89 d7             	mov    %rdx,%rdi
  803644:	48 b8 92 4a 80 00 00 	movabs $0x804a92,%rax
  80364b:	00 00 00 
  80364e:	ff d0                	callq  *%rax
  803650:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803654:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80365a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80365e:	8b 40 04             	mov    0x4(%rax),%eax
  803661:	8d 50 01             	lea    0x1(%rax),%edx
  803664:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803668:	89 50 04             	mov    %edx,0x4(%rax)
  80366b:	90                   	nop
  80366c:	c9                   	leaveq 
  80366d:	c3                   	retq   

000000000080366e <vcprintf>:
  80366e:	55                   	push   %rbp
  80366f:	48 89 e5             	mov    %rsp,%rbp
  803672:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  803679:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  803680:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  803687:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  80368e:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  803695:	48 8b 0a             	mov    (%rdx),%rcx
  803698:	48 89 08             	mov    %rcx,(%rax)
  80369b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80369f:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8036a3:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8036a7:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8036ab:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8036b2:	00 00 00 
  8036b5:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8036bc:	00 00 00 
  8036bf:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8036c6:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8036cd:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8036d4:	48 89 c6             	mov    %rax,%rsi
  8036d7:	48 bf f4 35 80 00 00 	movabs $0x8035f4,%rdi
  8036de:	00 00 00 
  8036e1:	48 b8 b8 3a 80 00 00 	movabs $0x803ab8,%rax
  8036e8:	00 00 00 
  8036eb:	ff d0                	callq  *%rax
  8036ed:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8036f3:	48 98                	cltq   
  8036f5:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8036fc:	48 83 c2 08          	add    $0x8,%rdx
  803700:	48 89 c6             	mov    %rax,%rsi
  803703:	48 89 d7             	mov    %rdx,%rdi
  803706:	48 b8 92 4a 80 00 00 	movabs $0x804a92,%rax
  80370d:	00 00 00 
  803710:	ff d0                	callq  *%rax
  803712:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  803718:	c9                   	leaveq 
  803719:	c3                   	retq   

000000000080371a <cprintf>:
  80371a:	55                   	push   %rbp
  80371b:	48 89 e5             	mov    %rsp,%rbp
  80371e:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  803725:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80372c:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  803733:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80373a:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803741:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803748:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80374f:	84 c0                	test   %al,%al
  803751:	74 20                	je     803773 <cprintf+0x59>
  803753:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803757:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80375b:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80375f:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803763:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803767:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80376b:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80376f:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803773:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80377a:	00 00 00 
  80377d:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  803784:	00 00 00 
  803787:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80378b:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803792:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  803799:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8037a0:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8037a7:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8037ae:	48 8b 0a             	mov    (%rdx),%rcx
  8037b1:	48 89 08             	mov    %rcx,(%rax)
  8037b4:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8037b8:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8037bc:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8037c0:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8037c4:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8037cb:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8037d2:	48 89 d6             	mov    %rdx,%rsi
  8037d5:	48 89 c7             	mov    %rax,%rdi
  8037d8:	48 b8 6e 36 80 00 00 	movabs $0x80366e,%rax
  8037df:	00 00 00 
  8037e2:	ff d0                	callq  *%rax
  8037e4:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8037ea:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8037f0:	c9                   	leaveq 
  8037f1:	c3                   	retq   

00000000008037f2 <printnum>:
  8037f2:	55                   	push   %rbp
  8037f3:	48 89 e5             	mov    %rsp,%rbp
  8037f6:	48 83 ec 30          	sub    $0x30,%rsp
  8037fa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8037fe:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803802:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803806:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  803809:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  80380d:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  803811:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803814:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  803818:	77 54                	ja     80386e <printnum+0x7c>
  80381a:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80381d:	8d 78 ff             	lea    -0x1(%rax),%edi
  803820:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  803823:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803827:	ba 00 00 00 00       	mov    $0x0,%edx
  80382c:	48 f7 f6             	div    %rsi
  80382f:	49 89 c2             	mov    %rax,%r10
  803832:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  803835:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803838:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80383c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803840:	41 89 c9             	mov    %ecx,%r9d
  803843:	41 89 f8             	mov    %edi,%r8d
  803846:	89 d1                	mov    %edx,%ecx
  803848:	4c 89 d2             	mov    %r10,%rdx
  80384b:	48 89 c7             	mov    %rax,%rdi
  80384e:	48 b8 f2 37 80 00 00 	movabs $0x8037f2,%rax
  803855:	00 00 00 
  803858:	ff d0                	callq  *%rax
  80385a:	eb 1c                	jmp    803878 <printnum+0x86>
  80385c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803860:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803863:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803867:	48 89 ce             	mov    %rcx,%rsi
  80386a:	89 d7                	mov    %edx,%edi
  80386c:	ff d0                	callq  *%rax
  80386e:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  803872:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  803876:	7f e4                	jg     80385c <printnum+0x6a>
  803878:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80387b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80387f:	ba 00 00 00 00       	mov    $0x0,%edx
  803884:	48 f7 f1             	div    %rcx
  803887:	48 b8 f0 7c 80 00 00 	movabs $0x807cf0,%rax
  80388e:	00 00 00 
  803891:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  803895:	0f be d0             	movsbl %al,%edx
  803898:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80389c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038a0:	48 89 ce             	mov    %rcx,%rsi
  8038a3:	89 d7                	mov    %edx,%edi
  8038a5:	ff d0                	callq  *%rax
  8038a7:	90                   	nop
  8038a8:	c9                   	leaveq 
  8038a9:	c3                   	retq   

00000000008038aa <getuint>:
  8038aa:	55                   	push   %rbp
  8038ab:	48 89 e5             	mov    %rsp,%rbp
  8038ae:	48 83 ec 20          	sub    $0x20,%rsp
  8038b2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8038b6:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8038b9:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8038bd:	7e 4f                	jle    80390e <getuint+0x64>
  8038bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038c3:	8b 00                	mov    (%rax),%eax
  8038c5:	83 f8 30             	cmp    $0x30,%eax
  8038c8:	73 24                	jae    8038ee <getuint+0x44>
  8038ca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038ce:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8038d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038d6:	8b 00                	mov    (%rax),%eax
  8038d8:	89 c0                	mov    %eax,%eax
  8038da:	48 01 d0             	add    %rdx,%rax
  8038dd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8038e1:	8b 12                	mov    (%rdx),%edx
  8038e3:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8038e6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8038ea:	89 0a                	mov    %ecx,(%rdx)
  8038ec:	eb 14                	jmp    803902 <getuint+0x58>
  8038ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038f2:	48 8b 40 08          	mov    0x8(%rax),%rax
  8038f6:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8038fa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8038fe:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  803902:	48 8b 00             	mov    (%rax),%rax
  803905:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803909:	e9 9d 00 00 00       	jmpq   8039ab <getuint+0x101>
  80390e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  803912:	74 4c                	je     803960 <getuint+0xb6>
  803914:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803918:	8b 00                	mov    (%rax),%eax
  80391a:	83 f8 30             	cmp    $0x30,%eax
  80391d:	73 24                	jae    803943 <getuint+0x99>
  80391f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803923:	48 8b 50 10          	mov    0x10(%rax),%rdx
  803927:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80392b:	8b 00                	mov    (%rax),%eax
  80392d:	89 c0                	mov    %eax,%eax
  80392f:	48 01 d0             	add    %rdx,%rax
  803932:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803936:	8b 12                	mov    (%rdx),%edx
  803938:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80393b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80393f:	89 0a                	mov    %ecx,(%rdx)
  803941:	eb 14                	jmp    803957 <getuint+0xad>
  803943:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803947:	48 8b 40 08          	mov    0x8(%rax),%rax
  80394b:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80394f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803953:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  803957:	48 8b 00             	mov    (%rax),%rax
  80395a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80395e:	eb 4b                	jmp    8039ab <getuint+0x101>
  803960:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803964:	8b 00                	mov    (%rax),%eax
  803966:	83 f8 30             	cmp    $0x30,%eax
  803969:	73 24                	jae    80398f <getuint+0xe5>
  80396b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80396f:	48 8b 50 10          	mov    0x10(%rax),%rdx
  803973:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803977:	8b 00                	mov    (%rax),%eax
  803979:	89 c0                	mov    %eax,%eax
  80397b:	48 01 d0             	add    %rdx,%rax
  80397e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803982:	8b 12                	mov    (%rdx),%edx
  803984:	8d 4a 08             	lea    0x8(%rdx),%ecx
  803987:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80398b:	89 0a                	mov    %ecx,(%rdx)
  80398d:	eb 14                	jmp    8039a3 <getuint+0xf9>
  80398f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803993:	48 8b 40 08          	mov    0x8(%rax),%rax
  803997:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80399b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80399f:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8039a3:	8b 00                	mov    (%rax),%eax
  8039a5:	89 c0                	mov    %eax,%eax
  8039a7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8039ab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039af:	c9                   	leaveq 
  8039b0:	c3                   	retq   

00000000008039b1 <getint>:
  8039b1:	55                   	push   %rbp
  8039b2:	48 89 e5             	mov    %rsp,%rbp
  8039b5:	48 83 ec 20          	sub    $0x20,%rsp
  8039b9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8039bd:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8039c0:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8039c4:	7e 4f                	jle    803a15 <getint+0x64>
  8039c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039ca:	8b 00                	mov    (%rax),%eax
  8039cc:	83 f8 30             	cmp    $0x30,%eax
  8039cf:	73 24                	jae    8039f5 <getint+0x44>
  8039d1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039d5:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8039d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039dd:	8b 00                	mov    (%rax),%eax
  8039df:	89 c0                	mov    %eax,%eax
  8039e1:	48 01 d0             	add    %rdx,%rax
  8039e4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8039e8:	8b 12                	mov    (%rdx),%edx
  8039ea:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8039ed:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8039f1:	89 0a                	mov    %ecx,(%rdx)
  8039f3:	eb 14                	jmp    803a09 <getint+0x58>
  8039f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039f9:	48 8b 40 08          	mov    0x8(%rax),%rax
  8039fd:	48 8d 48 08          	lea    0x8(%rax),%rcx
  803a01:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803a05:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  803a09:	48 8b 00             	mov    (%rax),%rax
  803a0c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803a10:	e9 9d 00 00 00       	jmpq   803ab2 <getint+0x101>
  803a15:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  803a19:	74 4c                	je     803a67 <getint+0xb6>
  803a1b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a1f:	8b 00                	mov    (%rax),%eax
  803a21:	83 f8 30             	cmp    $0x30,%eax
  803a24:	73 24                	jae    803a4a <getint+0x99>
  803a26:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a2a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  803a2e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a32:	8b 00                	mov    (%rax),%eax
  803a34:	89 c0                	mov    %eax,%eax
  803a36:	48 01 d0             	add    %rdx,%rax
  803a39:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803a3d:	8b 12                	mov    (%rdx),%edx
  803a3f:	8d 4a 08             	lea    0x8(%rdx),%ecx
  803a42:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803a46:	89 0a                	mov    %ecx,(%rdx)
  803a48:	eb 14                	jmp    803a5e <getint+0xad>
  803a4a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a4e:	48 8b 40 08          	mov    0x8(%rax),%rax
  803a52:	48 8d 48 08          	lea    0x8(%rax),%rcx
  803a56:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803a5a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  803a5e:	48 8b 00             	mov    (%rax),%rax
  803a61:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803a65:	eb 4b                	jmp    803ab2 <getint+0x101>
  803a67:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a6b:	8b 00                	mov    (%rax),%eax
  803a6d:	83 f8 30             	cmp    $0x30,%eax
  803a70:	73 24                	jae    803a96 <getint+0xe5>
  803a72:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a76:	48 8b 50 10          	mov    0x10(%rax),%rdx
  803a7a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a7e:	8b 00                	mov    (%rax),%eax
  803a80:	89 c0                	mov    %eax,%eax
  803a82:	48 01 d0             	add    %rdx,%rax
  803a85:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803a89:	8b 12                	mov    (%rdx),%edx
  803a8b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  803a8e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803a92:	89 0a                	mov    %ecx,(%rdx)
  803a94:	eb 14                	jmp    803aaa <getint+0xf9>
  803a96:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a9a:	48 8b 40 08          	mov    0x8(%rax),%rax
  803a9e:	48 8d 48 08          	lea    0x8(%rax),%rcx
  803aa2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803aa6:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  803aaa:	8b 00                	mov    (%rax),%eax
  803aac:	48 98                	cltq   
  803aae:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803ab2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ab6:	c9                   	leaveq 
  803ab7:	c3                   	retq   

0000000000803ab8 <vprintfmt>:
  803ab8:	55                   	push   %rbp
  803ab9:	48 89 e5             	mov    %rsp,%rbp
  803abc:	41 54                	push   %r12
  803abe:	53                   	push   %rbx
  803abf:	48 83 ec 60          	sub    $0x60,%rsp
  803ac3:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  803ac7:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  803acb:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  803acf:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  803ad3:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803ad7:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  803adb:	48 8b 0a             	mov    (%rdx),%rcx
  803ade:	48 89 08             	mov    %rcx,(%rax)
  803ae1:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  803ae5:	48 89 48 08          	mov    %rcx,0x8(%rax)
  803ae9:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  803aed:	48 89 50 10          	mov    %rdx,0x10(%rax)
  803af1:	eb 17                	jmp    803b0a <vprintfmt+0x52>
  803af3:	85 db                	test   %ebx,%ebx
  803af5:	0f 84 b9 04 00 00    	je     803fb4 <vprintfmt+0x4fc>
  803afb:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803aff:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803b03:	48 89 d6             	mov    %rdx,%rsi
  803b06:	89 df                	mov    %ebx,%edi
  803b08:	ff d0                	callq  *%rax
  803b0a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  803b0e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803b12:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  803b16:	0f b6 00             	movzbl (%rax),%eax
  803b19:	0f b6 d8             	movzbl %al,%ebx
  803b1c:	83 fb 25             	cmp    $0x25,%ebx
  803b1f:	75 d2                	jne    803af3 <vprintfmt+0x3b>
  803b21:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  803b25:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  803b2c:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  803b33:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  803b3a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  803b41:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  803b45:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803b49:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  803b4d:	0f b6 00             	movzbl (%rax),%eax
  803b50:	0f b6 d8             	movzbl %al,%ebx
  803b53:	8d 43 dd             	lea    -0x23(%rbx),%eax
  803b56:	83 f8 55             	cmp    $0x55,%eax
  803b59:	0f 87 22 04 00 00    	ja     803f81 <vprintfmt+0x4c9>
  803b5f:	89 c0                	mov    %eax,%eax
  803b61:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803b68:	00 
  803b69:	48 b8 18 7d 80 00 00 	movabs $0x807d18,%rax
  803b70:	00 00 00 
  803b73:	48 01 d0             	add    %rdx,%rax
  803b76:	48 8b 00             	mov    (%rax),%rax
  803b79:	ff e0                	jmpq   *%rax
  803b7b:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  803b7f:	eb c0                	jmp    803b41 <vprintfmt+0x89>
  803b81:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  803b85:	eb ba                	jmp    803b41 <vprintfmt+0x89>
  803b87:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  803b8e:	8b 55 d8             	mov    -0x28(%rbp),%edx
  803b91:	89 d0                	mov    %edx,%eax
  803b93:	c1 e0 02             	shl    $0x2,%eax
  803b96:	01 d0                	add    %edx,%eax
  803b98:	01 c0                	add    %eax,%eax
  803b9a:	01 d8                	add    %ebx,%eax
  803b9c:	83 e8 30             	sub    $0x30,%eax
  803b9f:	89 45 d8             	mov    %eax,-0x28(%rbp)
  803ba2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  803ba6:	0f b6 00             	movzbl (%rax),%eax
  803ba9:	0f be d8             	movsbl %al,%ebx
  803bac:	83 fb 2f             	cmp    $0x2f,%ebx
  803baf:	7e 60                	jle    803c11 <vprintfmt+0x159>
  803bb1:	83 fb 39             	cmp    $0x39,%ebx
  803bb4:	7f 5b                	jg     803c11 <vprintfmt+0x159>
  803bb6:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  803bbb:	eb d1                	jmp    803b8e <vprintfmt+0xd6>
  803bbd:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803bc0:	83 f8 30             	cmp    $0x30,%eax
  803bc3:	73 17                	jae    803bdc <vprintfmt+0x124>
  803bc5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803bc9:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803bcc:	89 d2                	mov    %edx,%edx
  803bce:	48 01 d0             	add    %rdx,%rax
  803bd1:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803bd4:	83 c2 08             	add    $0x8,%edx
  803bd7:	89 55 b8             	mov    %edx,-0x48(%rbp)
  803bda:	eb 0c                	jmp    803be8 <vprintfmt+0x130>
  803bdc:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803be0:	48 8d 50 08          	lea    0x8(%rax),%rdx
  803be4:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  803be8:	8b 00                	mov    (%rax),%eax
  803bea:	89 45 d8             	mov    %eax,-0x28(%rbp)
  803bed:	eb 23                	jmp    803c12 <vprintfmt+0x15a>
  803bef:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  803bf3:	0f 89 48 ff ff ff    	jns    803b41 <vprintfmt+0x89>
  803bf9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  803c00:	e9 3c ff ff ff       	jmpq   803b41 <vprintfmt+0x89>
  803c05:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  803c0c:	e9 30 ff ff ff       	jmpq   803b41 <vprintfmt+0x89>
  803c11:	90                   	nop
  803c12:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  803c16:	0f 89 25 ff ff ff    	jns    803b41 <vprintfmt+0x89>
  803c1c:	8b 45 d8             	mov    -0x28(%rbp),%eax
  803c1f:	89 45 dc             	mov    %eax,-0x24(%rbp)
  803c22:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  803c29:	e9 13 ff ff ff       	jmpq   803b41 <vprintfmt+0x89>
  803c2e:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  803c32:	e9 0a ff ff ff       	jmpq   803b41 <vprintfmt+0x89>
  803c37:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803c3a:	83 f8 30             	cmp    $0x30,%eax
  803c3d:	73 17                	jae    803c56 <vprintfmt+0x19e>
  803c3f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803c43:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803c46:	89 d2                	mov    %edx,%edx
  803c48:	48 01 d0             	add    %rdx,%rax
  803c4b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803c4e:	83 c2 08             	add    $0x8,%edx
  803c51:	89 55 b8             	mov    %edx,-0x48(%rbp)
  803c54:	eb 0c                	jmp    803c62 <vprintfmt+0x1aa>
  803c56:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803c5a:	48 8d 50 08          	lea    0x8(%rax),%rdx
  803c5e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  803c62:	8b 10                	mov    (%rax),%edx
  803c64:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  803c68:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803c6c:	48 89 ce             	mov    %rcx,%rsi
  803c6f:	89 d7                	mov    %edx,%edi
  803c71:	ff d0                	callq  *%rax
  803c73:	e9 37 03 00 00       	jmpq   803faf <vprintfmt+0x4f7>
  803c78:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803c7b:	83 f8 30             	cmp    $0x30,%eax
  803c7e:	73 17                	jae    803c97 <vprintfmt+0x1df>
  803c80:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803c84:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803c87:	89 d2                	mov    %edx,%edx
  803c89:	48 01 d0             	add    %rdx,%rax
  803c8c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803c8f:	83 c2 08             	add    $0x8,%edx
  803c92:	89 55 b8             	mov    %edx,-0x48(%rbp)
  803c95:	eb 0c                	jmp    803ca3 <vprintfmt+0x1eb>
  803c97:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803c9b:	48 8d 50 08          	lea    0x8(%rax),%rdx
  803c9f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  803ca3:	8b 18                	mov    (%rax),%ebx
  803ca5:	85 db                	test   %ebx,%ebx
  803ca7:	79 02                	jns    803cab <vprintfmt+0x1f3>
  803ca9:	f7 db                	neg    %ebx
  803cab:	83 fb 15             	cmp    $0x15,%ebx
  803cae:	7f 16                	jg     803cc6 <vprintfmt+0x20e>
  803cb0:	48 b8 40 7c 80 00 00 	movabs $0x807c40,%rax
  803cb7:	00 00 00 
  803cba:	48 63 d3             	movslq %ebx,%rdx
  803cbd:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  803cc1:	4d 85 e4             	test   %r12,%r12
  803cc4:	75 2e                	jne    803cf4 <vprintfmt+0x23c>
  803cc6:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  803cca:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803cce:	89 d9                	mov    %ebx,%ecx
  803cd0:	48 ba 01 7d 80 00 00 	movabs $0x807d01,%rdx
  803cd7:	00 00 00 
  803cda:	48 89 c7             	mov    %rax,%rdi
  803cdd:	b8 00 00 00 00       	mov    $0x0,%eax
  803ce2:	49 b8 be 3f 80 00 00 	movabs $0x803fbe,%r8
  803ce9:	00 00 00 
  803cec:	41 ff d0             	callq  *%r8
  803cef:	e9 bb 02 00 00       	jmpq   803faf <vprintfmt+0x4f7>
  803cf4:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  803cf8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803cfc:	4c 89 e1             	mov    %r12,%rcx
  803cff:	48 ba 0a 7d 80 00 00 	movabs $0x807d0a,%rdx
  803d06:	00 00 00 
  803d09:	48 89 c7             	mov    %rax,%rdi
  803d0c:	b8 00 00 00 00       	mov    $0x0,%eax
  803d11:	49 b8 be 3f 80 00 00 	movabs $0x803fbe,%r8
  803d18:	00 00 00 
  803d1b:	41 ff d0             	callq  *%r8
  803d1e:	e9 8c 02 00 00       	jmpq   803faf <vprintfmt+0x4f7>
  803d23:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803d26:	83 f8 30             	cmp    $0x30,%eax
  803d29:	73 17                	jae    803d42 <vprintfmt+0x28a>
  803d2b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803d2f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803d32:	89 d2                	mov    %edx,%edx
  803d34:	48 01 d0             	add    %rdx,%rax
  803d37:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803d3a:	83 c2 08             	add    $0x8,%edx
  803d3d:	89 55 b8             	mov    %edx,-0x48(%rbp)
  803d40:	eb 0c                	jmp    803d4e <vprintfmt+0x296>
  803d42:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803d46:	48 8d 50 08          	lea    0x8(%rax),%rdx
  803d4a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  803d4e:	4c 8b 20             	mov    (%rax),%r12
  803d51:	4d 85 e4             	test   %r12,%r12
  803d54:	75 0a                	jne    803d60 <vprintfmt+0x2a8>
  803d56:	49 bc 0d 7d 80 00 00 	movabs $0x807d0d,%r12
  803d5d:	00 00 00 
  803d60:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  803d64:	7e 78                	jle    803dde <vprintfmt+0x326>
  803d66:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  803d6a:	74 72                	je     803dde <vprintfmt+0x326>
  803d6c:	8b 45 d8             	mov    -0x28(%rbp),%eax
  803d6f:	48 98                	cltq   
  803d71:	48 89 c6             	mov    %rax,%rsi
  803d74:	4c 89 e7             	mov    %r12,%rdi
  803d77:	48 b8 6c 42 80 00 00 	movabs $0x80426c,%rax
  803d7e:	00 00 00 
  803d81:	ff d0                	callq  *%rax
  803d83:	29 45 dc             	sub    %eax,-0x24(%rbp)
  803d86:	eb 17                	jmp    803d9f <vprintfmt+0x2e7>
  803d88:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  803d8c:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  803d90:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803d94:	48 89 ce             	mov    %rcx,%rsi
  803d97:	89 d7                	mov    %edx,%edi
  803d99:	ff d0                	callq  *%rax
  803d9b:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  803d9f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  803da3:	7f e3                	jg     803d88 <vprintfmt+0x2d0>
  803da5:	eb 37                	jmp    803dde <vprintfmt+0x326>
  803da7:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  803dab:	74 1e                	je     803dcb <vprintfmt+0x313>
  803dad:	83 fb 1f             	cmp    $0x1f,%ebx
  803db0:	7e 05                	jle    803db7 <vprintfmt+0x2ff>
  803db2:	83 fb 7e             	cmp    $0x7e,%ebx
  803db5:	7e 14                	jle    803dcb <vprintfmt+0x313>
  803db7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803dbb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803dbf:	48 89 d6             	mov    %rdx,%rsi
  803dc2:	bf 3f 00 00 00       	mov    $0x3f,%edi
  803dc7:	ff d0                	callq  *%rax
  803dc9:	eb 0f                	jmp    803dda <vprintfmt+0x322>
  803dcb:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803dcf:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803dd3:	48 89 d6             	mov    %rdx,%rsi
  803dd6:	89 df                	mov    %ebx,%edi
  803dd8:	ff d0                	callq  *%rax
  803dda:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  803dde:	4c 89 e0             	mov    %r12,%rax
  803de1:	4c 8d 60 01          	lea    0x1(%rax),%r12
  803de5:	0f b6 00             	movzbl (%rax),%eax
  803de8:	0f be d8             	movsbl %al,%ebx
  803deb:	85 db                	test   %ebx,%ebx
  803ded:	74 28                	je     803e17 <vprintfmt+0x35f>
  803def:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  803df3:	78 b2                	js     803da7 <vprintfmt+0x2ef>
  803df5:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  803df9:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  803dfd:	79 a8                	jns    803da7 <vprintfmt+0x2ef>
  803dff:	eb 16                	jmp    803e17 <vprintfmt+0x35f>
  803e01:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803e05:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803e09:	48 89 d6             	mov    %rdx,%rsi
  803e0c:	bf 20 00 00 00       	mov    $0x20,%edi
  803e11:	ff d0                	callq  *%rax
  803e13:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  803e17:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  803e1b:	7f e4                	jg     803e01 <vprintfmt+0x349>
  803e1d:	e9 8d 01 00 00       	jmpq   803faf <vprintfmt+0x4f7>
  803e22:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803e26:	be 03 00 00 00       	mov    $0x3,%esi
  803e2b:	48 89 c7             	mov    %rax,%rdi
  803e2e:	48 b8 b1 39 80 00 00 	movabs $0x8039b1,%rax
  803e35:	00 00 00 
  803e38:	ff d0                	callq  *%rax
  803e3a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803e3e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e42:	48 85 c0             	test   %rax,%rax
  803e45:	79 1d                	jns    803e64 <vprintfmt+0x3ac>
  803e47:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803e4b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803e4f:	48 89 d6             	mov    %rdx,%rsi
  803e52:	bf 2d 00 00 00       	mov    $0x2d,%edi
  803e57:	ff d0                	callq  *%rax
  803e59:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e5d:	48 f7 d8             	neg    %rax
  803e60:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803e64:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  803e6b:	e9 d2 00 00 00       	jmpq   803f42 <vprintfmt+0x48a>
  803e70:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803e74:	be 03 00 00 00       	mov    $0x3,%esi
  803e79:	48 89 c7             	mov    %rax,%rdi
  803e7c:	48 b8 aa 38 80 00 00 	movabs $0x8038aa,%rax
  803e83:	00 00 00 
  803e86:	ff d0                	callq  *%rax
  803e88:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803e8c:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  803e93:	e9 aa 00 00 00       	jmpq   803f42 <vprintfmt+0x48a>
  803e98:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803e9c:	be 03 00 00 00       	mov    $0x3,%esi
  803ea1:	48 89 c7             	mov    %rax,%rdi
  803ea4:	48 b8 aa 38 80 00 00 	movabs $0x8038aa,%rax
  803eab:	00 00 00 
  803eae:	ff d0                	callq  *%rax
  803eb0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803eb4:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  803ebb:	e9 82 00 00 00       	jmpq   803f42 <vprintfmt+0x48a>
  803ec0:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803ec4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803ec8:	48 89 d6             	mov    %rdx,%rsi
  803ecb:	bf 30 00 00 00       	mov    $0x30,%edi
  803ed0:	ff d0                	callq  *%rax
  803ed2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803ed6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803eda:	48 89 d6             	mov    %rdx,%rsi
  803edd:	bf 78 00 00 00       	mov    $0x78,%edi
  803ee2:	ff d0                	callq  *%rax
  803ee4:	8b 45 b8             	mov    -0x48(%rbp),%eax
  803ee7:	83 f8 30             	cmp    $0x30,%eax
  803eea:	73 17                	jae    803f03 <vprintfmt+0x44b>
  803eec:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803ef0:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803ef3:	89 d2                	mov    %edx,%edx
  803ef5:	48 01 d0             	add    %rdx,%rax
  803ef8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  803efb:	83 c2 08             	add    $0x8,%edx
  803efe:	89 55 b8             	mov    %edx,-0x48(%rbp)
  803f01:	eb 0c                	jmp    803f0f <vprintfmt+0x457>
  803f03:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803f07:	48 8d 50 08          	lea    0x8(%rax),%rdx
  803f0b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  803f0f:	48 8b 00             	mov    (%rax),%rax
  803f12:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803f16:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  803f1d:	eb 23                	jmp    803f42 <vprintfmt+0x48a>
  803f1f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803f23:	be 03 00 00 00       	mov    $0x3,%esi
  803f28:	48 89 c7             	mov    %rax,%rdi
  803f2b:	48 b8 aa 38 80 00 00 	movabs $0x8038aa,%rax
  803f32:	00 00 00 
  803f35:	ff d0                	callq  *%rax
  803f37:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803f3b:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  803f42:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  803f47:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  803f4a:	8b 7d dc             	mov    -0x24(%rbp),%edi
  803f4d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803f51:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  803f55:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803f59:	45 89 c1             	mov    %r8d,%r9d
  803f5c:	41 89 f8             	mov    %edi,%r8d
  803f5f:	48 89 c7             	mov    %rax,%rdi
  803f62:	48 b8 f2 37 80 00 00 	movabs $0x8037f2,%rax
  803f69:	00 00 00 
  803f6c:	ff d0                	callq  *%rax
  803f6e:	eb 3f                	jmp    803faf <vprintfmt+0x4f7>
  803f70:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803f74:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803f78:	48 89 d6             	mov    %rdx,%rsi
  803f7b:	89 df                	mov    %ebx,%edi
  803f7d:	ff d0                	callq  *%rax
  803f7f:	eb 2e                	jmp    803faf <vprintfmt+0x4f7>
  803f81:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803f85:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803f89:	48 89 d6             	mov    %rdx,%rsi
  803f8c:	bf 25 00 00 00       	mov    $0x25,%edi
  803f91:	ff d0                	callq  *%rax
  803f93:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  803f98:	eb 05                	jmp    803f9f <vprintfmt+0x4e7>
  803f9a:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  803f9f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  803fa3:	48 83 e8 01          	sub    $0x1,%rax
  803fa7:	0f b6 00             	movzbl (%rax),%eax
  803faa:	3c 25                	cmp    $0x25,%al
  803fac:	75 ec                	jne    803f9a <vprintfmt+0x4e2>
  803fae:	90                   	nop
  803faf:	e9 3d fb ff ff       	jmpq   803af1 <vprintfmt+0x39>
  803fb4:	90                   	nop
  803fb5:	48 83 c4 60          	add    $0x60,%rsp
  803fb9:	5b                   	pop    %rbx
  803fba:	41 5c                	pop    %r12
  803fbc:	5d                   	pop    %rbp
  803fbd:	c3                   	retq   

0000000000803fbe <printfmt>:
  803fbe:	55                   	push   %rbp
  803fbf:	48 89 e5             	mov    %rsp,%rbp
  803fc2:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  803fc9:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  803fd0:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  803fd7:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  803fde:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803fe5:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803fec:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803ff3:	84 c0                	test   %al,%al
  803ff5:	74 20                	je     804017 <printfmt+0x59>
  803ff7:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803ffb:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803fff:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  804003:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  804007:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80400b:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80400f:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  804013:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  804017:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  80401e:	00 00 00 
  804021:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  804028:	00 00 00 
  80402b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80402f:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  804036:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80403d:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  804044:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  80404b:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  804052:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  804059:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  804060:	48 89 c7             	mov    %rax,%rdi
  804063:	48 b8 b8 3a 80 00 00 	movabs $0x803ab8,%rax
  80406a:	00 00 00 
  80406d:	ff d0                	callq  *%rax
  80406f:	90                   	nop
  804070:	c9                   	leaveq 
  804071:	c3                   	retq   

0000000000804072 <sprintputch>:
  804072:	55                   	push   %rbp
  804073:	48 89 e5             	mov    %rsp,%rbp
  804076:	48 83 ec 10          	sub    $0x10,%rsp
  80407a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80407d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804081:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804085:	8b 40 10             	mov    0x10(%rax),%eax
  804088:	8d 50 01             	lea    0x1(%rax),%edx
  80408b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80408f:	89 50 10             	mov    %edx,0x10(%rax)
  804092:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804096:	48 8b 10             	mov    (%rax),%rdx
  804099:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80409d:	48 8b 40 08          	mov    0x8(%rax),%rax
  8040a1:	48 39 c2             	cmp    %rax,%rdx
  8040a4:	73 17                	jae    8040bd <sprintputch+0x4b>
  8040a6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040aa:	48 8b 00             	mov    (%rax),%rax
  8040ad:	48 8d 48 01          	lea    0x1(%rax),%rcx
  8040b1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8040b5:	48 89 0a             	mov    %rcx,(%rdx)
  8040b8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8040bb:	88 10                	mov    %dl,(%rax)
  8040bd:	90                   	nop
  8040be:	c9                   	leaveq 
  8040bf:	c3                   	retq   

00000000008040c0 <vsnprintf>:
  8040c0:	55                   	push   %rbp
  8040c1:	48 89 e5             	mov    %rsp,%rbp
  8040c4:	48 83 ec 50          	sub    $0x50,%rsp
  8040c8:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8040cc:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  8040cf:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  8040d3:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  8040d7:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8040db:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  8040df:	48 8b 0a             	mov    (%rdx),%rcx
  8040e2:	48 89 08             	mov    %rcx,(%rax)
  8040e5:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8040e9:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8040ed:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8040f1:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8040f5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8040f9:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8040fd:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  804100:	48 98                	cltq   
  804102:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  804106:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80410a:	48 01 d0             	add    %rdx,%rax
  80410d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  804111:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  804118:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  80411d:	74 06                	je     804125 <vsnprintf+0x65>
  80411f:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  804123:	7f 07                	jg     80412c <vsnprintf+0x6c>
  804125:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80412a:	eb 2f                	jmp    80415b <vsnprintf+0x9b>
  80412c:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  804130:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  804134:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  804138:	48 89 c6             	mov    %rax,%rsi
  80413b:	48 bf 72 40 80 00 00 	movabs $0x804072,%rdi
  804142:	00 00 00 
  804145:	48 b8 b8 3a 80 00 00 	movabs $0x803ab8,%rax
  80414c:	00 00 00 
  80414f:	ff d0                	callq  *%rax
  804151:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804155:	c6 00 00             	movb   $0x0,(%rax)
  804158:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80415b:	c9                   	leaveq 
  80415c:	c3                   	retq   

000000000080415d <snprintf>:
  80415d:	55                   	push   %rbp
  80415e:	48 89 e5             	mov    %rsp,%rbp
  804161:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  804168:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80416f:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  804175:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  80417c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  804183:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80418a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  804191:	84 c0                	test   %al,%al
  804193:	74 20                	je     8041b5 <snprintf+0x58>
  804195:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  804199:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80419d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8041a1:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8041a5:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8041a9:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8041ad:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8041b1:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8041b5:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8041bc:	00 00 00 
  8041bf:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8041c6:	00 00 00 
  8041c9:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8041cd:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8041d4:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8041db:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8041e2:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8041e9:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8041f0:	48 8b 0a             	mov    (%rdx),%rcx
  8041f3:	48 89 08             	mov    %rcx,(%rax)
  8041f6:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8041fa:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8041fe:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  804202:	48 89 50 10          	mov    %rdx,0x10(%rax)
  804206:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80420d:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  804214:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80421a:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  804221:	48 89 c7             	mov    %rax,%rdi
  804224:	48 b8 c0 40 80 00 00 	movabs $0x8040c0,%rax
  80422b:	00 00 00 
  80422e:	ff d0                	callq  *%rax
  804230:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  804236:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80423c:	c9                   	leaveq 
  80423d:	c3                   	retq   

000000000080423e <strlen>:
  80423e:	55                   	push   %rbp
  80423f:	48 89 e5             	mov    %rsp,%rbp
  804242:	48 83 ec 18          	sub    $0x18,%rsp
  804246:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80424a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804251:	eb 09                	jmp    80425c <strlen+0x1e>
  804253:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804257:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80425c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804260:	0f b6 00             	movzbl (%rax),%eax
  804263:	84 c0                	test   %al,%al
  804265:	75 ec                	jne    804253 <strlen+0x15>
  804267:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80426a:	c9                   	leaveq 
  80426b:	c3                   	retq   

000000000080426c <strnlen>:
  80426c:	55                   	push   %rbp
  80426d:	48 89 e5             	mov    %rsp,%rbp
  804270:	48 83 ec 20          	sub    $0x20,%rsp
  804274:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804278:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80427c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804283:	eb 0e                	jmp    804293 <strnlen+0x27>
  804285:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804289:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80428e:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  804293:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804298:	74 0b                	je     8042a5 <strnlen+0x39>
  80429a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80429e:	0f b6 00             	movzbl (%rax),%eax
  8042a1:	84 c0                	test   %al,%al
  8042a3:	75 e0                	jne    804285 <strnlen+0x19>
  8042a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042a8:	c9                   	leaveq 
  8042a9:	c3                   	retq   

00000000008042aa <strcpy>:
  8042aa:	55                   	push   %rbp
  8042ab:	48 89 e5             	mov    %rsp,%rbp
  8042ae:	48 83 ec 20          	sub    $0x20,%rsp
  8042b2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8042b6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8042ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042be:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8042c2:	90                   	nop
  8042c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042c7:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8042cb:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8042cf:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8042d3:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8042d7:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8042db:	0f b6 12             	movzbl (%rdx),%edx
  8042de:	88 10                	mov    %dl,(%rax)
  8042e0:	0f b6 00             	movzbl (%rax),%eax
  8042e3:	84 c0                	test   %al,%al
  8042e5:	75 dc                	jne    8042c3 <strcpy+0x19>
  8042e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042eb:	c9                   	leaveq 
  8042ec:	c3                   	retq   

00000000008042ed <strcat>:
  8042ed:	55                   	push   %rbp
  8042ee:	48 89 e5             	mov    %rsp,%rbp
  8042f1:	48 83 ec 20          	sub    $0x20,%rsp
  8042f5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8042f9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8042fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804301:	48 89 c7             	mov    %rax,%rdi
  804304:	48 b8 3e 42 80 00 00 	movabs $0x80423e,%rax
  80430b:	00 00 00 
  80430e:	ff d0                	callq  *%rax
  804310:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804313:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804316:	48 63 d0             	movslq %eax,%rdx
  804319:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80431d:	48 01 c2             	add    %rax,%rdx
  804320:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804324:	48 89 c6             	mov    %rax,%rsi
  804327:	48 89 d7             	mov    %rdx,%rdi
  80432a:	48 b8 aa 42 80 00 00 	movabs $0x8042aa,%rax
  804331:	00 00 00 
  804334:	ff d0                	callq  *%rax
  804336:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80433a:	c9                   	leaveq 
  80433b:	c3                   	retq   

000000000080433c <strncpy>:
  80433c:	55                   	push   %rbp
  80433d:	48 89 e5             	mov    %rsp,%rbp
  804340:	48 83 ec 28          	sub    $0x28,%rsp
  804344:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804348:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80434c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804350:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804354:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804358:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80435f:	00 
  804360:	eb 2a                	jmp    80438c <strncpy+0x50>
  804362:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804366:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80436a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80436e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804372:	0f b6 12             	movzbl (%rdx),%edx
  804375:	88 10                	mov    %dl,(%rax)
  804377:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80437b:	0f b6 00             	movzbl (%rax),%eax
  80437e:	84 c0                	test   %al,%al
  804380:	74 05                	je     804387 <strncpy+0x4b>
  804382:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  804387:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80438c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804390:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  804394:	72 cc                	jb     804362 <strncpy+0x26>
  804396:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80439a:	c9                   	leaveq 
  80439b:	c3                   	retq   

000000000080439c <strlcpy>:
  80439c:	55                   	push   %rbp
  80439d:	48 89 e5             	mov    %rsp,%rbp
  8043a0:	48 83 ec 28          	sub    $0x28,%rsp
  8043a4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8043a8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8043ac:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8043b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043b4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8043b8:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8043bd:	74 3d                	je     8043fc <strlcpy+0x60>
  8043bf:	eb 1d                	jmp    8043de <strlcpy+0x42>
  8043c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043c5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8043c9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8043cd:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8043d1:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8043d5:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8043d9:	0f b6 12             	movzbl (%rdx),%edx
  8043dc:	88 10                	mov    %dl,(%rax)
  8043de:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8043e3:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8043e8:	74 0b                	je     8043f5 <strlcpy+0x59>
  8043ea:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8043ee:	0f b6 00             	movzbl (%rax),%eax
  8043f1:	84 c0                	test   %al,%al
  8043f3:	75 cc                	jne    8043c1 <strlcpy+0x25>
  8043f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043f9:	c6 00 00             	movb   $0x0,(%rax)
  8043fc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804400:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804404:	48 29 c2             	sub    %rax,%rdx
  804407:	48 89 d0             	mov    %rdx,%rax
  80440a:	c9                   	leaveq 
  80440b:	c3                   	retq   

000000000080440c <strcmp>:
  80440c:	55                   	push   %rbp
  80440d:	48 89 e5             	mov    %rsp,%rbp
  804410:	48 83 ec 10          	sub    $0x10,%rsp
  804414:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804418:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80441c:	eb 0a                	jmp    804428 <strcmp+0x1c>
  80441e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804423:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  804428:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80442c:	0f b6 00             	movzbl (%rax),%eax
  80442f:	84 c0                	test   %al,%al
  804431:	74 12                	je     804445 <strcmp+0x39>
  804433:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804437:	0f b6 10             	movzbl (%rax),%edx
  80443a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80443e:	0f b6 00             	movzbl (%rax),%eax
  804441:	38 c2                	cmp    %al,%dl
  804443:	74 d9                	je     80441e <strcmp+0x12>
  804445:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804449:	0f b6 00             	movzbl (%rax),%eax
  80444c:	0f b6 d0             	movzbl %al,%edx
  80444f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804453:	0f b6 00             	movzbl (%rax),%eax
  804456:	0f b6 c0             	movzbl %al,%eax
  804459:	29 c2                	sub    %eax,%edx
  80445b:	89 d0                	mov    %edx,%eax
  80445d:	c9                   	leaveq 
  80445e:	c3                   	retq   

000000000080445f <strncmp>:
  80445f:	55                   	push   %rbp
  804460:	48 89 e5             	mov    %rsp,%rbp
  804463:	48 83 ec 18          	sub    $0x18,%rsp
  804467:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80446b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80446f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  804473:	eb 0f                	jmp    804484 <strncmp+0x25>
  804475:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80447a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80447f:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  804484:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804489:	74 1d                	je     8044a8 <strncmp+0x49>
  80448b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80448f:	0f b6 00             	movzbl (%rax),%eax
  804492:	84 c0                	test   %al,%al
  804494:	74 12                	je     8044a8 <strncmp+0x49>
  804496:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80449a:	0f b6 10             	movzbl (%rax),%edx
  80449d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044a1:	0f b6 00             	movzbl (%rax),%eax
  8044a4:	38 c2                	cmp    %al,%dl
  8044a6:	74 cd                	je     804475 <strncmp+0x16>
  8044a8:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8044ad:	75 07                	jne    8044b6 <strncmp+0x57>
  8044af:	b8 00 00 00 00       	mov    $0x0,%eax
  8044b4:	eb 18                	jmp    8044ce <strncmp+0x6f>
  8044b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044ba:	0f b6 00             	movzbl (%rax),%eax
  8044bd:	0f b6 d0             	movzbl %al,%edx
  8044c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044c4:	0f b6 00             	movzbl (%rax),%eax
  8044c7:	0f b6 c0             	movzbl %al,%eax
  8044ca:	29 c2                	sub    %eax,%edx
  8044cc:	89 d0                	mov    %edx,%eax
  8044ce:	c9                   	leaveq 
  8044cf:	c3                   	retq   

00000000008044d0 <strchr>:
  8044d0:	55                   	push   %rbp
  8044d1:	48 89 e5             	mov    %rsp,%rbp
  8044d4:	48 83 ec 10          	sub    $0x10,%rsp
  8044d8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8044dc:	89 f0                	mov    %esi,%eax
  8044de:	88 45 f4             	mov    %al,-0xc(%rbp)
  8044e1:	eb 17                	jmp    8044fa <strchr+0x2a>
  8044e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044e7:	0f b6 00             	movzbl (%rax),%eax
  8044ea:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8044ed:	75 06                	jne    8044f5 <strchr+0x25>
  8044ef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044f3:	eb 15                	jmp    80450a <strchr+0x3a>
  8044f5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8044fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044fe:	0f b6 00             	movzbl (%rax),%eax
  804501:	84 c0                	test   %al,%al
  804503:	75 de                	jne    8044e3 <strchr+0x13>
  804505:	b8 00 00 00 00       	mov    $0x0,%eax
  80450a:	c9                   	leaveq 
  80450b:	c3                   	retq   

000000000080450c <strfind>:
  80450c:	55                   	push   %rbp
  80450d:	48 89 e5             	mov    %rsp,%rbp
  804510:	48 83 ec 10          	sub    $0x10,%rsp
  804514:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804518:	89 f0                	mov    %esi,%eax
  80451a:	88 45 f4             	mov    %al,-0xc(%rbp)
  80451d:	eb 11                	jmp    804530 <strfind+0x24>
  80451f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804523:	0f b6 00             	movzbl (%rax),%eax
  804526:	3a 45 f4             	cmp    -0xc(%rbp),%al
  804529:	74 12                	je     80453d <strfind+0x31>
  80452b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804530:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804534:	0f b6 00             	movzbl (%rax),%eax
  804537:	84 c0                	test   %al,%al
  804539:	75 e4                	jne    80451f <strfind+0x13>
  80453b:	eb 01                	jmp    80453e <strfind+0x32>
  80453d:	90                   	nop
  80453e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804542:	c9                   	leaveq 
  804543:	c3                   	retq   

0000000000804544 <memset>:
  804544:	55                   	push   %rbp
  804545:	48 89 e5             	mov    %rsp,%rbp
  804548:	48 83 ec 18          	sub    $0x18,%rsp
  80454c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804550:	89 75 f4             	mov    %esi,-0xc(%rbp)
  804553:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  804557:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80455c:	75 06                	jne    804564 <memset+0x20>
  80455e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804562:	eb 69                	jmp    8045cd <memset+0x89>
  804564:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804568:	83 e0 03             	and    $0x3,%eax
  80456b:	48 85 c0             	test   %rax,%rax
  80456e:	75 48                	jne    8045b8 <memset+0x74>
  804570:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804574:	83 e0 03             	and    $0x3,%eax
  804577:	48 85 c0             	test   %rax,%rax
  80457a:	75 3c                	jne    8045b8 <memset+0x74>
  80457c:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  804583:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804586:	c1 e0 18             	shl    $0x18,%eax
  804589:	89 c2                	mov    %eax,%edx
  80458b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80458e:	c1 e0 10             	shl    $0x10,%eax
  804591:	09 c2                	or     %eax,%edx
  804593:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804596:	c1 e0 08             	shl    $0x8,%eax
  804599:	09 d0                	or     %edx,%eax
  80459b:	09 45 f4             	or     %eax,-0xc(%rbp)
  80459e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8045a2:	48 c1 e8 02          	shr    $0x2,%rax
  8045a6:	48 89 c1             	mov    %rax,%rcx
  8045a9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8045ad:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8045b0:	48 89 d7             	mov    %rdx,%rdi
  8045b3:	fc                   	cld    
  8045b4:	f3 ab                	rep stos %eax,%es:(%rdi)
  8045b6:	eb 11                	jmp    8045c9 <memset+0x85>
  8045b8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8045bc:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8045bf:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8045c3:	48 89 d7             	mov    %rdx,%rdi
  8045c6:	fc                   	cld    
  8045c7:	f3 aa                	rep stos %al,%es:(%rdi)
  8045c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045cd:	c9                   	leaveq 
  8045ce:	c3                   	retq   

00000000008045cf <memmove>:
  8045cf:	55                   	push   %rbp
  8045d0:	48 89 e5             	mov    %rsp,%rbp
  8045d3:	48 83 ec 28          	sub    $0x28,%rsp
  8045d7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8045db:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8045df:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8045e3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8045e7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8045eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8045ef:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8045f3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045f7:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8045fb:	0f 83 88 00 00 00    	jae    804689 <memmove+0xba>
  804601:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804605:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804609:	48 01 d0             	add    %rdx,%rax
  80460c:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  804610:	76 77                	jbe    804689 <memmove+0xba>
  804612:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804616:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80461a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80461e:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  804622:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804626:	83 e0 03             	and    $0x3,%eax
  804629:	48 85 c0             	test   %rax,%rax
  80462c:	75 3b                	jne    804669 <memmove+0x9a>
  80462e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804632:	83 e0 03             	and    $0x3,%eax
  804635:	48 85 c0             	test   %rax,%rax
  804638:	75 2f                	jne    804669 <memmove+0x9a>
  80463a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80463e:	83 e0 03             	and    $0x3,%eax
  804641:	48 85 c0             	test   %rax,%rax
  804644:	75 23                	jne    804669 <memmove+0x9a>
  804646:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80464a:	48 83 e8 04          	sub    $0x4,%rax
  80464e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  804652:	48 83 ea 04          	sub    $0x4,%rdx
  804656:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80465a:	48 c1 e9 02          	shr    $0x2,%rcx
  80465e:	48 89 c7             	mov    %rax,%rdi
  804661:	48 89 d6             	mov    %rdx,%rsi
  804664:	fd                   	std    
  804665:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  804667:	eb 1d                	jmp    804686 <memmove+0xb7>
  804669:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80466d:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  804671:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804675:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  804679:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80467d:	48 89 d7             	mov    %rdx,%rdi
  804680:	48 89 c1             	mov    %rax,%rcx
  804683:	fd                   	std    
  804684:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  804686:	fc                   	cld    
  804687:	eb 57                	jmp    8046e0 <memmove+0x111>
  804689:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80468d:	83 e0 03             	and    $0x3,%eax
  804690:	48 85 c0             	test   %rax,%rax
  804693:	75 36                	jne    8046cb <memmove+0xfc>
  804695:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804699:	83 e0 03             	and    $0x3,%eax
  80469c:	48 85 c0             	test   %rax,%rax
  80469f:	75 2a                	jne    8046cb <memmove+0xfc>
  8046a1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8046a5:	83 e0 03             	and    $0x3,%eax
  8046a8:	48 85 c0             	test   %rax,%rax
  8046ab:	75 1e                	jne    8046cb <memmove+0xfc>
  8046ad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8046b1:	48 c1 e8 02          	shr    $0x2,%rax
  8046b5:	48 89 c1             	mov    %rax,%rcx
  8046b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046bc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8046c0:	48 89 c7             	mov    %rax,%rdi
  8046c3:	48 89 d6             	mov    %rdx,%rsi
  8046c6:	fc                   	cld    
  8046c7:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8046c9:	eb 15                	jmp    8046e0 <memmove+0x111>
  8046cb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046cf:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8046d3:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8046d7:	48 89 c7             	mov    %rax,%rdi
  8046da:	48 89 d6             	mov    %rdx,%rsi
  8046dd:	fc                   	cld    
  8046de:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8046e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8046e4:	c9                   	leaveq 
  8046e5:	c3                   	retq   

00000000008046e6 <memcpy>:
  8046e6:	55                   	push   %rbp
  8046e7:	48 89 e5             	mov    %rsp,%rbp
  8046ea:	48 83 ec 18          	sub    $0x18,%rsp
  8046ee:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8046f2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8046f6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8046fa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8046fe:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  804702:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804706:	48 89 ce             	mov    %rcx,%rsi
  804709:	48 89 c7             	mov    %rax,%rdi
  80470c:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  804713:	00 00 00 
  804716:	ff d0                	callq  *%rax
  804718:	c9                   	leaveq 
  804719:	c3                   	retq   

000000000080471a <memcmp>:
  80471a:	55                   	push   %rbp
  80471b:	48 89 e5             	mov    %rsp,%rbp
  80471e:	48 83 ec 28          	sub    $0x28,%rsp
  804722:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804726:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80472a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80472e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804732:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804736:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80473a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80473e:	eb 36                	jmp    804776 <memcmp+0x5c>
  804740:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804744:	0f b6 10             	movzbl (%rax),%edx
  804747:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80474b:	0f b6 00             	movzbl (%rax),%eax
  80474e:	38 c2                	cmp    %al,%dl
  804750:	74 1a                	je     80476c <memcmp+0x52>
  804752:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804756:	0f b6 00             	movzbl (%rax),%eax
  804759:	0f b6 d0             	movzbl %al,%edx
  80475c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804760:	0f b6 00             	movzbl (%rax),%eax
  804763:	0f b6 c0             	movzbl %al,%eax
  804766:	29 c2                	sub    %eax,%edx
  804768:	89 d0                	mov    %edx,%eax
  80476a:	eb 20                	jmp    80478c <memcmp+0x72>
  80476c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804771:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  804776:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80477a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80477e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804782:	48 85 c0             	test   %rax,%rax
  804785:	75 b9                	jne    804740 <memcmp+0x26>
  804787:	b8 00 00 00 00       	mov    $0x0,%eax
  80478c:	c9                   	leaveq 
  80478d:	c3                   	retq   

000000000080478e <memfind>:
  80478e:	55                   	push   %rbp
  80478f:	48 89 e5             	mov    %rsp,%rbp
  804792:	48 83 ec 28          	sub    $0x28,%rsp
  804796:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80479a:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80479d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8047a1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8047a5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8047a9:	48 01 d0             	add    %rdx,%rax
  8047ac:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8047b0:	eb 13                	jmp    8047c5 <memfind+0x37>
  8047b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8047b6:	0f b6 00             	movzbl (%rax),%eax
  8047b9:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8047bc:	38 d0                	cmp    %dl,%al
  8047be:	74 11                	je     8047d1 <memfind+0x43>
  8047c0:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8047c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8047c9:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8047cd:	72 e3                	jb     8047b2 <memfind+0x24>
  8047cf:	eb 01                	jmp    8047d2 <memfind+0x44>
  8047d1:	90                   	nop
  8047d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8047d6:	c9                   	leaveq 
  8047d7:	c3                   	retq   

00000000008047d8 <strtol>:
  8047d8:	55                   	push   %rbp
  8047d9:	48 89 e5             	mov    %rsp,%rbp
  8047dc:	48 83 ec 38          	sub    $0x38,%rsp
  8047e0:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8047e4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8047e8:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8047eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8047f2:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8047f9:	00 
  8047fa:	eb 05                	jmp    804801 <strtol+0x29>
  8047fc:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  804801:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804805:	0f b6 00             	movzbl (%rax),%eax
  804808:	3c 20                	cmp    $0x20,%al
  80480a:	74 f0                	je     8047fc <strtol+0x24>
  80480c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804810:	0f b6 00             	movzbl (%rax),%eax
  804813:	3c 09                	cmp    $0x9,%al
  804815:	74 e5                	je     8047fc <strtol+0x24>
  804817:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80481b:	0f b6 00             	movzbl (%rax),%eax
  80481e:	3c 2b                	cmp    $0x2b,%al
  804820:	75 07                	jne    804829 <strtol+0x51>
  804822:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  804827:	eb 17                	jmp    804840 <strtol+0x68>
  804829:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80482d:	0f b6 00             	movzbl (%rax),%eax
  804830:	3c 2d                	cmp    $0x2d,%al
  804832:	75 0c                	jne    804840 <strtol+0x68>
  804834:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  804839:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  804840:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  804844:	74 06                	je     80484c <strtol+0x74>
  804846:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80484a:	75 28                	jne    804874 <strtol+0x9c>
  80484c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804850:	0f b6 00             	movzbl (%rax),%eax
  804853:	3c 30                	cmp    $0x30,%al
  804855:	75 1d                	jne    804874 <strtol+0x9c>
  804857:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80485b:	48 83 c0 01          	add    $0x1,%rax
  80485f:	0f b6 00             	movzbl (%rax),%eax
  804862:	3c 78                	cmp    $0x78,%al
  804864:	75 0e                	jne    804874 <strtol+0x9c>
  804866:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  80486b:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  804872:	eb 2c                	jmp    8048a0 <strtol+0xc8>
  804874:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  804878:	75 19                	jne    804893 <strtol+0xbb>
  80487a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80487e:	0f b6 00             	movzbl (%rax),%eax
  804881:	3c 30                	cmp    $0x30,%al
  804883:	75 0e                	jne    804893 <strtol+0xbb>
  804885:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80488a:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  804891:	eb 0d                	jmp    8048a0 <strtol+0xc8>
  804893:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  804897:	75 07                	jne    8048a0 <strtol+0xc8>
  804899:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8048a0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048a4:	0f b6 00             	movzbl (%rax),%eax
  8048a7:	3c 2f                	cmp    $0x2f,%al
  8048a9:	7e 1d                	jle    8048c8 <strtol+0xf0>
  8048ab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048af:	0f b6 00             	movzbl (%rax),%eax
  8048b2:	3c 39                	cmp    $0x39,%al
  8048b4:	7f 12                	jg     8048c8 <strtol+0xf0>
  8048b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048ba:	0f b6 00             	movzbl (%rax),%eax
  8048bd:	0f be c0             	movsbl %al,%eax
  8048c0:	83 e8 30             	sub    $0x30,%eax
  8048c3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8048c6:	eb 4e                	jmp    804916 <strtol+0x13e>
  8048c8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048cc:	0f b6 00             	movzbl (%rax),%eax
  8048cf:	3c 60                	cmp    $0x60,%al
  8048d1:	7e 1d                	jle    8048f0 <strtol+0x118>
  8048d3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048d7:	0f b6 00             	movzbl (%rax),%eax
  8048da:	3c 7a                	cmp    $0x7a,%al
  8048dc:	7f 12                	jg     8048f0 <strtol+0x118>
  8048de:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048e2:	0f b6 00             	movzbl (%rax),%eax
  8048e5:	0f be c0             	movsbl %al,%eax
  8048e8:	83 e8 57             	sub    $0x57,%eax
  8048eb:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8048ee:	eb 26                	jmp    804916 <strtol+0x13e>
  8048f0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048f4:	0f b6 00             	movzbl (%rax),%eax
  8048f7:	3c 40                	cmp    $0x40,%al
  8048f9:	7e 47                	jle    804942 <strtol+0x16a>
  8048fb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048ff:	0f b6 00             	movzbl (%rax),%eax
  804902:	3c 5a                	cmp    $0x5a,%al
  804904:	7f 3c                	jg     804942 <strtol+0x16a>
  804906:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80490a:	0f b6 00             	movzbl (%rax),%eax
  80490d:	0f be c0             	movsbl %al,%eax
  804910:	83 e8 37             	sub    $0x37,%eax
  804913:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804916:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804919:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80491c:	7d 23                	jge    804941 <strtol+0x169>
  80491e:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  804923:	8b 45 cc             	mov    -0x34(%rbp),%eax
  804926:	48 98                	cltq   
  804928:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80492d:	48 89 c2             	mov    %rax,%rdx
  804930:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804933:	48 98                	cltq   
  804935:	48 01 d0             	add    %rdx,%rax
  804938:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80493c:	e9 5f ff ff ff       	jmpq   8048a0 <strtol+0xc8>
  804941:	90                   	nop
  804942:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  804947:	74 0b                	je     804954 <strtol+0x17c>
  804949:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80494d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  804951:	48 89 10             	mov    %rdx,(%rax)
  804954:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804958:	74 09                	je     804963 <strtol+0x18b>
  80495a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80495e:	48 f7 d8             	neg    %rax
  804961:	eb 04                	jmp    804967 <strtol+0x18f>
  804963:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804967:	c9                   	leaveq 
  804968:	c3                   	retq   

0000000000804969 <strstr>:
  804969:	55                   	push   %rbp
  80496a:	48 89 e5             	mov    %rsp,%rbp
  80496d:	48 83 ec 30          	sub    $0x30,%rsp
  804971:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804975:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804979:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80497d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  804981:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  804985:	0f b6 00             	movzbl (%rax),%eax
  804988:	88 45 ff             	mov    %al,-0x1(%rbp)
  80498b:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  80498f:	75 06                	jne    804997 <strstr+0x2e>
  804991:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804995:	eb 6b                	jmp    804a02 <strstr+0x99>
  804997:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80499b:	48 89 c7             	mov    %rax,%rdi
  80499e:	48 b8 3e 42 80 00 00 	movabs $0x80423e,%rax
  8049a5:	00 00 00 
  8049a8:	ff d0                	callq  *%rax
  8049aa:	48 98                	cltq   
  8049ac:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8049b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8049b4:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8049b8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8049bc:	0f b6 00             	movzbl (%rax),%eax
  8049bf:	88 45 ef             	mov    %al,-0x11(%rbp)
  8049c2:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8049c6:	75 07                	jne    8049cf <strstr+0x66>
  8049c8:	b8 00 00 00 00       	mov    $0x0,%eax
  8049cd:	eb 33                	jmp    804a02 <strstr+0x99>
  8049cf:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8049d3:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8049d6:	75 d8                	jne    8049b0 <strstr+0x47>
  8049d8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8049dc:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8049e0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8049e4:	48 89 ce             	mov    %rcx,%rsi
  8049e7:	48 89 c7             	mov    %rax,%rdi
  8049ea:	48 b8 5f 44 80 00 00 	movabs $0x80445f,%rax
  8049f1:	00 00 00 
  8049f4:	ff d0                	callq  *%rax
  8049f6:	85 c0                	test   %eax,%eax
  8049f8:	75 b6                	jne    8049b0 <strstr+0x47>
  8049fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8049fe:	48 83 e8 01          	sub    $0x1,%rax
  804a02:	c9                   	leaveq 
  804a03:	c3                   	retq   

0000000000804a04 <syscall>:
  804a04:	55                   	push   %rbp
  804a05:	48 89 e5             	mov    %rsp,%rbp
  804a08:	53                   	push   %rbx
  804a09:	48 83 ec 48          	sub    $0x48,%rsp
  804a0d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804a10:	89 75 d8             	mov    %esi,-0x28(%rbp)
  804a13:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  804a17:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  804a1b:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  804a1f:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  804a23:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804a26:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  804a2a:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  804a2e:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  804a32:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  804a36:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  804a3a:	4c 89 c3             	mov    %r8,%rbx
  804a3d:	cd 30                	int    $0x30
  804a3f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804a43:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  804a47:	74 3e                	je     804a87 <syscall+0x83>
  804a49:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804a4e:	7e 37                	jle    804a87 <syscall+0x83>
  804a50:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804a54:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804a57:	49 89 d0             	mov    %rdx,%r8
  804a5a:	89 c1                	mov    %eax,%ecx
  804a5c:	48 ba c8 7f 80 00 00 	movabs $0x807fc8,%rdx
  804a63:	00 00 00 
  804a66:	be 24 00 00 00       	mov    $0x24,%esi
  804a6b:	48 bf e5 7f 80 00 00 	movabs $0x807fe5,%rdi
  804a72:	00 00 00 
  804a75:	b8 00 00 00 00       	mov    $0x0,%eax
  804a7a:	49 b9 e0 34 80 00 00 	movabs $0x8034e0,%r9
  804a81:	00 00 00 
  804a84:	41 ff d1             	callq  *%r9
  804a87:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804a8b:	48 83 c4 48          	add    $0x48,%rsp
  804a8f:	5b                   	pop    %rbx
  804a90:	5d                   	pop    %rbp
  804a91:	c3                   	retq   

0000000000804a92 <sys_cputs>:
  804a92:	55                   	push   %rbp
  804a93:	48 89 e5             	mov    %rsp,%rbp
  804a96:	48 83 ec 10          	sub    $0x10,%rsp
  804a9a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804a9e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804aa2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804aa6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804aaa:	48 83 ec 08          	sub    $0x8,%rsp
  804aae:	6a 00                	pushq  $0x0
  804ab0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804ab6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804abc:	48 89 d1             	mov    %rdx,%rcx
  804abf:	48 89 c2             	mov    %rax,%rdx
  804ac2:	be 00 00 00 00       	mov    $0x0,%esi
  804ac7:	bf 00 00 00 00       	mov    $0x0,%edi
  804acc:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804ad3:	00 00 00 
  804ad6:	ff d0                	callq  *%rax
  804ad8:	48 83 c4 10          	add    $0x10,%rsp
  804adc:	90                   	nop
  804add:	c9                   	leaveq 
  804ade:	c3                   	retq   

0000000000804adf <sys_cgetc>:
  804adf:	55                   	push   %rbp
  804ae0:	48 89 e5             	mov    %rsp,%rbp
  804ae3:	48 83 ec 08          	sub    $0x8,%rsp
  804ae7:	6a 00                	pushq  $0x0
  804ae9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804aef:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804af5:	b9 00 00 00 00       	mov    $0x0,%ecx
  804afa:	ba 00 00 00 00       	mov    $0x0,%edx
  804aff:	be 00 00 00 00       	mov    $0x0,%esi
  804b04:	bf 01 00 00 00       	mov    $0x1,%edi
  804b09:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804b10:	00 00 00 
  804b13:	ff d0                	callq  *%rax
  804b15:	48 83 c4 10          	add    $0x10,%rsp
  804b19:	c9                   	leaveq 
  804b1a:	c3                   	retq   

0000000000804b1b <sys_env_destroy>:
  804b1b:	55                   	push   %rbp
  804b1c:	48 89 e5             	mov    %rsp,%rbp
  804b1f:	48 83 ec 10          	sub    $0x10,%rsp
  804b23:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804b26:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b29:	48 98                	cltq   
  804b2b:	48 83 ec 08          	sub    $0x8,%rsp
  804b2f:	6a 00                	pushq  $0x0
  804b31:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804b37:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804b3d:	b9 00 00 00 00       	mov    $0x0,%ecx
  804b42:	48 89 c2             	mov    %rax,%rdx
  804b45:	be 01 00 00 00       	mov    $0x1,%esi
  804b4a:	bf 03 00 00 00       	mov    $0x3,%edi
  804b4f:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804b56:	00 00 00 
  804b59:	ff d0                	callq  *%rax
  804b5b:	48 83 c4 10          	add    $0x10,%rsp
  804b5f:	c9                   	leaveq 
  804b60:	c3                   	retq   

0000000000804b61 <sys_getenvid>:
  804b61:	55                   	push   %rbp
  804b62:	48 89 e5             	mov    %rsp,%rbp
  804b65:	48 83 ec 08          	sub    $0x8,%rsp
  804b69:	6a 00                	pushq  $0x0
  804b6b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804b71:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804b77:	b9 00 00 00 00       	mov    $0x0,%ecx
  804b7c:	ba 00 00 00 00       	mov    $0x0,%edx
  804b81:	be 00 00 00 00       	mov    $0x0,%esi
  804b86:	bf 02 00 00 00       	mov    $0x2,%edi
  804b8b:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804b92:	00 00 00 
  804b95:	ff d0                	callq  *%rax
  804b97:	48 83 c4 10          	add    $0x10,%rsp
  804b9b:	c9                   	leaveq 
  804b9c:	c3                   	retq   

0000000000804b9d <sys_yield>:
  804b9d:	55                   	push   %rbp
  804b9e:	48 89 e5             	mov    %rsp,%rbp
  804ba1:	48 83 ec 08          	sub    $0x8,%rsp
  804ba5:	6a 00                	pushq  $0x0
  804ba7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804bad:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804bb3:	b9 00 00 00 00       	mov    $0x0,%ecx
  804bb8:	ba 00 00 00 00       	mov    $0x0,%edx
  804bbd:	be 00 00 00 00       	mov    $0x0,%esi
  804bc2:	bf 0b 00 00 00       	mov    $0xb,%edi
  804bc7:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804bce:	00 00 00 
  804bd1:	ff d0                	callq  *%rax
  804bd3:	48 83 c4 10          	add    $0x10,%rsp
  804bd7:	90                   	nop
  804bd8:	c9                   	leaveq 
  804bd9:	c3                   	retq   

0000000000804bda <sys_page_alloc>:
  804bda:	55                   	push   %rbp
  804bdb:	48 89 e5             	mov    %rsp,%rbp
  804bde:	48 83 ec 10          	sub    $0x10,%rsp
  804be2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804be5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804be9:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804bec:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804bef:	48 63 c8             	movslq %eax,%rcx
  804bf2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804bf6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804bf9:	48 98                	cltq   
  804bfb:	48 83 ec 08          	sub    $0x8,%rsp
  804bff:	6a 00                	pushq  $0x0
  804c01:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804c07:	49 89 c8             	mov    %rcx,%r8
  804c0a:	48 89 d1             	mov    %rdx,%rcx
  804c0d:	48 89 c2             	mov    %rax,%rdx
  804c10:	be 01 00 00 00       	mov    $0x1,%esi
  804c15:	bf 04 00 00 00       	mov    $0x4,%edi
  804c1a:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804c21:	00 00 00 
  804c24:	ff d0                	callq  *%rax
  804c26:	48 83 c4 10          	add    $0x10,%rsp
  804c2a:	c9                   	leaveq 
  804c2b:	c3                   	retq   

0000000000804c2c <sys_page_map>:
  804c2c:	55                   	push   %rbp
  804c2d:	48 89 e5             	mov    %rsp,%rbp
  804c30:	48 83 ec 20          	sub    $0x20,%rsp
  804c34:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804c37:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804c3b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804c3e:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  804c42:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  804c46:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  804c49:	48 63 c8             	movslq %eax,%rcx
  804c4c:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  804c50:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804c53:	48 63 f0             	movslq %eax,%rsi
  804c56:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804c5a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804c5d:	48 98                	cltq   
  804c5f:	48 83 ec 08          	sub    $0x8,%rsp
  804c63:	51                   	push   %rcx
  804c64:	49 89 f9             	mov    %rdi,%r9
  804c67:	49 89 f0             	mov    %rsi,%r8
  804c6a:	48 89 d1             	mov    %rdx,%rcx
  804c6d:	48 89 c2             	mov    %rax,%rdx
  804c70:	be 01 00 00 00       	mov    $0x1,%esi
  804c75:	bf 05 00 00 00       	mov    $0x5,%edi
  804c7a:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804c81:	00 00 00 
  804c84:	ff d0                	callq  *%rax
  804c86:	48 83 c4 10          	add    $0x10,%rsp
  804c8a:	c9                   	leaveq 
  804c8b:	c3                   	retq   

0000000000804c8c <sys_page_unmap>:
  804c8c:	55                   	push   %rbp
  804c8d:	48 89 e5             	mov    %rsp,%rbp
  804c90:	48 83 ec 10          	sub    $0x10,%rsp
  804c94:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804c97:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804c9b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804c9f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804ca2:	48 98                	cltq   
  804ca4:	48 83 ec 08          	sub    $0x8,%rsp
  804ca8:	6a 00                	pushq  $0x0
  804caa:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804cb0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804cb6:	48 89 d1             	mov    %rdx,%rcx
  804cb9:	48 89 c2             	mov    %rax,%rdx
  804cbc:	be 01 00 00 00       	mov    $0x1,%esi
  804cc1:	bf 06 00 00 00       	mov    $0x6,%edi
  804cc6:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804ccd:	00 00 00 
  804cd0:	ff d0                	callq  *%rax
  804cd2:	48 83 c4 10          	add    $0x10,%rsp
  804cd6:	c9                   	leaveq 
  804cd7:	c3                   	retq   

0000000000804cd8 <sys_env_set_status>:
  804cd8:	55                   	push   %rbp
  804cd9:	48 89 e5             	mov    %rsp,%rbp
  804cdc:	48 83 ec 10          	sub    $0x10,%rsp
  804ce0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804ce3:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804ce6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804ce9:	48 63 d0             	movslq %eax,%rdx
  804cec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804cef:	48 98                	cltq   
  804cf1:	48 83 ec 08          	sub    $0x8,%rsp
  804cf5:	6a 00                	pushq  $0x0
  804cf7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804cfd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804d03:	48 89 d1             	mov    %rdx,%rcx
  804d06:	48 89 c2             	mov    %rax,%rdx
  804d09:	be 01 00 00 00       	mov    $0x1,%esi
  804d0e:	bf 08 00 00 00       	mov    $0x8,%edi
  804d13:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804d1a:	00 00 00 
  804d1d:	ff d0                	callq  *%rax
  804d1f:	48 83 c4 10          	add    $0x10,%rsp
  804d23:	c9                   	leaveq 
  804d24:	c3                   	retq   

0000000000804d25 <sys_env_set_trapframe>:
  804d25:	55                   	push   %rbp
  804d26:	48 89 e5             	mov    %rsp,%rbp
  804d29:	48 83 ec 10          	sub    $0x10,%rsp
  804d2d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804d30:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804d34:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804d38:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804d3b:	48 98                	cltq   
  804d3d:	48 83 ec 08          	sub    $0x8,%rsp
  804d41:	6a 00                	pushq  $0x0
  804d43:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804d49:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804d4f:	48 89 d1             	mov    %rdx,%rcx
  804d52:	48 89 c2             	mov    %rax,%rdx
  804d55:	be 01 00 00 00       	mov    $0x1,%esi
  804d5a:	bf 09 00 00 00       	mov    $0x9,%edi
  804d5f:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804d66:	00 00 00 
  804d69:	ff d0                	callq  *%rax
  804d6b:	48 83 c4 10          	add    $0x10,%rsp
  804d6f:	c9                   	leaveq 
  804d70:	c3                   	retq   

0000000000804d71 <sys_env_set_pgfault_upcall>:
  804d71:	55                   	push   %rbp
  804d72:	48 89 e5             	mov    %rsp,%rbp
  804d75:	48 83 ec 10          	sub    $0x10,%rsp
  804d79:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804d7c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804d80:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804d84:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804d87:	48 98                	cltq   
  804d89:	48 83 ec 08          	sub    $0x8,%rsp
  804d8d:	6a 00                	pushq  $0x0
  804d8f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804d95:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804d9b:	48 89 d1             	mov    %rdx,%rcx
  804d9e:	48 89 c2             	mov    %rax,%rdx
  804da1:	be 01 00 00 00       	mov    $0x1,%esi
  804da6:	bf 0a 00 00 00       	mov    $0xa,%edi
  804dab:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804db2:	00 00 00 
  804db5:	ff d0                	callq  *%rax
  804db7:	48 83 c4 10          	add    $0x10,%rsp
  804dbb:	c9                   	leaveq 
  804dbc:	c3                   	retq   

0000000000804dbd <sys_ipc_try_send>:
  804dbd:	55                   	push   %rbp
  804dbe:	48 89 e5             	mov    %rsp,%rbp
  804dc1:	48 83 ec 20          	sub    $0x20,%rsp
  804dc5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804dc8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804dcc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  804dd0:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  804dd3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804dd6:	48 63 f0             	movslq %eax,%rsi
  804dd9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  804ddd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804de0:	48 98                	cltq   
  804de2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804de6:	48 83 ec 08          	sub    $0x8,%rsp
  804dea:	6a 00                	pushq  $0x0
  804dec:	49 89 f1             	mov    %rsi,%r9
  804def:	49 89 c8             	mov    %rcx,%r8
  804df2:	48 89 d1             	mov    %rdx,%rcx
  804df5:	48 89 c2             	mov    %rax,%rdx
  804df8:	be 00 00 00 00       	mov    $0x0,%esi
  804dfd:	bf 0c 00 00 00       	mov    $0xc,%edi
  804e02:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804e09:	00 00 00 
  804e0c:	ff d0                	callq  *%rax
  804e0e:	48 83 c4 10          	add    $0x10,%rsp
  804e12:	c9                   	leaveq 
  804e13:	c3                   	retq   

0000000000804e14 <sys_ipc_recv>:
  804e14:	55                   	push   %rbp
  804e15:	48 89 e5             	mov    %rsp,%rbp
  804e18:	48 83 ec 10          	sub    $0x10,%rsp
  804e1c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804e20:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804e24:	48 83 ec 08          	sub    $0x8,%rsp
  804e28:	6a 00                	pushq  $0x0
  804e2a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804e30:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804e36:	b9 00 00 00 00       	mov    $0x0,%ecx
  804e3b:	48 89 c2             	mov    %rax,%rdx
  804e3e:	be 01 00 00 00       	mov    $0x1,%esi
  804e43:	bf 0d 00 00 00       	mov    $0xd,%edi
  804e48:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804e4f:	00 00 00 
  804e52:	ff d0                	callq  *%rax
  804e54:	48 83 c4 10          	add    $0x10,%rsp
  804e58:	c9                   	leaveq 
  804e59:	c3                   	retq   

0000000000804e5a <sys_time_msec>:
  804e5a:	55                   	push   %rbp
  804e5b:	48 89 e5             	mov    %rsp,%rbp
  804e5e:	48 83 ec 08          	sub    $0x8,%rsp
  804e62:	6a 00                	pushq  $0x0
  804e64:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804e6a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804e70:	b9 00 00 00 00       	mov    $0x0,%ecx
  804e75:	ba 00 00 00 00       	mov    $0x0,%edx
  804e7a:	be 00 00 00 00       	mov    $0x0,%esi
  804e7f:	bf 0e 00 00 00       	mov    $0xe,%edi
  804e84:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804e8b:	00 00 00 
  804e8e:	ff d0                	callq  *%rax
  804e90:	48 83 c4 10          	add    $0x10,%rsp
  804e94:	c9                   	leaveq 
  804e95:	c3                   	retq   

0000000000804e96 <sys_net_transmit>:
  804e96:	55                   	push   %rbp
  804e97:	48 89 e5             	mov    %rsp,%rbp
  804e9a:	48 83 ec 10          	sub    $0x10,%rsp
  804e9e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804ea2:	89 75 f4             	mov    %esi,-0xc(%rbp)
  804ea5:	8b 55 f4             	mov    -0xc(%rbp),%edx
  804ea8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804eac:	48 83 ec 08          	sub    $0x8,%rsp
  804eb0:	6a 00                	pushq  $0x0
  804eb2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804eb8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804ebe:	48 89 d1             	mov    %rdx,%rcx
  804ec1:	48 89 c2             	mov    %rax,%rdx
  804ec4:	be 00 00 00 00       	mov    $0x0,%esi
  804ec9:	bf 0f 00 00 00       	mov    $0xf,%edi
  804ece:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804ed5:	00 00 00 
  804ed8:	ff d0                	callq  *%rax
  804eda:	48 83 c4 10          	add    $0x10,%rsp
  804ede:	c9                   	leaveq 
  804edf:	c3                   	retq   

0000000000804ee0 <sys_net_receive>:
  804ee0:	55                   	push   %rbp
  804ee1:	48 89 e5             	mov    %rsp,%rbp
  804ee4:	48 83 ec 10          	sub    $0x10,%rsp
  804ee8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804eec:	89 75 f4             	mov    %esi,-0xc(%rbp)
  804eef:	8b 55 f4             	mov    -0xc(%rbp),%edx
  804ef2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ef6:	48 83 ec 08          	sub    $0x8,%rsp
  804efa:	6a 00                	pushq  $0x0
  804efc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804f02:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804f08:	48 89 d1             	mov    %rdx,%rcx
  804f0b:	48 89 c2             	mov    %rax,%rdx
  804f0e:	be 00 00 00 00       	mov    $0x0,%esi
  804f13:	bf 10 00 00 00       	mov    $0x10,%edi
  804f18:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804f1f:	00 00 00 
  804f22:	ff d0                	callq  *%rax
  804f24:	48 83 c4 10          	add    $0x10,%rsp
  804f28:	c9                   	leaveq 
  804f29:	c3                   	retq   

0000000000804f2a <sys_ept_map>:
  804f2a:	55                   	push   %rbp
  804f2b:	48 89 e5             	mov    %rsp,%rbp
  804f2e:	48 83 ec 20          	sub    $0x20,%rsp
  804f32:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804f35:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804f39:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804f3c:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  804f40:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  804f44:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  804f47:	48 63 c8             	movslq %eax,%rcx
  804f4a:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  804f4e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804f51:	48 63 f0             	movslq %eax,%rsi
  804f54:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804f58:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804f5b:	48 98                	cltq   
  804f5d:	48 83 ec 08          	sub    $0x8,%rsp
  804f61:	51                   	push   %rcx
  804f62:	49 89 f9             	mov    %rdi,%r9
  804f65:	49 89 f0             	mov    %rsi,%r8
  804f68:	48 89 d1             	mov    %rdx,%rcx
  804f6b:	48 89 c2             	mov    %rax,%rdx
  804f6e:	be 00 00 00 00       	mov    $0x0,%esi
  804f73:	bf 11 00 00 00       	mov    $0x11,%edi
  804f78:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804f7f:	00 00 00 
  804f82:	ff d0                	callq  *%rax
  804f84:	48 83 c4 10          	add    $0x10,%rsp
  804f88:	c9                   	leaveq 
  804f89:	c3                   	retq   

0000000000804f8a <sys_env_mkguest>:
  804f8a:	55                   	push   %rbp
  804f8b:	48 89 e5             	mov    %rsp,%rbp
  804f8e:	48 83 ec 10          	sub    $0x10,%rsp
  804f92:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804f96:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804f9a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804f9e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804fa2:	48 83 ec 08          	sub    $0x8,%rsp
  804fa6:	6a 00                	pushq  $0x0
  804fa8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  804fae:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  804fb4:	48 89 d1             	mov    %rdx,%rcx
  804fb7:	48 89 c2             	mov    %rax,%rdx
  804fba:	be 00 00 00 00       	mov    $0x0,%esi
  804fbf:	bf 12 00 00 00       	mov    $0x12,%edi
  804fc4:	48 b8 04 4a 80 00 00 	movabs $0x804a04,%rax
  804fcb:	00 00 00 
  804fce:	ff d0                	callq  *%rax
  804fd0:	48 83 c4 10          	add    $0x10,%rsp
  804fd4:	c9                   	leaveq 
  804fd5:	c3                   	retq   

0000000000804fd6 <set_pgfault_handler>:
  804fd6:	55                   	push   %rbp
  804fd7:	48 89 e5             	mov    %rsp,%rbp
  804fda:	48 83 ec 20          	sub    $0x20,%rsp
  804fde:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804fe2:	48 b8 28 60 81 00 00 	movabs $0x816028,%rax
  804fe9:	00 00 00 
  804fec:	48 8b 00             	mov    (%rax),%rax
  804fef:	48 85 c0             	test   %rax,%rax
  804ff2:	75 6f                	jne    805063 <set_pgfault_handler+0x8d>
  804ff4:	ba 07 00 00 00       	mov    $0x7,%edx
  804ff9:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  804ffe:	bf 00 00 00 00       	mov    $0x0,%edi
  805003:	48 b8 da 4b 80 00 00 	movabs $0x804bda,%rax
  80500a:	00 00 00 
  80500d:	ff d0                	callq  *%rax
  80500f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805012:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805016:	79 30                	jns    805048 <set_pgfault_handler+0x72>
  805018:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80501b:	89 c1                	mov    %eax,%ecx
  80501d:	48 ba f8 7f 80 00 00 	movabs $0x807ff8,%rdx
  805024:	00 00 00 
  805027:	be 22 00 00 00       	mov    $0x22,%esi
  80502c:	48 bf 17 80 80 00 00 	movabs $0x808017,%rdi
  805033:	00 00 00 
  805036:	b8 00 00 00 00       	mov    $0x0,%eax
  80503b:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  805042:	00 00 00 
  805045:	41 ff d0             	callq  *%r8
  805048:	48 be 77 50 80 00 00 	movabs $0x805077,%rsi
  80504f:	00 00 00 
  805052:	bf 00 00 00 00       	mov    $0x0,%edi
  805057:	48 b8 71 4d 80 00 00 	movabs $0x804d71,%rax
  80505e:	00 00 00 
  805061:	ff d0                	callq  *%rax
  805063:	48 b8 28 60 81 00 00 	movabs $0x816028,%rax
  80506a:	00 00 00 
  80506d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  805071:	48 89 10             	mov    %rdx,(%rax)
  805074:	90                   	nop
  805075:	c9                   	leaveq 
  805076:	c3                   	retq   

0000000000805077 <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  805077:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  80507a:	48 a1 28 60 81 00 00 	movabs 0x816028,%rax
  805081:	00 00 00 
call *%rax
  805084:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  805086:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  80508d:	00 08 
    movq 152(%rsp), %rax
  80508f:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  805096:	00 
    movq 136(%rsp), %rbx
  805097:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  80509e:	00 
movq %rbx, (%rax)
  80509f:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  8050a2:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  8050a6:	4c 8b 3c 24          	mov    (%rsp),%r15
  8050aa:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  8050af:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  8050b4:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  8050b9:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  8050be:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  8050c3:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  8050c8:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  8050cd:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  8050d2:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  8050d7:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  8050dc:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  8050e1:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  8050e6:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  8050eb:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  8050f0:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  8050f4:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  8050f8:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  8050f9:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  8050fe:	c3                   	retq   

00000000008050ff <ipc_recv>:
  8050ff:	55                   	push   %rbp
  805100:	48 89 e5             	mov    %rsp,%rbp
  805103:	48 83 ec 30          	sub    $0x30,%rsp
  805107:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80510b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80510f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  805113:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  805118:	75 0e                	jne    805128 <ipc_recv+0x29>
  80511a:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  805121:	00 00 00 
  805124:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  805128:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80512c:	48 89 c7             	mov    %rax,%rdi
  80512f:	48 b8 14 4e 80 00 00 	movabs $0x804e14,%rax
  805136:	00 00 00 
  805139:	ff d0                	callq  *%rax
  80513b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80513e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805142:	79 27                	jns    80516b <ipc_recv+0x6c>
  805144:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  805149:	74 0a                	je     805155 <ipc_recv+0x56>
  80514b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80514f:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  805155:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80515a:	74 0a                	je     805166 <ipc_recv+0x67>
  80515c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805160:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  805166:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805169:	eb 53                	jmp    8051be <ipc_recv+0xbf>
  80516b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  805170:	74 19                	je     80518b <ipc_recv+0x8c>
  805172:	48 b8 20 60 81 00 00 	movabs $0x816020,%rax
  805179:	00 00 00 
  80517c:	48 8b 00             	mov    (%rax),%rax
  80517f:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  805185:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805189:	89 10                	mov    %edx,(%rax)
  80518b:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  805190:	74 19                	je     8051ab <ipc_recv+0xac>
  805192:	48 b8 20 60 81 00 00 	movabs $0x816020,%rax
  805199:	00 00 00 
  80519c:	48 8b 00             	mov    (%rax),%rax
  80519f:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8051a5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8051a9:	89 10                	mov    %edx,(%rax)
  8051ab:	48 b8 20 60 81 00 00 	movabs $0x816020,%rax
  8051b2:	00 00 00 
  8051b5:	48 8b 00             	mov    (%rax),%rax
  8051b8:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8051be:	c9                   	leaveq 
  8051bf:	c3                   	retq   

00000000008051c0 <ipc_send>:
  8051c0:	55                   	push   %rbp
  8051c1:	48 89 e5             	mov    %rsp,%rbp
  8051c4:	48 83 ec 30          	sub    $0x30,%rsp
  8051c8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8051cb:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8051ce:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  8051d2:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8051d5:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8051da:	75 1c                	jne    8051f8 <ipc_send+0x38>
  8051dc:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8051e3:	00 00 00 
  8051e6:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8051ea:	eb 0c                	jmp    8051f8 <ipc_send+0x38>
  8051ec:	48 b8 9d 4b 80 00 00 	movabs $0x804b9d,%rax
  8051f3:	00 00 00 
  8051f6:	ff d0                	callq  *%rax
  8051f8:	8b 75 e8             	mov    -0x18(%rbp),%esi
  8051fb:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8051fe:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  805202:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805205:	89 c7                	mov    %eax,%edi
  805207:	48 b8 bd 4d 80 00 00 	movabs $0x804dbd,%rax
  80520e:	00 00 00 
  805211:	ff d0                	callq  *%rax
  805213:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805216:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  80521a:	74 d0                	je     8051ec <ipc_send+0x2c>
  80521c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805220:	79 30                	jns    805252 <ipc_send+0x92>
  805222:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805225:	89 c1                	mov    %eax,%ecx
  805227:	48 ba 28 80 80 00 00 	movabs $0x808028,%rdx
  80522e:	00 00 00 
  805231:	be 44 00 00 00       	mov    $0x44,%esi
  805236:	48 bf 3e 80 80 00 00 	movabs $0x80803e,%rdi
  80523d:	00 00 00 
  805240:	b8 00 00 00 00       	mov    $0x0,%eax
  805245:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  80524c:	00 00 00 
  80524f:	41 ff d0             	callq  *%r8
  805252:	90                   	nop
  805253:	c9                   	leaveq 
  805254:	c3                   	retq   

0000000000805255 <ipc_host_recv>:
  805255:	55                   	push   %rbp
  805256:	48 89 e5             	mov    %rsp,%rbp
  805259:	48 83 ec 10          	sub    $0x10,%rsp
  80525d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805261:	48 ba 50 80 80 00 00 	movabs $0x808050,%rdx
  805268:	00 00 00 
  80526b:	be 4e 00 00 00       	mov    $0x4e,%esi
  805270:	48 bf 3e 80 80 00 00 	movabs $0x80803e,%rdi
  805277:	00 00 00 
  80527a:	b8 00 00 00 00       	mov    $0x0,%eax
  80527f:	48 b9 e0 34 80 00 00 	movabs $0x8034e0,%rcx
  805286:	00 00 00 
  805289:	ff d1                	callq  *%rcx

000000000080528b <ipc_host_send>:
  80528b:	55                   	push   %rbp
  80528c:	48 89 e5             	mov    %rsp,%rbp
  80528f:	48 83 ec 20          	sub    $0x20,%rsp
  805293:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805296:	89 75 f8             	mov    %esi,-0x8(%rbp)
  805299:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  80529d:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8052a0:	48 ba 70 80 80 00 00 	movabs $0x808070,%rdx
  8052a7:	00 00 00 
  8052aa:	be 58 00 00 00       	mov    $0x58,%esi
  8052af:	48 bf 3e 80 80 00 00 	movabs $0x80803e,%rdi
  8052b6:	00 00 00 
  8052b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8052be:	48 b9 e0 34 80 00 00 	movabs $0x8034e0,%rcx
  8052c5:	00 00 00 
  8052c8:	ff d1                	callq  *%rcx

00000000008052ca <ipc_find_env>:
  8052ca:	55                   	push   %rbp
  8052cb:	48 89 e5             	mov    %rsp,%rbp
  8052ce:	48 83 ec 18          	sub    $0x18,%rsp
  8052d2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8052d5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8052dc:	eb 4d                	jmp    80532b <ipc_find_env+0x61>
  8052de:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8052e5:	00 00 00 
  8052e8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8052eb:	48 98                	cltq   
  8052ed:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8052f4:	48 01 d0             	add    %rdx,%rax
  8052f7:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8052fd:	8b 00                	mov    (%rax),%eax
  8052ff:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  805302:	75 23                	jne    805327 <ipc_find_env+0x5d>
  805304:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80530b:	00 00 00 
  80530e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805311:	48 98                	cltq   
  805313:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80531a:	48 01 d0             	add    %rdx,%rax
  80531d:	48 05 c8 00 00 00    	add    $0xc8,%rax
  805323:	8b 00                	mov    (%rax),%eax
  805325:	eb 12                	jmp    805339 <ipc_find_env+0x6f>
  805327:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80532b:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  805332:	7e aa                	jle    8052de <ipc_find_env+0x14>
  805334:	b8 00 00 00 00       	mov    $0x0,%eax
  805339:	c9                   	leaveq 
  80533a:	c3                   	retq   

000000000080533b <fd2num>:
  80533b:	55                   	push   %rbp
  80533c:	48 89 e5             	mov    %rsp,%rbp
  80533f:	48 83 ec 08          	sub    $0x8,%rsp
  805343:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805347:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80534b:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  805352:	ff ff ff 
  805355:	48 01 d0             	add    %rdx,%rax
  805358:	48 c1 e8 0c          	shr    $0xc,%rax
  80535c:	c9                   	leaveq 
  80535d:	c3                   	retq   

000000000080535e <fd2data>:
  80535e:	55                   	push   %rbp
  80535f:	48 89 e5             	mov    %rsp,%rbp
  805362:	48 83 ec 08          	sub    $0x8,%rsp
  805366:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80536a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80536e:	48 89 c7             	mov    %rax,%rdi
  805371:	48 b8 3b 53 80 00 00 	movabs $0x80533b,%rax
  805378:	00 00 00 
  80537b:	ff d0                	callq  *%rax
  80537d:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  805383:	48 c1 e0 0c          	shl    $0xc,%rax
  805387:	c9                   	leaveq 
  805388:	c3                   	retq   

0000000000805389 <fd_alloc>:
  805389:	55                   	push   %rbp
  80538a:	48 89 e5             	mov    %rsp,%rbp
  80538d:	48 83 ec 18          	sub    $0x18,%rsp
  805391:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  805395:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80539c:	eb 6b                	jmp    805409 <fd_alloc+0x80>
  80539e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8053a1:	48 98                	cltq   
  8053a3:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8053a9:	48 c1 e0 0c          	shl    $0xc,%rax
  8053ad:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8053b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8053b5:	48 c1 e8 15          	shr    $0x15,%rax
  8053b9:	48 89 c2             	mov    %rax,%rdx
  8053bc:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8053c3:	01 00 00 
  8053c6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8053ca:	83 e0 01             	and    $0x1,%eax
  8053cd:	48 85 c0             	test   %rax,%rax
  8053d0:	74 21                	je     8053f3 <fd_alloc+0x6a>
  8053d2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8053d6:	48 c1 e8 0c          	shr    $0xc,%rax
  8053da:	48 89 c2             	mov    %rax,%rdx
  8053dd:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8053e4:	01 00 00 
  8053e7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8053eb:	83 e0 01             	and    $0x1,%eax
  8053ee:	48 85 c0             	test   %rax,%rax
  8053f1:	75 12                	jne    805405 <fd_alloc+0x7c>
  8053f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8053f7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8053fb:	48 89 10             	mov    %rdx,(%rax)
  8053fe:	b8 00 00 00 00       	mov    $0x0,%eax
  805403:	eb 1a                	jmp    80541f <fd_alloc+0x96>
  805405:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  805409:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80540d:	7e 8f                	jle    80539e <fd_alloc+0x15>
  80540f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805413:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80541a:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  80541f:	c9                   	leaveq 
  805420:	c3                   	retq   

0000000000805421 <fd_lookup>:
  805421:	55                   	push   %rbp
  805422:	48 89 e5             	mov    %rsp,%rbp
  805425:	48 83 ec 20          	sub    $0x20,%rsp
  805429:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80542c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805430:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  805434:	78 06                	js     80543c <fd_lookup+0x1b>
  805436:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  80543a:	7e 07                	jle    805443 <fd_lookup+0x22>
  80543c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  805441:	eb 6c                	jmp    8054af <fd_lookup+0x8e>
  805443:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805446:	48 98                	cltq   
  805448:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80544e:	48 c1 e0 0c          	shl    $0xc,%rax
  805452:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  805456:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80545a:	48 c1 e8 15          	shr    $0x15,%rax
  80545e:	48 89 c2             	mov    %rax,%rdx
  805461:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  805468:	01 00 00 
  80546b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80546f:	83 e0 01             	and    $0x1,%eax
  805472:	48 85 c0             	test   %rax,%rax
  805475:	74 21                	je     805498 <fd_lookup+0x77>
  805477:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80547b:	48 c1 e8 0c          	shr    $0xc,%rax
  80547f:	48 89 c2             	mov    %rax,%rdx
  805482:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  805489:	01 00 00 
  80548c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805490:	83 e0 01             	and    $0x1,%eax
  805493:	48 85 c0             	test   %rax,%rax
  805496:	75 07                	jne    80549f <fd_lookup+0x7e>
  805498:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80549d:	eb 10                	jmp    8054af <fd_lookup+0x8e>
  80549f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8054a3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8054a7:	48 89 10             	mov    %rdx,(%rax)
  8054aa:	b8 00 00 00 00       	mov    $0x0,%eax
  8054af:	c9                   	leaveq 
  8054b0:	c3                   	retq   

00000000008054b1 <fd_close>:
  8054b1:	55                   	push   %rbp
  8054b2:	48 89 e5             	mov    %rsp,%rbp
  8054b5:	48 83 ec 30          	sub    $0x30,%rsp
  8054b9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8054bd:	89 f0                	mov    %esi,%eax
  8054bf:	88 45 d4             	mov    %al,-0x2c(%rbp)
  8054c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8054c6:	48 89 c7             	mov    %rax,%rdi
  8054c9:	48 b8 3b 53 80 00 00 	movabs $0x80533b,%rax
  8054d0:	00 00 00 
  8054d3:	ff d0                	callq  *%rax
  8054d5:	89 c2                	mov    %eax,%edx
  8054d7:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8054db:	48 89 c6             	mov    %rax,%rsi
  8054de:	89 d7                	mov    %edx,%edi
  8054e0:	48 b8 21 54 80 00 00 	movabs $0x805421,%rax
  8054e7:	00 00 00 
  8054ea:	ff d0                	callq  *%rax
  8054ec:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8054ef:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8054f3:	78 0a                	js     8054ff <fd_close+0x4e>
  8054f5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8054f9:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8054fd:	74 12                	je     805511 <fd_close+0x60>
  8054ff:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  805503:	74 05                	je     80550a <fd_close+0x59>
  805505:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805508:	eb 70                	jmp    80557a <fd_close+0xc9>
  80550a:	b8 00 00 00 00       	mov    $0x0,%eax
  80550f:	eb 69                	jmp    80557a <fd_close+0xc9>
  805511:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805515:	8b 00                	mov    (%rax),%eax
  805517:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80551b:	48 89 d6             	mov    %rdx,%rsi
  80551e:	89 c7                	mov    %eax,%edi
  805520:	48 b8 7c 55 80 00 00 	movabs $0x80557c,%rax
  805527:	00 00 00 
  80552a:	ff d0                	callq  *%rax
  80552c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80552f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805533:	78 2a                	js     80555f <fd_close+0xae>
  805535:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805539:	48 8b 40 20          	mov    0x20(%rax),%rax
  80553d:	48 85 c0             	test   %rax,%rax
  805540:	74 16                	je     805558 <fd_close+0xa7>
  805542:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805546:	48 8b 40 20          	mov    0x20(%rax),%rax
  80554a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80554e:	48 89 d7             	mov    %rdx,%rdi
  805551:	ff d0                	callq  *%rax
  805553:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805556:	eb 07                	jmp    80555f <fd_close+0xae>
  805558:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80555f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805563:	48 89 c6             	mov    %rax,%rsi
  805566:	bf 00 00 00 00       	mov    $0x0,%edi
  80556b:	48 b8 8c 4c 80 00 00 	movabs $0x804c8c,%rax
  805572:	00 00 00 
  805575:	ff d0                	callq  *%rax
  805577:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80557a:	c9                   	leaveq 
  80557b:	c3                   	retq   

000000000080557c <dev_lookup>:
  80557c:	55                   	push   %rbp
  80557d:	48 89 e5             	mov    %rsp,%rbp
  805580:	48 83 ec 20          	sub    $0x20,%rsp
  805584:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805587:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80558b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  805592:	eb 41                	jmp    8055d5 <dev_lookup+0x59>
  805594:	48 b8 a0 20 81 00 00 	movabs $0x8120a0,%rax
  80559b:	00 00 00 
  80559e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8055a1:	48 63 d2             	movslq %edx,%rdx
  8055a4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8055a8:	8b 00                	mov    (%rax),%eax
  8055aa:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8055ad:	75 22                	jne    8055d1 <dev_lookup+0x55>
  8055af:	48 b8 a0 20 81 00 00 	movabs $0x8120a0,%rax
  8055b6:	00 00 00 
  8055b9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8055bc:	48 63 d2             	movslq %edx,%rdx
  8055bf:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8055c3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8055c7:	48 89 10             	mov    %rdx,(%rax)
  8055ca:	b8 00 00 00 00       	mov    $0x0,%eax
  8055cf:	eb 60                	jmp    805631 <dev_lookup+0xb5>
  8055d1:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8055d5:	48 b8 a0 20 81 00 00 	movabs $0x8120a0,%rax
  8055dc:	00 00 00 
  8055df:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8055e2:	48 63 d2             	movslq %edx,%rdx
  8055e5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8055e9:	48 85 c0             	test   %rax,%rax
  8055ec:	75 a6                	jne    805594 <dev_lookup+0x18>
  8055ee:	48 b8 20 60 81 00 00 	movabs $0x816020,%rax
  8055f5:	00 00 00 
  8055f8:	48 8b 00             	mov    (%rax),%rax
  8055fb:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  805601:	8b 55 ec             	mov    -0x14(%rbp),%edx
  805604:	89 c6                	mov    %eax,%esi
  805606:	48 bf 90 80 80 00 00 	movabs $0x808090,%rdi
  80560d:	00 00 00 
  805610:	b8 00 00 00 00       	mov    $0x0,%eax
  805615:	48 b9 1a 37 80 00 00 	movabs $0x80371a,%rcx
  80561c:	00 00 00 
  80561f:	ff d1                	callq  *%rcx
  805621:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805625:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80562c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  805631:	c9                   	leaveq 
  805632:	c3                   	retq   

0000000000805633 <close>:
  805633:	55                   	push   %rbp
  805634:	48 89 e5             	mov    %rsp,%rbp
  805637:	48 83 ec 20          	sub    $0x20,%rsp
  80563b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80563e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  805642:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805645:	48 89 d6             	mov    %rdx,%rsi
  805648:	89 c7                	mov    %eax,%edi
  80564a:	48 b8 21 54 80 00 00 	movabs $0x805421,%rax
  805651:	00 00 00 
  805654:	ff d0                	callq  *%rax
  805656:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805659:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80565d:	79 05                	jns    805664 <close+0x31>
  80565f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805662:	eb 18                	jmp    80567c <close+0x49>
  805664:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805668:	be 01 00 00 00       	mov    $0x1,%esi
  80566d:	48 89 c7             	mov    %rax,%rdi
  805670:	48 b8 b1 54 80 00 00 	movabs $0x8054b1,%rax
  805677:	00 00 00 
  80567a:	ff d0                	callq  *%rax
  80567c:	c9                   	leaveq 
  80567d:	c3                   	retq   

000000000080567e <close_all>:
  80567e:	55                   	push   %rbp
  80567f:	48 89 e5             	mov    %rsp,%rbp
  805682:	48 83 ec 10          	sub    $0x10,%rsp
  805686:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80568d:	eb 15                	jmp    8056a4 <close_all+0x26>
  80568f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805692:	89 c7                	mov    %eax,%edi
  805694:	48 b8 33 56 80 00 00 	movabs $0x805633,%rax
  80569b:	00 00 00 
  80569e:	ff d0                	callq  *%rax
  8056a0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8056a4:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8056a8:	7e e5                	jle    80568f <close_all+0x11>
  8056aa:	90                   	nop
  8056ab:	c9                   	leaveq 
  8056ac:	c3                   	retq   

00000000008056ad <dup>:
  8056ad:	55                   	push   %rbp
  8056ae:	48 89 e5             	mov    %rsp,%rbp
  8056b1:	48 83 ec 40          	sub    $0x40,%rsp
  8056b5:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8056b8:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8056bb:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8056bf:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8056c2:	48 89 d6             	mov    %rdx,%rsi
  8056c5:	89 c7                	mov    %eax,%edi
  8056c7:	48 b8 21 54 80 00 00 	movabs $0x805421,%rax
  8056ce:	00 00 00 
  8056d1:	ff d0                	callq  *%rax
  8056d3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8056d6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8056da:	79 08                	jns    8056e4 <dup+0x37>
  8056dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8056df:	e9 70 01 00 00       	jmpq   805854 <dup+0x1a7>
  8056e4:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8056e7:	89 c7                	mov    %eax,%edi
  8056e9:	48 b8 33 56 80 00 00 	movabs $0x805633,%rax
  8056f0:	00 00 00 
  8056f3:	ff d0                	callq  *%rax
  8056f5:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8056f8:	48 98                	cltq   
  8056fa:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  805700:	48 c1 e0 0c          	shl    $0xc,%rax
  805704:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  805708:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80570c:	48 89 c7             	mov    %rax,%rdi
  80570f:	48 b8 5e 53 80 00 00 	movabs $0x80535e,%rax
  805716:	00 00 00 
  805719:	ff d0                	callq  *%rax
  80571b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80571f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805723:	48 89 c7             	mov    %rax,%rdi
  805726:	48 b8 5e 53 80 00 00 	movabs $0x80535e,%rax
  80572d:	00 00 00 
  805730:	ff d0                	callq  *%rax
  805732:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  805736:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80573a:	48 c1 e8 15          	shr    $0x15,%rax
  80573e:	48 89 c2             	mov    %rax,%rdx
  805741:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  805748:	01 00 00 
  80574b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80574f:	83 e0 01             	and    $0x1,%eax
  805752:	48 85 c0             	test   %rax,%rax
  805755:	74 71                	je     8057c8 <dup+0x11b>
  805757:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80575b:	48 c1 e8 0c          	shr    $0xc,%rax
  80575f:	48 89 c2             	mov    %rax,%rdx
  805762:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  805769:	01 00 00 
  80576c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805770:	83 e0 01             	and    $0x1,%eax
  805773:	48 85 c0             	test   %rax,%rax
  805776:	74 50                	je     8057c8 <dup+0x11b>
  805778:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80577c:	48 c1 e8 0c          	shr    $0xc,%rax
  805780:	48 89 c2             	mov    %rax,%rdx
  805783:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80578a:	01 00 00 
  80578d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  805791:	25 07 0e 00 00       	and    $0xe07,%eax
  805796:	89 c1                	mov    %eax,%ecx
  805798:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80579c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8057a0:	41 89 c8             	mov    %ecx,%r8d
  8057a3:	48 89 d1             	mov    %rdx,%rcx
  8057a6:	ba 00 00 00 00       	mov    $0x0,%edx
  8057ab:	48 89 c6             	mov    %rax,%rsi
  8057ae:	bf 00 00 00 00       	mov    $0x0,%edi
  8057b3:	48 b8 2c 4c 80 00 00 	movabs $0x804c2c,%rax
  8057ba:	00 00 00 
  8057bd:	ff d0                	callq  *%rax
  8057bf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8057c2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8057c6:	78 55                	js     80581d <dup+0x170>
  8057c8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8057cc:	48 c1 e8 0c          	shr    $0xc,%rax
  8057d0:	48 89 c2             	mov    %rax,%rdx
  8057d3:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8057da:	01 00 00 
  8057dd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8057e1:	25 07 0e 00 00       	and    $0xe07,%eax
  8057e6:	89 c1                	mov    %eax,%ecx
  8057e8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8057ec:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8057f0:	41 89 c8             	mov    %ecx,%r8d
  8057f3:	48 89 d1             	mov    %rdx,%rcx
  8057f6:	ba 00 00 00 00       	mov    $0x0,%edx
  8057fb:	48 89 c6             	mov    %rax,%rsi
  8057fe:	bf 00 00 00 00       	mov    $0x0,%edi
  805803:	48 b8 2c 4c 80 00 00 	movabs $0x804c2c,%rax
  80580a:	00 00 00 
  80580d:	ff d0                	callq  *%rax
  80580f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805812:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805816:	78 08                	js     805820 <dup+0x173>
  805818:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80581b:	eb 37                	jmp    805854 <dup+0x1a7>
  80581d:	90                   	nop
  80581e:	eb 01                	jmp    805821 <dup+0x174>
  805820:	90                   	nop
  805821:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805825:	48 89 c6             	mov    %rax,%rsi
  805828:	bf 00 00 00 00       	mov    $0x0,%edi
  80582d:	48 b8 8c 4c 80 00 00 	movabs $0x804c8c,%rax
  805834:	00 00 00 
  805837:	ff d0                	callq  *%rax
  805839:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80583d:	48 89 c6             	mov    %rax,%rsi
  805840:	bf 00 00 00 00       	mov    $0x0,%edi
  805845:	48 b8 8c 4c 80 00 00 	movabs $0x804c8c,%rax
  80584c:	00 00 00 
  80584f:	ff d0                	callq  *%rax
  805851:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805854:	c9                   	leaveq 
  805855:	c3                   	retq   

0000000000805856 <read>:
  805856:	55                   	push   %rbp
  805857:	48 89 e5             	mov    %rsp,%rbp
  80585a:	48 83 ec 40          	sub    $0x40,%rsp
  80585e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  805861:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  805865:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  805869:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80586d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  805870:	48 89 d6             	mov    %rdx,%rsi
  805873:	89 c7                	mov    %eax,%edi
  805875:	48 b8 21 54 80 00 00 	movabs $0x805421,%rax
  80587c:	00 00 00 
  80587f:	ff d0                	callq  *%rax
  805881:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805884:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805888:	78 24                	js     8058ae <read+0x58>
  80588a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80588e:	8b 00                	mov    (%rax),%eax
  805890:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  805894:	48 89 d6             	mov    %rdx,%rsi
  805897:	89 c7                	mov    %eax,%edi
  805899:	48 b8 7c 55 80 00 00 	movabs $0x80557c,%rax
  8058a0:	00 00 00 
  8058a3:	ff d0                	callq  *%rax
  8058a5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8058a8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8058ac:	79 05                	jns    8058b3 <read+0x5d>
  8058ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8058b1:	eb 76                	jmp    805929 <read+0xd3>
  8058b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8058b7:	8b 40 08             	mov    0x8(%rax),%eax
  8058ba:	83 e0 03             	and    $0x3,%eax
  8058bd:	83 f8 01             	cmp    $0x1,%eax
  8058c0:	75 3a                	jne    8058fc <read+0xa6>
  8058c2:	48 b8 20 60 81 00 00 	movabs $0x816020,%rax
  8058c9:	00 00 00 
  8058cc:	48 8b 00             	mov    (%rax),%rax
  8058cf:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8058d5:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8058d8:	89 c6                	mov    %eax,%esi
  8058da:	48 bf af 80 80 00 00 	movabs $0x8080af,%rdi
  8058e1:	00 00 00 
  8058e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8058e9:	48 b9 1a 37 80 00 00 	movabs $0x80371a,%rcx
  8058f0:	00 00 00 
  8058f3:	ff d1                	callq  *%rcx
  8058f5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8058fa:	eb 2d                	jmp    805929 <read+0xd3>
  8058fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805900:	48 8b 40 10          	mov    0x10(%rax),%rax
  805904:	48 85 c0             	test   %rax,%rax
  805907:	75 07                	jne    805910 <read+0xba>
  805909:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80590e:	eb 19                	jmp    805929 <read+0xd3>
  805910:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805914:	48 8b 40 10          	mov    0x10(%rax),%rax
  805918:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80591c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  805920:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  805924:	48 89 cf             	mov    %rcx,%rdi
  805927:	ff d0                	callq  *%rax
  805929:	c9                   	leaveq 
  80592a:	c3                   	retq   

000000000080592b <readn>:
  80592b:	55                   	push   %rbp
  80592c:	48 89 e5             	mov    %rsp,%rbp
  80592f:	48 83 ec 30          	sub    $0x30,%rsp
  805933:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805936:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80593a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80593e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  805945:	eb 47                	jmp    80598e <readn+0x63>
  805947:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80594a:	48 98                	cltq   
  80594c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  805950:	48 29 c2             	sub    %rax,%rdx
  805953:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805956:	48 63 c8             	movslq %eax,%rcx
  805959:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80595d:	48 01 c1             	add    %rax,%rcx
  805960:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805963:	48 89 ce             	mov    %rcx,%rsi
  805966:	89 c7                	mov    %eax,%edi
  805968:	48 b8 56 58 80 00 00 	movabs $0x805856,%rax
  80596f:	00 00 00 
  805972:	ff d0                	callq  *%rax
  805974:	89 45 f8             	mov    %eax,-0x8(%rbp)
  805977:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80597b:	79 05                	jns    805982 <readn+0x57>
  80597d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805980:	eb 1d                	jmp    80599f <readn+0x74>
  805982:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  805986:	74 13                	je     80599b <readn+0x70>
  805988:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80598b:	01 45 fc             	add    %eax,-0x4(%rbp)
  80598e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805991:	48 98                	cltq   
  805993:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  805997:	72 ae                	jb     805947 <readn+0x1c>
  805999:	eb 01                	jmp    80599c <readn+0x71>
  80599b:	90                   	nop
  80599c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80599f:	c9                   	leaveq 
  8059a0:	c3                   	retq   

00000000008059a1 <write>:
  8059a1:	55                   	push   %rbp
  8059a2:	48 89 e5             	mov    %rsp,%rbp
  8059a5:	48 83 ec 40          	sub    $0x40,%rsp
  8059a9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8059ac:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8059b0:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8059b4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8059b8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8059bb:	48 89 d6             	mov    %rdx,%rsi
  8059be:	89 c7                	mov    %eax,%edi
  8059c0:	48 b8 21 54 80 00 00 	movabs $0x805421,%rax
  8059c7:	00 00 00 
  8059ca:	ff d0                	callq  *%rax
  8059cc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8059cf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8059d3:	78 24                	js     8059f9 <write+0x58>
  8059d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8059d9:	8b 00                	mov    (%rax),%eax
  8059db:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8059df:	48 89 d6             	mov    %rdx,%rsi
  8059e2:	89 c7                	mov    %eax,%edi
  8059e4:	48 b8 7c 55 80 00 00 	movabs $0x80557c,%rax
  8059eb:	00 00 00 
  8059ee:	ff d0                	callq  *%rax
  8059f0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8059f3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8059f7:	79 05                	jns    8059fe <write+0x5d>
  8059f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8059fc:	eb 75                	jmp    805a73 <write+0xd2>
  8059fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805a02:	8b 40 08             	mov    0x8(%rax),%eax
  805a05:	83 e0 03             	and    $0x3,%eax
  805a08:	85 c0                	test   %eax,%eax
  805a0a:	75 3a                	jne    805a46 <write+0xa5>
  805a0c:	48 b8 20 60 81 00 00 	movabs $0x816020,%rax
  805a13:	00 00 00 
  805a16:	48 8b 00             	mov    (%rax),%rax
  805a19:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  805a1f:	8b 55 dc             	mov    -0x24(%rbp),%edx
  805a22:	89 c6                	mov    %eax,%esi
  805a24:	48 bf cb 80 80 00 00 	movabs $0x8080cb,%rdi
  805a2b:	00 00 00 
  805a2e:	b8 00 00 00 00       	mov    $0x0,%eax
  805a33:	48 b9 1a 37 80 00 00 	movabs $0x80371a,%rcx
  805a3a:	00 00 00 
  805a3d:	ff d1                	callq  *%rcx
  805a3f:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  805a44:	eb 2d                	jmp    805a73 <write+0xd2>
  805a46:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805a4a:	48 8b 40 18          	mov    0x18(%rax),%rax
  805a4e:	48 85 c0             	test   %rax,%rax
  805a51:	75 07                	jne    805a5a <write+0xb9>
  805a53:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  805a58:	eb 19                	jmp    805a73 <write+0xd2>
  805a5a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805a5e:	48 8b 40 18          	mov    0x18(%rax),%rax
  805a62:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  805a66:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  805a6a:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  805a6e:	48 89 cf             	mov    %rcx,%rdi
  805a71:	ff d0                	callq  *%rax
  805a73:	c9                   	leaveq 
  805a74:	c3                   	retq   

0000000000805a75 <seek>:
  805a75:	55                   	push   %rbp
  805a76:	48 89 e5             	mov    %rsp,%rbp
  805a79:	48 83 ec 18          	sub    $0x18,%rsp
  805a7d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805a80:	89 75 e8             	mov    %esi,-0x18(%rbp)
  805a83:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  805a87:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805a8a:	48 89 d6             	mov    %rdx,%rsi
  805a8d:	89 c7                	mov    %eax,%edi
  805a8f:	48 b8 21 54 80 00 00 	movabs $0x805421,%rax
  805a96:	00 00 00 
  805a99:	ff d0                	callq  *%rax
  805a9b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805a9e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805aa2:	79 05                	jns    805aa9 <seek+0x34>
  805aa4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805aa7:	eb 0f                	jmp    805ab8 <seek+0x43>
  805aa9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805aad:	8b 55 e8             	mov    -0x18(%rbp),%edx
  805ab0:	89 50 04             	mov    %edx,0x4(%rax)
  805ab3:	b8 00 00 00 00       	mov    $0x0,%eax
  805ab8:	c9                   	leaveq 
  805ab9:	c3                   	retq   

0000000000805aba <ftruncate>:
  805aba:	55                   	push   %rbp
  805abb:	48 89 e5             	mov    %rsp,%rbp
  805abe:	48 83 ec 30          	sub    $0x30,%rsp
  805ac2:	89 7d dc             	mov    %edi,-0x24(%rbp)
  805ac5:	89 75 d8             	mov    %esi,-0x28(%rbp)
  805ac8:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  805acc:	8b 45 dc             	mov    -0x24(%rbp),%eax
  805acf:	48 89 d6             	mov    %rdx,%rsi
  805ad2:	89 c7                	mov    %eax,%edi
  805ad4:	48 b8 21 54 80 00 00 	movabs $0x805421,%rax
  805adb:	00 00 00 
  805ade:	ff d0                	callq  *%rax
  805ae0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805ae3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805ae7:	78 24                	js     805b0d <ftruncate+0x53>
  805ae9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805aed:	8b 00                	mov    (%rax),%eax
  805aef:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  805af3:	48 89 d6             	mov    %rdx,%rsi
  805af6:	89 c7                	mov    %eax,%edi
  805af8:	48 b8 7c 55 80 00 00 	movabs $0x80557c,%rax
  805aff:	00 00 00 
  805b02:	ff d0                	callq  *%rax
  805b04:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805b07:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805b0b:	79 05                	jns    805b12 <ftruncate+0x58>
  805b0d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805b10:	eb 72                	jmp    805b84 <ftruncate+0xca>
  805b12:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805b16:	8b 40 08             	mov    0x8(%rax),%eax
  805b19:	83 e0 03             	and    $0x3,%eax
  805b1c:	85 c0                	test   %eax,%eax
  805b1e:	75 3a                	jne    805b5a <ftruncate+0xa0>
  805b20:	48 b8 20 60 81 00 00 	movabs $0x816020,%rax
  805b27:	00 00 00 
  805b2a:	48 8b 00             	mov    (%rax),%rax
  805b2d:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  805b33:	8b 55 dc             	mov    -0x24(%rbp),%edx
  805b36:	89 c6                	mov    %eax,%esi
  805b38:	48 bf e8 80 80 00 00 	movabs $0x8080e8,%rdi
  805b3f:	00 00 00 
  805b42:	b8 00 00 00 00       	mov    $0x0,%eax
  805b47:	48 b9 1a 37 80 00 00 	movabs $0x80371a,%rcx
  805b4e:	00 00 00 
  805b51:	ff d1                	callq  *%rcx
  805b53:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  805b58:	eb 2a                	jmp    805b84 <ftruncate+0xca>
  805b5a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805b5e:	48 8b 40 30          	mov    0x30(%rax),%rax
  805b62:	48 85 c0             	test   %rax,%rax
  805b65:	75 07                	jne    805b6e <ftruncate+0xb4>
  805b67:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  805b6c:	eb 16                	jmp    805b84 <ftruncate+0xca>
  805b6e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805b72:	48 8b 40 30          	mov    0x30(%rax),%rax
  805b76:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  805b7a:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  805b7d:	89 ce                	mov    %ecx,%esi
  805b7f:	48 89 d7             	mov    %rdx,%rdi
  805b82:	ff d0                	callq  *%rax
  805b84:	c9                   	leaveq 
  805b85:	c3                   	retq   

0000000000805b86 <fstat>:
  805b86:	55                   	push   %rbp
  805b87:	48 89 e5             	mov    %rsp,%rbp
  805b8a:	48 83 ec 30          	sub    $0x30,%rsp
  805b8e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  805b91:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  805b95:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  805b99:	8b 45 dc             	mov    -0x24(%rbp),%eax
  805b9c:	48 89 d6             	mov    %rdx,%rsi
  805b9f:	89 c7                	mov    %eax,%edi
  805ba1:	48 b8 21 54 80 00 00 	movabs $0x805421,%rax
  805ba8:	00 00 00 
  805bab:	ff d0                	callq  *%rax
  805bad:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805bb0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805bb4:	78 24                	js     805bda <fstat+0x54>
  805bb6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805bba:	8b 00                	mov    (%rax),%eax
  805bbc:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  805bc0:	48 89 d6             	mov    %rdx,%rsi
  805bc3:	89 c7                	mov    %eax,%edi
  805bc5:	48 b8 7c 55 80 00 00 	movabs $0x80557c,%rax
  805bcc:	00 00 00 
  805bcf:	ff d0                	callq  *%rax
  805bd1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805bd4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805bd8:	79 05                	jns    805bdf <fstat+0x59>
  805bda:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805bdd:	eb 5e                	jmp    805c3d <fstat+0xb7>
  805bdf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805be3:	48 8b 40 28          	mov    0x28(%rax),%rax
  805be7:	48 85 c0             	test   %rax,%rax
  805bea:	75 07                	jne    805bf3 <fstat+0x6d>
  805bec:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  805bf1:	eb 4a                	jmp    805c3d <fstat+0xb7>
  805bf3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805bf7:	c6 00 00             	movb   $0x0,(%rax)
  805bfa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805bfe:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  805c05:	00 00 00 
  805c08:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805c0c:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  805c13:	00 00 00 
  805c16:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  805c1a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805c1e:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  805c25:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805c29:	48 8b 40 28          	mov    0x28(%rax),%rax
  805c2d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  805c31:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  805c35:	48 89 ce             	mov    %rcx,%rsi
  805c38:	48 89 d7             	mov    %rdx,%rdi
  805c3b:	ff d0                	callq  *%rax
  805c3d:	c9                   	leaveq 
  805c3e:	c3                   	retq   

0000000000805c3f <stat>:
  805c3f:	55                   	push   %rbp
  805c40:	48 89 e5             	mov    %rsp,%rbp
  805c43:	48 83 ec 20          	sub    $0x20,%rsp
  805c47:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  805c4b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805c4f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805c53:	be 00 00 00 00       	mov    $0x0,%esi
  805c58:	48 89 c7             	mov    %rax,%rdi
  805c5b:	48 b8 2f 5d 80 00 00 	movabs $0x805d2f,%rax
  805c62:	00 00 00 
  805c65:	ff d0                	callq  *%rax
  805c67:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805c6a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805c6e:	79 05                	jns    805c75 <stat+0x36>
  805c70:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805c73:	eb 2f                	jmp    805ca4 <stat+0x65>
  805c75:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  805c79:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805c7c:	48 89 d6             	mov    %rdx,%rsi
  805c7f:	89 c7                	mov    %eax,%edi
  805c81:	48 b8 86 5b 80 00 00 	movabs $0x805b86,%rax
  805c88:	00 00 00 
  805c8b:	ff d0                	callq  *%rax
  805c8d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  805c90:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805c93:	89 c7                	mov    %eax,%edi
  805c95:	48 b8 33 56 80 00 00 	movabs $0x805633,%rax
  805c9c:	00 00 00 
  805c9f:	ff d0                	callq  *%rax
  805ca1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805ca4:	c9                   	leaveq 
  805ca5:	c3                   	retq   

0000000000805ca6 <fsipc>:
  805ca6:	55                   	push   %rbp
  805ca7:	48 89 e5             	mov    %rsp,%rbp
  805caa:	48 83 ec 10          	sub    $0x10,%rsp
  805cae:	89 7d fc             	mov    %edi,-0x4(%rbp)
  805cb1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  805cb5:	48 b8 08 60 81 00 00 	movabs $0x816008,%rax
  805cbc:	00 00 00 
  805cbf:	8b 00                	mov    (%rax),%eax
  805cc1:	85 c0                	test   %eax,%eax
  805cc3:	75 1f                	jne    805ce4 <fsipc+0x3e>
  805cc5:	bf 01 00 00 00       	mov    $0x1,%edi
  805cca:	48 b8 ca 52 80 00 00 	movabs $0x8052ca,%rax
  805cd1:	00 00 00 
  805cd4:	ff d0                	callq  *%rax
  805cd6:	89 c2                	mov    %eax,%edx
  805cd8:	48 b8 08 60 81 00 00 	movabs $0x816008,%rax
  805cdf:	00 00 00 
  805ce2:	89 10                	mov    %edx,(%rax)
  805ce4:	48 b8 08 60 81 00 00 	movabs $0x816008,%rax
  805ceb:	00 00 00 
  805cee:	8b 00                	mov    (%rax),%eax
  805cf0:	8b 75 fc             	mov    -0x4(%rbp),%esi
  805cf3:	b9 07 00 00 00       	mov    $0x7,%ecx
  805cf8:	48 ba 00 70 81 00 00 	movabs $0x817000,%rdx
  805cff:	00 00 00 
  805d02:	89 c7                	mov    %eax,%edi
  805d04:	48 b8 c0 51 80 00 00 	movabs $0x8051c0,%rax
  805d0b:	00 00 00 
  805d0e:	ff d0                	callq  *%rax
  805d10:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805d14:	ba 00 00 00 00       	mov    $0x0,%edx
  805d19:	48 89 c6             	mov    %rax,%rsi
  805d1c:	bf 00 00 00 00       	mov    $0x0,%edi
  805d21:	48 b8 ff 50 80 00 00 	movabs $0x8050ff,%rax
  805d28:	00 00 00 
  805d2b:	ff d0                	callq  *%rax
  805d2d:	c9                   	leaveq 
  805d2e:	c3                   	retq   

0000000000805d2f <open>:
  805d2f:	55                   	push   %rbp
  805d30:	48 89 e5             	mov    %rsp,%rbp
  805d33:	48 83 ec 20          	sub    $0x20,%rsp
  805d37:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  805d3b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  805d3e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805d42:	48 89 c7             	mov    %rax,%rdi
  805d45:	48 b8 3e 42 80 00 00 	movabs $0x80423e,%rax
  805d4c:	00 00 00 
  805d4f:	ff d0                	callq  *%rax
  805d51:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  805d56:	7e 0a                	jle    805d62 <open+0x33>
  805d58:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  805d5d:	e9 a5 00 00 00       	jmpq   805e07 <open+0xd8>
  805d62:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  805d66:	48 89 c7             	mov    %rax,%rdi
  805d69:	48 b8 89 53 80 00 00 	movabs $0x805389,%rax
  805d70:	00 00 00 
  805d73:	ff d0                	callq  *%rax
  805d75:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805d78:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805d7c:	79 08                	jns    805d86 <open+0x57>
  805d7e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805d81:	e9 81 00 00 00       	jmpq   805e07 <open+0xd8>
  805d86:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805d8a:	48 89 c6             	mov    %rax,%rsi
  805d8d:	48 bf 00 70 81 00 00 	movabs $0x817000,%rdi
  805d94:	00 00 00 
  805d97:	48 b8 aa 42 80 00 00 	movabs $0x8042aa,%rax
  805d9e:	00 00 00 
  805da1:	ff d0                	callq  *%rax
  805da3:	48 b8 00 70 81 00 00 	movabs $0x817000,%rax
  805daa:	00 00 00 
  805dad:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  805db0:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  805db6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805dba:	48 89 c6             	mov    %rax,%rsi
  805dbd:	bf 01 00 00 00       	mov    $0x1,%edi
  805dc2:	48 b8 a6 5c 80 00 00 	movabs $0x805ca6,%rax
  805dc9:	00 00 00 
  805dcc:	ff d0                	callq  *%rax
  805dce:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805dd1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805dd5:	79 1d                	jns    805df4 <open+0xc5>
  805dd7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805ddb:	be 00 00 00 00       	mov    $0x0,%esi
  805de0:	48 89 c7             	mov    %rax,%rdi
  805de3:	48 b8 b1 54 80 00 00 	movabs $0x8054b1,%rax
  805dea:	00 00 00 
  805ded:	ff d0                	callq  *%rax
  805def:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805df2:	eb 13                	jmp    805e07 <open+0xd8>
  805df4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805df8:	48 89 c7             	mov    %rax,%rdi
  805dfb:	48 b8 3b 53 80 00 00 	movabs $0x80533b,%rax
  805e02:	00 00 00 
  805e05:	ff d0                	callq  *%rax
  805e07:	c9                   	leaveq 
  805e08:	c3                   	retq   

0000000000805e09 <devfile_flush>:
  805e09:	55                   	push   %rbp
  805e0a:	48 89 e5             	mov    %rsp,%rbp
  805e0d:	48 83 ec 10          	sub    $0x10,%rsp
  805e11:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  805e15:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  805e19:	8b 50 0c             	mov    0xc(%rax),%edx
  805e1c:	48 b8 00 70 81 00 00 	movabs $0x817000,%rax
  805e23:	00 00 00 
  805e26:	89 10                	mov    %edx,(%rax)
  805e28:	be 00 00 00 00       	mov    $0x0,%esi
  805e2d:	bf 06 00 00 00       	mov    $0x6,%edi
  805e32:	48 b8 a6 5c 80 00 00 	movabs $0x805ca6,%rax
  805e39:	00 00 00 
  805e3c:	ff d0                	callq  *%rax
  805e3e:	c9                   	leaveq 
  805e3f:	c3                   	retq   

0000000000805e40 <devfile_read>:
  805e40:	55                   	push   %rbp
  805e41:	48 89 e5             	mov    %rsp,%rbp
  805e44:	48 83 ec 30          	sub    $0x30,%rsp
  805e48:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  805e4c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805e50:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  805e54:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805e58:	8b 50 0c             	mov    0xc(%rax),%edx
  805e5b:	48 b8 00 70 81 00 00 	movabs $0x817000,%rax
  805e62:	00 00 00 
  805e65:	89 10                	mov    %edx,(%rax)
  805e67:	48 b8 00 70 81 00 00 	movabs $0x817000,%rax
  805e6e:	00 00 00 
  805e71:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  805e75:	48 89 50 08          	mov    %rdx,0x8(%rax)
  805e79:	be 00 00 00 00       	mov    $0x0,%esi
  805e7e:	bf 03 00 00 00       	mov    $0x3,%edi
  805e83:	48 b8 a6 5c 80 00 00 	movabs $0x805ca6,%rax
  805e8a:	00 00 00 
  805e8d:	ff d0                	callq  *%rax
  805e8f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805e92:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805e96:	79 08                	jns    805ea0 <devfile_read+0x60>
  805e98:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805e9b:	e9 a4 00 00 00       	jmpq   805f44 <devfile_read+0x104>
  805ea0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805ea3:	48 98                	cltq   
  805ea5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  805ea9:	76 35                	jbe    805ee0 <devfile_read+0xa0>
  805eab:	48 b9 0e 81 80 00 00 	movabs $0x80810e,%rcx
  805eb2:	00 00 00 
  805eb5:	48 ba 15 81 80 00 00 	movabs $0x808115,%rdx
  805ebc:	00 00 00 
  805ebf:	be 89 00 00 00       	mov    $0x89,%esi
  805ec4:	48 bf 2a 81 80 00 00 	movabs $0x80812a,%rdi
  805ecb:	00 00 00 
  805ece:	b8 00 00 00 00       	mov    $0x0,%eax
  805ed3:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  805eda:	00 00 00 
  805edd:	41 ff d0             	callq  *%r8
  805ee0:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  805ee7:	7e 35                	jle    805f1e <devfile_read+0xde>
  805ee9:	48 b9 38 81 80 00 00 	movabs $0x808138,%rcx
  805ef0:	00 00 00 
  805ef3:	48 ba 15 81 80 00 00 	movabs $0x808115,%rdx
  805efa:	00 00 00 
  805efd:	be 8a 00 00 00       	mov    $0x8a,%esi
  805f02:	48 bf 2a 81 80 00 00 	movabs $0x80812a,%rdi
  805f09:	00 00 00 
  805f0c:	b8 00 00 00 00       	mov    $0x0,%eax
  805f11:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  805f18:	00 00 00 
  805f1b:	41 ff d0             	callq  *%r8
  805f1e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805f21:	48 63 d0             	movslq %eax,%rdx
  805f24:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805f28:	48 be 00 70 81 00 00 	movabs $0x817000,%rsi
  805f2f:	00 00 00 
  805f32:	48 89 c7             	mov    %rax,%rdi
  805f35:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  805f3c:	00 00 00 
  805f3f:	ff d0                	callq  *%rax
  805f41:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805f44:	c9                   	leaveq 
  805f45:	c3                   	retq   

0000000000805f46 <devfile_write>:
  805f46:	55                   	push   %rbp
  805f47:	48 89 e5             	mov    %rsp,%rbp
  805f4a:	48 83 ec 40          	sub    $0x40,%rsp
  805f4e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  805f52:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  805f56:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  805f5a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  805f5e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  805f62:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  805f69:	00 
  805f6a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  805f6e:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  805f72:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  805f77:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  805f7b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  805f7f:	8b 50 0c             	mov    0xc(%rax),%edx
  805f82:	48 b8 00 70 81 00 00 	movabs $0x817000,%rax
  805f89:	00 00 00 
  805f8c:	89 10                	mov    %edx,(%rax)
  805f8e:	48 b8 00 70 81 00 00 	movabs $0x817000,%rax
  805f95:	00 00 00 
  805f98:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  805f9c:	48 89 50 08          	mov    %rdx,0x8(%rax)
  805fa0:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  805fa4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  805fa8:	48 89 c6             	mov    %rax,%rsi
  805fab:	48 bf 10 70 81 00 00 	movabs $0x817010,%rdi
  805fb2:	00 00 00 
  805fb5:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  805fbc:	00 00 00 
  805fbf:	ff d0                	callq  *%rax
  805fc1:	be 00 00 00 00       	mov    $0x0,%esi
  805fc6:	bf 04 00 00 00       	mov    $0x4,%edi
  805fcb:	48 b8 a6 5c 80 00 00 	movabs $0x805ca6,%rax
  805fd2:	00 00 00 
  805fd5:	ff d0                	callq  *%rax
  805fd7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  805fda:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  805fde:	79 05                	jns    805fe5 <devfile_write+0x9f>
  805fe0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805fe3:	eb 43                	jmp    806028 <devfile_write+0xe2>
  805fe5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  805fe8:	48 98                	cltq   
  805fea:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  805fee:	76 35                	jbe    806025 <devfile_write+0xdf>
  805ff0:	48 b9 0e 81 80 00 00 	movabs $0x80810e,%rcx
  805ff7:	00 00 00 
  805ffa:	48 ba 15 81 80 00 00 	movabs $0x808115,%rdx
  806001:	00 00 00 
  806004:	be a8 00 00 00       	mov    $0xa8,%esi
  806009:	48 bf 2a 81 80 00 00 	movabs $0x80812a,%rdi
  806010:	00 00 00 
  806013:	b8 00 00 00 00       	mov    $0x0,%eax
  806018:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  80601f:	00 00 00 
  806022:	41 ff d0             	callq  *%r8
  806025:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806028:	c9                   	leaveq 
  806029:	c3                   	retq   

000000000080602a <devfile_stat>:
  80602a:	55                   	push   %rbp
  80602b:	48 89 e5             	mov    %rsp,%rbp
  80602e:	48 83 ec 20          	sub    $0x20,%rsp
  806032:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  806036:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80603a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80603e:	8b 50 0c             	mov    0xc(%rax),%edx
  806041:	48 b8 00 70 81 00 00 	movabs $0x817000,%rax
  806048:	00 00 00 
  80604b:	89 10                	mov    %edx,(%rax)
  80604d:	be 00 00 00 00       	mov    $0x0,%esi
  806052:	bf 05 00 00 00       	mov    $0x5,%edi
  806057:	48 b8 a6 5c 80 00 00 	movabs $0x805ca6,%rax
  80605e:	00 00 00 
  806061:	ff d0                	callq  *%rax
  806063:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806066:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80606a:	79 05                	jns    806071 <devfile_stat+0x47>
  80606c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80606f:	eb 56                	jmp    8060c7 <devfile_stat+0x9d>
  806071:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806075:	48 be 00 70 81 00 00 	movabs $0x817000,%rsi
  80607c:	00 00 00 
  80607f:	48 89 c7             	mov    %rax,%rdi
  806082:	48 b8 aa 42 80 00 00 	movabs $0x8042aa,%rax
  806089:	00 00 00 
  80608c:	ff d0                	callq  *%rax
  80608e:	48 b8 00 70 81 00 00 	movabs $0x817000,%rax
  806095:	00 00 00 
  806098:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  80609e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8060a2:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8060a8:	48 b8 00 70 81 00 00 	movabs $0x817000,%rax
  8060af:	00 00 00 
  8060b2:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  8060b8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8060bc:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  8060c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8060c7:	c9                   	leaveq 
  8060c8:	c3                   	retq   

00000000008060c9 <devfile_trunc>:
  8060c9:	55                   	push   %rbp
  8060ca:	48 89 e5             	mov    %rsp,%rbp
  8060cd:	48 83 ec 10          	sub    $0x10,%rsp
  8060d1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8060d5:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8060d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8060dc:	8b 50 0c             	mov    0xc(%rax),%edx
  8060df:	48 b8 00 70 81 00 00 	movabs $0x817000,%rax
  8060e6:	00 00 00 
  8060e9:	89 10                	mov    %edx,(%rax)
  8060eb:	48 b8 00 70 81 00 00 	movabs $0x817000,%rax
  8060f2:	00 00 00 
  8060f5:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8060f8:	89 50 04             	mov    %edx,0x4(%rax)
  8060fb:	be 00 00 00 00       	mov    $0x0,%esi
  806100:	bf 02 00 00 00       	mov    $0x2,%edi
  806105:	48 b8 a6 5c 80 00 00 	movabs $0x805ca6,%rax
  80610c:	00 00 00 
  80610f:	ff d0                	callq  *%rax
  806111:	c9                   	leaveq 
  806112:	c3                   	retq   

0000000000806113 <remove>:
  806113:	55                   	push   %rbp
  806114:	48 89 e5             	mov    %rsp,%rbp
  806117:	48 83 ec 10          	sub    $0x10,%rsp
  80611b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80611f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806123:	48 89 c7             	mov    %rax,%rdi
  806126:	48 b8 3e 42 80 00 00 	movabs $0x80423e,%rax
  80612d:	00 00 00 
  806130:	ff d0                	callq  *%rax
  806132:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  806137:	7e 07                	jle    806140 <remove+0x2d>
  806139:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80613e:	eb 33                	jmp    806173 <remove+0x60>
  806140:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806144:	48 89 c6             	mov    %rax,%rsi
  806147:	48 bf 00 70 81 00 00 	movabs $0x817000,%rdi
  80614e:	00 00 00 
  806151:	48 b8 aa 42 80 00 00 	movabs $0x8042aa,%rax
  806158:	00 00 00 
  80615b:	ff d0                	callq  *%rax
  80615d:	be 00 00 00 00       	mov    $0x0,%esi
  806162:	bf 07 00 00 00       	mov    $0x7,%edi
  806167:	48 b8 a6 5c 80 00 00 	movabs $0x805ca6,%rax
  80616e:	00 00 00 
  806171:	ff d0                	callq  *%rax
  806173:	c9                   	leaveq 
  806174:	c3                   	retq   

0000000000806175 <sync>:
  806175:	55                   	push   %rbp
  806176:	48 89 e5             	mov    %rsp,%rbp
  806179:	be 00 00 00 00       	mov    $0x0,%esi
  80617e:	bf 08 00 00 00       	mov    $0x8,%edi
  806183:	48 b8 a6 5c 80 00 00 	movabs $0x805ca6,%rax
  80618a:	00 00 00 
  80618d:	ff d0                	callq  *%rax
  80618f:	5d                   	pop    %rbp
  806190:	c3                   	retq   

0000000000806191 <copy>:
  806191:	55                   	push   %rbp
  806192:	48 89 e5             	mov    %rsp,%rbp
  806195:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  80619c:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  8061a3:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  8061aa:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  8061b1:	be 00 00 00 00       	mov    $0x0,%esi
  8061b6:	48 89 c7             	mov    %rax,%rdi
  8061b9:	48 b8 2f 5d 80 00 00 	movabs $0x805d2f,%rax
  8061c0:	00 00 00 
  8061c3:	ff d0                	callq  *%rax
  8061c5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8061c8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8061cc:	79 28                	jns    8061f6 <copy+0x65>
  8061ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8061d1:	89 c6                	mov    %eax,%esi
  8061d3:	48 bf 44 81 80 00 00 	movabs $0x808144,%rdi
  8061da:	00 00 00 
  8061dd:	b8 00 00 00 00       	mov    $0x0,%eax
  8061e2:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  8061e9:	00 00 00 
  8061ec:	ff d2                	callq  *%rdx
  8061ee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8061f1:	e9 76 01 00 00       	jmpq   80636c <copy+0x1db>
  8061f6:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  8061fd:	be 01 01 00 00       	mov    $0x101,%esi
  806202:	48 89 c7             	mov    %rax,%rdi
  806205:	48 b8 2f 5d 80 00 00 	movabs $0x805d2f,%rax
  80620c:	00 00 00 
  80620f:	ff d0                	callq  *%rax
  806211:	89 45 f8             	mov    %eax,-0x8(%rbp)
  806214:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  806218:	0f 89 ad 00 00 00    	jns    8062cb <copy+0x13a>
  80621e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  806221:	89 c6                	mov    %eax,%esi
  806223:	48 bf 5a 81 80 00 00 	movabs $0x80815a,%rdi
  80622a:	00 00 00 
  80622d:	b8 00 00 00 00       	mov    $0x0,%eax
  806232:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  806239:	00 00 00 
  80623c:	ff d2                	callq  *%rdx
  80623e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806241:	89 c7                	mov    %eax,%edi
  806243:	48 b8 33 56 80 00 00 	movabs $0x805633,%rax
  80624a:	00 00 00 
  80624d:	ff d0                	callq  *%rax
  80624f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  806252:	e9 15 01 00 00       	jmpq   80636c <copy+0x1db>
  806257:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80625a:	48 63 d0             	movslq %eax,%rdx
  80625d:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  806264:	8b 45 f8             	mov    -0x8(%rbp),%eax
  806267:	48 89 ce             	mov    %rcx,%rsi
  80626a:	89 c7                	mov    %eax,%edi
  80626c:	48 b8 a1 59 80 00 00 	movabs $0x8059a1,%rax
  806273:	00 00 00 
  806276:	ff d0                	callq  *%rax
  806278:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80627b:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80627f:	79 4a                	jns    8062cb <copy+0x13a>
  806281:	8b 45 f0             	mov    -0x10(%rbp),%eax
  806284:	89 c6                	mov    %eax,%esi
  806286:	48 bf 74 81 80 00 00 	movabs $0x808174,%rdi
  80628d:	00 00 00 
  806290:	b8 00 00 00 00       	mov    $0x0,%eax
  806295:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  80629c:	00 00 00 
  80629f:	ff d2                	callq  *%rdx
  8062a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8062a4:	89 c7                	mov    %eax,%edi
  8062a6:	48 b8 33 56 80 00 00 	movabs $0x805633,%rax
  8062ad:	00 00 00 
  8062b0:	ff d0                	callq  *%rax
  8062b2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8062b5:	89 c7                	mov    %eax,%edi
  8062b7:	48 b8 33 56 80 00 00 	movabs $0x805633,%rax
  8062be:	00 00 00 
  8062c1:	ff d0                	callq  *%rax
  8062c3:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8062c6:	e9 a1 00 00 00       	jmpq   80636c <copy+0x1db>
  8062cb:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8062d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8062d5:	ba 00 02 00 00       	mov    $0x200,%edx
  8062da:	48 89 ce             	mov    %rcx,%rsi
  8062dd:	89 c7                	mov    %eax,%edi
  8062df:	48 b8 56 58 80 00 00 	movabs $0x805856,%rax
  8062e6:	00 00 00 
  8062e9:	ff d0                	callq  *%rax
  8062eb:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8062ee:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8062f2:	0f 8f 5f ff ff ff    	jg     806257 <copy+0xc6>
  8062f8:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8062fc:	79 47                	jns    806345 <copy+0x1b4>
  8062fe:	8b 45 f4             	mov    -0xc(%rbp),%eax
  806301:	89 c6                	mov    %eax,%esi
  806303:	48 bf 87 81 80 00 00 	movabs $0x808187,%rdi
  80630a:	00 00 00 
  80630d:	b8 00 00 00 00       	mov    $0x0,%eax
  806312:	48 ba 1a 37 80 00 00 	movabs $0x80371a,%rdx
  806319:	00 00 00 
  80631c:	ff d2                	callq  *%rdx
  80631e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806321:	89 c7                	mov    %eax,%edi
  806323:	48 b8 33 56 80 00 00 	movabs $0x805633,%rax
  80632a:	00 00 00 
  80632d:	ff d0                	callq  *%rax
  80632f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  806332:	89 c7                	mov    %eax,%edi
  806334:	48 b8 33 56 80 00 00 	movabs $0x805633,%rax
  80633b:	00 00 00 
  80633e:	ff d0                	callq  *%rax
  806340:	8b 45 f4             	mov    -0xc(%rbp),%eax
  806343:	eb 27                	jmp    80636c <copy+0x1db>
  806345:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806348:	89 c7                	mov    %eax,%edi
  80634a:	48 b8 33 56 80 00 00 	movabs $0x805633,%rax
  806351:	00 00 00 
  806354:	ff d0                	callq  *%rax
  806356:	8b 45 f8             	mov    -0x8(%rbp),%eax
  806359:	89 c7                	mov    %eax,%edi
  80635b:	48 b8 33 56 80 00 00 	movabs $0x805633,%rax
  806362:	00 00 00 
  806365:	ff d0                	callq  *%rax
  806367:	b8 00 00 00 00       	mov    $0x0,%eax
  80636c:	c9                   	leaveq 
  80636d:	c3                   	retq   

000000000080636e <pageref>:
  80636e:	55                   	push   %rbp
  80636f:	48 89 e5             	mov    %rsp,%rbp
  806372:	48 83 ec 18          	sub    $0x18,%rsp
  806376:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80637a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80637e:	48 c1 e8 15          	shr    $0x15,%rax
  806382:	48 89 c2             	mov    %rax,%rdx
  806385:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80638c:	01 00 00 
  80638f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  806393:	83 e0 01             	and    $0x1,%eax
  806396:	48 85 c0             	test   %rax,%rax
  806399:	75 07                	jne    8063a2 <pageref+0x34>
  80639b:	b8 00 00 00 00       	mov    $0x0,%eax
  8063a0:	eb 56                	jmp    8063f8 <pageref+0x8a>
  8063a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8063a6:	48 c1 e8 0c          	shr    $0xc,%rax
  8063aa:	48 89 c2             	mov    %rax,%rdx
  8063ad:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8063b4:	01 00 00 
  8063b7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8063bb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8063bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8063c3:	83 e0 01             	and    $0x1,%eax
  8063c6:	48 85 c0             	test   %rax,%rax
  8063c9:	75 07                	jne    8063d2 <pageref+0x64>
  8063cb:	b8 00 00 00 00       	mov    $0x0,%eax
  8063d0:	eb 26                	jmp    8063f8 <pageref+0x8a>
  8063d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8063d6:	48 c1 e8 0c          	shr    $0xc,%rax
  8063da:	48 89 c2             	mov    %rax,%rdx
  8063dd:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8063e4:	00 00 00 
  8063e7:	48 c1 e2 04          	shl    $0x4,%rdx
  8063eb:	48 01 d0             	add    %rdx,%rax
  8063ee:	48 83 c0 08          	add    $0x8,%rax
  8063f2:	0f b7 00             	movzwl (%rax),%eax
  8063f5:	0f b7 c0             	movzwl %ax,%eax
  8063f8:	c9                   	leaveq 
  8063f9:	c3                   	retq   

00000000008063fa <fd2sockid>:
  8063fa:	55                   	push   %rbp
  8063fb:	48 89 e5             	mov    %rsp,%rbp
  8063fe:	48 83 ec 20          	sub    $0x20,%rsp
  806402:	89 7d ec             	mov    %edi,-0x14(%rbp)
  806405:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  806409:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80640c:	48 89 d6             	mov    %rdx,%rsi
  80640f:	89 c7                	mov    %eax,%edi
  806411:	48 b8 21 54 80 00 00 	movabs $0x805421,%rax
  806418:	00 00 00 
  80641b:	ff d0                	callq  *%rax
  80641d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806420:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806424:	79 05                	jns    80642b <fd2sockid+0x31>
  806426:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806429:	eb 24                	jmp    80644f <fd2sockid+0x55>
  80642b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80642f:	8b 10                	mov    (%rax),%edx
  806431:	48 b8 20 21 81 00 00 	movabs $0x812120,%rax
  806438:	00 00 00 
  80643b:	8b 00                	mov    (%rax),%eax
  80643d:	39 c2                	cmp    %eax,%edx
  80643f:	74 07                	je     806448 <fd2sockid+0x4e>
  806441:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  806446:	eb 07                	jmp    80644f <fd2sockid+0x55>
  806448:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80644c:	8b 40 0c             	mov    0xc(%rax),%eax
  80644f:	c9                   	leaveq 
  806450:	c3                   	retq   

0000000000806451 <alloc_sockfd>:
  806451:	55                   	push   %rbp
  806452:	48 89 e5             	mov    %rsp,%rbp
  806455:	48 83 ec 20          	sub    $0x20,%rsp
  806459:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80645c:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  806460:	48 89 c7             	mov    %rax,%rdi
  806463:	48 b8 89 53 80 00 00 	movabs $0x805389,%rax
  80646a:	00 00 00 
  80646d:	ff d0                	callq  *%rax
  80646f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806472:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806476:	78 26                	js     80649e <alloc_sockfd+0x4d>
  806478:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80647c:	ba 07 04 00 00       	mov    $0x407,%edx
  806481:	48 89 c6             	mov    %rax,%rsi
  806484:	bf 00 00 00 00       	mov    $0x0,%edi
  806489:	48 b8 da 4b 80 00 00 	movabs $0x804bda,%rax
  806490:	00 00 00 
  806493:	ff d0                	callq  *%rax
  806495:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806498:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80649c:	79 16                	jns    8064b4 <alloc_sockfd+0x63>
  80649e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8064a1:	89 c7                	mov    %eax,%edi
  8064a3:	48 b8 60 69 80 00 00 	movabs $0x806960,%rax
  8064aa:	00 00 00 
  8064ad:	ff d0                	callq  *%rax
  8064af:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8064b2:	eb 3a                	jmp    8064ee <alloc_sockfd+0x9d>
  8064b4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8064b8:	48 ba 20 21 81 00 00 	movabs $0x812120,%rdx
  8064bf:	00 00 00 
  8064c2:	8b 12                	mov    (%rdx),%edx
  8064c4:	89 10                	mov    %edx,(%rax)
  8064c6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8064ca:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8064d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8064d5:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8064d8:	89 50 0c             	mov    %edx,0xc(%rax)
  8064db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8064df:	48 89 c7             	mov    %rax,%rdi
  8064e2:	48 b8 3b 53 80 00 00 	movabs $0x80533b,%rax
  8064e9:	00 00 00 
  8064ec:	ff d0                	callq  *%rax
  8064ee:	c9                   	leaveq 
  8064ef:	c3                   	retq   

00000000008064f0 <accept>:
  8064f0:	55                   	push   %rbp
  8064f1:	48 89 e5             	mov    %rsp,%rbp
  8064f4:	48 83 ec 30          	sub    $0x30,%rsp
  8064f8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8064fb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8064ff:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  806503:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806506:	89 c7                	mov    %eax,%edi
  806508:	48 b8 fa 63 80 00 00 	movabs $0x8063fa,%rax
  80650f:	00 00 00 
  806512:	ff d0                	callq  *%rax
  806514:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806517:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80651b:	79 05                	jns    806522 <accept+0x32>
  80651d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806520:	eb 3b                	jmp    80655d <accept+0x6d>
  806522:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  806526:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80652a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80652d:	48 89 ce             	mov    %rcx,%rsi
  806530:	89 c7                	mov    %eax,%edi
  806532:	48 b8 3d 68 80 00 00 	movabs $0x80683d,%rax
  806539:	00 00 00 
  80653c:	ff d0                	callq  *%rax
  80653e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806541:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806545:	79 05                	jns    80654c <accept+0x5c>
  806547:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80654a:	eb 11                	jmp    80655d <accept+0x6d>
  80654c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80654f:	89 c7                	mov    %eax,%edi
  806551:	48 b8 51 64 80 00 00 	movabs $0x806451,%rax
  806558:	00 00 00 
  80655b:	ff d0                	callq  *%rax
  80655d:	c9                   	leaveq 
  80655e:	c3                   	retq   

000000000080655f <bind>:
  80655f:	55                   	push   %rbp
  806560:	48 89 e5             	mov    %rsp,%rbp
  806563:	48 83 ec 20          	sub    $0x20,%rsp
  806567:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80656a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80656e:	89 55 e8             	mov    %edx,-0x18(%rbp)
  806571:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806574:	89 c7                	mov    %eax,%edi
  806576:	48 b8 fa 63 80 00 00 	movabs $0x8063fa,%rax
  80657d:	00 00 00 
  806580:	ff d0                	callq  *%rax
  806582:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806585:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806589:	79 05                	jns    806590 <bind+0x31>
  80658b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80658e:	eb 1b                	jmp    8065ab <bind+0x4c>
  806590:	8b 55 e8             	mov    -0x18(%rbp),%edx
  806593:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  806597:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80659a:	48 89 ce             	mov    %rcx,%rsi
  80659d:	89 c7                	mov    %eax,%edi
  80659f:	48 b8 bc 68 80 00 00 	movabs $0x8068bc,%rax
  8065a6:	00 00 00 
  8065a9:	ff d0                	callq  *%rax
  8065ab:	c9                   	leaveq 
  8065ac:	c3                   	retq   

00000000008065ad <shutdown>:
  8065ad:	55                   	push   %rbp
  8065ae:	48 89 e5             	mov    %rsp,%rbp
  8065b1:	48 83 ec 20          	sub    $0x20,%rsp
  8065b5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8065b8:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8065bb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8065be:	89 c7                	mov    %eax,%edi
  8065c0:	48 b8 fa 63 80 00 00 	movabs $0x8063fa,%rax
  8065c7:	00 00 00 
  8065ca:	ff d0                	callq  *%rax
  8065cc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8065cf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8065d3:	79 05                	jns    8065da <shutdown+0x2d>
  8065d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8065d8:	eb 16                	jmp    8065f0 <shutdown+0x43>
  8065da:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8065dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8065e0:	89 d6                	mov    %edx,%esi
  8065e2:	89 c7                	mov    %eax,%edi
  8065e4:	48 b8 20 69 80 00 00 	movabs $0x806920,%rax
  8065eb:	00 00 00 
  8065ee:	ff d0                	callq  *%rax
  8065f0:	c9                   	leaveq 
  8065f1:	c3                   	retq   

00000000008065f2 <devsock_close>:
  8065f2:	55                   	push   %rbp
  8065f3:	48 89 e5             	mov    %rsp,%rbp
  8065f6:	48 83 ec 10          	sub    $0x10,%rsp
  8065fa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8065fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806602:	48 89 c7             	mov    %rax,%rdi
  806605:	48 b8 6e 63 80 00 00 	movabs $0x80636e,%rax
  80660c:	00 00 00 
  80660f:	ff d0                	callq  *%rax
  806611:	83 f8 01             	cmp    $0x1,%eax
  806614:	75 17                	jne    80662d <devsock_close+0x3b>
  806616:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80661a:	8b 40 0c             	mov    0xc(%rax),%eax
  80661d:	89 c7                	mov    %eax,%edi
  80661f:	48 b8 60 69 80 00 00 	movabs $0x806960,%rax
  806626:	00 00 00 
  806629:	ff d0                	callq  *%rax
  80662b:	eb 05                	jmp    806632 <devsock_close+0x40>
  80662d:	b8 00 00 00 00       	mov    $0x0,%eax
  806632:	c9                   	leaveq 
  806633:	c3                   	retq   

0000000000806634 <connect>:
  806634:	55                   	push   %rbp
  806635:	48 89 e5             	mov    %rsp,%rbp
  806638:	48 83 ec 20          	sub    $0x20,%rsp
  80663c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80663f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  806643:	89 55 e8             	mov    %edx,-0x18(%rbp)
  806646:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806649:	89 c7                	mov    %eax,%edi
  80664b:	48 b8 fa 63 80 00 00 	movabs $0x8063fa,%rax
  806652:	00 00 00 
  806655:	ff d0                	callq  *%rax
  806657:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80665a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80665e:	79 05                	jns    806665 <connect+0x31>
  806660:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806663:	eb 1b                	jmp    806680 <connect+0x4c>
  806665:	8b 55 e8             	mov    -0x18(%rbp),%edx
  806668:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80666c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80666f:	48 89 ce             	mov    %rcx,%rsi
  806672:	89 c7                	mov    %eax,%edi
  806674:	48 b8 8d 69 80 00 00 	movabs $0x80698d,%rax
  80667b:	00 00 00 
  80667e:	ff d0                	callq  *%rax
  806680:	c9                   	leaveq 
  806681:	c3                   	retq   

0000000000806682 <listen>:
  806682:	55                   	push   %rbp
  806683:	48 89 e5             	mov    %rsp,%rbp
  806686:	48 83 ec 20          	sub    $0x20,%rsp
  80668a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80668d:	89 75 e8             	mov    %esi,-0x18(%rbp)
  806690:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806693:	89 c7                	mov    %eax,%edi
  806695:	48 b8 fa 63 80 00 00 	movabs $0x8063fa,%rax
  80669c:	00 00 00 
  80669f:	ff d0                	callq  *%rax
  8066a1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8066a4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8066a8:	79 05                	jns    8066af <listen+0x2d>
  8066aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8066ad:	eb 16                	jmp    8066c5 <listen+0x43>
  8066af:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8066b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8066b5:	89 d6                	mov    %edx,%esi
  8066b7:	89 c7                	mov    %eax,%edi
  8066b9:	48 b8 f1 69 80 00 00 	movabs $0x8069f1,%rax
  8066c0:	00 00 00 
  8066c3:	ff d0                	callq  *%rax
  8066c5:	c9                   	leaveq 
  8066c6:	c3                   	retq   

00000000008066c7 <devsock_read>:
  8066c7:	55                   	push   %rbp
  8066c8:	48 89 e5             	mov    %rsp,%rbp
  8066cb:	48 83 ec 20          	sub    $0x20,%rsp
  8066cf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8066d3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8066d7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8066db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8066df:	89 c2                	mov    %eax,%edx
  8066e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8066e5:	8b 40 0c             	mov    0xc(%rax),%eax
  8066e8:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8066ec:	b9 00 00 00 00       	mov    $0x0,%ecx
  8066f1:	89 c7                	mov    %eax,%edi
  8066f3:	48 b8 31 6a 80 00 00 	movabs $0x806a31,%rax
  8066fa:	00 00 00 
  8066fd:	ff d0                	callq  *%rax
  8066ff:	c9                   	leaveq 
  806700:	c3                   	retq   

0000000000806701 <devsock_write>:
  806701:	55                   	push   %rbp
  806702:	48 89 e5             	mov    %rsp,%rbp
  806705:	48 83 ec 20          	sub    $0x20,%rsp
  806709:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80670d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  806711:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  806715:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  806719:	89 c2                	mov    %eax,%edx
  80671b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80671f:	8b 40 0c             	mov    0xc(%rax),%eax
  806722:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  806726:	b9 00 00 00 00       	mov    $0x0,%ecx
  80672b:	89 c7                	mov    %eax,%edi
  80672d:	48 b8 fd 6a 80 00 00 	movabs $0x806afd,%rax
  806734:	00 00 00 
  806737:	ff d0                	callq  *%rax
  806739:	c9                   	leaveq 
  80673a:	c3                   	retq   

000000000080673b <devsock_stat>:
  80673b:	55                   	push   %rbp
  80673c:	48 89 e5             	mov    %rsp,%rbp
  80673f:	48 83 ec 10          	sub    $0x10,%rsp
  806743:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  806747:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80674b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80674f:	48 be a2 81 80 00 00 	movabs $0x8081a2,%rsi
  806756:	00 00 00 
  806759:	48 89 c7             	mov    %rax,%rdi
  80675c:	48 b8 aa 42 80 00 00 	movabs $0x8042aa,%rax
  806763:	00 00 00 
  806766:	ff d0                	callq  *%rax
  806768:	b8 00 00 00 00       	mov    $0x0,%eax
  80676d:	c9                   	leaveq 
  80676e:	c3                   	retq   

000000000080676f <socket>:
  80676f:	55                   	push   %rbp
  806770:	48 89 e5             	mov    %rsp,%rbp
  806773:	48 83 ec 20          	sub    $0x20,%rsp
  806777:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80677a:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80677d:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  806780:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  806783:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  806786:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806789:	89 ce                	mov    %ecx,%esi
  80678b:	89 c7                	mov    %eax,%edi
  80678d:	48 b8 b5 6b 80 00 00 	movabs $0x806bb5,%rax
  806794:	00 00 00 
  806797:	ff d0                	callq  *%rax
  806799:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80679c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8067a0:	79 05                	jns    8067a7 <socket+0x38>
  8067a2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8067a5:	eb 11                	jmp    8067b8 <socket+0x49>
  8067a7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8067aa:	89 c7                	mov    %eax,%edi
  8067ac:	48 b8 51 64 80 00 00 	movabs $0x806451,%rax
  8067b3:	00 00 00 
  8067b6:	ff d0                	callq  *%rax
  8067b8:	c9                   	leaveq 
  8067b9:	c3                   	retq   

00000000008067ba <nsipc>:
  8067ba:	55                   	push   %rbp
  8067bb:	48 89 e5             	mov    %rsp,%rbp
  8067be:	48 83 ec 10          	sub    $0x10,%rsp
  8067c2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8067c5:	48 b8 0c 60 81 00 00 	movabs $0x81600c,%rax
  8067cc:	00 00 00 
  8067cf:	8b 00                	mov    (%rax),%eax
  8067d1:	85 c0                	test   %eax,%eax
  8067d3:	75 1f                	jne    8067f4 <nsipc+0x3a>
  8067d5:	bf 02 00 00 00       	mov    $0x2,%edi
  8067da:	48 b8 ca 52 80 00 00 	movabs $0x8052ca,%rax
  8067e1:	00 00 00 
  8067e4:	ff d0                	callq  *%rax
  8067e6:	89 c2                	mov    %eax,%edx
  8067e8:	48 b8 0c 60 81 00 00 	movabs $0x81600c,%rax
  8067ef:	00 00 00 
  8067f2:	89 10                	mov    %edx,(%rax)
  8067f4:	48 b8 0c 60 81 00 00 	movabs $0x81600c,%rax
  8067fb:	00 00 00 
  8067fe:	8b 00                	mov    (%rax),%eax
  806800:	8b 75 fc             	mov    -0x4(%rbp),%esi
  806803:	b9 07 00 00 00       	mov    $0x7,%ecx
  806808:	48 ba 00 90 81 00 00 	movabs $0x819000,%rdx
  80680f:	00 00 00 
  806812:	89 c7                	mov    %eax,%edi
  806814:	48 b8 c0 51 80 00 00 	movabs $0x8051c0,%rax
  80681b:	00 00 00 
  80681e:	ff d0                	callq  *%rax
  806820:	ba 00 00 00 00       	mov    $0x0,%edx
  806825:	be 00 00 00 00       	mov    $0x0,%esi
  80682a:	bf 00 00 00 00       	mov    $0x0,%edi
  80682f:	48 b8 ff 50 80 00 00 	movabs $0x8050ff,%rax
  806836:	00 00 00 
  806839:	ff d0                	callq  *%rax
  80683b:	c9                   	leaveq 
  80683c:	c3                   	retq   

000000000080683d <nsipc_accept>:
  80683d:	55                   	push   %rbp
  80683e:	48 89 e5             	mov    %rsp,%rbp
  806841:	48 83 ec 30          	sub    $0x30,%rsp
  806845:	89 7d ec             	mov    %edi,-0x14(%rbp)
  806848:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80684c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  806850:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806857:	00 00 00 
  80685a:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80685d:	89 10                	mov    %edx,(%rax)
  80685f:	bf 01 00 00 00       	mov    $0x1,%edi
  806864:	48 b8 ba 67 80 00 00 	movabs $0x8067ba,%rax
  80686b:	00 00 00 
  80686e:	ff d0                	callq  *%rax
  806870:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806873:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806877:	78 3e                	js     8068b7 <nsipc_accept+0x7a>
  806879:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806880:	00 00 00 
  806883:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  806887:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80688b:	8b 40 10             	mov    0x10(%rax),%eax
  80688e:	89 c2                	mov    %eax,%edx
  806890:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  806894:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806898:	48 89 ce             	mov    %rcx,%rsi
  80689b:	48 89 c7             	mov    %rax,%rdi
  80689e:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  8068a5:	00 00 00 
  8068a8:	ff d0                	callq  *%rax
  8068aa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8068ae:	8b 50 10             	mov    0x10(%rax),%edx
  8068b1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8068b5:	89 10                	mov    %edx,(%rax)
  8068b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8068ba:	c9                   	leaveq 
  8068bb:	c3                   	retq   

00000000008068bc <nsipc_bind>:
  8068bc:	55                   	push   %rbp
  8068bd:	48 89 e5             	mov    %rsp,%rbp
  8068c0:	48 83 ec 10          	sub    $0x10,%rsp
  8068c4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8068c7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8068cb:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8068ce:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  8068d5:	00 00 00 
  8068d8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8068db:	89 10                	mov    %edx,(%rax)
  8068dd:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8068e0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8068e4:	48 89 c6             	mov    %rax,%rsi
  8068e7:	48 bf 04 90 81 00 00 	movabs $0x819004,%rdi
  8068ee:	00 00 00 
  8068f1:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  8068f8:	00 00 00 
  8068fb:	ff d0                	callq  *%rax
  8068fd:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806904:	00 00 00 
  806907:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80690a:	89 50 14             	mov    %edx,0x14(%rax)
  80690d:	bf 02 00 00 00       	mov    $0x2,%edi
  806912:	48 b8 ba 67 80 00 00 	movabs $0x8067ba,%rax
  806919:	00 00 00 
  80691c:	ff d0                	callq  *%rax
  80691e:	c9                   	leaveq 
  80691f:	c3                   	retq   

0000000000806920 <nsipc_shutdown>:
  806920:	55                   	push   %rbp
  806921:	48 89 e5             	mov    %rsp,%rbp
  806924:	48 83 ec 10          	sub    $0x10,%rsp
  806928:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80692b:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80692e:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806935:	00 00 00 
  806938:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80693b:	89 10                	mov    %edx,(%rax)
  80693d:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806944:	00 00 00 
  806947:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80694a:	89 50 04             	mov    %edx,0x4(%rax)
  80694d:	bf 03 00 00 00       	mov    $0x3,%edi
  806952:	48 b8 ba 67 80 00 00 	movabs $0x8067ba,%rax
  806959:	00 00 00 
  80695c:	ff d0                	callq  *%rax
  80695e:	c9                   	leaveq 
  80695f:	c3                   	retq   

0000000000806960 <nsipc_close>:
  806960:	55                   	push   %rbp
  806961:	48 89 e5             	mov    %rsp,%rbp
  806964:	48 83 ec 10          	sub    $0x10,%rsp
  806968:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80696b:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806972:	00 00 00 
  806975:	8b 55 fc             	mov    -0x4(%rbp),%edx
  806978:	89 10                	mov    %edx,(%rax)
  80697a:	bf 04 00 00 00       	mov    $0x4,%edi
  80697f:	48 b8 ba 67 80 00 00 	movabs $0x8067ba,%rax
  806986:	00 00 00 
  806989:	ff d0                	callq  *%rax
  80698b:	c9                   	leaveq 
  80698c:	c3                   	retq   

000000000080698d <nsipc_connect>:
  80698d:	55                   	push   %rbp
  80698e:	48 89 e5             	mov    %rsp,%rbp
  806991:	48 83 ec 10          	sub    $0x10,%rsp
  806995:	89 7d fc             	mov    %edi,-0x4(%rbp)
  806998:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80699c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80699f:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  8069a6:	00 00 00 
  8069a9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8069ac:	89 10                	mov    %edx,(%rax)
  8069ae:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8069b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8069b5:	48 89 c6             	mov    %rax,%rsi
  8069b8:	48 bf 04 90 81 00 00 	movabs $0x819004,%rdi
  8069bf:	00 00 00 
  8069c2:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  8069c9:	00 00 00 
  8069cc:	ff d0                	callq  *%rax
  8069ce:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  8069d5:	00 00 00 
  8069d8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8069db:	89 50 14             	mov    %edx,0x14(%rax)
  8069de:	bf 05 00 00 00       	mov    $0x5,%edi
  8069e3:	48 b8 ba 67 80 00 00 	movabs $0x8067ba,%rax
  8069ea:	00 00 00 
  8069ed:	ff d0                	callq  *%rax
  8069ef:	c9                   	leaveq 
  8069f0:	c3                   	retq   

00000000008069f1 <nsipc_listen>:
  8069f1:	55                   	push   %rbp
  8069f2:	48 89 e5             	mov    %rsp,%rbp
  8069f5:	48 83 ec 10          	sub    $0x10,%rsp
  8069f9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8069fc:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8069ff:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806a06:	00 00 00 
  806a09:	8b 55 fc             	mov    -0x4(%rbp),%edx
  806a0c:	89 10                	mov    %edx,(%rax)
  806a0e:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806a15:	00 00 00 
  806a18:	8b 55 f8             	mov    -0x8(%rbp),%edx
  806a1b:	89 50 04             	mov    %edx,0x4(%rax)
  806a1e:	bf 06 00 00 00       	mov    $0x6,%edi
  806a23:	48 b8 ba 67 80 00 00 	movabs $0x8067ba,%rax
  806a2a:	00 00 00 
  806a2d:	ff d0                	callq  *%rax
  806a2f:	c9                   	leaveq 
  806a30:	c3                   	retq   

0000000000806a31 <nsipc_recv>:
  806a31:	55                   	push   %rbp
  806a32:	48 89 e5             	mov    %rsp,%rbp
  806a35:	48 83 ec 30          	sub    $0x30,%rsp
  806a39:	89 7d ec             	mov    %edi,-0x14(%rbp)
  806a3c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  806a40:	89 55 e8             	mov    %edx,-0x18(%rbp)
  806a43:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  806a46:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806a4d:	00 00 00 
  806a50:	8b 55 ec             	mov    -0x14(%rbp),%edx
  806a53:	89 10                	mov    %edx,(%rax)
  806a55:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806a5c:	00 00 00 
  806a5f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  806a62:	89 50 04             	mov    %edx,0x4(%rax)
  806a65:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806a6c:	00 00 00 
  806a6f:	8b 55 dc             	mov    -0x24(%rbp),%edx
  806a72:	89 50 08             	mov    %edx,0x8(%rax)
  806a75:	bf 07 00 00 00       	mov    $0x7,%edi
  806a7a:	48 b8 ba 67 80 00 00 	movabs $0x8067ba,%rax
  806a81:	00 00 00 
  806a84:	ff d0                	callq  *%rax
  806a86:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806a89:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806a8d:	78 69                	js     806af8 <nsipc_recv+0xc7>
  806a8f:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  806a96:	7f 08                	jg     806aa0 <nsipc_recv+0x6f>
  806a98:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806a9b:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  806a9e:	7e 35                	jle    806ad5 <nsipc_recv+0xa4>
  806aa0:	48 b9 a9 81 80 00 00 	movabs $0x8081a9,%rcx
  806aa7:	00 00 00 
  806aaa:	48 ba be 81 80 00 00 	movabs $0x8081be,%rdx
  806ab1:	00 00 00 
  806ab4:	be 62 00 00 00       	mov    $0x62,%esi
  806ab9:	48 bf d3 81 80 00 00 	movabs $0x8081d3,%rdi
  806ac0:	00 00 00 
  806ac3:	b8 00 00 00 00       	mov    $0x0,%eax
  806ac8:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  806acf:	00 00 00 
  806ad2:	41 ff d0             	callq  *%r8
  806ad5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806ad8:	48 63 d0             	movslq %eax,%rdx
  806adb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806adf:	48 be 00 90 81 00 00 	movabs $0x819000,%rsi
  806ae6:	00 00 00 
  806ae9:	48 89 c7             	mov    %rax,%rdi
  806aec:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  806af3:	00 00 00 
  806af6:	ff d0                	callq  *%rax
  806af8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806afb:	c9                   	leaveq 
  806afc:	c3                   	retq   

0000000000806afd <nsipc_send>:
  806afd:	55                   	push   %rbp
  806afe:	48 89 e5             	mov    %rsp,%rbp
  806b01:	48 83 ec 20          	sub    $0x20,%rsp
  806b05:	89 7d fc             	mov    %edi,-0x4(%rbp)
  806b08:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  806b0c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  806b0f:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  806b12:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806b19:	00 00 00 
  806b1c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  806b1f:	89 10                	mov    %edx,(%rax)
  806b21:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  806b28:	7e 35                	jle    806b5f <nsipc_send+0x62>
  806b2a:	48 b9 e2 81 80 00 00 	movabs $0x8081e2,%rcx
  806b31:	00 00 00 
  806b34:	48 ba be 81 80 00 00 	movabs $0x8081be,%rdx
  806b3b:	00 00 00 
  806b3e:	be 6d 00 00 00       	mov    $0x6d,%esi
  806b43:	48 bf d3 81 80 00 00 	movabs $0x8081d3,%rdi
  806b4a:	00 00 00 
  806b4d:	b8 00 00 00 00       	mov    $0x0,%eax
  806b52:	49 b8 e0 34 80 00 00 	movabs $0x8034e0,%r8
  806b59:	00 00 00 
  806b5c:	41 ff d0             	callq  *%r8
  806b5f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  806b62:	48 63 d0             	movslq %eax,%rdx
  806b65:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806b69:	48 89 c6             	mov    %rax,%rsi
  806b6c:	48 bf 0c 90 81 00 00 	movabs $0x81900c,%rdi
  806b73:	00 00 00 
  806b76:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  806b7d:	00 00 00 
  806b80:	ff d0                	callq  *%rax
  806b82:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806b89:	00 00 00 
  806b8c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  806b8f:	89 50 04             	mov    %edx,0x4(%rax)
  806b92:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806b99:	00 00 00 
  806b9c:	8b 55 ec             	mov    -0x14(%rbp),%edx
  806b9f:	89 50 08             	mov    %edx,0x8(%rax)
  806ba2:	bf 08 00 00 00       	mov    $0x8,%edi
  806ba7:	48 b8 ba 67 80 00 00 	movabs $0x8067ba,%rax
  806bae:	00 00 00 
  806bb1:	ff d0                	callq  *%rax
  806bb3:	c9                   	leaveq 
  806bb4:	c3                   	retq   

0000000000806bb5 <nsipc_socket>:
  806bb5:	55                   	push   %rbp
  806bb6:	48 89 e5             	mov    %rsp,%rbp
  806bb9:	48 83 ec 10          	sub    $0x10,%rsp
  806bbd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  806bc0:	89 75 f8             	mov    %esi,-0x8(%rbp)
  806bc3:	89 55 f4             	mov    %edx,-0xc(%rbp)
  806bc6:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806bcd:	00 00 00 
  806bd0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  806bd3:	89 10                	mov    %edx,(%rax)
  806bd5:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806bdc:	00 00 00 
  806bdf:	8b 55 f8             	mov    -0x8(%rbp),%edx
  806be2:	89 50 04             	mov    %edx,0x4(%rax)
  806be5:	48 b8 00 90 81 00 00 	movabs $0x819000,%rax
  806bec:	00 00 00 
  806bef:	8b 55 f4             	mov    -0xc(%rbp),%edx
  806bf2:	89 50 08             	mov    %edx,0x8(%rax)
  806bf5:	bf 09 00 00 00       	mov    $0x9,%edi
  806bfa:	48 b8 ba 67 80 00 00 	movabs $0x8067ba,%rax
  806c01:	00 00 00 
  806c04:	ff d0                	callq  *%rax
  806c06:	c9                   	leaveq 
  806c07:	c3                   	retq   

0000000000806c08 <pipe>:
  806c08:	55                   	push   %rbp
  806c09:	48 89 e5             	mov    %rsp,%rbp
  806c0c:	53                   	push   %rbx
  806c0d:	48 83 ec 38          	sub    $0x38,%rsp
  806c11:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  806c15:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  806c19:	48 89 c7             	mov    %rax,%rdi
  806c1c:	48 b8 89 53 80 00 00 	movabs $0x805389,%rax
  806c23:	00 00 00 
  806c26:	ff d0                	callq  *%rax
  806c28:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806c2b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  806c2f:	0f 88 bf 01 00 00    	js     806df4 <pipe+0x1ec>
  806c35:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806c39:	ba 07 04 00 00       	mov    $0x407,%edx
  806c3e:	48 89 c6             	mov    %rax,%rsi
  806c41:	bf 00 00 00 00       	mov    $0x0,%edi
  806c46:	48 b8 da 4b 80 00 00 	movabs $0x804bda,%rax
  806c4d:	00 00 00 
  806c50:	ff d0                	callq  *%rax
  806c52:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806c55:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  806c59:	0f 88 95 01 00 00    	js     806df4 <pipe+0x1ec>
  806c5f:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  806c63:	48 89 c7             	mov    %rax,%rdi
  806c66:	48 b8 89 53 80 00 00 	movabs $0x805389,%rax
  806c6d:	00 00 00 
  806c70:	ff d0                	callq  *%rax
  806c72:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806c75:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  806c79:	0f 88 5d 01 00 00    	js     806ddc <pipe+0x1d4>
  806c7f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806c83:	ba 07 04 00 00       	mov    $0x407,%edx
  806c88:	48 89 c6             	mov    %rax,%rsi
  806c8b:	bf 00 00 00 00       	mov    $0x0,%edi
  806c90:	48 b8 da 4b 80 00 00 	movabs $0x804bda,%rax
  806c97:	00 00 00 
  806c9a:	ff d0                	callq  *%rax
  806c9c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806c9f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  806ca3:	0f 88 33 01 00 00    	js     806ddc <pipe+0x1d4>
  806ca9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806cad:	48 89 c7             	mov    %rax,%rdi
  806cb0:	48 b8 5e 53 80 00 00 	movabs $0x80535e,%rax
  806cb7:	00 00 00 
  806cba:	ff d0                	callq  *%rax
  806cbc:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  806cc0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806cc4:	ba 07 04 00 00       	mov    $0x407,%edx
  806cc9:	48 89 c6             	mov    %rax,%rsi
  806ccc:	bf 00 00 00 00       	mov    $0x0,%edi
  806cd1:	48 b8 da 4b 80 00 00 	movabs $0x804bda,%rax
  806cd8:	00 00 00 
  806cdb:	ff d0                	callq  *%rax
  806cdd:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806ce0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  806ce4:	0f 88 d9 00 00 00    	js     806dc3 <pipe+0x1bb>
  806cea:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806cee:	48 89 c7             	mov    %rax,%rdi
  806cf1:	48 b8 5e 53 80 00 00 	movabs $0x80535e,%rax
  806cf8:	00 00 00 
  806cfb:	ff d0                	callq  *%rax
  806cfd:	48 89 c2             	mov    %rax,%rdx
  806d00:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806d04:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  806d0a:	48 89 d1             	mov    %rdx,%rcx
  806d0d:	ba 00 00 00 00       	mov    $0x0,%edx
  806d12:	48 89 c6             	mov    %rax,%rsi
  806d15:	bf 00 00 00 00       	mov    $0x0,%edi
  806d1a:	48 b8 2c 4c 80 00 00 	movabs $0x804c2c,%rax
  806d21:	00 00 00 
  806d24:	ff d0                	callq  *%rax
  806d26:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806d29:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  806d2d:	78 79                	js     806da8 <pipe+0x1a0>
  806d2f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806d33:	48 ba 60 21 81 00 00 	movabs $0x812160,%rdx
  806d3a:	00 00 00 
  806d3d:	8b 12                	mov    (%rdx),%edx
  806d3f:	89 10                	mov    %edx,(%rax)
  806d41:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806d45:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  806d4c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806d50:	48 ba 60 21 81 00 00 	movabs $0x812160,%rdx
  806d57:	00 00 00 
  806d5a:	8b 12                	mov    (%rdx),%edx
  806d5c:	89 10                	mov    %edx,(%rax)
  806d5e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806d62:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  806d69:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806d6d:	48 89 c7             	mov    %rax,%rdi
  806d70:	48 b8 3b 53 80 00 00 	movabs $0x80533b,%rax
  806d77:	00 00 00 
  806d7a:	ff d0                	callq  *%rax
  806d7c:	89 c2                	mov    %eax,%edx
  806d7e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  806d82:	89 10                	mov    %edx,(%rax)
  806d84:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  806d88:	48 8d 58 04          	lea    0x4(%rax),%rbx
  806d8c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806d90:	48 89 c7             	mov    %rax,%rdi
  806d93:	48 b8 3b 53 80 00 00 	movabs $0x80533b,%rax
  806d9a:	00 00 00 
  806d9d:	ff d0                	callq  *%rax
  806d9f:	89 03                	mov    %eax,(%rbx)
  806da1:	b8 00 00 00 00       	mov    $0x0,%eax
  806da6:	eb 4f                	jmp    806df7 <pipe+0x1ef>
  806da8:	90                   	nop
  806da9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  806dad:	48 89 c6             	mov    %rax,%rsi
  806db0:	bf 00 00 00 00       	mov    $0x0,%edi
  806db5:	48 b8 8c 4c 80 00 00 	movabs $0x804c8c,%rax
  806dbc:	00 00 00 
  806dbf:	ff d0                	callq  *%rax
  806dc1:	eb 01                	jmp    806dc4 <pipe+0x1bc>
  806dc3:	90                   	nop
  806dc4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806dc8:	48 89 c6             	mov    %rax,%rsi
  806dcb:	bf 00 00 00 00       	mov    $0x0,%edi
  806dd0:	48 b8 8c 4c 80 00 00 	movabs $0x804c8c,%rax
  806dd7:	00 00 00 
  806dda:	ff d0                	callq  *%rax
  806ddc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806de0:	48 89 c6             	mov    %rax,%rsi
  806de3:	bf 00 00 00 00       	mov    $0x0,%edi
  806de8:	48 b8 8c 4c 80 00 00 	movabs $0x804c8c,%rax
  806def:	00 00 00 
  806df2:	ff d0                	callq  *%rax
  806df4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806df7:	48 83 c4 38          	add    $0x38,%rsp
  806dfb:	5b                   	pop    %rbx
  806dfc:	5d                   	pop    %rbp
  806dfd:	c3                   	retq   

0000000000806dfe <_pipeisclosed>:
  806dfe:	55                   	push   %rbp
  806dff:	48 89 e5             	mov    %rsp,%rbp
  806e02:	53                   	push   %rbx
  806e03:	48 83 ec 28          	sub    $0x28,%rsp
  806e07:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  806e0b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  806e0f:	48 b8 20 60 81 00 00 	movabs $0x816020,%rax
  806e16:	00 00 00 
  806e19:	48 8b 00             	mov    (%rax),%rax
  806e1c:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  806e22:	89 45 ec             	mov    %eax,-0x14(%rbp)
  806e25:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806e29:	48 89 c7             	mov    %rax,%rdi
  806e2c:	48 b8 6e 63 80 00 00 	movabs $0x80636e,%rax
  806e33:	00 00 00 
  806e36:	ff d0                	callq  *%rax
  806e38:	89 c3                	mov    %eax,%ebx
  806e3a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806e3e:	48 89 c7             	mov    %rax,%rdi
  806e41:	48 b8 6e 63 80 00 00 	movabs $0x80636e,%rax
  806e48:	00 00 00 
  806e4b:	ff d0                	callq  *%rax
  806e4d:	39 c3                	cmp    %eax,%ebx
  806e4f:	0f 94 c0             	sete   %al
  806e52:	0f b6 c0             	movzbl %al,%eax
  806e55:	89 45 e8             	mov    %eax,-0x18(%rbp)
  806e58:	48 b8 20 60 81 00 00 	movabs $0x816020,%rax
  806e5f:	00 00 00 
  806e62:	48 8b 00             	mov    (%rax),%rax
  806e65:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  806e6b:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  806e6e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806e71:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  806e74:	75 05                	jne    806e7b <_pipeisclosed+0x7d>
  806e76:	8b 45 e8             	mov    -0x18(%rbp),%eax
  806e79:	eb 4a                	jmp    806ec5 <_pipeisclosed+0xc7>
  806e7b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806e7e:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  806e81:	74 8c                	je     806e0f <_pipeisclosed+0x11>
  806e83:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  806e87:	75 86                	jne    806e0f <_pipeisclosed+0x11>
  806e89:	48 b8 20 60 81 00 00 	movabs $0x816020,%rax
  806e90:	00 00 00 
  806e93:	48 8b 00             	mov    (%rax),%rax
  806e96:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  806e9c:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  806e9f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  806ea2:	89 c6                	mov    %eax,%esi
  806ea4:	48 bf f3 81 80 00 00 	movabs $0x8081f3,%rdi
  806eab:	00 00 00 
  806eae:	b8 00 00 00 00       	mov    $0x0,%eax
  806eb3:	49 b8 1a 37 80 00 00 	movabs $0x80371a,%r8
  806eba:	00 00 00 
  806ebd:	41 ff d0             	callq  *%r8
  806ec0:	e9 4a ff ff ff       	jmpq   806e0f <_pipeisclosed+0x11>
  806ec5:	48 83 c4 28          	add    $0x28,%rsp
  806ec9:	5b                   	pop    %rbx
  806eca:	5d                   	pop    %rbp
  806ecb:	c3                   	retq   

0000000000806ecc <pipeisclosed>:
  806ecc:	55                   	push   %rbp
  806ecd:	48 89 e5             	mov    %rsp,%rbp
  806ed0:	48 83 ec 30          	sub    $0x30,%rsp
  806ed4:	89 7d dc             	mov    %edi,-0x24(%rbp)
  806ed7:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  806edb:	8b 45 dc             	mov    -0x24(%rbp),%eax
  806ede:	48 89 d6             	mov    %rdx,%rsi
  806ee1:	89 c7                	mov    %eax,%edi
  806ee3:	48 b8 21 54 80 00 00 	movabs $0x805421,%rax
  806eea:	00 00 00 
  806eed:	ff d0                	callq  *%rax
  806eef:	89 45 fc             	mov    %eax,-0x4(%rbp)
  806ef2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  806ef6:	79 05                	jns    806efd <pipeisclosed+0x31>
  806ef8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  806efb:	eb 31                	jmp    806f2e <pipeisclosed+0x62>
  806efd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  806f01:	48 89 c7             	mov    %rax,%rdi
  806f04:	48 b8 5e 53 80 00 00 	movabs $0x80535e,%rax
  806f0b:	00 00 00 
  806f0e:	ff d0                	callq  *%rax
  806f10:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  806f14:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  806f18:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  806f1c:	48 89 d6             	mov    %rdx,%rsi
  806f1f:	48 89 c7             	mov    %rax,%rdi
  806f22:	48 b8 fe 6d 80 00 00 	movabs $0x806dfe,%rax
  806f29:	00 00 00 
  806f2c:	ff d0                	callq  *%rax
  806f2e:	c9                   	leaveq 
  806f2f:	c3                   	retq   

0000000000806f30 <devpipe_read>:
  806f30:	55                   	push   %rbp
  806f31:	48 89 e5             	mov    %rsp,%rbp
  806f34:	48 83 ec 40          	sub    $0x40,%rsp
  806f38:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  806f3c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  806f40:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  806f44:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806f48:	48 89 c7             	mov    %rax,%rdi
  806f4b:	48 b8 5e 53 80 00 00 	movabs $0x80535e,%rax
  806f52:	00 00 00 
  806f55:	ff d0                	callq  *%rax
  806f57:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  806f5b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  806f5f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  806f63:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  806f6a:	00 
  806f6b:	e9 90 00 00 00       	jmpq   807000 <devpipe_read+0xd0>
  806f70:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  806f75:	74 09                	je     806f80 <devpipe_read+0x50>
  806f77:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806f7b:	e9 8e 00 00 00       	jmpq   80700e <devpipe_read+0xde>
  806f80:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  806f84:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  806f88:	48 89 d6             	mov    %rdx,%rsi
  806f8b:	48 89 c7             	mov    %rax,%rdi
  806f8e:	48 b8 fe 6d 80 00 00 	movabs $0x806dfe,%rax
  806f95:	00 00 00 
  806f98:	ff d0                	callq  *%rax
  806f9a:	85 c0                	test   %eax,%eax
  806f9c:	74 07                	je     806fa5 <devpipe_read+0x75>
  806f9e:	b8 00 00 00 00       	mov    $0x0,%eax
  806fa3:	eb 69                	jmp    80700e <devpipe_read+0xde>
  806fa5:	48 b8 9d 4b 80 00 00 	movabs $0x804b9d,%rax
  806fac:	00 00 00 
  806faf:	ff d0                	callq  *%rax
  806fb1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806fb5:	8b 10                	mov    (%rax),%edx
  806fb7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806fbb:	8b 40 04             	mov    0x4(%rax),%eax
  806fbe:	39 c2                	cmp    %eax,%edx
  806fc0:	74 ae                	je     806f70 <devpipe_read+0x40>
  806fc2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  806fc6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  806fca:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  806fce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806fd2:	8b 00                	mov    (%rax),%eax
  806fd4:	99                   	cltd   
  806fd5:	c1 ea 1b             	shr    $0x1b,%edx
  806fd8:	01 d0                	add    %edx,%eax
  806fda:	83 e0 1f             	and    $0x1f,%eax
  806fdd:	29 d0                	sub    %edx,%eax
  806fdf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  806fe3:	48 98                	cltq   
  806fe5:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  806fea:	88 01                	mov    %al,(%rcx)
  806fec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806ff0:	8b 00                	mov    (%rax),%eax
  806ff2:	8d 50 01             	lea    0x1(%rax),%edx
  806ff5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  806ff9:	89 10                	mov    %edx,(%rax)
  806ffb:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  807000:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  807004:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  807008:	72 a7                	jb     806fb1 <devpipe_read+0x81>
  80700a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80700e:	c9                   	leaveq 
  80700f:	c3                   	retq   

0000000000807010 <devpipe_write>:
  807010:	55                   	push   %rbp
  807011:	48 89 e5             	mov    %rsp,%rbp
  807014:	48 83 ec 40          	sub    $0x40,%rsp
  807018:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80701c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  807020:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  807024:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  807028:	48 89 c7             	mov    %rax,%rdi
  80702b:	48 b8 5e 53 80 00 00 	movabs $0x80535e,%rax
  807032:	00 00 00 
  807035:	ff d0                	callq  *%rax
  807037:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80703b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80703f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  807043:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80704a:	00 
  80704b:	e9 8f 00 00 00       	jmpq   8070df <devpipe_write+0xcf>
  807050:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  807054:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  807058:	48 89 d6             	mov    %rdx,%rsi
  80705b:	48 89 c7             	mov    %rax,%rdi
  80705e:	48 b8 fe 6d 80 00 00 	movabs $0x806dfe,%rax
  807065:	00 00 00 
  807068:	ff d0                	callq  *%rax
  80706a:	85 c0                	test   %eax,%eax
  80706c:	74 07                	je     807075 <devpipe_write+0x65>
  80706e:	b8 00 00 00 00       	mov    $0x0,%eax
  807073:	eb 78                	jmp    8070ed <devpipe_write+0xdd>
  807075:	48 b8 9d 4b 80 00 00 	movabs $0x804b9d,%rax
  80707c:	00 00 00 
  80707f:	ff d0                	callq  *%rax
  807081:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  807085:	8b 40 04             	mov    0x4(%rax),%eax
  807088:	48 63 d0             	movslq %eax,%rdx
  80708b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80708f:	8b 00                	mov    (%rax),%eax
  807091:	48 98                	cltq   
  807093:	48 83 c0 20          	add    $0x20,%rax
  807097:	48 39 c2             	cmp    %rax,%rdx
  80709a:	73 b4                	jae    807050 <devpipe_write+0x40>
  80709c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8070a0:	8b 40 04             	mov    0x4(%rax),%eax
  8070a3:	99                   	cltd   
  8070a4:	c1 ea 1b             	shr    $0x1b,%edx
  8070a7:	01 d0                	add    %edx,%eax
  8070a9:	83 e0 1f             	and    $0x1f,%eax
  8070ac:	29 d0                	sub    %edx,%eax
  8070ae:	89 c6                	mov    %eax,%esi
  8070b0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8070b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8070b8:	48 01 d0             	add    %rdx,%rax
  8070bb:	0f b6 08             	movzbl (%rax),%ecx
  8070be:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8070c2:	48 63 c6             	movslq %esi,%rax
  8070c5:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8070c9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8070cd:	8b 40 04             	mov    0x4(%rax),%eax
  8070d0:	8d 50 01             	lea    0x1(%rax),%edx
  8070d3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8070d7:	89 50 04             	mov    %edx,0x4(%rax)
  8070da:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8070df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8070e3:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8070e7:	72 98                	jb     807081 <devpipe_write+0x71>
  8070e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8070ed:	c9                   	leaveq 
  8070ee:	c3                   	retq   

00000000008070ef <devpipe_stat>:
  8070ef:	55                   	push   %rbp
  8070f0:	48 89 e5             	mov    %rsp,%rbp
  8070f3:	48 83 ec 20          	sub    $0x20,%rsp
  8070f7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8070fb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8070ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  807103:	48 89 c7             	mov    %rax,%rdi
  807106:	48 b8 5e 53 80 00 00 	movabs $0x80535e,%rax
  80710d:	00 00 00 
  807110:	ff d0                	callq  *%rax
  807112:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  807116:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80711a:	48 be 06 82 80 00 00 	movabs $0x808206,%rsi
  807121:	00 00 00 
  807124:	48 89 c7             	mov    %rax,%rdi
  807127:	48 b8 aa 42 80 00 00 	movabs $0x8042aa,%rax
  80712e:	00 00 00 
  807131:	ff d0                	callq  *%rax
  807133:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  807137:	8b 50 04             	mov    0x4(%rax),%edx
  80713a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80713e:	8b 00                	mov    (%rax),%eax
  807140:	29 c2                	sub    %eax,%edx
  807142:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  807146:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80714c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  807150:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  807157:	00 00 00 
  80715a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80715e:	48 b9 60 21 81 00 00 	movabs $0x812160,%rcx
  807165:	00 00 00 
  807168:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  80716f:	b8 00 00 00 00       	mov    $0x0,%eax
  807174:	c9                   	leaveq 
  807175:	c3                   	retq   

0000000000807176 <devpipe_close>:
  807176:	55                   	push   %rbp
  807177:	48 89 e5             	mov    %rsp,%rbp
  80717a:	48 83 ec 10          	sub    $0x10,%rsp
  80717e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  807182:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  807186:	48 89 c6             	mov    %rax,%rsi
  807189:	bf 00 00 00 00       	mov    $0x0,%edi
  80718e:	48 b8 8c 4c 80 00 00 	movabs $0x804c8c,%rax
  807195:	00 00 00 
  807198:	ff d0                	callq  *%rax
  80719a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80719e:	48 89 c7             	mov    %rax,%rdi
  8071a1:	48 b8 5e 53 80 00 00 	movabs $0x80535e,%rax
  8071a8:	00 00 00 
  8071ab:	ff d0                	callq  *%rax
  8071ad:	48 89 c6             	mov    %rax,%rsi
  8071b0:	bf 00 00 00 00       	mov    $0x0,%edi
  8071b5:	48 b8 8c 4c 80 00 00 	movabs $0x804c8c,%rax
  8071bc:	00 00 00 
  8071bf:	ff d0                	callq  *%rax
  8071c1:	c9                   	leaveq 
  8071c2:	c3                   	retq   

00000000008071c3 <cputchar>:
  8071c3:	55                   	push   %rbp
  8071c4:	48 89 e5             	mov    %rsp,%rbp
  8071c7:	48 83 ec 20          	sub    $0x20,%rsp
  8071cb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8071ce:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8071d1:	88 45 ff             	mov    %al,-0x1(%rbp)
  8071d4:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  8071d8:	be 01 00 00 00       	mov    $0x1,%esi
  8071dd:	48 89 c7             	mov    %rax,%rdi
  8071e0:	48 b8 92 4a 80 00 00 	movabs $0x804a92,%rax
  8071e7:	00 00 00 
  8071ea:	ff d0                	callq  *%rax
  8071ec:	90                   	nop
  8071ed:	c9                   	leaveq 
  8071ee:	c3                   	retq   

00000000008071ef <getchar>:
  8071ef:	55                   	push   %rbp
  8071f0:	48 89 e5             	mov    %rsp,%rbp
  8071f3:	48 83 ec 10          	sub    $0x10,%rsp
  8071f7:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8071fb:	ba 01 00 00 00       	mov    $0x1,%edx
  807200:	48 89 c6             	mov    %rax,%rsi
  807203:	bf 00 00 00 00       	mov    $0x0,%edi
  807208:	48 b8 56 58 80 00 00 	movabs $0x805856,%rax
  80720f:	00 00 00 
  807212:	ff d0                	callq  *%rax
  807214:	89 45 fc             	mov    %eax,-0x4(%rbp)
  807217:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80721b:	79 05                	jns    807222 <getchar+0x33>
  80721d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  807220:	eb 14                	jmp    807236 <getchar+0x47>
  807222:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  807226:	7f 07                	jg     80722f <getchar+0x40>
  807228:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  80722d:	eb 07                	jmp    807236 <getchar+0x47>
  80722f:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  807233:	0f b6 c0             	movzbl %al,%eax
  807236:	c9                   	leaveq 
  807237:	c3                   	retq   

0000000000807238 <iscons>:
  807238:	55                   	push   %rbp
  807239:	48 89 e5             	mov    %rsp,%rbp
  80723c:	48 83 ec 20          	sub    $0x20,%rsp
  807240:	89 7d ec             	mov    %edi,-0x14(%rbp)
  807243:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  807247:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80724a:	48 89 d6             	mov    %rdx,%rsi
  80724d:	89 c7                	mov    %eax,%edi
  80724f:	48 b8 21 54 80 00 00 	movabs $0x805421,%rax
  807256:	00 00 00 
  807259:	ff d0                	callq  *%rax
  80725b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80725e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  807262:	79 05                	jns    807269 <iscons+0x31>
  807264:	8b 45 fc             	mov    -0x4(%rbp),%eax
  807267:	eb 1a                	jmp    807283 <iscons+0x4b>
  807269:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80726d:	8b 10                	mov    (%rax),%edx
  80726f:	48 b8 a0 21 81 00 00 	movabs $0x8121a0,%rax
  807276:	00 00 00 
  807279:	8b 00                	mov    (%rax),%eax
  80727b:	39 c2                	cmp    %eax,%edx
  80727d:	0f 94 c0             	sete   %al
  807280:	0f b6 c0             	movzbl %al,%eax
  807283:	c9                   	leaveq 
  807284:	c3                   	retq   

0000000000807285 <opencons>:
  807285:	55                   	push   %rbp
  807286:	48 89 e5             	mov    %rsp,%rbp
  807289:	48 83 ec 10          	sub    $0x10,%rsp
  80728d:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  807291:	48 89 c7             	mov    %rax,%rdi
  807294:	48 b8 89 53 80 00 00 	movabs $0x805389,%rax
  80729b:	00 00 00 
  80729e:	ff d0                	callq  *%rax
  8072a0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8072a3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8072a7:	79 05                	jns    8072ae <opencons+0x29>
  8072a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8072ac:	eb 5b                	jmp    807309 <opencons+0x84>
  8072ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8072b2:	ba 07 04 00 00       	mov    $0x407,%edx
  8072b7:	48 89 c6             	mov    %rax,%rsi
  8072ba:	bf 00 00 00 00       	mov    $0x0,%edi
  8072bf:	48 b8 da 4b 80 00 00 	movabs $0x804bda,%rax
  8072c6:	00 00 00 
  8072c9:	ff d0                	callq  *%rax
  8072cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8072ce:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8072d2:	79 05                	jns    8072d9 <opencons+0x54>
  8072d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8072d7:	eb 30                	jmp    807309 <opencons+0x84>
  8072d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8072dd:	48 ba a0 21 81 00 00 	movabs $0x8121a0,%rdx
  8072e4:	00 00 00 
  8072e7:	8b 12                	mov    (%rdx),%edx
  8072e9:	89 10                	mov    %edx,(%rax)
  8072eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8072ef:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8072f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8072fa:	48 89 c7             	mov    %rax,%rdi
  8072fd:	48 b8 3b 53 80 00 00 	movabs $0x80533b,%rax
  807304:	00 00 00 
  807307:	ff d0                	callq  *%rax
  807309:	c9                   	leaveq 
  80730a:	c3                   	retq   

000000000080730b <devcons_read>:
  80730b:	55                   	push   %rbp
  80730c:	48 89 e5             	mov    %rsp,%rbp
  80730f:	48 83 ec 30          	sub    $0x30,%rsp
  807313:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  807317:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80731b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80731f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  807324:	75 13                	jne    807339 <devcons_read+0x2e>
  807326:	b8 00 00 00 00       	mov    $0x0,%eax
  80732b:	eb 49                	jmp    807376 <devcons_read+0x6b>
  80732d:	48 b8 9d 4b 80 00 00 	movabs $0x804b9d,%rax
  807334:	00 00 00 
  807337:	ff d0                	callq  *%rax
  807339:	48 b8 df 4a 80 00 00 	movabs $0x804adf,%rax
  807340:	00 00 00 
  807343:	ff d0                	callq  *%rax
  807345:	89 45 fc             	mov    %eax,-0x4(%rbp)
  807348:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80734c:	74 df                	je     80732d <devcons_read+0x22>
  80734e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  807352:	79 05                	jns    807359 <devcons_read+0x4e>
  807354:	8b 45 fc             	mov    -0x4(%rbp),%eax
  807357:	eb 1d                	jmp    807376 <devcons_read+0x6b>
  807359:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  80735d:	75 07                	jne    807366 <devcons_read+0x5b>
  80735f:	b8 00 00 00 00       	mov    $0x0,%eax
  807364:	eb 10                	jmp    807376 <devcons_read+0x6b>
  807366:	8b 45 fc             	mov    -0x4(%rbp),%eax
  807369:	89 c2                	mov    %eax,%edx
  80736b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80736f:	88 10                	mov    %dl,(%rax)
  807371:	b8 01 00 00 00       	mov    $0x1,%eax
  807376:	c9                   	leaveq 
  807377:	c3                   	retq   

0000000000807378 <devcons_write>:
  807378:	55                   	push   %rbp
  807379:	48 89 e5             	mov    %rsp,%rbp
  80737c:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  807383:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  80738a:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  807391:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  807398:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80739f:	eb 76                	jmp    807417 <devcons_write+0x9f>
  8073a1:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8073a8:	89 c2                	mov    %eax,%edx
  8073aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8073ad:	29 c2                	sub    %eax,%edx
  8073af:	89 d0                	mov    %edx,%eax
  8073b1:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8073b4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8073b7:	83 f8 7f             	cmp    $0x7f,%eax
  8073ba:	76 07                	jbe    8073c3 <devcons_write+0x4b>
  8073bc:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8073c3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8073c6:	48 63 d0             	movslq %eax,%rdx
  8073c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8073cc:	48 63 c8             	movslq %eax,%rcx
  8073cf:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8073d6:	48 01 c1             	add    %rax,%rcx
  8073d9:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8073e0:	48 89 ce             	mov    %rcx,%rsi
  8073e3:	48 89 c7             	mov    %rax,%rdi
  8073e6:	48 b8 cf 45 80 00 00 	movabs $0x8045cf,%rax
  8073ed:	00 00 00 
  8073f0:	ff d0                	callq  *%rax
  8073f2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8073f5:	48 63 d0             	movslq %eax,%rdx
  8073f8:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8073ff:	48 89 d6             	mov    %rdx,%rsi
  807402:	48 89 c7             	mov    %rax,%rdi
  807405:	48 b8 92 4a 80 00 00 	movabs $0x804a92,%rax
  80740c:	00 00 00 
  80740f:	ff d0                	callq  *%rax
  807411:	8b 45 f8             	mov    -0x8(%rbp),%eax
  807414:	01 45 fc             	add    %eax,-0x4(%rbp)
  807417:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80741a:	48 98                	cltq   
  80741c:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  807423:	0f 82 78 ff ff ff    	jb     8073a1 <devcons_write+0x29>
  807429:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80742c:	c9                   	leaveq 
  80742d:	c3                   	retq   

000000000080742e <devcons_close>:
  80742e:	55                   	push   %rbp
  80742f:	48 89 e5             	mov    %rsp,%rbp
  807432:	48 83 ec 08          	sub    $0x8,%rsp
  807436:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80743a:	b8 00 00 00 00       	mov    $0x0,%eax
  80743f:	c9                   	leaveq 
  807440:	c3                   	retq   

0000000000807441 <devcons_stat>:
  807441:	55                   	push   %rbp
  807442:	48 89 e5             	mov    %rsp,%rbp
  807445:	48 83 ec 10          	sub    $0x10,%rsp
  807449:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80744d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  807451:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  807455:	48 be 12 82 80 00 00 	movabs $0x808212,%rsi
  80745c:	00 00 00 
  80745f:	48 89 c7             	mov    %rax,%rdi
  807462:	48 b8 aa 42 80 00 00 	movabs $0x8042aa,%rax
  807469:	00 00 00 
  80746c:	ff d0                	callq  *%rax
  80746e:	b8 00 00 00 00       	mov    $0x0,%eax
  807473:	c9                   	leaveq 
  807474:	c3                   	retq   
