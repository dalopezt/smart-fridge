<?php
session_start();

// Check if the user is not logged in
if (!isset($_SESSION['user_id'])) {
    // Redirect to the login page
    header('Location: login.php');
    exit();
}

// Include database connection file
include_once('db_connection.php');

// Fetch products from the database
$query = "SELECT p.*, u.nombre_unidad, c.nombre_categoria_producto
          FROM productos p
          JOIN unidades u ON p.id_unidad = u.id_unidad
          JOIN categorias_producto c ON p.id_categoria_producto = c.id_categoria_producto
          ORDER BY p.nombre_producto ASC";
$result = mysqli_query($conn, $query);

// Check if query was successful
if (!$result) {
    die("Error: " . mysqli_error($conn));
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <nav class="sidebar">
            <ul>
                <li><a href="home.php">Inicio</a></li>
                <li><a href="cook.php">Cocinar</a></li>
                <li><a href="products.php">Productos</a></li>
                <li><a href="inventory.php">Inventario</a></li>
                <li><a href="recipes.php">Recetas</a></li>
                <li><a href="logout.php">Cerrar Sesión</a></li>
            </ul>
        </nav>

        <div class="main-content">
            <h2>Lista de productos</h2>

            <!-- Display products in a table -->
            <table border="1">
                <tr>
                    <th>Nombre</th>
                    <th>Precio unitario</th>
                    <th>Tiempo de vida</th>
                    <th>Unidades</th>
                    <th>Categoría</th>
                    <th>Acción</th>
                </tr>
                <?php
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<tr>";
                    echo "<td>{$row['nombre_producto']}</td>";
                    echo "<td>{$row['precio_unitario']}</td>";
                    echo "<td>{$row['vida_util']}</td>";
                    echo "<td>{$row['nombre_unidad']}</td>";
                    echo "<td>{$row['nombre_categoria_producto']}</td>";
                    echo "<td><a href='edit_product.php?id={$row['id_producto']}'>Editar</a> | <a href='delete_product.php?id={$row['id_producto']}'>Eliminar</a></td>";
                    echo "</tr>";
                }
                ?>
            </table>

            <a href="add_product.php">Agregar un producto</a>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Diseñado por David López  | Contacto: davidlopeztorres03@gmail.com</p>
    </footer>
</body>
</html>
