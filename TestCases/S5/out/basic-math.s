.data
.align 2
_Maths:
    .word 0
    .word _STRING0
_Main:
    .word 0
    .word _STRING1

.data
_STRING0:
    .asciiz "Maths"
_STRING1:
    .asciiz "Main"
_STRING2:
    .asciiz "Decaf runtime error: Division by zero error"
_STRING3:
    .asciiz "\n"

.text
.globl _Maths._new
_Maths._new:
    li $a0, 4
    li $v0, 9
    syscall
    la $t8, _Maths
    sw $t8, 0($v0)
    _Maths._new_Ret:
    jr $ra

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
.globl length
length:
    lw $a1, 4($a0)
    lw $a1, -4($a1)
    move $v0, $a1
    length_Ret:
    jr $ra

.text
.globl _Maths.abs
_Maths.abs:
    move $v0, $a0
    sge $t8, $v0, 0
    beqz $t8, _Maths.abs_L3
    j _Maths.abs_Ret
    _Maths.abs_L3:
    neg $v0, $v0
    _Maths.abs_Ret:
    jr $ra

.text
.globl _Maths.abs._entry
_Maths.abs._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    move $a0, $a1
    jal _Maths.abs
    _Maths.abs._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Maths.pow
_Maths.pow:
    li $v0, 1
    li $t8, 0
    j _Maths.pow_L3
    _Maths.pow_L2:
    mul $v0, $v0, $a0
    addu $t8, $t8, 1
    _Maths.pow_L3:
    slt $t5, $t8, $a1
    bnez $t5, _Maths.pow_L2
    _Maths.pow_Ret:
    jr $ra

.text
.globl _Maths.pow._entry
_Maths.pow._entry:
    subu $sp, $sp, 20
    move $a0, $a1
    move $a1, $a2
    sw $ra, 16($sp)
    jal _Maths.pow
    _Maths.pow._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Maths.log
_Maths.log:
    slt $v0, $a0, 1
    beqz $v0, _Maths.log_L3
    li $v0, -1
    j _Maths.log_Ret
    _Maths.log_L3:
    li $v0, 0
    j _Maths.log_L6
    _Maths.log_L4:
    addu $v0, $v0, 1
    div $a0, $a0, 2
    _Maths.log_L6:
    sgt $t8, $a0, 1
    bnez $t8, _Maths.log_L4
    _Maths.log_Ret:
    jr $ra

.text
.globl _Maths.log._entry
_Maths.log._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    move $a0, $a1
    jal _Maths.log
    _Maths.log._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Maths.max
_Maths.max:
    move $v0, $a0
    sgt $t8, $v0, $a1
    beqz $t8, _Maths.max_L3
    j _Maths.max_Ret
    _Maths.max_L3:
    move $v0, $a1
    _Maths.max_Ret:
    jr $ra

.text
.globl _Maths.max._entry
_Maths.max._entry:
    subu $sp, $sp, 20
    move $a0, $a1
    move $a1, $a2
    sw $ra, 16($sp)
    jal _Maths.max
    _Maths.max._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Maths.min
_Maths.min:
    move $v0, $a0
    slt $t8, $v0, $a1
    beqz $t8, _Maths.min_L3
    j _Maths.min_Ret
    _Maths.min_L3:
    move $v0, $a1
    _Maths.min_Ret:
    jr $ra

.text
.globl _Maths.min._entry
_Maths.min._entry:
    subu $sp, $sp, 20
    move $a0, $a1
    move $a1, $a2
    sw $ra, 16($sp)
    jal _Maths.min
    _Maths.min._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl main
main:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    la $t8, _Maths.abs._entry
    li $a0, 4
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 0($a0)
    li $a1, -1
    jalr $v0
    move $a0, $v0
    li $v0, 1
    syscall
    la $a0, _STRING3
    li $v0, 4
    syscall
    la $t8, _Maths.pow._entry
    li $a0, 4
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 0($a0)
    li $a1, 2
    li $a2, 3
    jalr $v0
    move $a0, $v0
    li $v0, 1
    syscall
    la $a0, _STRING3
    li $v0, 4
    syscall
    la $t8, _Maths.log._entry
    li $a0, 4
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    li $a1, 16
    jalr $t8
    move $a0, $v0
    li $v0, 1
    syscall
    la $a0, _STRING3
    li $v0, 4
    syscall
    la $t8, _Maths.max._entry
    li $a0, 4
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    li $a1, 1
    li $a2, 2
    jalr $t8
    move $a0, $v0
    li $v0, 1
    syscall
    la $a0, _STRING3
    li $v0, 4
    syscall
    la $t8, _Maths.min._entry
    li $a0, 4
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 0($a0)
    li $a1, 1
    li $a2, 2
    jalr $v0
    move $a0, $v0
    li $v0, 1
    syscall
    la $a0, _STRING3
    li $v0, 4
    syscall
    main_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
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