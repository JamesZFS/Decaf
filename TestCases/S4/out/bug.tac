VTBL<_Main> {
    0
    "Main"
    FUNC<_Main.f>
    FUNC<_Main.g>
}

FUNC<_Main._new> {
    parm 4
    %0 = call _Alloc
    %1 = VTBL<_Main>
    *(%0 + 0) = %1
    return %0
}

FUNC<length> {
    %1 = *(%0 + 4)
    %1 = *(%1 - 4)
    return %1
}

FUNC<main> {
    %1 = call _Main._new
    %2 = FUNC<_Main.f._entry>
    parm 8
    %3 = call _Alloc
    *(%3 + 0) = %2
    *(%3 + 4) = %1
    %4 = *(%3 + 0)
    parm %3
    call %4
    return
}

FUNC<main._entry> {
    call main
    return
}

FUNC<_Main.f> {
    parm 44
    %5 = call _Alloc
    %3 = (%5 + 44)
    %5 = (%5 + 4)
    branch %3
    %2:
    %3 = (%3 - 4)
    *(%3 + 0) = 0
    %3:
    %2 = (%3 == %5)
    if (%2 == 0) branch %2
    *(%5 - 4) = 10
    %25 = *(%5 - 4)
    %28 = (1 < %25)
    %30 = (1 && %28)
    if (%30 == 0) branch %6
    %29 = (4 + %5)
    %10 = *(%29 + 0)
    branch %7
    %6:
    %11 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %11
    call _PrintString
    call _Halt
    %7:
    parm %10
    call _PrintInt
    %12 = "\n"
    parm %12
    call _PrintString
    parm 8
    %14 = call _Alloc
    %15 = FUNC<lambda_13_20>
    *(%14 + 0) = %15
    *(%14 + 4) = %5
    %17 = *(%14 + 0)
    parm %14
    call %17
    if (%30 == 0) branch %9
    %22 = *(%29 + 0)
    branch %10
    %9:
    %23 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %23
    call _PrintString
    call _Halt
    %10:
    parm %22
    call _PrintInt
    %24 = "\n"
    parm %24
    call _PrintString
    return
}

FUNC<_Main.f._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 8)
    parm %1
    call %2
    return
}

FUNC<_Main.g> {
    %3 = *(%1 - 4)
    %4 = (1 < %3)
    %2 = (1 && %4)
    if (%2 == 0) branch %2
    %5 = (4 + %1)
    *(%5 + 0) = 1
    branch %3
    %2:
    %6 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %6
    call _PrintString
    call _Halt
    %3:
    return
}

FUNC<_Main.g._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 12)
    parm %2
    parm %1
    call %3
    return
}

FUNC<lambda_13_20> {
    %1 = *(%0 + 4)
    %3 = *(%1 - 4)
    %4 = (1 < %3)
    %2 = (1 && %4)
    if (%2 == 0) branch %2
    %5 = (4 + %1)
    *(%5 + 0) = 1
    branch %3
    %2:
    %6 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %6
    call _PrintString
    call _Halt
    %3:
    return
}

