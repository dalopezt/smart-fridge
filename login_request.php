<?php
session_start();

include_once('db_connection.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = md5($_POST['password']);

    $query = "SELECT * FROM usuarios WHERE cuenta_usuario = '$username' AND password_usuario = '$password'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
    
        $user = mysqli_fetch_assoc($result);
        $_SESSION['user_id'] = $user['id_usuario'];
        $_SESSION['username'] = $user['cuenta_usuario'];
        $_SESSION['role'] = $user['id_rol'];

    
        header('Location: home.php');
        exit();
    } else {
    
        header('Location: login.php?error=' . urlencode('El usuario o contraseña son incorrectos. Intente de nuevo'));
        exit();
    }
} else {

    header('Location: login.php');
    exit();
}
?>