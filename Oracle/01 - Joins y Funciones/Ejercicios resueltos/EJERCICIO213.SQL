-- Redondear al año
SELECT ROUND(SYSDATE, 'YEAR') AS Redondear_Al_Anio FROM DUAL
/

-- Truncar al año
SELECT TRUNC(SYSDATE, 'YEAR') AS Truncar_Al_Anio FROM DUAL
/

-- Redondear con fecha = 01-07-2024
SELECT ROUND(TO_DATE('01-07-2024','DD-MM-YYYY'), 'YEAR') AS "REDONDERA AL ANIO"
FROM DUAL
/

-- Truncar con fecha= 01-07-2024
SELECT TRUNC(TO_DATE('01-07-2024','DD-MM-YYYY'), 'YEAR') AS "TRUNCAR AL ANIO"
FROM DUAL
/


-- Redondear con fecha = 01-03-2024
SELECT ROUND(TO_DATE('01-03-2024','DD-MM-YYYY'), 'YEAR') AS "REDONDERA AL ANIO"
FROM DUAL
/

--Truncar con fecha = 01-03-2024
SELECT TRUNC(TO_DATE('01-03-2024','DD-MM-YYYY'), 'YEAR') AS "TRUNCAR AL ANIO"
FROM DUAL
/



