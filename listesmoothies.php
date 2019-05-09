<?php 
include 'bdd_connection.php';
$template="listesmoothies";

    $requete = $pdo->prepare("SELECT `Id`, `Name`, `Photo`, `Mois` FROM `Recette` WHERE mois = '01' OR mois = '02' OR mois = '03'");
    $requete->execute();
    $smoothies = $requete->fetchAll();

include 'layout.phtml';