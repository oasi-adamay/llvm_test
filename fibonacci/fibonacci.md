# fibonacci

## source
`fibonacci.c`
```
#include <stdio.h>
#define NUM  100

int main(void)
{
  /* 変数の宣言 */
  int n;
  int f0, f1, f2;

  f0 = 0;
  f1 = 1;

  /* フィボナッチ数(n=0)の出力 */
  printf("%d\n", f0);

  /* フィボナッチ数の計算 */
  while(f1<NUM) {
    // フィボナッチ数の出力(n>0)
    printf("%d\n", f1);
    // フィボナッチ数の計算
    f2 = f1 + f0;
    // 変数の代入
    f0 = f1;
    f1 = f2;
  }

  return 0;
}
```


## LLVM IR生成
```
clang -emit-llvm -S fibonacci.c
```
`fibonacchi.ll`が生成される
```
; Function Attrs: nounwind uwtable
define i32 @main() #1 {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %f0 = alloca i32, align 4
  %f1 = alloca i32, align 4
  %f2 = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 0, i32* %f0, align 4
  store i32 1, i32* %f1, align 4
  %0 = load i32, i32* %f0, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"\01??_C@_03PMGGPEJJ@?$CFd?6?$AA@", i32 0, i32 0), i32 %0)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i32, i32* %f1, align 4
  %cmp = icmp slt i32 %1, 100
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %f1, align 4
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"\01??_C@_03PMGGPEJJ@?$CFd?6?$AA@", i32 0, i32 0), i32 %2)
  %3 = load i32, i32* %f1, align 4
  %4 = load i32, i32* %f0, align 4
  %add = add nsw i32 %3, %4
  store i32 %add, i32* %f2, align 4
  %5 = load i32, i32* %f1, align 4
  store i32 %5, i32* %f0, align 4
  %6 = load i32, i32* %f2, align 4
  store i32 %6, i32* %f1, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 0
}

```

## mem2reg でレジスタに割り当ててみる。
```
opt -mem2reg -S fibonacci.ll -o fibonacci_m2r.ll
```
`fibonacci_m2r.ll`
- load,store系の命令が削除される。
- phi関数に置き換わる。

```
; Function Attrs: nounwind uwtable
define i32 @main() #1 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"\01??_C@_03PMGGPEJJ@?$CFd?6?$AA@", i32 0, i32 0), i32 0)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %f0.0 = phi i32 [ 0, %entry ], [ %f1.0, %while.body ]
  %f1.0 = phi i32 [ 1, %entry ], [ %add, %while.body ]
  %cmp = icmp slt i32 %f1.0, 100
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"\01??_C@_03PMGGPEJJ@?$CFd?6?$AA@", i32 0, i32 0), i32 %f1.0)
  %add = add nsw i32 %f1.0, %f0.0
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 0
}

```

## unroll してみる。
```
opt -loop-unroll -S fibonacci_m2r.ll -o fibonacci_m2r_loop-unroll.ll
```

`fibonacci_m2r_loop-unroll.ll`
unrollされない。 10回にしてみたがやっぱりunrollされない。

```
; Function Attrs: nounwind uwtable
define i32 @main() #1 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"\01??_C@_03PMGGPEJJ@?$CFd?6?$AA@", i32 0, i32 0), i32 0)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %f0.0 = phi i32 [ 0, %entry ], [ %f1.0, %while.body ]
  %f1.0 = phi i32 [ 1, %entry ], [ %add, %while.body ]
  %cmp = icmp slt i32 %f1.0, 10
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @"\01??_C@_03PMGGPEJJ@?$CFd?6?$AA@", i32 0, i32 0), i32 %f1.0)
  %add = add nsw i32 %f1.0, %f0.0
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 0
}
```
