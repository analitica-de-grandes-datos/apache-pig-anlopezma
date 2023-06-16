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
   WHERE color = 'blue' OR firstname LIKE 'K%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/
l= LOAD 'data.tsv' USING PigStorage (',') AS (col1: int, col2: chararray, col3: chararray, col4: chararray, col5: chararray, col6: Int);
result= FOREACH l GENERATE col2, col5;
result = FILTER result BY (SUBSTRING(col2,0,1) MATCHES '[K]') OR (col5 MATCHES 'blue');
STORE result INTO 'output' USING PigStorage(',');
