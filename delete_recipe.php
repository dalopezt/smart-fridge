<?php
session_start();

// Include necessary files
include_once('db_connection.php');

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

// Check if the recipe ID is provided in the URL
if (!isset($_GET['recipe_id'])) {
    header('Location: recipes.php');
    exit();
}

$recipe_id = intval($_GET['recipe_id']);

// Fetch recipe data from the database
$query_recipe = "SELECT * FROM recetas WHERE id_receta = $recipe_id";
$result_recipe = mysqli_query($conn, $query_recipe);

if (!$result_recipe || mysqli_num_rows($result_recipe) == 0) {
    // Recipe not found
    header('Location: recipes.php');
    exit();
}

$row_recipe = mysqli_fetch_assoc($result_recipe);

// Handle the deletion of the recipe and related data
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Delete related steps
    $delete_steps_query = "DELETE FROM pasos_receta WHERE id_receta = $recipe_id";
    mysqli_query($conn, $delete_steps_query);

    // Delete related materials
    $delete_materials_query = "DELETE FROM materiales_receta WHERE id_receta = $recipe_id";
    mysqli_query($conn, $delete_materials_query);

    // Delete the recipe from the database
    $delete_recipe_query = "DELETE FROM recetas WHERE id_receta = $recipe_id";
    $delete_recipe_result = mysqli_query($conn, $delete_recipe_query);

    if ($delete_recipe_result) {
        // Redirect to recipes page after successful deletion
        header('Location: recipes.php');
        exit();
    } else {
        // Handle deletion error, for now, we'll just display a message
        $error_message = "Error al eliminar la receta: " . mysqli_error($conn);
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar receta</title>
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

    <h2>Eliminar receta</h2>

    <?php
    // Display error message if there's an error
    if (isset($error_message)) {
        echo '<p class="error-message">' . $error_message . '</p>';
    }
    ?>

    <!-- Display recipe information -->
    <p>Nombre de la receta: <?php echo $row_recipe['nombre_receta']; ?></p>

    <!-- Confirmation form for recipe deletion -->
    <form action="" method="post">
        <p>¿Estás seguro de que deseas eliminar esta receta?</p>
        <button type="submit">Sí, eliminar</button>
        <a href="recipes.php">Cancelar</a>
    </form>

</div>
</body>
</html>
