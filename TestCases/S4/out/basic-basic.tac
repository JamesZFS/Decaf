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
    %4 = "Hello THU"
    parm 2
    call _PrintInt
    %5 = "\n"
    parm %5
    call _PrintString
    parm 3
    call _PrintInt
    %6 = "\n"
    parm %6
    call _PrintString
    parm 5
    call _PrintInt
    %8 = "\n"
    parm %8
    call _PrintString
    parm 6
    call _PrintInt
    %10 = "\n"
    parm %10
    call _PrintString
    parm 1
    call _PrintBool
    %11 = "\n"
    parm %11
    call _PrintString
    parm %4
    call _PrintString
    %12 = "\n"
    parm %12
    call _PrintString
    return
}

FUNC<main._entry> {
    call main
    return
}

