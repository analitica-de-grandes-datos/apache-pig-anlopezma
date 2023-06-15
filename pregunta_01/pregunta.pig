/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
l= LOAD 'data.tsv' USING PigStorage ('\t')
      AS (letra: chararray, fecha: chararray, numero: int);

group_data= GROUP data BY SUBSTRING ( letra, 0, 1);
count_data= FOREACH grouped_data GENERATE group AS letter, COUNT(data) AS count;

STORE count_data INTO 'output' USING PigStorage(',');
