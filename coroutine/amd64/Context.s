##
##  This file is part of the "Coroutine" project and released under the MIT License.
##
##  Created by Samuel Williams on 10/5/2018.
##  Copyright, 2018, by Samuel Williams. All rights reserved.
##

.text

# For older linkers
.globl _coroutine_transfer
_coroutine_transfer:

.globl coroutine_transfer
coroutine_transfer:
	# Save caller state
	pushq %rbp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15

	# Save caller stack pointer
	movq %rsp, (%rdi)

	# Restore callee stack pointer
	movq (%rsi), %rsp

	# Restore callee stack
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	popq %rbp

	# Put the first argument into the return value
	movq %rdi, %rax

	# We pop the return address and jump to it
	ret
