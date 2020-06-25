%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "y.tab.h"
void checkas(char a);
int b[15];
int i;
int q;
%}

/* %option noyywrap */

%%

"while"		return WHILE;
"if"		return IF;
"print" 	return PRINT;
"class"		return CLASS;
"close"		return CLOSE;
"inc"		return INC;

[a-zA-Z]+		{yylval = *yytext - 'a';
					for(i=0; i<10;i++){
						if(yytext[i]<91){
							b[i] = (int)yytext[i]+ 32;
						}else{
							b[i] = (int)yytext[i];
							}
					};
					q=0;
					for(i=0;i<5;i++){
						q += b[i];
					};
					
					if(q == 378){
						printf("You need to use All lower case letters to write inc statement\n");
					}if(q == 465){
						printf("You need to use All lower case letters to write if statement\n");
					}if(q == 537){
						printf("You need to use All lower case letters to write while statement\n");
					}else if(q==534){
						printf("You need to use All lower case letters to write close statement or class statement\n");
					}else if(q==557){
						printf("You need to use All lower case letters to write print statement\n");
					};
					return VARIABLE;
					}

[0-9]+      {yylval = atoi(yytext); return INTEGER;}
[-+=()*^/<>,;#\[\]\n]    {return *yytext;}


"=="		return EQUAL;
":="		return ASSIGN;
":=:"		return SWAP;
"<="		return LESSEQ;
">="		return BIGEQ;
",...,"		return ELLIPSIS;



[ \t]     	;
.			yyerror("unknown");

%%
int main(argc, argv) int argc; char **argv;{

/*read in new file*/
if(argc > 1) {
    if(!(yyin = fopen(argv[1], "r"))) {
        perror(argv[1]);
        return (1);
    }
}
    yyparse();
    return 0;
}


void checkas(char a){
	printf("%s", a);
}

int yywrap(){
	return 1;
}