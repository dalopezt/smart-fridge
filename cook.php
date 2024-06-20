<?php
session_start();
include_once('db_connection.php');

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

// Fetch recipes with author information from the database
$query_recipes = "SELECT recetas.id_receta, recetas.nombre_receta, recetas.id_usuario, usuarios.nombre_usuario, usuarios.apellido_usuario
                  FROM recetas
                  JOIN usuarios ON recetas.id_usuario = usuarios.id_usuario";
$result_recipes = mysqli_query($conn, $query_recipes);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cocinar</title>
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
            <h2>Cocinar</h2>

            <!-- Display recipes in a table -->
            <table border="1">
                <tr>
                    <th>Nombre de la Receta</th>
                    <th>Autor</th>
                    <th>Acciones</th>
                </tr>

                <?php
                while ($row_recipe = mysqli_fetch_assoc($result_recipes)) {
                    echo "<tr>";
                    echo "<td>{$row_recipe['nombre_receta']}</td>";
                    echo "<td>{$row_recipe['nombre_usuario']} {$row_recipe['apellido_usuario']}</td>";
                    echo "<td><a href='read_recipe.php?recipe_id={$row_recipe['id_receta']}'>Leer</a>";
                    echo "</tr>";
                }
                ?>
            </table>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Diseñado por David López | Contacto: davidlopeztorres03@gmail.com</p>
    </footer>
</body>
</html>
