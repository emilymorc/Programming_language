/**Seccion de  definiciones**/

%{

#include "milenguaje.tab.h"

%}

/**Seccion de reglas**/

/**Definicion de patrones regulares**/

digito [0-9]

identificador [a-z][a-zA-Z0-9]{0,15}

char \¡[a-zA-Z]\!

variableEnMayuscula [A-Z][a-zA-Z]{0,15}



%%


{char}						{return CHA;}

{digito}+					{return INT;}

{digito}+\.{digito}*				{return FLO;}

global						{return GLO;}

intimate					{return PRI;}

module						{return MDL;}

yes						{return CIF;}

so						{return CEL;}

yesnt						{return CFN;}

close						{return CLS;}

expropia					{return IMP;}

lemandan					{return RTN;}

nd						{return NAD;}

Vocablo						{return VOC;}

vocablito					{return VCB;}

nat						{return NAT;}

siono						{return SIO;}

natGrandote					{return NAG;}

diezimal					{return DIE;}

sisepuede					{return CTR;}

nosepudo					{return CCA;}

Exception					{return EXC;}

afinde						{return AFD;}

hastaQ 						{return HTQ;}

hastaQnt 					{return HQN;}

real 						{return RAL;}

fake 						{return FAK;}

quieto 						{return STT;}

{identificador}					{return VAR;}

{variableEnMayuscula}				{return VPM;}

":v"						{return CCC;}

=						{return ASG;}

:						{return DPT;}

==						{return IGU;}

"+"						{return MAS;}

"-"						{return MEN;}

"*" 						{return ATR;}

"/" 						{return DIV;}

"++"						{return MMA;}

"--"						{return MNE;}

"<="						{return MEQ;}

">="						{return MAQ;}

!=						{return DIF;}

\(						{return APT;}

\)						{return CPT;}

\{						{return ACH;}

\}						{return CCH;}



[a-z]+(\.[a-z]+){0,6}				{return CIM;}



\|\*([^*]|[*][^|])*\*\|				{/*Ignorar Comentarios*/}


[ \t\n]						{/*ingonar espacios*/}

.						{printf("Error Lexico: %s\n",yytext);}

%%

/**Sección de codigo de usuario**/
