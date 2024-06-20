SELECT t1.nombre_producto, t1.total_receta, COALESCE(t2.total_inventario, 0) AS "total_inventario", (COALESCE(t2.total_inventario, 0) >= t1.total_receta) AS "enough"
FROM
(SELECT productos.id_producto, productos.nombre_producto, SUM(materiales_receta.cantidad_materiales_receta) as total_receta
FROM materiales_receta NATURAL JOIN productos WHERE materiales_receta.id_receta = 13
GROUP BY materiales_receta.id_producto) t1
LEFT JOIN
(SELECT productos.id_producto, productos.nombre_producto, SUM(inventario.existencia_inventario) as total_inventario 
FROM inventario NATURAL JOIN productos 
GROUP BY inventario.id_producto) t2
ON t1.id_producto = t2.id_producto
ORDER BY t1.nombre_producto ASC;

SELECT MIN(t3.enough) AS "enough" FROM (SELECT t1.nombre_producto, t1.total_receta, COALESCE(t2.total_inventario, 0) AS "total_inventario", (COALESCE(t2.total_inventario, 0) >= t1.total_receta) AS "enough"
FROM
(SELECT productos.id_producto, productos.nombre_producto, SUM(materiales_receta.cantidad_materiales_receta) as total_receta
FROM materiales_receta NATURAL JOIN productos WHERE materiales_receta.id_receta = 13
GROUP BY materiales_receta.id_producto) t1
LEFT JOIN
(SELECT productos.id_producto, productos.nombre_producto, SUM(inventario.existencia_inventario) as total_inventario 
FROM inventario NATURAL JOIN productos 
GROUP BY inventario.id_producto) t2
ON t1.id_producto = t2.id_producto
ORDER BY t1.nombre_producto ASC) t3;