<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

include_once('db_connection.php');

if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header('Location: inventory.php');
    exit();
}

$inventory_id = $_GET['id'];

$query_inventory = "SELECT i.*, p.nombre_producto
                    FROM inventario i
                    JOIN productos p ON i.id_producto = p.id_producto
                    WHERE i.id_inventario = $inventory_id";

$result_inventory = mysqli_query($conn, $query_inventory);

if (!$result_inventory || mysqli_num_rows($result_inventory) == 0) {
    header('Location: inventory.php');
    exit();
}

$row_inventory = mysqli_fetch_assoc($result_inventory);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $delete_query = "DELETE FROM inventario WHERE id_inventario = $inventory_id";
    $delete_result = mysqli_query($conn, $delete_query);

    if ($delete_result) {
        header('Location: inventory.php');
        exit();
    } else {
        $error_message = "Error al eliminar entrada del inventario: " . mysqli_error($conn);
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar entrada de inventario</title>
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
            <h2>Eliminar entrada de inventario</h2>

            <?php
            if (isset($error_message)) {
                echo '<p class="error-message">' . $error_message . '</p>';
            }
            ?>

            <p>Está seguro de que desea eliminar esta entrada del inventario?</p>
            <p><strong>Lote:</strong> <?php echo $row_inventory['id_inventario']; ?></p>
            <p><strong>Producto:</strong> <?php echo $row_inventory['nombre_producto']; ?></p>
            <p><strong>Existencia:</strong> <?php echo $row_inventory['existencia_inventario']; ?></p>
            <p><strong>Fecha de compra:</strong> <?php echo $row_inventory['fecha_compra_inventario']; ?></p>

            <form action="" method="post">
                <button type="submit">Eliminar</button>
            </form>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Diseñado por David López  | Contacto: davidlopeztorres03@gmail.com</p>
    </footer>
</body>
</html>
