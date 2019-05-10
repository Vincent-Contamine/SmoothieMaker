<?php
include 'bdd_connection.php';
if (empty($_POST) == false)
{
    $userSession = new UserSession();
    if ($userSession->isAuthenticated() == true) // on vérifie que l'utilisateur est connecté
    {
        $iduser = $userSession->getId(); //on recupère l'id de l'utilisateur
        $requete = $pdo->prepare("INSERT INTO `Favoris`(`Id_User`, `Id_Recette`) VALUES (? , ?)"); // on récupère les recettes favorites de l'utilisateur
        $requete->execute([$iduser,$_POST['idRecette']]);

        $data = ["result"=> true];
    }
    else
    {
        $data = ["result"=> 'user not connected'];
    }
}
else 
{
    $data = ["result"=> false];
}
echo json_encode($data);