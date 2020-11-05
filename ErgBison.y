%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void yyerror(char *s);
extern char* yytext;
int LineNumber=1;
int NofErrors;
extern FILE *yyin;
int yylex();

%}
%token WORKBOOK
%token CLOSING_WORKBOOK
%token STYLES
%token CLOSING_STYLES
%token STYLE
%token CLOSING_STYLE
%token WORKSHEET
%token CLOSING_WORKSHEET
%token TABLE
%token CLOSING_TABLE
%token COLUMN
%token ROW
%token CLOSING_ROW
%token CELL
%token CLOSING_CELL
%token DATA
%token CLOSING_DATA
%token ID
%token EXPANDEDCOLUMNCOUNT
%token EXPANDEDROWCOUNT
%token HIDDEN
%token PROTECTED
%token NAME
%token WIDTH
%token STYLEID
%token HEIGHT
%token MERGEACROSS
%token MERGEDOWN
%token TYPE
%token NUMBER
%token DATETIME
%token BOOLEAN
%token STRING
%token CLOSED
%token SLASH
%token NUM
%token CLOSING_COLUMN
%token CLOSE
%token EQUAL
%token STRINGDATA
%%



ARXEIO : WORKBOOK WorkbookPer CLOSING_WORKBOOK ;

WorkbookPer : StylesMore2 WorksheetMore | WorksheetMore ;

StylesMore2 : StylesMain | StylesMore2 StylesMain ;

StylesMain : STYLES CLOSE StylesMore CLOSING_STYLES ;

StylesMore : StyleMain | StylesMore StyleMain ;

StyleMain : STYLE ID EQUAL STRING CLOSE CLOSING_STYLE ;

WorksheetMore : WorksheetMain | WorksheetMore WorksheetMain ;

WorksheetMain : WORKSHEET WorksheetPer CLOSE TableForWork CLOSING_WORKSHEET ;

WorksheetPer : NAME EQUAL STRING | NAME EQUAL STRING PROTECTED EQUAL BOOL ;

TableForWork : %empty | TableMain | TableForWork TableMain ;

TableMain : TABLE EpipleonTable CLOSE ColumnHelp RowHelp CLOSING_TABLE ; 

EpipleonTable : EXPANDEDROWCOUNT EQUAL NUM | STYLEID EQUAL STRING | EXPANDEDCOLUMNCOUNT EQUAL NUM ;

ColumnHelp : %empty | ColumnMain | ColumnHelp ColumnMain;

RowHelp: %empty | RowMain | RowHelp RowMain ;

ColumnMain : COLUMN ColumnMore CLOSING_COLUMN ;

ColumnMore : STYLEID EQUAL STRING | HIDDEN EQUAL BOOL | WIDTH EQUAL NUM ;

RowMain : ROW RowMore CLOSE CellMore  CLOSING_ROW ; 

RowMore : %empty | HEIGHT EQUAL NUM | HIDDEN EQUAL BOOL | STYLEID EQUAL STRING ;

CellMore : %empty | CellMain | CellMore CellMain ;

CellMain : CELL CLOSE DataMore CLOSING_CELL | CELL DataMore CellPer CLOSING_CELL;

DataMore : %empty | DataMain | DataMore DataMain ;

DataMain : DATA TYPE EQUAL TypeforData CLOSE DataMore CLOSING_DATA ;

TypeforData: NUMBER | STRINGDATA | BOOLEAN | DATETIME ;

DataMore : "string data" | NUM | "datetime data" | "boolean data" ;

CellPer : MERGEACROSS EQUAL NUM MERGEDOWN EQUAL NUM STYLEID EQUAL STRING;

BOOL : "TRUE" | "FALSE"

%%

void yyerror(char *s) {
	printf("Errors In Line %d \n",LineNumber);
	NofErrors++;
}

int main(int argc, char* argv[]) {

	FILE *file;
	if ( file = fopen(argv[1], "r" ))
	{
		yyin = file;
		yyparse();
		if (NofErrors==0) printf("Correct!\n");
			return 0;
		}else{
			printf("File Not Here\n");}
	}

