'use strict';
function verify(e){
    $('.alert').hide();
    if ($('#email').val().length == 0 || $('#password').val().length == 0)
    {
        e.preventDefault();
        $('<div class="alert alert-danger" role="alert">Veuillez remplir tous les champs</div>').insertAfter("h1");
    }
    var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if(reg.test(String($('#email').val()).toLowerCase()) == false){
        e.preventDefault();
        $('<div class="alert alert-danger" role="alert">Veuillez saisir un email valide</div>').insertAfter("h1");
    }
}

function verifyI(e){
    $('.alert').hide();
    if ($('#email').val().length == 0 || $('#password').val().length == 0 || $('#cpassword').val().length == 0 || $('#LastName').val().length == 0 || $('#FirstName').val().length == 0)
    {
        e.preventDefault();
        $('<div class="alert alert-danger" role="alert">Veuillez remplir tous les champs</div>').insertAfter("h1");
    }
    var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if(reg.test(String($('#email').val()).toLowerCase()) == false){
        e.preventDefault();
        $('<div class="alert alert-danger" role="alert">Veuillez saisir un email valide</div>').insertAfter("h1");
    }
    if ($('#password').val() != $('#cpassword').val())
    {
        e.preventDefault();
        $('<div class="alert alert-danger" role="alert">Les mots de passe ne correspondent pas</div>').insertAfter("h1");
    }
}
function unfav(e){
    e.preventDefault();
    $('.alert').hide();
    var idRecette = e.currentTarget.id;
    $.ajax({
        url: 'removefavorite.php',
        type : "POST",
        data: {idRecette: idRecette},
        dataType: 'json', 
        success: function(data){
            if (data.result == true) 
            {
                window.location.href = "espaceperso.php";
            }
            else
            {
                $('<div class="alert alert-danger" role="alert">Une erreur est survenue</div>').insertAfter("h1");
            }
        }
    });
}
function afficherDetails(e){
    e.preventDefault();
    var idRecette = e.currentTarget.id;
    window.location.href = "onerecette.php?id="+idRecette;
}

$(document).ready(function(){
    if (window.location.href.match('connexion.php') != null)
    {
        $('#connect').submit(verify);
    }
    if (window.location.href.match('inscription.php') != null)
    {
        $('#connect').submit(verifyI);
    }
    if (window.location.href.match('espaceperso.php') != null)
    {
        $('body').on('click', '.fav', unfav);
    }
    if (window.location.href.match('listerecettes.php') != null)
    {
        $('body').on('click', '.recette', afficherDetails);
    }

});

