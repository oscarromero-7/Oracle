SELECT C.CODIGO_CTA, C.NOMBRE_CTA
FROM B_CUENTAS C
WHERE C.IMPUTABLE = 'S' 
      AND NOT EXISTS (
          SELECT 1
          FROM B_DIARIO_DETALLE D
          WHERE D.CODIGO_CTA = C.CODIGO_CTA
      );
/
