.data
.align 2
_Stack:
    .word 0
    .word _STRING0
    .word _Stack.Init
    .word _Stack.Push
    .word _Stack.Pop
    .word _Stack.NumElems
_Main:
    .word 0
    .word _STRING1

.data
_STRING0:
    .asciiz "Stack"
_STRING1:
    .asciiz "Main"
_STRING2:
    .asciiz "Decaf runtime error: Cannot create negative-sized array\n"
_STRING3:
    .asciiz "Decaf runtime error: Array subscript out of bounds\n"
_STRING4:
    .asciiz " "

.text
.globl _Stack._new
_Stack._new:
    subu $sp, $sp, 52
    move $t2, $s0
    sw $t2, 0($sp)
    move $t2, $s1
    sw $t2, 4($sp)
    move $t2, $s2
    sw $t2, 8($sp)
    move $t2, $s3
    sw $t2, 12($sp)
    move $t2, $s4
    sw $t2, 16($sp)
    move $t2, $s5
    sw $t2, 20($sp)
    move $t2, $s6
    sw $t2, 24($sp)
    move $t2, $s7
    sw $t2, 28($sp)
    move $t2, $fp
    sw $t2, 32($sp)
    move $t2, $ra
    sw $t2, 36($sp)
    li $t2, 12
    sw $t2, 40($sp)
    lw $t0, 40($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 44($sp)
    la $t2, _Stack
    sw $t2, 48($sp)
    lw $t0, 48($sp)
    lw $t1, 44($sp)
    sw $t0, 0($t1)
    lw $t1, 44($sp)
    sw $zero, 4($t1)
    lw $t1, 44($sp)
    sw $zero, 8($t1)
    lw $t0, 44($sp)
    move $v0, $t0
    _Stack._new_Ret:
    lw $t0, 0($sp)
    move $s0, $t0
    lw $t0, 4($sp)
    move $s1, $t0
    lw $t0, 8($sp)
    move $s2, $t0
    lw $t0, 12($sp)
    move $s3, $t0
    lw $t0, 16($sp)
    move $s4, $t0
    lw $t0, 20($sp)
    move $s5, $t0
    lw $t0, 24($sp)
    move $s6, $t0
    lw $t0, 28($sp)
    move $s7, $t0
    lw $t0, 32($sp)
    move $fp, $t0
    lw $t0, 36($sp)
    move $ra, $t0
    addu $sp, $sp, 52
    jr $ra

.text
.globl _Main._new
_Main._new:
    subu $sp, $sp, 52
    move $t2, $s0
    sw $t2, 0($sp)
    move $t2, $s1
    sw $t2, 4($sp)
    move $t2, $s2
    sw $t2, 8($sp)
    move $t2, $s3
    sw $t2, 12($sp)
    move $t2, $s4
    sw $t2, 16($sp)
    move $t2, $s5
    sw $t2, 20($sp)
    move $t2, $s6
    sw $t2, 24($sp)
    move $t2, $s7
    sw $t2, 28($sp)
    move $t2, $fp
    sw $t2, 32($sp)
    move $t2, $ra
    sw $t2, 36($sp)
    li $t2, 4
    sw $t2, 40($sp)
    lw $t0, 40($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 44($sp)
    la $t2, _Main
    sw $t2, 48($sp)
    lw $t0, 48($sp)
    lw $t1, 44($sp)
    sw $t0, 0($t1)
    lw $t0, 44($sp)
    move $v0, $t0
    _Main._new_Ret:
    lw $t0, 0($sp)
    move $s0, $t0
    lw $t0, 4($sp)
    move $s1, $t0
    lw $t0, 8($sp)
    move $s2, $t0
    lw $t0, 12($sp)
    move $s3, $t0
    lw $t0, 16($sp)
    move $s4, $t0
    lw $t0, 20($sp)
    move $s5, $t0
    lw $t0, 24($sp)
    move $s6, $t0
    lw $t0, 28($sp)
    move $s7, $t0
    lw $t0, 32($sp)
    move $fp, $t0
    lw $t0, 36($sp)
    move $ra, $t0
    addu $sp, $sp, 52
    jr $ra

.text
.globl length
length:
    subu $sp, $sp, 40
    move $t2, $a0
    sw $t2, 40($sp)
    move $t2, $a1
    sw $t2, 44($sp)
    move $t2, $s0
    sw $t2, 0($sp)
    move $t2, $s1
    sw $t2, 4($sp)
    move $t2, $s2
    sw $t2, 8($sp)
    move $t2, $s3
    sw $t2, 12($sp)
    move $t2, $s4
    sw $t2, 16($sp)
    move $t2, $s5
    sw $t2, 20($sp)
    move $t2, $s6
    sw $t2, 24($sp)
    move $t2, $s7
    sw $t2, 28($sp)
    move $t2, $fp
    sw $t2, 32($sp)
    move $t2, $ra
    sw $t2, 36($sp)
    lw $t0, 40($sp)
    lw $t2, 4($t0)
    sw $t2, 44($sp)
    lw $t0, 44($sp)
    lw $t2, -4($t0)
    sw $t2, 44($sp)
    lw $t0, 44($sp)
    move $v0, $t0
    length_Ret:
    lw $t0, 0($sp)
    move $s0, $t0
    lw $t0, 4($sp)
    move $s1, $t0
    lw $t0, 8($sp)
    move $s2, $t0
    lw $t0, 12($sp)
    move $s3, $t0
    lw $t0, 16($sp)
    move $s4, $t0
    lw $t0, 20($sp)
    move $s5, $t0
    lw $t0, 24($sp)
    move $s6, $t0
    lw $t0, 28($sp)
    move $s7, $t0
    lw $t0, 32($sp)
    move $fp, $t0
    lw $t0, 36($sp)
    move $ra, $t0
    addu $sp, $sp, 40
    jr $ra

.text
.globl _Stack.Init
_Stack.Init:
    subu $sp, $sp, 96
    move $t2, $a0
    sw $t2, 96($sp)
    move $t2, $s0
    sw $t2, 16($sp)
    move $t2, $s1
    sw $t2, 20($sp)
    move $t2, $s2
    sw $t2, 24($sp)
    move $t2, $s3
    sw $t2, 28($sp)
    move $t2, $s4
    sw $t2, 32($sp)
    move $t2, $s5
    sw $t2, 36($sp)
    move $t2, $s6
    sw $t2, 40($sp)
    move $t2, $s7
    sw $t2, 44($sp)
    move $t2, $fp
    sw $t2, 48($sp)
    move $t2, $ra
    sw $t2, 52($sp)
    li $t2, 404
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 60($sp)
    lw $t0, 60($sp)
    addu $t2, $t0, 404
    sw $t2, 64($sp)
    lw $t0, 60($sp)
    addu $t2, $t0, 4
    sw $t2, 60($sp)
    j _Stack.Init_L4
    _Stack.Init_L3:
    lw $t0, 64($sp)
    subu $t2, $t0, 4
    sw $t2, 64($sp)
    lw $t1, 64($sp)
    sw $zero, 0($t1)
    _Stack.Init_L4:
    lw $t0, 64($sp)
    lw $t1, 60($sp)
    seq $t2, $t0, $t1
    sw $t2, 68($sp)
    lw $t0, 68($sp)
    beqz $t0, _Stack.Init_L3
    li $t2, 100
    sw $t2, 72($sp)
    lw $t0, 72($sp)
    lw $t1, 60($sp)
    sw $t0, -4($t1)
    lw $t0, 60($sp)
    lw $t1, 96($sp)
    sw $t0, 8($t1)
    lw $t1, 96($sp)
    sw $zero, 4($t1)
    la $t2, _Stack.Push._entry
    sw $t2, 76($sp)
    li $t2, 8
    sw $t2, 80($sp)
    lw $t0, 80($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 84($sp)
    lw $t0, 76($sp)
    lw $t1, 84($sp)
    sw $t0, 0($t1)
    lw $t0, 96($sp)
    lw $t1, 84($sp)
    sw $t0, 4($t1)
    lw $t0, 84($sp)
    lw $t2, 0($t0)
    sw $t2, 88($sp)
    lw $t0, 84($sp)
    move $a0, $t0
    li $t2, 3
    sw $t2, 92($sp)
    lw $t0, 92($sp)
    move $a1, $t0
    lw $t0, 88($sp)
    jalr $t0
    _Stack.Init_Ret:
    lw $t0, 16($sp)
    move $s0, $t0
    lw $t0, 20($sp)
    move $s1, $t0
    lw $t0, 24($sp)
    move $s2, $t0
    lw $t0, 28($sp)
    move $s3, $t0
    lw $t0, 32($sp)
    move $s4, $t0
    lw $t0, 36($sp)
    move $s5, $t0
    lw $t0, 40($sp)
    move $s6, $t0
    lw $t0, 44($sp)
    move $s7, $t0
    lw $t0, 48($sp)
    move $fp, $t0
    lw $t0, 52($sp)
    move $ra, $t0
    addu $sp, $sp, 96
    jr $ra

.text
.globl _Stack.Init._entry
_Stack.Init._entry:
    subu $sp, $sp, 64
    move $t2, $a0
    sw $t2, 64($sp)
    move $t2, $s0
    sw $t2, 16($sp)
    move $t2, $s1
    sw $t2, 20($sp)
    move $t2, $s2
    sw $t2, 24($sp)
    move $t2, $s3
    sw $t2, 28($sp)
    move $t2, $s4
    sw $t2, 32($sp)
    move $t2, $s5
    sw $t2, 36($sp)
    move $t2, $s6
    sw $t2, 40($sp)
    move $t2, $s7
    sw $t2, 44($sp)
    move $t2, $fp
    sw $t2, 48($sp)
    move $t2, $ra
    sw $t2, 52($sp)
    lw $t0, 64($sp)
    lw $t2, 4($t0)
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    lw $t2, 0($t0)
    sw $t2, 60($sp)
    lw $t0, 60($sp)
    lw $t2, 8($t0)
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    lw $t0, 60($sp)
    jalr $t0
    _Stack.Init._entry_Ret:
    lw $t0, 16($sp)
    move $s0, $t0
    lw $t0, 20($sp)
    move $s1, $t0
    lw $t0, 24($sp)
    move $s2, $t0
    lw $t0, 28($sp)
    move $s3, $t0
    lw $t0, 32($sp)
    move $s4, $t0
    lw $t0, 36($sp)
    move $s5, $t0
    lw $t0, 40($sp)
    move $s6, $t0
    lw $t0, 44($sp)
    move $s7, $t0
    lw $t0, 48($sp)
    move $fp, $t0
    lw $t0, 52($sp)
    move $ra, $t0
    addu $sp, $sp, 64
    jr $ra

.text
.globl _Stack.Push
_Stack.Push:
    subu $sp, $sp, 72
    move $t2, $a0
    sw $t2, 72($sp)
    move $t2, $a1
    sw $t2, 76($sp)
    move $t2, $s0
    sw $t2, 0($sp)
    move $t2, $s1
    sw $t2, 4($sp)
    move $t2, $s2
    sw $t2, 8($sp)
    move $t2, $s3
    sw $t2, 12($sp)
    move $t2, $s4
    sw $t2, 16($sp)
    move $t2, $s5
    sw $t2, 20($sp)
    move $t2, $s6
    sw $t2, 24($sp)
    move $t2, $s7
    sw $t2, 28($sp)
    move $t2, $fp
    sw $t2, 32($sp)
    move $t2, $ra
    sw $t2, 36($sp)
    lw $t0, 72($sp)
    lw $t2, 8($t0)
    sw $t2, 40($sp)
    lw $t0, 72($sp)
    lw $t2, 4($t0)
    sw $t2, 44($sp)
    lw $t0, 40($sp)
    lw $t2, -4($t0)
    sw $t2, 48($sp)
    lw $t0, 44($sp)
    sge $t2, $t0, 0
    sw $t2, 52($sp)
    lw $t0, 44($sp)
    lw $t1, 48($sp)
    slt $t2, $t0, $t1
    sw $t2, 56($sp)
    lw $t0, 52($sp)
    lw $t1, 56($sp)
    and $t2, $t0, $t1
    sw $t2, 52($sp)
    lw $t0, 52($sp)
    beqz $t0, _Stack.Push_L3
    lw $t0, 44($sp)
    mul $t2, $t0, 4
    sw $t2, 60($sp)
    lw $t0, 60($sp)
    lw $t1, 40($sp)
    addu $t2, $t0, $t1
    sw $t2, 60($sp)
    lw $t0, 76($sp)
    lw $t1, 60($sp)
    sw $t0, 0($t1)
    j _Stack.Push_L4
    _Stack.Push_L3:
    la $t2, _STRING3
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _Stack.Push_L4:
    lw $t0, 44($sp)
    addu $t2, $t0, 1
    sw $t2, 68($sp)
    lw $t0, 68($sp)
    lw $t1, 72($sp)
    sw $t0, 4($t1)
    _Stack.Push_Ret:
    lw $t0, 0($sp)
    move $s0, $t0
    lw $t0, 4($sp)
    move $s1, $t0
    lw $t0, 8($sp)
    move $s2, $t0
    lw $t0, 12($sp)
    move $s3, $t0
    lw $t0, 16($sp)
    move $s4, $t0
    lw $t0, 20($sp)
    move $s5, $t0
    lw $t0, 24($sp)
    move $s6, $t0
    lw $t0, 28($sp)
    move $s7, $t0
    lw $t0, 32($sp)
    move $fp, $t0
    lw $t0, 36($sp)
    move $ra, $t0
    addu $sp, $sp, 72
    jr $ra

.text
.globl _Stack.Push._entry
_Stack.Push._entry:
    subu $sp, $sp, 64
    move $t2, $a0
    sw $t2, 64($sp)
    move $t2, $a1
    sw $t2, 68($sp)
    move $t2, $s0
    sw $t2, 16($sp)
    move $t2, $s1
    sw $t2, 20($sp)
    move $t2, $s2
    sw $t2, 24($sp)
    move $t2, $s3
    sw $t2, 28($sp)
    move $t2, $s4
    sw $t2, 32($sp)
    move $t2, $s5
    sw $t2, 36($sp)
    move $t2, $s6
    sw $t2, 40($sp)
    move $t2, $s7
    sw $t2, 44($sp)
    move $t2, $fp
    sw $t2, 48($sp)
    move $t2, $ra
    sw $t2, 52($sp)
    lw $t0, 64($sp)
    lw $t2, 4($t0)
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    lw $t2, 0($t0)
    sw $t2, 60($sp)
    lw $t0, 60($sp)
    lw $t2, 12($t0)
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    lw $t0, 68($sp)
    move $a1, $t0
    lw $t0, 60($sp)
    jalr $t0
    _Stack.Push._entry_Ret:
    lw $t0, 16($sp)
    move $s0, $t0
    lw $t0, 20($sp)
    move $s1, $t0
    lw $t0, 24($sp)
    move $s2, $t0
    lw $t0, 28($sp)
    move $s3, $t0
    lw $t0, 32($sp)
    move $s4, $t0
    lw $t0, 36($sp)
    move $s5, $t0
    lw $t0, 40($sp)
    move $s6, $t0
    lw $t0, 44($sp)
    move $s7, $t0
    lw $t0, 48($sp)
    move $fp, $t0
    lw $t0, 52($sp)
    move $ra, $t0
    addu $sp, $sp, 64
    jr $ra

.text
.globl _Stack.Pop
_Stack.Pop:
    subu $sp, $sp, 76
    move $t2, $a0
    sw $t2, 76($sp)
    move $t2, $s0
    sw $t2, 0($sp)
    move $t2, $s1
    sw $t2, 4($sp)
    move $t2, $s2
    sw $t2, 8($sp)
    move $t2, $s3
    sw $t2, 12($sp)
    move $t2, $s4
    sw $t2, 16($sp)
    move $t2, $s5
    sw $t2, 20($sp)
    move $t2, $s6
    sw $t2, 24($sp)
    move $t2, $s7
    sw $t2, 28($sp)
    move $t2, $fp
    sw $t2, 32($sp)
    move $t2, $ra
    sw $t2, 36($sp)
    lw $t0, 76($sp)
    lw $t2, 8($t0)
    sw $t2, 40($sp)
    lw $t0, 76($sp)
    lw $t2, 4($t0)
    sw $t2, 44($sp)
    lw $t0, 44($sp)
    subu $t2, $t0, 1
    sw $t2, 48($sp)
    lw $t0, 40($sp)
    lw $t2, -4($t0)
    sw $t2, 52($sp)
    lw $t0, 48($sp)
    sge $t2, $t0, 0
    sw $t2, 56($sp)
    lw $t0, 48($sp)
    lw $t1, 52($sp)
    slt $t2, $t0, $t1
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    lw $t1, 60($sp)
    and $t2, $t0, $t1
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    beqz $t0, _Stack.Pop_L3
    lw $t0, 48($sp)
    mul $t2, $t0, 4
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    lw $t1, 40($sp)
    addu $t2, $t0, $t1
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    lw $t2, 0($t0)
    sw $t2, 68($sp)
    j _Stack.Pop_L4
    _Stack.Pop_L3:
    la $t2, _STRING3
    sw $t2, 72($sp)
    lw $t0, 72($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _Stack.Pop_L4:
    lw $t0, 48($sp)
    lw $t1, 76($sp)
    sw $t0, 4($t1)
    lw $t0, 68($sp)
    move $v0, $t0
    _Stack.Pop_Ret:
    lw $t0, 0($sp)
    move $s0, $t0
    lw $t0, 4($sp)
    move $s1, $t0
    lw $t0, 8($sp)
    move $s2, $t0
    lw $t0, 12($sp)
    move $s3, $t0
    lw $t0, 16($sp)
    move $s4, $t0
    lw $t0, 20($sp)
    move $s5, $t0
    lw $t0, 24($sp)
    move $s6, $t0
    lw $t0, 28($sp)
    move $s7, $t0
    lw $t0, 32($sp)
    move $fp, $t0
    lw $t0, 36($sp)
    move $ra, $t0
    addu $sp, $sp, 76
    jr $ra

.text
.globl _Stack.Pop._entry
_Stack.Pop._entry:
    subu $sp, $sp, 68
    move $t2, $a0
    sw $t2, 68($sp)
    move $t2, $s0
    sw $t2, 16($sp)
    move $t2, $s1
    sw $t2, 20($sp)
    move $t2, $s2
    sw $t2, 24($sp)
    move $t2, $s3
    sw $t2, 28($sp)
    move $t2, $s4
    sw $t2, 32($sp)
    move $t2, $s5
    sw $t2, 36($sp)
    move $t2, $s6
    sw $t2, 40($sp)
    move $t2, $s7
    sw $t2, 44($sp)
    move $t2, $fp
    sw $t2, 48($sp)
    move $t2, $ra
    sw $t2, 52($sp)
    lw $t0, 68($sp)
    lw $t2, 4($t0)
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    lw $t2, 0($t0)
    sw $t2, 60($sp)
    lw $t0, 60($sp)
    lw $t2, 16($t0)
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    lw $t0, 60($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    move $v0, $t0
    _Stack.Pop._entry_Ret:
    lw $t0, 16($sp)
    move $s0, $t0
    lw $t0, 20($sp)
    move $s1, $t0
    lw $t0, 24($sp)
    move $s2, $t0
    lw $t0, 28($sp)
    move $s3, $t0
    lw $t0, 32($sp)
    move $s4, $t0
    lw $t0, 36($sp)
    move $s5, $t0
    lw $t0, 40($sp)
    move $s6, $t0
    lw $t0, 44($sp)
    move $s7, $t0
    lw $t0, 48($sp)
    move $fp, $t0
    lw $t0, 52($sp)
    move $ra, $t0
    addu $sp, $sp, 68
    jr $ra

.text
.globl _Stack.NumElems
_Stack.NumElems:
    subu $sp, $sp, 44
    move $t2, $a0
    sw $t2, 44($sp)
    move $t2, $s0
    sw $t2, 0($sp)
    move $t2, $s1
    sw $t2, 4($sp)
    move $t2, $s2
    sw $t2, 8($sp)
    move $t2, $s3
    sw $t2, 12($sp)
    move $t2, $s4
    sw $t2, 16($sp)
    move $t2, $s5
    sw $t2, 20($sp)
    move $t2, $s6
    sw $t2, 24($sp)
    move $t2, $s7
    sw $t2, 28($sp)
    move $t2, $fp
    sw $t2, 32($sp)
    move $t2, $ra
    sw $t2, 36($sp)
    lw $t0, 44($sp)
    lw $t2, 4($t0)
    sw $t2, 40($sp)
    lw $t0, 40($sp)
    move $v0, $t0
    _Stack.NumElems_Ret:
    lw $t0, 0($sp)
    move $s0, $t0
    lw $t0, 4($sp)
    move $s1, $t0
    lw $t0, 8($sp)
    move $s2, $t0
    lw $t0, 12($sp)
    move $s3, $t0
    lw $t0, 16($sp)
    move $s4, $t0
    lw $t0, 20($sp)
    move $s5, $t0
    lw $t0, 24($sp)
    move $s6, $t0
    lw $t0, 28($sp)
    move $s7, $t0
    lw $t0, 32($sp)
    move $fp, $t0
    lw $t0, 36($sp)
    move $ra, $t0
    addu $sp, $sp, 44
    jr $ra

.text
.globl _Stack.NumElems._entry
_Stack.NumElems._entry:
    subu $sp, $sp, 68
    move $t2, $a0
    sw $t2, 68($sp)
    move $t2, $s0
    sw $t2, 16($sp)
    move $t2, $s1
    sw $t2, 20($sp)
    move $t2, $s2
    sw $t2, 24($sp)
    move $t2, $s3
    sw $t2, 28($sp)
    move $t2, $s4
    sw $t2, 32($sp)
    move $t2, $s5
    sw $t2, 36($sp)
    move $t2, $s6
    sw $t2, 40($sp)
    move $t2, $s7
    sw $t2, 44($sp)
    move $t2, $fp
    sw $t2, 48($sp)
    move $t2, $ra
    sw $t2, 52($sp)
    lw $t0, 68($sp)
    lw $t2, 4($t0)
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    lw $t2, 0($t0)
    sw $t2, 60($sp)
    lw $t0, 60($sp)
    lw $t2, 20($t0)
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    lw $t0, 60($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    move $v0, $t0
    _Stack.NumElems._entry_Ret:
    lw $t0, 16($sp)
    move $s0, $t0
    lw $t0, 20($sp)
    move $s1, $t0
    lw $t0, 24($sp)
    move $s2, $t0
    lw $t0, 28($sp)
    move $s3, $t0
    lw $t0, 32($sp)
    move $s4, $t0
    lw $t0, 36($sp)
    move $s5, $t0
    lw $t0, 40($sp)
    move $s6, $t0
    lw $t0, 44($sp)
    move $s7, $t0
    lw $t0, 48($sp)
    move $fp, $t0
    lw $t0, 52($sp)
    move $ra, $t0
    addu $sp, $sp, 68
    jr $ra

.text
.globl _Stack.main
_Stack.main:
    subu $sp, $sp, 252
    move $t2, $s0
    sw $t2, 16($sp)
    move $t2, $s1
    sw $t2, 20($sp)
    move $t2, $s2
    sw $t2, 24($sp)
    move $t2, $s3
    sw $t2, 28($sp)
    move $t2, $s4
    sw $t2, 32($sp)
    move $t2, $s5
    sw $t2, 36($sp)
    move $t2, $s6
    sw $t2, 40($sp)
    move $t2, $s7
    sw $t2, 44($sp)
    move $t2, $fp
    sw $t2, 48($sp)
    move $t2, $ra
    sw $t2, 52($sp)
    jal _Stack._new
    move $t2, $v0
    sw $t2, 56($sp)
    la $t2, _Stack.Init._entry
    sw $t2, 60($sp)
    li $t2, 8
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 68($sp)
    lw $t0, 60($sp)
    lw $t1, 68($sp)
    sw $t0, 0($t1)
    lw $t0, 56($sp)
    lw $t1, 68($sp)
    sw $t0, 4($t1)
    lw $t0, 68($sp)
    lw $t2, 0($t0)
    sw $t2, 72($sp)
    lw $t0, 68($sp)
    move $a0, $t0
    lw $t0, 72($sp)
    jalr $t0
    la $t2, _Stack.Push._entry
    sw $t2, 76($sp)
    li $t2, 8
    sw $t2, 80($sp)
    lw $t0, 80($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 84($sp)
    lw $t0, 76($sp)
    lw $t1, 84($sp)
    sw $t0, 0($t1)
    lw $t0, 56($sp)
    lw $t1, 84($sp)
    sw $t0, 4($t1)
    lw $t0, 84($sp)
    lw $t2, 0($t0)
    sw $t2, 88($sp)
    lw $t0, 84($sp)
    move $a0, $t0
    li $t2, 3
    sw $t2, 92($sp)
    lw $t0, 92($sp)
    move $a1, $t0
    lw $t0, 88($sp)
    jalr $t0
    la $t2, _Stack.Push._entry
    sw $t2, 96($sp)
    li $t2, 8
    sw $t2, 100($sp)
    lw $t0, 100($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 104($sp)
    lw $t0, 96($sp)
    lw $t1, 104($sp)
    sw $t0, 0($t1)
    lw $t0, 56($sp)
    lw $t1, 104($sp)
    sw $t0, 4($t1)
    lw $t0, 104($sp)
    lw $t2, 0($t0)
    sw $t2, 108($sp)
    lw $t0, 104($sp)
    move $a0, $t0
    li $t2, 7
    sw $t2, 112($sp)
    lw $t0, 112($sp)
    move $a1, $t0
    lw $t0, 108($sp)
    jalr $t0
    la $t2, _Stack.Push._entry
    sw $t2, 116($sp)
    li $t2, 8
    sw $t2, 120($sp)
    lw $t0, 120($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 124($sp)
    lw $t0, 116($sp)
    lw $t1, 124($sp)
    sw $t0, 0($t1)
    lw $t0, 56($sp)
    lw $t1, 124($sp)
    sw $t0, 4($t1)
    lw $t0, 124($sp)
    lw $t2, 0($t0)
    sw $t2, 128($sp)
    lw $t0, 124($sp)
    move $a0, $t0
    li $t2, 4
    sw $t2, 132($sp)
    lw $t0, 132($sp)
    move $a1, $t0
    lw $t0, 128($sp)
    jalr $t0
    la $t2, _Stack.NumElems._entry
    sw $t2, 136($sp)
    li $t2, 8
    sw $t2, 140($sp)
    lw $t0, 140($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 144($sp)
    lw $t0, 136($sp)
    lw $t1, 144($sp)
    sw $t0, 0($t1)
    lw $t0, 56($sp)
    lw $t1, 144($sp)
    sw $t0, 4($t1)
    lw $t0, 144($sp)
    lw $t2, 0($t0)
    sw $t2, 148($sp)
    lw $t0, 144($sp)
    move $a0, $t0
    lw $t0, 148($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 152($sp)
    lw $t0, 152($sp)
    move $a0, $t0
    li $v0, 1
    syscall
    la $t2, _STRING4
    sw $t2, 156($sp)
    lw $t0, 156($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    la $t2, _Stack.Pop._entry
    sw $t2, 160($sp)
    li $t2, 8
    sw $t2, 164($sp)
    lw $t0, 164($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 168($sp)
    lw $t0, 160($sp)
    lw $t1, 168($sp)
    sw $t0, 0($t1)
    lw $t0, 56($sp)
    lw $t1, 168($sp)
    sw $t0, 4($t1)
    lw $t0, 168($sp)
    lw $t2, 0($t0)
    sw $t2, 172($sp)
    lw $t0, 168($sp)
    move $a0, $t0
    lw $t0, 172($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 176($sp)
    lw $t0, 176($sp)
    move $a0, $t0
    li $v0, 1
    syscall
    la $t2, _STRING4
    sw $t2, 180($sp)
    lw $t0, 180($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    la $t2, _Stack.Pop._entry
    sw $t2, 184($sp)
    li $t2, 8
    sw $t2, 188($sp)
    lw $t0, 188($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 192($sp)
    lw $t0, 184($sp)
    lw $t1, 192($sp)
    sw $t0, 0($t1)
    lw $t0, 56($sp)
    lw $t1, 192($sp)
    sw $t0, 4($t1)
    lw $t0, 192($sp)
    lw $t2, 0($t0)
    sw $t2, 196($sp)
    lw $t0, 192($sp)
    move $a0, $t0
    lw $t0, 196($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 200($sp)
    lw $t0, 200($sp)
    move $a0, $t0
    li $v0, 1
    syscall
    la $t2, _STRING4
    sw $t2, 204($sp)
    lw $t0, 204($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    la $t2, _Stack.Pop._entry
    sw $t2, 208($sp)
    li $t2, 8
    sw $t2, 212($sp)
    lw $t0, 212($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 216($sp)
    lw $t0, 208($sp)
    lw $t1, 216($sp)
    sw $t0, 0($t1)
    lw $t0, 56($sp)
    lw $t1, 216($sp)
    sw $t0, 4($t1)
    lw $t0, 216($sp)
    lw $t2, 0($t0)
    sw $t2, 220($sp)
    lw $t0, 216($sp)
    move $a0, $t0
    lw $t0, 220($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 224($sp)
    lw $t0, 224($sp)
    move $a0, $t0
    li $v0, 1
    syscall
    la $t2, _STRING4
    sw $t2, 228($sp)
    lw $t0, 228($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    la $t2, _Stack.NumElems._entry
    sw $t2, 232($sp)
    li $t2, 8
    sw $t2, 236($sp)
    lw $t0, 236($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 240($sp)
    lw $t0, 232($sp)
    lw $t1, 240($sp)
    sw $t0, 0($t1)
    lw $t0, 56($sp)
    lw $t1, 240($sp)
    sw $t0, 4($t1)
    lw $t0, 240($sp)
    lw $t2, 0($t0)
    sw $t2, 244($sp)
    lw $t0, 240($sp)
    move $a0, $t0
    lw $t0, 244($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 248($sp)
    lw $t0, 248($sp)
    move $a0, $t0
    li $v0, 1
    syscall
    _Stack.main_Ret:
    lw $t0, 16($sp)
    move $s0, $t0
    lw $t0, 20($sp)
    move $s1, $t0
    lw $t0, 24($sp)
    move $s2, $t0
    lw $t0, 28($sp)
    move $s3, $t0
    lw $t0, 32($sp)
    move $s4, $t0
    lw $t0, 36($sp)
    move $s5, $t0
    lw $t0, 40($sp)
    move $s6, $t0
    lw $t0, 44($sp)
    move $s7, $t0
    lw $t0, 48($sp)
    move $fp, $t0
    lw $t0, 52($sp)
    move $ra, $t0
    addu $sp, $sp, 252
    jr $ra

.text
.globl _Stack.main._entry
_Stack.main._entry:
    subu $sp, $sp, 56
    move $t2, $a0
    sw $t2, 56($sp)
    move $t2, $s0
    sw $t2, 16($sp)
    move $t2, $s1
    sw $t2, 20($sp)
    move $t2, $s2
    sw $t2, 24($sp)
    move $t2, $s3
    sw $t2, 28($sp)
    move $t2, $s4
    sw $t2, 32($sp)
    move $t2, $s5
    sw $t2, 36($sp)
    move $t2, $s6
    sw $t2, 40($sp)
    move $t2, $s7
    sw $t2, 44($sp)
    move $t2, $fp
    sw $t2, 48($sp)
    move $t2, $ra
    sw $t2, 52($sp)
    jal _Stack.main
    _Stack.main._entry_Ret:
    lw $t0, 16($sp)
    move $s0, $t0
    lw $t0, 20($sp)
    move $s1, $t0
    lw $t0, 24($sp)
    move $s2, $t0
    lw $t0, 28($sp)
    move $s3, $t0
    lw $t0, 32($sp)
    move $s4, $t0
    lw $t0, 36($sp)
    move $s5, $t0
    lw $t0, 40($sp)
    move $s6, $t0
    lw $t0, 44($sp)
    move $s7, $t0
    lw $t0, 48($sp)
    move $fp, $t0
    lw $t0, 52($sp)
    move $ra, $t0
    addu $sp, $sp, 56
    jr $ra

.text
.globl main
main:
    subu $sp, $sp, 72
    move $t2, $s0
    sw $t2, 16($sp)
    move $t2, $s1
    sw $t2, 20($sp)
    move $t2, $s2
    sw $t2, 24($sp)
    move $t2, $s3
    sw $t2, 28($sp)
    move $t2, $s4
    sw $t2, 32($sp)
    move $t2, $s5
    sw $t2, 36($sp)
    move $t2, $s6
    sw $t2, 40($sp)
    move $t2, $s7
    sw $t2, 44($sp)
    move $t2, $fp
    sw $t2, 48($sp)
    move $t2, $ra
    sw $t2, 52($sp)
    la $t2, _Stack.main._entry
    sw $t2, 56($sp)
    li $t2, 4
    sw $t2, 60($sp)
    lw $t0, 60($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 64($sp)
    lw $t0, 56($sp)
    lw $t1, 64($sp)
    sw $t0, 0($t1)
    lw $t0, 64($sp)
    lw $t2, 0($t0)
    sw $t2, 68($sp)
    lw $t0, 64($sp)
    move $a0, $t0
    lw $t0, 68($sp)
    jalr $t0
    main_Ret:
    lw $t0, 16($sp)
    move $s0, $t0
    lw $t0, 20($sp)
    move $s1, $t0
    lw $t0, 24($sp)
    move $s2, $t0
    lw $t0, 28($sp)
    move $s3, $t0
    lw $t0, 32($sp)
    move $s4, $t0
    lw $t0, 36($sp)
    move $s5, $t0
    lw $t0, 40($sp)
    move $s6, $t0
    lw $t0, 44($sp)
    move $s7, $t0
    lw $t0, 48($sp)
    move $fp, $t0
    lw $t0, 52($sp)
    move $ra, $t0
    addu $sp, $sp, 72
    jr $ra

.text
.globl main._entry
main._entry:
    subu $sp, $sp, 56
    move $t2, $a0
    sw $t2, 56($sp)
    move $t2, $s0
    sw $t2, 16($sp)
    move $t2, $s1
    sw $t2, 20($sp)
    move $t2, $s2
    sw $t2, 24($sp)
    move $t2, $s3
    sw $t2, 28($sp)
    move $t2, $s4
    sw $t2, 32($sp)
    move $t2, $s5
    sw $t2, 36($sp)
    move $t2, $s6
    sw $t2, 40($sp)
    move $t2, $s7
    sw $t2, 44($sp)
    move $t2, $fp
    sw $t2, 48($sp)
    move $t2, $ra
    sw $t2, 52($sp)
    jal main
    main._entry_Ret:
    lw $t0, 16($sp)
    move $s0, $t0
    lw $t0, 20($sp)
    move $s1, $t0
    lw $t0, 24($sp)
    move $s2, $t0
    lw $t0, 28($sp)
    move $s3, $t0
    lw $t0, 32($sp)
    move $s4, $t0
    lw $t0, 36($sp)
    move $s5, $t0
    lw $t0, 40($sp)
    move $s6, $t0
    lw $t0, 44($sp)
    move $s7, $t0
    lw $t0, 48($sp)
    move $fp, $t0
    lw $t0, 52($sp)
    move $ra, $t0
    addu $sp, $sp, 56
    jr $ra

# below are the runtime libary function for decaf

.data
_STRING_FT:
  .ascii "false"
  .byte 0, 0, 0
  .asciiz "true"

.text
.globl _PrintBool
_PrintBool:
  sll $a0, $a0, 3 # 0 -> 0, 1 -> 8, index 8 is the begining of "true"
  la $a0, _STRING_FT($a0)
  li $v0, 4 # print_string
  syscall
  jr $ra

.text
.globl _ReadLine
_ReadLine:
  li $a0, 64 # allocate space, fixed size 64
  li $v0, 9 # sbrk
  syscall
  move $a0, $v0
  li $a1, 64
  li $v0, 8 # read_string
  syscall
  move $v0, $a0
  # if there is a '\n', make it a '\0'
_RLLoop:
  lb $a1, ($a0)
  beqz $a1, _RLDone
  addiu $a1, $a1, -10
  beqz $a1, _RLDone
  addiu $a0, $a0, 1
  j _RLLoop
_RLDone:
  sb $a1, ($a0) # store '\0' on original '\n' or '\0'
  jr $ra

.text
.globl _StringEqual
_StringEqual:
  li $v0, 1
_SELoop:
  lb $a2, ($a0)
  lb $a3, ($a1)
  seq $v0, $a2, $a3
  beqz $v0, _SEDone
  beqz $a2, _SEDone
  addu $a0, $a0, 1
  addu $a1, $a1, 1
  j _SELoop
_SEDone:
  jr $ra