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
    subu $sp, $sp, 0
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
    addu $sp, $sp, 0
    jr $ra

.text
.globl length
length:
    subu $sp, $sp, 0
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
    addu $sp, $sp, 0
    jr $ra

.text
.globl main
main:
    subu $sp, $sp, 0
    move _R113, $s0
    move _R114, $s1
    move _R115, $s2
    move _R116, $s3
    move _R117, $s4
    move _R118, $s5
    move _R119, $s6
    move _R120, $s7
    move _R121, $fp
    move _R122, $ra
    la _R59, _STRING1
    move $a0, _R59
    li $v0, 4
    syscall
    move $a0, $zero
    li $v0, 1
    syscall
    la _R60, _STRING2
    move $a0, _R60
    li $v0, 4
    syscall
    la _R61, _STRING3
    move $a0, _R61
    li $v0, 4
    syscall
    li _R123, 1
    move $a0, _R123
    li $v0, 1
    syscall
    la _R62, _STRING2
    move $a0, _R62
    li $v0, 4
    syscall
    la _R63, _STRING4
    move $a0, _R63
    li $v0, 4
    syscall
    li _R124, 2
    move $a0, _R124
    li $v0, 1
    syscall
    la _R64, _STRING2
    move $a0, _R64
    li $v0, 4
    syscall
    la _R65, _STRING5
    move $a0, _R65
    li $v0, 4
    syscall
    li _R125, 3
    move $a0, _R125
    li $v0, 1
    syscall
    la _R66, _STRING2
    move $a0, _R66
    li $v0, 4
    syscall
    la _R67, _STRING6
    move $a0, _R67
    li $v0, 4
    syscall
    li _R126, 4
    move $a0, _R126
    li $v0, 1
    syscall
    la _R68, _STRING2
    move $a0, _R68
    li $v0, 4
    syscall
    la _R69, _STRING7
    move $a0, _R69
    li $v0, 4
    syscall
    li _R127, 5
    move $a0, _R127
    li $v0, 1
    syscall
    la _R70, _STRING2
    move $a0, _R70
    li $v0, 4
    syscall
    la _R71, _STRING8
    move $a0, _R71
    li $v0, 4
    syscall
    li _R128, 6
    move $a0, _R128
    li $v0, 1
    syscall
    la _R72, _STRING2
    move $a0, _R72
    li $v0, 4
    syscall
    la _R73, _STRING9
    move $a0, _R73
    li $v0, 4
    syscall
    li _R129, 7
    move $a0, _R129
    li $v0, 1
    syscall
    la _R74, _STRING2
    move $a0, _R74
    li $v0, 4
    syscall
    la _R75, _STRING10
    move $a0, _R75
    li $v0, 4
    syscall
    li _R130, 8
    move $a0, _R130
    li $v0, 1
    syscall
    la _R76, _STRING2
    move $a0, _R76
    li $v0, 4
    syscall
    la _R77, _STRING11
    move $a0, _R77
    li $v0, 4
    syscall
    li _R131, 9
    move $a0, _R131
    li $v0, 1
    syscall
    la _R78, _STRING2
    move $a0, _R78
    li $v0, 4
    syscall
    la _R79, _STRING12
    move $a0, _R79
    li $v0, 4
    syscall
    li _R132, 10
    move $a0, _R132
    li $v0, 1
    syscall
    la _R80, _STRING2
    move $a0, _R80
    li $v0, 4
    syscall
    la _R81, _STRING13
    move $a0, _R81
    li $v0, 4
    syscall
    li _R133, 11
    move $a0, _R133
    li $v0, 1
    syscall
    la _R82, _STRING2
    move $a0, _R82
    li $v0, 4
    syscall
    la _R83, _STRING14
    move $a0, _R83
    li $v0, 4
    syscall
    li _R134, 12
    move $a0, _R134
    li $v0, 1
    syscall
    la _R84, _STRING2
    move $a0, _R84
    li $v0, 4
    syscall
    la _R85, _STRING15
    move $a0, _R85
    li $v0, 4
    syscall
    li _R135, 13
    move $a0, _R135
    li $v0, 1
    syscall
    la _R86, _STRING2
    move $a0, _R86
    li $v0, 4
    syscall
    la _R87, _STRING16
    move $a0, _R87
    li $v0, 4
    syscall
    li _R136, 14
    move $a0, _R136
    li $v0, 1
    syscall
    la _R88, _STRING2
    move $a0, _R88
    li $v0, 4
    syscall
    la _R89, _STRING17
    move $a0, _R89
    li $v0, 4
    syscall
    li _R137, 15
    move $a0, _R137
    li $v0, 1
    syscall
    la _R90, _STRING2
    move $a0, _R90
    li $v0, 4
    syscall
    la _R91, _STRING18
    move $a0, _R91
    li $v0, 4
    syscall
    li _R138, 16
    move $a0, _R138
    li $v0, 1
    syscall
    la _R92, _STRING2
    move $a0, _R92
    li $v0, 4
    syscall
    la _R93, _STRING19
    move $a0, _R93
    li $v0, 4
    syscall
    li _R139, 17
    move $a0, _R139
    li $v0, 1
    syscall
    la _R94, _STRING2
    move $a0, _R94
    li $v0, 4
    syscall
    la _R95, _STRING20
    move $a0, _R95
    li $v0, 4
    syscall
    li _R140, 18
    move $a0, _R140
    li $v0, 1
    syscall
    la _R96, _STRING2
    move $a0, _R96
    li $v0, 4
    syscall
    la _R97, _STRING21
    move $a0, _R97
    li $v0, 4
    syscall
    li _R141, 19
    move $a0, _R141
    li $v0, 1
    syscall
    la _R98, _STRING2
    move $a0, _R98
    li $v0, 4
    syscall
    la _R99, _STRING22
    move $a0, _R99
    li $v0, 4
    syscall
    li _R142, 20
    move $a0, _R142
    li $v0, 1
    syscall
    la _R100, _STRING2
    move $a0, _R100
    li $v0, 4
    syscall
    la _R101, _STRING23
    move $a0, _R101
    li $v0, 4
    syscall
    li _R143, 21
    move $a0, _R143
    li $v0, 1
    syscall
    la _R102, _STRING2
    move $a0, _R102
    li $v0, 4
    syscall
    la _R103, _STRING24
    move $a0, _R103
    li $v0, 4
    syscall
    li _R144, 22
    move $a0, _R144
    li $v0, 1
    syscall
    la _R104, _STRING2
    move $a0, _R104
    li $v0, 4
    syscall
    la _R105, _STRING25
    move $a0, _R105
    li $v0, 4
    syscall
    li _R145, 23
    move $a0, _R145
    li $v0, 1
    syscall
    la _R106, _STRING2
    move $a0, _R106
    li $v0, 4
    syscall
    la _R107, _STRING26
    move $a0, _R107
    li $v0, 4
    syscall
    li _R146, 24
    move $a0, _R146
    li $v0, 1
    syscall
    la _R108, _STRING2
    move $a0, _R108
    li $v0, 4
    syscall
    la _R109, _STRING27
    move $a0, _R109
    li $v0, 4
    syscall
    li _R147, 25
    move $a0, _R147
    li $v0, 1
    syscall
    la _R110, _STRING2
    move $a0, _R110
    li $v0, 4
    syscall
    la _R111, _STRING28
    move $a0, _R111
    li $v0, 4
    syscall
    li _R148, 26
    move $a0, _R148
    li $v0, 1
    syscall
    la _R112, _STRING2
    move $a0, _R112
    li $v0, 4
    syscall
    main_Ret:
    move $s0, _R113
    move $s1, _R114
    move $s2, _R115
    move $s3, _R116
    move $s4, _R117
    move $s5, _R118
    move $s6, _R119
    move $s7, _R120
    move $fp, _R121
    move $ra, _R122
    addu $sp, $sp, 0
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