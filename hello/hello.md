# hello
簡単なコードをコンパイルしてみる。
llvmツール類を使ってみる。

## コンパイル対象コード
`hello.c`
``` c
#include <stdio.h>
int main(void){
    printf("hello world\n");
    return 0;
}
```
## clang でコンパイル、実行形式を生成
```
> clang hello.c
```
`a.exe`が生成される。
実行してみる。
```
> a.exe
hello world
```
## LLVM IRを生成する。
```
> clang -emit-llvm -S hello.c
```
LLVM IR`hello.ll`が生成される。
抜粋
```
; ModuleID = 'hello.c'

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @"\01??_C@_0N@GIINEEDM@hello?5world?6?$AA@", i32 0, i32 0))
  ret i32 0
}
```
## LLVM IR（ビットコード）を生成する。
```
> clang -emit-llvm -c hello.c
```
LLVM IR`hello.bc`が生成される。

## LLVM IRをJITで実行
```
> lli hello.ll
hello world
```

## LLVM IRからアーキテクチャ向けアセンブリを生成
```
> llc hello.ll
```
`hello.s`が生成される。

## LLVM IRからアーキテクチャ向けオブジェクトを生成
```
> llc -filetype=obj hello.ll
```
`hello.obj`が生成される。
