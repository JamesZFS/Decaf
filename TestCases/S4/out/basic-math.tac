VTBL<_Maths> {
    0
    "Maths"
}

VTBL<_Main> {
    0
    "Main"
}

FUNC<_Maths._new> {
    parm 4
    %0 = call _Alloc
    %1 = VTBL<_Maths>
    *(%0 + 0) = %1
    return %0
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

FUNC<_Maths.abs> {
    %1 = (%0 >= 0)
    if (%1 == 0) branch %2
    return %0
    %2:
    %2 = - %0
    return %2
}

FUNC<_Maths.abs._entry> {
    parm %1
    %2 = call _Maths.abs
    return %2
}

FUNC<_Maths.pow> {
    %2 = 1
    %3 = 0
    branch %2
    %1:
    %4 = (%2 * %0)
    %2 = %4
    %5 = (%3 + 1)
    %3 = %5
    %2:
    %6 = (%3 < %1)
    if (%6 != 0) branch %1
    return %2
}

FUNC<_Maths.pow._entry> {
    parm %1
    parm %2
    %3 = call _Maths.pow
    return %3
}

FUNC<_Maths.log> {
    %1 = (%0 < 1)
    if (%1 == 0) branch %2
    return -1
    %2:
    %3 = 0
    branch %5
    %3:
    %4 = (%3 + 1)
    %3 = %4
    %7 = (%0 / 2)
    %0 = %7
    %5:
    %8 = (%0 > 1)
    if (%8 != 0) branch %3
    return %3
}

FUNC<_Maths.log._entry> {
    parm %1
    %2 = call _Maths.log
    return %2
}

FUNC<_Maths.max> {
    %2 = (%0 > %1)
    if (%2 == 0) branch %2
    return %0
    %2:
    return %1
}

FUNC<_Maths.max._entry> {
    parm %1
    parm %2
    %3 = call _Maths.max
    return %3
}

FUNC<_Maths.min> {
    %2 = (%0 < %1)
    if (%2 == 0) branch %2
    return %0
    %2:
    return %1
}

FUNC<_Maths.min._entry> {
    parm %1
    parm %2
    %3 = call _Maths.min
    return %3
}

FUNC<main> {
    %0 = FUNC<_Maths.abs._entry>
    parm 4
    %1 = call _Alloc
    *(%1 + 0) = %0
    %4 = *(%1 + 0)
    parm %1
    parm -1
    %3 = call %4
    parm %3
    call _PrintInt
    %5 = "\n"
    parm %5
    call _PrintString
    %6 = FUNC<_Maths.pow._entry>
    parm 4
    %7 = call _Alloc
    *(%7 + 0) = %6
    %9 = *(%7 + 0)
    parm %7
    parm 2
    parm 3
    %8 = call %9
    parm %8
    call _PrintInt
    %10 = "\n"
    parm %10
    call _PrintString
    %11 = FUNC<_Maths.log._entry>
    parm 4
    %12 = call _Alloc
    *(%12 + 0) = %11
    %14 = *(%12 + 0)
    parm %12
    parm 16
    %13 = call %14
    parm %13
    call _PrintInt
    %15 = "\n"
    parm %15
    call _PrintString
    %16 = FUNC<_Maths.max._entry>
    parm 4
    %17 = call _Alloc
    *(%17 + 0) = %16
    %19 = *(%17 + 0)
    parm %17
    parm 1
    parm 2
    %18 = call %19
    parm %18
    call _PrintInt
    %20 = "\n"
    parm %20
    call _PrintString
    %21 = FUNC<_Maths.min._entry>
    parm 4
    %22 = call _Alloc
    *(%22 + 0) = %21
    %24 = *(%22 + 0)
    parm %22
    parm 1
    parm 2
    %23 = call %24
    parm %23
    call _PrintInt
    %25 = "\n"
    parm %25
    call _PrintString
    return
}

FUNC<main._entry> {
    call main
    return
}

