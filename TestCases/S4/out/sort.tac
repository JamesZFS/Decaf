VTBL<_Main> {
    0
    "Main"
}

VTBL<_Rng> {
    0
    "Rng"
    FUNC<_Rng.next>
}

VTBL<_QuickSort> {
    0
    "QuickSort"
}

VTBL<_MergeSort> {
    0
    "MergeSort"
}

FUNC<_Main._new> {
    parm 4
    %0 = call _Alloc
    %1 = VTBL<_Main>
    *(%0 + 0) = %1
    return %0
}

FUNC<_Rng._new> {
    parm 8
    %0 = call _Alloc
    %1 = VTBL<_Rng>
    *(%0 + 0) = %1
    *(%0 + 4) = 0
    return %0
}

FUNC<_QuickSort._new> {
    parm 4
    %0 = call _Alloc
    %1 = VTBL<_QuickSort>
    *(%0 + 0) = %1
    return %0
}

FUNC<_MergeSort._new> {
    parm 4
    %0 = call _Alloc
    %1 = VTBL<_MergeSort>
    *(%0 + 0) = %1
    return %0
}

FUNC<length> {
    %1 = *(%0 + 4)
    %1 = *(%1 - 4)
    return %1
}

FUNC<main> {
    %1 = FUNC<_Rng.make._entry>
    parm 4
    %2 = call _Alloc
    *(%2 + 0) = %1
    %4 = *(%2 + 0)
    parm %2
    parm 19260817
    %3 = call %4
    %0 = %3
    %6 = (500 < 0)
    if (%6 == 0) branch %0
    %8 = "Decaf runtime error: Cannot create negative-sized array\n"
    parm %8
    call _PrintString
    call _Halt
    %0:
    %7 = (500 * 4)
    %7 = (%7 + 4)
    parm %7
    %9 = call _Alloc
    %7 = (%9 + %7)
    %9 = (%9 + 4)
    branch %1
    %2:
    %7 = (%7 - 4)
    *(%7 + 0) = 0
    %1:
    %6 = (%7 == %9)
    if (%6 == 0) branch %2
    *(%9 - 4) = 500
    %5 = %9
    %11 = (500 < 0)
    if (%11 == 0) branch %3
    %13 = "Decaf runtime error: Cannot create negative-sized array\n"
    parm %13
    call _PrintString
    call _Halt
    %3:
    %12 = (500 * 4)
    %12 = (%12 + 4)
    parm %12
    %14 = call _Alloc
    %12 = (%14 + %12)
    %14 = (%14 + 4)
    branch %4
    %5:
    %12 = (%12 - 4)
    *(%12 + 0) = 0
    %4:
    %11 = (%12 == %14)
    if (%11 == 0) branch %5
    *(%14 - 4) = 500
    %10 = %14
    %15 = 0
    branch %6
    %7:
    %16 = FUNC<_Rng.next._entry>
    parm 8
    %17 = call _Alloc
    *(%17 + 0) = %16
    *(%17 + 4) = %0
    %19 = *(%17 + 0)
    parm %17
    %18 = call %19
    %20 = (500 == 0)
    if (%20 == 0) branch %9
    %21 = "Decaf runtime error: Division by zero error"
    parm %21
    call _PrintString
    call _Halt
    %9:
    %22 = (%18 % 500)
    parm 8
    %24 = call _Alloc
    %25 = FUNC<length>
    *(%24 + 0) = %25
    *(%24 + 4) = %5
    %23 = (%15 >= 0)
    %26 = (%15 < %24)
    %23 = (%23 && %26)
    if (%23 == 0) branch %10
    %27 = (%15 * 4)
    %27 = (%27 + %5)
    *(%27 + 0) = %22
    branch %11
    %10:
    %28 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %28
    call _PrintString
    call _Halt
    %11:
    parm 8
    %30 = call _Alloc
    %31 = FUNC<length>
    *(%30 + 0) = %31
    *(%30 + 4) = %5
    %29 = (%15 >= 0)
    %32 = (%15 < %30)
    %29 = (%29 && %32)
    if (%29 == 0) branch %12
    %33 = (%15 * 4)
    %33 = (%33 + %5)
    %34 = *(%33 + 0)
    branch %13
    %12:
    %35 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %35
    call _PrintString
    call _Halt
    %13:
    parm 8
    %37 = call _Alloc
    %38 = FUNC<length>
    *(%37 + 0) = %38
    *(%37 + 4) = %10
    %36 = (%15 >= 0)
    %39 = (%15 < %37)
    %36 = (%36 && %39)
    if (%36 == 0) branch %14
    %40 = (%15 * 4)
    %40 = (%40 + %10)
    *(%40 + 0) = %34
    branch %15
    %14:
    %41 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %41
    call _PrintString
    call _Halt
    %15:
    %42 = (%15 + 1)
    %15 = %42
    %6:
    parm 8
    %43 = call _Alloc
    %44 = FUNC<length>
    *(%43 + 0) = %44
    *(%43 + 4) = %5
    %46 = *(%43 + 0)
    parm %43
    %45 = call %46
    %47 = (%15 < %45)
    if (%47 != 0) branch %7
    %8:
    %48 = FUNC<_QuickSort.sort._entry>
    parm 4
    %49 = call _Alloc
    *(%49 + 0) = %48
    parm 8
    %50 = call _Alloc
    %51 = FUNC<length>
    *(%50 + 0) = %51
    *(%50 + 4) = %5
    %53 = *(%50 + 0)
    parm %50
    %52 = call %53
    %54 = (%52 - 1)
    %55 = *(%49 + 0)
    parm %49
    parm %5
    parm 0
    parm %54
    call %55
    %56 = 0
    branch %16
    %17:
    parm 8
    %58 = call _Alloc
    %59 = FUNC<length>
    *(%58 + 0) = %59
    *(%58 + 4) = %5
    %57 = (%56 >= 0)
    %60 = (%56 < %58)
    %57 = (%57 && %60)
    if (%57 == 0) branch %19
    %61 = (%56 * 4)
    %61 = (%61 + %5)
    %62 = *(%61 + 0)
    branch %20
    %19:
    %63 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %63
    call _PrintString
    call _Halt
    %20:
    parm %62
    call _PrintInt
    %64 = " "
    parm %64
    call _PrintString
    %65 = (%56 + 1)
    %56 = %65
    %16:
    parm 8
    %66 = call _Alloc
    %67 = FUNC<length>
    *(%66 + 0) = %67
    *(%66 + 4) = %5
    %69 = *(%66 + 0)
    parm %66
    %68 = call %69
    %70 = (%56 < %68)
    if (%70 != 0) branch %17
    %18:
    %71 = "\n"
    parm %71
    call _PrintString
    %72 = FUNC<_MergeSort.sort._entry>
    parm 4
    %73 = call _Alloc
    *(%73 + 0) = %72
    %74 = *(%73 + 0)
    parm %73
    parm %10
    call %74
    %75 = 0
    branch %21
    %22:
    parm 8
    %77 = call _Alloc
    %78 = FUNC<length>
    *(%77 + 0) = %78
    *(%77 + 4) = %10
    %76 = (%75 >= 0)
    %79 = (%75 < %77)
    %76 = (%76 && %79)
    if (%76 == 0) branch %24
    %80 = (%75 * 4)
    %80 = (%80 + %10)
    %81 = *(%80 + 0)
    branch %25
    %24:
    %82 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %82
    call _PrintString
    call _Halt
    %25:
    parm %81
    call _PrintInt
    %83 = " "
    parm %83
    call _PrintString
    %84 = (%75 + 1)
    %75 = %84
    %21:
    parm 8
    %85 = call _Alloc
    %86 = FUNC<length>
    *(%85 + 0) = %86
    *(%85 + 4) = %10
    %88 = *(%85 + 0)
    parm %85
    %87 = call %88
    %89 = (%75 < %87)
    if (%89 != 0) branch %22
    %23:
    %90 = "\n"
    parm %90
    call _PrintString
    return
}

FUNC<main._entry> {
    call main
    return
}

FUNC<_Rng.make> {
    %2 = call _Rng._new
    %1 = %2
    *(%1 + 4) = %0
    return %1
}

FUNC<_Rng.make._entry> {
    parm %1
    %1 = call _Rng.make
    return %1
}

FUNC<_Rng.next> {
    %1 = *(%0 + 4)
    %2 = (10000 == 0)
    if (%2 == 0) branch %0
    %3 = "Decaf runtime error: Division by zero error"
    parm %3
    call _PrintString
    call _Halt
    %0:
    %4 = (%1 % 10000)
    %5 = (15625 * %4)
    %6 = (%5 + 22221)
    %7 = (65536 == 0)
    if (%7 == 0) branch %1
    %8 = "Decaf runtime error: Division by zero error"
    parm %8
    call _PrintString
    call _Halt
    %1:
    %9 = (%6 % 65536)
    *(%0 + 4) = %9
    %10 = *(%0 + 4)
    return %10
}

FUNC<_Rng.next._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 8)
    parm %2
    %1 = call %3
    return %1
}

FUNC<_QuickSort.sort> {
    %3 = %1
    %4 = %2
    %6 = (%2 - %1)
    %7 = (2 == 0)
    if (%7 == 0) branch %0
    %8 = "Decaf runtime error: Division by zero error"
    parm %8
    call _PrintString
    call _Halt
    %0:
    %9 = (%6 / 2)
    %10 = (%1 + %9)
    parm 8
    %12 = call _Alloc
    %13 = FUNC<length>
    *(%12 + 0) = %13
    *(%12 + 4) = %0
    %11 = (%10 >= 0)
    %14 = (%10 < %12)
    %11 = (%11 && %14)
    if (%11 == 0) branch %1
    %15 = (%10 * 4)
    %15 = (%15 + %0)
    %16 = *(%15 + 0)
    branch %2
    %1:
    %17 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %17
    call _PrintString
    call _Halt
    %2:
    %5 = %16
    branch %3
    %4:
    branch %6
    %7:
    %18 = (%3 + 1)
    %3 = %18
    %6:
    parm 8
    %20 = call _Alloc
    %21 = FUNC<length>
    *(%20 + 0) = %21
    *(%20 + 4) = %0
    %19 = (%3 >= 0)
    %22 = (%3 < %20)
    %19 = (%19 && %22)
    if (%19 == 0) branch %9
    %23 = (%3 * 4)
    %23 = (%23 + %0)
    %24 = *(%23 + 0)
    branch %10
    %9:
    %25 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %25
    call _PrintString
    call _Halt
    %10:
    %26 = (%24 < %5)
    if (%26 != 0) branch %7
    %8:
    branch %11
    %12:
    %27 = (%4 - 1)
    %4 = %27
    %11:
    parm 8
    %29 = call _Alloc
    %30 = FUNC<length>
    *(%29 + 0) = %30
    *(%29 + 4) = %0
    %28 = (%4 >= 0)
    %31 = (%4 < %29)
    %28 = (%28 && %31)
    if (%28 == 0) branch %14
    %32 = (%4 * 4)
    %32 = (%32 + %0)
    %33 = *(%32 + 0)
    branch %15
    %14:
    %34 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %34
    call _PrintString
    call _Halt
    %15:
    %35 = (%33 > %5)
    if (%35 != 0) branch %12
    %13:
    %36 = (%3 <= %4)
    if (%36 == 0) branch %16
    parm 8
    %39 = call _Alloc
    %40 = FUNC<length>
    *(%39 + 0) = %40
    *(%39 + 4) = %0
    %38 = (%3 >= 0)
    %41 = (%3 < %39)
    %38 = (%38 && %41)
    if (%38 == 0) branch %17
    %42 = (%3 * 4)
    %42 = (%42 + %0)
    %43 = *(%42 + 0)
    branch %18
    %17:
    %44 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %44
    call _PrintString
    call _Halt
    %18:
    %37 = %43
    parm 8
    %46 = call _Alloc
    %47 = FUNC<length>
    *(%46 + 0) = %47
    *(%46 + 4) = %0
    %45 = (%4 >= 0)
    %48 = (%4 < %46)
    %45 = (%45 && %48)
    if (%45 == 0) branch %19
    %49 = (%4 * 4)
    %49 = (%49 + %0)
    %50 = *(%49 + 0)
    branch %20
    %19:
    %51 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %51
    call _PrintString
    call _Halt
    %20:
    parm 8
    %53 = call _Alloc
    %54 = FUNC<length>
    *(%53 + 0) = %54
    *(%53 + 4) = %0
    %52 = (%3 >= 0)
    %55 = (%3 < %53)
    %52 = (%52 && %55)
    if (%52 == 0) branch %21
    %56 = (%3 * 4)
    %56 = (%56 + %0)
    *(%56 + 0) = %50
    branch %22
    %21:
    %57 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %57
    call _PrintString
    call _Halt
    %22:
    parm 8
    %59 = call _Alloc
    %60 = FUNC<length>
    *(%59 + 0) = %60
    *(%59 + 4) = %0
    %58 = (%4 >= 0)
    %61 = (%4 < %59)
    %58 = (%58 && %61)
    if (%58 == 0) branch %23
    %62 = (%4 * 4)
    %62 = (%62 + %0)
    *(%62 + 0) = %37
    branch %24
    %23:
    %63 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %63
    call _PrintString
    call _Halt
    %24:
    %64 = (%3 + 1)
    %3 = %64
    %65 = (%4 - 1)
    %4 = %65
    %16:
    %3:
    %66 = (%3 <= %4)
    if (%66 != 0) branch %4
    %5:
    %67 = (%1 < %4)
    if (%67 == 0) branch %25
    %68 = FUNC<_QuickSort.sort._entry>
    parm 4
    %69 = call _Alloc
    *(%69 + 0) = %68
    %70 = *(%69 + 0)
    parm %69
    parm %0
    parm %1
    parm %4
    call %70
    %25:
    %71 = (%3 < %2)
    if (%71 == 0) branch %26
    %72 = FUNC<_QuickSort.sort._entry>
    parm 4
    %73 = call _Alloc
    *(%73 + 0) = %72
    %74 = *(%73 + 0)
    parm %73
    parm %0
    parm %3
    parm %2
    call %74
    %26:
    return
}

FUNC<_QuickSort.sort._entry> {
    parm %1
    parm %2
    parm %3
    call _QuickSort.sort
    return
}

FUNC<_MergeSort.sort> {
    %1 = FUNC<_MergeSort.sort_impl._entry>
    parm 4
    %2 = call _Alloc
    *(%2 + 0) = %1
    parm 8
    %3 = call _Alloc
    %4 = FUNC<length>
    *(%3 + 0) = %4
    *(%3 + 4) = %0
    %6 = *(%3 + 0)
    parm %3
    %5 = call %6
    parm 8
    %7 = call _Alloc
    %8 = FUNC<length>
    *(%7 + 0) = %8
    *(%7 + 4) = %0
    %10 = *(%7 + 0)
    parm %7
    %9 = call %10
    %11 = (%9 < 0)
    if (%11 == 0) branch %0
    %13 = "Decaf runtime error: Cannot create negative-sized array\n"
    parm %13
    call _PrintString
    call _Halt
    %0:
    %12 = (%9 * 4)
    %12 = (%12 + 4)
    parm %12
    %14 = call _Alloc
    %12 = (%14 + %12)
    %14 = (%14 + 4)
    branch %1
    %2:
    %12 = (%12 - 4)
    *(%12 + 0) = 0
    %1:
    %11 = (%12 == %14)
    if (%11 == 0) branch %2
    *(%14 - 4) = %9
    %15 = *(%2 + 0)
    parm %2
    parm %0
    parm 0
    parm %5
    parm %14
    call %15
    return
}

FUNC<_MergeSort.sort._entry> {
    parm %1
    call _MergeSort.sort
    return
}

FUNC<_MergeSort.sort_impl> {
    %4 = (%1 + 1)
    %5 = (%4 < %2)
    if (%5 == 0) branch %0
    %7 = (%1 + %2)
    %8 = (2 == 0)
    if (%8 == 0) branch %1
    %9 = "Decaf runtime error: Division by zero error"
    parm %9
    call _PrintString
    call _Halt
    %1:
    %10 = (%7 / 2)
    %6 = %10
    %11 = FUNC<_MergeSort.sort_impl._entry>
    parm 4
    %12 = call _Alloc
    *(%12 + 0) = %11
    %13 = *(%12 + 0)
    parm %12
    parm %0
    parm %1
    parm %6
    parm %3
    call %13
    %14 = FUNC<_MergeSort.sort_impl._entry>
    parm 4
    %15 = call _Alloc
    *(%15 + 0) = %14
    %16 = *(%15 + 0)
    parm %15
    parm %0
    parm %6
    parm %2
    parm %3
    call %16
    %17 = %1
    %18 = %6
    %19 = 0
    branch %2
    %3:
    parm 8
    %21 = call _Alloc
    %22 = FUNC<length>
    *(%21 + 0) = %22
    *(%21 + 4) = %0
    %20 = (%18 >= 0)
    %23 = (%18 < %21)
    %20 = (%20 && %23)
    if (%20 == 0) branch %6
    %24 = (%18 * 4)
    %24 = (%24 + %0)
    %25 = *(%24 + 0)
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
    *(%28 + 4) = %0
    %27 = (%17 >= 0)
    %30 = (%17 < %28)
    %27 = (%27 && %30)
    if (%27 == 0) branch %8
    %31 = (%17 * 4)
    %31 = (%31 + %0)
    %32 = *(%31 + 0)
    branch %9
    %8:
    %33 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %33
    call _PrintString
    call _Halt
    %9:
    %34 = (%25 < %32)
    if (%34 == 0) branch %5
    parm 8
    %36 = call _Alloc
    %37 = FUNC<length>
    *(%36 + 0) = %37
    *(%36 + 4) = %0
    %35 = (%18 >= 0)
    %38 = (%18 < %36)
    %35 = (%35 && %38)
    if (%35 == 0) branch %10
    %39 = (%18 * 4)
    %39 = (%39 + %0)
    %40 = *(%39 + 0)
    branch %11
    %10:
    %41 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %41
    call _PrintString
    call _Halt
    %11:
    parm 8
    %43 = call _Alloc
    %44 = FUNC<length>
    *(%43 + 0) = %44
    *(%43 + 4) = %3
    %42 = (%19 >= 0)
    %45 = (%19 < %43)
    %42 = (%42 && %45)
    if (%42 == 0) branch %12
    %46 = (%19 * 4)
    %46 = (%46 + %3)
    *(%46 + 0) = %40
    branch %13
    %12:
    %47 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %47
    call _PrintString
    call _Halt
    %13:
    %48 = (%18 + 1)
    %18 = %48
    branch %14
    %5:
    parm 8
    %50 = call _Alloc
    %51 = FUNC<length>
    *(%50 + 0) = %51
    *(%50 + 4) = %0
    %49 = (%17 >= 0)
    %52 = (%17 < %50)
    %49 = (%49 && %52)
    if (%49 == 0) branch %15
    %53 = (%17 * 4)
    %53 = (%53 + %0)
    %54 = *(%53 + 0)
    branch %16
    %15:
    %55 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %55
    call _PrintString
    call _Halt
    %16:
    parm 8
    %57 = call _Alloc
    %58 = FUNC<length>
    *(%57 + 0) = %58
    *(%57 + 4) = %3
    %56 = (%19 >= 0)
    %59 = (%19 < %57)
    %56 = (%56 && %59)
    if (%56 == 0) branch %17
    %60 = (%19 * 4)
    %60 = (%60 + %3)
    *(%60 + 0) = %54
    branch %18
    %17:
    %61 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %61
    call _PrintString
    call _Halt
    %18:
    %62 = (%17 + 1)
    %17 = %62
    %14:
    %63 = (%19 + 1)
    %19 = %63
    %2:
    %64 = (%17 < %6)
    %65 = (%18 < %2)
    %66 = (%64 && %65)
    if (%66 != 0) branch %3
    %4:
    branch %19
    %20:
    parm 8
    %68 = call _Alloc
    %69 = FUNC<length>
    *(%68 + 0) = %69
    *(%68 + 4) = %0
    %67 = (%17 >= 0)
    %70 = (%17 < %68)
    %67 = (%67 && %70)
    if (%67 == 0) branch %22
    %71 = (%17 * 4)
    %71 = (%71 + %0)
    %72 = *(%71 + 0)
    branch %23
    %22:
    %73 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %73
    call _PrintString
    call _Halt
    %23:
    parm 8
    %75 = call _Alloc
    %76 = FUNC<length>
    *(%75 + 0) = %76
    *(%75 + 4) = %3
    %74 = (%19 >= 0)
    %77 = (%19 < %75)
    %74 = (%74 && %77)
    if (%74 == 0) branch %24
    %78 = (%19 * 4)
    %78 = (%78 + %3)
    *(%78 + 0) = %72
    branch %25
    %24:
    %79 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %79
    call _PrintString
    call _Halt
    %25:
    %80 = (%19 + 1)
    %19 = %80
    %81 = (%17 + 1)
    %17 = %81
    %19:
    %82 = (%17 < %6)
    if (%82 != 0) branch %20
    %21:
    %17 = 0
    branch %26
    %27:
    parm 8
    %84 = call _Alloc
    %85 = FUNC<length>
    *(%84 + 0) = %85
    *(%84 + 4) = %3
    %83 = (%17 >= 0)
    %86 = (%17 < %84)
    %83 = (%83 && %86)
    if (%83 == 0) branch %29
    %87 = (%17 * 4)
    %87 = (%87 + %3)
    %88 = *(%87 + 0)
    branch %30
    %29:
    %89 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %89
    call _PrintString
    call _Halt
    %30:
    %90 = (%17 + %1)
    parm 8
    %92 = call _Alloc
    %93 = FUNC<length>
    *(%92 + 0) = %93
    *(%92 + 4) = %0
    %91 = (%90 >= 0)
    %94 = (%90 < %92)
    %91 = (%91 && %94)
    if (%91 == 0) branch %31
    %95 = (%90 * 4)
    %95 = (%95 + %0)
    *(%95 + 0) = %88
    branch %32
    %31:
    %96 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %96
    call _PrintString
    call _Halt
    %32:
    %97 = (%17 + 1)
    %17 = %97
    %26:
    %98 = (%17 < %19)
    if (%98 != 0) branch %27
    %28:
    %0:
    return
}

FUNC<_MergeSort.sort_impl._entry> {
    parm %1
    parm %2
    parm %3
    parm %4
    call _MergeSort.sort_impl
    return
}

