COL "NOMBRE ARTICULO" FORMAT A18
SELECT
    A.NOMBRE AS "NOMBRE ARTICULO",
    SUM(CASE WHEN EXTRACT(YEAR FROM V.FECHA) = 2018 AND EXTRACT(MONTH FROM V.FECHA) = 1 THEN DV.CANTIDAD ELSE 0 END) AS ENE,
    SUM(CASE WHEN EXTRACT(YEAR FROM V.FECHA) = 2018 AND EXTRACT(MONTH FROM V.FECHA) = 2 THEN DV.CANTIDAD ELSE 0 END) AS FEB,
    SUM(CASE WHEN EXTRACT(YEAR FROM V.FECHA) = 2018 AND EXTRACT(MONTH FROM V.FECHA) = 3 THEN DV.CANTIDAD ELSE 0 END) AS MAR,
    SUM(CASE WHEN EXTRACT(YEAR FROM V.FECHA) = 2018 AND EXTRACT(MONTH FROM V.FECHA) = 4 THEN DV.CANTIDAD ELSE 0 END) AS ABR,
    SUM(CASE WHEN EXTRACT(YEAR FROM V.FECHA) = 2018 AND EXTRACT(MONTH FROM V.FECHA) = 5 THEN DV.CANTIDAD ELSE 0 END) AS MAY,
    SUM(CASE WHEN EXTRACT(YEAR FROM V.FECHA) = 2018 AND EXTRACT(MONTH FROM V.FECHA) = 6 THEN DV.CANTIDAD ELSE 0 END) AS JUN,
    SUM(CASE WHEN EXTRACT(YEAR FROM V.FECHA) = 2018 AND EXTRACT(MONTH FROM V.FECHA) = 7 THEN DV.CANTIDAD ELSE 0 END) AS JUL,
    SUM(CASE WHEN EXTRACT(YEAR FROM V.FECHA) = 2018 AND EXTRACT(MONTH FROM V.FECHA) = 8 THEN DV.CANTIDAD ELSE 0 END) AS AGO,
    SUM(CASE WHEN EXTRACT(YEAR FROM V.FECHA) = 2018 AND EXTRACT(MONTH FROM V.FECHA) = 9 THEN DV.CANTIDAD ELSE 0 END) AS SEP,
    SUM(CASE WHEN EXTRACT(YEAR FROM V.FECHA) = 2018 AND EXTRACT(MONTH FROM V.FECHA) = 10 THEN DV.CANTIDAD ELSE 0 END) AS OCT,
    SUM(CASE WHEN EXTRACT(YEAR FROM V.FECHA) = 2018 AND EXTRACT(MONTH FROM V.FECHA) = 11 THEN DV.CANTIDAD ELSE 0 END) AS NOV,
    SUM(CASE WHEN EXTRACT(YEAR FROM V.FECHA) = 2018 AND EXTRACT(MONTH FROM V.FECHA) = 12 THEN DV.CANTIDAD ELSE 0 END) AS DIC
FROM
    B_ARTICULOS A
LEFT OUTER JOIN
    B_DETALLE_VENTAS DV ON A.ID = DV.ID_ARTICULO
INNER JOIN
    B_VENTAS V ON DV.ID_VENTA = V.ID
WHERE
    EXTRACT(YEAR FROM V.FECHA) = 2018
GROUP BY
    A.ID, A.NOMBRE
ORDER BY
    A.ID;
