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

FUNC<_Main.niam> {
    %0 = 0
    parm 4
    %2 = call _Alloc
    %3 = FUNC<lambda_7_17>
    *(%2 + 0) = %3
    %1 = %2
    parm 12
    %5 = call _Alloc
    %6 = FUNC<lambda_8_17>
    *(%5 + 0) = %6
    *(%5 + 4) = %1
    *(%5 + 8) = %0
    %4 = %5
    %8 = *(%1 + 0)
    parm %1
    parm 120
    %7 = call %8
    %10 = *(%4 + 0)
    parm %4
    parm %7
    %9 = call %10
    %12 = *(%4 + 0)
    parm %4
    parm 13
    %11 = call %12
    parm 4
    %14 = call _Alloc
    %15 = FUNC<lambda_12_23>
    *(%14 + 0) = %15
    %13 = %14
    parm 12
    %17 = call _Alloc
    %18 = FUNC<lambda_13_29>
    *(%17 + 0) = %18
    *(%17 + 4) = %1
    *(%17 + 8) = %0
    %16 = %17
    %20 = *(%13 + 0)
    parm %13
    parm 120
    %19 = call %20
    %22 = *(%13 + 0)
    parm %13
    parm %0
    %21 = call %22
    %24 = *(%1 + 0)
    parm %1
    parm %21
    %23 = call %24
    %26 = *(%16 + 0)
    parm %16
    parm %19
    parm %23
    %25 = call %26
    %28 = *(%1 + 0)
    parm %1
    parm 2333
    %27 = call %28
    %30 = *(%13 + 0)
    parm %13
    parm %27
    %29 = call %30
    %32 = *(%1 + 0)
    parm %1
    parm %29
    %31 = call %32
    %34 = *(%13 + 0)
    parm %13
    parm %31
    %33 = call %34
    %36 = *(%1 + 0)
    parm %1
    parm %33
    %35 = call %36
    %38 = *(%16 + 0)
    parm %16
    parm 13
    parm %35
    %37 = call %38
    return
}

FUNC<_Main.niam._entry> {
    call _Main.niam
    return
}

FUNC<main> {
    parm 4
    %1 = call _Alloc
    %2 = FUNC<lambda_19_20>
    *(%1 + 0) = %2
    %0 = %1
    parm 4
    %4 = call _Alloc
    %5 = FUNC<lambda_20_25>
    *(%4 + 0) = %5
    %3 = %4
    parm 8
    %7 = call _Alloc
    %8 = FUNC<lambda_21_23>
    *(%7 + 0) = %8
    *(%7 + 4) = %0
    %6 = %7
    parm 4
    %10 = call _Alloc
    %11 = FUNC<lambda_22_20>
    *(%10 + 0) = %11
    %9 = %10
    %14 = *(%6 + 0)
    parm %6
    parm 2
    %13 = call %14
    %16 = *(%0 + 0)
    parm %0
    parm 2
    parm %13
    %15 = call %16
    %12 = %15
    %18 = *(%0 + 0)
    parm %0
    parm 2
    parm 3
    %17 = call %18
    parm %17
    call _PrintInt
    %20 = *(%3 + 0)
    parm %3
    parm 4
    %19 = call %20
    parm %19
    call _PrintInt
    %22 = *(%6 + 0)
    parm %6
    parm 6
    %21 = call %22
    parm %21
    call _PrintInt
    %24 = *(%9 + 0)
    parm %9
    parm 8
    %23 = call %24
    parm %23
    call _PrintInt
    %26 = *(%3 + 0)
    parm %3
    parm 9
    %25 = call %26
    parm %25
    call _PrintInt
    parm %12
    call _PrintInt
    return
}

FUNC<main._entry> {
    call main
    return
}

FUNC<lambda_7_17> {
    %2 = (%1 + 1)
    return %2
}

FUNC<lambda_8_17> {
    %2 = *(%0 + 4)
    %3 = *(%0 + 8)
    %4 = (%1 + %3)
    %6 = *(%2 + 0)
    parm %2
    parm %4
    %5 = call %6
    parm %5
    call _PrintInt
    return
}

FUNC<lambda_12_23> {
    %2 = (%1 + 1)
    return %2
}

FUNC<lambda_13_29> {
    %3 = *(%0 + 4)
    %4 = *(%0 + 8)
    %5 = (%1 + %4)
    %6 = (%5 + %2)
    %8 = *(%3 + 0)
    parm %3
    parm %6
    %7 = call %8
    parm %7
    call _PrintInt
    return
}

FUNC<lambda_19_20> {
    %3 = (%1 + %2)
    return %3
}

FUNC<lambda_20_25> {
    %2 = (%1 + 5)
    return %2
}

FUNC<lambda_21_23> {
    %2 = *(%0 + 4)
    %4 = *(%2 + 0)
    parm %2
    parm 2
    parm 3
    %3 = call %4
    %5 = (%1 + %3)
    return %5
}

FUNC<lambda_22_20> {
    %2 = (3 + %1)
    return %2
}

