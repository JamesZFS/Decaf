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
    parm 8
    %8 = call _Alloc
    %9 = FUNC<length>
    *(%8 + 0) = %9
    *(%8 + 4) = %0
    %7 = (0 >= 0)
    %10 = (0 < %8)
    %7 = (%7 && %10)
    if (%7 == 0) branch %3
    %11 = (0 * 4)
    %11 = (%11 + %0)
    %12 = *(%11 + 0)
    branch %4
    %3:
    %13 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %13
    call _PrintString
    call _Halt
    %4:
    parm %12
    call _PrintInt
    %14 = "\n"
    parm %14
    call _PrintString
    %15 = *(%5 + 4)
    parm %15
    call _PrintInt
    %16 = "\n"
    parm %16
    call _PrintString
    parm 12
    %18 = call _Alloc
    %19 = FUNC<lambda_37_20>
    *(%18 + 0) = %19
    *(%18 + 4) = %0
    *(%18 + 8) = %5
    %17 = %18
    %21 = *(%17 + 0)
    parm %17
    %20 = call %21
    parm 8
    %23 = call _Alloc
    %24 = FUNC<length>
    *(%23 + 0) = %24
    *(%23 + 4) = %0
    %22 = (0 >= 0)
    %25 = (0 < %23)
    %22 = (%22 && %25)
    if (%22 == 0) branch %9
    %26 = (0 * 4)
    %26 = (%26 + %0)
    %27 = *(%26 + 0)
    branch %10
    %9:
    %28 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %28
    call _PrintString
    call _Halt
    %10:
    parm %27
    call _PrintInt
    %29 = "\n"
    parm %29
    call _PrintString
    %30 = *(%5 + 4)
    parm %30
    call _PrintInt
    %31 = "\n"
    parm %31
    call _PrintString
    %32 = FUNC<_Main.foo._entry>
    parm 8
    %33 = call _Alloc
    *(%33 + 0) = %32
    *(%33 + 4) = %5
    %34 = *(%33 + 0)
    parm %33
    call %34
    %35 = *(%5 + 4)
    parm %35
    call _PrintInt
    %36 = "\n"
    parm %36
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
    parm 8
    %3 = call _Alloc
    %4 = FUNC<length>
    *(%3 + 0) = %4
    *(%3 + 4) = %1
    %2 = (0 >= 0)
    %5 = (0 < %3)
    %2 = (%2 && %5)
    if (%2 == 0) branch %5
    %6 = (0 * 4)
    %6 = (%6 + %1)
    %7 = *(%6 + 0)
    branch %6
    %5:
    %8 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %8
    call _PrintString
    call _Halt
    %6:
    %9 = (%7 + 1)
    %10 = *(%0 + 4)
    parm 8
    %12 = call _Alloc
    %13 = FUNC<length>
    *(%12 + 0) = %13
    *(%12 + 4) = %10
    %11 = (0 >= 0)
    %14 = (0 < %12)
    %11 = (%11 && %14)
    if (%11 == 0) branch %7
    %15 = (0 * 4)
    %15 = (%15 + %10)
    *(%15 + 0) = %9
    branch %8
    %7:
    %16 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %16
    call _PrintString
    call _Halt
    %8:
    %17 = 0
    parm 12
    %19 = call _Alloc
    %20 = FUNC<lambda_40_24>
    *(%19 + 0) = %20
    *(%19 + 4) = %17
    %21 = *(%0 + 8)
    *(%19 + 8) = %21
    %18 = %19
    %22 = - 1
    %17 = %22
    %24 = *(%18 + 0)
    parm %18
    parm 1
    %23 = call %24
    return
}

