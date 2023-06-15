/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
l= LOAD 'data.tsv' USING PigStorage ('\t')
     AS (letra: chararray, tupla:bag{}, lista:map[];

letter = FOREACH l GENERATE FLATTEN (tupla) as letter;

letter_counts = GROUP letters BY letter; 
letter_counts = FOREACH letter_counts GENERATE group AS letter, COUNT(letters) AS count;
STORE letter_counts INTO 'output' USING PigStorage(','); 
