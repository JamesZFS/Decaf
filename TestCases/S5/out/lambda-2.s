.data
.align 2
_Main:
    .word 0
    .word _STRING0
    .word _Main.foo

.data
_STRING0:
    .asciiz "Main"
_STRING1:
    .asciiz "PA3"
_STRING2:
    .asciiz "fzyxqzgbyq"
_STRING3:
    .asciiz "\n"
_STRING4:
    .asciiz "Decaf runtime error: Cannot create negative-sized array\n"
_STRING5:
    .asciiz "Decaf runtime error: Array subscript out of bounds\n"

.text
.globl _Main._new
_Main._new:
    li $a0, 12
    li $v0, 9
    syscall
    la $t8, _Main
    sw $t8, 0($v0)
    sw $zero, 4($v0)
    sw $zero, 8($v0)
    _Main._new_Ret:
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
.globl _Main.foo
_Main.foo:
    subu $sp, $sp, 20
    move $t2, $a0
    sw $ra, 16($sp)
    la $t5, _STRING1
    li $a0, 12
    li $v0, 9
    syscall
    move $t8, $v0
    la $a0, lambda_7_17
    sw $a0, 0($t8)
    sw $t5, 4($t8)
    sw $t2, 8($t8)
    move $a0, $t5
    li $v0, 4
    syscall
    la $a0, _STRING3
    li $v0, 4
    syscall
    lw $v0, 0($t8)
    move $a0, $t8
    jalr $v0
    _Main.foo_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Main.foo._entry
_Main.foo._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 8($v0)
    jalr $v0
    _Main.foo._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl main
main:
    subu $sp, $sp, 36
    sw $s1, 16($sp)
    sw $s4, 20($sp)
    sw $s7, 24($sp)
    sw $ra, 28($sp)
    li $a0, 44
    li $v0, 9
    syscall
    move $s4, $v0
    addu $s7, $s4, 44
    addu $s4, $s4, 4
    j main_L4
    main_L3:
    subu $s7, $s7, 4
    sw $zero, 0($s7)
    main_L4:
    seq $v0, $s7, $s4
    beqz $v0, main_L3
    li $v0, 10
    sw $v0, -4($s4)
    jal _Main._new
    move $s7, $v0
    li $s1, 3
    sw $s1, 4($s7)
    lw $s1, -4($s4)
    sgt $s1, $s1, 0
    beqz $s1, main_L7
    addu $t8, $s4, 0
    sw $t8, 32($sp)
    lw $t8, 32($sp)
    lw $a0, 0($t8)
    j main_L8
    main_L7:
    la $a0, _STRING5
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L8:
    li $v0, 1
    syscall
    la $a0, _STRING3
    li $v0, 4
    syscall
    lw $a0, 4($s7)
    li $v0, 1
    syscall
    la $a0, _STRING3
    li $v0, 4
    syscall
    li $a0, 12
    li $v0, 9
    syscall
    move $a0, $v0
    la $v0, lambda_37_20
    sw $v0, 0($a0)
    sw $s4, 4($a0)
    sw $s7, 8($a0)
    lw $v0, 0($a0)
    jalr $v0
    beqz $s1, main_L10
    lw $s4, 32($sp)
    lw $a0, 0($s4)
    j main_L11
    main_L10:
    la $a0, _STRING5
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L11:
    li $v0, 1
    syscall
    la $a0, _STRING3
    li $v0, 4
    syscall
    lw $a0, 4($s7)
    li $v0, 1
    syscall
    la $a0, _STRING3
    li $v0, 4
    syscall
    la $s4, _Main.foo._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $s4, 0($a0)
    sw $s7, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    lw $a0, 4($s7)
    li $v0, 1
    syscall
    la $a0, _STRING3
    li $v0, 4
    syscall
    main_Ret:
    lw $s1, 16($sp)
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
.globl lambda_9_21
lambda_9_21:
    subu $sp, $sp, 24
    sw $a1, 28($sp)
    sw $s7, 16($sp)
    sw $ra, 20($sp)
    lw $v0, 4($a0)
    li $s7, 4
    sw $s7, 4($v0)
    sw $zero, 8($v0)
    move $s7, $a2
    move $a0, $a2
    lw $a1, 28($sp)
    jal _StringEqual
    not $v0, $v0
    beqz $v0, lambda_9_21_L3
    lw $s7, 28($sp)
    lambda_9_21_L3:
    move $v0, $s7
    lambda_9_21_Ret:
    lw $s7, 16($sp)
    lw $ra, 20($sp)
    addu $sp, $sp, 24
    jr $ra

.text
.globl lambda_7_17
lambda_7_17:
    subu $sp, $sp, 24
    move $t8, $a0
    sw $ra, 16($sp)
    la $a2, _STRING1
    li $a0, 8
    li $v0, 9
    syscall
    la $t5, lambda_9_21
    sw $t5, 0($v0)
    lw $t5, 8($t8)
    sw $t5, 20($sp)
    lw $t5, 20($sp)
    sw $t5, 4($v0)
    lw $a1, 4($t8)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    move $a0, $v0
    li $v0, 4
    syscall
    la $a0, _STRING3
    li $v0, 4
    syscall
    lw $t8, 20($sp)
    lw $a0, 4($t8)
    li $v0, 1
    syscall
    la $a0, _STRING3
    li $v0, 4
    syscall
    li $t8, 2
    lw $t5, 20($sp)
    sw $t8, 4($t5)
    lambda_7_17_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 24
    jr $ra

.text
.globl lambda_40_24
lambda_40_24:
    lw $t8, 8($a0)
    li $t5, 1
    sw $t5, 4($t8)
    lambda_40_24_Ret:
    jr $ra

.text
.globl lambda_37_20
lambda_37_20:
    subu $sp, $sp, 20
    move $t8, $a0
    sw $ra, 16($sp)
    lw $t2, 4($t8)
    lw $t5, -4($t2)
    sgt $t5, $t5, 0
    and $a0, $t5, 1
    beqz $a0, lambda_37_20_L3
    lw $t5, 0($t2)
    j lambda_37_20_L4
    lambda_37_20_L3:
    la $a0, _STRING5
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    lambda_37_20_L4:
    addu $t5, $t5, 1
    beqz $a0, lambda_37_20_L6
    sw $t5, 0($t2)
    j lambda_37_20_L7
    lambda_37_20_L6:
    la $a0, _STRING5
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    lambda_37_20_L7:
    li $a0, 12
    li $v0, 9
    syscall
    move $a0, $v0
    la $v0, lambda_40_24
    sw $v0, 0($a0)
    sw $zero, 4($a0)
    lw $v0, 8($t8)
    sw $v0, 8($a0)
    lw $v0, 0($a0)
    li $a1, 1
    jalr $v0
    lambda_37_20_Ret:
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