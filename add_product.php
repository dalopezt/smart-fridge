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

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Sanitize and validate the input (you can add more validation as needed)
    $nombre_producto = mysqli_real_escape_string($conn, $_POST['nombre_producto']);
    $precio_unitario = floatval($_POST['precio_unitario']); // Assuming it's a float value
    $vida_util = intval($_POST['vida_util']); // Assuming it's an integer value
    $id_unidad = intval($_POST['id_unidad']); // Assuming it's an integer value
    $id_categoria_producto = intval($_POST['id_categoria_producto']); // Assuming it's an integer value

    // Insert the new product into the database
    $query = "INSERT INTO productos (nombre_producto, precio_unitario, vida_util, id_unidad, id_categoria_producto) 
              VALUES ('$nombre_producto', $precio_unitario, $vida_util, $id_unidad, $id_categoria_producto)";

    $result = mysqli_query($conn, $query);

    if ($result) {
        // Redirect to the productos page after successful addition
        header('Location: products.php');
        exit();
    } else {
        // Handle the error, for now, we'll just display a message
        $error_message = "Error al intentar agregar un producto: " . mysqli_error($conn);
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Producto</title>
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
            <h2>Agregar Producto</h2>

            <?php
            // Display error message if there's an error
            if (isset($error_message)) {
                echo '<p class="error-message">' . $error_message . '</p>';
            }
            ?>
            <!-- Form to add a new product -->
            <form action="" method="post">
                <label for="nombre_producto">Nombre del producto:</label>
                <input type="text" id="nombre_producto" name="nombre_producto" required>

                <label for="precio_unitario">Precio (por unidad establecida):</label>
                <input type="number" id="precio_unitario" name="precio_unitario" step="0.01" required>

                <label for="vida_util">Tiempo de vida (en días):</label>
                <input type="number" id="vida_util" name="vida_util" required>

                <label for="id_unidad">Unidad:</label>
                <select id="id_unidad" name="id_unidad" required>
                    <?php
                    // Fetch units from the database
                    $query_units = "SELECT * FROM unidades";
                    $result_units = mysqli_query($conn, $query_units);

                    while ($row_unit = mysqli_fetch_assoc($result_units)) {
                        echo "<option value='{$row_unit['id_unidad']}'>{$row_unit['nombre_unidad']}</option>";
                    }
                    ?>
                </select><br><br>

                <label for="id_categoria_producto">Categoría:</label>
                <select id="id_categoria_producto" name="id_categoria_producto" required>
                    <?php
                    // Fetch categories from the database
                    $query_categories = "SELECT * FROM categorias_producto";
                    $result_categories = mysqli_query($conn, $query_categories);

                    while ($row_category = mysqli_fetch_assoc($result_categories)) {
                        echo "<option value='{$row_category['id_categoria_producto']}'>{$row_category['nombre_categoria_producto']}</option>";
                    }
                    ?>
                </select><br><br>

                <button type="submit">Añadir</button>
            </form>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Diseñado por David López  | Contacto: davidlopeztorres03@gmail.com</p>
    </footer>
</body>
</html>
