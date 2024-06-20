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

// Fetch recipes with category and user information from the database
$query_recipes = "SELECT r.id_receta, r.nombre_receta, r.tiempo_receta, c.nombre_categoria_receta, CONCAT(u.nombre_usuario, ' ', u.apellido_usuario) AS nombre_usuario
                  FROM recetas r
                  JOIN categorias_receta c ON r.id_categoria_receta = c.id_categoria_receta
                  JOIN usuarios u ON r.id_usuario = u.id_usuario";

$result_recipes = mysqli_query($conn, $query_recipes);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recetas</title>
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
            <h2>Recetas</h2>

            <!-- Display recipes in a table -->
            <table border="1">
                <tr>
                    <th>Nombre</th>
                    <th>Tiempo de preparación (min)</th>
                    <th>Categoría</th>
                    <th>Autor</th>
                    <th>Acción</th>
                </tr>
                <?php
                while ($row_recipe = mysqli_fetch_assoc($result_recipes)) {
                    echo "<tr>";
                    echo "<td>{$row_recipe['nombre_receta']}</td>";
                    echo "<td>{$row_recipe['tiempo_receta']}</td>";
                    echo "<td>{$row_recipe['nombre_categoria_receta']}</td>";
                    echo "<td>{$row_recipe['nombre_usuario']}</td>";
                    echo "<td><a href='delete_recipe.php?recipe_id={$row_recipe['id_receta']}'>Eliminar</a></td>";
                    echo "</tr>";
                }
                ?>
            </table>

            <a href="add_recipe.php">Agregar Receta</a>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Diseñado por David López  | Contacto: davidlopeztorres03@gmail.com</p>
    </footer>
</body>
</html>