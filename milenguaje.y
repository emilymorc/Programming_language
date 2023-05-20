/**S definiciones**/

%{

#include <stdio.h>

#include <stdlib.h>

extern int yylex(void);

extern FILE *yyin;

void yyerror(char *s);

%}



%token INT FLO CIF CEL IGU MEQ MAQ DIF APT CPT ACH CCH CFN GLO VPM VAR MDL CLS CCC IMP CIM PRI NAD VOC VCB NAT SIO NAG DIE RTN CTR CCA AFD EXC ASG DPT MMA MNE HTQ HQN RAL FAK ATR CHA MAS MEN DIV STT



/**S de reglas**/

%%



inicio  : 					

	| GLO MDL VPM ACH linea CCH CCC		{printf("Lenguaje Correcto!\n");}



linea	:		 

     	| linea import			{printf("import Correcto!\n");}

   	| linea def_var			

     	| linea method			{printf("Metodo Correcto!\n");}

    		



import  : IMP CIM CCC



method  : visibility NAD VAR APT CPT ACH in_method CCH

	| visibility values APT CPT ACH in_method RTN VAR CCC CCH

	

	

in_method : 

	  | in_method def_var	 

	  | in_method ifs

	  | in_method trycatch	  	

	  | in_method for

	  | in_method while	  

    	  | in_method VAR ASG artim CCC 	      	  

   	  | in_method VAR ASG true_false CCC 	

   	  | in_method VAR ASG CHA CCC   	  

   	  | in_method VAR ASG ATR VAR ATR CCC 	   	  

  	  | in_method VAR masmenos CCC 	  

 





ifs	: ifsim			{printf("if Correcto!\n");}

	| ifelse		{printf("if/else Correcto!\n");}





   	

ifsim   : CIF APT cond CPT ACH in_method CCH CFN 

	| CIF APT condword CPT ACH in_method CCH CFN              



ifelse	: CIF APT cond CPT ACH in_method CCH CEL ACH in_method CCH CFN

	| CIF APT condword CPT ACH in_method CCH CEL ACH in_method CCH CFN





for     : AFD APT valuesnumb VAR ASG artim DPT cond DPT VAR masmenos CPT ACH in_method CCH 	{printf("For Correcto!\n");}



while   : HTQ APT cond CPT ACH in_method CCH HQN 					{printf("While Correcto!\n");}



trycatch  : CTR ACH in_method CCH CCA APT EXC VAR CPT ACH in_method CCH    		{printf("try/catch Correcto!\n");}



def_var   : visibility values CCC							{printf("Definicion de variable Correcta!\n");}

	  | visibility valuesnumb VAR ASG artim CCC					{printf("Definicion de variable con entero Correcta!\n");}		  

  	  | visibility valuesFlot VAR ASG artimflo CCC					{printf("Definicion de variable con flotante Correcta!\n");}  	  

  	  | visibility valuesbool VAR ASG true_false CCC				{printf("Definicion de variable con booleano Correcta!\n");}	

  	  | visibility VOC VAR ASG ATR VAR ATR CCC					{printf("Definicion de variable con String Correcta!\n");}  	  

  	  | visibility VCB VAR ASG CHA CCC						{printf("Definicion de variable con char Correcta!\n");}  	  

	  | STT visibility valuesnumb VAR ASG artim CCC					{printf("Definicion de Constante con entero Correcta!\n");}		  

  	  | STT visibility valuesFlot VAR ASG artimflo CCC					{printf("Definicion de Constante con entero Correcta!\n");}		  

  	  | STT visibility valuesbool VAR ASG true_false CCC				{printf("Definicion de Constante con booleano Correcta!\n");}	

  	  | STT visibility VOC VAR ASG ATR VAR ATR CCC					{printf("Definicion de Constante con String Correcta!\n");}  	  

  	  | STT visibility VCB VAR ASG CHA CCC						{printf("Definicion de Constante con char Correcta!\n");}  	    	    	    	    	  





true_false : RAL

  	   | FAK		



masmenos : MMA

	 | MNE	



visibility 	: GLO

		| PRI	

	

	

cond	    : VAR IGU artim

	    | VAR MEQ artim

	    | VAR MAQ artim

	    | VAR DIF artim

	    | VAR IGU artimflo

	    | VAR MEQ artimflo

	    | VAR MAQ artimflo

	    | VAR DIF artimflo

	    

condword    : VAR IGU VAR

	    | VAR IGU ATR VAR ATR    

    	



values 		: valuesnumb VAR

		| valuesFlot VAR	

		| valuesbool VAR		

		| VOC VAR	

		| VCB VAR	



			    

valuesbool	: SIO

		

valuesnumb	: NAT

		| NAG



valuesFlot	: DIE	



artim	 	: artim MAS artim   

    		| artim MEN artim   

		| artim ATR artim   

		| artim DIV artim   

     		| APT artim CPT    

		| INT               	

		

artimflo 	: artimflo MAS artimflo   

    		| artimflo MEN artimflo   

		| artimflo ATR artimflo   

		| artimflo DIV artimflo   

     		| APT artimflo CPT        

		| FLO 		

     						   

%%

/**S codigo de usuario**/

void yyerror(char *s){

	printf("Error : %s\n", s);

}



int main(int argc, char **argv){

	printf("Inicio del programa: \n");

	if(argc>1)

		yyin=fopen(argv[1],"rt");

	else

		yyin=stdin;

	yyparse();

	return 0;

}