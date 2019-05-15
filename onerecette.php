<?php
include 'bdd_connection.php';
$id=$_GET['id'];
$isFav = null;

$requete = $pdo->prepare("
    SELECT
    `Id`,
    `Name`,
    `Photo`
    FROM
    `Recette`
    WHERE
    id = ?");
  $requete->execute([$id]);
  $recette=$requete->fetch();

  $requete = $pdo->prepare("
  SELECT
  `Id_Ingredient`,
  `Quantite`
   FROM
  `RecetteLine`
   WHERE
   `Id_Recette` = ?");

  $requete->execute([$id]);
  $recetteLine=$requete->fetchAll();


  $listeingredient =[];
  for($i=0; $i<count($recetteLine);$i++)
  {
      $requete = $pdo->prepare("
  SELECT
  `Name`
   FROM
  `Ingredient`
   WHERE
  `Id` = ?
  ");
  $requete->execute([$recetteLine[$i]['Id_Ingredient']]);
  $ingredient=$requete->fetch();
  $listeingredient[$recetteLine[$i]['Id_Ingredient']] = $ingredient;
  }

  $userSession = new UserSession();
  
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
    foreach($favoris as $fav){
        if ($id == $fav['Id_Recette']){
            $isFav = 'true';
            break;
            
        }
        else
        {
            $isFav ='false';
        } 
    }
}
else {
    $isFav ='false';
}

$template="onerecette";

include 'layout.phtml';