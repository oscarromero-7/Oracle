COL "NOMBRE_APELLIDO" FORMAT A40
COL "NUMERO_FACTURA" FORMAT A20
INSERT INTO LIBRO_VENTAS_2018 (RUC, NOMBRE_APELLIDO, NUMERO_FACTURA, FECHA_VENTA, TIPO_VENTA, GRAVADO_10, IVA_10, GRAVADO_5, IVA_5, EXENTO, MONTO_TOTAL)
SELECT	DECODE(P.RUC,NULL,P.CEDULA,P.RUC) AS IDENTIFICACION,
	P.NOMBRE||' '||P.APELLIDO AS "NOMBRE_APELLIDO",
	'001-' || LPAD(TO_CHAR(P.ID_LOCALIDAD), 3, '0') || '-' || LPAD(TO_CHAR(V.NUMERO_FACTURA), 7, '0') AS NUMERO_FACTURA,
	V.FECHA,
	DECODE(V.TIPO_VENTA,'CO',1,'CR',2,0) AS TIPO_VENTA,
	DECODE(A.PORC_IVA,0.1,(DV.PRECIO*DV.CANTIDAD)-((DV.PRECIO*DV.CANTIDAD)/11),0) AS GRAVADO_10,
	DECODE(A.PORC_IVA,0.1,(DV.PRECIO*DV.CANTIDAD)-DV.PRECIO*DV.CANTIDAD/11*0,1,0) AS IVA_10,
	DECODE(A.PORC_IVA,0.05,(DV.PRECIO*DV.CANTIDAD)-((DV.PRECIO*DV.CANTIDAD)/21),0) AS GRAVADO_5,
	DECODE(A.PORC_IVA,0.05,((DV.PRECIO*DV.CANTIDAD)-((DV.PRECIO*DV.CANTIDAD)/11))*0,05),0) AS IVA_5,
	0 AS EXENTO,
	(DV.PRECIO*DV.CANTIDAD)-((DV.PRECIO*DV.CANTIDAD)/11) + (A.PORC_IVA,0.1,((DV.PRECIO*DV.CANTIDAD)-((DV.PRECIO*DV.CANTIDAD)/11)*0,1) + (DV.PRECIO*DV.CANTIDAD)-((DV.PRECIO*DV.CANTIDAD)/21) + ((DV.PRECIO*DV.CANTIDAD)-((DV.PRECIO*DV.CANTIDAD)/11)*0,05) AS MONTO_TOTAL,
	V.MONTO_TOTAL
FROM B_PERSONAS P 
INNER JOIN B_VENTAS V ON P.ID = V.ID_CLIENTE AND EXTRACT(YEAR FROM V.FECHA) = 2018 AND EXTRACT(MONTH FROM V.FECHA)=07
INNER JOIN B_DETALLE_VENTAS DV ON V.ID = DV.ID_VENTA
INNER JOIN B_ARTICULOS A ON DV.ID_ARTICULO = A.ID
/