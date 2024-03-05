%{
#include<stdio.h>
int nc=0;
%}

%%
"/*"[a-zA-Z0-9\n\t ]*"*/"  {nc++;}
"//"[a-zA-Z0-9\t ]*"\n"   {nc++;}
%%
int yywrap( ){}

int main(int argc ,char* argv[])
{
	yyin=fopen(argv[1],"r");

	yyout=fopen("output.c","w");
	yylex( );
	printf("The number of comment lines=%d\n",nc);

}
	
%{
int positive_no = 0, negative_no = 0;
%}

%%
^[-][0-9]+ {negative_no++;
			printf("negative number = %s\n",yytext);} 

[0-9]+ {positive_no++;
		printf("positive number = %s\n",yytext);}	

%%

int yywrap(){}
int main()											
{

yylex();
printf ("number of positive numbers = %d,"
		"number of negative numbers = %d\n",
				positive_no, negative_no);

return 0;
}	%{
#include<stdio.h>
%}

%%
\<[^>]*\> fprintf(yyout,"%s\n",yytext);
.|\n;

%%

int yywrap()
{
return 1;
}

int main()
{
yyin=fopen("sample.html","r");
yyout=fopen("output.txt","w");
yylex();
return 0;
}
