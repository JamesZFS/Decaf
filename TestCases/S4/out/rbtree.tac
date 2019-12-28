VTBL<_Main> {
    0
    "Main"
}

VTBL<_Rng> {
    0
    "Rng"
    FUNC<_Rng.next>
}

VTBL<_Node> {
    0
    "Node"
}

VTBL<_RBTree> {
    VTBL<_Node>
    "RBTree"
    FUNC<_RBTree.transplant>
    FUNC<_RBTree.rotate>
    FUNC<_RBTree.insert_fix>
    FUNC<_RBTree.insert>
    FUNC<_RBTree.delete_fix>
    FUNC<_RBTree.delete>
    FUNC<_RBTree.print>
    FUNC<_RBTree.print_impl>
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

FUNC<_Node._new> {
    parm 24
    %0 = call _Alloc
    %1 = VTBL<_Node>
    *(%0 + 0) = %1
    *(%0 + 4) = 0
    *(%0 + 8) = 0
    *(%0 + 12) = 0
    *(%0 + 16) = 0
    *(%0 + 20) = 0
    return %0
}

FUNC<_RBTree._new> {
    parm 32
    %0 = call _Alloc
    %1 = VTBL<_RBTree>
    *(%0 + 0) = %1
    *(%0 + 4) = 0
    *(%0 + 8) = 0
    *(%0 + 12) = 0
    *(%0 + 16) = 0
    *(%0 + 20) = 0
    *(%0 + 24) = 0
    *(%0 + 28) = 0
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
    %6 = FUNC<_RBTree.make1._entry>
    parm 4
    %7 = call _Alloc
    *(%7 + 0) = %6
    %9 = *(%7 + 0)
    parm %7
    %8 = call %9
    %5 = %8
    %10 = 0
    branch %0
    %1:
    %11 = 0
    branch %3
    %4:
    %12 = FUNC<_RBTree.insert._entry>
    parm 8
    %13 = call _Alloc
    *(%13 + 0) = %12
    *(%13 + 4) = %5
    %14 = FUNC<_Rng.next._entry>
    parm 8
    %15 = call _Alloc
    *(%15 + 0) = %14
    *(%15 + 4) = %0
    %17 = *(%15 + 0)
    parm %15
    %16 = call %17
    %18 = (500 == 0)
    if (%18 == 0) branch %6
    %19 = "Decaf runtime error: Division by zero error"
    parm %19
    call _PrintString
    call _Halt
    %6:
    %20 = (%16 % 500)
    %21 = *(%13 + 0)
    parm %13
    parm %20
    call %21
    %22 = (%11 + 1)
    %11 = %22
    %3:
    %23 = (%11 < 500)
    if (%23 != 0) branch %4
    %5:
    %24 = 0
    branch %7
    %8:
    %25 = FUNC<_RBTree.delete._entry>
    parm 8
    %26 = call _Alloc
    *(%26 + 0) = %25
    *(%26 + 4) = %5
    %27 = FUNC<_Rng.next._entry>
    parm 8
    %28 = call _Alloc
    *(%28 + 0) = %27
    *(%28 + 4) = %0
    %30 = *(%28 + 0)
    parm %28
    %29 = call %30
    %31 = (500 == 0)
    if (%31 == 0) branch %10
    %32 = "Decaf runtime error: Division by zero error"
    parm %32
    call _PrintString
    call _Halt
    %10:
    %33 = (%29 % 500)
    %34 = *(%26 + 0)
    parm %26
    parm %33
    call %34
    %35 = (%24 + 1)
    %24 = %35
    %7:
    %36 = (%24 < 500)
    if (%36 != 0) branch %8
    %9:
    %37 = (%10 + 1)
    %10 = %37
    %0:
    %38 = (%10 < 5)
    if (%38 != 0) branch %1
    %2:
    %39 = FUNC<_RBTree.print._entry>
    parm 8
    %40 = call _Alloc
    *(%40 + 0) = %39
    *(%40 + 4) = %5
    %41 = *(%40 + 0)
    parm %40
    call %41
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

FUNC<_Node.make> {
    %4 = call _Node._new
    %3 = %4
    *(%3 + 4) = %2
    *(%3 + 16) = %0
    *(%3 + 8) = %1
    *(%3 + 12) = %1
    *(%3 + 20) = 1
    return %3
}

FUNC<_Node.make._entry> {
    parm %1
    parm %2
    parm %3
    %3 = call _Node.make
    return %3
}

FUNC<_RBTree.make1> {
    %1 = call _RBTree._new
    %0 = %1
    %3 = call _Node._new
    %2 = %3
    *(%2 + 16) = %2
    *(%2 + 8) = %2
    *(%2 + 12) = %2
    *(%0 + 24) = %2
    *(%0 + 28) = %2
    return %0
}

FUNC<_RBTree.make1._entry> {
    %0 = call _RBTree.make1
    return %0
}

FUNC<_RBTree.transplant> {
    %4 = *(%1 + 16)
    %3 = %4
    %5 = *(%0 + 28)
    %6 = (%3 == %5)
    if (%6 == 0) branch %0
    *(%0 + 24) = %2
    branch %1
    %0:
    %7 = *(%3 + 12)
    %8 = (%7 == %1)
    if (%8 == 0) branch %2
    *(%3 + 12) = %2
    branch %3
    %2:
    *(%3 + 8) = %2
    %3:
    %1:
    *(%2 + 16) = %3
    return
}

FUNC<_RBTree.transplant._entry> {
    %3 = *(%0 + 4)
    %4 = *(%3 + 0)
    %4 = *(%4 + 8)
    parm %3
    parm %1
    parm %2
    call %4
    return
}

FUNC<_RBTree.rotate> {
    %3 = *(%1 + 16)
    %2 = %3
    %5 = *(%2 + 16)
    %4 = %5
    *(%1 + 16) = %4
    %6 = *(%0 + 28)
    %7 = (%4 == %6)
    if (%7 == 0) branch %0
    *(%0 + 24) = %1
    branch %1
    %0:
    %8 = *(%4 + 12)
    %9 = (%8 == %2)
    if (%9 == 0) branch %2
    *(%4 + 12) = %1
    branch %3
    %2:
    *(%4 + 8) = %1
    %3:
    %1:
    %10 = *(%2 + 8)
    %11 = (%10 == %1)
    if (%11 == 0) branch %4
    %12 = *(%1 + 12)
    *(%2 + 8) = %12
    %13 = *(%1 + 12)
    *(%13 + 16) = %2
    *(%1 + 12) = %2
    branch %5
    %4:
    %14 = *(%1 + 8)
    *(%2 + 12) = %14
    %15 = *(%1 + 8)
    *(%15 + 16) = %2
    *(%1 + 8) = %2
    %5:
    *(%2 + 16) = %1
    return
}

FUNC<_RBTree.rotate._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 12)
    parm %2
    parm %1
    call %3
    return
}

FUNC<_RBTree.insert_fix> {
    branch %0
    %1:
    %3 = *(%1 + 16)
    %2 = %3
    %5 = *(%2 + 16)
    %4 = %5
    %7 = *(%4 + 8)
    %8 = (%7 == %2)
    %6 = %8
    %9 = 0
    if (%6 == 0) branch %3
    %10 = *(%4 + 8)
    %9 = %10
    branch %4
    %3:
    %11 = *(%4 + 12)
    %9 = %11
    %4:
    %12 = *(%9 + 20)
    if (%12 == 0) branch %5
    *(%2 + 20) = 0
    *(%9 + 20) = 0
    *(%4 + 20) = 1
    %1 = %4
    branch %6
    %5:
    %13 = *(%2 + 8)
    %14 = (%13 == %1)
    %15 = (%14 != %6)
    if (%15 == 0) branch %7
    %16 = FUNC<_RBTree.rotate._entry>
    parm 8
    %17 = call _Alloc
    *(%17 + 0) = %16
    *(%17 + 4) = %0
    %18 = *(%17 + 0)
    parm %17
    parm %1
    call %18
    %19 = %1
    %1 = %2
    %2 = %19
    %20 = *(%2 + 16)
    %4 = %20
    %7:
    *(%2 + 20) = 0
    *(%4 + 20) = 1
    %21 = FUNC<_RBTree.rotate._entry>
    parm 8
    %22 = call _Alloc
    *(%22 + 0) = %21
    *(%22 + 4) = %0
    %23 = *(%22 + 0)
    parm %22
    parm %2
    call %23
    %6:
    %0:
    %24 = *(%1 + 16)
    %25 = *(%24 + 20)
    if (%25 != 0) branch %1
    %2:
    %26 = *(%0 + 24)
    *(%26 + 20) = 0
    return
}

FUNC<_RBTree.insert_fix._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 16)
    parm %2
    parm %1
    call %3
    return
}

FUNC<_RBTree.insert> {
    %3 = *(%0 + 24)
    %2 = %3
    %5 = *(%0 + 28)
    %4 = %5
    branch %0
    %1:
    %4 = %2
    %6 = *(%2 + 4)
    %7 = (%6 == %1)
    if (%7 == 0) branch %3
    return
    branch %4
    %3:
    %8 = *(%2 + 4)
    %9 = (%8 < %1)
    if (%9 == 0) branch %5
    %10 = *(%2 + 12)
    %2 = %10
    branch %6
    %5:
    %11 = *(%2 + 8)
    %2 = %11
    %6:
    %4:
    %0:
    %12 = *(%0 + 28)
    %13 = (%2 != %12)
    if (%13 != 0) branch %1
    %2:
    %15 = FUNC<_Node.make._entry>
    parm 4
    %16 = call _Alloc
    *(%16 + 0) = %15
    %17 = *(%0 + 28)
    %19 = *(%16 + 0)
    parm %16
    parm %4
    parm %17
    parm %1
    %18 = call %19
    %14 = %18
    %20 = *(%0 + 28)
    %21 = (%4 == %20)
    if (%21 == 0) branch %7
    *(%0 + 24) = %14
    branch %8
    %7:
    %22 = *(%4 + 4)
    %23 = (%22 < %1)
    if (%23 == 0) branch %9
    *(%4 + 12) = %14
    branch %10
    %9:
    *(%4 + 8) = %14
    %10:
    %8:
    %24 = FUNC<_RBTree.insert_fix._entry>
    parm 8
    %25 = call _Alloc
    *(%25 + 0) = %24
    *(%25 + 4) = %0
    %26 = *(%25 + 0)
    parm %25
    parm %14
    call %26
    return
}

FUNC<_RBTree.insert._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 20)
    parm %2
    parm %1
    call %3
    return
}

FUNC<_RBTree.delete_fix> {
    branch %0
    %1:
    %3 = *(%1 + 16)
    %2 = %3
    %5 = *(%2 + 8)
    %6 = (%5 == %1)
    %4 = %6
    %7 = 0
    if (%4 == 0) branch %3
    %8 = *(%2 + 12)
    %7 = %8
    branch %4
    %3:
    %9 = *(%2 + 8)
    %7 = %9
    %4:
    %10 = *(%7 + 20)
    if (%10 == 0) branch %5
    *(%7 + 20) = 0
    *(%2 + 20) = 1
    %11 = FUNC<_RBTree.rotate._entry>
    parm 8
    %12 = call _Alloc
    *(%12 + 0) = %11
    *(%12 + 4) = %0
    %13 = *(%12 + 0)
    parm %12
    parm %7
    call %13
    if (%4 == 0) branch %6
    %14 = *(%2 + 12)
    %7 = %14
    branch %7
    %6:
    %15 = *(%2 + 8)
    %7 = %15
    %7:
    %5:
    %16 = *(%7 + 8)
    %17 = *(%16 + 20)
    %18 = ! %17
    %19 = *(%7 + 12)
    %20 = *(%19 + 20)
    %21 = ! %20
    %22 = (%18 && %21)
    if (%22 == 0) branch %8
    *(%7 + 20) = 0
    %1 = %2
    branch %9
    %8:
    %24 = *(%7 + 12)
    %23 = %24
    %26 = *(%7 + 8)
    %25 = %26
    if (%4 == 0) branch %10
    %27 = %23
    %23 = %25
    %25 = %27
    %10:
    %28 = *(%25 + 20)
    %29 = ! %28
    if (%29 == 0) branch %11
    *(%23 + 20) = 0
    *(%7 + 20) = 1
    %30 = FUNC<_RBTree.rotate._entry>
    parm 8
    %31 = call _Alloc
    *(%31 + 0) = %30
    *(%31 + 4) = %0
    %32 = *(%31 + 0)
    parm %31
    parm %23
    call %32
    if (%4 == 0) branch %12
    %33 = *(%2 + 12)
    %7 = %33
    %34 = *(%7 + 12)
    %25 = %34
    branch %13
    %12:
    %35 = *(%2 + 8)
    %7 = %35
    %36 = *(%7 + 8)
    %25 = %36
    %13:
    %11:
    %37 = *(%2 + 20)
    *(%7 + 20) = %37
    *(%2 + 20) = 0
    *(%25 + 20) = 0
    %38 = FUNC<_RBTree.rotate._entry>
    parm 8
    %39 = call _Alloc
    *(%39 + 0) = %38
    *(%39 + 4) = %0
    %40 = *(%39 + 0)
    parm %39
    parm %7
    call %40
    %41 = *(%0 + 24)
    %1 = %41
    %9:
    %0:
    %42 = *(%0 + 24)
    %43 = (%1 != %42)
    %44 = *(%1 + 20)
    %45 = ! %44
    %46 = (%43 && %45)
    if (%46 != 0) branch %1
    %2:
    *(%1 + 20) = 0
    return
}

FUNC<_RBTree.delete_fix._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 24)
    parm %2
    parm %1
    call %3
    return
}

FUNC<_RBTree.delete> {
    %3 = *(%0 + 24)
    %2 = %3
    branch %0
    %1:
    %4 = *(%2 + 4)
    %5 = (%4 == %1)
    if (%5 == 0) branch %3
    branch %2
    branch %4
    %3:
    %6 = *(%2 + 4)
    %7 = (%6 < %1)
    if (%7 == 0) branch %5
    %8 = *(%2 + 12)
    %2 = %8
    branch %6
    %5:
    %9 = *(%2 + 8)
    %2 = %9
    %6:
    %4:
    %0:
    %10 = *(%0 + 28)
    %11 = (%2 != %10)
    if (%11 != 0) branch %1
    %2:
    %12 = %2
    %13 = 0
    %15 = *(%12 + 20)
    %14 = %15
    %16 = *(%2 + 8)
    %17 = *(%0 + 28)
    %18 = (%16 == %17)
    if (%18 == 0) branch %7
    %19 = *(%2 + 12)
    %13 = %19
    %20 = FUNC<_RBTree.transplant._entry>
    parm 8
    %21 = call _Alloc
    *(%21 + 0) = %20
    *(%21 + 4) = %0
    %22 = *(%21 + 0)
    parm %21
    parm %2
    parm %13
    call %22
    branch %8
    %7:
    %23 = *(%2 + 12)
    %24 = *(%0 + 28)
    %25 = (%23 == %24)
    if (%25 == 0) branch %9
    %26 = *(%2 + 8)
    %13 = %26
    %27 = FUNC<_RBTree.transplant._entry>
    parm 8
    %28 = call _Alloc
    *(%28 + 0) = %27
    *(%28 + 4) = %0
    %29 = *(%28 + 0)
    parm %28
    parm %2
    parm %13
    call %29
    branch %10
    %9:
    %30 = *(%2 + 12)
    %12 = %30
    branch %11
    %12:
    %31 = *(%12 + 8)
    %12 = %31
    %11:
    %32 = *(%12 + 8)
    %33 = *(%0 + 28)
    %34 = (%32 != %33)
    if (%34 != 0) branch %12
    %13:
    %35 = *(%12 + 20)
    %14 = %35
    %36 = *(%12 + 12)
    %13 = %36
    %37 = *(%12 + 16)
    %38 = (%37 == %2)
    if (%38 == 0) branch %14
    *(%13 + 16) = %12
    branch %15
    %14:
    %39 = FUNC<_RBTree.transplant._entry>
    parm 8
    %40 = call _Alloc
    *(%40 + 0) = %39
    *(%40 + 4) = %0
    %41 = *(%40 + 0)
    parm %40
    parm %12
    parm %13
    call %41
    %42 = *(%2 + 12)
    *(%12 + 12) = %42
    %43 = *(%12 + 12)
    *(%43 + 16) = %12
    %15:
    %44 = FUNC<_RBTree.transplant._entry>
    parm 8
    %45 = call _Alloc
    *(%45 + 0) = %44
    *(%45 + 4) = %0
    %46 = *(%45 + 0)
    parm %45
    parm %2
    parm %12
    call %46
    %47 = *(%2 + 8)
    *(%12 + 8) = %47
    %48 = *(%12 + 8)
    *(%48 + 16) = %12
    %49 = *(%2 + 20)
    *(%12 + 20) = %49
    %10:
    %8:
    %50 = ! %14
    if (%50 == 0) branch %16
    %51 = FUNC<_RBTree.delete_fix._entry>
    parm 8
    %52 = call _Alloc
    *(%52 + 0) = %51
    *(%52 + 4) = %0
    %53 = *(%52 + 0)
    parm %52
    parm %13
    call %53
    %16:
    return
}

FUNC<_RBTree.delete._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 28)
    parm %2
    parm %1
    call %3
    return
}

FUNC<_RBTree.print> {
    %1 = FUNC<_RBTree.print_impl._entry>
    parm 8
    %2 = call _Alloc
    *(%2 + 0) = %1
    *(%2 + 4) = %0
    %3 = *(%0 + 24)
    %4 = *(%2 + 0)
    parm %2
    parm %3
    call %4
    return
}

FUNC<_RBTree.print._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 32)
    parm %1
    call %2
    return
}

FUNC<_RBTree.print_impl> {
    %2 = *(%0 + 28)
    %3 = (%1 == %2)
    if (%3 == 0) branch %0
    return
    branch %1
    %0:
    %4 = FUNC<_RBTree.print_impl._entry>
    parm 8
    %5 = call _Alloc
    *(%5 + 0) = %4
    *(%5 + 4) = %0
    %6 = *(%1 + 8)
    %7 = *(%5 + 0)
    parm %5
    parm %6
    call %7
    %8 = *(%1 + 4)
    parm %8
    call _PrintInt
    %9 = " "
    parm %9
    call _PrintString
    %10 = FUNC<_RBTree.print_impl._entry>
    parm 8
    %11 = call _Alloc
    *(%11 + 0) = %10
    *(%11 + 4) = %0
    %12 = *(%1 + 12)
    %13 = *(%11 + 0)
    parm %11
    parm %12
    call %13
    %1:
    return
}

FUNC<_RBTree.print_impl._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 36)
    parm %2
    parm %1
    call %3
    return
}

