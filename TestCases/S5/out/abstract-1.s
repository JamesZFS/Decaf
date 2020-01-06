.data
.align 2
_A:
    .word 0
    .word _STRING0
    .word _A.a
    .word _A.b
    .word _A.c
    .word _A.d
_B:
    .word _A
    .word _STRING1
    .word _B.a
    .word _B.b
    .word _A.c
    .word _A.d
    .word _B.e
    .word _B.f
_C:
    .word _B
    .word _STRING2
    .word _C.a
    .word _B.b
    .word _C.c
    .word _C.d
    .word _C.e
    .word _C.f
_D:
    .word _C
    .word _STRING3
    .word _C.a
    .word _B.b
    .word _D.c
    .word _D.d
    .word _D.e
    .word _D.f
    .word _D.g
    .word _D.h
_E:
    .word _C
    .word _STRING4
    .word _E.a
    .word _B.b
    .word _C.c
    .word _E.d
    .word _C.e
    .word _C.f
    .word _E.g
_F:
    .word _D
    .word _STRING5
    .word _C.a
    .word _B.b
    .word _D.c
    .word _D.d
    .word _D.e
    .word _D.f
    .word _D.g
    .word _F.h
_Main:
    .word _D
    .word _STRING6
    .word _Main.a
    .word _B.b
    .word _D.c
    .word _Main.d
    .word _D.e
    .word _D.f
    .word _Main.g
    .word _Main.h

.data
_STRING0:
    .asciiz "A"
_STRING1:
    .asciiz "B"
_STRING2:
    .asciiz "C"
_STRING3:
    .asciiz "D"
_STRING4:
    .asciiz "E"
_STRING5:
    .asciiz "F"
_STRING6:
    .asciiz "Main"
_STRING7:
    .asciiz "B.b()\n"
_STRING8:
    .asciiz "B.f()\n"
_STRING9:
    .asciiz "C.a()\n"
_STRING10:
    .asciiz "C.c()\n"
_STRING11:
    .asciiz "C.d()\n"
_STRING12:
    .asciiz "C.e()\n"
_STRING13:
    .asciiz "C.f()\n"
_STRING14:
    .asciiz "D.c()\n"
_STRING15:
    .asciiz "D.d()\n"
_STRING16:
    .asciiz "D.e()\n"
_STRING17:
    .asciiz "D.f()\n"
_STRING18:
    .asciiz "E.a()\n"
_STRING19:
    .asciiz "E.d()\n"
_STRING20:
    .asciiz "E.g()\n"
_STRING21:
    .asciiz "Main.a()\n"
_STRING22:
    .asciiz "Main.d()\n"
_STRING23:
    .asciiz "Main.g()\n"
_STRING24:
    .asciiz "Main.h()\n"

.text
.globl _A._new
_A._new:
    li $a0, 8
    li $v0, 9
    syscall
    la $t8, _A
    sw $t8, 0($v0)
    sw $zero, 4($v0)
    _A._new_Ret:
    jr $ra

.text
.globl _B._new
_B._new:
    li $a0, 12
    li $v0, 9
    syscall
    la $t8, _B
    sw $t8, 0($v0)
    sw $zero, 4($v0)
    sw $zero, 8($v0)
    _B._new_Ret:
    jr $ra

.text
.globl _C._new
_C._new:
    li $a0, 12
    li $v0, 9
    syscall
    la $t8, _C
    sw $t8, 0($v0)
    sw $zero, 4($v0)
    sw $zero, 8($v0)
    _C._new_Ret:
    jr $ra

.text
.globl _D._new
_D._new:
    li $a0, 12
    li $v0, 9
    syscall
    la $t8, _D
    sw $t8, 0($v0)
    sw $zero, 4($v0)
    sw $zero, 8($v0)
    _D._new_Ret:
    jr $ra

.text
.globl _E._new
_E._new:
    li $a0, 12
    li $v0, 9
    syscall
    la $t8, _E
    sw $t8, 0($v0)
    sw $zero, 4($v0)
    sw $zero, 8($v0)
    _E._new_Ret:
    jr $ra

.text
.globl _F._new
_F._new:
    li $a0, 12
    li $v0, 9
    syscall
    la $t8, _F
    sw $t8, 0($v0)
    sw $zero, 4($v0)
    sw $zero, 8($v0)
    _F._new_Ret:
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
.globl _A.a
_A.a:
    _A.a_Ret:
    jr $ra

.text
.globl _A.a._entry
_A.a._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 8($v0)
    jalr $v0
    _A.a._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _A.b
_A.b:
    _A.b_Ret:
    jr $ra

.text
.globl _A.b._entry
_A.b._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 12($v0)
    jalr $v0
    _A.b._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _A.c
_A.c:
    _A.c_Ret:
    jr $ra

.text
.globl _A.c._entry
_A.c._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 16($v0)
    jalr $v0
    _A.c._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _A.d
_A.d:
    _A.d_Ret:
    jr $ra

.text
.globl _A.d._entry
_A.d._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 20($v0)
    jalr $v0
    _A.d._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _B.a
_B.a:
    _B.a_Ret:
    jr $ra

.text
.globl _B.a._entry
_B.a._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 8($v0)
    jalr $v0
    _B.a._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _B.b
_B.b:
    la $a0, _STRING7
    li $v0, 4
    syscall
    _B.b_Ret:
    jr $ra

.text
.globl _B.b._entry
_B.b._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 12($v0)
    jalr $v0
    _B.b._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _B.e
_B.e:
    _B.e_Ret:
    jr $ra

.text
.globl _B.e._entry
_B.e._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 24($v0)
    jalr $v0
    _B.e._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _B.f
_B.f:
    la $a0, _STRING8
    li $v0, 4
    syscall
    _B.f_Ret:
    jr $ra

.text
.globl _B.f._entry
_B.f._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 28($v0)
    jalr $v0
    _B.f._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _C.a
_C.a:
    la $a0, _STRING9
    li $v0, 4
    syscall
    _C.a_Ret:
    jr $ra

.text
.globl _C.a._entry
_C.a._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 8($v0)
    jalr $v0
    _C.a._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _C.c
_C.c:
    la $a0, _STRING10
    li $v0, 4
    syscall
    _C.c_Ret:
    jr $ra

.text
.globl _C.c._entry
_C.c._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 16($v0)
    jalr $v0
    _C.c._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _C.d
_C.d:
    la $a0, _STRING11
    li $v0, 4
    syscall
    _C.d_Ret:
    jr $ra

.text
.globl _C.d._entry
_C.d._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 20($v0)
    jalr $v0
    _C.d._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _C.e
_C.e:
    la $a0, _STRING12
    li $v0, 4
    syscall
    _C.e_Ret:
    jr $ra

.text
.globl _C.e._entry
_C.e._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 24($v0)
    jalr $v0
    _C.e._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _C.f
_C.f:
    la $a0, _STRING13
    li $v0, 4
    syscall
    _C.f_Ret:
    jr $ra

.text
.globl _C.f._entry
_C.f._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 28($v0)
    jalr $v0
    _C.f._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _D.c
_D.c:
    la $a0, _STRING14
    li $v0, 4
    syscall
    _D.c_Ret:
    jr $ra

.text
.globl _D.c._entry
_D.c._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 16($v0)
    jalr $v0
    _D.c._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _D.d
_D.d:
    la $a0, _STRING15
    li $v0, 4
    syscall
    _D.d_Ret:
    jr $ra

.text
.globl _D.d._entry
_D.d._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 20($v0)
    jalr $v0
    _D.d._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _D.e
_D.e:
    la $a0, _STRING16
    li $v0, 4
    syscall
    _D.e_Ret:
    jr $ra

.text
.globl _D.e._entry
_D.e._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 24($v0)
    jalr $v0
    _D.e._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _D.f
_D.f:
    la $a0, _STRING17
    li $v0, 4
    syscall
    _D.f_Ret:
    jr $ra

.text
.globl _D.f._entry
_D.f._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 28($v0)
    jalr $v0
    _D.f._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _D.g
_D.g:
    _D.g_Ret:
    jr $ra

.text
.globl _D.g._entry
_D.g._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 32($v0)
    jalr $v0
    _D.g._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _D.h
_D.h:
    _D.h_Ret:
    jr $ra

.text
.globl _D.h._entry
_D.h._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 36($v0)
    jalr $v0
    _D.h._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _E.a
_E.a:
    la $a0, _STRING18
    li $v0, 4
    syscall
    _E.a_Ret:
    jr $ra

.text
.globl _E.a._entry
_E.a._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 8($v0)
    jalr $v0
    _E.a._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _E.d
_E.d:
    la $a0, _STRING19
    li $v0, 4
    syscall
    _E.d_Ret:
    jr $ra

.text
.globl _E.d._entry
_E.d._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 20($v0)
    jalr $v0
    _E.d._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _E.g
_E.g:
    la $a0, _STRING20
    li $v0, 4
    syscall
    _E.g_Ret:
    jr $ra

.text
.globl _E.g._entry
_E.g._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 32($v0)
    jalr $v0
    _E.g._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _F.h
_F.h:
    _F.h_Ret:
    jr $ra

.text
.globl _F.h._entry
_F.h._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 36($v0)
    jalr $v0
    _F.h._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Main.a
_Main.a:
    la $a0, _STRING21
    li $v0, 4
    syscall
    _Main.a_Ret:
    jr $ra

.text
.globl _Main.a._entry
_Main.a._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 8($v0)
    jalr $v0
    _Main.a._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Main.d
_Main.d:
    la $a0, _STRING22
    li $v0, 4
    syscall
    _Main.d_Ret:
    jr $ra

.text
.globl _Main.d._entry
_Main.d._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 20($v0)
    jalr $v0
    _Main.d._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Main.g
_Main.g:
    la $a0, _STRING23
    li $v0, 4
    syscall
    _Main.g_Ret:
    jr $ra

.text
.globl _Main.g._entry
_Main.g._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 32($v0)
    jalr $v0
    _Main.g._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Main.h
_Main.h:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    la $a0, _STRING24
    li $v0, 4
    syscall
    jal _Main._new
    _Main.h_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl _Main.h._entry
_Main.h._entry:
    subu $sp, $sp, 20
    sw $ra, 16($sp)
    lw $a0, 4($a0)
    lw $v0, 0($a0)
    lw $v0, 36($v0)
    jalr $v0
    _Main.h._entry_Ret:
    lw $ra, 16($sp)
    addu $sp, $sp, 20
    jr $ra

.text
.globl main
main:
    subu $sp, $sp, 24
    sw $s7, 16($sp)
    sw $ra, 20($sp)
    jal _C._new
    move $s7, $v0
    la $t8, _C.a._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s7, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    la $t8, _B.b._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s7, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    la $t8, _C.c._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s7, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    la $t8, _C.d._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s7, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    la $t8, _C.e._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s7, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    la $t8, _C.f._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s7, 4($v0)
    lw $s7, 0($v0)
    move $a0, $v0
    jalr $s7
    jal _E._new
    move $s7, $v0
    la $t8, _E.a._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s7, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    la $t8, _B.b._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s7, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    la $t8, _C.c._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s7, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    la $t8, _E.d._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s7, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    la $t8, _C.e._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s7, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    la $t8, _C.f._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s7, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    la $t8, _E.g._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s7, 4($v0)
    lw $s7, 0($v0)
    move $a0, $v0
    li $a1, 1
    li $a2, 1
    jalr $s7
    jal _Main._new
    move $s7, $v0
    la $t8, _Main.a._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s7, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    la $t8, _B.b._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s7, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    la $t8, _D.c._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s7, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    la $t8, _Main.d._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s7, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    la $t8, _D.e._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s7, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    la $t8, _D.f._entry
    li $a0, 8
    li $v0, 9
    syscall
    sw $t8, 0($v0)
    sw $s7, 4($v0)
    lw $t8, 0($v0)
    move $a0, $v0
    jalr $t8
    la $t8, _Main.g._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s7, 4($a0)
    lw $v0, 0($a0)
    li $a1, 1
    li $a2, 1
    jalr $v0
    la $t8, _Main.h._entry
    li $a0, 8
    li $v0, 9
    syscall
    move $a0, $v0
    sw $t8, 0($a0)
    sw $s7, 4($a0)
    lw $v0, 0($a0)
    jalr $v0
    main_Ret:
    lw $s7, 16($sp)
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