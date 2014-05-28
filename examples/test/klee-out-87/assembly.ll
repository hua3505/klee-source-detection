; ModuleID = 'test.o'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-f128:128:128-n8:16:32"
target triple = "i386-pc-linux-gnu"

@a = common unnamed_addr global i32 0
@str = common unnamed_addr global [10 x i8] zeroinitializer
@pi = common unnamed_addr global i32* null
@ai = common unnamed_addr global i32 0
@b = common unnamed_addr global float 0.000000e+00

define void @f1() nounwind {
entry:
  %0 = load i32* @a, align 4, !dbg !76
  %1 = add nsw i32 %0, 1, !dbg !76
  store i32 %1, i32* @a, align 4, !dbg !76
  ret void, !dbg !78
}

define i32 @main() nounwind {
entry:
  %retval = alloca i32
  %0 = alloca i32
  %c = alloca i8
  %"alloca point" = bitcast i32 0 to i32
  store i8 104, i8* getelementptr inbounds ([10 x i8]* @str, i32 0, i32 1), align 1, !dbg !79
  %1 = load i8* getelementptr inbounds ([10 x i8]* @str, i32 0, i32 1), align 1, !dbg !81
  store i8 %1, i8* %c, align 1, !dbg !81
  store i32* @a, i32** @pi, align 4, !dbg !82
  %2 = load i32* @a, align 4, !dbg !83
  store i32 %2, i32* @ai, align 4, !dbg !83
  %3 = load i32* @a, align 4, !dbg !84
  %4 = add nsw i32 %3, 1, !dbg !84
  store i32 %4, i32* @a, align 4, !dbg !84
  %5 = call noalias i8* @malloc(i32 4) nounwind, !dbg !85
  %6 = bitcast i8* %5 to i32*, !dbg !85
  store i32* %6, i32** @pi, align 4, !dbg !85
  %7 = load i32** @pi, align 4, !dbg !86
  store i32 100, i32* %7, align 4, !dbg !86
  %8 = load i32** @pi, align 4, !dbg !87
  store i32 234, i32* %8, align 4, !dbg !87
  %9 = load i32* @a, align 4, !dbg !88
  %10 = icmp ne i32 %9, 0, !dbg !88
  br i1 %10, label %bb, label %bb1, !dbg !88

bb:                                               ; preds = %entry
  store i32 1, i32* @ai, align 4, !dbg !89
  br label %bb2, !dbg !89

bb1:                                              ; preds = %entry
  store i32 2, i32* @ai, align 4, !dbg !90
  br label %bb2, !dbg !90

bb2:                                              ; preds = %bb1, %bb
  call void @f1() nounwind, !dbg !91
  store i32 0, i32* %0, align 4, !dbg !92
  %11 = load i32* %0, align 4, !dbg !92
  store i32 %11, i32* %retval, align 4, !dbg !92
  %retval3 = load i32* %retval, !dbg !92
  ret i32 %retval3, !dbg !92
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare noalias i8* @malloc(i32) nounwind

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.sp = !{!0, !5, !9, !18, !27}
!llvm.dbg.gv = !{!37, !38, !39, !41, !46}
!llvm.dbg.lv.memcpy = !{!48, !49, !50, !51, !55}
!llvm.dbg.lv.memmove = !{!58, !59, !60, !61, !65}
!llvm.dbg.lv.memset = !{!68, !69, !70, !71}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"f1", metadata !"f1", metadata !"f1", metadata !1, i32 10, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ()* @f1} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"test.c", metadata !"/home/shaw/work/klee/examples/test/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 1, metadata !"test.c", metadata !"/home/shaw/work/klee/examples/test/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{null}
!5 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 15, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null} ; [ DW_TAG_subroutine_type ]
!7 = metadata !{metadata !8}
!8 = metadata !{i32 589860, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!9 = metadata !{i32 589870, i32 0, metadata !10, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !10, i32 12, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!10 = metadata !{i32 589865, metadata !"memcpy.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !11} ; [ DW_TAG_file_type ]
!11 = metadata !{i32 589841, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!12 = metadata !{i32 589845, metadata !10, metadata !"", metadata !10, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null} ; [ DW_TAG_subroutine_type ]
!13 = metadata !{metadata !14, metadata !14, metadata !14, metadata !15}
!14 = metadata !{i32 589839, metadata !10, metadata !"", metadata !10, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!15 = metadata !{i32 589846, metadata !16, metadata !"size_t", metadata !16, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !17} ; [ DW_TAG_typedef ]
!16 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/lib/llvm-gcc-4.2-2.9-i686-linux/bin/../lib/gcc/i686-pc-linux-gnu/4.2.1/include", metadata !11} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 589860, metadata !10, metadata !"unsigned int", metadata !10, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!18 = metadata !{i32 589870, i32 0, metadata !19, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !19, i32 12, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!19 = metadata !{i32 589865, metadata !"memmove.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !20} ; [ DW_TAG_file_type ]
!20 = metadata !{i32 589841, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!21 = metadata !{i32 589845, metadata !19, metadata !"", metadata !19, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null} ; [ DW_TAG_subroutine_type ]
!22 = metadata !{metadata !23, metadata !23, metadata !23, metadata !24}
!23 = metadata !{i32 589839, metadata !19, metadata !"", metadata !19, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!24 = metadata !{i32 589846, metadata !25, metadata !"size_t", metadata !25, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !26} ; [ DW_TAG_typedef ]
!25 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/lib/llvm-gcc-4.2-2.9-i686-linux/bin/../lib/gcc/i686-pc-linux-gnu/4.2.1/include", metadata !20} ; [ DW_TAG_file_type ]
!26 = metadata !{i32 589860, metadata !19, metadata !"unsigned int", metadata !19, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!27 = metadata !{i32 589870, i32 0, metadata !28, metadata !"memset", metadata !"memset", metadata !"memset", metadata !28, i32 12, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!28 = metadata !{i32 589865, metadata !"memset.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !29} ; [ DW_TAG_file_type ]
!29 = metadata !{i32 589841, i32 0, i32 1, metadata !"memset.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!30 = metadata !{i32 589845, metadata !28, metadata !"", metadata !28, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, null} ; [ DW_TAG_subroutine_type ]
!31 = metadata !{metadata !32, metadata !32, metadata !33, metadata !34}
!32 = metadata !{i32 589839, metadata !28, metadata !"", metadata !28, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!33 = metadata !{i32 589860, metadata !28, metadata !"int", metadata !28, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!34 = metadata !{i32 589846, metadata !35, metadata !"size_t", metadata !35, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !36} ; [ DW_TAG_typedef ]
!35 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/lib/llvm-gcc-4.2-2.9-i686-linux/bin/../lib/gcc/i686-pc-linux-gnu/4.2.1/include", metadata !29} ; [ DW_TAG_file_type ]
!36 = metadata !{i32 589860, metadata !28, metadata !"unsigned int", metadata !28, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!37 = metadata !{i32 589876, i32 0, metadata !1, metadata !"a", metadata !"a", metadata !"", metadata !1, i32 3, metadata !8, i1 false, i1 true, i32* @a} ; [ DW_TAG_variable ]
!38 = metadata !{i32 589876, i32 0, metadata !1, metadata !"ai", metadata !"ai", metadata !"", metadata !1, i32 4, metadata !8, i1 false, i1 true, i32* @ai} ; [ DW_TAG_variable ]
!39 = metadata !{i32 589876, i32 0, metadata !1, metadata !"b", metadata !"b", metadata !"", metadata !1, i32 5, metadata !40, i1 false, i1 true, float* @b} ; [ DW_TAG_variable ]
!40 = metadata !{i32 589860, metadata !1, metadata !"float", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!41 = metadata !{i32 589876, i32 0, metadata !1, metadata !"str", metadata !"str", metadata !"", metadata !1, i32 6, metadata !42, i1 false, i1 true, [10 x i8]* @str} ; [ DW_TAG_variable ]
!42 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 80, i64 8, i64 0, i32 0, metadata !43, metadata !44, i32 0, null} ; [ DW_TAG_array_type ]
!43 = metadata !{i32 589860, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!44 = metadata !{metadata !45}
!45 = metadata !{i32 589857, i64 0, i64 9}        ; [ DW_TAG_subrange_type ]
!46 = metadata !{i32 589876, i32 0, metadata !1, metadata !"pi", metadata !"pi", metadata !"", metadata !1, i32 7, metadata !47, i1 false, i1 true, i32** @pi} ; [ DW_TAG_variable ]
!47 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ]
!48 = metadata !{i32 590081, metadata !9, metadata !"destaddr", metadata !10, i32 12, metadata !14, i32 0} ; [ DW_TAG_arg_variable ]
!49 = metadata !{i32 590081, metadata !9, metadata !"srcaddr", metadata !10, i32 12, metadata !14, i32 0} ; [ DW_TAG_arg_variable ]
!50 = metadata !{i32 590081, metadata !9, metadata !"len", metadata !10, i32 12, metadata !15, i32 0} ; [ DW_TAG_arg_variable ]
!51 = metadata !{i32 590080, metadata !52, metadata !"dest", metadata !10, i32 13, metadata !53, i32 0} ; [ DW_TAG_auto_variable ]
!52 = metadata !{i32 589835, metadata !9, i32 12, i32 0, metadata !10, i32 0} ; [ DW_TAG_lexical_block ]
!53 = metadata !{i32 589839, metadata !10, metadata !"", metadata !10, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !54} ; [ DW_TAG_pointer_type ]
!54 = metadata !{i32 589860, metadata !10, metadata !"char", metadata !10, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!55 = metadata !{i32 590080, metadata !52, metadata !"src", metadata !10, i32 14, metadata !56, i32 0} ; [ DW_TAG_auto_variable ]
!56 = metadata !{i32 589839, metadata !10, metadata !"", metadata !10, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !57} ; [ DW_TAG_pointer_type ]
!57 = metadata !{i32 589862, metadata !10, metadata !"", metadata !10, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !54} ; [ DW_TAG_const_type ]
!58 = metadata !{i32 590081, metadata !18, metadata !"dst", metadata !19, i32 12, metadata !23, i32 0} ; [ DW_TAG_arg_variable ]
!59 = metadata !{i32 590081, metadata !18, metadata !"src", metadata !19, i32 12, metadata !23, i32 0} ; [ DW_TAG_arg_variable ]
!60 = metadata !{i32 590081, metadata !18, metadata !"count", metadata !19, i32 12, metadata !24, i32 0} ; [ DW_TAG_arg_variable ]
!61 = metadata !{i32 590080, metadata !62, metadata !"a", metadata !19, i32 13, metadata !63, i32 0} ; [ DW_TAG_auto_variable ]
!62 = metadata !{i32 589835, metadata !18, i32 12, i32 0, metadata !19, i32 0} ; [ DW_TAG_lexical_block ]
!63 = metadata !{i32 589839, metadata !19, metadata !"", metadata !19, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !64} ; [ DW_TAG_pointer_type ]
!64 = metadata !{i32 589860, metadata !19, metadata !"char", metadata !19, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!65 = metadata !{i32 590080, metadata !62, metadata !"b", metadata !19, i32 14, metadata !66, i32 0} ; [ DW_TAG_auto_variable ]
!66 = metadata !{i32 589839, metadata !19, metadata !"", metadata !19, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !67} ; [ DW_TAG_pointer_type ]
!67 = metadata !{i32 589862, metadata !19, metadata !"", metadata !19, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !64} ; [ DW_TAG_const_type ]
!68 = metadata !{i32 590081, metadata !27, metadata !"dst", metadata !28, i32 12, metadata !32, i32 0} ; [ DW_TAG_arg_variable ]
!69 = metadata !{i32 590081, metadata !27, metadata !"s", metadata !28, i32 12, metadata !33, i32 0} ; [ DW_TAG_arg_variable ]
!70 = metadata !{i32 590081, metadata !27, metadata !"count", metadata !28, i32 12, metadata !34, i32 0} ; [ DW_TAG_arg_variable ]
!71 = metadata !{i32 590080, metadata !72, metadata !"a", metadata !28, i32 13, metadata !73, i32 0} ; [ DW_TAG_auto_variable ]
!72 = metadata !{i32 589835, metadata !27, i32 12, i32 0, metadata !28, i32 0} ; [ DW_TAG_lexical_block ]
!73 = metadata !{i32 589839, metadata !28, metadata !"", metadata !28, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !74} ; [ DW_TAG_pointer_type ]
!74 = metadata !{i32 589877, metadata !28, metadata !"", metadata !28, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !75} ; [ DW_TAG_volatile_type ]
!75 = metadata !{i32 589860, metadata !28, metadata !"char", metadata !28, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!76 = metadata !{i32 11, i32 0, metadata !77, null}
!77 = metadata !{i32 589835, metadata !0, i32 10, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!78 = metadata !{i32 12, i32 0, metadata !77, null}
!79 = metadata !{i32 17, i32 0, metadata !80, null}
!80 = metadata !{i32 589835, metadata !5, i32 15, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!81 = metadata !{i32 18, i32 0, metadata !80, null}
!82 = metadata !{i32 19, i32 0, metadata !80, null}
!83 = metadata !{i32 20, i32 0, metadata !80, null}
!84 = metadata !{i32 21, i32 0, metadata !80, null}
!85 = metadata !{i32 22, i32 0, metadata !80, null}
!86 = metadata !{i32 23, i32 0, metadata !80, null}
!87 = metadata !{i32 24, i32 0, metadata !80, null}
!88 = metadata !{i32 25, i32 0, metadata !80, null}
!89 = metadata !{i32 27, i32 0, metadata !80, null}
!90 = metadata !{i32 31, i32 0, metadata !80, null}
!91 = metadata !{i32 33, i32 0, metadata !80, null}
!92 = metadata !{i32 34, i32 0, metadata !80, null}
