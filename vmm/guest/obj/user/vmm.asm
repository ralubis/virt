
vmm/guest/obj/user/vmm:     file format elf64-x86-64


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
  80003c:	e8 d2 01 00 00       	callq  800213 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <map_in_guest>:
//
// Return 0 on success, <0 on failure.
//
static int
map_in_guest( envid_t guest, uintptr_t gpa, size_t memsz, 
	      int fd, size_t filesz, off_t fileoffset ) {
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 28          	sub    $0x28,%rsp
  80004b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80004e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800052:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800056:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  800059:	4c 89 45 e0          	mov    %r8,-0x20(%rbp)
  80005d:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
	/* Your code here */
	return -E_NO_SYS;
  800061:	b8 f9 ff ff ff       	mov    $0xfffffff9,%eax
} 
  800066:	c9                   	leaveq 
  800067:	c3                   	retq   

0000000000800068 <copy_guest_kern_gpa>:
//
// Return 0 on success, <0 on error
//
// Hint: compare with ELF parsing in env.c, and use map_in_guest for each segment.
static int
copy_guest_kern_gpa( envid_t guest, char* fname ) {
  800068:	55                   	push   %rbp
  800069:	48 89 e5             	mov    %rsp,%rbp
  80006c:	48 83 ec 10          	sub    $0x10,%rsp
  800070:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800073:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
	/* Your code here */
	return -E_NO_SYS;
  800077:	b8 f9 ff ff ff       	mov    $0xfffffff9,%eax
}
  80007c:	c9                   	leaveq 
  80007d:	c3                   	retq   

000000000080007e <umain>:

void
umain(int argc, char **argv) {
  80007e:	55                   	push   %rbp
  80007f:	48 89 e5             	mov    %rsp,%rbp
  800082:	48 83 ec 50          	sub    $0x50,%rsp
  800086:	89 7d bc             	mov    %edi,-0x44(%rbp)
  800089:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
  80008d:	be 00 70 00 00       	mov    $0x7000,%esi
  800092:	bf 00 00 00 01       	mov    $0x1000000,%edi
  800097:	48 b8 51 1c 80 00 00 	movabs $0x801c51,%rax
  80009e:	00 00 00 
  8000a1:	ff d0                	callq  *%rax
  8000a3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8000a6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000aa:	79 2c                	jns    8000d8 <umain+0x5a>
  8000ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000af:	89 c6                	mov    %eax,%esi
  8000b1:	48 bf c0 41 80 00 00 	movabs $0x8041c0,%rdi
  8000b8:	00 00 00 
  8000bb:	b8 00 00 00 00       	mov    $0x0,%eax
  8000c0:	48 ba e1 03 80 00 00 	movabs $0x8003e1,%rdx
  8000c7:	00 00 00 
  8000ca:	ff d2                	callq  *%rdx
  8000cc:	48 b8 97 02 80 00 00 	movabs $0x800297,%rax
  8000d3:	00 00 00 
  8000d6:	ff d0                	callq  *%rax
  8000d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000db:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8000de:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000e1:	48 be e3 41 80 00 00 	movabs $0x8041e3,%rsi
  8000e8:	00 00 00 
  8000eb:	89 c7                	mov    %eax,%edi
  8000ed:	48 b8 68 00 80 00 00 	movabs $0x800068,%rax
  8000f4:	00 00 00 
  8000f7:	ff d0                	callq  *%rax
  8000f9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8000fc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800100:	79 2c                	jns    80012e <umain+0xb0>
  800102:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800105:	89 c6                	mov    %eax,%esi
  800107:	48 bf f0 41 80 00 00 	movabs $0x8041f0,%rdi
  80010e:	00 00 00 
  800111:	b8 00 00 00 00       	mov    $0x0,%eax
  800116:	48 ba e1 03 80 00 00 	movabs $0x8003e1,%rdx
  80011d:	00 00 00 
  800120:	ff d2                	callq  *%rdx
  800122:	48 b8 97 02 80 00 00 	movabs $0x800297,%rax
  800129:	00 00 00 
  80012c:	ff d0                	callq  *%rax
  80012e:	be 00 00 00 00       	mov    $0x0,%esi
  800133:	48 bf 19 42 80 00 00 	movabs $0x804219,%rdi
  80013a:	00 00 00 
  80013d:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  800144:	00 00 00 
  800147:	ff d0                	callq  *%rax
  800149:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80014c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  800150:	79 36                	jns    800188 <umain+0x10a>
  800152:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800155:	89 c2                	mov    %eax,%edx
  800157:	48 be 19 42 80 00 00 	movabs $0x804219,%rsi
  80015e:	00 00 00 
  800161:	48 bf 23 42 80 00 00 	movabs $0x804223,%rdi
  800168:	00 00 00 
  80016b:	b8 00 00 00 00       	mov    $0x0,%eax
  800170:	48 b9 e1 03 80 00 00 	movabs $0x8003e1,%rcx
  800177:	00 00 00 
  80017a:	ff d1                	callq  *%rcx
  80017c:	48 b8 97 02 80 00 00 	movabs $0x800297,%rax
  800183:	00 00 00 
  800186:	ff d0                	callq  *%rax
  800188:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80018b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80018e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800194:	41 b8 00 02 00 00    	mov    $0x200,%r8d
  80019a:	89 d1                	mov    %edx,%ecx
  80019c:	ba 00 02 00 00       	mov    $0x200,%edx
  8001a1:	be 00 70 00 00       	mov    $0x7000,%esi
  8001a6:	89 c7                	mov    %eax,%edi
  8001a8:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8001af:	00 00 00 
  8001b2:	ff d0                	callq  *%rax
  8001b4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8001b7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8001bb:	79 2c                	jns    8001e9 <umain+0x16b>
  8001bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001c0:	89 c6                	mov    %eax,%esi
  8001c2:	48 bf 40 42 80 00 00 	movabs $0x804240,%rdi
  8001c9:	00 00 00 
  8001cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8001d1:	48 ba e1 03 80 00 00 	movabs $0x8003e1,%rdx
  8001d8:	00 00 00 
  8001db:	ff d2                	callq  *%rdx
  8001dd:	48 b8 97 02 80 00 00 	movabs $0x800297,%rax
  8001e4:	00 00 00 
  8001e7:	ff d0                	callq  *%rax
  8001e9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8001ec:	be 02 00 00 00       	mov    $0x2,%esi
  8001f1:	89 c7                	mov    %eax,%edi
  8001f3:	48 b8 9f 19 80 00 00 	movabs $0x80199f,%rax
  8001fa:	00 00 00 
  8001fd:	ff d0                	callq  *%rax
  8001ff:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800202:	89 c7                	mov    %eax,%edi
  800204:	48 b8 99 3a 80 00 00 	movabs $0x803a99,%rax
  80020b:	00 00 00 
  80020e:	ff d0                	callq  *%rax
  800210:	90                   	nop
  800211:	c9                   	leaveq 
  800212:	c3                   	retq   

0000000000800213 <libmain>:
  800213:	55                   	push   %rbp
  800214:	48 89 e5             	mov    %rsp,%rbp
  800217:	48 83 ec 10          	sub    $0x10,%rsp
  80021b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80021e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800222:	48 b8 28 18 80 00 00 	movabs $0x801828,%rax
  800229:	00 00 00 
  80022c:	ff d0                	callq  *%rax
  80022e:	25 ff 03 00 00       	and    $0x3ff,%eax
  800233:	48 98                	cltq   
  800235:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80023c:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800243:	00 00 00 
  800246:	48 01 c2             	add    %rax,%rdx
  800249:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800250:	00 00 00 
  800253:	48 89 10             	mov    %rdx,(%rax)
  800256:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80025a:	7e 14                	jle    800270 <libmain+0x5d>
  80025c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800260:	48 8b 10             	mov    (%rax),%rdx
  800263:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  80026a:	00 00 00 
  80026d:	48 89 10             	mov    %rdx,(%rax)
  800270:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800274:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800277:	48 89 d6             	mov    %rdx,%rsi
  80027a:	89 c7                	mov    %eax,%edi
  80027c:	48 b8 7e 00 80 00 00 	movabs $0x80007e,%rax
  800283:	00 00 00 
  800286:	ff d0                	callq  *%rax
  800288:	48 b8 97 02 80 00 00 	movabs $0x800297,%rax
  80028f:	00 00 00 
  800292:	ff d0                	callq  *%rax
  800294:	90                   	nop
  800295:	c9                   	leaveq 
  800296:	c3                   	retq   

0000000000800297 <exit>:
  800297:	55                   	push   %rbp
  800298:	48 89 e5             	mov    %rsp,%rbp
  80029b:	48 b8 e0 1f 80 00 00 	movabs $0x801fe0,%rax
  8002a2:	00 00 00 
  8002a5:	ff d0                	callq  *%rax
  8002a7:	bf 00 00 00 00       	mov    $0x0,%edi
  8002ac:	48 b8 e2 17 80 00 00 	movabs $0x8017e2,%rax
  8002b3:	00 00 00 
  8002b6:	ff d0                	callq  *%rax
  8002b8:	90                   	nop
  8002b9:	5d                   	pop    %rbp
  8002ba:	c3                   	retq   

00000000008002bb <putch>:
  8002bb:	55                   	push   %rbp
  8002bc:	48 89 e5             	mov    %rsp,%rbp
  8002bf:	48 83 ec 10          	sub    $0x10,%rsp
  8002c3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8002c6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8002ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002ce:	8b 00                	mov    (%rax),%eax
  8002d0:	8d 48 01             	lea    0x1(%rax),%ecx
  8002d3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8002d7:	89 0a                	mov    %ecx,(%rdx)
  8002d9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8002dc:	89 d1                	mov    %edx,%ecx
  8002de:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8002e2:	48 98                	cltq   
  8002e4:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8002e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002ec:	8b 00                	mov    (%rax),%eax
  8002ee:	3d ff 00 00 00       	cmp    $0xff,%eax
  8002f3:	75 2c                	jne    800321 <putch+0x66>
  8002f5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002f9:	8b 00                	mov    (%rax),%eax
  8002fb:	48 98                	cltq   
  8002fd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800301:	48 83 c2 08          	add    $0x8,%rdx
  800305:	48 89 c6             	mov    %rax,%rsi
  800308:	48 89 d7             	mov    %rdx,%rdi
  80030b:	48 b8 59 17 80 00 00 	movabs $0x801759,%rax
  800312:	00 00 00 
  800315:	ff d0                	callq  *%rax
  800317:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80031b:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800321:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800325:	8b 40 04             	mov    0x4(%rax),%eax
  800328:	8d 50 01             	lea    0x1(%rax),%edx
  80032b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80032f:	89 50 04             	mov    %edx,0x4(%rax)
  800332:	90                   	nop
  800333:	c9                   	leaveq 
  800334:	c3                   	retq   

0000000000800335 <vcprintf>:
  800335:	55                   	push   %rbp
  800336:	48 89 e5             	mov    %rsp,%rbp
  800339:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800340:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800347:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  80034e:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800355:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  80035c:	48 8b 0a             	mov    (%rdx),%rcx
  80035f:	48 89 08             	mov    %rcx,(%rax)
  800362:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800366:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80036a:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80036e:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800372:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800379:	00 00 00 
  80037c:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800383:	00 00 00 
  800386:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  80038d:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800394:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  80039b:	48 89 c6             	mov    %rax,%rsi
  80039e:	48 bf bb 02 80 00 00 	movabs $0x8002bb,%rdi
  8003a5:	00 00 00 
  8003a8:	48 b8 7f 07 80 00 00 	movabs $0x80077f,%rax
  8003af:	00 00 00 
  8003b2:	ff d0                	callq  *%rax
  8003b4:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8003ba:	48 98                	cltq   
  8003bc:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8003c3:	48 83 c2 08          	add    $0x8,%rdx
  8003c7:	48 89 c6             	mov    %rax,%rsi
  8003ca:	48 89 d7             	mov    %rdx,%rdi
  8003cd:	48 b8 59 17 80 00 00 	movabs $0x801759,%rax
  8003d4:	00 00 00 
  8003d7:	ff d0                	callq  *%rax
  8003d9:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8003df:	c9                   	leaveq 
  8003e0:	c3                   	retq   

00000000008003e1 <cprintf>:
  8003e1:	55                   	push   %rbp
  8003e2:	48 89 e5             	mov    %rsp,%rbp
  8003e5:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  8003ec:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8003f3:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8003fa:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800401:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800408:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80040f:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800416:	84 c0                	test   %al,%al
  800418:	74 20                	je     80043a <cprintf+0x59>
  80041a:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80041e:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800422:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800426:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80042a:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80042e:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800432:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800436:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80043a:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800441:	00 00 00 
  800444:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80044b:	00 00 00 
  80044e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800452:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800459:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800460:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800467:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80046e:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800475:	48 8b 0a             	mov    (%rdx),%rcx
  800478:	48 89 08             	mov    %rcx,(%rax)
  80047b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80047f:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800483:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800487:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80048b:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800492:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800499:	48 89 d6             	mov    %rdx,%rsi
  80049c:	48 89 c7             	mov    %rax,%rdi
  80049f:	48 b8 35 03 80 00 00 	movabs $0x800335,%rax
  8004a6:	00 00 00 
  8004a9:	ff d0                	callq  *%rax
  8004ab:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8004b1:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8004b7:	c9                   	leaveq 
  8004b8:	c3                   	retq   

00000000008004b9 <printnum>:
  8004b9:	55                   	push   %rbp
  8004ba:	48 89 e5             	mov    %rsp,%rbp
  8004bd:	48 83 ec 30          	sub    $0x30,%rsp
  8004c1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8004c5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8004c9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8004cd:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  8004d0:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  8004d4:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  8004d8:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8004db:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  8004df:	77 54                	ja     800535 <printnum+0x7c>
  8004e1:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8004e4:	8d 78 ff             	lea    -0x1(%rax),%edi
  8004e7:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  8004ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004ee:	ba 00 00 00 00       	mov    $0x0,%edx
  8004f3:	48 f7 f6             	div    %rsi
  8004f6:	49 89 c2             	mov    %rax,%r10
  8004f9:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8004fc:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8004ff:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  800503:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800507:	41 89 c9             	mov    %ecx,%r9d
  80050a:	41 89 f8             	mov    %edi,%r8d
  80050d:	89 d1                	mov    %edx,%ecx
  80050f:	4c 89 d2             	mov    %r10,%rdx
  800512:	48 89 c7             	mov    %rax,%rdi
  800515:	48 b8 b9 04 80 00 00 	movabs $0x8004b9,%rax
  80051c:	00 00 00 
  80051f:	ff d0                	callq  *%rax
  800521:	eb 1c                	jmp    80053f <printnum+0x86>
  800523:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800527:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80052a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80052e:	48 89 ce             	mov    %rcx,%rsi
  800531:	89 d7                	mov    %edx,%edi
  800533:	ff d0                	callq  *%rax
  800535:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  800539:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  80053d:	7f e4                	jg     800523 <printnum+0x6a>
  80053f:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800542:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800546:	ba 00 00 00 00       	mov    $0x0,%edx
  80054b:	48 f7 f1             	div    %rcx
  80054e:	48 b8 70 44 80 00 00 	movabs $0x804470,%rax
  800555:	00 00 00 
  800558:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  80055c:	0f be d0             	movsbl %al,%edx
  80055f:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800563:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800567:	48 89 ce             	mov    %rcx,%rsi
  80056a:	89 d7                	mov    %edx,%edi
  80056c:	ff d0                	callq  *%rax
  80056e:	90                   	nop
  80056f:	c9                   	leaveq 
  800570:	c3                   	retq   

0000000000800571 <getuint>:
  800571:	55                   	push   %rbp
  800572:	48 89 e5             	mov    %rsp,%rbp
  800575:	48 83 ec 20          	sub    $0x20,%rsp
  800579:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80057d:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800580:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800584:	7e 4f                	jle    8005d5 <getuint+0x64>
  800586:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80058a:	8b 00                	mov    (%rax),%eax
  80058c:	83 f8 30             	cmp    $0x30,%eax
  80058f:	73 24                	jae    8005b5 <getuint+0x44>
  800591:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800595:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800599:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80059d:	8b 00                	mov    (%rax),%eax
  80059f:	89 c0                	mov    %eax,%eax
  8005a1:	48 01 d0             	add    %rdx,%rax
  8005a4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005a8:	8b 12                	mov    (%rdx),%edx
  8005aa:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8005ad:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005b1:	89 0a                	mov    %ecx,(%rdx)
  8005b3:	eb 14                	jmp    8005c9 <getuint+0x58>
  8005b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005b9:	48 8b 40 08          	mov    0x8(%rax),%rax
  8005bd:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8005c1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005c5:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8005c9:	48 8b 00             	mov    (%rax),%rax
  8005cc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8005d0:	e9 9d 00 00 00       	jmpq   800672 <getuint+0x101>
  8005d5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8005d9:	74 4c                	je     800627 <getuint+0xb6>
  8005db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005df:	8b 00                	mov    (%rax),%eax
  8005e1:	83 f8 30             	cmp    $0x30,%eax
  8005e4:	73 24                	jae    80060a <getuint+0x99>
  8005e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005ea:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8005ee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005f2:	8b 00                	mov    (%rax),%eax
  8005f4:	89 c0                	mov    %eax,%eax
  8005f6:	48 01 d0             	add    %rdx,%rax
  8005f9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005fd:	8b 12                	mov    (%rdx),%edx
  8005ff:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800602:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800606:	89 0a                	mov    %ecx,(%rdx)
  800608:	eb 14                	jmp    80061e <getuint+0xad>
  80060a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80060e:	48 8b 40 08          	mov    0x8(%rax),%rax
  800612:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800616:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80061a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80061e:	48 8b 00             	mov    (%rax),%rax
  800621:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800625:	eb 4b                	jmp    800672 <getuint+0x101>
  800627:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80062b:	8b 00                	mov    (%rax),%eax
  80062d:	83 f8 30             	cmp    $0x30,%eax
  800630:	73 24                	jae    800656 <getuint+0xe5>
  800632:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800636:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80063a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80063e:	8b 00                	mov    (%rax),%eax
  800640:	89 c0                	mov    %eax,%eax
  800642:	48 01 d0             	add    %rdx,%rax
  800645:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800649:	8b 12                	mov    (%rdx),%edx
  80064b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80064e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800652:	89 0a                	mov    %ecx,(%rdx)
  800654:	eb 14                	jmp    80066a <getuint+0xf9>
  800656:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80065a:	48 8b 40 08          	mov    0x8(%rax),%rax
  80065e:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800662:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800666:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80066a:	8b 00                	mov    (%rax),%eax
  80066c:	89 c0                	mov    %eax,%eax
  80066e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800672:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800676:	c9                   	leaveq 
  800677:	c3                   	retq   

0000000000800678 <getint>:
  800678:	55                   	push   %rbp
  800679:	48 89 e5             	mov    %rsp,%rbp
  80067c:	48 83 ec 20          	sub    $0x20,%rsp
  800680:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800684:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800687:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80068b:	7e 4f                	jle    8006dc <getint+0x64>
  80068d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800691:	8b 00                	mov    (%rax),%eax
  800693:	83 f8 30             	cmp    $0x30,%eax
  800696:	73 24                	jae    8006bc <getint+0x44>
  800698:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80069c:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006a4:	8b 00                	mov    (%rax),%eax
  8006a6:	89 c0                	mov    %eax,%eax
  8006a8:	48 01 d0             	add    %rdx,%rax
  8006ab:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006af:	8b 12                	mov    (%rdx),%edx
  8006b1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006b4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006b8:	89 0a                	mov    %ecx,(%rdx)
  8006ba:	eb 14                	jmp    8006d0 <getint+0x58>
  8006bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006c0:	48 8b 40 08          	mov    0x8(%rax),%rax
  8006c4:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8006c8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006cc:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006d0:	48 8b 00             	mov    (%rax),%rax
  8006d3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006d7:	e9 9d 00 00 00       	jmpq   800779 <getint+0x101>
  8006dc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8006e0:	74 4c                	je     80072e <getint+0xb6>
  8006e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006e6:	8b 00                	mov    (%rax),%eax
  8006e8:	83 f8 30             	cmp    $0x30,%eax
  8006eb:	73 24                	jae    800711 <getint+0x99>
  8006ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006f1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006f9:	8b 00                	mov    (%rax),%eax
  8006fb:	89 c0                	mov    %eax,%eax
  8006fd:	48 01 d0             	add    %rdx,%rax
  800700:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800704:	8b 12                	mov    (%rdx),%edx
  800706:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800709:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80070d:	89 0a                	mov    %ecx,(%rdx)
  80070f:	eb 14                	jmp    800725 <getint+0xad>
  800711:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800715:	48 8b 40 08          	mov    0x8(%rax),%rax
  800719:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80071d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800721:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800725:	48 8b 00             	mov    (%rax),%rax
  800728:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80072c:	eb 4b                	jmp    800779 <getint+0x101>
  80072e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800732:	8b 00                	mov    (%rax),%eax
  800734:	83 f8 30             	cmp    $0x30,%eax
  800737:	73 24                	jae    80075d <getint+0xe5>
  800739:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80073d:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800741:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800745:	8b 00                	mov    (%rax),%eax
  800747:	89 c0                	mov    %eax,%eax
  800749:	48 01 d0             	add    %rdx,%rax
  80074c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800750:	8b 12                	mov    (%rdx),%edx
  800752:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800755:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800759:	89 0a                	mov    %ecx,(%rdx)
  80075b:	eb 14                	jmp    800771 <getint+0xf9>
  80075d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800761:	48 8b 40 08          	mov    0x8(%rax),%rax
  800765:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800769:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80076d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800771:	8b 00                	mov    (%rax),%eax
  800773:	48 98                	cltq   
  800775:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800779:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80077d:	c9                   	leaveq 
  80077e:	c3                   	retq   

000000000080077f <vprintfmt>:
  80077f:	55                   	push   %rbp
  800780:	48 89 e5             	mov    %rsp,%rbp
  800783:	41 54                	push   %r12
  800785:	53                   	push   %rbx
  800786:	48 83 ec 60          	sub    $0x60,%rsp
  80078a:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  80078e:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800792:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800796:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  80079a:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80079e:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8007a2:	48 8b 0a             	mov    (%rdx),%rcx
  8007a5:	48 89 08             	mov    %rcx,(%rax)
  8007a8:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8007ac:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8007b0:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8007b4:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8007b8:	eb 17                	jmp    8007d1 <vprintfmt+0x52>
  8007ba:	85 db                	test   %ebx,%ebx
  8007bc:	0f 84 b9 04 00 00    	je     800c7b <vprintfmt+0x4fc>
  8007c2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8007c6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8007ca:	48 89 d6             	mov    %rdx,%rsi
  8007cd:	89 df                	mov    %ebx,%edi
  8007cf:	ff d0                	callq  *%rax
  8007d1:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8007d5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8007d9:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8007dd:	0f b6 00             	movzbl (%rax),%eax
  8007e0:	0f b6 d8             	movzbl %al,%ebx
  8007e3:	83 fb 25             	cmp    $0x25,%ebx
  8007e6:	75 d2                	jne    8007ba <vprintfmt+0x3b>
  8007e8:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  8007ec:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  8007f3:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8007fa:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800801:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800808:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80080c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800810:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800814:	0f b6 00             	movzbl (%rax),%eax
  800817:	0f b6 d8             	movzbl %al,%ebx
  80081a:	8d 43 dd             	lea    -0x23(%rbx),%eax
  80081d:	83 f8 55             	cmp    $0x55,%eax
  800820:	0f 87 22 04 00 00    	ja     800c48 <vprintfmt+0x4c9>
  800826:	89 c0                	mov    %eax,%eax
  800828:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80082f:	00 
  800830:	48 b8 98 44 80 00 00 	movabs $0x804498,%rax
  800837:	00 00 00 
  80083a:	48 01 d0             	add    %rdx,%rax
  80083d:	48 8b 00             	mov    (%rax),%rax
  800840:	ff e0                	jmpq   *%rax
  800842:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800846:	eb c0                	jmp    800808 <vprintfmt+0x89>
  800848:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  80084c:	eb ba                	jmp    800808 <vprintfmt+0x89>
  80084e:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800855:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800858:	89 d0                	mov    %edx,%eax
  80085a:	c1 e0 02             	shl    $0x2,%eax
  80085d:	01 d0                	add    %edx,%eax
  80085f:	01 c0                	add    %eax,%eax
  800861:	01 d8                	add    %ebx,%eax
  800863:	83 e8 30             	sub    $0x30,%eax
  800866:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800869:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80086d:	0f b6 00             	movzbl (%rax),%eax
  800870:	0f be d8             	movsbl %al,%ebx
  800873:	83 fb 2f             	cmp    $0x2f,%ebx
  800876:	7e 60                	jle    8008d8 <vprintfmt+0x159>
  800878:	83 fb 39             	cmp    $0x39,%ebx
  80087b:	7f 5b                	jg     8008d8 <vprintfmt+0x159>
  80087d:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800882:	eb d1                	jmp    800855 <vprintfmt+0xd6>
  800884:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800887:	83 f8 30             	cmp    $0x30,%eax
  80088a:	73 17                	jae    8008a3 <vprintfmt+0x124>
  80088c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800890:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800893:	89 d2                	mov    %edx,%edx
  800895:	48 01 d0             	add    %rdx,%rax
  800898:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80089b:	83 c2 08             	add    $0x8,%edx
  80089e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8008a1:	eb 0c                	jmp    8008af <vprintfmt+0x130>
  8008a3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8008a7:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8008ab:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8008af:	8b 00                	mov    (%rax),%eax
  8008b1:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8008b4:	eb 23                	jmp    8008d9 <vprintfmt+0x15a>
  8008b6:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8008ba:	0f 89 48 ff ff ff    	jns    800808 <vprintfmt+0x89>
  8008c0:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  8008c7:	e9 3c ff ff ff       	jmpq   800808 <vprintfmt+0x89>
  8008cc:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  8008d3:	e9 30 ff ff ff       	jmpq   800808 <vprintfmt+0x89>
  8008d8:	90                   	nop
  8008d9:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8008dd:	0f 89 25 ff ff ff    	jns    800808 <vprintfmt+0x89>
  8008e3:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8008e6:	89 45 dc             	mov    %eax,-0x24(%rbp)
  8008e9:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8008f0:	e9 13 ff ff ff       	jmpq   800808 <vprintfmt+0x89>
  8008f5:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  8008f9:	e9 0a ff ff ff       	jmpq   800808 <vprintfmt+0x89>
  8008fe:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800901:	83 f8 30             	cmp    $0x30,%eax
  800904:	73 17                	jae    80091d <vprintfmt+0x19e>
  800906:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80090a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80090d:	89 d2                	mov    %edx,%edx
  80090f:	48 01 d0             	add    %rdx,%rax
  800912:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800915:	83 c2 08             	add    $0x8,%edx
  800918:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80091b:	eb 0c                	jmp    800929 <vprintfmt+0x1aa>
  80091d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800921:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800925:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800929:	8b 10                	mov    (%rax),%edx
  80092b:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  80092f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800933:	48 89 ce             	mov    %rcx,%rsi
  800936:	89 d7                	mov    %edx,%edi
  800938:	ff d0                	callq  *%rax
  80093a:	e9 37 03 00 00       	jmpq   800c76 <vprintfmt+0x4f7>
  80093f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800942:	83 f8 30             	cmp    $0x30,%eax
  800945:	73 17                	jae    80095e <vprintfmt+0x1df>
  800947:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80094b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80094e:	89 d2                	mov    %edx,%edx
  800950:	48 01 d0             	add    %rdx,%rax
  800953:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800956:	83 c2 08             	add    $0x8,%edx
  800959:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80095c:	eb 0c                	jmp    80096a <vprintfmt+0x1eb>
  80095e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800962:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800966:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80096a:	8b 18                	mov    (%rax),%ebx
  80096c:	85 db                	test   %ebx,%ebx
  80096e:	79 02                	jns    800972 <vprintfmt+0x1f3>
  800970:	f7 db                	neg    %ebx
  800972:	83 fb 15             	cmp    $0x15,%ebx
  800975:	7f 16                	jg     80098d <vprintfmt+0x20e>
  800977:	48 b8 c0 43 80 00 00 	movabs $0x8043c0,%rax
  80097e:	00 00 00 
  800981:	48 63 d3             	movslq %ebx,%rdx
  800984:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800988:	4d 85 e4             	test   %r12,%r12
  80098b:	75 2e                	jne    8009bb <vprintfmt+0x23c>
  80098d:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800991:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800995:	89 d9                	mov    %ebx,%ecx
  800997:	48 ba 81 44 80 00 00 	movabs $0x804481,%rdx
  80099e:	00 00 00 
  8009a1:	48 89 c7             	mov    %rax,%rdi
  8009a4:	b8 00 00 00 00       	mov    $0x0,%eax
  8009a9:	49 b8 85 0c 80 00 00 	movabs $0x800c85,%r8
  8009b0:	00 00 00 
  8009b3:	41 ff d0             	callq  *%r8
  8009b6:	e9 bb 02 00 00       	jmpq   800c76 <vprintfmt+0x4f7>
  8009bb:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8009bf:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8009c3:	4c 89 e1             	mov    %r12,%rcx
  8009c6:	48 ba 8a 44 80 00 00 	movabs $0x80448a,%rdx
  8009cd:	00 00 00 
  8009d0:	48 89 c7             	mov    %rax,%rdi
  8009d3:	b8 00 00 00 00       	mov    $0x0,%eax
  8009d8:	49 b8 85 0c 80 00 00 	movabs $0x800c85,%r8
  8009df:	00 00 00 
  8009e2:	41 ff d0             	callq  *%r8
  8009e5:	e9 8c 02 00 00       	jmpq   800c76 <vprintfmt+0x4f7>
  8009ea:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009ed:	83 f8 30             	cmp    $0x30,%eax
  8009f0:	73 17                	jae    800a09 <vprintfmt+0x28a>
  8009f2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8009f6:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009f9:	89 d2                	mov    %edx,%edx
  8009fb:	48 01 d0             	add    %rdx,%rax
  8009fe:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a01:	83 c2 08             	add    $0x8,%edx
  800a04:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a07:	eb 0c                	jmp    800a15 <vprintfmt+0x296>
  800a09:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800a0d:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800a11:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a15:	4c 8b 20             	mov    (%rax),%r12
  800a18:	4d 85 e4             	test   %r12,%r12
  800a1b:	75 0a                	jne    800a27 <vprintfmt+0x2a8>
  800a1d:	49 bc 8d 44 80 00 00 	movabs $0x80448d,%r12
  800a24:	00 00 00 
  800a27:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a2b:	7e 78                	jle    800aa5 <vprintfmt+0x326>
  800a2d:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800a31:	74 72                	je     800aa5 <vprintfmt+0x326>
  800a33:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800a36:	48 98                	cltq   
  800a38:	48 89 c6             	mov    %rax,%rsi
  800a3b:	4c 89 e7             	mov    %r12,%rdi
  800a3e:	48 b8 33 0f 80 00 00 	movabs $0x800f33,%rax
  800a45:	00 00 00 
  800a48:	ff d0                	callq  *%rax
  800a4a:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800a4d:	eb 17                	jmp    800a66 <vprintfmt+0x2e7>
  800a4f:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800a53:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800a57:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a5b:	48 89 ce             	mov    %rcx,%rsi
  800a5e:	89 d7                	mov    %edx,%edi
  800a60:	ff d0                	callq  *%rax
  800a62:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800a66:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a6a:	7f e3                	jg     800a4f <vprintfmt+0x2d0>
  800a6c:	eb 37                	jmp    800aa5 <vprintfmt+0x326>
  800a6e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800a72:	74 1e                	je     800a92 <vprintfmt+0x313>
  800a74:	83 fb 1f             	cmp    $0x1f,%ebx
  800a77:	7e 05                	jle    800a7e <vprintfmt+0x2ff>
  800a79:	83 fb 7e             	cmp    $0x7e,%ebx
  800a7c:	7e 14                	jle    800a92 <vprintfmt+0x313>
  800a7e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a82:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a86:	48 89 d6             	mov    %rdx,%rsi
  800a89:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800a8e:	ff d0                	callq  *%rax
  800a90:	eb 0f                	jmp    800aa1 <vprintfmt+0x322>
  800a92:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a96:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a9a:	48 89 d6             	mov    %rdx,%rsi
  800a9d:	89 df                	mov    %ebx,%edi
  800a9f:	ff d0                	callq  *%rax
  800aa1:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800aa5:	4c 89 e0             	mov    %r12,%rax
  800aa8:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800aac:	0f b6 00             	movzbl (%rax),%eax
  800aaf:	0f be d8             	movsbl %al,%ebx
  800ab2:	85 db                	test   %ebx,%ebx
  800ab4:	74 28                	je     800ade <vprintfmt+0x35f>
  800ab6:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800aba:	78 b2                	js     800a6e <vprintfmt+0x2ef>
  800abc:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800ac0:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800ac4:	79 a8                	jns    800a6e <vprintfmt+0x2ef>
  800ac6:	eb 16                	jmp    800ade <vprintfmt+0x35f>
  800ac8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800acc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ad0:	48 89 d6             	mov    %rdx,%rsi
  800ad3:	bf 20 00 00 00       	mov    $0x20,%edi
  800ad8:	ff d0                	callq  *%rax
  800ada:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800ade:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ae2:	7f e4                	jg     800ac8 <vprintfmt+0x349>
  800ae4:	e9 8d 01 00 00       	jmpq   800c76 <vprintfmt+0x4f7>
  800ae9:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800aed:	be 03 00 00 00       	mov    $0x3,%esi
  800af2:	48 89 c7             	mov    %rax,%rdi
  800af5:	48 b8 78 06 80 00 00 	movabs $0x800678,%rax
  800afc:	00 00 00 
  800aff:	ff d0                	callq  *%rax
  800b01:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b05:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b09:	48 85 c0             	test   %rax,%rax
  800b0c:	79 1d                	jns    800b2b <vprintfmt+0x3ac>
  800b0e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b12:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b16:	48 89 d6             	mov    %rdx,%rsi
  800b19:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800b1e:	ff d0                	callq  *%rax
  800b20:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b24:	48 f7 d8             	neg    %rax
  800b27:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b2b:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800b32:	e9 d2 00 00 00       	jmpq   800c09 <vprintfmt+0x48a>
  800b37:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800b3b:	be 03 00 00 00       	mov    $0x3,%esi
  800b40:	48 89 c7             	mov    %rax,%rdi
  800b43:	48 b8 71 05 80 00 00 	movabs $0x800571,%rax
  800b4a:	00 00 00 
  800b4d:	ff d0                	callq  *%rax
  800b4f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b53:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800b5a:	e9 aa 00 00 00       	jmpq   800c09 <vprintfmt+0x48a>
  800b5f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800b63:	be 03 00 00 00       	mov    $0x3,%esi
  800b68:	48 89 c7             	mov    %rax,%rdi
  800b6b:	48 b8 71 05 80 00 00 	movabs $0x800571,%rax
  800b72:	00 00 00 
  800b75:	ff d0                	callq  *%rax
  800b77:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b7b:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800b82:	e9 82 00 00 00       	jmpq   800c09 <vprintfmt+0x48a>
  800b87:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b8b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b8f:	48 89 d6             	mov    %rdx,%rsi
  800b92:	bf 30 00 00 00       	mov    $0x30,%edi
  800b97:	ff d0                	callq  *%rax
  800b99:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b9d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ba1:	48 89 d6             	mov    %rdx,%rsi
  800ba4:	bf 78 00 00 00       	mov    $0x78,%edi
  800ba9:	ff d0                	callq  *%rax
  800bab:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bae:	83 f8 30             	cmp    $0x30,%eax
  800bb1:	73 17                	jae    800bca <vprintfmt+0x44b>
  800bb3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800bb7:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bba:	89 d2                	mov    %edx,%edx
  800bbc:	48 01 d0             	add    %rdx,%rax
  800bbf:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bc2:	83 c2 08             	add    $0x8,%edx
  800bc5:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bc8:	eb 0c                	jmp    800bd6 <vprintfmt+0x457>
  800bca:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800bce:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800bd2:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800bd6:	48 8b 00             	mov    (%rax),%rax
  800bd9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800bdd:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800be4:	eb 23                	jmp    800c09 <vprintfmt+0x48a>
  800be6:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800bea:	be 03 00 00 00       	mov    $0x3,%esi
  800bef:	48 89 c7             	mov    %rax,%rdi
  800bf2:	48 b8 71 05 80 00 00 	movabs $0x800571,%rax
  800bf9:	00 00 00 
  800bfc:	ff d0                	callq  *%rax
  800bfe:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c02:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800c09:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800c0e:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800c11:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800c14:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c18:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800c1c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c20:	45 89 c1             	mov    %r8d,%r9d
  800c23:	41 89 f8             	mov    %edi,%r8d
  800c26:	48 89 c7             	mov    %rax,%rdi
  800c29:	48 b8 b9 04 80 00 00 	movabs $0x8004b9,%rax
  800c30:	00 00 00 
  800c33:	ff d0                	callq  *%rax
  800c35:	eb 3f                	jmp    800c76 <vprintfmt+0x4f7>
  800c37:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c3b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c3f:	48 89 d6             	mov    %rdx,%rsi
  800c42:	89 df                	mov    %ebx,%edi
  800c44:	ff d0                	callq  *%rax
  800c46:	eb 2e                	jmp    800c76 <vprintfmt+0x4f7>
  800c48:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c4c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c50:	48 89 d6             	mov    %rdx,%rsi
  800c53:	bf 25 00 00 00       	mov    $0x25,%edi
  800c58:	ff d0                	callq  *%rax
  800c5a:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800c5f:	eb 05                	jmp    800c66 <vprintfmt+0x4e7>
  800c61:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800c66:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c6a:	48 83 e8 01          	sub    $0x1,%rax
  800c6e:	0f b6 00             	movzbl (%rax),%eax
  800c71:	3c 25                	cmp    $0x25,%al
  800c73:	75 ec                	jne    800c61 <vprintfmt+0x4e2>
  800c75:	90                   	nop
  800c76:	e9 3d fb ff ff       	jmpq   8007b8 <vprintfmt+0x39>
  800c7b:	90                   	nop
  800c7c:	48 83 c4 60          	add    $0x60,%rsp
  800c80:	5b                   	pop    %rbx
  800c81:	41 5c                	pop    %r12
  800c83:	5d                   	pop    %rbp
  800c84:	c3                   	retq   

0000000000800c85 <printfmt>:
  800c85:	55                   	push   %rbp
  800c86:	48 89 e5             	mov    %rsp,%rbp
  800c89:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800c90:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800c97:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800c9e:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800ca5:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800cac:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800cb3:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800cba:	84 c0                	test   %al,%al
  800cbc:	74 20                	je     800cde <printfmt+0x59>
  800cbe:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800cc2:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800cc6:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800cca:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800cce:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800cd2:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800cd6:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800cda:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800cde:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800ce5:	00 00 00 
  800ce8:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800cef:	00 00 00 
  800cf2:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800cf6:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800cfd:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800d04:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800d0b:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800d12:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800d19:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800d20:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800d27:	48 89 c7             	mov    %rax,%rdi
  800d2a:	48 b8 7f 07 80 00 00 	movabs $0x80077f,%rax
  800d31:	00 00 00 
  800d34:	ff d0                	callq  *%rax
  800d36:	90                   	nop
  800d37:	c9                   	leaveq 
  800d38:	c3                   	retq   

0000000000800d39 <sprintputch>:
  800d39:	55                   	push   %rbp
  800d3a:	48 89 e5             	mov    %rsp,%rbp
  800d3d:	48 83 ec 10          	sub    $0x10,%rsp
  800d41:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800d44:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800d48:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d4c:	8b 40 10             	mov    0x10(%rax),%eax
  800d4f:	8d 50 01             	lea    0x1(%rax),%edx
  800d52:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d56:	89 50 10             	mov    %edx,0x10(%rax)
  800d59:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d5d:	48 8b 10             	mov    (%rax),%rdx
  800d60:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d64:	48 8b 40 08          	mov    0x8(%rax),%rax
  800d68:	48 39 c2             	cmp    %rax,%rdx
  800d6b:	73 17                	jae    800d84 <sprintputch+0x4b>
  800d6d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d71:	48 8b 00             	mov    (%rax),%rax
  800d74:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800d78:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800d7c:	48 89 0a             	mov    %rcx,(%rdx)
  800d7f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800d82:	88 10                	mov    %dl,(%rax)
  800d84:	90                   	nop
  800d85:	c9                   	leaveq 
  800d86:	c3                   	retq   

0000000000800d87 <vsnprintf>:
  800d87:	55                   	push   %rbp
  800d88:	48 89 e5             	mov    %rsp,%rbp
  800d8b:	48 83 ec 50          	sub    $0x50,%rsp
  800d8f:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800d93:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800d96:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800d9a:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800d9e:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800da2:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800da6:	48 8b 0a             	mov    (%rdx),%rcx
  800da9:	48 89 08             	mov    %rcx,(%rax)
  800dac:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800db0:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800db4:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800db8:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800dbc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800dc0:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800dc4:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800dc7:	48 98                	cltq   
  800dc9:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800dcd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800dd1:	48 01 d0             	add    %rdx,%rax
  800dd4:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800dd8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800ddf:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800de4:	74 06                	je     800dec <vsnprintf+0x65>
  800de6:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800dea:	7f 07                	jg     800df3 <vsnprintf+0x6c>
  800dec:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800df1:	eb 2f                	jmp    800e22 <vsnprintf+0x9b>
  800df3:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800df7:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800dfb:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800dff:	48 89 c6             	mov    %rax,%rsi
  800e02:	48 bf 39 0d 80 00 00 	movabs $0x800d39,%rdi
  800e09:	00 00 00 
  800e0c:	48 b8 7f 07 80 00 00 	movabs $0x80077f,%rax
  800e13:	00 00 00 
  800e16:	ff d0                	callq  *%rax
  800e18:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800e1c:	c6 00 00             	movb   $0x0,(%rax)
  800e1f:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800e22:	c9                   	leaveq 
  800e23:	c3                   	retq   

0000000000800e24 <snprintf>:
  800e24:	55                   	push   %rbp
  800e25:	48 89 e5             	mov    %rsp,%rbp
  800e28:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800e2f:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800e36:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800e3c:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800e43:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800e4a:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800e51:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800e58:	84 c0                	test   %al,%al
  800e5a:	74 20                	je     800e7c <snprintf+0x58>
  800e5c:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800e60:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800e64:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800e68:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800e6c:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800e70:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800e74:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800e78:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800e7c:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800e83:	00 00 00 
  800e86:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800e8d:	00 00 00 
  800e90:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800e94:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800e9b:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800ea2:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800ea9:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800eb0:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800eb7:	48 8b 0a             	mov    (%rdx),%rcx
  800eba:	48 89 08             	mov    %rcx,(%rax)
  800ebd:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ec1:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ec5:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800ec9:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800ecd:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800ed4:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800edb:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800ee1:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800ee8:	48 89 c7             	mov    %rax,%rdi
  800eeb:	48 b8 87 0d 80 00 00 	movabs $0x800d87,%rax
  800ef2:	00 00 00 
  800ef5:	ff d0                	callq  *%rax
  800ef7:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800efd:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800f03:	c9                   	leaveq 
  800f04:	c3                   	retq   

0000000000800f05 <strlen>:
  800f05:	55                   	push   %rbp
  800f06:	48 89 e5             	mov    %rsp,%rbp
  800f09:	48 83 ec 18          	sub    $0x18,%rsp
  800f0d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f11:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800f18:	eb 09                	jmp    800f23 <strlen+0x1e>
  800f1a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800f1e:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800f23:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f27:	0f b6 00             	movzbl (%rax),%eax
  800f2a:	84 c0                	test   %al,%al
  800f2c:	75 ec                	jne    800f1a <strlen+0x15>
  800f2e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f31:	c9                   	leaveq 
  800f32:	c3                   	retq   

0000000000800f33 <strnlen>:
  800f33:	55                   	push   %rbp
  800f34:	48 89 e5             	mov    %rsp,%rbp
  800f37:	48 83 ec 20          	sub    $0x20,%rsp
  800f3b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f3f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f43:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800f4a:	eb 0e                	jmp    800f5a <strnlen+0x27>
  800f4c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800f50:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800f55:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  800f5a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800f5f:	74 0b                	je     800f6c <strnlen+0x39>
  800f61:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f65:	0f b6 00             	movzbl (%rax),%eax
  800f68:	84 c0                	test   %al,%al
  800f6a:	75 e0                	jne    800f4c <strnlen+0x19>
  800f6c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f6f:	c9                   	leaveq 
  800f70:	c3                   	retq   

0000000000800f71 <strcpy>:
  800f71:	55                   	push   %rbp
  800f72:	48 89 e5             	mov    %rsp,%rbp
  800f75:	48 83 ec 20          	sub    $0x20,%rsp
  800f79:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f7d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f81:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f85:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800f89:	90                   	nop
  800f8a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f8e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800f92:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800f96:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800f9a:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  800f9e:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  800fa2:	0f b6 12             	movzbl (%rdx),%edx
  800fa5:	88 10                	mov    %dl,(%rax)
  800fa7:	0f b6 00             	movzbl (%rax),%eax
  800faa:	84 c0                	test   %al,%al
  800fac:	75 dc                	jne    800f8a <strcpy+0x19>
  800fae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800fb2:	c9                   	leaveq 
  800fb3:	c3                   	retq   

0000000000800fb4 <strcat>:
  800fb4:	55                   	push   %rbp
  800fb5:	48 89 e5             	mov    %rsp,%rbp
  800fb8:	48 83 ec 20          	sub    $0x20,%rsp
  800fbc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fc0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800fc4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fc8:	48 89 c7             	mov    %rax,%rdi
  800fcb:	48 b8 05 0f 80 00 00 	movabs $0x800f05,%rax
  800fd2:	00 00 00 
  800fd5:	ff d0                	callq  *%rax
  800fd7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800fda:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800fdd:	48 63 d0             	movslq %eax,%rdx
  800fe0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fe4:	48 01 c2             	add    %rax,%rdx
  800fe7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800feb:	48 89 c6             	mov    %rax,%rsi
  800fee:	48 89 d7             	mov    %rdx,%rdi
  800ff1:	48 b8 71 0f 80 00 00 	movabs $0x800f71,%rax
  800ff8:	00 00 00 
  800ffb:	ff d0                	callq  *%rax
  800ffd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801001:	c9                   	leaveq 
  801002:	c3                   	retq   

0000000000801003 <strncpy>:
  801003:	55                   	push   %rbp
  801004:	48 89 e5             	mov    %rsp,%rbp
  801007:	48 83 ec 28          	sub    $0x28,%rsp
  80100b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80100f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801013:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801017:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80101b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80101f:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801026:	00 
  801027:	eb 2a                	jmp    801053 <strncpy+0x50>
  801029:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80102d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801031:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801035:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801039:	0f b6 12             	movzbl (%rdx),%edx
  80103c:	88 10                	mov    %dl,(%rax)
  80103e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801042:	0f b6 00             	movzbl (%rax),%eax
  801045:	84 c0                	test   %al,%al
  801047:	74 05                	je     80104e <strncpy+0x4b>
  801049:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  80104e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801053:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801057:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80105b:	72 cc                	jb     801029 <strncpy+0x26>
  80105d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801061:	c9                   	leaveq 
  801062:	c3                   	retq   

0000000000801063 <strlcpy>:
  801063:	55                   	push   %rbp
  801064:	48 89 e5             	mov    %rsp,%rbp
  801067:	48 83 ec 28          	sub    $0x28,%rsp
  80106b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80106f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801073:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801077:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80107b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80107f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801084:	74 3d                	je     8010c3 <strlcpy+0x60>
  801086:	eb 1d                	jmp    8010a5 <strlcpy+0x42>
  801088:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80108c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801090:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801094:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801098:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80109c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8010a0:	0f b6 12             	movzbl (%rdx),%edx
  8010a3:	88 10                	mov    %dl,(%rax)
  8010a5:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8010aa:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8010af:	74 0b                	je     8010bc <strlcpy+0x59>
  8010b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8010b5:	0f b6 00             	movzbl (%rax),%eax
  8010b8:	84 c0                	test   %al,%al
  8010ba:	75 cc                	jne    801088 <strlcpy+0x25>
  8010bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010c0:	c6 00 00             	movb   $0x0,(%rax)
  8010c3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010cb:	48 29 c2             	sub    %rax,%rdx
  8010ce:	48 89 d0             	mov    %rdx,%rax
  8010d1:	c9                   	leaveq 
  8010d2:	c3                   	retq   

00000000008010d3 <strcmp>:
  8010d3:	55                   	push   %rbp
  8010d4:	48 89 e5             	mov    %rsp,%rbp
  8010d7:	48 83 ec 10          	sub    $0x10,%rsp
  8010db:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8010df:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8010e3:	eb 0a                	jmp    8010ef <strcmp+0x1c>
  8010e5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8010ea:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8010ef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010f3:	0f b6 00             	movzbl (%rax),%eax
  8010f6:	84 c0                	test   %al,%al
  8010f8:	74 12                	je     80110c <strcmp+0x39>
  8010fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010fe:	0f b6 10             	movzbl (%rax),%edx
  801101:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801105:	0f b6 00             	movzbl (%rax),%eax
  801108:	38 c2                	cmp    %al,%dl
  80110a:	74 d9                	je     8010e5 <strcmp+0x12>
  80110c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801110:	0f b6 00             	movzbl (%rax),%eax
  801113:	0f b6 d0             	movzbl %al,%edx
  801116:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80111a:	0f b6 00             	movzbl (%rax),%eax
  80111d:	0f b6 c0             	movzbl %al,%eax
  801120:	29 c2                	sub    %eax,%edx
  801122:	89 d0                	mov    %edx,%eax
  801124:	c9                   	leaveq 
  801125:	c3                   	retq   

0000000000801126 <strncmp>:
  801126:	55                   	push   %rbp
  801127:	48 89 e5             	mov    %rsp,%rbp
  80112a:	48 83 ec 18          	sub    $0x18,%rsp
  80112e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801132:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801136:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80113a:	eb 0f                	jmp    80114b <strncmp+0x25>
  80113c:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801141:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801146:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80114b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801150:	74 1d                	je     80116f <strncmp+0x49>
  801152:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801156:	0f b6 00             	movzbl (%rax),%eax
  801159:	84 c0                	test   %al,%al
  80115b:	74 12                	je     80116f <strncmp+0x49>
  80115d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801161:	0f b6 10             	movzbl (%rax),%edx
  801164:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801168:	0f b6 00             	movzbl (%rax),%eax
  80116b:	38 c2                	cmp    %al,%dl
  80116d:	74 cd                	je     80113c <strncmp+0x16>
  80116f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801174:	75 07                	jne    80117d <strncmp+0x57>
  801176:	b8 00 00 00 00       	mov    $0x0,%eax
  80117b:	eb 18                	jmp    801195 <strncmp+0x6f>
  80117d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801181:	0f b6 00             	movzbl (%rax),%eax
  801184:	0f b6 d0             	movzbl %al,%edx
  801187:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80118b:	0f b6 00             	movzbl (%rax),%eax
  80118e:	0f b6 c0             	movzbl %al,%eax
  801191:	29 c2                	sub    %eax,%edx
  801193:	89 d0                	mov    %edx,%eax
  801195:	c9                   	leaveq 
  801196:	c3                   	retq   

0000000000801197 <strchr>:
  801197:	55                   	push   %rbp
  801198:	48 89 e5             	mov    %rsp,%rbp
  80119b:	48 83 ec 10          	sub    $0x10,%rsp
  80119f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011a3:	89 f0                	mov    %esi,%eax
  8011a5:	88 45 f4             	mov    %al,-0xc(%rbp)
  8011a8:	eb 17                	jmp    8011c1 <strchr+0x2a>
  8011aa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011ae:	0f b6 00             	movzbl (%rax),%eax
  8011b1:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8011b4:	75 06                	jne    8011bc <strchr+0x25>
  8011b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011ba:	eb 15                	jmp    8011d1 <strchr+0x3a>
  8011bc:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011c5:	0f b6 00             	movzbl (%rax),%eax
  8011c8:	84 c0                	test   %al,%al
  8011ca:	75 de                	jne    8011aa <strchr+0x13>
  8011cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8011d1:	c9                   	leaveq 
  8011d2:	c3                   	retq   

00000000008011d3 <strfind>:
  8011d3:	55                   	push   %rbp
  8011d4:	48 89 e5             	mov    %rsp,%rbp
  8011d7:	48 83 ec 10          	sub    $0x10,%rsp
  8011db:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011df:	89 f0                	mov    %esi,%eax
  8011e1:	88 45 f4             	mov    %al,-0xc(%rbp)
  8011e4:	eb 11                	jmp    8011f7 <strfind+0x24>
  8011e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011ea:	0f b6 00             	movzbl (%rax),%eax
  8011ed:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8011f0:	74 12                	je     801204 <strfind+0x31>
  8011f2:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011fb:	0f b6 00             	movzbl (%rax),%eax
  8011fe:	84 c0                	test   %al,%al
  801200:	75 e4                	jne    8011e6 <strfind+0x13>
  801202:	eb 01                	jmp    801205 <strfind+0x32>
  801204:	90                   	nop
  801205:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801209:	c9                   	leaveq 
  80120a:	c3                   	retq   

000000000080120b <memset>:
  80120b:	55                   	push   %rbp
  80120c:	48 89 e5             	mov    %rsp,%rbp
  80120f:	48 83 ec 18          	sub    $0x18,%rsp
  801213:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801217:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80121a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80121e:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801223:	75 06                	jne    80122b <memset+0x20>
  801225:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801229:	eb 69                	jmp    801294 <memset+0x89>
  80122b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80122f:	83 e0 03             	and    $0x3,%eax
  801232:	48 85 c0             	test   %rax,%rax
  801235:	75 48                	jne    80127f <memset+0x74>
  801237:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80123b:	83 e0 03             	and    $0x3,%eax
  80123e:	48 85 c0             	test   %rax,%rax
  801241:	75 3c                	jne    80127f <memset+0x74>
  801243:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  80124a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80124d:	c1 e0 18             	shl    $0x18,%eax
  801250:	89 c2                	mov    %eax,%edx
  801252:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801255:	c1 e0 10             	shl    $0x10,%eax
  801258:	09 c2                	or     %eax,%edx
  80125a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80125d:	c1 e0 08             	shl    $0x8,%eax
  801260:	09 d0                	or     %edx,%eax
  801262:	09 45 f4             	or     %eax,-0xc(%rbp)
  801265:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801269:	48 c1 e8 02          	shr    $0x2,%rax
  80126d:	48 89 c1             	mov    %rax,%rcx
  801270:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801274:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801277:	48 89 d7             	mov    %rdx,%rdi
  80127a:	fc                   	cld    
  80127b:	f3 ab                	rep stos %eax,%es:(%rdi)
  80127d:	eb 11                	jmp    801290 <memset+0x85>
  80127f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801283:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801286:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80128a:	48 89 d7             	mov    %rdx,%rdi
  80128d:	fc                   	cld    
  80128e:	f3 aa                	rep stos %al,%es:(%rdi)
  801290:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801294:	c9                   	leaveq 
  801295:	c3                   	retq   

0000000000801296 <memmove>:
  801296:	55                   	push   %rbp
  801297:	48 89 e5             	mov    %rsp,%rbp
  80129a:	48 83 ec 28          	sub    $0x28,%rsp
  80129e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8012a2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8012a6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8012aa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8012ae:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8012b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012b6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8012ba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012be:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8012c2:	0f 83 88 00 00 00    	jae    801350 <memmove+0xba>
  8012c8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8012cc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012d0:	48 01 d0             	add    %rdx,%rax
  8012d3:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8012d7:	76 77                	jbe    801350 <memmove+0xba>
  8012d9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012dd:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8012e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012e5:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8012e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ed:	83 e0 03             	and    $0x3,%eax
  8012f0:	48 85 c0             	test   %rax,%rax
  8012f3:	75 3b                	jne    801330 <memmove+0x9a>
  8012f5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012f9:	83 e0 03             	and    $0x3,%eax
  8012fc:	48 85 c0             	test   %rax,%rax
  8012ff:	75 2f                	jne    801330 <memmove+0x9a>
  801301:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801305:	83 e0 03             	and    $0x3,%eax
  801308:	48 85 c0             	test   %rax,%rax
  80130b:	75 23                	jne    801330 <memmove+0x9a>
  80130d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801311:	48 83 e8 04          	sub    $0x4,%rax
  801315:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801319:	48 83 ea 04          	sub    $0x4,%rdx
  80131d:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801321:	48 c1 e9 02          	shr    $0x2,%rcx
  801325:	48 89 c7             	mov    %rax,%rdi
  801328:	48 89 d6             	mov    %rdx,%rsi
  80132b:	fd                   	std    
  80132c:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80132e:	eb 1d                	jmp    80134d <memmove+0xb7>
  801330:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801334:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801338:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80133c:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801340:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801344:	48 89 d7             	mov    %rdx,%rdi
  801347:	48 89 c1             	mov    %rax,%rcx
  80134a:	fd                   	std    
  80134b:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80134d:	fc                   	cld    
  80134e:	eb 57                	jmp    8013a7 <memmove+0x111>
  801350:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801354:	83 e0 03             	and    $0x3,%eax
  801357:	48 85 c0             	test   %rax,%rax
  80135a:	75 36                	jne    801392 <memmove+0xfc>
  80135c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801360:	83 e0 03             	and    $0x3,%eax
  801363:	48 85 c0             	test   %rax,%rax
  801366:	75 2a                	jne    801392 <memmove+0xfc>
  801368:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80136c:	83 e0 03             	and    $0x3,%eax
  80136f:	48 85 c0             	test   %rax,%rax
  801372:	75 1e                	jne    801392 <memmove+0xfc>
  801374:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801378:	48 c1 e8 02          	shr    $0x2,%rax
  80137c:	48 89 c1             	mov    %rax,%rcx
  80137f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801383:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801387:	48 89 c7             	mov    %rax,%rdi
  80138a:	48 89 d6             	mov    %rdx,%rsi
  80138d:	fc                   	cld    
  80138e:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801390:	eb 15                	jmp    8013a7 <memmove+0x111>
  801392:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801396:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80139a:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80139e:	48 89 c7             	mov    %rax,%rdi
  8013a1:	48 89 d6             	mov    %rdx,%rsi
  8013a4:	fc                   	cld    
  8013a5:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8013a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013ab:	c9                   	leaveq 
  8013ac:	c3                   	retq   

00000000008013ad <memcpy>:
  8013ad:	55                   	push   %rbp
  8013ae:	48 89 e5             	mov    %rsp,%rbp
  8013b1:	48 83 ec 18          	sub    $0x18,%rsp
  8013b5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013b9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8013bd:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013c1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8013c5:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8013c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013cd:	48 89 ce             	mov    %rcx,%rsi
  8013d0:	48 89 c7             	mov    %rax,%rdi
  8013d3:	48 b8 96 12 80 00 00 	movabs $0x801296,%rax
  8013da:	00 00 00 
  8013dd:	ff d0                	callq  *%rax
  8013df:	c9                   	leaveq 
  8013e0:	c3                   	retq   

00000000008013e1 <memcmp>:
  8013e1:	55                   	push   %rbp
  8013e2:	48 89 e5             	mov    %rsp,%rbp
  8013e5:	48 83 ec 28          	sub    $0x28,%rsp
  8013e9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013ed:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013f1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013f9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013fd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801401:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801405:	eb 36                	jmp    80143d <memcmp+0x5c>
  801407:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80140b:	0f b6 10             	movzbl (%rax),%edx
  80140e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801412:	0f b6 00             	movzbl (%rax),%eax
  801415:	38 c2                	cmp    %al,%dl
  801417:	74 1a                	je     801433 <memcmp+0x52>
  801419:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80141d:	0f b6 00             	movzbl (%rax),%eax
  801420:	0f b6 d0             	movzbl %al,%edx
  801423:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801427:	0f b6 00             	movzbl (%rax),%eax
  80142a:	0f b6 c0             	movzbl %al,%eax
  80142d:	29 c2                	sub    %eax,%edx
  80142f:	89 d0                	mov    %edx,%eax
  801431:	eb 20                	jmp    801453 <memcmp+0x72>
  801433:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801438:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80143d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801441:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801445:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801449:	48 85 c0             	test   %rax,%rax
  80144c:	75 b9                	jne    801407 <memcmp+0x26>
  80144e:	b8 00 00 00 00       	mov    $0x0,%eax
  801453:	c9                   	leaveq 
  801454:	c3                   	retq   

0000000000801455 <memfind>:
  801455:	55                   	push   %rbp
  801456:	48 89 e5             	mov    %rsp,%rbp
  801459:	48 83 ec 28          	sub    $0x28,%rsp
  80145d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801461:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801464:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801468:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80146c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801470:	48 01 d0             	add    %rdx,%rax
  801473:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801477:	eb 13                	jmp    80148c <memfind+0x37>
  801479:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80147d:	0f b6 00             	movzbl (%rax),%eax
  801480:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801483:	38 d0                	cmp    %dl,%al
  801485:	74 11                	je     801498 <memfind+0x43>
  801487:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80148c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801490:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801494:	72 e3                	jb     801479 <memfind+0x24>
  801496:	eb 01                	jmp    801499 <memfind+0x44>
  801498:	90                   	nop
  801499:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80149d:	c9                   	leaveq 
  80149e:	c3                   	retq   

000000000080149f <strtol>:
  80149f:	55                   	push   %rbp
  8014a0:	48 89 e5             	mov    %rsp,%rbp
  8014a3:	48 83 ec 38          	sub    $0x38,%rsp
  8014a7:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8014ab:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8014af:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8014b2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8014b9:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8014c0:	00 
  8014c1:	eb 05                	jmp    8014c8 <strtol+0x29>
  8014c3:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8014c8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014cc:	0f b6 00             	movzbl (%rax),%eax
  8014cf:	3c 20                	cmp    $0x20,%al
  8014d1:	74 f0                	je     8014c3 <strtol+0x24>
  8014d3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014d7:	0f b6 00             	movzbl (%rax),%eax
  8014da:	3c 09                	cmp    $0x9,%al
  8014dc:	74 e5                	je     8014c3 <strtol+0x24>
  8014de:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014e2:	0f b6 00             	movzbl (%rax),%eax
  8014e5:	3c 2b                	cmp    $0x2b,%al
  8014e7:	75 07                	jne    8014f0 <strtol+0x51>
  8014e9:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8014ee:	eb 17                	jmp    801507 <strtol+0x68>
  8014f0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014f4:	0f b6 00             	movzbl (%rax),%eax
  8014f7:	3c 2d                	cmp    $0x2d,%al
  8014f9:	75 0c                	jne    801507 <strtol+0x68>
  8014fb:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801500:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801507:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80150b:	74 06                	je     801513 <strtol+0x74>
  80150d:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801511:	75 28                	jne    80153b <strtol+0x9c>
  801513:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801517:	0f b6 00             	movzbl (%rax),%eax
  80151a:	3c 30                	cmp    $0x30,%al
  80151c:	75 1d                	jne    80153b <strtol+0x9c>
  80151e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801522:	48 83 c0 01          	add    $0x1,%rax
  801526:	0f b6 00             	movzbl (%rax),%eax
  801529:	3c 78                	cmp    $0x78,%al
  80152b:	75 0e                	jne    80153b <strtol+0x9c>
  80152d:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801532:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801539:	eb 2c                	jmp    801567 <strtol+0xc8>
  80153b:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80153f:	75 19                	jne    80155a <strtol+0xbb>
  801541:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801545:	0f b6 00             	movzbl (%rax),%eax
  801548:	3c 30                	cmp    $0x30,%al
  80154a:	75 0e                	jne    80155a <strtol+0xbb>
  80154c:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801551:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801558:	eb 0d                	jmp    801567 <strtol+0xc8>
  80155a:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80155e:	75 07                	jne    801567 <strtol+0xc8>
  801560:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801567:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80156b:	0f b6 00             	movzbl (%rax),%eax
  80156e:	3c 2f                	cmp    $0x2f,%al
  801570:	7e 1d                	jle    80158f <strtol+0xf0>
  801572:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801576:	0f b6 00             	movzbl (%rax),%eax
  801579:	3c 39                	cmp    $0x39,%al
  80157b:	7f 12                	jg     80158f <strtol+0xf0>
  80157d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801581:	0f b6 00             	movzbl (%rax),%eax
  801584:	0f be c0             	movsbl %al,%eax
  801587:	83 e8 30             	sub    $0x30,%eax
  80158a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80158d:	eb 4e                	jmp    8015dd <strtol+0x13e>
  80158f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801593:	0f b6 00             	movzbl (%rax),%eax
  801596:	3c 60                	cmp    $0x60,%al
  801598:	7e 1d                	jle    8015b7 <strtol+0x118>
  80159a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80159e:	0f b6 00             	movzbl (%rax),%eax
  8015a1:	3c 7a                	cmp    $0x7a,%al
  8015a3:	7f 12                	jg     8015b7 <strtol+0x118>
  8015a5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015a9:	0f b6 00             	movzbl (%rax),%eax
  8015ac:	0f be c0             	movsbl %al,%eax
  8015af:	83 e8 57             	sub    $0x57,%eax
  8015b2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8015b5:	eb 26                	jmp    8015dd <strtol+0x13e>
  8015b7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015bb:	0f b6 00             	movzbl (%rax),%eax
  8015be:	3c 40                	cmp    $0x40,%al
  8015c0:	7e 47                	jle    801609 <strtol+0x16a>
  8015c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015c6:	0f b6 00             	movzbl (%rax),%eax
  8015c9:	3c 5a                	cmp    $0x5a,%al
  8015cb:	7f 3c                	jg     801609 <strtol+0x16a>
  8015cd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015d1:	0f b6 00             	movzbl (%rax),%eax
  8015d4:	0f be c0             	movsbl %al,%eax
  8015d7:	83 e8 37             	sub    $0x37,%eax
  8015da:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8015dd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8015e0:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8015e3:	7d 23                	jge    801608 <strtol+0x169>
  8015e5:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015ea:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8015ed:	48 98                	cltq   
  8015ef:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8015f4:	48 89 c2             	mov    %rax,%rdx
  8015f7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8015fa:	48 98                	cltq   
  8015fc:	48 01 d0             	add    %rdx,%rax
  8015ff:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801603:	e9 5f ff ff ff       	jmpq   801567 <strtol+0xc8>
  801608:	90                   	nop
  801609:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  80160e:	74 0b                	je     80161b <strtol+0x17c>
  801610:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801614:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801618:	48 89 10             	mov    %rdx,(%rax)
  80161b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80161f:	74 09                	je     80162a <strtol+0x18b>
  801621:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801625:	48 f7 d8             	neg    %rax
  801628:	eb 04                	jmp    80162e <strtol+0x18f>
  80162a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80162e:	c9                   	leaveq 
  80162f:	c3                   	retq   

0000000000801630 <strstr>:
  801630:	55                   	push   %rbp
  801631:	48 89 e5             	mov    %rsp,%rbp
  801634:	48 83 ec 30          	sub    $0x30,%rsp
  801638:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80163c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801640:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801644:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801648:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80164c:	0f b6 00             	movzbl (%rax),%eax
  80164f:	88 45 ff             	mov    %al,-0x1(%rbp)
  801652:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801656:	75 06                	jne    80165e <strstr+0x2e>
  801658:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80165c:	eb 6b                	jmp    8016c9 <strstr+0x99>
  80165e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801662:	48 89 c7             	mov    %rax,%rdi
  801665:	48 b8 05 0f 80 00 00 	movabs $0x800f05,%rax
  80166c:	00 00 00 
  80166f:	ff d0                	callq  *%rax
  801671:	48 98                	cltq   
  801673:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801677:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80167b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80167f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801683:	0f b6 00             	movzbl (%rax),%eax
  801686:	88 45 ef             	mov    %al,-0x11(%rbp)
  801689:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  80168d:	75 07                	jne    801696 <strstr+0x66>
  80168f:	b8 00 00 00 00       	mov    $0x0,%eax
  801694:	eb 33                	jmp    8016c9 <strstr+0x99>
  801696:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  80169a:	3a 45 ff             	cmp    -0x1(%rbp),%al
  80169d:	75 d8                	jne    801677 <strstr+0x47>
  80169f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8016a3:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8016a7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ab:	48 89 ce             	mov    %rcx,%rsi
  8016ae:	48 89 c7             	mov    %rax,%rdi
  8016b1:	48 b8 26 11 80 00 00 	movabs $0x801126,%rax
  8016b8:	00 00 00 
  8016bb:	ff d0                	callq  *%rax
  8016bd:	85 c0                	test   %eax,%eax
  8016bf:	75 b6                	jne    801677 <strstr+0x47>
  8016c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016c5:	48 83 e8 01          	sub    $0x1,%rax
  8016c9:	c9                   	leaveq 
  8016ca:	c3                   	retq   

00000000008016cb <syscall>:
  8016cb:	55                   	push   %rbp
  8016cc:	48 89 e5             	mov    %rsp,%rbp
  8016cf:	53                   	push   %rbx
  8016d0:	48 83 ec 48          	sub    $0x48,%rsp
  8016d4:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8016d7:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8016da:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8016de:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8016e2:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8016e6:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8016ea:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8016ed:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8016f1:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8016f5:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8016f9:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8016fd:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801701:	4c 89 c3             	mov    %r8,%rbx
  801704:	cd 30                	int    $0x30
  801706:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80170a:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  80170e:	74 3e                	je     80174e <syscall+0x83>
  801710:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801715:	7e 37                	jle    80174e <syscall+0x83>
  801717:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80171b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80171e:	49 89 d0             	mov    %rdx,%r8
  801721:	89 c1                	mov    %eax,%ecx
  801723:	48 ba 48 47 80 00 00 	movabs $0x804748,%rdx
  80172a:	00 00 00 
  80172d:	be 24 00 00 00       	mov    $0x24,%esi
  801732:	48 bf 65 47 80 00 00 	movabs $0x804765,%rdi
  801739:	00 00 00 
  80173c:	b8 00 00 00 00       	mov    $0x0,%eax
  801741:	49 b9 e1 3d 80 00 00 	movabs $0x803de1,%r9
  801748:	00 00 00 
  80174b:	41 ff d1             	callq  *%r9
  80174e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801752:	48 83 c4 48          	add    $0x48,%rsp
  801756:	5b                   	pop    %rbx
  801757:	5d                   	pop    %rbp
  801758:	c3                   	retq   

0000000000801759 <sys_cputs>:
  801759:	55                   	push   %rbp
  80175a:	48 89 e5             	mov    %rsp,%rbp
  80175d:	48 83 ec 10          	sub    $0x10,%rsp
  801761:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801765:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801769:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80176d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801771:	48 83 ec 08          	sub    $0x8,%rsp
  801775:	6a 00                	pushq  $0x0
  801777:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80177d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801783:	48 89 d1             	mov    %rdx,%rcx
  801786:	48 89 c2             	mov    %rax,%rdx
  801789:	be 00 00 00 00       	mov    $0x0,%esi
  80178e:	bf 00 00 00 00       	mov    $0x0,%edi
  801793:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  80179a:	00 00 00 
  80179d:	ff d0                	callq  *%rax
  80179f:	48 83 c4 10          	add    $0x10,%rsp
  8017a3:	90                   	nop
  8017a4:	c9                   	leaveq 
  8017a5:	c3                   	retq   

00000000008017a6 <sys_cgetc>:
  8017a6:	55                   	push   %rbp
  8017a7:	48 89 e5             	mov    %rsp,%rbp
  8017aa:	48 83 ec 08          	sub    $0x8,%rsp
  8017ae:	6a 00                	pushq  $0x0
  8017b0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8017b6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8017bc:	b9 00 00 00 00       	mov    $0x0,%ecx
  8017c1:	ba 00 00 00 00       	mov    $0x0,%edx
  8017c6:	be 00 00 00 00       	mov    $0x0,%esi
  8017cb:	bf 01 00 00 00       	mov    $0x1,%edi
  8017d0:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  8017d7:	00 00 00 
  8017da:	ff d0                	callq  *%rax
  8017dc:	48 83 c4 10          	add    $0x10,%rsp
  8017e0:	c9                   	leaveq 
  8017e1:	c3                   	retq   

00000000008017e2 <sys_env_destroy>:
  8017e2:	55                   	push   %rbp
  8017e3:	48 89 e5             	mov    %rsp,%rbp
  8017e6:	48 83 ec 10          	sub    $0x10,%rsp
  8017ea:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8017ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8017f0:	48 98                	cltq   
  8017f2:	48 83 ec 08          	sub    $0x8,%rsp
  8017f6:	6a 00                	pushq  $0x0
  8017f8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8017fe:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801804:	b9 00 00 00 00       	mov    $0x0,%ecx
  801809:	48 89 c2             	mov    %rax,%rdx
  80180c:	be 01 00 00 00       	mov    $0x1,%esi
  801811:	bf 03 00 00 00       	mov    $0x3,%edi
  801816:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  80181d:	00 00 00 
  801820:	ff d0                	callq  *%rax
  801822:	48 83 c4 10          	add    $0x10,%rsp
  801826:	c9                   	leaveq 
  801827:	c3                   	retq   

0000000000801828 <sys_getenvid>:
  801828:	55                   	push   %rbp
  801829:	48 89 e5             	mov    %rsp,%rbp
  80182c:	48 83 ec 08          	sub    $0x8,%rsp
  801830:	6a 00                	pushq  $0x0
  801832:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801838:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80183e:	b9 00 00 00 00       	mov    $0x0,%ecx
  801843:	ba 00 00 00 00       	mov    $0x0,%edx
  801848:	be 00 00 00 00       	mov    $0x0,%esi
  80184d:	bf 02 00 00 00       	mov    $0x2,%edi
  801852:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  801859:	00 00 00 
  80185c:	ff d0                	callq  *%rax
  80185e:	48 83 c4 10          	add    $0x10,%rsp
  801862:	c9                   	leaveq 
  801863:	c3                   	retq   

0000000000801864 <sys_yield>:
  801864:	55                   	push   %rbp
  801865:	48 89 e5             	mov    %rsp,%rbp
  801868:	48 83 ec 08          	sub    $0x8,%rsp
  80186c:	6a 00                	pushq  $0x0
  80186e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801874:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80187a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80187f:	ba 00 00 00 00       	mov    $0x0,%edx
  801884:	be 00 00 00 00       	mov    $0x0,%esi
  801889:	bf 0b 00 00 00       	mov    $0xb,%edi
  80188e:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  801895:	00 00 00 
  801898:	ff d0                	callq  *%rax
  80189a:	48 83 c4 10          	add    $0x10,%rsp
  80189e:	90                   	nop
  80189f:	c9                   	leaveq 
  8018a0:	c3                   	retq   

00000000008018a1 <sys_page_alloc>:
  8018a1:	55                   	push   %rbp
  8018a2:	48 89 e5             	mov    %rsp,%rbp
  8018a5:	48 83 ec 10          	sub    $0x10,%rsp
  8018a9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018ac:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018b0:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8018b3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8018b6:	48 63 c8             	movslq %eax,%rcx
  8018b9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018c0:	48 98                	cltq   
  8018c2:	48 83 ec 08          	sub    $0x8,%rsp
  8018c6:	6a 00                	pushq  $0x0
  8018c8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018ce:	49 89 c8             	mov    %rcx,%r8
  8018d1:	48 89 d1             	mov    %rdx,%rcx
  8018d4:	48 89 c2             	mov    %rax,%rdx
  8018d7:	be 01 00 00 00       	mov    $0x1,%esi
  8018dc:	bf 04 00 00 00       	mov    $0x4,%edi
  8018e1:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  8018e8:	00 00 00 
  8018eb:	ff d0                	callq  *%rax
  8018ed:	48 83 c4 10          	add    $0x10,%rsp
  8018f1:	c9                   	leaveq 
  8018f2:	c3                   	retq   

00000000008018f3 <sys_page_map>:
  8018f3:	55                   	push   %rbp
  8018f4:	48 89 e5             	mov    %rsp,%rbp
  8018f7:	48 83 ec 20          	sub    $0x20,%rsp
  8018fb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018fe:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801902:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801905:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801909:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  80190d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801910:	48 63 c8             	movslq %eax,%rcx
  801913:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801917:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80191a:	48 63 f0             	movslq %eax,%rsi
  80191d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801921:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801924:	48 98                	cltq   
  801926:	48 83 ec 08          	sub    $0x8,%rsp
  80192a:	51                   	push   %rcx
  80192b:	49 89 f9             	mov    %rdi,%r9
  80192e:	49 89 f0             	mov    %rsi,%r8
  801931:	48 89 d1             	mov    %rdx,%rcx
  801934:	48 89 c2             	mov    %rax,%rdx
  801937:	be 01 00 00 00       	mov    $0x1,%esi
  80193c:	bf 05 00 00 00       	mov    $0x5,%edi
  801941:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  801948:	00 00 00 
  80194b:	ff d0                	callq  *%rax
  80194d:	48 83 c4 10          	add    $0x10,%rsp
  801951:	c9                   	leaveq 
  801952:	c3                   	retq   

0000000000801953 <sys_page_unmap>:
  801953:	55                   	push   %rbp
  801954:	48 89 e5             	mov    %rsp,%rbp
  801957:	48 83 ec 10          	sub    $0x10,%rsp
  80195b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80195e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801962:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801966:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801969:	48 98                	cltq   
  80196b:	48 83 ec 08          	sub    $0x8,%rsp
  80196f:	6a 00                	pushq  $0x0
  801971:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801977:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80197d:	48 89 d1             	mov    %rdx,%rcx
  801980:	48 89 c2             	mov    %rax,%rdx
  801983:	be 01 00 00 00       	mov    $0x1,%esi
  801988:	bf 06 00 00 00       	mov    $0x6,%edi
  80198d:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  801994:	00 00 00 
  801997:	ff d0                	callq  *%rax
  801999:	48 83 c4 10          	add    $0x10,%rsp
  80199d:	c9                   	leaveq 
  80199e:	c3                   	retq   

000000000080199f <sys_env_set_status>:
  80199f:	55                   	push   %rbp
  8019a0:	48 89 e5             	mov    %rsp,%rbp
  8019a3:	48 83 ec 10          	sub    $0x10,%rsp
  8019a7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019aa:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8019ad:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8019b0:	48 63 d0             	movslq %eax,%rdx
  8019b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019b6:	48 98                	cltq   
  8019b8:	48 83 ec 08          	sub    $0x8,%rsp
  8019bc:	6a 00                	pushq  $0x0
  8019be:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019c4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019ca:	48 89 d1             	mov    %rdx,%rcx
  8019cd:	48 89 c2             	mov    %rax,%rdx
  8019d0:	be 01 00 00 00       	mov    $0x1,%esi
  8019d5:	bf 08 00 00 00       	mov    $0x8,%edi
  8019da:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  8019e1:	00 00 00 
  8019e4:	ff d0                	callq  *%rax
  8019e6:	48 83 c4 10          	add    $0x10,%rsp
  8019ea:	c9                   	leaveq 
  8019eb:	c3                   	retq   

00000000008019ec <sys_env_set_trapframe>:
  8019ec:	55                   	push   %rbp
  8019ed:	48 89 e5             	mov    %rsp,%rbp
  8019f0:	48 83 ec 10          	sub    $0x10,%rsp
  8019f4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019f7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019fb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a02:	48 98                	cltq   
  801a04:	48 83 ec 08          	sub    $0x8,%rsp
  801a08:	6a 00                	pushq  $0x0
  801a0a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a10:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a16:	48 89 d1             	mov    %rdx,%rcx
  801a19:	48 89 c2             	mov    %rax,%rdx
  801a1c:	be 01 00 00 00       	mov    $0x1,%esi
  801a21:	bf 09 00 00 00       	mov    $0x9,%edi
  801a26:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  801a2d:	00 00 00 
  801a30:	ff d0                	callq  *%rax
  801a32:	48 83 c4 10          	add    $0x10,%rsp
  801a36:	c9                   	leaveq 
  801a37:	c3                   	retq   

0000000000801a38 <sys_env_set_pgfault_upcall>:
  801a38:	55                   	push   %rbp
  801a39:	48 89 e5             	mov    %rsp,%rbp
  801a3c:	48 83 ec 10          	sub    $0x10,%rsp
  801a40:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a43:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a47:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a4b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a4e:	48 98                	cltq   
  801a50:	48 83 ec 08          	sub    $0x8,%rsp
  801a54:	6a 00                	pushq  $0x0
  801a56:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a5c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a62:	48 89 d1             	mov    %rdx,%rcx
  801a65:	48 89 c2             	mov    %rax,%rdx
  801a68:	be 01 00 00 00       	mov    $0x1,%esi
  801a6d:	bf 0a 00 00 00       	mov    $0xa,%edi
  801a72:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  801a79:	00 00 00 
  801a7c:	ff d0                	callq  *%rax
  801a7e:	48 83 c4 10          	add    $0x10,%rsp
  801a82:	c9                   	leaveq 
  801a83:	c3                   	retq   

0000000000801a84 <sys_ipc_try_send>:
  801a84:	55                   	push   %rbp
  801a85:	48 89 e5             	mov    %rsp,%rbp
  801a88:	48 83 ec 20          	sub    $0x20,%rsp
  801a8c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a8f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a93:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801a97:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801a9a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a9d:	48 63 f0             	movslq %eax,%rsi
  801aa0:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801aa4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801aa7:	48 98                	cltq   
  801aa9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801aad:	48 83 ec 08          	sub    $0x8,%rsp
  801ab1:	6a 00                	pushq  $0x0
  801ab3:	49 89 f1             	mov    %rsi,%r9
  801ab6:	49 89 c8             	mov    %rcx,%r8
  801ab9:	48 89 d1             	mov    %rdx,%rcx
  801abc:	48 89 c2             	mov    %rax,%rdx
  801abf:	be 00 00 00 00       	mov    $0x0,%esi
  801ac4:	bf 0c 00 00 00       	mov    $0xc,%edi
  801ac9:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  801ad0:	00 00 00 
  801ad3:	ff d0                	callq  *%rax
  801ad5:	48 83 c4 10          	add    $0x10,%rsp
  801ad9:	c9                   	leaveq 
  801ada:	c3                   	retq   

0000000000801adb <sys_ipc_recv>:
  801adb:	55                   	push   %rbp
  801adc:	48 89 e5             	mov    %rsp,%rbp
  801adf:	48 83 ec 10          	sub    $0x10,%rsp
  801ae3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ae7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801aeb:	48 83 ec 08          	sub    $0x8,%rsp
  801aef:	6a 00                	pushq  $0x0
  801af1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801af7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801afd:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b02:	48 89 c2             	mov    %rax,%rdx
  801b05:	be 01 00 00 00       	mov    $0x1,%esi
  801b0a:	bf 0d 00 00 00       	mov    $0xd,%edi
  801b0f:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  801b16:	00 00 00 
  801b19:	ff d0                	callq  *%rax
  801b1b:	48 83 c4 10          	add    $0x10,%rsp
  801b1f:	c9                   	leaveq 
  801b20:	c3                   	retq   

0000000000801b21 <sys_time_msec>:
  801b21:	55                   	push   %rbp
  801b22:	48 89 e5             	mov    %rsp,%rbp
  801b25:	48 83 ec 08          	sub    $0x8,%rsp
  801b29:	6a 00                	pushq  $0x0
  801b2b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b31:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b37:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b3c:	ba 00 00 00 00       	mov    $0x0,%edx
  801b41:	be 00 00 00 00       	mov    $0x0,%esi
  801b46:	bf 0e 00 00 00       	mov    $0xe,%edi
  801b4b:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  801b52:	00 00 00 
  801b55:	ff d0                	callq  *%rax
  801b57:	48 83 c4 10          	add    $0x10,%rsp
  801b5b:	c9                   	leaveq 
  801b5c:	c3                   	retq   

0000000000801b5d <sys_net_transmit>:
  801b5d:	55                   	push   %rbp
  801b5e:	48 89 e5             	mov    %rsp,%rbp
  801b61:	48 83 ec 10          	sub    $0x10,%rsp
  801b65:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b69:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801b6c:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801b6f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b73:	48 83 ec 08          	sub    $0x8,%rsp
  801b77:	6a 00                	pushq  $0x0
  801b79:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b7f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b85:	48 89 d1             	mov    %rdx,%rcx
  801b88:	48 89 c2             	mov    %rax,%rdx
  801b8b:	be 00 00 00 00       	mov    $0x0,%esi
  801b90:	bf 0f 00 00 00       	mov    $0xf,%edi
  801b95:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  801b9c:	00 00 00 
  801b9f:	ff d0                	callq  *%rax
  801ba1:	48 83 c4 10          	add    $0x10,%rsp
  801ba5:	c9                   	leaveq 
  801ba6:	c3                   	retq   

0000000000801ba7 <sys_net_receive>:
  801ba7:	55                   	push   %rbp
  801ba8:	48 89 e5             	mov    %rsp,%rbp
  801bab:	48 83 ec 10          	sub    $0x10,%rsp
  801baf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801bb3:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801bb6:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801bb9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bbd:	48 83 ec 08          	sub    $0x8,%rsp
  801bc1:	6a 00                	pushq  $0x0
  801bc3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bc9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bcf:	48 89 d1             	mov    %rdx,%rcx
  801bd2:	48 89 c2             	mov    %rax,%rdx
  801bd5:	be 00 00 00 00       	mov    $0x0,%esi
  801bda:	bf 10 00 00 00       	mov    $0x10,%edi
  801bdf:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  801be6:	00 00 00 
  801be9:	ff d0                	callq  *%rax
  801beb:	48 83 c4 10          	add    $0x10,%rsp
  801bef:	c9                   	leaveq 
  801bf0:	c3                   	retq   

0000000000801bf1 <sys_ept_map>:
  801bf1:	55                   	push   %rbp
  801bf2:	48 89 e5             	mov    %rsp,%rbp
  801bf5:	48 83 ec 20          	sub    $0x20,%rsp
  801bf9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bfc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c00:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801c03:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801c07:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801c0b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801c0e:	48 63 c8             	movslq %eax,%rcx
  801c11:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801c15:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c18:	48 63 f0             	movslq %eax,%rsi
  801c1b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c1f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c22:	48 98                	cltq   
  801c24:	48 83 ec 08          	sub    $0x8,%rsp
  801c28:	51                   	push   %rcx
  801c29:	49 89 f9             	mov    %rdi,%r9
  801c2c:	49 89 f0             	mov    %rsi,%r8
  801c2f:	48 89 d1             	mov    %rdx,%rcx
  801c32:	48 89 c2             	mov    %rax,%rdx
  801c35:	be 00 00 00 00       	mov    $0x0,%esi
  801c3a:	bf 11 00 00 00       	mov    $0x11,%edi
  801c3f:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  801c46:	00 00 00 
  801c49:	ff d0                	callq  *%rax
  801c4b:	48 83 c4 10          	add    $0x10,%rsp
  801c4f:	c9                   	leaveq 
  801c50:	c3                   	retq   

0000000000801c51 <sys_env_mkguest>:
  801c51:	55                   	push   %rbp
  801c52:	48 89 e5             	mov    %rsp,%rbp
  801c55:	48 83 ec 10          	sub    $0x10,%rsp
  801c59:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c5d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c61:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c69:	48 83 ec 08          	sub    $0x8,%rsp
  801c6d:	6a 00                	pushq  $0x0
  801c6f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c75:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c7b:	48 89 d1             	mov    %rdx,%rcx
  801c7e:	48 89 c2             	mov    %rax,%rdx
  801c81:	be 00 00 00 00       	mov    $0x0,%esi
  801c86:	bf 12 00 00 00       	mov    $0x12,%edi
  801c8b:	48 b8 cb 16 80 00 00 	movabs $0x8016cb,%rax
  801c92:	00 00 00 
  801c95:	ff d0                	callq  *%rax
  801c97:	48 83 c4 10          	add    $0x10,%rsp
  801c9b:	c9                   	leaveq 
  801c9c:	c3                   	retq   

0000000000801c9d <fd2num>:
  801c9d:	55                   	push   %rbp
  801c9e:	48 89 e5             	mov    %rsp,%rbp
  801ca1:	48 83 ec 08          	sub    $0x8,%rsp
  801ca5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ca9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801cad:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801cb4:	ff ff ff 
  801cb7:	48 01 d0             	add    %rdx,%rax
  801cba:	48 c1 e8 0c          	shr    $0xc,%rax
  801cbe:	c9                   	leaveq 
  801cbf:	c3                   	retq   

0000000000801cc0 <fd2data>:
  801cc0:	55                   	push   %rbp
  801cc1:	48 89 e5             	mov    %rsp,%rbp
  801cc4:	48 83 ec 08          	sub    $0x8,%rsp
  801cc8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ccc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cd0:	48 89 c7             	mov    %rax,%rdi
  801cd3:	48 b8 9d 1c 80 00 00 	movabs $0x801c9d,%rax
  801cda:	00 00 00 
  801cdd:	ff d0                	callq  *%rax
  801cdf:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801ce5:	48 c1 e0 0c          	shl    $0xc,%rax
  801ce9:	c9                   	leaveq 
  801cea:	c3                   	retq   

0000000000801ceb <fd_alloc>:
  801ceb:	55                   	push   %rbp
  801cec:	48 89 e5             	mov    %rsp,%rbp
  801cef:	48 83 ec 18          	sub    $0x18,%rsp
  801cf3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801cf7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801cfe:	eb 6b                	jmp    801d6b <fd_alloc+0x80>
  801d00:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d03:	48 98                	cltq   
  801d05:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801d0b:	48 c1 e0 0c          	shl    $0xc,%rax
  801d0f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801d13:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d17:	48 c1 e8 15          	shr    $0x15,%rax
  801d1b:	48 89 c2             	mov    %rax,%rdx
  801d1e:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801d25:	01 00 00 
  801d28:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801d2c:	83 e0 01             	and    $0x1,%eax
  801d2f:	48 85 c0             	test   %rax,%rax
  801d32:	74 21                	je     801d55 <fd_alloc+0x6a>
  801d34:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d38:	48 c1 e8 0c          	shr    $0xc,%rax
  801d3c:	48 89 c2             	mov    %rax,%rdx
  801d3f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801d46:	01 00 00 
  801d49:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801d4d:	83 e0 01             	and    $0x1,%eax
  801d50:	48 85 c0             	test   %rax,%rax
  801d53:	75 12                	jne    801d67 <fd_alloc+0x7c>
  801d55:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d59:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d5d:	48 89 10             	mov    %rdx,(%rax)
  801d60:	b8 00 00 00 00       	mov    $0x0,%eax
  801d65:	eb 1a                	jmp    801d81 <fd_alloc+0x96>
  801d67:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801d6b:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801d6f:	7e 8f                	jle    801d00 <fd_alloc+0x15>
  801d71:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d75:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801d7c:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801d81:	c9                   	leaveq 
  801d82:	c3                   	retq   

0000000000801d83 <fd_lookup>:
  801d83:	55                   	push   %rbp
  801d84:	48 89 e5             	mov    %rsp,%rbp
  801d87:	48 83 ec 20          	sub    $0x20,%rsp
  801d8b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801d8e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801d92:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801d96:	78 06                	js     801d9e <fd_lookup+0x1b>
  801d98:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801d9c:	7e 07                	jle    801da5 <fd_lookup+0x22>
  801d9e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801da3:	eb 6c                	jmp    801e11 <fd_lookup+0x8e>
  801da5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801da8:	48 98                	cltq   
  801daa:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801db0:	48 c1 e0 0c          	shl    $0xc,%rax
  801db4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801db8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dbc:	48 c1 e8 15          	shr    $0x15,%rax
  801dc0:	48 89 c2             	mov    %rax,%rdx
  801dc3:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801dca:	01 00 00 
  801dcd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801dd1:	83 e0 01             	and    $0x1,%eax
  801dd4:	48 85 c0             	test   %rax,%rax
  801dd7:	74 21                	je     801dfa <fd_lookup+0x77>
  801dd9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ddd:	48 c1 e8 0c          	shr    $0xc,%rax
  801de1:	48 89 c2             	mov    %rax,%rdx
  801de4:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801deb:	01 00 00 
  801dee:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801df2:	83 e0 01             	and    $0x1,%eax
  801df5:	48 85 c0             	test   %rax,%rax
  801df8:	75 07                	jne    801e01 <fd_lookup+0x7e>
  801dfa:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801dff:	eb 10                	jmp    801e11 <fd_lookup+0x8e>
  801e01:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801e05:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801e09:	48 89 10             	mov    %rdx,(%rax)
  801e0c:	b8 00 00 00 00       	mov    $0x0,%eax
  801e11:	c9                   	leaveq 
  801e12:	c3                   	retq   

0000000000801e13 <fd_close>:
  801e13:	55                   	push   %rbp
  801e14:	48 89 e5             	mov    %rsp,%rbp
  801e17:	48 83 ec 30          	sub    $0x30,%rsp
  801e1b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801e1f:	89 f0                	mov    %esi,%eax
  801e21:	88 45 d4             	mov    %al,-0x2c(%rbp)
  801e24:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e28:	48 89 c7             	mov    %rax,%rdi
  801e2b:	48 b8 9d 1c 80 00 00 	movabs $0x801c9d,%rax
  801e32:	00 00 00 
  801e35:	ff d0                	callq  *%rax
  801e37:	89 c2                	mov    %eax,%edx
  801e39:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  801e3d:	48 89 c6             	mov    %rax,%rsi
  801e40:	89 d7                	mov    %edx,%edi
  801e42:	48 b8 83 1d 80 00 00 	movabs $0x801d83,%rax
  801e49:	00 00 00 
  801e4c:	ff d0                	callq  *%rax
  801e4e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801e51:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801e55:	78 0a                	js     801e61 <fd_close+0x4e>
  801e57:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e5b:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  801e5f:	74 12                	je     801e73 <fd_close+0x60>
  801e61:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  801e65:	74 05                	je     801e6c <fd_close+0x59>
  801e67:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e6a:	eb 70                	jmp    801edc <fd_close+0xc9>
  801e6c:	b8 00 00 00 00       	mov    $0x0,%eax
  801e71:	eb 69                	jmp    801edc <fd_close+0xc9>
  801e73:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e77:	8b 00                	mov    (%rax),%eax
  801e79:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  801e7d:	48 89 d6             	mov    %rdx,%rsi
  801e80:	89 c7                	mov    %eax,%edi
  801e82:	48 b8 de 1e 80 00 00 	movabs $0x801ede,%rax
  801e89:	00 00 00 
  801e8c:	ff d0                	callq  *%rax
  801e8e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801e91:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801e95:	78 2a                	js     801ec1 <fd_close+0xae>
  801e97:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e9b:	48 8b 40 20          	mov    0x20(%rax),%rax
  801e9f:	48 85 c0             	test   %rax,%rax
  801ea2:	74 16                	je     801eba <fd_close+0xa7>
  801ea4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ea8:	48 8b 40 20          	mov    0x20(%rax),%rax
  801eac:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801eb0:	48 89 d7             	mov    %rdx,%rdi
  801eb3:	ff d0                	callq  *%rax
  801eb5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801eb8:	eb 07                	jmp    801ec1 <fd_close+0xae>
  801eba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801ec1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ec5:	48 89 c6             	mov    %rax,%rsi
  801ec8:	bf 00 00 00 00       	mov    $0x0,%edi
  801ecd:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  801ed4:	00 00 00 
  801ed7:	ff d0                	callq  *%rax
  801ed9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801edc:	c9                   	leaveq 
  801edd:	c3                   	retq   

0000000000801ede <dev_lookup>:
  801ede:	55                   	push   %rbp
  801edf:	48 89 e5             	mov    %rsp,%rbp
  801ee2:	48 83 ec 20          	sub    $0x20,%rsp
  801ee6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801ee9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801eed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801ef4:	eb 41                	jmp    801f37 <dev_lookup+0x59>
  801ef6:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  801efd:	00 00 00 
  801f00:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801f03:	48 63 d2             	movslq %edx,%rdx
  801f06:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f0a:	8b 00                	mov    (%rax),%eax
  801f0c:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  801f0f:	75 22                	jne    801f33 <dev_lookup+0x55>
  801f11:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  801f18:	00 00 00 
  801f1b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801f1e:	48 63 d2             	movslq %edx,%rdx
  801f21:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  801f25:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f29:	48 89 10             	mov    %rdx,(%rax)
  801f2c:	b8 00 00 00 00       	mov    $0x0,%eax
  801f31:	eb 60                	jmp    801f93 <dev_lookup+0xb5>
  801f33:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801f37:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  801f3e:	00 00 00 
  801f41:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801f44:	48 63 d2             	movslq %edx,%rdx
  801f47:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f4b:	48 85 c0             	test   %rax,%rax
  801f4e:	75 a6                	jne    801ef6 <dev_lookup+0x18>
  801f50:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  801f57:	00 00 00 
  801f5a:	48 8b 00             	mov    (%rax),%rax
  801f5d:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  801f63:	8b 55 ec             	mov    -0x14(%rbp),%edx
  801f66:	89 c6                	mov    %eax,%esi
  801f68:	48 bf 78 47 80 00 00 	movabs $0x804778,%rdi
  801f6f:	00 00 00 
  801f72:	b8 00 00 00 00       	mov    $0x0,%eax
  801f77:	48 b9 e1 03 80 00 00 	movabs $0x8003e1,%rcx
  801f7e:	00 00 00 
  801f81:	ff d1                	callq  *%rcx
  801f83:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f87:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801f8e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801f93:	c9                   	leaveq 
  801f94:	c3                   	retq   

0000000000801f95 <close>:
  801f95:	55                   	push   %rbp
  801f96:	48 89 e5             	mov    %rsp,%rbp
  801f99:	48 83 ec 20          	sub    $0x20,%rsp
  801f9d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801fa0:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801fa4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801fa7:	48 89 d6             	mov    %rdx,%rsi
  801faa:	89 c7                	mov    %eax,%edi
  801fac:	48 b8 83 1d 80 00 00 	movabs $0x801d83,%rax
  801fb3:	00 00 00 
  801fb6:	ff d0                	callq  *%rax
  801fb8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801fbb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801fbf:	79 05                	jns    801fc6 <close+0x31>
  801fc1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801fc4:	eb 18                	jmp    801fde <close+0x49>
  801fc6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fca:	be 01 00 00 00       	mov    $0x1,%esi
  801fcf:	48 89 c7             	mov    %rax,%rdi
  801fd2:	48 b8 13 1e 80 00 00 	movabs $0x801e13,%rax
  801fd9:	00 00 00 
  801fdc:	ff d0                	callq  *%rax
  801fde:	c9                   	leaveq 
  801fdf:	c3                   	retq   

0000000000801fe0 <close_all>:
  801fe0:	55                   	push   %rbp
  801fe1:	48 89 e5             	mov    %rsp,%rbp
  801fe4:	48 83 ec 10          	sub    $0x10,%rsp
  801fe8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801fef:	eb 15                	jmp    802006 <close_all+0x26>
  801ff1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ff4:	89 c7                	mov    %eax,%edi
  801ff6:	48 b8 95 1f 80 00 00 	movabs $0x801f95,%rax
  801ffd:	00 00 00 
  802000:	ff d0                	callq  *%rax
  802002:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802006:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80200a:	7e e5                	jle    801ff1 <close_all+0x11>
  80200c:	90                   	nop
  80200d:	c9                   	leaveq 
  80200e:	c3                   	retq   

000000000080200f <dup>:
  80200f:	55                   	push   %rbp
  802010:	48 89 e5             	mov    %rsp,%rbp
  802013:	48 83 ec 40          	sub    $0x40,%rsp
  802017:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80201a:	89 75 c8             	mov    %esi,-0x38(%rbp)
  80201d:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802021:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802024:	48 89 d6             	mov    %rdx,%rsi
  802027:	89 c7                	mov    %eax,%edi
  802029:	48 b8 83 1d 80 00 00 	movabs $0x801d83,%rax
  802030:	00 00 00 
  802033:	ff d0                	callq  *%rax
  802035:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802038:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80203c:	79 08                	jns    802046 <dup+0x37>
  80203e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802041:	e9 70 01 00 00       	jmpq   8021b6 <dup+0x1a7>
  802046:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802049:	89 c7                	mov    %eax,%edi
  80204b:	48 b8 95 1f 80 00 00 	movabs $0x801f95,%rax
  802052:	00 00 00 
  802055:	ff d0                	callq  *%rax
  802057:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80205a:	48 98                	cltq   
  80205c:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802062:	48 c1 e0 0c          	shl    $0xc,%rax
  802066:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80206a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80206e:	48 89 c7             	mov    %rax,%rdi
  802071:	48 b8 c0 1c 80 00 00 	movabs $0x801cc0,%rax
  802078:	00 00 00 
  80207b:	ff d0                	callq  *%rax
  80207d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802081:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802085:	48 89 c7             	mov    %rax,%rdi
  802088:	48 b8 c0 1c 80 00 00 	movabs $0x801cc0,%rax
  80208f:	00 00 00 
  802092:	ff d0                	callq  *%rax
  802094:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802098:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80209c:	48 c1 e8 15          	shr    $0x15,%rax
  8020a0:	48 89 c2             	mov    %rax,%rdx
  8020a3:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8020aa:	01 00 00 
  8020ad:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020b1:	83 e0 01             	and    $0x1,%eax
  8020b4:	48 85 c0             	test   %rax,%rax
  8020b7:	74 71                	je     80212a <dup+0x11b>
  8020b9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020bd:	48 c1 e8 0c          	shr    $0xc,%rax
  8020c1:	48 89 c2             	mov    %rax,%rdx
  8020c4:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8020cb:	01 00 00 
  8020ce:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020d2:	83 e0 01             	and    $0x1,%eax
  8020d5:	48 85 c0             	test   %rax,%rax
  8020d8:	74 50                	je     80212a <dup+0x11b>
  8020da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020de:	48 c1 e8 0c          	shr    $0xc,%rax
  8020e2:	48 89 c2             	mov    %rax,%rdx
  8020e5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8020ec:	01 00 00 
  8020ef:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020f3:	25 07 0e 00 00       	and    $0xe07,%eax
  8020f8:	89 c1                	mov    %eax,%ecx
  8020fa:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8020fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802102:	41 89 c8             	mov    %ecx,%r8d
  802105:	48 89 d1             	mov    %rdx,%rcx
  802108:	ba 00 00 00 00       	mov    $0x0,%edx
  80210d:	48 89 c6             	mov    %rax,%rsi
  802110:	bf 00 00 00 00       	mov    $0x0,%edi
  802115:	48 b8 f3 18 80 00 00 	movabs $0x8018f3,%rax
  80211c:	00 00 00 
  80211f:	ff d0                	callq  *%rax
  802121:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802124:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802128:	78 55                	js     80217f <dup+0x170>
  80212a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80212e:	48 c1 e8 0c          	shr    $0xc,%rax
  802132:	48 89 c2             	mov    %rax,%rdx
  802135:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80213c:	01 00 00 
  80213f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802143:	25 07 0e 00 00       	and    $0xe07,%eax
  802148:	89 c1                	mov    %eax,%ecx
  80214a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80214e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802152:	41 89 c8             	mov    %ecx,%r8d
  802155:	48 89 d1             	mov    %rdx,%rcx
  802158:	ba 00 00 00 00       	mov    $0x0,%edx
  80215d:	48 89 c6             	mov    %rax,%rsi
  802160:	bf 00 00 00 00       	mov    $0x0,%edi
  802165:	48 b8 f3 18 80 00 00 	movabs $0x8018f3,%rax
  80216c:	00 00 00 
  80216f:	ff d0                	callq  *%rax
  802171:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802174:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802178:	78 08                	js     802182 <dup+0x173>
  80217a:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80217d:	eb 37                	jmp    8021b6 <dup+0x1a7>
  80217f:	90                   	nop
  802180:	eb 01                	jmp    802183 <dup+0x174>
  802182:	90                   	nop
  802183:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802187:	48 89 c6             	mov    %rax,%rsi
  80218a:	bf 00 00 00 00       	mov    $0x0,%edi
  80218f:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  802196:	00 00 00 
  802199:	ff d0                	callq  *%rax
  80219b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80219f:	48 89 c6             	mov    %rax,%rsi
  8021a2:	bf 00 00 00 00       	mov    $0x0,%edi
  8021a7:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  8021ae:	00 00 00 
  8021b1:	ff d0                	callq  *%rax
  8021b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021b6:	c9                   	leaveq 
  8021b7:	c3                   	retq   

00000000008021b8 <read>:
  8021b8:	55                   	push   %rbp
  8021b9:	48 89 e5             	mov    %rsp,%rbp
  8021bc:	48 83 ec 40          	sub    $0x40,%rsp
  8021c0:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8021c3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8021c7:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8021cb:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8021cf:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8021d2:	48 89 d6             	mov    %rdx,%rsi
  8021d5:	89 c7                	mov    %eax,%edi
  8021d7:	48 b8 83 1d 80 00 00 	movabs $0x801d83,%rax
  8021de:	00 00 00 
  8021e1:	ff d0                	callq  *%rax
  8021e3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8021e6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021ea:	78 24                	js     802210 <read+0x58>
  8021ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021f0:	8b 00                	mov    (%rax),%eax
  8021f2:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8021f6:	48 89 d6             	mov    %rdx,%rsi
  8021f9:	89 c7                	mov    %eax,%edi
  8021fb:	48 b8 de 1e 80 00 00 	movabs $0x801ede,%rax
  802202:	00 00 00 
  802205:	ff d0                	callq  *%rax
  802207:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80220a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80220e:	79 05                	jns    802215 <read+0x5d>
  802210:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802213:	eb 76                	jmp    80228b <read+0xd3>
  802215:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802219:	8b 40 08             	mov    0x8(%rax),%eax
  80221c:	83 e0 03             	and    $0x3,%eax
  80221f:	83 f8 01             	cmp    $0x1,%eax
  802222:	75 3a                	jne    80225e <read+0xa6>
  802224:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80222b:	00 00 00 
  80222e:	48 8b 00             	mov    (%rax),%rax
  802231:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802237:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80223a:	89 c6                	mov    %eax,%esi
  80223c:	48 bf 97 47 80 00 00 	movabs $0x804797,%rdi
  802243:	00 00 00 
  802246:	b8 00 00 00 00       	mov    $0x0,%eax
  80224b:	48 b9 e1 03 80 00 00 	movabs $0x8003e1,%rcx
  802252:	00 00 00 
  802255:	ff d1                	callq  *%rcx
  802257:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80225c:	eb 2d                	jmp    80228b <read+0xd3>
  80225e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802262:	48 8b 40 10          	mov    0x10(%rax),%rax
  802266:	48 85 c0             	test   %rax,%rax
  802269:	75 07                	jne    802272 <read+0xba>
  80226b:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802270:	eb 19                	jmp    80228b <read+0xd3>
  802272:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802276:	48 8b 40 10          	mov    0x10(%rax),%rax
  80227a:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80227e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802282:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802286:	48 89 cf             	mov    %rcx,%rdi
  802289:	ff d0                	callq  *%rax
  80228b:	c9                   	leaveq 
  80228c:	c3                   	retq   

000000000080228d <readn>:
  80228d:	55                   	push   %rbp
  80228e:	48 89 e5             	mov    %rsp,%rbp
  802291:	48 83 ec 30          	sub    $0x30,%rsp
  802295:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802298:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80229c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8022a0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8022a7:	eb 47                	jmp    8022f0 <readn+0x63>
  8022a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022ac:	48 98                	cltq   
  8022ae:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8022b2:	48 29 c2             	sub    %rax,%rdx
  8022b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022b8:	48 63 c8             	movslq %eax,%rcx
  8022bb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8022bf:	48 01 c1             	add    %rax,%rcx
  8022c2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8022c5:	48 89 ce             	mov    %rcx,%rsi
  8022c8:	89 c7                	mov    %eax,%edi
  8022ca:	48 b8 b8 21 80 00 00 	movabs $0x8021b8,%rax
  8022d1:	00 00 00 
  8022d4:	ff d0                	callq  *%rax
  8022d6:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8022d9:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8022dd:	79 05                	jns    8022e4 <readn+0x57>
  8022df:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8022e2:	eb 1d                	jmp    802301 <readn+0x74>
  8022e4:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8022e8:	74 13                	je     8022fd <readn+0x70>
  8022ea:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8022ed:	01 45 fc             	add    %eax,-0x4(%rbp)
  8022f0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022f3:	48 98                	cltq   
  8022f5:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8022f9:	72 ae                	jb     8022a9 <readn+0x1c>
  8022fb:	eb 01                	jmp    8022fe <readn+0x71>
  8022fd:	90                   	nop
  8022fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802301:	c9                   	leaveq 
  802302:	c3                   	retq   

0000000000802303 <write>:
  802303:	55                   	push   %rbp
  802304:	48 89 e5             	mov    %rsp,%rbp
  802307:	48 83 ec 40          	sub    $0x40,%rsp
  80230b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80230e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802312:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802316:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80231a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80231d:	48 89 d6             	mov    %rdx,%rsi
  802320:	89 c7                	mov    %eax,%edi
  802322:	48 b8 83 1d 80 00 00 	movabs $0x801d83,%rax
  802329:	00 00 00 
  80232c:	ff d0                	callq  *%rax
  80232e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802331:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802335:	78 24                	js     80235b <write+0x58>
  802337:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80233b:	8b 00                	mov    (%rax),%eax
  80233d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802341:	48 89 d6             	mov    %rdx,%rsi
  802344:	89 c7                	mov    %eax,%edi
  802346:	48 b8 de 1e 80 00 00 	movabs $0x801ede,%rax
  80234d:	00 00 00 
  802350:	ff d0                	callq  *%rax
  802352:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802355:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802359:	79 05                	jns    802360 <write+0x5d>
  80235b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80235e:	eb 75                	jmp    8023d5 <write+0xd2>
  802360:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802364:	8b 40 08             	mov    0x8(%rax),%eax
  802367:	83 e0 03             	and    $0x3,%eax
  80236a:	85 c0                	test   %eax,%eax
  80236c:	75 3a                	jne    8023a8 <write+0xa5>
  80236e:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802375:	00 00 00 
  802378:	48 8b 00             	mov    (%rax),%rax
  80237b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802381:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802384:	89 c6                	mov    %eax,%esi
  802386:	48 bf b3 47 80 00 00 	movabs $0x8047b3,%rdi
  80238d:	00 00 00 
  802390:	b8 00 00 00 00       	mov    $0x0,%eax
  802395:	48 b9 e1 03 80 00 00 	movabs $0x8003e1,%rcx
  80239c:	00 00 00 
  80239f:	ff d1                	callq  *%rcx
  8023a1:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8023a6:	eb 2d                	jmp    8023d5 <write+0xd2>
  8023a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023ac:	48 8b 40 18          	mov    0x18(%rax),%rax
  8023b0:	48 85 c0             	test   %rax,%rax
  8023b3:	75 07                	jne    8023bc <write+0xb9>
  8023b5:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8023ba:	eb 19                	jmp    8023d5 <write+0xd2>
  8023bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023c0:	48 8b 40 18          	mov    0x18(%rax),%rax
  8023c4:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8023c8:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8023cc:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8023d0:	48 89 cf             	mov    %rcx,%rdi
  8023d3:	ff d0                	callq  *%rax
  8023d5:	c9                   	leaveq 
  8023d6:	c3                   	retq   

00000000008023d7 <seek>:
  8023d7:	55                   	push   %rbp
  8023d8:	48 89 e5             	mov    %rsp,%rbp
  8023db:	48 83 ec 18          	sub    $0x18,%rsp
  8023df:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8023e2:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8023e5:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8023e9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8023ec:	48 89 d6             	mov    %rdx,%rsi
  8023ef:	89 c7                	mov    %eax,%edi
  8023f1:	48 b8 83 1d 80 00 00 	movabs $0x801d83,%rax
  8023f8:	00 00 00 
  8023fb:	ff d0                	callq  *%rax
  8023fd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802400:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802404:	79 05                	jns    80240b <seek+0x34>
  802406:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802409:	eb 0f                	jmp    80241a <seek+0x43>
  80240b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80240f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802412:	89 50 04             	mov    %edx,0x4(%rax)
  802415:	b8 00 00 00 00       	mov    $0x0,%eax
  80241a:	c9                   	leaveq 
  80241b:	c3                   	retq   

000000000080241c <ftruncate>:
  80241c:	55                   	push   %rbp
  80241d:	48 89 e5             	mov    %rsp,%rbp
  802420:	48 83 ec 30          	sub    $0x30,%rsp
  802424:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802427:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80242a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80242e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802431:	48 89 d6             	mov    %rdx,%rsi
  802434:	89 c7                	mov    %eax,%edi
  802436:	48 b8 83 1d 80 00 00 	movabs $0x801d83,%rax
  80243d:	00 00 00 
  802440:	ff d0                	callq  *%rax
  802442:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802445:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802449:	78 24                	js     80246f <ftruncate+0x53>
  80244b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80244f:	8b 00                	mov    (%rax),%eax
  802451:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802455:	48 89 d6             	mov    %rdx,%rsi
  802458:	89 c7                	mov    %eax,%edi
  80245a:	48 b8 de 1e 80 00 00 	movabs $0x801ede,%rax
  802461:	00 00 00 
  802464:	ff d0                	callq  *%rax
  802466:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802469:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80246d:	79 05                	jns    802474 <ftruncate+0x58>
  80246f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802472:	eb 72                	jmp    8024e6 <ftruncate+0xca>
  802474:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802478:	8b 40 08             	mov    0x8(%rax),%eax
  80247b:	83 e0 03             	and    $0x3,%eax
  80247e:	85 c0                	test   %eax,%eax
  802480:	75 3a                	jne    8024bc <ftruncate+0xa0>
  802482:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802489:	00 00 00 
  80248c:	48 8b 00             	mov    (%rax),%rax
  80248f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802495:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802498:	89 c6                	mov    %eax,%esi
  80249a:	48 bf d0 47 80 00 00 	movabs $0x8047d0,%rdi
  8024a1:	00 00 00 
  8024a4:	b8 00 00 00 00       	mov    $0x0,%eax
  8024a9:	48 b9 e1 03 80 00 00 	movabs $0x8003e1,%rcx
  8024b0:	00 00 00 
  8024b3:	ff d1                	callq  *%rcx
  8024b5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8024ba:	eb 2a                	jmp    8024e6 <ftruncate+0xca>
  8024bc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024c0:	48 8b 40 30          	mov    0x30(%rax),%rax
  8024c4:	48 85 c0             	test   %rax,%rax
  8024c7:	75 07                	jne    8024d0 <ftruncate+0xb4>
  8024c9:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8024ce:	eb 16                	jmp    8024e6 <ftruncate+0xca>
  8024d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024d4:	48 8b 40 30          	mov    0x30(%rax),%rax
  8024d8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8024dc:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8024df:	89 ce                	mov    %ecx,%esi
  8024e1:	48 89 d7             	mov    %rdx,%rdi
  8024e4:	ff d0                	callq  *%rax
  8024e6:	c9                   	leaveq 
  8024e7:	c3                   	retq   

00000000008024e8 <fstat>:
  8024e8:	55                   	push   %rbp
  8024e9:	48 89 e5             	mov    %rsp,%rbp
  8024ec:	48 83 ec 30          	sub    $0x30,%rsp
  8024f0:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8024f3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8024f7:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8024fb:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8024fe:	48 89 d6             	mov    %rdx,%rsi
  802501:	89 c7                	mov    %eax,%edi
  802503:	48 b8 83 1d 80 00 00 	movabs $0x801d83,%rax
  80250a:	00 00 00 
  80250d:	ff d0                	callq  *%rax
  80250f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802512:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802516:	78 24                	js     80253c <fstat+0x54>
  802518:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80251c:	8b 00                	mov    (%rax),%eax
  80251e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802522:	48 89 d6             	mov    %rdx,%rsi
  802525:	89 c7                	mov    %eax,%edi
  802527:	48 b8 de 1e 80 00 00 	movabs $0x801ede,%rax
  80252e:	00 00 00 
  802531:	ff d0                	callq  *%rax
  802533:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802536:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80253a:	79 05                	jns    802541 <fstat+0x59>
  80253c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80253f:	eb 5e                	jmp    80259f <fstat+0xb7>
  802541:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802545:	48 8b 40 28          	mov    0x28(%rax),%rax
  802549:	48 85 c0             	test   %rax,%rax
  80254c:	75 07                	jne    802555 <fstat+0x6d>
  80254e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802553:	eb 4a                	jmp    80259f <fstat+0xb7>
  802555:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802559:	c6 00 00             	movb   $0x0,(%rax)
  80255c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802560:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802567:	00 00 00 
  80256a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80256e:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802575:	00 00 00 
  802578:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80257c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802580:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802587:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80258b:	48 8b 40 28          	mov    0x28(%rax),%rax
  80258f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802593:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802597:	48 89 ce             	mov    %rcx,%rsi
  80259a:	48 89 d7             	mov    %rdx,%rdi
  80259d:	ff d0                	callq  *%rax
  80259f:	c9                   	leaveq 
  8025a0:	c3                   	retq   

00000000008025a1 <stat>:
  8025a1:	55                   	push   %rbp
  8025a2:	48 89 e5             	mov    %rsp,%rbp
  8025a5:	48 83 ec 20          	sub    $0x20,%rsp
  8025a9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8025ad:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8025b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025b5:	be 00 00 00 00       	mov    $0x0,%esi
  8025ba:	48 89 c7             	mov    %rax,%rdi
  8025bd:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  8025c4:	00 00 00 
  8025c7:	ff d0                	callq  *%rax
  8025c9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025cc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025d0:	79 05                	jns    8025d7 <stat+0x36>
  8025d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025d5:	eb 2f                	jmp    802606 <stat+0x65>
  8025d7:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8025db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025de:	48 89 d6             	mov    %rdx,%rsi
  8025e1:	89 c7                	mov    %eax,%edi
  8025e3:	48 b8 e8 24 80 00 00 	movabs $0x8024e8,%rax
  8025ea:	00 00 00 
  8025ed:	ff d0                	callq  *%rax
  8025ef:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8025f2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025f5:	89 c7                	mov    %eax,%edi
  8025f7:	48 b8 95 1f 80 00 00 	movabs $0x801f95,%rax
  8025fe:	00 00 00 
  802601:	ff d0                	callq  *%rax
  802603:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802606:	c9                   	leaveq 
  802607:	c3                   	retq   

0000000000802608 <fsipc>:
  802608:	55                   	push   %rbp
  802609:	48 89 e5             	mov    %rsp,%rbp
  80260c:	48 83 ec 10          	sub    $0x10,%rsp
  802610:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802613:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802617:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80261e:	00 00 00 
  802621:	8b 00                	mov    (%rax),%eax
  802623:	85 c0                	test   %eax,%eax
  802625:	75 1f                	jne    802646 <fsipc+0x3e>
  802627:	bf 01 00 00 00       	mov    $0x1,%edi
  80262c:	48 b8 c0 40 80 00 00 	movabs $0x8040c0,%rax
  802633:	00 00 00 
  802636:	ff d0                	callq  *%rax
  802638:	89 c2                	mov    %eax,%edx
  80263a:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  802641:	00 00 00 
  802644:	89 10                	mov    %edx,(%rax)
  802646:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80264d:	00 00 00 
  802650:	8b 00                	mov    (%rax),%eax
  802652:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802655:	b9 07 00 00 00       	mov    $0x7,%ecx
  80265a:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  802661:	00 00 00 
  802664:	89 c7                	mov    %eax,%edi
  802666:	48 b8 b6 3f 80 00 00 	movabs $0x803fb6,%rax
  80266d:	00 00 00 
  802670:	ff d0                	callq  *%rax
  802672:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802676:	ba 00 00 00 00       	mov    $0x0,%edx
  80267b:	48 89 c6             	mov    %rax,%rsi
  80267e:	bf 00 00 00 00       	mov    $0x0,%edi
  802683:	48 b8 f5 3e 80 00 00 	movabs $0x803ef5,%rax
  80268a:	00 00 00 
  80268d:	ff d0                	callq  *%rax
  80268f:	c9                   	leaveq 
  802690:	c3                   	retq   

0000000000802691 <open>:
  802691:	55                   	push   %rbp
  802692:	48 89 e5             	mov    %rsp,%rbp
  802695:	48 83 ec 20          	sub    $0x20,%rsp
  802699:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80269d:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8026a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026a4:	48 89 c7             	mov    %rax,%rdi
  8026a7:	48 b8 05 0f 80 00 00 	movabs $0x800f05,%rax
  8026ae:	00 00 00 
  8026b1:	ff d0                	callq  *%rax
  8026b3:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8026b8:	7e 0a                	jle    8026c4 <open+0x33>
  8026ba:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8026bf:	e9 a5 00 00 00       	jmpq   802769 <open+0xd8>
  8026c4:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8026c8:	48 89 c7             	mov    %rax,%rdi
  8026cb:	48 b8 eb 1c 80 00 00 	movabs $0x801ceb,%rax
  8026d2:	00 00 00 
  8026d5:	ff d0                	callq  *%rax
  8026d7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026da:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026de:	79 08                	jns    8026e8 <open+0x57>
  8026e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026e3:	e9 81 00 00 00       	jmpq   802769 <open+0xd8>
  8026e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026ec:	48 89 c6             	mov    %rax,%rsi
  8026ef:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  8026f6:	00 00 00 
  8026f9:	48 b8 71 0f 80 00 00 	movabs $0x800f71,%rax
  802700:	00 00 00 
  802703:	ff d0                	callq  *%rax
  802705:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80270c:	00 00 00 
  80270f:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802712:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802718:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80271c:	48 89 c6             	mov    %rax,%rsi
  80271f:	bf 01 00 00 00       	mov    $0x1,%edi
  802724:	48 b8 08 26 80 00 00 	movabs $0x802608,%rax
  80272b:	00 00 00 
  80272e:	ff d0                	callq  *%rax
  802730:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802733:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802737:	79 1d                	jns    802756 <open+0xc5>
  802739:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80273d:	be 00 00 00 00       	mov    $0x0,%esi
  802742:	48 89 c7             	mov    %rax,%rdi
  802745:	48 b8 13 1e 80 00 00 	movabs $0x801e13,%rax
  80274c:	00 00 00 
  80274f:	ff d0                	callq  *%rax
  802751:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802754:	eb 13                	jmp    802769 <open+0xd8>
  802756:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80275a:	48 89 c7             	mov    %rax,%rdi
  80275d:	48 b8 9d 1c 80 00 00 	movabs $0x801c9d,%rax
  802764:	00 00 00 
  802767:	ff d0                	callq  *%rax
  802769:	c9                   	leaveq 
  80276a:	c3                   	retq   

000000000080276b <devfile_flush>:
  80276b:	55                   	push   %rbp
  80276c:	48 89 e5             	mov    %rsp,%rbp
  80276f:	48 83 ec 10          	sub    $0x10,%rsp
  802773:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802777:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80277b:	8b 50 0c             	mov    0xc(%rax),%edx
  80277e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802785:	00 00 00 
  802788:	89 10                	mov    %edx,(%rax)
  80278a:	be 00 00 00 00       	mov    $0x0,%esi
  80278f:	bf 06 00 00 00       	mov    $0x6,%edi
  802794:	48 b8 08 26 80 00 00 	movabs $0x802608,%rax
  80279b:	00 00 00 
  80279e:	ff d0                	callq  *%rax
  8027a0:	c9                   	leaveq 
  8027a1:	c3                   	retq   

00000000008027a2 <devfile_read>:
  8027a2:	55                   	push   %rbp
  8027a3:	48 89 e5             	mov    %rsp,%rbp
  8027a6:	48 83 ec 30          	sub    $0x30,%rsp
  8027aa:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8027ae:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8027b2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8027b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027ba:	8b 50 0c             	mov    0xc(%rax),%edx
  8027bd:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8027c4:	00 00 00 
  8027c7:	89 10                	mov    %edx,(%rax)
  8027c9:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8027d0:	00 00 00 
  8027d3:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8027d7:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8027db:	be 00 00 00 00       	mov    $0x0,%esi
  8027e0:	bf 03 00 00 00       	mov    $0x3,%edi
  8027e5:	48 b8 08 26 80 00 00 	movabs $0x802608,%rax
  8027ec:	00 00 00 
  8027ef:	ff d0                	callq  *%rax
  8027f1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027f4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027f8:	79 08                	jns    802802 <devfile_read+0x60>
  8027fa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027fd:	e9 a4 00 00 00       	jmpq   8028a6 <devfile_read+0x104>
  802802:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802805:	48 98                	cltq   
  802807:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80280b:	76 35                	jbe    802842 <devfile_read+0xa0>
  80280d:	48 b9 f6 47 80 00 00 	movabs $0x8047f6,%rcx
  802814:	00 00 00 
  802817:	48 ba fd 47 80 00 00 	movabs $0x8047fd,%rdx
  80281e:	00 00 00 
  802821:	be 89 00 00 00       	mov    $0x89,%esi
  802826:	48 bf 12 48 80 00 00 	movabs $0x804812,%rdi
  80282d:	00 00 00 
  802830:	b8 00 00 00 00       	mov    $0x0,%eax
  802835:	49 b8 e1 3d 80 00 00 	movabs $0x803de1,%r8
  80283c:	00 00 00 
  80283f:	41 ff d0             	callq  *%r8
  802842:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802849:	7e 35                	jle    802880 <devfile_read+0xde>
  80284b:	48 b9 20 48 80 00 00 	movabs $0x804820,%rcx
  802852:	00 00 00 
  802855:	48 ba fd 47 80 00 00 	movabs $0x8047fd,%rdx
  80285c:	00 00 00 
  80285f:	be 8a 00 00 00       	mov    $0x8a,%esi
  802864:	48 bf 12 48 80 00 00 	movabs $0x804812,%rdi
  80286b:	00 00 00 
  80286e:	b8 00 00 00 00       	mov    $0x0,%eax
  802873:	49 b8 e1 3d 80 00 00 	movabs $0x803de1,%r8
  80287a:	00 00 00 
  80287d:	41 ff d0             	callq  *%r8
  802880:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802883:	48 63 d0             	movslq %eax,%rdx
  802886:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80288a:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802891:	00 00 00 
  802894:	48 89 c7             	mov    %rax,%rdi
  802897:	48 b8 96 12 80 00 00 	movabs $0x801296,%rax
  80289e:	00 00 00 
  8028a1:	ff d0                	callq  *%rax
  8028a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028a6:	c9                   	leaveq 
  8028a7:	c3                   	retq   

00000000008028a8 <devfile_write>:
  8028a8:	55                   	push   %rbp
  8028a9:	48 89 e5             	mov    %rsp,%rbp
  8028ac:	48 83 ec 40          	sub    $0x40,%rsp
  8028b0:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8028b4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8028b8:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8028bc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8028c0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8028c4:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8028cb:	00 
  8028cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028d0:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8028d4:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  8028d9:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8028dd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028e1:	8b 50 0c             	mov    0xc(%rax),%edx
  8028e4:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8028eb:	00 00 00 
  8028ee:	89 10                	mov    %edx,(%rax)
  8028f0:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8028f7:	00 00 00 
  8028fa:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8028fe:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802902:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802906:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80290a:	48 89 c6             	mov    %rax,%rsi
  80290d:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  802914:	00 00 00 
  802917:	48 b8 96 12 80 00 00 	movabs $0x801296,%rax
  80291e:	00 00 00 
  802921:	ff d0                	callq  *%rax
  802923:	be 00 00 00 00       	mov    $0x0,%esi
  802928:	bf 04 00 00 00       	mov    $0x4,%edi
  80292d:	48 b8 08 26 80 00 00 	movabs $0x802608,%rax
  802934:	00 00 00 
  802937:	ff d0                	callq  *%rax
  802939:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80293c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802940:	79 05                	jns    802947 <devfile_write+0x9f>
  802942:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802945:	eb 43                	jmp    80298a <devfile_write+0xe2>
  802947:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80294a:	48 98                	cltq   
  80294c:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802950:	76 35                	jbe    802987 <devfile_write+0xdf>
  802952:	48 b9 f6 47 80 00 00 	movabs $0x8047f6,%rcx
  802959:	00 00 00 
  80295c:	48 ba fd 47 80 00 00 	movabs $0x8047fd,%rdx
  802963:	00 00 00 
  802966:	be a8 00 00 00       	mov    $0xa8,%esi
  80296b:	48 bf 12 48 80 00 00 	movabs $0x804812,%rdi
  802972:	00 00 00 
  802975:	b8 00 00 00 00       	mov    $0x0,%eax
  80297a:	49 b8 e1 3d 80 00 00 	movabs $0x803de1,%r8
  802981:	00 00 00 
  802984:	41 ff d0             	callq  *%r8
  802987:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80298a:	c9                   	leaveq 
  80298b:	c3                   	retq   

000000000080298c <devfile_stat>:
  80298c:	55                   	push   %rbp
  80298d:	48 89 e5             	mov    %rsp,%rbp
  802990:	48 83 ec 20          	sub    $0x20,%rsp
  802994:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802998:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80299c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029a0:	8b 50 0c             	mov    0xc(%rax),%edx
  8029a3:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8029aa:	00 00 00 
  8029ad:	89 10                	mov    %edx,(%rax)
  8029af:	be 00 00 00 00       	mov    $0x0,%esi
  8029b4:	bf 05 00 00 00       	mov    $0x5,%edi
  8029b9:	48 b8 08 26 80 00 00 	movabs $0x802608,%rax
  8029c0:	00 00 00 
  8029c3:	ff d0                	callq  *%rax
  8029c5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029c8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029cc:	79 05                	jns    8029d3 <devfile_stat+0x47>
  8029ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029d1:	eb 56                	jmp    802a29 <devfile_stat+0x9d>
  8029d3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029d7:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  8029de:	00 00 00 
  8029e1:	48 89 c7             	mov    %rax,%rdi
  8029e4:	48 b8 71 0f 80 00 00 	movabs $0x800f71,%rax
  8029eb:	00 00 00 
  8029ee:	ff d0                	callq  *%rax
  8029f0:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8029f7:	00 00 00 
  8029fa:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802a00:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802a04:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802a0a:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a11:	00 00 00 
  802a14:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802a1a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802a1e:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802a24:	b8 00 00 00 00       	mov    $0x0,%eax
  802a29:	c9                   	leaveq 
  802a2a:	c3                   	retq   

0000000000802a2b <devfile_trunc>:
  802a2b:	55                   	push   %rbp
  802a2c:	48 89 e5             	mov    %rsp,%rbp
  802a2f:	48 83 ec 10          	sub    $0x10,%rsp
  802a33:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802a37:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802a3a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802a3e:	8b 50 0c             	mov    0xc(%rax),%edx
  802a41:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a48:	00 00 00 
  802a4b:	89 10                	mov    %edx,(%rax)
  802a4d:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a54:	00 00 00 
  802a57:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802a5a:	89 50 04             	mov    %edx,0x4(%rax)
  802a5d:	be 00 00 00 00       	mov    $0x0,%esi
  802a62:	bf 02 00 00 00       	mov    $0x2,%edi
  802a67:	48 b8 08 26 80 00 00 	movabs $0x802608,%rax
  802a6e:	00 00 00 
  802a71:	ff d0                	callq  *%rax
  802a73:	c9                   	leaveq 
  802a74:	c3                   	retq   

0000000000802a75 <remove>:
  802a75:	55                   	push   %rbp
  802a76:	48 89 e5             	mov    %rsp,%rbp
  802a79:	48 83 ec 10          	sub    $0x10,%rsp
  802a7d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802a81:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802a85:	48 89 c7             	mov    %rax,%rdi
  802a88:	48 b8 05 0f 80 00 00 	movabs $0x800f05,%rax
  802a8f:	00 00 00 
  802a92:	ff d0                	callq  *%rax
  802a94:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802a99:	7e 07                	jle    802aa2 <remove+0x2d>
  802a9b:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802aa0:	eb 33                	jmp    802ad5 <remove+0x60>
  802aa2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802aa6:	48 89 c6             	mov    %rax,%rsi
  802aa9:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802ab0:	00 00 00 
  802ab3:	48 b8 71 0f 80 00 00 	movabs $0x800f71,%rax
  802aba:	00 00 00 
  802abd:	ff d0                	callq  *%rax
  802abf:	be 00 00 00 00       	mov    $0x0,%esi
  802ac4:	bf 07 00 00 00       	mov    $0x7,%edi
  802ac9:	48 b8 08 26 80 00 00 	movabs $0x802608,%rax
  802ad0:	00 00 00 
  802ad3:	ff d0                	callq  *%rax
  802ad5:	c9                   	leaveq 
  802ad6:	c3                   	retq   

0000000000802ad7 <sync>:
  802ad7:	55                   	push   %rbp
  802ad8:	48 89 e5             	mov    %rsp,%rbp
  802adb:	be 00 00 00 00       	mov    $0x0,%esi
  802ae0:	bf 08 00 00 00       	mov    $0x8,%edi
  802ae5:	48 b8 08 26 80 00 00 	movabs $0x802608,%rax
  802aec:	00 00 00 
  802aef:	ff d0                	callq  *%rax
  802af1:	5d                   	pop    %rbp
  802af2:	c3                   	retq   

0000000000802af3 <copy>:
  802af3:	55                   	push   %rbp
  802af4:	48 89 e5             	mov    %rsp,%rbp
  802af7:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802afe:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802b05:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802b0c:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802b13:	be 00 00 00 00       	mov    $0x0,%esi
  802b18:	48 89 c7             	mov    %rax,%rdi
  802b1b:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  802b22:	00 00 00 
  802b25:	ff d0                	callq  *%rax
  802b27:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b2a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b2e:	79 28                	jns    802b58 <copy+0x65>
  802b30:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b33:	89 c6                	mov    %eax,%esi
  802b35:	48 bf 2c 48 80 00 00 	movabs $0x80482c,%rdi
  802b3c:	00 00 00 
  802b3f:	b8 00 00 00 00       	mov    $0x0,%eax
  802b44:	48 ba e1 03 80 00 00 	movabs $0x8003e1,%rdx
  802b4b:	00 00 00 
  802b4e:	ff d2                	callq  *%rdx
  802b50:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b53:	e9 76 01 00 00       	jmpq   802cce <copy+0x1db>
  802b58:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802b5f:	be 01 01 00 00       	mov    $0x101,%esi
  802b64:	48 89 c7             	mov    %rax,%rdi
  802b67:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  802b6e:	00 00 00 
  802b71:	ff d0                	callq  *%rax
  802b73:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802b76:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802b7a:	0f 89 ad 00 00 00    	jns    802c2d <copy+0x13a>
  802b80:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b83:	89 c6                	mov    %eax,%esi
  802b85:	48 bf 42 48 80 00 00 	movabs $0x804842,%rdi
  802b8c:	00 00 00 
  802b8f:	b8 00 00 00 00       	mov    $0x0,%eax
  802b94:	48 ba e1 03 80 00 00 	movabs $0x8003e1,%rdx
  802b9b:	00 00 00 
  802b9e:	ff d2                	callq  *%rdx
  802ba0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ba3:	89 c7                	mov    %eax,%edi
  802ba5:	48 b8 95 1f 80 00 00 	movabs $0x801f95,%rax
  802bac:	00 00 00 
  802baf:	ff d0                	callq  *%rax
  802bb1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802bb4:	e9 15 01 00 00       	jmpq   802cce <copy+0x1db>
  802bb9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802bbc:	48 63 d0             	movslq %eax,%rdx
  802bbf:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802bc6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802bc9:	48 89 ce             	mov    %rcx,%rsi
  802bcc:	89 c7                	mov    %eax,%edi
  802bce:	48 b8 03 23 80 00 00 	movabs $0x802303,%rax
  802bd5:	00 00 00 
  802bd8:	ff d0                	callq  *%rax
  802bda:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802bdd:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802be1:	79 4a                	jns    802c2d <copy+0x13a>
  802be3:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802be6:	89 c6                	mov    %eax,%esi
  802be8:	48 bf 5c 48 80 00 00 	movabs $0x80485c,%rdi
  802bef:	00 00 00 
  802bf2:	b8 00 00 00 00       	mov    $0x0,%eax
  802bf7:	48 ba e1 03 80 00 00 	movabs $0x8003e1,%rdx
  802bfe:	00 00 00 
  802c01:	ff d2                	callq  *%rdx
  802c03:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c06:	89 c7                	mov    %eax,%edi
  802c08:	48 b8 95 1f 80 00 00 	movabs $0x801f95,%rax
  802c0f:	00 00 00 
  802c12:	ff d0                	callq  *%rax
  802c14:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c17:	89 c7                	mov    %eax,%edi
  802c19:	48 b8 95 1f 80 00 00 	movabs $0x801f95,%rax
  802c20:	00 00 00 
  802c23:	ff d0                	callq  *%rax
  802c25:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802c28:	e9 a1 00 00 00       	jmpq   802cce <copy+0x1db>
  802c2d:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802c34:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c37:	ba 00 02 00 00       	mov    $0x200,%edx
  802c3c:	48 89 ce             	mov    %rcx,%rsi
  802c3f:	89 c7                	mov    %eax,%edi
  802c41:	48 b8 b8 21 80 00 00 	movabs $0x8021b8,%rax
  802c48:	00 00 00 
  802c4b:	ff d0                	callq  *%rax
  802c4d:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802c50:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802c54:	0f 8f 5f ff ff ff    	jg     802bb9 <copy+0xc6>
  802c5a:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802c5e:	79 47                	jns    802ca7 <copy+0x1b4>
  802c60:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802c63:	89 c6                	mov    %eax,%esi
  802c65:	48 bf 6f 48 80 00 00 	movabs $0x80486f,%rdi
  802c6c:	00 00 00 
  802c6f:	b8 00 00 00 00       	mov    $0x0,%eax
  802c74:	48 ba e1 03 80 00 00 	movabs $0x8003e1,%rdx
  802c7b:	00 00 00 
  802c7e:	ff d2                	callq  *%rdx
  802c80:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c83:	89 c7                	mov    %eax,%edi
  802c85:	48 b8 95 1f 80 00 00 	movabs $0x801f95,%rax
  802c8c:	00 00 00 
  802c8f:	ff d0                	callq  *%rax
  802c91:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c94:	89 c7                	mov    %eax,%edi
  802c96:	48 b8 95 1f 80 00 00 	movabs $0x801f95,%rax
  802c9d:	00 00 00 
  802ca0:	ff d0                	callq  *%rax
  802ca2:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802ca5:	eb 27                	jmp    802cce <copy+0x1db>
  802ca7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802caa:	89 c7                	mov    %eax,%edi
  802cac:	48 b8 95 1f 80 00 00 	movabs $0x801f95,%rax
  802cb3:	00 00 00 
  802cb6:	ff d0                	callq  *%rax
  802cb8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802cbb:	89 c7                	mov    %eax,%edi
  802cbd:	48 b8 95 1f 80 00 00 	movabs $0x801f95,%rax
  802cc4:	00 00 00 
  802cc7:	ff d0                	callq  *%rax
  802cc9:	b8 00 00 00 00       	mov    $0x0,%eax
  802cce:	c9                   	leaveq 
  802ccf:	c3                   	retq   

0000000000802cd0 <fd2sockid>:
  802cd0:	55                   	push   %rbp
  802cd1:	48 89 e5             	mov    %rsp,%rbp
  802cd4:	48 83 ec 20          	sub    $0x20,%rsp
  802cd8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802cdb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802cdf:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ce2:	48 89 d6             	mov    %rdx,%rsi
  802ce5:	89 c7                	mov    %eax,%edi
  802ce7:	48 b8 83 1d 80 00 00 	movabs $0x801d83,%rax
  802cee:	00 00 00 
  802cf1:	ff d0                	callq  *%rax
  802cf3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cf6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cfa:	79 05                	jns    802d01 <fd2sockid+0x31>
  802cfc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cff:	eb 24                	jmp    802d25 <fd2sockid+0x55>
  802d01:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d05:	8b 10                	mov    (%rax),%edx
  802d07:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  802d0e:	00 00 00 
  802d11:	8b 00                	mov    (%rax),%eax
  802d13:	39 c2                	cmp    %eax,%edx
  802d15:	74 07                	je     802d1e <fd2sockid+0x4e>
  802d17:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802d1c:	eb 07                	jmp    802d25 <fd2sockid+0x55>
  802d1e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d22:	8b 40 0c             	mov    0xc(%rax),%eax
  802d25:	c9                   	leaveq 
  802d26:	c3                   	retq   

0000000000802d27 <alloc_sockfd>:
  802d27:	55                   	push   %rbp
  802d28:	48 89 e5             	mov    %rsp,%rbp
  802d2b:	48 83 ec 20          	sub    $0x20,%rsp
  802d2f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802d32:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802d36:	48 89 c7             	mov    %rax,%rdi
  802d39:	48 b8 eb 1c 80 00 00 	movabs $0x801ceb,%rax
  802d40:	00 00 00 
  802d43:	ff d0                	callq  *%rax
  802d45:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d48:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d4c:	78 26                	js     802d74 <alloc_sockfd+0x4d>
  802d4e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d52:	ba 07 04 00 00       	mov    $0x407,%edx
  802d57:	48 89 c6             	mov    %rax,%rsi
  802d5a:	bf 00 00 00 00       	mov    $0x0,%edi
  802d5f:	48 b8 a1 18 80 00 00 	movabs $0x8018a1,%rax
  802d66:	00 00 00 
  802d69:	ff d0                	callq  *%rax
  802d6b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d6e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d72:	79 16                	jns    802d8a <alloc_sockfd+0x63>
  802d74:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d77:	89 c7                	mov    %eax,%edi
  802d79:	48 b8 36 32 80 00 00 	movabs $0x803236,%rax
  802d80:	00 00 00 
  802d83:	ff d0                	callq  *%rax
  802d85:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d88:	eb 3a                	jmp    802dc4 <alloc_sockfd+0x9d>
  802d8a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d8e:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  802d95:	00 00 00 
  802d98:	8b 12                	mov    (%rdx),%edx
  802d9a:	89 10                	mov    %edx,(%rax)
  802d9c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802da0:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  802da7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802dab:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802dae:	89 50 0c             	mov    %edx,0xc(%rax)
  802db1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802db5:	48 89 c7             	mov    %rax,%rdi
  802db8:	48 b8 9d 1c 80 00 00 	movabs $0x801c9d,%rax
  802dbf:	00 00 00 
  802dc2:	ff d0                	callq  *%rax
  802dc4:	c9                   	leaveq 
  802dc5:	c3                   	retq   

0000000000802dc6 <accept>:
  802dc6:	55                   	push   %rbp
  802dc7:	48 89 e5             	mov    %rsp,%rbp
  802dca:	48 83 ec 30          	sub    $0x30,%rsp
  802dce:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802dd1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802dd5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802dd9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ddc:	89 c7                	mov    %eax,%edi
  802dde:	48 b8 d0 2c 80 00 00 	movabs $0x802cd0,%rax
  802de5:	00 00 00 
  802de8:	ff d0                	callq  *%rax
  802dea:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ded:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802df1:	79 05                	jns    802df8 <accept+0x32>
  802df3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802df6:	eb 3b                	jmp    802e33 <accept+0x6d>
  802df8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802dfc:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802e00:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e03:	48 89 ce             	mov    %rcx,%rsi
  802e06:	89 c7                	mov    %eax,%edi
  802e08:	48 b8 13 31 80 00 00 	movabs $0x803113,%rax
  802e0f:	00 00 00 
  802e12:	ff d0                	callq  *%rax
  802e14:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e17:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e1b:	79 05                	jns    802e22 <accept+0x5c>
  802e1d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e20:	eb 11                	jmp    802e33 <accept+0x6d>
  802e22:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e25:	89 c7                	mov    %eax,%edi
  802e27:	48 b8 27 2d 80 00 00 	movabs $0x802d27,%rax
  802e2e:	00 00 00 
  802e31:	ff d0                	callq  *%rax
  802e33:	c9                   	leaveq 
  802e34:	c3                   	retq   

0000000000802e35 <bind>:
  802e35:	55                   	push   %rbp
  802e36:	48 89 e5             	mov    %rsp,%rbp
  802e39:	48 83 ec 20          	sub    $0x20,%rsp
  802e3d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e40:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802e44:	89 55 e8             	mov    %edx,-0x18(%rbp)
  802e47:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e4a:	89 c7                	mov    %eax,%edi
  802e4c:	48 b8 d0 2c 80 00 00 	movabs $0x802cd0,%rax
  802e53:	00 00 00 
  802e56:	ff d0                	callq  *%rax
  802e58:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e5b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e5f:	79 05                	jns    802e66 <bind+0x31>
  802e61:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e64:	eb 1b                	jmp    802e81 <bind+0x4c>
  802e66:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802e69:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802e6d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e70:	48 89 ce             	mov    %rcx,%rsi
  802e73:	89 c7                	mov    %eax,%edi
  802e75:	48 b8 92 31 80 00 00 	movabs $0x803192,%rax
  802e7c:	00 00 00 
  802e7f:	ff d0                	callq  *%rax
  802e81:	c9                   	leaveq 
  802e82:	c3                   	retq   

0000000000802e83 <shutdown>:
  802e83:	55                   	push   %rbp
  802e84:	48 89 e5             	mov    %rsp,%rbp
  802e87:	48 83 ec 20          	sub    $0x20,%rsp
  802e8b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e8e:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802e91:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e94:	89 c7                	mov    %eax,%edi
  802e96:	48 b8 d0 2c 80 00 00 	movabs $0x802cd0,%rax
  802e9d:	00 00 00 
  802ea0:	ff d0                	callq  *%rax
  802ea2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ea5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ea9:	79 05                	jns    802eb0 <shutdown+0x2d>
  802eab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eae:	eb 16                	jmp    802ec6 <shutdown+0x43>
  802eb0:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802eb3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eb6:	89 d6                	mov    %edx,%esi
  802eb8:	89 c7                	mov    %eax,%edi
  802eba:	48 b8 f6 31 80 00 00 	movabs $0x8031f6,%rax
  802ec1:	00 00 00 
  802ec4:	ff d0                	callq  *%rax
  802ec6:	c9                   	leaveq 
  802ec7:	c3                   	retq   

0000000000802ec8 <devsock_close>:
  802ec8:	55                   	push   %rbp
  802ec9:	48 89 e5             	mov    %rsp,%rbp
  802ecc:	48 83 ec 10          	sub    $0x10,%rsp
  802ed0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802ed4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ed8:	48 89 c7             	mov    %rax,%rdi
  802edb:	48 b8 31 41 80 00 00 	movabs $0x804131,%rax
  802ee2:	00 00 00 
  802ee5:	ff d0                	callq  *%rax
  802ee7:	83 f8 01             	cmp    $0x1,%eax
  802eea:	75 17                	jne    802f03 <devsock_close+0x3b>
  802eec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ef0:	8b 40 0c             	mov    0xc(%rax),%eax
  802ef3:	89 c7                	mov    %eax,%edi
  802ef5:	48 b8 36 32 80 00 00 	movabs $0x803236,%rax
  802efc:	00 00 00 
  802eff:	ff d0                	callq  *%rax
  802f01:	eb 05                	jmp    802f08 <devsock_close+0x40>
  802f03:	b8 00 00 00 00       	mov    $0x0,%eax
  802f08:	c9                   	leaveq 
  802f09:	c3                   	retq   

0000000000802f0a <connect>:
  802f0a:	55                   	push   %rbp
  802f0b:	48 89 e5             	mov    %rsp,%rbp
  802f0e:	48 83 ec 20          	sub    $0x20,%rsp
  802f12:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f15:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802f19:	89 55 e8             	mov    %edx,-0x18(%rbp)
  802f1c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f1f:	89 c7                	mov    %eax,%edi
  802f21:	48 b8 d0 2c 80 00 00 	movabs $0x802cd0,%rax
  802f28:	00 00 00 
  802f2b:	ff d0                	callq  *%rax
  802f2d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f30:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f34:	79 05                	jns    802f3b <connect+0x31>
  802f36:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f39:	eb 1b                	jmp    802f56 <connect+0x4c>
  802f3b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802f3e:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802f42:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f45:	48 89 ce             	mov    %rcx,%rsi
  802f48:	89 c7                	mov    %eax,%edi
  802f4a:	48 b8 63 32 80 00 00 	movabs $0x803263,%rax
  802f51:	00 00 00 
  802f54:	ff d0                	callq  *%rax
  802f56:	c9                   	leaveq 
  802f57:	c3                   	retq   

0000000000802f58 <listen>:
  802f58:	55                   	push   %rbp
  802f59:	48 89 e5             	mov    %rsp,%rbp
  802f5c:	48 83 ec 20          	sub    $0x20,%rsp
  802f60:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f63:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802f66:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f69:	89 c7                	mov    %eax,%edi
  802f6b:	48 b8 d0 2c 80 00 00 	movabs $0x802cd0,%rax
  802f72:	00 00 00 
  802f75:	ff d0                	callq  *%rax
  802f77:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f7a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f7e:	79 05                	jns    802f85 <listen+0x2d>
  802f80:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f83:	eb 16                	jmp    802f9b <listen+0x43>
  802f85:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802f88:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f8b:	89 d6                	mov    %edx,%esi
  802f8d:	89 c7                	mov    %eax,%edi
  802f8f:	48 b8 c7 32 80 00 00 	movabs $0x8032c7,%rax
  802f96:	00 00 00 
  802f99:	ff d0                	callq  *%rax
  802f9b:	c9                   	leaveq 
  802f9c:	c3                   	retq   

0000000000802f9d <devsock_read>:
  802f9d:	55                   	push   %rbp
  802f9e:	48 89 e5             	mov    %rsp,%rbp
  802fa1:	48 83 ec 20          	sub    $0x20,%rsp
  802fa5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802fa9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802fad:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  802fb1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fb5:	89 c2                	mov    %eax,%edx
  802fb7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802fbb:	8b 40 0c             	mov    0xc(%rax),%eax
  802fbe:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  802fc2:	b9 00 00 00 00       	mov    $0x0,%ecx
  802fc7:	89 c7                	mov    %eax,%edi
  802fc9:	48 b8 07 33 80 00 00 	movabs $0x803307,%rax
  802fd0:	00 00 00 
  802fd3:	ff d0                	callq  *%rax
  802fd5:	c9                   	leaveq 
  802fd6:	c3                   	retq   

0000000000802fd7 <devsock_write>:
  802fd7:	55                   	push   %rbp
  802fd8:	48 89 e5             	mov    %rsp,%rbp
  802fdb:	48 83 ec 20          	sub    $0x20,%rsp
  802fdf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802fe3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802fe7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  802feb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fef:	89 c2                	mov    %eax,%edx
  802ff1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ff5:	8b 40 0c             	mov    0xc(%rax),%eax
  802ff8:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  802ffc:	b9 00 00 00 00       	mov    $0x0,%ecx
  803001:	89 c7                	mov    %eax,%edi
  803003:	48 b8 d3 33 80 00 00 	movabs $0x8033d3,%rax
  80300a:	00 00 00 
  80300d:	ff d0                	callq  *%rax
  80300f:	c9                   	leaveq 
  803010:	c3                   	retq   

0000000000803011 <devsock_stat>:
  803011:	55                   	push   %rbp
  803012:	48 89 e5             	mov    %rsp,%rbp
  803015:	48 83 ec 10          	sub    $0x10,%rsp
  803019:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80301d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803021:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803025:	48 be 8a 48 80 00 00 	movabs $0x80488a,%rsi
  80302c:	00 00 00 
  80302f:	48 89 c7             	mov    %rax,%rdi
  803032:	48 b8 71 0f 80 00 00 	movabs $0x800f71,%rax
  803039:	00 00 00 
  80303c:	ff d0                	callq  *%rax
  80303e:	b8 00 00 00 00       	mov    $0x0,%eax
  803043:	c9                   	leaveq 
  803044:	c3                   	retq   

0000000000803045 <socket>:
  803045:	55                   	push   %rbp
  803046:	48 89 e5             	mov    %rsp,%rbp
  803049:	48 83 ec 20          	sub    $0x20,%rsp
  80304d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803050:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803053:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803056:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803059:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80305c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80305f:	89 ce                	mov    %ecx,%esi
  803061:	89 c7                	mov    %eax,%edi
  803063:	48 b8 8b 34 80 00 00 	movabs $0x80348b,%rax
  80306a:	00 00 00 
  80306d:	ff d0                	callq  *%rax
  80306f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803072:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803076:	79 05                	jns    80307d <socket+0x38>
  803078:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80307b:	eb 11                	jmp    80308e <socket+0x49>
  80307d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803080:	89 c7                	mov    %eax,%edi
  803082:	48 b8 27 2d 80 00 00 	movabs $0x802d27,%rax
  803089:	00 00 00 
  80308c:	ff d0                	callq  *%rax
  80308e:	c9                   	leaveq 
  80308f:	c3                   	retq   

0000000000803090 <nsipc>:
  803090:	55                   	push   %rbp
  803091:	48 89 e5             	mov    %rsp,%rbp
  803094:	48 83 ec 10          	sub    $0x10,%rsp
  803098:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80309b:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  8030a2:	00 00 00 
  8030a5:	8b 00                	mov    (%rax),%eax
  8030a7:	85 c0                	test   %eax,%eax
  8030a9:	75 1f                	jne    8030ca <nsipc+0x3a>
  8030ab:	bf 02 00 00 00       	mov    $0x2,%edi
  8030b0:	48 b8 c0 40 80 00 00 	movabs $0x8040c0,%rax
  8030b7:	00 00 00 
  8030ba:	ff d0                	callq  *%rax
  8030bc:	89 c2                	mov    %eax,%edx
  8030be:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  8030c5:	00 00 00 
  8030c8:	89 10                	mov    %edx,(%rax)
  8030ca:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  8030d1:	00 00 00 
  8030d4:	8b 00                	mov    (%rax),%eax
  8030d6:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8030d9:	b9 07 00 00 00       	mov    $0x7,%ecx
  8030de:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  8030e5:	00 00 00 
  8030e8:	89 c7                	mov    %eax,%edi
  8030ea:	48 b8 b6 3f 80 00 00 	movabs $0x803fb6,%rax
  8030f1:	00 00 00 
  8030f4:	ff d0                	callq  *%rax
  8030f6:	ba 00 00 00 00       	mov    $0x0,%edx
  8030fb:	be 00 00 00 00       	mov    $0x0,%esi
  803100:	bf 00 00 00 00       	mov    $0x0,%edi
  803105:	48 b8 f5 3e 80 00 00 	movabs $0x803ef5,%rax
  80310c:	00 00 00 
  80310f:	ff d0                	callq  *%rax
  803111:	c9                   	leaveq 
  803112:	c3                   	retq   

0000000000803113 <nsipc_accept>:
  803113:	55                   	push   %rbp
  803114:	48 89 e5             	mov    %rsp,%rbp
  803117:	48 83 ec 30          	sub    $0x30,%rsp
  80311b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80311e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803122:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803126:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80312d:	00 00 00 
  803130:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803133:	89 10                	mov    %edx,(%rax)
  803135:	bf 01 00 00 00       	mov    $0x1,%edi
  80313a:	48 b8 90 30 80 00 00 	movabs $0x803090,%rax
  803141:	00 00 00 
  803144:	ff d0                	callq  *%rax
  803146:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803149:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80314d:	78 3e                	js     80318d <nsipc_accept+0x7a>
  80314f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803156:	00 00 00 
  803159:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80315d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803161:	8b 40 10             	mov    0x10(%rax),%eax
  803164:	89 c2                	mov    %eax,%edx
  803166:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80316a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80316e:	48 89 ce             	mov    %rcx,%rsi
  803171:	48 89 c7             	mov    %rax,%rdi
  803174:	48 b8 96 12 80 00 00 	movabs $0x801296,%rax
  80317b:	00 00 00 
  80317e:	ff d0                	callq  *%rax
  803180:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803184:	8b 50 10             	mov    0x10(%rax),%edx
  803187:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80318b:	89 10                	mov    %edx,(%rax)
  80318d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803190:	c9                   	leaveq 
  803191:	c3                   	retq   

0000000000803192 <nsipc_bind>:
  803192:	55                   	push   %rbp
  803193:	48 89 e5             	mov    %rsp,%rbp
  803196:	48 83 ec 10          	sub    $0x10,%rsp
  80319a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80319d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8031a1:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8031a4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8031ab:	00 00 00 
  8031ae:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8031b1:	89 10                	mov    %edx,(%rax)
  8031b3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8031b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031ba:	48 89 c6             	mov    %rax,%rsi
  8031bd:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  8031c4:	00 00 00 
  8031c7:	48 b8 96 12 80 00 00 	movabs $0x801296,%rax
  8031ce:	00 00 00 
  8031d1:	ff d0                	callq  *%rax
  8031d3:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8031da:	00 00 00 
  8031dd:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8031e0:	89 50 14             	mov    %edx,0x14(%rax)
  8031e3:	bf 02 00 00 00       	mov    $0x2,%edi
  8031e8:	48 b8 90 30 80 00 00 	movabs $0x803090,%rax
  8031ef:	00 00 00 
  8031f2:	ff d0                	callq  *%rax
  8031f4:	c9                   	leaveq 
  8031f5:	c3                   	retq   

00000000008031f6 <nsipc_shutdown>:
  8031f6:	55                   	push   %rbp
  8031f7:	48 89 e5             	mov    %rsp,%rbp
  8031fa:	48 83 ec 10          	sub    $0x10,%rsp
  8031fe:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803201:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803204:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80320b:	00 00 00 
  80320e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803211:	89 10                	mov    %edx,(%rax)
  803213:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80321a:	00 00 00 
  80321d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803220:	89 50 04             	mov    %edx,0x4(%rax)
  803223:	bf 03 00 00 00       	mov    $0x3,%edi
  803228:	48 b8 90 30 80 00 00 	movabs $0x803090,%rax
  80322f:	00 00 00 
  803232:	ff d0                	callq  *%rax
  803234:	c9                   	leaveq 
  803235:	c3                   	retq   

0000000000803236 <nsipc_close>:
  803236:	55                   	push   %rbp
  803237:	48 89 e5             	mov    %rsp,%rbp
  80323a:	48 83 ec 10          	sub    $0x10,%rsp
  80323e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803241:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803248:	00 00 00 
  80324b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80324e:	89 10                	mov    %edx,(%rax)
  803250:	bf 04 00 00 00       	mov    $0x4,%edi
  803255:	48 b8 90 30 80 00 00 	movabs $0x803090,%rax
  80325c:	00 00 00 
  80325f:	ff d0                	callq  *%rax
  803261:	c9                   	leaveq 
  803262:	c3                   	retq   

0000000000803263 <nsipc_connect>:
  803263:	55                   	push   %rbp
  803264:	48 89 e5             	mov    %rsp,%rbp
  803267:	48 83 ec 10          	sub    $0x10,%rsp
  80326b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80326e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803272:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803275:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80327c:	00 00 00 
  80327f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803282:	89 10                	mov    %edx,(%rax)
  803284:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803287:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80328b:	48 89 c6             	mov    %rax,%rsi
  80328e:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  803295:	00 00 00 
  803298:	48 b8 96 12 80 00 00 	movabs $0x801296,%rax
  80329f:	00 00 00 
  8032a2:	ff d0                	callq  *%rax
  8032a4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032ab:	00 00 00 
  8032ae:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8032b1:	89 50 14             	mov    %edx,0x14(%rax)
  8032b4:	bf 05 00 00 00       	mov    $0x5,%edi
  8032b9:	48 b8 90 30 80 00 00 	movabs $0x803090,%rax
  8032c0:	00 00 00 
  8032c3:	ff d0                	callq  *%rax
  8032c5:	c9                   	leaveq 
  8032c6:	c3                   	retq   

00000000008032c7 <nsipc_listen>:
  8032c7:	55                   	push   %rbp
  8032c8:	48 89 e5             	mov    %rsp,%rbp
  8032cb:	48 83 ec 10          	sub    $0x10,%rsp
  8032cf:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8032d2:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8032d5:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032dc:	00 00 00 
  8032df:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8032e2:	89 10                	mov    %edx,(%rax)
  8032e4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032eb:	00 00 00 
  8032ee:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8032f1:	89 50 04             	mov    %edx,0x4(%rax)
  8032f4:	bf 06 00 00 00       	mov    $0x6,%edi
  8032f9:	48 b8 90 30 80 00 00 	movabs $0x803090,%rax
  803300:	00 00 00 
  803303:	ff d0                	callq  *%rax
  803305:	c9                   	leaveq 
  803306:	c3                   	retq   

0000000000803307 <nsipc_recv>:
  803307:	55                   	push   %rbp
  803308:	48 89 e5             	mov    %rsp,%rbp
  80330b:	48 83 ec 30          	sub    $0x30,%rsp
  80330f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803312:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803316:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803319:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80331c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803323:	00 00 00 
  803326:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803329:	89 10                	mov    %edx,(%rax)
  80332b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803332:	00 00 00 
  803335:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803338:	89 50 04             	mov    %edx,0x4(%rax)
  80333b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803342:	00 00 00 
  803345:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803348:	89 50 08             	mov    %edx,0x8(%rax)
  80334b:	bf 07 00 00 00       	mov    $0x7,%edi
  803350:	48 b8 90 30 80 00 00 	movabs $0x803090,%rax
  803357:	00 00 00 
  80335a:	ff d0                	callq  *%rax
  80335c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80335f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803363:	78 69                	js     8033ce <nsipc_recv+0xc7>
  803365:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  80336c:	7f 08                	jg     803376 <nsipc_recv+0x6f>
  80336e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803371:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803374:	7e 35                	jle    8033ab <nsipc_recv+0xa4>
  803376:	48 b9 91 48 80 00 00 	movabs $0x804891,%rcx
  80337d:	00 00 00 
  803380:	48 ba a6 48 80 00 00 	movabs $0x8048a6,%rdx
  803387:	00 00 00 
  80338a:	be 62 00 00 00       	mov    $0x62,%esi
  80338f:	48 bf bb 48 80 00 00 	movabs $0x8048bb,%rdi
  803396:	00 00 00 
  803399:	b8 00 00 00 00       	mov    $0x0,%eax
  80339e:	49 b8 e1 3d 80 00 00 	movabs $0x803de1,%r8
  8033a5:	00 00 00 
  8033a8:	41 ff d0             	callq  *%r8
  8033ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033ae:	48 63 d0             	movslq %eax,%rdx
  8033b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8033b5:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  8033bc:	00 00 00 
  8033bf:	48 89 c7             	mov    %rax,%rdi
  8033c2:	48 b8 96 12 80 00 00 	movabs $0x801296,%rax
  8033c9:	00 00 00 
  8033cc:	ff d0                	callq  *%rax
  8033ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033d1:	c9                   	leaveq 
  8033d2:	c3                   	retq   

00000000008033d3 <nsipc_send>:
  8033d3:	55                   	push   %rbp
  8033d4:	48 89 e5             	mov    %rsp,%rbp
  8033d7:	48 83 ec 20          	sub    $0x20,%rsp
  8033db:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8033de:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8033e2:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8033e5:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8033e8:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033ef:	00 00 00 
  8033f2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8033f5:	89 10                	mov    %edx,(%rax)
  8033f7:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  8033fe:	7e 35                	jle    803435 <nsipc_send+0x62>
  803400:	48 b9 ca 48 80 00 00 	movabs $0x8048ca,%rcx
  803407:	00 00 00 
  80340a:	48 ba a6 48 80 00 00 	movabs $0x8048a6,%rdx
  803411:	00 00 00 
  803414:	be 6d 00 00 00       	mov    $0x6d,%esi
  803419:	48 bf bb 48 80 00 00 	movabs $0x8048bb,%rdi
  803420:	00 00 00 
  803423:	b8 00 00 00 00       	mov    $0x0,%eax
  803428:	49 b8 e1 3d 80 00 00 	movabs $0x803de1,%r8
  80342f:	00 00 00 
  803432:	41 ff d0             	callq  *%r8
  803435:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803438:	48 63 d0             	movslq %eax,%rdx
  80343b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80343f:	48 89 c6             	mov    %rax,%rsi
  803442:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  803449:	00 00 00 
  80344c:	48 b8 96 12 80 00 00 	movabs $0x801296,%rax
  803453:	00 00 00 
  803456:	ff d0                	callq  *%rax
  803458:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80345f:	00 00 00 
  803462:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803465:	89 50 04             	mov    %edx,0x4(%rax)
  803468:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80346f:	00 00 00 
  803472:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803475:	89 50 08             	mov    %edx,0x8(%rax)
  803478:	bf 08 00 00 00       	mov    $0x8,%edi
  80347d:	48 b8 90 30 80 00 00 	movabs $0x803090,%rax
  803484:	00 00 00 
  803487:	ff d0                	callq  *%rax
  803489:	c9                   	leaveq 
  80348a:	c3                   	retq   

000000000080348b <nsipc_socket>:
  80348b:	55                   	push   %rbp
  80348c:	48 89 e5             	mov    %rsp,%rbp
  80348f:	48 83 ec 10          	sub    $0x10,%rsp
  803493:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803496:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803499:	89 55 f4             	mov    %edx,-0xc(%rbp)
  80349c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8034a3:	00 00 00 
  8034a6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8034a9:	89 10                	mov    %edx,(%rax)
  8034ab:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8034b2:	00 00 00 
  8034b5:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8034b8:	89 50 04             	mov    %edx,0x4(%rax)
  8034bb:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8034c2:	00 00 00 
  8034c5:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8034c8:	89 50 08             	mov    %edx,0x8(%rax)
  8034cb:	bf 09 00 00 00       	mov    $0x9,%edi
  8034d0:	48 b8 90 30 80 00 00 	movabs $0x803090,%rax
  8034d7:	00 00 00 
  8034da:	ff d0                	callq  *%rax
  8034dc:	c9                   	leaveq 
  8034dd:	c3                   	retq   

00000000008034de <pipe>:
  8034de:	55                   	push   %rbp
  8034df:	48 89 e5             	mov    %rsp,%rbp
  8034e2:	53                   	push   %rbx
  8034e3:	48 83 ec 38          	sub    $0x38,%rsp
  8034e7:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8034eb:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8034ef:	48 89 c7             	mov    %rax,%rdi
  8034f2:	48 b8 eb 1c 80 00 00 	movabs $0x801ceb,%rax
  8034f9:	00 00 00 
  8034fc:	ff d0                	callq  *%rax
  8034fe:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803501:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803505:	0f 88 bf 01 00 00    	js     8036ca <pipe+0x1ec>
  80350b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80350f:	ba 07 04 00 00       	mov    $0x407,%edx
  803514:	48 89 c6             	mov    %rax,%rsi
  803517:	bf 00 00 00 00       	mov    $0x0,%edi
  80351c:	48 b8 a1 18 80 00 00 	movabs $0x8018a1,%rax
  803523:	00 00 00 
  803526:	ff d0                	callq  *%rax
  803528:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80352b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80352f:	0f 88 95 01 00 00    	js     8036ca <pipe+0x1ec>
  803535:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803539:	48 89 c7             	mov    %rax,%rdi
  80353c:	48 b8 eb 1c 80 00 00 	movabs $0x801ceb,%rax
  803543:	00 00 00 
  803546:	ff d0                	callq  *%rax
  803548:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80354b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80354f:	0f 88 5d 01 00 00    	js     8036b2 <pipe+0x1d4>
  803555:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803559:	ba 07 04 00 00       	mov    $0x407,%edx
  80355e:	48 89 c6             	mov    %rax,%rsi
  803561:	bf 00 00 00 00       	mov    $0x0,%edi
  803566:	48 b8 a1 18 80 00 00 	movabs $0x8018a1,%rax
  80356d:	00 00 00 
  803570:	ff d0                	callq  *%rax
  803572:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803575:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803579:	0f 88 33 01 00 00    	js     8036b2 <pipe+0x1d4>
  80357f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803583:	48 89 c7             	mov    %rax,%rdi
  803586:	48 b8 c0 1c 80 00 00 	movabs $0x801cc0,%rax
  80358d:	00 00 00 
  803590:	ff d0                	callq  *%rax
  803592:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803596:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80359a:	ba 07 04 00 00       	mov    $0x407,%edx
  80359f:	48 89 c6             	mov    %rax,%rsi
  8035a2:	bf 00 00 00 00       	mov    $0x0,%edi
  8035a7:	48 b8 a1 18 80 00 00 	movabs $0x8018a1,%rax
  8035ae:	00 00 00 
  8035b1:	ff d0                	callq  *%rax
  8035b3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8035b6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8035ba:	0f 88 d9 00 00 00    	js     803699 <pipe+0x1bb>
  8035c0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8035c4:	48 89 c7             	mov    %rax,%rdi
  8035c7:	48 b8 c0 1c 80 00 00 	movabs $0x801cc0,%rax
  8035ce:	00 00 00 
  8035d1:	ff d0                	callq  *%rax
  8035d3:	48 89 c2             	mov    %rax,%rdx
  8035d6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8035da:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8035e0:	48 89 d1             	mov    %rdx,%rcx
  8035e3:	ba 00 00 00 00       	mov    $0x0,%edx
  8035e8:	48 89 c6             	mov    %rax,%rsi
  8035eb:	bf 00 00 00 00       	mov    $0x0,%edi
  8035f0:	48 b8 f3 18 80 00 00 	movabs $0x8018f3,%rax
  8035f7:	00 00 00 
  8035fa:	ff d0                	callq  *%rax
  8035fc:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8035ff:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803603:	78 79                	js     80367e <pipe+0x1a0>
  803605:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803609:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803610:	00 00 00 
  803613:	8b 12                	mov    (%rdx),%edx
  803615:	89 10                	mov    %edx,(%rax)
  803617:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80361b:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803622:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803626:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  80362d:	00 00 00 
  803630:	8b 12                	mov    (%rdx),%edx
  803632:	89 10                	mov    %edx,(%rax)
  803634:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803638:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  80363f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803643:	48 89 c7             	mov    %rax,%rdi
  803646:	48 b8 9d 1c 80 00 00 	movabs $0x801c9d,%rax
  80364d:	00 00 00 
  803650:	ff d0                	callq  *%rax
  803652:	89 c2                	mov    %eax,%edx
  803654:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803658:	89 10                	mov    %edx,(%rax)
  80365a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80365e:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803662:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803666:	48 89 c7             	mov    %rax,%rdi
  803669:	48 b8 9d 1c 80 00 00 	movabs $0x801c9d,%rax
  803670:	00 00 00 
  803673:	ff d0                	callq  *%rax
  803675:	89 03                	mov    %eax,(%rbx)
  803677:	b8 00 00 00 00       	mov    $0x0,%eax
  80367c:	eb 4f                	jmp    8036cd <pipe+0x1ef>
  80367e:	90                   	nop
  80367f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803683:	48 89 c6             	mov    %rax,%rsi
  803686:	bf 00 00 00 00       	mov    $0x0,%edi
  80368b:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  803692:	00 00 00 
  803695:	ff d0                	callq  *%rax
  803697:	eb 01                	jmp    80369a <pipe+0x1bc>
  803699:	90                   	nop
  80369a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80369e:	48 89 c6             	mov    %rax,%rsi
  8036a1:	bf 00 00 00 00       	mov    $0x0,%edi
  8036a6:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  8036ad:	00 00 00 
  8036b0:	ff d0                	callq  *%rax
  8036b2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8036b6:	48 89 c6             	mov    %rax,%rsi
  8036b9:	bf 00 00 00 00       	mov    $0x0,%edi
  8036be:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  8036c5:	00 00 00 
  8036c8:	ff d0                	callq  *%rax
  8036ca:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036cd:	48 83 c4 38          	add    $0x38,%rsp
  8036d1:	5b                   	pop    %rbx
  8036d2:	5d                   	pop    %rbp
  8036d3:	c3                   	retq   

00000000008036d4 <_pipeisclosed>:
  8036d4:	55                   	push   %rbp
  8036d5:	48 89 e5             	mov    %rsp,%rbp
  8036d8:	53                   	push   %rbx
  8036d9:	48 83 ec 28          	sub    $0x28,%rsp
  8036dd:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8036e1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8036e5:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8036ec:	00 00 00 
  8036ef:	48 8b 00             	mov    (%rax),%rax
  8036f2:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  8036f8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8036fb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8036ff:	48 89 c7             	mov    %rax,%rdi
  803702:	48 b8 31 41 80 00 00 	movabs $0x804131,%rax
  803709:	00 00 00 
  80370c:	ff d0                	callq  *%rax
  80370e:	89 c3                	mov    %eax,%ebx
  803710:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803714:	48 89 c7             	mov    %rax,%rdi
  803717:	48 b8 31 41 80 00 00 	movabs $0x804131,%rax
  80371e:	00 00 00 
  803721:	ff d0                	callq  *%rax
  803723:	39 c3                	cmp    %eax,%ebx
  803725:	0f 94 c0             	sete   %al
  803728:	0f b6 c0             	movzbl %al,%eax
  80372b:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80372e:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803735:	00 00 00 
  803738:	48 8b 00             	mov    (%rax),%rax
  80373b:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803741:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803744:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803747:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80374a:	75 05                	jne    803751 <_pipeisclosed+0x7d>
  80374c:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80374f:	eb 4a                	jmp    80379b <_pipeisclosed+0xc7>
  803751:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803754:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803757:	74 8c                	je     8036e5 <_pipeisclosed+0x11>
  803759:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  80375d:	75 86                	jne    8036e5 <_pipeisclosed+0x11>
  80375f:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803766:	00 00 00 
  803769:	48 8b 00             	mov    (%rax),%rax
  80376c:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803772:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803775:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803778:	89 c6                	mov    %eax,%esi
  80377a:	48 bf db 48 80 00 00 	movabs $0x8048db,%rdi
  803781:	00 00 00 
  803784:	b8 00 00 00 00       	mov    $0x0,%eax
  803789:	49 b8 e1 03 80 00 00 	movabs $0x8003e1,%r8
  803790:	00 00 00 
  803793:	41 ff d0             	callq  *%r8
  803796:	e9 4a ff ff ff       	jmpq   8036e5 <_pipeisclosed+0x11>
  80379b:	48 83 c4 28          	add    $0x28,%rsp
  80379f:	5b                   	pop    %rbx
  8037a0:	5d                   	pop    %rbp
  8037a1:	c3                   	retq   

00000000008037a2 <pipeisclosed>:
  8037a2:	55                   	push   %rbp
  8037a3:	48 89 e5             	mov    %rsp,%rbp
  8037a6:	48 83 ec 30          	sub    $0x30,%rsp
  8037aa:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8037ad:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8037b1:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8037b4:	48 89 d6             	mov    %rdx,%rsi
  8037b7:	89 c7                	mov    %eax,%edi
  8037b9:	48 b8 83 1d 80 00 00 	movabs $0x801d83,%rax
  8037c0:	00 00 00 
  8037c3:	ff d0                	callq  *%rax
  8037c5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037c8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037cc:	79 05                	jns    8037d3 <pipeisclosed+0x31>
  8037ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037d1:	eb 31                	jmp    803804 <pipeisclosed+0x62>
  8037d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037d7:	48 89 c7             	mov    %rax,%rdi
  8037da:	48 b8 c0 1c 80 00 00 	movabs $0x801cc0,%rax
  8037e1:	00 00 00 
  8037e4:	ff d0                	callq  *%rax
  8037e6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8037ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037ee:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8037f2:	48 89 d6             	mov    %rdx,%rsi
  8037f5:	48 89 c7             	mov    %rax,%rdi
  8037f8:	48 b8 d4 36 80 00 00 	movabs $0x8036d4,%rax
  8037ff:	00 00 00 
  803802:	ff d0                	callq  *%rax
  803804:	c9                   	leaveq 
  803805:	c3                   	retq   

0000000000803806 <devpipe_read>:
  803806:	55                   	push   %rbp
  803807:	48 89 e5             	mov    %rsp,%rbp
  80380a:	48 83 ec 40          	sub    $0x40,%rsp
  80380e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803812:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803816:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80381a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80381e:	48 89 c7             	mov    %rax,%rdi
  803821:	48 b8 c0 1c 80 00 00 	movabs $0x801cc0,%rax
  803828:	00 00 00 
  80382b:	ff d0                	callq  *%rax
  80382d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803831:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803835:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803839:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803840:	00 
  803841:	e9 90 00 00 00       	jmpq   8038d6 <devpipe_read+0xd0>
  803846:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  80384b:	74 09                	je     803856 <devpipe_read+0x50>
  80384d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803851:	e9 8e 00 00 00       	jmpq   8038e4 <devpipe_read+0xde>
  803856:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80385a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80385e:	48 89 d6             	mov    %rdx,%rsi
  803861:	48 89 c7             	mov    %rax,%rdi
  803864:	48 b8 d4 36 80 00 00 	movabs $0x8036d4,%rax
  80386b:	00 00 00 
  80386e:	ff d0                	callq  *%rax
  803870:	85 c0                	test   %eax,%eax
  803872:	74 07                	je     80387b <devpipe_read+0x75>
  803874:	b8 00 00 00 00       	mov    $0x0,%eax
  803879:	eb 69                	jmp    8038e4 <devpipe_read+0xde>
  80387b:	48 b8 64 18 80 00 00 	movabs $0x801864,%rax
  803882:	00 00 00 
  803885:	ff d0                	callq  *%rax
  803887:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80388b:	8b 10                	mov    (%rax),%edx
  80388d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803891:	8b 40 04             	mov    0x4(%rax),%eax
  803894:	39 c2                	cmp    %eax,%edx
  803896:	74 ae                	je     803846 <devpipe_read+0x40>
  803898:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80389c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038a0:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8038a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038a8:	8b 00                	mov    (%rax),%eax
  8038aa:	99                   	cltd   
  8038ab:	c1 ea 1b             	shr    $0x1b,%edx
  8038ae:	01 d0                	add    %edx,%eax
  8038b0:	83 e0 1f             	and    $0x1f,%eax
  8038b3:	29 d0                	sub    %edx,%eax
  8038b5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8038b9:	48 98                	cltq   
  8038bb:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8038c0:	88 01                	mov    %al,(%rcx)
  8038c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038c6:	8b 00                	mov    (%rax),%eax
  8038c8:	8d 50 01             	lea    0x1(%rax),%edx
  8038cb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038cf:	89 10                	mov    %edx,(%rax)
  8038d1:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8038d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038da:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8038de:	72 a7                	jb     803887 <devpipe_read+0x81>
  8038e0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038e4:	c9                   	leaveq 
  8038e5:	c3                   	retq   

00000000008038e6 <devpipe_write>:
  8038e6:	55                   	push   %rbp
  8038e7:	48 89 e5             	mov    %rsp,%rbp
  8038ea:	48 83 ec 40          	sub    $0x40,%rsp
  8038ee:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8038f2:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8038f6:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8038fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8038fe:	48 89 c7             	mov    %rax,%rdi
  803901:	48 b8 c0 1c 80 00 00 	movabs $0x801cc0,%rax
  803908:	00 00 00 
  80390b:	ff d0                	callq  *%rax
  80390d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803911:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803915:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803919:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803920:	00 
  803921:	e9 8f 00 00 00       	jmpq   8039b5 <devpipe_write+0xcf>
  803926:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80392a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80392e:	48 89 d6             	mov    %rdx,%rsi
  803931:	48 89 c7             	mov    %rax,%rdi
  803934:	48 b8 d4 36 80 00 00 	movabs $0x8036d4,%rax
  80393b:	00 00 00 
  80393e:	ff d0                	callq  *%rax
  803940:	85 c0                	test   %eax,%eax
  803942:	74 07                	je     80394b <devpipe_write+0x65>
  803944:	b8 00 00 00 00       	mov    $0x0,%eax
  803949:	eb 78                	jmp    8039c3 <devpipe_write+0xdd>
  80394b:	48 b8 64 18 80 00 00 	movabs $0x801864,%rax
  803952:	00 00 00 
  803955:	ff d0                	callq  *%rax
  803957:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80395b:	8b 40 04             	mov    0x4(%rax),%eax
  80395e:	48 63 d0             	movslq %eax,%rdx
  803961:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803965:	8b 00                	mov    (%rax),%eax
  803967:	48 98                	cltq   
  803969:	48 83 c0 20          	add    $0x20,%rax
  80396d:	48 39 c2             	cmp    %rax,%rdx
  803970:	73 b4                	jae    803926 <devpipe_write+0x40>
  803972:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803976:	8b 40 04             	mov    0x4(%rax),%eax
  803979:	99                   	cltd   
  80397a:	c1 ea 1b             	shr    $0x1b,%edx
  80397d:	01 d0                	add    %edx,%eax
  80397f:	83 e0 1f             	and    $0x1f,%eax
  803982:	29 d0                	sub    %edx,%eax
  803984:	89 c6                	mov    %eax,%esi
  803986:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80398a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80398e:	48 01 d0             	add    %rdx,%rax
  803991:	0f b6 08             	movzbl (%rax),%ecx
  803994:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803998:	48 63 c6             	movslq %esi,%rax
  80399b:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80399f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039a3:	8b 40 04             	mov    0x4(%rax),%eax
  8039a6:	8d 50 01             	lea    0x1(%rax),%edx
  8039a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039ad:	89 50 04             	mov    %edx,0x4(%rax)
  8039b0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8039b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039b9:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8039bd:	72 98                	jb     803957 <devpipe_write+0x71>
  8039bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039c3:	c9                   	leaveq 
  8039c4:	c3                   	retq   

00000000008039c5 <devpipe_stat>:
  8039c5:	55                   	push   %rbp
  8039c6:	48 89 e5             	mov    %rsp,%rbp
  8039c9:	48 83 ec 20          	sub    $0x20,%rsp
  8039cd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8039d1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8039d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039d9:	48 89 c7             	mov    %rax,%rdi
  8039dc:	48 b8 c0 1c 80 00 00 	movabs $0x801cc0,%rax
  8039e3:	00 00 00 
  8039e6:	ff d0                	callq  *%rax
  8039e8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8039ec:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8039f0:	48 be ee 48 80 00 00 	movabs $0x8048ee,%rsi
  8039f7:	00 00 00 
  8039fa:	48 89 c7             	mov    %rax,%rdi
  8039fd:	48 b8 71 0f 80 00 00 	movabs $0x800f71,%rax
  803a04:	00 00 00 
  803a07:	ff d0                	callq  *%rax
  803a09:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a0d:	8b 50 04             	mov    0x4(%rax),%edx
  803a10:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a14:	8b 00                	mov    (%rax),%eax
  803a16:	29 c2                	sub    %eax,%edx
  803a18:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a1c:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803a22:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a26:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803a2d:	00 00 00 
  803a30:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a34:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  803a3b:	00 00 00 
  803a3e:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  803a45:	b8 00 00 00 00       	mov    $0x0,%eax
  803a4a:	c9                   	leaveq 
  803a4b:	c3                   	retq   

0000000000803a4c <devpipe_close>:
  803a4c:	55                   	push   %rbp
  803a4d:	48 89 e5             	mov    %rsp,%rbp
  803a50:	48 83 ec 10          	sub    $0x10,%rsp
  803a54:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803a58:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a5c:	48 89 c6             	mov    %rax,%rsi
  803a5f:	bf 00 00 00 00       	mov    $0x0,%edi
  803a64:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  803a6b:	00 00 00 
  803a6e:	ff d0                	callq  *%rax
  803a70:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a74:	48 89 c7             	mov    %rax,%rdi
  803a77:	48 b8 c0 1c 80 00 00 	movabs $0x801cc0,%rax
  803a7e:	00 00 00 
  803a81:	ff d0                	callq  *%rax
  803a83:	48 89 c6             	mov    %rax,%rsi
  803a86:	bf 00 00 00 00       	mov    $0x0,%edi
  803a8b:	48 b8 53 19 80 00 00 	movabs $0x801953,%rax
  803a92:	00 00 00 
  803a95:	ff d0                	callq  *%rax
  803a97:	c9                   	leaveq 
  803a98:	c3                   	retq   

0000000000803a99 <wait>:
  803a99:	55                   	push   %rbp
  803a9a:	48 89 e5             	mov    %rsp,%rbp
  803a9d:	48 83 ec 20          	sub    $0x20,%rsp
  803aa1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803aa4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803aa8:	75 35                	jne    803adf <wait+0x46>
  803aaa:	48 b9 f5 48 80 00 00 	movabs $0x8048f5,%rcx
  803ab1:	00 00 00 
  803ab4:	48 ba 00 49 80 00 00 	movabs $0x804900,%rdx
  803abb:	00 00 00 
  803abe:	be 0a 00 00 00       	mov    $0xa,%esi
  803ac3:	48 bf 15 49 80 00 00 	movabs $0x804915,%rdi
  803aca:	00 00 00 
  803acd:	b8 00 00 00 00       	mov    $0x0,%eax
  803ad2:	49 b8 e1 3d 80 00 00 	movabs $0x803de1,%r8
  803ad9:	00 00 00 
  803adc:	41 ff d0             	callq  *%r8
  803adf:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ae2:	25 ff 03 00 00       	and    $0x3ff,%eax
  803ae7:	48 98                	cltq   
  803ae9:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  803af0:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803af7:	00 00 00 
  803afa:	48 01 d0             	add    %rdx,%rax
  803afd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803b01:	eb 0c                	jmp    803b0f <wait+0x76>
  803b03:	48 b8 64 18 80 00 00 	movabs $0x801864,%rax
  803b0a:	00 00 00 
  803b0d:	ff d0                	callq  *%rax
  803b0f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b13:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803b19:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  803b1c:	75 0e                	jne    803b2c <wait+0x93>
  803b1e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b22:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  803b28:	85 c0                	test   %eax,%eax
  803b2a:	75 d7                	jne    803b03 <wait+0x6a>
  803b2c:	90                   	nop
  803b2d:	c9                   	leaveq 
  803b2e:	c3                   	retq   

0000000000803b2f <cputchar>:
  803b2f:	55                   	push   %rbp
  803b30:	48 89 e5             	mov    %rsp,%rbp
  803b33:	48 83 ec 20          	sub    $0x20,%rsp
  803b37:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b3a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b3d:	88 45 ff             	mov    %al,-0x1(%rbp)
  803b40:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  803b44:	be 01 00 00 00       	mov    $0x1,%esi
  803b49:	48 89 c7             	mov    %rax,%rdi
  803b4c:	48 b8 59 17 80 00 00 	movabs $0x801759,%rax
  803b53:	00 00 00 
  803b56:	ff d0                	callq  *%rax
  803b58:	90                   	nop
  803b59:	c9                   	leaveq 
  803b5a:	c3                   	retq   

0000000000803b5b <getchar>:
  803b5b:	55                   	push   %rbp
  803b5c:	48 89 e5             	mov    %rsp,%rbp
  803b5f:	48 83 ec 10          	sub    $0x10,%rsp
  803b63:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  803b67:	ba 01 00 00 00       	mov    $0x1,%edx
  803b6c:	48 89 c6             	mov    %rax,%rsi
  803b6f:	bf 00 00 00 00       	mov    $0x0,%edi
  803b74:	48 b8 b8 21 80 00 00 	movabs $0x8021b8,%rax
  803b7b:	00 00 00 
  803b7e:	ff d0                	callq  *%rax
  803b80:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b83:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b87:	79 05                	jns    803b8e <getchar+0x33>
  803b89:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b8c:	eb 14                	jmp    803ba2 <getchar+0x47>
  803b8e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b92:	7f 07                	jg     803b9b <getchar+0x40>
  803b94:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  803b99:	eb 07                	jmp    803ba2 <getchar+0x47>
  803b9b:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  803b9f:	0f b6 c0             	movzbl %al,%eax
  803ba2:	c9                   	leaveq 
  803ba3:	c3                   	retq   

0000000000803ba4 <iscons>:
  803ba4:	55                   	push   %rbp
  803ba5:	48 89 e5             	mov    %rsp,%rbp
  803ba8:	48 83 ec 20          	sub    $0x20,%rsp
  803bac:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803baf:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803bb3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bb6:	48 89 d6             	mov    %rdx,%rsi
  803bb9:	89 c7                	mov    %eax,%edi
  803bbb:	48 b8 83 1d 80 00 00 	movabs $0x801d83,%rax
  803bc2:	00 00 00 
  803bc5:	ff d0                	callq  *%rax
  803bc7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bca:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bce:	79 05                	jns    803bd5 <iscons+0x31>
  803bd0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bd3:	eb 1a                	jmp    803bef <iscons+0x4b>
  803bd5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bd9:	8b 10                	mov    (%rax),%edx
  803bdb:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  803be2:	00 00 00 
  803be5:	8b 00                	mov    (%rax),%eax
  803be7:	39 c2                	cmp    %eax,%edx
  803be9:	0f 94 c0             	sete   %al
  803bec:	0f b6 c0             	movzbl %al,%eax
  803bef:	c9                   	leaveq 
  803bf0:	c3                   	retq   

0000000000803bf1 <opencons>:
  803bf1:	55                   	push   %rbp
  803bf2:	48 89 e5             	mov    %rsp,%rbp
  803bf5:	48 83 ec 10          	sub    $0x10,%rsp
  803bf9:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803bfd:	48 89 c7             	mov    %rax,%rdi
  803c00:	48 b8 eb 1c 80 00 00 	movabs $0x801ceb,%rax
  803c07:	00 00 00 
  803c0a:	ff d0                	callq  *%rax
  803c0c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c0f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c13:	79 05                	jns    803c1a <opencons+0x29>
  803c15:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c18:	eb 5b                	jmp    803c75 <opencons+0x84>
  803c1a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c1e:	ba 07 04 00 00       	mov    $0x407,%edx
  803c23:	48 89 c6             	mov    %rax,%rsi
  803c26:	bf 00 00 00 00       	mov    $0x0,%edi
  803c2b:	48 b8 a1 18 80 00 00 	movabs $0x8018a1,%rax
  803c32:	00 00 00 
  803c35:	ff d0                	callq  *%rax
  803c37:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c3a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c3e:	79 05                	jns    803c45 <opencons+0x54>
  803c40:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c43:	eb 30                	jmp    803c75 <opencons+0x84>
  803c45:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c49:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  803c50:	00 00 00 
  803c53:	8b 12                	mov    (%rdx),%edx
  803c55:	89 10                	mov    %edx,(%rax)
  803c57:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c5b:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803c62:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c66:	48 89 c7             	mov    %rax,%rdi
  803c69:	48 b8 9d 1c 80 00 00 	movabs $0x801c9d,%rax
  803c70:	00 00 00 
  803c73:	ff d0                	callq  *%rax
  803c75:	c9                   	leaveq 
  803c76:	c3                   	retq   

0000000000803c77 <devcons_read>:
  803c77:	55                   	push   %rbp
  803c78:	48 89 e5             	mov    %rsp,%rbp
  803c7b:	48 83 ec 30          	sub    $0x30,%rsp
  803c7f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803c83:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c87:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803c8b:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803c90:	75 13                	jne    803ca5 <devcons_read+0x2e>
  803c92:	b8 00 00 00 00       	mov    $0x0,%eax
  803c97:	eb 49                	jmp    803ce2 <devcons_read+0x6b>
  803c99:	48 b8 64 18 80 00 00 	movabs $0x801864,%rax
  803ca0:	00 00 00 
  803ca3:	ff d0                	callq  *%rax
  803ca5:	48 b8 a6 17 80 00 00 	movabs $0x8017a6,%rax
  803cac:	00 00 00 
  803caf:	ff d0                	callq  *%rax
  803cb1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803cb4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cb8:	74 df                	je     803c99 <devcons_read+0x22>
  803cba:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cbe:	79 05                	jns    803cc5 <devcons_read+0x4e>
  803cc0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cc3:	eb 1d                	jmp    803ce2 <devcons_read+0x6b>
  803cc5:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  803cc9:	75 07                	jne    803cd2 <devcons_read+0x5b>
  803ccb:	b8 00 00 00 00       	mov    $0x0,%eax
  803cd0:	eb 10                	jmp    803ce2 <devcons_read+0x6b>
  803cd2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cd5:	89 c2                	mov    %eax,%edx
  803cd7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803cdb:	88 10                	mov    %dl,(%rax)
  803cdd:	b8 01 00 00 00       	mov    $0x1,%eax
  803ce2:	c9                   	leaveq 
  803ce3:	c3                   	retq   

0000000000803ce4 <devcons_write>:
  803ce4:	55                   	push   %rbp
  803ce5:	48 89 e5             	mov    %rsp,%rbp
  803ce8:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  803cef:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  803cf6:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  803cfd:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  803d04:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803d0b:	eb 76                	jmp    803d83 <devcons_write+0x9f>
  803d0d:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  803d14:	89 c2                	mov    %eax,%edx
  803d16:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d19:	29 c2                	sub    %eax,%edx
  803d1b:	89 d0                	mov    %edx,%eax
  803d1d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803d20:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d23:	83 f8 7f             	cmp    $0x7f,%eax
  803d26:	76 07                	jbe    803d2f <devcons_write+0x4b>
  803d28:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  803d2f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d32:	48 63 d0             	movslq %eax,%rdx
  803d35:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d38:	48 63 c8             	movslq %eax,%rcx
  803d3b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  803d42:	48 01 c1             	add    %rax,%rcx
  803d45:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803d4c:	48 89 ce             	mov    %rcx,%rsi
  803d4f:	48 89 c7             	mov    %rax,%rdi
  803d52:	48 b8 96 12 80 00 00 	movabs $0x801296,%rax
  803d59:	00 00 00 
  803d5c:	ff d0                	callq  *%rax
  803d5e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d61:	48 63 d0             	movslq %eax,%rdx
  803d64:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803d6b:	48 89 d6             	mov    %rdx,%rsi
  803d6e:	48 89 c7             	mov    %rax,%rdi
  803d71:	48 b8 59 17 80 00 00 	movabs $0x801759,%rax
  803d78:	00 00 00 
  803d7b:	ff d0                	callq  *%rax
  803d7d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d80:	01 45 fc             	add    %eax,-0x4(%rbp)
  803d83:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d86:	48 98                	cltq   
  803d88:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  803d8f:	0f 82 78 ff ff ff    	jb     803d0d <devcons_write+0x29>
  803d95:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d98:	c9                   	leaveq 
  803d99:	c3                   	retq   

0000000000803d9a <devcons_close>:
  803d9a:	55                   	push   %rbp
  803d9b:	48 89 e5             	mov    %rsp,%rbp
  803d9e:	48 83 ec 08          	sub    $0x8,%rsp
  803da2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803da6:	b8 00 00 00 00       	mov    $0x0,%eax
  803dab:	c9                   	leaveq 
  803dac:	c3                   	retq   

0000000000803dad <devcons_stat>:
  803dad:	55                   	push   %rbp
  803dae:	48 89 e5             	mov    %rsp,%rbp
  803db1:	48 83 ec 10          	sub    $0x10,%rsp
  803db5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803db9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803dbd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dc1:	48 be 28 49 80 00 00 	movabs $0x804928,%rsi
  803dc8:	00 00 00 
  803dcb:	48 89 c7             	mov    %rax,%rdi
  803dce:	48 b8 71 0f 80 00 00 	movabs $0x800f71,%rax
  803dd5:	00 00 00 
  803dd8:	ff d0                	callq  *%rax
  803dda:	b8 00 00 00 00       	mov    $0x0,%eax
  803ddf:	c9                   	leaveq 
  803de0:	c3                   	retq   

0000000000803de1 <_panic>:
  803de1:	55                   	push   %rbp
  803de2:	48 89 e5             	mov    %rsp,%rbp
  803de5:	53                   	push   %rbx
  803de6:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  803ded:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  803df4:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  803dfa:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803e01:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  803e08:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  803e0f:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  803e16:	84 c0                	test   %al,%al
  803e18:	74 23                	je     803e3d <_panic+0x5c>
  803e1a:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  803e21:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  803e25:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  803e29:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  803e2d:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  803e31:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  803e35:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  803e39:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  803e3d:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  803e44:	00 00 00 
  803e47:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  803e4e:	00 00 00 
  803e51:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803e55:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  803e5c:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  803e63:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803e6a:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  803e71:	00 00 00 
  803e74:	48 8b 18             	mov    (%rax),%rbx
  803e77:	48 b8 28 18 80 00 00 	movabs $0x801828,%rax
  803e7e:	00 00 00 
  803e81:	ff d0                	callq  *%rax
  803e83:	89 c6                	mov    %eax,%esi
  803e85:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  803e8b:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803e92:	41 89 d0             	mov    %edx,%r8d
  803e95:	48 89 c1             	mov    %rax,%rcx
  803e98:	48 89 da             	mov    %rbx,%rdx
  803e9b:	48 bf 30 49 80 00 00 	movabs $0x804930,%rdi
  803ea2:	00 00 00 
  803ea5:	b8 00 00 00 00       	mov    $0x0,%eax
  803eaa:	49 b9 e1 03 80 00 00 	movabs $0x8003e1,%r9
  803eb1:	00 00 00 
  803eb4:	41 ff d1             	callq  *%r9
  803eb7:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  803ebe:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  803ec5:	48 89 d6             	mov    %rdx,%rsi
  803ec8:	48 89 c7             	mov    %rax,%rdi
  803ecb:	48 b8 35 03 80 00 00 	movabs $0x800335,%rax
  803ed2:	00 00 00 
  803ed5:	ff d0                	callq  *%rax
  803ed7:	48 bf 53 49 80 00 00 	movabs $0x804953,%rdi
  803ede:	00 00 00 
  803ee1:	b8 00 00 00 00       	mov    $0x0,%eax
  803ee6:	48 ba e1 03 80 00 00 	movabs $0x8003e1,%rdx
  803eed:	00 00 00 
  803ef0:	ff d2                	callq  *%rdx
  803ef2:	cc                   	int3   
  803ef3:	eb fd                	jmp    803ef2 <_panic+0x111>

0000000000803ef5 <ipc_recv>:
  803ef5:	55                   	push   %rbp
  803ef6:	48 89 e5             	mov    %rsp,%rbp
  803ef9:	48 83 ec 30          	sub    $0x30,%rsp
  803efd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803f01:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f05:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803f09:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803f0e:	75 0e                	jne    803f1e <ipc_recv+0x29>
  803f10:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803f17:	00 00 00 
  803f1a:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803f1e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f22:	48 89 c7             	mov    %rax,%rdi
  803f25:	48 b8 db 1a 80 00 00 	movabs $0x801adb,%rax
  803f2c:	00 00 00 
  803f2f:	ff d0                	callq  *%rax
  803f31:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f34:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f38:	79 27                	jns    803f61 <ipc_recv+0x6c>
  803f3a:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803f3f:	74 0a                	je     803f4b <ipc_recv+0x56>
  803f41:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f45:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803f4b:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803f50:	74 0a                	je     803f5c <ipc_recv+0x67>
  803f52:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f56:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803f5c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f5f:	eb 53                	jmp    803fb4 <ipc_recv+0xbf>
  803f61:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803f66:	74 19                	je     803f81 <ipc_recv+0x8c>
  803f68:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803f6f:	00 00 00 
  803f72:	48 8b 00             	mov    (%rax),%rax
  803f75:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  803f7b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f7f:	89 10                	mov    %edx,(%rax)
  803f81:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803f86:	74 19                	je     803fa1 <ipc_recv+0xac>
  803f88:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803f8f:	00 00 00 
  803f92:	48 8b 00             	mov    (%rax),%rax
  803f95:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  803f9b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f9f:	89 10                	mov    %edx,(%rax)
  803fa1:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803fa8:	00 00 00 
  803fab:	48 8b 00             	mov    (%rax),%rax
  803fae:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  803fb4:	c9                   	leaveq 
  803fb5:	c3                   	retq   

0000000000803fb6 <ipc_send>:
  803fb6:	55                   	push   %rbp
  803fb7:	48 89 e5             	mov    %rsp,%rbp
  803fba:	48 83 ec 30          	sub    $0x30,%rsp
  803fbe:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803fc1:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803fc4:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  803fc8:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803fcb:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803fd0:	75 1c                	jne    803fee <ipc_send+0x38>
  803fd2:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803fd9:	00 00 00 
  803fdc:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803fe0:	eb 0c                	jmp    803fee <ipc_send+0x38>
  803fe2:	48 b8 64 18 80 00 00 	movabs $0x801864,%rax
  803fe9:	00 00 00 
  803fec:	ff d0                	callq  *%rax
  803fee:	8b 75 e8             	mov    -0x18(%rbp),%esi
  803ff1:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  803ff4:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803ff8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ffb:	89 c7                	mov    %eax,%edi
  803ffd:	48 b8 84 1a 80 00 00 	movabs $0x801a84,%rax
  804004:	00 00 00 
  804007:	ff d0                	callq  *%rax
  804009:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80400c:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804010:	74 d0                	je     803fe2 <ipc_send+0x2c>
  804012:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804016:	79 30                	jns    804048 <ipc_send+0x92>
  804018:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80401b:	89 c1                	mov    %eax,%ecx
  80401d:	48 ba 58 49 80 00 00 	movabs $0x804958,%rdx
  804024:	00 00 00 
  804027:	be 44 00 00 00       	mov    $0x44,%esi
  80402c:	48 bf 6e 49 80 00 00 	movabs $0x80496e,%rdi
  804033:	00 00 00 
  804036:	b8 00 00 00 00       	mov    $0x0,%eax
  80403b:	49 b8 e1 3d 80 00 00 	movabs $0x803de1,%r8
  804042:	00 00 00 
  804045:	41 ff d0             	callq  *%r8
  804048:	90                   	nop
  804049:	c9                   	leaveq 
  80404a:	c3                   	retq   

000000000080404b <ipc_host_recv>:
  80404b:	55                   	push   %rbp
  80404c:	48 89 e5             	mov    %rsp,%rbp
  80404f:	48 83 ec 10          	sub    $0x10,%rsp
  804053:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804057:	48 ba 80 49 80 00 00 	movabs $0x804980,%rdx
  80405e:	00 00 00 
  804061:	be 4e 00 00 00       	mov    $0x4e,%esi
  804066:	48 bf 6e 49 80 00 00 	movabs $0x80496e,%rdi
  80406d:	00 00 00 
  804070:	b8 00 00 00 00       	mov    $0x0,%eax
  804075:	48 b9 e1 3d 80 00 00 	movabs $0x803de1,%rcx
  80407c:	00 00 00 
  80407f:	ff d1                	callq  *%rcx

0000000000804081 <ipc_host_send>:
  804081:	55                   	push   %rbp
  804082:	48 89 e5             	mov    %rsp,%rbp
  804085:	48 83 ec 20          	sub    $0x20,%rsp
  804089:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80408c:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80408f:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  804093:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804096:	48 ba a0 49 80 00 00 	movabs $0x8049a0,%rdx
  80409d:	00 00 00 
  8040a0:	be 58 00 00 00       	mov    $0x58,%esi
  8040a5:	48 bf 6e 49 80 00 00 	movabs $0x80496e,%rdi
  8040ac:	00 00 00 
  8040af:	b8 00 00 00 00       	mov    $0x0,%eax
  8040b4:	48 b9 e1 3d 80 00 00 	movabs $0x803de1,%rcx
  8040bb:	00 00 00 
  8040be:	ff d1                	callq  *%rcx

00000000008040c0 <ipc_find_env>:
  8040c0:	55                   	push   %rbp
  8040c1:	48 89 e5             	mov    %rsp,%rbp
  8040c4:	48 83 ec 18          	sub    $0x18,%rsp
  8040c8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8040cb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8040d2:	eb 4d                	jmp    804121 <ipc_find_env+0x61>
  8040d4:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8040db:	00 00 00 
  8040de:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040e1:	48 98                	cltq   
  8040e3:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8040ea:	48 01 d0             	add    %rdx,%rax
  8040ed:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8040f3:	8b 00                	mov    (%rax),%eax
  8040f5:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8040f8:	75 23                	jne    80411d <ipc_find_env+0x5d>
  8040fa:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804101:	00 00 00 
  804104:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804107:	48 98                	cltq   
  804109:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804110:	48 01 d0             	add    %rdx,%rax
  804113:	48 05 c8 00 00 00    	add    $0xc8,%rax
  804119:	8b 00                	mov    (%rax),%eax
  80411b:	eb 12                	jmp    80412f <ipc_find_env+0x6f>
  80411d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804121:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804128:	7e aa                	jle    8040d4 <ipc_find_env+0x14>
  80412a:	b8 00 00 00 00       	mov    $0x0,%eax
  80412f:	c9                   	leaveq 
  804130:	c3                   	retq   

0000000000804131 <pageref>:
  804131:	55                   	push   %rbp
  804132:	48 89 e5             	mov    %rsp,%rbp
  804135:	48 83 ec 18          	sub    $0x18,%rsp
  804139:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80413d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804141:	48 c1 e8 15          	shr    $0x15,%rax
  804145:	48 89 c2             	mov    %rax,%rdx
  804148:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80414f:	01 00 00 
  804152:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804156:	83 e0 01             	and    $0x1,%eax
  804159:	48 85 c0             	test   %rax,%rax
  80415c:	75 07                	jne    804165 <pageref+0x34>
  80415e:	b8 00 00 00 00       	mov    $0x0,%eax
  804163:	eb 56                	jmp    8041bb <pageref+0x8a>
  804165:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804169:	48 c1 e8 0c          	shr    $0xc,%rax
  80416d:	48 89 c2             	mov    %rax,%rdx
  804170:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804177:	01 00 00 
  80417a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80417e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804182:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804186:	83 e0 01             	and    $0x1,%eax
  804189:	48 85 c0             	test   %rax,%rax
  80418c:	75 07                	jne    804195 <pageref+0x64>
  80418e:	b8 00 00 00 00       	mov    $0x0,%eax
  804193:	eb 26                	jmp    8041bb <pageref+0x8a>
  804195:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804199:	48 c1 e8 0c          	shr    $0xc,%rax
  80419d:	48 89 c2             	mov    %rax,%rdx
  8041a0:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8041a7:	00 00 00 
  8041aa:	48 c1 e2 04          	shl    $0x4,%rdx
  8041ae:	48 01 d0             	add    %rdx,%rax
  8041b1:	48 83 c0 08          	add    $0x8,%rax
  8041b5:	0f b7 00             	movzwl (%rax),%eax
  8041b8:	0f b7 c0             	movzwl %ax,%eax
  8041bb:	c9                   	leaveq 
  8041bc:	c3                   	retq   
