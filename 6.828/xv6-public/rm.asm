
_rm:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
  int i;

  if(argc < 2){
   5:	be 01 00 00 00       	mov    $0x1,%esi
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   a:	53                   	push   %ebx
   b:	83 e4 f0             	and    $0xfffffff0,%esp
   e:	83 ec 10             	sub    $0x10,%esp
  11:	8b 7d 08             	mov    0x8(%ebp),%edi
  14:	8b 45 0c             	mov    0xc(%ebp),%eax
  int i;

  if(argc < 2){
  17:	83 ff 01             	cmp    $0x1,%edi
  1a:	8d 58 04             	lea    0x4(%eax),%ebx
  1d:	7e 3a                	jle    59 <main+0x59>
  1f:	90                   	nop
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
  20:	8b 03                	mov    (%ebx),%eax
  22:	89 04 24             	mov    %eax,(%esp)
  25:	e8 ca 02 00 00       	call   2f4 <unlink>
  2a:	85 c0                	test   %eax,%eax
  2c:	78 0f                	js     3d <main+0x3d>
  if(argc < 2){
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  2e:	83 c6 01             	add    $0x1,%esi
  31:	83 c3 04             	add    $0x4,%ebx
  34:	39 fe                	cmp    %edi,%esi
  36:	75 e8                	jne    20 <main+0x20>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit();
  38:	e8 67 02 00 00       	call   2a4 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
      printf(2, "rm: %s failed to delete\n", argv[i]);
  3d:	8b 03                	mov    (%ebx),%eax
  3f:	c7 44 24 04 6a 07 00 	movl   $0x76a,0x4(%esp)
  46:	00 
  47:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  4e:	89 44 24 08          	mov    %eax,0x8(%esp)
  52:	e8 99 03 00 00       	call   3f0 <printf>
      break;
  57:	eb df                	jmp    38 <main+0x38>
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    printf(2, "Usage: rm files...\n");
  59:	c7 44 24 04 56 07 00 	movl   $0x756,0x4(%esp)
  60:	00 
  61:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  68:	e8 83 03 00 00       	call   3f0 <printf>
    exit();
  6d:	e8 32 02 00 00       	call   2a4 <exit>
  72:	90                   	nop
  73:	90                   	nop
  74:	90                   	nop
  75:	90                   	nop
  76:	90                   	nop
  77:	90                   	nop
  78:	90                   	nop
  79:	90                   	nop
  7a:	90                   	nop
  7b:	90                   	nop
  7c:	90                   	nop
  7d:	90                   	nop
  7e:	90                   	nop
  7f:	90                   	nop

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	8b 45 08             	mov    0x8(%ebp),%eax
  86:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  89:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  8a:	89 c2                	mov    %eax,%edx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  90:	83 c1 01             	add    $0x1,%ecx
  93:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  97:	83 c2 01             	add    $0x1,%edx
  9a:	84 db                	test   %bl,%bl
  9c:	88 5a ff             	mov    %bl,-0x1(%edx)
  9f:	75 ef                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  a1:	5b                   	pop    %ebx
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    
  a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	8b 55 08             	mov    0x8(%ebp),%edx
  b6:	53                   	push   %ebx
  b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  ba:	0f b6 02             	movzbl (%edx),%eax
  bd:	84 c0                	test   %al,%al
  bf:	74 2d                	je     ee <strcmp+0x3e>
  c1:	0f b6 19             	movzbl (%ecx),%ebx
  c4:	38 d8                	cmp    %bl,%al
  c6:	74 0e                	je     d6 <strcmp+0x26>
  c8:	eb 2b                	jmp    f5 <strcmp+0x45>
  ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  d0:	38 c8                	cmp    %cl,%al
  d2:	75 15                	jne    e9 <strcmp+0x39>
    p++, q++;
  d4:	89 d9                	mov    %ebx,%ecx
  d6:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  dc:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  df:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
  e3:	84 c0                	test   %al,%al
  e5:	75 e9                	jne    d0 <strcmp+0x20>
  e7:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e9:	29 c8                	sub    %ecx,%eax
}
  eb:	5b                   	pop    %ebx
  ec:	5d                   	pop    %ebp
  ed:	c3                   	ret    
  ee:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f1:	31 c0                	xor    %eax,%eax
  f3:	eb f4                	jmp    e9 <strcmp+0x39>
  f5:	0f b6 cb             	movzbl %bl,%ecx
  f8:	eb ef                	jmp    e9 <strcmp+0x39>
  fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000100 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 106:	80 39 00             	cmpb   $0x0,(%ecx)
 109:	74 12                	je     11d <strlen+0x1d>
 10b:	31 d2                	xor    %edx,%edx
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c2 01             	add    $0x1,%edx
 113:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 117:	89 d0                	mov    %edx,%eax
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 11d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 11f:	5d                   	pop    %ebp
 120:	c3                   	ret    
 121:	eb 0d                	jmp    130 <memset>
 123:	90                   	nop
 124:	90                   	nop
 125:	90                   	nop
 126:	90                   	nop
 127:	90                   	nop
 128:	90                   	nop
 129:	90                   	nop
 12a:	90                   	nop
 12b:	90                   	nop
 12c:	90                   	nop
 12d:	90                   	nop
 12e:	90                   	nop
 12f:	90                   	nop

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 55 08             	mov    0x8(%ebp),%edx
 136:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld    
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	89 d0                	mov    %edx,%eax
 144:	5f                   	pop    %edi
 145:	5d                   	pop    %ebp
 146:	c3                   	ret    
 147:	89 f6                	mov    %esi,%esi
 149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	53                   	push   %ebx
 157:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 15a:	0f b6 18             	movzbl (%eax),%ebx
 15d:	84 db                	test   %bl,%bl
 15f:	74 1d                	je     17e <strchr+0x2e>
    if(*s == c)
 161:	38 d3                	cmp    %dl,%bl
 163:	89 d1                	mov    %edx,%ecx
 165:	75 0d                	jne    174 <strchr+0x24>
 167:	eb 17                	jmp    180 <strchr+0x30>
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 170:	38 ca                	cmp    %cl,%dl
 172:	74 0c                	je     180 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 174:	83 c0 01             	add    $0x1,%eax
 177:	0f b6 10             	movzbl (%eax),%edx
 17a:	84 d2                	test   %dl,%dl
 17c:	75 f2                	jne    170 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 17e:	31 c0                	xor    %eax,%eax
}
 180:	5b                   	pop    %ebx
 181:	5d                   	pop    %ebp
 182:	c3                   	ret    
 183:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 195:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 197:	53                   	push   %ebx
 198:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 19b:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 19e:	eb 31                	jmp    1d1 <gets+0x41>
    cc = read(0, &c, 1);
 1a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1a7:	00 
 1a8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 1ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1b3:	e8 04 01 00 00       	call   2bc <read>
    if(cc < 1)
 1b8:	85 c0                	test   %eax,%eax
 1ba:	7e 1d                	jle    1d9 <gets+0x49>
      break;
    buf[i++] = c;
 1bc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c0:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1c2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 1c5:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1c7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1cb:	74 0c                	je     1d9 <gets+0x49>
 1cd:	3c 0a                	cmp    $0xa,%al
 1cf:	74 08                	je     1d9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d1:	8d 5e 01             	lea    0x1(%esi),%ebx
 1d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d7:	7c c7                	jl     1a0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1d9:	8b 45 08             	mov    0x8(%ebp),%eax
 1dc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1e0:	83 c4 2c             	add    $0x2c,%esp
 1e3:	5b                   	pop    %ebx
 1e4:	5e                   	pop    %esi
 1e5:	5f                   	pop    %edi
 1e6:	5d                   	pop    %ebp
 1e7:	c3                   	ret    
 1e8:	90                   	nop
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001f0 <stat>:

int
stat(char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
 1f5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f8:	8b 45 08             	mov    0x8(%ebp),%eax
 1fb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 202:	00 
 203:	89 04 24             	mov    %eax,(%esp)
 206:	e8 d9 00 00 00       	call   2e4 <open>
  if(fd < 0)
 20b:	85 c0                	test   %eax,%eax
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 20d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 20f:	78 27                	js     238 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 211:	8b 45 0c             	mov    0xc(%ebp),%eax
 214:	89 1c 24             	mov    %ebx,(%esp)
 217:	89 44 24 04          	mov    %eax,0x4(%esp)
 21b:	e8 dc 00 00 00       	call   2fc <fstat>
  close(fd);
 220:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 223:	89 c6                	mov    %eax,%esi
  close(fd);
 225:	e8 a2 00 00 00       	call   2cc <close>
  return r;
 22a:	89 f0                	mov    %esi,%eax
}
 22c:	83 c4 10             	add    $0x10,%esp
 22f:	5b                   	pop    %ebx
 230:	5e                   	pop    %esi
 231:	5d                   	pop    %ebp
 232:	c3                   	ret    
 233:	90                   	nop
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 238:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 23d:	eb ed                	jmp    22c <stat+0x3c>
 23f:	90                   	nop

00000240 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 4d 08             	mov    0x8(%ebp),%ecx
 246:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 11             	movsbl (%ecx),%edx
 24a:	8d 42 d0             	lea    -0x30(%edx),%eax
 24d:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
 24f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 254:	77 17                	ja     26d <atoi+0x2d>
 256:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 258:	83 c1 01             	add    $0x1,%ecx
 25b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 25e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 262:	0f be 11             	movsbl (%ecx),%edx
 265:	8d 5a d0             	lea    -0x30(%edx),%ebx
 268:	80 fb 09             	cmp    $0x9,%bl
 26b:	76 eb                	jbe    258 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 26d:	5b                   	pop    %ebx
 26e:	5d                   	pop    %ebp
 26f:	c3                   	ret    

00000270 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 270:	55                   	push   %ebp
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 271:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 273:	89 e5                	mov    %esp,%ebp
 275:	56                   	push   %esi
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	53                   	push   %ebx
 27a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 27d:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 280:	85 db                	test   %ebx,%ebx
 282:	7e 12                	jle    296 <memmove+0x26>
 284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 288:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 28c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 28f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 292:	39 da                	cmp    %ebx,%edx
 294:	75 f2                	jne    288 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 296:	5b                   	pop    %ebx
 297:	5e                   	pop    %esi
 298:	5d                   	pop    %ebp
 299:	c3                   	ret    
 29a:	90                   	nop
 29b:	90                   	nop

0000029c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 29c:	b8 01 00 00 00       	mov    $0x1,%eax
 2a1:	cd 40                	int    $0x40
 2a3:	c3                   	ret    

000002a4 <exit>:
SYSCALL(exit)
 2a4:	b8 02 00 00 00       	mov    $0x2,%eax
 2a9:	cd 40                	int    $0x40
 2ab:	c3                   	ret    

000002ac <wait>:
SYSCALL(wait)
 2ac:	b8 03 00 00 00       	mov    $0x3,%eax
 2b1:	cd 40                	int    $0x40
 2b3:	c3                   	ret    

000002b4 <pipe>:
SYSCALL(pipe)
 2b4:	b8 04 00 00 00       	mov    $0x4,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret    

000002bc <read>:
SYSCALL(read)
 2bc:	b8 05 00 00 00       	mov    $0x5,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret    

000002c4 <write>:
SYSCALL(write)
 2c4:	b8 10 00 00 00       	mov    $0x10,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <close>:
SYSCALL(close)
 2cc:	b8 15 00 00 00       	mov    $0x15,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <kill>:
SYSCALL(kill)
 2d4:	b8 06 00 00 00       	mov    $0x6,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <exec>:
SYSCALL(exec)
 2dc:	b8 07 00 00 00       	mov    $0x7,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <open>:
SYSCALL(open)
 2e4:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <mknod>:
SYSCALL(mknod)
 2ec:	b8 11 00 00 00       	mov    $0x11,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <unlink>:
SYSCALL(unlink)
 2f4:	b8 12 00 00 00       	mov    $0x12,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <fstat>:
SYSCALL(fstat)
 2fc:	b8 08 00 00 00       	mov    $0x8,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <link>:
SYSCALL(link)
 304:	b8 13 00 00 00       	mov    $0x13,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <mkdir>:
SYSCALL(mkdir)
 30c:	b8 14 00 00 00       	mov    $0x14,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <chdir>:
SYSCALL(chdir)
 314:	b8 09 00 00 00       	mov    $0x9,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <dup>:
SYSCALL(dup)
 31c:	b8 0a 00 00 00       	mov    $0xa,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <getpid>:
SYSCALL(getpid)
 324:	b8 0b 00 00 00       	mov    $0xb,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <sbrk>:
SYSCALL(sbrk)
 32c:	b8 0c 00 00 00       	mov    $0xc,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <sleep>:
SYSCALL(sleep)
 334:	b8 0d 00 00 00       	mov    $0xd,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <uptime>:
SYSCALL(uptime)
 33c:	b8 0e 00 00 00       	mov    $0xe,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    
 344:	90                   	nop
 345:	90                   	nop
 346:	90                   	nop
 347:	90                   	nop
 348:	90                   	nop
 349:	90                   	nop
 34a:	90                   	nop
 34b:	90                   	nop
 34c:	90                   	nop
 34d:	90                   	nop
 34e:	90                   	nop
 34f:	90                   	nop

00000350 <printint>:
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	56                   	push   %esi
 355:	89 c6                	mov    %eax,%esi
 357:	53                   	push   %ebx
 358:	83 ec 4c             	sub    $0x4c,%esp
 35b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 35e:	85 db                	test   %ebx,%ebx
 360:	74 09                	je     36b <printint+0x1b>
 362:	89 d0                	mov    %edx,%eax
 364:	c1 e8 1f             	shr    $0x1f,%eax
 367:	84 c0                	test   %al,%al
 369:	75 75                	jne    3e0 <printint+0x90>
 36b:	89 d0                	mov    %edx,%eax
 36d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 374:	89 75 c0             	mov    %esi,-0x40(%ebp)
 377:	31 ff                	xor    %edi,%edi
 379:	89 ce                	mov    %ecx,%esi
 37b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 37e:	eb 02                	jmp    382 <printint+0x32>
 380:	89 cf                	mov    %ecx,%edi
 382:	31 d2                	xor    %edx,%edx
 384:	f7 f6                	div    %esi
 386:	8d 4f 01             	lea    0x1(%edi),%ecx
 389:	0f b6 92 8a 07 00 00 	movzbl 0x78a(%edx),%edx
 390:	85 c0                	test   %eax,%eax
 392:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 395:	75 e9                	jne    380 <printint+0x30>
 397:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 39a:	89 c8                	mov    %ecx,%eax
 39c:	8b 75 c0             	mov    -0x40(%ebp),%esi
 39f:	85 d2                	test   %edx,%edx
 3a1:	74 08                	je     3ab <printint+0x5b>
 3a3:	8d 4f 02             	lea    0x2(%edi),%ecx
 3a6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)
 3ab:	8d 79 ff             	lea    -0x1(%ecx),%edi
 3ae:	66 90                	xchg   %ax,%ax
 3b0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 3b5:	83 ef 01             	sub    $0x1,%edi
 3b8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3bf:	00 
 3c0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 3c4:	89 34 24             	mov    %esi,(%esp)
 3c7:	88 45 d7             	mov    %al,-0x29(%ebp)
 3ca:	e8 f5 fe ff ff       	call   2c4 <write>
 3cf:	83 ff ff             	cmp    $0xffffffff,%edi
 3d2:	75 dc                	jne    3b0 <printint+0x60>
 3d4:	83 c4 4c             	add    $0x4c,%esp
 3d7:	5b                   	pop    %ebx
 3d8:	5e                   	pop    %esi
 3d9:	5f                   	pop    %edi
 3da:	5d                   	pop    %ebp
 3db:	c3                   	ret    
 3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3e0:	89 d0                	mov    %edx,%eax
 3e2:	f7 d8                	neg    %eax
 3e4:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 3eb:	eb 87                	jmp    374 <printint+0x24>
 3ed:	8d 76 00             	lea    0x0(%esi),%esi

000003f0 <printf>:
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	31 ff                	xor    %edi,%edi
 3f6:	56                   	push   %esi
 3f7:	53                   	push   %ebx
 3f8:	83 ec 3c             	sub    $0x3c,%esp
 3fb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3fe:	8d 45 10             	lea    0x10(%ebp),%eax
 401:	8b 75 08             	mov    0x8(%ebp),%esi
 404:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 407:	0f b6 13             	movzbl (%ebx),%edx
 40a:	83 c3 01             	add    $0x1,%ebx
 40d:	84 d2                	test   %dl,%dl
 40f:	75 39                	jne    44a <printf+0x5a>
 411:	e9 c2 00 00 00       	jmp    4d8 <printf+0xe8>
 416:	66 90                	xchg   %ax,%ax
 418:	83 fa 25             	cmp    $0x25,%edx
 41b:	0f 84 bf 00 00 00    	je     4e0 <printf+0xf0>
 421:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 424:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 42b:	00 
 42c:	89 44 24 04          	mov    %eax,0x4(%esp)
 430:	89 34 24             	mov    %esi,(%esp)
 433:	88 55 e2             	mov    %dl,-0x1e(%ebp)
 436:	e8 89 fe ff ff       	call   2c4 <write>
 43b:	83 c3 01             	add    $0x1,%ebx
 43e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 442:	84 d2                	test   %dl,%dl
 444:	0f 84 8e 00 00 00    	je     4d8 <printf+0xe8>
 44a:	85 ff                	test   %edi,%edi
 44c:	0f be c2             	movsbl %dl,%eax
 44f:	74 c7                	je     418 <printf+0x28>
 451:	83 ff 25             	cmp    $0x25,%edi
 454:	75 e5                	jne    43b <printf+0x4b>
 456:	83 fa 64             	cmp    $0x64,%edx
 459:	0f 84 31 01 00 00    	je     590 <printf+0x1a0>
 45f:	25 f7 00 00 00       	and    $0xf7,%eax
 464:	83 f8 70             	cmp    $0x70,%eax
 467:	0f 84 83 00 00 00    	je     4f0 <printf+0x100>
 46d:	83 fa 73             	cmp    $0x73,%edx
 470:	0f 84 a2 00 00 00    	je     518 <printf+0x128>
 476:	83 fa 63             	cmp    $0x63,%edx
 479:	0f 84 35 01 00 00    	je     5b4 <printf+0x1c4>
 47f:	83 fa 25             	cmp    $0x25,%edx
 482:	0f 84 e0 00 00 00    	je     568 <printf+0x178>
 488:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 48b:	83 c3 01             	add    $0x1,%ebx
 48e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 495:	00 
 496:	31 ff                	xor    %edi,%edi
 498:	89 44 24 04          	mov    %eax,0x4(%esp)
 49c:	89 34 24             	mov    %esi,(%esp)
 49f:	89 55 d0             	mov    %edx,-0x30(%ebp)
 4a2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 4a6:	e8 19 fe ff ff       	call   2c4 <write>
 4ab:	8b 55 d0             	mov    -0x30(%ebp),%edx
 4ae:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4b8:	00 
 4b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4bd:	89 34 24             	mov    %esi,(%esp)
 4c0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4c3:	e8 fc fd ff ff       	call   2c4 <write>
 4c8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 4cc:	84 d2                	test   %dl,%dl
 4ce:	0f 85 76 ff ff ff    	jne    44a <printf+0x5a>
 4d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4d8:	83 c4 3c             	add    $0x3c,%esp
 4db:	5b                   	pop    %ebx
 4dc:	5e                   	pop    %esi
 4dd:	5f                   	pop    %edi
 4de:	5d                   	pop    %ebp
 4df:	c3                   	ret    
 4e0:	bf 25 00 00 00       	mov    $0x25,%edi
 4e5:	e9 51 ff ff ff       	jmp    43b <printf+0x4b>
 4ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4f0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4f8:	31 ff                	xor    %edi,%edi
 4fa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 501:	8b 10                	mov    (%eax),%edx
 503:	89 f0                	mov    %esi,%eax
 505:	e8 46 fe ff ff       	call   350 <printint>
 50a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 50e:	e9 28 ff ff ff       	jmp    43b <printf+0x4b>
 513:	90                   	nop
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 518:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 51b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 51f:	8b 38                	mov    (%eax),%edi
 521:	b8 83 07 00 00       	mov    $0x783,%eax
 526:	85 ff                	test   %edi,%edi
 528:	0f 44 f8             	cmove  %eax,%edi
 52b:	0f b6 07             	movzbl (%edi),%eax
 52e:	84 c0                	test   %al,%al
 530:	74 2a                	je     55c <printf+0x16c>
 532:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 538:	88 45 e3             	mov    %al,-0x1d(%ebp)
 53b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 53e:	83 c7 01             	add    $0x1,%edi
 541:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 548:	00 
 549:	89 44 24 04          	mov    %eax,0x4(%esp)
 54d:	89 34 24             	mov    %esi,(%esp)
 550:	e8 6f fd ff ff       	call   2c4 <write>
 555:	0f b6 07             	movzbl (%edi),%eax
 558:	84 c0                	test   %al,%al
 55a:	75 dc                	jne    538 <printf+0x148>
 55c:	31 ff                	xor    %edi,%edi
 55e:	e9 d8 fe ff ff       	jmp    43b <printf+0x4b>
 563:	90                   	nop
 564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 568:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 56b:	31 ff                	xor    %edi,%edi
 56d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 574:	00 
 575:	89 44 24 04          	mov    %eax,0x4(%esp)
 579:	89 34 24             	mov    %esi,(%esp)
 57c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 580:	e8 3f fd ff ff       	call   2c4 <write>
 585:	e9 b1 fe ff ff       	jmp    43b <printf+0x4b>
 58a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 590:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 593:	b9 0a 00 00 00       	mov    $0xa,%ecx
 598:	66 31 ff             	xor    %di,%di
 59b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5a2:	8b 10                	mov    (%eax),%edx
 5a4:	89 f0                	mov    %esi,%eax
 5a6:	e8 a5 fd ff ff       	call   350 <printint>
 5ab:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5af:	e9 87 fe ff ff       	jmp    43b <printf+0x4b>
 5b4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5b7:	31 ff                	xor    %edi,%edi
 5b9:	8b 00                	mov    (%eax),%eax
 5bb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5c2:	00 
 5c3:	89 34 24             	mov    %esi,(%esp)
 5c6:	88 45 e4             	mov    %al,-0x1c(%ebp)
 5c9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d0:	e8 ef fc ff ff       	call   2c4 <write>
 5d5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5d9:	e9 5d fe ff ff       	jmp    43b <printf+0x4b>
 5de:	90                   	nop
 5df:	90                   	nop

000005e0 <free>:
 5e0:	55                   	push   %ebp
 5e1:	a1 08 0a 00 00       	mov    0xa08,%eax
 5e6:	89 e5                	mov    %esp,%ebp
 5e8:	57                   	push   %edi
 5e9:	56                   	push   %esi
 5ea:	53                   	push   %ebx
 5eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5ee:	8b 08                	mov    (%eax),%ecx
 5f0:	8d 53 f8             	lea    -0x8(%ebx),%edx
 5f3:	39 d0                	cmp    %edx,%eax
 5f5:	72 11                	jb     608 <free+0x28>
 5f7:	90                   	nop
 5f8:	39 c8                	cmp    %ecx,%eax
 5fa:	72 04                	jb     600 <free+0x20>
 5fc:	39 ca                	cmp    %ecx,%edx
 5fe:	72 10                	jb     610 <free+0x30>
 600:	89 c8                	mov    %ecx,%eax
 602:	39 d0                	cmp    %edx,%eax
 604:	8b 08                	mov    (%eax),%ecx
 606:	73 f0                	jae    5f8 <free+0x18>
 608:	39 ca                	cmp    %ecx,%edx
 60a:	72 04                	jb     610 <free+0x30>
 60c:	39 c8                	cmp    %ecx,%eax
 60e:	72 f0                	jb     600 <free+0x20>
 610:	8b 73 fc             	mov    -0x4(%ebx),%esi
 613:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 616:	39 cf                	cmp    %ecx,%edi
 618:	74 1e                	je     638 <free+0x58>
 61a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
 61d:	8b 48 04             	mov    0x4(%eax),%ecx
 620:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 623:	39 f2                	cmp    %esi,%edx
 625:	74 28                	je     64f <free+0x6f>
 627:	89 10                	mov    %edx,(%eax)
 629:	a3 08 0a 00 00       	mov    %eax,0xa08
 62e:	5b                   	pop    %ebx
 62f:	5e                   	pop    %esi
 630:	5f                   	pop    %edi
 631:	5d                   	pop    %ebp
 632:	c3                   	ret    
 633:	90                   	nop
 634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 638:	03 71 04             	add    0x4(%ecx),%esi
 63b:	89 73 fc             	mov    %esi,-0x4(%ebx)
 63e:	8b 08                	mov    (%eax),%ecx
 640:	8b 09                	mov    (%ecx),%ecx
 642:	89 4b f8             	mov    %ecx,-0x8(%ebx)
 645:	8b 48 04             	mov    0x4(%eax),%ecx
 648:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 64b:	39 f2                	cmp    %esi,%edx
 64d:	75 d8                	jne    627 <free+0x47>
 64f:	03 4b fc             	add    -0x4(%ebx),%ecx
 652:	a3 08 0a 00 00       	mov    %eax,0xa08
 657:	89 48 04             	mov    %ecx,0x4(%eax)
 65a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 65d:	89 10                	mov    %edx,(%eax)
 65f:	5b                   	pop    %ebx
 660:	5e                   	pop    %esi
 661:	5f                   	pop    %edi
 662:	5d                   	pop    %ebp
 663:	c3                   	ret    
 664:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 66a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000670 <malloc>:
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
 675:	53                   	push   %ebx
 676:	83 ec 1c             	sub    $0x1c,%esp
 679:	8b 45 08             	mov    0x8(%ebp),%eax
 67c:	8b 1d 08 0a 00 00    	mov    0xa08,%ebx
 682:	8d 48 07             	lea    0x7(%eax),%ecx
 685:	c1 e9 03             	shr    $0x3,%ecx
 688:	85 db                	test   %ebx,%ebx
 68a:	8d 71 01             	lea    0x1(%ecx),%esi
 68d:	0f 84 9b 00 00 00    	je     72e <malloc+0xbe>
 693:	8b 13                	mov    (%ebx),%edx
 695:	8b 7a 04             	mov    0x4(%edx),%edi
 698:	39 fe                	cmp    %edi,%esi
 69a:	76 64                	jbe    700 <malloc+0x90>
 69c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
 6a3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 6a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6ab:	eb 0e                	jmp    6bb <malloc+0x4b>
 6ad:	8d 76 00             	lea    0x0(%esi),%esi
 6b0:	8b 02                	mov    (%edx),%eax
 6b2:	8b 78 04             	mov    0x4(%eax),%edi
 6b5:	39 fe                	cmp    %edi,%esi
 6b7:	76 4f                	jbe    708 <malloc+0x98>
 6b9:	89 c2                	mov    %eax,%edx
 6bb:	3b 15 08 0a 00 00    	cmp    0xa08,%edx
 6c1:	75 ed                	jne    6b0 <malloc+0x40>
 6c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 6cc:	bf 00 10 00 00       	mov    $0x1000,%edi
 6d1:	0f 43 fe             	cmovae %esi,%edi
 6d4:	0f 42 c3             	cmovb  %ebx,%eax
 6d7:	89 04 24             	mov    %eax,(%esp)
 6da:	e8 4d fc ff ff       	call   32c <sbrk>
 6df:	83 f8 ff             	cmp    $0xffffffff,%eax
 6e2:	74 18                	je     6fc <malloc+0x8c>
 6e4:	89 78 04             	mov    %edi,0x4(%eax)
 6e7:	83 c0 08             	add    $0x8,%eax
 6ea:	89 04 24             	mov    %eax,(%esp)
 6ed:	e8 ee fe ff ff       	call   5e0 <free>
 6f2:	8b 15 08 0a 00 00    	mov    0xa08,%edx
 6f8:	85 d2                	test   %edx,%edx
 6fa:	75 b4                	jne    6b0 <malloc+0x40>
 6fc:	31 c0                	xor    %eax,%eax
 6fe:	eb 20                	jmp    720 <malloc+0xb0>
 700:	89 d0                	mov    %edx,%eax
 702:	89 da                	mov    %ebx,%edx
 704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 708:	39 fe                	cmp    %edi,%esi
 70a:	74 1c                	je     728 <malloc+0xb8>
 70c:	29 f7                	sub    %esi,%edi
 70e:	89 78 04             	mov    %edi,0x4(%eax)
 711:	8d 04 f8             	lea    (%eax,%edi,8),%eax
 714:	89 70 04             	mov    %esi,0x4(%eax)
 717:	89 15 08 0a 00 00    	mov    %edx,0xa08
 71d:	83 c0 08             	add    $0x8,%eax
 720:	83 c4 1c             	add    $0x1c,%esp
 723:	5b                   	pop    %ebx
 724:	5e                   	pop    %esi
 725:	5f                   	pop    %edi
 726:	5d                   	pop    %ebp
 727:	c3                   	ret    
 728:	8b 08                	mov    (%eax),%ecx
 72a:	89 0a                	mov    %ecx,(%edx)
 72c:	eb e9                	jmp    717 <malloc+0xa7>
 72e:	c7 05 08 0a 00 00 0c 	movl   $0xa0c,0xa08
 735:	0a 00 00 
 738:	ba 0c 0a 00 00       	mov    $0xa0c,%edx
 73d:	c7 05 0c 0a 00 00 0c 	movl   $0xa0c,0xa0c
 744:	0a 00 00 
 747:	c7 05 10 0a 00 00 00 	movl   $0x0,0xa10
 74e:	00 00 00 
 751:	e9 46 ff ff ff       	jmp    69c <malloc+0x2c>
