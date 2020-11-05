%{
#include "ergpars.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int LineNumber;

%}

whitespace [ \t]
newline [\n]

%%

"<ss:Workbook>" 	{printf("%s", yytext); return WORKBOOK;}
"</ss:Workbook>" 	{printf("%s", yytext); return CLOSING_WORKBOOK;}

"<ss:Styles" 		{printf("\t" "%s", yytext); return STYLES;}
"</ss:Styles>"		{printf("\t" "%s", yytext); return CLOSING_STYLES;}

"<ss:Style" 		{printf("\t" "\t" "%s", yytext); return STYLE;}
"</ss:Style>" 		{printf("%s", yytext); return CLOSING_STYLE;}

"<ss:Worksheet"		{printf("\t" "%s", yytext); return WORKSHEET;}
"</ss:Worksheet>" 	{printf("\t" "%s", yytext); return CLOSING_WORKSHEET;}

"<ss:Table"		{printf("\t" "\t" "%s", yytext); return TABLE;}
"</ss:Table>" 		{printf("\t" "\t" "%s", yytext); return CLOSING_TABLE;}

"<ss:Column" 		{printf("\t" "\t" "\t" "%s", yytext); return COLUMN;}
"/>"			{printf("%s", yytext); return CLOSING_COLUMN;}

"<ss:Row" 		{printf("\t" "\t" "\t" "%s", yytext); return ROW;}
"</ss:Row>"		{printf("\t" "\t" "\t" "%s", yytext); return CLOSING_ROW;}

"<ss:Cell"		{printf("\t" "\t" "\t" "\t" "%s", yytext); return CELL;}
"</ss:Cell>"		{printf("\t" "\t" "\t" "\t" "%s", yytext); return CLOSING_CELL;}

"<ss:Data"		{printf("\t" "\t" "\t" "\t" "\t" "%s", yytext); return DATA;}
"</ss:Data>"		{printf("%s", yytext); return CLOSING_DATA;}

	
"ss:ID"				{printf("%s", yytext); return ID;} 
"ss:ExpandedColumnCount" 	{printf("%s", yytext); return EXPANDEDCOLUMNCOUNT;}
"ss:ExpandedRowCount"		{printf("%s", yytext); return EXPANDEDROWCOUNT;}
"ss:Protected"			{printf("%s", yytext); return PROTECTED;}
"ss:Name"			{printf("%s", yytext); return NAME;}
"ss:StyleID" 			{printf("%s", yytext); return STYLEID;}
"ss:Height" 			{printf("%s", yytext); return HEIGHT;}
"ss:MergeAcross"		{printf("%s", yytext); return MERGEACROSS;}
"ss:MergeDown"			{printf("%s", yytext); return MERGEDOWN;}
"ss:Type"			{printf("%s", yytext); return TYPE;}
"ss:Width"			{printf("%s", yytext); return WIDTH;}
"ss:Hidden"			{printf("%s", yytext); return HIDDEN;}


"\"Number\"" 		{printf("%s", yytext); return NUMBER;}
"\"DateTime\"" 		{printf("%s", yytext); return DATETIME;}
"\"Boolean\"" 		{printf("%s", yytext); return BOOLEAN;}
"\"String\"" 		{printf("%s", yytext); return STRINGDATA;}
">" 			{printf("%s", yytext); return CLOSE;}
"/"			{printf("%s", yytext); return '/';}
"="			{printf("%s", yytext); return EQUAL;}
"<"			{printf("%s", yytext); return '<';}
\"[0-9][0-9]*\" 	{printf("%s", yytext); return NUM;}
\"[^'\n]*\" 		{printf("%s", yytext); return STRING;} 

{whitespace}        {printf(" "); }
{newline}       {printf("\n"); LineNumber++; }
"<!--"[^-\n]*'-'+[^-\n]*\n"-->"        {printf("%s",yytext); } 
%%
