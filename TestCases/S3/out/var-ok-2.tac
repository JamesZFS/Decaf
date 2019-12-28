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

FUNC<_Main.f> {
    %3 = "zjm1926"
    %2 = %3
    %5 = "glgjssy qyhfbqz"
    %4 = %5
    %7 = "xgjz"
    %6 = %7
    %8 = 0
    %9 = %0
    branch %0
    %1:
    %10 = (%8 + %9)
    %8 = %10
    %11 = (%9 + 1)
    %9 = %11
    %0:
    %12 = (%9 < %1)
    if (%12 != 0) branch %1
    %2:
    return %8
}

FUNC<_Main.f._entry> {
    parm %1
    parm %2
    %2 = call _Main.f
    return %2
}

FUNC<main> {
    %0 = 1
    %1 = 10
    %2 = FUNC<_Main.f._entry>
    parm 4
    %3 = call _Alloc
    *(%3 + 0) = %2
    %5 = *(%3 + 0)
    parm %3
    parm %0
    parm %1
    %4 = call %5
    parm %4
    call _PrintInt
    return
}

FUNC<main._entry> {
    call main
    return
}

