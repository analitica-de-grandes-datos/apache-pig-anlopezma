/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       birthday, 
       DATE_FORMAT(birthday, "yyyy"),
       DATE_FORMAT(birthday, "yy"),
   FROM 
       persons
   LIMIT
       5;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

l= LOAD 'data.tsv' USING PigStorage (',') AS (col1: Int, col2: chararray, col3: chararray, col4: chararray, col5: chararray, col6: Int);

result = FOREACH l GENERATE CONCAT(SUBSTRING(col4,0,4), ',', SUBSTRING(col4,2,4));
STORE result INTO 'output' USING PigStorage(',');
