/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_ERGPARS_TAB_H_INCLUDED
# define YY_YY_ERGPARS_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    WORKBOOK = 258,
    CLOSING_WORKBOOK = 259,
    STYLES = 260,
    CLOSING_STYLES = 261,
    STYLE = 262,
    CLOSING_STYLE = 263,
    WORKSHEET = 264,
    CLOSING_WORKSHEET = 265,
    TABLE = 266,
    CLOSING_TABLE = 267,
    COLUMN = 268,
    ROW = 269,
    CLOSING_ROW = 270,
    CELL = 271,
    CLOSING_CELL = 272,
    DATA = 273,
    CLOSING_DATA = 274,
    ID = 275,
    EXPANDEDCOLUMNCOUNT = 276,
    EXPANDEDROWCOUNT = 277,
    HIDDEN = 278,
    PROTECTED = 279,
    NAME = 280,
    WIDTH = 281,
    STYLEID = 282,
    HEIGHT = 283,
    MERGEACROSS = 284,
    MERGEDOWN = 285,
    TYPE = 286,
    NUMBER = 287,
    DATETIME = 288,
    BOOLEAN = 289,
    STRING = 290,
    CLOSED = 291,
    SLASH = 292,
    NUM = 293,
    CLOSING_COLUMN = 294,
    CLOSE = 295,
    EQUAL = 296,
    STRINGDATA = 297
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_ERGPARS_TAB_H_INCLUDED  */
