DELETE FROM B_ARTICULOS A
WHERE NOT EXISTS (
    SELECT DV.ID_ARTICULO
    FROM B_DETALLE_VENTAS DV
    WHERE DV.ID_ARTICULO = A.ID
) AND NOT EXISTS (
    SELECT DC.ID_ARTICULO
    FROM B_DETALLE_COMPRAS DC
    WHERE DC.ID_ARTICULO = A.ID
)

/
