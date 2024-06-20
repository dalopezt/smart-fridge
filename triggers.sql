CREATE TRIGGER `after_delete_categorias_producto` AFTER DELETE ON `categorias_producto`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'categorias_producto', OLD.id_categoria_producto, CURRENT_USER);
END

CREATE TRIGGER `after_delete_categorias_receta` AFTER DELETE ON `categorias_receta`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'categorias_receta', OLD.id_categoria_receta, CURRENT_USER);
END

CREATE TRIGGER `after_delete_inventario` AFTER DELETE ON `inventario`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'inventario', OLD.id_inventario, CURRENT_USER);
END

CREATE TRIGGER `after_delete_materiales_receta` AFTER DELETE ON `materiales_receta`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'materiales_receta', OLD.id_materiales_receta, CURRENT_USER);
END

CREATE TRIGGER `after_delete_pasos_receta` AFTER DELETE ON `pasos_receta`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'pasos_receta', OLD.id_paso_receta, CURRENT_USER);
END

CREATE TRIGGER `after_delete_productos` AFTER DELETE ON `productos`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'productos', OLD.id_producto, CURRENT_USER);
END

CREATE TRIGGER `after_delete_recetas` AFTER DELETE ON `recetas`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'recetas', OLD.id_receta, CURRENT_USER);
END

CREATE TRIGGER `after_delete_roles` AFTER DELETE ON `roles`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'roles', OLD.id_rol, CURRENT_USER);
END

CREATE TRIGGER `after_delete_unidades` AFTER DELETE ON `unidades`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'unidades', OLD.id_unidad, CURRENT_USER);
END

CREATE TRIGGER `after_delete_usuarios` AFTER DELETE ON `usuarios`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('DELETE', 'usuarios', OLD.id_usuario, CURRENT_USER);
END

CREATE TRIGGER `after_insert_categorias_producto` AFTER INSERT ON `categorias_producto`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'categorias_producto', NEW.id_categoria_producto, CURRENT_USER);
END

CREATE TRIGGER `after_insert_categorias_receta` AFTER INSERT ON `categorias_receta`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'categorias_receta', NEW.id_categoria_receta, CURRENT_USER);
END

CREATE TRIGGER `after_insert_inventario` AFTER INSERT ON `inventario`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'inventario', NEW.id_inventario, CURRENT_USER);
END

CREATE TRIGGER `after_insert_materiales_receta` AFTER INSERT ON `materiales_receta`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'materiales_receta', NEW.id_materiales_receta, CURRENT_USER);
END

CREATE TRIGGER `after_insert_pasos_receta` AFTER INSERT ON `pasos_receta`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'pasos_receta', NEW.id_paso_receta, CURRENT_USER);
END

CREATE TRIGGER `after_insert_productos` AFTER INSERT ON `productos`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'productos', NEW.id_producto, CURRENT_USER);
END

CREATE TRIGGER `after_insert_recetas` AFTER INSERT ON `recetas`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'recetas', NEW.id_receta, CURRENT_USER);
END

CREATE TRIGGER `after_insert_roles` AFTER INSERT ON `roles`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'roles', NEW.id_rol, CURRENT_USER);
END

CREATE TRIGGER `after_insert_unidades` AFTER INSERT ON `unidades`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'unidades', NEW.id_unidad, CURRENT_USER);
END

CREATE TRIGGER `after_insert_usuarios` AFTER INSERT ON `usuarios`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('INSERT', 'usuarios', NEW.id_usuario, CURRENT_USER);
END

CREATE TRIGGER `after_update_categorias_producto` AFTER UPDATE ON `categorias_producto`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'categorias_producto', NEW.id_categoria_producto, CURRENT_USER);
END

CREATE TRIGGER `after_update_categorias_receta` AFTER UPDATE ON `categorias_receta`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'categorias_receta', NEW.id_categoria_receta, CURRENT_USER);
END

CREATE TRIGGER `after_update_inventario` AFTER UPDATE ON `inventario`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'inventario', NEW.id_inventario, CURRENT_USER);
END

CREATE TRIGGER `after_update_materiales_receta` AFTER UPDATE ON `materiales_receta`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'materiales_receta', NEW.id_materiales_receta, CURRENT_USER);
END

CREATE TRIGGER `after_update_pasos_receta` AFTER UPDATE ON `pasos_receta`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'pasos_receta', NEW.id_paso_receta, CURRENT_USER);
END

CREATE TRIGGER `after_update_productos` AFTER UPDATE ON `productos`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'productos', NEW.id_producto, CURRENT_USER);
END

CREATE TRIGGER `after_update_recetas` AFTER UPDATE ON `recetas`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'recetas', NEW.id_receta, CURRENT_USER);
END

CREATE TRIGGER `after_update_roles` AFTER UPDATE ON `roles`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'roles', NEW.id_rol, CURRENT_USER);
END

CREATE TRIGGER `after_update_unidades` AFTER UPDATE ON `unidades`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'unidades', NEW.id_unidad, CURRENT_USER);
END

CREATE TRIGGER `after_update_usuarios` AFTER UPDATE ON `usuarios`
 FOR EACH ROW BEGIN
    INSERT INTO audit (action, table_name, record_id, user_id)
    VALUES ('UPDATE', 'usuarios', NEW.id_usuario, CURRENT_USER);
END
