COL "LOCALIDAD" FORMAT A20
COL "TELEFONO" FORMAT A15
COL "NOMBRE Y APELLIDO" FORMAT A20
SET LINESIZE 100
SELECT L.NOMBRE AS "LOCALIDAD",
	P.NOMBRE ||' '|| P.APELLIDO AS "NOMBRE Y APELLIDO",
	P.DIRECCION AS "DIRECCION",
	P.TELEFONO AS "TELEFONO"
FROM B_PERSONAS P
RIGHT OUTER JOIN B_LOCALIDAD L ON  L.ID = P.ID_LOCALIDAD 
ORDER BY L.NOMBRE,P.APELLIDO
/
