.data
.align 2
_Complex:
    .word 0
    .word _STRING0
    .word _Complex.abs2
_Main:
    .word _Complex
    .word _STRING1
    .word _Complex.abs2

.data
_STRING0:
    .asciiz "Complex"
_STRING1:
    .asciiz "Main"
_STRING2:
    .asciiz "Decaf runtime error: Division by zero error"
_STRING3:
    .asciiz "Decaf runtime error: Cannot create negative-sized array\n"
_STRING4:
    .asciiz "Decaf runtime error: Array subscript out of bounds\n"
_STRING5:
    .asciiz "**"
_STRING6:
    .asciiz "  "
_STRING7:
    .asciiz "\n"

.text
.globl _Complex._new
_Complex._new:
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
    la $t2, _Complex
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
    _Complex._new_Ret:
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
    li $t2, 12
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
    lw $t1, 44($sp)
    sw $zero, 4($t1)
    lw $t1, 44($sp)
    sw $zero, 8($t1)
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
.globl _Complex.make
_Complex.make:
    subu $sp, $sp, 68
    move $t2, $a0
    sw $t2, 68($sp)
    move $t2, $a1
    sw $t2, 72($sp)
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
    jal _Complex._new
    move $t2, $v0
    sw $t2, 56($sp)
    lw $t0, 68($sp)
    rem $t2, $t0, 32768
    sw $t2, 60($sp)
    lw $t0, 60($sp)
    lw $t1, 56($sp)
    sw $t0, 4($t1)
    lw $t0, 72($sp)
    rem $t2, $t0, 32768
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    lw $t1, 56($sp)
    sw $t0, 8($t1)
    lw $t0, 56($sp)
    move $v0, $t0
    _Complex.make_Ret:
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
.globl _Complex.make._entry
_Complex.make._entry:
    subu $sp, $sp, 60
    move $t2, $a0
    sw $t2, 60($sp)
    move $t2, $a1
    sw $t2, 64($sp)
    move $t2, $a2
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
    move $a0, $t0
    lw $t0, 68($sp)
    move $a1, $t0
    jal _Complex.make
    move $t2, $v0
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    move $v0, $t0
    _Complex.make._entry_Ret:
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
    addu $sp, $sp, 60
    jr $ra

.text
.globl _Complex.add
_Complex.add:
    subu $sp, $sp, 100
    move $t2, $a0
    sw $t2, 100($sp)
    move $t2, $a1
    sw $t2, 104($sp)
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
    la $t2, _Complex.make._entry
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
    lw $t0, 100($sp)
    lw $t2, 4($t0)
    sw $t2, 68($sp)
    lw $t0, 104($sp)
    lw $t2, 4($t0)
    sw $t2, 72($sp)
    lw $t0, 68($sp)
    lw $t1, 72($sp)
    addu $t2, $t0, $t1
    sw $t2, 76($sp)
    lw $t0, 100($sp)
    lw $t2, 8($t0)
    sw $t2, 80($sp)
    lw $t0, 104($sp)
    lw $t2, 8($t0)
    sw $t2, 84($sp)
    lw $t0, 80($sp)
    lw $t1, 84($sp)
    addu $t2, $t0, $t1
    sw $t2, 88($sp)
    lw $t0, 64($sp)
    lw $t2, 0($t0)
    sw $t2, 92($sp)
    lw $t0, 64($sp)
    move $a0, $t0
    lw $t0, 76($sp)
    move $a1, $t0
    lw $t0, 88($sp)
    move $a2, $t0
    lw $t0, 92($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 96($sp)
    lw $t0, 96($sp)
    move $v0, $t0
    _Complex.add_Ret:
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
    addu $sp, $sp, 100
    jr $ra

.text
.globl _Complex.add._entry
_Complex.add._entry:
    subu $sp, $sp, 60
    move $t2, $a0
    sw $t2, 60($sp)
    move $t2, $a1
    sw $t2, 64($sp)
    move $t2, $a2
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
    move $a0, $t0
    lw $t0, 68($sp)
    move $a1, $t0
    jal _Complex.add
    move $t2, $v0
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    move $v0, $t0
    _Complex.add._entry_Ret:
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
    addu $sp, $sp, 60
    jr $ra

.text
.globl _Complex.sub
_Complex.sub:
    subu $sp, $sp, 100
    move $t2, $a0
    sw $t2, 100($sp)
    move $t2, $a1
    sw $t2, 104($sp)
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
    la $t2, _Complex.make._entry
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
    lw $t0, 100($sp)
    lw $t2, 4($t0)
    sw $t2, 68($sp)
    lw $t0, 104($sp)
    lw $t2, 4($t0)
    sw $t2, 72($sp)
    lw $t0, 68($sp)
    lw $t1, 72($sp)
    subu $t2, $t0, $t1
    sw $t2, 76($sp)
    lw $t0, 100($sp)
    lw $t2, 8($t0)
    sw $t2, 80($sp)
    lw $t0, 104($sp)
    lw $t2, 8($t0)
    sw $t2, 84($sp)
    lw $t0, 80($sp)
    lw $t1, 84($sp)
    subu $t2, $t0, $t1
    sw $t2, 88($sp)
    lw $t0, 64($sp)
    lw $t2, 0($t0)
    sw $t2, 92($sp)
    lw $t0, 64($sp)
    move $a0, $t0
    lw $t0, 76($sp)
    move $a1, $t0
    lw $t0, 88($sp)
    move $a2, $t0
    lw $t0, 92($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 96($sp)
    lw $t0, 96($sp)
    move $v0, $t0
    _Complex.sub_Ret:
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
    addu $sp, $sp, 100
    jr $ra

.text
.globl _Complex.sub._entry
_Complex.sub._entry:
    subu $sp, $sp, 60
    move $t2, $a0
    sw $t2, 60($sp)
    move $t2, $a1
    sw $t2, 64($sp)
    move $t2, $a2
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
    move $a0, $t0
    lw $t0, 68($sp)
    move $a1, $t0
    jal _Complex.sub
    move $t2, $v0
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    move $v0, $t0
    _Complex.sub._entry_Ret:
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
    addu $sp, $sp, 60
    jr $ra

.text
.globl _Complex.mul
_Complex.mul:
    subu $sp, $sp, 124
    move $t2, $a0
    sw $t2, 124($sp)
    move $t2, $a1
    sw $t2, 128($sp)
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
    la $t2, _Complex.make._entry
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
    lw $t0, 124($sp)
    lw $t2, 4($t0)
    sw $t2, 68($sp)
    lw $t0, 128($sp)
    lw $t2, 4($t0)
    sw $t2, 72($sp)
    lw $t0, 68($sp)
    lw $t1, 72($sp)
    mul $t2, $t0, $t1
    sw $t2, 76($sp)
    lw $t0, 124($sp)
    lw $t2, 8($t0)
    sw $t2, 80($sp)
    lw $t0, 128($sp)
    lw $t2, 8($t0)
    sw $t2, 84($sp)
    lw $t0, 80($sp)
    lw $t1, 84($sp)
    mul $t2, $t0, $t1
    sw $t2, 88($sp)
    lw $t0, 76($sp)
    lw $t1, 88($sp)
    subu $t2, $t0, $t1
    sw $t2, 92($sp)
    lw $t0, 92($sp)
    div $t2, $t0, 4096
    sw $t2, 96($sp)
    lw $t0, 68($sp)
    lw $t1, 84($sp)
    mul $t2, $t0, $t1
    sw $t2, 100($sp)
    lw $t0, 80($sp)
    lw $t1, 72($sp)
    mul $t2, $t0, $t1
    sw $t2, 104($sp)
    lw $t0, 100($sp)
    lw $t1, 104($sp)
    addu $t2, $t0, $t1
    sw $t2, 108($sp)
    lw $t0, 108($sp)
    div $t2, $t0, 4096
    sw $t2, 112($sp)
    lw $t0, 64($sp)
    lw $t2, 0($t0)
    sw $t2, 116($sp)
    lw $t0, 64($sp)
    move $a0, $t0
    lw $t0, 96($sp)
    move $a1, $t0
    lw $t0, 112($sp)
    move $a2, $t0
    lw $t0, 116($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 120($sp)
    lw $t0, 120($sp)
    move $v0, $t0
    _Complex.mul_Ret:
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
    addu $sp, $sp, 124
    jr $ra

.text
.globl _Complex.mul._entry
_Complex.mul._entry:
    subu $sp, $sp, 60
    move $t2, $a0
    sw $t2, 60($sp)
    move $t2, $a1
    sw $t2, 64($sp)
    move $t2, $a2
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
    move $a0, $t0
    lw $t0, 68($sp)
    move $a1, $t0
    jal _Complex.mul
    move $t2, $v0
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    move $v0, $t0
    _Complex.mul._entry_Ret:
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
    addu $sp, $sp, 60
    jr $ra

.text
.globl _Complex.abs2
_Complex.abs2:
    subu $sp, $sp, 60
    move $t2, $a0
    sw $t2, 60($sp)
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
    lw $t0, 60($sp)
    lw $t2, 4($t0)
    sw $t2, 40($sp)
    lw $t0, 40($sp)
    lw $t1, 40($sp)
    mul $t2, $t0, $t1
    sw $t2, 44($sp)
    lw $t0, 60($sp)
    lw $t2, 8($t0)
    sw $t2, 48($sp)
    lw $t0, 48($sp)
    lw $t1, 48($sp)
    mul $t2, $t0, $t1
    sw $t2, 52($sp)
    lw $t0, 44($sp)
    lw $t1, 52($sp)
    addu $t2, $t0, $t1
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    move $v0, $t0
    _Complex.abs2_Ret:
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
    addu $sp, $sp, 60
    jr $ra

.text
.globl _Complex.abs2._entry
_Complex.abs2._entry:
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
    lw $t2, 8($t0)
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    lw $t0, 60($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    move $v0, $t0
    _Complex.abs2._entry_Ret:
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
.globl main
main:
    subu $sp, $sp, 640
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
    li $t2, 136
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 60($sp)
    lw $t0, 60($sp)
    addu $t2, $t0, 136
    sw $t2, 64($sp)
    lw $t0, 60($sp)
    addu $t2, $t0, 4
    sw $t2, 60($sp)
    j main_L5
    main_L4:
    lw $t0, 64($sp)
    subu $t2, $t0, 4
    sw $t2, 64($sp)
    lw $t1, 64($sp)
    sw $zero, 0($t1)
    main_L5:
    lw $t0, 64($sp)
    lw $t1, 60($sp)
    seq $t2, $t0, $t1
    sw $t2, 68($sp)
    lw $t0, 68($sp)
    beqz $t0, main_L4
    li $t2, 33
    sw $t2, 72($sp)
    lw $t0, 72($sp)
    lw $t1, 60($sp)
    sw $t0, -4($t1)
    li $t2, 136
    sw $t2, 76($sp)
    lw $t0, 76($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 80($sp)
    lw $t0, 80($sp)
    addu $t2, $t0, 136
    sw $t2, 84($sp)
    lw $t0, 80($sp)
    addu $t2, $t0, 4
    sw $t2, 80($sp)
    j main_L9
    main_L8:
    lw $t0, 84($sp)
    subu $t2, $t0, 4
    sw $t2, 84($sp)
    lw $t1, 84($sp)
    sw $zero, 0($t1)
    main_L9:
    lw $t0, 84($sp)
    lw $t1, 80($sp)
    seq $t2, $t0, $t1
    sw $t2, 88($sp)
    lw $t0, 88($sp)
    beqz $t0, main_L8
    li $t2, 33
    sw $t2, 92($sp)
    lw $t0, 92($sp)
    lw $t1, 80($sp)
    sw $t0, -4($t1)
    li $t2, 0
    sw $t2, 96($sp)
    j main_L41
    main_L11:
    li $t2, 136
    sw $t2, 100($sp)
    lw $t0, 100($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 104($sp)
    lw $t0, 104($sp)
    addu $t2, $t0, 136
    sw $t2, 108($sp)
    lw $t0, 104($sp)
    addu $t2, $t0, 4
    sw $t2, 104($sp)
    j main_L14
    main_L13:
    lw $t0, 108($sp)
    subu $t2, $t0, 4
    sw $t2, 108($sp)
    lw $t1, 108($sp)
    sw $zero, 0($t1)
    main_L14:
    lw $t0, 108($sp)
    lw $t1, 104($sp)
    seq $t2, $t0, $t1
    sw $t2, 112($sp)
    lw $t0, 112($sp)
    beqz $t0, main_L13
    li $t2, 33
    sw $t2, 116($sp)
    lw $t0, 116($sp)
    lw $t1, 104($sp)
    sw $t0, -4($t1)
    lw $t0, 60($sp)
    lw $t2, -4($t0)
    sw $t2, 120($sp)
    lw $t0, 96($sp)
    sge $t2, $t0, 0
    sw $t2, 124($sp)
    lw $t0, 96($sp)
    lw $t1, 120($sp)
    slt $t2, $t0, $t1
    sw $t2, 128($sp)
    lw $t0, 124($sp)
    lw $t1, 128($sp)
    and $t2, $t0, $t1
    sw $t2, 132($sp)
    lw $t0, 132($sp)
    beqz $t0, main_L17
    lw $t0, 96($sp)
    mul $t2, $t0, 4
    sw $t2, 136($sp)
    lw $t0, 136($sp)
    lw $t1, 60($sp)
    addu $t2, $t0, $t1
    sw $t2, 140($sp)
    lw $t0, 104($sp)
    lw $t1, 140($sp)
    sw $t0, 0($t1)
    j main_L18
    main_L17:
    la $t2, _STRING4
    sw $t2, 144($sp)
    lw $t0, 144($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L18:
    li $t2, 136
    sw $t2, 148($sp)
    lw $t0, 148($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 152($sp)
    lw $t0, 152($sp)
    addu $t2, $t0, 136
    sw $t2, 156($sp)
    lw $t0, 152($sp)
    addu $t2, $t0, 4
    sw $t2, 152($sp)
    j main_L21
    main_L20:
    lw $t0, 156($sp)
    subu $t2, $t0, 4
    sw $t2, 156($sp)
    lw $t1, 156($sp)
    sw $zero, 0($t1)
    main_L21:
    lw $t0, 156($sp)
    lw $t1, 152($sp)
    seq $t2, $t0, $t1
    sw $t2, 160($sp)
    lw $t0, 160($sp)
    beqz $t0, main_L20
    li $t2, 33
    sw $t2, 164($sp)
    lw $t0, 164($sp)
    lw $t1, 152($sp)
    sw $t0, -4($t1)
    lw $t0, 80($sp)
    lw $t2, -4($t0)
    sw $t2, 168($sp)
    lw $t0, 96($sp)
    lw $t1, 168($sp)
    slt $t2, $t0, $t1
    sw $t2, 172($sp)
    lw $t0, 124($sp)
    lw $t1, 172($sp)
    and $t2, $t0, $t1
    sw $t2, 176($sp)
    lw $t0, 176($sp)
    beqz $t0, main_L24
    lw $t0, 136($sp)
    lw $t1, 80($sp)
    addu $t2, $t0, $t1
    sw $t2, 180($sp)
    lw $t0, 152($sp)
    lw $t1, 180($sp)
    sw $t0, 0($t1)
    j main_L25
    main_L24:
    la $t2, _STRING4
    sw $t2, 184($sp)
    lw $t0, 184($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L25:
    li $t2, 0
    sw $t2, 188($sp)
    j main_L39
    main_L26:
    la $t2, _Complex.make._entry
    sw $t2, 192($sp)
    li $t2, 4
    sw $t2, 196($sp)
    lw $t0, 196($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 200($sp)
    lw $t0, 192($sp)
    lw $t1, 200($sp)
    sw $t0, 0($t1)
    lw $t0, 188($sp)
    mul $t2, $t0, 512
    sw $t2, 204($sp)
    lw $t0, 204($sp)
    addu $t2, $t0, -8192
    sw $t2, 208($sp)
    lw $t0, 96($sp)
    mul $t2, $t0, 512
    sw $t2, 212($sp)
    lw $t0, 212($sp)
    addu $t2, $t0, -8192
    sw $t2, 216($sp)
    lw $t0, 200($sp)
    lw $t2, 0($t0)
    sw $t2, 220($sp)
    lw $t0, 200($sp)
    move $a0, $t0
    lw $t0, 208($sp)
    move $a1, $t0
    lw $t0, 216($sp)
    move $a2, $t0
    lw $t0, 220($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 224($sp)
    lw $t0, 132($sp)
    beqz $t0, main_L28
    lw $t0, 140($sp)
    lw $t2, 0($t0)
    sw $t2, 228($sp)
    j main_L29
    main_L28:
    la $t2, _STRING4
    sw $t2, 232($sp)
    lw $t0, 232($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L29:
    lw $t0, 228($sp)
    lw $t2, -4($t0)
    sw $t2, 236($sp)
    lw $t0, 188($sp)
    sge $t2, $t0, 0
    sw $t2, 240($sp)
    lw $t0, 188($sp)
    lw $t1, 236($sp)
    slt $t2, $t0, $t1
    sw $t2, 244($sp)
    lw $t0, 240($sp)
    lw $t1, 244($sp)
    and $t2, $t0, $t1
    sw $t2, 248($sp)
    lw $t0, 248($sp)
    beqz $t0, main_L31
    lw $t0, 188($sp)
    mul $t2, $t0, 4
    sw $t2, 252($sp)
    lw $t0, 252($sp)
    lw $t1, 228($sp)
    addu $t2, $t0, $t1
    sw $t2, 256($sp)
    lw $t0, 224($sp)
    lw $t1, 256($sp)
    sw $t0, 0($t1)
    j main_L32
    main_L31:
    la $t2, _STRING4
    sw $t2, 260($sp)
    lw $t0, 260($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L32:
    jal _Complex._new
    move $t2, $v0
    sw $t2, 264($sp)
    lw $t0, 176($sp)
    beqz $t0, main_L34
    lw $t0, 180($sp)
    lw $t2, 0($t0)
    sw $t2, 268($sp)
    j main_L35
    main_L34:
    la $t2, _STRING4
    sw $t2, 272($sp)
    lw $t0, 272($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L35:
    lw $t0, 268($sp)
    lw $t2, -4($t0)
    sw $t2, 276($sp)
    lw $t0, 188($sp)
    lw $t1, 276($sp)
    slt $t2, $t0, $t1
    sw $t2, 280($sp)
    lw $t0, 240($sp)
    lw $t1, 280($sp)
    and $t2, $t0, $t1
    sw $t2, 284($sp)
    lw $t0, 284($sp)
    beqz $t0, main_L37
    lw $t0, 252($sp)
    lw $t1, 268($sp)
    addu $t2, $t0, $t1
    sw $t2, 288($sp)
    lw $t0, 264($sp)
    lw $t1, 288($sp)
    sw $t0, 0($t1)
    j main_L38
    main_L37:
    la $t2, _STRING4
    sw $t2, 292($sp)
    lw $t0, 292($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L38:
    lw $t0, 188($sp)
    addu $t2, $t0, 1
    sw $t2, 296($sp)
    lw $t0, 296($sp)
    move $t2, $t0
    sw $t2, 188($sp)
    main_L39:
    lw $t0, 188($sp)
    slt $t2, $t0, 33
    sw $t2, 300($sp)
    lw $t0, 300($sp)
    bnez $t0, main_L26
    lw $t0, 96($sp)
    addu $t2, $t0, 1
    sw $t2, 304($sp)
    lw $t0, 304($sp)
    move $t2, $t0
    sw $t2, 96($sp)
    main_L41:
    lw $t0, 96($sp)
    slt $t2, $t0, 33
    sw $t2, 308($sp)
    lw $t0, 308($sp)
    bnez $t0, main_L11
    li $t2, 0
    sw $t2, 312($sp)
    j main_L69
    main_L43:
    li $t2, 0
    sw $t2, 316($sp)
    j main_L67
    main_L44:
    li $t2, 0
    sw $t2, 320($sp)
    j main_L65
    main_L45:
    lw $t0, 80($sp)
    lw $t2, -4($t0)
    sw $t2, 324($sp)
    lw $t0, 316($sp)
    sge $t2, $t0, 0
    sw $t2, 328($sp)
    lw $t0, 316($sp)
    lw $t1, 324($sp)
    slt $t2, $t0, $t1
    sw $t2, 332($sp)
    lw $t0, 328($sp)
    lw $t1, 332($sp)
    and $t2, $t0, $t1
    sw $t2, 336($sp)
    lw $t0, 336($sp)
    beqz $t0, main_L47
    lw $t0, 316($sp)
    mul $t2, $t0, 4
    sw $t2, 340($sp)
    lw $t0, 340($sp)
    lw $t1, 80($sp)
    addu $t2, $t0, $t1
    sw $t2, 344($sp)
    lw $t0, 344($sp)
    lw $t2, 0($t0)
    sw $t2, 348($sp)
    j main_L48
    main_L47:
    la $t2, _STRING4
    sw $t2, 352($sp)
    lw $t0, 352($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L48:
    lw $t0, 348($sp)
    lw $t2, -4($t0)
    sw $t2, 356($sp)
    lw $t0, 320($sp)
    sge $t2, $t0, 0
    sw $t2, 360($sp)
    lw $t0, 320($sp)
    lw $t1, 356($sp)
    slt $t2, $t0, $t1
    sw $t2, 364($sp)
    lw $t0, 360($sp)
    lw $t1, 364($sp)
    and $t2, $t0, $t1
    sw $t2, 368($sp)
    lw $t0, 368($sp)
    beqz $t0, main_L50
    lw $t0, 320($sp)
    mul $t2, $t0, 4
    sw $t2, 372($sp)
    lw $t0, 372($sp)
    lw $t1, 348($sp)
    addu $t2, $t0, $t1
    sw $t2, 376($sp)
    lw $t0, 376($sp)
    lw $t2, 0($t0)
    sw $t2, 380($sp)
    j main_L51
    main_L50:
    la $t2, _STRING4
    sw $t2, 384($sp)
    lw $t0, 384($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L51:
    la $t2, _Complex.abs2._entry
    sw $t2, 388($sp)
    li $t2, 8
    sw $t2, 392($sp)
    lw $t0, 392($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 396($sp)
    lw $t0, 388($sp)
    lw $t1, 396($sp)
    sw $t0, 0($t1)
    lw $t0, 380($sp)
    lw $t1, 396($sp)
    sw $t0, 4($t1)
    lw $t0, 396($sp)
    lw $t2, 0($t0)
    sw $t2, 400($sp)
    lw $t0, 396($sp)
    move $a0, $t0
    lw $t0, 400($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 404($sp)
    lw $t0, 404($sp)
    slt $t2, $t0, 67108864
    sw $t2, 408($sp)
    lw $t0, 408($sp)
    beqz $t0, main_L64
    la $t2, _Complex.add._entry
    sw $t2, 412($sp)
    li $t2, 4
    sw $t2, 416($sp)
    lw $t0, 416($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 420($sp)
    lw $t0, 412($sp)
    lw $t1, 420($sp)
    sw $t0, 0($t1)
    la $t2, _Complex.mul._entry
    sw $t2, 424($sp)
    li $t2, 4
    sw $t2, 428($sp)
    lw $t0, 428($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 432($sp)
    lw $t0, 424($sp)
    lw $t1, 432($sp)
    sw $t0, 0($t1)
    lw $t0, 432($sp)
    lw $t2, 0($t0)
    sw $t2, 436($sp)
    lw $t0, 432($sp)
    move $a0, $t0
    lw $t0, 380($sp)
    move $a1, $t0
    lw $t0, 380($sp)
    move $a2, $t0
    lw $t0, 436($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 440($sp)
    lw $t0, 60($sp)
    lw $t2, -4($t0)
    sw $t2, 444($sp)
    lw $t0, 316($sp)
    lw $t1, 444($sp)
    slt $t2, $t0, $t1
    sw $t2, 448($sp)
    lw $t0, 328($sp)
    lw $t1, 448($sp)
    and $t2, $t0, $t1
    sw $t2, 452($sp)
    lw $t0, 452($sp)
    beqz $t0, main_L54
    lw $t0, 340($sp)
    lw $t1, 60($sp)
    addu $t2, $t0, $t1
    sw $t2, 456($sp)
    lw $t0, 456($sp)
    lw $t2, 0($t0)
    sw $t2, 460($sp)
    j main_L55
    main_L54:
    la $t2, _STRING4
    sw $t2, 464($sp)
    lw $t0, 464($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L55:
    lw $t0, 460($sp)
    lw $t2, -4($t0)
    sw $t2, 468($sp)
    lw $t0, 320($sp)
    lw $t1, 468($sp)
    slt $t2, $t0, $t1
    sw $t2, 472($sp)
    lw $t0, 360($sp)
    lw $t1, 472($sp)
    and $t2, $t0, $t1
    sw $t2, 476($sp)
    lw $t0, 476($sp)
    beqz $t0, main_L57
    lw $t0, 372($sp)
    lw $t1, 460($sp)
    addu $t2, $t0, $t1
    sw $t2, 480($sp)
    lw $t0, 480($sp)
    lw $t2, 0($t0)
    sw $t2, 484($sp)
    j main_L58
    main_L57:
    la $t2, _STRING4
    sw $t2, 488($sp)
    lw $t0, 488($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L58:
    lw $t0, 420($sp)
    lw $t2, 0($t0)
    sw $t2, 492($sp)
    lw $t0, 420($sp)
    move $a0, $t0
    lw $t0, 440($sp)
    move $a1, $t0
    lw $t0, 484($sp)
    move $a2, $t0
    lw $t0, 492($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 496($sp)
    lw $t0, 336($sp)
    beqz $t0, main_L60
    j main_L61
    main_L60:
    la $t2, _STRING4
    sw $t2, 500($sp)
    lw $t0, 500($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L61:
    lw $t0, 368($sp)
    beqz $t0, main_L63
    lw $t0, 496($sp)
    lw $t1, 376($sp)
    sw $t0, 0($t1)
    j main_L64
    main_L63:
    la $t2, _STRING4
    sw $t2, 504($sp)
    lw $t0, 504($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L64:
    lw $t0, 320($sp)
    addu $t2, $t0, 1
    sw $t2, 508($sp)
    lw $t0, 508($sp)
    move $t2, $t0
    sw $t2, 320($sp)
    main_L65:
    lw $t0, 320($sp)
    slt $t2, $t0, 33
    sw $t2, 512($sp)
    lw $t0, 512($sp)
    bnez $t0, main_L45
    lw $t0, 316($sp)
    addu $t2, $t0, 1
    sw $t2, 516($sp)
    lw $t0, 516($sp)
    move $t2, $t0
    sw $t2, 316($sp)
    main_L67:
    lw $t0, 316($sp)
    slt $t2, $t0, 33
    sw $t2, 520($sp)
    lw $t0, 520($sp)
    bnez $t0, main_L44
    lw $t0, 312($sp)
    addu $t2, $t0, 1
    sw $t2, 524($sp)
    lw $t0, 524($sp)
    move $t2, $t0
    sw $t2, 312($sp)
    main_L69:
    lw $t0, 312($sp)
    slt $t2, $t0, 20
    sw $t2, 528($sp)
    lw $t0, 528($sp)
    bnez $t0, main_L43
    li $t2, 0
    sw $t2, 532($sp)
    j main_L84
    main_L71:
    li $t2, 0
    sw $t2, 536($sp)
    j main_L82
    main_L72:
    la $t2, _Complex.abs2._entry
    sw $t2, 540($sp)
    lw $t0, 80($sp)
    lw $t2, -4($t0)
    sw $t2, 544($sp)
    lw $t0, 532($sp)
    sge $t2, $t0, 0
    sw $t2, 548($sp)
    lw $t0, 532($sp)
    lw $t1, 544($sp)
    slt $t2, $t0, $t1
    sw $t2, 552($sp)
    lw $t0, 548($sp)
    lw $t1, 552($sp)
    and $t2, $t0, $t1
    sw $t2, 548($sp)
    lw $t0, 548($sp)
    beqz $t0, main_L74
    lw $t0, 532($sp)
    mul $t2, $t0, 4
    sw $t2, 556($sp)
    lw $t0, 556($sp)
    lw $t1, 80($sp)
    addu $t2, $t0, $t1
    sw $t2, 556($sp)
    lw $t0, 556($sp)
    lw $t2, 0($t0)
    sw $t2, 560($sp)
    j main_L75
    main_L74:
    la $t2, _STRING4
    sw $t2, 564($sp)
    lw $t0, 564($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L75:
    lw $t0, 560($sp)
    lw $t2, -4($t0)
    sw $t2, 568($sp)
    lw $t0, 536($sp)
    sge $t2, $t0, 0
    sw $t2, 572($sp)
    lw $t0, 536($sp)
    lw $t1, 568($sp)
    slt $t2, $t0, $t1
    sw $t2, 576($sp)
    lw $t0, 572($sp)
    lw $t1, 576($sp)
    and $t2, $t0, $t1
    sw $t2, 572($sp)
    lw $t0, 572($sp)
    beqz $t0, main_L77
    lw $t0, 536($sp)
    mul $t2, $t0, 4
    sw $t2, 580($sp)
    lw $t0, 580($sp)
    lw $t1, 560($sp)
    addu $t2, $t0, $t1
    sw $t2, 580($sp)
    lw $t0, 580($sp)
    lw $t2, 0($t0)
    sw $t2, 584($sp)
    j main_L78
    main_L77:
    la $t2, _STRING4
    sw $t2, 588($sp)
    lw $t0, 588($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L78:
    li $t2, 8
    sw $t2, 592($sp)
    lw $t0, 592($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 596($sp)
    lw $t0, 540($sp)
    lw $t1, 596($sp)
    sw $t0, 0($t1)
    lw $t0, 584($sp)
    lw $t1, 596($sp)
    sw $t0, 4($t1)
    lw $t0, 596($sp)
    lw $t2, 0($t0)
    sw $t2, 600($sp)
    lw $t0, 596($sp)
    move $a0, $t0
    lw $t0, 600($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 604($sp)
    lw $t0, 604($sp)
    slt $t2, $t0, 67108864
    sw $t2, 608($sp)
    lw $t0, 608($sp)
    beqz $t0, main_L80
    la $t2, _STRING5
    sw $t2, 612($sp)
    lw $t0, 612($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    j main_L81
    main_L80:
    la $t2, _STRING6
    sw $t2, 616($sp)
    lw $t0, 616($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    main_L81:
    lw $t0, 536($sp)
    addu $t2, $t0, 1
    sw $t2, 620($sp)
    lw $t0, 620($sp)
    move $t2, $t0
    sw $t2, 536($sp)
    main_L82:
    lw $t0, 536($sp)
    slt $t2, $t0, 33
    sw $t2, 624($sp)
    lw $t0, 624($sp)
    bnez $t0, main_L72
    la $t2, _STRING7
    sw $t2, 628($sp)
    lw $t0, 628($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    lw $t0, 532($sp)
    addu $t2, $t0, 1
    sw $t2, 632($sp)
    lw $t0, 632($sp)
    move $t2, $t0
    sw $t2, 532($sp)
    main_L84:
    lw $t0, 532($sp)
    slt $t2, $t0, 33
    sw $t2, 636($sp)
    lw $t0, 636($sp)
    bnez $t0, main_L71
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
    addu $sp, $sp, 640
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