/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

l= LOAD 'data.tsv' USING PigStorage ('\t')
     AS (letra: chararray, tupla:bag{}, lista:map[];
l = FOREACH l GENERATE FLATTEN (lista) as listasep;
l = FOREACH (GROUP datos BY listasep) GENERATE group, COUNT (datos.listasep);
STORE l INTO 'output' USING PigStorage(','); 
