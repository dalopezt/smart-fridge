CREATE TABLE audit (
  id int(11) NOT NULL PRIMARY KEY,
  action_ varchar(10) NOT NULL,
  table_name varchar(50) NOT NULL,
  record_id int(11) NOT NULL,
  user_id int(11) DEFAULT NULL,
  timestamp_ timestamp NOT NULL DEFAULT current_timestamp()
);

CREATE TABLE roles (
  id_rol int(11) NOT NULL PRIMARY KEY,
  nombre_rol varchar(20) NOT NULL,
  descripcion_rol varchar(255) NOT NULL
);

CREATE TABLE usuarios (
  id_usuario int(11) NOT NULL PRIMARY KEY,
  nombre_usuario varchar(50) NOT NULL,
  apellido_usuario varchar(50) NOT NULL,
  cuenta_usuario varchar(20) NOT NULL,
  password_usuario varchar(100) NOT NULL,
  id_rol int(11) NOT NULL,
  FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);

CREATE TABLE unidades (
  id_unidad int(11) NOT NULL PRIMARY KEY,
  nombre_unidad varchar(50) NOT NULL,
  descripcion_unidad varchar(150) NOT NULL
);

CREATE TABLE categorias_producto (
  id_categoria_producto int(11) NOT NULL PRIMARY KEY,
  nombre_categoria_producto varchar(50) NOT NULL,
  descripcion_categoria_producto varchar(255) NOT NULL
);

CREATE TABLE categorias_receta (
  id_categoria_receta int(11) NOT NULL PRIMARY KEY,
  nombre_categoria_receta varchar(50) NOT NULL,
  descripcion_categoria_receta varchar(255) NOT NULL
);

CREATE TABLE recetas (
  id_receta int(11) NOT NULL PRIMARY KEY,
  nombre_receta varchar(100) NOT NULL,
  tiempo_receta int(11) NOT NULL,
  id_categoria_receta int(11) NOT NULL,
  id_usuario int(11) NOT NULL,
  FOREIGN KEY (id_categoria_receta) REFERENCES categorias_receta(id_categoria_receta),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE productos (
  id_producto int(11) NOT NULL PRIMARY KEY,
  nombre_producto varchar(100) NOT NULL,
  precio_unitario double NOT NULL,
  vida_util int(11) NOT NULL,
  id_unidad int(11) NOT NULL,
  id_categoria_producto int(11) NOT NULL,
  FOREIGN KEY (id_categoria_producto) REFERENCES categorias_producto(id_categoria_producto),
  FOREIGN KEY (id_unidad) REFERENCES unidades(id_unidad)
);

CREATE TABLE inventario (
  id_inventario int(11) NOT NULL PRIMARY KEY,
  existencia_inventario int(11) NOT NULL,
  fecha_compra_inventario date NOT NULL,
  fecha_caducidad_inventario date NOT NULL,
  id_producto int(11) NOT NULL,
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE materiales_receta (
  id_materiales_receta int(11) NOT NULL PRIMARY KEY,
  cantidad_materiales_receta int(11) NOT NULL,
  id_receta int(11) NOT NULL,
  id_producto int(11) NOT NULL,
  FOREIGN KEY (id_receta) REFERENCES recetas(id_receta),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE pasos_receta (
  id_paso_receta int(11) NOT NULL PRIMARY KEY,
  descripcion_paso_receta varchar(255) NOT NULL,
  tiempo_paso_receta int(11) NOT NULL,
  id_receta int(11) NOT NULL,
  FOREIGN KEY (id_receta) REFERENCES recetas(id_receta)
);