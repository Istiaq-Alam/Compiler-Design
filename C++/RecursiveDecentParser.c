#include<stdio.h>
#include<string.h>
#include<ctype.h>
int i,err;
char inp[10];
void E();
void E1();
void T();
void T1();
void F();
void main()
{
    i=0,err=0;
    printf("Enter String: ");
    scanf("%s",inp);
    E();
    if(strlen(inp)==i && err==0)
        printf("STRING ACCEPTED...!!\n");
    else
        printf("STRING NOT ACCEPTED...!!\n");
}
void E()
{
    T();
    E1();
}
void E1()
{
    if(inp[i]=='+')
    {
        i++;
        T();
        E1();
    }
}
void T()
{
    F();
    T1();
}
void T1()
{
    if(inp[i]=='*')
    {
        i++;
        F();
        T1();
    }
}
void F()
{
    if(isalnum(inp[i]))
        i++;
    else if(inp[i]=='(')
    {
        i++;
        E();
        if(inp[i]==')')
            i++;
        else
            err=1;
    }
    else
        err=1;

}
