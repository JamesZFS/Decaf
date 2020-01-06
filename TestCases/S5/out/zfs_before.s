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

.text
.globl _Main._new
_Main._new:
    move _R34, $s0
    move _R35, $s1
    move _R36, $s2
    move _R37, $s3
    move _R38, $s4
    move _R39, $s5
    move _R40, $s6
    move _R41, $s7
    move _R42, $fp
    move _R43, $ra
    li _R44, 4
    move $a0, _R44
    li $v0, 9
    syscall
    move _R32, $v0
    la _R33, _Main
    sw _R33, 0(_R32)
    move $v0, _R32
    _Main._new_Ret:
    move $s0, _R34
    move $s1, _R35
    move $s2, _R36
    move $s3, _R37
    move $s4, _R38
    move $s5, _R39
    move $s6, _R40
    move $s7, _R41
    move $fp, _R42
    move $ra, _R43
    jr $ra

.text
.globl length
length:
    move _R32, $a0
    move _R33, $a1
    move _R34, $s0
    move _R35, $s1
    move _R36, $s2
    move _R37, $s3
    move _R38, $s4
    move _R39, $s5
    move _R40, $s6
    move _R41, $s7
    move _R42, $fp
    move _R43, $ra
    lw _R33, 4(_R32)
    lw _R33, -4(_R33)
    move $v0, _R33
    length_Ret:
    move $s0, _R34
    move $s1, _R35
    move $s2, _R36
    move $s3, _R37
    move $s4, _R38
    move $s5, _R39
    move $s6, _R40
    move $s7, _R41
    move $fp, _R42
    move $ra, _R43
    jr $ra

.text
.globl main
main:
    move _R62, $s0
    move _R63, $s1
    move _R64, $s2
    move _R65, $s3
    move _R66, $s4
    move _R67, $s5
    move _R68, $s6
    move _R69, $s7
    move _R70, $fp
    move _R71, $ra
    li _R32, 0
    li _R33, 1
    li _R34, 2
    li _R35, 3
    li _R36, 4
    li _R37, 5
    li _R38, 6
    li _R39, 7
    li _R40, 8
    li _R41, 9
    la _R42, _STRING1
    move $a0, _R42
    li $v0, 4
    syscall
    move $a0, _R32
    li $v0, 1
    syscall
    la _R43, _STRING2
    move $a0, _R43
    li $v0, 4
    syscall
    la _R44, _STRING3
    move $a0, _R44
    li $v0, 4
    syscall
    move $a0, _R33
    li $v0, 1
    syscall
    la _R45, _STRING2
    move $a0, _R45
    li $v0, 4
    syscall
    la _R46, _STRING4
    move $a0, _R46
    li $v0, 4
    syscall
    move $a0, _R34
    li $v0, 1
    syscall
    la _R47, _STRING2
    move $a0, _R47
    li $v0, 4
    syscall
    la _R48, _STRING5
    move $a0, _R48
    li $v0, 4
    syscall
    move $a0, _R35
    li $v0, 1
    syscall
    la _R49, _STRING2
    move $a0, _R49
    li $v0, 4
    syscall
    la _R50, _STRING6
    move $a0, _R50
    li $v0, 4
    syscall
    move $a0, _R36
    li $v0, 1
    syscall
    la _R51, _STRING2
    move $a0, _R51
    li $v0, 4
    syscall
    la _R52, _STRING7
    move $a0, _R52
    li $v0, 4
    syscall
    move $a0, _R37
    li $v0, 1
    syscall
    la _R53, _STRING2
    move $a0, _R53
    li $v0, 4
    syscall
    la _R54, _STRING8
    move $a0, _R54
    li $v0, 4
    syscall
    move $a0, _R38
    li $v0, 1
    syscall
    la _R55, _STRING2
    move $a0, _R55
    li $v0, 4
    syscall
    la _R56, _STRING9
    move $a0, _R56
    li $v0, 4
    syscall
    move $a0, _R39
    li $v0, 1
    syscall
    la _R57, _STRING2
    move $a0, _R57
    li $v0, 4
    syscall
    la _R58, _STRING10
    move $a0, _R58
    li $v0, 4
    syscall
    move $a0, _R40
    li $v0, 1
    syscall
    la _R59, _STRING2
    move $a0, _R59
    li $v0, 4
    syscall
    la _R60, _STRING11
    move $a0, _R60
    li $v0, 4
    syscall
    move $a0, _R41
    li $v0, 1
    syscall
    la _R61, _STRING2
    move $a0, _R61
    li $v0, 4
    syscall
    main_Ret:
    move $s0, _R62
    move $s1, _R63
    move $s2, _R64
    move $s3, _R65
    move $s4, _R66
    move $s5, _R67
    move $s6, _R68
    move $s7, _R69
    move $fp, _R70
    move $ra, _R71
    jr $ra

.text
.globl main._entry
main._entry:
    subu $sp, $sp, 16
    move _R32, $a0
    move _R33, $s0
    move _R34, $s1
    move _R35, $s2
    move _R36, $s3
    move _R37, $s4
    move _R38, $s5
    move _R39, $s6
    move _R40, $s7
    move _R41, $fp
    move _R42, $ra
    jal main
    main._entry_Ret:
    move $s0, _R33
    move $s1, _R34
    move $s2, _R35
    move $s3, _R36
    move $s4, _R37
    move $s5, _R38
    move $s6, _R39
    move $s7, _R40
    move $fp, _R41
    move $ra, _R42
    addu $sp, $sp, 16
    jr $ra

.text
.globl _Main.foo
_Main.foo:
    move _R32, $s0
    move _R33, $s1
    move _R34, $s2
    move _R35, $s3
    move _R36, $s4
    move _R37, $s5
    move _R38, $s6
    move _R39, $s7
    move _R40, $fp
    move _R41, $ra
    _Main.foo_Ret:
    move $s0, _R32
    move $s1, _R33
    move $s2, _R34
    move $s3, _R35
    move $s4, _R36
    move $s5, _R37
    move $s6, _R38
    move $s7, _R39
    move $fp, _R40
    move $ra, _R41
    jr $ra

.text
.globl _Main.foo._entry
_Main.foo._entry:
    subu $sp, $sp, 16
    move _R32, $a0
    move _R33, $s0
    move _R34, $s1
    move _R35, $s2
    move _R36, $s3
    move _R37, $s4
    move _R38, $s5
    move _R39, $s6
    move _R40, $s7
    move _R41, $fp
    move _R42, $ra
    jal _Main.foo
    _Main.foo._entry_Ret:
    move $s0, _R33
    move $s1, _R34
    move $s2, _R35
    move $s3, _R36
    move $s4, _R37
    move $s5, _R38
    move $s6, _R39
    move $s7, _R40
    move $fp, _R41
    move $ra, _R42
    addu $sp, $sp, 16
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