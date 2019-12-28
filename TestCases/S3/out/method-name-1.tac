VTBL<_Main> {
    0
    "Main"
    FUNC<_Main.f1>
    FUNC<_Main.f2>
    FUNC<_Main.f3>
    FUNC<_Main.f4>
    FUNC<_Main.f5>
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
    %1 = call _Main._new
    %0 = %1
    %2 = FUNC<_Main.f5._entry>
    parm 8
    %3 = call _Alloc
    *(%3 + 0) = %2
    *(%3 + 4) = %0
    %4 = *(%3 + 0)
    parm %3
    call %4
    %5 = FUNC<_Main.f4._entry>
    parm 8
    %6 = call _Alloc
    *(%6 + 0) = %5
    *(%6 + 4) = %0
    %8 = *(%6 + 0)
    parm %6
    %7 = call %8
    %10 = *(%7 + 0)
    parm %7
    %9 = call %10
    %11 = FUNC<_Main.f3._entry>
    parm 8
    %12 = call _Alloc
    *(%12 + 0) = %11
    *(%12 + 4) = %0
    %14 = *(%12 + 0)
    parm %12
    %13 = call %14
    %16 = *(%13 + 0)
    parm %13
    %15 = call %16
    %18 = *(%15 + 0)
    parm %15
    %17 = call %18
    %19 = FUNC<_Main.f2._entry>
    parm 8
    %20 = call _Alloc
    *(%20 + 0) = %19
    *(%20 + 4) = %0
    %22 = *(%20 + 0)
    parm %20
    %21 = call %22
    %24 = *(%21 + 0)
    parm %21
    %23 = call %24
    %26 = *(%23 + 0)
    parm %23
    %25 = call %26
    %28 = *(%25 + 0)
    parm %25
    %27 = call %28
    %29 = FUNC<_Main.f1._entry>
    parm 8
    %30 = call _Alloc
    *(%30 + 0) = %29
    *(%30 + 4) = %0
    %32 = *(%30 + 0)
    parm %30
    %31 = call %32
    %34 = *(%31 + 0)
    parm %31
    %33 = call %34
    %36 = *(%33 + 0)
    parm %33
    %35 = call %36
    %38 = *(%35 + 0)
    parm %35
    %37 = call %38
    %40 = *(%37 + 0)
    parm %37
    %39 = call %40
    return
}

FUNC<main._entry> {
    call main
    return
}

FUNC<_Main.f1> {
    %1 = *(%0 + 4)
    %2 = (%1 + 1)
    *(%0 + 4) = %2
    %3 = FUNC<_Main.f2._entry>
    parm 8
    %4 = call _Alloc
    *(%4 + 0) = %3
    *(%4 + 4) = %0
    return %4
}

FUNC<_Main.f1._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 8)
    parm %2
    %1 = call %3
    return %1
}

FUNC<_Main.f2> {
    %1 = *(%0 + 4)
    %2 = (%1 + 1)
    *(%0 + 4) = %2
    %3 = FUNC<_Main.f3._entry>
    parm 8
    %4 = call _Alloc
    *(%4 + 0) = %3
    *(%4 + 4) = %0
    return %4
}

FUNC<_Main.f2._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 12)
    parm %2
    %1 = call %3
    return %1
}

FUNC<_Main.f3> {
    %1 = *(%0 + 4)
    %2 = (%1 + 1)
    *(%0 + 4) = %2
    %3 = FUNC<_Main.f4._entry>
    parm 8
    %4 = call _Alloc
    *(%4 + 0) = %3
    *(%4 + 4) = %0
    return %4
}

FUNC<_Main.f3._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 16)
    parm %2
    %1 = call %3
    return %1
}

FUNC<_Main.f4> {
    %1 = *(%0 + 4)
    %2 = (%1 + 1)
    *(%0 + 4) = %2
    %3 = FUNC<_Main.f5._entry>
    parm 8
    %4 = call _Alloc
    *(%4 + 0) = %3
    *(%4 + 4) = %0
    return %4
}

FUNC<_Main.f4._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 20)
    parm %2
    %1 = call %3
    return %1
}

FUNC<_Main.f5> {
    %1 = *(%0 + 4)
    %2 = (%1 + 1)
    *(%0 + 4) = %2
    %3 = *(%0 + 4)
    parm %3
    call _PrintInt
    %4 = "\n"
    parm %4
    call _PrintString
    return
}

FUNC<_Main.f5._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 24)
    parm %1
    call %2
    return
}

