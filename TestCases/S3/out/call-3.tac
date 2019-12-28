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

FUNC<_Main.add1> {
    %1 = (24 + %0)
    return %1
}

FUNC<_Main.add1._entry> {
    parm %1
    %2 = call _Main.add1
    return %2
}

FUNC<_Main.add2> {
    %1 = (26 + %0)
    return %1
}

FUNC<_Main.add2._entry> {
    parm %1
    %2 = call _Main.add2
    return %2
}

FUNC<_Main.genadd> {
    %1 = (%0 < 25)
    if (%1 == 0) branch %0
    %2 = FUNC<_Main.add1._entry>
    parm 4
    %3 = call _Alloc
    *(%3 + 0) = %2
    return %3
    branch %1
    %0:
    %4 = FUNC<_Main.add2._entry>
    parm 4
    %5 = call _Alloc
    *(%5 + 0) = %4
    return %5
    %1:
}

FUNC<_Main.genadd._entry> {
    parm %1
    %2 = call _Main.genadd
    return %2
}

FUNC<main> {
    parm 4
    %1 = call _Alloc
    %2 = FUNC<lambda_18_17>
    *(%1 + 0) = %2
    %0 = %1
    %4 = *(%0 + 0)
    parm %0
    parm 24
    %3 = call %4
    %6 = *(%3 + 0)
    parm %3
    parm 24
    %5 = call %6
    parm %5
    call _PrintInt
    %8 = *(%0 + 0)
    parm %0
    parm 26
    %7 = call %8
    %10 = *(%7 + 0)
    parm %7
    parm 26
    %9 = call %10
    parm %9
    call _PrintInt
    return
}

FUNC<main._entry> {
    call main
    return
}

FUNC<lambda_18_17> {
    %2 = FUNC<_Main.genadd._entry>
    parm 4
    %3 = call _Alloc
    *(%3 + 0) = %2
    %5 = *(%3 + 0)
    parm %3
    parm %1
    %4 = call %5
    return %4
}

