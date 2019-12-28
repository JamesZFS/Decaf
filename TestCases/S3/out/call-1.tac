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
    %1 = (%0 + 2)
    return %1
}

FUNC<_Main.f._entry> {
    parm %1
    %1 = call _Main.f
    return %1
}

FUNC<_Main.genadd> {
    %0 = FUNC<_Main.f._entry>
    parm 4
    %1 = call _Alloc
    *(%1 + 0) = %0
    return %1
}

FUNC<_Main.genadd._entry> {
    %0 = call _Main.genadd
    return %0
}

FUNC<main> {
    %1 = FUNC<_Main.genadd._entry>
    parm 4
    %2 = call _Alloc
    *(%2 + 0) = %1
    %4 = *(%2 + 0)
    parm %2
    %3 = call %4
    %0 = %3
    %5 = FUNC<_Main.f._entry>
    parm 4
    %6 = call _Alloc
    *(%6 + 0) = %5
    %8 = *(%6 + 0)
    parm %6
    parm 2
    %7 = call %8
    parm %7
    call _PrintInt
    %9 = FUNC<_Main.f._entry>
    parm 4
    %10 = call _Alloc
    *(%10 + 0) = %9
    %12 = *(%10 + 0)
    parm %10
    parm 4
    %11 = call %12
    parm %11
    call _PrintInt
    return
}

FUNC<main._entry> {
    call main
    return
}

