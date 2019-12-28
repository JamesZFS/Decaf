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
    %6 = FUNC<_RBTree.make1._entry>
    parm 4
    %7 = call _Alloc
    *(%7 + 0) = %6
    %9 = *(%7 + 0)
    parm %7
    %8 = call %9
    %10 = 0
    branch %10
    %1:
    %11 = 0
    branch %4
    %2:
    %12 = FUNC<_RBTree.insert._entry>
    parm 8
    %13 = call _Alloc
    *(%13 + 0) = %12
    *(%13 + 4) = %8
    %14 = FUNC<_Rng.next._entry>
    parm 8
    %15 = call _Alloc
    *(%15 + 0) = %14
    *(%15 + 4) = %3
    %17 = *(%15 + 0)
    parm %15
    %16 = call %17
    %20 = (%16 % 500)
    %21 = *(%13 + 0)
    parm %13
    parm %20
    call %21
    %22 = (%11 + 1)
    %11 = %22
    %4:
    %23 = (%11 < 500)
    if (%23 != 0) branch %2
    %24 = 0
    branch %8
    %6:
    %25 = FUNC<_RBTree.delete._entry>
    parm 8
    %26 = call _Alloc
    *(%26 + 0) = %25
    *(%26 + 4) = %8
    %27 = FUNC<_Rng.next._entry>
    parm 8
    %28 = call _Alloc
    *(%28 + 0) = %27
    *(%28 + 4) = %3
    %30 = *(%28 + 0)
    parm %28
    %29 = call %30
    %33 = (%29 % 500)
    %34 = *(%26 + 0)
    parm %26
    parm %33
    call %34
    %35 = (%24 + 1)
    %24 = %35
    %8:
    %36 = (%24 < 500)
    if (%36 != 0) branch %6
    %37 = (%10 + 1)
    %10 = %37
    %10:
    %38 = (%10 < 5)
    if (%38 != 0) branch %1
    %39 = FUNC<_RBTree.print._entry>
    parm 8
    %40 = call _Alloc
    *(%40 + 0) = %39
    *(%40 + 4) = %8
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

FUNC<_Node.make> {
    %4 = call _Node._new
    *(%4 + 4) = %2
    *(%4 + 16) = %0
    *(%4 + 8) = %1
    *(%4 + 12) = %1
    *(%4 + 20) = 1
    return %4
}

FUNC<_Node.make._entry> {
    parm %1
    parm %2
    parm %3
    %4 = call _Node.make
    return %4
}

FUNC<_RBTree.make1> {
    %1 = call _RBTree._new
    %3 = call _Node._new
    *(%3 + 16) = %3
    *(%3 + 8) = %3
    *(%3 + 12) = %3
    *(%1 + 24) = %3
    *(%1 + 28) = %3
    return %1
}

FUNC<_RBTree.make1._entry> {
    %1 = call _RBTree.make1
    return %1
}

FUNC<_RBTree.transplant> {
    %4 = *(%1 + 16)
    %5 = *(%0 + 28)
    %6 = (%4 == %5)
    if (%6 == 0) branch %2
    *(%0 + 24) = %2
    branch %5
    %2:
    %7 = *(%4 + 12)
    %8 = (%7 == %1)
    if (%8 == 0) branch %4
    *(%4 + 12) = %2
    branch %5
    %4:
    *(%4 + 8) = %2
    %5:
    *(%2 + 16) = %4
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
    %5 = *(%3 + 16)
    *(%1 + 16) = %5
    %6 = *(%0 + 28)
    %7 = (%5 == %6)
    if (%7 == 0) branch %2
    *(%0 + 24) = %1
    branch %5
    %2:
    %8 = *(%5 + 12)
    %9 = (%8 == %3)
    if (%9 == 0) branch %4
    *(%5 + 12) = %1
    branch %5
    %4:
    *(%5 + 8) = %1
    %5:
    %10 = *(%3 + 8)
    %11 = (%10 == %1)
    if (%11 == 0) branch %7
    %12 = *(%1 + 12)
    *(%3 + 8) = %12
    %13 = *(%1 + 12)
    *(%13 + 16) = %3
    *(%1 + 12) = %3
    branch %8
    %7:
    %14 = *(%1 + 8)
    *(%3 + 12) = %14
    %15 = *(%1 + 8)
    *(%15 + 16) = %3
    *(%1 + 8) = %3
    %8:
    *(%3 + 16) = %1
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
    branch %9
    %1:
    %2 = %27
    %5 = *(%27 + 16)
    %4 = %5
    %28 = *(%5 + 8)
    %8 = (%28 == %27)
    if (%8 == 0) branch %3
    %9 = %28
    branch %4
    %3:
    %11 = *(%5 + 12)
    %9 = %11
    %4:
    %12 = *(%9 + 20)
    if (%12 == 0) branch %6
    *(%27 + 20) = 0
    *(%9 + 20) = 0
    *(%5 + 20) = 1
    %1 = %5
    branch %9
    %6:
    %13 = *(%27 + 8)
    %14 = (%13 == %1)
    %15 = (%14 != %8)
    if (%15 == 0) branch %8
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
    %1 = %27
    %2 = %19
    %20 = *(%19 + 16)
    %4 = %20
    %8:
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
    %9:
    %27 = *(%1 + 16)
    %25 = *(%27 + 20)
    if (%25 != 0) branch %1
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
    %28 = *(%0 + 28)
    %4 = %28
    branch %6
    %1:
    %4 = %2
    %27 = *(%2 + 4)
    %7 = (%27 == %1)
    if (%7 == 0) branch %3
    return
    %3:
    %9 = (%27 < %1)
    if (%9 == 0) branch %5
    %10 = *(%2 + 12)
    %2 = %10
    branch %6
    %5:
    %11 = *(%2 + 8)
    %2 = %11
    %6:
    %13 = (%2 != %28)
    if (%13 != 0) branch %1
    %15 = FUNC<_Node.make._entry>
    parm 4
    %16 = call _Alloc
    *(%16 + 0) = %15
    %19 = *(%16 + 0)
    parm %16
    parm %4
    parm %28
    parm %1
    %18 = call %19
    %21 = (%4 == %28)
    if (%21 == 0) branch %9
    *(%0 + 24) = %18
    branch %12
    %9:
    %22 = *(%4 + 4)
    %23 = (%22 < %1)
    if (%23 == 0) branch %11
    *(%4 + 12) = %18
    branch %12
    %11:
    *(%4 + 8) = %18
    %12:
    %24 = FUNC<_RBTree.insert_fix._entry>
    parm 8
    %25 = call _Alloc
    *(%25 + 0) = %24
    *(%25 + 4) = %0
    %26 = *(%25 + 0)
    parm %25
    parm %18
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
    branch %17
    %1:
    %3 = *(%1 + 16)
    %47 = *(%3 + 8)
    %6 = (%47 == %1)
    if (%6 == 0) branch %3
    %8 = *(%3 + 12)
    %7 = %8
    branch %4
    %3:
    %7 = %47
    %4:
    %10 = *(%7 + 20)
    if (%10 == 0) branch %8
    *(%7 + 20) = 0
    *(%3 + 20) = 1
    %11 = FUNC<_RBTree.rotate._entry>
    parm 8
    %12 = call _Alloc
    *(%12 + 0) = %11
    *(%12 + 4) = %0
    %13 = *(%12 + 0)
    parm %12
    parm %7
    call %13
    if (%6 == 0) branch %7
    %14 = *(%3 + 12)
    %7 = %14
    branch %8
    %7:
    %15 = *(%3 + 8)
    %7 = %15
    %8:
    %49 = *(%7 + 8)
    %17 = *(%49 + 20)
    %18 = ! %17
    %48 = *(%7 + 12)
    %20 = *(%48 + 20)
    %21 = ! %20
    %22 = (%18 && %21)
    if (%22 == 0) branch %10
    *(%7 + 20) = 0
    %1 = %3
    branch %17
    %10:
    %23 = %48
    %25 = %49
    if (%6 == 0) branch %12
    %23 = %49
    %25 = %48
    %12:
    %28 = *(%25 + 20)
    %29 = ! %28
    if (%29 == 0) branch %16
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
    if (%6 == 0) branch %15
    %33 = *(%3 + 12)
    %7 = %33
    %34 = *(%33 + 12)
    %25 = %34
    branch %16
    %15:
    %35 = *(%3 + 8)
    %7 = %35
    %36 = *(%35 + 8)
    %25 = %36
    %16:
    %37 = *(%3 + 20)
    *(%7 + 20) = %37
    *(%3 + 20) = 0
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
    %17:
    %42 = *(%0 + 24)
    %43 = (%1 != %42)
    %44 = *(%1 + 20)
    %45 = ! %44
    %46 = (%43 && %45)
    if (%46 != 0) branch %1
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
    branch %6
    %1:
    %54 = *(%2 + 4)
    %5 = (%54 == %1)
    if (%5 == 0) branch %3
    branch %7
    %3:
    %7 = (%54 < %1)
    if (%7 == 0) branch %5
    %8 = *(%2 + 12)
    %2 = %8
    branch %6
    %5:
    %9 = *(%2 + 8)
    %2 = %9
    %6:
    %55 = *(%0 + 28)
    %11 = (%2 != %55)
    if (%11 != 0) branch %1
    %7:
    %15 = *(%2 + 20)
    %14 = %15
    %57 = *(%2 + 8)
    %18 = (%57 == %55)
    if (%18 == 0) branch %9
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
    parm %19
    call %22
    branch %18
    %9:
    %58 = *(%2 + 12)
    %25 = (%58 == %55)
    if (%25 == 0) branch %11
    %13 = %57
    %27 = FUNC<_RBTree.transplant._entry>
    parm 8
    %28 = call _Alloc
    *(%28 + 0) = %27
    *(%28 + 4) = %0
    %29 = *(%28 + 0)
    parm %28
    parm %2
    parm %57
    call %29
    branch %18
    %11:
    %12 = %58
    branch %13
    %12:
    %12 = %59
    %13:
    %59 = *(%12 + 8)
    %34 = (%59 != %55)
    if (%34 != 0) branch %12
    %35 = *(%12 + 20)
    %14 = %35
    %36 = *(%12 + 12)
    %13 = %36
    %37 = *(%12 + 16)
    %38 = (%37 == %2)
    if (%38 == 0) branch %16
    *(%36 + 16) = %12
    branch %17
    %16:
    %39 = FUNC<_RBTree.transplant._entry>
    parm 8
    %40 = call _Alloc
    *(%40 + 0) = %39
    *(%40 + 4) = %0
    %41 = *(%40 + 0)
    parm %40
    parm %12
    parm %36
    call %41
    %42 = *(%2 + 12)
    *(%12 + 12) = %42
    %43 = *(%12 + 12)
    *(%43 + 16) = %12
    %17:
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
    %18:
    %50 = ! %14
    if (%50 == 0) branch %20
    %51 = FUNC<_RBTree.delete_fix._entry>
    parm 8
    %52 = call _Alloc
    *(%52 + 0) = %51
    *(%52 + 4) = %0
    %53 = *(%52 + 0)
    parm %52
    parm %13
    call %53
    %20:
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
    if (%3 == 0) branch %2
    return
    %2:
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

