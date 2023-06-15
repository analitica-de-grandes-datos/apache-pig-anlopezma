/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
l= LOAD 'data.tsv' USING PigStorage ('\t')
     AS (letra: chararray, tupla:bag{}, lista:map[];
table0 = FOREACH l GENERATE FLATTEN (tupla) AS letra, FLATTEN (lista) AS lisletras;
grouped_table= GROUP table0 BY (letra, lisletras);
result= FOREACH grouped_table GENERATE group, COUNT(table0);
STORE result INTO 'output' USING PigStorage(','); 
