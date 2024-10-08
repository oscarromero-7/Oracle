SELECT L.ID AS "ID LOCALIDAD",
	L.NOMBRE AS "LOCALIDAD",
	COUNT(DECODE(P.ES_CLIENTE,'S',1,NULL)) AS "CANTIDAD CLIENTES"
FROM B_PERSONAS P
RIGHT OUTER JOIN B_LOCALIDAD L ON  L.ID = P.ID_LOCALIDAD 
GROUP BY L.ID,L.NOMBRE
/
