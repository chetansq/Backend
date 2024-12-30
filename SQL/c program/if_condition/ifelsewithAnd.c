#include <stdio.h>
int main()
{
    // int a = 100, b = 200, c = 300, d = 50;
    // int a = 50, b = 300, c = 200, d = 100;
    // int a = 100, b = 50, c = 300, d = 200;
    int a = 200, b = 100, c = 50, d = 300;

    if (a > b && a > c && a > d)
    {
        printf("a is Greter");
    }
    else if (b > c && b > d)
    {
        printf("b is Greter");
    }
    else if (c > d)
    {
        printf("c is Greter");
    }
    else
    {
        printf("d is Greter");
    }
}