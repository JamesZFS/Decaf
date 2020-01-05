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
    parm 2004
    %9 = call _Alloc
    %7 = (%9 + 2004)
    %9 = (%9 + 4)
    branch %3
    %2:
    %7 = (%7 - 4)
    *(%7 + 0) = 0
    %3:
    %6 = (%7 == %9)
    if (%6 == 0) branch %2
    *(%9 - 4) = 500
    parm 2004
    %14 = call _Alloc
    %12 = (%14 + 2004)
    %14 = (%14 + 4)
    branch %7
    %6:
    %12 = (%12 - 4)
    *(%12 + 0) = 0
    %7:
    %11 = (%12 == %14)
    if (%11 == 0) branch %6
    *(%14 - 4) = 500
    %15 = 0
    branch %20
    %9:
    %16 = FUNC<_Rng.next._entry>
    parm 8
    %17 = call _Alloc
    *(%17 + 0) = %16
    *(%17 + 4) = %3
    %19 = *(%17 + 0)
    parm %17
    %18 = call %19
    %22 = (%18 % 500)
    %88 = *(%9 - 4)
    %89 = (%15 >= 0)
    %93 = (%15 < %88)
    %95 = (%89 && %93)
    if (%95 == 0) branch %12
    %90 = (%15 * 4)
    %94 = (%90 + %9)
    *(%94 + 0) = %22
    branch %13
    %12:
    %27 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %27
    call _PrintString
    call _Halt
    %13:
    if (%95 == 0) branch %15
    %32 = *(%94 + 0)
    branch %16
    %15:
    %33 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %33
    call _PrintString
    call _Halt
    %16:
    %35 = *(%14 - 4)
    %36 = (%15 < %35)
    %34 = (%89 && %36)
    if (%34 == 0) branch %18
    %37 = (%90 + %14)
    *(%37 + 0) = %32
    branch %19
    %18:
    %38 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %38
    call _PrintString
    call _Halt
    %19:
    %39 = (%15 + 1)
    %15 = %39
    %20:
    parm 8
    %40 = call _Alloc
    %41 = FUNC<length>
    *(%40 + 0) = %41
    *(%40 + 4) = %9
    %43 = *(%40 + 0)
    parm %40
    %42 = call %43
    %44 = (%15 < %42)
    if (%44 != 0) branch %9
    %45 = FUNC<_QuickSort.sort._entry>
    parm 4
    %46 = call _Alloc
    *(%46 + 0) = %45
    parm 8
    %47 = call _Alloc
    %48 = FUNC<length>
    *(%47 + 0) = %48
    *(%47 + 4) = %9
    %50 = *(%47 + 0)
    parm %47
    %49 = call %50
    %51 = (%49 - 1)
    %52 = *(%46 + 0)
    parm %46
    parm %9
    parm 0
    parm %51
    call %52
    %53 = 0
    branch %26
    %22:
    %55 = *(%9 - 4)
    %54 = (%53 >= 0)
    %56 = (%53 < %55)
    %54 = (%54 && %56)
    if (%54 == 0) branch %24
    %57 = (%53 * 4)
    %57 = (%57 + %9)
    %58 = *(%57 + 0)
    branch %25
    %24:
    %59 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %59
    call _PrintString
    call _Halt
    %25:
    parm %58
    call _PrintInt
    %60 = " "
    parm %60
    call _PrintString
    %61 = (%53 + 1)
    %53 = %61
    %26:
    parm 8
    %62 = call _Alloc
    %63 = FUNC<length>
    *(%62 + 0) = %63
    *(%62 + 4) = %9
    %65 = *(%62 + 0)
    parm %62
    %64 = call %65
    %66 = (%53 < %64)
    if (%66 != 0) branch %22
    %67 = "\n"
    parm %67
    call _PrintString
    %68 = FUNC<_MergeSort.sort._entry>
    parm 4
    %69 = call _Alloc
    *(%69 + 0) = %68
    %70 = *(%69 + 0)
    parm %69
    parm %14
    call %70
    %71 = 0
    branch %32
    %28:
    %73 = *(%14 - 4)
    %72 = (%71 >= 0)
    %74 = (%71 < %73)
    %72 = (%72 && %74)
    if (%72 == 0) branch %30
    %75 = (%71 * 4)
    %75 = (%75 + %14)
    %76 = *(%75 + 0)
    branch %31
    %30:
    %77 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %77
    call _PrintString
    call _Halt
    %31:
    parm %76
    call _PrintInt
    %78 = " "
    parm %78
    call _PrintString
    %79 = (%71 + 1)
    %71 = %79
    %32:
    parm 8
    %80 = call _Alloc
    %81 = FUNC<length>
    *(%80 + 0) = %81
    *(%80 + 4) = %14
    %83 = *(%80 + 0)
    parm %80
    %82 = call %83
    %84 = (%71 < %82)
    if (%84 != 0) branch %28
    %85 = "\n"
    parm %85
    call _PrintString
    return
}

FUNC<main._entry> {
    call main
    return
}

FUNC<_Rng.make> {
    %2 = call _Rng._new
    *(%2 + 4) = %0
    return %2
}

FUNC<_Rng.make._entry> {
    parm %1
    %2 = call _Rng.make
    return %2
}

FUNC<_Rng.next> {
    %1 = *(%0 + 4)
    %4 = (%1 % 10000)
    %5 = (15625 * %4)
    %6 = (%5 + 22221)
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
    %9 = (%6 / 2)
    %10 = (%1 + %9)
    %68 = *(%0 - 4)
    %11 = (%10 >= 0)
    %13 = (%10 < %68)
    %11 = (%11 && %13)
    if (%11 == 0) branch %3
    %14 = (%10 * 4)
    %14 = (%14 + %0)
    %15 = *(%14 + 0)
    branch %4
    %3:
    %16 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %16
    call _PrintString
    call _Halt
    %4:
    branch %31
    %5:
    branch %7
    %6:
    %17 = (%3 + 1)
    %3 = %17
    %7:
    %69 = %68
    %71 = (%3 >= 0)
    %20 = (%3 < %68)
    %18 = (%71 && %20)
    if (%18 == 0) branch %9
    %72 = (%3 * 4)
    %82 = (%72 + %0)
    %89 = *(%82 + 0)
    branch %10
    %9:
    %23 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %23
    call _PrintString
    call _Halt
    %10:
    %24 = (%89 < %15)
    if (%24 != 0) branch %6
    branch %13
    %12:
    %25 = (%4 - 1)
    %4 = %25
    %13:
    %68 = %69
    %74 = (%4 >= 0)
    %83 = (%4 < %69)
    %90 = (%74 && %83)
    if (%90 == 0) branch %15
    %75 = (%4 * 4)
    %84 = (%75 + %0)
    %91 = *(%84 + 0)
    branch %16
    %15:
    %31 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %31
    call _PrintString
    call _Halt
    %16:
    %32 = (%91 > %15)
    if (%32 != 0) branch %12
    %33 = (%3 <= %4)
    if (%33 == 0) branch %31
    %85 = (%3 < %69)
    %92 = (%71 && %85)
    if (%92 == 0) branch %20
    branch %21
    %20:
    %40 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %40
    call _PrintString
    call _Halt
    %21:
    if (%90 == 0) branch %23
    branch %24
    %23:
    %46 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %46
    call _PrintString
    call _Halt
    %24:
    if (%92 == 0) branch %26
    *(%82 + 0) = %91
    branch %27
    %26:
    %51 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %51
    call _PrintString
    call _Halt
    %27:
    %68 = %69
    if (%90 == 0) branch %29
    *(%84 + 0) = %89
    branch %30
    %29:
    %56 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %56
    call _PrintString
    call _Halt
    %30:
    %57 = (%3 + 1)
    %3 = %57
    %58 = (%4 - 1)
    %4 = %58
    %31:
    %59 = (%3 <= %4)
    if (%59 != 0) branch %5
    %60 = (%1 < %4)
    if (%60 == 0) branch %34
    %61 = FUNC<_QuickSort.sort._entry>
    parm 4
    %62 = call _Alloc
    *(%62 + 0) = %61
    %63 = *(%62 + 0)
    parm %62
    parm %0
    parm %1
    parm %4
    call %63
    %34:
    %64 = (%3 < %2)
    if (%64 == 0) branch %36
    %65 = FUNC<_QuickSort.sort._entry>
    parm 4
    %66 = call _Alloc
    *(%66 + 0) = %65
    %67 = *(%66 + 0)
    parm %66
    parm %0
    parm %3
    parm %2
    call %67
    %36:
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
    if (%11 == 0) branch %2
    %13 = "Decaf runtime error: Cannot create negative-sized array\n"
    parm %13
    call _PrintString
    call _Halt
    %2:
    %12 = (%9 * 4)
    %12 = (%12 + 4)
    parm %12
    %14 = call _Alloc
    %12 = (%14 + %12)
    %14 = (%14 + 4)
    branch %4
    %3:
    %12 = (%12 - 4)
    *(%12 + 0) = 0
    %4:
    %11 = (%12 == %14)
    if (%11 == 0) branch %3
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
    if (%5 == 0) branch %44
    %7 = (%1 + %2)
    %10 = (%7 / 2)
    %11 = FUNC<_MergeSort.sort_impl._entry>
    parm 4
    %12 = call _Alloc
    *(%12 + 0) = %11
    %13 = *(%12 + 0)
    parm %12
    parm %0
    parm %1
    parm %10
    parm %3
    call %13
    %14 = FUNC<_MergeSort.sort_impl._entry>
    parm 4
    %15 = call _Alloc
    *(%15 + 0) = %14
    %16 = *(%15 + 0)
    parm %15
    parm %0
    parm %10
    parm %2
    parm %3
    call %16
    %17 = %1
    %18 = %10
    %19 = 0
    branch %25
    %3:
    %89 = *(%0 - 4)
    %91 = (%18 >= 0)
    %96 = (%18 < %89)
    %100 = (%91 && %96)
    if (%100 == 0) branch %5
    %92 = (%18 * 4)
    %97 = (%92 + %0)
    %101 = *(%97 + 0)
    branch %6
    %5:
    %25 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %25
    call _PrintString
    call _Halt
    %6:
    %94 = (%17 >= 0)
    %98 = (%17 < %89)
    %102 = (%94 && %98)
    if (%102 == 0) branch %8
    %95 = (%17 * 4)
    %99 = (%95 + %0)
    %103 = *(%99 + 0)
    branch %9
    %8:
    %31 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %31
    call _PrintString
    call _Halt
    %9:
    %32 = (%101 < %103)
    if (%32 == 0) branch %17
    if (%100 == 0) branch %12
    branch %13
    %12:
    %38 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %38
    call _PrintString
    call _Halt
    %13:
    %40 = *(%3 - 4)
    %39 = (%19 >= 0)
    %41 = (%19 < %40)
    %39 = (%39 && %41)
    if (%39 == 0) branch %15
    %42 = (%19 * 4)
    %42 = (%42 + %3)
    *(%42 + 0) = %101
    branch %16
    %15:
    %43 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %43
    call _PrintString
    call _Halt
    %16:
    %44 = (%18 + 1)
    %18 = %44
    branch %24
    %17:
    if (%102 == 0) branch %19
    branch %20
    %19:
    %50 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %50
    call _PrintString
    call _Halt
    %20:
    %52 = *(%3 - 4)
    %51 = (%19 >= 0)
    %53 = (%19 < %52)
    %51 = (%51 && %53)
    if (%51 == 0) branch %22
    %54 = (%19 * 4)
    %54 = (%54 + %3)
    *(%54 + 0) = %103
    branch %23
    %22:
    %55 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %55
    call _PrintString
    call _Halt
    %23:
    %56 = (%17 + 1)
    %17 = %56
    %24:
    %57 = (%19 + 1)
    %19 = %57
    %25:
    %58 = (%17 < %10)
    %59 = (%18 < %2)
    %60 = (%58 && %59)
    if (%60 != 0) branch %3
    branch %34
    %27:
    %62 = *(%0 - 4)
    %61 = (%17 >= 0)
    %63 = (%17 < %62)
    %61 = (%61 && %63)
    if (%61 == 0) branch %29
    %64 = (%17 * 4)
    %64 = (%64 + %0)
    %65 = *(%64 + 0)
    branch %30
    %29:
    %66 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %66
    call _PrintString
    call _Halt
    %30:
    %68 = *(%3 - 4)
    %67 = (%19 >= 0)
    %69 = (%19 < %68)
    %67 = (%67 && %69)
    if (%67 == 0) branch %32
    %70 = (%19 * 4)
    %70 = (%70 + %3)
    *(%70 + 0) = %65
    branch %33
    %32:
    %71 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %71
    call _PrintString
    call _Halt
    %33:
    %72 = (%19 + 1)
    %19 = %72
    %73 = (%17 + 1)
    %17 = %73
    %34:
    %74 = (%17 < %10)
    if (%74 != 0) branch %27
    %17 = 0
    branch %43
    %36:
    %76 = *(%3 - 4)
    %75 = (%17 >= 0)
    %77 = (%17 < %76)
    %75 = (%75 && %77)
    if (%75 == 0) branch %38
    %78 = (%17 * 4)
    %78 = (%78 + %3)
    %79 = *(%78 + 0)
    branch %39
    %38:
    %80 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %80
    call _PrintString
    call _Halt
    %39:
    %81 = (%17 + %1)
    %83 = *(%0 - 4)
    %82 = (%81 >= 0)
    %84 = (%81 < %83)
    %82 = (%82 && %84)
    if (%82 == 0) branch %41
    %85 = (%81 * 4)
    %85 = (%85 + %0)
    *(%85 + 0) = %79
    branch %42
    %41:
    %86 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %86
    call _PrintString
    call _Halt
    %42:
    %87 = (%17 + 1)
    %17 = %87
    %43:
    %88 = (%17 < %19)
    if (%88 != 0) branch %36
    %44:
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

