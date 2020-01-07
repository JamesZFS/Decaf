.data
.align 2
_Main:
    .word 0
    .word _STRING0
_Rng:
    .word 0
    .word _STRING1
    .word _Rng.next
_QuickSort:
    .word 0
    .word _STRING2
_MergeSort:
    .word 0
    .word _STRING3

.data
_STRING0:
    .asciiz "Main"
_STRING1:
    .asciiz "Rng"
_STRING2:
    .asciiz "QuickSort"
_STRING3:
    .asciiz "MergeSort"
_STRING4:
    .asciiz "Decaf runtime error: Cannot create negative-sized array\n"
_STRING5:
    .asciiz "Decaf runtime error: Division by zero error"
_STRING6:
    .asciiz "Decaf runtime error: Array subscript out of bounds\n"
_STRING7:
    .asciiz " "
_STRING8:
    .asciiz "\n"

.text
.globl _Main._new
_Main._new:
    li $a0, 4
    li $v0, 9
    syscall
    la $t8, _Main
    sw $t8, 0($v0)
    _Main._new_Ret:
    jr $ra

.text
.globl _Rng._new
_Rng._new:
    li $a0, 8
    li $v0, 9
    syscall
    la $t8, _Rng
    sw $t8, 0($v0)
    sw $zero, 4($v0)
    _Rng._new_Ret:
    jr $ra

.text
.globl _QuickSort._new
_QuickSort._new:
    li $a0, 4
    li $v0, 9
    syscall
    la $t8, _QuickSort
    sw $t8, 0($v0)
    _QuickSort._new_Ret:
    jr $ra

.text
.globl _MergeSort._new
_MergeSort._new:
    li $a0, 4
    li $v0, 9
    syscall
    la $t8, _MergeSort
    sw $t8, 0($v0)
    _MergeSort._new_Ret:
    jr $ra

.text
.globl length
length:
    lw $a1, 4($a0)
    lw $a1, -4($a1)
    move $v0, $a1
    length_Ret:
    jr $ra

.text
.globl main
main:
    subu $sp, $sp, 36
    sw $s2, 16($sp)
    sw $s4, 20($sp)
    sw $s7, 24($sp)
    sw $ra, 28($sp)
    la $s7, _Rng.make._entry
    li $a0, 4
    li $v0, 9
    syscall
    move $a0, $v0
    sw $s7, 0($a0)
    lw $v0, 0($a0)
    li $a1, 19260817
    jalr $v0
    move $s7, $v0
    li $a0, 2004
    li $v0, 9
    syscall
    move $s4, $v0
    addu $t8, $s4, 2004
    addu $s4, $s4, 4
    j main_L4
    main_L3:
    subu $t8, $t8, 4
    sw $zero, 0($t8)
    main_L4:
    seq $t5, $t8, $s4
    beqz $t5, main_L3
    li $t8, 500
    sw $t8, -4($s4)
    li $a0, 2004
    li $v0, 9
    syscall
    move $s2, $v0
    addu $t8, $s2, 2004
    addu $s2, $s2, 4
    j main_L8
    main_L7:
    subu $t8, $t8, 4
    sw $zero, 0($t8)
    main_L8:
    seq $t5, $t8, $s2
    beqz $t5, main_L7
    li $t8, 500
    sw $t8, -4($s2)
    li $t8, 0
    sw $t8, 32($sp)
    j main_L21
    main_L10:
    la $t8, _Rng.next._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s7, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    rem $t5, $v0, 500
    lw $a0, -4($s4)
    lw $t8, 32($sp)
    sge $t2, $t8, 0
    lw $t8, 32($sp)
    slt $t8, $t8, $a0
    and $t8, $t2, $t8
    beqz $t8, main_L13
    lw $a0, 32($sp)
    mul $ra, $a0, 4
    addu $a0, $ra, $s4
    sw $t5, 0($a0)
    j main_L14
    main_L13:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L14:
    beqz $t8, main_L16
    lw $t5, 0($a0)
    j main_L17
    main_L16:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L17:
    lw $t8, -4($s2)
    lw $a0, 32($sp)
    slt $t8, $a0, $t8
    and $t8, $t2, $t8
    beqz $t8, main_L19
    addu $t8, $ra, $s2
    sw $t5, 0($t8)
    j main_L20
    main_L19:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L20:
    lw $t8, 32($sp)
    addu $t8, $t8, 1
    sw $t8, 32($sp)
    main_L21:
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    la $v0, length
    sw $v0, 0($a0)
    sw $s4, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    lw $t8, 32($sp)
    slt $t8, $t8, $v0
    bnez $t8, main_L10
    la $t8, _QuickSort.sort._entry
    li $a0, 4
    li $v0, 9
    syscall
    move $s7, $v0
    sw $t8, 0($s7)
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    la $v0, length
    sw $v0, 0($a0)
    sw $s4, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    subu $a3, $v0, 1
    lw $v0, 0($s7)
    move $a0, $s7
    move $a1, $s4
    move $a2, $zero
    jalr $v0
    li $s7, 0
    j main_L27
    main_L23:
    lw $t8, -4($s4)
    sge $t5, $s7, 0
    slt $t8, $s7, $t8
    and $t5, $t5, $t8
    beqz $t5, main_L25
    mul $t8, $s7, 4
    addu $t8, $t8, $s4
    lw $a0, 0($t8)
    j main_L26
    main_L25:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L26:
    li $v0, 1
    syscall
    la $a0, _STRING7
    li $v0, 4
    syscall
    addu $s7, $s7, 1
    main_L27:
    li $a0, 8
    li $v0, 9
    syscall
    la $t8, length
    sw $t8, 0($v0)
    sw $s4, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    slt $t8, $s7, $v0
    bnez $t8, main_L23
    la $a0, _STRING8
    li $v0, 4
    syscall
    la $s7, _MergeSort.sort._entry
    li $a0, 4
    li $v0, 9
    syscall
    move $a0, $v0
    sw $s7, 0($a0)
    lw $v0, 0($a0)
    move $a1, $s2
    jalr $v0
    li $s7, 0
    j main_L33
    main_L29:
    lw $s4, -4($s2)
    sge $t8, $s7, 0
    slt $s4, $s7, $s4
    and $t8, $t8, $s4
    beqz $t8, main_L31
    mul $s4, $s7, 4
    addu $s4, $s4, $s2
    lw $a0, 0($s4)
    j main_L32
    main_L31:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L32:
    li $v0, 1
    syscall
    la $a0, _STRING7
    li $v0, 4
    syscall
    addu $s7, $s7, 1
    main_L33:
    li $a0, 8
    li $v0, 9
    syscall
    la $s4, length
    sw $s4, 0($v0)
    sw $s2, 4($v0)
    lw $s4, 0($v0)
    move $a0, $v0
    jalr $s4
    slt $s4, $s7, $v0
    bnez $s4, main_L29
    la $a0, _STRING8
    li $v0, 4
    syscall
    main_Ret:
    lw $s2, 16($sp)
    lw $s4, 20($sp)
    lw $s7, 24($sp)
    lw $ra, 28($sp)
    addu $sp, $sp, 36
    jr $ra

.text
.globl main._entry
main._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    jal main
    main._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Rng.make
_Rng.make:
    subu $sp, $sp, 20
    sw $a0, 20($sp)
    sw $ra, 16($sp)
    jal _Rng._new
    lw $t8, 20($sp)
    sw $t8, 4($v0)
    _Rng.make_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Rng.make._entry
_Rng.make._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    move $a0, $a1
    jal _Rng.make
    _Rng.make._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Rng.next
_Rng.next:
    lw $v0, 4($a0)
    rem $v0, $v0, 10000
    mul $v0, $v0, 15625
    addu $v0, $v0, 22221
    rem $v0, $v0, 65536
    sw $v0, 4($a0)
    lw $v0, 4($a0)
    _Rng.next_Ret:
    jr $ra

.text
.globl _Rng.next._entry
_Rng.next._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 8($v0)
    jalr $v0
    _Rng.next._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _QuickSort.sort
_QuickSort.sort:
    subu $sp, $sp, 24
    sw $a0, 24($sp)
    move $t8, $a1
    sw $a2, 32($sp)
    sw $ra, 16($sp)
    sw $t8, 20($sp)
    lw $a3, 32($sp)
    lw $t5, 32($sp)
    subu $t5, $t5, $t8
    div $t5, $t5, 2
    addu $t2, $t8, $t5
    lw $t5, 24($sp)
    lw $t5, -4($t5)
    sge $ra, $t2, 0
    slt $a0, $t2, $t5
    and $ra, $ra, $a0
    beqz $ra, _QuickSort.sort_L4
    mul $a0, $t2, 4
    lw $t2, 24($sp)
    addu $a0, $a0, $t2
    lw $t7, 0($a0)
    j _QuickSort.sort_L5
    _QuickSort.sort_L4:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L5:
    j _QuickSort.sort_L32
    _QuickSort.sort_L6:
    j _QuickSort.sort_L8
    _QuickSort.sort_L7:
    lw $t2, 20($sp)
    addu $t2, $t2, 1
    sw $t2, 20($sp)
    _QuickSort.sort_L8:
    lw $t2, 20($sp)
    sge $a0, $t2, 0
    lw $t2, 20($sp)
    slt $t2, $t2, $t5
    and $t2, $a0, $t2
    beqz $t2, _QuickSort.sort_L10
    lw $t2, 20($sp)
    mul $ra, $t2, 4
    lw $t2, 24($sp)
    addu $t4, $ra, $t2
    lw $ra, 0($t4)
    j _QuickSort.sort_L11
    _QuickSort.sort_L10:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L11:
    slt $t2, $ra, $t7
    bnez $t2, _QuickSort.sort_L7
    j _QuickSort.sort_L14
    _QuickSort.sort_L13:
    subu $a3, $a3, 1
    _QuickSort.sort_L14:
    sge $t1, $a3, 0
    slt $t2, $a3, $t5
    and $a2, $t1, $t2
    beqz $a2, _QuickSort.sort_L16
    mul $t1, $a3, 4
    lw $t2, 24($sp)
    addu $t9, $t1, $t2
    lw $t1, 0($t9)
    j _QuickSort.sort_L17
    _QuickSort.sort_L16:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L17:
    sgt $t2, $t1, $t7
    bnez $t2, _QuickSort.sort_L13
    lw $t2, 20($sp)
    sle $t2, $t2, $a3
    beqz $t2, _QuickSort.sort_L32
    lw $t2, 20($sp)
    slt $t2, $t2, $t5
    and $t2, $a0, $t2
    beqz $t2, _QuickSort.sort_L21
    j _QuickSort.sort_L22
    _QuickSort.sort_L21:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L22:
    beqz $a2, _QuickSort.sort_L24
    j _QuickSort.sort_L25
    _QuickSort.sort_L24:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L25:
    beqz $t2, _QuickSort.sort_L27
    sw $t1, 0($t4)
    j _QuickSort.sort_L28
    _QuickSort.sort_L27:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L28:
    beqz $a2, _QuickSort.sort_L30
    sw $ra, 0($t9)
    j _QuickSort.sort_L31
    _QuickSort.sort_L30:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L31:
    lw $t2, 20($sp)
    addu $t2, $t2, 1
    sw $t2, 20($sp)
    subu $a3, $a3, 1
    _QuickSort.sort_L32:
    lw $t2, 20($sp)
    sle $t2, $t2, $a3
    bnez $t2, _QuickSort.sort_L6
    slt $t5, $t8, $a3
    beqz $t5, _QuickSort.sort_L35
    la $t5, _QuickSort.sort._entry
    li $a0, 4
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t5, 0($a0)
    lw $v0, 0($a0)
    lw $a1, 24($sp)
    move $a2, $t8
    jalr $v0
    _QuickSort.sort_L35:
    lw $t5, 20($sp)
    lw $t8, 32($sp)
    slt $t8, $t5, $t8
    beqz $t8, _QuickSort.sort_L37
    la $t8, _QuickSort.sort._entry
    li $a0, 4
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 0($a0)
    lw $a1, 24($sp)
    lw $a2, 20($sp)
    lw $a3, 32($sp)
    jalr $v0
    _QuickSort.sort_L37:
    _QuickSort.sort_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 24
    jr $ra

.text
.globl _QuickSort.sort._entry
_QuickSort.sort._entry:
    subu $sp, $sp, 20
    move $a0, $a1
    move $a1, $a2
    move $a2, $a3
    sw $ra, 16($sp)
    jal _QuickSort.sort
    _QuickSort.sort._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _MergeSort.sort
_MergeSort.sort:
    subu $sp, $sp, 32
    sw $a0, 32($sp)
    sw $s1, 20($sp)
    sw $s3, 24($sp)
    sw $ra, 28($sp)
    la $t8, _MergeSort.sort_impl._entry
    li $a0, 4
    li $v0, 9
    syscall
    move $s1, $v0
    sw $t8, 0($s1)
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    la $v0, length
    sw $v0, 0($a0)
    lw $v0, 32($sp)
    sw $v0, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    move $s3, $v0
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    la $v0, length
    sw $v0, 0($a0)
    lw $v0, 32($sp)
    sw $v0, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    move $t8, $v0
    slt $t5, $t8, 0
    beqz $t5, _MergeSort.sort_L3
    la $a0, _STRING4
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_L3:
    mul $a0, $t8, 4
    addu $a0, $a0, 4
    li $v0, 9
    syscall
    addu $a0, $v0, $a0
    addu $v0, $v0, 4
    j _MergeSort.sort_L5
    _MergeSort.sort_L4:
    subu $a0, $a0, 4
    sw $zero, 0($a0)
    _MergeSort.sort_L5:
    seq $t5, $a0, $v0
    beqz $t5, _MergeSort.sort_L4
    sw $t8, -4($v0)
    lw $t8, 0($s1)
    move $a0, $s1
    lw $a1, 32($sp)
    move $a2, $zero
    move $a3, $s3
    sw $v0, 16($sp)
    jalr $t8
    _MergeSort.sort_Ret:
    lw $s1, 20($sp)
    lw $s3, 24($sp)
    lw $ra, 28($sp)
    addu $sp, $sp, 32
    jr $ra

.text
.globl _MergeSort.sort._entry
_MergeSort.sort._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    move $a0, $a1
    jal _MergeSort.sort
    _MergeSort.sort._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _MergeSort.sort_impl
_MergeSort.sort_impl:
    subu $sp, $sp, 28
    sw $a0, 28($sp)
    sw $a1, 32($sp)
    sw $a2, 36($sp)
    sw $a3, 40($sp)
    sw $ra, 20($sp)
    lw $t8, 32($sp)
    addu $t8, $t8, 1
    lw $t5, 36($sp)
    slt $t8, $t8, $t5
    beqz $t8, _MergeSort.sort_impl_L45
    lw $t5, 32($sp)
    lw $t8, 36($sp)
    addu $t8, $t5, $t8
    div $t8, $t8, 2
    sw $t8, 24($sp)
    la $t8, _MergeSort.sort_impl._entry
    li $a0, 4
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    lw $a1, 28($sp)
    lw $a2, 32($sp)
    lw $a3, 24($sp)
    lw $v0, 40($sp)
    sw $v0, 16($sp)
    jalr $t8
    la $t8, _MergeSort.sort_impl._entry
    li $a0, 4
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    lw $a1, 28($sp)
    lw $a2, 24($sp)
    lw $a3, 36($sp)
    lw $v0, 40($sp)
    sw $v0, 16($sp)
    jalr $t8
    lw $t5, 32($sp)
    lw $t2, 24($sp)
    li $t8, 0
    j _MergeSort.sort_impl_L26
    _MergeSort.sort_impl_L4:
    lw $a3, 28($sp)
    lw $a3, -4($a3)
    sge $a0, $t2, 0
    slt $ra, $t2, $a3
    and $t4, $a0, $ra
    beqz $t4, _MergeSort.sort_impl_L6
    mul $ra, $t2, 4
    lw $a0, 28($sp)
    addu $a0, $ra, $a0
    lw $a0, 0($a0)
    j _MergeSort.sort_impl_L7
    _MergeSort.sort_impl_L6:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L7:
    sge $ra, $t5, 0
    slt $a3, $t5, $a3
    and $a3, $ra, $a3
    beqz $a3, _MergeSort.sort_impl_L9
    mul $ra, $t5, 4
    lw $t7, 28($sp)
    addu $ra, $ra, $t7
    lw $t7, 0($ra)
    j _MergeSort.sort_impl_L10
    _MergeSort.sort_impl_L9:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L10:
    slt $ra, $a0, $t7
    beqz $ra, _MergeSort.sort_impl_L18
    beqz $t4, _MergeSort.sort_impl_L13
    j _MergeSort.sort_impl_L14
    _MergeSort.sort_impl_L13:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L14:
    lw $a3, 40($sp)
    lw $a3, -4($a3)
    sge $ra, $t8, 0
    slt $a3, $t8, $a3
    and $ra, $ra, $a3
    beqz $ra, _MergeSort.sort_impl_L16
    mul $a3, $t8, 4
    lw $ra, 40($sp)
    addu $a3, $a3, $ra
    sw $a0, 0($a3)
    j _MergeSort.sort_impl_L17
    _MergeSort.sort_impl_L16:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L17:
    addu $t2, $t2, 1
    j _MergeSort.sort_impl_L25
    _MergeSort.sort_impl_L18:
    beqz $a3, _MergeSort.sort_impl_L20
    j _MergeSort.sort_impl_L21
    _MergeSort.sort_impl_L20:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L21:
    lw $a3, 40($sp)
    lw $a3, -4($a3)
    sge $a0, $t8, 0
    slt $a3, $t8, $a3
    and $a0, $a0, $a3
    beqz $a0, _MergeSort.sort_impl_L23
    mul $a0, $t8, 4
    lw $a3, 40($sp)
    addu $a0, $a0, $a3
    sw $t7, 0($a0)
    j _MergeSort.sort_impl_L24
    _MergeSort.sort_impl_L23:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L24:
    addu $t5, $t5, 1
    _MergeSort.sort_impl_L25:
    addu $t8, $t8, 1
    _MergeSort.sort_impl_L26:
    lw $a3, 24($sp)
    slt $a0, $t5, $a3
    lw $a3, 36($sp)
    slt $a3, $t2, $a3
    and $a3, $a0, $a3
    bnez $a3, _MergeSort.sort_impl_L4
    j _MergeSort.sort_impl_L35
    _MergeSort.sort_impl_L28:
    lw $t2, 28($sp)
    lw $t2, -4($t2)
    sge $a3, $t5, 0
    slt $t2, $t5, $t2
    and $a3, $a3, $t2
    beqz $a3, _MergeSort.sort_impl_L30
    mul $t2, $t5, 4
    lw $a3, 28($sp)
    addu $t2, $t2, $a3
    lw $t2, 0($t2)
    j _MergeSort.sort_impl_L31
    _MergeSort.sort_impl_L30:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L31:
    lw $a3, 40($sp)
    lw $a3, -4($a3)
    sge $a0, $t8, 0
    slt $a3, $t8, $a3
    and $a0, $a0, $a3
    beqz $a0, _MergeSort.sort_impl_L33
    mul $a3, $t8, 4
    lw $a0, 40($sp)
    addu $a3, $a3, $a0
    sw $t2, 0($a3)
    j _MergeSort.sort_impl_L34
    _MergeSort.sort_impl_L33:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L34:
    addu $t8, $t8, 1
    addu $t5, $t5, 1
    _MergeSort.sort_impl_L35:
    lw $t2, 24($sp)
    slt $t2, $t5, $t2
    bnez $t2, _MergeSort.sort_impl_L28
    li $t5, 0
    j _MergeSort.sort_impl_L44
    _MergeSort.sort_impl_L37:
    lw $t2, 40($sp)
    lw $t2, -4($t2)
    sge $a3, $t5, 0
    slt $t2, $t5, $t2
    and $a3, $a3, $t2
    beqz $a3, _MergeSort.sort_impl_L39
    mul $a3, $t5, 4
    lw $t2, 40($sp)
    addu $a3, $a3, $t2
    lw $ra, 0($a3)
    j _MergeSort.sort_impl_L40
    _MergeSort.sort_impl_L39:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L40:
    lw $t2, 32($sp)
    addu $a0, $t5, $t2
    lw $t2, 28($sp)
    lw $t2, -4($t2)
    sge $a3, $a0, 0
    slt $t2, $a0, $t2
    and $a3, $a3, $t2
    beqz $a3, _MergeSort.sort_impl_L42
    mul $a3, $a0, 4
    lw $t2, 28($sp)
    addu $a3, $a3, $t2
    sw $ra, 0($a3)
    j _MergeSort.sort_impl_L43
    _MergeSort.sort_impl_L42:
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L43:
    addu $t5, $t5, 1
    _MergeSort.sort_impl_L44:
    slt $t2, $t5, $t8
    bnez $t2, _MergeSort.sort_impl_L37
    _MergeSort.sort_impl_L45:
    _MergeSort.sort_impl_Ret:
    lw $ra, 20($sp)
    addu $sp, $sp, 28
    jr $ra

.text
.globl _MergeSort.sort_impl._entry
_MergeSort.sort_impl._entry:
    subu $sp, $sp, 20
    move $a0, $a1
    move $a1, $a2
    move $a2, $a3
    lw $a3, 36($sp)
    sw $ra, 16($sp)
    jal _MergeSort.sort_impl
    _MergeSort.sort_impl._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
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