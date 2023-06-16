/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
l= LOAD 'data.tsv' USING PigStorage ('\t')
     AS (letra: chararray, fecha: chararray, numero: int);

order_data = ORDER l BY numero;
result= FOREACH order_data GENERATE $2;
result= LIMIT result 5;
STORE result INTO 'output' USING PigStorage(',');
