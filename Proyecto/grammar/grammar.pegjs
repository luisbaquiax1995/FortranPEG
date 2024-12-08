
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
