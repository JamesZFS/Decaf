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
    parm 404
    %4 = call _Alloc
    %2 = (%4 + 404)
    %4 = (%4 + 4)
    branch %3
    %2:
    %2 = (%2 - 4)
    *(%2 + 0) = 0
    %3:
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
    %11 = *(%0 + 4)
    %5 = *(%2 - 4)
    %4 = (%11 >= 0)
    %6 = (%11 < %5)
    %4 = (%4 && %6)
    if (%4 == 0) branch %2
    %7 = (%11 * 4)
    %7 = (%7 + %2)
    *(%7 + 0) = %1
    branch %3
    %2:
    %8 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %8
    call _PrintString
    call _Halt
    %3:
    %10 = (%11 + 1)
    *(%0 + 4) = %10
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
    %13 = *(%0 + 4)
    %14 = (%13 - 1)
    %6 = *(%2 - 4)
    %5 = (%14 >= 0)
    %7 = (%14 < %6)
    %5 = (%5 && %7)
    if (%5 == 0) branch %2
    %8 = (%14 * 4)
    %8 = (%8 + %2)
    %9 = *(%8 + 0)
    branch %3
    %2:
    %10 = "Decaf runtime error: Array subscript out of bounds\n"
    parm %10
    call _PrintString
    call _Halt
    %3:
    *(%0 + 4) = %14
    return %9
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
    %2 = FUNC<_Stack.Init._entry>
    parm 8
    %3 = call _Alloc
    *(%3 + 0) = %2
    *(%3 + 4) = %1
    %4 = *(%3 + 0)
    parm %3
    call %4
    %5 = FUNC<_Stack.Push._entry>
    parm 8
    %6 = call _Alloc
    *(%6 + 0) = %5
    *(%6 + 4) = %1
    %7 = *(%6 + 0)
    parm %6
    parm 3
    call %7
    %8 = FUNC<_Stack.Push._entry>
    parm 8
    %9 = call _Alloc
    *(%9 + 0) = %8
    *(%9 + 4) = %1
    %10 = *(%9 + 0)
    parm %9
    parm 7
    call %10
    %11 = FUNC<_Stack.Push._entry>
    parm 8
    %12 = call _Alloc
    *(%12 + 0) = %11
    *(%12 + 4) = %1
    %13 = *(%12 + 0)
    parm %12
    parm 4
    call %13
    %14 = FUNC<_Stack.NumElems._entry>
    parm 8
    %15 = call _Alloc
    *(%15 + 0) = %14
    *(%15 + 4) = %1
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
    *(%20 + 4) = %1
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
    *(%25 + 4) = %1
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
    *(%30 + 4) = %1
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
    *(%35 + 4) = %1
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

