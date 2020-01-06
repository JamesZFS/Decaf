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
.globl _QuickSort._new
_QuickSort._new:
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
    la $t2, _QuickSort
    sw $t2, 48($sp)
    lw $t0, 48($sp)
    lw $t1, 44($sp)
    sw $t0, 0($t1)
    lw $t0, 44($sp)
    move $v0, $t0
    _QuickSort._new_Ret:
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
.globl _MergeSort._new
_MergeSort._new:
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
    la $t2, _MergeSort
    sw $t2, 48($sp)
    lw $t0, 48($sp)
    lw $t1, 44($sp)
    sw $t0, 0($t1)
    lw $t0, 44($sp)
    move $v0, $t0
    _MergeSort._new_Ret:
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
    subu $sp, $sp, 416
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
    li $t2, 2004
    sw $t2, 80($sp)
    lw $t0, 80($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 84($sp)
    lw $t0, 84($sp)
    addu $t2, $t0, 2004
    sw $t2, 88($sp)
    lw $t0, 84($sp)
    addu $t2, $t0, 4
    sw $t2, 84($sp)
    j main_L4
    main_L3:
    lw $t0, 88($sp)
    subu $t2, $t0, 4
    sw $t2, 88($sp)
    lw $t1, 88($sp)
    sw $zero, 0($t1)
    main_L4:
    lw $t0, 88($sp)
    lw $t1, 84($sp)
    seq $t2, $t0, $t1
    sw $t2, 92($sp)
    lw $t0, 92($sp)
    beqz $t0, main_L3
    li $t2, 500
    sw $t2, 96($sp)
    lw $t0, 96($sp)
    lw $t1, 84($sp)
    sw $t0, -4($t1)
    li $t2, 2004
    sw $t2, 100($sp)
    lw $t0, 100($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 104($sp)
    lw $t0, 104($sp)
    addu $t2, $t0, 2004
    sw $t2, 108($sp)
    lw $t0, 104($sp)
    addu $t2, $t0, 4
    sw $t2, 104($sp)
    j main_L8
    main_L7:
    lw $t0, 108($sp)
    subu $t2, $t0, 4
    sw $t2, 108($sp)
    lw $t1, 108($sp)
    sw $zero, 0($t1)
    main_L8:
    lw $t0, 108($sp)
    lw $t1, 104($sp)
    seq $t2, $t0, $t1
    sw $t2, 112($sp)
    lw $t0, 112($sp)
    beqz $t0, main_L7
    li $t2, 500
    sw $t2, 116($sp)
    lw $t0, 116($sp)
    lw $t1, 104($sp)
    sw $t0, -4($t1)
    li $t2, 0
    sw $t2, 120($sp)
    j main_L21
    main_L10:
    la $t2, _Rng.next._entry
    sw $t2, 124($sp)
    li $t2, 8
    sw $t2, 128($sp)
    lw $t0, 128($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 132($sp)
    lw $t0, 124($sp)
    lw $t1, 132($sp)
    sw $t0, 0($t1)
    lw $t0, 76($sp)
    lw $t1, 132($sp)
    sw $t0, 4($t1)
    lw $t0, 132($sp)
    lw $t2, 0($t0)
    sw $t2, 136($sp)
    lw $t0, 132($sp)
    move $a0, $t0
    lw $t0, 136($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 140($sp)
    lw $t0, 140($sp)
    rem $t2, $t0, 500
    sw $t2, 144($sp)
    lw $t0, 84($sp)
    lw $t2, -4($t0)
    sw $t2, 148($sp)
    lw $t0, 120($sp)
    sge $t2, $t0, 0
    sw $t2, 152($sp)
    lw $t0, 120($sp)
    lw $t1, 148($sp)
    slt $t2, $t0, $t1
    sw $t2, 156($sp)
    lw $t0, 152($sp)
    lw $t1, 156($sp)
    and $t2, $t0, $t1
    sw $t2, 160($sp)
    lw $t0, 160($sp)
    beqz $t0, main_L13
    lw $t0, 120($sp)
    mul $t2, $t0, 4
    sw $t2, 164($sp)
    lw $t0, 164($sp)
    lw $t1, 84($sp)
    addu $t2, $t0, $t1
    sw $t2, 168($sp)
    lw $t0, 144($sp)
    lw $t1, 168($sp)
    sw $t0, 0($t1)
    j main_L14
    main_L13:
    la $t2, _STRING6
    sw $t2, 172($sp)
    lw $t0, 172($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L14:
    lw $t0, 160($sp)
    beqz $t0, main_L16
    lw $t0, 168($sp)
    lw $t2, 0($t0)
    sw $t2, 176($sp)
    j main_L17
    main_L16:
    la $t2, _STRING6
    sw $t2, 180($sp)
    lw $t0, 180($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L17:
    lw $t0, 104($sp)
    lw $t2, -4($t0)
    sw $t2, 184($sp)
    lw $t0, 120($sp)
    lw $t1, 184($sp)
    slt $t2, $t0, $t1
    sw $t2, 188($sp)
    lw $t0, 152($sp)
    lw $t1, 188($sp)
    and $t2, $t0, $t1
    sw $t2, 192($sp)
    lw $t0, 192($sp)
    beqz $t0, main_L19
    lw $t0, 164($sp)
    lw $t1, 104($sp)
    addu $t2, $t0, $t1
    sw $t2, 196($sp)
    lw $t0, 176($sp)
    lw $t1, 196($sp)
    sw $t0, 0($t1)
    j main_L20
    main_L19:
    la $t2, _STRING6
    sw $t2, 200($sp)
    lw $t0, 200($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L20:
    lw $t0, 120($sp)
    addu $t2, $t0, 1
    sw $t2, 204($sp)
    lw $t0, 204($sp)
    move $t2, $t0
    sw $t2, 120($sp)
    main_L21:
    li $t2, 8
    sw $t2, 208($sp)
    lw $t0, 208($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 212($sp)
    la $t2, length
    sw $t2, 216($sp)
    lw $t0, 216($sp)
    lw $t1, 212($sp)
    sw $t0, 0($t1)
    lw $t0, 84($sp)
    lw $t1, 212($sp)
    sw $t0, 4($t1)
    lw $t0, 212($sp)
    lw $t2, 0($t0)
    sw $t2, 220($sp)
    lw $t0, 212($sp)
    move $a0, $t0
    lw $t0, 220($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 224($sp)
    lw $t0, 120($sp)
    lw $t1, 224($sp)
    slt $t2, $t0, $t1
    sw $t2, 228($sp)
    lw $t0, 228($sp)
    bnez $t0, main_L10
    la $t2, _QuickSort.sort._entry
    sw $t2, 232($sp)
    li $t2, 4
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
    li $t2, 8
    sw $t2, 244($sp)
    lw $t0, 244($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 248($sp)
    la $t2, length
    sw $t2, 252($sp)
    lw $t0, 252($sp)
    lw $t1, 248($sp)
    sw $t0, 0($t1)
    lw $t0, 84($sp)
    lw $t1, 248($sp)
    sw $t0, 4($t1)
    lw $t0, 248($sp)
    lw $t2, 0($t0)
    sw $t2, 256($sp)
    lw $t0, 248($sp)
    move $a0, $t0
    lw $t0, 256($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 260($sp)
    lw $t0, 260($sp)
    subu $t2, $t0, 1
    sw $t2, 264($sp)
    lw $t0, 240($sp)
    lw $t2, 0($t0)
    sw $t2, 268($sp)
    lw $t0, 240($sp)
    move $a0, $t0
    lw $t0, 84($sp)
    move $a1, $t0
    move $a2, $zero
    lw $t0, 264($sp)
    move $a3, $t0
    lw $t0, 268($sp)
    jalr $t0
    li $t2, 0
    sw $t2, 272($sp)
    j main_L27
    main_L23:
    lw $t0, 84($sp)
    lw $t2, -4($t0)
    sw $t2, 276($sp)
    lw $t0, 272($sp)
    sge $t2, $t0, 0
    sw $t2, 280($sp)
    lw $t0, 272($sp)
    lw $t1, 276($sp)
    slt $t2, $t0, $t1
    sw $t2, 284($sp)
    lw $t0, 280($sp)
    lw $t1, 284($sp)
    and $t2, $t0, $t1
    sw $t2, 280($sp)
    lw $t0, 280($sp)
    beqz $t0, main_L25
    lw $t0, 272($sp)
    mul $t2, $t0, 4
    sw $t2, 288($sp)
    lw $t0, 288($sp)
    lw $t1, 84($sp)
    addu $t2, $t0, $t1
    sw $t2, 288($sp)
    lw $t0, 288($sp)
    lw $t2, 0($t0)
    sw $t2, 292($sp)
    j main_L26
    main_L25:
    la $t2, _STRING6
    sw $t2, 296($sp)
    lw $t0, 296($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L26:
    lw $t0, 292($sp)
    move $a0, $t0
    li $v0, 1
    syscall
    la $t2, _STRING7
    sw $t2, 300($sp)
    lw $t0, 300($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    lw $t0, 272($sp)
    addu $t2, $t0, 1
    sw $t2, 304($sp)
    lw $t0, 304($sp)
    move $t2, $t0
    sw $t2, 272($sp)
    main_L27:
    li $t2, 8
    sw $t2, 308($sp)
    lw $t0, 308($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 312($sp)
    la $t2, length
    sw $t2, 316($sp)
    lw $t0, 316($sp)
    lw $t1, 312($sp)
    sw $t0, 0($t1)
    lw $t0, 84($sp)
    lw $t1, 312($sp)
    sw $t0, 4($t1)
    lw $t0, 312($sp)
    lw $t2, 0($t0)
    sw $t2, 320($sp)
    lw $t0, 312($sp)
    move $a0, $t0
    lw $t0, 320($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 324($sp)
    lw $t0, 272($sp)
    lw $t1, 324($sp)
    slt $t2, $t0, $t1
    sw $t2, 328($sp)
    lw $t0, 328($sp)
    bnez $t0, main_L23
    la $t2, _STRING8
    sw $t2, 332($sp)
    lw $t0, 332($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    la $t2, _MergeSort.sort._entry
    sw $t2, 336($sp)
    li $t2, 4
    sw $t2, 340($sp)
    lw $t0, 340($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 344($sp)
    lw $t0, 336($sp)
    lw $t1, 344($sp)
    sw $t0, 0($t1)
    lw $t0, 344($sp)
    lw $t2, 0($t0)
    sw $t2, 348($sp)
    lw $t0, 344($sp)
    move $a0, $t0
    lw $t0, 104($sp)
    move $a1, $t0
    lw $t0, 348($sp)
    jalr $t0
    li $t2, 0
    sw $t2, 352($sp)
    j main_L33
    main_L29:
    lw $t0, 104($sp)
    lw $t2, -4($t0)
    sw $t2, 356($sp)
    lw $t0, 352($sp)
    sge $t2, $t0, 0
    sw $t2, 360($sp)
    lw $t0, 352($sp)
    lw $t1, 356($sp)
    slt $t2, $t0, $t1
    sw $t2, 364($sp)
    lw $t0, 360($sp)
    lw $t1, 364($sp)
    and $t2, $t0, $t1
    sw $t2, 360($sp)
    lw $t0, 360($sp)
    beqz $t0, main_L31
    lw $t0, 352($sp)
    mul $t2, $t0, 4
    sw $t2, 368($sp)
    lw $t0, 368($sp)
    lw $t1, 104($sp)
    addu $t2, $t0, $t1
    sw $t2, 368($sp)
    lw $t0, 368($sp)
    lw $t2, 0($t0)
    sw $t2, 372($sp)
    j main_L32
    main_L31:
    la $t2, _STRING6
    sw $t2, 376($sp)
    lw $t0, 376($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L32:
    lw $t0, 372($sp)
    move $a0, $t0
    li $v0, 1
    syscall
    la $t2, _STRING7
    sw $t2, 380($sp)
    lw $t0, 380($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    lw $t0, 352($sp)
    addu $t2, $t0, 1
    sw $t2, 384($sp)
    lw $t0, 384($sp)
    move $t2, $t0
    sw $t2, 352($sp)
    main_L33:
    li $t2, 8
    sw $t2, 388($sp)
    lw $t0, 388($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 392($sp)
    la $t2, length
    sw $t2, 396($sp)
    lw $t0, 396($sp)
    lw $t1, 392($sp)
    sw $t0, 0($t1)
    lw $t0, 104($sp)
    lw $t1, 392($sp)
    sw $t0, 4($t1)
    lw $t0, 392($sp)
    lw $t2, 0($t0)
    sw $t2, 400($sp)
    lw $t0, 392($sp)
    move $a0, $t0
    lw $t0, 400($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 404($sp)
    lw $t0, 352($sp)
    lw $t1, 404($sp)
    slt $t2, $t0, $t1
    sw $t2, 408($sp)
    lw $t0, 408($sp)
    bnez $t0, main_L29
    la $t2, _STRING8
    sw $t2, 412($sp)
    lw $t0, 412($sp)
    move $a0, $t0
    li $v0, 4
    syscall
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
    addu $sp, $sp, 416
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
.globl _QuickSort.sort
_QuickSort.sort:
    subu $sp, $sp, 256
    move $t2, $a0
    sw $t2, 256($sp)
    move $t2, $a1
    sw $t2, 260($sp)
    move $t2, $a2
    sw $t2, 264($sp)
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
    lw $t0, 260($sp)
    move $t2, $t0
    sw $t2, 56($sp)
    lw $t0, 264($sp)
    move $t2, $t0
    sw $t2, 60($sp)
    lw $t0, 264($sp)
    lw $t1, 260($sp)
    subu $t2, $t0, $t1
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    div $t2, $t0, 2
    sw $t2, 68($sp)
    lw $t0, 260($sp)
    lw $t1, 68($sp)
    addu $t2, $t0, $t1
    sw $t2, 72($sp)
    lw $t0, 256($sp)
    lw $t2, -4($t0)
    sw $t2, 76($sp)
    lw $t0, 72($sp)
    sge $t2, $t0, 0
    sw $t2, 80($sp)
    lw $t0, 72($sp)
    lw $t1, 76($sp)
    slt $t2, $t0, $t1
    sw $t2, 84($sp)
    lw $t0, 80($sp)
    lw $t1, 84($sp)
    and $t2, $t0, $t1
    sw $t2, 80($sp)
    lw $t0, 80($sp)
    beqz $t0, _QuickSort.sort_L4
    lw $t0, 72($sp)
    mul $t2, $t0, 4
    sw $t2, 88($sp)
    lw $t0, 88($sp)
    lw $t1, 256($sp)
    addu $t2, $t0, $t1
    sw $t2, 88($sp)
    lw $t0, 88($sp)
    lw $t2, 0($t0)
    sw $t2, 92($sp)
    j _QuickSort.sort_L5
    _QuickSort.sort_L4:
    la $t2, _STRING6
    sw $t2, 96($sp)
    lw $t0, 96($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L5:
    j _QuickSort.sort_L32
    _QuickSort.sort_L6:
    j _QuickSort.sort_L8
    _QuickSort.sort_L7:
    lw $t0, 56($sp)
    addu $t2, $t0, 1
    sw $t2, 100($sp)
    lw $t0, 100($sp)
    move $t2, $t0
    sw $t2, 56($sp)
    _QuickSort.sort_L8:
    lw $t0, 76($sp)
    move $t2, $t0
    sw $t2, 104($sp)
    lw $t0, 56($sp)
    sge $t2, $t0, 0
    sw $t2, 108($sp)
    lw $t0, 56($sp)
    lw $t1, 76($sp)
    slt $t2, $t0, $t1
    sw $t2, 112($sp)
    lw $t0, 108($sp)
    lw $t1, 112($sp)
    and $t2, $t0, $t1
    sw $t2, 116($sp)
    lw $t0, 116($sp)
    beqz $t0, _QuickSort.sort_L10
    lw $t0, 56($sp)
    mul $t2, $t0, 4
    sw $t2, 120($sp)
    lw $t0, 120($sp)
    lw $t1, 256($sp)
    addu $t2, $t0, $t1
    sw $t2, 124($sp)
    lw $t0, 124($sp)
    lw $t2, 0($t0)
    sw $t2, 128($sp)
    j _QuickSort.sort_L11
    _QuickSort.sort_L10:
    la $t2, _STRING6
    sw $t2, 132($sp)
    lw $t0, 132($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L11:
    lw $t0, 128($sp)
    lw $t1, 92($sp)
    slt $t2, $t0, $t1
    sw $t2, 136($sp)
    lw $t0, 136($sp)
    bnez $t0, _QuickSort.sort_L7
    j _QuickSort.sort_L14
    _QuickSort.sort_L13:
    lw $t0, 60($sp)
    subu $t2, $t0, 1
    sw $t2, 140($sp)
    lw $t0, 140($sp)
    move $t2, $t0
    sw $t2, 60($sp)
    _QuickSort.sort_L14:
    lw $t0, 104($sp)
    move $t2, $t0
    sw $t2, 76($sp)
    lw $t0, 60($sp)
    sge $t2, $t0, 0
    sw $t2, 144($sp)
    lw $t0, 60($sp)
    lw $t1, 104($sp)
    slt $t2, $t0, $t1
    sw $t2, 148($sp)
    lw $t0, 144($sp)
    lw $t1, 148($sp)
    and $t2, $t0, $t1
    sw $t2, 152($sp)
    lw $t0, 152($sp)
    beqz $t0, _QuickSort.sort_L16
    lw $t0, 60($sp)
    mul $t2, $t0, 4
    sw $t2, 156($sp)
    lw $t0, 156($sp)
    lw $t1, 256($sp)
    addu $t2, $t0, $t1
    sw $t2, 160($sp)
    lw $t0, 160($sp)
    lw $t2, 0($t0)
    sw $t2, 164($sp)
    j _QuickSort.sort_L17
    _QuickSort.sort_L16:
    la $t2, _STRING6
    sw $t2, 168($sp)
    lw $t0, 168($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L17:
    lw $t0, 164($sp)
    lw $t1, 92($sp)
    sgt $t2, $t0, $t1
    sw $t2, 172($sp)
    lw $t0, 172($sp)
    bnez $t0, _QuickSort.sort_L13
    lw $t0, 56($sp)
    lw $t1, 60($sp)
    sle $t2, $t0, $t1
    sw $t2, 176($sp)
    lw $t0, 176($sp)
    beqz $t0, _QuickSort.sort_L32
    lw $t0, 56($sp)
    lw $t1, 104($sp)
    slt $t2, $t0, $t1
    sw $t2, 180($sp)
    lw $t0, 108($sp)
    lw $t1, 180($sp)
    and $t2, $t0, $t1
    sw $t2, 184($sp)
    lw $t0, 184($sp)
    beqz $t0, _QuickSort.sort_L21
    j _QuickSort.sort_L22
    _QuickSort.sort_L21:
    la $t2, _STRING6
    sw $t2, 188($sp)
    lw $t0, 188($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L22:
    lw $t0, 152($sp)
    beqz $t0, _QuickSort.sort_L24
    j _QuickSort.sort_L25
    _QuickSort.sort_L24:
    la $t2, _STRING6
    sw $t2, 192($sp)
    lw $t0, 192($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L25:
    lw $t0, 184($sp)
    beqz $t0, _QuickSort.sort_L27
    lw $t0, 164($sp)
    lw $t1, 124($sp)
    sw $t0, 0($t1)
    j _QuickSort.sort_L28
    _QuickSort.sort_L27:
    la $t2, _STRING6
    sw $t2, 196($sp)
    lw $t0, 196($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L28:
    lw $t0, 104($sp)
    move $t2, $t0
    sw $t2, 76($sp)
    lw $t0, 152($sp)
    beqz $t0, _QuickSort.sort_L30
    lw $t0, 128($sp)
    lw $t1, 160($sp)
    sw $t0, 0($t1)
    j _QuickSort.sort_L31
    _QuickSort.sort_L30:
    la $t2, _STRING6
    sw $t2, 200($sp)
    lw $t0, 200($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L31:
    lw $t0, 56($sp)
    addu $t2, $t0, 1
    sw $t2, 204($sp)
    lw $t0, 204($sp)
    move $t2, $t0
    sw $t2, 56($sp)
    lw $t0, 60($sp)
    subu $t2, $t0, 1
    sw $t2, 208($sp)
    lw $t0, 208($sp)
    move $t2, $t0
    sw $t2, 60($sp)
    _QuickSort.sort_L32:
    lw $t0, 56($sp)
    lw $t1, 60($sp)
    sle $t2, $t0, $t1
    sw $t2, 212($sp)
    lw $t0, 212($sp)
    bnez $t0, _QuickSort.sort_L6
    lw $t0, 260($sp)
    lw $t1, 60($sp)
    slt $t2, $t0, $t1
    sw $t2, 216($sp)
    lw $t0, 216($sp)
    beqz $t0, _QuickSort.sort_L35
    la $t2, _QuickSort.sort._entry
    sw $t2, 220($sp)
    li $t2, 4
    sw $t2, 224($sp)
    lw $t0, 224($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 228($sp)
    lw $t0, 220($sp)
    lw $t1, 228($sp)
    sw $t0, 0($t1)
    lw $t0, 228($sp)
    lw $t2, 0($t0)
    sw $t2, 232($sp)
    lw $t0, 228($sp)
    move $a0, $t0
    lw $t0, 256($sp)
    move $a1, $t0
    lw $t0, 260($sp)
    move $a2, $t0
    lw $t0, 60($sp)
    move $a3, $t0
    lw $t0, 232($sp)
    jalr $t0
    _QuickSort.sort_L35:
    lw $t0, 56($sp)
    lw $t1, 264($sp)
    slt $t2, $t0, $t1
    sw $t2, 236($sp)
    lw $t0, 236($sp)
    beqz $t0, _QuickSort.sort_L37
    la $t2, _QuickSort.sort._entry
    sw $t2, 240($sp)
    li $t2, 4
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
    lw $t0, 248($sp)
    lw $t2, 0($t0)
    sw $t2, 252($sp)
    lw $t0, 248($sp)
    move $a0, $t0
    lw $t0, 256($sp)
    move $a1, $t0
    lw $t0, 56($sp)
    move $a2, $t0
    lw $t0, 264($sp)
    move $a3, $t0
    lw $t0, 252($sp)
    jalr $t0
    _QuickSort.sort_L37:
    _QuickSort.sort_Ret:
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
.globl _QuickSort.sort._entry
_QuickSort.sort._entry:
    subu $sp, $sp, 56
    move $t2, $a0
    sw $t2, 56($sp)
    move $t2, $a1
    sw $t2, 60($sp)
    move $t2, $a2
    sw $t2, 64($sp)
    move $t2, $a3
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
    lw $t0, 60($sp)
    move $a0, $t0
    lw $t0, 64($sp)
    move $a1, $t0
    lw $t0, 68($sp)
    move $a2, $t0
    jal _QuickSort.sort
    _QuickSort.sort._entry_Ret:
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
.globl _MergeSort.sort
_MergeSort.sort:
    subu $sp, $sp, 132
    move $t2, $a0
    sw $t2, 132($sp)
    move $t2, $s0
    sw $t2, 20($sp)
    move $t2, $s1
    sw $t2, 24($sp)
    move $t2, $s2
    sw $t2, 28($sp)
    move $t2, $s3
    sw $t2, 32($sp)
    move $t2, $s4
    sw $t2, 36($sp)
    move $t2, $s5
    sw $t2, 40($sp)
    move $t2, $s6
    sw $t2, 44($sp)
    move $t2, $s7
    sw $t2, 48($sp)
    move $t2, $fp
    sw $t2, 52($sp)
    move $t2, $ra
    sw $t2, 56($sp)
    la $t2, _MergeSort.sort_impl._entry
    sw $t2, 60($sp)
    li $t2, 4
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
    li $t2, 8
    sw $t2, 72($sp)
    lw $t0, 72($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 76($sp)
    la $t2, length
    sw $t2, 80($sp)
    lw $t0, 80($sp)
    lw $t1, 76($sp)
    sw $t0, 0($t1)
    lw $t0, 132($sp)
    lw $t1, 76($sp)
    sw $t0, 4($t1)
    lw $t0, 76($sp)
    lw $t2, 0($t0)
    sw $t2, 84($sp)
    lw $t0, 76($sp)
    move $a0, $t0
    lw $t0, 84($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 88($sp)
    li $t2, 8
    sw $t2, 92($sp)
    lw $t0, 92($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 96($sp)
    la $t2, length
    sw $t2, 100($sp)
    lw $t0, 100($sp)
    lw $t1, 96($sp)
    sw $t0, 0($t1)
    lw $t0, 132($sp)
    lw $t1, 96($sp)
    sw $t0, 4($t1)
    lw $t0, 96($sp)
    lw $t2, 0($t0)
    sw $t2, 104($sp)
    lw $t0, 96($sp)
    move $a0, $t0
    lw $t0, 104($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 108($sp)
    lw $t0, 108($sp)
    slt $t2, $t0, 0
    sw $t2, 112($sp)
    lw $t0, 112($sp)
    beqz $t0, _MergeSort.sort_L3
    la $t2, _STRING4
    sw $t2, 116($sp)
    lw $t0, 116($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_L3:
    lw $t0, 108($sp)
    mul $t2, $t0, 4
    sw $t2, 120($sp)
    lw $t0, 120($sp)
    addu $t2, $t0, 4
    sw $t2, 120($sp)
    lw $t0, 120($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 124($sp)
    lw $t0, 124($sp)
    lw $t1, 120($sp)
    addu $t2, $t0, $t1
    sw $t2, 120($sp)
    lw $t0, 124($sp)
    addu $t2, $t0, 4
    sw $t2, 124($sp)
    j _MergeSort.sort_L5
    _MergeSort.sort_L4:
    lw $t0, 120($sp)
    subu $t2, $t0, 4
    sw $t2, 120($sp)
    lw $t1, 120($sp)
    sw $zero, 0($t1)
    _MergeSort.sort_L5:
    lw $t0, 120($sp)
    lw $t1, 124($sp)
    seq $t2, $t0, $t1
    sw $t2, 112($sp)
    lw $t0, 112($sp)
    beqz $t0, _MergeSort.sort_L4
    lw $t0, 108($sp)
    lw $t1, 124($sp)
    sw $t0, -4($t1)
    lw $t0, 68($sp)
    lw $t2, 0($t0)
    sw $t2, 128($sp)
    lw $t0, 68($sp)
    move $a0, $t0
    lw $t0, 132($sp)
    move $a1, $t0
    move $a2, $zero
    lw $t0, 88($sp)
    move $a3, $t0
    lw $t0, 124($sp)
    sw $t0, 16($sp)
    lw $t0, 128($sp)
    jalr $t0
    _MergeSort.sort_Ret:
    lw $t0, 20($sp)
    move $s0, $t0
    lw $t0, 24($sp)
    move $s1, $t0
    lw $t0, 28($sp)
    move $s2, $t0
    lw $t0, 32($sp)
    move $s3, $t0
    lw $t0, 36($sp)
    move $s4, $t0
    lw $t0, 40($sp)
    move $s5, $t0
    lw $t0, 44($sp)
    move $s6, $t0
    lw $t0, 48($sp)
    move $s7, $t0
    lw $t0, 52($sp)
    move $fp, $t0
    lw $t0, 56($sp)
    move $ra, $t0
    addu $sp, $sp, 132
    jr $ra

.text
.globl _MergeSort.sort._entry
_MergeSort.sort._entry:
    subu $sp, $sp, 56
    move $t2, $a0
    sw $t2, 56($sp)
    move $t2, $a1
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
    lw $t0, 60($sp)
    move $a0, $t0
    jal _MergeSort.sort
    _MergeSort.sort._entry_Ret:
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
.globl _MergeSort.sort_impl
_MergeSort.sort_impl:
    subu $sp, $sp, 368
    move $t2, $a0
    sw $t2, 368($sp)
    move $t2, $a1
    sw $t2, 372($sp)
    move $t2, $a2
    sw $t2, 376($sp)
    move $t2, $a3
    sw $t2, 380($sp)
    move $t2, $s0
    sw $t2, 20($sp)
    move $t2, $s1
    sw $t2, 24($sp)
    move $t2, $s2
    sw $t2, 28($sp)
    move $t2, $s3
    sw $t2, 32($sp)
    move $t2, $s4
    sw $t2, 36($sp)
    move $t2, $s5
    sw $t2, 40($sp)
    move $t2, $s6
    sw $t2, 44($sp)
    move $t2, $s7
    sw $t2, 48($sp)
    move $t2, $fp
    sw $t2, 52($sp)
    move $t2, $ra
    sw $t2, 56($sp)
    lw $t0, 372($sp)
    addu $t2, $t0, 1
    sw $t2, 60($sp)
    lw $t0, 60($sp)
    lw $t1, 376($sp)
    slt $t2, $t0, $t1
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    beqz $t0, _MergeSort.sort_impl_L45
    lw $t0, 372($sp)
    lw $t1, 376($sp)
    addu $t2, $t0, $t1
    sw $t2, 68($sp)
    lw $t0, 68($sp)
    div $t2, $t0, 2
    sw $t2, 72($sp)
    la $t2, _MergeSort.sort_impl._entry
    sw $t2, 76($sp)
    li $t2, 4
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
    lw $t0, 84($sp)
    lw $t2, 0($t0)
    sw $t2, 88($sp)
    lw $t0, 84($sp)
    move $a0, $t0
    lw $t0, 368($sp)
    move $a1, $t0
    lw $t0, 372($sp)
    move $a2, $t0
    lw $t0, 72($sp)
    move $a3, $t0
    lw $t0, 380($sp)
    sw $t0, 16($sp)
    lw $t0, 88($sp)
    jalr $t0
    la $t2, _MergeSort.sort_impl._entry
    sw $t2, 92($sp)
    li $t2, 4
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
    lw $t0, 100($sp)
    lw $t2, 0($t0)
    sw $t2, 104($sp)
    lw $t0, 100($sp)
    move $a0, $t0
    lw $t0, 368($sp)
    move $a1, $t0
    lw $t0, 72($sp)
    move $a2, $t0
    lw $t0, 376($sp)
    move $a3, $t0
    lw $t0, 380($sp)
    sw $t0, 16($sp)
    lw $t0, 104($sp)
    jalr $t0
    lw $t0, 372($sp)
    move $t2, $t0
    sw $t2, 108($sp)
    lw $t0, 72($sp)
    move $t2, $t0
    sw $t2, 112($sp)
    li $t2, 0
    sw $t2, 116($sp)
    j _MergeSort.sort_impl_L26
    _MergeSort.sort_impl_L4:
    lw $t0, 368($sp)
    lw $t2, -4($t0)
    sw $t2, 120($sp)
    lw $t0, 112($sp)
    sge $t2, $t0, 0
    sw $t2, 124($sp)
    lw $t0, 112($sp)
    lw $t1, 120($sp)
    slt $t2, $t0, $t1
    sw $t2, 128($sp)
    lw $t0, 124($sp)
    lw $t1, 128($sp)
    and $t2, $t0, $t1
    sw $t2, 132($sp)
    lw $t0, 132($sp)
    beqz $t0, _MergeSort.sort_impl_L6
    lw $t0, 112($sp)
    mul $t2, $t0, 4
    sw $t2, 136($sp)
    lw $t0, 136($sp)
    lw $t1, 368($sp)
    addu $t2, $t0, $t1
    sw $t2, 140($sp)
    lw $t0, 140($sp)
    lw $t2, 0($t0)
    sw $t2, 144($sp)
    j _MergeSort.sort_impl_L7
    _MergeSort.sort_impl_L6:
    la $t2, _STRING6
    sw $t2, 148($sp)
    lw $t0, 148($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L7:
    lw $t0, 108($sp)
    sge $t2, $t0, 0
    sw $t2, 152($sp)
    lw $t0, 108($sp)
    lw $t1, 120($sp)
    slt $t2, $t0, $t1
    sw $t2, 156($sp)
    lw $t0, 152($sp)
    lw $t1, 156($sp)
    and $t2, $t0, $t1
    sw $t2, 160($sp)
    lw $t0, 160($sp)
    beqz $t0, _MergeSort.sort_impl_L9
    lw $t0, 108($sp)
    mul $t2, $t0, 4
    sw $t2, 164($sp)
    lw $t0, 164($sp)
    lw $t1, 368($sp)
    addu $t2, $t0, $t1
    sw $t2, 168($sp)
    lw $t0, 168($sp)
    lw $t2, 0($t0)
    sw $t2, 172($sp)
    j _MergeSort.sort_impl_L10
    _MergeSort.sort_impl_L9:
    la $t2, _STRING6
    sw $t2, 176($sp)
    lw $t0, 176($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L10:
    lw $t0, 144($sp)
    lw $t1, 172($sp)
    slt $t2, $t0, $t1
    sw $t2, 180($sp)
    lw $t0, 180($sp)
    beqz $t0, _MergeSort.sort_impl_L18
    lw $t0, 132($sp)
    beqz $t0, _MergeSort.sort_impl_L13
    j _MergeSort.sort_impl_L14
    _MergeSort.sort_impl_L13:
    la $t2, _STRING6
    sw $t2, 184($sp)
    lw $t0, 184($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L14:
    lw $t0, 380($sp)
    lw $t2, -4($t0)
    sw $t2, 188($sp)
    lw $t0, 116($sp)
    sge $t2, $t0, 0
    sw $t2, 192($sp)
    lw $t0, 116($sp)
    lw $t1, 188($sp)
    slt $t2, $t0, $t1
    sw $t2, 196($sp)
    lw $t0, 192($sp)
    lw $t1, 196($sp)
    and $t2, $t0, $t1
    sw $t2, 192($sp)
    lw $t0, 192($sp)
    beqz $t0, _MergeSort.sort_impl_L16
    lw $t0, 116($sp)
    mul $t2, $t0, 4
    sw $t2, 200($sp)
    lw $t0, 200($sp)
    lw $t1, 380($sp)
    addu $t2, $t0, $t1
    sw $t2, 200($sp)
    lw $t0, 144($sp)
    lw $t1, 200($sp)
    sw $t0, 0($t1)
    j _MergeSort.sort_impl_L17
    _MergeSort.sort_impl_L16:
    la $t2, _STRING6
    sw $t2, 204($sp)
    lw $t0, 204($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L17:
    lw $t0, 112($sp)
    addu $t2, $t0, 1
    sw $t2, 208($sp)
    lw $t0, 208($sp)
    move $t2, $t0
    sw $t2, 112($sp)
    j _MergeSort.sort_impl_L25
    _MergeSort.sort_impl_L18:
    lw $t0, 160($sp)
    beqz $t0, _MergeSort.sort_impl_L20
    j _MergeSort.sort_impl_L21
    _MergeSort.sort_impl_L20:
    la $t2, _STRING6
    sw $t2, 212($sp)
    lw $t0, 212($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L21:
    lw $t0, 380($sp)
    lw $t2, -4($t0)
    sw $t2, 216($sp)
    lw $t0, 116($sp)
    sge $t2, $t0, 0
    sw $t2, 220($sp)
    lw $t0, 116($sp)
    lw $t1, 216($sp)
    slt $t2, $t0, $t1
    sw $t2, 224($sp)
    lw $t0, 220($sp)
    lw $t1, 224($sp)
    and $t2, $t0, $t1
    sw $t2, 220($sp)
    lw $t0, 220($sp)
    beqz $t0, _MergeSort.sort_impl_L23
    lw $t0, 116($sp)
    mul $t2, $t0, 4
    sw $t2, 228($sp)
    lw $t0, 228($sp)
    lw $t1, 380($sp)
    addu $t2, $t0, $t1
    sw $t2, 228($sp)
    lw $t0, 172($sp)
    lw $t1, 228($sp)
    sw $t0, 0($t1)
    j _MergeSort.sort_impl_L24
    _MergeSort.sort_impl_L23:
    la $t2, _STRING6
    sw $t2, 232($sp)
    lw $t0, 232($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L24:
    lw $t0, 108($sp)
    addu $t2, $t0, 1
    sw $t2, 236($sp)
    lw $t0, 236($sp)
    move $t2, $t0
    sw $t2, 108($sp)
    _MergeSort.sort_impl_L25:
    lw $t0, 116($sp)
    addu $t2, $t0, 1
    sw $t2, 240($sp)
    lw $t0, 240($sp)
    move $t2, $t0
    sw $t2, 116($sp)
    _MergeSort.sort_impl_L26:
    lw $t0, 108($sp)
    lw $t1, 72($sp)
    slt $t2, $t0, $t1
    sw $t2, 244($sp)
    lw $t0, 112($sp)
    lw $t1, 376($sp)
    slt $t2, $t0, $t1
    sw $t2, 248($sp)
    lw $t0, 244($sp)
    lw $t1, 248($sp)
    and $t2, $t0, $t1
    sw $t2, 252($sp)
    lw $t0, 252($sp)
    bnez $t0, _MergeSort.sort_impl_L4
    j _MergeSort.sort_impl_L35
    _MergeSort.sort_impl_L28:
    lw $t0, 368($sp)
    lw $t2, -4($t0)
    sw $t2, 256($sp)
    lw $t0, 108($sp)
    sge $t2, $t0, 0
    sw $t2, 260($sp)
    lw $t0, 108($sp)
    lw $t1, 256($sp)
    slt $t2, $t0, $t1
    sw $t2, 264($sp)
    lw $t0, 260($sp)
    lw $t1, 264($sp)
    and $t2, $t0, $t1
    sw $t2, 260($sp)
    lw $t0, 260($sp)
    beqz $t0, _MergeSort.sort_impl_L30
    lw $t0, 108($sp)
    mul $t2, $t0, 4
    sw $t2, 268($sp)
    lw $t0, 268($sp)
    lw $t1, 368($sp)
    addu $t2, $t0, $t1
    sw $t2, 268($sp)
    lw $t0, 268($sp)
    lw $t2, 0($t0)
    sw $t2, 272($sp)
    j _MergeSort.sort_impl_L31
    _MergeSort.sort_impl_L30:
    la $t2, _STRING6
    sw $t2, 276($sp)
    lw $t0, 276($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L31:
    lw $t0, 380($sp)
    lw $t2, -4($t0)
    sw $t2, 280($sp)
    lw $t0, 116($sp)
    sge $t2, $t0, 0
    sw $t2, 284($sp)
    lw $t0, 116($sp)
    lw $t1, 280($sp)
    slt $t2, $t0, $t1
    sw $t2, 288($sp)
    lw $t0, 284($sp)
    lw $t1, 288($sp)
    and $t2, $t0, $t1
    sw $t2, 284($sp)
    lw $t0, 284($sp)
    beqz $t0, _MergeSort.sort_impl_L33
    lw $t0, 116($sp)
    mul $t2, $t0, 4
    sw $t2, 292($sp)
    lw $t0, 292($sp)
    lw $t1, 380($sp)
    addu $t2, $t0, $t1
    sw $t2, 292($sp)
    lw $t0, 272($sp)
    lw $t1, 292($sp)
    sw $t0, 0($t1)
    j _MergeSort.sort_impl_L34
    _MergeSort.sort_impl_L33:
    la $t2, _STRING6
    sw $t2, 296($sp)
    lw $t0, 296($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L34:
    lw $t0, 116($sp)
    addu $t2, $t0, 1
    sw $t2, 300($sp)
    lw $t0, 300($sp)
    move $t2, $t0
    sw $t2, 116($sp)
    lw $t0, 108($sp)
    addu $t2, $t0, 1
    sw $t2, 304($sp)
    lw $t0, 304($sp)
    move $t2, $t0
    sw $t2, 108($sp)
    _MergeSort.sort_impl_L35:
    lw $t0, 108($sp)
    lw $t1, 72($sp)
    slt $t2, $t0, $t1
    sw $t2, 308($sp)
    lw $t0, 308($sp)
    bnez $t0, _MergeSort.sort_impl_L28
    li $t2, 0
    sw $t2, 108($sp)
    j _MergeSort.sort_impl_L44
    _MergeSort.sort_impl_L37:
    lw $t0, 380($sp)
    lw $t2, -4($t0)
    sw $t2, 312($sp)
    lw $t0, 108($sp)
    sge $t2, $t0, 0
    sw $t2, 316($sp)
    lw $t0, 108($sp)
    lw $t1, 312($sp)
    slt $t2, $t0, $t1
    sw $t2, 320($sp)
    lw $t0, 316($sp)
    lw $t1, 320($sp)
    and $t2, $t0, $t1
    sw $t2, 316($sp)
    lw $t0, 316($sp)
    beqz $t0, _MergeSort.sort_impl_L39
    lw $t0, 108($sp)
    mul $t2, $t0, 4
    sw $t2, 324($sp)
    lw $t0, 324($sp)
    lw $t1, 380($sp)
    addu $t2, $t0, $t1
    sw $t2, 324($sp)
    lw $t0, 324($sp)
    lw $t2, 0($t0)
    sw $t2, 328($sp)
    j _MergeSort.sort_impl_L40
    _MergeSort.sort_impl_L39:
    la $t2, _STRING6
    sw $t2, 332($sp)
    lw $t0, 332($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L40:
    lw $t0, 108($sp)
    lw $t1, 372($sp)
    addu $t2, $t0, $t1
    sw $t2, 336($sp)
    lw $t0, 368($sp)
    lw $t2, -4($t0)
    sw $t2, 340($sp)
    lw $t0, 336($sp)
    sge $t2, $t0, 0
    sw $t2, 344($sp)
    lw $t0, 336($sp)
    lw $t1, 340($sp)
    slt $t2, $t0, $t1
    sw $t2, 348($sp)
    lw $t0, 344($sp)
    lw $t1, 348($sp)
    and $t2, $t0, $t1
    sw $t2, 344($sp)
    lw $t0, 344($sp)
    beqz $t0, _MergeSort.sort_impl_L42
    lw $t0, 336($sp)
    mul $t2, $t0, 4
    sw $t2, 352($sp)
    lw $t0, 352($sp)
    lw $t1, 368($sp)
    addu $t2, $t0, $t1
    sw $t2, 352($sp)
    lw $t0, 328($sp)
    lw $t1, 352($sp)
    sw $t0, 0($t1)
    j _MergeSort.sort_impl_L43
    _MergeSort.sort_impl_L42:
    la $t2, _STRING6
    sw $t2, 356($sp)
    lw $t0, 356($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L43:
    lw $t0, 108($sp)
    addu $t2, $t0, 1
    sw $t2, 360($sp)
    lw $t0, 360($sp)
    move $t2, $t0
    sw $t2, 108($sp)
    _MergeSort.sort_impl_L44:
    lw $t0, 108($sp)
    lw $t1, 116($sp)
    slt $t2, $t0, $t1
    sw $t2, 364($sp)
    lw $t0, 364($sp)
    bnez $t0, _MergeSort.sort_impl_L37
    _MergeSort.sort_impl_L45:
    _MergeSort.sort_impl_Ret:
    lw $t0, 20($sp)
    move $s0, $t0
    lw $t0, 24($sp)
    move $s1, $t0
    lw $t0, 28($sp)
    move $s2, $t0
    lw $t0, 32($sp)
    move $s3, $t0
    lw $t0, 36($sp)
    move $s4, $t0
    lw $t0, 40($sp)
    move $s5, $t0
    lw $t0, 44($sp)
    move $s6, $t0
    lw $t0, 48($sp)
    move $s7, $t0
    lw $t0, 52($sp)
    move $fp, $t0
    lw $t0, 56($sp)
    move $ra, $t0
    addu $sp, $sp, 368
    jr $ra

.text
.globl _MergeSort.sort_impl._entry
_MergeSort.sort_impl._entry:
    subu $sp, $sp, 56
    move $t2, $a0
    sw $t2, 56($sp)
    move $t2, $a1
    sw $t2, 60($sp)
    move $t2, $a2
    sw $t2, 64($sp)
    move $t2, $a3
    sw $t2, 68($sp)
    lw $t2, 72($sp)
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
    lw $t0, 60($sp)
    move $a0, $t0
    lw $t0, 64($sp)
    move $a1, $t0
    lw $t0, 68($sp)
    move $a2, $t0
    lw $t0, 72($sp)
    move $a3, $t0
    jal _MergeSort.sort_impl
    _MergeSort.sort_impl._entry_Ret:
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