/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u
   WHERE 
       color REGEXP 'blue|green';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

l= LOAD 'data.tsv' USING PigStorage (',') AS (col1: Int, col2: chararray, col3: chararray, col4: chararray, col5: chararray, col6: Int);
filtered_data = FILTER l BY color MATCHES 'blue|green';
result = FOREACH filtered_data GENERATE firstname, color;
STORE result INTO 'output' USING PigStorage(',');
