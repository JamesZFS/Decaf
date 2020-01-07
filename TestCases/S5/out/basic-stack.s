.data
.align 2
_Stack:
    .word 0
    .word _STRING0
    .word _Stack.Init
    .word _Stack.Push
    .word _Stack.Pop
    .word _Stack.NumElems
_Main:
    .word 0
    .word _STRING1

.data
_STRING0:
    .asciiz "Stack"
_STRING1:
    .asciiz "Main"
_STRING2:
    .asciiz "Decaf runtime error: Cannot create negative-sized array\n"
_STRING3:
    .asciiz "Decaf runtime error: Array subscript out of bounds\n"
_STRING4:
    .asciiz " "

.text
.globl _Stack._new
_Stack._new:
    li $a0, 12
    li $v0, 9
    syscall
    la $t8, _Stack
    sw $t8, 0($v0)
    sw $zero, 4($v0)
    sw $zero, 8($v0)
    _Stack._new_Ret:
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
.globl _Stack.Init
_Stack.Init:
    subu $sp, $sp, 20
    move $t5, $a0
    sw $ra, 16($sp)
    li $a0, 404
    li $v0, 9
    syscall
    move $t8, $v0
    addu $a0, $t8, 404
    addu $t8, $t8, 4
    j _Stack.Init_L4
    _Stack.Init_L3:
    subu $a0, $a0, 4
    sw $zero, 0($a0)
    _Stack.Init_L4:
    seq $t2, $a0, $t8
    beqz $t2, _Stack.Init_L3
    li $t2, 100
    sw $t2, -4($t8)
    sw $t8, 8($t5)
    sw $zero, 4($t5)
    la $t8, _Stack.Push._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $t5, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    li $a1, 3
    jalr $t8
    _Stack.Init_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Stack.Init._entry
_Stack.Init._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 8($v0)
    jalr $v0
    _Stack.Init._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Stack.Push
_Stack.Push:
    lw $t5, 8($a0)
    lw $t2, 4($a0)
    lw $t8, -4($t5)
    sge $a3, $t2, 0
    slt $t8, $t2, $t8
    and $a3, $a3, $t8
    beqz $a3, _Stack.Push_L3
    mul $t8, $t2, 4
    addu $t8, $t8, $t5
    sw $a1, 0($t8)
    j _Stack.Push_L4
    _Stack.Push_L3:
    la $a0, _STRING3
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _Stack.Push_L4:
    addu $t8, $t2, 1
    sw $t8, 4($a0)
    _Stack.Push_Ret:
    jr $ra

.text
.globl _Stack.Push._entry
_Stack.Push._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 12($v0)
    jalr $v0
    _Stack.Push._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Stack.Pop
_Stack.Pop:
    lw $t5, 8($a0)
    lw $t8, 4($a0)
    subu $a3, $t8, 1
    lw $t8, -4($t5)
    sge $t2, $a3, 0
    slt $t8, $a3, $t8
    and $t2, $t2, $t8
    beqz $t2, _Stack.Pop_L3
    mul $v0, $a3, 4
    addu $v0, $v0, $t5
    lw $v0, 0($v0)
    j _Stack.Pop_L4
    _Stack.Pop_L3:
    la $a0, _STRING3
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _Stack.Pop_L4:
    sw $a3, 4($a0)
    _Stack.Pop_Ret:
    jr $ra

.text
.globl _Stack.Pop._entry
_Stack.Pop._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 16($v0)
    jalr $v0
    _Stack.Pop._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Stack.NumElems
_Stack.NumElems:
    lw $v0, 4($a0)
    _Stack.NumElems_Ret:
    jr $ra

.text
.globl _Stack.NumElems._entry
_Stack.NumElems._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 20($v0)
    jalr $v0
    _Stack.NumElems._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Stack.main
_Stack.main:
    subu $sp, $sp, 24
    sw $s7, 16($sp)
    sw $ra, 20($sp)
    jal _Stack._new
    move $s7, $v0
    la $t8, _Stack.Init._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s7, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    la $t8, _Stack.Push._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s7, 4($a0)
    lw $v0, 0($a0)
    li $a1, 3
    jalr $v0
    la $t8, _Stack.Push._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s7, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    li $a1, 7
    jalr $t8
    la $t8, _Stack.Push._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s7, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    li $a1, 4
    jalr $t8
    la $t8, _Stack.NumElems._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s7, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    move $a0, $v0
    li $v0, 1
    syscall
    la $a0, _STRING4
    li $v0, 4
    syscall
    la $t8, _Stack.Pop._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s7, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    move $a0, $v0
    li $v0, 1
    syscall
    la $a0, _STRING4
    li $v0, 4
    syscall
    la $t8, _Stack.Pop._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s7, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    move $a0, $v0
    li $v0, 1
    syscall
    la $a0, _STRING4
    li $v0, 4
    syscall
    la $t8, _Stack.Pop._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s7, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    move $a0, $v0
    li $v0, 1
    syscall
    la $a0, _STRING4
    li $v0, 4
    syscall
    la $t8, _Stack.NumElems._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s7, 4($v0)
    lw $s7, 0($v0)
    move $a0, $v0
    jalr $s7
    move $a0, $v0
    li $v0, 1
    syscall
    _Stack.main_Ret:
    lw $s7, 16($sp)
    lw $ra, 20($sp)
    addu $sp, $sp, 24
    jr $ra

.text
.globl _Stack.main._entry
_Stack.main._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    jal _Stack.main
    _Stack.main._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl main
main:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    la $t8, _Stack.main._entry
    li $a0, 4
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
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