/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
l= LOAD 'data.tsv' USING PigStorage ('\t')
     AS (letra: chararray, tupla:bag{}, lista:map[];
         
table = FOREACH l GENERATE LETRA, SIZE(tupla) as cant1, SIZE(lista) as cant2;
sorted_table = ORDER table BY letra, cant1, cant2;
STORE sorted_table INTO 'output' USING PigStorage(',');
