VTBL<_Main> {
    0
    "Main"
    FUNC<_Main.foo>
}

FUNC<_Main._new> {
    parm 8
    %0 = call _Alloc
    %1 = VTBL<_Main>
    *(%0 + 0) = %1
    *(%0 + 4) = 0
    return %0
}

FUNC<length> {
    %1 = *(%0 + 4)
    %1 = *(%1 - 4)
    return %1
}

FUNC<main> {
    %0 = FUNC<_Main.foo._entry>
    %1 = call _Main._new
    parm 8
    %2 = call _Alloc
    *(%2 + 0) = %0
    *(%2 + 4) = %1
    %3 = *(%2 + 0)
    parm %2
    call %3
    return
}

FUNC<main._entry> {
    call main
    return
}

FUNC<_Main.foo> {
    parm 8
    %1 = call _Alloc
    %2 = FUNC<lambda_9_15>
    *(%1 + 0) = %2
    *(%1 + 4) = %0
    *(%0 + 4) = %1
    %4 = *(%0 + 4)
    parm 4
    %5 = call _Alloc
    %6 = FUNC<lambda_10_28>
    *(%5 + 0) = %6
    %8 = *(%4 + 0)
    parm %4
    parm %5
    %7 = call %8
    %3 = %7
    %10 = *(%3 + 0)
    parm %3
    parm 10
    %9 = call %10
    parm %9
    call _PrintInt
    return
}

FUNC<_Main.foo._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 8)
    parm %1
    call %2
    return
}

FUNC<lambda_9_46> {
    %2 = *(%0 + 8)
    %3 = *(%2 + 4)
    %4 = *(%0 + 4)
    %6 = *(%3 + 0)
    parm %3
    parm %4
    %5 = call %6
    %8 = *(%5 + 0)
    parm %5
    parm %1
    %7 = call %8
    return %7
}

FUNC<lambda_9_15> {
    parm 12
    %2 = call _Alloc
    %3 = FUNC<lambda_9_46>
    *(%2 + 0) = %3
    *(%2 + 4) = %1
    %4 = *(%0 + 4)
    *(%2 + 8) = %4
    %6 = *(%1 + 0)
    parm %1
    parm %2
    %5 = call %6
    return %5
}

FUNC<lambda_10_47> {
    %2 = (%1 == 0)
    if (%2 == 0) branch %0
    return 1
    branch %1
    %0:
    %3 = *(%0 + 4)
    %4 = (%1 - 1)
    %6 = *(%3 + 0)
    parm %3
    parm %4
    %5 = call %6
    %7 = (%1 * %5)
    return %7
    %1:
}

FUNC<lambda_10_28> {
    parm 8
    %2 = call _Alloc
    %3 = FUNC<lambda_10_47>
    *(%2 + 0) = %3
    *(%2 + 4) = %1
    return %2
}

