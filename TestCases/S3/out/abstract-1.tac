VTBL<_A> {
    0
    "A"
    FUNC<_A.a>
    FUNC<_A.b>
    FUNC<_A.c>
    FUNC<_A.d>
}

VTBL<_B> {
    VTBL<_A>
    "B"
    FUNC<_B.a>
    FUNC<_B.b>
    FUNC<_A.c>
    FUNC<_A.d>
    FUNC<_B.e>
    FUNC<_B.f>
}

VTBL<_C> {
    VTBL<_B>
    "C"
    FUNC<_C.a>
    FUNC<_B.b>
    FUNC<_C.c>
    FUNC<_C.d>
    FUNC<_C.e>
    FUNC<_C.f>
}

VTBL<_D> {
    VTBL<_C>
    "D"
    FUNC<_C.a>
    FUNC<_B.b>
    FUNC<_D.c>
    FUNC<_D.d>
    FUNC<_D.e>
    FUNC<_D.f>
    FUNC<_D.g>
    FUNC<_D.h>
}

VTBL<_E> {
    VTBL<_C>
    "E"
    FUNC<_E.a>
    FUNC<_B.b>
    FUNC<_C.c>
    FUNC<_E.d>
    FUNC<_C.e>
    FUNC<_C.f>
    FUNC<_E.g>
}

VTBL<_F> {
    VTBL<_D>
    "F"
    FUNC<_C.a>
    FUNC<_B.b>
    FUNC<_D.c>
    FUNC<_D.d>
    FUNC<_D.e>
    FUNC<_D.f>
    FUNC<_D.g>
    FUNC<_F.h>
}

VTBL<_Main> {
    VTBL<_D>
    "Main"
    FUNC<_Main.a>
    FUNC<_B.b>
    FUNC<_D.c>
    FUNC<_Main.d>
    FUNC<_D.e>
    FUNC<_D.f>
    FUNC<_Main.g>
    FUNC<_Main.h>
}

FUNC<_A._new> {
    parm 8
    %0 = call _Alloc
    %1 = VTBL<_A>
    *(%0 + 0) = %1
    *(%0 + 4) = 0
    return %0
}

FUNC<_B._new> {
    parm 12
    %0 = call _Alloc
    %1 = VTBL<_B>
    *(%0 + 0) = %1
    *(%0 + 4) = 0
    *(%0 + 8) = 0
    return %0
}

FUNC<_C._new> {
    parm 12
    %0 = call _Alloc
    %1 = VTBL<_C>
    *(%0 + 0) = %1
    *(%0 + 4) = 0
    *(%0 + 8) = 0
    return %0
}

FUNC<_D._new> {
    parm 12
    %0 = call _Alloc
    %1 = VTBL<_D>
    *(%0 + 0) = %1
    *(%0 + 4) = 0
    *(%0 + 8) = 0
    return %0
}

FUNC<_E._new> {
    parm 12
    %0 = call _Alloc
    %1 = VTBL<_E>
    *(%0 + 0) = %1
    *(%0 + 4) = 0
    *(%0 + 8) = 0
    return %0
}

FUNC<_F._new> {
    parm 12
    %0 = call _Alloc
    %1 = VTBL<_F>
    *(%0 + 0) = %1
    *(%0 + 4) = 0
    *(%0 + 8) = 0
    return %0
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

FUNC<_A.a> {
    return
}

FUNC<_A.a._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 8)
    parm %1
    call %2
    return
}

FUNC<_A.b> {
    return
}

FUNC<_A.b._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 12)
    parm %1
    call %2
    return
}

FUNC<_A.c> {
    return
}

FUNC<_A.c._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 16)
    parm %1
    call %2
    return
}

FUNC<_A.d> {
    return
}

FUNC<_A.d._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 20)
    parm %1
    call %2
    return
}

FUNC<_B.a> {
    return
}

FUNC<_B.a._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 8)
    parm %1
    call %2
    return
}

FUNC<_B.b> {
    %1 = "B.b()\n"
    parm %1
    call _PrintString
    return
}

FUNC<_B.b._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 12)
    parm %1
    call %2
    return
}

FUNC<_B.e> {
    return
}

FUNC<_B.e._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 24)
    parm %1
    call %2
    return
}

FUNC<_B.f> {
    %1 = "B.f()\n"
    parm %1
    call _PrintString
    return
}

FUNC<_B.f._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 28)
    parm %1
    call %2
    return
}

FUNC<_C.a> {
    %1 = "C.a()\n"
    parm %1
    call _PrintString
    return
}

FUNC<_C.a._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 8)
    parm %1
    call %2
    return
}

FUNC<_C.c> {
    %1 = "C.c()\n"
    parm %1
    call _PrintString
    return
}

FUNC<_C.c._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 16)
    parm %1
    call %2
    return
}

FUNC<_C.d> {
    %1 = "C.d()\n"
    parm %1
    call _PrintString
    return
}

FUNC<_C.d._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 20)
    parm %1
    call %2
    return
}

FUNC<_C.e> {
    %1 = "C.e()\n"
    parm %1
    call _PrintString
    return
}

FUNC<_C.e._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 24)
    parm %1
    call %2
    return
}

FUNC<_C.f> {
    %1 = "C.f()\n"
    parm %1
    call _PrintString
    return
}

FUNC<_C.f._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 28)
    parm %1
    call %2
    return
}

FUNC<_D.c> {
    %1 = "D.c()\n"
    parm %1
    call _PrintString
    return
}

FUNC<_D.c._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 16)
    parm %1
    call %2
    return
}

FUNC<_D.d> {
    %1 = "D.d()\n"
    parm %1
    call _PrintString
    return
}

FUNC<_D.d._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 20)
    parm %1
    call %2
    return
}

FUNC<_D.e> {
    %1 = "D.e()\n"
    parm %1
    call _PrintString
    return
}

FUNC<_D.e._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 24)
    parm %1
    call %2
    return
}

FUNC<_D.f> {
    %1 = "D.f()\n"
    parm %1
    call _PrintString
    return
}

FUNC<_D.f._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 28)
    parm %1
    call %2
    return
}

FUNC<_D.g> {
    return
}

FUNC<_D.g._entry> {
    %3 = *(%0 + 4)
    %4 = *(%3 + 0)
    %4 = *(%4 + 32)
    parm %3
    parm %1
    parm %2
    call %4
    return
}

FUNC<_D.h> {
}

FUNC<_D.h._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 36)
    parm %2
    %1 = call %3
    return %1
}

FUNC<_E.a> {
    %1 = "E.a()\n"
    parm %1
    call _PrintString
    return
}

FUNC<_E.a._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 8)
    parm %1
    call %2
    return
}

FUNC<_E.d> {
    %1 = "E.d()\n"
    parm %1
    call _PrintString
    return
}

FUNC<_E.d._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 20)
    parm %1
    call %2
    return
}

FUNC<_E.g> {
    %3 = "E.g()\n"
    parm %3
    call _PrintString
    return
}

FUNC<_E.g._entry> {
    %3 = *(%0 + 4)
    %4 = *(%3 + 0)
    %4 = *(%4 + 32)
    parm %3
    parm %1
    parm %2
    call %4
    return
}

FUNC<_F.h> {
}

FUNC<_F.h._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 36)
    parm %2
    %1 = call %3
    return %1
}

FUNC<_Main.a> {
    %1 = "Main.a()\n"
    parm %1
    call _PrintString
    return
}

FUNC<_Main.a._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 8)
    parm %1
    call %2
    return
}

FUNC<_Main.d> {
    %1 = "Main.d()\n"
    parm %1
    call _PrintString
    return
}

FUNC<_Main.d._entry> {
    %1 = *(%0 + 4)
    %2 = *(%1 + 0)
    %2 = *(%2 + 20)
    parm %1
    call %2
    return
}

FUNC<_Main.g> {
    %3 = "Main.g()\n"
    parm %3
    call _PrintString
    return
}

FUNC<_Main.g._entry> {
    %3 = *(%0 + 4)
    %4 = *(%3 + 0)
    %4 = *(%4 + 32)
    parm %3
    parm %1
    parm %2
    call %4
    return
}

FUNC<_Main.h> {
    %1 = "Main.h()\n"
    parm %1
    call _PrintString
    %2 = call _Main._new
    return %2
}

FUNC<_Main.h._entry> {
    %2 = *(%0 + 4)
    %3 = *(%2 + 0)
    %3 = *(%3 + 36)
    parm %2
    %1 = call %3
    return %1
}

FUNC<main> {
    %1 = call _C._new
    %0 = %1
    %2 = FUNC<_C.a._entry>
    parm 8
    %3 = call _Alloc
    *(%3 + 0) = %2
    *(%3 + 4) = %0
    %4 = *(%3 + 0)
    parm %3
    call %4
    %5 = FUNC<_B.b._entry>
    parm 8
    %6 = call _Alloc
    *(%6 + 0) = %5
    *(%6 + 4) = %0
    %7 = *(%6 + 0)
    parm %6
    call %7
    %8 = FUNC<_C.c._entry>
    parm 8
    %9 = call _Alloc
    *(%9 + 0) = %8
    *(%9 + 4) = %0
    %10 = *(%9 + 0)
    parm %9
    call %10
    %11 = FUNC<_C.d._entry>
    parm 8
    %12 = call _Alloc
    *(%12 + 0) = %11
    *(%12 + 4) = %0
    %13 = *(%12 + 0)
    parm %12
    call %13
    %14 = FUNC<_C.e._entry>
    parm 8
    %15 = call _Alloc
    *(%15 + 0) = %14
    *(%15 + 4) = %0
    %16 = *(%15 + 0)
    parm %15
    call %16
    %17 = FUNC<_C.f._entry>
    parm 8
    %18 = call _Alloc
    *(%18 + 0) = %17
    *(%18 + 4) = %0
    %19 = *(%18 + 0)
    parm %18
    call %19
    %21 = call _E._new
    %20 = %21
    %22 = FUNC<_E.a._entry>
    parm 8
    %23 = call _Alloc
    *(%23 + 0) = %22
    *(%23 + 4) = %20
    %24 = *(%23 + 0)
    parm %23
    call %24
    %25 = FUNC<_B.b._entry>
    parm 8
    %26 = call _Alloc
    *(%26 + 0) = %25
    *(%26 + 4) = %20
    %27 = *(%26 + 0)
    parm %26
    call %27
    %28 = FUNC<_C.c._entry>
    parm 8
    %29 = call _Alloc
    *(%29 + 0) = %28
    *(%29 + 4) = %20
    %30 = *(%29 + 0)
    parm %29
    call %30
    %31 = FUNC<_E.d._entry>
    parm 8
    %32 = call _Alloc
    *(%32 + 0) = %31
    *(%32 + 4) = %20
    %33 = *(%32 + 0)
    parm %32
    call %33
    %34 = FUNC<_C.e._entry>
    parm 8
    %35 = call _Alloc
    *(%35 + 0) = %34
    *(%35 + 4) = %20
    %36 = *(%35 + 0)
    parm %35
    call %36
    %37 = FUNC<_C.f._entry>
    parm 8
    %38 = call _Alloc
    *(%38 + 0) = %37
    *(%38 + 4) = %20
    %39 = *(%38 + 0)
    parm %38
    call %39
    %40 = FUNC<_E.g._entry>
    parm 8
    %41 = call _Alloc
    *(%41 + 0) = %40
    *(%41 + 4) = %20
    %42 = *(%41 + 0)
    parm %41
    parm 1
    parm 1
    call %42
    %44 = call _Main._new
    %43 = %44
    %45 = FUNC<_Main.a._entry>
    parm 8
    %46 = call _Alloc
    *(%46 + 0) = %45
    *(%46 + 4) = %43
    %47 = *(%46 + 0)
    parm %46
    call %47
    %48 = FUNC<_B.b._entry>
    parm 8
    %49 = call _Alloc
    *(%49 + 0) = %48
    *(%49 + 4) = %43
    %50 = *(%49 + 0)
    parm %49
    call %50
    %51 = FUNC<_D.c._entry>
    parm 8
    %52 = call _Alloc
    *(%52 + 0) = %51
    *(%52 + 4) = %43
    %53 = *(%52 + 0)
    parm %52
    call %53
    %54 = FUNC<_Main.d._entry>
    parm 8
    %55 = call _Alloc
    *(%55 + 0) = %54
    *(%55 + 4) = %43
    %56 = *(%55 + 0)
    parm %55
    call %56
    %57 = FUNC<_D.e._entry>
    parm 8
    %58 = call _Alloc
    *(%58 + 0) = %57
    *(%58 + 4) = %43
    %59 = *(%58 + 0)
    parm %58
    call %59
    %60 = FUNC<_D.f._entry>
    parm 8
    %61 = call _Alloc
    *(%61 + 0) = %60
    *(%61 + 4) = %43
    %62 = *(%61 + 0)
    parm %61
    call %62
    %63 = FUNC<_Main.g._entry>
    parm 8
    %64 = call _Alloc
    *(%64 + 0) = %63
    *(%64 + 4) = %43
    %65 = *(%64 + 0)
    parm %64
    parm 1
    parm 1
    call %65
    %66 = FUNC<_Main.h._entry>
    parm 8
    %67 = call _Alloc
    *(%67 + 0) = %66
    *(%67 + 4) = %43
    %69 = *(%67 + 0)
    parm %67
    %68 = call %69
    return
}

FUNC<main._entry> {
    call main
    return
}

