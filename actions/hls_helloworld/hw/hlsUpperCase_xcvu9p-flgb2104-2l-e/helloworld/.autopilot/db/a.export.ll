; ModuleID = '/afs/apd.pok.ibm.com/func/vlsi/eclipz/c14/usr/zhichao/p9nd2/SNAP/snap/actions/hls_helloworld/hw/hlsUpperCase_xcvu9p-flgb2104-2l-e/helloworld/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm_global_ctors_1 = appending global [0 x void ()*] zeroinitializer
@llvm_global_ctors_0 = appending global [0 x i32] zeroinitializer
@hls_action_str = internal unnamed_addr constant [11 x i8] c"hls_action\00"
@p_str9 = private unnamed_addr constant [6 x i8] c"0x100\00", align 1
@p_str8 = private unnamed_addr constant [6 x i8] c"0x010\00", align 1
@p_str7 = private unnamed_addr constant [6 x i8] c"0x040\00", align 1
@p_str6 = private unnamed_addr constant [6 x i8] c"0x030\00", align 1
@p_str5 = private unnamed_addr constant [9 x i8] c"ctrl_reg\00", align 1
@p_str4 = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1
@p_str3 = private unnamed_addr constant [6 x i8] c"slave\00", align 1
@p_str2 = private unnamed_addr constant [9 x i8] c"host_mem\00", align 1
@p_str11 = private unnamed_addr constant [21 x i8] c"uppercase_conversion\00", align 1
@p_str10 = private unnamed_addr constant [10 x i8] c"main_loop\00", align 1
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1

define internal fastcc void @process_action(i512* %din_gmem_V, i58 %din_gmem_V_offset, i58 %dout_gmem_V_offset, i64 %act_reg_Data_in_addr, i32 %act_reg_Data_in_size, i64 %act_reg_Data_out_add) {
  %act_reg_Data_out_add_1 = call i64 @_ssdm_op_Read.ap_auto.i64(i64 %act_reg_Data_out_add)
  %act_reg_Data_in_size_1 = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %act_reg_Data_in_size)
  %act_reg_Data_in_addr_1 = call i64 @_ssdm_op_Read.ap_auto.i64(i64 %act_reg_Data_in_addr)
  %dout_gmem_V_offset_r = call i58 @_ssdm_op_Read.ap_auto.i58(i58 %dout_gmem_V_offset)
  %din_gmem_V_offset_re = call i58 @_ssdm_op_Read.ap_auto.i58(i58 %din_gmem_V_offset)
  %dout_gmem_V_offset_c = zext i58 %dout_gmem_V_offset_r to i64
  %din_gmem_V_offset_ca = zext i58 %din_gmem_V_offset_re to i64
  call void (...)* @_ssdm_op_SpecInterface(i512* %din_gmem_V, [6 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 512, [9 x i8]* @p_str2, [6 x i8]* @p_str3, [1 x i8]* @p_str1, i32 16, i32 16, i32 64, i32 64, [1 x i8]* @p_str1, [1 x i8]* @p_str1)
  call void (...)* @_ssdm_op_SpecInterface(i512* %din_gmem_V, [6 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 512, [9 x i8]* @p_str2, [6 x i8]* @p_str3, [1 x i8]* @p_str1, i32 16, i32 16, i32 64, i32 64, [1 x i8]* @p_str1, [1 x i8]* @p_str1)
  %text = alloca [64 x i8], align 16
  %i_idx = call i58 @_ssdm_op_PartSelect.i58.i64.i32.i32(i64 %act_reg_Data_in_addr_1, i32 6, i32 63)
  %i_idx_2 = zext i58 %i_idx to i64
  %o_idx = call i58 @_ssdm_op_PartSelect.i58.i64.i32.i32(i64 %act_reg_Data_out_add_1, i32 6, i32 63)
  %o_idx_2 = zext i58 %o_idx to i64
  %text_addr = getelementptr inbounds [64 x i8]* %text, i64 0, i64 0
  %text_addr_1 = getelementptr [64 x i8]* %text, i64 0, i64 1
  %text_addr_2 = getelementptr [64 x i8]* %text, i64 0, i64 2
  %text_addr_3 = getelementptr [64 x i8]* %text, i64 0, i64 3
  %text_addr_4 = getelementptr [64 x i8]* %text, i64 0, i64 4
  %text_addr_5 = getelementptr [64 x i8]* %text, i64 0, i64 5
  %text_addr_6 = getelementptr [64 x i8]* %text, i64 0, i64 6
  %text_addr_7 = getelementptr [64 x i8]* %text, i64 0, i64 7
  %text_addr_8 = getelementptr [64 x i8]* %text, i64 0, i64 8
  %text_addr_9 = getelementptr [64 x i8]* %text, i64 0, i64 9
  %text_addr_10 = getelementptr [64 x i8]* %text, i64 0, i64 10
  %text_addr_11 = getelementptr [64 x i8]* %text, i64 0, i64 11
  %text_addr_12 = getelementptr [64 x i8]* %text, i64 0, i64 12
  %text_addr_13 = getelementptr [64 x i8]* %text, i64 0, i64 13
  %text_addr_14 = getelementptr [64 x i8]* %text, i64 0, i64 14
  %text_addr_15 = getelementptr [64 x i8]* %text, i64 0, i64 15
  %text_addr_16 = getelementptr [64 x i8]* %text, i64 0, i64 16
  %text_addr_17 = getelementptr [64 x i8]* %text, i64 0, i64 17
  %text_addr_18 = getelementptr [64 x i8]* %text, i64 0, i64 18
  %text_addr_19 = getelementptr [64 x i8]* %text, i64 0, i64 19
  %text_addr_20 = getelementptr [64 x i8]* %text, i64 0, i64 20
  %text_addr_21 = getelementptr [64 x i8]* %text, i64 0, i64 21
  %text_addr_22 = getelementptr [64 x i8]* %text, i64 0, i64 22
  %text_addr_23 = getelementptr [64 x i8]* %text, i64 0, i64 23
  %text_addr_24 = getelementptr [64 x i8]* %text, i64 0, i64 24
  %text_addr_25 = getelementptr [64 x i8]* %text, i64 0, i64 25
  %text_addr_26 = getelementptr [64 x i8]* %text, i64 0, i64 26
  %text_addr_27 = getelementptr [64 x i8]* %text, i64 0, i64 27
  %text_addr_28 = getelementptr [64 x i8]* %text, i64 0, i64 28
  %text_addr_29 = getelementptr [64 x i8]* %text, i64 0, i64 29
  %text_addr_30 = getelementptr [64 x i8]* %text, i64 0, i64 30
  %text_addr_31 = getelementptr [64 x i8]* %text, i64 0, i64 31
  %text_addr_32 = getelementptr [64 x i8]* %text, i64 0, i64 32
  %text_addr_33 = getelementptr [64 x i8]* %text, i64 0, i64 33
  %text_addr_34 = getelementptr [64 x i8]* %text, i64 0, i64 34
  %text_addr_35 = getelementptr [64 x i8]* %text, i64 0, i64 35
  %text_addr_36 = getelementptr [64 x i8]* %text, i64 0, i64 36
  %text_addr_37 = getelementptr [64 x i8]* %text, i64 0, i64 37
  %text_addr_38 = getelementptr [64 x i8]* %text, i64 0, i64 38
  %text_addr_39 = getelementptr [64 x i8]* %text, i64 0, i64 39
  %text_addr_40 = getelementptr [64 x i8]* %text, i64 0, i64 40
  %text_addr_41 = getelementptr [64 x i8]* %text, i64 0, i64 41
  %text_addr_42 = getelementptr [64 x i8]* %text, i64 0, i64 42
  %text_addr_43 = getelementptr [64 x i8]* %text, i64 0, i64 43
  %text_addr_44 = getelementptr [64 x i8]* %text, i64 0, i64 44
  %text_addr_45 = getelementptr [64 x i8]* %text, i64 0, i64 45
  %text_addr_46 = getelementptr [64 x i8]* %text, i64 0, i64 46
  %text_addr_47 = getelementptr [64 x i8]* %text, i64 0, i64 47
  %text_addr_48 = getelementptr [64 x i8]* %text, i64 0, i64 48
  %text_addr_49 = getelementptr [64 x i8]* %text, i64 0, i64 49
  %text_addr_50 = getelementptr [64 x i8]* %text, i64 0, i64 50
  %text_addr_51 = getelementptr [64 x i8]* %text, i64 0, i64 51
  %text_addr_52 = getelementptr [64 x i8]* %text, i64 0, i64 52
  %text_addr_53 = getelementptr [64 x i8]* %text, i64 0, i64 53
  %text_addr_54 = getelementptr [64 x i8]* %text, i64 0, i64 54
  %text_addr_55 = getelementptr [64 x i8]* %text, i64 0, i64 55
  %text_addr_56 = getelementptr [64 x i8]* %text, i64 0, i64 56
  %text_addr_57 = getelementptr [64 x i8]* %text, i64 0, i64 57
  %text_addr_58 = getelementptr [64 x i8]* %text, i64 0, i64 58
  %text_addr_59 = getelementptr [64 x i8]* %text, i64 0, i64 59
  %text_addr_60 = getelementptr [64 x i8]* %text, i64 0, i64 60
  %text_addr_61 = getelementptr [64 x i8]* %text, i64 0, i64 61
  %text_addr_62 = getelementptr [64 x i8]* %text, i64 0, i64 62
  %text_addr_63 = getelementptr [64 x i8]* %text, i64 0, i64 63
  br label %1

; <label>:1                                       ; preds = %6, %0
  %size1 = phi i32 [ %act_reg_Data_in_size_1, %0 ], [ %size, %6 ]
  %i_idx1 = phi i64 [ %i_idx_2, %0 ], [ %i_idx_1, %6 ]
  %o_idx1 = phi i64 [ %o_idx_2, %0 ], [ %o_idx_1, %6 ]
  %tmp = icmp eq i32 %size1, 0
  br i1 %tmp, label %7, label %2

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([10 x i8]* @p_str10) nounwind
  %tmp_3 = call i32 (...)* @_ssdm_op_SpecRegionBegin([10 x i8]* @p_str10)
  %tmp_1 = call i26 @_ssdm_op_PartSelect.i26.i32.i32.i32(i32 %size1, i32 6, i32 31)
  %icmp = icmp eq i26 %tmp_1, 0
  %tmp_2 = trunc i32 %size1 to i7
  %bytes_to_transfer = select i1 %icmp, i7 %tmp_2, i7 -64
  %bytes_to_transfer_ca = zext i7 %bytes_to_transfer to i32
  %sum = add i64 %din_gmem_V_offset_ca, %i_idx1
  %dout_gmem_V_addr = getelementptr i512* %din_gmem_V, i64 %sum
  %dout_gmem_V_load_req = call i1 @_ssdm_op_ReadReq.m_axi.i512P(i512* %dout_gmem_V_addr, i32 1)
  %dout_gmem_V_addr_rea = call i512 @_ssdm_op_Read.m_axi.i512P(i512* %dout_gmem_V_addr)
  %tmp_72 = trunc i512 %dout_gmem_V_addr_rea to i8
  store i8 %tmp_72, i8* %text_addr, align 16
  %tmp_4 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 8, i32 15)
  store i8 %tmp_4, i8* %text_addr_1, align 1
  %tmp_6 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 16, i32 23)
  store i8 %tmp_6, i8* %text_addr_2, align 2
  %tmp_8 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 24, i32 31)
  store i8 %tmp_8, i8* %text_addr_3, align 1
  %tmp_s = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 32, i32 39)
  store i8 %tmp_s, i8* %text_addr_4, align 4
  %tmp_5 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 40, i32 47)
  store i8 %tmp_5, i8* %text_addr_5, align 1
  %tmp_7 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 48, i32 55)
  store i8 %tmp_7, i8* %text_addr_6, align 2
  %tmp_9 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 56, i32 63)
  store i8 %tmp_9, i8* %text_addr_7, align 1
  %tmp_10 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 64, i32 71)
  store i8 %tmp_10, i8* %text_addr_8, align 8
  %tmp_11 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 72, i32 79)
  store i8 %tmp_11, i8* %text_addr_9, align 1
  %tmp_12 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 80, i32 87)
  store i8 %tmp_12, i8* %text_addr_10, align 2
  %tmp_13 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 88, i32 95)
  store i8 %tmp_13, i8* %text_addr_11, align 1
  %tmp_14 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 96, i32 103)
  store i8 %tmp_14, i8* %text_addr_12, align 4
  %tmp_15 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 104, i32 111)
  store i8 %tmp_15, i8* %text_addr_13, align 1
  %tmp_16 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 112, i32 119)
  store i8 %tmp_16, i8* %text_addr_14, align 2
  %tmp_17 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 120, i32 127)
  store i8 %tmp_17, i8* %text_addr_15, align 1
  %tmp_18 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 128, i32 135)
  store i8 %tmp_18, i8* %text_addr_16, align 16
  %tmp_19 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 136, i32 143)
  store i8 %tmp_19, i8* %text_addr_17, align 1
  %tmp_20 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 144, i32 151)
  store i8 %tmp_20, i8* %text_addr_18, align 2
  %tmp_21 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 152, i32 159)
  store i8 %tmp_21, i8* %text_addr_19, align 1
  %tmp_22 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 160, i32 167)
  store i8 %tmp_22, i8* %text_addr_20, align 4
  %tmp_23 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 168, i32 175)
  store i8 %tmp_23, i8* %text_addr_21, align 1
  %tmp_24 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 176, i32 183)
  store i8 %tmp_24, i8* %text_addr_22, align 2
  %tmp_25 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 184, i32 191)
  store i8 %tmp_25, i8* %text_addr_23, align 1
  %tmp_26 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 192, i32 199)
  store i8 %tmp_26, i8* %text_addr_24, align 8
  %tmp_27 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 200, i32 207)
  store i8 %tmp_27, i8* %text_addr_25, align 1
  %tmp_28 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 208, i32 215)
  store i8 %tmp_28, i8* %text_addr_26, align 2
  %tmp_29 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 216, i32 223)
  store i8 %tmp_29, i8* %text_addr_27, align 1
  %tmp_30 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 224, i32 231)
  store i8 %tmp_30, i8* %text_addr_28, align 4
  %tmp_31 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 232, i32 239)
  store i8 %tmp_31, i8* %text_addr_29, align 1
  %tmp_32 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 240, i32 247)
  store i8 %tmp_32, i8* %text_addr_30, align 2
  %tmp_33 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 248, i32 255)
  store i8 %tmp_33, i8* %text_addr_31, align 1
  %tmp_34 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 256, i32 263)
  store i8 %tmp_34, i8* %text_addr_32, align 16
  %tmp_35 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 264, i32 271)
  store i8 %tmp_35, i8* %text_addr_33, align 1
  %tmp_36 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 272, i32 279)
  store i8 %tmp_36, i8* %text_addr_34, align 2
  %tmp_37 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 280, i32 287)
  store i8 %tmp_37, i8* %text_addr_35, align 1
  %tmp_38 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 288, i32 295)
  store i8 %tmp_38, i8* %text_addr_36, align 4
  %tmp_39 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 296, i32 303)
  store i8 %tmp_39, i8* %text_addr_37, align 1
  %tmp_40 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 304, i32 311)
  store i8 %tmp_40, i8* %text_addr_38, align 2
  %tmp_41 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 312, i32 319)
  store i8 %tmp_41, i8* %text_addr_39, align 1
  %tmp_42 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 320, i32 327)
  store i8 %tmp_42, i8* %text_addr_40, align 8
  %tmp_43 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 328, i32 335)
  store i8 %tmp_43, i8* %text_addr_41, align 1
  %tmp_44 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 336, i32 343)
  store i8 %tmp_44, i8* %text_addr_42, align 2
  %tmp_45 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 344, i32 351)
  store i8 %tmp_45, i8* %text_addr_43, align 1
  %tmp_46 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 352, i32 359)
  store i8 %tmp_46, i8* %text_addr_44, align 4
  %tmp_47 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 360, i32 367)
  store i8 %tmp_47, i8* %text_addr_45, align 1
  %tmp_48 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 368, i32 375)
  store i8 %tmp_48, i8* %text_addr_46, align 2
  %tmp_49 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 376, i32 383)
  store i8 %tmp_49, i8* %text_addr_47, align 1
  %tmp_50 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 384, i32 391)
  store i8 %tmp_50, i8* %text_addr_48, align 16
  %tmp_51 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 392, i32 399)
  store i8 %tmp_51, i8* %text_addr_49, align 1
  %tmp_52 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 400, i32 407)
  store i8 %tmp_52, i8* %text_addr_50, align 2
  %tmp_53 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 408, i32 415)
  store i8 %tmp_53, i8* %text_addr_51, align 1
  %tmp_54 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 416, i32 423)
  store i8 %tmp_54, i8* %text_addr_52, align 4
  %tmp_55 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 424, i32 431)
  store i8 %tmp_55, i8* %text_addr_53, align 1
  %tmp_56 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 432, i32 439)
  store i8 %tmp_56, i8* %text_addr_54, align 2
  %tmp_57 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 440, i32 447)
  store i8 %tmp_57, i8* %text_addr_55, align 1
  %tmp_58 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 448, i32 455)
  store i8 %tmp_58, i8* %text_addr_56, align 8
  %tmp_59 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 456, i32 463)
  store i8 %tmp_59, i8* %text_addr_57, align 1
  %tmp_60 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 464, i32 471)
  store i8 %tmp_60, i8* %text_addr_58, align 2
  %tmp_61 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 472, i32 479)
  store i8 %tmp_61, i8* %text_addr_59, align 1
  %tmp_62 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 480, i32 487)
  store i8 %tmp_62, i8* %text_addr_60, align 4
  %tmp_63 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 488, i32 495)
  store i8 %tmp_63, i8* %text_addr_61, align 1
  %tmp_64 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 496, i32 503)
  store i8 %tmp_64, i8* %text_addr_62, align 2
  %tmp_65 = call i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512 %dout_gmem_V_addr_rea, i32 504, i32 511)
  store i8 %tmp_65, i8* %text_addr_63, align 1
  br label %3

; <label>:3                                       ; preds = %._crit_edge, %2
  %i = phi i7 [ 0, %2 ], [ %i_1, %._crit_edge ]
  %tmp_66 = icmp eq i7 %i, -64
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64)
  %i_1 = add i7 %i, 1
  br i1 %tmp_66, label %6, label %4

; <label>:4                                       ; preds = %3
  call void (...)* @_ssdm_op_SpecLoopName([21 x i8]* @p_str11) nounwind
  %tmp_68 = zext i7 %i to i64
  %text_addr_64 = getelementptr inbounds [64 x i8]* %text, i64 0, i64 %tmp_68
  %text_load_64 = load i8* %text_addr_64, align 1
  %tmp_69 = icmp sgt i8 %text_load_64, 96
  %tmp_70 = icmp slt i8 %text_load_64, 123
  %or_cond = and i1 %tmp_69, %tmp_70
  br i1 %or_cond, label %5, label %._crit_edge

; <label>:5                                       ; preds = %4
  %tmp_71 = add i8 %text_load_64, -32
  store i8 %tmp_71, i8* %text_addr_64, align 1
  br label %._crit_edge

._crit_edge:                                      ; preds = %5, %4
  br label %3

; <label>:6                                       ; preds = %3
  %sum3 = add i64 %o_idx1, %dout_gmem_V_offset_c
  %dout_gmem_V_addr_1 = getelementptr i512* %din_gmem_V, i64 %sum3
  %text_load = load i8* %text_addr, align 16
  %text_load_1 = load i8* %text_addr_1, align 1
  %text_load_2 = load i8* %text_addr_2, align 2
  %text_load_3 = load i8* %text_addr_3, align 1
  %text_load_4 = load i8* %text_addr_4, align 4
  %text_load_5 = load i8* %text_addr_5, align 1
  %text_load_6 = load i8* %text_addr_6, align 2
  %text_load_7 = load i8* %text_addr_7, align 1
  %text_load_8 = load i8* %text_addr_8, align 8
  %text_load_9 = load i8* %text_addr_9, align 1
  %text_load_10 = load i8* %text_addr_10, align 2
  %text_load_11 = load i8* %text_addr_11, align 1
  %text_load_12 = load i8* %text_addr_12, align 4
  %text_load_13 = load i8* %text_addr_13, align 1
  %text_load_14 = load i8* %text_addr_14, align 2
  %text_load_15 = load i8* %text_addr_15, align 1
  %text_load_16 = load i8* %text_addr_16, align 16
  %text_load_17 = load i8* %text_addr_17, align 1
  %text_load_18 = load i8* %text_addr_18, align 2
  %text_load_19 = load i8* %text_addr_19, align 1
  %text_load_20 = load i8* %text_addr_20, align 4
  %text_load_21 = load i8* %text_addr_21, align 1
  %text_load_22 = load i8* %text_addr_22, align 2
  %text_load_23 = load i8* %text_addr_23, align 1
  %text_load_24 = load i8* %text_addr_24, align 8
  %text_load_25 = load i8* %text_addr_25, align 1
  %text_load_26 = load i8* %text_addr_26, align 2
  %text_load_27 = load i8* %text_addr_27, align 1
  %text_load_28 = load i8* %text_addr_28, align 4
  %text_load_29 = load i8* %text_addr_29, align 1
  %text_load_30 = load i8* %text_addr_30, align 2
  %text_load_31 = load i8* %text_addr_31, align 1
  %text_load_32 = load i8* %text_addr_32, align 16
  %text_load_33 = load i8* %text_addr_33, align 1
  %text_load_34 = load i8* %text_addr_34, align 2
  %text_load_35 = load i8* %text_addr_35, align 1
  %text_load_36 = load i8* %text_addr_36, align 4
  %text_load_37 = load i8* %text_addr_37, align 1
  %text_load_38 = load i8* %text_addr_38, align 2
  %text_load_39 = load i8* %text_addr_39, align 1
  %text_load_40 = load i8* %text_addr_40, align 8
  %text_load_41 = load i8* %text_addr_41, align 1
  %text_load_42 = load i8* %text_addr_42, align 2
  %text_load_43 = load i8* %text_addr_43, align 1
  %text_load_44 = load i8* %text_addr_44, align 4
  %text_load_45 = load i8* %text_addr_45, align 1
  %text_load_46 = load i8* %text_addr_46, align 2
  %text_load_47 = load i8* %text_addr_47, align 1
  %text_load_48 = load i8* %text_addr_48, align 16
  %text_load_49 = load i8* %text_addr_49, align 1
  %text_load_50 = load i8* %text_addr_50, align 2
  %text_load_51 = load i8* %text_addr_51, align 1
  %text_load_52 = load i8* %text_addr_52, align 4
  %text_load_53 = load i8* %text_addr_53, align 1
  %text_load_54 = load i8* %text_addr_54, align 2
  %text_load_55 = load i8* %text_addr_55, align 1
  %text_load_56 = load i8* %text_addr_56, align 8
  %text_load_57 = load i8* %text_addr_57, align 1
  %text_load_58 = load i8* %text_addr_58, align 2
  %text_load_59 = load i8* %text_addr_59, align 1
  %text_load_60 = load i8* %text_addr_60, align 4
  %text_load_61 = load i8* %text_addr_61, align 1
  %text_load_62 = load i8* %text_addr_62, align 2
  %text_load_63 = load i8* %text_addr_63, align 1
  %tmp_67 = call i512 @_ssdm_op_BitConcatenate.i512.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8(i8 %text_load_63, i8 %text_load_62, i8 %text_load_61, i8 %text_load_60, i8 %text_load_59, i8 %text_load_58, i8 %text_load_57, i8 %text_load_56, i8 %text_load_55, i8 %text_load_54, i8 %text_load_53, i8 %text_load_52, i8 %text_load_51, i8 %text_load_50, i8 %text_load_49, i8 %text_load_48, i8 %text_load_47, i8 %text_load_46, i8 %text_load_45, i8 %text_load_44, i8 %text_load_43, i8 %text_load_42, i8 %text_load_41, i8 %text_load_40, i8 %text_load_39, i8 %text_load_38, i8 %text_load_37, i8 %text_load_36, i8 %text_load_35, i8 %text_load_34, i8 %text_load_33, i8 %text_load_32, i8 %text_load_31, i8 %text_load_30, i8 %text_load_29, i8 %text_load_28, i8 %text_load_27, i8 %text_load_26, i8 %text_load_25, i8 %text_load_24, i8 %text_load_23, i8 %text_load_22, i8 %text_load_21, i8 %text_load_20, i8 %text_load_19, i8 %text_load_18, i8 %text_load_17, i8 %text_load_16, i8 %text_load_15, i8 %text_load_14, i8 %text_load_13, i8 %text_load_12, i8 %text_load_11, i8 %text_load_10, i8 %text_load_9, i8 %text_load_8, i8 %text_load_7, i8 %text_load_6, i8 %text_load_5, i8 %text_load_4, i8 %text_load_3, i8 %text_load_2, i8 %text_load_1, i8 %text_load)
  %dout_gmem_V_addr_1_r = call i1 @_ssdm_op_WriteReq.m_axi.i512P(i512* %dout_gmem_V_addr_1, i32 1)
  call void @_ssdm_op_Write.m_axi.i512P(i512* %dout_gmem_V_addr_1, i512 %tmp_67, i64 -1)
  %dout_gmem_V_addr_1_r_1 = call i1 @_ssdm_op_WriteResp.m_axi.i512P(i512* %dout_gmem_V_addr_1)
  %size = sub i32 %size1, %bytes_to_transfer_ca
  %i_idx_1 = add i64 %i_idx1, 1
  %o_idx_1 = add i64 %o_idx1, 1
  %empty_14 = call i32 (...)* @_ssdm_op_SpecRegionEnd([10 x i8]* @p_str10, i32 %tmp_3)
  br label %1

; <label>:7                                       ; preds = %1
  ret void
}

declare i992 @llvm.part.set.i992.i32(i992, i32, i32, i32) nounwind readnone

declare i992 @llvm.part.select.i992(i992, i32, i32) nounwind readnone

declare i64 @llvm.part.select.i64(i64, i32, i32) nounwind readnone

declare i512 @llvm.part.select.i512(i512, i32, i32) nounwind readnone

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define void @hls_action(i512* %host_mem, i64 %din_gmem_V, i64 %dout_gmem_V, i992* %act_reg, i64* %Action_Config) {
  %dout_gmem_V_read = call i64 @_ssdm_op_Read.s_axilite.i64(i64 %dout_gmem_V)
  %din_gmem_V_read = call i64 @_ssdm_op_Read.s_axilite.i64(i64 %din_gmem_V)
  %dout_gmem_V3 = call i58 @_ssdm_op_PartSelect.i58.i64.i32.i32(i64 %dout_gmem_V_read, i32 6, i32 63)
  %din_gmem_V1 = call i58 @_ssdm_op_PartSelect.i58.i64.i32.i32(i64 %din_gmem_V_read, i32 6, i32 63)
  call void (...)* @_ssdm_op_SpecBitsMap(i512* %host_mem), !map !38
  call void (...)* @_ssdm_op_SpecBitsMap(i64* %Action_Config), !map !45
  call void (...)* @_ssdm_op_SpecBitsMap(i992* %act_reg), !map !52
  call void (...)* @_ssdm_op_SpecTopModule([11 x i8]* @hls_action_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i512* %host_mem, [6 x i8]* @p_str, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 512, [9 x i8]* @p_str2, [6 x i8]* @p_str3, [1 x i8]* @p_str1, i32 16, i32 16, i32 64, i32 64, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i64 %din_gmem_V, [10 x i8]* @p_str4, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str5, [6 x i8]* @p_str6, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i64 %dout_gmem_V, [10 x i8]* @p_str4, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str5, [6 x i8]* @p_str7, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i64* %Action_Config, [10 x i8]* @p_str4, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str5, [6 x i8]* @p_str8, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i992* %act_reg, [10 x i8]* @p_str4, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str5, [6 x i8]* @p_str9, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str4, i32 0, i32 0, [1 x i8]* @p_str1, i32 0, i32 0, [9 x i8]* @p_str5, [1 x i8]* @p_str1, [1 x i8]* @p_str1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %act_reg_read = call i992 @_ssdm_op_Read.s_axilite.i992P(i992* %act_reg)
  %act_reg_Control_flag = call i8 @_ssdm_op_PartSelect.i8.i992.i32.i32(i992 %act_reg_read, i32 8, i32 15)
  %cond = icmp eq i8 %act_reg_Control_flag, 0
  br i1 %cond, label %1, label %2

; <label>:1                                       ; preds = %0
  call void @_ssdm_op_Write.s_axilite.i64P(i64* %Action_Config, i64 146298638344)
  br label %3

; <label>:2                                       ; preds = %0
  %act_reg_Data_in_addr = call i64 @_ssdm_op_PartSelect.i64.i992.i32.i32(i992 %act_reg_read, i32 128, i32 191)
  %act_reg_Data_in_size = call i32 @_ssdm_op_PartSelect.i32.i992.i32.i32(i992 %act_reg_read, i32 192, i32 223)
  %act_reg_Data_out_add = call i64 @_ssdm_op_PartSelect.i64.i992.i32.i32(i992 %act_reg_read, i32 256, i32 319)
  call fastcc void @process_action(i512* %host_mem, i58 %din_gmem_V1, i58 %dout_gmem_V3, i64 %act_reg_Data_in_addr, i32 %act_reg_Data_in_size, i64 %act_reg_Data_out_add)
  br label %3

; <label>:3                                       ; preds = %2, %1
  %storemerge = phi i14 [ 258, %2 ], [ -8177, %1 ]
  %storemerge_cast1 = sext i14 %storemerge to i16
  %storemerge_cast = zext i16 %storemerge_cast1 to i32
  %act_reg_read_1 = call i992 @_ssdm_op_Read.s_axilite.i992P(i992* %act_reg)
  %act_reg11_part_set = call i992 @llvm.part.set.i992.i32(i992 %act_reg_read_1, i32 %storemerge_cast, i32 32, i32 63)
  call void @_ssdm_op_Write.s_axilite.i992P(i992* %act_reg, i992 %act_reg11_part_set)
  ret void
}

define weak i1 @_ssdm_op_WriteResp.m_axi.i512P(i512*) {
entry:
  ret i1 true
}

define weak i1 @_ssdm_op_WriteReq.m_axi.i512P(i512*, i32) {
entry:
  ret i1 true
}

define weak void @_ssdm_op_Write.s_axilite.i992P(i992*, i992) {
entry:
  store i992 %1, i992* %0
  ret void
}

define weak void @_ssdm_op_Write.s_axilite.i64P(i64*, i64) {
entry:
  store i64 %1, i64* %0
  ret void
}

define weak void @_ssdm_op_Write.m_axi.i512P(i512*, i512, i64) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i1 @_ssdm_op_ReadReq.m_axi.i512P(i512*, i32) {
entry:
  ret i1 true
}

define weak i992 @_ssdm_op_Read.s_axilite.i992P(i992*) {
entry:
  %empty = load i992* %0
  ret i992 %empty
}

define weak i64 @_ssdm_op_Read.s_axilite.i64(i64) {
entry:
  ret i64 %0
}

define weak i512 @_ssdm_op_Read.m_axi.i512P(i512*) {
entry:
  %empty = load i512* %0
  ret i512 %empty
}

define weak i64 @_ssdm_op_Read.ap_auto.i64(i64) {
entry:
  ret i64 %0
}

define weak i58 @_ssdm_op_Read.ap_auto.i58(i58) {
entry:
  ret i58 %0
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

define weak i8 @_ssdm_op_PartSelect.i8.i992.i32.i32(i992, i32, i32) nounwind readnone {
entry:
  %empty = call i992 @llvm.part.select.i992(i992 %0, i32 %1, i32 %2)
  %empty_15 = trunc i992 %empty to i8
  ret i8 %empty_15
}

define weak i8 @_ssdm_op_PartSelect.i8.i512.i32.i32(i512, i32, i32) nounwind readnone {
entry:
  %empty = call i512 @llvm.part.select.i512(i512 %0, i32 %1, i32 %2)
  %empty_16 = trunc i512 %empty to i8
  ret i8 %empty_16
}

declare i7 @_ssdm_op_PartSelect.i7.i32.i32.i32(i32, i32, i32) nounwind readnone

define weak i64 @_ssdm_op_PartSelect.i64.i992.i32.i32(i992, i32, i32) nounwind readnone {
entry:
  %empty = call i992 @llvm.part.select.i992(i992 %0, i32 %1, i32 %2)
  %empty_17 = trunc i992 %empty to i64
  ret i64 %empty_17
}

define weak i58 @_ssdm_op_PartSelect.i58.i64.i32.i32(i64, i32, i32) nounwind readnone {
entry:
  %empty = call i64 @llvm.part.select.i64(i64 %0, i32 %1, i32 %2)
  %empty_18 = trunc i64 %empty to i58
  ret i58 %empty_18
}

define weak i32 @_ssdm_op_PartSelect.i32.i992.i32.i32(i992, i32, i32) nounwind readnone {
entry:
  %empty = call i992 @llvm.part.select.i992(i992 %0, i32 %1, i32 %2)
  %empty_19 = trunc i992 %empty to i32
  ret i32 %empty_19
}

define weak i26 @_ssdm_op_PartSelect.i26.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_20 = trunc i32 %empty to i26
  ret i26 %empty_20
}

define weak i512 @_ssdm_op_BitConcatenate.i512.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8.i8(i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8) nounwind readnone {
entry:
  %empty = zext i8 %62 to i16
  %empty_21 = zext i8 %63 to i16
  %empty_22 = shl i16 %empty, 8
  %empty_23 = or i16 %empty_22, %empty_21
  %empty_24 = zext i8 %61 to i24
  %empty_25 = zext i16 %empty_23 to i24
  %empty_26 = shl i24 %empty_24, 16
  %empty_27 = or i24 %empty_26, %empty_25
  %empty_28 = zext i8 %60 to i32
  %empty_29 = zext i24 %empty_27 to i32
  %empty_30 = shl i32 %empty_28, 24
  %empty_31 = or i32 %empty_30, %empty_29
  %empty_32 = zext i8 %59 to i40
  %empty_33 = zext i32 %empty_31 to i40
  %empty_34 = shl i40 %empty_32, 32
  %empty_35 = or i40 %empty_34, %empty_33
  %empty_36 = zext i8 %58 to i48
  %empty_37 = zext i40 %empty_35 to i48
  %empty_38 = shl i48 %empty_36, 40
  %empty_39 = or i48 %empty_38, %empty_37
  %empty_40 = zext i8 %57 to i56
  %empty_41 = zext i48 %empty_39 to i56
  %empty_42 = shl i56 %empty_40, 48
  %empty_43 = or i56 %empty_42, %empty_41
  %empty_44 = zext i8 %56 to i64
  %empty_45 = zext i56 %empty_43 to i64
  %empty_46 = shl i64 %empty_44, 56
  %empty_47 = or i64 %empty_46, %empty_45
  %empty_48 = zext i8 %55 to i72
  %empty_49 = zext i64 %empty_47 to i72
  %empty_50 = shl i72 %empty_48, 64
  %empty_51 = or i72 %empty_50, %empty_49
  %empty_52 = zext i8 %54 to i80
  %empty_53 = zext i72 %empty_51 to i80
  %empty_54 = shl i80 %empty_52, 72
  %empty_55 = or i80 %empty_54, %empty_53
  %empty_56 = zext i8 %53 to i88
  %empty_57 = zext i80 %empty_55 to i88
  %empty_58 = shl i88 %empty_56, 80
  %empty_59 = or i88 %empty_58, %empty_57
  %empty_60 = zext i8 %52 to i96
  %empty_61 = zext i88 %empty_59 to i96
  %empty_62 = shl i96 %empty_60, 88
  %empty_63 = or i96 %empty_62, %empty_61
  %empty_64 = zext i8 %51 to i104
  %empty_65 = zext i96 %empty_63 to i104
  %empty_66 = shl i104 %empty_64, 96
  %empty_67 = or i104 %empty_66, %empty_65
  %empty_68 = zext i8 %50 to i112
  %empty_69 = zext i104 %empty_67 to i112
  %empty_70 = shl i112 %empty_68, 104
  %empty_71 = or i112 %empty_70, %empty_69
  %empty_72 = zext i8 %49 to i120
  %empty_73 = zext i112 %empty_71 to i120
  %empty_74 = shl i120 %empty_72, 112
  %empty_75 = or i120 %empty_74, %empty_73
  %empty_76 = zext i8 %48 to i128
  %empty_77 = zext i120 %empty_75 to i128
  %empty_78 = shl i128 %empty_76, 120
  %empty_79 = or i128 %empty_78, %empty_77
  %empty_80 = zext i8 %47 to i136
  %empty_81 = zext i128 %empty_79 to i136
  %empty_82 = shl i136 %empty_80, 128
  %empty_83 = or i136 %empty_82, %empty_81
  %empty_84 = zext i8 %46 to i144
  %empty_85 = zext i136 %empty_83 to i144
  %empty_86 = shl i144 %empty_84, 136
  %empty_87 = or i144 %empty_86, %empty_85
  %empty_88 = zext i8 %45 to i152
  %empty_89 = zext i144 %empty_87 to i152
  %empty_90 = shl i152 %empty_88, 144
  %empty_91 = or i152 %empty_90, %empty_89
  %empty_92 = zext i8 %44 to i160
  %empty_93 = zext i152 %empty_91 to i160
  %empty_94 = shl i160 %empty_92, 152
  %empty_95 = or i160 %empty_94, %empty_93
  %empty_96 = zext i8 %43 to i168
  %empty_97 = zext i160 %empty_95 to i168
  %empty_98 = shl i168 %empty_96, 160
  %empty_99 = or i168 %empty_98, %empty_97
  %empty_100 = zext i8 %42 to i176
  %empty_101 = zext i168 %empty_99 to i176
  %empty_102 = shl i176 %empty_100, 168
  %empty_103 = or i176 %empty_102, %empty_101
  %empty_104 = zext i8 %41 to i184
  %empty_105 = zext i176 %empty_103 to i184
  %empty_106 = shl i184 %empty_104, 176
  %empty_107 = or i184 %empty_106, %empty_105
  %empty_108 = zext i8 %40 to i192
  %empty_109 = zext i184 %empty_107 to i192
  %empty_110 = shl i192 %empty_108, 184
  %empty_111 = or i192 %empty_110, %empty_109
  %empty_112 = zext i8 %39 to i200
  %empty_113 = zext i192 %empty_111 to i200
  %empty_114 = shl i200 %empty_112, 192
  %empty_115 = or i200 %empty_114, %empty_113
  %empty_116 = zext i8 %38 to i208
  %empty_117 = zext i200 %empty_115 to i208
  %empty_118 = shl i208 %empty_116, 200
  %empty_119 = or i208 %empty_118, %empty_117
  %empty_120 = zext i8 %37 to i216
  %empty_121 = zext i208 %empty_119 to i216
  %empty_122 = shl i216 %empty_120, 208
  %empty_123 = or i216 %empty_122, %empty_121
  %empty_124 = zext i8 %36 to i224
  %empty_125 = zext i216 %empty_123 to i224
  %empty_126 = shl i224 %empty_124, 216
  %empty_127 = or i224 %empty_126, %empty_125
  %empty_128 = zext i8 %35 to i232
  %empty_129 = zext i224 %empty_127 to i232
  %empty_130 = shl i232 %empty_128, 224
  %empty_131 = or i232 %empty_130, %empty_129
  %empty_132 = zext i8 %34 to i240
  %empty_133 = zext i232 %empty_131 to i240
  %empty_134 = shl i240 %empty_132, 232
  %empty_135 = or i240 %empty_134, %empty_133
  %empty_136 = zext i8 %33 to i248
  %empty_137 = zext i240 %empty_135 to i248
  %empty_138 = shl i248 %empty_136, 240
  %empty_139 = or i248 %empty_138, %empty_137
  %empty_140 = zext i8 %32 to i256
  %empty_141 = zext i248 %empty_139 to i256
  %empty_142 = shl i256 %empty_140, 248
  %empty_143 = or i256 %empty_142, %empty_141
  %empty_144 = zext i8 %31 to i264
  %empty_145 = zext i256 %empty_143 to i264
  %empty_146 = shl i264 %empty_144, 256
  %empty_147 = or i264 %empty_146, %empty_145
  %empty_148 = zext i8 %30 to i272
  %empty_149 = zext i264 %empty_147 to i272
  %empty_150 = shl i272 %empty_148, 264
  %empty_151 = or i272 %empty_150, %empty_149
  %empty_152 = zext i8 %29 to i280
  %empty_153 = zext i272 %empty_151 to i280
  %empty_154 = shl i280 %empty_152, 272
  %empty_155 = or i280 %empty_154, %empty_153
  %empty_156 = zext i8 %28 to i288
  %empty_157 = zext i280 %empty_155 to i288
  %empty_158 = shl i288 %empty_156, 280
  %empty_159 = or i288 %empty_158, %empty_157
  %empty_160 = zext i8 %27 to i296
  %empty_161 = zext i288 %empty_159 to i296
  %empty_162 = shl i296 %empty_160, 288
  %empty_163 = or i296 %empty_162, %empty_161
  %empty_164 = zext i8 %26 to i304
  %empty_165 = zext i296 %empty_163 to i304
  %empty_166 = shl i304 %empty_164, 296
  %empty_167 = or i304 %empty_166, %empty_165
  %empty_168 = zext i8 %25 to i312
  %empty_169 = zext i304 %empty_167 to i312
  %empty_170 = shl i312 %empty_168, 304
  %empty_171 = or i312 %empty_170, %empty_169
  %empty_172 = zext i8 %24 to i320
  %empty_173 = zext i312 %empty_171 to i320
  %empty_174 = shl i320 %empty_172, 312
  %empty_175 = or i320 %empty_174, %empty_173
  %empty_176 = zext i8 %23 to i328
  %empty_177 = zext i320 %empty_175 to i328
  %empty_178 = shl i328 %empty_176, 320
  %empty_179 = or i328 %empty_178, %empty_177
  %empty_180 = zext i8 %22 to i336
  %empty_181 = zext i328 %empty_179 to i336
  %empty_182 = shl i336 %empty_180, 328
  %empty_183 = or i336 %empty_182, %empty_181
  %empty_184 = zext i8 %21 to i344
  %empty_185 = zext i336 %empty_183 to i344
  %empty_186 = shl i344 %empty_184, 336
  %empty_187 = or i344 %empty_186, %empty_185
  %empty_188 = zext i8 %20 to i352
  %empty_189 = zext i344 %empty_187 to i352
  %empty_190 = shl i352 %empty_188, 344
  %empty_191 = or i352 %empty_190, %empty_189
  %empty_192 = zext i8 %19 to i360
  %empty_193 = zext i352 %empty_191 to i360
  %empty_194 = shl i360 %empty_192, 352
  %empty_195 = or i360 %empty_194, %empty_193
  %empty_196 = zext i8 %18 to i368
  %empty_197 = zext i360 %empty_195 to i368
  %empty_198 = shl i368 %empty_196, 360
  %empty_199 = or i368 %empty_198, %empty_197
  %empty_200 = zext i8 %17 to i376
  %empty_201 = zext i368 %empty_199 to i376
  %empty_202 = shl i376 %empty_200, 368
  %empty_203 = or i376 %empty_202, %empty_201
  %empty_204 = zext i8 %16 to i384
  %empty_205 = zext i376 %empty_203 to i384
  %empty_206 = shl i384 %empty_204, 376
  %empty_207 = or i384 %empty_206, %empty_205
  %empty_208 = zext i8 %15 to i392
  %empty_209 = zext i384 %empty_207 to i392
  %empty_210 = shl i392 %empty_208, 384
  %empty_211 = or i392 %empty_210, %empty_209
  %empty_212 = zext i8 %14 to i400
  %empty_213 = zext i392 %empty_211 to i400
  %empty_214 = shl i400 %empty_212, 392
  %empty_215 = or i400 %empty_214, %empty_213
  %empty_216 = zext i8 %13 to i408
  %empty_217 = zext i400 %empty_215 to i408
  %empty_218 = shl i408 %empty_216, 400
  %empty_219 = or i408 %empty_218, %empty_217
  %empty_220 = zext i8 %12 to i416
  %empty_221 = zext i408 %empty_219 to i416
  %empty_222 = shl i416 %empty_220, 408
  %empty_223 = or i416 %empty_222, %empty_221
  %empty_224 = zext i8 %11 to i424
  %empty_225 = zext i416 %empty_223 to i424
  %empty_226 = shl i424 %empty_224, 416
  %empty_227 = or i424 %empty_226, %empty_225
  %empty_228 = zext i8 %10 to i432
  %empty_229 = zext i424 %empty_227 to i432
  %empty_230 = shl i432 %empty_228, 424
  %empty_231 = or i432 %empty_230, %empty_229
  %empty_232 = zext i8 %9 to i440
  %empty_233 = zext i432 %empty_231 to i440
  %empty_234 = shl i440 %empty_232, 432
  %empty_235 = or i440 %empty_234, %empty_233
  %empty_236 = zext i8 %8 to i448
  %empty_237 = zext i440 %empty_235 to i448
  %empty_238 = shl i448 %empty_236, 440
  %empty_239 = or i448 %empty_238, %empty_237
  %empty_240 = zext i8 %7 to i456
  %empty_241 = zext i448 %empty_239 to i456
  %empty_242 = shl i456 %empty_240, 448
  %empty_243 = or i456 %empty_242, %empty_241
  %empty_244 = zext i8 %6 to i464
  %empty_245 = zext i456 %empty_243 to i464
  %empty_246 = shl i464 %empty_244, 456
  %empty_247 = or i464 %empty_246, %empty_245
  %empty_248 = zext i8 %5 to i472
  %empty_249 = zext i464 %empty_247 to i472
  %empty_250 = shl i472 %empty_248, 464
  %empty_251 = or i472 %empty_250, %empty_249
  %empty_252 = zext i8 %4 to i480
  %empty_253 = zext i472 %empty_251 to i480
  %empty_254 = shl i480 %empty_252, 472
  %empty_255 = or i480 %empty_254, %empty_253
  %empty_256 = zext i8 %3 to i488
  %empty_257 = zext i480 %empty_255 to i488
  %empty_258 = shl i488 %empty_256, 480
  %empty_259 = or i488 %empty_258, %empty_257
  %empty_260 = zext i8 %2 to i496
  %empty_261 = zext i488 %empty_259 to i496
  %empty_262 = shl i496 %empty_260, 488
  %empty_263 = or i496 %empty_262, %empty_261
  %empty_264 = zext i8 %1 to i504
  %empty_265 = zext i496 %empty_263 to i504
  %empty_266 = shl i504 %empty_264, 496
  %empty_267 = or i504 %empty_266, %empty_265
  %empty_268 = zext i8 %0 to i512
  %empty_269 = zext i504 %empty_267 to i512
  %empty_270 = shl i512 %empty_268, 504
  %empty_271 = or i512 %empty_270, %empty_269
  ret i512 %empty_271
}

!opencl.kernels = !{!0, !7, !13, !13, !7, !7, !19, !22}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!28}
!axi4.master.portmap = !{!35}
!axi4.slave.bundlemap = !{!36, !37}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 1, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"snap_membus_t*", metadata !"snap_membus_t*", metadata !"action_reg*", metadata !"action_RO_config_reg*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"din_gmem", metadata !"dout_gmem", metadata !"act_reg", metadata !"Action_Config"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space"}
!9 = metadata !{metadata !"kernel_arg_access_qual"}
!10 = metadata !{metadata !"kernel_arg_type"}
!11 = metadata !{metadata !"kernel_arg_type_qual"}
!12 = metadata !{metadata !"kernel_arg_name"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!19 = metadata !{null, metadata !14, metadata !15, metadata !20, metadata !17, metadata !21, metadata !6}
!20 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<32> &"}
!21 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!22 = metadata !{null, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !6}
!23 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 1}
!24 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!25 = metadata !{metadata !"kernel_arg_type", metadata !"snap_membus_t*", metadata !"snap_membus_t*", metadata !"action_reg*"}
!26 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!27 = metadata !{metadata !"kernel_arg_name", metadata !"din_gmem", metadata !"dout_gmem", metadata !"act_reg"}
!28 = metadata !{metadata !29, [0 x i32]* @llvm_global_ctors_0}
!29 = metadata !{metadata !30}
!30 = metadata !{i32 0, i32 31, metadata !31}
!31 = metadata !{metadata !32}
!32 = metadata !{metadata !"llvm.global_ctors.0", metadata !33, metadata !"", i32 0, i32 31}
!33 = metadata !{metadata !34}
!34 = metadata !{i32 0, i32 0, i32 1}
!35 = metadata !{metadata !"host_mem", metadata !"din_gmem.V", metadata !"READONLY", metadata !"dout_gmem.V", metadata !"WRITEONLY"}
!36 = metadata !{metadata !"din_gmem.V", metadata !"ctrl_reg"}
!37 = metadata !{metadata !"dout_gmem.V", metadata !"ctrl_reg"}
!38 = metadata !{metadata !39}
!39 = metadata !{i32 0, i32 511, metadata !40}
!40 = metadata !{metadata !41, metadata !44}
!41 = metadata !{metadata !"din_gmem.V", metadata !42, metadata !"uint512", i32 0, i32 511}
!42 = metadata !{metadata !43}
!43 = metadata !{i32 0, i32 511, i32 1}
!44 = metadata !{metadata !"dout_gmem.V", metadata !42, metadata !"uint512", i32 0, i32 511}
!45 = metadata !{metadata !46, metadata !49}
!46 = metadata !{i32 0, i32 31, metadata !47}
!47 = metadata !{metadata !48}
!48 = metadata !{metadata !"Action_Config.action_type.V", metadata !33, metadata !"uint32", i32 0, i32 31}
!49 = metadata !{i32 32, i32 63, metadata !50}
!50 = metadata !{metadata !51}
!51 = metadata !{metadata !"Action_Config.release_level.V", metadata !33, metadata !"uint32", i32 0, i32 31}
!52 = metadata !{metadata !53, metadata !56, metadata !59, metadata !62, metadata !65, metadata !68, metadata !71, metadata !74, metadata !77, metadata !80, metadata !83, metadata !86, metadata !89, metadata !92, metadata !97, metadata !102, metadata !107, metadata !112, metadata !117, metadata !122, metadata !127, metadata !132, metadata !137, metadata !142, metadata !147, metadata !152, metadata !157, metadata !162, metadata !167, metadata !172, metadata !177, metadata !182, metadata !187, metadata !192, metadata !197, metadata !202, metadata !207, metadata !212, metadata !217, metadata !222, metadata !227, metadata !232, metadata !237, metadata !242, metadata !247, metadata !252, metadata !257, metadata !262, metadata !267, metadata !272, metadata !277, metadata !282, metadata !287, metadata !292, metadata !297, metadata !302, metadata !307, metadata !312, metadata !317, metadata !322, metadata !327, metadata !332, metadata !337, metadata !342, metadata !347, metadata !352, metadata !357, metadata !362, metadata !367, metadata !372, metadata !377, metadata !382, metadata !387, metadata !392, metadata !397, metadata !402, metadata !407, metadata !412, metadata !417, metadata !422, metadata !427, metadata !432, metadata !437, metadata !442, metadata !447, metadata !452, metadata !457, metadata !462, metadata !467}
!53 = metadata !{i32 0, i32 7, metadata !54}
!54 = metadata !{metadata !55}
!55 = metadata !{metadata !"act_reg.Control.sat.V", metadata !33, metadata !"uint8", i32 0, i32 7}
!56 = metadata !{i32 8, i32 15, metadata !57}
!57 = metadata !{metadata !58}
!58 = metadata !{metadata !"act_reg.Control.flags.V", metadata !33, metadata !"uint8", i32 0, i32 7}
!59 = metadata !{i32 16, i32 31, metadata !60}
!60 = metadata !{metadata !61}
!61 = metadata !{metadata !"act_reg.Control.seq.V", metadata !33, metadata !"uint16", i32 0, i32 15}
!62 = metadata !{i32 32, i32 63, metadata !63}
!63 = metadata !{metadata !64}
!64 = metadata !{metadata !"act_reg.Control.Retc.V", metadata !33, metadata !"uint32", i32 0, i32 31}
!65 = metadata !{i32 64, i32 127, metadata !66}
!66 = metadata !{metadata !67}
!67 = metadata !{metadata !"act_reg.Control.Reserved.V", metadata !33, metadata !"uint64", i32 0, i32 63}
!68 = metadata !{i32 128, i32 191, metadata !69}
!69 = metadata !{metadata !70}
!70 = metadata !{metadata !"act_reg.Data.in.addr", metadata !33, metadata !"long unsigned int", i32 0, i32 63}
!71 = metadata !{i32 192, i32 223, metadata !72}
!72 = metadata !{metadata !73}
!73 = metadata !{metadata !"act_reg.Data.in.size", metadata !33, metadata !"unsigned int", i32 0, i32 31}
!74 = metadata !{i32 224, i32 239, metadata !75}
!75 = metadata !{metadata !76}
!76 = metadata !{metadata !"act_reg.Data.in.type", metadata !33, metadata !"unsigned short", i32 0, i32 15}
!77 = metadata !{i32 240, i32 255, metadata !78}
!78 = metadata !{metadata !79}
!79 = metadata !{metadata !"act_reg.Data.in.flags", metadata !33, metadata !"unsigned short", i32 0, i32 15}
!80 = metadata !{i32 256, i32 319, metadata !81}
!81 = metadata !{metadata !82}
!82 = metadata !{metadata !"act_reg.Data.out.addr", metadata !33, metadata !"long unsigned int", i32 0, i32 63}
!83 = metadata !{i32 320, i32 351, metadata !84}
!84 = metadata !{metadata !85}
!85 = metadata !{metadata !"act_reg.Data.out.size", metadata !33, metadata !"unsigned int", i32 0, i32 31}
!86 = metadata !{i32 352, i32 367, metadata !87}
!87 = metadata !{metadata !88}
!88 = metadata !{metadata !"act_reg.Data.out.type", metadata !33, metadata !"unsigned short", i32 0, i32 15}
!89 = metadata !{i32 368, i32 383, metadata !90}
!90 = metadata !{metadata !91}
!91 = metadata !{metadata !"act_reg.Data.out.flags", metadata !33, metadata !"unsigned short", i32 0, i32 15}
!92 = metadata !{i32 384, i32 391, metadata !93}
!93 = metadata !{metadata !94}
!94 = metadata !{metadata !"act_reg.padding", metadata !95, metadata !"unsigned char", i32 0, i32 7}
!95 = metadata !{metadata !96}
!96 = metadata !{i32 0, i32 0, i32 2}
!97 = metadata !{i32 392, i32 399, metadata !98}
!98 = metadata !{metadata !99}
!99 = metadata !{metadata !"act_reg.padding", metadata !100, metadata !"unsigned char", i32 0, i32 7}
!100 = metadata !{metadata !101}
!101 = metadata !{i32 1, i32 1, i32 2}
!102 = metadata !{i32 400, i32 407, metadata !103}
!103 = metadata !{metadata !104}
!104 = metadata !{metadata !"act_reg.padding", metadata !105, metadata !"unsigned char", i32 0, i32 7}
!105 = metadata !{metadata !106}
!106 = metadata !{i32 2, i32 2, i32 2}
!107 = metadata !{i32 408, i32 415, metadata !108}
!108 = metadata !{metadata !109}
!109 = metadata !{metadata !"act_reg.padding", metadata !110, metadata !"unsigned char", i32 0, i32 7}
!110 = metadata !{metadata !111}
!111 = metadata !{i32 3, i32 3, i32 2}
!112 = metadata !{i32 416, i32 423, metadata !113}
!113 = metadata !{metadata !114}
!114 = metadata !{metadata !"act_reg.padding", metadata !115, metadata !"unsigned char", i32 0, i32 7}
!115 = metadata !{metadata !116}
!116 = metadata !{i32 4, i32 4, i32 2}
!117 = metadata !{i32 424, i32 431, metadata !118}
!118 = metadata !{metadata !119}
!119 = metadata !{metadata !"act_reg.padding", metadata !120, metadata !"unsigned char", i32 0, i32 7}
!120 = metadata !{metadata !121}
!121 = metadata !{i32 5, i32 5, i32 2}
!122 = metadata !{i32 432, i32 439, metadata !123}
!123 = metadata !{metadata !124}
!124 = metadata !{metadata !"act_reg.padding", metadata !125, metadata !"unsigned char", i32 0, i32 7}
!125 = metadata !{metadata !126}
!126 = metadata !{i32 6, i32 6, i32 2}
!127 = metadata !{i32 440, i32 447, metadata !128}
!128 = metadata !{metadata !129}
!129 = metadata !{metadata !"act_reg.padding", metadata !130, metadata !"unsigned char", i32 0, i32 7}
!130 = metadata !{metadata !131}
!131 = metadata !{i32 7, i32 7, i32 2}
!132 = metadata !{i32 448, i32 455, metadata !133}
!133 = metadata !{metadata !134}
!134 = metadata !{metadata !"act_reg.padding", metadata !135, metadata !"unsigned char", i32 0, i32 7}
!135 = metadata !{metadata !136}
!136 = metadata !{i32 8, i32 8, i32 2}
!137 = metadata !{i32 456, i32 463, metadata !138}
!138 = metadata !{metadata !139}
!139 = metadata !{metadata !"act_reg.padding", metadata !140, metadata !"unsigned char", i32 0, i32 7}
!140 = metadata !{metadata !141}
!141 = metadata !{i32 9, i32 9, i32 2}
!142 = metadata !{i32 464, i32 471, metadata !143}
!143 = metadata !{metadata !144}
!144 = metadata !{metadata !"act_reg.padding", metadata !145, metadata !"unsigned char", i32 0, i32 7}
!145 = metadata !{metadata !146}
!146 = metadata !{i32 10, i32 10, i32 2}
!147 = metadata !{i32 472, i32 479, metadata !148}
!148 = metadata !{metadata !149}
!149 = metadata !{metadata !"act_reg.padding", metadata !150, metadata !"unsigned char", i32 0, i32 7}
!150 = metadata !{metadata !151}
!151 = metadata !{i32 11, i32 11, i32 2}
!152 = metadata !{i32 480, i32 487, metadata !153}
!153 = metadata !{metadata !154}
!154 = metadata !{metadata !"act_reg.padding", metadata !155, metadata !"unsigned char", i32 0, i32 7}
!155 = metadata !{metadata !156}
!156 = metadata !{i32 12, i32 12, i32 2}
!157 = metadata !{i32 488, i32 495, metadata !158}
!158 = metadata !{metadata !159}
!159 = metadata !{metadata !"act_reg.padding", metadata !160, metadata !"unsigned char", i32 0, i32 7}
!160 = metadata !{metadata !161}
!161 = metadata !{i32 13, i32 13, i32 2}
!162 = metadata !{i32 496, i32 503, metadata !163}
!163 = metadata !{metadata !164}
!164 = metadata !{metadata !"act_reg.padding", metadata !165, metadata !"unsigned char", i32 0, i32 7}
!165 = metadata !{metadata !166}
!166 = metadata !{i32 14, i32 14, i32 2}
!167 = metadata !{i32 504, i32 511, metadata !168}
!168 = metadata !{metadata !169}
!169 = metadata !{metadata !"act_reg.padding", metadata !170, metadata !"unsigned char", i32 0, i32 7}
!170 = metadata !{metadata !171}
!171 = metadata !{i32 15, i32 15, i32 2}
!172 = metadata !{i32 512, i32 519, metadata !173}
!173 = metadata !{metadata !174}
!174 = metadata !{metadata !"act_reg.padding", metadata !175, metadata !"unsigned char", i32 0, i32 7}
!175 = metadata !{metadata !176}
!176 = metadata !{i32 16, i32 16, i32 2}
!177 = metadata !{i32 520, i32 527, metadata !178}
!178 = metadata !{metadata !179}
!179 = metadata !{metadata !"act_reg.padding", metadata !180, metadata !"unsigned char", i32 0, i32 7}
!180 = metadata !{metadata !181}
!181 = metadata !{i32 17, i32 17, i32 2}
!182 = metadata !{i32 528, i32 535, metadata !183}
!183 = metadata !{metadata !184}
!184 = metadata !{metadata !"act_reg.padding", metadata !185, metadata !"unsigned char", i32 0, i32 7}
!185 = metadata !{metadata !186}
!186 = metadata !{i32 18, i32 18, i32 2}
!187 = metadata !{i32 536, i32 543, metadata !188}
!188 = metadata !{metadata !189}
!189 = metadata !{metadata !"act_reg.padding", metadata !190, metadata !"unsigned char", i32 0, i32 7}
!190 = metadata !{metadata !191}
!191 = metadata !{i32 19, i32 19, i32 2}
!192 = metadata !{i32 544, i32 551, metadata !193}
!193 = metadata !{metadata !194}
!194 = metadata !{metadata !"act_reg.padding", metadata !195, metadata !"unsigned char", i32 0, i32 7}
!195 = metadata !{metadata !196}
!196 = metadata !{i32 20, i32 20, i32 2}
!197 = metadata !{i32 552, i32 559, metadata !198}
!198 = metadata !{metadata !199}
!199 = metadata !{metadata !"act_reg.padding", metadata !200, metadata !"unsigned char", i32 0, i32 7}
!200 = metadata !{metadata !201}
!201 = metadata !{i32 21, i32 21, i32 2}
!202 = metadata !{i32 560, i32 567, metadata !203}
!203 = metadata !{metadata !204}
!204 = metadata !{metadata !"act_reg.padding", metadata !205, metadata !"unsigned char", i32 0, i32 7}
!205 = metadata !{metadata !206}
!206 = metadata !{i32 22, i32 22, i32 2}
!207 = metadata !{i32 568, i32 575, metadata !208}
!208 = metadata !{metadata !209}
!209 = metadata !{metadata !"act_reg.padding", metadata !210, metadata !"unsigned char", i32 0, i32 7}
!210 = metadata !{metadata !211}
!211 = metadata !{i32 23, i32 23, i32 2}
!212 = metadata !{i32 576, i32 583, metadata !213}
!213 = metadata !{metadata !214}
!214 = metadata !{metadata !"act_reg.padding", metadata !215, metadata !"unsigned char", i32 0, i32 7}
!215 = metadata !{metadata !216}
!216 = metadata !{i32 24, i32 24, i32 2}
!217 = metadata !{i32 584, i32 591, metadata !218}
!218 = metadata !{metadata !219}
!219 = metadata !{metadata !"act_reg.padding", metadata !220, metadata !"unsigned char", i32 0, i32 7}
!220 = metadata !{metadata !221}
!221 = metadata !{i32 25, i32 25, i32 2}
!222 = metadata !{i32 592, i32 599, metadata !223}
!223 = metadata !{metadata !224}
!224 = metadata !{metadata !"act_reg.padding", metadata !225, metadata !"unsigned char", i32 0, i32 7}
!225 = metadata !{metadata !226}
!226 = metadata !{i32 26, i32 26, i32 2}
!227 = metadata !{i32 600, i32 607, metadata !228}
!228 = metadata !{metadata !229}
!229 = metadata !{metadata !"act_reg.padding", metadata !230, metadata !"unsigned char", i32 0, i32 7}
!230 = metadata !{metadata !231}
!231 = metadata !{i32 27, i32 27, i32 2}
!232 = metadata !{i32 608, i32 615, metadata !233}
!233 = metadata !{metadata !234}
!234 = metadata !{metadata !"act_reg.padding", metadata !235, metadata !"unsigned char", i32 0, i32 7}
!235 = metadata !{metadata !236}
!236 = metadata !{i32 28, i32 28, i32 2}
!237 = metadata !{i32 616, i32 623, metadata !238}
!238 = metadata !{metadata !239}
!239 = metadata !{metadata !"act_reg.padding", metadata !240, metadata !"unsigned char", i32 0, i32 7}
!240 = metadata !{metadata !241}
!241 = metadata !{i32 29, i32 29, i32 2}
!242 = metadata !{i32 624, i32 631, metadata !243}
!243 = metadata !{metadata !244}
!244 = metadata !{metadata !"act_reg.padding", metadata !245, metadata !"unsigned char", i32 0, i32 7}
!245 = metadata !{metadata !246}
!246 = metadata !{i32 30, i32 30, i32 2}
!247 = metadata !{i32 632, i32 639, metadata !248}
!248 = metadata !{metadata !249}
!249 = metadata !{metadata !"act_reg.padding", metadata !250, metadata !"unsigned char", i32 0, i32 7}
!250 = metadata !{metadata !251}
!251 = metadata !{i32 31, i32 31, i32 2}
!252 = metadata !{i32 640, i32 647, metadata !253}
!253 = metadata !{metadata !254}
!254 = metadata !{metadata !"act_reg.padding", metadata !255, metadata !"unsigned char", i32 0, i32 7}
!255 = metadata !{metadata !256}
!256 = metadata !{i32 32, i32 32, i32 2}
!257 = metadata !{i32 648, i32 655, metadata !258}
!258 = metadata !{metadata !259}
!259 = metadata !{metadata !"act_reg.padding", metadata !260, metadata !"unsigned char", i32 0, i32 7}
!260 = metadata !{metadata !261}
!261 = metadata !{i32 33, i32 33, i32 2}
!262 = metadata !{i32 656, i32 663, metadata !263}
!263 = metadata !{metadata !264}
!264 = metadata !{metadata !"act_reg.padding", metadata !265, metadata !"unsigned char", i32 0, i32 7}
!265 = metadata !{metadata !266}
!266 = metadata !{i32 34, i32 34, i32 2}
!267 = metadata !{i32 664, i32 671, metadata !268}
!268 = metadata !{metadata !269}
!269 = metadata !{metadata !"act_reg.padding", metadata !270, metadata !"unsigned char", i32 0, i32 7}
!270 = metadata !{metadata !271}
!271 = metadata !{i32 35, i32 35, i32 2}
!272 = metadata !{i32 672, i32 679, metadata !273}
!273 = metadata !{metadata !274}
!274 = metadata !{metadata !"act_reg.padding", metadata !275, metadata !"unsigned char", i32 0, i32 7}
!275 = metadata !{metadata !276}
!276 = metadata !{i32 36, i32 36, i32 2}
!277 = metadata !{i32 680, i32 687, metadata !278}
!278 = metadata !{metadata !279}
!279 = metadata !{metadata !"act_reg.padding", metadata !280, metadata !"unsigned char", i32 0, i32 7}
!280 = metadata !{metadata !281}
!281 = metadata !{i32 37, i32 37, i32 2}
!282 = metadata !{i32 688, i32 695, metadata !283}
!283 = metadata !{metadata !284}
!284 = metadata !{metadata !"act_reg.padding", metadata !285, metadata !"unsigned char", i32 0, i32 7}
!285 = metadata !{metadata !286}
!286 = metadata !{i32 38, i32 38, i32 2}
!287 = metadata !{i32 696, i32 703, metadata !288}
!288 = metadata !{metadata !289}
!289 = metadata !{metadata !"act_reg.padding", metadata !290, metadata !"unsigned char", i32 0, i32 7}
!290 = metadata !{metadata !291}
!291 = metadata !{i32 39, i32 39, i32 2}
!292 = metadata !{i32 704, i32 711, metadata !293}
!293 = metadata !{metadata !294}
!294 = metadata !{metadata !"act_reg.padding", metadata !295, metadata !"unsigned char", i32 0, i32 7}
!295 = metadata !{metadata !296}
!296 = metadata !{i32 40, i32 40, i32 2}
!297 = metadata !{i32 712, i32 719, metadata !298}
!298 = metadata !{metadata !299}
!299 = metadata !{metadata !"act_reg.padding", metadata !300, metadata !"unsigned char", i32 0, i32 7}
!300 = metadata !{metadata !301}
!301 = metadata !{i32 41, i32 41, i32 2}
!302 = metadata !{i32 720, i32 727, metadata !303}
!303 = metadata !{metadata !304}
!304 = metadata !{metadata !"act_reg.padding", metadata !305, metadata !"unsigned char", i32 0, i32 7}
!305 = metadata !{metadata !306}
!306 = metadata !{i32 42, i32 42, i32 2}
!307 = metadata !{i32 728, i32 735, metadata !308}
!308 = metadata !{metadata !309}
!309 = metadata !{metadata !"act_reg.padding", metadata !310, metadata !"unsigned char", i32 0, i32 7}
!310 = metadata !{metadata !311}
!311 = metadata !{i32 43, i32 43, i32 2}
!312 = metadata !{i32 736, i32 743, metadata !313}
!313 = metadata !{metadata !314}
!314 = metadata !{metadata !"act_reg.padding", metadata !315, metadata !"unsigned char", i32 0, i32 7}
!315 = metadata !{metadata !316}
!316 = metadata !{i32 44, i32 44, i32 2}
!317 = metadata !{i32 744, i32 751, metadata !318}
!318 = metadata !{metadata !319}
!319 = metadata !{metadata !"act_reg.padding", metadata !320, metadata !"unsigned char", i32 0, i32 7}
!320 = metadata !{metadata !321}
!321 = metadata !{i32 45, i32 45, i32 2}
!322 = metadata !{i32 752, i32 759, metadata !323}
!323 = metadata !{metadata !324}
!324 = metadata !{metadata !"act_reg.padding", metadata !325, metadata !"unsigned char", i32 0, i32 7}
!325 = metadata !{metadata !326}
!326 = metadata !{i32 46, i32 46, i32 2}
!327 = metadata !{i32 760, i32 767, metadata !328}
!328 = metadata !{metadata !329}
!329 = metadata !{metadata !"act_reg.padding", metadata !330, metadata !"unsigned char", i32 0, i32 7}
!330 = metadata !{metadata !331}
!331 = metadata !{i32 47, i32 47, i32 2}
!332 = metadata !{i32 768, i32 775, metadata !333}
!333 = metadata !{metadata !334}
!334 = metadata !{metadata !"act_reg.padding", metadata !335, metadata !"unsigned char", i32 0, i32 7}
!335 = metadata !{metadata !336}
!336 = metadata !{i32 48, i32 48, i32 2}
!337 = metadata !{i32 776, i32 783, metadata !338}
!338 = metadata !{metadata !339}
!339 = metadata !{metadata !"act_reg.padding", metadata !340, metadata !"unsigned char", i32 0, i32 7}
!340 = metadata !{metadata !341}
!341 = metadata !{i32 49, i32 49, i32 2}
!342 = metadata !{i32 784, i32 791, metadata !343}
!343 = metadata !{metadata !344}
!344 = metadata !{metadata !"act_reg.padding", metadata !345, metadata !"unsigned char", i32 0, i32 7}
!345 = metadata !{metadata !346}
!346 = metadata !{i32 50, i32 50, i32 2}
!347 = metadata !{i32 792, i32 799, metadata !348}
!348 = metadata !{metadata !349}
!349 = metadata !{metadata !"act_reg.padding", metadata !350, metadata !"unsigned char", i32 0, i32 7}
!350 = metadata !{metadata !351}
!351 = metadata !{i32 51, i32 51, i32 2}
!352 = metadata !{i32 800, i32 807, metadata !353}
!353 = metadata !{metadata !354}
!354 = metadata !{metadata !"act_reg.padding", metadata !355, metadata !"unsigned char", i32 0, i32 7}
!355 = metadata !{metadata !356}
!356 = metadata !{i32 52, i32 52, i32 2}
!357 = metadata !{i32 808, i32 815, metadata !358}
!358 = metadata !{metadata !359}
!359 = metadata !{metadata !"act_reg.padding", metadata !360, metadata !"unsigned char", i32 0, i32 7}
!360 = metadata !{metadata !361}
!361 = metadata !{i32 53, i32 53, i32 2}
!362 = metadata !{i32 816, i32 823, metadata !363}
!363 = metadata !{metadata !364}
!364 = metadata !{metadata !"act_reg.padding", metadata !365, metadata !"unsigned char", i32 0, i32 7}
!365 = metadata !{metadata !366}
!366 = metadata !{i32 54, i32 54, i32 2}
!367 = metadata !{i32 824, i32 831, metadata !368}
!368 = metadata !{metadata !369}
!369 = metadata !{metadata !"act_reg.padding", metadata !370, metadata !"unsigned char", i32 0, i32 7}
!370 = metadata !{metadata !371}
!371 = metadata !{i32 55, i32 55, i32 2}
!372 = metadata !{i32 832, i32 839, metadata !373}
!373 = metadata !{metadata !374}
!374 = metadata !{metadata !"act_reg.padding", metadata !375, metadata !"unsigned char", i32 0, i32 7}
!375 = metadata !{metadata !376}
!376 = metadata !{i32 56, i32 56, i32 2}
!377 = metadata !{i32 840, i32 847, metadata !378}
!378 = metadata !{metadata !379}
!379 = metadata !{metadata !"act_reg.padding", metadata !380, metadata !"unsigned char", i32 0, i32 7}
!380 = metadata !{metadata !381}
!381 = metadata !{i32 57, i32 57, i32 2}
!382 = metadata !{i32 848, i32 855, metadata !383}
!383 = metadata !{metadata !384}
!384 = metadata !{metadata !"act_reg.padding", metadata !385, metadata !"unsigned char", i32 0, i32 7}
!385 = metadata !{metadata !386}
!386 = metadata !{i32 58, i32 58, i32 2}
!387 = metadata !{i32 856, i32 863, metadata !388}
!388 = metadata !{metadata !389}
!389 = metadata !{metadata !"act_reg.padding", metadata !390, metadata !"unsigned char", i32 0, i32 7}
!390 = metadata !{metadata !391}
!391 = metadata !{i32 59, i32 59, i32 2}
!392 = metadata !{i32 864, i32 871, metadata !393}
!393 = metadata !{metadata !394}
!394 = metadata !{metadata !"act_reg.padding", metadata !395, metadata !"unsigned char", i32 0, i32 7}
!395 = metadata !{metadata !396}
!396 = metadata !{i32 60, i32 60, i32 2}
!397 = metadata !{i32 872, i32 879, metadata !398}
!398 = metadata !{metadata !399}
!399 = metadata !{metadata !"act_reg.padding", metadata !400, metadata !"unsigned char", i32 0, i32 7}
!400 = metadata !{metadata !401}
!401 = metadata !{i32 61, i32 61, i32 2}
!402 = metadata !{i32 880, i32 887, metadata !403}
!403 = metadata !{metadata !404}
!404 = metadata !{metadata !"act_reg.padding", metadata !405, metadata !"unsigned char", i32 0, i32 7}
!405 = metadata !{metadata !406}
!406 = metadata !{i32 62, i32 62, i32 2}
!407 = metadata !{i32 888, i32 895, metadata !408}
!408 = metadata !{metadata !409}
!409 = metadata !{metadata !"act_reg.padding", metadata !410, metadata !"unsigned char", i32 0, i32 7}
!410 = metadata !{metadata !411}
!411 = metadata !{i32 63, i32 63, i32 2}
!412 = metadata !{i32 896, i32 903, metadata !413}
!413 = metadata !{metadata !414}
!414 = metadata !{metadata !"act_reg.padding", metadata !415, metadata !"unsigned char", i32 0, i32 7}
!415 = metadata !{metadata !416}
!416 = metadata !{i32 64, i32 64, i32 2}
!417 = metadata !{i32 904, i32 911, metadata !418}
!418 = metadata !{metadata !419}
!419 = metadata !{metadata !"act_reg.padding", metadata !420, metadata !"unsigned char", i32 0, i32 7}
!420 = metadata !{metadata !421}
!421 = metadata !{i32 65, i32 65, i32 2}
!422 = metadata !{i32 912, i32 919, metadata !423}
!423 = metadata !{metadata !424}
!424 = metadata !{metadata !"act_reg.padding", metadata !425, metadata !"unsigned char", i32 0, i32 7}
!425 = metadata !{metadata !426}
!426 = metadata !{i32 66, i32 66, i32 2}
!427 = metadata !{i32 920, i32 927, metadata !428}
!428 = metadata !{metadata !429}
!429 = metadata !{metadata !"act_reg.padding", metadata !430, metadata !"unsigned char", i32 0, i32 7}
!430 = metadata !{metadata !431}
!431 = metadata !{i32 67, i32 67, i32 2}
!432 = metadata !{i32 928, i32 935, metadata !433}
!433 = metadata !{metadata !434}
!434 = metadata !{metadata !"act_reg.padding", metadata !435, metadata !"unsigned char", i32 0, i32 7}
!435 = metadata !{metadata !436}
!436 = metadata !{i32 68, i32 68, i32 2}
!437 = metadata !{i32 936, i32 943, metadata !438}
!438 = metadata !{metadata !439}
!439 = metadata !{metadata !"act_reg.padding", metadata !440, metadata !"unsigned char", i32 0, i32 7}
!440 = metadata !{metadata !441}
!441 = metadata !{i32 69, i32 69, i32 2}
!442 = metadata !{i32 944, i32 951, metadata !443}
!443 = metadata !{metadata !444}
!444 = metadata !{metadata !"act_reg.padding", metadata !445, metadata !"unsigned char", i32 0, i32 7}
!445 = metadata !{metadata !446}
!446 = metadata !{i32 70, i32 70, i32 2}
!447 = metadata !{i32 952, i32 959, metadata !448}
!448 = metadata !{metadata !449}
!449 = metadata !{metadata !"act_reg.padding", metadata !450, metadata !"unsigned char", i32 0, i32 7}
!450 = metadata !{metadata !451}
!451 = metadata !{i32 71, i32 71, i32 2}
!452 = metadata !{i32 960, i32 967, metadata !453}
!453 = metadata !{metadata !454}
!454 = metadata !{metadata !"act_reg.padding", metadata !455, metadata !"unsigned char", i32 0, i32 7}
!455 = metadata !{metadata !456}
!456 = metadata !{i32 72, i32 72, i32 2}
!457 = metadata !{i32 968, i32 975, metadata !458}
!458 = metadata !{metadata !459}
!459 = metadata !{metadata !"act_reg.padding", metadata !460, metadata !"unsigned char", i32 0, i32 7}
!460 = metadata !{metadata !461}
!461 = metadata !{i32 73, i32 73, i32 2}
!462 = metadata !{i32 976, i32 983, metadata !463}
!463 = metadata !{metadata !464}
!464 = metadata !{metadata !"act_reg.padding", metadata !465, metadata !"unsigned char", i32 0, i32 7}
!465 = metadata !{metadata !466}
!466 = metadata !{i32 74, i32 74, i32 2}
!467 = metadata !{i32 984, i32 991, metadata !468}
!468 = metadata !{metadata !469}
!469 = metadata !{metadata !"act_reg.padding", metadata !470, metadata !"unsigned char", i32 0, i32 7}
!470 = metadata !{metadata !471}
!471 = metadata !{i32 75, i32 75, i32 2}
