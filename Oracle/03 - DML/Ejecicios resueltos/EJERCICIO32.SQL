INSERT INTO B_EMPLEADOS (
  CEDULA,
  NOMBRE,
  APELLIDO,
  FECHA_ING,
  FECHA_NACIM,
  CEDULA_JEFE,
  TELEFONO,
  DIRECCION,
  BARRIO,
  ID_LOCALIDAD
)
VALUES (
  123,
  'MARCIO',
  'BALMACEDA',
  SYSDATE,
  TO_DATE('04-02-1970', 'DD-MM-YYYY'),
  (SELECT E.CEDULA
   FROM B_EMPLEADOS E 
   WHERE UPPER(E.NOMBRE) LIKE 'JOS_%' AND UPPER(E.APELLIDO) LIKE 'CANIZA%'
   AND ROWNUM = 1),
  (SELECT DISTINCT E.TELEFONO
   FROM B_EMPLEADOS E
   WHERE UPPER(E.APELLIDO) = 'BALMACEDA'),
  (SELECT DISTINCT E.DIRECCION
   FROM B_EMPLEADOS E
   WHERE UPPER(E.APELLIDO) = 'BALMACEDA'),
  (SELECT DISTINCT E.BARRIO
   FROM B_EMPLEADOS E
   WHERE UPPER(E.APELLIDO) = 'BALMACEDA'),
  (SELECT DISTINCT E.ID_LOCALIDAD
   FROM B_EMPLEADOS E
   WHERE UPPER(E.APELLIDO) = 'BALMACEDA')
);

/*SELECT 123,
  'MARCIO',
  'BALMACEDA',
  SYSDATE,
  TO_DATE('04-02-1970', 'DD-MM-YYYY'),
  (SELECT E.CEDULA
   FROM B_EMPLEADOS E 
   WHERE UPPER(E.NOMBRE) LIKE 'JOS_%' AND UPPER(E.APELLIDO) LIKE 'CANIZA%'
   AND ROWNUM = 1),
   TELEFONO,
   DIRECCION,
   BARRIO,
   ID_LOCALIDAD
FROM B_EMPLEADOS
WHERE UPPER(APELLIDO) = 'BALMACEDA' AND ROWNUM = 1; */