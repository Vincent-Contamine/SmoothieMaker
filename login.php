<?php 
include "bdd_connection.php";

function hashPassword($password){
    /*
     * Génération du sel, nécessite l'extension PHP OpenSSL pour fonctionner.
     *
     * openssl_random_pseudo_bytes() va renvoyer n'importe quel type de caractères.
     * Or le chiffrement en blowfish nécessite un sel avec uniquement les caractères
     * a-z, A-Z ou 0-9.
     *
     * On utilise donc bin2hex() pour convertir en une chaîne hexadécimale le résultat,
     * qu'on tronque ensuite à 22 caractères pour être sûr d'obtenir la taille
     * nécessaire pour construire le sel du chiffrement en blowfish.
     */
    $salt = '$2y$11$' .substr(bin2hex(openssl_random_pseudo_bytes(32)), 0, 22); 
    // Voir la documentation de crypt() : http://devdocs.io/php/function.crypt
    return crypt($password, $salt);
}
function verifyPassword($password, $hashPassword){
    return crypt($password, $hashPassword) == $hashPassword;
}// permet de verifier si le mdp entrer correspond à celui de la bdd

if (array_key_exists("email",$_POST) && array_key_exists("password",$_POST))//on vérifie que l'email et le mdp sont bien envoyer avec le form
{
    //on cherche dans la bdd si un email correspond
    $requete = $pdo->prepare("
    SELECT
    *
    FROM
    `User`
    WHERE
    `Email` = ?  
        ");
    $requete->execute([$_POST['email']]);
    $user = $requete->fetch();
    if (empty($user)) //la variable du retour de sql est vide, donc le compte n'existe pas
    {
        if (array_key_exists('cpassword', $_POST)) //on vérifie si cpassword existe, si c'est le cas, c'est qu'on essaye de creer un compte
        {  
            $password = $_POST['password'];
            $hashPassword = hashPassword($password);
            $requete = $pdo->prepare("
            INSERT
            INTO
            `User`(`Email`,
            `Password`,FirstName, LastName)
            VALUES(?,?,?,?)
                ");//créer un nouveau compte
            $requete->execute([$_POST['email'],$hashPassword,$_POST['FirstName'],$_POST['LastName']]);
            $lastId = $pdo->lastInsertId();
            $requete = $pdo->prepare("
            SELECT
            `Id`,
            `Email`,
            `FirstName`,
            `LastName`
            FROM
            `User`
            WHERE
            `Id` = ?
                ");// on récupère les infos du nouveau compte avec le dernier Id insérer pour créer une nouvelle session
            $requete->execute([$lastId]);
            $user = $requete->fetch();
            $userSession = new UserSession();
            $userSession->create(
                $user['Id'],$user['FirstName'],$user['LastName'],$user['Email']
            ); // on crée la session et on redirige vers l'accueil
            header('Location: index.php');
		    exit();  

        }
    }
    else // si le compte existe, on vérifie le mdp
    {
        $password = $_POST['password'];
        $hashPassword = $user['Password'];        
        if (verifyPassword($password, $hashPassword) == true)
        {
            
            $userSession = new UserSession();
            $userSession->create(
                $user['Id'],$user['FirstName'],$user['LastName'],$user['Email']
            ); 
            header('Location: index.php'); // si le mdp correspond, on créer une nouvelle session et on redirige vers l'accueil
		    exit();  
        }
        else // retourne une erreur si le mdp ne correspond pas
        {
            $erreur = "L'e-mail et le mot de passe ne coresspondent pas";
            header('Location: connexion.php?err='.$erreur); // si le mdp correspond, on créer une nouvelle session et on redirige vers l'accueil
		    exit();
        }         
    }
    
    
}
