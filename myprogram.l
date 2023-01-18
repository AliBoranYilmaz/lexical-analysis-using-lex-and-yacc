%{
#include <stdio.h>
int lineno;
%}

%%
START				return START;
END				return END;
\;				return SEMICOLON;
integer				return INT;
float				return FLOAT;
string				return STR;
and				return AND_OPERATOR;
or				return OR_OPERATOR;
\=				return ASSIGNMENT;
is				return EQUAL;
if				return IF;
else				return ELSE;
while				return WHILE;
\(				return LEFTPAR;
\)				return RIGHTPAR;
\{				return LEFT_CURLY;
\}				return RIGHT_CURLY;
\+				return PLUS;
\-				return MINUS;
\*				return MULTIPLICATE;
\/				return DIVIDE;
\<				return LESS_THAN;
\>				return GREATER_THAN;
\!=				return NOT_EQUAL;
\\n				{extern int lineno; lineno++; return NEWLINE;}
[a-zA-Z]([a-zA-Z]|[0-9])*	return IDENTIFIER;
[+-]?[0-9]+			return INTNUMBER;
[+-]?[0-9]*(\.)?[0-9]+		return FLOATNUMBER;
\"(.)*\"			return STRING;
[ \t\n]				; //ignoring whitespace
	
%%

int yywrap(void)
{
	return 1;
}

