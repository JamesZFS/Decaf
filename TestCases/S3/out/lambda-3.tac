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
    parm 8
    %22 = call _Alloc
    %23 = FUNC<length>
    *(%22 + 0) = %23
    *(%22 + 4) = %16
    %21 = (0 >= 0)
    %24 = (0 < %22)
    %21 = (%21 && %24)
    if (%21 == 0) branch %6
    %25 = (0 * 4)
    %25 = (%25 + %16)
    *(%25 + 0) = 1
    branch %7
    %6:
    %26 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %26
    call _PrintString
    call _Halt
    %7:
    parm 8
    %28 = call _Alloc
    %29 = FUNC<length>
    *(%28 + 0) = %29
    *(%28 + 4) = %16
    %27 = (1 >= 0)
    %30 = (1 < %28)
    %27 = (%27 && %30)
    if (%27 == 0) branch %8
    %31 = (1 * 4)
    %31 = (%31 + %16)
    *(%31 + 0) = 3
    branch %9
    %8:
    %32 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %32
    call _PrintString
    call _Halt
    %9:
    parm 8
    %34 = call _Alloc
    %35 = FUNC<length>
    *(%34 + 0) = %35
    *(%34 + 4) = %16
    %33 = (2 >= 0)
    %36 = (2 < %34)
    %33 = (%33 && %36)
    if (%33 == 0) branch %10
    %37 = (2 * 4)
    %37 = (%37 + %16)
    *(%37 + 0) = 5
    branch %11
    %10:
    %38 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %38
    call _PrintString
    call _Halt
    %11:
    parm 8
    %40 = call _Alloc
    %41 = FUNC<length>
    *(%40 + 0) = %41
    *(%40 + 4) = %16
    %39 = (3 >= 0)
    %42 = (3 < %40)
    %39 = (%39 && %42)
    if (%39 == 0) branch %12
    %43 = (3 * 4)
    %43 = (%43 + %16)
    *(%43 + 0) = 7
    branch %13
    %12:
    %44 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %44
    call _PrintString
    call _Halt
    %13:
    parm 8
    %46 = call _Alloc
    %47 = FUNC<length>
    *(%46 + 0) = %47
    *(%46 + 4) = %16
    %45 = (4 >= 0)
    %48 = (4 < %46)
    %45 = (%45 && %48)
    if (%45 == 0) branch %14
    %49 = (4 * 4)
    %49 = (%49 + %16)
    *(%49 + 0) = 9
    branch %15
    %14:
    %50 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %50
    call _PrintString
    call _Halt
    %15:
    parm 8
    %52 = call _Alloc
    %53 = FUNC<length>
    *(%52 + 0) = %53
    *(%52 + 4) = %16
    %51 = (5 >= 0)
    %54 = (5 < %52)
    %51 = (%51 && %54)
    if (%51 == 0) branch %16
    %55 = (5 * 4)
    %55 = (%55 + %16)
    *(%55 + 0) = 0
    branch %17
    %16:
    %56 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %56
    call _PrintString
    call _Halt
    %17:
    parm 4
    %58 = call _Alloc
    %59 = FUNC<lambda_32_22>
    *(%58 + 0) = %59
    %57 = %58
    %61 = *(%57 + 0)
    parm %57
    parm 10
    parm %16
    %60 = call %61
    parm 4
    %63 = call _Alloc
    %64 = FUNC<lambda_42_17>
    *(%63 + 0) = %64
    %62 = %63
    %66 = *(%62 + 0)
    parm %62
    parm 1
    %65 = call %66
    %68 = *(%65 + 0)
    parm %65
    %67 = call %68
    %70 = *(%62 + 0)
    parm %62
    parm 0
    %69 = call %70
    %72 = *(%69 + 0)
    parm %69
    %71 = call %72
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
    parm 8
    %5 = call _Alloc
    %6 = FUNC<length>
    *(%5 + 0) = %6
    *(%5 + 4) = %2
    %4 = (%3 >= 0)
    %7 = (%3 < %5)
    %4 = (%4 && %7)
    if (%4 == 0) branch %22
    %8 = (%3 * 4)
    %8 = (%8 + %2)
    %9 = *(%8 + 0)
    branch %23
    %22:
    %10 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %10
    call _PrintString
    call _Halt
    %23:
    %11 = (%9 == 0)
    if (%11 == 0) branch %21
    return
    %21:
    parm 8
    %13 = call _Alloc
    %14 = FUNC<length>
    *(%13 + 0) = %14
    *(%13 + 4) = %2
    %12 = (%3 >= 0)
    %15 = (%3 < %13)
    %12 = (%12 && %15)
    if (%12 == 0) branch %24
    %16 = (%3 * 4)
    %16 = (%16 + %2)
    %17 = *(%16 + 0)
    branch %25
    %24:
    %18 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %18
    call _PrintString
    call _Halt
    %25:
    parm %17
    call _PrintInt
    %19 = (%3 + 1)
    %3 = %19
    %18:
    %20 = (%3 < %1)
    if (%20 != 0) branch %19
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

