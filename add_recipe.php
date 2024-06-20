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

// Fetch categories for dropdown list
$query_categories = "SELECT id_categoria_receta, nombre_categoria_receta FROM categorias_receta";
$result_categories = mysqli_query($conn, $query_categories);

// Fetch products for dropdown list
$query_products = "SELECT id_producto, nombre_producto FROM productos";
$result_products = mysqli_query($conn, $query_products);

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre_receta = mysqli_real_escape_string($conn, $_POST['nombre_receta']);
    $id_categoria_receta = intval($_POST['id_categoria_receta']); // Assuming it's an integer value

    // Calculate total estimated time from steps
    $total_estimado = 0;

    if (isset($_POST['steps'])) {
        foreach ($_POST['steps'] as $step) {
            $total_estimado += intval($step['tiempo_estimado']);
        }
    }

    $materials_fixed = array();
    $steps_fixed = array();

    for ($i = 0; $i < count($_POST['steps']); $i+=2) {
        array_push($steps_fixed, array($_POST['steps'][$i]['descripcion_paso'], $_POST['steps'][$i+1]['tiempo_estimado']));
    }

    for ($i = 0; $i < count($_POST['materials']); $i+=2) {
        array_push($materials_fixed, array($_POST['materials'][$i]['id_producto'], $_POST['materials'][$i+1]['cantidad']));
    }

    // Insert the new recipe into the database
    $insert_recipe_query = "INSERT INTO recetas (nombre_receta, tiempo_receta, id_categoria_receta, id_usuario)
                            VALUES ('$nombre_receta', $total_estimado, $id_categoria_receta, {$_SESSION['user_id']})";

    $insert_recipe_result = mysqli_query($conn, $insert_recipe_query);

    if ($insert_recipe_result) {
        // Retrieve the ID of the newly inserted recipe
        $last_recipe_id = mysqli_insert_id($conn);

        // Handle the dynamic addition of materials
        if (isset($_POST['materials'])) {
            foreach ($materials_fixed as $material) {
                $id_producto = intval($material[0]);
                $cantidad = intval($material[1]);

                // Insert the material into the database
                $insert_material_query = "INSERT INTO materiales_receta (id_receta, id_producto, cantidad_materiales_receta)
                                        VALUES ($last_recipe_id, $id_producto, $cantidad)";

                mysqli_query($conn, $insert_material_query);
            }
        }

        // Handle the dynamic addition of steps
        if (isset($_POST['steps'])) {
            foreach ($steps_fixed as $step) {
                $descripcion_paso = mysqli_real_escape_string($conn, $step[0]);
                $tiempo_estimado = intval($step[1]);

                // Insert the step into the database
                $insert_step_query = "INSERT INTO pasos_receta (id_receta, descripcion_paso_receta, tiempo_paso_receta)
                                    VALUES ($last_recipe_id, '$descripcion_paso', $tiempo_estimado)";

                mysqli_query($conn, $insert_step_query);
            }
        }

        // Redirect to recetas.php after successful addition
        header('Location: recipes.php');
        exit();
    } else {
        // Handle the error, for now, we'll just display a message
        $error_message = "Error al añadir la receta: " . mysqli_error($conn);
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Añadir receta</title>
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
            <h2>Añadir receta</h2>

            <?php
            // Display error message if there's an error
            if (isset($error_message)) {
                echo '<p class="error-message">' . $error_message . '</p>';
            }
            ?>

            <!-- Form to add recipe -->
            <form action="" method="post">
                <label for="nombre_receta">Nombre de la receta:</label>
                <input type="text" id="nombre_receta" name="nombre_receta" required>

                <p>Tiempo estimado total: <span id="total-estimado">0</span> minutos</p>

                <label for="id_categoria_receta">Categoría de receta:</label>
                <select id="id_categoria_receta" name="id_categoria_receta" required>
                    <?php
                    while ($row_category = mysqli_fetch_assoc($result_categories)) {
                        echo "<option value='{$row_category['id_categoria_receta']}'>{$row_category['nombre_categoria_receta']}</option>";
                    }
                    ?>
                </select><br><br>

                <div id="materials-container">
                    <h3>Ingredientes</h3>
                    <div id="material-template">
                        <label for="id_producto">Producto:</label>
                        <select name="materials[][id_producto]" required>
                            <?php
                            // Reset the pointer of $result_products to the beginning
                            mysqli_data_seek($result_products, 0);

                            while ($row_product = mysqli_fetch_assoc($result_products)) {
                                echo "<option value='{$row_product['id_producto']}'>{$row_product['nombre_producto']}</option>";
                            }
                            ?>
                        </select><br><br>

                        <label for="cantidad">Cantidad:</label>
                        <input type="text" name="materials[][cantidad]" required>

                        <button class="remove" type="button" onclick="removeMaterialField(this)">Eliminar ingrediente</button>
                        <br><br>
                    </div>
                </div>

                <button type="button" onclick="addMaterialField()">Agregar ingrediente</button>
                <br><br>

                <div id="steps-container">
                    <h3>Procedimiento</h3>
                    <div id="step-template">
                        <label for="descripcion_paso">Descripción:</label>
                        <textarea name="steps[][descripcion_paso]" required></textarea>

                        <label for="tiempo_estimado">Tiempo estimado (min):</label>
                        <input type="number" name="steps[][tiempo_estimado]" onchange="updateTotalTime()" required>

                        <button class="remove" type="button" onclick="removeStepField(this)">Eliminar paso</button>
                        <br><br>
                    </div>
                </div>

                <button type="button" onclick="addStepField()">Agregar paso</button>
                <br><br>

                <button type="submit">Agregar receta</button>
            </form>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 Diseñado por David López  | Contacto: davidlopeztorres03@gmail.com</p>
    </footer>

    <script>
        // Function to add a new material field
        function addMaterialField() {
            var materialContainer = document.getElementById("materials-container");
            var newMaterialField = document.getElementById("material-template").cloneNode(true);
            newMaterialField.removeAttribute("id");
            materialContainer.appendChild(newMaterialField);
        }

        // Function to remove a material field
        function removeMaterialField(field) {
            var materialContainer = document.getElementById("materials-container");
            materialContainer.removeChild(field.parentNode);
        }

        // Function to add a new step field
        function addStepField() {
            var stepContainer = document.getElementById("steps-container");
            var newStepField = document.getElementById("step-template").cloneNode(true);
            newStepField.removeAttribute("id");
            stepContainer.appendChild(newStepField);
        }

        // Function to remove a step field
        function removeStepField(field) {
            var stepContainer = document.getElementById("steps-container");
            stepContainer.removeChild(field.parentNode);
        }

        // Function to calculate and update total estimated time
        function updateTotalTime() {
        var totalEstimate = 0;
        var stepFields = document.getElementsByName("steps[][tiempo_estimado]");

        stepFields.forEach(function (stepField) {
            totalEstimate += parseInt(stepField.value) || 0;
        });

        document.getElementById("total-estimado").innerText = totalEstimate;
    }
    </script>
</body>
</html>
