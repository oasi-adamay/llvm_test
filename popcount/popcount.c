#include <stdio.h>

typedef unsigned int int32_t;

int popcount(int32_t bits)
{
	bits = (bits & 0x55555555) + (bits >> 1 & 0x55555555);
	bits = (bits & 0x33333333) + (bits >> 2 & 0x33333333);
	bits = (bits & 0x0f0f0f0f) + (bits >> 4 & 0x0f0f0f0f);
	bits = (bits & 0x00ff00ff) + (bits >> 8 & 0x00ff00ff);
	return (bits & 0x0000ffff) + (bits >> 16 & 0x0000ffff);
}

int main(void){
	int32_t deadbeaf = 0xdeadbeaf;

	printf("0x%x:popcount:%d\n",deadbeaf,popcount(deadbeaf));
	return 0;
}