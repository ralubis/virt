
vmm/guest/obj/user/idle:     file format elf64-x86-64


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
  80003c:	e8 36 00 00 00       	callq  800077 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 10          	sub    $0x10,%rsp
  80004b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80004e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800052:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  800059:	00 00 00 
  80005c:	48 ba a0 3f 80 00 00 	movabs $0x803fa0,%rdx
  800063:	00 00 00 
  800066:	48 89 10             	mov    %rdx,(%rax)
  800069:	48 b8 b8 02 80 00 00 	movabs $0x8002b8,%rax
  800070:	00 00 00 
  800073:	ff d0                	callq  *%rax
  800075:	eb f2                	jmp    800069 <umain+0x26>

0000000000800077 <libmain>:
  800077:	55                   	push   %rbp
  800078:	48 89 e5             	mov    %rsp,%rbp
  80007b:	48 83 ec 10          	sub    $0x10,%rsp
  80007f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800082:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800086:	48 b8 7c 02 80 00 00 	movabs $0x80027c,%rax
  80008d:	00 00 00 
  800090:	ff d0                	callq  *%rax
  800092:	25 ff 03 00 00       	and    $0x3ff,%eax
  800097:	48 98                	cltq   
  800099:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8000a0:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8000a7:	00 00 00 
  8000aa:	48 01 c2             	add    %rax,%rdx
  8000ad:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8000b4:	00 00 00 
  8000b7:	48 89 10             	mov    %rdx,(%rax)
  8000ba:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000be:	7e 14                	jle    8000d4 <libmain+0x5d>
  8000c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8000c4:	48 8b 10             	mov    (%rax),%rdx
  8000c7:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8000ce:	00 00 00 
  8000d1:	48 89 10             	mov    %rdx,(%rax)
  8000d4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8000d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000db:	48 89 d6             	mov    %rdx,%rsi
  8000de:	89 c7                	mov    %eax,%edi
  8000e0:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8000e7:	00 00 00 
  8000ea:	ff d0                	callq  *%rax
  8000ec:	48 b8 fb 00 80 00 00 	movabs $0x8000fb,%rax
  8000f3:	00 00 00 
  8000f6:	ff d0                	callq  *%rax
  8000f8:	90                   	nop
  8000f9:	c9                   	leaveq 
  8000fa:	c3                   	retq   

00000000008000fb <exit>:
  8000fb:	55                   	push   %rbp
  8000fc:	48 89 e5             	mov    %rsp,%rbp
  8000ff:	48 b8 34 0a 80 00 00 	movabs $0x800a34,%rax
  800106:	00 00 00 
  800109:	ff d0                	callq  *%rax
  80010b:	bf 00 00 00 00       	mov    $0x0,%edi
  800110:	48 b8 36 02 80 00 00 	movabs $0x800236,%rax
  800117:	00 00 00 
  80011a:	ff d0                	callq  *%rax
  80011c:	90                   	nop
  80011d:	5d                   	pop    %rbp
  80011e:	c3                   	retq   

000000000080011f <syscall>:
  80011f:	55                   	push   %rbp
  800120:	48 89 e5             	mov    %rsp,%rbp
  800123:	53                   	push   %rbx
  800124:	48 83 ec 48          	sub    $0x48,%rsp
  800128:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80012b:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80012e:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  800132:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  800136:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  80013a:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  80013e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800141:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  800145:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  800149:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  80014d:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  800151:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  800155:	4c 89 c3             	mov    %r8,%rbx
  800158:	cd 30                	int    $0x30
  80015a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80015e:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800162:	74 3e                	je     8001a2 <syscall+0x83>
  800164:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  800169:	7e 37                	jle    8001a2 <syscall+0x83>
  80016b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80016f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800172:	49 89 d0             	mov    %rdx,%r8
  800175:	89 c1                	mov    %eax,%ecx
  800177:	48 ba af 3f 80 00 00 	movabs $0x803faf,%rdx
  80017e:	00 00 00 
  800181:	be 24 00 00 00       	mov    $0x24,%esi
  800186:	48 bf cc 3f 80 00 00 	movabs $0x803fcc,%rdi
  80018d:	00 00 00 
  800190:	b8 00 00 00 00       	mov    $0x0,%eax
  800195:	49 b9 9f 27 80 00 00 	movabs $0x80279f,%r9
  80019c:	00 00 00 
  80019f:	41 ff d1             	callq  *%r9
  8001a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8001a6:	48 83 c4 48          	add    $0x48,%rsp
  8001aa:	5b                   	pop    %rbx
  8001ab:	5d                   	pop    %rbp
  8001ac:	c3                   	retq   

00000000008001ad <sys_cputs>:
  8001ad:	55                   	push   %rbp
  8001ae:	48 89 e5             	mov    %rsp,%rbp
  8001b1:	48 83 ec 10          	sub    $0x10,%rsp
  8001b5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8001b9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8001bd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8001c1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8001c5:	48 83 ec 08          	sub    $0x8,%rsp
  8001c9:	6a 00                	pushq  $0x0
  8001cb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8001d1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8001d7:	48 89 d1             	mov    %rdx,%rcx
  8001da:	48 89 c2             	mov    %rax,%rdx
  8001dd:	be 00 00 00 00       	mov    $0x0,%esi
  8001e2:	bf 00 00 00 00       	mov    $0x0,%edi
  8001e7:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  8001ee:	00 00 00 
  8001f1:	ff d0                	callq  *%rax
  8001f3:	48 83 c4 10          	add    $0x10,%rsp
  8001f7:	90                   	nop
  8001f8:	c9                   	leaveq 
  8001f9:	c3                   	retq   

00000000008001fa <sys_cgetc>:
  8001fa:	55                   	push   %rbp
  8001fb:	48 89 e5             	mov    %rsp,%rbp
  8001fe:	48 83 ec 08          	sub    $0x8,%rsp
  800202:	6a 00                	pushq  $0x0
  800204:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80020a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800210:	b9 00 00 00 00       	mov    $0x0,%ecx
  800215:	ba 00 00 00 00       	mov    $0x0,%edx
  80021a:	be 00 00 00 00       	mov    $0x0,%esi
  80021f:	bf 01 00 00 00       	mov    $0x1,%edi
  800224:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  80022b:	00 00 00 
  80022e:	ff d0                	callq  *%rax
  800230:	48 83 c4 10          	add    $0x10,%rsp
  800234:	c9                   	leaveq 
  800235:	c3                   	retq   

0000000000800236 <sys_env_destroy>:
  800236:	55                   	push   %rbp
  800237:	48 89 e5             	mov    %rsp,%rbp
  80023a:	48 83 ec 10          	sub    $0x10,%rsp
  80023e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800241:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800244:	48 98                	cltq   
  800246:	48 83 ec 08          	sub    $0x8,%rsp
  80024a:	6a 00                	pushq  $0x0
  80024c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800252:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800258:	b9 00 00 00 00       	mov    $0x0,%ecx
  80025d:	48 89 c2             	mov    %rax,%rdx
  800260:	be 01 00 00 00       	mov    $0x1,%esi
  800265:	bf 03 00 00 00       	mov    $0x3,%edi
  80026a:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  800271:	00 00 00 
  800274:	ff d0                	callq  *%rax
  800276:	48 83 c4 10          	add    $0x10,%rsp
  80027a:	c9                   	leaveq 
  80027b:	c3                   	retq   

000000000080027c <sys_getenvid>:
  80027c:	55                   	push   %rbp
  80027d:	48 89 e5             	mov    %rsp,%rbp
  800280:	48 83 ec 08          	sub    $0x8,%rsp
  800284:	6a 00                	pushq  $0x0
  800286:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80028c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800292:	b9 00 00 00 00       	mov    $0x0,%ecx
  800297:	ba 00 00 00 00       	mov    $0x0,%edx
  80029c:	be 00 00 00 00       	mov    $0x0,%esi
  8002a1:	bf 02 00 00 00       	mov    $0x2,%edi
  8002a6:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  8002ad:	00 00 00 
  8002b0:	ff d0                	callq  *%rax
  8002b2:	48 83 c4 10          	add    $0x10,%rsp
  8002b6:	c9                   	leaveq 
  8002b7:	c3                   	retq   

00000000008002b8 <sys_yield>:
  8002b8:	55                   	push   %rbp
  8002b9:	48 89 e5             	mov    %rsp,%rbp
  8002bc:	48 83 ec 08          	sub    $0x8,%rsp
  8002c0:	6a 00                	pushq  $0x0
  8002c2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8002c8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8002ce:	b9 00 00 00 00       	mov    $0x0,%ecx
  8002d3:	ba 00 00 00 00       	mov    $0x0,%edx
  8002d8:	be 00 00 00 00       	mov    $0x0,%esi
  8002dd:	bf 0b 00 00 00       	mov    $0xb,%edi
  8002e2:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  8002e9:	00 00 00 
  8002ec:	ff d0                	callq  *%rax
  8002ee:	48 83 c4 10          	add    $0x10,%rsp
  8002f2:	90                   	nop
  8002f3:	c9                   	leaveq 
  8002f4:	c3                   	retq   

00000000008002f5 <sys_page_alloc>:
  8002f5:	55                   	push   %rbp
  8002f6:	48 89 e5             	mov    %rsp,%rbp
  8002f9:	48 83 ec 10          	sub    $0x10,%rsp
  8002fd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800300:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800304:	89 55 f8             	mov    %edx,-0x8(%rbp)
  800307:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80030a:	48 63 c8             	movslq %eax,%rcx
  80030d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800311:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800314:	48 98                	cltq   
  800316:	48 83 ec 08          	sub    $0x8,%rsp
  80031a:	6a 00                	pushq  $0x0
  80031c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800322:	49 89 c8             	mov    %rcx,%r8
  800325:	48 89 d1             	mov    %rdx,%rcx
  800328:	48 89 c2             	mov    %rax,%rdx
  80032b:	be 01 00 00 00       	mov    $0x1,%esi
  800330:	bf 04 00 00 00       	mov    $0x4,%edi
  800335:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  80033c:	00 00 00 
  80033f:	ff d0                	callq  *%rax
  800341:	48 83 c4 10          	add    $0x10,%rsp
  800345:	c9                   	leaveq 
  800346:	c3                   	retq   

0000000000800347 <sys_page_map>:
  800347:	55                   	push   %rbp
  800348:	48 89 e5             	mov    %rsp,%rbp
  80034b:	48 83 ec 20          	sub    $0x20,%rsp
  80034f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800352:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800356:	89 55 f8             	mov    %edx,-0x8(%rbp)
  800359:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  80035d:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  800361:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800364:	48 63 c8             	movslq %eax,%rcx
  800367:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  80036b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80036e:	48 63 f0             	movslq %eax,%rsi
  800371:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800375:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800378:	48 98                	cltq   
  80037a:	48 83 ec 08          	sub    $0x8,%rsp
  80037e:	51                   	push   %rcx
  80037f:	49 89 f9             	mov    %rdi,%r9
  800382:	49 89 f0             	mov    %rsi,%r8
  800385:	48 89 d1             	mov    %rdx,%rcx
  800388:	48 89 c2             	mov    %rax,%rdx
  80038b:	be 01 00 00 00       	mov    $0x1,%esi
  800390:	bf 05 00 00 00       	mov    $0x5,%edi
  800395:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  80039c:	00 00 00 
  80039f:	ff d0                	callq  *%rax
  8003a1:	48 83 c4 10          	add    $0x10,%rsp
  8003a5:	c9                   	leaveq 
  8003a6:	c3                   	retq   

00000000008003a7 <sys_page_unmap>:
  8003a7:	55                   	push   %rbp
  8003a8:	48 89 e5             	mov    %rsp,%rbp
  8003ab:	48 83 ec 10          	sub    $0x10,%rsp
  8003af:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8003b2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8003b6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003bd:	48 98                	cltq   
  8003bf:	48 83 ec 08          	sub    $0x8,%rsp
  8003c3:	6a 00                	pushq  $0x0
  8003c5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8003cb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8003d1:	48 89 d1             	mov    %rdx,%rcx
  8003d4:	48 89 c2             	mov    %rax,%rdx
  8003d7:	be 01 00 00 00       	mov    $0x1,%esi
  8003dc:	bf 06 00 00 00       	mov    $0x6,%edi
  8003e1:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  8003e8:	00 00 00 
  8003eb:	ff d0                	callq  *%rax
  8003ed:	48 83 c4 10          	add    $0x10,%rsp
  8003f1:	c9                   	leaveq 
  8003f2:	c3                   	retq   

00000000008003f3 <sys_env_set_status>:
  8003f3:	55                   	push   %rbp
  8003f4:	48 89 e5             	mov    %rsp,%rbp
  8003f7:	48 83 ec 10          	sub    $0x10,%rsp
  8003fb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8003fe:	89 75 f8             	mov    %esi,-0x8(%rbp)
  800401:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800404:	48 63 d0             	movslq %eax,%rdx
  800407:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80040a:	48 98                	cltq   
  80040c:	48 83 ec 08          	sub    $0x8,%rsp
  800410:	6a 00                	pushq  $0x0
  800412:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800418:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80041e:	48 89 d1             	mov    %rdx,%rcx
  800421:	48 89 c2             	mov    %rax,%rdx
  800424:	be 01 00 00 00       	mov    $0x1,%esi
  800429:	bf 08 00 00 00       	mov    $0x8,%edi
  80042e:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  800435:	00 00 00 
  800438:	ff d0                	callq  *%rax
  80043a:	48 83 c4 10          	add    $0x10,%rsp
  80043e:	c9                   	leaveq 
  80043f:	c3                   	retq   

0000000000800440 <sys_env_set_trapframe>:
  800440:	55                   	push   %rbp
  800441:	48 89 e5             	mov    %rsp,%rbp
  800444:	48 83 ec 10          	sub    $0x10,%rsp
  800448:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80044b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80044f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800453:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800456:	48 98                	cltq   
  800458:	48 83 ec 08          	sub    $0x8,%rsp
  80045c:	6a 00                	pushq  $0x0
  80045e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800464:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80046a:	48 89 d1             	mov    %rdx,%rcx
  80046d:	48 89 c2             	mov    %rax,%rdx
  800470:	be 01 00 00 00       	mov    $0x1,%esi
  800475:	bf 09 00 00 00       	mov    $0x9,%edi
  80047a:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  800481:	00 00 00 
  800484:	ff d0                	callq  *%rax
  800486:	48 83 c4 10          	add    $0x10,%rsp
  80048a:	c9                   	leaveq 
  80048b:	c3                   	retq   

000000000080048c <sys_env_set_pgfault_upcall>:
  80048c:	55                   	push   %rbp
  80048d:	48 89 e5             	mov    %rsp,%rbp
  800490:	48 83 ec 10          	sub    $0x10,%rsp
  800494:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800497:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80049b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80049f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8004a2:	48 98                	cltq   
  8004a4:	48 83 ec 08          	sub    $0x8,%rsp
  8004a8:	6a 00                	pushq  $0x0
  8004aa:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8004b0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8004b6:	48 89 d1             	mov    %rdx,%rcx
  8004b9:	48 89 c2             	mov    %rax,%rdx
  8004bc:	be 01 00 00 00       	mov    $0x1,%esi
  8004c1:	bf 0a 00 00 00       	mov    $0xa,%edi
  8004c6:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  8004cd:	00 00 00 
  8004d0:	ff d0                	callq  *%rax
  8004d2:	48 83 c4 10          	add    $0x10,%rsp
  8004d6:	c9                   	leaveq 
  8004d7:	c3                   	retq   

00000000008004d8 <sys_ipc_try_send>:
  8004d8:	55                   	push   %rbp
  8004d9:	48 89 e5             	mov    %rsp,%rbp
  8004dc:	48 83 ec 20          	sub    $0x20,%rsp
  8004e0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8004e3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8004e7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8004eb:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  8004ee:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8004f1:	48 63 f0             	movslq %eax,%rsi
  8004f4:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8004f8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8004fb:	48 98                	cltq   
  8004fd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800501:	48 83 ec 08          	sub    $0x8,%rsp
  800505:	6a 00                	pushq  $0x0
  800507:	49 89 f1             	mov    %rsi,%r9
  80050a:	49 89 c8             	mov    %rcx,%r8
  80050d:	48 89 d1             	mov    %rdx,%rcx
  800510:	48 89 c2             	mov    %rax,%rdx
  800513:	be 00 00 00 00       	mov    $0x0,%esi
  800518:	bf 0c 00 00 00       	mov    $0xc,%edi
  80051d:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  800524:	00 00 00 
  800527:	ff d0                	callq  *%rax
  800529:	48 83 c4 10          	add    $0x10,%rsp
  80052d:	c9                   	leaveq 
  80052e:	c3                   	retq   

000000000080052f <sys_ipc_recv>:
  80052f:	55                   	push   %rbp
  800530:	48 89 e5             	mov    %rsp,%rbp
  800533:	48 83 ec 10          	sub    $0x10,%rsp
  800537:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80053b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80053f:	48 83 ec 08          	sub    $0x8,%rsp
  800543:	6a 00                	pushq  $0x0
  800545:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80054b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800551:	b9 00 00 00 00       	mov    $0x0,%ecx
  800556:	48 89 c2             	mov    %rax,%rdx
  800559:	be 01 00 00 00       	mov    $0x1,%esi
  80055e:	bf 0d 00 00 00       	mov    $0xd,%edi
  800563:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  80056a:	00 00 00 
  80056d:	ff d0                	callq  *%rax
  80056f:	48 83 c4 10          	add    $0x10,%rsp
  800573:	c9                   	leaveq 
  800574:	c3                   	retq   

0000000000800575 <sys_time_msec>:
  800575:	55                   	push   %rbp
  800576:	48 89 e5             	mov    %rsp,%rbp
  800579:	48 83 ec 08          	sub    $0x8,%rsp
  80057d:	6a 00                	pushq  $0x0
  80057f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  800585:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80058b:	b9 00 00 00 00       	mov    $0x0,%ecx
  800590:	ba 00 00 00 00       	mov    $0x0,%edx
  800595:	be 00 00 00 00       	mov    $0x0,%esi
  80059a:	bf 0e 00 00 00       	mov    $0xe,%edi
  80059f:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  8005a6:	00 00 00 
  8005a9:	ff d0                	callq  *%rax
  8005ab:	48 83 c4 10          	add    $0x10,%rsp
  8005af:	c9                   	leaveq 
  8005b0:	c3                   	retq   

00000000008005b1 <sys_net_transmit>:
  8005b1:	55                   	push   %rbp
  8005b2:	48 89 e5             	mov    %rsp,%rbp
  8005b5:	48 83 ec 10          	sub    $0x10,%rsp
  8005b9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8005bd:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8005c0:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8005c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005c7:	48 83 ec 08          	sub    $0x8,%rsp
  8005cb:	6a 00                	pushq  $0x0
  8005cd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8005d3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8005d9:	48 89 d1             	mov    %rdx,%rcx
  8005dc:	48 89 c2             	mov    %rax,%rdx
  8005df:	be 00 00 00 00       	mov    $0x0,%esi
  8005e4:	bf 0f 00 00 00       	mov    $0xf,%edi
  8005e9:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  8005f0:	00 00 00 
  8005f3:	ff d0                	callq  *%rax
  8005f5:	48 83 c4 10          	add    $0x10,%rsp
  8005f9:	c9                   	leaveq 
  8005fa:	c3                   	retq   

00000000008005fb <sys_net_receive>:
  8005fb:	55                   	push   %rbp
  8005fc:	48 89 e5             	mov    %rsp,%rbp
  8005ff:	48 83 ec 10          	sub    $0x10,%rsp
  800603:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800607:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80060a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80060d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800611:	48 83 ec 08          	sub    $0x8,%rsp
  800615:	6a 00                	pushq  $0x0
  800617:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80061d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  800623:	48 89 d1             	mov    %rdx,%rcx
  800626:	48 89 c2             	mov    %rax,%rdx
  800629:	be 00 00 00 00       	mov    $0x0,%esi
  80062e:	bf 10 00 00 00       	mov    $0x10,%edi
  800633:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  80063a:	00 00 00 
  80063d:	ff d0                	callq  *%rax
  80063f:	48 83 c4 10          	add    $0x10,%rsp
  800643:	c9                   	leaveq 
  800644:	c3                   	retq   

0000000000800645 <sys_ept_map>:
  800645:	55                   	push   %rbp
  800646:	48 89 e5             	mov    %rsp,%rbp
  800649:	48 83 ec 20          	sub    $0x20,%rsp
  80064d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800650:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800654:	89 55 f8             	mov    %edx,-0x8(%rbp)
  800657:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  80065b:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  80065f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800662:	48 63 c8             	movslq %eax,%rcx
  800665:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  800669:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80066c:	48 63 f0             	movslq %eax,%rsi
  80066f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800673:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800676:	48 98                	cltq   
  800678:	48 83 ec 08          	sub    $0x8,%rsp
  80067c:	51                   	push   %rcx
  80067d:	49 89 f9             	mov    %rdi,%r9
  800680:	49 89 f0             	mov    %rsi,%r8
  800683:	48 89 d1             	mov    %rdx,%rcx
  800686:	48 89 c2             	mov    %rax,%rdx
  800689:	be 00 00 00 00       	mov    $0x0,%esi
  80068e:	bf 11 00 00 00       	mov    $0x11,%edi
  800693:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  80069a:	00 00 00 
  80069d:	ff d0                	callq  *%rax
  80069f:	48 83 c4 10          	add    $0x10,%rsp
  8006a3:	c9                   	leaveq 
  8006a4:	c3                   	retq   

00000000008006a5 <sys_env_mkguest>:
  8006a5:	55                   	push   %rbp
  8006a6:	48 89 e5             	mov    %rsp,%rbp
  8006a9:	48 83 ec 10          	sub    $0x10,%rsp
  8006ad:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8006b1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8006b5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8006b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006bd:	48 83 ec 08          	sub    $0x8,%rsp
  8006c1:	6a 00                	pushq  $0x0
  8006c3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8006c9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8006cf:	48 89 d1             	mov    %rdx,%rcx
  8006d2:	48 89 c2             	mov    %rax,%rdx
  8006d5:	be 00 00 00 00       	mov    $0x0,%esi
  8006da:	bf 12 00 00 00       	mov    $0x12,%edi
  8006df:	48 b8 1f 01 80 00 00 	movabs $0x80011f,%rax
  8006e6:	00 00 00 
  8006e9:	ff d0                	callq  *%rax
  8006eb:	48 83 c4 10          	add    $0x10,%rsp
  8006ef:	c9                   	leaveq 
  8006f0:	c3                   	retq   

00000000008006f1 <fd2num>:
  8006f1:	55                   	push   %rbp
  8006f2:	48 89 e5             	mov    %rsp,%rbp
  8006f5:	48 83 ec 08          	sub    $0x8,%rsp
  8006f9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8006fd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  800701:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  800708:	ff ff ff 
  80070b:	48 01 d0             	add    %rdx,%rax
  80070e:	48 c1 e8 0c          	shr    $0xc,%rax
  800712:	c9                   	leaveq 
  800713:	c3                   	retq   

0000000000800714 <fd2data>:
  800714:	55                   	push   %rbp
  800715:	48 89 e5             	mov    %rsp,%rbp
  800718:	48 83 ec 08          	sub    $0x8,%rsp
  80071c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800720:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800724:	48 89 c7             	mov    %rax,%rdi
  800727:	48 b8 f1 06 80 00 00 	movabs $0x8006f1,%rax
  80072e:	00 00 00 
  800731:	ff d0                	callq  *%rax
  800733:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  800739:	48 c1 e0 0c          	shl    $0xc,%rax
  80073d:	c9                   	leaveq 
  80073e:	c3                   	retq   

000000000080073f <fd_alloc>:
  80073f:	55                   	push   %rbp
  800740:	48 89 e5             	mov    %rsp,%rbp
  800743:	48 83 ec 18          	sub    $0x18,%rsp
  800747:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80074b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800752:	eb 6b                	jmp    8007bf <fd_alloc+0x80>
  800754:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800757:	48 98                	cltq   
  800759:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80075f:	48 c1 e0 0c          	shl    $0xc,%rax
  800763:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800767:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80076b:	48 c1 e8 15          	shr    $0x15,%rax
  80076f:	48 89 c2             	mov    %rax,%rdx
  800772:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  800779:	01 00 00 
  80077c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800780:	83 e0 01             	and    $0x1,%eax
  800783:	48 85 c0             	test   %rax,%rax
  800786:	74 21                	je     8007a9 <fd_alloc+0x6a>
  800788:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80078c:	48 c1 e8 0c          	shr    $0xc,%rax
  800790:	48 89 c2             	mov    %rax,%rdx
  800793:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80079a:	01 00 00 
  80079d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8007a1:	83 e0 01             	and    $0x1,%eax
  8007a4:	48 85 c0             	test   %rax,%rax
  8007a7:	75 12                	jne    8007bb <fd_alloc+0x7c>
  8007a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ad:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8007b1:	48 89 10             	mov    %rdx,(%rax)
  8007b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8007b9:	eb 1a                	jmp    8007d5 <fd_alloc+0x96>
  8007bb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8007bf:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8007c3:	7e 8f                	jle    800754 <fd_alloc+0x15>
  8007c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007c9:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8007d0:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8007d5:	c9                   	leaveq 
  8007d6:	c3                   	retq   

00000000008007d7 <fd_lookup>:
  8007d7:	55                   	push   %rbp
  8007d8:	48 89 e5             	mov    %rsp,%rbp
  8007db:	48 83 ec 20          	sub    $0x20,%rsp
  8007df:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8007e2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8007e6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8007ea:	78 06                	js     8007f2 <fd_lookup+0x1b>
  8007ec:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8007f0:	7e 07                	jle    8007f9 <fd_lookup+0x22>
  8007f2:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8007f7:	eb 6c                	jmp    800865 <fd_lookup+0x8e>
  8007f9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8007fc:	48 98                	cltq   
  8007fe:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  800804:	48 c1 e0 0c          	shl    $0xc,%rax
  800808:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80080c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800810:	48 c1 e8 15          	shr    $0x15,%rax
  800814:	48 89 c2             	mov    %rax,%rdx
  800817:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80081e:	01 00 00 
  800821:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800825:	83 e0 01             	and    $0x1,%eax
  800828:	48 85 c0             	test   %rax,%rax
  80082b:	74 21                	je     80084e <fd_lookup+0x77>
  80082d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800831:	48 c1 e8 0c          	shr    $0xc,%rax
  800835:	48 89 c2             	mov    %rax,%rdx
  800838:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80083f:	01 00 00 
  800842:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800846:	83 e0 01             	and    $0x1,%eax
  800849:	48 85 c0             	test   %rax,%rax
  80084c:	75 07                	jne    800855 <fd_lookup+0x7e>
  80084e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800853:	eb 10                	jmp    800865 <fd_lookup+0x8e>
  800855:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800859:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80085d:	48 89 10             	mov    %rdx,(%rax)
  800860:	b8 00 00 00 00       	mov    $0x0,%eax
  800865:	c9                   	leaveq 
  800866:	c3                   	retq   

0000000000800867 <fd_close>:
  800867:	55                   	push   %rbp
  800868:	48 89 e5             	mov    %rsp,%rbp
  80086b:	48 83 ec 30          	sub    $0x30,%rsp
  80086f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  800873:	89 f0                	mov    %esi,%eax
  800875:	88 45 d4             	mov    %al,-0x2c(%rbp)
  800878:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80087c:	48 89 c7             	mov    %rax,%rdi
  80087f:	48 b8 f1 06 80 00 00 	movabs $0x8006f1,%rax
  800886:	00 00 00 
  800889:	ff d0                	callq  *%rax
  80088b:	89 c2                	mov    %eax,%edx
  80088d:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  800891:	48 89 c6             	mov    %rax,%rsi
  800894:	89 d7                	mov    %edx,%edi
  800896:	48 b8 d7 07 80 00 00 	movabs $0x8007d7,%rax
  80089d:	00 00 00 
  8008a0:	ff d0                	callq  *%rax
  8008a2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8008a5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8008a9:	78 0a                	js     8008b5 <fd_close+0x4e>
  8008ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8008af:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8008b3:	74 12                	je     8008c7 <fd_close+0x60>
  8008b5:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8008b9:	74 05                	je     8008c0 <fd_close+0x59>
  8008bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8008be:	eb 70                	jmp    800930 <fd_close+0xc9>
  8008c0:	b8 00 00 00 00       	mov    $0x0,%eax
  8008c5:	eb 69                	jmp    800930 <fd_close+0xc9>
  8008c7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8008cb:	8b 00                	mov    (%rax),%eax
  8008cd:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8008d1:	48 89 d6             	mov    %rdx,%rsi
  8008d4:	89 c7                	mov    %eax,%edi
  8008d6:	48 b8 32 09 80 00 00 	movabs $0x800932,%rax
  8008dd:	00 00 00 
  8008e0:	ff d0                	callq  *%rax
  8008e2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8008e5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8008e9:	78 2a                	js     800915 <fd_close+0xae>
  8008eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008ef:	48 8b 40 20          	mov    0x20(%rax),%rax
  8008f3:	48 85 c0             	test   %rax,%rax
  8008f6:	74 16                	je     80090e <fd_close+0xa7>
  8008f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008fc:	48 8b 40 20          	mov    0x20(%rax),%rax
  800900:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  800904:	48 89 d7             	mov    %rdx,%rdi
  800907:	ff d0                	callq  *%rax
  800909:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80090c:	eb 07                	jmp    800915 <fd_close+0xae>
  80090e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800915:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800919:	48 89 c6             	mov    %rax,%rsi
  80091c:	bf 00 00 00 00       	mov    $0x0,%edi
  800921:	48 b8 a7 03 80 00 00 	movabs $0x8003a7,%rax
  800928:	00 00 00 
  80092b:	ff d0                	callq  *%rax
  80092d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800930:	c9                   	leaveq 
  800931:	c3                   	retq   

0000000000800932 <dev_lookup>:
  800932:	55                   	push   %rbp
  800933:	48 89 e5             	mov    %rsp,%rbp
  800936:	48 83 ec 20          	sub    $0x20,%rsp
  80093a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80093d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800941:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800948:	eb 41                	jmp    80098b <dev_lookup+0x59>
  80094a:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  800951:	00 00 00 
  800954:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800957:	48 63 d2             	movslq %edx,%rdx
  80095a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80095e:	8b 00                	mov    (%rax),%eax
  800960:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  800963:	75 22                	jne    800987 <dev_lookup+0x55>
  800965:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  80096c:	00 00 00 
  80096f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800972:	48 63 d2             	movslq %edx,%rdx
  800975:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  800979:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80097d:	48 89 10             	mov    %rdx,(%rax)
  800980:	b8 00 00 00 00       	mov    $0x0,%eax
  800985:	eb 60                	jmp    8009e7 <dev_lookup+0xb5>
  800987:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80098b:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  800992:	00 00 00 
  800995:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800998:	48 63 d2             	movslq %edx,%rdx
  80099b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80099f:	48 85 c0             	test   %rax,%rax
  8009a2:	75 a6                	jne    80094a <dev_lookup+0x18>
  8009a4:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8009ab:	00 00 00 
  8009ae:	48 8b 00             	mov    (%rax),%rax
  8009b1:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8009b7:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8009ba:	89 c6                	mov    %eax,%esi
  8009bc:	48 bf e0 3f 80 00 00 	movabs $0x803fe0,%rdi
  8009c3:	00 00 00 
  8009c6:	b8 00 00 00 00       	mov    $0x0,%eax
  8009cb:	48 b9 d9 29 80 00 00 	movabs $0x8029d9,%rcx
  8009d2:	00 00 00 
  8009d5:	ff d1                	callq  *%rcx
  8009d7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8009db:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8009e2:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8009e7:	c9                   	leaveq 
  8009e8:	c3                   	retq   

00000000008009e9 <close>:
  8009e9:	55                   	push   %rbp
  8009ea:	48 89 e5             	mov    %rsp,%rbp
  8009ed:	48 83 ec 20          	sub    $0x20,%rsp
  8009f1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8009f4:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8009f8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8009fb:	48 89 d6             	mov    %rdx,%rsi
  8009fe:	89 c7                	mov    %eax,%edi
  800a00:	48 b8 d7 07 80 00 00 	movabs $0x8007d7,%rax
  800a07:	00 00 00 
  800a0a:	ff d0                	callq  *%rax
  800a0c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800a0f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800a13:	79 05                	jns    800a1a <close+0x31>
  800a15:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800a18:	eb 18                	jmp    800a32 <close+0x49>
  800a1a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800a1e:	be 01 00 00 00       	mov    $0x1,%esi
  800a23:	48 89 c7             	mov    %rax,%rdi
  800a26:	48 b8 67 08 80 00 00 	movabs $0x800867,%rax
  800a2d:	00 00 00 
  800a30:	ff d0                	callq  *%rax
  800a32:	c9                   	leaveq 
  800a33:	c3                   	retq   

0000000000800a34 <close_all>:
  800a34:	55                   	push   %rbp
  800a35:	48 89 e5             	mov    %rsp,%rbp
  800a38:	48 83 ec 10          	sub    $0x10,%rsp
  800a3c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800a43:	eb 15                	jmp    800a5a <close_all+0x26>
  800a45:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800a48:	89 c7                	mov    %eax,%edi
  800a4a:	48 b8 e9 09 80 00 00 	movabs $0x8009e9,%rax
  800a51:	00 00 00 
  800a54:	ff d0                	callq  *%rax
  800a56:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800a5a:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  800a5e:	7e e5                	jle    800a45 <close_all+0x11>
  800a60:	90                   	nop
  800a61:	c9                   	leaveq 
  800a62:	c3                   	retq   

0000000000800a63 <dup>:
  800a63:	55                   	push   %rbp
  800a64:	48 89 e5             	mov    %rsp,%rbp
  800a67:	48 83 ec 40          	sub    $0x40,%rsp
  800a6b:	89 7d cc             	mov    %edi,-0x34(%rbp)
  800a6e:	89 75 c8             	mov    %esi,-0x38(%rbp)
  800a71:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  800a75:	8b 45 cc             	mov    -0x34(%rbp),%eax
  800a78:	48 89 d6             	mov    %rdx,%rsi
  800a7b:	89 c7                	mov    %eax,%edi
  800a7d:	48 b8 d7 07 80 00 00 	movabs $0x8007d7,%rax
  800a84:	00 00 00 
  800a87:	ff d0                	callq  *%rax
  800a89:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800a8c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800a90:	79 08                	jns    800a9a <dup+0x37>
  800a92:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800a95:	e9 70 01 00 00       	jmpq   800c0a <dup+0x1a7>
  800a9a:	8b 45 c8             	mov    -0x38(%rbp),%eax
  800a9d:	89 c7                	mov    %eax,%edi
  800a9f:	48 b8 e9 09 80 00 00 	movabs $0x8009e9,%rax
  800aa6:	00 00 00 
  800aa9:	ff d0                	callq  *%rax
  800aab:	8b 45 c8             	mov    -0x38(%rbp),%eax
  800aae:	48 98                	cltq   
  800ab0:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  800ab6:	48 c1 e0 0c          	shl    $0xc,%rax
  800aba:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800abe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800ac2:	48 89 c7             	mov    %rax,%rdi
  800ac5:	48 b8 14 07 80 00 00 	movabs $0x800714,%rax
  800acc:	00 00 00 
  800acf:	ff d0                	callq  *%rax
  800ad1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ad5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ad9:	48 89 c7             	mov    %rax,%rdi
  800adc:	48 b8 14 07 80 00 00 	movabs $0x800714,%rax
  800ae3:	00 00 00 
  800ae6:	ff d0                	callq  *%rax
  800ae8:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  800aec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800af0:	48 c1 e8 15          	shr    $0x15,%rax
  800af4:	48 89 c2             	mov    %rax,%rdx
  800af7:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  800afe:	01 00 00 
  800b01:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800b05:	83 e0 01             	and    $0x1,%eax
  800b08:	48 85 c0             	test   %rax,%rax
  800b0b:	74 71                	je     800b7e <dup+0x11b>
  800b0d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b11:	48 c1 e8 0c          	shr    $0xc,%rax
  800b15:	48 89 c2             	mov    %rax,%rdx
  800b18:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  800b1f:	01 00 00 
  800b22:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800b26:	83 e0 01             	and    $0x1,%eax
  800b29:	48 85 c0             	test   %rax,%rax
  800b2c:	74 50                	je     800b7e <dup+0x11b>
  800b2e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b32:	48 c1 e8 0c          	shr    $0xc,%rax
  800b36:	48 89 c2             	mov    %rax,%rdx
  800b39:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  800b40:	01 00 00 
  800b43:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800b47:	25 07 0e 00 00       	and    $0xe07,%eax
  800b4c:	89 c1                	mov    %eax,%ecx
  800b4e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800b52:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b56:	41 89 c8             	mov    %ecx,%r8d
  800b59:	48 89 d1             	mov    %rdx,%rcx
  800b5c:	ba 00 00 00 00       	mov    $0x0,%edx
  800b61:	48 89 c6             	mov    %rax,%rsi
  800b64:	bf 00 00 00 00       	mov    $0x0,%edi
  800b69:	48 b8 47 03 80 00 00 	movabs $0x800347,%rax
  800b70:	00 00 00 
  800b73:	ff d0                	callq  *%rax
  800b75:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800b78:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800b7c:	78 55                	js     800bd3 <dup+0x170>
  800b7e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800b82:	48 c1 e8 0c          	shr    $0xc,%rax
  800b86:	48 89 c2             	mov    %rax,%rdx
  800b89:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  800b90:	01 00 00 
  800b93:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  800b97:	25 07 0e 00 00       	and    $0xe07,%eax
  800b9c:	89 c1                	mov    %eax,%ecx
  800b9e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800ba2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800ba6:	41 89 c8             	mov    %ecx,%r8d
  800ba9:	48 89 d1             	mov    %rdx,%rcx
  800bac:	ba 00 00 00 00       	mov    $0x0,%edx
  800bb1:	48 89 c6             	mov    %rax,%rsi
  800bb4:	bf 00 00 00 00       	mov    $0x0,%edi
  800bb9:	48 b8 47 03 80 00 00 	movabs $0x800347,%rax
  800bc0:	00 00 00 
  800bc3:	ff d0                	callq  *%rax
  800bc5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800bc8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800bcc:	78 08                	js     800bd6 <dup+0x173>
  800bce:	8b 45 c8             	mov    -0x38(%rbp),%eax
  800bd1:	eb 37                	jmp    800c0a <dup+0x1a7>
  800bd3:	90                   	nop
  800bd4:	eb 01                	jmp    800bd7 <dup+0x174>
  800bd6:	90                   	nop
  800bd7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800bdb:	48 89 c6             	mov    %rax,%rsi
  800bde:	bf 00 00 00 00       	mov    $0x0,%edi
  800be3:	48 b8 a7 03 80 00 00 	movabs $0x8003a7,%rax
  800bea:	00 00 00 
  800bed:	ff d0                	callq  *%rax
  800bef:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800bf3:	48 89 c6             	mov    %rax,%rsi
  800bf6:	bf 00 00 00 00       	mov    $0x0,%edi
  800bfb:	48 b8 a7 03 80 00 00 	movabs $0x8003a7,%rax
  800c02:	00 00 00 
  800c05:	ff d0                	callq  *%rax
  800c07:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800c0a:	c9                   	leaveq 
  800c0b:	c3                   	retq   

0000000000800c0c <read>:
  800c0c:	55                   	push   %rbp
  800c0d:	48 89 e5             	mov    %rsp,%rbp
  800c10:	48 83 ec 40          	sub    $0x40,%rsp
  800c14:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800c17:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  800c1b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  800c1f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  800c23:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800c26:	48 89 d6             	mov    %rdx,%rsi
  800c29:	89 c7                	mov    %eax,%edi
  800c2b:	48 b8 d7 07 80 00 00 	movabs $0x8007d7,%rax
  800c32:	00 00 00 
  800c35:	ff d0                	callq  *%rax
  800c37:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800c3a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800c3e:	78 24                	js     800c64 <read+0x58>
  800c40:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c44:	8b 00                	mov    (%rax),%eax
  800c46:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  800c4a:	48 89 d6             	mov    %rdx,%rsi
  800c4d:	89 c7                	mov    %eax,%edi
  800c4f:	48 b8 32 09 80 00 00 	movabs $0x800932,%rax
  800c56:	00 00 00 
  800c59:	ff d0                	callq  *%rax
  800c5b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800c5e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800c62:	79 05                	jns    800c69 <read+0x5d>
  800c64:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800c67:	eb 76                	jmp    800cdf <read+0xd3>
  800c69:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c6d:	8b 40 08             	mov    0x8(%rax),%eax
  800c70:	83 e0 03             	and    $0x3,%eax
  800c73:	83 f8 01             	cmp    $0x1,%eax
  800c76:	75 3a                	jne    800cb2 <read+0xa6>
  800c78:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800c7f:	00 00 00 
  800c82:	48 8b 00             	mov    (%rax),%rax
  800c85:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800c8b:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800c8e:	89 c6                	mov    %eax,%esi
  800c90:	48 bf ff 3f 80 00 00 	movabs $0x803fff,%rdi
  800c97:	00 00 00 
  800c9a:	b8 00 00 00 00       	mov    $0x0,%eax
  800c9f:	48 b9 d9 29 80 00 00 	movabs $0x8029d9,%rcx
  800ca6:	00 00 00 
  800ca9:	ff d1                	callq  *%rcx
  800cab:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800cb0:	eb 2d                	jmp    800cdf <read+0xd3>
  800cb2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800cb6:	48 8b 40 10          	mov    0x10(%rax),%rax
  800cba:	48 85 c0             	test   %rax,%rax
  800cbd:	75 07                	jne    800cc6 <read+0xba>
  800cbf:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  800cc4:	eb 19                	jmp    800cdf <read+0xd3>
  800cc6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800cca:	48 8b 40 10          	mov    0x10(%rax),%rax
  800cce:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  800cd2:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800cd6:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  800cda:	48 89 cf             	mov    %rcx,%rdi
  800cdd:	ff d0                	callq  *%rax
  800cdf:	c9                   	leaveq 
  800ce0:	c3                   	retq   

0000000000800ce1 <readn>:
  800ce1:	55                   	push   %rbp
  800ce2:	48 89 e5             	mov    %rsp,%rbp
  800ce5:	48 83 ec 30          	sub    $0x30,%rsp
  800ce9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800cec:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800cf0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800cf4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800cfb:	eb 47                	jmp    800d44 <readn+0x63>
  800cfd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800d00:	48 98                	cltq   
  800d02:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  800d06:	48 29 c2             	sub    %rax,%rdx
  800d09:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800d0c:	48 63 c8             	movslq %eax,%rcx
  800d0f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800d13:	48 01 c1             	add    %rax,%rcx
  800d16:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800d19:	48 89 ce             	mov    %rcx,%rsi
  800d1c:	89 c7                	mov    %eax,%edi
  800d1e:	48 b8 0c 0c 80 00 00 	movabs $0x800c0c,%rax
  800d25:	00 00 00 
  800d28:	ff d0                	callq  *%rax
  800d2a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800d2d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800d31:	79 05                	jns    800d38 <readn+0x57>
  800d33:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800d36:	eb 1d                	jmp    800d55 <readn+0x74>
  800d38:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800d3c:	74 13                	je     800d51 <readn+0x70>
  800d3e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800d41:	01 45 fc             	add    %eax,-0x4(%rbp)
  800d44:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800d47:	48 98                	cltq   
  800d49:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800d4d:	72 ae                	jb     800cfd <readn+0x1c>
  800d4f:	eb 01                	jmp    800d52 <readn+0x71>
  800d51:	90                   	nop
  800d52:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800d55:	c9                   	leaveq 
  800d56:	c3                   	retq   

0000000000800d57 <write>:
  800d57:	55                   	push   %rbp
  800d58:	48 89 e5             	mov    %rsp,%rbp
  800d5b:	48 83 ec 40          	sub    $0x40,%rsp
  800d5f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800d62:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  800d66:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  800d6a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  800d6e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800d71:	48 89 d6             	mov    %rdx,%rsi
  800d74:	89 c7                	mov    %eax,%edi
  800d76:	48 b8 d7 07 80 00 00 	movabs $0x8007d7,%rax
  800d7d:	00 00 00 
  800d80:	ff d0                	callq  *%rax
  800d82:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800d85:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800d89:	78 24                	js     800daf <write+0x58>
  800d8b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d8f:	8b 00                	mov    (%rax),%eax
  800d91:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  800d95:	48 89 d6             	mov    %rdx,%rsi
  800d98:	89 c7                	mov    %eax,%edi
  800d9a:	48 b8 32 09 80 00 00 	movabs $0x800932,%rax
  800da1:	00 00 00 
  800da4:	ff d0                	callq  *%rax
  800da6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800da9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800dad:	79 05                	jns    800db4 <write+0x5d>
  800daf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800db2:	eb 75                	jmp    800e29 <write+0xd2>
  800db4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800db8:	8b 40 08             	mov    0x8(%rax),%eax
  800dbb:	83 e0 03             	and    $0x3,%eax
  800dbe:	85 c0                	test   %eax,%eax
  800dc0:	75 3a                	jne    800dfc <write+0xa5>
  800dc2:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800dc9:	00 00 00 
  800dcc:	48 8b 00             	mov    (%rax),%rax
  800dcf:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800dd5:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800dd8:	89 c6                	mov    %eax,%esi
  800dda:	48 bf 1b 40 80 00 00 	movabs $0x80401b,%rdi
  800de1:	00 00 00 
  800de4:	b8 00 00 00 00       	mov    $0x0,%eax
  800de9:	48 b9 d9 29 80 00 00 	movabs $0x8029d9,%rcx
  800df0:	00 00 00 
  800df3:	ff d1                	callq  *%rcx
  800df5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800dfa:	eb 2d                	jmp    800e29 <write+0xd2>
  800dfc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e00:	48 8b 40 18          	mov    0x18(%rax),%rax
  800e04:	48 85 c0             	test   %rax,%rax
  800e07:	75 07                	jne    800e10 <write+0xb9>
  800e09:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  800e0e:	eb 19                	jmp    800e29 <write+0xd2>
  800e10:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e14:	48 8b 40 18          	mov    0x18(%rax),%rax
  800e18:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  800e1c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  800e20:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  800e24:	48 89 cf             	mov    %rcx,%rdi
  800e27:	ff d0                	callq  *%rax
  800e29:	c9                   	leaveq 
  800e2a:	c3                   	retq   

0000000000800e2b <seek>:
  800e2b:	55                   	push   %rbp
  800e2c:	48 89 e5             	mov    %rsp,%rbp
  800e2f:	48 83 ec 18          	sub    $0x18,%rsp
  800e33:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800e36:	89 75 e8             	mov    %esi,-0x18(%rbp)
  800e39:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  800e3d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800e40:	48 89 d6             	mov    %rdx,%rsi
  800e43:	89 c7                	mov    %eax,%edi
  800e45:	48 b8 d7 07 80 00 00 	movabs $0x8007d7,%rax
  800e4c:	00 00 00 
  800e4f:	ff d0                	callq  *%rax
  800e51:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800e54:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800e58:	79 05                	jns    800e5f <seek+0x34>
  800e5a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800e5d:	eb 0f                	jmp    800e6e <seek+0x43>
  800e5f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e63:	8b 55 e8             	mov    -0x18(%rbp),%edx
  800e66:	89 50 04             	mov    %edx,0x4(%rax)
  800e69:	b8 00 00 00 00       	mov    $0x0,%eax
  800e6e:	c9                   	leaveq 
  800e6f:	c3                   	retq   

0000000000800e70 <ftruncate>:
  800e70:	55                   	push   %rbp
  800e71:	48 89 e5             	mov    %rsp,%rbp
  800e74:	48 83 ec 30          	sub    $0x30,%rsp
  800e78:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800e7b:	89 75 d8             	mov    %esi,-0x28(%rbp)
  800e7e:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  800e82:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800e85:	48 89 d6             	mov    %rdx,%rsi
  800e88:	89 c7                	mov    %eax,%edi
  800e8a:	48 b8 d7 07 80 00 00 	movabs $0x8007d7,%rax
  800e91:	00 00 00 
  800e94:	ff d0                	callq  *%rax
  800e96:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800e99:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800e9d:	78 24                	js     800ec3 <ftruncate+0x53>
  800e9f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ea3:	8b 00                	mov    (%rax),%eax
  800ea5:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  800ea9:	48 89 d6             	mov    %rdx,%rsi
  800eac:	89 c7                	mov    %eax,%edi
  800eae:	48 b8 32 09 80 00 00 	movabs $0x800932,%rax
  800eb5:	00 00 00 
  800eb8:	ff d0                	callq  *%rax
  800eba:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800ebd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800ec1:	79 05                	jns    800ec8 <ftruncate+0x58>
  800ec3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ec6:	eb 72                	jmp    800f3a <ftruncate+0xca>
  800ec8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ecc:	8b 40 08             	mov    0x8(%rax),%eax
  800ecf:	83 e0 03             	and    $0x3,%eax
  800ed2:	85 c0                	test   %eax,%eax
  800ed4:	75 3a                	jne    800f10 <ftruncate+0xa0>
  800ed6:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800edd:	00 00 00 
  800ee0:	48 8b 00             	mov    (%rax),%rax
  800ee3:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800ee9:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800eec:	89 c6                	mov    %eax,%esi
  800eee:	48 bf 38 40 80 00 00 	movabs $0x804038,%rdi
  800ef5:	00 00 00 
  800ef8:	b8 00 00 00 00       	mov    $0x0,%eax
  800efd:	48 b9 d9 29 80 00 00 	movabs $0x8029d9,%rcx
  800f04:	00 00 00 
  800f07:	ff d1                	callq  *%rcx
  800f09:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800f0e:	eb 2a                	jmp    800f3a <ftruncate+0xca>
  800f10:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f14:	48 8b 40 30          	mov    0x30(%rax),%rax
  800f18:	48 85 c0             	test   %rax,%rax
  800f1b:	75 07                	jne    800f24 <ftruncate+0xb4>
  800f1d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  800f22:	eb 16                	jmp    800f3a <ftruncate+0xca>
  800f24:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f28:	48 8b 40 30          	mov    0x30(%rax),%rax
  800f2c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f30:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  800f33:	89 ce                	mov    %ecx,%esi
  800f35:	48 89 d7             	mov    %rdx,%rdi
  800f38:	ff d0                	callq  *%rax
  800f3a:	c9                   	leaveq 
  800f3b:	c3                   	retq   

0000000000800f3c <fstat>:
  800f3c:	55                   	push   %rbp
  800f3d:	48 89 e5             	mov    %rsp,%rbp
  800f40:	48 83 ec 30          	sub    $0x30,%rsp
  800f44:	89 7d dc             	mov    %edi,-0x24(%rbp)
  800f47:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  800f4b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  800f4f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800f52:	48 89 d6             	mov    %rdx,%rsi
  800f55:	89 c7                	mov    %eax,%edi
  800f57:	48 b8 d7 07 80 00 00 	movabs $0x8007d7,%rax
  800f5e:	00 00 00 
  800f61:	ff d0                	callq  *%rax
  800f63:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800f66:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800f6a:	78 24                	js     800f90 <fstat+0x54>
  800f6c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f70:	8b 00                	mov    (%rax),%eax
  800f72:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  800f76:	48 89 d6             	mov    %rdx,%rsi
  800f79:	89 c7                	mov    %eax,%edi
  800f7b:	48 b8 32 09 80 00 00 	movabs $0x800932,%rax
  800f82:	00 00 00 
  800f85:	ff d0                	callq  *%rax
  800f87:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800f8a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800f8e:	79 05                	jns    800f95 <fstat+0x59>
  800f90:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f93:	eb 5e                	jmp    800ff3 <fstat+0xb7>
  800f95:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f99:	48 8b 40 28          	mov    0x28(%rax),%rax
  800f9d:	48 85 c0             	test   %rax,%rax
  800fa0:	75 07                	jne    800fa9 <fstat+0x6d>
  800fa2:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  800fa7:	eb 4a                	jmp    800ff3 <fstat+0xb7>
  800fa9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800fad:	c6 00 00             	movb   $0x0,(%rax)
  800fb0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800fb4:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  800fbb:	00 00 00 
  800fbe:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800fc2:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  800fc9:	00 00 00 
  800fcc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800fd0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800fd4:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  800fdb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fdf:	48 8b 40 28          	mov    0x28(%rax),%rax
  800fe3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800fe7:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  800feb:	48 89 ce             	mov    %rcx,%rsi
  800fee:	48 89 d7             	mov    %rdx,%rdi
  800ff1:	ff d0                	callq  *%rax
  800ff3:	c9                   	leaveq 
  800ff4:	c3                   	retq   

0000000000800ff5 <stat>:
  800ff5:	55                   	push   %rbp
  800ff6:	48 89 e5             	mov    %rsp,%rbp
  800ff9:	48 83 ec 20          	sub    $0x20,%rsp
  800ffd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801001:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801005:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801009:	be 00 00 00 00       	mov    $0x0,%esi
  80100e:	48 89 c7             	mov    %rax,%rdi
  801011:	48 b8 e5 10 80 00 00 	movabs $0x8010e5,%rax
  801018:	00 00 00 
  80101b:	ff d0                	callq  *%rax
  80101d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801020:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801024:	79 05                	jns    80102b <stat+0x36>
  801026:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801029:	eb 2f                	jmp    80105a <stat+0x65>
  80102b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80102f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801032:	48 89 d6             	mov    %rdx,%rsi
  801035:	89 c7                	mov    %eax,%edi
  801037:	48 b8 3c 0f 80 00 00 	movabs $0x800f3c,%rax
  80103e:	00 00 00 
  801041:	ff d0                	callq  *%rax
  801043:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801046:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801049:	89 c7                	mov    %eax,%edi
  80104b:	48 b8 e9 09 80 00 00 	movabs $0x8009e9,%rax
  801052:	00 00 00 
  801055:	ff d0                	callq  *%rax
  801057:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80105a:	c9                   	leaveq 
  80105b:	c3                   	retq   

000000000080105c <fsipc>:
  80105c:	55                   	push   %rbp
  80105d:	48 89 e5             	mov    %rsp,%rbp
  801060:	48 83 ec 10          	sub    $0x10,%rsp
  801064:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801067:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80106b:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  801072:	00 00 00 
  801075:	8b 00                	mov    (%rax),%eax
  801077:	85 c0                	test   %eax,%eax
  801079:	75 1f                	jne    80109a <fsipc+0x3e>
  80107b:	bf 01 00 00 00       	mov    $0x1,%edi
  801080:	48 b8 8e 3e 80 00 00 	movabs $0x803e8e,%rax
  801087:	00 00 00 
  80108a:	ff d0                	callq  *%rax
  80108c:	89 c2                	mov    %eax,%edx
  80108e:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  801095:	00 00 00 
  801098:	89 10                	mov    %edx,(%rax)
  80109a:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8010a1:	00 00 00 
  8010a4:	8b 00                	mov    (%rax),%eax
  8010a6:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8010a9:	b9 07 00 00 00       	mov    $0x7,%ecx
  8010ae:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  8010b5:	00 00 00 
  8010b8:	89 c7                	mov    %eax,%edi
  8010ba:	48 b8 84 3d 80 00 00 	movabs $0x803d84,%rax
  8010c1:	00 00 00 
  8010c4:	ff d0                	callq  *%rax
  8010c6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010ca:	ba 00 00 00 00       	mov    $0x0,%edx
  8010cf:	48 89 c6             	mov    %rax,%rsi
  8010d2:	bf 00 00 00 00       	mov    $0x0,%edi
  8010d7:	48 b8 c3 3c 80 00 00 	movabs $0x803cc3,%rax
  8010de:	00 00 00 
  8010e1:	ff d0                	callq  *%rax
  8010e3:	c9                   	leaveq 
  8010e4:	c3                   	retq   

00000000008010e5 <open>:
  8010e5:	55                   	push   %rbp
  8010e6:	48 89 e5             	mov    %rsp,%rbp
  8010e9:	48 83 ec 20          	sub    $0x20,%rsp
  8010ed:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010f1:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8010f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010f8:	48 89 c7             	mov    %rax,%rdi
  8010fb:	48 b8 fd 34 80 00 00 	movabs $0x8034fd,%rax
  801102:	00 00 00 
  801105:	ff d0                	callq  *%rax
  801107:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  80110c:	7e 0a                	jle    801118 <open+0x33>
  80110e:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  801113:	e9 a5 00 00 00       	jmpq   8011bd <open+0xd8>
  801118:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80111c:	48 89 c7             	mov    %rax,%rdi
  80111f:	48 b8 3f 07 80 00 00 	movabs $0x80073f,%rax
  801126:	00 00 00 
  801129:	ff d0                	callq  *%rax
  80112b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80112e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801132:	79 08                	jns    80113c <open+0x57>
  801134:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801137:	e9 81 00 00 00       	jmpq   8011bd <open+0xd8>
  80113c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801140:	48 89 c6             	mov    %rax,%rsi
  801143:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  80114a:	00 00 00 
  80114d:	48 b8 69 35 80 00 00 	movabs $0x803569,%rax
  801154:	00 00 00 
  801157:	ff d0                	callq  *%rax
  801159:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801160:	00 00 00 
  801163:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801166:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  80116c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801170:	48 89 c6             	mov    %rax,%rsi
  801173:	bf 01 00 00 00       	mov    $0x1,%edi
  801178:	48 b8 5c 10 80 00 00 	movabs $0x80105c,%rax
  80117f:	00 00 00 
  801182:	ff d0                	callq  *%rax
  801184:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801187:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80118b:	79 1d                	jns    8011aa <open+0xc5>
  80118d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801191:	be 00 00 00 00       	mov    $0x0,%esi
  801196:	48 89 c7             	mov    %rax,%rdi
  801199:	48 b8 67 08 80 00 00 	movabs $0x800867,%rax
  8011a0:	00 00 00 
  8011a3:	ff d0                	callq  *%rax
  8011a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011a8:	eb 13                	jmp    8011bd <open+0xd8>
  8011aa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011ae:	48 89 c7             	mov    %rax,%rdi
  8011b1:	48 b8 f1 06 80 00 00 	movabs $0x8006f1,%rax
  8011b8:	00 00 00 
  8011bb:	ff d0                	callq  *%rax
  8011bd:	c9                   	leaveq 
  8011be:	c3                   	retq   

00000000008011bf <devfile_flush>:
  8011bf:	55                   	push   %rbp
  8011c0:	48 89 e5             	mov    %rsp,%rbp
  8011c3:	48 83 ec 10          	sub    $0x10,%rsp
  8011c7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011cf:	8b 50 0c             	mov    0xc(%rax),%edx
  8011d2:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8011d9:	00 00 00 
  8011dc:	89 10                	mov    %edx,(%rax)
  8011de:	be 00 00 00 00       	mov    $0x0,%esi
  8011e3:	bf 06 00 00 00       	mov    $0x6,%edi
  8011e8:	48 b8 5c 10 80 00 00 	movabs $0x80105c,%rax
  8011ef:	00 00 00 
  8011f2:	ff d0                	callq  *%rax
  8011f4:	c9                   	leaveq 
  8011f5:	c3                   	retq   

00000000008011f6 <devfile_read>:
  8011f6:	55                   	push   %rbp
  8011f7:	48 89 e5             	mov    %rsp,%rbp
  8011fa:	48 83 ec 30          	sub    $0x30,%rsp
  8011fe:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801202:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801206:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80120a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80120e:	8b 50 0c             	mov    0xc(%rax),%edx
  801211:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801218:	00 00 00 
  80121b:	89 10                	mov    %edx,(%rax)
  80121d:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801224:	00 00 00 
  801227:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80122b:	48 89 50 08          	mov    %rdx,0x8(%rax)
  80122f:	be 00 00 00 00       	mov    $0x0,%esi
  801234:	bf 03 00 00 00       	mov    $0x3,%edi
  801239:	48 b8 5c 10 80 00 00 	movabs $0x80105c,%rax
  801240:	00 00 00 
  801243:	ff d0                	callq  *%rax
  801245:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801248:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80124c:	79 08                	jns    801256 <devfile_read+0x60>
  80124e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801251:	e9 a4 00 00 00       	jmpq   8012fa <devfile_read+0x104>
  801256:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801259:	48 98                	cltq   
  80125b:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80125f:	76 35                	jbe    801296 <devfile_read+0xa0>
  801261:	48 b9 5e 40 80 00 00 	movabs $0x80405e,%rcx
  801268:	00 00 00 
  80126b:	48 ba 65 40 80 00 00 	movabs $0x804065,%rdx
  801272:	00 00 00 
  801275:	be 89 00 00 00       	mov    $0x89,%esi
  80127a:	48 bf 7a 40 80 00 00 	movabs $0x80407a,%rdi
  801281:	00 00 00 
  801284:	b8 00 00 00 00       	mov    $0x0,%eax
  801289:	49 b8 9f 27 80 00 00 	movabs $0x80279f,%r8
  801290:	00 00 00 
  801293:	41 ff d0             	callq  *%r8
  801296:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  80129d:	7e 35                	jle    8012d4 <devfile_read+0xde>
  80129f:	48 b9 88 40 80 00 00 	movabs $0x804088,%rcx
  8012a6:	00 00 00 
  8012a9:	48 ba 65 40 80 00 00 	movabs $0x804065,%rdx
  8012b0:	00 00 00 
  8012b3:	be 8a 00 00 00       	mov    $0x8a,%esi
  8012b8:	48 bf 7a 40 80 00 00 	movabs $0x80407a,%rdi
  8012bf:	00 00 00 
  8012c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8012c7:	49 b8 9f 27 80 00 00 	movabs $0x80279f,%r8
  8012ce:	00 00 00 
  8012d1:	41 ff d0             	callq  *%r8
  8012d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8012d7:	48 63 d0             	movslq %eax,%rdx
  8012da:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8012de:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  8012e5:	00 00 00 
  8012e8:	48 89 c7             	mov    %rax,%rdi
  8012eb:	48 b8 8e 38 80 00 00 	movabs $0x80388e,%rax
  8012f2:	00 00 00 
  8012f5:	ff d0                	callq  *%rax
  8012f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8012fa:	c9                   	leaveq 
  8012fb:	c3                   	retq   

00000000008012fc <devfile_write>:
  8012fc:	55                   	push   %rbp
  8012fd:	48 89 e5             	mov    %rsp,%rbp
  801300:	48 83 ec 40          	sub    $0x40,%rsp
  801304:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801308:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80130c:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  801310:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801314:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801318:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  80131f:	00 
  801320:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801324:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  801328:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  80132d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  801331:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801335:	8b 50 0c             	mov    0xc(%rax),%edx
  801338:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80133f:	00 00 00 
  801342:	89 10                	mov    %edx,(%rax)
  801344:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80134b:	00 00 00 
  80134e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  801352:	48 89 50 08          	mov    %rdx,0x8(%rax)
  801356:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80135a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80135e:	48 89 c6             	mov    %rax,%rsi
  801361:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  801368:	00 00 00 
  80136b:	48 b8 8e 38 80 00 00 	movabs $0x80388e,%rax
  801372:	00 00 00 
  801375:	ff d0                	callq  *%rax
  801377:	be 00 00 00 00       	mov    $0x0,%esi
  80137c:	bf 04 00 00 00       	mov    $0x4,%edi
  801381:	48 b8 5c 10 80 00 00 	movabs $0x80105c,%rax
  801388:	00 00 00 
  80138b:	ff d0                	callq  *%rax
  80138d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801390:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801394:	79 05                	jns    80139b <devfile_write+0x9f>
  801396:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801399:	eb 43                	jmp    8013de <devfile_write+0xe2>
  80139b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80139e:	48 98                	cltq   
  8013a0:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8013a4:	76 35                	jbe    8013db <devfile_write+0xdf>
  8013a6:	48 b9 5e 40 80 00 00 	movabs $0x80405e,%rcx
  8013ad:	00 00 00 
  8013b0:	48 ba 65 40 80 00 00 	movabs $0x804065,%rdx
  8013b7:	00 00 00 
  8013ba:	be a8 00 00 00       	mov    $0xa8,%esi
  8013bf:	48 bf 7a 40 80 00 00 	movabs $0x80407a,%rdi
  8013c6:	00 00 00 
  8013c9:	b8 00 00 00 00       	mov    $0x0,%eax
  8013ce:	49 b8 9f 27 80 00 00 	movabs $0x80279f,%r8
  8013d5:	00 00 00 
  8013d8:	41 ff d0             	callq  *%r8
  8013db:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8013de:	c9                   	leaveq 
  8013df:	c3                   	retq   

00000000008013e0 <devfile_stat>:
  8013e0:	55                   	push   %rbp
  8013e1:	48 89 e5             	mov    %rsp,%rbp
  8013e4:	48 83 ec 20          	sub    $0x20,%rsp
  8013e8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013ec:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013f4:	8b 50 0c             	mov    0xc(%rax),%edx
  8013f7:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8013fe:	00 00 00 
  801401:	89 10                	mov    %edx,(%rax)
  801403:	be 00 00 00 00       	mov    $0x0,%esi
  801408:	bf 05 00 00 00       	mov    $0x5,%edi
  80140d:	48 b8 5c 10 80 00 00 	movabs $0x80105c,%rax
  801414:	00 00 00 
  801417:	ff d0                	callq  *%rax
  801419:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80141c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801420:	79 05                	jns    801427 <devfile_stat+0x47>
  801422:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801425:	eb 56                	jmp    80147d <devfile_stat+0x9d>
  801427:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80142b:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  801432:	00 00 00 
  801435:	48 89 c7             	mov    %rax,%rdi
  801438:	48 b8 69 35 80 00 00 	movabs $0x803569,%rax
  80143f:	00 00 00 
  801442:	ff d0                	callq  *%rax
  801444:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80144b:	00 00 00 
  80144e:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  801454:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801458:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80145e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  801465:	00 00 00 
  801468:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  80146e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801472:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  801478:	b8 00 00 00 00       	mov    $0x0,%eax
  80147d:	c9                   	leaveq 
  80147e:	c3                   	retq   

000000000080147f <devfile_trunc>:
  80147f:	55                   	push   %rbp
  801480:	48 89 e5             	mov    %rsp,%rbp
  801483:	48 83 ec 10          	sub    $0x10,%rsp
  801487:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80148b:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80148e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801492:	8b 50 0c             	mov    0xc(%rax),%edx
  801495:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80149c:	00 00 00 
  80149f:	89 10                	mov    %edx,(%rax)
  8014a1:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8014a8:	00 00 00 
  8014ab:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8014ae:	89 50 04             	mov    %edx,0x4(%rax)
  8014b1:	be 00 00 00 00       	mov    $0x0,%esi
  8014b6:	bf 02 00 00 00       	mov    $0x2,%edi
  8014bb:	48 b8 5c 10 80 00 00 	movabs $0x80105c,%rax
  8014c2:	00 00 00 
  8014c5:	ff d0                	callq  *%rax
  8014c7:	c9                   	leaveq 
  8014c8:	c3                   	retq   

00000000008014c9 <remove>:
  8014c9:	55                   	push   %rbp
  8014ca:	48 89 e5             	mov    %rsp,%rbp
  8014cd:	48 83 ec 10          	sub    $0x10,%rsp
  8014d1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014d9:	48 89 c7             	mov    %rax,%rdi
  8014dc:	48 b8 fd 34 80 00 00 	movabs $0x8034fd,%rax
  8014e3:	00 00 00 
  8014e6:	ff d0                	callq  *%rax
  8014e8:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8014ed:	7e 07                	jle    8014f6 <remove+0x2d>
  8014ef:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8014f4:	eb 33                	jmp    801529 <remove+0x60>
  8014f6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014fa:	48 89 c6             	mov    %rax,%rsi
  8014fd:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  801504:	00 00 00 
  801507:	48 b8 69 35 80 00 00 	movabs $0x803569,%rax
  80150e:	00 00 00 
  801511:	ff d0                	callq  *%rax
  801513:	be 00 00 00 00       	mov    $0x0,%esi
  801518:	bf 07 00 00 00       	mov    $0x7,%edi
  80151d:	48 b8 5c 10 80 00 00 	movabs $0x80105c,%rax
  801524:	00 00 00 
  801527:	ff d0                	callq  *%rax
  801529:	c9                   	leaveq 
  80152a:	c3                   	retq   

000000000080152b <sync>:
  80152b:	55                   	push   %rbp
  80152c:	48 89 e5             	mov    %rsp,%rbp
  80152f:	be 00 00 00 00       	mov    $0x0,%esi
  801534:	bf 08 00 00 00       	mov    $0x8,%edi
  801539:	48 b8 5c 10 80 00 00 	movabs $0x80105c,%rax
  801540:	00 00 00 
  801543:	ff d0                	callq  *%rax
  801545:	5d                   	pop    %rbp
  801546:	c3                   	retq   

0000000000801547 <copy>:
  801547:	55                   	push   %rbp
  801548:	48 89 e5             	mov    %rsp,%rbp
  80154b:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  801552:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  801559:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  801560:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  801567:	be 00 00 00 00       	mov    $0x0,%esi
  80156c:	48 89 c7             	mov    %rax,%rdi
  80156f:	48 b8 e5 10 80 00 00 	movabs $0x8010e5,%rax
  801576:	00 00 00 
  801579:	ff d0                	callq  *%rax
  80157b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80157e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801582:	79 28                	jns    8015ac <copy+0x65>
  801584:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801587:	89 c6                	mov    %eax,%esi
  801589:	48 bf 94 40 80 00 00 	movabs $0x804094,%rdi
  801590:	00 00 00 
  801593:	b8 00 00 00 00       	mov    $0x0,%eax
  801598:	48 ba d9 29 80 00 00 	movabs $0x8029d9,%rdx
  80159f:	00 00 00 
  8015a2:	ff d2                	callq  *%rdx
  8015a4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8015a7:	e9 76 01 00 00       	jmpq   801722 <copy+0x1db>
  8015ac:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  8015b3:	be 01 01 00 00       	mov    $0x101,%esi
  8015b8:	48 89 c7             	mov    %rax,%rdi
  8015bb:	48 b8 e5 10 80 00 00 	movabs $0x8010e5,%rax
  8015c2:	00 00 00 
  8015c5:	ff d0                	callq  *%rax
  8015c7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8015ca:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8015ce:	0f 89 ad 00 00 00    	jns    801681 <copy+0x13a>
  8015d4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8015d7:	89 c6                	mov    %eax,%esi
  8015d9:	48 bf aa 40 80 00 00 	movabs $0x8040aa,%rdi
  8015e0:	00 00 00 
  8015e3:	b8 00 00 00 00       	mov    $0x0,%eax
  8015e8:	48 ba d9 29 80 00 00 	movabs $0x8029d9,%rdx
  8015ef:	00 00 00 
  8015f2:	ff d2                	callq  *%rdx
  8015f4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8015f7:	89 c7                	mov    %eax,%edi
  8015f9:	48 b8 e9 09 80 00 00 	movabs $0x8009e9,%rax
  801600:	00 00 00 
  801603:	ff d0                	callq  *%rax
  801605:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801608:	e9 15 01 00 00       	jmpq   801722 <copy+0x1db>
  80160d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801610:	48 63 d0             	movslq %eax,%rdx
  801613:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  80161a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80161d:	48 89 ce             	mov    %rcx,%rsi
  801620:	89 c7                	mov    %eax,%edi
  801622:	48 b8 57 0d 80 00 00 	movabs $0x800d57,%rax
  801629:	00 00 00 
  80162c:	ff d0                	callq  *%rax
  80162e:	89 45 f0             	mov    %eax,-0x10(%rbp)
  801631:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  801635:	79 4a                	jns    801681 <copy+0x13a>
  801637:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80163a:	89 c6                	mov    %eax,%esi
  80163c:	48 bf c4 40 80 00 00 	movabs $0x8040c4,%rdi
  801643:	00 00 00 
  801646:	b8 00 00 00 00       	mov    $0x0,%eax
  80164b:	48 ba d9 29 80 00 00 	movabs $0x8029d9,%rdx
  801652:	00 00 00 
  801655:	ff d2                	callq  *%rdx
  801657:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80165a:	89 c7                	mov    %eax,%edi
  80165c:	48 b8 e9 09 80 00 00 	movabs $0x8009e9,%rax
  801663:	00 00 00 
  801666:	ff d0                	callq  *%rax
  801668:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80166b:	89 c7                	mov    %eax,%edi
  80166d:	48 b8 e9 09 80 00 00 	movabs $0x8009e9,%rax
  801674:	00 00 00 
  801677:	ff d0                	callq  *%rax
  801679:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80167c:	e9 a1 00 00 00       	jmpq   801722 <copy+0x1db>
  801681:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  801688:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80168b:	ba 00 02 00 00       	mov    $0x200,%edx
  801690:	48 89 ce             	mov    %rcx,%rsi
  801693:	89 c7                	mov    %eax,%edi
  801695:	48 b8 0c 0c 80 00 00 	movabs $0x800c0c,%rax
  80169c:	00 00 00 
  80169f:	ff d0                	callq  *%rax
  8016a1:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8016a4:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8016a8:	0f 8f 5f ff ff ff    	jg     80160d <copy+0xc6>
  8016ae:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8016b2:	79 47                	jns    8016fb <copy+0x1b4>
  8016b4:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8016b7:	89 c6                	mov    %eax,%esi
  8016b9:	48 bf d7 40 80 00 00 	movabs $0x8040d7,%rdi
  8016c0:	00 00 00 
  8016c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8016c8:	48 ba d9 29 80 00 00 	movabs $0x8029d9,%rdx
  8016cf:	00 00 00 
  8016d2:	ff d2                	callq  *%rdx
  8016d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8016d7:	89 c7                	mov    %eax,%edi
  8016d9:	48 b8 e9 09 80 00 00 	movabs $0x8009e9,%rax
  8016e0:	00 00 00 
  8016e3:	ff d0                	callq  *%rax
  8016e5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8016e8:	89 c7                	mov    %eax,%edi
  8016ea:	48 b8 e9 09 80 00 00 	movabs $0x8009e9,%rax
  8016f1:	00 00 00 
  8016f4:	ff d0                	callq  *%rax
  8016f6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8016f9:	eb 27                	jmp    801722 <copy+0x1db>
  8016fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8016fe:	89 c7                	mov    %eax,%edi
  801700:	48 b8 e9 09 80 00 00 	movabs $0x8009e9,%rax
  801707:	00 00 00 
  80170a:	ff d0                	callq  *%rax
  80170c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80170f:	89 c7                	mov    %eax,%edi
  801711:	48 b8 e9 09 80 00 00 	movabs $0x8009e9,%rax
  801718:	00 00 00 
  80171b:	ff d0                	callq  *%rax
  80171d:	b8 00 00 00 00       	mov    $0x0,%eax
  801722:	c9                   	leaveq 
  801723:	c3                   	retq   

0000000000801724 <fd2sockid>:
  801724:	55                   	push   %rbp
  801725:	48 89 e5             	mov    %rsp,%rbp
  801728:	48 83 ec 20          	sub    $0x20,%rsp
  80172c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80172f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801733:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801736:	48 89 d6             	mov    %rdx,%rsi
  801739:	89 c7                	mov    %eax,%edi
  80173b:	48 b8 d7 07 80 00 00 	movabs $0x8007d7,%rax
  801742:	00 00 00 
  801745:	ff d0                	callq  *%rax
  801747:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80174a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80174e:	79 05                	jns    801755 <fd2sockid+0x31>
  801750:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801753:	eb 24                	jmp    801779 <fd2sockid+0x55>
  801755:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801759:	8b 10                	mov    (%rax),%edx
  80175b:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  801762:	00 00 00 
  801765:	8b 00                	mov    (%rax),%eax
  801767:	39 c2                	cmp    %eax,%edx
  801769:	74 07                	je     801772 <fd2sockid+0x4e>
  80176b:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  801770:	eb 07                	jmp    801779 <fd2sockid+0x55>
  801772:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801776:	8b 40 0c             	mov    0xc(%rax),%eax
  801779:	c9                   	leaveq 
  80177a:	c3                   	retq   

000000000080177b <alloc_sockfd>:
  80177b:	55                   	push   %rbp
  80177c:	48 89 e5             	mov    %rsp,%rbp
  80177f:	48 83 ec 20          	sub    $0x20,%rsp
  801783:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801786:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80178a:	48 89 c7             	mov    %rax,%rdi
  80178d:	48 b8 3f 07 80 00 00 	movabs $0x80073f,%rax
  801794:	00 00 00 
  801797:	ff d0                	callq  *%rax
  801799:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80179c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8017a0:	78 26                	js     8017c8 <alloc_sockfd+0x4d>
  8017a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017a6:	ba 07 04 00 00       	mov    $0x407,%edx
  8017ab:	48 89 c6             	mov    %rax,%rsi
  8017ae:	bf 00 00 00 00       	mov    $0x0,%edi
  8017b3:	48 b8 f5 02 80 00 00 	movabs $0x8002f5,%rax
  8017ba:	00 00 00 
  8017bd:	ff d0                	callq  *%rax
  8017bf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8017c2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8017c6:	79 16                	jns    8017de <alloc_sockfd+0x63>
  8017c8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8017cb:	89 c7                	mov    %eax,%edi
  8017cd:	48 b8 8a 1c 80 00 00 	movabs $0x801c8a,%rax
  8017d4:	00 00 00 
  8017d7:	ff d0                	callq  *%rax
  8017d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8017dc:	eb 3a                	jmp    801818 <alloc_sockfd+0x9d>
  8017de:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017e2:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  8017e9:	00 00 00 
  8017ec:	8b 12                	mov    (%rdx),%edx
  8017ee:	89 10                	mov    %edx,(%rax)
  8017f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017f4:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8017fb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017ff:	8b 55 ec             	mov    -0x14(%rbp),%edx
  801802:	89 50 0c             	mov    %edx,0xc(%rax)
  801805:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801809:	48 89 c7             	mov    %rax,%rdi
  80180c:	48 b8 f1 06 80 00 00 	movabs $0x8006f1,%rax
  801813:	00 00 00 
  801816:	ff d0                	callq  *%rax
  801818:	c9                   	leaveq 
  801819:	c3                   	retq   

000000000080181a <accept>:
  80181a:	55                   	push   %rbp
  80181b:	48 89 e5             	mov    %rsp,%rbp
  80181e:	48 83 ec 30          	sub    $0x30,%rsp
  801822:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801825:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801829:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80182d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801830:	89 c7                	mov    %eax,%edi
  801832:	48 b8 24 17 80 00 00 	movabs $0x801724,%rax
  801839:	00 00 00 
  80183c:	ff d0                	callq  *%rax
  80183e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801841:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801845:	79 05                	jns    80184c <accept+0x32>
  801847:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80184a:	eb 3b                	jmp    801887 <accept+0x6d>
  80184c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801850:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  801854:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801857:	48 89 ce             	mov    %rcx,%rsi
  80185a:	89 c7                	mov    %eax,%edi
  80185c:	48 b8 67 1b 80 00 00 	movabs $0x801b67,%rax
  801863:	00 00 00 
  801866:	ff d0                	callq  *%rax
  801868:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80186b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80186f:	79 05                	jns    801876 <accept+0x5c>
  801871:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801874:	eb 11                	jmp    801887 <accept+0x6d>
  801876:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801879:	89 c7                	mov    %eax,%edi
  80187b:	48 b8 7b 17 80 00 00 	movabs $0x80177b,%rax
  801882:	00 00 00 
  801885:	ff d0                	callq  *%rax
  801887:	c9                   	leaveq 
  801888:	c3                   	retq   

0000000000801889 <bind>:
  801889:	55                   	push   %rbp
  80188a:	48 89 e5             	mov    %rsp,%rbp
  80188d:	48 83 ec 20          	sub    $0x20,%rsp
  801891:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801894:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801898:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80189b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80189e:	89 c7                	mov    %eax,%edi
  8018a0:	48 b8 24 17 80 00 00 	movabs $0x801724,%rax
  8018a7:	00 00 00 
  8018aa:	ff d0                	callq  *%rax
  8018ac:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8018af:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8018b3:	79 05                	jns    8018ba <bind+0x31>
  8018b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018b8:	eb 1b                	jmp    8018d5 <bind+0x4c>
  8018ba:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8018bd:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8018c1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018c4:	48 89 ce             	mov    %rcx,%rsi
  8018c7:	89 c7                	mov    %eax,%edi
  8018c9:	48 b8 e6 1b 80 00 00 	movabs $0x801be6,%rax
  8018d0:	00 00 00 
  8018d3:	ff d0                	callq  *%rax
  8018d5:	c9                   	leaveq 
  8018d6:	c3                   	retq   

00000000008018d7 <shutdown>:
  8018d7:	55                   	push   %rbp
  8018d8:	48 89 e5             	mov    %rsp,%rbp
  8018db:	48 83 ec 20          	sub    $0x20,%rsp
  8018df:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8018e2:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8018e5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8018e8:	89 c7                	mov    %eax,%edi
  8018ea:	48 b8 24 17 80 00 00 	movabs $0x801724,%rax
  8018f1:	00 00 00 
  8018f4:	ff d0                	callq  *%rax
  8018f6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8018f9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8018fd:	79 05                	jns    801904 <shutdown+0x2d>
  8018ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801902:	eb 16                	jmp    80191a <shutdown+0x43>
  801904:	8b 55 e8             	mov    -0x18(%rbp),%edx
  801907:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80190a:	89 d6                	mov    %edx,%esi
  80190c:	89 c7                	mov    %eax,%edi
  80190e:	48 b8 4a 1c 80 00 00 	movabs $0x801c4a,%rax
  801915:	00 00 00 
  801918:	ff d0                	callq  *%rax
  80191a:	c9                   	leaveq 
  80191b:	c3                   	retq   

000000000080191c <devsock_close>:
  80191c:	55                   	push   %rbp
  80191d:	48 89 e5             	mov    %rsp,%rbp
  801920:	48 83 ec 10          	sub    $0x10,%rsp
  801924:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801928:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80192c:	48 89 c7             	mov    %rax,%rdi
  80192f:	48 b8 ff 3e 80 00 00 	movabs $0x803eff,%rax
  801936:	00 00 00 
  801939:	ff d0                	callq  *%rax
  80193b:	83 f8 01             	cmp    $0x1,%eax
  80193e:	75 17                	jne    801957 <devsock_close+0x3b>
  801940:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801944:	8b 40 0c             	mov    0xc(%rax),%eax
  801947:	89 c7                	mov    %eax,%edi
  801949:	48 b8 8a 1c 80 00 00 	movabs $0x801c8a,%rax
  801950:	00 00 00 
  801953:	ff d0                	callq  *%rax
  801955:	eb 05                	jmp    80195c <devsock_close+0x40>
  801957:	b8 00 00 00 00       	mov    $0x0,%eax
  80195c:	c9                   	leaveq 
  80195d:	c3                   	retq   

000000000080195e <connect>:
  80195e:	55                   	push   %rbp
  80195f:	48 89 e5             	mov    %rsp,%rbp
  801962:	48 83 ec 20          	sub    $0x20,%rsp
  801966:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801969:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80196d:	89 55 e8             	mov    %edx,-0x18(%rbp)
  801970:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801973:	89 c7                	mov    %eax,%edi
  801975:	48 b8 24 17 80 00 00 	movabs $0x801724,%rax
  80197c:	00 00 00 
  80197f:	ff d0                	callq  *%rax
  801981:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801984:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801988:	79 05                	jns    80198f <connect+0x31>
  80198a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80198d:	eb 1b                	jmp    8019aa <connect+0x4c>
  80198f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  801992:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  801996:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801999:	48 89 ce             	mov    %rcx,%rsi
  80199c:	89 c7                	mov    %eax,%edi
  80199e:	48 b8 b7 1c 80 00 00 	movabs $0x801cb7,%rax
  8019a5:	00 00 00 
  8019a8:	ff d0                	callq  *%rax
  8019aa:	c9                   	leaveq 
  8019ab:	c3                   	retq   

00000000008019ac <listen>:
  8019ac:	55                   	push   %rbp
  8019ad:	48 89 e5             	mov    %rsp,%rbp
  8019b0:	48 83 ec 20          	sub    $0x20,%rsp
  8019b4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8019b7:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8019ba:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8019bd:	89 c7                	mov    %eax,%edi
  8019bf:	48 b8 24 17 80 00 00 	movabs $0x801724,%rax
  8019c6:	00 00 00 
  8019c9:	ff d0                	callq  *%rax
  8019cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8019ce:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8019d2:	79 05                	jns    8019d9 <listen+0x2d>
  8019d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019d7:	eb 16                	jmp    8019ef <listen+0x43>
  8019d9:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8019dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019df:	89 d6                	mov    %edx,%esi
  8019e1:	89 c7                	mov    %eax,%edi
  8019e3:	48 b8 1b 1d 80 00 00 	movabs $0x801d1b,%rax
  8019ea:	00 00 00 
  8019ed:	ff d0                	callq  *%rax
  8019ef:	c9                   	leaveq 
  8019f0:	c3                   	retq   

00000000008019f1 <devsock_read>:
  8019f1:	55                   	push   %rbp
  8019f2:	48 89 e5             	mov    %rsp,%rbp
  8019f5:	48 83 ec 20          	sub    $0x20,%rsp
  8019f9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8019fd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a01:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801a05:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a09:	89 c2                	mov    %eax,%edx
  801a0b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a0f:	8b 40 0c             	mov    0xc(%rax),%eax
  801a12:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  801a16:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a1b:	89 c7                	mov    %eax,%edi
  801a1d:	48 b8 5b 1d 80 00 00 	movabs $0x801d5b,%rax
  801a24:	00 00 00 
  801a27:	ff d0                	callq  *%rax
  801a29:	c9                   	leaveq 
  801a2a:	c3                   	retq   

0000000000801a2b <devsock_write>:
  801a2b:	55                   	push   %rbp
  801a2c:	48 89 e5             	mov    %rsp,%rbp
  801a2f:	48 83 ec 20          	sub    $0x20,%rsp
  801a33:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a37:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a3b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801a3f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a43:	89 c2                	mov    %eax,%edx
  801a45:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a49:	8b 40 0c             	mov    0xc(%rax),%eax
  801a4c:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  801a50:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a55:	89 c7                	mov    %eax,%edi
  801a57:	48 b8 27 1e 80 00 00 	movabs $0x801e27,%rax
  801a5e:	00 00 00 
  801a61:	ff d0                	callq  *%rax
  801a63:	c9                   	leaveq 
  801a64:	c3                   	retq   

0000000000801a65 <devsock_stat>:
  801a65:	55                   	push   %rbp
  801a66:	48 89 e5             	mov    %rsp,%rbp
  801a69:	48 83 ec 10          	sub    $0x10,%rsp
  801a6d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a71:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a75:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a79:	48 be f2 40 80 00 00 	movabs $0x8040f2,%rsi
  801a80:	00 00 00 
  801a83:	48 89 c7             	mov    %rax,%rdi
  801a86:	48 b8 69 35 80 00 00 	movabs $0x803569,%rax
  801a8d:	00 00 00 
  801a90:	ff d0                	callq  *%rax
  801a92:	b8 00 00 00 00       	mov    $0x0,%eax
  801a97:	c9                   	leaveq 
  801a98:	c3                   	retq   

0000000000801a99 <socket>:
  801a99:	55                   	push   %rbp
  801a9a:	48 89 e5             	mov    %rsp,%rbp
  801a9d:	48 83 ec 20          	sub    $0x20,%rsp
  801aa1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801aa4:	89 75 e8             	mov    %esi,-0x18(%rbp)
  801aa7:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  801aaa:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801aad:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  801ab0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801ab3:	89 ce                	mov    %ecx,%esi
  801ab5:	89 c7                	mov    %eax,%edi
  801ab7:	48 b8 df 1e 80 00 00 	movabs $0x801edf,%rax
  801abe:	00 00 00 
  801ac1:	ff d0                	callq  *%rax
  801ac3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801ac6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801aca:	79 05                	jns    801ad1 <socket+0x38>
  801acc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801acf:	eb 11                	jmp    801ae2 <socket+0x49>
  801ad1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ad4:	89 c7                	mov    %eax,%edi
  801ad6:	48 b8 7b 17 80 00 00 	movabs $0x80177b,%rax
  801add:	00 00 00 
  801ae0:	ff d0                	callq  *%rax
  801ae2:	c9                   	leaveq 
  801ae3:	c3                   	retq   

0000000000801ae4 <nsipc>:
  801ae4:	55                   	push   %rbp
  801ae5:	48 89 e5             	mov    %rsp,%rbp
  801ae8:	48 83 ec 10          	sub    $0x10,%rsp
  801aec:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801aef:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  801af6:	00 00 00 
  801af9:	8b 00                	mov    (%rax),%eax
  801afb:	85 c0                	test   %eax,%eax
  801afd:	75 1f                	jne    801b1e <nsipc+0x3a>
  801aff:	bf 02 00 00 00       	mov    $0x2,%edi
  801b04:	48 b8 8e 3e 80 00 00 	movabs $0x803e8e,%rax
  801b0b:	00 00 00 
  801b0e:	ff d0                	callq  *%rax
  801b10:	89 c2                	mov    %eax,%edx
  801b12:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  801b19:	00 00 00 
  801b1c:	89 10                	mov    %edx,(%rax)
  801b1e:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  801b25:	00 00 00 
  801b28:	8b 00                	mov    (%rax),%eax
  801b2a:	8b 75 fc             	mov    -0x4(%rbp),%esi
  801b2d:	b9 07 00 00 00       	mov    $0x7,%ecx
  801b32:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  801b39:	00 00 00 
  801b3c:	89 c7                	mov    %eax,%edi
  801b3e:	48 b8 84 3d 80 00 00 	movabs $0x803d84,%rax
  801b45:	00 00 00 
  801b48:	ff d0                	callq  *%rax
  801b4a:	ba 00 00 00 00       	mov    $0x0,%edx
  801b4f:	be 00 00 00 00       	mov    $0x0,%esi
  801b54:	bf 00 00 00 00       	mov    $0x0,%edi
  801b59:	48 b8 c3 3c 80 00 00 	movabs $0x803cc3,%rax
  801b60:	00 00 00 
  801b63:	ff d0                	callq  *%rax
  801b65:	c9                   	leaveq 
  801b66:	c3                   	retq   

0000000000801b67 <nsipc_accept>:
  801b67:	55                   	push   %rbp
  801b68:	48 89 e5             	mov    %rsp,%rbp
  801b6b:	48 83 ec 30          	sub    $0x30,%rsp
  801b6f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801b72:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801b76:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801b7a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801b81:	00 00 00 
  801b84:	8b 55 ec             	mov    -0x14(%rbp),%edx
  801b87:	89 10                	mov    %edx,(%rax)
  801b89:	bf 01 00 00 00       	mov    $0x1,%edi
  801b8e:	48 b8 e4 1a 80 00 00 	movabs $0x801ae4,%rax
  801b95:	00 00 00 
  801b98:	ff d0                	callq  *%rax
  801b9a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801b9d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801ba1:	78 3e                	js     801be1 <nsipc_accept+0x7a>
  801ba3:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801baa:	00 00 00 
  801bad:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801bb1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801bb5:	8b 40 10             	mov    0x10(%rax),%eax
  801bb8:	89 c2                	mov    %eax,%edx
  801bba:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801bbe:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801bc2:	48 89 ce             	mov    %rcx,%rsi
  801bc5:	48 89 c7             	mov    %rax,%rdi
  801bc8:	48 b8 8e 38 80 00 00 	movabs $0x80388e,%rax
  801bcf:	00 00 00 
  801bd2:	ff d0                	callq  *%rax
  801bd4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801bd8:	8b 50 10             	mov    0x10(%rax),%edx
  801bdb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801bdf:	89 10                	mov    %edx,(%rax)
  801be1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801be4:	c9                   	leaveq 
  801be5:	c3                   	retq   

0000000000801be6 <nsipc_bind>:
  801be6:	55                   	push   %rbp
  801be7:	48 89 e5             	mov    %rsp,%rbp
  801bea:	48 83 ec 10          	sub    $0x10,%rsp
  801bee:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bf1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bf5:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801bf8:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801bff:	00 00 00 
  801c02:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801c05:	89 10                	mov    %edx,(%rax)
  801c07:	8b 55 f8             	mov    -0x8(%rbp),%edx
  801c0a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801c0e:	48 89 c6             	mov    %rax,%rsi
  801c11:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  801c18:	00 00 00 
  801c1b:	48 b8 8e 38 80 00 00 	movabs $0x80388e,%rax
  801c22:	00 00 00 
  801c25:	ff d0                	callq  *%rax
  801c27:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801c2e:	00 00 00 
  801c31:	8b 55 f8             	mov    -0x8(%rbp),%edx
  801c34:	89 50 14             	mov    %edx,0x14(%rax)
  801c37:	bf 02 00 00 00       	mov    $0x2,%edi
  801c3c:	48 b8 e4 1a 80 00 00 	movabs $0x801ae4,%rax
  801c43:	00 00 00 
  801c46:	ff d0                	callq  *%rax
  801c48:	c9                   	leaveq 
  801c49:	c3                   	retq   

0000000000801c4a <nsipc_shutdown>:
  801c4a:	55                   	push   %rbp
  801c4b:	48 89 e5             	mov    %rsp,%rbp
  801c4e:	48 83 ec 10          	sub    $0x10,%rsp
  801c52:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c55:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801c58:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801c5f:	00 00 00 
  801c62:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801c65:	89 10                	mov    %edx,(%rax)
  801c67:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801c6e:	00 00 00 
  801c71:	8b 55 f8             	mov    -0x8(%rbp),%edx
  801c74:	89 50 04             	mov    %edx,0x4(%rax)
  801c77:	bf 03 00 00 00       	mov    $0x3,%edi
  801c7c:	48 b8 e4 1a 80 00 00 	movabs $0x801ae4,%rax
  801c83:	00 00 00 
  801c86:	ff d0                	callq  *%rax
  801c88:	c9                   	leaveq 
  801c89:	c3                   	retq   

0000000000801c8a <nsipc_close>:
  801c8a:	55                   	push   %rbp
  801c8b:	48 89 e5             	mov    %rsp,%rbp
  801c8e:	48 83 ec 10          	sub    $0x10,%rsp
  801c92:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c95:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801c9c:	00 00 00 
  801c9f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801ca2:	89 10                	mov    %edx,(%rax)
  801ca4:	bf 04 00 00 00       	mov    $0x4,%edi
  801ca9:	48 b8 e4 1a 80 00 00 	movabs $0x801ae4,%rax
  801cb0:	00 00 00 
  801cb3:	ff d0                	callq  *%rax
  801cb5:	c9                   	leaveq 
  801cb6:	c3                   	retq   

0000000000801cb7 <nsipc_connect>:
  801cb7:	55                   	push   %rbp
  801cb8:	48 89 e5             	mov    %rsp,%rbp
  801cbb:	48 83 ec 10          	sub    $0x10,%rsp
  801cbf:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cc2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801cc6:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801cc9:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801cd0:	00 00 00 
  801cd3:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801cd6:	89 10                	mov    %edx,(%rax)
  801cd8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  801cdb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801cdf:	48 89 c6             	mov    %rax,%rsi
  801ce2:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  801ce9:	00 00 00 
  801cec:	48 b8 8e 38 80 00 00 	movabs $0x80388e,%rax
  801cf3:	00 00 00 
  801cf6:	ff d0                	callq  *%rax
  801cf8:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801cff:	00 00 00 
  801d02:	8b 55 f8             	mov    -0x8(%rbp),%edx
  801d05:	89 50 14             	mov    %edx,0x14(%rax)
  801d08:	bf 05 00 00 00       	mov    $0x5,%edi
  801d0d:	48 b8 e4 1a 80 00 00 	movabs $0x801ae4,%rax
  801d14:	00 00 00 
  801d17:	ff d0                	callq  *%rax
  801d19:	c9                   	leaveq 
  801d1a:	c3                   	retq   

0000000000801d1b <nsipc_listen>:
  801d1b:	55                   	push   %rbp
  801d1c:	48 89 e5             	mov    %rsp,%rbp
  801d1f:	48 83 ec 10          	sub    $0x10,%rsp
  801d23:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d26:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801d29:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801d30:	00 00 00 
  801d33:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801d36:	89 10                	mov    %edx,(%rax)
  801d38:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801d3f:	00 00 00 
  801d42:	8b 55 f8             	mov    -0x8(%rbp),%edx
  801d45:	89 50 04             	mov    %edx,0x4(%rax)
  801d48:	bf 06 00 00 00       	mov    $0x6,%edi
  801d4d:	48 b8 e4 1a 80 00 00 	movabs $0x801ae4,%rax
  801d54:	00 00 00 
  801d57:	ff d0                	callq  *%rax
  801d59:	c9                   	leaveq 
  801d5a:	c3                   	retq   

0000000000801d5b <nsipc_recv>:
  801d5b:	55                   	push   %rbp
  801d5c:	48 89 e5             	mov    %rsp,%rbp
  801d5f:	48 83 ec 30          	sub    $0x30,%rsp
  801d63:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801d66:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801d6a:	89 55 e8             	mov    %edx,-0x18(%rbp)
  801d6d:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  801d70:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801d77:	00 00 00 
  801d7a:	8b 55 ec             	mov    -0x14(%rbp),%edx
  801d7d:	89 10                	mov    %edx,(%rax)
  801d7f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801d86:	00 00 00 
  801d89:	8b 55 e8             	mov    -0x18(%rbp),%edx
  801d8c:	89 50 04             	mov    %edx,0x4(%rax)
  801d8f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801d96:	00 00 00 
  801d99:	8b 55 dc             	mov    -0x24(%rbp),%edx
  801d9c:	89 50 08             	mov    %edx,0x8(%rax)
  801d9f:	bf 07 00 00 00       	mov    $0x7,%edi
  801da4:	48 b8 e4 1a 80 00 00 	movabs $0x801ae4,%rax
  801dab:	00 00 00 
  801dae:	ff d0                	callq  *%rax
  801db0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801db3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801db7:	78 69                	js     801e22 <nsipc_recv+0xc7>
  801db9:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  801dc0:	7f 08                	jg     801dca <nsipc_recv+0x6f>
  801dc2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801dc5:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  801dc8:	7e 35                	jle    801dff <nsipc_recv+0xa4>
  801dca:	48 b9 f9 40 80 00 00 	movabs $0x8040f9,%rcx
  801dd1:	00 00 00 
  801dd4:	48 ba 0e 41 80 00 00 	movabs $0x80410e,%rdx
  801ddb:	00 00 00 
  801dde:	be 62 00 00 00       	mov    $0x62,%esi
  801de3:	48 bf 23 41 80 00 00 	movabs $0x804123,%rdi
  801dea:	00 00 00 
  801ded:	b8 00 00 00 00       	mov    $0x0,%eax
  801df2:	49 b8 9f 27 80 00 00 	movabs $0x80279f,%r8
  801df9:	00 00 00 
  801dfc:	41 ff d0             	callq  *%r8
  801dff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e02:	48 63 d0             	movslq %eax,%rdx
  801e05:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801e09:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  801e10:	00 00 00 
  801e13:	48 89 c7             	mov    %rax,%rdi
  801e16:	48 b8 8e 38 80 00 00 	movabs $0x80388e,%rax
  801e1d:	00 00 00 
  801e20:	ff d0                	callq  *%rax
  801e22:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e25:	c9                   	leaveq 
  801e26:	c3                   	retq   

0000000000801e27 <nsipc_send>:
  801e27:	55                   	push   %rbp
  801e28:	48 89 e5             	mov    %rsp,%rbp
  801e2b:	48 83 ec 20          	sub    $0x20,%rsp
  801e2f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e32:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e36:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801e39:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  801e3c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801e43:	00 00 00 
  801e46:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801e49:	89 10                	mov    %edx,(%rax)
  801e4b:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  801e52:	7e 35                	jle    801e89 <nsipc_send+0x62>
  801e54:	48 b9 32 41 80 00 00 	movabs $0x804132,%rcx
  801e5b:	00 00 00 
  801e5e:	48 ba 0e 41 80 00 00 	movabs $0x80410e,%rdx
  801e65:	00 00 00 
  801e68:	be 6d 00 00 00       	mov    $0x6d,%esi
  801e6d:	48 bf 23 41 80 00 00 	movabs $0x804123,%rdi
  801e74:	00 00 00 
  801e77:	b8 00 00 00 00       	mov    $0x0,%eax
  801e7c:	49 b8 9f 27 80 00 00 	movabs $0x80279f,%r8
  801e83:	00 00 00 
  801e86:	41 ff d0             	callq  *%r8
  801e89:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e8c:	48 63 d0             	movslq %eax,%rdx
  801e8f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e93:	48 89 c6             	mov    %rax,%rsi
  801e96:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  801e9d:	00 00 00 
  801ea0:	48 b8 8e 38 80 00 00 	movabs $0x80388e,%rax
  801ea7:	00 00 00 
  801eaa:	ff d0                	callq  *%rax
  801eac:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801eb3:	00 00 00 
  801eb6:	8b 55 f8             	mov    -0x8(%rbp),%edx
  801eb9:	89 50 04             	mov    %edx,0x4(%rax)
  801ebc:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801ec3:	00 00 00 
  801ec6:	8b 55 ec             	mov    -0x14(%rbp),%edx
  801ec9:	89 50 08             	mov    %edx,0x8(%rax)
  801ecc:	bf 08 00 00 00       	mov    $0x8,%edi
  801ed1:	48 b8 e4 1a 80 00 00 	movabs $0x801ae4,%rax
  801ed8:	00 00 00 
  801edb:	ff d0                	callq  *%rax
  801edd:	c9                   	leaveq 
  801ede:	c3                   	retq   

0000000000801edf <nsipc_socket>:
  801edf:	55                   	push   %rbp
  801ee0:	48 89 e5             	mov    %rsp,%rbp
  801ee3:	48 83 ec 10          	sub    $0x10,%rsp
  801ee7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801eea:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801eed:	89 55 f4             	mov    %edx,-0xc(%rbp)
  801ef0:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801ef7:	00 00 00 
  801efa:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801efd:	89 10                	mov    %edx,(%rax)
  801eff:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801f06:	00 00 00 
  801f09:	8b 55 f8             	mov    -0x8(%rbp),%edx
  801f0c:	89 50 04             	mov    %edx,0x4(%rax)
  801f0f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  801f16:	00 00 00 
  801f19:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801f1c:	89 50 08             	mov    %edx,0x8(%rax)
  801f1f:	bf 09 00 00 00       	mov    $0x9,%edi
  801f24:	48 b8 e4 1a 80 00 00 	movabs $0x801ae4,%rax
  801f2b:	00 00 00 
  801f2e:	ff d0                	callq  *%rax
  801f30:	c9                   	leaveq 
  801f31:	c3                   	retq   

0000000000801f32 <pipe>:
  801f32:	55                   	push   %rbp
  801f33:	48 89 e5             	mov    %rsp,%rbp
  801f36:	53                   	push   %rbx
  801f37:	48 83 ec 38          	sub    $0x38,%rsp
  801f3b:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  801f3f:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  801f43:	48 89 c7             	mov    %rax,%rdi
  801f46:	48 b8 3f 07 80 00 00 	movabs $0x80073f,%rax
  801f4d:	00 00 00 
  801f50:	ff d0                	callq  *%rax
  801f52:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801f55:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801f59:	0f 88 bf 01 00 00    	js     80211e <pipe+0x1ec>
  801f5f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f63:	ba 07 04 00 00       	mov    $0x407,%edx
  801f68:	48 89 c6             	mov    %rax,%rsi
  801f6b:	bf 00 00 00 00       	mov    $0x0,%edi
  801f70:	48 b8 f5 02 80 00 00 	movabs $0x8002f5,%rax
  801f77:	00 00 00 
  801f7a:	ff d0                	callq  *%rax
  801f7c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801f7f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801f83:	0f 88 95 01 00 00    	js     80211e <pipe+0x1ec>
  801f89:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  801f8d:	48 89 c7             	mov    %rax,%rdi
  801f90:	48 b8 3f 07 80 00 00 	movabs $0x80073f,%rax
  801f97:	00 00 00 
  801f9a:	ff d0                	callq  *%rax
  801f9c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801f9f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801fa3:	0f 88 5d 01 00 00    	js     802106 <pipe+0x1d4>
  801fa9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801fad:	ba 07 04 00 00       	mov    $0x407,%edx
  801fb2:	48 89 c6             	mov    %rax,%rsi
  801fb5:	bf 00 00 00 00       	mov    $0x0,%edi
  801fba:	48 b8 f5 02 80 00 00 	movabs $0x8002f5,%rax
  801fc1:	00 00 00 
  801fc4:	ff d0                	callq  *%rax
  801fc6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801fc9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801fcd:	0f 88 33 01 00 00    	js     802106 <pipe+0x1d4>
  801fd3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fd7:	48 89 c7             	mov    %rax,%rdi
  801fda:	48 b8 14 07 80 00 00 	movabs $0x800714,%rax
  801fe1:	00 00 00 
  801fe4:	ff d0                	callq  *%rax
  801fe6:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801fea:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801fee:	ba 07 04 00 00       	mov    $0x407,%edx
  801ff3:	48 89 c6             	mov    %rax,%rsi
  801ff6:	bf 00 00 00 00       	mov    $0x0,%edi
  801ffb:	48 b8 f5 02 80 00 00 	movabs $0x8002f5,%rax
  802002:	00 00 00 
  802005:	ff d0                	callq  *%rax
  802007:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80200a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80200e:	0f 88 d9 00 00 00    	js     8020ed <pipe+0x1bb>
  802014:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802018:	48 89 c7             	mov    %rax,%rdi
  80201b:	48 b8 14 07 80 00 00 	movabs $0x800714,%rax
  802022:	00 00 00 
  802025:	ff d0                	callq  *%rax
  802027:	48 89 c2             	mov    %rax,%rdx
  80202a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80202e:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  802034:	48 89 d1             	mov    %rdx,%rcx
  802037:	ba 00 00 00 00       	mov    $0x0,%edx
  80203c:	48 89 c6             	mov    %rax,%rsi
  80203f:	bf 00 00 00 00       	mov    $0x0,%edi
  802044:	48 b8 47 03 80 00 00 	movabs $0x800347,%rax
  80204b:	00 00 00 
  80204e:	ff d0                	callq  *%rax
  802050:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802053:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802057:	78 79                	js     8020d2 <pipe+0x1a0>
  802059:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80205d:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  802064:	00 00 00 
  802067:	8b 12                	mov    (%rdx),%edx
  802069:	89 10                	mov    %edx,(%rax)
  80206b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80206f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  802076:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80207a:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  802081:	00 00 00 
  802084:	8b 12                	mov    (%rdx),%edx
  802086:	89 10                	mov    %edx,(%rax)
  802088:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80208c:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  802093:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802097:	48 89 c7             	mov    %rax,%rdi
  80209a:	48 b8 f1 06 80 00 00 	movabs $0x8006f1,%rax
  8020a1:	00 00 00 
  8020a4:	ff d0                	callq  *%rax
  8020a6:	89 c2                	mov    %eax,%edx
  8020a8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8020ac:	89 10                	mov    %edx,(%rax)
  8020ae:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8020b2:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8020b6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8020ba:	48 89 c7             	mov    %rax,%rdi
  8020bd:	48 b8 f1 06 80 00 00 	movabs $0x8006f1,%rax
  8020c4:	00 00 00 
  8020c7:	ff d0                	callq  *%rax
  8020c9:	89 03                	mov    %eax,(%rbx)
  8020cb:	b8 00 00 00 00       	mov    $0x0,%eax
  8020d0:	eb 4f                	jmp    802121 <pipe+0x1ef>
  8020d2:	90                   	nop
  8020d3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8020d7:	48 89 c6             	mov    %rax,%rsi
  8020da:	bf 00 00 00 00       	mov    $0x0,%edi
  8020df:	48 b8 a7 03 80 00 00 	movabs $0x8003a7,%rax
  8020e6:	00 00 00 
  8020e9:	ff d0                	callq  *%rax
  8020eb:	eb 01                	jmp    8020ee <pipe+0x1bc>
  8020ed:	90                   	nop
  8020ee:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8020f2:	48 89 c6             	mov    %rax,%rsi
  8020f5:	bf 00 00 00 00       	mov    $0x0,%edi
  8020fa:	48 b8 a7 03 80 00 00 	movabs $0x8003a7,%rax
  802101:	00 00 00 
  802104:	ff d0                	callq  *%rax
  802106:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80210a:	48 89 c6             	mov    %rax,%rsi
  80210d:	bf 00 00 00 00       	mov    $0x0,%edi
  802112:	48 b8 a7 03 80 00 00 	movabs $0x8003a7,%rax
  802119:	00 00 00 
  80211c:	ff d0                	callq  *%rax
  80211e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802121:	48 83 c4 38          	add    $0x38,%rsp
  802125:	5b                   	pop    %rbx
  802126:	5d                   	pop    %rbp
  802127:	c3                   	retq   

0000000000802128 <_pipeisclosed>:
  802128:	55                   	push   %rbp
  802129:	48 89 e5             	mov    %rsp,%rbp
  80212c:	53                   	push   %rbx
  80212d:	48 83 ec 28          	sub    $0x28,%rsp
  802131:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802135:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802139:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802140:	00 00 00 
  802143:	48 8b 00             	mov    (%rax),%rax
  802146:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  80214c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80214f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802153:	48 89 c7             	mov    %rax,%rdi
  802156:	48 b8 ff 3e 80 00 00 	movabs $0x803eff,%rax
  80215d:	00 00 00 
  802160:	ff d0                	callq  *%rax
  802162:	89 c3                	mov    %eax,%ebx
  802164:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802168:	48 89 c7             	mov    %rax,%rdi
  80216b:	48 b8 ff 3e 80 00 00 	movabs $0x803eff,%rax
  802172:	00 00 00 
  802175:	ff d0                	callq  *%rax
  802177:	39 c3                	cmp    %eax,%ebx
  802179:	0f 94 c0             	sete   %al
  80217c:	0f b6 c0             	movzbl %al,%eax
  80217f:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802182:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802189:	00 00 00 
  80218c:	48 8b 00             	mov    (%rax),%rax
  80218f:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  802195:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  802198:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80219b:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80219e:	75 05                	jne    8021a5 <_pipeisclosed+0x7d>
  8021a0:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8021a3:	eb 4a                	jmp    8021ef <_pipeisclosed+0xc7>
  8021a5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8021a8:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8021ab:	74 8c                	je     802139 <_pipeisclosed+0x11>
  8021ad:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  8021b1:	75 86                	jne    802139 <_pipeisclosed+0x11>
  8021b3:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8021ba:	00 00 00 
  8021bd:	48 8b 00             	mov    (%rax),%rax
  8021c0:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8021c6:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8021c9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8021cc:	89 c6                	mov    %eax,%esi
  8021ce:	48 bf 43 41 80 00 00 	movabs $0x804143,%rdi
  8021d5:	00 00 00 
  8021d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8021dd:	49 b8 d9 29 80 00 00 	movabs $0x8029d9,%r8
  8021e4:	00 00 00 
  8021e7:	41 ff d0             	callq  *%r8
  8021ea:	e9 4a ff ff ff       	jmpq   802139 <_pipeisclosed+0x11>
  8021ef:	48 83 c4 28          	add    $0x28,%rsp
  8021f3:	5b                   	pop    %rbx
  8021f4:	5d                   	pop    %rbp
  8021f5:	c3                   	retq   

00000000008021f6 <pipeisclosed>:
  8021f6:	55                   	push   %rbp
  8021f7:	48 89 e5             	mov    %rsp,%rbp
  8021fa:	48 83 ec 30          	sub    $0x30,%rsp
  8021fe:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802201:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802205:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802208:	48 89 d6             	mov    %rdx,%rsi
  80220b:	89 c7                	mov    %eax,%edi
  80220d:	48 b8 d7 07 80 00 00 	movabs $0x8007d7,%rax
  802214:	00 00 00 
  802217:	ff d0                	callq  *%rax
  802219:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80221c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802220:	79 05                	jns    802227 <pipeisclosed+0x31>
  802222:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802225:	eb 31                	jmp    802258 <pipeisclosed+0x62>
  802227:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80222b:	48 89 c7             	mov    %rax,%rdi
  80222e:	48 b8 14 07 80 00 00 	movabs $0x800714,%rax
  802235:	00 00 00 
  802238:	ff d0                	callq  *%rax
  80223a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80223e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802242:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802246:	48 89 d6             	mov    %rdx,%rsi
  802249:	48 89 c7             	mov    %rax,%rdi
  80224c:	48 b8 28 21 80 00 00 	movabs $0x802128,%rax
  802253:	00 00 00 
  802256:	ff d0                	callq  *%rax
  802258:	c9                   	leaveq 
  802259:	c3                   	retq   

000000000080225a <devpipe_read>:
  80225a:	55                   	push   %rbp
  80225b:	48 89 e5             	mov    %rsp,%rbp
  80225e:	48 83 ec 40          	sub    $0x40,%rsp
  802262:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802266:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80226a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80226e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802272:	48 89 c7             	mov    %rax,%rdi
  802275:	48 b8 14 07 80 00 00 	movabs $0x800714,%rax
  80227c:	00 00 00 
  80227f:	ff d0                	callq  *%rax
  802281:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802285:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802289:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80228d:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  802294:	00 
  802295:	e9 90 00 00 00       	jmpq   80232a <devpipe_read+0xd0>
  80229a:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  80229f:	74 09                	je     8022aa <devpipe_read+0x50>
  8022a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022a5:	e9 8e 00 00 00       	jmpq   802338 <devpipe_read+0xde>
  8022aa:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8022ae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8022b2:	48 89 d6             	mov    %rdx,%rsi
  8022b5:	48 89 c7             	mov    %rax,%rdi
  8022b8:	48 b8 28 21 80 00 00 	movabs $0x802128,%rax
  8022bf:	00 00 00 
  8022c2:	ff d0                	callq  *%rax
  8022c4:	85 c0                	test   %eax,%eax
  8022c6:	74 07                	je     8022cf <devpipe_read+0x75>
  8022c8:	b8 00 00 00 00       	mov    $0x0,%eax
  8022cd:	eb 69                	jmp    802338 <devpipe_read+0xde>
  8022cf:	48 b8 b8 02 80 00 00 	movabs $0x8002b8,%rax
  8022d6:	00 00 00 
  8022d9:	ff d0                	callq  *%rax
  8022db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022df:	8b 10                	mov    (%rax),%edx
  8022e1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022e5:	8b 40 04             	mov    0x4(%rax),%eax
  8022e8:	39 c2                	cmp    %eax,%edx
  8022ea:	74 ae                	je     80229a <devpipe_read+0x40>
  8022ec:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8022f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022f4:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8022f8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022fc:	8b 00                	mov    (%rax),%eax
  8022fe:	99                   	cltd   
  8022ff:	c1 ea 1b             	shr    $0x1b,%edx
  802302:	01 d0                	add    %edx,%eax
  802304:	83 e0 1f             	and    $0x1f,%eax
  802307:	29 d0                	sub    %edx,%eax
  802309:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80230d:	48 98                	cltq   
  80230f:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  802314:	88 01                	mov    %al,(%rcx)
  802316:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80231a:	8b 00                	mov    (%rax),%eax
  80231c:	8d 50 01             	lea    0x1(%rax),%edx
  80231f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802323:	89 10                	mov    %edx,(%rax)
  802325:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80232a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80232e:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802332:	72 a7                	jb     8022db <devpipe_read+0x81>
  802334:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802338:	c9                   	leaveq 
  802339:	c3                   	retq   

000000000080233a <devpipe_write>:
  80233a:	55                   	push   %rbp
  80233b:	48 89 e5             	mov    %rsp,%rbp
  80233e:	48 83 ec 40          	sub    $0x40,%rsp
  802342:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802346:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80234a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80234e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802352:	48 89 c7             	mov    %rax,%rdi
  802355:	48 b8 14 07 80 00 00 	movabs $0x800714,%rax
  80235c:	00 00 00 
  80235f:	ff d0                	callq  *%rax
  802361:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802365:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802369:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80236d:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  802374:	00 
  802375:	e9 8f 00 00 00       	jmpq   802409 <devpipe_write+0xcf>
  80237a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80237e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802382:	48 89 d6             	mov    %rdx,%rsi
  802385:	48 89 c7             	mov    %rax,%rdi
  802388:	48 b8 28 21 80 00 00 	movabs $0x802128,%rax
  80238f:	00 00 00 
  802392:	ff d0                	callq  *%rax
  802394:	85 c0                	test   %eax,%eax
  802396:	74 07                	je     80239f <devpipe_write+0x65>
  802398:	b8 00 00 00 00       	mov    $0x0,%eax
  80239d:	eb 78                	jmp    802417 <devpipe_write+0xdd>
  80239f:	48 b8 b8 02 80 00 00 	movabs $0x8002b8,%rax
  8023a6:	00 00 00 
  8023a9:	ff d0                	callq  *%rax
  8023ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023af:	8b 40 04             	mov    0x4(%rax),%eax
  8023b2:	48 63 d0             	movslq %eax,%rdx
  8023b5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023b9:	8b 00                	mov    (%rax),%eax
  8023bb:	48 98                	cltq   
  8023bd:	48 83 c0 20          	add    $0x20,%rax
  8023c1:	48 39 c2             	cmp    %rax,%rdx
  8023c4:	73 b4                	jae    80237a <devpipe_write+0x40>
  8023c6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023ca:	8b 40 04             	mov    0x4(%rax),%eax
  8023cd:	99                   	cltd   
  8023ce:	c1 ea 1b             	shr    $0x1b,%edx
  8023d1:	01 d0                	add    %edx,%eax
  8023d3:	83 e0 1f             	and    $0x1f,%eax
  8023d6:	29 d0                	sub    %edx,%eax
  8023d8:	89 c6                	mov    %eax,%esi
  8023da:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8023de:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023e2:	48 01 d0             	add    %rdx,%rax
  8023e5:	0f b6 08             	movzbl (%rax),%ecx
  8023e8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8023ec:	48 63 c6             	movslq %esi,%rax
  8023ef:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8023f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023f7:	8b 40 04             	mov    0x4(%rax),%eax
  8023fa:	8d 50 01             	lea    0x1(%rax),%edx
  8023fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802401:	89 50 04             	mov    %edx,0x4(%rax)
  802404:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  802409:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80240d:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802411:	72 98                	jb     8023ab <devpipe_write+0x71>
  802413:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802417:	c9                   	leaveq 
  802418:	c3                   	retq   

0000000000802419 <devpipe_stat>:
  802419:	55                   	push   %rbp
  80241a:	48 89 e5             	mov    %rsp,%rbp
  80241d:	48 83 ec 20          	sub    $0x20,%rsp
  802421:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802425:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802429:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80242d:	48 89 c7             	mov    %rax,%rdi
  802430:	48 b8 14 07 80 00 00 	movabs $0x800714,%rax
  802437:	00 00 00 
  80243a:	ff d0                	callq  *%rax
  80243c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802440:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802444:	48 be 56 41 80 00 00 	movabs $0x804156,%rsi
  80244b:	00 00 00 
  80244e:	48 89 c7             	mov    %rax,%rdi
  802451:	48 b8 69 35 80 00 00 	movabs $0x803569,%rax
  802458:	00 00 00 
  80245b:	ff d0                	callq  *%rax
  80245d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802461:	8b 50 04             	mov    0x4(%rax),%edx
  802464:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802468:	8b 00                	mov    (%rax),%eax
  80246a:	29 c2                	sub    %eax,%edx
  80246c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802470:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802476:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80247a:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802481:	00 00 00 
  802484:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802488:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  80248f:	00 00 00 
  802492:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  802499:	b8 00 00 00 00       	mov    $0x0,%eax
  80249e:	c9                   	leaveq 
  80249f:	c3                   	retq   

00000000008024a0 <devpipe_close>:
  8024a0:	55                   	push   %rbp
  8024a1:	48 89 e5             	mov    %rsp,%rbp
  8024a4:	48 83 ec 10          	sub    $0x10,%rsp
  8024a8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8024ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024b0:	48 89 c6             	mov    %rax,%rsi
  8024b3:	bf 00 00 00 00       	mov    $0x0,%edi
  8024b8:	48 b8 a7 03 80 00 00 	movabs $0x8003a7,%rax
  8024bf:	00 00 00 
  8024c2:	ff d0                	callq  *%rax
  8024c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024c8:	48 89 c7             	mov    %rax,%rdi
  8024cb:	48 b8 14 07 80 00 00 	movabs $0x800714,%rax
  8024d2:	00 00 00 
  8024d5:	ff d0                	callq  *%rax
  8024d7:	48 89 c6             	mov    %rax,%rsi
  8024da:	bf 00 00 00 00       	mov    $0x0,%edi
  8024df:	48 b8 a7 03 80 00 00 	movabs $0x8003a7,%rax
  8024e6:	00 00 00 
  8024e9:	ff d0                	callq  *%rax
  8024eb:	c9                   	leaveq 
  8024ec:	c3                   	retq   

00000000008024ed <cputchar>:
  8024ed:	55                   	push   %rbp
  8024ee:	48 89 e5             	mov    %rsp,%rbp
  8024f1:	48 83 ec 20          	sub    $0x20,%rsp
  8024f5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8024f8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8024fb:	88 45 ff             	mov    %al,-0x1(%rbp)
  8024fe:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  802502:	be 01 00 00 00       	mov    $0x1,%esi
  802507:	48 89 c7             	mov    %rax,%rdi
  80250a:	48 b8 ad 01 80 00 00 	movabs $0x8001ad,%rax
  802511:	00 00 00 
  802514:	ff d0                	callq  *%rax
  802516:	90                   	nop
  802517:	c9                   	leaveq 
  802518:	c3                   	retq   

0000000000802519 <getchar>:
  802519:	55                   	push   %rbp
  80251a:	48 89 e5             	mov    %rsp,%rbp
  80251d:	48 83 ec 10          	sub    $0x10,%rsp
  802521:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  802525:	ba 01 00 00 00       	mov    $0x1,%edx
  80252a:	48 89 c6             	mov    %rax,%rsi
  80252d:	bf 00 00 00 00       	mov    $0x0,%edi
  802532:	48 b8 0c 0c 80 00 00 	movabs $0x800c0c,%rax
  802539:	00 00 00 
  80253c:	ff d0                	callq  *%rax
  80253e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802541:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802545:	79 05                	jns    80254c <getchar+0x33>
  802547:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80254a:	eb 14                	jmp    802560 <getchar+0x47>
  80254c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802550:	7f 07                	jg     802559 <getchar+0x40>
  802552:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  802557:	eb 07                	jmp    802560 <getchar+0x47>
  802559:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  80255d:	0f b6 c0             	movzbl %al,%eax
  802560:	c9                   	leaveq 
  802561:	c3                   	retq   

0000000000802562 <iscons>:
  802562:	55                   	push   %rbp
  802563:	48 89 e5             	mov    %rsp,%rbp
  802566:	48 83 ec 20          	sub    $0x20,%rsp
  80256a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80256d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802571:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802574:	48 89 d6             	mov    %rdx,%rsi
  802577:	89 c7                	mov    %eax,%edi
  802579:	48 b8 d7 07 80 00 00 	movabs $0x8007d7,%rax
  802580:	00 00 00 
  802583:	ff d0                	callq  *%rax
  802585:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802588:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80258c:	79 05                	jns    802593 <iscons+0x31>
  80258e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802591:	eb 1a                	jmp    8025ad <iscons+0x4b>
  802593:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802597:	8b 10                	mov    (%rax),%edx
  802599:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  8025a0:	00 00 00 
  8025a3:	8b 00                	mov    (%rax),%eax
  8025a5:	39 c2                	cmp    %eax,%edx
  8025a7:	0f 94 c0             	sete   %al
  8025aa:	0f b6 c0             	movzbl %al,%eax
  8025ad:	c9                   	leaveq 
  8025ae:	c3                   	retq   

00000000008025af <opencons>:
  8025af:	55                   	push   %rbp
  8025b0:	48 89 e5             	mov    %rsp,%rbp
  8025b3:	48 83 ec 10          	sub    $0x10,%rsp
  8025b7:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8025bb:	48 89 c7             	mov    %rax,%rdi
  8025be:	48 b8 3f 07 80 00 00 	movabs $0x80073f,%rax
  8025c5:	00 00 00 
  8025c8:	ff d0                	callq  *%rax
  8025ca:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025cd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025d1:	79 05                	jns    8025d8 <opencons+0x29>
  8025d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025d6:	eb 5b                	jmp    802633 <opencons+0x84>
  8025d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025dc:	ba 07 04 00 00       	mov    $0x407,%edx
  8025e1:	48 89 c6             	mov    %rax,%rsi
  8025e4:	bf 00 00 00 00       	mov    $0x0,%edi
  8025e9:	48 b8 f5 02 80 00 00 	movabs $0x8002f5,%rax
  8025f0:	00 00 00 
  8025f3:	ff d0                	callq  *%rax
  8025f5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025f8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025fc:	79 05                	jns    802603 <opencons+0x54>
  8025fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802601:	eb 30                	jmp    802633 <opencons+0x84>
  802603:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802607:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  80260e:	00 00 00 
  802611:	8b 12                	mov    (%rdx),%edx
  802613:	89 10                	mov    %edx,(%rax)
  802615:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802619:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  802620:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802624:	48 89 c7             	mov    %rax,%rdi
  802627:	48 b8 f1 06 80 00 00 	movabs $0x8006f1,%rax
  80262e:	00 00 00 
  802631:	ff d0                	callq  *%rax
  802633:	c9                   	leaveq 
  802634:	c3                   	retq   

0000000000802635 <devcons_read>:
  802635:	55                   	push   %rbp
  802636:	48 89 e5             	mov    %rsp,%rbp
  802639:	48 83 ec 30          	sub    $0x30,%rsp
  80263d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802641:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802645:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802649:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80264e:	75 13                	jne    802663 <devcons_read+0x2e>
  802650:	b8 00 00 00 00       	mov    $0x0,%eax
  802655:	eb 49                	jmp    8026a0 <devcons_read+0x6b>
  802657:	48 b8 b8 02 80 00 00 	movabs $0x8002b8,%rax
  80265e:	00 00 00 
  802661:	ff d0                	callq  *%rax
  802663:	48 b8 fa 01 80 00 00 	movabs $0x8001fa,%rax
  80266a:	00 00 00 
  80266d:	ff d0                	callq  *%rax
  80266f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802672:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802676:	74 df                	je     802657 <devcons_read+0x22>
  802678:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80267c:	79 05                	jns    802683 <devcons_read+0x4e>
  80267e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802681:	eb 1d                	jmp    8026a0 <devcons_read+0x6b>
  802683:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  802687:	75 07                	jne    802690 <devcons_read+0x5b>
  802689:	b8 00 00 00 00       	mov    $0x0,%eax
  80268e:	eb 10                	jmp    8026a0 <devcons_read+0x6b>
  802690:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802693:	89 c2                	mov    %eax,%edx
  802695:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802699:	88 10                	mov    %dl,(%rax)
  80269b:	b8 01 00 00 00       	mov    $0x1,%eax
  8026a0:	c9                   	leaveq 
  8026a1:	c3                   	retq   

00000000008026a2 <devcons_write>:
  8026a2:	55                   	push   %rbp
  8026a3:	48 89 e5             	mov    %rsp,%rbp
  8026a6:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8026ad:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8026b4:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8026bb:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8026c2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8026c9:	eb 76                	jmp    802741 <devcons_write+0x9f>
  8026cb:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8026d2:	89 c2                	mov    %eax,%edx
  8026d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026d7:	29 c2                	sub    %eax,%edx
  8026d9:	89 d0                	mov    %edx,%eax
  8026db:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8026de:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8026e1:	83 f8 7f             	cmp    $0x7f,%eax
  8026e4:	76 07                	jbe    8026ed <devcons_write+0x4b>
  8026e6:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8026ed:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8026f0:	48 63 d0             	movslq %eax,%rdx
  8026f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026f6:	48 63 c8             	movslq %eax,%rcx
  8026f9:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  802700:	48 01 c1             	add    %rax,%rcx
  802703:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80270a:	48 89 ce             	mov    %rcx,%rsi
  80270d:	48 89 c7             	mov    %rax,%rdi
  802710:	48 b8 8e 38 80 00 00 	movabs $0x80388e,%rax
  802717:	00 00 00 
  80271a:	ff d0                	callq  *%rax
  80271c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80271f:	48 63 d0             	movslq %eax,%rdx
  802722:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  802729:	48 89 d6             	mov    %rdx,%rsi
  80272c:	48 89 c7             	mov    %rax,%rdi
  80272f:	48 b8 ad 01 80 00 00 	movabs $0x8001ad,%rax
  802736:	00 00 00 
  802739:	ff d0                	callq  *%rax
  80273b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80273e:	01 45 fc             	add    %eax,-0x4(%rbp)
  802741:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802744:	48 98                	cltq   
  802746:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  80274d:	0f 82 78 ff ff ff    	jb     8026cb <devcons_write+0x29>
  802753:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802756:	c9                   	leaveq 
  802757:	c3                   	retq   

0000000000802758 <devcons_close>:
  802758:	55                   	push   %rbp
  802759:	48 89 e5             	mov    %rsp,%rbp
  80275c:	48 83 ec 08          	sub    $0x8,%rsp
  802760:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802764:	b8 00 00 00 00       	mov    $0x0,%eax
  802769:	c9                   	leaveq 
  80276a:	c3                   	retq   

000000000080276b <devcons_stat>:
  80276b:	55                   	push   %rbp
  80276c:	48 89 e5             	mov    %rsp,%rbp
  80276f:	48 83 ec 10          	sub    $0x10,%rsp
  802773:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802777:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80277b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80277f:	48 be 62 41 80 00 00 	movabs $0x804162,%rsi
  802786:	00 00 00 
  802789:	48 89 c7             	mov    %rax,%rdi
  80278c:	48 b8 69 35 80 00 00 	movabs $0x803569,%rax
  802793:	00 00 00 
  802796:	ff d0                	callq  *%rax
  802798:	b8 00 00 00 00       	mov    $0x0,%eax
  80279d:	c9                   	leaveq 
  80279e:	c3                   	retq   

000000000080279f <_panic>:
  80279f:	55                   	push   %rbp
  8027a0:	48 89 e5             	mov    %rsp,%rbp
  8027a3:	53                   	push   %rbx
  8027a4:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8027ab:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8027b2:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8027b8:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8027bf:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  8027c6:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8027cd:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8027d4:	84 c0                	test   %al,%al
  8027d6:	74 23                	je     8027fb <_panic+0x5c>
  8027d8:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  8027df:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  8027e3:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  8027e7:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  8027eb:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  8027ef:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  8027f3:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  8027f7:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  8027fb:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  802802:	00 00 00 
  802805:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80280c:	00 00 00 
  80280f:	48 8d 45 10          	lea    0x10(%rbp),%rax
  802813:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80281a:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  802821:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  802828:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  80282f:	00 00 00 
  802832:	48 8b 18             	mov    (%rax),%rbx
  802835:	48 b8 7c 02 80 00 00 	movabs $0x80027c,%rax
  80283c:	00 00 00 
  80283f:	ff d0                	callq  *%rax
  802841:	89 c6                	mov    %eax,%esi
  802843:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  802849:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  802850:	41 89 d0             	mov    %edx,%r8d
  802853:	48 89 c1             	mov    %rax,%rcx
  802856:	48 89 da             	mov    %rbx,%rdx
  802859:	48 bf 70 41 80 00 00 	movabs $0x804170,%rdi
  802860:	00 00 00 
  802863:	b8 00 00 00 00       	mov    $0x0,%eax
  802868:	49 b9 d9 29 80 00 00 	movabs $0x8029d9,%r9
  80286f:	00 00 00 
  802872:	41 ff d1             	callq  *%r9
  802875:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  80287c:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  802883:	48 89 d6             	mov    %rdx,%rsi
  802886:	48 89 c7             	mov    %rax,%rdi
  802889:	48 b8 2d 29 80 00 00 	movabs $0x80292d,%rax
  802890:	00 00 00 
  802893:	ff d0                	callq  *%rax
  802895:	48 bf 93 41 80 00 00 	movabs $0x804193,%rdi
  80289c:	00 00 00 
  80289f:	b8 00 00 00 00       	mov    $0x0,%eax
  8028a4:	48 ba d9 29 80 00 00 	movabs $0x8029d9,%rdx
  8028ab:	00 00 00 
  8028ae:	ff d2                	callq  *%rdx
  8028b0:	cc                   	int3   
  8028b1:	eb fd                	jmp    8028b0 <_panic+0x111>

00000000008028b3 <putch>:
  8028b3:	55                   	push   %rbp
  8028b4:	48 89 e5             	mov    %rsp,%rbp
  8028b7:	48 83 ec 10          	sub    $0x10,%rsp
  8028bb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8028be:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8028c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028c6:	8b 00                	mov    (%rax),%eax
  8028c8:	8d 48 01             	lea    0x1(%rax),%ecx
  8028cb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8028cf:	89 0a                	mov    %ecx,(%rdx)
  8028d1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8028d4:	89 d1                	mov    %edx,%ecx
  8028d6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8028da:	48 98                	cltq   
  8028dc:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8028e0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028e4:	8b 00                	mov    (%rax),%eax
  8028e6:	3d ff 00 00 00       	cmp    $0xff,%eax
  8028eb:	75 2c                	jne    802919 <putch+0x66>
  8028ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028f1:	8b 00                	mov    (%rax),%eax
  8028f3:	48 98                	cltq   
  8028f5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8028f9:	48 83 c2 08          	add    $0x8,%rdx
  8028fd:	48 89 c6             	mov    %rax,%rsi
  802900:	48 89 d7             	mov    %rdx,%rdi
  802903:	48 b8 ad 01 80 00 00 	movabs $0x8001ad,%rax
  80290a:	00 00 00 
  80290d:	ff d0                	callq  *%rax
  80290f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802913:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  802919:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80291d:	8b 40 04             	mov    0x4(%rax),%eax
  802920:	8d 50 01             	lea    0x1(%rax),%edx
  802923:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802927:	89 50 04             	mov    %edx,0x4(%rax)
  80292a:	90                   	nop
  80292b:	c9                   	leaveq 
  80292c:	c3                   	retq   

000000000080292d <vcprintf>:
  80292d:	55                   	push   %rbp
  80292e:	48 89 e5             	mov    %rsp,%rbp
  802931:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  802938:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  80293f:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  802946:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  80294d:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  802954:	48 8b 0a             	mov    (%rdx),%rcx
  802957:	48 89 08             	mov    %rcx,(%rax)
  80295a:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80295e:	48 89 48 08          	mov    %rcx,0x8(%rax)
  802962:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  802966:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80296a:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  802971:	00 00 00 
  802974:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80297b:	00 00 00 
  80297e:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  802985:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80298c:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  802993:	48 89 c6             	mov    %rax,%rsi
  802996:	48 bf b3 28 80 00 00 	movabs $0x8028b3,%rdi
  80299d:	00 00 00 
  8029a0:	48 b8 77 2d 80 00 00 	movabs $0x802d77,%rax
  8029a7:	00 00 00 
  8029aa:	ff d0                	callq  *%rax
  8029ac:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8029b2:	48 98                	cltq   
  8029b4:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8029bb:	48 83 c2 08          	add    $0x8,%rdx
  8029bf:	48 89 c6             	mov    %rax,%rsi
  8029c2:	48 89 d7             	mov    %rdx,%rdi
  8029c5:	48 b8 ad 01 80 00 00 	movabs $0x8001ad,%rax
  8029cc:	00 00 00 
  8029cf:	ff d0                	callq  *%rax
  8029d1:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8029d7:	c9                   	leaveq 
  8029d8:	c3                   	retq   

00000000008029d9 <cprintf>:
  8029d9:	55                   	push   %rbp
  8029da:	48 89 e5             	mov    %rsp,%rbp
  8029dd:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  8029e4:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8029eb:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8029f2:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8029f9:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  802a00:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  802a07:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  802a0e:	84 c0                	test   %al,%al
  802a10:	74 20                	je     802a32 <cprintf+0x59>
  802a12:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  802a16:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  802a1a:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  802a1e:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  802a22:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  802a26:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  802a2a:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  802a2e:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  802a32:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  802a39:	00 00 00 
  802a3c:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  802a43:	00 00 00 
  802a46:	48 8d 45 10          	lea    0x10(%rbp),%rax
  802a4a:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  802a51:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  802a58:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  802a5f:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  802a66:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  802a6d:	48 8b 0a             	mov    (%rdx),%rcx
  802a70:	48 89 08             	mov    %rcx,(%rax)
  802a73:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  802a77:	48 89 48 08          	mov    %rcx,0x8(%rax)
  802a7b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  802a7f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  802a83:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  802a8a:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  802a91:	48 89 d6             	mov    %rdx,%rsi
  802a94:	48 89 c7             	mov    %rax,%rdi
  802a97:	48 b8 2d 29 80 00 00 	movabs $0x80292d,%rax
  802a9e:	00 00 00 
  802aa1:	ff d0                	callq  *%rax
  802aa3:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  802aa9:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  802aaf:	c9                   	leaveq 
  802ab0:	c3                   	retq   

0000000000802ab1 <printnum>:
  802ab1:	55                   	push   %rbp
  802ab2:	48 89 e5             	mov    %rsp,%rbp
  802ab5:	48 83 ec 30          	sub    $0x30,%rsp
  802ab9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802abd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802ac1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  802ac5:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  802ac8:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  802acc:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  802ad0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802ad3:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  802ad7:	77 54                	ja     802b2d <printnum+0x7c>
  802ad9:	8b 45 e0             	mov    -0x20(%rbp),%eax
  802adc:	8d 78 ff             	lea    -0x1(%rax),%edi
  802adf:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  802ae2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ae6:	ba 00 00 00 00       	mov    $0x0,%edx
  802aeb:	48 f7 f6             	div    %rsi
  802aee:	49 89 c2             	mov    %rax,%r10
  802af1:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  802af4:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802af7:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  802afb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802aff:	41 89 c9             	mov    %ecx,%r9d
  802b02:	41 89 f8             	mov    %edi,%r8d
  802b05:	89 d1                	mov    %edx,%ecx
  802b07:	4c 89 d2             	mov    %r10,%rdx
  802b0a:	48 89 c7             	mov    %rax,%rdi
  802b0d:	48 b8 b1 2a 80 00 00 	movabs $0x802ab1,%rax
  802b14:	00 00 00 
  802b17:	ff d0                	callq  *%rax
  802b19:	eb 1c                	jmp    802b37 <printnum+0x86>
  802b1b:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  802b1f:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802b22:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b26:	48 89 ce             	mov    %rcx,%rsi
  802b29:	89 d7                	mov    %edx,%edi
  802b2b:	ff d0                	callq  *%rax
  802b2d:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  802b31:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  802b35:	7f e4                	jg     802b1b <printnum+0x6a>
  802b37:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  802b3a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b3e:	ba 00 00 00 00       	mov    $0x0,%edx
  802b43:	48 f7 f1             	div    %rcx
  802b46:	48 b8 90 43 80 00 00 	movabs $0x804390,%rax
  802b4d:	00 00 00 
  802b50:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  802b54:	0f be d0             	movsbl %al,%edx
  802b57:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  802b5b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b5f:	48 89 ce             	mov    %rcx,%rsi
  802b62:	89 d7                	mov    %edx,%edi
  802b64:	ff d0                	callq  *%rax
  802b66:	90                   	nop
  802b67:	c9                   	leaveq 
  802b68:	c3                   	retq   

0000000000802b69 <getuint>:
  802b69:	55                   	push   %rbp
  802b6a:	48 89 e5             	mov    %rsp,%rbp
  802b6d:	48 83 ec 20          	sub    $0x20,%rsp
  802b71:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802b75:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802b78:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  802b7c:	7e 4f                	jle    802bcd <getuint+0x64>
  802b7e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b82:	8b 00                	mov    (%rax),%eax
  802b84:	83 f8 30             	cmp    $0x30,%eax
  802b87:	73 24                	jae    802bad <getuint+0x44>
  802b89:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b8d:	48 8b 50 10          	mov    0x10(%rax),%rdx
  802b91:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b95:	8b 00                	mov    (%rax),%eax
  802b97:	89 c0                	mov    %eax,%eax
  802b99:	48 01 d0             	add    %rdx,%rax
  802b9c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802ba0:	8b 12                	mov    (%rdx),%edx
  802ba2:	8d 4a 08             	lea    0x8(%rdx),%ecx
  802ba5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802ba9:	89 0a                	mov    %ecx,(%rdx)
  802bab:	eb 14                	jmp    802bc1 <getuint+0x58>
  802bad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bb1:	48 8b 40 08          	mov    0x8(%rax),%rax
  802bb5:	48 8d 48 08          	lea    0x8(%rax),%rcx
  802bb9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802bbd:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  802bc1:	48 8b 00             	mov    (%rax),%rax
  802bc4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802bc8:	e9 9d 00 00 00       	jmpq   802c6a <getuint+0x101>
  802bcd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  802bd1:	74 4c                	je     802c1f <getuint+0xb6>
  802bd3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bd7:	8b 00                	mov    (%rax),%eax
  802bd9:	83 f8 30             	cmp    $0x30,%eax
  802bdc:	73 24                	jae    802c02 <getuint+0x99>
  802bde:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802be2:	48 8b 50 10          	mov    0x10(%rax),%rdx
  802be6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802bea:	8b 00                	mov    (%rax),%eax
  802bec:	89 c0                	mov    %eax,%eax
  802bee:	48 01 d0             	add    %rdx,%rax
  802bf1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802bf5:	8b 12                	mov    (%rdx),%edx
  802bf7:	8d 4a 08             	lea    0x8(%rdx),%ecx
  802bfa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802bfe:	89 0a                	mov    %ecx,(%rdx)
  802c00:	eb 14                	jmp    802c16 <getuint+0xad>
  802c02:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c06:	48 8b 40 08          	mov    0x8(%rax),%rax
  802c0a:	48 8d 48 08          	lea    0x8(%rax),%rcx
  802c0e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802c12:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  802c16:	48 8b 00             	mov    (%rax),%rax
  802c19:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802c1d:	eb 4b                	jmp    802c6a <getuint+0x101>
  802c1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c23:	8b 00                	mov    (%rax),%eax
  802c25:	83 f8 30             	cmp    $0x30,%eax
  802c28:	73 24                	jae    802c4e <getuint+0xe5>
  802c2a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c2e:	48 8b 50 10          	mov    0x10(%rax),%rdx
  802c32:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c36:	8b 00                	mov    (%rax),%eax
  802c38:	89 c0                	mov    %eax,%eax
  802c3a:	48 01 d0             	add    %rdx,%rax
  802c3d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802c41:	8b 12                	mov    (%rdx),%edx
  802c43:	8d 4a 08             	lea    0x8(%rdx),%ecx
  802c46:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802c4a:	89 0a                	mov    %ecx,(%rdx)
  802c4c:	eb 14                	jmp    802c62 <getuint+0xf9>
  802c4e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c52:	48 8b 40 08          	mov    0x8(%rax),%rax
  802c56:	48 8d 48 08          	lea    0x8(%rax),%rcx
  802c5a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802c5e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  802c62:	8b 00                	mov    (%rax),%eax
  802c64:	89 c0                	mov    %eax,%eax
  802c66:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802c6a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c6e:	c9                   	leaveq 
  802c6f:	c3                   	retq   

0000000000802c70 <getint>:
  802c70:	55                   	push   %rbp
  802c71:	48 89 e5             	mov    %rsp,%rbp
  802c74:	48 83 ec 20          	sub    $0x20,%rsp
  802c78:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802c7c:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802c7f:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  802c83:	7e 4f                	jle    802cd4 <getint+0x64>
  802c85:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c89:	8b 00                	mov    (%rax),%eax
  802c8b:	83 f8 30             	cmp    $0x30,%eax
  802c8e:	73 24                	jae    802cb4 <getint+0x44>
  802c90:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c94:	48 8b 50 10          	mov    0x10(%rax),%rdx
  802c98:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c9c:	8b 00                	mov    (%rax),%eax
  802c9e:	89 c0                	mov    %eax,%eax
  802ca0:	48 01 d0             	add    %rdx,%rax
  802ca3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802ca7:	8b 12                	mov    (%rdx),%edx
  802ca9:	8d 4a 08             	lea    0x8(%rdx),%ecx
  802cac:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802cb0:	89 0a                	mov    %ecx,(%rdx)
  802cb2:	eb 14                	jmp    802cc8 <getint+0x58>
  802cb4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cb8:	48 8b 40 08          	mov    0x8(%rax),%rax
  802cbc:	48 8d 48 08          	lea    0x8(%rax),%rcx
  802cc0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802cc4:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  802cc8:	48 8b 00             	mov    (%rax),%rax
  802ccb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802ccf:	e9 9d 00 00 00       	jmpq   802d71 <getint+0x101>
  802cd4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  802cd8:	74 4c                	je     802d26 <getint+0xb6>
  802cda:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cde:	8b 00                	mov    (%rax),%eax
  802ce0:	83 f8 30             	cmp    $0x30,%eax
  802ce3:	73 24                	jae    802d09 <getint+0x99>
  802ce5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ce9:	48 8b 50 10          	mov    0x10(%rax),%rdx
  802ced:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cf1:	8b 00                	mov    (%rax),%eax
  802cf3:	89 c0                	mov    %eax,%eax
  802cf5:	48 01 d0             	add    %rdx,%rax
  802cf8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802cfc:	8b 12                	mov    (%rdx),%edx
  802cfe:	8d 4a 08             	lea    0x8(%rdx),%ecx
  802d01:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802d05:	89 0a                	mov    %ecx,(%rdx)
  802d07:	eb 14                	jmp    802d1d <getint+0xad>
  802d09:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d0d:	48 8b 40 08          	mov    0x8(%rax),%rax
  802d11:	48 8d 48 08          	lea    0x8(%rax),%rcx
  802d15:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802d19:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  802d1d:	48 8b 00             	mov    (%rax),%rax
  802d20:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802d24:	eb 4b                	jmp    802d71 <getint+0x101>
  802d26:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d2a:	8b 00                	mov    (%rax),%eax
  802d2c:	83 f8 30             	cmp    $0x30,%eax
  802d2f:	73 24                	jae    802d55 <getint+0xe5>
  802d31:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d35:	48 8b 50 10          	mov    0x10(%rax),%rdx
  802d39:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d3d:	8b 00                	mov    (%rax),%eax
  802d3f:	89 c0                	mov    %eax,%eax
  802d41:	48 01 d0             	add    %rdx,%rax
  802d44:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802d48:	8b 12                	mov    (%rdx),%edx
  802d4a:	8d 4a 08             	lea    0x8(%rdx),%ecx
  802d4d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802d51:	89 0a                	mov    %ecx,(%rdx)
  802d53:	eb 14                	jmp    802d69 <getint+0xf9>
  802d55:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d59:	48 8b 40 08          	mov    0x8(%rax),%rax
  802d5d:	48 8d 48 08          	lea    0x8(%rax),%rcx
  802d61:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802d65:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  802d69:	8b 00                	mov    (%rax),%eax
  802d6b:	48 98                	cltq   
  802d6d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802d71:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d75:	c9                   	leaveq 
  802d76:	c3                   	retq   

0000000000802d77 <vprintfmt>:
  802d77:	55                   	push   %rbp
  802d78:	48 89 e5             	mov    %rsp,%rbp
  802d7b:	41 54                	push   %r12
  802d7d:	53                   	push   %rbx
  802d7e:	48 83 ec 60          	sub    $0x60,%rsp
  802d82:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  802d86:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  802d8a:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  802d8e:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  802d92:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  802d96:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  802d9a:	48 8b 0a             	mov    (%rdx),%rcx
  802d9d:	48 89 08             	mov    %rcx,(%rax)
  802da0:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  802da4:	48 89 48 08          	mov    %rcx,0x8(%rax)
  802da8:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  802dac:	48 89 50 10          	mov    %rdx,0x10(%rax)
  802db0:	eb 17                	jmp    802dc9 <vprintfmt+0x52>
  802db2:	85 db                	test   %ebx,%ebx
  802db4:	0f 84 b9 04 00 00    	je     803273 <vprintfmt+0x4fc>
  802dba:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  802dbe:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  802dc2:	48 89 d6             	mov    %rdx,%rsi
  802dc5:	89 df                	mov    %ebx,%edi
  802dc7:	ff d0                	callq  *%rax
  802dc9:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  802dcd:	48 8d 50 01          	lea    0x1(%rax),%rdx
  802dd1:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  802dd5:	0f b6 00             	movzbl (%rax),%eax
  802dd8:	0f b6 d8             	movzbl %al,%ebx
  802ddb:	83 fb 25             	cmp    $0x25,%ebx
  802dde:	75 d2                	jne    802db2 <vprintfmt+0x3b>
  802de0:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  802de4:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  802deb:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  802df2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  802df9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  802e00:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  802e04:	48 8d 50 01          	lea    0x1(%rax),%rdx
  802e08:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  802e0c:	0f b6 00             	movzbl (%rax),%eax
  802e0f:	0f b6 d8             	movzbl %al,%ebx
  802e12:	8d 43 dd             	lea    -0x23(%rbx),%eax
  802e15:	83 f8 55             	cmp    $0x55,%eax
  802e18:	0f 87 22 04 00 00    	ja     803240 <vprintfmt+0x4c9>
  802e1e:	89 c0                	mov    %eax,%eax
  802e20:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  802e27:	00 
  802e28:	48 b8 b8 43 80 00 00 	movabs $0x8043b8,%rax
  802e2f:	00 00 00 
  802e32:	48 01 d0             	add    %rdx,%rax
  802e35:	48 8b 00             	mov    (%rax),%rax
  802e38:	ff e0                	jmpq   *%rax
  802e3a:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  802e3e:	eb c0                	jmp    802e00 <vprintfmt+0x89>
  802e40:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  802e44:	eb ba                	jmp    802e00 <vprintfmt+0x89>
  802e46:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  802e4d:	8b 55 d8             	mov    -0x28(%rbp),%edx
  802e50:	89 d0                	mov    %edx,%eax
  802e52:	c1 e0 02             	shl    $0x2,%eax
  802e55:	01 d0                	add    %edx,%eax
  802e57:	01 c0                	add    %eax,%eax
  802e59:	01 d8                	add    %ebx,%eax
  802e5b:	83 e8 30             	sub    $0x30,%eax
  802e5e:	89 45 d8             	mov    %eax,-0x28(%rbp)
  802e61:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  802e65:	0f b6 00             	movzbl (%rax),%eax
  802e68:	0f be d8             	movsbl %al,%ebx
  802e6b:	83 fb 2f             	cmp    $0x2f,%ebx
  802e6e:	7e 60                	jle    802ed0 <vprintfmt+0x159>
  802e70:	83 fb 39             	cmp    $0x39,%ebx
  802e73:	7f 5b                	jg     802ed0 <vprintfmt+0x159>
  802e75:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  802e7a:	eb d1                	jmp    802e4d <vprintfmt+0xd6>
  802e7c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  802e7f:	83 f8 30             	cmp    $0x30,%eax
  802e82:	73 17                	jae    802e9b <vprintfmt+0x124>
  802e84:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802e88:	8b 55 b8             	mov    -0x48(%rbp),%edx
  802e8b:	89 d2                	mov    %edx,%edx
  802e8d:	48 01 d0             	add    %rdx,%rax
  802e90:	8b 55 b8             	mov    -0x48(%rbp),%edx
  802e93:	83 c2 08             	add    $0x8,%edx
  802e96:	89 55 b8             	mov    %edx,-0x48(%rbp)
  802e99:	eb 0c                	jmp    802ea7 <vprintfmt+0x130>
  802e9b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  802e9f:	48 8d 50 08          	lea    0x8(%rax),%rdx
  802ea3:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  802ea7:	8b 00                	mov    (%rax),%eax
  802ea9:	89 45 d8             	mov    %eax,-0x28(%rbp)
  802eac:	eb 23                	jmp    802ed1 <vprintfmt+0x15a>
  802eae:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  802eb2:	0f 89 48 ff ff ff    	jns    802e00 <vprintfmt+0x89>
  802eb8:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  802ebf:	e9 3c ff ff ff       	jmpq   802e00 <vprintfmt+0x89>
  802ec4:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  802ecb:	e9 30 ff ff ff       	jmpq   802e00 <vprintfmt+0x89>
  802ed0:	90                   	nop
  802ed1:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  802ed5:	0f 89 25 ff ff ff    	jns    802e00 <vprintfmt+0x89>
  802edb:	8b 45 d8             	mov    -0x28(%rbp),%eax
  802ede:	89 45 dc             	mov    %eax,-0x24(%rbp)
  802ee1:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  802ee8:	e9 13 ff ff ff       	jmpq   802e00 <vprintfmt+0x89>
  802eed:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  802ef1:	e9 0a ff ff ff       	jmpq   802e00 <vprintfmt+0x89>
  802ef6:	8b 45 b8             	mov    -0x48(%rbp),%eax
  802ef9:	83 f8 30             	cmp    $0x30,%eax
  802efc:	73 17                	jae    802f15 <vprintfmt+0x19e>
  802efe:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802f02:	8b 55 b8             	mov    -0x48(%rbp),%edx
  802f05:	89 d2                	mov    %edx,%edx
  802f07:	48 01 d0             	add    %rdx,%rax
  802f0a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  802f0d:	83 c2 08             	add    $0x8,%edx
  802f10:	89 55 b8             	mov    %edx,-0x48(%rbp)
  802f13:	eb 0c                	jmp    802f21 <vprintfmt+0x1aa>
  802f15:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  802f19:	48 8d 50 08          	lea    0x8(%rax),%rdx
  802f1d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  802f21:	8b 10                	mov    (%rax),%edx
  802f23:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  802f27:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  802f2b:	48 89 ce             	mov    %rcx,%rsi
  802f2e:	89 d7                	mov    %edx,%edi
  802f30:	ff d0                	callq  *%rax
  802f32:	e9 37 03 00 00       	jmpq   80326e <vprintfmt+0x4f7>
  802f37:	8b 45 b8             	mov    -0x48(%rbp),%eax
  802f3a:	83 f8 30             	cmp    $0x30,%eax
  802f3d:	73 17                	jae    802f56 <vprintfmt+0x1df>
  802f3f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802f43:	8b 55 b8             	mov    -0x48(%rbp),%edx
  802f46:	89 d2                	mov    %edx,%edx
  802f48:	48 01 d0             	add    %rdx,%rax
  802f4b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  802f4e:	83 c2 08             	add    $0x8,%edx
  802f51:	89 55 b8             	mov    %edx,-0x48(%rbp)
  802f54:	eb 0c                	jmp    802f62 <vprintfmt+0x1eb>
  802f56:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  802f5a:	48 8d 50 08          	lea    0x8(%rax),%rdx
  802f5e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  802f62:	8b 18                	mov    (%rax),%ebx
  802f64:	85 db                	test   %ebx,%ebx
  802f66:	79 02                	jns    802f6a <vprintfmt+0x1f3>
  802f68:	f7 db                	neg    %ebx
  802f6a:	83 fb 15             	cmp    $0x15,%ebx
  802f6d:	7f 16                	jg     802f85 <vprintfmt+0x20e>
  802f6f:	48 b8 e0 42 80 00 00 	movabs $0x8042e0,%rax
  802f76:	00 00 00 
  802f79:	48 63 d3             	movslq %ebx,%rdx
  802f7c:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  802f80:	4d 85 e4             	test   %r12,%r12
  802f83:	75 2e                	jne    802fb3 <vprintfmt+0x23c>
  802f85:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  802f89:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  802f8d:	89 d9                	mov    %ebx,%ecx
  802f8f:	48 ba a1 43 80 00 00 	movabs $0x8043a1,%rdx
  802f96:	00 00 00 
  802f99:	48 89 c7             	mov    %rax,%rdi
  802f9c:	b8 00 00 00 00       	mov    $0x0,%eax
  802fa1:	49 b8 7d 32 80 00 00 	movabs $0x80327d,%r8
  802fa8:	00 00 00 
  802fab:	41 ff d0             	callq  *%r8
  802fae:	e9 bb 02 00 00       	jmpq   80326e <vprintfmt+0x4f7>
  802fb3:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  802fb7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  802fbb:	4c 89 e1             	mov    %r12,%rcx
  802fbe:	48 ba aa 43 80 00 00 	movabs $0x8043aa,%rdx
  802fc5:	00 00 00 
  802fc8:	48 89 c7             	mov    %rax,%rdi
  802fcb:	b8 00 00 00 00       	mov    $0x0,%eax
  802fd0:	49 b8 7d 32 80 00 00 	movabs $0x80327d,%r8
  802fd7:	00 00 00 
  802fda:	41 ff d0             	callq  *%r8
  802fdd:	e9 8c 02 00 00       	jmpq   80326e <vprintfmt+0x4f7>
  802fe2:	8b 45 b8             	mov    -0x48(%rbp),%eax
  802fe5:	83 f8 30             	cmp    $0x30,%eax
  802fe8:	73 17                	jae    803001 <vprintfmt+0x28a>
  802fea:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802fee:	8b 55 b8             	mov    -0x48(%rbp),%edx
  802ff1:	89 d2                	mov    %edx,%edx
  802ff3:	48 01 d0             	add    %rdx,%rax
  802ff6:	8b 55 b8             	mov    -0x48(%rbp),%edx
  802ff9:	83 c2 08             	add    $0x8,%edx
  802ffc:	89 55 b8             	mov    %edx,-0x48(%rbp)
  802fff:	eb 0c                	jmp    80300d <vprintfmt+0x296>
  803001:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803005:	48 8d 50 08          	lea    0x8(%rax),%rdx
  803009:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80300d:	4c 8b 20             	mov    (%rax),%r12
  803010:	4d 85 e4             	test   %r12,%r12
  803013:	75 0a                	jne    80301f <vprintfmt+0x2a8>
  803015:	49 bc ad 43 80 00 00 	movabs $0x8043ad,%r12
  80301c:	00 00 00 
  80301f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  803023:	7e 78                	jle    80309d <vprintfmt+0x326>
  803025:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  803029:	74 72                	je     80309d <vprintfmt+0x326>
  80302b:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80302e:	48 98                	cltq   
  803030:	48 89 c6             	mov    %rax,%rsi
  803033:	4c 89 e7             	mov    %r12,%rdi
  803036:	48 b8 2b 35 80 00 00 	movabs $0x80352b,%rax
  80303d:	00 00 00 
  803040:	ff d0                	callq  *%rax
  803042:	29 45 dc             	sub    %eax,-0x24(%rbp)
  803045:	eb 17                	jmp    80305e <vprintfmt+0x2e7>
  803047:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  80304b:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  80304f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803053:	48 89 ce             	mov    %rcx,%rsi
  803056:	89 d7                	mov    %edx,%edi
  803058:	ff d0                	callq  *%rax
  80305a:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  80305e:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  803062:	7f e3                	jg     803047 <vprintfmt+0x2d0>
  803064:	eb 37                	jmp    80309d <vprintfmt+0x326>
  803066:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  80306a:	74 1e                	je     80308a <vprintfmt+0x313>
  80306c:	83 fb 1f             	cmp    $0x1f,%ebx
  80306f:	7e 05                	jle    803076 <vprintfmt+0x2ff>
  803071:	83 fb 7e             	cmp    $0x7e,%ebx
  803074:	7e 14                	jle    80308a <vprintfmt+0x313>
  803076:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80307a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80307e:	48 89 d6             	mov    %rdx,%rsi
  803081:	bf 3f 00 00 00       	mov    $0x3f,%edi
  803086:	ff d0                	callq  *%rax
  803088:	eb 0f                	jmp    803099 <vprintfmt+0x322>
  80308a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80308e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803092:	48 89 d6             	mov    %rdx,%rsi
  803095:	89 df                	mov    %ebx,%edi
  803097:	ff d0                	callq  *%rax
  803099:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  80309d:	4c 89 e0             	mov    %r12,%rax
  8030a0:	4c 8d 60 01          	lea    0x1(%rax),%r12
  8030a4:	0f b6 00             	movzbl (%rax),%eax
  8030a7:	0f be d8             	movsbl %al,%ebx
  8030aa:	85 db                	test   %ebx,%ebx
  8030ac:	74 28                	je     8030d6 <vprintfmt+0x35f>
  8030ae:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8030b2:	78 b2                	js     803066 <vprintfmt+0x2ef>
  8030b4:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  8030b8:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8030bc:	79 a8                	jns    803066 <vprintfmt+0x2ef>
  8030be:	eb 16                	jmp    8030d6 <vprintfmt+0x35f>
  8030c0:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8030c4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8030c8:	48 89 d6             	mov    %rdx,%rsi
  8030cb:	bf 20 00 00 00       	mov    $0x20,%edi
  8030d0:	ff d0                	callq  *%rax
  8030d2:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8030d6:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8030da:	7f e4                	jg     8030c0 <vprintfmt+0x349>
  8030dc:	e9 8d 01 00 00       	jmpq   80326e <vprintfmt+0x4f7>
  8030e1:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8030e5:	be 03 00 00 00       	mov    $0x3,%esi
  8030ea:	48 89 c7             	mov    %rax,%rdi
  8030ed:	48 b8 70 2c 80 00 00 	movabs $0x802c70,%rax
  8030f4:	00 00 00 
  8030f7:	ff d0                	callq  *%rax
  8030f9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8030fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803101:	48 85 c0             	test   %rax,%rax
  803104:	79 1d                	jns    803123 <vprintfmt+0x3ac>
  803106:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80310a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80310e:	48 89 d6             	mov    %rdx,%rsi
  803111:	bf 2d 00 00 00       	mov    $0x2d,%edi
  803116:	ff d0                	callq  *%rax
  803118:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80311c:	48 f7 d8             	neg    %rax
  80311f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803123:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  80312a:	e9 d2 00 00 00       	jmpq   803201 <vprintfmt+0x48a>
  80312f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  803133:	be 03 00 00 00       	mov    $0x3,%esi
  803138:	48 89 c7             	mov    %rax,%rdi
  80313b:	48 b8 69 2b 80 00 00 	movabs $0x802b69,%rax
  803142:	00 00 00 
  803145:	ff d0                	callq  *%rax
  803147:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80314b:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  803152:	e9 aa 00 00 00       	jmpq   803201 <vprintfmt+0x48a>
  803157:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80315b:	be 03 00 00 00       	mov    $0x3,%esi
  803160:	48 89 c7             	mov    %rax,%rdi
  803163:	48 b8 69 2b 80 00 00 	movabs $0x802b69,%rax
  80316a:	00 00 00 
  80316d:	ff d0                	callq  *%rax
  80316f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803173:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  80317a:	e9 82 00 00 00       	jmpq   803201 <vprintfmt+0x48a>
  80317f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803183:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803187:	48 89 d6             	mov    %rdx,%rsi
  80318a:	bf 30 00 00 00       	mov    $0x30,%edi
  80318f:	ff d0                	callq  *%rax
  803191:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803195:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803199:	48 89 d6             	mov    %rdx,%rsi
  80319c:	bf 78 00 00 00       	mov    $0x78,%edi
  8031a1:	ff d0                	callq  *%rax
  8031a3:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8031a6:	83 f8 30             	cmp    $0x30,%eax
  8031a9:	73 17                	jae    8031c2 <vprintfmt+0x44b>
  8031ab:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8031af:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8031b2:	89 d2                	mov    %edx,%edx
  8031b4:	48 01 d0             	add    %rdx,%rax
  8031b7:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8031ba:	83 c2 08             	add    $0x8,%edx
  8031bd:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8031c0:	eb 0c                	jmp    8031ce <vprintfmt+0x457>
  8031c2:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8031c6:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8031ca:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8031ce:	48 8b 00             	mov    (%rax),%rax
  8031d1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8031d5:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  8031dc:	eb 23                	jmp    803201 <vprintfmt+0x48a>
  8031de:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8031e2:	be 03 00 00 00       	mov    $0x3,%esi
  8031e7:	48 89 c7             	mov    %rax,%rdi
  8031ea:	48 b8 69 2b 80 00 00 	movabs $0x802b69,%rax
  8031f1:	00 00 00 
  8031f4:	ff d0                	callq  *%rax
  8031f6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8031fa:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  803201:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  803206:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  803209:	8b 7d dc             	mov    -0x24(%rbp),%edi
  80320c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803210:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  803214:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803218:	45 89 c1             	mov    %r8d,%r9d
  80321b:	41 89 f8             	mov    %edi,%r8d
  80321e:	48 89 c7             	mov    %rax,%rdi
  803221:	48 b8 b1 2a 80 00 00 	movabs $0x802ab1,%rax
  803228:	00 00 00 
  80322b:	ff d0                	callq  *%rax
  80322d:	eb 3f                	jmp    80326e <vprintfmt+0x4f7>
  80322f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803233:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803237:	48 89 d6             	mov    %rdx,%rsi
  80323a:	89 df                	mov    %ebx,%edi
  80323c:	ff d0                	callq  *%rax
  80323e:	eb 2e                	jmp    80326e <vprintfmt+0x4f7>
  803240:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  803244:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  803248:	48 89 d6             	mov    %rdx,%rsi
  80324b:	bf 25 00 00 00       	mov    $0x25,%edi
  803250:	ff d0                	callq  *%rax
  803252:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  803257:	eb 05                	jmp    80325e <vprintfmt+0x4e7>
  803259:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  80325e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  803262:	48 83 e8 01          	sub    $0x1,%rax
  803266:	0f b6 00             	movzbl (%rax),%eax
  803269:	3c 25                	cmp    $0x25,%al
  80326b:	75 ec                	jne    803259 <vprintfmt+0x4e2>
  80326d:	90                   	nop
  80326e:	e9 3d fb ff ff       	jmpq   802db0 <vprintfmt+0x39>
  803273:	90                   	nop
  803274:	48 83 c4 60          	add    $0x60,%rsp
  803278:	5b                   	pop    %rbx
  803279:	41 5c                	pop    %r12
  80327b:	5d                   	pop    %rbp
  80327c:	c3                   	retq   

000000000080327d <printfmt>:
  80327d:	55                   	push   %rbp
  80327e:	48 89 e5             	mov    %rsp,%rbp
  803281:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  803288:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  80328f:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  803296:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  80329d:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8032a4:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8032ab:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8032b2:	84 c0                	test   %al,%al
  8032b4:	74 20                	je     8032d6 <printfmt+0x59>
  8032b6:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8032ba:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8032be:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8032c2:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8032c6:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8032ca:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8032ce:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8032d2:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8032d6:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  8032dd:	00 00 00 
  8032e0:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  8032e7:	00 00 00 
  8032ea:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8032ee:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8032f5:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8032fc:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  803303:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  80330a:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  803311:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  803318:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  80331f:	48 89 c7             	mov    %rax,%rdi
  803322:	48 b8 77 2d 80 00 00 	movabs $0x802d77,%rax
  803329:	00 00 00 
  80332c:	ff d0                	callq  *%rax
  80332e:	90                   	nop
  80332f:	c9                   	leaveq 
  803330:	c3                   	retq   

0000000000803331 <sprintputch>:
  803331:	55                   	push   %rbp
  803332:	48 89 e5             	mov    %rsp,%rbp
  803335:	48 83 ec 10          	sub    $0x10,%rsp
  803339:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80333c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803340:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803344:	8b 40 10             	mov    0x10(%rax),%eax
  803347:	8d 50 01             	lea    0x1(%rax),%edx
  80334a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80334e:	89 50 10             	mov    %edx,0x10(%rax)
  803351:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803355:	48 8b 10             	mov    (%rax),%rdx
  803358:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80335c:	48 8b 40 08          	mov    0x8(%rax),%rax
  803360:	48 39 c2             	cmp    %rax,%rdx
  803363:	73 17                	jae    80337c <sprintputch+0x4b>
  803365:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803369:	48 8b 00             	mov    (%rax),%rax
  80336c:	48 8d 48 01          	lea    0x1(%rax),%rcx
  803370:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803374:	48 89 0a             	mov    %rcx,(%rdx)
  803377:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80337a:	88 10                	mov    %dl,(%rax)
  80337c:	90                   	nop
  80337d:	c9                   	leaveq 
  80337e:	c3                   	retq   

000000000080337f <vsnprintf>:
  80337f:	55                   	push   %rbp
  803380:	48 89 e5             	mov    %rsp,%rbp
  803383:	48 83 ec 50          	sub    $0x50,%rsp
  803387:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  80338b:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  80338e:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  803392:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  803396:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  80339a:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  80339e:	48 8b 0a             	mov    (%rdx),%rcx
  8033a1:	48 89 08             	mov    %rcx,(%rax)
  8033a4:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8033a8:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8033ac:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8033b0:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8033b4:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8033b8:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8033bc:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  8033bf:	48 98                	cltq   
  8033c1:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8033c5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8033c9:	48 01 d0             	add    %rdx,%rax
  8033cc:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8033d0:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8033d7:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  8033dc:	74 06                	je     8033e4 <vsnprintf+0x65>
  8033de:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  8033e2:	7f 07                	jg     8033eb <vsnprintf+0x6c>
  8033e4:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8033e9:	eb 2f                	jmp    80341a <vsnprintf+0x9b>
  8033eb:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  8033ef:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  8033f3:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8033f7:	48 89 c6             	mov    %rax,%rsi
  8033fa:	48 bf 31 33 80 00 00 	movabs $0x803331,%rdi
  803401:	00 00 00 
  803404:	48 b8 77 2d 80 00 00 	movabs $0x802d77,%rax
  80340b:	00 00 00 
  80340e:	ff d0                	callq  *%rax
  803410:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803414:	c6 00 00             	movb   $0x0,(%rax)
  803417:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80341a:	c9                   	leaveq 
  80341b:	c3                   	retq   

000000000080341c <snprintf>:
  80341c:	55                   	push   %rbp
  80341d:	48 89 e5             	mov    %rsp,%rbp
  803420:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  803427:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80342e:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  803434:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  80343b:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803442:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803449:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803450:	84 c0                	test   %al,%al
  803452:	74 20                	je     803474 <snprintf+0x58>
  803454:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803458:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80345c:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  803460:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803464:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803468:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80346c:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803470:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803474:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  80347b:	00 00 00 
  80347e:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  803485:	00 00 00 
  803488:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80348c:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803493:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80349a:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8034a1:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8034a8:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8034af:	48 8b 0a             	mov    (%rdx),%rcx
  8034b2:	48 89 08             	mov    %rcx,(%rax)
  8034b5:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8034b9:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8034bd:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8034c1:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8034c5:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  8034cc:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  8034d3:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  8034d9:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8034e0:	48 89 c7             	mov    %rax,%rdi
  8034e3:	48 b8 7f 33 80 00 00 	movabs $0x80337f,%rax
  8034ea:	00 00 00 
  8034ed:	ff d0                	callq  *%rax
  8034ef:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8034f5:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8034fb:	c9                   	leaveq 
  8034fc:	c3                   	retq   

00000000008034fd <strlen>:
  8034fd:	55                   	push   %rbp
  8034fe:	48 89 e5             	mov    %rsp,%rbp
  803501:	48 83 ec 18          	sub    $0x18,%rsp
  803505:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803509:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803510:	eb 09                	jmp    80351b <strlen+0x1e>
  803512:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803516:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80351b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80351f:	0f b6 00             	movzbl (%rax),%eax
  803522:	84 c0                	test   %al,%al
  803524:	75 ec                	jne    803512 <strlen+0x15>
  803526:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803529:	c9                   	leaveq 
  80352a:	c3                   	retq   

000000000080352b <strnlen>:
  80352b:	55                   	push   %rbp
  80352c:	48 89 e5             	mov    %rsp,%rbp
  80352f:	48 83 ec 20          	sub    $0x20,%rsp
  803533:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803537:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80353b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803542:	eb 0e                	jmp    803552 <strnlen+0x27>
  803544:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803548:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80354d:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  803552:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803557:	74 0b                	je     803564 <strnlen+0x39>
  803559:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80355d:	0f b6 00             	movzbl (%rax),%eax
  803560:	84 c0                	test   %al,%al
  803562:	75 e0                	jne    803544 <strnlen+0x19>
  803564:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803567:	c9                   	leaveq 
  803568:	c3                   	retq   

0000000000803569 <strcpy>:
  803569:	55                   	push   %rbp
  80356a:	48 89 e5             	mov    %rsp,%rbp
  80356d:	48 83 ec 20          	sub    $0x20,%rsp
  803571:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803575:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803579:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80357d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803581:	90                   	nop
  803582:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803586:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80358a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80358e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803592:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  803596:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80359a:	0f b6 12             	movzbl (%rdx),%edx
  80359d:	88 10                	mov    %dl,(%rax)
  80359f:	0f b6 00             	movzbl (%rax),%eax
  8035a2:	84 c0                	test   %al,%al
  8035a4:	75 dc                	jne    803582 <strcpy+0x19>
  8035a6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8035aa:	c9                   	leaveq 
  8035ab:	c3                   	retq   

00000000008035ac <strcat>:
  8035ac:	55                   	push   %rbp
  8035ad:	48 89 e5             	mov    %rsp,%rbp
  8035b0:	48 83 ec 20          	sub    $0x20,%rsp
  8035b4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8035b8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8035bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035c0:	48 89 c7             	mov    %rax,%rdi
  8035c3:	48 b8 fd 34 80 00 00 	movabs $0x8034fd,%rax
  8035ca:	00 00 00 
  8035cd:	ff d0                	callq  *%rax
  8035cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035d5:	48 63 d0             	movslq %eax,%rdx
  8035d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035dc:	48 01 c2             	add    %rax,%rdx
  8035df:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8035e3:	48 89 c6             	mov    %rax,%rsi
  8035e6:	48 89 d7             	mov    %rdx,%rdi
  8035e9:	48 b8 69 35 80 00 00 	movabs $0x803569,%rax
  8035f0:	00 00 00 
  8035f3:	ff d0                	callq  *%rax
  8035f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8035f9:	c9                   	leaveq 
  8035fa:	c3                   	retq   

00000000008035fb <strncpy>:
  8035fb:	55                   	push   %rbp
  8035fc:	48 89 e5             	mov    %rsp,%rbp
  8035ff:	48 83 ec 28          	sub    $0x28,%rsp
  803603:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803607:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80360b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80360f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803613:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803617:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80361e:	00 
  80361f:	eb 2a                	jmp    80364b <strncpy+0x50>
  803621:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803625:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803629:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80362d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803631:	0f b6 12             	movzbl (%rdx),%edx
  803634:	88 10                	mov    %dl,(%rax)
  803636:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80363a:	0f b6 00             	movzbl (%rax),%eax
  80363d:	84 c0                	test   %al,%al
  80363f:	74 05                	je     803646 <strncpy+0x4b>
  803641:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  803646:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80364b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80364f:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803653:	72 cc                	jb     803621 <strncpy+0x26>
  803655:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803659:	c9                   	leaveq 
  80365a:	c3                   	retq   

000000000080365b <strlcpy>:
  80365b:	55                   	push   %rbp
  80365c:	48 89 e5             	mov    %rsp,%rbp
  80365f:	48 83 ec 28          	sub    $0x28,%rsp
  803663:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803667:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80366b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80366f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803673:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803677:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80367c:	74 3d                	je     8036bb <strlcpy+0x60>
  80367e:	eb 1d                	jmp    80369d <strlcpy+0x42>
  803680:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803684:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803688:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80368c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803690:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  803694:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  803698:	0f b6 12             	movzbl (%rdx),%edx
  80369b:	88 10                	mov    %dl,(%rax)
  80369d:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8036a2:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8036a7:	74 0b                	je     8036b4 <strlcpy+0x59>
  8036a9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8036ad:	0f b6 00             	movzbl (%rax),%eax
  8036b0:	84 c0                	test   %al,%al
  8036b2:	75 cc                	jne    803680 <strlcpy+0x25>
  8036b4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8036b8:	c6 00 00             	movb   $0x0,(%rax)
  8036bb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8036bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8036c3:	48 29 c2             	sub    %rax,%rdx
  8036c6:	48 89 d0             	mov    %rdx,%rax
  8036c9:	c9                   	leaveq 
  8036ca:	c3                   	retq   

00000000008036cb <strcmp>:
  8036cb:	55                   	push   %rbp
  8036cc:	48 89 e5             	mov    %rsp,%rbp
  8036cf:	48 83 ec 10          	sub    $0x10,%rsp
  8036d3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8036d7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8036db:	eb 0a                	jmp    8036e7 <strcmp+0x1c>
  8036dd:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8036e2:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8036e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8036eb:	0f b6 00             	movzbl (%rax),%eax
  8036ee:	84 c0                	test   %al,%al
  8036f0:	74 12                	je     803704 <strcmp+0x39>
  8036f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8036f6:	0f b6 10             	movzbl (%rax),%edx
  8036f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036fd:	0f b6 00             	movzbl (%rax),%eax
  803700:	38 c2                	cmp    %al,%dl
  803702:	74 d9                	je     8036dd <strcmp+0x12>
  803704:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803708:	0f b6 00             	movzbl (%rax),%eax
  80370b:	0f b6 d0             	movzbl %al,%edx
  80370e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803712:	0f b6 00             	movzbl (%rax),%eax
  803715:	0f b6 c0             	movzbl %al,%eax
  803718:	29 c2                	sub    %eax,%edx
  80371a:	89 d0                	mov    %edx,%eax
  80371c:	c9                   	leaveq 
  80371d:	c3                   	retq   

000000000080371e <strncmp>:
  80371e:	55                   	push   %rbp
  80371f:	48 89 e5             	mov    %rsp,%rbp
  803722:	48 83 ec 18          	sub    $0x18,%rsp
  803726:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80372a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80372e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803732:	eb 0f                	jmp    803743 <strncmp+0x25>
  803734:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  803739:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80373e:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  803743:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803748:	74 1d                	je     803767 <strncmp+0x49>
  80374a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80374e:	0f b6 00             	movzbl (%rax),%eax
  803751:	84 c0                	test   %al,%al
  803753:	74 12                	je     803767 <strncmp+0x49>
  803755:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803759:	0f b6 10             	movzbl (%rax),%edx
  80375c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803760:	0f b6 00             	movzbl (%rax),%eax
  803763:	38 c2                	cmp    %al,%dl
  803765:	74 cd                	je     803734 <strncmp+0x16>
  803767:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80376c:	75 07                	jne    803775 <strncmp+0x57>
  80376e:	b8 00 00 00 00       	mov    $0x0,%eax
  803773:	eb 18                	jmp    80378d <strncmp+0x6f>
  803775:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803779:	0f b6 00             	movzbl (%rax),%eax
  80377c:	0f b6 d0             	movzbl %al,%edx
  80377f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803783:	0f b6 00             	movzbl (%rax),%eax
  803786:	0f b6 c0             	movzbl %al,%eax
  803789:	29 c2                	sub    %eax,%edx
  80378b:	89 d0                	mov    %edx,%eax
  80378d:	c9                   	leaveq 
  80378e:	c3                   	retq   

000000000080378f <strchr>:
  80378f:	55                   	push   %rbp
  803790:	48 89 e5             	mov    %rsp,%rbp
  803793:	48 83 ec 10          	sub    $0x10,%rsp
  803797:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80379b:	89 f0                	mov    %esi,%eax
  80379d:	88 45 f4             	mov    %al,-0xc(%rbp)
  8037a0:	eb 17                	jmp    8037b9 <strchr+0x2a>
  8037a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037a6:	0f b6 00             	movzbl (%rax),%eax
  8037a9:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8037ac:	75 06                	jne    8037b4 <strchr+0x25>
  8037ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037b2:	eb 15                	jmp    8037c9 <strchr+0x3a>
  8037b4:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8037b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037bd:	0f b6 00             	movzbl (%rax),%eax
  8037c0:	84 c0                	test   %al,%al
  8037c2:	75 de                	jne    8037a2 <strchr+0x13>
  8037c4:	b8 00 00 00 00       	mov    $0x0,%eax
  8037c9:	c9                   	leaveq 
  8037ca:	c3                   	retq   

00000000008037cb <strfind>:
  8037cb:	55                   	push   %rbp
  8037cc:	48 89 e5             	mov    %rsp,%rbp
  8037cf:	48 83 ec 10          	sub    $0x10,%rsp
  8037d3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8037d7:	89 f0                	mov    %esi,%eax
  8037d9:	88 45 f4             	mov    %al,-0xc(%rbp)
  8037dc:	eb 11                	jmp    8037ef <strfind+0x24>
  8037de:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037e2:	0f b6 00             	movzbl (%rax),%eax
  8037e5:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8037e8:	74 12                	je     8037fc <strfind+0x31>
  8037ea:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8037ef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037f3:	0f b6 00             	movzbl (%rax),%eax
  8037f6:	84 c0                	test   %al,%al
  8037f8:	75 e4                	jne    8037de <strfind+0x13>
  8037fa:	eb 01                	jmp    8037fd <strfind+0x32>
  8037fc:	90                   	nop
  8037fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803801:	c9                   	leaveq 
  803802:	c3                   	retq   

0000000000803803 <memset>:
  803803:	55                   	push   %rbp
  803804:	48 89 e5             	mov    %rsp,%rbp
  803807:	48 83 ec 18          	sub    $0x18,%rsp
  80380b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80380f:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803812:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803816:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80381b:	75 06                	jne    803823 <memset+0x20>
  80381d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803821:	eb 69                	jmp    80388c <memset+0x89>
  803823:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803827:	83 e0 03             	and    $0x3,%eax
  80382a:	48 85 c0             	test   %rax,%rax
  80382d:	75 48                	jne    803877 <memset+0x74>
  80382f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803833:	83 e0 03             	and    $0x3,%eax
  803836:	48 85 c0             	test   %rax,%rax
  803839:	75 3c                	jne    803877 <memset+0x74>
  80383b:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  803842:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803845:	c1 e0 18             	shl    $0x18,%eax
  803848:	89 c2                	mov    %eax,%edx
  80384a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80384d:	c1 e0 10             	shl    $0x10,%eax
  803850:	09 c2                	or     %eax,%edx
  803852:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803855:	c1 e0 08             	shl    $0x8,%eax
  803858:	09 d0                	or     %edx,%eax
  80385a:	09 45 f4             	or     %eax,-0xc(%rbp)
  80385d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803861:	48 c1 e8 02          	shr    $0x2,%rax
  803865:	48 89 c1             	mov    %rax,%rcx
  803868:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80386c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80386f:	48 89 d7             	mov    %rdx,%rdi
  803872:	fc                   	cld    
  803873:	f3 ab                	rep stos %eax,%es:(%rdi)
  803875:	eb 11                	jmp    803888 <memset+0x85>
  803877:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80387b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80387e:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803882:	48 89 d7             	mov    %rdx,%rdi
  803885:	fc                   	cld    
  803886:	f3 aa                	rep stos %al,%es:(%rdi)
  803888:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80388c:	c9                   	leaveq 
  80388d:	c3                   	retq   

000000000080388e <memmove>:
  80388e:	55                   	push   %rbp
  80388f:	48 89 e5             	mov    %rsp,%rbp
  803892:	48 83 ec 28          	sub    $0x28,%rsp
  803896:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80389a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80389e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8038a2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8038a6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8038aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038ae:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8038b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038b6:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8038ba:	0f 83 88 00 00 00    	jae    803948 <memmove+0xba>
  8038c0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8038c4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8038c8:	48 01 d0             	add    %rdx,%rax
  8038cb:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8038cf:	76 77                	jbe    803948 <memmove+0xba>
  8038d1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8038d5:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8038d9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8038dd:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8038e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038e5:	83 e0 03             	and    $0x3,%eax
  8038e8:	48 85 c0             	test   %rax,%rax
  8038eb:	75 3b                	jne    803928 <memmove+0x9a>
  8038ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8038f1:	83 e0 03             	and    $0x3,%eax
  8038f4:	48 85 c0             	test   %rax,%rax
  8038f7:	75 2f                	jne    803928 <memmove+0x9a>
  8038f9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8038fd:	83 e0 03             	and    $0x3,%eax
  803900:	48 85 c0             	test   %rax,%rax
  803903:	75 23                	jne    803928 <memmove+0x9a>
  803905:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803909:	48 83 e8 04          	sub    $0x4,%rax
  80390d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803911:	48 83 ea 04          	sub    $0x4,%rdx
  803915:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  803919:	48 c1 e9 02          	shr    $0x2,%rcx
  80391d:	48 89 c7             	mov    %rax,%rdi
  803920:	48 89 d6             	mov    %rdx,%rsi
  803923:	fd                   	std    
  803924:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  803926:	eb 1d                	jmp    803945 <memmove+0xb7>
  803928:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80392c:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  803930:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803934:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  803938:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80393c:	48 89 d7             	mov    %rdx,%rdi
  80393f:	48 89 c1             	mov    %rax,%rcx
  803942:	fd                   	std    
  803943:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  803945:	fc                   	cld    
  803946:	eb 57                	jmp    80399f <memmove+0x111>
  803948:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80394c:	83 e0 03             	and    $0x3,%eax
  80394f:	48 85 c0             	test   %rax,%rax
  803952:	75 36                	jne    80398a <memmove+0xfc>
  803954:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803958:	83 e0 03             	and    $0x3,%eax
  80395b:	48 85 c0             	test   %rax,%rax
  80395e:	75 2a                	jne    80398a <memmove+0xfc>
  803960:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803964:	83 e0 03             	and    $0x3,%eax
  803967:	48 85 c0             	test   %rax,%rax
  80396a:	75 1e                	jne    80398a <memmove+0xfc>
  80396c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803970:	48 c1 e8 02          	shr    $0x2,%rax
  803974:	48 89 c1             	mov    %rax,%rcx
  803977:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80397b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80397f:	48 89 c7             	mov    %rax,%rdi
  803982:	48 89 d6             	mov    %rdx,%rsi
  803985:	fc                   	cld    
  803986:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  803988:	eb 15                	jmp    80399f <memmove+0x111>
  80398a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80398e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803992:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  803996:	48 89 c7             	mov    %rax,%rdi
  803999:	48 89 d6             	mov    %rdx,%rsi
  80399c:	fc                   	cld    
  80399d:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80399f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039a3:	c9                   	leaveq 
  8039a4:	c3                   	retq   

00000000008039a5 <memcpy>:
  8039a5:	55                   	push   %rbp
  8039a6:	48 89 e5             	mov    %rsp,%rbp
  8039a9:	48 83 ec 18          	sub    $0x18,%rsp
  8039ad:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8039b1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8039b5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8039b9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8039bd:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8039c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039c5:	48 89 ce             	mov    %rcx,%rsi
  8039c8:	48 89 c7             	mov    %rax,%rdi
  8039cb:	48 b8 8e 38 80 00 00 	movabs $0x80388e,%rax
  8039d2:	00 00 00 
  8039d5:	ff d0                	callq  *%rax
  8039d7:	c9                   	leaveq 
  8039d8:	c3                   	retq   

00000000008039d9 <memcmp>:
  8039d9:	55                   	push   %rbp
  8039da:	48 89 e5             	mov    %rsp,%rbp
  8039dd:	48 83 ec 28          	sub    $0x28,%rsp
  8039e1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8039e5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8039e9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8039ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039f1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8039f5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8039f9:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8039fd:	eb 36                	jmp    803a35 <memcmp+0x5c>
  8039ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a03:	0f b6 10             	movzbl (%rax),%edx
  803a06:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a0a:	0f b6 00             	movzbl (%rax),%eax
  803a0d:	38 c2                	cmp    %al,%dl
  803a0f:	74 1a                	je     803a2b <memcmp+0x52>
  803a11:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a15:	0f b6 00             	movzbl (%rax),%eax
  803a18:	0f b6 d0             	movzbl %al,%edx
  803a1b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a1f:	0f b6 00             	movzbl (%rax),%eax
  803a22:	0f b6 c0             	movzbl %al,%eax
  803a25:	29 c2                	sub    %eax,%edx
  803a27:	89 d0                	mov    %edx,%eax
  803a29:	eb 20                	jmp    803a4b <memcmp+0x72>
  803a2b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803a30:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  803a35:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a39:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  803a3d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803a41:	48 85 c0             	test   %rax,%rax
  803a44:	75 b9                	jne    8039ff <memcmp+0x26>
  803a46:	b8 00 00 00 00       	mov    $0x0,%eax
  803a4b:	c9                   	leaveq 
  803a4c:	c3                   	retq   

0000000000803a4d <memfind>:
  803a4d:	55                   	push   %rbp
  803a4e:	48 89 e5             	mov    %rsp,%rbp
  803a51:	48 83 ec 28          	sub    $0x28,%rsp
  803a55:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803a59:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  803a5c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803a60:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803a64:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a68:	48 01 d0             	add    %rdx,%rax
  803a6b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803a6f:	eb 13                	jmp    803a84 <memfind+0x37>
  803a71:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a75:	0f b6 00             	movzbl (%rax),%eax
  803a78:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803a7b:	38 d0                	cmp    %dl,%al
  803a7d:	74 11                	je     803a90 <memfind+0x43>
  803a7f:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  803a84:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a88:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  803a8c:	72 e3                	jb     803a71 <memfind+0x24>
  803a8e:	eb 01                	jmp    803a91 <memfind+0x44>
  803a90:	90                   	nop
  803a91:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a95:	c9                   	leaveq 
  803a96:	c3                   	retq   

0000000000803a97 <strtol>:
  803a97:	55                   	push   %rbp
  803a98:	48 89 e5             	mov    %rsp,%rbp
  803a9b:	48 83 ec 38          	sub    $0x38,%rsp
  803a9f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803aa3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803aa7:	89 55 cc             	mov    %edx,-0x34(%rbp)
  803aaa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803ab1:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  803ab8:	00 
  803ab9:	eb 05                	jmp    803ac0 <strtol+0x29>
  803abb:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  803ac0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ac4:	0f b6 00             	movzbl (%rax),%eax
  803ac7:	3c 20                	cmp    $0x20,%al
  803ac9:	74 f0                	je     803abb <strtol+0x24>
  803acb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803acf:	0f b6 00             	movzbl (%rax),%eax
  803ad2:	3c 09                	cmp    $0x9,%al
  803ad4:	74 e5                	je     803abb <strtol+0x24>
  803ad6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ada:	0f b6 00             	movzbl (%rax),%eax
  803add:	3c 2b                	cmp    $0x2b,%al
  803adf:	75 07                	jne    803ae8 <strtol+0x51>
  803ae1:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  803ae6:	eb 17                	jmp    803aff <strtol+0x68>
  803ae8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803aec:	0f b6 00             	movzbl (%rax),%eax
  803aef:	3c 2d                	cmp    $0x2d,%al
  803af1:	75 0c                	jne    803aff <strtol+0x68>
  803af3:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  803af8:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  803aff:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  803b03:	74 06                	je     803b0b <strtol+0x74>
  803b05:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  803b09:	75 28                	jne    803b33 <strtol+0x9c>
  803b0b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b0f:	0f b6 00             	movzbl (%rax),%eax
  803b12:	3c 30                	cmp    $0x30,%al
  803b14:	75 1d                	jne    803b33 <strtol+0x9c>
  803b16:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b1a:	48 83 c0 01          	add    $0x1,%rax
  803b1e:	0f b6 00             	movzbl (%rax),%eax
  803b21:	3c 78                	cmp    $0x78,%al
  803b23:	75 0e                	jne    803b33 <strtol+0x9c>
  803b25:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  803b2a:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  803b31:	eb 2c                	jmp    803b5f <strtol+0xc8>
  803b33:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  803b37:	75 19                	jne    803b52 <strtol+0xbb>
  803b39:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b3d:	0f b6 00             	movzbl (%rax),%eax
  803b40:	3c 30                	cmp    $0x30,%al
  803b42:	75 0e                	jne    803b52 <strtol+0xbb>
  803b44:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  803b49:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  803b50:	eb 0d                	jmp    803b5f <strtol+0xc8>
  803b52:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  803b56:	75 07                	jne    803b5f <strtol+0xc8>
  803b58:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  803b5f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b63:	0f b6 00             	movzbl (%rax),%eax
  803b66:	3c 2f                	cmp    $0x2f,%al
  803b68:	7e 1d                	jle    803b87 <strtol+0xf0>
  803b6a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b6e:	0f b6 00             	movzbl (%rax),%eax
  803b71:	3c 39                	cmp    $0x39,%al
  803b73:	7f 12                	jg     803b87 <strtol+0xf0>
  803b75:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b79:	0f b6 00             	movzbl (%rax),%eax
  803b7c:	0f be c0             	movsbl %al,%eax
  803b7f:	83 e8 30             	sub    $0x30,%eax
  803b82:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b85:	eb 4e                	jmp    803bd5 <strtol+0x13e>
  803b87:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b8b:	0f b6 00             	movzbl (%rax),%eax
  803b8e:	3c 60                	cmp    $0x60,%al
  803b90:	7e 1d                	jle    803baf <strtol+0x118>
  803b92:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b96:	0f b6 00             	movzbl (%rax),%eax
  803b99:	3c 7a                	cmp    $0x7a,%al
  803b9b:	7f 12                	jg     803baf <strtol+0x118>
  803b9d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ba1:	0f b6 00             	movzbl (%rax),%eax
  803ba4:	0f be c0             	movsbl %al,%eax
  803ba7:	83 e8 57             	sub    $0x57,%eax
  803baa:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803bad:	eb 26                	jmp    803bd5 <strtol+0x13e>
  803baf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bb3:	0f b6 00             	movzbl (%rax),%eax
  803bb6:	3c 40                	cmp    $0x40,%al
  803bb8:	7e 47                	jle    803c01 <strtol+0x16a>
  803bba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bbe:	0f b6 00             	movzbl (%rax),%eax
  803bc1:	3c 5a                	cmp    $0x5a,%al
  803bc3:	7f 3c                	jg     803c01 <strtol+0x16a>
  803bc5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bc9:	0f b6 00             	movzbl (%rax),%eax
  803bcc:	0f be c0             	movsbl %al,%eax
  803bcf:	83 e8 37             	sub    $0x37,%eax
  803bd2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803bd5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bd8:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  803bdb:	7d 23                	jge    803c00 <strtol+0x169>
  803bdd:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  803be2:	8b 45 cc             	mov    -0x34(%rbp),%eax
  803be5:	48 98                	cltq   
  803be7:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  803bec:	48 89 c2             	mov    %rax,%rdx
  803bef:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bf2:	48 98                	cltq   
  803bf4:	48 01 d0             	add    %rdx,%rax
  803bf7:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803bfb:	e9 5f ff ff ff       	jmpq   803b5f <strtol+0xc8>
  803c00:	90                   	nop
  803c01:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  803c06:	74 0b                	je     803c13 <strtol+0x17c>
  803c08:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c0c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803c10:	48 89 10             	mov    %rdx,(%rax)
  803c13:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c17:	74 09                	je     803c22 <strtol+0x18b>
  803c19:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c1d:	48 f7 d8             	neg    %rax
  803c20:	eb 04                	jmp    803c26 <strtol+0x18f>
  803c22:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c26:	c9                   	leaveq 
  803c27:	c3                   	retq   

0000000000803c28 <strstr>:
  803c28:	55                   	push   %rbp
  803c29:	48 89 e5             	mov    %rsp,%rbp
  803c2c:	48 83 ec 30          	sub    $0x30,%rsp
  803c30:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803c34:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803c38:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c3c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803c40:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  803c44:	0f b6 00             	movzbl (%rax),%eax
  803c47:	88 45 ff             	mov    %al,-0x1(%rbp)
  803c4a:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  803c4e:	75 06                	jne    803c56 <strstr+0x2e>
  803c50:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c54:	eb 6b                	jmp    803cc1 <strstr+0x99>
  803c56:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c5a:	48 89 c7             	mov    %rax,%rdi
  803c5d:	48 b8 fd 34 80 00 00 	movabs $0x8034fd,%rax
  803c64:	00 00 00 
  803c67:	ff d0                	callq  *%rax
  803c69:	48 98                	cltq   
  803c6b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803c6f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c73:	48 8d 50 01          	lea    0x1(%rax),%rdx
  803c77:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803c7b:	0f b6 00             	movzbl (%rax),%eax
  803c7e:	88 45 ef             	mov    %al,-0x11(%rbp)
  803c81:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  803c85:	75 07                	jne    803c8e <strstr+0x66>
  803c87:	b8 00 00 00 00       	mov    $0x0,%eax
  803c8c:	eb 33                	jmp    803cc1 <strstr+0x99>
  803c8e:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  803c92:	3a 45 ff             	cmp    -0x1(%rbp),%al
  803c95:	75 d8                	jne    803c6f <strstr+0x47>
  803c97:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803c9b:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  803c9f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ca3:	48 89 ce             	mov    %rcx,%rsi
  803ca6:	48 89 c7             	mov    %rax,%rdi
  803ca9:	48 b8 1e 37 80 00 00 	movabs $0x80371e,%rax
  803cb0:	00 00 00 
  803cb3:	ff d0                	callq  *%rax
  803cb5:	85 c0                	test   %eax,%eax
  803cb7:	75 b6                	jne    803c6f <strstr+0x47>
  803cb9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803cbd:	48 83 e8 01          	sub    $0x1,%rax
  803cc1:	c9                   	leaveq 
  803cc2:	c3                   	retq   

0000000000803cc3 <ipc_recv>:
  803cc3:	55                   	push   %rbp
  803cc4:	48 89 e5             	mov    %rsp,%rbp
  803cc7:	48 83 ec 30          	sub    $0x30,%rsp
  803ccb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803ccf:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803cd3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803cd7:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803cdc:	75 0e                	jne    803cec <ipc_recv+0x29>
  803cde:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803ce5:	00 00 00 
  803ce8:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803cec:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803cf0:	48 89 c7             	mov    %rax,%rdi
  803cf3:	48 b8 2f 05 80 00 00 	movabs $0x80052f,%rax
  803cfa:	00 00 00 
  803cfd:	ff d0                	callq  *%rax
  803cff:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d02:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d06:	79 27                	jns    803d2f <ipc_recv+0x6c>
  803d08:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803d0d:	74 0a                	je     803d19 <ipc_recv+0x56>
  803d0f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d13:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803d19:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803d1e:	74 0a                	je     803d2a <ipc_recv+0x67>
  803d20:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d24:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803d2a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d2d:	eb 53                	jmp    803d82 <ipc_recv+0xbf>
  803d2f:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803d34:	74 19                	je     803d4f <ipc_recv+0x8c>
  803d36:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803d3d:	00 00 00 
  803d40:	48 8b 00             	mov    (%rax),%rax
  803d43:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  803d49:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d4d:	89 10                	mov    %edx,(%rax)
  803d4f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803d54:	74 19                	je     803d6f <ipc_recv+0xac>
  803d56:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803d5d:	00 00 00 
  803d60:	48 8b 00             	mov    (%rax),%rax
  803d63:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  803d69:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d6d:	89 10                	mov    %edx,(%rax)
  803d6f:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803d76:	00 00 00 
  803d79:	48 8b 00             	mov    (%rax),%rax
  803d7c:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  803d82:	c9                   	leaveq 
  803d83:	c3                   	retq   

0000000000803d84 <ipc_send>:
  803d84:	55                   	push   %rbp
  803d85:	48 89 e5             	mov    %rsp,%rbp
  803d88:	48 83 ec 30          	sub    $0x30,%rsp
  803d8c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d8f:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803d92:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  803d96:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803d99:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803d9e:	75 1c                	jne    803dbc <ipc_send+0x38>
  803da0:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803da7:	00 00 00 
  803daa:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803dae:	eb 0c                	jmp    803dbc <ipc_send+0x38>
  803db0:	48 b8 b8 02 80 00 00 	movabs $0x8002b8,%rax
  803db7:	00 00 00 
  803dba:	ff d0                	callq  *%rax
  803dbc:	8b 75 e8             	mov    -0x18(%rbp),%esi
  803dbf:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  803dc2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803dc6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803dc9:	89 c7                	mov    %eax,%edi
  803dcb:	48 b8 d8 04 80 00 00 	movabs $0x8004d8,%rax
  803dd2:	00 00 00 
  803dd5:	ff d0                	callq  *%rax
  803dd7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803dda:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  803dde:	74 d0                	je     803db0 <ipc_send+0x2c>
  803de0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803de4:	79 30                	jns    803e16 <ipc_send+0x92>
  803de6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803de9:	89 c1                	mov    %eax,%ecx
  803deb:	48 ba 68 46 80 00 00 	movabs $0x804668,%rdx
  803df2:	00 00 00 
  803df5:	be 44 00 00 00       	mov    $0x44,%esi
  803dfa:	48 bf 7e 46 80 00 00 	movabs $0x80467e,%rdi
  803e01:	00 00 00 
  803e04:	b8 00 00 00 00       	mov    $0x0,%eax
  803e09:	49 b8 9f 27 80 00 00 	movabs $0x80279f,%r8
  803e10:	00 00 00 
  803e13:	41 ff d0             	callq  *%r8
  803e16:	90                   	nop
  803e17:	c9                   	leaveq 
  803e18:	c3                   	retq   

0000000000803e19 <ipc_host_recv>:
  803e19:	55                   	push   %rbp
  803e1a:	48 89 e5             	mov    %rsp,%rbp
  803e1d:	48 83 ec 10          	sub    $0x10,%rsp
  803e21:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803e25:	48 ba 90 46 80 00 00 	movabs $0x804690,%rdx
  803e2c:	00 00 00 
  803e2f:	be 4e 00 00 00       	mov    $0x4e,%esi
  803e34:	48 bf 7e 46 80 00 00 	movabs $0x80467e,%rdi
  803e3b:	00 00 00 
  803e3e:	b8 00 00 00 00       	mov    $0x0,%eax
  803e43:	48 b9 9f 27 80 00 00 	movabs $0x80279f,%rcx
  803e4a:	00 00 00 
  803e4d:	ff d1                	callq  *%rcx

0000000000803e4f <ipc_host_send>:
  803e4f:	55                   	push   %rbp
  803e50:	48 89 e5             	mov    %rsp,%rbp
  803e53:	48 83 ec 20          	sub    $0x20,%rsp
  803e57:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e5a:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803e5d:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  803e61:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803e64:	48 ba b0 46 80 00 00 	movabs $0x8046b0,%rdx
  803e6b:	00 00 00 
  803e6e:	be 58 00 00 00       	mov    $0x58,%esi
  803e73:	48 bf 7e 46 80 00 00 	movabs $0x80467e,%rdi
  803e7a:	00 00 00 
  803e7d:	b8 00 00 00 00       	mov    $0x0,%eax
  803e82:	48 b9 9f 27 80 00 00 	movabs $0x80279f,%rcx
  803e89:	00 00 00 
  803e8c:	ff d1                	callq  *%rcx

0000000000803e8e <ipc_find_env>:
  803e8e:	55                   	push   %rbp
  803e8f:	48 89 e5             	mov    %rsp,%rbp
  803e92:	48 83 ec 18          	sub    $0x18,%rsp
  803e96:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e99:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803ea0:	eb 4d                	jmp    803eef <ipc_find_env+0x61>
  803ea2:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  803ea9:	00 00 00 
  803eac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803eaf:	48 98                	cltq   
  803eb1:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  803eb8:	48 01 d0             	add    %rdx,%rax
  803ebb:	48 05 d0 00 00 00    	add    $0xd0,%rax
  803ec1:	8b 00                	mov    (%rax),%eax
  803ec3:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  803ec6:	75 23                	jne    803eeb <ipc_find_env+0x5d>
  803ec8:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  803ecf:	00 00 00 
  803ed2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ed5:	48 98                	cltq   
  803ed7:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  803ede:	48 01 d0             	add    %rdx,%rax
  803ee1:	48 05 c8 00 00 00    	add    $0xc8,%rax
  803ee7:	8b 00                	mov    (%rax),%eax
  803ee9:	eb 12                	jmp    803efd <ipc_find_env+0x6f>
  803eeb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803eef:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  803ef6:	7e aa                	jle    803ea2 <ipc_find_env+0x14>
  803ef8:	b8 00 00 00 00       	mov    $0x0,%eax
  803efd:	c9                   	leaveq 
  803efe:	c3                   	retq   

0000000000803eff <pageref>:
  803eff:	55                   	push   %rbp
  803f00:	48 89 e5             	mov    %rsp,%rbp
  803f03:	48 83 ec 18          	sub    $0x18,%rsp
  803f07:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803f0b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f0f:	48 c1 e8 15          	shr    $0x15,%rax
  803f13:	48 89 c2             	mov    %rax,%rdx
  803f16:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803f1d:	01 00 00 
  803f20:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803f24:	83 e0 01             	and    $0x1,%eax
  803f27:	48 85 c0             	test   %rax,%rax
  803f2a:	75 07                	jne    803f33 <pageref+0x34>
  803f2c:	b8 00 00 00 00       	mov    $0x0,%eax
  803f31:	eb 56                	jmp    803f89 <pageref+0x8a>
  803f33:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f37:	48 c1 e8 0c          	shr    $0xc,%rax
  803f3b:	48 89 c2             	mov    %rax,%rdx
  803f3e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803f45:	01 00 00 
  803f48:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803f4c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803f50:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f54:	83 e0 01             	and    $0x1,%eax
  803f57:	48 85 c0             	test   %rax,%rax
  803f5a:	75 07                	jne    803f63 <pageref+0x64>
  803f5c:	b8 00 00 00 00       	mov    $0x0,%eax
  803f61:	eb 26                	jmp    803f89 <pageref+0x8a>
  803f63:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f67:	48 c1 e8 0c          	shr    $0xc,%rax
  803f6b:	48 89 c2             	mov    %rax,%rdx
  803f6e:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  803f75:	00 00 00 
  803f78:	48 c1 e2 04          	shl    $0x4,%rdx
  803f7c:	48 01 d0             	add    %rdx,%rax
  803f7f:	48 83 c0 08          	add    $0x8,%rax
  803f83:	0f b7 00             	movzwl (%rax),%eax
  803f86:	0f b7 c0             	movzwl %ax,%eax
  803f89:	c9                   	leaveq 
  803f8a:	c3                   	retq   
