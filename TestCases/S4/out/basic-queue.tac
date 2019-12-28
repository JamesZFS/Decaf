VTBL<_QueueItem> {
    0
    "QueueItem"
    FUNC<_QueueItem.Init>
    FUNC<_QueueItem.GetData>
    FUNC<_QueueItem.GetNext>
    FUNC<_QueueItem.GetPrev>
    FUNC<_QueueItem.SetNext>
    FUNC<_QueueItem.SetPrev>
}

VTBL<_Queue> {
    0
    "Queue"
    FUNC<_Queue.Init>
    FUNC<_Queue.EnQueue>
    FUNC<_Queue.DeQueue>
}

VTBL<_Main> {
    0
    "Main"
}

FUNC<_QueueItem._new> {
    parm 16
    %0 = call _Alloc
    %1 = VTBL<_QueueItem>
    *(%0 + 0) = %1
    *(%0 + 4) = 0
    *(%0 + 8) = 0
    *(%0 + 12) = 0
    return %0
}

FUNC<_Queue._new> {
    parm 12
    %0 = call _Alloc
    %1 = VTBL<_Queue>
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

FUNC<_QueueItem.Init> {
    *(%0 + 4) = %1
    *(%0 + 8) = %2
    *(%2 + 12) = %0
    *(%0 + 12) = %3
    *(%3 + 8) = %0
    return
}

FUNC<_QueueItem.Init._entry> {
    %4 = *(%0 + 4)
    %5 = *(%4 + 0)
    %5 = *(%5 + 8)
    parm %4
    parm %1
    parm %2
    parm %3
    call %5
    return
}

FUNC<_QueueItem.GetData> {
    %1 = *(%0 + 4)
    return %1
}

FUNC<_QueueItem.GetData._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 12)
    parm %2
    %1 = call %3
    return %1
}

FUNC<_QueueItem.GetNext> {
    %1 = *(%0 + 8)
    return %1
}

FUNC<_QueueItem.GetNext._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 16)
    parm %2
    %1 = call %3
    return %1
}

FUNC<_QueueItem.GetPrev> {
    %1 = *(%0 + 12)
    return %1
}

FUNC<_QueueItem.GetPrev._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 20)
    parm %2
    %1 = call %3
    return %1
}

FUNC<_QueueItem.SetNext> {
    *(%0 + 8) = %1
    return
}

FUNC<_QueueItem.SetNext._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 24)
    parm %2
    parm %1
    call %3
    return
}

FUNC<_QueueItem.SetPrev> {
    *(%0 + 12) = %1
    return
}

FUNC<_QueueItem.SetPrev._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 28)
    parm %2
    parm %1
    call %3
    return
}

FUNC<_Queue.Init> {
    %1 = call _QueueItem._new
    *(%0 + 8) = %1
    %2 = FUNC<_QueueItem.Init._entry>
    %8 = *(%0 + 8)
    parm 8
    %4 = call _Alloc
    *(%4 + 0) = %2
    *(%4 + 4) = %8
    %7 = *(%4 + 0)
    parm %4
    parm 0
    parm %8
    parm %8
    call %7
    return
}

FUNC<_Queue.Init._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 8)
    parm %1
    call %2
    return
}

FUNC<_Queue.EnQueue> {
    %3 = call _QueueItem._new
    %4 = FUNC<_QueueItem.Init._entry>
    parm 8
    %5 = call _Alloc
    *(%5 + 0) = %4
    *(%5 + 4) = %3
    %6 = FUNC<_QueueItem.GetNext._entry>
    %7 = *(%0 + 8)
    parm 8
    %8 = call _Alloc
    *(%8 + 0) = %6
    *(%8 + 4) = %7
    %10 = *(%8 + 0)
    parm %8
    %9 = call %10
    %11 = *(%0 + 8)
    %12 = *(%5 + 0)
    parm %5
    parm %1
    parm %9
    parm %11
    call %12
    return
}

FUNC<_Queue.EnQueue._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 12)
    parm %2
    parm %1
    call %3
    return
}

FUNC<_Queue.DeQueue> {
    %2 = FUNC<_QueueItem.GetPrev._entry>
    %3 = *(%0 + 8)
    parm 8
    %4 = call _Alloc
    *(%4 + 0) = %2
    *(%4 + 4) = %3
    %6 = *(%4 + 0)
    parm %4
    %5 = call %6
    %42 = *(%0 + 8)
    %8 = (%5 == %42)
    if (%8 == 0) branch %2
    %9 = "Queue Is Empty"
    parm %9
    call _PrintString
    return 0
    %2:
    %11 = FUNC<_QueueItem.GetPrev._entry>
    parm 8
    %13 = call _Alloc
    *(%13 + 0) = %11
    *(%13 + 4) = %42
    %15 = *(%13 + 0)
    parm %13
    %14 = call %15
    %16 = FUNC<_QueueItem.GetData._entry>
    parm 8
    %17 = call _Alloc
    *(%17 + 0) = %16
    *(%17 + 4) = %14
    %19 = *(%17 + 0)
    parm %17
    %18 = call %19
    %20 = FUNC<_QueueItem.SetNext._entry>
    %21 = FUNC<_QueueItem.GetPrev._entry>
    parm 8
    %22 = call _Alloc
    *(%22 + 0) = %21
    *(%22 + 4) = %14
    %24 = *(%22 + 0)
    parm %22
    %23 = call %24
    parm 8
    %25 = call _Alloc
    *(%25 + 0) = %20
    *(%25 + 4) = %23
    %26 = FUNC<_QueueItem.GetNext._entry>
    parm 8
    %27 = call _Alloc
    *(%27 + 0) = %26
    *(%27 + 4) = %14
    %29 = *(%27 + 0)
    parm %27
    %28 = call %29
    %30 = *(%25 + 0)
    parm %25
    parm %28
    call %30
    %31 = FUNC<_QueueItem.SetPrev._entry>
    %32 = FUNC<_QueueItem.GetNext._entry>
    parm 8
    %33 = call _Alloc
    *(%33 + 0) = %32
    *(%33 + 4) = %14
    %35 = *(%33 + 0)
    parm %33
    %34 = call %35
    parm 8
    %36 = call _Alloc
    *(%36 + 0) = %31
    *(%36 + 4) = %34
    %37 = FUNC<_QueueItem.GetPrev._entry>
    parm 8
    %38 = call _Alloc
    *(%38 + 0) = %37
    *(%38 + 4) = %14
    %40 = *(%38 + 0)
    parm %38
    %39 = call %40
    %41 = *(%36 + 0)
    parm %36
    parm %39
    call %41
    return %18
}

FUNC<_Queue.DeQueue._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 16)
    parm %2
    %1 = call %3
    return %1
}

FUNC<main> {
    %2 = call _Queue._new
    %3 = FUNC<_Queue.Init._entry>
    parm 8
    %4 = call _Alloc
    *(%4 + 0) = %3
    *(%4 + 4) = %2
    %5 = *(%4 + 0)
    parm %4
    call %5
    %1 = 0
    branch %2
    %1:
    %6 = FUNC<_Queue.EnQueue._entry>
    parm 8
    %7 = call _Alloc
    *(%7 + 0) = %6
    *(%7 + 4) = %2
    %8 = *(%7 + 0)
    parm %7
    parm %1
    call %8
    %9 = (%1 + 1)
    %1 = %9
    %2:
    %10 = (%1 < 10)
    if (%10 != 0) branch %1
    %1 = 0
    branch %5
    %4:
    %11 = FUNC<_Queue.DeQueue._entry>
    parm 8
    %12 = call _Alloc
    *(%12 + 0) = %11
    *(%12 + 4) = %2
    %14 = *(%12 + 0)
    parm %12
    %13 = call %14
    parm %13
    call _PrintInt
    %15 = " "
    parm %15
    call _PrintString
    %16 = (%1 + 1)
    %1 = %16
    %5:
    %17 = (%1 < 4)
    if (%17 != 0) branch %4
    %18 = "\n"
    parm %18
    call _PrintString
    %1 = 0
    branch %8
    %7:
    %19 = FUNC<_Queue.EnQueue._entry>
    parm 8
    %20 = call _Alloc
    *(%20 + 0) = %19
    *(%20 + 4) = %2
    %21 = *(%20 + 0)
    parm %20
    parm %1
    call %21
    %22 = (%1 + 1)
    %1 = %22
    %8:
    %23 = (%1 < 10)
    if (%23 != 0) branch %7
    %1 = 0
    branch %11
    %10:
    %24 = FUNC<_Queue.DeQueue._entry>
    parm 8
    %25 = call _Alloc
    *(%25 + 0) = %24
    *(%25 + 4) = %2
    %27 = *(%25 + 0)
    parm %25
    %26 = call %27
    parm %26
    call _PrintInt
    %28 = " "
    parm %28
    call _PrintString
    %29 = (%1 + 1)
    %1 = %29
    %11:
    %30 = (%1 < 17)
    if (%30 != 0) branch %10
    %31 = "\n"
    parm %31
    call _PrintString
    return
}

FUNC<main._entry> {
    call main
    return
}

