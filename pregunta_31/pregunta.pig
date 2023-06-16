/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

l= LOAD 'data.tsv' USING PigStorage (',') AS (col1: Int, col2: chararray, col3: chararray, col4: chararray, col5: chararray, col6: Int);

year_count = FOREACH l GENERATE SUBSTRING(birthday, 0, 4) AS year;
grouped_data = GROUP year_count BY year;
count_by_year = FOREACH grouped_data GENERATE group AS year, COUNT(year_count) AS count;
STORE count_by_year INTO 'output' USING PigStorage(',');
