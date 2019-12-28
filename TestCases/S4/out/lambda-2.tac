VTBL<_Main> {
    0
    "Main"
    FUNC<_Main.foo>
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

FUNC<_Main.foo> {
    %2 = "PA3"
    parm 12
    %4 = call _Alloc
    %5 = FUNC<lambda_7_17>
    *(%4 + 0) = %5
    *(%4 + 4) = %2
    *(%4 + 8) = %0
    parm %2
    call _PrintString
    %6 = "\n"
    parm %6
    call _PrintString
    %8 = *(%4 + 0)
    parm %4
    call %8
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

FUNC<main> {
    parm 44
    %4 = call _Alloc
    %2 = (%4 + 44)
    %4 = (%4 + 4)
    branch %3
    %2:
    %2 = (%2 - 4)
    *(%2 + 0) = 0
    %3:
    %1 = (%2 == %4)
    if (%1 == 0) branch %2
    *(%4 - 4) = 10
    %6 = call _Main._new
    *(%6 + 4) = 3
    %35 = *(%4 - 4)
    %38 = (0 < %35)
    %40 = (1 && %38)
    if (%40 == 0) branch %6
    %39 = (0 + %4)
    %41 = *(%39 + 0)
    branch %7
    %6:
    %12 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %12
    call _PrintString
    call _Halt
    %7:
    parm %41
    call _PrintInt
    %13 = "\n"
    parm %13
    call _PrintString
    %14 = *(%6 + 4)
    parm %14
    call _PrintInt
    %15 = "\n"
    parm %15
    call _PrintString
    parm 12
    %17 = call _Alloc
    %18 = FUNC<lambda_37_20>
    *(%17 + 0) = %18
    *(%17 + 4) = %4
    *(%17 + 8) = %6
    %20 = *(%17 + 0)
    parm %17
    call %20
    if (%40 == 0) branch %9
    branch %10
    %9:
    %26 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %26
    call _PrintString
    call _Halt
    %10:
    parm %41
    call _PrintInt
    %27 = "\n"
    parm %27
    call _PrintString
    %28 = *(%6 + 4)
    parm %28
    call _PrintInt
    %29 = "\n"
    parm %29
    call _PrintString
    %30 = FUNC<_Main.foo._entry>
    parm 8
    %31 = call _Alloc
    *(%31 + 0) = %30
    *(%31 + 4) = %6
    %32 = *(%31 + 0)
    parm %31
    call %32
    %33 = *(%6 + 4)
    parm %33
    call _PrintInt
    %34 = "\n"
    parm %34
    call _PrintString
    return
}

FUNC<main._entry> {
    call main
    return
}

FUNC<lambda_9_21> {
    %8 = *(%0 + 4)
    *(%8 + 4) = 4
    *(%8 + 8) = 0
    %5 = %2
    parm %2
    parm %1
    %7 = call _StringEqual
    %7 = ! %7
    if (%7 == 0) branch %2
    %5 = %1
    %2:
    return %5
}

FUNC<lambda_7_17> {
    %2 = "PA3"
    parm 8
    %4 = call _Alloc
    %5 = FUNC<lambda_9_21>
    *(%4 + 0) = %5
    %16 = *(%0 + 8)
    *(%4 + 4) = %16
    %17 = *(%0 + 4)
    %9 = *(%4 + 0)
    parm %4
    parm %17
    parm %2
    %8 = call %9
    parm %8
    call _PrintString
    %10 = "\n"
    parm %10
    call _PrintString
    %12 = *(%16 + 4)
    parm %12
    call _PrintInt
    %13 = "\n"
    parm %13
    call _PrintString
    *(%16 + 4) = 2
    return
}

FUNC<lambda_40_24> {
    %3 = *(%0 + 8)
    *(%3 + 4) = 1
    return
}

FUNC<lambda_37_20> {
    %23 = *(%0 + 4)
    %26 = *(%23 - 4)
    %28 = (0 < %26)
    %29 = (1 && %28)
    if (%29 == 0) branch %2
    %27 = (0 + %23)
    %6 = *(%27 + 0)
    branch %3
    %2:
    %7 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %7
    call _PrintString
    call _Halt
    %3:
    %8 = (%6 + 1)
    if (%29 == 0) branch %5
    *(%27 + 0) = %8
    branch %6
    %5:
    %14 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %14
    call _PrintString
    call _Halt
    %6:
    parm 12
    %17 = call _Alloc
    %18 = FUNC<lambda_40_24>
    *(%17 + 0) = %18
    *(%17 + 4) = 0
    %19 = *(%0 + 8)
    *(%17 + 8) = %19
    %22 = *(%17 + 0)
    parm %17
    parm 1
    call %22
    return
}

