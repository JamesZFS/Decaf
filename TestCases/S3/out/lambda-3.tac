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

FUNC<_Main.f1> {
    parm 2333
    call _PrintInt
    return
}

FUNC<_Main.f1._entry> {
    call _Main.f1
    return
}

FUNC<_Main.f2> {
    %0 = "3222"
    parm %0
    call _PrintString
    return
}

FUNC<_Main.f2._entry> {
    call _Main.f2
    return
}

FUNC<main> {
    parm 4
    %1 = call _Alloc
    %2 = FUNC<lambda_10_19>
    *(%1 + 0) = %2
    %0 = %1
    %4 = *(%0 + 0)
    parm %0
    parm 100
    %3 = call %4
    parm %3
    call _PrintInt
    %5 = - 100
    %7 = *(%0 + 0)
    parm %0
    parm %5
    %6 = call %7
    parm %6
    call _PrintInt
    parm 4
    %9 = call _Alloc
    %10 = FUNC<lambda_19_21>
    *(%9 + 0) = %10
    %8 = %9
    %12 = *(%8 + 0)
    parm %8
    parm 100
    %11 = call %12
    %13 = - 100
    %15 = *(%8 + 0)
    parm %8
    parm %13
    %14 = call %15
    %17 = (10 < 0)
    if (%17 == 0) branch %3
    %19 = "Decaf runtime error: Cannot create negative-sized array\n"
    parm %19
    call _PrintString
    call _Halt
    %3:
    %18 = (10 * 4)
    %18 = (%18 + 4)
    parm %18
    %20 = call _Alloc
    %18 = (%20 + %18)
    %20 = (%20 + 4)
    branch %4
    %5:
    %18 = (%18 - 4)
    *(%18 + 0) = 0
    %4:
    %17 = (%18 == %20)
    if (%17 == 0) branch %5
    *(%20 - 4) = 10
    %16 = %20
    %22 = *(%16 - 4)
    %21 = (0 >= 0)
    %23 = (0 < %22)
    %21 = (%21 && %23)
    if (%21 == 0) branch %6
    %24 = (0 * 4)
    %24 = (%24 + %16)
    *(%24 + 0) = 1
    branch %7
    %6:
    %25 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %25
    call _PrintString
    call _Halt
    %7:
    %27 = *(%16 - 4)
    %26 = (1 >= 0)
    %28 = (1 < %27)
    %26 = (%26 && %28)
    if (%26 == 0) branch %8
    %29 = (1 * 4)
    %29 = (%29 + %16)
    *(%29 + 0) = 3
    branch %9
    %8:
    %30 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %30
    call _PrintString
    call _Halt
    %9:
    %32 = *(%16 - 4)
    %31 = (2 >= 0)
    %33 = (2 < %32)
    %31 = (%31 && %33)
    if (%31 == 0) branch %10
    %34 = (2 * 4)
    %34 = (%34 + %16)
    *(%34 + 0) = 5
    branch %11
    %10:
    %35 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %35
    call _PrintString
    call _Halt
    %11:
    %37 = *(%16 - 4)
    %36 = (3 >= 0)
    %38 = (3 < %37)
    %36 = (%36 && %38)
    if (%36 == 0) branch %12
    %39 = (3 * 4)
    %39 = (%39 + %16)
    *(%39 + 0) = 7
    branch %13
    %12:
    %40 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %40
    call _PrintString
    call _Halt
    %13:
    %42 = *(%16 - 4)
    %41 = (4 >= 0)
    %43 = (4 < %42)
    %41 = (%41 && %43)
    if (%41 == 0) branch %14
    %44 = (4 * 4)
    %44 = (%44 + %16)
    *(%44 + 0) = 9
    branch %15
    %14:
    %45 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %45
    call _PrintString
    call _Halt
    %15:
    %47 = *(%16 - 4)
    %46 = (5 >= 0)
    %48 = (5 < %47)
    %46 = (%46 && %48)
    if (%46 == 0) branch %16
    %49 = (5 * 4)
    %49 = (%49 + %16)
    *(%49 + 0) = 0
    branch %17
    %16:
    %50 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %50
    call _PrintString
    call _Halt
    %17:
    parm 4
    %52 = call _Alloc
    %53 = FUNC<lambda_32_22>
    *(%52 + 0) = %53
    %51 = %52
    %55 = *(%51 + 0)
    parm %51
    parm 10
    parm %16
    %54 = call %55
    parm 4
    %57 = call _Alloc
    %58 = FUNC<lambda_42_17>
    *(%57 + 0) = %58
    %56 = %57
    %60 = *(%56 + 0)
    parm %56
    parm 1
    %59 = call %60
    %62 = *(%59 + 0)
    parm %59
    %61 = call %62
    %64 = *(%56 + 0)
    parm %56
    parm 0
    %63 = call %64
    %66 = *(%63 + 0)
    parm %63
    %65 = call %66
    return
}

FUNC<main._entry> {
    call main
    return
}

FUNC<lambda_10_19> {
    %2 = (%1 >= 0)
    if (%2 == 0) branch %0
    return %1
    branch %1
    %0:
    %3 = - %1
    return %3
    %1:
}

FUNC<lambda_19_21> {
    %2 = (%1 < 0)
    if (%2 == 0) branch %2
    return
    %2:
    parm %1
    call _PrintInt
    return
}

FUNC<lambda_32_22> {
    %3 = 0
    branch %18
    %19:
    %5 = *(%2 - 4)
    %4 = (%3 >= 0)
    %6 = (%3 < %5)
    %4 = (%4 && %6)
    if (%4 == 0) branch %22
    %7 = (%3 * 4)
    %7 = (%7 + %2)
    %8 = *(%7 + 0)
    branch %23
    %22:
    %9 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %9
    call _PrintString
    call _Halt
    %23:
    %10 = (%8 == 0)
    if (%10 == 0) branch %21
    return
    %21:
    %12 = *(%2 - 4)
    %11 = (%3 >= 0)
    %13 = (%3 < %12)
    %11 = (%11 && %13)
    if (%11 == 0) branch %24
    %14 = (%3 * 4)
    %14 = (%14 + %2)
    %15 = *(%14 + 0)
    branch %25
    %24:
    %16 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %16
    call _PrintString
    call _Halt
    %25:
    parm %15
    call _PrintInt
    %17 = (%3 + 1)
    %3 = %17
    %18:
    %18 = (%3 < %1)
    if (%18 != 0) branch %19
    %20:
    return
}

FUNC<lambda_42_17> {
    if (%1 == 0) branch %26
    %2 = FUNC<_Main.f1._entry>
    parm 4
    %3 = call _Alloc
    *(%3 + 0) = %2
    return %3
    branch %27
    %26:
    %4 = FUNC<_Main.f2._entry>
    parm 4
    %5 = call _Alloc
    *(%5 + 0) = %4
    return %5
    %27:
}

