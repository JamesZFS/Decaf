VTBL<_Complex> {
    0
    "Complex"
    FUNC<_Complex.abs2>
}

VTBL<_Main> {
    VTBL<_Complex>
    "Main"
    FUNC<_Complex.abs2>
}

FUNC<_Complex._new> {
    parm 12
    %0 = call _Alloc
    %1 = VTBL<_Complex>
    *(%0 + 0) = %1
    *(%0 + 4) = 0
    *(%0 + 8) = 0
    return %0
}

FUNC<_Main._new> {
    parm 12
    %0 = call _Alloc
    %1 = VTBL<_Main>
    *(%0 + 0) = %1
    *(%0 + 4) = 0
    *(%0 + 8) = 0
    return %0
}

FUNC<length> {
    %1 = *(%0 + 4)
    %1 = *(%1 - 4)
    return %1
}

FUNC<_Complex.make> {
    %3 = call _Complex._new
    %2 = %3
    %4 = (32768 == 0)
    if (%4 == 0) branch %0
    %5 = "Decaf runtime error: Division by zero error"
    parm %5
    call _PrintString
    call _Halt
    %0:
    %6 = (%0 % 32768)
    *(%2 + 4) = %6
    %7 = (32768 == 0)
    if (%7 == 0) branch %1
    %8 = "Decaf runtime error: Division by zero error"
    parm %8
    call _PrintString
    call _Halt
    %1:
    %9 = (%1 % 32768)
    *(%2 + 8) = %9
    return %2
}

FUNC<_Complex.make._entry> {
    parm %1
    parm %2
    %2 = call _Complex.make
    return %2
}

FUNC<_Complex.add> {
    %2 = FUNC<_Complex.make._entry>
    parm 4
    %3 = call _Alloc
    *(%3 + 0) = %2
    %4 = *(%0 + 4)
    %5 = *(%1 + 4)
    %6 = (%4 + %5)
    %7 = *(%0 + 8)
    %8 = *(%1 + 8)
    %9 = (%7 + %8)
    %11 = *(%3 + 0)
    parm %3
    parm %6
    parm %9
    %10 = call %11
    return %10
}

FUNC<_Complex.add._entry> {
    parm %1
    parm %2
    %2 = call _Complex.add
    return %2
}

FUNC<_Complex.sub> {
    %2 = FUNC<_Complex.make._entry>
    parm 4
    %3 = call _Alloc
    *(%3 + 0) = %2
    %4 = *(%0 + 4)
    %5 = *(%1 + 4)
    %6 = (%4 - %5)
    %7 = *(%0 + 8)
    %8 = *(%1 + 8)
    %9 = (%7 - %8)
    %11 = *(%3 + 0)
    parm %3
    parm %6
    parm %9
    %10 = call %11
    return %10
}

FUNC<_Complex.sub._entry> {
    parm %1
    parm %2
    %2 = call _Complex.sub
    return %2
}

FUNC<_Complex.mul> {
    %2 = FUNC<_Complex.make._entry>
    parm 4
    %3 = call _Alloc
    *(%3 + 0) = %2
    %4 = *(%0 + 4)
    %5 = *(%1 + 4)
    %6 = (%4 * %5)
    %7 = *(%0 + 8)
    %8 = *(%1 + 8)
    %9 = (%7 * %8)
    %10 = (%6 - %9)
    %11 = (4096 == 0)
    if (%11 == 0) branch %0
    %12 = "Decaf runtime error: Division by zero error"
    parm %12
    call _PrintString
    call _Halt
    %0:
    %13 = (%10 / 4096)
    %14 = *(%0 + 4)
    %15 = *(%1 + 8)
    %16 = (%14 * %15)
    %17 = *(%0 + 8)
    %18 = *(%1 + 4)
    %19 = (%17 * %18)
    %20 = (%16 + %19)
    %21 = (4096 == 0)
    if (%21 == 0) branch %1
    %22 = "Decaf runtime error: Division by zero error"
    parm %22
    call _PrintString
    call _Halt
    %1:
    %23 = (%20 / 4096)
    %25 = *(%3 + 0)
    parm %3
    parm %13
    parm %23
    %24 = call %25
    return %24
}

FUNC<_Complex.mul._entry> {
    parm %1
    parm %2
    %2 = call _Complex.mul
    return %2
}

FUNC<_Complex.abs2> {
    %1 = *(%0 + 4)
    %2 = *(%0 + 4)
    %3 = (%1 * %2)
    %4 = *(%0 + 8)
    %5 = *(%0 + 8)
    %6 = (%4 * %5)
    %7 = (%3 + %6)
    return %7
}

FUNC<_Complex.abs2._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 8)
    parm %2
    %1 = call %3
    return %1
}

FUNC<main> {
    %0 = 51
    %1 = 4096
    %3 = - 2
    %4 = (%3 * %1)
    %2 = %4
    %6 = (4 * %1)
    %7 = (%0 - 1)
    %8 = (%7 == 0)
    if (%8 == 0) branch %0
    %9 = "Decaf runtime error: Division by zero error"
    parm %9
    call _PrintString
    call _Halt
    %0:
    %10 = (%6 / %7)
    %5 = %10
    %12 = (%0 < 0)
    if (%12 == 0) branch %1
    %14 = "Decaf runtime error: Cannot create negative-sized array\n"
    parm %14
    call _PrintString
    call _Halt
    %1:
    %13 = (%0 * 4)
    %13 = (%13 + 4)
    parm %13
    %15 = call _Alloc
    %13 = (%15 + %13)
    %15 = (%15 + 4)
    branch %2
    %3:
    %13 = (%13 - 4)
    *(%13 + 0) = 0
    %2:
    %12 = (%13 == %15)
    if (%12 == 0) branch %3
    *(%15 - 4) = %0
    %11 = %15
    %17 = (%0 < 0)
    if (%17 == 0) branch %4
    %19 = "Decaf runtime error: Cannot create negative-sized array\n"
    parm %19
    call _PrintString
    call _Halt
    %4:
    %18 = (%0 * 4)
    %18 = (%18 + 4)
    parm %18
    %20 = call _Alloc
    %18 = (%20 + %18)
    %20 = (%20 + 4)
    branch %5
    %6:
    %18 = (%18 - 4)
    *(%18 + 0) = 0
    %5:
    %17 = (%18 == %20)
    if (%17 == 0) branch %6
    *(%20 - 4) = %0
    %16 = %20
    %21 = 0
    branch %7
    %8:
    %22 = (%0 < 0)
    if (%22 == 0) branch %10
    %24 = "Decaf runtime error: Cannot create negative-sized array\n"
    parm %24
    call _PrintString
    call _Halt
    %10:
    %23 = (%0 * 4)
    %23 = (%23 + 4)
    parm %23
    %25 = call _Alloc
    %23 = (%25 + %23)
    %25 = (%25 + 4)
    branch %11
    %12:
    %23 = (%23 - 4)
    *(%23 + 0) = 0
    %11:
    %22 = (%23 == %25)
    if (%22 == 0) branch %12
    *(%25 - 4) = %0
    parm 8
    %27 = call _Alloc
    %28 = FUNC<length>
    *(%27 + 0) = %28
    *(%27 + 4) = %11
    %26 = (%21 >= 0)
    %29 = (%21 < %27)
    %26 = (%26 && %29)
    if (%26 == 0) branch %13
    %30 = (%21 * 4)
    %30 = (%30 + %11)
    *(%30 + 0) = %25
    branch %14
    %13:
    %31 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %31
    call _PrintString
    call _Halt
    %14:
    %32 = (%0 < 0)
    if (%32 == 0) branch %15
    %34 = "Decaf runtime error: Cannot create negative-sized array\n"
    parm %34
    call _PrintString
    call _Halt
    %15:
    %33 = (%0 * 4)
    %33 = (%33 + 4)
    parm %33
    %35 = call _Alloc
    %33 = (%35 + %33)
    %35 = (%35 + 4)
    branch %16
    %17:
    %33 = (%33 - 4)
    *(%33 + 0) = 0
    %16:
    %32 = (%33 == %35)
    if (%32 == 0) branch %17
    *(%35 - 4) = %0
    parm 8
    %37 = call _Alloc
    %38 = FUNC<length>
    *(%37 + 0) = %38
    *(%37 + 4) = %16
    %36 = (%21 >= 0)
    %39 = (%21 < %37)
    %36 = (%36 && %39)
    if (%36 == 0) branch %18
    %40 = (%21 * 4)
    %40 = (%40 + %16)
    *(%40 + 0) = %35
    branch %19
    %18:
    %41 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %41
    call _PrintString
    call _Halt
    %19:
    %42 = 0
    branch %20
    %21:
    %43 = FUNC<_Complex.make._entry>
    parm 4
    %44 = call _Alloc
    *(%44 + 0) = %43
    %45 = (%42 * %5)
    %46 = (%2 + %45)
    %47 = (%21 * %5)
    %48 = (%2 + %47)
    %50 = *(%44 + 0)
    parm %44
    parm %46
    parm %48
    %49 = call %50
    parm 8
    %52 = call _Alloc
    %53 = FUNC<length>
    *(%52 + 0) = %53
    *(%52 + 4) = %11
    %51 = (%21 >= 0)
    %54 = (%21 < %52)
    %51 = (%51 && %54)
    if (%51 == 0) branch %23
    %55 = (%21 * 4)
    %55 = (%55 + %11)
    %56 = *(%55 + 0)
    branch %24
    %23:
    %57 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %57
    call _PrintString
    call _Halt
    %24:
    parm 8
    %59 = call _Alloc
    %60 = FUNC<length>
    *(%59 + 0) = %60
    *(%59 + 4) = %56
    %58 = (%42 >= 0)
    %61 = (%42 < %59)
    %58 = (%58 && %61)
    if (%58 == 0) branch %25
    %62 = (%42 * 4)
    %62 = (%62 + %56)
    *(%62 + 0) = %49
    branch %26
    %25:
    %63 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %63
    call _PrintString
    call _Halt
    %26:
    %64 = call _Complex._new
    parm 8
    %66 = call _Alloc
    %67 = FUNC<length>
    *(%66 + 0) = %67
    *(%66 + 4) = %16
    %65 = (%21 >= 0)
    %68 = (%21 < %66)
    %65 = (%65 && %68)
    if (%65 == 0) branch %27
    %69 = (%21 * 4)
    %69 = (%69 + %16)
    %70 = *(%69 + 0)
    branch %28
    %27:
    %71 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %71
    call _PrintString
    call _Halt
    %28:
    parm 8
    %73 = call _Alloc
    %74 = FUNC<length>
    *(%73 + 0) = %74
    *(%73 + 4) = %70
    %72 = (%42 >= 0)
    %75 = (%42 < %73)
    %72 = (%72 && %75)
    if (%72 == 0) branch %29
    %76 = (%42 * 4)
    %76 = (%76 + %70)
    *(%76 + 0) = %64
    branch %30
    %29:
    %77 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %77
    call _PrintString
    call _Halt
    %30:
    %78 = (%42 + 1)
    %42 = %78
    %20:
    %79 = (%42 < %0)
    if (%79 != 0) branch %21
    %22:
    %80 = (%21 + 1)
    %21 = %80
    %7:
    %81 = (%21 < %0)
    if (%81 != 0) branch %8
    %9:
    %82 = 0
    branch %31
    %32:
    %83 = 0
    branch %34
    %35:
    %84 = 0
    branch %37
    %38:
    parm 8
    %87 = call _Alloc
    %88 = FUNC<length>
    *(%87 + 0) = %88
    *(%87 + 4) = %16
    %86 = (%83 >= 0)
    %89 = (%83 < %87)
    %86 = (%86 && %89)
    if (%86 == 0) branch %40
    %90 = (%83 * 4)
    %90 = (%90 + %16)
    %91 = *(%90 + 0)
    branch %41
    %40:
    %92 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %92
    call _PrintString
    call _Halt
    %41:
    parm 8
    %94 = call _Alloc
    %95 = FUNC<length>
    *(%94 + 0) = %95
    *(%94 + 4) = %91
    %93 = (%84 >= 0)
    %96 = (%84 < %94)
    %93 = (%93 && %96)
    if (%93 == 0) branch %42
    %97 = (%84 * 4)
    %97 = (%97 + %91)
    %98 = *(%97 + 0)
    branch %43
    %42:
    %99 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %99
    call _PrintString
    call _Halt
    %43:
    %85 = %98
    %100 = FUNC<_Complex.abs2._entry>
    parm 8
    %101 = call _Alloc
    *(%101 + 0) = %100
    *(%101 + 4) = %85
    %103 = *(%101 + 0)
    parm %101
    %102 = call %103
    %104 = (4 * %1)
    %105 = (%104 * %1)
    %106 = (%102 < %105)
    if (%106 == 0) branch %44
    %107 = FUNC<_Complex.add._entry>
    parm 4
    %108 = call _Alloc
    *(%108 + 0) = %107
    %109 = FUNC<_Complex.mul._entry>
    parm 4
    %110 = call _Alloc
    *(%110 + 0) = %109
    %112 = *(%110 + 0)
    parm %110
    parm %85
    parm %85
    %111 = call %112
    parm 8
    %114 = call _Alloc
    %115 = FUNC<length>
    *(%114 + 0) = %115
    *(%114 + 4) = %11
    %113 = (%83 >= 0)
    %116 = (%83 < %114)
    %113 = (%113 && %116)
    if (%113 == 0) branch %45
    %117 = (%83 * 4)
    %117 = (%117 + %11)
    %118 = *(%117 + 0)
    branch %46
    %45:
    %119 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %119
    call _PrintString
    call _Halt
    %46:
    parm 8
    %121 = call _Alloc
    %122 = FUNC<length>
    *(%121 + 0) = %122
    *(%121 + 4) = %118
    %120 = (%84 >= 0)
    %123 = (%84 < %121)
    %120 = (%120 && %123)
    if (%120 == 0) branch %47
    %124 = (%84 * 4)
    %124 = (%124 + %118)
    %125 = *(%124 + 0)
    branch %48
    %47:
    %126 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %126
    call _PrintString
    call _Halt
    %48:
    %128 = *(%108 + 0)
    parm %108
    parm %111
    parm %125
    %127 = call %128
    parm 8
    %130 = call _Alloc
    %131 = FUNC<length>
    *(%130 + 0) = %131
    *(%130 + 4) = %16
    %129 = (%83 >= 0)
    %132 = (%83 < %130)
    %129 = (%129 && %132)
    if (%129 == 0) branch %49
    %133 = (%83 * 4)
    %133 = (%133 + %16)
    %134 = *(%133 + 0)
    branch %50
    %49:
    %135 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %135
    call _PrintString
    call _Halt
    %50:
    parm 8
    %137 = call _Alloc
    %138 = FUNC<length>
    *(%137 + 0) = %138
    *(%137 + 4) = %134
    %136 = (%84 >= 0)
    %139 = (%84 < %137)
    %136 = (%136 && %139)
    if (%136 == 0) branch %51
    %140 = (%84 * 4)
    %140 = (%140 + %134)
    *(%140 + 0) = %127
    branch %52
    %51:
    %141 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %141
    call _PrintString
    call _Halt
    %52:
    %44:
    %142 = (%84 + 1)
    %84 = %142
    %37:
    %143 = (%84 < %0)
    if (%143 != 0) branch %38
    %39:
    %144 = (%83 + 1)
    %83 = %144
    %34:
    %145 = (%83 < %0)
    if (%145 != 0) branch %35
    %36:
    %146 = (%82 + 1)
    %82 = %146
    %31:
    %147 = (%82 < 20)
    if (%147 != 0) branch %32
    %33:
    %148 = 0
    branch %53
    %54:
    %149 = 0
    branch %56
    %57:
    %150 = FUNC<_Complex.abs2._entry>
    parm 8
    %152 = call _Alloc
    %153 = FUNC<length>
    *(%152 + 0) = %153
    *(%152 + 4) = %16
    %151 = (%148 >= 0)
    %154 = (%148 < %152)
    %151 = (%151 && %154)
    if (%151 == 0) branch %60
    %155 = (%148 * 4)
    %155 = (%155 + %16)
    %156 = *(%155 + 0)
    branch %61
    %60:
    %157 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %157
    call _PrintString
    call _Halt
    %61:
    parm 8
    %159 = call _Alloc
    %160 = FUNC<length>
    *(%159 + 0) = %160
    *(%159 + 4) = %156
    %158 = (%149 >= 0)
    %161 = (%149 < %159)
    %158 = (%158 && %161)
    if (%158 == 0) branch %62
    %162 = (%149 * 4)
    %162 = (%162 + %156)
    %163 = *(%162 + 0)
    branch %63
    %62:
    %164 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %164
    call _PrintString
    call _Halt
    %63:
    parm 8
    %165 = call _Alloc
    *(%165 + 0) = %150
    *(%165 + 4) = %163
    %167 = *(%165 + 0)
    parm %165
    %166 = call %167
    %168 = (4 * %1)
    %169 = (%168 * %1)
    %170 = (%166 < %169)
    if (%170 == 0) branch %59
    %171 = "**"
    parm %171
    call _PrintString
    branch %64
    %59:
    %172 = "  "
    parm %172
    call _PrintString
    %64:
    %173 = (%149 + 1)
    %149 = %173
    %56:
    %174 = (%149 < %0)
    if (%174 != 0) branch %57
    %58:
    %175 = "\n"
    parm %175
    call _PrintString
    %176 = (%148 + 1)
    %148 = %176
    %53:
    %177 = (%148 < %0)
    if (%177 != 0) branch %54
    %55:
    return
}

FUNC<main._entry> {
    call main
    return
}

