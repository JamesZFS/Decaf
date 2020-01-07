.data
.align 2
_Main:
    .word 0
    .word _STRING0
_Rng:
    .word 0
    .word _STRING1
    .word _Rng.next
_QuickSort:
    .word 0
    .word _STRING2
_MergeSort:
    .word 0
    .word _STRING3

.data
_STRING0:
    .asciiz "Main"
_STRING1:
    .asciiz "Rng"
_STRING2:
    .asciiz "QuickSort"
_STRING3:
    .asciiz "MergeSort"
_STRING4:
    .asciiz "Decaf runtime error: Cannot create negative-sized array\n"
_STRING5:
    .asciiz "Decaf runtime error: Division by zero error"
_STRING6:
    .asciiz "Decaf runtime error: Array subscript out of bounds\n"
_STRING7:
    .asciiz " "
_STRING8:
    .asciiz "\n"

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
.globl _Rng._new
_Rng._new:
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
    li _R44, 8
    move $a0, _R44
    li $v0, 9
    syscall
    move _R32, $v0
    la _R33, _Rng
    sw _R33, 0(_R32)
    sw $zero, 4(_R32)
    move $v0, _R32
    _Rng._new_Ret:
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
.globl _QuickSort._new
_QuickSort._new:
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
    la _R33, _QuickSort
    sw _R33, 0(_R32)
    move $v0, _R32
    _QuickSort._new_Ret:
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
.globl _MergeSort._new
_MergeSort._new:
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
    la _R33, _MergeSort
    sw _R33, 0(_R32)
    move $v0, _R32
    _MergeSort._new_Ret:
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
    subu $sp, $sp, 16
    move _R128, $s0
    move _R129, $s1
    move _R130, $s2
    move _R131, $s3
    move _R132, $s4
    move _R133, $s5
    move _R134, $s6
    move _R135, $s7
    move _R136, $fp
    move _R137, $ra
    la _R33, _Rng.make._entry
    li _R138, 4
    move $a0, _R138
    li $v0, 9
    syscall
    move _R34, $v0
    sw _R33, 0(_R34)
    lw _R36, 0(_R34)
    move $a0, _R34
    li _R139, 19260817
    move $a1, _R139
    jalr _R36
    move _R35, $v0
    li _R140, 2004
    move $a0, _R140
    li $v0, 9
    syscall
    move _R41, $v0
    addu _R39, _R41, 2004
    addu _R41, _R41, 4
    j main_L4
    main_L3:
    subu _R39, _R39, 4
    sw $zero, 0(_R39)
    main_L4:
    seq _R38, _R39, _R41
    beqz _R38, main_L3
    li _R141, 500
    sw _R141, -4(_R41)
    li _R142, 2004
    move $a0, _R142
    li $v0, 9
    syscall
    move _R46, $v0
    addu _R44, _R46, 2004
    addu _R46, _R46, 4
    j main_L8
    main_L7:
    subu _R44, _R44, 4
    sw $zero, 0(_R44)
    main_L8:
    seq _R43, _R44, _R46
    beqz _R43, main_L7
    li _R143, 500
    sw _R143, -4(_R46)
    li _R47, 0
    j main_L21
    main_L10:
    la _R48, _Rng.next._entry
    li _R144, 8
    move $a0, _R144
    li $v0, 9
    syscall
    move _R49, $v0
    sw _R48, 0(_R49)
    sw _R35, 4(_R49)
    lw _R51, 0(_R49)
    move $a0, _R49
    jalr _R51
    move _R50, $v0
    rem _R54, _R50, 500
    lw _R120, -4(_R41)
    sge _R121, _R47, 0
    slt _R125, _R47, _R120
    and _R127, _R121, _R125
    beqz _R127, main_L13
    mul _R122, _R47, 4
    addu _R126, _R122, _R41
    sw _R54, 0(_R126)
    j main_L14
    main_L13:
    la _R59, _STRING6
    move $a0, _R59
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L14:
    beqz _R127, main_L16
    lw _R64, 0(_R126)
    j main_L17
    main_L16:
    la _R65, _STRING6
    move $a0, _R65
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L17:
    lw _R67, -4(_R46)
    slt _R68, _R47, _R67
    and _R66, _R121, _R68
    beqz _R66, main_L19
    addu _R69, _R122, _R46
    sw _R64, 0(_R69)
    j main_L20
    main_L19:
    la _R70, _STRING6
    move $a0, _R70
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L20:
    addu _R71, _R47, 1
    move _R47, _R71
    main_L21:
    li _R145, 8
    move $a0, _R145
    li $v0, 9
    syscall
    move _R72, $v0
    la _R73, length
    sw _R73, 0(_R72)
    sw _R41, 4(_R72)
    lw _R75, 0(_R72)
    move $a0, _R72
    jalr _R75
    move _R74, $v0
    slt _R76, _R47, _R74
    bnez _R76, main_L10
    la _R77, _QuickSort.sort._entry
    li _R146, 4
    move $a0, _R146
    li $v0, 9
    syscall
    move _R78, $v0
    sw _R77, 0(_R78)
    li _R147, 8
    move $a0, _R147
    li $v0, 9
    syscall
    move _R79, $v0
    la _R80, length
    sw _R80, 0(_R79)
    sw _R41, 4(_R79)
    lw _R82, 0(_R79)
    move $a0, _R79
    jalr _R82
    move _R81, $v0
    subu _R83, _R81, 1
    lw _R84, 0(_R78)
    move $a0, _R78
    move $a1, _R41
    move $a2, $zero
    move $a3, _R83
    jalr _R84
    li _R85, 0
    j main_L27
    main_L23:
    lw _R87, -4(_R41)
    sge _R86, _R85, 0
    slt _R88, _R85, _R87
    and _R86, _R86, _R88
    beqz _R86, main_L25
    mul _R89, _R85, 4
    addu _R89, _R89, _R41
    lw _R90, 0(_R89)
    j main_L26
    main_L25:
    la _R91, _STRING6
    move $a0, _R91
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L26:
    move $a0, _R90
    li $v0, 1
    syscall
    la _R92, _STRING7
    move $a0, _R92
    li $v0, 4
    syscall
    addu _R93, _R85, 1
    move _R85, _R93
    main_L27:
    li _R148, 8
    move $a0, _R148
    li $v0, 9
    syscall
    move _R94, $v0
    la _R95, length
    sw _R95, 0(_R94)
    sw _R41, 4(_R94)
    lw _R97, 0(_R94)
    move $a0, _R94
    jalr _R97
    move _R96, $v0
    slt _R98, _R85, _R96
    bnez _R98, main_L23
    la _R99, _STRING8
    move $a0, _R99
    li $v0, 4
    syscall
    la _R100, _MergeSort.sort._entry
    li _R149, 4
    move $a0, _R149
    li $v0, 9
    syscall
    move _R101, $v0
    sw _R100, 0(_R101)
    lw _R102, 0(_R101)
    move $a0, _R101
    move $a1, _R46
    jalr _R102
    li _R103, 0
    j main_L33
    main_L29:
    lw _R105, -4(_R46)
    sge _R104, _R103, 0
    slt _R106, _R103, _R105
    and _R104, _R104, _R106
    beqz _R104, main_L31
    mul _R107, _R103, 4
    addu _R107, _R107, _R46
    lw _R108, 0(_R107)
    j main_L32
    main_L31:
    la _R109, _STRING6
    move $a0, _R109
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    main_L32:
    move $a0, _R108
    li $v0, 1
    syscall
    la _R110, _STRING7
    move $a0, _R110
    li $v0, 4
    syscall
    addu _R111, _R103, 1
    move _R103, _R111
    main_L33:
    li _R150, 8
    move $a0, _R150
    li $v0, 9
    syscall
    move _R112, $v0
    la _R113, length
    sw _R113, 0(_R112)
    sw _R46, 4(_R112)
    lw _R115, 0(_R112)
    move $a0, _R112
    jalr _R115
    move _R114, $v0
    slt _R116, _R103, _R114
    bnez _R116, main_L29
    la _R117, _STRING8
    move $a0, _R117
    li $v0, 4
    syscall
    main_Ret:
    move $s0, _R128
    move $s1, _R129
    move $s2, _R130
    move $s3, _R131
    move $s4, _R132
    move $s5, _R133
    move $s6, _R134
    move $s7, _R135
    move $fp, _R136
    move $ra, _R137
    addu $sp, $sp, 16
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
.globl _Rng.make
_Rng.make:
    subu $sp, $sp, 16
    move _R32, $a0
    move _R35, $s0
    move _R36, $s1
    move _R37, $s2
    move _R38, $s3
    move _R39, $s4
    move _R40, $s5
    move _R41, $s6
    move _R42, $s7
    move _R43, $fp
    move _R44, $ra
    jal _Rng._new
    move _R34, $v0
    sw _R32, 4(_R34)
    move $v0, _R34
    _Rng.make_Ret:
    move $s0, _R35
    move $s1, _R36
    move $s2, _R37
    move $s3, _R38
    move $s4, _R39
    move $s5, _R40
    move $s6, _R41
    move $s7, _R42
    move $fp, _R43
    move $ra, _R44
    addu $sp, $sp, 16
    jr $ra

.text
.globl _Rng.make._entry
_Rng.make._entry:
    subu $sp, $sp, 16
    move _R32, $a0
    move _R33, $a1
    move _R35, $s0
    move _R36, $s1
    move _R37, $s2
    move _R38, $s3
    move _R39, $s4
    move _R40, $s5
    move _R41, $s6
    move _R42, $s7
    move _R43, $fp
    move _R44, $ra
    move $a0, _R33
    jal _Rng.make
    move _R34, $v0
    move $v0, _R34
    _Rng.make._entry_Ret:
    move $s0, _R35
    move $s1, _R36
    move $s2, _R37
    move $s3, _R38
    move $s4, _R39
    move $s5, _R40
    move $s6, _R41
    move $s7, _R42
    move $fp, _R43
    move $ra, _R44
    addu $sp, $sp, 16
    jr $ra

.text
.globl _Rng.next
_Rng.next:
    move _R32, $a0
    move _R43, $s0
    move _R44, $s1
    move _R45, $s2
    move _R46, $s3
    move _R47, $s4
    move _R48, $s5
    move _R49, $s6
    move _R50, $s7
    move _R51, $fp
    move _R52, $ra
    lw _R33, 4(_R32)
    rem _R36, _R33, 10000
    mul _R37, _R36, 15625
    addu _R38, _R37, 22221
    rem _R41, _R38, 65536
    sw _R41, 4(_R32)
    lw _R42, 4(_R32)
    move $v0, _R42
    _Rng.next_Ret:
    move $s0, _R43
    move $s1, _R44
    move $s2, _R45
    move $s3, _R46
    move $s4, _R47
    move $s5, _R48
    move $s6, _R49
    move $s7, _R50
    move $fp, _R51
    move $ra, _R52
    jr $ra

.text
.globl _Rng.next._entry
_Rng.next._entry:
    subu $sp, $sp, 16
    move _R32, $a0
    move _R36, $s0
    move _R37, $s1
    move _R38, $s2
    move _R39, $s3
    move _R40, $s4
    move _R41, $s5
    move _R42, $s6
    move _R43, $s7
    move _R44, $fp
    move _R45, $ra
    lw _R34, 4(_R32)
    lw _R35, 0(_R34)
    lw _R35, 8(_R35)
    move $a0, _R34
    jalr _R35
    move _R33, $v0
    move $v0, _R33
    _Rng.next._entry_Ret:
    move $s0, _R36
    move $s1, _R37
    move $s2, _R38
    move $s3, _R39
    move $s4, _R40
    move $s5, _R41
    move $s6, _R42
    move $s7, _R43
    move $fp, _R44
    move $ra, _R45
    addu $sp, $sp, 16
    jr $ra

.text
.globl _QuickSort.sort
_QuickSort.sort:
    subu $sp, $sp, 16
    move _R32, $a0
    move _R33, $a1
    move _R34, $a2
    move _R126, $s0
    move _R127, $s1
    move _R128, $s2
    move _R129, $s3
    move _R130, $s4
    move _R131, $s5
    move _R132, $s6
    move _R133, $s7
    move _R134, $fp
    move _R135, $ra
    move _R35, _R33
    move _R36, _R34
    subu _R38, _R34, _R33
    div _R41, _R38, 2
    addu _R42, _R33, _R41
    lw _R100, -4(_R32)
    sge _R43, _R42, 0
    slt _R45, _R42, _R100
    and _R43, _R43, _R45
    beqz _R43, _QuickSort.sort_L4
    mul _R46, _R42, 4
    addu _R46, _R46, _R32
    lw _R47, 0(_R46)
    j _QuickSort.sort_L5
    _QuickSort.sort_L4:
    la _R48, _STRING6
    move $a0, _R48
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L5:
    j _QuickSort.sort_L32
    _QuickSort.sort_L6:
    j _QuickSort.sort_L8
    _QuickSort.sort_L7:
    addu _R49, _R35, 1
    move _R35, _R49
    _QuickSort.sort_L8:
    move _R101, _R100
    sge _R103, _R35, 0
    slt _R52, _R35, _R100
    and _R50, _R103, _R52
    beqz _R50, _QuickSort.sort_L10
    mul _R104, _R35, 4
    addu _R114, _R104, _R32
    lw _R121, 0(_R114)
    j _QuickSort.sort_L11
    _QuickSort.sort_L10:
    la _R55, _STRING6
    move $a0, _R55
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L11:
    slt _R56, _R121, _R47
    bnez _R56, _QuickSort.sort_L7
    j _QuickSort.sort_L14
    _QuickSort.sort_L13:
    subu _R57, _R36, 1
    move _R36, _R57
    _QuickSort.sort_L14:
    move _R100, _R101
    sge _R106, _R36, 0
    slt _R115, _R36, _R101
    and _R122, _R106, _R115
    beqz _R122, _QuickSort.sort_L16
    mul _R107, _R36, 4
    addu _R116, _R107, _R32
    lw _R123, 0(_R116)
    j _QuickSort.sort_L17
    _QuickSort.sort_L16:
    la _R63, _STRING6
    move $a0, _R63
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L17:
    sgt _R64, _R123, _R47
    bnez _R64, _QuickSort.sort_L13
    sle _R65, _R35, _R36
    beqz _R65, _QuickSort.sort_L32
    slt _R117, _R35, _R101
    and _R124, _R103, _R117
    beqz _R124, _QuickSort.sort_L21
    j _QuickSort.sort_L22
    _QuickSort.sort_L21:
    la _R72, _STRING6
    move $a0, _R72
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L22:
    beqz _R122, _QuickSort.sort_L24
    j _QuickSort.sort_L25
    _QuickSort.sort_L24:
    la _R78, _STRING6
    move $a0, _R78
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L25:
    beqz _R124, _QuickSort.sort_L27
    sw _R123, 0(_R114)
    j _QuickSort.sort_L28
    _QuickSort.sort_L27:
    la _R83, _STRING6
    move $a0, _R83
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L28:
    move _R100, _R101
    beqz _R122, _QuickSort.sort_L30
    sw _R121, 0(_R116)
    j _QuickSort.sort_L31
    _QuickSort.sort_L30:
    la _R88, _STRING6
    move $a0, _R88
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _QuickSort.sort_L31:
    addu _R89, _R35, 1
    move _R35, _R89
    subu _R90, _R36, 1
    move _R36, _R90
    _QuickSort.sort_L32:
    sle _R91, _R35, _R36
    bnez _R91, _QuickSort.sort_L6
    slt _R92, _R33, _R36
    beqz _R92, _QuickSort.sort_L35
    la _R93, _QuickSort.sort._entry
    li _R136, 4
    move $a0, _R136
    li $v0, 9
    syscall
    move _R94, $v0
    sw _R93, 0(_R94)
    lw _R95, 0(_R94)
    move $a0, _R94
    move $a1, _R32
    move $a2, _R33
    move $a3, _R36
    jalr _R95
    _QuickSort.sort_L35:
    slt _R96, _R35, _R34
    beqz _R96, _QuickSort.sort_L37
    la _R97, _QuickSort.sort._entry
    li _R137, 4
    move $a0, _R137
    li $v0, 9
    syscall
    move _R98, $v0
    sw _R97, 0(_R98)
    lw _R99, 0(_R98)
    move $a0, _R98
    move $a1, _R32
    move $a2, _R35
    move $a3, _R34
    jalr _R99
    _QuickSort.sort_L37:
    _QuickSort.sort_Ret:
    move $s0, _R126
    move $s1, _R127
    move $s2, _R128
    move $s3, _R129
    move $s4, _R130
    move $s5, _R131
    move $s6, _R132
    move $s7, _R133
    move $fp, _R134
    move $ra, _R135
    addu $sp, $sp, 16
    jr $ra

.text
.globl _QuickSort.sort._entry
_QuickSort.sort._entry:
    subu $sp, $sp, 16
    move _R32, $a0
    move _R33, $a1
    move _R34, $a2
    move _R35, $a3
    move _R36, $s0
    move _R37, $s1
    move _R38, $s2
    move _R39, $s3
    move _R40, $s4
    move _R41, $s5
    move _R42, $s6
    move _R43, $s7
    move _R44, $fp
    move _R45, $ra
    move $a0, _R33
    move $a1, _R34
    move $a2, _R35
    jal _QuickSort.sort
    _QuickSort.sort._entry_Ret:
    move $s0, _R36
    move $s1, _R37
    move $s2, _R38
    move $s3, _R39
    move $s4, _R40
    move $s5, _R41
    move $s6, _R42
    move $s7, _R43
    move $fp, _R44
    move $ra, _R45
    addu $sp, $sp, 16
    jr $ra

.text
.globl _MergeSort.sort
_MergeSort.sort:
    subu $sp, $sp, 20
    move _R32, $a0
    move _R48, $s0
    move _R49, $s1
    move _R50, $s2
    move _R51, $s3
    move _R52, $s4
    move _R53, $s5
    move _R54, $s6
    move _R55, $s7
    move _R56, $fp
    move _R57, $ra
    la _R33, _MergeSort.sort_impl._entry
    li _R58, 4
    move $a0, _R58
    li $v0, 9
    syscall
    move _R34, $v0
    sw _R33, 0(_R34)
    li _R59, 8
    move $a0, _R59
    li $v0, 9
    syscall
    move _R35, $v0
    la _R36, length
    sw _R36, 0(_R35)
    sw _R32, 4(_R35)
    lw _R38, 0(_R35)
    move $a0, _R35
    jalr _R38
    move _R37, $v0
    li _R60, 8
    move $a0, _R60
    li $v0, 9
    syscall
    move _R39, $v0
    la _R40, length
    sw _R40, 0(_R39)
    sw _R32, 4(_R39)
    lw _R42, 0(_R39)
    move $a0, _R39
    jalr _R42
    move _R41, $v0
    slt _R43, _R41, 0
    beqz _R43, _MergeSort.sort_L3
    la _R45, _STRING4
    move $a0, _R45
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_L3:
    mul _R44, _R41, 4
    addu _R44, _R44, 4
    move $a0, _R44
    li $v0, 9
    syscall
    move _R46, $v0
    addu _R44, _R46, _R44
    addu _R46, _R46, 4
    j _MergeSort.sort_L5
    _MergeSort.sort_L4:
    subu _R44, _R44, 4
    sw $zero, 0(_R44)
    _MergeSort.sort_L5:
    seq _R43, _R44, _R46
    beqz _R43, _MergeSort.sort_L4
    sw _R41, -4(_R46)
    lw _R47, 0(_R34)
    move $a0, _R34
    move $a1, _R32
    move $a2, $zero
    move $a3, _R37
    sw _R46, 16($sp)
    jalr _R47
    _MergeSort.sort_Ret:
    move $s0, _R48
    move $s1, _R49
    move $s2, _R50
    move $s3, _R51
    move $s4, _R52
    move $s5, _R53
    move $s6, _R54
    move $s7, _R55
    move $fp, _R56
    move $ra, _R57
    addu $sp, $sp, 20
    jr $ra

.text
.globl _MergeSort.sort._entry
_MergeSort.sort._entry:
    subu $sp, $sp, 16
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
    move $a0, _R33
    jal _MergeSort.sort
    _MergeSort.sort._entry_Ret:
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
    addu $sp, $sp, 16
    jr $ra

.text
.globl _MergeSort.sort_impl
_MergeSort.sort_impl:
    subu $sp, $sp, 20
    move _R32, $a0
    move _R33, $a1
    move _R34, $a2
    move _R35, $a3
    move _R136, $s0
    move _R137, $s1
    move _R138, $s2
    move _R139, $s3
    move _R140, $s4
    move _R141, $s5
    move _R142, $s6
    move _R143, $s7
    move _R144, $fp
    move _R145, $ra
    addu _R36, _R33, 1
    slt _R37, _R36, _R34
    beqz _R37, _MergeSort.sort_impl_L45
    addu _R39, _R33, _R34
    div _R42, _R39, 2
    la _R43, _MergeSort.sort_impl._entry
    li _R146, 4
    move $a0, _R146
    li $v0, 9
    syscall
    move _R44, $v0
    sw _R43, 0(_R44)
    lw _R45, 0(_R44)
    move $a0, _R44
    move $a1, _R32
    move $a2, _R33
    move $a3, _R42
    sw _R35, 16($sp)
    jalr _R45
    la _R46, _MergeSort.sort_impl._entry
    li _R147, 4
    move $a0, _R147
    li $v0, 9
    syscall
    move _R47, $v0
    sw _R46, 0(_R47)
    lw _R48, 0(_R47)
    move $a0, _R47
    move $a1, _R32
    move $a2, _R42
    move $a3, _R34
    sw _R35, 16($sp)
    jalr _R48
    move _R49, _R33
    move _R50, _R42
    li _R51, 0
    j _MergeSort.sort_impl_L26
    _MergeSort.sort_impl_L4:
    lw _R121, -4(_R32)
    sge _R123, _R50, 0
    slt _R128, _R50, _R121
    and _R132, _R123, _R128
    beqz _R132, _MergeSort.sort_impl_L6
    mul _R124, _R50, 4
    addu _R129, _R124, _R32
    lw _R133, 0(_R129)
    j _MergeSort.sort_impl_L7
    _MergeSort.sort_impl_L6:
    la _R57, _STRING6
    move $a0, _R57
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L7:
    sge _R126, _R49, 0
    slt _R130, _R49, _R121
    and _R134, _R126, _R130
    beqz _R134, _MergeSort.sort_impl_L9
    mul _R127, _R49, 4
    addu _R131, _R127, _R32
    lw _R135, 0(_R131)
    j _MergeSort.sort_impl_L10
    _MergeSort.sort_impl_L9:
    la _R63, _STRING6
    move $a0, _R63
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L10:
    slt _R64, _R133, _R135
    beqz _R64, _MergeSort.sort_impl_L18
    beqz _R132, _MergeSort.sort_impl_L13
    j _MergeSort.sort_impl_L14
    _MergeSort.sort_impl_L13:
    la _R70, _STRING6
    move $a0, _R70
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L14:
    lw _R72, -4(_R35)
    sge _R71, _R51, 0
    slt _R73, _R51, _R72
    and _R71, _R71, _R73
    beqz _R71, _MergeSort.sort_impl_L16
    mul _R74, _R51, 4
    addu _R74, _R74, _R35
    sw _R133, 0(_R74)
    j _MergeSort.sort_impl_L17
    _MergeSort.sort_impl_L16:
    la _R75, _STRING6
    move $a0, _R75
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L17:
    addu _R76, _R50, 1
    move _R50, _R76
    j _MergeSort.sort_impl_L25
    _MergeSort.sort_impl_L18:
    beqz _R134, _MergeSort.sort_impl_L20
    j _MergeSort.sort_impl_L21
    _MergeSort.sort_impl_L20:
    la _R82, _STRING6
    move $a0, _R82
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L21:
    lw _R84, -4(_R35)
    sge _R83, _R51, 0
    slt _R85, _R51, _R84
    and _R83, _R83, _R85
    beqz _R83, _MergeSort.sort_impl_L23
    mul _R86, _R51, 4
    addu _R86, _R86, _R35
    sw _R135, 0(_R86)
    j _MergeSort.sort_impl_L24
    _MergeSort.sort_impl_L23:
    la _R87, _STRING6
    move $a0, _R87
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L24:
    addu _R88, _R49, 1
    move _R49, _R88
    _MergeSort.sort_impl_L25:
    addu _R89, _R51, 1
    move _R51, _R89
    _MergeSort.sort_impl_L26:
    slt _R90, _R49, _R42
    slt _R91, _R50, _R34
    and _R92, _R90, _R91
    bnez _R92, _MergeSort.sort_impl_L4
    j _MergeSort.sort_impl_L35
    _MergeSort.sort_impl_L28:
    lw _R94, -4(_R32)
    sge _R93, _R49, 0
    slt _R95, _R49, _R94
    and _R93, _R93, _R95
    beqz _R93, _MergeSort.sort_impl_L30
    mul _R96, _R49, 4
    addu _R96, _R96, _R32
    lw _R97, 0(_R96)
    j _MergeSort.sort_impl_L31
    _MergeSort.sort_impl_L30:
    la _R98, _STRING6
    move $a0, _R98
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L31:
    lw _R100, -4(_R35)
    sge _R99, _R51, 0
    slt _R101, _R51, _R100
    and _R99, _R99, _R101
    beqz _R99, _MergeSort.sort_impl_L33
    mul _R102, _R51, 4
    addu _R102, _R102, _R35
    sw _R97, 0(_R102)
    j _MergeSort.sort_impl_L34
    _MergeSort.sort_impl_L33:
    la _R103, _STRING6
    move $a0, _R103
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L34:
    addu _R104, _R51, 1
    move _R51, _R104
    addu _R105, _R49, 1
    move _R49, _R105
    _MergeSort.sort_impl_L35:
    slt _R106, _R49, _R42
    bnez _R106, _MergeSort.sort_impl_L28
    li _R49, 0
    j _MergeSort.sort_impl_L44
    _MergeSort.sort_impl_L37:
    lw _R108, -4(_R35)
    sge _R107, _R49, 0
    slt _R109, _R49, _R108
    and _R107, _R107, _R109
    beqz _R107, _MergeSort.sort_impl_L39
    mul _R110, _R49, 4
    addu _R110, _R110, _R35
    lw _R111, 0(_R110)
    j _MergeSort.sort_impl_L40
    _MergeSort.sort_impl_L39:
    la _R112, _STRING6
    move $a0, _R112
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L40:
    addu _R113, _R49, _R33
    lw _R115, -4(_R32)
    sge _R114, _R113, 0
    slt _R116, _R113, _R115
    and _R114, _R114, _R116
    beqz _R114, _MergeSort.sort_impl_L42
    mul _R117, _R113, 4
    addu _R117, _R117, _R32
    sw _R111, 0(_R117)
    j _MergeSort.sort_impl_L43
    _MergeSort.sort_impl_L42:
    la _R118, _STRING6
    move $a0, _R118
    li $v0, 4
    syscall
    li $v0, 10
    syscall
    _MergeSort.sort_impl_L43:
    addu _R119, _R49, 1
    move _R49, _R119
    _MergeSort.sort_impl_L44:
    slt _R120, _R49, _R51
    bnez _R120, _MergeSort.sort_impl_L37
    _MergeSort.sort_impl_L45:
    _MergeSort.sort_impl_Ret:
    move $s0, _R136
    move $s1, _R137
    move $s2, _R138
    move $s3, _R139
    move $s4, _R140
    move $s5, _R141
    move $s6, _R142
    move $s7, _R143
    move $fp, _R144
    move $ra, _R145
    addu $sp, $sp, 20
    jr $ra

.text
.globl _MergeSort.sort_impl._entry
_MergeSort.sort_impl._entry:
    subu $sp, $sp, 16
    move _R32, $a0
    move _R33, $a1
    move _R34, $a2
    move _R35, $a3
    lw _R36, 32($sp)
    move _R37, $s0
    move _R38, $s1
    move _R39, $s2
    move _R40, $s3
    move _R41, $s4
    move _R42, $s5
    move _R43, $s6
    move _R44, $s7
    move _R45, $fp
    move _R46, $ra
    move $a0, _R33
    move $a1, _R34
    move $a2, _R35
    move $a3, _R36
    jal _MergeSort.sort_impl
    _MergeSort.sort_impl._entry_Ret:
    move $s0, _R37
    move $s1, _R38
    move $s2, _R39
    move $s3, _R40
    move $s4, _R41
    move $s5, _R42
    move $s6, _R43
    move $s7, _R44
    move $fp, _R45
    move $ra, _R46
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