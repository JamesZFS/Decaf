.data
.align 2
_Main:
    .word 0
    .word _STRING0
_Fibonacci:
    .word 0
    .word _STRING1
    .word _Fibonacci.get

.data
_STRING0:
    .asciiz "Main"
_STRING1:
    .asciiz "Fibonacci"
_STRING2:
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
.globl _Fibonacci._new
_Fibonacci._new:
    li $a0, 4
    li $v0, 9
    syscall
    la $t8, _Fibonacci
    sw $t8, 0($v0)
    _Fibonacci._new_Ret:
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
    subu $sp, $sp, 28
    sw $s3, 16($sp)
    sw $ra, 20($sp)
    li $v0, 0
    sw $v0, 24($sp)
    jal _Fibonacci._new
    move $s3, $v0
    j main_L3
    main_L2:
    la $t8, _Fibonacci.get._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s3, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    lw $a1, 24($sp)
    jalr $t8
    move $a0, $v0
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    lw $t8, 24($sp)
    addu $t8, $t8, 1
    sw $t8, 24($sp)
    main_L3:
    lw $t8, 24($sp)
    slt $t8, $t8, 10
    bnez $t8, main_L2
    main_Ret:
    lw $s3, 16($sp)
    lw $ra, 20($sp)
    addu $sp, $sp, 28
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
.globl _Fibonacci.get
_Fibonacci.get:
    subu $sp, $sp, 24
    sw $a0, 24($sp)
    sw $a1, 28($sp)
    sw $fp, 16($sp)
    sw $ra, 20($sp)
    lw $t8, 28($sp)
    slt $t8, $t8, 2
    beqz $t8, _Fibonacci.get_L3
    li $v0, 1
    j _Fibonacci.get_Ret
    _Fibonacci.get_L3:
    la $t8, _Fibonacci.get._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    lw $t8, 24($sp)
    sw $t8, 4($v0)
    lw $t8, 28($sp)
    subu $a1, $t8, 1
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    move $fp, $v0
    la $t8, _Fibonacci.get._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 24($sp)
    sw $v0, 4($a0)
    lw $v0, 28($sp)
    subu $a1, $v0, 2
    lw $v0, 0($a0)
    jalr $v0
    addu $v0, $fp, $v0
    _Fibonacci.get_Ret:
    lw $fp, 16($sp)
    lw $ra, 20($sp)
    addu $sp, $sp, 24
    jr $ra

.text
.globl _Fibonacci.get._entry
_Fibonacci.get._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 8($v0)
    jalr $v0
    _Fibonacci.get._entry_Ret:
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