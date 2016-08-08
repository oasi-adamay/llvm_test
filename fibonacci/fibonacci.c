#include <stdio.h>
//#define NUM  100
#define NUM  10

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
