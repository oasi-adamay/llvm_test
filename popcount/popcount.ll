; ModuleID = 'popcount.c'
source_filename = "popcount.c"
target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.0.24215"

%struct._iobuf = type { i8* }
%struct.__crt_locale_pointers = type { %struct.__crt_locale_data*, %struct.__crt_multibyte_data* }
%struct.__crt_locale_data = type opaque
%struct.__crt_multibyte_data = type opaque

$printf = comdat any

$__local_stdio_printf_options = comdat any

$_vfprintf_l = comdat any

$"\01??_C@_0BC@HFCLMENG@0x?$CFx?3popcount?3?$CFd?6?$AA@" = comdat any

@"\01??_C@_0BC@HFCLMENG@0x?$CFx?3popcount?3?$CFd?6?$AA@" = linkonce_odr unnamed_addr constant [18 x i8] c"0x%x:popcount:%d\0A\00", comdat, align 1
@__local_stdio_printf_options._OptionsStorage = internal global i64 0, align 8

; Function Attrs: norecurse nounwind readnone uwtable
define i32 @popcount(i32) local_unnamed_addr #0 {
  %2 = and i32 %0, 1431655765
  %3 = lshr i32 %0, 1
  %4 = and i32 %3, 1431655765
  %5 = add nuw i32 %4, %2
  %6 = and i32 %5, 858993459
  %7 = lshr i32 %5, 2
  %8 = and i32 %7, 858993459
  %9 = add nuw nsw i32 %8, %6
  %10 = and i32 %9, 117901063
  %11 = lshr i32 %9, 4
  %12 = and i32 %11, 117901063
  %13 = add nuw nsw i32 %12, %10
  %14 = and i32 %13, 983055
  %15 = lshr i32 %13, 8
  %16 = and i32 %15, 983055
  %17 = add nuw nsw i32 %16, %14
  %18 = and i32 %17, 31
  %19 = lshr i32 %17, 16
  %20 = add nuw nsw i32 %18, %19
  ret i32 %20
}

; Function Attrs: nounwind uwtable
define i32 @main() local_unnamed_addr #1 {
  %1 = tail call i32 @popcount(i32 -559038801)
  %2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @"\01??_C@_0BC@HFCLMENG@0x?$CFx?3popcount?3?$CFd?6?$AA@", i64 0, i64 0), i32 -559038801, i32 %1)
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr i32 @printf(i8*, ...) local_unnamed_addr #3 comdat {
  %2 = alloca i8*, align 8
  %3 = bitcast i8** %2 to i8*
  call void @llvm.lifetime.start(i64 8, i8* %3) #4
  call void @llvm.va_start(i8* %3)
  %4 = load i8*, i8** %2, align 8, !tbaa !2
  %5 = call %struct._iobuf* @__acrt_iob_func(i32 1) #4
  %6 = call i32 @_vfprintf_l(%struct._iobuf* %5, i8* %0, %struct.__crt_locale_pointers* null, i8* %4)
  call void @llvm.va_end(i8* %3)
  call void @llvm.lifetime.end(i64 8, i8* %3) #4
  ret i32 %6
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #4

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #4

; Function Attrs: inlinehint noinline norecurse nounwind uwtable
define linkonce_odr i64* @__local_stdio_printf_options() local_unnamed_addr #5 comdat {
  ret i64* @__local_stdio_printf_options._OptionsStorage
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr i32 @_vfprintf_l(%struct._iobuf*, i8*, %struct.__crt_locale_pointers*, i8*) local_unnamed_addr #3 comdat {
  %5 = tail call i64* @__local_stdio_printf_options()
  %6 = load i64, i64* %5, align 8, !tbaa !6
  %7 = tail call i32 @__stdio_common_vfprintf(i64 %6, %struct._iobuf* %0, i8* %1, %struct.__crt_locale_pointers* %2, i8* %3) #4
  ret i32 %7
}

declare %struct._iobuf* @__acrt_iob_func(i32) local_unnamed_addr #6

declare i32 @__stdio_common_vfprintf(i64, %struct._iobuf*, i8*, %struct.__crt_locale_pointers*, i8*) local_unnamed_addr #6

attributes #0 = { norecurse nounwind readnone uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { inlinehint nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { inlinehint noinline norecurse nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"long long", !4, i64 0}
