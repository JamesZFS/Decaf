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
    %0 = 0
    %1 = "testing division by 0 runtime error1\n"
    parm %1
    call _PrintString
    %2 = (0 == 0)
    if (%2 == 0) branch %0
    %3 = "Decaf runtime error: Division by zero error"
    parm %3
    call _PrintString
    call _Halt
    %0:
    %0 = 0
    %4 = "end"
    parm %4
    call _PrintString
    return
}

FUNC<main._entry> {
    call main
    return
}

