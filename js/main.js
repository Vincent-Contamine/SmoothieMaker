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
    var location = window.location.pathname;
    $.ajax({
        url: 'removefavorite.php',
        type : "POST",
        data: {idRecette: idRecette},
        dataType: 'json', 
        success: function(data){
            if (data.result == true) 
            {
                if(location == '/SmoothieMaker/onerecette.php'){
                $('.intro').html('<a href="#" class="fav milieu" id='+idRecette+' data-favoris="no" ><img src="icons/emptyheart.png" > AJOUTER CETTE RECETTE EN FAVORIS</a>')
                }
                else if(location == '/SmoothieMaker/listerecettes.php'){
                $('#'+idRecette).html('<img src="icons/emptyheart.png" alt="coeur vide" class="emptyheart"></a>')  
                }
                else if(location == '/SmoothieMaker/espaceperso.php'){
                    window.location.href = location;
                }
            }
            else
            {
                $('<div class="alert alert-danger" role="alert">Une erreur est survenue</div>').insertAfter(".intro");
            }
        }
    });
}

function addfav(e){
    e.preventDefault();
    $('.alert').hide();
    var idRecette = e.currentTarget.id;
    var image = e.target.alt;
    if(image == 'coeur vide'){

    var location = window.location;
    $.ajax({
        url: 'addfavorite.php',
        type : "POST",
        data: {idRecette: idRecette},
        dataType: 'json', 
        success: function(data){
            if (data.result == true) 
            {
                $('#'+idRecette).html('<img src="icons/fullheart.png" alt="coeur plein" class="fullheart"></a>');
            }
            else
            {
                window.location.href = "connexion.php?red=recette";
            }
        }
    });
    }
    else if(image == 'coeur plein')
    {
        unfav(e);
    }
}
function addfavorite(e){
e.preventDefault();
var idRecette = e.target.id;
var isInFav = e.currentTarget.dataset.favoris;
var location = window.location;

if(isInFav == 'no'){
$.ajax({
    url: 'addfavorite.php',
    type : "POST",
    data: {idRecette: idRecette},
    dataType: 'json', 
    success: function(data){
        if (data.result == true) 
        {
            $('.intro').html('<a href="#" class="fav milieu" id='+idRecette+' data-favoris="yes"  ><img src="icons/emptyheart.png" > RETIRER LA RECETTE DES FAVORIS</a>');
        }
        else
        {
            window.location.href = "connexion.php?red=recette";
        }
    }
});
}else if(isInFav == 'yes')
{
    unfav(e);
}
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
    if (window.location.href.match('listerecettes.php') != null || window.location.href.match('onerecette.php') != null)
    {
        $('body').on('click', '.fav', addfav);
    }
    if (window.location.href.match('listerecettes.php') != null)
    {
        $('body').on('click', '.recette', afficherDetails);
    }
    if (window.location.href.match('onerecette.php?') != null)
    {
        var back = $('.imgjs')[0];
        back.setAttribute('style', 'background-image:url("'+$('.imgjs input')[0].value+'"); height:400px; background-position: center; background-repeat: no-repeat');
        $('body').on('click', '.fav', addfavorite);
    }
    
});

