.data
.align 2
_Complex:
    .word 0
    .word _STRING0
    .word _Complex.abs2
_Main:
    .word _Complex
    .word _STRING1
    .word _Complex.abs2

.data
_STRING0:
    .asciiz "Complex"
_STRING1:
    .asciiz "Main"
_STRING2:
    .asciiz "Decaf runtime error: Division by zero error"
_STRING3:
    .asciiz "Decaf runtime error: Cannot create negative-sized array\n"
_STRING4:
    .asciiz "Decaf runtime error: Array subscript out of bounds\n"
_STRING5:
    .asciiz "**"
_STRING6:
    .asciiz "  "
_STRING7:
    .asciiz "\n"

.text
.globl _Complex._new
_Complex._new:
    li $a0, 12
    li $v0, 9
    syscall
    la $t8, _Complex
    sw $t8, 0($v0)
    sw $zero, 4($v0)
    sw $zero, 8($v0)
    _Complex._new_Ret:
    jr $ra

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
.globl _Complex.make
_Complex.make:
    subu $sp, $sp, 20
    sw $a0, 20($sp)
    sw $a1, 24($sp)
    sw $ra, 16($sp)
    jal _Complex._new
    lw $t8, 20($sp)
    rem $t8, $t8, 32768
    sw $t8, 4($v0)
    lw $t8, 24($sp)
    rem $t8, $t8, 32768
    sw $t8, 8($v0)
    _Complex.make_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Complex.make._entry
_Complex.make._entry:
    subu $sp, $sp, 20
    move $a0, $a1
    move $a1, $a2
    sw $ra, 16($sp)
    jal _Complex.make
    _Complex.make._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Complex.add
_Complex.add:
    subu $sp, $sp, 20
    move $t8, $a0
    sw $ra, 16($sp)
    la $t5, _Complex.make._entry
    li $a0, 4
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t5, 0($a0)
    lw $v0, 4($t8)
    lw $t5, 4($a1)
    addu $v0, $v0, $t5
    lw $t8, 8($t8)
    lw $t5, 8($a1)
    addu $a2, $t8, $t5
    lw $t8, 0($a0)
    move $a1, $v0
    jalr $t8
    _Complex.add_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Complex.add._entry
_Complex.add._entry:
    subu $sp, $sp, 20
    move $a0, $a1
    move $a1, $a2
    sw $ra, 16($sp)
    jal _Complex.add
    _Complex.add._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Complex.sub
_Complex.sub:
    subu $sp, $sp, 20
    move $t8, $a0
    sw $ra, 16($sp)
    la $t5, _Complex.make._entry
    li $a0, 4
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t5, 0($a0)
    lw $v0, 4($t8)
    lw $t5, 4($a1)
    subu $v0, $v0, $t5
    lw $t8, 8($t8)
    lw $t5, 8($a1)
    subu $a2, $t8, $t5
    lw $t8, 0($a0)
    move $a1, $v0
    jalr $t8
    _Complex.sub_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Complex.sub._entry
_Complex.sub._entry:
    subu $sp, $sp, 20
    move $a0, $a1
    move $a1, $a2
    sw $ra, 16($sp)
    jal _Complex.sub
    _Complex.sub._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Complex.mul
_Complex.mul:
    subu $sp, $sp, 20
    move $t8, $a0
    sw $ra, 16($sp)
    la $t5, _Complex.make._entry
    li $a0, 4
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t5, 0($a0)
    lw $ra, 4($t8)
    lw $t7, 4($a1)
    mul $v0, $ra, $t7
    lw $t2, 8($t8)
    lw $t5, 8($a1)
    mul $t8, $t2, $t5
    subu $v0, $v0, $t8
    div $a1, $v0, 4096
    mul $v0, $ra, $t5
    mul $t8, $t2, $t7
    addu $v0, $v0, $t8
    div $a2, $v0, 4096
    lw $v0, 0($a0)
    jalr $v0
    _Complex.mul_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Complex.mul._entry
_Complex.mul._entry:
    subu $sp, $sp, 20
    move $a0, $a1
    move $a1, $a2
    sw $ra, 16($sp)
    jal _Complex.mul
    _Complex.mul._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Complex.abs2
_Complex.abs2:
    lw $v0, 4($a0)
    mul $v0, $v0, $v0
    lw $t8, 8($a0)
    mul $t8, $t8, $t8
    addu $v0, $v0, $t8
    _Complex.abs2_Ret:
    jr $ra

.text
.globl _Complex.abs2._entry
_Complex.abs2._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 8($v0)
    jalr $v0
    _Complex.abs2._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl main
main:
    subu $sp, $sp, 88
    sw $s1, 16($sp)
    sw $s2, 20($sp)
    sw $s3, 24($sp)
    sw $s4, 28($sp)
    sw $s7, 32($sp)
    sw $fp, 36($sp)
    sw $ra, 40($sp)
    li $a0, 136
    li $v0, 9
    syscall
    move $s1, $v0
    addu $s4, $s1, 136
    addu $s1, $s1, 4
    j main_L5
    main_L4:
    subu $s4, $s4, 4
    sw $zero, 0($s4)
    main_L5:
    seq $s7, $s4, $s1
    beqz $s7, main_L4
    li $s7, 33
    sw $s7, -4($s1)
    li $a0, 136
    li $v0, 9
    syscall
    sw $v0, 44($sp)
    lw $s7, 44($sp)
    addu $s4, $s7, 136
    lw $s7, 44($sp)
    addu $s7, $s7, 4
    sw $s7, 44($sp)
    j main_L9
    main_L8:
    subu $s4, $s4, 4
    sw $zero, 0($s4)
    main_L9:
    lw $s7, 44($sp)
    seq $s7, $s4, $s7
    beqz $s7, main_L8
    li $s4, 33
    lw $s7, 44($sp)
    sw $s4, -4($s7)
    li $s4, 0
    j main_L41
    main_L11:
    li $a0, 136
    li $v0, 9
    syscall
    move $s7, $v0
    addu $t5, $s7, 136
    addu $s7, $s7, 4
    j main_L14
    main_L13:
    subu $t5, $t5, 4
    sw $zero, 0($t5)
    main_L14:
    seq $t8, $t5, $s7
    beqz $t8, main_L13
    li $t8, 33
    sw $t8, -4($s7)
    lw $t8, -4($s1)
    sge $t5, $s4, 0
    slt $t8, $s4, $t8
    and $t8, $t5, $t8
    sw $t8, 48($sp)
    lw $t8, 48($sp)
    beqz $t8, main_L17
    mul $ra, $s4, 4
    addu $t8, $ra, $s1
    sw $t8, 52($sp)
    lw $t8, 52($sp)
    sw $s7, 0($t8)
    j main_L18
    main_L17:
    la $a0, _STRING4
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L18:
    li $a0, 136
    li $v0, 9
    syscall
    move $s7, $v0
    addu $t2, $s7, 136
    addu $s7, $s7, 4
    j main_L21
    main_L20:
    subu $t2, $t2, 4
    sw $zero, 0($t2)
    main_L21:
    seq $t8, $t2, $s7
    beqz $t8, main_L20
    li $t8, 33
    sw $t8, -4($s7)
    lw $t8, 44($sp)
    lw $t8, -4($t8)
    slt $t8, $s4, $t8
    and $fp, $t5, $t8
    beqz $fp, main_L24
    lw $t8, 44($sp)
    addu $s3, $ra, $t8
    sw $s7, 0($s3)
    j main_L25
    main_L24:
    la $a0, _STRING4
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L25:
    li $s7, 0
    j main_L39
    main_L26:
    la $t8, _Complex.make._entry
    li $a0, 4
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    mul $t8, $s7, 512
    addu $a1, $t8, -8192
    mul $t8, $s4, 512
    addu $a2, $t8, -8192
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    lw $t8, 48($sp)
    beqz $t8, main_L28
    lw $t8, 52($sp)
    lw $t2, 0($t8)
    j main_L29
    main_L28:
    la $a0, _STRING4
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L29:
    lw $t5, -4($t2)
    sge $t8, $s7, 0
    sw $t8, 56($sp)
    slt $t8, $s7, $t5
    lw $t5, 56($sp)
    and $t8, $t5, $t8
    beqz $t8, main_L31
    mul $s2, $s7, 4
    addu $t8, $s2, $t2
    sw $v0, 0($t8)
    j main_L32
    main_L31:
    la $a0, _STRING4
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L32:
    jal _Complex._new
    beqz $fp, main_L34
    lw $t5, 0($s3)
    j main_L35
    main_L34:
    la $a0, _STRING4
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L35:
    lw $t8, -4($t5)
    slt $t8, $s7, $t8
    lw $t2, 56($sp)
    and $t8, $t2, $t8
    beqz $t8, main_L37
    addu $t8, $s2, $t5
    sw $v0, 0($t8)
    j main_L38
    main_L37:
    la $a0, _STRING4
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L38:
    addu $s7, $s7, 1
    main_L39:
    slt $t8, $s7, 33
    bnez $t8, main_L26
    addu $s7, $s4, 1
    move $s4, $s7
    main_L41:
    slt $s7, $s4, 33
    bnez $s7, main_L11
    li $s4, 0
    j main_L69
    main_L43:
    li $s7, 0
    j main_L67
    main_L44:
    li $t8, 0
    sw $t8, 60($sp)
    j main_L65
    main_L45:
    lw $t8, 44($sp)
    lw $t8, -4($t8)
    sge $s3, $s7, 0
    slt $t8, $s7, $t8
    and $fp, $s3, $t8
    beqz $fp, main_L47
    mul $t8, $s7, 4
    sw $t8, 64($sp)
    lw $t5, 64($sp)
    lw $t8, 44($sp)
    addu $t8, $t5, $t8
    lw $t2, 0($t8)
    j main_L48
    main_L47:
    la $a0, _STRING4
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L48:
    lw $t5, -4($t2)
    lw $t8, 60($sp)
    sge $t8, $t8, 0
    sw $t8, 68($sp)
    lw $t8, 60($sp)
    slt $t8, $t8, $t5
    lw $t5, 68($sp)
    and $s2, $t5, $t8
    beqz $s2, main_L50
    lw $t8, 60($sp)
    mul $t8, $t8, 4
    sw $t8, 72($sp)
    lw $t8, 72($sp)
    addu $t8, $t8, $t2
    sw $t8, 76($sp)
    lw $t8, 76($sp)
    lw $t8, 0($t8)
    sw $t8, 80($sp)
    j main_L51
    main_L50:
    la $a0, _STRING4
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L51:
    la $t8, _Complex.abs2._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    lw $t8, 80($sp)
    sw $t8, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    slt $t8, $v0, 67108864
    beqz $t8, main_L64
    la $t5, _Complex.add._entry
    li $a0, 4
    li $v0, 9
    syscall
    sw $v0, 84($sp)
    lw $t8, 84($sp)
    sw $t5, 0($t8)
    la $t8, _Complex.mul._entry
    li $a0, 4
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    lw $v0, 0($a0)
    lw $a1, 80($sp)
    lw $a2, 80($sp)
    jalr $v0
    lw $t8, -4($s1)
    slt $t8, $s7, $t8
    and $t8, $s3, $t8
    beqz $t8, main_L54
    lw $t8, 64($sp)
    addu $t8, $t8, $s1
    lw $t2, 0($t8)
    j main_L55
    main_L54:
    la $a0, _STRING4
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L55:
    lw $t8, -4($t2)
    lw $t5, 60($sp)
    slt $t5, $t5, $t8
    lw $t8, 68($sp)
    and $t8, $t8, $t5
    beqz $t8, main_L57
    lw $t8, 72($sp)
    addu $t8, $t8, $t2
    lw $a2, 0($t8)
    j main_L58
    main_L57:
    la $a0, _STRING4
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L58:
    lw $t8, 84($sp)
    lw $t8, 0($t8)
    lw $a0, 84($sp)
    move $a1, $v0
    jalr $t8
    beqz $fp, main_L60
    j main_L61
    main_L60:
    la $a0, _STRING4
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L61:
    beqz $s2, main_L63
    lw $t8, 76($sp)
    sw $v0, 0($t8)
    j main_L64
    main_L63:
    la $a0, _STRING4
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L64:
    lw $t8, 60($sp)
    addu $t8, $t8, 1
    sw $t8, 60($sp)
    main_L65:
    lw $t8, 60($sp)
    slt $t8, $t8, 33
    bnez $t8, main_L45
    addu $s7, $s7, 1
    main_L67:
    slt $t8, $s7, 33
    bnez $t8, main_L44
    addu $s7, $s4, 1
    move $s4, $s7
    main_L69:
    slt $s7, $s4, 20
    bnez $s7, main_L43
    li $s4, 0
    j main_L84
    main_L71:
    li $s7, 0
    j main_L82
    main_L72:
    la $s1, _Complex.abs2._entry
    lw $t8, 44($sp)
    lw $t8, -4($t8)
    sge $t5, $s4, 0
    slt $t8, $s4, $t8
    and $t5, $t5, $t8
    beqz $t5, main_L74
    mul $t5, $s4, 4
    lw $t8, 44($sp)
    addu $t5, $t5, $t8
    lw $t8, 0($t5)
    j main_L75
    main_L74:
    la $a0, _STRING4
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L75:
    lw $t5, -4($t8)
    sge $t2, $s7, 0
    slt $t5, $s7, $t5
    and $t2, $t2, $t5
    beqz $t2, main_L77
    mul $t5, $s7, 4
    addu $t5, $t5, $t8
    lw $t8, 0($t5)
    j main_L78
    main_L77:
    la $a0, _STRING4
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L78:
    li $a0, 8
    li $v0, 9
    syscall
    sw $s1, 0($v0)
    sw $t8, 4($v0)
    lw $s1, 0($v0)
    move $a0, $v0
    jalr $s1
    slt $s1, $v0, 67108864
    beqz $s1, main_L80
    la $a0, _STRING5
    li $v0, 4
    syscall
    j main_L81
    main_L80:
    la $a0, _STRING6
    li $v0, 4
    syscall
    main_L81:
    addu $s7, $s7, 1
    main_L82:
    slt $s1, $s7, 33
    bnez $s1, main_L72
    la $a0, _STRING7
    li $v0, 4
    syscall
    addu $s7, $s4, 1
    move $s4, $s7
    main_L84:
    slt $s7, $s4, 33
    bnez $s7, main_L71
    main_Ret:
    lw $s1, 16($sp)
    lw $s2, 20($sp)
    lw $s3, 24($sp)
    lw $s4, 28($sp)
    lw $s7, 32($sp)
    lw $fp, 36($sp)
    lw $ra, 40($sp)
    addu $sp, $sp, 88
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