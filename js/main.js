'use strict';
function verify(e){
    $('.alert').hide();
    if ($('#email').val().length == 0 || $('#password').val().length == 0)
    {
        e.preventDefault();
        $('.alert').show();
        $('<div class="alert alert-danger" role="alert">Veuillez remplir tous les champs</div>').insertAfter("h1");
    }
}


$(document).ready(function(){
    if (window.location.href.match('connexion.php') != null)
    {
        $('#connect').submit(verify);
    }
});