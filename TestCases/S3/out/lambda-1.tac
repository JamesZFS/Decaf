VTBL<_A> {
    0
    "A"
    FUNC<_A.f>
}

VTBL<_Main> {
    0
    "Main"
    FUNC<_Main.f>
    FUNC<_Main.trueMain>
}

FUNC<_A._new> {
    parm 8
    %0 = call _Alloc
    %1 = VTBL<_A>
    *(%0 + 0) = %1
    *(%0 + 4) = 0
    return %0
}

FUNC<_Main._new> {
    parm 12
    %0 = call _Alloc
    %1 = VTBL<_Main>
    *(%0 + 0) = %1
    *(%0 + 4) = 0
    *(%0 + 8) = 0
    return %0
}

FUNC<length> {
    %1 = *(%0 + 4)
    %1 = *(%1 - 4)
    return %1
}

FUNC<_A.f> {
    %2 = (%1 - 1)
    return %2
}

FUNC<_A.f._entry> {
    %3 = *(%0 + 4)
    %4 = *(%3 + 0)
    %4 = *(%4 + 8)
    parm %3
    parm %1
    %2 = call %4
    return %2
}

FUNC<_A.sf> {
    %1 = (%0 + 1)
    return %1
}

FUNC<_A.sf._entry> {
    parm %1
    %1 = call _A.sf
    return %1
}

FUNC<_Main.f> {
    %2 = *(%0 + 4)
    %3 = (%1 + %2)
    return %3
}

FUNC<_Main.f._entry> {
    %3 = *(%0 + 4)
    %4 = *(%3 + 0)
    %4 = *(%4 + 8)
    parm %3
    parm %1
    %2 = call %4
    return %2
}

FUNC<_Main.sf> {
    %1 = (%0 + 2)
    return %1
}

FUNC<_Main.sf._entry> {
    parm %1
    %1 = call _Main.sf
    return %1
}

FUNC<main> {
    %1 = FUNC<_Main.sf._entry>
    parm 4
    %2 = call _Alloc
    *(%2 + 0) = %1
    %0 = %2
    %4 = *(%0 + 0)
    parm %0
    parm 3
    %3 = call %4
    parm %3
    call _PrintInt
    %5 = FUNC<_Main.trueMain._entry>
    %6 = call _Main._new
    parm 8
    %7 = call _Alloc
    *(%7 + 0) = %5
    *(%7 + 4) = %6
    %8 = *(%7 + 0)
    parm %7
    call %8
    return
}

FUNC<main._entry> {
    call main
    return
}

FUNC<_Main.trueMain> {
    %2 = call _A._new
    %1 = %2
    parm 4
    %3 = call _Alloc
    %4 = FUNC<lambda_22_19>
    *(%3 + 0) = %4
    *(%0 + 8) = %3
    %5 = *(%0 + 8)
    %7 = *(%5 + 0)
    parm %5
    parm 3
    %6 = call %7
    parm %6
    call _PrintInt
    *(%0 + 4) = 4
    %9 = FUNC<_Main.f._entry>
    parm 8
    %10 = call _Alloc
    *(%10 + 0) = %9
    *(%10 + 4) = %0
    %8 = %10
    %12 = *(%8 + 0)
    parm %8
    parm 3
    %11 = call %12
    parm %11
    call _PrintInt
    %14 = FUNC<_Main.sf._entry>
    parm 4
    %15 = call _Alloc
    *(%15 + 0) = %14
    %13 = %15
    %17 = *(%13 + 0)
    parm %13
    parm 3
    %16 = call %17
    parm %16
    call _PrintInt
    %19 = *(%0 + 8)
    %18 = %19
    %21 = *(%18 + 0)
    parm %18
    parm 3
    %20 = call %21
    parm %20
    call _PrintInt
    %23 = FUNC<_Main.f._entry>
    parm 8
    %24 = call _Alloc
    *(%24 + 0) = %23
    *(%24 + 4) = %0
    %22 = %24
    %26 = *(%22 + 0)
    parm %22
    parm 3
    %25 = call %26
    parm %25
    call _PrintInt
    %28 = FUNC<_Main.sf._entry>
    parm 4
    %29 = call _Alloc
    *(%29 + 0) = %28
    %27 = %29
    %31 = *(%27 + 0)
    parm %27
    parm 3
    %30 = call %31
    parm %30
    call _PrintInt
    %33 = *(%0 + 8)
    %32 = %33
    %35 = *(%32 + 0)
    parm %32
    parm 3
    %34 = call %35
    parm %34
    call _PrintInt
    %37 = FUNC<_Main.sf._entry>
    parm 4
    %38 = call _Alloc
    *(%38 + 0) = %37
    %36 = %38
    %40 = *(%36 + 0)
    parm %36
    parm 3
    %39 = call %40
    parm %39
    call _PrintInt
    %42 = FUNC<_A.f._entry>
    parm 8
    %43 = call _Alloc
    *(%43 + 0) = %42
    *(%43 + 4) = %1
    %41 = %43
    %45 = *(%41 + 0)
    parm %41
    parm 3
    %44 = call %45
    parm %44
    call _PrintInt
    %47 = FUNC<_A.sf._entry>
    parm 4
    %48 = call _Alloc
    *(%48 + 0) = %47
    %46 = %48
    %50 = *(%46 + 0)
    parm %46
    parm 3
    %49 = call %50
    parm %49
    call _PrintInt
    %52 = FUNC<_A.sf._entry>
    parm 4
    %53 = call _Alloc
    *(%53 + 0) = %52
    %51 = %53
    %55 = *(%51 + 0)
    parm %51
    parm 3
    %54 = call %55
    parm %54
    call _PrintInt
    return
}

FUNC<_Main.trueMain._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 12)
    parm %1
    call %2
    return
}

FUNC<lambda_22_19> {
    %2 = (%1 * 2)
    return %2
}

