COL CEDULA FORMAT A50
SELECT LPAD(' ', 6* (LEVEL-1)) || TO_CHAR(E.CEDULA) CEDULA, 
	E.NOMBRE,
	E.APELLIDO
FROM B_EMPLEADOS E 
CONNECT BY PRIOR E.CEDULA = E.CEDULA_JEFE
START WITH UPPER(E.NOMBRE) LIKE 'JOS_%' AND UPPER(E.APELLIDO) LIKE 'CANIZA%';
/
