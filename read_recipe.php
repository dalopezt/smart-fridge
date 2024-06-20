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

// Fetch recipe details from the database
$query_recipe = "SELECT recetas.*, usuarios.nombre_usuario, usuarios.apellido_usuario
                 FROM recetas
                 JOIN usuarios ON recetas.id_usuario = usuarios.id_usuario
                 WHERE recetas.id_receta = $recipe_id";
$result_recipe = mysqli_query($conn, $query_recipe);

// Fetch steps for the recipe
$query_steps = "SELECT * FROM pasos_receta WHERE id_receta = $recipe_id";
$result_steps = mysqli_query($conn, $query_steps);

// Fetch materials for the recipe
$query_materials = "SELECT materiales_receta.*, productos.nombre_producto, unidades.nombre_unidad
                    FROM materiales_receta
                    JOIN productos ON materiales_receta.id_producto = productos.id_producto
                    JOIN unidades ON productos.id_unidad = unidades.id_unidad
                    WHERE materiales_receta.id_receta = $recipe_id";
$result_materials = mysqli_query($conn, $query_materials);

// Fetch category name for the recipe
$query_category = "SELECT nombre_categoria_receta FROM categorias_receta WHERE id_categoria_receta = (SELECT id_categoria_receta FROM recetas WHERE id_receta = $recipe_id)";
$result_category = mysqli_query($conn, $query_category);
$row_category = mysqli_fetch_assoc($result_category);
$category_name = $row_category['nombre_categoria_receta'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Receta Detallada</title>
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
            <?php
            if ($row_recipe = mysqli_fetch_assoc($result_recipe)) {
                echo "<h2>{$row_recipe['nombre_receta']}</h2>";
                echo "<p><strong>Categoría:</strong> {$category_name}</p>";
                echo "<p><strong>Autor:</strong> {$row_recipe['nombre_usuario']} {$row_recipe['apellido_usuario']}</p>";
                echo "<p><strong>Tiempo Estimado:</strong> {$row_recipe['tiempo_receta']} minutos</p>";
                echo "<h3>Ingredientes</h3>";
                
                // Display materials for the recipe
                echo "<ul>";
                while ($row_material = mysqli_fetch_assoc($result_materials)) {
                    echo "<li>{$row_material['cantidad_materiales_receta']} {$row_material['nombre_unidad']} de {$row_material['nombre_producto']}</li>";
                }
                echo "</ul>";
                
                echo "<h3>Procedimiento</h3>";
                
                // Display steps for the recipe
                echo "<ol>";
                while ($row_step = mysqli_fetch_assoc($result_steps)) {
                    echo "<li>{$row_step['descripcion_paso_receta']} ({$row_step['tiempo_paso_receta']} minutos)</li>";
                }
                echo "</ol>";
            } else {
                echo "<p>Receta no encontrada.</p>";
            }
            ?>

            <a href="cook.php">Volver al menu de cocinar</a>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Diseñado por David López | Contacto: davidlopeztorres03@gmail.com</p>
    </footer>
</body>
</html>
