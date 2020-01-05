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
    li $t2, 16
    sw $t2, 40($sp)
    lw $t0, 40($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 44($sp)
    la $t2, _QueueItem
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
    lw $t0, 44($sp)
    move $v0, $t0
    _QueueItem._new_Ret:
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
.globl _Queue._new
_Queue._new:
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
    li $t2, 12
    sw $t2, 40($sp)
    lw $t0, 40($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 44($sp)
    la $t2, _Queue
    sw $t2, 48($sp)
    lw $t0, 48($sp)
    lw $t1, 44($sp)
    sw $t0, 0($t1)
    lw $t1, 44($sp)
    sw $zero, 4($t1)
    lw $t1, 44($sp)
    sw $zero, 8($t1)
    lw $t0, 44($sp)
    move $v0, $t0
    _Queue._new_Ret:
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
.globl _QueueItem.Init
_QueueItem.Init:
    subu $sp, $sp, 40
    move $t2, $a0
    sw $t2, 40($sp)
    move $t2, $a1
    sw $t2, 44($sp)
    move $t2, $a2
    sw $t2, 48($sp)
    move $t2, $a3
    sw $t2, 52($sp)
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
    lw $t0, 44($sp)
    lw $t1, 40($sp)
    sw $t0, 4($t1)
    lw $t0, 48($sp)
    lw $t1, 40($sp)
    sw $t0, 8($t1)
    lw $t0, 40($sp)
    lw $t1, 48($sp)
    sw $t0, 12($t1)
    lw $t0, 52($sp)
    lw $t1, 40($sp)
    sw $t0, 12($t1)
    lw $t0, 40($sp)
    lw $t1, 52($sp)
    sw $t0, 8($t1)
    _QueueItem.Init_Ret:
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
.globl _QueueItem.Init._entry
_QueueItem.Init._entry:
    subu $sp, $sp, 64
    move $t2, $a0
    sw $t2, 64($sp)
    move $t2, $a1
    sw $t2, 68($sp)
    move $t2, $a2
    sw $t2, 72($sp)
    move $t2, $a3
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
    lw $t0, 76($sp)
    move $a3, $t0
    lw $t0, 60($sp)
    jalr $t0
    _QueueItem.Init._entry_Ret:
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
.globl _QueueItem.GetData
_QueueItem.GetData:
    subu $sp, $sp, 44
    move $t2, $a0
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
    lw $t0, 44($sp)
    lw $t2, 4($t0)
    sw $t2, 40($sp)
    lw $t0, 40($sp)
    move $v0, $t0
    _QueueItem.GetData_Ret:
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
.globl _QueueItem.GetData._entry
_QueueItem.GetData._entry:
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
    lw $t2, 12($t0)
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    lw $t0, 60($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    move $v0, $t0
    _QueueItem.GetData._entry_Ret:
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
.globl _QueueItem.GetNext
_QueueItem.GetNext:
    subu $sp, $sp, 44
    move $t2, $a0
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
    lw $t0, 44($sp)
    lw $t2, 8($t0)
    sw $t2, 40($sp)
    lw $t0, 40($sp)
    move $v0, $t0
    _QueueItem.GetNext_Ret:
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
.globl _QueueItem.GetNext._entry
_QueueItem.GetNext._entry:
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
    lw $t2, 16($t0)
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    lw $t0, 60($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    move $v0, $t0
    _QueueItem.GetNext._entry_Ret:
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
.globl _QueueItem.GetPrev
_QueueItem.GetPrev:
    subu $sp, $sp, 44
    move $t2, $a0
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
    lw $t0, 44($sp)
    lw $t2, 12($t0)
    sw $t2, 40($sp)
    lw $t0, 40($sp)
    move $v0, $t0
    _QueueItem.GetPrev_Ret:
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
.globl _QueueItem.GetPrev._entry
_QueueItem.GetPrev._entry:
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
    lw $t2, 20($t0)
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    lw $t0, 60($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    move $v0, $t0
    _QueueItem.GetPrev._entry_Ret:
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
.globl _QueueItem.SetNext
_QueueItem.SetNext:
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
    lw $t0, 44($sp)
    lw $t1, 40($sp)
    sw $t0, 8($t1)
    _QueueItem.SetNext_Ret:
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
.globl _QueueItem.SetNext._entry
_QueueItem.SetNext._entry:
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
    _QueueItem.SetNext._entry_Ret:
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
.globl _QueueItem.SetPrev
_QueueItem.SetPrev:
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
    lw $t0, 44($sp)
    lw $t1, 40($sp)
    sw $t0, 12($t1)
    _QueueItem.SetPrev_Ret:
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
.globl _QueueItem.SetPrev._entry
_QueueItem.SetPrev._entry:
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
    _QueueItem.SetPrev._entry_Ret:
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
.globl _Queue.Init
_Queue.Init:
    subu $sp, $sp, 80
    move $t2, $a0
    sw $t2, 80($sp)
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
    jal _QueueItem._new
    move $t2, $v0
    sw $t2, 56($sp)
    lw $t0, 56($sp)
    lw $t1, 80($sp)
    sw $t0, 8($t1)
    la $t2, _QueueItem.Init._entry
    sw $t2, 60($sp)
    lw $t0, 80($sp)
    lw $t2, 8($t0)
    sw $t2, 64($sp)
    li $t2, 8
    sw $t2, 68($sp)
    lw $t0, 68($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 72($sp)
    lw $t0, 60($sp)
    lw $t1, 72($sp)
    sw $t0, 0($t1)
    lw $t0, 64($sp)
    lw $t1, 72($sp)
    sw $t0, 4($t1)
    lw $t0, 72($sp)
    lw $t2, 0($t0)
    sw $t2, 76($sp)
    lw $t0, 72($sp)
    move $a0, $t0
    move $a1, $zero
    lw $t0, 64($sp)
    move $a2, $t0
    lw $t0, 64($sp)
    move $a3, $t0
    lw $t0, 76($sp)
    jalr $t0
    _Queue.Init_Ret:
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
    addu $sp, $sp, 80
    jr $ra

.text
.globl _Queue.Init._entry
_Queue.Init._entry:
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
    lw $t2, 8($t0)
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    lw $t0, 60($sp)
    jalr $t0
    _Queue.Init._entry_Ret:
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
.globl _Queue.EnQueue
_Queue.EnQueue:
    subu $sp, $sp, 104
    move $t2, $a0
    sw $t2, 104($sp)
    move $t2, $a1
    sw $t2, 108($sp)
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
    jal _QueueItem._new
    move $t2, $v0
    sw $t2, 56($sp)
    la $t2, _QueueItem.Init._entry
    sw $t2, 60($sp)
    li $t2, 8
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
    lw $t0, 56($sp)
    lw $t1, 68($sp)
    sw $t0, 4($t1)
    la $t2, _QueueItem.GetNext._entry
    sw $t2, 72($sp)
    lw $t0, 104($sp)
    lw $t2, 8($t0)
    sw $t2, 76($sp)
    li $t2, 8
    sw $t2, 80($sp)
    lw $t0, 80($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 84($sp)
    lw $t0, 72($sp)
    lw $t1, 84($sp)
    sw $t0, 0($t1)
    lw $t0, 76($sp)
    lw $t1, 84($sp)
    sw $t0, 4($t1)
    lw $t0, 84($sp)
    lw $t2, 0($t0)
    sw $t2, 88($sp)
    lw $t0, 84($sp)
    move $a0, $t0
    lw $t0, 88($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 92($sp)
    lw $t0, 104($sp)
    lw $t2, 8($t0)
    sw $t2, 96($sp)
    lw $t0, 68($sp)
    lw $t2, 0($t0)
    sw $t2, 100($sp)
    lw $t0, 68($sp)
    move $a0, $t0
    lw $t0, 108($sp)
    move $a1, $t0
    lw $t0, 92($sp)
    move $a2, $t0
    lw $t0, 96($sp)
    move $a3, $t0
    lw $t0, 100($sp)
    jalr $t0
    _Queue.EnQueue_Ret:
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
    addu $sp, $sp, 104
    jr $ra

.text
.globl _Queue.EnQueue._entry
_Queue.EnQueue._entry:
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
    _Queue.EnQueue._entry_Ret:
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
.globl _Queue.DeQueue
_Queue.DeQueue:
    subu $sp, $sp, 244
    move $t2, $a0
    sw $t2, 244($sp)
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
    la $t2, _QueueItem.GetPrev._entry
    sw $t2, 56($sp)
    lw $t0, 244($sp)
    lw $t2, 8($t0)
    sw $t2, 60($sp)
    li $t2, 8
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 68($sp)
    lw $t0, 56($sp)
    lw $t1, 68($sp)
    sw $t0, 0($t1)
    lw $t0, 60($sp)
    lw $t1, 68($sp)
    sw $t0, 4($t1)
    lw $t0, 68($sp)
    lw $t2, 0($t0)
    sw $t2, 72($sp)
    lw $t0, 68($sp)
    move $a0, $t0
    lw $t0, 72($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 76($sp)
    lw $t0, 244($sp)
    lw $t2, 8($t0)
    sw $t2, 80($sp)
    lw $t0, 76($sp)
    lw $t1, 80($sp)
    seq $t2, $t0, $t1
    sw $t2, 84($sp)
    lw $t0, 84($sp)
    beqz $t0, _Queue.DeQueue_L3
    la $t2, _STRING3
    sw $t2, 88($sp)
    lw $t0, 88($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $v0, 0
    j _Queue.DeQueue_Ret
    _Queue.DeQueue_L3:
    la $t2, _QueueItem.GetPrev._entry
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
    lw $t0, 80($sp)
    lw $t1, 100($sp)
    sw $t0, 4($t1)
    lw $t0, 100($sp)
    lw $t2, 0($t0)
    sw $t2, 104($sp)
    lw $t0, 100($sp)
    move $a0, $t0
    lw $t0, 104($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 108($sp)
    la $t2, _QueueItem.GetData._entry
    sw $t2, 112($sp)
    li $t2, 8
    sw $t2, 116($sp)
    lw $t0, 116($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 120($sp)
    lw $t0, 112($sp)
    lw $t1, 120($sp)
    sw $t0, 0($t1)
    lw $t0, 108($sp)
    lw $t1, 120($sp)
    sw $t0, 4($t1)
    lw $t0, 120($sp)
    lw $t2, 0($t0)
    sw $t2, 124($sp)
    lw $t0, 120($sp)
    move $a0, $t0
    lw $t0, 124($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 128($sp)
    la $t2, _QueueItem.SetNext._entry
    sw $t2, 132($sp)
    la $t2, _QueueItem.GetPrev._entry
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
    lw $t0, 108($sp)
    lw $t1, 144($sp)
    sw $t0, 4($t1)
    lw $t0, 144($sp)
    lw $t2, 0($t0)
    sw $t2, 148($sp)
    lw $t0, 144($sp)
    move $a0, $t0
    lw $t0, 148($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 152($sp)
    li $t2, 8
    sw $t2, 156($sp)
    lw $t0, 156($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 160($sp)
    lw $t0, 132($sp)
    lw $t1, 160($sp)
    sw $t0, 0($t1)
    lw $t0, 152($sp)
    lw $t1, 160($sp)
    sw $t0, 4($t1)
    la $t2, _QueueItem.GetNext._entry
    sw $t2, 164($sp)
    li $t2, 8
    sw $t2, 168($sp)
    lw $t0, 168($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 172($sp)
    lw $t0, 164($sp)
    lw $t1, 172($sp)
    sw $t0, 0($t1)
    lw $t0, 108($sp)
    lw $t1, 172($sp)
    sw $t0, 4($t1)
    lw $t0, 172($sp)
    lw $t2, 0($t0)
    sw $t2, 176($sp)
    lw $t0, 172($sp)
    move $a0, $t0
    lw $t0, 176($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 180($sp)
    lw $t0, 160($sp)
    lw $t2, 0($t0)
    sw $t2, 184($sp)
    lw $t0, 160($sp)
    move $a0, $t0
    lw $t0, 180($sp)
    move $a1, $t0
    lw $t0, 184($sp)
    jalr $t0
    la $t2, _QueueItem.SetPrev._entry
    sw $t2, 188($sp)
    la $t2, _QueueItem.GetNext._entry
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
    lw $t0, 108($sp)
    lw $t1, 200($sp)
    sw $t0, 4($t1)
    lw $t0, 200($sp)
    lw $t2, 0($t0)
    sw $t2, 204($sp)
    lw $t0, 200($sp)
    move $a0, $t0
    lw $t0, 204($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 208($sp)
    li $t2, 8
    sw $t2, 212($sp)
    lw $t0, 212($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 216($sp)
    lw $t0, 188($sp)
    lw $t1, 216($sp)
    sw $t0, 0($t1)
    lw $t0, 208($sp)
    lw $t1, 216($sp)
    sw $t0, 4($t1)
    la $t2, _QueueItem.GetPrev._entry
    sw $t2, 220($sp)
    li $t2, 8
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
    lw $t0, 108($sp)
    lw $t1, 228($sp)
    sw $t0, 4($t1)
    lw $t0, 228($sp)
    lw $t2, 0($t0)
    sw $t2, 232($sp)
    lw $t0, 228($sp)
    move $a0, $t0
    lw $t0, 232($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 236($sp)
    lw $t0, 216($sp)
    lw $t2, 0($t0)
    sw $t2, 240($sp)
    lw $t0, 216($sp)
    move $a0, $t0
    lw $t0, 236($sp)
    move $a1, $t0
    lw $t0, 240($sp)
    jalr $t0
    lw $t0, 128($sp)
    move $v0, $t0
    _Queue.DeQueue_Ret:
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
    addu $sp, $sp, 244
    jr $ra

.text
.globl _Queue.DeQueue._entry
_Queue.DeQueue._entry:
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
    lw $t2, 16($t0)
    sw $t2, 60($sp)
    lw $t0, 56($sp)
    move $a0, $t0
    lw $t0, 60($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 64($sp)
    lw $t0, 64($sp)
    move $v0, $t0
    _Queue.DeQueue._entry_Ret:
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
.globl main
main:
    subu $sp, $sp, 200
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
    jal _Queue._new
    move $t2, $v0
    sw $t2, 56($sp)
    la $t2, _Queue.Init._entry
    sw $t2, 60($sp)
    li $t2, 8
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
    lw $t0, 56($sp)
    lw $t1, 68($sp)
    sw $t0, 4($t1)
    lw $t0, 68($sp)
    lw $t2, 0($t0)
    sw $t2, 72($sp)
    lw $t0, 68($sp)
    move $a0, $t0
    lw $t0, 72($sp)
    jalr $t0
    li $t2, 0
    sw $t2, 76($sp)
    j main_L3
    main_L2:
    la $t2, _Queue.EnQueue._entry
    sw $t2, 80($sp)
    li $t2, 8
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
    lw $t0, 56($sp)
    lw $t1, 88($sp)
    sw $t0, 4($t1)
    lw $t0, 88($sp)
    lw $t2, 0($t0)
    sw $t2, 92($sp)
    lw $t0, 88($sp)
    move $a0, $t0
    lw $t0, 76($sp)
    move $a1, $t0
    lw $t0, 92($sp)
    jalr $t0
    lw $t0, 76($sp)
    addu $t2, $t0, 1
    sw $t2, 96($sp)
    lw $t0, 96($sp)
    move $t2, $t0
    sw $t2, 76($sp)
    main_L3:
    lw $t0, 76($sp)
    slt $t2, $t0, 10
    sw $t2, 100($sp)
    lw $t0, 100($sp)
    bnez $t0, main_L2
    li $t2, 0
    sw $t2, 76($sp)
    j main_L6
    main_L5:
    la $t2, _Queue.DeQueue._entry
    sw $t2, 104($sp)
    li $t2, 8
    sw $t2, 108($sp)
    lw $t0, 108($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 112($sp)
    lw $t0, 104($sp)
    lw $t1, 112($sp)
    sw $t0, 0($t1)
    lw $t0, 56($sp)
    lw $t1, 112($sp)
    sw $t0, 4($t1)
    lw $t0, 112($sp)
    lw $t2, 0($t0)
    sw $t2, 116($sp)
    lw $t0, 112($sp)
    move $a0, $t0
    lw $t0, 116($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 120($sp)
    lw $t0, 120($sp)
    move $a0, $t0
    li $v0, 1
    syscall
    la $t2, _STRING4
    sw $t2, 124($sp)
    lw $t0, 124($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    lw $t0, 76($sp)
    addu $t2, $t0, 1
    sw $t2, 128($sp)
    lw $t0, 128($sp)
    move $t2, $t0
    sw $t2, 76($sp)
    main_L6:
    lw $t0, 76($sp)
    slt $t2, $t0, 4
    sw $t2, 132($sp)
    lw $t0, 132($sp)
    bnez $t0, main_L5
    la $t2, _STRING5
    sw $t2, 136($sp)
    lw $t0, 136($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    li $t2, 0
    sw $t2, 76($sp)
    j main_L9
    main_L8:
    la $t2, _Queue.EnQueue._entry
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
    lw $t0, 56($sp)
    lw $t1, 148($sp)
    sw $t0, 4($t1)
    lw $t0, 148($sp)
    lw $t2, 0($t0)
    sw $t2, 152($sp)
    lw $t0, 148($sp)
    move $a0, $t0
    lw $t0, 76($sp)
    move $a1, $t0
    lw $t0, 152($sp)
    jalr $t0
    lw $t0, 76($sp)
    addu $t2, $t0, 1
    sw $t2, 156($sp)
    lw $t0, 156($sp)
    move $t2, $t0
    sw $t2, 76($sp)
    main_L9:
    lw $t0, 76($sp)
    slt $t2, $t0, 10
    sw $t2, 160($sp)
    lw $t0, 160($sp)
    bnez $t0, main_L8
    li $t2, 0
    sw $t2, 76($sp)
    j main_L12
    main_L11:
    la $t2, _Queue.DeQueue._entry
    sw $t2, 164($sp)
    li $t2, 8
    sw $t2, 168($sp)
    lw $t0, 168($sp)
    move $a0, $t0
    li $v0, 9
    syscall
    move $t2, $v0
    sw $t2, 172($sp)
    lw $t0, 164($sp)
    lw $t1, 172($sp)
    sw $t0, 0($t1)
    lw $t0, 56($sp)
    lw $t1, 172($sp)
    sw $t0, 4($t1)
    lw $t0, 172($sp)
    lw $t2, 0($t0)
    sw $t2, 176($sp)
    lw $t0, 172($sp)
    move $a0, $t0
    lw $t0, 176($sp)
    jalr $t0
    move $t2, $v0
    sw $t2, 180($sp)
    lw $t0, 180($sp)
    move $a0, $t0
    li $v0, 1
    syscall
    la $t2, _STRING4
    sw $t2, 184($sp)
    lw $t0, 184($sp)
    move $a0, $t0
    li $v0, 4
    syscall
    lw $t0, 76($sp)
    addu $t2, $t0, 1
    sw $t2, 188($sp)
    lw $t0, 188($sp)
    move $t2, $t0
    sw $t2, 76($sp)
    main_L12:
    lw $t0, 76($sp)
    slt $t2, $t0, 17
    sw $t2, 192($sp)
    lw $t0, 192($sp)
    bnez $t0, main_L11
    la $t2, _STRING5
    sw $t2, 196($sp)
    lw $t0, 196($sp)
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
    addu $sp, $sp, 200
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