//The Recursive Decent Parser is implemented Using C++
#include<string.h>
#include <iostream>
using namespace std;
int i,err;
char inp[10];
void E();
void E1();
void T();
void T1();
void F();
int main()
{
    i=0,err=0;
    cout << "Enter String: ";
    cin >> inp;
    E();
    if(strlen(inp)==i && err==0)
        cout << "STRING ACCEPTED...!!\n" << endl;
    else
        cout << "STRING NOT ACCEPTED...!!\n" << endl;
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

