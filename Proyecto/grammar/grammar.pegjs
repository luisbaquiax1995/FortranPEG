//DEFINIENDO LAS PRODUCCIONES Y LA GRAMATICA

grammar 
  = __ (production __)+

production 
  = ID ASSIGN expression SEMI?

expression 
  = concatenation (SLASH concatenation)*

concatenation
  = element+

element
  = parsing_expression (QUESTION / STAR / PLUS)?

//DEFINIENDO EXPRESIONES DE PARSEO

parsing_expression
  = ID !ASSIGN 
  / paren_exp
  / Literal 
  / range
  
paren_exp = OPEN expression CLOSE

ID      = [a-zA-Z_] [a-zA-Z0-9_]* __

Literal =  ['] (!['] ( ![\\] Char / scape))* ['] __
        / ["] (!["] ( ![\\] Char / scape))* ["] __

//DEFININIEDO ESPACIOS EN BLANCO, COMENTARIOS ESCAPES Y RANGOS

range   =  '[' (! ']' input_range)* ']' __

input_range   = scape
              / Char '-' Char 
              / Char


scape =  "\\" Char
Char           = ![\r\n] . 
ASSIGN   = '=' __
SLASH    = '/' __
QUESTION = '?' __
STAR     = '*' __
PLUS     = '+' __
OPEN     = '(' __
CLOSE    = ')' __
SEMI     = ';' __

__ "whitespace" = (Space / Comment)*

Space          = [ \t\r\n]+
Comment        = '#' (![\r\n] .)*  /  '//' (![\r\n] .)*
