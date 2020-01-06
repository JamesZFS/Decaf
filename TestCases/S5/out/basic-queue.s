.data
.align 2
_QueueItem:
    .word 0
    .word _STRING0
    .word _QueueItem.Init
    .word _QueueItem.GetData
    .word _QueueItem.GetNext
    .word _QueueItem.GetPrev
    .word _QueueItem.SetNext
    .word _QueueItem.SetPrev
_Queue:
    .word 0
    .word _STRING1
    .word _Queue.Init
    .word _Queue.EnQueue
    .word _Queue.DeQueue
_Main:
    .word 0
    .word _STRING2

.data
_STRING0:
    .asciiz "QueueItem"
_STRING1:
    .asciiz "Queue"
_STRING2:
    .asciiz "Main"
_STRING3:
    .asciiz "Queue Is Empty"
_STRING4:
    .asciiz " "
_STRING5:
    .asciiz "\n"

.text
.globl _QueueItem._new
_QueueItem._new:
    li $a0, 16
    li $v0, 9
    syscall
    la $t8, _QueueItem
    sw $t8, 0($v0)
    sw $zero, 4($v0)
    sw $zero, 8($v0)
    sw $zero, 12($v0)
    _QueueItem._new_Ret:
    jr $ra

.text
.globl _Queue._new
_Queue._new:
    li $a0, 12
    li $v0, 9
    syscall
    la $t8, _Queue
    sw $t8, 0($v0)
    sw $zero, 4($v0)
    sw $zero, 8($v0)
    _Queue._new_Ret:
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
.globl _QueueItem.Init
_QueueItem.Init:
    sw $a1, 4($a0)
    sw $a2, 8($a0)
    sw $a0, 12($a2)
    sw $a3, 12($a0)
    sw $a0, 8($a3)
    _QueueItem.Init_Ret:
    jr $ra

.text
.globl _QueueItem.Init._entry
_QueueItem.Init._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 8($v0)
    jalr $v0
    _QueueItem.Init._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _QueueItem.GetData
_QueueItem.GetData:
    lw $v0, 4($a0)
    _QueueItem.GetData_Ret:
    jr $ra

.text
.globl _QueueItem.GetData._entry
_QueueItem.GetData._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 12($v0)
    jalr $v0
    _QueueItem.GetData._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _QueueItem.GetNext
_QueueItem.GetNext:
    lw $v0, 8($a0)
    _QueueItem.GetNext_Ret:
    jr $ra

.text
.globl _QueueItem.GetNext._entry
_QueueItem.GetNext._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 16($v0)
    jalr $v0
    _QueueItem.GetNext._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _QueueItem.GetPrev
_QueueItem.GetPrev:
    lw $v0, 12($a0)
    _QueueItem.GetPrev_Ret:
    jr $ra

.text
.globl _QueueItem.GetPrev._entry
_QueueItem.GetPrev._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 20($v0)
    jalr $v0
    _QueueItem.GetPrev._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _QueueItem.SetNext
_QueueItem.SetNext:
    sw $a1, 8($a0)
    _QueueItem.SetNext_Ret:
    jr $ra

.text
.globl _QueueItem.SetNext._entry
_QueueItem.SetNext._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 24($v0)
    jalr $v0
    _QueueItem.SetNext._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _QueueItem.SetPrev
_QueueItem.SetPrev:
    sw $a1, 12($a0)
    _QueueItem.SetPrev_Ret:
    jr $ra

.text
.globl _QueueItem.SetPrev._entry
_QueueItem.SetPrev._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 28($v0)
    jalr $v0
    _QueueItem.SetPrev._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Queue.Init
_Queue.Init:
    subu $sp, $sp, 20
    sw $a0, 20($sp)
    sw $ra, 16($sp)
    jal _QueueItem._new
    lw $t8, 20($sp)
    sw $v0, 8($t8)
    la $t8, _QueueItem.Init._entry
    lw $t5, 20($sp)
    lw $a2, 8($t5)
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $a2, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    move $a1, $zero
    move $a3, $a2
    jalr $t8
    _Queue.Init_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Queue.Init._entry
_Queue.Init._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 8($v0)
    jalr $v0
    _Queue.Init._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Queue.EnQueue
_Queue.EnQueue:
    subu $sp, $sp, 24
    sw $a0, 24($sp)
    sw $a1, 28($sp)
    sw $s7, 16($sp)
    sw $ra, 20($sp)
    jal _QueueItem._new
    move $t8, $v0
    la $t5, _QueueItem.Init._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $s7, $v0
    sw $t5, 0($s7)
    sw $t8, 4($s7)
    la $t8, _QueueItem.GetNext._entry
    lw $t5, 24($sp)
    lw $t5, 8($t5)
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $t5, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    move $a2, $v0
    lw $v0, 24($sp)
    lw $a3, 8($v0)
    lw $v0, 0($s7)
    move $a0, $s7
    lw $a1, 28($sp)
    jalr $v0
    _Queue.EnQueue_Ret:
    lw $s7, 16($sp)
    lw $ra, 20($sp)
    addu $sp, $sp, 24
    jr $ra

.text
.globl _Queue.EnQueue._entry
_Queue.EnQueue._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 12($v0)
    jalr $v0
    _Queue.EnQueue._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Queue.DeQueue
_Queue.DeQueue:
    subu $sp, $sp, 36
    sw $a0, 36($sp)
    sw $s0, 16($sp)
    sw $s3, 20($sp)
    sw $s6, 24($sp)
    sw $ra, 28($sp)
    la $t5, _QueueItem.GetPrev._entry
    lw $t8, 36($sp)
    lw $t8, 8($t8)
    li $a0, 8
    li $v0, 9
    syscall
    sw $t5, 0($v0)
    sw $t8, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    lw $t8, 36($sp)
    lw $t8, 8($t8)
    seq $t5, $v0, $t8
    beqz $t5, _Queue.DeQueue_L3
    la $a0, _STRING3
    li $v0, 4
    syscall
    li $v0, 0
    j _Queue.DeQueue_Ret
    _Queue.DeQueue_L3:
    la $t5, _QueueItem.GetPrev._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t5, 0($a0)
    sw $t8, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    sw $v0, 32($sp)
    la $t8, _QueueItem.GetData._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    lw $t8, 32($sp)
    sw $t8, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    move $s3, $v0
    la $s0, _QueueItem.SetNext._entry
    la $t8, _QueueItem.GetPrev._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 32($sp)
    sw $v0, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    move $t8, $v0
    li $a0, 8
    li $v0, 9
    syscall
    move $s6, $v0
    sw $s0, 0($s6)
    sw $t8, 4($s6)
    la $t8, _QueueItem.GetNext._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 32($sp)
    sw $v0, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    lw $t8, 0($s6)
    move $a0, $s6
    move $a1, $v0
    jalr $t8
    la $s6, _QueueItem.SetPrev._entry
    la $t8, _QueueItem.GetNext._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 32($sp)
    sw $v0, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    move $t8, $v0
    li $a0, 8
    li $v0, 9
    syscall
    move $s0, $v0
    sw $s6, 0($s0)
    sw $t8, 4($s0)
    la $t8, _QueueItem.GetPrev._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 32($sp)
    sw $v0, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    move $a1, $v0
    lw $v0, 0($s0)
    move $a0, $s0
    jalr $v0
    move $v0, $s3
    _Queue.DeQueue_Ret:
    lw $s0, 16($sp)
    lw $s3, 20($sp)
    lw $s6, 24($sp)
    lw $ra, 28($sp)
    addu $sp, $sp, 36
    jr $ra

.text
.globl _Queue.DeQueue._entry
_Queue.DeQueue._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 16($v0)
    jalr $v0
    _Queue.DeQueue._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl main
main:
    subu $sp, $sp, 28
    sw $s4, 16($sp)
    sw $s7, 20($sp)
    sw $ra, 24($sp)
    jal _Queue._new
    move $s4, $v0
    la $s7, _Queue.Init._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $s7, 0($v0)
    sw $s4, 4($v0)
    lw $s7, 0($v0)
    move $a0, $v0
    jalr $s7
    li $s7, 0
    j main_L3
    main_L2:
    la $t8, _Queue.EnQueue._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s4, 4($a0)
    lw $v0, 0($a0)
    move $a1, $s7
    jalr $v0
    addu $s7, $s7, 1
    main_L3:
    slt $t8, $s7, 10
    bnez $t8, main_L2
    li $s7, 0
    j main_L6
    main_L5:
    la $t8, _Queue.DeQueue._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s4, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    move $a0, $v0
    li $v0, 1
    syscall
    la $a0, _STRING4
    li $v0, 4
    syscall
    addu $s7, $s7, 1
    main_L6:
    slt $t8, $s7, 4
    bnez $t8, main_L5
    la $a0, _STRING5
    li $v0, 4
    syscall
    li $s7, 0
    j main_L9
    main_L8:
    la $t8, _Queue.EnQueue._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s4, 4($a0)
    lw $v0, 0($a0)
    move $a1, $s7
    jalr $v0
    addu $s7, $s7, 1
    main_L9:
    slt $t8, $s7, 10
    bnez $t8, main_L8
    li $s7, 0
    j main_L12
    main_L11:
    la $t8, _Queue.DeQueue._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s4, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    move $a0, $v0
    li $v0, 1
    syscall
    la $a0, _STRING4
    li $v0, 4
    syscall
    addu $s7, $s7, 1
    main_L12:
    slt $t8, $s7, 17
    bnez $t8, main_L11
    la $a0, _STRING5
    li $v0, 4
    syscall
    main_Ret:
    lw $s4, 16($sp)
    lw $s7, 20($sp)
    lw $ra, 24($sp)
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