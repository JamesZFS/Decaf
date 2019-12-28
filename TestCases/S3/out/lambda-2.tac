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
    %1 = %2
    parm 12
    %4 = call _Alloc
    %5 = FUNC<lambda_7_17>
    *(%4 + 0) = %5
    *(%4 + 4) = %1
    *(%4 + 8) = %0
    %3 = %4
    parm %1
    call _PrintString
    %6 = "\n"
    parm %6
    call _PrintString
    %8 = *(%3 + 0)
    parm %3
    %7 = call %8
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
    %1 = (10 < 0)
    if (%1 == 0) branch %0
    %3 = "Decaf runtime error: Cannot create negative-sized array\n"
    parm %3
    call _PrintString
    call _Halt
    %0:
    %2 = (10 * 4)
    %2 = (%2 + 4)
    parm %2
    %4 = call _Alloc
    %2 = (%4 + %2)
    %4 = (%4 + 4)
    branch %1
    %2:
    %2 = (%2 - 4)
    *(%2 + 0) = 0
    %1:
    %1 = (%2 == %4)
    if (%1 == 0) branch %2
    *(%4 - 4) = 10
    %0 = %4
    %6 = call _Main._new
    %5 = %6
    *(%5 + 4) = 3
    %8 = *(%0 - 4)
    %7 = (0 >= 0)
    %9 = (0 < %8)
    %7 = (%7 && %9)
    if (%7 == 0) branch %3
    %10 = (0 * 4)
    %10 = (%10 + %0)
    %11 = *(%10 + 0)
    branch %4
    %3:
    %12 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %12
    call _PrintString
    call _Halt
    %4:
    parm %11
    call _PrintInt
    %13 = "\n"
    parm %13
    call _PrintString
    %14 = *(%5 + 4)
    parm %14
    call _PrintInt
    %15 = "\n"
    parm %15
    call _PrintString
    parm 12
    %17 = call _Alloc
    %18 = FUNC<lambda_37_20>
    *(%17 + 0) = %18
    *(%17 + 4) = %0
    *(%17 + 8) = %5
    %16 = %17
    %20 = *(%16 + 0)
    parm %16
    %19 = call %20
    %22 = *(%0 - 4)
    %21 = (0 >= 0)
    %23 = (0 < %22)
    %21 = (%21 && %23)
    if (%21 == 0) branch %9
    %24 = (0 * 4)
    %24 = (%24 + %0)
    %25 = *(%24 + 0)
    branch %10
    %9:
    %26 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %26
    call _PrintString
    call _Halt
    %10:
    parm %25
    call _PrintInt
    %27 = "\n"
    parm %27
    call _PrintString
    %28 = *(%5 + 4)
    parm %28
    call _PrintInt
    %29 = "\n"
    parm %29
    call _PrintString
    %30 = FUNC<_Main.foo._entry>
    parm 8
    %31 = call _Alloc
    *(%31 + 0) = %30
    *(%31 + 4) = %5
    %32 = *(%31 + 0)
    parm %31
    call %32
    %33 = *(%5 + 4)
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
    %3 = *(%0 + 4)
    *(%3 + 4) = 4
    %4 = *(%0 + 4)
    *(%4 + 8) = 0
    %6 = "fzyxqzgbyq"
    %5 = %6
    %5 = %2
    parm %5
    parm %1
    %7 = call _StringEqual
    %7 = ! %7
    if (%7 == 0) branch %0
    %5 = %1
    %1 = %2
    %2 = %5
    %0:
    return %5
}

FUNC<lambda_7_17> {
    %2 = "PA3"
    %1 = %2
    parm 8
    %4 = call _Alloc
    %5 = FUNC<lambda_9_21>
    *(%4 + 0) = %5
    %6 = *(%0 + 8)
    *(%4 + 4) = %6
    %3 = %4
    %7 = *(%0 + 4)
    %9 = *(%3 + 0)
    parm %3
    parm %7
    parm %1
    %8 = call %9
    parm %8
    call _PrintString
    %10 = "\n"
    parm %10
    call _PrintString
    %11 = *(%0 + 8)
    %12 = *(%11 + 4)
    parm %12
    call _PrintInt
    %13 = "\n"
    parm %13
    call _PrintString
    %14 = *(%0 + 4)
    %1 = %14
    %15 = *(%0 + 8)
    *(%15 + 4) = 2
    return
    return
}

FUNC<lambda_40_24> {
    %2 = *(%0 + 4)
    %1 = %2
    %3 = *(%0 + 8)
    *(%3 + 4) = 1
    return
}

FUNC<lambda_37_20> {
    %1 = *(%0 + 4)
    %3 = *(%1 - 4)
    %2 = (0 >= 0)
    %4 = (0 < %3)
    %2 = (%2 && %4)
    if (%2 == 0) branch %5
    %5 = (0 * 4)
    %5 = (%5 + %1)
    %6 = *(%5 + 0)
    branch %6
    %5:
    %7 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %7
    call _PrintString
    call _Halt
    %6:
    %8 = (%6 + 1)
    %9 = *(%0 + 4)
    %11 = *(%9 - 4)
    %10 = (0 >= 0)
    %12 = (0 < %11)
    %10 = (%10 && %12)
    if (%10 == 0) branch %7
    %13 = (0 * 4)
    %13 = (%13 + %9)
    *(%13 + 0) = %8
    branch %8
    %7:
    %14 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %14
    call _PrintString
    call _Halt
    %8:
    %15 = 0
    parm 12
    %17 = call _Alloc
    %18 = FUNC<lambda_40_24>
    *(%17 + 0) = %18
    *(%17 + 4) = %15
    %19 = *(%0 + 8)
    *(%17 + 8) = %19
    %16 = %17
    %20 = - 1
    %15 = %20
    %22 = *(%16 + 0)
    parm %16
    parm 1
    %21 = call %22
    return
}

