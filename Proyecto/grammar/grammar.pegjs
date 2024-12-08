//DEFINIENDO EXPRESIONES DE PARSEO

expression = parsing_expression +

parsing_expression
  = ID !ASSIGN //si o si
  / paren_exp
  / Literal // si o si
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
