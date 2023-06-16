/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
salida esperada es la siguiente:

  (Hamilton)
  (Holcomb)
  (Garrett)
  (Fry)
  (Kinney)
  (Klein)
  (Diaz)
  (Guy)
  (Estes)
  (Jarvis)
  (Knight)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
l= LOAD 'data.tsv' USING PigStorage (',') AS (col1: chararray, col2: chararray, col3: chararray, col4: chararray, col5: chararray, col6: Int);
filtered_data= FILTER l BY SUBSTRING(col3,0,1) MATCHES '[D-K]';
apellidos= FOREACH filtered_data GENERATE col3;
STORE apellidos INTO 'output' USING PigStorage(',');
