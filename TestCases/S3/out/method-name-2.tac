VTBL<_Main> {
    0
    "Main"
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
    %0 = FUNC<_Main.double._entry>
    parm 4
    %1 = call _Alloc
    *(%1 + 0) = %0
    %2 = FUNC<_Main.print._entry>
    parm 4
    %3 = call _Alloc
    *(%3 + 0) = %2
    %4 = *(%1 + 0)
    parm %1
    parm %3
    call %4
    %5 = FUNC<_Main.filter._entry>
    parm 4
    %6 = call _Alloc
    *(%6 + 0) = %5
    %7 = FUNC<_Main.printi._entry>
    parm 4
    %8 = call _Alloc
    *(%8 + 0) = %7
    %9 = FUNC<_Main.even._entry>
    parm 4
    %10 = call _Alloc
    *(%10 + 0) = %9
    %11 = *(%6 + 0)
    parm %6
    parm %8
    parm %10
    parm 10
    call %11
    return
}

FUNC<main._entry> {
    call main
    return
}

FUNC<_Main.print> {
    %0 = "hello\n"
    parm %0
    call _PrintString
    return
}

FUNC<_Main.print._entry> {
    call _Main.print
    return
}

FUNC<_Main.printi> {
    parm %0
    call _PrintInt
    %1 = " "
    parm %1
    call _PrintString
    return
}

FUNC<_Main.printi._entry> {
    parm %1
    call _Main.printi
    return
}

FUNC<_Main.double> {
    %2 = *(%0 + 0)
    parm %0
    %1 = call %2
    %4 = *(%0 + 0)
    parm %0
    %3 = call %4
    return
}

FUNC<_Main.double._entry> {
    parm %1
    call _Main.double
    return
}

FUNC<_Main.even> {
    %1 = (2 == 0)
    if (%1 == 0) branch %0
    %2 = "Decaf runtime error: Division by zero error"
    parm %2
    call _PrintString
    call _Halt
    %0:
    %3 = (%0 % 2)
    %4 = (%3 == 0)
    return %4
}

FUNC<_Main.even._entry> {
    parm %1
    %1 = call _Main.even
    return %1
}

FUNC<_Main.filter> {
    %3 = 0
    branch %0
    %1:
    %5 = *(%1 + 0)
    parm %1
    parm %3
    %4 = call %5
    if (%4 == 0) branch %3
    %7 = *(%0 + 0)
    parm %0
    parm %3
    %6 = call %7
    %3:
    %8 = (%3 + 1)
    %3 = %8
    %0:
    %9 = (%3 < %2)
    if (%9 != 0) branch %1
    %2:
    return
}

FUNC<_Main.filter._entry> {
    parm %1
    parm %2
    parm %3
    call _Main.filter
    return
}

