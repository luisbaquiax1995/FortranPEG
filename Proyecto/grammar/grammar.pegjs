// Simple PEG Grammar
// ==========================

Grammar 
  = __ (Production __)+

Production 
  = ID ASSIGN Expression SEMI?

Expression 
  = Case (SLASH Case)*

Case
  = Section+

Section
  = (AND / NOT)? Element

Element
  = Primary (QUESTION / STAR / PLUS)?

Primary
  = ID !ASSIGN / OPEN Expression CLOSE / Literal / Class / DOT

// Literales y Clases
ID      = [a-zA-Z_] [a-zA-Z0-9_]* __
Literal = ['] (!['] Char)* ['] __
        / ["] (!["] Char)* ["] __
Class   = '[' (!']' Range)* ']' __
Range   = Char '-' Char / Char

// Operadores y paréntesis
ASSIGN   = '=' __
SLASH    = '/' __
AND      = '&' __
NOT      = '!' __
QUESTION = '?' __
STAR     = '*' __
PLUS     = '+' __
OPEN     = '(' __
CLOSE    = ')' __
DOT      = '.' __
SEMI     = ';' __ 

// Espaciado y comentarios
__ "whitespace" = (Space / Comment)*
Space          = [ \t\r\n]+
Comment        = '#' (![\r\n] .)*  /  '//' (![\r\n] .)*

// Caracteres Unicode válidos
Char           = ![\r\n] .  //falta arreglar

