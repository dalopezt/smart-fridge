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
    // Sanitize and validate the input (you can add more validation as needed)
    $nombre_producto = mysqli_real_escape_string($conn, $_POST['nombre_producto']);
    $precio_unitario = floatval($_POST['precio_unitario']); // Assuming it's a float value
    $vida_util = intval($_POST['vida_util']); // Assuming it's an integer value
    $id_unidad = intval($_POST['id_unidad']); // Assuming it's an integer value
    $id_categoria_producto = intval($_POST['id_categoria_producto']); // Assuming it's an integer value

    // Update the product in the database
    $update_query = "UPDATE productos
                     SET nombre_producto = '$nombre_producto',
                         precio_unitario = $precio_unitario,
                         vida_util = $vida_util,
                         id_unidad = $id_unidad,
                         id_categoria_producto = $id_categoria_producto
                     WHERE id_producto = $product_id";

    $update_result = mysqli_query($conn, $update_query);

    if ($update_result) {
        // Redirect to productos.php after successful update
        header('Location: products.php');
        exit();
    } else {
        // Handle the error, for now, we'll just display a message
        $error_message = "Error al intentar actualizar el producto: " . mysqli_error($conn);
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Producto</title>
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
            <h2>Editar Producto</h2>

            <?php
            // Display error message if there's an error
            if (isset($error_message)) {
                echo '<p class="error-message">' . $error_message . '</p>';
            }
            ?>

            <!-- Form to edit the product -->
            <form action="" method="post">
                <label for="nombre_producto">Nombre:</label>
                <input type="text" id="nombre_producto" name="nombre_producto" value="<?php echo $row['nombre_producto']; ?>" required>

                <label for="precio_unitario">Precio (por unidad):</label>
                <input type="number" id="precio_unitario" name="precio_unitario" step="0.01" value="<?php echo $row['precio_unitario']; ?>" required>

                <label for="vida_util">Tiempo de vida (en días):</label>
                <input type="number" id="vida_util" name="vida_util" value="<?php echo $row['vida_util']; ?>" required>

                <!-- Use the selected values from the database for the dropdown lists -->
                <label for="id_unidad">Unidad:</label>
                <select id="id_unidad" name="id_unidad" required>
                    <?php
                    // Fetch units from the database
                    $query_units = "SELECT * FROM unidades";
                    $result_units = mysqli_query($conn, $query_units);

                    while ($row_unit = mysqli_fetch_assoc($result_units)) {
                        $selected = ($row_unit['id_unidad'] == $row['id_unidad']) ? 'selected' : '';
                        echo "<option value='{$row_unit['id_unidad']}' $selected>{$row_unit['nombre_unidad']}</option>";
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
                        $selected_category = ($row_category['id_categoria_producto'] == $row['id_categoria_producto']) ? 'selected' : '';
                        echo "<option value='{$row_category['id_categoria_producto']}' $selected_category>{$row_category['nombre_categoria_producto']}</option>";
                    }
                    ?>
                </select><br><br>

                <button type="submit">Actualizar</button>
            </form>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Diseñado por David López  | Contacto: davidlopeztorres03@gmail.com</p>
    </footer>
</body>
</html>
