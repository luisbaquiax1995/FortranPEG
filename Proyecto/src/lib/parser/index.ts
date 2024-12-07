import * as Parser from './peg-parser';
import { SyntaxError } from './peg-parser';

export default function parseInput(input: string) {
    try {
        Parser.parse(input);
        return 'La entrada fue analizada correctamente';
    } catch (e) {
        
        if (e instanceof SyntaxError) {
            return `Error de sintaxis en la línea ${e.location.start.line}, columna ${e.location.start.column}: ${e.message}`;
            
        }
        return `Error inesperado: ${e}`;
    }
}