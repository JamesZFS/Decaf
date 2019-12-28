VTBL<_Main> {
    0
    "Main"
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

FUNC<_Main.printint> {
    %1 = %0
    %2 = "Hello, "
    parm %2
    call _PrintString
    parm %1
    call _PrintInt
    return
}

FUNC<_Main.printint._entry> {
    parm %1
    call _Main.printint
    return
}

FUNC<_Main.printbool> {
    %1 = %0
    %2 = "Hello, "
    parm %2
    call _PrintString
    parm %1
    call _PrintBool
    return
}

FUNC<_Main.printbool._entry> {
    parm %1
    call _Main.printbool
    return
}

FUNC<main> {
    %0 = 5
    %1 = FUNC<_Main.printint._entry>
    parm 4
    %2 = call _Alloc
    *(%2 + 0) = %1
    %3 = *(%2 + 0)
    parm %2
    parm %0
    call %3
    %4 = 7
    %5 = FUNC<_Main.printint._entry>
    parm 4
    %6 = call _Alloc
    *(%6 + 0) = %5
    %7 = *(%6 + 0)
    parm %6
    parm %4
    call %7
    %9 = (%0 + %4)
    %10 = (%9 - 1)
    %8 = %10
    %11 = FUNC<_Main.printint._entry>
    parm 4
    %12 = call _Alloc
    *(%12 + 0) = %11
    %13 = *(%12 + 0)
    parm %12
    parm %8
    call %13
    %15 = call _Main._new
    %16 = *(%15 + 4)
    %14 = %16
    %18 = call _Main._new
    %17 = %18
    %20 = (2 < 0)
    if (%20 == 0) branch %0
    %22 = "Decaf runtime error: Cannot create negative-sized array\n"
    parm %22
    call _PrintString
    call _Halt
    %0:
    %21 = (2 * 4)
    %21 = (%21 + 4)
    parm %21
    %23 = call _Alloc
    %21 = (%23 + %21)
    %23 = (%23 + 4)
    branch %1
    %2:
    %21 = (%21 - 4)
    *(%21 + 0) = 0
    %1:
    %20 = (%21 == %23)
    if (%20 == 0) branch %2
    *(%23 - 4) = 2
    %19 = %23
    %24 = 1
    %25 = FUNC<_Main.printbool._entry>
    parm 4
    %26 = call _Alloc
    *(%26 + 0) = %25
    %27 = *(%26 + 0)
    parm %26
    parm %24
    call %27
    %28 = 0
    %29 = FUNC<_Main.printbool._entry>
    parm 4
    %30 = call _Alloc
    *(%30 + 0) = %29
    %31 = *(%30 + 0)
    parm %30
    parm %28
    call %31
    %33 = (56 > 123)
    %32 = %33
    %34 = FUNC<_Main.printbool._entry>
    parm 4
    %35 = call _Alloc
    *(%35 + 0) = %34
    %36 = *(%35 + 0)
    parm %35
    parm %32
    call %36
    return
}

FUNC<main._entry> {
    call main
    return
}

