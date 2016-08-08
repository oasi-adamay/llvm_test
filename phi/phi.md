# phi

https://en.wikipedia.org/wiki/Static_single_assignment_form

Converting to SSA の例で試してみる。

## source code
`phi.c`
``` c
void func(int* _y,int* _z,int* _w){
  int y,w,z;
  int x = 5;
  x = x -3;
  if(x<3){
    y = x *2;
    w = y;
  }
  else{
    y = x- 3;
  }

  w = x - y;
  z = x + y;

  *_y = y;
  *_w = w;
  *_z = z;
}
```
## LLVM IR
```
> clang -emit-llvm -S phi.c
> opt -mem2reg -S phi.ll -o phi_m2r.ll
```

`phi_m2r.ll`
```
; Function Attrs: nounwind uwtable
define void @func(i32* %_y, i32* %_z, i32* %_w) #0 {
entry:
  %sub = sub nsw i32 5, 3         ;x = 5
  %cmp = icmp slt i32 %sub, 3     ;if(x<3)
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %mul = mul nsw i32 %sub, 2    ;y = x*2
  br label %if.end

if.else:                                          ; preds = %entry
  %sub1 = sub nsw i32 %sub, 3   ;y = x- 3
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %y.0 = phi i32 [ %mul, %if.then ], [ %sub1, %if.else ]
  %sub2 = sub nsw i32 %sub, %y.0    ; w = x - y
  %add = add nsw i32 %sub, %y.0     ; z = x + y
  store i32 %y.0, i32* %_y, align 4
  store i32 %sub2, i32* %_w, align 4
  store i32 %add, i32* %_z, align 4
  ret void
}
```
- <result> = phi <ty> [ <val0>, <label0>], ...
- phi命令は関数を表すSSAグラフのφノードを実装するために使用します。
- phi命令は、basic blockの最初になくてはいけません。
- phi命令は、直前のbasic blockのラベルから値を選択します。
