; ModuleID = 'test.o'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-f128:128:128-n8:16:32"
target triple = "i386-pc-linux-gnu"

@str = common unnamed_addr global [10 x i8] zeroinitializer
@pi = common unnamed_addr global i32* null
@a = common unnamed_addr global i32 0
@b = common unnamed_addr global float 0.000000e+00

define i32 @main() nounwind {
entry:
  %retval = alloca i32
  %0 = alloca i32
  %c = alloca i8
  %"alloca point" = bitcast i32 0 to i32
  store i8 104, i8* getelementptr inbounds ([10 x i8]* @str, i32 0, i32 1), align 1, !dbg !72
  %1 = load i8* getelementptr inbounds ([10 x i8]* @str, i32 0, i32 1), align 1, !dbg !74
  store i8 %1, i8* %c, align 1, !dbg !74
  store i32* @a, i32** @pi, align 4, !dbg !75
  store i32 0, i32* %0, align 4, !dbg !76
  %2 = load i32* %0, align 4, !dbg !76
  store i32 %2, i32* %retval, align 4, !dbg !76
  %retval1 = load i32* %retval, !dbg !76
  ret i32 %retval1, !dbg !76
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.sp = !{!0, !6, !15, !24}
!llvm.dbg.gv = !{!34, !35, !37, !42}
!llvm.dbg.lv.memcpy = !{!44, !45, !46, !47, !51}
!llvm.dbg.lv.memmove = !{!54, !55, !56, !57, !61}
!llvm.dbg.lv.memset = !{!64, !65, !66, !67}

!0 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 7, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main} ; [ DW_TAG_subprogram ]
!1 = metadata !{i32 589865, metadata !"test.c", metadata !"/home/shaw/work/klee/examples/test/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 1, metadata !"test.c", metadata !"/home/shaw/work/klee/examples/test/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5}
!5 = metadata !{i32 589860, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 589870, i32 0, metadata !7, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !7, i32 12, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!7 = metadata !{i32 589865, metadata !"memcpy.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !8} ; [ DW_TAG_file_type ]
!8 = metadata !{i32 589841, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!9 = metadata !{i32 589845, metadata !7, metadata !"", metadata !7, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null} ; [ DW_TAG_subroutine_type ]
!10 = metadata !{metadata !11, metadata !11, metadata !11, metadata !12}
!11 = metadata !{i32 589839, metadata !7, metadata !"", metadata !7, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 589846, metadata !13, metadata !"size_t", metadata !13, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_typedef ]
!13 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/lib/llvm-gcc-4.2-2.9-i686-linux/bin/../lib/gcc/i686-pc-linux-gnu/4.2.1/include", metadata !8} ; [ DW_TAG_file_type ]
!14 = metadata !{i32 589860, metadata !7, metadata !"unsigned int", metadata !7, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!15 = metadata !{i32 589870, i32 0, metadata !16, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !16, i32 12, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!16 = metadata !{i32 589865, metadata !"memmove.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !17} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 589841, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!18 = metadata !{i32 589845, metadata !16, metadata !"", metadata !16, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null} ; [ DW_TAG_subroutine_type ]
!19 = metadata !{metadata !20, metadata !20, metadata !20, metadata !21}
!20 = metadata !{i32 589839, metadata !16, metadata !"", metadata !16, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!21 = metadata !{i32 589846, metadata !22, metadata !"size_t", metadata !22, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!22 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/lib/llvm-gcc-4.2-2.9-i686-linux/bin/../lib/gcc/i686-pc-linux-gnu/4.2.1/include", metadata !17} ; [ DW_TAG_file_type ]
!23 = metadata !{i32 589860, metadata !16, metadata !"unsigned int", metadata !16, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!24 = metadata !{i32 589870, i32 0, metadata !25, metadata !"memset", metadata !"memset", metadata !"memset", metadata !25, i32 12, metadata !27, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!25 = metadata !{i32 589865, metadata !"memset.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !26} ; [ DW_TAG_file_type ]
!26 = metadata !{i32 589841, i32 0, i32 1, metadata !"memset.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!27 = metadata !{i32 589845, metadata !25, metadata !"", metadata !25, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !28, i32 0, null} ; [ DW_TAG_subroutine_type ]
!28 = metadata !{metadata !29, metadata !29, metadata !30, metadata !31}
!29 = metadata !{i32 589839, metadata !25, metadata !"", metadata !25, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!30 = metadata !{i32 589860, metadata !25, metadata !"int", metadata !25, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!31 = metadata !{i32 589846, metadata !32, metadata !"size_t", metadata !32, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ]
!32 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/lib/llvm-gcc-4.2-2.9-i686-linux/bin/../lib/gcc/i686-pc-linux-gnu/4.2.1/include", metadata !26} ; [ DW_TAG_file_type ]
!33 = metadata !{i32 589860, metadata !25, metadata !"unsigned int", metadata !25, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!34 = metadata !{i32 589876, i32 0, metadata !1, metadata !"a", metadata !"a", metadata !"", metadata !1, i32 1, metadata !5, i1 false, i1 true, i32* @a} ; [ DW_TAG_variable ]
!35 = metadata !{i32 589876, i32 0, metadata !1, metadata !"b", metadata !"b", metadata !"", metadata !1, i32 2, metadata !36, i1 false, i1 true, float* @b} ; [ DW_TAG_variable ]
!36 = metadata !{i32 589860, metadata !1, metadata !"float", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!37 = metadata !{i32 589876, i32 0, metadata !1, metadata !"str", metadata !"str", metadata !"", metadata !1, i32 3, metadata !38, i1 false, i1 true, [10 x i8]* @str} ; [ DW_TAG_variable ]
!38 = metadata !{i32 589825, metadata !1, metadata !"", metadata !1, i32 0, i64 80, i64 8, i64 0, i32 0, metadata !39, metadata !40, i32 0, null} ; [ DW_TAG_array_type ]
!39 = metadata !{i32 589860, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!40 = metadata !{metadata !41}
!41 = metadata !{i32 589857, i64 0, i64 9}        ; [ DW_TAG_subrange_type ]
!42 = metadata !{i32 589876, i32 0, metadata !1, metadata !"pi", metadata !"pi", metadata !"", metadata !1, i32 4, metadata !43, i1 false, i1 true, i32** @pi} ; [ DW_TAG_variable ]
!43 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !5} ; [ DW_TAG_pointer_type ]
!44 = metadata !{i32 590081, metadata !6, metadata !"destaddr", metadata !7, i32 12, metadata !11, i32 0} ; [ DW_TAG_arg_variable ]
!45 = metadata !{i32 590081, metadata !6, metadata !"srcaddr", metadata !7, i32 12, metadata !11, i32 0} ; [ DW_TAG_arg_variable ]
!46 = metadata !{i32 590081, metadata !6, metadata !"len", metadata !7, i32 12, metadata !12, i32 0} ; [ DW_TAG_arg_variable ]
!47 = metadata !{i32 590080, metadata !48, metadata !"dest", metadata !7, i32 13, metadata !49, i32 0} ; [ DW_TAG_auto_variable ]
!48 = metadata !{i32 589835, metadata !6, i32 12, i32 0, metadata !7, i32 0} ; [ DW_TAG_lexical_block ]
!49 = metadata !{i32 589839, metadata !7, metadata !"", metadata !7, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !50} ; [ DW_TAG_pointer_type ]
!50 = metadata !{i32 589860, metadata !7, metadata !"char", metadata !7, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!51 = metadata !{i32 590080, metadata !48, metadata !"src", metadata !7, i32 14, metadata !52, i32 0} ; [ DW_TAG_auto_variable ]
!52 = metadata !{i32 589839, metadata !7, metadata !"", metadata !7, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !53} ; [ DW_TAG_pointer_type ]
!53 = metadata !{i32 589862, metadata !7, metadata !"", metadata !7, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !50} ; [ DW_TAG_const_type ]
!54 = metadata !{i32 590081, metadata !15, metadata !"dst", metadata !16, i32 12, metadata !20, i32 0} ; [ DW_TAG_arg_variable ]
!55 = metadata !{i32 590081, metadata !15, metadata !"src", metadata !16, i32 12, metadata !20, i32 0} ; [ DW_TAG_arg_variable ]
!56 = metadata !{i32 590081, metadata !15, metadata !"count", metadata !16, i32 12, metadata !21, i32 0} ; [ DW_TAG_arg_variable ]
!57 = metadata !{i32 590080, metadata !58, metadata !"a", metadata !16, i32 13, metadata !59, i32 0} ; [ DW_TAG_auto_variable ]
!58 = metadata !{i32 589835, metadata !15, i32 12, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ]
!59 = metadata !{i32 589839, metadata !16, metadata !"", metadata !16, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_pointer_type ]
!60 = metadata !{i32 589860, metadata !16, metadata !"char", metadata !16, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!61 = metadata !{i32 590080, metadata !58, metadata !"b", metadata !16, i32 14, metadata !62, i32 0} ; [ DW_TAG_auto_variable ]
!62 = metadata !{i32 589839, metadata !16, metadata !"", metadata !16, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !63} ; [ DW_TAG_pointer_type ]
!63 = metadata !{i32 589862, metadata !16, metadata !"", metadata !16, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !60} ; [ DW_TAG_const_type ]
!64 = metadata !{i32 590081, metadata !24, metadata !"dst", metadata !25, i32 12, metadata !29, i32 0} ; [ DW_TAG_arg_variable ]
!65 = metadata !{i32 590081, metadata !24, metadata !"s", metadata !25, i32 12, metadata !30, i32 0} ; [ DW_TAG_arg_variable ]
!66 = metadata !{i32 590081, metadata !24, metadata !"count", metadata !25, i32 12, metadata !31, i32 0} ; [ DW_TAG_arg_variable ]
!67 = metadata !{i32 590080, metadata !68, metadata !"a", metadata !25, i32 13, metadata !69, i32 0} ; [ DW_TAG_auto_variable ]
!68 = metadata !{i32 589835, metadata !24, i32 12, i32 0, metadata !25, i32 0} ; [ DW_TAG_lexical_block ]
!69 = metadata !{i32 589839, metadata !25, metadata !"", metadata !25, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !70} ; [ DW_TAG_pointer_type ]
!70 = metadata !{i32 589877, metadata !25, metadata !"", metadata !25, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !71} ; [ DW_TAG_volatile_type ]
!71 = metadata !{i32 589860, metadata !25, metadata !"char", metadata !25, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!72 = metadata !{i32 9, i32 0, metadata !73, null}
!73 = metadata !{i32 589835, metadata !0, i32 7, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!74 = metadata !{i32 10, i32 0, metadata !73, null}
!75 = metadata !{i32 11, i32 0, metadata !73, null}
!76 = metadata !{i32 12, i32 0, metadata !73, null}
