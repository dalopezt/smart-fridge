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

// Fetch inventory from the database
$query_inventory = "SELECT i.*, p.nombre_producto
                    FROM inventario i
                    JOIN productos p ON i.id_producto = p.id_producto";

$result_inventory = mysqli_query($conn, $query_inventory);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inventario</title>
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
            <h2>Inventario</h2>

            <!-- Display inventory in a table -->
            <table border="1">
                <tr>
                    <th>Lote</th>
                    <th>Producto</th>
                    <th>Existencia</th>
                    <th>Fecha de compra</th>
                    <th>Fecha de caducidad</th>
                    <th>Acción</th>
                </tr>
                <?php
                while ($row_inventory = mysqli_fetch_assoc($result_inventory)) {
                    echo "<tr>";
                    echo "<td>{$row_inventory['id_inventario']}</td>";
                    echo "<td>{$row_inventory['nombre_producto']}</td>";
                    echo "<td>{$row_inventory['existencia_inventario']}</td>";
                    echo "<td>{$row_inventory['fecha_compra_inventario']}</td>";
                    echo "<td>{$row_inventory['fecha_caducidad_inventario']}</td>";
                    echo "<td><a href='edit_inventory.php?id={$row_inventory['id_inventario']}'>Editar</a> | <a href='delete_inventory.php?id={$row_inventory['id_inventario']}'>Eliminar</a></td>";
                    echo "</tr>";
                }
                ?>
            </table>

            <a href="add_inventory.php">Agregar al Inventario</a>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Diseñado por David López  | Contacto: davidlopeztorres03@gmail.com</p>
    </footer>
</body>
</html>
