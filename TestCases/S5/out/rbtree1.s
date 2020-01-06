.data
.align 2
_Main:
    .word 0
    .word _STRING0
_Rng:
    .word 0
    .word _STRING1
    .word _Rng.next
_Node:
    .word 0
    .word _STRING2
_RBTree:
    .word _Node
    .word _STRING3
    .word _RBTree.transplant
    .word _RBTree.rotate
    .word _RBTree.insert_fix
    .word _RBTree.insert
    .word _RBTree.delete_fix
    .word _RBTree.delete
    .word _RBTree.print
    .word _RBTree.print_impl

.data
_STRING0:
    .asciiz "Main"
_STRING1:
    .asciiz "Rng"
_STRING2:
    .asciiz "Node"
_STRING3:
    .asciiz "RBTree"
_STRING4:
    .asciiz "Decaf runtime error: Division by zero error"
_STRING5:
    .asciiz " "

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
.globl _Node._new
_Node._new:
    li $a0, 24
    li $v0, 9
    syscall
    la $t8, _Node
    sw $t8, 0($v0)
    sw $zero, 4($v0)
    sw $zero, 8($v0)
    sw $zero, 12($v0)
    sw $zero, 16($v0)
    sw $zero, 20($v0)
    _Node._new_Ret:
    jr $ra

.text
.globl _RBTree._new
_RBTree._new:
    li $a0, 32
    li $v0, 9
    syscall
    la $t8, _RBTree
    sw $t8, 0($v0)
    sw $zero, 4($v0)
    sw $zero, 8($v0)
    sw $zero, 12($v0)
    sw $zero, 16($v0)
    sw $zero, 20($v0)
    sw $zero, 24($v0)
    sw $zero, 28($v0)
    _RBTree._new_Ret:
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
    subu $sp, $sp, 44
    sw $s1, 16($sp)
    sw $s4, 20($sp)
    sw $s7, 24($sp)
    sw $ra, 28($sp)
    la $s7, _Rng.make._entry
    li $a0, 4
    li $v0, 9
    syscall
    sw $s7, 0($v0)
    lw $s7, 0($v0)
    move $a0, $v0
    li $a1, 19260817
    jalr $s7
    sw $v0, 32($sp)
    la $s7, _RBTree.make1._entry
    li $a0, 4
    li $v0, 9
    syscall
    move $a0, $v0
    sw $s7, 0($a0)
    lw $v0, 0($a0)
    jalr $v0
    move $s1, $v0
    li $s4, 0
    j main_L11
    main_L2:
    li $s7, 0
    sw $s7, 36($sp)
    j main_L5
    main_L3:
    la $t8, _RBTree.insert._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $s7, $v0
    sw $t8, 0($s7)
    sw $s1, 4($s7)
    la $t8, _Rng.next._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    lw $t8, 32($sp)
    sw $t8, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    rem $a1, $v0, 500
    lw $v0, 0($s7)
    move $a0, $s7
    jalr $v0
    lw $s7, 36($sp)
    addu $s7, $s7, 1
    sw $s7, 36($sp)
    main_L5:
    lw $s7, 36($sp)
    slt $s7, $s7, 500
    bnez $s7, main_L3
    li $s7, 0
    j main_L9
    main_L7:
    la $t8, _RBTree.delete._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $v0, 40($sp)
    lw $t5, 40($sp)
    sw $t8, 0($t5)
    lw $t8, 40($sp)
    sw $s1, 4($t8)
    la $t8, _Rng.next._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    lw $t8, 32($sp)
    sw $t8, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    rem $a1, $v0, 500
    lw $v0, 40($sp)
    lw $v0, 0($v0)
    lw $a0, 40($sp)
    jalr $v0
    addu $s7, $s7, 1
    main_L9:
    slt $t8, $s7, 500
    bnez $t8, main_L7
    addu $s7, $s4, 1
    move $s4, $s7
    main_L11:
    slt $s7, $s4, 5
    bnez $s7, main_L2
    la $s7, _RBTree.print._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $s7, 0($a0)
    sw $s1, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    main_Ret:
    lw $s1, 16($sp)
    lw $s4, 20($sp)
    lw $s7, 24($sp)
    lw $ra, 28($sp)
    addu $sp, $sp, 44
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
.globl _Node.make
_Node.make:
    subu $sp, $sp, 20
    sw $a0, 20($sp)
    sw $a1, 24($sp)
    sw $a2, 28($sp)
    sw $ra, 16($sp)
    jal _Node._new
    lw $t8, 28($sp)
    sw $t8, 4($v0)
    lw $t8, 20($sp)
    sw $t8, 16($v0)
    lw $t8, 24($sp)
    sw $t8, 8($v0)
    lw $t8, 24($sp)
    sw $t8, 12($v0)
    li $t8, 1
    sw $t8, 20($v0)
    _Node.make_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Node.make._entry
_Node.make._entry:
    subu $sp, $sp, 20
    move $a0, $a1
    move $a1, $a2
    move $a2, $a3
    sw $ra, 16($sp)
    jal _Node.make
    _Node.make._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _RBTree.make1
_RBTree.make1:
    subu $sp, $sp, 24
    sw $s4, 16($sp)
    sw $ra, 20($sp)
    jal _RBTree._new
    move $s4, $v0
    jal _Node._new
    sw $v0, 16($v0)
    sw $v0, 8($v0)
    sw $v0, 12($v0)
    sw $v0, 24($s4)
    sw $v0, 28($s4)
    move $v0, $s4
    _RBTree.make1_Ret:
    lw $s4, 16($sp)
    lw $ra, 20($sp)
    addu $sp, $sp, 24
    jr $ra

.text
.globl _RBTree.make1._entry
_RBTree.make1._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    jal _RBTree.make1
    _RBTree.make1._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _RBTree.transplant
_RBTree.transplant:
    lw $t5, 16($a1)
    lw $t8, 28($a0)
    seq $t8, $t5, $t8
    beqz $t8, _RBTree.transplant_L3
    sw $a2, 24($a0)
    j _RBTree.transplant_L6
    _RBTree.transplant_L3:
    lw $t8, 12($t5)
    seq $t8, $t8, $a1
    beqz $t8, _RBTree.transplant_L5
    sw $a2, 12($t5)
    j _RBTree.transplant_L6
    _RBTree.transplant_L5:
    sw $a2, 8($t5)
    _RBTree.transplant_L6:
    sw $t5, 16($a2)
    _RBTree.transplant_Ret:
    jr $ra

.text
.globl _RBTree.transplant._entry
_RBTree.transplant._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 8($v0)
    jalr $v0
    _RBTree.transplant._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _RBTree.rotate
_RBTree.rotate:
    lw $t8, 16($a1)
    lw $t2, 16($t8)
    sw $t2, 16($a1)
    lw $t5, 28($a0)
    seq $t5, $t2, $t5
    beqz $t5, _RBTree.rotate_L3
    sw $a1, 24($a0)
    j _RBTree.rotate_L6
    _RBTree.rotate_L3:
    lw $t5, 12($t2)
    seq $t5, $t5, $t8
    beqz $t5, _RBTree.rotate_L5
    sw $a1, 12($t2)
    j _RBTree.rotate_L6
    _RBTree.rotate_L5:
    sw $a1, 8($t2)
    _RBTree.rotate_L6:
    lw $t5, 8($t8)
    seq $t5, $t5, $a1
    beqz $t5, _RBTree.rotate_L8
    lw $t5, 12($a1)
    sw $t5, 8($t8)
    lw $t5, 12($a1)
    sw $t8, 16($t5)
    sw $t8, 12($a1)
    j _RBTree.rotate_L9
    _RBTree.rotate_L8:
    lw $t5, 8($a1)
    sw $t5, 12($t8)
    lw $t5, 8($a1)
    sw $t8, 16($t5)
    sw $t8, 8($a1)
    _RBTree.rotate_L9:
    sw $a1, 16($t8)
    _RBTree.rotate_Ret:
    jr $ra

.text
.globl _RBTree.rotate._entry
_RBTree.rotate._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 12($v0)
    jalr $v0
    _RBTree.rotate._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _RBTree.insert_fix
_RBTree.insert_fix:
    subu $sp, $sp, 24
    sw $a0, 24($sp)
    sw $a1, 28($sp)
    sw $ra, 16($sp)
    j _RBTree.insert_fix_L10
    _RBTree.insert_fix_L2:
    lw $a1, 20($sp)
    lw $t8, 20($sp)
    lw $t5, 16($t8)
    lw $t8, 8($t5)
    lw $t2, 20($sp)
    seq $a0, $t8, $t2
    beqz $a0, _RBTree.insert_fix_L4
    j _RBTree.insert_fix_L5
    _RBTree.insert_fix_L4:
    lw $t8, 12($t5)
    _RBTree.insert_fix_L5:
    lw $t2, 20($t8)
    beqz $t2, _RBTree.insert_fix_L7
    lw $t2, 20($sp)
    sw $zero, 20($t2)
    sw $zero, 20($t8)
    li $t8, 1
    sw $t8, 20($t5)
    sw $t5, 28($sp)
    j _RBTree.insert_fix_L10
    _RBTree.insert_fix_L7:
    lw $t8, 20($sp)
    lw $t2, 8($t8)
    lw $t8, 28($sp)
    seq $t8, $t2, $t8
    sne $t8, $t8, $a0
    beqz $t8, _RBTree.insert_fix_L9
    la $t8, _RBTree.rotate._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 24($sp)
    sw $v0, 4($a0)
    lw $v0, 0($a0)
    lw $a1, 28($sp)
    jalr $v0
    lw $a1, 28($sp)
    lw $t8, 20($sp)
    sw $t8, 28($sp)
    lw $t5, 16($a1)
    _RBTree.insert_fix_L9:
    sw $zero, 20($a1)
    li $t8, 1
    sw $t8, 20($t5)
    la $t8, _RBTree.rotate._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    lw $t8, 24($sp)
    sw $t8, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    _RBTree.insert_fix_L10:
    lw $t8, 28($sp)
    lw $t8, 16($t8)
    sw $t8, 20($sp)
    lw $t8, 20($sp)
    lw $t8, 20($t8)
    bnez $t8, _RBTree.insert_fix_L2
    lw $t8, 24($sp)
    lw $t8, 24($t8)
    sw $zero, 20($t8)
    _RBTree.insert_fix_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 24
    jr $ra

.text
.globl _RBTree.insert_fix._entry
_RBTree.insert_fix._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 16($v0)
    jalr $v0
    _RBTree.insert_fix._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _RBTree.insert
_RBTree.insert:
    subu $sp, $sp, 28
    sw $a0, 28($sp)
    sw $a1, 32($sp)
    sw $fp, 16($sp)
    sw $ra, 20($sp)
    lw $t8, 28($sp)
    lw $t8, 24($t8)
    lw $t5, 28($sp)
    lw $fp, 28($t5)
    sw $fp, 24($sp)
    j _RBTree.insert_L7
    _RBTree.insert_L2:
    sw $t8, 24($sp)
    lw $t2, 4($t8)
    lw $t5, 32($sp)
    seq $t5, $t2, $t5
    beqz $t5, _RBTree.insert_L4
    j _RBTree.insert_Ret
    _RBTree.insert_L4:
    lw $t5, 32($sp)
    slt $t5, $t2, $t5
    beqz $t5, _RBTree.insert_L6
    lw $t8, 12($t8)
    j _RBTree.insert_L7
    _RBTree.insert_L6:
    lw $t8, 8($t8)
    _RBTree.insert_L7:
    sne $t5, $t8, $fp
    bnez $t5, _RBTree.insert_L2
    la $t8, _Node.make._entry
    li $a0, 4
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    lw $a1, 24($sp)
    move $a2, $fp
    lw $a3, 32($sp)
    jalr $t8
    move $a1, $v0
    lw $t8, 24($sp)
    seq $t8, $t8, $fp
    beqz $t8, _RBTree.insert_L10
    lw $t8, 28($sp)
    sw $a1, 24($t8)
    j _RBTree.insert_L13
    _RBTree.insert_L10:
    lw $t8, 24($sp)
    lw $t5, 4($t8)
    lw $t8, 32($sp)
    slt $t8, $t5, $t8
    beqz $t8, _RBTree.insert_L12
    lw $t8, 24($sp)
    sw $a1, 12($t8)
    j _RBTree.insert_L13
    _RBTree.insert_L12:
    lw $t8, 24($sp)
    sw $a1, 8($t8)
    _RBTree.insert_L13:
    la $t8, _RBTree.insert_fix._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 28($sp)
    sw $v0, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    _RBTree.insert_Ret:
    lw $fp, 16($sp)
    lw $ra, 20($sp)
    addu $sp, $sp, 28
    jr $ra

.text
.globl _RBTree.insert._entry
_RBTree.insert._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 20($v0)
    jalr $v0
    _RBTree.insert._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _RBTree.delete_fix
_RBTree.delete_fix:
    subu $sp, $sp, 32
    sw $a0, 32($sp)
    move $t8, $a1
    sw $s4, 16($sp)
    sw $s6, 20($sp)
    sw $ra, 24($sp)
    j _RBTree.delete_fix_L18
    _RBTree.delete_fix_L2:
    lw $s4, 16($t8)
    sw $s4, 28($sp)
    lw $s4, 28($sp)
    lw $a1, 8($s4)
    seq $s6, $a1, $t8
    beqz $s6, _RBTree.delete_fix_L4
    lw $s4, 28($sp)
    lw $a1, 12($s4)
    j _RBTree.delete_fix_L5
    _RBTree.delete_fix_L4:
    _RBTree.delete_fix_L5:
    lw $s4, 20($a1)
    beqz $s4, _RBTree.delete_fix_L9
    sw $zero, 20($a1)
    li $t8, 1
    lw $s4, 28($sp)
    sw $t8, 20($s4)
    la $s4, _RBTree.rotate._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $s4, 0($v0)
    lw $s4, 32($sp)
    sw $s4, 4($v0)
    lw $s4, 0($v0)
    move $a0, $v0
    jalr $s4
    beqz $s6, _RBTree.delete_fix_L8
    lw $s4, 28($sp)
    lw $a1, 12($s4)
    j _RBTree.delete_fix_L9
    _RBTree.delete_fix_L8:
    lw $s4, 28($sp)
    lw $a1, 8($s4)
    _RBTree.delete_fix_L9:
    lw $t8, 8($a1)
    lw $s4, 20($t8)
    not $t5, $s4
    lw $s4, 12($a1)
    lw $t2, 20($s4)
    not $t2, $t2
    and $t5, $t5, $t2
    beqz $t5, _RBTree.delete_fix_L11
    sw $zero, 20($a1)
    lw $t8, 28($sp)
    j _RBTree.delete_fix_L18
    _RBTree.delete_fix_L11:
    move $t5, $s4
    beqz $s6, _RBTree.delete_fix_L13
    move $t5, $t8
    move $t8, $s4
    _RBTree.delete_fix_L13:
    lw $s4, 20($t8)
    not $s4, $s4
    beqz $s4, _RBTree.delete_fix_L17
    sw $zero, 20($t5)
    li $s4, 1
    sw $s4, 20($a1)
    la $s4, _RBTree.rotate._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $s4, 0($a0)
    lw $v0, 32($sp)
    sw $v0, 4($a0)
    lw $v0, 0($a0)
    move $a1, $t5
    jalr $v0
    beqz $s6, _RBTree.delete_fix_L16
    lw $s4, 28($sp)
    lw $a1, 12($s4)
    lw $t8, 12($a1)
    j _RBTree.delete_fix_L17
    _RBTree.delete_fix_L16:
    lw $s4, 28($sp)
    lw $a1, 8($s4)
    lw $t8, 8($a1)
    _RBTree.delete_fix_L17:
    lw $s4, 28($sp)
    lw $s4, 20($s4)
    sw $s4, 20($a1)
    lw $s4, 28($sp)
    sw $zero, 20($s4)
    sw $zero, 20($t8)
    la $s4, _RBTree.rotate._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $s4, 0($a0)
    lw $v0, 32($sp)
    sw $v0, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    lw $s4, 32($sp)
    lw $s4, 24($s4)
    move $t8, $s4
    _RBTree.delete_fix_L18:
    lw $s4, 32($sp)
    lw $s4, 24($s4)
    sne $t5, $t8, $s4
    lw $s4, 20($t8)
    not $s4, $s4
    and $s4, $t5, $s4
    bnez $s4, _RBTree.delete_fix_L2
    sw $zero, 20($t8)
    _RBTree.delete_fix_Ret:
    lw $s4, 16($sp)
    lw $s6, 20($sp)
    lw $ra, 24($sp)
    addu $sp, $sp, 32
    jr $ra

.text
.globl _RBTree.delete_fix._entry
_RBTree.delete_fix._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 24($v0)
    jalr $v0
    _RBTree.delete_fix._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _RBTree.delete
_RBTree.delete:
    subu $sp, $sp, 36
    sw $a0, 36($sp)
    sw $s1, 16($sp)
    sw $s2, 20($sp)
    sw $s4, 24($sp)
    sw $s6, 28($sp)
    sw $ra, 32($sp)
    lw $s4, 36($sp)
    lw $s4, 24($s4)
    move $s1, $s4
    j _RBTree.delete_L7
    _RBTree.delete_L2:
    lw $s4, 4($s1)
    seq $t8, $s4, $a1
    beqz $t8, _RBTree.delete_L4
    j _RBTree.delete_L8
    _RBTree.delete_L4:
    slt $s4, $s4, $a1
    beqz $s4, _RBTree.delete_L6
    lw $s4, 12($s1)
    move $s1, $s4
    j _RBTree.delete_L7
    _RBTree.delete_L6:
    lw $s4, 8($s1)
    move $s1, $s4
    _RBTree.delete_L7:
    lw $s4, 36($sp)
    lw $t5, 28($s4)
    sne $s4, $s1, $t5
    bnez $s4, _RBTree.delete_L2
    _RBTree.delete_L8:
    lw $s4, 20($s1)
    move $s2, $s4
    lw $a2, 8($s1)
    seq $s4, $a2, $t5
    beqz $s4, _RBTree.delete_L10
    lw $a2, 12($s1)
    move $s4, $a2
    la $t8, _RBTree.transplant._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    lw $t8, 36($sp)
    sw $t8, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    move $a1, $s1
    jalr $t8
    j _RBTree.delete_L19
    _RBTree.delete_L10:
    lw $s4, 12($s1)
    seq $t8, $s4, $t5
    beqz $t8, _RBTree.delete_L12
    move $s4, $a2
    la $t8, _RBTree.transplant._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 36($sp)
    sw $v0, 4($a0)
    lw $v0, 0($a0)
    move $a1, $s1
    jalr $v0
    j _RBTree.delete_L19
    _RBTree.delete_L12:
    move $s6, $s4
    j _RBTree.delete_L14
    _RBTree.delete_L13:
    move $s6, $s4
    _RBTree.delete_L14:
    lw $s4, 8($s6)
    sne $t8, $s4, $t5
    bnez $t8, _RBTree.delete_L13
    lw $s4, 20($s6)
    move $s2, $s4
    lw $a2, 12($s6)
    move $s4, $a2
    lw $t8, 16($s6)
    seq $t8, $t8, $s1
    beqz $t8, _RBTree.delete_L17
    sw $s6, 16($a2)
    j _RBTree.delete_L18
    _RBTree.delete_L17:
    la $t8, _RBTree.transplant._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 36($sp)
    sw $v0, 4($a0)
    lw $v0, 0($a0)
    move $a1, $s6
    jalr $v0
    lw $t8, 12($s1)
    sw $t8, 12($s6)
    lw $t8, 12($s6)
    sw $s6, 16($t8)
    _RBTree.delete_L18:
    la $t8, _RBTree.transplant._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 36($sp)
    sw $v0, 4($a0)
    lw $v0, 0($a0)
    move $a1, $s1
    move $a2, $s6
    jalr $v0
    lw $t8, 8($s1)
    sw $t8, 8($s6)
    lw $t8, 8($s6)
    sw $s6, 16($t8)
    lw $s1, 20($s1)
    sw $s1, 20($s6)
    _RBTree.delete_L19:
    not $s1, $s2
    beqz $s1, _RBTree.delete_L21
    la $s1, _RBTree.delete_fix._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $s1, 0($a0)
    lw $v0, 36($sp)
    sw $v0, 4($a0)
    lw $v0, 0($a0)
    move $a1, $s4
    jalr $v0
    _RBTree.delete_L21:
    _RBTree.delete_Ret:
    lw $s1, 16($sp)
    lw $s2, 20($sp)
    lw $s4, 24($sp)
    lw $s6, 28($sp)
    lw $ra, 32($sp)
    addu $sp, $sp, 36
    jr $ra

.text
.globl _RBTree.delete._entry
_RBTree.delete._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 28($v0)
    jalr $v0
    _RBTree.delete._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _RBTree.print
_RBTree.print:
    subu $sp, $sp, 20
    move $t8, $a0
    sw $ra, 16($sp)
    la $t5, _RBTree.print_impl._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t5, 0($v0)
    sw $t8, 4($v0)
    lw $a1, 24($t8)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    _RBTree.print_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _RBTree.print._entry
_RBTree.print._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 32($v0)
    jalr $v0
    _RBTree.print._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _RBTree.print_impl
_RBTree.print_impl:
    subu $sp, $sp, 20
    sw $a0, 20($sp)
    sw $a1, 24($sp)
    sw $ra, 16($sp)
    lw $t8, 20($sp)
    lw $t5, 28($t8)
    lw $t8, 24($sp)
    seq $t8, $t8, $t5
    beqz $t8, _RBTree.print_impl_L3
    j _RBTree.print_impl_Ret
    _RBTree.print_impl_L3:
    la $t8, _RBTree.print_impl._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 20($sp)
    sw $v0, 4($a0)
    lw $v0, 24($sp)
    lw $a1, 8($v0)
    lw $v0, 0($a0)
    jalr $v0
    lw $t8, 24($sp)
    lw $a0, 4($t8)
    li $v0, 1
    syscall
    la $a0, _STRING5
    li $v0, 4
    syscall
    la $t8, _RBTree.print_impl._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    lw $t8, 20($sp)
    sw $t8, 4($v0)
    lw $t8, 24($sp)
    lw $a1, 12($t8)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    _RBTree.print_impl_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _RBTree.print_impl._entry
_RBTree.print_impl._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 36($v0)
    jalr $v0
    _RBTree.print_impl._entry_Ret:
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