.data
.align 2
_Main:
    .word 0
    .word _STRING0

.data
_STRING0:
    .asciiz "Main"

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
.globl main
main:
    subu $sp, $sp, 44
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
    li $t2, 2
    sw $t2, 40($sp)
    lw $t0, 40($sp)
    move $a0, $t0
    li $v0, 1
    syscall
    main_Ret:
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