.data
.align 2
_Main:
    .word 0
    .word _STRING0

.data
_STRING0:
    .asciiz "Main"
_STRING1:
    .asciiz "r0 = "
_STRING2:
    .asciiz "\n"
_STRING3:
    .asciiz "r1 = "
_STRING4:
    .asciiz "r2 = "
_STRING5:
    .asciiz "r3 = "
_STRING6:
    .asciiz "r4 = "
_STRING7:
    .asciiz "r5 = "
_STRING8:
    .asciiz "r6 = "
_STRING9:
    .asciiz "r7 = "
_STRING10:
    .asciiz "r8 = "
_STRING11:
    .asciiz "r9 = "
_STRING12:
    .asciiz "r10 = "
_STRING13:
    .asciiz "r11 = "
_STRING14:
    .asciiz "r12 = "
_STRING15:
    .asciiz "r13 = "
_STRING16:
    .asciiz "r14 = "
_STRING17:
    .asciiz "r15 = "
_STRING18:
    .asciiz "r16 = "
_STRING19:
    .asciiz "r17 = "
_STRING20:
    .asciiz "r18 = "
_STRING21:
    .asciiz "r19 = "
_STRING22:
    .asciiz "r20 = "
_STRING23:
    .asciiz "r21 = "
_STRING24:
    .asciiz "r22 = "
_STRING25:
    .asciiz "r23 = "
_STRING26:
    .asciiz "r24 = "
_STRING27:
    .asciiz "r25 = "
_STRING28:
    .asciiz "r26 = "

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
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    la $t8, _Main.foo._entry
    li $a0, 4
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 0($a0)
    jalr $v0
    la $a0, _STRING1
    li $v0, 4
    syscall
    move $a0, $zero
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING3
    li $v0, 4
    syscall
    li $a0, 1
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING4
    li $v0, 4
    syscall
    li $a0, 2
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING5
    li $v0, 4
    syscall
    li $a0, 3
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING6
    li $v0, 4
    syscall
    li $a0, 4
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING7
    li $v0, 4
    syscall
    li $a0, 5
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING8
    li $v0, 4
    syscall
    li $a0, 6
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING9
    li $v0, 4
    syscall
    li $a0, 7
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING10
    li $v0, 4
    syscall
    li $a0, 8
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING11
    li $v0, 4
    syscall
    li $a0, 9
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING12
    li $v0, 4
    syscall
    li $a0, 10
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING13
    li $v0, 4
    syscall
    li $a0, 11
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING14
    li $v0, 4
    syscall
    li $a0, 12
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING15
    li $v0, 4
    syscall
    li $a0, 13
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING16
    li $v0, 4
    syscall
    li $a0, 14
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING17
    li $v0, 4
    syscall
    li $a0, 15
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING18
    li $v0, 4
    syscall
    li $a0, 16
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING19
    li $v0, 4
    syscall
    li $a0, 17
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING20
    li $v0, 4
    syscall
    li $a0, 18
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING21
    li $v0, 4
    syscall
    li $a0, 19
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING22
    li $v0, 4
    syscall
    li $a0, 20
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING23
    li $v0, 4
    syscall
    li $a0, 21
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING24
    li $v0, 4
    syscall
    li $a0, 22
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING25
    li $v0, 4
    syscall
    li $a0, 23
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING26
    li $v0, 4
    syscall
    li $a0, 24
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING27
    li $v0, 4
    syscall
    li $a0, 25
    li $v0, 1
    syscall
    la $a0, _STRING2
    li $v0, 4
    syscall
    la $a0, _STRING28
    li $v0, 4
    syscall
    li $a0, 26
    li $v0, 1
    syscall
    la $a0, _STRING2
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

.text
.globl _Main.foo
_Main.foo:
    _Main.foo_Ret:
    jr $ra

.text
.globl _Main.foo._entry
_Main.foo._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    jal _Main.foo
    _Main.foo._entry_Ret:
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