<?php
include "bdd_connection.php";


$requete = $pdo->prepare("
SELECT
  `Name`,
  `Photo`,
  `Mois`
FROM
  `Recette`
WHERE
  `Mois`= '02'
  OR
  `Mois`='04'
  OR
  `Mois`='06'");

  $requete->execute();
  $recette=$requete->fetchAll();
  
include "index.phtml";

