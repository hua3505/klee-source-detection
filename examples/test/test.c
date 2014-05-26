#include <stdlib.h>

int a;
int ai;
float b;
char str[10];
int * pi;

int main()
{
    char c;
	str[1] = 'h';
    c = str[1];
	pi = &a;
	ai = a;
	pi = (int *)malloc(sizeof(int));
    *pi = 100;
	*pi = 234;
	if (a)
	{
        ai = 1;   
	}
	else
	{
        ai = 2;
	}
    return 0;
}
