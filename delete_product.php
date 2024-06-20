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

// Check if the product ID is provided in the URL
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    // Redirect to productos.php if ID is not provided or not numeric
    header('Location: products.php');
    exit();
}

$product_id = $_GET['id'];

// Fetch the product details from the database
$query = "SELECT p.*, u.nombre_unidad, c.nombre_categoria_producto
          FROM productos p
          JOIN unidades u ON p.id_unidad = u.id_unidad
          JOIN categorias_producto c ON p.id_categoria_producto = c.id_categoria_producto
          WHERE p.id_producto = $product_id";

$result = mysqli_query($conn, $query);

if (!$result || mysqli_num_rows($result) == 0) {
    // Redirect to productos.php if the product is not found
    header('Location: products.php');
    exit();
}

$row = mysqli_fetch_assoc($result);

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Delete the product from the database
    $delete_query = "DELETE FROM productos WHERE id_producto = $product_id";
    $delete_result = mysqli_query($conn, $delete_query);

    if ($delete_result) {
        // Redirect to productos.php after successful deletion
        header('Location: products.php');
        exit();
    } else {
        // Handle the error, for now, we'll just display a message
        $error_message = "Error al intentar eliminar el producto: " . mysqli_error($conn);
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Producto</title>
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
            <h2>Eliminar Producto</h2>

            <?php
            // Display error message if there's an error
            if (isset($error_message)) {
                echo '<p class="error-message">' . $error_message . '</p>';
            }
            ?>

            <!-- Display product details for confirmation -->
            <p>Está seguro de que desea eliminar este producto?</p>
            <p><strong>Nombre:</strong> <?php echo $row['nombre_producto']; ?></p>
            <p><strong>Unidad:</strong> <?php echo $row['nombre_unidad']; ?></p>
            <p><strong>Categoría:</strong> <?php echo $row['nombre_categoria_producto']; ?></p>
            <p><strong>Precio unitario:</strong> <?php echo $row['precio_unitario']; ?></p>
            <p><strong>Tiempo de vida:</strong> <?php echo $row['vida_util']; ?> días</p>

            <!-- Form to confirm deletion -->
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
