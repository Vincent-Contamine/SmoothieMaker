<?php 
include 'bdd_connection.php';
$template="listerecettes";

$userSession = new UserSession();  

$requete = $pdo->prepare("
SELECT `Id`, `Name`, `Photo`, 
COUNT(rl.Id_Recette) AS nbIngredient
FROM `Recette` r
INNER JOIN RecetteLine rl ON r.Id = rl.Id_Recette
WHERE Confidentielle = 'false'
GROUP BY rl.Id_Recette ");
$requete->execute();
$smoothies = $requete->fetchAll();


if($userSession->isAuthenticated() == true)
{
    $iduser = $userSession->getId();
    $requete = $pdo->prepare("
    SELECT
    f.`Id_Recette`
    FROM
    `Favoris` f
    WHERE
    Id_User = ? 
        "); 
    $requete->execute([$iduser]);
    $favoris = $requete->fetchAll();

    for($i = 0; $i < count($smoothies); $i++){
        foreach($favoris as $fav){
            if ($fav['Id_Recette'] == $smoothies[$i]['Id']){
                $smoothies[$i]['fav'] = 'true';
                break;
            }
            else{
                $smoothies[$i]['fav'] = 'false';
            }
        }
    }
}
var_dump($smoothies);





include 'layout.phtml';