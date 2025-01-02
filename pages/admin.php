<?php
$host = '127.0.0.1';
$db_name = 'driveloc';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Données de l'administrateur
    $username = 'Fatima-Ezzahra';
    $email = 'admin@gmail.com';
    $hashed_password = password_hash('adminfatimaezzahra', PASSWORD_DEFAULT); // Mot de passe hashé
    $id_role = 1;

    // Requête SQL
    $sql = "INSERT INTO usersite (username, email, password, id_role) 
            VALUES (:username, :email, :password, :id_role)";

    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':username' => $username,
        ':email' => $email,
        ':password' => $hashed_password,
        ':id_role' => $id_role
    ]);

    echo "Administrateur ajouté avec succès !";
} catch (PDOException $e) {
    echo "Erreur : " . $e->getMessage();
}
?>