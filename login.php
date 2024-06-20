<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body class="login">
    <div class="login-container">
        <h2>Bienvenido de vuelta a Smart Fridge!</h2>

        <?php
        // Check if an error message is present in the URL
        if (isset($_GET['error']) && !empty($_GET['error'])) {
            echo '<p class="error-message">' . htmlspecialchars($_GET['error']) . '</p>';
        }
        ?>

        <form action="login_request.php" method="post">
            <label for="username">Nombre de usuario</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Contraseña</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Ingresar</button>
        </form>
    </div>
</body>
</html>