INSERT INTO B_AREAS(ID,NOMBRE_AREA,FECHA_CREA,ACTIVA,ID_AREA_SUPERIOR)
VALUES((SELECT MAX(A.ID)
	FROM B_AREAS A)+1,
	'Auditoría',
	SYSDATE,
	'S',
	(SELECT A.ID
	FROM B_AREAS A
	WHERE UPPER(A.NOMBRE_AREA)='GERENCIA ADMINISTRATIVA')
)

/