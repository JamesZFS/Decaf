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
.globl _Rng._new
_Rng._new:
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
    li $t2, 8
    sw $t2, 40($sp)
    lw $t0, 40($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 44($sp)
    la $t2, _Rng
    sw $t2, 48($sp)
    lw $t0, 48($sp)
    lw $t1, 44($sp)
    sw $t0, 0($t1)
    lw $t1, 44($sp)
    sw $zero, 4($t1)
    lw $t0, 44($sp)
    move $v0, $t0
    _Rng._new_Ret:
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
.globl _Node._new
_Node._new:
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
    li $t2, 24
    sw $t2, 40($sp)
    lw $t0, 40($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 44($sp)
    la $t2, _Node
    sw $t2, 48($sp)
    lw $t0, 48($sp)
    lw $t1, 44($sp)
    sw $t0, 0($t1)
    lw $t1, 44($sp)
    sw $zero, 4($t1)
    lw $t1, 44($sp)
    sw $zero, 8($t1)
    lw $t1, 44($sp)
    sw $zero, 12($t1)
    lw $t1, 44($sp)
    sw $zero, 16($t1)
    lw $t1, 44($sp)
    sw $zero, 20($t1)
    lw $t0, 44($sp)
    move $v0, $t0
    _Node._new_Ret:
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
.globl _RBTree._new
_RBTree._new:
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
    li $t2, 32
    sw $t2, 40($sp)
    lw $t0, 40($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 44($sp)
    la $t2, _RBTree
    sw $t2, 48($sp)
    lw $t0, 48($sp)
    lw $t1, 44($sp)
    sw $t0, 0($t1)
    lw $t1, 44($sp)
    sw $zero, 4($t1)
    lw $t1, 44($sp)
    sw $zero, 8($t1)
    lw $t1, 44($sp)
    sw $zero, 12($t1)
    lw $t1, 44($sp)
    sw $zero, 16($t1)
    lw $t1, 44($sp)
    sw $zero, 20($t1)
    lw $t1, 44($sp)
    sw $zero, 24($t1)
    lw $t1, 44($sp)
    sw $zero, 28($t1)
    lw $t0, 44($sp)
    move $v0, $t0
    _RBTree._new_Ret:
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
.globl main
main:
    subu $sp, $sp, 232
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
    la $t2, _Rng.make._entry
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
    li $t2, 19260817
    sw $t2, 72($sp)
    lw $t0, 72($sp)
    move $a1, $t0
    lw $t0, 68($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 76($sp)
    la $t2, _RBTree.make1._entry
    sw $t2, 80($sp)
    li $t2, 4
    sw $t2, 84($sp)
    lw $t0, 84($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 88($sp)
    lw $t0, 80($sp)
    lw $t1, 88($sp)
    sw $t0, 0($t1)
    lw $t0, 88($sp)
    lw $t2, 0($t0)
    sw $t2, 92($sp)
    lw $t0, 88($sp)
    move $a0, $t0
    lw $t0, 92($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 96($sp)
    li $t2, 0
    sw $t2, 100($sp)
    j main_L11
    main_L2:
    li $t2, 0
    sw $t2, 104($sp)
    j main_L5
    main_L3:
    la $t2, _RBTree.insert._entry
    sw $t2, 108($sp)
    li $t2, 8
    sw $t2, 112($sp)
    lw $t0, 112($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 116($sp)
    lw $t0, 108($sp)
    lw $t1, 116($sp)
    sw $t0, 0($t1)
    lw $t0, 96($sp)
    lw $t1, 116($sp)
    sw $t0, 4($t1)
    la $t2, _Rng.next._entry
    sw $t2, 120($sp)
    li $t2, 8
    sw $t2, 124($sp)
    lw $t0, 124($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 128($sp)
    lw $t0, 120($sp)
    lw $t1, 128($sp)
    sw $t0, 0($t1)
    lw $t0, 76($sp)
    lw $t1, 128($sp)
    sw $t0, 4($t1)
    lw $t0, 128($sp)
    lw $t2, 0($t0)
    sw $t2, 132($sp)
    lw $t0, 128($sp)
    move $a0, $t0
    lw $t0, 132($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 136($sp)
    lw $t0, 136($sp)
    rem $t2, $t0, 500
    sw $t2, 140($sp)
    lw $t0, 116($sp)
    lw $t2, 0($t0)
    sw $t2, 144($sp)
    lw $t0, 116($sp)
    move $a0, $t0
    lw $t0, 140($sp)
    move $a1, $t0
    lw $t0, 144($sp)
    jalr $t0
    lw $t0, 104($sp)
    addu $t2, $t0, 1
    sw $t2, 148($sp)
    lw $t0, 148($sp)
    move $t2, $t0
    sw $t2, 104($sp)
    main_L5:
    lw $t0, 104($sp)
    slt $t2, $t0, 500
    sw $t2, 152($sp)
    lw $t0, 152($sp)
    bnez $t0, main_L3
    li $t2, 0
    sw $t2, 156($sp)
    j main_L9
    main_L7:
    la $t2, _RBTree.delete._entry
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
    lw $t0, 96($sp)
    lw $t1, 168($sp)
    sw $t0, 4($t1)
    la $t2, _Rng.next._entry
    sw $t2, 172($sp)
    li $t2, 8
    sw $t2, 176($sp)
    lw $t0, 176($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 180($sp)
    lw $t0, 172($sp)
    lw $t1, 180($sp)
    sw $t0, 0($t1)
    lw $t0, 76($sp)
    lw $t1, 180($sp)
    sw $t0, 4($t1)
    lw $t0, 180($sp)
    lw $t2, 0($t0)
    sw $t2, 184($sp)
    lw $t0, 180($sp)
    move $a0, $t0
    lw $t0, 184($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 188($sp)
    lw $t0, 188($sp)
    rem $t2, $t0, 500
    sw $t2, 192($sp)
    lw $t0, 168($sp)
    lw $t2, 0($t0)
    sw $t2, 196($sp)
    lw $t0, 168($sp)
    move $a0, $t0
    lw $t0, 192($sp)
    move $a1, $t0
    lw $t0, 196($sp)
    jalr $t0
    lw $t0, 156($sp)
    addu $t2, $t0, 1
    sw $t2, 200($sp)
    lw $t0, 200($sp)
    move $t2, $t0
    sw $t2, 156($sp)
    main_L9:
    lw $t0, 156($sp)
    slt $t2, $t0, 500
    sw $t2, 204($sp)
    lw $t0, 204($sp)
    bnez $t0, main_L7
    lw $t0, 100($sp)
    addu $t2, $t0, 1
    sw $t2, 208($sp)
    lw $t0, 208($sp)
    move $t2, $t0
    sw $t2, 100($sp)
    main_L11:
    lw $t0, 100($sp)
    slt $t2, $t0, 5
    sw $t2, 212($sp)
    lw $t0, 212($sp)
    bnez $t0, main_L2
    la $t2, _RBTree.print._entry
    sw $t2, 216($sp)
    li $t2, 8
    sw $t2, 220($sp)
    lw $t0, 220($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 224($sp)
    lw $t0, 216($sp)
    lw $t1, 224($sp)
    sw $t0, 0($t1)
    lw $t0, 96($sp)
    lw $t1, 224($sp)
    sw $t0, 4($t1)
    lw $t0, 224($sp)
    lw $t2, 0($t0)
    sw $t2, 228($sp)
    lw $t0, 224($sp)
    move $a0, $t0
    lw $t0, 228($sp)
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
    addu $sp, $sp, 232
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

.text
.globl _Rng.make
_Rng.make:
    subu $sp, $sp, 60
    move $t2, $a0
    sw $t2, 60($sp)
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
    jal _Rng._new
    move $t2, $v0
    sw $t2, 56($sp)
    lw $t0, 60($sp)
    lw $t1, 56($sp)
    sw $t0, 4($t1)
    lw $t0, 56($sp)
    move $v0, $t0
    _Rng.make_Ret:
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
.globl _Rng.make._entry
_Rng.make._entry:
    subu $sp, $sp, 60
    move $t2, $a0
    sw $t2, 60($sp)
    move $t2, $a1
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
    move $a0, $t0
    jal _Rng.make
    move $t2, $v0
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    move $v0, $t0
    _Rng.make._entry_Ret:
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
.globl _Rng.next
_Rng.next:
    subu $sp, $sp, 64
    move $t2, $a0
    sw $t2, 64($sp)
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
    lw $t0, 64($sp)
    lw $t2, 4($t0)
    sw $t2, 40($sp)
    lw $t0, 40($sp)
    rem $t2, $t0, 10000
    sw $t2, 44($sp)
    lw $t0, 44($sp)
    mul $t2, $t0, 15625
    sw $t2, 48($sp)
    lw $t0, 48($sp)
    addu $t2, $t0, 22221
    sw $t2, 52($sp)
    lw $t0, 52($sp)
    rem $t2, $t0, 65536
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    lw $t1, 64($sp)
    sw $t0, 4($t1)
    lw $t0, 64($sp)
    lw $t2, 4($t0)
    sw $t2, 60($sp)
    lw $t0, 60($sp)
    move $v0, $t0
    _Rng.next_Ret:
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
    addu $sp, $sp, 64
    jr $ra

.text
.globl _Rng.next._entry
_Rng.next._entry:
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
    _Rng.next._entry_Ret:
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
.globl _Node.make
_Node.make:
    subu $sp, $sp, 64
    move $t2, $a0
    sw $t2, 64($sp)
    move $t2, $a1
    sw $t2, 68($sp)
    move $t2, $a2
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
    jal _Node._new
    move $t2, $v0
    sw $t2, 56($sp)
    lw $t0, 72($sp)
    lw $t1, 56($sp)
    sw $t0, 4($t1)
    lw $t0, 64($sp)
    lw $t1, 56($sp)
    sw $t0, 16($t1)
    lw $t0, 68($sp)
    lw $t1, 56($sp)
    sw $t0, 8($t1)
    lw $t0, 68($sp)
    lw $t1, 56($sp)
    sw $t0, 12($t1)
    li $t2, 1
    sw $t2, 60($sp)
    lw $t0, 60($sp)
    lw $t1, 56($sp)
    sw $t0, 20($t1)
    lw $t0, 56($sp)
    move $v0, $t0
    _Node.make_Ret:
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
.globl _Node.make._entry
_Node.make._entry:
    subu $sp, $sp, 60
    move $t2, $a0
    sw $t2, 60($sp)
    move $t2, $a1
    sw $t2, 64($sp)
    move $t2, $a2
    sw $t2, 68($sp)
    move $t2, $a3
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
    lw $t0, 64($sp)
    move $a0, $t0
    lw $t0, 68($sp)
    move $a1, $t0
    lw $t0, 72($sp)
    move $a2, $t0
    jal _Node.make
    move $t2, $v0
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    move $v0, $t0
    _Node.make._entry_Ret:
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
.globl _RBTree.make1
_RBTree.make1:
    subu $sp, $sp, 64
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
    jal _RBTree._new
    move $t2, $v0
    sw $t2, 56($sp)
    jal _Node._new
    move $t2, $v0
    sw $t2, 60($sp)
    lw $t0, 60($sp)
    lw $t1, 60($sp)
    sw $t0, 16($t1)
    lw $t0, 60($sp)
    lw $t1, 60($sp)
    sw $t0, 8($t1)
    lw $t0, 60($sp)
    lw $t1, 60($sp)
    sw $t0, 12($t1)
    lw $t0, 60($sp)
    lw $t1, 56($sp)
    sw $t0, 24($t1)
    lw $t0, 60($sp)
    lw $t1, 56($sp)
    sw $t0, 28($t1)
    lw $t0, 56($sp)
    move $v0, $t0
    _RBTree.make1_Ret:
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
.globl _RBTree.make1._entry
_RBTree.make1._entry:
    subu $sp, $sp, 60
    move $t2, $a0
    sw $t2, 60($sp)
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
    jal _RBTree.make1
    move $t2, $v0
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    move $v0, $t0
    _RBTree.make1._entry_Ret:
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
.globl _RBTree.transplant
_RBTree.transplant:
    subu $sp, $sp, 60
    move $t2, $a0
    sw $t2, 60($sp)
    move $t2, $a1
    sw $t2, 64($sp)
    move $t2, $a2
    sw $t2, 68($sp)
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
    lw $t0, 64($sp)
    lw $t2, 16($t0)
    sw $t2, 40($sp)
    lw $t0, 60($sp)
    lw $t2, 28($t0)
    sw $t2, 44($sp)
    lw $t0, 40($sp)
    lw $t1, 44($sp)
    seq $t2, $t0, $t1
    sw $t2, 48($sp)
    lw $t0, 48($sp)
    beqz $t0, _RBTree.transplant_L3
    lw $t0, 68($sp)
    lw $t1, 60($sp)
    sw $t0, 24($t1)
    j _RBTree.transplant_L6
    _RBTree.transplant_L3:
    lw $t0, 40($sp)
    lw $t2, 12($t0)
    sw $t2, 52($sp)
    lw $t0, 52($sp)
    lw $t1, 64($sp)
    seq $t2, $t0, $t1
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    beqz $t0, _RBTree.transplant_L5
    lw $t0, 68($sp)
    lw $t1, 40($sp)
    sw $t0, 12($t1)
    j _RBTree.transplant_L6
    _RBTree.transplant_L5:
    lw $t0, 68($sp)
    lw $t1, 40($sp)
    sw $t0, 8($t1)
    _RBTree.transplant_L6:
    lw $t0, 40($sp)
    lw $t1, 68($sp)
    sw $t0, 16($t1)
    _RBTree.transplant_Ret:
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
.globl _RBTree.transplant._entry
_RBTree.transplant._entry:
    subu $sp, $sp, 64
    move $t2, $a0
    sw $t2, 64($sp)
    move $t2, $a1
    sw $t2, 68($sp)
    move $t2, $a2
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
    lw $t0, 68($sp)
    move $a1, $t0
    lw $t0, 72($sp)
    move $a2, $t0
    lw $t0, 60($sp)
    jalr $t0
    _RBTree.transplant._entry_Ret:
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
.globl _RBTree.rotate
_RBTree.rotate:
    subu $sp, $sp, 88
    move $t2, $a0
    sw $t2, 88($sp)
    move $t2, $a1
    sw $t2, 92($sp)
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
    lw $t0, 92($sp)
    lw $t2, 16($t0)
    sw $t2, 40($sp)
    lw $t0, 40($sp)
    lw $t2, 16($t0)
    sw $t2, 44($sp)
    lw $t0, 44($sp)
    lw $t1, 92($sp)
    sw $t0, 16($t1)
    lw $t0, 88($sp)
    lw $t2, 28($t0)
    sw $t2, 48($sp)
    lw $t0, 44($sp)
    lw $t1, 48($sp)
    seq $t2, $t0, $t1
    sw $t2, 52($sp)
    lw $t0, 52($sp)
    beqz $t0, _RBTree.rotate_L3
    lw $t0, 92($sp)
    lw $t1, 88($sp)
    sw $t0, 24($t1)
    j _RBTree.rotate_L6
    _RBTree.rotate_L3:
    lw $t0, 44($sp)
    lw $t2, 12($t0)
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    lw $t1, 40($sp)
    seq $t2, $t0, $t1
    sw $t2, 60($sp)
    lw $t0, 60($sp)
    beqz $t0, _RBTree.rotate_L5
    lw $t0, 92($sp)
    lw $t1, 44($sp)
    sw $t0, 12($t1)
    j _RBTree.rotate_L6
    _RBTree.rotate_L5:
    lw $t0, 92($sp)
    lw $t1, 44($sp)
    sw $t0, 8($t1)
    _RBTree.rotate_L6:
    lw $t0, 40($sp)
    lw $t2, 8($t0)
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    lw $t1, 92($sp)
    seq $t2, $t0, $t1
    sw $t2, 68($sp)
    lw $t0, 68($sp)
    beqz $t0, _RBTree.rotate_L8
    lw $t0, 92($sp)
    lw $t2, 12($t0)
    sw $t2, 72($sp)
    lw $t0, 72($sp)
    lw $t1, 40($sp)
    sw $t0, 8($t1)
    lw $t0, 92($sp)
    lw $t2, 12($t0)
    sw $t2, 76($sp)
    lw $t0, 40($sp)
    lw $t1, 76($sp)
    sw $t0, 16($t1)
    lw $t0, 40($sp)
    lw $t1, 92($sp)
    sw $t0, 12($t1)
    j _RBTree.rotate_L9
    _RBTree.rotate_L8:
    lw $t0, 92($sp)
    lw $t2, 8($t0)
    sw $t2, 80($sp)
    lw $t0, 80($sp)
    lw $t1, 40($sp)
    sw $t0, 12($t1)
    lw $t0, 92($sp)
    lw $t2, 8($t0)
    sw $t2, 84($sp)
    lw $t0, 40($sp)
    lw $t1, 84($sp)
    sw $t0, 16($t1)
    lw $t0, 40($sp)
    lw $t1, 92($sp)
    sw $t0, 8($t1)
    _RBTree.rotate_L9:
    lw $t0, 92($sp)
    lw $t1, 40($sp)
    sw $t0, 16($t1)
    _RBTree.rotate_Ret:
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
    addu $sp, $sp, 88
    jr $ra

.text
.globl _RBTree.rotate._entry
_RBTree.rotate._entry:
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
    _RBTree.rotate._entry_Ret:
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
.globl _RBTree.insert_fix
_RBTree.insert_fix:
    subu $sp, $sp, 160
    move $t2, $a0
    sw $t2, 160($sp)
    move $t2, $a1
    sw $t2, 164($sp)
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
    j _RBTree.insert_fix_L10
    _RBTree.insert_fix_L2:
    lw $t0, 56($sp)
    move $t2, $t0
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    lw $t2, 16($t0)
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    move $t2, $t0
    sw $t2, 68($sp)
    lw $t0, 64($sp)
    lw $t2, 8($t0)
    sw $t2, 72($sp)
    lw $t0, 72($sp)
    lw $t1, 56($sp)
    seq $t2, $t0, $t1
    sw $t2, 76($sp)
    lw $t0, 76($sp)
    beqz $t0, _RBTree.insert_fix_L4
    lw $t0, 72($sp)
    move $t2, $t0
    sw $t2, 80($sp)
    j _RBTree.insert_fix_L5
    _RBTree.insert_fix_L4:
    lw $t0, 64($sp)
    lw $t2, 12($t0)
    sw $t2, 84($sp)
    lw $t0, 84($sp)
    move $t2, $t0
    sw $t2, 80($sp)
    _RBTree.insert_fix_L5:
    lw $t0, 80($sp)
    lw $t2, 20($t0)
    sw $t2, 88($sp)
    lw $t0, 88($sp)
    beqz $t0, _RBTree.insert_fix_L7
    lw $t1, 56($sp)
    sw $zero, 20($t1)
    lw $t1, 80($sp)
    sw $zero, 20($t1)
    li $t2, 1
    sw $t2, 92($sp)
    lw $t0, 92($sp)
    lw $t1, 64($sp)
    sw $t0, 20($t1)
    lw $t0, 64($sp)
    move $t2, $t0
    sw $t2, 164($sp)
    j _RBTree.insert_fix_L10
    _RBTree.insert_fix_L7:
    lw $t0, 56($sp)
    lw $t2, 8($t0)
    sw $t2, 96($sp)
    lw $t0, 96($sp)
    lw $t1, 164($sp)
    seq $t2, $t0, $t1
    sw $t2, 100($sp)
    lw $t0, 100($sp)
    lw $t1, 76($sp)
    sne $t2, $t0, $t1
    sw $t2, 104($sp)
    lw $t0, 104($sp)
    beqz $t0, _RBTree.insert_fix_L9
    la $t2, _RBTree.rotate._entry
    sw $t2, 108($sp)
    li $t2, 8
    sw $t2, 112($sp)
    lw $t0, 112($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 116($sp)
    lw $t0, 108($sp)
    lw $t1, 116($sp)
    sw $t0, 0($t1)
    lw $t0, 160($sp)
    lw $t1, 116($sp)
    sw $t0, 4($t1)
    lw $t0, 116($sp)
    lw $t2, 0($t0)
    sw $t2, 120($sp)
    lw $t0, 116($sp)
    move $a0, $t0
    lw $t0, 164($sp)
    move $a1, $t0
    lw $t0, 120($sp)
    jalr $t0
    lw $t0, 164($sp)
    move $t2, $t0
    sw $t2, 124($sp)
    lw $t0, 56($sp)
    move $t2, $t0
    sw $t2, 164($sp)
    lw $t0, 124($sp)
    move $t2, $t0
    sw $t2, 60($sp)
    lw $t0, 124($sp)
    lw $t2, 16($t0)
    sw $t2, 128($sp)
    lw $t0, 128($sp)
    move $t2, $t0
    sw $t2, 68($sp)
    _RBTree.insert_fix_L9:
    lw $t1, 60($sp)
    sw $zero, 20($t1)
    li $t2, 1
    sw $t2, 132($sp)
    lw $t0, 132($sp)
    lw $t1, 68($sp)
    sw $t0, 20($t1)
    la $t2, _RBTree.rotate._entry
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
    lw $t0, 160($sp)
    lw $t1, 144($sp)
    sw $t0, 4($t1)
    lw $t0, 144($sp)
    lw $t2, 0($t0)
    sw $t2, 148($sp)
    lw $t0, 144($sp)
    move $a0, $t0
    lw $t0, 60($sp)
    move $a1, $t0
    lw $t0, 148($sp)
    jalr $t0
    _RBTree.insert_fix_L10:
    lw $t0, 164($sp)
    lw $t2, 16($t0)
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    lw $t2, 20($t0)
    sw $t2, 152($sp)
    lw $t0, 152($sp)
    bnez $t0, _RBTree.insert_fix_L2
    lw $t0, 160($sp)
    lw $t2, 24($t0)
    sw $t2, 156($sp)
    lw $t1, 156($sp)
    sw $zero, 20($t1)
    _RBTree.insert_fix_Ret:
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
    addu $sp, $sp, 160
    jr $ra

.text
.globl _RBTree.insert_fix._entry
_RBTree.insert_fix._entry:
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
    lw $t2, 16($t0)
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    lw $t0, 68($sp)
    move $a1, $t0
    lw $t0, 60($sp)
    jalr $t0
    _RBTree.insert_fix._entry_Ret:
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
.globl _RBTree.insert
_RBTree.insert:
    subu $sp, $sp, 144
    move $t2, $a0
    sw $t2, 144($sp)
    move $t2, $a1
    sw $t2, 148($sp)
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
    lw $t0, 144($sp)
    lw $t2, 24($t0)
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    move $t2, $t0
    sw $t2, 60($sp)
    lw $t0, 144($sp)
    lw $t2, 28($t0)
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    move $t2, $t0
    sw $t2, 68($sp)
    j _RBTree.insert_L7
    _RBTree.insert_L2:
    lw $t0, 60($sp)
    move $t2, $t0
    sw $t2, 68($sp)
    lw $t0, 60($sp)
    lw $t2, 4($t0)
    sw $t2, 72($sp)
    lw $t0, 72($sp)
    lw $t1, 148($sp)
    seq $t2, $t0, $t1
    sw $t2, 76($sp)
    lw $t0, 76($sp)
    beqz $t0, _RBTree.insert_L4
    j _RBTree.insert_Ret
    _RBTree.insert_L4:
    lw $t0, 72($sp)
    lw $t1, 148($sp)
    slt $t2, $t0, $t1
    sw $t2, 80($sp)
    lw $t0, 80($sp)
    beqz $t0, _RBTree.insert_L6
    lw $t0, 60($sp)
    lw $t2, 12($t0)
    sw $t2, 84($sp)
    lw $t0, 84($sp)
    move $t2, $t0
    sw $t2, 60($sp)
    j _RBTree.insert_L7
    _RBTree.insert_L6:
    lw $t0, 60($sp)
    lw $t2, 8($t0)
    sw $t2, 88($sp)
    lw $t0, 88($sp)
    move $t2, $t0
    sw $t2, 60($sp)
    _RBTree.insert_L7:
    lw $t0, 60($sp)
    lw $t1, 64($sp)
    sne $t2, $t0, $t1
    sw $t2, 92($sp)
    lw $t0, 92($sp)
    bnez $t0, _RBTree.insert_L2
    la $t2, _Node.make._entry
    sw $t2, 96($sp)
    li $t2, 4
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
    lw $t0, 104($sp)
    lw $t2, 0($t0)
    sw $t2, 108($sp)
    lw $t0, 104($sp)
    move $a0, $t0
    lw $t0, 68($sp)
    move $a1, $t0
    lw $t0, 64($sp)
    move $a2, $t0
    lw $t0, 148($sp)
    move $a3, $t0
    lw $t0, 108($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 112($sp)
    lw $t0, 68($sp)
    lw $t1, 64($sp)
    seq $t2, $t0, $t1
    sw $t2, 116($sp)
    lw $t0, 116($sp)
    beqz $t0, _RBTree.insert_L10
    lw $t0, 112($sp)
    lw $t1, 144($sp)
    sw $t0, 24($t1)
    j _RBTree.insert_L13
    _RBTree.insert_L10:
    lw $t0, 68($sp)
    lw $t2, 4($t0)
    sw $t2, 120($sp)
    lw $t0, 120($sp)
    lw $t1, 148($sp)
    slt $t2, $t0, $t1
    sw $t2, 124($sp)
    lw $t0, 124($sp)
    beqz $t0, _RBTree.insert_L12
    lw $t0, 112($sp)
    lw $t1, 68($sp)
    sw $t0, 12($t1)
    j _RBTree.insert_L13
    _RBTree.insert_L12:
    lw $t0, 112($sp)
    lw $t1, 68($sp)
    sw $t0, 8($t1)
    _RBTree.insert_L13:
    la $t2, _RBTree.insert_fix._entry
    sw $t2, 128($sp)
    li $t2, 8
    sw $t2, 132($sp)
    lw $t0, 132($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 136($sp)
    lw $t0, 128($sp)
    lw $t1, 136($sp)
    sw $t0, 0($t1)
    lw $t0, 144($sp)
    lw $t1, 136($sp)
    sw $t0, 4($t1)
    lw $t0, 136($sp)
    lw $t2, 0($t0)
    sw $t2, 140($sp)
    lw $t0, 136($sp)
    move $a0, $t0
    lw $t0, 112($sp)
    move $a1, $t0
    lw $t0, 140($sp)
    jalr $t0
    _RBTree.insert_Ret:
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
    addu $sp, $sp, 144
    jr $ra

.text
.globl _RBTree.insert._entry
_RBTree.insert._entry:
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
    lw $t2, 20($t0)
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    lw $t0, 68($sp)
    move $a1, $t0
    lw $t0, 60($sp)
    jalr $t0
    _RBTree.insert._entry_Ret:
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
.globl _RBTree.delete_fix
_RBTree.delete_fix:
    subu $sp, $sp, 232
    move $t2, $a0
    sw $t2, 232($sp)
    move $t2, $a1
    sw $t2, 236($sp)
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
    j _RBTree.delete_fix_L18
    _RBTree.delete_fix_L2:
    lw $t0, 236($sp)
    lw $t2, 16($t0)
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    lw $t2, 8($t0)
    sw $t2, 60($sp)
    lw $t0, 60($sp)
    lw $t1, 236($sp)
    seq $t2, $t0, $t1
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    beqz $t0, _RBTree.delete_fix_L4
    lw $t0, 56($sp)
    lw $t2, 12($t0)
    sw $t2, 68($sp)
    lw $t0, 68($sp)
    move $t2, $t0
    sw $t2, 72($sp)
    j _RBTree.delete_fix_L5
    _RBTree.delete_fix_L4:
    lw $t0, 60($sp)
    move $t2, $t0
    sw $t2, 72($sp)
    _RBTree.delete_fix_L5:
    lw $t0, 72($sp)
    lw $t2, 20($t0)
    sw $t2, 76($sp)
    lw $t0, 76($sp)
    beqz $t0, _RBTree.delete_fix_L9
    lw $t1, 72($sp)
    sw $zero, 20($t1)
    li $t2, 1
    sw $t2, 80($sp)
    lw $t0, 80($sp)
    lw $t1, 56($sp)
    sw $t0, 20($t1)
    la $t2, _RBTree.rotate._entry
    sw $t2, 84($sp)
    li $t2, 8
    sw $t2, 88($sp)
    lw $t0, 88($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 92($sp)
    lw $t0, 84($sp)
    lw $t1, 92($sp)
    sw $t0, 0($t1)
    lw $t0, 232($sp)
    lw $t1, 92($sp)
    sw $t0, 4($t1)
    lw $t0, 92($sp)
    lw $t2, 0($t0)
    sw $t2, 96($sp)
    lw $t0, 92($sp)
    move $a0, $t0
    lw $t0, 72($sp)
    move $a1, $t0
    lw $t0, 96($sp)
    jalr $t0
    lw $t0, 64($sp)
    beqz $t0, _RBTree.delete_fix_L8
    lw $t0, 56($sp)
    lw $t2, 12($t0)
    sw $t2, 100($sp)
    lw $t0, 100($sp)
    move $t2, $t0
    sw $t2, 72($sp)
    j _RBTree.delete_fix_L9
    _RBTree.delete_fix_L8:
    lw $t0, 56($sp)
    lw $t2, 8($t0)
    sw $t2, 104($sp)
    lw $t0, 104($sp)
    move $t2, $t0
    sw $t2, 72($sp)
    _RBTree.delete_fix_L9:
    lw $t0, 72($sp)
    lw $t2, 8($t0)
    sw $t2, 108($sp)
    lw $t0, 108($sp)
    lw $t2, 20($t0)
    sw $t2, 112($sp)
    lw $t0, 112($sp)
    not $t2, $t0
    sw $t2, 116($sp)
    lw $t0, 72($sp)
    lw $t2, 12($t0)
    sw $t2, 120($sp)
    lw $t0, 120($sp)
    lw $t2, 20($t0)
    sw $t2, 124($sp)
    lw $t0, 124($sp)
    not $t2, $t0
    sw $t2, 128($sp)
    lw $t0, 116($sp)
    lw $t1, 128($sp)
    and $t2, $t0, $t1
    sw $t2, 132($sp)
    lw $t0, 132($sp)
    beqz $t0, _RBTree.delete_fix_L11
    lw $t1, 72($sp)
    sw $zero, 20($t1)
    lw $t0, 56($sp)
    move $t2, $t0
    sw $t2, 236($sp)
    j _RBTree.delete_fix_L18
    _RBTree.delete_fix_L11:
    lw $t0, 120($sp)
    move $t2, $t0
    sw $t2, 136($sp)
    lw $t0, 108($sp)
    move $t2, $t0
    sw $t2, 140($sp)
    lw $t0, 64($sp)
    beqz $t0, _RBTree.delete_fix_L13
    lw $t0, 108($sp)
    move $t2, $t0
    sw $t2, 136($sp)
    lw $t0, 120($sp)
    move $t2, $t0
    sw $t2, 140($sp)
    _RBTree.delete_fix_L13:
    lw $t0, 140($sp)
    lw $t2, 20($t0)
    sw $t2, 144($sp)
    lw $t0, 144($sp)
    not $t2, $t0
    sw $t2, 148($sp)
    lw $t0, 148($sp)
    beqz $t0, _RBTree.delete_fix_L17
    lw $t1, 136($sp)
    sw $zero, 20($t1)
    li $t2, 1
    sw $t2, 152($sp)
    lw $t0, 152($sp)
    lw $t1, 72($sp)
    sw $t0, 20($t1)
    la $t2, _RBTree.rotate._entry
    sw $t2, 156($sp)
    li $t2, 8
    sw $t2, 160($sp)
    lw $t0, 160($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 164($sp)
    lw $t0, 156($sp)
    lw $t1, 164($sp)
    sw $t0, 0($t1)
    lw $t0, 232($sp)
    lw $t1, 164($sp)
    sw $t0, 4($t1)
    lw $t0, 164($sp)
    lw $t2, 0($t0)
    sw $t2, 168($sp)
    lw $t0, 164($sp)
    move $a0, $t0
    lw $t0, 136($sp)
    move $a1, $t0
    lw $t0, 168($sp)
    jalr $t0
    lw $t0, 64($sp)
    beqz $t0, _RBTree.delete_fix_L16
    lw $t0, 56($sp)
    lw $t2, 12($t0)
    sw $t2, 172($sp)
    lw $t0, 172($sp)
    move $t2, $t0
    sw $t2, 72($sp)
    lw $t0, 172($sp)
    lw $t2, 12($t0)
    sw $t2, 176($sp)
    lw $t0, 176($sp)
    move $t2, $t0
    sw $t2, 140($sp)
    j _RBTree.delete_fix_L17
    _RBTree.delete_fix_L16:
    lw $t0, 56($sp)
    lw $t2, 8($t0)
    sw $t2, 180($sp)
    lw $t0, 180($sp)
    move $t2, $t0
    sw $t2, 72($sp)
    lw $t0, 180($sp)
    lw $t2, 8($t0)
    sw $t2, 184($sp)
    lw $t0, 184($sp)
    move $t2, $t0
    sw $t2, 140($sp)
    _RBTree.delete_fix_L17:
    lw $t0, 56($sp)
    lw $t2, 20($t0)
    sw $t2, 188($sp)
    lw $t0, 188($sp)
    lw $t1, 72($sp)
    sw $t0, 20($t1)
    lw $t1, 56($sp)
    sw $zero, 20($t1)
    lw $t1, 140($sp)
    sw $zero, 20($t1)
    la $t2, _RBTree.rotate._entry
    sw $t2, 192($sp)
    li $t2, 8
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
    lw $t0, 232($sp)
    lw $t1, 200($sp)
    sw $t0, 4($t1)
    lw $t0, 200($sp)
    lw $t2, 0($t0)
    sw $t2, 204($sp)
    lw $t0, 200($sp)
    move $a0, $t0
    lw $t0, 72($sp)
    move $a1, $t0
    lw $t0, 204($sp)
    jalr $t0
    lw $t0, 232($sp)
    lw $t2, 24($t0)
    sw $t2, 208($sp)
    lw $t0, 208($sp)
    move $t2, $t0
    sw $t2, 236($sp)
    _RBTree.delete_fix_L18:
    lw $t0, 232($sp)
    lw $t2, 24($t0)
    sw $t2, 212($sp)
    lw $t0, 236($sp)
    lw $t1, 212($sp)
    sne $t2, $t0, $t1
    sw $t2, 216($sp)
    lw $t0, 236($sp)
    lw $t2, 20($t0)
    sw $t2, 220($sp)
    lw $t0, 220($sp)
    not $t2, $t0
    sw $t2, 224($sp)
    lw $t0, 216($sp)
    lw $t1, 224($sp)
    and $t2, $t0, $t1
    sw $t2, 228($sp)
    lw $t0, 228($sp)
    bnez $t0, _RBTree.delete_fix_L2
    lw $t1, 236($sp)
    sw $zero, 20($t1)
    _RBTree.delete_fix_Ret:
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
    addu $sp, $sp, 232
    jr $ra

.text
.globl _RBTree.delete_fix._entry
_RBTree.delete_fix._entry:
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
    lw $t2, 24($t0)
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    lw $t0, 68($sp)
    move $a1, $t0
    lw $t0, 60($sp)
    jalr $t0
    _RBTree.delete_fix._entry_Ret:
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
.globl _RBTree.delete
_RBTree.delete:
    subu $sp, $sp, 256
    move $t2, $a0
    sw $t2, 256($sp)
    move $t2, $a1
    sw $t2, 260($sp)
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
    lw $t0, 256($sp)
    lw $t2, 24($t0)
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    move $t2, $t0
    sw $t2, 60($sp)
    j _RBTree.delete_L7
    _RBTree.delete_L2:
    lw $t0, 60($sp)
    lw $t2, 4($t0)
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    lw $t1, 260($sp)
    seq $t2, $t0, $t1
    sw $t2, 68($sp)
    lw $t0, 68($sp)
    beqz $t0, _RBTree.delete_L4
    j _RBTree.delete_L8
    _RBTree.delete_L4:
    lw $t0, 64($sp)
    lw $t1, 260($sp)
    slt $t2, $t0, $t1
    sw $t2, 72($sp)
    lw $t0, 72($sp)
    beqz $t0, _RBTree.delete_L6
    lw $t0, 60($sp)
    lw $t2, 12($t0)
    sw $t2, 76($sp)
    lw $t0, 76($sp)
    move $t2, $t0
    sw $t2, 60($sp)
    j _RBTree.delete_L7
    _RBTree.delete_L6:
    lw $t0, 60($sp)
    lw $t2, 8($t0)
    sw $t2, 80($sp)
    lw $t0, 80($sp)
    move $t2, $t0
    sw $t2, 60($sp)
    _RBTree.delete_L7:
    lw $t0, 256($sp)
    lw $t2, 28($t0)
    sw $t2, 84($sp)
    lw $t0, 60($sp)
    lw $t1, 84($sp)
    sne $t2, $t0, $t1
    sw $t2, 88($sp)
    lw $t0, 88($sp)
    bnez $t0, _RBTree.delete_L2
    _RBTree.delete_L8:
    lw $t0, 60($sp)
    lw $t2, 20($t0)
    sw $t2, 92($sp)
    lw $t0, 92($sp)
    move $t2, $t0
    sw $t2, 96($sp)
    lw $t0, 60($sp)
    lw $t2, 8($t0)
    sw $t2, 100($sp)
    lw $t0, 100($sp)
    lw $t1, 84($sp)
    seq $t2, $t0, $t1
    sw $t2, 104($sp)
    lw $t0, 104($sp)
    beqz $t0, _RBTree.delete_L10
    lw $t0, 60($sp)
    lw $t2, 12($t0)
    sw $t2, 108($sp)
    lw $t0, 108($sp)
    move $t2, $t0
    sw $t2, 112($sp)
    la $t2, _RBTree.transplant._entry
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
    lw $t0, 256($sp)
    lw $t1, 124($sp)
    sw $t0, 4($t1)
    lw $t0, 124($sp)
    lw $t2, 0($t0)
    sw $t2, 128($sp)
    lw $t0, 124($sp)
    move $a0, $t0
    lw $t0, 60($sp)
    move $a1, $t0
    lw $t0, 108($sp)
    move $a2, $t0
    lw $t0, 128($sp)
    jalr $t0
    j _RBTree.delete_L19
    _RBTree.delete_L10:
    lw $t0, 60($sp)
    lw $t2, 12($t0)
    sw $t2, 132($sp)
    lw $t0, 132($sp)
    lw $t1, 84($sp)
    seq $t2, $t0, $t1
    sw $t2, 136($sp)
    lw $t0, 136($sp)
    beqz $t0, _RBTree.delete_L12
    lw $t0, 100($sp)
    move $t2, $t0
    sw $t2, 112($sp)
    la $t2, _RBTree.transplant._entry
    sw $t2, 140($sp)
    li $t2, 8
    sw $t2, 144($sp)
    lw $t0, 144($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 148($sp)
    lw $t0, 140($sp)
    lw $t1, 148($sp)
    sw $t0, 0($t1)
    lw $t0, 256($sp)
    lw $t1, 148($sp)
    sw $t0, 4($t1)
    lw $t0, 148($sp)
    lw $t2, 0($t0)
    sw $t2, 152($sp)
    lw $t0, 148($sp)
    move $a0, $t0
    lw $t0, 60($sp)
    move $a1, $t0
    lw $t0, 100($sp)
    move $a2, $t0
    lw $t0, 152($sp)
    jalr $t0
    j _RBTree.delete_L19
    _RBTree.delete_L12:
    lw $t0, 132($sp)
    move $t2, $t0
    sw $t2, 156($sp)
    j _RBTree.delete_L14
    _RBTree.delete_L13:
    lw $t0, 160($sp)
    move $t2, $t0
    sw $t2, 156($sp)
    _RBTree.delete_L14:
    lw $t0, 156($sp)
    lw $t2, 8($t0)
    sw $t2, 160($sp)
    lw $t0, 160($sp)
    lw $t1, 84($sp)
    sne $t2, $t0, $t1
    sw $t2, 164($sp)
    lw $t0, 164($sp)
    bnez $t0, _RBTree.delete_L13
    lw $t0, 156($sp)
    lw $t2, 20($t0)
    sw $t2, 168($sp)
    lw $t0, 168($sp)
    move $t2, $t0
    sw $t2, 96($sp)
    lw $t0, 156($sp)
    lw $t2, 12($t0)
    sw $t2, 172($sp)
    lw $t0, 172($sp)
    move $t2, $t0
    sw $t2, 112($sp)
    lw $t0, 156($sp)
    lw $t2, 16($t0)
    sw $t2, 176($sp)
    lw $t0, 176($sp)
    lw $t1, 60($sp)
    seq $t2, $t0, $t1
    sw $t2, 180($sp)
    lw $t0, 180($sp)
    beqz $t0, _RBTree.delete_L17
    lw $t0, 156($sp)
    lw $t1, 172($sp)
    sw $t0, 16($t1)
    j _RBTree.delete_L18
    _RBTree.delete_L17:
    la $t2, _RBTree.transplant._entry
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
    lw $t0, 256($sp)
    lw $t1, 192($sp)
    sw $t0, 4($t1)
    lw $t0, 192($sp)
    lw $t2, 0($t0)
    sw $t2, 196($sp)
    lw $t0, 192($sp)
    move $a0, $t0
    lw $t0, 156($sp)
    move $a1, $t0
    lw $t0, 172($sp)
    move $a2, $t0
    lw $t0, 196($sp)
    jalr $t0
    lw $t0, 60($sp)
    lw $t2, 12($t0)
    sw $t2, 200($sp)
    lw $t0, 200($sp)
    lw $t1, 156($sp)
    sw $t0, 12($t1)
    lw $t0, 156($sp)
    lw $t2, 12($t0)
    sw $t2, 204($sp)
    lw $t0, 156($sp)
    lw $t1, 204($sp)
    sw $t0, 16($t1)
    _RBTree.delete_L18:
    la $t2, _RBTree.transplant._entry
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
    lw $t0, 256($sp)
    lw $t1, 216($sp)
    sw $t0, 4($t1)
    lw $t0, 216($sp)
    lw $t2, 0($t0)
    sw $t2, 220($sp)
    lw $t0, 216($sp)
    move $a0, $t0
    lw $t0, 60($sp)
    move $a1, $t0
    lw $t0, 156($sp)
    move $a2, $t0
    lw $t0, 220($sp)
    jalr $t0
    lw $t0, 60($sp)
    lw $t2, 8($t0)
    sw $t2, 224($sp)
    lw $t0, 224($sp)
    lw $t1, 156($sp)
    sw $t0, 8($t1)
    lw $t0, 156($sp)
    lw $t2, 8($t0)
    sw $t2, 228($sp)
    lw $t0, 156($sp)
    lw $t1, 228($sp)
    sw $t0, 16($t1)
    lw $t0, 60($sp)
    lw $t2, 20($t0)
    sw $t2, 232($sp)
    lw $t0, 232($sp)
    lw $t1, 156($sp)
    sw $t0, 20($t1)
    _RBTree.delete_L19:
    lw $t0, 96($sp)
    not $t2, $t0
    sw $t2, 236($sp)
    lw $t0, 236($sp)
    beqz $t0, _RBTree.delete_L21
    la $t2, _RBTree.delete_fix._entry
    sw $t2, 240($sp)
    li $t2, 8
    sw $t2, 244($sp)
    lw $t0, 244($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 248($sp)
    lw $t0, 240($sp)
    lw $t1, 248($sp)
    sw $t0, 0($t1)
    lw $t0, 256($sp)
    lw $t1, 248($sp)
    sw $t0, 4($t1)
    lw $t0, 248($sp)
    lw $t2, 0($t0)
    sw $t2, 252($sp)
    lw $t0, 248($sp)
    move $a0, $t0
    lw $t0, 112($sp)
    move $a1, $t0
    lw $t0, 252($sp)
    jalr $t0
    _RBTree.delete_L21:
    _RBTree.delete_Ret:
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
    addu $sp, $sp, 256
    jr $ra

.text
.globl _RBTree.delete._entry
_RBTree.delete._entry:
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
    lw $t2, 28($t0)
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    lw $t0, 68($sp)
    move $a1, $t0
    lw $t0, 60($sp)
    jalr $t0
    _RBTree.delete._entry_Ret:
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
.globl _RBTree.print
_RBTree.print:
    subu $sp, $sp, 76
    move $t2, $a0
    sw $t2, 76($sp)
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
    la $t2, _RBTree.print_impl._entry
    sw $t2, 56($sp)
    li $t2, 8
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
    lw $t0, 76($sp)
    lw $t1, 64($sp)
    sw $t0, 4($t1)
    lw $t0, 76($sp)
    lw $t2, 24($t0)
    sw $t2, 68($sp)
    lw $t0, 64($sp)
    lw $t2, 0($t0)
    sw $t2, 72($sp)
    lw $t0, 64($sp)
    move $a0, $t0
    lw $t0, 68($sp)
    move $a1, $t0
    lw $t0, 72($sp)
    jalr $t0
    _RBTree.print_Ret:
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
    addu $sp, $sp, 76
    jr $ra

.text
.globl _RBTree.print._entry
_RBTree.print._entry:
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
    lw $t2, 32($t0)
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    lw $t0, 60($sp)
    jalr $t0
    _RBTree.print._entry_Ret:
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
.globl _RBTree.print_impl
_RBTree.print_impl:
    subu $sp, $sp, 112
    move $t2, $a0
    sw $t2, 112($sp)
    move $t2, $a1
    sw $t2, 116($sp)
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
    lw $t0, 112($sp)
    lw $t2, 28($t0)
    sw $t2, 56($sp)
    lw $t0, 116($sp)
    lw $t1, 56($sp)
    seq $t2, $t0, $t1
    sw $t2, 60($sp)
    lw $t0, 60($sp)
    beqz $t0, _RBTree.print_impl_L3
    j _RBTree.print_impl_Ret
    _RBTree.print_impl_L3:
    la $t2, _RBTree.print_impl._entry
    sw $t2, 64($sp)
    li $t2, 8
    sw $t2, 68($sp)
    lw $t0, 68($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 72($sp)
    lw $t0, 64($sp)
    lw $t1, 72($sp)
    sw $t0, 0($t1)
    lw $t0, 112($sp)
    lw $t1, 72($sp)
    sw $t0, 4($t1)
    lw $t0, 116($sp)
    lw $t2, 8($t0)
    sw $t2, 76($sp)
    lw $t0, 72($sp)
    lw $t2, 0($t0)
    sw $t2, 80($sp)
    lw $t0, 72($sp)
    move $a0, $t0
    lw $t0, 76($sp)
    move $a1, $t0
    lw $t0, 80($sp)
    jalr $t0
    lw $t0, 116($sp)
    lw $t2, 4($t0)
    sw $t2, 84($sp)
    lw $t0, 84($sp)
    move $a0, $t0
    li $v0, 1
    syscall
    la $t2, _STRING5
    sw $t2, 88($sp)
    lw $t0, 88($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    la $t2, _RBTree.print_impl._entry
    sw $t2, 92($sp)
    li $t2, 8
    sw $t2, 96($sp)
    lw $t0, 96($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 100($sp)
    lw $t0, 92($sp)
    lw $t1, 100($sp)
    sw $t0, 0($t1)
    lw $t0, 112($sp)
    lw $t1, 100($sp)
    sw $t0, 4($t1)
    lw $t0, 116($sp)
    lw $t2, 12($t0)
    sw $t2, 104($sp)
    lw $t0, 100($sp)
    lw $t2, 0($t0)
    sw $t2, 108($sp)
    lw $t0, 100($sp)
    move $a0, $t0
    lw $t0, 104($sp)
    move $a1, $t0
    lw $t0, 108($sp)
    jalr $t0
    _RBTree.print_impl_Ret:
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
    addu $sp, $sp, 112
    jr $ra

.text
.globl _RBTree.print_impl._entry
_RBTree.print_impl._entry:
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
    lw $t2, 36($t0)
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    lw $t0, 68($sp)
    move $a1, $t0
    lw $t0, 60($sp)
    jalr $t0
    _RBTree.print_impl._entry_Ret:
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