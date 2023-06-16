/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código en Pig para manipulación de fechas que genere la siguiente 
salida.

   1971-07-08,jul,07,7
   1974-05-23,may,05,5
   1973-04-22,abr,04,4
   1975-01-29,ene,01,1
   1974-07-03,jul,07,7
   1974-10-18,oct,10,10
   1970-10-05,oct,10,10
   1969-02-24,feb,02,2
   1974-10-17,oct,10,10
   1975-02-28,feb,02,2
   1969-12-07,dic,12,12
   1973-12-24,dic,12,12
   1970-08-27,ago,08,8
   1972-12-12,dic,12,12
   1970-07-01,jul,07,7
   1974-02-11,feb,02,2
   1973-04-01,abr,04,4
   1973-04-29,abr,04,4

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
l= LOAD 'data.tsv' USING PigStorage (',') AS (col1: Int, col2: chararray, col3: chararray, col4: chararray, col5: chararray, col6: Int);

result_mes = FOREACH l GENERATE col4, LOWER(ToString(ToDate(col4, 'yyyy-MM-dd'), 'MMM')) AS mes;

result_mes = FOREACH result_mes GENERATE col4,
                     (CASE mes
                        WHEN 'jan' THEN 'ene'
                        WHEN 'feb' THEN 'feb'
                        WHEN 'mar' THEN 'mar'
                        WHEN 'apr' THEN 'abr'
                        WHEN 'may' THEN 'may'
                        WHEN 'jun' THEN 'jun'
                        WHEN 'jul' THEN 'jul'
                        WHEN 'aug' THEN 'ago'
                        WHEN 'sep' THEN 'sep'
                        WHEN 'oct' THEN 'oct'
                        WHEN 'nov' THEN 'nov'
                        WHEN 'dec' THEN 'dic'
                        ELSE mes
                     END),
                     ToString(ToDate(col4, 'yyyy-MM-dd'), 'MM'),
                     ToString(ToDate(col4, 'yyyy-MM-dd'), 'M');

STORE result_mes INTO 'output' USING PigStorage(',');
