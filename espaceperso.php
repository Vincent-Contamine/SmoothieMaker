<?php
include 'bdd_connection.php';
$template="espaceperso";
$userSession = new UserSession();
if ($userSession->isAuthenticated() == true) // on vérifie que l'utilisateur est connecté
{
    $iduser = $userSession->getId(); //on recupère l'id de l'utilisateur
    $requete = $pdo->prepare("
    SELECT
    f.`Id_Recette`,
    r.Name,
    r.Photo,
    COUNT(rl.Id_Recette) AS nbIngredient
    FROM
    `Favoris` f
    INNER JOIN
    Recette r ON r.Id = f.Id_Recette
    INNER JOIN
    RecetteLine rl ON r.Id = rl.Id_Recette
    WHERE
    Id_User = ? 
    GROUP BY
    rl.Id_Recette
        "); // on récupère les recettes favorites de l'utilisateur
    $requete->execute([$iduser]);
    $fav = $requete->fetchAll();
}


include 'layout.phtml';

