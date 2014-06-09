; ModuleID = 'pthread.c'
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
  call void @llvm.dbg.declare(metadata !{%union.semun* %semops}, metadata !22), !dbg !83
  call void @llvm.dbg.declare(metadata !{i32* %res}, metadata !84), !dbg !85
  %1 = call i32 (...)* @semget(i32 0, i32 2, i32 950) nounwind, !dbg !86
  store i32 %1, i32* @semid, align 4, !dbg !86
  %2 = getelementptr inbounds %union.semun* %semops, i32 0, i32 0, !dbg !87
  store i32 0, i32* %2, align 4, !dbg !87
  %3 = load i32* @semid, align 4, !dbg !88
  %elt = getelementptr inbounds %union.semun* %semops, i32 0, i32 0, !dbg !88
  %val = load i32* %elt, !dbg !88
  %4 = call i32 (...)* @semctl(i32 %3, i32 0, i32 16, i32 %val) nounwind, !dbg !88
  store i32 %4, i32* %res, align 4, !dbg !88
  %5 = getelementptr inbounds %union.semun* %semops, i32 0, i32 0, !dbg !89
  store i32 1, i32* %5, align 4, !dbg !89
  %6 = load i32* @semid, align 4, !dbg !90
  %elt1 = getelementptr inbounds %union.semun* %semops, i32 0, i32 0, !dbg !90
  %val2 = load i32* %elt1, !dbg !90
  %7 = call i32 (...)* @semctl(i32 %6, i32 0, i32 16, i32 %val2) nounwind, !dbg !90
  store i32 %7, i32* %res, align 4, !dbg !90
  %8 = call i32 @pthread_create(i32* noalias @p1, %union.pthread_attr_t* noalias null, i8* (i8*)* bitcast (i8* ()* @subp1 to i8* (i8*)*), i8* noalias null) nounwind, !dbg !91
  %9 = call i32 @pthread_create(i32* noalias @p2, %union.pthread_attr_t* noalias null, i8* (i8*)* bitcast (i8* ()* @subp2 to i8* (i8*)*), i8* noalias null) nounwind, !dbg !92
  %10 = load i32* @p1, align 4, !dbg !93
  %11 = call i32 @pthread_join(i32 %10, i8** null) nounwind, !dbg !93
  %12 = load i32* @p2, align 4, !dbg !94
  %13 = call i32 @pthread_join(i32 %12, i8** null) nounwind, !dbg !94
  %14 = load i32* @semid, align 4, !dbg !95
  %15 = call i32 (...)* @semctl(i32 %14, i32 0, i32 0, i32 0) nounwind, !dbg !95
  store i32 0, i32* %0, align 4, !dbg !96
  %16 = load i32* %0, align 4, !dbg !96
  store i32 %16, i32* %retval, align 4, !dbg !96
  br label %return, !dbg !96

return:                                           ; preds = %entry
  %retval3 = load i32* %retval, !dbg !96
  ret i32 %retval3, !dbg !96
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
  call void @llvm.dbg.declare(metadata !{i32* %semid_addr}, metadata !97), !dbg !98
  store i32 %semid, i32* %semid_addr
  call void @llvm.dbg.declare(metadata !{i32* %index_addr}, metadata !99), !dbg !98
  store i32 %index, i32* %index_addr
  call void @llvm.dbg.declare(metadata !{%struct.sembuf* %sem}, metadata !100), !dbg !108
  %0 = load i32* %index_addr, align 4, !dbg !109
  %1 = trunc i32 %0 to i16, !dbg !109
  %2 = getelementptr inbounds %struct.sembuf* %sem, i32 0, i32 0, !dbg !109
  store i16 %1, i16* %2, align 2, !dbg !109
  %3 = getelementptr inbounds %struct.sembuf* %sem, i32 0, i32 1, !dbg !110
  store i16 -1, i16* %3, align 2, !dbg !110
  %4 = getelementptr inbounds %struct.sembuf* %sem, i32 0, i32 2, !dbg !111
  store i16 0, i16* %4, align 2, !dbg !111
  %5 = load i32* %semid_addr, align 4, !dbg !112
  %6 = call i32 (...)* @semop(i32 %5, %struct.sembuf* %sem, i32 1) nounwind, !dbg !112
  br label %return, !dbg !113

return:                                           ; preds = %entry
  ret void, !dbg !113
}

declare i32 @semop(...)

define void @V(i32 %semid, i32 %index) nounwind {
entry:
  %semid_addr = alloca i32, align 4
  %index_addr = alloca i32, align 4
  %sem = alloca %struct.sembuf
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{i32* %semid_addr}, metadata !114), !dbg !115
  store i32 %semid, i32* %semid_addr
  call void @llvm.dbg.declare(metadata !{i32* %index_addr}, metadata !116), !dbg !115
  store i32 %index, i32* %index_addr
  call void @llvm.dbg.declare(metadata !{%struct.sembuf* %sem}, metadata !117), !dbg !119
  %0 = load i32* %index_addr, align 4, !dbg !120
  %1 = trunc i32 %0 to i16, !dbg !120
  %2 = getelementptr inbounds %struct.sembuf* %sem, i32 0, i32 0, !dbg !120
  store i16 %1, i16* %2, align 2, !dbg !120
  %3 = getelementptr inbounds %struct.sembuf* %sem, i32 0, i32 1, !dbg !121
  store i16 1, i16* %3, align 2, !dbg !121
  %4 = getelementptr inbounds %struct.sembuf* %sem, i32 0, i32 2, !dbg !122
  store i16 0, i16* %4, align 2, !dbg !122
  %5 = load i32* %semid_addr, align 4, !dbg !123
  %6 = call i32 (...)* @semop(i32 %5, %struct.sembuf* %sem, i32 1) nounwind, !dbg !123
  br label %return, !dbg !124

return:                                           ; preds = %entry
  ret void, !dbg !124
}

define i8* @subp1() nounwind {
entry:
  %retval = alloca i8*
  %i = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !125), !dbg !127
  store i32 0, i32* %i, align 4, !dbg !128
  br label %bb1, !dbg !128

bb:                                               ; preds = %bb1
  %0 = load i32* @semid, align 4, !dbg !129
  call void @P(i32 %0, i32 0) nounwind, !dbg !129
  %1 = load i32* @a, align 4, !dbg !130
  %2 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 %1) nounwind, !dbg !130
  %3 = load i32* @semid, align 4, !dbg !131
  call void @V(i32 %3, i32 1) nounwind, !dbg !131
  %4 = load i32* %i, align 4, !dbg !128
  %5 = add nsw i32 %4, 1, !dbg !128
  store i32 %5, i32* %i, align 4, !dbg !128
  br label %bb1, !dbg !128

bb1:                                              ; preds = %bb, %entry
  %6 = load i32* %i, align 4, !dbg !128
  %7 = icmp sle i32 %6, 9, !dbg !128
  br i1 %7, label %bb, label %bb2, !dbg !128

bb2:                                              ; preds = %bb1
  br label %return, !dbg !132

return:                                           ; preds = %bb2
  %retval3 = load i8** %retval, !dbg !132
  ret i8* %retval3, !dbg !132
}

declare i32 @printf(i8* noalias, ...) nounwind

define i8* @subp2() nounwind {
entry:
  %retval = alloca i8*
  %i = alloca i32
  %"alloca point" = bitcast i32 0 to i32
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !133), !dbg !135
  store i32 0, i32* %i, align 4, !dbg !136
  br label %bb1, !dbg !136

bb:                                               ; preds = %bb1
  %0 = load i32* @semid, align 4, !dbg !137
  call void @P(i32 %0, i32 1) nounwind, !dbg !137
  %1 = load i32* @a, align 4, !dbg !138
  %2 = add nsw i32 %1, 1, !dbg !138
  store i32 %2, i32* @a, align 4, !dbg !138
  %3 = call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !139
  %4 = load i32* @semid, align 4, !dbg !140
  call void @V(i32 %4, i32 0) nounwind, !dbg !140
  %5 = load i32* %i, align 4, !dbg !136
  %6 = add nsw i32 %5, 1, !dbg !136
  store i32 %6, i32* %i, align 4, !dbg !136
  br label %bb1, !dbg !136

bb1:                                              ; preds = %bb, %entry
  %7 = load i32* %i, align 4, !dbg !136
  %8 = icmp sle i32 %7, 9, !dbg !136
  br i1 %8, label %bb, label %bb2, !dbg !136

bb2:                                              ; preds = %bb1
  br label %return, !dbg !141

return:                                           ; preds = %bb2
  %retval3 = load i8** %retval, !dbg !141
  ret i8* %retval3, !dbg !141
}

declare i32 @puts(i8*)

!llvm.dbg.gv = !{!0, !4, !5, !9}
!llvm.dbg.sp = !{!10, !13, !16, !17, !21}

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
!22 = metadata !{i32 590080, metadata !23, metadata !"semops", metadata !1, i32 19, metadata !24, i32 0} ; [ DW_TAG_auto_variable ]
!23 = metadata !{i32 589835, metadata !10, i32 18, i32 0, metadata !1, i32 0} ; [ DW_TAG_lexical_block ]
!24 = metadata !{i32 589847, metadata !1, metadata !"semun", metadata !25, i32 45, i64 32, i64 32, i64 0, i32 0, null, metadata !26, i32 0, null} ; [ DW_TAG_union_type ]
!25 = metadata !{i32 589865, metadata !"sem.h", metadata !"/usr/include/linux", metadata !2} ; [ DW_TAG_file_type ]
!26 = metadata !{metadata !27, metadata !28, metadata !66, metadata !68, metadata !82}
!27 = metadata !{i32 589837, metadata !24, metadata !"val", metadata !25, i32 46, i64 32, i64 32, i64 0, i32 0, metadata !3} ; [ DW_TAG_member ]
!28 = metadata !{i32 589837, metadata !24, metadata !"buf", metadata !25, i32 47, i64 32, i64 32, i64 0, i32 0, metadata !29} ; [ DW_TAG_member ]
!29 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !30} ; [ DW_TAG_pointer_type ]
!30 = metadata !{i32 589843, metadata !1, metadata !"semid_ds", metadata !25, i32 23, i64 352, i64 32, i64 0, i32 0, null, metadata !31, i32 0, null} ; [ DW_TAG_structure_type ]
!31 = metadata !{metadata !32, metadata !50, metadata !53, metadata !54, metadata !57, metadata !60, metadata !62, metadata !65}
!32 = metadata !{i32 589837, metadata !30, metadata !"sem_perm", metadata !25, i32 24, i64 128, i64 32, i64 0, i32 0, metadata !33} ; [ DW_TAG_member ]
!33 = metadata !{i32 589843, metadata !1, metadata !"ipc_perm", metadata !34, i32 10, i64 128, i64 32, i64 0, i32 0, null, metadata !35, i32 0, null} ; [ DW_TAG_structure_type ]
!34 = metadata !{i32 589865, metadata !"ipc.h", metadata !"/usr/include/linux", metadata !2} ; [ DW_TAG_file_type ]
!35 = metadata !{metadata !36, metadata !39, metadata !43, metadata !45, metadata !46, metadata !47, metadata !49}
!36 = metadata !{i32 589837, metadata !33, metadata !"key", metadata !34, i32 11, i64 32, i64 32, i64 0, i32 0, metadata !37} ; [ DW_TAG_member ]
!37 = metadata !{i32 589846, metadata !38, metadata !"__kernel_key_t", metadata !38, i32 44, i64 0, i64 0, i64 0, i32 0, metadata !3} ; [ DW_TAG_typedef ]
!38 = metadata !{i32 589865, metadata !"posix_types.h", metadata !"/usr/include/linux", metadata !2} ; [ DW_TAG_file_type ]
!39 = metadata !{i32 589837, metadata !33, metadata !"uid", metadata !34, i32 12, i64 16, i64 16, i64 32, i32 0, metadata !40} ; [ DW_TAG_member ]
!40 = metadata !{i32 589846, metadata !41, metadata !"__kernel_uid_t", metadata !41, i32 16, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ]
!41 = metadata !{i32 589865, metadata !"posix_types_32.h", metadata !"/usr/include/i386-linux-gnu/asm", metadata !2} ; [ DW_TAG_file_type ]
!42 = metadata !{i32 589860, metadata !1, metadata !"short unsigned int", metadata !1, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!43 = metadata !{i32 589837, metadata !33, metadata !"gid", metadata !34, i32 13, i64 16, i64 16, i64 48, i32 0, metadata !44} ; [ DW_TAG_member ]
!44 = metadata !{i32 589846, metadata !41, metadata !"__kernel_gid_t", metadata !41, i32 17, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ]
!45 = metadata !{i32 589837, metadata !33, metadata !"cuid", metadata !34, i32 14, i64 16, i64 16, i64 64, i32 0, metadata !40} ; [ DW_TAG_member ]
!46 = metadata !{i32 589837, metadata !33, metadata !"cgid", metadata !34, i32 15, i64 16, i64 16, i64 80, i32 0, metadata !44} ; [ DW_TAG_member ]
!47 = metadata !{i32 589837, metadata !33, metadata !"mode", metadata !34, i32 16, i64 16, i64 16, i64 96, i32 0, metadata !48} ; [ DW_TAG_member ]
!48 = metadata !{i32 589846, metadata !41, metadata !"__kernel_mode_t", metadata !41, i32 11, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ]
!49 = metadata !{i32 589837, metadata !33, metadata !"seq", metadata !34, i32 17, i64 16, i64 16, i64 112, i32 0, metadata !42} ; [ DW_TAG_member ]
!50 = metadata !{i32 589837, metadata !30, metadata !"sem_otime", metadata !25, i32 25, i64 32, i64 32, i64 128, i32 0, metadata !51} ; [ DW_TAG_member ]
!51 = metadata !{i32 589846, metadata !41, metadata !"__kernel_time_t", metadata !41, i32 21, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ]
!52 = metadata !{i32 589860, metadata !1, metadata !"long int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!53 = metadata !{i32 589837, metadata !30, metadata !"sem_ctime", metadata !25, i32 26, i64 32, i64 32, i64 160, i32 0, metadata !51} ; [ DW_TAG_member ]
!54 = metadata !{i32 589837, metadata !30, metadata !"sem_base", metadata !25, i32 27, i64 32, i64 32, i64 192, i32 0, metadata !55} ; [ DW_TAG_member ]
!55 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !56} ; [ DW_TAG_pointer_type ]
!56 = metadata !{i32 589843, metadata !1, metadata !"sem", metadata !25, i32 27, i64 0, i64 0, i64 0, i32 4, null, null, i32 0, null} ; [ DW_TAG_structure_type ]
!57 = metadata !{i32 589837, metadata !30, metadata !"sem_pending", metadata !25, i32 28, i64 32, i64 32, i64 224, i32 0, metadata !58} ; [ DW_TAG_member ]
!58 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !59} ; [ DW_TAG_pointer_type ]
!59 = metadata !{i32 589843, metadata !1, metadata !"sem_queue", metadata !25, i32 28, i64 0, i64 0, i64 0, i32 4, null, null, i32 0, null} ; [ DW_TAG_structure_type ]
!60 = metadata !{i32 589837, metadata !30, metadata !"sem_pending_last", metadata !25, i32 29, i64 32, i64 32, i64 256, i32 0, metadata !61} ; [ DW_TAG_member ]
!61 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !58} ; [ DW_TAG_pointer_type ]
!62 = metadata !{i32 589837, metadata !30, metadata !"undo", metadata !25, i32 30, i64 32, i64 32, i64 288, i32 0, metadata !63} ; [ DW_TAG_member ]
!63 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !64} ; [ DW_TAG_pointer_type ]
!64 = metadata !{i32 589843, metadata !1, metadata !"sem_undo", metadata !25, i32 30, i64 0, i64 0, i64 0, i32 4, null, null, i32 0, null} ; [ DW_TAG_structure_type ]
!65 = metadata !{i32 589837, metadata !30, metadata !"sem_nsems", metadata !25, i32 31, i64 16, i64 16, i64 320, i32 0, metadata !42} ; [ DW_TAG_member ]
!66 = metadata !{i32 589837, metadata !24, metadata !"array", metadata !25, i32 48, i64 32, i64 32, i64 0, i32 0, metadata !67} ; [ DW_TAG_member ]
!67 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !42} ; [ DW_TAG_pointer_type ]
!68 = metadata !{i32 589837, metadata !24, metadata !"__buf", metadata !25, i32 49, i64 32, i64 32, i64 0, i32 0, metadata !69} ; [ DW_TAG_member ]
!69 = metadata !{i32 589839, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !70} ; [ DW_TAG_pointer_type ]
!70 = metadata !{i32 589843, metadata !1, metadata !"seminfo", metadata !25, i32 49, i64 320, i64 32, i64 0, i32 0, null, metadata !71, i32 0, null} ; [ DW_TAG_structure_type ]
!71 = metadata !{metadata !72, metadata !73, metadata !74, metadata !75, metadata !76, metadata !77, metadata !78, metadata !79, metadata !80, metadata !81}
!72 = metadata !{i32 589837, metadata !70, metadata !"semmap", metadata !25, i32 54, i64 32, i64 32, i64 0, i32 0, metadata !3} ; [ DW_TAG_member ]
!73 = metadata !{i32 589837, metadata !70, metadata !"semmni", metadata !25, i32 55, i64 32, i64 32, i64 32, i32 0, metadata !3} ; [ DW_TAG_member ]
!74 = metadata !{i32 589837, metadata !70, metadata !"semmns", metadata !25, i32 56, i64 32, i64 32, i64 64, i32 0, metadata !3} ; [ DW_TAG_member ]
!75 = metadata !{i32 589837, metadata !70, metadata !"semmnu", metadata !25, i32 57, i64 32, i64 32, i64 96, i32 0, metadata !3} ; [ DW_TAG_member ]
!76 = metadata !{i32 589837, metadata !70, metadata !"semmsl", metadata !25, i32 58, i64 32, i64 32, i64 128, i32 0, metadata !3} ; [ DW_TAG_member ]
!77 = metadata !{i32 589837, metadata !70, metadata !"semopm", metadata !25, i32 59, i64 32, i64 32, i64 160, i32 0, metadata !3} ; [ DW_TAG_member ]
!78 = metadata !{i32 589837, metadata !70, metadata !"semume", metadata !25, i32 60, i64 32, i64 32, i64 192, i32 0, metadata !3} ; [ DW_TAG_member ]
!79 = metadata !{i32 589837, metadata !70, metadata !"semusz", metadata !25, i32 61, i64 32, i64 32, i64 224, i32 0, metadata !3} ; [ DW_TAG_member ]
!80 = metadata !{i32 589837, metadata !70, metadata !"semvmx", metadata !25, i32 62, i64 32, i64 32, i64 256, i32 0, metadata !3} ; [ DW_TAG_member ]
!81 = metadata !{i32 589837, metadata !70, metadata !"semaem", metadata !25, i32 63, i64 32, i64 32, i64 288, i32 0, metadata !3} ; [ DW_TAG_member ]
!82 = metadata !{i32 589837, metadata !24, metadata !"__pad", metadata !25, i32 50, i64 32, i64 32, i64 0, i32 0, metadata !20} ; [ DW_TAG_member ]
!83 = metadata !{i32 19, i32 0, metadata !23, null}
!84 = metadata !{i32 590080, metadata !23, metadata !"res", metadata !1, i32 20, metadata !3, i32 0} ; [ DW_TAG_auto_variable ]
!85 = metadata !{i32 20, i32 0, metadata !23, null}
!86 = metadata !{i32 22, i32 0, metadata !23, null}
!87 = metadata !{i32 23, i32 0, metadata !23, null}
!88 = metadata !{i32 24, i32 0, metadata !23, null}
!89 = metadata !{i32 25, i32 0, metadata !23, null}
!90 = metadata !{i32 26, i32 0, metadata !23, null}
!91 = metadata !{i32 27, i32 0, metadata !23, null}
!92 = metadata !{i32 28, i32 0, metadata !23, null}
!93 = metadata !{i32 29, i32 0, metadata !23, null}
!94 = metadata !{i32 30, i32 0, metadata !23, null}
!95 = metadata !{i32 31, i32 0, metadata !23, null}
!96 = metadata !{i32 32, i32 0, metadata !23, null}
!97 = metadata !{i32 590081, metadata !13, metadata !"semid", metadata !1, i32 35, metadata !3, i32 0} ; [ DW_TAG_arg_variable ]
!98 = metadata !{i32 35, i32 0, metadata !13, null}
!99 = metadata !{i32 590081, metadata !13, metadata !"index", metadata !1, i32 35, metadata !3, i32 0} ; [ DW_TAG_arg_variable ]
!100 = metadata !{i32 590080, metadata !101, metadata !"sem", metadata !1, i32 37, metadata !102, i32 0} ; [ DW_TAG_auto_variable ]
!101 = metadata !{i32 589835, metadata !13, i32 36, i32 0, metadata !1, i32 1} ; [ DW_TAG_lexical_block ]
!102 = metadata !{i32 589843, metadata !1, metadata !"sembuf", metadata !25, i32 38, i64 48, i64 16, i64 0, i32 0, null, metadata !103, i32 0, null} ; [ DW_TAG_structure_type ]
!103 = metadata !{metadata !104, metadata !105, metadata !107}
!104 = metadata !{i32 589837, metadata !102, metadata !"sem_num", metadata !25, i32 39, i64 16, i64 16, i64 0, i32 0, metadata !42} ; [ DW_TAG_member ]
!105 = metadata !{i32 589837, metadata !102, metadata !"sem_op", metadata !25, i32 40, i64 16, i64 16, i64 16, i32 0, metadata !106} ; [ DW_TAG_member ]
!106 = metadata !{i32 589860, metadata !1, metadata !"short int", metadata !1, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!107 = metadata !{i32 589837, metadata !102, metadata !"sem_flg", metadata !25, i32 41, i64 16, i64 16, i64 32, i32 0, metadata !106} ; [ DW_TAG_member ]
!108 = metadata !{i32 37, i32 0, metadata !101, null}
!109 = metadata !{i32 38, i32 0, metadata !101, null}
!110 = metadata !{i32 39, i32 0, metadata !101, null}
!111 = metadata !{i32 40, i32 0, metadata !101, null}
!112 = metadata !{i32 41, i32 0, metadata !101, null}
!113 = metadata !{i32 42, i32 0, metadata !101, null}
!114 = metadata !{i32 590081, metadata !16, metadata !"semid", metadata !1, i32 45, metadata !3, i32 0} ; [ DW_TAG_arg_variable ]
!115 = metadata !{i32 45, i32 0, metadata !16, null}
!116 = metadata !{i32 590081, metadata !16, metadata !"index", metadata !1, i32 45, metadata !3, i32 0} ; [ DW_TAG_arg_variable ]
!117 = metadata !{i32 590080, metadata !118, metadata !"sem", metadata !1, i32 47, metadata !102, i32 0} ; [ DW_TAG_auto_variable ]
!118 = metadata !{i32 589835, metadata !16, i32 46, i32 0, metadata !1, i32 2} ; [ DW_TAG_lexical_block ]
!119 = metadata !{i32 47, i32 0, metadata !118, null}
!120 = metadata !{i32 48, i32 0, metadata !118, null}
!121 = metadata !{i32 49, i32 0, metadata !118, null}
!122 = metadata !{i32 50, i32 0, metadata !118, null}
!123 = metadata !{i32 51, i32 0, metadata !118, null}
!124 = metadata !{i32 52, i32 0, metadata !118, null}
!125 = metadata !{i32 590080, metadata !126, metadata !"i", metadata !1, i32 57, metadata !3, i32 0} ; [ DW_TAG_auto_variable ]
!126 = metadata !{i32 589835, metadata !17, i32 56, i32 0, metadata !1, i32 3} ; [ DW_TAG_lexical_block ]
!127 = metadata !{i32 57, i32 0, metadata !126, null}
!128 = metadata !{i32 59, i32 0, metadata !126, null}
!129 = metadata !{i32 61, i32 0, metadata !126, null}
!130 = metadata !{i32 62, i32 0, metadata !126, null}
!131 = metadata !{i32 63, i32 0, metadata !126, null}
!132 = metadata !{i32 65, i32 0, metadata !126, null}
!133 = metadata !{i32 590080, metadata !134, metadata !"i", metadata !1, i32 70, metadata !3, i32 0} ; [ DW_TAG_auto_variable ]
!134 = metadata !{i32 589835, metadata !21, i32 69, i32 0, metadata !1, i32 4} ; [ DW_TAG_lexical_block ]
!135 = metadata !{i32 70, i32 0, metadata !134, null}
!136 = metadata !{i32 72, i32 0, metadata !134, null}
!137 = metadata !{i32 74, i32 0, metadata !134, null}
!138 = metadata !{i32 75, i32 0, metadata !134, null}
!139 = metadata !{i32 76, i32 0, metadata !134, null}
!140 = metadata !{i32 77, i32 0, metadata !134, null}
!141 = metadata !{i32 79, i32 0, metadata !134, null}
