#include <stdio.h>
int main()
{

    if (1 == 1)
    {
        printf("First Statement execute");
        goto condition;
    }
    else if (0 == 0)
    {
    condition:
        printf("\nSecond Statement execute");
    }
}