
vmm/guest/obj/net/testoutput:     file format elf64-x86-64


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
  80003c:	e8 5f 05 00 00       	callq  8005a0 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	53                   	push   %rbx
  800048:	48 83 ec 28          	sub    $0x28,%rsp
  80004c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80004f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  800053:	48 b8 c9 1c 80 00 00 	movabs $0x801cc9,%rax
  80005a:	00 00 00 
  80005d:	ff d0                	callq  *%rax
  80005f:	89 45 e8             	mov    %eax,-0x18(%rbp)
  800062:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800069:	00 00 00 
  80006c:	48 bb 00 4c 80 00 00 	movabs $0x804c00,%rbx
  800073:	00 00 00 
  800076:	48 89 18             	mov    %rbx,(%rax)
  800079:	48 b8 df 24 80 00 00 	movabs $0x8024df,%rax
  800080:	00 00 00 
  800083:	ff d0                	callq  *%rax
  800085:	89 c2                	mov    %eax,%edx
  800087:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80008e:	00 00 00 
  800091:	89 10                	mov    %edx,(%rax)
  800093:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80009a:	00 00 00 
  80009d:	8b 00                	mov    (%rax),%eax
  80009f:	85 c0                	test   %eax,%eax
  8000a1:	79 2a                	jns    8000cd <umain+0x8a>
  8000a3:	48 ba 0b 4c 80 00 00 	movabs $0x804c0b,%rdx
  8000aa:	00 00 00 
  8000ad:	be 17 00 00 00       	mov    $0x17,%esi
  8000b2:	48 bf 19 4c 80 00 00 	movabs $0x804c19,%rdi
  8000b9:	00 00 00 
  8000bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8000c1:	48 b9 48 06 80 00 00 	movabs $0x800648,%rcx
  8000c8:	00 00 00 
  8000cb:	ff d1                	callq  *%rcx
  8000cd:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8000d4:	00 00 00 
  8000d7:	8b 00                	mov    (%rax),%eax
  8000d9:	85 c0                	test   %eax,%eax
  8000db:	75 16                	jne    8000f3 <umain+0xb0>
  8000dd:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8000e0:	89 c7                	mov    %eax,%edi
  8000e2:	48 b8 8b 04 80 00 00 	movabs $0x80048b,%rax
  8000e9:	00 00 00 
  8000ec:	ff d0                	callq  *%rax
  8000ee:	e9 50 01 00 00       	jmpq   800243 <umain+0x200>
  8000f3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  8000fa:	e9 1b 01 00 00       	jmpq   80021a <umain+0x1d7>
  8000ff:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800106:	00 00 00 
  800109:	48 8b 00             	mov    (%rax),%rax
  80010c:	ba 07 00 00 00       	mov    $0x7,%edx
  800111:	48 89 c6             	mov    %rax,%rsi
  800114:	bf 00 00 00 00       	mov    $0x0,%edi
  800119:	48 b8 42 1d 80 00 00 	movabs $0x801d42,%rax
  800120:	00 00 00 
  800123:	ff d0                	callq  *%rax
  800125:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  800128:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80012c:	79 30                	jns    80015e <umain+0x11b>
  80012e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800131:	89 c1                	mov    %eax,%ecx
  800133:	48 ba 2d 4c 80 00 00 	movabs $0x804c2d,%rdx
  80013a:	00 00 00 
  80013d:	be 1f 00 00 00       	mov    $0x1f,%esi
  800142:	48 bf 19 4c 80 00 00 	movabs $0x804c19,%rdi
  800149:	00 00 00 
  80014c:	b8 00 00 00 00       	mov    $0x0,%eax
  800151:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  800158:	00 00 00 
  80015b:	41 ff d0             	callq  *%r8
  80015e:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800165:	00 00 00 
  800168:	48 8b 18             	mov    (%rax),%rbx
  80016b:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800172:	00 00 00 
  800175:	48 8b 00             	mov    (%rax),%rax
  800178:	48 8d 78 04          	lea    0x4(%rax),%rdi
  80017c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80017f:	89 c1                	mov    %eax,%ecx
  800181:	48 ba 40 4c 80 00 00 	movabs $0x804c40,%rdx
  800188:	00 00 00 
  80018b:	be fc 0f 00 00       	mov    $0xffc,%esi
  800190:	b8 00 00 00 00       	mov    $0x0,%eax
  800195:	49 b8 c5 12 80 00 00 	movabs $0x8012c5,%r8
  80019c:	00 00 00 
  80019f:	41 ff d0             	callq  *%r8
  8001a2:	89 03                	mov    %eax,(%rbx)
  8001a4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8001a7:	89 c6                	mov    %eax,%esi
  8001a9:	48 bf 4c 4c 80 00 00 	movabs $0x804c4c,%rdi
  8001b0:	00 00 00 
  8001b3:	b8 00 00 00 00       	mov    $0x0,%eax
  8001b8:	48 ba 82 08 80 00 00 	movabs $0x800882,%rdx
  8001bf:	00 00 00 
  8001c2:	ff d2                	callq  *%rdx
  8001c4:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8001cb:	00 00 00 
  8001ce:	48 8b 10             	mov    (%rax),%rdx
  8001d1:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8001d8:	00 00 00 
  8001db:	8b 00                	mov    (%rax),%eax
  8001dd:	b9 07 00 00 00       	mov    $0x7,%ecx
  8001e2:	be 0b 00 00 00       	mov    $0xb,%esi
  8001e7:	89 c7                	mov    %eax,%edi
  8001e9:	48 b8 17 28 80 00 00 	movabs $0x802817,%rax
  8001f0:	00 00 00 
  8001f3:	ff d0                	callq  *%rax
  8001f5:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8001fc:	00 00 00 
  8001ff:	48 8b 00             	mov    (%rax),%rax
  800202:	48 89 c6             	mov    %rax,%rsi
  800205:	bf 00 00 00 00       	mov    $0x0,%edi
  80020a:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  800211:	00 00 00 
  800214:	ff d0                	callq  *%rax
  800216:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  80021a:	83 7d ec 09          	cmpl   $0x9,-0x14(%rbp)
  80021e:	0f 8e db fe ff ff    	jle    8000ff <umain+0xbc>
  800224:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  80022b:	eb 10                	jmp    80023d <umain+0x1fa>
  80022d:	48 b8 05 1d 80 00 00 	movabs $0x801d05,%rax
  800234:	00 00 00 
  800237:	ff d0                	callq  *%rax
  800239:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  80023d:	83 7d ec 13          	cmpl   $0x13,-0x14(%rbp)
  800241:	7e ea                	jle    80022d <umain+0x1ea>
  800243:	48 83 c4 28          	add    $0x28,%rsp
  800247:	5b                   	pop    %rbx
  800248:	5d                   	pop    %rbp
  800249:	c3                   	retq   

000000000080024a <timer>:
  80024a:	55                   	push   %rbp
  80024b:	48 89 e5             	mov    %rsp,%rbp
  80024e:	48 83 ec 20          	sub    $0x20,%rsp
  800252:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800255:	89 75 e8             	mov    %esi,-0x18(%rbp)
  800258:	48 b8 c2 1f 80 00 00 	movabs $0x801fc2,%rax
  80025f:	00 00 00 
  800262:	ff d0                	callq  *%rax
  800264:	89 c2                	mov    %eax,%edx
  800266:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800269:	01 d0                	add    %edx,%eax
  80026b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80026e:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800275:	00 00 00 
  800278:	48 b9 68 4c 80 00 00 	movabs $0x804c68,%rcx
  80027f:	00 00 00 
  800282:	48 89 08             	mov    %rcx,(%rax)
  800285:	eb 0c                	jmp    800293 <timer+0x49>
  800287:	48 b8 05 1d 80 00 00 	movabs $0x801d05,%rax
  80028e:	00 00 00 
  800291:	ff d0                	callq  *%rax
  800293:	48 b8 c2 1f 80 00 00 	movabs $0x801fc2,%rax
  80029a:	00 00 00 
  80029d:	ff d0                	callq  *%rax
  80029f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8002a2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8002a5:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  8002a8:	73 06                	jae    8002b0 <timer+0x66>
  8002aa:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8002ae:	79 d7                	jns    800287 <timer+0x3d>
  8002b0:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8002b4:	79 30                	jns    8002e6 <timer+0x9c>
  8002b6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8002b9:	89 c1                	mov    %eax,%ecx
  8002bb:	48 ba 71 4c 80 00 00 	movabs $0x804c71,%rdx
  8002c2:	00 00 00 
  8002c5:	be 10 00 00 00       	mov    $0x10,%esi
  8002ca:	48 bf 83 4c 80 00 00 	movabs $0x804c83,%rdi
  8002d1:	00 00 00 
  8002d4:	b8 00 00 00 00       	mov    $0x0,%eax
  8002d9:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  8002e0:	00 00 00 
  8002e3:	41 ff d0             	callq  *%r8
  8002e6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8002e9:	b9 00 00 00 00       	mov    $0x0,%ecx
  8002ee:	ba 00 00 00 00       	mov    $0x0,%edx
  8002f3:	be 0c 00 00 00       	mov    $0xc,%esi
  8002f8:	89 c7                	mov    %eax,%edi
  8002fa:	48 b8 17 28 80 00 00 	movabs $0x802817,%rax
  800301:	00 00 00 
  800304:	ff d0                	callq  *%rax
  800306:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80030a:	ba 00 00 00 00       	mov    $0x0,%edx
  80030f:	be 00 00 00 00       	mov    $0x0,%esi
  800314:	48 89 c7             	mov    %rax,%rdi
  800317:	48 b8 56 27 80 00 00 	movabs $0x802756,%rax
  80031e:	00 00 00 
  800321:	ff d0                	callq  *%rax
  800323:	89 45 f4             	mov    %eax,-0xc(%rbp)
  800326:	8b 55 f0             	mov    -0x10(%rbp),%edx
  800329:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80032c:	39 c2                	cmp    %eax,%edx
  80032e:	74 22                	je     800352 <timer+0x108>
  800330:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800333:	89 c6                	mov    %eax,%esi
  800335:	48 bf 98 4c 80 00 00 	movabs $0x804c98,%rdi
  80033c:	00 00 00 
  80033f:	b8 00 00 00 00       	mov    $0x0,%eax
  800344:	48 ba 82 08 80 00 00 	movabs $0x800882,%rdx
  80034b:	00 00 00 
  80034e:	ff d2                	callq  *%rdx
  800350:	eb b4                	jmp    800306 <timer+0xbc>
  800352:	48 b8 c2 1f 80 00 00 	movabs $0x801fc2,%rax
  800359:	00 00 00 
  80035c:	ff d0                	callq  *%rax
  80035e:	89 c2                	mov    %eax,%edx
  800360:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800363:	01 d0                	add    %edx,%eax
  800365:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800368:	e9 18 ff ff ff       	jmpq   800285 <timer+0x3b>

000000000080036d <input>:
  80036d:	55                   	push   %rbp
  80036e:	48 89 e5             	mov    %rsp,%rbp
  800371:	48 83 ec 20          	sub    $0x20,%rsp
  800375:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800378:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80037f:	00 00 00 
  800382:	48 b9 d3 4c 80 00 00 	movabs $0x804cd3,%rcx
  800389:	00 00 00 
  80038c:	48 89 08             	mov    %rcx,(%rax)
  80038f:	ba 07 00 00 00       	mov    $0x7,%edx
  800394:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  80039b:	00 00 00 
  80039e:	bf 00 00 00 00       	mov    $0x0,%edi
  8003a3:	48 b8 42 1d 80 00 00 	movabs $0x801d42,%rax
  8003aa:	00 00 00 
  8003ad:	ff d0                	callq  *%rax
  8003af:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8003b2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8003b6:	79 30                	jns    8003e8 <input+0x7b>
  8003b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003bb:	89 c1                	mov    %eax,%ecx
  8003bd:	48 ba dc 4c 80 00 00 	movabs $0x804cdc,%rdx
  8003c4:	00 00 00 
  8003c7:	be 0e 00 00 00       	mov    $0xe,%esi
  8003cc:	48 bf ef 4c 80 00 00 	movabs $0x804cef,%rdi
  8003d3:	00 00 00 
  8003d6:	b8 00 00 00 00       	mov    $0x0,%eax
  8003db:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  8003e2:	00 00 00 
  8003e5:	41 ff d0             	callq  *%r8
  8003e8:	be ee 05 00 00       	mov    $0x5ee,%esi
  8003ed:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  8003f4:	00 00 00 
  8003f7:	48 b8 48 20 80 00 00 	movabs $0x802048,%rax
  8003fe:	00 00 00 
  800401:	ff d0                	callq  *%rax
  800403:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800406:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80040a:	75 11                	jne    80041d <input+0xb0>
  80040c:	48 b8 05 1d 80 00 00 	movabs $0x801d05,%rax
  800413:	00 00 00 
  800416:	ff d0                	callq  *%rax
  800418:	e9 72 ff ff ff       	jmpq   80038f <input+0x22>
  80041d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800421:	79 25                	jns    800448 <input+0xdb>
  800423:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800426:	89 c6                	mov    %eax,%esi
  800428:	48 bf fe 4c 80 00 00 	movabs $0x804cfe,%rdi
  80042f:	00 00 00 
  800432:	b8 00 00 00 00       	mov    $0x0,%eax
  800437:	48 ba 82 08 80 00 00 	movabs $0x800882,%rdx
  80043e:	00 00 00 
  800441:	ff d2                	callq  *%rdx
  800443:	e9 47 ff ff ff       	jmpq   80038f <input+0x22>
  800448:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80044c:	0f 8e 3d ff ff ff    	jle    80038f <input+0x22>
  800452:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  800459:	00 00 00 
  80045c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80045f:	89 10                	mov    %edx,(%rax)
  800461:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800464:	b9 05 00 00 00       	mov    $0x5,%ecx
  800469:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  800470:	00 00 00 
  800473:	be 0a 00 00 00       	mov    $0xa,%esi
  800478:	89 c7                	mov    %eax,%edi
  80047a:	48 b8 17 28 80 00 00 	movabs $0x802817,%rax
  800481:	00 00 00 
  800484:	ff d0                	callq  *%rax
  800486:	e9 04 ff ff ff       	jmpq   80038f <input+0x22>

000000000080048b <output>:
  80048b:	55                   	push   %rbp
  80048c:	48 89 e5             	mov    %rsp,%rbp
  80048f:	48 83 ec 20          	sub    $0x20,%rsp
  800493:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800496:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80049d:	00 00 00 
  8004a0:	48 b9 20 4d 80 00 00 	movabs $0x804d20,%rcx
  8004a7:	00 00 00 
  8004aa:	48 89 08             	mov    %rcx,(%rax)
  8004ad:	48 8d 45 f4          	lea    -0xc(%rbp),%rax
  8004b1:	ba 00 00 00 00       	mov    $0x0,%edx
  8004b6:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  8004bd:	00 00 00 
  8004c0:	48 89 c7             	mov    %rax,%rdi
  8004c3:	48 b8 56 27 80 00 00 	movabs $0x802756,%rax
  8004ca:	00 00 00 
  8004cd:	ff d0                	callq  *%rax
  8004cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8004d2:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8004d5:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8004d8:	74 35                	je     80050f <output+0x84>
  8004da:	48 b9 2a 4d 80 00 00 	movabs $0x804d2a,%rcx
  8004e1:	00 00 00 
  8004e4:	48 ba 3b 4d 80 00 00 	movabs $0x804d3b,%rdx
  8004eb:	00 00 00 
  8004ee:	be 11 00 00 00       	mov    $0x11,%esi
  8004f3:	48 bf 50 4d 80 00 00 	movabs $0x804d50,%rdi
  8004fa:	00 00 00 
  8004fd:	b8 00 00 00 00       	mov    $0x0,%eax
  800502:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  800509:	00 00 00 
  80050c:	41 ff d0             	callq  *%r8
  80050f:	83 7d fc 0b          	cmpl   $0xb,-0x4(%rbp)
  800513:	74 35                	je     80054a <output+0xbf>
  800515:	48 b9 60 4d 80 00 00 	movabs $0x804d60,%rcx
  80051c:	00 00 00 
  80051f:	48 ba 3b 4d 80 00 00 	movabs $0x804d3b,%rdx
  800526:	00 00 00 
  800529:	be 12 00 00 00       	mov    $0x12,%esi
  80052e:	48 bf 50 4d 80 00 00 	movabs $0x804d50,%rdi
  800535:	00 00 00 
  800538:	b8 00 00 00 00       	mov    $0x0,%eax
  80053d:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  800544:	00 00 00 
  800547:	41 ff d0             	callq  *%r8
  80054a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  800551:	00 00 00 
  800554:	8b 00                	mov    (%rax),%eax
  800556:	89 c6                	mov    %eax,%esi
  800558:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  80055f:	00 00 00 
  800562:	48 b8 fe 1f 80 00 00 	movabs $0x801ffe,%rax
  800569:	00 00 00 
  80056c:	ff d0                	callq  *%rax
  80056e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800571:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800575:	0f 89 32 ff ff ff    	jns    8004ad <output+0x22>
  80057b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80057e:	89 c6                	mov    %eax,%esi
  800580:	48 bf 78 4d 80 00 00 	movabs $0x804d78,%rdi
  800587:	00 00 00 
  80058a:	b8 00 00 00 00       	mov    $0x0,%eax
  80058f:	48 ba 82 08 80 00 00 	movabs $0x800882,%rdx
  800596:	00 00 00 
  800599:	ff d2                	callq  *%rdx
  80059b:	e9 0d ff ff ff       	jmpq   8004ad <output+0x22>

00000000008005a0 <libmain>:
  8005a0:	55                   	push   %rbp
  8005a1:	48 89 e5             	mov    %rsp,%rbp
  8005a4:	48 83 ec 10          	sub    $0x10,%rsp
  8005a8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8005ab:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8005af:	48 b8 c9 1c 80 00 00 	movabs $0x801cc9,%rax
  8005b6:	00 00 00 
  8005b9:	ff d0                	callq  *%rax
  8005bb:	25 ff 03 00 00       	and    $0x3ff,%eax
  8005c0:	48 98                	cltq   
  8005c2:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8005c9:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8005d0:	00 00 00 
  8005d3:	48 01 c2             	add    %rax,%rdx
  8005d6:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8005dd:	00 00 00 
  8005e0:	48 89 10             	mov    %rdx,(%rax)
  8005e3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8005e7:	7e 14                	jle    8005fd <libmain+0x5d>
  8005e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005ed:	48 8b 10             	mov    (%rax),%rdx
  8005f0:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8005f7:	00 00 00 
  8005fa:	48 89 10             	mov    %rdx,(%rax)
  8005fd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800601:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800604:	48 89 d6             	mov    %rdx,%rsi
  800607:	89 c7                	mov    %eax,%edi
  800609:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800610:	00 00 00 
  800613:	ff d0                	callq  *%rax
  800615:	48 b8 24 06 80 00 00 	movabs $0x800624,%rax
  80061c:	00 00 00 
  80061f:	ff d0                	callq  *%rax
  800621:	90                   	nop
  800622:	c9                   	leaveq 
  800623:	c3                   	retq   

0000000000800624 <exit>:
  800624:	55                   	push   %rbp
  800625:	48 89 e5             	mov    %rsp,%rbp
  800628:	48 b8 d5 2c 80 00 00 	movabs $0x802cd5,%rax
  80062f:	00 00 00 
  800632:	ff d0                	callq  *%rax
  800634:	bf 00 00 00 00       	mov    $0x0,%edi
  800639:	48 b8 83 1c 80 00 00 	movabs $0x801c83,%rax
  800640:	00 00 00 
  800643:	ff d0                	callq  *%rax
  800645:	90                   	nop
  800646:	5d                   	pop    %rbp
  800647:	c3                   	retq   

0000000000800648 <_panic>:
  800648:	55                   	push   %rbp
  800649:	48 89 e5             	mov    %rsp,%rbp
  80064c:	53                   	push   %rbx
  80064d:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800654:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  80065b:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800661:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800668:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  80066f:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800676:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  80067d:	84 c0                	test   %al,%al
  80067f:	74 23                	je     8006a4 <_panic+0x5c>
  800681:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800688:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  80068c:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800690:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800694:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800698:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  80069c:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  8006a0:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  8006a4:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8006ab:	00 00 00 
  8006ae:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8006b5:	00 00 00 
  8006b8:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8006bc:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8006c3:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8006ca:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8006d1:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8006d8:	00 00 00 
  8006db:	48 8b 18             	mov    (%rax),%rbx
  8006de:	48 b8 c9 1c 80 00 00 	movabs $0x801cc9,%rax
  8006e5:	00 00 00 
  8006e8:	ff d0                	callq  *%rax
  8006ea:	89 c6                	mov    %eax,%esi
  8006ec:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  8006f2:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  8006f9:	41 89 d0             	mov    %edx,%r8d
  8006fc:	48 89 c1             	mov    %rax,%rcx
  8006ff:	48 89 da             	mov    %rbx,%rdx
  800702:	48 bf a8 4d 80 00 00 	movabs $0x804da8,%rdi
  800709:	00 00 00 
  80070c:	b8 00 00 00 00       	mov    $0x0,%eax
  800711:	49 b9 82 08 80 00 00 	movabs $0x800882,%r9
  800718:	00 00 00 
  80071b:	41 ff d1             	callq  *%r9
  80071e:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800725:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80072c:	48 89 d6             	mov    %rdx,%rsi
  80072f:	48 89 c7             	mov    %rax,%rdi
  800732:	48 b8 d6 07 80 00 00 	movabs $0x8007d6,%rax
  800739:	00 00 00 
  80073c:	ff d0                	callq  *%rax
  80073e:	48 bf cb 4d 80 00 00 	movabs $0x804dcb,%rdi
  800745:	00 00 00 
  800748:	b8 00 00 00 00       	mov    $0x0,%eax
  80074d:	48 ba 82 08 80 00 00 	movabs $0x800882,%rdx
  800754:	00 00 00 
  800757:	ff d2                	callq  *%rdx
  800759:	cc                   	int3   
  80075a:	eb fd                	jmp    800759 <_panic+0x111>

000000000080075c <putch>:
  80075c:	55                   	push   %rbp
  80075d:	48 89 e5             	mov    %rsp,%rbp
  800760:	48 83 ec 10          	sub    $0x10,%rsp
  800764:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800767:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80076b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80076f:	8b 00                	mov    (%rax),%eax
  800771:	8d 48 01             	lea    0x1(%rax),%ecx
  800774:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800778:	89 0a                	mov    %ecx,(%rdx)
  80077a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80077d:	89 d1                	mov    %edx,%ecx
  80077f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800783:	48 98                	cltq   
  800785:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800789:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80078d:	8b 00                	mov    (%rax),%eax
  80078f:	3d ff 00 00 00       	cmp    $0xff,%eax
  800794:	75 2c                	jne    8007c2 <putch+0x66>
  800796:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80079a:	8b 00                	mov    (%rax),%eax
  80079c:	48 98                	cltq   
  80079e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8007a2:	48 83 c2 08          	add    $0x8,%rdx
  8007a6:	48 89 c6             	mov    %rax,%rsi
  8007a9:	48 89 d7             	mov    %rdx,%rdi
  8007ac:	48 b8 fa 1b 80 00 00 	movabs $0x801bfa,%rax
  8007b3:	00 00 00 
  8007b6:	ff d0                	callq  *%rax
  8007b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8007bc:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8007c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8007c6:	8b 40 04             	mov    0x4(%rax),%eax
  8007c9:	8d 50 01             	lea    0x1(%rax),%edx
  8007cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8007d0:	89 50 04             	mov    %edx,0x4(%rax)
  8007d3:	90                   	nop
  8007d4:	c9                   	leaveq 
  8007d5:	c3                   	retq   

00000000008007d6 <vcprintf>:
  8007d6:	55                   	push   %rbp
  8007d7:	48 89 e5             	mov    %rsp,%rbp
  8007da:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8007e1:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8007e8:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8007ef:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8007f6:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8007fd:	48 8b 0a             	mov    (%rdx),%rcx
  800800:	48 89 08             	mov    %rcx,(%rax)
  800803:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800807:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80080b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80080f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800813:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  80081a:	00 00 00 
  80081d:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800824:	00 00 00 
  800827:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  80082e:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800835:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  80083c:	48 89 c6             	mov    %rax,%rsi
  80083f:	48 bf 5c 07 80 00 00 	movabs $0x80075c,%rdi
  800846:	00 00 00 
  800849:	48 b8 20 0c 80 00 00 	movabs $0x800c20,%rax
  800850:	00 00 00 
  800853:	ff d0                	callq  *%rax
  800855:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  80085b:	48 98                	cltq   
  80085d:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800864:	48 83 c2 08          	add    $0x8,%rdx
  800868:	48 89 c6             	mov    %rax,%rsi
  80086b:	48 89 d7             	mov    %rdx,%rdi
  80086e:	48 b8 fa 1b 80 00 00 	movabs $0x801bfa,%rax
  800875:	00 00 00 
  800878:	ff d0                	callq  *%rax
  80087a:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800880:	c9                   	leaveq 
  800881:	c3                   	retq   

0000000000800882 <cprintf>:
  800882:	55                   	push   %rbp
  800883:	48 89 e5             	mov    %rsp,%rbp
  800886:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  80088d:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800894:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80089b:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8008a2:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8008a9:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8008b0:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8008b7:	84 c0                	test   %al,%al
  8008b9:	74 20                	je     8008db <cprintf+0x59>
  8008bb:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8008bf:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8008c3:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8008c7:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8008cb:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8008cf:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8008d3:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8008d7:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8008db:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8008e2:	00 00 00 
  8008e5:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8008ec:	00 00 00 
  8008ef:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8008f3:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8008fa:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800901:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800908:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80090f:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800916:	48 8b 0a             	mov    (%rdx),%rcx
  800919:	48 89 08             	mov    %rcx,(%rax)
  80091c:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800920:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800924:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800928:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80092c:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800933:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80093a:	48 89 d6             	mov    %rdx,%rsi
  80093d:	48 89 c7             	mov    %rax,%rdi
  800940:	48 b8 d6 07 80 00 00 	movabs $0x8007d6,%rax
  800947:	00 00 00 
  80094a:	ff d0                	callq  *%rax
  80094c:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800952:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800958:	c9                   	leaveq 
  800959:	c3                   	retq   

000000000080095a <printnum>:
  80095a:	55                   	push   %rbp
  80095b:	48 89 e5             	mov    %rsp,%rbp
  80095e:	48 83 ec 30          	sub    $0x30,%rsp
  800962:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800966:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80096a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80096e:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  800971:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  800975:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  800979:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80097c:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  800980:	77 54                	ja     8009d6 <printnum+0x7c>
  800982:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800985:	8d 78 ff             	lea    -0x1(%rax),%edi
  800988:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  80098b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80098f:	ba 00 00 00 00       	mov    $0x0,%edx
  800994:	48 f7 f6             	div    %rsi
  800997:	49 89 c2             	mov    %rax,%r10
  80099a:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  80099d:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8009a0:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8009a4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8009a8:	41 89 c9             	mov    %ecx,%r9d
  8009ab:	41 89 f8             	mov    %edi,%r8d
  8009ae:	89 d1                	mov    %edx,%ecx
  8009b0:	4c 89 d2             	mov    %r10,%rdx
  8009b3:	48 89 c7             	mov    %rax,%rdi
  8009b6:	48 b8 5a 09 80 00 00 	movabs $0x80095a,%rax
  8009bd:	00 00 00 
  8009c0:	ff d0                	callq  *%rax
  8009c2:	eb 1c                	jmp    8009e0 <printnum+0x86>
  8009c4:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8009c8:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8009cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8009cf:	48 89 ce             	mov    %rcx,%rsi
  8009d2:	89 d7                	mov    %edx,%edi
  8009d4:	ff d0                	callq  *%rax
  8009d6:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  8009da:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  8009de:	7f e4                	jg     8009c4 <printnum+0x6a>
  8009e0:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8009e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009e7:	ba 00 00 00 00       	mov    $0x0,%edx
  8009ec:	48 f7 f1             	div    %rcx
  8009ef:	48 b8 d0 4f 80 00 00 	movabs $0x804fd0,%rax
  8009f6:	00 00 00 
  8009f9:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  8009fd:	0f be d0             	movsbl %al,%edx
  800a00:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800a04:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800a08:	48 89 ce             	mov    %rcx,%rsi
  800a0b:	89 d7                	mov    %edx,%edi
  800a0d:	ff d0                	callq  *%rax
  800a0f:	90                   	nop
  800a10:	c9                   	leaveq 
  800a11:	c3                   	retq   

0000000000800a12 <getuint>:
  800a12:	55                   	push   %rbp
  800a13:	48 89 e5             	mov    %rsp,%rbp
  800a16:	48 83 ec 20          	sub    $0x20,%rsp
  800a1a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800a1e:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800a21:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800a25:	7e 4f                	jle    800a76 <getuint+0x64>
  800a27:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a2b:	8b 00                	mov    (%rax),%eax
  800a2d:	83 f8 30             	cmp    $0x30,%eax
  800a30:	73 24                	jae    800a56 <getuint+0x44>
  800a32:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a36:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a3a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a3e:	8b 00                	mov    (%rax),%eax
  800a40:	89 c0                	mov    %eax,%eax
  800a42:	48 01 d0             	add    %rdx,%rax
  800a45:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a49:	8b 12                	mov    (%rdx),%edx
  800a4b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a4e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a52:	89 0a                	mov    %ecx,(%rdx)
  800a54:	eb 14                	jmp    800a6a <getuint+0x58>
  800a56:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a5a:	48 8b 40 08          	mov    0x8(%rax),%rax
  800a5e:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800a62:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a66:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a6a:	48 8b 00             	mov    (%rax),%rax
  800a6d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a71:	e9 9d 00 00 00       	jmpq   800b13 <getuint+0x101>
  800a76:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800a7a:	74 4c                	je     800ac8 <getuint+0xb6>
  800a7c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a80:	8b 00                	mov    (%rax),%eax
  800a82:	83 f8 30             	cmp    $0x30,%eax
  800a85:	73 24                	jae    800aab <getuint+0x99>
  800a87:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a8b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a8f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a93:	8b 00                	mov    (%rax),%eax
  800a95:	89 c0                	mov    %eax,%eax
  800a97:	48 01 d0             	add    %rdx,%rax
  800a9a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a9e:	8b 12                	mov    (%rdx),%edx
  800aa0:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800aa3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800aa7:	89 0a                	mov    %ecx,(%rdx)
  800aa9:	eb 14                	jmp    800abf <getuint+0xad>
  800aab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800aaf:	48 8b 40 08          	mov    0x8(%rax),%rax
  800ab3:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800ab7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800abb:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800abf:	48 8b 00             	mov    (%rax),%rax
  800ac2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800ac6:	eb 4b                	jmp    800b13 <getuint+0x101>
  800ac8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800acc:	8b 00                	mov    (%rax),%eax
  800ace:	83 f8 30             	cmp    $0x30,%eax
  800ad1:	73 24                	jae    800af7 <getuint+0xe5>
  800ad3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ad7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800adb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800adf:	8b 00                	mov    (%rax),%eax
  800ae1:	89 c0                	mov    %eax,%eax
  800ae3:	48 01 d0             	add    %rdx,%rax
  800ae6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800aea:	8b 12                	mov    (%rdx),%edx
  800aec:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800aef:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800af3:	89 0a                	mov    %ecx,(%rdx)
  800af5:	eb 14                	jmp    800b0b <getuint+0xf9>
  800af7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800afb:	48 8b 40 08          	mov    0x8(%rax),%rax
  800aff:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800b03:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b07:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800b0b:	8b 00                	mov    (%rax),%eax
  800b0d:	89 c0                	mov    %eax,%eax
  800b0f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800b13:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800b17:	c9                   	leaveq 
  800b18:	c3                   	retq   

0000000000800b19 <getint>:
  800b19:	55                   	push   %rbp
  800b1a:	48 89 e5             	mov    %rsp,%rbp
  800b1d:	48 83 ec 20          	sub    $0x20,%rsp
  800b21:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800b25:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800b28:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800b2c:	7e 4f                	jle    800b7d <getint+0x64>
  800b2e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b32:	8b 00                	mov    (%rax),%eax
  800b34:	83 f8 30             	cmp    $0x30,%eax
  800b37:	73 24                	jae    800b5d <getint+0x44>
  800b39:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b3d:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b41:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b45:	8b 00                	mov    (%rax),%eax
  800b47:	89 c0                	mov    %eax,%eax
  800b49:	48 01 d0             	add    %rdx,%rax
  800b4c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b50:	8b 12                	mov    (%rdx),%edx
  800b52:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800b55:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b59:	89 0a                	mov    %ecx,(%rdx)
  800b5b:	eb 14                	jmp    800b71 <getint+0x58>
  800b5d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b61:	48 8b 40 08          	mov    0x8(%rax),%rax
  800b65:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800b69:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b6d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800b71:	48 8b 00             	mov    (%rax),%rax
  800b74:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800b78:	e9 9d 00 00 00       	jmpq   800c1a <getint+0x101>
  800b7d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800b81:	74 4c                	je     800bcf <getint+0xb6>
  800b83:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b87:	8b 00                	mov    (%rax),%eax
  800b89:	83 f8 30             	cmp    $0x30,%eax
  800b8c:	73 24                	jae    800bb2 <getint+0x99>
  800b8e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b92:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b96:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b9a:	8b 00                	mov    (%rax),%eax
  800b9c:	89 c0                	mov    %eax,%eax
  800b9e:	48 01 d0             	add    %rdx,%rax
  800ba1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ba5:	8b 12                	mov    (%rdx),%edx
  800ba7:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800baa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bae:	89 0a                	mov    %ecx,(%rdx)
  800bb0:	eb 14                	jmp    800bc6 <getint+0xad>
  800bb2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bb6:	48 8b 40 08          	mov    0x8(%rax),%rax
  800bba:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800bbe:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bc2:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800bc6:	48 8b 00             	mov    (%rax),%rax
  800bc9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800bcd:	eb 4b                	jmp    800c1a <getint+0x101>
  800bcf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bd3:	8b 00                	mov    (%rax),%eax
  800bd5:	83 f8 30             	cmp    $0x30,%eax
  800bd8:	73 24                	jae    800bfe <getint+0xe5>
  800bda:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bde:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800be2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800be6:	8b 00                	mov    (%rax),%eax
  800be8:	89 c0                	mov    %eax,%eax
  800bea:	48 01 d0             	add    %rdx,%rax
  800bed:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bf1:	8b 12                	mov    (%rdx),%edx
  800bf3:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800bf6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bfa:	89 0a                	mov    %ecx,(%rdx)
  800bfc:	eb 14                	jmp    800c12 <getint+0xf9>
  800bfe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c02:	48 8b 40 08          	mov    0x8(%rax),%rax
  800c06:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800c0a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c0e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800c12:	8b 00                	mov    (%rax),%eax
  800c14:	48 98                	cltq   
  800c16:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800c1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800c1e:	c9                   	leaveq 
  800c1f:	c3                   	retq   

0000000000800c20 <vprintfmt>:
  800c20:	55                   	push   %rbp
  800c21:	48 89 e5             	mov    %rsp,%rbp
  800c24:	41 54                	push   %r12
  800c26:	53                   	push   %rbx
  800c27:	48 83 ec 60          	sub    $0x60,%rsp
  800c2b:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800c2f:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800c33:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800c37:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800c3b:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c3f:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800c43:	48 8b 0a             	mov    (%rdx),%rcx
  800c46:	48 89 08             	mov    %rcx,(%rax)
  800c49:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800c4d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800c51:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800c55:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800c59:	eb 17                	jmp    800c72 <vprintfmt+0x52>
  800c5b:	85 db                	test   %ebx,%ebx
  800c5d:	0f 84 b9 04 00 00    	je     80111c <vprintfmt+0x4fc>
  800c63:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c67:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c6b:	48 89 d6             	mov    %rdx,%rsi
  800c6e:	89 df                	mov    %ebx,%edi
  800c70:	ff d0                	callq  *%rax
  800c72:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c76:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800c7a:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800c7e:	0f b6 00             	movzbl (%rax),%eax
  800c81:	0f b6 d8             	movzbl %al,%ebx
  800c84:	83 fb 25             	cmp    $0x25,%ebx
  800c87:	75 d2                	jne    800c5b <vprintfmt+0x3b>
  800c89:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800c8d:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800c94:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800c9b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800ca2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800ca9:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800cad:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800cb1:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800cb5:	0f b6 00             	movzbl (%rax),%eax
  800cb8:	0f b6 d8             	movzbl %al,%ebx
  800cbb:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800cbe:	83 f8 55             	cmp    $0x55,%eax
  800cc1:	0f 87 22 04 00 00    	ja     8010e9 <vprintfmt+0x4c9>
  800cc7:	89 c0                	mov    %eax,%eax
  800cc9:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800cd0:	00 
  800cd1:	48 b8 f8 4f 80 00 00 	movabs $0x804ff8,%rax
  800cd8:	00 00 00 
  800cdb:	48 01 d0             	add    %rdx,%rax
  800cde:	48 8b 00             	mov    (%rax),%rax
  800ce1:	ff e0                	jmpq   *%rax
  800ce3:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800ce7:	eb c0                	jmp    800ca9 <vprintfmt+0x89>
  800ce9:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800ced:	eb ba                	jmp    800ca9 <vprintfmt+0x89>
  800cef:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800cf6:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800cf9:	89 d0                	mov    %edx,%eax
  800cfb:	c1 e0 02             	shl    $0x2,%eax
  800cfe:	01 d0                	add    %edx,%eax
  800d00:	01 c0                	add    %eax,%eax
  800d02:	01 d8                	add    %ebx,%eax
  800d04:	83 e8 30             	sub    $0x30,%eax
  800d07:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800d0a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800d0e:	0f b6 00             	movzbl (%rax),%eax
  800d11:	0f be d8             	movsbl %al,%ebx
  800d14:	83 fb 2f             	cmp    $0x2f,%ebx
  800d17:	7e 60                	jle    800d79 <vprintfmt+0x159>
  800d19:	83 fb 39             	cmp    $0x39,%ebx
  800d1c:	7f 5b                	jg     800d79 <vprintfmt+0x159>
  800d1e:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800d23:	eb d1                	jmp    800cf6 <vprintfmt+0xd6>
  800d25:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d28:	83 f8 30             	cmp    $0x30,%eax
  800d2b:	73 17                	jae    800d44 <vprintfmt+0x124>
  800d2d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d31:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d34:	89 d2                	mov    %edx,%edx
  800d36:	48 01 d0             	add    %rdx,%rax
  800d39:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d3c:	83 c2 08             	add    $0x8,%edx
  800d3f:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d42:	eb 0c                	jmp    800d50 <vprintfmt+0x130>
  800d44:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800d48:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800d4c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d50:	8b 00                	mov    (%rax),%eax
  800d52:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800d55:	eb 23                	jmp    800d7a <vprintfmt+0x15a>
  800d57:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d5b:	0f 89 48 ff ff ff    	jns    800ca9 <vprintfmt+0x89>
  800d61:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800d68:	e9 3c ff ff ff       	jmpq   800ca9 <vprintfmt+0x89>
  800d6d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800d74:	e9 30 ff ff ff       	jmpq   800ca9 <vprintfmt+0x89>
  800d79:	90                   	nop
  800d7a:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d7e:	0f 89 25 ff ff ff    	jns    800ca9 <vprintfmt+0x89>
  800d84:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800d87:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800d8a:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800d91:	e9 13 ff ff ff       	jmpq   800ca9 <vprintfmt+0x89>
  800d96:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800d9a:	e9 0a ff ff ff       	jmpq   800ca9 <vprintfmt+0x89>
  800d9f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800da2:	83 f8 30             	cmp    $0x30,%eax
  800da5:	73 17                	jae    800dbe <vprintfmt+0x19e>
  800da7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800dab:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800dae:	89 d2                	mov    %edx,%edx
  800db0:	48 01 d0             	add    %rdx,%rax
  800db3:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800db6:	83 c2 08             	add    $0x8,%edx
  800db9:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800dbc:	eb 0c                	jmp    800dca <vprintfmt+0x1aa>
  800dbe:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800dc2:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800dc6:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800dca:	8b 10                	mov    (%rax),%edx
  800dcc:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800dd0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dd4:	48 89 ce             	mov    %rcx,%rsi
  800dd7:	89 d7                	mov    %edx,%edi
  800dd9:	ff d0                	callq  *%rax
  800ddb:	e9 37 03 00 00       	jmpq   801117 <vprintfmt+0x4f7>
  800de0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800de3:	83 f8 30             	cmp    $0x30,%eax
  800de6:	73 17                	jae    800dff <vprintfmt+0x1df>
  800de8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800dec:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800def:	89 d2                	mov    %edx,%edx
  800df1:	48 01 d0             	add    %rdx,%rax
  800df4:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800df7:	83 c2 08             	add    $0x8,%edx
  800dfa:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800dfd:	eb 0c                	jmp    800e0b <vprintfmt+0x1eb>
  800dff:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800e03:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800e07:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e0b:	8b 18                	mov    (%rax),%ebx
  800e0d:	85 db                	test   %ebx,%ebx
  800e0f:	79 02                	jns    800e13 <vprintfmt+0x1f3>
  800e11:	f7 db                	neg    %ebx
  800e13:	83 fb 15             	cmp    $0x15,%ebx
  800e16:	7f 16                	jg     800e2e <vprintfmt+0x20e>
  800e18:	48 b8 20 4f 80 00 00 	movabs $0x804f20,%rax
  800e1f:	00 00 00 
  800e22:	48 63 d3             	movslq %ebx,%rdx
  800e25:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800e29:	4d 85 e4             	test   %r12,%r12
  800e2c:	75 2e                	jne    800e5c <vprintfmt+0x23c>
  800e2e:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800e32:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e36:	89 d9                	mov    %ebx,%ecx
  800e38:	48 ba e1 4f 80 00 00 	movabs $0x804fe1,%rdx
  800e3f:	00 00 00 
  800e42:	48 89 c7             	mov    %rax,%rdi
  800e45:	b8 00 00 00 00       	mov    $0x0,%eax
  800e4a:	49 b8 26 11 80 00 00 	movabs $0x801126,%r8
  800e51:	00 00 00 
  800e54:	41 ff d0             	callq  *%r8
  800e57:	e9 bb 02 00 00       	jmpq   801117 <vprintfmt+0x4f7>
  800e5c:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800e60:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e64:	4c 89 e1             	mov    %r12,%rcx
  800e67:	48 ba ea 4f 80 00 00 	movabs $0x804fea,%rdx
  800e6e:	00 00 00 
  800e71:	48 89 c7             	mov    %rax,%rdi
  800e74:	b8 00 00 00 00       	mov    $0x0,%eax
  800e79:	49 b8 26 11 80 00 00 	movabs $0x801126,%r8
  800e80:	00 00 00 
  800e83:	41 ff d0             	callq  *%r8
  800e86:	e9 8c 02 00 00       	jmpq   801117 <vprintfmt+0x4f7>
  800e8b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e8e:	83 f8 30             	cmp    $0x30,%eax
  800e91:	73 17                	jae    800eaa <vprintfmt+0x28a>
  800e93:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800e97:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e9a:	89 d2                	mov    %edx,%edx
  800e9c:	48 01 d0             	add    %rdx,%rax
  800e9f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ea2:	83 c2 08             	add    $0x8,%edx
  800ea5:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ea8:	eb 0c                	jmp    800eb6 <vprintfmt+0x296>
  800eaa:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800eae:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800eb2:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800eb6:	4c 8b 20             	mov    (%rax),%r12
  800eb9:	4d 85 e4             	test   %r12,%r12
  800ebc:	75 0a                	jne    800ec8 <vprintfmt+0x2a8>
  800ebe:	49 bc ed 4f 80 00 00 	movabs $0x804fed,%r12
  800ec5:	00 00 00 
  800ec8:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ecc:	7e 78                	jle    800f46 <vprintfmt+0x326>
  800ece:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800ed2:	74 72                	je     800f46 <vprintfmt+0x326>
  800ed4:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800ed7:	48 98                	cltq   
  800ed9:	48 89 c6             	mov    %rax,%rsi
  800edc:	4c 89 e7             	mov    %r12,%rdi
  800edf:	48 b8 d4 13 80 00 00 	movabs $0x8013d4,%rax
  800ee6:	00 00 00 
  800ee9:	ff d0                	callq  *%rax
  800eeb:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800eee:	eb 17                	jmp    800f07 <vprintfmt+0x2e7>
  800ef0:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800ef4:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800ef8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800efc:	48 89 ce             	mov    %rcx,%rsi
  800eff:	89 d7                	mov    %edx,%edi
  800f01:	ff d0                	callq  *%rax
  800f03:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800f07:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800f0b:	7f e3                	jg     800ef0 <vprintfmt+0x2d0>
  800f0d:	eb 37                	jmp    800f46 <vprintfmt+0x326>
  800f0f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800f13:	74 1e                	je     800f33 <vprintfmt+0x313>
  800f15:	83 fb 1f             	cmp    $0x1f,%ebx
  800f18:	7e 05                	jle    800f1f <vprintfmt+0x2ff>
  800f1a:	83 fb 7e             	cmp    $0x7e,%ebx
  800f1d:	7e 14                	jle    800f33 <vprintfmt+0x313>
  800f1f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f23:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f27:	48 89 d6             	mov    %rdx,%rsi
  800f2a:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800f2f:	ff d0                	callq  *%rax
  800f31:	eb 0f                	jmp    800f42 <vprintfmt+0x322>
  800f33:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f37:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f3b:	48 89 d6             	mov    %rdx,%rsi
  800f3e:	89 df                	mov    %ebx,%edi
  800f40:	ff d0                	callq  *%rax
  800f42:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800f46:	4c 89 e0             	mov    %r12,%rax
  800f49:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800f4d:	0f b6 00             	movzbl (%rax),%eax
  800f50:	0f be d8             	movsbl %al,%ebx
  800f53:	85 db                	test   %ebx,%ebx
  800f55:	74 28                	je     800f7f <vprintfmt+0x35f>
  800f57:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800f5b:	78 b2                	js     800f0f <vprintfmt+0x2ef>
  800f5d:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800f61:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800f65:	79 a8                	jns    800f0f <vprintfmt+0x2ef>
  800f67:	eb 16                	jmp    800f7f <vprintfmt+0x35f>
  800f69:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f6d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f71:	48 89 d6             	mov    %rdx,%rsi
  800f74:	bf 20 00 00 00       	mov    $0x20,%edi
  800f79:	ff d0                	callq  *%rax
  800f7b:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800f7f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800f83:	7f e4                	jg     800f69 <vprintfmt+0x349>
  800f85:	e9 8d 01 00 00       	jmpq   801117 <vprintfmt+0x4f7>
  800f8a:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800f8e:	be 03 00 00 00       	mov    $0x3,%esi
  800f93:	48 89 c7             	mov    %rax,%rdi
  800f96:	48 b8 19 0b 80 00 00 	movabs $0x800b19,%rax
  800f9d:	00 00 00 
  800fa0:	ff d0                	callq  *%rax
  800fa2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800fa6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800faa:	48 85 c0             	test   %rax,%rax
  800fad:	79 1d                	jns    800fcc <vprintfmt+0x3ac>
  800faf:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800fb3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800fb7:	48 89 d6             	mov    %rdx,%rsi
  800fba:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800fbf:	ff d0                	callq  *%rax
  800fc1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fc5:	48 f7 d8             	neg    %rax
  800fc8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800fcc:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800fd3:	e9 d2 00 00 00       	jmpq   8010aa <vprintfmt+0x48a>
  800fd8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800fdc:	be 03 00 00 00       	mov    $0x3,%esi
  800fe1:	48 89 c7             	mov    %rax,%rdi
  800fe4:	48 b8 12 0a 80 00 00 	movabs $0x800a12,%rax
  800feb:	00 00 00 
  800fee:	ff d0                	callq  *%rax
  800ff0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ff4:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800ffb:	e9 aa 00 00 00       	jmpq   8010aa <vprintfmt+0x48a>
  801000:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801004:	be 03 00 00 00       	mov    $0x3,%esi
  801009:	48 89 c7             	mov    %rax,%rdi
  80100c:	48 b8 12 0a 80 00 00 	movabs $0x800a12,%rax
  801013:	00 00 00 
  801016:	ff d0                	callq  *%rax
  801018:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80101c:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  801023:	e9 82 00 00 00       	jmpq   8010aa <vprintfmt+0x48a>
  801028:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80102c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801030:	48 89 d6             	mov    %rdx,%rsi
  801033:	bf 30 00 00 00       	mov    $0x30,%edi
  801038:	ff d0                	callq  *%rax
  80103a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80103e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801042:	48 89 d6             	mov    %rdx,%rsi
  801045:	bf 78 00 00 00       	mov    $0x78,%edi
  80104a:	ff d0                	callq  *%rax
  80104c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80104f:	83 f8 30             	cmp    $0x30,%eax
  801052:	73 17                	jae    80106b <vprintfmt+0x44b>
  801054:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801058:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80105b:	89 d2                	mov    %edx,%edx
  80105d:	48 01 d0             	add    %rdx,%rax
  801060:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801063:	83 c2 08             	add    $0x8,%edx
  801066:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801069:	eb 0c                	jmp    801077 <vprintfmt+0x457>
  80106b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80106f:	48 8d 50 08          	lea    0x8(%rax),%rdx
  801073:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801077:	48 8b 00             	mov    (%rax),%rax
  80107a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80107e:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801085:	eb 23                	jmp    8010aa <vprintfmt+0x48a>
  801087:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80108b:	be 03 00 00 00       	mov    $0x3,%esi
  801090:	48 89 c7             	mov    %rax,%rdi
  801093:	48 b8 12 0a 80 00 00 	movabs $0x800a12,%rax
  80109a:	00 00 00 
  80109d:	ff d0                	callq  *%rax
  80109f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8010a3:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  8010aa:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  8010af:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8010b2:	8b 7d dc             	mov    -0x24(%rbp),%edi
  8010b5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8010b9:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8010bd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8010c1:	45 89 c1             	mov    %r8d,%r9d
  8010c4:	41 89 f8             	mov    %edi,%r8d
  8010c7:	48 89 c7             	mov    %rax,%rdi
  8010ca:	48 b8 5a 09 80 00 00 	movabs $0x80095a,%rax
  8010d1:	00 00 00 
  8010d4:	ff d0                	callq  *%rax
  8010d6:	eb 3f                	jmp    801117 <vprintfmt+0x4f7>
  8010d8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8010dc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8010e0:	48 89 d6             	mov    %rdx,%rsi
  8010e3:	89 df                	mov    %ebx,%edi
  8010e5:	ff d0                	callq  *%rax
  8010e7:	eb 2e                	jmp    801117 <vprintfmt+0x4f7>
  8010e9:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8010ed:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8010f1:	48 89 d6             	mov    %rdx,%rsi
  8010f4:	bf 25 00 00 00       	mov    $0x25,%edi
  8010f9:	ff d0                	callq  *%rax
  8010fb:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  801100:	eb 05                	jmp    801107 <vprintfmt+0x4e7>
  801102:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  801107:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80110b:	48 83 e8 01          	sub    $0x1,%rax
  80110f:	0f b6 00             	movzbl (%rax),%eax
  801112:	3c 25                	cmp    $0x25,%al
  801114:	75 ec                	jne    801102 <vprintfmt+0x4e2>
  801116:	90                   	nop
  801117:	e9 3d fb ff ff       	jmpq   800c59 <vprintfmt+0x39>
  80111c:	90                   	nop
  80111d:	48 83 c4 60          	add    $0x60,%rsp
  801121:	5b                   	pop    %rbx
  801122:	41 5c                	pop    %r12
  801124:	5d                   	pop    %rbp
  801125:	c3                   	retq   

0000000000801126 <printfmt>:
  801126:	55                   	push   %rbp
  801127:	48 89 e5             	mov    %rsp,%rbp
  80112a:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  801131:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  801138:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  80113f:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  801146:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80114d:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801154:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80115b:	84 c0                	test   %al,%al
  80115d:	74 20                	je     80117f <printfmt+0x59>
  80115f:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801163:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801167:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80116b:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80116f:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801173:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801177:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80117b:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80117f:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801186:	00 00 00 
  801189:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  801190:	00 00 00 
  801193:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801197:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80119e:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8011a5:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  8011ac:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  8011b3:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8011ba:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  8011c1:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  8011c8:	48 89 c7             	mov    %rax,%rdi
  8011cb:	48 b8 20 0c 80 00 00 	movabs $0x800c20,%rax
  8011d2:	00 00 00 
  8011d5:	ff d0                	callq  *%rax
  8011d7:	90                   	nop
  8011d8:	c9                   	leaveq 
  8011d9:	c3                   	retq   

00000000008011da <sprintputch>:
  8011da:	55                   	push   %rbp
  8011db:	48 89 e5             	mov    %rsp,%rbp
  8011de:	48 83 ec 10          	sub    $0x10,%rsp
  8011e2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8011e5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8011e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011ed:	8b 40 10             	mov    0x10(%rax),%eax
  8011f0:	8d 50 01             	lea    0x1(%rax),%edx
  8011f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011f7:	89 50 10             	mov    %edx,0x10(%rax)
  8011fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011fe:	48 8b 10             	mov    (%rax),%rdx
  801201:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801205:	48 8b 40 08          	mov    0x8(%rax),%rax
  801209:	48 39 c2             	cmp    %rax,%rdx
  80120c:	73 17                	jae    801225 <sprintputch+0x4b>
  80120e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801212:	48 8b 00             	mov    (%rax),%rax
  801215:	48 8d 48 01          	lea    0x1(%rax),%rcx
  801219:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80121d:	48 89 0a             	mov    %rcx,(%rdx)
  801220:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801223:	88 10                	mov    %dl,(%rax)
  801225:	90                   	nop
  801226:	c9                   	leaveq 
  801227:	c3                   	retq   

0000000000801228 <vsnprintf>:
  801228:	55                   	push   %rbp
  801229:	48 89 e5             	mov    %rsp,%rbp
  80122c:	48 83 ec 50          	sub    $0x50,%rsp
  801230:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  801234:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  801237:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  80123b:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  80123f:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  801243:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801247:	48 8b 0a             	mov    (%rdx),%rcx
  80124a:	48 89 08             	mov    %rcx,(%rax)
  80124d:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801251:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801255:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801259:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80125d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801261:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  801265:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801268:	48 98                	cltq   
  80126a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80126e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801272:	48 01 d0             	add    %rdx,%rax
  801275:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801279:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  801280:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  801285:	74 06                	je     80128d <vsnprintf+0x65>
  801287:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  80128b:	7f 07                	jg     801294 <vsnprintf+0x6c>
  80128d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801292:	eb 2f                	jmp    8012c3 <vsnprintf+0x9b>
  801294:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801298:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  80129c:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8012a0:	48 89 c6             	mov    %rax,%rsi
  8012a3:	48 bf da 11 80 00 00 	movabs $0x8011da,%rdi
  8012aa:	00 00 00 
  8012ad:	48 b8 20 0c 80 00 00 	movabs $0x800c20,%rax
  8012b4:	00 00 00 
  8012b7:	ff d0                	callq  *%rax
  8012b9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8012bd:	c6 00 00             	movb   $0x0,(%rax)
  8012c0:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8012c3:	c9                   	leaveq 
  8012c4:	c3                   	retq   

00000000008012c5 <snprintf>:
  8012c5:	55                   	push   %rbp
  8012c6:	48 89 e5             	mov    %rsp,%rbp
  8012c9:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  8012d0:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8012d7:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  8012dd:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  8012e4:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8012eb:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8012f2:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8012f9:	84 c0                	test   %al,%al
  8012fb:	74 20                	je     80131d <snprintf+0x58>
  8012fd:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801301:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801305:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801309:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80130d:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801311:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801315:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801319:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80131d:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  801324:	00 00 00 
  801327:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80132e:	00 00 00 
  801331:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801335:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80133c:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801343:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80134a:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  801351:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801358:	48 8b 0a             	mov    (%rdx),%rcx
  80135b:	48 89 08             	mov    %rcx,(%rax)
  80135e:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801362:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801366:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80136a:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80136e:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  801375:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  80137c:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  801382:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801389:	48 89 c7             	mov    %rax,%rdi
  80138c:	48 b8 28 12 80 00 00 	movabs $0x801228,%rax
  801393:	00 00 00 
  801396:	ff d0                	callq  *%rax
  801398:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80139e:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8013a4:	c9                   	leaveq 
  8013a5:	c3                   	retq   

00000000008013a6 <strlen>:
  8013a6:	55                   	push   %rbp
  8013a7:	48 89 e5             	mov    %rsp,%rbp
  8013aa:	48 83 ec 18          	sub    $0x18,%rsp
  8013ae:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013b2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8013b9:	eb 09                	jmp    8013c4 <strlen+0x1e>
  8013bb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8013bf:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8013c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013c8:	0f b6 00             	movzbl (%rax),%eax
  8013cb:	84 c0                	test   %al,%al
  8013cd:	75 ec                	jne    8013bb <strlen+0x15>
  8013cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8013d2:	c9                   	leaveq 
  8013d3:	c3                   	retq   

00000000008013d4 <strnlen>:
  8013d4:	55                   	push   %rbp
  8013d5:	48 89 e5             	mov    %rsp,%rbp
  8013d8:	48 83 ec 20          	sub    $0x20,%rsp
  8013dc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013e0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013e4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8013eb:	eb 0e                	jmp    8013fb <strnlen+0x27>
  8013ed:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8013f1:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8013f6:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8013fb:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801400:	74 0b                	je     80140d <strnlen+0x39>
  801402:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801406:	0f b6 00             	movzbl (%rax),%eax
  801409:	84 c0                	test   %al,%al
  80140b:	75 e0                	jne    8013ed <strnlen+0x19>
  80140d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801410:	c9                   	leaveq 
  801411:	c3                   	retq   

0000000000801412 <strcpy>:
  801412:	55                   	push   %rbp
  801413:	48 89 e5             	mov    %rsp,%rbp
  801416:	48 83 ec 20          	sub    $0x20,%rsp
  80141a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80141e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801422:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801426:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80142a:	90                   	nop
  80142b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80142f:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801433:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801437:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80143b:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80143f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801443:	0f b6 12             	movzbl (%rdx),%edx
  801446:	88 10                	mov    %dl,(%rax)
  801448:	0f b6 00             	movzbl (%rax),%eax
  80144b:	84 c0                	test   %al,%al
  80144d:	75 dc                	jne    80142b <strcpy+0x19>
  80144f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801453:	c9                   	leaveq 
  801454:	c3                   	retq   

0000000000801455 <strcat>:
  801455:	55                   	push   %rbp
  801456:	48 89 e5             	mov    %rsp,%rbp
  801459:	48 83 ec 20          	sub    $0x20,%rsp
  80145d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801461:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801465:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801469:	48 89 c7             	mov    %rax,%rdi
  80146c:	48 b8 a6 13 80 00 00 	movabs $0x8013a6,%rax
  801473:	00 00 00 
  801476:	ff d0                	callq  *%rax
  801478:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80147b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80147e:	48 63 d0             	movslq %eax,%rdx
  801481:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801485:	48 01 c2             	add    %rax,%rdx
  801488:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80148c:	48 89 c6             	mov    %rax,%rsi
  80148f:	48 89 d7             	mov    %rdx,%rdi
  801492:	48 b8 12 14 80 00 00 	movabs $0x801412,%rax
  801499:	00 00 00 
  80149c:	ff d0                	callq  *%rax
  80149e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014a2:	c9                   	leaveq 
  8014a3:	c3                   	retq   

00000000008014a4 <strncpy>:
  8014a4:	55                   	push   %rbp
  8014a5:	48 89 e5             	mov    %rsp,%rbp
  8014a8:	48 83 ec 28          	sub    $0x28,%rsp
  8014ac:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014b0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014b4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014bc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8014c0:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8014c7:	00 
  8014c8:	eb 2a                	jmp    8014f4 <strncpy+0x50>
  8014ca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014ce:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8014d2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014d6:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8014da:	0f b6 12             	movzbl (%rdx),%edx
  8014dd:	88 10                	mov    %dl,(%rax)
  8014df:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014e3:	0f b6 00             	movzbl (%rax),%eax
  8014e6:	84 c0                	test   %al,%al
  8014e8:	74 05                	je     8014ef <strncpy+0x4b>
  8014ea:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8014ef:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8014f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014f8:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8014fc:	72 cc                	jb     8014ca <strncpy+0x26>
  8014fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801502:	c9                   	leaveq 
  801503:	c3                   	retq   

0000000000801504 <strlcpy>:
  801504:	55                   	push   %rbp
  801505:	48 89 e5             	mov    %rsp,%rbp
  801508:	48 83 ec 28          	sub    $0x28,%rsp
  80150c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801510:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801514:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801518:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80151c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801520:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801525:	74 3d                	je     801564 <strlcpy+0x60>
  801527:	eb 1d                	jmp    801546 <strlcpy+0x42>
  801529:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80152d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801531:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801535:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801539:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80153d:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801541:	0f b6 12             	movzbl (%rdx),%edx
  801544:	88 10                	mov    %dl,(%rax)
  801546:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  80154b:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801550:	74 0b                	je     80155d <strlcpy+0x59>
  801552:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801556:	0f b6 00             	movzbl (%rax),%eax
  801559:	84 c0                	test   %al,%al
  80155b:	75 cc                	jne    801529 <strlcpy+0x25>
  80155d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801561:	c6 00 00             	movb   $0x0,(%rax)
  801564:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801568:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80156c:	48 29 c2             	sub    %rax,%rdx
  80156f:	48 89 d0             	mov    %rdx,%rax
  801572:	c9                   	leaveq 
  801573:	c3                   	retq   

0000000000801574 <strcmp>:
  801574:	55                   	push   %rbp
  801575:	48 89 e5             	mov    %rsp,%rbp
  801578:	48 83 ec 10          	sub    $0x10,%rsp
  80157c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801580:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801584:	eb 0a                	jmp    801590 <strcmp+0x1c>
  801586:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80158b:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801590:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801594:	0f b6 00             	movzbl (%rax),%eax
  801597:	84 c0                	test   %al,%al
  801599:	74 12                	je     8015ad <strcmp+0x39>
  80159b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80159f:	0f b6 10             	movzbl (%rax),%edx
  8015a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015a6:	0f b6 00             	movzbl (%rax),%eax
  8015a9:	38 c2                	cmp    %al,%dl
  8015ab:	74 d9                	je     801586 <strcmp+0x12>
  8015ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015b1:	0f b6 00             	movzbl (%rax),%eax
  8015b4:	0f b6 d0             	movzbl %al,%edx
  8015b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015bb:	0f b6 00             	movzbl (%rax),%eax
  8015be:	0f b6 c0             	movzbl %al,%eax
  8015c1:	29 c2                	sub    %eax,%edx
  8015c3:	89 d0                	mov    %edx,%eax
  8015c5:	c9                   	leaveq 
  8015c6:	c3                   	retq   

00000000008015c7 <strncmp>:
  8015c7:	55                   	push   %rbp
  8015c8:	48 89 e5             	mov    %rsp,%rbp
  8015cb:	48 83 ec 18          	sub    $0x18,%rsp
  8015cf:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015d3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8015d7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8015db:	eb 0f                	jmp    8015ec <strncmp+0x25>
  8015dd:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8015e2:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8015e7:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8015ec:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8015f1:	74 1d                	je     801610 <strncmp+0x49>
  8015f3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015f7:	0f b6 00             	movzbl (%rax),%eax
  8015fa:	84 c0                	test   %al,%al
  8015fc:	74 12                	je     801610 <strncmp+0x49>
  8015fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801602:	0f b6 10             	movzbl (%rax),%edx
  801605:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801609:	0f b6 00             	movzbl (%rax),%eax
  80160c:	38 c2                	cmp    %al,%dl
  80160e:	74 cd                	je     8015dd <strncmp+0x16>
  801610:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801615:	75 07                	jne    80161e <strncmp+0x57>
  801617:	b8 00 00 00 00       	mov    $0x0,%eax
  80161c:	eb 18                	jmp    801636 <strncmp+0x6f>
  80161e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801622:	0f b6 00             	movzbl (%rax),%eax
  801625:	0f b6 d0             	movzbl %al,%edx
  801628:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80162c:	0f b6 00             	movzbl (%rax),%eax
  80162f:	0f b6 c0             	movzbl %al,%eax
  801632:	29 c2                	sub    %eax,%edx
  801634:	89 d0                	mov    %edx,%eax
  801636:	c9                   	leaveq 
  801637:	c3                   	retq   

0000000000801638 <strchr>:
  801638:	55                   	push   %rbp
  801639:	48 89 e5             	mov    %rsp,%rbp
  80163c:	48 83 ec 10          	sub    $0x10,%rsp
  801640:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801644:	89 f0                	mov    %esi,%eax
  801646:	88 45 f4             	mov    %al,-0xc(%rbp)
  801649:	eb 17                	jmp    801662 <strchr+0x2a>
  80164b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80164f:	0f b6 00             	movzbl (%rax),%eax
  801652:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801655:	75 06                	jne    80165d <strchr+0x25>
  801657:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80165b:	eb 15                	jmp    801672 <strchr+0x3a>
  80165d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801662:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801666:	0f b6 00             	movzbl (%rax),%eax
  801669:	84 c0                	test   %al,%al
  80166b:	75 de                	jne    80164b <strchr+0x13>
  80166d:	b8 00 00 00 00       	mov    $0x0,%eax
  801672:	c9                   	leaveq 
  801673:	c3                   	retq   

0000000000801674 <strfind>:
  801674:	55                   	push   %rbp
  801675:	48 89 e5             	mov    %rsp,%rbp
  801678:	48 83 ec 10          	sub    $0x10,%rsp
  80167c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801680:	89 f0                	mov    %esi,%eax
  801682:	88 45 f4             	mov    %al,-0xc(%rbp)
  801685:	eb 11                	jmp    801698 <strfind+0x24>
  801687:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80168b:	0f b6 00             	movzbl (%rax),%eax
  80168e:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801691:	74 12                	je     8016a5 <strfind+0x31>
  801693:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801698:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80169c:	0f b6 00             	movzbl (%rax),%eax
  80169f:	84 c0                	test   %al,%al
  8016a1:	75 e4                	jne    801687 <strfind+0x13>
  8016a3:	eb 01                	jmp    8016a6 <strfind+0x32>
  8016a5:	90                   	nop
  8016a6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016aa:	c9                   	leaveq 
  8016ab:	c3                   	retq   

00000000008016ac <memset>:
  8016ac:	55                   	push   %rbp
  8016ad:	48 89 e5             	mov    %rsp,%rbp
  8016b0:	48 83 ec 18          	sub    $0x18,%rsp
  8016b4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8016b8:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8016bb:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8016bf:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8016c4:	75 06                	jne    8016cc <memset+0x20>
  8016c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016ca:	eb 69                	jmp    801735 <memset+0x89>
  8016cc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016d0:	83 e0 03             	and    $0x3,%eax
  8016d3:	48 85 c0             	test   %rax,%rax
  8016d6:	75 48                	jne    801720 <memset+0x74>
  8016d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016dc:	83 e0 03             	and    $0x3,%eax
  8016df:	48 85 c0             	test   %rax,%rax
  8016e2:	75 3c                	jne    801720 <memset+0x74>
  8016e4:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8016eb:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8016ee:	c1 e0 18             	shl    $0x18,%eax
  8016f1:	89 c2                	mov    %eax,%edx
  8016f3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8016f6:	c1 e0 10             	shl    $0x10,%eax
  8016f9:	09 c2                	or     %eax,%edx
  8016fb:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8016fe:	c1 e0 08             	shl    $0x8,%eax
  801701:	09 d0                	or     %edx,%eax
  801703:	09 45 f4             	or     %eax,-0xc(%rbp)
  801706:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80170a:	48 c1 e8 02          	shr    $0x2,%rax
  80170e:	48 89 c1             	mov    %rax,%rcx
  801711:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801715:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801718:	48 89 d7             	mov    %rdx,%rdi
  80171b:	fc                   	cld    
  80171c:	f3 ab                	rep stos %eax,%es:(%rdi)
  80171e:	eb 11                	jmp    801731 <memset+0x85>
  801720:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801724:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801727:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80172b:	48 89 d7             	mov    %rdx,%rdi
  80172e:	fc                   	cld    
  80172f:	f3 aa                	rep stos %al,%es:(%rdi)
  801731:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801735:	c9                   	leaveq 
  801736:	c3                   	retq   

0000000000801737 <memmove>:
  801737:	55                   	push   %rbp
  801738:	48 89 e5             	mov    %rsp,%rbp
  80173b:	48 83 ec 28          	sub    $0x28,%rsp
  80173f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801743:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801747:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80174b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80174f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801753:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801757:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80175b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80175f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801763:	0f 83 88 00 00 00    	jae    8017f1 <memmove+0xba>
  801769:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80176d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801771:	48 01 d0             	add    %rdx,%rax
  801774:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801778:	76 77                	jbe    8017f1 <memmove+0xba>
  80177a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80177e:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801782:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801786:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  80178a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80178e:	83 e0 03             	and    $0x3,%eax
  801791:	48 85 c0             	test   %rax,%rax
  801794:	75 3b                	jne    8017d1 <memmove+0x9a>
  801796:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80179a:	83 e0 03             	and    $0x3,%eax
  80179d:	48 85 c0             	test   %rax,%rax
  8017a0:	75 2f                	jne    8017d1 <memmove+0x9a>
  8017a2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a6:	83 e0 03             	and    $0x3,%eax
  8017a9:	48 85 c0             	test   %rax,%rax
  8017ac:	75 23                	jne    8017d1 <memmove+0x9a>
  8017ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017b2:	48 83 e8 04          	sub    $0x4,%rax
  8017b6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8017ba:	48 83 ea 04          	sub    $0x4,%rdx
  8017be:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8017c2:	48 c1 e9 02          	shr    $0x2,%rcx
  8017c6:	48 89 c7             	mov    %rax,%rdi
  8017c9:	48 89 d6             	mov    %rdx,%rsi
  8017cc:	fd                   	std    
  8017cd:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8017cf:	eb 1d                	jmp    8017ee <memmove+0xb7>
  8017d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017d5:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8017d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017dd:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8017e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017e5:	48 89 d7             	mov    %rdx,%rdi
  8017e8:	48 89 c1             	mov    %rax,%rcx
  8017eb:	fd                   	std    
  8017ec:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8017ee:	fc                   	cld    
  8017ef:	eb 57                	jmp    801848 <memmove+0x111>
  8017f1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017f5:	83 e0 03             	and    $0x3,%eax
  8017f8:	48 85 c0             	test   %rax,%rax
  8017fb:	75 36                	jne    801833 <memmove+0xfc>
  8017fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801801:	83 e0 03             	and    $0x3,%eax
  801804:	48 85 c0             	test   %rax,%rax
  801807:	75 2a                	jne    801833 <memmove+0xfc>
  801809:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80180d:	83 e0 03             	and    $0x3,%eax
  801810:	48 85 c0             	test   %rax,%rax
  801813:	75 1e                	jne    801833 <memmove+0xfc>
  801815:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801819:	48 c1 e8 02          	shr    $0x2,%rax
  80181d:	48 89 c1             	mov    %rax,%rcx
  801820:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801824:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801828:	48 89 c7             	mov    %rax,%rdi
  80182b:	48 89 d6             	mov    %rdx,%rsi
  80182e:	fc                   	cld    
  80182f:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801831:	eb 15                	jmp    801848 <memmove+0x111>
  801833:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801837:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80183b:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80183f:	48 89 c7             	mov    %rax,%rdi
  801842:	48 89 d6             	mov    %rdx,%rsi
  801845:	fc                   	cld    
  801846:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801848:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80184c:	c9                   	leaveq 
  80184d:	c3                   	retq   

000000000080184e <memcpy>:
  80184e:	55                   	push   %rbp
  80184f:	48 89 e5             	mov    %rsp,%rbp
  801852:	48 83 ec 18          	sub    $0x18,%rsp
  801856:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80185a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80185e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801862:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801866:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80186a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80186e:	48 89 ce             	mov    %rcx,%rsi
  801871:	48 89 c7             	mov    %rax,%rdi
  801874:	48 b8 37 17 80 00 00 	movabs $0x801737,%rax
  80187b:	00 00 00 
  80187e:	ff d0                	callq  *%rax
  801880:	c9                   	leaveq 
  801881:	c3                   	retq   

0000000000801882 <memcmp>:
  801882:	55                   	push   %rbp
  801883:	48 89 e5             	mov    %rsp,%rbp
  801886:	48 83 ec 28          	sub    $0x28,%rsp
  80188a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80188e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801892:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801896:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80189a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80189e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8018a2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8018a6:	eb 36                	jmp    8018de <memcmp+0x5c>
  8018a8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018ac:	0f b6 10             	movzbl (%rax),%edx
  8018af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018b3:	0f b6 00             	movzbl (%rax),%eax
  8018b6:	38 c2                	cmp    %al,%dl
  8018b8:	74 1a                	je     8018d4 <memcmp+0x52>
  8018ba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018be:	0f b6 00             	movzbl (%rax),%eax
  8018c1:	0f b6 d0             	movzbl %al,%edx
  8018c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018c8:	0f b6 00             	movzbl (%rax),%eax
  8018cb:	0f b6 c0             	movzbl %al,%eax
  8018ce:	29 c2                	sub    %eax,%edx
  8018d0:	89 d0                	mov    %edx,%eax
  8018d2:	eb 20                	jmp    8018f4 <memcmp+0x72>
  8018d4:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8018d9:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8018de:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018e2:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8018e6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8018ea:	48 85 c0             	test   %rax,%rax
  8018ed:	75 b9                	jne    8018a8 <memcmp+0x26>
  8018ef:	b8 00 00 00 00       	mov    $0x0,%eax
  8018f4:	c9                   	leaveq 
  8018f5:	c3                   	retq   

00000000008018f6 <memfind>:
  8018f6:	55                   	push   %rbp
  8018f7:	48 89 e5             	mov    %rsp,%rbp
  8018fa:	48 83 ec 28          	sub    $0x28,%rsp
  8018fe:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801902:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801905:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801909:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80190d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801911:	48 01 d0             	add    %rdx,%rax
  801914:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801918:	eb 13                	jmp    80192d <memfind+0x37>
  80191a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80191e:	0f b6 00             	movzbl (%rax),%eax
  801921:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801924:	38 d0                	cmp    %dl,%al
  801926:	74 11                	je     801939 <memfind+0x43>
  801928:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80192d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801931:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801935:	72 e3                	jb     80191a <memfind+0x24>
  801937:	eb 01                	jmp    80193a <memfind+0x44>
  801939:	90                   	nop
  80193a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80193e:	c9                   	leaveq 
  80193f:	c3                   	retq   

0000000000801940 <strtol>:
  801940:	55                   	push   %rbp
  801941:	48 89 e5             	mov    %rsp,%rbp
  801944:	48 83 ec 38          	sub    $0x38,%rsp
  801948:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80194c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801950:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801953:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80195a:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801961:	00 
  801962:	eb 05                	jmp    801969 <strtol+0x29>
  801964:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801969:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80196d:	0f b6 00             	movzbl (%rax),%eax
  801970:	3c 20                	cmp    $0x20,%al
  801972:	74 f0                	je     801964 <strtol+0x24>
  801974:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801978:	0f b6 00             	movzbl (%rax),%eax
  80197b:	3c 09                	cmp    $0x9,%al
  80197d:	74 e5                	je     801964 <strtol+0x24>
  80197f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801983:	0f b6 00             	movzbl (%rax),%eax
  801986:	3c 2b                	cmp    $0x2b,%al
  801988:	75 07                	jne    801991 <strtol+0x51>
  80198a:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80198f:	eb 17                	jmp    8019a8 <strtol+0x68>
  801991:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801995:	0f b6 00             	movzbl (%rax),%eax
  801998:	3c 2d                	cmp    $0x2d,%al
  80199a:	75 0c                	jne    8019a8 <strtol+0x68>
  80199c:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8019a1:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8019a8:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8019ac:	74 06                	je     8019b4 <strtol+0x74>
  8019ae:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8019b2:	75 28                	jne    8019dc <strtol+0x9c>
  8019b4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019b8:	0f b6 00             	movzbl (%rax),%eax
  8019bb:	3c 30                	cmp    $0x30,%al
  8019bd:	75 1d                	jne    8019dc <strtol+0x9c>
  8019bf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019c3:	48 83 c0 01          	add    $0x1,%rax
  8019c7:	0f b6 00             	movzbl (%rax),%eax
  8019ca:	3c 78                	cmp    $0x78,%al
  8019cc:	75 0e                	jne    8019dc <strtol+0x9c>
  8019ce:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8019d3:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8019da:	eb 2c                	jmp    801a08 <strtol+0xc8>
  8019dc:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8019e0:	75 19                	jne    8019fb <strtol+0xbb>
  8019e2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019e6:	0f b6 00             	movzbl (%rax),%eax
  8019e9:	3c 30                	cmp    $0x30,%al
  8019eb:	75 0e                	jne    8019fb <strtol+0xbb>
  8019ed:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8019f2:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8019f9:	eb 0d                	jmp    801a08 <strtol+0xc8>
  8019fb:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8019ff:	75 07                	jne    801a08 <strtol+0xc8>
  801a01:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801a08:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a0c:	0f b6 00             	movzbl (%rax),%eax
  801a0f:	3c 2f                	cmp    $0x2f,%al
  801a11:	7e 1d                	jle    801a30 <strtol+0xf0>
  801a13:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a17:	0f b6 00             	movzbl (%rax),%eax
  801a1a:	3c 39                	cmp    $0x39,%al
  801a1c:	7f 12                	jg     801a30 <strtol+0xf0>
  801a1e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a22:	0f b6 00             	movzbl (%rax),%eax
  801a25:	0f be c0             	movsbl %al,%eax
  801a28:	83 e8 30             	sub    $0x30,%eax
  801a2b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801a2e:	eb 4e                	jmp    801a7e <strtol+0x13e>
  801a30:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a34:	0f b6 00             	movzbl (%rax),%eax
  801a37:	3c 60                	cmp    $0x60,%al
  801a39:	7e 1d                	jle    801a58 <strtol+0x118>
  801a3b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a3f:	0f b6 00             	movzbl (%rax),%eax
  801a42:	3c 7a                	cmp    $0x7a,%al
  801a44:	7f 12                	jg     801a58 <strtol+0x118>
  801a46:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a4a:	0f b6 00             	movzbl (%rax),%eax
  801a4d:	0f be c0             	movsbl %al,%eax
  801a50:	83 e8 57             	sub    $0x57,%eax
  801a53:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801a56:	eb 26                	jmp    801a7e <strtol+0x13e>
  801a58:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a5c:	0f b6 00             	movzbl (%rax),%eax
  801a5f:	3c 40                	cmp    $0x40,%al
  801a61:	7e 47                	jle    801aaa <strtol+0x16a>
  801a63:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a67:	0f b6 00             	movzbl (%rax),%eax
  801a6a:	3c 5a                	cmp    $0x5a,%al
  801a6c:	7f 3c                	jg     801aaa <strtol+0x16a>
  801a6e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a72:	0f b6 00             	movzbl (%rax),%eax
  801a75:	0f be c0             	movsbl %al,%eax
  801a78:	83 e8 37             	sub    $0x37,%eax
  801a7b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801a7e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801a81:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801a84:	7d 23                	jge    801aa9 <strtol+0x169>
  801a86:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801a8b:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801a8e:	48 98                	cltq   
  801a90:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801a95:	48 89 c2             	mov    %rax,%rdx
  801a98:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801a9b:	48 98                	cltq   
  801a9d:	48 01 d0             	add    %rdx,%rax
  801aa0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801aa4:	e9 5f ff ff ff       	jmpq   801a08 <strtol+0xc8>
  801aa9:	90                   	nop
  801aaa:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801aaf:	74 0b                	je     801abc <strtol+0x17c>
  801ab1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801ab5:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801ab9:	48 89 10             	mov    %rdx,(%rax)
  801abc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801ac0:	74 09                	je     801acb <strtol+0x18b>
  801ac2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ac6:	48 f7 d8             	neg    %rax
  801ac9:	eb 04                	jmp    801acf <strtol+0x18f>
  801acb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801acf:	c9                   	leaveq 
  801ad0:	c3                   	retq   

0000000000801ad1 <strstr>:
  801ad1:	55                   	push   %rbp
  801ad2:	48 89 e5             	mov    %rsp,%rbp
  801ad5:	48 83 ec 30          	sub    $0x30,%rsp
  801ad9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801add:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801ae1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801ae5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801ae9:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801aed:	0f b6 00             	movzbl (%rax),%eax
  801af0:	88 45 ff             	mov    %al,-0x1(%rbp)
  801af3:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801af7:	75 06                	jne    801aff <strstr+0x2e>
  801af9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801afd:	eb 6b                	jmp    801b6a <strstr+0x99>
  801aff:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801b03:	48 89 c7             	mov    %rax,%rdi
  801b06:	48 b8 a6 13 80 00 00 	movabs $0x8013a6,%rax
  801b0d:	00 00 00 
  801b10:	ff d0                	callq  *%rax
  801b12:	48 98                	cltq   
  801b14:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801b18:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b1c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801b20:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801b24:	0f b6 00             	movzbl (%rax),%eax
  801b27:	88 45 ef             	mov    %al,-0x11(%rbp)
  801b2a:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801b2e:	75 07                	jne    801b37 <strstr+0x66>
  801b30:	b8 00 00 00 00       	mov    $0x0,%eax
  801b35:	eb 33                	jmp    801b6a <strstr+0x99>
  801b37:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801b3b:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801b3e:	75 d8                	jne    801b18 <strstr+0x47>
  801b40:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b44:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801b48:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b4c:	48 89 ce             	mov    %rcx,%rsi
  801b4f:	48 89 c7             	mov    %rax,%rdi
  801b52:	48 b8 c7 15 80 00 00 	movabs $0x8015c7,%rax
  801b59:	00 00 00 
  801b5c:	ff d0                	callq  *%rax
  801b5e:	85 c0                	test   %eax,%eax
  801b60:	75 b6                	jne    801b18 <strstr+0x47>
  801b62:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b66:	48 83 e8 01          	sub    $0x1,%rax
  801b6a:	c9                   	leaveq 
  801b6b:	c3                   	retq   

0000000000801b6c <syscall>:
  801b6c:	55                   	push   %rbp
  801b6d:	48 89 e5             	mov    %rsp,%rbp
  801b70:	53                   	push   %rbx
  801b71:	48 83 ec 48          	sub    $0x48,%rsp
  801b75:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801b78:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801b7b:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801b7f:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801b83:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801b87:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801b8b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801b8e:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801b92:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801b96:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801b9a:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801b9e:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801ba2:	4c 89 c3             	mov    %r8,%rbx
  801ba5:	cd 30                	int    $0x30
  801ba7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801bab:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801baf:	74 3e                	je     801bef <syscall+0x83>
  801bb1:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801bb6:	7e 37                	jle    801bef <syscall+0x83>
  801bb8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801bbc:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801bbf:	49 89 d0             	mov    %rdx,%r8
  801bc2:	89 c1                	mov    %eax,%ecx
  801bc4:	48 ba a8 52 80 00 00 	movabs $0x8052a8,%rdx
  801bcb:	00 00 00 
  801bce:	be 24 00 00 00       	mov    $0x24,%esi
  801bd3:	48 bf c5 52 80 00 00 	movabs $0x8052c5,%rdi
  801bda:	00 00 00 
  801bdd:	b8 00 00 00 00       	mov    $0x0,%eax
  801be2:	49 b9 48 06 80 00 00 	movabs $0x800648,%r9
  801be9:	00 00 00 
  801bec:	41 ff d1             	callq  *%r9
  801bef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801bf3:	48 83 c4 48          	add    $0x48,%rsp
  801bf7:	5b                   	pop    %rbx
  801bf8:	5d                   	pop    %rbp
  801bf9:	c3                   	retq   

0000000000801bfa <sys_cputs>:
  801bfa:	55                   	push   %rbp
  801bfb:	48 89 e5             	mov    %rsp,%rbp
  801bfe:	48 83 ec 10          	sub    $0x10,%rsp
  801c02:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c06:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c0a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c0e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c12:	48 83 ec 08          	sub    $0x8,%rsp
  801c16:	6a 00                	pushq  $0x0
  801c18:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c1e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c24:	48 89 d1             	mov    %rdx,%rcx
  801c27:	48 89 c2             	mov    %rax,%rdx
  801c2a:	be 00 00 00 00       	mov    $0x0,%esi
  801c2f:	bf 00 00 00 00       	mov    $0x0,%edi
  801c34:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  801c3b:	00 00 00 
  801c3e:	ff d0                	callq  *%rax
  801c40:	48 83 c4 10          	add    $0x10,%rsp
  801c44:	90                   	nop
  801c45:	c9                   	leaveq 
  801c46:	c3                   	retq   

0000000000801c47 <sys_cgetc>:
  801c47:	55                   	push   %rbp
  801c48:	48 89 e5             	mov    %rsp,%rbp
  801c4b:	48 83 ec 08          	sub    $0x8,%rsp
  801c4f:	6a 00                	pushq  $0x0
  801c51:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c57:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c5d:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c62:	ba 00 00 00 00       	mov    $0x0,%edx
  801c67:	be 00 00 00 00       	mov    $0x0,%esi
  801c6c:	bf 01 00 00 00       	mov    $0x1,%edi
  801c71:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  801c78:	00 00 00 
  801c7b:	ff d0                	callq  *%rax
  801c7d:	48 83 c4 10          	add    $0x10,%rsp
  801c81:	c9                   	leaveq 
  801c82:	c3                   	retq   

0000000000801c83 <sys_env_destroy>:
  801c83:	55                   	push   %rbp
  801c84:	48 89 e5             	mov    %rsp,%rbp
  801c87:	48 83 ec 10          	sub    $0x10,%rsp
  801c8b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c8e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c91:	48 98                	cltq   
  801c93:	48 83 ec 08          	sub    $0x8,%rsp
  801c97:	6a 00                	pushq  $0x0
  801c99:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c9f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ca5:	b9 00 00 00 00       	mov    $0x0,%ecx
  801caa:	48 89 c2             	mov    %rax,%rdx
  801cad:	be 01 00 00 00       	mov    $0x1,%esi
  801cb2:	bf 03 00 00 00       	mov    $0x3,%edi
  801cb7:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  801cbe:	00 00 00 
  801cc1:	ff d0                	callq  *%rax
  801cc3:	48 83 c4 10          	add    $0x10,%rsp
  801cc7:	c9                   	leaveq 
  801cc8:	c3                   	retq   

0000000000801cc9 <sys_getenvid>:
  801cc9:	55                   	push   %rbp
  801cca:	48 89 e5             	mov    %rsp,%rbp
  801ccd:	48 83 ec 08          	sub    $0x8,%rsp
  801cd1:	6a 00                	pushq  $0x0
  801cd3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cd9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cdf:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ce4:	ba 00 00 00 00       	mov    $0x0,%edx
  801ce9:	be 00 00 00 00       	mov    $0x0,%esi
  801cee:	bf 02 00 00 00       	mov    $0x2,%edi
  801cf3:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  801cfa:	00 00 00 
  801cfd:	ff d0                	callq  *%rax
  801cff:	48 83 c4 10          	add    $0x10,%rsp
  801d03:	c9                   	leaveq 
  801d04:	c3                   	retq   

0000000000801d05 <sys_yield>:
  801d05:	55                   	push   %rbp
  801d06:	48 89 e5             	mov    %rsp,%rbp
  801d09:	48 83 ec 08          	sub    $0x8,%rsp
  801d0d:	6a 00                	pushq  $0x0
  801d0f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d15:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d1b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d20:	ba 00 00 00 00       	mov    $0x0,%edx
  801d25:	be 00 00 00 00       	mov    $0x0,%esi
  801d2a:	bf 0b 00 00 00       	mov    $0xb,%edi
  801d2f:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  801d36:	00 00 00 
  801d39:	ff d0                	callq  *%rax
  801d3b:	48 83 c4 10          	add    $0x10,%rsp
  801d3f:	90                   	nop
  801d40:	c9                   	leaveq 
  801d41:	c3                   	retq   

0000000000801d42 <sys_page_alloc>:
  801d42:	55                   	push   %rbp
  801d43:	48 89 e5             	mov    %rsp,%rbp
  801d46:	48 83 ec 10          	sub    $0x10,%rsp
  801d4a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d4d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d51:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d54:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d57:	48 63 c8             	movslq %eax,%rcx
  801d5a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d5e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d61:	48 98                	cltq   
  801d63:	48 83 ec 08          	sub    $0x8,%rsp
  801d67:	6a 00                	pushq  $0x0
  801d69:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d6f:	49 89 c8             	mov    %rcx,%r8
  801d72:	48 89 d1             	mov    %rdx,%rcx
  801d75:	48 89 c2             	mov    %rax,%rdx
  801d78:	be 01 00 00 00       	mov    $0x1,%esi
  801d7d:	bf 04 00 00 00       	mov    $0x4,%edi
  801d82:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  801d89:	00 00 00 
  801d8c:	ff d0                	callq  *%rax
  801d8e:	48 83 c4 10          	add    $0x10,%rsp
  801d92:	c9                   	leaveq 
  801d93:	c3                   	retq   

0000000000801d94 <sys_page_map>:
  801d94:	55                   	push   %rbp
  801d95:	48 89 e5             	mov    %rsp,%rbp
  801d98:	48 83 ec 20          	sub    $0x20,%rsp
  801d9c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d9f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801da3:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801da6:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801daa:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801dae:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801db1:	48 63 c8             	movslq %eax,%rcx
  801db4:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801db8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801dbb:	48 63 f0             	movslq %eax,%rsi
  801dbe:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801dc2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801dc5:	48 98                	cltq   
  801dc7:	48 83 ec 08          	sub    $0x8,%rsp
  801dcb:	51                   	push   %rcx
  801dcc:	49 89 f9             	mov    %rdi,%r9
  801dcf:	49 89 f0             	mov    %rsi,%r8
  801dd2:	48 89 d1             	mov    %rdx,%rcx
  801dd5:	48 89 c2             	mov    %rax,%rdx
  801dd8:	be 01 00 00 00       	mov    $0x1,%esi
  801ddd:	bf 05 00 00 00       	mov    $0x5,%edi
  801de2:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  801de9:	00 00 00 
  801dec:	ff d0                	callq  *%rax
  801dee:	48 83 c4 10          	add    $0x10,%rsp
  801df2:	c9                   	leaveq 
  801df3:	c3                   	retq   

0000000000801df4 <sys_page_unmap>:
  801df4:	55                   	push   %rbp
  801df5:	48 89 e5             	mov    %rsp,%rbp
  801df8:	48 83 ec 10          	sub    $0x10,%rsp
  801dfc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801dff:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e03:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e07:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e0a:	48 98                	cltq   
  801e0c:	48 83 ec 08          	sub    $0x8,%rsp
  801e10:	6a 00                	pushq  $0x0
  801e12:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e18:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e1e:	48 89 d1             	mov    %rdx,%rcx
  801e21:	48 89 c2             	mov    %rax,%rdx
  801e24:	be 01 00 00 00       	mov    $0x1,%esi
  801e29:	bf 06 00 00 00       	mov    $0x6,%edi
  801e2e:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  801e35:	00 00 00 
  801e38:	ff d0                	callq  *%rax
  801e3a:	48 83 c4 10          	add    $0x10,%rsp
  801e3e:	c9                   	leaveq 
  801e3f:	c3                   	retq   

0000000000801e40 <sys_env_set_status>:
  801e40:	55                   	push   %rbp
  801e41:	48 89 e5             	mov    %rsp,%rbp
  801e44:	48 83 ec 10          	sub    $0x10,%rsp
  801e48:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e4b:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801e4e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e51:	48 63 d0             	movslq %eax,%rdx
  801e54:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e57:	48 98                	cltq   
  801e59:	48 83 ec 08          	sub    $0x8,%rsp
  801e5d:	6a 00                	pushq  $0x0
  801e5f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e65:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e6b:	48 89 d1             	mov    %rdx,%rcx
  801e6e:	48 89 c2             	mov    %rax,%rdx
  801e71:	be 01 00 00 00       	mov    $0x1,%esi
  801e76:	bf 08 00 00 00       	mov    $0x8,%edi
  801e7b:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  801e82:	00 00 00 
  801e85:	ff d0                	callq  *%rax
  801e87:	48 83 c4 10          	add    $0x10,%rsp
  801e8b:	c9                   	leaveq 
  801e8c:	c3                   	retq   

0000000000801e8d <sys_env_set_trapframe>:
  801e8d:	55                   	push   %rbp
  801e8e:	48 89 e5             	mov    %rsp,%rbp
  801e91:	48 83 ec 10          	sub    $0x10,%rsp
  801e95:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e98:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e9c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ea0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ea3:	48 98                	cltq   
  801ea5:	48 83 ec 08          	sub    $0x8,%rsp
  801ea9:	6a 00                	pushq  $0x0
  801eab:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801eb1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801eb7:	48 89 d1             	mov    %rdx,%rcx
  801eba:	48 89 c2             	mov    %rax,%rdx
  801ebd:	be 01 00 00 00       	mov    $0x1,%esi
  801ec2:	bf 09 00 00 00       	mov    $0x9,%edi
  801ec7:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  801ece:	00 00 00 
  801ed1:	ff d0                	callq  *%rax
  801ed3:	48 83 c4 10          	add    $0x10,%rsp
  801ed7:	c9                   	leaveq 
  801ed8:	c3                   	retq   

0000000000801ed9 <sys_env_set_pgfault_upcall>:
  801ed9:	55                   	push   %rbp
  801eda:	48 89 e5             	mov    %rsp,%rbp
  801edd:	48 83 ec 10          	sub    $0x10,%rsp
  801ee1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ee4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ee8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801eec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801eef:	48 98                	cltq   
  801ef1:	48 83 ec 08          	sub    $0x8,%rsp
  801ef5:	6a 00                	pushq  $0x0
  801ef7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801efd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f03:	48 89 d1             	mov    %rdx,%rcx
  801f06:	48 89 c2             	mov    %rax,%rdx
  801f09:	be 01 00 00 00       	mov    $0x1,%esi
  801f0e:	bf 0a 00 00 00       	mov    $0xa,%edi
  801f13:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  801f1a:	00 00 00 
  801f1d:	ff d0                	callq  *%rax
  801f1f:	48 83 c4 10          	add    $0x10,%rsp
  801f23:	c9                   	leaveq 
  801f24:	c3                   	retq   

0000000000801f25 <sys_ipc_try_send>:
  801f25:	55                   	push   %rbp
  801f26:	48 89 e5             	mov    %rsp,%rbp
  801f29:	48 83 ec 20          	sub    $0x20,%rsp
  801f2d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f30:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f34:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801f38:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801f3b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f3e:	48 63 f0             	movslq %eax,%rsi
  801f41:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801f45:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f48:	48 98                	cltq   
  801f4a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f4e:	48 83 ec 08          	sub    $0x8,%rsp
  801f52:	6a 00                	pushq  $0x0
  801f54:	49 89 f1             	mov    %rsi,%r9
  801f57:	49 89 c8             	mov    %rcx,%r8
  801f5a:	48 89 d1             	mov    %rdx,%rcx
  801f5d:	48 89 c2             	mov    %rax,%rdx
  801f60:	be 00 00 00 00       	mov    $0x0,%esi
  801f65:	bf 0c 00 00 00       	mov    $0xc,%edi
  801f6a:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  801f71:	00 00 00 
  801f74:	ff d0                	callq  *%rax
  801f76:	48 83 c4 10          	add    $0x10,%rsp
  801f7a:	c9                   	leaveq 
  801f7b:	c3                   	retq   

0000000000801f7c <sys_ipc_recv>:
  801f7c:	55                   	push   %rbp
  801f7d:	48 89 e5             	mov    %rsp,%rbp
  801f80:	48 83 ec 10          	sub    $0x10,%rsp
  801f84:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f88:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f8c:	48 83 ec 08          	sub    $0x8,%rsp
  801f90:	6a 00                	pushq  $0x0
  801f92:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f98:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f9e:	b9 00 00 00 00       	mov    $0x0,%ecx
  801fa3:	48 89 c2             	mov    %rax,%rdx
  801fa6:	be 01 00 00 00       	mov    $0x1,%esi
  801fab:	bf 0d 00 00 00       	mov    $0xd,%edi
  801fb0:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  801fb7:	00 00 00 
  801fba:	ff d0                	callq  *%rax
  801fbc:	48 83 c4 10          	add    $0x10,%rsp
  801fc0:	c9                   	leaveq 
  801fc1:	c3                   	retq   

0000000000801fc2 <sys_time_msec>:
  801fc2:	55                   	push   %rbp
  801fc3:	48 89 e5             	mov    %rsp,%rbp
  801fc6:	48 83 ec 08          	sub    $0x8,%rsp
  801fca:	6a 00                	pushq  $0x0
  801fcc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fd2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fd8:	b9 00 00 00 00       	mov    $0x0,%ecx
  801fdd:	ba 00 00 00 00       	mov    $0x0,%edx
  801fe2:	be 00 00 00 00       	mov    $0x0,%esi
  801fe7:	bf 0e 00 00 00       	mov    $0xe,%edi
  801fec:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  801ff3:	00 00 00 
  801ff6:	ff d0                	callq  *%rax
  801ff8:	48 83 c4 10          	add    $0x10,%rsp
  801ffc:	c9                   	leaveq 
  801ffd:	c3                   	retq   

0000000000801ffe <sys_net_transmit>:
  801ffe:	55                   	push   %rbp
  801fff:	48 89 e5             	mov    %rsp,%rbp
  802002:	48 83 ec 10          	sub    $0x10,%rsp
  802006:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80200a:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80200d:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802010:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802014:	48 83 ec 08          	sub    $0x8,%rsp
  802018:	6a 00                	pushq  $0x0
  80201a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802020:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802026:	48 89 d1             	mov    %rdx,%rcx
  802029:	48 89 c2             	mov    %rax,%rdx
  80202c:	be 00 00 00 00       	mov    $0x0,%esi
  802031:	bf 0f 00 00 00       	mov    $0xf,%edi
  802036:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  80203d:	00 00 00 
  802040:	ff d0                	callq  *%rax
  802042:	48 83 c4 10          	add    $0x10,%rsp
  802046:	c9                   	leaveq 
  802047:	c3                   	retq   

0000000000802048 <sys_net_receive>:
  802048:	55                   	push   %rbp
  802049:	48 89 e5             	mov    %rsp,%rbp
  80204c:	48 83 ec 10          	sub    $0x10,%rsp
  802050:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802054:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802057:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80205a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80205e:	48 83 ec 08          	sub    $0x8,%rsp
  802062:	6a 00                	pushq  $0x0
  802064:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80206a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802070:	48 89 d1             	mov    %rdx,%rcx
  802073:	48 89 c2             	mov    %rax,%rdx
  802076:	be 00 00 00 00       	mov    $0x0,%esi
  80207b:	bf 10 00 00 00       	mov    $0x10,%edi
  802080:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  802087:	00 00 00 
  80208a:	ff d0                	callq  *%rax
  80208c:	48 83 c4 10          	add    $0x10,%rsp
  802090:	c9                   	leaveq 
  802091:	c3                   	retq   

0000000000802092 <sys_ept_map>:
  802092:	55                   	push   %rbp
  802093:	48 89 e5             	mov    %rsp,%rbp
  802096:	48 83 ec 20          	sub    $0x20,%rsp
  80209a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80209d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8020a1:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8020a4:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8020a8:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8020ac:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8020af:	48 63 c8             	movslq %eax,%rcx
  8020b2:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8020b6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020b9:	48 63 f0             	movslq %eax,%rsi
  8020bc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8020c0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020c3:	48 98                	cltq   
  8020c5:	48 83 ec 08          	sub    $0x8,%rsp
  8020c9:	51                   	push   %rcx
  8020ca:	49 89 f9             	mov    %rdi,%r9
  8020cd:	49 89 f0             	mov    %rsi,%r8
  8020d0:	48 89 d1             	mov    %rdx,%rcx
  8020d3:	48 89 c2             	mov    %rax,%rdx
  8020d6:	be 00 00 00 00       	mov    $0x0,%esi
  8020db:	bf 11 00 00 00       	mov    $0x11,%edi
  8020e0:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  8020e7:	00 00 00 
  8020ea:	ff d0                	callq  *%rax
  8020ec:	48 83 c4 10          	add    $0x10,%rsp
  8020f0:	c9                   	leaveq 
  8020f1:	c3                   	retq   

00000000008020f2 <sys_env_mkguest>:
  8020f2:	55                   	push   %rbp
  8020f3:	48 89 e5             	mov    %rsp,%rbp
  8020f6:	48 83 ec 10          	sub    $0x10,%rsp
  8020fa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8020fe:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802102:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802106:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80210a:	48 83 ec 08          	sub    $0x8,%rsp
  80210e:	6a 00                	pushq  $0x0
  802110:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802116:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80211c:	48 89 d1             	mov    %rdx,%rcx
  80211f:	48 89 c2             	mov    %rax,%rdx
  802122:	be 00 00 00 00       	mov    $0x0,%esi
  802127:	bf 12 00 00 00       	mov    $0x12,%edi
  80212c:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  802133:	00 00 00 
  802136:	ff d0                	callq  *%rax
  802138:	48 83 c4 10          	add    $0x10,%rsp
  80213c:	c9                   	leaveq 
  80213d:	c3                   	retq   

000000000080213e <pgfault>:
  80213e:	55                   	push   %rbp
  80213f:	48 89 e5             	mov    %rsp,%rbp
  802142:	48 83 ec 30          	sub    $0x30,%rsp
  802146:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80214a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80214e:	48 8b 00             	mov    (%rax),%rax
  802151:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802155:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802159:	48 8b 40 08          	mov    0x8(%rax),%rax
  80215d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802160:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802163:	83 e0 02             	and    $0x2,%eax
  802166:	85 c0                	test   %eax,%eax
  802168:	75 40                	jne    8021aa <pgfault+0x6c>
  80216a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80216e:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  802175:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802179:	49 89 d0             	mov    %rdx,%r8
  80217c:	48 89 c1             	mov    %rax,%rcx
  80217f:	48 ba d8 52 80 00 00 	movabs $0x8052d8,%rdx
  802186:	00 00 00 
  802189:	be 1f 00 00 00       	mov    $0x1f,%esi
  80218e:	48 bf f1 52 80 00 00 	movabs $0x8052f1,%rdi
  802195:	00 00 00 
  802198:	b8 00 00 00 00       	mov    $0x0,%eax
  80219d:	49 b9 48 06 80 00 00 	movabs $0x800648,%r9
  8021a4:	00 00 00 
  8021a7:	41 ff d1             	callq  *%r9
  8021aa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8021ae:	48 c1 e8 0c          	shr    $0xc,%rax
  8021b2:	48 89 c2             	mov    %rax,%rdx
  8021b5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8021bc:	01 00 00 
  8021bf:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021c3:	25 07 08 00 00       	and    $0x807,%eax
  8021c8:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  8021ce:	74 4e                	je     80221e <pgfault+0xe0>
  8021d0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8021d4:	48 c1 e8 0c          	shr    $0xc,%rax
  8021d8:	48 89 c2             	mov    %rax,%rdx
  8021db:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8021e2:	01 00 00 
  8021e5:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8021e9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8021ed:	49 89 d0             	mov    %rdx,%r8
  8021f0:	48 89 c1             	mov    %rax,%rcx
  8021f3:	48 ba 00 53 80 00 00 	movabs $0x805300,%rdx
  8021fa:	00 00 00 
  8021fd:	be 22 00 00 00       	mov    $0x22,%esi
  802202:	48 bf f1 52 80 00 00 	movabs $0x8052f1,%rdi
  802209:	00 00 00 
  80220c:	b8 00 00 00 00       	mov    $0x0,%eax
  802211:	49 b9 48 06 80 00 00 	movabs $0x800648,%r9
  802218:	00 00 00 
  80221b:	41 ff d1             	callq  *%r9
  80221e:	ba 07 00 00 00       	mov    $0x7,%edx
  802223:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802228:	bf 00 00 00 00       	mov    $0x0,%edi
  80222d:	48 b8 42 1d 80 00 00 	movabs $0x801d42,%rax
  802234:	00 00 00 
  802237:	ff d0                	callq  *%rax
  802239:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80223c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802240:	79 30                	jns    802272 <pgfault+0x134>
  802242:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802245:	89 c1                	mov    %eax,%ecx
  802247:	48 ba 2b 53 80 00 00 	movabs $0x80532b,%rdx
  80224e:	00 00 00 
  802251:	be 30 00 00 00       	mov    $0x30,%esi
  802256:	48 bf f1 52 80 00 00 	movabs $0x8052f1,%rdi
  80225d:	00 00 00 
  802260:	b8 00 00 00 00       	mov    $0x0,%eax
  802265:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  80226c:	00 00 00 
  80226f:	41 ff d0             	callq  *%r8
  802272:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802276:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80227a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80227e:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802284:	ba 00 10 00 00       	mov    $0x1000,%edx
  802289:	48 89 c6             	mov    %rax,%rsi
  80228c:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  802291:	48 b8 37 17 80 00 00 	movabs $0x801737,%rax
  802298:	00 00 00 
  80229b:	ff d0                	callq  *%rax
  80229d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8022a1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8022a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022a9:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8022af:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  8022b5:	48 89 c1             	mov    %rax,%rcx
  8022b8:	ba 00 00 00 00       	mov    $0x0,%edx
  8022bd:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8022c2:	bf 00 00 00 00       	mov    $0x0,%edi
  8022c7:	48 b8 94 1d 80 00 00 	movabs $0x801d94,%rax
  8022ce:	00 00 00 
  8022d1:	ff d0                	callq  *%rax
  8022d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8022d6:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8022da:	79 30                	jns    80230c <pgfault+0x1ce>
  8022dc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8022df:	89 c1                	mov    %eax,%ecx
  8022e1:	48 ba 3e 53 80 00 00 	movabs $0x80533e,%rdx
  8022e8:	00 00 00 
  8022eb:	be 35 00 00 00       	mov    $0x35,%esi
  8022f0:	48 bf f1 52 80 00 00 	movabs $0x8052f1,%rdi
  8022f7:	00 00 00 
  8022fa:	b8 00 00 00 00       	mov    $0x0,%eax
  8022ff:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  802306:	00 00 00 
  802309:	41 ff d0             	callq  *%r8
  80230c:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802311:	bf 00 00 00 00       	mov    $0x0,%edi
  802316:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  80231d:	00 00 00 
  802320:	ff d0                	callq  *%rax
  802322:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802325:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802329:	79 30                	jns    80235b <pgfault+0x21d>
  80232b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80232e:	89 c1                	mov    %eax,%ecx
  802330:	48 ba 4f 53 80 00 00 	movabs $0x80534f,%rdx
  802337:	00 00 00 
  80233a:	be 39 00 00 00       	mov    $0x39,%esi
  80233f:	48 bf f1 52 80 00 00 	movabs $0x8052f1,%rdi
  802346:	00 00 00 
  802349:	b8 00 00 00 00       	mov    $0x0,%eax
  80234e:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  802355:	00 00 00 
  802358:	41 ff d0             	callq  *%r8
  80235b:	90                   	nop
  80235c:	c9                   	leaveq 
  80235d:	c3                   	retq   

000000000080235e <duppage>:
  80235e:	55                   	push   %rbp
  80235f:	48 89 e5             	mov    %rsp,%rbp
  802362:	48 83 ec 30          	sub    $0x30,%rsp
  802366:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802369:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80236c:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80236f:	c1 e0 0c             	shl    $0xc,%eax
  802372:	89 c0                	mov    %eax,%eax
  802374:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802378:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80237f:	01 00 00 
  802382:	8b 55 d8             	mov    -0x28(%rbp),%edx
  802385:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802389:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80238d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802391:	25 02 08 00 00       	and    $0x802,%eax
  802396:	48 85 c0             	test   %rax,%rax
  802399:	74 0e                	je     8023a9 <duppage+0x4b>
  80239b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80239f:	25 00 04 00 00       	and    $0x400,%eax
  8023a4:	48 85 c0             	test   %rax,%rax
  8023a7:	74 70                	je     802419 <duppage+0xbb>
  8023a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023ad:	25 07 0e 00 00       	and    $0xe07,%eax
  8023b2:	89 c6                	mov    %eax,%esi
  8023b4:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8023b8:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8023bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023bf:	41 89 f0             	mov    %esi,%r8d
  8023c2:	48 89 c6             	mov    %rax,%rsi
  8023c5:	bf 00 00 00 00       	mov    $0x0,%edi
  8023ca:	48 b8 94 1d 80 00 00 	movabs $0x801d94,%rax
  8023d1:	00 00 00 
  8023d4:	ff d0                	callq  *%rax
  8023d6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8023d9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8023dd:	79 30                	jns    80240f <duppage+0xb1>
  8023df:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8023e2:	89 c1                	mov    %eax,%ecx
  8023e4:	48 ba 3e 53 80 00 00 	movabs $0x80533e,%rdx
  8023eb:	00 00 00 
  8023ee:	be 63 00 00 00       	mov    $0x63,%esi
  8023f3:	48 bf f1 52 80 00 00 	movabs $0x8052f1,%rdi
  8023fa:	00 00 00 
  8023fd:	b8 00 00 00 00       	mov    $0x0,%eax
  802402:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  802409:	00 00 00 
  80240c:	41 ff d0             	callq  *%r8
  80240f:	b8 00 00 00 00       	mov    $0x0,%eax
  802414:	e9 c4 00 00 00       	jmpq   8024dd <duppage+0x17f>
  802419:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  80241d:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802420:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802424:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  80242a:	48 89 c6             	mov    %rax,%rsi
  80242d:	bf 00 00 00 00       	mov    $0x0,%edi
  802432:	48 b8 94 1d 80 00 00 	movabs $0x801d94,%rax
  802439:	00 00 00 
  80243c:	ff d0                	callq  *%rax
  80243e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802441:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802445:	79 30                	jns    802477 <duppage+0x119>
  802447:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80244a:	89 c1                	mov    %eax,%ecx
  80244c:	48 ba 3e 53 80 00 00 	movabs $0x80533e,%rdx
  802453:	00 00 00 
  802456:	be 7e 00 00 00       	mov    $0x7e,%esi
  80245b:	48 bf f1 52 80 00 00 	movabs $0x8052f1,%rdi
  802462:	00 00 00 
  802465:	b8 00 00 00 00       	mov    $0x0,%eax
  80246a:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  802471:	00 00 00 
  802474:	41 ff d0             	callq  *%r8
  802477:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80247b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80247f:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802485:	48 89 d1             	mov    %rdx,%rcx
  802488:	ba 00 00 00 00       	mov    $0x0,%edx
  80248d:	48 89 c6             	mov    %rax,%rsi
  802490:	bf 00 00 00 00       	mov    $0x0,%edi
  802495:	48 b8 94 1d 80 00 00 	movabs $0x801d94,%rax
  80249c:	00 00 00 
  80249f:	ff d0                	callq  *%rax
  8024a1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8024a4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8024a8:	79 30                	jns    8024da <duppage+0x17c>
  8024aa:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8024ad:	89 c1                	mov    %eax,%ecx
  8024af:	48 ba 3e 53 80 00 00 	movabs $0x80533e,%rdx
  8024b6:	00 00 00 
  8024b9:	be 80 00 00 00       	mov    $0x80,%esi
  8024be:	48 bf f1 52 80 00 00 	movabs $0x8052f1,%rdi
  8024c5:	00 00 00 
  8024c8:	b8 00 00 00 00       	mov    $0x0,%eax
  8024cd:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  8024d4:	00 00 00 
  8024d7:	41 ff d0             	callq  *%r8
  8024da:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8024dd:	c9                   	leaveq 
  8024de:	c3                   	retq   

00000000008024df <fork>:
  8024df:	55                   	push   %rbp
  8024e0:	48 89 e5             	mov    %rsp,%rbp
  8024e3:	48 83 ec 20          	sub    $0x20,%rsp
  8024e7:	48 bf 3e 21 80 00 00 	movabs $0x80213e,%rdi
  8024ee:	00 00 00 
  8024f1:	48 b8 40 4a 80 00 00 	movabs $0x804a40,%rax
  8024f8:	00 00 00 
  8024fb:	ff d0                	callq  *%rax
  8024fd:	b8 07 00 00 00       	mov    $0x7,%eax
  802502:	cd 30                	int    $0x30
  802504:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802507:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80250a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80250d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802511:	79 08                	jns    80251b <fork+0x3c>
  802513:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802516:	e9 0b 02 00 00       	jmpq   802726 <fork+0x247>
  80251b:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80251f:	75 3e                	jne    80255f <fork+0x80>
  802521:	48 b8 c9 1c 80 00 00 	movabs $0x801cc9,%rax
  802528:	00 00 00 
  80252b:	ff d0                	callq  *%rax
  80252d:	25 ff 03 00 00       	and    $0x3ff,%eax
  802532:	48 98                	cltq   
  802534:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80253b:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802542:	00 00 00 
  802545:	48 01 c2             	add    %rax,%rdx
  802548:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  80254f:	00 00 00 
  802552:	48 89 10             	mov    %rdx,(%rax)
  802555:	b8 00 00 00 00       	mov    $0x0,%eax
  80255a:	e9 c7 01 00 00       	jmpq   802726 <fork+0x247>
  80255f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802566:	e9 a6 00 00 00       	jmpq   802611 <fork+0x132>
  80256b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80256e:	c1 f8 12             	sar    $0x12,%eax
  802571:	89 c2                	mov    %eax,%edx
  802573:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  80257a:	01 00 00 
  80257d:	48 63 d2             	movslq %edx,%rdx
  802580:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802584:	83 e0 01             	and    $0x1,%eax
  802587:	48 85 c0             	test   %rax,%rax
  80258a:	74 21                	je     8025ad <fork+0xce>
  80258c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80258f:	c1 f8 09             	sar    $0x9,%eax
  802592:	89 c2                	mov    %eax,%edx
  802594:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80259b:	01 00 00 
  80259e:	48 63 d2             	movslq %edx,%rdx
  8025a1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8025a5:	83 e0 01             	and    $0x1,%eax
  8025a8:	48 85 c0             	test   %rax,%rax
  8025ab:	75 09                	jne    8025b6 <fork+0xd7>
  8025ad:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  8025b4:	eb 5b                	jmp    802611 <fork+0x132>
  8025b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025b9:	05 00 02 00 00       	add    $0x200,%eax
  8025be:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8025c1:	eb 46                	jmp    802609 <fork+0x12a>
  8025c3:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8025ca:	01 00 00 
  8025cd:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8025d0:	48 63 d2             	movslq %edx,%rdx
  8025d3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8025d7:	83 e0 05             	and    $0x5,%eax
  8025da:	48 83 f8 05          	cmp    $0x5,%rax
  8025de:	75 21                	jne    802601 <fork+0x122>
  8025e0:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  8025e7:	74 1b                	je     802604 <fork+0x125>
  8025e9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8025ec:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8025ef:	89 d6                	mov    %edx,%esi
  8025f1:	89 c7                	mov    %eax,%edi
  8025f3:	48 b8 5e 23 80 00 00 	movabs $0x80235e,%rax
  8025fa:	00 00 00 
  8025fd:	ff d0                	callq  *%rax
  8025ff:	eb 04                	jmp    802605 <fork+0x126>
  802601:	90                   	nop
  802602:	eb 01                	jmp    802605 <fork+0x126>
  802604:	90                   	nop
  802605:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802609:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80260c:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  80260f:	7c b2                	jl     8025c3 <fork+0xe4>
  802611:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802614:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  802619:	0f 86 4c ff ff ff    	jbe    80256b <fork+0x8c>
  80261f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802622:	ba 07 00 00 00       	mov    $0x7,%edx
  802627:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  80262c:	89 c7                	mov    %eax,%edi
  80262e:	48 b8 42 1d 80 00 00 	movabs $0x801d42,%rax
  802635:	00 00 00 
  802638:	ff d0                	callq  *%rax
  80263a:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80263d:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802641:	79 30                	jns    802673 <fork+0x194>
  802643:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802646:	89 c1                	mov    %eax,%ecx
  802648:	48 ba 68 53 80 00 00 	movabs $0x805368,%rdx
  80264f:	00 00 00 
  802652:	be bc 00 00 00       	mov    $0xbc,%esi
  802657:	48 bf f1 52 80 00 00 	movabs $0x8052f1,%rdi
  80265e:	00 00 00 
  802661:	b8 00 00 00 00       	mov    $0x0,%eax
  802666:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  80266d:	00 00 00 
  802670:	41 ff d0             	callq  *%r8
  802673:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  80267a:	00 00 00 
  80267d:	48 8b 00             	mov    (%rax),%rax
  802680:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  802687:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80268a:	48 89 d6             	mov    %rdx,%rsi
  80268d:	89 c7                	mov    %eax,%edi
  80268f:	48 b8 d9 1e 80 00 00 	movabs $0x801ed9,%rax
  802696:	00 00 00 
  802699:	ff d0                	callq  *%rax
  80269b:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80269e:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8026a2:	79 30                	jns    8026d4 <fork+0x1f5>
  8026a4:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8026a7:	89 c1                	mov    %eax,%ecx
  8026a9:	48 ba 88 53 80 00 00 	movabs $0x805388,%rdx
  8026b0:	00 00 00 
  8026b3:	be c0 00 00 00       	mov    $0xc0,%esi
  8026b8:	48 bf f1 52 80 00 00 	movabs $0x8052f1,%rdi
  8026bf:	00 00 00 
  8026c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8026c7:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  8026ce:	00 00 00 
  8026d1:	41 ff d0             	callq  *%r8
  8026d4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8026d7:	be 02 00 00 00       	mov    $0x2,%esi
  8026dc:	89 c7                	mov    %eax,%edi
  8026de:	48 b8 40 1e 80 00 00 	movabs $0x801e40,%rax
  8026e5:	00 00 00 
  8026e8:	ff d0                	callq  *%rax
  8026ea:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8026ed:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8026f1:	79 30                	jns    802723 <fork+0x244>
  8026f3:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8026f6:	89 c1                	mov    %eax,%ecx
  8026f8:	48 ba a7 53 80 00 00 	movabs $0x8053a7,%rdx
  8026ff:	00 00 00 
  802702:	be c5 00 00 00       	mov    $0xc5,%esi
  802707:	48 bf f1 52 80 00 00 	movabs $0x8052f1,%rdi
  80270e:	00 00 00 
  802711:	b8 00 00 00 00       	mov    $0x0,%eax
  802716:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  80271d:	00 00 00 
  802720:	41 ff d0             	callq  *%r8
  802723:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802726:	c9                   	leaveq 
  802727:	c3                   	retq   

0000000000802728 <sfork>:
  802728:	55                   	push   %rbp
  802729:	48 89 e5             	mov    %rsp,%rbp
  80272c:	48 ba be 53 80 00 00 	movabs $0x8053be,%rdx
  802733:	00 00 00 
  802736:	be d2 00 00 00       	mov    $0xd2,%esi
  80273b:	48 bf f1 52 80 00 00 	movabs $0x8052f1,%rdi
  802742:	00 00 00 
  802745:	b8 00 00 00 00       	mov    $0x0,%eax
  80274a:	48 b9 48 06 80 00 00 	movabs $0x800648,%rcx
  802751:	00 00 00 
  802754:	ff d1                	callq  *%rcx

0000000000802756 <ipc_recv>:
  802756:	55                   	push   %rbp
  802757:	48 89 e5             	mov    %rsp,%rbp
  80275a:	48 83 ec 30          	sub    $0x30,%rsp
  80275e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802762:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802766:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80276a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80276f:	75 0e                	jne    80277f <ipc_recv+0x29>
  802771:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802778:	00 00 00 
  80277b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80277f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802783:	48 89 c7             	mov    %rax,%rdi
  802786:	48 b8 7c 1f 80 00 00 	movabs $0x801f7c,%rax
  80278d:	00 00 00 
  802790:	ff d0                	callq  *%rax
  802792:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802795:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802799:	79 27                	jns    8027c2 <ipc_recv+0x6c>
  80279b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8027a0:	74 0a                	je     8027ac <ipc_recv+0x56>
  8027a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027a6:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8027ac:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8027b1:	74 0a                	je     8027bd <ipc_recv+0x67>
  8027b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027b7:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8027bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027c0:	eb 53                	jmp    802815 <ipc_recv+0xbf>
  8027c2:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8027c7:	74 19                	je     8027e2 <ipc_recv+0x8c>
  8027c9:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8027d0:	00 00 00 
  8027d3:	48 8b 00             	mov    (%rax),%rax
  8027d6:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8027dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027e0:	89 10                	mov    %edx,(%rax)
  8027e2:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8027e7:	74 19                	je     802802 <ipc_recv+0xac>
  8027e9:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8027f0:	00 00 00 
  8027f3:	48 8b 00             	mov    (%rax),%rax
  8027f6:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8027fc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802800:	89 10                	mov    %edx,(%rax)
  802802:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  802809:	00 00 00 
  80280c:	48 8b 00             	mov    (%rax),%rax
  80280f:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  802815:	c9                   	leaveq 
  802816:	c3                   	retq   

0000000000802817 <ipc_send>:
  802817:	55                   	push   %rbp
  802818:	48 89 e5             	mov    %rsp,%rbp
  80281b:	48 83 ec 30          	sub    $0x30,%rsp
  80281f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802822:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802825:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  802829:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80282c:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  802831:	75 1c                	jne    80284f <ipc_send+0x38>
  802833:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80283a:	00 00 00 
  80283d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802841:	eb 0c                	jmp    80284f <ipc_send+0x38>
  802843:	48 b8 05 1d 80 00 00 	movabs $0x801d05,%rax
  80284a:	00 00 00 
  80284d:	ff d0                	callq  *%rax
  80284f:	8b 75 e8             	mov    -0x18(%rbp),%esi
  802852:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  802855:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802859:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80285c:	89 c7                	mov    %eax,%edi
  80285e:	48 b8 25 1f 80 00 00 	movabs $0x801f25,%rax
  802865:	00 00 00 
  802868:	ff d0                	callq  *%rax
  80286a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80286d:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  802871:	74 d0                	je     802843 <ipc_send+0x2c>
  802873:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802877:	79 30                	jns    8028a9 <ipc_send+0x92>
  802879:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80287c:	89 c1                	mov    %eax,%ecx
  80287e:	48 ba d8 53 80 00 00 	movabs $0x8053d8,%rdx
  802885:	00 00 00 
  802888:	be 44 00 00 00       	mov    $0x44,%esi
  80288d:	48 bf ee 53 80 00 00 	movabs $0x8053ee,%rdi
  802894:	00 00 00 
  802897:	b8 00 00 00 00       	mov    $0x0,%eax
  80289c:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  8028a3:	00 00 00 
  8028a6:	41 ff d0             	callq  *%r8
  8028a9:	90                   	nop
  8028aa:	c9                   	leaveq 
  8028ab:	c3                   	retq   

00000000008028ac <ipc_host_recv>:
  8028ac:	55                   	push   %rbp
  8028ad:	48 89 e5             	mov    %rsp,%rbp
  8028b0:	48 83 ec 10          	sub    $0x10,%rsp
  8028b4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8028b8:	48 ba 00 54 80 00 00 	movabs $0x805400,%rdx
  8028bf:	00 00 00 
  8028c2:	be 4e 00 00 00       	mov    $0x4e,%esi
  8028c7:	48 bf ee 53 80 00 00 	movabs $0x8053ee,%rdi
  8028ce:	00 00 00 
  8028d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8028d6:	48 b9 48 06 80 00 00 	movabs $0x800648,%rcx
  8028dd:	00 00 00 
  8028e0:	ff d1                	callq  *%rcx

00000000008028e2 <ipc_host_send>:
  8028e2:	55                   	push   %rbp
  8028e3:	48 89 e5             	mov    %rsp,%rbp
  8028e6:	48 83 ec 20          	sub    $0x20,%rsp
  8028ea:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8028ed:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8028f0:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  8028f4:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8028f7:	48 ba 20 54 80 00 00 	movabs $0x805420,%rdx
  8028fe:	00 00 00 
  802901:	be 58 00 00 00       	mov    $0x58,%esi
  802906:	48 bf ee 53 80 00 00 	movabs $0x8053ee,%rdi
  80290d:	00 00 00 
  802910:	b8 00 00 00 00       	mov    $0x0,%eax
  802915:	48 b9 48 06 80 00 00 	movabs $0x800648,%rcx
  80291c:	00 00 00 
  80291f:	ff d1                	callq  *%rcx

0000000000802921 <ipc_find_env>:
  802921:	55                   	push   %rbp
  802922:	48 89 e5             	mov    %rsp,%rbp
  802925:	48 83 ec 18          	sub    $0x18,%rsp
  802929:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80292c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802933:	eb 4d                	jmp    802982 <ipc_find_env+0x61>
  802935:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80293c:	00 00 00 
  80293f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802942:	48 98                	cltq   
  802944:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80294b:	48 01 d0             	add    %rdx,%rax
  80294e:	48 05 d0 00 00 00    	add    $0xd0,%rax
  802954:	8b 00                	mov    (%rax),%eax
  802956:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802959:	75 23                	jne    80297e <ipc_find_env+0x5d>
  80295b:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802962:	00 00 00 
  802965:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802968:	48 98                	cltq   
  80296a:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802971:	48 01 d0             	add    %rdx,%rax
  802974:	48 05 c8 00 00 00    	add    $0xc8,%rax
  80297a:	8b 00                	mov    (%rax),%eax
  80297c:	eb 12                	jmp    802990 <ipc_find_env+0x6f>
  80297e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802982:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  802989:	7e aa                	jle    802935 <ipc_find_env+0x14>
  80298b:	b8 00 00 00 00       	mov    $0x0,%eax
  802990:	c9                   	leaveq 
  802991:	c3                   	retq   

0000000000802992 <fd2num>:
  802992:	55                   	push   %rbp
  802993:	48 89 e5             	mov    %rsp,%rbp
  802996:	48 83 ec 08          	sub    $0x8,%rsp
  80299a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80299e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8029a2:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  8029a9:	ff ff ff 
  8029ac:	48 01 d0             	add    %rdx,%rax
  8029af:	48 c1 e8 0c          	shr    $0xc,%rax
  8029b3:	c9                   	leaveq 
  8029b4:	c3                   	retq   

00000000008029b5 <fd2data>:
  8029b5:	55                   	push   %rbp
  8029b6:	48 89 e5             	mov    %rsp,%rbp
  8029b9:	48 83 ec 08          	sub    $0x8,%rsp
  8029bd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8029c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8029c5:	48 89 c7             	mov    %rax,%rdi
  8029c8:	48 b8 92 29 80 00 00 	movabs $0x802992,%rax
  8029cf:	00 00 00 
  8029d2:	ff d0                	callq  *%rax
  8029d4:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  8029da:	48 c1 e0 0c          	shl    $0xc,%rax
  8029de:	c9                   	leaveq 
  8029df:	c3                   	retq   

00000000008029e0 <fd_alloc>:
  8029e0:	55                   	push   %rbp
  8029e1:	48 89 e5             	mov    %rsp,%rbp
  8029e4:	48 83 ec 18          	sub    $0x18,%rsp
  8029e8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8029ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8029f3:	eb 6b                	jmp    802a60 <fd_alloc+0x80>
  8029f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029f8:	48 98                	cltq   
  8029fa:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802a00:	48 c1 e0 0c          	shl    $0xc,%rax
  802a04:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802a08:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a0c:	48 c1 e8 15          	shr    $0x15,%rax
  802a10:	48 89 c2             	mov    %rax,%rdx
  802a13:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802a1a:	01 00 00 
  802a1d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a21:	83 e0 01             	and    $0x1,%eax
  802a24:	48 85 c0             	test   %rax,%rax
  802a27:	74 21                	je     802a4a <fd_alloc+0x6a>
  802a29:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a2d:	48 c1 e8 0c          	shr    $0xc,%rax
  802a31:	48 89 c2             	mov    %rax,%rdx
  802a34:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a3b:	01 00 00 
  802a3e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a42:	83 e0 01             	and    $0x1,%eax
  802a45:	48 85 c0             	test   %rax,%rax
  802a48:	75 12                	jne    802a5c <fd_alloc+0x7c>
  802a4a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a4e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802a52:	48 89 10             	mov    %rdx,(%rax)
  802a55:	b8 00 00 00 00       	mov    $0x0,%eax
  802a5a:	eb 1a                	jmp    802a76 <fd_alloc+0x96>
  802a5c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802a60:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802a64:	7e 8f                	jle    8029f5 <fd_alloc+0x15>
  802a66:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a6a:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802a71:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802a76:	c9                   	leaveq 
  802a77:	c3                   	retq   

0000000000802a78 <fd_lookup>:
  802a78:	55                   	push   %rbp
  802a79:	48 89 e5             	mov    %rsp,%rbp
  802a7c:	48 83 ec 20          	sub    $0x20,%rsp
  802a80:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802a83:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802a87:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802a8b:	78 06                	js     802a93 <fd_lookup+0x1b>
  802a8d:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802a91:	7e 07                	jle    802a9a <fd_lookup+0x22>
  802a93:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802a98:	eb 6c                	jmp    802b06 <fd_lookup+0x8e>
  802a9a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a9d:	48 98                	cltq   
  802a9f:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802aa5:	48 c1 e0 0c          	shl    $0xc,%rax
  802aa9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802aad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ab1:	48 c1 e8 15          	shr    $0x15,%rax
  802ab5:	48 89 c2             	mov    %rax,%rdx
  802ab8:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802abf:	01 00 00 
  802ac2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ac6:	83 e0 01             	and    $0x1,%eax
  802ac9:	48 85 c0             	test   %rax,%rax
  802acc:	74 21                	je     802aef <fd_lookup+0x77>
  802ace:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ad2:	48 c1 e8 0c          	shr    $0xc,%rax
  802ad6:	48 89 c2             	mov    %rax,%rdx
  802ad9:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802ae0:	01 00 00 
  802ae3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802ae7:	83 e0 01             	and    $0x1,%eax
  802aea:	48 85 c0             	test   %rax,%rax
  802aed:	75 07                	jne    802af6 <fd_lookup+0x7e>
  802aef:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802af4:	eb 10                	jmp    802b06 <fd_lookup+0x8e>
  802af6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802afa:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802afe:	48 89 10             	mov    %rdx,(%rax)
  802b01:	b8 00 00 00 00       	mov    $0x0,%eax
  802b06:	c9                   	leaveq 
  802b07:	c3                   	retq   

0000000000802b08 <fd_close>:
  802b08:	55                   	push   %rbp
  802b09:	48 89 e5             	mov    %rsp,%rbp
  802b0c:	48 83 ec 30          	sub    $0x30,%rsp
  802b10:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802b14:	89 f0                	mov    %esi,%eax
  802b16:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802b19:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b1d:	48 89 c7             	mov    %rax,%rdi
  802b20:	48 b8 92 29 80 00 00 	movabs $0x802992,%rax
  802b27:	00 00 00 
  802b2a:	ff d0                	callq  *%rax
  802b2c:	89 c2                	mov    %eax,%edx
  802b2e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802b32:	48 89 c6             	mov    %rax,%rsi
  802b35:	89 d7                	mov    %edx,%edi
  802b37:	48 b8 78 2a 80 00 00 	movabs $0x802a78,%rax
  802b3e:	00 00 00 
  802b41:	ff d0                	callq  *%rax
  802b43:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b46:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b4a:	78 0a                	js     802b56 <fd_close+0x4e>
  802b4c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b50:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802b54:	74 12                	je     802b68 <fd_close+0x60>
  802b56:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802b5a:	74 05                	je     802b61 <fd_close+0x59>
  802b5c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b5f:	eb 70                	jmp    802bd1 <fd_close+0xc9>
  802b61:	b8 00 00 00 00       	mov    $0x0,%eax
  802b66:	eb 69                	jmp    802bd1 <fd_close+0xc9>
  802b68:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b6c:	8b 00                	mov    (%rax),%eax
  802b6e:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802b72:	48 89 d6             	mov    %rdx,%rsi
  802b75:	89 c7                	mov    %eax,%edi
  802b77:	48 b8 d3 2b 80 00 00 	movabs $0x802bd3,%rax
  802b7e:	00 00 00 
  802b81:	ff d0                	callq  *%rax
  802b83:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b86:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b8a:	78 2a                	js     802bb6 <fd_close+0xae>
  802b8c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b90:	48 8b 40 20          	mov    0x20(%rax),%rax
  802b94:	48 85 c0             	test   %rax,%rax
  802b97:	74 16                	je     802baf <fd_close+0xa7>
  802b99:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b9d:	48 8b 40 20          	mov    0x20(%rax),%rax
  802ba1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802ba5:	48 89 d7             	mov    %rdx,%rdi
  802ba8:	ff d0                	callq  *%rax
  802baa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bad:	eb 07                	jmp    802bb6 <fd_close+0xae>
  802baf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802bb6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802bba:	48 89 c6             	mov    %rax,%rsi
  802bbd:	bf 00 00 00 00       	mov    $0x0,%edi
  802bc2:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  802bc9:	00 00 00 
  802bcc:	ff d0                	callq  *%rax
  802bce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bd1:	c9                   	leaveq 
  802bd2:	c3                   	retq   

0000000000802bd3 <dev_lookup>:
  802bd3:	55                   	push   %rbp
  802bd4:	48 89 e5             	mov    %rsp,%rbp
  802bd7:	48 83 ec 20          	sub    $0x20,%rsp
  802bdb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802bde:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802be2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802be9:	eb 41                	jmp    802c2c <dev_lookup+0x59>
  802beb:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802bf2:	00 00 00 
  802bf5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802bf8:	48 63 d2             	movslq %edx,%rdx
  802bfb:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802bff:	8b 00                	mov    (%rax),%eax
  802c01:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802c04:	75 22                	jne    802c28 <dev_lookup+0x55>
  802c06:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802c0d:	00 00 00 
  802c10:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802c13:	48 63 d2             	movslq %edx,%rdx
  802c16:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802c1a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c1e:	48 89 10             	mov    %rdx,(%rax)
  802c21:	b8 00 00 00 00       	mov    $0x0,%eax
  802c26:	eb 60                	jmp    802c88 <dev_lookup+0xb5>
  802c28:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802c2c:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802c33:	00 00 00 
  802c36:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802c39:	48 63 d2             	movslq %edx,%rdx
  802c3c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802c40:	48 85 c0             	test   %rax,%rax
  802c43:	75 a6                	jne    802beb <dev_lookup+0x18>
  802c45:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  802c4c:	00 00 00 
  802c4f:	48 8b 00             	mov    (%rax),%rax
  802c52:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802c58:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802c5b:	89 c6                	mov    %eax,%esi
  802c5d:	48 bf 40 54 80 00 00 	movabs $0x805440,%rdi
  802c64:	00 00 00 
  802c67:	b8 00 00 00 00       	mov    $0x0,%eax
  802c6c:	48 b9 82 08 80 00 00 	movabs $0x800882,%rcx
  802c73:	00 00 00 
  802c76:	ff d1                	callq  *%rcx
  802c78:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c7c:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802c83:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802c88:	c9                   	leaveq 
  802c89:	c3                   	retq   

0000000000802c8a <close>:
  802c8a:	55                   	push   %rbp
  802c8b:	48 89 e5             	mov    %rsp,%rbp
  802c8e:	48 83 ec 20          	sub    $0x20,%rsp
  802c92:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802c95:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c99:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802c9c:	48 89 d6             	mov    %rdx,%rsi
  802c9f:	89 c7                	mov    %eax,%edi
  802ca1:	48 b8 78 2a 80 00 00 	movabs $0x802a78,%rax
  802ca8:	00 00 00 
  802cab:	ff d0                	callq  *%rax
  802cad:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cb0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cb4:	79 05                	jns    802cbb <close+0x31>
  802cb6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cb9:	eb 18                	jmp    802cd3 <close+0x49>
  802cbb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cbf:	be 01 00 00 00       	mov    $0x1,%esi
  802cc4:	48 89 c7             	mov    %rax,%rdi
  802cc7:	48 b8 08 2b 80 00 00 	movabs $0x802b08,%rax
  802cce:	00 00 00 
  802cd1:	ff d0                	callq  *%rax
  802cd3:	c9                   	leaveq 
  802cd4:	c3                   	retq   

0000000000802cd5 <close_all>:
  802cd5:	55                   	push   %rbp
  802cd6:	48 89 e5             	mov    %rsp,%rbp
  802cd9:	48 83 ec 10          	sub    $0x10,%rsp
  802cdd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802ce4:	eb 15                	jmp    802cfb <close_all+0x26>
  802ce6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ce9:	89 c7                	mov    %eax,%edi
  802ceb:	48 b8 8a 2c 80 00 00 	movabs $0x802c8a,%rax
  802cf2:	00 00 00 
  802cf5:	ff d0                	callq  *%rax
  802cf7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802cfb:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802cff:	7e e5                	jle    802ce6 <close_all+0x11>
  802d01:	90                   	nop
  802d02:	c9                   	leaveq 
  802d03:	c3                   	retq   

0000000000802d04 <dup>:
  802d04:	55                   	push   %rbp
  802d05:	48 89 e5             	mov    %rsp,%rbp
  802d08:	48 83 ec 40          	sub    $0x40,%rsp
  802d0c:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802d0f:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802d12:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802d16:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802d19:	48 89 d6             	mov    %rdx,%rsi
  802d1c:	89 c7                	mov    %eax,%edi
  802d1e:	48 b8 78 2a 80 00 00 	movabs $0x802a78,%rax
  802d25:	00 00 00 
  802d28:	ff d0                	callq  *%rax
  802d2a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d2d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d31:	79 08                	jns    802d3b <dup+0x37>
  802d33:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d36:	e9 70 01 00 00       	jmpq   802eab <dup+0x1a7>
  802d3b:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802d3e:	89 c7                	mov    %eax,%edi
  802d40:	48 b8 8a 2c 80 00 00 	movabs $0x802c8a,%rax
  802d47:	00 00 00 
  802d4a:	ff d0                	callq  *%rax
  802d4c:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802d4f:	48 98                	cltq   
  802d51:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802d57:	48 c1 e0 0c          	shl    $0xc,%rax
  802d5b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802d5f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802d63:	48 89 c7             	mov    %rax,%rdi
  802d66:	48 b8 b5 29 80 00 00 	movabs $0x8029b5,%rax
  802d6d:	00 00 00 
  802d70:	ff d0                	callq  *%rax
  802d72:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802d76:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d7a:	48 89 c7             	mov    %rax,%rdi
  802d7d:	48 b8 b5 29 80 00 00 	movabs $0x8029b5,%rax
  802d84:	00 00 00 
  802d87:	ff d0                	callq  *%rax
  802d89:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802d8d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d91:	48 c1 e8 15          	shr    $0x15,%rax
  802d95:	48 89 c2             	mov    %rax,%rdx
  802d98:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802d9f:	01 00 00 
  802da2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802da6:	83 e0 01             	and    $0x1,%eax
  802da9:	48 85 c0             	test   %rax,%rax
  802dac:	74 71                	je     802e1f <dup+0x11b>
  802dae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802db2:	48 c1 e8 0c          	shr    $0xc,%rax
  802db6:	48 89 c2             	mov    %rax,%rdx
  802db9:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802dc0:	01 00 00 
  802dc3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802dc7:	83 e0 01             	and    $0x1,%eax
  802dca:	48 85 c0             	test   %rax,%rax
  802dcd:	74 50                	je     802e1f <dup+0x11b>
  802dcf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802dd3:	48 c1 e8 0c          	shr    $0xc,%rax
  802dd7:	48 89 c2             	mov    %rax,%rdx
  802dda:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802de1:	01 00 00 
  802de4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802de8:	25 07 0e 00 00       	and    $0xe07,%eax
  802ded:	89 c1                	mov    %eax,%ecx
  802def:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802df3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802df7:	41 89 c8             	mov    %ecx,%r8d
  802dfa:	48 89 d1             	mov    %rdx,%rcx
  802dfd:	ba 00 00 00 00       	mov    $0x0,%edx
  802e02:	48 89 c6             	mov    %rax,%rsi
  802e05:	bf 00 00 00 00       	mov    $0x0,%edi
  802e0a:	48 b8 94 1d 80 00 00 	movabs $0x801d94,%rax
  802e11:	00 00 00 
  802e14:	ff d0                	callq  *%rax
  802e16:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e19:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e1d:	78 55                	js     802e74 <dup+0x170>
  802e1f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802e23:	48 c1 e8 0c          	shr    $0xc,%rax
  802e27:	48 89 c2             	mov    %rax,%rdx
  802e2a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802e31:	01 00 00 
  802e34:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802e38:	25 07 0e 00 00       	and    $0xe07,%eax
  802e3d:	89 c1                	mov    %eax,%ecx
  802e3f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802e43:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802e47:	41 89 c8             	mov    %ecx,%r8d
  802e4a:	48 89 d1             	mov    %rdx,%rcx
  802e4d:	ba 00 00 00 00       	mov    $0x0,%edx
  802e52:	48 89 c6             	mov    %rax,%rsi
  802e55:	bf 00 00 00 00       	mov    $0x0,%edi
  802e5a:	48 b8 94 1d 80 00 00 	movabs $0x801d94,%rax
  802e61:	00 00 00 
  802e64:	ff d0                	callq  *%rax
  802e66:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e69:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e6d:	78 08                	js     802e77 <dup+0x173>
  802e6f:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802e72:	eb 37                	jmp    802eab <dup+0x1a7>
  802e74:	90                   	nop
  802e75:	eb 01                	jmp    802e78 <dup+0x174>
  802e77:	90                   	nop
  802e78:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e7c:	48 89 c6             	mov    %rax,%rsi
  802e7f:	bf 00 00 00 00       	mov    $0x0,%edi
  802e84:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  802e8b:	00 00 00 
  802e8e:	ff d0                	callq  *%rax
  802e90:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802e94:	48 89 c6             	mov    %rax,%rsi
  802e97:	bf 00 00 00 00       	mov    $0x0,%edi
  802e9c:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  802ea3:	00 00 00 
  802ea6:	ff d0                	callq  *%rax
  802ea8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eab:	c9                   	leaveq 
  802eac:	c3                   	retq   

0000000000802ead <read>:
  802ead:	55                   	push   %rbp
  802eae:	48 89 e5             	mov    %rsp,%rbp
  802eb1:	48 83 ec 40          	sub    $0x40,%rsp
  802eb5:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802eb8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802ebc:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802ec0:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802ec4:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802ec7:	48 89 d6             	mov    %rdx,%rsi
  802eca:	89 c7                	mov    %eax,%edi
  802ecc:	48 b8 78 2a 80 00 00 	movabs $0x802a78,%rax
  802ed3:	00 00 00 
  802ed6:	ff d0                	callq  *%rax
  802ed8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802edb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802edf:	78 24                	js     802f05 <read+0x58>
  802ee1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ee5:	8b 00                	mov    (%rax),%eax
  802ee7:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802eeb:	48 89 d6             	mov    %rdx,%rsi
  802eee:	89 c7                	mov    %eax,%edi
  802ef0:	48 b8 d3 2b 80 00 00 	movabs $0x802bd3,%rax
  802ef7:	00 00 00 
  802efa:	ff d0                	callq  *%rax
  802efc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802eff:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f03:	79 05                	jns    802f0a <read+0x5d>
  802f05:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f08:	eb 76                	jmp    802f80 <read+0xd3>
  802f0a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f0e:	8b 40 08             	mov    0x8(%rax),%eax
  802f11:	83 e0 03             	and    $0x3,%eax
  802f14:	83 f8 01             	cmp    $0x1,%eax
  802f17:	75 3a                	jne    802f53 <read+0xa6>
  802f19:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  802f20:	00 00 00 
  802f23:	48 8b 00             	mov    (%rax),%rax
  802f26:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802f2c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802f2f:	89 c6                	mov    %eax,%esi
  802f31:	48 bf 5f 54 80 00 00 	movabs $0x80545f,%rdi
  802f38:	00 00 00 
  802f3b:	b8 00 00 00 00       	mov    $0x0,%eax
  802f40:	48 b9 82 08 80 00 00 	movabs $0x800882,%rcx
  802f47:	00 00 00 
  802f4a:	ff d1                	callq  *%rcx
  802f4c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802f51:	eb 2d                	jmp    802f80 <read+0xd3>
  802f53:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f57:	48 8b 40 10          	mov    0x10(%rax),%rax
  802f5b:	48 85 c0             	test   %rax,%rax
  802f5e:	75 07                	jne    802f67 <read+0xba>
  802f60:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802f65:	eb 19                	jmp    802f80 <read+0xd3>
  802f67:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f6b:	48 8b 40 10          	mov    0x10(%rax),%rax
  802f6f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802f73:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802f77:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802f7b:	48 89 cf             	mov    %rcx,%rdi
  802f7e:	ff d0                	callq  *%rax
  802f80:	c9                   	leaveq 
  802f81:	c3                   	retq   

0000000000802f82 <readn>:
  802f82:	55                   	push   %rbp
  802f83:	48 89 e5             	mov    %rsp,%rbp
  802f86:	48 83 ec 30          	sub    $0x30,%rsp
  802f8a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f8d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802f91:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802f95:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802f9c:	eb 47                	jmp    802fe5 <readn+0x63>
  802f9e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fa1:	48 98                	cltq   
  802fa3:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802fa7:	48 29 c2             	sub    %rax,%rdx
  802faa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fad:	48 63 c8             	movslq %eax,%rcx
  802fb0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802fb4:	48 01 c1             	add    %rax,%rcx
  802fb7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802fba:	48 89 ce             	mov    %rcx,%rsi
  802fbd:	89 c7                	mov    %eax,%edi
  802fbf:	48 b8 ad 2e 80 00 00 	movabs $0x802ead,%rax
  802fc6:	00 00 00 
  802fc9:	ff d0                	callq  *%rax
  802fcb:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802fce:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802fd2:	79 05                	jns    802fd9 <readn+0x57>
  802fd4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802fd7:	eb 1d                	jmp    802ff6 <readn+0x74>
  802fd9:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802fdd:	74 13                	je     802ff2 <readn+0x70>
  802fdf:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802fe2:	01 45 fc             	add    %eax,-0x4(%rbp)
  802fe5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fe8:	48 98                	cltq   
  802fea:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802fee:	72 ae                	jb     802f9e <readn+0x1c>
  802ff0:	eb 01                	jmp    802ff3 <readn+0x71>
  802ff2:	90                   	nop
  802ff3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ff6:	c9                   	leaveq 
  802ff7:	c3                   	retq   

0000000000802ff8 <write>:
  802ff8:	55                   	push   %rbp
  802ff9:	48 89 e5             	mov    %rsp,%rbp
  802ffc:	48 83 ec 40          	sub    $0x40,%rsp
  803000:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803003:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803007:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80300b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80300f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803012:	48 89 d6             	mov    %rdx,%rsi
  803015:	89 c7                	mov    %eax,%edi
  803017:	48 b8 78 2a 80 00 00 	movabs $0x802a78,%rax
  80301e:	00 00 00 
  803021:	ff d0                	callq  *%rax
  803023:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803026:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80302a:	78 24                	js     803050 <write+0x58>
  80302c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803030:	8b 00                	mov    (%rax),%eax
  803032:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803036:	48 89 d6             	mov    %rdx,%rsi
  803039:	89 c7                	mov    %eax,%edi
  80303b:	48 b8 d3 2b 80 00 00 	movabs $0x802bd3,%rax
  803042:	00 00 00 
  803045:	ff d0                	callq  *%rax
  803047:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80304a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80304e:	79 05                	jns    803055 <write+0x5d>
  803050:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803053:	eb 75                	jmp    8030ca <write+0xd2>
  803055:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803059:	8b 40 08             	mov    0x8(%rax),%eax
  80305c:	83 e0 03             	and    $0x3,%eax
  80305f:	85 c0                	test   %eax,%eax
  803061:	75 3a                	jne    80309d <write+0xa5>
  803063:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  80306a:	00 00 00 
  80306d:	48 8b 00             	mov    (%rax),%rax
  803070:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  803076:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803079:	89 c6                	mov    %eax,%esi
  80307b:	48 bf 7b 54 80 00 00 	movabs $0x80547b,%rdi
  803082:	00 00 00 
  803085:	b8 00 00 00 00       	mov    $0x0,%eax
  80308a:	48 b9 82 08 80 00 00 	movabs $0x800882,%rcx
  803091:	00 00 00 
  803094:	ff d1                	callq  *%rcx
  803096:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80309b:	eb 2d                	jmp    8030ca <write+0xd2>
  80309d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030a1:	48 8b 40 18          	mov    0x18(%rax),%rax
  8030a5:	48 85 c0             	test   %rax,%rax
  8030a8:	75 07                	jne    8030b1 <write+0xb9>
  8030aa:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8030af:	eb 19                	jmp    8030ca <write+0xd2>
  8030b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8030b5:	48 8b 40 18          	mov    0x18(%rax),%rax
  8030b9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8030bd:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8030c1:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8030c5:	48 89 cf             	mov    %rcx,%rdi
  8030c8:	ff d0                	callq  *%rax
  8030ca:	c9                   	leaveq 
  8030cb:	c3                   	retq   

00000000008030cc <seek>:
  8030cc:	55                   	push   %rbp
  8030cd:	48 89 e5             	mov    %rsp,%rbp
  8030d0:	48 83 ec 18          	sub    $0x18,%rsp
  8030d4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8030d7:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8030da:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8030de:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8030e1:	48 89 d6             	mov    %rdx,%rsi
  8030e4:	89 c7                	mov    %eax,%edi
  8030e6:	48 b8 78 2a 80 00 00 	movabs $0x802a78,%rax
  8030ed:	00 00 00 
  8030f0:	ff d0                	callq  *%rax
  8030f2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030f5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030f9:	79 05                	jns    803100 <seek+0x34>
  8030fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030fe:	eb 0f                	jmp    80310f <seek+0x43>
  803100:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803104:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803107:	89 50 04             	mov    %edx,0x4(%rax)
  80310a:	b8 00 00 00 00       	mov    $0x0,%eax
  80310f:	c9                   	leaveq 
  803110:	c3                   	retq   

0000000000803111 <ftruncate>:
  803111:	55                   	push   %rbp
  803112:	48 89 e5             	mov    %rsp,%rbp
  803115:	48 83 ec 30          	sub    $0x30,%rsp
  803119:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80311c:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80311f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803123:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803126:	48 89 d6             	mov    %rdx,%rsi
  803129:	89 c7                	mov    %eax,%edi
  80312b:	48 b8 78 2a 80 00 00 	movabs $0x802a78,%rax
  803132:	00 00 00 
  803135:	ff d0                	callq  *%rax
  803137:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80313a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80313e:	78 24                	js     803164 <ftruncate+0x53>
  803140:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803144:	8b 00                	mov    (%rax),%eax
  803146:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80314a:	48 89 d6             	mov    %rdx,%rsi
  80314d:	89 c7                	mov    %eax,%edi
  80314f:	48 b8 d3 2b 80 00 00 	movabs $0x802bd3,%rax
  803156:	00 00 00 
  803159:	ff d0                	callq  *%rax
  80315b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80315e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803162:	79 05                	jns    803169 <ftruncate+0x58>
  803164:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803167:	eb 72                	jmp    8031db <ftruncate+0xca>
  803169:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80316d:	8b 40 08             	mov    0x8(%rax),%eax
  803170:	83 e0 03             	and    $0x3,%eax
  803173:	85 c0                	test   %eax,%eax
  803175:	75 3a                	jne    8031b1 <ftruncate+0xa0>
  803177:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  80317e:	00 00 00 
  803181:	48 8b 00             	mov    (%rax),%rax
  803184:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80318a:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80318d:	89 c6                	mov    %eax,%esi
  80318f:	48 bf 98 54 80 00 00 	movabs $0x805498,%rdi
  803196:	00 00 00 
  803199:	b8 00 00 00 00       	mov    $0x0,%eax
  80319e:	48 b9 82 08 80 00 00 	movabs $0x800882,%rcx
  8031a5:	00 00 00 
  8031a8:	ff d1                	callq  *%rcx
  8031aa:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8031af:	eb 2a                	jmp    8031db <ftruncate+0xca>
  8031b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031b5:	48 8b 40 30          	mov    0x30(%rax),%rax
  8031b9:	48 85 c0             	test   %rax,%rax
  8031bc:	75 07                	jne    8031c5 <ftruncate+0xb4>
  8031be:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8031c3:	eb 16                	jmp    8031db <ftruncate+0xca>
  8031c5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031c9:	48 8b 40 30          	mov    0x30(%rax),%rax
  8031cd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8031d1:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8031d4:	89 ce                	mov    %ecx,%esi
  8031d6:	48 89 d7             	mov    %rdx,%rdi
  8031d9:	ff d0                	callq  *%rax
  8031db:	c9                   	leaveq 
  8031dc:	c3                   	retq   

00000000008031dd <fstat>:
  8031dd:	55                   	push   %rbp
  8031de:	48 89 e5             	mov    %rsp,%rbp
  8031e1:	48 83 ec 30          	sub    $0x30,%rsp
  8031e5:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8031e8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8031ec:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8031f0:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8031f3:	48 89 d6             	mov    %rdx,%rsi
  8031f6:	89 c7                	mov    %eax,%edi
  8031f8:	48 b8 78 2a 80 00 00 	movabs $0x802a78,%rax
  8031ff:	00 00 00 
  803202:	ff d0                	callq  *%rax
  803204:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803207:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80320b:	78 24                	js     803231 <fstat+0x54>
  80320d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803211:	8b 00                	mov    (%rax),%eax
  803213:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803217:	48 89 d6             	mov    %rdx,%rsi
  80321a:	89 c7                	mov    %eax,%edi
  80321c:	48 b8 d3 2b 80 00 00 	movabs $0x802bd3,%rax
  803223:	00 00 00 
  803226:	ff d0                	callq  *%rax
  803228:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80322b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80322f:	79 05                	jns    803236 <fstat+0x59>
  803231:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803234:	eb 5e                	jmp    803294 <fstat+0xb7>
  803236:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80323a:	48 8b 40 28          	mov    0x28(%rax),%rax
  80323e:	48 85 c0             	test   %rax,%rax
  803241:	75 07                	jne    80324a <fstat+0x6d>
  803243:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803248:	eb 4a                	jmp    803294 <fstat+0xb7>
  80324a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80324e:	c6 00 00             	movb   $0x0,(%rax)
  803251:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803255:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  80325c:	00 00 00 
  80325f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803263:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80326a:	00 00 00 
  80326d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803271:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803275:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  80327c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803280:	48 8b 40 28          	mov    0x28(%rax),%rax
  803284:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803288:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  80328c:	48 89 ce             	mov    %rcx,%rsi
  80328f:	48 89 d7             	mov    %rdx,%rdi
  803292:	ff d0                	callq  *%rax
  803294:	c9                   	leaveq 
  803295:	c3                   	retq   

0000000000803296 <stat>:
  803296:	55                   	push   %rbp
  803297:	48 89 e5             	mov    %rsp,%rbp
  80329a:	48 83 ec 20          	sub    $0x20,%rsp
  80329e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8032a2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8032a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032aa:	be 00 00 00 00       	mov    $0x0,%esi
  8032af:	48 89 c7             	mov    %rax,%rdi
  8032b2:	48 b8 86 33 80 00 00 	movabs $0x803386,%rax
  8032b9:	00 00 00 
  8032bc:	ff d0                	callq  *%rax
  8032be:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032c1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032c5:	79 05                	jns    8032cc <stat+0x36>
  8032c7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032ca:	eb 2f                	jmp    8032fb <stat+0x65>
  8032cc:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8032d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032d3:	48 89 d6             	mov    %rdx,%rsi
  8032d6:	89 c7                	mov    %eax,%edi
  8032d8:	48 b8 dd 31 80 00 00 	movabs $0x8031dd,%rax
  8032df:	00 00 00 
  8032e2:	ff d0                	callq  *%rax
  8032e4:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8032e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032ea:	89 c7                	mov    %eax,%edi
  8032ec:	48 b8 8a 2c 80 00 00 	movabs $0x802c8a,%rax
  8032f3:	00 00 00 
  8032f6:	ff d0                	callq  *%rax
  8032f8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8032fb:	c9                   	leaveq 
  8032fc:	c3                   	retq   

00000000008032fd <fsipc>:
  8032fd:	55                   	push   %rbp
  8032fe:	48 89 e5             	mov    %rsp,%rbp
  803301:	48 83 ec 10          	sub    $0x10,%rsp
  803305:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803308:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80330c:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803313:	00 00 00 
  803316:	8b 00                	mov    (%rax),%eax
  803318:	85 c0                	test   %eax,%eax
  80331a:	75 1f                	jne    80333b <fsipc+0x3e>
  80331c:	bf 01 00 00 00       	mov    $0x1,%edi
  803321:	48 b8 21 29 80 00 00 	movabs $0x802921,%rax
  803328:	00 00 00 
  80332b:	ff d0                	callq  *%rax
  80332d:	89 c2                	mov    %eax,%edx
  80332f:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803336:	00 00 00 
  803339:	89 10                	mov    %edx,(%rax)
  80333b:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803342:	00 00 00 
  803345:	8b 00                	mov    (%rax),%eax
  803347:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80334a:	b9 07 00 00 00       	mov    $0x7,%ecx
  80334f:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  803356:	00 00 00 
  803359:	89 c7                	mov    %eax,%edi
  80335b:	48 b8 17 28 80 00 00 	movabs $0x802817,%rax
  803362:	00 00 00 
  803365:	ff d0                	callq  *%rax
  803367:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80336b:	ba 00 00 00 00       	mov    $0x0,%edx
  803370:	48 89 c6             	mov    %rax,%rsi
  803373:	bf 00 00 00 00       	mov    $0x0,%edi
  803378:	48 b8 56 27 80 00 00 	movabs $0x802756,%rax
  80337f:	00 00 00 
  803382:	ff d0                	callq  *%rax
  803384:	c9                   	leaveq 
  803385:	c3                   	retq   

0000000000803386 <open>:
  803386:	55                   	push   %rbp
  803387:	48 89 e5             	mov    %rsp,%rbp
  80338a:	48 83 ec 20          	sub    $0x20,%rsp
  80338e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803392:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  803395:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803399:	48 89 c7             	mov    %rax,%rdi
  80339c:	48 b8 a6 13 80 00 00 	movabs $0x8013a6,%rax
  8033a3:	00 00 00 
  8033a6:	ff d0                	callq  *%rax
  8033a8:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8033ad:	7e 0a                	jle    8033b9 <open+0x33>
  8033af:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8033b4:	e9 a5 00 00 00       	jmpq   80345e <open+0xd8>
  8033b9:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8033bd:	48 89 c7             	mov    %rax,%rdi
  8033c0:	48 b8 e0 29 80 00 00 	movabs $0x8029e0,%rax
  8033c7:	00 00 00 
  8033ca:	ff d0                	callq  *%rax
  8033cc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033cf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033d3:	79 08                	jns    8033dd <open+0x57>
  8033d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033d8:	e9 81 00 00 00       	jmpq   80345e <open+0xd8>
  8033dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033e1:	48 89 c6             	mov    %rax,%rsi
  8033e4:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8033eb:	00 00 00 
  8033ee:	48 b8 12 14 80 00 00 	movabs $0x801412,%rax
  8033f5:	00 00 00 
  8033f8:	ff d0                	callq  *%rax
  8033fa:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803401:	00 00 00 
  803404:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803407:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  80340d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803411:	48 89 c6             	mov    %rax,%rsi
  803414:	bf 01 00 00 00       	mov    $0x1,%edi
  803419:	48 b8 fd 32 80 00 00 	movabs $0x8032fd,%rax
  803420:	00 00 00 
  803423:	ff d0                	callq  *%rax
  803425:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803428:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80342c:	79 1d                	jns    80344b <open+0xc5>
  80342e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803432:	be 00 00 00 00       	mov    $0x0,%esi
  803437:	48 89 c7             	mov    %rax,%rdi
  80343a:	48 b8 08 2b 80 00 00 	movabs $0x802b08,%rax
  803441:	00 00 00 
  803444:	ff d0                	callq  *%rax
  803446:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803449:	eb 13                	jmp    80345e <open+0xd8>
  80344b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80344f:	48 89 c7             	mov    %rax,%rdi
  803452:	48 b8 92 29 80 00 00 	movabs $0x802992,%rax
  803459:	00 00 00 
  80345c:	ff d0                	callq  *%rax
  80345e:	c9                   	leaveq 
  80345f:	c3                   	retq   

0000000000803460 <devfile_flush>:
  803460:	55                   	push   %rbp
  803461:	48 89 e5             	mov    %rsp,%rbp
  803464:	48 83 ec 10          	sub    $0x10,%rsp
  803468:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80346c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803470:	8b 50 0c             	mov    0xc(%rax),%edx
  803473:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80347a:	00 00 00 
  80347d:	89 10                	mov    %edx,(%rax)
  80347f:	be 00 00 00 00       	mov    $0x0,%esi
  803484:	bf 06 00 00 00       	mov    $0x6,%edi
  803489:	48 b8 fd 32 80 00 00 	movabs $0x8032fd,%rax
  803490:	00 00 00 
  803493:	ff d0                	callq  *%rax
  803495:	c9                   	leaveq 
  803496:	c3                   	retq   

0000000000803497 <devfile_read>:
  803497:	55                   	push   %rbp
  803498:	48 89 e5             	mov    %rsp,%rbp
  80349b:	48 83 ec 30          	sub    $0x30,%rsp
  80349f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8034a3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8034a7:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8034ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034af:	8b 50 0c             	mov    0xc(%rax),%edx
  8034b2:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8034b9:	00 00 00 
  8034bc:	89 10                	mov    %edx,(%rax)
  8034be:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8034c5:	00 00 00 
  8034c8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8034cc:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8034d0:	be 00 00 00 00       	mov    $0x0,%esi
  8034d5:	bf 03 00 00 00       	mov    $0x3,%edi
  8034da:	48 b8 fd 32 80 00 00 	movabs $0x8032fd,%rax
  8034e1:	00 00 00 
  8034e4:	ff d0                	callq  *%rax
  8034e6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034e9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034ed:	79 08                	jns    8034f7 <devfile_read+0x60>
  8034ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034f2:	e9 a4 00 00 00       	jmpq   80359b <devfile_read+0x104>
  8034f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034fa:	48 98                	cltq   
  8034fc:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  803500:	76 35                	jbe    803537 <devfile_read+0xa0>
  803502:	48 b9 be 54 80 00 00 	movabs $0x8054be,%rcx
  803509:	00 00 00 
  80350c:	48 ba c5 54 80 00 00 	movabs $0x8054c5,%rdx
  803513:	00 00 00 
  803516:	be 89 00 00 00       	mov    $0x89,%esi
  80351b:	48 bf da 54 80 00 00 	movabs $0x8054da,%rdi
  803522:	00 00 00 
  803525:	b8 00 00 00 00       	mov    $0x0,%eax
  80352a:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  803531:	00 00 00 
  803534:	41 ff d0             	callq  *%r8
  803537:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  80353e:	7e 35                	jle    803575 <devfile_read+0xde>
  803540:	48 b9 e8 54 80 00 00 	movabs $0x8054e8,%rcx
  803547:	00 00 00 
  80354a:	48 ba c5 54 80 00 00 	movabs $0x8054c5,%rdx
  803551:	00 00 00 
  803554:	be 8a 00 00 00       	mov    $0x8a,%esi
  803559:	48 bf da 54 80 00 00 	movabs $0x8054da,%rdi
  803560:	00 00 00 
  803563:	b8 00 00 00 00       	mov    $0x0,%eax
  803568:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  80356f:	00 00 00 
  803572:	41 ff d0             	callq  *%r8
  803575:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803578:	48 63 d0             	movslq %eax,%rdx
  80357b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80357f:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  803586:	00 00 00 
  803589:	48 89 c7             	mov    %rax,%rdi
  80358c:	48 b8 37 17 80 00 00 	movabs $0x801737,%rax
  803593:	00 00 00 
  803596:	ff d0                	callq  *%rax
  803598:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80359b:	c9                   	leaveq 
  80359c:	c3                   	retq   

000000000080359d <devfile_write>:
  80359d:	55                   	push   %rbp
  80359e:	48 89 e5             	mov    %rsp,%rbp
  8035a1:	48 83 ec 40          	sub    $0x40,%rsp
  8035a5:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8035a9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8035ad:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8035b1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8035b5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8035b9:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8035c0:	00 
  8035c1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035c5:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8035c9:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  8035ce:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8035d2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8035d6:	8b 50 0c             	mov    0xc(%rax),%edx
  8035d9:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8035e0:	00 00 00 
  8035e3:	89 10                	mov    %edx,(%rax)
  8035e5:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8035ec:	00 00 00 
  8035ef:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8035f3:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8035f7:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8035fb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8035ff:	48 89 c6             	mov    %rax,%rsi
  803602:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  803609:	00 00 00 
  80360c:	48 b8 37 17 80 00 00 	movabs $0x801737,%rax
  803613:	00 00 00 
  803616:	ff d0                	callq  *%rax
  803618:	be 00 00 00 00       	mov    $0x0,%esi
  80361d:	bf 04 00 00 00       	mov    $0x4,%edi
  803622:	48 b8 fd 32 80 00 00 	movabs $0x8032fd,%rax
  803629:	00 00 00 
  80362c:	ff d0                	callq  *%rax
  80362e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803631:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803635:	79 05                	jns    80363c <devfile_write+0x9f>
  803637:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80363a:	eb 43                	jmp    80367f <devfile_write+0xe2>
  80363c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80363f:	48 98                	cltq   
  803641:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803645:	76 35                	jbe    80367c <devfile_write+0xdf>
  803647:	48 b9 be 54 80 00 00 	movabs $0x8054be,%rcx
  80364e:	00 00 00 
  803651:	48 ba c5 54 80 00 00 	movabs $0x8054c5,%rdx
  803658:	00 00 00 
  80365b:	be a8 00 00 00       	mov    $0xa8,%esi
  803660:	48 bf da 54 80 00 00 	movabs $0x8054da,%rdi
  803667:	00 00 00 
  80366a:	b8 00 00 00 00       	mov    $0x0,%eax
  80366f:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  803676:	00 00 00 
  803679:	41 ff d0             	callq  *%r8
  80367c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80367f:	c9                   	leaveq 
  803680:	c3                   	retq   

0000000000803681 <devfile_stat>:
  803681:	55                   	push   %rbp
  803682:	48 89 e5             	mov    %rsp,%rbp
  803685:	48 83 ec 20          	sub    $0x20,%rsp
  803689:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80368d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803691:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803695:	8b 50 0c             	mov    0xc(%rax),%edx
  803698:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80369f:	00 00 00 
  8036a2:	89 10                	mov    %edx,(%rax)
  8036a4:	be 00 00 00 00       	mov    $0x0,%esi
  8036a9:	bf 05 00 00 00       	mov    $0x5,%edi
  8036ae:	48 b8 fd 32 80 00 00 	movabs $0x8032fd,%rax
  8036b5:	00 00 00 
  8036b8:	ff d0                	callq  *%rax
  8036ba:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036bd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036c1:	79 05                	jns    8036c8 <devfile_stat+0x47>
  8036c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036c6:	eb 56                	jmp    80371e <devfile_stat+0x9d>
  8036c8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8036cc:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8036d3:	00 00 00 
  8036d6:	48 89 c7             	mov    %rax,%rdi
  8036d9:	48 b8 12 14 80 00 00 	movabs $0x801412,%rax
  8036e0:	00 00 00 
  8036e3:	ff d0                	callq  *%rax
  8036e5:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8036ec:	00 00 00 
  8036ef:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  8036f5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8036f9:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8036ff:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803706:	00 00 00 
  803709:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  80370f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803713:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803719:	b8 00 00 00 00       	mov    $0x0,%eax
  80371e:	c9                   	leaveq 
  80371f:	c3                   	retq   

0000000000803720 <devfile_trunc>:
  803720:	55                   	push   %rbp
  803721:	48 89 e5             	mov    %rsp,%rbp
  803724:	48 83 ec 10          	sub    $0x10,%rsp
  803728:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80372c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80372f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803733:	8b 50 0c             	mov    0xc(%rax),%edx
  803736:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80373d:	00 00 00 
  803740:	89 10                	mov    %edx,(%rax)
  803742:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803749:	00 00 00 
  80374c:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80374f:	89 50 04             	mov    %edx,0x4(%rax)
  803752:	be 00 00 00 00       	mov    $0x0,%esi
  803757:	bf 02 00 00 00       	mov    $0x2,%edi
  80375c:	48 b8 fd 32 80 00 00 	movabs $0x8032fd,%rax
  803763:	00 00 00 
  803766:	ff d0                	callq  *%rax
  803768:	c9                   	leaveq 
  803769:	c3                   	retq   

000000000080376a <remove>:
  80376a:	55                   	push   %rbp
  80376b:	48 89 e5             	mov    %rsp,%rbp
  80376e:	48 83 ec 10          	sub    $0x10,%rsp
  803772:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803776:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80377a:	48 89 c7             	mov    %rax,%rdi
  80377d:	48 b8 a6 13 80 00 00 	movabs $0x8013a6,%rax
  803784:	00 00 00 
  803787:	ff d0                	callq  *%rax
  803789:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  80378e:	7e 07                	jle    803797 <remove+0x2d>
  803790:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803795:	eb 33                	jmp    8037ca <remove+0x60>
  803797:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80379b:	48 89 c6             	mov    %rax,%rsi
  80379e:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8037a5:	00 00 00 
  8037a8:	48 b8 12 14 80 00 00 	movabs $0x801412,%rax
  8037af:	00 00 00 
  8037b2:	ff d0                	callq  *%rax
  8037b4:	be 00 00 00 00       	mov    $0x0,%esi
  8037b9:	bf 07 00 00 00       	mov    $0x7,%edi
  8037be:	48 b8 fd 32 80 00 00 	movabs $0x8032fd,%rax
  8037c5:	00 00 00 
  8037c8:	ff d0                	callq  *%rax
  8037ca:	c9                   	leaveq 
  8037cb:	c3                   	retq   

00000000008037cc <sync>:
  8037cc:	55                   	push   %rbp
  8037cd:	48 89 e5             	mov    %rsp,%rbp
  8037d0:	be 00 00 00 00       	mov    $0x0,%esi
  8037d5:	bf 08 00 00 00       	mov    $0x8,%edi
  8037da:	48 b8 fd 32 80 00 00 	movabs $0x8032fd,%rax
  8037e1:	00 00 00 
  8037e4:	ff d0                	callq  *%rax
  8037e6:	5d                   	pop    %rbp
  8037e7:	c3                   	retq   

00000000008037e8 <copy>:
  8037e8:	55                   	push   %rbp
  8037e9:	48 89 e5             	mov    %rsp,%rbp
  8037ec:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  8037f3:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  8037fa:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803801:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803808:	be 00 00 00 00       	mov    $0x0,%esi
  80380d:	48 89 c7             	mov    %rax,%rdi
  803810:	48 b8 86 33 80 00 00 	movabs $0x803386,%rax
  803817:	00 00 00 
  80381a:	ff d0                	callq  *%rax
  80381c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80381f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803823:	79 28                	jns    80384d <copy+0x65>
  803825:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803828:	89 c6                	mov    %eax,%esi
  80382a:	48 bf f4 54 80 00 00 	movabs $0x8054f4,%rdi
  803831:	00 00 00 
  803834:	b8 00 00 00 00       	mov    $0x0,%eax
  803839:	48 ba 82 08 80 00 00 	movabs $0x800882,%rdx
  803840:	00 00 00 
  803843:	ff d2                	callq  *%rdx
  803845:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803848:	e9 76 01 00 00       	jmpq   8039c3 <copy+0x1db>
  80384d:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  803854:	be 01 01 00 00       	mov    $0x101,%esi
  803859:	48 89 c7             	mov    %rax,%rdi
  80385c:	48 b8 86 33 80 00 00 	movabs $0x803386,%rax
  803863:	00 00 00 
  803866:	ff d0                	callq  *%rax
  803868:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80386b:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80386f:	0f 89 ad 00 00 00    	jns    803922 <copy+0x13a>
  803875:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803878:	89 c6                	mov    %eax,%esi
  80387a:	48 bf 0a 55 80 00 00 	movabs $0x80550a,%rdi
  803881:	00 00 00 
  803884:	b8 00 00 00 00       	mov    $0x0,%eax
  803889:	48 ba 82 08 80 00 00 	movabs $0x800882,%rdx
  803890:	00 00 00 
  803893:	ff d2                	callq  *%rdx
  803895:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803898:	89 c7                	mov    %eax,%edi
  80389a:	48 b8 8a 2c 80 00 00 	movabs $0x802c8a,%rax
  8038a1:	00 00 00 
  8038a4:	ff d0                	callq  *%rax
  8038a6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8038a9:	e9 15 01 00 00       	jmpq   8039c3 <copy+0x1db>
  8038ae:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8038b1:	48 63 d0             	movslq %eax,%rdx
  8038b4:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8038bb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8038be:	48 89 ce             	mov    %rcx,%rsi
  8038c1:	89 c7                	mov    %eax,%edi
  8038c3:	48 b8 f8 2f 80 00 00 	movabs $0x802ff8,%rax
  8038ca:	00 00 00 
  8038cd:	ff d0                	callq  *%rax
  8038cf:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8038d2:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8038d6:	79 4a                	jns    803922 <copy+0x13a>
  8038d8:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8038db:	89 c6                	mov    %eax,%esi
  8038dd:	48 bf 24 55 80 00 00 	movabs $0x805524,%rdi
  8038e4:	00 00 00 
  8038e7:	b8 00 00 00 00       	mov    $0x0,%eax
  8038ec:	48 ba 82 08 80 00 00 	movabs $0x800882,%rdx
  8038f3:	00 00 00 
  8038f6:	ff d2                	callq  *%rdx
  8038f8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038fb:	89 c7                	mov    %eax,%edi
  8038fd:	48 b8 8a 2c 80 00 00 	movabs $0x802c8a,%rax
  803904:	00 00 00 
  803907:	ff d0                	callq  *%rax
  803909:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80390c:	89 c7                	mov    %eax,%edi
  80390e:	48 b8 8a 2c 80 00 00 	movabs $0x802c8a,%rax
  803915:	00 00 00 
  803918:	ff d0                	callq  *%rax
  80391a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80391d:	e9 a1 00 00 00       	jmpq   8039c3 <copy+0x1db>
  803922:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803929:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80392c:	ba 00 02 00 00       	mov    $0x200,%edx
  803931:	48 89 ce             	mov    %rcx,%rsi
  803934:	89 c7                	mov    %eax,%edi
  803936:	48 b8 ad 2e 80 00 00 	movabs $0x802ead,%rax
  80393d:	00 00 00 
  803940:	ff d0                	callq  *%rax
  803942:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803945:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803949:	0f 8f 5f ff ff ff    	jg     8038ae <copy+0xc6>
  80394f:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803953:	79 47                	jns    80399c <copy+0x1b4>
  803955:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803958:	89 c6                	mov    %eax,%esi
  80395a:	48 bf 37 55 80 00 00 	movabs $0x805537,%rdi
  803961:	00 00 00 
  803964:	b8 00 00 00 00       	mov    $0x0,%eax
  803969:	48 ba 82 08 80 00 00 	movabs $0x800882,%rdx
  803970:	00 00 00 
  803973:	ff d2                	callq  *%rdx
  803975:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803978:	89 c7                	mov    %eax,%edi
  80397a:	48 b8 8a 2c 80 00 00 	movabs $0x802c8a,%rax
  803981:	00 00 00 
  803984:	ff d0                	callq  *%rax
  803986:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803989:	89 c7                	mov    %eax,%edi
  80398b:	48 b8 8a 2c 80 00 00 	movabs $0x802c8a,%rax
  803992:	00 00 00 
  803995:	ff d0                	callq  *%rax
  803997:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80399a:	eb 27                	jmp    8039c3 <copy+0x1db>
  80399c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80399f:	89 c7                	mov    %eax,%edi
  8039a1:	48 b8 8a 2c 80 00 00 	movabs $0x802c8a,%rax
  8039a8:	00 00 00 
  8039ab:	ff d0                	callq  *%rax
  8039ad:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8039b0:	89 c7                	mov    %eax,%edi
  8039b2:	48 b8 8a 2c 80 00 00 	movabs $0x802c8a,%rax
  8039b9:	00 00 00 
  8039bc:	ff d0                	callq  *%rax
  8039be:	b8 00 00 00 00       	mov    $0x0,%eax
  8039c3:	c9                   	leaveq 
  8039c4:	c3                   	retq   

00000000008039c5 <fd2sockid>:
  8039c5:	55                   	push   %rbp
  8039c6:	48 89 e5             	mov    %rsp,%rbp
  8039c9:	48 83 ec 20          	sub    $0x20,%rsp
  8039cd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8039d0:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8039d4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039d7:	48 89 d6             	mov    %rdx,%rsi
  8039da:	89 c7                	mov    %eax,%edi
  8039dc:	48 b8 78 2a 80 00 00 	movabs $0x802a78,%rax
  8039e3:	00 00 00 
  8039e6:	ff d0                	callq  *%rax
  8039e8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039eb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039ef:	79 05                	jns    8039f6 <fd2sockid+0x31>
  8039f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039f4:	eb 24                	jmp    803a1a <fd2sockid+0x55>
  8039f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039fa:	8b 10                	mov    (%rax),%edx
  8039fc:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803a03:	00 00 00 
  803a06:	8b 00                	mov    (%rax),%eax
  803a08:	39 c2                	cmp    %eax,%edx
  803a0a:	74 07                	je     803a13 <fd2sockid+0x4e>
  803a0c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803a11:	eb 07                	jmp    803a1a <fd2sockid+0x55>
  803a13:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a17:	8b 40 0c             	mov    0xc(%rax),%eax
  803a1a:	c9                   	leaveq 
  803a1b:	c3                   	retq   

0000000000803a1c <alloc_sockfd>:
  803a1c:	55                   	push   %rbp
  803a1d:	48 89 e5             	mov    %rsp,%rbp
  803a20:	48 83 ec 20          	sub    $0x20,%rsp
  803a24:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a27:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803a2b:	48 89 c7             	mov    %rax,%rdi
  803a2e:	48 b8 e0 29 80 00 00 	movabs $0x8029e0,%rax
  803a35:	00 00 00 
  803a38:	ff d0                	callq  *%rax
  803a3a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a3d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a41:	78 26                	js     803a69 <alloc_sockfd+0x4d>
  803a43:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a47:	ba 07 04 00 00       	mov    $0x407,%edx
  803a4c:	48 89 c6             	mov    %rax,%rsi
  803a4f:	bf 00 00 00 00       	mov    $0x0,%edi
  803a54:	48 b8 42 1d 80 00 00 	movabs $0x801d42,%rax
  803a5b:	00 00 00 
  803a5e:	ff d0                	callq  *%rax
  803a60:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a63:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a67:	79 16                	jns    803a7f <alloc_sockfd+0x63>
  803a69:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a6c:	89 c7                	mov    %eax,%edi
  803a6e:	48 b8 2b 3f 80 00 00 	movabs $0x803f2b,%rax
  803a75:	00 00 00 
  803a78:	ff d0                	callq  *%rax
  803a7a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a7d:	eb 3a                	jmp    803ab9 <alloc_sockfd+0x9d>
  803a7f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a83:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  803a8a:	00 00 00 
  803a8d:	8b 12                	mov    (%rdx),%edx
  803a8f:	89 10                	mov    %edx,(%rax)
  803a91:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a95:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803a9c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803aa0:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803aa3:	89 50 0c             	mov    %edx,0xc(%rax)
  803aa6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803aaa:	48 89 c7             	mov    %rax,%rdi
  803aad:	48 b8 92 29 80 00 00 	movabs $0x802992,%rax
  803ab4:	00 00 00 
  803ab7:	ff d0                	callq  *%rax
  803ab9:	c9                   	leaveq 
  803aba:	c3                   	retq   

0000000000803abb <accept>:
  803abb:	55                   	push   %rbp
  803abc:	48 89 e5             	mov    %rsp,%rbp
  803abf:	48 83 ec 30          	sub    $0x30,%rsp
  803ac3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ac6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803aca:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803ace:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ad1:	89 c7                	mov    %eax,%edi
  803ad3:	48 b8 c5 39 80 00 00 	movabs $0x8039c5,%rax
  803ada:	00 00 00 
  803add:	ff d0                	callq  *%rax
  803adf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ae2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ae6:	79 05                	jns    803aed <accept+0x32>
  803ae8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803aeb:	eb 3b                	jmp    803b28 <accept+0x6d>
  803aed:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803af1:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803af5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803af8:	48 89 ce             	mov    %rcx,%rsi
  803afb:	89 c7                	mov    %eax,%edi
  803afd:	48 b8 08 3e 80 00 00 	movabs $0x803e08,%rax
  803b04:	00 00 00 
  803b07:	ff d0                	callq  *%rax
  803b09:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b0c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b10:	79 05                	jns    803b17 <accept+0x5c>
  803b12:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b15:	eb 11                	jmp    803b28 <accept+0x6d>
  803b17:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b1a:	89 c7                	mov    %eax,%edi
  803b1c:	48 b8 1c 3a 80 00 00 	movabs $0x803a1c,%rax
  803b23:	00 00 00 
  803b26:	ff d0                	callq  *%rax
  803b28:	c9                   	leaveq 
  803b29:	c3                   	retq   

0000000000803b2a <bind>:
  803b2a:	55                   	push   %rbp
  803b2b:	48 89 e5             	mov    %rsp,%rbp
  803b2e:	48 83 ec 20          	sub    $0x20,%rsp
  803b32:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b35:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b39:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803b3c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b3f:	89 c7                	mov    %eax,%edi
  803b41:	48 b8 c5 39 80 00 00 	movabs $0x8039c5,%rax
  803b48:	00 00 00 
  803b4b:	ff d0                	callq  *%rax
  803b4d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b50:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b54:	79 05                	jns    803b5b <bind+0x31>
  803b56:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b59:	eb 1b                	jmp    803b76 <bind+0x4c>
  803b5b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803b5e:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803b62:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b65:	48 89 ce             	mov    %rcx,%rsi
  803b68:	89 c7                	mov    %eax,%edi
  803b6a:	48 b8 87 3e 80 00 00 	movabs $0x803e87,%rax
  803b71:	00 00 00 
  803b74:	ff d0                	callq  *%rax
  803b76:	c9                   	leaveq 
  803b77:	c3                   	retq   

0000000000803b78 <shutdown>:
  803b78:	55                   	push   %rbp
  803b79:	48 89 e5             	mov    %rsp,%rbp
  803b7c:	48 83 ec 20          	sub    $0x20,%rsp
  803b80:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b83:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803b86:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b89:	89 c7                	mov    %eax,%edi
  803b8b:	48 b8 c5 39 80 00 00 	movabs $0x8039c5,%rax
  803b92:	00 00 00 
  803b95:	ff d0                	callq  *%rax
  803b97:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b9a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b9e:	79 05                	jns    803ba5 <shutdown+0x2d>
  803ba0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ba3:	eb 16                	jmp    803bbb <shutdown+0x43>
  803ba5:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803ba8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bab:	89 d6                	mov    %edx,%esi
  803bad:	89 c7                	mov    %eax,%edi
  803baf:	48 b8 eb 3e 80 00 00 	movabs $0x803eeb,%rax
  803bb6:	00 00 00 
  803bb9:	ff d0                	callq  *%rax
  803bbb:	c9                   	leaveq 
  803bbc:	c3                   	retq   

0000000000803bbd <devsock_close>:
  803bbd:	55                   	push   %rbp
  803bbe:	48 89 e5             	mov    %rsp,%rbp
  803bc1:	48 83 ec 10          	sub    $0x10,%rsp
  803bc5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803bc9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803bcd:	48 89 c7             	mov    %rax,%rdi
  803bd0:	48 b8 69 4b 80 00 00 	movabs $0x804b69,%rax
  803bd7:	00 00 00 
  803bda:	ff d0                	callq  *%rax
  803bdc:	83 f8 01             	cmp    $0x1,%eax
  803bdf:	75 17                	jne    803bf8 <devsock_close+0x3b>
  803be1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803be5:	8b 40 0c             	mov    0xc(%rax),%eax
  803be8:	89 c7                	mov    %eax,%edi
  803bea:	48 b8 2b 3f 80 00 00 	movabs $0x803f2b,%rax
  803bf1:	00 00 00 
  803bf4:	ff d0                	callq  *%rax
  803bf6:	eb 05                	jmp    803bfd <devsock_close+0x40>
  803bf8:	b8 00 00 00 00       	mov    $0x0,%eax
  803bfd:	c9                   	leaveq 
  803bfe:	c3                   	retq   

0000000000803bff <connect>:
  803bff:	55                   	push   %rbp
  803c00:	48 89 e5             	mov    %rsp,%rbp
  803c03:	48 83 ec 20          	sub    $0x20,%rsp
  803c07:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c0a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c0e:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803c11:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c14:	89 c7                	mov    %eax,%edi
  803c16:	48 b8 c5 39 80 00 00 	movabs $0x8039c5,%rax
  803c1d:	00 00 00 
  803c20:	ff d0                	callq  *%rax
  803c22:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c25:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c29:	79 05                	jns    803c30 <connect+0x31>
  803c2b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c2e:	eb 1b                	jmp    803c4b <connect+0x4c>
  803c30:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803c33:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803c37:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c3a:	48 89 ce             	mov    %rcx,%rsi
  803c3d:	89 c7                	mov    %eax,%edi
  803c3f:	48 b8 58 3f 80 00 00 	movabs $0x803f58,%rax
  803c46:	00 00 00 
  803c49:	ff d0                	callq  *%rax
  803c4b:	c9                   	leaveq 
  803c4c:	c3                   	retq   

0000000000803c4d <listen>:
  803c4d:	55                   	push   %rbp
  803c4e:	48 89 e5             	mov    %rsp,%rbp
  803c51:	48 83 ec 20          	sub    $0x20,%rsp
  803c55:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c58:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803c5b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c5e:	89 c7                	mov    %eax,%edi
  803c60:	48 b8 c5 39 80 00 00 	movabs $0x8039c5,%rax
  803c67:	00 00 00 
  803c6a:	ff d0                	callq  *%rax
  803c6c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c6f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c73:	79 05                	jns    803c7a <listen+0x2d>
  803c75:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c78:	eb 16                	jmp    803c90 <listen+0x43>
  803c7a:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803c7d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c80:	89 d6                	mov    %edx,%esi
  803c82:	89 c7                	mov    %eax,%edi
  803c84:	48 b8 bc 3f 80 00 00 	movabs $0x803fbc,%rax
  803c8b:	00 00 00 
  803c8e:	ff d0                	callq  *%rax
  803c90:	c9                   	leaveq 
  803c91:	c3                   	retq   

0000000000803c92 <devsock_read>:
  803c92:	55                   	push   %rbp
  803c93:	48 89 e5             	mov    %rsp,%rbp
  803c96:	48 83 ec 20          	sub    $0x20,%rsp
  803c9a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803c9e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803ca2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803ca6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803caa:	89 c2                	mov    %eax,%edx
  803cac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803cb0:	8b 40 0c             	mov    0xc(%rax),%eax
  803cb3:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803cb7:	b9 00 00 00 00       	mov    $0x0,%ecx
  803cbc:	89 c7                	mov    %eax,%edi
  803cbe:	48 b8 fc 3f 80 00 00 	movabs $0x803ffc,%rax
  803cc5:	00 00 00 
  803cc8:	ff d0                	callq  *%rax
  803cca:	c9                   	leaveq 
  803ccb:	c3                   	retq   

0000000000803ccc <devsock_write>:
  803ccc:	55                   	push   %rbp
  803ccd:	48 89 e5             	mov    %rsp,%rbp
  803cd0:	48 83 ec 20          	sub    $0x20,%rsp
  803cd4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803cd8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803cdc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803ce0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803ce4:	89 c2                	mov    %eax,%edx
  803ce6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803cea:	8b 40 0c             	mov    0xc(%rax),%eax
  803ced:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803cf1:	b9 00 00 00 00       	mov    $0x0,%ecx
  803cf6:	89 c7                	mov    %eax,%edi
  803cf8:	48 b8 c8 40 80 00 00 	movabs $0x8040c8,%rax
  803cff:	00 00 00 
  803d02:	ff d0                	callq  *%rax
  803d04:	c9                   	leaveq 
  803d05:	c3                   	retq   

0000000000803d06 <devsock_stat>:
  803d06:	55                   	push   %rbp
  803d07:	48 89 e5             	mov    %rsp,%rbp
  803d0a:	48 83 ec 10          	sub    $0x10,%rsp
  803d0e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803d12:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803d16:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d1a:	48 be 52 55 80 00 00 	movabs $0x805552,%rsi
  803d21:	00 00 00 
  803d24:	48 89 c7             	mov    %rax,%rdi
  803d27:	48 b8 12 14 80 00 00 	movabs $0x801412,%rax
  803d2e:	00 00 00 
  803d31:	ff d0                	callq  *%rax
  803d33:	b8 00 00 00 00       	mov    $0x0,%eax
  803d38:	c9                   	leaveq 
  803d39:	c3                   	retq   

0000000000803d3a <socket>:
  803d3a:	55                   	push   %rbp
  803d3b:	48 89 e5             	mov    %rsp,%rbp
  803d3e:	48 83 ec 20          	sub    $0x20,%rsp
  803d42:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d45:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803d48:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803d4b:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803d4e:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803d51:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d54:	89 ce                	mov    %ecx,%esi
  803d56:	89 c7                	mov    %eax,%edi
  803d58:	48 b8 80 41 80 00 00 	movabs $0x804180,%rax
  803d5f:	00 00 00 
  803d62:	ff d0                	callq  *%rax
  803d64:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d67:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d6b:	79 05                	jns    803d72 <socket+0x38>
  803d6d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d70:	eb 11                	jmp    803d83 <socket+0x49>
  803d72:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d75:	89 c7                	mov    %eax,%edi
  803d77:	48 b8 1c 3a 80 00 00 	movabs $0x803a1c,%rax
  803d7e:	00 00 00 
  803d81:	ff d0                	callq  *%rax
  803d83:	c9                   	leaveq 
  803d84:	c3                   	retq   

0000000000803d85 <nsipc>:
  803d85:	55                   	push   %rbp
  803d86:	48 89 e5             	mov    %rsp,%rbp
  803d89:	48 83 ec 10          	sub    $0x10,%rsp
  803d8d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d90:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803d97:	00 00 00 
  803d9a:	8b 00                	mov    (%rax),%eax
  803d9c:	85 c0                	test   %eax,%eax
  803d9e:	75 1f                	jne    803dbf <nsipc+0x3a>
  803da0:	bf 02 00 00 00       	mov    $0x2,%edi
  803da5:	48 b8 21 29 80 00 00 	movabs $0x802921,%rax
  803dac:	00 00 00 
  803daf:	ff d0                	callq  *%rax
  803db1:	89 c2                	mov    %eax,%edx
  803db3:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803dba:	00 00 00 
  803dbd:	89 10                	mov    %edx,(%rax)
  803dbf:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803dc6:	00 00 00 
  803dc9:	8b 00                	mov    (%rax),%eax
  803dcb:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803dce:	b9 07 00 00 00       	mov    $0x7,%ecx
  803dd3:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803dda:	00 00 00 
  803ddd:	89 c7                	mov    %eax,%edi
  803ddf:	48 b8 17 28 80 00 00 	movabs $0x802817,%rax
  803de6:	00 00 00 
  803de9:	ff d0                	callq  *%rax
  803deb:	ba 00 00 00 00       	mov    $0x0,%edx
  803df0:	be 00 00 00 00       	mov    $0x0,%esi
  803df5:	bf 00 00 00 00       	mov    $0x0,%edi
  803dfa:	48 b8 56 27 80 00 00 	movabs $0x802756,%rax
  803e01:	00 00 00 
  803e04:	ff d0                	callq  *%rax
  803e06:	c9                   	leaveq 
  803e07:	c3                   	retq   

0000000000803e08 <nsipc_accept>:
  803e08:	55                   	push   %rbp
  803e09:	48 89 e5             	mov    %rsp,%rbp
  803e0c:	48 83 ec 30          	sub    $0x30,%rsp
  803e10:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e13:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803e17:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803e1b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e22:	00 00 00 
  803e25:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803e28:	89 10                	mov    %edx,(%rax)
  803e2a:	bf 01 00 00 00       	mov    $0x1,%edi
  803e2f:	48 b8 85 3d 80 00 00 	movabs $0x803d85,%rax
  803e36:	00 00 00 
  803e39:	ff d0                	callq  *%rax
  803e3b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e3e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e42:	78 3e                	js     803e82 <nsipc_accept+0x7a>
  803e44:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e4b:	00 00 00 
  803e4e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803e52:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e56:	8b 40 10             	mov    0x10(%rax),%eax
  803e59:	89 c2                	mov    %eax,%edx
  803e5b:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803e5f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e63:	48 89 ce             	mov    %rcx,%rsi
  803e66:	48 89 c7             	mov    %rax,%rdi
  803e69:	48 b8 37 17 80 00 00 	movabs $0x801737,%rax
  803e70:	00 00 00 
  803e73:	ff d0                	callq  *%rax
  803e75:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e79:	8b 50 10             	mov    0x10(%rax),%edx
  803e7c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e80:	89 10                	mov    %edx,(%rax)
  803e82:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e85:	c9                   	leaveq 
  803e86:	c3                   	retq   

0000000000803e87 <nsipc_bind>:
  803e87:	55                   	push   %rbp
  803e88:	48 89 e5             	mov    %rsp,%rbp
  803e8b:	48 83 ec 10          	sub    $0x10,%rsp
  803e8f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e92:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803e96:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803e99:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ea0:	00 00 00 
  803ea3:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ea6:	89 10                	mov    %edx,(%rax)
  803ea8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803eab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803eaf:	48 89 c6             	mov    %rax,%rsi
  803eb2:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803eb9:	00 00 00 
  803ebc:	48 b8 37 17 80 00 00 	movabs $0x801737,%rax
  803ec3:	00 00 00 
  803ec6:	ff d0                	callq  *%rax
  803ec8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ecf:	00 00 00 
  803ed2:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ed5:	89 50 14             	mov    %edx,0x14(%rax)
  803ed8:	bf 02 00 00 00       	mov    $0x2,%edi
  803edd:	48 b8 85 3d 80 00 00 	movabs $0x803d85,%rax
  803ee4:	00 00 00 
  803ee7:	ff d0                	callq  *%rax
  803ee9:	c9                   	leaveq 
  803eea:	c3                   	retq   

0000000000803eeb <nsipc_shutdown>:
  803eeb:	55                   	push   %rbp
  803eec:	48 89 e5             	mov    %rsp,%rbp
  803eef:	48 83 ec 10          	sub    $0x10,%rsp
  803ef3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ef6:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803ef9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f00:	00 00 00 
  803f03:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803f06:	89 10                	mov    %edx,(%rax)
  803f08:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f0f:	00 00 00 
  803f12:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f15:	89 50 04             	mov    %edx,0x4(%rax)
  803f18:	bf 03 00 00 00       	mov    $0x3,%edi
  803f1d:	48 b8 85 3d 80 00 00 	movabs $0x803d85,%rax
  803f24:	00 00 00 
  803f27:	ff d0                	callq  *%rax
  803f29:	c9                   	leaveq 
  803f2a:	c3                   	retq   

0000000000803f2b <nsipc_close>:
  803f2b:	55                   	push   %rbp
  803f2c:	48 89 e5             	mov    %rsp,%rbp
  803f2f:	48 83 ec 10          	sub    $0x10,%rsp
  803f33:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f36:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f3d:	00 00 00 
  803f40:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803f43:	89 10                	mov    %edx,(%rax)
  803f45:	bf 04 00 00 00       	mov    $0x4,%edi
  803f4a:	48 b8 85 3d 80 00 00 	movabs $0x803d85,%rax
  803f51:	00 00 00 
  803f54:	ff d0                	callq  *%rax
  803f56:	c9                   	leaveq 
  803f57:	c3                   	retq   

0000000000803f58 <nsipc_connect>:
  803f58:	55                   	push   %rbp
  803f59:	48 89 e5             	mov    %rsp,%rbp
  803f5c:	48 83 ec 10          	sub    $0x10,%rsp
  803f60:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f63:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803f67:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803f6a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f71:	00 00 00 
  803f74:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803f77:	89 10                	mov    %edx,(%rax)
  803f79:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f7c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f80:	48 89 c6             	mov    %rax,%rsi
  803f83:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803f8a:	00 00 00 
  803f8d:	48 b8 37 17 80 00 00 	movabs $0x801737,%rax
  803f94:	00 00 00 
  803f97:	ff d0                	callq  *%rax
  803f99:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fa0:	00 00 00 
  803fa3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803fa6:	89 50 14             	mov    %edx,0x14(%rax)
  803fa9:	bf 05 00 00 00       	mov    $0x5,%edi
  803fae:	48 b8 85 3d 80 00 00 	movabs $0x803d85,%rax
  803fb5:	00 00 00 
  803fb8:	ff d0                	callq  *%rax
  803fba:	c9                   	leaveq 
  803fbb:	c3                   	retq   

0000000000803fbc <nsipc_listen>:
  803fbc:	55                   	push   %rbp
  803fbd:	48 89 e5             	mov    %rsp,%rbp
  803fc0:	48 83 ec 10          	sub    $0x10,%rsp
  803fc4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803fc7:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803fca:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fd1:	00 00 00 
  803fd4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803fd7:	89 10                	mov    %edx,(%rax)
  803fd9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fe0:	00 00 00 
  803fe3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803fe6:	89 50 04             	mov    %edx,0x4(%rax)
  803fe9:	bf 06 00 00 00       	mov    $0x6,%edi
  803fee:	48 b8 85 3d 80 00 00 	movabs $0x803d85,%rax
  803ff5:	00 00 00 
  803ff8:	ff d0                	callq  *%rax
  803ffa:	c9                   	leaveq 
  803ffb:	c3                   	retq   

0000000000803ffc <nsipc_recv>:
  803ffc:	55                   	push   %rbp
  803ffd:	48 89 e5             	mov    %rsp,%rbp
  804000:	48 83 ec 30          	sub    $0x30,%rsp
  804004:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804007:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80400b:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80400e:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804011:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804018:	00 00 00 
  80401b:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80401e:	89 10                	mov    %edx,(%rax)
  804020:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804027:	00 00 00 
  80402a:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80402d:	89 50 04             	mov    %edx,0x4(%rax)
  804030:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804037:	00 00 00 
  80403a:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80403d:	89 50 08             	mov    %edx,0x8(%rax)
  804040:	bf 07 00 00 00       	mov    $0x7,%edi
  804045:	48 b8 85 3d 80 00 00 	movabs $0x803d85,%rax
  80404c:	00 00 00 
  80404f:	ff d0                	callq  *%rax
  804051:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804054:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804058:	78 69                	js     8040c3 <nsipc_recv+0xc7>
  80405a:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  804061:	7f 08                	jg     80406b <nsipc_recv+0x6f>
  804063:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804066:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  804069:	7e 35                	jle    8040a0 <nsipc_recv+0xa4>
  80406b:	48 b9 59 55 80 00 00 	movabs $0x805559,%rcx
  804072:	00 00 00 
  804075:	48 ba 6e 55 80 00 00 	movabs $0x80556e,%rdx
  80407c:	00 00 00 
  80407f:	be 62 00 00 00       	mov    $0x62,%esi
  804084:	48 bf 83 55 80 00 00 	movabs $0x805583,%rdi
  80408b:	00 00 00 
  80408e:	b8 00 00 00 00       	mov    $0x0,%eax
  804093:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  80409a:	00 00 00 
  80409d:	41 ff d0             	callq  *%r8
  8040a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040a3:	48 63 d0             	movslq %eax,%rdx
  8040a6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8040aa:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  8040b1:	00 00 00 
  8040b4:	48 89 c7             	mov    %rax,%rdi
  8040b7:	48 b8 37 17 80 00 00 	movabs $0x801737,%rax
  8040be:	00 00 00 
  8040c1:	ff d0                	callq  *%rax
  8040c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040c6:	c9                   	leaveq 
  8040c7:	c3                   	retq   

00000000008040c8 <nsipc_send>:
  8040c8:	55                   	push   %rbp
  8040c9:	48 89 e5             	mov    %rsp,%rbp
  8040cc:	48 83 ec 20          	sub    $0x20,%rsp
  8040d0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8040d3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8040d7:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8040da:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8040dd:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040e4:	00 00 00 
  8040e7:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8040ea:	89 10                	mov    %edx,(%rax)
  8040ec:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  8040f3:	7e 35                	jle    80412a <nsipc_send+0x62>
  8040f5:	48 b9 92 55 80 00 00 	movabs $0x805592,%rcx
  8040fc:	00 00 00 
  8040ff:	48 ba 6e 55 80 00 00 	movabs $0x80556e,%rdx
  804106:	00 00 00 
  804109:	be 6d 00 00 00       	mov    $0x6d,%esi
  80410e:	48 bf 83 55 80 00 00 	movabs $0x805583,%rdi
  804115:	00 00 00 
  804118:	b8 00 00 00 00       	mov    $0x0,%eax
  80411d:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  804124:	00 00 00 
  804127:	41 ff d0             	callq  *%r8
  80412a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80412d:	48 63 d0             	movslq %eax,%rdx
  804130:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804134:	48 89 c6             	mov    %rax,%rsi
  804137:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  80413e:	00 00 00 
  804141:	48 b8 37 17 80 00 00 	movabs $0x801737,%rax
  804148:	00 00 00 
  80414b:	ff d0                	callq  *%rax
  80414d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804154:	00 00 00 
  804157:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80415a:	89 50 04             	mov    %edx,0x4(%rax)
  80415d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804164:	00 00 00 
  804167:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80416a:	89 50 08             	mov    %edx,0x8(%rax)
  80416d:	bf 08 00 00 00       	mov    $0x8,%edi
  804172:	48 b8 85 3d 80 00 00 	movabs $0x803d85,%rax
  804179:	00 00 00 
  80417c:	ff d0                	callq  *%rax
  80417e:	c9                   	leaveq 
  80417f:	c3                   	retq   

0000000000804180 <nsipc_socket>:
  804180:	55                   	push   %rbp
  804181:	48 89 e5             	mov    %rsp,%rbp
  804184:	48 83 ec 10          	sub    $0x10,%rsp
  804188:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80418b:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80418e:	89 55 f4             	mov    %edx,-0xc(%rbp)
  804191:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804198:	00 00 00 
  80419b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80419e:	89 10                	mov    %edx,(%rax)
  8041a0:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8041a7:	00 00 00 
  8041aa:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8041ad:	89 50 04             	mov    %edx,0x4(%rax)
  8041b0:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8041b7:	00 00 00 
  8041ba:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8041bd:	89 50 08             	mov    %edx,0x8(%rax)
  8041c0:	bf 09 00 00 00       	mov    $0x9,%edi
  8041c5:	48 b8 85 3d 80 00 00 	movabs $0x803d85,%rax
  8041cc:	00 00 00 
  8041cf:	ff d0                	callq  *%rax
  8041d1:	c9                   	leaveq 
  8041d2:	c3                   	retq   

00000000008041d3 <pipe>:
  8041d3:	55                   	push   %rbp
  8041d4:	48 89 e5             	mov    %rsp,%rbp
  8041d7:	53                   	push   %rbx
  8041d8:	48 83 ec 38          	sub    $0x38,%rsp
  8041dc:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8041e0:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8041e4:	48 89 c7             	mov    %rax,%rdi
  8041e7:	48 b8 e0 29 80 00 00 	movabs $0x8029e0,%rax
  8041ee:	00 00 00 
  8041f1:	ff d0                	callq  *%rax
  8041f3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8041f6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8041fa:	0f 88 bf 01 00 00    	js     8043bf <pipe+0x1ec>
  804200:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804204:	ba 07 04 00 00       	mov    $0x407,%edx
  804209:	48 89 c6             	mov    %rax,%rsi
  80420c:	bf 00 00 00 00       	mov    $0x0,%edi
  804211:	48 b8 42 1d 80 00 00 	movabs $0x801d42,%rax
  804218:	00 00 00 
  80421b:	ff d0                	callq  *%rax
  80421d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804220:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804224:	0f 88 95 01 00 00    	js     8043bf <pipe+0x1ec>
  80422a:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80422e:	48 89 c7             	mov    %rax,%rdi
  804231:	48 b8 e0 29 80 00 00 	movabs $0x8029e0,%rax
  804238:	00 00 00 
  80423b:	ff d0                	callq  *%rax
  80423d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804240:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804244:	0f 88 5d 01 00 00    	js     8043a7 <pipe+0x1d4>
  80424a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80424e:	ba 07 04 00 00       	mov    $0x407,%edx
  804253:	48 89 c6             	mov    %rax,%rsi
  804256:	bf 00 00 00 00       	mov    $0x0,%edi
  80425b:	48 b8 42 1d 80 00 00 	movabs $0x801d42,%rax
  804262:	00 00 00 
  804265:	ff d0                	callq  *%rax
  804267:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80426a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80426e:	0f 88 33 01 00 00    	js     8043a7 <pipe+0x1d4>
  804274:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804278:	48 89 c7             	mov    %rax,%rdi
  80427b:	48 b8 b5 29 80 00 00 	movabs $0x8029b5,%rax
  804282:	00 00 00 
  804285:	ff d0                	callq  *%rax
  804287:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80428b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80428f:	ba 07 04 00 00       	mov    $0x407,%edx
  804294:	48 89 c6             	mov    %rax,%rsi
  804297:	bf 00 00 00 00       	mov    $0x0,%edi
  80429c:	48 b8 42 1d 80 00 00 	movabs $0x801d42,%rax
  8042a3:	00 00 00 
  8042a6:	ff d0                	callq  *%rax
  8042a8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8042ab:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8042af:	0f 88 d9 00 00 00    	js     80438e <pipe+0x1bb>
  8042b5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042b9:	48 89 c7             	mov    %rax,%rdi
  8042bc:	48 b8 b5 29 80 00 00 	movabs $0x8029b5,%rax
  8042c3:	00 00 00 
  8042c6:	ff d0                	callq  *%rax
  8042c8:	48 89 c2             	mov    %rax,%rdx
  8042cb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8042cf:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8042d5:	48 89 d1             	mov    %rdx,%rcx
  8042d8:	ba 00 00 00 00       	mov    $0x0,%edx
  8042dd:	48 89 c6             	mov    %rax,%rsi
  8042e0:	bf 00 00 00 00       	mov    $0x0,%edi
  8042e5:	48 b8 94 1d 80 00 00 	movabs $0x801d94,%rax
  8042ec:	00 00 00 
  8042ef:	ff d0                	callq  *%rax
  8042f1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8042f4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8042f8:	78 79                	js     804373 <pipe+0x1a0>
  8042fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042fe:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804305:	00 00 00 
  804308:	8b 12                	mov    (%rdx),%edx
  80430a:	89 10                	mov    %edx,(%rax)
  80430c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804310:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  804317:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80431b:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804322:	00 00 00 
  804325:	8b 12                	mov    (%rdx),%edx
  804327:	89 10                	mov    %edx,(%rax)
  804329:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80432d:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  804334:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804338:	48 89 c7             	mov    %rax,%rdi
  80433b:	48 b8 92 29 80 00 00 	movabs $0x802992,%rax
  804342:	00 00 00 
  804345:	ff d0                	callq  *%rax
  804347:	89 c2                	mov    %eax,%edx
  804349:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80434d:	89 10                	mov    %edx,(%rax)
  80434f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804353:	48 8d 58 04          	lea    0x4(%rax),%rbx
  804357:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80435b:	48 89 c7             	mov    %rax,%rdi
  80435e:	48 b8 92 29 80 00 00 	movabs $0x802992,%rax
  804365:	00 00 00 
  804368:	ff d0                	callq  *%rax
  80436a:	89 03                	mov    %eax,(%rbx)
  80436c:	b8 00 00 00 00       	mov    $0x0,%eax
  804371:	eb 4f                	jmp    8043c2 <pipe+0x1ef>
  804373:	90                   	nop
  804374:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804378:	48 89 c6             	mov    %rax,%rsi
  80437b:	bf 00 00 00 00       	mov    $0x0,%edi
  804380:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  804387:	00 00 00 
  80438a:	ff d0                	callq  *%rax
  80438c:	eb 01                	jmp    80438f <pipe+0x1bc>
  80438e:	90                   	nop
  80438f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804393:	48 89 c6             	mov    %rax,%rsi
  804396:	bf 00 00 00 00       	mov    $0x0,%edi
  80439b:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  8043a2:	00 00 00 
  8043a5:	ff d0                	callq  *%rax
  8043a7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043ab:	48 89 c6             	mov    %rax,%rsi
  8043ae:	bf 00 00 00 00       	mov    $0x0,%edi
  8043b3:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  8043ba:	00 00 00 
  8043bd:	ff d0                	callq  *%rax
  8043bf:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8043c2:	48 83 c4 38          	add    $0x38,%rsp
  8043c6:	5b                   	pop    %rbx
  8043c7:	5d                   	pop    %rbp
  8043c8:	c3                   	retq   

00000000008043c9 <_pipeisclosed>:
  8043c9:	55                   	push   %rbp
  8043ca:	48 89 e5             	mov    %rsp,%rbp
  8043cd:	53                   	push   %rbx
  8043ce:	48 83 ec 28          	sub    $0x28,%rsp
  8043d2:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8043d6:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8043da:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8043e1:	00 00 00 
  8043e4:	48 8b 00             	mov    (%rax),%rax
  8043e7:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  8043ed:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8043f0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043f4:	48 89 c7             	mov    %rax,%rdi
  8043f7:	48 b8 69 4b 80 00 00 	movabs $0x804b69,%rax
  8043fe:	00 00 00 
  804401:	ff d0                	callq  *%rax
  804403:	89 c3                	mov    %eax,%ebx
  804405:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804409:	48 89 c7             	mov    %rax,%rdi
  80440c:	48 b8 69 4b 80 00 00 	movabs $0x804b69,%rax
  804413:	00 00 00 
  804416:	ff d0                	callq  *%rax
  804418:	39 c3                	cmp    %eax,%ebx
  80441a:	0f 94 c0             	sete   %al
  80441d:	0f b6 c0             	movzbl %al,%eax
  804420:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804423:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  80442a:	00 00 00 
  80442d:	48 8b 00             	mov    (%rax),%rax
  804430:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  804436:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804439:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80443c:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80443f:	75 05                	jne    804446 <_pipeisclosed+0x7d>
  804441:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804444:	eb 4a                	jmp    804490 <_pipeisclosed+0xc7>
  804446:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804449:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80444c:	74 8c                	je     8043da <_pipeisclosed+0x11>
  80444e:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  804452:	75 86                	jne    8043da <_pipeisclosed+0x11>
  804454:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  80445b:	00 00 00 
  80445e:	48 8b 00             	mov    (%rax),%rax
  804461:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804467:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80446a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80446d:	89 c6                	mov    %eax,%esi
  80446f:	48 bf a3 55 80 00 00 	movabs $0x8055a3,%rdi
  804476:	00 00 00 
  804479:	b8 00 00 00 00       	mov    $0x0,%eax
  80447e:	49 b8 82 08 80 00 00 	movabs $0x800882,%r8
  804485:	00 00 00 
  804488:	41 ff d0             	callq  *%r8
  80448b:	e9 4a ff ff ff       	jmpq   8043da <_pipeisclosed+0x11>
  804490:	48 83 c4 28          	add    $0x28,%rsp
  804494:	5b                   	pop    %rbx
  804495:	5d                   	pop    %rbp
  804496:	c3                   	retq   

0000000000804497 <pipeisclosed>:
  804497:	55                   	push   %rbp
  804498:	48 89 e5             	mov    %rsp,%rbp
  80449b:	48 83 ec 30          	sub    $0x30,%rsp
  80449f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8044a2:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8044a6:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8044a9:	48 89 d6             	mov    %rdx,%rsi
  8044ac:	89 c7                	mov    %eax,%edi
  8044ae:	48 b8 78 2a 80 00 00 	movabs $0x802a78,%rax
  8044b5:	00 00 00 
  8044b8:	ff d0                	callq  *%rax
  8044ba:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8044bd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8044c1:	79 05                	jns    8044c8 <pipeisclosed+0x31>
  8044c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044c6:	eb 31                	jmp    8044f9 <pipeisclosed+0x62>
  8044c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8044cc:	48 89 c7             	mov    %rax,%rdi
  8044cf:	48 b8 b5 29 80 00 00 	movabs $0x8029b5,%rax
  8044d6:	00 00 00 
  8044d9:	ff d0                	callq  *%rax
  8044db:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8044df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8044e3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8044e7:	48 89 d6             	mov    %rdx,%rsi
  8044ea:	48 89 c7             	mov    %rax,%rdi
  8044ed:	48 b8 c9 43 80 00 00 	movabs $0x8043c9,%rax
  8044f4:	00 00 00 
  8044f7:	ff d0                	callq  *%rax
  8044f9:	c9                   	leaveq 
  8044fa:	c3                   	retq   

00000000008044fb <devpipe_read>:
  8044fb:	55                   	push   %rbp
  8044fc:	48 89 e5             	mov    %rsp,%rbp
  8044ff:	48 83 ec 40          	sub    $0x40,%rsp
  804503:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804507:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80450b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80450f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804513:	48 89 c7             	mov    %rax,%rdi
  804516:	48 b8 b5 29 80 00 00 	movabs $0x8029b5,%rax
  80451d:	00 00 00 
  804520:	ff d0                	callq  *%rax
  804522:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804526:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80452a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80452e:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804535:	00 
  804536:	e9 90 00 00 00       	jmpq   8045cb <devpipe_read+0xd0>
  80453b:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804540:	74 09                	je     80454b <devpipe_read+0x50>
  804542:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804546:	e9 8e 00 00 00       	jmpq   8045d9 <devpipe_read+0xde>
  80454b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80454f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804553:	48 89 d6             	mov    %rdx,%rsi
  804556:	48 89 c7             	mov    %rax,%rdi
  804559:	48 b8 c9 43 80 00 00 	movabs $0x8043c9,%rax
  804560:	00 00 00 
  804563:	ff d0                	callq  *%rax
  804565:	85 c0                	test   %eax,%eax
  804567:	74 07                	je     804570 <devpipe_read+0x75>
  804569:	b8 00 00 00 00       	mov    $0x0,%eax
  80456e:	eb 69                	jmp    8045d9 <devpipe_read+0xde>
  804570:	48 b8 05 1d 80 00 00 	movabs $0x801d05,%rax
  804577:	00 00 00 
  80457a:	ff d0                	callq  *%rax
  80457c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804580:	8b 10                	mov    (%rax),%edx
  804582:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804586:	8b 40 04             	mov    0x4(%rax),%eax
  804589:	39 c2                	cmp    %eax,%edx
  80458b:	74 ae                	je     80453b <devpipe_read+0x40>
  80458d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804591:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804595:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  804599:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80459d:	8b 00                	mov    (%rax),%eax
  80459f:	99                   	cltd   
  8045a0:	c1 ea 1b             	shr    $0x1b,%edx
  8045a3:	01 d0                	add    %edx,%eax
  8045a5:	83 e0 1f             	and    $0x1f,%eax
  8045a8:	29 d0                	sub    %edx,%eax
  8045aa:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8045ae:	48 98                	cltq   
  8045b0:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8045b5:	88 01                	mov    %al,(%rcx)
  8045b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045bb:	8b 00                	mov    (%rax),%eax
  8045bd:	8d 50 01             	lea    0x1(%rax),%edx
  8045c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045c4:	89 10                	mov    %edx,(%rax)
  8045c6:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8045cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045cf:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8045d3:	72 a7                	jb     80457c <devpipe_read+0x81>
  8045d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045d9:	c9                   	leaveq 
  8045da:	c3                   	retq   

00000000008045db <devpipe_write>:
  8045db:	55                   	push   %rbp
  8045dc:	48 89 e5             	mov    %rsp,%rbp
  8045df:	48 83 ec 40          	sub    $0x40,%rsp
  8045e3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8045e7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8045eb:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8045ef:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045f3:	48 89 c7             	mov    %rax,%rdi
  8045f6:	48 b8 b5 29 80 00 00 	movabs $0x8029b5,%rax
  8045fd:	00 00 00 
  804600:	ff d0                	callq  *%rax
  804602:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804606:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80460a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80460e:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804615:	00 
  804616:	e9 8f 00 00 00       	jmpq   8046aa <devpipe_write+0xcf>
  80461b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80461f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804623:	48 89 d6             	mov    %rdx,%rsi
  804626:	48 89 c7             	mov    %rax,%rdi
  804629:	48 b8 c9 43 80 00 00 	movabs $0x8043c9,%rax
  804630:	00 00 00 
  804633:	ff d0                	callq  *%rax
  804635:	85 c0                	test   %eax,%eax
  804637:	74 07                	je     804640 <devpipe_write+0x65>
  804639:	b8 00 00 00 00       	mov    $0x0,%eax
  80463e:	eb 78                	jmp    8046b8 <devpipe_write+0xdd>
  804640:	48 b8 05 1d 80 00 00 	movabs $0x801d05,%rax
  804647:	00 00 00 
  80464a:	ff d0                	callq  *%rax
  80464c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804650:	8b 40 04             	mov    0x4(%rax),%eax
  804653:	48 63 d0             	movslq %eax,%rdx
  804656:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80465a:	8b 00                	mov    (%rax),%eax
  80465c:	48 98                	cltq   
  80465e:	48 83 c0 20          	add    $0x20,%rax
  804662:	48 39 c2             	cmp    %rax,%rdx
  804665:	73 b4                	jae    80461b <devpipe_write+0x40>
  804667:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80466b:	8b 40 04             	mov    0x4(%rax),%eax
  80466e:	99                   	cltd   
  80466f:	c1 ea 1b             	shr    $0x1b,%edx
  804672:	01 d0                	add    %edx,%eax
  804674:	83 e0 1f             	and    $0x1f,%eax
  804677:	29 d0                	sub    %edx,%eax
  804679:	89 c6                	mov    %eax,%esi
  80467b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80467f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804683:	48 01 d0             	add    %rdx,%rax
  804686:	0f b6 08             	movzbl (%rax),%ecx
  804689:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80468d:	48 63 c6             	movslq %esi,%rax
  804690:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  804694:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804698:	8b 40 04             	mov    0x4(%rax),%eax
  80469b:	8d 50 01             	lea    0x1(%rax),%edx
  80469e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8046a2:	89 50 04             	mov    %edx,0x4(%rax)
  8046a5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8046aa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046ae:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8046b2:	72 98                	jb     80464c <devpipe_write+0x71>
  8046b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046b8:	c9                   	leaveq 
  8046b9:	c3                   	retq   

00000000008046ba <devpipe_stat>:
  8046ba:	55                   	push   %rbp
  8046bb:	48 89 e5             	mov    %rsp,%rbp
  8046be:	48 83 ec 20          	sub    $0x20,%rsp
  8046c2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8046c6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8046ca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8046ce:	48 89 c7             	mov    %rax,%rdi
  8046d1:	48 b8 b5 29 80 00 00 	movabs $0x8029b5,%rax
  8046d8:	00 00 00 
  8046db:	ff d0                	callq  *%rax
  8046dd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8046e1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046e5:	48 be b6 55 80 00 00 	movabs $0x8055b6,%rsi
  8046ec:	00 00 00 
  8046ef:	48 89 c7             	mov    %rax,%rdi
  8046f2:	48 b8 12 14 80 00 00 	movabs $0x801412,%rax
  8046f9:	00 00 00 
  8046fc:	ff d0                	callq  *%rax
  8046fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804702:	8b 50 04             	mov    0x4(%rax),%edx
  804705:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804709:	8b 00                	mov    (%rax),%eax
  80470b:	29 c2                	sub    %eax,%edx
  80470d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804711:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804717:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80471b:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804722:	00 00 00 
  804725:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804729:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  804730:	00 00 00 
  804733:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  80473a:	b8 00 00 00 00       	mov    $0x0,%eax
  80473f:	c9                   	leaveq 
  804740:	c3                   	retq   

0000000000804741 <devpipe_close>:
  804741:	55                   	push   %rbp
  804742:	48 89 e5             	mov    %rsp,%rbp
  804745:	48 83 ec 10          	sub    $0x10,%rsp
  804749:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80474d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804751:	48 89 c6             	mov    %rax,%rsi
  804754:	bf 00 00 00 00       	mov    $0x0,%edi
  804759:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  804760:	00 00 00 
  804763:	ff d0                	callq  *%rax
  804765:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804769:	48 89 c7             	mov    %rax,%rdi
  80476c:	48 b8 b5 29 80 00 00 	movabs $0x8029b5,%rax
  804773:	00 00 00 
  804776:	ff d0                	callq  *%rax
  804778:	48 89 c6             	mov    %rax,%rsi
  80477b:	bf 00 00 00 00       	mov    $0x0,%edi
  804780:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  804787:	00 00 00 
  80478a:	ff d0                	callq  *%rax
  80478c:	c9                   	leaveq 
  80478d:	c3                   	retq   

000000000080478e <cputchar>:
  80478e:	55                   	push   %rbp
  80478f:	48 89 e5             	mov    %rsp,%rbp
  804792:	48 83 ec 20          	sub    $0x20,%rsp
  804796:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804799:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80479c:	88 45 ff             	mov    %al,-0x1(%rbp)
  80479f:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  8047a3:	be 01 00 00 00       	mov    $0x1,%esi
  8047a8:	48 89 c7             	mov    %rax,%rdi
  8047ab:	48 b8 fa 1b 80 00 00 	movabs $0x801bfa,%rax
  8047b2:	00 00 00 
  8047b5:	ff d0                	callq  *%rax
  8047b7:	90                   	nop
  8047b8:	c9                   	leaveq 
  8047b9:	c3                   	retq   

00000000008047ba <getchar>:
  8047ba:	55                   	push   %rbp
  8047bb:	48 89 e5             	mov    %rsp,%rbp
  8047be:	48 83 ec 10          	sub    $0x10,%rsp
  8047c2:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8047c6:	ba 01 00 00 00       	mov    $0x1,%edx
  8047cb:	48 89 c6             	mov    %rax,%rsi
  8047ce:	bf 00 00 00 00       	mov    $0x0,%edi
  8047d3:	48 b8 ad 2e 80 00 00 	movabs $0x802ead,%rax
  8047da:	00 00 00 
  8047dd:	ff d0                	callq  *%rax
  8047df:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8047e2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8047e6:	79 05                	jns    8047ed <getchar+0x33>
  8047e8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047eb:	eb 14                	jmp    804801 <getchar+0x47>
  8047ed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8047f1:	7f 07                	jg     8047fa <getchar+0x40>
  8047f3:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  8047f8:	eb 07                	jmp    804801 <getchar+0x47>
  8047fa:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  8047fe:	0f b6 c0             	movzbl %al,%eax
  804801:	c9                   	leaveq 
  804802:	c3                   	retq   

0000000000804803 <iscons>:
  804803:	55                   	push   %rbp
  804804:	48 89 e5             	mov    %rsp,%rbp
  804807:	48 83 ec 20          	sub    $0x20,%rsp
  80480b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80480e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804812:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804815:	48 89 d6             	mov    %rdx,%rsi
  804818:	89 c7                	mov    %eax,%edi
  80481a:	48 b8 78 2a 80 00 00 	movabs $0x802a78,%rax
  804821:	00 00 00 
  804824:	ff d0                	callq  *%rax
  804826:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804829:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80482d:	79 05                	jns    804834 <iscons+0x31>
  80482f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804832:	eb 1a                	jmp    80484e <iscons+0x4b>
  804834:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804838:	8b 10                	mov    (%rax),%edx
  80483a:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  804841:	00 00 00 
  804844:	8b 00                	mov    (%rax),%eax
  804846:	39 c2                	cmp    %eax,%edx
  804848:	0f 94 c0             	sete   %al
  80484b:	0f b6 c0             	movzbl %al,%eax
  80484e:	c9                   	leaveq 
  80484f:	c3                   	retq   

0000000000804850 <opencons>:
  804850:	55                   	push   %rbp
  804851:	48 89 e5             	mov    %rsp,%rbp
  804854:	48 83 ec 10          	sub    $0x10,%rsp
  804858:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80485c:	48 89 c7             	mov    %rax,%rdi
  80485f:	48 b8 e0 29 80 00 00 	movabs $0x8029e0,%rax
  804866:	00 00 00 
  804869:	ff d0                	callq  *%rax
  80486b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80486e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804872:	79 05                	jns    804879 <opencons+0x29>
  804874:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804877:	eb 5b                	jmp    8048d4 <opencons+0x84>
  804879:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80487d:	ba 07 04 00 00       	mov    $0x407,%edx
  804882:	48 89 c6             	mov    %rax,%rsi
  804885:	bf 00 00 00 00       	mov    $0x0,%edi
  80488a:	48 b8 42 1d 80 00 00 	movabs $0x801d42,%rax
  804891:	00 00 00 
  804894:	ff d0                	callq  *%rax
  804896:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804899:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80489d:	79 05                	jns    8048a4 <opencons+0x54>
  80489f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048a2:	eb 30                	jmp    8048d4 <opencons+0x84>
  8048a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8048a8:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  8048af:	00 00 00 
  8048b2:	8b 12                	mov    (%rdx),%edx
  8048b4:	89 10                	mov    %edx,(%rax)
  8048b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8048ba:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8048c1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8048c5:	48 89 c7             	mov    %rax,%rdi
  8048c8:	48 b8 92 29 80 00 00 	movabs $0x802992,%rax
  8048cf:	00 00 00 
  8048d2:	ff d0                	callq  *%rax
  8048d4:	c9                   	leaveq 
  8048d5:	c3                   	retq   

00000000008048d6 <devcons_read>:
  8048d6:	55                   	push   %rbp
  8048d7:	48 89 e5             	mov    %rsp,%rbp
  8048da:	48 83 ec 30          	sub    $0x30,%rsp
  8048de:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8048e2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8048e6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8048ea:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8048ef:	75 13                	jne    804904 <devcons_read+0x2e>
  8048f1:	b8 00 00 00 00       	mov    $0x0,%eax
  8048f6:	eb 49                	jmp    804941 <devcons_read+0x6b>
  8048f8:	48 b8 05 1d 80 00 00 	movabs $0x801d05,%rax
  8048ff:	00 00 00 
  804902:	ff d0                	callq  *%rax
  804904:	48 b8 47 1c 80 00 00 	movabs $0x801c47,%rax
  80490b:	00 00 00 
  80490e:	ff d0                	callq  *%rax
  804910:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804913:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804917:	74 df                	je     8048f8 <devcons_read+0x22>
  804919:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80491d:	79 05                	jns    804924 <devcons_read+0x4e>
  80491f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804922:	eb 1d                	jmp    804941 <devcons_read+0x6b>
  804924:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804928:	75 07                	jne    804931 <devcons_read+0x5b>
  80492a:	b8 00 00 00 00       	mov    $0x0,%eax
  80492f:	eb 10                	jmp    804941 <devcons_read+0x6b>
  804931:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804934:	89 c2                	mov    %eax,%edx
  804936:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80493a:	88 10                	mov    %dl,(%rax)
  80493c:	b8 01 00 00 00       	mov    $0x1,%eax
  804941:	c9                   	leaveq 
  804942:	c3                   	retq   

0000000000804943 <devcons_write>:
  804943:	55                   	push   %rbp
  804944:	48 89 e5             	mov    %rsp,%rbp
  804947:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80494e:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804955:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  80495c:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804963:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80496a:	eb 76                	jmp    8049e2 <devcons_write+0x9f>
  80496c:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804973:	89 c2                	mov    %eax,%edx
  804975:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804978:	29 c2                	sub    %eax,%edx
  80497a:	89 d0                	mov    %edx,%eax
  80497c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80497f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804982:	83 f8 7f             	cmp    $0x7f,%eax
  804985:	76 07                	jbe    80498e <devcons_write+0x4b>
  804987:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  80498e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804991:	48 63 d0             	movslq %eax,%rdx
  804994:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804997:	48 63 c8             	movslq %eax,%rcx
  80499a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8049a1:	48 01 c1             	add    %rax,%rcx
  8049a4:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8049ab:	48 89 ce             	mov    %rcx,%rsi
  8049ae:	48 89 c7             	mov    %rax,%rdi
  8049b1:	48 b8 37 17 80 00 00 	movabs $0x801737,%rax
  8049b8:	00 00 00 
  8049bb:	ff d0                	callq  *%rax
  8049bd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8049c0:	48 63 d0             	movslq %eax,%rdx
  8049c3:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8049ca:	48 89 d6             	mov    %rdx,%rsi
  8049cd:	48 89 c7             	mov    %rax,%rdi
  8049d0:	48 b8 fa 1b 80 00 00 	movabs $0x801bfa,%rax
  8049d7:	00 00 00 
  8049da:	ff d0                	callq  *%rax
  8049dc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8049df:	01 45 fc             	add    %eax,-0x4(%rbp)
  8049e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049e5:	48 98                	cltq   
  8049e7:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8049ee:	0f 82 78 ff ff ff    	jb     80496c <devcons_write+0x29>
  8049f4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049f7:	c9                   	leaveq 
  8049f8:	c3                   	retq   

00000000008049f9 <devcons_close>:
  8049f9:	55                   	push   %rbp
  8049fa:	48 89 e5             	mov    %rsp,%rbp
  8049fd:	48 83 ec 08          	sub    $0x8,%rsp
  804a01:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804a05:	b8 00 00 00 00       	mov    $0x0,%eax
  804a0a:	c9                   	leaveq 
  804a0b:	c3                   	retq   

0000000000804a0c <devcons_stat>:
  804a0c:	55                   	push   %rbp
  804a0d:	48 89 e5             	mov    %rsp,%rbp
  804a10:	48 83 ec 10          	sub    $0x10,%rsp
  804a14:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804a18:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804a1c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a20:	48 be c2 55 80 00 00 	movabs $0x8055c2,%rsi
  804a27:	00 00 00 
  804a2a:	48 89 c7             	mov    %rax,%rdi
  804a2d:	48 b8 12 14 80 00 00 	movabs $0x801412,%rax
  804a34:	00 00 00 
  804a37:	ff d0                	callq  *%rax
  804a39:	b8 00 00 00 00       	mov    $0x0,%eax
  804a3e:	c9                   	leaveq 
  804a3f:	c3                   	retq   

0000000000804a40 <set_pgfault_handler>:
  804a40:	55                   	push   %rbp
  804a41:	48 89 e5             	mov    %rsp,%rbp
  804a44:	48 83 ec 20          	sub    $0x20,%rsp
  804a48:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804a4c:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804a53:	00 00 00 
  804a56:	48 8b 00             	mov    (%rax),%rax
  804a59:	48 85 c0             	test   %rax,%rax
  804a5c:	75 6f                	jne    804acd <set_pgfault_handler+0x8d>
  804a5e:	ba 07 00 00 00       	mov    $0x7,%edx
  804a63:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  804a68:	bf 00 00 00 00       	mov    $0x0,%edi
  804a6d:	48 b8 42 1d 80 00 00 	movabs $0x801d42,%rax
  804a74:	00 00 00 
  804a77:	ff d0                	callq  *%rax
  804a79:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804a7c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804a80:	79 30                	jns    804ab2 <set_pgfault_handler+0x72>
  804a82:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a85:	89 c1                	mov    %eax,%ecx
  804a87:	48 ba d0 55 80 00 00 	movabs $0x8055d0,%rdx
  804a8e:	00 00 00 
  804a91:	be 22 00 00 00       	mov    $0x22,%esi
  804a96:	48 bf ef 55 80 00 00 	movabs $0x8055ef,%rdi
  804a9d:	00 00 00 
  804aa0:	b8 00 00 00 00       	mov    $0x0,%eax
  804aa5:	49 b8 48 06 80 00 00 	movabs $0x800648,%r8
  804aac:	00 00 00 
  804aaf:	41 ff d0             	callq  *%r8
  804ab2:	48 be e1 4a 80 00 00 	movabs $0x804ae1,%rsi
  804ab9:	00 00 00 
  804abc:	bf 00 00 00 00       	mov    $0x0,%edi
  804ac1:	48 b8 d9 1e 80 00 00 	movabs $0x801ed9,%rax
  804ac8:	00 00 00 
  804acb:	ff d0                	callq  *%rax
  804acd:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804ad4:	00 00 00 
  804ad7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804adb:	48 89 10             	mov    %rdx,(%rax)
  804ade:	90                   	nop
  804adf:	c9                   	leaveq 
  804ae0:	c3                   	retq   

0000000000804ae1 <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  804ae1:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  804ae4:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  804aeb:	00 00 00 
call *%rax
  804aee:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  804af0:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  804af7:	00 08 
    movq 152(%rsp), %rax
  804af9:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  804b00:	00 
    movq 136(%rsp), %rbx
  804b01:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  804b08:	00 
movq %rbx, (%rax)
  804b09:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804b0c:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  804b10:	4c 8b 3c 24          	mov    (%rsp),%r15
  804b14:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  804b19:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  804b1e:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  804b23:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  804b28:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  804b2d:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  804b32:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  804b37:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  804b3c:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  804b41:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  804b46:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  804b4b:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  804b50:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  804b55:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  804b5a:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  804b5e:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  804b62:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  804b63:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  804b68:	c3                   	retq   

0000000000804b69 <pageref>:
  804b69:	55                   	push   %rbp
  804b6a:	48 89 e5             	mov    %rsp,%rbp
  804b6d:	48 83 ec 18          	sub    $0x18,%rsp
  804b71:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804b75:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804b79:	48 c1 e8 15          	shr    $0x15,%rax
  804b7d:	48 89 c2             	mov    %rax,%rdx
  804b80:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804b87:	01 00 00 
  804b8a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804b8e:	83 e0 01             	and    $0x1,%eax
  804b91:	48 85 c0             	test   %rax,%rax
  804b94:	75 07                	jne    804b9d <pageref+0x34>
  804b96:	b8 00 00 00 00       	mov    $0x0,%eax
  804b9b:	eb 56                	jmp    804bf3 <pageref+0x8a>
  804b9d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804ba1:	48 c1 e8 0c          	shr    $0xc,%rax
  804ba5:	48 89 c2             	mov    %rax,%rdx
  804ba8:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804baf:	01 00 00 
  804bb2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804bb6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804bba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804bbe:	83 e0 01             	and    $0x1,%eax
  804bc1:	48 85 c0             	test   %rax,%rax
  804bc4:	75 07                	jne    804bcd <pageref+0x64>
  804bc6:	b8 00 00 00 00       	mov    $0x0,%eax
  804bcb:	eb 26                	jmp    804bf3 <pageref+0x8a>
  804bcd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804bd1:	48 c1 e8 0c          	shr    $0xc,%rax
  804bd5:	48 89 c2             	mov    %rax,%rdx
  804bd8:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804bdf:	00 00 00 
  804be2:	48 c1 e2 04          	shl    $0x4,%rdx
  804be6:	48 01 d0             	add    %rdx,%rax
  804be9:	48 83 c0 08          	add    $0x8,%rax
  804bed:	0f b7 00             	movzwl (%rax),%eax
  804bf0:	0f b7 c0             	movzwl %ax,%eax
  804bf3:	c9                   	leaveq 
  804bf4:	c3                   	retq   
