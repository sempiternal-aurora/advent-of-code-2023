	.data
	.balign 8
day6.FILE:
	.text
day6.EqualsRaces:
	pushq %rbp
	movq %rsp,%rbp
	subq $48,%rsp
	movq %r15, -40(%rbp)
	movq %r14, -32(%rbp)
	movq %r13, -24(%rbp)
	movq %r12, -16(%rbp)
	movq %rbx, -8(%rbp)
	movq %rdi,%r12
	movq %rsi,%rbx
L.123:
#	movq %r12,%r12
	xorq %rax,%rax
	cmpq %rax,%r12
	je L.3
L.4:
#	movq %rbx,%rbx
	xorq %rax,%rax
	cmpq %rax,%rbx
	je L.3
L.5:
	movq 8(%r12),%rcx
	movq 8(%rbx),%rax
	cmpq %rax,%rcx
	jne L.1
L.2:
	xorq %r14,%r14
#	movq %r12,%r12
	xorq %rax,%rax
	cmpq %rax,%r12
	je L.3
L.6:
	movq 8(%r12),%r13
#	movq %r13,%r13
	subq $1,%r13
#	movq %r13,%r13
	movq $1,%r15
L.8:
	cmpq %r13,%r14
	jle L.7
L.9:
	movq $1,%rax
	jmp L.0
L.1:
	xorq %rax,%rax
	jmp L.0
L.7:
	movq %r14,%rcx
	movq %r12,%rax
	xorq %rdx,%rdx
	cmpq %rdx,%rax
	je L.3
L.12:
#	movq %rax,%rax
	movq %rcx,%rdx
	xorq %rsi,%rsi
	cmpq %rsi,%rdx
	jl L.13
L.14:
	movq 8(%rax),%rsi
	cmpq %rsi,%rdx
	jge L.13
L.15:
	movq %rbx,%rsi
	xorq %rdi,%rdi
	cmpq %rdi,%rsi
	je L.3
L.16:
#	movq %rsi,%rsi
#	movq %rcx,%rcx
	xorq %rdi,%rdi
	cmpq %rdi,%rcx
	jl L.13
L.17:
	movq 8(%rsi),%rdi
	cmpq %rdi,%rcx
	jge L.13
L.18:
	movq 0(%rax),%rax
#	movq %rax,%rax
#	movq %rdx,%rdx
	shlq $4,%rdx
	addq %rdx,%rax
	movq 0(%rax),%rdx
	movq %rdx,0(%rsp)
	movq 8(%rax),%rax
	movq %rax,8(%rsp)
	movq 0(%rsi),%rax
#	movq %rax,%rax
#	movq %rcx,%rcx
	shlq $4,%rcx
	addq %rcx,%rax
	movq 0(%rax),%rcx
	movq %rcx,16(%rsp)
	movq 8(%rax),%rax
	movq %rax,24(%rsp)
	call day6.EqualsRace
#	movq %rax,%rax
	xorq %rcx,%rcx
	cmpq %rcx,%rax
	je L.10
L.11:
#	movq %r14,%r14
	addq %r15,%r14
#	movq %r14,%r14
	jmp L.8
L.10:
	xorq %rax,%rax
L.0:
#	returnSink
	movq -8(%rbp),%rbx
	movq -16(%rbp),%r12
	movq -24(%rbp),%r13
	movq -32(%rbp),%r14
	movq -40(%rbp),%r15
	addq $48,%rsp
	popq %rbp
	ret
L.3:
	call badPtr
L.13:
	call badSub
	.text
day6.EqualsRace:
	pushq %rbp
	movq %rsp,%rbp
	subq $16,%rsp
	movq %rbx, -8(%rbp)
L.124:
	xorq %rax,%rax
	movq 16(%rbp),%rcx
	movq 32(%rbp),%rbx
	cmpq %rbx,%rcx
	je L.22
L.21:
#	movq %rax,%rax
	jmp L.19
L.22:
	movq 24(%rbp),%rcx
	movq 40(%rbp),%rbx
	cmpq %rbx,%rcx
	jne L.21
L.20:
	movq $1,%rax
	jmp L.21
L.19:
#	returnSink
	movq -8(%rbp),%rbx
	addq $16,%rsp
	popq %rbp
	ret
	.text
day6.CreateTestRaces:
	pushq %rbp
	movq %rsp,%rbp
	subq $32,%rsp
	movq %r13, -24(%rbp)
	movq %r12, -16(%rbp)
	movq %rbx, -8(%rbp)
L.125:
	movq $3,%rbx
	xorq %rax,%rax
	cmpq %rax,%rbx
	jl L.24
L.25:
#	movq %rbx,%rbx
	movq $16,%rdi
#	movq %rdi,%rdi
	movq %rbx,%rax
	shlq $4,%rax
	addq %rax,%rdi
#	movq %rdi,%rdi
#	movq %rdi,%rdi
	call malloc
	movq %rax,%r12
	movq %r12,%rax
	addq $16,%rax
	movq %rax,0(%r12)
	movq %rbx,8(%r12)
	movq 8(%r12),%rbx
#	movq %rbx,%rbx
	movq 0(%r12),%rax
#	movq %rax,%rax
	xorq %rcx,%rcx
	cmpq %rbx,%rcx
	jge L.28
L.26:
	movq %rax,%rdx
	movq %rcx,%rsi
	shlq $4,%rsi
	addq %rsi,%rdx
#	movq %rdx,%rdx
	movq $0,0(%rdx)
	movq $0,8(%rdx)
#	movq %rcx,%rcx
	addq $1,%rcx
#	movq %rcx,%rcx
L.27:
	cmpq %rbx,%rcx
	jl L.26
L.28:
#	movq %r12,%r12
	movq %r12,%rbx
	xorq %rax,%rax
	cmpq %rax,%rbx
	je L.29
L.30:
#	movq %rbx,%rbx
	xorq %r13,%r13
	xorq %rax,%rax
	cmpq %rax,%r13
	jl L.24
L.31:
	movq 8(%rbx),%rax
	cmpq %rax,%r13
	jge L.24
L.32:
	movabsq $16,%rdi
#	movq %rdi,%rdi
	call malloc
#	movq %rax,%rax
	movq $0,0(%rax)
	movq $0,8(%rax)
	movq %rax,%rsi
	xorq %rax,%rax
	cmpq %rax,%rsi
	je L.29
L.33:
	movq 0(%rbx),%rdi
#	movq %rdi,%rdi
#	movq %r13,%r13
	shlq $4,%r13
	addq %r13,%rdi
#	movq %rdi,%rdi
#	movq %rsi,%rsi
	movabsq $16,%rdx
#	movq %rdx,%rdx
	call memcpy
	movq %r12,%rax
	xorq %rbx,%rbx
	cmpq %rbx,%rax
	je L.29
L.34:
#	movq %rax,%rax
	xorq %rbx,%rbx
	xorq %rcx,%rcx
	cmpq %rcx,%rbx
	jl L.24
L.35:
	movq 8(%rax),%rcx
	cmpq %rcx,%rbx
	jge L.24
L.36:
	movq 0(%rax),%rax
#	movq %rax,%rax
#	movq %rbx,%rbx
	shlq $4,%rbx
	addq %rbx,%rax
	movq $7,0(%rax)
	movq %r12,%rax
	xorq %rbx,%rbx
	cmpq %rbx,%rax
	je L.29
L.37:
#	movq %rax,%rax
	xorq %rbx,%rbx
	xorq %rcx,%rcx
	cmpq %rcx,%rbx
	jl L.24
L.38:
	movq 8(%rax),%rcx
	cmpq %rcx,%rbx
	jge L.24
L.39:
	movq 0(%rax),%rax
#	movq %rax,%rax
#	movq %rbx,%rbx
	shlq $4,%rbx
	addq %rbx,%rax
	movq $9,8(%rax)
	movq %r12,%rbx
	xorq %rax,%rax
	cmpq %rax,%rbx
	je L.29
L.40:
#	movq %rbx,%rbx
	movq $1,%r13
	xorq %rax,%rax
	cmpq %rax,%r13
	jl L.24
L.41:
	movq 8(%rbx),%rax
	cmpq %rax,%r13
	jge L.24
L.42:
	movabsq $16,%rdi
#	movq %rdi,%rdi
	call malloc
#	movq %rax,%rax
	movq $0,0(%rax)
	movq $0,8(%rax)
	movq %rax,%rsi
	xorq %rax,%rax
	cmpq %rax,%rsi
	je L.29
L.43:
	movq 0(%rbx),%rdi
#	movq %rdi,%rdi
#	movq %r13,%r13
	shlq $4,%r13
	addq %r13,%rdi
#	movq %rdi,%rdi
#	movq %rsi,%rsi
	movabsq $16,%rdx
#	movq %rdx,%rdx
	call memcpy
	movq %r12,%rax
	xorq %rbx,%rbx
	cmpq %rbx,%rax
	je L.29
L.44:
#	movq %rax,%rax
	movq $1,%rbx
	xorq %rcx,%rcx
	cmpq %rcx,%rbx
	jl L.24
L.45:
	movq 8(%rax),%rcx
	cmpq %rcx,%rbx
	jge L.24
L.46:
	movq 0(%rax),%rax
#	movq %rax,%rax
#	movq %rbx,%rbx
	shlq $4,%rbx
	addq %rbx,%rax
	movq $15,0(%rax)
	movq %r12,%rax
	xorq %rbx,%rbx
	cmpq %rbx,%rax
	je L.29
L.47:
#	movq %rax,%rax
	movq $1,%rbx
	xorq %rcx,%rcx
	cmpq %rcx,%rbx
	jl L.24
L.48:
	movq 8(%rax),%rcx
	cmpq %rcx,%rbx
	jge L.24
L.49:
	movq 0(%rax),%rax
#	movq %rax,%rax
#	movq %rbx,%rbx
	shlq $4,%rbx
	addq %rbx,%rax
	movq $40,8(%rax)
	movq %r12,%rbx
	xorq %rax,%rax
	cmpq %rax,%rbx
	je L.29
L.50:
#	movq %rbx,%rbx
	movq $2,%r13
	xorq %rax,%rax
	cmpq %rax,%r13
	jl L.24
L.51:
	movq 8(%rbx),%rax
	cmpq %rax,%r13
	jge L.24
L.52:
	movabsq $16,%rdi
#	movq %rdi,%rdi
	call malloc
#	movq %rax,%rax
	movq $0,0(%rax)
	movq $0,8(%rax)
	movq %rax,%rsi
	xorq %rax,%rax
	cmpq %rax,%rsi
	je L.29
L.53:
	movq 0(%rbx),%rdi
#	movq %rdi,%rdi
#	movq %r13,%r13
	shlq $4,%r13
	addq %r13,%rdi
#	movq %rdi,%rdi
#	movq %rsi,%rsi
	movabsq $16,%rdx
#	movq %rdx,%rdx
	call memcpy
	movq %r12,%rax
	xorq %rbx,%rbx
	cmpq %rbx,%rax
	je L.29
L.54:
#	movq %rax,%rax
	movq $2,%rbx
	xorq %rcx,%rcx
	cmpq %rcx,%rbx
	jl L.24
L.55:
	movq 8(%rax),%rcx
	cmpq %rcx,%rbx
	jge L.24
L.56:
	movq 0(%rax),%rax
#	movq %rax,%rax
#	movq %rbx,%rbx
	shlq $4,%rbx
	addq %rbx,%rax
	movq $30,0(%rax)
	movq %r12,%rax
	xorq %rbx,%rbx
	cmpq %rbx,%rax
	je L.29
L.57:
#	movq %rax,%rax
	movq $2,%rbx
	xorq %rcx,%rcx
	cmpq %rcx,%rbx
	jl L.24
L.58:
	movq 8(%rax),%rcx
	cmpq %rcx,%rbx
	jge L.24
L.59:
	movq 0(%rax),%rax
#	movq %rax,%rax
#	movq %rbx,%rbx
	shlq $4,%rbx
	addq %rbx,%rax
	movq $200,8(%rax)
	movq %r12,%rax
L.23:
#	returnSink
	movq -8(%rbp),%rbx
	movq -16(%rbp),%r12
	movq -24(%rbp),%r13
	addq $32,%rsp
	popq %rbp
	ret
L.29:
	call badPtr
L.24:
	call badSub
	.data
	.balign 8
L.60:	.asciz	"test"
	.data
	.balign 8
L.61:	.asciz	"r"
	.data
	.balign 8
L.118:	.asciz	"Parsed test race is correct"
	.data
	.balign 8
L.119:	.asciz	"Parsed test race is incorrect"
	.data
	.balign 8
L.120:	.asciz	"Error: File not found!"
	.text
day6:
	pushq %rbp
	movq %rsp,%rbp
	subq $80,%rsp
	movq %r15, -80(%rbp)
	movq %r14, -72(%rbp)
	movq %r13, -64(%rbp)
	movq %r12, -56(%rbp)
	movq %rbx, -48(%rbp)
L.126:
	leaq L.60(%rip),%rdi
#	movq %rdi,%rdi
	leaq L.61(%rip),%rsi
#	movq %rsi,%rsi
	call fopen
#	movq %rax,%rax
	movq %rax,-8(%rbp)
	xorq %rbx,%rbx
	movq -8(%rbp),%rax
#	movq %rax,%rax
	cmpq %rbx,%rax
	jne L.62
L.63:
	leaq L.120(%rip),%rdi
#	movq %rdi,%rdi
	call printf
	jmp L.64
L.62:
	movq -8(%rbp),%rdi
#	movq %rdi,%rdi
#	movq %rdi,%rdi
	call fgetc
#	movq %rax,%rax
	movq %rax,-16(%rbp)
	xorq %r13,%r13
	xorq %r12,%r12
	xorq %r14,%r14
	xorq %rax,%rax
	cmpq %rax,%r14
	jl L.65
L.66:
#	movq %r14,%r14
	movq $16,%rdi
#	movq %rdi,%rdi
	movq %r14,%rax
	shlq $4,%rax
	addq %rax,%rdi
#	movq %rdi,%rdi
#	movq %rdi,%rdi
	call malloc
#	movq %rax,%rax
	movq %rax,%rbx
	addq $16,%rbx
	movq %rbx,0(%rax)
	movq %r14,8(%rax)
	movq 8(%rax),%rcx
#	movq %rcx,%rcx
	movq 0(%rax),%rbx
#	movq %rbx,%rbx
	xorq %rdx,%rdx
	cmpq %rcx,%rdx
	jge L.69
L.67:
	movq %rbx,%rsi
	movq %rdx,%rdi
	shlq $4,%rdi
	addq %rdi,%rsi
#	movq %rsi,%rsi
	movq $0,0(%rsi)
	movq $0,8(%rsi)
#	movq %rdx,%rdx
	addq $1,%rdx
#	movq %rdx,%rdx
L.68:
	cmpq %rcx,%rdx
	jl L.67
L.69:
	movq %rax,%rbx
	xorq %rax,%rax
	movq %rax,-24(%rbp)
L.70:
	xorq %rcx,%rcx
#	movq %rcx,%rcx
	subq $1,%rcx
	movq -16(%rbp),%rax
#	movq %rax,%rax
	cmpq %rcx,%rax
	jne L.71
L.72:
	movq -8(%rbp),%rdi
#	movq %rdi,%rdi
#	movq %rdi,%rdi
	call fclose
	call day6.CreateTestRaces
#	movq %rax,%rax
	movq %rbx,%rdi
	movq %rax,%rsi
	call day6.EqualsRaces
#	movq %rax,%rax
	xorq %rbx,%rbx
	cmpq %rbx,%rax
	je L.116
L.115:
	leaq L.118(%rip),%rdi
#	movq %rdi,%rdi
	call printf
L.117:
	jmp L.64
L.71:
	movq -16(%rbp),%rdi
#	movq %rdi,%rdi
#	movq %rdi,%rdi
	call isdigit
#	movq %rax,%rax
	xorq %rcx,%rcx
	cmpq %rcx,%rax
	jne L.73
L.74:
	movq -16(%rbp),%rdi
#	movq %rdi,%rdi
#	movq %rdi,%rdi
	call isblank
#	movq %rax,%rax
	xorq %rcx,%rcx
	cmpq %rcx,%rax
	jne L.78
L.76:
	movq -16(%rbp),%rdi
#	movq %rdi,%rdi
#	movq %rdi,%rdi
	call isblank
#	movq %rax,%rax
	xorq %rcx,%rcx
	cmpq %rcx,%rax
	jne L.107
L.105:
	movq -16(%rbp),%rdi
#	movq %rdi,%rdi
#	movq %rdi,%rdi
	call isspace
#	movq %rax,%rax
	xorq %rcx,%rcx
	cmpq %rcx,%rax
	jne L.114
L.112:
	movq -16(%rbp),%rdi
#	movq %rdi,%rdi
#	movq %rdi,%rdi
	call putchar
	movq -8(%rbp),%rdi
#	movq %rdi,%rdi
#	movq %rdi,%rdi
	call fgetc
#	movq %rax,%rax
	movq %rax,-16(%rbp)
	jmp L.70
L.73:
#	movq %r12,%r12
	imulq $10,%r12
#	movq %r12,%r12
	movq -16(%rbp),%rax
#	movq %rax,%rax
	addq %rax,%r12
#	movq %r12,%r12
	subq $48,%r12
#	movq %r12,%r12
	jmp L.74
L.78:
	xorq %rax,%rax
	cmpq %rax,%r12
	je L.76
L.77:
	xorq %rax,%rax
	cmpq %rax,%r13
	jne L.76
L.75:
#	movq %rbx,%rbx
	xorq %rax,%rax
	cmpq %rax,%rbx
	je L.80
L.81:
	movq 8(%rbx),%r14
#	movq %r14,%r14
	addq $1,%r14
#	movq %r14,%r14
	xorq %rax,%rax
	cmpq %rax,%r14
	jl L.65
L.79:
#	movq %r14,%r14
	movq $16,%rdi
#	movq %rdi,%rdi
	movq %r14,%rax
	shlq $4,%rax
	addq %rax,%rdi
#	movq %rdi,%rdi
#	movq %rdi,%rdi
	call malloc
#	movq %rax,%rax
	movq %rax,%rcx
	addq $16,%rcx
	movq %rcx,0(%rax)
	movq %r14,8(%rax)
	movq 8(%rax),%rdx
#	movq %rdx,%rdx
	movq 0(%rax),%rcx
#	movq %rcx,%rcx
	xorq %rsi,%rsi
	cmpq %rdx,%rsi
	jge L.84
L.82:
	movq %rcx,%rdi
	movq %rsi,%r8
	shlq $4,%r8
	addq %r8,%rdi
#	movq %rdi,%rdi
	movq $0,0(%rdi)
	movq $0,8(%rdi)
#	movq %rsi,%rsi
	addq $1,%rsi
#	movq %rsi,%rsi
L.83:
	cmpq %rdx,%rsi
	jl L.82
L.84:
	movq %rax,%r14
	xorq %r15,%r15
#	movq %rbx,%rbx
	xorq %rax,%rax
	cmpq %rax,%rbx
	je L.80
L.85:
	movq 8(%rbx),%rax
#	movq %rax,%rax
	subq $1,%rax
#	movq %rax,%rax
	movq %rax,-40(%rbp)
	movq $1,%rax
	movq %rax,-32(%rbp)
L.87:
	movq -40(%rbp),%rax
#	movq %rax,%rax
	cmpq %rax,%r15
	jle L.86
L.88:
	movq %r14,%rbx
	xorq %rax,%rax
	cmpq %rax,%rbx
	je L.80
L.95:
#	movq %rbx,%rbx
#	movq %r14,%r14
	xorq %rax,%rax
	cmpq %rax,%r14
	je L.80
L.96:
	movq 8(%r14),%r15
#	movq %r15,%r15
	subq $1,%r15
#	movq %r15,%r15
	xorq %rax,%rax
	cmpq %rax,%r15
	jl L.65
L.97:
	movq 8(%rbx),%rax
	cmpq %rax,%r15
	jge L.65
L.98:
	movabsq $16,%rdi
#	movq %rdi,%rdi
	call malloc
#	movq %rax,%rax
	movq $0,0(%rax)
	movq $0,8(%rax)
	movq %rax,%rsi
	xorq %rax,%rax
	cmpq %rax,%rsi
	je L.80
L.99:
	movq 0(%rbx),%rdi
#	movq %rdi,%rdi
#	movq %r15,%r15
	shlq $4,%r15
	addq %r15,%rdi
#	movq %rdi,%rdi
#	movq %rsi,%rsi
	movabsq $16,%rdx
#	movq %rdx,%rdx
	call memcpy
	movq %r14,%rax
	xorq %rbx,%rbx
	cmpq %rbx,%rax
	je L.80
L.100:
#	movq %rax,%rax
#	movq %r14,%r14
	xorq %rbx,%rbx
	cmpq %rbx,%r14
	je L.80
L.101:
	movq 8(%r14),%rbx
#	movq %rbx,%rbx
	subq $1,%rbx
#	movq %rbx,%rbx
	xorq %rcx,%rcx
	cmpq %rcx,%rbx
	jl L.65
L.102:
	movq 8(%rax),%rcx
	cmpq %rcx,%rbx
	jge L.65
L.103:
	movq 0(%rax),%rax
#	movq %rax,%rax
#	movq %rbx,%rbx
	shlq $4,%rbx
	addq %rbx,%rax
	movq %r12,0(%rax)
	xorq %r12,%r12
	movq %r14,%rbx
	jmp L.76
L.86:
	movq %r15,%rcx
	movq %r14,%rax
	xorq %rdx,%rdx
	cmpq %rdx,%rax
	je L.80
L.89:
#	movq %rax,%rax
	movq %rcx,%rdx
	xorq %rsi,%rsi
	cmpq %rsi,%rdx
	jl L.65
L.90:
	movq 8(%rax),%rsi
	cmpq %rsi,%rdx
	jge L.65
L.91:
	movq %rbx,%rsi
	xorq %rdi,%rdi
	cmpq %rdi,%rsi
	je L.80
L.92:
#	movq %rsi,%rsi
#	movq %rcx,%rcx
	xorq %rdi,%rdi
	cmpq %rdi,%rcx
	jl L.65
L.93:
	movq 8(%rsi),%rdi
	cmpq %rdi,%rcx
	jge L.65
L.94:
	movq 0(%rax),%rdi
#	movq %rdi,%rdi
#	movq %rdx,%rdx
	shlq $4,%rdx
	addq %rdx,%rdi
#	movq %rdi,%rdi
	movq 0(%rsi),%rsi
#	movq %rsi,%rsi
#	movq %rcx,%rcx
	shlq $4,%rcx
	addq %rcx,%rsi
#	movq %rsi,%rsi
	movabsq $16,%rdx
#	movq %rdx,%rdx
	call memcpy
#	movq %r15,%r15
	movq -32(%rbp),%rax
#	movq %rax,%rax
	addq %rax,%r15
#	movq %r15,%r15
	jmp L.87
L.107:
	xorq %rax,%rax
	cmpq %rax,%r12
	je L.105
L.106:
	xorq %rax,%rax
	cmpq %rax,%r13
	je L.105
L.104:
	movq %rbx,%rax
	xorq %rcx,%rcx
	cmpq %rcx,%rax
	je L.80
L.108:
#	movq %rax,%rax
	movq -24(%rbp),%rcx
#	movq %rcx,%rcx
#	movq %rcx,%rcx
	xorq %rdx,%rdx
	cmpq %rdx,%rcx
	jl L.65
L.109:
	movq 8(%rax),%rdx
	cmpq %rdx,%rcx
	jge L.65
L.110:
	movq 0(%rax),%rax
#	movq %rax,%rax
#	movq %rcx,%rcx
	shlq $4,%rcx
	addq %rcx,%rax
	movq %r12,8(%rax)
	movq -24(%rbp),%rax
#	movq %rax,%rax
#	movq %rax,%rax
	addq $1,%rax
#	movq %rax,%rax
	movq %rax,-24(%rbp)
	xorq %r12,%r12
	jmp L.105
L.114:
	movq -16(%rbp),%rdi
#	movq %rdi,%rdi
#	movq %rdi,%rdi
	call isblank
#	movq %rax,%rax
	xorq %rcx,%rcx
	cmpq %rcx,%rax
	jne L.112
L.113:
	xorq %rax,%rax
	cmpq %rax,%r13
	jne L.112
L.111:
	movq $1,%r13
	jmp L.112
L.116:
	leaq L.119(%rip),%rdi
#	movq %rdi,%rdi
	call printf
	jmp L.117
L.64:
#	returnSink
	movq -48(%rbp),%rbx
	movq -56(%rbp),%r12
	movq -64(%rbp),%r13
	movq -72(%rbp),%r14
	movq -80(%rbp),%r15
	addq $80,%rsp
	popq %rbp
	ret
L.80:
	call badPtr
L.65:
	call badSub
	.globl main
	.text
main:
	pushq %rbp
	movq %rsp,%rbp
L.127:
	call day6
#	returnSink
	popq %rbp
	ret
	.data
	.balign 8
L.121:	.asciz	"Attempt to use a null pointer"
	.text
badPtr:
	pushq %rbp
	movq %rsp,%rbp
L.128:
	leaq L.121(%rip),%rdi
#	movq %rdi,%rdi
	call puts
	movabsq $1,%rdi
#	movq %rdi,%rdi
	call exit
#	returnSink
	popq %rbp
	ret
	.data
	.balign 8
L.122:	.asciz	"Subscript out of bounds"
	.text
badSub:
	pushq %rbp
	movq %rsp,%rbp
L.129:
	leaq L.122(%rip),%rdi
#	movq %rdi,%rdi
	call puts
	movabsq $1,%rdi
#	movq %rdi,%rdi
	call exit
#	returnSink
	popq %rbp
	ret
