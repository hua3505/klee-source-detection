; ModuleID = 'pthread.o'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-f128:128:128-n8:16:32"
target triple = "i386-pc-linux-gnu"

%struct.ipc_perm = type { i32, i16, i16, i16, i16, i16, i16 }
%struct.sem = type opaque
%struct.sem_queue = type opaque
%struct.sem_undo = type opaque
%struct.sembuf = type { i16, i16, i16 }
%struct.semid_ds = type { %struct.ipc_perm, i32, i32, %struct.sem*, %struct.sem_queue*, %struct.sem_queue**, %struct.sem_undo*, i16 }
%struct.seminfo = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%union.pthread_attr_t = type { i32, [8 x i32] }
%union.semun = type { i32 }

@a = unnamed_addr global i32 0
@semid = common unnamed_addr global i32 0
@p1 = common unnamed_addr global i32 0
@p2 = common unnamed_addr global i32 0
@.str = private unnamed_addr constant [12 x i8] c"subp1:a=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"subp2\00", align 1

define i32 @main() nounwind {
entry:
  %retval = alloca i32
  %0 = alloca i32
  %semops = alloca %union.semun
  %res = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  %1 = call i32 (...)* @semget(i32 0, i32 2, i32 950) nounwind, !dbg !78
  store i32 %1, i32* @semid, align 4, !dbg !78
  %2 = getelementptr inbounds %union.semun* %semops, i32 0, i32 0, !dbg !80
  store i32 0, i32* %2, align 4, !dbg !80
  %3 = load i32* @semid, align 4, !dbg !81
  %elt = getelementptr inbounds %union.semun* %semops, i32 0, i32 0, !dbg !81
  %val = load i32* %elt, !dbg !81
  %4 = call i32 (...)* @semctl(i32 %3, i32 0, i32 16, i32 %val) nounwind, !dbg !81
  store i32 %4, i32* %res, align 4, !dbg !81
  %5 = getelementptr inbounds %union.semun* %semops, i32 0, i32 0, !dbg !82
  store i32 1, i32* %5, align 4, !dbg !82
  %6 = load i32* @semid, align 4, !dbg !83
  %elt1 = getelementptr inbounds %union.semun* %semops, i32 0, i32 0, !dbg !83
  %val2 = load i32* %elt1, !dbg !83
  %7 = call i32 (...)* @semctl(i32 %6, i32 0, i32 16, i32 %val2) nounwind, !dbg !83
  store i32 %7, i32* %res, align 4, !dbg !83
  %8 = call i32 @pthread_create(i32* noalias @p1, %union.pthread_attr_t* noalias null, i8* (i8*)* bitcast (i8* ()* @subp1 to i8* (i8*)*), i8* noalias null) nounwind, !dbg !84
  %9 = call i32 @pthread_create(i32* noalias @p2, %union.pthread_attr_t* noalias null, i8* (i8*)* bitcast (i8* ()* @subp2 to i8* (i8*)*), i8* noalias null) nounwind, !dbg !85
  %10 = load i32* @p1, align 4, !dbg !86
  %11 = call i32 @pthread_join(i32 %10, i8** null) nounwind, !dbg !86
  %12 = load i32* @p2, align 4, !dbg !87
  %13 = call i32 @pthread_join(i32 %12, i8** null) nounwind, !dbg !87
  %14 = load i32* @semid, align 4, !dbg !88
  %15 = call i32 (...)* @semctl(i32 %14, i32 0, i32 0, i32 0) nounwind, !dbg !88
  store i32 0, i32* %0, align 4, !dbg !89
  %16 = load i32* %0, align 4, !dbg !89
  store i32 %16, i32* %retval, align 4, !dbg !89
  %retval3 = load i32* %retval, !dbg !89
  ret i32 %retval3, !dbg !89
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @semget(...)

declare i32 @semctl(...)

declare i32 @pthread_create(i32* noalias, %union.pthread_attr_t* noalias, i8* (i8*)*, i8* noalias) nounwind

declare i32 @pthread_join(i32, i8**)

define void @P(i32 %semid, i32 %index) nounwind {
entry:
  %semid_addr = alloca i32, align 4
  %index_addr = alloca i32, align 4
  %sem = alloca %struct.sembuf
  %"alloca point" = bitcast i32 0 to i32
  store i32 %semid, i32* %semid_addr
  store i32 %index, i32* %index_addr
  %0 = load i32* %index_addr, align 4, !dbg !90
  %1 = trunc i32 %0 to i16, !dbg !90
  %2 = getelementptr inbounds %struct.sembuf* %sem, i32 0, i32 0, !dbg !90
  store i16 %1, i16* %2, align 2, !dbg !90
  %3 = getelementptr inbounds %struct.sembuf* %sem, i32 0, i32 1, !dbg !92
  store i16 -1, i16* %3, align 2, !dbg !92
  %4 = getelementptr inbounds %struct.sembuf* %sem, i32 0, i32 2, !dbg !93
  store i16 0, i16* %4, align 2, !dbg !93
  %5 = load i32* %semid_addr, align 4, !dbg !94
  %6 = call i32 (...)* @semop(i32 %5, %struct.sembuf* %sem, i32 1) nounwind, !dbg !94
  ret void, !dbg !95
}

declare i32 @semop(...)

define void @V(i32 %semid, i32 %index) nounwind {
entry:
  %semid_addr = alloca i32, align 4
  %index_addr = alloca i32, align 4
  %sem = alloca %struct.sembuf
  %"alloca point" = bitcast i32 0 to i32
  store i32 %semid, i32* %semid_addr
  store i32 %index, i32* %index_addr
  %0 = load i32* %index_addr, align 4, !dbg !96
  %1 = trunc i32 %0 to i16, !dbg !96
  %2 = getelementptr inbounds %struct.sembuf* %sem, i32 0, i32 0, !dbg !96
  store i16 %1, i16* %2, align 2, !dbg !96
  %3 = getelementptr inbounds %struct.sembuf* %sem, i32 0, i32 1, !dbg !98
  store i16 1, i16* %3, align 2, !dbg !98
  %4 = getelementptr inbounds %struct.sembuf* %sem, i32 0, i32 2, !dbg !99
  store i16 0, i16* %4, align 2, !dbg !99
  %5 = load i32* %semid_addr, align 4, !dbg !100
  %6 = call i32 (...)* @semop(i32 %5, %struct.sembuf* %sem, i32 1) nounwind, !dbg !100
  ret void, !dbg !101
}

define i8* @subp1() nounwind {
entry:
  %retval = alloca i8*
  %i = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 0, i32* %i, align 4, !dbg !102
  br label %bb1, !dbg !102

bb:                                               ; preds = %bb1
  %0 = load i32* @semid, align 4, !dbg !104
  call void @P(i32 %0, i32 0) nounwind, !dbg !104
  %1 = load i32* @a, align 4, !dbg !105
  %2 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 %1) nounwind, !dbg !105
  %3 = load i32* @semid, align 4, !dbg !106
  call void @V(i32 %3, i32 1) nounwind, !dbg !106
  %4 = load i32* %i, align 4, !dbg !102
  %5 = add nsw i32 %4, 1, !dbg !102
  store i32 %5, i32* %i, align 4, !dbg !102
  br label %bb1, !dbg !102

bb1:                                              ; preds = %bb, %entry
  %6 = load i32* %i, align 4, !dbg !102
  %7 = icmp sle i32 %6, 9, !dbg !102
  br i1 %7, label %bb, label %return, !dbg !102

return:                                           ; preds = %bb1
  %retval3 = load i8** %retval, !dbg !107
  ret i8* %retval3, !dbg !107
}

declare i32 @printf(i8* noalias, ...) nounwind

define i8* @subp2() nounwind {
entry:
  %retval = alloca i8*
  %i = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  store i32 0, i32* %i, align 4, !dbg !108
  br label %bb1, !dbg !108

bb:                                               ; preds = %bb1
  %0 = load i32* @semid, align 4, !dbg !110
  call void @P(i32 %0, i32 1) nounwind, !dbg !110
  %1 = load i32* @a, align 4, !dbg !111
  %2 = add nsw i32 %1, 1, !dbg !111
  store i32 %2, i32* @a, align 4, !dbg !111
  %3 = call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !112
  %4 = load i32* @semid, align 4, !dbg !113
  call void @V(i32 %4, i32 0) nounwind, !dbg !113
  %5 = load i32* %i, align 4, !dbg !108
  %6 = add nsw i32 %5, 1, !dbg !108
  store i32 %6, i32* %i, align 4, !dbg !108
  br label %bb1, !dbg !108

bb1:                                              ; preds = %bb, %entry
  %7 = load i32* %i, align 4, !dbg !108
  %8 = icmp sle i32 %7, 9, !dbg !108
  br i1 %8, label %bb, label %return, !dbg !108

return:                                           ; preds = %bb1
  %retval3 = load i8** %retval, !dbg !114
  ret i8* %retval3, !dbg !114
}

declare i32 @puts(i8*)

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

!llvm.dbg.gv = !{!0, !4, !5, !9}
!llvm.dbg.sp = !{!10, !13, !16, !17, !21, !22, !31, !40}
!llvm.dbg.lv.memcpy = !{!50, !51, !52, !53, !57}
!llvm.dbg.lv.memmove = !{!60, !61, !62, !63, !67}
!llvm.dbg.lv.memset = !{!70, !71, !72, !73}

!0 = metadata !{i32 589876, i32 0, metadata !1, metadata !"a", metadata !"a", metadata !"", metadata !1, i32 9, metadata !3, i1 false, i1 true, i32* @a} ; [ DW_TAG_variable ]
!1 = metadata !{i32 589865, metadata !"pthread.c", metadata !"/home/shaw/work/klee/examples/thread/", metadata !2} ; [ DW_TAG_file_type ]
!2 = metadata !{i32 589841, i32 0, i32 1, metadata !"pthread.c", metadata !"/home/shaw/work/klee/examples/thread/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 589860, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!4 = metadata !{i32 589876, i32 0, metadata !1, metadata !"semid", metadata !"semid", metadata !"", metadata !1, i32 8, metadata !3, i1 false, i1 true, i32* @semid} ; [ DW_TAG_variable ]
!5 = metadata !{i32 589876, i32 0, metadata !1, metadata !"p1", metadata !"p1", metadata !"", metadata !1, i32 10, metadata !6, i1 false, i1 true, i32* @p1} ; [ DW_TAG_variable ]
!6 = metadata !{i32 589846, metadata !7, metadata !"pthread_t", metadata !7, i32 40, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ]
!7 = metadata !{i32 589865, metadata !"pthreadtypes.h", metadata !"/usr/include/i386-linux-gnu/bits", metadata !2} ; [ DW_TAG_file_type ]
!8 = metadata !{i32 589860, metadata !1, metadata !"long unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!9 = metadata !{i32 589876, i32 0, metadata !1, metadata !"p2", metadata !"p2", metadata !"", metadata !1, i32 10, metadata !6, i1 false, i1 true, i32* @p2} ; [ DW_TAG_variable ]
!10 = metadata !{i32 589870, i32 0, metadata !1, metadata !"main", metadata !"main", metadata !"main", metadata !1, i32 18, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main} ; [ DW_TAG_subprogram ]
!11 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null} ; [ DW_TAG_subroutine_type ]
!12 = metadata !{metadata !3}
!13 = metadata !{i32 589870, i32 0, metadata !1, metadata !"P", metadata !"P", metadata !"P", metadata !1, i32 36, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32)* @P} ; [ DW_TAG_subprogram ]
!14 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null} ; [ DW_TAG_subroutine_type ]
!15 = metadata !{null, metadata !3, metadata !3}
!16 = metadata !{i32 589870, i32 0, metadata !1, metadata !"V", metadata !"V", metadata !"V", metadata !1, i32 46, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32)* @V} ; [ DW_TAG_subprogram ]
!17 = metadata !{i32 589870, i32 0, metadata !1, metadata !"subp1", metadata !"subp1", metadata !"subp1", metadata !1, i32 56, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* ()* @subp1} ; [ DW_TAG_subprogram ]
!18 = metadata !{i32 589845, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null} ; [ DW_TAG_subroutine_type ]
!19 = metadata !{metadata !20}
!20 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!21 = metadata !{i32 589870, i32 0, metadata !1, metadata !"subp2", metadata !"subp2", metadata !"subp2", metadata !1, i32 69, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8* ()* @subp2} ; [ DW_TAG_subprogram ]
!22 = metadata !{i32 589870, i32 0, metadata !23, metadata !"memcpy", metadata !"memcpy", metadata !"memcpy", metadata !23, i32 12, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!23 = metadata !{i32 589865, metadata !"memcpy.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !24} ; [ DW_TAG_file_type ]
!24 = metadata !{i32 589841, i32 0, i32 1, metadata !"memcpy.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!25 = metadata !{i32 589845, metadata !23, metadata !"", metadata !23, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null} ; [ DW_TAG_subroutine_type ]
!26 = metadata !{metadata !27, metadata !27, metadata !27, metadata !28}
!27 = metadata !{i32 589839, metadata !23, metadata !"", metadata !23, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!28 = metadata !{i32 589846, metadata !29, metadata !"size_t", metadata !29, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!29 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/lib/llvm-gcc-4.2-2.9-i686-linux/bin/../lib/gcc/i686-pc-linux-gnu/4.2.1/include", metadata !24} ; [ DW_TAG_file_type ]
!30 = metadata !{i32 589860, metadata !23, metadata !"unsigned int", metadata !23, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!31 = metadata !{i32 589870, i32 0, metadata !32, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !32, i32 12, metadata !34, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!32 = metadata !{i32 589865, metadata !"memmove.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !33} ; [ DW_TAG_file_type ]
!33 = metadata !{i32 589841, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!34 = metadata !{i32 589845, metadata !32, metadata !"", metadata !32, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !35, i32 0, null} ; [ DW_TAG_subroutine_type ]
!35 = metadata !{metadata !36, metadata !36, metadata !36, metadata !37}
!36 = metadata !{i32 589839, metadata !32, metadata !"", metadata !32, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!37 = metadata !{i32 589846, metadata !38, metadata !"size_t", metadata !38, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!38 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/lib/llvm-gcc-4.2-2.9-i686-linux/bin/../lib/gcc/i686-pc-linux-gnu/4.2.1/include", metadata !33} ; [ DW_TAG_file_type ]
!39 = metadata !{i32 589860, metadata !32, metadata !"unsigned int", metadata !32, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!40 = metadata !{i32 589870, i32 0, metadata !41, metadata !"memset", metadata !"memset", metadata !"memset", metadata !41, i32 12, metadata !43, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null} ; [ DW_TAG_subprogram ]
!41 = metadata !{i32 589865, metadata !"memset.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !42} ; [ DW_TAG_file_type ]
!42 = metadata !{i32 589841, i32 0, i32 1, metadata !"memset.c", metadata !"/home/shaw/work/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.9)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!43 = metadata !{i32 589845, metadata !41, metadata !"", metadata !41, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !44, i32 0, null} ; [ DW_TAG_subroutine_type ]
!44 = metadata !{metadata !45, metadata !45, metadata !46, metadata !47}
!45 = metadata !{i32 589839, metadata !41, metadata !"", metadata !41, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!46 = metadata !{i32 589860, metadata !41, metadata !"int", metadata !41, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!47 = metadata !{i32 589846, metadata !48, metadata !"size_t", metadata !48, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !49} ; [ DW_TAG_typedef ]
!48 = metadata !{i32 589865, metadata !"stddef.h", metadata !"/usr/lib/llvm-gcc-4.2-2.9-i686-linux/bin/../lib/gcc/i686-pc-linux-gnu/4.2.1/include", metadata !42} ; [ DW_TAG_file_type ]
!49 = metadata !{i32 589860, metadata !41, metadata !"unsigned int", metadata !41, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!50 = metadata !{i32 590081, metadata !22, metadata !"destaddr", metadata !23, i32 12, metadata !27, i32 0} ; [ DW_TAG_arg_variable ]
!51 = metadata !{i32 590081, metadata !22, metadata !"srcaddr", metadata !23, i32 12, metadata !27, i32 0} ; [ DW_TAG_arg_variable ]
!52 = metadata !{i32 590081, metadata !22, metadata !"len", metadata !23, i32 12, metadata !28, i32 0} ; [ DW_TAG_arg_variable ]
!53 = metadata !{i32 590080, metadata !54, metadata !"dest", metadata !23, i32 13, metadata !55, i32 0} ; [ DW_TAG_auto_variable ]
!54 = metadata !{i32 589835, metadata !22, i32 12, i32 0, metadata !23, i32 0} ; [ DW_TAG_lexical_block ]
!55 = metadata !{i32 589839, metadata !23, metadata !"", metadata !23, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !56} ; [ DW_TAG_pointer_type ]
!56 = metadata !{i32 589860, metadata !23, metadata !"char", metadata !23, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!57 = metadata !{i32 590080, metadata !54, metadata !"src", metadata !23, i32 14, metadata !58, i32 0} ; [ DW_TAG_auto_variable ]
!58 = metadata !{i32 589839, metadata !23, metadata !"", metadata !23, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !59} ; [ DW_TAG_pointer_type ]
!59 = metadata !{i32 589862, metadata !23, metadata !"", metadata !23, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !56} ; [ DW_TAG_const_type ]
!60 = metadata !{i32 590081, metadata !31, metadata !"dst", metadata !32, i32 12, metadata !36, i32 0} ; [ DW_TAG_arg_variable ]
!61 = metadata !{i32 590081, metadata !31, metadata !"src", metadata !32, i32 12, metadata !36, i32 0} ; [ DW_TAG_arg_variable ]
!62 = metadata !{i32 590081, metadata !31, metadata !"count", metadata !32, i32 12, metadata !37, i32 0} ; [ DW_TAG_arg_variable ]
!63 = metadata !{i32 590080, metadata !64, metadata !"a", metadata !32, i32 13, metadata !65, i32 0} ; [ DW_TAG_auto_variable ]
!64 = metadata !{i32 589835, metadata !31, i32 12, i32 0, metadata !32, i32 0} ; [ DW_TAG_lexical_block ]
!65 = metadata !{i32 589839, metadata !32, metadata !"", metadata !32, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !66} ; [ DW_TAG_pointer_type ]
!66 = metadata !{i32 589860, metadata !32, metadata !"char", metadata !32, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!67 = metadata !{i32 590080, metadata !64, metadata !"b", metadata !32, i32 14, metadata !68, i32 0} ; [ DW_TAG_auto_variable ]
!68 = metadata !{i32 589839, metadata !32, metadata !"", metadata !32, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !69} ; [ DW_TAG_pointer_type ]
!69 = metadata !{i32 589862, metadata !32, metadata !"", metadata !32, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !66} ; [ DW_TAG_const_type ]
!70 = metadata !{i32 590081, metadata !40, metadata !"dst", metadata !41, i32 12, metadata !45, i32 0} ; [ DW_TAG_arg_variable ]
!71 = metadata !{i32 590081, metadata !40, metadata !"s", metadata !41, i32 12, metadata !46, i32 0} ; [ DW_TAG_arg_variable ]
!72 = metadata !{i32 590081, metadata !40, metadata !"count", metadata !41, i32 12, metadata !47, i32 0} ; [ DW_TAG_arg_variable ]
!73 = metadata !{i32 590080, metadata !74, metadata !"a", metadata !41, i32 13, metadata !75, i32 0} ; [ DW_TAG_auto_variable ]
!74 = metadata !{i32 589835, metadata !40, i32 12, i32 0, metadata !41, i32 0} ; [ DW_TAG_lexical_block ]
!75 = metadata !{i32 589839, metadata !41, metadata !"", metadata !41, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !76} ; [ DW_TAG_pointer_type ]
!76 = metadata !{i32 589877, metadata !41, metadata !"", metadata !41, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !77} ; [ DW_TAG_volatile_type ]
!77 = metadata !{i32 589860, metadata !41, metadata !"char", metadata !41, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!78 = metadata !{i32 22, i32 0, metadata !79, null}
!79 = metadata !{i32 589835, metadata !10, i32 18, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!80 = metadata !{i32 23, i32 0, metadata !79, null}
!81 = metadata !{i32 24, i32 0, metadata !79, null}
!82 = metadata !{i32 25, i32 0, metadata !79, null}
!83 = metadata !{i32 26, i32 0, metadata !79, null}
!84 = metadata !{i32 27, i32 0, metadata !79, null}
!85 = metadata !{i32 28, i32 0, metadata !79, null}
!86 = metadata !{i32 29, i32 0, metadata !79, null}
!87 = metadata !{i32 30, i32 0, metadata !79, null}
!88 = metadata !{i32 31, i32 0, metadata !79, null}
!89 = metadata !{i32 32, i32 0, metadata !79, null}
!90 = metadata !{i32 38, i32 0, metadata !91, null}
!91 = metadata !{i32 589835, metadata !13, i32 36, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!92 = metadata !{i32 39, i32 0, metadata !91, null}
!93 = metadata !{i32 40, i32 0, metadata !91, null}
!94 = metadata !{i32 41, i32 0, metadata !91, null}
!95 = metadata !{i32 42, i32 0, metadata !91, null}
!96 = metadata !{i32 48, i32 0, metadata !97, null}
!97 = metadata !{i32 589835, metadata !16, i32 46, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!98 = metadata !{i32 49, i32 0, metadata !97, null}
!99 = metadata !{i32 50, i32 0, metadata !97, null}
!100 = metadata !{i32 51, i32 0, metadata !97, null}
!101 = metadata !{i32 52, i32 0, metadata !97, null}
!102 = metadata !{i32 59, i32 0, metadata !103, null}
!103 = metadata !{i32 589835, metadata !17, i32 56, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!104 = metadata !{i32 61, i32 0, metadata !103, null}
!105 = metadata !{i32 62, i32 0, metadata !103, null}
!106 = metadata !{i32 63, i32 0, metadata !103, null}
!107 = metadata !{i32 65, i32 0, metadata !103, null}
!108 = metadata !{i32 72, i32 0, metadata !109, null}
!109 = metadata !{i32 589835, metadata !21, i32 69, i32 0, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!110 = metadata !{i32 74, i32 0, metadata !109, null}
!111 = metadata !{i32 75, i32 0, metadata !109, null}
!112 = metadata !{i32 76, i32 0, metadata !109, null}
!113 = metadata !{i32 77, i32 0, metadata !109, null}
!114 = metadata !{i32 79, i32 0, metadata !109, null}
