VTBL<_Stack> {
    0
    "Stack"
    FUNC<_Stack.Init>
    FUNC<_Stack.Push>
    FUNC<_Stack.Pop>
    FUNC<_Stack.NumElems>
}

VTBL<_Main> {
    0
    "Main"
}

FUNC<_Stack._new> {
    parm 12
    %0 = call _Alloc
    %1 = VTBL<_Stack>
    *(%0 + 0) = %1
    *(%0 + 4) = 0
    *(%0 + 8) = 0
    return %0
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

FUNC<_Stack.Init> {
    %1 = (100 < 0)
    if (%1 == 0) branch %0
    %3 = "Decaf runtime error: Cannot create negative-sized array\n"
    parm %3
    call _PrintString
    call _Halt
    %0:
    %2 = (100 * 4)
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
    *(%4 - 4) = 100
    *(%0 + 8) = %4
    *(%0 + 4) = 0
    %5 = FUNC<_Stack.Push._entry>
    parm 8
    %6 = call _Alloc
    *(%6 + 0) = %5
    *(%6 + 4) = %0
    %7 = *(%6 + 0)
    parm %6
    parm 3
    call %7
    return
}

FUNC<_Stack.Init._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 8)
    parm %1
    call %2
    return
}

FUNC<_Stack.Push> {
    %2 = *(%0 + 8)
    %3 = *(%0 + 4)
    parm 8
    %5 = call _Alloc
    %6 = FUNC<length>
    *(%5 + 0) = %6
    *(%5 + 4) = %2
    %4 = (%3 >= 0)
    %7 = (%3 < %5)
    %4 = (%4 && %7)
    if (%4 == 0) branch %0
    %8 = (%3 * 4)
    %8 = (%8 + %2)
    *(%8 + 0) = %1
    branch %1
    %0:
    %9 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %9
    call _PrintString
    call _Halt
    %1:
    %10 = *(%0 + 4)
    %11 = (%10 + 1)
    *(%0 + 4) = %11
    return
}

FUNC<_Stack.Push._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 12)
    parm %2
    parm %1
    call %3
    return
}

FUNC<_Stack.Pop> {
    %2 = *(%0 + 8)
    %3 = *(%0 + 4)
    %4 = (%3 - 1)
    parm 8
    %6 = call _Alloc
    %7 = FUNC<length>
    *(%6 + 0) = %7
    *(%6 + 4) = %2
    %5 = (%4 >= 0)
    %8 = (%4 < %6)
    %5 = (%5 && %8)
    if (%5 == 0) branch %0
    %9 = (%4 * 4)
    %9 = (%9 + %2)
    %10 = *(%9 + 0)
    branch %1
    %0:
    %11 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %11
    call _PrintString
    call _Halt
    %1:
    %1 = %10
    %12 = *(%0 + 4)
    %13 = (%12 - 1)
    *(%0 + 4) = %13
    return %1
}

FUNC<_Stack.Pop._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 16)
    parm %2
    %1 = call %3
    return %1
}

FUNC<_Stack.NumElems> {
    %1 = *(%0 + 4)
    return %1
}

FUNC<_Stack.NumElems._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 20)
    parm %2
    %1 = call %3
    return %1
}

FUNC<_Stack.main> {
    %1 = call _Stack._new
    %0 = %1
    %2 = FUNC<_Stack.Init._entry>
    parm 8
    %3 = call _Alloc
    *(%3 + 0) = %2
    *(%3 + 4) = %0
    %4 = *(%3 + 0)
    parm %3
    call %4
    %5 = FUNC<_Stack.Push._entry>
    parm 8
    %6 = call _Alloc
    *(%6 + 0) = %5
    *(%6 + 4) = %0
    %7 = *(%6 + 0)
    parm %6
    parm 3
    call %7
    %8 = FUNC<_Stack.Push._entry>
    parm 8
    %9 = call _Alloc
    *(%9 + 0) = %8
    *(%9 + 4) = %0
    %10 = *(%9 + 0)
    parm %9
    parm 7
    call %10
    %11 = FUNC<_Stack.Push._entry>
    parm 8
    %12 = call _Alloc
    *(%12 + 0) = %11
    *(%12 + 4) = %0
    %13 = *(%12 + 0)
    parm %12
    parm 4
    call %13
    %14 = FUNC<_Stack.NumElems._entry>
    parm 8
    %15 = call _Alloc
    *(%15 + 0) = %14
    *(%15 + 4) = %0
    %17 = *(%15 + 0)
    parm %15
    %16 = call %17
    parm %16
    call _PrintInt
    %18 = " "
    parm %18
    call _PrintString
    %19 = FUNC<_Stack.Pop._entry>
    parm 8
    %20 = call _Alloc
    *(%20 + 0) = %19
    *(%20 + 4) = %0
    %22 = *(%20 + 0)
    parm %20
    %21 = call %22
    parm %21
    call _PrintInt
    %23 = " "
    parm %23
    call _PrintString
    %24 = FUNC<_Stack.Pop._entry>
    parm 8
    %25 = call _Alloc
    *(%25 + 0) = %24
    *(%25 + 4) = %0
    %27 = *(%25 + 0)
    parm %25
    %26 = call %27
    parm %26
    call _PrintInt
    %28 = " "
    parm %28
    call _PrintString
    %29 = FUNC<_Stack.Pop._entry>
    parm 8
    %30 = call _Alloc
    *(%30 + 0) = %29
    *(%30 + 4) = %0
    %32 = *(%30 + 0)
    parm %30
    %31 = call %32
    parm %31
    call _PrintInt
    %33 = " "
    parm %33
    call _PrintString
    %34 = FUNC<_Stack.NumElems._entry>
    parm 8
    %35 = call _Alloc
    *(%35 + 0) = %34
    *(%35 + 4) = %0
    %37 = *(%35 + 0)
    parm %35
    %36 = call %37
    parm %36
    call _PrintInt
    return
}

FUNC<_Stack.main._entry> {
    call _Stack.main
    return
}

FUNC<main> {
    %0 = FUNC<_Stack.main._entry>
    parm 4
    %1 = call _Alloc
    *(%1 + 0) = %0
    %2 = *(%1 + 0)
    parm %1
    call %2
    return
}

FUNC<main._entry> {
    call main
    return
}

