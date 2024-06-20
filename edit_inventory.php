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

// Check if the inventory ID is provided in the URL
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    // Redirect to inventario.php if ID is not provided or not numeric
    header('Location: inventory.php');
    exit();
}

$inventory_id = $_GET['id'];

// Fetch the inventory details from the database
$query_inventory = "SELECT i.*, p.nombre_producto
                    FROM inventario i
                    JOIN productos p ON i.id_producto = p.id_producto
                    WHERE i.id_inventario = $inventory_id";

$result_inventory = mysqli_query($conn, $query_inventory);

if (!$result_inventory || mysqli_num_rows($result_inventory) == 0) {
    // Redirect to inventario.php if the inventory item is not found
    header('Location: inventory.php');
    exit();
}

$row_inventory = mysqli_fetch_assoc($result_inventory);

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Sanitize and validate the input (you can add more validation as needed)
    $existencia_inventario = intval($_POST['existencia_inventario']); // Assuming it's an integer value
    $fecha_compra_inventario = $_POST['fecha_compra_inventario'];

    // Fetch "vida_util" of the selected product from the database
    $query_vida_util = "SELECT vida_util FROM productos WHERE id_producto = {$row_inventory['id_producto']}";
    $result_vida_util = mysqli_query($conn, $query_vida_util);

    if ($result_vida_util) {
        $row_vida_util = mysqli_fetch_assoc($result_vida_util);
        $vida_util = $row_vida_util['vida_util'];
        
        // Calculate expiration date based on purchase date and "vida_util"
        $fecha_caducidad_inventario = date('Y-m-d', strtotime($fecha_compra_inventario . " + $vida_util days"));

        // Update the inventory item in the database
        $update_query = "UPDATE inventario
                         SET existencia_inventario = $existencia_inventario,
                             fecha_compra_inventario = '$fecha_compra_inventario',
                             fecha_caducidad_inventario = '$fecha_caducidad_inventario'
                         WHERE id_inventario = $inventory_id";

        $update_result = mysqli_query($conn, $update_query);

        if ($update_result) {
            // Redirect to inventario.php after successful update
            header('Location: inventory.php');
            exit();
        } else {
            // Handle the error, for now, we'll just display a message
            $error_message = "Error al actualizar entrada de inventario: " . mysqli_error($conn);
        }
    } else {
        // Handle the error, for now, we'll just display a message
        $error_message = "Error al cargar 'vida util' del producto: " . mysqli_error($conn);
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar entrada de inventario</title>
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
            <h2>Editar entrada de inventario</h2>

            <?php
            // Display error message if there's an error
            if (isset($error_message)) {
                echo '<p class="error-message">' . $error_message . '</p>';
            }
            ?>

            <!-- Form to edit inventory -->
            <form action="" method="post">
                <label for="id_producto">Producto:</label>
                <select id="id_producto" name="id_producto" disabled>
                    <option value="<?php echo $row_inventory['id_producto']; ?>"><?php echo $row_inventory['nombre_producto']; ?></option>
                </select><br><br>

                <label for="existencia_inventario">Existencia:</label>
                <input type="number" id="existencia_inventario" name="existencia_inventario" value="<?php echo $row_inventory['existencia_inventario']; ?>" required>

                <label for="fecha_compra_inventario">Fecha de compra:</label>
                <input type="date" id="fecha_compra_inventario" name="fecha_compra_inventario" value="<?php echo $row_inventory['fecha_compra_inventario']; ?>" required>

                <button type="submit">Actualizar</button>
            </form>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Diseñado por David López  | Contacto: davidlopeztorres03@gmail.com</p>
    </footer>
</body>
</html>
