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
    %6 = (%0 % 32768)
    *(%3 + 4) = %6
    %9 = (%1 % 32768)
    *(%3 + 8) = %9
    return %3
}

FUNC<_Complex.make._entry> {
    parm %1
    parm %2
    %3 = call _Complex.make
    return %3
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
    %3 = call _Complex.add
    return %3
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
    %3 = call _Complex.sub
    return %3
}

FUNC<_Complex.mul> {
    %2 = FUNC<_Complex.make._entry>
    parm 4
    %3 = call _Alloc
    *(%3 + 0) = %2
    %26 = *(%0 + 4)
    %29 = *(%1 + 4)
    %6 = (%26 * %29)
    %28 = *(%0 + 8)
    %27 = *(%1 + 8)
    %9 = (%28 * %27)
    %10 = (%6 - %9)
    %13 = (%10 / 4096)
    %16 = (%26 * %27)
    %19 = (%28 * %29)
    %20 = (%16 + %19)
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
    %3 = call _Complex.mul
    return %3
}

FUNC<_Complex.abs2> {
    %8 = *(%0 + 4)
    %3 = (%8 * %8)
    %9 = *(%0 + 8)
    %6 = (%9 * %9)
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
    parm 208
    %15 = call _Alloc
    %13 = (%15 + 208)
    %15 = (%15 + 4)
    branch %4
    %3:
    %13 = (%13 - 4)
    *(%13 + 0) = 0
    %4:
    %12 = (%13 == %15)
    if (%12 == 0) branch %3
    *(%15 - 4) = 51
    parm 208
    %20 = call _Alloc
    %18 = (%20 + 208)
    %20 = (%20 + 4)
    branch %8
    %7:
    %18 = (%18 - 4)
    *(%18 + 0) = 0
    %8:
    %17 = (%18 == %20)
    if (%17 == 0) branch %7
    *(%20 - 4) = 51
    %21 = 0
    branch %40
    %10:
    parm 208
    %25 = call _Alloc
    %23 = (%25 + 208)
    %25 = (%25 + 4)
    branch %13
    %12:
    %23 = (%23 - 4)
    *(%23 + 0) = 0
    %13:
    %22 = (%23 == %25)
    if (%22 == 0) branch %12
    *(%25 - 4) = 51
    %172 = *(%15 - 4)
    %170 = (%21 >= 0)
    %191 = (%21 < %172)
    %195 = (%170 && %191)
    if (%195 == 0) branch %16
    %171 = (%21 * 4)
    %196 = (%171 + %15)
    *(%196 + 0) = %25
    branch %17
    %16:
    %30 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %30
    call _PrintString
    call _Halt
    %17:
    parm 208
    %34 = call _Alloc
    %32 = (%34 + 208)
    %34 = (%34 + 4)
    branch %20
    %19:
    %32 = (%32 - 4)
    *(%32 + 0) = 0
    %20:
    %31 = (%32 == %34)
    if (%31 == 0) branch %19
    *(%34 - 4) = 51
    %175 = *(%20 - 4)
    %192 = (%21 < %175)
    %197 = (%170 && %192)
    if (%197 == 0) branch %23
    %198 = (%171 + %20)
    *(%198 + 0) = %34
    branch %24
    %23:
    %39 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %39
    call _PrintString
    call _Halt
    %24:
    %40 = 0
    branch %38
    %25:
    %41 = FUNC<_Complex.make._entry>
    parm 4
    %42 = call _Alloc
    *(%42 + 0) = %41
    %43 = (%40 * 327)
    %44 = (-8192 + %43)
    %45 = (%21 * 327)
    %46 = (-8192 + %45)
    %48 = *(%42 + 0)
    parm %42
    parm %44
    parm %46
    %47 = call %48
    if (%195 == 0) branch %27
    %53 = *(%196 + 0)
    branch %28
    %27:
    %54 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %54
    call _PrintString
    call _Halt
    %28:
    %56 = *(%53 - 4)
    %178 = (%40 >= 0)
    %57 = (%40 < %56)
    %55 = (%178 && %57)
    if (%55 == 0) branch %30
    %179 = (%40 * 4)
    %58 = (%179 + %53)
    *(%58 + 0) = %47
    branch %31
    %30:
    %59 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %59
    call _PrintString
    call _Halt
    %31:
    %60 = call _Complex._new
    if (%197 == 0) branch %33
    %65 = *(%198 + 0)
    branch %34
    %33:
    %66 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %66
    call _PrintString
    call _Halt
    %34:
    %68 = *(%65 - 4)
    %69 = (%40 < %68)
    %67 = (%178 && %69)
    if (%67 == 0) branch %36
    %70 = (%179 + %65)
    *(%70 + 0) = %60
    branch %37
    %36:
    %71 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %71
    call _PrintString
    call _Halt
    %37:
    %72 = (%40 + 1)
    %40 = %72
    %38:
    %73 = (%40 < 51)
    if (%73 != 0) branch %25
    %74 = (%21 + 1)
    %21 = %74
    %40:
    %75 = (%21 < 51)
    if (%75 != 0) branch %10
    %76 = 0
    branch %68
    %42:
    %77 = 0
    branch %66
    %43:
    %78 = 0
    branch %64
    %44:
    %185 = *(%20 - 4)
    %181 = (%77 >= 0)
    %193 = (%77 < %185)
    %199 = (%181 && %193)
    if (%199 == 0) branch %46
    %182 = (%77 * 4)
    %194 = (%182 + %20)
    %200 = *(%194 + 0)
    branch %47
    %46:
    %85 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %85
    call _PrintString
    call _Halt
    %47:
    %201 = *(%200 - 4)
    %183 = (%78 >= 0)
    %203 = (%78 < %201)
    %204 = (%183 && %203)
    if (%204 == 0) branch %49
    %184 = (%78 * 4)
    %202 = (%184 + %200)
    %90 = *(%202 + 0)
    branch %50
    %49:
    %91 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %91
    call _PrintString
    call _Halt
    %50:
    %92 = FUNC<_Complex.abs2._entry>
    parm 8
    %93 = call _Alloc
    *(%93 + 0) = %92
    *(%93 + 4) = %90
    %95 = *(%93 + 0)
    parm %93
    %94 = call %95
    %98 = (%94 < 67108864)
    if (%98 == 0) branch %63
    %99 = FUNC<_Complex.add._entry>
    parm 4
    %100 = call _Alloc
    *(%100 + 0) = %99
    %101 = FUNC<_Complex.mul._entry>
    parm 4
    %102 = call _Alloc
    *(%102 + 0) = %101
    %104 = *(%102 + 0)
    parm %102
    parm %90
    parm %90
    %103 = call %104
    %106 = *(%15 - 4)
    %107 = (%77 < %106)
    %105 = (%181 && %107)
    if (%105 == 0) branch %53
    %108 = (%182 + %15)
    %109 = *(%108 + 0)
    branch %54
    %53:
    %110 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %110
    call _PrintString
    call _Halt
    %54:
    %112 = *(%109 - 4)
    %113 = (%78 < %112)
    %111 = (%183 && %113)
    if (%111 == 0) branch %56
    %114 = (%184 + %109)
    %115 = *(%114 + 0)
    branch %57
    %56:
    %116 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %116
    call _PrintString
    call _Halt
    %57:
    %118 = *(%100 + 0)
    parm %100
    parm %103
    parm %115
    %117 = call %118
    if (%199 == 0) branch %59
    branch %60
    %59:
    %124 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %124
    call _PrintString
    call _Halt
    %60:
    if (%204 == 0) branch %62
    *(%202 + 0) = %117
    branch %63
    %62:
    %129 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %129
    call _PrintString
    call _Halt
    %63:
    %130 = (%78 + 1)
    %78 = %130
    %64:
    %131 = (%78 < 51)
    if (%131 != 0) branch %44
    %132 = (%77 + 1)
    %77 = %132
    %66:
    %133 = (%77 < 51)
    if (%133 != 0) branch %43
    %134 = (%76 + 1)
    %76 = %134
    %68:
    %135 = (%76 < 20)
    if (%135 != 0) branch %42
    %136 = 0
    branch %83
    %70:
    %137 = 0
    branch %81
    %71:
    %138 = FUNC<_Complex.abs2._entry>
    %140 = *(%20 - 4)
    %139 = (%136 >= 0)
    %141 = (%136 < %140)
    %139 = (%139 && %141)
    if (%139 == 0) branch %73
    %142 = (%136 * 4)
    %142 = (%142 + %20)
    %143 = *(%142 + 0)
    branch %74
    %73:
    %144 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %144
    call _PrintString
    call _Halt
    %74:
    %146 = *(%143 - 4)
    %145 = (%137 >= 0)
    %147 = (%137 < %146)
    %145 = (%145 && %147)
    if (%145 == 0) branch %76
    %148 = (%137 * 4)
    %148 = (%148 + %143)
    %149 = *(%148 + 0)
    branch %77
    %76:
    %150 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %150
    call _PrintString
    call _Halt
    %77:
    parm 8
    %151 = call _Alloc
    *(%151 + 0) = %138
    *(%151 + 4) = %149
    %153 = *(%151 + 0)
    parm %151
    %152 = call %153
    %156 = (%152 < 67108864)
    if (%156 == 0) branch %79
    %157 = "**"
    parm %157
    call _PrintString
    branch %80
    %79:
    %158 = "  "
    parm %158
    call _PrintString
    %80:
    %159 = (%137 + 1)
    %137 = %159
    %81:
    %160 = (%137 < 51)
    if (%160 != 0) branch %71
    %161 = "\n"
    parm %161
    call _PrintString
    %162 = (%136 + 1)
    %136 = %162
    %83:
    %163 = (%136 < 51)
    if (%163 != 0) branch %70
    return
}

FUNC<main._entry> {
    call main
    return
}

