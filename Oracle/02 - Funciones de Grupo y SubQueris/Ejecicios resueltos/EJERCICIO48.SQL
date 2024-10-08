COL ID FORMAT A15
SELECT 
LPAD(' ', 5* (LEVEL-1)) || TO_CHAR(BAR.ID,'000009') ID, 
BAR.NOMBRE_AREA,
(SELECT COUNT (CEDULA) CANTIDAD
 FROM B_AREAS A
 LEFT JOIN B_POSICION_ACTUAL P
 ON A.ID=P.ID_AREA AND P.FECHA_FIN IS NULL
 WHERE A.ID = BAR.ID
 GROUP BY A.ID
 ) CANTIDAD,
(SELECT SUM(CANTIDAD)
 FROM (SELECT A.ID, A.ID_AREA_SUPERIOR,A.NOMBRE_AREA, COUNT (CEDULA) CANTIDAD
 FROM B_AREAS A
 LEFT JOIN B_POSICION_ACTUAL P
 ON A.ID=P.ID_AREA AND P.FECHA_FIN IS NULL
 GROUP BY A.ID, A.ID_AREA_SUPERIOR,A.NOMBRE_AREA 
 )A
 CONNECT BY PRIOR A.ID = A.ID_AREA_SUPERIOR
 START WITH A.ID = BAR.ID 
) CANTIDAD_TOTAL
FROM B_AREAS BAR
CONNECT BY PRIOR BAR.ID = BAR.ID_AREA_SUPERIOR
START WITH BAR.ID_AREA_SUPERIOR IS NULL
/

