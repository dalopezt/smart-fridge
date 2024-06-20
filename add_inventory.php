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

// Fetch products for dropdown list
$query_products = "SELECT id_producto, nombre_producto FROM productos";
$result_products = mysqli_query($conn, $query_products);

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Sanitize and validate the input (you can add more validation as needed)
    $id_producto = intval($_POST['id_producto']); // Assuming it's an integer value
    $existencia_inventario = intval($_POST['existencia_inventario']); // Assuming it's an integer value
    $fecha_compra_inventario = $_POST['fecha_compra_inventario'];
    
    // Fetch "vida_util" of the selected product from the database
    $query_vida_util = "SELECT vida_util FROM productos WHERE id_producto = $id_producto";
    $result_vida_util = mysqli_query($conn, $query_vida_util);

    if ($result_vida_util) {
        $row_vida_util = mysqli_fetch_assoc($result_vida_util);
        $vida_util = $row_vida_util['vida_util'];
        
        // Calculate expiration date based on purchase date and "vida_util"
        $fecha_caducidad_inventario = date('Y-m-d', strtotime($fecha_compra_inventario . " + $vida_util days"));

        // Insert the new inventory item into the database
        $insert_query = "INSERT INTO inventario (id_producto, existencia_inventario, fecha_compra_inventario, fecha_caducidad_inventario)
                         VALUES ($id_producto, $existencia_inventario, '$fecha_compra_inventario', '$fecha_caducidad_inventario')";

        $insert_result = mysqli_query($conn, $insert_query);

        if ($insert_result) {
            // Redirect to inventario.php after successful addition
            header('Location: inventory.php');
            exit();
        } else {
            // Handle the error, for now, we'll just display a message
            $error_message = "Error al añadir al inventario: " . mysqli_error($conn);
        }
    } else {
        // Handle the error, for now, we'll just display a message
        $error_message = "Error cargando la 'vida util' del producto: " . mysqli_error($conn);
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar al inventario</title>
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
            <h2>Agregar al inventario</h2>

            <?php
            // Display error message if there's an error
            if (isset($error_message)) {
                echo '<p class="error-message">' . $error_message . '</p>';
            }
            ?>

            <!-- Form to add to inventory -->
            <form action="" method="post">
                <label for="id_producto">Producto:</label>
                <select id="id_producto" name="id_producto" required>
                    <?php
                    while ($row_product = mysqli_fetch_assoc($result_products)) {
                        echo "<option value='{$row_product['id_producto']}'>{$row_product['nombre_producto']}</option>";
                    }
                    ?>
                </select><br><br>

                <label for="existencia_inventario">Existencia:</label>
                <input type="number" id="existencia_inventario" name="existencia_inventario" required>

                <label for="fecha_compra_inventario">Fecha de compra:</label>
                <input type="date" id="fecha_compra_inventario" name="fecha_compra_inventario" required>

                <button type="submit">Añadir</button>
            </form>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Diseñado por David López  | Contacto: davidlopeztorres03@gmail.com</p>
    </footer>
</body>
</html>
