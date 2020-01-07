.data
.align 2
_Main:
    .word 0
    .word _STRING0

.data
_STRING0:
    .asciiz "Main"
_STRING1:
    .asciiz "Hello THU"
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
    subu $sp, $sp, 24
    sw $s3, 16($sp)
    sw $ra, 20($sp)
    la $s3, _STRING1
    li $a0, 2
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    li $a0, 3
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    li $a0, 5
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    li $a0, 6
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    li $a0, 1
    jal _PrintBool
    la $a0, _STRING2
    li $v0, 4
    syscall
    move $a0, $s3
    li $v0, 4
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    main_Ret:
    lw $s3, 16($sp)
    lw $ra, 20($sp)
    addu $sp, $sp, 24
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