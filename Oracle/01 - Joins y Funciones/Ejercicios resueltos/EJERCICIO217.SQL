COL "VENDEDOR" FORMAT A20
SELECT V.NUMERO_FACTURA AS "NRO FACTURA",
	E.NOMBRE || E.APELLIDO AS "VENDEDOR",
	DECODE(P.TIPO_PERSONA,'J',P.RUC,P.CEDULA) AS "RUC_CI",
	P.NOMBRE || P.APELLIDO AS "NOMBRE Y APELLIDO",
	V.PLAZO AS "CUOTA",
	PP.VENCIMIENTO AS "FECHA VTO",
	TO_CHAR(PP.MONTO_CUOTA,'999,999,999') AS "MONTO CUOTA",
	FLOOR(TO_DATE('31-12-2018','DD-MM-YYYY') - PP.VENCIMIENTO) AS "DIAS DE ATRASO",
	TO_CHAR(ROUND(((TO_DATE('31-12-2018','DD-MM-YYYY') - PP.VENCIMIENTO) * 0.005)*PP.MONTO_CUOTA),'999,999,999') AS "INTERES",
	TO_CHAR(PP.MONTO_CUOTA + ((TO_DATE('31-12-2018','DD-MM-YYYY') - PP.VENCIMIENTO) * 0.005)*PP.MONTO_CUOTA,'999,999,999') AS "MONTO A PAGAR"
FROM B_PLAN_PAGO PP
INNER JOIN B_VENTAS V ON V.ID = PP.ID_VENTA
INNER JOIN B_EMPLEADOS E ON E.CEDULA = V.CEDULA_VENDEDOR
INNER JOIN B_PERSONAS P ON P.ID = V.ID_CLIENTE 
WHERE EXTRACT(YEAR FROM V.FECHA) = 2018 AND PP.FECHA_PAGO IS NULL
ORDER BY FLOOR(TO_DATE('31-12-2018','DD-MM-YYYY') - PP.VENCIMIENTO) DESC
/
