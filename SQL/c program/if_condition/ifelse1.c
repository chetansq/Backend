#include <stdio.h>
int main()
{
    // int a = 60, b = 40, c = 20;
    // int a = 20, b = 60, c = 40;
    int a = 40, b = 20, c = 60;

    if (a > b)
    {
        if (a > c)
        {
            printf("a is Greter");
        }
        else
        {
            printf("c is Greter");
        }
    }
    else
    {
        if (b > c)
        {
            printf("b is Greter");
        }
    }
}