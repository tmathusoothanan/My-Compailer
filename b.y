%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<math.h>
	
	void fwhile();
	void fif();
	void lesq(int name, int count);
	void bigq(int name, int count);
	void equal(int name, int count);
	void print(int ab);
	void veriableDeclare(int a, int b);
	void createclass(int a);
	void close();
	void inc(int a);
	int yylex(void);
	void yyerror(char *);
	int sym[26];
	int b[15];
	
%}


%token INTEGER VARIABLE WHILE IF ASSIGN SWAP LESSEQ BIGEQ ELLIPSIS PRINT CLASS CLOSE EQUAL INC
%left '+' '-'
%left '*' '/'


%%
program : program statment '\n'
		|
		;
		
statment : expr										
		| VARIABLE '=' expr							{sym[$1] = $3;veriableDeclare($1, $3);}
		| WHILE 									{fwhile();}
		| IF										{fif();}
		| PRINT '(' expr ')'						{print($3);}
		| CLASS '(' VARIABLE ')'					{createclass($3);}
		| CLOSE										{close();}
		| LESSEQ '(' VARIABLE ')' expr				{lesq($3 , $5);}
		| BIGEQ '(' VARIABLE ')' expr				{lesq($3 , $5);}
		| EQUAL '(' VARIABLE ')' expr				{equal($3 , $5);}
		| INC '(' VARIABLE ')'						{inc($3);}
		;
expr : INTEGER 
	 | VARIABLE				{$$ = sym[$1];}
	 | expr '+' expr		{$$ = $1 + $3;}
	 | expr '-' expr		{$$ = $1 - $3;}
	 | expr '*' expr		{$$ = $1 * $3;}
	 | expr '/' expr		{$$ = $1 / $3;}
	 | expr '^'	expr		{$$ = pow($1,$3);}
	 | '(' expr ')'         {$$ = $2;}
	 ;
  
%%

void fwhile(){
		FILE * fp;
		fp = fopen("C:\\Users\\User\\Desktop\\l.java","a");
		fprintf(fp , "while(");
		fclose(fp);
}

void fif(){
	FILE * fp;
	fp = fopen("C:\\Users\\User\\Desktop\\l.java","a");
	fprintf(fp , "if(");
	fclose(fp);
}

void lesq(int name, int count){
	int c = name+97;
	FILE * fp;
	fp = fopen("C:\\Users\\User\\Desktop\\l.java","a");
	fprintf(fp , "%c <= %d) {\n",c,count);
	fclose(fp);
}

void bigq(int name, int count){
	int c = name+97;
	FILE * fp;
	fp = fopen("C:\\Users\\User\\Desktop\\l.java","a");
	fprintf(fp , "%c >= %d) {\n",c,count);
	fclose(fp);
}

void equal(int name, int count){
	int c = name+97;
	FILE * fp;
	fp = fopen("C:\\Users\\User\\Desktop\\l.java","a");
	fprintf(fp , "%c == %d) {\n",c,count);
	fclose(fp);
}

void print(int ab){
		FILE * fp;
		fp = fopen("C:\\Users\\User\\Desktop\\l.java","a");
		fprintf(fp , "\tSystem.out.println(\"%d\");\n", ab);
		fclose(fp);
}

void veriableDeclare(int a, int b){
		int c = a+97;
		FILE * fp;
		fp = fopen("C:\\Users\\User\\Desktop\\l.java","a");
		fprintf(fp , "\tint %c = %d;\n", c, b);
		fclose(fp);
}

void createclass(int a){
		int c = a+65;
		FILE * fp;
		fp = fopen("C:\\Users\\User\\Desktop\\l.java","a");
		fprintf(fp , "public class %c{\n \t public static void main (String[] args){\n ",c);
		fclose(fp);
}

void close(){
		FILE * fp;
		fp = fopen("C:\\Users\\User\\Desktop\\l.java","a");
		fprintf(fp , "\n}\n");
		fclose(fp);
}

void inc(int a){
	int c = a+97;
	FILE * fp;
	fp = fopen("C:\\Users\\User\\Desktop\\l.java","a");
	fprintf(fp , "%c++;",c);
	fclose(fp);
	
}


void yyerror(char *msg) {
	fprintf(stderr, "%s\n", msg);
}