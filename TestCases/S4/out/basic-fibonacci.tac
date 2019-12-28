VTBL<_Main> {
    0
    "Main"
}

VTBL<_Fibonacci> {
    0
    "Fibonacci"
    FUNC<_Fibonacci.get>
}

FUNC<_Main._new> {
    parm 4
    %0 = call _Alloc
    %1 = VTBL<_Main>
    *(%0 + 0) = %1
    return %0
}

FUNC<_Fibonacci._new> {
    parm 4
    %0 = call _Alloc
    %1 = VTBL<_Fibonacci>
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
    %2 = call _Fibonacci._new
    branch %2
    %1:
    %3 = FUNC<_Fibonacci.get._entry>
    parm 8
    %4 = call _Alloc
    *(%4 + 0) = %3
    *(%4 + 4) = %2
    %6 = *(%4 + 0)
    parm %4
    parm %0
    %5 = call %6
    parm %5
    call _PrintInt
    %7 = "\n"
    parm %7
    call _PrintString
    %8 = (%0 + 1)
    %0 = %8
    %2:
    %9 = (%0 < 10)
    if (%9 != 0) branch %1
    return
}

FUNC<main._entry> {
    call main
    return
}

FUNC<_Fibonacci.get> {
    %2 = (%1 < 2)
    if (%2 == 0) branch %2
    return 1
    %2:
    %3 = FUNC<_Fibonacci.get._entry>
    parm 8
    %4 = call _Alloc
    *(%4 + 0) = %3
    *(%4 + 4) = %0
    %5 = (%1 - 1)
    %7 = *(%4 + 0)
    parm %4
    parm %5
    %6 = call %7
    %8 = FUNC<_Fibonacci.get._entry>
    parm 8
    %9 = call _Alloc
    *(%9 + 0) = %8
    *(%9 + 4) = %0
    %10 = (%1 - 2)
    %12 = *(%9 + 0)
    parm %9
    parm %10
    %11 = call %12
    %13 = (%6 + %11)
    return %13
}

FUNC<_Fibonacci.get._entry> {
    %3 = *(%0 + 4)
    %4 = *(%3 + 0)
    %4 = *(%4 + 8)
    parm %3
    parm %1
    %2 = call %4
    return %2
}

